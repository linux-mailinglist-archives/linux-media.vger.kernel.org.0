Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60CF76776B1
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 09:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbjAWItH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 03:49:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjAWItG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 03:49:06 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CD5CC02;
        Mon, 23 Jan 2023 00:49:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BAF11B80B9F;
        Mon, 23 Jan 2023 08:49:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86ADBC433EF;
        Mon, 23 Jan 2023 08:49:01 +0000 (UTC)
Message-ID: <83a13170-be2f-9528-2cd3-fd74fd637995@xs4all.nl>
Date:   Mon, 23 Jan 2023 09:49:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] media: vsp1: Replace vb2_is_streaming() with
 vb2_start_streaming_called()
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
References: <20230120204359.25114-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230120204359.25114-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 20/01/2023 21:43, Laurent Pinchart wrote:
> The vsp1 driver uses the vb2_is_streaming() function in its .buf_queue()
> handler to check if the .start_streaming() operation has been called,
> and decide whether to just add the buffer to an internal queue, or also
> trigger a hardware run. vb2_is_streaming() relies on the vb2_queue
> structure's streaming field, which used to be set only after calling the
> .start_streaming() operation.
> 
> Commit a10b21532574 ("media: vb2: add (un)prepare_streaming queue ops")
> changed this, setting the .streaming field in vb2_core_streamon() before
> enqueuing buffers to the driver and calling .start_streaming(). This
> broke the vsp1 driver which now believes that .start_streaming() has
> been called when it hasn't, leading to a crash:
> 
> [  881.058705] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
> [  881.067495] Mem abort info:
> [  881.070290]   ESR = 0x0000000096000006
> [  881.074042]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  881.079358]   SET = 0, FnV = 0
> [  881.082414]   EA = 0, S1PTW = 0
> [  881.085558]   FSC = 0x06: level 2 translation fault
> [  881.090439] Data abort info:
> [  881.093320]   ISV = 0, ISS = 0x00000006
> [  881.097157]   CM = 0, WnR = 0
> [  881.100126] user pgtable: 4k pages, 48-bit VAs, pgdp=000000004fa51000
> [  881.106573] [0000000000000020] pgd=080000004f36e003, p4d=080000004f36e003, pud=080000004f7ec003, pmd=0000000000000000
> [  881.117217] Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
> [  881.123494] Modules linked in: rcar_fdp1 v4l2_mem2mem
> [  881.128572] CPU: 0 PID: 1271 Comm: yavta Tainted: G    B              6.2.0-rc1-00023-g6c94e2e99343 #556
> [  881.138061] Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
> [  881.145981] pstate: 400000c5 (nZcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  881.152951] pc : vsp1_dl_list_add_body+0xa8/0xe0
> [  881.157580] lr : vsp1_dl_list_add_body+0x34/0xe0
> [  881.162206] sp : ffff80000c267710
> [  881.165522] x29: ffff80000c267710 x28: ffff000010938ae8 x27: ffff000013a8dd98
> [  881.172683] x26: ffff000010938098 x25: ffff000013a8dc00 x24: ffff000010ed6ba8
> [  881.179841] x23: ffff00000faa4000 x22: 0000000000000000 x21: 0000000000000020
> [  881.186998] x20: ffff00000faa4000 x19: 0000000000000000 x18: 0000000000000000
> [  881.194154] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> [  881.201309] x14: 0000000000000000 x13: 746e696174206c65 x12: ffff70000157043d
> [  881.208465] x11: 1ffff0000157043c x10: ffff70000157043c x9 : dfff800000000000
> [  881.215622] x8 : ffff80000ab821e7 x7 : 00008ffffea8fbc4 x6 : 0000000000000001
> [  881.222779] x5 : ffff80000ab821e0 x4 : ffff70000157043d x3 : 0000000000000020
> [  881.229936] x2 : 0000000000000020 x1 : ffff00000e4f6400 x0 : 0000000000000000
> [  881.237092] Call trace:
> [  881.239542]  vsp1_dl_list_add_body+0xa8/0xe0
> [  881.243822]  vsp1_video_pipeline_run+0x270/0x2a0
> [  881.248449]  vsp1_video_buffer_queue+0x1c0/0x1d0
> [  881.253076]  __enqueue_in_driver+0xbc/0x260
> [  881.257269]  vb2_start_streaming+0x48/0x200
> [  881.261461]  vb2_core_streamon+0x13c/0x280
> [  881.265565]  vb2_streamon+0x3c/0x90
> [  881.269064]  vsp1_video_streamon+0x2fc/0x3e0
> [  881.273344]  v4l_streamon+0x50/0x70
> [  881.276844]  __video_do_ioctl+0x2bc/0x5d0
> [  881.280861]  video_usercopy+0x2a8/0xc80
> [  881.284704]  video_ioctl2+0x20/0x40
> [  881.288201]  v4l2_ioctl+0xa4/0xc0
> [  881.291525]  __arm64_sys_ioctl+0xe8/0x110
> [  881.295543]  invoke_syscall+0x68/0x190
> [  881.299303]  el0_svc_common.constprop.0+0x88/0x170
> [  881.304105]  do_el0_svc+0x4c/0xf0
> [  881.307430]  el0_svc+0x4c/0xa0
> [  881.310494]  el0t_64_sync_handler+0xbc/0x140
> [  881.314773]  el0t_64_sync+0x190/0x194
> [  881.318450] Code: d50323bf d65f03c0 91008263 f9800071 (885f7c60)
> [  881.324551] ---[ end trace 0000000000000000 ]---
> [  881.329173] note: yavta[1271] exited with preempt_count 1
> 
> A different regression report sent to the linux-media mailing list ([1])
> was answered with a claim that the vb2_is_streaming() function has never
> been meant for this purpose. The document of the function, as well as of
> the struct vb2_queue streaming field, is sparse, so this claim may be
> hard to verify.
> 
> The information needed by the vsp1 driver to decide how to process
> queued buffers is also available from the vb2_start_streaming_called()
> function. Use it instead of vb2_is_streaming() to fix the problem.
> 
> [1] https://lore.kernel.org/linux-media/545610e7-3446-2b82-60dc-7385fea3774f@redhat.com/
> 
> Fixes: a10b21532574 ("media: vb2: add (un)prepare_streaming queue ops")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Hans, I think many drivers may be affected by a10b21532574, and it would
> be difficult to test them all in time for the v6.2 release. Maybe the
> original behaviour of vb2_is_streaming() could be restored (I haven't
> checked), or maybe the commit should be reverted to give more time to
> fix the issue correctly.

I posted a patch for v6.2 to revert the behavior of q->streaming. After looking
at other drivers I concur that more drivers than just vsp1 are affected by that
subtle change. In hindsight changing that shouldn't have been part of the
original patch.

In the meantime, this vsp1 patch is the right thing to do as well, so:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> 
> In the meantime, this patch should be merged as a v6.2 fix, as I think
> it goes in the right direction in any case.
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> index 544012fd1fe9..3664c87e4afb 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> @@ -776,7 +776,7 @@ static void vsp1_video_buffer_queue(struct vb2_buffer *vb)
>  	video->rwpf->mem = buf->mem;
>  	pipe->buffers_ready |= 1 << video->pipe_index;
>  
> -	if (vb2_is_streaming(&video->queue) &&
> +	if (vb2_start_streaming_called(&video->queue) &&
>  	    vsp1_pipeline_ready(pipe))
>  		vsp1_video_pipeline_run(pipe);
>  
> 
> base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2

