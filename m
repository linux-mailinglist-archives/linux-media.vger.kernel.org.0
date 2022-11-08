Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54266621D23
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 20:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiKHTnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Nov 2022 14:43:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiKHTnP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Nov 2022 14:43:15 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2122C716FA
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 11:43:15 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id v17so24107842edc.8
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 11:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x3DeXjQVDVnxEp6WievCaEDc2ejw7NGr4ZmNeDTKUp0=;
        b=L9+qG97OuubGOry5tOD1CIoG4X2YOTF+O9NKzmKPXKi5l4wmWwzXE4XzFbC0XYv6YZ
         IoEwwQN024Z9LKXZM+BK6hK1+HXgzBNe1G1oI+9Ja5SttQhmEiFqLiFm4FWpTApg0qiq
         DjAZmKuwHqdJo60O2gdLYdwsfFMiETDjnzeMq0w3iuNc7xL0PvTuYT3P28TXD9rqw8dM
         NBihGvibRePo9kqY85z93tC34E4xMtodqdcwnFqsgQxIC3dm2mVZO6TH1YYoP0WIZGk6
         cdwRjfMCsC6tW2st5evM2a3OVaBE+mAJGh9q3VLxZYmCROIxMYccOhO5I/ZPiNwq9a7Q
         fDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3DeXjQVDVnxEp6WievCaEDc2ejw7NGr4ZmNeDTKUp0=;
        b=tIxJBkab46hIL4CW4sPyKqWR0E8v6Z7LDxtNrOWt6tJfnnBZSZKvZn/HV69C5CSoon
         HidFU8LGvx6cwkK0niG9T4qBj1cTelNakmrVkZw+j9Svye6iX1YtyXZATCAeTZFJx8tb
         +vVDlAGd/QhidGYVqEr8qYZS6te7e4Q1nfkLZi2kk1MXzzAn+2D03SuT4VFKbhhZbtzv
         YoLQTxzEV60knZFnM4sGm0ZkIPNjEY8hp10RaF6gOc9V5FhSkko3vbUcWiezOyxxtylM
         SzLBXsGWWje1I1FPN5ECwGg8p0OVgpUfcR6OVbEEn8CKZMkX+cbHy0MoBMUjmNebVi/i
         Fthg==
X-Gm-Message-State: ACrzQf3e9peA8aEhjPYT5nqdabfXDClbTcbPIZtKZ6kzVuUBzRdQJ9J0
        UW6l25+oRk5BwhrUq+3Bl7icLKLgCGoNlshf7M4UuoLr5Qw=
X-Google-Smtp-Source: AMsMyM60KLcYrfJRNp6fxaaNgyMM5I5zcY10agQpLS+SZ3IhDJDZkNTBFYNZF51rRqyvIzMyEnQXqxP7ogG+ua9icm4=
X-Received: by 2002:a05:6402:2996:b0:463:ce05:c00e with SMTP id
 eq22-20020a056402299600b00463ce05c00emr914458edb.46.1667936593616; Tue, 08
 Nov 2022 11:43:13 -0800 (PST)
MIME-Version: 1.0
References: <20221108121623.1510131-1-linus.walleij@linaro.org> <Y2qVDvcDIoc1Fb0L@google.com>
In-Reply-To: <Y2qVDvcDIoc1Fb0L@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Nov 2022 20:43:02 +0100
Message-ID: <CACRpkdYSFr4=rUND9FtQRLsr7XWWr7+JaAiWtw1T9G8HroBK0g@mail.gmail.com>
Subject: Re: [PATCH v7] media: s5k4ecgx: Switch to GPIO descriptors
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 8, 2022 at 6:42 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Tue, Nov 08, 2022 at 01:16:23PM +0100, Linus Walleij wrote:
> > The driver has an option to pass in GPIO numbers from platform
> > data but this is not used in the kernel so delete this and the
> > whole platform data mechanism.
> >
> > Get GPIO descriptors using the standard API and simplify the code,
> > gpiolib will handle any inversions.
>
> I think we should simply delete the driver. It does not currently
> support OF, and I see no traces of any boards present in mainline using
> it, so why to keep it?

Good point, I think you said it before.

It's such a self-contained driver so I thought it's sad to just delete it.

I suggest I send a patch series of two, this patch and a patch
deleting it after, so if someone wants to resurrect it and use it
they can just revert the deletion patch.

Yours,
Linus Walleij
