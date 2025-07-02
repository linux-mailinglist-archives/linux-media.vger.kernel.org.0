Return-Path: <linux-media+bounces-36535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F80AF134C
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 13:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 678BE1C40333
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 11:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CA925CC78;
	Wed,  2 Jul 2025 11:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHceGs0B"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE92229B13;
	Wed,  2 Jul 2025 11:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454418; cv=none; b=qxNnHt65a4d6xGGr/t/A8x5+V0P32G1+hBHJUVy0QcTiCvt4j72hll0KjhcmajUOBMLMd4+yElOpcuHEdhaQPXT0MSfO/jWVTj5APNS9XL5djflskoU8RX4cTiJm9210+LDXZK5/qqAD+9Tcq/NZVtJFs6RdJieahDLO8S1eseQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454418; c=relaxed/simple;
	bh=V4ZvbV+utYGaS+nMrpeovAg5Soy1OoSUqJYfth1mDFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNJGlhDkoI3ZwiDm8FVMPXHfndE0q+ARrPpPKtxt/IbMNzTgbZvkBd1BWGjz4GloBb6FSHa2uYLa5xXlaOaF83nBMmYK40F4An7Hma3M6TyZFM1exv8nRXOJgh1S5JWbmR2BizgJF/tie6saRly/u7I/ZNkx/aWivMAih/DYOaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHceGs0B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF71CC4CEED;
	Wed,  2 Jul 2025 11:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751454417;
	bh=V4ZvbV+utYGaS+nMrpeovAg5Soy1OoSUqJYfth1mDFw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nHceGs0BnztE7stB9ML2HzIAG4JOJfQBhgTdPzurUNC7hJ+Ula8M22MtwmHN09e2H
	 sTu6O2pLXXsuZKh+rJBdxd6LJeWpg2NmWqSrDnrxBpijNxRPlNmBpg5ludnZ23uv2J
	 MIURhA1WmB0pL/e5BesUzIun1eZ6lgl4vk75lMyAVIngtM6VD8r6QiwuruDUEdmENP
	 Hoe/E5tcRXaXObeBv4ilWlV7JqWHsM/CWaP/V3CTufOXCtgeo6vvlsTGwLVW2yh9oH
	 lR9srsyhEcH6o/5FdYDYHSu5TP6aF1BueFwbyz7q6fom2qi9WQbDJGuWeF8jgut6Lv
	 9QIjt2IzBe+HQ==
Message-ID: <76c87d1b-9f40-44b3-824b-22289b873866@kernel.org>
Date: Wed, 2 Jul 2025 13:06:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <6c5d9ff2-fa59-4151-99fe-3bddae46b507@linaro.org>
 <79342b8f-4cef-fc48-c40f-5636f868af2e@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <79342b8f-4cef-fc48-c40f-5636f868af2e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/07/2025 12:23, Vikash Garodia wrote:
> 
> On 6/30/2025 11:34 PM, neil.armstrong@linaro.org wrote:
>> On 27/06/2025 17:48, Vikash Garodia wrote:
>>> This series introduces a sub node "non-pixel" within iris video node.
>>> Video driver registers this sub node as a platform device and configure
>>> it for DMA operations. All non pixel buffers, i.e bitstream, HFI queues
>>> and internal buffers related to bitstream processing, would be managed
>>> by this non_pixel device.
>>>
>>> Purpose to add this sub-node:
>>> Iris device limits the IOVA to an addressable range of 4GiB, and even
>>> within that range, some of the space is used by IO registers, thereby
>>> limiting the available IOVA to even lesser. For certain video usecase,
>>> this limited range in not sufficient enough, hence it brings the need to
>>> extend the possibility of higher IOVA range.
>>>
>>> Video hardware is designed to emit different stream-ID for pixel and
>>> non-pixel buffers, thereby introduce a non-pixel sub node to handle
>>> non-pixel stream-ID into a separate platform device.
>>> With this, both iris and non-pixel device can have IOVA range of
>>> approximately 0-4GiB individually for each device, thereby doubling the
>>> range of addressable IOVA.
>>>
>>> Tested on SM8550 and SA8775p hardwares.
>>>
>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>> ---
>>> Changes in v3:
>>> - Add info about change in iommus binding (Thanks Krzysztof)
>>> - Link to v2:
>>> https://lore.kernel.org/r/20250627-video_cb-v2-0-3931c3f49361@quicinc.com
>>>
>>> Changes in v2:
>>> - Add ref to reserve-memory schema and drop it from redefining it in
>>> iris schema (Thanks Krzysztof)
>>> - Drop underscores and add info about non pixel buffers (Thanks Dmitry)
>>> - Link to v1:
>>> https://lore.kernel.org/r/20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com
>>>
>>> ---
>>> Vikash Garodia (5):
>>>        media: dt-bindings: add non-pixel property in iris schema
>>>        media: iris: register and configure non-pixel node as platform device
>>>        media: iris: use np_dev as preferred DMA device in HFI queue management
>>>        media: iris: select appropriate DMA device for internal buffers
>>>        media: iris: configure DMA device for vb2 queue on OUTPUT plane
>>>
>>>   .../bindings/media/qcom,sm8550-iris.yaml           | 40 ++++++++++++++++-
>>>   drivers/media/platform/qcom/iris/iris_buffer.c     | 15 ++++++-
>>>   drivers/media/platform/qcom/iris/iris_core.h       |  2 +
>>>   drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 20 ++++++---
>>>   drivers/media/platform/qcom/iris/iris_probe.c      | 50 +++++++++++++++++++++-
>>>   drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
>>>   6 files changed, 119 insertions(+), 12 deletions(-)
>>> ---
>>> base-commit: 8d2b7fde56597ca912f5daaf3ab58915458ba1fc
>>> change-id: 20250619-video_cb-ea872d6e6627
>>>
>>> Best regards,
>>
>> I tried the patchset on SM8550 QRD and SM8650 QRD/HDK and the system just reboots
>> a few millisecond after probing iris, no error messages nor reboot to sahara mode.
>>
>> The DT changeset for reference:
>> https://git.codelinaro.org/neil.armstrong/linux/-/commit/e1b3628469c038559a60d310386f006f353e3d59
> 
> I was able to repro this case, the issue was due to a incorrect node name in
> driver. Fixing the name as per binding, fixes the issue for me. I have made the

Because this code was never tested... I found this response now, after I
briefly look at your code.


Best regards,
Krzysztof

