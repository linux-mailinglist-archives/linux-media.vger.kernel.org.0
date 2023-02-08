Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6957168EA8C
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 10:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjBHJI5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 04:08:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjBHJI4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 04:08:56 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF3C3AB0
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 01:08:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DFC83B81C0C
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 09:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A767C4339C;
        Wed,  8 Feb 2023 09:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675847332;
        bh=qLQ0yIS4/XneFDdiO9GpY2yycubjfIvYvG9WiCAX/8I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MYGr8WpKJKjr9rvCzBRrTNSulG1vTPTTkwHqDta5hAaDbGUgSA0ExOEPXbSSAS4c4
         Z+rvAXySuPqvjiUBGh2Hd+FzCsnKyfSMkX8NV7y9h5aHeATdzIUx7ZypvzRie30GDA
         G7UDlhmzcu50tfX1q8tGMWi4NRNaQdwsUvGMMbshicNJd5SCW8QOtLkyy5bGjuialH
         BytHhaUqfWZ1PteHE8k8CS31cVujYueK6VXlkx4Nhihw4bSoVD2yS8kEvDqPNZWOfL
         gEKifJIHknv2TSFbtiqliXZT2XadKyyx0TDrsMnun2r/uwKaJzFevepjQ7iVBKP86G
         LOoiVCmnkhw2w==
Date:   Wed, 8 Feb 2023 10:08:47 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Stefan Herdler <herdler@nurfuerspam.de>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, Manu Abraham <abraham.manu@gmail.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>,
        Soeren Moch <smoch@web.de>
Subject: Re: Future of the SAA7146 drivers
Message-ID: <20230208100847.3ec87576@coco.lan>
In-Reply-To: <026b1342-2b0f-f61d-ea33-63f3992d1473@nurfuerspam.de>
References: <c78a2740-1b80-2ea2-dc5c-4ead440ff9ed@nurfuerspam.de>
        <c093e775-e863-f886-e819-e8a929775a89@xs4all.nl>
        <a24d4645-ac78-9990-92c3-7c04282f190e@nurfuerspam.de>
        <20ceeb7f-336a-b51c-8cc8-128cc9ebcd2e@xs4all.nl>
        <014db0ee-55fe-2966-a531-b8c23e97b402@web.de>
        <d9197b80-335c-ee70-eccc-ad04c026cbc9@xs4all.nl>
        <8fb1799b-5ed1-9d26-54fc-b47abe0c13cf@nurfuerspam.de>
        <df796e6c-c82f-8734-3de6-8446bd0b48ab@web.de>
        <014a6ade-dddb-6c0d-a59a-186e0b0aa3c2@nurfuerspam.de>
        <44cc2154-9224-510d-1f9c-34ae49f01c73@nurfuerspam.de>
        <c735aadc-80cd-9332-6661-638cad63afa2@xs4all.nl>
        <026b1342-2b0f-f61d-ea33-63f3992d1473@nurfuerspam.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 6 Feb 2023 01:06:47 +0100
Stefan Herdler <herdler@nurfuerspam.de> escreveu:

> Hi Hans,
>=20
> On 03/02/23 09:50, Hans Verkuil wrote:
> > On 03/02/2023 01:58, Stefan Herdler wrote: =20
> >> Hi Hans,
> >>
> >> It's me again, sorry.
> >>
> >> S=C3=B6ren wrote to me that he dislikes the idea of driver specific
> >> headerfile and will refuse to maintain the driver if there is any chan=
ge.
> >>
> >> I can't tell more, I'm just the messenger, sorry. =20
> >
> > No problem, I think we'll just leave it as-is.
> >
> > The reality is that 1) there are very few developers with in-depth DVB
> > knowledge in the media subsystem, and 2) they don't have time. =20
>=20
> S=C3=B6rens "no changes" means absolutely no changes.
> That includes filenames, position, basically everything.

It won't make any sense to warrant that any Kernel files will be kept=20
as-is forever. If one wants a fixed driver, just use a LTS distro.
=20
> His main concern is that distributions may packages if build brakes.
> I wasn't aware of that since Friday. (Poor communication, sorry.)

Distributions can handle changes on Kernel files, provided that any
changes would also be applied at the userspace apps (if this is the
case).

> This concern is not completely unjustified.
> Especially if it happens without notice and no update is available.
>=20
> The download links of the vdr-plugin seems to be broken, which might be
> fatal in this case.
> It happened this summer when vdr switched from FTP to GIT. I suppose it
> was inadvertently and can be fixed quickly.
> I'll take care of it, a missing source isn't good anyway.
>=20
> Until today I wasn't aware of that either.
> I focused on the kernel and used a local copy so far.
>=20
> >
> > Also, the DVB drivers that are in the kernel seem to be doing fine:
> > bug reports are rare. This videobuf issue is the first in years that
> > cropped up and this too is really only analog video as well, it's just
> > that it affects DVB boards as well since the same driver is used.
> >
> > The av7110 has always been an unusual card and some API decisions were
> > made in the past that do not fit well into our current ideas how this
> > should work. But frankly, I personally have no interest in getting
> > involved in that 'fight'. =20
>=20
> Me neither.
> But it looks like I already managed to get between the lines :-(.
> >
> > BTW, I looked at your av7110api.diff patch and that is a good first ste=
p.
> > I do thing that the existing video.h/audio.h/osd.h should be replaced
> > with versions that just include av7110.h, =20
>=20
> For clarification:
> I mentioned the API-conversion under the impression the av7110 driver is
> almost already gone and that it might be the only chance to save it.
> I do not really want this conversion, I still prefer to avoid it.
> But if the choice is between driver removal and API-conversion, I'll
> take the latter.
>=20
> Please inform us early, if Linux-Media decides the API-conversion is
> necessary and has to be done.
> I guess it takes at least 1/2 year to distribute the updates.
> Unfortunately, S=C3=B6ren most likely won't be "in the boat" anymore, in =
this
> case. But that is his own decision.
>=20
> Anyhow, this is topic for later, as you wrote recently.
> First thing to do is the videobuf conversion.
>=20
> In the next weeks I'll be busy with other things and probably don't find
> much time for this hobby.
> But other modifications to the driver doesn't make much sense while
> videobuf conversion is in progress anyway.
>=20
> Please cc me if you're done with videobuf conversion. I might overlook
> it otherwise.
> I'll take a look at the compliance-tool then and try to fix as much I can.
>=20
> > with a big fat notice that
> > these APIs are now av7110 specific =20
> Don't worry there are only the 2 fullfeatured-cards using this API and
> just because of historical reasons. The driver of the "new"
> HD-fullfeatured-card dates back to 2008 (*).
> Meanwhile here have been written several specific output-device-plugins
> for vdr using V4L-API, vaapi, vdpau, ...
> There are no plans to use this part of the DVB-API ever again.

Ok. If that's the case, maybe we can just keep the api without changes.

Yet, in order to move av7110 out of staging, we should finish documenting
the API (or drop the unused/undocumented parts of it).

> (* The driver is out-of-tree and doesn't count. It is just about the date=
.)
>   (as they have almost always been in
> > practice).

Thanks,
Mauro
