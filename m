Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3D522A6265
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 11:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729435AbgKDKms (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 05:42:48 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:62407 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729113AbgKDKms (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 05:42:48 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 7981640004;
        Wed,  4 Nov 2020 10:42:41 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v2 29/30] media: ov5647: Constify oe_enable/disable reglist
Date:   Wed,  4 Nov 2020 11:42:38 +0100
Message-Id: <20201104104238.596373-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201104103622.595908-1-jacopo@jmondi.org>
References: <20201104103622.595908-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make the two register-value lists const.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index a89617c113943..eb6e06a013057 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -122,13 +122,13 @@ static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
 	return container_of(sd, struct ov5647, sd);
 }
 
-static struct regval_list sensor_oe_disable_regs[] = {
+static const struct regval_list sensor_oe_disable_regs[] = {
 	{0x3000, 0x00},
 	{0x3001, 0x00},
 	{0x3002, 0x00},
 };
 
-static struct regval_list sensor_oe_enable_regs[] = {
+static const struct regval_list sensor_oe_enable_regs[] = {
 	{0x3000, 0x0f},
 	{0x3001, 0xff},
 	{0x3002, 0xe4},
-- 
2.29.1

