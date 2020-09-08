Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E9C262232
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 23:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbgIHV5F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 17:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgIHV5E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 17:57:04 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA20DC061573
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 14:57:03 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id w3so867586ljo.5
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2020 14:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teralogics-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=nigPz80jxhVqmUJGjK5R/+KzWOityJXmZxCJ9o9aLlM=;
        b=iZiZAHDCq+X9UQ5UWICaRriNACkiW5SorUoV1qGmtnKbvgZpoS3MiGCdfZRCFslq4B
         mY1FSGjNtbRLQnSUt8k3hX4m+BZl7yttIoGPQ+ddHKlXj61c3mvbOJL2JgXlQkqOl0Gt
         rz6Pr+8GEAYY5sCqdjbq9UC0c7sWnZ4hWAhoXeol2fXQFrTbp7I6gFonKFcacfPu9h8u
         Akbaa/undK65QhxqMfvvUR/tYh+MP7usPuc4cHelvE/Ve/1IuhzdZuSj3lx1hQSZglcc
         iHyLoN7Igap19iBbhjvNb7oZHC/hZonWBLgC2HDHRG0UoGHwukNcDDWVFLVCK0kHBKl8
         crKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=nigPz80jxhVqmUJGjK5R/+KzWOityJXmZxCJ9o9aLlM=;
        b=CooL+2b0qLZTAAtVDZOLvZCIB05YgyC18h10T8n9aVWcOjDRKtXlrEhgB+vd4cEsET
         b8BG/kuJksdWEb7nRar8x5Wf8+BKKZQw8bxKGne+i5Oh6FaL6AM8jrFSG885XJ3FRuSg
         q2b49w4OwdZplIUehV3h/3cQ2Fs199OEUAW+Tp+JvsnTZ7+fqSIm14ATNyKsXFO8AmUJ
         SIerd5In4z2h9Now48CDCHkGkeus2nrEglGwSiZ6V5tQ7slrMhqXeLxd4wnME54rFfsH
         VY7mcBke49xI64B57qlMUQoDzTnOR0VItq7hdaGeGrqT+FdeGR5dXL4mV9YeJTqbOSB3
         Nbkg==
X-Gm-Message-State: AOAM5321dIXXsjd2U5ToY4rIZq4gLaplUbCbn/yhVWqn6B4tk0vsmfn/
        4aKQf18BXJ98epvMSx8gaZUxQaw16JvWuEB47QfxkuNJGzHs2g==
X-Google-Smtp-Source: ABdhPJxB7HHJjopS25cjxzsEa2lYZK1vG9CtCatH4sG0XHIfenCsvC3BHP2qjF2MZRc570VhZyl2nmP7jW7QKLOzwtw=
X-Received: by 2002:a2e:8841:: with SMTP id z1mr279311ljj.292.1599602221496;
 Tue, 08 Sep 2020 14:57:01 -0700 (PDT)
MIME-Version: 1.0
From:   "Jaymes, Casey" <jaymes@teralogics.com>
Date:   Tue, 8 Sep 2020 17:56:50 -0400
Message-ID: <CANvTTZJznQsMGTP=N-O-yGxCtAeLpVdf9vtbxEnJsrd-GLDx8Q@mail.gmail.com>
Subject: cx23885 on Red Hat 3.10.0-1127.18.2.el7.x86_64
To:     linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000003269f105aed46a4a"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--0000000000003269f105aed46a4a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm trying to get a cx23885 pci card (specifically an Osprey) to work
on a Red Hat 7 system. The hardware works with the old kernel version
(-1127.13.1 I think). We've previously compiled this from an old
tarball, but the tarball is no longer available, so I started from
latest.

I couldn't get the build to work out of the box, but I'm using the
attached patches to get the build to work for this kernel version. I
believe Red Hat applies some backports to their kernels. The build
completes successfully. I insmod frame_vector.ko, and modprobe the
cx23885 module, but that produces the following kernel panic:

> [ 1304.374594] cx23885: cx23885 driver version 0.0.4 loaded
> [ 1304.374838] cx23885: CORE cx23885[0]: subsystem: 1576:0460, board: Vie=
wCast 460e [card=3D55,autodetected]
> [ 1304.530469] cx23885: cx23885[0]: card 'ViewCast 460e' sn# MM14182198
> [ 1304.542750] cx25840 4-0044: cx23888 A/V decoder found @ 0x88 (cx23885[=
0])
> [ 1305.161856] cx25840 4-0044: loaded v4l-cx23885-avcore-01.fw firmware (=
16382 bytes)
> [ 1305.197830] cs3308 2-0040: chip found @ 0x80 (cx23885[0])
> [ 1305.204288] cs3308 2-0041: chip found @ 0x82 (cx23885[0])
> [ 1305.273433] cx23885: cx23885[0]: registered device video0 [v4l2]
> [ 1305.273490] cx23885: cx23885[0]: registered device vbi0
> [ 1305.274322] cx23885: cx23885[0]: alsa: registered ALSA audio device
> [ 1305.274326] cx23885: cx23885_dev_checkrevision() Hardware revision =3D=
 0xd0
> [ 1305.274333] cx23885: cx23885[0]/0: found at 0000:05:00.0, rev: 4, irq:=
 37, latency: 0, mmio: 0xdf800000
> [ 1305.274577] cx23885: CORE cx23885[1]: subsystem: 1576:0460, board: Vie=
wCast 460e [card=3D55,autodetected]
> [ 1305.430379] cx23885: cx23885[1]: card 'ViewCast 460e' sn# MM14182198
> [ 1305.434246] cx25840 7-0044: cx23888 A/V decoder found @ 0x88 (cx23885[=
1])
> [ 1306.053067] cx25840 7-0044: loaded v4l-cx23885-avcore-01.fw firmware (=
16382 bytes)
> [ 1306.151362] cx23885: cx23885[1]: registered device video1 [v4l2]
> [ 1306.151423] cx23885: cx23885[1]: registered device vbi1
> [ 1306.151599] cx23885: cx23885[1]: alsa: registered ALSA audio device
> [ 1306.151603] cx23885: cx23885_dev_checkrevision() Hardware revision =3D=
 0xd0
> [ 1306.151609] cx23885: cx23885[1]/0: found at 0000:07:00.0, rev: 4, irq:=
 37, latency: 0, mmio: 0xdf600000
> [ 1306.151775] cx23885: CORE cx23885[2]: subsystem: 1576:0460, board: Vie=
wCast 460e [card=3D55,autodetected]
> [ 1306.307127] cx23885: cx23885[2]: card 'ViewCast 460e' sn# MM14182198
> [ 1306.310374] cx25840 10-0044: cx23888 A/V decoder found @ 0x88 (cx23885=
[2])
> [ 1306.928952] cx25840 10-0044: loaded v4l-cx23885-avcore-01.fw firmware =
(16382 bytes)
> [ 1307.027740] cx23885: cx23885[2]: registered device video2 [v4l2]
> [ 1307.027824] cx23885: cx23885[2]: registered device vbi2
> [ 1307.028016] cx23885: cx23885[2]: alsa: registered ALSA audio device
> [ 1307.028020] cx23885: cx23885_dev_checkrevision() Hardware revision =3D=
 0xd0
> [ 1307.028025] cx23885: cx23885[2]/0: found at 0000:08:00.0, rev: 4, irq:=
 41, latency: 0, mmio: 0xdf400000
> [ 1307.028230] cx23885: CORE cx23885[3]: subsystem: 1576:0460, board: Vie=
wCast 460e [card=3D55,autodetected]
> [ 1307.184364] cx23885: cx23885[3]: card 'ViewCast 460e' sn# MM14182198
> [ 1307.187915] cx25840 13-0044: cx23888 A/V decoder found @ 0x88 (cx23885=
[3])
> [ 1307.806138] cx25840 13-0044: loaded v4l-cx23885-avcore-01.fw firmware =
(16382 bytes)
> [ 1307.904302] cx23885: cx23885[3]: registered device video3 [v4l2]
> [ 1307.904390] cx23885: cx23885[3]: registered device vbi3
> [ 1307.904614] cx23885: cx23885[3]: alsa: registered ALSA audio device
> [ 1307.904618] cx23885: cx23885_dev_checkrevision() Hardware revision =3D=
 0xd0
> [ 1307.904623] cx23885: cx23885[3]/0: found at 0000:09:00.0, rev: 4, irq:=
 37, latency: 0, mmio: 0xdf200000
> [ 1310.728935] BUG: unable to handle kernel NULL pointer dereference at (=
null)
> [ 1310.728997] IP: [<ffffffffc08bc80d>] set_queue_consistency+0xd/0x40 [v=
ideobuf2_common]
> [ 1310.729051] PGD 800000022000e067 PUD 22000d067 PMD 0
> [ 1310.729110] Oops: 0002 [#1] SMP
> [ 1310.729150] Modules linked in: tuner(OE) cs3308(OE) cx25840(OE) cx2388=
5(OE) videobuf2_dma_sg(OE) videobuf2_dvb(OE) altera_ci(OE) dvb_core(OE) vid=
eobuf2_vmalloc(OE) videobuf2_memops(OE) frame_vector(POE) cx2341x(OE) alter=
a_stapl(OE) tda18271(OE) tveeprom(OE) snd_seq snd_seq_device snd_pcm snd_ti=
mer snd soundcore videobuf2_v4l2(OE) xt_pkttype ip6t_rpfilter ip6t_REJECT n=
f_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ebtable_br=
oute bridge stp llc ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6 nf_nat_ip=
v6 ip6table_mangle ip6table_security ip6table_raw iptable_nat nf_conntrack_=
ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat iptable_mangle iptable_security ipta=
ble_raw nf_conntrack libcrc32c ip_set nfnetlink ebtable_filter ebtables ip6=
table_filter ip6_tables iptable_filter dm_mirror dm_region_hash
> [ 1310.729939] dm_log sb_edac intel_powerclamp coretemp iTCO_wdt intel_ra=
pl iTCO_vendor_support iosf_mbi kvm_intel mxm_wmi kvm irqbypass crc32_pclmu=
l ghash_clmulni_intel aesni_intel ipmi_ssif pcspkr sg joydev i2c_i801 lpc_i=
ch mei_me mei videobuf2_common(OE) rc_core(OE) videodev(OE) mc(OE) ioatdma =
dca ipmi_si ipmi_devintf ipmi_msghandler wmi ip_tables ext4 mbcache jbd2 sr=
_mod cdrom sd_mod crc_t10dif mgag200 i2c_algo_bit drm_kms_helper syscopyare=
a sysfillrect sysimgblt fb_sys_fops ttm isci ahci libsas drm scsi_transport=
_sas libahci e1000e crct10dif_pclmul libata ptp drm_panel_orientation_quirk=
s pps_core authenc cmac zlib wp512 twofish_generic twofish_avx_x86_64 twofi=
sh_x86_64_3way twofish_x86_64 twofish_common tea sha512_ssse3 sha512_generi=
c serpent_avx_x86_64 serpent_sse2_x86_64 serpent_generic seed
> [ 1310.730726] salsa20_generic salsa20_x86_64 rmd320 rmd256 rmd160 rmd128=
 michael_mic md4 khazad ghash_generic gcm fcrypt drbg dm_crypt dm_mod des_g=
eneric deflate cts crypto_null crct10dif_generic crct10dif_common crc32c_in=
tel ccm cast6_avx_x86_64 cast6_generic cast_common camellia_generic camelli=
a_aesni_avx_x86_64 ablk_helper cryptd camellia_x86_64 xts lrw gf128mul glue=
_helper blowfish_generic blowfish_x86_64 blowfish_common arc4 ansi_cprng [l=
ast unloaded: tcrypt]
> [ 1310.731100] CPU: 0 PID: 5200 Comm: ffmpeg Tainted: P OE ------------ 3=
.10.0-1127.18.2.el7.x86_64 #1
> [ 1310.731189] Hardware name: Crystal Group, Inc. X9DRL-3F/iF/X9DRL-3F/iF=
, BIOS 3.0a 08/08/2013
> [ 1310.731262] task: ffff895c3417b150 ti: ffff895c3cf7c000 task.ti: ffff8=
95c3cf7c000
> [ 1310.731328] RIP: 0010:[<ffffffffc08bc80d>] [<ffffffffc08bc80d>] set_qu=
eue_consistency+0xd/0x40 [videobuf2_common]
> [ 1310.734585] RSP: 0018:ffff895c3cf7fbf0 EFLAGS: 00010246
> [ 1310.737760] RAX: 0000000000000000 RBX: ffff895c2ceb6498 RCX: 000000000=
0000000
> [ 1310.740908] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff895c2=
ceb6498
> [ 1310.743965] RBP: ffff895c3cf7fbf0 R08: 0000000000000000 R09: 000000000=
0000000
> [ 1310.746988] R10: 0000000000000000 R11: 0000000000000000 R12: ffff895c3=
cf7fda8
> [ 1310.749965] R13: 0000000000000001 R14: ffff895c2ceb6500 R15: 000000000=
0000001
> [ 1310.752954] FS: 00007f031b0148c0(0000) GS:ffff895c77c00000(0000) knlGS=
:0000000000000000
> [ 1310.755919] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1310.758845] CR2: 0000000000000000 CR3: 0000000274a12000 CR4: 000000000=
01607f0
> [ 1310.761684] Call Trace:
> [ 1310.764500] [<ffffffffc08be7e0>] vb2_core_reqbufs+0x1c0/0x5e0 [videobu=
f2_common]
> [ 1310.767311] [<ffffffffc0b3098b>] vb2_ioctl_reqbufs+0x9b/0xd0 [videobuf=
2_v4l2]
> [ 1310.770069] [<ffffffffc08ec850>] v4l_reqbufs+0x40/0x50 [videodev]
> [ 1310.772897] [<ffffffffc08ebe5e>] __video_do_ioctl+0x38e/0x510 [videode=
v]
> [ 1310.775567] [<ffffffff9080121c>] ? page_add_file_rmap+0x8c/0xc0
> [ 1310.778193] [<ffffffffc08ebad0>] ? v4l_enum_fmt+0x240/0x240 [videodev]
> [ 1310.780904] [<ffffffffc08eea7c>] video_usercopy+0x15c/0x520 [videodev]
> [ 1310.783479] [<ffffffff907ee609>] ? do_read_fault.isra.63+0x139/0x1b0
> [ 1310.786053] [<ffffffff907f5d80>] ? handle_mm_fault+0xa20/0xfb0
> [ 1310.788731] [<ffffffffc08eee55>] video_ioctl2+0x15/0x20 [videodev]
> [ 1310.791260] [<ffffffffc08e50d9>] v4l2_ioctl+0x49/0x60 [videodev]
> [ 1310.793869] [<ffffffff90862890>] do_vfs_ioctl+0x3a0/0x5b0
> [ 1310.796329] [<ffffffff90d8d678>] ? __do_page_fault+0x238/0x500
> [ 1310.798876] [<ffffffff90862b41>] SyS_ioctl+0xa1/0xc0
> [ 1310.801259] [<ffffffff90d92ed2>] system_call_fastpath+0x25/0x2a
> [ 1310.803754] Code: 9b 05 00 00 48 c7 c7 90 11 8c c0 e8 4e f6 dd cf eb e=
a 66 90 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 55 48 8b 47 10 48 89 e=
5 <0f> ba 30 03 f6 47 19 02 74 09 83 bf d0 00 00 00 01 74 08 5d c3
> [ 1310.808952] RIP [<ffffffffc08bc80d>] set_queue_consistency+0xd/0x40 [v=
ideobuf2_common]
> [ 1310.811425] RSP <ffff895c3cf7fbf0>
> [ 1310.813882] CR2: 0000000000000000
> [ 1310.816189] ---[ end trace d8dab7f4f28e4264 ]---
> [ 1312.815578] Kernel panic - not syncing: Fatal exception

As near as I can tell so far, the oops happens somewhere around line
#801 in media_build/linux/drivers/media/common/videobuf2/videobuf2-core.c:
> WARN_ON(q->min_buffers_needed > VB2_MAX_FRAME);

I'm not a kernel driver dev by any stretch, so if anyone has ideas,
I'd love to hear them :)

--=20

Casey Jaymes
Principal Software Engineer
21580 Beaumeade Circle, Suite 230, Ashburn, VA 20147

TeraLogics is a product line within Cubic Corporation=E2=80=99s wholly owne=
d
subsidiary, GATR Technologies, Inc. This email and any attachments may
contain confidential or proprietary information. If you are not the
intended recipient, any use or distribution is prohibited; please
notify the sender and delete from your system.

--0000000000003269f105aed46a4a
Content-Type: text/x-patch; charset="US-ASCII"; name="02stub_of_i2c_h.patch"
Content-Disposition: attachment; filename="02stub_of_i2c_h.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_keuhtubg2>
X-Attachment-Id: f_keuhtubg2

ZGlmZiAtLWdpdCBhL21lZGlhX2J1aWxkL2xpbnV4L2luY2x1ZGUvbGludXgvb2ZfaTJjLmggYi9t
ZWRpYV9idWlsZC9saW51eC9pbmNsdWRlL2xpbnV4L29mX2kyYy5oCmluZGV4IGU2OWRlMjkuLjQ3
NWY2NmUgMTAwNjQ0Ci0tLSBhL21lZGlhX2J1aWxkL2xpbnV4L2luY2x1ZGUvbGludXgvb2ZfaTJj
LmgKKysrIGIvbWVkaWFfYnVpbGQvbGludXgvaW5jbHVkZS9saW51eC9vZl9pMmMuaApAQCAtMCww
ICsxLDE1IEBACisvKgorICogR2VuZXJpYyBJMkMgQVBJIGltcGxlbWVudGF0aW9uIGZvciBQb3dl
clBDLgorICoKKyAqIENvcHlyaWdodCAoYykgMjAwOCBKb2NoZW4gRnJpZWRyaWNoIDxqb2NoZW5A
c2NyYW0uZGU+CisgKgorICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4g
cmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKKyAqIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0
aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CisgKiB0aGUgRnJl
ZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBv
cgorICogKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KKyAqLworCisjaWZuZGVm
IF9fTElOVVhfT0ZfSTJDX0gKKyNkZWZpbmUgX19MSU5VWF9PRl9JMkNfSAorCisjZW5kaWYgLyog
X19MSU5VWF9PRl9JMkNfSCAqLwo=
--0000000000003269f105aed46a4a
Content-Type: text/x-patch; charset="US-ASCII"; name="03compat_h_fixes.patch"
Content-Disposition: attachment; filename="03compat_h_fixes.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_keuhtubs3>
X-Attachment-Id: f_keuhtubs3

ZGlmZiAtLWdpdCBhL21lZGlhX2J1aWxkL3Y0bC9jb21wYXQuaCBiL21lZGlhX2J1aWxkL3Y0bC9j
b21wYXQuaAppbmRleCAwZjE2ZWNjLi44ZTBiYzYyIDEwMDY0NAotLS0gYS9tZWRpYV9idWlsZC92
NGwvY29tcGF0LmgKKysrIGIvbWVkaWFfYnVpbGQvdjRsL2NvbXBhdC5oCkBAIC0yMTI1LDEwICsy
MTI1LDggQEAgc3RhdGljIGlubGluZSBpbnQgZndub2RlX2dyYXBoX3BhcnNlX2VuZHBvaW50KHN0
cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsCiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBmd25vZGVf
aGFuZGxlX2dldChzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlKQogewotfQotCi1zdGF0aWMg
aW5saW5lIHZvaWQgZndub2RlX2hhbmRsZV9wdXQoc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9k
ZSkKLXsKKwlpZiAoaXNfb2Zfbm9kZShmd25vZGUpKQorCQlvZl9ub2RlX2dldCh0b19vZl9ub2Rl
KGZ3bm9kZSkpOwogfQogCiAjZW5kaWYK
--0000000000003269f105aed46a4a
Content-Type: text/x-patch; charset="US-ASCII"; name="04rm_v4.0_dma_buf_export.patch"
Content-Disposition: attachment; filename="04rm_v4.0_dma_buf_export.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_keuhtuc44>
X-Attachment-Id: f_keuhtuc44

ZGlmZiAtLWdpdCBhL21lZGlhX2J1aWxkL2JhY2twb3J0cy9iYWNrcG9ydHMudHh0IGIvbWVkaWFf
YnVpbGQvYmFja3BvcnRzL2JhY2twb3J0cy50eHQKaW5kZXggNDY0NzA3NS4uNzk4ZTlmZSAxMDA2
NDQKLS0tIGEvbWVkaWFfYnVpbGQvYmFja3BvcnRzL2JhY2twb3J0cy50eHQKKysrIGIvbWVkaWFf
YnVpbGQvYmFja3BvcnRzL2JhY2twb3J0cy50eHQKQEAgLTEyOSw3ICsxMjksNiBAQCBhZGQgdjQu
MV9wYXRfZW5hYmxlZC5wYXRjaAogYWRkIHY0LjFfZHJvcF9md25vZGUucGF0Y2gKIAogWzQuMC4y
NTVdCi1hZGQgdjQuMF9kbWFfYnVmX2V4cG9ydC5wYXRjaAogYWRkIHY0LjBfZHJvcF90cmFjZS5w
YXRjaAogYWRkIHY0LjBfZndub2RlLnBhdGNoCg==
--0000000000003269f105aed46a4a
Content-Type: text/x-patch; charset="US-ASCII"; name="00fix_v3.16_wait_on_bit.patch"
Content-Disposition: attachment; filename="00fix_v3.16_wait_on_bit.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_keuhtua70>
X-Attachment-Id: f_keuhtua70

ZGlmZiAtLWdpdCBhL21lZGlhX2J1aWxkL2JhY2twb3J0cy92My4xNl93YWl0X29uX2JpdC5wYXRj
aCBiL21lZGlhX2J1aWxkL2JhY2twb3J0cy92My4xNl93YWl0X29uX2JpdC5wYXRjaAppbmRleCBj
MDcwNWY4Li45N2FmYzE3IDEwMDY0NAotLS0gYS9tZWRpYV9idWlsZC9iYWNrcG9ydHMvdjMuMTZf
d2FpdF9vbl9iaXQucGF0Y2gKKysrIGIvbWVkaWFfYnVpbGQvYmFja3BvcnRzL3YzLjE2X3dhaXRf
b25fYml0LnBhdGNoCkBAIC0xNiwyMSArMTYsMyBAQCBpbmRleCAyZTkwMzEwLi5jMTNlNjA0ZiAx
MDA2NDQKICBzdGF0aWMgaW50IGR2Yl91c2Jfc3RhcnRfZmVlZChzdHJ1Y3QgZHZiX2RlbXV4X2Zl
ZWQgKmR2YmRteGZlZWQpCiAgewogIAlzdHJ1Y3QgZHZiX3VzYl9hZGFwdGVyICphZGFwID0gZHZi
ZG14ZmVlZC0+ZGVtdXgtPnByaXY7Ci1AQCAtMjY2LDcgKzI3Myw3IEBAIHN0YXRpYyBpbnQgZHZi
X3VzYl9zdGFydF9mZWVkKHN0cnVjdCBkdmJfZGVtdXhfZmVlZCAqZHZiZG14ZmVlZCkKLSAJCQlk
dmJkbXhmZWVkLT5waWQsIGR2YmRteGZlZWQtPmluZGV4KTsKLSAKLSAJLyogd2FpdCBpbml0IGlz
IGRvbmUgKi8KLS0Jd2FpdF9vbl9iaXQoJmFkYXAtPnN0YXRlX2JpdHMsIEFEQVBfSU5JVCwgVEFT
S19VTklOVEVSUlVQVElCTEUpOwotKwl3YWl0X29uX2JpdCgmYWRhcC0+c3RhdGVfYml0cywgQURB
UF9JTklULCB3YWl0X3NjaGVkdWxlLCBUQVNLX1VOSU5URVJSVVBUSUJMRSk7Ci0gCi0gCWlmIChh
ZGFwLT5hY3RpdmVfZmUgPT0gLTEpCi0gCQlyZXR1cm4gLUVJTlZBTDsKLUBAIC01NjEsNyArNTY4
LDcgQEAgc3RhdGljIGludCBkdmJfdXNiX2ZlX3NsZWVwKHN0cnVjdCBkdmJfZnJvbnRlbmQgKmZl
KQotIAlpZiAoIWFkYXAtPnN1c3BlbmRfcmVzdW1lX2FjdGl2ZSkgewotIAkJc2V0X2JpdChBREFQ
X1NMRUVQLCAmYWRhcC0+c3RhdGVfYml0cyk7Ci0gCQl3YWl0X29uX2JpdCgmYWRhcC0+c3RhdGVf
Yml0cywgQURBUF9TVFJFQU1JTkcsCi0tCQkJCVRBU0tfVU5JTlRFUlJVUFRJQkxFKTsKLSsJCQkJ
d2FpdF9zY2hlZHVsZSwgVEFTS19VTklOVEVSUlVQVElCTEUpOwotIAl9Ci0gCi0gCWlmIChhZGFw
LT5mZV9zbGVlcFtmZS0+aWRdKSB7Cg==
--0000000000003269f105aed46a4a
Content-Type: text/x-patch; charset="US-ASCII"; name="01fix_v4.9_dvb_net_max_mtu.patch"
Content-Disposition: attachment; filename="01fix_v4.9_dvb_net_max_mtu.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_keuhtub31>
X-Attachment-Id: f_keuhtub31

ZGlmZiAtLWdpdCBhL21lZGlhX2J1aWxkL2JhY2twb3J0cy92NC45X2R2Yl9uZXRfbWF4X210dS5w
YXRjaCBiL21lZGlhX2J1aWxkL2JhY2twb3J0cy92NC45X2R2Yl9uZXRfbWF4X210dS5wYXRjaApp
bmRleCA4OTczMmFjLi5mNDM1ZGRhIDEwMDY0NAotLS0gYS9tZWRpYV9idWlsZC9iYWNrcG9ydHMv
djQuOV9kdmJfbmV0X21heF9tdHUucGF0Y2gKKysrIGIvbWVkaWFfYnVpbGQvYmFja3BvcnRzL3Y0
LjlfZHZiX25ldF9tYXhfbXR1LnBhdGNoCkBAIC0yLDE0ICsyLDYgQEAgZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvZHZiLWNvcmUvZHZiX25ldC5jIGIvZHJpdmVycy9tZWRpYS9kdmItY29yZS9k
dmJfbmV0LmMKIGluZGV4IDhmMTFkN2UuLmRlMjdjMmYgMTAwNjQ0CiAtLS0gYS9kcml2ZXJzL21l
ZGlhL2R2Yi1jb3JlL2R2Yl9uZXQuYwogKysrIGIvZHJpdmVycy9tZWRpYS9kdmItY29yZS9kdmJf
bmV0LmMKLUBAIC0xMzMzLDYgKzEzMzMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG5ldF9kZXZp
Y2Vfb3BzIGR2Yl9uZXRkZXZfb3BzID0gewotIAkubmRvX3N0YXJ0X3htaXQJCT0gZHZiX25ldF90
eCwKLSAJLm5kb19zZXRfcnhfbW9kZQk9IGR2Yl9uZXRfc2V0X211bHRpY2FzdF9saXN0LAotIAku
bmRvX3NldF9tYWNfYWRkcmVzcyAgICA9IGR2Yl9uZXRfc2V0X21hYywKLSsJLm5kb19jaGFuZ2Vf
bXR1CQk9IGV0aF9jaGFuZ2VfbXR1LAotIAkubmRvX3ZhbGlkYXRlX2FkZHIJPSBldGhfdmFsaWRh
dGVfYWRkciwKLSB9OwotIAogQEAgLTEzNDMsNyArMTM0NCw2IEBAIHN0YXRpYyB2b2lkIGR2Yl9u
ZXRfc2V0dXAoc3RydWN0IG5ldF9kZXZpY2UgKmRldikKICAJZGV2LT5oZWFkZXJfb3BzCQk9ICZk
dmJfaGVhZGVyX29wczsKICAJZGV2LT5uZXRkZXZfb3BzCQk9ICZkdmJfbmV0ZGV2X29wczsK
--0000000000003269f105aed46a4a--
