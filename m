Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3242C121B84
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 22:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbfLPVHi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 16:07:38 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44382 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726764AbfLPVHi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 16:07:38 -0500
Received: by mail-oi1-f195.google.com with SMTP id d62so4440708oia.11
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2019 13:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xf+PaVfK+fxzSPWZXkO3BuD6UEDzGPf8/U5sJKPnSqc=;
        b=j8lbUXIylU6AeuPYIm+5uxBq5U6RJpNmZZMLo5ctDECJri01nRMDpJ5qRfxwwPLKRh
         oumhJo/nkLVN3J+uYBGhFb7psH4p92UqoS8mv3UClvK2Rj8Hfce7HwlbKt3mkFhRdAkP
         TnIu+WS+NFDon5qVreiiJZ9yN5AOPtE73Nw0iuHl+i9MUoZYD5COw6VuUSjQ31RCI8BC
         FrP54MUwtkLp1q8MMg6IunDKh79oT6fC7Af9xdCCICHERafZPC+KyUgtaj6kxewFTu4n
         /mDrkysePXG5mRQudXLKdRO6CdfBN6Fb/JcCBLQ58167AzGCHTZf2a5HXnOT/ZA3qYSe
         7LSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xf+PaVfK+fxzSPWZXkO3BuD6UEDzGPf8/U5sJKPnSqc=;
        b=Z6SFQwSJQDaDuesM412jJA3axkqHzoyllUIM6QTXr5YFre0gpl/jFs2SH3E4tKmf81
         +g770VMsUO7nbj7gpNs7PYKFiu222hhhRy5URtjKyLS/r/yffcJAmgrjNb9bTsx2uKHi
         Eul5P4fPD7Tb8qzV345sJYt/KsBZVacvlye1xgzQPgtxGoLn2+Qy9x1xfFLGBFw+SR2T
         X6iNQbTVcNJBA5HV3CevSY8/pBcB9g+5j9jWoKRaLQRu7jXlIsxeNRjO5ECtlB3FIeYx
         eXkI4lzENyrxAfLlbg+K3n29AQ66UFTWr/ZHhEhOxw7609JqA3vUcUNei2scRsWy4aH4
         Udlg==
X-Gm-Message-State: APjAAAWgqubWNM0LFxDCHQ8OWCQM06eyuYo0gfYktrdxZxaJv6cVYyVf
        QWMnzhigS5TURR/q+jPqXBAldoiP/MrHw5wIFoO3Eg==
X-Google-Smtp-Source: APXvYqzWzDWclkNVDspqgaIn1PCLoKAhYWLJAEqeDwyrdeQGyKLOwB+UvmXjFNWeRKfvZFp0VvkubgYEQrTULqVw92E=
X-Received: by 2002:aca:c551:: with SMTP id v78mr600481oif.161.1576530457340;
 Mon, 16 Dec 2019 13:07:37 -0800 (PST)
MIME-Version: 1.0
References: <20191216161059.269492-1-colin.king@canonical.com>
In-Reply-To: <20191216161059.269492-1-colin.king@canonical.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 16 Dec 2019 13:07:26 -0800
Message-ID: <CALAqxLVsFr6LLKvz9a5CRdddqhmMXUwKmfwqf3LRBbhksk5gHg@mail.gmail.com>
Subject: Re: [PATCH][next] dma-buf: fix resource leak on -ENOTTY error return path
To:     Colin King <colin.king@canonical.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F . Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Sandeep Patil <sspatil@android.com>,
        linux-media@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, kernel-janitors@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 16, 2019 at 8:11 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The -ENOTTY error return path does not free the allocated
> kdata as it returns directly. Fix this by returning via the
> error handling label err.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: c02a81fba74f ("dma-buf: Add dma-buf heaps framework")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: John Stultz <john.stultz@linaro.org>

Thanks so much for submitting this!

Sumit, do you mind queueing this up for drm-misc-next?

thanks
-john
