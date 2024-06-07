Return-Path: <linux-media+bounces-12748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8F5900517
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 15:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94DDCB297C9
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 13:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58EF5194C93;
	Fri,  7 Jun 2024 13:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vP0kU3Jq"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C84194128;
	Fri,  7 Jun 2024 13:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717767241; cv=none; b=N5rL567WYA2jjc18TNu8Iezn+No7vpvVJUF3iP/TW6AWGhYmeJXgboWz8BOPjlEUd0oPYpD7mmcnPqPk4ApTDxlnGKI8EhCt4phYx26HuxT1DMPG8u4ON7Ce8ys4Uxz5eysHyMG/mI/iG5kiejFKm4+SOfgxn+u7ZW3pEloZmdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717767241; c=relaxed/simple;
	bh=0YLhmyjheVzSXXSOrOiwBn47uAon+CPY+/qhGgmycN8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u5xpL4jolin2QhIbz3RG1Eg50AamYrkME33OWEGrEGtLOh6giILLy79RQYqDX1lUHQKE5czh+IkuNrnh6zandAno94asD+qeaquUnan++5rtDF1Yeyreng4waWJVM16BcqPPvQb8TZfPDX+UrB2Wi/5cFquRFYDU2/joeRPL9AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vP0kU3Jq; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 457DXi1C004677;
	Fri, 7 Jun 2024 08:33:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717767224;
	bh=2ALN0fauWepwefecugaG1Bmw8RPodxWqs7BmCdEY/wc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vP0kU3JqKWvQIDVxw14ev+g6s2u+Uxnc8QtMVxuiGmEHboH+IlRWtURfW9ibS3Vrq
	 QEdm/YTGIYftPw+BI2Mv6/bOdCfc+rtsT5+ztOuHWOdfcGQ9t428NGZ1W5wMHPIC1z
	 Q0DttF7O/tE0D5xZ3JQvnIRpYRpb+TQpzhvu6Zl4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 457DXi0u017642
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Jun 2024 08:33:44 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Jun 2024 08:33:44 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jun 2024 08:33:44 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 457DXhoI120585;
	Fri, 7 Jun 2024 08:33:44 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
        <p.zabel@pengutronix.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>, <akpm@linux-foundation.org>,
        <gregkh@linuxfoundation.org>, <andriy.shevchenko@linux.intel.com>,
        <adobriyan@gmail.com>, <jani.nikula@intel.com>
Subject: [PATCH v13 13/13] gpu: ipu-v3: Use generic macro for rounding closest to specified value
Date: Fri, 7 Jun 2024 19:03:43 +0530
Message-ID: <20240607133343.3560760-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240607131900.3535250-1-devarsht@ti.com>
References: <20240607131900.3535250-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Use generic macro round_closest_up() for rounding closest to specified
value instead of using local macro round_closest().

There is no change from functionality point of view as round_closest_up()
is functionally same as the previously used local macro round_closest().

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V9-V13: No change
V8: Update commit message
V1->V7 : (No change, patch introduced in V7)
 drivers/gpu/ipu-v3/ipu-image-convert.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
index 841316582ea9..5192a8b5c02c 100644
--- a/drivers/gpu/ipu-v3/ipu-image-convert.c
+++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
@@ -477,8 +477,6 @@ static int calc_image_resize_coefficients(struct ipu_image_convert_ctx *ctx,
 	return 0;
 }
 
-#define round_closest(x, y) round_down((x) + (y)/2, (y))
-
 /*
  * Find the best aligned seam position for the given column / row index.
  * Rotation and image offsets are out of scope.
@@ -565,7 +563,7 @@ static void find_best_seam(struct ipu_image_convert_ctx *ctx,
 		 * The closest input sample position that we could actually
 		 * start the input tile at, 19.13 fixed point.
 		 */
-		in_pos_aligned = round_closest(in_pos, 8192U * in_align);
+		in_pos_aligned = round_closest_up(in_pos, 8192U * in_align);
 		/* Convert 19.13 fixed point to integer */
 		in_pos_rounded = in_pos_aligned / 8192U;
 
-- 
2.39.1


