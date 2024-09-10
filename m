Return-Path: <linux-media+bounces-18121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0286197413C
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 039D6B2864C
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068661A4F39;
	Tue, 10 Sep 2024 17:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmovN/ag"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7F51A3BB8;
	Tue, 10 Sep 2024 17:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725990865; cv=none; b=pGHOX2czx87aMBh79InOz2oQhDmHogXaBg/Cr+Gfa0DtoYwA6NJQLvseiYeq/9qPsog4RrakdnRPE8EIemKt6C34BQ7OE7YRjnVwbL3dTSyXMvFOXutcywWrIheLqvhEkrKP98ktbg4lZKEjcg9sDEoJfL1b7aw4vbq4fQ4D9S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725990865; c=relaxed/simple;
	bh=pu8CI4aObR/sIx7XLer+ZDdniuRp0/w3So7nbJrThlU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GYAbxjxg3MsiD5UTQ22PMASE0byy2WBrbf0T/kN3CDDatS3I7Zp2KDht0uRGc2bMN65AXMfqFMXS6L3WHQJvaD8jblZmO8CsxcS0JJ8sczPTWTcvjKoFOoacm8Te0Bo10CwTnb5Vc6bzqoQ8Bhj0M7pQ50HJebVatvLQXfNZmPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmovN/ag; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-371ba7e46easo902242f8f.0;
        Tue, 10 Sep 2024 10:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725990862; x=1726595662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tmgy5KAK/lbCPSPxqggEBRyXRnt1xL/QszOPz2p24Qk=;
        b=UmovN/agVot1Jn6ZrcHJiBflQIuTXsa2Y/8J1ntHGz0zRugdkqoT1wpRx4Nee6rmJ/
         ocM7AxtRp6xU9gAiuH/qQ2uD0IYB2W2/X3OuDiuKYTrqHjdnejeqh9aIFXfQzKpSdhhT
         GIzaI19ULewJs2AdzkmvMOPftR5xRCiicBq7QdHKZEdr6ZIonXJQfjndgGBg9QqVlSwj
         cdGLxH1IuEm15Vzoi9e1H9gRekc90NRM6TvQrHNVGKwP6B9QU6nJgB8bBt12ePpxSvWU
         yDJCbFDDsi4V0TNLEf2ho6Ei7WHYJhpjJKW8woXVhhahtcmI07JlYECEjS2ufph0HeQr
         Er/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725990862; x=1726595662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tmgy5KAK/lbCPSPxqggEBRyXRnt1xL/QszOPz2p24Qk=;
        b=kYndnnFzROzvh0C6dyd9AVKpGdo/QDkR0ReOVdIK+GGKxqJUw+jNvN/rOLR7s2I84b
         LJVgsPgIZkewMSXj8OPffjEX9dpxozElokThNtsYEOrcF7m9JLv9upkLXbHZauL11IOS
         h8rnGj4bzcoYP+tqYuyfpw2+595AY5MVnphaWhxilzX0Q6MyifWy3FT0l24m+GnJucLV
         yout2h1Pvo8E4bx2r+zUbqHIWp02V1mP8tZs56eKrGCf6YbDMqDX5DEURBxX6H78i61I
         S7gi2SEHNUXOj5ylXGvHXrDOWbgHD5YHx8mDYqNnHgFvn+vHNMj50rr1en23qMY5TJpX
         N8mA==
X-Forwarded-Encrypted: i=1; AJvYcCUpkuhsfusStcuf9vj5a3/j6YeLR8p5IpS1X9TKhG5U5x6J3RQDJyf5VfWKHjpF5o8/4cCn6Vaj0cRVT8E=@vger.kernel.org, AJvYcCVydeVbHTRP7WnNJUq3SoNs4mW3UdHrQWJnvqFbimz142GySjmyGL3ze668jn5SbLcJ1Y6HAkC70oR/dyDXuLWq7a4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBm6PsbtYkxb89c/waPMFh52hh438P1Xu8liYRUyspao3UF6jP
	bzDjoqwygihRn3phjkf+Ef9GgaiK2gF2xIGacNpcJ1ddiLk/DDgD
X-Google-Smtp-Source: AGHT+IFe6jWAikngv0108Oqsd3njrDUvEmlfPZbWaxeswZ1jTUcCzzgoWLiltUBKjbHatcbXQKvnfw==
X-Received: by 2002:a5d:668e:0:b0:367:980a:6af with SMTP id ffacd0b85a97d-378b080e293mr266636f8f.59.1725990862150;
        Tue, 10 Sep 2024 10:54:22 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c40sm9516562f8f.51.2024.09.10.10.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:54:21 -0700 (PDT)
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
Subject: [PATCH v2 03/16] media: platform: rzg2l-cru: rzg2l-csi2: Mark sink and source pad with MUST_CONNECT flag
Date: Tue, 10 Sep 2024 18:53:44 +0100
Message-Id: <20240910175357.229075-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Mark the sink and source pad with the MEDIA_PAD_FL_MUST_CONNECT flag to
ensure pipeline validation fails if it is not connected.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index c7fdee347ac8..2f4c87ede8bf 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -795,13 +795,15 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	csi2->subdev.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	csi2->subdev.entity.ops = &rzg2l_csi2_entity_ops;
 
-	csi2->pads[RZG2L_CSI2_SINK].flags = MEDIA_PAD_FL_SINK;
+	csi2->pads[RZG2L_CSI2_SINK].flags = MEDIA_PAD_FL_SINK |
+					    MEDIA_PAD_FL_MUST_CONNECT;
 	/*
 	 * TODO: RZ/G2L CSI2 supports 4 virtual channels, as virtual
 	 * channels should be implemented by streams API which is under
 	 * development lets hardcode to VC0 for now.
 	 */
-	csi2->pads[RZG2L_CSI2_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	csi2->pads[RZG2L_CSI2_SOURCE].flags = MEDIA_PAD_FL_SOURCE |
+					      MEDIA_PAD_FL_MUST_CONNECT;
 	ret = media_entity_pads_init(&csi2->subdev.entity, 2, csi2->pads);
 	if (ret)
 		goto error_pm;
-- 
2.34.1


