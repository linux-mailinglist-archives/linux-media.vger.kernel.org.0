Return-Path: <linux-media+bounces-47179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E6DC616D4
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 15:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 081CF4E4F67
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 14:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EEB22D6E67;
	Sun, 16 Nov 2025 14:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LbNGIqJN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F6A246770
	for <linux-media@vger.kernel.org>; Sun, 16 Nov 2025 14:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763303432; cv=none; b=bT4l0uBqYuT1AYJLzEYc9gmM5nUgcFoavW0dQpLjskr/RKfT0H4CJcs1qmZzlv1BE+AExaqJ3XdogVr8WKlUlrGKisDL4CSZ71fLg5pEBJOwNwM7RHPY34NBkvvaNIYWzXwjpPQW9dkqFYWx/zlOz32tWAhzVvZOmUyGaPulKKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763303432; c=relaxed/simple;
	bh=cKfwNVXUaXw3bJO+IzX0argy2DWs0KoFFvj0/LYhR1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fEwI+tVwUo0x18CudsSLthRcMho1uHrl5mItEF5SzMpx8iudcxjuSAc5QuAhpIDLagVKp7A4tfM/PrK6mE0xNDLWtIbaG8mZINzdfw8K6xExuFKoTe+FKMWL4vUw6+TEqPZRzyLooIrg3CoOELIn68xDMKuPkNbZz7dCpBtgUVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LbNGIqJN; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3ac40ae4so1929850f8f.0
        for <linux-media@vger.kernel.org>; Sun, 16 Nov 2025 06:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763303429; x=1763908229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ICly7sZCAzATlOBf/FaB2qKaAu95N0j13h8tQwyhW4A=;
        b=LbNGIqJN1fUSQv3hrhvdT5K6dvjS2eea0mF+9v+Npsn8CfGfdufTskxXV47uJ3s5oS
         JzfZNFPv/GCZ+82ZgwdOR2FxzAai9YUlnmsZ9FYya1jxHL14K0+xJEyfe6XiKwX6z8tw
         YnG13a5yNKadpXZ8gVPx2M8z6SNDRAYgKaFsriTCzaXjybmy2LDEEBQR+u+InaZzCUVB
         fslTYj2pj12rfLx8iO7VUow8NxaHL4uVqP03NIbntwGly8k7PtlApahdj/uc16eYSPZA
         mcVJ6EZX80uWOq8QHFYKOYuMtUrcMGW2RqgukNl3EjCmxEX8LZvpK5PqlZXQ0bcc4krm
         LbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763303429; x=1763908229;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICly7sZCAzATlOBf/FaB2qKaAu95N0j13h8tQwyhW4A=;
        b=CXeqXXHxYh7iHeP3Un04OwpbqAcR6aoghy6pLHk7sqUWFCwZHiImXn+BU5rNtIY4rA
         iVDGoXaIzfAKG4O2NdIVy/3WCAEy1Ep+y/T7SyieTQrW85+k2EHGEjJONKi8/YTvVmE1
         QNB1C5Is0DXKBp1jEMcAneqbHqnVbmyDAh0+PMHSugBfFGL0qasFBaNhCOWOfd2DclEQ
         V3hCMmRA5tiWWJ5uPxTxzTELlmb4XzZRhl1+Lc+ZWsWE4nVw/4oned1d6wVUsJ3GN+tl
         hVgNxdcMmnmkCwsLikll/OvuOyXLZo5C//N9YHwIlnFHE3bbGSCmPbomznNI1cH+DIm9
         ho2g==
X-Forwarded-Encrypted: i=1; AJvYcCXhdlmWrajprhF6qQX6dpM/zF4poT3jgA5tynuaFTdQAJsvDKKFbCLB2pGOIv72CBqHUF/zUgWHKgtqmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoquJ9Lx3r4SSULiZMpb8qgM3S0fVJguzXJIpilpR5aW4Hsxl1
	1vxUZA9S7EbKOGP4aFEWF7K9kmjpQx0S9H3lnINB9/Pq5/JzmkoHLQdF6jSc4xOH4P4=
X-Gm-Gg: ASbGncvTc9jcIVfT0mtu7Un9CLd/wz7LMSL5sCAFnwGFEHvCgJVORslrv0DCiwRSJNd
	YViRUWUNGAeBwz9pHT/MsXuZF+so4zR2aSFPkf3/T7nWsl68Xf9d4/0UxemnlSWP8xyZ9y5xMod
	rRBaiVaiLBbdAGrrKHswN79cJACD61iDH4+pndbM9BSjT/QPTXVId/us3hn5BxBiizrkLsMTMre
	XyxNWWsk1sAZB7NRC/9qPZyVYpdmfzrsCquPcNskZK4MebGClCY70LbFJ3RoFf956FVw6UvGiiz
	fg8acsOdbRwUNHZeJgMxb/yMzhQbu1CXJyF4zbQFnJC8X6tghtgFDjQmOmZ4KVyQXXE0Y6DAOP4
	Y9j43bBX1yAABz7XUZqkEaM4IPd1DA4zAIHZdUJY23oLTfvLOLck4pvCE5nnnBLFXz5/AqE5VKO
	3DBHIJLZElmBgwvf1GiyWrF/INyKS8uJ1h5TqXhGnhkg==
X-Google-Smtp-Source: AGHT+IEfYLpYpa20g5wtNTk5jZFkM5xmSMDzaYixuhuIpmallSrBBPr8uUgJe9xMGpqXeRcYfT73jQ==
X-Received: by 2002:a05:6000:3108:b0:42b:3ee9:4775 with SMTP id ffacd0b85a97d-42b593394a9mr9581497f8f.11.1763303428862;
        Sun, 16 Nov 2025 06:30:28 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85cc0sm21886040f8f.17.2025.11.16.06.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 06:30:28 -0800 (PST)
Message-ID: <17e7ebc9-3b88-4334-b87d-1bce6d5bb120@linaro.org>
Date: Sun, 16 Nov 2025 14:30:27 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add CAMSS support for SM6350
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <3ph8XeidoxkUIsK7qiOH29pde94sdwa3ReWKVVrPabgS5enIAmwVAC5plyFnBMJGKQBnxFB6df6j69OMFIeavw==@protonmail.internalid>
 <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
 <df4a6a77-9004-4dbe-9b11-7af2bea7e068@kernel.org>
 <DE8JJCQA0C4Q.35NEED7XG0K0V@fairphone.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <DE8JJCQA0C4Q.35NEED7XG0K0V@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2025 15:59, Luca Weiss wrote:
> On Fri Nov 14, 2025 at 4:51 PM CET, Bryan O'Donoghue wrote:
>> On 14/11/2025 11:15, Luca Weiss wrote:
>>> Add bindings, driver and dts to support the Camera Subsystem on the
>>> SM6350 SoC.
>>>
>>> These patches were tested on a Fairphone 4 smartphone with WIP sensor
>>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
>>> far as I can tell.
>>>
>>> Though when stopping the camera stream, the following clock warning
>>> appears in dmesg. But it does not interfere with any functionality,
>>> starting and stopping the stream works and debugcc is showing 426.4 MHz
>>> while the clock is on, and 'off' while it's off.
>>>
>>> Any suggestion how to fix this, is appreciated.
>>>
>>> [ 5738.590980] ------------[ cut here ]------------
>>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
>>> [ 5738.591049] WARNING: CPU: 0 PID: 6918 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x170/0x190
>>
>> Do you have a full and complete kernel tree we could look at here ?
> 
> Sure, this branch has everything in:
> 
> https://github.com/sm6350-mainline/linux/tree/sm6350-6.17.y/
> 
> For further refence, at least two other people have tested this branch
> in postmarketOS, nothing particularly exciting to report from there,
> apart from that the sdm-skin-thermal thermal zone (thermistor right next
> to SoC) is currently configured with 55 degC as critical trip, which is
> quickly achieved when starting a video recording, but that's not really
> an issue with camss, but will need some tweaking regardless.
> 
> https://gitlab.postmarketos.org/postmarketOS/pmaports/-/merge_requests/7281

diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
index a4d6dff9d0f7f..229629ef82809 100644
--- a/drivers/clk/qcom/gcc-sm6350.c
+++ b/drivers/clk/qcom/gcc-sm6350.c
@@ -908,9 +908,7 @@ static struct clk_branch gcc_camera_ahb_clk = {

  static struct clk_branch gcc_camera_axi_clk = {
         .halt_reg = 0x17018,
-       .halt_check = BRANCH_HALT,
-       .hwcg_reg = 0x17018,
-       .hwcg_bit = 1,
+       .halt_check = BRANCH_VOTED,
         .clkr = {
                 .enable_reg = 0x17018,
                 .enable_mask = BIT(0),

?

---
bod

