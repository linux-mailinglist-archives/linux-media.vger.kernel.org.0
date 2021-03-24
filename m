Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 718E4347310
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 08:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236037AbhCXH5S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 03:57:18 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:53243 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235901AbhCXH4r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 03:56:47 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OyNelvrLxCAEGOyNhlYquz; Wed, 24 Mar 2021 08:56:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616572605; bh=fZ79A/xTJZ3PqF4fkdUC6OWqKO2m1C1YvsZWEkldU/s=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Ca67zsS+HbgQlD3UqjXubuytG65YZEUu+r0o5EMgFtk9HZDJzuP1iB+tnhhTUTLOk
         eInv/lLTgwMv7HC05Pv41vQTMVm3rGnL3vQEOKrTJN92+uuM3l0utRXJ+S/Yo+0euj
         9s1FFyRhe4T6K4lSHeUa5ij3BUp7czVC+kBI9KABXurGdmDymWfF/brtLuPs0KywKa
         pUE6wARJtU/sFFLRVs9Pmj7DXBagcOpU2UxbaGlCxaWyTvN60fBT8ZlLamKFlAiiVu
         KzD1QYMJ8hD8fejzsPzKRRdVs5LlVdDnClstrKJwaKQPdS7xF4/F+/sHUaR5rbr1LI
         ITutfA5DGY3Uw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] adv7604: fix HPD support for adv7611/12
Message-ID: <c7093e76-ffb4-b19c-f576-b264f935a3ce@xs4all.nl>
Date:   Wed, 24 Mar 2021 08:56:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMMEc6Jxr+z2qIghm6YbPYhxEQSiejPnYmE9YgjUzxxYbn1KAbPyn8X7Uvn104nQdsfjBKfGEdrxW1TvA0EKfvErVw0furQzVXNRhAgZTQOI1K7UkilP
 1v4QBDTu+TRIDnaWTQRE+tKav0R/tYjbnPDH/EliX0w7OxAs+auH7EOXYckYCfhDAfCYQ5VYqqPgoUNj3Dv3TC0mwIkrHqB4ImX3206kJCSmrVimay00gbeP
 US9g7d0bRjca5Og/1RTiGQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For the adv7604 the hotplug detect pin is controlled through gpio pins from
the SoC, but the adv7611 and adv7612 control the hotplug detect pin themselves.

But the driver had no support for this, so the HPD was always high, even when
changing the EDID. Add proper support for this to the driver.

Tested with an adv7612.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 7547afc85eb1..15bcb88ca2e3 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -519,10 +519,17 @@ static inline int edid_write_block(struct v4l2_subdev *sd,

 static void adv76xx_set_hpd(struct adv76xx_state *state, unsigned int hpd)
 {
+	const struct adv76xx_chip_info *info = state->info;
 	unsigned int i;

-	for (i = 0; i < state->info->num_dv_ports; ++i)
-		gpiod_set_value_cansleep(state->hpd_gpio[i], hpd & BIT(i));
+	if (info->type == ADV7604) {
+		for (i = 0; i < state->info->num_dv_ports; ++i)
+			gpiod_set_value_cansleep(state->hpd_gpio[i], hpd & BIT(i));
+	} else {
+		for (i = 0; i < state->info->num_dv_ports; ++i)
+			io_write_clr_set(&state->sd, 0x20, 0x80 >> i,
+					 (!!(hpd & BIT(i))) << (7 - i));
+	}

 	v4l2_subdev_notify(&state->sd, ADV76XX_HOTPLUG, &hpd);
 }
@@ -2826,6 +2833,18 @@ static int adv76xx_core_init(struct v4l2_subdev *sd)
 	io_write(sd, 0x0b, 0x44);   /* Power down ESDP block */
 	cp_write(sd, 0xcf, 0x01);   /* Power down macrovision */

+	/* HPD */
+	if (info->type != ADV7604) {
+		/* Set manual HPD values to 0 */
+		io_write_clr_set(sd, 0x20, 0xc0, 0);
+		/*
+		 * Set HPA_DELAY to 200 ms and set automatic HPD control
+		 * to: internal EDID is active AND a cable is detected
+		 * AND the manual HPD control is set to 1.
+		 */
+		hdmi_write_clr_set(sd, 0x6c, 0xf6, 0x26);
+	}
+
 	/* video format */
 	io_write_clr_set(sd, 0x02, 0x0f, pdata->alt_gamma << 3);
 	io_write_clr_set(sd, 0x05, 0x0e, pdata->blank_data << 3 |
