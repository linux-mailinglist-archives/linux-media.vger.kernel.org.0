Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18AC86626C2
	for <lists+linux-media@lfdr.de>; Mon,  9 Jan 2023 14:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236851AbjAINTz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Jan 2023 08:19:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237150AbjAINTQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Jan 2023 08:19:16 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B721A069
        for <linux-media@vger.kernel.org>; Mon,  9 Jan 2023 05:19:14 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pEs3O-0003P1-LO; Mon, 09 Jan 2023 14:19:06 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pEs3O-0005J9-0X; Mon, 09 Jan 2023 14:19:06 +0100
Date:   Mon, 9 Jan 2023 14:19:05 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, kernel@pengutronix.de,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v2 5/5] usb: uvc: use v4l2_fill_fmtdesc instead of open
 coded format name
Message-ID: <20230109131905.GA19093@pengutronix.de>
References: <20221215224514.2344656-1-m.grzeschik@pengutronix.de>
 <20221215224514.2344656-6-m.grzeschik@pengutronix.de>
 <Y6ug9yUIFysMtajx@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
In-Reply-To: <Y6ug9yUIFysMtajx@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Wed, Dec 28, 2022 at 03:50:47AM +0200, Laurent Pinchart wrote:
>On Thu, Dec 15, 2022 at 11:45:14PM +0100, Michael Grzeschik wrote:
>> Since we have the helper function v4l2_fill_fmtdesc, we can use this to
>> get the corresponding descriptive string for the pixelformat and set the
>> compressed flag. This patch is removing the redundant name field in
>> uvc_format_desc and makes use of v4l2_fill_fmtdesc instead.
>
>I really like that.
>
>> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>> Tested-by: Daniel Scally <dan.scally@ideasonboard.com>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>> ---
>> v1 -> v2: - added reviewed and tested tags
>> ---
>>  drivers/media/common/uvc.c             | 37 --------------------------
>>  drivers/media/usb/uvc/uvc_driver.c     |  8 +++++-
>>  drivers/usb/gadget/function/uvc_v4l2.c |  6 +----
>>  include/linux/usb/uvc.h                |  1 -
>>  4 files changed, 8 insertions(+), 44 deletions(-)
>>
>> diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
>> index a9d587490de8d5..ab2637b9b39b2a 100644
>> --- a/drivers/media/common/uvc.c
>> +++ b/drivers/media/common/uvc.c
>> @@ -13,187 +13,150 @@
>>
>>  static const struct uvc_format_desc uvc_fmts[] =3D {
>>  	{
>> -		.name		=3D "YUV 4:2:2 (YUYV)",
>>  		.guid		=3D UVC_GUID_FORMAT_YUY2,
>>  		.fcc		=3D V4L2_PIX_FMT_YUYV,
>>  	},
>>  	{
>> -		.name		=3D "YUV 4:2:2 (YUYV)",
>>  		.guid		=3D UVC_GUID_FORMAT_YUY2_ISIGHT,
>>  		.fcc		=3D V4L2_PIX_FMT_YUYV,
>>  	},
>>  	{
>> -		.name		=3D "YUV 4:2:0 (NV12)",
>>  		.guid		=3D UVC_GUID_FORMAT_NV12,
>>  		.fcc		=3D V4L2_PIX_FMT_NV12,
>>  	},
>>  	{
>> -		.name		=3D "MJPEG",
>>  		.guid		=3D UVC_GUID_FORMAT_MJPEG,
>>  		.fcc		=3D V4L2_PIX_FMT_MJPEG,
>>  	},
>>  	{
>> -		.name		=3D "YVU 4:2:0 (YV12)",
>>  		.guid		=3D UVC_GUID_FORMAT_YV12,
>>  		.fcc		=3D V4L2_PIX_FMT_YVU420,
>>  	},
>>  	{
>> -		.name		=3D "YUV 4:2:0 (I420)",
>>  		.guid		=3D UVC_GUID_FORMAT_I420,
>>  		.fcc		=3D V4L2_PIX_FMT_YUV420,
>>  	},
>>  	{
>> -		.name		=3D "YUV 4:2:0 (M420)",
>>  		.guid		=3D UVC_GUID_FORMAT_M420,
>>  		.fcc		=3D V4L2_PIX_FMT_M420,
>>  	},
>>  	{
>> -		.name		=3D "YUV 4:2:2 (UYVY)",
>>  		.guid		=3D UVC_GUID_FORMAT_UYVY,
>>  		.fcc		=3D V4L2_PIX_FMT_UYVY,
>>  	},
>>  	{
>> -		.name		=3D "Greyscale 8-bit (Y800)",
>>  		.guid		=3D UVC_GUID_FORMAT_Y800,
>>  		.fcc		=3D V4L2_PIX_FMT_GREY,
>>  	},
>>  	{
>> -		.name		=3D "Greyscale 8-bit (Y8  )",
>>  		.guid		=3D UVC_GUID_FORMAT_Y8,
>>  		.fcc		=3D V4L2_PIX_FMT_GREY,
>>  	},
>>  	{
>> -		.name		=3D "Greyscale 8-bit (D3DFMT_L8)",
>>  		.guid		=3D UVC_GUID_FORMAT_D3DFMT_L8,
>>  		.fcc		=3D V4L2_PIX_FMT_GREY,
>>  	},
>>  	{
>> -		.name		=3D "IR 8-bit (L8_IR)",
>>  		.guid		=3D UVC_GUID_FORMAT_KSMEDIA_L8_IR,
>>  		.fcc		=3D V4L2_PIX_FMT_GREY,
>>  	},
>>  	{
>> -		.name		=3D "Greyscale 10-bit (Y10 )",
>>  		.guid		=3D UVC_GUID_FORMAT_Y10,
>>  		.fcc		=3D V4L2_PIX_FMT_Y10,
>>  	},
>>  	{
>> -		.name		=3D "Greyscale 12-bit (Y12 )",
>>  		.guid		=3D UVC_GUID_FORMAT_Y12,
>>  		.fcc		=3D V4L2_PIX_FMT_Y12,
>>  	},
>>  	{
>> -		.name		=3D "Greyscale 16-bit (Y16 )",
>>  		.guid		=3D UVC_GUID_FORMAT_Y16,
>>  		.fcc		=3D V4L2_PIX_FMT_Y16,
>>  	},
>>  	{
>> -		.name		=3D "BGGR Bayer (BY8 )",
>>  		.guid		=3D UVC_GUID_FORMAT_BY8,
>>  		.fcc		=3D V4L2_PIX_FMT_SBGGR8,
>>  	},
>>  	{
>> -		.name		=3D "BGGR Bayer (BA81)",
>>  		.guid		=3D UVC_GUID_FORMAT_BA81,
>>  		.fcc		=3D V4L2_PIX_FMT_SBGGR8,
>>  	},
>>  	{
>> -		.name		=3D "GBRG Bayer (GBRG)",
>>  		.guid		=3D UVC_GUID_FORMAT_GBRG,
>>  		.fcc		=3D V4L2_PIX_FMT_SGBRG8,
>>  	},
>>  	{
>> -		.name		=3D "GRBG Bayer (GRBG)",
>>  		.guid		=3D UVC_GUID_FORMAT_GRBG,
>>  		.fcc		=3D V4L2_PIX_FMT_SGRBG8,
>>  	},
>>  	{
>> -		.name		=3D "RGGB Bayer (RGGB)",
>>  		.guid		=3D UVC_GUID_FORMAT_RGGB,
>>  		.fcc		=3D V4L2_PIX_FMT_SRGGB8,
>>  	},
>>  	{
>> -		.name		=3D "RGB565",
>>  		.guid		=3D UVC_GUID_FORMAT_RGBP,
>>  		.fcc		=3D V4L2_PIX_FMT_RGB565,
>>  	},
>>  	{
>> -		.name		=3D "BGR 8:8:8 (BGR3)",
>>  		.guid		=3D UVC_GUID_FORMAT_BGR3,
>>  		.fcc		=3D V4L2_PIX_FMT_BGR24,
>>  	},
>>  	{
>> -		.name		=3D "H.264",
>>  		.guid		=3D UVC_GUID_FORMAT_H264,
>>  		.fcc		=3D V4L2_PIX_FMT_H264,
>>  	},
>>  	{
>> -		.name		=3D "H.265",
>>  		.guid		=3D UVC_GUID_FORMAT_H265,
>>  		.fcc		=3D V4L2_PIX_FMT_HEVC,
>>  	},
>>  	{
>> -		.name		=3D "Greyscale 8 L/R (Y8I)",
>>  		.guid		=3D UVC_GUID_FORMAT_Y8I,
>>  		.fcc		=3D V4L2_PIX_FMT_Y8I,
>>  	},
>>  	{
>> -		.name		=3D "Greyscale 12 L/R (Y12I)",
>>  		.guid		=3D UVC_GUID_FORMAT_Y12I,
>>  		.fcc		=3D V4L2_PIX_FMT_Y12I,
>>  	},
>>  	{
>> -		.name		=3D "Depth data 16-bit (Z16)",
>>  		.guid		=3D UVC_GUID_FORMAT_Z16,
>>  		.fcc		=3D V4L2_PIX_FMT_Z16,
>>  	},
>>  	{
>> -		.name		=3D "Bayer 10-bit (SRGGB10P)",
>>  		.guid		=3D UVC_GUID_FORMAT_RW10,
>>  		.fcc		=3D V4L2_PIX_FMT_SRGGB10P,
>>  	},
>>  	{
>> -		.name		=3D "Bayer 16-bit (SBGGR16)",
>>  		.guid		=3D UVC_GUID_FORMAT_BG16,
>>  		.fcc		=3D V4L2_PIX_FMT_SBGGR16,
>>  	},
>>  	{
>> -		.name		=3D "Bayer 16-bit (SGBRG16)",
>>  		.guid		=3D UVC_GUID_FORMAT_GB16,
>>  		.fcc		=3D V4L2_PIX_FMT_SGBRG16,
>>  	},
>>  	{
>> -		.name		=3D "Bayer 16-bit (SRGGB16)",
>>  		.guid		=3D UVC_GUID_FORMAT_RG16,
>>  		.fcc		=3D V4L2_PIX_FMT_SRGGB16,
>>  	},
>>  	{
>> -		.name		=3D "Bayer 16-bit (SGRBG16)",
>>  		.guid		=3D UVC_GUID_FORMAT_GR16,
>>  		.fcc		=3D V4L2_PIX_FMT_SGRBG16,
>>  	},
>>  	{
>> -		.name		=3D "Depth data 16-bit (Z16)",
>>  		.guid		=3D UVC_GUID_FORMAT_INVZ,
>>  		.fcc		=3D V4L2_PIX_FMT_Z16,
>>  	},
>>  	{
>> -		.name		=3D "Greyscale 10-bit (Y10 )",
>>  		.guid		=3D UVC_GUID_FORMAT_INVI,
>>  		.fcc		=3D V4L2_PIX_FMT_Y10,
>>  	},
>>  	{
>> -		.name		=3D "IR:Depth 26-bit (INZI)",
>>  		.guid		=3D UVC_GUID_FORMAT_INZI,
>>  		.fcc		=3D V4L2_PIX_FMT_INZI,
>>  	},
>>  	{
>> -		.name		=3D "4-bit Depth Confidence (Packed)",
>>  		.guid		=3D UVC_GUID_FORMAT_CNF4,
>>  		.fcc		=3D V4L2_PIX_FMT_CNF4,
>>  	},
>>  	{
>> -		.name		=3D "HEVC",
>>  		.guid		=3D UVC_GUID_FORMAT_HEVC,
>>  		.fcc		=3D V4L2_PIX_FMT_HEVC,
>>  	},
>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/=
uvc_driver.c
>> index 12b6ad0966d94a..af92e730bde7c7 100644
>> --- a/drivers/media/usb/uvc/uvc_driver.c
>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>> @@ -251,7 +251,13 @@ static int uvc_parse_format(struct uvc_device *dev,
>>  		fmtdesc =3D uvc_format_by_guid(&buffer[5]);
>>
>>  		if (fmtdesc !=3D NULL) {
>> -			strscpy(format->name, fmtdesc->name,
>> +			struct v4l2_fmtdesc fmt;
>> +
>> +			fmt.pixelformat =3D fmtdesc->fcc;
>> +
>> +			v4l2_fill_fmtdesc(&fmt);
>> +
>> +			strscpy(format->name, fmt.description,
>>  				sizeof(format->name));
>>  			format->fcc =3D fmtdesc->fcc;
>>  		} else {
>
>I've just sent "[PATCH v1] media: uvcvideo: Remove format descriptions"
>which drops usage of the name in the uvcvideo driver without having to
>call v4l2_fill_fmtdesc(). With that merged, changes to uvc_driver.c can
>be dropped in this patch.

Right.

>
>> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget=
/function/uvc_v4l2.c
>> index 21e573e628f4e7..6e46fa1695f212 100644
>> --- a/drivers/usb/gadget/function/uvc_v4l2.c
>> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
>> @@ -374,14 +374,10 @@ uvc_v4l2_enum_format(struct file *file, void *fh, =
struct v4l2_fmtdesc *f)
>>  	if (!uformat)
>>  		return -EINVAL;
>>
>> -	if (uformat->type !=3D UVCG_UNCOMPRESSED)
>> -		f->flags |=3D V4L2_FMT_FLAG_COMPRESSED;
>> -
>>  	fmtdesc =3D to_uvc_format(uformat);
>>  	f->pixelformat =3D fmtdesc->fcc;
>>
>> -	strscpy(f->description, fmtdesc->name, sizeof(f->description));
>> -	f->description[strlen(fmtdesc->name) - 1] =3D 0;
>> +	v4l2_fill_fmtdesc(f);
>
>
>v4l_fill_fmtdesc() is actually called by v4l_enum_fmt() after calling
>the driver's .vidioc_enum_fmt_vid_out() operation, so you don't have to
>call it manually here.
>
>By dropping the manual calls to v4l_fill_fmtdesc(), you can also drop
>patch 4/5 in the series.

This is a good point. I have dropped patch 4/5 in the stack.

>This creates a dependency between the patch I've just sent and this
>series. As I don't want to introduce any further delay, I'll create a
>stable branch based on v6.2-rc1 as soon as my patch gets reviewed, you
>you can then base the next version of this series on top of it. An
>alternative would be to merge this series through the media tree if Greg
>is OK with that.

I found your v3 patch. I sure can rebase my work on your patch if your
stable branch is available.

>>  	return 0;
>>  }
>> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
>> index 227a03f252a5c0..e407a7b8a91c70 100644
>> --- a/include/linux/usb/uvc.h
>> +++ b/include/linux/usb/uvc.h
>> @@ -146,7 +146,6 @@
>>  	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>>
>>  struct uvc_format_desc {
>> -	char *name;
>>  	u8 guid[16];
>>  	u32 fcc;
>>  };
>
>--=20
>Regards,
>
>Laurent Pinchart
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmO8FEcACgkQC+njFXoe
LGRjKBAAjPydgpJ+LBIyft6V0cb3jINh43VyMhmyIh4RpfbxinSXEqoMr4KhFmCw
un2ku7Igo8kxCFjG4BsdxkxFE6X4SBKbNfiXa4ezE7KR1lEQ/5DR1t8vuBGSxUaX
Ua/3mlk1ZR0EOAdIrS2zwRTsQseebgQKHgy9vVQbdle5dnFJce0Dfs3siTA6ZXFT
/dKgCEszP6OIYUWHdPJ0ygDPWnJmWe9Sp5/CtQ7ZqaFOTbr8xHasC7v1WBBC5hSF
v4YIF5uc8c5+JAYKqtCfTpuY+kEa8BZMcY3qihUYvddIXcH7PAGbIDluPC8o9ev9
BIJ5/pCgBfS8jZwbGyBfslBNJgCv5vGceuUa+Hs/TVxkdaTxjhK1m1dl8CW9kRtX
8hmqo8j1t2iZD9Cc/4qH7nXTYEzt/9T1Jr55MorirNhATMQj5ASLvEDvTUei3iF0
0heBtunYaCIBQKtKIm53sPXCpTKpM0HfBfJBa7CiFpVKN+6f1Kwr8roXWlB6rh1A
TVh9JXc4X8esurrSlIn/QNKAUjHApICvnih6YpSe39ehLxbu2iYXj8LjvzGTis8h
E/7bSZM90boIXscefQNE7bF1Oz+xmYQNTnIjscZcJnLjpRde4L8ufxV2m5+XkMUz
dM9AFvJNv/Ez1fgp99D4Knx8I/f0A42BGnN+jU9MRiCDAE6xGfM=
=PR4X
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
