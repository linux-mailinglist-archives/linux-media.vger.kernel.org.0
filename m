Return-Path: <linux-media+bounces-11601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0B68C876D
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 15:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2B631F24936
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 13:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2756854BFD;
	Fri, 17 May 2024 13:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pEVW5JTa"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E7954BD7
	for <linux-media@vger.kernel.org>; Fri, 17 May 2024 13:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715953558; cv=none; b=i5OftH/f1oatluCKfqOB5N8Wh9XXmOrahREK72LnlMI7JWN0Kf6oGJjzR0CctRFpNTDEAIIFMBaLRDGX4QHqyRSUqYMoGwp0RcIgzw23FFc+xv5lp23w8cqiFUnc7HEYfbKRji79ebibnKNlGNWY01lfahkuwWPu+TyPolIEpCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715953558; c=relaxed/simple;
	bh=SBZVpUPsfY0ZSX/rx+Gbf4sTNh7THSwCXyxV+tQnJQQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=tq9SbnPGQf6Q52iXl0iIv631I4wxl0BWQ3Q5vwrVH+bNd8/t1BbgnfxuS9tm2oeCjR6O8zAh5xvS6IsZtOemVWkjBx0/pqMTAc+ZhP5ldQs0pJnnOx8Vw6ZMDeBM17CR3nRD6cCxGXxSEqwsn1zHDocbBQ6TbsQ0UkWCS9mmOTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pEVW5JTa; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715953555;
	bh=SBZVpUPsfY0ZSX/rx+Gbf4sTNh7THSwCXyxV+tQnJQQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=pEVW5JTa+rlM8n2taG2RLdj/o8X+EUFzavlQ71XmVO/5RK5bctJN8eJKy9X+20oVm
	 z0vtuK2tV7/yKPEFQtq8tc9LZN2QpuRd2k5MhqDn8VTGSvbh7/f5K8oAMiXrL1ILh0
	 DG9a72EMZpQ7IHausKpgVcH0pswzCTrOW+nOGF3KLV8Xl9uZ/aSync43QS0Cv9oFEW
	 OdY79vEfOI0vgO3EotWc2wrYesUidLtPDsMgfwmYirAuufDiFSJSzKLQ5XhMqTqucn
	 X8B5Ut4IE+kNMiQxRqUzhzQVA1/iuZz95ATueDLWugLZ0NYkZBYLIfaYeFFzLPsZoF
	 cR+5ou5nZ7qJQ==
Received: from [100.118.151.62] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: padovan)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AA8E537821BF;
	Fri, 17 May 2024 13:45:54 +0000 (UTC)
Message-ID: <dba299b0-df43-00f2-f5ec-2078eb8a63e8@collabora.com>
Date: Fri, 17 May 2024 09:45:53 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: linux-media checkout failing for KernelCI
Content-Language: en-US
From: Gustavo Padovan <gus@collabora.com>
To: linux-media@vger.kernel.org
Cc: "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Denys Fedoryshchenko <denys.f@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <2b1ca3bb-c49a-ce2d-2d86-821dfa6854a4@collabora.com>
In-Reply-To: <2b1ca3bb-c49a-ce2d-2d86-821dfa6854a4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


...linuxtv-ci mailing-list rejected me for not being a member, so moving 
to the media list.

On 5/17/24 09:41, Gustavo Padovan wrote:
>
> Hi Media maintainers,
>
> We are struggling to use the media tree, in the same way we usually 
> virtually all other trees in KernelCI. The following commands gives 
> KernelCI a fatal error.
>
> git clone 
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> cd linux
> git remote add media https://git.linuxtv.org/media_tree.git
> git remote update media
> git fetch --tags https://git.linuxtv.org/media_tree.git
> fatal: Couldn't find remote ref HEAD
>
> We are in the process of enabling a lot of testing for media using 
> fluster/gst and the ChromeOS Tast PlatformDecoder tests. I am not a 
> git behavior expert, so we want to start this thread to discuss 
> possible solutions as the media tree is for some reason deviating from 
> some tacit standard.
>
> Thoughts?
>
> Best,
>
> - Gus
>

-- 
Gustavo Padovan
Kernel Lead

Collabora Ltd.
Platinum Building, St John's Innovation Park
Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718


