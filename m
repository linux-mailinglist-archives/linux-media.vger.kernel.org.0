Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD177085D1
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 18:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjERQTl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 12:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjERQTj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 12:19:39 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B86B310D2
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 09:19:37 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-61b58b6e864so17449106d6.3
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 09:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684426777; x=1687018777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZaRz77dvY95rGot7hMFCJ+qXEhqHS4MvLeBRxNQltM=;
        b=cXv7tNOBBtnVe4PxkM83gtyTa5Bl6w+S2QY5i4qpvqJlW3gyGcfEfVkUZhaKY3inRx
         uMZe2tR9CXblrVDb6ZwD8Hibl4NxK8nkpAmDKXDbYRjXH3+z5eHs2pEi/gFzE+RmLAtM
         9CKuah+4a9hBqRzgS6dgELsQOdYmYX/Vj6Dt6H66qhvz4Xw3B58lsqbtrhv3aC75etNE
         BFo8skAjLqKEjZfHPpFiQL4dC7EWtfg7N8FA0FBzlOYOCiovSrAcT6F+8d1f/iadT93c
         ovKGHIBINVwpFbFz1IB5p2C1B8T5zUJRrI35eoBgflYVzQVIytlpoYOCrxzMy/p1uFE6
         AoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426777; x=1687018777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZaRz77dvY95rGot7hMFCJ+qXEhqHS4MvLeBRxNQltM=;
        b=XaOBBiGhfyFrOYhE0r6H/tB8o8DsGiwfeBkAgt4MCaCXwIUlEUwPppH4bPRIr74gst
         odbtib3O/EnLty765mckZQygxQEBMIXuuRGrOh4ug21win7JVzHhLSeiZ/+l3QkakOof
         DwG6leOCEeCQCV+d8bnpo3Gp7agk8bphAxKTkYM/R+VNbGl/HnQH+6rPf1+8rdjyQf3+
         Ououvb+SQiM78N0mRi8usHAcP13cilHYbsWGhVjJcQoKqEREIdTTBoKjWT+2b3cCleSW
         hz1A4dNip92i8wP+CBbxoNCuvRSZsv+83hGFNVNiATO02jWw5WqrD8qJoSNE9WWTiGfL
         UuuA==
X-Gm-Message-State: AC+VfDw2fPnxZJOw8XdY1ps1MBCcu0CprP3FYhj1uiFwFEazS0YFNagU
        yj1HEZzHwZb0CtBakQJSnOhQmb1VR8/kpX2MWac=
X-Google-Smtp-Source: ACHHUZ4AYxDRHsciZTPlwf74kFsjRiLQ3gDlvTLf73gqe8hzqmgJGmKGD4iFKyJM2Ad4e1sV4grVhNW9LH+IfRCN1oc=
X-Received: by 2002:a05:6214:d69:b0:621:2ad5:df74 with SMTP id
 9-20020a0562140d6900b006212ad5df74mr100687qvs.51.1684426776750; Thu, 18 May
 2023 09:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230518153733.195306-1-hdegoede@redhat.com>
In-Reply-To: <20230518153733.195306-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 18 May 2023 19:19:00 +0300
Message-ID: <CAHp75VfLyCG9AX6PhZBUMnxYCDKdnVQzOxtXO+uKgok-PREY0A@mail.gmail.com>
Subject: Re: [PATCH 0/9] media: atomisp: Add support for v4l2-async sensor registration
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
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

On Thu, May 18, 2023 at 6:37=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi All,
>
> I'm quite happy to present this patch series which makes it possible
> to use v4l2-async sensor registration together with the atomisp code :)
>
> This has been tested with both the gc0310 and the ov2680 sensor drivers.
>
> For now it also is still possible to use the old atomisp_gmin_platform
> based sensor drivers. This is mainly intended for testing while moving
> other sensor drivers over to runtime-pm + v4l2-async.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
for non-commented ones or in case you resolve remarks my way.

Definitely this does not apply to patch 9/9 which is WIP and requires
more review, I'm still planning to go through it (not done yet).

--=20
With Best Regards,
Andy Shevchenko
