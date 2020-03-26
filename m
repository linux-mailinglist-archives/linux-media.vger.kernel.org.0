Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30E381946BC
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 19:46:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbgCZSp5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 14:45:57 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:35790 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgCZSp5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 14:45:57 -0400
Received: by mail-lj1-f176.google.com with SMTP id k21so7583306ljh.2
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 11:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=1mqLG6QEE+31XTDvw31tXFj2q6Z2VK/8kgCej+OIm6M=;
        b=eJyGO+RWRLZJ+u/1mqi9lq4zYL3OOMS8dUOpnd3uS/wNDdDIFmg77q1Z0Kl0+IbeQQ
         TU+x5EWaBsEy4r1/tMw/xf0MijO/clNPKj7Ieug6jqYL0XFtgl4moP1cc1FlF9AusWkM
         GEwHOdHB9Q5kePag91+l6o9weaTIi867oWWJTGF5dEOZ9RBHJRl1VCSRsEf8yEKN1JdU
         Rw0unDSM4TZPXg7fyO9GYkrAtkVR6mHuKFR90Et34YBGoR7/UnDOaMMJGTzSR7/1KVlz
         c77y8Ph5SZMEcdalWPjdvowkSm/wReBPwmrm5XYzoWqxMKhgLQo/7vOqphDkf3oUsSK5
         vdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=1mqLG6QEE+31XTDvw31tXFj2q6Z2VK/8kgCej+OIm6M=;
        b=VW7rA5cRgUGQKSSfU2SdpP0e+PE1PFqpr0iH7zGuGzYXB+c3xvprw9lF6SqiEdglrR
         uEVbUQztz8NtNErzjAjUipcacie83J0wb8zlgACQFoSt8E3gU5flBhJ0gscspXLYO5Cs
         VkDJ6uJ8abgSnykx3T5YgoxYVK6cMJu+G3a8eY3n0BCRV++cyYOYM4kaeKRLV5T1hC/s
         pKx+SwFCA2/BDXbnJZlS6IO8WjSazyjumfpBYFggM9owefQ/SVn6yMV0qyUgsg/zOQLp
         fXaLwflu0/gDK8Jc1XdTtYuP1MLx3ikyfH+eewrlcX9Ls4khmR+R4lZnoJfB5/5LRikm
         Vbgg==
X-Gm-Message-State: AGi0PuaoMTV6XZKnJZhzl/P3LhcRXCxYhB6ZohcSIVYd95+115VW1RIU
        LwCxw3Rin2aXB9oG1soD/KMzqpad
X-Google-Smtp-Source: APiQypLI/+0pEokTk4cPQfLQUgVfCiGE37LMWBlgstaWHMchIX3Bq7ntX1IfEW8Mriy+DalXa7o/9A==
X-Received: by 2002:a2e:99c8:: with SMTP id l8mr1829016ljj.48.1585248353449;
        Thu, 26 Mar 2020 11:45:53 -0700 (PDT)
Received: from personal.lan ([89.20.14.21])
        by smtp.googlemail.com with ESMTPSA id r10sm1836855ljk.13.2020.03.26.11.45.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2020 11:45:52 -0700 (PDT)
To:     linux-media@vger.kernel.org
From:   Alex Mihaylov <minimumlaw@gmail.com>
Subject: IMX219 MIPI Sensor (meda-tree) with vaniila I.MX6Q media drivers
Message-ID: <c35f4d97-9916-90d2-410c-c9114a1f6dcc@gmail.com>
Date:   Thu, 26 Mar 2020 21:45:52 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: ru
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

We build custom CPU Module with NXP/Freescale IMX6QuadPlus CPU.I use 
latest stable kernel from kernel.org. This time kernel version 5.5.11. 
Also I connect to I.MX MIPI cameras from RaspberryPI (Rev 2.1 with Sony 
IMX219). For IMX219 used actual driver from [1]. Usersapce based on 
Gentoo Linux, have media-utils version 1.2.1, v4l2-utils version 1.18.0, 
gstreamer version 1.14.5 with v4l2 plugins. Also Wayland version 1.17 
based graphics with XWayland.

Camera write in DTB:
==== cut: DTB fragments ====
/ {
[skiped]
     imx219_clk: camera-clk {
         compatible = "fixed-clock";
         #clock-cells = <0>;
         clock-frequency = <24000000>;
     };

     imx219_1v2_reg: cam1v2_regulator {
         compatible = "regulator-fixed";
         regulator-name = "IMX219_1V2";
         regulator-min-microvolt = <1200000>;
         regulator-max-microvolt = <1200000>;
         vin-supply = <&p3v3_reg>;
         regulator-always-on;
     };

     imx219_1v8_reg: cam1v8_regulator {
         compatible = "regulator-fixed";
         regulator-name = "IMX219_1V8";
         regulator-min-microvolt = <1800000>;
         regulator-max-microvolt = <1800000>;
         vin-supply = <&p3v3_reg>;
         regulator-always-on;
     };

     imx219_2v8_reg: cam2v8_regulator {
         compatible = "regulator-fixed";
         regulator-name = "IMX219_2V8";
         regulator-min-microvolt = <2800000>;
         regulator-max-microvolt = <2800000>;
         vin-supply = <&p3v3_reg>;
         regulator-always-on;
     };
[skiped]
csi_i2c: i2c-mux@1 { /* CSI camera */
     #address-cells = <1>;
     #size-cells = <0>;
     reg = <1>;
     sensor@10 {    /* Raspberry Camera V2 */
         compatible = "sony,imx219";
         reg = <0x10>;
         #address-cells = <1>;
         #size-cells = <0>;
         clocks = <&imx219_clk>;
         clock-names = "xclk";
         DOVDD-supply = <&imx219_1v8_reg>; /* 1.8v */
         AVDD-supply = <&imx219_2v8_reg>;  /* 2.8v */
         DVDD-supply = <&imx219_1v2_reg>;  /* 1.2v */

         port {
             csi_sensor_out: endpoint {
                 remote-endpoint = <&csi_port_in>;
                 link-frequencies = /bits/ 64 <456000000>;
                 clock-lanes = <0>;
                 data-lanes = <1 2>;
             };
         };
     };
};
[skiped]
&mipi_csi {
     status = "okay";

     port@0 {
         reg = <0>;
         csi_port_in: endpoint {
             remote-endpoint = <&csi_sensor_out>;
             clock-lanes = <0>;
             data-lanes = <1 2>;
         };
     };
};
[skiped]
==== cut: DTB fragments ====

I use script for init connected camera

==== cut: Camera init script ===
#!/bin/bash

# sensor output format and resolutions
# RaspberryPI Camera rev 2.1 (Sony I.MX219)
I_FORMAT=SRGGB10_1X10
I_RESOLUTION=1920x1080
CROP=(0,0)/640x480

# capture format and resolution
O_FORMAT=AYUV32
O_RESOLUTION=640x480

# viewport format and resolution
V_FORMAT=AYUV32
V_RESOLUTION=640x480

# Reset all media links
media-ctl -r

# Sersor to IPU and PRP path
# RaspberryPI Camera rev 2.1 (Sony I.MX219)
media-ctl -l "'imx219 9-0010':0 -> 'imx6-mipi-csi2':0[1]"
media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
media-ctl -l "'ipu1_csi1':1 -> 'ipu1_ic_prp':0[1]"
# media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]" # /dev/video3 
(unused, unprocessed)
# IPU to capture
media-ctl -l "'ipu1_ic_prp':1 -> 'ipu1_ic_prpenc':0[1]"
media-ctl -l "'ipu1_ic_prpenc':1 -> 'ipu1_ic_prpenc capture':0[1]" # 
/dev/video1
# IPU to viewport
media-ctl -l "'ipu1_ic_prp':2 -> 'ipu1_ic_prpvf':0[1]"
media-ctl -l "'ipu1_ic_prpvf':1 -> 'ipu1_ic_prpvf capture':0[1]" # 
/dev/video2

# RaspberryPI Camera rev 2.1 (Sony I.MX219)
media-ctl -V "'imx219 9-0010':0 [fmt:${I_FORMAT}/${I_RESOLUTION} 
field:none]"
media-ctl -V "'imx6-mipi-csi2':2 [fmt:${I_FORMAT}/${I_RESOLUTION} 
field:none]"
media-ctl -V "'ipu1_csi1':0 [crop:${CROP}]"
media-ctl -V "'ipu1_csi1':1 [fmt:${I_FORMAT}/${O_RESOLUTION} field:none]"

media-ctl -V "'ipu1_ic_prp':1 [fmt:${O_FORMAT}/${O_RESOLUTION} field:none]"
media-ctl -V "'ipu1_ic_prpenc':1 [fmt:${O_FORMAT}/${O_RESOLUTION} 
field:none]"

media-ctl -V "'ipu1_ic_prp':2 [fmt:${V_FORMAT}/${V_RESOLUTION} field:none]"
media-ctl -V "'ipu1_ic_prpvf':1 [fmt:${V_FORMAT}/${V_RESOLUTION} 
field:none]"
==== cut: Camera init script ===

I try start system with V2.1 camera and start capture frames:
[...]
# ./camera_init.sh
# gst-launch-1.0 -v v4l2src device=/dev/video2 ! fakesink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Setting pipeline to PLAYING ...
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps = 
video/x-raw, format=(string)YUY2, framerate=(fraction)30000/1001, 
width=(int)640, height=(int)480, colorimetry=(string)2:4:7:1, 
interlace-mode=(string)progressive
/GstPipeline:pipeline0/GstFakeSink:fakesink0.GstPad:sink: caps = 
video/x-raw, format=(string)YUY2, framerate=(fraction)30000/1001, 
width=(int)640, height=(int)480, colorimetry=(string)2:4:7:1, 
interlace-mode=(string)progressive
New clock: GstSystemClock
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed 
to allocate required memory.
Additional debug info:
/var/tmp/portage/media-plugins/gst-plugins-v4l2-1.14.5/work/gst-plugins-good-1.14.5/sys/v4l2/gstv4l2src.c(656): 
gst_v4l2src_decide_allocation (): 
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Buffer pool activation failed
Execution ended after 0:00:00.014952667
Setting pipeline to PAUSED ...
Setting pipeline to READY ...
Setting pipeline to NULL ...
Freeing pipeline ...
# media-ctl -p
Media controller API version 5.5.13

Media device information
------------------------
driver          imx-media
model           imx-media
serial
bus info
hw revision     0x0
driver version  5.5.13

Device topology
[...]
- entity 15: ipu1_ic_prp (3 pads, 5 links)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev2
         pad0: Sink
                 [fmt:AYUV8_1X32/640x480@1/30 field:none colorspace:srgb 
xfer:srgb ycbcr:601 quantization:full-range]
                 <- "ipu1_csi0":1 []
                 <- "ipu1_vdic":2 []
                 <- "ipu1_csi1":1 [ENABLED]
         pad1: Source
                 [fmt:AYUV8_1X32/640x480@1/30 field:none colorspace:srgb 
xfer:srgb ycbcr:601 quantization:full-range]
                 -> "ipu1_ic_prpenc":0 [ENABLED]
         pad2: Source
                 [fmt:AYUV8_1X32/640x480@1/30 field:none colorspace:srgb 
xfer:srgb ycbcr:601 quantization:full-range]
                 -> "ipu1_ic_prpvf":0 [ENABLED]

- entity 19: ipu1_ic_prpenc (2 pads, 2 links)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev3
         pad0: Sink
                 [fmt:AYUV8_1X32/640x480@1/30 field:none colorspace:srgb 
xfer:srgb ycbcr:601 quantization:full-range]
                 <- "ipu1_ic_prp":1 [ENABLED]
         pad1: Source
                 [fmt:AYUV8_1X32/640x480@1/30 field:none colorspace:srgb 
xfer:srgb ycbcr:601 quantization:lim-range]
                 -> "ipu1_ic_prpenc capture":0 [ENABLED]

- entity 22: ipu1_ic_prpenc capture (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video1
         pad0: Sink
                 <- "ipu1_ic_prpenc":1 [ENABLED]

- entity 28: ipu1_ic_prpvf (2 pads, 2 links)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev4
         pad0: Sink
                 [fmt:AYUV8_1X32/640x480@1001/30000 field:none 
colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
                 <- "ipu1_ic_prp":2 [ENABLED]
         pad1: Source
                 [fmt:AYUV8_1X32/640x480@1001/30000 field:none 
colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
                 -> "ipu1_ic_prpvf capture":0 [ENABLED]

- entity 31: ipu1_ic_prpvf capture (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video2
         pad0: Sink
                 <- "ipu1_ic_prpvf":1 [ENABLED]

- entity 47: ipu1_csi1 (3 pads, 4 links)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev5
         pad0: Sink
                 [fmt:SRGGB10_1X10/1920x1080@1/30 field:none 
colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range
                  crop.bounds:(0,0)/1920x1080
                  crop:(0,0)/640x480
                  compose.bounds:(0,0)/640x480
                  compose:(0,0)/640x480]
                 <- "imx6-mipi-csi2":2 [ENABLED]
         pad1: Source
                 [fmt:SRGGB10_1X10/640x480@1/30 field:none 
colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
                 -> "ipu1_ic_prp":0 [ENABLED]
                 -> "ipu1_vdic":0 []
         pad2: Source
                 [fmt:SRGGB10_1X10/640x480@1/30 field:none 
colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
                 -> "ipu1_csi1 capture":0 []
[...]
- entity 121: imx6-mipi-csi2 (5 pads, 5 links)
               type V4L2 subdev subtype Unknown flags 0
               device node name /dev/v4l-subdev12
         pad0: Sink
                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb 
xfer:srgb ycbcr:601 quantization:full-range]
                 <- "imx219 9-0010":0 [ENABLED]
         pad1: Source
                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb 
xfer:srgb ycbcr:601 quantization:full-range]
                 -> "ipu1_csi0_mux":0 []
         pad2: Source
                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb 
xfer:srgb ycbcr:601 quantization:full-range]
                 -> "ipu1_csi1":0 [ENABLED]
         pad3: Source
                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb 
xfer:srgb ycbcr:601 quantization:full-range]
                 -> "ipu2_csi0":0 []
         pad4: Source
                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb 
xfer:srgb ycbcr:601 quantization:full-range]
                 -> "ipu2_csi1_mux":0 []
[...]
- entity 135: imx219 9-0010 (1 pad, 1 link)
               type V4L2 subdev subtype Sensor flags 0
               device node name /dev/v4l-subdev15
         pad0: Source
                 [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb 
xfer:srgb ycbcr:601 quantization:full-range]
                 -> "imx6-mipi-csi2":0 [ENABLED]
localhost ~ # dmesg -c
[...]
[   51.941858] ipu1_ic_prpvf: pipeline start failed with -32
localhost ~ #

I think EPIPE (-32) caused by link between pad1 ipu1_csi1 
(fmt:SRGGB10_1X10/640x480@1/30) and pad0 ipu1_ic_prp 
(fmt:AYUV8_1X32/640x480@1/30) - format mismatch. But I don't know how 
fix this trouble. Theory, I also have RaspberryPI camera rev 1.3 with 
OmniVision OV5647 camera. Unfortunately, she did not work either.

Anybody can help (fix???) me?

[1] https://git.linuxtv.org/media_tree.git/tree/drivers/media/i2c/imx219.c
