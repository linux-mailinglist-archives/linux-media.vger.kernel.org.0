Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2550E6A1288
	for <lists+linux-media@lfdr.de>; Thu, 23 Feb 2023 23:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjBWWFD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Feb 2023 17:05:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbjBWWFB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Feb 2023 17:05:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1CE2A16F
        for <linux-media@vger.kernel.org>; Thu, 23 Feb 2023 14:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677189856;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=bPJc+u0iGTN6efM8qW4sMasthQClcJG4LjrvxwrsxW8=;
        b=E1zyy74U6fnjYfkWBlVBGStwR6N0vIh9uqL1hbK/tWsx83JiNGqwPCvbKGf3yP+Zb4GGTO
        qIiYcGAeSbQzn9y+Oqg9l241jiJgV9sYFUX/txtWfirJ7M6vIbnNy17TkC5gv79ZmBtDGz
        kNxhRcwKEYP5/mG0ZZlPA+5ZbVUC0MI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-g2RY7d85PGiyOEMeemvkrQ-1; Thu, 23 Feb 2023 17:04:15 -0500
X-MC-Unique: g2RY7d85PGiyOEMeemvkrQ-1
Received: by mail-ed1-f69.google.com with SMTP id ck7-20020a0564021c0700b004a25d8d7593so16034301edb.0
        for <linux-media@vger.kernel.org>; Thu, 23 Feb 2023 14:04:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bPJc+u0iGTN6efM8qW4sMasthQClcJG4LjrvxwrsxW8=;
        b=EB+5mrxRNJwML2u0M1fq6Qw7sjBii/rPEEBcXoGrOlUZyOqU7iQfdB6PP9eC9W8hZ7
         YN/2z57jfspRnhbIiLqp9lJZgnMz8N+dlVnzxtuqDri0F4a+rETwWUnB4F83MoE+RIv1
         qJAJpOYH++I17r2q9cstDi8Iz2Za7WSbTJ0Ib1q8wsKSdOUTMd21oN+XsehtaKY4e5IN
         R2RPGD9QXCgwhscb/z4driwBQv+3c8Ym8uV46QzxVqBQkQNwjGchd0cB8L5wxuhKh30C
         CuY2X2kcKPn0zPSPCWqTmdw0gT5C9uIJQya6vXg+Km3gtPa6IJpIdq7tIAJMkjp3Iaob
         SKtQ==
X-Gm-Message-State: AO0yUKWkXtoYkHPItdRV9uws/RNjXc6CIJjwPWdfS94GhURSurwdcNcZ
        noYCg4G3goFJxQa4yqBYogXAb3vchFEp0Kk4+p5Kgl9JbJ7SYzSzgvjtvBuQsqc4+QaHsWrDFO4
        FGiIVemZx1n4+89XkXxsS6zyk/lrb
X-Received: by 2002:a17:906:3792:b0:8a4:7fb9:5658 with SMTP id n18-20020a170906379200b008a47fb95658mr21133978ejc.55.1677189853620;
        Thu, 23 Feb 2023 14:04:13 -0800 (PST)
X-Google-Smtp-Source: AK7set9jvg+3aHp+7/riBVTbz4PZnaxL8Kl4oxcDGEcb7faspFX3j/PL1eWFVkD/v9LBTyHy8BDC0Q==
X-Received: by 2002:a17:906:3792:b0:8a4:7fb9:5658 with SMTP id n18-20020a170906379200b008a47fb95658mr21133961ejc.55.1677189853294;
        Thu, 23 Feb 2023 14:04:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u20-20020a1709064ad400b008d21431e705sm5673200ejt.84.2023.02.23.14.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 14:04:12 -0800 (PST)
Message-ID: <441f2951-402b-0f3c-5ea6-8d6df3f3e894@redhat.com>
Date:   Thu, 23 Feb 2023 23:04:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US, nl
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: IPU3 cameras not working with latest kernel code ?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

While trying to test Kate's tps68470 patches for the privacy LED
on the back of the Surface Go 1/2 I hit this oops when trying
to run qcam:

[  162.502551] BUG: unable to handle page fault for address: 000000010000=
008f
[  162.502561] #PF: supervisor read access in kernel mode
[  162.502566] #PF: error_code(0x0000) - not-present page
[  162.502570] PGD 0 P4D 0=20
[  162.502577] Oops: 0000 [#1] PREEMPT SMP PTI
[  162.502583] CPU: 3 PID: 2030 Comm: qcam Tainted: G         C         6=
=2E2.0+ #132
[  162.502589] Hardware name: Microsoft Corporation Surface Go/Surface Go=
, BIOS 1.0.30 12/22/2020
[  162.502593] RIP: 0010:v4l2_subdev_link_validate+0x12a/0x1b0 [videodev]=

[  162.502631] Code: ed 74 56 8b 0d 53 c8 59 f0 85 c9 75 1d 48 8b bd 90 0=
0 00 00 31 f6 e8 95 bc 5d ef 48 89 df e8 5d fc ff ff 89 c3 e9 5b ff ff ff=
 <48> 8b bd 90 00 00 00 be ff ff ff ff 48 83 c7 68 e8 b1 d2 5c ef 83
[  162.502637] RSP: 0018:ffffb65766b93bb8 EFLAGS: 00010202
[  162.502642] RAX: ffff95d443bf0b18 RBX: ffff95d46a84a3c0 RCX: 000000000=
0000001
[  162.502646] RDX: 0000000000000001 RSI: 610f11f85a19d2aa RDI: ffff95d46=
a84a3c0
[  162.502650] RBP: 00000000ffffffff R08: 0000000000000004 R09: ffff95d44=
3bf3f40
[  162.502654] R10: 0000000000000004 R11: 000000000c3a0bc4 R12: 000000000=
0000000
[  162.502657] R13: ffff95d443bf04e8 R14: ffff95d443bf3de8 R15: ffff95d44=
3bf3f40
[  162.502661] FS:  00007f8181d9e6c0(0000) GS:ffff95d4aad80000(0000) knlG=
S:0000000000000000
[  162.502666] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  162.502670] CR2: 000000010000008f CR3: 000000014506e003 CR4: 000000000=
03706e0
[  162.502675] Call Trace:
[  162.502678]  <TASK>
[  162.502685]  __media_pipeline_start+0x505/0x6f0 [mc]
[  162.502710]  media_pipeline_start+0x32/0x50 [mc]
[  162.502728]  imgu_vb2_start_streaming+0x90/0x270 [ipu3_imgu]
[  162.502750]  vb2_start_streaming+0x6d/0x120 [videobuf2_common]
[  162.502767]  vb2_core_streamon+0xa4/0x100 [videobuf2_common]
[  162.502782]  __video_do_ioctl+0x18b/0x3c0 [videodev]
[  162.502822]  video_usercopy+0x2b9/0x8f0 [videodev]
[  162.502852]  ? __pfx___video_do_ioctl+0x10/0x10 [videodev]
[  162.502895]  ? lock_release+0x135/0x2d0
[  162.502911]  v4l2_ioctl+0x46/0x50 [videodev]
[  162.502937]  __x64_sys_ioctl+0x8d/0xd0
[  162.502946]  do_syscall_64+0x58/0x80
[  162.502956]  ? do_syscall_64+0x67/0x80
[  162.502962]  ? lockdep_hardirqs_on+0x7d/0x100
[  162.502969]  ? do_syscall_64+0x67/0x80
[  162.502975]  ? do_syscall_64+0x67/0x80
[  162.502982]  ? asm_exc_page_fault+0x22/0x30
[  162.502991]  ? lockdep_hardirqs_on+0x7d/0x100
[  162.502997]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
[  162.503004] RIP: 0033:0x7f8194b23baf
[  162.503010] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 0=
0 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05=
 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[  162.503015] RSP: 002b:00007f8181d9c460 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000010
[  162.503021] RAX: ffffffffffffffda RBX: 00007f8178011120 RCX: 00007f819=
4b23baf
[  162.503025] RDX: 00007f8178011350 RSI: 0000000040045612 RDI: 000000000=
0000010
[  162.503028] RBP: 00007f8178010bd0 R08: 00007f817800db10 R09: 00007f817=
8016670
[  162.503032] R10: 0000000000000000 R11: 0000000000000246 R12: 00007f817=
80127f0
[  162.503035] R13: 00007f8178010ab0 R14: 00007f8178010bd0 R15: 00007f817=
8012950
[  162.503050]  </TASK>
[  162.503053] Modules linked in: rfcomm snd_seq_dummy snd_hrtimer snd_so=
f_pci_intel_skl snd_sof_intel_hda_common bnep soundwire_intel soundwire_g=
eneric_allocation soundwire_cadence snd_sof_intel_hda snd_sof_pci snd_sof=
_xtensa_dsp snd_sof dw9719 snd_sof_utils soundwire_bus mei_pxp mei_hdcp s=
nd_soc_avs snd_soc_hda_codec gpio_tps68470 intel_rapl_msr snd_soc_skl snd=
_soc_hdac_hda snd_hda_ext_core snd_soc_sst_ipc snd_hda_codec_hdmi snd_soc=
_sst_dsp snd_soc_acpi_intel_match snd_hda_codec_realtek snd_soc_acpi snd_=
hda_codec_generic ledtrig_audio qrtr snd_soc_core snd_compress ac97_bus i=
ntel_tcc_cooling snd_pcm_dmaengine x86_pkg_temp_thermal intel_powerclamp =
coretemp snd_hda_intel snd_intel_dspcfg kvm_intel ath10k_pci snd_intel_sd=
w_acpi ath10k_core kvm snd_hda_codec irqbypass rapl intel_cstate intel_un=
core mac80211 snd_hda_core btusb snd_hwdep snd_seq btrtl snd_seq_device b=
tbcm intel_wmi_thunderbolt libarc4 pcspkr snd_pcm btintel ath btmtk bluet=
ooth cfg80211 snd_timer snd hid_sensor_als
[  162.503166]  hid_sensor_rotation hid_sensor_gyro_3d hid_sensor_accel_3=
d ecdh_generic soundcore joydev hid_sensor_trigger hid_sensor_iio_common =
industrialio_triggered_buffer kfifo_buf rfkill industrialio intel_xhci_us=
b_role_switch ipu3_imgu(C) ipu3_cio2 processor_thermal_device_pci_legacy =
processor_thermal_device processor_thermal_rfim processor_thermal_mbox vi=
deobuf2_dma_sg mei_me videobuf2_memops mei processor_thermal_rapl intel_r=
apl_common videobuf2_v4l2 videobuf2_common intel_soc_dts_iosf idma64 inte=
l_pch_thermal intel_skl_int3472_tps68470 leds_tps68470 tps68470_regulator=
 clk_tps68470 ov5693 soc_button_array vfat ov7251 fat ov8865 v4l2_fwnode =
v4l2_async intel_skl_int3472_discrete videodev int3403_thermal mc int340x=
_thermal_zone intel_hid int3400_thermal sparse_keymap acpi_thermal_rel ac=
pi_pad zram hid_sensor_hub intel_ishtp_hid i915 mmc_block crct10dif_pclmu=
l crc32_pclmul crc32c_intel drm_buddy drm_display_helper sdhci_pci cqhci =
rtsx_pci_sdmmc sdhci cec intel_ish_ipc ucsi_acpi
[  162.503269]  ghash_clmulni_intel hid_multitouch sha512_ssse3 typec_ucs=
i serio_raw mmc_core intel_ishtp rtsx_pci ttm typec i2c_hid_acpi i2c_hid =
video wmi pinctrl_sunrisepoint ip6_tables ip_tables i2c_dev fuse
[  162.503304] CR2: 000000010000008f
[  162.503309] ---[ end trace 0000000000000000 ]---
[  162.503313] RIP: 0010:v4l2_subdev_link_validate+0x12a/0x1b0 [videodev]=

[  162.503347] Code: ed 74 56 8b 0d 53 c8 59 f0 85 c9 75 1d 48 8b bd 90 0=
0 00 00 31 f6 e8 95 bc 5d ef 48 89 df e8 5d fc ff ff 89 c3 e9 5b ff ff ff=
 <48> 8b bd 90 00 00 00 be ff ff ff ff 48 83 c7 68 e8 b1 d2 5c ef 83
[  162.503351] RSP: 0018:ffffb65766b93bb8 EFLAGS: 00010202
[  162.503356] RAX: ffff95d443bf0b18 RBX: ffff95d46a84a3c0 RCX: 000000000=
0000001
[  162.503360] RDX: 0000000000000001 RSI: 610f11f85a19d2aa RDI: ffff95d46=
a84a3c0
[  162.503363] RBP: 00000000ffffffff R08: 0000000000000004 R09: ffff95d44=
3bf3f40
[  162.503366] R10: 0000000000000004 R11: 000000000c3a0bc4 R12: 000000000=
0000000
[  162.503370] R13: ffff95d443bf04e8 R14: ffff95d443bf3de8 R15: ffff95d44=
3bf3f40
[  162.503373] FS:  00007f8181d9e6c0(0000) GS:ffff95d4aad80000(0000) knlG=
S:0000000000000000
[  162.503378] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  162.503381] CR2: 000000010000008f CR3: 000000014506e003 CR4: 000000000=
03706e0

Note this is with a 6.2 kernel with:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=3D=
media-atomisp

merged into it, which brings in most of media_stage.git/master, so chance=
s are
this is caused by some of recent v4l2-core changes heading towards 6.3 .

I have checked if later media_stage.git/master changes may fix this,
but the only possibly relevant from after I rebased my media-atomisp
on top of media_stage.git/master is:

https://git.linuxtv.org/media_stage.git/commit/?id=3Da967a3a788028f541e4d=
b54beabcebc3648997db

which does not directly seem likes a likely candidate for this.

Before I spend time on debugging this I was wondering if anyone has any
idea of what might be going on here ?

Also note that the invalid pointer causing this does not look like
a pointer at all, it looks more like 2 32 bit int fields to me?  :

"BUG: unable to handle page fault for address: 000000010000008f"

Regards,

Hans




