Return-Path: <linux-media+bounces-44724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 494D2BE31CD
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 13:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 962025873E9
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 11:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5D132C336;
	Thu, 16 Oct 2025 11:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pl097EpQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857DB31D729
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 11:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760614544; cv=none; b=b+1eQDtJqsI6CSorEhVXpeDnoC588635OtY4ZYdkX/kiqFgckcltlR5WiExoCo3qGhQf1ZyqsLwMTIxGNPGXy/mZxkpF72+m0w7hvpGR99U2i8vQlMm4J1+ZupLnucuwr1o7F2iRd9T3SIt+B0mMve0cnfqCkwSWGkvOm1aM3rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760614544; c=relaxed/simple;
	bh=xbG5V9tEv0iNnZ/i8NvW9NkRQut9HrLVeTHnAG0X4ZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E46EgbB+v65/fFsF1+GjXAwvhZQsUIcy4PlCQ+x9w+KbRPlqn08tLtZ47vyycrfqp7+Q35hZQYN/57uQ6br4/zqKYaMZnk/Ti9i9MZN8OZkSp0w016S1X6wXws9zxUx92Zo66eNmAbDoxbGm1ue8PbDjP0a7oF+QsJbb7+iGd/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pl097EpQ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63c0c9a408aso953126a12.3
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 04:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760614540; x=1761219340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vu8f8fCt0MWsuHUzy51k4RPrhZOKPcy/Awezjs0+e7w=;
        b=pl097EpQtLuvBGjE+9mRlx9ylNnCYAjgBywkIurZKjNJs/nDya47LMLpH/nUi0eS50
         actO8cvU/dkxTh1TBnJ2dqsp1bceuE4m7KiddCyhQ5pUdcDHXZIGJaJlnfiiXB2lG+w5
         MS2uZuVuDr6OEiI9sWMSe8IjDWa2p2DCKDtsfrM4tdxNDBw8NGaDIv6UjNw7JwzPz44x
         KOfaanJEZin4X9TTYQ8IRpoFqElrmdcKP4FfrvcRd08+ZlLXeRULctpZQOYoIrsefdal
         Wcuw93gii1kgndxFPM3kgQQzmvyvMIGZeYPdnb7T7718XvROZgOim6fswqEn31IrF5Ec
         HeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760614540; x=1761219340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vu8f8fCt0MWsuHUzy51k4RPrhZOKPcy/Awezjs0+e7w=;
        b=W2HdzIGN1+52OsV57sB9yLcgRinFVsNPAQcIXoRfbB1RBFPUr6LQwl4/euftqm5P88
         x9CMnaKCoUPgExfoNlLyz/KmTvw1end12DSer2PcN9fOecoadeM5kw7yNIARXayTUrBP
         l3WRo3o0ajirCy/on3E3CBLgmutBxrXmF1fDqubRoP40a0BsySZBj2fETLkWRWppzrnf
         GLGjUm0sUqHfwyVb6Pk2dXjv2fPxtG/BFByY/CimEmGj4GUwLr4fBTFKfOeyVA9qoD63
         /1WkykCndxZA0Ikkw4wqCJ3346eQY9U62QcntHEKX1RTV4rvNz77+QEYQ/usxeDzMblG
         P6qg==
X-Gm-Message-State: AOJu0Yw+oOTY9w8l+1zMumNQN6jxHBDnLfQfmCFmznSpsqhBqb9wUPHA
	OndsvaOLt2/Ksej6uUcWTVzkRR6vdIEvKG0trlHuyR7Yjo7XiEPX00iPw83f7zXKyRgZrMbmNIr
	OlLJx
X-Gm-Gg: ASbGncuwE65G9RPgcoZ6jjAIqPFUFtKBwHQp109XSQegv+MZpZo+cuW2aU5tMXRVAkF
	fEZIcTzSLdwhIJqqD506yfM6LrFoJh+syA87pDGtE6LeEdIHX82Nqda957IGq5qfCTwLqq5zmLp
	1+qYNcikJmqOiOqepPHUXhHLHTuiyUtKBZ0oZDlXpkUwCW8pt8KjWsa8VZk9IFrkXkcMJc5FKCF
	3qq/AzpGP3vIRmSHhGyWIpkf6mvlnxcgpdbefMRo19nJUdvdjL3f6Hmjlm75ia3K2hvEK5DXeX1
	dj10O8MlRN0U/WhF6FHSqY9SQbKaxdM1AyMj9RNhsHFyHiO1KsUfnXEkKVSahiqyDw3QpJ3sIZe
	eutUwT/XBni4C1xWXed7s9ikXj0JAen/XjGJYOwz3e54f9fDRuM7T31VXQEEES3AStpGflbGtij
	7FX5uafium2fY6tDgAUlUXcMCC0PH9EU7rOGeNT7IALv815psHGA8G4TxDEF1NWt8g72oAfnKCo
	Yg/9wE=
X-Google-Smtp-Source: AGHT+IG95R7JFRd2v+ActI/NjDNDh4NNcA8qbXIRija/gYuGMqRCIiFVus0CkqVcm+WB22fNjagO6w==
X-Received: by 2002:a05:6402:d0e:b0:631:d76b:4c3 with SMTP id 4fb4d7f45d1cf-639d5c446admr31151288a12.19.1760614540559;
        Thu, 16 Oct 2025 04:35:40 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b1e89csm15849397a12.19.2025.10.16.04.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 04:35:40 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 16 Oct 2025 13:35:25 +0200
Subject: [PATCH v3 4/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add UW cam
 actuator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-dw9800-driver-v3-4-d7058f72ead4@fairphone.com>
References: <20251016-dw9800-driver-v3-0-d7058f72ead4@fairphone.com>
In-Reply-To: <20251016-dw9800-driver-v3-0-d7058f72ead4@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Daniel Scally <djrscally@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760614535; l=1032;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=xbG5V9tEv0iNnZ/i8NvW9NkRQut9HrLVeTHnAG0X4ZM=;
 b=1FjCb0GNsRmRNe+WZOfkhMfGSrxpQX47RG/5wjFbo2jsV3lPKrzj0EiMLVWhSZKTlI5M7hQXs
 96ytZUaQae2AuleS6Mbt2zpQBZ8Ay7W/EVykf0MEwGVj92IT5oKfaEv
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add a node for the Dongwoon DW9800K actuator, used for focus of the
ultra-wide camera sensor.

Tested-by: Luca Weiss <luca.weiss@fairphone.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 2dd2c452592aa6b0ac826f19eb9cb1a8b90cee47..0e86cd5ff527925c7dba15c4e0ee5fc409fe4ce6 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -627,6 +627,15 @@ eeprom@50 {
 };
 
 &cci0_i2c1 {
+	camera_imx858_dw9800k: actuator@e {
+		compatible = "dongwoon,dw9800k";
+		reg = <0x0e>;
+		vdd-supply = <&vreg_afvdd_2p8>;
+
+		dongwoon,sac-mode = <1>;
+		dongwoon,vcm-prescale = <16>;
+	};
+
 	/* IMX858 @ 29 */
 
 	eeprom@54 {

-- 
2.43.0


