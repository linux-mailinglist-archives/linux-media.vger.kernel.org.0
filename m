Return-Path: <linux-media+bounces-51533-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEjJH3g6d2mMdQEAu9opvQ
	(envelope-from <linux-media+bounces-51533-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:57:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0391864AE
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0D443023E10
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 09:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824E732E141;
	Mon, 26 Jan 2026 09:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGEzj6Sh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D9B32D44E
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 09:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421352; cv=none; b=ensNHecM1Nh5TM00mMhxL87e22gxK0CT4tkEBZ+28WQQSnOR0t5H5Pc4D9dvFOzynZQwjD2R6YAzwJ+JqdpkwEKi0bfUlLeZqTJ6OITH3cOJ0tgP2F8Qzl5MpS7G2f7PD0PqNkxn6sdmNQF8SePjxWFSwNoEgzp56mjS+Z6Xh/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421352; c=relaxed/simple;
	bh=jwk9yBux6+536fldnVhhGFBsCSDNKxtCSJzdLGo7hTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=laxqhEsY4h086eFrHX0s/9gKZ8K2zduZzSktFu843W+VVMEjckUCrhwOj9UlAfjzMSWQwDzAWQTvKM+J4w3k0NZizq8h1IlFqLnQQL9h5IQ0wLi5pE6+4fpAw80bdz7A+iZlSGjyGejEMS87szG+aeudbhmMhFL2aj1IXgCSt5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGEzj6Sh; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47edffe5540so49471855e9.0
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 01:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769421350; x=1770026150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ITM22V9fOoshZUR1SBOjl67RUW7bLWAYL6S+oxqzFrE=;
        b=bGEzj6ShO2vlMGpWhlsDs2UcxIAJKZoaC4CN9O1L/foW5Ss3ZkZCsDHQy7yD78i1Fs
         Xb7st0edPF+6tiJau0vPp1k8dKSGjrkHxgf/t6f2D13oq8KwN/9cgQVOX2/MIyNnP+wE
         0WHv8vAmCw/kt1bp+yY06ExeTjs4rQe/9QGZqNXazhw7aXvu5AxIYl2PJPtjMN1RsSVe
         iJzFVaUm75k/ERLrb91lrKEZ7BF2ITrayyZkrlP7PeO6pk6Un20TY4pNZvTyYUXI+DL6
         oU/AO0dNQro4mtZ91s5mPOX7W6OGA4RglTv4FIiEFr0KEPvVyJgTFZhqmhF2oxBk6iNv
         ZgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769421350; x=1770026150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITM22V9fOoshZUR1SBOjl67RUW7bLWAYL6S+oxqzFrE=;
        b=pcKKcfqBo4vh0UNVJYC++r0NyZW3urVfCvivR5ijieNT8ZSTI1IvqpOwYKcELhXl8J
         jx+qwEnaxDrIF+7JoA4VaRDv/Sr6/u28MeJgKOSGVYWdM+XR4UUFSM2oCifJRFh5+hCb
         k91q+kTdSz9+KGd72BZC9OS0ZOv1u8d7thdWxgzqmpyxvKrQTN2OR7obc4o1ucebDp9z
         h/QucmwUaHT3quxoXkNAm2HfVUx4Pf84xYw+Osp4T7W5CrGg1H/tUWY19pj5oLGo/iX1
         YgOoTSjdA8tPsM7bB+8PLq6SMiQl3m+jsH7o+T209KErNTLYZs6frHRxUOj0svUCshJq
         3cCg==
X-Forwarded-Encrypted: i=1; AJvYcCVBVyv9ji5eBgKImMJrkwXCeoYm10A2cTvp5AWr4xUf0sbC6onenu1IQ33S74jUHyNgqSszuMZ5KhdpKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Rl2qVk3/TjMeww4Pzc5imKNEYRFdmojTdKc1iUcAu1XIapD9
	NOk5B83AkgcWMV/k5yyBQzGFogrPkbp3qLoJdf3LrO1QYiFlt06I8W8k
X-Gm-Gg: AZuq6aKEZx7Wldl3l+YdSASijC32QJohYD4IeGphyFtl6YQUNBzWI+JCLaYdz/+hU50
	3w6WfbWlHzLRetknOtW+V3z1aiOMRIWIy0zjTxCyIKTTM5yWh/B/ykSN2vFROHbdmpU1qilSReF
	PFLkNRjgjqP+GVhVqC1xQOIer7cLQZGkI2fD0i5vjrjAe1zpB91igJ13H2bkMW2T7mCVltJ5b9T
	7QimMJhLn/dw2yx1AvrI8Y7T7JophUhW+2mUfH+7kQKZyCcK6iGbl5Xl4nokg8/k1rqa7EGbEA1
	l/nIJX1sjSv6Z0aL8kHFGr+3J+/w3DMbhILiHoX21aeq7aNQKJdQcHXrDf94k+wP3EfymKn1ZG7
	rKpDv1dLdL9DQRmWCesQ/athlUveZssi5PVbq6XXYtNMlnmzpQUHLRogrsSsnBloQIhYFS8HpDO
	bkoQI7du9DfTdghNydGml5sbyVBLjdetKp6fMzUN+PTc5IY7HK
X-Received: by 2002:a05:600c:314f:b0:480:3b4e:41ba with SMTP id 5b1f17b1804b1-4805cf669b2mr55811755e9.18.1769421349631;
        Mon, 26 Jan 2026 01:55:49 -0800 (PST)
Received: from [172.25.98.130] ([5.2.194.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f74942sm27922186f8f.36.2026.01.26.01.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 01:55:49 -0800 (PST)
Message-ID: <47ce1e14-5443-4d3e-a2c9-7d5be47012c9@gmail.com>
Date: Mon, 26 Jan 2026 11:55:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v8 17/21] media: i2c: maxim-serdes: add MAX9296A
 driver
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>, dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-staging@lists.linux.dev, Cosmin Tanislav <demonsingur@gmail.com>
References: <20251208-gmsl2-3_serdes-v8-0-7b8d457e2e04@analog.com>
 <20251208-gmsl2-3_serdes-v8-17-7b8d457e2e04@analog.com>
 <aW-EXiiKFLrXQeJG@kekkonen.localdomain>
From: Ceclan Dumitru <mitrutzceclan@gmail.com>
In-Reply-To: <aW-EXiiKFLrXQeJG@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51533-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,collabora.com,ragnatech.se,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitrutzceclan@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F0391864AE
X-Rspamd-Action: no action



On 1/20/26 3:34 PM, Sakari Ailus wrote:
> Hi Dumitru,
> 
> On Mon, Dec 08, 2025 at 04:13:09PM +0200, Dumitru Ceclan via B4 Relay wrote:
>> +	*ops = max9296a_common_ops;
>> +
>> +	ops->versions = priv->info->ops->versions;
>> +	ops->modes = priv->info->ops->modes;
>> +	ops->needs_single_link_version = priv->info->ops->needs_single_link_version;
>> +	ops->needs_unique_stream_id = priv->info->ops->needs_unique_stream_id;
>> +	ops->fix_tx_ids = priv->info->ops->fix_tx_ids;
>> +	ops->num_phys = priv->info->ops->num_phys;
>> +	ops->num_pipes = priv->info->ops->num_pipes;
>> +	ops->num_links = priv->info->ops->num_links;
>> +	ops->phys_configs = priv->info->ops->phys_configs;
>> +	ops->set_pipe_enable = priv->info->ops->set_pipe_enable;
>> +	ops->set_pipe_stream_id = priv->info->ops->set_pipe_stream_id;
>> +	ops->set_pipe_tunnel_phy = priv->info->ops->set_pipe_tunnel_phy;
>> +	ops->set_pipe_tunnel_enable = priv->info->ops->set_pipe_tunnel_enable;
>> +	ops->use_atr = priv->info->ops->use_atr;
>> +	ops->tpg_mode = priv->info->ops->tpg_mode;
> 
> What's the reason for doing these assignments and a copy of the memory? Why
> not to just keep a pointer to the struct memory instead? I think there's
> another case of the same.
> 
Would this be alright:
#define MAX9296A_COMMON_OPS					\

	.num_remaps_per_pipe = 16,				\

	.tpg_entries = { ... },					\

	.init = max9296a_init,					\

	.set_enable = max9296a_set_enable,			\


static const struct max_des_ops max9296a_ops = {

	MAX9296A_COMMON_OPS,

	.versions = BIT(MAX_SERDES_GMSL_2_3GBPS) |

		    BIT(MAX_SERDES_GMSL_2_6GBPS),
	.modes = BIT(MAX_SERDES_GMSL_PIXEL_MODE),
	/* ... */

	};



static int max9296a_probe(struct i2c_client *client)

{

	/* ... */

	priv->des.ops = priv->info->ops;

	/* ... */

}

