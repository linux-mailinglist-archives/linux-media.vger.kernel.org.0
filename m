Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACEE3754821
	for <lists+linux-media@lfdr.de>; Sat, 15 Jul 2023 12:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbjGOKJK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jul 2023 06:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjGOKJJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jul 2023 06:09:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F8C273B
        for <linux-media@vger.kernel.org>; Sat, 15 Jul 2023 03:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689415702;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tDYMyausyBRVukaFcfLlmDiXe2Aa3T9aabszsv5mhl8=;
        b=FRjvoV9V+xKxR7U3uHmiCcO78zNdo4iIXmo8GwsLcApyOIdr6QTQvPfjv3MVO+GmX1zB6E
        vHI28/bZfDWR+nnliis3O+7iMEKphP1Up/rzgOg8FfgcDSAWHyJZr/Pr1rdWPtEhWUVdSm
        bGI5OcnRVgeT2EaAGy6H4gdNaVHwcP4=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-jcxb5AeSP02H0ySbu40dPA-1; Sat, 15 Jul 2023 06:08:21 -0400
X-MC-Unique: jcxb5AeSP02H0ySbu40dPA-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2b6f0527454so25643481fa.1
        for <linux-media@vger.kernel.org>; Sat, 15 Jul 2023 03:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689415699; x=1692007699;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tDYMyausyBRVukaFcfLlmDiXe2Aa3T9aabszsv5mhl8=;
        b=Pp61Pv9jS9lNuHLoHSGR3R249F8TRx9AsXXf1cBLuKGwwvy2zPj0EqmW1cB2vmfy0f
         AU9gmkkIOltlQmEJ7ThQBPbetjVzmS+ZPU/kbxl7UTta8a1iCy+TAkrBZebtsjqFolHd
         ajStW4jH/JdX2pVP/XDSneQCatLrTEZkOyVSosSaPoHm9bGGfn0powp9nu38PJBvy3cR
         0vm1Ky7sFeXXf+kKsLKUHlJ+1S3tM0Xb+o/zbr3OnX0dxRzsY++JOZf51xmuaq0OBFuF
         e2hZUB1PcI4FNMF594kvqPRpGcsJiubRtq+nsXDylxQ+dzTZbPmp1y7bm7APo2otj8Ax
         uT9w==
X-Gm-Message-State: ABy/qLYKiyX3hM7Kk0Nr0047PRxxkDuX1vGQU3kEVWlohzSsA6nCSocl
        ty0gGnm6DKHCLs5Q3TaGRq+FmUKdZXlbID9h8hDq5TS55HooqPr2uHlGEHiHIHdBsDzww6pKq6G
        GA8mivr7/sC20YKjm+0QgdM81AOcpV5g=
X-Received: by 2002:a05:6512:3a89:b0:4fb:89e2:fc27 with SMTP id q9-20020a0565123a8900b004fb89e2fc27mr6783685lfu.54.1689415699386;
        Sat, 15 Jul 2023 03:08:19 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHmfFqbm32VY6oSbf7Qb4Ms1HIONcW/t++tSXC1I4v+3L7FKWClmLykXdiZ6tFd65N+4kU/3g==
X-Received: by 2002:a05:6512:3a89:b0:4fb:89e2:fc27 with SMTP id q9-20020a0565123a8900b004fb89e2fc27mr6783677lfu.54.1689415699042;
        Sat, 15 Jul 2023 03:08:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id by26-20020a0564021b1a00b0050488d1d376sm6971311edb.0.2023.07.15.03.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 03:08:18 -0700 (PDT)
Message-ID: <0389f874-b52d-d947-44fc-3f43f48b79bd@redhat.com>
Date:   Sat, 15 Jul 2023 12:08:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 00/11] #if defined(ISP2401) removal to make driver generic
Content-Language: en-US, nl
To:     Kate Hsuan <hpa@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230713100231.308923-1-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230713100231.308923-1-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 7/13/23 12:02, Kate Hsuan wrote:
> This patch set is to remove #if defined(ISP2401) to make the driver
> generic. We focused on removing the #if defined(ISP2401) in isys and
> necessary files related to it.
> 
> The changes include:
> 1. Removed #if defined(ISP2401) in isys and related directories.
> 2. Removed the debug codes for dumping status.
> 3. Made two individual enum to define the MIPI format for both types of
>    atomisp.
> 4. The input system code should include both input system (ISP2400 and
>    ISP2401) headers since a generic driver should cover all types
>    of devcices.
> 5. The initialization codes of the input system was modified to initiate
>    atomisp input system in a generic manner.
> 
> 
> Kate Hsuan (11):
>   media: atomisp: ia_css_debug: Removed debug codes for dumping status
>   media: atomisp: Make two individual enum to define the MIPI format
>   media: atomisp: Included both input system headers
>   media: atomisp: css_2401_system: Remove #ifdef ISP2401 to make the
>     driver generic
>   media: atomisp: isys: Removed #if defined(ISP2401) to make driver
>     generic
>   media: atomisp: hive_isp_css_common: Removed #if defined(ISP2401) to
>     make driver generic
>   media: atomisp: pipeline: Removed #if defined(ISP2401) to make driver
>     generic
>   media: atomisp: ifmtr: Removed #if defined(ISP2401) to make driver
>     generic
>   media: atomisp: Compile the object codes for a generic driver
>   media: atomisp: rx: Removed #if defined(ISP2401) to make driver
>     generic
>   media: atomisp: isys_init: Initiate atomisp in a generic manner

Thanks, I've merged this into my media-atomisp branch now:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

Please base any further patches on top of this branch.

Regards,

Hans


