Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A73768C932
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 23:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjBFWOv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 17:14:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjBFWOu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 17:14:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 088C5126DD;
        Mon,  6 Feb 2023 14:14:48 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [109.136.43.56])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7D64891;
        Mon,  6 Feb 2023 23:14:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675721687;
        bh=l5GwtbF6DHIm5hzH5Gb0eF9soGImnnWwSQxp+PeT7YQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TXAFa73mGyEgj9WsTSLoCzjZxz4HBHwI9aLzARRkOYxqbuB2lkP8PhGdwrLdihL13
         r07rKfBcF1Xat/Jzt7Wdb4EAtqCYXec6w2oC3JoPqCaiEBeKe7XUO0EL3MkPaV3yi0
         bZYwsjGZvHemtN/Eeenr3UW7HFiq90koLbB8ObEw=
Date:   Tue, 7 Feb 2023 00:14:45 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Duy Nguyen <duy.nguyen.rh@renesas.com>
Subject: Re: [PATCH] media: vsp1: Replace vb2_is_streaming() with
 vb2_start_streaming_called()
Message-ID: <Y+F71c/VbtahnL/B@pendragon.ideasonboard.com>
References: <20230120204359.25114-1-laurent.pinchart+renesas@ideasonboard.com>
 <TYBPR01MB534144F3EBA44C1687095D03D8D09@TYBPR01MB5341.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYBPR01MB534144F3EBA44C1687095D03D8D09@TYBPR01MB5341.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Shimoda-san,

On Tue, Jan 31, 2023 at 06:38:56AM +0000, Yoshihiro Shimoda wrote:
> Hi Laurent-san,
> 
> > From: Laurent Pinchart, Sent: Saturday, January 21, 2023 5:44 AM
> > 
> > The vsp1 driver uses the vb2_is_streaming() function in its .buf_queue()
> > handler to check if the .start_streaming() operation has been called,
> > and decide whether to just add the buffer to an internal queue, or also
> > trigger a hardware run. vb2_is_streaming() relies on the vb2_queue
> > structure's streaming field, which used to be set only after calling the
> > .start_streaming() operation.
> > 
> > Commit a10b21532574 ("media: vb2: add (un)prepare_streaming queue ops")
> > changed this, setting the .streaming field in vb2_core_streamon() before
> > enqueuing buffers to the driver and calling .start_streaming(). This
> > broke the vsp1 driver which now believes that .start_streaming() has
> > been called when it hasn't, leading to a crash:
> > 
> > [  881.058705] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
> > [  881.067495] Mem abort info:
> > [  881.070290]   ESR = 0x0000000096000006
> > [  881.074042]   EC = 0x25: DABT (current EL), IL = 32 bits
> > [  881.079358]   SET = 0, FnV = 0
> > [  881.082414]   EA = 0, S1PTW = 0
> > [  881.085558]   FSC = 0x06: level 2 translation fault
> > [  881.090439] Data abort info:
> > [  881.093320]   ISV = 0, ISS = 0x00000006
> > [  881.097157]   CM = 0, WnR = 0
> > [  881.100126] user pgtable: 4k pages, 48-bit VAs, pgdp=000000004fa51000
> > [  881.106573] [0000000000000020] pgd=080000004f36e003, p4d=080000004f36e003, pud=080000004f7ec003,
> > pmd=0000000000000000
> > [  881.117217] Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
> > [  881.123494] Modules linked in: rcar_fdp1 v4l2_mem2mem
> > [  881.128572] CPU: 0 PID: 1271 Comm: yavta Tainted: G    B              6.2.0-rc1-00023-g6c94e2e99343 #556
> > [  881.138061] Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
> > [  881.145981] pstate: 400000c5 (nZcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [  881.152951] pc : vsp1_dl_list_add_body+0xa8/0xe0
> > [  881.157580] lr : vsp1_dl_list_add_body+0x34/0xe0
> > [  881.162206] sp : ffff80000c267710
> > [  881.165522] x29: ffff80000c267710 x28: ffff000010938ae8 x27: ffff000013a8dd98
> > [  881.172683] x26: ffff000010938098 x25: ffff000013a8dc00 x24: ffff000010ed6ba8
> > [  881.179841] x23: ffff00000faa4000 x22: 0000000000000000 x21: 0000000000000020
> > [  881.186998] x20: ffff00000faa4000 x19: 0000000000000000 x18: 0000000000000000
> > [  881.194154] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> > [  881.201309] x14: 0000000000000000 x13: 746e696174206c65 x12: ffff70000157043d
> > [  881.208465] x11: 1ffff0000157043c x10: ffff70000157043c x9 : dfff800000000000
> > [  881.215622] x8 : ffff80000ab821e7 x7 : 00008ffffea8fbc4 x6 : 0000000000000001
> > [  881.222779] x5 : ffff80000ab821e0 x4 : ffff70000157043d x3 : 0000000000000020
> > [  881.229936] x2 : 0000000000000020 x1 : ffff00000e4f6400 x0 : 0000000000000000
> > [  881.237092] Call trace:
> > [  881.239542]  vsp1_dl_list_add_body+0xa8/0xe0
> > [  881.243822]  vsp1_video_pipeline_run+0x270/0x2a0
> > [  881.248449]  vsp1_video_buffer_queue+0x1c0/0x1d0
> > [  881.253076]  __enqueue_in_driver+0xbc/0x260
> > [  881.257269]  vb2_start_streaming+0x48/0x200
> > [  881.261461]  vb2_core_streamon+0x13c/0x280
> > [  881.265565]  vb2_streamon+0x3c/0x90
> > [  881.269064]  vsp1_video_streamon+0x2fc/0x3e0
> > [  881.273344]  v4l_streamon+0x50/0x70
> > [  881.276844]  __video_do_ioctl+0x2bc/0x5d0
> > [  881.280861]  video_usercopy+0x2a8/0xc80
> > [  881.284704]  video_ioctl2+0x20/0x40
> > [  881.288201]  v4l2_ioctl+0xa4/0xc0
> > [  881.291525]  __arm64_sys_ioctl+0xe8/0x110
> > [  881.295543]  invoke_syscall+0x68/0x190
> > [  881.299303]  el0_svc_common.constprop.0+0x88/0x170
> > [  881.304105]  do_el0_svc+0x4c/0xf0
> > [  881.307430]  el0_svc+0x4c/0xa0
> > [  881.310494]  el0t_64_sync_handler+0xbc/0x140
> > [  881.314773]  el0t_64_sync+0x190/0x194
> > [  881.318450] Code: d50323bf d65f03c0 91008263 f9800071 (885f7c60)
> > [  881.324551] ---[ end trace 0000000000000000 ]---
> > [  881.329173] note: yavta[1271] exited with preempt_count 1
> > 
> > A different regression report sent to the linux-media mailing list ([1])
> > was answered with a claim that the vb2_is_streaming() function has never
> > been meant for this purpose. The document of the function, as well as of
> > the struct vb2_queue streaming field, is sparse, so this claim may be
> > hard to verify.
> > 
> > The information needed by the vsp1 driver to decide how to process
> > queued buffers is also available from the vb2_start_streaming_called()
> > function. Use it instead of vb2_is_streaming() to fix the problem.
> > 
> > [1]
> <snip the URL>
> > 
> > Fixes: a10b21532574 ("media: vb2: add (un)prepare_streaming queue ops")
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> My team member tested this patch and confirmed that this patch fixed the issue.
> So,
> 
> Tested-by: Duy Nguyen <duy.nguyen.rh@renesas.com>

Thank you.

A different fix has been merged in the media tree for v6.2:

commit a1550700629f30c5bd554161524f14f14600d554
Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date:   Wed Dec 28 18:02:27 2022 +0100

    media: v4l2-ctrls-api.c: move ctrl->is_new = 1 to the correct line

    The patch that fixed string control support somehow got mangled when it was
    merged in mainline: the added line ended up in the wrong place.

    Fix this.

    Fixes: 73278d483378 ("media: v4l2-ctrls-api.c: add back dropped ctrl->is_new = 1")
    Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
    Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

This patch still makes sense, but it's not needed as a fix anymore, so
I'll submit it for v6.4 instead.

> > ---
> > Hans, I think many drivers may be affected by a10b21532574, and it would
> > be difficult to test them all in time for the v6.2 release. Maybe the
> > original behaviour of vb2_is_streaming() could be restored (I haven't
> > checked), or maybe the commit should be reverted to give more time to
> > fix the issue correctly.
> > 
> > In the meantime, this patch should be merged as a v6.2 fix, as I think
> > it goes in the right direction in any case.
> > ---
> >  drivers/media/platform/renesas/vsp1/vsp1_video.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > index 544012fd1fe9..3664c87e4afb 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > @@ -776,7 +776,7 @@ static void vsp1_video_buffer_queue(struct vb2_buffer *vb)
> >  	video->rwpf->mem = buf->mem;
> >  	pipe->buffers_ready |= 1 << video->pipe_index;
> > 
> > -	if (vb2_is_streaming(&video->queue) &&
> > +	if (vb2_start_streaming_called(&video->queue) &&
> >  	    vsp1_pipeline_ready(pipe))
> >  		vsp1_video_pipeline_run(pipe);
> > 
> > 
> > base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2

-- 
Regards,

Laurent Pinchart
