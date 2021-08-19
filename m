Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 029603F1DD8
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 18:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbhHSQbh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 12:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbhHSQbh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 12:31:37 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87229C061575;
        Thu, 19 Aug 2021 09:31:00 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id d11so14069085eja.8;
        Thu, 19 Aug 2021 09:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QemfxSD5xAYzJcfMYMAskCzZR84zFfm2x5hS4t5c4PU=;
        b=pmjJX64apzH4rjdwC3bAALqKQRjlW7kSOsW7daz4GRNCiTaplXRTf6yZpSf+21vVGR
         Vq7KrXR0TVo4RSczoIwSMbXjj/20hT7FvivJvnkU5EztWEInr1kTatGLaU/vWgVU9uU8
         DeRuSUVSgAFSRlRhz4hBxMB+uhRV/AHaGtm4HncKJpnOSCcN8OZp0DIOVVsow56aby3R
         qwFGZeTxMnjCAaHu8ASnl6P4rYJ7I+lHXns1BLhMKc0twKvQrLUuKZy1cmHMF3fx0bHx
         1ZEDQFg06ImTYjsgrVANeAtg3jvBoPgoRwtUhcOsijzgSv9VTDtmKe+ngYcU5XfI5rwf
         DK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QemfxSD5xAYzJcfMYMAskCzZR84zFfm2x5hS4t5c4PU=;
        b=or0tC2zSK9Ac7P8ygNVbMXoNrR0PqNs/L/rckmAzwoNMVPTWY2/TQZo4ELHuqNYmCL
         6nuzVY26y2FuuCukaKQRUCNZQnSU8y1eYC2Cfpax8OV3Bj4F5txZubVukpZikQE7Da5P
         SkVUsQ50IuxaKU6Jm1P4KL8djjYdBDntSc2wWwbTXqGb7/+v1xnwYfHg0SRvRfB2Xex5
         /vktzLMKbouhGI/GbWLghjBwlIBfJSLW+CnYwhD7gvQMYMxoGg0Uxj4/ByNACRPTuU0I
         a7woCr+X5X/38PeD2NN3O30h5Snne5plnvtFfaWMTqk61ETLwQKJE/E5aSLyXeTpCXHv
         59Mg==
X-Gm-Message-State: AOAM533DFcNUGkfhbtxzG0I1w99aHY8GXudy0cGE3TC0EMRuoFTGRS5c
        C9oIfrXV8G9H8RluGus0pw9SOjf33wg=
X-Google-Smtp-Source: ABdhPJxqv/Sa9apKQ1EZ/4YgyXMKcgHy+Kg0N02TRtir2W4hUhqDr1AnkDpfNTuReCJJp1m0fJXyBw==
X-Received: by 2002:a17:907:2452:: with SMTP id yw18mr16910174ejb.191.1629390659141;
        Thu, 19 Aug 2021 09:30:59 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id r6sm2024595edq.20.2021.08.19.09.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 09:30:58 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: Fix SUNXI tile size calculation
Date:   Thu, 19 Aug 2021 18:30:56 +0200
Message-ID: <3519986.qLKfoAsNv3@jernej-laptop>
In-Reply-To: <20210819140009.158156-1-nicolas.dufresne@collabora.com>
References: <20210819140009.158156-1-nicolas.dufresne@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas!

Dne =C4=8Detrtek, 19. avgust 2021 ob 16:00:09 CEST je Nicolas Dufresne napi=
sal(a):
> Tiled formats requires full rows being allocated (even for Chroma
> planes). When the number of Luma tiles is odd, we need to round up
> to twice the tile width in order to roundup the number of Chroma
> tiles.
>=20
> This was notice with a crash running BA1_FT_C compliance test using
> sunxi tiles using GStreamer. Cedrus driver would allocate 9 rows for
> Luma, but only 4.5 rows for Chroma, causing userspace to crash.
>=20
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

=46ixes tag would be nice so it would be picked up for stable branches.=20
Otherwise it looks good. It also aligns logic with libvdpau-sunxi.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


