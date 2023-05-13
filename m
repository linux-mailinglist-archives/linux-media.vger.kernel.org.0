Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49EFA701805
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 17:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239345AbjEMPVk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 11:21:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbjEMPVj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 11:21:39 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB4EB2707
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 08:21:38 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-61b6a4233a1so97318626d6.1
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 08:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683991298; x=1686583298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlbHORrublJdomHZWC4ReH7UCsQlw5QYjaipc7qMZLE=;
        b=hZNhfcxaRycVWd4dh2+vKNsErLXCwcxss6xkwFanQ+IPax0sZJ1AhwGGS7K3kI1kFj
         GdzmYU4xBe8zzWtRlHmC6GRd3pUHwBoZl6Tk37U5AuMMGQZjs7x+2yG1NueijTO3jS+k
         ybegbrSZEaW4F3VI7YIJg/IaHfVcDMC8z0iIsNsRdRsZz5VKSbJhOxCC6EXCKCb71dZC
         HLlnXQj+3MPrzW2EHBIf4EFC2adfu6z2ZStvrmFtaYXO1yjcJMvFvey7CnzHoja31Pjk
         1+dFFFLZiUpCJdBhJwKZqq+vax4wT0OTBFiaWPhFUEohfin1UCm6jvN5t0VeYS85ovD8
         r0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683991298; x=1686583298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RlbHORrublJdomHZWC4ReH7UCsQlw5QYjaipc7qMZLE=;
        b=SrqoOKmdzXhjtlEwe3soOdvz/Nh0Jv0toSGYOcnj0WXuD6y+GvAh13cTcKxa0usZfh
         qoOmaAAHsjiAhahouuncwjAhikmhJcfi3605w5ReM20YNZEGmXosn8ktosCp4Rh5iKBP
         rezjxGQVhZUM+btdGrMvtQbMDXaItI59V2EgEE2gEIFVKYAn3mHaX0o2iYo5y8Zz3gZZ
         FTDxFIgCs23xN+p1ndcrVq9nX8qjpcJXoHwdOgDB3U8cKDDx+hnFaWm79ffT5tT1keZB
         hzDL+ZByElywBYky71LzNIn8ajp+8vcl0O5uuT2fYUhc3u/2tfe4W9UbHruWbWhqlfxP
         SMJw==
X-Gm-Message-State: AC+VfDyg9NdgLuDofz2zzJYjhGBJ6XxZiUOn/T3RpdregUk9V3exgmzu
        kGI8RcaXMsqA6vf13Q8jYQvnSNJhGG29LvhYzIM=
X-Google-Smtp-Source: ACHHUZ6KW4VaT0yVq42X4N1BvkkS89YMr5Sbvn+34RneUevxooOOWQtooFefYw0dVMPX/0CoZ8a29ZNJ4+SN3wWlANs=
X-Received: by 2002:a05:6214:f2a:b0:61b:3557:a699 with SMTP id
 iw10-20020a0562140f2a00b0061b3557a699mr50323380qvb.9.1683991297997; Sat, 13
 May 2023 08:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230513123159.33234-1-hdegoede@redhat.com> <20230513123159.33234-14-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-14-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 13 May 2023 18:21:02 +0300
Message-ID: <CAHp75VcdMvgkn081N1io5UDDeCxx+fv_X6UxQ=XOZxKW8Xj89A@mail.gmail.com>
Subject: Re: [PATCH 13/30] media: atomisp: Remove unused mipi_frame_size field
 from atomisp_[sub_]device
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

On Sat, May 13, 2023 at 3:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Both the atomisp_device and the atomisp_sub_device structs have
> an used mipi_frame_size field, remove the field from both.

I am confused. Perhaps 'an unused'?

--=20
With Best Regards,
Andy Shevchenko
