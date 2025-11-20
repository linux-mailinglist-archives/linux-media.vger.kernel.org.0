Return-Path: <linux-media+bounces-47479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DB35BC73528
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 10:55:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2EAF235B4B5
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 09:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE02318135;
	Thu, 20 Nov 2025 09:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QydbJRKb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0D0289374;
	Thu, 20 Nov 2025 09:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763632165; cv=none; b=bgVVEj+tCnxa0O0jkodb21p/cdbuVHs0VlBpGqpkokhs64rtaLTf+lyQ9yWZ0kx+mmE6RS+0vYRXWmsxQJZ8NNniTc/nmppnznoOidstc+ScDgTOZYnYixrsTpO3ihY9UQMgIeNjgtgH/sIl7heETKRabxZoaTrCsFVIVfXNWE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763632165; c=relaxed/simple;
	bh=dvM4B7LduGqZwCK3+WCn/AZAsheZGY6nLWevOlwFGXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgCh3YL56IFLXzGE+2K6w99S1SuKqSaIiFh/xE6agsnZ5fK4eB/TQp6iua3sAodPzPFfMgLg+iEzuJkkPLn8PhNYODMsuQ7cCuK9pu6xiZ/EtgwbG7++vYTfbqfRfNbVRDKPT9siZ91yETwRE6pWHX5+w6EQh20UbRg6IDCUC84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QydbJRKb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CCCC116B1;
	Thu, 20 Nov 2025 09:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763632165;
	bh=dvM4B7LduGqZwCK3+WCn/AZAsheZGY6nLWevOlwFGXw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QydbJRKbzt7P36AxXU5H6YaKV91cAvE+dXtVbZYTH/X+JDMegROXfejygzC0T5lZp
	 2NK84RtFK3090kpEdngEsX2MZb/wiT1nk/H4I2YO6nLP2Fq8PqosRMogNh8o4p6XbW
	 UiuxbiciVO1oVvMFKtCgnRmVn8JR4ch7KjLf0n/1y/9tfSTrOBJiQ+dSnCLEGcjZDT
	 l8BfksBYeXpIiMyM4iIJjwTqBQ7qz4EJa4cp8YLWIO/9QR9+MhJNzLFtLf/zreH+ej
	 WUHD0SexoBsg+83ARugzYaSFDfZW3Q/xM8Jn+wH4xW310zVIoxYYAyKUxGSpjTyKhO
	 Bp1Gxcu6gvlcg==
Message-ID: <e01513fb-8ed8-4d4b-9111-bbf8ac4cce89@kernel.org>
Date: Thu, 20 Nov 2025 09:49:19 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] media: iris: prepare support for video codecs on
 Qcom vpu4 platform
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20251107-knp_video-v3-0-50c86cbb0eb8@oss.qualcomm.com>
 <3vbq76dpjnadfrnufojq4zqiv7p5p555rhxfx6yoncc354p3lk@ohcs3ldhuoao>
 <2d56fc4b-6e3c-4f83-aab1-c48db3b8bb2d@oss.qualcomm.com>
 <CAO9ioeXSXwm03e_j8TuXz2Sqr1J2n3uEFH6dJoKVyE+hJx+woQ@mail.gmail.com>
 <CqumdLRBMbxjJJOg6C6EeqguhrWjaK5WBB4UMhO2Fv6xoQk9TRSK-DINrfI91fM-Z6RL4XA9c41Wyf4e5gICnQ==@protonmail.internalid>
 <be157faa-b062-4726-83e2-ffdeaf792b50@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <be157faa-b062-4726-83e2-ffdeaf792b50@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2025 05:09, Vikash Garodia wrote:
>> One additional bonus is that fluster runs several process in parallel
>> by default, catching issues caused by several decode threads running
>> in parallel.
>>
> multi process issue is due to below [1] (tried it on lemans). Due to
> higher concurrency, we can see that the DMA buffer is mapped into
> un-addressable range (0-0x25800000) i.e 0x24b00000, and leading to
> global fault. This was the reason i was keeping 2 memory-region in
> kaanapali binding, to restrict certain ranges of IOVA.

If that is currently true then we should restrict concurrent sessions 
entirely unless/until it can be safely supported.

---
bod

