Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3363B5E0E3
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 11:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727249AbfGCJTq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 05:19:46 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34439 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfGCJTq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 05:19:46 -0400
Received: by mail-ed1-f67.google.com with SMTP id s49so1371977edb.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 02:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AVFrMDI+TIQ3EAjz/kn7jqtoTqpSeOgOSw47GSuS08A=;
        b=QFOEFOiXZa43v38UtHueJUcH0w9gOYmIWxCxcVuK3nnhCkiBHsHLpKr5NA2tsftAxe
         C0V1gkqEBj6kU/wKk7dtVKcDF2g6/jxsek3TMFLLFbvZ+38n8KMQmmXWDOfJXnwZewvj
         lyVZbNq9k7tamV2vzKKpHClJWsyldODbNmgqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AVFrMDI+TIQ3EAjz/kn7jqtoTqpSeOgOSw47GSuS08A=;
        b=C4sLcwEK5UMkFNXc1ucaewTeiCm39M9qmx2sY/dtz909mxQ2oRLqitC4rOCN8Zs9Xn
         HgLnZPi6/mm2MmLj1DR7qAVeg09Yu8wIvaPTlHFGA2QjkfFWEMT1r3Q5oKw9I/m0tzRD
         CXjLRkIuIiGmc5W23diPQwzsOfNXvOrjzU+egp5AkOS1D6H6YvqHqfc0wJAXajXfZqwx
         rhi6zO766VlVe++i8/as2m7X/BP8CH1KHxOCosfQCFMoDn7lfcEwfJbD8zZDcmTKq+3m
         lETw+ww2JSNR3h+efted229Gr01kZEbyw/1olecnUEfHym7WFocw57zJaQFtYtzex+k/
         OhMg==
X-Gm-Message-State: APjAAAV3lF7asBMEUpLq/rBledOE7erCzH00CB8mr7xSDr1mNF8hgW7L
        gZm0bR78F/Ke8ZJ2ie2BPHpBCB3aO2F0jg==
X-Google-Smtp-Source: APXvYqz60qatlJBoaHgKibYjM8x6csPowJVsiTSp0pUhc+AldhcQI/tWlFJB07AlF1FGozoGbfuHEg==
X-Received: by 2002:a50:8ba8:: with SMTP id m37mr41350642edm.29.1562145584735;
        Wed, 03 Jul 2019 02:19:44 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id d12sm502422edp.16.2019.07.03.02.19.43
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 02:19:43 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id n9so1423430wmi.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 02:19:43 -0700 (PDT)
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr7659213wmj.64.1562145583298;
 Wed, 03 Jul 2019 02:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190702170016.5210-1-ezequiel@collabora.com> <20190702170016.5210-2-ezequiel@collabora.com>
In-Reply-To: <20190702170016.5210-2-ezequiel@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 3 Jul 2019 18:19:32 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CG3LuT3tq40USFw4D7gkN_zP1j-YY+9JTqxoBjrGOwJg@mail.gmail.com>
Message-ID: <CAAFQd5CG3LuT3tq40USFw4D7gkN_zP1j-YY+9JTqxoBjrGOwJg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: uapi: Add VP8 stateless decoder API
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pawel Osciak <posciak@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Wed, Jul 3, 2019 at 2:00 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> From: Pawel Osciak <posciak@chromium.org>
>
> Add the parsed VP8 frame pixel format and controls, to be used
> with the new stateless decoder API for VP8 to provide parameters
> for accelerator (aka stateless) codecs.
>
> Signed-off-by: Pawel Osciak <posciak@chromium.org>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> --
> Changes from v1:
> * Move 1-bit fields to flags in the respective structures.
> * Add padding fields to make all structures 8-byte aligned.
> * Reorder fields where needed to avoid padding as much as possible.
> * Fix documentation as needed.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
