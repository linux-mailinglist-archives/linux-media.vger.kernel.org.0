Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48BD6708583
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 18:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbjERQC7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 12:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjERQC7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 12:02:59 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D7E9EE
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 09:02:58 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-3f42b4da6e5so10562721cf.2
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 09:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684425777; x=1687017777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOLisQJjbRcDSRA97nJKM/BMoqenM/5IifeJNnHSgD8=;
        b=jqLlediZ3JGzQ5yJlhGvSr5KvxcfHFDPKGj5S6nCGEFZ/myseFfaMALgM0qDIM1n6w
         iEJ1ve4WaI8FgFTyH5Rs2fqRW5dceGuVMC+MhBNt2yhDByAvInpHyv261R00ERskijkT
         2d+KW63Y9zLaolL1cM+mESmPk2QDkA2lpB3vaERjihDmmKorgGqx6/JZA/I5q0lQzQtE
         28Hcul7V2eebBJ69Qhx0oloAfyanu7H5KPY5V7foisqxpE9VYZzkTTt9AURFOnVCfUEe
         1zraetmkJeyppgqfPqLkaZcYujcLTDU0SrU1EDtwWhcfLqhSjtHdGCDS+9ii9MUPhhL6
         OTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684425777; x=1687017777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOLisQJjbRcDSRA97nJKM/BMoqenM/5IifeJNnHSgD8=;
        b=e11MuYjvhhpBt94mVTp82lpveX6VoegDUOuOb76yvdTRIPhypQTltHguYnGR0yZp3h
         QfwiMRc76UPsN0+EC0Vab2QJbMZROJYGjwNXMESvu4LBRkUl/tgJdBjQNX90wDjYm/tv
         dZgI1peJ3+TBfPtxmg8vM144HiXqQpZUf7U4MxVor5mG5sEiV8slN4ACL8RtA7gIYdRb
         O+ztQW9M2UyhQ0nfJs7F2ZJntPXcRs4noVHsTcmRggnZAEWv9jQoCG8gVoBoma5MVGR8
         j04K/rALpRZdWcSPw8KNWiwi7NBzR27zM7u8RSeCXZDXKX0/awpfTtcL3d2C6gJSzEng
         adyQ==
X-Gm-Message-State: AC+VfDzhoWgAqc2bMOtP/XbxRKkJXJi05GrSNKpl//YQq9YDvqmRr+s5
        gWoFXtEzAkWJLc0NXbNXz0LAbFIqlLBDk7OJTSk=
X-Google-Smtp-Source: ACHHUZ6siRdVoKVbwcDOxYidVP+vP1trYj25Q+DQ67Hu09MZWL/4TNolXujjppJbiHl9T74wpDivmIB2Lwvh+hbYJQI=
X-Received: by 2002:a05:622a:1301:b0:3e9:aa91:3627 with SMTP id
 v1-20020a05622a130100b003e9aa913627mr64964qtk.65.1684425777393; Thu, 18 May
 2023 09:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230518153214.194976-1-hdegoede@redhat.com>
In-Reply-To: <20230518153214.194976-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 18 May 2023 19:02:21 +0300
Message-ID: <CAHp75Vd=0oXwKqwDghX8suK0qcYp8Ny31CRDkYFKa9M6QUax5Q@mail.gmail.com>
Subject: Re: [PATCH 0/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios() helper
 + gc0310 sensor driver
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

On Thu, May 18, 2023 at 6:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi All,
>
> Now that the atomisp driver supports v4l2-async sensor driver registratio=
n
> (I'll post this as a separate series), there is no longer a need to have
> atomisp specific sensor drivers and after cleanup atomisp sensor drivers
> can now be moved to drivers/media/i2c as regular v4l2 sensor drivers!

Cool!

But since the patch 9/9 in that series is WIP (as far as I can see), I
think we first need to concentrate to review that one. OTOH I'm not
sure I got this right that I'm thinking that this series depends on
that one one way or the other.

--=20
With Best Regards,
Andy Shevchenko
