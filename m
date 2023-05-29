Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70B57715097
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 22:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjE2Ucg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 16:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjE2Ucf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 16:32:35 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0350AB7
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 13:32:34 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-75ca95c4272so218491485a.0
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 13:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685392353; x=1687984353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzBFCPUHSEiXweGu4bYXWaNN4cJWRC0KIEXjl92bN10=;
        b=gWFQcylcFGKkYrzUEy/kP8Pru1Zc1aRP1y/MHx3ZaKggHrr3e3Zk1kXllvlU/QoQxx
         QZPQIsb5B3yC3Mg7Zd29ouS/NO+E1cEL27hnBtTHdKsYS30NzcRHl4qCm4RUQNR4IU5S
         2APzLMIXQi8WMt8N2TVjsaEwuJ06hsSckO+h21JDjoXDW2WVF/BALJZ9SO9cNaTschrf
         ySRqWxdcoUwPBR91lNSz76h9Y5NarudBDziCMYdvFE6PTbncFh9lVDDkvdwO+6proPxw
         LIjLMfkBso6N+IMCWTWx+Q5e2spFuUbmiHTSQsBxKK1amEThdhoQZMbCETVD/EaqAAB3
         vOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685392353; x=1687984353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzBFCPUHSEiXweGu4bYXWaNN4cJWRC0KIEXjl92bN10=;
        b=kkMKl4csnp4fGp3bV3/rf/GQEwNr9+dSN+w9w3T9E4qyXa22qJrfoqgcD+IsCfhF+O
         inHZ0bpj1BYWE4MW63s4JjMpCu+ILRKuh9r9y5/fdds9C7tdUonKm7qT9betoSUa3NSv
         RbIG19mq0FTmsTwouE3aXCvsihcMZr428YR3SUtxXSHuVDYttg4SIMnAkRuMRH1sF7sN
         Iq7CIq9VSiJFJdiP6FK8UXvjL3A7FScVb9AvVqbJqLRuBT6fAcHJLSpTjVPA9Xmj55wc
         d/WWHV/hrC+eMtWzh9cIStKCcdDTOpOvIfalVsUMxR8pwjdnWbo+93gCZqxUNa3M8XEs
         Ml8A==
X-Gm-Message-State: AC+VfDyHL7BB2QtwAaCHgyac7tc3htxhKQscOSqdgT+fcZN/otMgCoTK
        19QuhWVYjpZ9FnhV6Y7ciMstAv4MV/FSjwVTAzecePYh4lM=
X-Google-Smtp-Source: ACHHUZ6qC0+fe9/rt8LoT+5vJ3gpWQ90o/nV+j2YLFomS2RYbegCcrvMi+Ntu3+sdw1u6OQ+2qtGJJ4Ytys4P1WgWRg=
X-Received: by 2002:ad4:5be9:0:b0:625:d55:eaab with SMTP id
 k9-20020ad45be9000000b006250d55eaabmr11006948qvc.9.1685392353043; Mon, 29 May
 2023 13:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com> <20230529103741.11904-7-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-7-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 29 May 2023 23:31:57 +0300
Message-ID: <CAHp75Vd0n8HHv2nguQFHvoRuqjwAAj=YdmgMGckg+1q-NLptFw@mail.gmail.com>
Subject: Re: [PATCH 06/21] media: atomisp: ov2680: Implement selection support
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

On Mon, May 29, 2023 at 1:38=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Implement selection support. Modelled after ov5693 selection support,
> but allow setting sizes smaller then crop-size through set_fmt since

than

> that was already allowed.

...

> +static struct v4l2_rect *
> +__ov2680_get_pad_crop(struct ov2680_dev *sensor, struct v4l2_subdev_stat=
e *state,
> +                     unsigned int pad, enum v4l2_subdev_format_whence wh=
ich)
> +{
> +       switch (which) {
> +       case V4L2_SUBDEV_FORMAT_TRY:
> +               return v4l2_subdev_get_try_crop(&sensor->sd, state, pad);
> +       case V4L2_SUBDEV_FORMAT_ACTIVE:
> +               return &sensor->mode.crop;
> +       }
> +
> +       return NULL;

I would move this to default: case.

> +}

--=20
With Best Regards,
Andy Shevchenko
