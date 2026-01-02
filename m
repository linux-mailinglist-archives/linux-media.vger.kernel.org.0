Return-Path: <linux-media+bounces-49840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87233CEE2F6
	for <lists+linux-media@lfdr.de>; Fri, 02 Jan 2026 11:45:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9626F3008D4A
	for <lists+linux-media@lfdr.de>; Fri,  2 Jan 2026 10:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5EC22DD5EF;
	Fri,  2 Jan 2026 10:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOfnE3MV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283A029E10C;
	Fri,  2 Jan 2026 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767350697; cv=none; b=F2Uj0TO/uEoyCSvXXjubpK9cHzB+gOfm5MlH+qR6i4mFvqWZb46g7dh4XN9Db/LK9mQsDl93n8tiaBYllYklQYXApy8sK22MZNQUqaxZJBZMK7sTQTB7A0C05w3ap3nkO+lpr79JLbYEmJUBaV/sTh//+3lett/QZXxFwfFP7qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767350697; c=relaxed/simple;
	bh=fxQjfhcMMZyVz2+UrDtztEj+Q/yRmUMFkICYwyx1yY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BlQSXWfTtW2MttpfdoscFba7PxdOAgY8+02ZpucJfWl8OWKmgCCRmwQ6tYyZBKpsszmYs9ImQsqnmJ3m7vKZW29X7voXvgvVTprYwtwG/hk6IhXXuDpvRtM5tEbutCg240sQNEiLQ0Yd81nY5mhBJGZJC7/RAU+UJzKoM/w3MF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOfnE3MV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DAFBC116B1;
	Fri,  2 Jan 2026 10:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767350696;
	bh=fxQjfhcMMZyVz2+UrDtztEj+Q/yRmUMFkICYwyx1yY8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NOfnE3MVluIRyMW3+rDA8/DC775C/HQSZOZvD5KSVXD01K+zHBaEyXvzGV55ddDKD
	 fb+Liycpjxvr/rZgrxmqEWKLrjGDi1oRcUTqxOQO1FiQxHcDUNrYEYt0Hhya+Mi+jo
	 b6kOPxbSQkpe7KWBTWrWvTzHDzUmMSahTeVLrOLLc6w/NaRmBSAjkiONlHhzMgX2MV
	 nRxxshdlCtoZpSq9g1QnbTK1AtVO3eVtMBsPPxxtdFKYOOn51bfY6jTEvPrbEfYhYL
	 VMBO8pvpORi13+iyZKQjDDMj0h63MC0WoCbunJ6ar9cAXHKVBHtDbwYnArauq+LJHf
	 L8IAEpX6bkyXw==
Message-ID: <de8fe895-79ae-4540-9879-64d6f8f9e239@kernel.org>
Date: Fri, 2 Jan 2026 10:44:40 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/5] Enable support for AV1 stateful decoder
To: Val Packett <val@packett.cool>,
 Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
References: <20251210-av1d_stateful_v3-v10-0-cf4379a3dcff@oss.qualcomm.com>
 <DjKkpb96k7gGFmmmqsmLvO6sKcd02WwZq67n9hY4c75sajI_hENGebzfUBW3Xs3WGJ_oXdeYkNcV-T7UkXO6Xw==@protonmail.internalid>
 <ae5531fa-a3a4-4fc5-8580-3a790bec4961@packett.cool>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <ae5531fa-a3a4-4fc5-8580-3a790bec4961@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/01/2026 10:43, Val Packett wrote:
> 
> On 12/10/25 3:59 PM, Deepa Guthyappa Madivalara wrote:
>> Hi all,
>>
>> This patch series adds initial support for the AV1 stateful decoder
>> codecs in iris decoder. Also it adds support for AV1 stateful decoder
>> in V4l2. The objective of this work is to extend the Iris decoder's
>> capabilities to handle AV1 format codec streams, including necessary
>> format handling and buffer management.
> 
> This is awesome, thanks!
> 
> I've tested it with rpi-ffmpeg as well, and it works great (only
> required one interesting logic change..
> https://github.com/jc-kynesim/rpi-ffmpeg/pull/108) \o/
> 
>> unsupported content with bitdepth 10 (66 tests)
>> Iris decoder supports only 8bit NV12
> 
> Any chance we could get 10-bit support soon as well?
> 
> 10-bit is massively popular with AV1, especially with home encodes (see
> e.g. https://wiki.x266.mov/docs/encoders/SVT-AV1#encoder-optimization
> and the ab-av1 tool's defaults)
> 
> 
> Thanks,
> ~val
> 

Can you give a Tested-by so ?

---
bod

