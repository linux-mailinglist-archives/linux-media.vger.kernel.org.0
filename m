Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6DF5AAB39
	for <lists+linux-media@lfdr.de>; Fri,  2 Sep 2022 11:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235909AbiIBJRu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Sep 2022 05:17:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236155AbiIBJRh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Sep 2022 05:17:37 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC87CB5E9
        for <linux-media@vger.kernel.org>; Fri,  2 Sep 2022 02:17:24 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id kh8so993863qvb.1
        for <linux-media@vger.kernel.org>; Fri, 02 Sep 2022 02:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=/CLXWmHJ6o9GzTXfwc4vxGDnhRk54atQzmIaN3qEtc0=;
        b=aiIg2vwbq2lYIKYezPqVtu82cVFAflPM/AJvaecG7SjIjW47CEmtN0mKeB5FJVc8U+
         0uoMOLVQPgdajPi3JXK8V1rfYJtEYN2lDMRPcHlczMX/9J92/CqVnDKG3Lc3GWe2W+SP
         5sXhtTOVNCl0ol2KLiJtRCWSV3R+4/gZlYJNgLTrxPtHAB/33U2Toaq7X/bOaB0bdurA
         cIu6aeOqDCX9j+ufN+tw6aWRdnmslF1YaRqCU+CF/wzBrN6Nm0it0R+EdvHx9Mcr9YkY
         Y9/cu23Gc0oXEkGdnvSiskLRf03TUJS5kZuGc2amvVh6BWp0AwzvYADGZLhAVWaLfraN
         UcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=/CLXWmHJ6o9GzTXfwc4vxGDnhRk54atQzmIaN3qEtc0=;
        b=qfKKjyKGhdzqQrBRAAarR8tiRU2y9sDMvBIruCN+RVa8DnEuvvNc3XIMZfWcKb5c4V
         n1ouQ3NFSwzFO8zfqTOo0/v5GWRP0a4jdfVBj4f+mNszfsBjWDUL48zhppxvlRF4Ycbu
         BpCEZ4yGbMFfWPW0ot7caOOnYmsSmXv4yPLtc/bJKSJ+BRk4v4Glr2VfDsGkymtJ1Sp3
         kikfzW9OD3ra8D92cYU1JsjZ9Pmft3QX3/XpA0p+CbHC3h9LeYRgysmeOSBOjjl9DVEX
         At6BTMHn/N+LdYyN9lsfHQgNcbwD8gZ6iVTBFsbc6L29pl1f1Wr9QlSQZN9jyhA0xV/G
         WdjA==
X-Gm-Message-State: ACgBeo0pTzntDp9PFQxUIURjIBsM8OTU9a0Io98hfunckYDCjDlly2aL
        lwVAbaNLMe7NWSC2lalH3klazSWWPYX/Q6MYTrU=
X-Google-Smtp-Source: AA6agR6n+ip7Pg5zxgzqYVXK1CtYlEVqQcso0bP3IxjZNKJDKSmoWhcJyeToQ4D2ZC0zNjgaWXYWS5A2BMx4I4gcuEU=
X-Received: by 2002:a05:6214:27ca:b0:499:95f:6379 with SMTP id
 ge10-20020a05621427ca00b00499095f6379mr18910465qvb.82.1662110240626; Fri, 02
 Sep 2022 02:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220901094626.11513-1-hdegoede@redhat.com> <20220901094626.11513-11-hdegoede@redhat.com>
 <YxEOhy0YPnBuZiQs@smile.fi.intel.com> <ce0d2ec6-3ec7-9f9f-59f9-0bf2a6078c9c@redhat.com>
 <CAHp75Vf=_2yJdPvpkx2iYoYOPzxf6sNMBD4EizYc1WAnFMWYtg@mail.gmail.com>
In-Reply-To: <CAHp75Vf=_2yJdPvpkx2iYoYOPzxf6sNMBD4EizYc1WAnFMWYtg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 2 Sep 2022 12:16:44 +0300
Message-ID: <CAHp75Ve4hUKd4me8tgG+tc4sO4f5wyoLOFMrxH9iC1p2x=RS8Q@mail.gmail.com>
Subject: Re: [PATCH 10/14] media: atomisp: Register /dev/* nodes at the end of atomisp_pci_probe()
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 2, 2022 at 12:10 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Sep 2, 2022 at 12:04 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > On 9/1/22 21:56, Andy Shevchenko wrote:
> > > On Thu, Sep 01, 2022 at 11:46:22AM +0200, Hans de Goede wrote:
>
> ...
>
> > >>                      for (; i > 0; i--)
> > >>                              atomisp_subdev_unregister_entities(
> > >>                                  &isp->asd[i - 1]);
> > >
> > > This...
> >
> > I presume you mean the few lines above that actually:
>
> No, I cited a not modified code in the upper part. That said, it's a
> remark for further improvements, but a helper can be introduced in
> this patch due to the below part.
>
> > >> +    for (i = 0; i < isp->num_of_streams; i++) {
> > >> +            err = atomisp_subdev_register_video_nodes(&isp->asd[i], &isp->v4l2_dev);
> > >> +            if (err)
> > >> +                    return err;
> > >> +    }
> > >
> > > ...and this looks like a dup.

Pushed "enter" too early to send.
But with your explanation I see the difference now.

-- 
With Best Regards,
Andy Shevchenko
