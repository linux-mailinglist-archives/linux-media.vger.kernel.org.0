Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40DF37E599F
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 16:00:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjKHPAJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 10:00:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjKHPAI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 10:00:08 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122E21BE4
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 07:00:06 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo11589841a12.3
        for <linux-media@vger.kernel.org>; Wed, 08 Nov 2023 07:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699455604; x=1700060404; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dl030cjxKiV3LKaOFuv8iqKRyewFQjtD+TfItY/owl8=;
        b=A8/oDt/VvXz39KWhsxUAamtgaMqi0ohMmI0oFc2D1msV2c7xczsjjFGxpaJT+cOf0z
         rwyK8C6WWNNj5Ld/EnS8ik4VJttp6bNdPRHIT68aueSU0pT9COGFgiPyTRBSJ3EpDKO/
         2yKnVDMzjDAxrrbg9NwIuuRz/iVGYNYKH9tpVsbueOUBY29uTTHjDZYKmsNWYmGl+dL8
         9BeF/ZDzpUKySlMwMCPVonQURCpCJQuYDrziuHD2cf0Urlij3odPyrCn7NORhUlOsown
         NwBbhipUXqVruFn3YsitSinhT6kLcZf2oWRFy38/Upgfl/koAzfGDfHYObmRHh+qD2LP
         uuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699455604; x=1700060404;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dl030cjxKiV3LKaOFuv8iqKRyewFQjtD+TfItY/owl8=;
        b=FtKasaDCDmEgjeMuJ9uM4QJVOqjDzem1gaOY3GQkT0vixXu/EWdz9zVCVdtrRYIvsF
         J+QrYVC/Nr31QOvwEyM/nqCxN3hqBN3W76SVx9BjDLqEOr4hY7/0fIl9QHefOxV1EWq3
         qZ4N/E9CrcRwy9KRtpavsj8HS6cKkMazNuFRBl+8fd9L9pqb/Ssje+luFtCFHA7nJEWF
         3CMQI0kypb8LGXIcArwzfdcj/+7UMKotfpbBFMO6jhTefJwiqZ3jBTRMLxOSbPqP8C79
         //DAZqdBAh4Qk5nxLlvC10txwM9oiPdXk+O6KnOABvSXEzmGy53qZrrSmQaDkcfKTf9C
         41Vg==
X-Gm-Message-State: AOJu0YykLcoRBn1eAND2O4fCzCTnOd+J7h1q4OioDhY/x/D6hM+k3AY1
        AWG3mViq1oHFKy7rwOsWZjg=
X-Google-Smtp-Source: AGHT+IHGy/Hua1TO/OfpP63DPk8s9vM0yGQY1cyqtgrAue+T9IOaV/xMV0uh4aKAXFq15YXfyHrqJw==
X-Received: by 2002:a17:907:9715:b0:9d2:8aca:182a with SMTP id jg21-20020a170907971500b009d28aca182amr1786100ejc.21.1699455604450;
        Wed, 08 Nov 2023 07:00:04 -0800 (PST)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id k19-20020a17090646d300b00991d54db2acsm1159925ejs.44.2023.11.08.07.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 07:00:03 -0800 (PST)
Message-ID: <a22cea646d0d8b8022c3be8e4625d6e67a3eb7bf.camel@gmail.com>
Subject: Re: [PATCH v2 08/15] media: intel/ipu6: add IPU6 CSI2 receiver v4l2
 sub-device
From:   Andreas Helbech Kleist <andreaskleist@gmail.com>
To:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Cc:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "Wang, Hongju" <hongju.wang@intel.com>
Date:   Wed, 08 Nov 2023 16:00:02 +0100
In-Reply-To: <DM8PR11MB565383A795F071F50B04D1BF99A8A@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
         <20231024112924.3934228-9-bingbu.cao@intel.com>
         <7c0a91f986baf62efcf0f021924653a00cdcc503.camel@gmail.com>
         <DM8PR11MB565383A795F071F50B04D1BF99A8A@DM8PR11MB5653.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Bingbu,

On Wed, 2023-11-08 at 14:50 +0000, Cao, Bingbu wrote:
> > -----Original Message-----
> > On Tue, 2023-10-24 at 19:29 +0800, bingbu.cao@intel.com=C2=A0wrote:
> >=20
> > > +#define DIV_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08
> > > +#define CSI2_ACCINV=C2=A0=C2=A0=C2=A0=C2=A08
> > > +
> > > +static u32 calc_timing(s32 a, s32 b, s64 link_freq, u32 accinv)
> > > {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return accinv * a + (accin=
v * b * (500000000 >>
> > > DIV_SHIFT)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 / (int32_t)(link_freq >>
> > > DIV_SHIFT)); }
> >=20
> > I think accinv should be s32 here. When accinv is unsigned, the
> > expression
> > (accinv * b) becomes unsigned, and thus negative values of b gives
> > incorrect results.
>=20
> accinv is always an unsigned value, so I think we don't need change
> the
> type of argument. Following usual arithmetic conversions, I think it
> needs
> a signed integer cast here. What do you think?

I think changing the type of argument is clearer. A cast just adds
noise in my opinion. Of course the argument to
ipu6_isys_csi2_calc_timing should also be changed to match, which would
also remove any implicit casts as far as I can tell.

Now we're talking about casts. There is a cast to int32_t, but the rest
of the code uses the s32/u32 typedefs. I don't know if one or the other
is recommended for new code, but I think it should at least be
consistent across the driver.

/Andreas
