Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6867D4DD4E2
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 07:51:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232795AbiCRGs7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 02:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232785AbiCRGs4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 02:48:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 497A72B7202
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 23:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647586056;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=I3lYvZeJcpFfGGlJYFnn0VDJIi283PypPxo2EohREtU=;
        b=E7vHFeEFosdJ3cEWlgaMewZkbFxA8CoCY52OuTCPfJ8/Xudxp8AHoVRo7ZamSfllZvRXuN
        oEcEzj8uSytSWpYPaOrr5l0YkJJLb2MqZS9tmYu0WMi7O/hZwJ54yQPMJySf7tGQF+kSxG
        Cjdsqzn4H1pIlSXu0uL6C1pb5OxMzrY=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-j6zOf4pvMe2FwV_zOFayXA-1; Fri, 18 Mar 2022 02:47:35 -0400
X-MC-Unique: j6zOf4pvMe2FwV_zOFayXA-1
Received: by mail-lj1-f200.google.com with SMTP id 76-20020a2e054f000000b00249606fea4fso1765919ljf.19
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 23:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I3lYvZeJcpFfGGlJYFnn0VDJIi283PypPxo2EohREtU=;
        b=bLpsczC072iqokVgtqTpdD9EN2ZzLSsgTaUx21p274ficgzM9K6I4w6ojh2TYJfFbN
         aUvMF8V86KDog59Sbr3UAZb/GOesRFFlYrlwFb22D8Rvd8yHcBayzd04dg1WgmjfDZiv
         Wu02eC8ZI0ts/z5sK7kj5qkJxoE+LeiqK44TeKMWciQ1REnwIbv7CPKvs2LJl6XtbPUq
         +qlGnEaYjqFNT4tlw+r//+5jYH17Xumruseu3UWc44++SHEygWSVzoyFIZJtpF8xClLJ
         ZWqTx7EpSiAbjJUbeirUJDD9df5BKxR+ewUriL6F/eZx2R8gPEshV/lhsaHiMCVfGqFP
         vApA==
X-Gm-Message-State: AOAM533sNtfOWYJA7MwUIj0wv3oI9zHq27SpqjyIgoF8p/ngJBXIycjO
        PkWVL6weCYKFVHbF0RLZLFWyH9DjYBqSzObo4NrnfmgBsWAEFcIqW1pqnwKZHCYOWk6ZPzoBwTT
        JHw7XIAxpEn2d1CUmvBSrxjzpkqAeeBtYTJLzfLY=
X-Received: by 2002:a05:651c:1542:b0:246:36c:8d1f with SMTP id y2-20020a05651c154200b00246036c8d1fmr5344720ljp.311.1647586053382;
        Thu, 17 Mar 2022 23:47:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0I/xHSd8pqwSVkxR1iXkhf+tY1ZEwHylqHNX4opihknbprFolc447b2KSlP6xQEh9ImWdTxXmczEnwgkljXo=
X-Received: by 2002:a05:651c:1542:b0:246:36c:8d1f with SMTP id
 y2-20020a05651c154200b00246036c8d1fmr5344701ljp.311.1647586053120; Thu, 17
 Mar 2022 23:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220317075713.10633-1-hpa@redhat.com> <YjLxFuRXKzg3m9HH@paasikivi.fi.intel.com>
 <CAEth8oHqSS7EsPofmERRB=pmtS8YPP+MeM6fMG6tJT2z_qChxA@mail.gmail.com> <YjL6/wOVjSvZjSZ5@paasikivi.fi.intel.com>
In-Reply-To: <YjL6/wOVjSvZjSZ5@paasikivi.fi.intel.com>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Fri, 18 Mar 2022 14:47:22 +0800
Message-ID: <CAEth8oES8abPO4p7eFv43PwDXuxeOmg1661YtVvykBPrkagzKg@mail.gmail.com>
Subject: Re: [PATCH v4] staging: media: ipu3: Fix AF x_start position when
 rightmost stripe is used
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Hans De Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Mar 17, 2022 at 5:10 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Thu, Mar 17, 2022 at 04:53:07PM +0800, Kate Hsuan wrote:
> > Hi Sakari,
> >
> > On Thu, Mar 17, 2022 at 4:28 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > On Thu, Mar 17, 2022 at 03:57:13PM +0800, Kate Hsuan wrote:
> > > > For the AF configuration, if the rightmost stripe is used, the AF scene
> > > > will be at the incorrect location of the sensor.
> > > >
> > > > The AF coordinate may be set to the right part of the sensor. This
> > > > configuration would lead to x_start being greater than the
> > > > down_scaled_stripes offset and the leftmost stripe would be disabled
> > > > and only the rightmost stripe is used to control the AF coordinate. If
> > > > the x_start doesn't perform any adjustments, the AF coordinate will be
> > > > at the wrong place of the sensor since down_scaled_stripes offset
> > > > would be the new zero of the coordinate system.
> > > >
> > > > In this patch, if only the rightmost stripe is used, x_start should
> > > > minus down_scaled_stripes offset to maintain its correctness of AF
> > > > scene coordinate.
> > > >
> > > > Changes in v2:
> > > > 1. Remove the setting of the first stripe.
> > > >
> > > > Changes in v4:
> > > > 1. x_start is estimated based on the method for both stripes are enabled.
> > > > 2. x_end is estimated based on the width.
> > >
> > > Please put the changelog before '---' line. I've removed it from the commit
> > > message this time.
>
> I meant to say after. Then it won't be part of the commit message.

Thank you. I understand :)

>
> > >
> > > --
> > > Sakari Ailus
> > >
> >
> > Okay, I got it.
> >
> > Thank you.
> >
> > --
> > BR,
> > Kate
> >
>
> --
> Sakari Ailus
>


-- 
BR,
Kate

