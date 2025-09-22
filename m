Return-Path: <linux-media+bounces-42912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3833B8F721
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 10:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B39F3AE458
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 08:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B046527602A;
	Mon, 22 Sep 2025 08:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="FUKSHOBP"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F90B25D1E6;
	Mon, 22 Sep 2025 08:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758528920; cv=pass; b=kEGtRyr02LrtKsLSrG4WpJGTULwiHVfbN/OAm9Mu43ZEmF30+XENpT/93hkFfgblyBhZ68i7vjwHqJR2ibW28oF0JS10qCaFWk8yYeVAHt+gzyxBPC8ipJojvx2M1V7BqlAfThXFG9zklqy2uYUlKE7v23u8Y/dYQVRR+jYF4S4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758528920; c=relaxed/simple;
	bh=hVyKfbOvMIS+Z2BtByrXURm/o+WKQHysqSr/Qh9nN8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etUN8X/lK0QbmYucqPHmC6WobVjKdHBGRFDw4ZhXmOOCHozDmMTtjt7jJ6FeH6qO/oNqw3wfl+wbObfLKxCSECE8/o4uceLOeJ7jkT32fTqQXjhdoRIsKgYsLNGLlye4EnEe1g3TM5eQB1PsvonfhVlI3Vv6lKYW1sj4v5ceKOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=FUKSHOBP; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4cVbWc67GQz49QG5;
	Mon, 22 Sep 2025 11:15:08 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1758528910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Oa1+u/rSXZ2NnLW3G4hQDJz9GKJpQQQU1oY/bd0Ns/s=;
	b=FUKSHOBPT/5Khqi1Ou7FuOrukCRp9nge98Q2pgHW9GHkd7H1BD/fi9e2Z3abJpfDYE/M4t
	Fhvv+vA1ENmQbFGwHNJDydrb32Ti7xYKeK/xnAYK/pRXrvNzHyGubrDmBi4Dk2ZzrwdDXg
	gHrgSXJ0v9d1LZjO1uYGz8DPtf5NAd6ZvMBOG8YEn1sgN+A7QJL99O/32YLecylH7D5Odu
	NrBFpev9N5/5KE40+LrYIVfU2/Mrs+Vb3VpuoVWcYePU2rYxG4fAD49AcqA8JEa48oE5SI
	QbKf6WP+b9YKPGOp+u0VTjL60zgFu+yTj4zli9CeujNXiHQ6sK+QVEjssPlg1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1758528910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Oa1+u/rSXZ2NnLW3G4hQDJz9GKJpQQQU1oY/bd0Ns/s=;
	b=mpXAp37H56k+cot584MrFfNtijzDUrEASg4YmcAfGcgzD/1iqoahP81X6NUpCr4Ht7byk4
	nSYFgCS9ORHQg0gTvKAqHm+rEQ7m+JDbETFVzMzwECACDHbHkBBKptLGrTeuICgCxKM3QD
	A0ff5Uc4ht1dNin8kwiJ7Gpy9mw1Pqrc7gyz5ui59gOjgMyZLtNd747fAD8xULXC0uxstL
	/Lxnj9lPkfHJyhXpUNBmJb3ZKUp4dl17bGtMli+KyZJyNv6N2zk/ZmAxhZh5Bw7/J7Foey
	x0z8rPh2E8An/Q+WzCzBon8PkzOhJ7NlaSUo6tt2srd5JKHV4fPyLYgq+DSH1w==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1758528910; a=rsa-sha256;
	cv=none;
	b=tvR5iCiPgDiljgxrQvf4zlLi9ZcOB39vfwMCuuio73x3l7AAZy4vuohuz5YoZsrrMNieZF
	yVv26c8j/9us+q41cP7SF40Ph2Ycx0/dFfMUrl0l0pL8PSYbQ7XlVggYdg9qWeUrfJyO0w
	cVSLgsoItIgzIBa4IiXSD1WGHtjSRGdKJV10pVsDFQBSjNAKYX7eYD5bF7TkyXoYQJ939Z
	p2mMrRkZstCA/78qHtNK0ONqYh0uoh5lETxaSRvzME22zwNngNPjSZtyh6TQuHBFu7ak0m
	W7Fk0jZwZOlQ3Wpe2Uw7xS8QNUlAB7NiUOqAUkhP7EsPxOWue+Jylx6yhIr66A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 27E4F634C97;
	Mon, 22 Sep 2025 11:15:08 +0300 (EEST)
Date: Mon, 22 Sep 2025 11:15:07 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [PATCH v5 0/5] multicommiters model documentation
Message-ID: <aNEFi4e5szfbJu4X@valkosipuli.retiisi.eu>
References: <cover.1756807237.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1756807237.git.mchehab+huawei@kernel.org>

Hi Mauro,

On Tue, Sep 02, 2025 at 12:02:17PM +0200, Mauro Carvalho Chehab wrote:
> This is a respin over the latest discussions with regards to the media
> multicommitters model.
> 
> On this version, some texts were improved after Sakari's review.
> 
> Mauro Carvalho Chehab (5):
>   docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign
>   MAINTAINERS: fix a couple issues at media input infrastructure
>   docs: media: update maintainer-entry-profile for multi-committers
>   docs: media: document media multi-committers rules and process
>   docs: media: profile: make it clearer about maintainership duties
> 
>  Documentation/driver-api/media/index.rst      |   1 +
>  .../media/maintainer-entry-profile.rst        | 263 ++++++++++++----
>  .../driver-api/media/media-committer.rst      | 280 ++++++++++++++++++
>  .../process/maintainer-pgp-guide.rst          |   2 +
>  MAINTAINERS                                   |   3 +-
>  5 files changed, 497 insertions(+), 52 deletions(-)
>  create mode 100644 Documentation/driver-api/media/media-committer.rst

Thank you for updating the set, it looks good to me.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus

