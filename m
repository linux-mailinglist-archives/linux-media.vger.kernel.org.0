Return-Path: <linux-media+bounces-44087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA1EBC8FFA
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 14:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA1FD188729D
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 12:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868042E718E;
	Thu,  9 Oct 2025 12:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="dUSTjMGl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1305E2E22BE
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 12:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760012634; cv=none; b=GKJshveABLyK4+Qp5QoplToB7+DCw/Jdec9z5eLYP9BRKOWizU6cJp87vgjD9+ZgDepgZiRVa8S8y0g2nH7UzeXwQUAwoUQjVCU/+N2XeZl2anhZMxmYvnP3b+atQbVdgSRVpDj+giUvPav2ZOeoLPQjSah+wHOnlc1ytvpNgoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760012634; c=relaxed/simple;
	bh=cBgHOpGf9VeFSGrcqiaxd/l3eYAbLUXjMw28l5Rsq+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZdteJ/oa4hb/arwfKzuA2b+mVApXkH9wEYk9cz2UsHASu+A1aSj6/d5rQHvCvarHcWiw9xvcMTRDi4852rUZLL9IKBUM6T0Ob89hADuHFbDjtDg7qbYiakN/Q3Idjud4kp30wD77IxZO5sFILmQEVzUQsUeH/X2v5e2j9jzbblo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=dUSTjMGl; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63a10267219so114532a12.0
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 05:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760012631; x=1760617431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sad7OkmyYPIphD94MRcnSFfGS+bDx3BcROEylaCDt6Q=;
        b=dUSTjMGlA99v6IHGKGjUX6am8FnPNjo+zE2lfGDDxdS2rtpbD8q02VMzVDpOHxE2C/
         O1HTKucnJ7N/mcpfXRHig0qf/2SE0xMZkNFngo7shZb6ERnA5FzFUlTO+aI6JKVkO8yH
         NUS3LGH2GXUomHOIzDlFDVmy7P7B52Oay7xrEhR0mEGmbiovkcHOm/H+4obnfgMWRAoS
         +vbe3UXodbqZuop5QFpTYIMYVjMp20jmuYVIUMYr+j3qIkqiEW1cvy3YCqn9lpDfjy05
         1KeC9VqhMOAOvL4Y7gdbX3mxbgd7BsnDACyAIgR9heEkI5JE+I123m8RFQwihvOxujS2
         Mkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760012631; x=1760617431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sad7OkmyYPIphD94MRcnSFfGS+bDx3BcROEylaCDt6Q=;
        b=ktA8sGHNccOyLu+aXcVnBjKhRhlK56emvcAblMOyLd+pcCVsR4dds+tOibMAGya2bX
         A/vRBhXKUcZ390GK2GcGZrWM64/NlUhv/l25pa9Kvk7UkAsWS7e/dUGLGKO+TxED2a7I
         BU/EoirKTGfKQ/nU3U1348vi/gFJJ5zIVsy5yGZrvw/3PIkDxhRYZnQpzABXCvFS9Vmb
         bZzfpEA3Dl8S+zrqC3bseXszyFY7sPjKYLgnDUn54XNvMlz88j0KLmxSTKTqqxQHYjth
         LsfDyfB2ifHH+uKho5oNlJA2IYdiyzc0JL84fjmV9dzqcobq60qBazbmh6u4NgTlVitM
         Z1zA==
X-Forwarded-Encrypted: i=1; AJvYcCUDKgo2UhZqZ8WzxVg5j7EdG6KZms4puIfaBPdmF1oOGL7vwJ+Aj5cav1VZ2EiLiRLJi8UoDcrBwAgdjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmx3q5UL2Pyu+FOFl/vqpitjzOPfC7Y2Uz0hVEJXdE7qf3grbw
	5U9ojjb9b6FitKrJyoGllaZUzNFxPW/zc19eBvUXPNY7D9d6cYXbM4CsH+lL3A4Fl54=
X-Gm-Gg: ASbGnct3EUI6iDss6OXSlgs6sOXmj8xOo0kcpyZN9t1hyUZ0tqNKQHuVQivn1tPepsa
	UF4++Dk9gZ03E1lPRSfkjlQw6qHYGG4N6E+bt6VuYH4OkywCGQzVsEAOUh1bWRpgpwLAn972umn
	f2GKhqakKNwu58kx3yZy3eQ4siDZfDVEwimy9Zm4ZTWeRjbWIJso8i05ulPIZvlH7LzybKqlsts
	w8pcQPq3KFB0HXSN2evIiXG1BhXoiFitHxnymMPg/q1eADJfeMaTDFZ8/JPePaQ/CfhnSF0Myx4
	a7Y6xBgiJett0NZqH+n/En8qtPsO5u7FKUlwjogCDWypUWjY6hXNV0o7w1YJ40nVXao6idpyGgR
	8ldIs7SYw+/RhmZrzRMmduexg3JlWtL9K3W3XBWfHQcV7hrbqEdl5C3sBgzIFk1sbAG6UVXf2Yq
	8Nc7APfO9YF5TabOfjuobqPXb2EQ0x3lYg1uYRVQS6TbvStBXreg==
X-Google-Smtp-Source: AGHT+IFJe8p13JNPmjTVR3QwN1lmenNWhe5q0tF9EJyolpyruIPtUd3zKzLtxYLzkaDB/+FNwepnkg==
X-Received: by 2002:a05:6402:3481:b0:63a:50e:e83b with SMTP id 4fb4d7f45d1cf-63a050eef50mr1091638a12.12.1760012631258;
        Thu, 09 Oct 2025 05:23:51 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f3d09b92sm2231273a12.30.2025.10.09.05.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 05:23:50 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 09 Oct 2025 14:23:40 +0200
Subject: [PATCH RFC 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add cam
 actuator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-ak7377-driver-v1-3-29e4f6e16ed3@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760012628; l=871;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=cBgHOpGf9VeFSGrcqiaxd/l3eYAbLUXjMw28l5Rsq+8=;
 b=TJO0wmW+wAEm7Ke/LN2LnjwB5Fci3lFJ9b5B5+2BIO0R27v9ejoB8EfxUDPSp1kJI3l9ALkRp
 hWQ2lno1C9eAIwCBzD4IX6/37YWV8P+jDtXxtJVmvVamjY7yt1bm28R
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add a node for Asahi Kasei AK7377 actuator, used for focus of the main
back camera sensor.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index e115b6a52b299ef663ccfb614785f8f89091f39d..49654f0f914fbe18080d2f55bb6877c8ab7baf0e 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -616,6 +616,13 @@ &cci0 {
 };
 
 &cci0_i2c0 {
+	camera_imx800_ak7377: actuator@c {
+		compatible = "asahi-kasei,ak7377";
+		reg = <0x0c>;
+		vdd-supply = <&vreg_l7p>;
+		vio-supply = <&vreg_l7p>;
+	};
+
 	/* IMX800 @ 1a */
 
 	eeprom@50 {

-- 
2.43.0


