Return-Path: <linux-media+bounces-26170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43780A368F6
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 00:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27E32171271
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 23:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E921FCD17;
	Fri, 14 Feb 2025 23:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNZcNG01"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C659136347;
	Fri, 14 Feb 2025 23:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739575103; cv=none; b=ocAMB2r0gfypgxMCDju1lCIU/McFpQLOSgKmGGRAO9x6KmLVX3KGNFrBVZqLBo/aX352Ifi3aGopw3jeqDXDSfGyiFJScIM+U250IUgUFUJAf+SJKjdLU2WnBVzu0kEtAvuHhShVtXU1rKwbrc7jjhPIC4082/T+HQmjWI0R5hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739575103; c=relaxed/simple;
	bh=iKdwg7caL+Z5MhsUZ93wp99hJvluEHifUiLblOZmBMU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R2+2o548FANbS+8n+9qd0c/nAWpV4ZyYE+eA1S42u5t4ao+Iki4aBpU7NhJ+7yVBiRk/KnLvwAhQSJrtjwwRSXmnVujAFtzgrB+H1KYe7V8PW9p4Np+bCosIQzRn+oD3LIGT93ezIHKnF+c1KstKn3iuOyrEdOJEdK10A/3+UUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNZcNG01; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e66b82547cso1066036d6.0;
        Fri, 14 Feb 2025 15:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739575100; x=1740179900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xMEwzQYn4zO616CMfe0CcyNuWl1q/UQBw4c2wx2/Dpk=;
        b=NNZcNG01KRbiLOx5ck35srf+32kU3XKptPX415vdyFh9y5m7L0uz6jCeVA2T1GqaV2
         A7shdEdI8WlVf4qVV5R7lYahd5kaPcgM/Kg13Gl5PeFIiHfSwmqS4ZzT+tlInA6hqf0r
         E/lfY81VYG5vFv2E/Mc53yLabBSo1vWi6NnSMwRnMaL2FBZPtevzZDJgCW+ILgtDj8CA
         tbwtZS8WBfyANhUVE237WGpuaPu1TmpTs4P+As1kc06p+pg9i0J5knmXpevWAylHBRQ+
         NCsMRIDlRGX6YkA/amiDq+RPc3l03rJdd/QToHaXKtSaFQHSA21HClIXP4ScZzcd3u2o
         1lyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739575100; x=1740179900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMEwzQYn4zO616CMfe0CcyNuWl1q/UQBw4c2wx2/Dpk=;
        b=X7eLkeOaFp878fWXh60aQLwcZxMmVpAdTojspW9RoTN4QnGhQ+yzSfJgK3CzhDETQV
         0kP7FzJBlynVmK5UOjdMvfhKbCfBvQ6COgnOdrl2QzmW8YQ1BnGfAFPrmEMraZZ96hZl
         jb6wTU3hv5EsCh5FUf+7DVoQLU4gtkiaAphoqWn9Q2WkqFVlbQrM8jvBTF5a+rdmWE07
         xj3QlCC4zYBain0WjS85dvQ/IUNJ326EOiyMLHVsMCShmez5QxduLHVhjlwadK7Teh/G
         QZYPT8xb5pxev2dO25SnbkhangoK3qMGxJquwpYSNniGzBDbw+63zXtvZL2Yaf78AwOF
         76tg==
X-Forwarded-Encrypted: i=1; AJvYcCUxqy9h9IzcuugOXQV6JENxlW7O4cbpm3gWfONd/gUTECm4vC7aBnF9yNqxWPaFfUpG8RsNo84s81Rx1XA=@vger.kernel.org, AJvYcCVupnzJOQAO5ilWXByycRlI6ednd1oKXSRhMQhE1DDIxzD7V0zGnQCUsH32AwLtrt4t10Q5zs74Cnzh3S0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeamnI+f+z2kw+sm2gjn1HVDvbY3rWxFJszDLcaka7TGtxs6ox
	I/76g0zwW5LMLiqPKvOPA4j2D1xpljTnYhI74095QuZRQ0tymFkB
X-Gm-Gg: ASbGncvtaTFLIZgYCg+BAcplBMBV2EEX7/8Qgw3OoM4iYYMh4wtuheAw38hHpIBIvQX
	Vhmnh0Twr6fP5SqJgQX2+We7dyuTagSOJ4irtkjGwBh7lsDv7jYiTN9dVZB5i2AsUutxKGxZyUQ
	2PWr0BMQdnJe9//NC8DPyYO2QaFSzPme6W3ylGkiztQjdIFg4CG5vIMQXuquCMDaK6ZKZtVN9vv
	ce2RSd8+RFU9F2jLWCdVB3CHKTEPL0wPFgLfGOz4QeFTKtZiZIgaDiecXD4q4laJ4T8xQrJlrsm
	V5C61X54+JimyOQEeR/y0xxdM5gmdgwVYa0Tsy3QfLUP4aORksuR5l8R
X-Google-Smtp-Source: AGHT+IGqGDUKzGVDrn1hiBwRzg72mEtRCGzOpfcx7Tvn4SR6uuQjF8AXDua9Gm6UHAAjchJKgT/vdA==
X-Received: by 2002:a05:620a:4113:b0:7c0:7818:8557 with SMTP id af79cd13be357-7c08aa823e3mr74609685a.10.1739575100368;
        Fri, 14 Feb 2025 15:18:20 -0800 (PST)
Received: from matt-Z87X-UD4H.mynetworksettings.com ([2600:1002:a012:94a2:4db7:5f35:9da:d13a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c07c861221sm257829785a.85.2025.02.14.15.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 15:18:19 -0800 (PST)
From: Matthew Majewski <mattwmajewski@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	"Uwe Kleine-Konig" <u.kleine-koenig@baylibre.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Majewski <mattwmajewski@gmail.com>
Subject: [PATCH v2 0/2] media: m2m-deinterlace: add device-tree support
Date: Fri, 14 Feb 2025 18:17:57 -0500
Message-Id: <20250214231759.119481-1-mattwmajewski@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello all, this patch series adds device-tree support for the generic
m2m-deinterlace driver.

A specific dma controller channel can now be provided to the driver
via the dt, but the driver still supports the original dma query if an
of_node is not present. This should preserve backwards compatibility
with platform drivers that directly instantiate the device.

Probing the m2m-deinterlace device via device-tree was tested on the
BeagleBone Black with an m2m-appropriate edma channel.

Changes From v1 [1]:
 - [PATCH 1/2] media: dt-bindings: Add dt bindings for m2m-deinterlace
   - clarify device description and commit message for dt bindings
   - correct format error reported by yamllint for dt bindings
 - [PATCH 2/2] media: m2m-deinterlace: add device-tree support
   - no changes

[1] https://lore.kernel.org/linux-media/20250212170901.3881838-1-mattwmajewski@gmail.com/

Best,

Matthew Majewski

Matthew Majewski (2):
  media: dt-bindings: Add dt bindings for m2m-deinterlace device
  media: m2m-deinterlace: add device-tree support

 .../bindings/media/m2m-deinterlace.yaml       | 44 +++++++++++++++++++
 drivers/media/platform/m2m-deinterlace.c      | 25 ++++++++---
 2 files changed, 63 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/m2m-deinterlace.yaml

-- 
2.25.1


