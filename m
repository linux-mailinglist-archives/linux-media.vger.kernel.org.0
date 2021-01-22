Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DBCB300F13
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 22:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729264AbhAVVmF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 16:42:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728491AbhAVVlB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 16:41:01 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BED4C061788
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 13:40:21 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id v67so9581179lfa.0
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 13:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fVQGipISqL+GidmgskuqE54mrZNWSegyyQUFD/qGixM=;
        b=DBYc+xh+//BuisFJO7Qj1/JPZY3GmA6Q6VyAQhmchMrcnNdQgI3jZFePMXCHUuaEGg
         5RGO80cSZyrTGMfD5NST6y8FzE5ZHd23XF5yoG3UYaBQDzFj4EBslBBv+RMkVdaje+V7
         1w8G104HZiAVP9Xw4H9rO76cPe9oNYOh3DJhL4jOXrv0KPDJz0j53J/JhIHOT3M43fAm
         w0FEQ+PVt5C4c9c+XLzX44lm3z0UUqXZrPr489pWycIYpyiq4GPqoBcsQfZi8tPWdPI3
         PJGhLhoQrjfWBxZf2vgIATJgsgdEu5EAdBl5KswwMCDnuF9udk8RL7pcv6HehjvmkuOr
         eezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fVQGipISqL+GidmgskuqE54mrZNWSegyyQUFD/qGixM=;
        b=Ycepvw/fUcrOjdp22Fusz6DK0dV29t20QrCtom2anrFVK3jM9fnrJWdWeyXTVKUCCh
         LnazCZye9Vxh5W/ZcK6t/JpS8ChG0t26+iLFwnc42XeeB+mJke61dVOFL+1DwCwWfULf
         YCpy5xG2I7mkyP700hlU0RUR1GJpiXjECTByPE32IlX231FRgwvb30Nfhiqt0zgP10se
         cyodVhltvHYdGwHcwbxCYskM6u+bvVAKUjvFuyA7fPNtrAc2xxsr7/mqpIpGbEsxk87F
         7xX2EU1ZzxEML/NN7dzUGMMVVm1Mts9IwETd5IrN7AxLjcPpE3WIJJuGeWIIgg8uathb
         AXsQ==
X-Gm-Message-State: AOAM532bEX721nVKTUtArUPZ4g02kRvVdPczFotkcHQTshYmR6SD3pjF
        ijEJGSSUW094pJXi1zdWkFow+AC185EP9qznRxBl5g==
X-Google-Smtp-Source: ABdhPJxfbwAudp1weWzfAaiCkKvD4TAjwf6Rim6UybIVL3cqXpXKCe6HdRAIpeeYqM+DRPelpzMSFkQEYdi9Ys2JH6I=
X-Received: by 2002:a05:6512:3238:: with SMTP id f24mr3247513lfe.29.1611351619532;
 Fri, 22 Jan 2021 13:40:19 -0800 (PST)
MIME-Version: 1.0
References: <20210102231510.2068851-1-linus.walleij@linaro.org> <20210102231510.2068851-2-linus.walleij@linaro.org>
In-Reply-To: <20210102231510.2068851-2-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jan 2021 22:40:08 +0100
Message-ID: <CACRpkdbihCo+OYuu8ffokOO=eXeTDAYG1k91dFh+2HGh0jQCWQ@mail.gmail.com>
Subject: Re: [PATCH 2/2 v9] leds: rt8515: Add Richtek RT8515 LED driver
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        phone-devel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi LED folks,

I think this version has covered all review comments, at least it's been silent,
can the driver be merged?

Yours,
Linus Walleij
