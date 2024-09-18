Return-Path: <linux-media+bounces-18383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA9397B9F8
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 11:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 510111C221D7
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 09:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F4217176FDF;
	Wed, 18 Sep 2024 09:05:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD34716D9C2;
	Wed, 18 Sep 2024 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726650310; cv=none; b=d/nFGwYMlIA+bPo/gpp2Ttddl3P2rp9AXM+Fb9H6D/m7Cc4MHEBoiSmZ+Ezsr06JoIZV/37B0BkZBuv+0uPiTfXsUz2HP/5nsnrZDHzcoQ1EiaNoRnS4uHXdFAEhWCfb4Uv5ib7MyG+9Mblbm84yNvAPS9pjUyyXKeOoIIja6Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726650310; c=relaxed/simple;
	bh=9yqqJnr3ATyHJtvtBYPKsXfQp/BUJHv/4yr4gE4/24A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n7VO5jTHTP47lMQwJndDpeA05GN6xX7phqeuVtnHPLfRW0l04WYhexeTpcFYqrrqXItRmUMWXctv9Q8Di+IlzwvvEc0u9YBgimhrLjk4Sq4gfAQTxXwl3zjdn/J/hZoza1jzK3omnCtgQSFyxEkJtO7mSC/MT7BfUgZlVQ0jTRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.109] (178.176.72.3) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 18 Sep
 2024 12:05:02 +0300
Message-ID: <07673b5f-eb7d-167b-d523-230f725e0d11@omp.ru>
Date: Wed, 18 Sep 2024 12:05:01 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [lvc-patches] [PATCH] V4L/DVB (13661): rj54n1cb0c: possible
 integer overflow fix
Content-Language: en-US
To: Aleksandr Burakov <a.burakov@rosalinux.ru>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
CC: <lvc-project@linuxtesting.org>, <linux-kernel@vger.kernel.org>,
	<lvc-patches@linuxtesting.org>, <linux-media@vger.kernel.org>
References: <20240917140454.7880-1-a.burakov@rosalinux.ru>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20240917140454.7880-1-a.burakov@rosalinux.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 09/18/2024 08:43:55
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 187815 [Sep 18 2024]
X-KSE-AntiSpam-Info: Version: 6.1.1.5
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 34 0.3.34
 8a1fac695d5606478feba790382a59668a4f0039
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.72.3
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/18/2024 08:47:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/18/2024 6:30:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 9/17/24 17:04, Aleksandr Burakov wrote:

> An integer overflow may occur due to arithmetic operation
> (multiplication) between value '314572800' and variable 'resize',
> where the value comes from '12 * RJ54N1_MAX_WIDTH * (1 << 14)' 
> and when 'resize' is equal to 16319.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: a6b5f2008a3d ("V4L/DVB (13661): rj54n1cb0c: Add cropping, auto white balance, restrict sizes, add platform data")
> Signed-off-by: Aleksandr Burakov <a.burakov@rosalinux.ru>
> ---
>  drivers/media/i2c/rj54n1cb0c.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
> index a59db10153cd..a612ec1e7157 100644
> --- a/drivers/media/i2c/rj54n1cb0c.c
> +++ b/drivers/media/i2c/rj54n1cb0c.c
> @@ -776,8 +776,8 @@ static int rj54n1_sensor_scale(struct v4l2_subdev *sd, s32 *in_w, s32 *in_h,
>  	}
>  
>  	/* Antiflicker */
> -	peak = 12 * RJ54N1_MAX_WIDTH * (1 << 14) * resize / rj54n1->tgclk_mhz /
> -		10000;
> +	peak = 12 * RJ54N1_MAX_WIDTH * resize / rj54n1->tgclk_mhz / 10000;
> +	peak = peak * (1 << 14);

	peak *= 1 << 14;

[...]

MBR, Sergey

