Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58ED58F54D
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 22:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732467AbfHOUCg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 16:02:36 -0400
Received: from egyptian.birch.relay.mailchannels.net ([23.83.209.56]:16702
        "EHLO egyptian.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730540AbfHOUCg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 16:02:36 -0400
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 848872C29BF;
        Thu, 15 Aug 2019 19:53:42 +0000 (UTC)
Received: from pdx1-sub0-mail-a22.g.dreamhost.com (100-96-86-117.trex.outbound.svc.cluster.local [100.96.86.117])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id C4DE12C1CC5;
        Thu, 15 Aug 2019 19:53:41 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a22.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.17.5);
        Thu, 15 Aug 2019 19:53:42 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Spill-Spicy: 2c56c2d44818fb20_1565898822217_618839351
X-MC-Loop-Signature: 1565898822217:1019645721
X-MC-Ingress-Time: 1565898822217
Received: from pdx1-sub0-mail-a22.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a22.g.dreamhost.com (Postfix) with ESMTP id DA0758215E;
        Thu, 15 Aug 2019 12:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=nextdimension.cc; bh=eCliwoQKAu72i
        F65WzXiCkEmSJk=; b=bHRw+egyUmcxnbTYdwZ9iif5TerGWPBnlVb754DJ0gcl8
        1LJlhMkjsgrw/QXJq7JYbTrfwlA6XrzCOOTMv4XriRa/0OmU3Nrq3hFv4So+NObx
        7vCQ+jpphH0Ct/V4j7d4DA2GEQ9vky6CJPD9qQy+aJUEQku1jKjqvKlUo9dMCA=
Received: from localhost.localdomain (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a22.g.dreamhost.com (Postfix) with ESMTPSA id 69C4A8215C;
        Thu, 15 Aug 2019 12:53:39 -0700 (PDT)
X-DH-BACKEND: pdx1-sub0-mail-a22
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH] cx231xx-video: fix WARN about mismatched capabilities
Date:   Thu, 15 Aug 2019 14:53:31 -0500
Message-Id: <20190815195331.6619-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: 30
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudefuddgudegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucggtfgfnhhsuhgsshgtrhhisggvpdfftffgtefojffquffvnecuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeeurhgrugcunfhovhgvuceosghrrggusehnvgigthguihhmvghnshhiohhnrdgttgeqnecukfhppeeijedrudelkedrheejrddukeeknecurfgrrhgrmhepmhhouggvpehsmhhtphdphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhinhgvthepieejrdduleekrdehjedrudekkedprhgvthhurhhnqdhprghthhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqedpmhgrihhlfhhrohhmpegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtpdhnrhgtphhtthhopegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since 049e684f2d ("media: v4l2-dev: fix WARN_ON(!vdev->device_caps)"),
if device_caps !=3D capabilities a WARNING is dumped:


[    6.887391] ------------[ cut here ]------------
[    6.887422] WARNING: CPU: 0 PID: 988 at drivers/media/v4l2-core/v4l2-i=
octl.c:1071 v4l_querycap+0xca/0xe0 [videodev]
[    6.887423] Modules linked in: si2157 lgdt3306a cx231xx_dvb dvb_core v=
ideobuf2_vmalloc videobuf2_memops videobuf2_common cx231xx_alsa cx25840 e=
dac_mce_amd cx231xx kvm videobuf_vmalloc tveeprom cx2341x videobuf_core c=
rct10dif_pclmul v4l2_common i2c_mux videodev mc crc32_pclmul ghash_clmuln=
i_intel aesni_intel aes_x86_64 crypto_simd snd_hda_codec_hdmi cryptd glue=
_helper wmi_bmof k10temp nls_iso8859_1 ir_rc5_decoder snd_hda_codec_realt=
ek snd_hda_codec_generic ledtrig_audio rc_hauppauge mceusb asix rc_core u=
sbnet mii snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_=
seq_midi snd_seq_midi_event snd_rawmidi snd_seq snd_seq_device snd_timer =
snd ccp soundcore sch_fq_codel mac_hid parport_pc ppdev lp parport ip_tab=
les x_tables autofs4 vfio_pci vfio_virqfd irqbypass vfio_iommu_type1 vfio=
 hid_generic usbhid hid nouveau mxm_wmi video i2c_algo_bit ttm drm_kms_he=
lper syscopyarea sysfillrect sysimgblt fb_sys_fops drm i2c_piix4 ahci lib=
ahci wmi gpio_amdpt gpio_generic
[    6.887470] CPU: 0 PID: 988 Comm: v4l_id Not tainted 5.3.0-rc4+ #58
[    6.887471] Hardware name: MSI MS-7A39/B350M GAMING PRO (MS-7A39), BIO=
S 2.G0 04/27/2018
[    6.887478] RIP: 0010:v4l_querycap+0xca/0xe0 [videodev]
[    6.887481] Code: af 6f c4 da 0f 0b 41 8b 84 24 b0 01 00 00 8b 53 54 0=
d 00 00 00 80 89 d1 21 c1 39 c8 74 bc 48 c7 c7 c0 f8 ac c0 e8 89 6f c4 da=
 <0f> 0b 8b 53 54 eb a9 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00
[    6.887483] RSP: 0018:ffffb694c168bc78 EFLAGS: 00010286
[    6.887485] RAX: 0000000000000024 RBX: ffffb694c168bd88 RCX: 000000000=
0000000
[    6.887486] RDX: 0000000000000000 RSI: ffff9844cea17388 RDI: ffff9844c=
ea17388
[    6.887487] RBP: ffffb694c168bca0 R08: 0000000000000001 R09: 000000000=
000039e
[    6.887488] R10: 0000000000000020 R11: 000000000000039e R12: ffff9844c=
a685248
[    6.887489] R13: 0000000000000000 R14: ffff9844c7912000 R15: ffffffffc=
0bdcbe0
[    6.887491] FS:  00007f16beef0540(0000) GS:ffff9844cea00000(0000) knlG=
S:0000000000000000
[    6.887492] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.887493] CR2: 00007f10a2372128 CR3: 0000000409a10000 CR4: 000000000=
03406f0
[    6.887494] Call Trace:
[    6.887503]  __video_do_ioctl+0x24c/0x480 [videodev]
[    6.887509]  ? tomoyo_init_request_info+0x80/0x90
[    6.887516]  video_usercopy+0x280/0x5f0 [videodev]
[    6.887522]  ? v4l_s_fmt+0x660/0x660 [videodev]
[    6.887530]  video_ioctl2+0x15/0x20 [videodev]
[    6.887535]  v4l2_ioctl+0x4d/0x60 [videodev]
[    6.887539]  do_vfs_ioctl+0xa6/0x600
[    6.887542]  ? tomoyo_file_ioctl+0x19/0x20
[    6.887545]  ksys_ioctl+0x6d/0x80
[    6.887547]  __x64_sys_ioctl+0x1a/0x20
[    6.887551]  do_syscall_64+0x5a/0x130
[    6.887555]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    6.887557] RIP: 0033:0x7f16bea0a5d7
[    6.887560] Code: b3 66 90 48 8b 05 b1 48 2d 00 64 c7 00 26 00 00 00 4=
8 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05=
 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 81 48 2d 00 f7 d8 64 89 01 48
[    6.887561] RSP: 002b:00007ffdad4ea2b8 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000010
[    6.887562] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f16b=
ea0a5d7
[    6.887563] RDX: 00007ffdad4ea2c0 RSI: 0000000080685600 RDI: 000000000=
0000003
[    6.887564] RBP: 0000557718bd4e70 R08: 0000000000000000 R09: 000000000=
0000000
[    6.887565] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffda=
d4ea2c0
[    6.887566] R13: 00007ffdad4ea420 R14: 0000000000000000 R15: 000000000=
0000000
[    6.887568] ---[ end trace f385f48cdd44f9e9 ]---


Fix this for cx231xx-video by only adding appropriate capabilities for
a specific v4l2 device, based on their file handle type.

Verified working for video device, analog tuner, VBI, and radio.


Signed-off-by: Brad Love <brad@nextdimension.cc>
---
 drivers/media/usb/cx231xx/cx231xx-video.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/us=
b/cx231xx/cx231xx-video.c
index 45eed56137e1..643da9b930c5 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -1576,10 +1576,14 @@ int cx231xx_querycap(struct file *file, void *pri=
v,
 	strscpy(cap->driver, "cx231xx", sizeof(cap->driver));
 	strscpy(cap->card, cx231xx_boards[dev->model].name, sizeof(cap->card));
 	usb_make_path(dev->udev, cap->bus_info, sizeof(cap->bus_info));
-	cap->capabilities =3D V4L2_CAP_READWRITE |
-		V4L2_CAP_VBI_CAPTURE | V4L2_CAP_VIDEO_CAPTURE |
-		V4L2_CAP_STREAMING | V4L2_CAP_DEVICE_CAPS;
-	if (video_is_registered(&dev->radio_dev))
+	cap->capabilities =3D V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+		V4L2_CAP_DEVICE_CAPS;
+
+	if (fh->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		cap->capabilities |=3D V4L2_CAP_VIDEO_CAPTURE;
+	else if (fh->type =3D=3D V4L2_BUF_TYPE_VBI_CAPTURE)
+		cap->capabilities |=3D V4L2_CAP_VBI_CAPTURE;
+	else if (fh->type =3D=3D 0 && video_is_registered(&dev->radio_dev))
 		cap->capabilities |=3D V4L2_CAP_RADIO;
 	if (dev->tuner_type !=3D TUNER_ABSENT)
 		cap->capabilities |=3D V4L2_CAP_TUNER;
--=20
2.21.0

