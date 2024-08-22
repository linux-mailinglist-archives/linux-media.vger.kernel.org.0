Return-Path: <linux-media+bounces-16603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F12395B931
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 17:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB39D1C20F06
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 15:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8B81CC88D;
	Thu, 22 Aug 2024 15:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.dufresne@collabora.com header.b="VbYT+Wau"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A15E1CB329
	for <linux-media@vger.kernel.org>; Thu, 22 Aug 2024 15:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724338802; cv=pass; b=BSsAU4Q83igaXCxQDSOUaWhIogthtcG9VsZYFVwytdFzKkZnSHWmmdpnBOgHVmG1LR/T1wBywcy4Htvf/dZDyGvV3FckwYBOQoJzRj9igC7njdcu17kEdKHdCdHTbdJp/BY+sr9/H8DGaPh1A4aoHIkBlM6zRnA1MsOZxfS1Ou0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724338802; c=relaxed/simple;
	bh=JcOmcnbiVYDdi9hpV3WOYE5KLA+pjjhq+BzV5Qy3lxU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K1fsybGE+ye3f7jxCcr/BzmftOjjXpyK2Nb8bObbzAUu9acLelzaPhkHmFx/JRDUwI0EV/7faa9Po6Tx6EYfETPMMaB4WBIz6VsgEaPg6XbcFsNFLfYQOzcMNdFIip9GzohNh49VVu6o2gPKG5GinRgbe5+Bq2f7AA2n3cPAF58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.dufresne@collabora.com header.b=VbYT+Wau; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: sebastian.fricke@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724338795; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Uvy1LU9V+Aw9KyOHJAKqnCB2PxG24S+TsZzooCRi/uW6IELrtldOc08rl00kyW5NSXeE2847ciNRLR+bTN/c8YLPrqmcAKIpPYjKXKG+QmoMbyrgcXnVVOURgdOvhpzD+IZsuF/TcctLgshQV5GbP7gcrJYEk4+32VNVp365aeE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724338795; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M7dQeq7jmoGr2QIxc56s+hkpKTUjIERtLtJRI2GCt3I=; 
	b=TW/EKD+R96lAjqRRm0G2GW8Keldj4SXT1BOmlow2g4Aja3wnZyfV8eukqpkQN1pIJlrg/CaWjepJjCF0pWLKchDSW6SSWrKzwq/KR1W4X+0hL4xMO7OGKgyWRHFMh+HWO6d9/utfstHhFMTvyL66qQS7CvXAeTXSZ4qZSRNUYso=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.dufresne@collabora.com;
	dmarc=pass header.from=<nicolas.dufresne@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724338795;
	s=zohomail; d=collabora.com; i=nicolas.dufresne@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=M7dQeq7jmoGr2QIxc56s+hkpKTUjIERtLtJRI2GCt3I=;
	b=VbYT+WaubbYHVqJZ4oLVFYt/ueLQ3Vq/0Apw7ILtrJNspWc9NFaCH27aokk1pG77
	s6uSJvmbNyzptXCUF08QydSd6sfN+eoMYjohDQrLfU2pZTq9F9WoE/nFbFDQhS5HHpY
	4m6InQyHEf/LPA0wseTKxtklISlXh+YUC1oj21/Q=
Received: by mx.zohomail.com with SMTPS id 1724338793108246.91181109367335;
	Thu, 22 Aug 2024 07:59:53 -0700 (PDT)
Message-ID: <4765e957fbb3309f7bf37411484913af8e34e48d.camel@collabora.com>
Subject: Re: [RFC PATCH 1/3] media: mc: add manual request completion
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Thu, 22 Aug 2024 10:59:51 -0400
In-Reply-To: <b1b171c80093adecb9ff2e987ef76fbdaf5a65a9.1724246043.git.hverkuil-cisco@xs4all.nl>
References: <cover.1724246043.git.hverkuil-cisco@xs4all.nl>
	 <b1b171c80093adecb9ff2e987ef76fbdaf5a65a9.1724246043.git.hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

Thanks Hans,

I'm very happy with how simple this is. Few comments below...

Le mercredi 21 ao=C3=BBt 2024 =C3=A0 15:14 +0200, Hans Verkuil a =C3=A9crit=
=C2=A0:
> By default when the last request object is completed, the whole
> request completes as well.
>=20
> But sometimes you want to manually complete a request in a driver,
> so add a manual complete mode for this.
>=20
> In req_queue the driver marks the request for manual completion by
> calling media_request_mark_manual_completion, and when the driver
> wants to manually complete the request it calls
> media_request_manual_complete().
>=20
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/mc/mc-request.c | 31 +++++++++++++++++++++++++++++--
>  include/media/media-request.h | 33 ++++++++++++++++++++++++++++++++-
>  2 files changed, 61 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.=
c
> index addb8f2d8939..3f348e05b03f 100644
> --- a/drivers/media/mc/mc-request.c
> +++ b/drivers/media/mc/mc-request.c
> @@ -54,6 +54,7 @@ static void media_request_clean(struct media_request *r=
eq)
>  	req->access_count =3D 0;
>  	WARN_ON(req->num_incomplete_objects);
>  	req->num_incomplete_objects =3D 0;
> +	req->manual_completion =3D false;
>  	wake_up_interruptible_all(&req->poll_wait);
>  }
> =20
> @@ -319,6 +320,7 @@ int media_request_alloc(struct media_device *mdev, in=
t *alloc_fd)
>  	req->mdev =3D mdev;
>  	req->state =3D MEDIA_REQUEST_STATE_IDLE;
>  	req->num_incomplete_objects =3D 0;
> +	req->manual_completion =3D false;
>  	kref_init(&req->kref);
>  	INIT_LIST_HEAD(&req->objects);
>  	spin_lock_init(&req->lock);
> @@ -465,7 +467,7 @@ void media_request_object_unbind(struct media_request=
_object *obj)
> =20
>  	req->num_incomplete_objects--;
>  	if (req->state =3D=3D MEDIA_REQUEST_STATE_QUEUED &&
> -	    !req->num_incomplete_objects) {
> +	    !req->num_incomplete_objects && !req->manual_completion) {
>  		req->state =3D MEDIA_REQUEST_STATE_COMPLETE;
>  		completed =3D true;
>  		wake_up_interruptible_all(&req->poll_wait);
> @@ -494,7 +496,7 @@ void media_request_object_complete(struct media_reque=
st_object *obj)
>  	    WARN_ON(req->state !=3D MEDIA_REQUEST_STATE_QUEUED))
>  		goto unlock;
> =20
> -	if (!--req->num_incomplete_objects) {
> +	if (!--req->num_incomplete_objects && !req->manual_completion) {
>  		req->state =3D MEDIA_REQUEST_STATE_COMPLETE;
>  		wake_up_interruptible_all(&req->poll_wait);
>  		completed =3D true;
> @@ -505,3 +507,28 @@ void media_request_object_complete(struct media_requ=
est_object *obj)
>  		media_request_put(req);
>  }
>  EXPORT_SYMBOL_GPL(media_request_object_complete);
> +
> +void media_request_manual_complete(struct media_request *req)
> +{
> +	unsigned long flags;
> +	bool completed =3D false;
> +
> +	if (!req || !req->manual_completion)

I think calling this function with !req || !req->manual_completion should b=
e
considered a programming error, so I'd suggest BUG_ON(). It will be easier
though if you split them appart in their own branches, this way if someone =
hits
that the backtrace will allow differentiating the two errors.

> +		return;
> +
> +	spin_lock_irqsave(&req->lock, flags);
> +	if (WARN_ON(req->state !=3D MEDIA_REQUEST_STATE_QUEUED))
> +		goto unlock;
> +
> +	req->manual_completion =3D false;
> +	if (!req->num_incomplete_objects) {
> +		req->state =3D MEDIA_REQUEST_STATE_COMPLETE;
> +		wake_up_interruptible_all(&req->poll_wait);
> +		completed =3D true;
> +	}

Perhaps we should enforce that no more objects are attached ? Objects today=
 are
bitstream buffer and controls and it would be unexpected to have this signa=
lled
after the request. I would also suggest BUG_ON() for that case, since it wo=
uld
entirely be driver faults.

> +unlock:
> +	spin_unlock_irqrestore(&req->lock, flags);
> +	if (completed)
> +		media_request_put(req);
> +}
> +EXPORT_SYMBOL_GPL(media_request_manual_complete);
> diff --git a/include/media/media-request.h b/include/media/media-request.=
h
> index 3cd25a2717ce..31886caa0c7a 100644
> --- a/include/media/media-request.h
> +++ b/include/media/media-request.h
> @@ -56,6 +56,10 @@ struct media_request_object;
>   * @access_count: count the number of request accesses that are in progr=
ess
>   * @objects: List of @struct media_request_object request objects
>   * @num_incomplete_objects: The number of incomplete objects in the requ=
est
> + * @manual_completion: if true, then the request won't be marked as comp=
leted
> + * when @num_incomplete_objects reaches 0. Call media_request_manual_com=
plete()
> + * to set this field to false and complete the request
> + * if @num_incomplete_objects =3D=3D 0.
>   * @poll_wait: Wait queue for poll
>   * @lock: Serializes access to this struct
>   */
> @@ -68,6 +72,7 @@ struct media_request {
>  	unsigned int access_count;
>  	struct list_head objects;
>  	unsigned int num_incomplete_objects;
> +	bool manual_completion;
>  	wait_queue_head_t poll_wait;
>  	spinlock_t lock;
>  };
> @@ -218,6 +223,32 @@ media_request_get_by_fd(struct media_device *mdev, i=
nt request_fd);
>  int media_request_alloc(struct media_device *mdev,
>  			int *alloc_fd);
> =20
> +/**
> + * media_request_mark_manual_completion - Set manual_completion to true
> + *
> + * @req: The request
> + *
> + * Mark that the request has to be manually completed by calling
> + * media_request_manual_complete().
> + *
> + * This function should be called in the req_queue callback.
> + */
> +static inline void
> +media_request_mark_manual_completion(struct media_request *req)
> +{
> +	req->manual_completion =3D true;
> +}
> +
> +/**
> + * media_request_manual_complete - Set manual_completion to false
> + *
> + * @req: The request
> + *
> + * Set @manual_completion to false, and if @num_incomplete_objects
> + * is 0, then mark the request as completed.

If my suggestions are kept, I would argue we should document that not more
object should be attached.

> + */
> +void media_request_manual_complete(struct media_request *req);
> +
>  #else
> =20
>  static inline void media_request_get(struct media_request *req)
> @@ -336,7 +367,7 @@ void media_request_object_init(struct media_request_o=
bject *obj);
>   * @req: The media request
>   * @ops: The object ops for this object
>   * @priv: A driver-specific priv pointer associated with this object
> - * @is_buffer: Set to true if the object a buffer object.
> + * @is_buffer: Set to true if the object is a buffer object.
>   * @obj: The object
>   *
>   * Bind this object to the request and set the ops and priv values of


thanks again, this is looking good,
Nicolas

