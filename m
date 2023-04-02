Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25AD76D3600
	for <lists+linux-media@lfdr.de>; Sun,  2 Apr 2023 09:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjDBH6d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Apr 2023 03:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDBH6b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Apr 2023 03:58:31 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF611E06D
        for <linux-media@vger.kernel.org>; Sun,  2 Apr 2023 00:58:30 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id p2so20533445qtw.13
        for <linux-media@vger.kernel.org>; Sun, 02 Apr 2023 00:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680422310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgHFDIjB9kdprTZGQWAulvUWPjB6z0UITqA9gpqJqrI=;
        b=gl97JasQiCJKma+lsPdkd0scvbt0TgC0zOXjkuF7/N4ruUFQLpKRO46PvaUCnvFVdM
         T7I6BWxV5G+LlyyOPPxVOKqR4ASquKII36M5kG2L8PluP51Y6IQGcHnVTmB0e2mTDEJb
         XscnvR/y7bdmci3uk1Qk2KE39R99XAp4eLqWvfpbVWDawbDhDE5Mc1yZddFipvv6UAxE
         8nm4k5YkVOVEIkr48dny7eWpppLNDc0fURDAWFM1zd66agL2ns2SUS7kjqp670LQIdZv
         dMEPls4bsPlp/GDIWCzWwZpq3EXM0/vSBDoKMOyhOSAPCpAQWvdsPiTl5RiZF1stGi03
         s9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680422310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgHFDIjB9kdprTZGQWAulvUWPjB6z0UITqA9gpqJqrI=;
        b=dwT0VbGffwUCTVy6WlI5kxtngyz9XeJYkJjwCUrc9w40ZqJsaqoqRVhanlHU9qUMwA
         ZxIaooJxlAPvyB7uhl5YJ9pm3I9ksX5R/QiG8iROrvgsQYDe65qdmrJTcUsikY+d+XrA
         Z4pM/rVqRq8xy8Xbl4gaKQgEv6GHBm5glhWCum+YM+Owqv7qWvB+iPt2Nx/TFZhDcJUb
         YfzXK3B+AUN8s+mI8LR5rcMXBckQ/9v42IojSCUu7UiWHxmZxTBAfccP0HOO7AaKJNrg
         RtdBRfeyWQl1eWxq15/O16ZCJabadN9CL6qIHBYfxK5p0+b8NSXl+oMGjCwrqev7g9LR
         3ByA==
X-Gm-Message-State: AAQBX9fpqFCRGqJr43w2U3daN90Ks8auwZtn5NgRveTahEOfI3hDppH5
        OTT1durQiDkjl5Sj6GP3+wAuMjGOa9bCxZRgqFo=
X-Google-Smtp-Source: AKy350bUv1gnBViZbT5HlAdVaw0CbH4r5Z7SUQWOv7Jz7VDxZm8ohYcMZA1oC6rw9RnBdDEBU+yhxuyUOtFLgXIT+Bg=
X-Received: by 2002:a05:622a:134e:b0:3e6:4980:6f79 with SMTP id
 w14-20020a05622a134e00b003e649806f79mr1186380qtk.0.1680422309775; Sun, 02 Apr
 2023 00:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230401145926.596216-1-hdegoede@redhat.com> <20230401145926.596216-20-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-20-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 2 Apr 2023 09:57:53 +0200
Message-ID: <CAHp75VdFHESgTZJuE1M=pd+yH0Dn9QD2p1Kog42N-15Du+VgXA@mail.gmail.com>
Subject: Re: [PATCH 19/28] media: atomisp: Remove duplicate
 atomisp_[start|stop]_streaming prototypes
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 1, 2023 at 5:00=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> atomisp_ioctl.h contains the atomisp_[start|stop]_streaming function

_streaming()

> prototypes 2 times. Drop one of the copies of the prototypes.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/=
staging/media/atomisp/pci/atomisp_ioctl.h
> index 93139decf1d0..db6da77df06b 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
> @@ -53,7 +53,4 @@ unsigned int atomisp_streaming_count(struct atomisp_dev=
ice *isp);
>  long atomisp_compat_ioctl32(struct file *file,
>                             unsigned int cmd, unsigned long arg);
>
> -int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count);
> -void atomisp_stop_streaming(struct vb2_queue *vq);
> -
>  #endif /* __ATOMISP_IOCTL_H__ */
> --
> 2.39.1
>


--=20
With Best Regards,
Andy Shevchenko
