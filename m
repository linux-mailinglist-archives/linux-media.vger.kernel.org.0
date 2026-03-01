Return-Path: <linux-media+bounces-54007-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDDRA3smpGmyYgUAu9opvQ
	(envelope-from <linux-media+bounces-54007-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 12:43:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3E81CF644
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 12:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBC9B3022050
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 11:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2D7318B93;
	Sun,  1 Mar 2026 11:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F0sJSgbu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB093175A7A;
	Sun,  1 Mar 2026 11:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772365385; cv=none; b=AW05CROE5lOWGwoX/4aQ2Isitg5502Que3OdnonxGpmuVdET4YbUzx2rpd0GXIocX6dLFRsgHsHq7WSCGhU06d+G8yX9i0G4/LJ9EqnifpMjWo57vDIzi9v7uJmnNueg/weQ8P7N46//OEHGnTuafTGBNREuttiCkdAUTUpnmvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772365385; c=relaxed/simple;
	bh=/6lGKPBod54k57df5F8PYUqoqo6RqrWwsHxiulBOvgo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=SxCWrdb4hse2gcQ+v1mGiN/Vp7hurjszTOtiswdLuJPn7SJdFDEl+Xa5GWLWkmkEfjLZQui3ZUx1lFqrwU9CFZFJSGcAD3DIhNBaUAfSzi718w5b3srgFv50lD7BE4y3kqOvGeBq24+G9U+AFo16lovbg2L0gUwKRDCMoSbTL9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F0sJSgbu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFD7A56D;
	Sun,  1 Mar 2026 12:41:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772365319;
	bh=/6lGKPBod54k57df5F8PYUqoqo6RqrWwsHxiulBOvgo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=F0sJSgbuTM8I14ibOxECaF0as6nTmZdXAUyIWP/49hJuyp8uLDfCCx7tgC5fjogFf
	 RRsPjWGUmVDt1Gwj7drQK4MBeIW2Jb2pK8Mg2HVoJDUmj5vxRU7ETgwVI+urFoTk89
	 FUSRe+lYLf5TxM2X1fOhWJHNKdb7Ps7TxoHKGigg=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b23f0e1e-8a79-44c6-a0b8-09997ed26e4b@ixit.cz>
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz> <20260117-qcom-cphy-v3-2-8ce76a06f7db@ixit.cz> <de5fbe8d-3f9e-4be8-a9e3-991b959305e4@linaro.org> <176873791545.3486172.9291085318504972330@ping.linuxembedded.co.uk> <b23f0e1e-8a79-44c6-a0b8-09997ed26e4b@ixit.cz>
Subject: Re: [PATCH v3 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for configuring C-PHY lanes
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Casey Connolly <casey.connolly@linaro.org>, David Heidelberg <david@ixit.cz>, Dr. Git <drgitx@gmail.com>, Luca Weiss <luca.weiss@fairphone.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Petr Hodina <phodina@protonmail.com>, Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Date: Sun, 01 Mar 2026 11:42:55 +0000
Message-ID: <177236537581.1230693.15193663000744024111@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54007-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,ixit.cz,gmail.com,fairphone.com,kernel.org,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ping.linuxembedded.co.uk:mid,ixit.cz:email,linaro.org:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 1D3E81CF644
X-Rspamd-Action: no action

Quoting David Heidelberg (2026-02-28 22:37:57)
> On 18/01/2026 13:05, Kieran Bingham wrote:
> > Quoting Bryan O'Donoghue (2026-01-17 21:38:17)
> >> On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
> >>> From: David Heidelberg <david@ixit.cz>
> >>>
> >>> So far, only D-PHY mode was supported, which uses even bits when enab=
ling
> >>> or masking lanes. For C-PHY configuration, the hardware instead requi=
res
> >>> using the odd bits.
> >>>
> >>> Since there can be unrecognized configuration allow returning failure.
> >>>
> >>> Signed-off-by: David Heidelberg <david@ixit.cz>
> >>> ---
> >>>    .../platform/qcom/camss/camss-csiphy-2ph-1-0.c     |  8 ++--
> >>>    .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 49 ++++++++++=
+++++++-----
> >>>    drivers/media/platform/qcom/camss/camss-csiphy.c   |  4 +-
> >>>    drivers/media/platform/qcom/camss/camss-csiphy.h   |  6 +--
> >>>    4 files changed, 47 insertions(+), 20 deletions(-)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c=
 b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> >>> index 9d67e7fa6366a..bb4b91f69616b 100644
> >>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> >>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
> >>> @@ -94,9 +94,9 @@ static u8 csiphy_settle_cnt_calc(s64 link_freq, u32=
 timer_clk_rate)
> >>>        return settle_cnt;
> >>>    }
> >>>   =20
> >>> -static void csiphy_lanes_enable(struct csiphy_device *csiphy,
> >>> -                             struct csiphy_config *cfg,
> >>> -                             s64 link_freq, u8 lane_mask)
> >>> +static int csiphy_lanes_enable(struct csiphy_device *csiphy,
> >>> +                            struct csiphy_config *cfg,
> >>> +                            s64 link_freq, u8 lane_mask)
> >>>    {
> >>>        struct csiphy_lanes_cfg *c =3D &cfg->csi2->lane_cfg;
> >>>        u8 settle_cnt;
> >>> @@ -132,6 +132,8 @@ static void csiphy_lanes_enable(struct csiphy_dev=
ice *csiphy,
> >>>                writel_relaxed(0x3f, csiphy->base +
> >>>                               CAMSS_CSI_PHY_INTERRUPT_CLEARn(l));
> >>>        }
> >>> +
> >>> +     return 0;
> >>>    }
> >>>   =20
> >>>    static void csiphy_lanes_disable(struct csiphy_device *csiphy,
> >>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c=
 b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> >>> index 4154832745525..f3a8625511e1e 100644
> >>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> >>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> >>> @@ -14,6 +14,7 @@
> >>>    #include <linux/delay.h>
> >>>    #include <linux/interrupt.h>
> >>>    #include <linux/io.h>
> >>> +#include <linux/media-bus-format.h>
> >>>   =20
> >>>    #define CSIPHY_3PH_LNn_CFG1(n)                      (0x000 + 0x100=
 * (n))
> >>>    #define CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG (BIT(7) | BIT(6))
> >>> @@ -993,13 +994,22 @@ static void csiphy_gen2_config_lanes(struct csi=
phy_device *csiphy,
> >>>   =20
> >>>    static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
> >>>    {
> >>> -     u8 lane_mask;
> >>> -     int i;
> >>> +     u8 lane_mask =3D 0;
> >>>   =20
> >>> -     lane_mask =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> >>> +     switch (lane_cfg->phy_cfg) {
> >>> +     case V4L2_MBUS_CSI2_CPHY:
> >>> +             for (int i =3D 0; i < lane_cfg->num_data; i++)
> >>> +                     lane_mask |=3D (1 << lane_cfg->data[i].pos) + 1;
> >>
> >> 1 << anything =3D=3D BIT(anything)
> >>
> >> I've always disliked the look of this code and now it occurs to me why.
> >>
> >> This code is analogous to:
> >>
> >> lane_mask |=3D BIT(lane_cfg->data[i].pos) + 1);
> >=20
> > I see that addition to a bit mask and get a little bit scared.
> >=20
> > This gives:
> >    pos   mask
> >     0    0b00000010 (note 0 bit is zero here but 1 on all others)
> >     1    0b00000011
> >     2    0b00000101
> >     3    0b00001001
> >     4    0b00010001
> >=20
> > Is that expected?
> >=20
> > Can data[i].pos ever be position 0 ??
> >=20
> > I assume this starts at position 1 - and the +1 here is to always set
> > the zeroth bit ?
> >=20
> > Perhapse this might be precise to convey that in such a case?
> >=20
> >    lane_mask |=3D BIT(pos) | 1;
> >=20
> > I guess it depends on what this is really being used for which I don't
> > have in my context.
>=20
> Ok, I started looking again into the lovely downstream code.
>=20
> D-PHY has bits 0b0D_D_D_D
> C-PHY has bits 0b0_C_C_C_
>=20
> so for some reason it worked in my usecase without proper lane mask, but =

> the original formula should be
>=20
>   -                     lane_mask |=3D (1 << lane_cfg->data[i].pos) + 1;
>   +                     lane_mask |=3D (1 << lane_cfg->data[i].pos + 1);
>=20
> Thus
>=20
> BIT(lane_cfg->data[i].pos + 1);

That looks a lot more sane!

--
Kieran

>=20
> >=20
> > --
> > Kieran
> >=20
> >  =20
> >=20
> >>
> >> but BIT() is less janky and more upstreamy.
> >>
> >> janky/upstreamy - this is the on-point technical argument y'all came
> >> here for :)
> >>
> >>> +             break;
> >>> +     case V4L2_MBUS_CSI2_DPHY:
> >>> +             lane_mask =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABL=
E;
> >>>   =20
> >>> -     for (i =3D 0; i < lane_cfg->num_data; i++)
> >>> -             lane_mask |=3D 1 << lane_cfg->data[i].pos;
> >>> +             for (int i =3D 0; i < lane_cfg->num_data; i++)
> >>> +                     lane_mask |=3D 1 << lane_cfg->data[i].pos;
> >>> +             break;
> >>> +     default:
> >>> +             break;
> >>> +     }
> >>>   =20
> >>>        return lane_mask;
> >>>    }
> >>> @@ -1027,10 +1037,11 @@ static bool csiphy_is_gen2(u32 version)
> >>>        return ret;
> >>>    }
> >>>   =20
> >>> -static void csiphy_lanes_enable(struct csiphy_device *csiphy,
> >>> -                             struct csiphy_config *cfg,
> >>> -                             s64 link_freq, u8 lane_mask)
> >>> +static int csiphy_lanes_enable(struct csiphy_device *csiphy,
> >>> +                            struct csiphy_config *cfg,
> >>> +                            s64 link_freq, u8 lane_mask)
> >>>    {
> >>> +     struct device *dev =3D csiphy->camss->dev;
> >>>        struct csiphy_lanes_cfg *c =3D &cfg->csi2->lane_cfg;
> >>>        struct csiphy_device_regs *regs =3D csiphy->regs;
> >>>        u8 settle_cnt;
> >>> @@ -1039,9 +1050,23 @@ static void csiphy_lanes_enable(struct csiphy_=
device *csiphy,
> >>>   =20
> >>>        settle_cnt =3D csiphy_settle_cnt_calc(link_freq, csiphy->timer=
_clk_rate);
> >>>   =20
> >>> -     val =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> >>> -     for (i =3D 0; i < c->num_data; i++)
> >>> -             val |=3D BIT(c->data[i].pos * 2);
> >>> +     val =3D 0;
> >>> +
> >>> +     switch (c->phy_cfg) {
> >>> +     case V4L2_MBUS_CSI2_CPHY:
> >>> +             for (i =3D 0; i < c->num_data; i++)
> >>> +                     val |=3D BIT((c->data[i].pos * 2) + 1);
> >>> +             break;
> >>> +     case V4L2_MBUS_CSI2_DPHY:
> >>> +             val =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> >>> +
> >>> +             for (i =3D 0; i < c->num_data; i++)
> >>> +                     val |=3D BIT(c->data[i].pos * 2);
> >>> +             break;
> >>> +     default:
> >>> +             dev_err(dev, "Unsupported bus type %d\n", c->phy_cfg);
> >>> +             return -EINVAL;
> >>> +     }
> >>>   =20
> >>>        writel_relaxed(val, csiphy->base +
> >>>                       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5=
));
> >>> @@ -1068,6 +1093,8 @@ static void csiphy_lanes_enable(struct csiphy_d=
evice *csiphy,
> >>>                writel_relaxed(0, csiphy->base +
> >>>                               CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->o=
ffset, i));
> >>>        }
> >>> +
> >>> +     return 0;
> >>>    }
> >>>   =20
> >>>    static void csiphy_lanes_disable(struct csiphy_device *csiphy,
> >>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drive=
rs/media/platform/qcom/camss/camss-csiphy.c
> >>> index 62623393f4144..08dd238e52799 100644
> >>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> >>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> >>> @@ -295,9 +295,7 @@ static int csiphy_stream_on(struct csiphy_device =
*csiphy)
> >>>                wmb();
> >>>        }
> >>>   =20
> >>> -     csiphy->res->hw_ops->lanes_enable(csiphy, cfg, link_freq, lane_=
mask);
> >>> -
> >>> -     return 0;
> >>> +     return csiphy->res->hw_ops->lanes_enable(csiphy, cfg, link_freq=
, lane_mask);
> >>
> >> ick.
> >>
> >> More high brow stuff from bod here but, more seriously this is three
> >> levels of indirection deep and the statement keeps getting longer.
> >>
> >> Could you get a pointer to hw_ops() to reduce this down a bit.
> >>
> >>>    }
> >>>   =20
> >>>    /*
> >>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drive=
rs/media/platform/qcom/camss/camss-csiphy.h
> >>> index d198171700e73..21cf2ce931c1d 100644
> >>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> >>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> >>> @@ -73,9 +73,9 @@ struct csiphy_hw_ops {
> >>>        void (*hw_version_read)(struct csiphy_device *csiphy,
> >>>                                struct device *dev);
> >>>        void (*reset)(struct csiphy_device *csiphy);
> >>> -     void (*lanes_enable)(struct csiphy_device *csiphy,
> >>> -                          struct csiphy_config *cfg,
> >>> -                          s64 link_freq, u8 lane_mask);
> >>> +     int (*lanes_enable)(struct csiphy_device *csiphy,
> >>> +                         struct csiphy_config *cfg,
> >>> +                         s64 link_freq, u8 lane_mask);
> >>>        void (*lanes_disable)(struct csiphy_device *csiphy,
> >>>                              struct csiphy_config *cfg);
> >>>        irqreturn_t (*isr)(int irq, void *dev);
> >>>
> >>
> >> With those tweaks.
> >>
> >> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>
> >> ---
> >> bod
>=20
> --=20
> David Heidelberg
>

