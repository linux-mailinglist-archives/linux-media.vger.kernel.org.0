Return-Path: <linux-media+bounces-18130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B325D97416B
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0669BB24F4C
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA201AC42D;
	Tue, 10 Sep 2024 17:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5IDUV1l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3481ABEB8;
	Tue, 10 Sep 2024 17:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725990875; cv=none; b=OXH0yXSsYqNKzr64bJ2rIiq64JIeTAJkUWp6jIkdw1ExbAnyu2vVWNoD1oUrzA9pVB9A1Dc4JC9WTt/5zuqiBLmxbcoxv/1RpSd0ud37Mz99V/a3iLc+nAqMQck7cTgEkiGyTtMYDQIvi2C/dZ6lBFhseKIsGYqOaKpPdbtH9jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725990875; c=relaxed/simple;
	bh=HgxUrMEjYJEKxGpQrDvrI+BfEBoeOYPNDE+sM5Rd/A4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IQLbNp+RdfPe8F+9OyfiFhQIJ8VZ6dM2/idl+8GL5QyBtJF3Fj6tvRLaLbcieoNCuiFQKZ3lGdqz4RfdJM1FMbkGtPTXX4KdMotAVIkswjeCTiE0D76WGS70HVg4ew3puYQCfv50x7+oLEMDt7tCGoSwjRSbD/5jQjaMyxdSHHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5IDUV1l; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cae4eb026so35006025e9.0;
        Tue, 10 Sep 2024 10:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725990873; x=1726595673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZkhRVGSlIjG6hcNnb+rRSC8GIk4MWOtSnhmErptxVA=;
        b=e5IDUV1l+WswzLmhXEfYGnMdQfbEcKDg2eyFMoXdmH7gNv+LEgnrsWLoRYfM+XxLPD
         H9F4VYOuD8wV3XjjpPMfNkTNRLGg1onrP87xLHRFEvqNPXAvinyAgQMKNhscEFmgQz37
         lTgicpyZKiUh57u7azQz4o4p4azMMpuIEccQzuCq7d8UwfFcF67ageQb1b15y+05fwf2
         1m8swC7Svq6LJZ+QAfJR/TIyOwLNWhrN3he8PumtZPVssEMNpzxQcXpSkU9TdH8tj6/R
         570bIQiK7D6kXehEZKtIiEuJP5EEbvicmWw+puM4IV5cgzMb+290w194SurGlknjYYwk
         Vv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725990873; x=1726595673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZkhRVGSlIjG6hcNnb+rRSC8GIk4MWOtSnhmErptxVA=;
        b=cnJvvuMDXkdXr4LTXAKceEBR60LEburE959RXEloYl0/m2n2SoRHxEGllHH0MV9gH/
         Zw/SMzLwcY60p25uwLqLuLOsl1RgzjiHd6dcVth/efSlSZ/DL4LVYw8w5UVuNNXzkU04
         D7bD9p0nRvKlTF1Usu16XpvhusjrJHfqTh+HqAHGb/oP+7HCYln54zR2nd25RLfOR8Yq
         ROFNN1M14L4tcDX6Tt1cg8WhWND7qL8C1DcMhIGXKpZaRI2klfXXkoHtt4VLFY9Y+6uU
         D12rHJotYOpv1DLBFG/ag+Tp8sS7ji2Nhu6kvqOTlnj+qlUlyXPz0aQEaIEv+orkcfNd
         qpRg==
X-Forwarded-Encrypted: i=1; AJvYcCVmdmooxYEeUxRw3LLJhafyIdcmYeNL7QnGrZJVfydUi79NlHJOJbFjoG9wsp6IwOTpBpmS3df+gIzAVx7GFYXiTh0=@vger.kernel.org, AJvYcCXn3yZGPsnh16izD867c6+0zL7fPsuptA8Xzx1T+xLiJq+Z89i4tfPq3MXa1UjRte4+Wh7w597fdnnOtuk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlAPJKlMB0aKqk/715GDRHrCRt2Fr4t1mqsDcsb3BSA19bdrV3
	AISbGTGZ7+41SFS8NBCIIxCgMWJMilD3D/5/8OOG0xpULkDKz7ZBLBQBcg==
X-Google-Smtp-Source: AGHT+IHne6vgu+Q48KyPbWvlLGdYKDfKDm57eEnjd/FOjqqKfHeKD7V7cnECz29kBUHUSN5CnL90Dg==
X-Received: by 2002:a05:600c:5102:b0:42c:bbd5:af60 with SMTP id 5b1f17b1804b1-42cbbd5b298mr46602565e9.24.1725990872632;
        Tue, 10 Sep 2024 10:54:32 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c40sm9516562f8f.51.2024.09.10.10.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:54:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 12/16] media: platform: rzg2l-cru: rzg2l-csi2: Remove unused datatype field from rzg2l_csi2_format
Date: Tue, 10 Sep 2024 18:53:53 +0100
Message-Id: <20240910175357.229075-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the unused `datatype` field from the `rzg2l_csi2_format` struct and
update the `rzg2l_csi2_formats[]` array to reflect the updated structure.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 26953499f305..79d99d865c1f 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -183,12 +183,11 @@ static const struct rzg2l_csi2_timings rzg2l_csi2_global_timings[] = {
 
 struct rzg2l_csi2_format {
 	u32 code;
-	unsigned int datatype;
 	unsigned int bpp;
 };
 
 static const struct rzg2l_csi2_format rzg2l_csi2_formats[] = {
-	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16 },
 };
 
 static inline struct rzg2l_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
-- 
2.34.1


