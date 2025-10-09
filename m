Return-Path: <linux-media+bounces-44086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 34417BC8FF1
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 14:24:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AEF4D350C65
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 12:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5DE2E6CA3;
	Thu,  9 Oct 2025 12:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1WLpsiIi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BED32E172B
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 12:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760012634; cv=none; b=Bv3LWifMOT6JeKDjpPPulf5nnKfDs7CCa+7qHUdUsk7DRQB1lPY+DKyTemn9cqIi1Q4W3Ms1GfmVimyI1fiAg3c4w7V3VErHDaKgbNyAA3UxoSn6jNNko2MHSECaZHyecwDbZyUxfpqJO4ps/bNgmihy3FWd16P86AKNr5wlw6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760012634; c=relaxed/simple;
	bh=92BmjzTkktMcwmDuuR0/4Hya7qrc/cicAQZ7fp0iZ4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vGOmweoaLfEG8vhSKyx8PlVexj+gyAAPB77obkhsWFf4820w2G2eerqh83v9ghf/PGHz11C7TAiMGbPbUsGOTt+4JMFp1U83uEvIVC0Nl/33hosw9kWb+1lCwAHr9a6DKrFsFKwkBRLWqsBEzykYPgxn2UuwIvoJzczehuroB3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1WLpsiIi; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-631df7b2dffso2288182a12.1
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 05:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760012630; x=1760617430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4ESIGC5JXj+5rNkHKRGo3WIWZoFPUgTFIJuXOSXg74=;
        b=1WLpsiIiwaTkeV/x2Xvw1i/VL+SwLjoFfMYGqRGBbHmjkaPDerszS1VTgJsTNvzRIZ
         cwdJAr6WC7r2i5sJLWHBzLXlCnP8Za8qu/jX5g/xzT4NavEUqryiqorpHiOuVECcU2e2
         mLmbCE+E3YlgeKm5K97DcbnoIczFxWLBw19Y8+hrhAGfVScDuxvO0ExCNnOOPwOQ/m1L
         TKKU+2Jtv5IbKJGRMlcnGo0IJUkz+t7tfvb9HUU8nBpJPlUwmd6QkA/hU7IveoIC0bZi
         348RnUtnQZ3GnAR1cVAWBGnvmNegs11ymczUAlfqP6PqUIbkLh0CR4lCxNwTt2pX+FbP
         7bQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760012630; x=1760617430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4ESIGC5JXj+5rNkHKRGo3WIWZoFPUgTFIJuXOSXg74=;
        b=oPtk39pQWyCcSt/C6FW4YB1g3mVrEtw8RzDb8fu2RRmQe/l2GViYg0y5F8ms/yGlrH
         C484+Zr2B9juXWo8TbT1EfJaunO2CBNKJySik7pCZSYtwAzLSkedCWPur9rM9z0m9Lsf
         LQmWXxeRfJ5+rR/YbJquY4CqLP4X9q6qf2Y8K7DwKn1chuFJ7G5+M5250Y3kpA/6uWLJ
         QJhklMB215WG2TRIvSL1GBapkoghKIC9fTxq1o0ZHw2fUo5Z/K0Xwezjg15Osl7587Yu
         i5qvwOvgoqlftK2FB9MOry5tLg6EKL1dK9yeInb1Q5uun0M6nDx1SO3TIWaw1CPWTyxN
         TYpg==
X-Forwarded-Encrypted: i=1; AJvYcCVeH9x2hrtXqUpc3GD56lN5P5z2yeE/wMPH2DQ9WiOtNRu04dJ/U0Qrncgv0DzMP8HGDLIkUTzC2PzwQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsbsxgRUVQzG50ycxReUa8ezxYaJVUGIGNBbOZ1MqcObqM/mMG
	d+NcYbdHz9YjUTgayJrzg4LItuPjCbirrp8bcvR7CPk6VDJcOHcnJZnkPbF4WX1rx2o=
X-Gm-Gg: ASbGncu/R2pgtZNDoBmMm95/I5IKq7uQfxoYMBXea9WXUwumUmOTZH02ktl17Uaijsh
	tqrKgeOGphluC5IS0KWUmDehCHc22vLWfQmR7lswkXXqGdd82uXLa2bhxdroYRopzOBv8cmgrTA
	MWXFHUOjS0+mAcabnQ/Zdb/bFzpv4yB0Q7d/Ywc1h4nrSa0S8pBZzBi0q3jX25RFcd/fIs7Ig2q
	fnobDJtra+LsQo/UUZhZJiImQI0xGaUGSCkVCIBr1XaXVmGDzo72qMf0yLVoBAs5BnurcVxt8aU
	HVxKnPntZqK7UT5Vc2SwVNwkCL7+Zreo6gY/SlhBBhCQQlKvivDWAMv++bQTZNbaAwcK7FXFV6k
	wF0C/vX7oJNymTBfm9G40h5Jll08byZAIjnBYf4lWrVJEB95XQ0FSuIIoaO2CmU551VWGCsNuh/
	qHRtJ06KXkMhIvy5JSXWpKjQ4tXPgu
X-Google-Smtp-Source: AGHT+IENniTshcqe3jJJStJvdAgI0KTDHDHdfB7CmkzhSPQH5g1ZIrk13h0XfNpFk5i36R7taLsTHQ==
X-Received: by 2002:a05:6402:696:b0:639:dcef:9127 with SMTP id 4fb4d7f45d1cf-639dcef91c3mr4667803a12.18.1760012629669;
        Thu, 09 Oct 2025 05:23:49 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f3d09b92sm2231273a12.30.2025.10.09.05.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 05:23:49 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 09 Oct 2025 14:23:38 +0200
Subject: [PATCH RFC 1/3] dt-bindings: media: i2c: ak7375: Document AK7377
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-ak7377-driver-v1-1-29e4f6e16ed3@fairphone.com>
References: <20251009-ak7377-driver-v1-0-29e4f6e16ed3@fairphone.com>
In-Reply-To: <20251009-ak7377-driver-v1-0-29e4f6e16ed3@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760012628; l=794;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=92BmjzTkktMcwmDuuR0/4Hya7qrc/cicAQZ7fp0iZ4g=;
 b=wiGazj0RSHWQal7YYs6Fd+dwKjXU8rDWGrrC87eLCCcRfpVpJoY6/C2rXaEGb/AUC/KB3LqlY
 zpnPZQvXJn1CqWZz3DOpW+MIToM2/MChrklbu31SHSJE7yaRxkjoBm1
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Document the Asahi Kasei AK7377.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml b/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
index fe312cc6a87310fc77216d945e7b301dd98acc0c..c040757eb80c925d796919316c64ae31fb4df49c 100644
--- a/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - asahi-kasei,ak7345
       - asahi-kasei,ak7375
+      - asahi-kasei,ak7377
 
   reg:
     maxItems: 1

-- 
2.43.0


