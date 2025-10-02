Return-Path: <linux-media+bounces-43642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F39A1BB3FDA
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 15:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0650A19C525D
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 13:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F39311C31;
	Thu,  2 Oct 2025 13:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gsIXbF1e"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8DE29ACC5;
	Thu,  2 Oct 2025 13:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759410740; cv=none; b=YHefaHr6Zy5KW5MDtr6c5igYEg3ujLKHz4PjSFR5mTW+pRCnJ9R5KM7gY/9bRw1Hrq/1r5pzsSwCZu8DLcpjt5QEEGgQM+IPhY/dgyZY7iez/egTrmOcdKB9FG0CwISnC7oMp80vxE7Y6rzjA+Pwo8IC6nE6Yo2YQ+AnkGp/+CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759410740; c=relaxed/simple;
	bh=y7aX4lbkpltMNipgy0YD9zDoYMM8nzuOWLeGW3EjzWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tX7KrsKcPvOqKX/zwqrIre6FYrrXSaHObIjIJ5LDOcXW82D/i1bY6orfbJvWGXm5iFq/4BXmB4H/dQWQaHb5Lcgc05NFo29iHKOr31A/oTS0B6Zuhn7dV3za7ql6T4WkoPr7y92WZGflPrrLMr279dEblINgQzoLWbO51+hRHHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gsIXbF1e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D70C4CEF4;
	Thu,  2 Oct 2025 13:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759410739;
	bh=y7aX4lbkpltMNipgy0YD9zDoYMM8nzuOWLeGW3EjzWw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gsIXbF1eOLut9RdxYVNi775fhNJF0J75KTHW2n4GzILNiJFLQDFo8EN7h0lLm5S6E
	 yxCEeK2j1aug2hDtD50Ymvu0qq++D6+6BaBGk7HFth0QMCoQYJ3YtD2zB6qrSLOA09
	 7zMEZKIVALrXBgL376eKdpjGbkMJhkNPqIxFzU7KDpuWq5VzmTBZfPNNEEiZPXtwwE
	 /SK22wCT950sihegNEhGFqcnfQ/Eu6h8BL6HbQBUOHoMiB1PZ/iNP+/QDnimxNOcUl
	 GqsrUKVuzUkCibsVx1I7b6STuRmsDgKxZmOBd0iOyF3WDuJB/5vb/8cDBKBmRhgAVZ
	 GoseV/EOAObmw==
Message-ID: <96091daa-0868-45c8-b16b-39076862b8ee@kernel.org>
Date: Thu, 2 Oct 2025 14:12:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable CCI
 pull-up
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Wolfram Sang <wsa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20251002-dw9800-driver-v1-0-c305328e44f0@fairphone.com>
 <20251002-dw9800-driver-v1-3-c305328e44f0@fairphone.com>
 <H1UBvTPPR7Tu-lzvNcSjkBkAs8KXmTnMGOywmOMU19jtFgF0aChDEfnEcTarceYFIPulLRbHW3ar30_uNW2HjA==@protonmail.internalid>
 <1be80052-3ba5-46de-804a-de995f8db5d4@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <1be80052-3ba5-46de-804a-de995f8db5d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2025 13:45, Konrad Dybcio wrote:
> On 10/2/25 12:15 PM, Griffin Kroah-Hartman wrote:
>> Enable vreg_l6p which is used as a pull-up for the CCI busses, to make
>> sure I2C communication works as expected.

"vreg_l6p is the voltage source for the pull-up resistor"

>>
>> Signed-off-by: Griffin Kroah-Hartman<griffin.kroah@fairphone.com>
>> ---
> Makes me wonder if we should maybe extend the CCI definition
> (or maybe the common i2c-bus binding?) to accept an external
> pull-up supply, as this is a common problem.. (+Bryan, Wolfram)


always-on is up to the platform - i.e. do you care about the 
floating-state of the i2c bus in power-collapse anyway ? Feels like 
something up to the platform designers.
> We could then shut down the regulator when cameras are not
> in use, preserving some trace amounts of power.> Or maybe L6P is already used as a pull-up supply for more things
> onboard and should be always-on either way? Could you please
> check that, Griffin?

If we drop always-on and introduce a "pullup-supply" to the CCI bindings 
then, it would be up the CCI driver to enable/disable the bus pullups 
and then we can optionally do the power-rail disable when entering 
power-collapse.

That'd be nice.

As-is though I personally am fine with the patch as-is with the updated 
commit text above - consider the CCI change as extra homework ;)

Assuming the commit log is tweaked.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

