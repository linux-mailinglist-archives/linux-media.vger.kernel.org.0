Return-Path: <linux-media+bounces-50091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E352CFBF5E
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 05:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA4DD300EE77
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 04:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC7624E4A8;
	Wed,  7 Jan 2026 04:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R18fp8af"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CD51F0991
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 04:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760233; cv=none; b=liBsplQr1k1fiCDvZo2eVvjDqJw9LDCyY7JMACLakDOtKR/hY15vdneVAOuG8RVKQgnoi82UHQfMDrWTKHiE6DinCY34NqyOaLTmWiuOKwVAkorxydF3WUthw21FdbMOiMc54/5o0Qb3E486MzT2kUxdCDMCAS+YgY1TQRxk7MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760233; c=relaxed/simple;
	bh=J9Fz7sRtOqzGWUn4OaalbhQscMbkEKJaXUTx0SI3dAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZyhgCkTyvyOcvyytjpcg+tZw4qQ8O3pGF1rmf9BYPOZCCnwD3y1kwlhjMRIejTGh7+4C2TOt6SfyfJ8gF2Rhw6/MZ0gUBNd+8frynbCs5Y7WiOuryIT5/FtUie13n0vZMSK1TkwaRMnuKSS9zvHEq+NufNIGnvSNIcREbbu09I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R18fp8af; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8bb6a27d3edso149147585a.3
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 20:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767760231; x=1768365031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IF0PSXd7nxzcgib/fF2QxJQOQ3zAiN3r11lfYK9VD2k=;
        b=R18fp8afWgdLQq2YpIcpyl7GB8W+qc5jhai+abXLs2hLpONAo4oe71rXsoNY7nDWJK
         RvAV3YvTozO+pXJ1jju936Lpb/iOZacj9uQT5ewHptvZhCWhonaj8MIdXxbsCXTHktY7
         u5H1n8BXZ6/Pm6nXF1cZCEcTWiw60QYiz7L2KNKHWa4iYgIja6chQG1dkckyCKAttW4v
         hYJVbSTVVqZTg5kVN564rGyeEcYkd+GRT+jhWbQgUaMV1Q7PwDUDpHCNJM+SRIgoxJfM
         feIXTn/EvbeuD+y8hQrgjIhqAOnBuKlH2EGXLc0fyehsFlUVvHbYWuc0SrasmeTP87UG
         c21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760231; x=1768365031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IF0PSXd7nxzcgib/fF2QxJQOQ3zAiN3r11lfYK9VD2k=;
        b=S4x8mIqJT5AubLwCJ+273FAeEqdmFfFgEJnWGUaX0kRWsdolmfNUN8t31VOyA2BWh5
         NQgWxeLn46lPIe0gUDT5PMwj2qffHEcDWqmDxbtZmPJTCpV0NEmpVY4lpFS2UJ4rffP6
         jnoZ+0kfesj1spmITPW4CzEgojeDJkNcYYsbWnKl2xPRehOqlBzIOMnb99MexBKDdKEA
         jNI95ENpWIWPVQ6dHv3UwNeNeZOfeyQka+hvztX27f90m+n8z6ce2r6FSGKfnt9XnhCj
         NbLH/VGf19pqvxgxZM62iYCsMFMuf6xRVNRy+1lgLCzAiC0PZtnohYfPc7wyCilgXDC7
         iM3g==
X-Forwarded-Encrypted: i=1; AJvYcCXQJTqWfCa3OVL4mrXB8hB22b0bb5TgxlEJ44j8miJJTr/FjhGQ4sudtD5m3d3fVHyDhc37jvARXYxPpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YynZxXe9UXPMxeSLRCQwgbzczton0FVVivji7+F6G4hUDwUmO1F
	wNuF5F5FxkY0EAJ/JFtHymUXo2ciqedE/k8yARQ3rl4rULCCGO8uC07j
X-Gm-Gg: AY/fxX50ZLXsXbaXIjleV+Su3p9diUUp4Zd0NsmkR9W5v7n03sbtjSjwapOi3ylSI0j
	ghI/2JJDGoAEScIhKUQXZuh60eA18RLlOEloGg7S0oC9OQmqtnS5NNVMIE9s+fzWkHISEkxEmFb
	8pBekg/0QJEYAVbWLx4rEZCs+rPNM9PF0R8mlhlvgjDA6LzPbzq88W8tz0MXl0g6++RQ/ZFd9QX
	51/Wty8xqdeOzxCyDQbBU6aYgR+9Eh8UIEKCAvSSeiN5/1WqutFImm04VOcEUbqtpA2dbJFKhiP
	IZdSiru3rf6fShOgZGKzO98lF7I66DZQyFdY2X22EsoX/bDGvRYHzboPphzxKN05w9jDe9CTKBZ
	g3piX3ht3+wvCrBjyGUwaBvMQXhy6jjCZ7+NHj7SuQucDJarDGnWaZPZzjuTZ89gy2hYXTi0+E0
	umzPQbrfi7FjyodaoyziMGQI7yAox6BmVURjZjHTHnJo7fOH0kV99jr+mDwyku6bFUUxydiDbiK
	d0=
X-Google-Smtp-Source: AGHT+IETyC4X98OhIHBp46gznYzJBy3d02/tkM3F4X2Rh0LLVtLU+yZjpl9/TdjSUKepyeyPRAiyrA==
X-Received: by 2002:a05:620a:1904:b0:8b2:f1f3:900e with SMTP id af79cd13be357-8c38941c68dmr155122085a.62.1767760230642;
        Tue, 06 Jan 2026 20:30:30 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6441sm309316385a.7.2026.01.06.20.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:30:30 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 3/5] arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
Date: Tue,  6 Jan 2026 23:30:42 -0500
Message-ID: <20260107043044.92485-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107043044.92485-1-mailingradian@gmail.com>
References: <20260107043044.92485-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Endpoints cannot be pre-defined since dcf6fb89e6f7 ("media: qcom: camss:
remove a check for unavailable CAMSS endpoint") was applied, probing all
endpoint nodes and requiring them to have a remote. There is no sensible
remote in the SoC devicetree because camera sensors are board-specific.

The ports are meant to be extended by a board devicetree in order to
define fully configured endpoints and connect the ports to camera
sensors. For nodes that are only meaningful if extended, labels are
usually assigned. Label these ports so they can be extended directly.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index b8a8dcbdfbe3..3eb4eaf7b8d7 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1776,28 +1776,16 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@0 {
+				camss_port0: port@0 {
 					reg = <0>;
-
-					camss_endpoint0: endpoint {
-						status = "disabled";
-					};
 				};
 
-				port@1 {
+				camss_port1: port@1 {
 					reg = <1>;
-
-					camss_endpoint1: endpoint {
-						status = "disabled";
-					};
 				};
 
-				port@2 {
+				camss_port2: port@2 {
 					reg = <2>;
-
-					camss_endpoint2: endpoint {
-						status = "disabled";
-					};
 				};
 			};
 		};
-- 
2.52.0


