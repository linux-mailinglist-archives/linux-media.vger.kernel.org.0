Return-Path: <linux-media+bounces-59110-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPCkHnOS5WmvlgEAu9opvQ
	(envelope-from <linux-media+bounces-59110-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 04:41:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E19042660B
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 04:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE92D3034648
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 02:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714AE378822;
	Mon, 20 Apr 2026 02:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20251104.gappssmtp.com header.i=@quanta-corp-partner-google-com.20251104.gappssmtp.com header.b="JLvojDjN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFDF377EBA
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 02:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776652665; cv=none; b=D8OpNaVkTieul9SzrcHMG/5Dtn86yXrXNCIyXVIXIyJ9JKo2BdUhStHR+ZWPry2laf+mYtHrvgAR5E8WIe5wuF4SjG8jvXMM1CXvY3nZ7IS2f2oe8VuxkmWUeWG0IU0hJd9faUcCRuCVCMwFlkMoMtrhTSTmoEUNivy9s41Tcxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776652665; c=relaxed/simple;
	bh=ld8CEyg0rXDH8j591+SJR82yaUQyXvOHznc5li3fAvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dOaYyqi9DgofFew7ay8s5N4PC1ye+njRzFvcmgP/DSdRU+iQwrz4VwVV8u5Gll+ZyC4U/P7x6QH8pRVdMakC9WvEkD7wcrfQL0WlCAQKRrWJW3eyvxTsNVU6axnzU8aqxow2SxK2nJtJma8XcY/d0KbUSqJpvNQYRxtfk2/vzjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20251104.gappssmtp.com header.i=@quanta-corp-partner-google-com.20251104.gappssmtp.com header.b=JLvojDjN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a9296b3926so13396105ad.1
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 19:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1776652662; x=1777257462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yKHs/PNY/ofe4y8OFF1XE8lKpCR4K4vYDfp2ZW6ZepE=;
        b=JLvojDjNqLa0q2RO3shhy/ViMVU6dAgXwHfloI8sUS2Z47LEvoRX/Itbh0JQv3RIOb
         ea0I98SHesKUWZKeoun2eGj39Jnd3q8ahvim+wWxNA+Z/tdPrIQRX2P7pILVImJLrHMA
         ILxY/lJRAqiSnJowNMOefsBtCqckwYjzrJ9Nnm38n7Q+UYyVA4Rband+M5RlsqnGqlYE
         USY23lz5TSpPs1grDCJtdi1yCelQVsevdRzKAteWj1mpjU8/bg0B5ReIsgJV71gfZNge
         WcEHTwIyPVt6jRtmtJ7JPqSxB/6bozGSiHW37iWwDsURO0Dr/4fgeVbgEKZzEMIGmbTN
         Zsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776652662; x=1777257462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKHs/PNY/ofe4y8OFF1XE8lKpCR4K4vYDfp2ZW6ZepE=;
        b=bd9vNIkNDCPBd3kolcS3UYHKydlC1z4W0BEUTMIJqfWeOcntI5qd5H7F2tjJz4IFNg
         TMGX3avFRvM1dGxiidglLxbmqUZmRpk018ZVEcN4wd9nLjquTGAMUG6Tlq6RmY3HjGxg
         BQTT33V7uhzXP1QolFMoophC/3vIyRYQkagtlMfLy4FzXm/0q2AIu/sLPYxghnz1xAZk
         SGEJXMO1Wj+BkWkC7fo004DPEDJmhegOllHni1k9vHNiZvp2UAZHJTl0NAAYDm79lRKl
         RIXzLTzP3N3p+2XNwWvNsi5XIpYxAAPBarvVCgv8/L2NCLXM31VpNgrx8mw3LZu7AK1i
         BpCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rXSfZyb0Ohehaw6tfL258h9rrSHovsg9JuxPQ6H10w1k4Htac49UqC3rpS0wCitva1jGfp4CLlAjvLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBMFGxMa9Zd49XK8H03d9YVj5Lh836gHWONinGJsIUGXWjfFHO
	qUTTf+qYXremRAgXdqFUC/9/nGG95L8ngvTV1+20ZwSIOI+DNQfCgNhQjJjGxTnwCBhVzFLAtla
	QGw1p
X-Gm-Gg: AeBDiesZk7/enaRVpd6FOChHukirDsUYL78ycJqM7IUUrEPbWc/Iq/zvOxOfvdAs1LK
	/fG7tYIe6T8P7WXH2DMEuyqYdes0LjMJJVNvoECsVa9R8Mbxozg0tGa48jgXQJSgZcCfMyAc+aq
	ce8CUV7BJciJmWdCNo4/Ibb8BjrJWGobKkcBefew7lHYN2LU7/EsufSkSbK4UO51tNQo6TSBgE4
	tR77o01E2iNqZcHdBqHUB53bCwCDxdoI/B/bLHigEwvKvg9Yk2nRSXXSbiGyh36H4iwHFBdJT3a
	EhGJRfT2Cs0kmOd9n3FlGbOWGMcuTuUucW77i637Mg382X2RX9bPzKlMRBU/rN5DDlcPjZ9rwkC
	NgES1A3WaImw8z7yEjfddghnpNoOY+ZbVV3wlUTDz+7PJ8nw7zzMISw9+lhdgwwm7RJiyz8WspO
	1fB441p3NnZ+EHMHkbXWByJkNl5FG+vyVGvg4/yXDwAwEFoCpE2N/Uxn/lfyonRF8EsPaECPYUM
	gAKUWkdXUGxsPOfc6bsa0STaBRhs83Aig7QBU+jqw==
X-Received: by 2002:a17:902:868f:b0:2b4:59bf:5728 with SMTP id d9443c01a7336-2b5f9f3ca68mr88397095ad.25.1776652662619;
        Sun, 19 Apr 2026 19:37:42 -0700 (PDT)
Received: from kells-Predator-PTX17-71.. (211-75-10-161.hinet-ip.hinet.net. [211.75.10.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm87313075ad.54.2026.04.19.19.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 19:37:42 -0700 (PDT)
From: Kells Ping <kells.ping@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org,
	Kells Ping <kells.ping@quanta.corp-partner.google.com>,
	Benson Leung <bleung@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Ken Lin <kenlin5@quanta.corp-partner.google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH] media: platform: cros-ec: Add Dirkson to the match table
Date: Mon, 20 Apr 2026 10:37:14 +0800
Message-ID: <20260420103713.1.I776a9d5aa44405b0083ab3ad3d44415a89bf21c4@changeid>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.34 / 15.00];
	DMARC_POLICY_REJECT(2.00)[google.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[quanta-corp-partner-google-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59110-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[kells.ping@quanta.corp-partner.google.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[quanta-corp-partner-google-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1E19042660B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Google Dirkson device uses the same approach as the Google Brask
 which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Kells Ping <kells.ping@quanta.corp-partner.google.com>
---

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 419b9a7abcce..6548d7373261 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -334,6 +334,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Dirks", "0000:00:02.0", port_ab_conns },
 	/* Google Moxie */
 	{ "Google", "Moxie", "0000:00:02.0", port_b_conns },
+	/* Google Dirkson */
+	{ "Google", "Dirkson", "0000:00:02.0", port_ab_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.43.0


