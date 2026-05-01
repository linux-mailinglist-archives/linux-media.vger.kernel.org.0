Return-Path: <linux-media+bounces-60145-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCtEFTjJ9GnEEgIAu9opvQ
	(envelope-from <linux-media+bounces-60145-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 17:39:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8A64ADA68
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 17:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC46030059B3
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 15:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173513D093A;
	Fri,  1 May 2026 15:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RY/aF2as"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9187255F2D;
	Fri,  1 May 2026 15:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649971; cv=none; b=u0GBuAo/JUFJv1OMwxeIqrrXf6AvJ5qx3XSeBldJxIM0uovXdRAI+W2TzmhR6qIOJxvqOXJ+zWJmSUp3MZFWXf3RZ9W2vd/WgiRRLKpOG0lzs0PsFP+zCk6VzF5sZlSfw+OfIJL2DK9XFbD/RofM3l3SMkxuDfELQPo8/Jw5BPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649971; c=relaxed/simple;
	bh=ZMbYZ0ueyUUGxY4UYaRmSwcarki7KceA+nFGKPjSRPM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XUMs9GpBw8UDVNQee4swuCd3rsxxLqtMMeyQy8RmnIvCqIYZ8OhVftNZgWNUPKmcePTh3kz2epCzb2VbaS7peRTwbotzb6Uy0YhJASZsruAsCjIjHiG3CJoD0n+5hGqegJ+/JlBKIc++2pn9aeS88oawcuRkL8MUA5jusq7X1/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RY/aF2as; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0D551E7;
	Fri,  1 May 2026 17:37:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777649854;
	bh=ZMbYZ0ueyUUGxY4UYaRmSwcarki7KceA+nFGKPjSRPM=;
	h=From:Subject:Date:To:Cc:From;
	b=RY/aF2as3lOUUTjFUWk6X2UzLNv4mYy0v50a1y1M6cMkRLLyhA4qIMlsvPVm+y+7B
	 2sc3bTBPJmZRpQqPl28Y9rj4A3iFORQ6i7Zt+iDErdERIG1Rr2Cfh5pxz3SS4rP1D5
	 uEYdXRuKJxiwJN3JFxrjkQf3hhZDsA/oMcYIdngg=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 00/11] media: i2c: ov5640: Refactor ISP configuration
Date: Fri, 01 May 2026 16:39:02 +0100
Message-Id: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABbJ9GkC/x3MQQqAIBBA0avIrBPMskVXiQjTsQZCQ0kC8e5Jy
 7f4v0DCSJhgZgUiZkoUfEPfMTCn9gdyss0ghZyEEj0PWU2j2MyF2j831+PgjLO7VM5Ai+6Ijt5
 /uKy1fnVb/FVgAAAA
X-Change-ID: 20260501-ov5640_cleanup-a43fcfdb25fc
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777649959; l=1625;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=ZMbYZ0ueyUUGxY4UYaRmSwcarki7KceA+nFGKPjSRPM=;
 b=WRvYtPndeGrIS3ygjgY4sLumLbx+9wv/CS2ocPfg8p3BWmB/HgeTi5E/gshj++vUH/f6D6KrP
 VYshOGOVdG3BV8jSMldzTfIxNmBJpikyiRcCUw914ZMY++Rf3FXq+wz
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Queue-Id: EC8A64ADA68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60145-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

The OV5640 has an internal ISP which has hard coded parameters for the
AWB, LSC, GMA and CMX encoded within the init register table.

This means that the original upstream submission contains module
specific tuning which do not match any subsequent users of the device
with the driver.

This series aims to commence the cleanup and abstraction of the
parameters of the OV5640 ISP to make them configurable and adaptable to
new modules.

Fortuantely a full register datasheet has been leaked publicly to enable
this work. I won't specify where this is here - but it can easily be
found online with your favourite search engines.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
Kieran Bingham (11):
      media: i2c: ov5640: Set default WB gains
      media: i2c: ov5640: Set exposure minimum and defaults
      media: i2c: ov5640: Fix minimum gain to 1.0x
      media: i2c: ov5640: fix error path in ov5640_set_mode
      media: i2c: ov5640: Remove unsupported bayer orders
      media: i2c: ov5640: split out the LSC registers
      media: i2c: ov5640: Split out AWB registers
      media: i2c: ov5640: Document AWB control registers
      media: i2c: ov5640: Add ISP Control registers
      media: i2c: ov5640: Disable ISP for raw output
      media: i2c: ov5640: Split out format mux registers

 drivers/media/i2c/ov5640.c | 229 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 164 insertions(+), 65 deletions(-)
---
base-commit: 7666942083e1f5b82dab5fe8df17f2f932aeac7c
change-id: 20260501-ov5640_cleanup-a43fcfdb25fc

Best regards,
-- 
--
Kieran


