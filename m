Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6052B195246
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2020 08:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgC0Hp0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Mar 2020 03:45:26 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43353 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgC0Hp0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Mar 2020 03:45:26 -0400
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1jHjgB-0003bY-S2; Fri, 27 Mar 2020 08:45:23 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1jHjgB-0001XL-IC; Fri, 27 Mar 2020 08:45:23 +0100
Date:   Fri, 27 Mar 2020 08:45:23 +0100
From:   Philipp Zabel <pza@pengutronix.de>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     =?utf-8?B?0JzQuNGF0LDQudC70L7QsiDQkNC70LXQutGB0LXQuSDQkNC90LDRgtC+0Ls=?=
         =?utf-8?B?0YzQtdCy0LjRhw==?= <minimumlaw@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: IMX219 MIPI Sensor (meda-tree) with vaniila I.MX6Q media drivers
Message-ID: <20200327074523.GA3412@pengutronix.de>
References: <30c5947f-a026-66a9-75f2-d2531cc73a1e@gmail.com>
 <CAOMZO5B3NXBEmQdUqKDSTYpf=Y5LLZYz7mJLqRMh8T3+O6WvqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5B3NXBEmQdUqKDSTYpf=Y5LLZYz7mJLqRMh8T3+O6WvqA@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:38:01 up 36 days, 15:08, 69 users,  load average: 0.11, 0.16,
 0.11
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, Mar 26, 2020 at 03:56:20PM -0300, Fabio Estevam wrote:
> Adding Steve and Philipp in case they have some ideas.
> 
> 
> On Thu, Mar 26, 2020 at 5:30 AM Михайлов Алексей Анатольевич
> <minimumlaw@gmail.com> wrote:
> >
> > Hi!
> >
> > We build custom CPU Module with NXP/Freescale IMX6QuadPlus CPU.I use
> > latest stable kernel from kernel.org. This time kernel version 5.5.11.
> > Also I connect to I.MX MIPI cameras from RaspberryPI (Rev 2.1 with Sony
> > IMX219). For IMX219 used actual driver from [1]. Usersapce based on
> > Gentoo Linux, have media-utils version 1.2.1, v4l2-utils version 1.18.0,
> > gstreamer version 1.14.5 with v4l2 plugins. Also Wayland version 1.17
> > based graphics with XWayland.
> >
> > Camera write in DTB:
> > ==== cut: DTB fragments ====
> > / {
> > [skiped]
> >         imx219_clk: camera-clk {
> >                 compatible = "fixed-clock";
> >                 #clock-cells = <0>;
> >                 clock-frequency = <24000000>;
> >         };
> >
> >         imx219_1v2_reg: cam1v2_regulator {
> >                 compatible = "regulator-fixed";
> >                 regulator-name = "IMX219_1V2";
> >                 regulator-min-microvolt = <1200000>;
> >                 regulator-max-microvolt = <1200000>;
> >                 vin-supply = <&p3v3_reg>;
> >                 regulator-always-on;
> >         };
> >
> >         imx219_1v8_reg: cam1v8_regulator {
> >                 compatible = "regulator-fixed";
> >                 regulator-name = "IMX219_1V8";
> >                 regulator-min-microvolt = <1800000>;
> >                 regulator-max-microvolt = <1800000>;
> >                 vin-supply = <&p3v3_reg>;
> >                 regulator-always-on;
> >         };
> >
> >         imx219_2v8_reg: cam2v8_regulator {
> >                 compatible = "regulator-fixed";
> >                 regulator-name = "IMX219_2V8";
> >                 regulator-min-microvolt = <2800000>;
> >                 regulator-max-microvolt = <2800000>;
> >                 vin-supply = <&p3v3_reg>;
> >                 regulator-always-on;
> >         };
> > [skiped]
> > csi_i2c: i2c-mux@1 { /* CSI camera */
> >         #address-cells = <1>;
> >         #size-cells = <0>;
> >         reg = <1>;
> >         sensor@10 {     /* Raspberry Camera V2 */
> >                 compatible = "sony,imx219";
> >                 reg = <0x10>;
> >                 #address-cells = <1>;
> >                 #size-cells = <0>;
> >                 clocks = <&imx219_clk>;
> >                 clock-names = "xclk";
> >                 DOVDD-supply = <&imx219_1v8_reg>; /* 1.8v */
> >                 AVDD-supply = <&imx219_2v8_reg>;  /* 2.8v */
> >                 DVDD-supply = <&imx219_1v2_reg>;  /* 1.2v */
> >
> >                 port {
> >                         csi_sensor_out: endpoint {
> >                                 remote-endpoint = <&csi_port_in>;
> >                                 link-frequencies = /bits/ 64 <456000000>;
> >                                 clock-lanes = <0>;
> >                                 data-lanes = <1 2>;
> >                         };
> >                 };
> >         };
> > };
> > [skiped]
> > &mipi_csi {
> >         status = "okay";
> >
> >         port@0 {
> >                 reg = <0>;
> >                 csi_port_in: endpoint {
> >                         remote-endpoint = <&csi_sensor_out>;
> >                         clock-lanes = <0>;
> >                         data-lanes = <1 2>;
> >                 };
> >         };
> > };
> > [skiped]
> > ==== cut: DTB fragments ====
> >
> > I use script for init connected camera
> >
> > ==== cut: Camera init script ===
> > #!/bin/bash
> >
> > # sensor output format and resolutions
> > # RaspberryPI Camera rev 2.1 (Sony I.MX219)
> > I_FORMAT=SRGGB10_1X10
> > I_RESOLUTION=1920x1080
> > CROP=(0,0)/640x480
> >
> > # capture format and resolution
> > O_FORMAT=AYUV32
> > O_RESOLUTION=640x480
> >
> > # viewport format and resolution
> > V_FORMAT=AYUV32
> > V_RESOLUTION=640x480
> >
> > # Reset all media links
> > media-ctl -r
> >
> > # Sersor to IPU and PRP path
> > # RaspberryPI Camera rev 2.1 (Sony I.MX219)
> > media-ctl -l "'imx219 9-0010':0 -> 'imx6-mipi-csi2':0[1]"
> > media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
> > media-ctl -l "'ipu1_csi1':1 -> 'ipu1_ic_prp':0[1]"
> > # media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]" # /dev/video3
> > (unused, unprocessed)
      ^
The IPUv3 IC hardware does not support processing Bayer formats.
Those can only be written straight to RAM using this path.

regards
Philipp
