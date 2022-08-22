Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA3859C096
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 15:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235234AbiHVNbR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 09:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235228AbiHVNbP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 09:31:15 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87DE927B20
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 06:31:14 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id u15so12524785ejt.6
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 06:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=8r7BIjoasIUEZdXg2N4q2u4F3zO3DOtklhLZqt6JWWg=;
        b=D60msXWmUqbwg/uV8lvURpYnUYQo0L2zrsdfg4Yez2C2yk+mKZq4gDOfBq6lTm/xsb
         1luO+bvGH0blaw7aqMaXBlZAOHiobEbk9vP9HOIBhBGoWdXmfj6Bk3Xr+NSr7+9Q5Jzw
         uMN7FJUAN57h5sp0tOMxjBWsJvgVmc0TD8cmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=8r7BIjoasIUEZdXg2N4q2u4F3zO3DOtklhLZqt6JWWg=;
        b=WuC7NwmzQ87hyMR5Cwy64+e99qF0vI0Nx9UZdtomKq8Ifcb4l85JWJJxiBPIQ27WQk
         vEo4I67qkrN4NJksD/eVoppzxLUWX7qUkaWKVMCsss0p3QNYCIWCvteNrYpfPIjRWaaJ
         88M9/N75GytoIZ7TuxaONheNdwmIRG8qOEF/Vho0xzQMbdQVf0u5D7rb5HxGEOK9qubU
         9bkwgmdX/e8ynqamyi71hwbg3mIu8qF6z4+vBP06ixZnxnJXvdYhI6Hva6o/hny1GMDR
         5TQK2XRgxXTh7w7h63GUZLNE9bCBfqLg4xSeyUfRqc/C/LTXcHa9q7sp9+l3p9/Z23AQ
         QT8w==
X-Gm-Message-State: ACgBeo1D0TMl9LR5/N0yHkV8z+tFM+BgGSd9+ozH4NQ9kLE9oABKEHoq
        nSad8v7TTsv+N9103H//d+oReI1dZq8Mhd5A
X-Google-Smtp-Source: AA6agR5ea2Ic7uTdeInrZJKni8EUkTIuxH/UVcpscQ+vg5NXDApusIv4Fyry5kcmu9NmPx3lYbXU6w==
X-Received: by 2002:a17:906:98d4:b0:73d:7f33:98a8 with SMTP id zd20-20020a17090698d400b0073d7f3398a8mr3453002ejb.90.1661175072931;
        Mon, 22 Aug 2022 06:31:12 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id e2-20020a170906c00200b00730979f568fsm6195860ejz.150.2022.08.22.06.31.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 06:31:12 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id gi31so14714459ejc.5
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 06:31:11 -0700 (PDT)
X-Received: by 2002:a17:906:9f2a:b0:730:bc30:da30 with SMTP id
 fy42-20020a1709069f2a00b00730bc30da30mr13133746ejc.763.1661175071574; Mon, 22
 Aug 2022 06:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220808134106.70100-1-ribalda@chromium.org> <YwN+fU5ez0L5pi1j@pendragon.ideasonboard.com>
 <YwN/jeElxyXpyyfU@pendragon.ideasonboard.com>
In-Reply-To: <YwN/jeElxyXpyyfU@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 22 Aug 2022 15:31:00 +0200
X-Gmail-Original-Message-ID: <CANiDSCvyhUORSp7831DJsQGFF8Bw3uzEoTTV9FG8qunu-KrMyw@mail.gmail.com>
Message-ID: <CANiDSCvyhUORSp7831DJsQGFF8Bw3uzEoTTV9FG8qunu-KrMyw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix InterfaceProtocol for Quanta camera
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 22 Aug 2022 at 15:07, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

>
> As this is a v6.0 fix, would you mind submitting a v2 with these changes
> ? Mauro could then pick it up directly.

Done. https://lore.kernel.org/linux-media/20220822131754.102393-1-ribalda@chromium.org/T/#u

Thanks :)


-- 
Ricardo Ribalda
