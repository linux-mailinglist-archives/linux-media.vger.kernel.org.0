Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B66821C45D
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 10:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbfENIHz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 14 May 2019 04:07:55 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:62634 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725899AbfENIHy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 04:07:54 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 16548174-1500050 
        for multiple; Tue, 14 May 2019 09:06:14 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
To:     Michael Yang <michael.yang@imgtec.com>
From:   Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190514075537.GA7483@michael-imgtec>
Cc:     sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, gustavo@padovan.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        gregkh@linuxfoundation.org
References: <1554710495-6646-1-git-send-email-michael.yang@imgtec.com>
 <1557376451-20164-1-git-send-email-michael.yang@imgtec.com>
 <155740236592.28545.17880521046408313036@skylake-alporthouse-com>
 <20190514075537.GA7483@michael-imgtec>
Message-ID: <155782117405.2525.2694876407407711784@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [EXTERNAL] Re: [PATCH] sync_file: Return reasonable timestamp when
 merging signaled fences
Date:   Tue, 14 May 2019 09:06:14 +0100
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Michael Yang (2019-05-14 08:55:37)
> On Thu, May 09, 2019 at 12:46:05PM +0100, Chris Wilson wrote:
> > Quoting Michael Yang (2019-05-09 05:34:11)
> > > If all the sync points were signaled in both fences a and b,
> > > there was only one sync point in merged fence which is a_fence[0].
> > > The Fence structure in android framework might be confused about
> > > timestamp if there were any sync points which were signaled after
> > > a_fence[0]. It might be more reasonable to use timestamp of last signaled
> > > sync point to represent the merged fence.
> > > The issue can be found from EGL extension ANDROID_get_frame_timestamps.
> > > Sometimes the return value of EGL_READS_DONE_TIME_ANDROID is head of
> > > the return value of EGL_RENDERING_COMPLETE_TIME_ANDROID.
> > > That means display/composition had been completed before rendering
> > > was completed that is incorrect.
> > > 
> > > Some discussion can be found at:
> > > https://urldefense.proofpoint.com/v2/url?u=https-3A__android-2Dreview.googlesource.com_c_kernel_common_-2B_907009&d=DwIFaQ&c=bq9ppmgvSw3oQFfR871D_w&r=Ngg6vhouPkgwSIbDMU7rDN0ZfT2Qax50xuWkXXqQ3zw&m=N9R9dXGJ3zk0e0gXNM4tsiro7xCOLlWx6c3HAEseSSw&s=6sY2t9i2wvylWH-rPUlvY1MIuWKjCPzT8SeCgpZOIGk&e= 
> > > 
> > > Signed-off-by: Michael Yang <michael.yang@imgtec.com>
> > > ---
> > > Hi,
> > > I didn't get response since I previously sent this a month ago.
> > > Could someone have a chance to look at it please?
> > > Thanks.
> > >  drivers/dma-buf/sync_file.c | 25 +++++++++++++++++++++++--
> > >  1 file changed, 23 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> > > index 4f6305c..d46bfe1 100644
> > > --- a/drivers/dma-buf/sync_file.c
> > > +++ b/drivers/dma-buf/sync_file.c
> > > @@ -274,8 +274,29 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
> > >         for (; i_b < b_num_fences; i_b++)
> > >                 add_fence(fences, &i, b_fences[i_b]);
> > >  
> > > -       if (i == 0)
> > > -               fences[i++] = dma_fence_get(a_fences[0]);
> > > +       /* If all the sync pts were signaled, then adding the sync_pt who
> > > +        * was the last signaled to the fence.
> > > +        */
> > > +       if (i == 0) {
> > > +               struct dma_fence *last_signaled_sync_pt = a_fences[0];
> > > +               int iter;
> > > +
> > > +               for (iter = 1; iter < a_num_fences; iter++) {
> > 
> > If there is more than one fence, sync_file->fence is a fence_array and
> > its timestamp is what you want. If there is one fence, sync_file->fence
> > is a pointer to that fence, and naturally has the right timestamp.
> > 
> > In short, this should be handled by dma_fence_array_create() when given
> > a complete set of signaled fences, it too should inherit the signaled
> > status with the timestamp being taken from the last fence. It should
> > also be careful to inherit the error status.
> > -Chris
> Thanks Chris for the inputs. For this case, there will be only one fence
> in sync_file->fence after doing sync_file_merge(). Regarding to the current
> implementation, dma_fence_array_create() is not called as num_fences is equal
> to 1. I was wondering do you suggest that we pass a complete set of signaled
> fences to sync_file_set_fence() and handle it in dma_fence_array_create().
> Thanks.

No, in the case there is only one fence, we just inherit its timestamp
along with its fence status. (A single fence is the degenerate case of
a fence array.)
-Chris
