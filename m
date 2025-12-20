Return-Path: <linux-media+bounces-49231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCD8CD2CB6
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 10:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C02F3012755
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 09:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8676F3093BB;
	Sat, 20 Dec 2025 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=preyas17@zohomail.in header.b="Y5T0MFgC"
X-Original-To: linux-media@vger.kernel.org
Received: from sender2-pp-o94.zoho.in (sender2-pp-o94.zoho.in [169.148.134.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83183064A9;
	Sat, 20 Dec 2025 09:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=169.148.134.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766224573; cv=pass; b=ufP+2CIIEI4rZ3prgME57q6iS2i9gScciN5FIbMYndt+5zfWNRDU3zMU3uxWiA5Kqsb9GwKK5ru7nVo5qGv0LweAfhVFO1cro1pg9iVjXX4Ml8q/lJugWr6fYcpI9wWDyOoWqNAHlDs2YVEsbpAkBZsTbfkBboMS1V+n/PpeEwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766224573; c=relaxed/simple;
	bh=3cZmGHMWKcpONAzCGGHE/IkgIfLktJTShLZd3ccn4AE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cjB4QdV681b8yNDXOhMkZmQKI0SnXEzfZF/FFbVkD+Gw6dydQWkozLLOo0GTsp6/VLClFrK8dM0kr0VB7AMFT+cwSO7KGlBkxqcyUCQUHsO07bwEF42Tkh9Tzss9//pdqn7ybWqOXhhRjE+xKF+170vSJmiJ71m9EfO2MIBrFBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=preyas17@zohomail.in header.b=Y5T0MFgC; arc=pass smtp.client-ip=169.148.134.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
ARC-Seal: i=1; a=rsa-sha256; t=1766224549; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=N+QHm1hq3qlbJPdaNPfUPW0eTqAvUaUwR4zSUIj/J/UYmiY3pCFBO6BS2h3A9FykhKt9S2ffhG5kUL/cByfruMF4kSDcbMG8T3kY7XjQ3q1UbupRSVL3mfJBgcHRP5MF5rJE9/7Y1AECd6w4lreAUfkCyQ9aLT979hOo9oabWRc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1766224549; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HNEgVc7rr8Q7TcigOKZZFJY0PJQw5EZtyXLA/KKyDBU=; 
	b=H+gCVx5kvpvTY2DC1koQMzoBVD6jtH2F51sva4udDvTmX9D+n9/nxs8bDaFEWgdNayJR+OqeZT8X3Ci5N15CRrqncjBj5SPLuZrykaoLDnWwp3eKOGu2k9uhFkNAQAHVuPhCgkPyH4rtwJc9U9KrhAu1MINmb36j2nFryxH+c3U=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=preyas17@zohomail.in;
	dmarc=pass header.from=<preyas17@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766224549;
	s=zoho; d=zohomail.in; i=preyas17@zohomail.in;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=HNEgVc7rr8Q7TcigOKZZFJY0PJQw5EZtyXLA/KKyDBU=;
	b=Y5T0MFgCRIKpV0HCJHirO+42syGxgj9PB4ee/Ul8AOWsQhMnmb2YlLE+ERBVVDkv
	s2/3CwkLeg8ivTPYziMfQxIriWfzoUkGaXWm/TqqyWW9rfPHCsB411gglZzTjng2iru
	fBbXuHge3ZHDVRfJbysGeVkGU6fIPhtlfEEH1Z8A=
Received: by mx.zoho.in with SMTPS id 1766224547592834.3341855296335;
	Sat, 20 Dec 2025 15:25:47 +0530 (IST)
From: Preyas <preyas17@zohomail.in>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Preyas Sharma <preyas17@zohomail.in>
Subject: [PATCH 2/2] staging: media: av7110: fix checkpatch warning in sp8870.c
Date: Sat, 20 Dec 2025 09:55:21 +0000
Message-ID: <20251220095521.36992-4-preyas17@zohomail.in>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251220095521.36992-1-preyas17@zohomail.in>
References: <20251220095521.36992-1-preyas17@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Preyas Sharma <preyas17@zohomail.in>

Signed-off-by: Preyas Sharma <preyas17@zohomail.in>
---
 drivers/staging/media/av7110/sp8870.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 0c813860f5b2..93bf47a62e38 100644
--- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -496,7 +496,7 @@ static int sp8870_set_frontend(struct dvb_frontend *fe)
 				dprintk("delay = %i usec\n", check_count * 10);
 				break;
 			}
-			udelay(10);
+			usleep_range(10, 20);
 		}
 		if (valid)
 			break;
-- 
2.43.0


