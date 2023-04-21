Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 421556EA674
	for <lists+linux-media@lfdr.de>; Fri, 21 Apr 2023 11:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbjDUJCa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Apr 2023 05:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231634AbjDUJBv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Apr 2023 05:01:51 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5C4A5E4
        for <linux-media@vger.kernel.org>; Fri, 21 Apr 2023 02:01:50 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-54fb6ac1e44so16092757b3.1
        for <linux-media@vger.kernel.org>; Fri, 21 Apr 2023 02:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682067710; x=1684659710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToiPBpdAxjCAxJF43AfJp/Rj688Pj2Ypepz4NjUUUyA=;
        b=kTXBCu2GE4qEhmJpnKtdAEx1qmHXBKyAnZ61GYEm/IWOs4DWlkAixPBwuPZ5rbt3wE
         JG/pGKL4+oldgpFcDvxS/TM9JSQz7BrzzalblEv9i2F0bsQRKYM525neJQO99ZFG5b0G
         ilQq6xyo1s25/g43zUvxSxaXQcgqnFWjeHrQbKO5xEmAFm1ru2iraErCeLRIu6Rgcgil
         PA6SVPKFjY6Ea4IOEK1JQOdPapfkCKNjsQw9a0dgf5YhX7bcjAzM3CRGSZlGWtCRotAj
         axtuC7KsfD7qnTFvpKStU3Eu9eAeARlbtlqpMVzC9CkV6/WqtJSMHVq2OaIR3YSFJkeg
         PTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682067710; x=1684659710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ToiPBpdAxjCAxJF43AfJp/Rj688Pj2Ypepz4NjUUUyA=;
        b=UBo6cFpRDt/XEpoMRbDRe+QzeEHTTGgkjx2kSNMLJz6K7wHa2jmK1UokRWaABCCyOO
         yLjOl1fetkMR5b5UjqlenivL8vOX45QqMYwj/GUpzOQ0IU6/3IR04MlUHdXmhXLWNyGH
         xHh+FT54YRIAPzPhJ35HWo8vEi9V2T2m77YtxxQ6B3KlKtSZE+zXva+9KPSSdtFYp2Hw
         DIi8KG01Fm6QkPHCf4vUK8Uxn9r8TEFI2HnGhGWPZIWi6ICt9T9a3CiD/QTxiUXipOSm
         zbGYnZ7PiO0RvZgsTUacG7Tjpx6FYhPAu4vgbsxkq3SsxGkjkJPMjRaTYuyK1iHLSIKO
         1JHg==
X-Gm-Message-State: AAQBX9eGVvD+RL85ddXvhORNC+8GEVTM0fmd6zSnq60kdvv8QO+cjm8q
        yavWpTE7xrns4mJqPxQFjWEfu375slyXCOpszjE9Lg==
X-Google-Smtp-Source: AKy350a8QRB/T8UI+klrD0gYXZ1RkUVOHetcDghs325st8nf7xoBuLJAj3nzqydGEOqKTeFIcs85oNWJHo2bkkUjbc4=
X-Received: by 2002:a0d:d98f:0:b0:541:7193:e136 with SMTP id
 b137-20020a0dd98f000000b005417193e136mr1321292ywe.23.1682067710104; Fri, 21
 Apr 2023 02:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <4302b66b-ca20-0f19-d2aa-ee8661118863@xs4all.nl>
In-Reply-To: <4302b66b-ca20-0f19-d2aa-ee8661118863@xs4all.nl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Apr 2023 11:01:39 +0200
Message-ID: <CACRpkdaorkV73hAEcnXHLV2WpGfPmnqnHy6mdo7=9wVGtH4zXA@mail.gmail.com>
Subject: Re: [PATCHv2] pinctrl-bcm2835.c: fix race condition when setting gpio dir
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-rpi-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 20, 2023 at 2:47=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:

> In the past setting the pin direction called pinctrl_gpio_direction()
> which uses a mutex to serialize this. That was changed to set the
> direction directly in the pin controller driver, but that lost the
> serialization mechanism. Since the direction of multiple pins are in
> the same register you can have a race condition, something that was
> in fact observed with the cec-gpio driver.
>
> Add a new spinlock to serialize writing to the FSEL registers.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Fixes: 1a4541b68e25 ("pinctrl-bcm2835: don't call pinctrl_gpio_direction(=
)")

I just applied this patch now so it can go in with the rest of the patches
for the merge window. I don't especially fancy having to immediately
start a fixes branch before I've even sent the bulk of patches to Torvalds.

Yours,
Linus Walleij
