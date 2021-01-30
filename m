Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB5F309783
	for <lists+linux-media@lfdr.de>; Sat, 30 Jan 2021 19:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhA3SY3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jan 2021 13:24:29 -0500
Received: from mout01.posteo.de ([185.67.36.65]:45753 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229620AbhA3SY3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jan 2021 13:24:29 -0500
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 0689A16005C
        for <linux-media@vger.kernel.org>; Sat, 30 Jan 2021 19:23:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1612031011; bh=PAVtGHP/X3RKa2QIrUVrFSqYCXz1XmMVCSirZqIySLQ=;
        h=From:To:Cc:Subject:Date:From;
        b=GvjFOtwJqwbthmLOXgPINp8I4QkeuepTKPIMRACAiD7+04cvF5fkT+u6peTCu7yP6
         YZCLr94gslPlQ5qyyW2301DSFYPXghrCtKxVL0+m9wi8S3FsrT78EFAqNSKPRPqPt0
         Ck4T6E+Rt10G9WDkLwVjiGStOo6/bOWBbuUkExPZIH0Udp4z+jncXGrsneNCs0pfQE
         8D6Pd2iS04DB1DXEaxbUiHs0/sY4fpYKvQoQMZDZjOrvC5FzasTsl1WuJPMkFQSlVT
         kOenrajh0NuNFJN+0RcXLM5ZO/om83UOBWJSJg99hAjx59BRJM9wneMpndI0DwDr4s
         GClwfIt56NgYQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4DSjJL1FTTz6tmK;
        Sat, 30 Jan 2021 19:23:30 +0100 (CET)
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        sakari.ailus@linux.intel.com,
        Sebastian Fricke <sebastian.fricke@posteo.net>
Subject: [PATCH 0/1] OV13850 image sensor driver
Date:   Sat, 30 Jan 2021 19:23:12 +0100
Message-Id: <20210130182313.32903-1-sebastian.fricke@posteo.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I would like to start a discussion about how I should proceed with the OV13850 driver, which I ported from the Rockchip BSP kernel [1], added new features, and started to refactor. My goal is to merge the driver with the upstream kernel and I would like to maintain it as well.
One of the biggest problems that I am currently facing is the lack of information from Omnivision, I have requested a datasheet but was just brushed aside, as I don't provide enough financial incentive for them :(.

This means there is a list of registers, that I found in the downstream driver, that I cannot locate on the leaked datasheet [2]. I don't have too many experiences in reverse-engineering and so before I spend too much time guessing what these registers do, I thought I might ask here for advice. This is also the major reason for this driver still being register list based, I would really like to change that as register list based drivers feel like big black boxes, especially when access to data-sheets is restricted.

My ultimate goal for this driver would be to switch to register maps instead of raw i2c access, to change the driver from a register list based driver to a freely configurable sensor driver, figure out what the unknown registers do, and drop everything that is not required, and overall improve the driver to correspond with the latest kernel APIs.

Here is a list of things that I currently adjusted:
- Label all registers, that are located on the data-sheet in order to make the code more descriptive on its own
- Add the get_selection subdev IOCTL
- Enable event handling
- Add controls for toggling horizontal mirror and vertical flip
- Remove the Rockchip camera module header file, that was used to add further information about the camera in the device tree, as well user-configurations for AWB. I removed this feature after comparing my driver to multiple drivers and none of the others used a similar mechanism.
- Remove multiple if-guards around code blocks, this change was again inspired by the comparison to other drivers

There are a few things, that I have not been able to test so far, because I lack the proper hardware:
- The full-resolution 4224x3136 as the platform I am working on (rkisp1) only permits resolutions until: 4032x3024
- The r2a register list as my device only fits to r1a

And here is a list of questions, where I hope to find an answer here:
- The datasheet mentions that the FORMAT_0 register can be set to `vbin` and `vbinf`, what does the `f` mean? I have already searched for acronymns but couldn't find anything.
- The datasheet mentions a few registers to configure the white balance manually, I played around with these but couldn't see any visual difference. Does that automatically mean that the datasheet doesn't match the device or is there maybe another mechanism that overwrites my changes? [2] (section 5-9)

[1] - https://github.com/friendlyarm/kernel-rockchip/blob/nanopi4-linux-v4.4.y/drivers/media/i2c/ov13850.c
[2] - http://download.tfirefly.com/product/RK3288/Docs/Peripherals/OV13850%20datasheet/Sensor_OV13850-G04A_OmniVision_SpecificationV1.pdf

By the way, if anyone is interested, I write about my progress with the driver here: https://sebastianfricke.me/porting-the-ov13850-camera/

Sebastian Fricke (1):
  media: i2c: OV13850 image sensor support

 .../bindings/media/i2c/ovti,ov13850.yaml      |  125 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   12 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov13850.c                   | 1774 +++++++++++++++++
 5 files changed, 1920 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov13850.yaml
 create mode 100644 drivers/media/i2c/ov13850.c

-- 
2.25.1

