Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6578B71357C
	for <lists+linux-media@lfdr.de>; Sat, 27 May 2023 17:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232655AbjE0Pt5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 May 2023 11:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjE0Pt4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 May 2023 11:49:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC434BE
        for <linux-media@vger.kernel.org>; Sat, 27 May 2023 08:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685202554;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=au1/WmSoGutoE6COEo7uSaGaGfsuDRl+cE0Yb6XBzN8=;
        b=dZ1tXtsRFyxDRA/E5Ew6VMpOhiM+kbFYr3yl2SZrhcME9+m2Z3rAnoxnO80qZaujxwkxMi
        QyrqK0EiQxFjUJ8wNeHKaCs24U/3IfCGmlPgx9yOLGi/OrLgv2pp3Ahbd5KiZVodt6AFKR
        +cZH5RTujB5O6GmQ+s+Q1nPjOQFiYVY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-MQC-2TuzPSSqjJtuuEvXkQ-1; Sat, 27 May 2023 11:49:13 -0400
X-MC-Unique: MQC-2TuzPSSqjJtuuEvXkQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a34e35f57so165519266b.3
        for <linux-media@vger.kernel.org>; Sat, 27 May 2023 08:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685202552; x=1687794552;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=au1/WmSoGutoE6COEo7uSaGaGfsuDRl+cE0Yb6XBzN8=;
        b=S02+OL8/2XRGgqidrLE2dfW5F2s+HvbqsqdK/Qx9d9ofQMELF/2xCUjLfQdpuEHcX9
         +VqJZuc1QOye6zXwfbolnlHQ5g3a6HpKb5KYPvcxCqSyrxwV28dtp+CSKCbEEBw4V33x
         T4G2xqinZoxUFphv0TWlyCIvapOYfhlVAE/f+agKpOenUC4QbQdyyFAjzlXvyHNUBnIg
         o3fR18bH4ZUXtn0kw1zeEzzZdmNpAqlDCoyOeSUigDWC2iMAXQrjbD1QzPAJjEkyZi0+
         KO7Mkuyc5I3GWdssF2nbvXON81pGtRfxc1sw0pSjWATNYdi0izjqZgOTCX9ZTciqLOnZ
         Cnzw==
X-Gm-Message-State: AC+VfDx318SYzaRhTqYLV+C8oBLM/IpdvD0gMTCZ3s/5ZzuhxZ8YCZg4
        Z3By13g2Oa9RWdd76Txq4NDkBrFjAtBw0rxAZqzgJNFh6PCg7vqG/13dtWuOw3448zfXnMzXVWQ
        PmW5DRMhfjB7RNfwBikmLiz8=
X-Received: by 2002:a17:907:6da3:b0:96f:7b4a:2904 with SMTP id sb35-20020a1709076da300b0096f7b4a2904mr6861206ejc.3.1685202552498;
        Sat, 27 May 2023 08:49:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5s1lsSpPwWFjqvWEgYk78sFmUHhBx4VdODCExmvB0xZrP9TWO4s6Q10i1M+w7DiWsHzykgcw==
X-Received: by 2002:a17:907:6da3:b0:96f:7b4a:2904 with SMTP id sb35-20020a1709076da300b0096f7b4a2904mr6861194ejc.3.1685202552216;
        Sat, 27 May 2023 08:49:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id qw23-20020a170906fcb700b0096f71ace804sm3555661ejb.99.2023.05.27.08.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 May 2023 08:49:11 -0700 (PDT)
Message-ID: <90397afc-9dc7-14a1-4ba4-7461c922cf51@redhat.com>
Date:   Sat, 27 May 2023 17:49:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [bug report] media: atomisp: remove some trivial wrappers from
 compat css20
Content-Language: en-US, nl
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
References: <d89e5638-be36-477c-b589-fba23e225fa7@kili.mountain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d89e5638-be36-477c-b589-fba23e225fa7@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 5/26/23 13:55, Dan Carpenter wrote:
> Hello Atomisp devs,
> 
> This is a semi-automatic email about new static checker warnings.

Thank you for the bug report. I believe that this has already been
fixed by this pending patch:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/commit/?h=media-atomisp&id=c09907049eea9f12e959fb88c02a483a4c5eee89

Regards,

Hans


> 
> The patch 1a16d5453978: "media: atomisp: remove some trivial wrappers 
> from compat css20" from May 28, 2020, leads to the following Smatch 
> complaint:
> 
>     drivers/staging/media/atomisp/pci/sh_css_firmware.c:247 sh_css_load_firmware()
>     warn: variable dereferenced before check 'fw_data' (see line 237)
> 
> drivers/staging/media/atomisp/pci/sh_css_firmware.c
>    236			min(sizeof(FW_rel_ver_name), sizeof(file_header->version)));
>    237		ret = sh_css_check_firmware_version(dev, fw_data);
>                                                          ^^^^^^^
> Dereferenced.
> 
>    238		if (ret) {
>    239			IA_CSS_ERROR("CSS code version (%s) and firmware version (%s) mismatch!",
>    240				     file_header->version, release_version);
>    241			return -EINVAL;
>    242		} else {
>    243			IA_CSS_LOG("successfully load firmware version %s", release_version);
>    244		}
>    245	
>    246		/* some sanity checks */
>    247		if (!fw_data || fw_size < sizeof(struct sh_css_fw_bi_file_h))
>                      ^^^^^^^
> Too late.
> 
>    248			return -EINVAL;
>    249	
> 
> regards,
> dan carpenter
> 

