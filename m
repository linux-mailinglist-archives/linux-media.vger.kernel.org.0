Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86A5C76F9EB
	for <lists+linux-media@lfdr.de>; Fri,  4 Aug 2023 08:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbjHDGSU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Aug 2023 02:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbjHDGSS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Aug 2023 02:18:18 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0F33E70
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 23:18:15 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RHFqQ6P5Jz1KC5g;
        Fri,  4 Aug 2023 14:17:06 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 14:18:10 +0800
Message-ID: <dc418511-5a9c-6fa6-2768-d626faedb8d8@huawei.com>
Date:   Fri, 4 Aug 2023 14:18:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next 1/3] media: dvb-frontends: drx39xyj: Remove an
 unnecessary ternary operator
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
CC:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <j.neuschaefer@gmx.net>, <linux-media@vger.kernel.org>
References: <20230804031323.2105187-1-ruanjinjie@huawei.com>
 <20230804031323.2105187-2-ruanjinjie@huawei.com>
 <20230804060500.mxnjbvwemucudpd5@pengutronix.de>
From:   Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <20230804060500.mxnjbvwemucudpd5@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2023/8/4 14:05, Uwe Kleine-König wrote:
> On Fri, Aug 04, 2023 at 11:13:21AM +0800, Ruan Jinjie wrote:
>> There is a ternary operator, the true or false judgement of which
>> is unnecessary in C language semantics.
>>
>> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
>> ---
>>  drivers/media/dvb-frontends/drx39xyj/drxj.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
>> index 68f4e8b5a0ab..e54e61c3518a 100644
>> --- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
>> +++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
>> @@ -4779,7 +4779,7 @@ set_frequency(struct drx_demod_instance *demod,
>>  	bool image_to_select;
>>  	s32 fm_frequency_shift = 0;
>>  
>> -	rf_mirror = (ext_attr->mirror == DRX_MIRROR_YES) ? true : false;
>> +	rf_mirror = ext_attr->mirror == DRX_MIRROR_YES;
>>  	tuner_mirror = demod->my_common_attr->mirror_freq_spect ? false : true;
> 
> Maybe also do:
> 
> -	tuner_mirror = demod->my_common_attr->mirror_freq_spect ? false : true;
> +	tuner_mirror = !demod->my_common_attr->mirror_freq_spect;
> 
> ?

Right!

> 
> Best regards
> Uwe
> 
>>  	/*
>>  	   Program frequency shifter
> 
