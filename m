Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 690E35028CD
	for <lists+linux-media@lfdr.de>; Fri, 15 Apr 2022 13:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352656AbiDOLVp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Apr 2022 07:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351340AbiDOLVh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Apr 2022 07:21:37 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9603C8EB6C
        for <linux-media@vger.kernel.org>; Fri, 15 Apr 2022 04:19:08 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23F8Ukr7008397;
        Fri, 15 Apr 2022 13:19:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=Gvxr9DbtHUuTzXWuAKq4CfdAqsuZDm+koqC16NHxkgg=;
 b=bPzFBxGgdqjneftc83A+vD3sAs150Y7MbXoxxdlYxTWhUi3OfpV8v6CwUJcP0Fdb4KNA
 cTIP8fBBXcnCDZhJmX3jcgt3SnRoQ+6+IFom2zkjqkEbfSIVzuZl6mthQ6ApU7tgHbI8
 oM1cNSfpId3jueTH2pMg84ql4pRZQ5iA0i4RD7kh4zu8RXN3vWeEq76V86gzmI3IHQ62
 YUkSIxduKu6aHjZzZkgN84XgmAvrujyyCzrMKSZDRdqEzwa90EzuDICKtpCf+RKt8rrr
 6jNIljhS1MpZFE59hGAbqyiPoWeIgb8D4yhRWsK3YbsfGERlYg8CgZT5odvI+Rf2g0PT Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fdvj5n8ed-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Apr 2022 13:19:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4032F10002A;
        Fri, 15 Apr 2022 13:19:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D79B21E672;
        Fri, 15 Apr 2022 13:19:00 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE1.st.com (10.75.127.4)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 15 Apr 2022 13:18:59
 +0200
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <alain.volmat@foss.st.com>, <hugues.fruchet@foss.st.com>,
        <sylvain.petinot@foss.st.com>, <dave.stevenson@raspberrypi.com>,
        <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v2 0/5] media: Add ST VGXY61 camera sensor driver
Date:   Fri, 15 Apr 2022 13:18:40 +0200
Message-ID: <20220415111845.27130-1-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-15_04,2022-04-15_01,2022-02-23_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series adds a driver for the ST VGXY61 camera sensor. This camera sensor is using the i2c bus
for control and the csi-2 bus for data.
DT bindings are in 4/5, and the driver in 5/5.
Other commits, in order, introduce the MEDIA_BUS_FMT_Y16_1X16 as a media bus format, a v4l2 standard
control to retrieve sensor temperature, and reserve 16 user controls for the driver (required to set
the HDR mode).
Tested on DragonBoard 410c and on Raspberry Pi 4.

The vblank and hblank support required some work to make sure some v4l2 controls update their
minimum and maximum values to avoid crashing the sensor. This required some time to wrap my head
around, I apologize for the delay.

Here are some observations after the first review:
- The sensor requires patch at boot time. Therefore the pm_runtime power_on function applies the
  patch every time it needs to wake up the sensor. The delay is barely noticeable for the user, and
  we benefit from the power management functionalities.
- After changing wrong SGBRG* media bus formats to proper Y*, as this is a monochrome sensor, I
  noticed that my test target db410c offers limited support for monochrome pixel formats as only
  Y10P pixel format is supported. Moreover, Y10P does not seem to be supported by some viewers
  (qv4l2 for instance returns an unknown pixel format error). v4l-ctl and yavta are doing fine but
  do not offer a video preview, and I couldn't find a tool to unpack the captured packed raw frame.
  As advised by Sakari on irc, adding other monochrome pixel formats to the db410c should not be
  really complicated, neither adding support in v4l-convert for monochrome formats to benefit qv4l2.
  But this leaves me without the ability to preview a video on this specific platform for now on. I
  would like to have your opinions on this matter, maybe I missed something.

Thanks a lot.

v1->v2:
- Move temperature control to v4l2-controls.h as a standard control
- Reserve controls in v4l2-controls.h for HDR control
- Remove GPIO strobbing controls
- Remove references to unused controls in sensor struct
- Use v4l2_find_nearest_size
- Use V4L2_COLORSPACE_RAW instead of V4L2_COLORSPACE_SRGB
- Fill ycbcr_enc, quantization, and xfer_func in v4l2_mbus_framefmt
- Change gain from formula to a register RAW write
- Change temperature control value directly
- Remove clock-name and clock-lanes from device tree bindings
- Declare crop zones in mode_info structure
- Remove frame_interval functions and add hblank and vblank instead
- Update controls dependencies on change
- Fix first exposure rule of thumb being too restrictive
- Disable hflip and vflip controls while streaming
- Change RGB media bus code to Y as the sensor is monochrome
- Add Y16 format to v4l2 media bus formats
- Add get_selection API
- Fix timeout errors while disabling streaming on high framerates
- Support pm_runtime
- Rebase on master

Benjamin Mugnier (5):
  media: v4l: Add 1X16 16-bit greyscale media bus code definition
  media: v4l: ctrls: Add a control for temperature
  media: v4l: ctrls: Add user control base for st-vgxy61 controls
  media: dt-bindings: media: i2c: Add ST VGXY61 camera sensor binding
  media: i2c: Add driver for ST VGXY61 camera sensor

 .../bindings/media/i2c/st,st-vgxy61.yaml      |  125 ++
 .../media/v4l/ext-ctrls-camera.rst            |    3 +
 .../media/v4l/subdev-formats.rst              |   37 +
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/st-vgxy61.c                 | 1997 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    4 +
 include/uapi/linux/media-bus-format.h         |    3 +-
 include/uapi/linux/v4l2-controls.h            |    7 +
 10 files changed, 2195 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
 create mode 100644 drivers/media/i2c/st-vgxy61.c

-- 
2.25.1

