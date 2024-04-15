Return-Path: <linux-media+bounces-9418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B208A5905
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 19:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F9E4281C94
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 17:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61DD82D93;
	Mon, 15 Apr 2024 17:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="x9ISdxzx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta19.mxroute.com (mail-108-mta19.mxroute.com [136.175.108.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A8382D69
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 17:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713201629; cv=none; b=ViXIDl4nnSo6g17vEtSLsFsraywGVkrh1+vgrOLIrDCi521NqzYLtmK+t2ybQcKMZBS+nw76mf9ILR8IxFANkZjbPWH0sekCr8CZOz8FxCVLcOeSMze5RRHk9n5eYnV66SoJaanOLZ5qluMwz+E2GdDmqllClSYAxN/a6OXd6Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713201629; c=relaxed/simple;
	bh=jReH0gjQfi3jqUjUN7a8QPlR9o04IUhbNwjdpet1ZNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bnIX6UYL6/s37RBVn11L8GgjQ1WEJDMBhLvsvr9cttePEI2PpRbuWnbkY/00h5v3FeJLxtQce21xhTU5BFHdR57L9xsQWDn2qIB4Np4avURRvXduKE0bGOGSVD+uGA4BGshjVY+pZ5SQhyMLAYvTUZrfYey5rzuQCgOo0b+0K7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=x9ISdxzx; arc=none smtp.client-ip=136.175.108.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta19.mxroute.com (ZoneMTA) with ESMTPSA id 18ee2c62c560003bea.011
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 15 Apr 2024 17:20:22 +0000
X-Zone-Loop: 21bc43594dc4de53be61e4f714d224dca4af545de7e7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MrkMLSqeYoxQaLeqLd7FGAd8dfapbsuwWEhhKVbCiyA=; b=x9ISdxzxA+VX+pUaAb/YyVrN/I
	PDRGE29wQIOTE4K0H9J0GqjrLk/wRi31jdEDUQsg+HwMd1lyJellzwJcF8/XwL8bLZPdC5/1i32qO
	NlixLlqM//ltkxCajb0JKF7O7AXA93omkAY7xvFPsKwKLNbAeHMfEP9hrJw9aKNgZcLE7kgkpROnp
	uXyZat782B9Rj6/G2O3iNfov6CVEuoba6rnvdF1lhWVLGM0/8bMX7wjhPsQtOalQTaXWvpF37+Pt2
	qDwwVJR40Dy8V7TTpk+37fMwcFuSBHFaFHyxba61QpeJmSS1vKxe0NofMMnKRbaHt2bPOWGOj4JhU
	5j7sZWBA==;
Message-ID: <6c87d95a-817e-4ead-bff1-89e6639103e0@luigi311.com>
Date: Mon, 15 Apr 2024 11:20:17 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 22/25] dt-bindings: media: imx258: Add binding for
 powerdown-gpio
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com,
 jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 sakari.ailus@linux.intel.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 Ondrej Jirman <megi@xff.cz>
References: <20240403150355.189229-1-git@luigi311.com>
 <20240403150355.189229-23-git@luigi311.com> <Zg2kn5/5T9ukP4nd@duo.ucw.cz>
Content-Language: en-US
From: Luis Garcia <git@luigi311.com>
In-Reply-To: <Zg2kn5/5T9ukP4nd@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: git@luigi311.com

On 4/3/24 12:49, Pavel Machek wrote:
> Hi!
> 
>> From: Luis Garcia <git@luigi311.com>
>>
>> Add powerdown-gpio binding as it is required for some boards
> 
> "." at end of sentence.
> 
>> Signed-off-by: Ondrej Jirman <megi@xff.cz>
>> Signed-off-by: Luis Garcia <git@luigi311.com>
> 
> If the patch is from Ondrej, he should be in From:, I believe.
> 
> Best regards,
> 							Pavel

Forgot to change the from in v4 but should be in v5

