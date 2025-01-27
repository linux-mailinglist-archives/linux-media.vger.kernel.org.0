Return-Path: <linux-media+bounces-25305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1929A1D2F4
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 10:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E434E1887308
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 09:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D924F1FCFCA;
	Mon, 27 Jan 2025 09:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAcEMN6Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06B71FC7CE;
	Mon, 27 Jan 2025 09:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737968765; cv=none; b=MOLTdinGZPKYtvK6hm0Q+humrUI51+Mcafsnsc5OxHpy9ZJwFXEbl9GDB/AgxxYmEKttsZ8CJkvRJqwS2gIVGxXOSHp6t2oQcoQAjvWHOBp5tyMckXqpP00HHF0rzMIZyrw+lZXbKpB/MkqyClKt9PeyY/+srsgPiOn/6e8ACiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737968765; c=relaxed/simple;
	bh=SukDgyS9VAl+z7iufEtS0otwAMfEUstLOpa3Dp/FaI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZTkS5QJil+kw62D4LOOOm0wzPFh/qN9Lxz6SyopuLJpY9Ll6CvDQYUAVx50mKk3ASB6BFCpK15hB5TRnpIZk21ubfoZETAyCwrm5tXJtcEHY4qdNz1rTzuXx2ci9GL4gbo2vBJxvS9AXbAivUwYLsykhIRG3KRfBco4kZkLhUas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAcEMN6Y; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2163b0c09afso74654115ad.0;
        Mon, 27 Jan 2025 01:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737968763; x=1738573563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WU2H1WETlXgdZSYyS/pFO7vksos0X8lu0PXjNPAl2W4=;
        b=EAcEMN6YpQ9I++gvhd9LSS+J2/Eah/RrPOj9XHL+W8g58uKMFsIdVgUCSVmtS2wlGC
         fq4GT1q5kovZJsDquiILpet7XMIt7TA6mgGrv70wG+LqK5KOljyVe4zR3/SbnT6hcXrJ
         Z8N5oAZxh3gH6Cw7IXd5RfY76zY7uIoRtaueYtJYNrtzOWdGFm6KuoKOFYn/2YL8n+4p
         nBox7REu5JuzBYSDjBf+QsiDiiDJPWa0JmY6/Oe8ZodTal7htBAvi11yYGwW/Jj7tezI
         1YteMvpT8idKKFOeJL/sJfnRSAUuQ3XjriFQJVTTgg1GPg9BiU175np+PsAeq9NVySAg
         0p8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737968763; x=1738573563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WU2H1WETlXgdZSYyS/pFO7vksos0X8lu0PXjNPAl2W4=;
        b=Vg3CsdkmPLjpebh5LdjpJED8cV7ZfzY3vBxBbhstB6oLSWGV0L/f3kXVLMCC4GCyFQ
         E9GToVmWOAVBn0BoH+HOHRiQ/xSPx0kWlyxEABNju9SlEuwP3SyWqJr2aDt1f5QYBVx/
         vs3WIS/CQGQmiN7P3643z656F/VbyrQJzoIR+DEGoLIRnR67bP5PfcI+UaI5NkAxpFjc
         O1/bsYfVw6D10PFc7XrLsX0MhF9rRuhKdULUT//W74QGJ6FtdIPvFQxqhL37RJjgyxml
         AllAMLyQ6nFnqz1wt4czmvc9FFrssQF8LnciKeNxicgK9/CtXVwBiOlRUomwIeMZWQJG
         BR6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjxk/t8EguXhg64yPeDzWQIQbOPYigye9VoKi2V7y0c+Hy7pDMVLt6cM8BnI42+P82TAO+3UuD1FYIVrA=@vger.kernel.org, AJvYcCWkyljpHRAI2lwZu7Cps90Eduwvq5Mzw+NVDB4MOioxJs4JJVsbh0gSh0SdjS1UssDO3281+E8WFflHITo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvdL0eC5KG2rAoNDrGRQHELgU/5Z1lxBiDdPI6h/+hxZuvxFUE
	f4K0W5O14sVgf0wJtsD/uIXafHTsyg0HZSD2vYj86NBESf7GQUEcr411lQ==
X-Gm-Gg: ASbGncuziJeLMsAp85FAsEJTvojc4ZU8lM1MQ/vPD1/wG6xRo6LyrK5HuOZXlqHgrhj
	j1UN3Bes4192mam9Fr1HQW3UqN+uYN6HLaPfOz4sEeCq5P+ZJ+hvmvfpOUP6sxo+ZN9zexmYcgU
	xO5xPkg0Q3mwqxsdnZgvlFOW3bTFAo9UQrVDXezmIiCscvxUBPrwf6vp+e5wRwb+gs39EYDTs3Y
	EkXV7EzZrqLmJT8m9GBMS4gDf3WzOdEqwv+lh/qZiZhF+if89SoPElOrTiRi8yu2rHXBWKSHxiF
	9ZV5eBEMS3z5IbGw0ExlKULtDg==
X-Google-Smtp-Source: AGHT+IGkD/FOVYeeh/UCL1bgCwLMKXeak33s6IZNSmrSWoJh09xnWtVig4tjJv9lLEu9GEOJ8ShRmw==
X-Received: by 2002:a05:6a00:ad8a:b0:724:bf30:3030 with SMTP id d2e1a72fcca58-72daf7a1f94mr58690607b3a.0.1737968762958;
        Mon, 27 Jan 2025 01:06:02 -0800 (PST)
Received: from Ubuntu.. ([106.216.92.201])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72f8a78f317sm6753478b3a.176.2025.01.27.01.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:06:02 -0800 (PST)
From: Chandra Pratap <chandrapratap3519@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	Chandra Pratap <chandrapratap3519@gmail.com>
Subject: [PATCH] Documentation: fix spelling error in the HDMI CEC documentation
Date: Mon, 27 Jan 2025 14:34:06 +0530
Message-ID: <20250127090527.6728-1-chandrapratap3519@gmail.com>
X-Mailer: git-send-email 2.48.0-rc1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chandra Pratap <chandrapratap3519@gmail.com>
---
 Documentation/admin-guide/media/cec.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/media/cec.rst b/Documentation/admin-guide/media/cec.rst
index 92690e1f2183..b2e7a300494a 100644
--- a/Documentation/admin-guide/media/cec.rst
+++ b/Documentation/admin-guide/media/cec.rst
@@ -451,7 +451,7 @@ configure the CEC devices for HDMI Input and the HDMI Outputs manually.
 ---------------------
 
 A three character manufacturer name that is used in the EDID for the HDMI
-Input. If not set, then userspace is reponsible for configuring an EDID.
+Input. If not set, then userspace is responsible for configuring an EDID.
 If set, then the driver will update the EDID automatically based on the
 resolutions supported by the connected displays, and it will not be possible
 anymore to manually set the EDID for the HDMI Input.
-- 
2.48.0-rc1


