Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 582BC3D4C85
	for <lists+linux-media@lfdr.de>; Sun, 25 Jul 2021 09:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbhGYGhk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jul 2021 02:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhGYGhk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jul 2021 02:37:40 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB57CC061757;
        Sun, 25 Jul 2021 00:18:09 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id j2so6301075edp.11;
        Sun, 25 Jul 2021 00:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u/kv+qiWF03A7w7M6dF1ZmKxWsFD09boQ1cuGR0P9Tw=;
        b=IJ0jakbLPBa6zHAcGvf7woKndogt6phHRl9SQRxUZRuBuDScZXtcvf3DqfS8IqEZq/
         2HOkVxd6YKuTC+7hRAaonCv3L6h9SbZlPk8WyXLW7t3lpieKqFSTBfrURe7TuOXMyU/A
         4wrmtsB6D50hB1lkbbUKOoIQomgjMs1P1AAzn57332uKM853f0fGDKpJRllIidSNjfl8
         xDQSMT0qaMzBFq8WwsVJloqPBHAWWyh3NqMV0Y88MH1/06P0GNcxaTT5tSRwRMMjBKIN
         vqeONvEneuLolCL/bJP87bM1Q+WNCVHPQw+rgIkqg1ae9WVs9fxcPgmTsmYY+8C9tv6A
         fRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u/kv+qiWF03A7w7M6dF1ZmKxWsFD09boQ1cuGR0P9Tw=;
        b=ohDpkxXrddx6HJtqagOOVNrfCTqxtS5AFL5cSXznn3APDvQ4C7mKmK5xEHD4OtWgOh
         /7FrkqZ7jDMrcalPM/3SmdwJN5JDB8ySEQ2LQ6veFkjx8iXz4xKX/6e7bfNGkk3Uy/IS
         3bmq+Ht6yPE8VCBWfSFBdOYCKs22HYANRYxIqLez9sNyBPIOoao81sFqPxz/fmv1xH9o
         k1CrFZKy3QdccjjiUlqLefXOinOoPfqzErdKpwNmE4F2X05uNLZ/nqrqaKtipKlPVQfr
         U/iiPQ3YDRGglTNguotKquAPCi/PGnwnMaRLbFNNqZoWz1HdyDNku4RzsSOjk79lCWsJ
         nIPg==
X-Gm-Message-State: AOAM530hmJkCMdjyqX9FDmtbm3TnZzApY6FfDXwH5s98vS3bhbol3qO6
        AcEbNxCsUyhBuyR5y29nmjI=
X-Google-Smtp-Source: ABdhPJw3Na5dUkmVYn4w0+i5JarsE3BXeCTQt7OFRukWTxiF3T7/aECyfnd/lu3p+R8DRy9EnqEjaA==
X-Received: by 2002:aa7:ccc1:: with SMTP id y1mr14734881edt.321.1627197488366;
        Sun, 25 Jul 2021 00:18:08 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id q8sm13746271edv.95.2021.07.25.00.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 00:18:07 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     hverkuil@xs4all.nl, ezequiel@collabora.com, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk, nicolas@ndufresne.ca,
        cphealy@gmail.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v1 1/2] media: hevc: Add scaling matrix control
Date:   Sun, 25 Jul 2021 09:18:06 +0200
Message-ID: <2286473.lRjZ1T8nZx@kista>
In-Reply-To: <20210715151223.656453-2-benjamin.gaignard@collabora.com>
References: <20210715151223.656453-1-benjamin.gaignard@collabora.com> <20210715151223.656453-2-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne =C4=8Detrtek, 15. julij 2021 ob 17:12:22 CEST je Benjamin Gaignard napi=
sal(a):
> HEVC scaling lists are used for the scaling process for transform
> coefficients.
> V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED has to set when they are
> encoded in the bitstream.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 57 +++++++++++++++++++
>  .../media/v4l/vidioc-queryctrl.rst            |  6 ++
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     |  6 ++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 ++
>  include/media/hevc-ctrls.h                    | 11 ++++
>  5 files changed, 84 insertions(+)

LGTM, this is dependency for Cedrus patches I sent some time ago.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


