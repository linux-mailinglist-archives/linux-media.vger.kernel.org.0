Return-Path: <linux-media+bounces-22539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B58279E1CBD
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 13:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ABB42821E9
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 12:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962CB1EE007;
	Tue,  3 Dec 2024 12:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="LvClLpfW"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F101EB9F5;
	Tue,  3 Dec 2024 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733230163; cv=pass; b=nSLoPgPyPCcuLvXY/3v+LtEP3hEuwSiX432xg/hkZ+2Q3g/C8VEnr2y4o19qcEsALpAzmNydRVXOjgb8bjpBqd3jovFCSSMxNEpyS8ADUAKBpwE/TuWXmB8wN0sHxdGOBqVm6Zuop1ybA9VIRBexOqIpX7QSdjYdUVRsdW4Lmf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733230163; c=relaxed/simple;
	bh=llCJg+6iwamFsMSC5QoUCtBBqrC/JC/0L2wyOK51458=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5LKh3kScbvuZSEnH0j2lT3OmokVCR7oBMHRqwMZdH8NK6xNy3Jk52qT7x9scKCn1cUJNMlXK2zj5N22/TiiTzH7WGdevwWCJSAKEbEE7x1VO2i+yf5pZX0SH7KWiDYf5EDKN+yUBFuQjsOlvudjcakvJm7vvFqRJE0Vx9n+MNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=LvClLpfW; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Y2gT33Rv5z49Q5b;
	Tue,  3 Dec 2024 14:49:11 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1733230152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OfMk9vNntr7QdB8/M6TU8TGsJ0uA0HM/++BT/P8ndo8=;
	b=LvClLpfW7SFqnsChxCuZSCeY9zLrueSxradhai84PJGmxeGz41qfrQI5EZFyD4ETYtY9vu
	YlNAI53ryBoxQcUx4ZP9fYu2XMWUt+HOFbUcFxCD26LmaOffe6aPmwY79ZUzJXvIJgJ9ti
	80YN69re+91N3KuEOaqVeVwCgtOORsFtV8k9cf531xM72aBVHgqudqF5i/RQNTLJUZ+MTi
	4zG8mHSN8Xeey27Usww2HiCCxHkHBZ48CoYsEwgUCRquTDi9n664Du2Yf4VEGlz+P1QB73
	lWUEl8tKZMGaPUv0UWFYlaGTgomwuq1tk6Dwa+6uEvHmX/kOr8FIgPNlaYrlQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1733230152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OfMk9vNntr7QdB8/M6TU8TGsJ0uA0HM/++BT/P8ndo8=;
	b=EXpul9TukK+eBIkriKuKgBUt1ZqXBn9InPjPx3RbsbDZfkZqK7c5zKbCfoQ203if/D4u+e
	GblwDKPSEMXZfZGkQhKfSuKZOeXY4A3iimVnyGuB1IclFwQQXc8R3wbo10Xxrgg01TNsin
	iz3TTUcjNeErhzV6oSSlmVOGVrfld5kDZMc7WoPnZ8xmBYDEGAatoFlLzN8nvOuFTwDJfJ
	UaMsxKWXKFZ1MwtJ26xXcU/j8TKW3ktypb2BmL0V1F6mEFWngMcPKQOdxVN/x6DNAypn3t
	LZkPrfe04fKsYXiM9VfI3jX9/NjM6KwpRi6bb8DPiCBcPKa1Q9ubNDsgDnLDRA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1733230152; a=rsa-sha256;
	cv=none;
	b=p6Fi5TloU/vLha7BarifTbJ1UTMRMnZhNxAcjrHfZoEatXPt0xw29w+ByXlX3zw4iMvSDw
	G5hBgfwXFTM85Vtb5TTYNswAf6Qn/Pc5cmHQLb1Hxj6C5n9PiaPavu6Gb0Zw2O/GXq0F0j
	YT/jqODQCkB4dxey2kv6S6RGqh1Al92s1OzhMPiLEFc70bqZ5Od3YVDDtIen97y7KcRvym
	yiHPxJYIZQJWWKg7B9NmLgYeuGQKtjfCyG/yxHusFnx7v2GhjJGJ/knlgPcgKdsL78FX5k
	BPwxDaqvs9WxIzobnKmXcMdxynLkPEkFB3nHoe8CldyEG6MPDmPuGEHaGtiuBQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 57C9B634C94;
	Tue,  3 Dec 2024 14:49:10 +0200 (EET)
Date: Tue, 3 Dec 2024 12:49:10 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] docs: media: profile: make it clearer about
 maintainership duties
Message-ID: <Z07-RklaMXOy3C2g@valkosipuli.retiisi.eu>
References: <cover.1733131405.git.mchehab+huawei@kernel.org>
 <f47082a84e0c799dd047525d4bc351eb3a759e83.1733131405.git.mchehab+huawei@kernel.org>
 <Z03I1R0aRylSz742@valkosipuli.retiisi.eu>
 <20241203102846.6fb3ab52@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203102846.6fb3ab52@foz.lan>

Hi Mauro,

On Tue, Dec 03, 2024 at 10:28:46AM +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 2 Dec 2024 14:48:53 +0000
> Sakari Ailus <sakari.ailus@iki.fi> escreveu:
> 
> > Hi Mauro,
> > 
> > On Mon, Dec 02, 2024 at 10:26:21AM +0100, Mauro Carvalho Chehab wrote:
> > > During the review of the media committes profile, it was noticed  
> > 
> > s/committe\K/r/
> 
> Addressed this and the other editorial changes.
> 
> > Can we expect people listed as maintainers to either send PRs or be media
> > committers? I think this might be eventually the result but I think we're
> > quite far from this currently and I expect things to remain that way in the
> > near future.
> 
> Yes, having driver maintainers being committers and sending PRs is what we
> expect to happen first.
> 
> For mid/long-term, once driver maintainers get in board, we may also have
> other committers for the drivers whose maintainer is also a committer.
> 
> Now, having committers for drivers whose maintainer is not a committer
> doesn't sound a good idea, except if such committer is doing just
> janitorial work and gets A-B/R-B from the driver maintainer on all
> patches he merges.

I meant primarily people listed in MAINTAINERS but who are at least not
yet Media committers.

-- 
Kind regards,

Sakari Ailus

