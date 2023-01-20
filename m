Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B15C674E08
	for <lists+linux-media@lfdr.de>; Fri, 20 Jan 2023 08:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbjATHZg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Jan 2023 02:25:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjATHZf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Jan 2023 02:25:35 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50CDA79E81
        for <linux-media@vger.kernel.org>; Thu, 19 Jan 2023 23:25:32 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id b1so380873ybn.11
        for <linux-media@vger.kernel.org>; Thu, 19 Jan 2023 23:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xNyfWsqJp2T2+UrQIXuPGZpKaI5FcQb+oxkGo+mFm4w=;
        b=Hhd9Ipoz1U1mLubpfjYuIMuUuT0SS7UIbB848A6KxJRyrH5M+w6kaiT1zHKCCH4LSB
         ORKjRsWtfcIvpn2vvq1mRPINhEnQp95STVwWsJ323v8EeOVmJGV0IWNDpMfs9ua+/uz9
         KBO7pj3dVdkozUbiq5d+2bgqRlSXWCv0+YUnFRT9aw+R/94FHbFStp8w1abK1jbgbqVT
         BBPASTggslk6ZhaQiO7KSr5iUb9TZM0JwmgKxdfLcvblRPWidW7RXcLOEZq7G0jfwYb5
         fphpYVx9Ca1IxFKwqlwqyRtjqWqM6Llx8Oejw0egLjWzxE9OsgM4HbTI6pLj3l3E8Czm
         RdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNyfWsqJp2T2+UrQIXuPGZpKaI5FcQb+oxkGo+mFm4w=;
        b=XBVHMBPkN4akUZRS3WcPO3DSx5ExeYFvlzVxxPSry7s4vFNYKns2w0suZdSuiS8eML
         8twFwvNIJDo0Cd4p9EhzwgoaPGY2xMJHo/3llS2o4gzgb2wR+JSmUjObLupzC2ic5hka
         kWh0TtbKwf12hHzq+55yRNPKiSu8LMUM3qnHxaqJ6bWrZywZ8sShY3JIKOpLVTj1pWav
         6l7iu4CyPqhbpt0f/P1k14DxdVyZ7JUjCgYlOW86UsUtO8ShHHydVcgEHv9Ane79frTg
         ha89pe92VgSvX0e7kgmG0XJNA3ltYjV3P6q39ym6A4SMVowZsx2FpXXoQZj5tmFbxzZ8
         EhPg==
X-Gm-Message-State: AFqh2kqRwlGzAYPgqs94Jn0TjYwSqfEhSCBkVCqUL8X7C48d6ajcRjU8
        YlT5Jvv5/1YzEOou3M948t2mYY4uuGdJzfYdSq2Y0g==
X-Google-Smtp-Source: AMrXdXux6mEufn1tuMXOtYF/YjTIhpmzoCrS5IMGsTbPDgS1suvvZZubHD32doOoxyb+3DRWJoIlv7FHX3zF53qB6YE=
X-Received: by 2002:a25:9d88:0:b0:7c0:acd2:6300 with SMTP id
 v8-20020a259d88000000b007c0acd26300mr1377520ybp.520.1674199531539; Thu, 19
 Jan 2023 23:25:31 -0800 (PST)
MIME-Version: 1.0
References: <20230119130053.111344-1-hdegoede@redhat.com> <20230119130053.111344-4-hdegoede@redhat.com>
In-Reply-To: <20230119130053.111344-4-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 20 Jan 2023 08:25:20 +0100
Message-ID: <CACRpkdZ7VY4mLOZ-yVQogWthWB9E8vjjme8UggHNxfohA4Uanw@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] leds: led-class: Add __devm_led_get() helper
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 19, 2023 at 2:01 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Add a __devm_led_get() helper which registers a passed in led_classdev
> with devm for unregistration.
>
> This is a preparation patch for adding a generic (non devicetree specific)
> devm_led_get() function.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I'm not a fan of __inner_functions because they are easy to
confuse with the namespace for __compiler_directives
but no big deal so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
