Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2A45669F
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 12:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfFZKYU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 06:24:20 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:44957 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbfFZKYT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 06:24:19 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 8E70A1C0002;
        Wed, 26 Jun 2019 10:24:10 +0000 (UTC)
Date:   Wed, 26 Jun 2019 12:25:26 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 12/16] sh_veu/sh_vou: set device_caps in struct
 video_device
Message-ID: <20190626102526.yusnuvc2plxwmbt3@uno.localdomain>
References: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
 <20190626074421.38739-13-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bucolxejzuowgef2"
Content-Disposition: inline
In-Reply-To: <20190626074421.38739-13-hverkuil-cisco@xs4all.nl>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--bucolxejzuowgef2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

iHi Hans,

On Wed, Jun 26, 2019 at 09:44:17AM +0200, Hans Verkuil wrote:
> Instead of filling in the struct v4l2_capability device_caps
> field, fill in the struct video_device device_caps field.
>
> That way the V4L2 core knows what the capabilities of the
> video device are.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Jacopo Mondi <jacopo@jmondi.org>

Thanks for doing this.

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

> ---
>  drivers/media/platform/sh_veu.c | 4 +---
>  drivers/media/platform/sh_vou.c | 5 ++---
>  2 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/sh_veu.c b/drivers/media/platform/sh_veu.c
> index 5a9ba05c996e..ab39d6c80920 100644
> --- a/drivers/media/platform/sh_veu.c
> +++ b/drivers/media/platform/sh_veu.c
> @@ -348,9 +348,6 @@ static int sh_veu_querycap(struct file *file, void *priv,
>  	strscpy(cap->driver, "sh-veu", sizeof(cap->driver));
>  	strscpy(cap->card, "sh-mobile VEU", sizeof(cap->card));
>  	strscpy(cap->bus_info, "platform:sh-veu", sizeof(cap->bus_info));
> -	cap->device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
> -	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
> -
>  	return 0;
>  }
>
> @@ -1039,6 +1036,7 @@ static const struct video_device sh_veu_videodev = {
>  	.minor		= -1,
>  	.release	= video_device_release_empty,
>  	.vfl_dir	= VFL_DIR_M2M,
> +	.device_caps	= V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING,
>  };
>
>  static const struct v4l2_m2m_ops sh_veu_m2m_ops = {
> diff --git a/drivers/media/platform/sh_vou.c b/drivers/media/platform/sh_vou.c
> index 5799aa4b9323..1fe573a90f0d 100644
> --- a/drivers/media/platform/sh_vou.c
> +++ b/drivers/media/platform/sh_vou.c
> @@ -381,9 +381,6 @@ static int sh_vou_querycap(struct file *file, void  *priv,
>  	strscpy(cap->card, "SuperH VOU", sizeof(cap->card));
>  	strscpy(cap->driver, "sh-vou", sizeof(cap->driver));
>  	strscpy(cap->bus_info, "platform:sh-vou", sizeof(cap->bus_info));
> -	cap->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_READWRITE |
> -			   V4L2_CAP_STREAMING;
> -	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
>  	return 0;
>  }
>
> @@ -1218,6 +1215,8 @@ static const struct video_device sh_vou_video_template = {
>  	.ioctl_ops	= &sh_vou_ioctl_ops,
>  	.tvnorms	= V4L2_STD_525_60, /* PAL only supported in 8-bit non-bt656 mode */
>  	.vfl_dir	= VFL_DIR_TX,
> +	.device_caps	= V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_READWRITE |
> +			  V4L2_CAP_STREAMING,
>  };
>
>  static int sh_vou_probe(struct platform_device *pdev)
> --
> 2.20.1
>

--bucolxejzuowgef2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0TSBYACgkQcjQGjxah
VjygcQ//R+YsJo49gWcXmwVXZibjcO1WA6PVmNFsrgB8o0nUYf8F0ePSgYKdvIcI
s0lMHRFWJgxm87QxXNEwSvEbOulm84ZQxXyGErUrl0Z2MT4CnuRhwvVAsd7+nmss
jlfOdNker7RvuH1pyyZS1RM7ua21aFagymRQBeKfr/lEz+XVe2n+9+1cof1WAm98
Iytkc6EitHWlG4efD3jcfRUiEAXgN9YhzaBtrZlUjAawYmFCltIURMAQ6X8HsOQH
2S+9NyyQx3pCzwcaUpyQCHyWQk/7mel1XMOA9WPqNRnwop5bH0dw6CTRLr+KU0QN
qCiIHBD/Fz/+ilTifjn/C3FsVAaiQr95bckyCqsRgXvQYCo7iREcRwF7EJdRpaMe
E4fTD9A8Gd5bmmxAeAl/1DQXetOD1/EZ82NEaL+RdSMwLndh1MSW/tfzGbiESAOA
wXvhDiuSH8p1QNgdwXOSHBTUGuxR1W0PEn5A6Ig+0/LI/mTaDoTWr15EoKIQTlei
0s6kdals12h2r9lmcHAdozwma+fqz8v3RAV++0dYrihfunTyxs6+RQyjjPK93Xia
kZIw999Eg1S+2Ej6l699jNEW2oQXTz9GtH0xU/VwowrKon9G/mTZQo94dOjFUf7p
C41K9ZL4lWzI+MJ5Ube1vMWJOX3JHPipLH5lB/0xQCWSuQ6fbBI=
=nRSL
-----END PGP SIGNATURE-----

--bucolxejzuowgef2--
