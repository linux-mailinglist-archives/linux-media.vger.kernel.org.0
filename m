Return-Path: <linux-media+bounces-28405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D43F1A6722A
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 12:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 365CB16AD09
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 11:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D7220A5C0;
	Tue, 18 Mar 2025 11:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGNslLiv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1767C209F4F;
	Tue, 18 Mar 2025 11:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742295967; cv=none; b=BndoiQRkUNLmVj2yZOmPqW3bdq2sIqQ7nT6VFAKuxR+BNBE1c8lULunl80cv1QyOz9oYNQiwjBwiYBL6J3B8s9iSQGqlUWbYMXXSzReCQZ/uBdJF9QbzDy9FSYfLC8KhT1nmEJ6/7HX7rkyU8tF5iHyan63iQr9bgy7c/w2BkiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742295967; c=relaxed/simple;
	bh=DH70alzSsPNOYoAFcUFfnBcoSSJlTrvzOeP/loFNSSc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=spcofmkEbuEEpld6lNg7gOUgue/wZ6K6M2ZG3KC78HCIXpwXSWWNUOjatRfc4rrWOgWu0RKoojVaXjcXwWLdzXNmn5WJOQ4gMm4JimTdzwSNmsqwzF7QGvag90S0vtbpWKzWBzo3RmfKED8htkopJkzMskAk4Ws5vMvWKaca+Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGNslLiv; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30185d00446so2620418a91.0;
        Tue, 18 Mar 2025 04:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742295965; x=1742900765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zpMoor3dBxgu172XtLCnpvR9tyAyuKLKTcHfjZ0A4I4=;
        b=VGNslLivjutcJmOlVhAEPwGS76aDYICEGw4K03rWp6ggEdL8HwppNbRGMW91TlgdBt
         uVG8DqObK/DvLtfSmskci9BxNdqTyoEbwwHjAjRrJN1CXoQrSoGX7HTHTo3WrvRwIM+s
         oB34dziLC+6aFqHRBM6NBJXDUOxGWgm5vfWx8NKx3GF3ByS7UI//768T5XPZP+ytUTgq
         XHbajZEWCnj17Xyfw6TiPaDIp5RKvSjW4NJt3PrevBcjhZja6BVHnRSfS+bT5uO1OWBA
         enGEPQhIjPW+qqGSMIaiGAfP662Pankvp7gBhvjleywkKrxrAJUAyFpQinuz5HCXjZoK
         KzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742295965; x=1742900765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpMoor3dBxgu172XtLCnpvR9tyAyuKLKTcHfjZ0A4I4=;
        b=iNNSGWPuw46NnBgNFy9ij1VzCTwF+eYiFEGCNN8g6ZebtKR3BJgOF/yng+UXxqKfMm
         B6B1pT1opfdi+FPpkhD+CLV8m41+7BOLzTJJH3TXix3zdfH4ZOq3oBBvm5kWlzbrQq+V
         qHw13Fa29GBuIgqsMK/WEd0tLOP3v8o4kr+vqaDlxj4YIsW6rMqQLhw0Bxi/JEaUpZAW
         OIabWFNI+ORLBmse1zWiZc2oGbj+TESLWLhSAMXFJGCo4MqwJ0ntbHU1Vftux9nzIgsE
         IjpeS8IYNYNYnp/qo0r0agIuZ8fW0TyX+GiXJaMRJqR8yev5fgAHD5Br+Y+gHTfgBBg2
         T+3g==
X-Forwarded-Encrypted: i=1; AJvYcCVjnb0PyA+ILIALRFk8pvIgUKAYSNctKRuvwGv9vBQi0hpZW9/Ro5QHRgyWb1D2RpaH802aufT/6y3k4Kk=@vger.kernel.org, AJvYcCVqdKKPVTW/fPwhYaPAx9513+qCOOcqaRZ9sNb5+E575ISpRbERt8xcROx9FjFuh1RTEdw+x9g28tkktTI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd8ArLuwVtD8UqnXvxI6QHu7kTNrE+46OcSv+BhdM87Cp7k4w3
	g3apndmhYMnBThtsMeuljixK0l1dQHuc5SIeouVJ3uVl2aQZGYDC
X-Gm-Gg: ASbGncuc7/fsUu/L3iV7V3v9uF9s709DS3eXnqTusS2t8+MCHPVYLEv3wp4fRw2L56+
	taE1A+8DFVP96JIPtLs5tmQebd8n98bAx85nyqF65Tj7WicKX2WJFyt1SJ602DU6AXa37N6H6Bm
	szkkHm3PfSm3F6NGjOViWqThduWwwANFwiHU4FTMVX22Xv36+x4VS2ADAXa2oq0dx1egSq5z0Ns
	hi2XlrEWppMhSvxDwYwfpbvANmSeIAG0FUzr1+PQIDDVMFSM3ZGVNmZweLl5k2/lAFk6/wf3VeV
	It+likJWyOQguktP/6pOdUrpbKLoRjVuFf++3o2CB7wQJdWxFHcu+QsbynvNRPOApVChDgvWORk
	ByYQ=
X-Google-Smtp-Source: AGHT+IERa90JABWCDbih4/KSJyahmNphPCQsBv4vNHzGIf8QKc+5jhhkS4+jqZA/ZsgnGvidqB83cA==
X-Received: by 2002:a17:90a:e7c4:b0:2ff:53d6:2b82 with SMTP id 98e67ed59e1d1-301a5bde7f8mr2666252a91.11.1742295965236;
        Tue, 18 Mar 2025 04:06:05 -0700 (PDT)
Received: from localhost.localdomain ([183.242.254.176])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-301539ed283sm8775205a91.18.2025.03.18.04.06.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 18 Mar 2025 04:06:04 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fullway Wang <fullwaywang@outlook.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: linmq006@gmail.com
Subject: [PATCH] media: mtk-vcodec: Fix reference count leak in mtk_vcodec_fw_scp_init
Date: Tue, 18 Mar 2025 19:05:53 +0800
Message-Id: <20250318110556.903-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scp_get() returns a reference that needs to be released with scp_put().
Add missing scp_put() before returning error in mtk_vcodec_fw_scp_init().

Fixes: 53dbe0850444 ("media: mtk-vcodec: potential null pointer deference in SCP")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 .../platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c      | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
index ff23b225db70..11ab3bc60217 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
@@ -71,7 +71,6 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_use
 		pr_err("Invalid fw_use %d (use a reasonable fw id here)\n", fw_use);
 		return ERR_PTR(-EINVAL);
 	}
-
 	scp = scp_get(plat_dev);
 	if (!scp) {
 		dev_err(&plat_dev->dev, "could not get vdec scp handle");
@@ -79,8 +78,10 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_use
 	}
 
 	fw = devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
-	if (!fw)
+	if (!fw) {
+		scp_put(scp);
 		return ERR_PTR(-ENOMEM);
+	}
 	fw->type = SCP;
 	fw->ops = &mtk_vcodec_rproc_msg;
 	fw->scp = scp;
-- 
2.39.5 (Apple Git-154)


