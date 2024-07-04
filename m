Return-Path: <linux-media+bounces-14632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5728B92759A
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 13:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 020C21F2379D
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 11:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DF31AD9E1;
	Thu,  4 Jul 2024 11:58:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8267814B078;
	Thu,  4 Jul 2024 11:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720094308; cv=none; b=WY289Z6aupvhK2QD9HzS+lyGv0NsevaCDLhnAym2I0R25diGyjkZe2+V+3DlVE7I6qc8oF/w+YC6/E2AKQzzQ5CeHmLwfcgAQJrf5VZuEAvwWcKjW2fLuNgALLjggiFeZMxVP10hhJc/HhHXXkp4MIOy26I2p04Oew0f7FcGjD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720094308; c=relaxed/simple;
	bh=G19s0ekEGL8vzCnJAFW9kn7832plsnePeet4sP5UvZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QN6/QKA+DsFcM9DTHFqWXptr4mcwhZdp9irZ405Xizjp1rBjxa1TeA4UMv4NHkdxd1Cj/nQeJ9Pl8DxPv81JBrnsT9WAIFKNPZtZb3AxS/H1n1BZtbIbQlHInU70lO+x/DjaZuzoU57uUF3VtufGTmz4at3ZJ/8/KyGEb5hyql0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6FEC3277B;
	Thu,  4 Jul 2024 11:58:25 +0000 (UTC)
Message-ID: <4add3fdf-aa45-4166-99aa-6709c9fa4595@xs4all.nl>
Date: Thu, 4 Jul 2024 13:58:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Add support for qcom msm8998-venus (HW vdec /
 venc)
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
References: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
 <0d66422c-ab7b-4364-bd74-d2aca24b8a2d@freebox.fr>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <0d66422c-ab7b-4364-bd74-d2aca24b8a2d@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/07/2024 13:39, Marc Gonzalez wrote:
> On 04/06/2024 18:41, Marc Gonzalez wrote:
> 
>> Changes in v5
>> - Collect latest Acks (from Vikash)
>> - Resend to Mauro
>>
>> Marc Gonzalez (1):
>>   dt-bindings: media: add qcom,msm8998-venus
>>
>> Pierre-Hugues Husson (2):
>>   arm64: dts: qcom: msm8998: add venus node
>>   media: venus: add msm8998 support
>>
>>  Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml |  4 ++-
>>  arch/arm64/boot/dts/qcom/msm8998.dtsi                           | 48 +++++++++++++++++++++++++++++
>>  drivers/media/platform/qcom/venus/core.c                        | 39 +++++++++++++++++++++++
>>  3 files changed, 90 insertions(+), 1 deletion(-)
> 
> Hello Hans,
> 
> I got an email stating:
> 
> The following patches (submitted by you) have been updated in Patchwork:
> 
>  * linux-media: [v5,1/3] dt-bindings: media: add qcom,msm8998-venus
>      - http://patchwork.linuxtv.org/project/linux-media/patch/2db42e45-c034-43be-be96-0e88511d1878@freebox.fr/
>      - for: Linux Media kernel patches
>     was: New
>     now: Accepted
> 
>  * linux-media: [v5,2/3] media: venus: add msm8998 support
>      - http://patchwork.linuxtv.org/project/linux-media/patch/eb15a48b-6185-42dd-92ca-8df33b0ea4b5@freebox.fr/
>      - for: Linux Media kernel patches
>     was: New
>     now: Accepted
> 
> 
> Yet, I've gotten a warning from kernel test robot <lkp@intel.com> stating:
> 
> arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: /soc@0/video-codec@cc00000: failed to match any schema with compatible: ['qcom,msm8998-venus']
> 
> 
> Is this because the patches are not merged in linux-next?

Almost certainly, yes. I don't see them in linux-next.

> 
> Will they be merged in v6.11 ?

They are in our staging tree for v6.11. So yes :-)

Regards,

	Hans

> 
> Regards
> 


