Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43720787969
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 22:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243514AbjHXUgX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 16:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243493AbjHXUgC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 16:36:02 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DACFE5E
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 13:36:00 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so393871a12.1
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 13:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692909358; x=1693514158;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sDgQ9cxrAoE0RjWvAKsqPDVUE9ihOV9yuxb4A1bx07s=;
        b=ioGmjTqwyHuxiPFfFWTh3FjuOBLtfnr0fsJWzkma+gCDPOg6OzOChdqHgrkN0ym3fQ
         SX72IU9k8+14J4uwqDG3ADy6IHKDIHP8HgpmiVSDvpfEBCMg0kVZW/KMRj8Np6FQja53
         5LPwYucyEJwUjJZXDzDSWjDqMpy6WK2mwlQFZIkK6fwZS/VsGEwngwHFvJJM1ILDvL1X
         yeEwyeDDgeqXm6R5Yn8RS8aKINB9MF5PtmuqFzQcfwarTkYImcJIiJMBZLqHK4ySTi2k
         pIwC7MAgfhv8rz4ceFtBOyMjS1p5eGg74e4RQjKrYtDqGvUy57K0faD1R5xyu67ET+5H
         HkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692909358; x=1693514158;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sDgQ9cxrAoE0RjWvAKsqPDVUE9ihOV9yuxb4A1bx07s=;
        b=WaNz32xrQ7xqyQINDYQuercPyunAgfDBqthY5ILKwxOfKlQ59VbANk+dU6wQnbRMg2
         iP9JkXd5Rm6kqDS4C+UmjEEUGiChnH89cdi5NTKJoRmzLTeK4HeE8Hrsly7CxbCu9Gsp
         bPtIddpfrsgmojuLv2pN+7LmuYdX4M4h9WyGoCntTRVZo6IG/EYEl9/uxyYMlm40rb3G
         jD/X6Cfl/5YG2rUm1GCENOWxPFXgXL9ro/sZJI7MbugrLFokiz2116ygKZ0PH/5qVCZA
         s178JMLd6E6k9Fy+x9cM0/dHzD5l38oPKhLiBnCjdX1aMd0hvI9dxmLlymTCcfsQQcIR
         Atvw==
X-Gm-Message-State: AOJu0Yzf+F1QPjH5ClKHn5haaryhhe2E2HNMtqhMivPVIQhiyZyJXlt/
        GnBoT5YIIaQhR2gYphhUp7o=
X-Google-Smtp-Source: AGHT+IF0+u8xK2T9uU0o7Q3rnnS8maS9AN/l4aAtpu/KtNBHdheXV7hUjNl6L/hmwsMhCzDgkvgGkQ==
X-Received: by 2002:a17:906:300c:b0:9a1:6252:16a0 with SMTP id 12-20020a170906300c00b009a1625216a0mr12513508ejz.46.1692909358138;
        Thu, 24 Aug 2023 13:35:58 -0700 (PDT)
Received: from [192.168.1.70] ([87.52.106.165])
        by smtp.gmail.com with ESMTPSA id b10-20020a170906490a00b009a1be9c29d7sm50043ejq.179.2023.08.24.13.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 13:35:57 -0700 (PDT)
Message-ID: <0ea505ed7fdfeeea04bb240e8ee80a8ecffd0733.camel@gmail.com>
Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
From:   Claus Stovgaard <claus.stovgaard@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com,
        andreaskleist@gmail.com
Date:   Thu, 24 Aug 2023 22:35:55 +0200
In-Reply-To: <20230822142241.GA14596@pendragon.ideasonboard.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
         <769ebe9f8eb88b2c07eae5910fc7d79c1ff888cb.camel@gmail.com>
         <5fb07c7d-390c-d7ae-c74b-8e03c75f636c@linux.intel.com>
         <0a381077-c07a-ed40-c53e-5e36177bd5f2@linux.intel.com>
         <907f992d4e333f090418f39ebd59bf8ac1fb5e3f.camel@gmail.com>
         <d451bbec67358373ca8495544cc0802233108a03.camel@gmail.com>
         <20230821121908.GD10135@pendragon.ideasonboard.com>
         <471df7ffdf34b73d186c429a366cfee62963015f.camel@gmail.com>
         <20230822142241.GA14596@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2023-08-22 at 17:22 +0300, Laurent Pinchart wrote:
> Hi Claus,
>=20
> On Tue, Aug 22, 2023 at 02:52:35PM +0200,
> claus.stovgaard@gmail.com=C2=A0wrote:
> >=20
> > Hi Laurent.
> >=20
> > Thanks for your offer - it might come in handy to have libcamera
> > support, but I don't need it right now.
> >=20
> > My use case is a bit special. I am working as Embedded Engineer for
> > Ambu A/S, where we have 2 display units, named aView2 and aBox2,
> > for
> > single use endoscopy.
> >=20
> > https://youtu.be/eDcSrHxzZ70?t=3D14
> >=20
> > Those units is based on the intel Apollo Lake with IPU4, where only
> > the
> > isys part of IPU4 is used, as a FPGA in front of the Apollo Lake is
> > used for image processing. So the image stream is sent to the
> > Apollo
> > Lake as RGB data - and is using the IPU4 isys as DMA. E.g. like
> > below.
> >=20
> > scope -> FPGA -> tc358748 -> IPU4-> memory
>=20
> Out of curiosity, is this because the image processing requirements
> are
> very device-specific, or was that done to work around the fact that
> the
> IPU4 doesn't provide a good ISP driver ?

The hardware was created with this architecture before I started at
Ambu, so I don't know the details around the original design process.
Though I would say device-specific , because we are used for medical
procedures you want to have a mitigation for any failure.
The display is also connected to the FPGA, so when it is powered on,
before the Apollo Lake starts, a basic video pipeline is already
running. E.g. instant on, and showing video from the scopes.
If a code error happens on the Apollo Lake and the watchdog kicks it,
it always fall back to this FPGA view.
This FPGA view is of cause missing features and information present
when the complete system is running. Features like patient information,
video recording, voice recording, printing, data export etc. but the
FPGA view makes sure the doctor always is able to see what happens when
the scope is inserted in the body, even if any bug is hit in the
software.
So think device-specific risk mitigation.


>=20
> > We need to support this for newer kernels, then provided from intel
> > (4.14 / 4.19)
>=20
> *OUCH*. Seriously ?? :-(

Ohh yes.. So I think we have plenty of work for quite some time...
But a good option for learning this part of the kernel.

>=20
> > and looking at the code, it seems like a better option to
> > base it on this IPU6 isys driver and extend it to cover IPU4 isys
> > also.
> >=20
> > So we are being inspired by the provided 4.14 / 4.19 kernel, and
> > then
> > work on the IPU6 codebase.
> >=20
> > Our current status is that my coworker has the Buttress to load the
> > firmware on IPU4, and we will continue work from there.
> >=20
> > My end goal would be that an upstream vanilla kernel is able to
> > support
> > the isys part of IPU4, and the complete IPU6.
>=20
> It would be very nice to have an upstream driver for the IPU4 CSI-2
> receivers indeed. Looking forward to seeing one :-)
>=20

We will do our very best.

Regards
Claus
