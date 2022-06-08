Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 637465427B0
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 09:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234239AbiFHHp3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 03:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237530AbiFHHGR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 03:06:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97195A3392
        for <linux-media@vger.kernel.org>; Tue,  7 Jun 2022 23:50:15 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC1F880A;
        Wed,  8 Jun 2022 08:50:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654671013;
        bh=65NdSNiELHKueiUl7x38VRHKgv3k2G1AQsVg0Ckg0oE=;
        h=From:To:Cc:Subject:Date:From;
        b=WGQzhfSHpcc69489V0k09/0obEahyvUc8AvtCAOqXpRyeG9034C8q0RQ+kkaIDciP
         8f9eRhgYO74SpeCfsphUjPqWYPJo5ckjddHGRqO6ROCbv3T+gJI+kMpAzSxaTaZK7b
         HMQMb0jE+ym4oC6lnZPX+MG3CwZXbci4VCkN/sWo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@google.com>
Subject: [RFC PATCH v4 0/7] uvcvideo: Fix handling of power_line_frequency
Date:   Wed,  8 Jun 2022 09:49:58 +0300
Message-Id: <20220608065005.23014-1-laurent.pinchart@ideasonboard.com>
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

This series is a new version of "[PATCH v3 0/7] uvcvideo: Fix handling
of power_line_frequency", with an attempt to generalize the
UVC_QUIRK_LIMITED_POWERLINE quirk that it introduced and turn it into a
control mappings override mechanism.

The goal is still to support the UVC 1.5 power line frequency control
extra option (patch 1/7), and work around an issue with devices that do
not implement support for disabling the power line frequency (patches
2/7 to 7/7).

I haven't tested the implementation yet.

Ricardo Ribalda (7):
  media: uvcvideo: Add missing value for power_line_frequency
  media: uvcvideo: Add support for per-device control mapping overrides
  media: uvcvideo: Limit power line control for Quanta UVC Webcam
  media: uvcvideo: Limit power line control for Chicony Easycamera
  media: uvcvideo: Limit power line control for Chicony Easycamera
  media: uvcvideo: Limit power line control for Quanta cameras
  media: uvcvideo: Limit power line control for Acer EasyCamera

 drivers/media/usb/uvc/uvc_ctrl.c   |  79 +++++++++++++++++---
 drivers/media/usb/uvc/uvc_driver.c | 115 +++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |   1 +
 3 files changed, 184 insertions(+), 11 deletions(-)


base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
Regards,

Laurent Pinchart

