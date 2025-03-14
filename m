Return-Path: <linux-media+bounces-28239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D60D3A614E3
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E9BE881C68
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE59202F93;
	Fri, 14 Mar 2025 15:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cn4nU35C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F856202C2F;
	Fri, 14 Mar 2025 15:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966191; cv=none; b=XvgvW0EOczxAKDWp30vmW262ZrJFGzq1B0KxadTZTB6myHLqAiPucq221v0M2vUx4DktvObFwslVjPV4C0lnaNLA2a08TlMb5Z2kxz2cX0fokGQlTZkg419+6EFuzXM8imptdXY0ARAMddIVT83COewg0p6Ts6PWRu6qPMY2Axc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966191; c=relaxed/simple;
	bh=Enkgjvb71dulleutPTpVfqToJIE49OWS87dqHhrphOU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hzyr3OdeA2to3UmiP2sORlvW/a9C/wenAYMdw2TkWOoUrBFIW5ZZjP7KKMsuqBCWWHLnDPUcUP9Ix+RvQuChyGDGl0NGuw43JUbXYboogHMaDEr+SjJxqm4fGEC9lIpqY7LycmZXLEElwmknMOsoyb6MyUB1IP9fmiAeudUMsf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cn4nU35C; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bae572157so22723981fa.3;
        Fri, 14 Mar 2025 08:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741966187; x=1742570987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/YRybNQurcImF9bl649NFtx5/LNSMtjat9hHQQagrE=;
        b=cn4nU35CTwY1H6wUy1L9SdUTs+3i2dJYEm2rNXYg15vGiqnhaajXQ3G93duVcBEc42
         +StSrc4uKv/5MiGgukDODffAsKzQd1ySQSHeGuOGt4US+HTAoB5u+yO8eM0tjE2Tur5K
         kgeNeEok36fTltuBUTuWtTWNfI1gEAUeiCdYdl0NnyZDGAwT/jXdcbAjhW+Xk6In2mMJ
         Teu+umDX4ZZ5ssL+ciUOh2LHzaDAMnvYcPoBt5PruV/47MuV367JmQ+qemzWjn3A057N
         WkI2rtEn0aiKF+JWnUvI7AImhjgzgtSQ9jls5dcGsuKRRD/9jvcz3H4B1HWNiHsspOhO
         2KKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966187; x=1742570987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/YRybNQurcImF9bl649NFtx5/LNSMtjat9hHQQagrE=;
        b=RL82Sg0KA6QHeuPydmsW9IQyXoQ1Nu1IrxfVr0ihDLlrfTrfhY6fBKr93BvaoFUPaT
         hAJdeF74X3TbHxYvBb9VgzZCTFZaij3os0g7WevbU+JEPdg7Es1wuLuklJdor3j3Udcc
         z+s/u+lSarWl0bk2eEYuTaHgw1f3rJGrohR5NX39Lq4JtpCnKC9VHrJYd+nJbEh4Maw4
         7TdpC/1Msy+ac+woQmYJOPmPxYnlL9j9Jsqnd244NV4fhveIw11OEAV4bf3yTgzxfzJ0
         VLqbuqSTVHsNHrUazPvdOwQatoFevJFcUEeL5DDCJZ+YvXucW/e8GVbKk2iQLrf5eBvz
         D+5g==
X-Forwarded-Encrypted: i=1; AJvYcCVAFXv0XOOAkrfHJalZiAW3DZhHnCr1FTWdedMqWuuJdZiNoeJlw/g8k3a2r+WD+F7vkL7jLrE1vnKfU6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZnytRaIyCvLTanOqG6pGKuAUHZzBvH3eac2fuGM53TrDs8xNM
	fF7al7FeI638glPfJkGe2Mn0e1qBoYXmfbUQw6EZ5tp/nK/3MdmGG9wnZk61wZg=
X-Gm-Gg: ASbGncvPPFAvBWmcTzcOP9HROeahZTKoIBAIvqWs1D8qIwNJVxVx/mWl+KbWhAMbpIl
	9ZW0rt05ipvHk6/VvidBqL99kQwN71/QIyD2Tj7sTgGZQed6M/IMPVkPd5DjHl6/2IS0qhQzw52
	A+sbo2WsFVXsImT1xVSlpqyX+FTLnK2bIuGYdXSxjKqmDqZgyNwo4lHbR+E4TnHe5uiLbhjnMEv
	VLA4Waqy6KaSrs+zdfVNFCoFK/SNbtbXK2G+CcEsMkyzzUJrwYBFgdoSIb9SXUOxMc9u4MFgjAN
	zS8mvnoGYoz1HD8lAXYzEXJxj0xl0hjGM7Cd7MT16SO6CCgsgxb8vmSwTOG2AjpHebID
X-Google-Smtp-Source: AGHT+IEUKH6W/KBteY579of61YGH2HGMQlmSc1eAFyht4NTRNZqOG/PG4F9YtxuFHPv3gPnogxdEoQ==
X-Received: by 2002:a05:651c:1a0c:b0:30b:b78e:c449 with SMTP id 38308e7fff4ca-30c4a85c363mr11450701fa.11.1741966186911;
        Fri, 14 Mar 2025 08:29:46 -0700 (PDT)
Received: from skhimich.dev.yadro.com (avpn02.yadro.com. [89.207.88.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e99f6sm6253581fa.37.2025.03.14.08.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:29:45 -0700 (PDT)
From: Sergey Khimich <serghox@gmail.com>
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: [PATCH 02/18] media: coda: Use get_array to work use multiple reset
Date: Fri, 14 Mar 2025 18:29:23 +0300
Message-Id: <20250314152939.2759573-3-serghox@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250314152939.2759573-1-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladimir Yakovlev <vovchkir@gmail.com>

Some Coda's IP blocks may require more than one reset signal.
Than we must use get_array or bulk functions. For compatibility with old
code it's better to use devm_reset_control_array_get_optional_exclusive().

Co-developed-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/media/platform/chips-media/coda/coda-common.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index 84b9b75b382e..c39ba4fba547 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -3203,8 +3203,7 @@ static int coda_probe(struct platform_device *pdev)
 		}
 	}
 
-	dev->rstc = devm_reset_control_get_optional_exclusive(&pdev->dev,
-							      NULL);
+	dev->rstc = devm_reset_control_array_get_optional_exclusive(&pdev->dev);
 	if (IS_ERR(dev->rstc)) {
 		ret = PTR_ERR(dev->rstc);
 		dev_err(&pdev->dev, "failed get reset control: %d\n", ret);
-- 
2.30.2


