Return-Path: <linux-media+bounces-52942-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO7+ICO2k2l17wEAu9opvQ
	(envelope-from <linux-media+bounces-52942-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 01:28:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3326148496
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 01:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2449301E969
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 00:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6437C2571A0;
	Tue, 17 Feb 2026 00:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSgkgc3h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF63225776
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 00:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771288080; cv=none; b=sFeGExfeOS53BuoyRahSrqmmDKAsZRHqDt9Ll+42+QSSybZsDDzbNRCRmB+h2SgAWnRcWWz6CUQsVA5R2hJdk4JNZPV0hr5aBsWUXDK/4jGuXfEHm+kPgvFIv/S4GbWL29yH+6CoASmHtrkKuxLDlSPi0llPf/1FfZxr53MwwNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771288080; c=relaxed/simple;
	bh=Yxjldx0Jy64uXswjyLdMRw4GImxB5nb7jAdle3qN1SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FEf22YD7KPy603Lz9GZblbNJW7tjcaKOAGekcO2K276xF4xCdueeVgBiftBuAirlkQLafE6tKac3DPElulSOSSUkp0r24ArJJ/teK7680puNRXXyx9BUB+qcZPxJ3Pl+1t7oYiOhOgFMbQUVr/V6qHPeUUpB0nNV6PCRikBaqYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSgkgc3h; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5069df1dea8so28664281cf.1
        for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 16:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771288079; x=1771892879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ASIhVmOfm72bVzGA477nCjdiqa2Jqep/Bp6HdWkvEc=;
        b=hSgkgc3hlrJl651+9lw5Qfp4j4/xTeSTWHc8vR98BAHPKWuBJ77yTomai37FyZhfGM
         wrB7ZnjgHGopnl7QwzvHaaGUmEc3SKHiXU2zApV5KSt0vdzI31REgmvaSlR6xJwnJy7g
         9D3eb3/pbD47R6CltW727OZ5a3pXEdu2yF/xlb1MlpTz1c8zga0wC9hGJMt9OK7k9150
         REMDJI818y52z8eiFSnXswgwwL7FC8Z9UgIQNtrJI4M9lQBckD6lladQZKbqUUjhGCOz
         VWm3WBPFtjDaoV1/E+ZSxMFJO67A+pXw+hLBOweQOlbtBi/xTZ6t6KvT0NKmXds/SGfb
         HHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771288079; x=1771892879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3ASIhVmOfm72bVzGA477nCjdiqa2Jqep/Bp6HdWkvEc=;
        b=lKVJg3xMKQd7wjd89kCry1LI3f9/jcpZPwzZWdQExvTzQ65zVQLxMvKDZrxfOIMPo1
         IdaLaIxpU+4sBieVqZi16mSPDRwE1XbsV6DaAhbcQoDQRpHTyEiA/9+BW2+NHwQ3nd2r
         olQXHnlLzA/wVDINadaDXPMUvX9CW13YrJawx2DgN6HOl1S7mVV3K0f86FC1LYUwGKfo
         q2LA6w9CfgCNq+tMkLleREnP8zj7L6efnkb07cWFS3VxIQGGxeJKcTkgo9ozfHZik5Bn
         tYgnrFkE8aRMiIT4fJRKaXKOnaalwdFtqjMrDyfptf0XSuZ/WlB9a4ZMHcbCDWIkJrqJ
         IW7A==
X-Forwarded-Encrypted: i=1; AJvYcCUUwHGGFPxNbHZi3TzsQq095hXj373cSsRvfEBIBhpWJn4xc2+tGB8S1UVKS2xb+gStc7wrTeWHO/VO0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiNQiB3YruQk6pjhnMU9ZJnL28JfzwT6c1mDgUsJeJpvq21dnK
	fYN/CI7I9MF/I7UpJZoPdSXcs2jwrmm+4kYeuqzYAv25tBts720jTij2
X-Gm-Gg: AZuq6aIdgK7hBjVJVNfMdV+35jOw9Q7QA82Uz6cmHS06ekOLKDpM0Ue4OMjmwANgq+D
	wako+mxO5p6qmiAQBSnOSXipzL74HeiwZdM3JHcQTD5RljrDkV8Ah5xo2oAX1p6d3/BYM7KWLCm
	3BzBYXKav8ZPRLSbjoGepAf69KaFlT5cg4JK7LeJTDj35qg2GTDBBWqahAzXTtGWjHcoRdsuHB/
	0J+phnS0kv/r6+cnBxgpZNsE4UUBp+SiEWfjNo9KTUV6cDJQ6M4qIqtcRjlYwO6iekNfAj3V1Jj
	YOTgGgtyTGLCmiXxYEbBnrB4bC1bdfTp0LDNWFQGaV/QeeKdUlRXbmPGIWUBPtY/+2Du0D/kt8g
	Qerr2hQY9DLZPTwpNg4zZlv1NrUrYvcoohlREXICuw2lPskr/F1mmKTTB3NhztoVlor6XZfkytc
	FarIuruzFWeIjgd1TAFDoidZw3gaVYTg==
X-Received: by 2002:a05:622a:1b92:b0:501:40af:96bf with SMTP id d75a77b69052e-506a837b78amr149961911cf.68.1771288078776;
        Mon, 16 Feb 2026 16:27:58 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506a93ba30fsm92083441cf.26.2026.02.16.16.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:27:58 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v9 4/7] media: i2c: imx355: Restrict data lanes to 4
Date: Mon, 16 Feb 2026 19:27:35 -0500
Message-ID: <20260217002738.133534-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217002738.133534-1-mailingradian@gmail.com>
References: <20260217002738.133534-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52942-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: F3326148496
X-Rspamd-Action: no action

The IMX355 sensor driver currently supports having 4 data lanes. There
can't be more or less, so check if the firmware specifies 4 lanes.

Existing ACPI hardware descriptions may not have the data lanes defined
so this check also accepts a placeholder of 0 lanes.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Link: https://lore.kernel.org/r/aW3uFcT1zmiF4GUP@kekkonen.localdomain
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/media/i2c/imx355.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 9ca87488c933..0d6aabea7d59 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -66,6 +66,9 @@
 #define IMX355_EXT_CLK			19200000
 #define IMX355_LINK_FREQ_INDEX		0
 
+/* number of data lanes */
+#define IMX355_DATA_LANES		4
+
 struct imx355_reg {
 	u16 address;
 	u8 val;
@@ -1705,6 +1708,10 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
 	if (!cfg)
 		goto out_err;
 
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 0
+	 && bus_cfg.bus.mipi_csi2.num_data_lanes != IMX355_DATA_LANES)
+		goto out_err;
+
 	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
 				       link_freq_menu_items,
-- 
2.53.0


