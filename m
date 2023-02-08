Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C746968EA7F
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 10:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbjBHJHU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 04:07:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbjBHJHO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 04:07:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21784458BD
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 01:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675847183;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SRi2tCsuOLJoQz16HbU6hg4NjL1uIMJ9unPVHJd4sSM=;
        b=bVnr9rtXZcfErStTzX61lPu6lsdVitO6ETRaFV9riYCTDkWgK69E2eioxKg0X0wJr53S4Y
        kThL6wLV9wdWccLglGLqOrlwIjc57pmdWDeFnPWtgKG1hR+o0wKY/AQFD5XMGKQN7T9+Q8
        T45cCX/tNi9etKdS16s+nbzmbLMyR4A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-551-rBHqdbsiN3KNbDnbxw7PWg-1; Wed, 08 Feb 2023 04:06:22 -0500
X-MC-Unique: rBHqdbsiN3KNbDnbxw7PWg-1
Received: by mail-wm1-f71.google.com with SMTP id j20-20020a05600c1c1400b003dc5dd44c0cso8593905wms.8
        for <linux-media@vger.kernel.org>; Wed, 08 Feb 2023 01:06:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SRi2tCsuOLJoQz16HbU6hg4NjL1uIMJ9unPVHJd4sSM=;
        b=nhmIoaJI8aA/eQrdWVxpaUjdDWFQvEMqCEShtTThKs/2cg6jWDHMrUe1uVfTVjKOHB
         6KBGaZxiirxEDeLkzUjG4c1wKp+U2RETH8bm0OU+XaXrKhAYxB/HF8cIjz6CZszWic/Y
         qymm6RN8uaAFwG+hVQX7MGpLSrvuOAM9APhNwPRi0hyCi235zQ8Xaq/aYX3RVVqAhP2N
         zWncIbOSTMOdGiGGo++xGRj0UP/GYJqPF2ONLLW66CQzQbvSLUelusstPIRt7lvQPKmx
         zHzukdXWRrvRGb52EEPTLV2Ku5JkYOTP/Qd9Sp2PA7AkgzeYPpPA0Ee3MC6NMCt8jkUw
         tcng==
X-Gm-Message-State: AO0yUKW9SRX3ruwksDIRaSEQFLB/eCK2FgIrSmEOpNvJrEGzxfHXVbYC
        o3YZv9Y5uNNAZK0PljDYo+MT27ojdxy3+e4VGuxm2Vg5GdtC6aMKRNSA3g5qCimltlaA8T4h4aE
        EVomy/EnEo/1ZhoRuQhol6bc=
X-Received: by 2002:adf:e3cc:0:b0:2c3:df05:b1a with SMTP id k12-20020adfe3cc000000b002c3df050b1amr5904239wrm.71.1675847181116;
        Wed, 08 Feb 2023 01:06:21 -0800 (PST)
X-Google-Smtp-Source: AK7set/k/7l50TXIQVYYeZY67BmTWHXujQFNMNbuLHWBhMgxQfjdhadxx3tu6ctEY4QeFNCcCLrSlg==
X-Received: by 2002:adf:e3cc:0:b0:2c3:df05:b1a with SMTP id k12-20020adfe3cc000000b002c3df050b1amr5904210wrm.71.1675847180947;
        Wed, 08 Feb 2023 01:06:20 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k6-20020adfb346000000b0027cb20605e3sm13397155wrd.105.2023.02.08.01.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 01:06:20 -0800 (PST)
Message-ID: <ef09bc9f-d570-be11-238b-bd34063917fc@redhat.com>
Date:   Wed, 8 Feb 2023 10:06:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] Revert "venus: firmware: Correct non-pix start and end
 addresses"
Content-Language: en-US
To:     Vikash Garodia <vgarodia@qti.qualcomm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mka@chromium.org" <mka@chromium.org>
Cc:     Albert Esteve <aesteve@redhat.com>,
        "stanimir.varbanov@linaro.org" <stanimir.varbanov@linaro.org>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Fritz Koenig <frkoenig@google.com>,
        "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>,
        "Rajeshwar Kurapaty (QUIC)" <quic_rkurapat@quicinc.com>
References: <20230207102254.1446461-1-javierm@redhat.com>
 <DM8PR02MB8169809493BF2822E6C29EECF3DB9@DM8PR02MB8169.namprd02.prod.outlook.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <DM8PR02MB8169809493BF2822E6C29EECF3DB9@DM8PR02MB8169.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Vikash,

On 2/7/23 17:40, Vikash Garodia wrote:
> Hi Javier and Matthias,
> Can we try the attached patch if that fixes the suspend issue for sc7180 and sc7280 ?
> 

I tested your attached patch on an SC7180 machine (HP X2 Chromebook) and as Matthias
mentioned, it still causes the driver's probe to fail:

[ 2119.063779] qcom-venus aa00000.video-codec: non legacy binding
[ 2119.085695] platform video-firmware.0: Adding to iommu group 11
[ 2119.156302] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x000000b0, fsynr=0x61, cbfrsynra=0xc40, cb=7
[ 2119.259382] qcom-venus aa00000.video-codec: failed to reset venus core
[ 2119.267782] platform video-firmware.0: Removing from iommu group 11
[ 2119.275052] qcom-venus: probe of aa00000.video-codec failed with error -110

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

