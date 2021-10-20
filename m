Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5068B4351D4
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 19:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbhJTRsp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 13:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbhJTRsN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 13:48:13 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CCDCC061779
        for <linux-media@vger.kernel.org>; Wed, 20 Oct 2021 10:45:54 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i6so158642lfv.9
        for <linux-media@vger.kernel.org>; Wed, 20 Oct 2021 10:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HmU3IYtqOVaBBCXv6tG4ho0Q93bXVlDzJUBG/qbhyts=;
        b=D9yK6ChAg/V54h2BZMeK2/pf+OrYqW51DlAufbp7PJsgsivMx1sLLlLsf40B0bLC6o
         2IbCko8+8SC8+j9nCRsFAQ0z5VWOHOHg9KYDjYjnQU7CKD4q5ikB5Pl0N18FJJo+Wf0s
         HpUf2CuPt2IwS4dOFjqFmew7/KPBn4sHM+36OFN6YqeTzTk7Tft7efmMx+SdplYswb2h
         29/CVe2pIVFSS3dARVn1Q9Zh+glFVI2pPpS0xi/jHGaX+MDNEDsTAMY/SX7BcJl2ixP1
         JcgDix4TindTACaEeU34KpYfJuLlpxUTHd5StLB2CwmCHFLUiRWD8D/BHvoadIeMwxPS
         MdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HmU3IYtqOVaBBCXv6tG4ho0Q93bXVlDzJUBG/qbhyts=;
        b=DkkCFxHwCZ/Ubq/REGISZqdMZhsQBD8pPwwCpOgtefoA0FHQUHkzjPzlNlJDErOaIu
         jedGXadkf4GXRiCBVFHDCxvQF3n3O7msxP/obsF/TCwYsGbXNH3jvwu56WUs5V3l7mK4
         qrnV4s9fvVWfTvj21IbVDeoOJp2d3gldZT6m2b0V3YZBgspIR34GoQ2ZpQEmajKRmmXk
         9IcL16V6QuZ+Jr9EE11VpDXMlPWuSZAwtqjZkUGd0UsDWLwiVcGPjOrXEWBwLBIrLT8s
         3gC12/3sOAB+ruofu5iK5oZfjbNHJhNueAVvkw+KP5lnjwkMoHcgedT9ymbY8+AzdnDm
         Zk2Q==
X-Gm-Message-State: AOAM532AcxjsYv43fmZB+bXoydiAokVTl3o41OPrX6Z1AgGAkYZfbRBK
        IH3+K5WKf5TUydRTlcAP4AejnI3ullBFyf1o
X-Google-Smtp-Source: ABdhPJwzu+QWOiEisGxWPs4PxleHqvSYO7THRPzyvHbEikU8RusB4SECNYD2ltXzpl9zqjbbJvQlgw==
X-Received: by 2002:a05:6512:1054:: with SMTP id c20mr654304lfb.59.1634751952080;
        Wed, 20 Oct 2021 10:45:52 -0700 (PDT)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id p5sm243104lfk.113.2021.10.20.10.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 10:45:51 -0700 (PDT)
Subject: Re: [PATCH] media: vsp1: mask interrupts before enabling
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
References: <20210926155356.23861-1-nikita.yoush@cogentembedded.com>
 <163455832550.1371157.18009256492359430197@Monstersaurus>
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <f91c4f16-fd81-5d70-0146-e9aa2d128da9@cogentembedded.com>
Date:   Wed, 20 Oct 2021 20:45:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <163455832550.1371157.18009256492359430197@Monstersaurus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

> Could you test to see if those lines to explicitly set VI6_DISP_IRQ_ENB
> and VI6_WPF_IRQ_ENB are really needed in your use case please?

Commenting out those register writes causes

[    2.275137][    C0] irq 188: nobody cared (try booting with the "irqpoll" option)
[    2.282621][    C0] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.15.0-rc5 #28
[    2.289669][    C0] Hardware name: Renesas H3ULCB Kingfisher board based on r8a77951 (DT)
[    2.297844][    C0] Call trace:
[    2.300981][    C0]  dump_backtrace+0x0/0x198
[    2.305348][    C0]  show_stack+0x1c/0x28
[    2.309357][    C0]  dump_stack_lvl+0x64/0x7c
[    2.313718][    C0]  dump_stack+0x14/0x2c
[    2.317725][    C0]  __report_bad_irq+0x50/0xdc
[    2.322254][    C0]  note_interrupt+0x2e4/0x330
[    2.326786][    C0]  handle_irq_event_percpu+0x58/0x68
[    2.331927][    C0]  handle_irq_event+0x4c/0x98
[    2.336456][    C0]  handle_fasteoi_irq+0xd0/0x180
[    2.341245][    C0]  handle_domain_irq+0x94/0xd8
[    2.345862][    C0]  gic_handle_irq+0xa4/0xe0
[    2.350216][    C0]  do_interrupt_handler+0x38/0x60
[    2.355093][    C0]  el1_interrupt+0x2c/0x68
[    2.359362][    C0]  el1h_64_irq_handler+0x14/0x20
[    2.364151][    C0]  el1h_64_irq+0x74/0x78
[    2.368244][    C0]  __do_softirq+0xc8/0x404
[    2.372511][    C0]  irq_exit+0x118/0x140
[    2.376521][    C0]  handle_domain_irq+0x98/0xd8
[    2.381137][    C0]  gic_handle_irq+0xa4/0xe0
[    2.385490][    C0]  call_on_irq_stack+0x28/0x3c
[    2.390105][    C0]  do_interrupt_handler+0x54/0x60
[    2.394981][    C0]  el1_interrupt+0x2c/0x68
[    2.399247][    C0]  el1h_64_irq_handler+0x14/0x20
[    2.404036][    C0]  el1h_64_irq+0x74/0x78
[    2.408129][    C0]  _raw_spin_unlock_irqrestore+0x20/0x50
[    2.413615][    C0]  __setup_irq+0x56c/0x888
[    2.417882][    C0]  request_threaded_irq+0xf0/0x1a8
[    2.422843][    C0]  devm_request_threaded_irq+0x84/0xf8
[    2.428155][    C0]  vsp1_probe+0x218/0xb48
[    2.432340][    C0]  platform_probe+0x6c/0xd8
[    2.436700][    C0]  really_probe+0xc0/0x428
[    2.440967][    C0]  __driver_probe_device+0x114/0x188
[    2.446103][    C0]  driver_probe_device+0x44/0xe8
[    2.450891][    C0]  __driver_attach+0xbc/0x1a0
[    2.455419][    C0]  bus_for_each_dev+0x64/0xa0
[    2.459947][    C0]  driver_attach+0x28/0x30
[    2.464215][    C0]  bus_add_driver+0x144/0x228
[    2.468743][    C0]  driver_register+0x68/0x118
[    2.473272][    C0]  __platform_driver_register+0x2c/0x38
[    2.478669][    C0]  vsp1_platform_driver_init+0x20/0x28
[    2.483985][    C0]  do_one_initcall+0x38/0x258
[    2.488513][    C0]  kernel_init_freeable+0x228/0x28c
[    2.493565][    C0]  kernel_init+0x28/0x120
[    2.497745][    C0]  ret_from_fork+0x10/0x20
[    2.502013][    C0] handlers:
[    2.504974][    C0] [<0000000040be598b>] vsp1_irq_handler
[    2.510376][    C0] Disabling IRQ #188

Nikita
