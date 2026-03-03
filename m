Return-Path: <linux-media+bounces-54268-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GM4GTafpmk4SAAAu9opvQ
	(envelope-from <linux-media+bounces-54268-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:43:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A32A1EAF50
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 09:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 80D903015121
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 08:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81AA2388E57;
	Tue,  3 Mar 2026 08:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVj94JFa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3E638A73E
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 08:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527387; cv=none; b=DAbqMxJfam871QdsSU+DNwL2FaquPcR54J7QSCu4mZ8pH+FShA9DcCe6Wd5NPlHqPPTc89SL4jbipBh7xAPRrjoKNiMnehfiTXl/gx8NV1VR9rBnrKFjynrhUeDAydaUyEbXSyGiGL//KOq46sX4A609cFBr9+Miru0ORrKBvSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527387; c=relaxed/simple;
	bh=uTDxjcMD0sqeD8HnRLyVfNwbzvAjPF4iDYzatfrGujQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DCvu1/42QFYW7ZxNyBU8iGnWCtkSD1x+rN+cvbDs2yQT7+hMp3pxao7Bl9POTgWCihrClaDNinQPOqeRH+nIEB7u89PPS9rFuJfg0rR9/0MU7v51rWUK7Ruo5/7/CMjAGwWUce2MDHQv8mO76PGTZ+g/sBACTXsWQoEYOrQlaPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVj94JFa; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-389e139ee5eso89746931fa.0
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 00:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772527379; x=1773132179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ggm5W/tKu5AuAHRHgAxgCfaNNqewzCUye92Dt5QC9CU=;
        b=nVj94JFaL4sVq1b9mkSEA8nnfbg3fCkjr/Sx0EG2c+8CkVhF03Cd3bilNSVS/vZW++
         rHLs9nj4y5HqlkLyGFEy3M0fOOuruM+LP8bMOOCPGTONkcUs6Eq4WbxD6lczM57FaX+i
         BkteVUV55DnU623TGe4LpAnuDyuWtb7567zzJ9Sz02UaWaaun7yNSkSP2XIwEBWHYWgy
         TjU/Yi0eC4Otr5IxHxbHdN9J26AXXJtJAEHpXrlyFJWahhqBxc/Ptk2lyVzIeTtfaQU9
         uWxLEyUXLM7JQRsF3yp31k6BQgJUlLeMbV6snMX38GuP1Ksn4MBGEgCJIavv0xifSMTP
         atdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772527379; x=1773132179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ggm5W/tKu5AuAHRHgAxgCfaNNqewzCUye92Dt5QC9CU=;
        b=LC+Ejw0tBwKkrHehIOXSnZ97VATZa9a01YuOKVjPL29IiGaUOxaBXs/gMEcauRrxZW
         8av3POwy9JVKnwKGgDAtu2ILdCREGeijtV9mcGB1HBJKGHRO1f1zZfsK6ArHSkOqviJO
         BSFuTcy2Z7mbQ6BrUxcpQ0z7J8/LK2+6pYz8X9KA3lQ1zO3J1/5ge9QT/lQQfsxGbEm9
         LpME8QjVRx/b72ipWVuMbG0QzhkA+jJ3lrEBmwxGSTtcbGF/XUjggbdxZMi3uGEXsCy/
         w7IfVz2JACYNJ2BrcHTUxnU5vLic49MH4BERi2CWrNJKpBb1I76OeYqVEqh0mrJL9vWJ
         ByWg==
X-Forwarded-Encrypted: i=1; AJvYcCVBakmHOcpjLxolDDumqZyXsPrAkcsSTYEpbwL3pLgFskEVbOpgFooGc7DvVIBeX9QcuLPdK37kllBVRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMVc4xJ+RRYQ8QpfmD1e/pLtbCeqzrSp1fqg1s68uIVkK0nhIg
	5JQ55XA29x12mPMLOHYMBAsGCypQpupOBovVtHt5lz/N7Bt7f+HAkMOW
X-Gm-Gg: ATEYQzzH2ELKMFmHDPSgBOHvOUuvG7p/Jm52XYrNs+td1pg8QGamZAGt6C81jnT95hM
	UtV+tLY0h4/TIcI1HePUNmaeKQWBtZmBcfWK8sq/qmhITcdy6Q+QPxQUuB3qKRvrlfj1WoJ9zHj
	BHpCdFo77K8rxzPHaLHWMRK23biKREWqq3folyfIOZCpbRRHXyz3LL/+Q2t2DYoLdmm7ZeI++FE
	Rer9Er962WXMgV6k0HutgK4bTJAnLHipDsV4zfQk2sci3FEGYzPhvhhpgy31zG2l5l8ZmJ2x1dH
	yfFfSguRAkEt7Nsj+XdZPgdM5YzjZ0kj9ujShKGqZTridE5vAAgHXfLq+47HdfUoDledwbtylJT
	P9+ceBPTPC/fmcEsGi+KHZkW7fUirlC18+eR7DpKFilk0YChlF65LQfBGKTfVsaCJGF5Lf4LYOi
	ufw1RB+bHU7kdtB2uIcU/peBU=
X-Received: by 2002:a2e:9246:0:b0:383:7f85:8eef with SMTP id 38308e7fff4ca-389ff356ffbmr81095711fa.29.1772527378501;
        Tue, 03 Mar 2026 00:42:58 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:42:58 -0800 (PST)
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
Subject: [PATCH v7 06/15] staging: media: tegra-video: vi: improve logic of source requesting
Date: Tue,  3 Mar 2026 10:42:29 +0200
Message-ID: <20260303084239.15007-7-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: 0A32A1EAF50
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54268-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
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
index bcaea20c3025..92078a1f9a4e 100644
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
index 19eebfdae221..7032c733577d 100644
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


