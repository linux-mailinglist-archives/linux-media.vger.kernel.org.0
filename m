Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8594859CAD6
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 23:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237690AbiHVV2x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 17:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238106AbiHVV2u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 17:28:50 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F4F1CB3D
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 14:28:49 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id h21so8995628qta.3
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 14:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=f34TFr5Ae5xpGEjfAgL6FehCM9KIFQVhi5IFiIsBdh8=;
        b=OiOyhJRV6GFFoPnofUHAq9baVlTaCIqEalEY0MaVIGmx+Q+Pb4LYp9PqeTBozMDrG+
         95EGF5nxc2sv6af8sC8z1EjUHlJ0EBr4Gj+qndOUfb61RWSRjgXh03GQKLKdjdpExS2g
         5hNkgp1ipofgSzyNmHXYJC06Vk/sem1V5AOde+asMHIHCwhvOcaEf0CZu407Ksz+1Cj7
         WKTuzaQ+X88Kse5zqXNgVEdjseIYNRl/wQw8DGJzMEajF7itYAyab6A1tCdNpG5smJC5
         FxWJcjC1SLWhrjChk93i+4b8Dz8BNuar9Xcv3MMixZ05CWu3FFDWcEBuf37rBpydeAwc
         1r9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=f34TFr5Ae5xpGEjfAgL6FehCM9KIFQVhi5IFiIsBdh8=;
        b=CRX3KZoEWOdYAgcWIfzGaKrUSM6Z+WvQVhW9nUOBli7R/hbkO4rC2WPbpDK5IaPxCy
         7i+Pidqk3VYmklgPAQCBfF044RxPnKlN4ipMMP6JFXzsgHILK5NN4wLg1cSTOKaYC4Oj
         A6admpnqlJVL/AkWFXzTdjRiY+pav6KLetm0dj2/J28/T9SytKxRCxlTLo/Ibp2fCtwH
         OIOkC1KIFsbW7m4CwRlFHUZGe1DQnTG96m2cD6BuOFNNlPhfxsBfOGn2kBb0ttTL613w
         l9ZhLTuIgWEugS4yT8e6ZkVqKc1q7BVVeoJw9jPCVG0AWwzkI+h6GD75bNlUaoydymFB
         WEfQ==
X-Gm-Message-State: ACgBeo262IkS+Dc4Ic3aAJILc3MWjGyZQGAfi3Z/j9ZFgwHrfUFDawZm
        E0J4s5YxnoKigeLeUjciKhsY+1ZF4Z2FFYZNRmE1gvJhs/cMFg==
X-Google-Smtp-Source: AA6agR6YMiuwli8fBoHyF3B7UP0b5x+qzSPFzq+lT+g3YpsAGBlPZegL+g/B8YwyvMYU+TjkM3Ytqz0btLPehuQh/dg=
X-Received: by 2002:ac8:7dd0:0:b0:344:afc1:b11d with SMTP id
 c16-20020ac87dd0000000b00344afc1b11dmr8568600qte.195.1661203728626; Mon, 22
 Aug 2022 14:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220822150610.45186-1-hdegoede@redhat.com>
In-Reply-To: <20220822150610.45186-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 23 Aug 2022 00:28:12 +0300
Message-ID: <CAHp75Vd2KPjKo1QXaZ4pHr4400Rw2yQFrWJuAOLge9=gbo=RqA@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] media: atomisp_gmin_platform: Switch to use acpi_evaluate_dsm_typed()
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

On Mon, Aug 22, 2022 at 6:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> The acpi_evaluate_dsm_typed() provides a way to check the type of the
> object evaluated by _DSM call. Use it instead of open coded variant.

of an open

...

Hmm... I thought I gave the Rb tag for patches 2-11.
In this version patches 12 and 13 also look good to me.

-- 
With Best Regards,
Andy Shevchenko
