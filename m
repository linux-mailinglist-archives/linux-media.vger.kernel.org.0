Return-Path: <linux-media+bounces-37583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 451BDB034B6
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 05:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 154423B9CB0
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 03:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C5A2E3706;
	Mon, 14 Jul 2025 03:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFhfMuna"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782B242A8C;
	Mon, 14 Jul 2025 03:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752462008; cv=none; b=WbnJuCtGybPaZheDCphA1vEU7BfxVcJzzJDYmHOo55f6DjaVBWH1M5J3jDzjk1Q4T6ok20xEdyFcbDKT3Kh75glq/Nz9o1/uOznfA1MLLEJ2D+WBQ5i0dOW6DTG6FJaM+W/pUr2CLJHZhq/f4JZTl9vZqzMa7F1jTq2cweRQd1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752462008; c=relaxed/simple;
	bh=GmvU9NQ3n+xafVmKhQUmC4ekaryDnjcVV4VE5S+KF8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UnE9lNyP9HPgWTd0TDH2WNQ17qzLtprzWKbGTMSatO0loKwcRPZCrHxf7be10tTH5h7WeHG2Epb5xzuO238KRsD84rNSFMfrDs4nQebMPtjAJi9LcQg4jJQdsjlGzoT518JbDsWR1WFHFIGCwxLl8zzvjCLNYYwwn5Cbu8SJJlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFhfMuna; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-749068b9b63so2520502b3a.0;
        Sun, 13 Jul 2025 20:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752462007; x=1753066807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FidiboXZ0gzp0Kec1LGu7nNmgcY3DYoC/ILAAPmTqbA=;
        b=KFhfMunaZ4HfhPyYKL1Mn9PW+h/UUrntI53RAs4MOv9iGzYvLOkSiOfimtrprxWrHA
         XDL1em8erU51t5y5qEeUdkvFfFKHwPfBmH4K0wwMHnJARor29jtsV3NLViay0TeeeWYq
         c5jVjN8sTvRnw/kbjuAPQyoRZGUGJk60X7e9wg0olZXzcgbSnBVvMnqtDUvh+sIpj2BT
         uJupICjjGdJxcH6D1+yy4VbBz8tEjXfwMgzra+BG9Ya8TXo6V17BuDD+maGKLr+/VM+m
         yvGXnhzXHO92Wxepn6fNM9q7go/kJE6pr5yl4f/jnRL97CbL9QnEZM2xm7wRF7qs+Fze
         sMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752462007; x=1753066807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FidiboXZ0gzp0Kec1LGu7nNmgcY3DYoC/ILAAPmTqbA=;
        b=lHwA8zyYoHMFNZ9ekvFWqKEBE0e/8mWXWn6sjjv6IkZNBUqoNbZUsjO3CTZ7p9m2qk
         2TiKPM2ilfeoj4sLdJlUovM+ZvrzYKMbPShm0xWHueNJVb5jJYzVzmYGsierQExHRjGW
         uO3vHGOdHU8q4X6W+krNkof6gri40VqBFz6fRg1QWG74cOdPrLJDWzNuBNHDKjEHP5WU
         whG1NvO6kko5YX2J/wKA8L5PucQMYEPKVI88GFdeN4C95ugds+Pgj8x8yzw686tiVX3+
         tUIY3ogN8ccG7MgJHZFTNewCsRmyVrcavqkuWLI+ulJbblMba9roCy/taFbkmdmeSBCV
         eJ+g==
X-Forwarded-Encrypted: i=1; AJvYcCUBgGr5/YdDlfPA8X5dQASEcyiQSZvRxt9FdeOH/GTzmON9gNZ+mm+SKELBI0W0haRo0j1j1+HxHrQw59Y=@vger.kernel.org, AJvYcCXho6Tr96e3vLtuB2vgYi/kt7w3ggffe8HtcGzwBNNcD8sAjgrisYOdtw1+PHbC9CYapNdC1R64HVhMubY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgLcbTjajpT+Cy91k3DU3ytYpCPut9Bb9V8Qlw1ISfFo96pk6i
	bDKyV4gW0D899Nt/wgGMFpWSwEBUTaDUi3sYZ06d9YLIzGbl1AeIesw+
X-Gm-Gg: ASbGnctzjTTUVu/hyw0hKWvPOpxdFhxRMxaIPFIgm7I3Hh2RcFrrm7yH3FTMnzSE+Ot
	xdb+FpFShKt7G3yDel40U9TzE9CGVS7misZ6/FONBZUh/pxRNDv9+b+NKaF0VRYA39RyoPppj/X
	KhytL/k5vEiMg2CTsXzsc9YKEz8NZ8cKMhzek9TWu/eaAYvKs/N2V0YLgQBLg6LYG+FJJlXICcY
	i3zauNBeD+r4+mJIZP7xtKaJhLsfMNUF9BgGEhwT1qPqCyGJ7VlhNDXcStmEWMdpTF7B/ulBRck
	+8sbZ2xxRT0GWj6iULxp7v2ZWD3WUwicNj672VPSNlXGScge5blDEZRueoTYixBqxthwIH8vrGe
	ap70PfkweBQGgmqJmDPWxhU4IfxVKXDSWA2fo3dDIyUaV9oeDM10=
X-Google-Smtp-Source: AGHT+IH5caNcot5rufCM801pMKMcJNnVBxs4MQDUCmauS0GuJD8f/jmEIiUwQJLStIh8Hs9SG+uPjw==
X-Received: by 2002:a05:6a21:3995:b0:226:d295:bd6a with SMTP id adf61e73a8af0-2317ad4d434mr22221164637.0.1752462006623;
        Sun, 13 Jul 2025 20:00:06 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4af33sm9034577b3a.122.2025.07.13.20.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 20:00:06 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Mon, 14 Jul 2025 10:59:39 +0800
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Mayqueen name
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-drm-v2-1-5d1a2e12796c@gmail.com>
References: <20250714-drm-v2-0-5d1a2e12796c@gmail.com>
In-Reply-To: <20250714-drm-v2-0-5d1a2e12796c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752462000; l=911;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=7tai5uwBpFBvYaeY6h5Abr0Rx7uTXpN3nWfu/5kwtvM=;
 b=PTk6z5OttFAwlkOYLaSqtqEFMcQso17k4gOt5F0dDpANZ1EhfqHAnmQlUvSrxPf9Y+e8msXU+
 Nq3uo1ge796DnUaLs37szJr4K33FI1cYSaQrRh1Gs3ktOGLbGd6OXyD
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=

From: Wig Cheng <onlywig@gmail.com>

Mayqueen is a Taiwan-based company primarily focused on the development
of arm64 development boards and e-paper displays.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6c666c8b557c2ef385918e5e97bf9..9207c25a3490a3aa5cc9d513290e7890799f92cf 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -916,6 +916,8 @@ patternProperties:
     description: Maxim Integrated Products
   "^maxlinear,.*":
     description: MaxLinear Inc.
+  "^mayqueen,.*":
+    description: Mayqueen Technologies Ltd.
   "^mbvl,.*":
     description: Mobiveil Inc.
   "^mcube,.*":

-- 
2.34.1


