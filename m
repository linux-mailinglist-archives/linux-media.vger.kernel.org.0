Return-Path: <linux-media+bounces-36363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45001AEEAAC
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 01:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 326D33B34C0
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 22:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0432329827B;
	Mon, 30 Jun 2025 23:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ch1OmXu4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15E2236431;
	Mon, 30 Jun 2025 23:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751324402; cv=none; b=Q8FKvGg6aG/9lalGx8BsdBYYeUejsgdw8OCJIc+ssnWOoNSqbmzMuMotR498Q2cs8+RSiiKRLKJe1wRr958qGUIK+WRnmaUW4STHmNE5gfSK9AxPNyIlCpYzyzSyPWqaFxA0wSA41qBUxF7G0CD1cpM5BUGk3rWeQMalvzsFUIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751324402; c=relaxed/simple;
	bh=gA/rqZDvQ609PxYWMxBBtawWy4Jh5xn18rO+o65ASlw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=euE7gu7Rk4BrnTSMkuXrZXUZnS4NRWJMOwcGEvt9CnHj0xG577OS7UYRN4u7AMKXbcyFL78y+w/Kks9qSzG0ak+yh3GUvGWMzC3McGxZrrElH7v7ku8anB2Y4wdk+IoDmDSYA9wYo9nJorOk6X/57/0d+/IwvhyqG0/KaCDQGLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ch1OmXu4; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6face367320so30671866d6.3;
        Mon, 30 Jun 2025 16:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751324400; x=1751929200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LGrUqtxubmQQlv16hC1RTbhCLbjoPf3qTf3ZQLFwA54=;
        b=ch1OmXu4TzDJPhMO+Q6O+zNaRz3zakGykojcHM1HU4M7c01RmxLXvj+pjhUbD8QYEY
         uVEkhtopXetTR+Ik93tNC0LEDMbSkKtfBbATUHHGYVinMWUO3FmcnHHZ8zLN7MaWYacB
         i+V81Qnk0pf/fhsl5oZEizw1URp62/XUQhWvbN5l8YeT1vwTMP9KHqUvuYGOR1F4Vmep
         8dQqggtDGQAi9LriDqCTGQZTXy4e+4pKmC05gguwg9RiXQHHs8XDROiUcOqOHC+m3Tqn
         cOuLgiy9Mft6xXHSGPJayo6g3nyQrS/B8IVSDl0ah40XqyoWN4KnTzf6Sc+wFdDNv5Vv
         kwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751324400; x=1751929200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGrUqtxubmQQlv16hC1RTbhCLbjoPf3qTf3ZQLFwA54=;
        b=uR1N+SHpe4Agh5WZKQ/sNZKQPeQgxXW9B0t9T+3uVJQvUlpMhfc/vRf6IJCjehZTa9
         tlnf7qBOwiv3IEQOzmwDNdJQcvCZJGxXhGyNMa4Sm04O2Exoxs60RVulmC2NVZv3/qGj
         O5x6qX+xh1JSx5TLFBtxKpPpLFtFev2+ZX8AX6EOzGjbHjRBgkns7fozWiP5zvhSSBpf
         gveMNie2uctNgPwUP5eqJJ5HmBWGK5+rW4HL3BueuYxWDF6fh8trLqJOseg4qr6IXU0R
         n716/JPyHGORvC2QmSWMg5ZTXMtmc/80gXBBeLCRF3mQ1gxpNuD1kJiZGG/YrHbXO7ql
         4gyg==
X-Forwarded-Encrypted: i=1; AJvYcCUG5aFSFN6ofWqOOgUYzonY8S+PYeTd9Tw/Fx01IDuCBM5oj/jPKy/nrLBWH0PxfBFTKJxtBCPtqfGv@vger.kernel.org, AJvYcCVzfQpZ1/J3Z8XMstIAiInTf7VfJt5t8UJoSHSWveiPMHjBEtqKfc0+GdsC3WH6EWyijdshX9WUle7Fj3g=@vger.kernel.org, AJvYcCXjZ/BYYPzsVsXp9TEzdrknSl3yQSdT6UoXfHLYgaJxSy5OSWT5YbRLd8/hHGElqLcQUFi9ktEmwRcMXVYtxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwazEb83T0G/CA4/fdpEg17RUXWkl/72vcf3fK3Q/aeS21RFbir
	UGGUDzfyCno0680T6zpmfPbmCZJJdDJ1IV9gRnq2R9CFn3wBVfxJdXZQ
X-Gm-Gg: ASbGncssQT33H3beV7y41F+/CxjYy6BRDX66uXoQ2GtKJ5h+NOBcUgAhszWdTCmzACy
	a8nEV92PN1oxzDuHoezvW5Z+Lpaq46xdlYCWdv98NNptOq9hM9YVBlygV2RpWMXqYEriqv5SFac
	kas/W7zVm2qu3fIR5019ITdDGlHAZLo9oWxIEsfqSMWT8mPDHW68dU9VCQA8Ym31/VgCfTMNGGG
	IbZ4AvP2eRrr/yFB6+cna4g8x9xg+wgWrgBAgvpJPVY/142OdyQji2swf448snlIdSvuVpc17Cy
	kvoZUPLRy71/4wkPjfxKR1VPW7dvvuq39dhSZSYW65oMjLVt+w==
X-Google-Smtp-Source: AGHT+IHCM70vsZ6bwqPbkGcW820P7cMbUjKJAQRvRZFmxaA/X6BlNtYOHKVsQ3E8+gvADptkc2PucA==
X-Received: by 2002:a05:6214:4186:b0:6fa:fddf:734b with SMTP id 6a1803df08f44-700037a5aa9mr197988376d6.24.1751324399652;
        Mon, 30 Jun 2025 15:59:59 -0700 (PDT)
Received: from localhost ([2607:fea8:3140:6800::10ce])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fd7718eae0sm76229246d6.20.2025.06.30.15.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 15:59:59 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 0/5] media: i2c: IMX355 for the Pixel 3a
Date: Mon, 30 Jun 2025 18:59:45 -0400
Message-ID: <20250630225944.320755-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the IMX355 in devicetree and adds support for the
Pixel 3a front camera.

This depends on https://lore.kernel.org/r/20250630224158.249726-2-mailingradian@gmail.com
because the GPIOs would go right next to the charging, if sorted
alphabetically.

Richard Acayan (4):
  dt-bindings: media: i2c: Add Sony IMX355
  media: i2c: imx355: Support device tree probing and resource
    management
  media: i2c: imx355: Add power management for managed resources
  arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera

Robert Mader (1):
  arm64: dts: qcom: sdm670-google-sargo: Add front camera
    rotation/orientation

 .../bindings/media/i2c/sony,imx355.yaml       | 122 ++++++++++++++++++
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 115 +++++++++++++++++
 drivers/media/i2c/imx355.c                    | 109 ++++++++++++++++
 3 files changed, 346 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml

-- 
2.50.0


