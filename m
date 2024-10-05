Return-Path: <linux-media+bounces-19123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88437991696
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 14:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FDAD1C21B29
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 12:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC4014C5AE;
	Sat,  5 Oct 2024 12:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosalinux.ru header.i=@rosalinux.ru header.b="EgnoNtMA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rosalinux.ru (mail.rosalinux.ru [195.19.76.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D0314F9D5;
	Sat,  5 Oct 2024 12:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.19.76.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728129612; cv=none; b=VdqKhW624RENGWASf+IV8377EA4hmArFzWiRPdD9HcuvbqlXZ7udfKX+2kdnoIk2lcgpHKAXHuZAXIfrbFIVS5IDrEfTfv5ZPPBqNSxcZmU/u47ggUXtefk2cQq1h0emg5eqg6ncDWb62LTqenx/PuU0Tjhqup6O35ULtobJWak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728129612; c=relaxed/simple;
	bh=lgjjzW8JhomFfhqNJl60GVevaG2TRoCJ1RUSqhu+/PI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VGUTu1Cr14Zp747Z3fCAVGiQf/rxkFNxdRzF8SbiQWO5rhvg2khUJGmV3E5GTbqZA6LH2GKVBxnCRCfNk0wFgQYgzTKf3t0xlCsTlSM0HcxGMTZjvSqnFbwl/fHMIupTNQwtIxekneJw2VhRGt0lOABAHSRNwnY59GONGIabZpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosalinux.ru; spf=pass smtp.mailfrom=rosalinux.ru; dkim=pass (2048-bit key) header.d=rosalinux.ru header.i=@rosalinux.ru header.b=EgnoNtMA; arc=none smtp.client-ip=195.19.76.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosalinux.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosalinux.ru
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id 20E6BDB761279;
	Sat,  5 Oct 2024 15:00:05 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id eoG0vcNe2Ldw; Sat,  5 Oct 2024 15:00:05 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id DA1A3E2D87380;
	Sat,  5 Oct 2024 15:00:04 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru DA1A3E2D87380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
	s=1D4BB666-A0F1-11EB-A1A2-F53579C7F503; t=1728129604;
	bh=r1ZRAdOPsZ6V3qrG7zP/y2ZKnPDaC4zWXBpyCVEL9mo=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=EgnoNtMANl7XTY6tSlxGbZN1cnfhlgvS1f2uqP5enUOSoAybdLk9BGw59EN/UAXRu
	 ClV9zWaSjT7zlC3ohOYPBg81EJG/1afnY8ZNyOZOQoV7fHfA0cPDx5Z3uP/BOLookF
	 1GKRa6V8CIPl61pHhuLdvhd1DyAIv9HtGBzpbj1aE2Op4jB0vRHxOl/SUkgWrV5flO
	 E+hsaXFDT67M/10U5TqjoQj5gqm1WfMqVk8MXaisWKu8eCHeuFSHt8TLtFMij1d+Rl
	 jCsuasG1R7ZlaUThKuNS5DNiLRaQLHku3FdG0tWY5pzdXzBZxmkBnCVGjiLaaqi66s
	 cqlHH88kQkajg==
X-Virus-Scanned: amavisd-new at rosalinux.ru
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jvuZZ7dH1Y9h; Sat,  5 Oct 2024 15:00:04 +0300 (MSK)
Received: from localhost.localdomain (unknown [213.87.162.215])
	by mail.rosalinux.ru (Postfix) with ESMTPSA id CE044DB761279;
	Sat,  5 Oct 2024 15:00:03 +0300 (MSK)
From: Mikhail Lobanov <m.lobanov@rosalinux.ru>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Mikhail Lobanov <m.lobanov@rosalinux.ru>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Aleksandr Burakov <a.burakov@rosalinux.ru>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v3] media: rj54n1cb0c: possible integer overflow fix
Date: Sat,  5 Oct 2024 07:58:57 -0400
Message-ID: <20241005115859.13273-1-m.lobanov@rosalinux.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

An integer overflow may occur due to arithmetic operation
(multiplication) between value '314572800' and variable 'resize',
where the value comes from '12 * RJ54N1_MAX_WIDTH * (1 << 14)'
and when 'resize' is equal to 16319.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: a6b5f2008a3d ("V4L/DVB (13661): rj54n1cb0c: Add cropping, auto whi=
te balance, restrict sizes, add platform data")
Signed-off-by: Aleksandr Burakov <a.burakov@rosalinux.ru>
Signed-off-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
v1->v2: updated multiplication operation to use shorthand assignment for =
improved code readability
link to v1: https://lore.kernel.org/lkml/20240917140454.7880-1-a.burakov@=
rosalinux.ru/
v2->v3: the subsystem prefix has been updated to 'media: rj54n1cb0c:'.
link to v2: https://lore.kernel.org/lkml/20241004121924.27174-1-m.lobanov=
@rosalinux.ru/
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
+	peak *=3D 1 << 14;
 	peak_50 =3D peak / 6;
 	peak_60 =3D peak / 5;
=20
--=20
2.25.1


