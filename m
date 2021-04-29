Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 245CE36EF39
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 19:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241023AbhD2R4y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 13:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232572AbhD2R4w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 13:56:52 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9578DC06138B
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 10:56:05 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id a4so67827556wrr.2
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 10:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=lZmo/cr+IKXI7qQdDgqXnhvsGKJC6QzO9eg4zZbxXOc=;
        b=mVpNTJBYVsXKHstLlXF8bL9R7W7wqp3z1XZeSOlXqA8W34l4hPZMnc3h6NIvwqGRGi
         b/HXPh+JxSYGySG752sHt9CIou3aqLf3TlC7KfEAX7N3KBnso3M551eiazd/RA6YCINv
         aQBoChceawczkCvG9lGJCdF9bO7NYYqX8eeH78kZJghaFcpYBw6MtCyaIvXWJfhgNch+
         k1g+ErbsRgIt0oAkdKJW2/+L2tMiI1V3zFjCBh/LWsKH1aSi+KX3pqyM4/WpJWviSzvo
         sPsWEJZx0+VGVE2E6+oAHcJKSSO4jBcsN2VUouyOD4rFUbvylKdzTPvr5IWSJzFzVHPk
         dvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=lZmo/cr+IKXI7qQdDgqXnhvsGKJC6QzO9eg4zZbxXOc=;
        b=NPVfzoG1OFwvk+9di66BkFiPzkr9voP69gZJz6Bb2vvj5mDC6iSrgY/mG0ezJyi9oK
         R3dv4XjyuM3xF1MFRfD88/2vWKZkcXYS8MUKvAcvBi2kGU7jXBpL2JYh0pPgMB3/rbMr
         0uprTpV67OYQfKqZVKodPd9aJdvDF+VAy/TwN4jTcIPt7wTGksHNXotHYRF7NKeqRUwz
         EzqBkYScGxS3IDErA/KwPhSiwtcgdVS/R7LEWhBihKTnWe/FJQOH3gEKV+2tYkZ4Khf5
         z4ZDVS8r/N+32Ab0z4r+CVEQ0U9CVDc+b9l/W+L3Yd9jr6/Y7XGVNnSUtlojBxkGvyVL
         mdkQ==
X-Gm-Message-State: AOAM530Cld+hv2a1/vhMR1HzoP/XYSDRWh4pdJK1saPX8ufuGu1/zzaq
        0TJ8R027yD7FDnwJs3ogP+08lQ==
X-Google-Smtp-Source: ABdhPJwcEvzuCvKAgc9a60y4Kbm+yJ3kN5Op8Bf8DNyqM9VaXgdgPyvoHFlQl9PwBKs/GyB5f4dF1w==
X-Received: by 2002:a5d:654b:: with SMTP id z11mr1130958wrv.167.1619718964412;
        Thu, 29 Apr 2021 10:56:04 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id u2sm11021918wmc.22.2021.04.29.10.56.02
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 29 Apr 2021 10:56:03 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Dynamic array control support: please test!
Date:   Thu, 29 Apr 2021 18:56:03 +0100
Message-ID: <5trl8gldqb467m4nmmbbnubuudajg4j3hb@4ax.com>
References: <c423e924-9380-0806-b9dd-26cb2caf9fa7@xs4all.nl>
In-Reply-To: <c423e924-9380-0806-b9dd-26cb2caf9fa7@xs4all.nl>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

>Hi Ezequiel, John,
>
>After creating extensive new compliance tests for this feature I am now
>confident enough about the implementation.
>
>You can find it here:
>
>https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=3Dctrl-refactor
>
>There are two items that I want to fix before I will post this:
>
>1) The new flag needs to be documented
>2) I think there are some simplifications possible w.r.t. storing the
>   size of the new array, I want to look at that a bit more.
>
>In the meantime it would be great if some testing of this series can be
>done with real drivers instead of just vivid.

Well I finally managed to put together your patch (in 5.10), tweaked
driver & ffmpeg to have a variable noof slice headers and it all seems
to work well. With the code I have it doesn't give a significant
improvement in performance over 1 slice at a time but that is probably
because I have multithreaded userland code and take liberties with
buffer returns from the driver that Ezequiel disaproves of (but my
ffmpeg code is happy with).

It definitely saves the driver having to alloc any intermediate buffers
to stash the bitstream in.

Many thanks

John Cox
