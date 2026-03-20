Return-Path: <linux-media+bounces-56499-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKF+HO8SvWnV6QIAu9opvQ
	(envelope-from <linux-media+bounces-56499-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 10:27:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B212D7FE6
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 10:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87D3430634CD
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92545361674;
	Fri, 20 Mar 2026 09:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="adcD8EiV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-24430.protonmail.ch (mail-24430.protonmail.ch [109.224.244.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9C535E941;
	Fri, 20 Mar 2026 09:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773998731; cv=none; b=uEHoq4D/kzB11re3yUOtu3lGdThBX2rhUWzJYbR6xwhoFFqtIS/4c5A3Jt7e0+k4Sds6DMpVj8ZNq8VppRyY88X/zbKBhRCG+JFa3/4dpU00myrEEagshj74fjZe7AY0Y3dSh9nnne+iUdU00eSkDg8+9eH3Rwzmn8kiyMUXNEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773998731; c=relaxed/simple;
	bh=NfngxJA9D9bU0i2vB6BQcMLdvL4uRHMzDyxlZAb0MVg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Rbqd/uxDH67FlY+j0+BSqwP/apGTpPf3m8jFWKJVbZsSac6sAiACjIlrF7QrIGv2HZYjgvrr120r5tGkLMFE39GqFZB0xkhkOuHP1iGgkk2FchoEW6hYnIsg6FelEE+e9Rjh8EecHY/zm5X6uPO69sSMLzR0fEWWF2U5j5Z/owI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=adcD8EiV; arc=none smtp.client-ip=109.224.244.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1773998726; x=1774257926;
	bh=mxEEVofyZ6y20gloAVg/kuS3VSQW/xiIW0o/7rP6pUY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=adcD8EiVtnrkxefB83IZBOEe0JrI9lnHBQdunP3PEmu8oNG7XAyrTmTip4LDYiEix
	 XPo+wesqAOhLossOSXWFp2mRRpes0g284aeYJ3CFHSkCEZrXfJ10WGHn2/or5cZ5k9
	 xqfELOnpfdm8pyphgFjjQiir73fsRIwyScKYPF2OFO53HTuJNRhN9uQnkO1F6yKm7P
	 qdcMRtBiADekoernx326JRfEABRsmYlBuIQ3aE7yYnCTAinWgkS0Ym2oKva9LI7HcG
	 O7nmadDiyaLURko9rtXw2Hyx21yjBIrpGJa6e23nz/fPXy/IalkTF10VvByEQmvKJ5
	 l4JOCMxQcmNmw==
Date: Fri, 20 Mar 2026 09:25:21 +0000
To: Arec Kao <arec.kao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Antoine Bernard <zalnir@proton.me>
Cc: "~postmarketos/upstreaming@lists.sr.ht" <~postmarketos/upstreaming@lists.sr.ht>
Subject: [PATCH 1/3] media: i2c: ov13b10: Add dvdd, dovdd and device tree support
Message-ID: <WDExF9Cf1ELo55IwClyLBJqXeLe2-Kb2m3QYg7ex6qREa3HBG52CdMovctxuZ7W_ixhvHyjk9L73NDMCJi2ndkuDJcpzHSDs7Z5pEAgET60=@proton.me>
Feedback-ID: 152853527:user:proton
X-Pm-Message-ID: eb33b12766f7ae80229dff7f57ddd6c492d72068
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56499-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,kernel.org,linux.intel.com,gmail.com,vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zalnir@proton.me,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[proton.me:+];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,proton.me:dkim,proton.me:email,proton.me:mid]
X-Rspamd-Queue-Id: E6B212D7FE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Antoine Bernard <zalnir@proton.me>

The Xiaomi Pad 6 tablet uses the OV13B10 sensor with a device tree
match and dvdd/dovdd voltage supply specified.

Add support for optional dvdd and dovdd voltage supply, and add
a device tree match so that the rear camera can work on such tablets
without an ACPI.

Signed-off-by: Antoine Bernard <zalnir@proton.me>
---
 drivers/media/i2c/ov13b10.c | 53 +++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 5421874732bc..47eced60542c 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -708,7 +708,11 @@ struct ov13b10 {
 =09struct v4l2_ctrl_handler ctrl_handler;
=20
 =09struct clk *img_clk;
+
 =09struct regulator *avdd;
+=09struct regulator *dvdd;
+=09struct regulator *dovdd;
+
 =09struct gpio_desc *reset;
=20
 =09/* V4L2 Controls */
@@ -1197,6 +1201,10 @@ static int ov13b10_power_off(struct device *dev)
=20
 =09if (ov13b10->avdd)
 =09=09regulator_disable(ov13b10->avdd);
+=09if (ov13b10->dvdd)
+=09=09regulator_disable(ov13b10->dvdd);
+=09if (ov13b10->dovdd)
+=09=09regulator_disable(ov13b10->dovdd);
=20
 =09clk_disable_unprepare(ov13b10->img_clk);
=20
@@ -1224,6 +1232,24 @@ static int ov13b10_power_on(struct device *dev)
 =09=09}
 =09}
=20
+=09if (ov13b10->dvdd) {
+=09=09ret =3D regulator_enable(ov13b10->dvdd);
+=09=09if (ret < 0) {
+=09=09=09dev_err(dev, "failed to enable dvdd: %d", ret);
+=09=09=09clk_disable_unprepare(ov13b10->img_clk);
+=09=09=09return ret;
+=09=09}
+=09}
+
+=09if (ov13b10->dovdd) {
+=09=09ret =3D regulator_enable(ov13b10->dovdd);
+=09=09if (ret < 0) {
+=09=09=09dev_err(dev, "failed to enable dovdd: %d", ret);
+=09=09=09clk_disable_unprepare(ov13b10->img_clk);
+=09=09=09return ret;
+=09=09}
+=09}
+
 =09gpiod_set_value_cansleep(ov13b10->reset, 0);
 =09/* 5ms to wait ready after XSHUTDN assert */
 =09usleep_range(5000, 5500);
@@ -1500,6 +1526,24 @@ static int ov13b10_get_pm_resources(struct ov13b10 *=
ov13b)
 =09=09=09=09=09     "failed to get avdd regulator\n");
 =09}
=20
+=09ov13b->dvdd =3D devm_regulator_get_optional(ov13b->dev, "dvdd");
+=09if (IS_ERR(ov13b->dvdd)) {
+=09=09ret =3D PTR_ERR(ov13b->dvdd);
+=09=09ov13b->dvdd =3D NULL;
+=09=09if (ret !=3D -ENODEV)
+=09=09=09return dev_err_probe(ov13b->dev, ret,
+=09=09=09=09=09     "failed to get dvdd regulator\n");
+=09}
+
+=09ov13b->dovdd =3D devm_regulator_get_optional(ov13b->dev, "dovdd");
+=09if (IS_ERR(ov13b->dovdd)) {
+=09=09ret =3D PTR_ERR(ov13b->dovdd);
+=09=09ov13b->dovdd =3D NULL;
+=09=09if (ret !=3D -ENODEV)
+=09=09=09return dev_err_probe(ov13b->dev, ret,
+=09=09=09=09=09     "failed to get dovdd regulator\n");
+=09}
+
 =09return 0;
 }
=20
@@ -1700,11 +1744,20 @@ static const struct acpi_device_id ov13b10_acpi_ids=
[] =3D {
 MODULE_DEVICE_TABLE(acpi, ov13b10_acpi_ids);
 #endif
=20
+#ifdef CONFIG_OF
+static const struct of_device_id ov13b10_of_match[] =3D {
+=09{.compatible =3D "ovti,ov13b10"},
+=09{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ov13b10_of_match);
+#endif
+
 static struct i2c_driver ov13b10_i2c_driver =3D {
 =09.driver =3D {
 =09=09.name =3D "ov13b10",
 =09=09.pm =3D pm_ptr(&ov13b10_pm_ops),
 =09=09.acpi_match_table =3D ACPI_PTR(ov13b10_acpi_ids),
+=09=09.of_match_table =3D of_match_ptr(ov13b10_of_match),
 =09},
 =09.probe =3D ov13b10_probe,
 =09.remove =3D ov13b10_remove,
--=20
2.52.0



