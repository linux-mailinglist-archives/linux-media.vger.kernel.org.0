Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53B247A0C7A
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241312AbjINSRo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241360AbjINSRl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0511B1FD5
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22A7E880D;
        Thu, 14 Sep 2023 20:16:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715363;
        bh=dVzo27U1fckmXfZNhX/gfOgeVTwVutFhXLDw4Igtfbc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WMR5Ph0o1pOt0z+hlndaGfLxwvto27gGYXq5ZO2wnfpUzjEgWIi7cfqhBioWeEM7X
         n+t2Ak8ffdIysJsd4/Vm8vdvyIM7otH0hBz0Be1zghuj7+dqvhKEKNZHMJ4jI48zYn
         YLJPcOaEFXTrNOfECcdbsQtYK+sUFN5hT0GiTYl0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 31/57] Documentation: media: camera-sensor: Fix typo and vocabulary selection
Date:   Thu, 14 Sep 2023 21:16:38 +0300
Message-ID: <20230914181704.4811-32-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop an unneeded double colon, and use 'shall' instead of 'must' for
consistency with the rest of the file.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/driver-api/media/camera-sensor.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index 93f4f2536c25..96cfbc261b6e 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -13,7 +13,7 @@ Handling clocks
 
 Camera sensors have an internal clock tree including a PLL and a number of
 divisors. The clock tree is generally configured by the driver based on a few
-input parameters that are specific to the hardware:: the external clock frequency
+input parameters that are specific to the hardware: the external clock frequency
 and the link frequency. The two parameters generally are obtained from system
 firmware. **No other frequencies should be used in any circumstances.**
 
@@ -123,7 +123,7 @@ Power management
 Always use runtime PM to manage the power states of your device. Camera sensor
 drivers are in no way special in this respect: they are responsible for
 controlling the power state of the device they otherwise control as well. In
-general, the device must be powered on at least when its registers are being
+general, the device shall be powered on at least when its registers are being
 accessed and when it is streaming.
 
 Existing camera sensor drivers may rely on the old
-- 
Regards,

Laurent Pinchart

