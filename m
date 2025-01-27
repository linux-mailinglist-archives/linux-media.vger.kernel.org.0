Return-Path: <linux-media+bounces-25316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 756C0A1DB4F
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 18:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFE001886E04
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 17:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E477B1632EF;
	Mon, 27 Jan 2025 17:30:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF10291E
	for <linux-media@vger.kernel.org>; Mon, 27 Jan 2025 17:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737999051; cv=none; b=l1Y7aaBLiwsgfUorsuFIiShD8aMKbtAx4fxm3VH/BNhSE+OZhX0pDed83/wAA2C3aqf0/wNDnTwwgGstCA9boM0yYcUdbtZkCSkCvq5E4SEViEyCwUPG9ivf1uOvEhF6B5K8fsXl45BH7T2rAkhIDV/QhfYhWv2lMgePMyqcizU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737999051; c=relaxed/simple;
	bh=3Iok/ZsoCwYzRc8PILseiPTvkyjJPb6g5bfyjyT5bEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=F7HIJXJluEC3s7cJvxjv+hcvWqnAIjCAmGT7CBBBC3uszRnKqUN+iWr5mCGQ3UCBG1yEmD8Z0rKSN8BoWhPwhYKZvq9SLwhDOwRT6+zSvGnZ5tgpFaGutcWUKpJMxDvpzQitRd/C5ZAqXfYziMHh/RgyEV/KWEMnH9NvlQv97dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from [192.168.4.15] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 8C15F549D2
	for <linux-media@vger.kernel.org>; Mon, 27 Jan 2025 18:30:45 +0100 (CET)
Message-ID: <8812d4e7-6fb2-4650-9d6b-dd45c31d78f4@gpxsee.org>
Date: Mon, 27 Jan 2025 18:30:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [0/2] Added support for new mgb4 GMSL modules
To: linux-media@vger.kernel.org
References: <20250127155957.5254-1-tumic@gpxsee.org>
 <6797b01d.050a0220.b5c43.2dc0@mx.google.com>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <6797b01d.050a0220.b5c43.2dc0@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27. 01. 25 5:11 odp., Patchwork Integration wrote:
> Dear Martin Tůma:
> 
> Thanks for your patches! Unfortunately the Media CI robot has not been
> able to test them.
> 
> Make sure that the whole series 20250127155957.5254-1-tumic@gpxsee.org is
> available at lore. And that it can be cherry-picked on top the "next"
> branch of "https://gitlab.freedesktop.org/linux-media/media-committers.git".
> 
> You can try something like this:
>      git fetch https://gitlab.freedesktop.org/linux-media/media-committers.git next
>      git checkout FETCH_HEAD
>      b4 shazam 20250127155957.5254-1-tumic@gpxsee.org
> 
> Error message:\Grabbing thread from lore.kernel.org/all/20250127155957.5254-1-tumic@gpxsee.org/t.mbox.gz
> That message-id is not known.
> 
> 
> 
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
> 

Hi,
I believe that the CI is wrong ;-). When I do a manual download from:

http://lore.kernel.org/all/20250127155957.5254-1-tumic@gpxsee.org/t.mbox.gz

I get a mbox.gz file that looks OK. Maybe there is a problem with me 
sending the mail from another mail address than the one used in the 
patch? My company mail is unusable for sending the patches, but sending 
the mails this way has worked till now... Any suggestions?

M.

