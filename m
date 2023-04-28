Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2C7D6F11BD
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 08:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344783AbjD1GYa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 02:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbjD1GY3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 02:24:29 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B3742711
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 23:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1682663067; x=1714199067;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vVymF/xyjFqJtpkC5EIEAIbmEd1SCO2Rh1H3G2qSceA=;
  b=DT6kxxJS3iePQKmLDpaBfjQBEh0bnHOjUnbzmhBlRzjKP8ay4b8mPdmH
   I53xXN41FK4VC30iJQ/WD+Zo0coUWLgMrX5zbO1v14yH+dnrMfIqHzbr0
   4Fw35DEm1iPTEcpvY+OeqBYX5wPauxWsrcEuG4sYgMnYlZY1eV0lyyf3D
   ZNtQVec4gvBk+dikRAEPMWRI9HT29W21sQHySbGZFtPPkFksKZLWz7DNN
   ijGp6R7v4qIb6YwuHEiHlqBQdE64ZOfv7xz9LGCakKoFljEQPSTbu3BBC
   VBYL34yapEkvdvko9BL2slkGSri+pc/H0c6zamI0sM/VDVfrqHds2vhee
   g==;
X-IronPort-AV: E=Sophos;i="5.99,233,1677538800"; 
   d="scan'208";a="30617725"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 28 Apr 2023 08:24:25 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 28 Apr 2023 08:24:25 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 28 Apr 2023 08:24:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1682663065; x=1714199065;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vVymF/xyjFqJtpkC5EIEAIbmEd1SCO2Rh1H3G2qSceA=;
  b=kVZoNtHivMLxFoME3IyQH5Tn24szCvLD2te/KPCyEoy9yBBqOBnhfKgK
   HvtpP0+tpbMSjrYM1ve66lD6/IPc4ODAw8tDV2EOjQG93ykMiT6ck5s+Z
   mGKJ1gfGgkZ9JuLOr71KGqIbTA9iS09EgmUQtqTz4cysRGE5sl8NDu5+I
   W7AT9L0/jsP0/hiyzXItmWnRa26uj+woZsBR5+TrHpj044nyiKtyENAnr
   X7pJZ8AZ+9Z/jy4lA9vbWwJu58i+YABuz9aXdyMp9LGh94klEg6yZqlUj
   KseYx+7CDhgZ/HX1HJROZg03LNRJSetB0cnq+sj9Vw4cndFPtUFs7We+O
   w==;
X-IronPort-AV: E=Sophos;i="5.99,233,1677538800"; 
   d="scan'208";a="30617724"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 28 Apr 2023 08:24:25 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 13960280056;
        Fri, 28 Apr 2023 08:24:25 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: v4l2-async: regression due to endpoint matching
Date:   Fri, 28 Apr 2023 08:24:22 +0200
Message-ID: <5676976.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <43vsiiq5qvbmpnmcclh5jjemgkgym65iezvpbyu5y7sdrx63lq@v63zg7c7udyi>
References: <8360125.31r3eYUQgx@steina-w> <43vsiiq5qvbmpnmcclh5jjemgkgym65iezvpbyu5y7sdrx63lq@v63zg7c7udyi>
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

Am Donnerstag, 27. April 2023, 18:01:38 CEST schrieb Jacopo Mondi:
> Hi Alexander
>=20
> On Thu, Apr 27, 2023 at 04:40:46PM +0200, Alexander Stein wrote:
> > Hi all,
> >=20
> > I have a setup on my TQMa6x (imx6q-mba6a.dts) with a tc358743 attached =
to
> > the MIPI CSI input.
> > I noticed that since commit 1f391df44607 ("media: v4l2-async: Use
> > endpoints in __v4l2_async_nf_add_fwnode_remote()") the async subdevice
> > probing does not work anymore. If I revert that, it is working again,
> > even on next-20230425.
> A similar issue has been discussed at
> https://www.spinics.net/lists/linux-media/msg223351.html
>=20
> Unfortunately there was no conclusion as far as I can tell if not that
> imx6 is now broken

Thanks for the link, seems like a non-trivial thing :(

=46rom a glimpse, this series seems to deal with multiple async subdevs:
https://lore.kernel.org/all/20230330115853.1628216-1-sakari.ailus@linux.int=
el.com/

So imx-media-csi should be adjusted as well, no?

Best regards,
Alexander

> > $ cat /sys/kernel/debug/v4l2-async/pending_async_subdevices
> > imx-media:
> > ipu2_csi1:
> >=20
> > ipu2_csi0:
> >  [fwnode] dev=3D21dc000.mipi,
> >  node=3D/soc/bus@2100000/mipi@21dc000/port@3/endpoint>=20
> > ipu1_csi1:
> >  [fwnode] dev=3D21dc000.mipi,
> >  node=3D/soc/bus@2100000/mipi@21dc000/port@2/endpoint>=20
> > ipu1_csi0:
> > imx6-mipi-csi2:
> > ipu2_csi1_mux:
> >=20
> > ipu1_csi0_mux:
> >  [fwnode] dev=3D21dc000.mipi,
> >  node=3D/soc/bus@2100000/mipi@21dc000/port@1/endpoint>=20
> > With revert:
> > $ cat /sys/kernel/debug/v4l2-async/pending_async_subdevices
> > imx-media:
> > ipu2_csi1:
> > ipu2_csi0:
> > ipu1_csi1:
> > ipu1_csi0:
> > imx6-mipi-csi2:
> > ipu2_csi1_mux:
> > ipu1_csi0_mux:
> >=20
> > I also see these messages:
> > > video-mux 20e0000.iomuxc-gpr:ipu2_csi1_mux: Consider updating driver
> > > video-
> >=20
> > mux to match on endpoints
> >=20
> > > imx6-mipi-csi2 21dc000.mipi: Consider updating driver imx6-mipi-csi2 =
to
> >=20
> > match on endpoints
> >=20
> > > tc358743 0-000f: Consider updating driver tc358743 to match on endpoi=
nts
> > > video-mux 20e0000.iomuxc-gpr:ipu1_csi0_mux: Consider updating driver
> > > video-
> >=20
> > mux to match on endpoints
> >=20
> > But I'm unsure if this is related. As far as I can see match_fwnode_one
> > does match some nodes, but I do not know if they are the correct ones.
> > Anyone has an idea what's wrong here?
> >=20
> > Best regards,
> > Alexander
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


