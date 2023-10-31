Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4107DCB8B
	for <lists+linux-media@lfdr.de>; Tue, 31 Oct 2023 12:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235373AbjJaLPt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 07:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235369AbjJaLPs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 07:15:48 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99940DF
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 04:15:42 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-280137f1a1bso2814702a91.1
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 04:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698750942; x=1699355742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRnf1Zwy+T7bxtya+9g6CohFovFw9UPlzTKl75H3rms=;
        b=EKlViQlNY1iyVr0cRU/A1E04M/YOwxYT1Eg2aZC4c9kpfnhO2a1KA+cc8gORJO6PZT
         OfM4w7dAtDpRIO6nz5k5ZV66x/DEmZgom7T4GY1cXxImFpoUCYIc0V6XSRuVoSMnkeYi
         4XwydFVR1ydhqIj40EdEDFrukSpiqcXRtx9DqSnNnaLlD9vkQx+Y40ttFlfdWpPvHUN0
         KRftBc3FJFT9i/X8UHK0qNDnNJ57KYudI7lhRNj5QH/WWLuJghWqKcPfd84j334bZ0CG
         zqbTlOOv7Y7sTWtgqCt9ZuGkIAO6RMN/QCCO83WFuNk2Yy8Ndi8B70T9Mw88XGp+PnhZ
         LYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698750942; x=1699355742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRnf1Zwy+T7bxtya+9g6CohFovFw9UPlzTKl75H3rms=;
        b=ZV/ajY+Npm6ixT3grG1zN3dnNX2UuxTgljlpEK4RlXKpZbwUZQPyinGIltZGEDioz2
         3rf6RkQ7z9DmterpD7kRlwoTfqNih53tVvMCiSn2mUdtKvABuQNN/wCmuaHQ+YzvamGZ
         UVC0Sun1Sbkh2f4jJnVaCF/1t6xbP9ROYIQv7g555HlZDMkvji0rASNvAg67ufMQWjuW
         AKahShoJVrz2jVhfBd1DRXiXxBNV4gYMI5LsBYKJtK7KHrZWsIcBmX7pe7+z733k62oF
         a0gucmCqqgnfdgf9MBazAt8cUvJyYkLHoL3t8jTtTYV2ubab/P3G5zd9ZZFuESqhIFSA
         GvNA==
X-Gm-Message-State: AOJu0YxFDNDGn4Cq/rHIqe78BZWaytas5X2bYpgFWu9H1pmVTDH/zyiC
        txzMgyhrQ7hE3n3ZTfCnJAPcMbHoqCWj7CehTx8=
X-Google-Smtp-Source: AGHT+IGwE6jinDVZsJ31WkpZJONiSiZOy08s+llqjZT0HA+oJE81wYpGHjcJDNgFOl+bA0WEPEQwWsayCA65YvlYj1U=
X-Received: by 2002:a17:90a:985:b0:27d:237b:558b with SMTP id
 5-20020a17090a098500b0027d237b558bmr9212619pjo.5.1698750941969; Tue, 31 Oct
 2023 04:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAG-BmoeV6zGZLk53Z6jr2WSr+5wvmo5=YtnLAAUeEkEqn_nf5w@mail.gmail.com>
 <20231031000413.GE12764@pendragon.ideasonboard.com>
In-Reply-To: <20231031000413.GE12764@pendragon.ideasonboard.com>
From:   Ghanshyam Agrawal <ghanshyam1898@gmail.com>
Date:   Tue, 31 Oct 2023 16:45:05 +0530
Message-ID: <CAG-BmodLdbt9dNnPtNBv6BmnyXXYRPX1qwrJq=m2Y48hN0XC7g@mail.gmail.com>
Subject: Re: Need some guidance working on a TODO item
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 31, 2023 at 5:34=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello Ghanshyam,
>
> CC'ing the linux-media mailing list, to let other developers chime in as
> well.
>
> On Sat, Oct 28, 2023 at 04:07:03PM +0530, Ghanshyam Agrawal wrote:
> > Hello Laurent,
> >
> > Line 90 in file "drivers/media/usb/uvc/uvcvideo.h" in linux_mainline tr=
ee
> > states
> >
> > /*
> >  * TODO: Put the most frequently accessed fields at the beginning of
> >  * structures to maximize cache efficiency.
> >  */
> >
> > I am working on this todo item. Can you please guide me regarding
> >
> > 1. How can I find the number of accesses of each of the fields?
>
> By reading through the code :-) It may be possible to instrument that,
> but I have no idea how.
>
> > 2. How can I find out the cache efficiency?
>
> Do you know how caches work ?
>
> > 3. When we say cache, which cache are we talking about?
>
> The CPU caches, any level.
>
> --
> Regards,
>
> Laurent Pinchart

Hello Laurent,

Thanks for your email. I will read the code and figure out which
fields are accessed more frequently. I do have an understanding of the
caching mechanism; and as you mentioned "cpu caches", I will find out
the efficiency accordingly.

Thanks again. I appreciate your response.

Regards,
Ghanshyam Agrawal
