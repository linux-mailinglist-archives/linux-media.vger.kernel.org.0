Return-Path: <linux-media+bounces-64820-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i0lPJrzdLmoX5QQAu9opvQ
	(envelope-from <linux-media+bounces-64820-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:58:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D47D6819D4
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:58:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hnWbdenZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64820-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64820-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3DE1830164AA
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92442399D00;
	Sun, 14 Jun 2026 16:57:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43223A640C
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:57:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456268; cv=none; b=UOGvpVeuVRXNaPfLo7ktyJ0STiA1x6oW158BoZ/U8Yzcknri0UCnlTZForRLRx9kgmrjF4NVhYGLpVGP/IvbN9Ihj3UUdnOuQChdGN14Em2qzn4rc8rNv57k3o83emXFLY8R0blvu7ZNHinDiNt62pI9iNn0HUKjZBpKBLxWfuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456268; c=relaxed/simple;
	bh=Z3h74gwP7BF0jEK9JY+qtihrCFtue7EHWdvqCo+BPfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m4MXJjDF8hb21MgdtFEaykoErNe1GLUhuJPTjcZZ/CKblfyTB7CcMomHmCnFoUh7GZxjRgFJEzS7Fb89j0kKFMrhEuN1hfTSY0yG9NQDsJyqG203H4LGTjWDpykXAG8qMT4Q+Qp03ccS0IQki+RiSbeGA8FoDeOdxyEBgPsb3lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnWbdenZ; arc=none smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bf0ddaf50fso14426405ad.1
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456266; x=1782061066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZ254FuDlpkoeWBYpCvIm9kU06oNX/xzWLul6wUu4VU=;
        b=hnWbdenZfEbMjXWnq2Chc7T9BYMa9nKI71tBBRolTRBzMAlbYEPK9hMIcYIS3l329S
         L4gy6Pk5ETJU3MkBXUs5edXDBrcfqCLiKRyIDxRANF36wYMQUmmAJUZ+O+eCcO7ElQWv
         TcKaMQGmFexWYH3S2XlRtHl4myZquyYd56BRT8K3iMmzsRNJUDNB5QTv+eVZ9JC5q83v
         LPcc+K2K1EbvgpMOrFBb/ZycK35X0nmzKCA4KfqiP8Ap181k8LLwFWnnB7XBqD2XoWXO
         EinvMQVODaBwMHhJT1v3d8hJ6Pk9Ej0leK/zF58LbI5eRIAT8GIs17ruyHbni2eCqmBp
         C88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456266; x=1782061066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AZ254FuDlpkoeWBYpCvIm9kU06oNX/xzWLul6wUu4VU=;
        b=f35Llc68Yry5eHK5HoeHhJM+cmjz4WD2qemqp8Yd0Y+LZ8xL6tHrLPn9NE8cNS0RN6
         QHkv4dPlfYz683iLrtIFa0mOGsxSdwZL5wPveiqfKfpM2th9o8SRO+zctDNDVCSw6jfO
         xh0sIMtI7Us225lNxm93I7S9F0pqZ+p1tWcFej2nSF6PIoRTsy7Y79G1ged0OhMDyUzK
         FR38bS1/dOEc3yzHc/ol8NeYTXre2hxjGlKo9jFWw226J3VGw50PACtsfSIf125M+aHv
         GpiM578FxgTE2aXGZ08VFK1k5FKiZZ5K6WQsDnDnEAR/8/GHAjTPi6qJhDaTDqrPGyLi
         ddZQ==
X-Gm-Message-State: AOJu0YxJGrzlUwWI6lPwhO8TUOEkyJVBTArozCridvixWDAX1ZZjXOrU
	uc5nTbIfzqFG+r+49TagcMtFN8vjyRmDtnTaQP4n0pFaTdWpm4lEZR/2pb6xXpRh
X-Gm-Gg: Acq92OE+QLW45RK8S+PsaKU/nUO+lOkyD8b41lZN7gENHkFLbrW/Mtr4J7bQUt3baf6
	aHv+EPSO5mZ5gtTPs9ZVa69YBZDG1UU8fVCdE2oGATLhhi/rqXlJWJfwa8z0v+q19+kmzTDAIsU
	dZF8sla55m5PttTW+QcvYGL7jnyjqVAe6gssVc379tJKCE1ysl3jBMVUrioOr5AWMTrUgzvFYV4
	jpvWhxS4x2D43BHWkK6YUs1pVUmCwC5mJyxHYcoiXjHxD9OhJixbeFs6MWsIsPtuqgKbh2q4bNx
	A46uIPPYuwp/jIzOvdtAJl5/fYLIvimNwgmqvwomEEVTo2ilLOkWEPWrOcBmZqlTaDdGUMxRlV0
	HADAzPwioZFTCPwjlzh+LTuRoQ/F5IC1IpvyrZ1PBB/q7fAZRnjMGdLvPkdOuYzyV6MTAJREaOV
	UfDxka0RFiCicxizczmKjAwVwl84aWSi0VP2nPGA0h8W4m0hbTVdxH
X-Received: by 2002:a17:903:1b04:b0:2c2:5446:30f1 with SMTP id d9443c01a7336-2c6641641c4mr85637025ad.14.1781456266427;
        Sun, 14 Jun 2026 09:57:46 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.57.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:57:46 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/22] media: platform: cfe: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:51 +0530
Message-ID: <20260614165630.3896-15-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com,raspberrypi.com,broadcom.com,linux.intel.com,lists.infradead.org,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-64820-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:tomi.valkeinen@ideasonboard.com,m:kernel-list@raspberrypi.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:sakari.ailus@linux.intel.com,m:naush@raspberrypi.com,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D47D6819D4

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 8375ed3e97b9..17c523d32db7 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -2039,6 +2039,7 @@ static int cfe_register_node(struct cfe_device *cfe, int id)
 	if (ret) {
 		cfe_err(cfe, "Unable to register video device %s\n",
 			vdev->name);
+		media_entity_cleanup(&vdev->entity);
 		return ret;
 	}
 
@@ -2064,6 +2065,7 @@ static void cfe_unregister_nodes(struct cfe_device *cfe)
 		if (check_state(cfe, NODE_REGISTERED, i)) {
 			clear_state(cfe, NODE_REGISTERED, i);
 			video_unregister_device(&node->video_dev);
+			media_entity_cleanup(&node->video_dev.entity);
 		}
 	}
 }
-- 
2.50.1 (Apple Git-155)


