Return-Path: <linux-media+bounces-16632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E8195C663
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 09:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81D2D2855FC
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 07:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0B813B5B6;
	Fri, 23 Aug 2024 07:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="b99AOCOz"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F3A13AD26
	for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 07:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724397415; cv=pass; b=teJjyUhrpCtntljF3hXCIvsRY7YqgtYXOFg7XJ0lXVmeiJHzt6kZ2rJTFc2HkAYf8q3hRhDO3NbQkAuG1ZXDSB/sXVErklYaTFwGlIpJyVrIQYQA2Ng4o2ssspk4PAz7OCil+6O9ttJi3Khcac7zYwHSkL9pAWZPVWJXaI198+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724397415; c=relaxed/simple;
	bh=KdKyU2Zb5sfHzlDO/SWtcE3tVL7xdqOABjoIjJipQNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+GtsY+uCskk/1h8pA9EGybWVwNm5HqMe+VFqQc5dTP7Buc3UnNHpBvqU3NO42byhq5Lurr1dvcwRUIzgaTCVd5yDfqTgHCZrvsGRztueS+b1iWuPfUJ2c8gAtIW8j7GJHpJCbZhGfgSE6/SbcqrlC1Q4+fKiIIDSbyy/bxa7Jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=b99AOCOz; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WqrwW35mDz49PwY
	for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 10:16:43 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1724397403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5HRsiVFFwYh4/+sr10tJ9IRxTMVovmnDtp79yhhH2BA=;
	b=b99AOCOzQDx3lR8FUH4k9BCV4MrXCTJd45nHZaa/GFaOmiO3Smz54p/3UddyevowlmPu8r
	rb3qVtsNQUytSroMfzIFTPC9Hiq9vypvl1V2spTclK1r7HPwaFd6MIBfinkJiVbYJmQgRk
	ybwGlEkXd2p2hOdzFe5/okBJNJ5j4vdx9UVOYaT/bo8VyPXrn7S08fMJKQGgQwFV2b6810
	Y9X2E6q0JSuQDkRHRkT7v+69bJHlhcMsdPgVlNGNaWn3usL517NBYcwqLocLRNPA5KAsyo
	DDfjGBd+vM1eKIx+UViaRleA+ttHCG1/SaAcVbm8z9cQa+W7TAl1wa9OsJX+rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1724397403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5HRsiVFFwYh4/+sr10tJ9IRxTMVovmnDtp79yhhH2BA=;
	b=mMSKwbhGidP2jeBW6AK4WUAwEDj9DEwpJxcoarvpTqNx3BP6ZhYToAObZ03YaW2S2X5QOX
	KI0u2CevR9na2h1/pkRvT9dz4FScx1D8F3La3YqbYfDXEhOTW+YFgkloiOlxkVBbTDQVft
	vu+YNTeUXUY5nF+gO/Pz041hY2ueFg6SRICtodSFaDGWeGOEfeL6x8hIHn3cqUsdH6szJa
	fHlpfUzWSkizDJruFk992/TEIoofkP0NE7CGvI6XV1ATLVQZ7ADKhBqXebE42TzHB5SVea
	M7RcucjbhV0qJg75V/5AB4BZqAiEwsmWBCmz+TW4n2JSt0/XZzv6DtMWsUZmVQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1724397403; a=rsa-sha256;
	cv=none;
	b=e+vruYkQeMMc7KZDttQ9yo5lThmo4oJa8PYK6IFVakt5XEXBAL/Nqw8Ps99kqUerTlfkv8
	I0iOhdkU6FgtW92oMx2Mba8O0l+YsXeTU9ehjhgItzNMCb6tQXpQrt2BBhu/kC6HLba7x/
	yUn49kvYmc6ZnYlQmj4TAjhKksPtqZMwz8SOEAjihSbtLzN0S+DiWnji6Ih2f0NYNx2ftW
	rfA4Au0xk32MxFtvJK5ycaGJIP19R6eH39KffRE1PNGvoRBdPyfyoDIpj9w4BBEz5Pg9EC
	9R2aqZKknbcXKj/lYh5KivotnhzxrQEznqcjw7WN0Jf2kAXH9t3gI2EViI8yTA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4E2EA634C94;
	Fri, 23 Aug 2024 10:16:42 +0300 (EEST)
Date: Fri, 23 Aug 2024 07:16:42 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-mc: Mark v4l2_pipeline_link_notify() as
 deprecated
Message-ID: <Zsg3WojLqfNprMIp@valkosipuli.retiisi.eu>
References: <20240822214125.3161-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822214125.3161-1-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent,

Thanks for the patch.

On Fri, Aug 23, 2024 at 12:41:25AM +0300, Laurent Pinchart wrote:
> Commit b97213a41140 ("media: v4l2-mc: Make v4l2_pipeline_pm_{get,put}
> deprecated") marked the v4l2_pipeline_pm_get() and
> v4l2_pipeline_pm_put() functions as deprecated, but forgot to address
> the related v4l2_pipeline_link_notify() function similarly. Fix it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

How about adding a warning for the use of these functions? Possibly on
debug level if pr_warn_once() is considered too drastic?

> ---
>  include/media/v4l2-mc.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/media/v4l2-mc.h b/include/media/v4l2-mc.h
> index ed0a44b6eada..1837c9fd78cf 100644
> --- a/include/media/v4l2-mc.h
> +++ b/include/media/v4l2-mc.h
> @@ -178,6 +178,9 @@ void v4l2_pipeline_pm_put(struct media_entity *entity);
>   * @flags: New link flags that will be applied
>   * @notification: The link's state change notification type (MEDIA_DEV_NOTIFY_*)
>   *
> + * THIS FUNCTION IS DEPRECATED. DO NOT USE IN NEW DRIVERS. USE RUNTIME PM
> + * ON SUB-DEVICE DRIVERS INSTEAD.
> + *
>   * React to link management on powered pipelines by updating the use count of
>   * all entities in the source and sink sides of the link. Entities are powered
>   * on or off accordingly. The use of this function should be paired
> 
> base-commit: a043ea54bbb975ca9239c69fd17f430488d33522

-- 
Kind regards,

Sakari Ailus

