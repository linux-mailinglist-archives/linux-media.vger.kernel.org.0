Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B894318784
	for <lists+linux-media@lfdr.de>; Thu, 11 Feb 2021 10:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhBKJzV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Feb 2021 04:55:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbhBKJwX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Feb 2021 04:52:23 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C3DC06178A
        for <linux-media@vger.kernel.org>; Thu, 11 Feb 2021 01:50:25 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id jj19so9106210ejc.4
        for <linux-media@vger.kernel.org>; Thu, 11 Feb 2021 01:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B7GSnrM7B6crv8pKwIgz6vsLju5oSgUNsyvhwhxtSk0=;
        b=AFqOYKAiQVjfJdddLl3PUYgeUj/DPJbKc+Ks6t7ycM1u3h3esGS8bu+Sb3NNunfKCU
         60quMh3VjgLP/84CnylNGhuEk3SoeQGuE/rAEV56MOfKUc2cYpZVarp5iS/CLaTK0Zib
         2BNXleo2gLc16cMWOdBMmOPUC08pK57eqs19KVIBQCI/MIt7FlopElXB5PVgzd1Jk2BO
         NEcpTxeCT7p/RTt7qcqMkUkfFoq38ypovqbFUrixv3k5FcFLPcmLGhCyy7YZfOAwALzd
         LOm8RJfeasr1tUtO+DHp2B/BTzs69shTTNQWVJ3oxL0fnkqJHQLs3i2gUQ0BIZH2uQAo
         6FNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B7GSnrM7B6crv8pKwIgz6vsLju5oSgUNsyvhwhxtSk0=;
        b=BKsgIEopAorvAUqORaPzqWBgTHaebzyC6fx+MzKBi72VzQmrbWFw7I90/32LVmco8G
         CiyTvOFaHGyz4ep9t+qLh4wtVFLg4oouPgKApf6p8cY+owGJfOEp17xmK8bStLqDWVcL
         d25a25PR3U/zyVs1zdXIpNZ1G16CLq86zWgovmCrRrAgBs1zUXkQGrPmNMXEMyfUwCJX
         OHAwLcp2CjHF3CenT2Yu0g4oELmFsWaEcGrUtbquSo0eFVdXZ/iAFeh2HUy76528Vtfw
         XDZdP/rReEmLUnojPGAAogeKtPEgyGOj3V+zQqPLR8HFOchMJov4/IcSsDmty/uwGEG6
         0R8g==
X-Gm-Message-State: AOAM5326ev7uNLJzYfrMK2/lJOVGMek7wgFRG+zA1cNvumKl10dTXbUq
        Yp8tqASp6Gf3gEqc9xiYvsvNKg23bw8ov+pqLtCK3w==
X-Google-Smtp-Source: ABdhPJzqkkQOSYy6alf0j16Q93rb52p9AEJKYyTDVXr843L8/xeXbztnPxJKzF6gVpV2miPa62v4zOn5yQABP5xncsM=
X-Received: by 2002:a17:906:8053:: with SMTP id x19mr7497164ejw.470.1613037023687;
 Thu, 11 Feb 2021 01:50:23 -0800 (PST)
MIME-Version: 1.0
References: <20210210230800.30291-1-sakari.ailus@linux.intel.com> <20210210230800.30291-8-sakari.ailus@linux.intel.com>
In-Reply-To: <20210210230800.30291-8-sakari.ailus@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 11 Feb 2021 10:50:13 +0100
Message-ID: <CAMpxmJVfn034_4NxbhT3xh60vC9HCZpF7fCF4CGJ7-OiC7A6uw@mail.gmail.com>
Subject: Re: [PATCH v11 7/7] at24: Support probing while in non-zero ACPI D state
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 11, 2021 at 12:08 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> In certain use cases (where the chip is part of a camera module, and the
> camera module is wired together with a camera privacy LED), powering on
> the device during probe is undesirable. Add support for the at24 to
> execute probe while being in ACPI D state other than 0 (which means fully
> powered on).
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> ---

I like this much better now, thanks!

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
