Return-Path: <linux-media+bounces-16095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A28694E548
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 05:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA2CD281A40
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 03:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C411136E37;
	Mon, 12 Aug 2024 03:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/lXT19F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7231DA22;
	Mon, 12 Aug 2024 03:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723431652; cv=none; b=Px6DinTo93QRildDE2pB59VDiF2wOjtrseToAqMRxrieEBz9xCOrnVS/erL9Y8BV8FtFjKvio9DgNlONuIe+vbLCzjqE2wKAjE01RXTO3m1u+oKHIjlBYnIo8DoP+JGPt79isD3yao5aJvazA0uklQ236HvfFKx1YaPkME3mUes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723431652; c=relaxed/simple;
	bh=ATD46ttZWb0tBzHd3NAq4Sl04kWhE2U1G1BnLmQHe/c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iBsJqwHdWqgM6E7Cbu3hx2Czn9rycGAm7Xqf7IHz8CUsPKZ4glEz0SW7iiSgF+wJgy7/iz1eHa4c71eYi2pB9GBQWUw+fX/ZZSGieyQesa1964W/2pK6Pdg+ZLhAZZGqMVdrtrrWz5d4LO35tymQ0nWwKGJ/qLZ7IF3P37pmGFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/lXT19F; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ff4568676eso37358705ad.0;
        Sun, 11 Aug 2024 20:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723431650; x=1724036450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xvNI9UxKH6qoTzl3xKSTSvJHZCm2/riYJHczBzxBPJo=;
        b=e/lXT19FdXb77AGAb7+IOESAWTVAo78zaID8GtjKcu5XPRmYVSSMj/9TCCsSdLDUW6
         nabdcpO8rEsGbOe4JNBmNQSLajkkYvc1FmiYOQr6K5sK9YHNG9NivD9JKGoZGzk5twED
         AOzpgAYCVM/tYZxJhD8l5WD6C/XJYYvNtwA1IhAdgILbqAfouWTOrk//ydd3RDVwfUN+
         KHQa8t3dDi3J+oAobDq7J+17G6IulB3Pnpam6S5kJBPWv3AAjRI4xaugLCjKnVmY/dlM
         NGT6NkHVlSbTwfjO2J2s7CmGW2QixCKsvzpkmp7DpizEC2Yy4Uw9cwsVs3BvUbMgAgD3
         sKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723431650; x=1724036450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvNI9UxKH6qoTzl3xKSTSvJHZCm2/riYJHczBzxBPJo=;
        b=dFcFc65d17pJ7WbGFBbUtmwmDJLPTNuGAiMDPkx8MsZy6I6w3aCjovokApHXE8Oh+5
         r0mIOcZlx/gzkrxvad1Dys/aV+Va9/2nUN+hiCk2XwTuD9j4dEMHd/JpRLHHq3a0/DxX
         unMnrQTfr71WRaO0WAGw07ZrZUXpP9Yu2+m5uWsYVgAWvxgQLrC5iTI44MG3v45NlBKs
         0TOkwgXcKMAXeUF0ZYG1BZkzeUnRlwVAtgC4UduJGhjfqwygk2yyd5k4ztoSYS3M9A2p
         0lfCBud/CxE37DstC2ks//PgxZKTYbexVrxoZiJr4r4HW/FcS18DGN/CCEqy4UGBS6W3
         OcJw==
X-Forwarded-Encrypted: i=1; AJvYcCWSL95ohRzo6I3y7hyEjxY2/1meT6AeLfoB5dyHdi3qO+7RKrYRIyz5DY6+TH2Rup6by61kXGnYWNfzM4W4y7Z/LQIC2QwKFD+Bn5LYsswKlguQS5P7ZNsY85320ZyszCJtr40UT5LKv+oLisfA8tqFBC4M7UlBd7D1snBs01h7wRio4U0B
X-Gm-Message-State: AOJu0Ywvb5+TvAWqo659OZM+v4Yo5N5jAMyHVwkxUSI8I6I3cb14hTXE
	KWDX6xk6b1ojBgjf8hchfG8y1Ydmi4MvFkm0l17GYaTkrdi7brOw
X-Google-Smtp-Source: AGHT+IEJ8WTy8J8fye8zaROoWmQq6+cN0Kjc/PExZ7qxH8LD7+eVyHDYBQi9qAS7vBp9rMYvHruCaA==
X-Received: by 2002:a17:902:ea08:b0:1fd:9420:1044 with SMTP id d9443c01a7336-200ae4fa836mr117585105ad.16.1723431650367;
        Sun, 11 Aug 2024 20:00:50 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bba00f73sm28047105ad.201.2024.08.11.20.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 20:00:49 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: [PATCH 0/2] Add support for nuvoton ma35 nand controller
Date: Mon, 12 Aug 2024 03:00:43 +0000
Message-Id: <20240812030045.20831-1-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds the mtd nand driver for the nuvoton ma35 ARMv8 SoC.
It includes DT binding documentation and the ma35 mtd nand driver.


Hui-Ping Chen (2):
  dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
  mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC

 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     |   97 ++
 drivers/mtd/nand/raw/Kconfig                  |    8 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c    | 1109 +++++++++++++++++
 4 files changed, 1215 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

-- 
2.25.1


