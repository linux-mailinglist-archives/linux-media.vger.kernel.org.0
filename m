Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 144EE205288
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 14:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732502AbgFWMdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 08:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729574AbgFWMdR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 08:33:17 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB89C061573
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2020 05:33:17 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id DC2DD2601D1
Message-ID: <2487d05403076953eb23a25f2f2907152a8b919a.camel@collabora.com>
Subject: Re: [PATCH] v4l2-core: Print control name in
 VIDIOC_S/G_(EXT)_CTRL(S)
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     kernel@collabora.com
Date:   Tue, 23 Jun 2020 09:32:47 -0300
In-Reply-To: <d5939943-cfa2-8d39-a245-9a9ec146440d@xs4all.nl>
References: <20200609121514.9414-1-ezequiel@collabora.com>
         <d5939943-cfa2-8d39-a245-9a9ec146440d@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-06-23 at 13:01 +0200, Hans Verkuil wrote:
> On 09/06/2020 14:15, Ezequiel Garcia wrote:
> > While debugging, it's currently really hard to identify controls
> > by their ID. Print the control name making the print more helpful.
> > 
> > With this change, the print changes from:
> > 
> > video1: VIDIOC_S_EXT_CTRLS: which=0xf010000, count=5, error_idx=4, request_fd=45, id/size=0x990ce8/1048, id/size=0x990ce9/12,
> > id/size=0x990cea/480, id/size=0x990ceb/896, id/size=0x990cec/400
> > 
> > to:
> > 
> > video1: VIDIOC_S_EXT_CTRLS: which=0xf010000, count=5, error_idx=4, request_fd=42, name=H264 Sequence Parameter Set, id/size=0x990ce8/1048,
> > name=H264 Picture Parameter Set, id/size=0x990ce9/12, name=H264 Scaling Matrix, id/size=0x990cea/480, name=H264 Slice Parameters,
> > id/size=0x990ceb/896, name=H264 Decode Parameters, id/size=0x990cec/400
> > 
> > For instance, this is specially helpful when the ioctl fails. Consider
> > the following example:
> > 
> > v4l2-ctrls: prepare_ext_ctrls: video1: pointer control id 0x990cec size too small, 400 bytes but 784 bytes needed
> > v4l2-ctrls: try_set_ext_ctrls: video1: video1: try_set_ext_ctrls_common failed (-14)
> > video1: VIDIOC_S_EXT_CTRLS: error -14: which=0xf010000, count=5, error_idx=5, request_fd=39, name=H264 Sequence Parameter Set,
> > id/size=0x990ce8/1048, name=H264 Picture Parameter Set, id/size=0x990ce9/12, name=H264 Scaling Matrix, id/size=0x990cea/480, name=H264 Slice
> > Parameters, id/size=0x990ceb/896, name=H264 Decode Parameters, id/size=0x990cec/400
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 2322f08a98be..4264ac44c48b 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -582,8 +582,10 @@ static void v4l_print_querymenu(const void *arg, bool write_only)
> >  static void v4l_print_control(const void *arg, bool write_only)
> >  {
> >  	const struct v4l2_control *p = arg;
> > +	const char *name = v4l2_ctrl_get_name(p->id);
> >  
> > -	pr_cont("id=0x%x, value=%d\n", p->id, p->value);
> > +	pr_cont("name=%s, id=0x%x, value=%d\n",
> > +		name ? name : "unknown", p->id, p->value);
> 
> I prefer:
> 
> 	if (name)
> 		pr_cont("name=%s, ", name);
> 	pr_cont("id=0x%x, value=%d\n", p->id, p->value);
> 

I don't have issues posting a v2 with that if you prefer.

However, seems to me seeing "unknown" if the name wasn't found
is actually a good debugging hint, signalling the control ID
is probably wrong.

Thanks for reviewing,
Ezequiel

