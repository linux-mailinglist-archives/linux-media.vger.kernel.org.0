Return-Path: <linux-media+bounces-3594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9114282B5B8
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 21:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B81DF1C24493
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 20:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EB056B75;
	Thu, 11 Jan 2024 20:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EQDz1erv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2726656776
	for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 20:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2cd65f803b7so42033431fa.1
        for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 12:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705004023; x=1705608823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HLcLQaz4FuWBvN8Bcs9aSQ4aN2O0V7MXEoQjkEjyuLo=;
        b=EQDz1ervt70Nb4uhkKmuPtN+NHCEkPwdnIDzGyrs2Z5Ppz2Glzh1O68TSQVi53ReBJ
         Hy00bu10lZgehHyfbuHJMGKlH/IIKkVi5m70vKy317S1EK3aNuY9VPAxReeL6mgfecCq
         0lKP4ZZxzc2nubC1PUFi6bEjqiCzd8v6ZFVO89/xzkHfFYx9+vxta30caLdCaY3pyeze
         XQEe0/CRU3r1ML9ypGJhm4Qq2ZUhsDWg2Zy/G9C16RPAOatVkyUuL3ZngaxvbJLwXEUd
         rz3xzSEgYcfkKTBdC77zIv3TRADKMvvnsvVxYgIehLxTq7mDJOPkzZnropVez227ZR5l
         p0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705004023; x=1705608823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HLcLQaz4FuWBvN8Bcs9aSQ4aN2O0V7MXEoQjkEjyuLo=;
        b=GeV/ddUNbs7Pjo02JiKyaWXDbWokUYAxwByziZQvUmOc5FmWHcaVd1rhfHpktotN3y
         Lb1nvHA2//n2i/QHzzZrO2C5lO9apKmnZ4H8oCskFG1/eCvJYINa8t9bUJEM7VJeBNnV
         o+l/SOidMdSIyX090AHZF5MTyKn9SwZil8yNf0uSurLlcVyMmFIeaDyZB5UtoeAaGGmS
         W1yL4nr1/M3RhB3GTgLYpG+6Zsfu7GHPHefTJRaFDAzD2Y/YDBmv8lDKTei+pHPkHxxC
         /mmzwk4KwPqoW2I1A+ATm/WtUVOAubaevdpBw628fN4e+kzLIgHepwc9uSz6Z9kRHx/6
         kl+w==
X-Gm-Message-State: AOJu0Ywb4bCoi9ChP8fYLhZLe3+2qhWCU952/AbbKrTr9KGy3xsOiC5f
	McOmTNGSNcxBgM/wLiFWYMlvSI5hX+ed2A==
X-Google-Smtp-Source: AGHT+IGpC/aKy6BH37k6si/AHktDrmWWE8poE0NwjWdn7uSe6GqjYOvq4l9M/gBSDCQxkhs4+Gqjnw==
X-Received: by 2002:a2e:b1c7:0:b0:2cd:463f:6c2f with SMTP id e7-20020a2eb1c7000000b002cd463f6c2fmr127406lja.72.1705004023125;
        Thu, 11 Jan 2024 12:13:43 -0800 (PST)
Received: from [172.30.204.205] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x4-20020a2e9dc4000000b002ccbcc18e73sm236589ljj.17.2024.01.11.12.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 12:13:42 -0800 (PST)
Message-ID: <cd3d3034-ce98-4b96-8cdc-fbd5b66ca7a8@linaro.org>
Date: Thu, 11 Jan 2024 21:13:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] media: qcom: camss: Add sc8280xp support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240111-linux-next-24-01-09-sc8280xp-camss-changes-v1-0-b92a650121ba@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240111-linux-next-24-01-09-sc8280xp-camss-changes-v1-0-b92a650121ba@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/11/24 20:57, Bryan O'Donoghue wrote:
> A minimal set of patches to switch on sc8280xp support in CAMSS
> upstream. Most of the SoC dependencies are either merged - CAMCC or very
> close to being merged - CAMSS/CCI dtsi.
> 
> Alot of prior work means we have far less interventions to make in this
> driver to support this new SoC.
> 
> Most of this series is already reviewed however it is gated on merge of
> the CAMSS compat string here =>
> 
> Link: https://lore.kernel.org/linux-arm-msm/20240111-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v4-2-cdd5c57ff1dc@linaro.org/
> Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-24-01-09-sc8280xp-camss-changes
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
What happened to the "vN" in the subject and the changelog?

Konrad

