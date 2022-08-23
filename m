Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0CC859CD70
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 02:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234311AbiHWA6f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 20:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbiHWA6d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 20:58:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ADAE1274F
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 17:58:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2C4D2B3;
        Tue, 23 Aug 2022 02:58:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661216307;
        bh=2Scs8Uc8dG9PH+jlHSV2GRsk+ZIjDwfD5ZxT0qFXAyU=;
        h=From:To:Cc:Subject:Date:From;
        b=vvqQ/18r2Wa/Kj/7COrNsVfcf+BBih8YSDUs89IJKVWY/WeY2TNMLFNRh2XBBbfdA
         le9xFZs8eSZM+pZ5PMO8KcGA5dljVVfR4vTLjZmXlH+TBcLDmdAURv3c1dswib15Sw
         w60XtQx6PcqJFXQRHIBMUzfo9DMFKxSSIinsh0vc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 0/2] media: i2c: IMX296 camera sensor support
Date:   Tue, 23 Aug 2022 03:58:20 +0300
Message-Id: <20220823005822.13805-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series adds support for the Sony IMX296 camera sensor driver, with
DT bindings in patch 1/2 and a driver in patch 2/2.

The DT bindings originate from a series posted by Manivannan ([1]). They
have been updated, see patch 1/2 for a detailed changelog.

The most notable changes compared to v2 ([1]) are

- Support for color/monochrome model identification through separate
  compatible strings
- Usage of the V4L2 active subdev state

Other small fixes and improvements are detailed in the changelog of each
patch.

Most review comments frmo v2 have been taken into account. The only
exception is the merge of the imx296_power_on() function with
imx296_runtime_resume() function (and similarly for power off and
runtime suspend) as requested by Sakari. I gave it a try, and it
conflicts with grouping all V4L2 subdev initialization in
imx296_subdev_init(). I really think keeping the functions separate
produces cleaner code, without any drawback.

[1] https://lore.kernel.org/all/20211219220948.28953-1-laurent.pinchart@ideasonboard.com

Laurent Pinchart (1):
  media: i2c: IMX296 camera sensor driver

Manivannan Sadhasivam (1):
  dt-bindings: media: i2c: Add IMX296 CMOS sensor binding

 .../bindings/media/i2c/sony,imx296.yaml       |  106 ++
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   13 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx296.c                    | 1174 +++++++++++++++++
 5 files changed, 1303 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
 create mode 100644 drivers/media/i2c/imx296.c

-- 
Regards,

Laurent Pinchart
