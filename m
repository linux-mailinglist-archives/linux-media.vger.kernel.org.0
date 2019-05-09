Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7870B18935
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2019 13:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbfEILqR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 9 May 2019 07:46:17 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:53494 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725961AbfEILqR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 May 2019 07:46:17 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 16501956-1500050 
        for multiple; Thu, 09 May 2019 12:46:08 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
To:     Michael Yang <michael.yang@imgtec.com>, sumit.semwal@linaro.org
From:   Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <1557376451-20164-1-git-send-email-michael.yang@imgtec.com>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        gustavo@padovan.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, michael.yang@imgtec.com,
        gregkh@linuxfoundation.org
References: <1554710495-6646-1-git-send-email-michael.yang@imgtec.com>
 <1557376451-20164-1-git-send-email-michael.yang@imgtec.com>
Message-ID: <155740236592.28545.17880521046408313036@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] sync_file: Return reasonable timestamp when merging signaled
 fences
Date:   Thu, 09 May 2019 12:46:05 +0100
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Michael Yang (2019-05-09 05:34:11)
> If all the sync points were signaled in both fences a and b,
> there was only one sync point in merged fence which is a_fence[0].
> The Fence structure in android framework might be confused about
> timestamp if there were any sync points which were signaled after
> a_fence[0]. It might be more reasonable to use timestamp of last signaled
> sync point to represent the merged fence.
> The issue can be found from EGL extension ANDROID_get_frame_timestamps.
> Sometimes the return value of EGL_READS_DONE_TIME_ANDROID is head of
> the return value of EGL_RENDERING_COMPLETE_TIME_ANDROID.
> That means display/composition had been completed before rendering
> was completed that is incorrect.
> 
> Some discussion can be found at:
> https://android-review.googlesource.com/c/kernel/common/+/907009
> 
> Signed-off-by: Michael Yang <michael.yang@imgtec.com>
> ---
> Hi,
> I didn't get response since I previously sent this a month ago.
> Could someone have a chance to look at it please?
> Thanks.
>  drivers/dma-buf/sync_file.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index 4f6305c..d46bfe1 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -274,8 +274,29 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
>         for (; i_b < b_num_fences; i_b++)
>                 add_fence(fences, &i, b_fences[i_b]);
>  
> -       if (i == 0)
> -               fences[i++] = dma_fence_get(a_fences[0]);
> +       /* If all the sync pts were signaled, then adding the sync_pt who
> +        * was the last signaled to the fence.
> +        */
> +       if (i == 0) {
> +               struct dma_fence *last_signaled_sync_pt = a_fences[0];
> +               int iter;
> +
> +               for (iter = 1; iter < a_num_fences; iter++) {

If there is more than one fence, sync_file->fence is a fence_array and
its timestamp is what you want. If there is one fence, sync_file->fence
is a pointer to that fence, and naturally has the right timestamp.

In short, this should be handled by dma_fence_array_create() when given
a complete set of signaled fences, it too should inherit the signaled
status with the timestamp being taken from the last fence. It should
also be careful to inherit the error status.
-Chris
