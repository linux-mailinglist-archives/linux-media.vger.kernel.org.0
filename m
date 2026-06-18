Return-Path: <linux-media+bounces-65164-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i9cuI+DCM2qeFwYAu9opvQ
	(envelope-from <linux-media+bounces-65164-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:05:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6B969F170
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:05:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=emfend.at header.s=mail header.b=avqRQNDn;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65164-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65164-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB930315CBFF
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 10:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A703D3D15;
	Thu, 18 Jun 2026 10:02:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7456388E45;
	Thu, 18 Jun 2026 10:02:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781776946; cv=none; b=sjy+0bnkTdHzf836/DPrwU+ybOzIRUpa76CThuWtW7qS9iuAwFL1QQp1LByfoPRkiMfVP4P7gyMOTremcVyFVQHrFcDnE+GHVdn9zj8pe4HRAFHeGYqNYMiHFqJ72FM+PnnIkP7dTDxe82PVLVAflZc8bsYPPVekBW/3boH5lBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781776946; c=relaxed/simple;
	bh=684/nJ3nEKpm9/tAnOXUU71+7Vw0T7Le1eMIkSgMB+c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BFnyV8allINggsnViID17cLMqnA3luFINWrVzEczyiqeofDVZPUPaNaizufnmRrRAbJ/RiLoQHWWaukcTNwGEfDHFJeyrG3yXvxOR/oPMExcIc5kD7hda2C770+MZY8KoSJ7AANLiNDB8Li5eT6yEPyPXMZCXxzY7G3KiHEZDsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=avqRQNDn; arc=none smtp.client-ip=168.119.41.54
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/+nUeUbbEdX2if9HRUUc8Il/tH+GcFt3sWinucKmjz4=; b=avqRQNDnRNxRKvN+MijZRplmWC
	vYKpxYCK7aEYBWXZy+rQxGAH9sOs2wKfCmgfSzKKT227EdmfsXMy4k8EqPEfa/IRcPGeHD+fhiFu0
	VhyWauHeMIBYK1X78fAaM946vqCUxCDZ3GA6Gmm8oiYjOAJv7QttfTZp28HnEUbprrjs=;
Received: from 194-208-226-106.tele.net ([194.208.226.106]:62135 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1wa95d-008h1k-Ku; Thu, 18 Jun 2026 11:31:13 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Subject: [PATCH 0/2] media: i2c: ov08d10: fixups for reset and power
 management support
Date: Thu, 18 Jun 2026 11:31:11 +0200
Message-Id: <20260618-ov08d10-fixes-v1-0-d090ce2abe8c@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN+6M2oC/x3LSwqAMAwA0auUrA2kCvFzFXEhNmo2Kg2IULy7w
 eVjmAImWcVgCAWy3Gp6Ho5YBVj2+dgENbmhppqJY4fnTV2KhKs+YijUUM9Lapl78OfK8gdfxul
 9P54KNXJfAAAA
X-Change-ID: 20260618-ov08d10-fixes-e03096cd7669
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jimmy Su <jimmy.su@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matthias Fend <matthias.fend@emfend.at>
X-Mailer: b4 0.14.2
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-65164-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[emfend.at];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:mchehab@kernel.org,m:p.zabel@pengutronix.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthias.fend@emfend.at,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[emfend.at:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,emfend.at:email,emfend.at:mid,emfend.at:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC6B969F170

Two minor improvements for OV08D10 image sensor driver that have already
been discussed, but which don't address any known functional issues.

These changes were already submitted as a fixup commit for the original
patch, but this wasn't applied before the merge. Therefore, here they are
again as separate commits.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
Matthias Fend (2):
      media: i2c: ov08d10: unconditionally use the startup delay
      media: i2c: ov08d10: respect 80 char line limit

 drivers/media/i2c/ov08d10.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20260618-ov08d10-fixes-e03096cd7669

Best regards,
-- 
Matthias Fend <matthias.fend@emfend.at>


