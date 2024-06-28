Return-Path: <linux-media+bounces-14364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C42E691C6B5
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 21:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4502EB25960
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 19:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADB576410;
	Fri, 28 Jun 2024 19:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="d3ntJzVJ"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E52757FD;
	Fri, 28 Jun 2024 19:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719603305; cv=none; b=qtOABXOGbyIT71e89HI7GeLBHSHH5kT/+nP7oHy30SYOeMO/6PDYAvzSOqBi3ktW0auOOr/El0OFN9jrhl0cmTthQ6pW2JJlujB5x/jgY/3D5KE/+kCwuH3Kd61CBxCysucV0v2/31VY3C4LaMvhYKqwAPyRpMEuUgrpD8xBGIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719603305; c=relaxed/simple;
	bh=9ulH12oh7FjjTpOQeU3qE+dupFcYQqE/c3YvYkKKbt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btMgXqkJ7ArFggu7LL6YbkApuAbnLuWpYFoDXn2ZfZDk+W821BZFj8q8u6nANRNE2PCifJp8iT7mdeMxvCwXDoQZA3qx1kV/r9baI4I8uKKCufpinKsULvJ6elhkXGKgesWXJGAk2sWiw9EY7UkJxq9vSIrBgvQyhnmp41ZJ9jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=d3ntJzVJ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=q3FcIZm77VSDuAoHFtwOeQQ0ovJfkuSbdgulNSGhm1E=; b=d3ntJzVJ7Rd4KgC4LUQXF13MyG
	k0cT/gQ/9PDM9u7udcY7WE6d6ehlkuAIiT291VU2WPsVTit+H8zVLfr+Iqj513Lf7wXPh+lyYcQYV
	MNHkxxtpjiusnUbMpycTFvCH5K2LN+5NYXsbfp7pceok7Mqu+MCuS8ek4vqAJACnouADJn7PbdxrJ
	HuOA7RuTtXvFTXyWUQCMX9yb26UTs/mvw25WGHnZ5QGAI0TwmaDV2TMiUhCZSH3ldr1E6qjkalHGx
	OCCWmNFEWuM3h4ngVVdZRnUKv6RqK9Y1R8jilbRfuRP4dLiUaS2Yrg7KrQ5t+y/eANdZs+SBnkf+7
	CQkpzpgw==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNHN5-0000000ElPm-1YOE;
	Fri, 28 Jun 2024 19:34:59 +0000
Message-ID: <d0d03b08-e21f-4e8a-9a2c-98b9176c9576@infradead.org>
Date: Fri, 28 Jun 2024 12:34:58 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] docs: media: Debugging guide for the media
 subsystem
To: Adrian Larumbe <adrian.larumbe@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
 mauro.chehab@linux.intel.com, kernel@collabora.com
References: <20240529-b4-media_docs_improve-v1-0-9ddb111c4433@collabora.com>
 <20240529-b4-media_docs_improve-v1-2-9ddb111c4433@collabora.com>
 <l5kou3gto442yl4uchmmahbpw53yfmluqyub4oxtlwinxsw3pn@njqimzbp2zmq>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <l5kou3gto442yl4uchmmahbpw53yfmluqyub4oxtlwinxsw3pn@njqimzbp2zmq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/28/24 12:08 PM, Adrian Larumbe wrote:
> On 29.05.2024 18:22, Sebastian Fricke wrote:
>> Create a guides section for all documentation material, that isn't
>> strictly related to a specific piece of code.
>>
>> Provide a guide for developers on how to debug code with a focus on the
>> media subsystem. This document aims to provide a rough overview over the
>> possibilities and a rational to help choosing the right tool for the
>> given circumstances.
> Just like you, I'm not an English native speaker myself, so sometimes I make
> style mistakes that only seem obvious to someone whose native tongue is English.
> 
> What I do in the case of documentation patches is running the whole thing
> through languagetool (https://www.languagetool.org). It's LGPL and I suppose
> some vim versions might have a plugin that lets you interface with it from
> within the buffer you're editing. On my side, when running it on the previous
> paragraph, it showed the following warning:
> 
> [ADVISE_VBG[3] premium: false] The verb ‘help’ is used with an infinitive. -> (to choose, choose)

Ack that one. Also in that same sentence, s/rational/rationale/.

-- 
~Randy

