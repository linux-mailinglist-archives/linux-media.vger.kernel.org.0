Return-Path: <linux-media+bounces-44745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E264BE3D1D
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 15:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2D6DB50218C
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 13:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3DD33CEB3;
	Thu, 16 Oct 2025 13:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcvMWYo6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245892E7179;
	Thu, 16 Oct 2025 13:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760622926; cv=none; b=oAHtL31Yu1WYkjzZ4Rm30A8PmNefp+MCjwZM70CCJah7xJR2916AlYkVPYRYGpB6mjmD7KGXR5BjzLcJYBsu/vGiBB4lIgbVbkVIYScAQCCkEbBLr2XTmVLbR3jzeM9lu5pTsS+VtxGGScuujiuYmQsSi/TvqVXNbMvwbrEOik8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760622926; c=relaxed/simple;
	bh=UEKp1DHAqPsI6gpkgu9tC/Ox9lhUWrYCS7E0VTkLkKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lft8FyiTfu0RFdDtMp5Y0s6HrKurivCBrRxC5vCht+E6rYH9YhVQC2SWuDd+CucbK09bi0S/LyxqGRmJlqw/LW2DXnzBpQogyrNQSHdgxbIP/qWF6I2Ntm/ho0AlBdPgAUVouHzZYK0BL3X1+63myrMgLbTOkbG+W5EMD+bAODE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcvMWYo6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44DE0C4CEF1;
	Thu, 16 Oct 2025 13:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760622925;
	bh=UEKp1DHAqPsI6gpkgu9tC/Ox9lhUWrYCS7E0VTkLkKc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jcvMWYo6bGSIeoJKKdb+YNp0NXUn0fAq+GEtFWjhyKip2w94+ZO0nUQSCsCnc1Cjm
	 tvaNWT34osvZA7pQbxGx+/9qinfl/czRRNmBS/RzKqi1vpADnqqEpcVpEn+Oy6CiIm
	 lgtOYCE7iif0mFWCoStXSGRDTByDvZIV23kFwWUdokLx2iMCkTQ21gnlCh19tCA+kT
	 4CUhGXBiSlHFJwJs2CW8OIdsqCSmuDoYQ0KyaTKNn11j1bnf5dqb8n1JYwxPj6Vb8F
	 BzpbqWKTDfZcnMHzDkOBJwOd2E0do98bEuUHqH4Vmx2u1e3kL0ACz2L05wE8zJM80U
	 Xcmj0IeY6QclQ==
Message-ID: <aedc5761-75da-42bf-9147-dcde24c8e976@kernel.org>
Date: Thu, 16 Oct 2025 14:55:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: qcom: camss: add support for SM6150 camss
To: Wenmeng Liu <quic_wenmliu@qualcomm.com>,
 Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com>
 <20251016-sm6150-camss-v1-2-e7f64ac32370@oss.qualcomm.com>
 <1d4d4627-7fe9-43b2-8622-8ffc078e30a6@kernel.org>
 <JB8KRP8D1088VuLugU36X7P6tKDpkMBU5kGjc3Ctu2fJYw-lIui1NJQiQUwjwRGSdVwJ0VlOP7LPWlKMTU7OZw==@protonmail.internalid>
 <e4be125c-752e-46c9-9637-fe23cbf04b1a@qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <e4be125c-752e-46c9-9637-fe23cbf04b1a@qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/10/2025 13:36, Wenmeng Liu wrote:
>>> +    case CAMSS_6150:
>>>            regs->lane_regs = &lane_regs_qcm2290[0];
>> You don't need to specify the array index for that.
>>
> Here I have only added "case CAMSS_6150:", then do I need to modify the
> part of "&lane_regs_qcm2290[0]"?

Hmm no I'm wrong - again.

Please don't be afraid to call people out on being wrong - like I am now.

Existing code is:

         case CAMSS_X1E80100:
                 regs->lane_regs = &lane_regs_x1e80100[0];
                 regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
                 regs->offset = 0x1000;
                 break;
         case CAMSS_8550:
                 regs->lane_regs = &lane_regs_sm8550[0];
                 regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
                 regs->offset = 0x1000;

Your comment is consistent with existing code.

You may ignore the previous statement.

---
bod

