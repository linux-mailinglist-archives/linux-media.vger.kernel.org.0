Return-Path: <linux-media+bounces-18412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCB297D1D3
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 09:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA7841C21F26
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 07:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6E04F881;
	Fri, 20 Sep 2024 07:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="jDongZ/H"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDB8487AE
	for <linux-media@vger.kernel.org>; Fri, 20 Sep 2024 07:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726817956; cv=pass; b=exCTh172cHVeCIgqZjkXreD8+/favvpYOUIqF13CIN42I8+tBBU2Z/zG3JLSus9Pw4Y546RA2lxNcO1o78iAHBUci1JNZaXvjFAQc6Vd5ELvjWdXy3hE1qvb5EpYKi9fD09Hd5kMbqiyyeNdJ2kU730ziE60VOR0aRVRsHIpaC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726817956; c=relaxed/simple;
	bh=o+SDuuLdvBoXlCZbZF9M7/1WpwTNrBC7mARLc+ALwEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifRdcHNEZr0P6+na/x1zuX25PaA+czbvdFsTu4XkgcPI7xHF1gD6tlMuPNlXdmLsgtbD/S+ocpLFNnRWYyTRAZ8JeOmF39rBlU/qSvuNx07aDp/72WpeesSp8XtAdhtdHwuh4d0iqG/wwSACVdNviC3fb8qf+a9ojtXeTuU6L8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=jDongZ/H; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4X945X19tVz49Q3Y;
	Fri, 20 Sep 2024 10:39:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1726817952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B8s3VEroXTNJx1Lt3++lxwcptXOFx4BBHFxAt81gFLo=;
	b=jDongZ/Hn/gAylxM5RvoU+3WPKT5i+yGB4TTAg/dH55nRNMLWETarLUD7XuqmC7zHnXV62
	2mFv2TodaQMLZAilbcKv//Z/UNqnUHNQ79waUIbfP+dzePZVXocsw+O5GJgJG26W30hulq
	z9YTbgsomXlCBUsqcYd/shkth+YhlkeMsKWmFiRjvyJ1qXGMLnvWnLaMB6l/xjYMnkbglU
	dj+39zP3J/zy6sYwDczCU4qShr13zUqqdNdTObASIlBDTs/aUUG8CWtwsraQU4F4rT7ed4
	/jm6Sw4MoZL8nHCo2a0NPfLZ9wqT3qqQkj33OA8zYNY6V2gjzlJWz0axyztvdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1726817952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B8s3VEroXTNJx1Lt3++lxwcptXOFx4BBHFxAt81gFLo=;
	b=peUHjTZv8EJLa1CSEUUed315R5zuwDMmWKicVUBc9a9sTx6Uik3Wg8oH9oerS3/p0VLiFI
	0fHS46uW9dOSU96EO+SGbumRJ4dla5EvqvlVCcATo1uBGkeF5EpzhHGTtMqm9IgxVl7uN8
	p7VU93n2EJ+EvLXBNU7sIuvE8QLdA3yQaYKz47zkGZJbJYmc8BnisV8/ipjtE4jzVqHqQX
	bzJtGCXEzQa8CRHI+DT7dUODsGt9Du6/5zRkzR2ztNUgdgtTl8k328hZ2jyFLF2l44ZxwG
	AiKwtooPMhYBdKzs/TV4MHphQjAWLfMZgjHmuImVoXPAx4r8FoNNSTY1VVRZ8A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1726817952; a=rsa-sha256;
	cv=none;
	b=lAUrfHDp5zkoII8fQKueWnx+LnC3E2ofrdy947J2MaR1LCFKQMgFkX3YuVqQd91DJGqoqa
	UxWdXtA0GN+nacaeGCRAddlG3IbejkiTuYLKSuGgIysKgQfmUteIP/kE3K2zMB0mfTURhA
	p8G41Eht4ZT4JvLKiOoLFi6MMdYsCPHtsxQkYqOP6FVeTOZSkwlNAnheg9oq9M2rNHb/Oh
	wUbzBvjMfwWqMptPYYHPjNQn/yhyA+IfOBK/pzUM8Tf4lQt7VGNJ5OjTRPuduLGN2BUhYx
	Ti9WUIixW2tRXTfW6PhJW1ROuOUic6+EQHsbbqFJHWNgmzOvctyppkBZpdA9ug==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 8DD56634C96;
	Fri, 20 Sep 2024 10:39:11 +0300 (EEST)
Date: Fri, 20 Sep 2024 07:39:11 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	Alain Volmat <alain.volmat@foss.st.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH v2 1/3] media: Documentation: Deprecate s_stream video
 op, update docs
Message-ID: <Zu0mn_Jn2kNl9qWv@valkosipuli.retiisi.eu>
References: <20240917150254.17639-1-sakari.ailus@linux.intel.com>
 <20240917150254.17639-2-sakari.ailus@linux.intel.com>
 <c550fd63-cf6d-4723-bf30-c4131cfedd63@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c550fd63-cf6d-4723-bf30-c4131cfedd63@foss.st.com>

Hi Benjamin,

On Thu, Sep 19, 2024 at 03:03:27PM +0200, Benjamin Mugnier wrote:
> Hi Sakari,
> 
> On 9/17/24 17:02, Sakari Ailus wrote:
> > The scope of the s_stream video operation is now fully supported by
> > {enable,disable}_straems. Explicitly document the s_stream() op as
> 
> s/straems/streams/

Fixed in v3.

> 
> > deprecated and update the related documentation.>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> This is a good opportunity for me to thank you for keeping the
> documentation up to date.

Thanks! :-)

-- 
Kind regards,

Sakari Ailus

