Return-Path: <linux-media+bounces-39406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64367B20175
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 10:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36FBE189E823
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 08:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6722DAFAC;
	Mon, 11 Aug 2025 08:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TAMuUoOd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2442D8DA3
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 08:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754899905; cv=none; b=INWu4RlXmsEhElmm8isOJUThp7of2rRmlDSC8Fogu6pVsReqk76fi8N6bjev7XNLU+icE3EDukzkYuel9lJQ+30KMu7Cmyr5WZezEAfbe0Uh9deykLkAvudi0wS3V1/hxvqKM+cUQGCl2nqtjTal0svhSYBN60L1zkSHnyhKVeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754899905; c=relaxed/simple;
	bh=P23Stlr4keHU7Raxkl8z5iyyQmIO+NGHaLRZnTC9L9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iKxnJYqOER3LEOqORXWAtTsavAuvbsRXgRB4pwURoq7sJ+EjRS3+9ZTjeCcC7k8/LjNJ//gOx1MOgrVmPXzUOAIoqNeels/o8sSa57X+JJcmSZQMm0KABNc/0eMrsvgoz6itcdVvBSjMtm0U4KKZ5bzxFQVw/hrRORprr2nwg+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TAMuUoOd; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b792b0b829so3945310f8f.3
        for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 01:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754899901; x=1755504701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2tkUesVl4jAFyoCBTmpuUr52QiKCqi3HcGLBzpIiqDk=;
        b=TAMuUoOdWKxhoiOTg0rXVzIYoibrgMkCCoGE+dFDfi+LHTbcz8IRsjRypw/0gqXcZY
         XEV1gXUPhMknUbBcQHMMhf/J2xqPTEdZT6XjqJF3ukaVGapQlaTZUi/24OLr3tpQbHRr
         4XdjVg0T/lEne4HSMHYuWsobiHRmNr2JTLjNWEGutiBDEJF19syyzRyVMDu4L3BkdcVq
         f7PcbtAmlarvSJwolBa1ce/kLzt1eVilIecO56HuezujO+b7rDyUVJOoT4BoFkDy7Lsm
         vZM/xFCMAFR6XDRBmTYjYveuGq7gzVGeX2QF602wvJDJR4cz28RYW23w/EnbVekbcXMX
         TTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754899901; x=1755504701;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2tkUesVl4jAFyoCBTmpuUr52QiKCqi3HcGLBzpIiqDk=;
        b=lV8FHF5yZFHBnh5tWu0oN8GKAh+j/P5ggmOdlPlmCxS9+4c89Fk3rSzUvTWJdvwHty
         f21UWcYP0uC8AVGHpsTWDnuDSDb9TyMSMGYZhH4Zi6xXi5XO6lTSjOTFw86RfXOfmAmT
         pGjw6YT449c18r15oPtagx3quaVO1dhefr3BhaFOP/JFeAM5V90maMgNpb6xEo4hDMca
         u5iS/MTf3VcRzgNygaPNCOQAXo0Qxz1Bn5/rMYwdZmMnzZscCDNXu/NJVF/d5/QZUBix
         w2QbjwWyFFW0RpjXAGBVEC2GyK/m4NOIyAVb51wrOC6pA1U8+ma2SLikqydHFBW4u4MA
         gFng==
X-Gm-Message-State: AOJu0Yye2/ohASy26R8/UzfEcc4dRecyo3DjBLu4HB1ChLPR4FaFOV2b
	j1vf+X7zcluPBb6bgloWjR1xI2qIeRi8mnPDkd0L9bzrAEe6NBudxlSh5R3f7vAZEDY=
X-Gm-Gg: ASbGnct+V8qFe+ZOBy2IkhRX5ARfeNhYDeu5AqYYZzvtGAI50E429ob8vxFqJKxlcih
	lT8M5D0eaFix5FUA1Tdq1oCeHieOGgAIKVhBsYFhW6vmKjQC6/byLGY9chmLc6Dg06O7M3BroH8
	ew6ur7jsXu1RHSlhjhilTJGxTWty89qh8IX5mudTrINWGPRHHVc3D3+WVC5VVti6+srve6BJmLz
	pgmxPQ4+2+OUDs6NdrZCM5FS2Tj5B6VOmr43rdbROCqP9fsb/SbQq4vNR1jDINLTDhFQ/JUKWhB
	SJ8lCOiK4r1ok/pB8DSI6W73XaeNs7F/c08GUiiqllRwLVYraqWJUgscmFP99u3PAYdeGJ4ojsz
	pix6FD54xxi6oNaCGj61wdM13CkSihgGQavTBkFETlyXStwEPmA2SJKXfhb6ZVDU=
X-Google-Smtp-Source: AGHT+IFZSCjB3EVVWN3j0xhyey0yOaCa7AbOuPwgJ7S7qfnZ/4InAfD2fBXGQz+A2XuMrW9cqBbDJA==
X-Received: by 2002:a05:6000:2c04:b0:3b7:99cb:16e5 with SMTP id ffacd0b85a97d-3b900b750edmr10135158f8f.28.1754899900689;
        Mon, 11 Aug 2025 01:11:40 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459dc2647f6sm161537245e9.2.2025.08.11.01.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 01:11:40 -0700 (PDT)
Message-ID: <90553ae1-8c40-4aa0-9cc3-f4e5f7cce15a@linaro.org>
Date: Mon, 11 Aug 2025 09:11:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: camss: Add support for regulator
 init_load_uA in CSIPHY
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250729-camss_csiphy_current-v2-1-da3c72a2055c@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250729-camss_csiphy_current-v2-1-da3c72a2055c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/07/2025 08:24, Wenmeng Liu wrote:
> Some Qualcomm regulators are configured with initial mode as
> HPM (High Power Mode), which may lead to higher power consumption.
> To reduce power usage, it's preferable to set the initial mode
> to LPM (Low Power Mode).
> 
> To ensure the regulator can switch from LPM to HPM when needed,
> this patch adds current load configuration for CAMSS CSIPHY.
> This allows the regulator framework to scale the mode dynamically
> based on the load requirement.
> 
> The current default value for current is uninitialized or random.
> To address this, initial current values are added for the
> following platforms:
> SDM670, SM8250, SC7280, SM8550, and X1E80100.
> 
> For SDM670, the value is set to -1, indicating that no default
> current value is configured, the other values are derived
> from the power grid.
> 
> ---
> Changes in v2:
> - Change the source of the current value from DTS to CAMSS resource
> - Link to v1: https://lore.kernel.org/all/20250620040736.3032667-1-quic_wenmliu@quicinc.com/
> ---
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.c |  4 +++-
>   drivers/media/platform/qcom/camss/camss.c        | 26 ++++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h        |  1 +
>   3 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 2de97f58f9ae4f91e8bba39dcadf92bea8cf6f73..7a2d80a03dbd0884b614451b55cd27dce94af637 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -707,8 +707,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
>   			return -ENOMEM;
>   	}
>   
> -	for (i = 0; i < csiphy->num_supplies; i++)
> +	for (i = 0; i < csiphy->num_supplies; i++) {
>   		csiphy->supplies[i].supply = res->regulators[i];
> +		csiphy->supplies[i].init_load_uA = res->regulators_current[i];
> +	}
>   
>   	ret = devm_regulator_bulk_get(camss->dev, csiphy->num_supplies,
>   				      csiphy->supplies);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index e08e70b93824baa5714b3a736bc1d05405253aaa..daf21c944c2b4818b1656efc255e817551788658 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -750,6 +750,7 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
>   	/* CSIPHY0 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { -1, -1 },
>   		.clock = { "soc_ahb", "cpas_ahb",
>   			   "csiphy0", "csiphy0_timer" },
>   		.clock_rate = { { 0 },
> @@ -768,6 +769,7 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
>   	/* CSIPHY1 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { -1, -1 },
>   		.clock = { "soc_ahb", "cpas_ahb",
>   			   "csiphy1", "csiphy1_timer" },
>   		.clock_rate = { { 0 },
> @@ -786,6 +788,7 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
>   	/* CSIPHY2 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { -1, -1 },
>   		.clock = { "soc_ahb", "cpas_ahb",
>   			   "csiphy2", "csiphy2_timer" },
>   		.clock_rate = { { 0 },
> @@ -1188,6 +1191,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	/* CSIPHY0 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 17500, 10000 },
>   		.clock = { "csiphy0", "csiphy0_timer" },
>   		.clock_rate = { { 400000000 },
>   				{ 300000000 } },
> @@ -1202,6 +1206,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	/* CSIPHY1 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 17500, 10000 },
>   		.clock = { "csiphy1", "csiphy1_timer" },
>   		.clock_rate = { { 400000000 },
>   				{ 300000000 } },
> @@ -1216,6 +1221,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	/* CSIPHY2 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 17500, 10000 },
>   		.clock = { "csiphy2", "csiphy2_timer" },
>   		.clock_rate = { { 400000000 },
>   				{ 300000000 } },
> @@ -1230,6 +1236,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	/* CSIPHY3 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 17500, 10000 },
>   		.clock = { "csiphy3", "csiphy3_timer" },
>   		.clock_rate = { { 400000000 },
>   				{ 300000000 } },
> @@ -1244,6 +1251,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	/* CSIPHY4 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 17500, 10000 },
>   		.clock = { "csiphy4", "csiphy4_timer" },
>   		.clock_rate = { { 400000000 },
>   				{ 300000000 } },
> @@ -1258,6 +1266,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	/* CSIPHY5 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 17500, 10000 },
>   		.clock = { "csiphy5", "csiphy5_timer" },
>   		.clock_rate = { { 400000000 },
>   				{ 300000000 } },
> @@ -1472,6 +1481,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   	/* CSIPHY0 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 16100, 9000 },
>   
>   		.clock = { "csiphy0", "csiphy0_timer" },
>   		.clock_rate = { { 300000000, 400000000 },
> @@ -1487,6 +1497,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   	/* CSIPHY1 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 16100, 9000 },
>   
>   		.clock = { "csiphy1", "csiphy1_timer" },
>   		.clock_rate = { { 300000000, 400000000 },
> @@ -1502,6 +1513,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   	/* CSIPHY2 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 16100, 9000 },
>   
>   		.clock = { "csiphy2", "csiphy2_timer" },
>   		.clock_rate = { { 300000000, 400000000 },
> @@ -1517,6 +1529,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   	/* CSIPHY3 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 16100, 9000 },
>   
>   		.clock = { "csiphy3", "csiphy3_timer" },
>   		.clock_rate = { { 300000000, 400000000 },
> @@ -1532,6 +1545,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   	/* CSIPHY4 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 16100, 9000 },
>   
>   		.clock = { "csiphy4", "csiphy4_timer" },
>   		.clock_rate = { { 300000000, 400000000 },
> @@ -2158,6 +2172,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	/* CSIPHY0 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 44000, 8900 },
>   		.clock = { "csiphy0", "csiphy0_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2172,6 +2187,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	/* CSIPHY1 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 44000, 8900 },
>   		.clock = { "csiphy1", "csiphy1_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2186,6 +2202,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	/* CSIPHY2 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 44000, 8900 },
>   		.clock = { "csiphy2", "csiphy2_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2200,6 +2217,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	/* CSIPHY3 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 44000, 8900 },
>   		.clock = { "csiphy3", "csiphy3_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2214,6 +2232,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	/* CSIPHY4 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 44000, 8900 },
>   		.clock = { "csiphy4", "csiphy4_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2228,6 +2247,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	/* CSIPHY5 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 44000, 8900 },
>   		.clock = { "csiphy5", "csiphy5_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2242,6 +2262,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	/* CSIPHY6 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 44000, 8900 },
>   		.clock = { "csiphy6", "csiphy6_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2256,6 +2277,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	/* CSIPHY7 */
>   	{
>   		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { 44000, 8900 },
>   		.clock = { "csiphy7", "csiphy7_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2488,6 +2510,7 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	{
>   		.regulators = { "vdd-csiphy-0p8",
>   				"vdd-csiphy-1p2" },
> +		.regulators_current = { 105000, 58900 },
>   		.clock = { "csiphy0", "csiphy0_timer" },
>   		.clock_rate = { { 300000000, 400000000, 480000000 },
>   				{ 266666667, 400000000 } },
> @@ -2503,6 +2526,7 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	{
>   		.regulators = { "vdd-csiphy-0p8",
>   				"vdd-csiphy-1p2" },
> +		.regulators_current = { 105000, 58900 },
>   		.clock = { "csiphy1", "csiphy1_timer" },
>   		.clock_rate = { { 300000000, 400000000, 480000000 },
>   				{ 266666667, 400000000 } },
> @@ -2518,6 +2542,7 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	{
>   		.regulators = { "vdd-csiphy-0p8",
>   				"vdd-csiphy-1p2" },
> +		.regulators_current = { 105000, 58900 },
>   		.clock = { "csiphy2", "csiphy2_timer" },
>   		.clock_rate = { { 300000000, 400000000, 480000000 },
>   				{ 266666667, 400000000 } },
> @@ -2533,6 +2558,7 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	{
>   		.regulators = { "vdd-csiphy-0p8",
>   				"vdd-csiphy-1p2" },
> +		.regulators_current = { 105000, 58900 },
>   		.clock = { "csiphy4", "csiphy4_timer" },
>   		.clock_rate = { { 300000000, 400000000, 480000000 },
>   				{ 266666667, 400000000 } },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 63c0afee154a02194820016ccf554620d6521c8b..b46e92b10e096ca8e082ea2bb0b20032135e05b9 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -44,6 +44,7 @@
>   
>   struct camss_subdev_resources {
>   	char *regulators[CAMSS_RES_MAX];
> +	int  regulators_current[CAMSS_RES_MAX];
>   	char *clock[CAMSS_RES_MAX];
>   	char *clock_for_reset[CAMSS_RES_MAX];
>   	u32 clock_rate[CAMSS_RES_MAX][CAMSS_RES_MAX];
> 
> ---
> base-commit: 0b90c3b6d76ea512dc3dac8fb30215e175b0019a
> change-id: 20250729-camss_csiphy_current-7793c2fab66f
> 
> Best regards,
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

