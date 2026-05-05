Return-Path: <linux-media+bounces-60405-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBBJA5nk+WnMEwMAu9opvQ
	(envelope-from <linux-media+bounces-60405-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 14:37:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AC74CDA8F
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 14:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0D73C302AFEA
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 12:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51173429811;
	Tue,  5 May 2026 12:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSvmC5k8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B752A1FC7FB;
	Tue,  5 May 2026 12:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984240; cv=none; b=vAv3eIeoXixCC2qj2wTEr+0NOcmEIas49wZX5DvqFBwqQP92jyd409BR1q1znbq5Idu8QBJbzWtzKAKPdc+t2QfnXzqIeEwnL1GsaeB/ppcvVjUUGs7jeUre4eE4zHhcKde1cbWb+dfxGxidve7MhqiSRAS8ZSxrOzJjEDdQJLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984240; c=relaxed/simple;
	bh=mlmz7svxF9IDn/hnRBASBa2pHooKa2riBc5sLpBSw3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nn89nbMAeqq+7wy2WaKz0kLd3yRnFvGfvQ+im73LL1b17yXyW6uoJgcOlZR6FmNwn7BOTz2etNtTLukFp563NSjwHtPm9E3bPWkT2w2YTjVPA/frY/QLzakXEKaUfYRADTUdUbwPrlGt6mBJrzWR1Y9rgvSPPU5/O1GPJTqoqbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSvmC5k8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2C7C2BCB4;
	Tue,  5 May 2026 12:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777984240;
	bh=mlmz7svxF9IDn/hnRBASBa2pHooKa2riBc5sLpBSw3o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FSvmC5k8fRgz0k4CKA+gZLUA1Gr4hDbQopEcSaJsYdaLPBOKbA06F8Ahg4yZ8ur9R
	 Bdkg4ba94KDwnHkjrk/1yOr2rtvaPeSZbAtdcC6tEqD17LSRrbGW/b+NEjmxQnSBRn
	 KfiAiBf3RI119i0eNQKwdRRwL48bimRxdE6B9XNtvaSkKPka4Mdd22ZpySO180Uzlv
	 9RKdbbrFSkmA9N3BDzXrp6YOa7C7sbjP9Vbwwy7DXsGIW/iHaAfr+S2iZo+C/qB+Ba
	 +wXf/qoJk5lGhh4IWRvSqlNpM+4jlcxVmoUQ8bTLepAc4Z3BmDZRaTH3Budo9f49xd
	 KdFoFCQDw3Jpg==
Message-ID: <d99168b1-cc8a-4041-b183-17fcb90b2913@kernel.org>
Date: Tue, 5 May 2026 14:30:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: upd64031a: add error handling for I2C read
To: Wenyuan Li <2063309626@qq.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, gszhai@bjtu.edu.cn, 25125332@bjtu.edu.cn,
 25125283@bjtu.edu.cn, 23120469@bjtu.edu.cn
References: <tencent_F39F0BC7671F8B898AC622B86E21C4C75507@qq.com>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <tencent_F39F0BC7671F8B898AC622B86E21C4C75507@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 13AC74CDA8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60405-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[qq.com,kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qq.com:email]

On 3/31/26 15:20, Wenyuan Li wrote:
> In upd64031a_read(), i2c_master_recv() is called without checking
> its return value. If the I2C read fails, the function proceeds to
> return invalid data from the buffer.
> 
> Add proper error checking:
> - Check if all 2 bytes were read successfully
> - Log the error with %pe format
> - Return 0xff (the same as invalid register) on error

I'm not picking this up: it's not worth the effort, and this read is
used for debugging only. Failures won't hurt anything.

Ditto for your upd64083 patch.

Regards,

	Hans

> 
> Signed-off-by: Wenyuan Li <2063309626@qq.com>
> ---
>  drivers/media/i2c/upd64031a.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/upd64031a.c b/drivers/media/i2c/upd64031a.c
> index a178af46e695..ec9179cf9b69 100644
> --- a/drivers/media/i2c/upd64031a.c
> +++ b/drivers/media/i2c/upd64031a.c
> @@ -73,10 +73,19 @@ static u8 upd64031a_read(struct v4l2_subdev *sd, u8 reg)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	u8 buf[2];
> +	int ret;
>  
>  	if (reg >= sizeof(buf))
>  		return 0xff;
> -	i2c_master_recv(client, buf, 2);
> +
> +	ret = i2c_master_recv(client, buf, 2);
> +	if (ret != sizeof(buf)) {
> +		int err = ret < 0 ? ret : -EIO;
> +
> +		v4l2_err(sd, "I2C read failed: %pe\n", ERR_PTR(err));
> +		return 0xff;
> +	}
> +
>  	return buf[reg];
>  }
>  


