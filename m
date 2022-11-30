Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75BF563D2B0
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 11:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233763AbiK3KCf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 05:02:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235263AbiK3KCe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 05:02:34 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25510DD4;
        Wed, 30 Nov 2022 02:02:33 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id r19so690160qtx.6;
        Wed, 30 Nov 2022 02:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mHWjGUutZvu8frMTpQcEffMDOgN6Ykcc4XU27MSKLpE=;
        b=hab7k5udL3w5GIpgm6MkZ533MiVm3fSmAhKrbwplfOzD+gmRkJyLQ+EpFwXJ8W8CF/
         s+QfudLqU0D/GJzlrrbsbVeudGS0WJ23EEEIofFt6sU+sio44HHb0c4gULblGFbnV2oI
         qkGG2wfYys/3SpVbG3g/xs8Da4AFYtkwwjFvd2L2/5Nb5P5LEJC2vDHhRuau7XXUFRjT
         L+z9YmCa7klhDuHaYq5yPR42SNlC92yJdkIhnTuAvrR4hm0vvQt9D/yzV6lb9SwYuyyV
         L61/+ARI24aSSQsd0TrCn+uARMG0qEdD+tiv3F+6GxH3Rch4498l/UYcbhdP9lTgHag+
         mgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHWjGUutZvu8frMTpQcEffMDOgN6Ykcc4XU27MSKLpE=;
        b=allYv0WhbL6kGzMYf7j0q+dj50jvo4YshPA6dNxEgtQi+kboBNXn/7sTXx+iAKyABw
         EIJbLH6gEk7oN4ui5h9a1X5nC/7IjPrEHF4hCQpALHJ6dpds3YuOTl6Mqhp5cziwNCfD
         5yBOCLw0QoO6Pa3jTuzIBDLD+kZO7KpYAuVIr1zWvJeov9D9bTGi6uuvjeqf4ay7gD89
         Xhj0aKK/eY8mNPiPvmrglKfpqrOlReJZ3PBxmT/t7CoNAm7kp3UWO8qzQqaLOnmzIA8b
         Fry4AnkDbRZ+xIu1iTc0oJX3DUMbcAXxNf+s2vhzbdWK0P/8+vUJh7KqWV3YTPGbgiIo
         nubg==
X-Gm-Message-State: ANoB5pn03U8dlzfAxKH8CKoKZyvRCO/OcLMn4tuupfnQ7vxLkFCXsy+O
        FkDSzDyfq3nxl9Eeu6etQRdO81fDZHXs3+7TtoI=
X-Google-Smtp-Source: AA0mqf7J6vr2fxLt7gDxlIFH9YpJD0f+PqW7ziZz0kgIKiww3b+1M5DmzvBoJVNsnRSt+Iu+lL2mrOFGMwHCTMf4yL8=
X-Received: by 2002:ac8:4cd1:0:b0:3a5:1940:a027 with SMTP id
 l17-20020ac84cd1000000b003a51940a027mr54900469qtv.195.1669802552185; Wed, 30
 Nov 2022 02:02:32 -0800 (PST)
MIME-Version: 1.0
References: <20221129231149.697154-1-hdegoede@redhat.com> <20221129231149.697154-7-hdegoede@redhat.com>
In-Reply-To: <20221129231149.697154-7-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 30 Nov 2022 12:01:56 +0200
Message-ID: <CAHp75Vc2nYtvHhrsNPe8JwbK_665F5_Z6bMDfvmtBKr0HomycA@mail.gmail.com>
Subject: Re: [PATCH 6/6] platform/x86: int3472/discrete: Get the polarity from
 the _DSM entry
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 30, 2022 at 1:12 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> According to:
> https://github.com/intel/ipu6-drivers/blob/master/patch/int3472-support-independent-clock-and-LED-gpios-5.17%2B.patch
>
> Bits 31-24 of the _DSM pin entry integer value codes the active-value,
> that is the actual physical signal (0 or 1) which needs to be output on
> the pin to turn the sensor chip on (to make it active).
>
> So if bits 31-24 are 0 for a reset pin, then the actual value of the reset
> pin needs to be 0 to take the chip out of reset. IOW in this case the reset
> signal is active-high rather then the default active-low.
>
> And if bits 31-24 are 0 for a clk-en pin then the actual value of the clk
> pin needs to be 0 to enable the clk. So in this case the clk-en signal
> is active-low rather then the default active-high.
>
> IOW if bits 31-24 are 0 for a pin, then the default polarity of the pin
> is inverted.
>
> Add a check for this and also propagate this new polarity to the clock
> registration.

I like it in this form, thanks!

...

> +               (polarity == GPIO_ACTIVE_HIGH) ? "high" : "low");

Perhaps

static inline str_high_low(bool v)
{
  return v ? "high" : "low";
}

In the string_helpers.h? If you are okay with the idea, you may use my
tag ahead for that patch.

-- 
With Best Regards,
Andy Shevchenko
