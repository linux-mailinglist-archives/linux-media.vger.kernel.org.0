Return-Path: <linux-media+bounces-43650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ACFBB41BB
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 15:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29B91169696
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 13:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A3F3126A9;
	Thu,  2 Oct 2025 13:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="WC+GgCRM"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13122FDC57;
	Thu,  2 Oct 2025 13:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759413427; cv=pass; b=iTDLAIab4b7yJB11SBBbFYO5DhHJWT/qcFpC0Vvg5a72trveNvDOaCEhPLq0yevcz6+jC2oliVhuN54KsYWybceL6T8x/CpQh7hbOB9bhsu/6JRtn+oVmaMGfuSc0qKi0Slqz1zyzaUGcrsjFtvRnJHolBAPRNM7SK8T71+bcj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759413427; c=relaxed/simple;
	bh=Ok5pSYkCP+/FhekfWSWWtu2WHxUnBvpGJxRbXYg+Yv0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ifk4XCCtHLUogTsG4pRUT6+c9D1xITF5p5j63+JWdA6PKlyWAxDQuuOJBe4Gcy5XVyks6Xg7ezfqhOpljBsGuL7vRYtyPrVSFc/BKoRoDw3KwqCeNBSXH9mYhytxoOqyQcOdUYvLbIDCWSE18m0nByrQx/LwQqM6CCweA0b+1JY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=WC+GgCRM; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1759413397; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HvKELj6L309KmxqweKIZPDtJYgI2Rmd9dAkfzWFIAydZrAc4ixyXGrG7o9CMbefRCnVtlMaEwnJwRAPNMgdkl6TNRZTdpL07/MHt7gKIVvMPAnUPDWQSIHDKpZIlZNg74DJ0JllNz0yvGx/IPdxrBlpuUlmuNAnGeAnvowhEJUI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759413397; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+RokhR3NYc9QVJTPoxwDFl0IYtcx2jvPruZ0+Di9ZLM=; 
	b=lDy6DLQHdTPs6vd8oOyjHLMUvxiUn333gnJj1oVtKMPTbg06EQDQvOpbqydC36q13aKUNkMhglySy5JtLaQ9xgdEPVWnVTa97/PdIRva+4UahyRzm6C9ky/jr+72vt02xVy388k3hM6aLVrRlnuCSJbKGIyhc4jRaHCCz3vnobY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759413397;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+RokhR3NYc9QVJTPoxwDFl0IYtcx2jvPruZ0+Di9ZLM=;
	b=WC+GgCRMRaOLDhTp55x40MoTelBoXsit3/byUnSdz2z+CqBkOaR5dhJmAvmQo52F
	AerHXtZLzRl0MIIjXDIzOREhaPUc/VqF/BANPjI2umbbXpw3XsG2EmxRghT3me6vh14
	ZCt4wBjgIkM8gNMwqY2y5JXJvyScmZnDldDrQZF4=
Received: by mx.zohomail.com with SMTPS id 1759413396392655.4400354007636;
	Thu, 2 Oct 2025 06:56:36 -0700 (PDT)
Message-ID: <90043066-055d-43a1-97c9-dee118b8a101@collabora.com>
Date: Thu, 2 Oct 2025 16:56:31 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] media: synopsys: hdmirx: Detect broken interrupt
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, jose.abreu@synopsys.com,
 nelson.costa@synopsys.com, shawn.wen@rock-chips.com,
 nicolas.dufresne@collabora.com, kernel@collabora.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20251001175044.502393-1-dmitry.osipenko@collabora.com>
 <do3p4ncc6issxwqam3oeo54xtoi6jvw7maeprdbfkdn3b3aabr@ilwktxqyf4ap>
 <bb66bc81-2b20-48bb-87bd-6c34b35f4cd8@collabora.com>
Content-Language: en-US
In-Reply-To: <bb66bc81-2b20-48bb-87bd-6c34b35f4cd8@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/2/25 16:36, Dmitry Osipenko wrote:
> Hi,
> 
> On 10/2/25 16:18, Sebastian Reichel wrote:
>>> +	*val = status & PHYCREG_CR_PARA_RD_DATA_MASK;
>>> +
>>> +	return 0;
>>> +}
>> Do you expect this to be used in other places in the driver? In that
>> case there should probably be some locking, since the hardware interface
>> obviously cannot handle concurrency. Otherwise maybe add a comment,
>> that the function may not be called if concurrency is possible?
> 
> Don't expect this function to be used in other places and haven't added
> locking on purpose to keep the code cleaner. Will add the comment.
> 
> Thanks for all suggestions.
> 

On a second thought, this would be a case where the guard() thingy would
be useful and help keeping code clean, will use it in v2.

-- 
Best regards,
Dmitry

