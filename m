Return-Path: <linux-media+bounces-21571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6729D2147
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 09:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28DAE1F21CCE
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 08:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16971192D82;
	Tue, 19 Nov 2024 08:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YMxJm5uC"
X-Original-To: linux-media@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2D17F460
	for <linux-media@vger.kernel.org>; Tue, 19 Nov 2024 08:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732003833; cv=none; b=rp2HWeKDd1MHdd73rpiuegqcTTRlmRSgdG89JRp8m/O3pv2AZBO2ZRH6v9hZfs/Mz312MhrosvPELBjvB5jV9jJSXvJ/X2vyH96gLkRumdoAkQLpmqDfTvIffT2/J1NaJ3/OdMIJAL5pEQQ9tW+JU8NPnlS0GdXduTGy2vHfTNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732003833; c=relaxed/simple;
	bh=o7r4lSjS8qNY73dnb2gC8kFc7KoUdnxsA/zG7ICyPyo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N0L4scLOXv+vW9EkeARtgQJ60UO8T4goE0bGk65p29D4wekrd8ikzNsLw0Zu81iVnEd0uL1/EUE4ttoqueFByJ8UA/wqvukfoZ7Uaoj9Hu6Iz/PNa4EBSXgC9AzMEbURO6BGpUBpylAuDKex8f2aO3ATqw4KcClOaSYbfl250VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YMxJm5uC; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AACDDC0008
	for <linux-media@vger.kernel.org>; Tue, 19 Nov 2024 08:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732003828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o7r4lSjS8qNY73dnb2gC8kFc7KoUdnxsA/zG7ICyPyo=;
	b=YMxJm5uCslVlgmfbnm1AYtoFnft9+Ty21Fu6sW4vKx4UsS91R39+qD0rC6vIbMeoIcPk1H
	9zGeQOglRBYMVzwW19hyfWotHyAjja+0jMhl18NdJD8WdPBMuPwRc2GaaQzWG/nCXk6KhJ
	odoEgcB4t3tP8FNfig2PGrtQy9gWhLCvcIOy8cU/6cQh+RBXsNKytWO8vFeJqXXgj6x5MJ
	xrBWwGihcHypShDo2tsRmPqbbA7cnzY0IVgwsdvLetGKo9a9xiskT6HFKCIpp9h6XI4eQD
	ZSSEbOMwNZc4VzpQgVl4qA7CXikfSq2bVK/VgZMq7d1eX4ccPKSkUm3QNmoX0g==
From: Romain Gantois <romain.gantois@bootlin.com>
To: linux-media@vger.kernel.org
Subject: Re: [v2,0/9] misc: Support TI FPC202 dual-port controller
Date: Tue, 19 Nov 2024 09:10:28 +0100
Message-ID: <2757236.mvXUDI8C0e@fw-rgant>
In-Reply-To: <673b2505.050a0220.22b860.216d@mx.google.com>
References:
 <20241118-fpc202-v2-0-744e4f192a2d@bootlin.com>
 <673b2505.050a0220.22b860.216d@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-GND-Sasl: romain.gantois@bootlin.com

Hello,

On lundi 18 novembre 2024 12:29:09 heure normale d=E2=80=99Europe centrale =
Patchwork=20
Integration wrote:
> Dear Romain Gantois:
>=20
> Thanks for your patches! Unfortunately media-ci detected some issues:
>=20
> # Test
> media-patchstyle:./0001-dt-bindings-misc-Describe-TI-FPC202-dual-port-con=
tr
> o.patch Unable to fetch patch from
> https://lore.kernel.org/r/20241118-fpc202-v2-1-744e4f192a2d@bootlin.com,
> continuing anyway WARNING:
> ./0001-dt-bindings-misc-Describe-TI-FPC202-dual-port-contro.patch: Missing
> 'media:' prefix in Subject
>=20

I do not think that the "media" prefix is relevant here, since this patch a=
dds=20
bindings for a misc device.

Best Regards,

=2D-=20
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




