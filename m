Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE1187046D3
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 09:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbjEPHrG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 03:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbjEPHrF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 03:47:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7265C30F3
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 00:47:03 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F394DFB;
        Tue, 16 May 2023 09:46:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1684223210;
        bh=fR7cJlC88xq5Y7AiRo5u4PlMVymvPc3FoU4IOrmZmlc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G06byGP5wTgfIVnETgwHEyb+VKlo66Khlr+k2yB01xpHFQ2V01pvx9tUItXSwFXwG
         WAwA9cOVhQYQDe2tf1oh0KlEsfaDseVrXKToQq4RTzBJj7461uH0wK/y203pWDvslZ
         vdROp5Tyykc0jKaYYubNroqkvJJCIusuWiBJmKCk=
Date:   Tue, 16 May 2023 09:46:57 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Jai Luthra <j-luthra@ti.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        "Guoniu . zhou" <guoniu.zhou@nxp.com>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, mchehab@kernel.org
Subject: Re: [PATCH 0/2] media: ov5640: drive-by frame_interval cleanups
Message-ID: <20230516074653.pf6kg3ebvrqvdnbv@lati>
References: <20230505071619.63229-1-jacopo.mondi@ideasonboard.com>
 <52b0df19-ed9e-14cc-f9ab-e4a1d453524a@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yoiex3hgc56scxbr"
Content-Disposition: inline
In-Reply-To: <52b0df19-ed9e-14cc-f9ab-e4a1d453524a@ti.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--yoiex3hgc56scxbr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Subject: Re: [PATCH 0/2] media: ov5640: drive-by frame_interval cleanups
MIME-Version: 1.0

Hi Jai,
   thanks for testing

On Mon, May 15, 2023 at 05:25:55PM +0530, Jai Luthra wrote:
> Hi Jacopo, Guoniu,
>
> On 05/05/23 12:46, Jacopo Mondi wrote:
> > While looking at Guoniu Zhou patches I noticed that there were a few cleanups
> > related to the usage of frame_interval fileds for MIPI CSI-2 framerate
> > calculations.
> >
> > No functional changes intended, just cleanups.
> >
> > Guoniu: could you please test these on your setup as well ? A tested-by tag
> > would be useful!
> >
>
> Thanks for the latest fixes!
>
> Testing on my setup (CSI module w/ 2 lanes), I notice two weird issues and
> wonder if you see the same behavior on your setups?
>
> Issue 1
> -------
>
> On a fresh boot the sensor streams at 60fps, and checking link_freq from
> v4l2-ctl I get 384Mhz. But G_FRAME_INTERVAL returns 30FPS when using
> `media-ctl -p`:
> [stream:0 fmt:UYVY8_1X16/640x480@1/30]

the g/s_frame_interval calls are not relevant for MIPI CSI-2

I wonder if we should/could return -EINVAL in this case


>
> Issue 2
> -------
>
> If I manually set the frame interval to @1/60 using media-ctl, and then
> stream it - actual framerate gets reduced to 30FPS:

Ah this shouldn't happen. s_frame_interval -should not- modify the
timings on a CSI-2 setup

If not returning -EINVAL, we should at least return immediately

>
> root@am62xx-evm:~# yavta -s 640x480 -f UYVY /dev/video0 -c5
> ....
> 0 (0) [-] any 0 614400 B 401.488754 401.488855 12.719 fps ts mono/EoF
> 1 (1) [-] any 1 614400 B 401.522057 401.522147 30.027 fps ts mono/EoF
> 2 (2) [-] any 2 614400 B 401.555434 401.555584 29.961 fps ts mono/EoF
> 3 (3) [-] any 3 614400 B 401.588723 401.588814 30.040 fps ts mono/EoF
> 4 (4) [-] any 4 614400 B 401.622051 401.622135 30.005 fps ts mono/EoF
> Captured 5 frames in 0.212005 seconds (23.584252 fps, 14490164.140730 B/s).
> 8 buffers released.
>
> After setting frame interval to @1/60, the link-frequency got reduced to
> 192Mhz, which probably explains the low framerate.
>
> root@am62xx-evm:~# v4l2-ctl -d /dev/v4l-subdev2 -C link_frequency
> link_frequency: 19 (192000000 0xb71b000)
>
> I will take a deeper look at update_pixel_rate() function to try and fix
> this - but wanted to confirm if this also happens on your CSI sensors?
>
> I also repeated same tests without this series and still saw both issues. In
> fact Issue 2 was worse because the sensor did not stream *at all* if I
> changed frame interval to @1/60. My guess is PATCH 2/2 fixes that by not
> updating the VBLANK using the DVP values.

Probably yes, and this confirms to me that we should return early in
s_frame_interval if we're CSI-2 (or if this doesn't contradict the
specification even return an error).

Thanks
   j

>
> For the series:
>
> Tested-by: Jai Luthra <j-luthra@ti.com>
>
> Thanks,
> Jai
>
> > Thanks
> >    j
> >
> > Jacopo Mondi (2):
> >    media: ov5640: Remove unused 'framerate' parameter
> >    media: ov5640: Drop dead code using frame_interval
> >
> >   drivers/media/i2c/ov5640.c | 17 +----------------
> >   1 file changed, 1 insertion(+), 16 deletions(-)
> >
> > --
> > 2.40.1
> >






--yoiex3hgc56scxbr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAmRjNPEACgkQcjQGjxah
Vjy8eQ//TDcOUeXTFMEM4neP6PBlXT1V7ZazbsvvambJP7z26woa0+p8MALbi37Q
Y5kas7u8BkQK8xyatL7DQIwnZ/9lj5OyvnmqC4Ok4/hY+Mv2gzK1KritGWNg/PnI
2Smjpr+U+F5tEYKVr8dlzJlkU7j6m7cZxP8g3+zY/WhXXIQrWuqYWZcBiD/58rRl
AMzzs8bm+XUCJGSIPdiPjNEspTowkeax0PLHEjUWtohKS1Q4NvywZRDLmOqcNgiy
BeMfrft+dNxff9SuB4eLSJ4YIBLOhmyu+i1k6r1Ykmpr+flzqNLT3R2njpQcE1fa
jRBILoNfSKlN4Ph1bTx7/XZhAiX2Eab6t/kLV53MpIRQudFSe3x8eX2BwCiFSa+0
Yrd2AhDpIQFfdqWDjulaEeg4eHXL4gidQOCpYeZqgMQ6z4viQzRX3u178JkDNPFg
J4BCkqJJswNLgNp0Lbw945qPxQfk8lKE1/xW89YUaPuUEK4EzSWo9sKkJtMOLxAg
bJZRfngcnzXJOOTvN8yYP/Jj2Qe8EqmgtLqqthUaekzjPcNFdOHTDF2fICzb+y+q
XjcgaZol28ZuoGrxHo1dBKmOfWkCEzvDgiczCmEkP8nGvvEa0pw9IJAfHHGvBIQ+
f3MoFpTyqtPJ5TFlMo23tEAES0jfF0lrYT5R4TfdvadBXkkxg3w=
=4UNY
-----END PGP SIGNATURE-----

--yoiex3hgc56scxbr--
