Return-Path: <linux-media+bounces-22351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3169DE7F3
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 14:46:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54D122812C8
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 13:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8AF19FA9D;
	Fri, 29 Nov 2024 13:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Wyf1G8No"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E35A19D091;
	Fri, 29 Nov 2024 13:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732887974; cv=none; b=Lpnl+K3xkmbE6wk9QkO+kyEvslT6KOcaIHlWTOGhuW5YbT0YiZVSiIZ5nMNDc+iu0QGVuT4ocP0vClremWC+/zT6ixdPk0/wLCDhcqWUelWUoZmxNnvPNznLT/F/B99N5EtloILmPouMZ1oQtEtEWp/wjQSorwfriKHArc2/yu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732887974; c=relaxed/simple;
	bh=FScKGdzNv7TAGafpCdy4PP+U/oMlSZU/E9D/UAr5Olw=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=i98Uiq30w0CUCoCXDp83HtKdW3j87vpmb4ZWBYQHhoQx0rLmIUH0DIw3bUXYFMVyPN0W26udgFfpsXB+jAnC6qVSB77t+Gb1pUm0HAM1wYurn4LL7DxZTRxAcmGlxBZRbnf9ZWxsc+ABNu3hl+El4fWxxNLEQUVwrO9Gp62ELg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Wyf1G8No; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (docker-mailserver-web-1.docker-mailserver_default [172.22.0.5])
	by mail.mainlining.org (Postfix) with ESMTPSA id 8DF8FE4804;
	Fri, 29 Nov 2024 13:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1732887970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=la4+JmtPH01EpJaE7FSj7mNHFd9Mmn2zjtDwib3z810=;
	b=Wyf1G8Nob5LpiRoOq3UYfis7xLJgZJya2PrRQb2cOfDzOxGFZw9joDSydSKREKTinjx4BW
	4M9zOsYrFmg00yyxC23QYWrGQimc5pvgapllEcUNBbF2bcsF7gdpxG/2wZ8s0PuSLbeBb/
	Lb1wTthDvfweo6TaihhjKklM5PbC2CRMozsx/GPg4MEMYXsm2/bSEiyr+kCGwvTXgnhDUF
	qcHIGL4cPbCUEbrk2g7xoo8Dzz3BafPaaH7oIHMObDgv+B4e76DkwrM1AiUD0yEYi81LpQ
	JbRKgZErs5ebbpYkjMhWPCoe/fMhD1IYg8iW8JrSeHW9jP1qOMRudkcPMaXLEw==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 29 Nov 2024 14:46:10 +0100
From: barnabas.czeman@mainlining.org
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Yassine Oudjana
 <y.oudjana@protonmail.com>
Subject: Re: [PATCH v2] media: qcom: camss: fix VFE pm domain off
In-Reply-To: <8dfd2ee1-9baf-441f-8eb9-fa11e830334a@linaro.org>
References: <20241128-vfe_pm_domain_off-v2-1-0bcbbe7daaaf@mainlining.org>
 <3a5fd596-b442-4d3f-aae2-f454d0cd8e5c@linaro.org>
 <5cccec71-0cc7-492a-9fb9-903970da05c5@linaro.org>
 <d3a8d38c-9129-4fbd-8bd6-c91131d950ad@linaro.org>
 <a08e95fc03fce6cb0809a06900982c6c@mainlining.org>
 <8dfd2ee1-9baf-441f-8eb9-fa11e830334a@linaro.org>
Message-ID: <ac765a062e94d549f4c34cf4c8b2c199@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-11-29 13:25, Bryan O'Donoghue wrote:
> On 29/11/2024 11:44, barnabas.czeman@mainlining.org wrote:
>>> The change does not describe how to reproduce the problem, which 
>>> commit
>>> base is tested, which platform is testes, there is no enough 
>>> information,
>>> unfortunately.
>> I can reproduce the problem with megapixels-sensorprofile on msm8953 
>> and
>> it can be reproduced with megapixels on msm8996.
>> The base is the last commit on next.
> 
> Can you verify if vfe_domain_on has run and if so whether or not 
> genpd_link is NULL when that function exists.
> 
I have added some debug logs it seems pm_domain_on and pm_domain_off is 
called twice on the same object.
[   63.473360] qcom-camss 1b00020.camss: pm_domain_on 19842ce8 link 
42973800
[   63.481524] qcom-camss 1b00020.camss: pm_domain_on 19840080 link 
4e413800
[   63.481555] qcom-camss 1b00020.camss: pm_domain_on 19842ce8 link 
42973800
[   63.481632] qcom-camss 1b00020.camss: pm_domain_off 19840080 link 
4e413800
[   63.481641] qcom-camss 1b00020.camss: pm_domain_off 19842ce8 link 
42973800
[   63.654004] qcom-camss 1b00020.camss: pm_domain_off 19842ce8 link 0
> That's the question.
> 
> ---
> bod

