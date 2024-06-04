Return-Path: <linux-media+bounces-12539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C692C8FB920
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 18:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FDF8286919
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 16:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830AB1494CC;
	Tue,  4 Jun 2024 16:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXVvwGEk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E1433F6;
	Tue,  4 Jun 2024 16:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717518873; cv=none; b=KXh3ErTgdb1OKEOGxZrHZthZJRiEp2qP5dVQjqaK/lKrETBb8McKDuAfbMm8ObEzEXG9Tee6eR0SFjNVD/nsBa6jtM9ZqMDvAp07lmHTgpnse6pTWGKXog7DRaosAuqScoIl85CB7Ok7tINOOiOPceOEjRTOvkfJazlvI1AhO3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717518873; c=relaxed/simple;
	bh=zmPcYywpT0TiqF/rEIjNoHFtMmn6xWYn3vYuYJRLROM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NttNHA7RE5H3EHh6AAJn8Q07I2Vceb01ZWSQ9vDe3hP/luobIPe/VYz3hnEWNRr76/haIJgUJSdS0SiioVM4waZ58u7YCm5sCJ8ubEHEV2dPpngaCbJeA41QSGR5ZPBIdZS+L+1/bjhafIBDbCUpFMpHz5Vxvd9VtfvHheg6tSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXVvwGEk; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f64ecb1766so11560875ad.1;
        Tue, 04 Jun 2024 09:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717518871; x=1718123671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEkM+k4VgfiBUB1eDmq+e8NhhEFahgsAVBFkVD8WSHM=;
        b=YXVvwGEkm/1qzYDrIM4pp03g+1owSwato3ALaeyGVEetKi9dXiqJTODNsG4Y+tREdo
         orSKOvTjGtMo4I2CsPGuICWEu+GbqbPkkQKLGW9cKbVQvUUBMiRG4YmaSXdXV5dRJnTx
         2njCrGQOGlfZ/eGIWHZ3pJFTnvQ5gBFrWOIWJ54KW2Iddh0p2CuBSiDJ/tYYcZzi2hMR
         B7s+cfWCzT2Juaze1ekvtfHk9IshIHM+XAa/t2v9VpINv7oAJBjav4wt5QR5XWiJ6RiZ
         bLY07+V/ELm4UvdBUUIQZ5wHdesq5X42hClpGyIJ7W45ZIm/ZjejO+Xf96LXp8g0jqPw
         Szmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717518871; x=1718123671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEkM+k4VgfiBUB1eDmq+e8NhhEFahgsAVBFkVD8WSHM=;
        b=CcAqfYYnEoRXD+XEyikmJjCIerDJPfM+nLCaak8+B+BSgFZf/CRXTWdDXlla6ayif7
         xatelS7Mz5qOlZujrB9ifUxZ6PhOOJ5CAfS8ny3mGFfLQrJTF6xhyV3F6okTVTC5Qw9K
         fXPqUgvmESPpOd6XlmjVTqx9qaqkC3l+JH0ILRqVmMT3CkEk40U5GggONtS9sQONUNNg
         pftPaHHhGEUgGupuZRJBg3glvweiDZ6/OWdQaKGVY59gj07qzA9DBNb8YbYy4euh4Gak
         6s4A+BIlAygO72ChwWCm/uwO7exHVv3xZ/+b5X/3TAa4/kTQESStSJSyATxJYofZ8YQD
         zMWw==
X-Forwarded-Encrypted: i=1; AJvYcCUscljpf74hSnkcKcVK3qC7DDOyhxWI8R/izY0Xwxp7XRNPqbzMnzu+m2C8f/vpN1BbCnP80ezyV25AQUazPTFmTGD7wfmJNi5QNL3srQsNwQ6SripCHT/ueKLibnjRNHXHILUUASoPF1FY27RwV8OGbreq6xtzrHyi4knxwSIoXjmPBy3x
X-Gm-Message-State: AOJu0YwQAubWEmBY6xRIHCC0TEe6mthAfI7Q7bWtX9dweeODLg3P40Ov
	fEYcaRCvrOaDDxH2fHI3xDCe1jpnSA9Po3QBU52rQwlzT9opRs9K
X-Google-Smtp-Source: AGHT+IFx+0w4koH+2lh7oQEJiiGnGW3l5n2kEVeCTbZcpsxeFN7yHxa0KGGLds7mR/2miOe42TWtnA==
X-Received: by 2002:a17:902:dc84:b0:1f6:326b:cde0 with SMTP id d9443c01a7336-1f6a5a25c39mr340275ad.31.1717518870722;
        Tue, 04 Jun 2024 09:34:30 -0700 (PDT)
Received: from localhost.localdomain ([221.220.133.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63235561csm85463445ad.70.2024.06.04.09.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 09:34:30 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Diederik de Haas <didi.debian@cknow.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: media: rockchip-rga: add rockchip,rk3588-rga
Date: Wed,  5 Jun 2024 00:34:06 +0800
Message-Id: <20240604163408.1863080-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604163408.1863080-1-liujianfeng1994@gmail.com>
References: <20240604163408.1863080-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new compatible for the rk3588 Rockchip SoC, which also features an
RGA, which is called RGA2 in the TRM Part2. It is the same core as used
on the rk3288 and rk3568, which documents the same RGA2.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

(no changes since v1)

 Documentation/devicetree/bindings/media/rockchip-rga.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip-rga.yaml b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
index ea234222240..ac17cda6519 100644
--- a/Documentation/devicetree/bindings/media/rockchip-rga.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
@@ -24,6 +24,7 @@ properties:
           - enum:
               - rockchip,rk3228-rga
               - rockchip,rk3568-rga
+              - rockchip,rk3588-rga
           - const: rockchip,rk3288-rga
 
   reg:
-- 
2.34.1


