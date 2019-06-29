Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 110CC5AAA5
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 14:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbfF2MGT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 08:06:19 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46773 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbfF2MGS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 08:06:18 -0400
Received: by mail-lj1-f194.google.com with SMTP id v24so8508871ljg.13
        for <linux-media@vger.kernel.org>; Sat, 29 Jun 2019 05:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7TKQBGVeJu0V7i4jo68D+am2nJ6itLmxQim2/MjQy7c=;
        b=Y0J1+75NHivm0jvjG35/xojKIFVBG7sZfg18nnJ0nhH56Ga6rLlTgSB6UWi4moOhCp
         St0T+ztlFa7HiUrwBsRgQK5rjiNS/h1QRM4OoCeSE5s5lNVJKUaxx6HsRp75BnZY3TWc
         FnIZbF0FBZ+GnU/QRpjU387yht8fMsBiGk5GAYaoYezFONAaUVrvdNHa6VRqFIEBXpqh
         ZoM78iMkATdACnxQIvHWnVtn91Zt7gf4izMSS+/ZTwCbpUFlie2wjH8wH7m8lIFCnz9a
         XH/w9PGwrJN3NAh+vKqh+fuT/3QwBdUs8QAYN+vscdT3rQ7hkkGmxhhzfYhbDdSTmVpo
         uWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7TKQBGVeJu0V7i4jo68D+am2nJ6itLmxQim2/MjQy7c=;
        b=RDkCQxaZnHnZTdr5guTeamakEu/djXFP7O38BXzF9q2036sNc7DnESNOK6zPmkvcnC
         rwRTc+p7CU8LdC/u8W3Vx9S88/TmVw79BE3Dam+9S7NpZgItljx3+TNsouS9Z1Vk0ZtB
         AOUUiI7KBLvysabD+Cu8MQ64l1tmRpIKQn+4OLxZZaVaOCGMEzBmTIK8rnhlAkGE372L
         yUqFX4iSC9srtyCPbFxzCrX0TrzA/OX6H4rJD8fpBkeHHg8r7QMGxKcj3HGL3H2CZ1rM
         dZfyjcQocBarTZtKvhIXRv19kx22ELOw2dblfgx3MZ1nuTD1W2qgMbnIhe2cOAaonBpk
         mtKg==
X-Gm-Message-State: APjAAAWCUvYuV8/cYwmB7ySpwpVGUEPHb7SWFeOzNKr/Uz8zuniqPEDx
        7sGSvqqPVTPZARBviInVYzE=
X-Google-Smtp-Source: APXvYqzXkIDVsJm6U1OOuV9HL9jGMM+jiQavzENPEYWRGhRKqBkCl8/6TQLkEstqSPs3HlbYNDcM5Q==
X-Received: by 2002:a2e:298a:: with SMTP id p10mr8709911ljp.74.1561809977050;
        Sat, 29 Jun 2019 05:06:17 -0700 (PDT)
Received: from z50.localnet (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id t21sm1325477lfl.17.2019.06.29.05.06.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 05:06:16 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH for v5.3] v4l2-subdev: fix regression in check_pad()
Date:   Sat, 29 Jun 2019 14:06:14 +0200
Message-ID: <6794762.LFFAoRDyN6@z50>
In-Reply-To: <5686be05-660e-ee01-06a0-5505479c34c8@xs4all.nl>
References: <5686be05-660e-ee01-06a0-5505479c34c8@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Saturday, June 29, 2019 12:00:24 P.M. CEST Hans Verkuil wrote:
> sd->entity.graph_obj.mdev can be NULL when this function is called, and
> that breaks existing drivers (rcar-vin, but probably others as well).
>=20
> Check if sd->entity.num_pads is non-zero instead since that doesn't depend
> on mdev.
>=20
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reported-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
> Fixes: a8fa55078a77 ("media: v4l2-subdev: Verify arguments in
> v4l2_subdev_call()") ---
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c
> b/drivers/media/v4l2-core/v4l2-subdev.c index 21fb90d66bfc..bc32fc1e0c0b
> 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -124,16 +124,11 @@ static inline int check_which(__u32 which)
>  static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
>  {
>  #if defined(CONFIG_MEDIA_CONTROLLER)
> -	if (sd->entity.graph_obj.mdev) {
> -		if (pad >=3D sd->entity.num_pads)
> -			return -EINVAL;
> -		return 0;
> -	}
> +	if (sd->entity.num_pads)

This reverts a change introduced on Sakari's request in v7 of the series wh=
ich=20
is the source of the regression.  The intention was to fail if num_pads =3D=
=3D 0=20
on a valid media entity. Maybe we should still keep that restriction and fa=
il=20
in case mdev is not NULL? In other words:=20

=2D	if (sd->entity.num_pads)
+	if (sd->entity.num_pads || sd->entity.graph_obj.mdev)

Thanks,
Janusz

> +		return pad >=3D sd->entity.num_pads ? -EINVAL : 0;

This and below look like coding style changes, not related strictly to the=
=20
merit.  Shouldn't they rather be split into a separate patch?

BTW, the current coding style follows original implementation of check_*=20
functions present before that series was introduced.  Maybe it would be bet=
ter=20
to keep them unified, i.e., either as is or all updated with the new style.

Thanks,
Janusz

>  #endif
>  	/* allow pad 0 on subdevices not registered as media entities */
> -	if (pad > 0)
> -		return -EINVAL;
> -	return 0;
> +	return pad ? -EINVAL : 0;
>  }
>=20
>  static int check_cfg(__u32 which, struct v4l2_subdev_pad_config *cfg)




