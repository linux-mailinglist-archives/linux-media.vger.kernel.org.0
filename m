Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835E0360A06
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 15:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbhDONFs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 09:05:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46134 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233075AbhDONFr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 09:05:47 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C87E18EE;
        Thu, 15 Apr 2021 15:05:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618491923;
        bh=93J0hS4nvRi/M/Rc4jdmsdA4cA30Il1NkP2rygAmX6k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Cq+qza0Ga11DfrHegq1979Rt14NiPPSN1kp+4KvjLqgSFtbt4NT0hb7TlDMr19tAb
         b+6KP2HbA0eb5OGO2w6yvY5SrgtUCRwDBbNEAemJ8cJJFVt0Be59zv83ajZkjugtQj
         QHfEDo+FtUf+cRXENYZD0HWIiKb1CdNshtEnWt2k=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v5 17/24] v4l: Add stream to frame descriptor
Date:   Thu, 15 Apr 2021 16:04:43 +0300
Message-Id: <20210415130450.421168-18-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sakari Ailus <sakari.ailus@linux.intel.com>

The stream field identifies the stream this frame descriptor applies to in
routing configuration across a multiplexed link.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 include/media/v4l2-subdev.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 30ec011d31e3..436d0445aafd 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -338,6 +338,7 @@ enum v4l2_mbus_frame_desc_flags {
  * struct v4l2_mbus_frame_desc_entry - media bus frame description structure
  *
  * @flags:	bitmask flags, as defined by &enum v4l2_mbus_frame_desc_flags.
+ * @stream:	stream in routing configuration
  * @pixelcode:	media bus pixel code, valid if @flags
  *		%FRAME_DESC_FL_BLOB is not set.
  * @length:	number of octets per frame, valid if @flags
@@ -347,6 +348,7 @@ enum v4l2_mbus_frame_desc_flags {
  */
 struct v4l2_mbus_frame_desc_entry {
 	enum v4l2_mbus_frame_desc_flags flags;
+	u32 stream;
 	u32 pixelcode;
 	u32 length;
 	union {
-- 
2.25.1

