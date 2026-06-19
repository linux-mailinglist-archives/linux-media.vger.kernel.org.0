Return-Path: <linux-media+bounces-65278-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4g2oA8UzNWqQogYAu9opvQ
	(envelope-from <linux-media+bounces-65278-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 14:19:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E54D6A5A6E
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 14:19:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WqRTT37S;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65278-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65278-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E860A301907E
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB9D379C31;
	Fri, 19 Jun 2026 12:17:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE533839B4
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 12:17:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781871470; cv=none; b=g8fKYk0wSFSlsz1CUTbVvWcsq+JI4HuIaZCzVn2Uj0gLWhwETUD8qbZLkRXeTEozNs3htb3TlTnHvmX+H9iMedFNkD7Momqh02atq7FQk0QMKoN7rBRJ9o8+l3txkmAGxjUOllxpAycLLGDV4A3ptcyV66/Bj8Co74hZ6yIw+9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781871470; c=relaxed/simple;
	bh=8kgNGg2BjVre8/bahBgbgCYsOBrRSClntsD3Q+v6kCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r1WjXc1lQxeDBDyvH8JFJ1S+C40jNP2gx6ZNoCrLRdgZ7wDWSFrGdBxPNAqcfRCN4/w7bZEvtUR1oQ5qBoEgpYWZdSyFAla9Ws0Z2Y/cQXsBb6pw6ht+rGXtapGKaUxGMcxSvGDCHrbcijQlbcPnSYYoDaja+G+T0FtHgcGeKaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WqRTT37S; arc=none smtp.client-ip=209.85.210.173
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8452a597afcso1208937b3a.1
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 05:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781871466; x=1782476266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOK/pDK0ppzf76+A3kfllKRbu7IV027uhUgyzteLmmA=;
        b=WqRTT37SpO62gZyHdhC1NmvZW6qdl+9FPa7yd38JhKg+X28F7f09Q3ojNIM7KA1TPR
         eNvG7WB45RvSA5mWHQu3ppCQiIiY2lVi6ZhmA9ayeO6gmHC6WhHxjVlVrzBo9wqxAX10
         +yyVZEOoULW4n7Q3UHqW4w8WXB38Mm1w7ClFAxcvjRQbA+KFcAWk5SZ7MKRu3cj37Vc+
         wIPS+o5fdBTzxU5mWxWVb6ziV+d4NyIbR/o33Yabd85zzIV+rdv4nja4K2obUQfY4hKS
         E5HO3U+/gAWsszPJSM33NFcqdUQrIU4dxqe5T09vcMDOapXAJmTBYb/E26UBb2qMDjIW
         IxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781871466; x=1782476266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oOK/pDK0ppzf76+A3kfllKRbu7IV027uhUgyzteLmmA=;
        b=bRjIJPNTs2D4N+5vPJwElrRNAXYBgFQNOFa2LLeCn3sfdMlUb28l3Y/BVg+DI7GkXj
         YxxZUdpgTX86+jStUv7UjKCAIe09WrZeMh3CdpHFmg92pS0UbiBmoVmvEQLHaN8nfyDA
         GEaG993ExdLt8H5/LeE1D9C1SfWRcZWxpS3YKXOzvCR+0CEjHLWfPCbXeQpFIwACSgLA
         nFbHME6hC+X02fHwPO/HY4hPOVVG5QtVda7TD2aWQlE08LdfskJxUO2cf2xlg1cqZaSp
         DD6qL/BwTRQebrQAZj5IonOx71d9+o612ZuHgZz14Qstd/MqlO3iEtV93bUN9FFKN9/t
         EQew==
X-Gm-Message-State: AOJu0Yy89+N3pd6FUU8JiFCs777jut6PEI2ZkYGjqpAFccfnB3u/vYvy
	Kv61QqMoq474RPHJgPxPEibAoM+nZUC0d43pmB+qkRUcLLjcLBcV1xtRMx114YlI
X-Gm-Gg: AfdE7ckGZEtd6+yAh1lEt3n2VQBBOS//UNJeUK2x+r+naGqse9W181M4q94nicBqp+R
	3aaX4uTFQIqYfz57dvdbd7nvRx0w4G+ruqcuegbltgekZ2cXh7HUi62zRjN87opQmgaXJ2/jcAK
	wid/n171C+L4376irdB1+o3Gy+NsZ/cYW5O5GYeYa+d2HVAa1sAEj5igMiKAFSUHn3DlYqn1r4d
	Z+TZ4HKucPYivNtJa6fxKmIK9/jvNagRpbPBK/ZFiAFqEAHnzXyEqzDCgwbz+1HzE5GF+5D62tm
	fos/FqMnAs2LajU3mUCM6RYIrwxSYSjsRl+AJpDFmcW2PkBGFtuAg8vQJNndi3Q05+hH3q968fZ
	bl1KS/jgYnU5/LrBTQT3eRETm2u76TxwszJDMX54EiuOIS/zV+qkV7CKZaufr6s+6BWVobiM5ak
	0wUdf0P3rE5em3AtOkqtBmwePij/jlviGdwKudkjZv/g==
X-Received: by 2002:a05:6a00:1ad2:b0:842:614e:cc97 with SMTP id d2e1a72fcca58-8455087753bmr3697074b3a.23.1781871465949;
        Fri, 19 Jun 2026 05:17:45 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455382586fsm2296986b3a.43.2026.06.19.05.17.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 05:17:45 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2 4/4] media: renesas: rzg2l-core: Add missing media_entity_cleanup()
Date: Fri, 19 Jun 2026 17:47:33 +0530
Message-ID: <20260619121729.24899-8-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260619121729.24899-5-birenpandya@gmail.com>
References: <20260619102241.22887-6-birenpandya@gmail.com>
 <20260619121729.24899-5-birenpandya@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65278-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E54D6A5A6E

The remove function is missing a call to media_entity_cleanup().
Add it to prevent memory leaks if pads are dynamically allocated.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 3c5fbd857371..84d4883e2fe7 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -312,6 +312,7 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&cru->notifier);
 
 	rzg2l_cru_video_unregister(cru);
+	media_entity_cleanup(&cru->vdev.entity);
 	media_device_cleanup(&cru->mdev);
 	mutex_destroy(&cru->mdev_lock);
 
-- 
2.50.1 (Apple Git-155)


