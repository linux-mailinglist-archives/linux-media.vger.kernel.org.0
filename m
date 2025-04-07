Return-Path: <linux-media+bounces-29486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9814BA7DA9A
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 12:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80D1A7A5206
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 10:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328B022F388;
	Mon,  7 Apr 2025 10:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EGL2FK0r"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE667DA7F;
	Mon,  7 Apr 2025 10:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744020124; cv=none; b=Ebm5eWJi2vqUjqluFqaEuTers8FXpUehOnhIpipe40KoyGK64X+lhUt/kRZ3DBaIy1VNorDMAhjed80qHN77HVSOblNnz+X7oR1EaA9XFm5GASraBNc85sF/iyR+GIOzFLgKfQTAeZfpXJ1pNgmQF+lmwF2JIlY3aYGYT0fD1rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744020124; c=relaxed/simple;
	bh=rKZ/6WAjoBuHXoOD4i+p9W+oq/5Mz26bPr4EKFlhYz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dp0jCHy0FApCzjmO9j1W1LJlzNLl/j+AIJGFueDa9jgJEbfxiMcI5ltSjGgkViKUM4G6L7ruBXSwNBJUjfuhXkgE2z9nX+epHqcxU7rw689q5IU+SNHkQLY2JWpUh0zGR5qoE7UrPCnGO1QsHHGG9BGztqD+DsOfyXAvhsB+FlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EGL2FK0r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB9DC4CEDD;
	Mon,  7 Apr 2025 10:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744020124;
	bh=rKZ/6WAjoBuHXoOD4i+p9W+oq/5Mz26bPr4EKFlhYz8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EGL2FK0rSI0J2kiHNBlNlYgkE9ZkJGI4ta8fvRDqgqxTDTaqfB2OcvTpPdOuZjWEB
	 Wi6F6M40jZUfL/w0qT/dgciRRJajlEMvlVhxiQz/bUFdn49aMd3RwlbKV7MxIIKcUL
	 flOCqE7ByDM/wiyPpjyQDsXzGQJGbZ9aNzE20Hg+S2DZzCkwKaX1woFY7NzTs7OoDC
	 RfWZfzthwcaQi0HWZq2Bz5wJOMm9u7P49znUlT8fkrCaLrnCQBokwH9wHMifyE8cQO
	 h/f1t4+jEs1qL6+xfIf99P6mg6b22eciBRsFRb0x1maWgXR655oPlT4AhaELm7rbUH
	 fvcHdHADPMyrw==
Message-ID: <5555c2e5-029f-4c77-8c6b-3ded2b2f9d33@kernel.org>
Date: Mon, 7 Apr 2025 11:01:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Some small preparations around CAMSS D-PHY / C-PHY
 support
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Barnabas Czeman <barnabas.czeman@mainlining.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, David Heidelberg
 <david@ixit.cz>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
 <D82FU3SIX5RZ.1Y525GJO0UOAA@fairphone.com>
 <eb06daf1-3cc3-4b31-a0bf-bc450cd0f041@linaro.org>
 <7bt-fuRycoJhLN28Wf0QCaz_rljIKilGsNyYSzjHz9Ig8AOEs94AlKMko__dGbNp1SgGCdHvaVZ6tU_9hCvj3Q==@protonmail.internalid>
 <D8IDHJAC4BJ1.WNTMQEJXD2R2@fairphone.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <D8IDHJAC4BJ1.WNTMQEJXD2R2@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/03/2025 07:45, Luca Weiss wrote:
> On Wed Feb 26, 2025 at 3:47 PM CET, Bryan O'Donoghue wrote:
>> On 26/02/2025 14:13, Luca Weiss wrote:
>>> Hi all,
>>>
>>> On Mon Dec 9, 2024 at 1:01 PM CET, Luca Weiss wrote:
>>>> Since the hardware blocks on the SoCs generally support both D-PHY and
>>>> C-PHY standards for camera, but the camss driver currently is only
>>>> supporting D-PHY, do some preparations in order to add C-PHY support at
>>>> some point.
>>>>
>>>> Make the dt bindings explicit that the hardware supports both (except
>>>> for MSM8916) but also add a check to the driver that errors out in case
>>>> a dt tries to use C-PHY since that's not supported yet.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>> Luca Weiss (2):
>>>>         media: dt-bindings: media: camss: Restrict bus-type property
>>>>         media: qcom: camss: Restrict endpoint bus-type to D-PHY
>>>
>>> This series is still pending, both patches got reviews and no pending
>>> comments from what I can see.
>>>
>>> Would be nice to get it in for 6.15.
>>>
>> Yes this should be merged.
>>
>> Thanks for following up.
> 
> Hi Bryan, hi Hans,
> 
> 6.15 merge window is approaching fast, I wonder if this series was
> missed still.
> 
As soon as possible.

---
bod

