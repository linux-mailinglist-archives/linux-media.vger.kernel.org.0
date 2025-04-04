Return-Path: <linux-media+bounces-29382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 514DFA7B984
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 11:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B105B17A11C
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 09:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637301A840A;
	Fri,  4 Apr 2025 09:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RqqiIGmV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18B81A265E;
	Fri,  4 Apr 2025 09:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743757372; cv=none; b=HpOoV40v0BCY7vcPuuJTaaVP5YzxNzehw1vlzPvOZ2ck4FebGFOrxAZF/170M/L1S+KxKEwvUj2yPjcyrCXn6K/NN4pXr4ONu1gypy+KGSt1NA0JxdeJ3mlCqnzGmzEElh2dy9epV3Kwp3NPW0xbDmautkNIRqFi0SyCXqxPNZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743757372; c=relaxed/simple;
	bh=wm44pMRxSMtVrJZ9//WbNLyZvf+/VMaxa9Bl2u1h3DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gETNNL1zuDMHRkrgn8hWucuQRql3bUsQMPpqZYJZOy8PduWZfvpaML0vyfKxwl/kR+NUIMhgV0UsucSuGeu44vDJFq66isX3PT7USG4wVuLm/fe7EcSozuHldSZtAgDEJORNt/vfIpc3R2Z22dbgZz5nKMJ5L5t3h3eWK8Y6EB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RqqiIGmV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C705C4CEDD;
	Fri,  4 Apr 2025 09:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743757372;
	bh=wm44pMRxSMtVrJZ9//WbNLyZvf+/VMaxa9Bl2u1h3DU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RqqiIGmVdSKS3ZhKoSM/x0QlgQ23XAWfSOYUsnl1O0R+0B8JuyU2o4hdmFBG+mxUK
	 /QZmusJroU1fGCg6PjHm6r3xE/Xsl7b4IWFHWrz6AOSisgMB7DuPITh/7g5En3TSw6
	 yXObcPqrcDXbZ43RKEcSUOWkPIfns6PuMUkYuExLz8kJIwNUQF2Cv4cZW4sW5Oqpm2
	 b8XgdgJQDgkWuW/IjQGAaXjMgDts9OrxnQhONT99hlIiaU7cvEKchOJ7wRKOJ/aAFf
	 mqU4ea+FIXpaeG3kQe0OBq/Dj4N7hn7mOn8/FO5FpoveryTtk4OU1ziaE8RULWhZcw
	 l0/oESDsSHIxg==
Message-ID: <70891a99-d2ca-4fd3-a88d-2f66a9a78f66@kernel.org>
Date: Fri, 4 Apr 2025 10:02:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Reup: SM8350 and SC8280XP venus support
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <8cfaeb25-2657-9df4-5cea-018aad62f579@quicinc.com>
 <it3njgklhnedjzojafuxpjy3o5zfulgdclweyobv7kjgtpjmzx@6opje7yms4yg>
 <1dd6e03d-09be-4853-741a-4fb47b7619a0@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <1dd6e03d-09be-4853-741a-4fb47b7619a0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2025 06:24, Vikash Garodia wrote:
>>> How different is this from sm8250 which is already enabled on iris driver ?
>> As far as I remember, SM8250 support in Iris did not reach
>> feature-parity yet. So in my opinion it is fine to add new platforms to
>> the Venus driver, that will later migrate to the Iris driver.
> I would say, from decoder side all codecs are there now on Iris. H264 merged,
> while h265 and VP9 dec are posted as RFC, there is one compliance failure which
> is under debug to post them as regular patches.
> If we are mainly looking for decode usecases, then we should be on Iris.
> Preference would be to stay on Iris, otherwise we would have that extra ask to
> port it later from venus to iris.

Right now venus represents 9/20 - 45% of the patches being churned for 
sc8280xp.

https://github.com/jhovold/linux/tree/wip/sc8280xp-6.14-rc7

This is a good debate to have, however my memory of what we collectively 
agreed both in public and private was to continue to merge new silicon 
<= HFI6XX into venus unless and until iris hit feature parity for HFI6XX 
and to continue with venus at that point for < HFI6XX.

So merging sc8280xp - HFI6XX is consistent with our agreement, the right 
thing to do for our users and a big win in terms of technical debt 
reduction.

I will post an update to this series ASAP.

---
bod

