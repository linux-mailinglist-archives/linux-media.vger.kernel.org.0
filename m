Return-Path: <linux-media+bounces-12524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 188468FB097
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 12:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E5AB2854A3
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 10:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C3E145336;
	Tue,  4 Jun 2024 10:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tWh9mm5r"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FF41420D7;
	Tue,  4 Jun 2024 10:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717498460; cv=none; b=YlX13zDbE6CNGW9nB2hD5qoZq0pOAjuNUB0Wj29wNX4fUjnTdXkmOiotagRm5hkzO0DiqZcFSKQtLlM74SU1gVNYlihTsecGxgXgach/sS40DPKgMn1TTj5yxjugwrv9tIiSOy9iZ+64H+GcF5RUI9baGMUB5ytJ0PKJ1RGkwDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717498460; c=relaxed/simple;
	bh=HXGrDtYQp/Kd7UISl8Rfa0p0POCEbSkgWIRyK5bDOiM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bw+78PABqmYo0JT63vctgtfCEizOFreHSmmentI56XKjX2+a7LG/ygpqPjKU1ahLUNrxy9uQD959e/9AJRA9exFeNpu+oWuI+N+q9osoicfcjCZESO5WTC/7UaiskEWBSXpWeUiL97xxEwqYJBc4dS2N8ZIp66npNP8uX85khSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tWh9mm5r; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 454As4OX005475;
	Tue, 4 Jun 2024 05:54:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717498444;
	bh=5otuQ1VZN27YTGAO+Tikzc/WwY3vRnKn8Az4O2zUaIw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tWh9mm5rlZbxA9TmZWoH84mJaRGu4yk8p6oIGJ9ntbHk5xsibSJ6K31AEvaVzga/E
	 Q8+blF6J5xVJeMWF9j4CsS3mmRP21eihNzoZ2fhVzy6CihvhbdWwfBOa6DN824DvSv
	 60U0IKV9T94XwERzMWc0apIO2prdGc2BI51OXAfs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 454As4en009559
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 05:54:04 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 05:54:03 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 05:54:03 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 454As3OK076414;
	Tue, 4 Jun 2024 05:54:03 -0500
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
Subject: [PATCH v12 13/13] gpu: ipu-v3: Use generic macro for rounding closest to specified value
Date: Tue, 4 Jun 2024 16:24:02 +0530
Message-ID: <20240604105402.2258395-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240604104001.2235082-1-devarsht@ti.com>
References: <20240604104001.2235082-1-devarsht@ti.com>
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
V12: No change
V11: No change
V10: No change
V9: No change
V8: Update commit message
V1->V7 : (No change, patch introduced in V7)
---
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


