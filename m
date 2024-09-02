Return-Path: <linux-media+bounces-17370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAA4968A04
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 16:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10BA3281605
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 14:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0821A262D;
	Mon,  2 Sep 2024 14:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ranostay.sg header.i=@ranostay.sg header.b="iwlgLrgF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CC26FC3
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 14:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725287572; cv=none; b=ClqQnqbmoa+dlrof6f5rG8reGG0FROGkhzcZ9yjjGzumn21Yl2dzic40XGRpd0GYZI5Oa6Ax4Ww1G7t4MedYwmPf80u/7M/pN7k6aFgqSg5MTxdqC3uzQr2xjY5YIq7apvGP/Fxn+STlJT8kS9yC6OlQsm0OUy1Fu1jjoO6E1Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725287572; c=relaxed/simple;
	bh=axoYNwOEDk71WLZVvWfiZKC+AKXojbWj2BxaU6yWlDU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U9xOFnlWDfwXBgUBYO3VhYs/WBda23LDv5qG5449Sb6E61dnkWi2zB7tjBA8c9F/Q5nwkdtFS+VFpClqBG29Gxskr+bU8exgG9ga/EthglxRnse5es7W9JtvKdvsD4ugKw9tIuA8Xx4fk2nF5iowEFrGyEElXeQp/TUWmRlMgLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ranostay.sg; spf=pass smtp.mailfrom=ranostay.sg; dkim=pass (2048-bit key) header.d=ranostay.sg header.i=@ranostay.sg header.b=iwlgLrgF; arc=none smtp.client-ip=185.70.40.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ranostay.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ranostay.sg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ranostay.sg;
	s=protonmail2; t=1725287566; x=1725546766;
	bh=axoYNwOEDk71WLZVvWfiZKC+AKXojbWj2BxaU6yWlDU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iwlgLrgFNMJb75u/O5QSj1E8vBRSVMoJMZI4PEmVynLwnFwsSSPgy5FffxdnGJGuv
	 EoXnObVDzgMGDBixqSS7aZX9eiWEwy150g/KZphqH0cLMfE2Dgs1cMm34Dd1HMEseF
	 IK0psYPLhGVakTXkI66wkDgtb1rBcJYtKxzRzB1fPqs0OwqcaluB13DcoymIQ7B+60
	 WUHChsy0G7aFtaCO66IX5a/zAXNMF7IdL0DPyykXcI/nQkQDurFtnFblUfkObbJp18
	 tcbt5tjUGbd4xF1vkSukB9XEyD+pKLc3pcqeW8FYcF2S/9XFbVcHsbVdPmXwPpQ+fg
	 5m2VIGFrvh6ZQ==
Date: Mon, 02 Sep 2024 14:32:42 +0000
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
From: Matt Ranostay <matt@ranostay.sg>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 7/9] media: video-i2c: set lock before calling vb2_queue_init()
Message-ID: <P1bILEZSAeNRMbmyKZNMvDmBwUH58gSE7gJNmLNcYLghDuhYLaIgHU5wxSL5TV2ATaqMYpBajFOQsZ4rvmtBBSFbjOS6PHjwc9tRPYizVWM=@ranostay.sg>
In-Reply-To: <42695db9edcf5e6b5ddebab59338eb88a5abcebe.1725285495.git.hverkuil-cisco@xs4all.nl>
References: <cover.1725285495.git.hverkuil-cisco@xs4all.nl> <42695db9edcf5e6b5ddebab59338eb88a5abcebe.1725285495.git.hverkuil-cisco@xs4all.nl>
Feedback-ID: 87502384:user:proton
X-Pm-Message-ID: 0c338f3e3828aeef79e0edb1b709f54cbb470def
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sent with Proton Mail secure email.

On Monday, September 2nd, 2024 at 22:04, Hans Verkuil <hverkuil-cisco@xs4al=
l.nl> wrote:

> The vb2_queue_init() will expect the vb2_queue lock pointer to be set in
> the future. So for those drivers that set the lock later, move it up to
> before the vb2_queue_init() call.
>=20
> Signed-off-by: Hans Verkuil hverkuil-cisco@xs4all.nl
>=20

LGTM

Acked-by: Matt Ranostay <matt@ranostay.sg>

> Cc: Matt Ranostay matt@ranostay.sg
>=20
> ---
> drivers/media/i2c/video-i2c.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.=
c
> index 56dbe07a1c99..ffb3d9d61a74 100644
> --- a/drivers/media/i2c/video-i2c.c
> +++ b/drivers/media/i2c/video-i2c.c
> @@ -798,13 +798,13 @@ static int video_i2c_probe(struct i2c_client *clien=
t)
> queue->min_queued_buffers =3D 1;
>=20
> queue->ops =3D &video_i2c_video_qops;
>=20
> queue->mem_ops =3D &vb2_vmalloc_memops;
>=20
> + queue->lock =3D &data->queue_lock;
>=20
>=20
> ret =3D vb2_queue_init(queue);
> if (ret < 0)
> goto error_unregister_device;
>=20
> data->vdev.queue =3D queue;
>=20
> - data->vdev.queue->lock =3D &data->queue_lock;
>=20
>=20
> snprintf(data->vdev.name, sizeof(data->vdev.name),
>=20
> "I2C %d-%d Transport Video",
> --
> 2.34.1

