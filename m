Return-Path: <linux-media+bounces-57219-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLGbAs1mxmnnJgUAu9opvQ
	(envelope-from <linux-media+bounces-57219-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 12:15:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CE034331A
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 12:15:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 167A030F3F4D
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 11:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425433E9586;
	Fri, 27 Mar 2026 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="BUUWsY6W";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DaiyR1kk"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880B43E9F7A;
	Fri, 27 Mar 2026 11:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774609738; cv=none; b=gf5pE5rt9lk+91xpqn7LwawAkptyMI1VmKKtnPdTUTV+dq3HjZgCzEfUgHWgwp/Ska5XiKN6wHGG2o1pRVIdWKSdxIDWJqMm/E5goeLfY9hAgD4tLt+y8eEwMti4RW+YZ4mU8qCUK9eF+TeyEPN5ZcaWVjnGDnN3KqRFGBaKUZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774609738; c=relaxed/simple;
	bh=kxs3uoeibgJks14I246qovD+NIrodqa4hjuImalmujk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZYgaXWLb1AfvA2g+JKfpoYo8pSuqDFFVbbEHPwMvDOaYxYa4TYCQ1l7PISzLUalzytcRqKd1LIaBtNDBaHgTzjn5W5TeLaWWi/Axy8IZB6svBPc9uE7DTd+2p8v0KojgjSwGVcpFh1YGOrJjRWh5tlIbVAAe7hZKqUmQoksrK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=BUUWsY6W; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DaiyR1kk; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 9A061EC0268;
	Fri, 27 Mar 2026 07:08:48 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 27 Mar 2026 07:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1774609728; x=1774696128; bh=09t+uuWcca
	1Za4Y3fkBqYmks2DVrmw6Kqmer/gUVJnY=; b=BUUWsY6W7ncAcDC7ZNo0WK4bv/
	pJ1foRBcOavhDNU7wB5oe04D5c5lnz0vlb6xFkQL0de9ElJYH8Xw2r9b4aDl+Nr6
	eYk53r/r0Il3zcNImy+/EZ/QNOUyTqus5r42kAlrBsl9CvThCIt38Z/6PUCB+FDI
	6rz+fxIYi6ukfQXBedHS7Fwo/mGjUU52GHbnFO9dZ/qEm/RKSWkTXyyXJfG7qwk/
	mYDSG4++3/xE8rhts/bs0gtxUe3+dmgPmVA/2ng/DZhy/jam9z38/bw+jyAP1j2j
	zzD6jUMOHpJtmn9x72Px+H9xbM8l4NsHmolHM5hfteV7x9OJnMmiYF7osZpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774609728; x=1774696128; bh=09t+uuWcca1Za4Y3fkBqYmks2DVrmw6Kqme
	r/gUVJnY=; b=DaiyR1kkKWiD/C6WH9ASDFiXarvc/+nEAbCmdg6wFcu4LMbkRHP
	5wsNd9Qgqsi8y/TmCS+76O1XzbXwKa+vjVIvCIVUTfZOOODrRJ0iG4C+gwUsLXDx
	8oY+4IaKHKNJNIUaLc7E9r9FPM7boRYORPIfADkxHP4qwY4DZ9yuLz1aj0f8Y8+k
	Qb2aGHRKeZvvDDeMvd3HJOMuElSY50BJQ9zlaz8TH/GBymYxllDWo4ril6zx5XM6
	08kztSmVxcCJ5ePX1a5uNvDSPDCzVQBCPWfsTErXB/uQooSKsSMPNWfPEM/t69Iv
	NffSC9fLvj+PyT9uovm+Mop7o4jbgVcz1wg==
X-ME-Sender: <xms:QGXGaZIPbBJgvPnS899hS83sffmLfkcqL4MTvJqb-V6oys0LmDlVvg>
    <xme:QGXGaRCgfNsKf1hgfqVdt0LcHunsK-dZijGrKQysX9a0nTchUlNc0UqSIJL-4FS4W
    te7IEK-fOMlS1jqq0Sa8FzeccPNAah_b5gRo_SC_d-qXnsb7A>
X-ME-Received: <xmr:QGXGaeuhaaoTDNFX8rScFyIMdROeUP8sfYOuvVZ0ZP5mqd7rWhQMizWKpGl2nJ0MuVTDPvptFbhUbA7G>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffedtuddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvd
    eljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepjhhohhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgthhgvhhgrsgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgv
    lhdrohhrgh
X-ME-Proxy: <xmx:QGXGafR9SEJlpWMKQkGjLRAd8KMsL5CfgAS-s0CEvjmgxBIlFL8mrA>
    <xmx:QGXGaVISSNdy6z3esDPAaHZOGhbVt0YA5pH7LxdsOolxjBJRaCn0fA>
    <xmx:QGXGaSu2a5xHI20GOq19YsA5wRqTG5Cii35kKruIFmHiRddYjvMlEA>
    <xmx:QGXGac_Itd9vfFGVhLdJP5l1NEZg1FsS7X6UUxEv_SlfYFubd3WEFA>
    <xmx:QGXGaQYh4obtWZYaPgHD8Dm9r5mfA0EArKxuyChvYwnBmbPRxEllTGo7>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Mar 2026 07:08:48 -0400 (EDT)
Date: Fri, 27 Mar 2026 12:08:24 +0100
From: Greg KH <greg@kroah.com>
To: Johan Hovold <johan@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] media: cx231xx: fix devres lifetime
Message-ID: <2026032742-sublet-wolverine-e88d@gregkh>
References: <20260327104355.1310012-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327104355.1310012-1-johan@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kroah.com,none];
	R_DKIM_ALLOW(-0.20)[kroah.com:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57219-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kroah.com:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[greg@kroah.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kroah.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 73CE034331A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 11:43:55AM +0100, Johan Hovold wrote:
> USB drivers bind to USB interfaces and any device managed resources
> should have their lifetime tied to the interface rather than parent USB
> device. This avoids issues like memory leaks when drivers are unbound
> without their devices being physically disconnected (e.g. on probe
> deferral or configuration changes).
> 
> Fix the driver state lifetime so that it is released on driver unbind.

Wow, I bet we have a lot of these now, did you find this with a script
or something that you can run over the whole tree?

thanks,

greg k-h

