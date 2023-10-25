Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 939A17D6894
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 12:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234777AbjJYKdO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 06:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234538AbjJYKdN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 06:33:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81DC293
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 03:33:11 -0700 (PDT)
Received: from umang.jain (unknown [103.251.226.9])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8B8EBEB;
        Wed, 25 Oct 2023 12:32:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698229977;
        bh=zchdBfdBSrxs9LBFtwEEnlIYbRTUEnSVxqasOdMq3QU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C9wXwlGef6XedHa73XKEI0mbVoYn4ZW/8JcJAmPSrtHUOsoa68WJMPuFLdgq1eVxz
         po1he65cdSDPu3dy70Q9Er7FAcpie3Fb0yqbi2dUtqFQ+fUi/fWD12skxq91Belxz5
         qp0cVhgQcb6QEJTE8wvrDX/Qd0QH3JnKm+0qw32I=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 1/2] staging: vc04_services: Drop completed TODO item
Date:   Wed, 25 Oct 2023 06:32:59 -0400
Message-ID: <20231025103300.340572-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025103300.340572-1-umang.jain@ideasonboard.com>
References: <20231025103300.340572-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop the TODO item which deals with non-essential global
structures and per-device structure. All this has been
handled now through vchiq-bus and struct vchiq_device.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/TODO | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index 6d9d4a800aa7..9c79ed549831 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -46,14 +46,6 @@ The code follows the 80 characters limitation yet tends to go 3 or 4 levels of
 indentation deep making it very unpleasant to read. This is specially relevant
 in the character driver ioctl code and in the core thread functions.
 
-* Get rid of all non essential global structures and create a proper per
-device structure
-
-The first thing one generally sees in a probe function is a memory allocation
-for all the device specific data. This structure is then passed all over the
-driver. This is good practice since it makes the driver work regardless of the
-number of devices probed.
-
 * Clean up Sparse warnings from __user annotations. See
 vchiq_irq_queue_bulk_tx_rx(). Ensure that the address of "&waiter->bulk_waiter"
 is never disclosed to userspace.
-- 
2.41.0

