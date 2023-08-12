Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35778779F6F
	for <lists+linux-media@lfdr.de>; Sat, 12 Aug 2023 13:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236477AbjHLLDl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Aug 2023 07:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234822AbjHLLDk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Aug 2023 07:03:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 281B5A3
        for <linux-media@vger.kernel.org>; Sat, 12 Aug 2023 04:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691838183;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c2GV+MmfJdwb2+T6uThFnRnwjkPBZMA3GH/GlPWF0S0=;
        b=cWoYp5FwK51Vav+2M8kMztdIh1Z8xzphJkFUBlaSNWnMZim5BxnC8UYoxUFMpoFqwFRVWO
        LPA4clpL0oadq2Cy8e4YK0/6nfZLyJqPeLwT6SnQqZhDu8Ob/JOCxdXOvsXBHxIoHNUqGd
        CvnQdyA/BpyFsqRM7O6ewK07fPb/9UQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-0FCqxQSCM7WlgA1Q6zbdwg-1; Sat, 12 Aug 2023 07:03:01 -0400
X-MC-Unique: 0FCqxQSCM7WlgA1Q6zbdwg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-99bd6ea0d9eso183350066b.3
        for <linux-media@vger.kernel.org>; Sat, 12 Aug 2023 04:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691838180; x=1692442980;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c2GV+MmfJdwb2+T6uThFnRnwjkPBZMA3GH/GlPWF0S0=;
        b=D4e8pocGP+WL10Sj3wpepUPFcEIj9ky1EkbDfYommAyyGzlKzrtQhhkd4k9SNMpzRU
         +s/6p5M95oqO8QoK+DGMKdh+aQG3SlSEu8Rjp2JcaABputgHAM/jwdJrPLiOhoT3Lp/r
         qZbDDBC9Jnyx2y+siOqC4irhYLBGCQvmND6jbhR0oTpswxF+sNI6M1m1BTccuYFk2gVx
         qfZAa2GEgwwgh03n4kR3aijP86/LypJkpNDUjNmbKYSQFQgHdhBOdKldIA+1w5ulp/4C
         M2Hd1vTGuiCZREi/rvlnYqSkoHEcmsR8WS4B8rORqR3VQYHkG4OqQkdaEzJpFi6wjuWk
         7fIg==
X-Gm-Message-State: AOJu0YwE8ZI/MwoPlujwnGlo9+E1u3KNi69QgiSbXfZX82KxHC5esdbO
        c7Q2MUo8T/vdtbn50m8D58iM2mjTdG2TUkJ5VeSWLRXGk31qW6SugahNBwm7D9OzaD+/pLyTr11
        biZzI6vPI8ECUMDWPevece16IbaWNGB8=
X-Received: by 2002:a17:906:8458:b0:99c:5710:674a with SMTP id e24-20020a170906845800b0099c5710674amr4096366ejy.37.1691838180117;
        Sat, 12 Aug 2023 04:03:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJXYFBbu5uWfrMiynh4BxqH2e07HqKYg+/DlAdR7ZJyWQSCF7C7zL6oQPrUcgF+srdFa/uhQ==
X-Received: by 2002:a17:906:8458:b0:99c:5710:674a with SMTP id e24-20020a170906845800b0099c5710674amr4096352ejy.37.1691838179867;
        Sat, 12 Aug 2023 04:02:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id qn17-20020a170907211100b00992b510089asm3328648ejb.84.2023.08.12.04.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Aug 2023 04:02:59 -0700 (PDT)
Message-ID: <e69b189d-2a43-2b5f-4039-ac700c849a59@redhat.com>
Date:   Sat, 12 Aug 2023 13:02:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/12] Make atomisp driver to be generic
Content-Language: en-US, nl
To:     Kate Hsuan <hpa@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230802095606.1298152-1-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230802095606.1298152-1-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kate,

On 8/2/23 11:55, Kate Hsuan wrote:
> This batch of work removed all the #ifdef and made the driver able to
> drive both ISP2400 and ISP2401. The changes include:
> 
> 1. #ifdef were removed and the driver execution flow is determined in
>    runtime.
> 2. ia_css_mipi_frame_enable_check_on_size() wasn't used so it also
>    removed.
> 3. sh_css_config_input_network() for ISP2400 and ISP2401 was determined
>    in compiler time. This was also renamed to
>    sh_css_config_input_network_2400() and
>    sh_css_config_input_network_2401() for both types of atomisp.
> 4. The atomisp type test at the begining of the driver was removed so
>    this driver can drive both types of atomisp.

Thank you, all 12 patches look good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

And I have merged this into my hansg/media-atomisp branch now.

Regards,

Hans



> Kate Hsuan (12):
>   media: atomisp: ia_css_raw.host: Remove #ifdef ISP2401 to make the
>     driver generic
>   media: atomisp: binary: Removed #ifdef ISP2401 to make driver generic
>   media: atomisp: hive_isp_css_include: Removed #ifdef ISP2401 to make
>     driver generic
>   media: atomisp: atomisp_compat_css20: Removed #ifdef ISP2401 to make
>     driver generic
>   media: atomisp: sh_css_mipi: Removed unused code
>     ia_css_mipi_frame_enable_check_on_size()
>   media: atomisp: sh_css: Removed #ifdef ISP2401 to make the driver
>     generic
>   media: atomisp: sh_css_sp: Remove #ifdef ISP2401 to make driver
>     generic
>   media: atomisp: sh_css: Removed #ifdef ISP2401 to make driver generic
>   media: atomisp: sh_css: Renamed sh_css_config_input_network()
>   media: atomisp: sh_css: Removed #ifdef ISP2401 to make code generic
>   media: atomisp: sh_css: Removed #ifdef ISP2401 to make the driver
>     generic
>   media: atomisp: atomisp_v4l2: Removed unnecessary code
> 
>  .../media/atomisp/pci/atomisp_compat_css20.c  |  14 +-
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |  19 --
>  .../hive_isp_css_include/host/csi_rx_public.h |   2 -
>  .../host/pixelgen_public.h                    |   2 -
>  .../staging/media/atomisp/pci/ia_css_mipi.h   |  16 --
>  .../isp/kernels/raw/raw_1.0/ia_css_raw.host.c |  21 +-
>  .../atomisp/pci/runtime/binary/src/binary.c   |  15 +-
>  drivers/staging/media/atomisp/pci/sh_css.c    | 232 ++++++++----------
>  .../staging/media/atomisp/pci/sh_css_mipi.c   |  29 ---
>  drivers/staging/media/atomisp/pci/sh_css_sp.c |  60 ++---
>  drivers/staging/media/atomisp/pci/sh_css_sp.h |   2 -
>  11 files changed, 143 insertions(+), 269 deletions(-)
> 

