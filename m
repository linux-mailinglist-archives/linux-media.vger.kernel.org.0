Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBDE15AB5B
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 15:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbfF2NNU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 09:13:20 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42908 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbfF2NNU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 09:13:20 -0400
Received: by mail-lj1-f195.google.com with SMTP id t28so8612167lje.9
        for <linux-media@vger.kernel.org>; Sat, 29 Jun 2019 06:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wF70nyqbhvXkbvIkZaTS+u0UT/FRJNQ7/S+uOLu7CaI=;
        b=Pyrfqat9537tixWlh7G8H/bdTHmjfyW4/MuQSpXcaQekLc4yQrmYLJQusr6LDX2ixn
         OGziaXDIXZ0dWWTt0b+Ittu5jG5SzXBluFOzRc91akCAjq6OpUsNNxiNoCrECU4XvjYF
         wmkeLhpHY52eKH7M8mwej/eq2osf+2VydVOJ0oFbXxATGmhIfPPgeBkFTGu2RAQNJIKF
         Ff3FYN1NH0iPwZH02l5N6WPjVcrMlJHx0/6m1+l7rRvwy1eBG48iBiHlzZWeALs6hTjd
         xGink33tEhrqt32094MAQcix9gHWn+VNK3did3H61WmT5OvcDLVOmsVimzvMsFfDBq45
         NnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wF70nyqbhvXkbvIkZaTS+u0UT/FRJNQ7/S+uOLu7CaI=;
        b=E5DgCTPX4Fc6+qx59y2GgEXDyUo08DbYGL40MQMssKI+THduR35s7l+VMPC7C6zWzy
         CMOOWPgh3760IZg1UpmazWb/VW1GeiNms+XxNy9QQQMmgM8EqPIuJ2PeM7LoDefv2LMN
         EpKV2t87Qx3BCW5Xga9mBvIL/+NVC1VXeB98lEnQpUVVcO648CnwmOWcL3QPAOZGztBV
         Dd4OthkCe8jKSxYnqLQsBp3C6grFL0TKkmanz2tHwqlRCrkrv+wjFNKMRiAr+u4CJvod
         rf7WJeaEmxasbXdEs8ojCpFSmVavlX8KK5+VChvhiEcJMuOdVESoTsvT+FwJOTnE5AFZ
         WHqg==
X-Gm-Message-State: APjAAAV6yv5oCRTjorzD6C+wPaskpPH0tHHbj0QJ/amcRd2qwt5tYKXe
        fYxEkbFrUIac5t14tACsTTY=
X-Google-Smtp-Source: APXvYqxxtuMG5gFZh9Pt3lJsbqfTqcgWQsRiC8kEBLq8rEfHfaE2QMcGxIvE15v2mDD02w84HxZjfQ==
X-Received: by 2002:a2e:9dd7:: with SMTP id x23mr9277274ljj.160.1561813998749;
        Sat, 29 Jun 2019 06:13:18 -0700 (PDT)
Received: from z50.localnet (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id u13sm1353667lfi.4.2019.06.29.06.13.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 06:13:17 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH for v5.3] v4l2-subdev: fix regression in check_pad()
Date:   Sat, 29 Jun 2019 15:13:17 +0200
Message-ID: <1892813.ECJImQiLv2@z50>
In-Reply-To: <afc93b30-f91a-2bf0-6793-08efca59a300@xs4all.nl>
References: <5686be05-660e-ee01-06a0-5505479c34c8@xs4all.nl> <6794762.LFFAoRDyN6@z50> <afc93b30-f91a-2bf0-6793-08efca59a300@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Saturday, June 29, 2019 2:57:09 P.M. CEST Hans Verkuil wrote:
> On 6/29/19 2:06 PM, Janusz Krzysztofik wrote:
> > Hi Hans,
> >=20
> > On Saturday, June 29, 2019 12:00:24 P.M. CEST Hans Verkuil wrote:
> >> sd->entity.graph_obj.mdev can be NULL when this function is called, and
> >> that breaks existing drivers (rcar-vin, but probably others as well).
> >>=20
> >> Check if sd->entity.num_pads is non-zero instead since that doesn't
> >> depend
> >> on mdev.
> >>=20
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> Reported-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
> >> Fixes: a8fa55078a77 ("media: v4l2-subdev: Verify arguments in
> >> v4l2_subdev_call()") ---
> >> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c
> >> b/drivers/media/v4l2-core/v4l2-subdev.c index 21fb90d66bfc..bc32fc1e0c=
0b
> >> 100644
> >> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> >> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> >> @@ -124,16 +124,11 @@ static inline int check_which(__u32 which)
> >>=20
> >>  static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
> >>  {
> >>  #if defined(CONFIG_MEDIA_CONTROLLER)
> >>=20
> >> -	if (sd->entity.graph_obj.mdev) {
> >> -		if (pad >=3D sd->entity.num_pads)
> >> -			return -EINVAL;
> >> -		return 0;
> >> -	}
> >> +	if (sd->entity.num_pads)
> >=20
> > This reverts a change introduced on Sakari's request in v7 of the series
> > which is the source of the regression.  The intention was to fail if
> > num_pads =3D=3D 0 on a valid media entity. Maybe we should still keep t=
hat
> > restriction and fail in case mdev is not NULL? In other words:
> >=20
> > -	if (sd->entity.num_pads)
> > +	if (sd->entity.num_pads || sd->entity.graph_obj.mdev)
>=20
> If an entity has no pads, then it doesn't have pad ops either and this
> function would never be called.

Unless this is a subdevice which doesn't support MC, was updated in the pas=
t=20
to use pad ops instead of depreciated video ops, so it actually has pad ops=
=20
even if it has num_pads =3D=3D 0, and is built by a user with=20
CONFIG_MEDIA_CONTROLLER=3Dy for some reason.

Thanks,
Janusz

>=20
> > Thanks,
> > Janusz
> >=20
> >> +		return pad >=3D sd->entity.num_pads ? -EINVAL : 0;
> >=20
> > This and below look like coding style changes, not related strictly to =
the
> > merit.  Shouldn't they rather be split into a separate patch?
>=20
> I'll post a v2, the diff is a lot smaller. I might post a follow-up patch
> to use ? : since that's a lot shorter code.
>=20
> Regards,
>=20
> 	Hans
>=20
> > BTW, the current coding style follows original implementation of check_*
> > functions present before that series was introduced.  Maybe it would be
> > better to keep them unified, i.e., either as is or all updated with the
> > new style.
> >=20
> > Thanks,
> > Janusz
> >=20
> >>  #endif
> >> =20
> >>  	/* allow pad 0 on subdevices not registered as media entities */
> >>=20
> >> -	if (pad > 0)
> >> -		return -EINVAL;
> >> -	return 0;
> >> +	return pad ? -EINVAL : 0;
> >>=20
> >>  }
> >> =20
> >>  static int check_cfg(__u32 which, struct v4l2_subdev_pad_config *cfg)




