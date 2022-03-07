Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC874D05E8
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 19:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244630AbiCGSE4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 13:04:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240475AbiCGSEy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 13:04:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA3666FB0
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 10:03:59 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F715332;
        Mon,  7 Mar 2022 19:03:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646676238;
        bh=pTdkjya5x8cm/yv8AvcBke5oX/fuqddxcmafrVUHEyk=;
        h=From:To:Cc:Subject:Date:From;
        b=FYiq6jhCKo8Guol7ARfcUl0cMMt3WwBe3zIdqy//1E6yKhGAxEVyKNtcy1A2PPt32
         WJey4hROee9Wus0j2B9GYsqAW/MzWRrWTewo2rWpHG1LDkBc15nufUqfKBoyM6ef+a
         DanBNDRtZXkfV0r+JunLNdGykjo/Nzl8Pbz/S2xg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 0/3] [RFC] v4l: Add packed YUV 4:4:4 YUVA and YUVX pixel formats
Date:   Mon,  7 Mar 2022 20:03:39 +0200
Message-Id: <20220307180342.10666-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

This small patch series adds support for two addition YUV 4:4:4 packed
formats. There's nothing very special, but I've marked the patch series
as RFC as the driver which will use this (NXP i.MX8 ISI) is still work
in progress. Review of the pixel formats would however be already
appreciated.

Laurent Pinchart (3):
  media: v4l: Add packed YUV 4:4:4 YUVA and YUVX pixel formats
  media: v4l2-tpg: Add support for the new YUVA and YUVX formats
  media: vivid: Add support for the new YUVA and YUVX formats

 .../media/v4l/pixfmt-packed-yuv.rst           | 20 +++++++++++++++++++
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c |  6 ++++++
 .../test-drivers/vivid/vivid-vid-common.c     | 15 ++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  2 ++
 include/uapi/linux/videodev2.h                |  2 ++
 5 files changed, 45 insertions(+)

-- 
Regards,

Laurent Pinchart

