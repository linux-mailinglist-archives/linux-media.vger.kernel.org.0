Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64A795C4F3
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 23:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbfGAVYp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 17:24:45 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35720 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbfGAVYp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 17:24:45 -0400
Received: by mail-lj1-f193.google.com with SMTP id x25so14744198ljh.2
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 14:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qkCJDlMIQuvnRCFdiEfsGtjoCCM0xiJCUKBSEZTtxew=;
        b=FqAytGIZGB4NuPG/Tlsf1q/EIelkOJHy3YRtpEt2so1OZS0yOX71PnPTF6wj2eATJe
         XLbjgFXe1Gwk5qZjs01ho4sKZZ37Pv4w2ODJSbVyaiDQZvgpkHc2+dK9y58z9SNr+gPH
         gjViEQr3bVR1+xEDoMlDeCpj50HoZagihF+sech6jMq9yqPlxnjgt1gRywoElDILmmxA
         ZsN627JSHhnk16ZZfIDcBf7lK+MBP6IBq3mchrHAnuJE01R1aC1ifuAVlFNhKCTFRiuZ
         nPcmj79ZGiJwRmHJyVg3dhyycULZ15vd4uTMx51SdHIumQxfTZZhyc0lbJ5wLrZpvRpb
         j5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qkCJDlMIQuvnRCFdiEfsGtjoCCM0xiJCUKBSEZTtxew=;
        b=KSIBcDd7kN6XmUKlOgZPdwVZdTutJKy6bjycSdTToZNS5vqo9m3Nk+vJt+vR/mgtVK
         wp8xcreSX08FAZ6OJ0FBMS8OrPygUqH/3RCJ9efTZrXydPlX/SfbcgocbrwK9vLhLB5p
         dHYTs6T9AirXh9IZ/r13PTA3KzlSyh/TSDxsSvqK6pdvaKeZ0lSvrB9oBrbCKhjkj+go
         6C08Q+pae+04MVqBYpDZA6SyA/5oxiEkPcnOeGFsnAKq60eaZdQYysRX9vsdMnGXh0bG
         BcCJIM9fbmaJRJ2Q0xsoqDhXHcIVChzZv4zW+POHGfrA95wpF5IeG7JMLa4YBj8n4JQa
         eHLg==
X-Gm-Message-State: APjAAAUJfhCDTX1pg1hsKljZGW6cpBXu3BE6RGqmliFNDBHydzdE2acM
        PebXXCixS0X1gtjD+Nl1kdA=
X-Google-Smtp-Source: APXvYqzixma/7R8c0CH4TDKhCyOLB4K4EZ5eW2M116bMDCP01X7zsYRr+3yMo6MMb1KM5g8hcGUdWw==
X-Received: by 2002:a2e:9a82:: with SMTP id p2mr15565561lji.64.1562016282266;
        Mon, 01 Jul 2019 14:24:42 -0700 (PDT)
Received: from z50.localnet (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id z6sm2889489lfa.45.2019.07.01.14.24.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 14:24:41 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH for v5.3] v4l2-subdev: fix regression in check_pad()
Date:   Mon, 01 Jul 2019 23:24:39 +0200
Message-ID: <2112269.GJ7ysv8lsh@z50>
In-Reply-To: <20190701075054.7rxcv4rocubl52v6@paasikivi.fi.intel.com>
References: <5686be05-660e-ee01-06a0-5505479c34c8@xs4all.nl> <a4d4f164-0b9d-0917-3a48-fc97ae6730bf@xs4all.nl> <20190701075054.7rxcv4rocubl52v6@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Monday, July 1, 2019 9:50:55 A.M. CEST Sakari Ailus wrote:
> Hi Hans,
>=20
> On Sat, Jun 29, 2019 at 03:08:23PM +0200, Hans Verkuil wrote:
> > On 6/29/19 2:57 PM, Hans Verkuil wrote:
> > > On 6/29/19 2:06 PM, Janusz Krzysztofik wrote:
> > >> Hi Hans,
> > >>=20
> > >> On Saturday, June 29, 2019 12:00:24 P.M. CEST Hans Verkuil wrote:
> > >>> sd->entity.graph_obj.mdev can be NULL when this function is called,
> > >>> and
> > >>> that breaks existing drivers (rcar-vin, but probably others as well=
).
> > >>>=20
> > >>> Check if sd->entity.num_pads is non-zero instead since that doesn't
> > >>> depend
> > >>> on mdev.
> > >>>=20
> > >>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > >>> Reported-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech=
=2Ese>
> > >>> Fixes: a8fa55078a77 ("media: v4l2-subdev: Verify arguments in
> > >>> v4l2_subdev_call()") ---
> > >>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c
> > >>> b/drivers/media/v4l2-core/v4l2-subdev.c index
> > >>> 21fb90d66bfc..bc32fc1e0c0b
> > >>> 100644
> > >>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > >>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > >>> @@ -124,16 +124,11 @@ static inline int check_which(__u32 which)
> > >>>=20
> > >>>  static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
> > >>>  {
> > >>>  #if defined(CONFIG_MEDIA_CONTROLLER)
> > >>>=20
> > >>> -	if (sd->entity.graph_obj.mdev) {
> > >>> -		if (pad >=3D sd->entity.num_pads)
> > >>> -			return -EINVAL;
> > >>> -		return 0;
> > >>> -	}
> > >>> +	if (sd->entity.num_pads)
> > >>=20
> > >> This reverts a change introduced on Sakari's request in v7 of the
> > >> series which is the source of the regression.  The intention was to
> > >> fail if num_pads =3D=3D 0 on a valid media entity. Maybe we should s=
till
> > >> keep that restriction and fail in case mdev is not NULL? In other
> > >> words:
> > >>=20
> > >> -	if (sd->entity.num_pads)
> > >> +	if (sd->entity.num_pads || sd->entity.graph_obj.mdev)
> > >=20
> > > If an entity has no pads, then it doesn't have pad ops either and this
> > > function would never be called.
> >=20
> > Sakari, do you think it is ever possible that an entity may have pad op=
s,
> > but num_pads goes at some point to 0?
> >=20
> > If so, then we can check for sd->entity.function !=3D 0. All MC subdevs=
 must
> > set that to a non-0 value, otherwise the core will issue a WARN_ON. I
> > think
> > it is the only reliable indicator that can be used.
>=20
> I don't think checking the num_pads field is is a great way to test wheth=
er
> an entity supports the pad ops; I don't have a better proposal either as =
it
> seems that some drivers call these ops before registering the subdev.
>=20
> There are sub-device drivers that expose their own device node and thus
> work with MC-enabled master drivers but have no pad ops: this is what mak=
es
> the fundamental difference in API support, it's not the number of pads. We
> just happen to see this in pad ops only (I guess).
>=20
> Currently the drivers may set the HAS_DEVNODE flag (that really tells abo=
ut
> MC compatibility) just before registering the sub-device. This might be a
> better test for allowing pad ops, but the name of the flag is somewhat
> misleading. I wouldn't want to start testing this now however, it'd risk
> exposing these issues to a much wider audience.
>=20
> I guess in practice testing for num_pads still works; it however does lea=
ve
> some gray area between MC-enabled sub-device drivers and the rest.=20

That's why I proposed to cover that area by still checking for a non-NULL m=
dev=20
member alternatively.

Are you sure HAS_DEVNODE flag is applicable only for media entities? AFAICS=
=20
subdev drivers may expose some IOCTLs regardless of CONFIG_MEDIA_CONTROLLER=
=20
and CONFIG_V4L2_SUBDEV_API settings.

Thanks,
Janusz


> Perhaps
> something to improve in the future, but for a later kernel release.
>=20
> So,
>=20
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>




