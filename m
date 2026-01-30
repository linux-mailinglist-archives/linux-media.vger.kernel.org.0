Return-Path: <linux-media+bounces-51831-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBF9OiKpfGkaOQIAu9opvQ
	(envelope-from <linux-media+bounces-51831-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:50:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE7CBAB19
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E71E3005581
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 12:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18443806B4;
	Fri, 30 Jan 2026 12:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8KAY/CH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343DF37F75B
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777407; cv=none; b=HvfzPd4S1R62YiuT+86InupJHwT/aMLf+eyvqD8XHitrD8Mk5cTLy2RK2Zi1vf29Gsgpt5wYbV1ZdnEUWrkE7vCuAkti0qQSbQVI1NVLcIxlGNGBQnDI2lcn7kleHUMCA9AjBVJBAtpR2H0atqzij755T8taKvQB+8Du0U1bzNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777407; c=relaxed/simple;
	bh=NP5wyq347Z6v9T3ICeLdnanOcnkIKeVAP2h+kcM9y4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbI5mvSe0prrVVWFrMELDn5TUXcz+00RIe2s1/SfGbGKzllidNcJGyhjOiGvKG64gVPtDkBUJntdAMtSsfIxnUb+L6rAL3EAStOn70LfgB/BZXIiy6ar45LZavNqdZoAXGKO7pyVYqrFiXZFj61mXtCl22JkBtfhTerPhjzik1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8KAY/CH; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so1548502f8f.0
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 04:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777401; x=1770382201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+nXxOTMIADfvgUw9tigLc0fwuFzoK09epjwvFZ7lj8=;
        b=Y8KAY/CHj5571c71BqOIxCfnx1FPMXbNuoxK80gS1xc7KM0tvuF1wu+r55uHMnF+SB
         5RuX44HmYFsS8hKLtQo4+El5okKFt27pQjl9GUUnmIuat+3mkn+FwfZJqwxTzfuL362w
         KiLMo+g0gZ6DMuBDojjnFy6l3CY0N9dGp8kvwMTrcyj26P8NRSWoO/lD4HT8le9gsX4A
         Uuke0Aj+XpeQ79hGQVPfxtOn6gSyJxL3UNx81ZYmS4ISP4yCN1zsyEsA51fkLk8SVjZd
         oHC4HJoXplm/ivWNUASnw9K2SW/ucXL/ueg1Ea7xAe7RdYsb6FJGM13tcPRLI6ntuHNt
         YqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777401; x=1770382201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s+nXxOTMIADfvgUw9tigLc0fwuFzoK09epjwvFZ7lj8=;
        b=twffnZFFZpoghWNqSJHSx00zPEXL4W8hHzXn93m7tZWC0mp3BqiDCLpvitfmim2b69
         h8N6UCNzwZ8GR8nsF2mflZHRHA6sp7k4G9+CTLaBSeu1FFCgBcl/kWXBcfV9Ku65q4dh
         dmTG2hZSDqYGDC45dUg5lPV+hTSexTGd1/+BJ8ipW8ui5wYmApUwUuMAvtUkND0yGYQf
         9yYSYNeX5I/95+zIUAka94WjdIkGdmo5gc2oSIhe6tJL8QasXz57YUfDIIjhlmJYXJNJ
         bPF9YA4ODnyCq1rCcTaPwPF+G//+HwvZ4Ugc/1MvT06PVpHupBTEblMshSN69ypJUAXA
         WIYA==
X-Forwarded-Encrypted: i=1; AJvYcCWgpfPT0XkojWTWNjOQoU5xL6gO9Co2TN8sPsua+K+b6hIRJvO7GuK2fI9vSP6+De26CrIgpmbBMSZWyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8EtIJaM/JXrvVwICCnm5234ZgMPtrj5TwUfpFsj3pPhcfNfoZ
	D4MS7To2Pt/DuuXqEO9HLB2HzuDF4xtMmX3NSCrDFit4qiLYZdl9i2t/
X-Gm-Gg: AZuq6aImlbuU+i32fN42G/U8yg3Qe4sQwDNM8r0KueTsQuAKLscLDcZRCAISIxX6nU8
	RQ5w14CSIUnLhzD/gO5IUZoJnZVxt/vM7D5kPqtdiT2BKUsvtwhPx9Ebjx+PsMrKLLfBfGfAey8
	Vy3zZkDQdCPXThQotnGTe10K8XgdVhJNnfKCgAIPlnklyTezt0BBUyuvnDr+EuNY9Id0u3m/WZc
	ARhCwmwxoB6StP7KjZXOSAmlfnjeqvqaHkqktkLyi8n+04e1ySfpfLI6sIKjIvQy4HK1SPDfzs9
	x4eceYFmoi/77gwlvV6uLKD5VGv3mS0uG15NqJUBFjgbKxieahoJKet/QvRuEp/pqyFVY/+tswu
	MT1dbch37HR1mZHNK5pHaZUr40jvbJ3qghSeL0ca2os+O5tO9aHmBjvZZH8TWvrKLfAmSmqDELk
	Z4
X-Received: by 2002:a05:6000:400e:b0:42f:f627:3a8c with SMTP id ffacd0b85a97d-435f3a7a015mr3476820f8f.7.1769777401172;
        Fri, 30 Jan 2026 04:50:01 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:50:00 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
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
Subject: [PATCH v6 06/15] staging: media: tegra-video: vi: improve logic of source requesting
Date: Fri, 30 Jan 2026 14:49:23 +0200
Message-ID: <20260130124932.351328-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51831-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CCE7CBAB19
X-Rspamd-Action: no action

By default tegra_channel_get_remote_csi_subdev returns next device in pipe
assuming it is CSI but in case of Tegra20 and Tegra30 it can also be VIP
or even HOST.

Define tegra_channel_get_remote_csi_subdev within CSI and add check if
returned device is actually CSI by comparing subdevice operations.

Previous tegra_channel_get_remote_csi_subdev definition in VI rename to
tegra_channel_get_remote_bridge_subdev and use it only in VI driver since
core VI driver does not care about source and does not call any specific
functions.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 16 ++++++++++++++++
 drivers/staging/media/tegra-video/vi.c  | 14 +++++++-------
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 9fdc8ac1c754..38bff499a8e0 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -445,6 +445,22 @@ static const struct v4l2_subdev_ops tegra_csi_ops = {
 	.pad    = &tegra_csi_pad_ops,
 };
 
+struct v4l2_subdev *tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
+{
+	struct media_pad *pad;
+	struct v4l2_subdev *subdev;
+
+	pad = media_pad_remote_pad_first(&chan->pad);
+	if (!pad)
+		return NULL;
+
+	subdev = media_entity_to_v4l2_subdev(pad->entity);
+	if (!subdev)
+		return NULL;
+
+	return subdev->ops == &tegra_csi_ops ? subdev : NULL;
+}
+
 static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 				   struct device_node *node,
 				   unsigned int port_num, unsigned int lanes,
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 0f98157a7e91..f0725312e236 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -160,8 +160,8 @@ static void tegra_channel_buffer_queue(struct vb2_buffer *vb)
 	wake_up_interruptible(&chan->start_wait);
 }
 
-struct v4l2_subdev *
-tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
+static struct v4l2_subdev *
+tegra_channel_get_remote_bridge_subdev(struct tegra_vi_channel *chan)
 {
 	struct media_pad *pad;
 
@@ -182,7 +182,7 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 	struct v4l2_subdev *subdev;
 	struct media_entity *entity;
 
-	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	if (!subdev)
 		return NULL;
 
@@ -204,7 +204,7 @@ static int tegra_channel_enable_stream(struct tegra_vi_channel *chan)
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	ret = v4l2_subdev_call(subdev, video, s_stream, true);
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		return ret;
@@ -217,7 +217,7 @@ static int tegra_channel_disable_stream(struct tegra_vi_channel *chan)
 	struct v4l2_subdev *subdev;
 	int ret;
 
-	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	ret = v4l2_subdev_call(subdev, video, s_stream, false);
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		return ret;
@@ -1631,11 +1631,11 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 		goto unregister_video;
 	}
 
-	subdev = tegra_channel_get_remote_csi_subdev(chan);
+	subdev = tegra_channel_get_remote_bridge_subdev(chan);
 	if (!subdev) {
 		ret = -ENODEV;
 		dev_err(vi->dev,
-			"failed to get remote csi subdev: %d\n", ret);
+			"failed to get remote bridge subdev: %d\n", ret);
 		goto unregister_video;
 	}
 
-- 
2.51.0


