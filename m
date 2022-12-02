Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7DC76406BA
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 13:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233332AbiLBMYC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 07:24:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233146AbiLBMYA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 07:24:00 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC88ACBA66;
        Fri,  2 Dec 2022 04:23:58 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id e15so4801573qts.1;
        Fri, 02 Dec 2022 04:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dbkaMxzhc2uYdfTG1qS40AJW00cOjbuhUVn/IXQMNNc=;
        b=PHlLMeKq8gJzDJbZ3pYL5tnVnwKb59Nr9QHimBwH4X4d68h/w69TwTnOGnj4cyZS08
         WsZy99X0N8tZGNUTkDtJW1LO5FC/fpwbaua7H4FQYhuniVhW+JFWZ+5hOjq+ssQCgnu2
         0nkE0c4SadYPv4ogzGnyvPviONH4Tg8fNHl7IbSGjAPBIaao4k4AboZb9/YQVW2/77r0
         0+E+n+wKs5IWyXA9FoD+chHIfu8Iz+tEoM6Xf2+yOYxItAmC7AF6xNeifu4U9Nrj0+Nz
         i6xKzXOfsMfSJJrzxvx4zJ4C8wMIRIpnPrXDrkhJsf32st5DadVILBEsELw61nJuWhW/
         n0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dbkaMxzhc2uYdfTG1qS40AJW00cOjbuhUVn/IXQMNNc=;
        b=jXeJdVtjx1DkXE6nDuFgGdYB1p1XaPKAhVuPJNahdnhq4LsMHn4N8rdeETdCNAi4R8
         zLOVuLXcyKpag/MNS/o2zlAPqjoWfblUVDJBw+Tnv69SlKdQlvtnB4GZYQ+uYHQtJpcD
         bdjf1j+f/Uygah6VFZdYDnaD7eajlvp3jqLN2/H1JNA4oHVTiegxOshmeNR2AaTaZGkS
         QiR9OHUMdNleRzHqaOKCOxM3Q5DuRZ0QgYm7s9YfnVH2qxfrg7HPHamSNGGIATML6RTQ
         QDUl/zjTQLMLMv7B5D3OOsJ82GjO0C/wsB/sk0He2q8vf/puuEaK6PdBA5QdSfsuKDsX
         nSxw==
X-Gm-Message-State: ANoB5pn3jrinRxr+48rkmiWcHK19sDWuT3rrZIMuNQ8vMdraji1oV3di
        LvWjEkq8CRj5X1JawsUC/Yo8bVpsvSf4279BeWI=
X-Google-Smtp-Source: AA0mqf7g5fnop05y1iIlnb8OPWeZ6h5BcjPIgGEl7CkI+8X8MmQ53cWNBaqZ3SzXAOtfStT1gmPdoSSWY4eAET4duu8=
X-Received: by 2002:a05:620a:21ce:b0:6fa:d149:6d47 with SMTP id
 h14-20020a05620a21ce00b006fad1496d47mr46401943qka.734.1669983838079; Fri, 02
 Dec 2022 04:23:58 -0800 (PST)
MIME-Version: 1.0
References: <20221129231149.697154-1-hdegoede@redhat.com> <20221129231149.697154-2-hdegoede@redhat.com>
 <Y4ddgnRbRyUDSPFI@paasikivi.fi.intel.com> <ad9d01b6-de08-b54c-d300-cf133df90536@redhat.com>
 <Y4duQpP/GrfFQkwS@paasikivi.fi.intel.com> <fef2a014-1ef9-049a-2516-539ea14abdac@redhat.com>
 <Y4nZUpGvtKMpxrDR@pendragon.ideasonboard.com> <29b30a50-0fc1-e185-c79b-10856a80bceb@redhat.com>
 <Y4nmZND8Mm89X0Y/@pendragon.ideasonboard.com> <CAHp75VeN_2TNQfSAji+QN_EpgtVrm2Lxw50mAQkdnLeQPmsp5A@mail.gmail.com>
 <Y4nsNp4RSVZwI98H@pendragon.ideasonboard.com>
In-Reply-To: <Y4nsNp4RSVZwI98H@pendragon.ideasonboard.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 2 Dec 2022 14:23:22 +0200
Message-ID: <CAHp75Vdb+vbBTJTpi4unUYpkwFUjCW387pVQ=78OxzQLWgJVnQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: ov5693: Add support for a privacy-led GPIO
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 2, 2022 at 2:14 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Dec 02, 2022 at 01:53:55PM +0200, Andy Shevchenko wrote:
> > On Fri, Dec 2, 2022 at 1:50 PM Laurent Pinchart wrote:
> > > On Fri, Dec 02, 2022 at 12:21:12PM +0100, Hans de Goede wrote:
> > > > On 12/2/22 11:54, Laurent Pinchart wrote:

...

> > > > Note the need for an index -> name map is standard for all GPIOs
> > > > on ACPI platforms.
> > >
> > > It's funny how ARM platforms were criticized for their need of board
> > > files, with x86/ACPI being revered as a saint. Now we have DT on ARM and
> > > x86 needs board files :-)
> >
> > I believe it's a misunderstanding here due to missing words at Hans'
> > statement, i..e.
> > "..., which do not provide the descriptions in _DSD() method."
> >
> > So, no, x86 does not need board files generally speaking. The problem
> > here is some departments of some big companies that didn't get ACPI
> > properly or at all.
>
> When it comes to camera support, that seems to cover an overwhelming
> majority of systems, if not all of them.

Unfortunately :-(

-- 
With Best Regards,
Andy Shevchenko
