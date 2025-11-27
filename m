Return-Path: <linux-media+bounces-47823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 39109C8DCAD
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 11:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1ABAF4E3A3B
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 10:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733D832A3E5;
	Thu, 27 Nov 2025 10:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jerMgfuf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A489A322C66;
	Thu, 27 Nov 2025 10:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764239727; cv=none; b=Ja9cEN2rORP5Pr+WPqV9TowPMbhRI2x63rj3IQh/k5cTDDzAMJtUqouqrZcMVrezR9FCwuRFSW3xjwVsFEYU5z46ZeFXvDceA/+uhCagtzhumU5JPC0Y0pWcyfbXQgaocTW1jugjnKR3tcUF7jqVnXJdhnDqPtZTx+tEzH6Si3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764239727; c=relaxed/simple;
	bh=GmXxjibDgLVQnOiUFUsSBuMsX3RAbB0Cti+TLlUtxKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KuiSqblcA3hB5LHOIXJb1Orj5/RCilq/3w3iXg2lFIBiO3M6ZZxSBSuBjKerNGjv/MveHEqRbKa+k/QBDqpQbYWsbXhFFmI7CDlRO2cjBgabdStNA5Es4Eo5kDn2cqDI4g2HqvLZhv4kbKo83lR11/S7PeHsl7qAglGzPX6p42E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jerMgfuf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4CB8C4CEF8;
	Thu, 27 Nov 2025 10:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764239727;
	bh=GmXxjibDgLVQnOiUFUsSBuMsX3RAbB0Cti+TLlUtxKc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jerMgfuf0b8LKMfKIzvDlUU2rkoA3qakPh8Okin5x/5xSsmYCB/IAVJw7tU6vFVOt
	 NqT0FuqsKKddPipe6oRm4n6LuHgOtaRIcayf/TjrIETonEDeWY5D6Yf5lRxiiY3Yol
	 2HGvFWU+xAA+aJAgA4S1sBtbX8VNRDc7cAeVfWzjP0S+u88/UxWd2iR/fMPws2j+lV
	 f4gZBay2Voes25S4AiyKkJHOv04srftK5lGD516Zpi+K2Po0VaaynUBMbseQFQGCJS
	 MJe3/bgsSawlaWtei3UydehlgpwTmypvwLkbJ0ESeJSC2UdayYCu8AtJPWI1LkWYge
	 oQqW6qEadZSCw==
Message-ID: <0e00467c-6d24-43f0-8a66-72160631d2fc@kernel.org>
Date: Thu, 27 Nov 2025 10:35:23 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: qcom: iris: Add intra refresh support for gen1
 encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com>
 <54pZM7wO84wvdB_kwjNvPB0WMjjfGPPtDLg2eXpiGDYgz1N43hG2Z8TLP-nbVVhCwW-77N_i4K4QunzrO8HtKw==@protonmail.internalid>
 <20251127-batch2_iris_encoder_enhancements-v1-1-5ea78e2de2ae@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251127-batch2_iris_encoder_enhancements-v1-1-5ea78e2de2ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/11/2025 07:44, Wangao Wang wrote:
> +	hfi_val.mbs = fmt->width * fmt->height;
> +	hfi_val.mbs /= 16 * 16;

256

But why ? Also why express it as 16 * 16 ?

> +	if (hfi_val.mbs % ir_period)
> +		hfi_val.mbs++;
> +	hfi_val.mbs /= ir_period;

This code deserves some commentary.

---
bod

