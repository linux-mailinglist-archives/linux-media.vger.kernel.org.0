Return-Path: <linux-media+bounces-50890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4061D316AE
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:58:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02EC13055DD3
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 12:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149CB233704;
	Fri, 16 Jan 2026 12:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7JSTMfZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76225221F39;
	Fri, 16 Jan 2026 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568326; cv=none; b=QeNlZMQPK3RHq2fH4UUFpe0EJC0/FNk+hW6UXPUNS2KKsSeUrWFKj9clnW4vc00H0rIQJu87iua7ubsGkdLYuGo8FbcWEj6u2yG9tnROt6G4ssZdtbbnq06k/M6JUkYjoRzCKCn+Z9d9bqbXshBH1Vo5t/XLs3OggaGd/xojcH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568326; c=relaxed/simple;
	bh=cbNcEyT28INXVnED1KRjcBiYiJXlAbqna6yHQQ8z4cM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iRWaiuiy9tXLSbbQAl86xkX/YJ71ClQK+Kp7IJqV1OX/071x+rs6duxR5EPclMQSLwVSb0U2445T8tV4sPFic4mZ/jQGZRt/ui7r6dbycrRLzEqfFS9RWYyRbFr4INwkjP8Bx0wc9hahVSHfGtnCNLBmF4+64rFevQIBBEGUfTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7JSTMfZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B5AC116C6;
	Fri, 16 Jan 2026 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768568326;
	bh=cbNcEyT28INXVnED1KRjcBiYiJXlAbqna6yHQQ8z4cM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H7JSTMfZZR/csPl0OSjTTKJVdPVZ27279R16b+PzlyOgw3mYwlg6adOdi5Wsm9s5I
	 kb0FlR6SHa9RnwEoXBG7GUQcGrk8c/UFE04r/IHdWjAXmmxJtLH64oo5Unol51/6Qu
	 XTVPntKiHh0/BcEI28wR/f0O7RJv9alE8zga+BivF1qSUFICa9gb0mw5LrASKtnU0k
	 aN3Zvay/+sZ+0pNwXhX86QsnukLDE7tjjM2jaD4/NN39aqvClg2fv57VeiDXKc94sa
	 E89wIwtqUYFUGts6FTkQW3QIpZkiIGXlMdn2OVo3fkrPOvvFMzy9v64ZoLSEWt2xrQ
	 Psrg2Hd6H8VxA==
Message-ID: <e759c977-be91-4f2e-bb40-df61b5cf70ba@kernel.org>
Date: Fri, 16 Jan 2026 12:58:39 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] media: iris: Introduce vpu ops for vpu4 with
 necessary hooks
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
 <20251210-knp_video-v4-6-8d11d840358a@oss.qualcomm.com>
 <54b29b03-4166-60d9-d553-d0e655749da4@oss.qualcomm.com>
 <98481299-4db3-41f3-a974-d9d0075d92e0@kernel.org>
 <PbKsFxhNUWIU_gtZcnLC5O0DxRc782rkITu5doVCWVlIBgtl7o4U31bjFhmbp828q-BbriQ8n4CfCq7_UJTnxw==@protonmail.internalid>
 <035e9f34-f28f-47fd-ac36-6277171b0e28@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <035e9f34-f28f-47fd-ac36-6277171b0e28@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/01/2026 11:27, Vikash Garodia wrote:
>> Thank you for reviewing this code. I would like to point that it took
>> one month for Qualcomm to review this Qualcomm patch and in the same
>> time Vikash is sending emails (more than one!) that Bryan does not
>> review that fast as expected.
> Firstly, the ask to Bryan have been to pull patches (not stressed on
> review part), infact, even fixes are waiting for merge window while they
> can easily go into RCs. This part of the process need some improvement.
> 
> I have also appreciated him when he pulled long series for initial codec
> enablement, i think you missed those part.
> 
>> I do not find it acceptable approach to harass community reviewers that
>> way. Even if you do it internally, not on the lists.

lol

>> I think this review timeline is final argument for Vikash to stop
>> pushing such narratives and complains, because your review is expected
>> to be BEFORE the maintainer upper in the upstream flow.
> My understanding is that, if maintainer raise patches, then its more of
> reviews from community and having RB tag from any of community member or
> no open comments implies the series is good to go.
> 
> This series is lying there for a month without any open comment, there
> is nothing pending here to pull them.

2/6 patches in this series were marked in patchwork as having no RB so 
they weren't pulled.

That's the whole story here.

---
bod

