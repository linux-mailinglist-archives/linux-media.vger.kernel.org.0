Return-Path: <linux-media+bounces-50820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 348EFD29268
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 00:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6247830092B6
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 23:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81726299AAB;
	Thu, 15 Jan 2026 23:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ez2b2s7T"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866EB30F539
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 23:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768518079; cv=none; b=JfkTuWeS60nOOM3t2G67ZpTL66007Cp51sH8sNQjVlrjGYRFbVrOrw96j89BtYpXOVeSnjzOTvhBaHDJWlf4PWCIURXtu4D7LbhXPCypiubDCbHq5aPvTvkey0uCXLObBcckCjLSsaZrOVr0RYoxK7Yb3dKIYbnVSp0gskch6a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768518079; c=relaxed/simple;
	bh=hmjDdMIvJII09su1AfdyBY3F9dIxOKhmYB1PRX3NbLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qE85PQoXhCK01fLk7LMekwGWeHVGYc62yC0egPBCJmkagzVw5AhEj4vT+CgvbWlxUQi1Vn5+uJSHzlyumny55IQwLlxREaxH8X+vfPbf/ur7sqkcs7sutxTrSwEvarUqCtcWhsA3fsW+pFdVtlVWuNQ9gzPYRe3p08bKQ3oMOHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ez2b2s7T; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b802d5e9f06so194970366b.1
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 15:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768518077; x=1769122877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hmjDdMIvJII09su1AfdyBY3F9dIxOKhmYB1PRX3NbLg=;
        b=ez2b2s7TThV5sA6MBZeefm4oNXkakZtxEtTYOOE4FhqcCPei3e3qdkXjwnCMMlha4K
         3GRkU0dhgzGuQTWxwc1D1f+tQ4AgrvhMD/DrE1AwhnRN7YTWeHmglLhfmIKpHJK43aUW
         wZrZZvxzYd9Wg8Nh0bsR05wOU0MXZOX+aDJcp5g+3H7sQtl7ayZsNSVkJgOkNWkFlhGc
         HivgE5Ubu9BNxZwiH241XGXt/870jn7aQvThnheDgyO/M41yA9+bywTqJAknvQ9shyOz
         OqQfofn4kIQbbtHqt9hzLnTTBu3QZkjMf7hml5YAQ2wgfAw0rJWSwPNlWWim6VBxz+jP
         5jaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768518077; x=1769122877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmjDdMIvJII09su1AfdyBY3F9dIxOKhmYB1PRX3NbLg=;
        b=I3aeM1In1KWKN1hDVzjvZQsVz0KYCBL1luIpqBrWrDLBPeQj+0y3C6KbD819FO1jbA
         K06TRUhpgHxbZVxy3YXUCq9T9Nog8wet0l8m52TJrh3QohpDun1nyQr0m0qoJ1P83tFd
         zDfzlapuUNba4zHtB5O3hCDc3iI8zi2bPPTFvXAxW5fIN6TkGZy9XeCAevgA+UQJWt7F
         P5sBGJJ5Dv8FTKSOvSgGt2SNgeyh8ZVIqaAHoMiQfrnqEsEf5uCzBWtcMYzNc/JHw2F0
         CaOgULOzNNYfBY1QQq7Dc//xza5OpbyjvjKOOTICfkoooTPdrY1m9EioPNdbk/1/gXAA
         3Mbg==
X-Gm-Message-State: AOJu0YyUV9KQy4DN0OcvYCwmwKkpSeJpJV+fppGAO4I+KnLhhOU3E90p
	vDMazagxsSRR6uTOGhnxhzLleMlCHt8rO6pMxQHYZZsdeLD2oFeL85bDEcCSjw==
X-Gm-Gg: AY/fxX4tMhSpa0d1assjKBFu7ESiYA7u5yqj1idg2S9nZ93/Cr2bOtzcFYMydSZ4Erd
	zdUjujT2LvW6vcOBI2GZ7rXnzA3P7pTqVHdTOoPKoVeuiy0fz1Co5p3WVkqotOLm/54ORc7IIcG
	EFacxwTf8NKztS2UBX6718m2HUYx/YMvFAJpajl/F+EKR1UkoD6EMSvz5MbIoA6T884cnnOAA0I
	QdXBy+mfi8VriEwCQCveOr2wJ1AaPuudJzFfsTpNEZshY4rPQT8hR24b4AJM97J+NAkem3yXrjm
	QO+lzRRAYLIzDtDhZzw44De2FlhIHygUdTy4gpMukshgIWaVxCoSJPF48UdZJjDi82XoU96WRsj
	5SvskHzV456EMldpQYbzAUtx4L3D5US0AxgC3bbHZXk1hJ9Ev5yOQSem5AAlKNP5UFwbPAn+WTk
	f+8cBHQI5vo06H2VKvh1lBnSn8G7NqTDCaqWGOfi5QKuuFf+88S8Ul5ZLLoJ00mJITsA58fTYbH
	igXnitVYS7vN9rxU/QzuA9TkKf4IpFQ6QVywzo0KZ8E59EuQfuCcD7DPxEgVMMqEx5PR91kvaHq
	EKXPXg0BoFxNtIK6fQD6cVmVKV1TSVqLKOE=
X-Received: by 2002:a17:907:d7cb:b0:b86:eda4:f770 with SMTP id a640c23a62f3a-b8792e0cda9mr107656766b.21.1768518076435;
        Thu, 15 Jan 2026 15:01:16 -0800 (PST)
Received: from MacBookPro.speedport.ip (p200300e927012f53d1aa14657f634ea0.dip0.t-ipconnect.de. [2003:e9:2701:2f53:d1aa:1465:7f63:4ea0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm58182566b.69.2026.01.15.15.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:01:16 -0800 (PST)
From: Nauman Sabir <officialnaumansabir@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	Nauman Sabir <officialnaumansabir@gmail.com>
Subject: [PATCH v4] media: docs: Fix typo 'hardwares' to 'hardware'
Date: Fri, 16 Jan 2026 00:01:15 +0100
Message-ID: <20260115230115.7761-1-officialnaumansabir@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix incorrect plural form of the uncountable noun 'hardware' in the
legacy DVB audio documentation.

Signed-off-by: Nauman Sabir <officialnaumansabir@gmail.com>
---
Resending as a standalone patch. Apologies for the confusion caused by
the previous submission, which was incorrectly sent as part of a 3-patch
series. Each patch targets a different subsystem and should be reviewed
and applied independently. Please ignore the previous submission:
<20260112160810.19051-1-officialnaumansabir@gmail.com>

 Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst b/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
index 81b762ef17c4..99ffda355204 100644
--- a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
+++ b/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
@@ -444,7 +444,7 @@ Description
 ~~~~~~~~~~~

 A call to `AUDIO_GET_CAPABILITIES`_ returns an unsigned integer with the
-following bits set according to the hardwares capabilities.
+following bits set according to the hardware's capabilities.


 -----
--
2.52.0


