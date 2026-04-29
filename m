Return-Path: <linux-media+bounces-59922-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBa2Nkeu8WmwjgEAu9opvQ
	(envelope-from <linux-media+bounces-59922-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:07:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3E5490377
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7B253044F2B
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 07:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100CB3A2570;
	Wed, 29 Apr 2026 07:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgTiP9vQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FEA39658A
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 07:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446428; cv=none; b=jAaqGSyAEM/EPMqLZV4fjvatJhU9A+Cv5NSbZtqbbgKWENbyUv/h+zFz8RTccYIp9U1JXDtV1OSmDI5Xy0c+fxIEOSVppQRMpEPlBPeoYKT7xcLxzD7K8XfTlFllCrCaMPOtfnJ/bB0VX+zHeHOehURqOlkshY0HvEXqUptFiPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446428; c=relaxed/simple;
	bh=0DFMRmRmnT3HIcrBDMAr1tbxa08F3uNrVtX65Evd/tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=levXpq7yylgpv+n0JESO8OgaO/Kn6IBxWKPp0zOfb19bGiytsD8LmXFBSqBSQyoDLumypVKlERuci5C6DuuU3O0miT8DXY3U1Ho3EBhNjbtaJegatZpXxtc/qMQf/U4VVID+5+4Ok5TMPR0EqE47T3CpgROnOqnhk39iCboPTf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgTiP9vQ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ab39b111b9so50773705ad.1
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 00:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446427; x=1778051227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6Yo5rERlGwlb3Ci6vxCe4GRUzMyoCAKAgtEtNiZmzs=;
        b=ZgTiP9vQCgN93cRnreXEqy7RyvA3J3FZcKwq67zYgj0tseSo6FIENOMG7hBboCruJs
         qHQ+3F8E39PmgO2RSUGHN2ml1OhT5U7nXi7w+hQM1akMxCPvLxFRKs1KqoGcLXwIOJCt
         /JOf0n8dcPqdrUa4peEdRA405+L/5vOoOjmIhIcyTjoRRFTulng2ZJeCL8ktATxPODqz
         klt8ke4ImR0M6CVAvv2mgytztzhTe0Ctpd9D3MmT1Eha4d7Kdpe8Ef9EZIA6OBuu8z2K
         VzuwZjVdcKc4zffcP6e+XnjD4AugOHRB/wlryhxrQP+lr2BfAaoNsDY4IaYIa4dKEzYn
         Sq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446427; x=1778051227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s6Yo5rERlGwlb3Ci6vxCe4GRUzMyoCAKAgtEtNiZmzs=;
        b=fchB/Ww58uAtIpyu52udjgfBtdtVpY8nJwZ8LbkUNxZfLdNh2/UHdjwr0bKWF/aLrX
         vUcaHwGHVDjim7h4calxCRBqGpwjsA+Jcgc/XyuGZwELwNZzsS/pP6L+Xg7Qq31Yf4ug
         deDnXKUqvniYZfdSs1Zv8wQNtz88pKD6BDl6XMCCkigaNvnN64PgieUzXrrtPPDHDUp5
         E4PsXNnyGTDDR9GEkvc5jN1OYOVVU2Go/Z9jE2IEcpH+g32BSpRwX+QEzd7aDaf0i2/k
         vjRq/O7dtj4bqHPxObGq/gUkYP1GcojuxAmlQLN+xoCE3eghPOSha0VJ/qwPTvQtDAkh
         4Nyw==
X-Gm-Message-State: AOJu0Yy8PZ+X0AzevegCpCQIOlRcsh9q/AsH4VFDXqXppJBEygM+v6x1
	RT3xqJx1fxQ7eZ0ZDVpirbPbN5ka48nt9Yg4xaWdIp5Xn25hYAKCcQih
X-Gm-Gg: AeBDievzS5/xHlPxIaSY4+/KXj92mgOvXsdTNPzfCpfEoCz3wEeblZOhfe4H1Mb4s7F
	XRO34QoGh31ZbsxgTXGFF7I2NpMRDEou20S0pSRMF6MwtdLgk3iF0L2qvHPP/oF3rEtp2IUYOoU
	oslS0BamJiFBT8l80kOSOTdvTLbCiQn3Sxw7Z67YYJomGZSmwgonBjOIY1FAVzUTxQ2/sok/sEg
	AvvHIrAvEkR4x7zGr0lM66eWXVafDv7snS+0zQJNt6zgGjSF2k7dbRNHV7DZABx/xYWha1/YKkx
	jgeycLS5UvXU/sEXUR3cHaVaWEcnOBY9sg64D04O051HNPwMKKVkWCHhIF/fd5AQ71d21HnzQgO
	VMo99uT/0vua2xt5kCvCIBBC2bHdiKY/V0w1PNYzdGAdccH4/WgmTdEEW1yJq/cbFD7vSJHQ3Xq
	Qgtieb92j72uPq2rQQVkwupojoqVl+
X-Received: by 2002:a17:903:166e:b0:2b4:678c:5f1f with SMTP id d9443c01a7336-2b97c1534d6mr65672825ad.0.1777446426708;
        Wed, 29 Apr 2026 00:07:06 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988772e6dsm11872125ad.16.2026.04.29.00.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:07:06 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 1/2] media: hi846: fix hi846_write_reg_16 handling
Date: Wed, 29 Apr 2026 15:03:50 +0800
Message-ID: <20260429070351.1307204-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429070351.1307204-1-mitltlatltl@gmail.com>
References: <20260429070351.1307204-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2F3E5490377
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-59922-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. When hi846_set_ctrl() passes &ret holding this
positive value) to hi846_write_reg_16(), the function returns with ret
as is, the positive value propagates back as a return code, which
callers interpret as an error.

Fix this by resetting *err to 0 only when it is positive.

Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..09c109f3fba9 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1270,6 +1270,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
 
 	if (*err < 0)
 		return;
+	else
+		*err = 0;
 
 	put_unaligned_be16(reg, buf);
 	put_unaligned_be16(val, buf + 2);
-- 
2.54.0


