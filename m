Return-Path: <linux-media+bounces-38886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F46B1AD99
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 07:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F06BE16AB3A
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 05:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75CE21A445;
	Tue,  5 Aug 2025 05:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNDoanqp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE738218AAF;
	Tue,  5 Aug 2025 05:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754372416; cv=none; b=V/D9bO/P+/7c+cHmDcngFbH0+5jH2JrETaR0a2f9L/zQPdEMEJX2XHwzpC+5e5nF+CGIWwtvFQqRu+EqVi4LLEvIwAnLuE9FwxvaZeVpjWTj0zm/GTt8MVKO7e6u5qZrTZR6Cv6M52ELqOZZ4BEJw4WKGMOR8VsYxOo2zaur1Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754372416; c=relaxed/simple;
	bh=2tHlGOiuOKEuGdflTH47oWWV7VJkpH9BX6ECbF3fnFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=spkNdfUKZfmx12b2V3GJgf6621m4+3zjz28vbn6vfGKT5u4vIv6uvbNN0ChqgmsTEEkgxMpO1Pxx0/fYl/r2TcYMfAeOF0W+DeJ9QczdKDqcpcWVHu/cao2V094u9Dvj44ojLuaCYbUTNHjwNEGAzltCnxNERVG6DEta1grR74s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNDoanqp; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76bdc73f363so3268944b3a.3;
        Mon, 04 Aug 2025 22:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754372414; x=1754977214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tyxnWiAFtFlSMrrHDitQKy1NpdPNb0xJusSz78MXaA=;
        b=BNDoanqpglg1Cay/xtm67o/0LEVpgxIdYaXtsx0a4wfIVPdXe1fb81uziA4Hbfugh4
         naooaUYo0BOVgTiGJD/7Cjexh9uz/UNlBxKx58/hLWR7b66PXHZInGej0sSlt5yTme8D
         QIc0gLilD3e6oes6qN4I+EHglGpeBJuiXs0EO6PBEaNHJKwC+XOoo7x4jCmEKdEZOc5h
         Y7QnXOpOueLrhIMf9nKZbXr11y070qx34HGonN60/i2BhzPxFGV59Ti2A4bygbBbHgoE
         laDB3FSyVyBucDdw0uRUtue2lLBf1CIAlxkKFsuC6CHiuNYf55x32DuFe1SEXwbZhuxW
         HFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754372414; x=1754977214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tyxnWiAFtFlSMrrHDitQKy1NpdPNb0xJusSz78MXaA=;
        b=mXLXL4DQG8MxL58jW4N8yo0PvQ99gWbTK/jJxo9pUtXFAjA56l2HqeOoLK34tsWctQ
         n0vhDnJ/eBsLBQMlBVcVld0+QyBNJIKdBCeLj0sVHSUBB4Vwvg/9OQDAKq/bEdXPCkDT
         WemF6/+GUNTXxfoW0gM7lo/MxpH71j/Gj05yZPvYjB6XNEQVtUB1aN2kuu0TXYoCnPSV
         3Bzk9SU7dkcF4Bhccil5gnc0ed8DcAnqOpP2C4n8KsFaFkTVObqnxQdVGte0i2GENzgj
         gT5ZxVAiZ9vxFy2l133m63ScuuxxEL7yi7Lt8IQMbNFsaXgzTY5W4pQNncDhRFC8Ehub
         kxYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlDRgLjW1TbXB2F7dZbZCtO6/uetItl9AQ17TCEcTSApfF8rknFi/6ABHh4btPdPkiCi5hNYZGlOIpDVE=@vger.kernel.org, AJvYcCWb7NTqGPVED0MpPmBvH41vMPtEgGiuVBunSEBECqQ35MMazPfS2hhTyw9gDhzvesJwZFTVjBpdDTUHLiY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZrF9P0zuC9HAFxH3Kxp2zPudPe959SxfjRuzxbjHvL3dSaa5V
	zRB362wdK6AqHJU7MRVAyPRpt4vAnUT7ZvbFRKC09so1xqG0M4Mqvx17
X-Gm-Gg: ASbGncsSq/5NpoACeMLPNatIR76oXDiFFbH2ex1R9ooQN4+gnXn7sQzEIBkpIOjgbAR
	uRgaHOauzD0VcQjGvlIFcz0VqISl+cN8kMHL0ZaVDIKQSnuzjM+Q5r5XNuN8xqwVZ0/Y5iixBZg
	WOo1u4NJAgPcSXW1ON1bNTNIrxXzNArYA4Gv+hKhrZx9zyHPk1iEOgfb+uIcZncTknpZOJDQoL7
	i9qrnh0Sh4l01ZxBYDPBy29fxDYJFtBGu/I4IybX/aJkHf6smg4ix/oK5tA+npUdMruIN/ObV3p
	RMbuuZ5Usei3Ub1GHHIlsig6hW2tfU/iKlOBqRCPLG3fqQAP2LcPbOHBo2g7I2ZZx4jHqXt8Lpz
	b2d5BSXJmP4wDVBRYjWwnjhCsl1UwdS94xhtSBW+64Dh7kYZIfwk=
X-Google-Smtp-Source: AGHT+IGePr5uTZDmO+y+EyakLuwaq478+JYPVKTZVU6MwgVtxFRA+ioMxYajV/fCZcclCbOjTcZI7Q==
X-Received: by 2002:a05:6a00:114a:b0:76b:cadf:5dc8 with SMTP id d2e1a72fcca58-76bec343109mr16169245b3a.9.1754372413653;
        Mon, 04 Aug 2025 22:40:13 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce89125sm11990006b3a.33.2025.08.04.22.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 22:40:13 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Tue, 05 Aug 2025 13:40:05 +0800
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add Mayqueen name
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250805-drm-v4-1-94eaec01598d@gmail.com>
References: <20250805-drm-v4-0-94eaec01598d@gmail.com>
In-Reply-To: <20250805-drm-v4-0-94eaec01598d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>, LiangCheng Wang <zaq14760@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754372406; l=1022;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=yJeEvLDqfY9RmjyBxNg8z+4hZIvaGh+lh39+Eku8oE0=;
 b=TpVOKWNQjqEOKfBGb63DVFiEfig4TuIFoV/0j6X+QfaE01jUZRXV0D29QzF7cjWg1udZ9U3B0
 6ileka/I/ofAfz/PV9pwP1Bp8eNGxiUm6VF6j6KrdsojIRQqUSKT1gu
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=

From: Wig Cheng <onlywig@gmail.com>

Mayqueen is a Taiwan-based company primarily focused on the development
of arm64 development boards and e-paper displays.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 77160cd47f54079a39f35b570d69f7c4c2274724..a495dab4e87f65a4a44cefe1e44c8f4425a89c29 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -931,6 +931,8 @@ patternProperties:
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


