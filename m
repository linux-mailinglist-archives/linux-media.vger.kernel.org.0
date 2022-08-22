Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A978A59BFF2
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 14:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234702AbiHVM6U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 08:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234705AbiHVM6T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 08:58:19 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D69E12
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 05:58:18 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id j1so8000782qvv.8
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 05:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Ytt75Rwl5ykbAZeDOlwL77SmXTm3rgZOkXBD2cpJoDg=;
        b=QuOCFXUkEEGKV5452uivChgBrRmCIY7lxxC83ObtIaS9h62yRcpNfwWi2hFpCvB5K9
         +jNfa34KqOdwcsrWoNGvaO61ThhXWnCC1ET1UePyBGqV8R16w0CrJrEv9Dwe33JpVX5F
         lG+/AcCqkQZ6YlU8EoEIQo1Q54f2lusOmne//tUfnpdYJfWOlqqFAdrdRpfB8pKUCT1k
         1jfVSFY83GlBzVmEAEBxLv+STPAtlVS0PBpdMXDlsBLnFjxT0n2sr2INclJIqQJKdPuq
         iFWUbp8DvCBwWht8kHWlUHz+9OqVAFMk1I62CK301pwk3lZ1T6/rvMGHvJwwlh5LUZOA
         4vyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Ytt75Rwl5ykbAZeDOlwL77SmXTm3rgZOkXBD2cpJoDg=;
        b=r3xabGD0sz1e2wZuyMNdl6Nub+qyTrQ3cw3tAbftLt3MGRKJxaRtQGrR9lYoCAqG0k
         lSvUIMZbfNuKA4BxCP5qm1YZESZZG/Zn0iiAamccKb5ofGbSgv5/K9g765ooNKgOI9gF
         PPzw4rszb8R6yPFbCOGZccEysfnR3o6xJOpKpq+UR35algXpnaI6gj1qKaw5IbWU7OE3
         vkCQJWg7SuiiR/ewWMaJm1UKf+qMo8lQTyU062rXJOWUubjuH3GbdNB3DPFl8OA1YYzl
         S29aipoeC3c1it90hYcEEtfTQjOzAKKgWV9WKeP/svDzFu7GmPa95duUh2XU746RSFX0
         r5LQ==
X-Gm-Message-State: ACgBeo0573GX0e67tO8ZDno7nH5Z7yblbgXOkrmEac6k4s1uTjHXNNrf
        vOEQToL8TormDczWjWQpaUOBuxxM77182xIgwns=
X-Google-Smtp-Source: AA6agR7Fm78HblHKkcPzQbvrAyg0Q05YzFVa2PlSBTZ3DOET3ZVDbg0r/4wNS3m0vPeYS6JnAJZzNOdHBktai6IB+Kw=
X-Received: by 2002:a05:6214:e69:b0:476:b991:586f with SMTP id
 jz9-20020a0562140e6900b00476b991586fmr15175158qvb.48.1661173097078; Mon, 22
 Aug 2022 05:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220821215027.461344-1-hdegoede@redhat.com> <CAHp75VfV-goir434sZfwLhoCZbu48uZ0pcwdjfG7WzX_-eVuPw@mail.gmail.com>
 <3834201e-95a3-02e7-c549-e5630fb64892@redhat.com>
In-Reply-To: <3834201e-95a3-02e7-c549-e5630fb64892@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 22 Aug 2022 15:57:40 +0300
Message-ID: <CAHp75VfxR6zfBzpdnM1RKv-ewnPCMejdLgY2QTnhfZ+sFFqcMA@mail.gmail.com>
Subject: Re: [PATCH 01/13] media: atomisp_gmin_platform: Switch to use acpi_evaluate_dsm_typed()
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

On Mon, Aug 22, 2022 at 11:02 AM Hans de Goede <hdegoede@redhat.com> wrote:
> On 8/22/22 00:31, Andy Shevchenko wrote:

...

> So let me add that here, then patchwork should pick it up:
>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

You may also add
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
to all patches, but the 1st (it has already SoB) and commented ones,
which I'm going to do soon.

-- 
With Best Regards,
Andy Shevchenko
