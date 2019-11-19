Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F185810224A
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 11:51:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbfKSKvW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 05:51:22 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:58609 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726510AbfKSKvV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 05:51:21 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7])
        by smtp-cloud7.xs4all.net with ESMTPA
        id X16MiClSQcs92X16NiynXo; Tue, 19 Nov 2019 11:51:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574160680; bh=MlggBG+CD7fPcgJTp67HpQHeT5mQfD9yxA6YaGd7pwY=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=GXa4/IdM8oC+1fYL6DBlqHKmv4l/OieqaZAJ6jtxXZ+U7MjN5h1a+tIOpddvuNMja
         GkhEjw8SPnyCcGtFct5tVrmBFaxg75TsDYtDyPzgst616H8Zqrn5Ag27sES3Wn/6ax
         jUSaPBEgrAmOl0gVPaGF8Bxxza2ys2vPhJdnHl1mviKCaSBly600zSd6goiQ/8ZEEG
         oCH/NEJeJua7CQ+37hBuFRXqJfZFdobCFtg9tZnP5TbV+xvIYzW4QrmZMfd2HPoIiT
         YYEhwhv7L1f2UVBcUzFztwrWCTWYwwkEncdpspHChGJvgbFk/VT7UXgubBUcmZGhTs
         v2CRIEBMLm96Q==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nick Dyer <nick@shmanahar.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Christopher Heiny <cheiny@synaptics.com>,
        Vandana BN <bnvandana@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/5] input/mouse/synaptics: add LEN0091 support
Date:   Tue, 19 Nov 2019 11:51:14 +0100
Message-Id: <20191119105118.54285-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191119105118.54285-1-hverkuil-cisco@xs4all.nl>
References: <20191119105118.54285-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfITl6e8i82InOTHwXM3kdwYO2AxR8EsKQ3NIN50rAHb0nE7+NpDfx3mE0aarPKfcSasr0Ef93osdW5It+tibHUdNgekdaia7RnK1JLNhQe9ASaSRaj5Y
 01ScKcty+LNeFJk7S1KoU3uHCHNR/+GdaMmzWBexrnJQPZUBleqd1VFwyAiHcrwbjijryb0SIzJh+/W2xGnIofAyh8nccKoptJ2IxRw+4eHaVoINciU5/fmh
 uQYCUsTe1oqd//1y1LMgbJZpGVxy/vx86+7G1kdQdSKiTkDO09acp4XttZL7PEBZSHHh/y2lgAWQWtk1xlr2rXqF1UXKshBJgGpyjlzb0etJDqBE0XPFq7y+
 tUhSg0KxnAq6nkJf2uQFDKq+b2McMvnzVWvHUFmD+tVqsN7xzqyGGlKKlH+6JsKJXhVQ9hpSAkrXbw+FAUBtInmWE7pekAYhRS/+AbkWgAIru+kBPUm5qThf
 olwcCYk9h6xgzTBzYbBaB+ImNTreFf8npd3UDT5T+dh67J53wJ2Cu5wS9q4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some Lenovo X1 Carbon Gen 6 laptops report LEN0091. Add this
to the smbus_pnp_ids list.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 56fae3472114..1ae6f8bba9ae 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -172,6 +172,7 @@ static const char * const smbus_pnp_ids[] = {
 	"LEN0071", /* T480 */
 	"LEN0072", /* X1 Carbon Gen 5 (2017) - Elan/ALPS trackpoint */
 	"LEN0073", /* X1 Carbon G5 (Elantech) */
+	"LEN0091", /* X1 Carbon 6 */
 	"LEN0092", /* X1 Carbon 6 */
 	"LEN0093", /* T480 */
 	"LEN0096", /* X280 */
-- 
2.23.0

