Return-Path: <linux-media+bounces-24303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB38A0316A
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 21:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DABA61886BAC
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 20:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C662715DBA3;
	Mon,  6 Jan 2025 20:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="2+entuLY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAD03B1A2
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 20:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736195530; cv=none; b=na2ix4AATX0+k0gbFPJNXD2qoNtyfZ26SYUkoZ4BOCpzeewfdFX7SHVb1ELWkiDpZkaxWbB4j9sQgVuYCsSlSyKvlHdIKnUx50GW7bqM0vWoS5EOLaC8Y9bZ3d1qsKB6FPUj4qG6heSe8CHejL/eL66G74OQL08nDFDeM9X51Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736195530; c=relaxed/simple;
	bh=Gg72xwStLX68xT7zKmMFbWrPmKF7QPteQAPUtMaea8c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W4hSzo5M27Lar0Gl5UVOH0O3jAWhncCsTfChrdEdiC/aoLwHMmlGzaOlqebvrmvKi0ZY/MYPYLv68R9KVCh73TF63eEu0X1jT8S+4XSAlmX7ddS1039oRRRXWC8xJ+EBJ2W/7gtby3GDLrT2yNdYB79gDVpBmGxwzVTKfTFnFzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=2+entuLY; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6ea711805so1664767385a.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 12:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736195526; x=1736800326; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kdc9HujfsRg7VZQTWP86uL6Jay31RcJJzYBF0Dh2UBc=;
        b=2+entuLYaLORlrAmPJx0iDKzg63Hs4ZQput8qXUOZ5U0/8J9LvqH4G7KPK1xjEH9o5
         xiXTDyX9AskQ8+0pU/8jVwa6z68J4d1hVVEPvBEhKeO01fKdQHW0fV6+Kb6Y7gG+DReN
         vyH0wA+R/2xQIpPxbLU2DcZ1HT1xtQjK2oF3BcN5JQ12n+7hQbiyqa5fXI0chOVBt0M0
         CxfksK1VNT2EoaEGhJ6ncxLbQROert17yXDv6M1q3lIkQtM/yDfJMQh2etDKbNVuH6cF
         /+/RcliumzNJj8QMvV7tRa5nopDgovnwBGPhZ3Nb30/PyX5iqqpVny1hPGrV6RVTOtDv
         tNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736195526; x=1736800326;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdc9HujfsRg7VZQTWP86uL6Jay31RcJJzYBF0Dh2UBc=;
        b=n0PafzBMD5tMJcqWi+H2X+QxovNu3sia3wNN2q297t2Jwd60ch7+fqMLcXfXRdyWv+
         +XoeGbf7Azlfz8f/4aVp1OcC7qEGzdwAbO+OsfPjIxAyUbUVkJ9eLJk3x4QwWGSXldcF
         JOqCLiZpH1FhuAQ3Mu/FgxZjoo+iiLC3M6u+NSQv9sphcxN0vFK0oWuUd5k0VZIeXsd3
         MZeyFlxYfB0HX7GdTdgDRlpgnNrl3/WIs8Ma8PWw7kQQZV35i6XQNqjykaF2CdgOhJCc
         +cXuNs8SBqgKCFR7itSa+oDd3WnKJyv5NPztKFGnCIaSJn8VsvFQSC83F9N14VwrC4WW
         CqWw==
X-Forwarded-Encrypted: i=1; AJvYcCVFkofGqLXND+7MO7n4Qg00BTGVsspN8Y6C7CFT0CkNAqJoMwPu4UnAHM8ihhFmzcbBF/Pi5BgbLzb3ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YyObBFgbgR5JaqsqLZvrT+WNJqn0eWc5HyQE2Q0OVZZcQXZ0vjA
	RnbPCXSJcmZ7yvJ2sLPKON057VR+16bM3Fg9E8TJw+LpT19oFBA/nwS4jnf8G8lEeD1RDmUIIYt
	1NLE=
X-Gm-Gg: ASbGncuhn9QDJOKjO+9SrZqg08jSBjytoBJ+QF4ke/8dtp55quCMYkydCw9B5srzos+
	WmYFzhEc8HCRH/u18iwkiRqK7TjM/LtAN163j+a3DQLNFfO1FpFMSXb0a5LYov6gYczkzAz1TIJ
	7SKDf/DXEc8Vl2CJvMNkTVjcHu9GLqz4CUBFhDZh/SNonW4Kc12jygXRYGC/eQf3Xo/4AQ3mYCD
	7B3ib2DHMBryAavqkQ6P83271B7y/BFdwhk6xKQsy/92ZZHk/EMA93b/A==
X-Google-Smtp-Source: AGHT+IGaJpT+BxFlDBZrV6BBcWmbAI2GjotZUUHH189+Gylpr5iFInf8jOLV4WbFI11Oj7cprPVUFQ==
X-Received: by 2002:a05:620a:450a:b0:7b1:45ac:86b4 with SMTP id af79cd13be357-7b9ba75a9d1mr11531780685a.21.1736195526131;
        Mon, 06 Jan 2025 12:32:06 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac2df39fsm1534988685a.38.2025.01.06.12.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 12:32:05 -0800 (PST)
Message-ID: <42b656180e4b3f9f720173787075e165509942c1.camel@ndufresne.ca>
Subject: Re: [PATCH 1/7] RFC: media: Add media_request_{pin,unpin} API
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>,  Dom Cobley <dom@raspberrypi.com>, review list
 <kernel-list@raspberrypi.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
  John Cox <john.cox@raspberypi.com>
Date: Mon, 06 Jan 2025 15:32:04 -0500
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-1-0ebcc04ed42e@raspberrypi.com>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
	 <20241220-media-rpi-hevc-dec-v1-1-0ebcc04ed42e@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Dave,

I'm very happy to see this effort being resumed.

Le vendredi 20 d=C3=A9cembre 2024 =C3=A0 16:21 +0000, Dave Stevenson a =C3=
=A9crit=C2=A0:
> From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>=20
> This is probably not the API we will want to add, but it
> should show what semantics are needed by drivers.
>=20
> The goal is to allow the OUTPUT (aka source) buffer and the
> controls associated to a request to be released from the request,
> and in particular return the OUTPUT buffer back to userspace,
> without signalling the media request fd.

My impression is that Hans proposal for media_request_manual_complete() is
better align to the direction we want to take to solve this issue. Mediatek=
 and
Sebastian are currently experimenting with it for the MTK VCODEC driver, wh=
ich
also have two stages (but in two cores).

https://lore.kernel.org/linux-media/cover.1724928939.git.hverkuil-cisco@xs4=
all.nl/

I'm not sure if you noticed this work, but having from more feedback on it =
would
be nice. So far the main challenge we have hit is that it can be difficult =
to
use when the first stages completes before the device_run function finishes
(reentrant). But we believe its MTK VCODEC software design that introduce t=
his
complexity. With the 2 stage single core design, that issue won't exist, so=
 my
impression is that this should be straightforward for you.

Nicolas

>=20
> This is useful for devices that are able to pre-process
> the OUTPUT buffer, therefore able to release it before
> the decoding is finished. These drivers should signal
> the media request fd only after the CAPTURE buffer is done.
>=20
> Tested-by: John Cox <john.cox@raspberypi.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/mc/mc-request.c | 35 +++++++++++++++++++++++++++++++++++
>  include/media/media-request.h | 12 ++++++++++++
>  2 files changed, 47 insertions(+)
>=20
> diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.=
c
> index 5edfc2791ce7..b5334389d846 100644
> --- a/drivers/media/mc/mc-request.c
> +++ b/drivers/media/mc/mc-request.c
> @@ -499,3 +499,38 @@ void media_request_object_complete(struct media_requ=
est_object *obj)
>  		media_request_put(req);
>  }
>  EXPORT_SYMBOL_GPL(media_request_object_complete);
> +
> +void media_request_pin(struct media_request *req)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&req->lock, flags);
> +	if (WARN_ON(req->state !=3D MEDIA_REQUEST_STATE_QUEUED))
> +		goto unlock;
> +	req->num_incomplete_objects++;
> +unlock:
> +	spin_unlock_irqrestore(&req->lock, flags);
> +}
> +EXPORT_SYMBOL_GPL(media_request_pin);
> +
> +void media_request_unpin(struct media_request *req)
> +{
> +	unsigned long flags;
> +	bool completed =3D false;
> +
> +	spin_lock_irqsave(&req->lock, flags);
> +	if (WARN_ON(!req->num_incomplete_objects) ||
> +	    WARN_ON(req->state !=3D MEDIA_REQUEST_STATE_QUEUED))
> +		goto unlock;
> +
> +	if (!--req->num_incomplete_objects) {
> +		req->state =3D MEDIA_REQUEST_STATE_COMPLETE;
> +		wake_up_interruptible_all(&req->poll_wait);
> +		completed =3D true;
> +	}
> +unlock:
> +	spin_unlock_irqrestore(&req->lock, flags);
> +	if (completed)
> +		media_request_put(req);
> +}
> +EXPORT_SYMBOL_GPL(media_request_unpin);
> diff --git a/include/media/media-request.h b/include/media/media-request.=
h
> index d4ac557678a7..c48cfb710959 100644
> --- a/include/media/media-request.h
> +++ b/include/media/media-request.h
> @@ -189,6 +189,10 @@ static inline void media_request_get(struct media_re=
quest *req)
>   */
>  void media_request_put(struct media_request *req);
> =20
> +void media_request_pin(struct media_request *req);
> +
> +void media_request_unpin(struct media_request *req);
> +
>  /**
>   * media_request_get_by_fd - Get a media request by fd
>   *
> @@ -228,6 +232,14 @@ static inline void media_request_put(struct media_re=
quest *req)
>  {
>  }
> =20
> +static inline void media_request_pin(struct media_request *req)
> +{
> +}
> +
> +static inline void media_request_unpin(struct media_request *req)
> +{
> +}
> +
>  static inline struct media_request *
>  media_request_get_by_fd(struct media_device *mdev, int request_fd)
>  {
>=20


