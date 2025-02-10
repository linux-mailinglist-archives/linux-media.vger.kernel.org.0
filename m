Return-Path: <linux-media+bounces-25874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D658BA2E64C
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 09:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47DD3188B43D
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 08:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98291C5D75;
	Mon, 10 Feb 2025 08:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="v9ejuOsN"
X-Original-To: linux-media@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522771C07CB
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 08:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739175704; cv=none; b=NB5H7oUTruuqHMgkKBa+NIHEpIZWjha6H3G5Tup7ZlHrFu5jCBjulu1E5/iAeliktXzEC6zBu1BCjay5Y1Smnyo098jtVbnkv8EUKv8nxBNr4LqFgW0w7VdGq49jUr8STMLEVAKdpPduXjUkeUqP+MkXbhA0ctMRTupTLANzjV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739175704; c=relaxed/simple;
	bh=kkitMgcce5LX5agqzNgk6J0eaNnB/hOLrzm4OBEZ+5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AGeqADlfbncDFe9jS7xkH9WoH1WxjaSHRZybuRf1JEUOlXYMz67BayqGIlfy2+uwQ9bxSSU4PUBgPTx63j7/r8F1wSm6TGmMNQBXnElHXOyB+14JW07/Adt2dmfF06iRdTC6BeGvgewYQq3wGJr1ll3XPUMsq637UVw6DN8Jy+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=v9ejuOsN; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1739175700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aiP0T69xWJh68F8scJK++6YlobxLpWOoIVSQLlWtZU4=;
	b=v9ejuOsNf8Fhh7AUTHExRNf3+HkhWRAEYaMk3TL23hBPLndlzo3fNAGSCT9NoYb5kku80d
	7IpWtIFavLE10U3X2oxiX9wTFMrbBudavWKiqupQI60JJ02YLi4H2QwHaBaeSxNSXkrgGt
	Kr47MzZUDU1OVXDLdEYwKYR/nvN4Oen/q/Ci1osOjY7Pkzcqm2mJtOjx4Hnim3g85N27tg
	U9r+8ReR/f79249OrCR3wLhFFkc4KYtTwv7P2bajEVB/N5x7tpgVqiiBuPnMfY+gYzLqkP
	hKQzmWrH8vLQex4lf657Bixed7D/ugWFXTxelORT2/ouUEj5Oi8ELJrSfDoHQQ==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Daniel Scally <djrscally@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] media: i2c: dw9719: update PM last busy time upon close
Date: Mon, 10 Feb 2025 05:19:19 -0300
Message-ID: <20250210082035.8670-5-val@packett.cool>
In-Reply-To: <20250210082035.8670-1-val@packett.cool>
References: <20250210082035.8670-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Update the close callback to match other similar drivers like dw9768.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/media/i2c/dw9719.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index f2cf3bcd4dd3..74a57c2f59ae 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -188,7 +188,8 @@ static int dw9719_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 static int dw9719_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	pm_runtime_put(sd->dev);
+	pm_runtime_mark_last_busy(sd->dev);
+	__pm_runtime_put_autosuspend(sd->dev);
 
 	return 0;
 }
-- 
2.48.1


