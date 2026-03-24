Return-Path: <linux-media+bounces-56788-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJk/HJbwwWkdYQQAu9opvQ
	(envelope-from <linux-media+bounces-56788-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 03:01:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 231FA300DCB
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 03:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB245304A572
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 02:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE9337C91E;
	Tue, 24 Mar 2026 02:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfaYsNmW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0A134F48D
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 02:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317701; cv=none; b=VTdXwWoIJUOmYP8cYfv3AHtHw+4eghCKEesKIE2FPfIVXyDIdzDLhMAcF+jp501wC/7Xqcjcyq+bhlighSVRPTMFBnJmlXPpBd96nPTMcqeBBGAyakXPbJ+B7mL+hSrHecvFzNezI50q56t9zJ8ioncvIGbCj8yC7VQl5eLB38o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317701; c=relaxed/simple;
	bh=C6pslvwk58QZS/2zykKJiaeBxMWH9ps/RxZto+oATu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ThcftQcgrx53aZDLf/KxfeflweQbj+pIAprwKRFt8d1Il7D/oYxkxDHj4kGQCoDOXTj3mnUWMjvlm9n/rcJl1XhnVGjU8xvK+4KmVXbHl2K2pzkXV49mQ2n6TMJzV8u8HvcqFd9sNJLr+GDqRjaogRaA425j45RdeAzWrdDiGJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfaYsNmW; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c6f21c2d81so62095485a.2
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 19:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317699; x=1774922499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBs5FO1PS6bEgGJFgn7J/YLM/i8VXi+ZJKbnghNzohk=;
        b=SfaYsNmW0IwfbMzmI4JMhZWzwpvHC8uxEFvsEqOxz/1gOk8+SKiwqrss13qrEnFwfk
         1BKMWDha1de8cgfg8x2L56kwXE/rrzHB05sKXDX8rrb5dIZiQmEYvnpEmin6ktFCF4hS
         ipMsGVaJi67SfAtr+i0N0BXUW5+AB4DBJnKUZtBi7utgbsuYV9U6pvEJzsRleoSKBBVT
         7asajKyI040Y5PMm8XLu6lv9bRAtvJFRPCY+9HSIj1USXl7ZVw9Z9P/PW78Y0Tsh20DU
         fr12HZ2nx8BEtwxoiFIM9FT/SgbVPapLlz1GC00hDBq7XblbqxIjZ117dkWnscqJacuW
         GlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317699; x=1774922499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xBs5FO1PS6bEgGJFgn7J/YLM/i8VXi+ZJKbnghNzohk=;
        b=Nd8oTqN7QqY1AzTknlzlSybTMS0yLFg3J5v712cz72KsNZ5xbkhg404io/n4u9zgR6
         ww9hNweorS0LOpFbAfaGngVHE7JdvvmKwfKAETfSV0G2NXBllk31S23nj1wlYhBTiTze
         72wJdK+SvixDp3DFUQed/khbO62N6M1LtsB678fSi8/EX3weuxZKSfW2jmpm2X774sKr
         oE+LTDcJRyIjL5xSNwuuj5MVzsM9H6qKeou4PKTwzq1ET19BfuUadH5xnzYuuzNJXBYh
         VG5ZLLEckuzjQI/DqeCezKkMgTEq3xOraHgTA8lLW8DDu9ZTm3bnUNbx4jTwjmNPrirJ
         CIuA==
X-Forwarded-Encrypted: i=1; AJvYcCX22UqZ9YIADdx8Y5sHI4uhtm328ddASsKwZrGub2C8W3AiHFBIuY356oly8TUjPfui8gD8DCgpqcR6YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzV8464sxec0kfzORfRqxxINrORRjlSUeQCFuuGRvzASOXr7IA2
	p3oZPSibzK16qzBINo8gqIen5L99K6ToGzNWeMqbE0UT9fHAaRYezjR1
X-Gm-Gg: ATEYQzwADdyjZGsoGT2ufPnQwQyyunnsXJTz1idtQitzJN453JEIG65qJ/4V/kwCZRN
	X6NjxNIWNae9k4k8SPRCP7lKheC+aMXSg7q3tyVzrbWVJqKaAt50ZDhuW+IuT1IcQj4/d+9SoST
	c9vSKtb9yz0Kl6mmGAjdcV/UeejhUQLCLgGI/t0Acu3cer0CKXxpR/vsmbhH9jxHarrtWrW+K4l
	6w3PKCf2hZL78VjOEYIJC6mO4n+cljKMZBheNZlfzS2Nn8o2GAT7vOC/l+CihALeeryNEwAI5Bo
	emPt1hj4eT7z+wqXgQkeU2yF8Ehh1Sg/jcyv0mEGS83dNQVz44YXQHUORVQ+3tWK6Jv0pZZpJBA
	wRFzT51tImV/eEV8KbEX/GP3Dd8jOOthlXWd8ab26XnLAQRCJcMlNwPejOWMQAS5UU+pMumkNCE
	QUEc4eTfJIjbY2RBDv8TLgst+M2+qsf5Ie0r8Gu2pZQv280bUslhcLj8Rrh5VsUmKCy1BHCeHGc
	zOpTsFhfdYcJfs=
X-Received: by 2002:a05:620a:44d0:b0:8cf:de1c:edea with SMTP id af79cd13be357-8cfde1cfe37mr1423972085a.13.1774317698665;
        Mon, 23 Mar 2026 19:01:38 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cff3119121sm140450585a.16.2026.03.23.19.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:01:38 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
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
Subject: [PATCH v11 4/7] media: i2c: imx355: Restrict data lanes to 4
Date: Mon, 23 Mar 2026 22:01:29 -0400
Message-ID: <20260324020132.8683-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324020132.8683-1-mailingradian@gmail.com>
References: <20260324020132.8683-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56788-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 231FA300DCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IMX355 sensor driver currently supports having 4 data lanes. There
can't be more or less, so check if the firmware specifies 4 lanes.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Link: https://lore.kernel.org/r/aW3uFcT1zmiF4GUP@kekkonen.localdomain
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/media/i2c/imx355.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 9ca87488c933..27a5c212a527 100644
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
@@ -1705,6 +1708,9 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
 	if (!cfg)
 		goto out_err;
 
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX355_DATA_LANES)
+		goto out_err;
+
 	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
 				       link_freq_menu_items,
-- 
2.53.0


