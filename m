Return-Path: <linux-media+bounces-54264-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIvHA6KfpmlqRwAAu9opvQ
	(envelope-from <linux-media+bounces-54264-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:45:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5836F1EB006
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:45:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 448D430E5041
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 08:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F092F388E77;
	Tue,  3 Mar 2026 08:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRx9hkyS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88235388E7A
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 08:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527379; cv=none; b=qNuXQps8m5zR+vM3uUguJNrlJDGQYxJMzEC9iXnF46WPqNO7iyHfHIx3mChZSQsxxHb/bntmeFCpl625DwxwBOZb/arKK+FOyWqPLqUaAFUPaTlU/bJpmO2e/f6K85PHBAwCsfEA9ry7UTDFo27/tZhIwaUzmYypiu+yyOboSG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527379; c=relaxed/simple;
	bh=MfI5zeRl0pyQjV4WKNqmsKtJ3wxSTwwt/NrFXusc/w4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m5CvhnKaSlQPY5GrYA5HOC0mZrIFhg4wquEGfClIhHS9lpp9a2WtZaUELDslljbprAd+JohSOnwN5DfVgI2SsxwC24xyEMoWieMLHAsP4si4Fqk3uJ50JtXEaWHxVmNQPGq3UiFxW/u1accJJDd582y2LwQ+IaCUeo3iIgqwdH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRx9hkyS; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-389fad34e2eso87324391fa.3
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 00:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527376; x=1773132176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZu8rHNV14RcsNYnYAtHHPAFsuTgdzw+TBP2m+knG7k=;
        b=cRx9hkyShcQs+n0ALDSczbUN2a3BCfpLP1ZWn+ijgqQUWiZ85gRVOB8UnJmWlxNEaA
         SgPfbtnouuH03yZaFfo/sLf570dheK207cERwDWYmBmNyOtix0qNxw8JjFBI0UM0Uj/O
         JE81UfYW4TOzQDGKcAEdVd/yXOfUCF6rRGQ4ryZoq7BBC+XdtP8u9rsPYCTLOV/V9ZBA
         5rY+RM0FF60LRFdrv/inZGmNu/3zwyjLsCqJwxK8BsAoTP1WTJ8x4tD9DMag7uwtm7gE
         ANUsgNTL8hDZqPxyML8W+xFWvle1aKvM4YYKHQO5c2bxXua7KrldTJFQqNEDJsOU/gzc
         udQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527376; x=1773132176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HZu8rHNV14RcsNYnYAtHHPAFsuTgdzw+TBP2m+knG7k=;
        b=Z4AUU8L6wVYke8OWQr/ZpLIXCdF7y3Nivn/Pv2TepGvM5vNiipFCFIAbbk5EW1jMM2
         Jp5aWo1c7Hx4UbqCQecd+Ru7/ms9cuPk38Ox5CaLSURzMk9qmFnctvqfI60rS4ZuwN0I
         70fl+W0wb8DT8e9Qvvv4YGMlXEYM+DyvHVy5FAvuu3/x4htXVTncYWUow5JKgUke6ZDJ
         HeqlqOEf5E5GblUn6LoiXF85TsxSxObFIA4+CDfGVuf/xqPJskQUQyi6Tro5nI2L1xzm
         OGloVGluBfWk4IvQueXuWYGG2C5hQCp14fdq68E9e0M0ozJEPMaIIvG/+JDzMvZSrD0I
         wFzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZw1Ba4oCMRZ3qHaLJiuoBip24zXnPdyjX4ctPF78wcqZ9dwAVEp+HvqPkB2TsgVw5SxDLOZjHlighmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxwgUFKN+gj0818n40GQzh6xiKTHOXfUvhk/OADMQaLtJr7iha
	6/yHJpXHUJqHKyO0R064N08vNuHEs9JU36D5D/S8HQyEZusfAN9KpiNl
X-Gm-Gg: ATEYQzz9k8D04b50ruEB1O0bEPlAiQjhukH4bsRtdf4ga3oMbw6X1mwGvve4fNjXMK9
	20jkk4/u9YLFWV1zbFBMIP/IL7Vi0/KMOKrfl1DXCQ16HcENTGxYN7rTHTwXJ7Es7sqf5EpCFW+
	csUJ6YrOGgQSC8wbYtZHEpe1vgBQGfq0Afe2IW4pi17xcPE+lh9jOUNfs9gcn6C5I7D+OSBGInj
	t5V8v92NRXHgmBb7O7sBOUNlR4by2A67RsrhGmZ1dK1RZdBhIqK+QUZqvBGUNIdKzgMcBS/WBnd
	Hg0+AgsS6EOFjluWQwTLrToN/fVDvAlpsus/0tDio2Da+ePOrhYDCLJTrRIuGdWKPWDLd7xWqiT
	JwNFpI2EGSLgylBOtaFeKwa1xCDZj5zVkZkHz+dwpnMZMgZ5gkC7XMBbs+V7H2S6H7vJbWTxM3F
	IRICF+mC/gHCEM
X-Received: by 2002:a2e:be23:0:b0:387:1836:e7a3 with SMTP id 38308e7fff4ca-389ff105659mr100636351fa.5.1772527375546;
        Tue, 03 Mar 2026 00:42:55 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:42:55 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v7 04/15] staging: media: tegra-video: csi: move CSI helpers to header
Date: Tue,  3 Mar 2026 10:42:27 +0200
Message-ID: <20260303084239.15007-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5836F1EB006
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54264-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:email]
X-Rspamd-Action: no action

Move CSI helpers into the header for easier access from SoC-specific video
driver parts.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 11 -----------
 drivers/staging/media/tegra-video/csi.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 7842104ca933..f858c05ce6c9 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -20,17 +20,6 @@
 
 #define MHZ			1000000
 
-static inline struct tegra_csi *
-host1x_client_to_csi(struct host1x_client *client)
-{
-	return container_of(client, struct tegra_csi, client);
-}
-
-static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
-{
-	return container_of(subdev, struct tegra_csi_channel, subdev);
-}
-
 /*
  * CSI is a separate subdevice which has 6 source pads to generate
  * test pattern. CSI subdevice pad ops are used only for TPG and
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 609c5952e050..2b4d586d3845 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -155,6 +155,16 @@ struct tegra_csi {
 	struct list_head csi_chans;
 };
 
+static inline struct tegra_csi *host1x_client_to_csi(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_csi, client);
+}
+
+static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct tegra_csi_channel, subdev);
+}
+
 void tegra_csi_error_recover(struct v4l2_subdev *subdev);
 void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
 				u8 csi_port_num,
-- 
2.51.0


