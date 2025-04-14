Return-Path: <linux-media+bounces-30170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEAAA88302
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 15:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44C773BF698
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 13:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A3B27B4FF;
	Mon, 14 Apr 2025 13:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jd9WLyX8"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6312957CD;
	Mon, 14 Apr 2025 13:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637336; cv=none; b=fM6TcYLLaU0QP28AhSJizI12c6zCvH2Jzq4WDwnPc373/VIAAHr+I/tgBP+TWIpj5Ao7C/p1teOKO1msEJ3OrdWlLYaBPXIrcceuyPSXkEOh6awoaKeJfjHKeNDWN3SWuyb9948PPK4k7inF5Lo9hxF1k+/J9FrMFp5+VeELQqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637336; c=relaxed/simple;
	bh=6C5Jici+EhLeC4d7iAWY8LbyVL6AZqGWquMhefHINnQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iul95l4yYz8w+owN5j3N7CiXQF0qwWFpn5qxfDNHiliL0oaRntVuq2Pm3VQZxV6XVumbtJ1w7l3YqR4dA6vVeNfWyBqjz9pijKOJrJpQEBJOXqOlAtY6dRXmvILtW0B5D/ykLFdmJWRbypC+GcK7MLBC0ErQi37ymIzvGCwK9A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jd9WLyX8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744637331;
	bh=6C5Jici+EhLeC4d7iAWY8LbyVL6AZqGWquMhefHINnQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jd9WLyX895EKUjHfL//CV32DucIcz3vI971IypjJ/VtSZ0bnryE/NwcUE4aA/ntqW
	 LT7smg2s9M5tcwC1Qq4QNiVPBOLrhnUpSdoC8Z7d8HGtM1qg2cFrwBt58/U2duC8hn
	 qkkapL95veKTcscEzHUO3+/syZaqUbjh7oPQn8xWloLeq1WkG/88NpHtgOA5bnax6Y
	 wOcm9HGZigw3XeYvH4t7s35JH1rMKmPtP+0AMZH5cHBGCLaHG6ZSvsytDyg00JjoNj
	 Ajj7nBcfxoCfFF428trLp8AKC8KwTvGjn6uEodv2xo3g4rDxalqd6R1HGCfziE/Ydq
	 pUv8dc62tNr3Q==
Received: from [IPv6:2606:6d00:11:e976::5ac] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F347717E017D;
	Mon, 14 Apr 2025 15:28:49 +0200 (CEST)
Message-ID: <296144dec19f3aee958dcdae7700e7a7ed38b8ff.camel@collabora.com>
Subject: Re: [RESEND PATCH v1 0/7] Performance improvement of decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>, "mchehab@kernel.org"	
 <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl"
 <hverkuil-cisco@xs4all.nl>,  "bob.beckett@collabora.com"	
 <bob.beckett@collabora.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "lafley.kim" <lafley.kim@chipsnmedia.com>,  "b-brnich@ti.com"	
 <b-brnich@ti.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung	
 <nas.chung@chipsnmedia.com>
Date: Mon, 14 Apr 2025 09:28:48 -0400
In-Reply-To: <SE1P216MB130320F62126A2F02BDB7FB3EDB32@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20250410034002.88-1-jackson.lee@chipsnmedia.com>
	 <b11f2cd9706c409775a44db06dd8399193be3758.camel@collabora.com>
	 <SE1P216MB130320F62126A2F02BDB7FB3EDB32@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Jackson,

Le lundi 14 avril 2025 à 02:04 +0000, jackson.lee a écrit :
> > > Sequence Change test
> > > =====================
> > > gst-launch-1.0 filesrc location=./switch_1080p_720p_240frames.h264 !
> > > h264parse ! v4l2h264dec ! filesink location=./h264_output_420.yuv
> > > Setting pipeline to PAUSED ...
> > > Pipeline is PREROLLING ...
> > > Redistribute latency...
> > > Redistribute latency...
> > > Pipeline is PREROLLED ...
> > > Setting pipeline to PLAYING ...
> > > Redistribute latency...
> > > New clock: GstSystemClock
> > > Got EOS from element "pipeline0".
> > > Execution ended after 0:00:05.772414400 Setting pipeline to NULL ...
> > > Freeing pipeline ...
> > 
> > I did a test of my own here, and did get kernel splat. The warning
> > indicate that the state machine is no longer respected. This needs to be
> > address in v2, we added these check, since the locking is bound to legal
> > use of the state machine.
> 
> 
> Since applying the performance patch, device_run and wave5_vpu_dec_finish_decode is not synchronized any more.
> How about removing this warning message ?

I would like to understand how it makes sense the we've reached STOP
state while the HW is still actively decoding. It does not feel robust
to me, perhaps you want to introduce a new state ? Also, I'm concern
with overall thread-safety now.

regards,

-- 
Nicolas Dufresne
Principal Engineer at Collabora

