Return-Path: <linux-media+bounces-20194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DABB9AE40D
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 13:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B332928364D
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 11:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0C81CFED4;
	Thu, 24 Oct 2024 11:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrEv31Cm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBED96CDBA;
	Thu, 24 Oct 2024 11:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769928; cv=none; b=QCOPbt0viw3805lJ17N+xg7O8SEeWaHXaTColLjETYCwhr+OgWJShig8hoH+x5/YClamQyfWGUbgxx8AI+DSDLg2ZvxB/bm2b0tAguCSri+uIBTPbdlqxee8CdjhfPhV0ESM85mI+UxzefBPOQiFN8VOPKWOYrpkMXALZTRBRB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769928; c=relaxed/simple;
	bh=rRS32HToyRFAbuYQM/vXUxGel5u6yCA7NC512Qbp3mI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mXxPtsL8MNmvklVFQ3oAWr7jkhcs6tYB1t3WNqxcOs1gFi24qdExd2Argxz63qgc9ebl9oKvTBpRh32EK2PD9de5VSk2qDGuD6zFMZdHKb9giuRpUDjiQAH52O79KFGdGlyoZCBZsyZgnQ0XSQxMwyKq1l7ltpPB1AcTm6kY1TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrEv31Cm; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71e6cec7227so623208b3a.0;
        Thu, 24 Oct 2024 04:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729769926; x=1730374726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYA6MwsxWjcmrD99UvE66aFNc4oikmDVt3WjcSBcC5c=;
        b=NrEv31Cm1dqhHIxKIHIAOfCd8leybGyUk0JQ9TyMPdg1WpGl6fPz+znxgf2qJPevz7
         r+Etk48OsbKfZEPOax4EZ39fRKMnI0Pb/aIDa0ITcLHMApZlEiHMRVpO76Mvj/gi9hDe
         T27gH7XRS/ihsRXnqGieKEGE1+Ml4QKhDBRU7wG87CYmYMrQFxsGTE/am2So7ZfZ54X/
         rdkwAbEvnelMyS+pkHBQ3nhTrLntP5horIpKd0Gg3EL1Yq8XsMTtkxgAR70EbJTzW5jL
         SFoHJ9/8nmxrNvRnOU7SaGy4JErHlsoGhBk4hh9LwXqIT7AlCz33vd9E+X2FQ40d77yt
         AJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729769926; x=1730374726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYA6MwsxWjcmrD99UvE66aFNc4oikmDVt3WjcSBcC5c=;
        b=JJz+jMzEbTaR5wDcH631OdKHjdGSBxOfNNe6mZuHPXcXlmkPtaiKQVzWJoEMco+44s
         6YbnlLzjgafZ7JXaWx4Sj55JUj8v0HU5rRqnkaMMHXaWYM01fWoJFUEH6RK+EIaudGHI
         +jX0UIhM35yUNiqKm8W3GKQIjtQRkEYNkRqerRNUaiVjfcmGjoXP+qzUBIYPKpU5kkNb
         jofHF6cECEtOuAoGgHzu91MMI76Hko+wnLAG6ad34IsSjoWLXhURRN1w1EVWPPVS3WQ2
         fO+C6CQpP4x4NE/Oo7rhChYoJaS1Bo3yiyTfj7XkJ/dWYR2PRkUflnWwlar13WfDExKQ
         j4CA==
X-Forwarded-Encrypted: i=1; AJvYcCURQoF0MW7A7c+L154gPrJSWIJ0DWHXYtXbH7fOGwwzCqRX8HFNuAgQ7qRBubttEg/hCI4vy5ZdI3Ei@vger.kernel.org, AJvYcCVjvJwrnaUlBIrFV5HzOnCVzrCterMu6S3qOsYdxAxmin9sHexQjlaIdKc1rTLEfQRUTb2PUshZJUPZpP8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq6DFKlLUJNdwGrUNO2dCTXvQehXT9XE9SXgx5GG02TeRxLCyv
	kLuysMIUOZFiwucJQN7jiJv6JJVew9ZiyBeFH+0Cc6qVcSQagXyG
X-Google-Smtp-Source: AGHT+IG/2FgtWjx3qeOywMDdzdESnKsFTTYJLhclmPbET5MpWNBPtO3icarH1Lnvbag7LFcZj3uzEg==
X-Received: by 2002:a05:6a00:b50:b0:70b:176e:b3bc with SMTP id d2e1a72fcca58-72045f8a518mr2099304b3a.28.1729769925883;
        Thu, 24 Oct 2024 04:38:45 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:248:317f:2ba9:e66c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13d765csm7798029b3a.115.2024.10.24.04.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 04:38:45 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: hverkuil-cisco@xs4all.nl
Cc: lars@metafoo.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	francesco.dolcini@toradex.com,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] media: adv7180: Also check for "adi,force-bt656-4"
Date: Thu, 24 Oct 2024 08:37:52 -0300
Message-Id: <20241024113753.1353023-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024113753.1353023-1-festevam@gmail.com>
References: <20241024113753.1353023-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

According to adv7180.yaml, the correct property name is
"adi,force-bt656-4".

Expand the check to also test against the "adi,force-bt656-4" compatible
string.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v1:
- Collected Krzysztof' Reviewed-by tag.

 drivers/media/i2c/adv7180.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 819ff9f7c90f..ff7dfa0278a7 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -1440,7 +1440,8 @@ static int adv7180_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	if (of_property_read_bool(np, "adv,force-bt656-4"))
+	if (of_property_read_bool(np, "adv,force-bt656-4") ||
+	    of_property_read_bool(np, "adi,force-bt656-4"))
 		state->force_bt656_4 = true;
 
 	if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
-- 
2.34.1


