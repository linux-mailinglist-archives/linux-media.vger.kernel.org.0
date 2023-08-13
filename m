Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDB277A652
	for <lists+linux-media@lfdr.de>; Sun, 13 Aug 2023 14:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjHMMPV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Aug 2023 08:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjHMMPU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Aug 2023 08:15:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE091702
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 05:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691928876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dmugjsA8FZEOjalRazZ5wFhN6kcXS5shyKkbplJZcqY=;
        b=E/BNsatvXqVBkYGHbwUAJauzOIUWDQFFsXqricvlgviyNLNGSk1x2fukEOL6P3qnL2DSjy
        K3ArRI1eKlI2A34THk0K7SP+lkT1CNQ9NaPEaFn+Wyh9teNFOVqbLSso7nX3BfT7IaGLet
        2zqKVKknELAcEci586y97sDlj0l+W10=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-Yu4YBp-8MvKdd8f3hnhbkg-1; Sun, 13 Aug 2023 08:14:34 -0400
X-MC-Unique: Yu4YBp-8MvKdd8f3hnhbkg-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4fe6141914cso3003439e87.1
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 05:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691928873; x=1692533673;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dmugjsA8FZEOjalRazZ5wFhN6kcXS5shyKkbplJZcqY=;
        b=DxKYAWYvJH95dAgmDyTKE0nORfZheMY5qUwW1HHlftW91NCL8yuqxsKj9PQ0OIEaoY
         3ZHL5L9WyqoAbO3r7Sk2lfbWHXiCuG/t4fhgsiYl9Czuir9VgiI4iz0K9uENDmdpn+oV
         wszpzdmkh3C+ynq19S/aI9I2srTPblfDCxK4//M/sS3/EqLozlOR1bnZyMqvHoEpdzCE
         1jpoM+Lt8Vx8PCZjVSI0xliAlTJizNUHbeHTNioQTxgx5W0yVWVYtKWdB1uyronpwSUS
         Rodg13oS0bV7DXTN7T0wTDejxThShFuPpF4044J8gZVM9uhCw9k64u6+Wn65axUxF4v0
         821g==
X-Gm-Message-State: AOJu0YwQ/FMrjYNCn/G+zG+doASfgeUMwg2jOA/F2BgPlI6jsf4k4cBQ
        T6gPaTZNxroTmz1OMaVhI47TwfGG+t/wdThKpa4VvREi9NyT8NYQjeN9uUSzMEY3gHZ0dCHv6hf
        M2r4ErPOFj/H35hVrTIndAX7Bf3dhvLc=
X-Received: by 2002:a05:6512:3e26:b0:4ff:7004:545e with SMTP id i38-20020a0565123e2600b004ff7004545emr1365672lfv.4.1691928873108;
        Sun, 13 Aug 2023 05:14:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5th2mtGQEuLIdrq+uZxJRyQAJhDgR3NgIxEgSmvSEXVTPabvOC++mBuWNe6S+9y1efRsK1Q==
X-Received: by 2002:a05:6512:3e26:b0:4ff:7004:545e with SMTP id i38-20020a0565123e2600b004ff7004545emr1365664lfv.4.1691928872760;
        Sun, 13 Aug 2023 05:14:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i23-20020a170906265700b00991bba473e2sm4511951ejc.85.2023.08.13.05.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Aug 2023 05:14:32 -0700 (PDT)
Message-ID: <62c59a37-c317-4c91-9576-56d2ab063c7d@redhat.com>
Date:   Sun, 13 Aug 2023 14:14:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/2] Removal of the old videobuf framework
Content-Language: en-US, nl
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Deborah Brouwer <deborahbrouwer3563@gmail.com>
References: <20230813085708.305770-1-hverkuil-cisco@xs4all.nl>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230813085708.305770-1-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 8/13/23 10:57, Hans Verkuil wrote:
> Now that the last driver (bttv) that used the videobuf framework has been
> converted to vb2 (Deb, thank you very, very much for all your work on
> this!) we can remove the framework.
> 
> This series does that. The first patch removes an unused videobuf include
> that apparently was missed. The second actually removes all references to
> videobuf.

Thanks, the series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans




> Hans Verkuil (2):
>   media: atomisp: remove left-over videobuf include
>   media: remove the old videobuf framework
> 
>  Documentation/driver-api/media/v4l2-core.rst  |    1 -
>  Documentation/driver-api/media/v4l2-dev.rst   |    8 -
>  .../driver-api/media/v4l2-videobuf.rst        |  403 ------
>  drivers/media/v4l2-core/Kconfig               |   16 -
>  drivers/media/v4l2-core/Makefile              |    5 -
>  drivers/media/v4l2-core/videobuf-core.c       | 1198 -----------------
>  drivers/media/v4l2-core/videobuf-dma-contig.c |  402 ------
>  drivers/media/v4l2-core/videobuf-dma-sg.c     |  681 ----------
>  drivers/media/v4l2-core/videobuf-vmalloc.c    |  326 -----
>  .../media/atomisp/pci/atomisp_compat_css20.c  |    1 -
>  include/media/videobuf-core.h                 |  233 ----
>  include/media/videobuf-dma-contig.h           |   30 -
>  include/media/videobuf-dma-sg.h               |  102 --
>  include/media/videobuf-vmalloc.h              |   43 -
>  14 files changed, 3449 deletions(-)
>  delete mode 100644 Documentation/driver-api/media/v4l2-videobuf.rst
>  delete mode 100644 drivers/media/v4l2-core/videobuf-core.c
>  delete mode 100644 drivers/media/v4l2-core/videobuf-dma-contig.c
>  delete mode 100644 drivers/media/v4l2-core/videobuf-dma-sg.c
>  delete mode 100644 drivers/media/v4l2-core/videobuf-vmalloc.c
>  delete mode 100644 include/media/videobuf-core.h
>  delete mode 100644 include/media/videobuf-dma-contig.h
>  delete mode 100644 include/media/videobuf-dma-sg.h
>  delete mode 100644 include/media/videobuf-vmalloc.h
> 

