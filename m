Return-Path: <linux-media+bounces-22378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C74B9DED46
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 23:46:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFEADB20CD1
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 22:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B931D1A7046;
	Fri, 29 Nov 2024 22:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="IPYlrhbN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B8639ACC;
	Fri, 29 Nov 2024 22:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732920357; cv=none; b=n2HMoPSysZSvt5x20Uw3V43WN/8PNcQ2xiIU51yJfXNi4osZZnQyPZ2dvRCJTf0abl/EvALYhiyBqw1a/dC74VLyOW+63RMjic8HBLpRMWIfUFfrWn2DVYoUlwdQ724029OCLaC135hnQgvuKUPOoRmxBJD1JOInTkXtCUuU680=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732920357; c=relaxed/simple;
	bh=UArk5G77pJxYpfp5eCo82B5YjgKMrfIg8H9O2IcLVVs=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=UI32WKEJf/C7SKOJOaEmr7pmVvrGDV3xFPl9Y3WHWB9X9lgYS4cJAscwdk7EwGYHFpsrjUg3ueBc2u9Yi5UbkkF8PrrBzw07p2kuP0296a4bLPAdQ0N5iJEV/uK4KZar6Z2eezWWJMwfCYdHmnxlOMNoALQjKhuGzfsdOzn1pPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=IPYlrhbN; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (docker-mailserver-web-1.docker-mailserver_default [172.22.0.5])
	by mail.mainlining.org (Postfix) with ESMTPSA id E254BE4804;
	Fri, 29 Nov 2024 22:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1732920352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rjad29xR4+xQq0DYAIrafdlVFdm43MRF9U8uIRYZtks=;
	b=IPYlrhbNlTbf6Xm+juyoKv5R0RVYJw0UZejoyvpB9v7GH8AAJ+mt6Kec/4o22Bc7h8uacT
	yaAZBTQaOhXkxXR6TxiVZ9Kplv569rA+ndnqGTPWCPHJ75s9CZGHzZkhPxnrgTma5MXddy
	O5GcUuvEXNeb++JiWX58Cy4MQmzqoKr3f9ioH5+zfONqGQNb4mqjkyGnMEEY0yAmEAL/nN
	3kNja00j9zM8XAvdbeaHEZ3QewBlc5rZO5pQOK7nZuGHS80Wq49BE38OfWYKspMOrgLGt0
	lVhrqaTYu1Obe5BE5Gt7ZPP8NBZ+TeIfjuU/fG41PBjYC/q7faS9eY1CPqu+7Q==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 29 Nov 2024 23:45:52 +0100
From: barnabas.czeman@mainlining.org
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Yassine Oudjana
 <y.oudjana@protonmail.com>
Subject: Re: [PATCH v2] media: qcom: camss: fix VFE pm domain off
In-Reply-To: <f4e47953-5a68-4ec5-860b-820b8eff2a2a@linaro.org>
References: <20241128-vfe_pm_domain_off-v2-1-0bcbbe7daaaf@mainlining.org>
 <3a5fd596-b442-4d3f-aae2-f454d0cd8e5c@linaro.org>
 <5cccec71-0cc7-492a-9fb9-903970da05c5@linaro.org>
 <d3a8d38c-9129-4fbd-8bd6-c91131d950ad@linaro.org>
 <a08e95fc03fce6cb0809a06900982c6c@mainlining.org>
 <8dfd2ee1-9baf-441f-8eb9-fa11e830334a@linaro.org>
 <ac765a062e94d549f4c34cf4c8b2c199@mainlining.org>
 <f4e47953-5a68-4ec5-860b-820b8eff2a2a@linaro.org>
Message-ID: <05e91ae70902f0cd9c47bb4197d8fef1@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-11-29 23:08, Bryan O'Donoghue wrote:
> On 29/11/2024 13:46, barnabas.czeman@mainlining.org wrote:
>> On 2024-11-29 13:25, Bryan O'Donoghue wrote:
>>> On 29/11/2024 11:44, barnabas.czeman@mainlining.org wrote:
>>>>> The change does not describe how to reproduce the problem, which 
>>>>> commit
>>>>> base is tested, which platform is testes, there is no enough 
>>>>> information,
>>>>> unfortunately.
>>>> I can reproduce the problem with megapixels-sensorprofile on msm8953 
>>>> and
>>>> it can be reproduced with megapixels on msm8996.
>>>> The base is the last commit on next.
>>> 
>>> Can you verify if vfe_domain_on has run and if so whether or not 
>>> genpd_link is NULL when that function exists.
>>> 
>> I have added some debug logs it seems pm_domain_on and pm_domain_off 
>> is called twice on the same object.
>> [   63.473360] qcom-camss 1b00020.camss: pm_domain_on 19842ce8 link 
>> 42973800
>> [   63.481524] qcom-camss 1b00020.camss: pm_domain_on 19840080 link 
>> 4e413800
>> [   63.481555] qcom-camss 1b00020.camss: pm_domain_on 19842ce8 link 
>> 42973800
>> [   63.481632] qcom-camss 1b00020.camss: pm_domain_off 19840080 link 
>> 4e413800
>> [   63.481641] qcom-camss 1b00020.camss: pm_domain_off 19842ce8 link 
>> 42973800
>> [   63.654004] qcom-camss 1b00020.camss: pm_domain_off 19842ce8 link 0
>>> That's the question.
>>> 
>>> ---
>>> bod
> 
> Could you provide this output ?
> 
> index 80a62ba112950..b25b8f6b00be1 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -595,6 +595,9 @@ void vfe_isr_reset_ack(struct vfe_device *vfe)
>   */
>  void vfe_pm_domain_off(struct vfe_device *vfe)
>  {
> +dev_info(camss->dev, "%s VFE %d genpd %pK genpd_link %pK\n",
> +        __func__, vfe->id, vfe->genpd, vfe->genpd_link);
> +
>         if (!vfe->genpd)
>                 return;
> 
> @@ -609,7 +612,8 @@ void vfe_pm_domain_off(struct vfe_device *vfe)
>  int vfe_pm_domain_on(struct vfe_device *vfe)
>  {
>         struct camss *camss = vfe->camss;
> -
> +dev_info(camss->dev, "%s VFE %d genpd %pK genpd_link %pK\n",
> +        __func__, vfe->id, vfe->genpd, vfe->genpd_link);
>         if (!vfe->genpd)
>                 return 0;
> 
> ---
> bod
I think logging in pm_domain_on should be placed after device_link_add 
because only NULL
will be visible.
[   83.040694] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 genpd 
000000009bd8355f genpd_link 0000000000000000
[   83.049293] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 0 genpd 
00000000bfb65e7c genpd_link 0000000000000000
[   83.049353] qcom-camss 1b00020.camss: vfe_pm_domain_on VFE 1 genpd 
000000009bd8355f genpd_link 00000000ccb0acd9
[   83.049641] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 0 genpd 
00000000bfb65e7c genpd_link 00000000348ac3c1
[   83.049654] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 genpd 
000000009bd8355f genpd_link 00000000ccb0acd9
[   83.241498] qcom-camss 1b00020.camss: vfe_pm_domain_off VFE 1 genpd 
000000009bd8355f genpd_link 0000000000000000

