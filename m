Return-Path: <linux-media+bounces-1467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 876FD800722
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 10:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B766F1C208D2
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 09:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3642A1D545;
	Fri,  1 Dec 2023 09:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="FHU+4D2j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EADD210B
	for <linux-media@vger.kernel.org>; Fri,  1 Dec 2023 01:33:48 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54b545ec229so2201744a12.0
        for <linux-media@vger.kernel.org>; Fri, 01 Dec 2023 01:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1701423226; x=1702028026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTbESXzcXZ37/AxtizRE/kwCz5vVYNKpF/F7wAyS+CQ=;
        b=FHU+4D2jfOed21rv2GRbIh5eCFWePtkFS4/1YT1fFDfLl6PM5vuIzNJ6VtzjVcrByC
         KZQzEBAZGglRUyDL77gtZ6XDcVe2UAFTQgsKRc5Mq/iCf0nYlf0j1lIe3JRQZiR/QLn0
         tOpdOscWM7Ows1ddqtYYqmoknObhETrAhzb+M5a6aiyEN6Sy4TAvm7V+iuCcblqqZRMS
         l71ht+NOOuHJwdEYZX868VUkzNn83sMqqooFyYF6ztCesc7Fb8ZSXQU5RmdEwCpU+cQ1
         VjmpcWmPYPtHNFBhPli6fth+H693c6y8zStpKMM6S9QqTMvTTiR2yAlAvsXa0eoYZ0Co
         6jHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701423226; x=1702028026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QTbESXzcXZ37/AxtizRE/kwCz5vVYNKpF/F7wAyS+CQ=;
        b=olzfqDRcvc75zufHPrJ7TfBvjt/axqfjYiLIQty5Ddr3Pbvvi3C4ldR56rC9FeACe7
         s9Ua53/YEP59Jt5sZoQv5W/kV6w4rI5QvR8rRsEijqCVDlMSvbZ66MVfnKpOr85tT19C
         zI35OVo3mASWLJwLm4+HDS4eZSVZe8XRU1V8/Cl3ZQutgQVEIQWe+iRfK91ULokOGqpr
         RL5j2D8t8PgTJjnLk7nItHP01b17FgBrI+YpQ0MIfl7Y40AzwMvzIWKF7GlOUdbie4M7
         dqo0mc93YXNnFWR+n/qojL8k2AiAv94+vx0jxswXZ/ta7k9c9VhoBGw2fah8ap0ZTcS6
         QFrA==
X-Gm-Message-State: AOJu0YygQsL6/9UWljCrXAldNR77dmvN/Q6l95ImdMS0QtBwXzLr5B9U
	m/LLCRu/DbRAEuCVi14f84S2Bw==
X-Google-Smtp-Source: AGHT+IEzLImOfl+SUEo6jVo606UYx0ucUdZyTVpCROkXcLzAMFsH7RPCUeL8vivDWmRZ7rZQP1JLUA==
X-Received: by 2002:a50:d4d2:0:b0:54c:4837:a663 with SMTP id e18-20020a50d4d2000000b0054c4837a663mr468061edj.80.1701423226576;
        Fri, 01 Dec 2023 01:33:46 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (dhcp-089-099-055-216.chello.nl. [89.99.55.216])
        by smtp.gmail.com with ESMTPSA id b16-20020a05640202d000b0054bbc6b6580sm1423708edx.31.2023.12.01.01.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 01:33:45 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 Dec 2023 10:33:20 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable
 venus node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-sc7280-venus-pas-v3-3-bc132dc5fc30@fairphone.com>
References: <20231201-sc7280-venus-pas-v3-0-bc132dc5fc30@fairphone.com>
In-Reply-To: <20231201-sc7280-venus-pas-v3-0-bc132dc5fc30@fairphone.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

Enable the venus node so that the video encoder/decoder will start
working.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 762c5db29520..cc092735ce17 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -688,3 +688,8 @@ &usb_1_qmpphy {
 
 	status = "okay";
 };
+
+&venus {
+	firmware-name = "qcom/qcm6490/fairphone5/venus.mbn";
+	status = "okay";
+};

-- 
2.43.0


