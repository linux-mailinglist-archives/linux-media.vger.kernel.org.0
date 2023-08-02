Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE82976D7C1
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 21:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbjHBTbt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 15:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjHBTbs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 15:31:48 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B420F123
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 12:31:47 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1bb58b4c513so66441fac.0
        for <linux-media@vger.kernel.org>; Wed, 02 Aug 2023 12:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691004707; x=1691609507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fD/zxkhWhIfWTbDZHemynycph1nfShny4+nyWzApQM0=;
        b=Iv37mGNYuO9QuvThWEId4PY+KLvrmixKSmqXNHsRURBzqZAnhD7Xeg8+KtHFEt5Hyo
         vxBplWjq669G74rEBuPNzUsX2js+pew4cuO0Z+/mHiOSdsdrHtNR3YMFHd4SHQP+4ONL
         VhPqN7OSQPOT3mZ5JOWH3BzcLJg2jp/fH4FHKzloXOh94iY7EEJpWa68Nay5tVxdXU2v
         G3SPluv0XUkTa+ipIMnjAFmGiK9bbIQvqn+sxnfEa9rvJWsvuEm7bslJ/l/GTUuNzznm
         LWc55eSlp4IPEzQ3nFS+8XjtTB6O3n1JYlebv55M6qK3tp//WDMKcJKMDXFJtE2mmpH3
         b/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691004707; x=1691609507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fD/zxkhWhIfWTbDZHemynycph1nfShny4+nyWzApQM0=;
        b=Hn9/QPOTqUe3PfqxWpg1O/XRX0+28a5qdTg0xDU0xONjQhcepkk/n9O5G9FUWTU6j0
         zyXWU4hF8o8xescMSCYRzWXWg19KICXligcfl4Qtbtt686xcpU66Qd+lr8jd7FT/SEj3
         fxiZzGQlSsRWad0I2D3dlOl787yS6SbU4mUFya9jSET2L3MKNDUZVKFY3wHoFoLR5obC
         KURgOIJDY8otUp8xU0n9gGGJrsiZMmO2omYaPTxpfiT1m17eX9rN8cimoXvQfyOHIbWW
         ofzApICyWNcmXB9SEpT0DmrE3ae46X+6q7d6TEG5XXN8OHEtzZVOFt7EC1umPef5s+PY
         MPTA==
X-Gm-Message-State: ABy/qLYmN/eVTmq/RkXbi+thbp+TuAyZvChVn+44qroT7ned+iqWQO3a
        CvOzot7H5OvuQfyS0+Xpq4A9UOBax1j8GtMtuKo=
X-Google-Smtp-Source: APBJJlFd6jVGfQAhO7o8jC+F5USTEZWBj5E8d7cA//+TKXknqBPOKiH10o7UJOqGTiq/IuqH3oUnYRq7svtoF8MbJRs=
X-Received: by 2002:a05:6871:5c9:b0:1bb:4a22:7ae5 with SMTP id
 v9-20020a05687105c900b001bb4a227ae5mr20097429oan.55.1691004706985; Wed, 02
 Aug 2023 12:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230802173046.368434-1-hdegoede@redhat.com> <20230802173046.368434-18-hdegoede@redhat.com>
In-Reply-To: <20230802173046.368434-18-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 2 Aug 2023 22:31:10 +0300
Message-ID: <CAHp75Vfyx89HsN_U=TjOGSrGXa8BgDNnZZhxyBCwUmNvYcss1w@mail.gmail.com>
Subject: Re: [PATCH v4 17/32] media: ov2680: Add support for ACPI enumeration
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

On Wed, Aug 2, 2023 at 8:31=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Add an acpi_match_table now that all the other bits necessary for
> ACPI support are in place.

Would be good to add a couple of words about ID itself:
- is it the correct ACPI ID or not (confirmation from OmniVision, if any)?
- is there a product with that ID in the wild (mention, if any)?

--=20
With Best Regards,
Andy Shevchenko
