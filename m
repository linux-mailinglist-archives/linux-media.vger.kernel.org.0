Return-Path: <linux-media+bounces-61082-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMzdGF6zAWppigEAu9opvQ
	(envelope-from <linux-media+bounces-61082-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:45:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B3550C20B
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C20C306D17D
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 10:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B813DA7F1;
	Mon, 11 May 2026 10:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvGLaGKS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B343DA5BA
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 10:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496176; cv=none; b=lsKwMCHZoY4gLLr8+PsrRL/ToClp+AGQLCQNrxXnvMmPh/numIkOcy1svAEoJLTNU0C4Eoj+4ZWdxgpMrT/IXPRYfCV8E5zcKhmVw2quCVcWVyjc6OjKQ53zRbr4nU3J71Agjf2blTX8PIOiy4E4HDv/ge5whU/gP6VB+x++pAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496176; c=relaxed/simple;
	bh=2Fbe+51I+NHaqoJEm/Ia1P/RkOrsQ8sOHQ84+D4jX5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NeIEylks0EoEx+xIuo+ecnwWr0f7/NlZdOPHJCkdWqsf+7UP9bcU8jv4PKCD5lyNHptz2PplhU+RitvtuJCCvyUcAvNRR+SUxcYdfUYRx/ToN3zajM/XRwVYbulumroKE8DRhqbzEMIVmq0QjVD5upwBh15I7vpjiX8rwN+gTyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XvGLaGKS; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-367cbac9c37so1179431a91.2
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 03:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496174; x=1779100974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=XvGLaGKSFPmqZENA5e666mYVr2m216rLf9TaaxaRCCh/Q1cOxaEueKSvJ3FvUyXjN3
         XAEzIC9lG/TdvzLkQrzRpHV6kGlJdUttejwUVK4g5ECGnYkz+PHay07PtqIb+ldNe7nb
         pe+SxFAUHV+1ffTkLKUiD4p1i7LjjTE0ld2fCLt2k5xTq6LHywZzQSTdm7mvhUmGpDIJ
         jPnqavGyg0vBiI7DIcIX6LIlWDjMviopYO32UEqYhjOfXfQF13H6XxDO18NQmGRUSbtQ
         r5hdYf56mghiGYldRiQLfUnPwioEOHalit+jOLRlWdIOVRy58BXCvVNhktZFicm5esh8
         Il0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496174; x=1779100974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=UH094rhWpyiYUQL2MTTKraB3vrg3tCsKgmsdqEo4WQLmwrUQcO3H61VXDMCqM0SUu2
         An1SS8mT/JyRDLVDVvmKnFaUB/sjOVFNlYzUIcw1w/vIc5WZeMYordg3s5CVn2k2pind
         ae0ZppOBVXB0KNYA2V3op5wycEiD7Dn8f5Th/RWuUOHpYqkwTeFyyrqq2/Eph1HLj8XB
         Ous65ssyf9Vs+XAmS8QeN3yBoUjOTSyuWRFMU+TcgW31xWeaMWg/PzCysE9d6KdUh5nY
         WMWYqJ469o1wyFF6NusoevI3e4gUo8Dlac3Vb1QD85DUjcpzOAg6A7Ef0RS6jathMb5x
         jFfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/R6ChsZi5RVx8tMZMMhcbNJx+4OSTafW26Vq1Fvi2fJPQm4lx4XdkT2UbdDoKPA5eSwQLQpQYSsLx6bA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxISayVtOqZoo2+k/jgZMgrlnKfSTQMYVycFpP5YxeznbLT8fLK
	v/b9l7ERLfwgcqGecqKCdowMLi/D54bAVJxtAduwaM5WDzA4UEnarVJm
X-Gm-Gg: Acq92OGmpgLZcJAlZjgeGSkdyfXVVudqeLxhqKc2bmSJtb1yrlE4KSSSSGU/UtBhqlD
	P8Je+rQJ7J9j/u84BnNe4wf32ySfjdJUtKaNEABMS2rnY73xLOVWGRc80/PMIdHyJuH2uhDbrAd
	HdofFSjOmGMWVe14r0RW7GjL4QoITv4g9P8GNDX63XcBJiU6S1BP79rZaF6GNwwL2dLkQu4/eyy
	6J2y7qQMY6V6T8SVFH2RUdMSZbUkrXiNjfepb6zCy1YiEu0fORHhjaa+U7pmaaNQ0rrxS5anqPL
	LWfEo357XurrWRVRiMZyBW7iL/pGOmQhgLhYr2uSgvhGOPLn1JBKXVBv++K/IGgKzJ2iznQHCEZ
	x+UDM75TJS2uIwbGc5fW5PnRqpZn8XEw8VW6X24bvhGBz5fogbfP9WCvJxkCyGZbWEKsF2HxQSp
	eiltSafld4MFwSjynaQ2KpyYYsidBs
X-Received: by 2002:a17:90a:110f:b0:366:1c9e:99b7 with SMTP id 98e67ed59e1d1-3661c9e9b87mr11161538a91.25.1778496174159;
        Mon, 11 May 2026 03:42:54 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm7533423a91.11.2026.05.11.03.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:42:53 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v4 1/5] media: hi846: fix hi846_write_reg_16 handling
Date: Mon, 11 May 2026 18:39:23 +0800
Message-ID: <20260511103927.279550-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511103927.279550-1-mitltlatltl@gmail.com>
References: <20260511103927.279550-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 27B3550C20B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61082-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linux.intel.com,posteo.de,puri.sm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.983];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. When hi846_set_ctrl() passes &ret holding this
positive value) to hi846_write_reg_16(), the function returns with ret
as is, the positive value propagates back as a return code, which
callers interpret as an error.

Fix this by resetting *err to 0 only when it is positive.

Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..7f069aca0fce 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
 	if (*err < 0)
 		return;
 
+	*err = 0;
+
 	put_unaligned_be16(reg, buf);
 	put_unaligned_be16(val, buf + 2);
 	ret = i2c_master_send(client, buf, sizeof(buf));
-- 
2.54.0


