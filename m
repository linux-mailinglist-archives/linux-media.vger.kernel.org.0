Return-Path: <linux-media+bounces-41406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 140F4B3DD94
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 11:04:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EC607A4445
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 09:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BC22FF150;
	Mon,  1 Sep 2025 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LMG/FE5B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4313009D2
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 09:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756717483; cv=none; b=kNyNIwH+G4Xq5Gb15qteHBNQUSSskSoe/8BF2jpx1H2+p/ufyQkfoI/urXGK+420Zj51e0i8xxozxoe80uAu81uNl7lvgryf/Z6U5llf7vcQJhzAbuTGi3LS9dVDt5EImBYnzN18D9S33WPZmseP7Tt6w3mycpL+lHA3x3du79c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756717483; c=relaxed/simple;
	bh=ylfMvwdHcWV67FG167GMSdGd2pzSjGgujwNJPJyPlGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J2VH9k4qRnj6i4IA1atuXwZIpm+jyEWSrdwdWUyEfwFAWxQovb9VCuzR9TyzjpcJ13InIZ6aO4DIHlKNzq+5KReFulRMkUZqJms3l5RjxMdxwiMFbfs/pJaWhRY4zMpowiKZEQsxN4BO4GxtpD5hF4LJEqX/FmKtXTtva8Q1yL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LMG/FE5B; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3cef6debedcso1724582f8f.3
        for <linux-media@vger.kernel.org>; Mon, 01 Sep 2025 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756717479; x=1757322279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cwVv68lybtG/3lTbSeRMLSCB2s0eqf0axoIfKgt8qqM=;
        b=LMG/FE5BJKm93DBOnVGlJFPT1lQt94MTpajgNUoh04UkSfYEfuJjgap1E4uZgrPAOc
         7QF3InzlGGE5uxWvcMClzots8u0hG5ahU1Mu8JepZB8mkT+yDZryKY+HuynHDWZAbyJJ
         p459GGXBmi7zkM7E8p5LMn31ma2tgGe8sBxBIIbikGGanhufGqYL4YZR/6DshimcLXez
         XHRWESp+VMi+5NZpywAHuUiLajvuzaVmHWmO1KSTmeafwmA5iW5bNG9snqXk/GESJjjP
         ATgnqOi/TpS68GIdS64kQWcKuFzjCYtw5Ip1KP9hwkwRXHxEl6JnGfi5zikwYfvHz+yv
         dg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756717479; x=1757322279;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cwVv68lybtG/3lTbSeRMLSCB2s0eqf0axoIfKgt8qqM=;
        b=aJvtobTgdmjr2kD3odAJli0vxNC2jlwcfFSJxqduqTE8AqX92tk8RXAQ9sTXrREcAb
         qF863sdroiDFBEgTpNQ652QyndpkLobcEBeaPKUAyZguxOiWeFQiT+mi/FVyBYPRcs7j
         XB3lcPfaOffyvai2vmP98yC1GPeUA5mc9Kc6EVHP9/84NxoD0HsoSwBvu1GYM2Oo3IQ7
         UB10dpdn5kUKTawmOva95yCCn1woIql//TtHRxo8y0fVQ/dnThvtZ1EMYOTWzsAxL52m
         JQRFtIhUtn0cQAp+TXFbUA+3cv1oxINVcXQ9/4cND1DlT+JsR0qI1O6c2HOPWxid7QPH
         ClOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhoj1BaVYpDLPMCkXQGCUKo+Y3MM2VZ84NLfaEJp5rd1x5vwZ59wL9hbrnyvBnxrMBKXiqzdw6Dz974A==@vger.kernel.org
X-Gm-Message-State: AOJu0YynheNQkU0HbAaEJbYuCshYGgzyZWw01OCvn4eJsA2hNufdANYL
	/cQeZf3rLus6CfR7MOUv1X4kp139gbd9sWo+KZXNYa4OJNPt/I4xUsSdk3D/hN44I0c=
X-Gm-Gg: ASbGncugG8AjpRJy5+Lg3pEjcboLS/HTcyTMfvcq4lowzaJcIQL5KCg+rI5Wk1DlyPu
	5lk52XQKwX3L3n3FlG64YVdUzjbyM0ONp9ey1oM8eg9RxrGfpiNcOSA10Zc23t1KGjPhD0CHdsd
	eDfvu2QOh/YqP26ENQQvkO43OcuEQTGpNFVSZ7E3f1JP3ERk9y6Ze2BSYVsKl/PHavfouqrVQvL
	yNrN6Po8Y+XwqLhNi2STQgiqdv+uD6q0nPeELP9ZJUKaiB5SfEhTF07LB1KbbsgGquPvVQ6LCSC
	plOzoMedjxVtN6o3ogFU29Q34YotB1wcXXIHWbd/cpAjrqDgR0soAfJyjf0uAs7F1OIFK4g+M0O
	enCMBrXQLcx/BAyE9gnN0w2ZNVTy5UVJ+WNLui0vVHVY8mvpe3EuksCgipcX7wIlhKUfE8xEItg
	o1jKPDZIA44QTjKQkS+PETRFDPTH0iRw==
X-Google-Smtp-Source: AGHT+IF5ozFXuC12DhRU7wnhvEb/Eaxn298/3hrvqF72A12C7sUxgS1LCCpfGamLqO+HTku4EuOKTg==
X-Received: by 2002:a05:6000:1ac8:b0:3d1:9202:9e with SMTP id ffacd0b85a97d-3d1de4bb305mr6081112f8f.36.1756717479121;
        Mon, 01 Sep 2025 02:04:39 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e9c41cfsm147188325e9.21.2025.09.01.02.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 02:04:38 -0700 (PDT)
Message-ID: <498db18b-f6bc-4678-9d70-7741e3025185@linaro.org>
Date: Mon, 1 Sep 2025 10:04:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] media: qcom: camss: Add support for VFE 690
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
 <20250703171938.3606998-9-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250703171938.3606998-9-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/07/2025 18:19, Vikram Sharma wrote:
> +		!strcmp(clock->name, "camnoc_axi"));

This is causing a regression on other platforms because they define 
camnnoc_axi but not @ the rate of the pixel clock.

In fact its not very obvious why the CAMNOC AXI would want to have a 
pixel clock applied to the interconnect fabric.

The following resolves the regression for me. I can either merge with 
this change or I'll have to drop the VFE690 changes until you come back 
with something else.

➜ deckard@sagittarius-a  ~/Development/qualcomm/qlt-kernel 
git:(aaa8b5ab704f3) ✗ git diff
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c 
b/drivers/media/platform/qcom/camss/camss-vfe.c
index e969de74818f1..1aa0ba5ad8d60 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -913,8 +913,7 @@ static int vfe_match_clock_names(struct vfe_device *vfe,

         return (!strcmp(clock->name, vfe_name) ||
                 !strcmp(clock->name, vfe_lite_name) ||
-               !strcmp(clock->name, "vfe_lite") ||
-               !strcmp(clock->name, "camnoc_axi"));
+               !strcmp(clock->name, "vfe_lite"));

---
bod

