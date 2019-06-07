Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 811573992D
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 00:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730711AbfFGW4x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 18:56:53 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37281 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729919AbfFGW4x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 18:56:53 -0400
Received: by mail-pg1-f196.google.com with SMTP id 20so1892913pgr.4
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2019 15:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=M8kh7Dgz12YKrTZB/CDTuS2cguipR8YlgXyL4uu88Rk=;
        b=NqnGfAJwCu03tLbifhT0GvFm2QW9R9io9AMcdefvJFzJ7g5Vr8PmXoK2S/sS0EBCtH
         Fusk7Ssd1izPi4ZVcnBnUIZrYJgm2cJJofYjf12PPHOu7ZZQRvC6lU0/MhgweIGPyLeg
         E6/EwGWuLTjiqp09TGPSY2SCFTQsrN6Q1gyBuOEW5aINnxk+dmy7z5bJcCLEazyA8lbi
         VWQySNTO5RzIXQriYe54HK29THy5Z3raT0y6A4hFRm5CoOlH/IVwVyITcvGmjab4XIjl
         OGj96J+wDHrvBD5Bl803937Zwo9o/GU9QYKxuCxNaeVzWqwjMi90YBdkhNvlFjQpuFFm
         tqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=M8kh7Dgz12YKrTZB/CDTuS2cguipR8YlgXyL4uu88Rk=;
        b=al4z1kHNH/iSTPlQugSmicAueE5jiagO0oRnhAYQAZz/2t6mLwAQpB5nNjrhrybAcV
         qCGgADaP4zVixql5ngtTN7E82yGxmu6N9uNIdkl38x2cFql5AhSBu6CR4FprV5EmYksM
         Kil7ZwMGuPhTziwnwHLeB54eS/hZnnsRoyLE4tH+XUg5I3doL5tc0SoCE/+N1wOn8Bfz
         etzG9LKEGOuHsG6CN3bVvc8rJw0Wu1iKAUc5HuKKI7bds0UCFPV8JBgZAqWaQHF9y3RT
         D71iF3/SNRBfWOTCsDEsxYZawi6iJmZwhhvLxWpvV4A9u2aMbMxqOJAUvHZjAAZwxASA
         euLg==
X-Gm-Message-State: APjAAAX4/DrGAjD1F/L166C1GUoOOt09EdTVaoTTBd46muCH+gJPLNw+
        GaGxEV7Wp7PX078BA6tY0heFvw==
X-Google-Smtp-Source: APXvYqx8Ow2gN0FBBUIuNPbj3rAAjRbrUfUEtyHrw8/8rVx9mCf6X0IFniQr4nPekXIHjCWdFu3P7g==
X-Received: by 2002:a17:90a:5d15:: with SMTP id s21mr8054502pji.126.1559948212523;
        Fri, 07 Jun 2019 15:56:52 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.googlemail.com with ESMTPSA id f13sm3439916pfa.182.2019.06.07.15.56.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 15:56:51 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, mchehab@kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-media@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: platform: ao-cec-g12a: remove spin_lock_irqsave() locking in meson_ao_cec_g12a_read/write
In-Reply-To: <20190605122015.11439-1-narmstrong@baylibre.com>
References: <20190605122015.11439-1-narmstrong@baylibre.com>
Date:   Fri, 07 Jun 2019 15:56:51 -0700
Message-ID: <7hk1dxatsc.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Since locking is handled by regmap, the spin_lock_irqsave() in the
> meson_ao_cec_g12a_read/write() regmap callbacks is not needed.
>
> Fixes: b7778c46683c ("media: platform: meson: Add Amlogic Meson G12A AO CEC Controller driver")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Tested-by: Kevin Hilman <khilman@baylibre.com>
