Return-Path: <linux-media+bounces-55347-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oG0lE4QrsWkBrgIAu9opvQ
	(envelope-from <linux-media+bounces-55347-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 09:44:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0361825F970
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 09:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 216E4304813C
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 08:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B5C3BAD91;
	Wed, 11 Mar 2026 08:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DVMohaJf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1AD3B95EB;
	Wed, 11 Mar 2026 08:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218679; cv=none; b=n+MUdeEiEyGXwREyQNZ92RhHif/W6vKf8TK2YP6iwWg4vLTbwdfrk5Y5BdBjkxFAKmDiLdVVp2sodGNYPyN7JizUY/sFXbWWGQN0tvoVWyIFA6HuJfcjPaDC48iAgz76EwB4iA5JnQ9WYHbqHX2Sjw579l94Pqz8fREcD0iSHn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218679; c=relaxed/simple;
	bh=TP2d5VmbgQKHMNAN1qBxmyAqIrxEMKtwQxW3ILNZVCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VzDhWoONRhHd5zYzyKjk+XAHWh0S5o/do2nweM+s3uMPR/ynCdgQzk2t5PYNXPuYKBBHe1xn9QH8YqCJl+F4QGGBjTpm1blLwO7hEQh3M6jocXcYiav+paLnl5hTkM7jl3qj37bBn0B3AmcpVuVhx2ll/IqMxCEzW6yMve4lTxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DVMohaJf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5252A5A5;
	Wed, 11 Mar 2026 09:43:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773218609;
	bh=TP2d5VmbgQKHMNAN1qBxmyAqIrxEMKtwQxW3ILNZVCc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DVMohaJf1cXHCfKpQAPLZqMgqGLEjUtzlrvFBwR2WUvhwsaitJ/7E2ZQ72vfW3zrs
	 6u5CDh7U9hiUMzZAgqHknpHqnoQc9YmmWgIEdDpxql9OZJL+o9ojn9jIWgol3+lD82
	 C0ou9dhM7ben8qAotGk5i8rycahrh0f15ttWzK2I=
Message-ID: <c28d81c5-ba11-4a88-a57c-9d4da74c4006@ideasonboard.com>
Date: Wed, 11 Mar 2026 10:44:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] media: i2c: ds90ub953: use guard() to simplify
 code
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 Guoniu Zhou <guoniu.zhou@nxp.com>
References: <20260228-ds90ub953-v5-0-056cf07cc8f1@nxp.com>
 <20260228-ds90ub953-v5-4-056cf07cc8f1@nxp.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20260228-ds90ub953-v5-4-056cf07cc8f1@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0361825F970
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55347-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:email]
X-Rspamd-Action: no action

Hi,

On 28/02/2026 08:18, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> Use guard() to simplify mutex locking. No functional change.

That's not strictly true, as the unlock will happen later with this
patch. Still, this cleanup makes sense.

> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/i2c/ds90ub953.c | 34 +++++++++++++---------------------
>  1 file changed, 13 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
> index a85c6a9b64070491db161ca1586179dba9c69cb0..3a459687aefce05ac025a517c8d4cc6d76cd7293 100644
> --- a/drivers/media/i2c/ds90ub953.c
> +++ b/drivers/media/i2c/ds90ub953.c
> @@ -113,20 +113,18 @@ static int ub953_read(struct ub953_data *priv, u8 reg, u8 *val, int *err)
>  	if (err && *err)
>  		return *err;
>  
> -	mutex_lock(&priv->reg_lock);
> +	guard(mutex)(&priv->reg_lock);
>  
>  	ret = regmap_read(priv->regmap, reg, &v);
>  	if (ret) {
>  		dev_err(&priv->client->dev, "Cannot read register 0x%02x: %d\n",
>  			reg, ret);
> -		goto out_unlock;
> +		goto err;
>  	}
>  
>  	*val = v;
>  
> -out_unlock:
> -	mutex_unlock(&priv->reg_lock);
> -
> +err:

I think the label should be just "out", as this is not an error path
(even if we jump to the label when handling an error). Similar comment
to the below cases.

>  	if (ret && err)
>  		*err = ret;
>  
> @@ -140,15 +138,13 @@ static int ub953_write(struct ub953_data *priv, u8 reg, u8 val, int *err)
>  	if (err && *err)
>  		return *err;
>  
> -	mutex_lock(&priv->reg_lock);
> +	guard(mutex)(&priv->reg_lock);
>  
>  	ret = regmap_write(priv->regmap, reg, val);
>  	if (ret)
>  		dev_err(&priv->client->dev,
>  			"Cannot write register 0x%02x: %d\n", reg, ret);
>  
> -	mutex_unlock(&priv->reg_lock);
> -
>  	if (ret && err)
>  		*err = ret;
>  
> @@ -185,18 +181,18 @@ static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val,
>  	if (err && *err)
>  		return *err;
>  
> -	mutex_lock(&priv->reg_lock);
> +	guard(mutex)(&priv->reg_lock);
>  
>  	ret = ub953_select_ind_reg_block(priv, block);
>  	if (ret)
> -		goto out_unlock;
> +		goto err;
>  
>  	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
>  	if (ret) {
>  		dev_err(&priv->client->dev,
>  			"Write to IND_ACC_ADDR failed when reading %u:0x%02x: %d\n",
>  			block, reg, ret);
> -		goto out_unlock;
> +		goto err;
>  	}
>  
>  	ret = regmap_read(priv->regmap, UB953_REG_IND_ACC_DATA, &v);
> @@ -204,14 +200,12 @@ static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val,
>  		dev_err(&priv->client->dev,
>  			"Write to IND_ACC_DATA failed when reading %u:0x%02x: %d\n",
>  			block, reg, ret);
> -		goto out_unlock;
> +		goto err;
>  	}
>  
>  	*val = v;
>  
> -out_unlock:
> -	mutex_unlock(&priv->reg_lock);
> -
> +err:
>  	if (ret && err)
>  		*err = ret;
>  
> @@ -227,18 +221,18 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val,
>  	if (err && *err)
>  		return *err;
>  
> -	mutex_lock(&priv->reg_lock);
> +	guard(mutex)(&priv->reg_lock);
>  
>  	ret = ub953_select_ind_reg_block(priv, block);
>  	if (ret)
> -		goto out_unlock;
> +		goto err;
>  
>  	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
>  	if (ret) {
>  		dev_err(&priv->client->dev,
>  			"Write to IND_ACC_ADDR failed when writing %u:0x%02x: %d\n",
>  			block, reg, ret);
> -		goto out_unlock;
> +		goto err;
>  	}
>  
>  	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val);
> @@ -248,9 +242,7 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val,
>  			block, reg, ret);
>  	}
>  
> -out_unlock:
> -	mutex_unlock(&priv->reg_lock);
> -
> +err:
>  	if (ret && err)
>  		*err = ret;
>  
> 


