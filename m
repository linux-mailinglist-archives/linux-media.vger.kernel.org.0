Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD2277133FF
	for <lists+linux-media@lfdr.de>; Sat, 27 May 2023 12:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbjE0K0o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 May 2023 06:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbjE0K0n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 May 2023 06:26:43 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A7BB10A
        for <linux-media@vger.kernel.org>; Sat, 27 May 2023 03:26:39 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-62614a1dd47so490916d6.2
        for <linux-media@vger.kernel.org>; Sat, 27 May 2023 03:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685183198; x=1687775198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1/AcRXeVao/wwJt5rTG3N1RcEL2uWTIWvqLQcGfLUU=;
        b=d8in5bpA23yjI5Z1PU6N01b8p3a59z9Xr4SejTnF0QTg41GTNn4ynvIaOsbSFIXWKW
         mkjklpNwtDSvc6c4PVJFWFNzNhbEXpHN0WBBVozNgeokGogmZs938dXNQ1GnMjOnShtK
         QaixRTiOusvzFISFZCWeiuDS+23nUXucn31OEIe2ypxiJpMpzn/2fITtHialSr7kwb4i
         dEuL7Vthaxfr6ihvRNXUohHRPeHRUhOiSOE0WUXf28OS/r07V4CQTWDavv4OefcPmios
         6oAgyIYi3+wgL+/5B763TmtoyCmKnZWa9iV/JPrsH8kvY3KtNZTY1ccOaIouyj2sJ1ai
         HYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685183198; x=1687775198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1/AcRXeVao/wwJt5rTG3N1RcEL2uWTIWvqLQcGfLUU=;
        b=ET6CSrb2pBxp+xlSfOWYrpfLb2+AKu/RkFI42nbgxnDMGyzL1oyHjOfVdY+dFH6fSg
         safSPMciEVwk/vckQbI+3MWnyYfvtuMBXIlwTjieu/I5CVCr+mmVjMjlarQGyZkdaVgY
         BAQbfYWBtjeeigNMWkgC4RxG409TqxuS3h3GefeaIn7OJKecLfuYy+oiGN/9l/v3PzTV
         eDlwa5/dcdzkdpHOZA0w4X2eeaQJVuGrwwxJnmDfOcNbvX2VvvmDtJFoMD7e/rLY8RWG
         EyAIzcrBaPdn6cYsogW+Cn8i7+O917+IN9ShC2JBwff8rx+1FCfae8eoujqgMgTJ2xCW
         YATQ==
X-Gm-Message-State: AC+VfDw5U4+uywHU4bpaYRBk/wXM1JDDs9ws0QrsafHB50YYBNPZQb+A
        CpeZoAXuO0U5VORdC4toIFA8zdwrUzCr8Lpbozw=
X-Google-Smtp-Source: ACHHUZ63To6LhEdRSBsxtOJ5GSsFFkAdBEhL0lh12kFmlNVDppyXhQk/DTeZ7LLLtJAUXr1fsQ2MBbVr9BLHizECc5A=
X-Received: by 2002:a05:6214:21ac:b0:623:a5d0:1daf with SMTP id
 t12-20020a05621421ac00b00623a5d01dafmr3830230qvc.48.1685183198108; Sat, 27
 May 2023 03:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230525190100.130010-1-hdegoede@redhat.com> <20230525190100.130010-2-hdegoede@redhat.com>
 <CAHp75Vd1ijQM7b8Z2ip3TXJyuhQJfAqk0MNBVW-Q-ooi_-dBHw@mail.gmail.com> <c53ec167-9211-9d27-db06-f4b2db5f258d@redhat.com>
In-Reply-To: <c53ec167-9211-9d27-db06-f4b2db5f258d@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 27 May 2023 13:26:02 +0300
Message-ID: <CAHp75Vf9SsjYAH+jBhMQ4+MOvrs4zB1HZEWjK4XK5vGKV+39Xw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] media: atomisp: Add support for v4l2-async sensor registration
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        Dan Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
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

On Sat, May 27, 2023 at 12:25=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
> On 5/26/23 22:30, Andy Shevchenko wrote:
> > On Thu, May 25, 2023 at 10:01=E2=80=AFPM Hans de Goede <hdegoede@redhat=
.com> wrote:

...

> > Besides that since we have a handle, wouldn't it be better to use
> > acpi_handle_info() here?
>
> Yes since we are purely dealing with ACPI / fwnode stuff here using
> that would make more sense. I'll switch to that.
>
> I also agree with all your other remarks and I'll fix them all up
> (and test things again) before merging.
>
> Andy, may I add your Reviewed-by to this patch too after fixing
> up all your remarks ?

Sure, go ahead!

--=20
With Best Regards,
Andy Shevchenko
