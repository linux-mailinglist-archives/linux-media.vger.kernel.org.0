Return-Path: <linux-media+bounces-22694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD689E51CB
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 11:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14DDE167D24
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 10:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C312E1DE3A3;
	Thu,  5 Dec 2024 09:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="DYKpTZ2g"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274521DDC3C;
	Thu,  5 Dec 2024 09:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733392393; cv=none; b=mZiXSb5yNtgpbsxqIDcwbKxLJib8xtlifOk+K+aKrVex4PDjA8x8exBI/Z9d8ne7tMGbkbxxBL7hEMYwCC3ArncbRVqHkXO6lubQdV4Vze7CF7hlEQBvTkU7mL5EFRNT/jIZS2m54RbStJcKIfanCarPWZzYAAyJ+JZPxtxobds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733392393; c=relaxed/simple;
	bh=RJpQcMfWlG8arROVk20LblTVChkvj+MbnrwXN60cilY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UuKxGxXOx+kYHNosqOfnih+dM1yuXsQyJbLLpzVQnXquDciTR+Rr4fNdPGf9FhUOMAHBr9Z/VXIZ6vmAuhuZvskIdqCaRuBcXOp36HMc++s+HPaSRSLDVHefcIrlLRB7Fi1plLfcX945cdP93sMS6h6831vkMOQLIp3Cj6kcY3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=DYKpTZ2g; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5WUrF8YRFW5mT7zPjxtFPPCkjDeiW/D826tPc9KJ3bI=; b=DYKpTZ2gl/ZGzJm8tQJrKBFA0b
	I/uIBIN+y5zcGlDjCCeyulaZqmdAjKA5q7ndvyTqUOJGpa93VmdRGdH+r15Nzu+27qEAZzEHJMWcz
	70rgvN43haRuumvvQYDIYB5KbDWqNeLshHQH8sTYdqi3fu2As8Via2Dr4o+XTl71TfNE=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:52757 helo=[192.168.0.218])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1tJ8Xa-00BvzZ-Ct; Thu, 05 Dec 2024 10:52:58 +0100
Message-ID: <90ec4241-c8d2-452a-a7c3-e983e5df1872@emfend.at>
Date: Thu, 5 Dec 2024 10:52:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: sony,imx415: add required clock-names
 property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Riesch <michael.riesch@wolfvision.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241130141716.1007115-1-matthias.fend@emfend.at>
 <bh3obpt6bcklejdvrk4r6ienraz5zmhrdyotijhvlwexussqgj@hicmx34vi27w>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <bh3obpt6bcklejdvrk4r6ienraz5zmhrdyotijhvlwexussqgj@hicmx34vi27w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Hi Krzysztof,

Am 02.12.2024 um 08:56 schrieb Krzysztof Kozlowski:
> On Sat, Nov 30, 2024 at 03:17:15PM +0100, Matthias Fend wrote:
>> The imx415 driver expects a clock with the name "inck".
>> Document this in the bindings.
> 
> No, fix the driver instead of bypassing review. It was decided to drop
> it during review, so you cannot reintroduce it 2 years later claiming
> that's now ABI. Of course original submission was buggy and never
> tested, but that does not allow review bypass.

Sorry. I discovered this by accident when I was using a copy of the DT 
snippet and realized it doesn't work that way.
I wasn't aware that this was intentionally removed (at least partially) 
during the review discussion...

Best regards
  ~Matthias

> 
> Best regards,
> Krzysztof
> 


