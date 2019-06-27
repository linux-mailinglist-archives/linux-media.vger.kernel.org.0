Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 841BD58B59
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 22:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbfF0UBP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 16:01:15 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:36602 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbfF0UBP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 16:01:15 -0400
Received: by mail-qt1-f195.google.com with SMTP id p15so3879390qtl.3
        for <linux-media@vger.kernel.org>; Thu, 27 Jun 2019 13:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=qKK2KDX7frtrIKr1EplmktiBaWbPgSjQcBIIxMVX2RU=;
        b=eUJdgworBLQew89Ab56iS1MHkbPZfN/a/hYyu+uNK5hrjQviRKG1CHF7ouGaxJOzn9
         FfpU3W26Z0xXwnbfh5ymfHSBUZysfAWmcwPTY3H1KBraiH4P5UcY6yg3BJzVB9XE+cqM
         /fLXGZEewVl7CUcgfXsRia3fZz0GUyxQrClwKAeJnk0MiAiF5n+XrWBBOScqBl5vMx3f
         hmLKsEPOG4VMvp4T7ybl6RxasQ2GQJ42ZJi/fKR961njNW1y4M3ugmcljjll+vWspBm0
         khCqghz04HYTMqIk3Lm/5F7ePHQ+J92m8I+/Zh0u6kenqQi4m+O2rV8i9V0urQQz2Nfm
         ekYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=qKK2KDX7frtrIKr1EplmktiBaWbPgSjQcBIIxMVX2RU=;
        b=p6nMjbNDLIN55qd0qcrGfZxRgd15GuVKmqA8b/egqJClmJxkiuPdcbmiv32nnt3zcQ
         i4wiBwNEnMm7LzdP+WWsnp1W3rV2LcuHhnjQMnJpkCCFa71A0N50fMMMabIgfJ8xrWhM
         o6qfJr1YiJ2xmBGwIk47p37Bhp4y08Vc4HTk+NfHu09sYdrNUOhAd1TztQnNDBlhcFao
         /8sK+QbT9LbV+nFYQMXfOyFM1THhPWfif/fIe2YwegKafAho0p1hD3+AApC2gHbAINYo
         JgtGi5dY/u9Hv2616onoTUFp9OIc6Kc2832MyT4DMwXBj7RNldA1IKaMfUDiIXStlzCd
         2EhA==
X-Gm-Message-State: APjAAAVRBEXih4R4lZAtFd6Giap1aW/LJUgljv4EZiSWA/TbUr7+C2Cm
        ScSDH76t4le7z/xPrpYqK+nTeg==
X-Google-Smtp-Source: APXvYqzXytLoY5aMFDhelaZYmwxxaAOnY02e5QhQ6jI4M7w1awpujSXVkKSKeJpgDsT4OqNja6A5Kg==
X-Received: by 2002:ac8:2734:: with SMTP id g49mr4936133qtg.228.1561665674052;
        Thu, 27 Jun 2019 13:01:14 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id c18sm32024qkk.73.2019.06.27.13.01.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 27 Jun 2019 13:01:13 -0700 (PDT)
Message-ID: <804b1c4708bb0292ba32535d4b986a129d6492b8.camel@ndufresne.ca>
Subject: Re: [PATCH 19/31] staging: bcm2835-camera: Ensure timestamps never
 go backwards.
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Stefan Wahren <wahrenst@gmx.net>, Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Date:   Thu, 27 Jun 2019 16:01:11 -0400
In-Reply-To: <1561661788-22744-20-git-send-email-wahrenst@gmx.net>
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
         <1561661788-22744-20-git-send-email-wahrenst@gmx.net>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-SF32Srt50qYIqOq3jLza"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-SF32Srt50qYIqOq3jLza
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 27 juin 2019 =C3=A0 20:56 +0200, Stefan Wahren a =C3=A9crit :
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
>=20
> There is an awkward situation with H264 header bytes. Currently
> they are returned with a PTS of 0 because they aren't associated
> with a timestamped frame to encode. These are handled by either
> returning the timestamp of the last buffer to have been received,
> or in the case of the first buffer the timestamp taken at
> start_streaming.
> This results in a race where the current frame may have started
> before we take the start time, which results in the first encoded
> frame having an earlier timestamp than the header bytes.
>=20
> Ensure that we never return a negative delta to the user by checking
> against the previous timestamp.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> ---
>  drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.=
c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> index 9967df9..6205793 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> @@ -387,6 +387,11 @@ static void buffer_cb(struct vchiq_mmal_instance *in=
stance,
>  			 ktime_to_ns(dev->capture.kernel_start_ts),
>  			 dev->capture.vc_start_timestamp, pts,
>  			 ktime_to_ns(timestamp));
> +		if (timestamp < dev->capture.last_timestamp) {
> +			v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
> +				 "Negative delta - using last time\n");
> +			timestamp =3D dev->capture.last_timestamp;
> +		}

Instead of that, maybe you could request a minimum number of buffers,
and not let the header buffer go until you have a proper "following
timestamp" to give it. This way you don't need this hack, and you won't
have an off-by-one in timestamps.

>  		buf->vb.vb2_buf.timestamp =3D ktime_to_ns(timestamp);
>  	} else {
>  		if (dev->capture.last_timestamp) {
> --
> 2.7.4
>=20

--=-SF32Srt50qYIqOq3jLza
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXRUghwAKCRBxUwItrAao
HA1iAKCyzh8vUusnUfIKgzx/hlvymYLNSwCgxSxj2SPDEegMp+kNFm//eoQOfv0=
=pCKP
-----END PGP SIGNATURE-----

--=-SF32Srt50qYIqOq3jLza--

