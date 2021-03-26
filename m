Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A680E34A7F4
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 14:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbhCZNTD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 09:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhCZNSt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 09:18:49 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463CDC0613AA
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 06:18:48 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id c8so5598792wrq.11
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 06:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:user-agent:mime-version
         :content-transfer-encoding;
        bh=nncG5ZL2T8Ok1XtJIlotDS0SCsuNcHxyN6tZpJV/+RY=;
        b=vRJTS/irickoFGHO3dkmoXzLqXgJk/fFX9ArSxTEapyPoKNRKopNuUY9CPC/Peiplf
         5XImgpeJfQbH3lexP53NL2iUYJPBWXZXkIk64Iv1zXNTf34XCfKxtSnZByxp+qHJZxJW
         8+k/dGnE/awQNErS0OyFLsrBTLhOkQEe/Bj2/k3xcjXHEAG67Q1B9kQ7mp65/1/j7clk
         lFsQ1SWtQSn72vOU8fyNolH7vMhrmGuliJgacintnqxNI4907HziVUo/CYGbzmJKreH1
         hkzkZW0ptmJt6IaE9GVg+oth2eKMjGf6Bl2ayeNKMnB1+7J7JVywDgCqCCf15LML+Nbm
         bu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:user-agent
         :mime-version:content-transfer-encoding;
        bh=nncG5ZL2T8Ok1XtJIlotDS0SCsuNcHxyN6tZpJV/+RY=;
        b=YTvuuXRhahWGvopx8brm0NfDRCGAw8FiBV3qpSboG7ckPDy6ULApzjqWlRYxBJeIwX
         pJeD/McydQkru2DpZbXF7gNMuIokhMRIC28yrpY4QBacBsVBFtxqPIajfUbvw1LPTo0Z
         vIY6cjNdwiluBJdCNs7um8gs3LgxMy7kmUwu6GMtLZWZW3WbMNILiQDjWfWXqK/gXwr0
         cpptfkvbBYvz95c6UIye2OzNh7MEPt2dQ5R5mcl0wyXh0+hd6h0QaKFYbxXIL9rhykg4
         bO/kNZhX4U/1LKTwCBTY5XqnUEYg9DiQDvLTxRn5TbMICjxE7m3ug6ikbxBJxPkcZ/aG
         1ceg==
X-Gm-Message-State: AOAM531mUi34Fnhz00kzpcHVjLPbBu6/2uZkSV4vvDBWmDIdHqRm3MWI
        l/9FBojY+L2ZbzQeIWGGtuQQ5Q==
X-Google-Smtp-Source: ABdhPJzlcZCG4N8yYFCBCTzDrD5jM+7quwYDg7XjoAWXq9iPrFjTw/JDiYkTRUWTqdvt3QyfXDhLTA==
X-Received: by 2002:a5d:560e:: with SMTP id l14mr14351557wrv.10.1616764726937;
        Fri, 26 Mar 2021 06:18:46 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id a67sm2156902wme.33.2021.03.26.06.18.46
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 26 Mar 2021 06:18:46 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     hverkuil@xs4all.nl, linux-media@vger.kernel.org
Subject: media:v4l2: warn/crash when queueing a request fd
Date:   Fri, 26 Mar 2021 13:18:46 +0000
Message-ID: <rvmr5g18e2qnml1essirj50k58927fetum@4ax.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

I'm getting this WARN/crash. In userland I think I have done a QBUF with
a request fd attached to it and then attempted to Q that request fd.
The request Q fails apparently due to not having any buffers attached
(ENOENT).  This issue is definitely timing related - it comes and goes
depending on threads in userland and debug in kernel.

In this trace I have added debug to bind/unbind s.t. they note where
they were called from and have (<object pointer>-><request pointer>).
I've included enough pre-crash to give an idea of "normal" operation.

[   51.346534] vb2_buffer_done: =
media_request_object_unbind(b6a45cee->2e247a97)
[   51.346546] rpivid feb10000.codec: rpivid_h265_trigger[3]: ok
[   51.346581] v4l2_ctrl_request_bind: =
media_request_object_bind(ddcb80ea->16483e8f)
[   51.346612] media_request_clean: =
media_request_object_unbind(d51a6fb1->2e247a97)
[   51.346652] vb2_core_qbuf: =
media_request_object_bind(f2f16f70->16483e8f)
[   51.346688] rpivid feb10000.codec: rpivid_h265_setup[3]: in
[   51.346765] rpivid feb10000.codec: rpivid_h265_setup[3]: ok
[   51.346774] rpivid feb10000.codec: rpivid_h265_trigger[3]: in
[   51.346781] vb2_buffer_done: =
media_request_object_unbind(f2f16f70->16483e8f)
[   51.346795] rpivid feb10000.codec: rpivid_h265_trigger[3]: ok
[   51.346833] v4l2_ctrl_request_bind: =
media_request_object_bind(d51a6fb1->2e247a97)
[   51.346862] media_request_clean: =
media_request_object_unbind(ddcb80ea->16483e8f)
[   51.346944] vb2_core_qbuf: =
media_request_object_bind(eec00122->2e247a97)
[   51.346976] rpivid feb10000.codec: rpivid_h265_setup[3]: in
[   51.347091] rpivid feb10000.codec: rpivid_h265_setup[3]: ok
[   51.347101] rpivid feb10000.codec: rpivid_h265_trigger[3]: in
[   51.347112] rpivid feb10000.codec: rpivid_h265_trigger[3]: finish
[   51.347137] rpivid feb10000.codec: phase1_claimed[3]: in
[   51.347148] rpivid feb10000.codec: phase1_claimed[3]: ok
[   51.347160] rpivid feb10000.codec: rpivid_h265_trigger[3]: ok
[   51.350794] rpivid feb10000.codec: phase2_cb[2]: in
[   51.350808] rpivid feb10000.codec: phase2_cb[2]: ok
[   51.350816] rpivid feb10000.codec: phase2_claimed[0]: in
[   51.350824] rpivid feb10000.codec: phase2_claimed[0]: ok
[   51.350964] media_request_clean: =
media_request_object_unbind(2f3cc979->73a12cdc)
[   51.352147] v4l2_ctrl_request_bind: =
media_request_object_bind(5d7e78f1->73a12cdc)
[   51.352431] vb2_core_qbuf: =
media_request_object_bind(4c96e91e->73a12cdc)
[   51.352558] rpivid feb10000.codec: rpivid_h265_setup[-1]: in
[   51.352791] rpivid feb10000.codec: rpivid_h265_setup[2]: ok
[   51.352804] rpivid feb10000.codec: rpivid_h265_trigger[2]: in
[   51.352817] vb2_buffer_done: =
media_request_object_unbind(4c96e91e->73a12cdc)
[   51.352866] rpivid feb10000.codec: rpivid_h265_trigger[2]: ok
[   51.352959] v4l2_ctrl_request_bind: =
media_request_object_bind(2f3cc979->16483e8f)
[   51.353043] media_request_clean: =
media_request_object_unbind(5d7e78f1->73a12cdc)
[   51.353272] vb2_core_qbuf: =
media_request_object_bind(2944160e->16483e8f)
[   51.353323] rpivid feb10000.codec: rpivid_h265_setup[2]: in
[   51.353468] rpivid feb10000.codec: rpivid_h265_setup[2]: ok
[   51.353477] rpivid feb10000.codec: rpivid_h265_trigger[2]: in
[   51.353489] vb2_buffer_done: =
media_request_object_unbind(2944160e->16483e8f)
[   51.353518] rpivid feb10000.codec: rpivid_h265_trigger[2]: ok
[   51.353715] v4l2_ctrl_request_bind: =
media_request_object_bind(5d319a04->73a12cdc)
[   51.353799] media_request_clean: =
media_request_object_unbind(2f3cc979->16483e8f)
[   51.353874] vb2_core_qbuf: =
media_request_object_bind(d63748a7->73a12cdc)
[   51.353914] rpivid feb10000.codec: rpivid_h265_setup[2]: in
[   51.354047] rpivid feb10000.codec: rpivid_h265_setup[2]: ok
[   51.354057] rpivid feb10000.codec: rpivid_h265_trigger[2]: in
[   51.354070] vb2_buffer_done: =
media_request_object_unbind(d63748a7->73a12cdc)
[   51.354139] rpivid feb10000.codec: rpivid_h265_trigger[2]: ok
[   51.354235] v4l2_ctrl_request_bind: =
media_request_object_bind(2f3cc979->16483e8f)
[   51.354295] media_request_clean: =
media_request_object_unbind(5d319a04->73a12cdc)
[   51.354407] vb2_core_qbuf: =
media_request_object_bind(b6a45cee->16483e8f)
[   51.354458] rpivid feb10000.codec: rpivid_h265_setup[2]: in
[   51.354615] rpivid feb10000.codec: rpivid_h265_setup[2]: ok
[   51.354625] rpivid feb10000.codec: rpivid_h265_trigger[2]: in
[   51.354638] vb2_buffer_done: =
media_request_object_unbind(b6a45cee->16483e8f)
[   51.354694] rpivid feb10000.codec: rpivid_h265_trigger[2]: ok
[   51.354808] v4l2_ctrl_request_bind: =
media_request_object_bind(5d7e78f1->73a12cdc)
[   51.354840] media_request_clean: =
media_request_object_unbind(2f3cc979->16483e8f)
[   51.354946] vb2_core_qbuf: =
media_request_object_bind(f2f16f70->73a12cdc)
[   51.354987] rpivid feb10000.codec: rpivid_h265_setup[2]: in
[   51.355135] rpivid feb10000.codec: rpivid_h265_setup[2]: ok
[   51.355152] rpivid feb10000.codec: rpivid_h265_trigger[2]: in
[   51.355173] vb2_buffer_done: =
media_request_object_unbind(f2f16f70->73a12cdc)
[   51.355230] rpivid feb10000.codec: rpivid_h265_trigger[2]: ok
[   51.355381] media_request_clean: =
media_request_object_unbind(5d7e78f1->73a12cdc)
[   51.355383] v4l2_ctrl_request_bind: =
media_request_object_bind(2f3cc979->16483e8f)
[   51.355395] v4l2_ctrl_handler_free: =
media_request_object_unbind(2f3cc979->16483e8f)
[   51.355420] v4l2_ctrl_handler_free: =
media_request_object_unbind(07303e82->00000000)
[   51.355428] ------------[ cut here ]------------
[   51.355546] WARNING: CPU: 3 PID: 797 at =
drivers/media/mc/mc-request.c:443 =
media_request_object_unbind__+0x190/0x1ac [mc]
[   51.355563] Modules linked in:
[   51.355573] rpivid feb10000.codec: phase1_cb[3]: in
[   51.355582]  rpcsec_gss_krb5
[   51.355608] vb2_buffer_done: =
media_request_object_unbind(eec00122->2e247a97)
[   51.355613]  fuse
[   51.355623] rpivid feb10000.codec: phase1_cb[3]: ok
[   51.355625]  cmac rfcomm bnep hci_uart btbcm bluetooth
[   51.355681] vb2_core_qbuf: =
media_request_object_bind(4c96e91e->16483e8f)
[   51.355696]  ecdh_generic ecc squashfs
[   51.355735] rpivid feb10000.codec: Missing codec control(s)
[   51.355748]  8021q garp stp llc binfmt_misc snd_usb_audio uvcvideo =
snd_hwdep snd_usbmidi_lib snd_rawmidi brcmfmac snd_seq_device brcmutil =
sha256_generic v3d cfg80211 bcm2835_v4l2(C) gpu_sched vc4 rfkill cec =
rpivid_hevc(C) bcm2835_isp(C) bcm2835_codec(C) videobuf2_vmalloc =
drm_kms_helper bcm2835_mmal_vchiq(C) v4l2_mem2mem videobuf2_dma_contig =
drm videobuf2_memops videobuf2_v4l2 drm_panel_orientation_quirks =
snd_soc_core videobuf2_common vc_sm_cma(C) snd_bcm2835(C) snd_compress =
raspberrypi_hwmon videodev snd_pcm_dmaengine snd_pcm snd_timer mc snd =
syscopyarea sysfillrect sysimgblt fb_sys_fops backlight uio_pdrv_genirq =
uio nvmem_rmem i2c_dev ip_tables x_tables ipv6
[   51.356424] CPU: 3 PID: 797 Comm: ffmpeg Tainted: G         C        =
5.10.20-v7l+ #1
[   51.356432] Hardware name: BCM2711
[   51.356437] Backtrace:=20
[   51.356515] [<c0b86a68>] (dump_backtrace) from [<c0b86df4>] =
(show_stack+0x20/0x24)
[   51.356528]  r7:ffffffff r6:00000000 r5:60000013 r4:c12e6a3c
[   51.356547] [<c0b86dd4>] (show_stack) from [<c0b8b264>] =
(dump_stack+0xc8/0xf4)
[   51.356594] [<c0b8b19c>] (dump_stack) from [<c022100c>] =
(__warn+0xfc/0x114)
[   51.356601]  r10:c1fb9980 r9:bf1ce52c r8:00000009 r7:000001bb =
r6:bf1cc5c0 r5:00000009
[   51.356609]  r4:bf1cec1c r3:c1205094
[   51.356620] [<c0220f10>] (__warn) from [<c0b87574>] =
(warn_slowpath_fmt+0x74/0xe8)
[   51.356628]  r7:bf1cc5c0 r6:000001bb r5:bf1cec1c r4:00000000
[   51.356696] [<c0b87504>] (warn_slowpath_fmt) from [<bf1cc5c0>] =
(media_request_object_unbind__+0x190/0x1ac [mc])
[   51.356745]  r8:bf0d6cf0 r7:c476c230 r6:bf0dd7d8 r5:00000000 =
r4:c476c230
[   51.356972] [<bf1cc430>] (media_request_object_unbind__ [mc]) from =
[<bf0c8c2c>] (v4l2_ctrl_handler_free.part.0+0x178/0x19c [videodev])
[   51.356977]  r7:c476c230 r6:bf0dd7d8 r5:c49d5c80 r4:ef595b80
[   51.357056] [<bf0c8ab4>] (v4l2_ctrl_handler_free.part.0 [videodev]) =
from [<bf0c8cb0>] (v4l2_ctrl_request_release+0x30/0x3c [videodev])
[   51.357066]  r9:bf1ce52c r8:bf1cec3c r7:c4368924 r6:c49d5cd4 =
r5:c49d5cd4 r4:c49d5c80
[   51.357126] [<bf0c8c80>] (v4l2_ctrl_request_release [videodev]) from =
[<bf1cc614>] (media_request_object_release+0x38/0x7c [mc])
[   51.357143]  r5:c49d5cd4 r4:c49d5ce8
[   51.357177] [<bf1cc5dc>] (media_request_object_release [mc]) from =
[<bf1cc81c>] (media_request_clean+0x164/0x198 [mc])
[   51.357199]  r5:c4368930 r4:c4368900
[   51.357238] [<bf1cc6b8>] (media_request_clean [mc]) from [<bf1ccd34>] =
(media_request_ioctl+0x7c/0x264 [mc])
[   51.357262]  r9:0000000a r8:c3677180 r7:00000000 r6:c4368948 =
r5:00000000 r4:c4368900
[   51.357313] [<bf1cccb8>] (media_request_ioctl [mc]) from [<c0454a90>] =
(sys_ioctl+0x120/0x934)
[   51.357331]  r9:0000000a r8:c3677180 r7:00000000 r6:c3677181 =
r5:00000000 r4:00007c81
[   51.357355] [<c0454970>] (sys_ioctl) from [<c0200040>] =
(ret_fast_syscall+0x0/0x28)
[   51.357367] Exception stack(0xc3719fa8 to 0xc3719ff0)
[   51.357373] 9fa0:                   b4d86e60 b4d0b658 0000000a =
00007c81 00000000 00000000
[   51.357381] 9fc0: b4d86e60 b4d0b658 b3e005e0 00000036 b4d0a248 =
00000000 00000000 00000008
[   51.357393] 9fe0: 01031378 b47bae04 00b7c8b0 b67e351c
[   51.357401]  r10:00000036 r9:c3718000 r8:c0200204 r7:00000036 =
r6:b3e005e0 r5:b4d0b658
[   51.357409]  r4:b4d86e60
[   51.357417] ---[ end trace c4fa0858e15f2d90 ]---
[   51.357450] 8<--- cut here ---
[   51.365176] Unable to handle kernel NULL pointer dereference at =
virtual address 00000010
[   51.368351] rpivid feb10000.codec: phase2_cb[0]: in
[   51.368649] rpivid feb10000.codec: phase2_cb[0]: ok
[   51.368655] rpivid feb10000.codec: phase2_claimed[3]: in
[   51.368660] pgd =3D ca2e2346
[   51.369820] rpivid feb10000.codec: phase2_claimed[3]: ok
[   51.369822] [00000010] *pgd=3D04a6a003, *pmd=3D1fff18003
[   51.375411] Internal error: Oops: 207 [#1] SMP ARM
[   51.381315] Modules linked in: rpcsec_gss_krb5 fuse cmac rfcomm bnep =
hci_uart btbcm bluetooth ecdh_generic ecc squashfs 8021q garp stp llc =
binfmt_misc snd_usb_audio uvcvideo snd_hwdep snd_usbmidi_lib snd_rawmidi =
brcmfmac snd_seq_device brcmutil sha256_generic v3d cfg80211 =
bcm2835_v4l2(C) gpu_sched vc4 rfkill cec rpivid_hevc(C) bcm2835_isp(C) =
bcm2835_codec(C) videobuf2_vmalloc drm_kms_helper bcm2835_mmal_vchiq(C) =
v4l2_mem2mem videobuf2_dma_contig drm videobuf2_memops videobuf2_v4l2 =
drm_panel_orientation_quirks snd_soc_core videobuf2_common vc_sm_cma(C) =
snd_bcm2835(C) snd_compress raspberrypi_hwmon videodev snd_pcm_dmaengine =
snd_pcm snd_timer mc snd syscopyarea sysfillrect sysimgblt fb_sys_fops =
backlight
uio_pdrv_genirq uio nvmem_rmem i2c_dev ip_tables x_tables ipv6
[   51.387209] rpivid feb10000.codec: phase2_cb[3]: in
[   51.391276] CPU: 3 PID: 797 Comm: ffmpeg Tainted: G        WC        =
5.10.20-v7l+ #1
[   51.392693] rpivid feb10000.codec: phase2_cb[3]: ok
[   51.394131] Hardware name: BCM2711
[   51.397153] PC is at media_request_object_release+0x30/0x7c [mc]
[   51.398656] LR is at media_request_object_put+0x5c/0x60 [mc]
[   51.400153] pc : [<bf1cc60c>]    lr : [<bf1cc6b4>]    psr: 60000013
[   51.401601] sp : c3719e48  ip : c3719e60  fp : c3719e5c
[   51.402956] r10: c1fb9980  r9 : bf1ce52c  r8 : bf0d6cf0
[   51.404403] r7 : c476c230  r6 : bf0dd7d8  r5 : c476c230  r4 : c476c244
[   51.405827] r3 : 00000000  r2 : 00000001  r1 : 00000000  r0 : c476c230
[   51.407267] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  =
Segment user
[   51.408711] Control: 30c5383d  Table: 03472c00  DAC: 55555555
[   51.410169] Process ffmpeg (pid: 797, stack limit =3D 0x67a17b7e)
[   51.411626] Stack: (0xc3719e48 to 0xc371a000)
[   51.413048] 9e40:                   ef595b80 c49d5c80 c3719e6c =
c3719e60 bf1cc6b4 bf1cc5e8
[   51.414523] 9e60: c3719e94 c3719e70 bf0c8c34 bf1cc664 c49d5c80 =
c49d5cd4 c49d5cd4 c4368924
[   51.416023] 9e80: bf1cec3c bf1ce52c c3719eac c3719e98 bf0c8cb0 =
bf0c8ac0 c49d5ce8 c49d5cd4
[   51.417512] 9ea0: c3719ec4 c3719eb0 bf1cc614 bf0c8c8c c4368900 =
c4368930 c3719eec c3719ec8
[   51.418936] 9ec0: bf1cc81c bf1cc5e8 c4368900 00000000 c4368948 =
00000000 c3677180 0000000a
[   51.420437] 9ee0: c3719f14 c3719ef0 bf1ccd34 bf1cc6c4 00007c81 =
00000000 c3677181 00000000
[   51.421949] 9f00: c3677180 0000000a c3719fa4 c3719f18 c0454a90 =
bf1cccc4 39ef8b00 0002463a
[   51.423474] 9f20: 4b498a8a b47bae28 00000005 c3677180 c0200204 =
b47bae28 00000008 00000000
[   51.425011] 9f40: b47bae28 c0724224 c3719f74 c3719f58 c02a7dcc =
c072420c c3719f74 00000033
[   51.426555] 9f60: 14b13e6c c1205048 c3719fa4 c3719f78 c02ba5bc =
c1205048 00000033 b4d86e60
[   51.428110] 9f80: b4d0b658 b3e005e0 00000036 c0200204 c3718000 =
00000036 00000000 c3719fa8
[   51.429666] 9fa0: c0200040 c045497c b4d86e60 b4d0b658 0000000a =
00007c81 00000000 00000000
[   51.431247] 9fc0: b4d86e60 b4d0b658 b3e005e0 00000036 b4d0a248 =
00000000 00000000 00000008
[   51.432811] 9fe0: 01031378 b47bae04 00b7c8b0 b67e351c 60000010 =
0000000a 00000000 00000000
[   51.434405] Backtrace:=20
[   51.435939] [<bf1cc5dc>] (media_request_object_release [mc]) from =
[<bf1cc6b4>] (media_request_object_put+0x5c/0x60 [mc])
[   51.437558]  r5:c49d5c80 r4:ef595b80
[   51.439225] [<bf1cc658>] (media_request_object_put [mc]) from =
[<bf0c8c34>] (v4l2_ctrl_handler_free.part.0+0x180/0x19c [videodev])
[   51.440956] [<bf0c8ab4>] (v4l2_ctrl_handler_free.part.0 [videodev]) =
from [<bf0c8cb0>] (v4l2_ctrl_request_release+0x30/0x3c [videodev])
[   51.442611]  r9:bf1ce52c r8:bf1cec3c r7:c4368924 r6:c49d5cd4 =
r5:c49d5cd4 r4:c49d5c80
[   51.444324] [<bf0c8c80>] (v4l2_ctrl_request_release [videodev]) from =
[<bf1cc614>] (media_request_object_release+0x38/0x7c [mc])
[   51.446056]  r5:c49d5cd4 r4:c49d5ce8
[   51.447790] [<bf1cc5dc>] (media_request_object_release [mc]) from =
[<bf1cc81c>] (media_request_clean+0x164/0x198 [mc])
[   51.449554]  r5:c4368930 r4:c4368900
[   51.451316] [<bf1cc6b8>] (media_request_clean [mc]) from [<bf1ccd34>] =
(media_request_ioctl+0x7c/0x264 [mc])
[   51.453048]  r9:0000000a r8:c3677180 r7:00000000 r6:c4368948 =
r5:00000000 r4:c4368900
[   51.454843] [<bf1cccb8>] (media_request_ioctl [mc]) from [<c0454a90>] =
(sys_ioctl+0x120/0x934)
[   51.456664]  r9:0000000a r8:c3677180 r7:00000000 r6:c3677181 =
r5:00000000 r4:00007c81
[   51.458476] [<c0454970>] (sys_ioctl) from [<c0200040>] =
(ret_fast_syscall+0x0/0x28)
[   51.460294] Exception stack(0xc3719fa8 to 0xc3719ff0)
[   51.462129] 9fa0:                   b4d86e60 b4d0b658 0000000a =
00007c81 00000000 00000000
[   51.463978] 9fc0: b4d86e60 b4d0b658 b3e005e0 00000036 b4d0a248 =
00000000 00000000 00000008
[   51.465830] 9fe0: 01031378 b47bae04 00b7c8b0 b67e351c
[   51.467676]  r10:00000036 r9:c3718000 r8:c0200204 r7:00000036 =
r6:b3e005e0 r5:b4d0b658
[   51.469466]  r4:b4d86e60
[   51.471341] Code: e3530000 1a000004 e5143014 e1a00005 (e5933010)=20
[   51.473254] ---[ end trace c4fa0858e15f2d91 ]---
[   51.514206] rpivid feb10000.codec: rpivid_h265_stop
[   51.529336] __vb2_queue_cancel: =
media_request_object_unbind(4c96e91e->16483e8f)
[   51.531136] v4l2_ctrl_handler_free: =
media_request_object_unbind(9dd5e62d->72f6f684)
[   51.532868] v4l2_ctrl_handler_free: =
media_request_object_unbind(d51a6fb1->2e247a97)

Many thanks

John Cox
