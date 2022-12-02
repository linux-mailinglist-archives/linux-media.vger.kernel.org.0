Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC8064063B
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 12:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbiLBL47 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 06:56:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233455AbiLBL4d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 06:56:33 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9783B9D2DE;
        Fri,  2 Dec 2022 03:54:39 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id c15so4694503qtw.8;
        Fri, 02 Dec 2022 03:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XgHCzcC5d7qS57o1gfNok/NTihAQ6y4pJK23YU0u878=;
        b=SnCyUUFR64/uGgQ7QRhnXV4psv13Gf3pxuuylkB8d/OWNL6ZKqrFWEZ50KUWL0067u
         0nIVHn/9WgaGGmCFsMqlThiHFa8pVLtpQrirw25V1shhpGdNISEkipAnccBLdnqLeyJw
         m5OLd9wfBaoYwa8oPbO4f0zzraegGYBX6iPqy3kW5YPFJHL+h3qIbBq7TPWy5yP2qjws
         SsGW7NhtXia7Uq/TMLu+r8Ne/5cBdzPqXLSQ91YHvNwgiUfiTyBZ/smk76Sdl6wosIJD
         LcTA6XIbVjbLJYJ2760r6jHvZknZaYgFeKuaUURQxUcTiibkBrdcVa+fv7Amnzm/tWHK
         WEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XgHCzcC5d7qS57o1gfNok/NTihAQ6y4pJK23YU0u878=;
        b=zqYDuaKGTFUbQBBW3qBcfswUWx6OcXJ3Y/lqQ8r22Ojz9mThin4Pskaw5AGAyJY232
         gVK+wjg27+c0NAVgMpfm0N64z+Vl6Tg7jrg1wPaoDzOHfQJNaW4WG++HF0eDwVMs1qi6
         bqXkZ4iMyN4Okd+bwu3pdDXO1dCxCHy8ysOJeNqb5dx+1GWq8zJ5ZXJiN8++N3JjAc9K
         yrM7Mp/U5LQ2DlmNf67rB5LCdvP2lfjE3lYBgFdEMmL9+ZJW6YPkW91kNN6pdXwIJRg8
         pwQUcvzd9zphLg2fiN+NH/h4pgnprY4yCrz1mXDiE4e5YEPzIO0uk6Lf3bIG9PkbhE/i
         VOSw==
X-Gm-Message-State: ANoB5pnlIAQj/mikOeU0r1H4QfM1KTHg5usyJz/oJ0A6a2LsS8ZU9qTL
        sehDY6X0kN4aD/311QeI9G6G2yILqkRFGPblzZc=
X-Google-Smtp-Source: AA0mqf7svM7JfkNI1fzDADOZorHvTQ1JpJR2LThz3gAj+G04xC/mYpgPxrQhStJ0wzyHY+doiuAdMVl0BOKEJxBNhIs=
X-Received: by 2002:a05:620a:2053:b0:6fc:abc1:d154 with SMTP id
 d19-20020a05620a205300b006fcabc1d154mr4458817qka.320.1669982071728; Fri, 02
 Dec 2022 03:54:31 -0800 (PST)
MIME-Version: 1.0
References: <20221129231149.697154-1-hdegoede@redhat.com> <20221129231149.697154-2-hdegoede@redhat.com>
 <Y4ddgnRbRyUDSPFI@paasikivi.fi.intel.com> <ad9d01b6-de08-b54c-d300-cf133df90536@redhat.com>
 <Y4duQpP/GrfFQkwS@paasikivi.fi.intel.com> <fef2a014-1ef9-049a-2516-539ea14abdac@redhat.com>
 <Y4nZUpGvtKMpxrDR@pendragon.ideasonboard.com> <29b30a50-0fc1-e185-c79b-10856a80bceb@redhat.com>
 <Y4nmZND8Mm89X0Y/@pendragon.ideasonboard.com>
In-Reply-To: <Y4nmZND8Mm89X0Y/@pendragon.ideasonboard.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 2 Dec 2022 13:53:55 +0200
Message-ID: <CAHp75VeN_2TNQfSAji+QN_EpgtVrm2Lxw50mAQkdnLeQPmsp5A@mail.gmail.com>
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

On Fri, Dec 2, 2022 at 1:50 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Dec 02, 2022 at 12:21:12PM +0100, Hans de Goede wrote:
> > On 12/2/22 11:54, Laurent Pinchart wrote:

...

> > Note the need for an index -> name map is standard for all GPIOs
> > on ACPI platforms.
>
> It's funny how ARM platforms were criticized for their need of board
> files, with x86/ACPI being revered as a saint. Now we have DT on ARM and
> x86 needs board files :-)

I believe it's a misunderstanding here due to missing words at Hans'
statement, i..e.
"..., which do not provide the descriptions in _DSD() method."

So, no, x86 does not need board files generally speaking. The problem
here is some departments of some big companies that didn't get ACPI
properly or at all.

-- 
With Best Regards,
Andy Shevchenko
