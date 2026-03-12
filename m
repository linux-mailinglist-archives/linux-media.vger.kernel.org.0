Return-Path: <linux-media+bounces-55548-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMr3JAUys2ntSwAAu9opvQ
	(envelope-from <linux-media+bounces-55548-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:37:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3775627A181
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C56231D3ECB
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 21:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA21DDCD;
	Thu, 12 Mar 2026 21:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="a7EyDWwt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D6D36BCE8
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 21:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773351343; cv=none; b=epXUD2pU0OrBZR5NoLv9dwZmy2BltPYC0S3YZTvOEk3Y/bMMCfVh0InLD/jE1gZll+WVNQkwTulxWc3ecA4/D9sBBF7RFHAEHWLlfHJZ1+KdTl7z2WS0qQXzZIUfexCzfnA1rf9FxNxIKrineF4c1P3WkmDNGmqEEDUg4gi28oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773351343; c=relaxed/simple;
	bh=6fIY9KWO5ggKAdAsokoIGeVzHgkX4Uz+qI9cO8diMPo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bP69Zrpu5WdamyAUjU0oToH/IXZg6gr+60rU0ghJZPcFr8FcZ0WHuRqE76sYTmeyCANAZvkPE+3vyIeclnZLvDE4N6+cIvDUNCZ2rkfEaOiT3s3Osw4xS6ONFfR98fjZQs0VUXBGNqzAjwYc0q3chtYcW5BJFutzyzN7GuUHWDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=a7EyDWwt; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4670bcc40d7so640779b6e.2
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 14:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773351341; x=1773956141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4FxDASgl6y1i7RBwsxqG2Wbql8f6EuCCmvm25Li0qM=;
        b=a7EyDWwtEeIZhqZncoe3iG0i4OjNwpIpplr1+5zVMfXFFMMbzrUx3SegXVtlK/ys77
         wVszvFQzAfJW6hG+G9tqM2PBQY6cz5TpH+XgkE675bfgRVpQz4F8TR1diZOmw7/RAtaq
         ca896XqKsZMqFGyYTvjBTf0jmNZbPqdBmfFxXKOKNNgWjifyHOEfa5nRuZY7Tews1z1g
         lol2k8omHOue9/hq9DUXJoKXqVqx0LEAhzrFtqKSWkSVptN28Zi9T2dZWqSiM+D368Ao
         lc9NAj+8s6E8LBPl0G5GzbbDh9huvoWzbQB577OxunoCijEwU7Tf4LbKLjFjZvBEs45e
         b6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773351341; x=1773956141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u4FxDASgl6y1i7RBwsxqG2Wbql8f6EuCCmvm25Li0qM=;
        b=qze8I4vDQpeGt2SCUXL46VszNeUT3iIhRZO3BqwnLJB/VllK40uBtgAB0id9lCxQo6
         PmqLlEB+4cjofKxkJDPQlgR8+ek/+Hk2cH2FCmqeL+ZDGHnYMoifzUD+B+wSkVVpTlol
         zrejyNO8vKQUqG6VBfH7Dlk51aA2JzpLxoB8LjVV0T+tuptG+QRSqVED8dezFlkEZm7S
         oBitptH3jigX20BH9tJ1uSDYSPLYGDExqCQ1GpfxFWv0wMrgIVaeVdAAk0y1vbiG+Je6
         vlgjfzlNsPLosgac0l0jeOM4e5zaNe8NM8iNyRUKM1VHMqj/SU6r5vv1W1pzPLn6519A
         RoDw==
X-Gm-Message-State: AOJu0Yz1/IwBwsPjFY0JE4u39NPiI8NuyD+jRYawRbo5h8+CtvOq3dlK
	/fR5dLC9qTyrGk8BzEE1d6eu+f/IzllR4bhGRShUPSXdWD0S8j/pN/DTn5T6SNL6N262xoPlJN8
	tmf2i+kE=
X-Gm-Gg: ATEYQzz80RARaYJFGx7mGJqSXIGO0whWLUDChRwaDH32SyxycmSj7gK2Z1oqxeyGRt/
	XvHuJaViKioJeK4ZdAugQNIWlBZzkfA9kcISdXKf0+oFyrjYp+THOr4JBUJE225cyUByPHh/DTJ
	IU9rWnIs010AjTMNtpPVFoaxFwFpqyz+PzECKcP8tIcJ7QdRCsGGmbYeBdtRuooMv49OpMymX9N
	1Xziwbp3lDL0HXpcraybrzW7l8DxCoAMTP6pM8DkzfT8KK5cxUX0rs+/H/79AcDgHDnGfsuRn65
	H0OA7IbIinf3H+b72P57khygYUPzv3Cb5LBRtRov6X4S0SP2ONtbbUBVDYR9LrAQXW7FNewCP4z
	3ikVY1KXYq674zQGU+UeE721KQ9K/EGPvlzEjPdxactrroxvssXlkiPFtRNVvRODD6BkeVvV/z6
	yiP9hLzXhsq3Gf1/qwhtLYqoex0ameSwGlSn41ztvFzAzAJKfLgOnQFoHQcK1uNlSTUt/ebPVB7
	yhzylms0uBivp/Nhdo=
X-Received: by 2002:a05:6808:1a0d:b0:467:17cc:1da2 with SMTP id 5614622812f47-4675765ee75mr527767b6e.57.1773351341227;
        Thu, 12 Mar 2026 14:35:41 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4673415c264sm3657572b6e.5.2026.03.12.14.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:35:40 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 08/11] saa7164: Fix REV2 firmware filename
Date: Thu, 12 Mar 2026 16:35:29 -0500
Message-Id: <20260312213532.2907276-9-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260312213532.2907276-1-brad@nextdimension.cc>
References: <20260312213532.2907276-1-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55548-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 3775627A181
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The wrong firmware file is listed, leading to non functional devices
on REV2 models.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
 drivers/media/pci/saa7164/saa7164-fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-fw.c b/drivers/media/pci/saa7164/saa7164-fw.c
index cc9f384f7f1e..341cef62452f 100644
--- a/drivers/media/pci/saa7164/saa7164-fw.c
+++ b/drivers/media/pci/saa7164/saa7164-fw.c
@@ -10,8 +10,8 @@
 
 #include "saa7164.h"
 
-#define SAA7164_REV2_FIRMWARE		"NXP7164-2010-03-10.1.fw"
-#define SAA7164_REV2_FIRMWARE_SIZE	4019072
+#define SAA7164_REV2_FIRMWARE		"v4l-saa7164-1.0.2-3.fw"
+#define SAA7164_REV2_FIRMWARE_SIZE	4038864
 
 #define SAA7164_REV3_FIRMWARE		"NXP7164-2010-03-10.1.fw"
 #define SAA7164_REV3_FIRMWARE_SIZE	4019072
-- 
2.35.1


