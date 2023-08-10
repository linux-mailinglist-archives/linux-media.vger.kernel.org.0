Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE1B87772EB
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 10:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234188AbjHJIcP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Aug 2023 04:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232608AbjHJIcP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Aug 2023 04:32:15 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A258DC
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 01:32:14 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-4874cbe2eebso277737e0c.2
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 01:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691656333; x=1692261133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HF11CqYi6NhL1F8GJzpfBHOcQOn7pKc9CrEEDQPOQak=;
        b=I0fKn04m8+Eyq0QX1m7Kkl9rGpbcEnD86MqXqh7egTNhVO2uUjrA87G/6hJcmnV7jp
         tYp5fjDk+XvCkFJZtgm9LVtiNBCLHbAiTZLAGLucAQdv7X3CU2A1dmqrA6g/UYm6JfFM
         9pVjj7WoW0+Vdsf8isGAEja7UdoHzvETea4nM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691656333; x=1692261133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HF11CqYi6NhL1F8GJzpfBHOcQOn7pKc9CrEEDQPOQak=;
        b=djh1zdrkejgkv2L+/1S5jA5BiVZB0t1VcDnOkxLpYnpWmgUWY5Vuopy75oZZ2Z3MbM
         XVoz0MloF4YHPbQ2kFKNmXY5ol/fw2w3oWZKoVdRbsaPuhLUYsqKC2/Hd4bI7YcrB5wo
         T9SWWSRH90TSztM7MUlzGyW+PpFUKq7HDI2mULR8TbLxv4gUg6Hwpi7aG8/eijcyE4VU
         NTuNazAGvn6OcOm5IA8t+cJMrrdMeRmNt78VVa2N4tkD//Ex77Aj79eaKfEehccoZpas
         Uh2Cc57SUcfiGPaokI1tb68CKllgMVDcqRUtXtJU4aeiMQ6bjTQQal70zkhEtlcVTsR1
         ElkQ==
X-Gm-Message-State: AOJu0YyiUHx2C60D0AsjV5qz9A89+x+yLWs5CcICQuOSFWAlPQJkYrvk
        JkIijOgbG+hUXIf52KKbky2djCS1+1QddgTaqJ/Fzg==
X-Google-Smtp-Source: AGHT+IFZUfyXIrF6NX6XHtpQ1aRnF9OycIBf0Ukf4jcjAWkHaOt4TORLmdHUVCNyTHszLlmzibhIj00QuOu2mU1+FY4=
X-Received: by 2002:a1f:bf58:0:b0:486:4b43:b94a with SMTP id
 p85-20020a1fbf58000000b004864b43b94amr1593934vkf.6.1691656333217; Thu, 10 Aug
 2023 01:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230810082333.972165-1-harperchen1110@gmail.com>
In-Reply-To: <20230810082333.972165-1-harperchen1110@gmail.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 10 Aug 2023 16:32:02 +0800
Message-ID: <CAGXv+5EOwT4ZvTLkvT_26UFk4Eg1Hi0iERp=NpmtQ63g3dZ+qw@mail.gmail.com>
Subject: Re: [PATCH v2] media: vcodec: Fix potential array out-of-bounds in
 encoder queue_setup
To:     Wei Chen <harperchen1110@gmail.com>
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        yunfei.dong@mediatek.com, mchehab@kernel.org,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 10, 2023 at 4:23=E2=80=AFPM Wei Chen <harperchen1110@gmail.com>=
 wrote:
>
> variable *nplanes is provided by user via system call argument. The
> possible value of q_data->fmt->num_planes is 1-3, while the value
> of *nplanes can be 1-8. The array access by index i can cause array
> out-of-bounds.
>
> Fix this bug by checking *nplanes against the array size.
>
> Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video E=
ncoder Driver")
> Signed-off-by: Wei Chen <harperchen1110@gmail.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
