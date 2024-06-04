Return-Path: <linux-media+bounces-12538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D58C8FB91D
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 18:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBE4128265F
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 16:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1138148FED;
	Tue,  4 Jun 2024 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSa+OpzF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71DD33F6;
	Tue,  4 Jun 2024 16:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717518868; cv=none; b=XBei9g7zqfURzTH3k0oQyNNYXkgS2345xEH3uI+HDfeLpc7javZTHN79sxQO8g1Dw7W6og0pLbzJ4mGMwl5jxkwv6QeS5xNjAldp33RmDomt1caW3bF6+q+vpUMcrAwHAzIuyl1UYSzE6dYlsVd46hZVYJsrl2OtyQQV/unxpto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717518868; c=relaxed/simple;
	bh=IHp8I0XLGKvDOabpNinJKrzJ4fgxpU17uN+IrSdv7f4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QbfDY97JvBs33DdfHl0BMF3/EOQm5UuZgTK/uh9lc4Wb8sgfRbiKxrDLGJ2js0vdtR2WYHNWkFKxI3uGM5gTCruEHXu1iGpUJ9kc+S5mOuc92RAPmwUICC5RPcQEwvcLZSVhARbtLqK2y6rHXkbrZACdEmB7yTGweXLE03KJkK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSa+OpzF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f62fae8c3cso42791885ad.3;
        Tue, 04 Jun 2024 09:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717518866; x=1718123666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kNMkvSgPRL+HFbVKuBUDCFz6Q29OexFnXfdHgCkxWRo=;
        b=gSa+OpzFz1OTD0JNPqsUSF33WiCm6AqcHgsigzktV+CqxWp6zhK9FEkBesmihuG5++
         Lxk0iDW1U+qqQ9PEixd9iu7UyYLQXW9TdK/kF/h9CYgUziAHfFUlO+MyEbMEEdow+yJO
         uOoQxF2pqPbwq4t2GlqL8KtXHBTmzVg7SIXKf51T9JKHAbwo75elVf0DsMciE04Gu13X
         4htz8BLpl2c74qfixIrp8fVM4m479yozJZeoFTPunRziVdcASIKAPzrJwvBDlulaRfu3
         K2NlY87PdSxTjd7/090zyWlmTlCXWxzA9jn82tfppG9SVGCFMf0ah2pN0s1e0SJjIHtB
         lp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717518866; x=1718123666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kNMkvSgPRL+HFbVKuBUDCFz6Q29OexFnXfdHgCkxWRo=;
        b=isffKnhZ93Xa1eAbIPJOYLUE2JtXO6CDUZS7QisfBaWwl4IaSduNuKzgbQEoOsvWfv
         khabRf+56H5qNHzVY/G4e4BqHD/p2STbeF7MAVboPA6CcKPyPEke/2JRgFs0h9XwyZXa
         tBPJXMnyTFkhnRikUNI1Hj8sKnqXj7yKrUXbS4UlZcjehsXhV6mddEy1AzOHLNS1gZ95
         7PLHZd58+rpjRjTPF5PERse1AVVVsn2VjhoRXZNWq04tKGAszSxoA0l7WMP3X3fvonfo
         ZdTYwZYAXUSWXv1W71NPQftCP1yBbHV2u44o/8uI0n72iiOaL90B+iAxu6UjRnsD336B
         nAmg==
X-Forwarded-Encrypted: i=1; AJvYcCWsfk1IfXG2qLoqsbRntVJ4kb4VDmhVdy6eE1zLjf8FSU189fTAMW6mejwbQPmMeQFVqqVQYDVznsDMqfiWVLZVSqqk6JYqt0NRxwINONsAlZi2k7XUbErHLXUttNqeM9FLbHhXEhxrhivBOzuRTPrhVMF3JEWEGq+ljN2Qv0mbtvis7kPQ
X-Gm-Message-State: AOJu0Yx6ZyGNAllZHi002YJa3any0+HLz8y2u9MoMIdpaq3tZMYGbApt
	qoiBEdi+wS7dsuiOFIaIDKcmCuJvaJPuRz4l+Ja2Ep6HI2teY5Bh
X-Google-Smtp-Source: AGHT+IHG4sUVA4FYCO79uY2xVAxXrrCVHdyaWoU5wYx3c5RXxoyENfCcvYDXP7nWGqajSo2m0xtr9w==
X-Received: by 2002:a17:902:f945:b0:1f6:1780:f7b1 with SMTP id d9443c01a7336-1f6a5a0ebf7mr491285ad.17.1717518865978;
        Tue, 04 Jun 2024 09:34:25 -0700 (PDT)
Received: from localhost.localdomain ([221.220.133.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63235561csm85463445ad.70.2024.06.04.09.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 09:34:24 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Diederik de Haas <didi.debian@cknow.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/2] media: rockchip: rga: Add rk3588 support
Date: Wed,  5 Jun 2024 00:34:05 +0800
Message-Id: <20240604163408.1863080-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RGA2 on the Rockchip rk3588 is the same core as the RGA2 on the
Rockchip rk3288 and rk3568.

This series adds the necessary device tree binding and node in the device
tree to enable the RGA2 on the Rockchip rk3588.

Tested on rock5b with gstreamer command:
gst-launch-1.0 videotestsrc ! video/x-raw,format=BGRx ! v4l2convert ! xvimagesink

Changes in v2:
- Sort node by bus-address based on next-20240604

Jianfeng Liu (2):
  dt-bindings: media: rockchip-rga: add rockchip,rk3588-rga
  arm64: dts: rockchip: Add RGA2 support to rk3588

 .../devicetree/bindings/media/rockchip-rga.yaml       |  1 +
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi             | 11 +++++++++++
 2 files changed, 12 insertions(+)

-- 
2.34.1


