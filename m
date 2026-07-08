Return-Path: <linux-media+bounces-66981-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2pXLAUlGTmoZKAIAu9opvQ
	(envelope-from <linux-media+bounces-66981-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 14:44:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0577266AE
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 14:44:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HfnJ9r26;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66981-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66981-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28188306AB6A
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 12:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A72045BD4B;
	Wed,  8 Jul 2026 12:37:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542D544DB7F
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 12:37:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783514261; cv=none; b=dVLWu1bcsFJdSu6Vh7HjO/m3U3LHU2i04/gmsd+MM0eQdwS7xEVqM+D9vBPldSfm2ndEe+U99KLZe4dIxrbsHNxaDgNfVmKmWL+wiXYG2zlW7+q7BgKC4W553NIwW1UO3Kq7pdUlHTFWDUILpOcFRd1JaizxdjVXVCJttAeqv4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783514261; c=relaxed/simple;
	bh=TY4aCopFbN3dYhQmkdEiXOewerjmzHG8UUy9gUxqM/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RJcyoZH1NGe6ike8JxnGkh3rhc6nVdArJYykgsxGZSTM3ZlvTADUr9uhlPRbmt7ZhTM+FxFeRp0k3mUN6m6uRhIB0SC9gQlv7KN+VRKSJfL/j0uSU5xC1nObeXSEiAfnn1WttnD9WRbcg4tWanKgencZkJJQNZG7EaA0QALiZ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HfnJ9r26; arc=none smtp.client-ip=209.85.216.47
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3804e42ad5fso619270a91.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 05:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783514258; x=1784119058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2NCGWcB63pGFQ2fmc+yu9xWhLG7x52oZf2ocF8l0Sg=;
        b=HfnJ9r26VJ8gaIMhf7uOQ8PK+JrPFA+v8ZCEYRbT6d/oj1DRfadhl8puYbayvibIC7
         d5AvgUmlRFq+F+eXkChdXwTnt3SnkTZeNCEJkUzz/dUiJ5tzWPKzA/z3AoBB/oSfV+4o
         Frpqroa5+70UACQmamXVd0YYA6AxdyHf9HNUvM/sIQdiCJ6a11wDLtAuVs4CaEssZiZ3
         bsh4/tQY88/981ilxcHjIQiJfgjFasa5l0UZ3Tvcugw9+yOyhMqYVMrlec5Xq2q2h3XI
         HG4r281GZZmCmfyG2HTKBR9GUCj/cbMR0ii4ARJtTzmAH+Dy6lZv/mTIrB3H4ncU0s2j
         GN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783514258; x=1784119058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m2NCGWcB63pGFQ2fmc+yu9xWhLG7x52oZf2ocF8l0Sg=;
        b=d6/wWKZgoFzH344JWrAQBJ52ukx/NP0csCSKGZyQ/F21+bb7Yitl49DMbamN55VCbA
         qkWR9siKm711V9pr6eiLFovT7r97zhbXFY+iuk9jKABo8oSnX3/zp2JHs3wh5zg10dUI
         LYaIbqWmIpqM0h3o/TIFsB2lSXRhMfPemhKP9aZ4e+rHAT45GF4TzNA9IwhZnkmIVjTq
         d9XBzpFftRTFK/EB0/ux782euHYDC3jXV2w5DQx2XPblAbOs+Awo2liQzoDtQE+4FXlx
         qDEFrZqR9fLOQ9+ug6gFJRaz3NqwiwnagU6/LNLSbKD5qhwndkqFBlq8qO5k70SDr8Ov
         53cQ==
X-Forwarded-Encrypted: i=1; AHgh+RorH5pCG0JvLNohYGoOM8LTOeoCq+cReYDh3G+H2W2c7UJbxAE/fSGteCv/qdjAoJKZQioGAF4c9E+MOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK61yll5uM8FnYQhf07wsBpPJGbhaPBD7XJWm6TyZtWAXJNhd6
	48G+vC1HOpX6+Bv6C/COtWXwLHqt8HG0T91Lz6TKiGKXf3++youSPd4T
X-Gm-Gg: AfdE7ckW8fJyWL33f+Xv5I9n93GHhS4xQgGzt5QZf87pZmLeicgdrzLUCVfwjv/hwbX
	nhGx61m3axhz6vxxBJkBnu6iwsxbyo2EBQqwTeA79Q0jAse7FDIeYlvZ3GN6U7wAJWezipYOymX
	m/1eQ/LYneEY7Kh6LPt36slc6GSH39/GgO09hJH+kvzg15x1JAPTUMjG9CngsHgJaDaxtvQoTp+
	sJ3AOScufjKT35XMm8T9+eUVzzsKBcj6aCRLwdFQVGV8G110q9Yfb1mLwyXGeOvQ/tvnCqDxi3i
	QrMvtA1jkdK1Pj0vBowta2GkYMgRBTSreosS4rIo8yta/EzO741jKxBH25IJ72bDV4zU5fI+Z5U
	BXlCbJUrT29AB1uINLvw17tMfMKsu+hmptzBZ/r3Slr/7q1Wy5pEbAGwi2e05kjcvt2whvhgk5H
	0mFFLZjxk23yxnz2YiN0IS6UQBfz9k4kgSFc8NlDwpI+s=
X-Received: by 2002:a05:6a20:2d06:b0:3bf:6c08:2844 with SMTP id adf61e73a8af0-3c0bd252e38mr3247489637.51.1783514258356;
        Wed, 08 Jul 2026 05:37:38 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a92eccsm18701979eec.23.2026.07.08.05.37.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 05:37:37 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: i2c: mt9p031: fix endpoint parsing use-after-free
Date: Wed,  8 Jul 2026 18:07:25 +0530
Message-ID: <20260708123724.26707-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260613084849.57897-1-birenpandya@gmail.com>
References: <20260613084849.57897-1-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66981-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B0577266AE

The mt9p031_parse_properties() function calls fwnode_handle_put(np)
immediately after parsing the endpoint. However, it subsequently reads
the 'input-clock-frequency' and 'pixel-clock-frequency' properties
using the same 'np' handle, leading to a use-after-free.

Fix the use-after-free by reordering the property reads to occur before
the endpoint is parsed and freed. Additionally, utilize the
__free(fwnode_handle) scoped guard to automate the endpoint's lifecycle
management, preventing future leaks and simplifying the error paths.

Fixes: 8f2da25e85c1 ("media: i2c: mt9p031: Switch from OF to fwnode API")
Cc: stable@vger.kernel.org
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 v2: reworded as the UAF fix it is; added Fixes/Cc stable; moved property reads before parse (Sakari); adopted __free (Laurent).
---
 drivers/media/i2c/mt9p031.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index d21510caf45a8..4dcb6c973ef1c 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -9,6 +9,7 @@
  * Based on the MT9V032 driver and Bastian Hecht's code.
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -1067,23 +1068,22 @@ static int mt9p031_parse_properties(struct mt9p031 *mt9p031, struct device *dev)
 	struct v4l2_fwnode_endpoint endpoint = {
 		.bus_type = V4L2_MBUS_PARALLEL
 	};
-	struct fwnode_handle *np;
 	int ret;
 
-	np = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
+	struct fwnode_handle *np __free(fwnode_handle) =
+		fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
 	if (!np)
 		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
 
-	ret = v4l2_fwnode_endpoint_parse(np, &endpoint);
-	fwnode_handle_put(np);
-	if (ret)
-		return dev_err_probe(dev, -EINVAL, "could not parse endpoint\n");
-
 	fwnode_property_read_u32(np, "input-clock-frequency",
 				 &mt9p031->ext_freq);
 	fwnode_property_read_u32(np, "pixel-clock-frequency",
 				 &mt9p031->target_freq);
 
+	ret = v4l2_fwnode_endpoint_parse(np, &endpoint);
+	if (ret)
+		return dev_err_probe(dev, -EINVAL, "could not parse endpoint\n");
+
 	mt9p031->pixclk_pol = !!(endpoint.bus.parallel.flags &
 				 V4L2_MBUS_PCLK_SAMPLE_RISING);
 
-- 
2.50.1 (Apple Git-155)


