Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF568B31A2
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2019 21:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbfIOTZr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Sep 2019 15:25:47 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47758 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbfIOTZr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Sep 2019 15:25:47 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 3966728AE52
Subject: Re: [PATCH v4 2/5] media: vimc: Fix gpf in rmmod path when stream is
 active
To:     Shuah Khan <skhan@linuxfoundation.org>, mchehab@kernel.org,
        andrealmeid@collabora.com, dafna.hirschfeld@collabora.com,
        hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1567822792.git.skhan@linuxfoundation.org>
 <2421a0ea4bec8c5084121ecdbc9213c331239f3d.1567822793.git.skhan@linuxfoundation.org>
From:   Helen Koike <helen.koike@collabora.com>
Openpgp: preference=signencrypt
Autocrypt: addr=helen.koike@collabora.com; keydata=
 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
Message-ID: <05f955ad-525a-cabf-637f-d68a1ac43e33@collabora.com>
Date:   Sun, 15 Sep 2019 16:25:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <2421a0ea4bec8c5084121ecdbc9213c331239f3d.1567822793.git.skhan@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 9/6/19 11:42 PM, Shuah Khan wrote:
> If vimc module is removed while streaming is in progress, sensor subdev
> unregister runs into general protection fault when it tries to unregister
> media entities. This is a common subdev problem related to releasing
> pads from v4l2_device_unregister_subdev() before calling unregister.
> Unregister references pads during unregistering subdev.
> 
> The sd release handler is the right place for releasing all sd resources
> including pads. The release handlers currently release all resources
> except the pads.
> 
> Fix v4l2_device_unregister_subdev() not release pads and release pads
> from the sd_int_op release handlers.
> 
> kernel: [ 4136.715839] general protection fault: 0000 [#1] SMP PTI
> kernel: [ 4136.715847] CPU: 2 PID: 1972 Comm: bash Not tainted 5.3.0-rc2+ #4
> kernel: [ 4136.715850] Hardware name: Dell Inc. OptiPlex 790/0HY9JP, BIOS A18 09/24/2013
> kernel: [ 4136.715858] RIP: 0010:media_gobj_destroy.part.16+0x1f/0x60
> kernel: [ 4136.715863] Code: ff 66 2e 0f 1f 84 00 00 00 00 00 66 66 66 66 90 55 48 89 fe 48 89 e5 53 48 89 fb 48 c7 c7 00 7f cf b0 e8 24 fa ff ff 48 8b 03 <48> 83 80 a0 00 00 00 01 48 8b 43 18 48 8b 53 10 48 89 42 08 48 89
> kernel: [ 4136.715866] RSP: 0018:ffff9b2248fe3cb0 EFLAGS: 00010246
> kernel: [ 4136.715870] RAX: bcf2bfbfa0d63c2f RBX: ffff88c3eb37e9c0 RCX: 00000000802a0018
> kernel: [ 4136.715873] RDX: ffff88c3e4f6a078 RSI: ffff88c3eb37e9c0 RDI: ffffffffb0cf7f00
> kernel: [ 4136.715876] RBP: ffff9b2248fe3cb8 R08: 0000000001000002 R09: ffffffffb0492b00
> kernel: [ 4136.715879] R10: ffff9b2248fe3c28 R11: 0000000000000001 R12: 0000000000000038
> kernel: [ 4136.715881] R13: ffffffffc09a1628 R14: ffff88c3e4f6a028 R15: fffffffffffffff2
> kernel: [ 4136.715885] FS:  00007f8389647740(0000) GS:ffff88c465500000(0000) knlGS:0000000000000000
> kernel: [ 4136.715888] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> kernel: [ 4136.715891] CR2: 000055d008f80fd8 CR3: 00000001996ec005 CR4: 00000000000606e0
> kernel: [ 4136.715894] Call Trace:
> kernel: [ 4136.715903]  media_gobj_destroy+0x14/0x20
> kernel: [ 4136.715908]  __media_device_unregister_entity+0xb3/0xe0
> kernel: [ 4136.715915]  media_device_unregister_entity+0x30/0x40
> kernel: [ 4136.715920]  v4l2_device_unregister_subdev+0xa8/0xe0
> kernel: [ 4136.715928]  vimc_ent_sd_unregister+0x1e/0x30 [vimc]
> kernel: [ 4136.715933]  vimc_sen_rm+0x16/0x20 [vimc]
> kernel: [ 4136.715938]  vimc_remove+0x3e/0xa0 [vimc]
> kernel: [ 4136.715945]  platform_drv_remove+0x25/0x50
> kernel: [ 4136.715951]  device_release_driver_internal+0xe0/0x1b0
> kernel: [ 4136.715956]  device_driver_detach+0x14/0x20
> kernel: [ 4136.715960]  unbind_store+0xd1/0x130
> kernel: [ 4136.715965]  drv_attr_store+0x27/0x40
> kernel: [ 4136.715971]  sysfs_kf_write+0x48/0x60
> kernel: [ 4136.715976]  kernfs_fop_write+0x128/0x1b0
> kernel: [ 4136.715982]  __vfs_write+0x1b/0x40
> kernel: [ 4136.715987]  vfs_write+0xc3/0x1d0
> kernel: [ 4136.715993]  ksys_write+0xaa/0xe0
> kernel: [ 4136.715999]  __x64_sys_write+0x1a/0x20
> kernel: [ 4136.716005]  do_syscall_64+0x5a/0x130
> kernel: [ 4136.716010]  entry_SYSCALL_64_after_hwframe+0x4
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/media/platform/vimc/vimc-common.c  | 3 +--
>  drivers/media/platform/vimc/vimc-debayer.c | 1 +
>  drivers/media/platform/vimc/vimc-scaler.c  | 1 +
>  drivers/media/platform/vimc/vimc-sensor.c  | 1 +
>  4 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
> index 7e1ae0b12f1e..a3120f4f7a90 100644
> --- a/drivers/media/platform/vimc/vimc-common.c
> +++ b/drivers/media/platform/vimc/vimc-common.c
> @@ -375,7 +375,7 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
>  {
>  	int ret;
>  
> -	/* Allocate the pads */
> +	/* Allocate the pads. Should be released from the sd_int_op release */
>  	ved->pads = vimc_pads_init(num_pads, pads_flag);
>  	if (IS_ERR(ved->pads))
>  		return PTR_ERR(ved->pads);
> @@ -424,7 +424,6 @@ EXPORT_SYMBOL_GPL(vimc_ent_sd_register);
>  void vimc_ent_sd_unregister(struct vimc_ent_device *ved, struct v4l2_subdev *sd)
>  {
>  	media_entity_cleanup(ved->ent);
> -	vimc_pads_cleanup(ved->pads);
>  	v4l2_device_unregister_subdev(sd);
>  }
>  EXPORT_SYMBOL_GPL(vimc_ent_sd_unregister);
> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
> index 00850f2501ad..b38b55f51a24 100644
> --- a/drivers/media/platform/vimc/vimc-debayer.c
> +++ b/drivers/media/platform/vimc/vimc-debayer.c
> @@ -482,6 +482,7 @@ static void vimc_deb_release(struct v4l2_subdev *sd)
>  	struct vimc_deb_device *vdeb =
>  				container_of(sd, struct vimc_deb_device, sd);
>  
> +	vimc_pads_cleanup(vdeb->ved.pads);
>  	kfree(vdeb);
>  }
>  
> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
> index 28a947950a0b..05db5070e268 100644
> --- a/drivers/media/platform/vimc/vimc-scaler.c
> +++ b/drivers/media/platform/vimc/vimc-scaler.c
> @@ -338,6 +338,7 @@ static void vimc_sca_release(struct v4l2_subdev *sd)
>  	struct vimc_sca_device *vsca =
>  				container_of(sd, struct vimc_sca_device, sd);
>  
> +	vimc_pads_cleanup(vsca->ved.pads);
>  	kfree(vsca);
>  }
>  
> diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
> index 1f15637ca8bb..46dc6a535abe 100644
> --- a/drivers/media/platform/vimc/vimc-sensor.c
> +++ b/drivers/media/platform/vimc/vimc-sensor.c
> @@ -291,6 +291,7 @@ static void vimc_sen_release(struct v4l2_subdev *sd)
>  
>  	v4l2_ctrl_handler_free(&vsen->hdl);
>  	tpg_free(&vsen->tpg);
> +	vimc_pads_cleanup(vsen->ved.pads);
>  	kfree(vsen);
>  }
>  
> 
