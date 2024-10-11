Return-Path: <linux-media+bounces-19449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC4999AA0F
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72F42286A4A
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CF81C243C;
	Fri, 11 Oct 2024 17:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwS2LIr9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CE01BE854;
	Fri, 11 Oct 2024 17:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667863; cv=none; b=usbYYj51ggBy0yz0+p8SZITjsyNG0Rlq/X/889Nh2nh02fkVKPybXz0D9yI8gc2SaTq0svX4O8SVW8eLPH/dtw7+7oFsTknOAn0sylHZLGiF61IPiHEbZE71njsRFYUbl5JfC9xj3/zNcm+l6+EuDZ/VSceczIl1yc/IH21Pr5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667863; c=relaxed/simple;
	bh=i1qXdEBpnGriWoad2OUw0LjWiot65g8XR1zyIQJI1lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S2ckeRwaOG9Rksitsk0fGAxd9si0Mixeil2uENXwJ8hIyt4spUZrkpwWss6at64ws3USRJI3PaGifWjj9Hs+0kuFHneWcRqL5G+R0dxtxT8WELJpKQVqDj4O8+i37CUDW4Js/gLXt27bhzA3AOFmSxj5lWZxUkuUebcTB9P+R9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwS2LIr9; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d49a7207cso1282800f8f.0;
        Fri, 11 Oct 2024 10:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667860; x=1729272660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6hiBvRbwfsdlAJRIKTRoCgEM0lXiJPtAQiM4M7Yq7o=;
        b=HwS2LIr90E+UiHrdo2OnjCBH6e8ZrGgXfF5oMthORcLozAIP6WPYtKNxahes5Wy9Sa
         M2cL8zkenpWComRDN8KuAVotUBlbQdAeXfcGCKUwVQ/Rw9qnsYlhPwVm0aQF5lb2XvRI
         NNtm4pIOX0EO4+N9igmoYlRHXJXCaBEexE63XociHXRMvKMhy1Z9YQ9S/Rz2COW///0y
         PV38b2qs1SvfqHas2byRrhq3a8zcrJT94ykpsHDdaO9zLeRUQjqboZXKNRNU1qrMw3Ct
         RscgqwGuaG9tBuYEAkdbIPKbIG69XZfkLAAuPb0Y2Cyc/Le2ZBSyb6HeF7SYyzQ4TibI
         /LNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667860; x=1729272660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6hiBvRbwfsdlAJRIKTRoCgEM0lXiJPtAQiM4M7Yq7o=;
        b=RYMHYRTcga84FeUZ5Lni0Fwy2tYFun6kOUeXG1vMTh87d20BGGqnQ7lR4+mqdi1xDy
         9r2mYBXPiYtXbmRh+9GJBNStOwqU8T93WHoHmIQ2S1pYeS2p/tZ2yo7LDmJrqD1RsrES
         dB6U1zOrZYrdf175M1SSy5s5CcR7+LBcpAN6RtS7JIc6WsyoGjzyWoXq7kGi6CS+u74K
         MaHNJ/hRw1Ouk9WlOnLTYmu949jiVpkNgeptMxE1vFmAfSo42bBNRrW/FaKp1t1SfTFX
         tuChD3GfjBr5KqaNN295Pl1LJZvljOTLS6O+J9AXpRCpiFL/c5iqDUu/WcLikdS0w1Vn
         Rqqg==
X-Forwarded-Encrypted: i=1; AJvYcCXo3ITPd9pmjLjAMHNMWS/+0yqi5/kkJp4/kKM/8rMPtZjDMKWJDFUDAym2a4ZEc6KRJS5Ez/Nc85tVTEg=@vger.kernel.org, AJvYcCXqBmE0YL9a6sG8GyYYxXS40vN1uAHpEZKVUTY9MTjDlKYG+ECAq2wQVWGUd4KDiYaoV7jM6AXsXCHV3frj9ljvvug=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXFqn6t3M/TSiMy8mCJp3AGC6q6JHQPyQh1HxG15QSAdKn9/S5
	XLbbRzEwNxColsHdqF1dEP8s2fsdj3IQTobe1SQ9JG06orlcb5cr
X-Google-Smtp-Source: AGHT+IG7DMlRr4HXxIAmYsODq0xBplLBz0wZzKkHB5ar9rFOkF6mfRn8XEwFZAXQ/v4cE69i2LMfQQ==
X-Received: by 2002:a5d:638c:0:b0:37d:5103:8894 with SMTP id ffacd0b85a97d-37d5ffb99d4mr271486f8f.42.1728667859644;
        Fri, 11 Oct 2024 10:30:59 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:30:59 -0700 (PDT)
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
Subject: [PATCH v5 01/22] media: rzg2l-cru: Use RZG2L_CRU_IP_SINK/SOURCE enum entries
Date: Fri, 11 Oct 2024 18:30:31 +0100
Message-ID: <20241011173052.1088341-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


