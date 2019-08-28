Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 115BFA01F5
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2019 14:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbfH1MiQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Aug 2019 08:38:16 -0400
Received: from mail-io1-f42.google.com ([209.85.166.42]:42803 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbfH1MiP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Aug 2019 08:38:15 -0400
Received: by mail-io1-f42.google.com with SMTP id e20so5453610iob.9
        for <linux-media@vger.kernel.org>; Wed, 28 Aug 2019 05:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z9ub6dj8BakJd5JJrKLeLyNZnt+cLi7XQzPxfXn1B/Y=;
        b=ol+VAJf+uEe+pW+OLeIh97TD4/T+F5ti0j1SOXt8p3g3+9AxRgrzHA2mKJ5vaZU8VN
         Mtw2wgGYnnDXzVmxqToGtF2nfMvHrJsaRTKUm6NFeBvnBEL/AE1VgB2U4A+TnFgGlFJv
         N3OutN+gjpK3Rrv6OQryvih8Y47Q1kTDwWl9GUwd8SvcwKziaGAnwe7nyHPNsvpwQUma
         IX11hff05i2Q3HWy3nNHliuIoVJgJZC4rPy7abvo469srBQp9xh3rCEfMD2lAM1jknIq
         8/zI0DqvJJeFJiUb98QaHvF8wwP/1clSTYqlKYm6UCHQpY3oSvVrXFAXBEEbPpXvHWuI
         boiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z9ub6dj8BakJd5JJrKLeLyNZnt+cLi7XQzPxfXn1B/Y=;
        b=bl7EatQPLoIZ/ljaaKcUGLcypITAQofQW87L4MJnewniJqTDj1NFJu65Bo+q5qftyE
         J2ofNtWzl61cZXtLo6EXi6AN/Q/bll7gOOo2c391idBP+/H8p/b3m4FD/aML7TRkRaPx
         7wakJ+R+RcBlJPX7T5up5RZakF0i8ah0we9t8XOf0cp0HJpwPLcXQVZNL6Zb3QDfdWZQ
         27UskGRRtCQiQpbPv0ojw4YxvUh8NP2KBz1YtNAnIXiiqBRNMuDSLJIzg0egbTcdRp+0
         FGm5dCqFnkFGOwsCVZEVmXiTDaxCf/k/gV62Kh8n6g4fQPm+9IPMo9d/HJqy71PbU+CM
         Hjmg==
X-Gm-Message-State: APjAAAVSLmp0fRqBA4wx7cJqOlxrNmlNflCLApmpz5AEOVsVTPaJGu3W
        4ayXj5UkF7YaXoD/bZlINtAat7s8X5ecKWxGsAtP+qUQ3cihSw==
X-Google-Smtp-Source: APXvYqxbmqQHdWluIFStqQGMBY9/BhbwVz+UeYCfBFj2T06LLlJsyfJiSeDsrC/N2EuGpd3vnE0wVob9VErTw280+4w=
X-Received: by 2002:a02:3446:: with SMTP id z6mr4201108jaz.105.1566995894846;
 Wed, 28 Aug 2019 05:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com> <CGME20190814104630epcas3p44755443f37e78b2613f7dda35d71bb71@epcas3p4.samsung.com>
 <20190814104520.6001-10-darekm@google.com> <6bbfb6f8-15c2-9ad2-8857-898f4c6435a3@samsung.com>
In-Reply-To: <6bbfb6f8-15c2-9ad2-8857-898f4c6435a3@samsung.com>
From:   Dariusz Marcinkiewicz <darekm@google.com>
Date:   Wed, 28 Aug 2019 14:38:02 +0200
Message-ID: <CALFZZQHZrVSaKhTSH6suOc0epMQzcgxAHddoJGxvtdhSp1tW0Q@mail.gmail.com>
Subject: Re: [PATCH v7 9/9] drm: exynos: exynos_hdmi: use cec_notifier_conn_(un)register
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi.

On Wed, Aug 28, 2019 at 10:39 AM Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
>
> nit: I think err_rpm_disable or err_pm_runtime_disable could be better
>      label names.
>
Submitted v7.1 which replaces err_runtime_disable with err_rpm_disable.

Thank you.
