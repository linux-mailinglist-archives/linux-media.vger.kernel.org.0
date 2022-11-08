Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63484621EB6
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 22:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbiKHVwA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Nov 2022 16:52:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbiKHVv6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Nov 2022 16:51:58 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3312061BA2
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 13:51:54 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id b11so15001040pjp.2
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 13:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GcStMse0gOXICqsZmCXHBwHRT6HyP0h5NPN69p3VUYA=;
        b=HeVicfNKsz0ivZ0S/ZRbClZFnvd1l1tN4CMybCaR30MZUQzZbNBwNdYQFv17solgnI
         41LKQAYwjD2Fiy5LiVZg1ve67FIKi8ss2AB02hTxjbfYwNtw+pKRXj4Tg5VKWWAOWH8Y
         uT1F7wH37GZx3PVgMcl21jgMPJ0TRJjFce1TVvj5q0ooo/U4RkkPiDa1QuzK4W9rOBBh
         bk7Sfubmd156xX+NJnD2isAdjuFkC/y7us2FwSLwN8kmy3sBDgax+fjLuPq5ExMOD8gI
         TR5xsdIgA8fh3VtwgFtsrMTG+6OE9Y4obWGHvETo+rANvOVKrCIHsXKH76hieW/ho+Fp
         iqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcStMse0gOXICqsZmCXHBwHRT6HyP0h5NPN69p3VUYA=;
        b=GY+CToGqvFt8UaKQpNpvp+5EfdgoiQUYQ0gBi+h4mR87/bh8QFkVCDzz3zKX5DVsvf
         f69dqIIsd9m7JqScTT5ebbrP/4SmAkwFFWEwiPwog6bbQ9lUAFt8v+cuAm0jNPlBszO8
         YgA6PN+3bWZZF4rJw5hIrX8jioJzWS1Zdd/MS00ygpSUiYZzpA61x5yJXT0Hd1qsEWoV
         ZkFtMZvotKtWXgwmK4Gud9F0OXn8cvOycbX15nyhQqL6gWRMWA3nJIlcudXjU3h7CHj1
         SsZO6ns2p1EoXHGDFaB5Zi7ZURyN+lg3FjGxjXVu030S2k8Pbe77FJVUbuoR2yz5Pu6T
         +tTw==
X-Gm-Message-State: ANoB5pkHODFxCZuGzaCvkR2HdAew9Lt2xrGUlQL2DOLJlOC8VwuM1gfg
        P+BtQnfmT+bhkRGmKG2odu8=
X-Google-Smtp-Source: AA0mqf47TPurVpbvaRt7PbSICrEmX1ldrfmnSs2VJ4meraCG3yUfzJMSxQsyPO98/udFw9LNB+RjMg==
X-Received: by 2002:a17:902:744b:b0:188:8e6b:978a with SMTP id e11-20020a170902744b00b001888e6b978amr2855127plt.11.1667944313514;
        Tue, 08 Nov 2022 13:51:53 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:9f46:7242:26:f220])
        by smtp.gmail.com with ESMTPSA id z17-20020aa79e51000000b0053e62b6fd22sm6772235pfq.126.2022.11.08.13.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 13:51:52 -0800 (PST)
Date:   Tue, 8 Nov 2022 13:51:49 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: Re: [PATCH 1/2 v8] media: s5k4ecgx: Switch to GPIO descriptors
Message-ID: <Y2rPdQ2nnqNVHmZu@google.com>
References: <20221108195329.1827323-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108195329.1827323-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 08, 2022 at 08:53:27PM +0100, Linus Walleij wrote:
> The driver has an option to pass in GPIO numbers from platform
> data but this is not used in the kernel so delete this and the
> whole platform data mechanism.
> 
> Get GPIO descriptors using the standard API and simplify the code,
> gpiolib will handle any inversions.
> 
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
