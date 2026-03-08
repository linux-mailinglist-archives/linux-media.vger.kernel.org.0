Return-Path: <linux-media+bounces-54864-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LRED9ABrWlZxAEAu9opvQ
	(envelope-from <linux-media+bounces-54864-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 05:57:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A9922E898
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 05:57:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75258304E32E
	for <lists+linux-media@lfdr.de>; Sun,  8 Mar 2026 04:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFF73191CA;
	Sun,  8 Mar 2026 04:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="ciIwCyC/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD96F2DECA0;
	Sun,  8 Mar 2026 04:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772945784; cv=none; b=J9AKIjeROBn6S6kREmzf4TOeNH/E3sW5lDrS0ZLPk8MfgDOZYgKnAboftoL6MYdv/K4mtzz2iLNhZmqaqYGae9gntej7Moya4gyXk/WK6acq8umd7nemyKzEQ+VEsC5yH/fE/re6mciVnWIR5V865XJKFKgtvU4pwqtcgDhP2Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772945784; c=relaxed/simple;
	bh=IaW+X1N6r+xcszZTsXYhlT5LYdmWuiWOwORun1WKyoM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O2XekD1u6gq5w5fSBAgAf8VKvt7sa7m/+DHxjEq/fzn9cPxGdSa873Lt5jJmfDZ/cLvkBqIwmAnFk4tCQSIVpi1SkoGjZinH8KZum8Ug9kc4ab8qGmt6Cq/349OwO6jwMiJZTnF7qLLAJB2cfrFcIrC19ns+ZCTwTrd66psqaoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=ciIwCyC/; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1772945773; x=1773204973;
	bh=dW16CrrtdAXHSntXlRWaugpZSPRnpMzV9vh+HqT8fXk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ciIwCyC/zZVYLoGoEn9bE4oO7y3yo0JDHxBLqx9JnYCjewOvlIuz+HPQiNM8RUf6a
	 P1n/t6rVaI48opbkBS8PekFMnm1GmNKVgJIuhRJWq/97o00symfgWsrpsAN16mWGHg
	 gzgKiT9rwRu4cnOp5YKlh2iARgqqSLR8iMibbKxrUOYJu/JmTSFA9j1HjzHyOSRVv4
	 Bl68eN/RmW/dBehcs/1H9/QDmpkNNYoeOTUQlDnS/Q1nRMylWevDlhiObzH8pldpXw
	 IFiKZogsyeY57/JhmwfVwgHfhCFwV2h3DekBIyhP5HD0dQfYBXcfWnTTEwR3VP335U
	 X3+ZRb9+VggSw==
Date: Sun, 08 Mar 2026 04:56:07 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 2/2] media: i2c: ov8856: parse and register V4L2 device tree properties
Message-ID: <20260307-ov8856-v4l2-props-v1-2-7677b4c658e4@pm.me>
In-Reply-To: <20260307-ov8856-v4l2-props-v1-0-7677b4c658e4@pm.me>
References: <20260307-ov8856-v4l2-props-v1-0-7677b4c658e4@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: ffd4a09a57fc23c72185a4b006e8c55e822625f4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B6A9922E898
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54864-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.964];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[AKoskovich@pm.me,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Action: no action

Parse V4L2 device tree properties and register controls for them.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/media/i2c/ov8856.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index e2998cfa0d18..bd39d213e0be 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -1887,12 +1887,14 @@ static const struct v4l2_ctrl_ops ov8856_ctrl_ops =
=3D {
=20
 static int ov8856_init_controls(struct ov8856 *ov8856)
 {
+=09struct i2c_client *client =3D v4l2_get_subdevdata(&ov8856->sd);
+=09struct v4l2_fwnode_device_properties props;
 =09struct v4l2_ctrl_handler *ctrl_hdlr;
 =09s64 exposure_max, h_blank;
 =09int ret;
=20
 =09ctrl_hdlr =3D &ov8856->ctrl_handler;
-=09ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 8);
+=09ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 10);
 =09if (ret)
 =09=09return ret;
=20
@@ -1954,9 +1956,23 @@ static int ov8856_init_controls(struct ov8856 *ov885=
6)
 =09if (ctrl_hdlr->error)
 =09=09return ctrl_hdlr->error;
=20
+=09ret =3D v4l2_fwnode_device_parse(&client->dev, &props);
+=09if (ret)
+=09=09goto error;
+
+=09ret =3D v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov8856_ctrl_ops,
+=09=09=09=09=09      &props);
+=09if (ret)
+=09=09goto error;
+
 =09ov8856->sd.ctrl_handler =3D ctrl_hdlr;
=20
 =09return 0;
+
+error:
+=09v4l2_ctrl_handler_free(ctrl_hdlr);
+
+=09return ret;
 }
=20
 static void ov8856_update_pad_format(struct ov8856 *ov8856,

--=20
2.53.0



