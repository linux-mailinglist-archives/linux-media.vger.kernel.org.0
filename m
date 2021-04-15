Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD71D360A0D
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 15:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233099AbhDONFy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 09:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233100AbhDONFx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 09:05:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C04BC061756
        for <linux-media@vger.kernel.org>; Thu, 15 Apr 2021 06:05:30 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABD27A2A;
        Thu, 15 Apr 2021 15:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618491929;
        bh=NV1PuPF2La9n5Q/z8RDEcXS090ZGo5EUAD+q7O+SEBY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UebAXnkdnR2pXbb4NQ6GbTDK5gPm00pisRltrzGGFze8KpTURU/y2LSCk8uVNaLo9
         sg0jbJxL3YWlo8v9wHBreWcfkXxhB6URjth7Mo17UGVsGMviXbIJvQ0GKN6TwqngdX
         +kdpWlB/r6CfBcr9676f13ItsQASptcGU3Qb83ok=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 24/24] v4l: subdev: increase V4L2_FRAME_DESC_ENTRY_MAX to 8
Date:   Thu, 15 Apr 2021 16:04:50 +0300
Message-Id: <20210415130450.421168-25-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2_FRAME_DESC_ENTRY_MAX is currently set to 4. In theory it's possible
to have an arbitrary amount of streams in a single pad, so preferably
there should be no hardcoded maximum number.

However, I believe a reasonable max is 8, which would cover a CSI-2 pad
with 4 streams of pixel data and 4 streams of metadata.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 730631f9a091..49969d3699cb 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -356,7 +356,7 @@ struct v4l2_mbus_frame_desc_entry {
 	} bus;
 };
 
-#define V4L2_FRAME_DESC_ENTRY_MAX	4
+#define V4L2_FRAME_DESC_ENTRY_MAX	8
 
 enum v4l2_mbus_frame_desc_type {
 	V4L2_MBUS_FRAME_DESC_TYPE_PLATFORM,
-- 
2.25.1

