Return-Path: <linux-media+bounces-67620-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b5hWFGkaV2rFFQEAu9opvQ
	(envelope-from <linux-media+bounces-67620-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 07:28:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AED5075AAD6
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 07:28:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=p0XuP9lt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67620-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67620-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0141305C98E
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F7D3B6379;
	Wed, 15 Jul 2026 05:27:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7F43B5304
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 05:27:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784093255; cv=none; b=fKRAx4OcOX1sUMWykmynMcgVGcu5U+U/6d9htr+yR5NmjGD/qatnWx+oP5vTmLa9PlQ0+bEBdcUQ0L7fF9lqGYtU5uIZqXQBd2QRLbS+UQb9qZPHselBh0EUO2DD57sgk+/zxtMeUrPpjkLwvEcgHIpZhOv57U1XF3poSuhsrsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784093255; c=relaxed/simple;
	bh=t255KLuOIdPOVrtuDs5gznVN5y3MsuzXlecrRpRRmak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rlKzTJDzG8kEuBOHq8ERdS9Yq+ipq6DHYQ2Izi9lKIghKPo4JuOjX6pTKIKtKb8BS+r5WwSHby1H+PAhn5C7s6YbvbapztUjqq1318QGJx2jvWi2l9U27Yw5yrLESfZZTqqbQzT4kxW+i80acbi4oM5BHXu2OejUuQ8kvCo1Sc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p0XuP9lt; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493bb0e2894so7725295e9.2
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 22:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784093251; x=1784698051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMnMOvnZ09gNzrU26/zEhqioOGqGthHFLG9NKMxt5Qk=;
        b=p0XuP9lt1f5D28WXbFpcacWRDTx6sNOrOOrENZvOLthe4xX2gtGV6qb7YaAwobesUH
         e/P+Whh7W1A6GxxPRW0zOKWbzQ5TMxWmDshZH90aOmQ8uW1ZosPXtpeExitAVyv9HPxV
         HfrcyVL53eE8HPYZrSkm7Qu3Q5Ofma6DLXeZV/zZCHSp+HplVlGExaS1vaZ3o5HWfV/j
         cdfyLP5o1CKKL376H0PVtGXyUTkXy2/D1rNIGI3cA2yntS+z8GLeuOyGtWjQZt5sGuz3
         QnEShuwBDptMbChN20ApXxJphtFtYkUPfmnU5dI9/YA81oAcQB1b35XyqVRIbZO3UQgy
         i4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784093251; x=1784698051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pMnMOvnZ09gNzrU26/zEhqioOGqGthHFLG9NKMxt5Qk=;
        b=f3fjr7BLzqhj2c/iNhqKw3Bv5JibPVpIzogjTIPcSKPgnsbYYFqiVDjOr5pICxXWoW
         yW05lrsfLgOo3mYpLeCKa/iui/unttK+RQCzCqaiMXU5Xoeo9Ssw5DAHTNffXeP0Zu8S
         dB1NdSTNYL5qgrtHpLkaYYOm0rrQ9J+tSocb5rFhkFDTWYszUoLmGK/bIQy7tb+K95ZG
         1cWtM0TqpEbiIeBJWx0h8On6cWX/4B4erNKxBSPFrC5S3oRTZzNwcU7+9omAnTsnu0EI
         RaZrgzn3IVP/KaeLbqBOXJsdfb1hZvk8r1vbP0Ji1pAdjiWC2xtyf1OLRktZQ+KW8VtC
         XLzw==
X-Forwarded-Encrypted: i=1; AHgh+Roqrj9BsJNQ3b59MHeErIUftXWQ7DMBq7RJzPZfhkqjon08ixCYBeyRCkpmhkCM4IHkFKOlW3s3KdA6ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcSnYiZCsY1J/PD4PTnKuQVS7pvWNkoFPMjAGbUmIXmpK1+SWc
	eKU5UmG57CBP9phnoI4rmrdkCCkDytX++FJ4Oc9Q4AYyW/6181WY9RFP
X-Gm-Gg: AfdE7cktlESQDvHURK2IhLF4/ebRbpM+BXelVdlCuMeL4xl41MgUkR5IZqlSxQTbWPW
	tkYZTQnQmd/qmgIFolVjj6/qOZA/BK/EgQsJscBcQVN8zvIuv8XnHJtQ3wQY8EajTTK/blvKnpn
	mjSdGQcMRkME3JNhfOZOdyciosHm6F+uH4SCzoh3pOeQCNzLjZZLos63U4qHLE4y2bHvcC0bvuY
	5yAef5svjG0G6AA7UV3ac0XI5Le24GAtWadk+gLbL5m6me8DVixDHqaXTQacbEG5o2FoKUUKn1D
	PGIUgXLnTwmPQamAmT0cwCEqIRr6vVIwvBWrM8Ddesv/NMCIkMDs4OZ1fRXF1XEzrBW8hHRyOsQ
	u8ieISxrSeXm9M5lFVXhbFP+10A4pe65bjryoERMNYVk+AB0IMs5EFPnp5XukXNkuh4yI6d/cJm
	mNa7PHc5fJzo/dq9q19lWcT0x68k2zvzEsD3+EjJGkCwnOabV60pUcJoxVWuSygp15Q543lbcFp
	Aeuc+Dw4kCvoJQQJMLQBA==
X-Received: by 2002:a5d:5d07:0:b0:472:bf0c:3b39 with SMTP id ffacd0b85a97d-47f2dcc5182mr11996883f8f.2.1784093251248;
        Tue, 14 Jul 2026 22:27:31 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B883700A9E699EB87FB5BDB.dsl.pool.telekom.hu. [2001:4c4e:1b88:3700:a9e6:99eb:87fb:5bdb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f84sm13003669f8f.27.2026.07.14.22.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:27:30 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [RFC PATCH 2/2] media: synopsys: hdmirx: add HDMI audio capture support
Date: Wed, 15 Jul 2026 07:19:39 +0200
Message-ID: <20260715051939.64652-3-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715051939.64652-1-royalnet026@gmail.com>
References: <20260715051939.64652-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,collabora.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67620-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.osipenko@collabora.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:kernel@collabora.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:royalnet026@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[royalnet026@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[royalnet026@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AED5075AAD6

The Synopsys DesignWare HDMI RX controller extracts the audio stream
embedded in the incoming HDMI signal and feeds it to an on-SoC I2S
controller. Expose it as an ALSA capture device by registering the
generic hdmi-codec as a child of the controller, so that a
simple-audio-card in the device tree can bind the HDMI RX audio DAI.

The sample rate is recovered from the ACR N/CTS values together with the
measured TMDS character rate. A periodic worker keeps the local audio
reference clock locked to the source by nudging it in small ppm steps to
hold the audio FIFO fill level near its target, which avoids FIFO
under/overflow and the resulting dropped samples.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 244 ++++++++++++++++++
 .../platform/synopsys/hdmirx/snps_hdmirx.h    |   8 +
 2 files changed, 252 insertions(+)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 9cceffa..f536d17 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -41,6 +41,8 @@
 #include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-v4l2.h>
 
+#include <sound/hdmi-codec.h>
+
 #include "snps_hdmirx.h"
 #include "snps_hdmirx_cec.h"
 
@@ -132,6 +134,12 @@ struct snps_hdmirx_dev {
 	struct delayed_work delayed_work_hotplug;
 	struct delayed_work delayed_work_res_change;
 	struct hdmirx_cec *cec;
+	struct platform_device *audio_pdev;
+	struct delayed_work audio_work;
+	u32 audio_clkrate;
+	u32 audio_fs;
+	int audio_pre_state;
+	bool audio_streaming;
 	struct mutex phy_rw_lock; /* to protect phy r/w configuration */
 	struct mutex stream_lock; /* to lock video stream capture */
 	struct mutex work_lock; /* to lock the critical section of hotplug event */
@@ -2650,6 +2658,233 @@ static int hdmirx_register_cec(struct snps_hdmirx_dev *hdmirx_dev,
 	return 0;
 }
 
+#define HDMIRX_AUDIO_INIT_FIFO_STATE	128
+#define HDMIRX_AUDIO_INIT_STATE		(HDMIRX_AUDIO_INIT_FIFO_STATE * 4)
+
+static const int hdmirx_supported_fs[] = {
+	32000, 44100, 48000, 88200, 96000, 176400, 192000, 768000, -1
+};
+
+static int hdmirx_audio_closest_fs(int fs)
+{
+	int i = 0, fs_t = hdmirx_supported_fs[0];
+
+	while (fs_t > 0) {
+		if (abs(fs - fs_t) <= 2000)
+			return fs_t;
+		fs_t = hdmirx_supported_fs[++i];
+	}
+	return 0;
+}
+
+/* Recover the incoming audio sample rate from the ACR N/CTS + TMDS clock. */
+static u32 hdmirx_audio_fs(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	u64 tmds_clk, fs_audio = 0;
+	u32 acr_cts, acr_n, tmdsqpclk_freq;
+	u32 acr_pb7_4, acr_pb3_0;
+
+	tmdsqpclk_freq = hdmirx_readl(hdmirx_dev, CMU_TMDSQPCLK_FREQ);
+	hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PH2_1);
+	acr_pb7_4 = hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PB3_0);
+	acr_pb3_0 = hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PB7_4);
+	acr_cts = __be32_to_cpu(acr_pb7_4) & 0xfffff;
+	acr_n = (__be32_to_cpu(acr_pb3_0) & 0x0fffff00) >> 8;
+	tmds_clk = tmdsqpclk_freq * 4 * 1000U;
+	if (acr_cts != 0) {
+		fs_audio = div_u64((tmds_clk * acr_n), acr_cts);
+		fs_audio /= 128;
+		fs_audio = hdmirx_audio_closest_fs(fs_audio);
+	}
+	return (u32)fs_audio;
+}
+
+/* Nudge the audio reference clock by +/- ppm to keep the FIFO balanced. */
+static void hdmirx_audio_clk_ppm_inc(struct snps_hdmirx_dev *hdmirx_dev, int ppm)
+{
+	int delta, inc;
+	long rate = hdmirx_dev->audio_clkrate;
+
+	if (ppm < 0) {
+		ppm = -ppm;
+		inc = -1;
+	} else {
+		inc = 1;
+	}
+	delta = (int)div64_u64((u64)rate * ppm + 500000, 1000000);
+	delta *= inc;
+	rate = hdmirx_dev->audio_clkrate + delta;
+	clk_set_rate(hdmirx_dev->clks[1].clk, rate);
+	hdmirx_dev->audio_clkrate = rate;
+}
+
+static int hdmirx_audio_clk_adjust(struct snps_hdmirx_dev *hdmirx_dev,
+				   int total_offset, int single_offset)
+{
+	int schedule_time = 500;
+	int ppm = 10;
+	u32 offset_abs = abs(total_offset);
+
+	if (offset_abs > 200) {
+		ppm += 200;
+		schedule_time -= 100;
+	}
+	if (offset_abs > 100) {
+		ppm += 200;
+		schedule_time -= 100;
+	}
+	if (offset_abs > 32) {
+		ppm += 20;
+		schedule_time -= 100;
+	}
+	if (offset_abs > 16)
+		ppm += 20;
+	if (total_offset > 16 && single_offset > 0)
+		hdmirx_audio_clk_ppm_inc(hdmirx_dev, ppm);
+	else if (total_offset < -16 && single_offset < 0)
+		hdmirx_audio_clk_ppm_inc(hdmirx_dev, -ppm);
+	return schedule_time;
+}
+
+static void hdmirx_audio_fifo_reinit(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	hdmirx_writel(hdmirx_dev, AUDIO_FIFO_CONTROL, 1);
+	usleep_range(200, 210);
+	hdmirx_writel(hdmirx_dev, AUDIO_FIFO_CONTROL, 0);
+}
+
+/*
+ * Periodic worker that locks the local audio clock to the source by keeping
+ * the audio FIFO fill level close to its target, avoiding under/overflow.
+ */
+static void hdmirx_audio_work(struct work_struct *work)
+{
+	struct snps_hdmirx_dev *hdmirx_dev =
+		container_of(to_delayed_work(work), struct snps_hdmirx_dev, audio_work);
+	unsigned long delay = 200;
+	int cur, total, single;
+	u32 fifo, fs;
+
+	fs = hdmirx_audio_fs(hdmirx_dev);
+	fifo = hdmirx_readl(hdmirx_dev, AUDIO_FIFO_STATUS2);
+
+	if (fifo & (AFIFO_UNDERFLOW_ST | AFIFO_OVERFLOW_ST)) {
+		if (fs) {
+			clk_set_rate(hdmirx_dev->clks[1].clk, fs * 128);
+			hdmirx_dev->audio_clkrate = fs * 128;
+			hdmirx_dev->audio_fs = fs;
+		}
+		hdmirx_audio_fifo_reinit(hdmirx_dev);
+		hdmirx_dev->audio_pre_state = 0;
+		goto out;
+	}
+
+	cur = fifo & 0xffff;
+	total = cur - HDMIRX_AUDIO_INIT_STATE;
+	single = cur - hdmirx_dev->audio_pre_state;
+
+	if (fs && abs((int)fs - (int)hdmirx_dev->audio_fs) > 1000) {
+		clk_set_rate(hdmirx_dev->clks[1].clk, fs * 128);
+		hdmirx_dev->audio_clkrate = fs * 128;
+		hdmirx_dev->audio_fs = fs;
+		hdmirx_audio_fifo_reinit(hdmirx_dev);
+		hdmirx_dev->audio_pre_state = 0;
+		goto out;
+	}
+
+	if (cur != 0)
+		delay = hdmirx_audio_clk_adjust(hdmirx_dev, total, single);
+	hdmirx_dev->audio_pre_state = cur;
+out:
+	/* Only re-arm while streaming; avoids a self-reschedule race with
+	 * cancel_delayed_work_sync() in audio_shutdown().
+	 */
+	if (READ_ONCE(hdmirx_dev->audio_streaming))
+		schedule_delayed_work(&hdmirx_dev->audio_work,
+				      msecs_to_jiffies(delay));
+}
+
+static int hdmirx_audio_hw_params(struct device *dev, void *data,
+				  struct hdmi_codec_daifmt *fmt,
+				  struct hdmi_codec_params *hparms)
+{
+	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
+	u32 fs;
+
+	fs = hdmirx_audio_fs(hdmirx_dev);
+	if (!fs)
+		fs = hparms ? hparms->sample_rate : 48000;
+	if (!fs)
+		fs = 48000;
+
+	hdmirx_dev->audio_fs = fs;
+	hdmirx_dev->audio_clkrate = fs * 128;
+	clk_set_rate(hdmirx_dev->clks[1].clk, fs * 128);
+
+	hdmirx_audio_fifo_reinit(hdmirx_dev);
+	hdmirx_writel(hdmirx_dev, AUDIO_FIFO_THR_PASS, HDMIRX_AUDIO_INIT_FIFO_STATE);
+	hdmirx_writel(hdmirx_dev, AUDIO_FIFO_THR,
+		      AFIFO_THR_LOW_QST(0x20) | AFIFO_THR_HIGH_QST(0x160));
+	hdmirx_writel(hdmirx_dev, AUDIO_FIFO_MUTE_THR,
+		      AFIFO_THR_MUTE_LOW_QST(0x8) | AFIFO_THR_MUTE_HIGH_QST(0x178));
+
+	hdmirx_update_bits(hdmirx_dev, AUDIO_PROC_CONFIG0, I2S_EN, I2S_EN);
+	hdmirx_update_bits(hdmirx_dev, GLOBAL_SWENABLE, AUDIO_ENABLE, AUDIO_ENABLE);
+
+	hdmirx_dev->audio_pre_state = 0;
+	WRITE_ONCE(hdmirx_dev->audio_streaming, true);
+	mod_delayed_work(system_unbound_wq, &hdmirx_dev->audio_work,
+			 msecs_to_jiffies(200));
+
+	dev_dbg(dev, "audio hw_params: fs=%u\n", fs);
+	return 0;
+}
+
+static void hdmirx_audio_shutdown(struct device *dev, void *data)
+{
+	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
+
+	WRITE_ONCE(hdmirx_dev->audio_streaming, false);
+	cancel_delayed_work_sync(&hdmirx_dev->audio_work);
+	hdmirx_update_bits(hdmirx_dev, GLOBAL_SWENABLE, AUDIO_ENABLE, 0);
+}
+
+static int hdmirx_audio_get_dai_id(struct snd_soc_component *component,
+				   struct device_node *endpoint,
+				   void *data)
+{
+	return 0;
+}
+
+static const struct hdmi_codec_ops hdmirx_audio_codec_ops = {
+	.hw_params = hdmirx_audio_hw_params,
+	.audio_shutdown = hdmirx_audio_shutdown,
+	.get_dai_id = hdmirx_audio_get_dai_id,
+};
+
+static int hdmirx_register_audio_device(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	struct hdmi_codec_pdata codec_data = {
+		.ops = &hdmirx_audio_codec_ops,
+		.i2s = 1,
+		.no_i2s_playback = 1,
+		.max_i2s_channels = 8,
+		.data = hdmirx_dev,
+	};
+	struct platform_device_info pdevinfo = {
+		.parent = hdmirx_dev->dev,
+		.id = PLATFORM_DEVID_AUTO,
+		.name = HDMI_CODEC_DRV_NAME,
+		.data = &codec_data,
+		.size_data = sizeof(codec_data),
+		.dma_mask = DMA_BIT_MASK(32),
+	};
+
+	hdmirx_dev->audio_pdev = platform_device_register_full(&pdevinfo);
+
+	return PTR_ERR_OR_ZERO(hdmirx_dev->audio_pdev);
+}
+
 static int hdmirx_probe(struct platform_device *pdev)
 {
 	struct snps_hdmirx_dev *hdmirx_dev;
@@ -2701,6 +2936,7 @@ static int hdmirx_probe(struct platform_device *pdev)
 			  hdmirx_delayed_work_hotplug);
 	INIT_DELAYED_WORK(&hdmirx_dev->delayed_work_res_change,
 			  hdmirx_delayed_work_res_change);
+	INIT_DELAYED_WORK(&hdmirx_dev->audio_work, hdmirx_audio_work);
 
 	hdmirx_dev->cur_fmt_fourcc = V4L2_PIX_FMT_BGR24;
 	hdmirx_dev->timings = cea640x480;
@@ -2769,6 +3005,10 @@ static int hdmirx_probe(struct platform_device *pdev)
 						       V4L2_DEBUGFS_IF_AVI, hdmirx_dev,
 						       hdmirx_debugfs_if_read);
 
+	ret = hdmirx_register_audio_device(hdmirx_dev);
+	if (ret)
+		dev_warn(dev, "failed to register HDMI audio codec: %d\n", ret);
+
 	return 0;
 
 err_unreg_video_dev:
@@ -2788,6 +3028,10 @@ static void hdmirx_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
 
+	cancel_delayed_work_sync(&hdmirx_dev->audio_work);
+	if (hdmirx_dev->audio_pdev)
+		platform_device_unregister(hdmirx_dev->audio_pdev);
+
 	v4l2_debugfs_if_free(hdmirx_dev->infoframes);
 	debugfs_remove_recursive(hdmirx_dev->debugfs_dir);
 
diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
index 31b887e..a99f54f 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
@@ -81,6 +81,7 @@
 #define DATAPATH_ENABLE				BIT(12)
 #define PKTFIFO_ENABLE				BIT(11)
 #define AVPUNIT_ENABLE				BIT(8)
+#define AUDIO_ENABLE				BIT(9)
 #define MAIN_ENABLE				BIT(0)
 #define GLOBAL_TIMER_REF_BASE			0x0028
 #define CORE_CONFIG				0x0050
@@ -177,20 +178,27 @@
 #define VPROC_FMT_OVR_VALUE(x)			UPDATE(x, 6, 4)
 #define VPROC_FMT_OVR_EN			BIT(0)
 
+#define AUDIO_FIFO_CONFIG			0x0460
 #define AFIFO_FILL_RESTART			BIT(0)
+#define AUDIO_FIFO_CONTROL			0x0464
 #define AFIFO_INIT_P				BIT(0)
+#define AUDIO_FIFO_THR_PASS			0x0468
+#define AUDIO_FIFO_THR				0x046c
 #define AFIFO_THR_LOW_QST_MASK			GENMASK(25, 16)
 #define AFIFO_THR_LOW_QST(x)			UPDATE(x, 25, 16)
 #define AFIFO_THR_HIGH_QST_MASK			GENMASK(9, 0)
 #define AFIFO_THR_HIGH_QST(x)			UPDATE(x, 9, 0)
+#define AUDIO_FIFO_MUTE_THR			0x0470
 #define AFIFO_THR_MUTE_LOW_QST_MASK		GENMASK(25, 16)
 #define AFIFO_THR_MUTE_LOW_QST(x)		UPDATE(x, 25, 16)
 #define AFIFO_THR_MUTE_HIGH_QST_MASK		GENMASK(9, 0)
 #define AFIFO_THR_MUTE_HIGH_QST(x)		UPDATE(x, 9, 0)
 
+#define AUDIO_FIFO_STATUS2			0x0478
 #define AFIFO_UNDERFLOW_ST			BIT(25)
 #define AFIFO_OVERFLOW_ST			BIT(24)
 
+#define AUDIO_PROC_CONFIG0			0x0480
 #define SPEAKER_ALLOC_OVR_EN			BIT(16)
 #define I2S_BPCUV_EN				BIT(4)
 #define SPDIF_EN				BIT(2)
-- 
2.53.0


