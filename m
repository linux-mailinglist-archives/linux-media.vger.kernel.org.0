Return-Path: <linux-media+bounces-9859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDAE8ACB1A
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 12:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B032B23F9D
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 10:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA3B13E8B9;
	Mon, 22 Apr 2024 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="inYGIikx";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="eTRkrpCV"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6231448C6
	for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 10:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713782512; cv=none; b=M38lKS0T1Z+AkYfxaoLE7FaREIQdiIVJa73ZxIG/qSgc/YqKAeYwXe6TwWdjF16PKx6RFzh7w/jnk2l72fs33x1L1LjR/YQexBIIBfYCRBw+UT8Ei2hWgt6qr7QiDkKXe6jyhunqOhkL9P8BwV5znhzD7hiy1aX34xW41S3A/Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713782512; c=relaxed/simple;
	bh=2puQE6yRTjM7FGYKGNW4Z1cYTny8FyjM7SkDJiScxRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H0UR3PdYAcLL9HxA+MgCSbvbdXAn0SYoUToR2nrFWc7+Sq4JXY2dA80I5EQl4Q0X1LOnZFrjZCEMCACss4y7RRoB1yQGX+sYiQuGmBup5bQR99I4GjF1R+3ZQVcSc9814IgF+yW3shZN4ebkgGdaYNiJyQ6+JJYXnBhFhM+TyTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=inYGIikx; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=eTRkrpCV; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1713782508; bh=2puQE6yRTjM7FGYKGNW4Z1cYTny8FyjM7SkDJiScxRg=;
	h=From:To:Cc:Subject:Date:From;
	b=inYGIikxwhlRuXfK/hKu+oDp3//Qr9DQC/Qre3nDqCbX+0LQN4yBuHadUqeAYrJxi
	 0X2JRR9gGiACCq+y18t1Tl4tNEdvq75Dgzeej8hdFj7ENSKlywaz2RiLGTEdNYuC7+
	 8utCFCOZLnvjkDdaUNjlWM6FAdpfRGrflGQ/4POLUnKlGnuRHcGBBZD+RxndyUp7lL
	 dZmrn/68AHDwk9CSKrMx1aUy0/a100gmMsflA88TD3QgBgJKJlb1XqHJl94Lq2LaAe
	 +Cqpvg/AYbJgAU0/1ws+Z830RoWeWXkxHoXkXJjDmPAArYMSgxQjv4CXNCcIIDGs7S
	 rPb7pFcPgzsWw==
Received: by gofer.mess.org (Postfix, from userid 501)
	id B03381009EC; Mon, 22 Apr 2024 11:41:48 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1713782507; bh=2puQE6yRTjM7FGYKGNW4Z1cYTny8FyjM7SkDJiScxRg=;
	h=From:To:Cc:Subject:Date:From;
	b=eTRkrpCVT4X4Su/30ocOuCip409GxYOlF8iYk5/l/5N8s9/BRqCOvL+wHYfWTAr36
	 XuqqWPjDVq9WDM9wPwZHoeBzhkaBSTlY3PO3/7EZeBm2boZaKrxvJkceYK2PD8efG9
	 R6qLwj0bMccJW/oVXNwe96FYfckB91cMYcNkVYQvMiMdgBCOShcRt0FFMLppJeqaI2
	 qA/DU84V6UirCSVPC9LH6HJmI7TNgIhnMnEklhzrwfKpTIljYaytmk3i1FyIAFDwVm
	 iQnleJhXi4otlAMa77ZlHXVAh9c8Fl6aeSSQycxtaT0yBBe8jrWFpItVJGoB6gEVpY
	 RUtkeb5xESPwg==
Received: from bigcore.mess.org (bigcore.local [IPv6:2a02:8011:d000:212:bc3c:1b4a:a6fa:362f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gofer.mess.org (Postfix) with ESMTPSA id 412C41000C2;
	Mon, 22 Apr 2024 11:41:47 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Cc: Sean Young <sean@mess.org>
Subject: [PATCH v4l-utils 1/2] ir-ctl: encode rc6 mode 0 can have 43 edges
Date: Mon, 22 Apr 2024 11:41:37 +0100
Message-ID: <20240422104138.20535-1-sean@mess.org>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure allocate enough space.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/common/ir-encode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/common/ir-encode.c b/utils/common/ir-encode.c
index 069e7feb..c0571879 100644
--- a/utils/common/ir-encode.c
+++ b/utils/common/ir-encode.c
@@ -390,7 +390,7 @@ static const struct {
 	[RC_PROTO_NECX] = { "necx", 0xffffff, 67, 38000, nec_encode },
 	[RC_PROTO_NEC32] = { "nec32", 0xffffffff, 67, 38000, nec_encode },
 	[RC_PROTO_SANYO] = { "sanyo", 0x1fffff, 87, 38000, sanyo_encode },
-	[RC_PROTO_RC6_0] = { "rc6_0", 0xffff, 41, 36000, rc6_encode },
+	[RC_PROTO_RC6_0] = { "rc6_0", 0xffff, 43, 36000, rc6_encode },
 	[RC_PROTO_RC6_6A_20] = { "rc6_6a_20", 0xfffff, 52, 36000, rc6_encode },
 	[RC_PROTO_RC6_6A_24] = { "rc6_6a_24", 0xffffff, 60, 36000, rc6_encode },
 	[RC_PROTO_RC6_6A_32] = { "rc6_6a_32", 0xffffffff, 76, 36000, rc6_encode },
-- 
2.44.0


