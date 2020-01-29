Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A08E914C883
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 11:09:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgA2KJL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 05:09:11 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40171 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgA2KJL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 05:09:11 -0500
Received: by mail-wm1-f66.google.com with SMTP id t14so5723000wmi.5;
        Wed, 29 Jan 2020 02:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IEeMQyZwb5ZvQMBGHiT4bz2uBrE8NmlMrE2gpaLRCN4=;
        b=M4D4bOJEGj/lY2QG4vLhQrOK5ynkd1BVBNx5/Yo6BPCWrPFZdfLYakeq9NGrvYaPL/
         4J5qqxeXzjzeYSaqISQqEhUfXc8GV003fn11JNjLF/TdTi37ZUr2jKnNuS/rUvWwI4gX
         U4jJB7wQbbr30AtxgjkRBTNYMjHHpUR1DGjAOpG4ImUhYOZw+DON/b+4yKCd9/brVemu
         cQZ2QjQ7nYtudMmswe7BQubJw/lce6/ioGL9j7L1BfRFQeZ76XVA9lfHaSFff5Celerp
         OGFBS6UKzWlxsIzVh9DgRwAwiOKxiSD8m3Ta4nwDTQrp14yM3lnstuEu4kOxKfKa8k5G
         hSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IEeMQyZwb5ZvQMBGHiT4bz2uBrE8NmlMrE2gpaLRCN4=;
        b=HIllKRjLYrhwQvj8BUOSCGaGdCyitHk2DYdeII5s8YonkFZbc7zrPQL00u8EAnIcfG
         CNGVdMAWaSt3eac9A71uQnxYgMkHZg4eNxseHPzesxmicptubcof0kTnHI4a0H2rgzz9
         dPW/O2zEnUfL4mNjvo1nGrdmfUjaVheeLnb/iEWXzgAaUvbAYtxrWKFx2B6nzYiRkcHb
         TnQlF0y9iVcj9/rJJMFTEg20mCYOgV6vxv2WIGv74fxmYZwikP0LvLlKrn53cWkHUS4B
         19i8Kk+1Wvv9bqZDeV6yZmVbEMVfFZmOjvlfK/2J9iYYax3a2msTTTEo8dXLxorf5FeW
         5Kyg==
X-Gm-Message-State: APjAAAXw0iXwI3Wanl60ol6hDJX3wI44TTK7MvGvwDcRQ5MSDxVwCiLb
        w/yuYijvDbt/ykEquefsBhY=
X-Google-Smtp-Source: APXvYqw6MtscnzT15RPRdJwQsyNe74nuDh0G95/Tvs0e4b7dGMx4mT3OjYitft5CRAPw8u4gTumfqw==
X-Received: by 2002:a7b:c416:: with SMTP id k22mr11104279wmi.25.1580292548529;
        Wed, 29 Jan 2020 02:09:08 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id b137sm1821674wme.26.2020.01.29.02.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2020 02:09:07 -0800 (PST)
Date:   Wed, 29 Jan 2020 11:09:06 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     Helen Koike <helen.koike@collabora.com>, jonathanh@nvidia.com,
        frankc@nvidia.com, hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 4/5] media: tegra: Add Tegra Video input driver
 for Tegra210
Message-ID: <20200129100906.GE2479935@ulmo>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
 <3cdea635-a9ca-7b9c-3c99-8f489f4d669a@collabora.com>
 <162488d0-4e74-963a-3366-e4c1f7cf04ca@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BZaMRJmqxGScZ8Mx"
Content-Disposition: inline
In-Reply-To: <162488d0-4e74-963a-3366-e4c1f7cf04ca@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--BZaMRJmqxGScZ8Mx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 28, 2020 at 02:13:17PM -0800, Sowjanya Komatineni wrote:
> On 1/28/20 1:45 PM, Helen Koike wrote:
[...]
> > On 1/28/20 4:23 PM, Sowjanya Komatineni wrote:
[...]
> > > +const struct tegra_csi_fops csi2_fops = {
> > > +     .hw_init = csi2_hw_init,
> > > +     .csi_start_streaming = csi2_start_streaming,
> > > +     .csi_err_status = csi2_error_status,
> > > +};
> > If I saw correctly, you don't have other instances of struct tegra_csi_fops with different functions.
> > So why not exposing the functions directly instead of creating a global variable?
> Currently driver supports Tegra210 only. Later we will add for Tegra186 and
> Tegra184 support too where we will have separate csi fops.

Perhaps this structure should be prefixed with a tegra210_ to make that
more obvious?

> > > +EXPORT_SYMBOL(csi2_fops);

Also, why do we need to export these? These will be built as linked into
the Tegra VI driver, which is the only one that uses these, right? Would
it not be enough to just make it global? Why the need to export?

Thierry

--BZaMRJmqxGScZ8Mx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4xWb8ACgkQ3SOs138+
s6F1hA/9GY8167sFUVNO8KAreHJSXbIQSrdcxKTgKjZfBglU/9QzkA+r1/DV8uo+
uIqzdDwVcEcJCl8muMVSPCUt0oUSy7NZF/OFwZAVod20aFsse59HO0zogDrekJhC
co8t2A4foXyQiiFV/fxL2tT8jLmojdS8I4wciqiECAw+V5jsyKe8GkoRGVfX6twV
7MW05Bv1FW20Rt0H4lqP9gMolFHS3y/ZpU9rT29Fx9t1EgdKYPzwbjjCYqPGCEvi
NAqLxgqlczodpmMM0BgjTOs/6N0Fp5fnEgjU6focsRXSQbi2vkb2XpN2t08i+Vpn
cvMLJLZhmb4l2sJ71QnhTGmhOpfepPnE5KcHyh5irzLcX4XeDSb+Ldj6DT8pcROd
wbfBXOXnRAxwmTndCvnd+njWKN8I8MzQ3X8QDL18o6NABhNsFWTNQIJ6FZMzBZZU
llMRtRn9AlAKbJs/KAYiH+hPHDea0j/pO9gI4R8QWST+DmdEYl0FcZI6g2DrI0D7
LqcwS4feOIOUHyAAr8wMCHFMWpgK/9Qp9wwXp9u98Xm7j/6FHU8+uDp/AnTdWFD/
obJsoimu7Pmy82cSH7Bm/NL37aIOuDmnmCSansSo4m5wizC0pFejKmR0QCcTHufJ
LEzX36NaAED0ZaGyfgQivPdBbvize02W30xhprd+6noVxmnS57Y=
=cT4U
-----END PGP SIGNATURE-----

--BZaMRJmqxGScZ8Mx--
