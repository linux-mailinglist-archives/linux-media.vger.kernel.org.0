Return-Path: <linux-media+bounces-9934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D16058AE6EB
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 14:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F6C51C23005
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 12:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D6E12FB0E;
	Tue, 23 Apr 2024 12:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X3EGtRGX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D4412E1DB
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 12:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713876557; cv=none; b=K5BA79rpyMk8XyIzN5FB23GJl+957hnF49HnfHrf0EKQyel2iHINEz3kx9D7fjDrWOHUc6jR2X8hCL1PycjA/1IUR6U4rPLQ/fkmvTc1fgK8un3D0wF2/MPNcNdHsKpyLHc+t81xT6zNJ3FON5sw8FW/W5nbGRTqX8xkBCUUbNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713876557; c=relaxed/simple;
	bh=XQeZr6E7rXhe/VT+k28qSPXYBkfsY+98/EcL4uCWgDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y/bu7sYqW35LkLsRFIp9GFTQqR09yz1EveJdrEC9vEzhmc8m/RZa2jBQN2JQeGEHWB+qcVQdA6rjvDKbEsfpa3I7WtXCO8RVrE2/Rh+29XgveXRqOl19UAxmby7PtDZ00bszsMn9+tUouL2lH1cor872qZifUqckHOJaPqbsiIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X3EGtRGX; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-349545c3eb8so4075647f8f.2
        for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 05:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713876553; x=1714481353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GtCF0d5TRfvf1gJjlek+SkbwLI/L240GdEgYBnOFyEs=;
        b=X3EGtRGXHQ3DZI15Ubfea9OLOWPGEVP0xGmd2QsZJ4aZC6DkdsRk9xc+gAjKIbZlfE
         5pcfowz3f2jRtPB4jZzeaHNMnA98kSnJqjtIdb1qkk8AEoVYqtYn2e8FlcxCIOVj7Ad3
         6vvLpAbku3xJBP8DkhGwexSWVWW/qUY14ZQlSEgNoK7vAGLP4czaslnw/0eUR6k1xCUt
         DOT+ikWyDWLdaBYPdifM9uRaUCd+Wsadd9TGhOYH3w3++jh3NTNc4jaVgmWLJ/4QITBj
         RALkAbIvUrAZSfY7wkJRwPT0opPDJpxjE/MiuA6sNkKOh42+qeU/XgR91M133t0sZ2az
         Z5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876553; x=1714481353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GtCF0d5TRfvf1gJjlek+SkbwLI/L240GdEgYBnOFyEs=;
        b=lpAFzVVAcOI2Pvre7DosdI6wBXfb1pNeiL3bfrQOwPalJw+38xPCH2isCuF3UN+ssf
         AjBOm4Be6peO8OqTGUxEAcW27T54eW7IVFY8lq0ij4hP3wKcP3Tic5XAKYLm4OEI85x7
         3Co3tfkqYfbfFJIr0pOas4zJoydd+lKkWJqrcLX/9NNn34hbvK47Iw5/DGWn6MyJWjoL
         +/IB71CX6kTW5W/8QZ2k1FslHJ21KQA+6M0V5oe7CmOCI088WlXjCBqBxOr8VVjw8r5P
         l06yre7RVeP0pSI/fZ9MBO961k0xPoYBWdPbYoGXU71SWr3e4ac1n7QK+MHtPU9Rb5Ak
         Eaog==
X-Gm-Message-State: AOJu0YyDC8Iw1USnx6+xhwss4oCK8SxbyQeGfG0GnUg8UgwjFwBKytgs
	jdKYF9Iga0fIMGGwKfGPpttC1k4GGJvNJK2xFFKHTX18RbCCSj5xPgvb26Ad6BM=
X-Google-Smtp-Source: AGHT+IFQ/wvfOsFaUdKh98XxWAyZjDTRY072QmJCxCCxJbX9yzwrMnJqlpUXpbY2Dl+AdrwFqOGXDg==
X-Received: by 2002:a05:6000:1e89:b0:34a:9afe:76f with SMTP id dd9-20020a0560001e8900b0034a9afe076fmr5609928wrb.30.1713876553387;
        Tue, 23 Apr 2024 05:49:13 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id y18-20020a056000109200b00343300a4eb8sm13594089wrw.49.2024.04.23.05.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 05:49:12 -0700 (PDT)
Message-ID: <515e2718-7e1b-42c0-9d61-a10d00f12a31@linaro.org>
Date: Tue, 23 Apr 2024 13:49:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/35] media: common: saa7146: Use min macro
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-13-477afb23728b@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240415-fix-cocci-v1-13-477afb23728b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/04/2024 20:34, Ricardo Ribalda wrote:
> Simplifies the code. Found by cocci:
> 
> drivers/media/common/saa7146/saa7146_hlp.c:125:36-37: WARNING opportunity for min()
> drivers/media/common/saa7146/saa7146_hlp.c:154:41-42: WARNING opportunity for min()
> drivers/media/common/saa7146/saa7146_hlp.c:286:35-36: WARNING opportunity for min()
> drivers/media/common/saa7146/saa7146_hlp.c:289:35-36: WARNING opportunity for min()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

