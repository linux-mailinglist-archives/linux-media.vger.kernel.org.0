Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFC055A79AC
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 11:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbiHaJBn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 05:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiHaJBm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 05:01:42 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB5FB8A50
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 02:01:41 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27V4PZw2001536;
        Wed, 31 Aug 2022 11:01:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=3v/Fw4tg/TJIP+6SsV1WFlX2Q07IqVi7E920Zzk7/Y8=;
 b=0wfBXkPiXO0v5kmIjg81RmQrPcdAeqq9n6axQXJOfL1SgLmaAzK/ItezhFuSSsgOqhPr
 e9R1DPEieM/EQ0I25cmOwP2txnre5FYiUTp8be6sDV2bjV4jV9qDwlYz82fdakt0+kTn
 oEOd0SlYoewVJV3sZcz02K+BbGFZE9e//GKfK8qzqWsAL6AMYg54+ydwDxyXr7tn22oj
 noWqZWTd1VRPwJNelphmgWI/FGj359E8122QRcivxkwrfqgdNFoWzutndBt7isPffPO7
 vWl0qlbC54uTpUycrgpR8HV5JQZZvEGt3A88ecz+j6NgUPCxR7eXUKLubpWyjUDgl9BO YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j9fmy69q2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 31 Aug 2022 11:01:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB43B10002A;
        Wed, 31 Aug 2022 11:01:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9FA4E216ECD;
        Wed, 31 Aug 2022 11:01:27 +0200 (CEST)
Received: from localhost (10.75.127.51) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Wed, 31 Aug
 2022 11:01:27 +0200
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <alain.volmat@foss.st.com>, <hugues.fruchet@foss.st.com>,
        <sylvain.petinot@foss.st.com>, <dave.stevenson@raspberrypi.com>,
        <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v5 0/4] media: Add ST VGXY61 camera sensor driver
Date:   Wed, 31 Aug 2022 11:01:14 +0200
Message-ID: <20220831090118.104057-1-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_05,2022-08-31_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey,

This series adds a driver for the ST VGXY61 camera sensor. This camera sensor is
using the i2c bus for control and the csi-2 bus for data.
These commits introduce the MEDIA_BUS_FMT_Y16_1X16 as a media bus format (1/5),
a standard control in V4L2 for the hdr mode (2/4), dt bindings (3/4), and the
driver (4/4).
Tested on DragonBoard 410c, Raspberry Pi 4, and Qualcomm Robotics RB5.

Thanks,

Benjamin

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

Benjamin Mugnier (4):
  media: v4l: Add 1X16 16-bit greyscale media bus code definition
  media: v4l: ctrls: Add a control for HDR mode
  media: dt-bindings: media: i2c: Add ST VGXY61 camera sensor binding
  media: i2c: Add driver for ST VGXY61 camera sensor

 .../bindings/media/i2c/st,st-vgxy61.yaml      |  117 +
 .../media/v4l/ext-ctrls-camera.rst            |    8 +
 .../media/v4l/subdev-formats.rst              |   37 +
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/st-vgxy61.c                 | 1968 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    2 +
 include/uapi/linux/media-bus-format.h         |    3 +-
 include/uapi/linux/v4l2-controls.h            |    2 +
 10 files changed, 2156 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
 create mode 100644 drivers/media/i2c/st-vgxy61.c

-- 
2.25.1

