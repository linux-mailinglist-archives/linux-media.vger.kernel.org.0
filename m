Return-Path: <linux-media+bounces-53442-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKjUOZ4RoGnbfQQAu9opvQ
	(envelope-from <linux-media+bounces-53442-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:25:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FF41A355A
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6DFF3305B4A3
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 09:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E0339E6F6;
	Thu, 26 Feb 2026 09:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="TmLiXr3R"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915E43A0B3D;
	Thu, 26 Feb 2026 09:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772097807; cv=none; b=N1AnMD6+xuGCnuykauKUgCYsy/sW156LLELnzQeaqk67s72g/XEVqNl+VHuvlIxUCj5I1ySImMorSOyKrCSjJfScrVXZzBUS+fgkp/GGoXwHEAcQwTGtnfbutV1Pxp67PCojGnonVnNuOZGcUXS3uaOCf2hlizAcHIBenVNX8m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772097807; c=relaxed/simple;
	bh=TSWTKTkuuOfPbgCIOnTtw4yo2o/4mWvELCfDzqUyjxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iWeuo2oFZDC2q5JFhcg1cxHeAdGjtZoUgQkPd+7nHgcSigFOcpf+NjK+OeKlbE/0UGz5qV7sM+5Yq4c7BtlntMTM/iZMMPxfPLIQXsYkKYmzd/BdCpuRb3OLjSO+BhucVS7mtNaqjFnT3GKLMrNp/i6pZ9CPBkNJIo3me922tHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=TmLiXr3R; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vGozd6wdbG3TZ/NdQDVFXjQzFodImDZCVvMYzOqqcY0=; b=TmLiXr3RygqWP+tasXK5eGK7Iw
	LOfcPxja+nDUXx+SiflzYsyb4gHt1ioY1OzsuNzE+WhLODvNtyq7fUQ3LeCgPrrqEYMpIL+9fJc0Z
	pCidk4DdnTo3QttNWxcr/v8EDDwsowXQaqgSwZG7VRLS2ss5hkDVsZZLbawbkvZO4Hsk=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:64689 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1vvXAw-0018Zt-On; Thu, 26 Feb 2026 09:56:50 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Thu, 26 Feb 2026 09:56:06 +0100
Subject: [PATCH 6/8] media: i2c: ov08d10: remove duplicate register write
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-ov08d10-v1-6-c3a916368123@emfend.at>
References: <20260226-ov08d10-v1-0-c3a916368123@emfend.at>
In-Reply-To: <20260226-ov08d10-v1-0-c3a916368123@emfend.at>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jimmy Su <jimmy.su@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com
X-Mailer: b4 0.14.2
X-Spam-Score: -1.0
X-Spam-Bar: -
X-Spam-Report: Spam detection software, running on the system "lx20.hoststar.hosting",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  The current settings for the "image vertical start" register
    appear to be incorrect. While this only results in an incorrect start line
    for native modes, this faulty setting causes actual problems in [...] 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment (older systems)
  0.0 Local_hs_NotToHoststar Recipient is NOT hoststar.(ch|at|com)
  0.0 Local_hs_NotFromHoststar Sender is NOT hoststar.(ch|at|com)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53442-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[emfend.at];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[emfend.at:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,emfend.at:mid,emfend.at:email]
X-Rspamd-Queue-Id: 66FF41A355A
X-Rspamd-Action: no action

Register P1:0x33 is written twice with the same value in the
'lane_2_mode_1632x1224' sequence. Remove one unnecessary write access.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/ov08d10.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index ee193ba44f17d5659b3e22329b5e0ee421e3668f..fa8d29a62fbfa956dff6b57ccd6c9b7777967731 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -410,7 +410,6 @@ static const struct ov08d10_reg lane_2_mode_1632x1224[] = {
 	{0x07, 0x05},
 	{0x21, 0x02},
 	{0x24, 0x30},
-	{0x33, 0x03},
 	{0x31, 0x06},
 	{0x33, 0x03},
 	{0x01, 0x03},

-- 
2.34.1


