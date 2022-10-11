Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73B4A5FB1F1
	for <lists+linux-media@lfdr.de>; Tue, 11 Oct 2022 14:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbiJKMEa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Oct 2022 08:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiJKME3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Oct 2022 08:04:29 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E26895CC
        for <linux-media@vger.kernel.org>; Tue, 11 Oct 2022 05:04:24 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B8Wjmd018631;
        Tue, 11 Oct 2022 14:03:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=VaZOx4a0nMd2cmF4X7p+QEM0By51r1CGh1zYvfIKeAo=;
 b=Z2tG4mBrBw8ftGpjWIn9QPOVduQV4TYqYUWoCBmP5gwLNhebTrPKVHLonhxYuuMZrXsk
 DLU3GlFh8Qgh4p9CnPGtPUZTWOR5Rq2pcg5lT3jjN4TbjRTESP77RBAjl1UYGzpZs0Wc
 syv6RSYNZZFbALFE91zzxA3usn4uJrURAnMQsV5NvbNyBE6pmLNofjhA0U42CCgjfJQj
 I8sJ8DesQp/QdiUxvS5uPc4M/nqcZETVqQsGRrdS2xRyj2+EmVV6ZRSDELOItEY/omSG
 xn9XjYBE+AsBqLdUqd7u7lMJ/GEAQToDPb5zm6Ek3AmLYiH+Hi5XR2kWo5hwspSA3CiC hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k31exj0wr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 11 Oct 2022 14:03:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD6AB10002A;
        Tue, 11 Oct 2022 14:03:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B0CAD2248DB;
        Tue, 11 Oct 2022 14:03:47 +0200 (CEST)
Received: from localhost (10.75.127.47) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 11 Oct
 2022 14:03:47 +0200
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <alain.volmat@foss.st.com>, <hugues.fruchet@foss.st.com>,
        <sylvain.petinot@foss.st.com>, <dave.stevenson@raspberrypi.com>,
        <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>, <nicolas@ndufresne.ca>,
        <hverkuil@xs4all.nl>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v7 0/5] media: Add ST VGXY61 camera sensor driver
Date:   Tue, 11 Oct 2022 14:03:33 +0200
Message-ID: <20221011120338.28327-1-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-11_07,2022-10-11_02,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This series adds a driver for the ST VGXY61 camera sensor. This camera sensor is
using the i2c bus for control and the csi-2 bus for data.
These commits introduce the MEDIA_BUS_FMT_Y16_1X16 as a media bus format (1/5),
a standard control in V4L2 for the hdr mode (2/5), dt bindings (3/5), driver
specific documentation for hdr modes (4/5), and the driver (4/5).
Tested on DragonBoard 410c, Raspberry Pi 4, and Qualcomm Robotics RB5.


We discussed a bit about the 'st,strobe-gpios-polarity' in the previous patchset
version (thank you Sakari), but I'm unsure we reached a consensus on this. Feel
free to comment again on the subject. Help is very appreciated.


Thanks,

Benjamin

v6->v7
- Move Y16 format to correct placea bit in its file
- Fix st,strobe-gpios-polarity name not matching dt bindings and comment it
  a bit better
- Add sensor specific driver doc
- Rename control V4L2_CID_HDR_MODE to V4L2_CID_HDR_SENSOR_MODE
- Miscelaneous styling fixes
- Rebase on master

v5->v6:
- Remove slave mode for now
- Comment mipi_margin

v4->v5:
- Fix kernel test robot errors

v3->v4:
- Standardize V4L2_CID_HDR_MODE
- Refactor to 80 characters limit
- Better types handling
- Various others
- Rebase on master

v2->v3:
- Fix errors in dt bindings
- Use alphabetical order where applicable
- Remove US_PER_MS macro
- Rename device specific macros
- Fix some control grabs not releasing
- Move user controls to public header and add documentation
- Rename set_framerate to set_framelength
- Rework i2c access
- Remove branchings that should never happen
- Rework pattern generator setting
- Update information on sensor rules of thumb
- Remove temperature control
- Remove suspend and resume
- Move mutex init to probe
- Move detect to probe
- Fix async_subdev_register order
- Support autosuspend
- Add init_cfg
- Fix controls not updating when sensor was off
- Various cleaning
- Rebase on master

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
  media: v4l: ctrls: Add a control for HDR mode
  media: dt-bindings: Add ST VGXY61 camera sensor binding
  media: Documentation: Add ST VGXY61 driver documentation
  media: i2c: Add driver for ST VGXY61 camera sensor

 .../bindings/media/i2c/st,st-vgxy61.yaml      |  113 +
 .../userspace-api/media/drivers/st-vgxy61.rst |   23 +
 .../media/v4l/ext-ctrls-camera.rst            |    8 +
 .../media/v4l/subdev-formats.rst              |   37 +
 MAINTAINERS                                   |   10 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/st-vgxy61.c                 | 1964 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    2 +
 include/uapi/linux/media-bus-format.h         |    3 +-
 include/uapi/linux/v4l2-controls.h            |    2 +
 11 files changed, 2172 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/st-vgxy61.rst
 create mode 100644 drivers/media/i2c/st-vgxy61.c

-- 
2.25.1

