Return-Path: <linux-media+bounces-36713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4C0AF8227
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 330625600C0
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 20:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8CF2BE63F;
	Thu,  3 Jul 2025 20:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lcbqWs5D";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LXM8Iz/E"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D23F298CB6;
	Thu,  3 Jul 2025 20:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751575978; cv=none; b=ZnSU9qQFRlLqlPLktpEFjkBkPb4YGBR0P7syGEJkHTUhnFogJten1wMKauIiGHzdMXiLgfReAOqdWX4J1Pzrk9tEwfYkaUt0eb1bCrs4kzZMIPHuCp5Huf37TWOJoALpHTyYVRZNjLnS9Ho3oglFkbt/A60JzsJRUjAckm/7EOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751575978; c=relaxed/simple;
	bh=TCE+O4daavW1XCj6Fz0zKZuz5Rr9G5yoJ2iGL0t2zAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZiRT85uWrcjN8TvXMQOueSFS7ocGryf+ZQUn8q99MuwDk3kJgwpp/ydA1f1wLevUkdDdDQJXNhgExJuXAxqxSo4osmBn1x/18Rb+RixS+oZuY2gj4iQNFoUP29C7WLpyOnWr78cAh6ksgl/FZtJ6kJOxZ7/wkwcmhmmSmRXkS5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lcbqWs5D; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LXM8Iz/E; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id B0EFFEC0F76;
	Thu,  3 Jul 2025 16:52:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 03 Jul 2025 16:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751575975;
	 x=1751662375; bh=cn2+47QlhY5HmpUQzF3SnOzk4aj841Cr7Z9IuZRAJkY=; b=
	lcbqWs5D5CUd1PAh+bjDhh+Dz3gf2bvFhcMFd7nmHsu+TU0KFU2mMJIKztmc/CfG
	tp+kwx7otnJ4tQDzQNJxJwCrN8jtXYGb58ekzyArwlYdfPntDuxIEv93ODDAYG+7
	IdO8S0FrbYp/nu1sc6MY3f7LUC0rn4YPA840F+UOd/OgmZJD0dUPCsA1Uxas+oCT
	+Z25edYhpmVF/uo1bnQOiPYOM5yTUzGYVlvQ3BCulz51S9b7XThzu5JBb4WznL/G
	D2rvurMj/yDoCRDMQXhDNfeM/ablt8Q7Inqi2BEtRqJs6VNxH46hWYFpcDRewq6k
	AWz/NE2+K1cWFd0HRqowhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751575975; x=
	1751662375; bh=cn2+47QlhY5HmpUQzF3SnOzk4aj841Cr7Z9IuZRAJkY=; b=L
	XM8Iz/ErANGHtecAQ+8Yb07+/9ex3/80rLD0GGhpzTZEEbknohesuQZE5+4b/x9O
	nGhJo1iHDMF2qzrbpGT7z5Hy50LakxFi9bV9iJnZKsYcvcqHYFAGKwolvutsbQOy
	aIg2fgRjwDG/4w6hf4fc37tElPZ9EBI9yn9atUbpUo13VU40b/K/MUBFEXi86/Z4
	DxjXipOT0WFQDxi1uj8kizeVUfQgNi9Nr5WBs1TJHY0zkAuAcgYFhzlO1WhFwTcz
	ZqIT1CG8y2nf2jxTKCX1gX78DoLkVAu75+9aGWJ3OFNZO+ZV6LDNkjbocRLUaFLw
	6omNbSAqPf8/tRb9aN8HA==
X-ME-Sender: <xms:p-1maGI6n2tI600VG1kbvOwxdCF3NYjcpmoZ_js89pM-S8kl8kyq2A>
    <xme:p-1maOIDjvcb6flAQSaG_Bgf_OUqFtOa-4n75USjQpIppoUY5qSCIwt0yZ0CZmP6I
    5g-JaDHLYgVrIM6fV4>
X-ME-Received: <xmr:p-1maGsLrYYzeggjwMRhNvV0Qn-n-LF7IyDz5qw3I1q7jytrpsEBgZWzgkNCW-xYz-xtcXLouyYod81GrTtXNgzpEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvuddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheplhgrrhhssehmvghtrghfohhordguvgdprhgtphhtthho
    pehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvhgvrhhkuhhilh
    esgihsgegrlhhlrdhnlhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthes
    ihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghs
    rghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrg
    hsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:p-1maLZqd2Wq4rs2i0M2Dv5JDZ157AV2oyUMa7ZiD1hI0OplpGR1hQ>
    <xmx:p-1maNa3w-3eBCptTGTzyLQu9PnQCKun1yWbBbieOa3xZGT7KErXmA>
    <xmx:p-1maHAmrqHaYIkSxEipciHefsOb9zm1LzWmVK-gbDuSt6uZ6nw1Hg>
    <xmx:p-1maDaPjE8ba3vlEh4NexIES688xI7jT04zbhXplIIf_les7wbbYg>
    <xmx:p-1maDM7dZ4WkSUZLQLeHEZhEtl0f8rFs2WeGW1_M6lbBSpSwIcsPSUU>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 16:52:55 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 01/11] media: adv7180: Move adv7180_set_power() and init_device()
Date: Thu,  3 Jul 2025 22:52:13 +0200
Message-ID: <20250703205223.2810806-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
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
---
 drivers/media/i2c/adv7180.c | 176 ++++++++++++++++++------------------
 1 file changed, 88 insertions(+), 88 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 6e50b14f888f..2519bc53333c 100644
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
@@ -889,6 +889,62 @@ static int adv7180_g_tvnorms(struct v4l2_subdev *sd, v4l2_std_id *norm)
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
@@ -1359,62 +1415,6 @@ static const struct adv7180_chip_info adv7282_m_info = {
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
2.50.0


