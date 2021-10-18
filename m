Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 583134311A2
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 09:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbhJRH7A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 03:59:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59368 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230444AbhJRH7A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 03:59:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634543809;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pW1J9ofif2zOmnDiVcKxrIN5ntR57Bu+Zk3Ktoioz/k=;
        b=U53Yid+vuFKShwW31CtOaCAr+XtQ1PmGtGLuom3X91qSohIIkQE3exwKMhuVUeBEfaHHEw
        FAdqzF7Dl7jkFC7MPMqgl+xEgvyvHhedo/XFtrUAmShZ9MjrkiBYagXHx3DiZWzpYnxplW
        Yj5i3xs3ZDN3hBlUWo6kq7fmhMNElXw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-8fDJR4W8MB-3NhNeGUyzbQ-1; Mon, 18 Oct 2021 03:56:47 -0400
X-MC-Unique: 8fDJR4W8MB-3NhNeGUyzbQ-1
Received: by mail-ed1-f71.google.com with SMTP id e14-20020a056402088e00b003db6ebb9526so13498001edy.22
        for <linux-media@vger.kernel.org>; Mon, 18 Oct 2021 00:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pW1J9ofif2zOmnDiVcKxrIN5ntR57Bu+Zk3Ktoioz/k=;
        b=XZ3T43F/uFgc6GWGCgH5qsaAaAZhPZWAD373+DJM5QtnuXy5YqpsHGkG7gnrbTsdBY
         10sRypSrMtbz0k7pg1w9IHnTV6M5RcNdWSD/XahE2Jk9e5/YUztvwnqPREt/n3Jao2p0
         9aQpMpIzvhUQzCsNj0DgAHbFLX/bwhE5cqr/l+ugvcAoFAkmtQfac8VBHILNvi7498D9
         g7WILrNpRytz2SEgVX9m/YVu04yR4DsUWoXMXAQDe8DmgxgtoSyGHMr/XEh/ZhCegou9
         wkRngdRhpEuN0j0bQlXyvflFmoVDIO617KlRrEVEcd6tVoojeiy2oj6nRBsdZ8IBwKSt
         JXyQ==
X-Gm-Message-State: AOAM5328TxNmPdK8XwnszNb2+PdkXnZ+ZfDVt22i2qsxJK1ox8jPsI3J
        1Y8wcMHC0Rrofvj7ih1quWNd2UQ5FO41f/3V8lZKgFn/9LZNLfHFD91zEerT+HIQm9GyE09jyAf
        m3VBxvIrtAEbnOeCEQgKGiIY=
X-Received: by 2002:a17:906:9554:: with SMTP id g20mr26957682ejy.173.1634543806697;
        Mon, 18 Oct 2021 00:56:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1MSTDU9JlGaAPtzdM/OOCr8p1MGxpbJ7gyI+cshWZr35B0R6575hFKTzB38TK0uaPSxupYA==
X-Received: by 2002:a17:906:9554:: with SMTP id g20mr26957653ejy.173.1634543806466;
        Mon, 18 Oct 2021 00:56:46 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id b22sm9278945edj.83.2021.10.18.00.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 00:56:46 -0700 (PDT)
Message-ID: <71b5b886-2ca1-27a9-6776-b3bcc430e5ed@redhat.com>
Date:   Mon, 18 Oct 2021 09:56:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 16/17] [NOT-FOR-MERGE] media: atomsip: pci: add DMI match
 for Microsoft Surface 3 with broken DMI (OEMB)
Content-Language: en-US
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Aniket Bhattacharyea <aniketmail669@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alan <alan@linux.intel.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20211017161958.44351-1-kitakar@gmail.com>
 <20211017161958.44351-17-kitakar@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211017161958.44351-17-kitakar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/17/21 18:19, Tsuchiya Yuto wrote:
> This commit is added for Surface 3 with broken DMI table. HACK-ish.
> Not intended for upstreaming. Thus, NOT-FOR-MERGE. But, if someone
> knows a nicer way to address this, comments are welcome...
> 
>> 8-----------------------------------------------------------------8<
> 
> On some Microsoft Surface 3, the DMI table gets corrupted for unknown
> reasons and breaks existing DMI matching used for device-specific quirks.
> 
> This commit adds the (broken) DMI data into dmi_system_id tables used
> for quirks so that the driver can enable quirks even on the affected
> systems.
> 
> On affected systems, the DMI data will look like this:
> 
>         $ grep . /sys/devices/virtual/dmi/id/{bios_vendor,board_name,board_vendor,\
>         chassis_vendor,product_name,sys_vendor}
>         /sys/devices/virtual/dmi/id/bios_vendor:American Megatrends Inc.
>         /sys/devices/virtual/dmi/id/board_name:OEMB
>         /sys/devices/virtual/dmi/id/board_vendor:OEMB
>         /sys/devices/virtual/dmi/id/chassis_vendor:OEMB
>         /sys/devices/virtual/dmi/id/product_name:OEMB
>         /sys/devices/virtual/dmi/id/sys_vendor:OEMB

I wonder what the bios_date field contains ? Typically when the DMI strings
are no good (e.g. often they contain "Default String" or "To be filled by OEM")
we add a check on the bios-date, which together with the broken strings is
considered unique enough to still allow a match with broken strings in the
kernel.

Also have you tried doing something like "load bios/setup defaults" in
the BIOS setup ? Maybe that helps ?

Regards,

Hans





> 
> Expected:
> 
>         $ grep . /sys/devices/virtual/dmi/id/{bios_vendor,board_name,board_vendor,\
>         chassis_vendor,product_name,sys_vendor}
>         /sys/devices/virtual/dmi/id/bios_vendor:American Megatrends Inc.
>         /sys/devices/virtual/dmi/id/board_name:Surface 3
>         /sys/devices/virtual/dmi/id/board_vendor:Microsoft Corporation
>         /sys/devices/virtual/dmi/id/chassis_vendor:Microsoft Corporation
>         /sys/devices/virtual/dmi/id/product_name:Surface 3
>         /sys/devices/virtual/dmi/id/sys_vendor:Microsoft Corporation
> 
> Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
> ---
>  .../staging/media/atomisp/pci/atomisp_gmin_platform.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index 948eb6f809f5..3868d64cbc2b 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -377,6 +377,17 @@ static const struct dmi_system_id gmin_vars[] = {
>  		},
>  		.driver_data = surface3_vars,
>  	},
> +	{
> +		.ident = "Surface 3",
> +		.matches = {
> +			/* DMI data for Surface 3 with broken DMI table */
> +			DMI_MATCH(DMI_BIOS_VENDOR, "American Megatrends Inc."),
> +			DMI_MATCH(DMI_BOARD_NAME, "OEMB"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "OEMB"),
> +			DMI_MATCH(DMI_SYS_VENDOR, "OEMB"),
> +		},
> +		.driver_data = surface3_vars,
> +	},
>  	{}
>  };
>  
> 

