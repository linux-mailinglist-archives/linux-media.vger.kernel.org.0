Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5DDB621EB8
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 22:52:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbiKHVwc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Nov 2022 16:52:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbiKHVwb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Nov 2022 16:52:31 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D328A61BA9
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 13:52:29 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso108126pjc.2
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 13:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eH4cnpyyvwttbRJQYykn0Ih2Qb3q6VJdgpC1/rPDfX0=;
        b=PresJ2b6ZYZrTWDh4ivrMSyZlkg5W+C63PJrgmq8JV7QeQwpsEIQ9k93t+C9nLSzU8
         RFoXVF/q5hOaQbZCrRSxMl2M7INGdqADSShita0gC6fgwAYFRMr6r08fcih38eX9XdSE
         Fp1cD2kSv2Vm0tAWN7BnLMs87jKuTGczpPNkk/FQR5y4LTghtul42fsX9n5VM0Opeth2
         Z8PtIyMA90GblqJIojdbL0f3aVw+crQT+Gbnr2u6iEypHV/t2pqjbgxn1nMcdA/OZqSA
         kFdhC6O1EVFHVP88tPwsN8D39dqzCKFjEcgsNnsyMxE2HGkN7dhwt2C1Xh3ZFQJmxImK
         5TTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eH4cnpyyvwttbRJQYykn0Ih2Qb3q6VJdgpC1/rPDfX0=;
        b=6w3EdI7rdiepfN9Y7PiMBqDvJpWm6W3DE5GvDSfJM+4uooqJBSJkesocTl1poT6wxW
         Hgw5qES6QO6/y+cCh1p3Hb8V9ZKktQ7wxG2kE5H0HH1QEOLRN7XrJrXgv9vQQW39CIfK
         I/yMURWwEa+BlUEOYMbiZAW1KmrYYfNEVDFPCtRVrUkOCrfv8LVzr58LRJD4Uv5aw4EQ
         Qdwd3NC+Fjgcwmt+LPE+0FyFqDP48UeKSLS9ks8wD6dZDvFq+m7MdgTzHCEqQcq4TTaw
         eLtjdI39YXO+GbVwLEU5uYMDhrt5LGxqjyn8GQxKVHNozmqInEzsNIEjHRSbF7cDpUNh
         Z2NA==
X-Gm-Message-State: ACrzQf1TcgkpmOmrFzF5YcwXv7DgfHHui3+p8WALBgHfGuUyh9NFaQ3t
        Njq0gZg4oeNqiwhBVZn2aho=
X-Google-Smtp-Source: AMsMyM4lpWJEFd6Hsp6jtqmbEDn4om4uP2oitjQDYNUsHaZbNeQWxceoC1tjsvaH67hr+Bwpf0Yznw==
X-Received: by 2002:a17:90a:bf11:b0:211:84c5:42d7 with SMTP id c17-20020a17090abf1100b0021184c542d7mr74929156pjs.122.1667944349248;
        Tue, 08 Nov 2022 13:52:29 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:9f46:7242:26:f220])
        by smtp.gmail.com with ESMTPSA id m2-20020a17090a7f8200b00212e5fe09d7sm6536581pjl.10.2022.11.08.13.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 13:52:28 -0800 (PST)
Date:   Tue, 8 Nov 2022 13:52:25 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH 2/2 v8] media: s5k4ecgx: Delete driver
Message-ID: <Y2rPmVcj+n4ZrYul@google.com>
References: <20221108195329.1827323-1-linus.walleij@linaro.org>
 <20221108195329.1827323-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108195329.1827323-2-linus.walleij@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 08, 2022 at 08:53:28PM +0100, Linus Walleij wrote:
> This driver was until the previous patch unused in the kernel
> and depended on platform data that no board was defining.
> As no users can be proven to exist, delete the driver.
> 
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
