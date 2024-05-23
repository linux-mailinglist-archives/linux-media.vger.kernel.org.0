Return-Path: <linux-media+bounces-11831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B49408CDA41
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 20:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E54081C21DE4
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 18:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B7682892;
	Thu, 23 May 2024 18:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqyk9WqN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932492C694;
	Thu, 23 May 2024 18:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716490599; cv=none; b=T3U9Xog8OhUGjUE7DS4iF5u1AK3Hm9TWTMIhZF7YFsnaBc7aJEujC6k8rz+2EE/ecrHSe15Tn4Xe+bpCKLH9wljAov5oslhRUa4gYJMXDX8T8PDD2nRnW3ZhIPpAh2fF41pNkW3ippj/EuZPEwBtG+whFz3xxyqHWIeCRFd/2c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716490599; c=relaxed/simple;
	bh=sEYh8/OSr1G/nZSPJQFB5WsX5qPrCE0Z5j+fdmyie6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I8D/iIv2r+LnXaoBXgifI9a+zXBj116oqdOUWHSkeBr2xN2WJkQcOVLI6i1fh2V3RACmPPM83wJwYX5e8mfMlXC/32bxOP46ZFVx6ngOn2m8Vq+8x+IJM1RXifW28eJAE/grvRN+TnwTmnSIZkCC/2ucCEgS9Kez9xo42k1S5QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqyk9WqN; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-351d309bbecso5434955f8f.2;
        Thu, 23 May 2024 11:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716490596; x=1717095396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AvoPPMhrO2hD7dyAxOKf0bPuZdn/lIXtjZ6yK7Xph24=;
        b=jqyk9WqNJxxPmRrEDmF2IAM6KynHoL9CRRElBLVykB9wOTjn+5jtKq6HM0LTGkxjuD
         MEeLTbTi5rPWFhNNhGZQEaUXSukhahqAjqDAGuEGoZJHcAA0lZlAwHnKvmWfYiix8KCH
         IKv4t7SSr0FfPyRJaI8SJ/gsrBrvdRMiLCUGpo/ueAMUSVdFVLtJEMFL/b6m5oN7YFwY
         Yhb1sxxUIfseKJxLrPJegEHehsY2vsw6Up989oDk2NgwCfbltBKEDYIPnDM7/0i/1SsQ
         qr0PafqPBmXJ0TXiwrXCQJ6ob99VJX6OQLLEzpUmzzVAx4K4E6W1ki+4AJgQmNCzBiOM
         4L+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716490596; x=1717095396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvoPPMhrO2hD7dyAxOKf0bPuZdn/lIXtjZ6yK7Xph24=;
        b=HU0FaeG/ZOCnq+p+lfCFJTl8+pjMkfeoQH7Iejz2Y1i6az3thW4yvZd57AYn79V5w5
         9cuTr4bZNGgRq/jyNUuIr/ynduADEFIDFEAAWnwyuJ7XLkKZ96FY0XDrbNvfG2ngZs9M
         it29wEZ/Y/8yhHPN6FGT791nmqIEKCgwTBu2+Q+GQgl9LZXL/sN9PpmVkXLCCmM2dpwf
         /D6qGgRcC4sDTLit9Tx9ts3L1kvUFyvDE+PI4QVh7R+RYgfsFAdMWxlAIJ5Mk0a8VMlw
         rx0Ao25eTW3wlB5IzfXNpf1ytf4nZPj+dMAOzh+5ANctB4csJLyrdVvgnpGm1Gchq+iv
         9i8w==
X-Forwarded-Encrypted: i=1; AJvYcCXn0MKfDRu2tSUqHsJ7/DnM2ybhmrBmTrKREV4Vp+id5xKHvh00mT9AnBXietRTzmBYBJLFSt0vFZ2U4t82u0jlOQu53zaNkz9A/NMJ1VXoWzsQ8ha7/9aIXQHbmVcpuD2yloBEDAIX5A==
X-Gm-Message-State: AOJu0YwVQMm3IUXOBGtxNTssq2V5mnuQVU3nmBHujXQuNKzgegqKZrqs
	6oxHs344SAIGO9/6ZAnLAfEXrFnoBOgsIVCytEEB2NPrfX7gHPI=
X-Google-Smtp-Source: AGHT+IFDAmICUJMGqa0dJt54nPZguG3L4s2OBkFBuWtKgRLfaPC9zbKPd41N2wEkKSET7fJJHIYs2A==
X-Received: by 2002:a05:6000:4021:b0:354:df31:6dfc with SMTP id ffacd0b85a97d-354df31706fmr7116512f8f.58.1716490595941;
        Thu, 23 May 2024 11:56:35 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:a453:b45b:e52a:2302])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3550c675581sm3965f8f.13.2024.05.23.11.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 11:56:35 -0700 (PDT)
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
Subject: [PATCH 0/3] Add VPU support for RK3128
Date: Thu, 23 May 2024 20:56:30 +0200
Message-ID: <20240523185633.71355-1-knaerzche@gmail.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to most Rockchip SoCs RK312x have hantro G1 based decoder and a
hantro H1 based encoder with attached iommu.

The existing drivers can be used as-is.

Fluster scores:
  - FFmpeg:
    - H.264: 127/135
    - VP8:    59/61
  - GStreamer:
    - H.264: 129/135
    - VP8:    59/61

Alex Bee (3):
  dt-bindings: media: rockchip,vpu: Document RK3128 compatible
  soc: rockchip: grf: Set RK3128's vpu main clock
  ARM: dts: rockchip: Add vpu nodes for RK3128

 .../bindings/media/rockchip-vpu.yaml          |  4 +++-
 arch/arm/boot/dts/rockchip/rk3128.dtsi        | 24 +++++++++++++++++++
 drivers/soc/rockchip/grf.c                    |  2 ++
 3 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.45.0


