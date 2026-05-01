Return-Path: <linux-media+bounces-60119-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ9eFu149GliBgIAu9opvQ
	(envelope-from <linux-media+bounces-60119-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 11:57:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA2B4AB6DE
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 11:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5F88B3006918
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 09:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208FF382F18;
	Fri,  1 May 2026 09:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="pA/SG4ND";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jb6xZRp0"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322F937648D;
	Fri,  1 May 2026 09:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777629410; cv=none; b=uZTDwANQAmdcGoervVzZzZzibX7DQDUwkwX+vM+Irzy6deKvI2tgUtqzlh7+TeqL3He16RZTXz+NfYj2v5fRt9KlbulpqfFbaLx0aEwB4Zdmvk+nI4n1ieKkR6+ybPs93DuMjj+qs/3E1BBZehE9N2Ulzm1sG1UAQnMLWBVFSEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777629410; c=relaxed/simple;
	bh=xkmd82RUYG5KiSvpdFUVX5vVkkk4O6llL0QfHCzNy6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTltcElWr3M92A0vfjyHUnIe9D8SHroFvXkr+40WrkIBeKIL0Ol2Ut67OorrMU/8S+9ov2D9taKVqgQMoYAkyoZKOxL/C3M6FO+XTmFd0h+od6AB3UY6MRkzyBtCTiyy9fQsPJF848f3V8qWmlio3oP5yuEfbrMqg4WjXsCqoWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=pA/SG4ND; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jb6xZRp0; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6179C7A00EC;
	Fri,  1 May 2026 05:56:44 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 01 May 2026 05:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777629404;
	 x=1777715804; bh=uAESboFKnySwKs6D2+s2OjVRVncaD9sdlhpIm8QtCnw=; b=
	pA/SG4ND0P40yLOAt5DqD3XC2tG71u/t4BSXe5mi4X/MQ2IuN+AABZQbDmDzQ083
	z3GONWTo5QREL7Rtw6gBT/hwFU9GUrwm82GL+O8D6fiELvuQ6pJabJtTsyaqP0lk
	trKfWUqWIQZ0nKStMk4L2qF1s+ML/hBsIL/BE+/ggPUIsdrspItQsWvDBK/FLDWv
	bBv6utNKLHWZk0G2cFOIN+Ibyoy7VXgznhlivINgLtXStes5KbMQtMDSP+paknFv
	O+tFTpMCnsApuOc40/tXmXAIlarGHRZOI+dzPHPRvfKg8jKeWORJgM+H+9r0iTsx
	6h1VgrdJ0EIjoeuG5vxc4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777629404; x=
	1777715804; bh=uAESboFKnySwKs6D2+s2OjVRVncaD9sdlhpIm8QtCnw=; b=j
	b6xZRp0eQb/w4rRNNjkgxk4ShGv8yRpTBmITL4SvjoGYhwelx+Zt52GnRVyUMT2w
	BZFDR2OT0QKvSscR9nUVk2cwOjUFS74Y1XFdbitplDtT7CQv7Y3G2wFln3j10+ZG
	9V9eAsBetNumFoim+BRIvpT1VCuYLfN0g9j3wvOR1LAsgvUyUXl5GeABS0bvcCQX
	03jgPdMCFXIfZDCDDqwQ0Ltx6noDkl5d898cIIfz6FuPW4Mo3Ii3TVbUhu+4wI8P
	cS8teFe4LEObX2BWuT0hNi0lSd6KkI4euSpxwHylkN5v/C4n8rcHD5Bd2hhT+X3G
	VAzaEme17jSefsOvFaXqg==
X-ME-Sender: <xms:23j0aRtsCkfi8fkLiHSgAWiPh6xI_UviR_RP5fVKGZSiR7gSivHQWg>
    <xme:23j0aWdHLJBh8sWAb7PCZP9y3He5bwJXsV-pb9r_QdlMrMT4gKzvS1eizFBVmGOVm
    1-tflu46kncfsEqpOvdcfQq5qB6dakH9s06gZ1dxiRAe8cI9NSXqXs>
X-ME-Received: <xmr:23j0aW9BuNIzahK9z6phajRCkziC9s6RP1HfRyEasOfi8M38KPhbRLsPoMJJs3hk6jgWUY4nwZhvYCL0krM6IgjpDdLWYeOqyatL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekleeklecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveetgedtvddvhfdtkeeghfeffeehteeh
    keekgeefjeduieduueelgedtheekkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepmhhhuhhnheduvdesghhmrghilhdrtghomhdprhgtphhtthhopehmtghhvghh
    rggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghsse
    hglhhiuggvrhdrsggvpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdr
    tghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegrvgekjeektddttdesghhmrghilhdrtgho
    mh
X-ME-Proxy: <xmx:23j0aZR2RQpfTJcDp5UN3qIK9AjgSsBAJhhglpKynXZDtOsocU9rdw>
    <xmx:23j0afpJqvf_XUTH35JyLxD-_srQ9sylBuu9s8j6iLE-9nsnNbnzdQ>
    <xmx:23j0aenQ_H1qycnaTjO3Igyb_YZGbPL73QITqH0wgUqkfjAZiKUoYA>
    <xmx:23j0aQd5ou5fofgb5Ut9vVo96NNyxMHvJHqObnle5TjKzomOPXdIlg>
    <xmx:3Hj0aVfzqk_dXFw5q7z60wm6TtxL7hEStSHMfY0OOSewjayG-jWM-ghN>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 May 2026 05:56:43 -0400 (EDT)
Date: Fri, 1 May 2026 11:56:41 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] media: rcar-vin: Clean up notifier on probe failure
Message-ID: <20260501095641.GF6708@ragnatech.se>
References: <20260428125708.93102-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260428125708.93102-1-mhun512@gmail.com>
X-Rspamd-Queue-Id: 4CA2B4AB6DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,vger.kernel.org];
	URIBL_MULTI_FAIL(0.00)[ragnatech.se:server fail,messagingengine.com:server fail,sin.lore.kernel.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-60119-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,ragnatech.se:dkim,ragnatech.se:mid,messagingengine.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Hello Myeonghun and Ijae,

Thanks for your patch.

On 2026-04-28 21:57:04 +0900, Myeonghun Pak wrote:
> rvin_group_notifier_init() initializes the group notifier before
> parsing the graph and adding async connections. If parsing fails
> after that point, the function returns without cleaning up the
> notifier, leaving the async connections and their fwnode references
> behind.
> 
> The Gen2/default probe path also fails to drop the group reference
> when rvin_group_notifier_init() returns an error after
> rvin_group_get() succeeded. Unlike a successful probe, .remove() is
> not called for this path, so the probe error path must unwind it
> directly.
> 
> Route notifier-init failures through a common cleanup path, clear
> the cached async connection pointers after cleanup, and make the
> default probe path mirror the CSI-2/ISP group unwind.
> 
> Fixes: 856b49c71ae5 ("media: rcar-vin: Merge all notifiers")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../media/platform/renesas/rcar-vin/rcar-core.c    | 32 ++++++++++++++++++----
>  1 file changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index c8d564aa1e..8ba8d49c3e 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -318,6 +318,20 @@ static const struct v4l2_async_notifier_operations rvin_group_notify_ops = {
>  	.complete = rvin_group_notify_complete,
>  };
>  
> +static void rvin_group_notifier_cleanup(struct rvin_group *group)
> +{
> +	v4l2_async_nf_cleanup(&group->notifier);
> +
> +	guard(mutex)(&group->lock);
> +
> +	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++)
> +		if (group->vin[i])
> +			group->vin[i]->parallel.asc = NULL;
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(group->remotes); i++)
> +		group->remotes[i].asc = NULL;
> +}
> +
>  static int rvin_group_parse_of(struct rvin_dev *vin, unsigned int port,
>  			       unsigned int id)
>  {
> @@ -440,7 +454,7 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
>  		/* Parse local subdevice. */
>  		ret = rvin_parallel_parse_of(vin->group->vin[i]);
>  		if (ret)
> -			return ret;
> +			goto err_cleanup;
>  
>  		/* Parse shared subdevices. */
>  		for (id = 0; id < max_id; id++) {
> @@ -449,7 +463,7 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
>  
>  			ret = rvin_group_parse_of(vin->group->vin[i], port, id);
>  			if (ret)
> -				return ret;
> +				goto err_cleanup;
>  		}
>  	}
>  
> @@ -460,11 +474,14 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
>  	ret = v4l2_async_nf_register(&vin->group->notifier);
>  	if (ret < 0) {
>  		vin_err(vin, "Notifier registration failed\n");
> -		v4l2_async_nf_cleanup(&vin->group->notifier);
> -		return ret;
> +		goto err_cleanup;
>  	}
>  
>  	return 0;
> +
> +err_cleanup:
> +	rvin_group_notifier_cleanup(vin->group);
> +	return ret;
>  }
>  
>  /* -----------------------------------------------------------------------------
> @@ -1228,8 +1245,11 @@ static int rcar_vin_probe(struct platform_device *pdev)
>  		break;
>  	default:
>  		ret = rvin_group_get(vin, rvin_parallel_setup_links, NULL);
> -		if (!ret)
> +		if (!ret) {
>  			ret = rvin_group_notifier_init(vin, 0, 0);
> +			if (ret)
> +				rvin_group_put(vin);
> +		}
>  
>  		if (vin->info->scaler)
>  			vin->scaler = vin->info->scaler;
> @@ -1264,7 +1284,7 @@ static void rcar_vin_remove(struct platform_device *pdev)
>  
>  	if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
>  		v4l2_async_nf_unregister(&vin->group->notifier);
> -		v4l2_async_nf_cleanup(&vin->group->notifier);
> +		rvin_group_notifier_cleanup(vin->group);
>  	}
>  
>  	rvin_group_put(vin);
> -- 
> 2.49.0

-- 
Kind Regards,
Niklas Söderlund

