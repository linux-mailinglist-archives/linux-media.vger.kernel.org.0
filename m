Return-Path: <linux-media+bounces-20438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D5F9B358F
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 16:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 953841C21ED9
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 15:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756511DE8B7;
	Mon, 28 Oct 2024 15:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="FGOrbQ2+";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="e1b4gNEk"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E589C1DE3D1;
	Mon, 28 Oct 2024 15:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730131181; cv=none; b=Vz75H/170FqKxU+WuKUuKJPdrT2QGNueN4I7KIZfSCvdsq5R6oUy/kyJIHdLWlM3qc4P9LWNJMPWF2UWcHQ5qpPmOqL+wGH+cFGvRgqfStMsLaqsf504o5uAYSbjUvFa9SmrSC8LmUIuj3BeufUKpn+AUe2W9MRGM+HbvRiRm1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730131181; c=relaxed/simple;
	bh=A4fn+MwxNpxbrPpipnj6USOH52311bFO1tee+DqBA7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mH4tpctCnJZlQ2QyyAK1qp1zf9KJ0Quob5hy5HKUi5fMoga7EMDmeOATO3zVOBp0cZrhoJDTfQzg3sSaNqIlXsNeqejm16Gydiy6lWGDAPwpRAsX28Pcns/f0XblXqAtd6EMcfPg6CtKVuZRrGXlia4t1dm0rkX7h9vp2duG9oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=FGOrbQ2+; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=e1b4gNEk; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1730131178; bh=A4fn+MwxNpxbrPpipnj6USOH52311bFO1tee+DqBA7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FGOrbQ2+isgA0V9KdYZJFQBSQ3DvNSg2LOWH1K4//SCjpnfVa+k3IimCefixyz+RE
	 OI3XUeHBkYFTtMWRyG9sNFdq0Wt1sIRpI15TJBvT3yVc28j2zd2V9wRi+ZtPWxZ+V6
	 UM9G/g/otdhbh0zlUekmt3G504ZLz1ltDpMdjFuqIUtrcsZ7m8ZRJojrDGUFNdddEX
	 M06YiKKzE7vpVLgQgXfW/KNWJQTekNjz3UYzyNqNbgq1EJGzbVCaZlcsQ0ZGM7z5Qq
	 oVxGeqGzh/8Xi1GviuR1IiBdVelIt5dfKj4OcX2g8UKmGHPJljuc7PrOi9ZAHYQNxz
	 mPs+0AvlYD3ew==
Received: by gofer.mess.org (Postfix, from userid 501)
	id 0A2441003BE; Mon, 28 Oct 2024 15:59:38 +0000 (GMT)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1730131176; bh=A4fn+MwxNpxbrPpipnj6USOH52311bFO1tee+DqBA7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e1b4gNEkFZUAYL1w4hcUz+mlW8e6vM3DIAsjEUnXdbrgTYAvXMuC7+oUwV9o1rvli
	 eFhC8QeZ5/L9wLMQuQCMxIsNz86stNtZ+EngnCut8VKSnEtQNdt8aBEMArMtl61/Io
	 cdTm+nloixJjXkIt6koCGTCdXHTJG3QB7zXzafDuoeYvZd3LG+oDehqo76aGt67mbF
	 u+JKASCZVzVPCAnVpk8utNhobwkDoi0Ti6FqV63iBpdbBKKSJ0C6O+GriTdVeEGd++
	 8yT9UFE/KrRRHpvB8Sbh9NUXIAPmWgcGRmYCKY0VT8xHhZekgZ3MW8bAEDL5vpsi/y
	 8apJ+Q08YZRBQ==
Received: from bigcore.mess.org (bigcore.local [IPv6:2a02:8011:d000:212:bc3c:1b4a:a6fa:362f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gofer.mess.org (Postfix) with ESMTPSA id 955DB1000C4;
	Mon, 28 Oct 2024 15:59:36 +0000 (GMT)
From: Sean Young <sean@mess.org>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: imon: don't push static constants on stack for %*ph
Date: Mon, 28 Oct 2024 15:59:27 +0000
Message-ID: <20241028155927.72244-2-sean@mess.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028155927.72244-1-sean@mess.org>
References: <20241028155927.72244-1-sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to pass constants via stack. The width may be explicitly
specified in the format.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/imon_raw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/imon_raw.c b/drivers/media/rc/imon_raw.c
index b02ded52f19e6..3a526dea6532c 100644
--- a/drivers/media/rc/imon_raw.c
+++ b/drivers/media/rc/imon_raw.c
@@ -37,7 +37,7 @@ static void imon_ir_data(struct imon *imon)
 	if (packet_no == 0xff)
 		return;
 
-	dev_dbg(imon->dev, "data: %*ph", 8, imon->ir_buf);
+	dev_dbg(imon->dev, "data: %8ph", imon->ir_buf);
 
 	/*
 	 * Only the first 5 bytes contain IR data. Right shift so we move
-- 
2.47.0


