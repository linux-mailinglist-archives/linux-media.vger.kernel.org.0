Return-Path: <linux-media+bounces-50975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77032D394AB
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 13:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2231300EDF4
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 12:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2121B326957;
	Sun, 18 Jan 2026 12:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wD6cUUL8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CB52DCF45;
	Sun, 18 Jan 2026 12:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768737923; cv=none; b=kvCs03ycig143mdJunsxtgLj8o42pzDpMCWr/ZkdT/0OYzxkT0VQZHEZlWTzVDzqjDkvW+ocLMwwDqQt3JRkRA/VFY0IDX5qOIB2xoAcKkqqB1l2bwvG8VShVStg1E+E/wCBNfTMvbS1J7Nw68SWaX9cqGUBgJSza5I6bQmS+ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768737923; c=relaxed/simple;
	bh=DAOntekhY/mw4cHqo+B0ErOWIZBLDRZapg+n4cRt+JY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=i5bQOa96nNoifMB6FT+lwiqDqfd4PXDTVe/RIJMkRHqyuw8BNKFS6NnH4CSdnCSUL5g6bh6diXyWcmklo7KOEEWL/VjDifpBYw2bLeR6N4+V9ZJxGVq73XQHlderh7roAu6hZpBdylt5AXvPfrs3pL2QlF3y+dcl6NzTBIRAF2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wD6cUUL8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDD3B1BA;
	Sun, 18 Jan 2026 13:04:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768737888;
	bh=DAOntekhY/mw4cHqo+B0ErOWIZBLDRZapg+n4cRt+JY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=wD6cUUL88GyjYbY/O/UK8QzR4qtWLIWG45oezr0nOmVsPVEYwJlAUSIUBfL/c1HAE
	 9gOMpH+ytGPBVNC1Srvf1Ug66MPAEAkIDgp2BWJXwFKygeOdjhKZKyV2C0wjH9YBih
	 lVIoj6dihOJJZFTCP+FZkPDOIGQjGXVcDefJ/zlk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <de5fbe8d-3f9e-4be8-a9e3-991b959305e4@linaro.org>
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz> <20260117-qcom-cphy-v3-2-8ce76a06f7db@ixit.cz> <de5fbe8d-3f9e-4be8-a9e3-991b959305e4@linaro.org>
Subject: Re: [PATCH v3 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for configuring C-PHY lanes
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Casey Connolly <casey.connolly@linaro.org>, Dr. Git <drgitx@gmail.com>, Luca Weiss <luca.weiss@fairphone.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Petr Hodina <phodina@protonmail.com>, Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, david@ixit.cz
Date: Sun, 18 Jan 2026 12:05:15 +0000
Message-ID: <176873791545.3486172.9291085318504972330@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Bryan O'Donoghue (2026-01-17 21:38:17)
> On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
> > From: David Heidelberg <david@ixit.cz>
> >=20
> > So far, only D-PHY mode was supported, which uses even bits when enabli=
ng
> > or masking lanes. For C-PHY configuration, the hardware instead requires
> > using the odd bits.
> >=20
> > Since there can be unrecognized configuration allow returning failure.
> >=20
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> >   .../platform/qcom/camss/camss-csiphy-2ph-1-0.c     |  8 ++--
> >   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 49 +++++++++++++=
++++-----
> >   drivers/media/platform/qcom/camss/camss-csiphy.c   |  4 +-
> >   drivers/media/platform/qcom/camss/camss-csiphy.h   |  6 +--
> >   4 files changed, 47 insertions(+), 20 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c b=
/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> > index 9d67e7fa6366a..bb4b91f69616b 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> > @@ -94,9 +94,9 @@ static u8 csiphy_settle_cnt_calc(s64 link_freq, u32 t=
imer_clk_rate)
> >       return settle_cnt;
> >   }
> >  =20
> > -static void csiphy_lanes_enable(struct csiphy_device *csiphy,
> > -                             struct csiphy_config *cfg,
> > -                             s64 link_freq, u8 lane_mask)
> > +static int csiphy_lanes_enable(struct csiphy_device *csiphy,
> > +                            struct csiphy_config *cfg,
> > +                            s64 link_freq, u8 lane_mask)
> >   {
> >       struct csiphy_lanes_cfg *c =3D &cfg->csi2->lane_cfg;
> >       u8 settle_cnt;
> > @@ -132,6 +132,8 @@ static void csiphy_lanes_enable(struct csiphy_devic=
e *csiphy,
> >               writel_relaxed(0x3f, csiphy->base +
> >                              CAMSS_CSI_PHY_INTERRUPT_CLEARn(l));
> >       }
> > +
> > +     return 0;
> >   }
> >  =20
> >   static void csiphy_lanes_disable(struct csiphy_device *csiphy,
> > diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b=
/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > index 4154832745525..f3a8625511e1e 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > @@ -14,6 +14,7 @@
> >   #include <linux/delay.h>
> >   #include <linux/interrupt.h>
> >   #include <linux/io.h>
> > +#include <linux/media-bus-format.h>
> >  =20
> >   #define CSIPHY_3PH_LNn_CFG1(n)                      (0x000 + 0x100 * =
(n))
> >   #define CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG (BIT(7) | BIT(6))
> > @@ -993,13 +994,22 @@ static void csiphy_gen2_config_lanes(struct csiph=
y_device *csiphy,
> >  =20
> >   static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
> >   {
> > -     u8 lane_mask;
> > -     int i;
> > +     u8 lane_mask =3D 0;
> >  =20
> > -     lane_mask =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> > +     switch (lane_cfg->phy_cfg) {
> > +     case V4L2_MBUS_CSI2_CPHY:
> > +             for (int i =3D 0; i < lane_cfg->num_data; i++)
> > +                     lane_mask |=3D (1 << lane_cfg->data[i].pos) + 1;
>=20
> 1 << anything =3D=3D BIT(anything)
>=20
> I've always disliked the look of this code and now it occurs to me why.
>=20
> This code is analogous to:
>=20
> lane_mask |=3D BIT(lane_cfg->data[i].pos) + 1);

I see that addition to a bit mask and get a little bit scared.

This gives:
  pos   mask
   0    0b00000010 (note 0 bit is zero here but 1 on all others)
   1    0b00000011
   2    0b00000101
   3    0b00001001
   4    0b00010001

Is that expected?

Can data[i].pos ever be position 0 ??

I assume this starts at position 1 - and the +1 here is to always set
the zeroth bit ?

Perhapse this might be precise to convey that in such a case?

  lane_mask |=3D BIT(pos) | 1;

I guess it depends on what this is really being used for which I don't
have in my context.

--
Kieran

=20

>=20
> but BIT() is less janky and more upstreamy.
>=20
> janky/upstreamy - this is the on-point technical argument y'all came=20
> here for :)
>=20
> > +             break;
> > +     case V4L2_MBUS_CSI2_DPHY:
> > +             lane_mask =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> >  =20
> > -     for (i =3D 0; i < lane_cfg->num_data; i++)
> > -             lane_mask |=3D 1 << lane_cfg->data[i].pos;
> > +             for (int i =3D 0; i < lane_cfg->num_data; i++)
> > +                     lane_mask |=3D 1 << lane_cfg->data[i].pos;
> > +             break;
> > +     default:
> > +             break;
> > +     }
> >  =20
> >       return lane_mask;
> >   }
> > @@ -1027,10 +1037,11 @@ static bool csiphy_is_gen2(u32 version)
> >       return ret;
> >   }
> >  =20
> > -static void csiphy_lanes_enable(struct csiphy_device *csiphy,
> > -                             struct csiphy_config *cfg,
> > -                             s64 link_freq, u8 lane_mask)
> > +static int csiphy_lanes_enable(struct csiphy_device *csiphy,
> > +                            struct csiphy_config *cfg,
> > +                            s64 link_freq, u8 lane_mask)
> >   {
> > +     struct device *dev =3D csiphy->camss->dev;
> >       struct csiphy_lanes_cfg *c =3D &cfg->csi2->lane_cfg;
> >       struct csiphy_device_regs *regs =3D csiphy->regs;
> >       u8 settle_cnt;
> > @@ -1039,9 +1050,23 @@ static void csiphy_lanes_enable(struct csiphy_de=
vice *csiphy,
> >  =20
> >       settle_cnt =3D csiphy_settle_cnt_calc(link_freq, csiphy->timer_cl=
k_rate);
> >  =20
> > -     val =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> > -     for (i =3D 0; i < c->num_data; i++)
> > -             val |=3D BIT(c->data[i].pos * 2);
> > +     val =3D 0;
> > +
> > +     switch (c->phy_cfg) {
> > +     case V4L2_MBUS_CSI2_CPHY:
> > +             for (i =3D 0; i < c->num_data; i++)
> > +                     val |=3D BIT((c->data[i].pos * 2) + 1);
> > +             break;
> > +     case V4L2_MBUS_CSI2_DPHY:
> > +             val =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> > +
> > +             for (i =3D 0; i < c->num_data; i++)
> > +                     val |=3D BIT(c->data[i].pos * 2);
> > +             break;
> > +     default:
> > +             dev_err(dev, "Unsupported bus type %d\n", c->phy_cfg);
> > +             return -EINVAL;
> > +     }
> >  =20
> >       writel_relaxed(val, csiphy->base +
> >                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
> > @@ -1068,6 +1093,8 @@ static void csiphy_lanes_enable(struct csiphy_dev=
ice *csiphy,
> >               writel_relaxed(0, csiphy->base +
> >                              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offs=
et, i));
> >       }
> > +
> > +     return 0;
> >   }
> >  =20
> >   static void csiphy_lanes_disable(struct csiphy_device *csiphy,
> > diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers=
/media/platform/qcom/camss/camss-csiphy.c
> > index 62623393f4144..08dd238e52799 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> > @@ -295,9 +295,7 @@ static int csiphy_stream_on(struct csiphy_device *c=
siphy)
> >               wmb();
> >       }
> >  =20
> > -     csiphy->res->hw_ops->lanes_enable(csiphy, cfg, link_freq, lane_ma=
sk);
> > -
> > -     return 0;
> > +     return csiphy->res->hw_ops->lanes_enable(csiphy, cfg, link_freq, =
lane_mask);
>=20
> ick.
>=20
> More high brow stuff from bod here but, more seriously this is three=20
> levels of indirection deep and the statement keeps getting longer.
>=20
> Could you get a pointer to hw_ops() to reduce this down a bit.
>=20
> >   }
> >  =20
> >   /*
> > diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers=
/media/platform/qcom/camss/camss-csiphy.h
> > index d198171700e73..21cf2ce931c1d 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> > +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> > @@ -73,9 +73,9 @@ struct csiphy_hw_ops {
> >       void (*hw_version_read)(struct csiphy_device *csiphy,
> >                               struct device *dev);
> >       void (*reset)(struct csiphy_device *csiphy);
> > -     void (*lanes_enable)(struct csiphy_device *csiphy,
> > -                          struct csiphy_config *cfg,
> > -                          s64 link_freq, u8 lane_mask);
> > +     int (*lanes_enable)(struct csiphy_device *csiphy,
> > +                         struct csiphy_config *cfg,
> > +                         s64 link_freq, u8 lane_mask);
> >       void (*lanes_disable)(struct csiphy_device *csiphy,
> >                             struct csiphy_config *cfg);
> >       irqreturn_t (*isr)(int irq, void *dev);
> >=20
>=20
> With those tweaks.
>=20
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>=20
> ---
> bod

