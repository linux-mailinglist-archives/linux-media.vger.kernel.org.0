Return-Path: <linux-media+bounces-56569-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHjCE86VvWnY+wIAu9opvQ
	(envelope-from <linux-media+bounces-56569-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 19:45:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE242DF915
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 19:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03DAF30FC48C
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33823D75DB;
	Fri, 20 Mar 2026 18:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVtGQvLY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF9C3E8691;
	Fri, 20 Mar 2026 18:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774032137; cv=none; b=KRLQtFj8lLOUo9edmgmNYfz3hWgULNVWkwzbSdy0sKYAxzUN8ZG8A9Dl5b+zhAj49/KLuuHZETfGksBbgNb9ZvVKn78oHdl2IqoX7xqfY6iADzGMjN22ffbX7r9jq++6nqo6zImuxXAQlM1EbtRulm9FWQLxheR33o43eE5JTLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774032137; c=relaxed/simple;
	bh=JIyYwwWx+2mnFHnNjTYR6zabK3iPzw4SnhLp9P92vm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWil6RL0xfgRMZcR46YnuK+LyT0hlSwgNIgG/PiypU7f/piKtE2GcD6qz/lk9T8e1a6tHes6KcnxR3MMNeApN4qMyp/fEHP1g5X+rXfqZoh89OWfzJI6WmLUkpdxbWgNPKqazsmNZe0LHTDlsMq9hbHiT2GecSCsT6At0r6R+TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVtGQvLY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4E1C4CEF7;
	Fri, 20 Mar 2026 18:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774032136;
	bh=JIyYwwWx+2mnFHnNjTYR6zabK3iPzw4SnhLp9P92vm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UVtGQvLY7EjZvMeWb/5M1bwzakUDBizYsiF5eBCSNjVYyH8yTlDM029iqaHfBvmGl
	 OgNQxAg6pi5JmzrJ0cUc4FwEdlZe5V9TS/GEC4EIoa88bkhE3+smsDkUhMBgh/F1dE
	 an+PTHqUcqb+kNWg4tgWHeD0n1vAF0WlRGcnPqVda4McgWeT095cyvWVUxIH6j27gH
	 U2eukVLWsABrKj2o9SgW8+/VHjX5qObPqswG0hwCmTTtYIsWHGBfdfCaoY4Drd/0RT
	 CLqpk4I+qbpbBNJA0nxGI+DuPLjZ/3EUfMBoOtyi49sLNU21h5bISKprnVoo3mI7rA
	 KBti/UAEa67lA==
Date: Fri, 20 Mar 2026 11:42:16 -0700
From: Kees Cook <kees@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] media: em28xx: kzalloc + kcalloc to kzalloc_flex
Message-ID: <202603201138.FAEE6A52B@keescook>
References: <20260320010212.31425-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320010212.31425-1-rosenp@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-56569-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: DEE242DF915
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 06:02:12PM -0700, Rosen Penev wrote:
> There's no need to allocate these separately.
> 
> Add __counted_by for extra runtime analysis. Moved counting variable
> allocation to right after allocation as required by __counted_by.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

This looks reasonable to me.

One thought I've had while reviewing your flex-array patches is that I
want to make sure you're doing your test builds with
KCFLAGS=-Wflexible-array-member-not-at-end
so that you can validate there's no new uses of the target structures
being composed within other structures while making these changes.

That looks clear here, but I think going forward, it would be worth
mentioning it as part of the commit log. Something like:

  This structure is not composed within other structures, confirmed with
  builds using -Wflexible-array-member-not-at-end.

or similar.

Reviewed-by: Kees Cook <kees@kernel.org>

-Kees

> ---
>  drivers/media/usb/em28xx/em28xx-cards.c | 18 ++----------------
>  drivers/media/usb/em28xx/em28xx.h       |  3 ++-
>  2 files changed, 4 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
> index d7075ebabceb..c278e48b3428 100644
> --- a/drivers/media/usb/em28xx/em28xx-cards.c
> +++ b/drivers/media/usb/em28xx/em28xx-cards.c
> @@ -3567,9 +3567,6 @@ void em28xx_free_device(struct kref *ref)
>  	if (!dev->disconnected)
>  		em28xx_release_resources(dev);
>  
> -	if (dev->ts == PRIMARY_TS)
> -		kfree(dev->alt_max_pkt_size_isoc);
> -
>  	kfree(dev);
>  }
>  EXPORT_SYMBOL_GPL(em28xx_free_device);
> @@ -3912,21 +3909,13 @@ static int em28xx_usb_probe(struct usb_interface *intf,
>  	}
>  
>  	/* allocate memory for our device state and initialize it */
> -	dev = kzalloc_obj(*dev);
> +	dev = kzalloc_flex(*dev, alt_max_pkt_size_isoc, intf->num_altsetting);
>  	if (!dev) {
>  		retval = -ENOMEM;
>  		goto err;
>  	}
>  
> -	/* compute alternate max packet sizes */
> -	dev->alt_max_pkt_size_isoc = kcalloc(intf->num_altsetting,
> -					     sizeof(dev->alt_max_pkt_size_isoc[0]),
> -					     GFP_KERNEL);
> -	if (!dev->alt_max_pkt_size_isoc) {
> -		kfree(dev);
> -		retval = -ENOMEM;
> -		goto err;
> -	}
> +	dev->num_alt = intf->num_altsetting;
>  
>  	/* Get endpoints */
>  	for (i = 0; i < intf->num_altsetting; i++) {
> @@ -4028,8 +4017,6 @@ static int em28xx_usb_probe(struct usb_interface *intf,
>  			dev->dvb_ep_bulk ? " bulk" : "",
>  			dev->dvb_ep_isoc ? " isoc" : "");
>  
> -	dev->num_alt = intf->num_altsetting;
> -
>  	if ((unsigned int)card[nr] < em28xx_bcount)
>  		dev->model = card[nr];
>  
> @@ -4163,7 +4150,6 @@ static int em28xx_usb_probe(struct usb_interface *intf,
>  	return 0;
>  
>  err_free:
> -	kfree(dev->alt_max_pkt_size_isoc);
>  	kfree(dev);
>  
>  err:
> diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
> index f3449c240d21..1c2f92927889 100644
> --- a/drivers/media/usb/em28xx/em28xx.h
> +++ b/drivers/media/usb/em28xx/em28xx.h
> @@ -730,7 +730,6 @@ struct em28xx {
>  	int packet_multiplier;	// multiplier for wMaxPacketSize, used for
>  				// URB buffer size definition
>  	int num_alt;		// number of alternative settings
> -	unsigned int *alt_max_pkt_size_isoc; // array of isoc wMaxPacketSize
>  	unsigned int analog_xfer_bulk:1;	// use bulk instead of isoc
>  						// transfers for analog
>  	int dvb_alt_isoc;	// alternate setting for DVB isoc transfers
> @@ -772,6 +771,8 @@ struct em28xx {
>  
>  	struct em28xx	*dev_next;
>  	int ts;
> +
> +	unsigned int alt_max_pkt_size_isoc[] __counted_by(num_alt); // array of isoc wMaxPacketSize
>  };
>  
>  #define kref_to_dev(d) container_of(d, struct em28xx, ref)
> -- 
> 2.53.0
> 
> 

-- 
Kees Cook

