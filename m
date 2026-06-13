Return-Path: <linux-media+bounces-64756-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8AmONdIZLWo0bgQAu9opvQ
	(envelope-from <linux-media+bounces-64756-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 10:50:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C4267E2C8
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 10:50:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bo6NeL0t;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64756-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64756-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04C2C30AB786
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 08:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3383803D8;
	Sat, 13 Jun 2026 08:49:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3228037FF67
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 08:48:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781340538; cv=none; b=gy8DL4pD34Iu5DxvFWIJ8V/io3gMkz/QFNYH0YQI7nfBqI0FOuHwEa8czQyDS2hTuOCULGz9q8TSwxytp+B+vE8xXwOo3dPN9zjEIXaiOnDFUpMgE5qwDZrf67XewGk+8bIt2pFRjrx1fO3MU7rex1NwOi9pazs3wvwpEq6QKOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781340538; c=relaxed/simple;
	bh=8+o1I4G8ULxbA6lUSE6pN4G224uukrV5uZVJHW6LIPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kdnSVGgL/TFZSiAO+AjRjtwj1E7jJiBCxWFTP6YTsS2LC3jiGVHXg4VFNUrr7Ru+fudspqx8GmXELaypE1DFRAUo+x8XKwWr2Jv1Gg8M5x5TeALtxrQuKZSOKz/eynh/hvxzpBPx+WDZhvIvrWo6j+GQeewZSBZOJjNcoSzSZDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bo6NeL0t; arc=none smtp.client-ip=209.85.216.48
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36bba9a1089so1084852a91.3
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 01:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781340535; x=1781945335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1BMHqx2xIWQxY0wMImf+3ynOsFtiUDlF0vRJd2haY0I=;
        b=bo6NeL0tDKRkeMOmzwokYUxxCr7ww7L3rCIjRyUMt2w5BoExLpGJ5MzLaO+3AuC8na
         ku4LvZnbXHpAHGReeYv3vdb3PW24rWWqN2IsjNymthZEA5U+uqljfiEauEZtOdkslLQQ
         Rr3r6QdW81SF7bdYaDJakDJvy+31KD4X5Gcbk0hXwFrgut5UbiaN+qOdSj/yAFZErmpL
         +Oshcw5fN/ZfNqCaBfdnCa/7kjcO5XGByjDDhPFguBLWpczO7LEulbDOKqIZFtLAu5YS
         6QgH+tsXvyoUlGnzLv8VmnNTbcA9drQcj/cnn9vJxNH78C/Fh3mNCZPN1KhahS3LIjpZ
         FNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781340535; x=1781945335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BMHqx2xIWQxY0wMImf+3ynOsFtiUDlF0vRJd2haY0I=;
        b=M1qXMzyqCA3dG/J8o016y+jmJjF269FBeXOFiNX9pAa0HRiR7eCsMfENVxzmBts61t
         KRfEb1odf+U2w9CKgK9yWK+lY2Bh+njtC4cN2E/BsKQbIUwpED6JWj+OEcyBJzg+gUVK
         dV6wjhSFEJD1gMNd4bsE6gdDt3LCxyfu8KMInbaU7CiVQ/IGOswshA0ZDpLNs9emJcse
         0vJBVyim1h9ZjuHSeEsgKeWEcRlr3/Rca7j9iev3KqT9oL2a6ZWdVmKtR8dytpkkPGdl
         3isiCyL2ix+hZbcYg9MwPQRPPwv7rApoPp1v0thuMj9Y/CIP9PG66jk/OqIPsPYutWwU
         AYnQ==
X-Gm-Message-State: AOJu0YxTPUQGpSQoaANv59v84Z04lbiyFpjHdhjvNB9qce5JEtiEvaHN
	EpVRwLPJQRhyi48nOfyZ2kb9ULv05Kmo+w8hDstz8gUAonm74TzWwsUqNjAdZuLu
X-Gm-Gg: Acq92OEn9PBjZc3nzcrvg+0UznAuG1HQNrfBYmxZ62Vr8ScaLo+qMZ7+WN/lzJKev6i
	3zR57bgn+b2RqcuwrDrBPuF9o+v/Kf+bffJqLVCUSvaM4/J4N2SfhldagJr2w+W9PmG6ml+8sNB
	mi332GjEf+UUR9eTSOYQlbeKgdqIQBX8Tgjd5QfudXyHfUjFrSUFO1D0Cer3nU6cq4ojz60c272
	Tbu/xeDQ0a6oPCZGBcrRGpcGit0yF/U1v6CkgTrjwZRTF6EqI2TYrtKl4WiBeKGzvuzzZKOvEvF
	R9XnWEeCEdsv1yE5fqG1qCLD30PNue1GlgRRkI2H/Zl0xjDh7Q1/PYD3ElpdL6FhL4acynnzZ2B
	6K74TQIgSTnFUGfU1ZK2iEd9fLUUKuUlBDPWan1zofUwZoO6SrxF5u300GQo69DLn8F9hf6AHZm
	6EkDsA8U675fzP0oDvivum5A90OoClLUQWmwJ5JaY8IQyK9uPnjlin
X-Received: by 2002:a17:90b:53cb:b0:36d:8e49:d8 with SMTP id 98e67ed59e1d1-37c2bcefb0amr2674183a91.15.1781340535292;
        Sat, 13 Jun 2026 01:48:55 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a210ad64esm4242512a91.0.2026.06.13.01.48.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 13 Jun 2026 01:48:54 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH] media: i2c: mt9p031: fix endpoint parsing use-after-free
Date: Sat, 13 Jun 2026 14:18:49 +0530
Message-ID: <20260613084849.57897-1-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
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
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,kernel.org,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-64756-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76C4267E2C8

The mt9p031_probe() function calls fwnode_handle_put(np) immediately
after parsing the endpoint. However, it subsequently calls
fwnode_property_read_u32() twice using the same 'np' handle, leading
to a potential use-after-free.

Fix this by moving fwnode_handle_put(np) to the end of the endpoint
property reading block, and adding it to the error path of
v4l2_fwnode_endpoint_parse().

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/mt9p031.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index ea5d43d..04c17cb 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -1075,15 +1075,18 @@ static int mt9p031_parse_properties(struct mt9p031 *mt9p031, struct device *dev)
 		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
 
 	ret = v4l2_fwnode_endpoint_parse(np, &endpoint);
-	fwnode_handle_put(np);
-	if (ret)
+	if (ret) {
+		fwnode_handle_put(np);
 		return dev_err_probe(dev, -EINVAL, "could not parse endpoint\n");
+	}
 
 	fwnode_property_read_u32(np, "input-clock-frequency",
 				 &mt9p031->ext_freq);
 	fwnode_property_read_u32(np, "pixel-clock-frequency",
 				 &mt9p031->target_freq);
 
+	fwnode_handle_put(np);
+
 	mt9p031->pixclk_pol = !!(endpoint.bus.parallel.flags &
 				 V4L2_MBUS_PCLK_SAMPLE_RISING);
 
-- 
2.50.1 (Apple Git-155)


