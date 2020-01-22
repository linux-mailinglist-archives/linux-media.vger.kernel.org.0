Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B94F1459FC
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 17:39:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgAVQjZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jan 2020 11:39:25 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35146 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgAVQjZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jan 2020 11:39:25 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id AE652283BB3
Subject: Re: [PATCH v5 3/3] media: vimc: use-after-free fix - release vimc in
 the v4l_device release
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, skhan@linuxfoundation.org,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com
References: <20200122160148.23686-1-dafna.hirschfeld@collabora.com>
 <20200122160148.23686-4-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Autocrypt: addr=helen.koike@collabora.com; keydata=
 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
Message-ID: <d513f4ee-6697-3ec6-2e8e-38e31176ceed@collabora.com>
Date:   Wed, 22 Jan 2020 13:39:12 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200122160148.23686-4-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thanks for the patch.

On 1/22/20 2:01 PM, Dafna Hirschfeld wrote:
> A use-after-free bug occures when unbinding the device while it streams.
> The 'struct vimc_ent_device' allocated for the 'Sensor A' is freed
> when calling the sensor's 'rm' callback but the freed pointer is
> later accessed in the function 'vimc_streamer_pipeline_terminate'.
> To fix this bug, move the release callback of the vimc entities
> and vimc_device to the release callback of v4l2_device.
> The .rm callback of vimc_ent_config is replaced by two callbacks:
> 
> .unregister - this is called upon removing the device and
> it unregisters the entity. This is an optional callback since
> subdevices don't need to implement it because they are already
> unregistered in v4l2_device_unregister.
> 
> .release - this is called from the release callback of v4l2_device
> and it frees the entity.
> 
> This ensures that the entities will be released when the last fh
> of any of the devices is closed.
> 
> The commands that cause the crash and the KASAN report:
> 
> media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
> media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
> v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
> v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
> v4l2-ctl --stream-mmap --stream-count=1000 -d /dev/video2 &
> sleep 1
> echo -n vimc.0 >/sys/bus/platform/drivers/vimc/unbind
> 
> [  188.417934] BUG: KASAN: use-after-free in vimc_streamer_pipeline_terminate+0x75/0x140 [vimc]
> [  188.420182] Read of size 8 at addr ffff8881e9c26008 by task bash/185
> [  188.421800]
> [  188.422223] CPU: 0 PID: 185 Comm: bash Not tainted 5.5.0-rc1+ #1
> [  188.423681] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
> [  188.425938] Call Trace:
> [  188.426610]  dump_stack+0x75/0xa0
> [  188.427519]  ? vimc_streamer_pipeline_terminate+0x75/0x140 [vimc]
> [  188.429057]  print_address_description.constprop.6+0x16/0x220
> [  188.430462]  ? vimc_streamer_pipeline_terminate+0x75/0x140 [vimc]
> [  188.431979]  ? vimc_streamer_pipeline_terminate+0x75/0x140 [vimc]
> [  188.433455]  __kasan_report.cold.9+0x1a/0x40
> [  188.434518]  ? vimc_streamer_pipeline_terminate+0x75/0x140 [vimc]
> [  188.436010]  kasan_report+0xe/0x20
> [  188.436859]  vimc_streamer_pipeline_terminate+0x75/0x140 [vimc]
> [  188.438339]  vimc_streamer_s_stream+0x8b/0x3c0 [vimc]
> [  188.439576]  vimc_cap_stop_streaming+0x22/0x40 [vimc]
> [  188.440863]  __vb2_queue_cancel+0x65/0x560 [videobuf2_common]
> [  188.442391]  vb2_core_queue_release+0x19/0x50 [videobuf2_common]
> [  188.443974]  vimc_cap_rm+0x10/0x20 [vimc]
> [  188.444986]  vimc_rm_subdevs+0x9e/0xe0 [vimc]
> [  188.446179]  vimc_remove+0x19/0x70 [vimc]
> [  188.447301]  platform_drv_remove+0x2f/0x50
> [  188.448468]  device_release_driver_internal+0x133/0x260
> [  188.449814]  unbind_store+0x121/0x150
> [  188.450726]  kernfs_fop_write+0x142/0x230
> [  188.451724]  ? sysfs_kf_bin_read+0x100/0x100
> [  188.452826]  vfs_write+0xdc/0x230
> [  188.453760]  ksys_write+0xaf/0x140
> [  188.454702]  ? __ia32_sys_read+0x40/0x40
> [  188.455773]  ? __do_page_fault+0x473/0x620
> [  188.456780]  do_syscall_64+0x5e/0x1a0
> [  188.457711]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [  188.459079] RIP: 0033:0x7f80f1f13504
> [  188.459969] Code: 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b3 0f 1f 80 00 00 00 00 48 8d 05 f9 61 0d 00 8b 00 85 c0 75 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 41 54 49 89 d4 55 48 89 f5 53
> [  188.464445] RSP: 002b:00007ffd7e843b58 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> [  188.466276] RAX: ffffffffffffffda RBX: 0000000000000006 RCX: 00007f80f1f13504
> [  188.467999] RDX: 0000000000000006 RSI: 000055ef2eb21b10 RDI: 0000000000000001
> [  188.469708] RBP: 000055ef2eb21b10 R08: 00007f80f1fe68c0 R09: 00007f80f1e26740
> [  188.471407] R10: 000055ef2eade010 R11: 0000000000000246 R12: 00007f80f1fe5760
> [  188.473381] R13: 0000000000000006 R14: 00007f80f1fe0760 R15: 0000000000000006
> [  188.475107]
> [  188.475500] Allocated by task 473:
> [  188.476351]  save_stack+0x19/0x80
> [  188.477201]  __kasan_kmalloc.constprop.6+0xc1/0xd0
> [  188.478507]  vimc_sen_add+0x36/0x309 [vimc]
> [  188.479649]  vimc_probe+0x1e2/0x530 [vimc]
> [  188.480776]  platform_drv_probe+0x46/0xa0
> [  188.481829]  really_probe+0x16c/0x520
> [  188.482732]  driver_probe_device+0x114/0x170
> [  188.483783]  device_driver_attach+0x85/0x90
> [  188.484800]  __driver_attach+0xa8/0x190
> [  188.485734]  bus_for_each_dev+0xe4/0x140
> [  188.486702]  bus_add_driver+0x223/0x2d0
> [  188.487715]  driver_register+0xca/0x140
> [  188.488767]  0xffffffffc037003d
> [  188.489635]  do_one_initcall+0x86/0x28f
> [  188.490702]  do_init_module+0xf8/0x340
> [  188.491773]  load_module+0x3766/0x3a10
> [  188.492811]  __do_sys_finit_module+0x11a/0x1b0
> [  188.494059]  do_syscall_64+0x5e/0x1a0
> [  188.495079]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [  188.496481]
> [  188.496893] Freed by task 185:
> [  188.497670]  save_stack+0x19/0x80
> [  188.498493]  __kasan_slab_free+0x125/0x170
> [  188.499486]  kfree+0x8c/0x230
> [  188.500254]  v4l2_subdev_release+0x64/0x70 [videodev]
> [  188.501498]  v4l2_device_release_subdev_node+0x1c/0x30 [videodev]
> [  188.502976]  device_release+0x3c/0xd0
> [  188.503867]  kobject_put+0xf4/0x240
> [  188.507802]  vimc_rm_subdevs+0x9e/0xe0 [vimc]
> [  188.508846]  vimc_remove+0x19/0x70 [vimc]
> [  188.509792]  platform_drv_remove+0x2f/0x50
> [  188.510752]  device_release_driver_internal+0x133/0x260
> [  188.512006]  unbind_store+0x121/0x150
> [  188.512899]  kernfs_fop_write+0x142/0x230
> [  188.513874]  vfs_write+0xdc/0x230
> [  188.514698]  ksys_write+0xaf/0x140
> [  188.515523]  do_syscall_64+0x5e/0x1a0
> [  188.516543]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [  188.517710]
> [  188.518034] The buggy address belongs to the object at ffff8881e9c26000
> [  188.518034]  which belongs to the cache kmalloc-4k of size 4096
> [  188.520528] The buggy address is located 8 bytes inside of
> [  188.520528]  4096-byte region [ffff8881e9c26000, ffff8881e9c27000)
> [  188.523015] The buggy address belongs to the page:
> [  188.524357] page:ffffea0007a70800 refcount:1 mapcount:0 mapping:ffff8881f6402140 index:0x0 compound_mapcount: 0
> [  188.527058] raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881f6402140
> [  188.528983] raw: 0000000000000000 0000000000040004 00000001ffffffff 0000000000000000
> [  188.530883] page dumped because: kasan: bad access detected
> [  188.532336]
> [  188.532720] Memory state around the buggy address:
> [  188.533871]  ffff8881e9c25f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> [  188.535631]  ffff8881e9c25f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> [  188.537370] >ffff8881e9c26000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [  188.538996]                       ^
> [  188.539812]  ffff8881e9c26080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [  188.541549]  ffff8881e9c26100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/media/platform/vimc/vimc-capture.c | 12 ++---
>  drivers/media/platform/vimc/vimc-common.c  |  2 -
>  drivers/media/platform/vimc/vimc-common.h  | 25 ++++-----
>  drivers/media/platform/vimc/vimc-core.c    | 61 +++++++++++++++-------
>  drivers/media/platform/vimc/vimc-debayer.c | 19 ++-----
>  drivers/media/platform/vimc/vimc-scaler.c  | 19 ++-----
>  drivers/media/platform/vimc/vimc-sensor.c  | 18 ++-----
>  7 files changed, 71 insertions(+), 85 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
> index 9a78bb7826a8..c5a645f98c66 100644
> --- a/drivers/media/platform/vimc/vimc-capture.c
> +++ b/drivers/media/platform/vimc/vimc-capture.c
> @@ -325,20 +325,20 @@ static const struct media_entity_operations vimc_cap_mops = {
>  	.link_validate		= vimc_vdev_link_validate,
>  };
>  
> -static void vimc_cap_release(struct video_device *vdev)
> +void vimc_cap_release(struct vimc_ent_device *ved)
>  {
>  	struct vimc_cap_device *vcap =
> -		container_of(vdev, struct vimc_cap_device, vdev);
> +		container_of(ved, struct vimc_cap_device, ved);
>  
>  	media_entity_cleanup(vcap->ved.ent);
>  	kfree(vcap);
>  }
>  
> -void vimc_cap_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
> +void vimc_cap_unregister(struct vimc_ent_device *ved)
>  {
> -	struct vimc_cap_device *vcap;
> +	struct vimc_cap_device *vcap =
> +		container_of(ved, struct vimc_cap_device, ved);
>  
> -	vcap = container_of(ved, struct vimc_cap_device, ved);
>  	vb2_queue_release(&vcap->queue);
>  	video_unregister_device(&vcap->vdev);
>  }
> @@ -449,7 +449,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>  	vdev = &vcap->vdev;
>  	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
>  	vdev->entity.ops = &vimc_cap_mops;
> -	vdev->release = vimc_cap_release;
> +	vdev->release = video_device_release_empty;
>  	vdev->fops = &vimc_cap_fops;
>  	vdev->ioctl_ops = &vimc_cap_ioctl_ops;
>  	vdev->lock = &vcap->lock;
> diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
> index 16ce9f3b7c75..c95c17c048f2 100644
> --- a/drivers/media/platform/vimc/vimc-common.c
> +++ b/drivers/media/platform/vimc/vimc-common.c
> @@ -327,7 +327,6 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
>  			 u32 function,
>  			 u16 num_pads,
>  			 struct media_pad *pads,
> -			 const struct v4l2_subdev_internal_ops *sd_int_ops,
>  			 const struct v4l2_subdev_ops *sd_ops)
>  {
>  	int ret;
> @@ -337,7 +336,6 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
>  
>  	/* Initialize the subdev */
>  	v4l2_subdev_init(sd, sd_ops);
> -	sd->internal_ops = sd_int_ops;
>  	sd->entity.function = function;
>  	sd->entity.ops = &vimc_ent_sd_mops;
>  	sd->owner = THIS_MODULE;
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
> index 1b6ef7196f3c..616d5a6b0754 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -125,16 +125,18 @@ struct vimc_device {
>   * @name			entity name
>   * @ved				pointer to vimc_ent_device (a node in the
>   *					topology)
> - * @add				subdev add hook - initializes and registers
> - *					subdev called from vimc-core
> - * @rm				subdev rm hook - unregisters and frees
> - *					subdev called from vimc-core
> + * @add				initializes and registers
> + *					vim entity - called from vimc-core
> + * @unregister			unregisters vimc entity - called from vimc-core
> + * @release			releases vimc entity - called from the v4l2_dev
> + *					release callback
>   */

Did you test the suggestion I gave in last patch?
That instead of adding another callback here, to just remove the release functions of the subdevices,
and add a check if the release cb isn't null just before calling it.
With this, the release functions of the video nodes would be called first.

I followed the discussion regarding fhs in media node and video, not that I'm against your changes,
but I would like to understand a bit better why the simple fix suggested isn't enough.

Thanks
Helen

>  struct vimc_ent_config {
>  	const char *name;
>  	struct vimc_ent_device *(*add)(struct vimc_device *vimc,
>  				       const char *vcfg_name);
> -	void (*rm)(struct vimc_device *vimc, struct vimc_ent_device *ved);
> +	void (*unregister)(struct vimc_ent_device *ved);
> +	void (*release)(struct vimc_ent_device *ved);
>  };
>  
>  /**
> @@ -145,22 +147,23 @@ struct vimc_ent_config {
>   */
>  bool vimc_is_source(struct media_entity *ent);
>  
> -/* prototypes for vimc_ent_config add and rm hooks */
> +/* prototypes for vimc_ent_config hooks */
>  struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>  				     const char *vcfg_name);
> -void vimc_cap_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
> +void vimc_cap_unregister(struct vimc_ent_device *ved);
> +void vimc_cap_release(struct vimc_ent_device *ved);
>  
>  struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>  				     const char *vcfg_name);
> -void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
> +void vimc_deb_release(struct vimc_ent_device *ved);
>  
>  struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>  				     const char *vcfg_name);
> -void vimc_sca_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
> +void vimc_sca_release(struct vimc_ent_device *ved);
>  
>  struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>  				     const char *vcfg_name);
> -void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
> +void vimc_sen_release(struct vimc_ent_device *ved);
>  
>  /**
>   * vimc_pix_map_by_index - get vimc_pix_map struct by its index
> @@ -195,7 +198,6 @@ const struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat);
>   * @num_pads:	number of pads to initialize
>   * @pads:	the array of pads of the entity, the caller should set the
>  		flags of the pads
> - * @sd_int_ops:	pointer to &struct v4l2_subdev_internal_ops
>   * @sd_ops:	pointer to &struct v4l2_subdev_ops.
>   *
>   * Helper function initialize and register the struct vimc_ent_device and struct
> @@ -208,7 +210,6 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
>  			 u32 function,
>  			 u16 num_pads,
>  			 struct media_pad *pads,
> -			 const struct v4l2_subdev_internal_ops *sd_int_ops,
>  			 const struct v4l2_subdev_ops *sd_ops);
>  
>  /**
> diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
> index 1c55e0382f09..306f9c293628 100644
> --- a/drivers/media/platform/vimc/vimc-core.c
> +++ b/drivers/media/platform/vimc/vimc-core.c
> @@ -48,48 +48,51 @@ static struct vimc_ent_config ent_config[] = {
>  	{
>  		.name = "Sensor A",
>  		.add = vimc_sen_add,
> -		.rm = vimc_sen_rm,
> +		.release = vimc_sen_release,
>  	},
>  	{
>  		.name = "Sensor B",
>  		.add = vimc_sen_add,
> -		.rm = vimc_sen_rm,
> +		.release = vimc_sen_release,
>  	},
>  	{
>  		.name = "Debayer A",
>  		.add = vimc_deb_add,
> -		.rm = vimc_deb_rm,
> +		.release = vimc_deb_release,
>  	},
>  	{
>  		.name = "Debayer B",
>  		.add = vimc_deb_add,
> -		.rm = vimc_deb_rm,
> +		.release = vimc_deb_release,
>  	},
>  	{
>  		.name = "Raw Capture 0",
>  		.add = vimc_cap_add,
> -		.rm = vimc_cap_rm,
> +		.unregister = vimc_cap_unregister,
> +		.release = vimc_cap_release,
>  	},
>  	{
>  		.name = "Raw Capture 1",
>  		.add = vimc_cap_add,
> -		.rm = vimc_cap_rm,
> +		.unregister = vimc_cap_unregister,
> +		.release = vimc_cap_release,
>  	},
>  	{
>  		/* TODO: change this to vimc-input when it is implemented */
>  		.name = "RGB/YUV Input",
>  		.add = vimc_sen_add,
> -		.rm = vimc_sen_rm,
> +		.release = vimc_sen_release,
>  	},
>  	{
>  		.name = "Scaler",
>  		.add = vimc_sca_add,
> -		.rm = vimc_sca_rm,
> +		.release = vimc_sca_release,
>  	},
>  	{
>  		.name = "RGB/YUV Capture",
>  		.add = vimc_cap_add,
> -		.rm = vimc_cap_rm,
> +		.unregister = vimc_cap_unregister,
> +		.release = vimc_cap_release,
>  	},
>  };
>  
> @@ -175,13 +178,33 @@ static int vimc_add_subdevs(struct vimc_device *vimc)
>  	return 0;
>  }
>  
> -static void vimc_rm_subdevs(struct vimc_device *vimc)
> +static void vimc_release_subdevs(struct vimc_device *vimc)
>  {
>  	unsigned int i;
>  
>  	for (i = 0; i < vimc->pipe_cfg->num_ents; i++)
>  		if (vimc->ent_devs[i])
> -			vimc->pipe_cfg->ents[i].rm(vimc, vimc->ent_devs[i]);
> +			vimc->pipe_cfg->ents[i].release(vimc->ent_devs[i]);
> +}
> +
> +static void vimc_unregister_subdevs(struct vimc_device *vimc)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < vimc->pipe_cfg->num_ents; i++)
> +		if (vimc->ent_devs[i] && vimc->pipe_cfg->ents[i].unregister)
> +			vimc->pipe_cfg->ents[i].unregister(vimc->ent_devs[i]);
> +}
> +
> +static void vimc_v4l2_dev_release(struct v4l2_device *v4l2_dev)
> +{
> +	struct vimc_device *vimc =
> +		container_of(v4l2_dev, struct vimc_device, v4l2_dev);
> +
> +	vimc_release_subdevs(vimc);
> +	media_device_cleanup(&vimc->mdev);
> +	kfree(vimc->ent_devs);
> +	kfree(vimc);
>  }
>  
>  static int vimc_register_devices(struct vimc_device *vimc)
> @@ -195,7 +218,6 @@ static int vimc_register_devices(struct vimc_device *vimc)
>  			"v4l2 device register failed (err=%d)\n", ret);
>  		return ret;
>  	}
> -
>  	/* allocate ent_devs */
>  	vimc->ent_devs = kcalloc(vimc->pipe_cfg->num_ents,
>  				 sizeof(*vimc->ent_devs), GFP_KERNEL);
> @@ -236,9 +258,9 @@ static int vimc_register_devices(struct vimc_device *vimc)
>  
>  err_mdev_unregister:
>  	media_device_unregister(&vimc->mdev);
> -	media_device_cleanup(&vimc->mdev);
>  err_rm_subdevs:
> -	vimc_rm_subdevs(vimc);
> +	vimc_unregister_subdevs(vimc);
> +	vimc_release_subdevs(vimc);
>  	kfree(vimc->ent_devs);
>  err_v4l2_unregister:
>  	v4l2_device_unregister(&vimc->v4l2_dev);
> @@ -248,11 +270,9 @@ static int vimc_register_devices(struct vimc_device *vimc)
>  
>  static void vimc_unregister(struct vimc_device *vimc)
>  {
> +	vimc_unregister_subdevs(vimc);
>  	media_device_unregister(&vimc->mdev);
> -	media_device_cleanup(&vimc->mdev);
>  	v4l2_device_unregister(&vimc->v4l2_dev);
> -	kfree(vimc->ent_devs);
> -	kfree(vimc);
>  }
>  
>  static int vimc_probe(struct platform_device *pdev)
> @@ -285,7 +305,12 @@ static int vimc_probe(struct platform_device *pdev)
>  		kfree(vimc);
>  		return ret;
>  	}
> +	/*
> +	 * the release cb is set only after successful registration.
> +	 * if the registration fails, we release directly from probe
> +	 */
>  
> +	vimc->v4l2_dev.release = vimc_v4l2_dev_release;
>  	platform_set_drvdata(pdev, vimc);
>  	return 0;
>  }
> @@ -296,8 +321,8 @@ static int vimc_remove(struct platform_device *pdev)
>  
>  	dev_dbg(&pdev->dev, "remove");
>  
> -	vimc_rm_subdevs(vimc);
>  	vimc_unregister(vimc);
> +	v4l2_device_put(&vimc->v4l2_dev);
>  
>  	return 0;
>  }
> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
> index 34b98b235880..baf6bf9f65b5 100644
> --- a/drivers/media/platform/vimc/vimc-debayer.c
> +++ b/drivers/media/platform/vimc/vimc-debayer.c
> @@ -494,28 +494,16 @@ static const struct v4l2_ctrl_ops vimc_deb_ctrl_ops = {
>  	.s_ctrl = vimc_deb_s_ctrl,
>  };
>  
> -static void vimc_deb_release(struct v4l2_subdev *sd)
> +void vimc_deb_release(struct vimc_ent_device *ved)
>  {
>  	struct vimc_deb_device *vdeb =
> -				container_of(sd, struct vimc_deb_device, sd);
> +		container_of(ved, struct vimc_deb_device, ved);
>  
>  	v4l2_ctrl_handler_free(&vdeb->hdl);
>  	media_entity_cleanup(vdeb->ved.ent);
>  	kfree(vdeb);
>  }
>  
> -static const struct v4l2_subdev_internal_ops vimc_deb_int_ops = {
> -	.release = vimc_deb_release,
> -};
> -
> -void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
> -{
> -	struct vimc_deb_device *vdeb;
> -
> -	vdeb = container_of(ved, struct vimc_deb_device, ved);
> -	v4l2_device_unregister_subdev(&vdeb->sd);
> -}
> -
>  static const struct v4l2_ctrl_config vimc_deb_ctrl_class = {
>  	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY,
>  	.id = VIMC_CID_VIMC_CLASS,
> @@ -563,8 +551,7 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>  	ret = vimc_ent_sd_register(&vdeb->ved, &vdeb->sd, v4l2_dev,
>  				   vcfg_name,
>  				   MEDIA_ENT_F_PROC_VIDEO_PIXEL_ENC_CONV, 2,
> -				   vdeb->pads,
> -				   &vimc_deb_int_ops, &vimc_deb_ops);
> +				   vdeb->pads, &vimc_deb_ops);
>  	if (ret)
>  		goto err_free_hdl;
>  
> diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
> index cb2dc24c3e59..7521439747c5 100644
> --- a/drivers/media/platform/vimc/vimc-scaler.c
> +++ b/drivers/media/platform/vimc/vimc-scaler.c
> @@ -464,27 +464,15 @@ static void *vimc_sca_process_frame(struct vimc_ent_device *ved,
>  	return vsca->src_frame;
>  };
>  
> -static void vimc_sca_release(struct v4l2_subdev *sd)
> +void vimc_sca_release(struct vimc_ent_device *ved)
>  {
>  	struct vimc_sca_device *vsca =
> -				container_of(sd, struct vimc_sca_device, sd);
> +		container_of(ved, struct vimc_sca_device, ved);
>  
>  	media_entity_cleanup(vsca->ved.ent);
>  	kfree(vsca);
>  }
>  
> -static const struct v4l2_subdev_internal_ops vimc_sca_int_ops = {
> -	.release = vimc_sca_release,
> -};
> -
> -void vimc_sca_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
> -{
> -	struct vimc_sca_device *vsca;
> -
> -	vsca = container_of(ved, struct vimc_sca_device, ved);
> -	v4l2_device_unregister_subdev(&vsca->sd);
> -}
> -
>  struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>  				     const char *vcfg_name)
>  {
> @@ -504,8 +492,7 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>  	ret = vimc_ent_sd_register(&vsca->ved, &vsca->sd, v4l2_dev,
>  				   vcfg_name,
>  				   MEDIA_ENT_F_PROC_VIDEO_SCALER, 2,
> -				   vsca->pads,
> -				   &vimc_sca_int_ops, &vimc_sca_ops);
> +				   vsca->pads, &vimc_sca_ops);
>  	if (ret) {
>  		kfree(vsca);
>  		return NULL;
> diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
> index 9788fe291193..92daee58209e 100644
> --- a/drivers/media/platform/vimc/vimc-sensor.c
> +++ b/drivers/media/platform/vimc/vimc-sensor.c
> @@ -279,10 +279,10 @@ static const struct v4l2_ctrl_ops vimc_sen_ctrl_ops = {
>  	.s_ctrl = vimc_sen_s_ctrl,
>  };
>  
> -static void vimc_sen_release(struct v4l2_subdev *sd)
> +void vimc_sen_release(struct vimc_ent_device *ved)
>  {
>  	struct vimc_sen_device *vsen =
> -				container_of(sd, struct vimc_sen_device, sd);
> +		container_of(ved, struct vimc_sen_device, ved);
>  
>  	v4l2_ctrl_handler_free(&vsen->hdl);
>  	tpg_free(&vsen->tpg);
> @@ -290,18 +290,6 @@ static void vimc_sen_release(struct v4l2_subdev *sd)
>  	kfree(vsen);
>  }
>  
> -static const struct v4l2_subdev_internal_ops vimc_sen_int_ops = {
> -	.release = vimc_sen_release,
> -};
> -
> -void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
> -{
> -	struct vimc_sen_device *vsen;
> -
> -	vsen = container_of(ved, struct vimc_sen_device, ved);
> -	v4l2_device_unregister_subdev(&vsen->sd);
> -}
> -
>  /* Image Processing Controls */
>  static const struct v4l2_ctrl_config vimc_sen_ctrl_class = {
>  	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY,
> @@ -365,7 +353,7 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>  	ret = vimc_ent_sd_register(&vsen->ved, &vsen->sd, v4l2_dev,
>  				   vcfg_name,
>  				   MEDIA_ENT_F_CAM_SENSOR, 1, &vsen->pad,
> -				   &vimc_sen_int_ops, &vimc_sen_ops);
> +				   &vimc_sen_ops);
>  	if (ret)
>  		goto err_free_tpg;
>  
> 
