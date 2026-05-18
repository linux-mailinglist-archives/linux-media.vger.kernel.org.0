Return-Path: <linux-media+bounces-61989-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JEfM/wMC2pN/gQAu9opvQ
	(envelope-from <linux-media+bounces-61989-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:58:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA4B56D326
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 90C123069D7E
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1439A44BCB8;
	Mon, 18 May 2026 12:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnDEhtDm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B8244B67A
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 12:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108740; cv=none; b=iDya/mkUTbD71XDebNWjWpHzc33wx7inSFXckGn1KLRFoyHLvKX8yzja2VS1rKrz/aszUtUrHK2IBgf763OIygkSwSpK59DmZ5T9TlD+4pCG2jUCb6VHObdMsejKDhdUdyHRtHT0vNaEiwZMifMIebkjeKuDzcl96rRlqOBYX4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108740; c=relaxed/simple;
	bh=/k5HGROMAkHXH0aWD6D+yLoygWZydZTfR30dK+Rb+00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iOzJg21QRmEvivuO/eXbPT/gKWI8nmJnR+szwn2V2rr7qb0bO6b3zcRsgUrY/VXGkZ5rNB9i+PFRmaobO8vVYs4ebccH91mUOvlodLbp2MOUbblI+NbxKmRwnnNNUz1SjUoGYEwKqf/5Q8WEMEHNW5DEpGdT+EWptYgRb48hL0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnDEhtDm; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36974220e45so785122a91.0
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 05:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779108738; x=1779713538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8459ka1i7cq2n7IBawpfs6eiuW3MTLtx44g6qMux+Ps=;
        b=TnDEhtDmHonqc8WEPH6DR8yitDB+WRUODIU7+xC6H4LaDO7FMLhGhLioxmdF7pD65Y
         mb1O8ahVxxMIr0HPJCq/nGCfFK2ciwM+aVZI9nIHyPDTJigqv9TC0uhUG0PZoaXXudPs
         Jl+WRtdxUNN3XHiZwI4YkNDX+fm+hvsT9UvrlBhKqCZ35TKDrIUpK5jz2ZlCvLbCQOdA
         vurfDBiwW5VfOwdRo+8q/Jw2Mjip4YfG6Fxe3SSOVWEpTaJvS0tlEUIma9qg8AttBOaA
         dpiDNfMxVsQmFGJGuX//pHkSH9RlUqqS0vaWw8z20GHJrfBAID+BFZzkXviMX5EO0Hmp
         CyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779108738; x=1779713538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8459ka1i7cq2n7IBawpfs6eiuW3MTLtx44g6qMux+Ps=;
        b=YMUjRf29THfUsr3xeOnRLiPNQsc99oNzHEW518+UP1pq4i8tJ5wF1ilVcAXSqlISUt
         abqzxbEmgCUeMXsxKN2Mg2LDiIlotu+5Ojak+4t35W16fYR5FmPVksCmUO080QFSBUU9
         QynSmQH/lHdakvzno4i21PJYeTFRRJfDcbELc6nU0hh4xTlXyNe5Nj0A5Yf7WBzj+e+u
         GssnHznEJTNdIao7cF1zhKC+rB0cfVTnQdUQFuThIKBOpql61/7d5X3LossdxdOBqqCf
         NT7O6Siuy3kMw9Oh9lBsExzZKVYUPBMG6FzUHV1V9tdXQFZFmoS1qRu5PjKjY5eZoAnH
         20zA==
X-Forwarded-Encrypted: i=1; AFNElJ+rMJwjOlu+hX0KDCgpiJVBdZ9fVP2HXvIYdKFnNi2tpi5KpATzW22UuDZyfAs/Y+WANm5kSZ+ymy3hRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHwCQj7Urkicx6cDmcMQXbBIMBKrlhGDVt0vDGImZvv6p9Y+Ik
	RxDNfRHGqlwf6YeewXAusgJYnEYBFlFq3p4584jJQ+9/xw8K1uW7Vzn2
X-Gm-Gg: Acq92OGmnRKlsAOyxHJBDZNyCDNkxpvkiZ0GQ91X5N1PALVGtGISWA7DEjND1Ip+UdS
	o46yH23aYUKG+HdpBcPePP0EatH2WezcXVB8cYiGZ+OcrqdDl1Z1N0wdBZ5yeQg1epwJRGeOho2
	OZ0K5d01mqQ1m3p6oJt2KR9DYEVYwVBd++2U89BwwwNl0uUfCuVhRtmNZ5qkIxuBjHMTs5yY+G0
	WekHRx/X3//7Z5VBKa0IQ6Bvy9hgTLWD+sCcoY/+OjJEcJ4TV/pZqIXCw9olMXt9f7ens6h07K+
	VUqrhiWfWG1/+D5EgCqgB6DtAFIfIZAFjJ/sxdrb9B8RwMatG7tN3H7CC8VdmVpwpJ020zs501K
	E+SdqVJPIPA+u5t0k7MDZxivb50KLAOnhi6ehWkEYAsNYqOcHudKtthcg7HyzJgZFYGxWX3IxCB
	ycYGcz9fB9AEFZMdH99HQ040w=
X-Received: by 2002:a17:90b:1d8e:b0:35b:d795:cf5d with SMTP id 98e67ed59e1d1-3695137f713mr10939480a91.5.1779108738463;
        Mon, 18 May 2026 05:52:18 -0700 (PDT)
Received: from lgs.. ([101.36.111.22])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517ed182sm11265900a91.15.2026.05.18.05.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:52:18 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Xia Jiang <xia.jiang@mediatek.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: mediatek: jpeg: avoid double free on video register failure
Date: Mon, 18 May 2026 20:51:43 +0800
Message-ID: <20260518125143.998572-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7BA4B56D326
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61989-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,chromium.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

mtk_jpeg_probe() allocates a video_device with video_device_alloc() and
releases it from the err_vfd_jpeg_register error path if
video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  mtk_jpeg_probe()
    -> err_vfd_jpeg_register
       -> video_device_release(jpeg->vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free jpeg->vdev through vdev->release().
mtk_jpeg_probe() then releases jpeg->vdev exactly once from
err_vfd_jpeg_register. Restore video_device_release() after successful
registration so the registered device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 2ac8015f156b ("media: platform: Rename existing functions/defines/variables")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index c01124a349f6..9888ac8dd6e4 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1362,7 +1362,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	jpeg->vdev->fops = &mtk_jpeg_fops;
 	jpeg->vdev->ioctl_ops = jpeg->variant->ioctl_ops;
 	jpeg->vdev->minor = -1;
-	jpeg->vdev->release = video_device_release;
+	jpeg->vdev->release = video_device_release_empty;
 	jpeg->vdev->lock = &jpeg->lock;
 	jpeg->vdev->v4l2_dev = &jpeg->v4l2_dev;
 	jpeg->vdev->vfl_dir = VFL_DIR_M2M;
@@ -1374,6 +1374,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 		v4l2_err(&jpeg->v4l2_dev, "Failed to register video device\n");
 		goto err_vfd_jpeg_register;
 	}
+	jpeg->vdev->release = video_device_release;
 
 	video_set_drvdata(jpeg->vdev, jpeg);
 	v4l2_info(&jpeg->v4l2_dev,
-- 
2.43.0


