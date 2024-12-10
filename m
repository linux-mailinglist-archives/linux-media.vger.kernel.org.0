Return-Path: <linux-media+bounces-23120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8D49EBF5E
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 00:36:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A59B1674CE
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 23:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D102C225A33;
	Tue, 10 Dec 2024 23:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqHLYepl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E4E21129E;
	Tue, 10 Dec 2024 23:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733873753; cv=none; b=cax9PgML/H2pIIa0tcNs6aG3CQQZJGqtFqBXogck2k0dLQBriUsmaogLlZQUlYK5hZmrm3fjyE+MBiSkrzRTI9gahC4akfn0VNMHfGcoJqyNhbPDXOT4dbKygYP7EL6p7MGoPzMkYEpJQnBwZVLKnJ7Z6+ZiXzcsmcmmEdjAGd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733873753; c=relaxed/simple;
	bh=j1nmSz4h9xbZuxtFBuqrqJx2eZckGLAAhtREhszTjdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RndPmdY925KmajxhuzF0p51+eMFyfQXn8+yMMkvWpicxr01GnTmFVJo1S8qdFSihntMFcZPQ/XPvfoHh0Xli42LWy3X2qMw9Hr36EwRa5/D4AV1cRbgSu7LMtGPXbmF3Yl4nHIQySBsWH/5Gr8/j43E6TB3j4HHHLwVsS0sJYIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqHLYepl; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d8adbda583so69017556d6.0;
        Tue, 10 Dec 2024 15:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733873750; x=1734478550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LumiF4eO+NG7cdcWuV/5Rou+YqcDG+HnDje6/Mwwnx4=;
        b=TqHLYepl96Hapo4hdpKv2/ANiLUa8ZXvt0M0nnYz52Nsz+H8r9QMQZv13xkCvRx+Dh
         lCrqS8938oUFbbPXIgsBslirCuHCmE+FZCcVLEEPaVCDkjAcf8oqZgVuoB9IHbhAvURP
         86xLIAIHkF9ArP16wiQKucGHoRPJpUA/Rbxf+2RHhudzWIgDZ9zi7Usm9u/hlFtTwudK
         liGYPPhImILAq1/dDDDZpkFkXG4N1Iop0mXapAVdM8FSuBjOVLH474DmHxYRAmWNga98
         ExW8rfUXPNCQjGwUreZ/IsGfvs5piQFl5r6gnLN46gl/WVQCpy/Vw/BGVwuNuf5GgO2O
         eu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733873750; x=1734478550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LumiF4eO+NG7cdcWuV/5Rou+YqcDG+HnDje6/Mwwnx4=;
        b=qKKd79mjyEgDEdZGEYC3XTuBZvLkpEzWYWZj2002ZzQC8AbJFs3MDWTdNdGwARb3rh
         dU7H4KkFn08hivXIYrAEEzbsHS3HrJ91vr4i4C/RWylnYMoJ8b0fkJZOjF5+IUA7bMPW
         ho6H+O5BIqgmu+7mgvZ4yVqoPiAuiSez2uMrsdZIS9HxKoL3aE93s6CEjwfDJt5Uuh51
         HnOmni9cHL3pYLOBesCG+4murmNfwuSPqU+bw0YjeUL3J/e7nRRJVHXDXlnf8sr7ek/+
         u+46ts6jlfSZsNtJkemd4MQ/WEyCpb7ypUqkwaSHYM5hVWCg51hYZVSaS/akLycah0FG
         g42Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbBfz8FI8QRRiMyadea7thTVJZ7XewRGpwrDP8SWYEPx/NJzPkHRV+PHlq36tytEE3yqYny+6Sk878@vger.kernel.org, AJvYcCVlBIqx8XSkzbK4VGy69gzrJ3SaCETPReRcMemnhKXejdp2NXq5z8tCiizZi5asYHmj3tmgCvBSbhoxiYs=@vger.kernel.org, AJvYcCVqQv/BCYYTk7CC5rDdEBtdwAJ5hRw/uOzJxdAus9ZhTF6LswF6uTRBdzT4szAaMLiJu/fnDpsPRFm6+iBKoQ==@vger.kernel.org, AJvYcCWq4XJd7uIaYXVn1tCOTCVf/x0v6o0SFRXM2Y/4KKkXTAjZmqxTSLNMg1npH/s9OsRU81j0azhsfTwo@vger.kernel.org
X-Gm-Message-State: AOJu0YyL76iojla4300rgqGBsv0BoMel9CmKalgkrBP0tIcnp6X1XD1F
	eJ/b/PsdlwB+9VofLVmPVLeVA6N+9PRBzR/ETxcmW9Y6zkIewP9f
X-Gm-Gg: ASbGncuJwxI9xta+hNaTw54kUR07Out6hwJE9FL+XnrMgen39E8QMgK8zY5A6xbaz+J
	5CF3HV00EhzO2ZfXZQp6g1PA8u2dfh9HuJ+43/O/lRrkDi9VE7yPiSNOxpziKz9aM+qbxx0d6Hl
	RJXwXFFJrNulj8lCtr5KHrNSNu/jDGCEWTLszU6JK8kfBT0nH0C2/Y41kB/JXYUnQR5bXLdbiI7
	0s2vEszvjCwU+EkZwHCZ4dsU5XeZ0/O9hfIGnZZwQ==
X-Google-Smtp-Source: AGHT+IGh2a2jn62iij3zp2LGdcGLV1AuZP02+mzsylMpP6HrtGNttL3u8FTOzSkzoIvLkGgAREx2Ew==
X-Received: by 2002:a05:6214:5190:b0:6d4:4100:75a1 with SMTP id 6a1803df08f44-6d934be0752mr14825996d6.39.1733873750662;
        Tue, 10 Dec 2024 15:35:50 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::6d3f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d930b41334sm6372596d6.21.2024.12.10.15.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 15:35:50 -0800 (PST)
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
Subject: [PATCH v7 1/5] dt-bindings: clock: qcom,sdm845-camcc: add sdm670 compatible
Date: Tue, 10 Dec 2024 18:35:36 -0500
Message-ID: <20241210233534.614520-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210233534.614520-7-mailingradian@gmail.com>
References: <20241210233534.614520-7-mailingradian@gmail.com>
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


