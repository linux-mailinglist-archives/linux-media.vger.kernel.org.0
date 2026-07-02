Return-Path: <linux-media+bounces-66333-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GoO5BVpJRmolNwsAu9opvQ
	(envelope-from <linux-media+bounces-66333-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 13:19:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1036F6950
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 13:19:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="HdF/PG/w";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66333-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66333-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CB4B530BED68
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 10:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA19E47CC6F;
	Thu,  2 Jul 2026 10:23:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD6A3C0A04
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 10:23:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782987820; cv=none; b=Ummn2sW0pKIvw8LIko4AKTzRJdnJkFIQVM3nOAH/LXBagXMAbIu9gJJMLRChYVpCsjHR5/aMzBCJHcRQobv9EVpkJBpU85flIb/9Jl99wExUq//Ei/+8J8nnnUxsxfJf9fE0fkwj3yQyyAzTt7CC2faA9hbZ6EbMJnzxB5+7L5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782987820; c=relaxed/simple;
	bh=8ebxSfAwFdX8y0fufp1bMKz1wxnufFEcGcXGAZ6XN70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TNhG4rN7sF/aX856Ea1ng9fWhuJxZy0G6atMuRyb4Wmqr4qYUZVZJtHQEIGc8/55GDq0AK9DcvOfS2E9logCNWNmpFwDiQ3qxXLhailb1ih/1DDBQGaVH+Ksks5MwcseiMEC4Q3EnLG0X+mtdjzZ9dYsO8j1Vq+nRaweNTsMvX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdF/PG/w; arc=none smtp.client-ip=209.85.216.49
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-380a02c71e2so319397a91.3
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 03:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782987818; x=1783592618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WQbhf0PDuA01ZD7nObij5gOdm51V2Y2C0eHPBfMpUGg=;
        b=HdF/PG/w4TYpyXNLV6Ju1kyiM8Pv1GL8DfJR9nTZuoSF1tjS+FNtZctivtGK6r0Gae
         pO+IQwvl6vMOMqmQhZjvwnU9cJxGOgKlhvOwaIMGefBqW97oN9XxSHXlQzydKIBJmj4W
         LL3esYk9ttxi8yEmkGsXeMWUT9CK0bUFjB4aEA3rcxzrGBGXharJ11EMQapKIR2wY04j
         maEqlAMkTWwN6N+UhTNVxaz8S0F0ZRbSO6eRuPw2TUPcMV8E4wuVftHkV1GyZ1piTX/W
         IH2F83jAyzBTqzcrthBZmGYd3Z4Wut3bo95Gx1lcuPv+WvBYRXjLTymlE+JJ5NmvxJ+P
         7fZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782987818; x=1783592618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQbhf0PDuA01ZD7nObij5gOdm51V2Y2C0eHPBfMpUGg=;
        b=h09IkflBtnRye89PLOQ3UGj63wYpKk0J05Rae89vAQqQImKFQfn+kq6GEiyMUs3bDB
         bPQ4PQEh367K96QCRjtbeSv7ditfQcflQv0QqnlWJIwAXHSyy1BTABps9KSR3emgyIFH
         3hRUpecRREFvWxMxlusNHb8aGrc6W/XYyWhrfyrpFkLZo8GH2m39FXe7qxfcVoyG7xWg
         GeyJFMH77DF5hHWaeWTiyT8PZB5N3RDhmtjtzehgWZvuNhUILbhkVn7C4keruYN1ZCQ0
         PFWycGtpMv9yEXmKESDRJNrNnIg9xt2WkwuYBSi3cSsI6Z37ZrzWCnr1/FtPevHSyZ4O
         jH9Q==
X-Forwarded-Encrypted: i=1; AHgh+RraH/Q/6GWfBE5warTaeSzWQKcITCh0Ti/2s7iYYktk5oQQtEmztBKLbwqtm2bO+5xsPQIoRlYrr9atkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsDxKe+1lRw2BTCrFbjwWiSBi1z+U0SsEkCTZ3VLGeTRrTvlLc
	W2T/jfTHRA7Gbrzs73u1reM5lp8fTMwOlRQ29WxHbyzIFq2QPLlbKrar
X-Gm-Gg: AfdE7cl2AUuXpDCQS/nAxnlWf1UKHFDR0YjcycbTvHFAilQwsgQqfsQOzSFq9T4rhjY
	uw3GeEicgsDeQ0valegDhc+8JokY1ejwpuoe8blgxhAKCiRSsvSa0aD16LyP+VF3IYY/2Re7Z5L
	b7ClInRoTgl8dlO6TsKvklo0qAxySwvDo5KMcgzd8fUaxmV5/YJxHZhlxamUdHwPV7LmGc2TeSr
	e7kZla3Wv4zzkleHSa9wsMztetM37fhyKFPcO7APAldGqFpcAI9FVvpmXkePtEmUXjsVhi1SLkH
	bsW7WUuj+YlvTND6Rk9qZcoqc5g8rvKg4+332mWb7UAKZjqlgcRrBcvfyukKapllOstQIp9ATnH
	L24qtjlIFdNR9G/E9Reolf73OAr/4n1HeoyFsSuMXppxZs6Ijb1mj90VmnRBTXMIezE0Ma0iPWw
	JZZR9vzCYBOzl5OF8HPjKluk2F4rqxue8oetC1ZQRMeS5ibD+qzsZnfeKiSGdYn2BAbxTUfsVSv
	sSxdqJyHgArWh4xOygfV7Am/oW3N9/XUNFzcSAs3MhGAqnk8roJKti8pUyhFqJb2mgoZe6VcYAb
	fPBAPG8TlZmKNvhJgEfNB/gnrgt0jzVcutWKSA==
X-Received: by 2002:a17:90b:5827:b0:36a:5438:cff4 with SMTP id 98e67ed59e1d1-380aa23f18emr4042824a91.6.1782987818250;
        Thu, 02 Jul 2026 03:23:38 -0700 (PDT)
Received: from midnightair ([2401:4900:1c94:62e8:bc10:77d0:2fda:415d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc38e5fsm7601827eec.29.2026.07.02.03.23.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 02 Jul 2026 03:23:37 -0700 (PDT)
From: Anas Khan <anxkhn28@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ariel Silver <arielsilver77@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anas Khan <anxkhn28@gmail.com>
Subject: [PATCH] media: dvb: update relocated IANA ethernet-numbers URL
Date: Thu,  2 Jul 2026 15:53:33 +0530
Message-ID: <20260702102333.63982-1-anxkhn28@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66333-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:arielsilver77@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:anxkhn28@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[anxkhn28@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anxkhn28@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,iana.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D1036F6950

The IANA ethernet-numbers reference in dvb_net.c moved to a new path.
Update the comment to point at the current location.

Signed-off-by: Anas Khan <anxkhn28@gmail.com>
---
 drivers/media/dvb-core/dvb_net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index a2159b2bc176..ca953c0180ff 100644
--- a/drivers/media/dvb-core/dvb_net.c
+++ b/drivers/media/dvb-core/dvb_net.c
@@ -966,7 +966,7 @@ static void dvb_net_sec(struct net_device *dev,
 		eth[13] = pkt[19];
 	} else {
 		/* protocol numbers are from rfc-1700 or
-		 * http://www.iana.org/assignments/ethernet-numbers
+		 * http://www.iana.org/assignments/ethernet-numbers/ethernet-numbers.xhtml
 		 */
 		if (pkt[12] >> 4 == 6) { /* version field from IP header */
 			eth[12] = 0x86;	/* IPv6 */
-- 
2.54.0


