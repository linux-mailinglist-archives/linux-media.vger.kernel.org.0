Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A31E76D529F
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 22:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233290AbjDCUip (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 16:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232329AbjDCUio (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 16:38:44 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39070E1
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 13:38:43 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id eh3so122268439edb.11
        for <linux-media@vger.kernel.org>; Mon, 03 Apr 2023 13:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680554321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3F5+gh390KLS9RWOvvtlrwxg2Y0TraLv5K4Hb/H8OQ=;
        b=NEMhvrK570NYfHKHHwOAfmuEeVZApvKpl8+iN1zZSaaAv5qDjNOQhvVITYO5nCMg4p
         AaMoUv7H9IJZKK6kbJGWgNlyr0gZ7vLYAiY4ojUYdjTpnShjdT8XqiwmcmTRAsD7J1Q6
         jbN9A09WoawGsW4SY6woOKyFOw2JqhSs03w649lwv9VLoLtAkjjsPdRQaBhMhowpd4oM
         VzoU/5XuIXc6TGBI4hz6C7Ao91hZJiQNTSWJSWKql/YMZcsPrxjCyIhLB/Z1LMpeQIr3
         vuU4VP5frHjMDHSpeYgwXGyLwo+lHzN00JCd3mTVuBdZ5WNjhLK0HG3ihpxPmR42HMmc
         /sVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3F5+gh390KLS9RWOvvtlrwxg2Y0TraLv5K4Hb/H8OQ=;
        b=pFo2PFo+tWout1dWaWBeid64qMa3DrO5Zv8jr933HmsYvrUO1mi6ckvPKNmgcP/wIu
         7jDkIz21M4W+EdjAM3OIJxBxtWV6ejPw/B4Vhg7IOtW/Nn8EaA1X1hfmtm6PyDmacFJt
         qFf1IHBPvPvsrwqjFR9633G5v9dxCfv8DOdXdS2hbW+ZSfgYEmkUj+dOtmps+vhW54cj
         5E7aJ7vivVqZwkZ70spfJrxGET4FHuGEtsTUSeEQPDK1k2DnbuikLio7HPdeZKh4mV+i
         H03j+NtXlqTkBZPd8Qmibb5g3jHRUo168tVJzMui1xxdQUxGQTBiIVom1KPgZD/nx4++
         hUFQ==
X-Gm-Message-State: AAQBX9eX05CSokVW4JpI+dsLlrplR2tvqbWOjcUr0G1fMtoZ8GHSXG8B
        9ZjW4dWCfxbjVAFBrPWzoWod1++wa9z3LuPBgwC2sXDM6V8=
X-Google-Smtp-Source: AKy350aKb1gVyrTMlWc2SVlN/6Abvr+c2pXRCZ62TGHslwYEHjDydpW7wvfnTYk7uuxoUrkxTUA+BU0oyRYCGKRpts4=
X-Received: by 2002:a17:906:3746:b0:8b1:cd2e:177a with SMTP id
 e6-20020a170906374600b008b1cd2e177amr18564878ejc.6.1680554321707; Mon, 03 Apr
 2023 13:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de> <20230403154014.2564054-13-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230403154014.2564054-13-u.kleine-koenig@pengutronix.de>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 3 Apr 2023 22:38:30 +0200
Message-ID: <CAFBinCAsiSLwKho_7M4XoLXCk64XriwmBuosmMnWu=a1z97A_g@mail.gmail.com>
Subject: Re: [PATCH 12/24] staging: media: meson: vdec: Convert to platform
 remove callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-staging@lists.linux.dev,
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

On Mon, Apr 3, 2023 at 5:40=E2=80=AFPM Uwe Kleine-K=C3=B6nig
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
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
