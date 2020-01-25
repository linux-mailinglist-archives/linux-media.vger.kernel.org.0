Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECA3149539
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2020 12:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727235AbgAYLYh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jan 2020 06:24:37 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40948 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgAYLYh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jan 2020 06:24:37 -0500
Received: by mail-wr1-f65.google.com with SMTP id c14so5161766wrn.7;
        Sat, 25 Jan 2020 03:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bNk/OspMeZjlVC/SKfI3L+0oFPUb+GRq74FvOVEc3HQ=;
        b=gM9Yxu1p0Nsi4Zctq5wvCXsMYRrDBm/Vjiqmt/eGl8COnQMgWdfFUfDB3XdbgThdmj
         NIDlR5Hh4eTMZQjI0hhLZ3T5oyP25FetCvAoeeR3vVXaixcESuqjeHYXQBq1ZxMazQUv
         EED3txDawm+AoD9BYnHgBzFhO2ixy7WBXUmZqodqGBA+F/61lIWvOFHAf8WGeGrN+S/6
         EUh5nR99OQiYJNynws8yIw7OvFb6eHFieq8WTEIjONRZK0ogBWVEi8tzyypZW2gMoWPh
         hQxPbj1Q3NotEc/m5T+JXSaH+8NPHEYRdEZELI72NTWFSVmIMT0O9IJP6FCzpKD2qgY4
         hBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bNk/OspMeZjlVC/SKfI3L+0oFPUb+GRq74FvOVEc3HQ=;
        b=nGtx/6Q6RtAl/5ztzoY4HUArad8czgMWcRFzDGNs0jKtPgdOTIdZZN3dneCSB4pFDb
         iMKsHgAApBhoOng34OBkwPZNeb49bSZt+wbg/e94oxmQ8YEv6Wl1sUbmadpIzBovknBg
         xxcRRyPtrZ3Xj2hCB18ApNvqHm7OPqXOsvP3NBeBrfxzll33Z+PnQVlp7WPtFbBw8GnY
         0L2CN7ShaxnxLJvdwr5cxQdzUwPsSUNVI2lmX0/JpVhhC60c8ueahrMeN/vweh8Qlfi6
         mn8m0aNBKbMWFd5Lvk0UObgNf3Hb/gbV8w3joUE9xYkmiQhXN7S3a8g+danylQeoIGte
         Be9g==
X-Gm-Message-State: APjAAAXtnQVCH3h9NqeLi9ZxTZu9PQ0YC2FUQG17pTE7GBmPuRk2/hbq
        JHOnj2uJMiSsPoCucz1qIdw=
X-Google-Smtp-Source: APXvYqwSRB4GnMc8wYHmDCrrOC5fRc3uwvimip3VqhEtndLxWL6dxHIkp/VsDwcDVobhpqSxrQUiNg==
X-Received: by 2002:a5d:4a8c:: with SMTP id o12mr9736485wrq.43.1579951474523;
        Sat, 25 Jan 2020 03:24:34 -0800 (PST)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net. [194.152.20.232])
        by smtp.gmail.com with ESMTPSA id a62sm1604452wmh.33.2020.01.25.03.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2020 03:24:33 -0800 (PST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com
Cc:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        jernej.skrabec@siol.net
Subject: Re: [linux-sunxi] [PATCH 1/8] clk: sunxi-ng: sun8i-de2: Swap A64 and H6 definitions
Date:   Sat, 25 Jan 2020 12:24:31 +0100
Message-ID: <2701584.e9J7NaK4W3@jernej-laptop>
In-Reply-To: <2008374.irdbgypaU6@jernej-laptop>
References: <20200124232014.574989-1-jernej.skrabec@siol.net> <CAGb2v6680yWT8KtjK0uKM00+6ed4NoPpsMaDyfYERwOXgb8Vbg@mail.gmail.com> <2008374.irdbgypaU6@jernej-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne sobota, 25. januar 2020 ob 12:20:18 CET je Jernej =C5=A0krabec napisal(=
a):
> Hi!
>=20
> Dne sobota, 25. januar 2020 ob 04:05:33 CET je Chen-Yu Tsai napisal(a):
> > On Sat, Jan 25, 2020 at 7:20 AM Jernej Skrabec <jernej.skrabec@siol.net>
>=20
> wrote:
> > > For some reason, A64 and H6 have swapped clocks and resets definition=
s.
> > > H6 doesn't have rotation unit while A64 has. Swap around to correct t=
he
> > > issue.
> > >=20
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> >=20
> > Could you add Fixes tags for this one?
>=20
> I'm not sure which commit to reference. H6 one? or also initial A64 one?
>=20
> I just found out that H5 compatible uses A64 structure, which is not
> correct. H5 doesn't contain rotate core.
>=20
> Do you have any better idea how to nicely solve this mess? I'm thinking t=
hat
> for v2 I would first decouple some compatibles, like this for H5 and R40
> and V3s from A83T (as it can be seen in the next patch). After that, rath=
er
> than switching definitions I would fix each compatible one by one. At the
> end, if any entry is duplicated, I can add one commit to merge same
> structures.

This could also be a separate series of patches on which rotate driver seri=
es=20
depends on.
=20
Best regards,
Jernej




