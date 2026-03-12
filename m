Return-Path: <linux-media+bounces-55519-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qP0aIVL1smmLRAAAu9opvQ
	(envelope-from <linux-media+bounces-55519-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:18:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FBA2767CF
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DF9D30837C4
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 17:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0224B3DB620;
	Thu, 12 Mar 2026 17:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="NODXxHQy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBED3FD13D
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 17:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773335797; cv=none; b=doRhZgIFcsZoiACzKJI7Il9FDAXolpjiIic97ETuaGX39HgEglH8h1cEGQ4OhG7pSV7paGNutAhVtX2+kgsIBfdBD7000PeZ0gVJqoCsEaNSBe2K2LG2J9olhYWRetSXQpPpYSGKHXYBi2wvTjRFbty5YPPKCUtjiZLBNRVAqrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773335797; c=relaxed/simple;
	bh=VHwg5MUxzEK7wOWuAbvHaAaBfbz4LN/tW8AFhcKVB/g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DKWE2EhLmXhlbStmV9K0W1weq6WNi6sOHkpuTGr1bf8v12nHcvtQ83n5qMtHfmQ8b7jCz6YQYjkNoTuvHl0IENJLgPZc7Gqdqb27yyHjskB8hHJFvzUavD9HWqVdd3UTiBCMzbqFUKx+UXa/pf7iEL/a9rRDVw82KjeND13dUxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=NODXxHQy; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773335792; x=1773594992;
	bh=4G2O0xmDvSeKaWNCXXRz8HN+oJP7MY3SAgRZC2ST2Tw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NODXxHQykYDsDcXzAMdeEZhwjHqOVshfV8bDJ95pUVA1drFBqU/JKIcSN0+bHm6y3
	 j/4kSW9Cd8LZsdi9HiLXLYBXOQUNlmnPAVr2mE9SC6+VfkMmWiAzPFM55j7dvXaaqP
	 lTNkb97OMatcwPlBTbuyl3mGpzyFzi32V7mXPhd8l4OlkcMgflh7qZXtLbPh6RDvV+
	 6NWBPtHOSW2cW3AQOf3eM2G3qnfK5rNfuZTGkBtnwVoSMZzxytp5drzQ/jdKeuIBJ9
	 xBbDCiYN51IM8lRmzxtqfdE4Vm15HROduUpRB3Sf/q4JbTL41FormizEbr+lVtFo8o
	 5LldWh8USioTg==
Date: Thu, 12 Mar 2026 17:16:28 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ben Kao <ben.kao@intel.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v3 3/3] media: i2c: ov8856: parse and register V4L2 device tree properties
Message-ID: <20260312-ov8856-v4l2-props-v3-3-3771ab40a4c0@pm.me>
In-Reply-To: <20260312-ov8856-v4l2-props-v3-0-3771ab40a4c0@pm.me>
References: <20260312-ov8856-v4l2-props-v3-0-3771ab40a4c0@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 133d3e790956b494aa640149e14cd0411ce1317f
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
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55519-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,samsung];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 02FBA2767CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Parse V4L2 device tree properties and register controls for them.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/media/i2c/ov8856.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index dd01e1d515ff..8bedb47cd7cf 100644
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
@@ -1956,6 +1958,15 @@ static int ov8856_init_controls(struct ov8856 *ov885=
6)
 =09=09goto err_ctrl_handler_free;
 =09}
=20
+=09ret =3D v4l2_fwnode_device_parse(&client->dev, &props);
+=09if (ret)
+=09=09goto err_ctrl_handler_free;
+
+=09ret =3D v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov8856_ctrl_ops,
+=09=09=09=09=09      &props);
+=09if (ret)
+=09=09goto err_ctrl_handler_free;
+
 =09ov8856->sd.ctrl_handler =3D ctrl_hdlr;
=20
 =09return 0;

--=20
2.53.0



