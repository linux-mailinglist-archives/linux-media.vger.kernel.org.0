Return-Path: <linux-media+bounces-11832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B939D8CDA44
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 20:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B87131C21DB3
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 18:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B4DB839FE;
	Thu, 23 May 2024 18:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSAyecPW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6703B762FF;
	Thu, 23 May 2024 18:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716490600; cv=none; b=baR1QFxnmvUtO1VDPWMQqPNacZ8gGrHx4vfm+d2gEeJW6fy1rjKye6w48wd3hgZKXtunwAKi47PE8EXwJDpEc54oGQ/PuqivRsWAWibeLpjXgW+4ITZ07a/h6fzfrval0EQ2s6W7QkXIOiHtClGaci3OUaUBh6nxlbIbWrlIaPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716490600; c=relaxed/simple;
	bh=DfEI81tt5hSW4T9IoVccMdBO99Tm+Ll4CSg/FcOzFv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJLGtVsWGLt+w50y8ga5yXzRsQcbNSUb48u4U+oAcCOWE3ErsTOH8sQEYZjFaLGRfs+Rgn6d1SEdn5JavoQD9+0Hs5vHphKJIu2iAaosfp2X1sMCL+ATWb/vnLwW5M9djDTnQ/lBUT/5j/fxKqOYWKirjiA10TF20GMkrWZzFJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSAyecPW; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-420180b58c3so60014755e9.2;
        Thu, 23 May 2024 11:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716490597; x=1717095397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47Z2/NbJ7rExO2YdLFnnIPMzP2wtlL23AUNZI3iAB8U=;
        b=YSAyecPWXAYthGYVq/q7myANwAkOu78YR3psAlgRhvLZS++gH7ypM8o7dFOReW8LQE
         bN1UsNFcsPma28Y/3AkPhbrKaGDfr3QtY1C1YsOSSI6dMqlpFnckO6KC2EXee0OEh632
         gUX9plH9Q9t8d/Itiw+Tvcu+yyuJVqZMC9raaguQc3r08Cb9soVP4NCr86DjbhSuTpK4
         n7WfyE7JnRzUDHSKqu1BRujWVClx39fsjgBMMnM+CQ0eMQwYTPPwCTK7M00gLtzfp78o
         V/NUv1FkM5JE/sXT3uq6Y/cGWmrQ1qjSoF6+SszfWcrLiinEWRHUD9eJhtHDezxOw+GS
         mljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716490597; x=1717095397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47Z2/NbJ7rExO2YdLFnnIPMzP2wtlL23AUNZI3iAB8U=;
        b=q3J473NUza8tXUX/eKh9JQm1B/wPSAFXqiKTemyfqx6HZnd06TYgsd9pTjGsYUn0w2
         IFyDkrUXEvCeuVrdeMzZNlS5jx0AqfXt/QZiSV/PmjWN0R/qgCwfjQ83TXjieHlw527D
         T7m54oTA8fzjFuJNMRm5q0UdrBVjDF5+ililkkHV4dZSdS3u/uamurX7jpn4H7PMmLNo
         UxKoJb011ALZDIc8ZeZUvIoE/nr93E0HAuvhZSxUSX8E4L6a/U2oxcRuVsW2iLekDOJD
         uLZGkUrgOZuAE1eV5uz3mQKkpPxsqbUcKX2TN3AQsyoqU3q1WVkhrzaskVIw42z2BsC4
         fMEA==
X-Forwarded-Encrypted: i=1; AJvYcCXq3cYRp0n/IGBI24Gy2y1ScFXCcFtDbF4T482Ia2676VOfzWWls2PbrBZipyq3SYG6vgc0lHI1EWY2YXkbAy96dNLXCSPBwTDaYh8eCvmA9ZBM03W5c4r0qae8iOu+hPgfCHKTwtYCiA==
X-Gm-Message-State: AOJu0YwOzOciwwmpCNj4jPJtekTn/MRcG1kdDRcrtt+BFeRbrG6s6JMf
	OXSI2tr2MEFuKB95gYopOR2K5RlB+7qQZOOyFchC1truRpek3p8=
X-Google-Smtp-Source: AGHT+IEHApteTuvE/pwSSH5Z69X7TO3ZnltVOc2+EkCRMecSx0+bwpvYeTm9DC4U98ulugpFeQ4adw==
X-Received: by 2002:a05:600c:218e:b0:41c:3e1:9db9 with SMTP id 5b1f17b1804b1-420fd354f77mr45371805e9.27.1716490596738;
        Thu, 23 May 2024 11:56:36 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:a453:b45b:e52a:2302])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3550c675581sm3965f8f.13.2024.05.23.11.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 11:56:36 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alex Bee <knaerzche@gmail.com>
Subject: [PATCH 1/3] dt-bindings: media: rockchip,vpu: Document RK3128 compatible
Date: Thu, 23 May 2024 20:56:31 +0200
Message-ID: <20240523185633.71355-2-knaerzche@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240523185633.71355-1-knaerzche@gmail.com>
References: <20240523185633.71355-1-knaerzche@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The integration for this SoC is similar to RK3066/RK3188.

Document it's compatible.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 Documentation/devicetree/bindings/media/rockchip-vpu.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
index c57e1f488895..d1b47b14ca57 100644
--- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
@@ -26,7 +26,9 @@ properties:
           - rockchip,rk3568-vpu
           - rockchip,rk3588-av1-vpu
       - items:
-          - const: rockchip,rk3188-vpu
+          - enum:
+              - rockchip,rk3128-vpu
+              - rockchip,rk3188-vpu
           - const: rockchip,rk3066-vpu
       - items:
           - const: rockchip,rk3228-vpu
-- 
2.45.0


