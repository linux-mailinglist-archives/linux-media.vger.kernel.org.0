Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76D581DD997
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 23:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728992AbgEUVju (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 17:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgEUVjt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 17:39:49 -0400
X-Greylist: delayed 1749 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 21 May 2020 14:39:49 PDT
Received: from mx0b-00190b01.pphosted.com (mx0b-00190b01.pphosted.com [IPv6:2620:100:9005:57f::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8107C061A0E;
        Thu, 21 May 2020 14:39:49 -0700 (PDT)
Received: from pps.filterd (m0050102.ppops.net [127.0.0.1])
        by m0050102.ppops.net-00190b01. (8.16.0.42/8.16.0.42) with SMTP id 04LL5jYT029586;
        Thu, 21 May 2020 22:10:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=COVlFSjP2KH4fMa2HIhlBnrevuunjTf+uYk36UgBccY=;
 b=U4zZ6+y/T/d2ETM7SXnpA4mVmKJvwCuilZ8VcKTSiowv9PK2IholH2FL/5h4hXCHbYxe
 vvxrX/Zj/BSkv42KHm9i3E/Q41pHv5DHcZs5EafQkgskJplSwfx+RgEgPjoQ4YLjA4rN
 4br8iSr5Um7xMh8KL5BNmk7i3lsDPjznmflWbXi47hgS8OuuHvg0MHwR8VyoU0spFUtL
 HSSbQJUS+roy8XqTU5EmPqxLPTojAVW/y8uE8fVvP4620/XZg7xj5rs7aEAFAUD8lmd1
 WhpbUoKcZsoLJY+TZ2MbeVK/ef9oJdLYgejIt4HrqXbXEjcabuUmaldUAxro8kf93Sjj EA== 
Received: from prod-mail-ppoint1 (prod-mail-ppoint1.akamai.com [184.51.33.18] (may be forged))
        by m0050102.ppops.net-00190b01. with ESMTP id 31258nyc5j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 21 May 2020 22:10:34 +0100
Received: from pps.filterd (prod-mail-ppoint1.akamai.com [127.0.0.1])
        by prod-mail-ppoint1.akamai.com (8.16.0.27/8.16.0.27) with SMTP id 04LL2L9w015167;
        Thu, 21 May 2020 17:10:33 -0400
Received: from prod-mail-relay11.akamai.com ([172.27.118.250])
        by prod-mail-ppoint1.akamai.com with ESMTP id 312bgvmear-1;
        Thu, 21 May 2020 17:10:33 -0400
Received: from [0.0.0.0] (prod-ssh-gw01.bos01.corp.akamai.com [172.27.119.138])
        by prod-mail-relay11.akamai.com (Postfix) with ESMTP id 5803321B38;
        Thu, 21 May 2020 21:10:33 +0000 (GMT)
Subject: Re: [RFC] Make dynamic debug infrastructure more flexible
To:     Joe Perches <joe@perches.com>
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200521132816.31111-1-stanimir.varbanov@linaro.org>
 <20200521132816.31111-3-stanimir.varbanov@linaro.org>
 <c4cad4f243988d214208a4903aa311a64f9b4531.camel@perches.com>
 <5bb4b918aec3c77038122588ee642ae4aa2a09b0.camel@perches.com>
From:   Jason Baron <jbaron@akamai.com>
Message-ID: <11115196-54b0-5948-a6b1-87994239f2a7@akamai.com>
Date:   Thu, 21 May 2020 17:10:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5bb4b918aec3c77038122588ee642ae4aa2a09b0.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.676
 definitions=2020-05-21_14:2020-05-21,2020-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=898
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-2004280000 definitions=main-2005210157
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.676
 definitions=2020-05-21_14:2020-05-21,2020-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 cotscore=-2147483648
 phishscore=0 bulkscore=0 mlxlogscore=885 suspectscore=0 lowpriorityscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005210157
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/21/20 4:06 PM, Joe Perches wrote:
> On Thu, 2020-05-21 at 09:08 -0700, Joe Perches wrote:
>> On Thu, 2020-05-21 at 16:28 +0300, Stanimir Varbanov wrote:
>>> Here we introduce few debug macros with levels (low, medium and
>>> high) and debug macro for firmware. Enabling the particular level
>>> will be done by dynamic debug.
>>
>> I'd rather make the logging level facility generic in
>> dynamic debug than prefix all formats with what could
>> be non-specific content.
>>
>> From a long time ago:
>>
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__groups.google.com_forum_-23-21msg_linux.kernel_VlWbno-2DZAFw_k-5FfFadhNHXcJ&d=DwICAw&c=96ZbZZcaMF4w0F4jpN6LZg&r=1fLh1mlLqbfetnnGsbwXfpwmGlG4m83mXgtV4vZ1B1A&m=frs_z9MmQ_bzjMWZc5gnzdbuAHVi2EWsCO7ikUkszv4&s=Cbij9ptIrxbwB3XJNp8lxXrdTDi8T2s5XlB1llRbmjU&e= 
> 
> Hey Jason.
> 
> I believe there are 6 bits left in the unsigned int
> use for the line number and flags in struct _ddebug
> 
> Assuming the use of a mechanism like
> 
> 	pr_debug_level(level, fmt, ...)
> 
> would you be OK with something like this to enable a
> level or bitmask test of dynamic debug logging output?
> 
> where the output is controlled by something like
> 
> echo 'file <filename> level <n> +p' > <debugfs>/dynamic_debug/control
> 
> to enable dynamic debug output only at level <n> or higher
> or maybe match a bitmap of <n>
> 
> (modulo all the rest of the code necessary to use it?)

Hi Joe,

Yes, I think its good idea. I think in the past I felt that since
we could enable/disable statements individually it wasn't needed.
However, the ability to group in the kernel seems like a better
layer. I think we were also missing a specific use-case. Seems
like we have that here. So makes sense to me.

Thanks,

-Jason



> ---
>  include/linux/dynamic_debug.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> index abcd5fde30eb..616dbb2b5921 100644
> --- a/include/linux/dynamic_debug.h
> +++ b/include/linux/dynamic_debug.h
> @@ -38,6 +38,8 @@ struct _ddebug {
>  #define _DPRINTK_FLAGS_DEFAULT 0
>  #endif
>  	unsigned int flags:8;
> +	unsigned int level:5;
> +	unsigned int level_is_bitmask:1;
>  #ifdef CONFIG_JUMP_LABEL
>  	union {
>  		struct static_key_true dd_key_true;
> 
> 
