Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97FFC6EDD9C
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 10:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233478AbjDYIGX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 04:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233440AbjDYIGU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 04:06:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE35526A8
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 01:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682409935;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9PU53JLs34RDpaJOFo3CkyuewwR2BCedo/GKUCM3Jc4=;
        b=I3Bw43wxo8/JadOAseA2nlLfROKVXHQp8maj5UtlfDLaF6x5k1gc4KjOAEQOvvNFy6u91/
        WSjbNI08YSfxqEDHVz8mWelI/0DsmgWZcLbXSDnR6M//e3NQuUg/wj+a4+9+7k+cZsa9Ol
        xCce5p+VSz0iKYzU4SRaHlwGoJyd36Y=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-mcgW5oMFM8yBkoQpE6mfgA-1; Tue, 25 Apr 2023 04:05:34 -0400
X-MC-Unique: mcgW5oMFM8yBkoQpE6mfgA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94a348facbbso610737166b.1
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 01:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682409932; x=1685001932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9PU53JLs34RDpaJOFo3CkyuewwR2BCedo/GKUCM3Jc4=;
        b=TTmMYY8Rx1HQ5/W23IBhT7BJ1Imce54PmEpZDq/zMUdIadXm4WgPFFuRexWirCqV8z
         Dv4QnI+6GA6JfYXRLLJf5VAX2BaSiFBT0AcHCRtYPkxRLuydW8eeL1I1o92N2Nz4yfFS
         4kFQ+0mf4SENYzJ1eVmJTWLb1lHyu6cwGdLKIbqEmsZ251fnuI0ogHQJLVA+FnbiYc/U
         /PihBeipA4tLMCHTUmuY/HvpB4gqCDvAfKZYZ+c8YLSvr4RIolR4eaVj3TeKUcxSOArF
         8mLnw831ALbXqrz5Ha6eKCvk937+rWeYzGdEAgIr19nw+WcPIW5poTOS/5vp+0IjVDPk
         Z8ew==
X-Gm-Message-State: AAQBX9f2yF6RXaFQ3EiPRaNDg6X5OmVcNUxor+vDEIr1hLh4p4JVPfpH
        ThDymicH5Z6RnK/ORI8ppPmkvOCqNzkDW1BFfzi4aoaFp+dyW6gKCCOqBMBagsqkBUiPSg6Nudz
        K/J7o1K786Coxw5S0Sk1rkzoBlu601u0=
X-Received: by 2002:a17:907:270b:b0:90b:53f6:fd8b with SMTP id w11-20020a170907270b00b0090b53f6fd8bmr11991665ejk.31.1682409932728;
        Tue, 25 Apr 2023 01:05:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350bRCq5hZ96Tbgkh9qaeJVY0zrWMxAPmfq6MWsJEGLDbjbQBFPDAa14/rwmdvjoBdGXTGEU2DQ==
X-Received: by 2002:a17:907:270b:b0:90b:53f6:fd8b with SMTP id w11-20020a170907270b00b0090b53f6fd8bmr11991638ejk.31.1682409932381;
        Tue, 25 Apr 2023 01:05:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g23-20020a170906395700b0094f16a3ea9csm6413093eje.117.2023.04.25.01.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 01:05:31 -0700 (PDT)
Message-ID: <d8da36f6-0796-ceef-8ea5-0ade836acda4@redhat.com>
Date:   Tue, 25 Apr 2023 10:05:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 3/3] ACPI: delay enumeration of devices with a _DEP
 pointing to IVSC device
To:     Wentong Wu <wentong.wu@intel.com>, sakari.ailus@linux.intel.com,
        djrscally@gmail.com, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org
Cc:     bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com
References: <1682387039-16674-1-git-send-email-wentong.wu@intel.com>
 <1682387039-16674-4-git-send-email-wentong.wu@intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1682387039-16674-4-git-send-email-wentong.wu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Wentong,

On 4/25/23 03:43, Wentong Wu wrote:
> Inside IVSC, switching ownership requires an interface with two
> different hardware modules, ACE and CSI. The software interface
> to these modules is based on Intel MEI framework. Usually mei
> client devices are dynamically created, so the info of consumers
> depending on mei client devices is not present in the firmware
> tables.
> 
> This causes problems with the probe ordering with respect to
> drivers for consumers of these mei client devices. But on these
> camera sensor devices, the ACPI nodes describing the sensors all
> have a _DEP dependency on the matching mei bus ACPI device, so
> adding IVSC mei bus ACPI device to acpi_honor_dep_ids allows
> solving the probe-ordering problem by delaying the enumeration of
> ACPI-devices which have a _DEP dependency on an IVSC mei bus ACPI
> device.
> 
> On TGL platform, the HID of IVSC mei bus ACPI device is INTC1059,
> and on ADL platform, the HID is INTC1095. So add both of them to
> acpi_honor_dep_ids.
> 
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> ---
>  drivers/acpi/scan.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 2743444..89368d7 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -796,6 +796,8 @@ static const char * const acpi_ignore_dep_ids[] = {
>  /* List of HIDs for which we honor deps of matching ACPI devs, when checking _DEP lists. */
>  static const char * const acpi_honor_dep_ids[] = {
>  	"INT3472", /* Camera sensor PMIC / clk and regulator info */
> +	"INTC1059",
> +	"INTC1095",

Can you please add a short comment after these to explain what they are for,
e.g.:

	"INTC1059", /* IVSC (TGL) driver must be loaded to allow i2c access to camera sensors */
	"INTC1095", /* IVSC (ADL) driver must be loaded to allow i2c access to camera sensors */

>  	NULL
>  };
>  

Regards,

Hans


