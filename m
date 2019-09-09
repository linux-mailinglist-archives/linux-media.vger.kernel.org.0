Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93967AD362
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 09:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727564AbfIIHHd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 03:07:33 -0400
Received: from mail-ed1-f45.google.com ([209.85.208.45]:37867 "EHLO
        mail-ed1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727251AbfIIHHc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 03:07:32 -0400
Received: by mail-ed1-f45.google.com with SMTP id i1so11972451edv.4
        for <linux-media@vger.kernel.org>; Mon, 09 Sep 2019 00:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E7baXewTAua+joMBqN+PONafBB7mQNjs1v3RxfEi6pI=;
        b=QtqdF6lJNZmLllCpM9EE3NcS1KCgDXdfydif2HQ1R0KnHd8zg+JgNYh0hel3ACw1Ps
         TWVUfH1vdXcp2+v19Ij5cl1eKt9T1KHXNyyGl2w5MHB+0OKkky+xNAiH9sRPlMp/PndC
         +n2Z2sd3fh/lzEi85SIziQjyUuxtzKA9DSlz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E7baXewTAua+joMBqN+PONafBB7mQNjs1v3RxfEi6pI=;
        b=hmzR7wP3pEwyK6ATe7in/XWMZNwh+b+NOAe/Q2a8/Ox+WeuixIm/JQwZUNkSLjoUHC
         otO3YQMQ9dGgc5uhXZkCAgl5OrO9jvxpBj7iKU8+TLQGjkepGw/ZToH+uXt5uklIaMCW
         gboxhPI3fuqZInz73nNqhlb6z7sepq+2FHDufC/19EG4l46vhQDt+g3AxZ4edW011UsY
         7raghacDaOGWI2axuopPCufNv+0+MwKcTr6jDTl6Xc59i71KNtbErFTseGvXwEcM3rUQ
         h+WwprzRbMZCU8zy3qszwJSLLvCaTNHMVlDfxcc77jQI/iFTcsXzhrjevz8VqhA4vASo
         wYzA==
X-Gm-Message-State: APjAAAVtaipc3PQjXIcmiyUBlCwrP5WmxwnaC14i/p8hEumM/D8sr3zO
        e8ysjVGFpJtSKdJ9DLyZbQIk3py4+VAPdw==
X-Google-Smtp-Source: APXvYqweSikdw25YJlUP0tCp+fVa2fXfUiMuerhiABJQktXe0gtR0CLg4o8rX5fVr6kKlatxwcM+3Q==
X-Received: by 2002:a05:6402:b04:: with SMTP id bm4mr23074581edb.196.1568012850841;
        Mon, 09 Sep 2019 00:07:30 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id k26sm1636148ejs.1.2019.09.09.00.07.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2019 00:07:29 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id q17so7790292wrx.10
        for <linux-media@vger.kernel.org>; Mon, 09 Sep 2019 00:07:28 -0700 (PDT)
X-Received: by 2002:adf:e503:: with SMTP id j3mr17253950wrm.166.1568012848329;
 Mon, 09 Sep 2019 00:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190903181711.7559-1-ezequiel@collabora.com>
In-Reply-To: <20190903181711.7559-1-ezequiel@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 9 Sep 2019 16:07:17 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AdikoN+7TG=0ZGFkSzaK2UFHM4VG7SYtfUtmjQgD61zA@mail.gmail.com>
Message-ID: <CAAFQd5AdikoN+7TG=0ZGFkSzaK2UFHM4VG7SYtfUtmjQgD61zA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Enable Hantro G1 post-processor
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel@collabora.com,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Wed, Sep 4, 2019 at 3:17 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> Hi all,
>
> This series enables the post-processor support available
> on the Hantro G1 VPU. The post-processor block can be
> pipelined with the decoder hardware, allowing to perform
> operations such as color conversion, scaling, rotation,
> cropping, among others.
>
> The decoder hardware needs its own set of NV12 buffers
> (the native decoder format), and the post-processor is the
> owner of the CAPTURE buffers. This allows the application
> get processed (scaled, converted, etc) buffers, completely
> transparently.
>
> This feature is implemented by exposing other CAPTURE pixel
> formats to the application (ENUM_FMT). When the application
> sets a pixel format other than NV12, the driver will enable
> and use the post-processor transparently.

I'll try to review the series a bit later, but a general comment here
is that the userspace wouldn't have a way to distinguish between the
native and post-processed formats. I'm pretty much sure that
post-processing at least imposes some power penalty, so it would be
good if the userspace could avoid it if unnecessary.

Best regards,
Tomasz
