Return-Path: <linux-media+bounces-8674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B8B898E3C
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 20:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D8451F2468C
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 18:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF9913174D;
	Thu,  4 Apr 2024 18:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Gi7y/17C"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C754682C63
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 18:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712256520; cv=none; b=SycPeVE8PlH5h3uahNNT9bKFWU2P0V8fcYOUKEnNkXuVva7eJ+ZjH98hC8IOBQqtwXRH3GByq1JIJcNAcvJDYQXKtecWlp0N03OmEAwh41ROeyQRC/HBKUqzJyohIuyNpVb7o3SM0MIl9mf7jllzKFOvWgsC3/Go2UJTh/BShak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712256520; c=relaxed/simple;
	bh=/VK6QPKwsjvUgxI0Gjxkn3qTHEcggm3f3tmHappEY9c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lyAiKSVRCe2JzjK8W+2cGTX+/t6UJsO9T2gK3wRE+DtT2B5uuB+sNqU1K407mCeb2IkSU88CTh4PVmQuIVro/oNvyrF8+pmfkUDmGPkOUJU+P942W9NNqV51uP3s6SWiUdM5TfJCJ1p7BFXhuFO0fnC+Y9HFjQ23LLG3R47OeaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Gi7y/17C; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712256516;
	bh=/VK6QPKwsjvUgxI0Gjxkn3qTHEcggm3f3tmHappEY9c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Gi7y/17CxRVibwcHsXNuWglPS/md5udpo93NuZ30sT2RvZYHGkNlCh+nR0upnIjl9
	 dPuxUQ4w5G/1zTtNY87c95y6vmpS1THMoNc3bAwBEGxG6ItE7P1bOQmSri2iF7zwEv
	 NebGSVW6kae6wgV194mTEE3UkoOFyT6xgCPA5FDqOHYe5iQaAYUbCQ3VkhJP8kx+2V
	 3QBzV2ZYGZWVVtqr7yioPeo3rmrTJRIHjNYiyZZn6gS0r6XhlY0E6w0oy2Ms61Q13A
	 3iggx/8vV1SZUO8RwKV5Cjxd474ap5qQ7oEhcqZizdm9I44BuA2X2iVyFxFu5el+9m
	 W7a1I4KDGKFKw==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D7CBE37813DF;
	Thu,  4 Apr 2024 18:48:34 +0000 (UTC)
Message-ID: <cd75e02feccbe494500faa16cb59ca6d883e05d4.camel@collabora.com>
Subject: Re: [ANN] Media Summit 2024: where to hold it?
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List
	 <linux-media@vger.kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>, 
 Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>, Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat
 <alain.volmat@foss.st.com>,  "stanimir.k.varbanov@gmail.com"
 <stanimir.k.varbanov@gmail.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Dave Stevenson
 <dave.stevenson@raspberrypi.org>
Date: Thu, 04 Apr 2024 14:48:31 -0400
In-Reply-To: <607815ae-57b5-4c67-9a52-0de795aefc52@xs4all.nl>
References: <607815ae-57b5-4c67-9a52-0de795aefc52@xs4all.nl>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi everyone,

Le jeudi 04 avril 2024 =C3=A0 09:29 +0200, Hans Verkuil a =C3=A9crit=C2=A0:
>=20
> 1) Montreal, October 7 or 8, works for me!

Works for me of course and it would be such a great pleasure see you all in
Montreal. It might also allow some of the folks in Sillicon Valley to come =
and
visit for once.

> 2) Vienna, one day in the period September 16-20, works for me!

Of course restrictions are not always just about travel cost, as I'll be
spending quite a lot of time at GStreamer Conference/Hackfest and XDC, I'll
unlikely be able to be in Vienna that close.

regards,
Nicolas

