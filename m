Return-Path: <linux-media+bounces-9731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 535568AABAC
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 11:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F9F728320E
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 09:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DCD7BAED;
	Fri, 19 Apr 2024 09:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="dLzsJEFx"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25CE38D
	for <linux-media@vger.kernel.org>; Fri, 19 Apr 2024 09:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713519824; cv=none; b=jDSblMeGQVgJ7a5hk5cbhLvceipMdVNmAaoiJhdfsbupwjVrfeF3IvFoUNAd5jUljqMrHidkv7Yr0tkiMsJmg7WCmgH+Ct67leLa/I2Mof35bAeSWh199+ZHZW0+mhBLXbA4ousxSDkxrUyeKXy4Iekf5/vCTXMxwlImKDyO6wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713519824; c=relaxed/simple;
	bh=8ISrqGdtGSPrN9SuCrNdbXF3h8cKtTD8Iq+UkiOI07w=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=c8vRSeDiMbd16F1pCnoPTz8NbbBw87GY7mqayiuq6tWWXgJgSAdVxCb6SDUDAURvPyGz9FXfPsHVvymgraKshd1yK7q6iBDtbkTjs5+tqgb19hpV42e2Mfu7oh7qHdPEixfaPV8ZZvR7b58rpO9AZQzvhucLescX+xaySbAcRpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=dLzsJEFx; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1713519396; bh=8ISrqGdtGSPrN9SuCrNdbXF3h8cKtTD8Iq+UkiOI07w=;
	h=From:To:Subject:Date:From;
	b=dLzsJEFxi3PjSUsMefioDVGgdhG611sqyxZ0e2P1k7Rbm/LQut+p28pJrWECjn8EZ
	 i2eDuarHylXzEGzfDAZFM+SJrSbHLrhnHQicHLVbDxOMpJMKvugFRyWIV3/cZclZnm
	 YxYCOCzSRAmjrBOODOuAHee06bY4be4rkivurAOKgsvWpEsfqLaY8MklmpKCHvoNoX
	 Bi2jnr7uScBLrGmgGZOks6qZbAiQp2iEGIbwO70qJa23AfkrkdRrw3nH6pJDngbFSR
	 Mqiagk9ChN6xnBYtNy8Mm1LO+KSUULG61iWSJe3DnVA39j8H3L7+Y4JKOKIX4zY3vr
	 0U94cf3X4tTcw==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 82BAD1000C4; Fri, 19 Apr 2024 10:36:36 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] ir-ctl: correct max_size for rc5 and rc5_sz
Date: Fri, 19 Apr 2024 10:36:36 +0100
Message-Id: <20240419093636.223925-1-sean@mess.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These protocols can produce more edges.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/common/ir-encode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/common/ir-encode.c b/utils/common/ir-encode.c
index 4d43eb9d..5501778d 100644
--- a/utils/common/ir-encode.c
+++ b/utils/common/ir-encode.c
@@ -379,9 +379,9 @@ static const struct {
 } protocols[] = {
 	[RC_PROTO_UNKNOWN] = { "unknown" },
 	[RC_PROTO_OTHER] = { "other" },
-	[RC_PROTO_RC5] = { "rc5", 0x1f7f, 24, 36000, rc5_encode },
+	[RC_PROTO_RC5] = { "rc5", 0x1f7f, 25, 36000, rc5_encode },
 	[RC_PROTO_RC5X_20] = { "rc5x_20", 0x1f7f3f, 40, 36000, rc5_encode },
-	[RC_PROTO_RC5_SZ] = { "rc5_sz", 0x2fff, 26, 36000, rc5_encode },
+	[RC_PROTO_RC5_SZ] = { "rc5_sz", 0x2fff, 27, 36000, rc5_encode },
 	[RC_PROTO_SONY12] = { "sony12", 0x1f007f, 25, 40000, sony_encode },
 	[RC_PROTO_SONY15] = { "sony15", 0xff007f, 31, 40000, sony_encode },
 	[RC_PROTO_SONY20] = { "sony20", 0x1fff7f, 41, 40000, sony_encode },
-- 
2.44.0


