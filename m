Return-Path: <linux-media+bounces-1391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DC37FEB4D
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 10:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74F9E1C209A3
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 09:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE11F347B0;
	Thu, 30 Nov 2023 09:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="slPw/G+D"
X-Original-To: linux-media@vger.kernel.org
X-Greylist: delayed 1220 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 30 Nov 2023 01:03:41 PST
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA6DCF;
	Thu, 30 Nov 2023 01:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VUOHRCWSSDj9SUGnDOEGQBP38JOlQPsdYrhMvEeHZGI=; b=slPw/G+DUnfvlNG7emUtFMnJKd
	huL/uuSj0UPvcQExlq++KradoKLHcdlquM/zl239Ve4fEZGRjy83MH11n0b8wgpfiXBkfk59on9CK
	WAwRdYPV6TsZCx5RdEWsxpLIhRLN8XN6KnE0yTwlGLGtT71siPATP4K7in/cB6eANQ7QO5DksvdzY
	hwk4vlhYCCiDUnDrycagBoOjJtMO94agPmPR5SFZ2olqzrP3CyZL3FBeE48G4teECXrQoIH5ZXqHe
	JJ7DTouNSjZUbkZ8BqDFC3y6+tDQR5zpv0S0Iv10Avkab31N1HEk+iVOhFK1h+QtzZBWm+nhHMgho
	kzuRav4A==;
Received: from 87-100-223-88.bb.dnainternet.fi ([87.100.223.88] helo=[192.168.1.241])
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <crope@iki.fi>)
	id 1r8cdh-00F9fP-0v;
	Thu, 30 Nov 2023 10:43:17 +0200
Message-ID: <9da4252b-269b-c25b-c485-afdcd8207268@iki.fi>
Date: Thu, 30 Nov 2023 10:43:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] MAINTAINERS: Drop Antti Palosaari
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Media Subsystem <linux-media@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20231130083848.5396-1-bagasdotme@gmail.com>
Content-Language: en-US
From: Antti Palosaari <crope@iki.fi>
In-Reply-To: <20231130083848.5396-1-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 87.100.223.88
X-SA-Exim-Mail-From: crope@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false

Hello,

On 11/30/23 10:38, Bagas Sanjaya wrote:
> He is currently inactive (last message from him is two years ago [1]).
> His media tree [2] is also dormant (latest activity is 6 years ago),
> yet his site is still online [3].
> 
> Drop him from MAINTAINERS and add CREDITS entry for him. We thank him
> for maintaining various DVB drivers.
> 
> [1]: https://lore.kernel.org/all/660772b3-0597-02db-ed94-c6a9be04e8e8@iki.fi/
> [2]: https://git.linuxtv.org/anttip/media_tree.git/
> [3]: https://palosaari.fi/linux/
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
> Essentially no change from RFC [1]. However, since there is no response on
> RFC (including from Antti), let's drop him so that Cc: lists can be
> a bit shorter.

Acked-by: Antti Palosaari <crope@iki.fi>

regards
Antti

