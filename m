Return-Path: <linux-media+bounces-43599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F3EBB3941
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EC573BBD03
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8EFF3090FE;
	Thu,  2 Oct 2025 10:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="v3hWiZ0d"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1862FE56C
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 10:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759400147; cv=none; b=IeIrb/5/ORlFRKbQlIyPIghHg82zYmoWrvFh0jSU0sUWJN6yOeaznzVW2lgZ1ThL5TXaVjy5AFK6jrej0cVH1sskL6mE7woYG9IRusBbiWlT0jW5N1iI+sQRiSOSlbIoFTQklDSmKc8NbOTH9wKIKAq2co3rPQJG/grdqKZoSL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759400147; c=relaxed/simple;
	bh=66oeXJMJEulwZj/KIhNOzY5gGBvviXDjo7ZUMMncbtw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uVafSFkfMwHVs+SpLXSC/dyrdZCjpg7kIpvuuQgznVMuJNfqEgIx14RohPkrdp6de32l/9HH7YxzRefd9/176jDM9V4V3vNsPdebpSmJ0CyUsvl0w5IWTICrt6HnXHBXmTAcWIxjsbETg1NQGNxZMN+NW70e8l3x3Jfkvae019s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=v3hWiZ0d; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b41870fef44so180414566b.3
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 03:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759400144; x=1760004944; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NPlLSMsE7jtu9vfSrQUVTA10X9VUfgXuBWRPCu4XK9E=;
        b=v3hWiZ0dBTe0BCjfiyl6e3HMtCzGyrb5Vvj+Db1NCgnrVriMMx9lkQc2MftgQCXFGp
         80kDQQFWg6f9IcKLmfxU6NPNSKSEE/n3XTGU6MQ6yXFohNxRoyAmpNizdOj+hqhTlRMz
         XHeQYvXKWoF8JCJHR4NRGgphDZ5V5+NMWivnLosGhA9HYCvVEHxsp++PvM+S563RASMD
         HooIJ4gMfGcbM4OeVbwJRF54by8bd5RmJqc0OdAm02Bm4PbU4iDMTzbvPw68GSV8Cp1S
         s226aIxaDRWmJCQ4nU5/tFrbYtkOX1uVGw7ygvVuTwmgj0vEPK0B0QkV6yRU7pWlcGC/
         WXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759400144; x=1760004944;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPlLSMsE7jtu9vfSrQUVTA10X9VUfgXuBWRPCu4XK9E=;
        b=h//Dd/OE3TyMgEJSaom2nRReOzLBzLucIcI1MYyjqPMVkPh8XJ7Eah9iCiVYxit+lE
         A6LyjH6yQ5dXH+gHAEsXzhHSFwMpyiDQl7knQNNHny4KyPwH6RPwbIvBIlwWH2/knIrf
         8h7gpSn2zqG4JL7OrsFiNk/kt3qM/CzE5CxXFHmXqjRb6vLWPcWRVAKHuGr5OiZ06XUV
         hJUBjW7JgD1jxUQ4ZWlQFFgdUZeEIfr5Xq/a9gKowA6u9P9HxaqiV6dj7A5DMXY1D7GL
         aywHl2YXs5Mq7awJ9IXW35F4pA+d21rWB4BgznbcnDAATyamNM53vWloJ4iBiGHZ/wD6
         EevA==
X-Gm-Message-State: AOJu0Yw+deJvfKMEI8DLWrR64AZ9tEuVcwjjSKg2rS/YzizUCqX7RjrU
	MM/2bzeGdoakLJuyydE5yajpOb+cm3uoOdCCF6WWRxRxTjFBwAdFMeVoasVr1nDZM3s=
X-Gm-Gg: ASbGncvMOgs8Yzvk37xVt23TcU9xUAQBSZBrCiLl0S57J7Ah3pMmj97z24a2RnUUz/6
	XDk5IFEe2gBzf2KmJhdkVeyG07mpdmF8c8XSWi+xmYJ5i4z3IrKtnsK5NDl+FXH5baNaeRVtGu8
	MTNhi8u0ymZHuvKScSHmYW/WVnbN+MG9Xqge+tyrPg3AWtOW6Lz9xSnHJftGjuXBntffPnKksu0
	MUXJkDZ1kv/zrTmRs2SvotzE0VOliRCgW+ZAuxu+VjYqyHU1fbYD9qZtMHheS08jjL5i8mBpfPY
	uKyjFYYjgoRVh0Ci4IJERNYuF+P1FK8lx6saYuOo8pdE0umWY0qrsmJgI7v/iTMBJoBJkGDM7Ik
	H+NGXMEbj8Kl7C99u+R6KHNENdG39dO4mj0OLvJBcvZCElrkcTTdc8tZ+28xzYFiMTTOjdPAezD
	DiCOmFyt7OSC30wHxNPO5bwaZHhjjH
X-Google-Smtp-Source: AGHT+IFeiokypzBNV3MdgOJgTGlXOrZ2BNMjOleFZQU75JeHB4nqA/43V4SqkrvtRZ97TXcmn9ISAQ==
X-Received: by 2002:a17:907:6d0b:b0:b3e:b226:5bb0 with SMTP id a640c23a62f3a-b46e8b85fe2mr871981166b.42.1759400144353;
        Thu, 02 Oct 2025 03:15:44 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e77427sm174862366b.36.2025.10.02.03.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:15:44 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH 0/4] Add support for Dongwoon Anatech DW9800K driver
Date: Thu, 02 Oct 2025 12:15:32 +0200
Message-Id: <20251002-dw9800-driver-v1-0-c305328e44f0@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMRQ3mgC/0XMQQ7CIBCF4auQWYthiFjgKqYLClNl0VahoknTu
 0vbhcv/Je9bIFOKlMGyBRKVmOM01sATA/9w4514DLVBCqmEQc3Dx2gheEixUOJKo1A+XIwiAfX
 zTNTH7+7d2qMTvd6VnY/xr1q2m40wm9mg4dppLSX1Hju0RW5e5zJxPw1DnC0r1zM20K7rDyRbh
 fS2AAAA
X-Change-ID: 20250918-dw9800-driver-58105cd495e0
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Daniel Scally <djrscally@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759400143; l=1571;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=66oeXJMJEulwZj/KIhNOzY5gGBvviXDjo7ZUMMncbtw=;
 b=EgraaFNjoNIULDbNYyc3vYi1LctddRH4XQidFUC15RQuotgGw4RXcCVy9oN7iNJdi5eU46qR6
 GVGLxDbMVrJCkyPw6xXs3XyI5Xt5vyMXnjLAI9egOCr8Sc097BPyxgL
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add devicetree bindings and driver support for the DW9800K VCM driver.

The driver code is added to the preexistent dw9719 driver, which has
similar functions and method order, but different register sets.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
Griffin Kroah-Hartman (4):
      dt-bindings: media: i2c: dw9719: Document DW9800K
      media: i2c: dw9719: Add DW9800K support
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable CCI pull-up
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add UW cam actuator

 .../devicetree/bindings/media/i2c/dongwoon,dw9719.yaml  |  1 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts      | 11 +++++++++++
 drivers/media/i2c/dw9719.c                              | 17 +++++++++++++++++
 3 files changed, 29 insertions(+)
---
base-commit: 6063257da111c7639d020c5f15bfb37fb839d8b6
change-id: 20250918-dw9800-driver-58105cd495e0
prerequisite-change-id: 20250709-dw9719-8a8822efc1b1:v2
prerequisite-patch-id: 5a1b6083c0f5df1421cfe6952dac44d9ddb7fb07
prerequisite-patch-id: db5f49e91aaf521fa487994765b4107f543531d6
prerequisite-patch-id: 76bfa65d3ff23fc827790b0868bc34655cfa93fe
prerequisite-patch-id: b76d61c90bdbf20f437d2fe438d54e707621e953
prerequisite-patch-id: 46fc09662693e6a51bb89ab4d0914265c74bc3bb
prerequisite-patch-id: 4e0012f76dd03d5653ba185a8ccc59017a1b90d1
prerequisite-patch-id: a618641cd4b7cde40825fa0d4201b6c27e74266d
prerequisite-patch-id: 8b43ff7e81258cc7624800e4bf645458a0f05380

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>


