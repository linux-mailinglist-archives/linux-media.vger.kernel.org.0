Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF3B43A18EA
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 17:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbhFIPQl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 11:16:41 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:23721 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhFIPQk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 11:16:40 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623251325; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=VowXkwZ18CyCTp6pKAIilKMYGPSisgANmPx/HTL3or7+mROeiubwsOPnCZN1Iuomw7
    yHfCQV6Nz4P5UtDsDSXk0maFvCRaa4t36a2b7ENOBH6KdhWCFIiEI5G2zTC7SXPP9rvu
    7EpYpvXTv0ven5MMo9BbrnvoSYAqYGtsSg6xSjHh4brpf4UbxKqr+KZCw0WMbVsKdGGk
    DooXi54lG05hmQfnf0edvyl4MOcRcMBze7Kwi2g6VLl/IgXYQH3ohwSY1Jstr8qB6o5q
    Z5L460VP14+4/ZeAu3n4PhUdEvvMukuKjvtkDFB0RgZwfPCiAHpqlAZ/Dx9Pk4zKFe2w
    niXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623251325;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=5h3RPOnQMKFxVQxTyn5Kneud6xZuK4PrkjjEfkJ10RM=;
    b=Ey/24OSpIrbAuGFra91Ni9RqOpEl38PrIQfxkubIkzmzlj9EY/W6rsmBYlQrQx1Y1i
    oYXxamkH3m43Z/3FMHp0cx/OSJuLONQT/ShLeVpaHanOoCZMAvjG5UJbwd0GaqmhQ5pR
    Tg83tBBoI77cxf1x75Ewqw4tka4jqJHWFN0cwDOXhgxuEC/VOmINXZRDL5fBbl6zBLAA
    wjbK17Lmky2r7UbZ1sFMw51lvGNhPB2Cxid7cDfMD2vqoy/V5UrOWXFAyCKpYmNOM4c8
    tKy0AWP1nYoWvsmX259LdXrBgZ5WZOJso/IisHoOy+XMzltwV28UpfHHhM6yw5jDmNLd
    6DBw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623251325;
    s=strato-dkim-0002; d=jm0.eu;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=5h3RPOnQMKFxVQxTyn5Kneud6xZuK4PrkjjEfkJ10RM=;
    b=X/LNvepoAJYt5NorEEC8AXHqlD0d8SW88f27HVAZ0vNqwiENrQAhImqgnJehPsAxzh
    Iwzzj6uSg1T30ygX8/Q6DosjMHkw3UtJ7TYe4QijrP4XpxvxknVA9ErJK5417tbMsFwb
    p1fUcuc8KbYbOtLybV1qE4/WYsD/GLfxt7R366V8jTy/UG0XORzd4splmXWAnMjDrSnw
    ct65pqcPGOb3HV9IN6/U5tvCQttIhW5Xn/gFwFK4K9oRnIDUSNFMVCqlBPrjHHpoS2Q5
    hNtfCBbjXFSEaZ9bWQZmIO6O4P8uA3bkf5pydBAktUWEDenWZ/uHgshAlytakxZzMrdG
    AAZQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPXvQCbXgI7t69COvinsMtCHQc3/AhnhpXVQ=="
X-RZG-CLASS-ID: mo00
Received: from [192.168.2.163]
    by smtp.strato.de (RZmta 47.27.2 DYNA|AUTH)
    with ESMTPSA id j09f72x59F8jb3S
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 9 Jun 2021 17:08:45 +0200 (CEST)
Subject: Re: [BUG] tc358743: division by zero
From:   "Ing. Josua Mayer" <josua.mayer@jm0.eu>
To:     matrandg@cisco.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org
References: <427466e4-1b6f-f7c3-3d5e-89c7a7f2ec79@jm0.eu>
Message-ID: <19a143de-818d-4c21-94c1-f4ebf57e3802@jm0.eu>
Date:   Wed, 9 Jun 2021 17:08:45 +0200
MIME-Version: 1.0
In-Reply-To: <427466e4-1b6f-f7c3-3d5e-89c7a7f2ec79@jm0.eu>
Content-Type: multipart/mixed;
 boundary="------------DA678482592461E97E6B4105"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------DA678482592461E97E6B4105
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

and I forgot about the promised dts :( .. I am realyl sorry for spamming 
your mailbox like this ...

Am 09.06.21 um 17:07 schrieb Ing. Josua Mayer:
> Dear Maintainers,
> 
> During my attempts at capturing HDMI via the csi-2 port on i.MX6 
> HummingBoard, I triggered a division by zero in 
> tc358743_num_csi_lanes_needed!
> I am running Debian testing, with linux 5.10.40 - built from debian 
> sources with the tc358743 driver enabled:
> Linux sr-imx6 5.10.0-7-armmp #1 SMP Debian 5.10.40-2 (2021-05-29) armv7l 
> GNU/Linux
> 
> The crash is triggered from userspace as I execute:
> media-ctl -l "'tc358743 0-000f':0->'imx6-mipi-csi2':0[1]"
> media-ctl -l "'imx6-mipi-csi2':1->'ipu1_csi0_mux':0[1]"
> media-ctl -l "'ipu1_csi0_mux':2->'ipu1_csi0':0[1]"
> media-ctl -l "'ipu1_csi0':2->'ipu1_csi0 capture':0[1]"
> v4l2-ctl -d /dev/v4l-subdev7 --set-edid=file=tc358743-edid.hex && sleep 1
> v4l2-ctl -d /dev/v4l-subdev7 --set-dv-bt-timings query && sleep 1
> 
> [   60.985439] Division by zero in kernel.
> [   60.989333] CPU: 1 PID: 395 Comm: v4l2-ctl Tainted: G        WC  E 
>   5.10.0-7-armmp #1 Debian 5.10.40-2
> [   60.998904] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> [   61.005438] Backtrace:
> [   61.007911] [<c0cf1fe8>] (dump_backtrace) from [<c0cf2394>] 
> (show_stack+0x20/0x24)
> [   61.015489]  r7:00000018 r6:600b0013 r5:00000000 r4:c14cdc90
> [   61.021162] [<c0cf2374>] (show_stack) from [<c0cf74c4>] 
> (dump_stack+0xc8/0xdc)
> [   61.028394] [<c0cf73fc>] (dump_stack) from [<c0cf216c>] 
> (__div0+0x24/0x28)
> [   61.035276]  r7:00000018 r6:034bc000 r5:c1f67890 r4:4f1a0000
> [   61.040951] [<c0cf2148>] (__div0) from [<c07b1254>] (Ldiv0+0x8/0x10)
> [   61.047336] [<bf412000>] (tc358743_num_csi_lanes_needed [tc358743]) 
> from [<bf412a44>] (tc358743_set_csi+0x1c/0x3f0 [tc358743])
> [   61.058734]  r9:00000000 r8:c2b8b400 r7:c1f67a59 r6:bf419380 
> r5:c1f679e8 r4:c1f67890
> [   61.066495] [<bf412a28>] (tc358743_set_csi [tc358743]) from 
> [<bf413f64>] (tc358743_s_dv_timings+0x104/0x1a8 [tc358743])
> [   61.077283]  r7:c1f67a59 r6:bf419380 r5:c1f679e8 r4:c1f67890
> [   61.082961] [<bf413e60>] (tc358743_s_dv_timings [tc358743]) from 
> [<c0a79fd4>] (subdev_do_ioctl+0x430/0xd0c)
> [   61.092708]  r7:c1f67890 r6:c2ea0780 r5:c2d91c00 r4:c0845657
> [   61.098376] [<c0a79ba4>] (subdev_do_ioctl) from [<c0a7a934>] 
> (subdev_do_ioctl_lock+0x84/0xb4)
> [   61.106909]  r10:c2d91c00 r9:bea08dec r8:c0845657 r7:00000000 
> r6:c2d91c00 r5:c2ea0780
> [   61.114741]  r4:c2e35000
> [   61.117294] [<c0a7a8b0>] (subdev_do_ioctl_lock) from [<c0a6c4b4>] 
> (video_usercopy+0x190/0x674)
> [   61.125913]  r9:bea08dec r8:c2d91c00 r7:bea08dec r6:c0845657 
> r5:00000000 r4:c0845657
> [   61.133668] [<c0a6c324>] (video_usercopy) from [<c0a79254>] 
> (subdev_ioctl+0x20/0x24)
> [   61.141419]  r10:c30372a8 r9:00000003 r8:c2ea0780 r7:bea08dec 
> r6:c2ea0780 r5:00000000
> [   61.149251]  r4:c0a79234
> [   61.151797] [<c0a79234>] (subdev_ioctl) from [<c0a64920>] 
> (v4l2_ioctl+0x4c/0x60)
> [   61.159207] [<c0a648d4>] (v4l2_ioctl) from [<c05a90ac>] 
> (sys_ioctl+0x130/0xa74)
> [   61.166520]  r5:00000000 r4:c0845657
> [   61.170107] [<c05a8f7c>] (sys_ioctl) from [<c03000c0>] 
> (ret_fast_syscall+0x0/0x54)
> [   61.177681] Exception stack(0xc48adfa8 to 0xc48adff0)
> [   61.182742] dfa0:                   005023a4 004dad3c 00000003 
> c0845657 bea08dec 00000000
> [   61.190927] dfc0: 005023a4 004dad3c 00000003 00000036 0050c808 
> bea09494 bea08fa0 00000000
> [   61.199109] dfe0: 00500df8 bea08d2c 004a635d b6cde418
> [   61.204169]  r10:00000036 r9:c48ac000 r8:c03002c4 r7:00000036 
> r6:00000003 r5:004dad3c
> [   61.212000]  r4:005023a4
> 
> I am attaching the device-tree changes as a file for reference. Any 
> ideas what is happening here?
> 
> I can see 2 divisions:
> 1. pdata->refclk_hz / pdata->pll_prd
> 2. DIV_ROUND_UP(bps, bps_pr_lane)
> 
> 1. should never be 0, since it is initialized during probe and then 
> never changed
> 
> 2. see how the divisor can be 0
> pdata->refclk_hz / pdata->pll_prd is the inversion of how pll_prd is 
> calculated, and should equal to 6MHz from probe.
> pll_fbd is also set in probe: pll_fbd = bps_pr_lane / refclk_hz * pll_prd
> As I have specified a link-frequency of 594MHz, that produces:
> bps_pr_lane = 2 * 594MHz
> pll_fbd = 2 * 594MHz / 27MHz * (27MHz / 6MHz) = 2 * 594MHz / 6MHz = 198
> 
> Apparently from initialization, the division by zero can not occur :(
> (unless I made a mistake here).
> 
> Thank you for reading this far!
> Yours sincerely
> Josua Mayer

--------------DA678482592461E97E6B4105
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ARM-dts-imx6qdl-hummingboard-attach-tc358743-capture.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-ARM-dts-imx6qdl-hummingboard-attach-tc358743-capture.pa";
 filename*1="tch"

From 84b058f6677cda666ae19b5717c8386d63778647 Mon Sep 17 00:00:00 2001
From: Josua Mayer <josua.mayer@jm0.eu>
Date: Wed, 9 Jun 2021 16:43:32 +0200
Subject: [PATCH] ARM: dts: imx6qdl-hummingboard: attach tc358743 capture
 device

---
 arch/arm/boot/dts/imx6qdl-hummingboard.dtsi | 48 +++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi b/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
index 2ffb21dd89f2..f49143344299 100644
--- a/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
@@ -142,6 +142,12 @@ sound-spdif {
 		spdif-controller = <&spdif>;
 		spdif-out;
 	};
+
+	tc358743_clk: bridge-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <27000000>;
+	};
 };
 
 &audmux {
@@ -203,6 +209,27 @@ sgtl5000: codec@a {
 		VDDA-supply = <&v_3v2>;
 		VDDIO-supply = <&v_3v2>;
 	};
+
+	tc358743: capture@f {
+		compatible = "toshiba,tc358743";
+		reg = <0x0f>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hummingboard_mipi>;
+		//clocks = <&clks IMX6QDL_CLK_CKO2>;
+		clocks = <&tc358743_clk>;
+		clock-names = "refclk";
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+
+		port {
+			tc358743_out: endpoint {
+				remote-endpoint = <&mipi_csi2_in>;
+				data-lanes = <1 2>;
+				clock-lanes = <0>;
+				clock-noncontinuous;
+                link-frequencies = /bits/ 64 <594000000>;
+			};
+		};
+	};
 };
 
 &i2c2 {
@@ -247,6 +274,13 @@ MX6QDL_PAD_KEY_ROW3__I2C2_SDA 0x4001b8b1
 			>;
 		};
 
+		pinctrl_hummingboard_mipi: hummingboard_mipi {
+			fsl,pins = <
+				MX6QDL_PAD_SD4_DAT2__GPIO2_IO10 0x4001b8b1
+				MX6QDL_PAD_NANDF_CS2__CCM_CLKO2 0x130b0
+			>;
+		};
+
 		pinctrl_hummingboard_pcie_reset: hummingboard-pcie-reset {
 			fsl,pins = <
 				MX6QDL_PAD_EIM_DA4__GPIO3_IO04 0x1b0b1
@@ -310,6 +344,20 @@ MX6QDL_PAD_DISP0_DAT9__GPIO4_IO30 0x1b0b0
 	};
 };
 
+&mipi_csi {
+	status = "okay";
+
+	port {
+		mipi_csi2_in: endpoint {
+			remote-endpoint = <&tc358743_out>;
+			data-lanes = <1 2 3 4>;
+			clock-lanes = <0>;
+			clock-noncontinuous;
+			link-frequencies = /bits/ 64 <297000000>;
+		};
+	};
+};
+
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hummingboard_pcie_reset>;
-- 
2.31.1


--------------DA678482592461E97E6B4105--
