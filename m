Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 633CBC98AA
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 08:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbfJCGx1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 02:53:27 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:44437 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfJCGx0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 02:53:26 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id ABA586000C;
        Thu,  3 Oct 2019 06:53:22 +0000 (UTC)
Date:   Thu, 3 Oct 2019 08:55:06 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        hugues.fruchet@st.com
Subject: Re: [Patch 1/3] media: ov5640: add PIXEL_RATE control
Message-ID: <20191003065506.ijivptniwvzyo5oz@uno.localdomain>
References: <20190925152301.21645-1-bparrot@ti.com>
 <20190925152301.21645-2-bparrot@ti.com>
 <20191001075704.GA5449@paasikivi.fi.intel.com>
 <20191001162341.f2o7ruar2nifl5ws@ti.com>
 <20191002075951.afp2xligspqat4ew@uno.localdomain>
 <20191002121438.g3re6v54q4hit2wv@ti.com>
 <20191002143226.psrcocsjs2wtiydd@uno.localdomain>
 <20191002150615.tyxy3n6cbxttbpum@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="t4za3ljubo5keeag"
Content-Disposition: inline
In-Reply-To: <20191002150615.tyxy3n6cbxttbpum@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--t4za3ljubo5keeag
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Benoit,

On Wed, Oct 02, 2019 at 10:06:15AM -0500, Benoit Parrot wrote:
> Jacopo Mondi <jacopo@jmondi.org> wrote on Wed [2019-Oct-02 16:32:26 +0200]:
> > Hi Benoit,
> >
> > On Wed, Oct 02, 2019 at 07:14:38AM -0500, Benoit Parrot wrote:
> > > Hi Jacopo,
> > >
> > > Maybe, I miss spoke when I mentioned a helper I did not intent a framework
> > > level generic function. Just a function to help in this case :)
> >
> > Yes indeed, the discussion thread I linked here was mostly interesting
> > because Hugues tried to do the same for LINK_FREQ iirc, and there
> > where some usefult pointers.
> >
> > >
> > > That being said, I re-read the thread you mentioned. And as Hughes pointed
> > > out dynamically generating a "working" link frequency value which can be
> > > used by a CSI2 receiver to properly configure its PHY is not trivial.
> > >
> > > When I created this patch, I also had another to add V4L2_CID_LINK_FREQ
> > > support. I am testing this against the TI CAL CSI2 receiver, which already
> > > uses the V4L2_CID_PIXEL_RATE value for that purpose, so I also had a patch
> > > to add support for V4L2_CID_LINK_FREQ to that driver as well.
> > >
> > > Unfortunately, similar to Hughes' findings I was not able to make it "work"
> > > with all supported resolution/framerate.
> >
> > As reported by Hugues findings, the PLL calculation procedure might be
> > faulty, and the actuall frequencies on the bus are different from the
> > calculated ones.
> >
> > I wish I had more time to re-look at that, as they worked for my and
> > Sam's use case, but deserve some rework.
> >
> > >
> > > Unlike my V4L2_CID_PIXEL_RATE solution which now works in all mode with the
> > > same receiver.
> > >
> >
> > It seems to me you're reporting a fixed rate. It might make your
> > receiver happy, but does not report what is acutally put on the bus.
> > Am I missing something ?
>
> No it is not fixed, the only fixed value was the initial value (which
> representative of the initial/default resolution and framerate), I
> fixed this in v2. The reported PIXEL_RATE is re-calculated every time there
> is a s_fmt and/or framerate change and the V4L2_CID_PIXEL_RATE control
> value is updated accordingly.

Oh I missed v2! I only seen this one.
I'll reply there.

Thanks
  j

>
> >
> > > So long story short I dropped the V4L2_CID_LINK_FREQ patch and focused on
> > > V4L2_CID_PIXEL_RATE instead.
> > >
> >
> > As Sakari pointed out, going from one to the other is trivial and
> > could be done on top.
>
> As you said it could be done on top. :)
>
> Benoit
>
> >
> > Thanks
> >    j
> >
> > > Regard,
> > > Benoit
> > >
> > > Jacopo Mondi <jacopo@jmondi.org> wrote on Wed [2019-Oct-02 09:59:51 +0200]:
> > > > Hi Benoit,
> > > >   +Hugues
> > > >
> > > > If you're considering an helper, this thread might be useful to you:
> > > > https://patchwork.kernel.org/patch/11019673/
> > > >
> > > > Thanks
> > > >    j
> > > >
> > >
> > >
>
>

--t4za3ljubo5keeag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2Vm0kACgkQcjQGjxah
VjxCvA/8CIxJ1u3/4d340kMy543hq9yHlp9oKDwuamw0VLyqOdOGYKiJTrD8HN1M
oE5TrFlcc4j5crvLg6MHre35j2e+EHsJKsFQ+lrJp9OhXaOGSzELWc4/ixzFnLox
1hmew+DyLq/lCEThSxrRN9cWQq6mtZ4oItfB1pzGDLcaSUJ9j4sr1w+Y3gvkC3/M
zbp+IWqT75CtP7HlNgTu8ncnOJ76g+FXmQiJq1oIazq5NXTwM7vbm2V0vl+ZCnzQ
w+dz+dgmqfrO0KPthbp7HDb9Nh5SnAr0wr+E4v/ur69aHFtw5duRRHZlVmChh4vk
yg6gtrykzwx2UvT+xZWuQKoJZ2Q1m+DC3hahnKYv4Sp/wQsYuXOn5NN/MsgOBrLI
HG6SmTx0yjnygv0qXKWRbq1hwyojiED2MozPBHxGsFOUo88Gu5uZl1W7Z0K9/z18
y77Xcfj7E7W92dazdsyklxR5f2Q9/xHKV2vkVGb33WKs0j2dpNhzvSKboUV9lZX0
EiSv9njvXCN9ZkEN23SRHewP8l04+lAMSdPeA6WcZbFxkO64z2XzyuHAH2JIE1Lu
+ZqJPKRaoUQQEDtnHuZpkS7nDRUElS6EKnIp95HsYT55WB72nuINyUfTrQhTih94
BKKfRRIQ6qZ49dqlcXrh03FcDc1P/wKgU5cN1a9898NwrJZ7QWA=
=3rJs
-----END PGP SIGNATURE-----

--t4za3ljubo5keeag--
