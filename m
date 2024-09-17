Return-Path: <linux-media+bounces-18332-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1297B109
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 16:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBCED2838ED
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 14:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84775175D57;
	Tue, 17 Sep 2024 14:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosalinux.ru header.i=@rosalinux.ru header.b="ngkM901K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rosalinux.ru (mail.rosalinux.ru [195.19.76.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71C23C08A;
	Tue, 17 Sep 2024 14:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.19.76.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726581990; cv=none; b=bSWJysWyosY2WMdb2xKoT1xzJknaYZjSlb7Sf11rcb3qa43tExVH8xDpotzFXBBn7STkyPztG8vf1kSi0s8nmcAPm8ZaK2HzMJWCMszaD9cbGsyrPgYqiupQOeH2LU7o8pUh59iEbJeLMe5cvU+mvSxDARmw88gPC/1T9OW1Cjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726581990; c=relaxed/simple;
	bh=O8TFnEzzQuQka4uM9JJmV5K6N/xJ6xskvb4dgy98N24=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dZjvhwMjYXftEv01DoJVZ2DfItw+KARV5xjv5VGz5GMHMUVi8fmEGYKrgHGT66HDvBtSShEkn1ux0McBl5R5TpWkJG9Ug5wzRFXF6jHA177OeIyT4r7RbzNPI6AIPmLjpfv6MNMYk3QsRuJGS43FeYXHn+tm7iZSkpDQUF5+OCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosalinux.ru; spf=pass smtp.mailfrom=rosalinux.ru; dkim=pass (2048-bit key) header.d=rosalinux.ru header.i=@rosalinux.ru header.b=ngkM901K; arc=none smtp.client-ip=195.19.76.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosalinux.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosalinux.ru
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id 1CA15DFC0E87E;
	Tue, 17 Sep 2024 17:06:18 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id N1XX7aZF9tt3; Tue, 17 Sep 2024 17:06:18 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id E2606DFC0E884;
	Tue, 17 Sep 2024 17:06:17 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru E2606DFC0E884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
	s=1D4BB666-A0F1-11EB-A1A2-F53579C7F503; t=1726581977;
	bh=ZnDp0kuwty6ZYaaIo7tuaeh++IuabuL6NxK44pY/klQ=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ngkM901K2TKUDaPb/wJmr8+7GOnECevGJqc6o8jWHtTiJiYZBU71zMIRpmy0v+FkG
	 VDt9pWrlAyIHp2eZbyH0kHok0iTll3qhiwxZh1pHqlIJcrvncFnIEIm/X38i2ppX3f
	 ETYr1+1jg0xOdbizNuOjjpg8E6cGWgsYViAKFHvGSpcXuJm4YgU3PfCGiate3GXeeY
	 UYVFlOpxQBd1Z5OSCRpkEU7Orm3jmp4rWtNbiNXe0wUag/a8ap16WoDvGQvNJaZGSd
	 /mip9VWnyq8iMj+dF6o5ppN0Jmex4l7/4gysKH6eKQg8tFqiXBYRsAJJB692IEQpSe
	 T6zVa0wvBXYMQ==
X-Virus-Scanned: amavisd-new at rosalinux.ru
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ggBFHbrd65yx; Tue, 17 Sep 2024 17:06:17 +0300 (MSK)
Received: from ubuntu.localdomain (unknown [144.206.93.23])
	by mail.rosalinux.ru (Postfix) with ESMTPSA id A44EBDFC0E87E;
	Tue, 17 Sep 2024 17:06:17 +0300 (MSK)
From: Aleksandr Burakov <a.burakov@rosalinux.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Aleksandr Burakov <a.burakov@rosalinux.ru>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	lvc-patches@linuxtesting.org
Subject: [PATCH] V4L/DVB (13661): rj54n1cb0c: possible integer overflow fix
Date: Tue, 17 Sep 2024 17:04:54 +0300
Message-Id: <20240917140454.7880-1-a.burakov@rosalinux.ru>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

An integer overflow may occur due to arithmetic operation
(multiplication) between value '314572800' and variable 'resize',
where the value comes from '12 * RJ54N1_MAX_WIDTH * (1 << 14)'=20
and when 'resize' is equal to 16319.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: a6b5f2008a3d ("V4L/DVB (13661): rj54n1cb0c: Add cropping, auto whi=
te balance, restrict sizes, add platform data")
Signed-off-by: Aleksandr Burakov <a.burakov@rosalinux.ru>
---
 drivers/media/i2c/rj54n1cb0c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0=
c.c
index a59db10153cd..a612ec1e7157 100644
--- a/drivers/media/i2c/rj54n1cb0c.c
+++ b/drivers/media/i2c/rj54n1cb0c.c
@@ -776,8 +776,8 @@ static int rj54n1_sensor_scale(struct v4l2_subdev *sd=
, s32 *in_w, s32 *in_h,
 	}
=20
 	/* Antiflicker */
-	peak =3D 12 * RJ54N1_MAX_WIDTH * (1 << 14) * resize / rj54n1->tgclk_mhz=
 /
-		10000;
+	peak =3D 12 * RJ54N1_MAX_WIDTH * resize / rj54n1->tgclk_mhz / 10000;
+	peak =3D peak * (1 << 14);
 	peak_50 =3D peak / 6;
 	peak_60 =3D peak / 5;
=20
--=20
2.25.1


