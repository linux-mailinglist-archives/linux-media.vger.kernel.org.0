Return-Path: <linux-media+bounces-9165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 698B78A2B9F
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 11:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25B11284B0F
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 09:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519C352F92;
	Fri, 12 Apr 2024 09:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R7zceF5I"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309FF537EE
	for <linux-media@vger.kernel.org>; Fri, 12 Apr 2024 09:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712915714; cv=none; b=KVTvSPww58Q14hmAKDSYpT8juf9/g84yu6ANgArWUKyY0+doHtUnGGXQFrkyGTdm8fUds5y5jdMwClCrx41gbcC+nzPTAlpXJz9KX9VNgH9Aqe49LxOFWZsVf3U90rUClZfyz9TbPtOeopkjWOEn4/a026QfYMnmBuRz2H81Fh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712915714; c=relaxed/simple;
	bh=FiH1b4/eSoB5q8l2RvLTcxcZlxlQxs/CysxzJSN2GEo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=R83UUUv+pCMYxAcaskOQo+55jev1yPbyXJezYWx5fy900CQJyBKsnUC4Xq2Wy1HScIzJ7HJppzpVAgFb7tv3JB0e19MIrYS3NRWAm7VAgzRxqK3z+Gd+qaOk7aK9Wq6XTy39RxUCKDNOJuwQkga9vfd2EnbW0s2RcpE5gq1dnuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R7zceF5I; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0691A68;
	Fri, 12 Apr 2024 11:45:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712915150;
	bh=FiH1b4/eSoB5q8l2RvLTcxcZlxlQxs/CysxzJSN2GEo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=R7zceF5I++SOAPvwPz9oi2iBYiCklODRNJD38iPQFuOexvf//RYTcqa+qIQklqL+K
	 R6cRJXxqdUXQd6Zz1ADwNPYOC4pRI518kbfiHSOqULnBfVtXRBG71rD6cCu6qqVm7t
	 DF5MiMdn+u3priRGDzC5qm9ozOJL4GUA3n7NlwhQ=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240412092836.69031-1-umang.jain@ideasonboard.com>
References: <20240412092836.69031-1-umang.jain@ideasonboard.com>
Subject: Re: [PATCH] media: Documentation: dev-subdev: Fix sentence conjunction
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Umang Jain <umang.jain@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org
Date: Fri, 12 Apr 2024 10:46:30 +0100
Message-ID: <171291519054.887138.4299460749413944806@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Hi Umang,

Quoting Umang Jain (2024-04-12 10:28:36)
> Fix sentence conjunction in the streams and routes section.
>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  Documentation/userspace-api/media/v4l/dev-subdev.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Docum=
entation/userspace-api/media/v4l/dev-subdev.rst
> index 43988516acdd..7f6620cbdf78 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -561,7 +561,7 @@ selections. The order of configuring formats and sele=
ctions along a stream is
>  the same as without streams (see :ref:`format-propagation`).
> =20
>  Instead of the sub-device wide merging of streams from all sink pads
> -towards all source pads, data flows for each route are separate from each
> +towards all source pads, data flows for each route that are separate fro=
m each

I'm not sure this is correct I'm afraid.

The original explains that there are multiple flows of data ('streams?')
and that they are each separate (and can flow in different routes?)

I would only expect a 'that' if there was some further expansion which
doesn't follow.

In fact, I just tried, and I can't make the little green 'grammar-ok'
light in my head illuminate when there is a 'that' added here ;-S


My grammar skills are not good enough to distinguish/explain precisely
except for that magic builtin-native-speaker-right-wrong check and so
ChatGPT (take with a pinch of salt) explained the following:

https://chat.openai.com/share/632bbcae-22f7-4b42-bbe0-6f9178a36d14

Between Sentence A and Sentence B, Sentence A is more grammatically
correct.

Sentence A: "Instead of the sub-device wide merging of streams from all
sink pads towards all source pads, data flows for each route are
separate from each other."

In this sentence, "data flows for each route are separate from each
other" is a clear and independent clause, indicating that the data flows
are separate for each route.

Sentence B: "Instead of the sub-device wide merging of streams from all
sink pads towards all source pads, data flows for each route that are
separate from each other."

In this sentence, the phrase "that are separate from each other" is a
restrictive relative clause modifying "each route." However, this
construction makes the sentence slightly confusing because it seems to
imply that the separation applies to the routes themselves, not to the
data flows. The sentence structure leads to ambiguity regarding what
exactly is separate from what.

Therefore, Sentence A is clearer and more grammatically sound in the
context provided.


--
Kieran


>  other. Any number of routes from streams on sink pads towards streams on
>  source pads is allowed, to the extent supported by drivers. For every
>  stream on a source pad, however, only a single route is allowed.
> --=20
> 2.44.0
>

