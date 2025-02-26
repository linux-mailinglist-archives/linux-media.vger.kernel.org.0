Return-Path: <linux-media+bounces-27023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F14FCA45B99
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 11:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 617951767B8
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 10:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6732F24DFEA;
	Wed, 26 Feb 2025 10:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="jaQ1thcv"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB06623817B;
	Wed, 26 Feb 2025 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740565195; cv=pass; b=a0o4aptXJjw485nGCf1A/kE5BVD8VitTQMLof47zDLAuZbj6At5jRKXSksWuW9P7di6dbYP14fMIDxBicBsh6ChBegQufIBX7+ChyizPGolVI+7l0lqYmpU5UXs6LXEGxJyoJgyQYj8Zh++xEVexIogHDPoGFG9dprg2qpOYZFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740565195; c=relaxed/simple;
	bh=RqJ2pGBs5J5bjQ+nR4R7U/j0x7Z8q6bijtCO+c4utms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZmLveKAdJPTgt9g5P+EarWqQhSxjbKNM+EJ4kT/BOn1KCkSWdMKgccIsFBnKZ2nNjNSRA2nuo72uIXqEKHGy3pHg7Jg+AdOysHpR/cXki0DkLdScCYCNelkLmOuVa2L1nE7E84L6UH7byoYdaKtJMEOZFLA5ivBnae/O7ZPlFfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=jaQ1thcv; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740565148; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=csbsIARRQQlFuUYUPIbTHSc640RozIOK3mo7EacFMuMO6/UzKhbCzJM8kmdpzNajEMIi/rF4txC76qjsTtn+/sGkQQICeckCFWo26sqSPH/p/W5I/hKZl0a0al0PAnE2MLlsjA4TdXGK9qzGyYA5rziK9iDSumb3RIhUFU8F0dQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740565148; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=O4slzQmUIpYAOvHEBNpBFvEqcylNtvHr3ZVDWO7ZW+w=; 
	b=iiwkFdlSGXygvqkRC8BZ8srkXRtAeKhz2Dt0DiBSIqyYW4XPdQeiOW7MGHK6l1kRL+9kft57a4ptcE1NoLYFQgfmNiVD3f90AylTJ0NasTdhWqBJLEFDidsFLivejrk6ZaDBqYnJViATqJBQg0ucTh6hEyJJTphK8Imagg28svQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740565148;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=O4slzQmUIpYAOvHEBNpBFvEqcylNtvHr3ZVDWO7ZW+w=;
	b=jaQ1thcvejnHG6x8C2RJ311+Z99vPFzUvuULgTqDj65i5yQSLlAnO2j+ClTGPRfB
	gLJVYrfbmI/hewj0EPqOfEbOHpJBCe7YKYBmCMN3hdOZu0F7lE446RdcouBnw+RpBfX
	vA38zi/puXb0/Ne3yKQL2sna8++iqyLnX5XpJ8mQ=
Received: by mx.zohomail.com with SMTPS id 1740565147313168.03192494145082;
	Wed, 26 Feb 2025 02:19:07 -0800 (PST)
Message-ID: <38faac84-965f-443f-b3b5-844fc965dbad@collabora.com>
Date: Wed, 26 Feb 2025 13:19:01 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/6] media: platform: synopsys: Add support for HDMI
 input driver
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, jose.abreu@synopsys.com,
 nelson.costa@synopsys.com, shawn.wen@rock-chips.com,
 nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20250226094946.665963-1-dmitry.osipenko@collabora.com>
 <20250226094946.665963-4-dmitry.osipenko@collabora.com>
 <6b261f80-6713-430d-93ee-9dac77f47580@xs4all.nl>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <6b261f80-6713-430d-93ee-9dac77f47580@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2/26/25 13:16, Hans Verkuil wrote:
>> +/* vb2 queue */
>> +static const struct vb2_ops hdmirx_vb2_ops = {
>> +	.queue_setup = hdmirx_queue_setup,
>> +	.buf_queue = hdmirx_buf_queue,
>> +	.wait_prepare = vb2_ops_wait_prepare,
>> +	.wait_finish = vb2_ops_wait_finish,
> These two ops are no longer needed. New drivers must not use them. I'm
> working on removing these ops, but it's not quite there yet.
> 
> I will remove these two lines manually for this v11, but if a v12 is needed,
> then make sure you drop these two lines.

Ack. Thanks for the review!

-- 
Best regards,
Dmitry

