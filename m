Return-Path: <linux-media+bounces-47825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E53D8C8DD34
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 11:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D931E4E2203
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 10:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3F632ABCE;
	Thu, 27 Nov 2025 10:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2F3beYn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104B332ABE8;
	Thu, 27 Nov 2025 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764240240; cv=none; b=Tq0o7ckS2LSMNG3jY0+7pr4wqKHJcbO+KfLJWz9rGHOk4U4HZc4jpMCMB8dYMNQ+Fk3QHgiOUQX7LqOZ7w7FoPB4/aoV1X9m0PcAlzTyFamhxF/QeEHh6Eeg06cX8BIuImi6FXS28kEJkjXNFODRowm2WZlTDnOnxR2juwNIO4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764240240; c=relaxed/simple;
	bh=9/k6lqbyHSwCYWjXq7INSOGfUZnMtckPWoXjhaF+nsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I2lDpQnu8t7/+ZcJjRJ3PDL2+3GdM5TDRJU0OjnjododjhtgIxdvNMzs+5BEtUCIXxNDfLczc9iZLcrZ0SgAXbbS35pQ7DedPGvuoaspMChi+Dmt61AYROtcQULPuyy7rdcOJk1FGP4AoHLJBt0Xr5wVom/rMEfe7u8cBztMLJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2F3beYn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A880C4CEF8;
	Thu, 27 Nov 2025 10:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764240239;
	bh=9/k6lqbyHSwCYWjXq7INSOGfUZnMtckPWoXjhaF+nsc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a2F3beYnLWdLfgiuF57I6SXU+Go+DTWwhFR4aRxQt7F1aq7zc3f6VYHl7e68FlA9O
	 ieWvQkqpv2ZAM/AlIDSb2o/HYHX207gR+Vw6oiSQmeqkUYDLXwqBMbl/N6SrzTAxpW
	 vai75MqnMW2W9PyK7GxOaByeLn9xZ4/fLl8KANZHfUBekDk2Ady8JhPCtNlEowXBp3
	 UFv353BYjWLjb053T9Q/iz1Xn2ECjMg8jIDAvb+U9PwMwbzkN36/3XOA/HC+Zu0Q5x
	 gTpFXuKevwRKDok+X2gAdWTwsH4S6/iETGRl9Qfg24tt7swUUCvASh6fZ6PNfZXj+h
	 YvWICzzf9KqAg==
Message-ID: <a376aef7-2cbc-45bd-a0d0-745238681b4a@kernel.org>
Date: Thu, 27 Nov 2025 10:43:55 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: qcom: iris: Add B frames support for encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com>
 <0RpTUQpD7Q78IUmEj6-bUEv88YSaTJgDDRCijfUjARogqOhmeEA_EwzpNqYcEPUgHGaC7PfHqP51IBfGQCilfw==@protonmail.internalid>
 <20251127-batch2_iris_encoder_enhancements-v1-3-5ea78e2de2ae@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251127-batch2_iris_encoder_enhancements-v1-3-5ea78e2de2ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/11/2025 07:44, Wangao Wang wrote:
> +	intra_period.pframes = (gop_size - 1) / (b_frame + 1);
> +	intra_period.bframes = b_frame;

Why do you need to set pframes when setting bframes ?

---
bod

