Return-Path: <linux-media+bounces-39711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 460EAB23E85
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 04:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C95F76E67B0
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 02:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A732C23B63F;
	Wed, 13 Aug 2025 02:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Jbz8QBO/"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C7327FB1B
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 02:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755053437; cv=none; b=nzlACjtlTMnKUJuBfk0/yC5UPWaA6nGetExPIMY1LIgoknUechVILUPBanuvCJjSmRYbNq+Gq8nPAkIsG1VYIMZIQG82BI8BDe8LqLDZ6c2lsDjn0IJXWkEm8Qrv/+cVcFfhn+dSM+OLLzB8VGghyoKl45NBmvec0g3Kr/lTEAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755053437; c=relaxed/simple;
	bh=f4yjm/ZQS/mniflXVz+anJmmRnHT7J7Y5Zp9MRYImBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zo5pzPelGElqwx0mKyLGVGqQs/8CbsU1xsHjZHoOTvwfGyPT53ebhxZiN89HKVvuMPG95z0E2z+4+Gq5uvAq56f80hekml1FlmNY4+k+4w1xJDEEjiyFviU712Mz5GofO9WWoE22Y1Njj9xwwN/z+x7WSx2kMBbt3+WW9iypwjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Jbz8QBO/; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=d/7bUXqWgnY6zZ42U2ixd9HZPd1sFe7Cvf34tP2kzQs=;
	b=Jbz8QBO/vtcemFuAMCOYDIc8rJucAqCx8PhU7Gw0PoHLhgmWZrEjCSi2v71uWP
	oOpemCQpfLEqhmdXnVbOw72Lwpymu2T+DSYsIU1Kvajl1I41YXf/t1p6bsZbOSOe
	9DVxfNoRVzrF6BOjLaHSzizmfEcgqJ1bLxUm16/JJwib4=
Received: from [10.42.20.201] (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgBHbbFx_Zto3_sKAA--.1073S2;
	Wed, 13 Aug 2025 10:50:26 +0800 (CST)
Message-ID: <1125c3ba-9979-4b35-a613-7726ebea17a2@163.com>
Date: Wed, 13 Aug 2025 10:50:25 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Revert "media: xc2028: avoid use-after-free in
 load_firmware_cb()"
To: Dmitry Antipov <dmantipov@yandex.ru>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chi Zhiling <chizhiling@kylinos.cn>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
References: <20250811072326.44569-1-dmantipov@yandex.ru>
Content-Language: en-US
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <20250811072326.44569-1-dmantipov@yandex.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PCgvCgBHbbFx_Zto3_sKAA--.1073S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Xry8AFWUWw1UGr48JF45trb_yoW8JF1xpF
	yrZrWYkrWDtw4rta4qy3yjkFySgws5JFWUC3W7uw1S9Fy3Z3ykKr4UKa4kCrnI9rWDZw45
	ta1FgFnag3ZIy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRTrWwUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/1tbiFAyonWib9LPxJQAAsN

On 2025/8/11 15:23, Dmitry Antipov wrote:
> Revert commit 68594cec291f ("media: xc2028: avoid use-after-free
> in load_firmware_cb()") since it doesn't make sense to check
> dangling 'struct dvb_frontend *' passed to 'load_firmware_cb()'.

Yes, it's doesn't make sense.

Sorry for the wrong patch, I wish didn't send that :(

Thanks,
Chi Zhiling

> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
> v2: adjust to match the series
> ---
>   drivers/media/tuners/xc2028.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/media/tuners/xc2028.c b/drivers/media/tuners/xc2028.c
> index 8e6638e5f688..807585d2dfde 100644
> --- a/drivers/media/tuners/xc2028.c
> +++ b/drivers/media/tuners/xc2028.c
> @@ -1361,16 +1361,9 @@ static void load_firmware_cb(const struct firmware *fw,
>   			     void *context)
>   {
>   	struct dvb_frontend *fe = context;
> -	struct xc2028_data *priv;
> +	struct xc2028_data *priv = fe->tuner_priv;
>   	int rc;
>   
> -	if (!fe) {
> -		pr_warn("xc2028: No frontend in %s\n", __func__);
> -		return;
> -	}
> -
> -	priv = fe->tuner_priv;
> -
>   	tuner_dbg("request_firmware_nowait(): %s\n", fw ? "OK" : "error");
>   	if (!fw) {
>   		tuner_err("Could not load firmware %s.\n", priv->fname);


