Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9C35EA3F
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 19:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbfGCRSr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 13:18:47 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:41823 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfGCRSr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 13:18:47 -0400
Received: by mail-qt1-f193.google.com with SMTP id d17so3137858qtj.8
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 10:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=qUvA/m6OUFOLq2uiuT3HOYnURP41G0wT90bpZ6vQiFw=;
        b=wq+lfpvA98/S+tJ2LOfg/paSnbIF+19iGhdeY7iFWPxYkgCg8LstN/dZ1evw5gDJws
         5uXOdcwS+k4KXspIBKq25GOQoW11CmFR3JEWwkTqRWgNMPODJgTI98wHNHZr8VqHRmFW
         /3zyT0rugFomeHwApEQLHi9aCDGzYglKsBHKKTAoat+AGvCNXTbWmx3DfD7/2Hn2I/VH
         co+mn8nR1sdT25zRau2z9ine2Hr6z535m+QDER0//ac1jkMKSK7LvHdYBW2GHO22Y8SF
         IxL03moRRpjLp6BE8VXUUeX4tanhXrlRp78uefmT6HRCAhznbIqhmOsDuKV23WVQk+9B
         pIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=qUvA/m6OUFOLq2uiuT3HOYnURP41G0wT90bpZ6vQiFw=;
        b=SFX4Al/oXmlq8jImbiOvzfKa878jkERpOmzXIoAj6nK5bpb06JQfHkrkI+gY+FqjWs
         YpN9/28yyBqVq9YsxOBRBLGZgaPPnrk+LfCbICS6ptROa+HjHDaA5dg38f/cvCTOQRNB
         R7ZH2aydcyFsdvYczNopyjVTQjZGQoJ2Ye4lfH5mBZtJCOdUhGihdiRAKjUmn2izG/lT
         VaJEVx+VOGByhYW4igO2IpQabDKbWDpG2wT/zhclVnyQZOgzEK7Bqc5MiW6k3Po2VxL4
         FCDRTxaALdSWHqichDT6lglZxZNFwXqSICAwug7dNSY16Pv1UW+HhuAsPi9Z+DeXZATh
         z5Hg==
X-Gm-Message-State: APjAAAXpSOzSPVMw/iTaj8CjzeHHsPRK8RSJYIyaYgktuIxt57klswPq
        Ja1eF9m76eUym5VN0Ya+K01UHA==
X-Google-Smtp-Source: APXvYqzyPDni8cjb0Wd0zNmX3VR1bckQ+6blkQp/JxEwlG2vzPx81kfk83BLceBUBlOEJm1ZOL8aFQ==
X-Received: by 2002:ac8:7b99:: with SMTP id p25mr1643761qtu.243.1562174326773;
        Wed, 03 Jul 2019 10:18:46 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id s127sm1191645qkd.107.2019.07.03.10.18.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 10:18:45 -0700 (PDT)
Message-ID: <26acb51f5d7d9e11ef34f8c2e2c92b1dc0809a00.camel@ndufresne.ca>
Subject: Re: [PATCH v3 3/3] media: uapi: h264: Get rid of the p0/b0/b1
 ref-lists
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Wed, 03 Jul 2019 13:18:43 -0400
In-Reply-To: <20190703122849.6316-4-boris.brezillon@collabora.com>
References: <20190703122849.6316-1-boris.brezillon@collabora.com>
         <20190703122849.6316-4-boris.brezillon@collabora.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-whJY3ntvBEAboUEfZT+y"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-whJY3ntvBEAboUEfZT+y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 juillet 2019 =C3=A0 14:28 +0200, Boris Brezillon a =C3=A9cri=
t :
> Those lists can be extracted from the dpb, let's simplify userspace
> life and build that list kernel-side (generic helpers will be provided
> for drivers that need this list).
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Those only existed for Rockchip/Hantro anyway.

Reviewed-by: Nicolas Dufresne <nicolas=C2=AD.dufresne@collabora.com>

> ---
> Changes in v3:
> * None
>=20
> Changes in v2:
> * None
> ---
>  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 9 ---------
>  1 file changed, 9 deletions(-)
>=20
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documenta=
tion/media/uapi/v4l/ext-ctrls-codec.rst
> index 47ba2d057a92..237c8e8e6bca 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> @@ -1946,15 +1946,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type=
 -
>      * - __u16
>        - ``nal_ref_idc``
>        - NAL reference ID value coming from the NAL Unit header
> -    * - __u8
> -      - ``ref_pic_list_p0[32]``
> -      - Backward reference list used by P-frames in the original bitstre=
am order
> -    * - __u8
> -      - ``ref_pic_list_b0[32]``
> -      - Backward reference list used by B-frames in the original bitstre=
am order
> -    * - __u8
> -      - ``ref_pic_list_b1[32]``
> -      - Forward reference list used by B-frames in the original bitstrea=
m order
>      * - __s32
>        - ``top_field_order_cnt``
>        - Picture Order Count for the coded top field

--=-whJY3ntvBEAboUEfZT+y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXRzjcwAKCRBxUwItrAao
HIZZAJ9P1PInxkRinNQdMkSqCImlg3fotgCgxmew/igxVjrAkWqHb5jyGVvaQh8=
=n//l
-----END PGP SIGNATURE-----

--=-whJY3ntvBEAboUEfZT+y--

