Return-Path: <linux-media+bounces-5431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB0E85A9C5
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 18:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E9231F22454
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 17:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD5E44C8D;
	Mon, 19 Feb 2024 17:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="Q9MvrLQz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E871446D2
	for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 17:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708363140; cv=none; b=DrcLe9rpu1ZWIEPDYl+Nfc0XKlNDsoi+MziFXbFK5pQITgPFbDWsvEQprOufLGBfNKWSn5peA0sDMntKZh32eBE8zW4C/AnB96wVGjscC1vMkxYJkBLfavMnAiiCmLcFcBEM4++xSuk+Ky1JEJQqn0IUtre2uci9UTfg4lmB39g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708363140; c=relaxed/simple;
	bh=iTLM3uRb+Do/AiNS0Xb0HJmwMZOJkgfTuotbr0kn9go=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=hYdTDffXiHzXpm6g68k6X7osG1uMREpT8mVeygaVTsgASXSlx0OLrRaBHERLAdcLqHIVJPnG8f2EMLO5C43SjFCYXeAj8E1mBSmgrb/xwVVsqOsV/bxqLU6+gD3cy0CAC/EDL2nl2NBDpsW85gitIP3spsRJ96f1QdvUOGY3T5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=Q9MvrLQz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4126ada76bcso3841995e9.1
        for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 09:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1708363137; x=1708967937; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5U9UMku/CkX7+3OIheqbJbG1G4XMMn+BnJs98wrGs/M=;
        b=Q9MvrLQzzNHNQf3ohItSiMw4xmxRIlZI9SMgudEUBgOEIxOlCh4ZLKlLCmZVkracjL
         adiK6AyrnA6K/sd09whYTE741hqQLUEvNUOTO1yiHLz87NBf6cMkBqyEeG5nxv7rp1hi
         Z3/gJ0Q/stqixMozQt4WDsBh/kOepk2+Yne4/lH1ahT+EGCzIwTw3Un23CiEwbZwCuuY
         s2ul96gPltO5t2LH9Z5UzmYdiAxsTol+aS9QvGOWJ8lgR7LVq7RIMUG5FevVJWmkLwyG
         5FWXM9FV5ZZ69l4a3vNKYNNzJeL7iD9jVy50WfB6W+rzG7aiONU+9EuY0up3DHkEr1Gk
         0R4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708363137; x=1708967937;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5U9UMku/CkX7+3OIheqbJbG1G4XMMn+BnJs98wrGs/M=;
        b=mFnHfZ9R6S27xt5DDwSmtYfrDkVnlpNZCPOkZAizVS8+3tdRYiYNy08i5kWgEzVrjL
         l1DUnozIvjEXxjQuRuaVFL0LGiYEWana7cj1rKbpn85fyGsqs76NbsxTBOR6a2imerzn
         cmjxx8wAPHn3FELrEK8FLKd4+k7I2IpdgxQMicO+cCwl1hMsXkmBr1ZlwTyxJVTaHnle
         GOgeJYiax737mYexM8UH0nv0xmlfRerkYsZ0BFehnJxGdqVGNtcnzW0qrHhKOEWSV4Vw
         5OPDaxFyowJCCWn/LuLWfOO8tsDtGbKrcVbZ2PawE0BDu/jc2zJ5qzc5N7rIXBqja89J
         MIhg==
X-Forwarded-Encrypted: i=1; AJvYcCW4Mg1SRJUHO3xsGp9XrEKK20JKK06ttKUoLLocu0LXXNVUECQrfXTe48yI+NHvuyJstmqJ0r9he9hxln9qmyiVWzN75h9oDrJPpSE=
X-Gm-Message-State: AOJu0YwhAIAHYqMwc8wSjgvfMm+MlbIZpIJ6uA+7qHcfcNqL1SvFV0Wk
	MFnLrh2B4d10zxBOa7zNXFjI9pQImIK0Y2K9BFr5UuVFF7eGz7nxkPwK38TL0fw=
X-Google-Smtp-Source: AGHT+IHUfkwhEny4pldBlneSMSVOBEZmWmmqdtsOXfySiNrUjDQ+DcKurzgbN5N5Pgk90iwYbshmbQ==
X-Received: by 2002:adf:ed81:0:b0:33d:3553:d395 with SMTP id c1-20020adfed81000000b0033d3553d395mr3619328wro.15.1708363136742;
        Mon, 19 Feb 2024 09:18:56 -0800 (PST)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id g1-20020a056000118100b00337d5cd0d8asm10847459wrx.90.2024.02.19.09.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 09:18:56 -0800 (PST)
Message-ID: <0843621b-386b-4173-9e3c-9538cdb4641d@freebox.fr>
Date: Mon, 19 Feb 2024 18:18:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: DT <devicetree@vger.kernel.org>, linux-media
 <linux-media@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phh@phh.me>
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [RFC WIP PATCH] venus: add qcom,no-low-power property
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From: Pierre-Hugues Husson <phhusson@freebox.fr>

On our msm8998-based device, calling venus_sys_set_power_control()
breaks playback. Since the vendor kernel never calls it, we assume
it should not be called for this device/FW combo.

Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
TODO in v2: split the patch in 2
Is "qcom,no-low-power" a proper name for the property?
Is a boolean property the right approach?
---
 .../devicetree/bindings/media/qcom,venus-common.yaml     | 3 +++
 drivers/media/platform/qcom/venus/hfi_venus.c            | 9 +++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 3153d91f9d18a..69cb16dc4852c 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -62,6 +62,9 @@ properties:
     required:
       - iommus
 
+  qcom,no-low-power:
+    type: boolean
+
 required:
   - reg
   - clocks
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index f9437b6412b91..2cd85a8cd837e 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -945,10 +945,11 @@ static int venus_sys_set_default_properties(struct venus_hfi_device *hdev)
 			dev_warn(dev, "setting idle response ON failed (%d)\n", ret);
 	}
 
-	ret = venus_sys_set_power_control(hdev, venus_fw_low_power_mode);
-	if (ret)
-		dev_warn(dev, "setting hw power collapse ON failed (%d)\n",
-			 ret);
+	if (!of_property_read_bool(dev->of_node, "qcom,no-low-power")) {
+		ret = venus_sys_set_power_control(hdev, venus_fw_low_power_mode);
+		if (ret)
+			dev_warn(dev, "setting hw power collapse ON failed (%d)\n", ret);
+	}
 
 	/* For specific venus core, it is mandatory to set the UBWC configuration */
 	if (res->ubwc_conf) {
-- 
2.34.1

