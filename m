Return-Path: <linux-media+bounces-55547-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON3MDv8xs2ntSwAAu9opvQ
	(envelope-from <linux-media+bounces-55547-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:37:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 983E627A179
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FAC231CB6AB
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 21:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC423EF66B;
	Thu, 12 Mar 2026 21:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="bUInnWCd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE29D3EF663
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 21:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773351343; cv=none; b=Fq0MPBkHEWPOEqRSIYih6qxclUTaE6UzVnPmTnUKnQfngtuL7sEgtkXJ3j6nwSrqFuxwIgssWSymmOreD/wvcqQS+sOnwZ9k0QE5+QhoN6O2HEbTZQQFUUhUL0PHT3bvfFpqMEhcK+YT8bgwcQSsvUwwvkvISrkH9caVGoNchDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773351343; c=relaxed/simple;
	bh=G5gXEEsa1XXMfThel8gm+zSa9XSDoJIySfGgrLAXSmA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JW5eZd5uhUIDfcUvgI+XKH95FZx5jqB159pt2jDIs6GFzWYeF54JdUYmlB5CTBo0I1Sn9ZRqiJUT8Au8c6UYOkrxZWBqZDP6OHC5I4BD5eNPjjdJ3NxqtmbaJxy9FMTo58Oz6nhvfCjQCD5Jmg71nPD7eMhE7sfAkQ3NSoNKxBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=bUInnWCd; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-46704177508so1053976b6e.0
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 14:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773351341; x=1773956141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLcDLrko0Sry3TXu4GxS+PAnfXACl7LQRlrQbuj7I1I=;
        b=bUInnWCdUsgF2gowKmAVyX92GhByWVZjjuxJ6IM04BmgjPMb+jb39A1mKBy7vby3Yh
         MIL344lQzHJne8FWEKIZ8qdJgBQ7KG3EVMV3aRy1eUannVD8admzycoiJns+2iCcYr3s
         H0LN/dPymiPYKhT2b6BWj8PhGIfD866knKoJgGUWUimTbzEMJIl9Nut2dlEkpm6ow0Th
         kX7CBiH+mphtjnWDZUbkO5TAvt6Cc2CEbtMzhr8ADfMkN3IoToSpzwVN6jRmN4Rbvu5f
         pIpuCX7RA0BQMehz2n/4r2z6Q07GsPvNdYVFgkyp+aHcpA1oemHPvTYMYuiBWPP7F9ap
         c5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773351341; x=1773956141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gLcDLrko0Sry3TXu4GxS+PAnfXACl7LQRlrQbuj7I1I=;
        b=I/YxEKImQsRZy77L1usuquvUVic4YWsivU9YKYyuc8vVljxPENFBWIPsL3QiuFTKGP
         1mutbC9NwzjKIT6WVLpUIDWe9zjpoK1LC/SmOq0k34pdy/xiLhzE69TprH1/BGLvd/nW
         c1xwk8aslbvLuEuuznKCMpvLfSYtKOgvb7xcAxWZxFuEFtJE6tElwitg3+YypEGyTnQF
         HnfHScINVq5EpNH1v4QXQmYJtjJP0DIUu/D2h6SoaMUVuxW/i/eGLW/ZgX9SBWZJI+TU
         ScUUREiz48DiHAKW2hOityDH8kluzLemQZJCbE8Ztx0PBSFqnDcF8c/qNqVmW4Y+PsOF
         mZvA==
X-Gm-Message-State: AOJu0YzLv25BZfP7dvBDHIGRr8YNkYnBJF5W75cP7+zmKgq86igkIxUw
	TaAeIpkdBOvouqr1BjFXd6OGxG2yMHBXTX2Ojzv+T+cIIkAkxbG9Da6EpSDkIomwEjUeEH/HDxj
	W8Y6AZSo=
X-Gm-Gg: ATEYQzw2sZx1LqrnJjmhV/G3KBMtX7gWJPil6fv1pPC53Uqi1bpcAY8Fsqy0hBLfClx
	N9gJT8Qndqchi41cwUoEEYbwNACEqS0D20Hwhl/wDFTpkuscrB+9kqg6QwYAZfgZrykfzwbUYfR
	MsHQd3OC1PEFrg2rtSRUtC8L5byOM/8AaT+rQEGPt0iq5QwDSXra4LuE2g8CZ/OAwaoZ5Ui4aKs
	9zW8lSFztWSFIWg7tTPuxofQ1vaUX+KjpG/9+CxYk3kY7A42+3VydefyNId2Nmsfer27YKhQ3H2
	GZniUcEKZmyi7XVoXGLdT0gQDgF4v9V94UzXiFjLcH8I35IGqwWr9edFqjLPnXarHk2ANNCFszL
	6s/jkUADw9XWgXTxE8mIVzMNES+Pc8lbxZwD1BFejBYgEa+aFUfNKBa86rD6Y/PcYSGRCeNDkZc
	09RqaX7e84BQsn/rFLdhqyYRTlSByGi07dHW+jyiFuLirSJjtZeZ0oy+aHsdqeca5APK5d/vRKz
	bjOwjFqngxRRsozM+0=
X-Received: by 2002:a05:6808:1b29:b0:457:a9bc:dbe5 with SMTP id 5614622812f47-4675761c5e7mr442515b6e.42.1773351340689;
        Thu, 12 Mar 2026 14:35:40 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4673415c264sm3657572b6e.5.2026.03.12.14.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:35:40 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 07/11] si2168: fw 4.0-11 loses warm state during sleep
Date: Thu, 12 Mar 2026 16:35:28 -0500
Message-Id: <20260312213532.2907276-8-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260312213532.2907276-1-brad@nextdimension.cc>
References: <20260312213532.2907276-1-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55547-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 983E627A179
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ignoring version 4.0-11 firmware leads to non functional devices
after sleep on all Hauppauge DVB devices containing the si2168 and
firwmare version 4.0-11.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
 drivers/media/dvb-frontends/si2168.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index 9f2c503ec331..91d959dddcb5 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -574,8 +574,8 @@ static int si2168_sleep(struct dvb_frontend *fe)
 	if (ret)
 		goto err;
 
-	/* Firmware later than B 4.0-11 loses warm state during sleep */
-	if (dev->version > ('B' << 24 | 4 << 16 | 0 << 8 | 11 << 0))
+	/* Firmware B 4.0-11 and later lose warm state during sleep */
+	if (dev->version >= ('B' << 24 | 4 << 16 | 0 << 8 | 11 << 0))
 		dev->warm = false;
 
 	cmd_init(&cmd, "\x13", 1, 0);
-- 
2.35.1


