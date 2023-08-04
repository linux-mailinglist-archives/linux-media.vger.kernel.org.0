Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF07376FBE5
	for <lists+linux-media@lfdr.de>; Fri,  4 Aug 2023 10:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234151AbjHDIZc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Aug 2023 04:25:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231743AbjHDIZb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Aug 2023 04:25:31 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA25D2D4C
        for <linux-media@vger.kernel.org>; Fri,  4 Aug 2023 01:25:30 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-4870df0bae0so592128e0c.0
        for <linux-media@vger.kernel.org>; Fri, 04 Aug 2023 01:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691137530; x=1691742330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwrSD7E0Txvv5/0HFMAsIjR13HmLVie0jKEmwAkz0BU=;
        b=uvXKlUowkt+z9B10HM3NilZ/g/ZXRFu7iRUriu+afgGaBZkHW0qHFkI4Qm31ZLEUS+
         T7AHi98LhNsGiTMncZ/avvyE7RC5i9j7bkrQnfcAb6ajwK6V+sGndZtd42WBfO3Vf9g+
         ty4jshRNeC5XLZWT9A677OLLXNmiMrp1jFdnB6VJNuTHTFzOuoDjJ2sdyxU6hDznILvK
         hdJ9FKZ02Uiglf8ZxUdv/qMlbcF7XMuNdbJfkBkoWTNjXY47XkhH16IMCm+YmcDsJarC
         VTZFyHTQjFXYelcwNu5pLHCTiEv+4pyOyiX093K/fp7cuq5tSfkeFCRMd8Y+pEH2wk+3
         /fmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691137530; x=1691742330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwrSD7E0Txvv5/0HFMAsIjR13HmLVie0jKEmwAkz0BU=;
        b=OqvqyKzUjkdcXXiKGR9v7UbUG8vkFMLT9Y+rKolIzvyA0i+vroxPGWSYY1W0OSwABX
         +aczJwQ456xqbR1gf2Uh64tRNb3qvaqjaKV/HGf2fwsmfFXK+tmh6j+p6OugafHHZPc0
         I7oEm3Zs8urKIrZEd/TKahtXYf9nwZXlDu8kOun8McWEbLvlBJjTpLYVesSnXX4yQms6
         vh35I0YzsB0myaLrvDv5MP5wVdChoUeYZH3Vjr/4d9UXFxTyBO/s1CGLwwbgwejl/J24
         TZEkE2JC7FH+20apS6T2iu0W/19yMAgLd47S595yDHk/HYwpj2aa+wmtvixpi3f6heAu
         oBWQ==
X-Gm-Message-State: AOJu0YyObvXg4RB3htGOTtsK/20gx9aohIiVn9Frink0mBd393C9QFva
        xvCdo1rHqAoEFMfdlg6fHNMLovWiUKRYlkPmzh5tuQ==
X-Google-Smtp-Source: AGHT+IHg0XA9lOZoNjxeCzkrVNkbmXRaA3I5KXvS0ch5IjjHNULP4cSqm6pUDNr0hmIb4ztGPiR/sc46phRQG7EMT0Q=
X-Received: by 2002:a1f:e343:0:b0:487:1ce5:3be with SMTP id
 a64-20020a1fe343000000b004871ce503bemr414441vkh.6.1691137529997; Fri, 04 Aug
 2023 01:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <B15AD941-B2E4-4C65-9D84-C58D3E34EBCE@noisolation.com>
 <a4b188b8-afb1-df2b-5237-026650279f10@xs4all.nl> <c48ff175-4c89-833a-c1cf-496ab26f7e6b@linaro.org>
In-Reply-To: <c48ff175-4c89-833a-c1cf-496ab26f7e6b@linaro.org>
From:   "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Date:   Fri, 4 Aug 2023 09:25:18 +0100
Message-ID: <CABDeQ7GP5b_8wvD77Wd=3_yXxB-OxP5z3-oL62je6++EE_RBcQ@mail.gmail.com>
Subject: Re: [PATCH] qcom/camss: use 1X16 formats instead of 2X8
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        =?UTF-8?Q?Martin_D=C3=B8rum?= <dorum@noisolation.com>,
        rfoss@kernel.org, todor.too@gmail.com
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 24 May 2023 at 09:59, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 24/05/2023 09:48, Hans Verkuil wrote:
> > On 13/04/2023 12:54, Martin D=C3=B8rum wrote:
> >> Platforms with qcom-camss use CSI-2, which means 1X16 is more correct
> >> than 2X8. The fact that qcom-camss supported only 2X8 meant it was
> >> incompatible with camera sensors it should have been compatible with.
> >>
> >> For example, the ov5645 driver (correctly) reports that its format is
> >> UYVY8_1X16 (after ba449bb56203aedc4530a82b0f3f83358808b7f2).
> >> Since qcom-camss only supports 2X8, the qcom-camss system is
> >> incompatible with the ov5645 driver, even though they should be
> >> compatible.
> >>
> >> This patch replaces all uses of UYVY8_2X8/VYUY8_2X8/YUYV8_2X8/YVYU8_2X=
8
> >> with the equivalent 1X16 formats.
> >>
> >> Signed-off-by: Martin D=C3=B8rum <dorum@noisolation.com  <mailto:dorum=
@noisolation.com>>
> > Can one of the driver maintainers review this?
> >
> > It sounds reasonable, but I wonder if this can break existing setups wh=
ere
> > the sensor only supports 2X8 and not 1X16.
> >
> > Regards,
> >
> >       Hans
> >
>
> This hasn't hit my inbox but, I'll give it a test sometime this week.
>
> ---
> bod

This patch is fine. The only concern I had with upstream was
drivers/media/i2c/ov5640 which is a default sensor on apq8016/db410c
ov5640 looks fine.

Please apply

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
