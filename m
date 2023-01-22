Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BECD0676CE2
	for <lists+linux-media@lfdr.de>; Sun, 22 Jan 2023 13:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbjAVM2X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Jan 2023 07:28:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbjAVM2W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Jan 2023 07:28:22 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9665E12873
        for <linux-media@vger.kernel.org>; Sun, 22 Jan 2023 04:28:20 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pJZSL-00062f-0I; Sun, 22 Jan 2023 13:28:17 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pJZSJ-0008LC-Gz; Sun, 22 Jan 2023 13:28:15 +0100
Date:   Sun, 22 Jan 2023 13:28:15 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        William Manley <will@williammanley.net>
Subject: Re: [PATCH v2] media: uvcvideo: Add GUID for BGRA/X 8:8:8:8
Message-ID: <20230122122815.GA20761@pengutronix.de>
References: <20230116094032.4389-1-marex@denx.de>
 <Y8Uq2EtsYi9kmdqw@pendragon.ideasonboard.com>
 <CANiDSCtniqdwr7oqvcMfH9sKYMuTX7jyAA9P9ZeCFhEGq8Rnqw@mail.gmail.com>
 <Y8VdpQGcqmoKESk8@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <Y8VdpQGcqmoKESk8@pendragon.ideasonboard.com>
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
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Mon, Jan 16, 2023 at 04:22:29PM +0200, Laurent Pinchart wrote:
>On Mon, Jan 16, 2023 at 02:20:40PM +0100, Ricardo Ribalda wrote:
>> Hi Marek!!!
>>
>> Why do they call MEDIASUBTYPE_RGB32 something that is BRG ? !
>>
>> Why do WE call XBGR something that is BGRX? !!
>>
>> Besides our insanity, your patch looks sane. Thanks for it :)
>>
>> There are some patches on the queue to remove the format definitions,
>> so your patch might not apply cleanly, I guess Laurent will take care
>> of it
>
>Ricardo meant [5].
>
>Michael, I'm waiting for Mauro to merge the uvcvideo pull request for
>v6.3 ([6]). Once done, you can use that as a base branch for your
>series, and send a pull request to Greg. Could you include Marek's
>patch, either at the bottom or the top of your series ? Alternatively I
>can send a v4 of the uvcvideo pull request with this patch included if
>you prefer.
>
>[5] https://lore.kernel.org/linux-media/20221215224514.2344656-1-m.grzesch=
ik@pengutronix.de/
>[6] https://lore.kernel.org/linux-media/Y8R0yfSL+1BNi%2Ff3@pendragon.ideas=
onboard.com/

I sure will pick up this patch and create a pull request for my series.

Thanks.

>> On Mon, 16 Jan 2023 at 11:50, Laurent Pinchart wrote:
>> > On Mon, Jan 16, 2023 at 10:40:32AM +0100, Marek Vasut wrote:
>> > > The Cypress EZUSB FX3 UVC example can be configured to report pixel
>> > > format "e436eb7e-524f-11ce-9f53-0020af0ba770". This is its GUID for
>> > > BGRA/X 8:8:8:8.
>> > >
>> > > The UVC 1.5 spec [1] only defines GUIDs for YUY2, NV12, M420 and I42=
0.
>> > > This seems to be an extension documented in the Microsoft Windows Me=
dia
>> > > Format SDK[2]. This Media Format SDK defines this GUID as correspond=
ing
>> > > to `MEDIASUBTYPE_RGB32`, which is confirmed by [4] as `MEDIASUBTYPE_=
ARGB32`
>> > > has different GUID.
>> > >
>> > > Note that in my case, the FX3 UVC can output either channel order,
>> > > BGR or RGB or any other mix for that matter. Since Linux commit
>> > > 1b8dc32286a1a ("[media] uvcvideo: Add GUID for BGR 8:8:8")
>> > > defined a GUID for `MEDIASUBTYPE_RGB24` channel order as BGR, keep
>> > > this change consistent and define `MEDIASUBTYPE_RGB32` as BGR as wel=
l.
>> > > Document [3] also indicates the channel order is BGR.
>> > >
>> > > [1] https://www.usb.org/document-library/video-class-v15-document-set
>> > > [2] https://learn.microsoft.com/en-us/windows/win32/wmformat/media-t=
ype-identifiers
>> > > [3] https://learn.microsoft.com/en-us/windows/win32/directshow/uncom=
pressed-rgb-video-subtypes
>> > > [4] https://gix.github.io/media-types/
>> > >
>> > > Signed-off-by: Marek Vasut <marex@denx.de>
>> >
>> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> Reviewed-by: Ricardo Ribalda <ricardo@ribalda.com>
>>
>> > > ---
>> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> > > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> > > Cc: William Manley <will@williammanley.net>
>> > > ---
>> > > V2: - Reference document [3] confirming BGR channel order
>> > >     - Reference document [4] describing MEDIASUBTYPE_ARGB32 with dif=
ferent GUID
>> > >     - Use V4L2_PIX_FMT_XBGR32 instead of V4L2_PIX_FMT_BGR32 which is=
 deprecated
>> > > ---
>> > >  include/media/v4l2-uvc.h | 8 ++++++++
>> > >  1 file changed, 8 insertions(+)
>> > >
>> > > diff --git a/include/media/v4l2-uvc.h b/include/media/v4l2-uvc.h
>> > > index f83e31661333b..b010a36fc1d95 100644
>> > > --- a/include/media/v4l2-uvc.h
>> > > +++ b/include/media/v4l2-uvc.h
>> > > @@ -99,6 +99,9 @@
>> > >  #define UVC_GUID_FORMAT_BGR3 \
>> > >       { 0x7d, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
>> > >        0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
>> > > +#define UVC_GUID_FORMAT_BGR4 \
>> > > +     { 0x7e, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
>> > > +      0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
>> > >  #define UVC_GUID_FORMAT_M420 \
>> > >       { 'M',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
>> > >        0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>> > > @@ -266,6 +269,11 @@ static struct uvc_format_desc uvc_fmts[] =3D {
>> > >               .guid           =3D UVC_GUID_FORMAT_BGR3,
>> > >               .fcc            =3D V4L2_PIX_FMT_BGR24,
>> > >       },
>> > > +     {
>> > > +             .name           =3D "BGRA/X 8:8:8:8 (BGR4)",
>> > > +             .guid           =3D UVC_GUID_FORMAT_BGR4,
>> > > +             .fcc            =3D V4L2_PIX_FMT_XBGR32,
>> > > +     },
>> > >       {
>> > >               .name           =3D "H.264",
>> > >               .guid           =3D UVC_GUID_FORMAT_H264,
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

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmPNK9sACgkQC+njFXoe
LGSB3RAAgcFdtj1P9pF2O1A+xrai0PXuc/OJrcvvgVZnlzl8IC7gzmmBg5cqCH3Z
YJ0zMPc5e8cGl+1lK7QpgYkxeJicJNYrrN56M/0EvdpEGZBDUCSh/j0ApYwBdLeT
+7dtcJvVaEknmvIY3cTuCg7BTvPKoMSq8vcjDmIA0+cYHiwS2QQ9qBWkT40qnRmK
Ee3UpCk7Q7+rFUY2sA3tIdtwXpHo3/qt9ZxPvzKQErawrgQT0DhqeNDRjXWtg/gW
FTRC6HR7o9CpFypRqOut2ylzs+4HpztofblLhnOsh4dxrfNx6K/tnhYl4qyj5JeY
fbAp7FdKu72wk5OBjfgb/5JGq7AODsKw7KdbgRVdIMldoyU2tnHxjKXXeYyoTsQZ
WxCX1TGC65J+m9BZFdt8OlBbxbf0+quTaSAbjD0lCuXRM8Do9nS6chdyZ/ld8Ad+
pJM6UlhpndZ041CdPjnJdL0DANnFQ2yKPk8rLp1iZpcE5RQi3eclTw49jLXeOza4
2zirFQTctjm8V1lTtoI+BN1dk8PebG9E1iNETpMBLkrlbn0fA1dZpkKGM2TZxhCU
AV9WfZxgtgGxt7jjbmnOqEhQ626xsrPNHgKCZ3aBhVvIKkRuj5U0Ds9CGZA7+U2v
GTxs/VH5pp6BQt1QsBtfun/65vV6XnLjj1AuPjk0pW5KHAF0Mak=
=/mrg
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
