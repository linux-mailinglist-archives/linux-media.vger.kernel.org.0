Return-Path: <linux-media+bounces-24022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B189FB906
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 04:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73AAD18848DF
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 03:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470FF481CD;
	Tue, 24 Dec 2024 03:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="zxmGtSfN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C3D11713
	for <linux-media@vger.kernel.org>; Tue, 24 Dec 2024 03:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735012460; cv=none; b=gzAdpY8QrnUNDW0bK10QTSzEi16GcbzNZXtulXCYkO6d6zFk0VhKkPmwH7sQK0kKNl+qkKhQg0/1ucBmstz8jge788cGm2LgRZ8KtfP8cZ4G28K1HiWnmVDmNmvFbaxeaI+5MWEF6YEYPRLvCF/w7swPIsOfIPDf+Q7sTZj55iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735012460; c=relaxed/simple;
	bh=HSksRwEPiIFsRGWfMiO1RSqFIGj67ZgA9FA0d0jhkZY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=afTLU006BruRa3gBXDX0H4yOuScZ7K82TCXaRW3qL3hcLp0tc9iC598b7U8lRA2+ZQuPBGA/4OFpK4bNdYh+LGVuE0JunRg8vXdwGKaDWtbY/nnzza/Q6akvdYPvEMniN8fNoYQ6M31mZICkXTAH4pnTdBHlI+zy7dAfgYjDyP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=zxmGtSfN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21628b3fe7dso43665755ad.3
        for <linux-media@vger.kernel.org>; Mon, 23 Dec 2024 19:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1735012458; x=1735617258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXpi6caL3vPJxyjtlHm8qywxuEIOShoFLvCr0QQRW2E=;
        b=zxmGtSfNlf0UT7qIc9wG55hdudAr5Z78NwySFdT8agaAtyZUC/53Qd9Cw23zmLr0rx
         EByPhD8Lcuv717xA+iAQ6qYshRHHiEIloCSa0ncI+mxcROe0k47QFAcwtwWcamaowL0H
         MAaCaIs/FH+UeM4y0CirHmRyFgVvRKxDtst44fnuexhjLvGIZMfu4SdXYL5EZcvJZ3Dc
         z83AFwWhp+jEgAizcDeD0SLAonH83PAcvC14vc6CDZpmF6GfAjq0tQDK4t+aMj5iap2I
         N7YlO5l4x4ZKykmmqj3ojFKQEAZgijWMY19e70i5GW22ep/0v9lTHpMvdTvyV4Rtfgkb
         ZMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735012458; x=1735617258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXpi6caL3vPJxyjtlHm8qywxuEIOShoFLvCr0QQRW2E=;
        b=djL5ktOu6vr7Lqhe59YxEn+xV7xFfEO+K7UQsO8rRYwRo3+/mnvyFrrIGsm3f6a3AO
         YDbjw7BFD9tmv87EW452f2f5v52gOqWV0Y0aJiVUSocHRes0OfSH07JcaKJco+PcgPxk
         PnvwMfd7yRP7Snk8bzKaBJ/SzoR2vxvHYOSK7+QQYrsDXnEYWlYXCozTPjGj5i4fiinm
         IrSxoZrdi+xVXzKxX4gZqaiVcXr+hJb488lyJs5gOGLL4+sLLEZ6bDdOhhtDs8TRkYBW
         c8RDICj21mR+xKSMT31lrC2tBjZgmPQLv7XXcoIYovGfFBB2bGu2myXs8xlpp0PVsDGu
         JiRQ==
X-Gm-Message-State: AOJu0Ywdzkq0vpFHxBKt2LprQcBNrf8TQs6mxWLneVgCXXmoTvYXTDTZ
	uQvwSvbTYum8E4qDaH8ZoPzEITEkULwXP15MW8GOz92ocTwv23YjwCZrEh0jOmM=
X-Gm-Gg: ASbGnct8ZFGm+9KgiMaLf4oNuZKkE3igg4qWODlOf82ekJctUURJUIFQ6s0GJEbFVZ9
	e4iQVw4OHDE9IcVxKRK71yI3kvI6m7TtXoN98pQeC4uuA/oCiSjSy9/rm/NyBPHWclMFkM75Qik
	kHRFASdkFYuf+GfVEAn7b3BvhFBj5iKu4xbQwbOLt6H6Y8NWuQm7r/kcIiDFLpEZPPvhci5J1e1
	sL+BWWZiC3K23vNyLgtVIWm+yqfoMUpPLlcPI2mFbVZoTfhRgs0wqbsWg6FxDx+95dCviiDCnQV
	NVvvnkYKZmkAZxs3SlvTmFKG8RHs6VLmUTTX3mJ0Law=
X-Google-Smtp-Source: AGHT+IGyUFcvRj3fnlTbmr67uIygsgDkO+i32kFsHQ73QMVNiZa67SYeF6UvC4iHptqRER7gmLKlMQ==
X-Received: by 2002:a17:903:41c4:b0:216:1367:7e3d with SMTP id d9443c01a7336-219e6eb45a7mr167687365ad.31.1735012458445;
        Mon, 23 Dec 2024 19:54:18 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97182dsm81006525ad.82.2024.12.23.19.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 19:54:17 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-media@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] staging: media: imx: fix OF node leak in imx_media_add_of_subdevs()
Date: Tue, 24 Dec 2024 12:54:11 +0900
Message-Id: <20241224035411.2220404-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_media_add_of_subdevs() calls of_parse_phandle() and passes the
obtained node to imx_media_of_add_csi(). The passed node is used in
v4l2_async_nf_add_fwnode(), which increments the refcount of the node.
Therefore, while the current implementation only releases the node when
imx_media_of_add_csi() fails, but should always release it. Call
of_node_put() right after imx_media_of_add_csi().

Fixes: dee747f88167 ("media: imx: Don't register IPU subdevs/links if CSI port missing")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/staging/media/imx/imx-media-of.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index 118bff988bc7..bb28daa4d713 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -54,22 +54,18 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 			break;
 
 		ret = imx_media_of_add_csi(imxmd, csi_np);
+		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
 			if (ret == -ENODEV || ret == -EEXIST) {
-				of_node_put(csi_np);
 				continue;
 			}
 
 			/* other error, can't continue */
-			goto err_out;
+			return ret;
 		}
 	}
 
 	return 0;
-
-err_out:
-	of_node_put(csi_np);
-	return ret;
 }
 EXPORT_SYMBOL_GPL(imx_media_add_of_subdevs);
-- 
2.34.1


