Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0F257811C
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 13:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233918AbiGRLmV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jul 2022 07:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbiGRLmV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jul 2022 07:42:21 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41807B7FE;
        Mon, 18 Jul 2022 04:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658144539; x=1689680539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cjDEUMocRa7SlH9O7KgQ1qOCN1vQXXghvTYa+IpysC0=;
  b=L0nFnY3RLX4DFKcImWjq9H3Ki+gskuU5r1iQQMYSsPZUUjkbvuZQf58E
   rZzvkhw0Ry+OKnGhfo+IboJj5ITPwilN0Q+5BbpX1ryXJHHr2N2m/NVle
   Acl6dOVx8LkElXPIYfzhInv3GtCuiXGEaL3iQNbd5Z/L1OOmbF3C06EVT
   R3qgGdGefuUN+fvRGG6AofMUFPpFGqPp39i/8JeqVWnA+tcYpVlURjztv
   YqWxJZvufTrKMhYYHtssTXS5xMvFr5Y+zT318cD4Gd2SXVB/OUr9SEHlH
   aTvZGp2gzK68JDEs+Nn0M7cXBPAi8h3ZKWejNbx3qcmQ0cEceU5jbJb1g
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,281,1650924000"; 
   d="scan'208";a="25106434"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Jul 2022 13:42:17 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 18 Jul 2022 13:42:17 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 18 Jul 2022 13:42:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658144537; x=1689680537;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cjDEUMocRa7SlH9O7KgQ1qOCN1vQXXghvTYa+IpysC0=;
  b=R3KONxRprur5IXFfwI2Ja64rMNN/SBMXv+5x75CtQlsmsSaPjOUOIg3n
   +8FFKpVkYG76SVj1j+GdTqYe+7NUdFbKAiilEZYvQ9VuMunExBjI6PZnk
   w98qvfU+2Rvpg0XsUx8UfkLZLDF9Ph3phEjLGicVsl53hPAaCVzJWFMCX
   I1t0O+WpLNJiDbH7wzQN1MpIFwB0vpgkq9pPSmsI/Z7HxKsIDIaLAINY2
   bzWoXB/ZTD12gAXAZI1KOwuYzl+IRAVk+v8+wXre/fMOiI8QM7m8CkB5l
   crrRwae4697lI5HjbIPb8AVzVvdf5O4Cp24iaskjt+rS0OMamUarURt1k
   g==;
X-IronPort-AV: E=Sophos;i="5.92,281,1650924000"; 
   d="scan'208";a="25106432"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Jul 2022 13:42:17 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 45DBD280056;
        Mon, 18 Jul 2022 13:42:17 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/6] media: i2c: ov9282: Add ov9281 compatible
Date:   Mon, 18 Jul 2022 13:42:14 +0200
Message-ID: <4750866.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YtQbVcpmtZjZC2go@valkosipuli.retiisi.eu>
References: <20220715074858.875808-1-alexander.stein@ew.tq-group.com> <20220715074858.875808-4-alexander.stein@ew.tq-group.com> <YtQbVcpmtZjZC2go@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Sonntag, 17. Juli 2022, 16:23:17 CEST schrieb Sakari Ailus:
> Hi Alexander,
>=20
> On Fri, Jul 15, 2022 at 09:48:55AM +0200, Alexander Stein wrote:
> > According to product brief they are identical from software point of vi=
ew.
> > Differences are a different chief ray angle (CRA) and the package.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> > ---
> >=20
> >  drivers/media/i2c/ov9282.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 3269c1983bd5..04fda8222e07 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -1114,6 +1114,7 @@ static const struct dev_pm_ops ov9282_pm_ops =3D {
> >=20
> >  };
> > =20
> >  static const struct of_device_id ov9282_of_match[] =3D {
> >=20
> > +	{ .compatible =3D "ovti,ov9281" },
>=20
> This should also be reflected in the entity name --- the user space
> deserves to know it's a different device.

Not so sure what to do here. v4l2_i2c_subdev_set_name is called from=20
v4l2_i2c_subdev_init() with devname=3DNULL. This should set the correct nam=
e.=20
According to it's documentation with the I=B2C device name, but apparently=
=20
v4l2_i2c_subdev_set_name uses the drivers name.
This seems a bug to me, but is outside of this driver.

Best regards,
Alexander

> >  	{ .compatible =3D "ovti,ov9282" },
> >  	{ }
> > =20
> >  };




