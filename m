Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 862896F11CA
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 08:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345184AbjD1Gdm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 02:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345142AbjD1Gdl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 02:33:41 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087264690
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 23:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1682663615; x=1714199615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ShUofm80QLlrR3UXekpxo/7h3PnAp+3X3IVc7BKpM2o=;
  b=HycdBhpqsRrwDQP9sRzVCyPaJBliRBfiPR9gtRAJfFetQ+oX8jCeI0yN
   kB8DKHpaPseII5gasEMsZBLQzlHvz20nDTWu4xsHR1ZxwAhkH+Zv8J4rJ
   oIRMa7Q+V8+3ipqABO1otX2sA+Q5sWFmGhdy5co+xvr46DIkr6l7lnCsE
   dvX7z4zozuz0+ZMafo+x5FgnoTh1uOarQ/Rq1+3qD4Xi0LMPiOha+96/H
   VdNbXXz5QeV6bAnSKyGAsJ0G2IVD8KY1qR7wCHQF0pX3JjAXpgkG/Dscx
   46Taf7bng1afWim0gD+s00RM87/RxVil/ymftY3rFmwgesYpqRv1pPRMJ
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,233,1677538800"; 
   d="scan'208";a="30618005"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 28 Apr 2023 08:33:33 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 28 Apr 2023 08:33:33 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 28 Apr 2023 08:33:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1682663613; x=1714199613;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ShUofm80QLlrR3UXekpxo/7h3PnAp+3X3IVc7BKpM2o=;
  b=dr3qkRTv3zyXWT5gH1hBwD+BzB2mnnxkwXWVX7JEhBnew9z0P37nUqmI
   3a+gDxipPCGLNx8z0PQ/EIosJ6gncyyxmc2gEGNCxAQ9ytmVz8YMxRjOK
   RPyj+iISmhgwqsBQ/FqKiZGO32kjgSyE4Hc2iMYZqHchJyUmjNUvPp5/5
   I2Gqr8CXhqsRGszHh5KosREEYUuBnrLS4KLsUriBCX9q8dDmM73VGcdXD
   qM6CHWkxMaTMwI2toAfwzXxF6/LJFl2I32snEJLmrp7l1ifGjcfSJRQGr
   vDazCaRzIkRqxrV5L7GViom1/xBa4DDD9/4YIapRClu9BcEdfJiljz+Rv
   g==;
X-IronPort-AV: E=Sophos;i="5.99,233,1677538800"; 
   d="scan'208";a="30618004"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 28 Apr 2023 08:33:32 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C2C0C280056;
        Fri, 28 Apr 2023 08:33:32 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: v4l2-async: regression due to endpoint matching
Date:   Fri, 28 Apr 2023 08:33:30 +0200
Message-ID: <6415252.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ob373sf6lmg6qfkdqy5ovxescw5gp7yedb2flk4ax762abo7b3@w33eqx3erdg7>
References: <8360125.31r3eYUQgx@steina-w> <5676976.irdbgypaU6@steina-w> <ob373sf6lmg6qfkdqy5ovxescw5gp7yedb2flk4ax762abo7b3@w33eqx3erdg7>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Am Freitag, 28. April 2023, 08:31:54 CEST schrieb Jacopo Mondi:
> Hi Alexander
>=20
> On Fri, Apr 28, 2023 at 08:24:22AM +0200, Alexander Stein wrote:
> > Hi Jacopo,
> >=20
> > Am Donnerstag, 27. April 2023, 18:01:38 CEST schrieb Jacopo Mondi:
> > > Hi Alexander
> > >=20
> > > On Thu, Apr 27, 2023 at 04:40:46PM +0200, Alexander Stein wrote:
> > > > Hi all,
> > > >=20
> > > > I have a setup on my TQMa6x (imx6q-mba6a.dts) with a tc358743 attac=
hed
> > > > to
> > > > the MIPI CSI input.
> > > > I noticed that since commit 1f391df44607 ("media: v4l2-async: Use
> > > > endpoints in __v4l2_async_nf_add_fwnode_remote()") the async subdev=
ice
> > > > probing does not work anymore. If I revert that, it is working agai=
n,
> > > > even on next-20230425.
> > >=20
> > > A similar issue has been discussed at
> > > https://www.spinics.net/lists/linux-media/msg223351.html
> > >=20
> > > Unfortunately there was no conclusion as far as I can tell if not that
> > > imx6 is now broken
> >=20
> > Thanks for the link, seems like a non-trivial thing :(
> >=20
> > From a glimpse, this series seems to deal with multiple async subdevs:
> > https://lore.kernel.org/all/20230330115853.1628216-1-sakari.ailus@linux=
=2Ein
> > tel.com/
> >=20
> > So imx-media-csi should be adjusted as well, no?
>=20
> It would really be helpful if you can give that series a spin on imx6
> if you already have a test setup.

I tried, but it failed to apply on my current development tree. What base d=
oes=20
this series apply to? Is there also a repository available I can fetch from?

Best regards,
Alexander

> > Best regards,
> > Alexander
> >=20
> > > > $ cat /sys/kernel/debug/v4l2-async/pending_async_subdevices
> > > > imx-media:
> > > > ipu2_csi1:
> > > >=20
> > > > ipu2_csi0:
> > > >  [fwnode] dev=3D21dc000.mipi,
> > > >  node=3D/soc/bus@2100000/mipi@21dc000/port@3/endpoint>
> > > >=20
> > > > ipu1_csi1:
> > > >  [fwnode] dev=3D21dc000.mipi,
> > > >  node=3D/soc/bus@2100000/mipi@21dc000/port@2/endpoint>
> > > >=20
> > > > ipu1_csi0:
> > > > imx6-mipi-csi2:
> > > > ipu2_csi1_mux:
> > > >=20
> > > > ipu1_csi0_mux:
> > > >  [fwnode] dev=3D21dc000.mipi,
> > > >  node=3D/soc/bus@2100000/mipi@21dc000/port@1/endpoint>
> > > >=20
> > > > With revert:
> > > > $ cat /sys/kernel/debug/v4l2-async/pending_async_subdevices
> > > > imx-media:
> > > > ipu2_csi1:
> > > > ipu2_csi0:
> > > > ipu1_csi1:
> > > > ipu1_csi0:
> > > > imx6-mipi-csi2:
> > > > ipu2_csi1_mux:
> > > > ipu1_csi0_mux:
> > > >=20
> > > > I also see these messages:
> > > > > video-mux 20e0000.iomuxc-gpr:ipu2_csi1_mux: Consider updating dri=
ver
> > > > > video-
> > > >=20
> > > > mux to match on endpoints
> > > >=20
> > > > > imx6-mipi-csi2 21dc000.mipi: Consider updating driver imx6-mipi-c=
si2
> > > > > to
> > > >=20
> > > > match on endpoints
> > > >=20
> > > > > tc358743 0-000f: Consider updating driver tc358743 to match on
> > > > > endpoints
> > > > > video-mux 20e0000.iomuxc-gpr:ipu1_csi0_mux: Consider updating dri=
ver
> > > > > video-
> > > >=20
> > > > mux to match on endpoints
> > > >=20
> > > > But I'm unsure if this is related. As far as I can see
> > > > match_fwnode_one
> > > > does match some nodes, but I do not know if they are the correct on=
es.
> > > > Anyone has an idea what's wrong here?
> > > >=20
> > > > Best regards,
> > > > Alexander
> > > > --
> > > > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> > > > Amtsgericht M=FCnchen, HRB 105018
> > > > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schn=
eider
> > > > http://www.tq-group.com/
> >=20
> > --
> > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> > Amtsgericht M=FCnchen, HRB 105018
> > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> > http://www.tq-group.com/


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


