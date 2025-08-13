Return-Path: <linux-media+bounces-39743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BDEB24289
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB33A3A60AB
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 07:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030D82D739D;
	Wed, 13 Aug 2025 07:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZQkpz3Kh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00F22E6137;
	Wed, 13 Aug 2025 07:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755069683; cv=none; b=LZ5V3rQqwDbA836mdTfbZ7eG/0iNhMczLeLWJZq4cmiE3jM2/y4OEi5+vJgYAbCAOGU6Ro1FCxrxzWKgbo4js1RHSrWmevMZSLqwTKBnscxWd8psfSJBjz1P/XwFN8XBu1mgfROgtbSVVhi6+Je55NZ0FqIIC4halVIbWG1W0I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755069683; c=relaxed/simple;
	bh=S1Favj4HSSU0z5pC5G1EzkLDtwSs+X4mZUXj/zOdENw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BpFxyH5D3yveDWvyFutdaS7lvzIRvJk4P6aGbrXhIHAbfGbmSrhgJvTP5WADNpI1xg0hGKmdnZmqyRZ2vbkelpMLTtr+b0iqKLP7AP5zpAJGg3fs4VruIp0VHM61oW6sh4ABbf6QhW0L8rl+1rw69Ipx2JObFgZBbLX+6YF0jLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZQkpz3Kh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:bd1a:669e:3dcb:5a6b:a905])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9EE23A4;
	Wed, 13 Aug 2025 09:20:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755069627;
	bh=S1Favj4HSSU0z5pC5G1EzkLDtwSs+X4mZUXj/zOdENw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZQkpz3KhGd4bzfIRR0WWuIFYBGtNh53vLRKp4hvyWTtNrhwwwGfLfrLGUVBRP5M8y
	 0ILRAch/0BUs7fT3x4QI+7GrXiF7LAiycE3JB8ZolMONQw8k/G5SEobZxF1Nf+5rv4
	 J2ewrj8iLADzNotNlXRcNQyBYY68mqYHCiUvWpV8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 13 Aug 2025 12:50:34 +0530
Subject: [PATCH 3/6] media: imx335: Update the native pixel array width
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-imx335_binning-v1-3-a42b687d8541@ideasonboard.com>
References: <20250813-imx335_binning-v1-0-a42b687d8541@ideasonboard.com>
In-Reply-To: <20250813-imx335_binning-v1-0-a42b687d8541@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=S1Favj4HSSU0z5pC5G1EzkLDtwSs+X4mZUXj/zOdENw=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBonDzXBWrfJaMFYIw+5gn0hEi3vuA1eGJaswAP5
 hqx+fOuEE6JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaJw81wAKCRBD3pH5JJpx
 RV17EADIb86aWGJK6NZ9IQV0y5hHAA71CGukJmCdi0UPtRRJgurwXr1SD11rSiP5xsYdAis9roo
 ALM80MfS9km6IHfxA6/YZIkw0+oO9naGwcv4q0ndavryXNuaUMtsi+dmeIskleU21F/6nbMJO43
 XENdgbn6onzLsDZq5vZV4AKrTR3aBL6O4eZReWuGwuwsUq7BVSctDHDey4x3geAAx7ZVQnKZF34
 WsDhyjpDQNqGVUDuNpdfuUlj9O9V8HW49W4qiixL+p17ge1IxzDIPB10Sw1LTmYG8mmIRVXbX9D
 F1xKFxvmaNwv/BBckaCoVgfwx6fHPsd0TItZuhhfzFJCtbB7hmHrY/ZGryY3NvXGdhL6gaos7gQ
 dVxK5mYwjrLHtLnAoWE+vs4X1krTx0ZJcWLzwC8TOSglFONciR1U3Cs49ALrSUEnPlvpd9bkc1N
 CfSC4+eX+yn/UxuU92YxfzsLh9sVwDzTYjzRNHHLx7QB12cePbOIadswLiB6coeHeEweJyIylVS
 LO40DsH9LCq38cLMgROj2zNikmCbfBrefkvXHzMTvR6FXDOQgWhldffplvJWy8FiutXpo/welgE
 VAck1tV5oSd5KjINHLJmJupNoo4XXgIGUo1YCc3LxwAlws6gjm+liInFNCD4ILajuabve0UVju6
 gqRwDmg/N30enwA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The sensor datasheet reports actual total number of pixels as 2696x2044.

This becomes important for supporting 2x2 binning modes that can go
beyond the current maximum pixel array width set here.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 6369bdbd2b09ba1f89c143cdf6be061820f2d051..dbf2db4bf9cbfd792ff5865264c6f465eb79a43b 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -124,10 +124,10 @@
 #define IMX335_NUM_DATA_LANES	4
 
 /* IMX335 native and active pixel array size. */
-#define IMX335_NATIVE_WIDTH		2616U
-#define IMX335_NATIVE_HEIGHT		1964U
-#define IMX335_PIXEL_ARRAY_LEFT		12U
-#define IMX335_PIXEL_ARRAY_TOP		12U
+#define IMX335_NATIVE_WIDTH		2696U
+#define IMX335_NATIVE_HEIGHT		2044U
+#define IMX335_PIXEL_ARRAY_LEFT		52U
+#define IMX335_PIXEL_ARRAY_TOP		50U
 #define IMX335_PIXEL_ARRAY_WIDTH	2592U
 #define IMX335_PIXEL_ARRAY_HEIGHT	1944U
 

-- 
2.50.1


