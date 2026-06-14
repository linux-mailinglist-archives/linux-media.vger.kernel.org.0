Return-Path: <linux-media+bounces-64816-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y9gaM4beLmqp5QQAu9opvQ
	(envelope-from <linux-media+bounces-64816-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 19:01:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BF6681A98
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 19:01:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DZ3pHXv4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64816-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64816-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16C0E303B6DB
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F02B3955F0;
	Sun, 14 Jun 2026 16:57:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8E7307481
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:57:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456245; cv=none; b=X7Hc/goShSZULGf2+4rhi3rOta9E8hA78RtURxmKoPQmq5+xV0QnGIbSvOY6ck4WlRjNeWCGKr5T8WqQSSVyhQnVywizBYIHbE6an+VAAwftRcnzRN3h0Pw781KCOLraIgxy+vsbHYgWeUwG24ER6/wBL0/UQNfJqcFqa51FnhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456245; c=relaxed/simple;
	bh=+ac1mYHN8edhb8mHSSOjCFrWiSHfEhSixJe7tHd3l5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uCRgxIFsbG03lNONeRBhenkqERjOrdvT2/rbDIji3Aver3kFSszIZlLyXpCD5Wjb5hp0Ai5c4wh/Qr5WBRgg4eE0cWmXUDsCNU/4vizg3SE5GHveQUPKlNpPdW2T7UZpAntD22z5li34sruA3V4wLo3kpMM2fS/lJkShWL1S7OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZ3pHXv4; arc=none smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c40397e3caso23660905ad.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456243; x=1782061043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJF0LWnFFWDFVPFPP5uHXrlcwiyNNjMXAyKrVbw6lNQ=;
        b=DZ3pHXv4mRlrOXgZEDlcGIBi+fncLR5ZzKd7sVbsz5ZYikeecY+2wwtoJBfkI6bhN9
         vFeUfbVp5JlOhlsQuDcFVA8Ds4quw4KOZLE1Ys7zRUZiNqIdgFS41wfOvZRODMlPd4xc
         +VhSNXKXh54YH9jCj7ZgZUthZFrd9dzj7LVx3WaSwbgInr95WK1yB6mVhVJfTvy1KNgz
         HJNH2IKkhtdBVu5AHbZBecslYbfAoqa3khi9xlbLgh3UxJmLoU3D/Ekad7PtxmooZ5Ph
         lUqLaunZhEVRXOaS8ihl1JczZT28NRnWNsa1h3a65qTV4bsteo2AthlkS3PZdtgyCx5c
         BrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456243; x=1782061043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IJF0LWnFFWDFVPFPP5uHXrlcwiyNNjMXAyKrVbw6lNQ=;
        b=aEO02uO+sLQXuzbiNcrf5gRcSlrlVHVgV3BqsLdnOoKp7vzK2j9mQvErpPVz1lIoiB
         9zvWfZkrCua6ZdD1S+99Bo50ILLoIa6qEYQwHmUadWRJ/6g7jNUu90Vj5PDI3FqyNY8g
         zzyT3qSjXVgWRCficSrCqqVkweDDuGwU7u4z2fpN6ujOXB4JJFh4WV3INMzIf8NNXGtk
         UD79nEB35aSUKIgr0RoRIXaXGqFeshmUzJcyHfMMb7vpSeUbmtUtPJ3b0xkJt+NeDP/c
         00fFwW/qstGFDG0SUFdK7Z3UHSdY16Ueilnj7WPPYaP2fbGvlstydLEGGK/fkHLFXAVD
         TbvQ==
X-Gm-Message-State: AOJu0YyjhZeKfwk0CGgCPubq7rHu1ZG6Gpk36tMLl5dN76bWwR9V6hCO
	WhyY0UbkmxWY0gs7JP7hxtLhz3R9fWyZ+wCQcgH2vJrVpkB9BrKEw1F+AUomTM++
X-Gm-Gg: Acq92OGSN3GYGWB37gb3MWuqZXqd5Usb6H90FyXw32Gc7jizb3bnVkljLTAd1oPC/PV
	gYIfx7zI15qhJzwjmcY0YZESH+LnypZDO0OhmNIIZVXA3VVAatAbRtVpLshRJcqXLjUTpvvMtTQ
	IGXI2L2qnimj4qx6auoDvSMBNl2shYpE4TibqPy8TXjx0Xx/VLJ+vwgVMyjd/ZK7ZR6AVXHLf2c
	tyNC5ofVGGhQ22ztxsVdnamGcNyPzeK/xG0UVzw8+75Rw60TSL5OaVn5DgZtv8JQjkhvI3z3Uci
	AocLa4cl68Rx4ue5t92x6WeA5oBYjeWuyPSg5qP73PSOLNG0HzkCsuKKme+RhBBUSY2H6IMeeHe
	K/2m7T/CptqkDnmFRilbLaXBWU9SNRnIjSb466ERvTYJI5N8F4yxOZBV7UC+iIl16eWX+5r4rFL
	6y+bktyzHhNdKCDbAxXDt5zcfWKUxC52By2BVnX0EyBkXzy3dRaUJm2x31YdvI0oA=
X-Received: by 2002:a17:903:2ec8:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2c411d7b13dmr127349825ad.21.1781456243350;
        Sun, 14 Jun 2026 09:57:23 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.57.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:57:23 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/22] media: platform: rcar-csi2: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:47 +0530
Message-ID: <20260614165630.3896-11-birenpandya@gmail.com>
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
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ragnatech.se,glider.be,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64816-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:niklas.soderlund@ragnatech.se,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75BF6681A98

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7305cc4a04cb..c4e35cac97f4 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -2634,6 +2634,7 @@ static int rcsi2_probe(struct platform_device *pdev)
 error_async:
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
+	media_entity_cleanup(&priv->subdev.entity);
 
 	return ret;
 }
@@ -2646,6 +2647,7 @@ static void rcsi2_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(&priv->subdev);
 	v4l2_subdev_cleanup(&priv->subdev);
+	media_entity_cleanup(&priv->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)


