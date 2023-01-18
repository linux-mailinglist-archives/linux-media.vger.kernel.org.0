Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B712D671433
	for <lists+linux-media@lfdr.de>; Wed, 18 Jan 2023 07:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjARGbW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Jan 2023 01:31:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbjARG1z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Jan 2023 01:27:55 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6842166F1
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 22:19:15 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id p1so17911662vsr.5
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 22:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HmoYt118ZjTHWWMfOpKXtSTl5dODMUSot4Q7h7871aQ=;
        b=Nl9KinkqXcxjT/e+vkrm94TpWxXCeABRQjFPm4BbkjeBjvPpMA1T7v8HnCkyMX3tec
         FOs2nwRLTNzQ/72sj1uJXZ30hKqTJyy7x6i02+TyVLAWZKXTx03SjKmsO6skCknyjPcF
         FhiU50qVq/3HCzPUw5RrTRIMjpMC6jMzt8H/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmoYt118ZjTHWWMfOpKXtSTl5dODMUSot4Q7h7871aQ=;
        b=4hbVx/FsDgqC+BZPLaUx+UDPd0VtP/4tiGveLBuqldZTRLCbBRC0ai23UjwxmJiQUr
         YTou7aQthhEXIrR6i1SA+e5m05FwOQ5QkaszT4v5Sjo/TVJm75jUUeJ6BEq/iGiT9DC2
         jVIZth8hSDLHxj3OVZ/ulRLd16P61oJyOT+4sg+FxodVBSveQzasFF3MBtHhuTRehUrU
         DP/v1QXfn1yDInLRJa/WXIAcsH+4PpDPAyZhFFlRdbeMmLIFuxNdwv5S76nLGc5IsOqO
         pWscTCrKxT9+l3OUbMl9QQcS2fQPjplHC/QeXBGflwwAuROL7x5WNzdEOABAxhWfBaxq
         D1Vg==
X-Gm-Message-State: AFqh2kpyAqfagug6Ph1vsy++1Tim0syQrcXd7a2UGDAGnV2hgoprwXcJ
        zh7TKsghKVvb7fiJtjTvRTInXFbSBuSXHa28R503DA==
X-Google-Smtp-Source: AMrXdXu3q/Ccd/qwHpRaUkE33G8Umu51qE1leIZFT1QPLDHfxoeiG1OZzkV74A4nrlHy6l8ynvVuYlLo+T6KY38jv74=
X-Received: by 2002:a05:6102:54ac:b0:3d0:af13:3b6 with SMTP id
 bk44-20020a05610254ac00b003d0af1303b6mr744236vsb.65.1674022754865; Tue, 17
 Jan 2023 22:19:14 -0800 (PST)
MIME-Version: 1.0
References: <20230117172644.3044265-1-arnd@kernel.org>
In-Reply-To: <20230117172644.3044265-1-arnd@kernel.org>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 18 Jan 2023 14:19:03 +0800
Message-ID: <CAGXv+5HzDXoCNLQAEZ9u0wc82Qqd4vTA=RahQ=dXb-Y-ySvWWA@mail.gmail.com>
Subject: Re: [PATCH] media: mtk_jpeg_core: avoid unused-variable warning
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Bin Liu <bin.liu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        kyrie wu <kyrie.wu@mediatek.com>,
        irui wang <irui.wang@mediatek.com>,
        Dan Carpenter <error27@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Colin Ian King <colin.i.king@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 18, 2023 at 1:27 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The only reference to mtk8195_jpegenc_drvdata is inside of an #ifdef:
>
> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1879:32: error: 'mtk8195_jpegenc_drvdata' defined but not used [-Werror=unused-variable]
>  1879 | static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
>       |                                ^~~~~~~~~~~~~~~~~~~~~~~
>
> Fix this by just removing the #ifdef and the corresponding
> of_match_ptr(). They don't actually serve any purpose here since the
> driver is only usable when CONFIG_OF is enabled, and build testing
> without that is not a problem.
>
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
