Return-Path: <linux-media+bounces-45936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 492B5C19ED5
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 12:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF3B13B1294
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 11:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5913532D0C4;
	Wed, 29 Oct 2025 11:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AyEMWVjr"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5D9314B83
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 11:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761735994; cv=none; b=HIK6DDBzRMLi3xLkmfbemQGmD8sg19pLI89vXejcqcMeLOLQAqLQro9VCyAdXO7M18nDPop1hCvpy1pSAhKGugn2wPU+pAqA9/zm3kzcxnzX1hpAUGdn29ZHW2pqJOQ0UpbBNhJ2CaJITcVdH7RSuTZNdJcjXuGo+ZKrKnZm0k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761735994; c=relaxed/simple;
	bh=jKGLCRj7hWPj6nCNCOR0lDjd3tjy9+HvWQH6dH7MB6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hvN/SE2pCwgh223rJQQOZ6+AWh0aI93OUZjucb7qe0ZX+ZCGKUG+G/okw7qjj91ks2nvL3YDuSgKHrJa+iuWXZDe2soNSVBduPAIoc2qhb5xYAhD0Nhwblt9iziD9nGVEBl3IKlUvxFWxSUAiHJl71V6QXFsBl656rQN7htpZWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AyEMWVjr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761735990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wq8ujO9Dpm/7YPTf3iw45Jy/+tYmVu6IfrY/4dh0q7w=;
	b=AyEMWVjrdCfSxya38FkRF3wz9MtgYRHON3Mqea29OB7uqMIS11VWyG+dWCcY5lwQunx7lY
	4841PKwKrT4ke21+/dPpa8jpmuU66yM2266I/v68B6pnhGjK5iNsxC4uy02N7S3ycIMusR
	9pa46AP/M80n45OfESyivwKRnpiJpNo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-uwR0Dd8qO023Mda6yKVwxg-1; Wed, 29 Oct 2025 07:06:29 -0400
X-MC-Unique: uwR0Dd8qO023Mda6yKVwxg-1
X-Mimecast-MFC-AGG-ID: uwR0Dd8qO023Mda6yKVwxg_1761735988
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4298da9fc21so2382040f8f.1
        for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 04:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761735988; x=1762340788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wq8ujO9Dpm/7YPTf3iw45Jy/+tYmVu6IfrY/4dh0q7w=;
        b=fohrm9jOGFuSjYbCWOmP7W07u/Kf01OMX8UP5ehZsg8zT/gG9yZthi9LqNpr4/p5WL
         AReNPHvIVkz/02jMskmrxl2ehZNwuaWWDFycbZAMfsUHNpdArBBzdUyaJGntvrsSnpmR
         4rZ7spJ9UgXBwuT0lCoWri//UhVtwtKZtN3C0Ky6MxIYL7c5SkbN5vFqXFZoqX+oKLf2
         nrtMMkysbe4Dzq3y3EEp/KLLpFqeXzKBrwhjeYdUX3BTnoYAnz3Xa6YRTqe9n4qgTJ5e
         6muOJYdvczViD5pW0ieQZehsIts+6afxttHkf8XriyTQBrd4yP5gfKembsrOBaHp36tz
         AVlw==
X-Forwarded-Encrypted: i=1; AJvYcCUXsQM9IOx2EcBmkEPAZBro9B4+FPY/mriMgC4/SQV8iZ8M5ZxfBZIR5UOBT9S2tJsmGMlI2ublurdpaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwflM/q4o8X6aAiO6XvDNVuFExJxBK7YKRT6W/G6+WSRpyOgkZ+
	ipvPY9LwzvXEMlFCv50+ZFxLrM4ORQ6DjD2XGJQbWzsuF34g8PmY1YXfSdDtm6ewoBWJI+cmAcG
	ruVoKdBkZ433R0sXB/AmS2WYnoirxAV/TKlhS9jlagSdV+LJlqb1X6UtNDloWW56s
X-Gm-Gg: ASbGncukFKWH56nQOFcOfhdcFKqDcGPFI4JrXW/de842REkd2vSzaK8egRsjC5L+CUY
	0HyFc5Kxn4+4m2ynX2HfTiwLfVPlFibSkKFKZbNaOPUAO1tSy/X7/BtaXTarcNFnVSDyt6faBTy
	YsI0EL3ZqPsjQkixyv1ooYI9UGcQUpI7TpF7LOSWQFKYQAWx6K8s+wFioy0IyeJijdxRt5GBbnY
	rvpxEftcA4BBHkZA4Fs0uJ+ZjVwk/0bC5Lcn8zoDiC34nDpW6dMlTTspUSTjVvx8eh4jfKRFEmJ
	9V32Kq2zpg8ZIZENhcvgrxKTWFeyPBqZ/1oho7Ti+SqKjPebwuIrNKE4sXDu//A61rkBAZ6bVE4
	A+JvzDiSKqLd3wcbek9IUE4kUGI3hF4w31QbT8A8wuILkFOGi
X-Received: by 2002:a05:6000:2882:b0:427:e1bf:13db with SMTP id ffacd0b85a97d-429aefd0840mr1957015f8f.54.1761735987809;
        Wed, 29 Oct 2025 04:06:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB8RsWZ0SjBkvUi9VbRgSefrwznyNGIlSzLxxkHxgmXUspqFq3z5NvztJjJO8HtqyDc5C8pg==
X-Received: by 2002:a05:6000:2882:b0:427:e1bf:13db with SMTP id ffacd0b85a97d-429aefd0840mr1956977f8f.54.1761735987352;
        Wed, 29 Oct 2025 04:06:27 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952ca979sm26665735f8f.14.2025.10.29.04.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:06:26 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in MEDIATEK MDP DRIVER
Date: Wed, 29 Oct 2025 12:06:23 +0100
Message-ID: <20251029110623.96661-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 169ac4bc5bc4 ("dt-bindings: media: Convert MediaTek mt8173-mdp
bindings to DT schema") renames mediatek-mdp.txt to
mediatek,mt8173-mdp.yaml as part of this dt-binding conversion, but misses
to adjust the file entry in MEDIATEK MDP DRIVER.

Adjust the file entry after the conversion.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e428ec79dd24..c094b2fef0fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15881,7 +15881,7 @@ M:	Minghsiu Tsai <minghsiu.tsai@mediatek.com>
 M:	Houlong Wei <houlong.wei@mediatek.com>
 M:	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
 S:	Supported
-F:	Documentation/devicetree/bindings/media/mediatek-mdp.txt
+F:	Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
 F:	drivers/media/platform/mediatek/mdp/
 F:	drivers/media/platform/mediatek/vpu/
 
-- 
2.51.0


