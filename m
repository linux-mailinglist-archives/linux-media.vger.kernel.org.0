Return-Path: <linux-media+bounces-3036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B571D81F105
	for <lists+linux-media@lfdr.de>; Wed, 27 Dec 2023 18:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C4F11F2124A
	for <lists+linux-media@lfdr.de>; Wed, 27 Dec 2023 17:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551F247772;
	Wed, 27 Dec 2023 17:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W52Dm1qg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9710D46529
	for <linux-media@vger.kernel.org>; Wed, 27 Dec 2023 17:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d3aa0321b5so44105345ad.2
        for <linux-media@vger.kernel.org>; Wed, 27 Dec 2023 09:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703698828; x=1704303628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvNJhug4GM8oN3uUr85wWPaav17uENPDOjuSlTTZUGs=;
        b=W52Dm1qg5GtjlGMe4RJRknMkMLi8fnGDuhJLgCL5El8TgS8ut/EoJCV1jO+SpVmnCU
         gIo5RgEdZhLE7xJaSrN/ToAcaWGtmwMtTElUc9HxBSBNhm/cOdfGVlGch5DHeKuEfdbP
         9/pvjO+2Mkrazg5ZyhbzN30psZbEyef42h0olcfxps5pjCKNiu3oQa99VUy6JTUhADo1
         qYw8Q4yti751hoxc3oF5m7hKVcQDK7vQSmkUqwWxS4XpxUE4DfohW11YtWb7iwUP2BT5
         hfnsZ12n2dpehQm+FNGXwbytd0remICbC/SjBUgHBBZwEyUwAXgKLgS01ceeNElkWtn8
         xieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703698828; x=1704303628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvNJhug4GM8oN3uUr85wWPaav17uENPDOjuSlTTZUGs=;
        b=DWz6gKLr4uop9EK57oVLBKxbuHCqSdPGdCsShM+2Bu0Odsliwy7sxBWiQ+y5d0HRW6
         o1Yh8ZrPaJL1lJhwwWUogHXE0Kf/Yb2eUWokix0CrxVP39a7tg+yU7FUzY24TospuoVS
         2P314ps3P8tj7E5T+joB97oAtGqfnLrbDzzwU00zR9lpgUQ3Ow9F/MvD0tet1s3Ij4pT
         LY0gD2ocKR5pO7E+6RM2SapMC6uC61KrDnlKcN9VK3HnNoZfRelBy5tXkYpIctJfdIYX
         o0iVQ4m1oMsWtxlVM2qzJeEHKbJqFyi8Cycyu3ItCkPGv3rwJZl6xwtTQEHHIt2JS1l5
         FJ9Q==
X-Gm-Message-State: AOJu0YwVewbqIQxJhskghIvdV6uBB06GX7K6gnaZJiEBHXVdzJR9RQXs
	Y0uiPJeW1J5jSi+D2JOSv0CvtU7PlrwdR9kwjl2irQ==
X-Google-Smtp-Source: AGHT+IFv2sl1p1gve97lVFrCK/XsXTux44ghUPif7134R+YMyV3AGp05l5GJEcR1dFRJjyWf8EbNnw==
X-Received: by 2002:a17:90a:ff03:b0:28c:3b32:bab2 with SMTP id ce3-20020a17090aff0300b0028c3b32bab2mr2675616pjb.98.1703698828529;
        Wed, 27 Dec 2023 09:40:28 -0800 (PST)
Received: from localhost.localdomain ([2408:8207:2540:8c00:3708:559:ea20:9883])
        by smtp.gmail.com with ESMTPSA id qb4-20020a17090b280400b0028aecd6b29fsm17240262pjb.3.2023.12.27.09.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 09:40:28 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: liujianfeng1994@gmail.com
Subject: [PATCH 3/3] dt-bindings: media: rockchip-vpu: Add RK3588 compatible
Date: Thu, 28 Dec 2023 01:39:11 +0800
Message-Id: <20231227173911.3295410-4-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231227173911.3295410-1-liujianfeng1994@gmail.com>
References: <20231227173911.3295410-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds RK3588 compatible in rockchip-vpu dt-bindings.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---
 Documentation/devicetree/bindings/media/rockchip-vpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
index c57e1f488..600ad351e 100644
--- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
@@ -24,6 +24,7 @@ properties:
           - rockchip,rk3399-vpu
           - rockchip,px30-vpu
           - rockchip,rk3568-vpu
+          - rockchip,rk3588-vpu
           - rockchip,rk3588-av1-vpu
       - items:
           - const: rockchip,rk3188-vpu
--
2.34.1


