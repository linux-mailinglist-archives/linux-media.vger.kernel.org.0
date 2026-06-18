Return-Path: <linux-media+bounces-65163-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G0cYBFjCM2p8FwYAu9opvQ
	(envelope-from <linux-media+bounces-65163-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:03:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B79C69F129
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:03:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=emfend.at header.s=mail header.b=dtqHWUk8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65163-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65163-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 33314305520E
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 10:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058FB3A875B;
	Thu, 18 Jun 2026 10:02:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F37319851;
	Thu, 18 Jun 2026 10:02:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781776942; cv=none; b=P4tIbUULtWi7CEGcMz56MHmj8AeyOlkg7X9fxoQqq1xuxbUGB7CLvLAQt27Og1U4TLb7MeXpb6jI6sQ4AMglNvE5n+uY8GuKz4wilOCg0/SoeZS608/5vC4gQsYcE8HCbd2BdmcgTtX2rq9A1QV1iO/JXv/ru4BDS/ee0bA+km8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781776942; c=relaxed/simple;
	bh=UUFeBc3nTf+mdSy+OgBRiBxJDKpSmicNyl2s+7GXC/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hw50AC8xxxTZ5wzYJMRaqbag11VNAb7JFip8gwKzW4hN/3xRQoEaVKNHu1PKn3mqpAN71VMCzSDg60BXOyjeLX/URHVWvB+hX8E58DOucpP1zT/t7OX8CRoWo+NnwE9X/N+Z645jO2VO8qhQgxfov4YbCZYdC6I5ePBXhPd8j6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=dtqHWUk8; arc=none smtp.client-ip=168.119.41.54
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RVWHmE9BWFatzWTQbfgEUVqYFsnBQZb1o5VC+9q99b0=; b=dtqHWUk8dYlr+IBiM+ZlE+T9mh
	W48JPyYdAsF7DWf9owhDUFCTlb0Y77veUN+2clwIsStsoM/lOrX27yN5OhQ3Iu59AlvnGuT1Y6mNl
	QuhFQEwdb3q0Y9qqjvaxJyky6dei5/0fpedUEg5ivCRqQrTAmpZn5hBxtOPk2SfD5NBU=;
Received: from 194-208-226-106.tele.net ([194.208.226.106]:62135 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1wa95e-008h1k-7m; Thu, 18 Jun 2026 11:31:16 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Date: Thu, 18 Jun 2026 11:31:12 +0200
Subject: [PATCH 1/2] media: i2c: ov08d10: unconditionally use the startup
 delay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-ov08d10-fixes-v1-1-d090ce2abe8c@emfend.at>
References: <20260618-ov08d10-fixes-v1-0-d090ce2abe8c@emfend.at>
In-Reply-To: <20260618-ov08d10-fixes-v1-0-d090ce2abe8c@emfend.at>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jimmy Su <jimmy.su@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matthias Fend <matthias.fend@emfend.at>
X-Mailer: b4 0.14.2
X-Spam-Score: -1.0
X-Spam-Bar: -
X-Spam-Report: Spam detection software, running on the system "lx20.hoststar.hosting",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Two minor improvements for OV08D10 image sensor driver that
    have already been discussed, but which don't address any known functional
    issues. These changes were already submitted as a fixup commit for the original
    patch, but this wasn't applied before the merge. Therefore, here they are
    again as separate commits. 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment (older systems)
  0.0 Local_hs_NotFromHoststar Sender is NOT hoststar.(ch|at|com)
  0.0 Local_hs_NotToHoststar Recipient is NOT hoststar.(ch|at|com)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-65163-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[emfend.at];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:mchehab@kernel.org,m:p.zabel@pengutronix.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthias.fend@emfend.at,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[emfend.at:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B79C69F129

Even though the datasheet does not describe the timings for operation
without a dedicated hardware reset, it seems sensible to wait for the
"XSHUTDN pull up to SCCB start" time even if no reset line is available.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/ov08d10.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 9adef5446a61f3204fb809ca3f077c1afb5f7a47..cb7e55b168781dfeaae553734d24208a374fce9c 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -1358,11 +1358,11 @@ static int ov08d10_power_on(struct device *dev)
 		fsleep(5 * USEC_PER_MSEC);
 
 		reset_control_deassert(ov08d10->reset);
-
-		/* Delay from XSHUTDN pull up to SCCB start: 8ms */
-		fsleep(8 * USEC_PER_MSEC);
 	}
 
+	/* Delay from XSHUTDN pull up to SCCB start: 8ms */
+	fsleep(8 * USEC_PER_MSEC);
+
 	return 0;
 }
 

-- 
2.34.1


