Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70C898FB1C
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 08:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbfHPGeR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 02:34:17 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:47317 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726565AbfHPGeR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 02:34:17 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id yVoRh0WYCzaKOyVoUhl4yC; Fri, 16 Aug 2019 08:34:14 +0200
Subject: Re: [PATCH] cx231xx-video: fix WARN about mismatched capabilities
To:     Brad Love <brad@nextdimension.cc>, linux-media@vger.kernel.org
References: <20190815195331.6619-1-brad@nextdimension.cc>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <865dbf0b-c100-2791-5c74-df853163bab4@xs4all.nl>
Date:   Fri, 16 Aug 2019 08:34:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190815195331.6619-1-brad@nextdimension.cc>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJ7Zr+bV3862fvZYpSgpnYfzPK1EusEJMrQWohltsrED3Db4ml0HlzoyNbV8MsqNwjf1PLn+atzYPTBr1luPhXW02ukG7cD9IJNn1J9ZdY5XU8/j4P9c
 xg6cmI5lKyb+hhUWWZTrBYcfxOtTsAtLHzQuj4tifUB2vTwT6Ub8IV5OwAGwG5hTuH7nzoVWUE71nmyaSvyn1Fn1WKFBL3pCPss=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/15/19 9:53 PM, Brad Love wrote:
> Since 049e684f2d ("media: v4l2-dev: fix WARN_ON(!vdev->device_caps)"),
> if device_caps != capabilities a WARNING is dumped:

That's not what it tests!

The full check is:

        /*
         * Check that capabilities is a superset of
         * vfd->device_caps | V4L2_CAP_DEVICE_CAPS
         */
        WARN_ON((cap->capabilities &
                 (vfd->device_caps | V4L2_CAP_DEVICE_CAPS)) !=
                (vfd->device_caps | V4L2_CAP_DEVICE_CAPS));

So in this case cap->capabilities is missing a capability that is
set in cap->device_caps.

cap->capabilities is supposed to be the union of the device_caps of
all video_device structs created by the driver.

So apparently there is at least one cap missing. Can you take a
look at which cap exactly is missing?

Does this happen only when the driver is loaded, or also when you
run 'v4l2-ctl -D' for the various devices the driver created?

Regards,

	Hans

> 
> 
> [    6.887391] ------------[ cut here ]------------
> [    6.887422] WARNING: CPU: 0 PID: 988 at drivers/media/v4l2-core/v4l2-ioctl.c:1071 v4l_querycap+0xca/0xe0 [videodev]
> [    6.887423] Modules linked in: si2157 lgdt3306a cx231xx_dvb dvb_core videobuf2_vmalloc videobuf2_memops videobuf2_common cx231xx_alsa cx25840 edac_mce_amd cx231xx kvm videobuf_vmalloc tveeprom cx2341x videobuf_core crct10dif_pclmul v4l2_common i2c_mux videodev mc crc32_pclmul ghash_clmulni_intel aesni_intel aes_x86_64 crypto_simd snd_hda_codec_hdmi cryptd glue_helper wmi_bmof k10temp nls_iso8859_1 ir_rc5_decoder snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio rc_hauppauge mceusb asix rc_core usbnet mii snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_seq_midi snd_seq_midi_event snd_rawmidi snd_seq snd_seq_device snd_timer snd ccp soundcore sch_fq_codel mac_hid parport_pc ppdev lp parport ip_tables x_tables autofs4 vfio_pci vfio_virqfd irqbypass vfio_iommu_type1 vfio hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm i2c_piix4 ahci libahci wmi gpio_amdpt gpio_generic
> [    6.887470] CPU: 0 PID: 988 Comm: v4l_id Not tainted 5.3.0-rc4+ #58
> [    6.887471] Hardware name: MSI MS-7A39/B350M GAMING PRO (MS-7A39), BIOS 2.G0 04/27/2018
> [    6.887478] RIP: 0010:v4l_querycap+0xca/0xe0 [videodev]
> [    6.887481] Code: af 6f c4 da 0f 0b 41 8b 84 24 b0 01 00 00 8b 53 54 0d 00 00 00 80 89 d1 21 c1 39 c8 74 bc 48 c7 c7 c0 f8 ac c0 e8 89 6f c4 da <0f> 0b 8b 53 54 eb a9 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00
> [    6.887483] RSP: 0018:ffffb694c168bc78 EFLAGS: 00010286
> [    6.887485] RAX: 0000000000000024 RBX: ffffb694c168bd88 RCX: 0000000000000000
> [    6.887486] RDX: 0000000000000000 RSI: ffff9844cea17388 RDI: ffff9844cea17388
> [    6.887487] RBP: ffffb694c168bca0 R08: 0000000000000001 R09: 000000000000039e
> [    6.887488] R10: 0000000000000020 R11: 000000000000039e R12: ffff9844ca685248
> [    6.887489] R13: 0000000000000000 R14: ffff9844c7912000 R15: ffffffffc0bdcbe0
> [    6.887491] FS:  00007f16beef0540(0000) GS:ffff9844cea00000(0000) knlGS:0000000000000000
> [    6.887492] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    6.887493] CR2: 00007f10a2372128 CR3: 0000000409a10000 CR4: 00000000003406f0
> [    6.887494] Call Trace:
> [    6.887503]  __video_do_ioctl+0x24c/0x480 [videodev]
> [    6.887509]  ? tomoyo_init_request_info+0x80/0x90
> [    6.887516]  video_usercopy+0x280/0x5f0 [videodev]
> [    6.887522]  ? v4l_s_fmt+0x660/0x660 [videodev]
> [    6.887530]  video_ioctl2+0x15/0x20 [videodev]
> [    6.887535]  v4l2_ioctl+0x4d/0x60 [videodev]
> [    6.887539]  do_vfs_ioctl+0xa6/0x600
> [    6.887542]  ? tomoyo_file_ioctl+0x19/0x20
> [    6.887545]  ksys_ioctl+0x6d/0x80
> [    6.887547]  __x64_sys_ioctl+0x1a/0x20
> [    6.887551]  do_syscall_64+0x5a/0x130
> [    6.887555]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [    6.887557] RIP: 0033:0x7f16bea0a5d7
> [    6.887560] Code: b3 66 90 48 8b 05 b1 48 2d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 81 48 2d 00 f7 d8 64 89 01 48
> [    6.887561] RSP: 002b:00007ffdad4ea2b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [    6.887562] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f16bea0a5d7
> [    6.887563] RDX: 00007ffdad4ea2c0 RSI: 0000000080685600 RDI: 0000000000000003
> [    6.887564] RBP: 0000557718bd4e70 R08: 0000000000000000 R09: 0000000000000000
> [    6.887565] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffdad4ea2c0
> [    6.887566] R13: 00007ffdad4ea420 R14: 0000000000000000 R15: 0000000000000000
> [    6.887568] ---[ end trace f385f48cdd44f9e9 ]---
> 
> 
> Fix this for cx231xx-video by only adding appropriate capabilities for
> a specific v4l2 device, based on their file handle type.
> 
> Verified working for video device, analog tuner, VBI, and radio.
> 
> 
> Signed-off-by: Brad Love <brad@nextdimension.cc>
> ---
>  drivers/media/usb/cx231xx/cx231xx-video.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
> index 45eed56137e1..643da9b930c5 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-video.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-video.c
> @@ -1576,10 +1576,14 @@ int cx231xx_querycap(struct file *file, void *priv,
>  	strscpy(cap->driver, "cx231xx", sizeof(cap->driver));
>  	strscpy(cap->card, cx231xx_boards[dev->model].name, sizeof(cap->card));
>  	usb_make_path(dev->udev, cap->bus_info, sizeof(cap->bus_info));
> -	cap->capabilities = V4L2_CAP_READWRITE |
> -		V4L2_CAP_VBI_CAPTURE | V4L2_CAP_VIDEO_CAPTURE |
> -		V4L2_CAP_STREAMING | V4L2_CAP_DEVICE_CAPS;
> -	if (video_is_registered(&dev->radio_dev))
> +	cap->capabilities = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
> +		V4L2_CAP_DEVICE_CAPS;
> +
> +	if (fh->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE;
> +	else if (fh->type == V4L2_BUF_TYPE_VBI_CAPTURE)
> +		cap->capabilities |= V4L2_CAP_VBI_CAPTURE;
> +	else if (fh->type == 0 && video_is_registered(&dev->radio_dev))
>  		cap->capabilities |= V4L2_CAP_RADIO;
>  	if (dev->tuner_type != TUNER_ABSENT)
>  		cap->capabilities |= V4L2_CAP_TUNER;
> 

