Return-Path: <linux-media+bounces-23737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F2C9F70A6
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 00:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4159B16C4B8
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 23:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B31D1FD783;
	Wed, 18 Dec 2024 23:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAS9j7FF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6251FCD0C;
	Wed, 18 Dec 2024 23:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734563952; cv=none; b=MTyBe88UDGUb6tiR3Fd6ikQ0cJJdZ7voegJYy7IRHr2TgnT/6qJKFrQpuKnkdPL9yiJ/e49tnvlv+GlqjREo4p46RtkMxVG5u6kfr7V59R+ip9Z4wq4SPH+QZ/4QnfwbeySzn0mM9V41itw4y7fZ5AXFN1QkmOciy7uttTtfAfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734563952; c=relaxed/simple;
	bh=j1nmSz4h9xbZuxtFBuqrqJx2eZckGLAAhtREhszTjdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jRkJcJQ6VRj3SwrVt2qup0wW/tJHD0cQjaWNHa21TjOhs7aESq6LFLrvqdmoGWIx/yh+0OKJlTFhEZSZEDqxupVPcTiPwzUAuRgeaHVOqY+xsxQ0Er6rFh35mILlRLY3IWp4TsoiHjW5YtliQW1cyA7sQWj01adEvAp09/eIfZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAS9j7FF; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-844d7f81dd1so8289539f.2;
        Wed, 18 Dec 2024 15:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734563950; x=1735168750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LumiF4eO+NG7cdcWuV/5Rou+YqcDG+HnDje6/Mwwnx4=;
        b=SAS9j7FF1dw7zIWmXdLbwAAK5WWoeSuGKF7cJx/GEXmcEY1FtTT5e6VcrAAMIIpSEY
         XW9HaVcn3SGN00ytzrm4WWtm2D3S6Rysdgt9Y/+6Dr6O2Eq09aYXxqKQC9Sx3tI4fqgl
         ZGU3IUScAAqkPv0o5pn6wrbKuid7t52HbvtlQeN4GwVfZqZ/XSVcddtDVM9Kagt2HGJa
         D9BIJK+nN1VqQIJZqI4KUSLT8KsUzihQON5YbV9/1fl4dqtEAf3LLWBIa1J6xvWPBPMc
         yYVthuW6/wltMox430zyrvkyWpcOCM7Hcf786Aie6FpFHfVZH1vcWOdr+DN8Dv7wtHzO
         VvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734563950; x=1735168750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LumiF4eO+NG7cdcWuV/5Rou+YqcDG+HnDje6/Mwwnx4=;
        b=HOYcVTdzKsYONyPtVggODPwoUeFbE9uIg8h12krqWRZQAUqJ0/hjPohOFZSopA78C9
         sVF+Q4t5MyuSeXt+UTtUgpRCJUqS6RRkZCSGO6ikbsmQC2+h1lBQZiuNT1SkfdA2yUqk
         Ewlpsz1+p0uVO8u6GEUCfElu0qMLOslDZbb6WpefahmySCWxKBViEU0AQ7bQByG5ziFB
         apUQQn3co/R2XfKB+0guCoAQUCfOKnt7vSVOmatro+mAev9E5+NWqAdzBeRCj8fLq1a6
         fN5+09H1EFqjTJZMjix/Urk3/GcIngIWm1tk7SUh8amNAfZZjsz/NLkXYpeerRUVEAwx
         Qf0A==
X-Forwarded-Encrypted: i=1; AJvYcCVNq1REPaROSRGgKtQV2x9CkMtZq5I3U/R3sKFBnMtOUlfebQCU/fvy5G1YdBP25mgZ4+bHMx8d+owD@vger.kernel.org, AJvYcCWNt04rWyWjtrEo2DfG9iNd1fMDIOhL/hHgi5s+t0xQArrY/FeTLGuf5lYxkAHU1kPshdcVd2BN+p8A@vger.kernel.org, AJvYcCXEixExx/myBA0wL5wfUrUuH2UTviCIaGVASnCHTSBb48Q8Wk1u/ghYiRIlz4wiYP2CMyedax6y6Si/q5N+WQ==@vger.kernel.org, AJvYcCXZLj7aIzKVB6FY4MNkZosryPDPaYXWtX3xgP/BQVArwJy8supQTQGKtCqCvqTUQNWPzAQ3dPVV/o7CYMg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9pjABJJrysece8H5DMlNHDCOJ8UzSsqCCRLXx4sQ+uiu30Vbx
	DaBAzC3y4zYjhlMplc+g1o+JxeXw7UKiFA0lCS0eH3vGIhr1W7+a
X-Gm-Gg: ASbGnctuzem9ux9dzh0pS0E6C5DuMkEFHB3ph7P1cobTob8xyLM7JGASYVoD8qFFU6j
	AkZNSsVVngiUM91kBJ5HVkFHBm5t4ZP9hPDcPKF1YPvrmQXQwBKk0aSGES/ZJ7Ga+lYpbq+KIBk
	RpQWy/hT3JpBap1CnzqE4TK5CV6MY5RaK3dOmGL0PkVSz4niNZvx25qk1j7PdHiDct7R1O2gW7D
	Vk2s/1kJ3+fXQvTXj4ln5cupOzgVCIafAuu1rd8EE8=
X-Google-Smtp-Source: AGHT+IE4t9BbOhd8+vPOlbmAdo0GHKEUU8rVgDhHRtXbpNh5QLqJsQB653IwODnoAsh/hrlyxm9Sgg==
X-Received: by 2002:a05:6602:6d17:b0:841:a652:b0c8 with SMTP id ca18e2360f4ac-84987bdab96mr157328839f.3.1734563950342;
        Wed, 18 Dec 2024 15:19:10 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::eca])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e5e3782412sm2487725173.124.2024.12.18.15.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:19:10 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v9 1/5] dt-bindings: clock: qcom,sdm845-camcc: add sdm670 compatible
Date: Wed, 18 Dec 2024 18:17:31 -0500
Message-ID: <20241218231729.270137-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218231729.270137-7-mailingradian@gmail.com>
References: <20241218231729.270137-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera clocks on SDM670 and SDM845 have no significant differences
that would require a change in the clock controller driver. The only
difference is the clock frequency at each level of the power domains,
which is not specified in the clock driver. There should still be a
compatible specific to the SoC, so add the compatible for SDM670 with
the SDM845 compatible as fallback.

Link: https://android.googlesource.com/kernel/msm/+/d4dc50c0a9291bd99895d4844f973421c047d267/drivers/clk/qcom/camcc-sdm845.c#2048
Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Suggested-by: Konrad Dybcio <konradybcio@kernel.org>
Link: https://lore.kernel.org/linux-arm-msm/7d26a62b-b898-4737-bd53-f49821e3b471@linaro.org
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/qcom,sdm845-camcc.yaml        | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
index 810b852ae371..fa95c3a1ba3a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
@@ -20,7 +20,11 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,sdm845-camcc
+    oneOf:
+      - items:
+          - const: qcom,sdm670-camcc
+          - const: qcom,sdm845-camcc
+      - const: qcom,sdm845-camcc
 
   clocks:
     items:
-- 
2.47.1


