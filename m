Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63FFF234353
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 11:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732139AbgGaJd6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 05:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727096AbgGaJd6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 05:33:58 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE623C061574
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2020 02:33:57 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 0CA46298D97
Subject: Re: [PATCH 1/2] media: staging: rkisp1: replace 9 coeff* fields with
 a 3x3 array
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200707170845.28845-1-dafna.hirschfeld@collabora.com>
 <20200707170845.28845-2-dafna.hirschfeld@collabora.com>
 <c945f4dd-3c5b-20de-3943-e9f79c9bfaec@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <fe401b07-bc96-928e-fc8d-59b166e66561@collabora.com>
Date:   Fri, 31 Jul 2020 11:33:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c945f4dd-3c5b-20de-3943-e9f79c9bfaec@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 27.07.20 19:50, Helen Koike wrote:
> Hi Dafna,
> 
> On 7/7/20 2:08 PM, Dafna Hirschfeld wrote:
>> The struct rkisp1_cif_isp_ctk_config has 9 fields 'coeff*' for the
>> 3x3 color correction matrix. Replace these fields with one 3x3
>> array coeff[3][3] and document the field.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/staging/media/rkisp1/rkisp1-params.c      | 15 ++++++---------
>>   drivers/staging/media/rkisp1/uapi/rkisp1-config.h | 14 ++++----------
>>   2 files changed, 10 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
>> index 797e79de659c..00b102eb67b6 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
>> @@ -402,15 +402,12 @@ static void rkisp1_goc_config(struct rkisp1_params *params,
>>   static void rkisp1_ctk_config(struct rkisp1_params *params,
>>   			      const struct rkisp1_cif_isp_ctk_config *arg)
>>   {
>> -	rkisp1_write(params->rkisp1, arg->coeff0, RKISP1_CIF_ISP_CT_COEFF_0);
>> -	rkisp1_write(params->rkisp1, arg->coeff1, RKISP1_CIF_ISP_CT_COEFF_1);
>> -	rkisp1_write(params->rkisp1, arg->coeff2, RKISP1_CIF_ISP_CT_COEFF_2);
>> -	rkisp1_write(params->rkisp1, arg->coeff3, RKISP1_CIF_ISP_CT_COEFF_3);
>> -	rkisp1_write(params->rkisp1, arg->coeff4, RKISP1_CIF_ISP_CT_COEFF_4);
>> -	rkisp1_write(params->rkisp1, arg->coeff5, RKISP1_CIF_ISP_CT_COEFF_5);
>> -	rkisp1_write(params->rkisp1, arg->coeff6, RKISP1_CIF_ISP_CT_COEFF_6);
>> -	rkisp1_write(params->rkisp1, arg->coeff7, RKISP1_CIF_ISP_CT_COEFF_7);
>> -	rkisp1_write(params->rkisp1, arg->coeff8, RKISP1_CIF_ISP_CT_COEFF_8);
>> +	unsigned int i, j, k = 0;
>> +
>> +	for (i = 0; i < 3; i++)
>> +		for (j = 0; j < 3; j++)
>> +			rkisp1_write(params->rkisp1, arg->coeff[i][j],
>> +				     RKISP1_CIF_ISP_CT_COEFF_0 + 4 * k++);
>>   	rkisp1_write(params->rkisp1, arg->ct_offset_r,
>>   		     RKISP1_CIF_ISP_CT_OFFSET_R);
>>   	rkisp1_write(params->rkisp1, arg->ct_offset_g,
>> diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
>> index ca0d031b14ac..a01711a668da 100644
>> --- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
>> +++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
>> @@ -417,19 +417,13 @@ struct rkisp1_cif_isp_bdm_config {
>>   /**
>>    * struct rkisp1_cif_isp_ctk_config - Configuration used by Cross Talk correction
>>    *
>> - * @coeff: color correction matrix
>> + * @coeff: color correction matrix. Values are 11-bit signed fixed-point numbers with 4 bit integer
>> + *		and 7 bit fractional part, ranging from -8 (0x400) to +7.992 (0x3FF). 0 is
>> + *		represented by 0x000 and a coefficient value of 1 as 0x080.
>>    * @ct_offset_b: offset for the crosstalk correction matrix
>>    */
>>   struct rkisp1_cif_isp_ctk_config {
>> -	__u16 coeff0;
>> -	__u16 coeff1;
>> -	__u16 coeff2;
>> -	__u16 coeff3;
>> -	__u16 coeff4;
>> -	__u16 coeff5;
>> -	__u16 coeff6;
>> -	__u16 coeff7;
>> -	__u16 coeff8;
>> +	__u16 coeff[3][3];
> 
> Why not:
> 
> 	__u16 coeff[9];

Hi, since it represents a 3x3 matrix I think it is nicer as a 3x3 array.

Thanks,
Dafna

> 
> ?
> 
> Thanks,
> Helen
> 
>>   	__u16 ct_offset_r;
>>   	__u16 ct_offset_g;
>>   	__u16 ct_offset_b;
>>
