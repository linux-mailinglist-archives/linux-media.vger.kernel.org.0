Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A7586D52AD
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 22:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233460AbjDCUkI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 16:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233465AbjDCUkG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 16:40:06 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F646170F
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 13:40:03 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id b20so122348938edd.1
        for <linux-media@vger.kernel.org>; Mon, 03 Apr 2023 13:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680554402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlKcaKh18h+QBmr9urMB1rRvxToOGdnmDwwJL+gmwVk=;
        b=KNd/boOKN6y2/PjCeVSU+vPcnQDoudhrGK0UpOmstKZonIbjoJzZS04aRj0j+mOZvK
         qgAyo97MIqwMwrM8H/UbXggTC2XfwOQZMVPsoNvnyIdTQiGHCUkF/20T+wZJ5rc+Ybuz
         2tui8GG9it6Qj5JxWUxzmAhPLlJgmxez7I05/TBVd3Y/KNcHdvmUk+jCfGGMcrLDvQEs
         HehtOTvpmtXFkgyq1ZxUuo3Rv32Z5AfdBR2WKja9oU5HJdQk+3dp7A0JbboHMqEBdXBF
         PLDxGF6TvSJLzi04fxak3Pfyqo2rObKBCbjqkvWsmVOlAX/z6vIQEtcYvTaxUsavxKfi
         seWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlKcaKh18h+QBmr9urMB1rRvxToOGdnmDwwJL+gmwVk=;
        b=x8twHCK6is/aXwguspb99xQK52tydwaMGMD1aEwFSroUi8ND/4LhXNX36w5ZjZBsip
         uKkpCwEpdb18dwnRW1vxvOep76SYQtpAazGLbkkpJo/16hGPx4RGcXTMGrnJYG+ImgpX
         oObRG6lYm30RZhI6yUpJXuR1Uewv/ex4Bxyaxb85TbwrAEMjkPIvvHRxqhOuHADSQvYh
         lgPUt6W23KO/0U3Vmz/QS8jUQTMYNOtqguVs8qBCNS1PSE4WoKAH07kVO0BlQc+cMVjm
         nQ5pdvf6KbnKlYCcwOzQlFvq43P4PLF4NeafiXs0JgV8fgfgRnXV4SSXxnEgR8POwvlM
         EebA==
X-Gm-Message-State: AAQBX9fsKrk/bcf0tdCGEzs4LBYEms7AQ3sstxcgUpIC7ig/YSUtWZEy
        HpCZHNZBVE4N6FG9dGb76fLRElDVJ/tnlRmm3eo=
X-Google-Smtp-Source: AKy350aH9R6cBFgVsiy0JqLI7fVfIZFzryyfFLxVuvDgg1GsqbpxdaHQ2NTwI3X5cLKiWPBFLPLXff/v+f2giwpeCRw=
X-Received: by 2002:a17:907:6b8f:b0:932:4577:6705 with SMTP id
 rg15-20020a1709076b8f00b0093245776705mr599ejc.6.1680554401878; Mon, 03 Apr
 2023 13:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-7-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-7-u.kleine-koenig@pengutronix.de>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 3 Apr 2023 22:39:51 +0200
Message-ID: <CAFBinCC1div=aEyEt6BBO_kQvf-R2hqpP8t6KTGtjyxOy2RVrQ@mail.gmail.com>
Subject: Re: [PATCH 004/117] media: ao-cec-g12a: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Mar 26, 2023 at 4:32=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
