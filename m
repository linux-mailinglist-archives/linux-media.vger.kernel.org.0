Return-Path: <linux-media+bounces-19862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F88D9A3FCE
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E1B01C231ED
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1BF1DE88F;
	Fri, 18 Oct 2024 13:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHM+w2pT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C8120E335;
	Fri, 18 Oct 2024 13:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258499; cv=none; b=aLd3E95yoWDsck4rrY/STKo8ex7IDMeek7SRf5NSaEDaD4Xn6y/dUVSkHOFClYyMTcvb+b/pxEGMQ3WWRZDkUxE3FbcFnO+YQ3euFMmSLbzgWqhn5dbehuofrRk4R+vLACmYQ881PXKKN3KIk9F/pxe5tC57NTBraV2SK4M3t+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258499; c=relaxed/simple;
	bh=i1qXdEBpnGriWoad2OUw0LjWiot65g8XR1zyIQJI1lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RiKlOJiXsyyTTzLDhMjEOLUIUyGiDlm4Fqc+SUT4sEIXOGWOkfXtQmoA8aVlY8jNc+fu6/2+J2RHP2cievBtx3+kal0L5AneZ3wgfd5y5xlaqJylob2YKv/MsSkAjb8Sz0/R0WSKV5ycr3+5YXYm1q6cFCbVbW/us+4DoJZX4M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHM+w2pT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4305413aec9so22375465e9.2;
        Fri, 18 Oct 2024 06:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258495; x=1729863295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6hiBvRbwfsdlAJRIKTRoCgEM0lXiJPtAQiM4M7Yq7o=;
        b=jHM+w2pT+6Za19QPn1VQRomlBLuUgvCWDrbRaxFF9jasjSP7N2gApuJZfv/4aD027E
         iKEahGglsLlcFUYM/Rmn+vIOpAFsHa8zRI8b1JEvgjsIBDvHSsqjUFotRI4oUTB+TBgE
         DDG4gXMw76p1k+kb3VPW+oyLdwvfNqJF+FFQR6mq2WTSSY6mZYYb05nkVCJH1E4W+5uq
         rh+eqWAibH5PqdFI3HdjvQUy6mm2rqnDQO56Tz55XcXPvhlTL2HGMPsDuPeraHViYzJp
         gpCTXVPLyIf/0WxoNayuGvRtYwIEPhxMIHvLG0tDoIQSK7gcUwfJWyUZK8CwgL6C2ZYS
         drzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258495; x=1729863295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6hiBvRbwfsdlAJRIKTRoCgEM0lXiJPtAQiM4M7Yq7o=;
        b=kIbY1HfCFCVpRl4OOd6hRg3U9y9QhetaRtUXlhhQ27aKGV8MV/qrH3vBrgs5cSZPCW
         j3bZ/o6b1N+v1KgD9aLSnisqA5czvGYY+Bk0qOcbsB5+v1mnsQVZHdR3DLq3DYTA835J
         6TtI0HMd2J5tL6pUMrG6RQBcm75NbGvplaH4E18qbuO33QvYK+DMfn+HxlcqsJWnCKKp
         i8Gx1TwBjKb3R8mpzMdBfObNOeTye0w8h9p+5ifTCJvSp2Db5y1iVrVJfB7qCfTQsiMQ
         0X/m2ea4pbo41kJImeeRJtj66I7K0Un4vtQRIRdsSPRJEitVIhyx+K8mYJkx/4bxzX2I
         IXXg==
X-Forwarded-Encrypted: i=1; AJvYcCWDasxbYbV2109iabX3QmRbd/6Je+MIT305pieqWO4d6/tTtwripq9njczNm8LslvtQ3vu7+ok9p/wKAOMOcU3EUsM=@vger.kernel.org, AJvYcCWUKZt4QBbXmeraba3G419EMUSBmY3ZIFPpHf3D5g//j4mADW8+DSMquVP1UakqButQuv/lN2gONvRw/lQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTTjsBKTDZmWiieMu7ApuG2Y36kNwQAKEaG1xXn/nnHsbMxL1g
	mNId1ZizMCJ6TNUwl6/CyaHhDsw0LAIxD5pMnQKdq2QePNj+Fp2w
X-Google-Smtp-Source: AGHT+IHjSsgEADNXaUxNCZucoVIj7XfIEjiEfu2sboM3jkNnUSOwechkc9T7VJUr6Bkvtbn/6ss5cg==
X-Received: by 2002:adf:f141:0:b0:37d:4ebe:1647 with SMTP id ffacd0b85a97d-37eb488c4d7mr1754020f8f.49.1729258495181;
        Fri, 18 Oct 2024 06:34:55 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:34:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 01/23] media: rzg2l-cru: Use RZG2L_CRU_IP_SINK/SOURCE enum entries
Date: Fri, 18 Oct 2024 14:34:24 +0100
Message-ID: <20241018133446.223516-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use enum values (`RZG2L_CRU_IP_SINK` and `RZG2L_CRU_IP_SOURCE`) instead
of hardcoded array indices.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index ac8ebae4ed07..9f0ea1de50da 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -217,8 +217,8 @@ int rzg2l_cru_ip_subdev_register(struct rzg2l_cru_dev *cru)
 	ip->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	ip->subdev.entity.ops = &rzg2l_cru_ip_entity_ops;
 
-	ip->pads[0].flags = MEDIA_PAD_FL_SINK;
-	ip->pads[1].flags = MEDIA_PAD_FL_SOURCE;
+	ip->pads[RZG2L_CRU_IP_SINK].flags = MEDIA_PAD_FL_SINK;
+	ip->pads[RZG2L_CRU_IP_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 
 	ret = media_entity_pads_init(&ip->subdev.entity, 2, ip->pads);
 	if (ret)
-- 
2.43.0


