Return-Path: <linux-media+bounces-29371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83784A7B7DE
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 08:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14897189B49D
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 06:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C291990C4;
	Fri,  4 Apr 2025 06:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SuJ/HdOA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9398018FC92
	for <linux-media@vger.kernel.org>; Fri,  4 Apr 2025 06:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743748666; cv=none; b=Lb9k6OenLLbhxFBfgQV8H4jrzcqU9e0wsaWLlv1gFOAXyAzwMBcNDL609Y2HKbcvnGsswE5V1xV0OJA3SSh4MHd55UJCKFq0+wJKMLUdEEPMi8AMtgcnKRtHVM8HqkSL9gJlaipBP+ocddzhwASP1PyzqVjgTWq8XI/0H+85QcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743748666; c=relaxed/simple;
	bh=A+EYzZLGQHIPJ5VAoM/+3fe53Af6CgodqviiAM/ONBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LOkq1AKqJTVs637+LFYEDiA80A0iPRYdOY5y5QxCmQgGdnsjBtlPFEZAI2KRntpNYtYEzNu1irypbAuwH1SRhwGrkq+i8EHYzk7bbpHT81/Yj+W67U/8zqPy/1zDGo2i6Gva2+3aCV5rJ3MKwHgzjENiax0nZKg+Af2s57N0khA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SuJ/HdOA; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54991d85f99so2784366e87.1
        for <linux-media@vger.kernel.org>; Thu, 03 Apr 2025 23:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743748662; x=1744353462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAivlvh8Vrg1UGAUIkAMwQONWXUXc2TvgNk5knB4y0c=;
        b=SuJ/HdOAi0xoPXS9rZe+WQUKD8sk6tvc60gxsdCvKk6yPyRLSIriLfMCYqg4Pj5QCk
         bRBW8dADviYbrFIXdIk4B4pfV60J/Iya7N81NGyV6cqaVM3rPuDVWu0owhzQrEN0AfaZ
         mgs2n3FNuXkaStTViPf0gEZOm9Kty5v1kr11Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743748662; x=1744353462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAivlvh8Vrg1UGAUIkAMwQONWXUXc2TvgNk5knB4y0c=;
        b=YckuFQN4H90VQULwPKuVCyx/wqUFLCOY/4OBaD00zCpG39AilCavfLVyMat55JMndn
         R0I9oUdwLn11z0tLOEflurTM9GYE8ivSyk/ENushEg+Sy1CcT1oHxz+Edt1+Xertw6Vf
         COawL82F2JVRBIvHDN0WD/Hj9y7PKwSj7JE4QCaqcyR3tb/T54P25INLQscgXLhl/PD1
         24Ddnmt9CXsWafDqNvbBXHu7pEItlOf6YnyrbKdXWE4gQ+53o15Xm4isztEWDR0Xm1Hn
         B74i5m6f4+CGIX4AteLtKVkt+rj9MvWejvYWeGJLPFREvSpym6MAdyqD6PfMmPMyqI96
         FP7Q==
X-Gm-Message-State: AOJu0Yyr3TyV9wLEZ5jIlY5gN0ElFixj+6Xl5iAdjIPZBzAoXQ+HCq20
	ZPDYIEx+wbdYYxx4ECL1sQ3vb8wTTC2DJa9RjMCdXs+nY/1MW4mohuCjsnQz8g==
X-Gm-Gg: ASbGncuc95nZCHlZVwbxp40FGmlNsi/UYvC0nCGR1iIrVzm5rD++QiPe4vhr8U2hOKZ
	9U/1OfO/D92unwVC9KD14xCYTNehY8lk4VUBx0Qzd9G408qj2zEEkCLdcmzSUd6HzBlAcQlG4J/
	s9vbDFh7AcQTt+yEmmz1c7DWtaBd95Q9UWn6yXJ4S9EvsoSiTAIxJowgKR4sTnV9i3BQwpS7BDA
	wr6CbBQfe4aImKvc/eH6cy74I5KKyCY8UdEOTfPrJQPzXUncIFkzmFee5+U9Bq6135eCCypOdmn
	YtCbL1LT3n4TsQ5A0Duzt45Aa5TYrm7Qmk0VlHM+KplFvakIVzTzH6zu58yYrTfe0QhK4/IcR6B
	YXgZSGuEVA4XdPchGb5/wIdstvP3LQplzNmA=
X-Google-Smtp-Source: AGHT+IF/wt1Uxur7keuKQbSIAvPFmsIoQlSPiqbrU44NDcgTLn1iSIA3tNK/AaEw+pgVlogdaFQe2w==
X-Received: by 2002:a05:6512:3501:b0:545:4ca:d395 with SMTP id 2adb3069b0e04-54c225afc3fmr610345e87.2.1743748659727;
        Thu, 03 Apr 2025 23:37:39 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e672444sm338275e87.251.2025.04.03.23.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 23:37:38 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 04 Apr 2025 06:37:35 +0000
Subject: [PATCH v5 2/4] media: Documentation: Add note about UVCH length
 field
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-uvc-meta-v5-2-f79974fc2d20@chromium.org>
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
In-Reply-To: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The documentation currently describes the UVC length field as the "length
of the rest of the block", which can be misleading. The driver limits the
data copied to a maximum of 12 bytes.

This change adds a clarifying sentence to the documentation to make this
restriction explicit.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/userspace-api/media/v4l/metafmt-uvc.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
index 784346d14bbdbf28348262084d5b0646d30bd1da..42599875331c0066cf529153caccb731148023b9 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
@@ -44,7 +44,9 @@ Each individual block contains the following fields:
         them
     * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
     * - __u8 length;
-      - length of the rest of the block, including this field
+      - length of the rest of the block, including this field. Please note that
+        regardless of the this value, for V4L2_META_FMT_UVC the kernel will
+        never copy more than 2-12 bytes.
     * - __u8 flags;
       - Flags, indicating presence of other standard UVC fields
     * - __u8 buf[];

-- 
2.49.0.504.g3bcea36a83-goog


