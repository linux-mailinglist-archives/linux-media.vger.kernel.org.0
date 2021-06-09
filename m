Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32B6D3A18B6
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 17:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232861AbhFIPMX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 11:12:23 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:24009 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232117AbhFIPMU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 11:12:20 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623251242; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=c+iKzrRWBnT7/pukgd6O49Wc/UwSsgEnK/yyguQA1ZlmHnkD112p4Wf6RyknfkVKDe
    QL4qqkh+uviG0KJF7R1GXTIoXmMaw966u4vrjTr34Ud2LtDrIV5LLmUEeI25ZPNOPhyZ
    Tp+BMRZCYFOJ/nRtZm3V68KXVzjc1UfN8ZNaiA2xIC7VBjmt/BFQT8XlE7k16dJEuhB3
    KLUnfEcfPLWm0DQ+c3LqjInTeGcj6EDePDjLHW+yNUqX+vxHj5IOL6EtUAbzYvB6X2nG
    8UJjAjcoL7dAGn/vckd7SAeuJ864Rd1uRZIpR4VhDuJYM0AcPBDI7lGKXasRzDoGZRkn
    qzCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623251242;
    s=strato-dkim-0002; d=strato.com;
    h=Date:Message-ID:Subject:From:Cc:To:Cc:Date:From:Subject:Sender;
    bh=BO+BKjPuvZaCjDqYMPuIuWAcQbl1N+Zcv56LoS4oSZY=;
    b=UAio4N7JlI0u+RfDpXsQ1dIkxZEbrIz3+dw3/TzloSWUTZNJdvX1pWetqcRcpF/PUU
    J+X18oxKrB45mw8krm+0O9y73HEMPnpp74tjV8NP0vcVQ4U8xZTQ3vW4MRdae0fHrcUP
    W4uAItuJ16no0xV/c1sFY2V1d/Hcf2VviLB4IhcLVS3PKCaEVroKy0AIti8hODFP2k3A
    P/MfU92zaoEKKS5SO79ltSDCRiHoW92pK+8Qp02U4ncnW5x7kusbWakNwzLGKUtfwTM7
    C7QVIuleIU8IVlou5NrImrWbBJCbwgT8SgkSSIs1BLYaUQDT57H+fKeBhAZZj4Rb5Ojh
    hhfw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623251242;
    s=strato-dkim-0002; d=jm0.eu;
    h=Date:Message-ID:Subject:From:Cc:To:Cc:Date:From:Subject:Sender;
    bh=BO+BKjPuvZaCjDqYMPuIuWAcQbl1N+Zcv56LoS4oSZY=;
    b=TSYUhk3ZOVxjJlIVTyW384Dyoz0qvbtMCVbFYd73zmHxZ/PH/zwL6g7FjasoWa+Va/
    uIiqKGiuz0Ts0BgcStSltzEjttvb/mURtJHQfKeipIa4nsd4Uv1w8p3yrcN9pVtBdI0g
    C8PBn54n0OBt73ZBH5M0u8UfaVDTzS7mNUSXlzQoLd1o2+1ny0k+lWEK/Ny8kqdaDrZH
    oKXdB9xhASol9I3VwiGt1haKTHRZ5L4Od0zNp1Jnye7u6U3t/n1IoXN2ys1WEgbLzDBZ
    NE+Sxe29OgBv77kgPIwwtx4Jm+6yrnC26jr8MYpRdVIlwHYjc+K8P+N57XgDdg5RKEaN
    vf4Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPXvQCbXgI7t69COvinsMtCHQc3/AhnhpXVQ=="
X-RZG-CLASS-ID: mo00
Received: from [192.168.2.163]
    by smtp.strato.de (RZmta 47.27.2 DYNA|AUTH)
    with ESMTPSA id j09f72x59F7Mb3A
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 9 Jun 2021 17:07:22 +0200 (CEST)
To:     matrandg@cisco.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org
From:   "Ing. Josua Mayer" <josua.mayer@jm0.eu>
Subject: [BUG] tc358743: division by zero
Message-ID: <427466e4-1b6f-f7c3-3d5e-89c7a7f2ec79@jm0.eu>
Date:   Wed, 9 Jun 2021 17:07:22 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear Maintainers,

During my attempts at capturing HDMI via the csi-2 port on i.MX6 
HummingBoard, I triggered a division by zero in 
tc358743_num_csi_lanes_needed!
I am running Debian testing, with linux 5.10.40 - built from debian 
sources with the tc358743 driver enabled:
Linux sr-imx6 5.10.0-7-armmp #1 SMP Debian 5.10.40-2 (2021-05-29) armv7l 
GNU/Linux

The crash is triggered from userspace as I execute:
media-ctl -l "'tc358743 0-000f':0->'imx6-mipi-csi2':0[1]"
media-ctl -l "'imx6-mipi-csi2':1->'ipu1_csi0_mux':0[1]"
media-ctl -l "'ipu1_csi0_mux':2->'ipu1_csi0':0[1]"
media-ctl -l "'ipu1_csi0':2->'ipu1_csi0 capture':0[1]"
v4l2-ctl -d /dev/v4l-subdev7 --set-edid=file=tc358743-edid.hex && sleep 1
v4l2-ctl -d /dev/v4l-subdev7 --set-dv-bt-timings query && sleep 1

[   60.985439] Division by zero in kernel.
[   60.989333] CPU: 1 PID: 395 Comm: v4l2-ctl Tainted: G        WC  E 
  5.10.0-7-armmp #1 Debian 5.10.40-2
[   60.998904] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[   61.005438] Backtrace:
[   61.007911] [<c0cf1fe8>] (dump_backtrace) from [<c0cf2394>] 
(show_stack+0x20/0x24)
[   61.015489]  r7:00000018 r6:600b0013 r5:00000000 r4:c14cdc90
[   61.021162] [<c0cf2374>] (show_stack) from [<c0cf74c4>] 
(dump_stack+0xc8/0xdc)
[   61.028394] [<c0cf73fc>] (dump_stack) from [<c0cf216c>] 
(__div0+0x24/0x28)
[   61.035276]  r7:00000018 r6:034bc000 r5:c1f67890 r4:4f1a0000
[   61.040951] [<c0cf2148>] (__div0) from [<c07b1254>] (Ldiv0+0x8/0x10)
[   61.047336] [<bf412000>] (tc358743_num_csi_lanes_needed [tc358743]) 
from [<bf412a44>] (tc358743_set_csi+0x1c/0x3f0 [tc358743])
[   61.058734]  r9:00000000 r8:c2b8b400 r7:c1f67a59 r6:bf419380 
r5:c1f679e8 r4:c1f67890
[   61.066495] [<bf412a28>] (tc358743_set_csi [tc358743]) from 
[<bf413f64>] (tc358743_s_dv_timings+0x104/0x1a8 [tc358743])
[   61.077283]  r7:c1f67a59 r6:bf419380 r5:c1f679e8 r4:c1f67890
[   61.082961] [<bf413e60>] (tc358743_s_dv_timings [tc358743]) from 
[<c0a79fd4>] (subdev_do_ioctl+0x430/0xd0c)
[   61.092708]  r7:c1f67890 r6:c2ea0780 r5:c2d91c00 r4:c0845657
[   61.098376] [<c0a79ba4>] (subdev_do_ioctl) from [<c0a7a934>] 
(subdev_do_ioctl_lock+0x84/0xb4)
[   61.106909]  r10:c2d91c00 r9:bea08dec r8:c0845657 r7:00000000 
r6:c2d91c00 r5:c2ea0780
[   61.114741]  r4:c2e35000
[   61.117294] [<c0a7a8b0>] (subdev_do_ioctl_lock) from [<c0a6c4b4>] 
(video_usercopy+0x190/0x674)
[   61.125913]  r9:bea08dec r8:c2d91c00 r7:bea08dec r6:c0845657 
r5:00000000 r4:c0845657
[   61.133668] [<c0a6c324>] (video_usercopy) from [<c0a79254>] 
(subdev_ioctl+0x20/0x24)
[   61.141419]  r10:c30372a8 r9:00000003 r8:c2ea0780 r7:bea08dec 
r6:c2ea0780 r5:00000000
[   61.149251]  r4:c0a79234
[   61.151797] [<c0a79234>] (subdev_ioctl) from [<c0a64920>] 
(v4l2_ioctl+0x4c/0x60)
[   61.159207] [<c0a648d4>] (v4l2_ioctl) from [<c05a90ac>] 
(sys_ioctl+0x130/0xa74)
[   61.166520]  r5:00000000 r4:c0845657
[   61.170107] [<c05a8f7c>] (sys_ioctl) from [<c03000c0>] 
(ret_fast_syscall+0x0/0x54)
[   61.177681] Exception stack(0xc48adfa8 to 0xc48adff0)
[   61.182742] dfa0:                   005023a4 004dad3c 00000003 
c0845657 bea08dec 00000000
[   61.190927] dfc0: 005023a4 004dad3c 00000003 00000036 0050c808 
bea09494 bea08fa0 00000000
[   61.199109] dfe0: 00500df8 bea08d2c 004a635d b6cde418
[   61.204169]  r10:00000036 r9:c48ac000 r8:c03002c4 r7:00000036 
r6:00000003 r5:004dad3c
[   61.212000]  r4:005023a4

I am attaching the device-tree changes as a file for reference. Any 
ideas what is happening here?

I can see 2 divisions:
1. pdata->refclk_hz / pdata->pll_prd
2. DIV_ROUND_UP(bps, bps_pr_lane)

1. should never be 0, since it is initialized during probe and then 
never changed

2. see how the divisor can be 0
pdata->refclk_hz / pdata->pll_prd is the inversion of how pll_prd is 
calculated, and should equal to 6MHz from probe.
pll_fbd is also set in probe: pll_fbd = bps_pr_lane / refclk_hz * pll_prd
As I have specified a link-frequency of 594MHz, that produces:
bps_pr_lane = 2 * 594MHz
pll_fbd = 2 * 594MHz / 27MHz * (27MHz / 6MHz) = 2 * 594MHz / 6MHz = 198

Apparently from initialization, the division by zero can not occur :(
(unless I made a mistake here).

Thank you for reading this far!
Yours sincerely
Josua Mayer
