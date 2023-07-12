Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66F3F750B58
	for <lists+linux-media@lfdr.de>; Wed, 12 Jul 2023 16:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbjGLOrd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jul 2023 10:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjGLOrc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jul 2023 10:47:32 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 789F31999
        for <linux-media@vger.kernel.org>; Wed, 12 Jul 2023 07:47:30 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0648FF80B;
        Wed, 12 Jul 2023 14:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1689173249;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+1izX+2VvOeWQqc83D70ru8R9aQGV9r5LlNd4XxrCGE=;
        b=pgFD1ZjsRQ8Sn2x/E79KbeCkbTBKitn2BGl6rTv//EISg2D4Zn1dNu1ao66kNHu+WByqmV
        L08n4OgoSs7s9sx1wyEn6UK9phARvKSx/hCqpKRyknrTW8z2u/yuSp8RPxPVyqzLnPhqmM
        AkqGHtwMWPMADscrUpiuXfnr4QY4RgXfQqd85ofEBolbALSTMQZr/oeu5OOYHswiXyEj73
        PxDqWAh+WfTk0SIL2KNL6Aj4AVS939jOSZykzkrqDdESVLMEATYjfBHHY7eLPi3XL+Lt+y
        6atK26u0I/Sl1FTt8fhw4zctom1rO5nnXmbJPyZ4Xe8KRNQNoO8ZoLbsCr5Xog==
Date:   Wed, 12 Jul 2023 16:47:25 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        Martijn Braam <martijn@brixit.nl>, jernej.skrabec@gmail.com,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
        hverkuil@xs4all.nl,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: Re: [REGRESSION] breakage in sun6i-csi media api
Message-ID: <ZK68_SoDU6GQSbh2@aptenodytes>
References: <f13c27fb-2afe-b94e-aad9-ed5ecc818183@brixit.nl>
 <ZHmzZUkcFK8Gq_JL@aptenodytes>
 <e168d246-528d-b615-aa50-af8f17af4442@brixit.nl>
 <ZHm46or-MhTb457b@aptenodytes>
 <20230602100352.GK19463@pendragon.ideasonboard.com>
 <25cf3947-1fe0-7280-09e2-3dc107b2c8e7@leemhuis.info>
 <20230629000837.122abd21@sal.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Wjc1rcjoyyFv9MdK"
Content-Disposition: inline
In-Reply-To: <20230629000837.122abd21@sal.lan>
X-GND-Sasl: paul.kocialkowski@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--Wjc1rcjoyyFv9MdK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for the delayed reply here.

On Thu 29 Jun 23, 00:08, Mauro Carvalho Chehab wrote:
> Em Mon, 26 Jun 2023 14:23:50 +0200
> "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.inf=
o> escreveu:
>=20
> > Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> > for once, to make this easily accessible to everyone.
> >=20
> > Paul, what happened to this? It looks like this fall through the cracks,
> > but maybe I'm missing something, that's why I ask.
>=20
> On a quick look, checking the proposed app fix[1], it sounds to me that
> the application is not prepared to actually use the devices that are
> enumerated, as it is setting only the values that are known.

I totally agree with this, it seems to me that the application just had
hardcoded expectations about what is exposed and did not implement
dynamic enumeration as it should have (thus not following the uAPI).

Hopefully the fix to the application will make it future-proof and we can a=
void
this kind of confusion in the future!

> See, the media controller has the MEDIA_IOC_G_TOPOLOGY ioctl [2], which
> enumerates the entire sub-device topology.
>=20
> The current application was just expecting two sub-devices, failing
> if other devices are added on newer Kernels. This is not how this uAPI is
> supposed to work.
>=20
> [1] https://gitlab.com/postmarketOS/megapixels/-/merge_requests/31/diffs?=
commit_id=3D38bbee084126b15d39c1bce5cb5d45e6efea64fa
> [2] https://gitlab.com/postmarketOS/megapixels/-/blob/master/src/device.c=
#L106
>=20
> Now, I was told during yesterday, during the Media Summit that there are
> new apps since Kernel 6.2 that do require setting the bridge with differe=
nt
> configurations. Paul/Sebastian: is this the case? If so, could you provide
> more details about it?

I am not aware of this, so also interested in details.

> If this is true, it seems too late to revert the changes, as this will
> break other existing applications.
>=20
> IMO, the best here would be to modify the application to be smarter,
> using the topology actually reported by MEDIA_IOC_G_TOPOLOGY, instead
> on relying on some specific hard-coded types.

Absolutely!

Thanks,

Paul

> Regards,
> Mauro
>=20
> >=20
> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> > --
> > Everything you wanna know about Linux kernel regression tracking:
> > https://linux-regtracking.leemhuis.info/about/#tldr
> > If I did something stupid, please tell me, as explained on that page.
> >=20
> > #regzbot poke
> >=20
> > On 02.06.23 12:03, Laurent Pinchart wrote:
> > > On Fri, Jun 02, 2023 at 11:39:54AM +0200, Paul Kocialkowski wrote: =
=20
> > >> (Re-adding folks from the original email, adding Laurent and Hans.)
> > >> On Fri 02 Jun 23, 11:24, Martijn Braam wrote: =20
> > >>>
> > >>> That's basically it yes. My software doesn't expect the bridge bloc=
k,
> > >>> because it wasn't there. The pipeline always worked "automatically".
> > >>>
> > >>> This is the workaround that's been made now it run on newer kernels:
> > >>> https://gitlab.com/postmarketOS/megapixels/-/merge_requests/31
> > >>>
> > >>> I'm pretty sure format propagation would fix this issue. =20
> > >>
> > >> Okay that's good to know.
> > >>
> > >> To be honest it's still not very clear to me if in-driver format pro=
pagation is
> > >> a "nice to have" feature or something that all media pipeline driver=
s are
> > >> supposed to implement. =20
> > >=20
> > > For MC-based drivers, in-kernel propagation *inside* subdevs is
> > > mandatory, in-kernel propagration *between* subdevs is not allowed. T=
he
> > > latter is the responsibility of userspace.
> > >=20
> > > For traditional (I'd say legacy, but I know not everybody likes that
> > > term :-)) drivers that only expose video device nodes and do not expo=
se
> > > subdev nodes to userspace, the driver is responsible for configuring =
the
> > > full pipeline internally based on the S_FMT call on the video nodes
> > > only. This isn't applicable to the sun6i-csi driver, as it exposes
> > > subdev nodes to userspace.
> > >  =20
> > >> Anyway I feel like this is not really a regression but a result of t=
he driver
> > >> being converted to a newer API.
> > >>
> > >> Also there's a V4L2_CAP_IO_MC flag which should indicate that the vi=
deo device
> > >> must be controlled via the media controller API instead of being
> > >> video-device-centric, but I've seen comments asking not to set the f=
lag even
> > >> when MC is used so I'm a bit confused here. =20
> > >=20
> > > Would you have pointers to those comments ?
> > >  =20
> > >> Perhaps the flag is only required when there is no automatic format
> > >> propagation? =20
> > >=20
> > > The flag is more or less required when you expose subdev nodes to
> > > userspace.
> > >  =20
> > >> If anyone has solid answers on these points I'd be happy to read some
> > >> clarification (and act accordingly).
> > >> =20
> > >>> On 6/2/23 11:16, Paul Kocialkowski wrote: =20
> > >>>> Hi Martijn,
> > >>>>
> > >>>> On Thu 01 Jun 23, 23:19, Martijn Braam wrote: =20
> > >>>>> It seems like this commit:
> > >>>>>
> > >>>>> media: sun6i-csi: Add bridge v4l2 subdev with port management
> > >>>>>
> > >>>>> Has changed the way the media pipeline on a64 devices, in my case=
 the PINE64
> > >>>>> PinePhone works. Since this is an API towards userspace and there=
's active
> > >>>>> applications that use it I think this counts as a regression. =20
> > >>>> Do you have more details on what changed specifically?
> > >>>>
> > >>>> The commit added a bridge subdev in addition to the video node, wh=
ich is
> > >>>> generally a better description of the CSI hardware and also a nece=
ssity
> > >>>> to support the ISP data flow.
> > >>>>
> > >>>> Maybe your userspace application is not configuring the bridge med=
ia block with
> > >>>> the right format, which results in a mismatch?
> > >>>>
> > >>>> Some work was started to achieve automatic format propagation, per=
haps it
> > >>>> would be enough to solve your issue.
> > >>>>
> > >>>> Cheers,
> > >>>>
> > >>>> Paul
> > >>>> =20
> > >>>>> #regzbot introduced: 0d2b746b1bef73de62d2d311e594a7ffed4ca43 =20
> > >  =20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--Wjc1rcjoyyFv9MdK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmSuvPwACgkQ3cLmz3+f
v9FJiQf/XzrPMQwaVrbW/4hfDYEBBzyQpkJqQqZfWZyrgZtvcM7cEuBrIb8kTYA5
yfeO/E0H42m9eLfORFMRc2ze6mANt+UqXWta6Zjy2Yxvl6wqlP+GDJI9xkjQ3Ai1
raVjQ8wUHDVsV60rNH1t3GgU4+32dhkNwgDBL8ilW3Fj/nUvMs/UnMZBZ7z3rkYs
L72ig73oYzac3tdlAfCIA8cmv7KfP+u+wMnyAlt5wKAbzEPlMk/mnKdPJ9I2Zql1
ZLjQNmSbou3NvE7B3RHnQ8BkAHP7uMYmJmOaFCFjuClWoOPNgEFsKjv8fOGERMpB
yJdxyGJlTNkBniOLSlsgtS/rxYQZYg==
=raJ6
-----END PGP SIGNATURE-----

--Wjc1rcjoyyFv9MdK--
