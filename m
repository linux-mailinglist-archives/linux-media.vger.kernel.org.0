Return-Path: <linux-media+bounces-58232-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJL5M9xc1mmNEggAu9opvQ
	(envelope-from <linux-media+bounces-58232-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 15:49:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 667EB3BD2F7
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 15:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F383305DEEB
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 13:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9C23CFF71;
	Wed,  8 Apr 2026 13:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVKWwFmt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEA23B19CC
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 13:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775656007; cv=none; b=skRTs52JM5jEM4bO5luY4NwNx8gmz+i0w6xFLCRY70goojrBmjfCe2xMxWHZfjkTzty7jM4lnz7tACApkjgRupzI3an7llcK2mw+uoF1Az6BEbdYXOGEdsgN+oTx6duxZ9L8yIEB5TWosMwV44+FzEHQmOZBMnHKirTOUf/lJ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775656007; c=relaxed/simple;
	bh=jl7Cuyt34o0NcWX8WaIo6AQwpEqbpJ4o5N6K1DX5ndI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbo+aiibKYyUFPXylmvK+V7JS0dmMvBcz3bAivwnAD+VivFYRoGimatNSnT26rHP1kmtSsr3PA1GcPAKR1MahlkAC7jVAv4hWNUD7qjr+ZnBdSdcOdxf1ofyHiQJmKvoXKUcdMVRfaAj317N5yn01TSBkFrOeADCv2d+d6kUBZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVKWwFmt; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66feeb8ff41so144422a12.3
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 06:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775656003; x=1776260803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUmfkfwX20TMwPCgedZQDhcOhsvVso9IX2Cpow+Wj6Q=;
        b=aVKWwFmtZKRgfcAEOBPyXWwyJhJ6lctFKmVEeqz/MG7BPoabBRZd7sSaAOIWCnLS0r
         r97yJVdObja8FFsx0Snzv9G/jCne0kr+AYTOTp11NtnNubXXSbW7/2F1ksHybHooHTyi
         yG6q8wwL45TV6rrmAJJ0cHYsILSTE3vfME6Qe4hkXXGLMvgUVdm70AxgFnyu21Xqo6xn
         6vPYI3/RWLRVjeuSV6+z+PsoB6KZ/3pbr4OnwClWIL0T4VvARh13kUf75Z12FJjX1501
         CFpl9tjO3w4pkGx4q0GkR+2/GeKCnEgFVAN6A3DWLf95taIqryCuSMO+EhFyj/Rk+fuJ
         TK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775656003; x=1776260803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DUmfkfwX20TMwPCgedZQDhcOhsvVso9IX2Cpow+Wj6Q=;
        b=BKSuzuNgBgJTwEqROMBuXxYAyojC5mEWZ+unx3tuAZ4hyq/82W8lIohq89XCBuoMKs
         c9hPi448HXVFgypkFlWYxQQeHMv8Mm5k/9Hi/MpUEIipzg9CRb43YAj4Q/WLXMbM+/Zn
         cTiGnD5Qgld6HKvNxknpbm66zrV/0RTCnGzg15W7Zq2oF/+32+AEwHgWlEiYMu9afvQg
         MwwHMucu4dxOHvfMZIiIb3qmwtgXn0tjAwIja+sGhdfnOf2+b12fgJE1ZvFjNlV1nkA4
         A6EnnahTSoPGK4dufkbn3cfjGRHvWyovyy0b1KvhmXvof33AmhhNcjvUj0vHBSomII0T
         1m1g==
X-Forwarded-Encrypted: i=1; AJvYcCWqkSAzqgPbIropuXZ/BiRSIXLkvHYra7a8cX3Ju9pHlQnHmMgY/sdTMeY6ZJ+tc1eXNqKIeGNPjtzqXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvwtJd31RiZpe0iPwFbe4Pv6yy+cuYcSAaCQSD+YI65VdBuN2U
	li/T4f4mhPE2vgn+7cdQknvz36rbg8D8mb0SP5pLSMh5u9sw2zspHZgt
X-Gm-Gg: AeBDievQ2uu00b634HpjyWGZBf8Fl9nN/ik53Qb6bH4TvKHBdRVBFdjb/lENw3mB9eA
	VKKmo3b67GsPXw+TBTKqszHh5gl+WLKqa9pFp9S6bD+JpbwtmTnCIbPQQ2EZjmyvriPWRHb2/bU
	CFoZLXrmmvohdEbqhFSa5CJIT0tc58D/1EIkBlhLOPadkg5ZoyOlOHu3X/v7WbzEpbiMcsezK1S
	FLN7fAotw8Vf4OGP/3WYo4pOzi0XaS+TFUXvff0D4m25CMDbVQHXF/IiTaY0t+TDyTU7PZIRf2K
	YeDz3TioAdE5DFSN5ddpD5R1OI7C5mukKwFlnoDV1ecLljMa4sx83g6CO4zqWPIclQOvS9VrRRw
	48A/riXtjXXHdT+R9FgEYYTa/zQ4RnFumBa2kylNTvdM5AuSdOzRPlDN7JF9jdEMgGS8P/TnGNp
	gcJ/uVtQ6TMJd5QIn9XIUUvJI1CX1tYfJNnf5H91FGCKXqAi5cycH3Dtxl+9h87Jmz9O0KlFqM/
	emE0I7U0Hg3ms8Bu55xkkH59OL4nL93NhnEDVKSTpFAxT9ZR5BZlspIHTN7gky58MeanveZ8b1i
	m81yDXMBAWxvU3D4Bi7icpc7XODRZojnKq54t7B/1TNaaY2CSMRVCzYJxVXtXJp7C1xYzbXzwKT
	A3WGo0j7lHuNaTjjo
X-Received: by 2002:a17:907:7201:b0:b9c:8499:e949 with SMTP id a640c23a62f3a-b9c8499f038mr1014745166b.27.1775656002939;
        Wed, 08 Apr 2026 06:46:42 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.od237066db22328bb-tp.internal (52.200.204.35.bc.googleusercontent.com. [35.204.200.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d028955sm648787566b.61.2026.04.08.06.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:46:42 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: andriy.shevchenko@intel.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [RFC] media: atomisp: change copy_from_compatible to iov_iter
Date: Wed,  8 Apr 2026 13:46:11 +0000
Message-ID: <20260408134612.1380-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <adUeywfiQzZ5JgEd@ashevche-desk.local>
References: <adUeywfiQzZ5JgEd@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58232-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joshuacrofts1@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.968];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 667EB3BD2F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since the atomisp driver concerns transferring video
data, it would probably be better to use an iov_iter
than copy_to_user calls (scatter-gather i/o and better
pointer safety). Per yesterday's emails, I'm sending an
an example of a function in atomisp_cmd.c where I've
implemented iov_iter usage.

Note, this isn't a patch, more of a question whether this
style of changing the copy_to_user calls is valid (or if
I'm writing garbage code). I'd rather get your opinion
than submitting a patch first.

Thanks for your response!

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index b3e971be0e..3b987e8e8c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -15,6 +15,7 @@
 #include <linux/kfifo.h>
 #include <linux/pm_runtime.h>
 #include <linux/timer.h>
+#include <linux/uio.h>
 
 #include <asm/iosf_mbi.h>
 
@@ -1676,7 +1677,8 @@ int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
 {
 	struct atomisp_device *isp = asd->isp;
 	struct atomisp_s3a_buf *s3a_buf;
-	unsigned long ret;
+	struct iov_iter iter;
+	int ret;
 
 	if (flag != 0)
 		return -EINVAL;
@@ -1709,13 +1711,12 @@ int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
 	config->exp_id = s3a_buf->s3a_data->exp_id;
 	config->isp_config_id = s3a_buf->s3a_data->isp_config_id;
 
-	ret = copy_to_user(config->data, asd->params.s3a_user_stat->data,
-			   asd->params.s3a_output_bytes);
-	if (ret) {
-		dev_err(isp->dev, "copy to user failed: copied %lu bytes\n",
-			ret);
+	ret = import_ubuf(ITER_DEST, (void __user *)config->data, asd->params.s3a_output_bytes, &iter);
+	if (ret)
+		return ret;
+
+	if (copy_to_iter(asd->params.s3a_user_stat->data, asd->params.s3a_output_bytes, &iter) != asd->params.s3a_output_bytes)
 		return -EFAULT;
-	}
 
 	/* Move to free buffer list */
 	list_del_init(&s3a_buf->list);
-- 
2.47.3


