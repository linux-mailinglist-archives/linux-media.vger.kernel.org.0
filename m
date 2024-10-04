Return-Path: <linux-media+bounces-19087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D87E99902EA
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 14:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 718B3B219D7
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 12:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E7F15C13C;
	Fri,  4 Oct 2024 12:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosalinux.ru header.i=@rosalinux.ru header.b="ekA5OcXY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rosalinux.ru (mail.rosalinux.ru [195.19.76.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EEB158531;
	Fri,  4 Oct 2024 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.19.76.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728044980; cv=none; b=OPWQxfxFccqFc1zBxDNYJGDe6XRYYeVMCMO7lxhVBsCd94e3yd4fG11HEV2mez3fplFQ5HzkZ5vkRGg7SHWi/3XoNXvgHTWnbN9odL1HzTIBewpZZPg3Wc32xA7a1+3Yl/fSPqkD4DjGSCVfNzPtfH2QdYWGU8rxG1Nt08X+6EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728044980; c=relaxed/simple;
	bh=46ISaL87Qj/CLd/EuZAh5nF+7OcwodOqwQ3MvCCopTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C7GOxRbuHP+FTssZP7k6lfJtiqie9pRCxSRay6Vizf+XSB5IfREnfnluH71QraohBoE4JS5R2dp7Nl/CYOSo2QmpzZ3WXHLLOBuSe3WFGwWLYAFV0RSmmelh2rkxpyh3vl4drVw/zlbSKS8W/6AHq20I4L1xTUITb3ujFzFf5Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosalinux.ru; spf=pass smtp.mailfrom=rosalinux.ru; dkim=pass (2048-bit key) header.d=rosalinux.ru header.i=@rosalinux.ru header.b=ekA5OcXY; arc=none smtp.client-ip=195.19.76.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosalinux.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosalinux.ru
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id 7553CE0CAD189;
	Fri,  4 Oct 2024 15:20:51 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id hBGE4r2AaEG7; Fri,  4 Oct 2024 15:20:51 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id 482A7E0CAD188;
	Fri,  4 Oct 2024 15:20:51 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 482A7E0CAD188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
	s=1D4BB666-A0F1-11EB-A1A2-F53579C7F503; t=1728044451;
	bh=+F2jk/I9UsR3rvWH/wxbEEejvzp/NM78JprJo3q0ibM=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=ekA5OcXYgn0uUoWGWxq8cAT0R22Vu0DNC+Ajqbl58Yfv9OE4KvxodbBnE8uwW+sBp
	 bsmyqM+a8tjIw+yx18s7EGHX/XvSffaRDL128d/d0wnBqNiFtlJ74HasFC8z5jtGRG
	 mzYT69GtTnPlwhWPyqKAHCTC/ZDjXo7hixHXKYG2904ikqXyFjs0D/vETiK+2Ng/y4
	 /9H/KxHu2+XCIX82y8lqmZbvzfpBWT3d1w3nNIBY8kKnzxMZFYH5e6r1uJl+rUFi/f
	 4EoYDouwHnDola5RTwbC4HGSAG9KzM2Yi1ktTgkwtTtAJWbnuKrjUKFSp4DtAHkW4S
	 gLHCYIj/bYgnw==
X-Virus-Scanned: amavisd-new at rosalinux.ru
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QoSCg64-IbUl; Fri,  4 Oct 2024 15:20:51 +0300 (MSK)
Received: from localhost.localdomain (unknown [89.169.48.235])
	by mail.rosalinux.ru (Postfix) with ESMTPSA id E615DE0CAD184;
	Fri,  4 Oct 2024 15:20:50 +0300 (MSK)
From: Mikhail Lobanov <m.lobanov@rosalinux.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Mikhail Lobanov <m.lobanov@rosalinux.ru>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Aleksandr Burakov <a.burakov@rosalinux.ru>
Subject: [PATCH v2] V4L/DVB (13661): rj54n1cb0c: possible integer overflow fix
Date: Fri,  4 Oct 2024 08:19:21 -0400
Message-ID: <20241004121924.27174-1-m.lobanov@rosalinux.ru>
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
---
v1->v2: updated multiplication operation to use shorthand assignment for =
improved code readability
link to v1: https://lore.kernel.org/lkml/20240917140454.7880-1-a.burakov@=
rosalinux.ru/
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


