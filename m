Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14E9D58B28
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 21:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbfF0Tz2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 15:55:28 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:44899 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbfF0Tz2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 15:55:28 -0400
Received: by mail-qk1-f193.google.com with SMTP id p144so2827310qke.11
        for <linux-media@vger.kernel.org>; Thu, 27 Jun 2019 12:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=yt1jNIDp2qA/3yHgjn04uOj8/ZQqqi5ArAZyFEg3sUE=;
        b=BWgzay3xNhUzmFQJRTmES8JgVzFK+oFu0V1hIVJdpDfA7F661/xmvyEqWsjqW4PwoK
         I7FJZmowuNYY/Oi8TnlllQQQT9f1S8MXuFzKThpoi4YkLrgO8DoTSyWJfrBvIYZSsdE/
         rfKq1YW0Tlas3F8XVmhGG6wa83zJv84T+7xTgXHJ9Bw2DpIAFmKcaafHERevQLHGg3Xw
         +cT0LA9yjvsuIXV9pKjM4OnYY44TMqlN7wtXxifc/94zloqQsoxT/4iiSpOITQeyIYjW
         7QcBoqa8QOWLhYHwBv2GnmNBqX0xfd+9cwlIG19cotGLtRxMshlfGUf9Rbmei5DpFX4D
         jwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=yt1jNIDp2qA/3yHgjn04uOj8/ZQqqi5ArAZyFEg3sUE=;
        b=kF4mIG6R1qLb24Nu9tsvSQveZRkQUySyYzygWLqhah3bYEHarbvHvk8sun1tRHrcxl
         9pm9jUuwa6w9HwIwIFOvuVH5aXvWiim47BznOP+YFv+sBovrQYc7rX70uXZk3+hDE38E
         v1NxEZLIGnqTWqkZTAFbqYgmCBQA0ndwCDKUe+hVFr6EQxCBCvY/l4hHNK0avVEALd7c
         M8mvwIMg7H0rBRqcTQfiofA/l3qqr17AqjOSC1rITTfzV9i3oNt2q8lJOMN7t15Ft5zz
         CQlfUW4sVLk6F99+0uLD0W7ZA7LQvMObydrCSBZfWAdWvW7flMfpW5CwhIC2Ipn4bFkg
         keFw==
X-Gm-Message-State: APjAAAXiHnL3ycTTN2rstMf8hxvBrcP1YK93p1YhMIiB/RLDwG8MiELM
        TuUIigF7b0L2chPZngjXGxZIVA==
X-Google-Smtp-Source: APXvYqwSFWynfwlPVHqkWaRXdpOxvobRK8nLJCHmtX8Il/K9rE3SBBq7NCdp74P5/yHi1jULHYE3Kg==
X-Received: by 2002:a37:9e13:: with SMTP id h19mr5280337qke.435.1561665327324;
        Thu, 27 Jun 2019 12:55:27 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id v30sm59106qtk.45.2019.06.27.12.55.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 27 Jun 2019 12:55:26 -0700 (PDT)
Message-ID: <5e20b1d04b3c2f64173631ec2f0261a8a9597f0c.camel@ndufresne.ca>
Subject: Re: [PATCH 01/31] staging: bcm2835-camera: Ensure H264 header bytes
 get a sensible timestamp
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Stefan Wahren <wahrenst@gmx.net>, Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Date:   Thu, 27 Jun 2019 15:55:24 -0400
In-Reply-To: <1561661788-22744-2-git-send-email-wahrenst@gmx.net>
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
         <1561661788-22744-2-git-send-email-wahrenst@gmx.net>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-d8CcQZOwWBYHAu9rQvMR"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-d8CcQZOwWBYHAu9rQvMR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Le jeudi 27 juin 2019 =C3=A0 20:55 +0200, Stefan Wahren a =C3=A9crit :
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
>=20
> H264 header come from VC with 0 timestamps, which means they get a
> strange timestamp when processed with VC/kernel start times,
> particularly if used with the inline header option.
> Remember the last frame timestamp and use that if set, or otherwise
> use the kernel start time.

Normally H264 headers are considered to be part of the following frame.
Giving it the timestamp of the previous frame will likely confuse some
userspace and cause an off-by-one in timestamp. I understand this is a
workaround, but am wondering if this can be improved.

>=20
> Link: https://github.com/raspberrypi/linux/issues/1836
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> ---
>  .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c  | 14 ++++++++=
++++--
>  .../staging/vc04_services/bcm2835-camera/bcm2835-camera.h  |  2 ++
>  2 files changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.=
c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> index dce6e6d..0c04815 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> @@ -359,7 +359,9 @@ static void buffer_cb(struct vchiq_mmal_instance *ins=
tance,
>  		}
>  	} else {
>  		if (dev->capture.frame_count) {
> -			if (dev->capture.vc_start_timestamp !=3D -1 && pts) {
> +			if (dev->capture.vc_start_timestamp !=3D -1) {
> +				buf->vb.vb2_buf.timestamp =3D ktime_get_ns();
> +			} else if (pts) {
>  				ktime_t timestamp;
>  				s64 runtime_us =3D pts -
>  				    dev->capture.vc_start_timestamp;
> @@ -372,8 +374,15 @@ static void buffer_cb(struct vchiq_mmal_instance *in=
stance,
>  					 ktime_to_ns(timestamp));
>  				buf->vb.vb2_buf.timestamp =3D ktime_to_ns(timestamp);
>  			} else {
> -				buf->vb.vb2_buf.timestamp =3D ktime_get_ns();
> +				if (dev->capture.last_timestamp) {
> +					buf->vb.vb2_buf.timestamp =3D
> +						dev->capture.last_timestamp;
> +				} else {
> +					buf->vb.vb2_buf.timestamp =3D
> +						ktime_to_ns(dev->capture.kernel_start_ts);
> +				}
>  			}
> +			dev->capture.last_timestamp =3D buf->vb.vb2_buf.timestamp;
>=20
>  			vb2_set_plane_payload(&buf->vb.vb2_buf, 0, length);
>  			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> @@ -541,6 +550,7 @@ static int start_streaming(struct vb2_queue *vq, unsi=
gned int count)
>  			 dev->capture.vc_start_timestamp, parameter_size);
>=20
>  	dev->capture.kernel_start_ts =3D ktime_get();
> +	dev->capture.last_timestamp =3D 0;
>=20
>  	/* enable the camera port */
>  	dev->capture.port->cb_ctx =3D dev;
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.=
h b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
> index 2b5679e..09273b0 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
> @@ -90,6 +90,8 @@ struct bm2835_mmal_dev {
>  		s64         vc_start_timestamp;
>  		/* Kernel start timestamp for streaming */
>  		ktime_t kernel_start_ts;
> +		/* Timestamp of last frame */
> +		u64		last_timestamp;
>=20
>  		struct vchiq_mmal_port  *port; /* port being used for capture */
>  		/* camera port being used for capture */
> --
> 2.7.4
>=20

--=-d8CcQZOwWBYHAu9rQvMR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXRUfLAAKCRBxUwItrAao
HGmDAJ4vwzchXaLcmU0zm6amAKLUEoEaHQCg3cSPF/ZSaNoxR8VQYSGDRwOC1m4=
=b5TF
-----END PGP SIGNATURE-----

--=-d8CcQZOwWBYHAu9rQvMR--

