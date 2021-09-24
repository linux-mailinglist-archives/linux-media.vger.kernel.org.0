Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C30B41710E
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 13:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343555AbhIXLob (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 07:44:31 -0400
Received: from linux.microsoft.com ([13.77.154.182]:40882 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244321AbhIXLob (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 07:44:31 -0400
Received: from [192.168.1.87] (unknown [223.184.74.135])
        by linux.microsoft.com (Postfix) with ESMTPSA id B7EE420A3A05;
        Fri, 24 Sep 2021 04:42:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B7EE420A3A05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1632483778;
        bh=6J74lWd/6CyVUNTeXTJr/cLogZniLMul6d8MzGOSJS0=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=jRWNVqsKRfiizxQADhHcgkJDxWAl8h/Iy1IJ0/sHZD9c3lSCsnHBXM747S10ga9ZT
         n4HG4MIut8vWrigJRFqcAqmZq5TRU94qLdsxwfxQAA5cLc3Fgl0gYXqQDUUdnbvWPO
         HMaRuqMjcUzG8Q37AxbMgUz/ROMzZL9KaiDsR1t8=
Subject: Re: [PATCH] media: atomisp: restore missing 'return' statement
From:   Praveen Kumar <kumarpraveen@linux.microsoft.com>
To:     Arnd Bergmann <arnd@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Skripkin <paskripkin@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20210802143820.1150099-1-arnd@kernel.org>
 <a472d0f0-2be4-5f95-7106-5d580b28cac6@linux.microsoft.com>
Message-ID: <ccc76c85-b6ee-aafb-b4dc-801dc10ef001@linux.microsoft.com>
Date:   Fri, 24 Sep 2021 17:12:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a472d0f0-2be4-5f95-7106-5d580b28cac6@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24-09-2021 17:01, Praveen Kumar wrote:
> On 02-08-2021 20:08, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The input_system_configure_channel_sensor() function lost its final
>> return code in a previous patch:
>>
>> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function 'input_system_configure_channel_sensor':
>> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
>>
>> Restore what was there originally.
>>
>> Fixes: 728a5c64ae5f ("media: atomisp: remove dublicate code")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>  .../media/atomisp/pci/hive_isp_css_common/host/input_system.c   | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
>> index 8e085dda0c18..712e01c37870 100644
>> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
>> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
>> @@ -1646,6 +1646,8 @@ static input_system_err_t input_system_configure_channel_sensor(
>>  	default:
>>  		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
>>  	}
>> +
>> +	return INPUT_SYSTEM_ERR_NO_ERROR;
> 
> I would recommend to return "status" instead of INPUT_SYSTEM_ERR_NO_ERROR,
> this will take care of sending correct return code, we encounter in different case statements.
> Something like below would be better. Thanks.
> 
> -               return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> +               status = INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
>         }
> +       return status;

Please ignore this comment. My bad, we don't reach anytime here during failure.

Regards,

~Praveen.

