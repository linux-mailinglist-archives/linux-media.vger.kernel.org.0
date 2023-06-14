Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1979C730900
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 22:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236144AbjFNUNw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 16:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235501AbjFNUNv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 16:13:51 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E470A2122
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 13:13:49 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-62de0ed7462so19630076d6.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 13:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686773629; x=1689365629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVJU5OtSAcksA1umrjt3N1MyY1f7/3vSSbSar43+efs=;
        b=XZh9jdFAmhBYcZ8gAd8uAcxBP8bOpIdJf6rMNkOzkp7hnLBgCkRV0a7RR5KX3xgmhn
         3gaTj6uumlW5vZ+M4Rxibm/X6pq6DRKsJH05lMKqgsJkizpZuimfx03inU1Nwq03gHcn
         fpKNpQkYt8Qeb9yGILYXann4Taelwai12mpOk4TR+SIEJM/kTmgImbRIgEAzSwNkH77o
         R7S7USBudkB9ZLhUVd4BITzbOt2sLrnkUdAOsFJIklhq/LnljmDRDSM/CL9DcB9ZFtgd
         03jxxNLMGRy/FTXJa1YwVyZhXu0woX/MSfx6KaYpGd2gMG3T+WRIS0zi/UDWzcrXXyPa
         zrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686773629; x=1689365629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVJU5OtSAcksA1umrjt3N1MyY1f7/3vSSbSar43+efs=;
        b=E3y7LpwSvQPsjrOxHXxmlEw7c0a24cp95iv9s/7rzl/9Yo91oPtaaksi01LohE8K9S
         3HsjjO71VsIcjaXn2ohuuTQf3Z4QlbFoxAWV15nfXjAPtVB/w3l6Vq06QnMuPe7nsOm5
         fqbxsuiX0clKEh2RZOGyD6+Hhci9MYNLAGFf3pGkSBoIuTdgugB5lpdMFmVp1QFkpycQ
         2+Y+o8/BEUheh9E8DcXChMCQUCMgfrpmkcMY9U2dWxq+YfNajkQ2o88pseFiFuE4XE0V
         Ux/2pfXmJMs4Z4MNgCG+iU1tJgbfLUy/YfeG3i4zgRVEIS0dnnXPEj9m/a75UWDumb7U
         RH6A==
X-Gm-Message-State: AC+VfDxRZsC0DOW27ElYcmq79hd2gEXGjjqB4kOa/mhjbBtbxryE6Dnr
        NOIVfEJ6SwhdyZStD6c1gZOUBJVVlQiOYDpj6xRDWKjWvsg=
X-Google-Smtp-Source: ACHHUZ7fsBJAYyu2q33oVZM+iVXZvn3pFbzMmU3Fu2tVMh607FqJxJTYmdJV3sy3VSVVNldebVGlH/j8Z+6RMr2Ean0=
X-Received: by 2002:a05:6214:d0b:b0:625:aa49:19ec with SMTP id
 11-20020a0562140d0b00b00625aa4919ecmr17046554qvh.57.1686773628987; Wed, 14
 Jun 2023 13:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230614192343.57280-1-hdegoede@redhat.com> <20230614192343.57280-3-hdegoede@redhat.com>
In-Reply-To: <20230614192343.57280-3-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 14 Jun 2023 23:13:13 +0300
Message-ID: <CAHp75VdJd_2Wo06cyGgHDr9B+V9kV56oHWpc_EcUHeFSiFfMeA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] media: ov5693: Convert to new CCI register access helpers
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
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

On Wed, Jun 14, 2023 at 10:24=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> Use the new comon CCI register access helpers to replace the private
> register access helpers in the ov5693 driver.

...

>  struct ov5693_device {
>         struct i2c_client *client;
>         struct device *dev;
> +       struct regmap *regmap;

I forgot what the conclusion was regarding this. Now we have a client
(which embeds the struct device), struct device pointer (is it the
same device?), and now regmap, associated with (yet another?) struct
device.

>         } ctrls;
>  };



--
With Best Regards,
Andy Shevchenko
