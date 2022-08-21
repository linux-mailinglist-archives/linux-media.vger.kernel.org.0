Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2395359B69F
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 00:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbiHUWbn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Aug 2022 18:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231794AbiHUWbl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Aug 2022 18:31:41 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D216E14006
        for <linux-media@vger.kernel.org>; Sun, 21 Aug 2022 15:31:40 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id e28so6784480qts.1
        for <linux-media@vger.kernel.org>; Sun, 21 Aug 2022 15:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Yfw41fmb8ssEMetDDULZUKd7Wm7Zql11UKGR4BBlYBQ=;
        b=LEkPMcVDQgI85iiHOx5gvDrs3ze5MFqKJpmdce+kZwUEvYb9imevxUG50XGCGfI1+z
         T6EnG54CgaNFq+QZZv2jYy8ymr7/EFASN53c2H0fqFQ+zC0aE+gMJT8/1fWv8E6mBcyy
         pZ0n6N4F5aDz0sO8oCEEZqxB+ELDv5xzBLEBYUbsaS0o5XHo5R5HNKSPuITJZkoGJ6di
         6o9vCjfjb85iO7vNGC2nBi8iq5id6t1njAVWvuhkt1z6MRez2Ysgm1DS/eoyr97nXYT7
         47Wypyk82aUIvK65Fj1K3cb1Fp1HwcS5ISrPt1/08sEVXsuajFZHKDqk9vqjhfk4UIcu
         jsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Yfw41fmb8ssEMetDDULZUKd7Wm7Zql11UKGR4BBlYBQ=;
        b=qY57o8S86uxe2Jxm+X7DKCM3bmWM3ziA29nMDsV84mKnqz2K6PSuswE0jY0pB17HpC
         RIcMvVQRU+7vAb1TBwsZoW8dI/X7+E9FDlt7MADPQuU1FxYN8q//uyiQh0DsmasHXcBj
         Uotd+p0HyfIczn8+/jRAQAx/4prg2z45Dk5aieac8AZgha1kz4zoD4qshCwEVVKIu3gO
         k3nbnqRdCsMmitNEnrOLFG36BcXfbPX5ac3TYOodnL9R3dP8zkM2CHr8AjiG23YAinO2
         ugqGJV9tzQG/+aed8mAbd/mXSU5MqKI6LCI07xs6CK1HQQPC4Fs7XQ+y3puqu2CgiUhS
         G7pQ==
X-Gm-Message-State: ACgBeo2L1GWVdI2RmCZ+7RBed/rnz54SD0IhR5OPGAPgqEHK/miJD7CR
        csL96+N9BuH5OBNcA81Y4K4Aizqvsv7+wIEinrxixf8U
X-Google-Smtp-Source: AA6agR7dRt+pDpJFWqWVAHMZqTdHTZW31Yvvt3MLriJrTSvicfLxDrEHIMQXUvmeyFFXjYh7J6Fbkxxlm9NH5Hk57GU=
X-Received: by 2002:ac8:7f92:0:b0:344:8cd8:59a1 with SMTP id
 z18-20020ac87f92000000b003448cd859a1mr13938231qtj.384.1661121099840; Sun, 21
 Aug 2022 15:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220821215027.461344-1-hdegoede@redhat.com>
In-Reply-To: <20220821215027.461344-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 22 Aug 2022 01:31:03 +0300
Message-ID: <CAHp75VfV-goir434sZfwLhoCZbu48uZ0pcwdjfG7WzX_-eVuPw@mail.gmail.com>
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

On Mon, Aug 22, 2022 at 12:50 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> The acpi_evaluate_dsm_typed() provides a way to check the type of the
> object evaluated by _DSM call. Use it instead of open coded variant.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Link: https://lore.kernel.org/r/20220730155905.90091-1-andriy.shevchenko@linux.intel.com
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Thanks!
I believe the v2 of this patch (when it was sent standalone) has been
Acked by Sakari. But I might be wrong.

-- 
With Best Regards,
Andy Shevchenko
