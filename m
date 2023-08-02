Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4FE076D820
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 21:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231633AbjHBTqL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 15:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231382AbjHBTqK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 15:46:10 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73E2F1724
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 12:46:09 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-1bed90ee8b7so73174fac.0
        for <linux-media@vger.kernel.org>; Wed, 02 Aug 2023 12:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691005569; x=1691610369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6F/AFp63NYj48DMBQIe+PYshRWmeDZeT0eUo+WW/qWw=;
        b=UrSV+q28tOlwzvMJ+mxkTu58vF9bc3XaO4dIQipE/pd0yzg/MUynkzgRLFDGT41LMN
         PLCjvErdWUJEHhCCWrAB2u+mi/O6/DQAgLgQHh0TAD81nn+75AN22ezwP+T/meNLDsxO
         j9MWcdWvnojhGm1kdSE3uAqYEmVZr0LzbQjyPltio+nBQNLU89CPQj22QLyJ+eqTembE
         2YGwASvDZyHpAGFV+OwwLud9neFZUx4I8+UPKjkLERkzVXyqOHSIIoLOWP11QCHMBlOZ
         W95zLQ0IagezYJggwZ88AZJIr1AngFrp/u/ogmzrX4ZDf4sK8d1mkoXk4oXNUe/6/1a/
         xK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691005569; x=1691610369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6F/AFp63NYj48DMBQIe+PYshRWmeDZeT0eUo+WW/qWw=;
        b=JHwzKg3x+wHXhP0LyeFvhio1fJ8skMhV8JmdT73pgcszMPACr0/+qtloHuvFWNHZcg
         kjhydGfVVMnFck4ucFs8EH5jnJ/OcBR7XyBjj932a/RG+mH/tJ9OudC5VPQjroIip/iV
         v8Fz6+Pd4NjLK+ok92xhmKuKVQEczV4T/ZPOAw1kQDNzDe5g2I1yH+KnIIqCGG4eyapU
         k72XXf34D0YJoGMNCf3/hVXxXoALleKrFhD4oxVS0BWMXRKbumc7rDnw9Yk27T1GHHE+
         p41o9Rmcbs3BCU90H10AKsIInfYA3hOYI3ac0lYFtWi2P1xc+WKFhui815PSxjHeLwV9
         lOww==
X-Gm-Message-State: ABy/qLbfxF7f7806zYU/pWbLN9lf7omMCRuIai4pv3V20wNOfQ2kcfku
        qdmc8VAL79NwS/R/sN4wC8kHcGHisW9jszTNcr5SmicZ3Tw=
X-Google-Smtp-Source: APBJJlF/aUZpCEdCpgyklEIbnOCGwW+pb2LQNM4gCOVpTZOwZ4Ji5BOQpbIdGdKqHQODlGrAKJtYrEwg1bHz8mguKB4=
X-Received: by 2002:a05:6870:568e:b0:1ba:64a5:d2d1 with SMTP id
 p14-20020a056870568e00b001ba64a5d2d1mr16979670oao.20.1691005568768; Wed, 02
 Aug 2023 12:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230802173046.368434-1-hdegoede@redhat.com> <20230802173046.368434-33-hdegoede@redhat.com>
In-Reply-To: <20230802173046.368434-33-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 2 Aug 2023 22:45:32 +0300
Message-ID: <CAHp75VefyjiZUObrVHgzrYKXuuNE1RiC3DoUwa1fBpivhK7v+Q@mail.gmail.com>
Subject: Re: [PATCH v4 32/32] media: atomisp: Drop atomisp-ov2680 sensor driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 2, 2023 at 8:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> After recent improvements to atomisp and the standard ov2680
> sensor driver, the atomisp driver now works fine with
> the standard ov2680 driver.
>
> Drop the no longer necessary atomisp specific atomisp-ov2680
> sensor driver.

The best patch in the series, thank you, Hans!
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko
