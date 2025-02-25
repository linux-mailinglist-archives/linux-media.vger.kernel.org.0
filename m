Return-Path: <linux-media+bounces-26928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26772A43A28
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 10:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7D02440988
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 09:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0696267F7D;
	Tue, 25 Feb 2025 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="SwTZhSUS"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F49263C86;
	Tue, 25 Feb 2025 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476584; cv=pass; b=nYFYyj8J3/3/+BQFkSDLaug63jIUj5Rvxq3q493omYLAN+zWm1iT7Gt16glRsw3nTeSnY8Ij+cYozqkBspCgA0y+tN2mAK0mpiMYAdNas7KUmne3ZBRChM3ZAUCOLV96FeSr8FTXG9RmJ8qxI5SfvJ7SqI+5ib0FiftjD52mrfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476584; c=relaxed/simple;
	bh=udQgYnY0T+LsKgOGYVjffMy7LxsVcTFzEcKMkmphUrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iVd20Fb81WyNlNBUI2R9NagVVuodMl+xzxAwlFgJ9nuyFUNl7PQD320ZW6wQE7AMMVEqIRn/uIFYTBflOJ2FfB0c/Uc8xP7aQPyVYfy8kPvpzGID5gT0cFIhlzP64Fp0CzvY+gnx14MTnOIbFMtiryoeillw9eo9cJJU541b5zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=SwTZhSUS; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740476561; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZWUJALE3X+EXUeuC2EHLQZNFqyFdh0NyYCe1oJLHcFinI5O1gqcZwIuo8zzBTELcLU/U55QeGCcAI4g5ZBV6vX/sFX7Hkah1yxdCN0R7W9Wmy7XXNT6wWUXxKUKYg1t0nLYPw5tnsfiC1cKh3dzFcoPEQDnLLgGwCErkhDCbDWA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740476561; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PhcqlwF/W6SeudJ8/ZbUsIGtxuzwWHoYjUaWleuL8+I=; 
	b=TA3afxHgC71oyjPZoqoTxcGG3fe5GS22oaYJI6oa/b0s8LbNxX7KfG85qGUb7ipfnFfn4MM2nc6U60+CfMTHIMa0/4AlttB1/OD6zi01EO4FftTDb4SCLulgIBNLUquRbfdnMdDsnPrkaKLrHrky3+2Ut55aaqH61rZILxBLdJ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740476561;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=PhcqlwF/W6SeudJ8/ZbUsIGtxuzwWHoYjUaWleuL8+I=;
	b=SwTZhSUSS07oCVYZ7P8zHNLwJATsEosEOvICiwuAzESDn4DYfSTXFpIXdr9S+xQC
	6D8v8KR197526XXRCrYmO+CHelHCXvScBaZvkScaXl4QJeXbqfvn2k9GWnpPBNYc4P9
	IMZLAegHQE3sh0zbiE9W81ETWhT0qqSAIDQPnfWs=
Received: by mx.zohomail.com with SMTPS id 1740476559938497.44456290913297;
	Tue, 25 Feb 2025 01:42:39 -0800 (PST)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Tue, 25 Feb 2025 10:40:33 +0100
Subject: [PATCH v7 12/12] media: rkvdec: Fix frame size enumeration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-rkvdec_h264_high10_and_422_support-v7-12-7992a68a4910@collabora.com>
References: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
In-Reply-To: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Alex Bee <knaerzche@gmail.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Jonas Karlman <jonas@kwiboo.se>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740476426; l=1653;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=XlwiKB1TZIfyBLPYonxnSRa0aWPI3tSsmicak1dzrfc=;
 b=q/95JUmsPUkLNHHlVioAh4sQTO1NQQiDcwSphBb+wKl6MvHs3vchivIK17RMr3pyksypC7hAwrpN
 iaWY0pKgCJzs8UZvgM6oJzdXtbl5LzubPtqBjgNQy6OtSPsbiUoj
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External

From: Jonas Karlman <jonas@kwiboo.se>

The VIDIOC_ENUM_FRAMESIZES ioctl should return all frame sizes (i.e.
width and height in pixels) that the device supports for the given pixel
format.

It doesn't make a lot of sense to return the frame-sizes in a stepwise
manner, which is used to enforce hardware alignments requirements for
CAPTURE buffers, for coded formats.

Instead, applications should receive an indication, about the maximum
supported frame size for that hardware decoder, via a continuous
frame-size enumeration.

Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
Suggested-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 2859041bcc932bd638b4288bb8eba6b1443a08e3..619031b8cadc8d7185712ec6121a895e6ab89046 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -334,8 +334,14 @@ static int rkvdec_enum_framesizes(struct file *file, void *priv,
 	if (!fmt)
 		return -EINVAL;
 
-	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
-	fsize->stepwise = fmt->frmsize;
+	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+	fsize->stepwise.min_width = 1;
+	fsize->stepwise.max_width = fmt->frmsize.max_width;
+	fsize->stepwise.step_width = 1;
+	fsize->stepwise.min_height = 1;
+	fsize->stepwise.max_height = fmt->frmsize.max_height;
+	fsize->stepwise.step_height = 1;
+
 	return 0;
 }
 

-- 
2.25.1


