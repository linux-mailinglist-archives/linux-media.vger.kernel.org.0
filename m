Return-Path: <linux-media+bounces-386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9B97EC8C7
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 17:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEB9F1C20B66
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 16:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D7B2E648;
	Wed, 15 Nov 2023 16:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20230601.gappssmtp.com header.i=@ragnatech-se.20230601.gappssmtp.com header.b="ScFampvy"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DA23EA63
	for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 16:41:56 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B6FC5
	for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 08:41:54 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9e4675c7a5fso992113966b.0
        for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 08:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700066513; x=1700671313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5XNxDiyKp4W5O/tS6HH2qR36VGTSLe28AYygQ5DVa2g=;
        b=ScFampvyqMKdTpIkP99SBJJlSscRNhXcTQDUSOxfSIFeWQzX3W58gYN6dE1kXzpGy8
         JQCK3MtItbbi9Z7xb5olTc0Uxh/tcH4VbJyWsSVzHKeGB0kdqbaPgPEczq6abNrMfsfW
         F0aTOGWXqF0cngb+hX2GgMVP7bzzuZYwnl6nl4oUwkImlDRch6nFRNo96uTiwr9k8YXl
         ZZfrrnXRKaaz0ruEhOekBvEzhnMvGmwbN/N51Wc/gOrojrLCSsm92QC9ewP/5yULEsAF
         +SPIielqNtIf3+c9h+DvMit9vfsMo9W4cmKxawf2RG4IB9Mf12B4x0RY5z6u9GK9qyQM
         x+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700066513; x=1700671313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XNxDiyKp4W5O/tS6HH2qR36VGTSLe28AYygQ5DVa2g=;
        b=gQP4R9cpmOgTAKiJlx9UxG13K9d9OMK6ruEY46Wz0bYFKEeGsmoF7jWSpEHenZGuDG
         zgRuCYLikb63IRTH04WZRIYhliBzVHL8iBJVSpXHfy+AafqaPwC7WYDjtwz2LeGS1L80
         x8RcgWvAvneV3Z61JKZLXKkBv/luv+TQxpwqxvVR/fzTKlx/Qu2JTupeqhBpFKP/TDB4
         SiAIdo+djvnOBwKDSiOaJLsbmDi8EYMowOSO5rOQdtBwMrSQVWTi9MpJNB14yg3D2pDU
         3DVwM0s+oT6rShvlk9iIqEiKedFuO4eqKcQNRMIRSIqmsv1eTlbCCrGq8LEf6/LteiKQ
         r81w==
X-Gm-Message-State: AOJu0YxFNGZ2JBCrtnCvrnNMBp9/I/2wlXNU5nDMS9TYcjNoK0mOrxx2
	kQwccahOuULW277hk0eJPHk7Lg==
X-Google-Smtp-Source: AGHT+IG3jR5IuczZHrF1wkzd4fyrB79VWdV6Vvw9D4CrZC6aBvALUsFLoA3fWz134e/kITNQrHY6bA==
X-Received: by 2002:a17:907:3dac:b0:9e6:59d5:7bb2 with SMTP id he44-20020a1709073dac00b009e659d57bb2mr14900957ejc.18.1700066513210;
        Wed, 15 Nov 2023 08:41:53 -0800 (PST)
Received: from sleipner.berto.se (p4fca249c.dip0.t-ipconnect.de. [79.202.36.156])
        by smtp.googlemail.com with ESMTPSA id lx20-20020a170906af1400b009e5f5efac10sm7203451ejb.208.2023.11.15.08.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 08:41:52 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] MAINTAINERS: Add missing bindings for max96712
Date: Wed, 15 Nov 2023 17:41:27 +0100
Message-ID: <20231115164127.2790596-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the binding documentation to the entry in the MAINTAINERS file.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5c9f868e13b6..ea14bd4198a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13014,6 +13014,7 @@ MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
 M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
 F:	drivers/staging/media/max96712/max96712.c
 
 MAX9860 MONO AUDIO VOICE CODEC DRIVER
-- 
2.42.1


