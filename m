Return-Path: <linux-media+bounces-22334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B609DC30E
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 12:45:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB038163600
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 11:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3520815EFA0;
	Fri, 29 Nov 2024 11:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="BLo1TyTF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCC4199FAF;
	Fri, 29 Nov 2024 11:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732880701; cv=none; b=cQoN4R4Q7T+XV29z1tUTTIFgxhR7124Oxt4yAJl+6euo/GOnL9hchN2pRcpPDCjnD3KbSXO25hNRDncjz/9qFfvRHmYNjbbQ+qDYSgbDxOwxLfROFkosw1T7QJMetSS1upHe/GLs8XJndmQb5kJkAIXw3Srv3w3njSvKqjSOQqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732880701; c=relaxed/simple;
	bh=WL6VYT4cnVYmoZ/uwh5HBB63E17dxPA+KwxNL9WmStM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=mRIftJdw4mqJKDNBVEYk7dHvykeOjpwstmAu1Wj3Ut48LugoYoA07wMfI/2MzNOb4vQcH5K/o0vClbsPJgvtsLY7EOTbmXC28NmNZ0RkzuLIyFLBnyixyMi5pFya9Fg4mvm80pshlWTYbF2h/EuX0gBkYuVNegrQMisIL8dc844=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=BLo1TyTF; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (docker-mailserver-web-1.docker-mailserver_default [172.22.0.5])
	by mail.mainlining.org (Postfix) with ESMTPSA id B67CFE4804;
	Fri, 29 Nov 2024 11:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1732880691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+CyCn8Sr/299XRZf/a3AN7R1bJZX2Uhv3f+N4St1US4=;
	b=BLo1TyTFi+/n2efozDsksLYnL+KXe0/X2WuE6Qnk+2OsQwDmayKNMjMPBGQpxw0MgurK1r
	DZ8v3L8x51dJiWh5aTWUDurK3vATzyJVw1X7y+sNeVx8xltXppMkxBIYvSvTvxureTcLzK
	PgQ2CFZ5lxq1XY2B6eecT+PPQ3XCjuDJ5aP9khCYjtJ6fG06Y9f4fJ4syFUf0rouLbU3jR
	5ZkoFY2kjCDJqYzgmZTTc51etg7Hn55QULo69OsW6Ap3ZmsBMXpoQsxJ52WA7mvF3tpJC4
	mprEsGfBXXbELVC/bUIxeOzohcz/k3mOrs7GrAPMISyAtHUEyhAnPXWkUELMVg==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 29 Nov 2024 12:44:51 +0100
From: barnabas.czeman@mainlining.org
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Yassine Oudjana
 <y.oudjana@protonmail.com>
Subject: Re: [PATCH v2] media: qcom: camss: fix VFE pm domain off
In-Reply-To: <d3a8d38c-9129-4fbd-8bd6-c91131d950ad@linaro.org>
References: <20241128-vfe_pm_domain_off-v2-1-0bcbbe7daaaf@mainlining.org>
 <3a5fd596-b442-4d3f-aae2-f454d0cd8e5c@linaro.org>
 <5cccec71-0cc7-492a-9fb9-903970da05c5@linaro.org>
 <d3a8d38c-9129-4fbd-8bd6-c91131d950ad@linaro.org>
Message-ID: <a08e95fc03fce6cb0809a06900982c6c@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-11-29 12:20, Vladimir Zapolskiy wrote:
> On 11/29/24 13:06, Bryan O'Donoghue wrote:
>> On 29/11/2024 08:48, Vladimir Zapolskiy wrote:
>>> On 11/28/24 21:39, Barnabás Czémán wrote:
>>>> Fix NULL pointer check before device_link_del
>>>> is called.
>>>> 
>>>> Unable to handle kernel NULL pointer dereference at virtual address
>>>> 000000000000032c
>>>> Call trace:
>>>>    device_link_put_kref+0xc/0xb8
>>>>    device_link_del+0x30/0x48
>>>>    vfe_pm_domain_off+0x24/0x38 [qcom_camss]
>>>>    vfe_put+0x9c/0xd0 [qcom_camss]
>>>>    vfe_set_power+0x48/0x58 [qcom_camss]
>>>>    pipeline_pm_power_one+0x154/0x158 [videodev]
>>>>    pipeline_pm_power+0x74/0xfc [videodev]
>>>>    v4l2_pipeline_pm_use+0x54/0x90 [videodev]
>>>>    v4l2_pipeline_pm_put+0x14/0x34 [videodev]
>>>>    video_release+0x2c/0x44 [qcom_camss]
>>>>    v4l2_release+0xe4/0xec [videodev]
>>>> 
>>>> Fixes: eb73facec2c2 ("media: qcom: camss: Use common VFE 
>>>> pm_domain_on/
>>>> pm_domain_off where applicable")
>>>> Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>> ---
>>>> Changes in v2:
>>>> - Add backtrace to the commit message.
>>>> - Link to v1: https://lore.kernel.org/r/20241122-vfe_pm_domain_off-
>>>> v1-1-81d18f56563d@mainlining.org
>>>> ---
>>>>    drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>> 
>>>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c 
>>>> b/drivers/
>>>> media/platform/qcom/camss/camss-vfe.c
>>>> index
>>>> 80a62ba11295042802cbaec617fb87c492ea6a55..1bf1473331f63b9ab106d21ea263c84d851c8a31 
>>>> 100644
>>>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>>>> @@ -595,7 +595,7 @@ void vfe_isr_reset_ack(struct vfe_device *vfe)
>>>>     */
>>>>    void vfe_pm_domain_off(struct vfe_device *vfe)
>>>>    {
>>>> -    if (!vfe->genpd)
>>>> +    if (!vfe->genpd_link)
>>>>            return;
>>>>        device_link_del(vfe->genpd_link);
>>>> 
>>> 
>>> I object to this change, there might be a problem in the code, 
>>> however it
>>> is not yet identified.
>>> 
>>> vfe->genpd is not NULL, if vfe_pm_domain_on()/vfe_pm_domain_off() are
>>> called appropriately, the "fix" does not fix the real problem, it 
>>> veils it.
>>> 
>>> -- Best wishes,
>>> Vladimir
>>> 
>>> 
>> 
>> Let's walk through the logic.
>> 
>> vfe->genpd =
>> 
>> Can happen in vfe_subdev_init();
>> 
>> vfe_pm_domain_on() can fail @ vfe->genpd_link =
>> 
>> If it fails then I _suppose_ we are still calling vfe_pm_domain_off() 
>> at
>> least that's the only logically way I see this error can manifest.
> 
> There should be no room for suppositions, the source code is open.
> 
> If the described by you case is true, and vfe_pm_domain_on() fails,
> then vfe_pm_domain_off() shall not be called, otherwise that's the
> real problem and it shall be fixed instead of being veiled by the
> proposed change.
> 
>> @Barnabás can you confirm that this is the case ?
>> 
>> If not, can you please provide more detail ?
> 
> The change does not describe how to reproduce the problem, which commit
> base is tested, which platform is testes, there is no enough 
> information,
> unfortunately.
I can reproduce the problem with megapixels-sensorprofile on msm8953 and
it can be reproduced with megapixels on msm8996.
The base is the last commit on next.
> 
> --
> Best wishes,
> Vladimir

