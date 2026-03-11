Return-Path: <linux-media+bounces-55429-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOB7GrKcsWnkDAAAu9opvQ
	(envelope-from <linux-media+bounces-55429-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 17:47:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D61E22678AA
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 17:47:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 007FD3031B24
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 16:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1435D3E2761;
	Wed, 11 Mar 2026 16:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="AeyqJQ26"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FADA2D3ECF
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 16:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773247660; cv=pass; b=leqjc/+7lHud/xIgawW7lBuII/ZPjuLXAzW7zR+Ac1u/kKOIypeXuSwCg/WhmrWV/Ww/bGnqv2HCqqUSArE70TYlLtn4xOgBClR4mxRSlDtubmieQBR1ilCiityNb8CMdfXpjKaetvIv5ZokKMAyRPk0wQYOiL96NWe5/WBeEhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773247660; c=relaxed/simple;
	bh=9PrdAlJA8Lju7Pmc8sMNPaYLkPfIlf2YXU3XQ86sTt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLQ7eWvGagymSdxkCVltOrtow+jB7nCmIUc2tj3K+8RZ2Ham97dEKsZJgTKTumVqlOdzV5u4eBHudLIUfUH+4ZkSzVBPVh4Y/i/P3MKkbQxLrqnxdxEijQU9/kHB6Zitjjt0HrGm/8o0IyTSqntafC6FXZdPgyuDr8yX2GLNMR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=AeyqJQ26; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4fWGrN2ck7z49Q5X;
	Wed, 11 Mar 2026 18:47:32 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1773247652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rKO0FrnMKIHE4FRTHRfquGgyNOSKIGbUtopzOmFgb9c=;
	b=AeyqJQ26zXCqPCS1brnpFWjd1MvXej+Wi8f9DX4EgTQKrxlbddAEG/CfM6d4+ylU+TwUaC
	GA9bzv2u/xAyeCvWc+S3s/0qhk0/WvDEIg0BPxu9Li+UOwrW5AFuJenq0JqvJtAyqTZK9T
	hlPCGxFuuT0He7yzDeHBDREIDH3mct2bD2ZRz5fp2M+zUM9MDb24pbutuH6d7fGn8Lq7m2
	DXGGDqMSGgC9QRN3oyRWk0oXyz/r4RK2+82nT5s04QrqgB3U0t8g3CvFrrJj2/dUY6D5ah
	QLgoZ8hHTq9kJj7Frq7+gKQ2vOPtj3oDwwPfyiESOCvLTr7y3BXwbbfFQd3+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1773247652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rKO0FrnMKIHE4FRTHRfquGgyNOSKIGbUtopzOmFgb9c=;
	b=pyUUo4bVSejwTMRyjtgHmbXNwLHfZJEJs8BocDGg9pv9njsbgadl3TDA3XFuIYAd9uD3Kv
	wMC5m4JYEBPHQ/tLyq5BbL7Cq2eP9qmScWPHNg2crUkBwhnP5b+NuuPdFTgMuTIytWgI3f
	vj7odLp49HfCB6dRn3mTRbBsz51OHBakPnUnaYGggPhLQUHKJbnHAt6k4pvKx0m/SLrfji
	kJWVibH4v10mzhRXX8qJQzQsSrvp5KDsW6y1G5ANLxJ+nW1V1ydV0H7X2qU2W2YkSy4886
	2JjgjWL7eGs0XsWT4l2F+R6SRqIO+mACPNkjSj5J4vkMm/49rk9kqMjViKu4sg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1773247652;
	b=G+qwr+EWSCYGbXUFCTSk7A6P6rpbsSw4UWmPGoYrXiV0sVCVm5YrPgcrDUxCE9zZJ8xBXM
	WzhzxWypbK7ORyowIwzTWVwWj4enLAygNyEqAqfqpO1lpN49oI9PygS0UlULL4F1toAxLK
	ectPnDKyn7jh9+XzZ24/8KU7MsCI7Jl8ThBsNPuUCo/w6tcAZzN44M09LrH4dVpTTKqwXv
	gjCJG7yBT6yndUbtA6gRjCoX4IIpO4eJ0ECqxDTnANy6ka3Q2q8RQAII+tC3Go/1pFM5QC
	Yh5t3kEjzqdggD4FHDmAWzOQvPeCuRMn25TnlRxXkeP8VZkHVOeRm3qSLQVTsQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6E457634C50;
	Wed, 11 Mar 2026 18:47:30 +0200 (EET)
Date: Wed, 11 Mar 2026 18:47:30 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [v5,0/3] media: subdev: Add
 v4l2_subdev_get_frame_desc_passthrough and use it
Message-ID: <abGcojKjyFQQA0fM@valkosipuli.retiisi.eu>
References: <20260311-frame-desc-passthrough-v5-0-d59876bbb663@ideasonboard.com>
 <69b18e17.050a0220.2fc5b1.951f@mx.google.com>
 <9ab4b172-9f7b-45dd-9233-d5117faaac73@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ab4b172-9f7b-45dd-9233-d5117faaac73@ideasonboard.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55429-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DMARC_NA(0.00)[iki.fi];
	DKIM_TRACE(0.00)[iki.fi:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iki.fi:dkim,pages.freedesktop.org:url]
X-Rspamd-Queue-Id: D61E22678AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Moi,

On Wed, Mar 11, 2026 at 06:33:47PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 11/03/2026 17:45, Patchwork Integration wrote:
> > Dear Tomi Valkeinen:
> > 
> > Thanks for your patches! Unfortunately the Media CI robot detected some
> > issues:
> > 
> > 
> > 
> > Please fix your series, and upload a new version. If you have a patchwork
> > account, do not forget to mark the current series as Superseded.
> > 
> > For more details, check the full report at:
> > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/94963445/artifacts/report.htm .
> 
> I'm having trouble parsing this. Is it a CI issue?

There are issues in that reporting part. Look at the raw output instead.

-- 
Sakari Ailus

