Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51A645A7FC4
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbiHaOPr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 10:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232040AbiHaOP0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:15:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0736ED7CDF
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:14:31 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B1566D1;
        Wed, 31 Aug 2022 16:14:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661955257;
        bh=Vev/vUgp8AK9H8j/DpkztrcE1d7gbdGXCjAC5ehJ6e8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GD4dPP1a221EWQEPc821LIgV/BoWTWzB0VuVeBkPhYGd7g/1u8RO2gir5gjD9xGyW
         MZxtLJtVmWtxFez3RDI1nahjSfPgEtwY9HeyPFKB/eEPt7mLpEGM6t2L0mr6CPnOsv
         xyBKZFZYPkZposkg5apIcNY/MPbHenw6y5UweZNE=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v14 02/34] media: media-entity.h: add include for min()
Date:   Wed, 31 Aug 2022 17:13:25 +0300
Message-Id: <20220831141357.1396081-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

./include/media/media-entity.h:595:34: error: implicit declaration of function ‘min’

Include minmax.h to get the definition for min().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 include/media/media-entity.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index f16ffe70f7a6..4a67b1dfdc69 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -17,6 +17,7 @@
 #include <linux/fwnode.h>
 #include <linux/list.h>
 #include <linux/media.h>
+#include <linux/minmax.h>
 #include <linux/types.h>
 
 /* Enums used internally at the media controller to represent graphs */
-- 
2.34.1

