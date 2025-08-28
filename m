Return-Path: <linux-media+bounces-41262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D59DFB3A59E
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9248E3BCBB7
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5775E27D773;
	Thu, 28 Aug 2025 16:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="WdhIgFeo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Qv405Avo"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE93A27603C;
	Thu, 28 Aug 2025 16:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756397286; cv=none; b=XnJ/h3VfgfCLtP2VmwfZfHSWXboTbHbGj2N3r9RGaH4jfl6MO3cgwI+oIrd/7lS6xTYd4kltkST7bTrDiXG2YdK8Pp7u+1udD1x5QrVw5vPlm0sd+vzFcCuKXCdiWaUTvLsJMH0suLAZVtLfEHfeLgAL4Fi/4PY8lyXEtgAFoLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756397286; c=relaxed/simple;
	bh=tr7WhpJNwkPJDyDXsEmkWdHvfrtQnhGQuK27S28lJec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C/PTpw8O1kY3G2RZJ9uLTsYbwbgk7P/NY4JpPgIX4WUjECuSwve/ZsmFIrGCfDSKDa02LXeOpWet9xxM/+vgS5z+V+uZCMSPdGPSXmyf+nSqznJDX3ffPVaVfeoR0i/t+km4iTUZZ2zKToW8avkALfWxhH1hbL3GQ/e4wvseMCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=WdhIgFeo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Qv405Avo; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 964E47A0189;
	Thu, 28 Aug 2025 12:08:03 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 28 Aug 2025 12:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756397283;
	 x=1756483683; bh=jj3HUPcB2qC/YsBv7I4hU8RqD05Ve5WMBVxatFjLyCo=; b=
	WdhIgFeovEvu/mm3LgF4GkHY3VrU9JLZeBbXuICp4R14y/LtIJYQppPqLcNQxWVZ
	8EmYNkz3dvCuOUHNkr09jN7Uh5Cf9lMGbxK672NzAiqWVFxUGsrDyANijAvs4Kq3
	S2VYU8rjgPRUxaejeCMb/2dxnPM3vhYeCcGz2i3pdNb78ltEvcKdYZgUVgxLqhJk
	kot/0+98wgNMYMtnAR77RwzqF7hcNlkTnVOUsPIs4pArM7bOY8U2oCBDGw8W+X7c
	flXLTMS5KHqm2uxzyUmbNt3MfgD09MGv7j85J0n89F/5EuJQCWh05cV7LWiWLvfz
	3Rvi+FCxZqkPlwrIDHOe4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756397283; x=
	1756483683; bh=jj3HUPcB2qC/YsBv7I4hU8RqD05Ve5WMBVxatFjLyCo=; b=Q
	v405Avo5PocQ9540q36TKo6kY0/FrGoS++zvBcGhw5zL91UjJ90m52XVJvqKFBfj
	4put4b2F9iqHBDZoH0WgMZghVqTweqEa75GNv0ALl8LefFLYLyPxMOGx+sbKlmwO
	8LNLV33RaE13ZG9bkz+91Q5CHJGOHDCCTb9dWMimT0h+wRj49YdV0FibZIx4LrRU
	kUcAHnSIzVVvpMtqdKxqZaEvzauNbKqHF/tgDsjfC6ZW332E40eZR5TcrTZ5H3E2
	QrulljwA1O3v8AeNR0sQL6Us0W+0B4Vo7WcBg/pdKKoJqc/RBWr4tY2bdN6JeUF8
	IvEuxw+L6ZJvInZ887snw==
X-ME-Sender: <xms:436waJ6KJWgi7BwleeYPBkE7LE8YJzv2OECBtgOqfIMdXBaj0KCGLA>
    <xme:436waC735cD2RTleD2kOymPJnsmvQo8LxfMqL0agZt7MqGX7-SgkfHWhjYzSL2J--
    FxD8mZMZ8FJfrFXDzc>
X-ME-Received: <xmr:436waCrjKAOesWnIzy3XQbDXVOj9U-wLk5vZnOETUHgTBNElkin3tuB-BnPiuNqF3lkyST4cS3IWUhIfrYmhRtxT4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukedugeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeekpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehlrghrshesmhgvthgrfhhoohdruggvpdhrtghpthht
    ohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhvvghrkhhuih
    hlseigshegrghllhdrnhhlpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhht
    sehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguih
    grsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgv
    shgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklh
    grshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhr
    tghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtodhrvghnvghsrghssehiuggvrg
    hsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:436waDNV7B1mu0-576-MMLAqC1xjjr-QjDB-EnEVB3tA5Tu0cR6B1w>
    <xmx:436waK3tTV7vn65GsJhRcvm5SYDGNiDsaCBixgvxdHuDP_2RuI07dA>
    <xmx:436waCBWwFnoEvJYBj5cCWopq2y5mppUX1S8ugX0VVFskH62FsZxHg>
    <xmx:436waHKbRauNTK6IfpqiNuBEZVP1jFt_XbJYKiV2rWJ2wlwp-Ge8lw>
    <xmx:436waFadT7WtcIOlVXd_hMDX8_APDwHmVRU7qFfHAD-SZNbwsbgaL3NF>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 12:08:02 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 01/11] media: adv7180: Move adv7180_set_power() and init_device()
Date: Thu, 28 Aug 2025 18:06:44 +0200
Message-ID: <20250828160654.1467762-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250828160654.1467762-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250828160654.1467762-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the two functions adv7180_set_power() and init_device() earlier in
the file so they in future changes can be used from .querystd and
.s_stream as the driver is reworked to drop the usage of .s_power.

While at it fix two style issues in init_device() that checkpatch
complains about.

  - Two cases of indentation issues for function arguments split over
    multiple lines.

  - The repetition of the word 'interrupts' in a comment.

Apart from these style fixes the functions are moved verbatim and there
are no functional changes.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/adv7180.c | 176 ++++++++++++++++++------------------
 1 file changed, 88 insertions(+), 88 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 5d90b8ab9b6d..ef63b0ee9b8d 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -274,6 +274,38 @@ static int adv7180_vpp_write(struct adv7180_state *state, unsigned int reg,
 	return i2c_smbus_write_byte_data(state->vpp_client, reg, value);
 }
 
+static int adv7180_set_power(struct adv7180_state *state, bool on)
+{
+	u8 val;
+	int ret;
+
+	if (on)
+		val = ADV7180_PWR_MAN_ON;
+	else
+		val = ADV7180_PWR_MAN_OFF;
+
+	ret = adv7180_write(state, ADV7180_REG_PWR_MAN, val);
+	if (ret)
+		return ret;
+
+	if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
+		if (on) {
+			adv7180_csi_write(state, 0xDE, 0x02);
+			adv7180_csi_write(state, 0xD2, 0xF7);
+			adv7180_csi_write(state, 0xD8, 0x65);
+			adv7180_csi_write(state, 0xE0, 0x09);
+			adv7180_csi_write(state, 0x2C, 0x00);
+			if (state->field == V4L2_FIELD_NONE)
+				adv7180_csi_write(state, 0x1D, 0x80);
+			adv7180_csi_write(state, 0x00, 0x00);
+		} else {
+			adv7180_csi_write(state, 0x00, 0x80);
+		}
+	}
+
+	return 0;
+}
+
 static v4l2_std_id adv7180_std_to_v4l2(u8 status1)
 {
 	/* in case V4L2_IN_ST_NO_SIGNAL */
@@ -514,38 +546,6 @@ static void adv7180_set_reset_pin(struct adv7180_state *state, bool on)
 	}
 }
 
-static int adv7180_set_power(struct adv7180_state *state, bool on)
-{
-	u8 val;
-	int ret;
-
-	if (on)
-		val = ADV7180_PWR_MAN_ON;
-	else
-		val = ADV7180_PWR_MAN_OFF;
-
-	ret = adv7180_write(state, ADV7180_REG_PWR_MAN, val);
-	if (ret)
-		return ret;
-
-	if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
-		if (on) {
-			adv7180_csi_write(state, 0xDE, 0x02);
-			adv7180_csi_write(state, 0xD2, 0xF7);
-			adv7180_csi_write(state, 0xD8, 0x65);
-			adv7180_csi_write(state, 0xE0, 0x09);
-			adv7180_csi_write(state, 0x2C, 0x00);
-			if (state->field == V4L2_FIELD_NONE)
-				adv7180_csi_write(state, 0x1D, 0x80);
-			adv7180_csi_write(state, 0x00, 0x00);
-		} else {
-			adv7180_csi_write(state, 0x00, 0x80);
-		}
-	}
-
-	return 0;
-}
-
 static int adv7180_s_power(struct v4l2_subdev *sd, int on)
 {
 	struct adv7180_state *state = to_state(sd);
@@ -874,6 +874,62 @@ static int adv7180_g_tvnorms(struct v4l2_subdev *sd, v4l2_std_id *norm)
 	return 0;
 }
 
+static int init_device(struct adv7180_state *state)
+{
+	int ret;
+
+	mutex_lock(&state->mutex);
+
+	adv7180_set_power_pin(state, true);
+	adv7180_set_reset_pin(state, false);
+
+	adv7180_write(state, ADV7180_REG_PWR_MAN, ADV7180_PWR_MAN_RES);
+	usleep_range(5000, 10000);
+
+	ret = state->chip_info->init(state);
+	if (ret)
+		goto out_unlock;
+
+	ret = adv7180_program_std(state);
+	if (ret)
+		goto out_unlock;
+
+	adv7180_set_field_mode(state);
+
+	/* register for interrupts */
+	if (state->irq > 0) {
+		/* config the Interrupt pin to be active low */
+		ret = adv7180_write(state, ADV7180_REG_ICONF1,
+				    ADV7180_ICONF1_ACTIVE_LOW |
+				    ADV7180_ICONF1_PSYNC_ONLY);
+		if (ret < 0)
+			goto out_unlock;
+
+		ret = adv7180_write(state, ADV7180_REG_IMR1, 0);
+		if (ret < 0)
+			goto out_unlock;
+
+		ret = adv7180_write(state, ADV7180_REG_IMR2, 0);
+		if (ret < 0)
+			goto out_unlock;
+
+		/* enable AD change interrupts */
+		ret = adv7180_write(state, ADV7180_REG_IMR3,
+				    ADV7180_IRQ3_AD_CHANGE);
+		if (ret < 0)
+			goto out_unlock;
+
+		ret = adv7180_write(state, ADV7180_REG_IMR4, 0);
+		if (ret < 0)
+			goto out_unlock;
+	}
+
+out_unlock:
+	mutex_unlock(&state->mutex);
+
+	return ret;
+}
+
 static int adv7180_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct adv7180_state *state = to_state(sd);
@@ -1343,62 +1399,6 @@ static const struct adv7180_chip_info adv7282_m_info = {
 	.select_input = adv7182_select_input,
 };
 
-static int init_device(struct adv7180_state *state)
-{
-	int ret;
-
-	mutex_lock(&state->mutex);
-
-	adv7180_set_power_pin(state, true);
-	adv7180_set_reset_pin(state, false);
-
-	adv7180_write(state, ADV7180_REG_PWR_MAN, ADV7180_PWR_MAN_RES);
-	usleep_range(5000, 10000);
-
-	ret = state->chip_info->init(state);
-	if (ret)
-		goto out_unlock;
-
-	ret = adv7180_program_std(state);
-	if (ret)
-		goto out_unlock;
-
-	adv7180_set_field_mode(state);
-
-	/* register for interrupts */
-	if (state->irq > 0) {
-		/* config the Interrupt pin to be active low */
-		ret = adv7180_write(state, ADV7180_REG_ICONF1,
-						ADV7180_ICONF1_ACTIVE_LOW |
-						ADV7180_ICONF1_PSYNC_ONLY);
-		if (ret < 0)
-			goto out_unlock;
-
-		ret = adv7180_write(state, ADV7180_REG_IMR1, 0);
-		if (ret < 0)
-			goto out_unlock;
-
-		ret = adv7180_write(state, ADV7180_REG_IMR2, 0);
-		if (ret < 0)
-			goto out_unlock;
-
-		/* enable AD change interrupts interrupts */
-		ret = adv7180_write(state, ADV7180_REG_IMR3,
-						ADV7180_IRQ3_AD_CHANGE);
-		if (ret < 0)
-			goto out_unlock;
-
-		ret = adv7180_write(state, ADV7180_REG_IMR4, 0);
-		if (ret < 0)
-			goto out_unlock;
-	}
-
-out_unlock:
-	mutex_unlock(&state->mutex);
-
-	return ret;
-}
-
 static int adv7180_probe(struct i2c_client *client)
 {
 	struct device_node *np = client->dev.of_node;
-- 
2.51.0


