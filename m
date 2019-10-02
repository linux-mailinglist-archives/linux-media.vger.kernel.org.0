Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04123C8B48
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 16:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbfJBOas (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 10:30:48 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:39081 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbfJBOar (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 10:30:47 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 91CCBC0002;
        Wed,  2 Oct 2019 14:30:43 +0000 (UTC)
Date:   Wed, 2 Oct 2019 16:32:26 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        hugues.fruchet@st.com
Subject: Re: [Patch 1/3] media: ov5640: add PIXEL_RATE control
Message-ID: <20191002143226.psrcocsjs2wtiydd@uno.localdomain>
References: <20190925152301.21645-1-bparrot@ti.com>
 <20190925152301.21645-2-bparrot@ti.com>
 <20191001075704.GA5449@paasikivi.fi.intel.com>
 <20191001162341.f2o7ruar2nifl5ws@ti.com>
 <20191002075951.afp2xligspqat4ew@uno.localdomain>
 <20191002121438.g3re6v54q4hit2wv@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kof3u5wcyurirvhq"
Content-Disposition: inline
In-Reply-To: <20191002121438.g3re6v54q4hit2wv@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--kof3u5wcyurirvhq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Benoit,

On Wed, Oct 02, 2019 at 07:14:38AM -0500, Benoit Parrot wrote:
> Hi Jacopo,
>
> Maybe, I miss spoke when I mentioned a helper I did not intent a framework
> level generic function. Just a function to help in this case :)

Yes indeed, the discussion thread I linked here was mostly interesting
because Hugues tried to do the same for LINK_FREQ iirc, and there
where some usefult pointers.

>
> That being said, I re-read the thread you mentioned. And as Hughes pointed
> out dynamically generating a "working" link frequency value which can be
> used by a CSI2 receiver to properly configure its PHY is not trivial.
>
> When I created this patch, I also had another to add V4L2_CID_LINK_FREQ
> support. I am testing this against the TI CAL CSI2 receiver, which already
> uses the V4L2_CID_PIXEL_RATE value for that purpose, so I also had a patch
> to add support for V4L2_CID_LINK_FREQ to that driver as well.
>
> Unfortunately, similar to Hughes' findings I was not able to make it "work"
> with all supported resolution/framerate.

As reported by Hugues findings, the PLL calculation procedure might be
faulty, and the actuall frequencies on the bus are different from the
calculated ones.

I wish I had more time to re-look at that, as they worked for my and
Sam's use case, but deserve some rework.

>
> Unlike my V4L2_CID_PIXEL_RATE solution which now works in all mode with the
> same receiver.
>

It seems to me you're reporting a fixed rate. It might make your
receiver happy, but does not report what is acutally put on the bus.
Am I missing something ?

> So long story short I dropped the V4L2_CID_LINK_FREQ patch and focused on
> V4L2_CID_PIXEL_RATE instead.
>

As Sakari pointed out, going from one to the other is trivial and
could be done on top.

Thanks
   j

> Regard,
> Benoit
>
> Jacopo Mondi <jacopo@jmondi.org> wrote on Wed [2019-Oct-02 09:59:51 +0200]:
> > Hi Benoit,
> >   +Hugues
> >
> > If you're considering an helper, this thread might be useful to you:
> > https://patchwork.kernel.org/patch/11019673/
> >
> > Thanks
> >    j
> >
>
>

--kof3u5wcyurirvhq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2UtPoACgkQcjQGjxah
VjzuFhAAsWYgqaIr7PXgThGYiKp6BKXEWAlDPNxdgqz/qJIA3Lu/Vh94Q3RPmk91
DaXn712XpeCv/lM4Z658bKPedhwKpze0kcoYK1E9/51Yde/5IEjf/WUSEJVvvpPY
wdWqdAkwbeStd4uLDAHmy63ZOFqPWrA3gvYJbiZoBjDMz+lbfkxadC5vHKLMAZ9E
ZBB2WjJsGpggxIqtyhH2qdI9akIqqfe17d1JfU1dacnAEM3PJ8TGcCky10Jg0xQr
Ced86LUDDO1WI3ORKmzshEBXLFUW5t0hT5FnuloJClHAiTcZ4TbBo8HUYgTb81yq
RqiurkEUaycHrgNriQ8KjblwNT0VLpL42+nbDYvjUH2qAC1pLQGsdRgKsTkCXgj2
k3lSU4nUd/rXg5o9f2l3F6T5Yubl88l1qeYOtosmpsiIoJLCyQySDEvZvNQ+O093
QV8k3tuy26nwzLpGN9lZO3skYwm6KKuEbyEZUKVDu2RUI5rX097Ea0Gl31/41/jO
8TCPVuX2diAmO3ZbLMafUmlO7YJsXMx41cOCP4BeUsEPfXcjnObr/TkH3XtMrD0m
BFUJZTKqBjYR/8x4T+1vH4Lfswi/Pj+uypI9FVamy5wN4LwRoQVbYUJI1zKsmcDc
JIC0GIQRyX/h7Ice0YCFP361mHbz0ZQ9avvcAS7MlRhcVDofRMM=
=medk
-----END PGP SIGNATURE-----

--kof3u5wcyurirvhq--
