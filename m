Return-Path: <linux-media+bounces-42420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F81B54B27
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 13:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A0771B24B43
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 11:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA7C303C86;
	Fri, 12 Sep 2025 11:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNZc0lIl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3641301027
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 11:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757677031; cv=none; b=nnNNEIoa5efPJcVNGkp89lYhhMvyDA5fm3dJrMGVr96zpwOJlwSNndERMgdTWxGHZHZxs1rQeMWKk7W+09IVUCTznGQKka45OlzKJVE5eB8qGsyv8dC+syPgdqmO5osAmyKejZJMJHRqVR545aJE9PJLhp9AKXGZ1F0QrvYHoE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757677031; c=relaxed/simple;
	bh=RPBQwPNuYyYtQUtZ2JZFYIKb6yx1lRSpbGv4ihtUNa0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t1YvxzxhLIWEiW0ghTX+wO7kdlysRZZyBsGUdtjbzGeEruVAwvmLSCfBob42c+N/mblWXv3R0JErjy0jvogAhi+dPSvi4OYW5zYTsfMLEdjA1AagOLR6iv4tXWb6W1Dkq6Sw0wU+gQbeaOjz06f2Dv904bGg1a5XW2Wf7icFfDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNZc0lIl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45cb659e858so13174495e9.2
        for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 04:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757677028; x=1758281828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMQMHx+8Y9PVtHu5Fhv1ceibqlTqO0/BLpLsbyBHbrQ=;
        b=dNZc0lIllrgzrl/koJZ3gnUYm4WNFWsApiuxLYYfV2NDLCdbK4DsMepr8hGsiTwCBn
         oAaGHw6qUg0gG/KI85tu9BoyAd/ZstP7uD8zmbhbRdDk3fVNoOxmFTy+CYWTglRPzJnp
         YDLzGnUy11Om5BNMyhQEYshNfQRkvRvFlEexg7C+mUKFxtItgiZjNQKHLZMlMv6eLXup
         wmbAlHrFIz02MmTzTnqDKVJkh8BleAuf8zc26NWGn7wPBRjfzySsY+AyJMVqciaKgjQ+
         /amRt8ZupW8p5/W+zRmF8oBcLKRF1+MhBxUOHc37rnJ8esqERnhST70d8/6v8r+s+VYp
         OcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757677028; x=1758281828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMQMHx+8Y9PVtHu5Fhv1ceibqlTqO0/BLpLsbyBHbrQ=;
        b=QohbqXiRI6kpksXP07xMmwrCx+h3s22Tr4VqEpIFo2Fu+qc7ik9J02yHVikUxl5s6K
         tpLvEURT5CL6LUMunex+hiQ/+ZMzLXXokv7PL1W1VAtRALfbY9i3VsLc3cpf5M/4jF22
         g1i2gD6wQbLp95wQ34CzZaM7d0rAVpbc//W/u5scOViqqLydYKJbb1VU39d2wfqQV4fP
         BARUN9buosFC6ePMKrG3o2XW0UNI6jgHpGckk9XYTzjkPcj1lOCk/fPnmtyfvPIBpUGL
         f/kJbUG3/xmQ+oNJj/ducV3DZaiRuzOMsNjyt9aKBEnCSTrrQkw5C23v4TCFm7DorAWV
         4XZA==
X-Forwarded-Encrypted: i=1; AJvYcCWNjlegeodHHNCpsbpvYfxU+WnpformD9jQrTWV4dfOpkhhqkTXPfEmwcTs0qkefFp1IJopWRvoyDDqlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFA3XBi73tzPy/VnkeI+p9ZdHdct1t4ZfBjpAg0jy8IEG9JKf4
	9tc7W4IelvkQF8UfrJ5Y4GondpsusXyIG+us0mev3aCVkpmFdGim83Kj
X-Gm-Gg: ASbGncttmny5WL9rlm6Zc1WyC17eZQc9C/FQoMuymez27Iv1pOhqssk711Yj6m/kDrF
	nyZe/BScqPXQNXC3l6Bv6G7OSRkn0QL/NmTZpUKOJxYab3kIGxdeIVZernYHOPa7hFZSM6ze56j
	vNZyg6my3+NmXEvyQ6IqSixw67ol61lFwh8SIEe81yAoL/ERVNax/lOaC7AJfU2xvFLjOAcTJE3
	Xs2dGTbn0vWeMh78pU00NcBdEMRoeIfwV/zl60TqQbfTdBrV5t3d9w/VwJSIpOsYJ2PnZVkBlrp
	a4jzcbATuXjbW3/SMl7oCRCQ/35lePXWEbStV8XM5flWFPO80fQ36Vns0+wFd+XGu8uQ5ipaATV
	H7S+jb7GtBb4qeqGYDSU7t6s=
X-Google-Smtp-Source: AGHT+IGejfUQRDplMR239pOYC0dAntQXwDDPfhYxh2LOkKsXpFqY6rB9nrWYDd+W28ipozk9KPoPJw==
X-Received: by 2002:a05:600c:4e4b:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-45f211d5753mr25454785e9.13.1757677027899;
        Fri, 12 Sep 2025 04:37:07 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e037c3ce5sm59287545e9.16.2025.09.12.04.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:37:07 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Fri, 12 Sep 2025 13:36:12 +0200
Subject: [PATCH v2 5/5] dt-bindings: clock: st: flexgen: remove deprecated
 compatibles
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-master-v2-5-2c0b1b891c20@gmail.com>
References: <20250912-master-v2-0-2c0b1b891c20@gmail.com>
In-Reply-To: <20250912-master-v2-0-2c0b1b891c20@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=RPBQwPNuYyYtQUtZ2JZFYIKb6yx1lRSpbGv4ihtUNa0=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBoxAXb6s+ndbTRQTQkT6UJVWKMYLPxxzYY/K27j
 OhxLLATMzKJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaMQF2wAKCRDnIYpo1BLC
 tTAbEACsW8Im2GJnyd/A9nW2OVWa8v21L3beKtkkrcLZsvVewjBorACl5+Q1BKgUbkdPtOmAZX0
 +vaB0XO1cTHWSXY/qBF0B/Ld1sJhebFPhX5RweGvcmpuW/vStC9N/KRFejRzHwU10Cfaj7AXcrR
 F2sdu1Lv1e3VC6Zxp1sct77rAsQQKhGJyUUn+n8D2auTQoy05RB2Kv8qC2FnsI98XzI9V7a8cgX
 UfHpmJ4U0czwQnaASE86LGQKYYEb5Ue38wlq9gUXFwn24q6UbSfFUq7Xm3E/AUtMD4xHtkMcjt0
 uJbMojvibnzFYpmAz7ZB25Giqkp06Js1WW9AP0RNEH1lKvNBrCUymMEihmPEKYOJGfIHc2KxCNN
 2rZ5bUcG80xGYLIUuWZUotY/ocEbPGjH/bDI1h73K1QF9JxnW5oDGCNo4NSuUdP4lgoTYpXjzLo
 SpDh88lX76avVtTC4w9iMnlN+XcDWFqQGjYc+gh7HxkKTJAA+AkHtJd7wVKX42e5KeyUo0auQCt
 VuxwNEdOyP7Ggui6l/QLl27SaiLEx/Qb+O10OAXfdEz7tQ3Tdx7fqL2umGBF6q315EnePvPfFw2
 m7YD2UwpCbvcbtuLx4qA4nrCVTFqSJnVtYZ1tt8jRkICBgyusKv71wesSyVF+cfkxZOH3gTek5I
 GvveP8+RJR+TfIg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

st/stih407-clock.dtsi file has been removed in commit 65322c1daf51
("clk: st: flexgen: remove unused compatible").  This file has three
compatibles which are now dangling.  Remove them from documentation.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 Documentation/devicetree/bindings/clock/st/st,flexgen.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/st/st,flexgen.txt b/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
index c918075405babb99a8f930f4a4430f57269417af..a9d1c19f30a3366c2ec86b6fe84e412b4b41ea56 100644
--- a/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
+++ b/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
@@ -64,12 +64,9 @@ Required properties:
   audio use case)
   "st,flexgen-video", "st,flexgen" (enable clock propagation on parent
 					and activate synchronous mode)
-  "st,flexgen-stih407-a0"
   "st,flexgen-stih410-a0"
-  "st,flexgen-stih407-c0"
   "st,flexgen-stih410-c0"
   "st,flexgen-stih418-c0"
-  "st,flexgen-stih407-d0"
   "st,flexgen-stih410-d0"
   "st,flexgen-stih407-d2"
   "st,flexgen-stih418-d2"

-- 
2.51.0


