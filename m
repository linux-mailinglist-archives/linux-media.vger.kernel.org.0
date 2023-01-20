Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC1C674DF8
	for <lists+linux-media@lfdr.de>; Fri, 20 Jan 2023 08:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjATHXq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Jan 2023 02:23:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbjATHXn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Jan 2023 02:23:43 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF963D91F
        for <linux-media@vger.kernel.org>; Thu, 19 Jan 2023 23:23:41 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-4fda31c3351so31417497b3.11
        for <linux-media@vger.kernel.org>; Thu, 19 Jan 2023 23:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TA3tL774T/87I1ppcDOWxNhqf64vnCQf4e96ToG+gWU=;
        b=GpOxgi+k5ZosZ450PFE197mvrRP0Ibe7qoATb35i+zqlseVzyoJOitgNnGNT8yHbqP
         uG+kuWG50d4UZZrRaac6R4cXb71DUlgfay5Hqbe1asRrcvYefcZKEqseZPvwHG3PUNxi
         DUJ/dGUnDUwv9jhMFELVH90Vc/ghdlHP0qIW3xYxcr6HCL3spM5HTuWeJXtkgJoEWvYR
         M+9L1aFoheY+gkE5VcGqnTdQ8WjIS3j6BjR8vebmiVsH1DyG+DjgOA1jNuGuaPxgWh0Q
         5rEpM0eD8wvDiKCCilE5L3Qf9mc2+QsPOhRHRu8EUvNz8Gluym0522J16o8LnKZcX1H1
         ejVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TA3tL774T/87I1ppcDOWxNhqf64vnCQf4e96ToG+gWU=;
        b=2HCIzGYkPYdvhm+t6/8OWPRMw9KHgn6qEWtTANWqYxVDn91e7PUmMhpdv8+92Z2nvV
         4YlUMvaMUpz/8LwLpCGrkjS2Cz+SJmTzJ4XyOJn7gK2/Nflpep1ExZqvW4IyULnFYMbI
         CgWt5xEduih/OnXjPEhiPYVrBUJxDXmnq6+8Sqk1ataI1dqQpZHShodCenx9QanFit1U
         7Eg8M8bTMxVs7xFzux/n/7nl3TBI0HTJIdY1AvK52vvkKvIREEzj9GKWwK2hr5CoJTfb
         C5Be5L4K2icfbUAfjf1UqNTZsuXb0qcKPjDMLXEbz0HIgNxMkb3g2JBl45nmdzQjYFLz
         SZrg==
X-Gm-Message-State: AFqh2krO+sLoPK2zK03Tug2zfJlekEiapZoWF09o3Efx5u/SP2P5Mhu4
        1Kp/qWiD42RUmjNNjLTz6QAxnCWvCKeVpF/jKSQVWA==
X-Google-Smtp-Source: AMrXdXsFy5S/+1aUxe8BBygRPPKpHRVTsDDpZAXb1gt17BAkiOnRhABkE4Oeqj7++tMmtO8taxtaEU1uf4b56dHCj5I=
X-Received: by 2002:a0d:f282:0:b0:4ed:c96d:1b89 with SMTP id
 b124-20020a0df282000000b004edc96d1b89mr1944156ywf.130.1674199420633; Thu, 19
 Jan 2023 23:23:40 -0800 (PST)
MIME-Version: 1.0
References: <20230119130053.111344-1-hdegoede@redhat.com> <20230119130053.111344-2-hdegoede@redhat.com>
In-Reply-To: <20230119130053.111344-2-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 20 Jan 2023 08:23:29 +0100
Message-ID: <CACRpkdaZw+M+kKgdV-mSVBTHY95OE51OGCzkvXSzkpen8Ybt7g@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] leds: led-class: Add missing put_device() to led_put()
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 19, 2023 at 2:01 PM Hans de Goede <hdegoede@redhat.com> wrote:

> led_put() is used to "undo" a successful of_led_get() call,
> of_led_get() uses class_find_device_by_of_node() which returns
> a reference to the device which must be free-ed with put_device()
> when the caller is done with it.
>
> Add a put_device() call to led_put() to free the reference returned
> by class_find_device_by_of_node().
>
> And also add a put_device() in the error-exit case of try_module_get()
> failing.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
