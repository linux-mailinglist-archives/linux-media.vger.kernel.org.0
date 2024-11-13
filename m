Return-Path: <linux-media+bounces-21385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A774F9C776D
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 16:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C7B72817BB
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 15:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7ED2064EF;
	Wed, 13 Nov 2024 15:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="qanlvIH8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658D81632CD;
	Wed, 13 Nov 2024 15:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731511976; cv=none; b=TNHWeOP/LwLXgIfYjBz1SltpB7jIKHi66FKV+paeM3eslZZTNauAHxuxen3Sfnup1t5uGBuTxSi1RTsEL29C2UXldxjAXeKFCDhN/U1rXZm9aS5uTMl42XScowKJ+YzYB/fcdNOYSs9cFg3wUuwvEuETPsAnbrY3RTKN5hr1/FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731511976; c=relaxed/simple;
	bh=HVF86oa8uPOdeY5CzEJ/p4wFpJYQxUgEkA5QxLg8r2I=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=WZYN9F6CJh+N4BFA2YKxrh7btJ2T9AuShW9jAVTDvGBE3WQi85wy+3Gilo7E222Ix7mDMiGocFmPULycNn9YhA7mNmeJPdTot8LQPZCjDBIvUqApvNnaJH9S4ZDlbje+NL+5SYgBvdsq+lB7CNpqatVobtTJq34WY98PFt1/TDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=qanlvIH8; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (docker-mailserver-web-1.docker-mailserver_default [172.22.0.5])
	by mail.mainlining.org (Postfix) with ESMTPSA id 72372E44EA;
	Wed, 13 Nov 2024 15:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1731511972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lOqssupN+rXeOt25fdj2J/a1pUDEnX2cpTj+xiEHHj0=;
	b=qanlvIH8/EIuGp+Cgf86ohGQ0rMdIERH9PTsExQxavQ6gT8Zlaj5eb5UPOKSujqTC7SZsL
	iCgvGMSUs1cEirL5gp9IoRNCurZOYlvtURyy3fw0RDr+I1veaKTf+khlB0uq+LqAktb8gj
	A+FVG1CC6NyVzlngiaatpjxgWLPbiHlWFksrbnIJ6pQ+OpZoHcrxAu0xIqbVG7SRfWeq1R
	JswSoejmut7cxbV1gpAh6HlR80D8by6ThxE83kTJlD2IjmvHHlMSIr4GZfHlnUT+T17aJp
	5R0nw1XwbBVLMBp3HSBr5RBA1ZyNrrOoresBGFTQTJ4xpvpRmQMxAgySn1d8kA==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 13 Nov 2024 16:32:52 +0100
From: barnabas.czeman@mainlining.org
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Vladimir Lypak
 <vladimir.lypak@gmail.com>
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add MSM8953 resources
In-Reply-To: <eda3d0ae-50eb-43b2-a234-93b209fbcdeb@linaro.org>
References: <20241103-camss-msm8953-v4-0-48d0ec75958d@mainlining.org>
 <20241103-camss-msm8953-v4-3-48d0ec75958d@mainlining.org>
 <6833ebc6-9210-471a-8ca6-5f3605155f33@linaro.org>
 <412b3252f1ca795fbcfaf5e466e94642@mainlining.org>
 <67d014f1-9424-4b88-b031-096a5596c5c8@linaro.org>
 <eda3d0ae-50eb-43b2-a234-93b209fbcdeb@linaro.org>
Message-ID: <ffa2a863c8a9b99582ad6648600d372b@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-11-13 16:23, Bryan O'Donoghue wrote:
> On 13/11/2024 13:28, Vladimir Zapolskiy wrote:
>> So, we have to rely on the documentation here. Bryan, can you please
>> check, if VDDA_MIPI_CSI pad on MSM8916 and/or MSM8953 is related to
>> CSIPHY or CSID power supply? Thank you in advance.
> 
> No there's really no indication in the documents I have how the input 
> gets routed internally, CSID, CSIPHY, both.. not clear.
> 
> I think Barnabás is right, the best source of information we have for 
> this one is the downstream dtsi => CSID.
I have found the regulator also in downstream msm_csid driver i hope it 
helps a bit.
https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/drivers/media/platform/msm/camera_v2/sensor/csid/msm_csid.c#L73

> 
> ---
> bod

