Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8ECC6C9BB0
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 09:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231968AbjC0HLV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 27 Mar 2023 03:11:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbjC0HLU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 03:11:20 -0400
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82F1E422D;
        Mon, 27 Mar 2023 00:11:19 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id e65so9177036ybh.10;
        Mon, 27 Mar 2023 00:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679901078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zm/i78Y1B477CpiZq/AT0pA1dKvGwwrNWCLMjpg/Ojw=;
        b=DyBYSNSTHuze+3Wd7C2o/1Ng/uXB64MswWtMhsk5lBOG841mvskWnytrkQDnGKqEIX
         fzbOrgio+hJu7dTZyuE5MGCsy6BtpP2/fqKSTnOHFQmIWWoIsMmIxDBNEivd5rkucDD4
         Knx7SZXyZhKXkr1ihNp0gHZAcwXiprcSsZspyf/UBBvzW+S5jTeHg/4v3xcX/wveq++Y
         MEWN9A5Qwr6iWlFJSRdVClIsmtMZt87yXv21dpel4vwwuD5GojxNki9f6ZrRkeliuJUk
         M+X66/HW8S5q5M9yiSsmHvH0OiAvUgbYmehIFCzxjZ301+Hw3hSS5QaPT4TrX+CLarF4
         o5GQ==
X-Gm-Message-State: AAQBX9cQxgEVnEccvNNvGxWyMlCMFDBvQY9xr+l0HTUM/0s/dsE0bVNR
        VA9n+Qws/D8nJg1TP6qWP14cEcCJdiJihQ==
X-Google-Smtp-Source: AKy350bQJvS4jmiHslK48ktRnkHmqMZ8W2Mt8dKGl9qmtpKIN6qaygE6YJeXKMQQJdMTJivQtXIA/A==
X-Received: by 2002:a25:dc82:0:b0:b72:1171:6366 with SMTP id y124-20020a25dc82000000b00b7211716366mr10516392ybe.30.1679901078609;
        Mon, 27 Mar 2023 00:11:18 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id a19-20020a25ae13000000b00b7767ca7471sm2145805ybj.14.2023.03.27.00.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 00:11:18 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id k17so9182643ybm.11;
        Mon, 27 Mar 2023 00:11:18 -0700 (PDT)
X-Received: by 2002:a05:6902:722:b0:a09:314f:a3ef with SMTP id
 l2-20020a056902072200b00a09314fa3efmr6474159ybt.12.1679901078299; Mon, 27 Mar
 2023 00:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-56-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-56-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Mar 2023 09:11:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfqrRtZ+8iMp40FZF8j6-KuYDZhMvH3AQfpgE65vO+ow@mail.gmail.com>
Message-ID: <CAMuHMdXfqrRtZ+8iMp40FZF8j6-KuYDZhMvH3AQfpgE65vO+ow@mail.gmail.com>
Subject: Re: [PATCH 053/117] media: rcar_jpu: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Mar 26, 2023 at 4:33 PM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
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
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
