Return-Path: <linux-media+bounces-64762-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b9IgGSE/LWoPeQQAu9opvQ
	(envelope-from <linux-media+bounces-64762-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 13:29:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B91A67E744
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 13:29:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pfQ+3Jxh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64762-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64762-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA9B83028345
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 11:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5352386556;
	Sat, 13 Jun 2026 11:29:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCCB221DB6
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 11:29:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781350171; cv=none; b=XWc95XEPfm8a3IYsuxFF0Aw+5kGDIDyA1NDEv6k8b2SGa1EQa7uMKOZBBGX/FjwMCEPJU3on2Ad4U6joPA3vRCkqjbgBO7MuSbmBNDoN5y/Il7k8sWDEySyxSoKo2vU0a+00/M5bJHkgzTf/5PjvZWSwSdrTstspURrVrCy4iRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781350171; c=relaxed/simple;
	bh=pemxnVHNkW3Iii1nHzJd+a8wQKppft30pK0fSe8aaqE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iAklIMiX4ejykdDb0xoZApxd2QZE+ImiglCREedYf5ijxx/nSLvpFTBtWVx4qmmQResWTICpZgxzxcpYXudRIBypUzpMJ5t3lWR42oKlK6ByJY6z3l2hcBo9muUVluam5f0ZBO8R0av3SxSRfC6kiIm91GIWIRPRCg3rPatUx5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pfQ+3Jxh; arc=none smtp.client-ip=209.85.216.53
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so1334265a91.0
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 04:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781350169; x=1781954969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aGhTsdPJsR9V2/6FOYFPzTNegoY0mHo2WaGBZawf25M=;
        b=pfQ+3JxhFK2f0v4fN94IMRysu1kMP1hJojcCF21NMM+us+hgQyVlEiJukM4bQowxFO
         MItzFY3aJ7HfreaIcNLBNBQDKNJNymmlDHc6+ArgeYnCOHK2YO2BPuBM94EVWyrkUHF9
         xJBHg7qEPLbx2Ud75zjY6dePnJX7WUaxvp2CJR6Nn4GmJiy0zZrfgcM5qo1MJetNLt8w
         62Eke/eygb88cAElBXa29NhyXyiOKytGC92+w+x22OQK3y06C7xQeKUNxTTRnxJ6pyfb
         SXKdc7hgNS/mCZV3MMkQ0JAjIwN+M8eDnqwSpW5pJOQwf7eV8TCzzvAQYAz7zKi9qo+z
         /e0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781350169; x=1781954969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGhTsdPJsR9V2/6FOYFPzTNegoY0mHo2WaGBZawf25M=;
        b=imuoaHu737qtK5CSsFkUuXVSAbu4Bb+2EPpkCUp8gK4IA1+nGmddMTpIp77bdfDoym
         Ut5h2KZ+eDIOxNfmqrWhJVVqxak37Ji/wjDbdtCh2eXXd4OucEL65rBy7A8bdLJBS/cR
         965iE1js4OhopSgIJ+omQPQ9SdtY6m46HBttVoAPNu6cVFf2Wuf9la/goJ02791twJwx
         SW6eYXGZ7ABB9mYjn+cWtQqaHuzXvNZ6Y8Nm9fyf8Aymm0LpaSaCGgFFebn/xSzQgVnW
         3kxjT8Iu8SDbF+rj+VX0YPCpzLwZjTlZZ1RNGbbQY982BmUXmjUDIXv87INUMSuICcoU
         urcA==
X-Gm-Message-State: AOJu0YzlOL9r9iO42L0rb/whs/WuTWd9VXHseR8fRMXQNM4RpmOgsvkW
	6Pfr8Dqj2pBKzKQPYzgilYMighFhwYrM7+5iN/gIOOAVaI4AcToP7j50FMxFrWz7
X-Gm-Gg: Acq92OFXWbLljLwqDMwgzvCS4R92nbT1rKpHPLm09lKf9Juyik2XmUTm+2oxEe4ROUo
	oRUu5od4Lf5ktW17TqtIawJ/YzV5GOXeFFP1k6ktXIhchfao5SzO4SOeyPi9eALidLc7wPEQ8SZ
	x9WrlGrXjQRA4322TlCXTKPQO0fLbuvHY0UEN3VA/5B/+8aMNf6bsUA1GY9NNh0+baTTb5biHrl
	CtXIABAfRqMY77qaB72fT8rQYOXICs80eyRC8doiQQ/96G6OQ3fHxfy7n0xUW0CaA9dVP050iyV
	uoP/So2FH4xmUuactc3sDBPwI4agu+OsWfCB6/rO/AuGwJR6UYw8v1i+d3DKvjGv57FGe63xR7a
	L+mxInCIT3xAM/6jNcI6g2gKCQRvPSFSFCdOISQNTWsljAvZqKJD3tfX+ZtMc4hCfuYhfSQY47g
	vKYHRE9DPwj1vaAvcu7VsPp64YIZs5NvarnH2bNzgmwOrkCiRbtZNZ
X-Received: by 2002:a17:90a:e18c:b0:370:aa94:1662 with SMTP id 98e67ed59e1d1-37a1f744349mr4526176a91.9.1781350169429;
        Sat, 13 Jun 2026 04:29:29 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a20dbc8c8sm4641351a91.12.2026.06.13.04.29.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 13 Jun 2026 04:29:28 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	dongchun.zhu@mediatek.com,
	stable@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2] media: i2c: ov02a10: fix endpoint parsing use-after-free and error leak
Date: Sat, 13 Jun 2026 16:59:20 +0530
Message-ID: <20260613112920.64617-1-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,mediatek.com,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-64762-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:dongchun.zhu@mediatek.com,m:stable@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B91A67E744

The ov02a10_check_hwcfg() function calls fwnode_handle_put(ep)
immediately after allocating and parsing the endpoint. However, it
subsequently calls fwnode_property_read_u32() using the same 'ep'
handle, leading to a potential use-after-free.

Additionally, reading the optional 'ovti,mipi-clock-voltage' property
used to overwrite the 'ret' variable. If the property was missing,
'ret' would become negative, and this failure code would be incorrectly
returned at the end of the function, causing probe to fail entirely.

Fix the use-after-free by moving fwnode_handle_put(ep) to the end of
the endpoint property reading block, and adding it to the error path of
v4l2_fwnode_endpoint_alloc_parse().

Fix the error leak by avoiding assigning the result of
fwnode_property_read_u32() to 'ret'.

Fixes: 91807efbe8ec ("media: i2c: add OV02A10 image sensor driver")
Cc: stable@vger.kernel.org

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
Changes in v2:
- Fixed the commit hash and title format in the Fixes tag.

 drivers/media/i2c/ov02a10.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 143dcfe..53ff86b 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -821,9 +821,10 @@ static int ov02a10_check_hwcfg(struct device *dev, struct ov02a10 *ov02a10)
 		return -ENXIO;
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
-	fwnode_handle_put(ep);
-	if (ret)
+	if (ret) {
+		fwnode_handle_put(ep);
 		return ret;
+	}
 
 	/* Optional indication of MIPI clock voltage unit */
 	ret = fwnode_property_read_u32(ep, "ovti,mipi-clock-voltage",
@@ -832,6 +833,8 @@ static int ov02a10_check_hwcfg(struct device *dev, struct ov02a10 *ov02a10)
 	if (!ret)
 		ov02a10->mipi_clock_voltage = clk_volt;
 
+	fwnode_handle_put(ep);
+
 	for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
 		for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
 			if (link_freq_menu_items[i] ==
-- 
2.50.1 (Apple Git-155)


