Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F24F542200
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 08:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356333AbiFHCRD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jun 2022 22:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445595AbiFHCMv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jun 2022 22:12:51 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCBBE1E288F
        for <linux-media@vger.kernel.org>; Tue,  7 Jun 2022 13:32:27 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id a15so17145824wrh.2
        for <linux-media@vger.kernel.org>; Tue, 07 Jun 2022 13:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=+4Ntdp7pJmBmtDfe7mX/uE/xQNUen+uhfAxXK8rlZaE=;
        b=lwSSrft6uaVVcJQfE6rRxWsVxZMvvKCnrVM9jSfpofNUj+Bc4c6ks0Sj6belVPb4HL
         wD/EQMJJzo5/vHbB3SgQlSRSUFl0Vouem3IHI3FXmgWliSehjiKhFCTIeHRrjDNnjtec
         6P4NuFNP47IZ57+QuIGaSFektV42HF80jdinYRryqka4mKa69/nm11PtfiDfJAKlzZ4c
         kp1iuf5BDzVAENeRNGoA5vhnApIa5g/1RWo1MgP5tZxz8ZYktAYHpk2eAEf7XYUqQt+l
         lEMFwKEeQVE00FNcOCMv4H7GQC46CLrYhj2hM93rWd8hCDA5lfypKfdM3NcSXoS+/pWV
         3cmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+4Ntdp7pJmBmtDfe7mX/uE/xQNUen+uhfAxXK8rlZaE=;
        b=d1l09hQe+rRepSm4+2RKOEhqV65XxyOxPJAjnKq/V0/kaDfwnw0Cxp2uhTJru7dm37
         nT8WaZI1yW7kzlXN0svUZV1rs9pKztq2k/Sq3rzT84UuaLZJ6X5fIQbJcgCDJb47xBQW
         LhQapGt0sITDSrdAbIvQlEfJxZClqfeaHFCKWwsdTWPlk1ZHGV7aCe5XOw3fNv0m/d57
         qIKEz59tAKJllCE8MqYjt5dJ8+SZSgDE5eJeAhKjb8EMUcPUEi9qTmGWlMHDtqRYLPqx
         b+mHDdz7/9m+fHjsF0uTEyddIWp6USU4UdxfHz9F08vEawvkW0ryOmc3W55HjMtG11ft
         vFTA==
X-Gm-Message-State: AOAM530BiwPIXWzcrSleQK6DyoF30GfIXLVLdIDVqSWkx1w2IdTNkwTD
        oaQPvhdh5zYu28Hz7eyEAv+VhRHWzq4=
X-Google-Smtp-Source: ABdhPJysMals7H2L2jMzFT9UR4iApm74sbkNfQYKVQjlNHFq83yRh6fQJZAtxoLNN1EoldhZRuLonA==
X-Received: by 2002:adf:d84b:0:b0:212:1c7c:5790 with SMTP id k11-20020adfd84b000000b002121c7c5790mr28207774wrl.366.1654633946057;
        Tue, 07 Jun 2022 13:32:26 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id n187-20020a1c27c4000000b0039c151298b7sm25023455wmn.10.2022.06.07.13.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 13:32:25 -0700 (PDT)
Message-ID: <4bb369e7-dfce-49b4-755d-d3b6e2d4d196@gmail.com>
Date:   Tue, 7 Jun 2022 21:32:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Attaching an I2C VCM subdev (media entity) to media pipeline
Content-Language: en-US
To:     Karthik Poduval <karthik.poduval@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <CAFP0Ok_DvJo7KM4YSsT2s3SAzDQdSy-8HrQoky6zH5YE4sGypw@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <CAFP0Ok_DvJo7KM4YSsT2s3SAzDQdSy-8HrQoky6zH5YE4sGypw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Karthik

On 07/06/2022 18:29, Karthik Poduval wrote:
> Hi All,
>
> I had a question about VCM subdev (media entity). The  example VCM
> drivers have no pads. How do we attach them to the image sensor subdev
> in the pipeline ?
>
This is somewhat in its infancy so you'll need to be running v5.19-rc1,
but assuming you're describing the device with DT you should be able to
link them by providing a lens-focus property with a phandle pointing to
the node for the lens controller. No pad-to-pad links will or should be
created though, the connection is represented by an "ancillary link"
which should be created by v4l2-core. The VCM drivers won't be in the
image pipeline as such but their connection to the sensor subdev is
discoverable to user space when parsing links, for example in
libcamera's implementation:
https://git.linuxtv.org/libcamera.git/tree/src/libcamera/media_device.cpp#n732
