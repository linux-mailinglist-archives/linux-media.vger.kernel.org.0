Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF4A6747FD3
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 10:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbjGEIhq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 04:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbjGEIhp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 04:37:45 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4172C184
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 01:37:43 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51bece5d935so8167141a12.1
        for <linux-media@vger.kernel.org>; Wed, 05 Jul 2023 01:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688546261; x=1691138261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qk0cUG0AFwK8YmO9mek8y613IXVJuRK8HpgMe7v1UjU=;
        b=CMEn3gXgsnWlglHQpRbxLQQc1OkXSg73CEbR69wpDz7sHjo/sfv2UDf2HEfl5Fjm6c
         a8fxn3noix4C6/gOvyM8jKpeMuFdAlex30sMP8+j58zkjhnROv7BeceXlYGJ7oxy58Vw
         VqOjz9BR1ctMxTRllR4IzTi80ArShukWDMfdXesLhXxud/n6rWAbyPbOXAS3MCxpgDD+
         SplR922SO+EUd/urz8wS8oaR98Y1Q3drKPanmqjh1vpvS0nhVUKPmqhFIkbtOC00ZJ9I
         H/r23dS+gZe19KLOnHFMPRE0MluJeOTDtuA+ChAdlFAqH58H6J75/WmWFU0XrVfaTACe
         Dd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688546261; x=1691138261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qk0cUG0AFwK8YmO9mek8y613IXVJuRK8HpgMe7v1UjU=;
        b=NmFcOXC536+5sY8I0aWY26dpoFfVghE4xArDWpQwhTeE4bIS3IYXXPTiQFUx1rA14m
         YwnTYF1PG0S8Tb7TfgYUqLJ7lXIFarK0GTuzxR9CP/jijUFZcqqRGsDbfuz5xAQ5RwHf
         33RN0ccWyqNcbfwdtpShmUxEdpJiOn65imA2UmkL+v4a8G3j6AXzOVi/1JyHUs4wB3jl
         CMVfjBtWBlvGp+EdnrIzbN3oTkqQO45h2QkKEuiTKwzL65+eYqkIfpLAdHvVFSvMLZfG
         X2+0lPK2JUphWoJqWn3cSZdUOJ9EHK8Ki/MVsmAxs7PUYRLwujlTqD4N7Z9KYbe/BchV
         Enlw==
X-Gm-Message-State: ABy/qLaOcCq+jN6piACFPMtWMHy9gl1gZbPDfs+lFI902iHeDCOv21Ca
        JZ8xGwwIY4kuxSk9I3kLrW/vXRS4Lmtg9cDqvKU=
X-Google-Smtp-Source: APBJJlF+C7WKT8MFQDygKbFuRV+AUtm4N0OfE1cjydcKe0v/uGNyXzacJekA1AsqHHK/sUP9nof3tlus4TIZlti7F58=
X-Received: by 2002:aa7:d819:0:b0:51e:234:cb69 with SMTP id
 v25-20020aa7d819000000b0051e0234cb69mr9207611edq.15.1688546261125; Wed, 05
 Jul 2023 01:37:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230630110643.209761-1-hdegoede@redhat.com> <20230630110643.209761-2-hdegoede@redhat.com>
 <CAHp75VdQAJyfYj63pU4DaD5EhWpW-k5jJ-AUv7QNyPM1MJ4-eA@mail.gmail.com>
 <18b44c72-1873-4756-3fa3-55d6ca4c3984@ideasonboard.com> <ZKQsglq1DmM5sgq6@smile.fi.intel.com>
 <41999c8a-6465-587a-d77c-313a424b7f21@redhat.com>
In-Reply-To: <41999c8a-6465-587a-d77c-313a424b7f21@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 5 Jul 2023 11:37:04 +0300
Message-ID: <CAHp75VdDc4Rk1ftmRNNUdH57gVF_mn5e5U7a7yPRxFFZc-Fibw@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] media: ipu-bridge: Fix null pointer deref on
 SSDB/PLD parsing warnings
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, Hao Yao <hao.yao@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        =?UTF-8?Q?Fabian_W=C3=BCthrich?= <me@fabwu.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 4, 2023 at 5:50=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 7/4/23 16:28, Andy Shevchenko wrote:
> > On Tue, Jul 04, 2023 at 12:02:00PM +0100, Dan Scally wrote:
> >> On 30/06/2023 16:23, Andy Shevchenko wrote:
> >>> On Fri, Jun 30, 2023 at 2:06=E2=80=AFPM Hans de Goede <hdegoede@redha=
t.com> wrote:
> >>>> When ipu_bridge_parse_rotation() and ipu_bridge_parse_orientation() =
run
> >>>> sensor->adev is not set yet.
> >>>>
> >>>> So if either of the dev_warn() calls about unknown values are hit th=
is
> >>>> will lead to a NULL pointer deref.
> >>>>
> >>>> Set sensor->adev earlier, with a borrowed ref to avoid making unroll=
ing
> >>>> on errors harder, to fix this.
> >>> TBH, I don't like this approach, it seems a bit dirty to me.
> >>>
> >>> First of all, why do we need pci_dev to be a parameter in this functi=
on?
> >>> Second, why don't we consistently use the ACPI handle (with respectiv=
e
> >>> acpi_handle_*() macros to print messages)?
> >>>
> >>> So, my proposal here is to actually save the ACPI device handle in th=
e
> >>> sensor object and use it for the messaging. It makes it consistent an=
d
> >>> doesn't require to rewrite adev field which seems the dirty part to
> >>> me.
> >>
> >> It's a bit finicky but I don't think it's so bad; the refcounting is a=
ll
> >> fine, the later acpi_dev_get() is only to hold a reference once the ne=
xt
> >> loop iteration frees the existing one and the rewrite should store the=
 exact
> >> same pointer...we could just not store the result of the acpi_dev_get(=
) call
> >> to avoid that weird rewrite perhaps?
> >
> > For short term solution in between the patches I might agree with you, =
but
> > backporting. Backporting a bad code doesn't make it better even if it f=
ixes
> > nasty bug. And I proposed the solution. We may kill the handle same way=
 as
> > we are killing the awkwardness of this assignment later in the series.
>
> Yeah, no sorry. As Dan pointed out this fix is fine and I don't feel
> like re-writing it just because you don't like it.
>
> I don't see any real technical arguments against this approach, just
> you not liking it.

OK.

--=20
With Best Regards,
Andy Shevchenko
