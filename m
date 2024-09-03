Return-Path: <linux-media+bounces-17439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C87969475
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 09:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95C831F23D8F
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 07:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F92E1D67B2;
	Tue,  3 Sep 2024 07:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pcpartner.com header.i=@pcpartner.com header.b="PSLBjKcY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221531D6194
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 07:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725346846; cv=none; b=ZL4sTMP7hoAFcu+ILu0DnifPFJ9jwLDjv7ls+zYvTSB1E4U4dLw+vGEqMwjc+EhRyz9elrjGJNZVARpfaCe7zBDTGjkWtMfCAlg2LipMzNVQQjxpEfrTAZzawIy81KpvS/NP9ftE7jct4fkpa0/uLBW7w3xD0tvrVRNNVkFTz/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725346846; c=relaxed/simple;
	bh=hGrzfHbiFeQwplQfHRuqfionYR2SV9Aole+yEKnBYxQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pr4IuRhQBrFu+px7c2lAQpRLNY9zZJwOrW8LbXSzBXZCkNxqi2kUwBViJAxYDsCPIYASn8sJ7LhotDpOl99ggtEtoYkgP0J0KT/3cMOzviJW+hwCJ/o33CYwRzERGx6+1loGPs6WpcopXrkof9yvEGxg13HzgwIChy2w4j+iQQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pcpartner.com; spf=pass smtp.mailfrom=pcpartner.com; dkim=pass (2048-bit key) header.d=pcpartner.com header.i=@pcpartner.com header.b=PSLBjKcY; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pcpartner.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pcpartner.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20693995f68so3934935ad.1
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2024 00:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pcpartner.com; s=google; t=1725346844; x=1725951644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j8a4ojrmLMokmBWyMIcMsyorQYvgVB1/emSLd5oJg10=;
        b=PSLBjKcYW83M245D8VRvAbz7emDux61du8Q9lqJfcxAo60aR8o6fQxpUYZMARGgDT+
         6Yry/gr/yhMYUp12sHP9uPTILpFXqOkFSDkcEVfVxFlTRnRdLLI9zEemYXb7aHz4RrDr
         QCLjVRe0lkGq4eZd6HAg/Z0wknmBNxcbj45Mv21G629YKWgJmPfkFY9BhYMgxJWQKV5K
         IxVNMv1wu6iLumjLU5/1Li4quJbcrIuvWPTUW/3JbdWUG+7I+i3qq9pQngtLcC1Vvzbd
         yyJK4b7iFnbHtgGh+7eqvNIUtYaO3n+dK8lCYQ3hTWKszLmnNhIlkHYrU/y2XKDiMU+B
         appA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725346844; x=1725951644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j8a4ojrmLMokmBWyMIcMsyorQYvgVB1/emSLd5oJg10=;
        b=kuVNMQ1XaMAJmyzIfMP3LBzOkAA/xIxBOnHa4BY5HT+H3/F7Ky5UVuzqRvU/W8Y5Jb
         615KYn6Uh9XjUogQoyefkdAwEU7ORG0CDG+cYR6MzgCL2sOZPibIzveSj8ux0yZZNkXj
         d07HgtBJTUZqbzAbTijoEITsqGpO5NNQkFPqF0h6PX/6a1DoQOgJkIw3A6Mk8CInFFkb
         kDjncfFL1uc2i0InqrKbpz0XN6PuLi357dwv7UHeNsedWi4Fg9hwxILgndYm4se7iu6l
         fDSkGYKPHZFCwKAfdfj+Unr8Hl+exuTBwzvg0Ke68V2wVz+St8i+sdrgISQV4jvvE7Pd
         828g==
X-Gm-Message-State: AOJu0YzuVPmfhZZiUSR9tmkN2cx/Ek7Uqs5dY22CMHy6/dKdOryZeAVR
	NeCKQ+DcExw4MmQB5tZdzawEMNtdLfdjOeJEYCvfauHYsRhOgZIc72U6qmhEEg0Jvxf7x7dGrZE
	V
X-Google-Smtp-Source: AGHT+IGqL8u7zfviynNKF6oYsc+ImfDslmD6JKytm8koNxmaZaoGVJgm4W0J1T3sNYsZcSRt3qNgcw==
X-Received: by 2002:a17:903:3204:b0:200:abb6:4daf with SMTP id d9443c01a7336-2050c3bcf1emr136452975ad.39.1725346843992;
        Tue, 03 Sep 2024 00:00:43 -0700 (PDT)
Received: from frank-desktop.. (220-132-35-81.hinet-ip.hinet.net. [220.132.35.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205501addfesm42834425ad.80.2024.09.03.00.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 00:00:43 -0700 (PDT)
From: Wei Feng Lin <franklin@pcpartner.com>
To: linux-media@vger.kernel.org
Cc: Wei Feng Lin <franklin@pcpartner.com>
Subject: [PATCH] edid-decode: Fix Visual Studio builds. Add utf-8 option and parse-if.cpp file.
Date: Tue,  3 Sep 2024 15:00:40 +0800
Message-Id: <20240903070040.6283-1-franklin@pcpartner.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the /utf-8 option to resolve the issue of not being able to compile parse-base-block.cpp.
Include parse-if.cpp in the compilation to resolve the issue of missing parse_if_vendor and
other functions during linking.

Signed-off-by: Wei Feng Lin <franklin@pcpartner.com>
---
 vs/edid-decode.vcxproj         | 3 +++
 vs/edid-decode.vcxproj.filters | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/vs/edid-decode.vcxproj b/vs/edid-decode.vcxproj
index 7b840ac..2c21187 100644
--- a/vs/edid-decode.vcxproj
+++ b/vs/edid-decode.vcxproj
@@ -59,6 +59,7 @@
       <ConformanceMode>true</ConformanceMode>
       <AdditionalIncludeDirectories>$(ProjectDir);%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
       <DisableSpecificWarnings>4244; 4018; 4267; 4996; 26451; 6385; 6001</DisableSpecificWarnings>
+      <AdditionalOptions>/utf-8</AdditionalOptions>
     </ClCompile>
     <Link>
       <SubSystem>Console</SubSystem>
@@ -86,6 +87,7 @@
       <AdditionalIncludeDirectories>$(ProjectDir);%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
       <DisableSpecificWarnings>4244; 4018; 4267; 4996; 26451; 6385; 6001</DisableSpecificWarnings>
       <RuntimeLibrary>MultiThreaded</RuntimeLibrary>
+      <AdditionalOptions>/utf-8</AdditionalOptions>
     </ClCompile>
     <Link>
       <SubSystem>Console</SubSystem>
@@ -97,6 +99,7 @@
   <ItemGroup>
     <ClCompile Include="..\calc-gtf-cvt.cpp" />
     <ClCompile Include="..\calc-ovt.cpp" />
+    <ClCompile Include="..\parse-if.cpp" />
     <ClCompile Include="getopt.c" />
     <ClCompile Include="..\edid-decode.cpp" />
     <ClCompile Include="..\parse-base-block.cpp" />
diff --git a/vs/edid-decode.vcxproj.filters b/vs/edid-decode.vcxproj.filters
index b98ab04..0b78516 100644
--- a/vs/edid-decode.vcxproj.filters
+++ b/vs/edid-decode.vcxproj.filters
@@ -43,6 +43,9 @@
     <ClCompile Include="..\calc-ovt.cpp">
       <Filter>edid-decode</Filter>
     </ClCompile>
+    <ClCompile Include="..\parse-if.cpp">
+      <Filter>edid-decode</Filter>
+    </ClCompile>
   </ItemGroup>
   <ItemGroup>
     <ClInclude Include="..\edid-decode.h">
-- 
2.34.1


