Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44EF8730A8D
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 00:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbjFNWYp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 18:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjFNWYo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 18:24:44 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF68211C
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 15:24:43 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-62fe4ddd49bso8885136d6.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 15:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686781483; x=1689373483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXt60W67xT4XhXwANpwZ5Iyj7GBidDSBPCLT7lO13KM=;
        b=rQ4HMAl1Ayq5Y8akau4XKmEBu9Lk1l6jMNYxJi+GXwxQYe2SoCTFXMcaRDV8XXJVNd
         WvAdTnsPzmYCY4HU2KsakFqBaOoBxtXsRFrTsQJHd0gb2JmekPCVFkdoKdQZS3hWR30W
         2xXc87KbCDz0oZclYgF8WRkb/fXx+/eTKbwCyVOkwGmrbpxVTYoRhZPP6UWqPRvaad31
         wWZWWL3TY2cuEuC6Z01lvVm+hMWIKHoXMy8eu5MV50jrqUT3hUMIZzRcocK/p/9fdqo1
         1Z81ekbTgoAEqZPYYdwVmmVvjvxlBPkhxHYZo5lhfKVQmnQU3euWadW+yrNrOb8LAbZ4
         uQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686781483; x=1689373483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXt60W67xT4XhXwANpwZ5Iyj7GBidDSBPCLT7lO13KM=;
        b=DRIgNPT90GQGOfukh9tUGaekIQPsE2ggNvE2ZRJTwvVXlDh4JFfY7gby4ax+eto3Jy
         k2mw0L5Dq5e/W+kFmLFK7k3oDyEkJ662jqRCsxXTfBiR623BCoecdB4GEC+Z0yUY2kZL
         V2MnIBu8Yvv651HKbysvlr7Zt9isS+4R22oN06Aq9Moh7XloVA2a/UJgRg5nIv1Cfqfj
         HWdjhJTpv5GAmbmq1aR6XdWZZmE0F29NjfqaIaFzHdou3kFCBhvmWQ5OL7dovakAfZqp
         tXap4joMNjoNxv4gxJjA2d2MkHV7+YEICidl7oayWniAgXrf7/FMKDQk36C1R+oERMD3
         txOw==
X-Gm-Message-State: AC+VfDyxkn26fJVMMLeSnrCo9RFtXwJ8vnbd/iILovVbx/gu5Gr8W8hJ
        8fFUsuTAQr2/hCz5qb5SIahvvicYU2PUVI0wi6w=
X-Google-Smtp-Source: ACHHUZ4pNgHPnHI0VQsourP4+fYuPxSUXpx7GbX4qbdulYgG97QS/So32HisW2BrDJ6/61O6XGB/q/PGjonnHJeoOLE=
X-Received: by 2002:ad4:5f4b:0:b0:62f:e439:304d with SMTP id
 p11-20020ad45f4b000000b0062fe439304dmr3807963qvg.64.1686781483029; Wed, 14
 Jun 2023 15:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230614192343.57280-1-hdegoede@redhat.com> <20230614192343.57280-2-hdegoede@redhat.com>
 <ZIolnOxs29H8EUmC@kekkonen.localdomain> <CAHp75Vd3OiCm2d2FWX8CFxdA9OVpBfdczDFzuDiJ_mtSH4hU2Q@mail.gmail.com>
In-Reply-To: <CAHp75Vd3OiCm2d2FWX8CFxdA9OVpBfdczDFzuDiJ_mtSH4hU2Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 15 Jun 2023 01:24:07 +0300
Message-ID: <CAHp75VezcmHwGi0QwKG-21kJ6xpXyM_5oaA+VqAtqh7961+QNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper functions
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
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

On Thu, Jun 15, 2023 at 1:21=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jun 14, 2023 at 11:49=E2=80=AFPM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> > On Wed, Jun 14, 2023 at 09:23:39PM +0200, Hans de Goede wrote:

...

> > > +config V4L2_CCI
> > > +     tristate
> > > +     depends on I2C
> >
> > This won't do anything if the dependent driver will select V4L2_CCI, wi=
ll
> > it?
>
> Actually it will. It may warn the user about missing dependency on the
> `make *config` stage.
> See, for example, this:
> https://lore.kernel.org/lkml/1f6c4559-ee48-ca67-8ff1-f7f9d330bc12@suse.de=
/.

With corrected link
https://lore.kernel.org/lkml/20220316183708.1505846-1-arnd@kernel.org/

> > I'd let the sensor driver depend on I2C instead. CCI is also supported
> > on I3C, for instance.

--=20
With Best Regards,
Andy Shevchenko
