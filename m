Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07EBA6C9BBF
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 09:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232190AbjC0HOI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 27 Mar 2023 03:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbjC0HOH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 03:14:07 -0400
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D9C63C17;
        Mon, 27 Mar 2023 00:14:02 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5418d54d77bso151929127b3.12;
        Mon, 27 Mar 2023 00:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679901241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdu1/SELA1EXn46uYNL8wkjHN7anSzws7qjTQ/qzthM=;
        b=PC/8FWXcspalmeiPri/G0P6Ru1WvN7Po7SzNrl5xEyWuzFv9wrps1fvqBSmRJNhJ68
         A8It/Vq74hqf2287x4iosTWPHWyqLoaAPdsyadBXVLIbLlpSKPlvLLbTlffS6CZGRmYR
         x6tGDqvsC++KaZ9+LV7Mav69328jfx0ksLpPvSbIccKI6/KVr5QS2fUl5RBa7QMZZSXT
         koQIexPVQ65kEJsxLeXCIXw8+Z3WO+M47Fd4v3jYS7FEMvRZ50YDQmEOg1+BRkNZuau9
         SOL326dHeu+FbHmqdgFxLB81z5MQgrwKbDqA6BfbdAOo2anSiSArY841fYBxK5MAu1+n
         JOhw==
X-Gm-Message-State: AAQBX9eJ9fUXfkDBIdx+QneyCbSQTrxUfu/U5JVnmr3wT/sfuF5ExQM5
        UMWWBR1NoUvfUDw7OPhv3CIsnAKanfxUeg==
X-Google-Smtp-Source: AKy350bed4UUqvf+bZydkPGjYLQ4ciI2xBOLE9T/n4DfR8NxXOm6Ufsp+fJm6tCIkzjNG2txAyme6A==
X-Received: by 2002:a81:4f87:0:b0:541:759d:b743 with SMTP id d129-20020a814f87000000b00541759db743mr11118318ywb.38.1679901241411;
        Mon, 27 Mar 2023 00:14:01 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id l39-20020a81ad27000000b00545a08184f3sm1843602ywh.131.2023.03.27.00.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 00:14:01 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5456249756bso152361247b3.5;
        Mon, 27 Mar 2023 00:14:01 -0700 (PDT)
X-Received: by 2002:a81:b647:0:b0:541:a17f:c779 with SMTP id
 h7-20020a81b647000000b00541a17fc779mr5009209ywk.4.1679901240874; Mon, 27 Mar
 2023 00:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-53-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-53-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Mar 2023 09:13:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVB-MxCbOG4zhRVafpo7+VdnEDz1fc5TXO_nu2a=EmPcw@mail.gmail.com>
Message-ID: <CAMuHMdVB-MxCbOG4zhRVafpo7+VdnEDz1fc5TXO_nu2a=EmPcw@mail.gmail.com>
Subject: Re: [PATCH 050/117] media: rcar-csi2: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
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

On Sun, Mar 26, 2023 at 4:34 PM Uwe Kleine-König
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
