Return-Path: <linux-media+bounces-60533-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHHYJrf0+mn/UgMAu9opvQ
	(envelope-from <linux-media+bounces-60533-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 09:58:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A82604D786D
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 09:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 721D930215B6
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 07:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77923E3157;
	Wed,  6 May 2026 07:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9hTC8TI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B253E0C56
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 07:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054287; cv=none; b=EP0CbYWxqz6u9yjNr9u6NkUP1RfQD5Cwamn63+5KEWqhFsBgohq6Joy1wvByEy6C2BfMlORgpvSO0t0Q81v3rrkytesy9gQEIwCzFNLIgPnuT8qqssSzRHZmge8lllu9OLGrLosRdZ++sYVIfSBVAfUXmSCoRPfDZws7YZfxtp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054287; c=relaxed/simple;
	bh=NxDn3Yx28HJtPbWuriUuKQ1bU4FkzVJ+n8JDBIb0o2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=on1HCl0O6GS44DKrtlqcG7L1BQBz5InePYu/axC6HDR3Xi+/K5nzs6+OELIsWOU/as0TN+zuHkz6PKei37H5l6UD2LKfZ8M4BPVgzYp5EtIbppjXJdK3JzyxcZgc1NbLt610XuCzpOSXzHhHW1lwtbxQ8rNOGnZtgoriXaHSBco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q9hTC8TI; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so5534781eec.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 00:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778054284; x=1778659084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yP+mwFYhjefiJc9HNwtug4g60Bu6O6itewJ8verryo=;
        b=q9hTC8TIg2Uvbz2B18ecXgVKwj25Tc1ez3DbAA9ZeizaGQbAhnSZPHqZ+i/8y0ESDI
         buKGBdTKEh2sYMjk+S5W+Emb9Ym0mqd6jC0Y2+9QTdIcPM37JYx3W8iKSQrAMtNLGc92
         3lFgH12Lx7OPV2B2ag5Wz6Tk8ZLWYMK/PCOpS3CeP+D999I0eWUnKXF4KO+QotjxcfMC
         qcjkUlZdRe0pTroYJcgY7RudcaXFfy0EH6dzggPoDOEURHKlrGvhZZPvTR0vFd/wK6dm
         OBtlu2bnQ5f7y4BIpQgDgiace6IqL4YYQM6LOAgTijVtd/qI53S8qdqpAQMebfdkIVJS
         i38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778054284; x=1778659084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0yP+mwFYhjefiJc9HNwtug4g60Bu6O6itewJ8verryo=;
        b=KMinMLZvinxH3UX7VIjLXDqM6vc8WGKpBhwpoRujm6xebNzMOQRQoDKscHjFm1swYw
         Yb47rBeCnLnok+K3YatMWSppLLySqHC/qXSpewx+tDHV9reLTokjgdsvyueA4nU+Swrm
         dA+9unD9L97p7lRpYocahhcN8HnQ946Z31X21Hs50qN1GPCsgHDchvEfvPc61vsvyyQm
         0KOELzHHKvNPjgOFlgq7zppcrkkZnQWFPAVNdLL4POZbVr7tv7DikfWGZEOApUmBBqp0
         K3ooNMH5X2Dbb4Wyf9e+Elnq3+wFV9fG2cASe+rmt+JgmWlbWty41pFzo4nl1Wm0GV5b
         8cCA==
X-Forwarded-Encrypted: i=1; AFNElJ+vV6ZXuakSdpt+PAdOEBOXKhixIIxwM6p13ylMnAbMnKEe+WyWLhXgWiwX/FZ1A50JgugK5eyaRxVrrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNgPkH4hD9dxRAegGz27dS3WjZxWHH251pgETF2GH68rmKO7/A
	JQuPDidGb2MN5ZdhgwpATiuw9yfJqDxM9Tw4tkr0PzFShyB9wytbSGaN
X-Gm-Gg: AeBDieuK0q0z4lQkoFDZbhmWJsrG2IUy6If0cmv4qc/1TlZ7IB/7X8e5OemJdilnFy1
	83hVew5dF5NfsiU6ABFILMs2NQqwgvVOqp4fnSPkdgvt1hkOSa36SCpC52gKreN3yRSf54uZzL+
	sMQqKAdIShaCl8hSpyPsN86AqX2xcx2ehnBp50bLhSprdzY6rh57BbPlOUgr4HehJZvvnXCeUk0
	xKhJhHIFIC8Ty9AEO0pgFnx91KImN6ZhavquqV8Uep237zC0KWUGopBEVqopCLz5BAsTxmBjdJg
	n4viotkEEa+3b6L4jB0CooBkZ99DcepxeCOLdt7bmazpiCy9S+P55KPhtlFY3sJzBQ1JTRJVS8b
	QXVwyeh22cfz4AZNJMjU/y0l5xC0gbvR/HKqyuIm2OROLIXzpRN4dVuNA/n0u5eyNMdCe0ibRg7
	jeTXJI24DLhzB2WJNemjb/4UBcIlIJ4zNx+Fvdpy+E73zXGXuAJHs8XeppLf4DyO9tCQ==
X-Received: by 2002:a05:7300:4794:b0:2f2:5726:db4e with SMTP id 5a478bee46e88-2f54ac74abcmr1120763eec.18.1778054283787;
        Wed, 06 May 2026 00:58:03 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56d4cf2fdsm2416561eec.8.2026.05.06.00.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 00:58:03 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: hverkuil+cisco@kernel.org,
	dan.carpenter@linaro.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 1/1] media: tegra-video: vi: fix invalid u32 return value in format lookup
Date: Wed,  6 May 2026 07:57:45 +0000
Message-Id: <20260506075745.28574-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260506075745.28574-1-dennylin0707@gmail.com>
References: <20260506075745.28574-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A82604D786D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,vger.kernel.org,lists.linux.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-60533-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

tegra_get_format_fourcc_by_idx() returns a u32 but uses -EINVAL to
signal an out-of-bounds index. This results in a large unsigned
value being returned, which may be interpreted as a valid fourcc.

Returning 0 is not a valid fourcc either. This condition should
never happen, so use WARN_ON_ONCE() to catch unexpected out-of-bounds
access and return a valid fallback format instead.

Suggested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index f14cdc7b5211..456134a9e8cf 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -80,8 +80,8 @@ static int tegra_get_format_idx_by_code(struct tegra_vi *vi,
 static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
 					  unsigned int index)
 {
-	if (index >= vi->soc->nformats)
-		return -EINVAL;
+	if (WARN_ON_ONCE(index >= vi->soc->nformats))
+		return vi->soc->video_formats[0].fourcc;
 
 	return vi->soc->video_formats[index].fourcc;
 }
-- 
2.34.1


