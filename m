Return-Path: <linux-media+bounces-31561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF9EAA6EAC
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 12:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E35253A9E89
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 10:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2EE22A4F8;
	Fri,  2 May 2025 10:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lILZ+Ba4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8279021518F
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 10:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180058; cv=none; b=ShKJXeh/j/SnPpCFCipLlHmW6AAB/mtz2dAap3gXS+1+wkeJnOIr08k18Levp5irZcdT0Yi4TVI9iqmJiIjyXVCxU9DPmh5KPKZwEIzwNrifjKvRR5yyHWuZuOJGLz6Ozg7YnDksr+gUBXtkEmbbY+Kdx4arSq3Rzs9aDyxh0kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180058; c=relaxed/simple;
	bh=vCWwdAowEJBs6cvWQ7lIUrdUovkUmMtp1i6POol9XM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YyAzkntVVrOjm/6++vS1fvPWJ/F5ZRL5msRp07Euy+qewC3cQ0peYS0GgRkwG6J3x7VuZMot5q1T+8iC/GZbhomCzWlSqMc4DZkziiIRvSYYtY54ZGKjup2spo9kdtRVTRNjAli2yQdw2wlp9LUt9IVXPKzcLpEZWfhvJyNteKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lILZ+Ba4; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac25520a289so310940166b.3
        for <linux-media@vger.kernel.org>; Fri, 02 May 2025 03:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180055; x=1746784855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ItVLbwXh6klaFZ4DOTZKuJkyifurR/QGuqAr/eTlGU=;
        b=lILZ+Ba4INSx0smZ4cNKOx16Jw5Um9PE2xGKNsOtjqSdd/B97FLiQZzJJcGhMKQq2V
         wrCd6Wfqj0Ekey/4awoq9yqHVi3h4A41BG1C0gchOg5irt3wrz/LoMYGIk07FI8ORbL5
         ZP6mmPwJLamfHRQqw9qY646pQkruAF6txP4OzgNEKdakqMpeQkKSGD5/gVtMNPSQ4J+Y
         7YN/T5dJj6SpykXZtV6ovY6sTndDDEtxdntHOj1KzLyju9BzNTTe2+czhhkV2RmfWECP
         k2nNc/MKa0IUIHa2dQf+N4FQ006+Fgz4ociY1kb+ptf2V9uIjNGSWBVP5ekMTW/JUMen
         Z2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180055; x=1746784855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ItVLbwXh6klaFZ4DOTZKuJkyifurR/QGuqAr/eTlGU=;
        b=hx40RUsXQ4bl3h3qky8bw+ZFaamcFdlF2R9LiHdh1h1As/R62Qe+Yd+IbGYY8QxKZZ
         qHbwmzX5Gd9rIIiHTa91mMMbSRSt4badvxSYO55tZQKd/TGydY/EjSqL2//eSCBC8GIB
         sHicRUkWfA/nBu8IPDWBKuKkVON5trCNXlKXrSy0S2QHCFyFLf3prSqXpAR4gKCWcx7a
         ZOaw7pvjHHUuprljrib6cN0c66sy8bhInAJJoi+l9H7oVOldrjadQGCYbWY7ej3m2P8S
         7Tdwaa4hvvTN2PizsIMKNKhcZXG4v/9BPpehpNtW3BGVkNWUCj+1RN2gvqKVjymfl0ZU
         Dk/w==
X-Forwarded-Encrypted: i=1; AJvYcCWtepkgUBYPxOovPBvasW22ncBAr6xl3a6NabjH1FrQLshPA0w0wsfwxXKKSDh2sv5P+9U+Vr94liT9eA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4rK6aUhABSwSjZGcYTVlFAj3vfdfVID/RN8v9uquK+zFE33KB
	85/nxvUJWo33U7N6VCeIlzvk6VdPjQV3cqqdnrylxLYEg7j8whHqr9od1QwnsZ0=
X-Gm-Gg: ASbGncuFG2i2odBOHEw/3pdXGPh6pq3yeVENaDD89IRrw+3BVfkyk75VGF2ivNFximr
	nuxKoF5rLKP8tXf/EKgXs967bKk/Y8jg9VJF+nG0Os8X60AG5XT9si5khJkXIuUSGbjzratV2Mt
	zepBLAmHiwqvi9m0iSRRmljKn9KuK7RJAG8p79lODRi40VA1xwZa2krVt5Ib7aBnTRrHdVsJ8re
	KKTsxfVQoLii/xlYdkvNbvgPb6kSJONFfdpDAmc3tL89dmbva/P0KcZTeuzBd7xtosJD+nXKBOp
	p32e2tkcVadKmnts5llSHlWJxKzjk1iP7G0rXRia3ucY+T4yr3lH9joNm0ouWK2b2VfE2FTq3r9
	vGihUt7fwbFH/cWyRoQ==
X-Google-Smtp-Source: AGHT+IHsIhA3Bp5ORflZ8bo2wewMeJPgYiXyKbBXizljuVxA1br3p39Mij4FHprUjRbWMN7T6ANK8g==
X-Received: by 2002:a17:907:3f0f:b0:ace:9d35:6987 with SMTP id a640c23a62f3a-ad17ad24ac3mr199033566b.3.1746180054591;
        Fri, 02 May 2025 03:00:54 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:00:53 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v8 01/14] tee: tee_device_alloc(): copy dma_mask from parent device
Date: Fri,  2 May 2025 11:59:15 +0200
Message-ID: <20250502100049.1746335-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a parent device is supplied to tee_device_alloc(), copy the dma_mask
field into the new device. This avoids future warnings when mapping a
DMA-buf for the device.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Sumit Garg <sumit.garg@kernel.org>
---
 drivers/tee/tee_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index d113679b1e2d..685afcaa3ea1 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -922,6 +922,8 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 	teedev->dev.class = &tee_class;
 	teedev->dev.release = tee_release_device;
 	teedev->dev.parent = dev;
+	if (dev)
+		teedev->dev.dma_mask = dev->dma_mask;
 
 	teedev->dev.devt = MKDEV(MAJOR(tee_devt), teedev->id);
 
-- 
2.43.0


