Return-Path: <linux-media+bounces-12814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 173DC901CC2
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B3D11F2141F
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 08:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D027347D;
	Mon, 10 Jun 2024 08:18:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C6473453
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 08:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718007482; cv=none; b=R9v8FaitCa4TxNnz/w6/u/7ewAjCeXEcQ1KNnzVsCOy2YSX/Oj0fZrr6tVlAzxcST6RMdP4DnMBnnRo+MQUrlNEcu8FCwH1X1rD6BMW+ANHmvlxRXvAxUH0DilITNmGOYehMMG+xkl1TT9zgVCmos4stUIhwbTgtxA7Uwa15AkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718007482; c=relaxed/simple;
	bh=SEfp3KNRNvrwnQoKiHsKtULsYbuHOUp/LqLmVQW3+08=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DHh5PcpCSTPbaxw5G1tVOcPThAW4oPXW7mx5eEVd0lWact9fRUTeYHW0hZ6afNEREM0n62EN36RIR+dYXJr/omTpdK3F3NAPdM1JnCGJjfkB5TCgWCc8QI8g9Ctr7+x7tHx5lELHMiDMJRh7KnNDhbHHfzsQa+1wWHkTrARJ8ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45524C4AF1C;
	Mon, 10 Jun 2024 08:18:01 +0000 (UTC)
Message-ID: <9b5e24a7-2cf4-4997-92f2-0d6049e1d82a@xs4all.nl>
Date: Mon, 10 Jun 2024 10:17:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4] media: usb: s2255: media_device and serial number added
To: Dean Anderson <dean@sensoray.com>, mchehab@kernel.org,
 geert+renesas@glider.be, linux-media@vger.kernel.org
References: <20240123201212.23896-1-dean@sensoray.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240123201212.23896-1-dean@sensoray.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dean,

On 23/01/2024 21:12, Dean Anderson wrote:
> Adding media_device support including the serial number.

I apologize for the very late review of this patch.

> 
> Signed-off-by: Dean Anderson <dean@sensoray.com>
> 
> ---
>  drivers/media/usb/s2255/s2255drv.c | 45 ++++++++++++++++++++++++++++--
>  1 file changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
> index 3c2627712fe9..2319cf93e726 100644
> --- a/drivers/media/usb/s2255/s2255drv.c
> +++ b/drivers/media/usb/s2255/s2255drv.c
> @@ -60,6 +60,7 @@
>  #define S2255_MIN_BUFS          2
>  #define S2255_SETMODE_TIMEOUT   500
>  #define S2255_VIDSTATUS_TIMEOUT 350
> +#define S2255_MARKER_SERIALNUM	cpu_to_le32(0xDDCCBBAAL)
>  #define S2255_MARKER_FRAME	cpu_to_le32(0x2255DA4AL)
>  #define S2255_MARKER_RESPONSE	cpu_to_le32(0x2255ACACL)
>  #define S2255_RESPONSE_SETMODE  cpu_to_le32(0x01)
> @@ -245,6 +246,7 @@ struct s2255_vc {
>  
>  
>  struct s2255_dev {
> +	struct media_device     mdev;
>  	struct s2255_vc         vc[MAX_CHANNELS];
>  	struct v4l2_device      v4l2_dev;
>  	atomic_t                num_channels;
> @@ -323,6 +325,7 @@ struct s2255_buffer {
>  #define S2255_V4L2_YC_ON  1
>  #define S2255_V4L2_YC_OFF 0
>  #define V4L2_CID_S2255_COLORFILTER (V4L2_CID_USER_S2255_BASE + 0)
> +#define V4L2_CID_S2255_SERIALNUM (V4L2_CID_USER_S2255_BASE + 1)

This define is no longer used.

>  
>  /* frame prefix size (sent once every frame) */
>  #define PREFIX_SIZE		512
> @@ -1232,6 +1235,29 @@ static int s2255_s_ctrl(struct v4l2_ctrl *ctrl)
>  	return 0;
>  }
>  
> +/*
> + * serial number is not used in usb device descriptors.
> + * returns serial number from device, 0 if none found.
> + */
> +
> +static int s2255_g_serialnum(struct s2255_dev *dev, u32 *serial)
> +{
> +#define S2255_I2C_SIZE     16
> +#define S2255_I2C_SERIALNUM 0xa2
> +#define S2255_I2C_SERIALNUM_OFFSET 0x1ff0
> +#define S2255_VENDOR_READREG 0x22
> +	u8 buf[16];
> +	int rc;
> +
> +	rc = s2255_vendor_req(dev, S2255_VENDOR_READREG, S2255_I2C_SERIALNUM_OFFSET,
> +			      S2255_I2C_SERIALNUM >> 1, buf, S2255_I2C_SIZE, 0);
> +	if (rc != S2255_I2C_SIZE || *(__le32 *)buf != S2255_MARKER_SERIALNUM)
> +		return -EINVAL;
> +	/* Unlike the other parameters, the serial number is sent as big endian */
> +	*serial = be32_to_cpu(*((__be32 *)buf + 3));
> +	return 0;
> +}
> +
>  static int vidioc_g_jpegcomp(struct file *file, void *priv,
>  			 struct v4l2_jpegcompression *jc)
>  {
> @@ -1500,6 +1526,9 @@ static void s2255_destroy(struct s2255_dev *dev)
>  	s2255_reset_dsppower(dev);
>  	mutex_destroy(&dev->lock);
>  	usb_put_dev(dev->udev);
> +	if (media_devnode_is_registered(dev->mdev.devnode))
> +		media_device_unregister(&dev->mdev);
> +	media_device_cleanup(&dev->mdev);
>  	v4l2_device_unregister(&dev->v4l2_dev);
>  	kfree(dev->cmdbuf);
>  	kfree(dev);
> @@ -2206,14 +2235,13 @@ static int s2255_probe(struct usb_interface *interface,
>  	int retval = -ENOMEM;
>  	__le32 *pdata;
>  	int fw_size;
> -
> +	u32 serialno;
>  	/* allocate memory for our device state and initialize it to zero */
>  	dev = kzalloc(sizeof(struct s2255_dev), GFP_KERNEL);
>  	if (dev == NULL) {
>  		s2255_dev_err(&interface->dev, "out of memory\n");
>  		return -ENOMEM;
>  	}
> -
>  	dev->cmdbuf = kzalloc(S2255_CMDBUF_SIZE, GFP_KERNEL);
>  	if (dev->cmdbuf == NULL) {
>  		s2255_dev_err(&interface->dev, "out of memory\n");
> @@ -2237,6 +2265,15 @@ static int s2255_probe(struct usb_interface *interface,
>  	dev_dbg(&interface->dev, "dev: %p, udev %p interface %p\n",
>  		dev, dev->udev, interface);
>  	dev->interface = interface;
> +
> +	dev->mdev.dev = &interface->dev;
> +	strscpy(dev->mdev.model, "Sensoray Model 2255", sizeof(dev->mdev.model));
> +	usb_make_path(dev->udev, dev->mdev.bus_info, sizeof(dev->mdev.bus_info));
> +	dev->mdev.hw_revision = le16_to_cpu(dev->udev->descriptor.bcdDevice);
> +	if (s2255_g_serialnum(dev, &serialno) == 0)
> +		snprintf(dev->mdev.serial, sizeof(dev->mdev.serial), "%d", serialno);
> +	media_device_init(&dev->mdev);
> +	dev->v4l2_dev.mdev = &dev->mdev;
>  	/* set up the endpoint information  */
>  	iface_desc = interface->cur_altsetting;
>  	dev_dbg(&interface->dev, "num EP: %d\n",
> @@ -2311,6 +2348,10 @@ static int s2255_probe(struct usb_interface *interface,
>  	retval = s2255_probe_v4l(dev);
>  	if (retval)
>  		goto errorBOARDINIT;
> +
> +	if (media_device_register(&dev->mdev) < 0)
> +		goto errorBOARDINIT;
> +
>  	dev_info(&interface->dev, "Sensoray 2255 detected\n");
>  	return 0;
>  errorBOARDINIT:

'v4l2-compliance -M0 --verbose' returns a failure: the root cause is that all video devices
have the same name (the name comes from 'template'). So that needs changing.

Also problematic is that I see kernel warnings (refcount related) when the device is connected
to USB, and also disconnected.

This is what I see on connect:

[   32.162551] ------------[ cut here ]------------
[   32.162555] refcount_t: addition on 0; use-after-free.
[   32.162563] WARNING: CPU: 5 PID: 1605 at lib/refcount.c:25 refcount_warn_saturate+0xe1/0x110
[   32.162568] Modules linked in: s2255drv(+) videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common videodev mc rfcomm cmac bnep pulse8_cec serport nls_ascii nls_cp437 vfat fat
intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel snd_hda_codec_hdmi kvm crct10dif_pclmul crc32_pclmul ghash_clmulni_intel snd_ctl_led snd_hda_codec_realtek
iwlmvm aesni_intel snd_hda_codec_generic crypto_simd snd_hda_scodec_component ir_rc6_decoder cryptd mac80211 libarc4 snd_hda_intel snd_intel_dspcfg rapl snd_hda_codec btusb snd_hwdep btrtl
intel_cstate btintel snd_hda_core iTCO_wdt btbcm iwlwifi iTCO_vendor_support snd_pcm bluetooth intel_wmi_thunderbolt wmi_bmof intel_uncore snd_timer pcspkr watchdog cfg80211 mei_me snd soundcore mei
rfkill rc_rc6_mce intel_pch_thermal tpm_crb ite_cir rc_core evdev tpm_tis tpm_tis_core acpi_pad button nfsd auth_rpcgss nfs_acl vmwgfx lockd grace drm_ttm_helper parport_pc ppdev lp parport fuse
efi_pstore sunrpc efivarfs tpm rng_core libaescfb sha3_generic
[   32.162612]  jitterentropy_rng drbg ansi_cprng ecdh_generic ecc autofs4 ext4 crc32c_generic crc16 mbcache jbd2 hid_generic usbhid hid i915 cec i2c_algo_bit drm_buddy ttm drm_display_helper
drm_kms_helper e1000e nvme crc32c_intel ptp i2c_i801 pps_core nvme_core i2c_smbus drm video wmi
[   32.162627] CPU: 5 PID: 1605 Comm: (udev-worker) Not tainted 6.10.0-rc1-nuc2 #26
[   32.162629] Hardware name: Intel(R) Client Systems NUC10i7FNK/NUC10i7FNB, BIOS FNCML357.0052.2021.0409.1144 04/09/2021
[   32.162631] RIP: 0010:refcount_warn_saturate+0xe1/0x110
[   32.162633] Code: c7 b6 ff 0f 0b c3 cc cc cc cc 80 3d b1 0c 07 01 00 0f 85 5e ff ff ff 48 c7 c7 c8 45 64 89 c6 05 9d 0c 07 01 01 e8 5f c7 b6 ff <0f> 0b c3 cc cc cc cc 48 c7 c7 20 46 64 89 c6 05 81
0c 07 01 01 e8
[   32.162634] RSP: 0018:ffffa219437cfb38 EFLAGS: 00010282
[   32.162636] RAX: 0000000000000000 RBX: ffff949379248978 RCX: 0000000000000000
[   32.162637] RDX: 0000000000000002 RSI: 0000000000000027 RDI: 00000000ffffffff
[   32.162638] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000003
[   32.162639] R10: ffffa219437cf9d0 R11: ffffffff898c12e8 R12: ffff949379248298
[   32.162640] R13: ffff949379248000 R14: ffff949379248718 R15: ffff94937924a4d8
[   32.162641] FS:  00007f9a476348c0(0000) GS:ffff949aa0d40000(0000) knlGS:0000000000000000
[   32.162643] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   32.162644] CR2: 00007f7020367000 CR3: 0000000102cfc001 CR4: 00000000003706f0
[   32.162645] Call Trace:
[   32.162647]  <TASK>
[   32.162649]  ? __warn+0x7c/0x120
[   32.162652]  ? refcount_warn_saturate+0xe1/0x110
[   32.162653]  ? report_bug+0x18d/0x1c0
[   32.162656]  ? handle_bug+0x3c/0x80
[   32.162660]  ? exc_invalid_op+0x13/0x60
[   32.162661]  ? asm_exc_invalid_op+0x16/0x20
[   32.162664]  ? refcount_warn_saturate+0xe1/0x110
[   32.162665]  ? refcount_warn_saturate+0xe1/0x110
[   32.162668]  s2255_probe+0xd7c/0xe80 [s2255drv]
[   32.162674]  usb_probe_interface+0xd7/0x2b0
[   32.162677]  really_probe+0xd2/0x2d0
[   32.162680]  ? __pfx___driver_attach+0x10/0x10
[   32.162682]  __driver_probe_device+0x73/0x120
[   32.162684]  driver_probe_device+0x1f/0x90
[   32.162686]  __driver_attach+0x84/0x130
[   32.162688]  bus_for_each_dev+0x70/0xc0
[   32.162690]  bus_add_driver+0xe4/0x210
[   32.162692]  driver_register+0x55/0x100
[   32.162694]  usb_register_driver+0x7e/0x140
[   32.162696]  ? __pfx_s2255_driver_init+0x10/0x10 [s2255drv]
[   32.162699]  do_one_initcall+0x41/0x310
[   32.162702]  ? do_init_module+0x22/0x240
[   32.162705]  do_init_module+0x60/0x240
[   32.162707]  init_module_from_file+0x86/0xc0
[   32.162709]  idempotent_init_module+0x109/0x2a0
[   32.162712]  __x64_sys_finit_module+0x52/0x90
[   32.162713]  do_syscall_64+0x4b/0x110
[   32.162716]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   32.162719] RIP: 0033:0x7f9a477dd9f9
[   32.162721] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f7 c3 0c 00 f7
d8 64 89 01 48
[   32.162723] RSP: 002b:00007fff137b9808 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[   32.162725] RAX: ffffffffffffffda RBX: 0000562b948f50b0 RCX: 00007f9a477dd9f9
[   32.162726] RDX: 0000000000000000 RSI: 00007f9a4762c522 RDI: 0000000000000019
[   32.162727] RBP: 0000000000000000 R08: 0000000000000001 R09: 0000562b947b1a80
[   32.162728] R10: 0000000000000040 R11: 0000000000000246 R12: 00007f9a4762c522
[   32.162729] R13: 0000000000020000 R14: 0000562b9492b1f0 R15: 0000000000000000
[   32.162730]  </TASK>
[   32.162731] ---[ end trace 0000000000000000 ]---
[   32.162733] s2255 1-3:1.0: V4L2 device registered as video0
[   32.162841] ------------[ cut here ]------------
[   32.162843] refcount_t: saturated; leaking memory.
[   32.162848] WARNING: CPU: 5 PID: 1605 at lib/refcount.c:22 refcount_warn_saturate+0x51/0x110
[   32.162851] Modules linked in: s2255drv(+) videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common videodev mc rfcomm cmac bnep pulse8_cec serport nls_ascii nls_cp437 vfat fat
intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel snd_hda_codec_hdmi kvm crct10dif_pclmul crc32_pclmul ghash_clmulni_intel snd_ctl_led snd_hda_codec_realtek
iwlmvm aesni_intel snd_hda_codec_generic crypto_simd snd_hda_scodec_component ir_rc6_decoder cryptd mac80211 libarc4 snd_hda_intel snd_intel_dspcfg rapl snd_hda_codec btusb snd_hwdep btrtl
intel_cstate btintel snd_hda_core iTCO_wdt btbcm iwlwifi iTCO_vendor_support snd_pcm bluetooth intel_wmi_thunderbolt wmi_bmof intel_uncore snd_timer pcspkr watchdog cfg80211 mei_me snd soundcore mei
rfkill rc_rc6_mce intel_pch_thermal tpm_crb ite_cir rc_core evdev tpm_tis tpm_tis_core acpi_pad button nfsd auth_rpcgss nfs_acl vmwgfx lockd grace drm_ttm_helper parport_pc ppdev lp parport fuse
efi_pstore sunrpc efivarfs tpm rng_core libaescfb sha3_generic
[   32.162884]  jitterentropy_rng drbg ansi_cprng ecdh_generic ecc autofs4 ext4 crc32c_generic crc16 mbcache jbd2 hid_generic usbhid hid i915 cec i2c_algo_bit drm_buddy ttm drm_display_helper
drm_kms_helper e1000e nvme crc32c_intel ptp i2c_i801 pps_core nvme_core i2c_smbus drm video wmi
[   32.162897] CPU: 5 PID: 1605 Comm: (udev-worker) Tainted: G        W          6.10.0-rc1-nuc2 #26
[   32.162898] Hardware name: Intel(R) Client Systems NUC10i7FNK/NUC10i7FNB, BIOS FNCML357.0052.2021.0409.1144 04/09/2021
[   32.162899] RIP: 0010:refcount_warn_saturate+0x51/0x110
[   32.162901] Code: 84 bc 00 00 00 c3 cc cc cc cc 85 f6 74 46 80 3d 3e 0d 07 01 00 75 ee 48 c7 c7 a0 45 64 89 c6 05 2e 0d 07 01 01 e8 ef c7 b6 ff <0f> 0b c3 cc cc cc cc 80 3d 17 0d 07 01 00 75 cb 48
c7 c7 50 46 64
[   32.162903] RSP: 0018:ffffa219437cfb38 EFLAGS: 00010282
[   32.162904] RAX: 0000000000000000 RBX: ffff9493792491e8 RCX: 0000000000000000
[   32.162905] RDX: 0000000000000002 RSI: 0000000000000027 RDI: 00000000ffffffff
[   32.162906] RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000003
[   32.162907] R10: ffffa219437cf9d0 R11: ffffffff898c12e8 R12: ffff949379248b08
[   32.162908] R13: ffff949379248000 R14: ffff949379248f88 R15: ffff94937924a4d8
[   32.162909] FS:  00007f9a476348c0(0000) GS:ffff949aa0d40000(0000) knlGS:0000000000000000
[   32.162911] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   32.162912] CR2: 00007f7020367000 CR3: 0000000102cfc001 CR4: 00000000003706f0
[   32.162913] Call Trace:
[   32.162914]  <TASK>
[   32.162915]  ? __warn+0x7c/0x120
[   32.162917]  ? refcount_warn_saturate+0x51/0x110
[   32.162918]  ? report_bug+0x18d/0x1c0
[   32.162920]  ? handle_bug+0x3c/0x80
[   32.162923]  ? exc_invalid_op+0x13/0x60
[   32.162924]  ? asm_exc_invalid_op+0x16/0x20
[   32.162926]  ? refcount_warn_saturate+0x51/0x110
[   32.162927]  ? refcount_warn_saturate+0x51/0x110
[   32.162929]  s2255_probe+0xd6d/0xe80 [s2255drv]
[   32.162933]  usb_probe_interface+0xd7/0x2b0
[   32.162935]  really_probe+0xd2/0x2d0
[   32.162937]  ? __pfx___driver_attach+0x10/0x10
[   32.162939]  __driver_probe_device+0x73/0x120
[   32.162941]  driver_probe_device+0x1f/0x90
[   32.162943]  __driver_attach+0x84/0x130
[   32.162945]  bus_for_each_dev+0x70/0xc0
[   32.162947]  bus_add_driver+0xe4/0x210
[   32.162948]  driver_register+0x55/0x100
[   32.162951]  usb_register_driver+0x7e/0x140
[   32.162952]  ? __pfx_s2255_driver_init+0x10/0x10 [s2255drv]
[   32.162955]  do_one_initcall+0x41/0x310
[   32.162957]  ? do_init_module+0x22/0x240
[   32.162959]  do_init_module+0x60/0x240
[   32.162960]  init_module_from_file+0x86/0xc0
[   32.162963]  idempotent_init_module+0x109/0x2a0
[   32.162965]  __x64_sys_finit_module+0x52/0x90
[   32.162966]  do_syscall_64+0x4b/0x110
[   32.162968]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   32.162971] RIP: 0033:0x7f9a477dd9f9
[   32.162972] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f7 c3 0c 00 f7
d8 64 89 01 48
[   32.162974] RSP: 002b:00007fff137b9808 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[   32.162975] RAX: ffffffffffffffda RBX: 0000562b948f50b0 RCX: 00007f9a477dd9f9
[   32.162977] RDX: 0000000000000000 RSI: 00007f9a4762c522 RDI: 0000000000000019
[   32.162978] RBP: 0000000000000000 R08: 0000000000000001 R09: 0000562b947b1a80
[   32.162978] R10: 0000000000000040 R11: 0000000000000246 R12: 00007f9a4762c522
[   32.162979] R13: 0000000000020000 R14: 0000562b9492b1f0 R15: 0000000000000000
[   32.162981]  </TASK>
[   32.162982] ---[ end trace 0000000000000000 ]---
[   32.162983] s2255 1-3:1.0: V4L2 device registered as video1
[   32.163052] s2255 1-3:1.0: V4L2 device registered as video2
[   32.163121] s2255 1-3:1.0: V4L2 device registered as video3
[   32.163122] Sensoray 2255 V4L driver Revision: 1.25.1
[   32.163123] s2255: Not all channels available.
[   32.163187] s2255 1-3:1.0: Sensoray 2255 detected
[   32.163204] usbcore: registered new interface driver s2255
[   32.180991] s2255_open waiting for firmware load
[   32.180991] s2255_open waiting for firmware load
[   32.181077] s2255_open waiting for firmware load
[   32.181077] s2255_open waiting for firmware load
[   33.585987] s2255: fw loaded

And this on disconnect:

[  388.726479] usb 1-3: USB disconnect, device number 4
[  388.726683] usb 1-3: error submitting urb
[  388.726710] ------------[ cut here ]------------
[  388.726714] refcount_t: underflow; use-after-free.
[  388.726741] WARNING: CPU: 10 PID: 186 at lib/refcount.c:28 refcount_warn_saturate+0xba/0x110
[  388.726759] Modules linked in: s2255drv videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common videodev mc rfcomm cmac bnep pulse8_cec serport nls_ascii nls_cp437 vfat fat
intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel snd_hda_codec_hdmi kvm crct10dif_pclmul crc32_pclmul ghash_clmulni_intel snd_ctl_led snd_hda_codec_realtek
iwlmvm aesni_intel snd_hda_codec_generic crypto_simd snd_hda_scodec_component ir_rc6_decoder cryptd mac80211 libarc4 snd_hda_intel snd_intel_dspcfg rapl snd_hda_codec btusb snd_hwdep btrtl
intel_cstate btintel snd_hda_core iTCO_wdt btbcm iwlwifi iTCO_vendor_support snd_pcm bluetooth intel_wmi_thunderbolt wmi_bmof intel_uncore snd_timer pcspkr watchdog cfg80211 mei_me snd soundcore mei
rfkill rc_rc6_mce intel_pch_thermal tpm_crb ite_cir rc_core evdev tpm_tis tpm_tis_core acpi_pad button nfsd auth_rpcgss nfs_acl vmwgfx lockd grace drm_ttm_helper parport_pc ppdev lp parport fuse
efi_pstore sunrpc efivarfs tpm rng_core libaescfb sha3_generic
[  388.726932]  jitterentropy_rng drbg ansi_cprng ecdh_generic ecc autofs4 ext4 crc32c_generic crc16 mbcache jbd2 hid_generic usbhid hid i915 cec i2c_algo_bit drm_buddy ttm drm_display_helper
drm_kms_helper e1000e nvme crc32c_intel ptp i2c_i801 pps_core nvme_core i2c_smbus drm video wmi
[  388.726997] CPU: 10 PID: 186 Comm: kworker/10:1 Tainted: G        W          6.10.0-rc1-nuc2 #26
[  388.727007] Hardware name: Intel(R) Client Systems NUC10i7FNK/NUC10i7FNB, BIOS FNCML357.0052.2021.0409.1144 04/09/2021
[  388.727013] Workqueue: usb_hub_wq hub_event
[  388.727023] RIP: 0010:refcount_warn_saturate+0xba/0x110
[  388.727032] Code: 01 01 e8 a9 c7 b6 ff 0f 0b c3 cc cc cc cc 80 3d d3 0c 07 01 00 75 85 48 c7 c7 f8 45 64 89 c6 05 c3 0c 07 01 01 e8 86 c7 b6 ff <0f> 0b c3 cc cc cc cc 80 3d b1 0c 07 01 00 0f 85 5e
ff ff ff 48 c7
[  388.727039] RSP: 0018:ffffa2194048bbc0 EFLAGS: 00010282
[  388.727047] RAX: 0000000000000000 RBX: ffff94937924aae0 RCX: 0000000000000000
[  388.727053] RDX: 0000000000000002 RSI: 0000000000000027 RDI: 00000000ffffffff
[  388.727059] RBP: ffff94937924a458 R08: 0000000000000000 R09: 0000000000000003
[  388.727064] R10: ffffa2194048ba58 R11: ffffffff898c12e8 R12: ffff94937924aae0
[  388.727069] R13: ffff9493889c5000 R14: ffff94937924a4d0 R15: ffff9493889c5050
[  388.727074] FS:  0000000000000000(0000) GS:ffff949aa0e80000(0000) knlGS:0000000000000000
[  388.727081] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  388.727087] CR2: 00007f0caf1740e8 CR3: 000000035201a001 CR4: 00000000003706f0
[  388.727093] Call Trace:
[  388.727098]  <TASK>
[  388.727106]  ? __warn+0x7c/0x120
[  388.727117]  ? refcount_warn_saturate+0xba/0x110
[  388.727124]  ? report_bug+0x18d/0x1c0
[  388.727133]  ? prb_read_valid+0x17/0x20
[  388.727147]  ? handle_bug+0x3c/0x80
[  388.727159]  ? exc_invalid_op+0x13/0x60
[  388.727164]  ? asm_exc_invalid_op+0x16/0x20
[  388.727176]  ? refcount_warn_saturate+0xba/0x110
[  388.727186]  s2255_disconnect+0x15f/0x180 [s2255drv]
[  388.727203]  usb_unbind_interface+0x8c/0x280
[  388.727214]  device_release_driver_internal+0x19b/0x200
[  388.727228]  bus_remove_device+0xc0/0x100
[  388.727236]  device_del+0x15f/0x3d0
[  388.727248]  usb_disable_device+0xb5/0x160
[  388.727261]  usb_disconnect+0xdd/0x2c0
[  388.727274]  hub_event+0xcab/0x1880
[  388.727282]  ? _raw_spin_unlock+0x15/0x30
[  388.727293]  ? __schedule+0x3d4/0xaf0
[  388.727302]  process_one_work+0x184/0x3a0
[  388.727316]  worker_thread+0x273/0x390
[  388.727327]  ? __pfx_worker_thread+0x10/0x10
[  388.727337]  kthread+0xda/0x110
[  388.727346]  ? __pfx_kthread+0x10/0x10
[  388.727353]  ret_from_fork+0x2d/0x50
[  388.727364]  ? __pfx_kthread+0x10/0x10
[  388.727371]  ret_from_fork_asm+0x1a/0x30
[  388.727387]  </TASK>
[  388.727390] ---[ end trace 0000000000000000 ]---
[  388.727397] s2255 1-3:1.0: s2255_disconnect

These warnings are not actually related to this patch, they were present already.

Also, after the disconnect the /dev/video0-3 nodes are not removed (probably related to
those warnings), reconnecting adds 4 new video devices.

This really should be fixed in a separate patch.

Regards,

	Hans

