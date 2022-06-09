Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA1C5446E6
	for <lists+linux-media@lfdr.de>; Thu,  9 Jun 2022 11:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233724AbiFIJI4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jun 2022 05:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232806AbiFIJIz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jun 2022 05:08:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA0815A26
        for <linux-media@vger.kernel.org>; Thu,  9 Jun 2022 02:08:54 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0A4A6CF;
        Thu,  9 Jun 2022 11:08:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654765733;
        bh=8BAvC4WVWH4WEVVFQMA4Wbh9vbIRZWuBkgdg/LP70OU=;
        h=From:To:Cc:Subject:Date:From;
        b=M9URfZcJ7QFBUfGGgdLJlVXJcfUwMGm5UuDy4cZ7fdzBPT2/8grKUWDXqehcXjspP
         CoorANOTzS5FpElXqAE5DGPY/KhZ6RzwujxsmNEY8Cfj1pLBGyibEtQfh+Ws5kbN3x
         jB4LTWNIpcFpKeGF8tN1/3CGU5hDI055eFGN/DuE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@google.com>
Subject: [PATCH v5 0/7] uvcvideo: Fix handling of power_line_frequency
Date:   Thu,  9 Jun 2022 12:08:36 +0300
Message-Id: <20220609090843.16423-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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

Ricardo, would you be able to test this ?

Ricardo Ribalda (7):
  media: uvcvideo: Add missing value for power_line_frequency
  media: uvcvideo: Add support for per-device control mapping overrides
  media: uvcvideo: Limit power line control for Quanta UVC Webcam
  media: uvcvideo: Limit power line control for Chicony Easycamera
  media: uvcvideo: Limit power line control for Chicony Easycamera
  media: uvcvideo: Limit power line control for Quanta cameras
  media: uvcvideo: Limit power line control for Acer EasyCamera

 drivers/media/usb/uvc/uvc_ctrl.c   | 79 +++++++++++++++++++++++----
 drivers/media/usb/uvc/uvc_driver.c | 87 ++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 156 insertions(+), 11 deletions(-)


base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
Regards,

Laurent Pinchart

