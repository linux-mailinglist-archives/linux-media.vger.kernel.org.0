Return-Path: <linux-media+bounces-19865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C16C49A3FD7
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81834289865
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D4B1FF603;
	Fri, 18 Oct 2024 13:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlSm/rmb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C272F1EE03E;
	Fri, 18 Oct 2024 13:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258502; cv=none; b=Tko1dMY6FxNMs2e+UsXEc+D96h3yQMW5esavarc1c8yIHz2EJLMNs4dxJuTsXu9PjeUN95c2uB9sXEoaEvJeyvs64pWSW02lkXIjjYb69mVW3rNYq1ZLnVy+WOxf1X2bAxLfLo6MmOIWyc+qtZIOTeKcv5DFtIxvDR5OElWsJBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258502; c=relaxed/simple;
	bh=lUtC8a7sSCz47vyuJQTv4ILpvCflOBhL8IZ2N4GLEdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sitKq9cMDTrpLPKYsoYQP6DQBYSV2CQyQMXkhPyOHFXNw7Sj51gUscSaghaaNVomTUicI6NlVyqhibJWWTenhmOPmR/wMD2bw6p7ylmdeC0IBbfZldA47ejOZoXjp2MnyrcWjQeW3YQ5NaKrS2ujpl7d14knGjso8wLc0ZuK4u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mlSm/rmb; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d461162b8so1426939f8f.1;
        Fri, 18 Oct 2024 06:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258499; x=1729863299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuoSfcit6bOI6/DSccbRpehmL54/bDzKmYQIekLBIqA=;
        b=mlSm/rmbTxXLOyxp7H/Yqo0KjSgsEPL/egvRgBh0Ztx15Q022fHCPoXcjfmr9q9FEU
         4ak/N2ibpWucT9k8VD+qqhXKelkXBP14h08oeXV7oKm+LXpxlGpJ7eeOQkZF+bd3QPRY
         OUn06zjUQx3xqyBH0UGa13DLMWmQt38fBUvbvWOIB/zgV4+zg7EIVXyhpR+CLw0DULyb
         M8S1++o5jF7dx72lSYKaCrbPhp/TPRpk3xdGx/9FUa+opGukwe9nVILHVLrF5/11TCjE
         HUkZQnWJE/S2FqpcBkRhikOgcvozRP8fqpabHSWVtBPWKPPMytTbS1hM2yUSVeZlrAwC
         tsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258499; x=1729863299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuoSfcit6bOI6/DSccbRpehmL54/bDzKmYQIekLBIqA=;
        b=KAaYap0FjIzdl2ZSSVmgncGWID1vJ+M8Md6ROsUm95cO6wYv8UJp/aAVOPaJfXTsry
         uWxBxM77ht98L8fypQyfJqfdJg8MuqnASjfnmrPWoKZps3SgKch0nCCmrr3aLnMiVtwD
         gAmGNhfTpZD3+n2EU72DPmUhZy9sWXpOc0Jk1uhxdeuRN6E6NXACCCEFcIKzxpoQh76s
         idiPif8Alo6bNQbeOgtM1drTLAK/LgjdV0f37l002NTY++0Ml+VrHf53mIbdEf5+VgVp
         T3oPNlhw4+BXcPVjcDCInPdras6DFj7Jay+EB+dFcWcC6crqM86QrqOPw4Fd2XbgHzoH
         HusA==
X-Forwarded-Encrypted: i=1; AJvYcCVDRrzXBpSjHQ4WIIv5UOGsDwD6pbUn/imjT+THttV9e/7IeH6EVR5WAvnkFX6BaRpIJLaL8PnbnwjAKlY=@vger.kernel.org, AJvYcCVRkRXv+yo9vmGkAxr+ky5tLyn44+j01mAmSryso0jCwsoZefvPbwKBh6bHB59eCXyZ7CsGTxuoKbzRxzzC1Iws6xk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzLMs4hJqXRDFNRleGnVM42lA4MRQZKMlGuAd28YwpDXdxMeXc
	wlVgTvrJfjc4VhMDo+ZqpHVGeucHNyJgWORkG7uA6k6+Nm8kY2tj
X-Google-Smtp-Source: AGHT+IHiVmg+tWkHufGFE+lP4QBsah9YFdMN6VDB2TkrNb5bR76XT+1CO802BJo+eDoYIsXgqx/8MQ==
X-Received: by 2002:adf:ed4f:0:b0:37d:32ba:ee76 with SMTP id ffacd0b85a97d-37eab72a15amr1407390f8f.57.1729258498675;
        Fri, 18 Oct 2024 06:34:58 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:34:57 -0700 (PDT)
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
Subject: [PATCH v6 04/23] media: rzg2l-cru: csi2: Use ARRAY_SIZE() in media_entity_pads_init()
Date: Fri, 18 Oct 2024 14:34:27 +0100
Message-ID: <20241018133446.223516-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The media_entity_pads_init() function was previously hardcoded to use a
magic number for the number of pads. Replace the magic number with the
ARRAY_SIZE() macro to determine the number of pads dynamically.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index b6a118ce9fcb..5d1050e685c6 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -804,7 +804,8 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	 */
 	csi2->pads[RZG2L_CSI2_SOURCE].flags = MEDIA_PAD_FL_SOURCE |
 					      MEDIA_PAD_FL_MUST_CONNECT;
-	ret = media_entity_pads_init(&csi2->subdev.entity, 2, csi2->pads);
+	ret = media_entity_pads_init(&csi2->subdev.entity, ARRAY_SIZE(csi2->pads),
+				     csi2->pads);
 	if (ret)
 		goto error_pm;
 
-- 
2.43.0


