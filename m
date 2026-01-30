Return-Path: <linux-media+bounces-51867-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SK5oKGkZfWkhQQIAu9opvQ
	(envelope-from <linux-media+bounces-51867-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 21:49:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF889BE8A8
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 21:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 46EA13008C96
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 20:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D5D352C2C;
	Fri, 30 Jan 2026 20:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yblp5FWj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3F930BF7D
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 20:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769806176; cv=none; b=OoaBM//XnaIVYw12icoNRdSGbFS87pWglz5wRG5wPv784z6DPtC2PoDEN63oqupXjvFw/dpv8rgKrt+gSUaBP09mxfvFp91rA21on8IRCsh64cWDBXhZnVMk2qJk6Ft0CU2JeQDAxZoHvM2coG7g7HH5smVK5s2ZYdnOBJhceqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769806176; c=relaxed/simple;
	bh=p2zMY3aPCZIvVq+H6srT704qSlr77gldmtNczAYXxi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldv0l2ssAf5FqMu+sf0c3mW8GX5GTHbCkVFaR1ERrObXK5W3lVZTdrXY/k6gKbxH18YrLxVlJfY5aapDqHJnFG8GONnZ44FOaFjVtH5Gy7spGTIGaFxnakUjgFMuHItZS+SUBFGU55QnXllU4KKQWXmpi1KljrNHV+aIpL79TQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yblp5FWj; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b703e04984so141323eec.3
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769806175; x=1770410975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6CpvZFNYPfcLlyPGQOHHlGwc6V5tahEaj7nU7bw5qc=;
        b=Yblp5FWjAZuvGIwzq2IVYby/bYWWw+kaebq7Nw09hjphFIpH4KdgzQyiETP7bSXAwn
         fRE0yscRBorX38B2NKqr0mSFZMfvPcfKqloMtYYwEaOwP2sC/6NOxZOJd6+9qFPm6w+8
         jSN/MgpzMWuomE07tiVr/RKJtq6nq+o6vTvxOPHRRE8otJL23cFBR/Q3KqJmXEKVaGrV
         +2NkTy6F1xZMOXaTDusAjfvzwzMmCmIFYtNKR3YLGqiSM/LACqqTU3fUXWV7pwZ+5X1P
         47AQhve7HE+UeXRZqvUfnQI0eXGmbnzqewLFAM45j36aVUS6qWElzv8NaldEy5lvPEcb
         QQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769806175; x=1770410975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6CpvZFNYPfcLlyPGQOHHlGwc6V5tahEaj7nU7bw5qc=;
        b=IlS8qJB5vP0TFNka18WCAGFCH92E3pJiPuK+UpxxXOkcB5cdVmFTNPvTlU+FN1I51n
         T+dHEWfCbdcwAnCl0qTp2iabJd438jFWyN6IjnmleLVedIbX4jPjYP8kcsooM4hUxhhi
         C0qBrqZb9aZrsN//xIbgg6n1voXf+vs6FV26+97uUl9jSsHxctiqk63wfyV+vx5fIVWp
         obGP5ZHNIWkw9Of3JXi8LjVHkpJ+hJChGTkZk03l4oN8T8kKq7vmGpfWV+qTGQS4syTg
         OP+y+oXe7WD6KRgmjpMX7FXERzpeTt+2EL0jvPfOvBJCqi2ewCQhpAGnnO4+oBP2iiEz
         D6fA==
X-Forwarded-Encrypted: i=1; AJvYcCX2Xyw8RJ/oLtMUHhqCceyPEeiud/FszZiQS4RADR6y6JyRqOzVfNMF143IRdRSBbDtylt5k9LGXbvnZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUrmjeF/VTAI0ywrP+H3FGKci1HqDi9i2ya/qA0nKNDgHD3jUG
	VUcCNdiPHwFKSvqfqKhlO6Id5VFClYh41Wv/oVk71IxwtDnxw/7jmBXY
X-Gm-Gg: AZuq6aLMzIRnO8TyDDAa3ubY536VGcC18UEuqTXhbZ4m4HnG8W/zHiK1pPejytmFWIa
	KtRAcSbdvRsF28DeoHoyWk1D4wlXKi67jKzEY8BhU9akkKjI0eVvYgbBZmkGXt+3TitvxtkbdEG
	EYO+U23NsRA96dSxTq5bcQgBXI43yOkL7XmFr7fbM8Vh48EqfsznjmI2BXnb7LtXagO7C8Y+DWb
	wOto4eAx2+lNv/uhSOApFOhFaBb92yQz4ZRfNhWn/29TigSbcWyT/4trwdywKK8mqJgHrZQMKM6
	avmDLBCPaZOL1YT4kpNxg8pWDwNoz04jPh9E4mXCXwiASJbpHmN2cVB88Q3/H/EM0Cmqomu3cpP
	+2OTxxY9ZWLL7rRReV+aCnLW2g7cZESKO8PNYh8Gc/JQiIx3rrXWozYQ4Ef07tKa1u5ecmxNoQA
	pVUMSM
X-Received: by 2002:a05:7022:41e:b0:11b:ad6a:6e39 with SMTP id a92af1059eb24-125c100d211mr1072667c88.5.1769806174567;
        Fri, 30 Jan 2026 12:49:34 -0800 (PST)
Received: from localhost ([2802:8012:29:1100:899:eb0:bfbe:884f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9de948esm12981470c88.9.2026.01.30.12.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 12:49:34 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: kernel-list@raspberrypi.com,
	mchehab@kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: gascoar@gmail.com
Subject: [PATCH 2/2] media: bcm2835-unicam: remove reference to dropped driver in Kconfig
Date: Fri, 30 Jan 2026 17:45:43 -0300
Message-ID: <20260130204628.312246-5-gascoar@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130204628.312246-1-gascoar@gmail.com>
References: <20260130204628.312246-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-51867-lists,linux-media=lfdr.de];
	TO_DN_NONE(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gascoar@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: CF889BE8A8
X-Rspamd-Action: no action

The bcm2835-camera driver was dropped in commit <90204a38a760>.
Remove the paragraph in Kconfig making reference to it.

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/media/platform/broadcom/Kconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/broadcom/Kconfig b/drivers/media/platform/broadcom/Kconfig
index 32b76ebfcd9a..93ba565d9a02 100644
--- a/drivers/media/platform/broadcom/Kconfig
+++ b/drivers/media/platform/broadcom/Kconfig
@@ -14,10 +14,5 @@ config VIDEO_BCM2835_UNICAM
 	  This is a V4L2 driver that controls the CSI-2 receiver directly,
 	  independently from the VC4 firmware.
 
-	  This driver is mutually exclusive with the use of bcm2835-camera. The
-	  firmware will disable all access to the peripheral from within the
-	  firmware if it finds a DT node using it, and bcm2835-camera will
-	  therefore fail to probe.
-
 	  To compile this driver as a module, choose M here. The module will be
 	  called bcm2835-unicam.
-- 
2.52.0


