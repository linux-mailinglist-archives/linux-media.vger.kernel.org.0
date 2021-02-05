Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA202311124
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 20:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbhBERoC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 12:44:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233509AbhBERlt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 12:41:49 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B82C0C0613D6
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 11:23:32 -0800 (PST)
Received: from [IPv6:2003:c7:cf1c:ce00:c5f9:7f5:ebcd:ea47] (p200300c7cf1cce00c5f907f5ebcdea47.dip0.t-ipconnect.de [IPv6:2003:c7:cf1c:ce00:c5f9:7f5:ebcd:ea47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EE0811F468CD;
        Fri,  5 Feb 2021 19:23:30 +0000 (GMT)
Subject: Re: [PATCH RFC 10/11] media: rockchip: rkisp1: add support for v12
 isp variants
To:     Helen Koike <helen.koike@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>, ezequiel@collabora.com,
        Laurent.pinchart@ideasonboard.com
Cc:     linux-rockchip@lists.infradead.org,
        christoph.muellner@theobroma-systems.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
References: <20210108193311.3423236-1-heiko@sntech.de>
 <20210108193311.3423236-11-heiko@sntech.de>
 <3cf75bc9-be93-1fec-09ba-407749012e67@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <cd3da9bb-9a15-a6da-fb3a-a4eab3799f47@collabora.com>
Date:   Fri, 5 Feb 2021 20:23:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3cf75bc9-be93-1fec-09ba-407749012e67@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 18.01.21 um 19:06 schrieb Helen Koike:
> Hi Heiko,
> 
> On 1/8/21 4:33 PM, Heiko Stuebner wrote:
>> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
>>
>> The rkisp1 evolved over soc generations and the rk3326/px30 introduced
>> the so called v12 - probably meaning v1.2.
>>
>> Add the changed register definitions.
>>
>> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
>> ---
>>   .../platform/rockchip/rkisp1/rkisp1-common.h  |   1 +
>>   .../platform/rockchip/rkisp1/rkisp1-isp.c     |  13 +
>>   .../platform/rockchip/rkisp1/rkisp1-params.c  | 535 +++++++++++++++---
>>   .../platform/rockchip/rkisp1/rkisp1-regs.h    | 404 ++++++++-----
>>   .../platform/rockchip/rkisp1/rkisp1-stats.c   | 112 +++-
>>   5 files changed, 824 insertions(+), 241 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>> index be0ae02165c9..9deb1ef1aa8b 100644
>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>> @@ -61,6 +61,7 @@
>>   
>>   enum rkisp1_isp_ver {
>>   	RKISP1_V10 = 0,
>> +	RKISP1_V12,
>>   };
>>   
>>   /* enum for the resizer pads */
>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>> index 84440aa71210..306cc96f8230 100644
>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>> @@ -408,6 +408,10 @@ static int rkisp1_config_mipi(struct rkisp1_device *rkisp1)
>>   
>>   	rkisp1_write(rkisp1, mipi_ctrl, RKISP1_CIF_MIPI_CTRL);
>>   
>> +	/* V12 could also use a newer csi2-host, but we don't want that yet */
>> +	if (rkisp1->isp_ver == RKISP1_V12)
>> +		rkisp1_write(rkisp1, 0, RKISP1_CIF_ISP_CSI0_CTRL0);
>> +
>>   	/* Configure Data Type and Virtual Channel */
>>   	rkisp1_write(rkisp1,
>>   		     RKISP1_CIF_MIPI_DATA_SEL_DT(sink_fmt->mipi_dt) |
>> @@ -527,6 +531,15 @@ static void rkisp1_config_clk(struct rkisp1_device *rkisp1)
>>   		  RKISP1_CIF_ICCL_DCROP_CLK;
>>   
>>   	rkisp1_write(rkisp1, val, RKISP1_CIF_ICCL);
>> +
>> +	/* ensure sp and mp can run at the same time in V12 */
>> +	if (rkisp1->isp_ver == RKISP1_V12) {
>> +		val = RKISP1_CIF_CLK_CTRL_MI_Y12 | RKISP1_CIF_CLK_CTRL_MI_SP |
>> +		      RKISP1_CIF_CLK_CTRL_MI_RAW0 | RKISP1_CIF_CLK_CTRL_MI_RAW1 |
>> +		      RKISP1_CIF_CLK_CTRL_MI_READ | RKISP1_CIF_CLK_CTRL_MI_RAWRD |
>> +		      RKISP1_CIF_CLK_CTRL_CP | RKISP1_CIF_CLK_CTRL_IE;
>> +		rkisp1_write(rkisp1, val, RKISP1_CIF_VI_ISP_CLK_CTRL_V12);
>> +	}
>>   }
>>   
>>   static void rkisp1_isp_start(struct rkisp1_device *rkisp1)
>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>> index 008584caaad0..408fa33bdc30 100644
>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>> @@ -185,8 +185,8 @@ static void rkisp1_bls_config(struct rkisp1_params *params,
>>   
>>   /* ISP LS correction interface function */
>>   static void
>> -rkisp1_lsc_matrix_config(struct rkisp1_params *params,
>> -			 const struct rkisp1_cif_isp_lsc_config *pconfig)
>> +rkisp1_lsc_matrix_config_v10(struct rkisp1_params *params,
>> +			     const struct rkisp1_cif_isp_lsc_config *pconfig)
>>   {
>>   	unsigned int isp_lsc_status, sram_addr, isp_lsc_table_sel, i, j, data;
>>   
>> @@ -212,39 +212,111 @@ rkisp1_lsc_matrix_config(struct rkisp1_params *params,
>>   		 * DWORDs (2nd value of last DWORD unused)
>>   		 */
>>   		for (j = 0; j < RKISP1_CIF_ISP_LSC_SAMPLES_MAX - 1; j += 2) {
>> -			data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->r_data_tbl[i][j],
>> -							     pconfig->r_data_tbl[i][j + 1]);
>> +			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->r_data_tbl[i][j],
>> +								 pconfig->r_data_tbl[i][j + 1]);
>>   			rkisp1_write(params->rkisp1, data,
>>   				     RKISP1_CIF_ISP_LSC_R_TABLE_DATA);
>>   
>> -			data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->gr_data_tbl[i][j],
>> -							     pconfig->gr_data_tbl[i][j + 1]);
>> +			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->gr_data_tbl[i][j],
>> +								 pconfig->gr_data_tbl[i][j + 1]);
>>   			rkisp1_write(params->rkisp1, data,
>>   				     RKISP1_CIF_ISP_LSC_GR_TABLE_DATA);
>>   
>> -			data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->gb_data_tbl[i][j],
>> -							     pconfig->gb_data_tbl[i][j + 1]);
>> +			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->gb_data_tbl[i][j],
>> +								 pconfig->gb_data_tbl[i][j + 1]);
>>   			rkisp1_write(params->rkisp1, data,
>>   				     RKISP1_CIF_ISP_LSC_GB_TABLE_DATA);
>>   
>> -			data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->b_data_tbl[i][j],
>> -							     pconfig->b_data_tbl[i][j + 1]);
>> +			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->b_data_tbl[i][j],
>> +								 pconfig->b_data_tbl[i][j + 1]);
>>   			rkisp1_write(params->rkisp1, data,
>>   				     RKISP1_CIF_ISP_LSC_B_TABLE_DATA);
>>   		}
>> -		data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->r_data_tbl[i][j], 0);
>> +		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->r_data_tbl[i][j], 0);
>>   		rkisp1_write(params->rkisp1, data,
>>   			     RKISP1_CIF_ISP_LSC_R_TABLE_DATA);
>>   
>> -		data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->gr_data_tbl[i][j], 0);
>> +		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->gr_data_tbl[i][j], 0);
>>   		rkisp1_write(params->rkisp1, data,
>>   			     RKISP1_CIF_ISP_LSC_GR_TABLE_DATA);
>>   
>> -		data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->gb_data_tbl[i][j], 0);
>> +		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->gb_data_tbl[i][j], 0);
>>   		rkisp1_write(params->rkisp1, data,
>>   			     RKISP1_CIF_ISP_LSC_GB_TABLE_DATA);
>>   
>> -		data = RKISP1_CIF_ISP_LSC_TABLE_DATA(pconfig->b_data_tbl[i][j], 0);
>> +		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(pconfig->b_data_tbl[i][j], 0);
>> +		rkisp1_write(params->rkisp1, data,
>> +			     RKISP1_CIF_ISP_LSC_B_TABLE_DATA);
> 
> I understand this patch shouldn't change v10 behaviour, shouldn't this write be in a
> separate patch?
> 

Helen, this code is not a new code in V10 but part of the function rkisp1_lsc_matrix_config_v12
just that the diff is a bit confusing. The two function rkisp1_lsc_matrix_config_*
are identical except of those macro operations.

Heiko, maybe you can separate the patch to two patches, one patch only do the renaming
of adding _v10 to all the needed functions and macros, and then a diffrent patch
that adds the _v12 versions? That will be easyer to review,

Thanks,
Dafna

>> +	}
>> +	isp_lsc_table_sel = (isp_lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE) ?
>> +			    RKISP1_CIF_ISP_LSC_TABLE_0 :
>> +			    RKISP1_CIF_ISP_LSC_TABLE_1;
>> +	rkisp1_write(params->rkisp1, isp_lsc_table_sel,
>> +		     RKISP1_CIF_ISP_LSC_TABLE_SEL);
> 
> Same here.
> 
>> +}
>> +
>> +static void
>> +rkisp1_lsc_matrix_config_v12(struct rkisp1_params *params,
>> +			     const struct rkisp1_cif_isp_lsc_config *pconfig)
>> +{
>> +	unsigned int isp_lsc_status, sram_addr, isp_lsc_table_sel, i, j, data;
>> +
>> +	isp_lsc_status = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_LSC_STATUS);
>> +
>> +	/* RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_153 = ( 17 * 18 ) >> 1 */
>> +	sram_addr = (isp_lsc_status & RKISP1_CIF_ISP_LSC_ACTIVE_TABLE) ?
>> +		     RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_0 :
>> +		     RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_153;
>> +	rkisp1_write(params->rkisp1, sram_addr, RKISP1_CIF_ISP_LSC_R_TABLE_ADDR);
>> +	rkisp1_write(params->rkisp1, sram_addr, RKISP1_CIF_ISP_LSC_GR_TABLE_ADDR);
>> +	rkisp1_write(params->rkisp1, sram_addr, RKISP1_CIF_ISP_LSC_GB_TABLE_ADDR);
>> +	rkisp1_write(params->rkisp1, sram_addr, RKISP1_CIF_ISP_LSC_B_TABLE_ADDR);
>> +
>> +	/* program data tables (table size is 9 * 17 = 153) */
>> +	for (i = 0; i < RKISP1_CIF_ISP_LSC_SAMPLES_MAX; i++) {
>> +		/*
>> +		 * 17 sectors with 2 values in one DWORD = 9
>> +		 * DWORDs (2nd value of last DWORD unused)
>> +		 */
>> +		for (j = 0; j < RKISP1_CIF_ISP_LSC_SAMPLES_MAX - 1; j += 2) {
>> +			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
>> +					pconfig->r_data_tbl[i][j],
>> +					pconfig->r_data_tbl[i][j + 1]);
>> +			rkisp1_write(params->rkisp1, data,
>> +				     RKISP1_CIF_ISP_LSC_R_TABLE_DATA);
>> +
>> +			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
>> +					pconfig->gr_data_tbl[i][j],
>> +					pconfig->gr_data_tbl[i][j + 1]);
>> +			rkisp1_write(params->rkisp1, data,
>> +				     RKISP1_CIF_ISP_LSC_GR_TABLE_DATA);
>> +
>> +			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
>> +					pconfig->gb_data_tbl[i][j],
>> +					pconfig->gb_data_tbl[i][j + 1]);
>> +			rkisp1_write(params->rkisp1, data,
>> +				     RKISP1_CIF_ISP_LSC_GB_TABLE_DATA);
>> +
>> +			data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(
>> +					pconfig->b_data_tbl[i][j],
>> +					pconfig->b_data_tbl[i][j + 1]);
>> +			rkisp1_write(params->rkisp1, data,
>> +				     RKISP1_CIF_ISP_LSC_B_TABLE_DATA);
>> +		}
>> +
>> +		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(pconfig->r_data_tbl[i][j], 0);
>> +		rkisp1_write(params->rkisp1, data,
>> +			     RKISP1_CIF_ISP_LSC_R_TABLE_DATA);
>> +
>> +		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(pconfig->gr_data_tbl[i][j], 0);
>> +		rkisp1_write(params->rkisp1, data,
>> +			     RKISP1_CIF_ISP_LSC_GR_TABLE_DATA);
>> +
>> +		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(pconfig->gb_data_tbl[i][j], 0);
>> +		rkisp1_write(params->rkisp1, data,
>> +			     RKISP1_CIF_ISP_LSC_GB_TABLE_DATA);
>> +
>> +		data = RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(pconfig->b_data_tbl[i][j], 0);
>>   		rkisp1_write(params->rkisp1, data,
>>   			     RKISP1_CIF_ISP_LSC_B_TABLE_DATA);
>>   	}
>> @@ -382,18 +454,37 @@ static void rkisp1_sdg_config(struct rkisp1_params *params,
>>   }
>>   
>>   /* ISP GAMMA correction interface function */
>> -static void rkisp1_goc_config(struct rkisp1_params *params,
>> -			      const struct rkisp1_cif_isp_goc_config *arg)
>> +static void rkisp1_goc_config_v10(struct rkisp1_params *params,
>> +				  const struct rkisp1_cif_isp_goc_config *arg)
>>   {
>>   	unsigned int i;
>>   
>>   	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
>>   				RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
>> -	rkisp1_write(params->rkisp1, arg->mode, RKISP1_CIF_ISP_GAMMA_OUT_MODE);
>> +	rkisp1_write(params->rkisp1, arg->mode, RKISP1_CIF_ISP_GAMMA_OUT_MODE_V10);
>>   
>>   	for (i = 0; i < params->config->gamma_out_max_samples; i++)
>>   		rkisp1_write(params->rkisp1, arg->gamma_y[i],
>> -			     RKISP1_CIF_ISP_GAMMA_OUT_Y_0 + i * 4);
>> +			     RKISP1_CIF_ISP_GAMMA_OUT_Y_0_V10 + i * 4);
>> +}
>> +
>> +static void rkisp1_goc_config_v12(struct rkisp1_params *params,
>> +				  const struct rkisp1_cif_isp_goc_config *arg)
>> +{
>> +	int i;
> 
> unsigned int
> 
>> +	u32 value;
>> +
>> +	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
>> +				RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
>> +	rkisp1_write(params->rkisp1, arg->mode, RKISP1_CIF_ISP_GAMMA_OUT_MODE_V12);
>> +
>> +	for (i = 0; i < params->config->gamma_out_max_samples / 2; i++) {
>> +		value = RKISP1_CIF_ISP_GAMMA_VALUE_V12(
>> +			arg->gamma_y[2 * i + 1],
>> +			arg->gamma_y[2 * i]);
>> +		rkisp1_write(params->rkisp1, value,
>> +			     RKISP1_CIF_ISP_GAMMA_OUT_Y_0_V12 + i * 4);
>> +	}
>>   }
>>   
>>   /* ISP Cross Talk */
>> @@ -433,8 +524,8 @@ static void rkisp1_ctk_enable(struct rkisp1_params *params, bool en)
>>   }
>>   
>>   /* ISP White Balance Mode */
>> -static void rkisp1_awb_meas_config(struct rkisp1_params *params,
>> -				   const struct rkisp1_cif_isp_awb_meas_config *arg)
>> +static void rkisp1_awb_meas_config_v10(struct rkisp1_params *params,
>> +				       const struct rkisp1_cif_isp_awb_meas_config *arg)
>>   {
>>   	u32 reg_val = 0;
>>   	/* based on the mode,configure the awb module */
>> @@ -442,43 +533,82 @@ static void rkisp1_awb_meas_config(struct rkisp1_params *params,
>>   		/* Reference Cb and Cr */
>>   		rkisp1_write(params->rkisp1,
>>   			     RKISP1_CIF_ISP_AWB_REF_CR_SET(arg->awb_ref_cr) |
>> -			     arg->awb_ref_cb, RKISP1_CIF_ISP_AWB_REF);
>> +			     arg->awb_ref_cb, RKISP1_CIF_ISP_AWB_REF_V10);
>>   		/* Yc Threshold */
>>   		rkisp1_write(params->rkisp1,
>>   			     RKISP1_CIF_ISP_AWB_MAX_Y_SET(arg->max_y) |
>>   			     RKISP1_CIF_ISP_AWB_MIN_Y_SET(arg->min_y) |
>>   			     RKISP1_CIF_ISP_AWB_MAX_CS_SET(arg->max_csum) |
>> -			     arg->min_c, RKISP1_CIF_ISP_AWB_THRESH);
>> +			     arg->min_c, RKISP1_CIF_ISP_AWB_THRESH_V10);
>>   	}
>>   
>> -	reg_val = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AWB_PROP);
>> +	reg_val = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AWB_PROP_V10);
>>   	if (arg->enable_ymax_cmp)
>>   		reg_val |= RKISP1_CIF_ISP_AWB_YMAX_CMP_EN;
>>   	else
>>   		reg_val &= ~RKISP1_CIF_ISP_AWB_YMAX_CMP_EN;
>> -	rkisp1_write(params->rkisp1, reg_val, RKISP1_CIF_ISP_AWB_PROP);
>> +	rkisp1_write(params->rkisp1, reg_val, RKISP1_CIF_ISP_AWB_PROP_V10);
>>   
>>   	/* window offset */
>>   	rkisp1_write(params->rkisp1,
>> -		     arg->awb_wnd.v_offs, RKISP1_CIF_ISP_AWB_WND_V_OFFS);
>> +		     arg->awb_wnd.v_offs, RKISP1_CIF_ISP_AWB_WND_V_OFFS_V10);
>>   	rkisp1_write(params->rkisp1,
>> -		     arg->awb_wnd.h_offs, RKISP1_CIF_ISP_AWB_WND_H_OFFS);
>> +		     arg->awb_wnd.h_offs, RKISP1_CIF_ISP_AWB_WND_H_OFFS_V10);
>>   	/* AWB window size */
>>   	rkisp1_write(params->rkisp1,
>> -		     arg->awb_wnd.v_size, RKISP1_CIF_ISP_AWB_WND_V_SIZE);
>> +		     arg->awb_wnd.v_size, RKISP1_CIF_ISP_AWB_WND_V_SIZE_V10);
>>   	rkisp1_write(params->rkisp1,
>> -		     arg->awb_wnd.h_size, RKISP1_CIF_ISP_AWB_WND_H_SIZE);
>> +		     arg->awb_wnd.h_size, RKISP1_CIF_ISP_AWB_WND_H_SIZE_V10);
>>   	/* Number of frames */
>>   	rkisp1_write(params->rkisp1,
>> -		     arg->frames, RKISP1_CIF_ISP_AWB_FRAMES);
>> +		     arg->frames, RKISP1_CIF_ISP_AWB_FRAMES_V10);
>> +}
>> +
>> +static void rkisp1_awb_meas_config_v12(struct rkisp1_params *params,
>> +				       const struct rkisp1_cif_isp_awb_meas_config *arg)
>> +{
>> +	u32 reg_val = 0;> +	/* based on the mode,configure the awb module */
>> +	if (arg->awb_mode == RKISP1_CIF_ISP_AWB_MODE_YCBCR) {
>> +		/* Reference Cb and Cr */
>> +		rkisp1_write(params->rkisp1,
>> +			     RKISP1_CIF_ISP_AWB_REF_CR_SET(arg->awb_ref_cr) |
>> +			     arg->awb_ref_cb, RKISP1_CIF_ISP_AWB_REF_V12);
>> +		/* Yc Threshold */
>> +		rkisp1_write(params->rkisp1,
>> +			     RKISP1_CIF_ISP_AWB_MAX_Y_SET(arg->max_y) |
>> +			     RKISP1_CIF_ISP_AWB_MIN_Y_SET(arg->min_y) |
>> +			     RKISP1_CIF_ISP_AWB_MAX_CS_SET(arg->max_csum) |
>> +			     arg->min_c, RKISP1_CIF_ISP_AWB_THRESH_V12);
>> +	}
>> +
>> +	reg_val = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AWB_PROP_V12);
>> +	if (arg->enable_ymax_cmp)
>> +		reg_val |= RKISP1_CIF_ISP_AWB_YMAX_CMP_EN;
>> +	else
>> +		reg_val &= ~RKISP1_CIF_ISP_AWB_YMAX_CMP_EN;
>> +	reg_val &= ~RKISP1_CIF_ISP_AWB_SET_FRAMES_MASK_V12;
>> +	reg_val |= RKISP1_CIF_ISP_AWB_SET_FRAMES_V12(arg->frames);
>> +	rkisp1_write(params->rkisp1, reg_val, RKISP1_CIF_ISP_AWB_PROP_V12);
>> +
>> +	/* window offset */
>> +	rkisp1_write(params->rkisp1,
>> +		     arg->awb_wnd.v_offs << 16 |
>> +		     arg->awb_wnd.h_offs,
>> +		     RKISP1_CIF_ISP_AWB_OFFS_V12);
>> +	/* AWB window size */
>> +	rkisp1_write(params->rkisp1,
>> +		     arg->awb_wnd.v_size << 16 |
>> +		     arg->awb_wnd.h_size,
>> +		     RKISP1_CIF_ISP_AWB_SIZE_V12);
>>   }
>>   
>>   static void
>> -rkisp1_awb_meas_enable(struct rkisp1_params *params,
>> -		       const struct rkisp1_cif_isp_awb_meas_config *arg,
>> -		       bool en)
>> +rkisp1_awb_meas_enable_v10(struct rkisp1_params *params,
>> +			   const struct rkisp1_cif_isp_awb_meas_config *arg,
>> +			   bool en)
>>   {
>> -	u32 reg_val = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AWB_PROP);
>> +	u32 reg_val = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AWB_PROP_V10);
>>   
>>   	/* switch off */
>>   	reg_val &= RKISP1_CIF_ISP_AWB_MODE_MASK_NONE;
>> @@ -489,34 +619,76 @@ rkisp1_awb_meas_enable(struct rkisp1_params *params,
>>   		else
>>   			reg_val |= RKISP1_CIF_ISP_AWB_MODE_YCBCR_EN;
>>   
>> -		rkisp1_write(params->rkisp1, reg_val, RKISP1_CIF_ISP_AWB_PROP);
>> +		rkisp1_write(params->rkisp1, reg_val, RKISP1_CIF_ISP_AWB_PROP_V10);
>>   
>>   		/* Measurements require AWB block be active. */
>>   		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
>>   				      RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
>>   	} else {
>>   		rkisp1_write(params->rkisp1,
>> -			     reg_val, RKISP1_CIF_ISP_AWB_PROP);
>> +			     reg_val, RKISP1_CIF_ISP_AWB_PROP_V10);
>>   		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
>>   					RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
>>   	}
>>   }
>>   
>>   static void
>> -rkisp1_awb_gain_config(struct rkisp1_params *params,
>> -		       const struct rkisp1_cif_isp_awb_gain_config *arg)
>> +rkisp1_awb_meas_enable_v12(struct rkisp1_params *params,
>> +			   const struct rkisp1_cif_isp_awb_meas_config *arg,
>> +			   bool en)
>> +{
>> +	u32 reg_val = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AWB_PROP_V12);
>> +
>> +	/* switch off */
>> +	reg_val &= RKISP1_CIF_ISP_AWB_MODE_MASK_NONE;
>> +
>> +	if (en) {
>> +		if (arg->awb_mode == RKISP1_CIF_ISP_AWB_MODE_RGB)
>> +			reg_val |= RKISP1_CIF_ISP_AWB_MODE_RGB_EN;
>> +		else
>> +			reg_val |= RKISP1_CIF_ISP_AWB_MODE_YCBCR_EN;
>> +
>> +		rkisp1_write(params->rkisp1, reg_val, RKISP1_CIF_ISP_AWB_PROP_V12);
>> +
>> +		/* Measurements require AWB block be active. */
>> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
>> +				      RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
>> +	} else {
>> +		rkisp1_write(params->rkisp1,
>> +			     reg_val, RKISP1_CIF_ISP_AWB_PROP_V12);
>> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
>> +					RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
>> +	}
>> +}
>> +
>> +static void
>> +rkisp1_awb_gain_config_v10(struct rkisp1_params *params,
>> +			   const struct rkisp1_cif_isp_awb_gain_config *arg)
>> +{
>> +	rkisp1_write(params->rkisp1,
>> +		     RKISP1_CIF_ISP_AWB_GAIN_R_SET(arg->gain_green_r) |
>> +		     arg->gain_green_b, RKISP1_CIF_ISP_AWB_GAIN_G_V10);
>> +
>> +	rkisp1_write(params->rkisp1,
>> +		     RKISP1_CIF_ISP_AWB_GAIN_R_SET(arg->gain_red) |
>> +		     arg->gain_blue, RKISP1_CIF_ISP_AWB_GAIN_RB_V10);
>> +}
>> +
>> +static void
>> +rkisp1_awb_gain_config_v12(struct rkisp1_params *params,
>> +			   const struct rkisp1_cif_isp_awb_gain_config *arg)
>>   {
>>   	rkisp1_write(params->rkisp1,
>>   		     RKISP1_CIF_ISP_AWB_GAIN_R_SET(arg->gain_green_r) |
>> -		     arg->gain_green_b, RKISP1_CIF_ISP_AWB_GAIN_G);
>> +		     arg->gain_green_b, RKISP1_CIF_ISP_AWB_GAIN_G_V12);
>>   
>>   	rkisp1_write(params->rkisp1,
>>   		     RKISP1_CIF_ISP_AWB_GAIN_R_SET(arg->gain_red) |
>> -		     arg->gain_blue, RKISP1_CIF_ISP_AWB_GAIN_RB);
>> +		     arg->gain_blue, RKISP1_CIF_ISP_AWB_GAIN_RB_V12);
>>   }
>>   
>> -static void rkisp1_aec_config(struct rkisp1_params *params,
>> -			      const struct rkisp1_cif_isp_aec_config *arg)
>> +static void rkisp1_aec_config_v10(struct rkisp1_params *params,
>> +				  const struct rkisp1_cif_isp_aec_config *arg)
>>   {
>>   	unsigned int block_hsize, block_vsize;
>>   	u32 exp_ctrl;
>> @@ -531,21 +703,55 @@ static void rkisp1_aec_config(struct rkisp1_params *params,
>>   	rkisp1_write(params->rkisp1, exp_ctrl, RKISP1_CIF_ISP_EXP_CTRL);
>>   
>>   	rkisp1_write(params->rkisp1,
>> -		     arg->meas_window.h_offs, RKISP1_CIF_ISP_EXP_H_OFFSET);
>> +		     arg->meas_window.h_offs, RKISP1_CIF_ISP_EXP_H_OFFSET_V10);
>>   	rkisp1_write(params->rkisp1,
>> -		     arg->meas_window.v_offs, RKISP1_CIF_ISP_EXP_V_OFFSET);
>> +		     arg->meas_window.v_offs, RKISP1_CIF_ISP_EXP_V_OFFSET_V10);
>>   
>>   	block_hsize = arg->meas_window.h_size /
>> -		      RKISP1_CIF_ISP_EXP_COLUMN_NUM - 1;
>> +		      RKISP1_CIF_ISP_EXP_COLUMN_NUM_V10 - 1;
>>   	block_vsize = arg->meas_window.v_size /
>> -		      RKISP1_CIF_ISP_EXP_ROW_NUM - 1;
>> +		      RKISP1_CIF_ISP_EXP_ROW_NUM_V10 - 1;
>> +
>> +	rkisp1_write(params->rkisp1,
>> +		     RKISP1_CIF_ISP_EXP_H_SIZE_SET_V10(block_hsize),
>> +		     RKISP1_CIF_ISP_EXP_H_SIZE_V10);
>> +	rkisp1_write(params->rkisp1,
>> +		     RKISP1_CIF_ISP_EXP_V_SIZE_SET_V10(block_vsize),
>> +		     RKISP1_CIF_ISP_EXP_V_SIZE_V10);
>> +}
>> +
>> +static void rkisp1_aec_config_v12(struct rkisp1_params *params,
>> +			       const struct rkisp1_cif_isp_aec_config *arg)
>> +{
>> +	u32 exp_ctrl;
>> +	u32 block_hsize, block_vsize;
>> +	u32 wnd_num_idx = 1;
>> +	const u32 ae_wnd_num[] = {
>> +		5, 9, 15, 15
>> +	};
> 
> I think it would be better to declare in the same line.
> 
>> +
>> +	/* avoid to override the old enable value */
>> +	exp_ctrl = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_EXP_CTRL);
>> +	exp_ctrl &= RKISP1_CIF_ISP_EXP_ENA;
>> +	if (arg->autostop)
>> +		exp_ctrl |= RKISP1_CIF_ISP_EXP_CTRL_AUTOSTOP;
>> +	if (arg->mode == RKISP1_CIF_ISP_EXP_MEASURING_MODE_1)
>> +		exp_ctrl |= RKISP1_CIF_ISP_EXP_CTRL_MEASMODE_1;
>> +	exp_ctrl |= RKISP1_CIF_ISP_EXP_CTRL_WNDNUM_SET_V12(wnd_num_idx);
>> +	rkisp1_write(params->rkisp1, exp_ctrl, RKISP1_CIF_ISP_EXP_CTRL);
>>   
>>   	rkisp1_write(params->rkisp1,
>> -		     RKISP1_CIF_ISP_EXP_H_SIZE_SET(block_hsize),
>> -		     RKISP1_CIF_ISP_EXP_H_SIZE);
>> +		     RKISP1_CIF_ISP_EXP_V_OFFSET_SET_V12(arg->meas_window.v_offs) |
>> +		     RKISP1_CIF_ISP_EXP_H_OFFSET_SET_V12(arg->meas_window.h_offs),
>> +		     RKISP1_CIF_ISP_EXP_OFFS_V12);
>> +
>> +	block_hsize = arg->meas_window.h_size / ae_wnd_num[wnd_num_idx] - 1;
>> +	block_vsize = arg->meas_window.v_size / ae_wnd_num[wnd_num_idx] - 1;
>> +
>>   	rkisp1_write(params->rkisp1,
>> -		     RKISP1_CIF_ISP_EXP_V_SIZE_SET(block_vsize),
>> -		     RKISP1_CIF_ISP_EXP_V_SIZE);
>> +		     RKISP1_CIF_ISP_EXP_V_SIZE_SET_V12(block_vsize) |
>> +		     RKISP1_CIF_ISP_EXP_H_SIZE_SET_V12(block_hsize),
>> +		     RKISP1_CIF_ISP_EXP_SIZE_V12);
>>   }
>>   
>>   static void rkisp1_cproc_config(struct rkisp1_params *params,
>> @@ -578,72 +784,154 @@ static void rkisp1_cproc_config(struct rkisp1_params *params,
>>   	}
>>   }
>>   
>> -static void rkisp1_hst_config(struct rkisp1_params *params,
>> -			      const struct rkisp1_cif_isp_hst_config *arg)
>> +static void rkisp1_hst_config_v10(struct rkisp1_params *params,
>> +				  const struct rkisp1_cif_isp_hst_config *arg)
>>   {
>>   	unsigned int block_hsize, block_vsize;
>>   	static const u32 hist_weight_regs[] = {
>> -		RKISP1_CIF_ISP_HIST_WEIGHT_00TO30,
>> -		RKISP1_CIF_ISP_HIST_WEIGHT_40TO21,
>> -		RKISP1_CIF_ISP_HIST_WEIGHT_31TO12,
>> -		RKISP1_CIF_ISP_HIST_WEIGHT_22TO03,
>> -		RKISP1_CIF_ISP_HIST_WEIGHT_13TO43,
>> -		RKISP1_CIF_ISP_HIST_WEIGHT_04TO34,
>> -		RKISP1_CIF_ISP_HIST_WEIGHT_44,
>> +		RKISP1_CIF_ISP_HIST_WEIGHT_00TO30_V10,
>> +		RKISP1_CIF_ISP_HIST_WEIGHT_40TO21_V10,
>> +		RKISP1_CIF_ISP_HIST_WEIGHT_31TO12_V10,
>> +		RKISP1_CIF_ISP_HIST_WEIGHT_22TO03_V10,
>> +		RKISP1_CIF_ISP_HIST_WEIGHT_13TO43_V10,
>> +		RKISP1_CIF_ISP_HIST_WEIGHT_04TO34_V10,
>> +		RKISP1_CIF_ISP_HIST_WEIGHT_44_V10,
>>   	};
>>   	const u8 *weight;
>>   	unsigned int i;
>>   	u32 hist_prop;
>>   
>>   	/* avoid to override the old enable value */
>> -	hist_prop = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_HIST_PROP);
>> -	hist_prop &= RKISP1_CIF_ISP_HIST_PROP_MODE_MASK;
>> -	hist_prop |= RKISP1_CIF_ISP_HIST_PREDIV_SET(arg->histogram_predivider);
>> -	rkisp1_write(params->rkisp1, hist_prop, RKISP1_CIF_ISP_HIST_PROP);
>> +	hist_prop = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_HIST_PROP_V10);
>> +	hist_prop &= RKISP1_CIF_ISP_HIST_PROP_MODE_MASK_V10;
>> +	hist_prop |= RKISP1_CIF_ISP_HIST_PREDIV_SET_V10(arg->histogram_predivider);
>> +	rkisp1_write(params->rkisp1, hist_prop, RKISP1_CIF_ISP_HIST_PROP_V10);
>>   	rkisp1_write(params->rkisp1,
>>   		     arg->meas_window.h_offs,
>> -		     RKISP1_CIF_ISP_HIST_H_OFFS);
>> +		     RKISP1_CIF_ISP_HIST_H_OFFS_V10);
>>   	rkisp1_write(params->rkisp1,
>>   		     arg->meas_window.v_offs,
>> -		     RKISP1_CIF_ISP_HIST_V_OFFS);
>> +		     RKISP1_CIF_ISP_HIST_V_OFFS_V10);
>>   
>>   	block_hsize = arg->meas_window.h_size /
>> -		      RKISP1_CIF_ISP_HIST_COLUMN_NUM - 1;
>> -	block_vsize = arg->meas_window.v_size / RKISP1_CIF_ISP_HIST_ROW_NUM - 1;
>> +		      RKISP1_CIF_ISP_HIST_COLUMN_NUM_V10 - 1;
>> +	block_vsize = arg->meas_window.v_size / RKISP1_CIF_ISP_HIST_ROW_NUM_V10 - 1;
>>   
>> -	rkisp1_write(params->rkisp1, block_hsize, RKISP1_CIF_ISP_HIST_H_SIZE);
>> -	rkisp1_write(params->rkisp1, block_vsize, RKISP1_CIF_ISP_HIST_V_SIZE);
>> +	rkisp1_write(params->rkisp1, block_hsize, RKISP1_CIF_ISP_HIST_H_SIZE_V10);
>> +	rkisp1_write(params->rkisp1, block_vsize, RKISP1_CIF_ISP_HIST_V_SIZE_V10);
>>   
>>   	weight = arg->hist_weight;
>>   	for (i = 0; i < ARRAY_SIZE(hist_weight_regs); ++i, weight += 4)
>>   		rkisp1_write(params->rkisp1,
>> -			     RKISP1_CIF_ISP_HIST_WEIGHT_SET(weight[0],
>> +			     RKISP1_CIF_ISP_HIST_WEIGHT_SET_V10(weight[0],
>>   							    weight[1],
>>   							    weight[2],
>>   							    weight[3]),
>>   				 hist_weight_regs[i]);
>>   }
>>   
>> +static void rkisp1_hst_config_v12(struct rkisp1_params *params,
>> +				  const struct rkisp1_cif_isp_hst_config *arg)
>> +{
>> +	u32 i, j;
> 
> unsigned int
> 
>> +	u32 value;
>> +	u32 hist_ctrl;
>> +	u32 block_hsize, block_vsize;
>> +	u32 wnd_num_idx, hist_weight_num;
> 
> Maybe organize those in the same line.
> 
>> +	u8 weight15x15[RKISP1_CIF_ISP_HIST_WEIGHT_REG_SIZE_V12];
>> +	const u32 hist_wnd_num[] = {
>> +		5, 9, 15, 15
>> +	};
>> +
>> +	/* now we just support 9x9 window */
>> +	wnd_num_idx = 1;
>> +	memset(weight15x15, 0x00, sizeof(weight15x15));
>> +	/* avoid to override the old enable value */
>> +	hist_ctrl = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_HIST_CTRL_V12);
>> +	hist_ctrl &= RKISP1_CIF_ISP_HIST_CTRL_MODE_MASK_V12 |
>> +		     RKISP1_CIF_ISP_HIST_CTRL_EN_MASK_V12;
>> +	hist_ctrl = hist_ctrl |
>> +		    RKISP1_CIF_ISP_HIST_CTRL_INTRSEL_SET_V12(1) |
>> +		    RKISP1_CIF_ISP_HIST_CTRL_DATASEL_SET_V12(0) |
>> +		    RKISP1_CIF_ISP_HIST_CTRL_WATERLINE_SET_V12(0) |
>> +		    RKISP1_CIF_ISP_HIST_CTRL_AUTOSTOP_SET_V12(0) |
>> +		    RKISP1_CIF_ISP_HIST_CTRL_WNDNUM_SET_V12(1) |
>> +		    RKISP1_CIF_ISP_HIST_CTRL_STEPSIZE_SET_V12(arg->histogram_predivider);
>> +	rkisp1_write(params->rkisp1, hist_ctrl, RKISP1_CIF_ISP_HIST_CTRL_V12);
>> +
>> +	rkisp1_write(params->rkisp1,
>> +		     RKISP1_CIF_ISP_HIST_OFFS_SET_V12(arg->meas_window.h_offs,
>> +						      arg->meas_window.v_offs),
>> +		     RKISP1_CIF_ISP_HIST_OFFS_V12);
>> +
>> +	block_hsize = arg->meas_window.h_size / hist_wnd_num[wnd_num_idx] - 1;
>> +	block_vsize = arg->meas_window.v_size / hist_wnd_num[wnd_num_idx] - 1;
>> +	rkisp1_write(params->rkisp1,
>> +		     RKISP1_CIF_ISP_HIST_SIZE_SET_V12(block_hsize, block_vsize),
>> +		     RKISP1_CIF_ISP_HIST_SIZE_V12);
>> +
>> +	for (i = 0; i < hist_wnd_num[wnd_num_idx]; i++) {
>> +		for (j = 0; j < hist_wnd_num[wnd_num_idx]; j++) {
>> +			weight15x15[i * RKISP1_CIF_ISP_HIST_ROW_NUM_V12 + j] =
>> +				arg->hist_weight[i * hist_wnd_num[wnd_num_idx] + j];
>> +		}
>> +	}
>> +
>> +	hist_weight_num = RKISP1_CIF_ISP_HIST_WEIGHT_REG_SIZE_V12;
>> +	for (i = 0; i < (hist_weight_num / 4); i++) {
>> +		value = RKISP1_CIF_ISP_HIST_WEIGHT_SET_V12(
>> +				 weight15x15[4 * i + 0],
>> +				 weight15x15[4 * i + 1],
>> +				 weight15x15[4 * i + 2],
>> +				 weight15x15[4 * i + 3]);
>> +		rkisp1_write(params->rkisp1, value,
>> +				 RKISP1_CIF_ISP_HIST_WEIGHT_V12 + 4 * i);
>> +	}
>> +	value = RKISP1_CIF_ISP_HIST_WEIGHT_SET_V12(weight15x15[4 * i + 0], 0, 0, 0);
>> +	rkisp1_write(params->rkisp1, value,
>> +				 RKISP1_CIF_ISP_HIST_WEIGHT_V12 + 4 * i);
>> +}
>> +
>>   static void
>> -rkisp1_hst_enable(struct rkisp1_params *params,
>> -		  const struct rkisp1_cif_isp_hst_config *arg, bool en)
>> +rkisp1_hst_enable_v10(struct rkisp1_params *params,
>> +		      const struct rkisp1_cif_isp_hst_config *arg, bool en)
>>   {
>>   	if (en)	{
>>   		u32 hist_prop = rkisp1_read(params->rkisp1,
>> -					    RKISP1_CIF_ISP_HIST_PROP);
>> +					    RKISP1_CIF_ISP_HIST_PROP_V10);
>>   
>> -		hist_prop &= ~RKISP1_CIF_ISP_HIST_PROP_MODE_MASK;
>> +		hist_prop &= ~RKISP1_CIF_ISP_HIST_PROP_MODE_MASK_V10;
>>   		hist_prop |= arg->mode;
>> -		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_HIST_PROP,
>> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_HIST_PROP_V10,
>>   				      hist_prop);
>>   	} else {
>> -		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_HIST_PROP,
>> -					RKISP1_CIF_ISP_HIST_PROP_MODE_MASK);
>> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_HIST_PROP_V10,
>> +					RKISP1_CIF_ISP_HIST_PROP_MODE_MASK_V10);
>> +	}
>> +}
>> +
>> +static void
>> +rkisp1_hst_enable_v12(struct rkisp1_params *params,
>> +		      const struct rkisp1_cif_isp_hst_config *arg, bool en)
>> +{
>> +	if (en) {
>> +		u32 hist_ctrl = rkisp1_read(params->rkisp1,
>> +					    RKISP1_CIF_ISP_HIST_CTRL_V12);
>> +
>> +		hist_ctrl &= ~RKISP1_CIF_ISP_HIST_CTRL_MODE_MASK_V12;
>> +		hist_ctrl |= RKISP1_CIF_ISP_HIST_CTRL_MODE_SET_V12(arg->mode);
>> +		hist_ctrl |= RKISP1_CIF_ISP_HIST_CTRL_EN_SET_V12(1);
>> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_HIST_CTRL_V12,
>> +				      hist_ctrl);
>> +	} else {
>> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_HIST_CTRL_V12,
>> +					RKISP1_CIF_ISP_HIST_CTRL_MODE_MASK_V12 |
>> +					RKISP1_CIF_ISP_HIST_CTRL_EN_MASK_V12);
>>   	}
>>   }
>>   
>> -static void rkisp1_afm_config(struct rkisp1_params *params,
>> -			      const struct rkisp1_cif_isp_afc_config *arg)
>> +static void rkisp1_afm_config_v10(struct rkisp1_params *params,
>> +				  const struct rkisp1_cif_isp_afc_config *arg)
>>   {
>>   	size_t num_of_win = min_t(size_t, ARRAY_SIZE(arg->afm_win),
>>   				  arg->num_afm_win);
>> @@ -673,6 +961,45 @@ static void rkisp1_afm_config(struct rkisp1_params *params,
>>   	rkisp1_write(params->rkisp1, afm_ctrl, RKISP1_CIF_ISP_AFM_CTRL);
>>   }
>>   
>> +static void rkisp1_afm_config_v12(struct rkisp1_params *params,
>> +				  const struct rkisp1_cif_isp_afc_config *arg)
>> +{
>> +	size_t num_of_win = min_t(size_t, ARRAY_SIZE(arg->afm_win),
>> +				  arg->num_afm_win);
>> +	u32 afm_ctrl = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AFM_CTRL);
>> +	u32 lum_var_shift, afm_var_shift;
>> +	unsigned int i;
>> +
>> +	/* Switch off to configure. */
>> +	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_AFM_CTRL,
>> +				RKISP1_CIF_ISP_AFM_ENA);
>> +
>> +	for (i = 0; i < num_of_win; i++) {
>> +		rkisp1_write(params->rkisp1,
>> +			     RKISP1_CIF_ISP_AFM_WINDOW_X(arg->afm_win[i].h_offs) |
>> +			     RKISP1_CIF_ISP_AFM_WINDOW_Y(arg->afm_win[i].v_offs),
>> +			     RKISP1_CIF_ISP_AFM_LT_A + i * 8);
>> +		rkisp1_write(params->rkisp1,
>> +			     RKISP1_CIF_ISP_AFM_WINDOW_X(arg->afm_win[i].h_size +
>> +							 arg->afm_win[i].h_offs) |
>> +			     RKISP1_CIF_ISP_AFM_WINDOW_Y(arg->afm_win[i].v_size +
>> +							 arg->afm_win[i].v_offs),
>> +			     RKISP1_CIF_ISP_AFM_RB_A + i * 8);
>> +	}
>> +	rkisp1_write(params->rkisp1, arg->thres, RKISP1_CIF_ISP_AFM_THRES);
>> +
>> +	lum_var_shift = RKISP1_CIF_ISP_AFM_GET_LUM_SHIFT_a_V12(arg->var_shift);
>> +	afm_var_shift = RKISP1_CIF_ISP_AFM_GET_AFM_SHIFT_a_V12(arg->var_shift);
>> +	rkisp1_write(params->rkisp1,
>> +		     RKISP1_CIF_ISP_AFM_SET_SHIFT_a_V12(lum_var_shift, afm_var_shift) |
>> +		     RKISP1_CIF_ISP_AFM_SET_SHIFT_b_V12(lum_var_shift, afm_var_shift) |
>> +		     RKISP1_CIF_ISP_AFM_SET_SHIFT_c_V12(lum_var_shift, afm_var_shift),
>> +		     RKISP1_CIF_ISP_AFM_VAR_SHIFT);
>> +
>> +	/* restore afm status */
>> +	rkisp1_write(params->rkisp1, afm_ctrl, RKISP1_CIF_ISP_AFM_CTRL);
>> +}
>> +
>>   static void rkisp1_ie_config(struct rkisp1_params *params,
>>   			     const struct rkisp1_cif_isp_ie_config *arg)
>>   {
>> @@ -1286,8 +1613,8 @@ static void rkisp1_params_config_parameter(struct rkisp1_params *params)
>>   
>>   	memset(hst.hist_weight, 0x01, sizeof(hst.hist_weight));
>>   	params->ops->hst_config(params, &hst);
>> -	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_HIST_PROP,
>> -			      ~RKISP1_CIF_ISP_HIST_PROP_MODE_MASK |
>> +	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_HIST_PROP_V10,
>> +			      ~RKISP1_CIF_ISP_HIST_PROP_MODE_MASK_V10 |
>>   			      rkisp1_hst_params_default_config.mode);
>>   
>>   	/* set the  range */
>> @@ -1346,22 +1673,38 @@ void rkisp1_params_disable(struct rkisp1_params *params)
>>   				RKISP1_CIF_ISP_DPF_MODE_EN);
>>   }
>>   
>> -static struct rkisp1_params_ops rkisp1_params_ops = {
>> -	.lsc_matrix_config = rkisp1_lsc_matrix_config,
>> -	.goc_config = rkisp1_goc_config,
>> -	.awb_meas_config = rkisp1_awb_meas_config,
>> -	.awb_meas_enable = rkisp1_awb_meas_enable,
>> -	.awb_gain_config = rkisp1_awb_gain_config,
>> -	.aec_config = rkisp1_aec_config,
>> -	.hst_config = rkisp1_hst_config,
>> -	.hst_enable = rkisp1_hst_enable,
>> -	.afm_config = rkisp1_afm_config,
>> +static struct rkisp1_params_ops rkisp1_v10_params_ops = {
>> +	.lsc_matrix_config = rkisp1_lsc_matrix_config_v10,
>> +	.goc_config = rkisp1_goc_config_v10,
>> +	.awb_meas_config = rkisp1_awb_meas_config_v10,
>> +	.awb_meas_enable = rkisp1_awb_meas_enable_v10,
>> +	.awb_gain_config = rkisp1_awb_gain_config_v10,
>> +	.aec_config = rkisp1_aec_config_v10,
>> +	.hst_config = rkisp1_hst_config_v10,
>> +	.hst_enable = rkisp1_hst_enable_v10,
>> +	.afm_config = rkisp1_afm_config_v10,
>>   };
>>   
>> -static struct rkisp1_params_config rkisp1_params_config = {
>> +static struct rkisp1_params_config rkisp1_v10_params_config = {
>>   	.gamma_out_max_samples = 17,
>>   };
>>   
>> +static struct rkisp1_params_ops rkisp1_v12_params_ops = {
>> +	.lsc_matrix_config = rkisp1_lsc_matrix_config_v12,
>> +	.goc_config = rkisp1_goc_config_v12,
>> +	.awb_meas_config = rkisp1_awb_meas_config_v12,
>> +	.awb_meas_enable = rkisp1_awb_meas_enable_v12,
>> +	.awb_gain_config = rkisp1_awb_gain_config_v12,
>> +	.aec_config = rkisp1_aec_config_v12,
>> +	.hst_config = rkisp1_hst_config_v12,
>> +	.hst_enable = rkisp1_hst_enable_v12,
>> +	.afm_config = rkisp1_afm_config_v12,
>> +};
>> +
>> +static struct rkisp1_params_config rkisp1_v12_params_config = {
>> +	.gamma_out_max_samples = 34,
>> +};
>> +
>>   static int rkisp1_params_enum_fmt_meta_out(struct file *file, void *priv,
>>   					   struct v4l2_fmtdesc *f)
>>   {
>> @@ -1528,8 +1871,14 @@ static void rkisp1_init_params(struct rkisp1_params *params)
>>   		V4L2_META_FMT_RK_ISP1_PARAMS;
>>   	params->vdev_fmt.fmt.meta.buffersize =
>>   		sizeof(struct rkisp1_params_cfg);
>> -	params->ops = &rkisp1_params_ops;
>> -	params->config = &rkisp1_params_config;
>> +
>> +	if (params->rkisp1->isp_ver == RKISP1_V12) {
>> +		params->ops = &rkisp1_v12_params_ops;
>> +		params->config = &rkisp1_v12_params_config;
>> +	} else {
>> +		params->ops = &rkisp1_v10_params_ops;
>> +		params->config = &rkisp1_v10_params_config;
>> +	}
>>   }
>>   
>>   int rkisp1_params_register(struct rkisp1_device *rkisp1)
>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>> index 8a8d960a679c..388adee3beff 100644
>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>> @@ -212,6 +212,35 @@
>>   
>>   /* CCL */
>>   #define RKISP1_CIF_CCL_CIF_CLK_DIS			BIT(2)
>> +/* VI_ISP_CLK_CTRL */
>> +#define RKISP1_CIF_CLK_CTRL_ISP_RAW			BIT(0)
>> +#define RKISP1_CIF_CLK_CTRL_ISP_RGB			BIT(1)
>> +#define RKISP1_CIF_CLK_CTRL_ISP_YUV			BIT(2)
>> +#define RKISP1_CIF_CLK_CTRL_ISP_3A			BIT(3)
>> +#define RKISP1_CIF_CLK_CTRL_MIPI_RAW			BIT(4)
>> +#define RKISP1_CIF_CLK_CTRL_ISP_IE			BIT(5)
>> +#define RKISP1_CIF_CLK_CTRL_RSZ_RAM			BIT(6)
>> +#define RKISP1_CIF_CLK_CTRL_JPEG_RAM			BIT(7)
>> +#define RKISP1_CIF_CLK_CTRL_ACLK_ISP			BIT(8)
>> +#define RKISP1_CIF_CLK_CTRL_MI_IDC			BIT(9)
>> +#define RKISP1_CIF_CLK_CTRL_MI_MP			BIT(10)
>> +#define RKISP1_CIF_CLK_CTRL_MI_JPEG			BIT(11)
>> +#define RKISP1_CIF_CLK_CTRL_MI_DP			BIT(12)
>> +#define RKISP1_CIF_CLK_CTRL_MI_Y12			BIT(13)
>> +#define RKISP1_CIF_CLK_CTRL_MI_SP			BIT(14)
>> +#define RKISP1_CIF_CLK_CTRL_MI_RAW0			BIT(15)
>> +#define RKISP1_CIF_CLK_CTRL_MI_RAW1			BIT(16)
>> +#define RKISP1_CIF_CLK_CTRL_MI_READ			BIT(17)
>> +#define RKISP1_CIF_CLK_CTRL_MI_RAWRD			BIT(18)
>> +#define RKISP1_CIF_CLK_CTRL_CP				BIT(19)
>> +#define RKISP1_CIF_CLK_CTRL_IE				BIT(20)
>> +#define RKISP1_CIF_CLK_CTRL_SI				BIT(21)
>> +#define RKISP1_CIF_CLK_CTRL_RSZM			BIT(22)
>> +#define RKISP1_CIF_CLK_CTRL_DPMUX			BIT(23)
>> +#define RKISP1_CIF_CLK_CTRL_JPEG			BIT(24)
>> +#define RKISP1_CIF_CLK_CTRL_RSZS			BIT(25)
>> +#define RKISP1_CIF_CLK_CTRL_MIPI			BIT(26)
>> +#define RKISP1_CIF_CLK_CTRL_MARVINMI			BIT(27)
>>   /* ICCL */
>>   #define RKISP1_CIF_ICCL_ISP_CLK				BIT(0)
>>   #define RKISP1_CIF_ICCL_CP_CLK				BIT(1)
>> @@ -346,25 +375,57 @@
>>   #define RKISP1_CIF_SUPER_IMP_CTRL_TRANSP_DIS		BIT(2)
>>   
>>   /* ISP HISTOGRAM CALCULATION : ISP_HIST_PROP */
>> -#define RKISP1_CIF_ISP_HIST_PROP_MODE_DIS		(0 << 0)
>> -#define RKISP1_CIF_ISP_HIST_PROP_MODE_RGB		BIT(0)
>> -#define RKISP1_CIF_ISP_HIST_PROP_MODE_RED		(2 << 0)
>> -#define RKISP1_CIF_ISP_HIST_PROP_MODE_GREEN		(3 << 0)
>> -#define RKISP1_CIF_ISP_HIST_PROP_MODE_BLUE		(4 << 0)
>> -#define RKISP1_CIF_ISP_HIST_PROP_MODE_LUM		(5 << 0)
>> -#define RKISP1_CIF_ISP_HIST_PROP_MODE_MASK		0x7
>> -#define RKISP1_CIF_ISP_HIST_PREDIV_SET(x)		(((x) & 0x7F) << 3)
>> -#define RKISP1_CIF_ISP_HIST_WEIGHT_SET(v0, v1, v2, v3)	\
>> +#define RKISP1_CIF_ISP_HIST_PROP_MODE_DIS_V10		(0 << 0)
>> +#define RKISP1_CIF_ISP_HIST_PROP_MODE_RGB_V10		BIT(0)
>> +#define RKISP1_CIF_ISP_HIST_PROP_MODE_RED_V10		(2 << 0)
>> +#define RKISP1_CIF_ISP_HIST_PROP_MODE_GREEN_V10		(3 << 0)
>> +#define RKISP1_CIF_ISP_HIST_PROP_MODE_BLUE_V10		(4 << 0)
>> +#define RKISP1_CIF_ISP_HIST_PROP_MODE_LUM_V10		(5 << 0)
>> +#define RKISP1_CIF_ISP_HIST_PROP_MODE_MASK_V10		0x7
>> +#define RKISP1_CIF_ISP_HIST_PREDIV_SET_V10(x)		(((x) & 0x7F) << 3)
>> +#define RKISP1_CIF_ISP_HIST_WEIGHT_SET_V10(v0, v1, v2, v3)	\
>>   				     (((v0) & 0x1F) | (((v1) & 0x1F) << 8)  |\
>>   				     (((v2) & 0x1F) << 16) | \
>>   				     (((v3) & 0x1F) << 24))
>>   
>> -#define RKISP1_CIF_ISP_HIST_WINDOW_OFFSET_RESERVED	0xFFFFF000
>> -#define RKISP1_CIF_ISP_HIST_WINDOW_SIZE_RESERVED	0xFFFFF800
>> -#define RKISP1_CIF_ISP_HIST_WEIGHT_RESERVED		0xE0E0E0E0
>> -#define RKISP1_CIF_ISP_MAX_HIST_PREDIVIDER		0x0000007F
>> -#define RKISP1_CIF_ISP_HIST_ROW_NUM			5
>> -#define RKISP1_CIF_ISP_HIST_COLUMN_NUM			5
>> +#define RKISP1_CIF_ISP_HIST_WINDOW_OFFSET_RESERVED_V10	0xFFFFF000
>> +#define RKISP1_CIF_ISP_HIST_WINDOW_SIZE_RESERVED_V10	0xFFFFF800
>> +#define RKISP1_CIF_ISP_HIST_WEIGHT_RESERVED_V10		0xE0E0E0E0
>> +#define RKISP1_CIF_ISP_MAX_HIST_PREDIVIDER_V10		0x0000007F
>> +#define RKISP1_CIF_ISP_HIST_ROW_NUM_V10			5
>> +#define RKISP1_CIF_ISP_HIST_COLUMN_NUM_V10		5
>> +
>> +/* ISP HISTOGRAM CALCULATION : CIF_ISP_HIST */
>> +#define RKISP1_CIF_ISP_HIST_CTRL_EN_SET_V12(x)		(((x) & 0x01) << 0)
>> +#define RKISP1_CIF_ISP_HIST_CTRL_EN_MASK_V12		RKISP1_CIF_ISP_HIST_CTRL_EN_SET_V12(0x01)
>> +#define RKISP1_CIF_ISP_HIST_CTRL_STEPSIZE_SET_V12(x)	(((x) & 0x7F) << 1)
>> +#define RKISP1_CIF_ISP_HIST_CTRL_MODE_SET_V12(x)	(((x) & 0x07) << 8)
>> +#define RKISP1_CIF_ISP_HIST_CTRL_MODE_MASK_V12		RKISP1_CIF_ISP_HIST_CTRL_MODE_SET_V12(0x07)
>> +#define RKISP1_CIF_ISP_HIST_CTRL_AUTOSTOP_SET_V12(x)	(((x) & 0x01) << 11)
>> +#define RKISP1_CIF_ISP_HIST_CTRL_WATERLINE_SET_V12(x)	(((x) & 0xFFF) << 12)
>> +#define RKISP1_CIF_ISP_HIST_CTRL_DATASEL_SET_V12(x)	(((x) & 0x07) << 24)
>> +#define RKISP1_CIF_ISP_HIST_CTRL_INTRSEL_SET_V12(x)	(((x) & 0x01) << 27)
>> +#define RKISP1_CIF_ISP_HIST_CTRL_WNDNUM_SET_V12(x)	(((x) & 0x03) << 28)
>> +#define RKISP1_CIF_ISP_HIST_CTRL_DBGEN_SET_V12(x)	(((x) & 0x01) << 30)
>> +#define RKISP1_CIF_ISP_HIST_ROW_NUM_V12		15
>> +#define RKISP1_CIF_ISP_HIST_COLUMN_NUM_V12		15
>> +#define RKISP1_CIF_ISP_HIST_WEIGHT_REG_SIZE_V12	\
>> +				(RKISP1_CIF_ISP_HIST_ROW_NUM_V12 * RKISP1_CIF_ISP_HIST_COLUMN_NUM_V12)
>> +
>> +#define RKISP1_CIF_ISP_HIST_WEIGHT_SET_V12(v0, v1, v2, v3)	\
>> +				(((v0) & 0x3F) | (((v1) & 0x3F) << 8) |\
>> +				(((v2) & 0x3F) << 16) |\
>> +				(((v3) & 0x3F) << 24))
>> +
>> +#define RKISP1_CIF_ISP_HIST_OFFS_SET_V12(v0, v1)	\
>> +				(((v0) & 0x1FFF) | (((v1) & 0x1FFF) << 16))
>> +#define RKISP1_CIF_ISP_HIST_SIZE_SET_V12(v0, v1)	\
>> +				(((v0) & 0x7FF) | (((v1) & 0x7FF) << 16))
>> +
>> +#define RKISP1_CIF_ISP_HIST_GET_BIN0_V12(x)	\
>> +				((x) & 0xFFFF)
>> +#define RKISP1_CIF_ISP_HIST_GET_BIN1_V12(x)	\
>> +				(((x) >> 16) & 0xFFFF)
>>   
>>   /* AUTO FOCUS MEASUREMENT:  ISP_AFM_CTRL */
>>   #define RKISP1_ISP_AFM_CTRL_ENABLE			BIT(0)
>> @@ -400,6 +461,8 @@
>>   #define RKISP1_CIF_ISP_AWB_MODE_YCBCR_EN		((0 << 31) | (0x2 << 0))
>>   #define RKISP1_CIF_ISP_AWB_MODE_MASK_NONE		0xFFFFFFFC
>>   #define RKISP1_CIF_ISP_AWB_MODE_READ(x)			((x) & 3)
>> +#define RKISP1_CIF_ISP_AWB_SET_FRAMES_V12(x)		(((x) & 0x07) << 28)
>> +#define RKISP1_CIF_ISP_AWB_SET_FRAMES_MASK_V12		RKISP1_CIF_ISP_AWB_SET_FRAMES_V12(0x07)
>>   /* ISP_AWB_GAIN_RB, ISP_AWB_GAIN_G  */
>>   #define RKISP1_CIF_ISP_AWB_GAIN_R_SET(x)		(((x) & 0x3FF) << 16)
>>   #define RKISP1_CIF_ISP_AWB_GAIN_R_READ(x)		(((x) >> 16) & 0x3FF)
>> @@ -434,6 +497,7 @@
>>   /* ISP_EXP_CTRL */
>>   #define RKISP1_CIF_ISP_EXP_ENA				BIT(0)
>>   #define RKISP1_CIF_ISP_EXP_CTRL_AUTOSTOP		BIT(1)
>> +#define RKISP1_CIF_ISP_EXP_CTRL_WNDNUM_SET_V12(x)	(((x) & 0x03) << 2)
>>   /*
>>    *'1' luminance calculation according to  Y=(R+G+B) x 0.332 (85/256)
>>    *'0' luminance calculation according to Y=16+0.25R+0.5G+0.1094B
>> @@ -441,42 +505,76 @@
>>   #define RKISP1_CIF_ISP_EXP_CTRL_MEASMODE_1		BIT(31)
>>   
>>   /* ISP_EXP_H_SIZE */
>> -#define RKISP1_CIF_ISP_EXP_H_SIZE_SET(x)		((x) & 0x7FF)
>> -#define RKISP1_CIF_ISP_EXP_HEIGHT_MASK			0x000007FF
>> +#define RKISP1_CIF_ISP_EXP_H_SIZE_SET_V10(x)		((x) & 0x7FF)
>> +#define RKISP1_CIF_ISP_EXP_HEIGHT_MASK_V10			0x000007FF
>> +#define RKISP1_CIF_ISP_EXP_H_SIZE_SET_V12(x)		((x) & 0x7FF)
>> +#define RKISP1_CIF_ISP_EXP_HEIGHT_MASK_V12		0x000007FF
>>   /* ISP_EXP_V_SIZE : vertical size must be a multiple of 2). */
>> -#define RKISP1_CIF_ISP_EXP_V_SIZE_SET(x)		((x) & 0x7FE)
>> +#define RKISP1_CIF_ISP_EXP_V_SIZE_SET_V10(x)		((x) & 0x7FE)
>> +#define RKISP1_CIF_ISP_EXP_V_SIZE_SET_V12(x)		(((x) & 0x7FE) << 16)
>>   
>>   /* ISP_EXP_H_OFFSET */
>> -#define RKISP1_CIF_ISP_EXP_H_OFFSET_SET(x)		((x) & 0x1FFF)
>> -#define RKISP1_CIF_ISP_EXP_MAX_HOFFS			2424
>> +#define RKISP1_CIF_ISP_EXP_H_OFFSET_SET_V10(x)		((x) & 0x1FFF)
>> +#define RKISP1_CIF_ISP_EXP_MAX_HOFFS_V10		2424
>> +#define RKISP1_CIF_ISP_EXP_H_OFFSET_SET_V12(x)		((x) & 0x1FFF)
>> +#define RKISP1_CIF_ISP_EXP_MAX_HOFFS_V12		0x1FFF
>>   /* ISP_EXP_V_OFFSET */
>> -#define RKISP1_CIF_ISP_EXP_V_OFFSET_SET(x)		((x) & 0x1FFF)
>> -#define RKISP1_CIF_ISP_EXP_MAX_VOFFS			1806
>> -
>> -#define RKISP1_CIF_ISP_EXP_ROW_NUM			5
>> -#define RKISP1_CIF_ISP_EXP_COLUMN_NUM			5
>> -#define RKISP1_CIF_ISP_EXP_NUM_LUMA_REGS \
>> -	(RKISP1_CIF_ISP_EXP_ROW_NUM * RKISP1_CIF_ISP_EXP_COLUMN_NUM)
>> -#define RKISP1_CIF_ISP_EXP_BLOCK_MAX_HSIZE		516
>> -#define RKISP1_CIF_ISP_EXP_BLOCK_MIN_HSIZE		35
>> -#define RKISP1_CIF_ISP_EXP_BLOCK_MAX_VSIZE		390
>> -#define RKISP1_CIF_ISP_EXP_BLOCK_MIN_VSIZE		28
>> -#define RKISP1_CIF_ISP_EXP_MAX_HSIZE	\
>> -	(RKISP1_CIF_ISP_EXP_BLOCK_MAX_HSIZE * RKISP1_CIF_ISP_EXP_COLUMN_NUM + 1)
>> -#define RKISP1_CIF_ISP_EXP_MIN_HSIZE	\
>> -	(RKISP1_CIF_ISP_EXP_BLOCK_MIN_HSIZE * RKISP1_CIF_ISP_EXP_COLUMN_NUM + 1)
>> -#define RKISP1_CIF_ISP_EXP_MAX_VSIZE	\
>> -	(RKISP1_CIF_ISP_EXP_BLOCK_MAX_VSIZE * RKISP1_CIF_ISP_EXP_ROW_NUM + 1)
>> -#define RKISP1_CIF_ISP_EXP_MIN_VSIZE	\
>> -	(RKISP1_CIF_ISP_EXP_BLOCK_MIN_VSIZE * RKISP1_CIF_ISP_EXP_ROW_NUM + 1)
>> +#define RKISP1_CIF_ISP_EXP_V_OFFSET_SET_V10(x)		((x) & 0x1FFF)
>> +#define RKISP1_CIF_ISP_EXP_MAX_VOFFS_V10		1806
>> +#define RKISP1_CIF_ISP_EXP_V_OFFSET_SET_V12(x)		(((x) & 0x1FFF) << 16)
>> +#define RKISP1_CIF_ISP_EXP_MAX_VOFFS_V12		0x1FFF
>> +
>> +#define RKISP1_CIF_ISP_EXP_ROW_NUM_V10			5
>> +#define RKISP1_CIF_ISP_EXP_COLUMN_NUM_V10			5
>> +#define RKISP1_CIF_ISP_EXP_NUM_LUMA_REGS_V10 \
>> +	(RKISP1_CIF_ISP_EXP_ROW_NUM_V10 * RKISP1_CIF_ISP_EXP_COLUMN_NUM_V10)
>> +#define RKISP1_CIF_ISP_EXP_BLOCK_MAX_HSIZE_V10		516
>> +#define RKISP1_CIF_ISP_EXP_BLOCK_MIN_HSIZE_V10		35
>> +#define RKISP1_CIF_ISP_EXP_BLOCK_MAX_VSIZE_V10		390
>> +#define RKISP1_CIF_ISP_EXP_BLOCK_MIN_VSIZE_V10		28
>> +#define RKISP1_CIF_ISP_EXP_MAX_HSIZE_V10	\
>> +	(RKISP1_CIF_ISP_EXP_BLOCK_MAX_HSIZE_V10 * RKISP1_CIF_ISP_EXP_COLUMN_NUM_V10 + 1)
>> +#define RKISP1_CIF_ISP_EXP_MIN_HSIZE_V10	\
>> +	(RKISP1_CIF_ISP_EXP_BLOCK_MIN_HSIZE_V10 * RKISP1_CIF_ISP_EXP_COLUMN_NUM_V10 + 1)
>> +#define RKISP1_CIF_ISP_EXP_MAX_VSIZE_V10	\
>> +	(RKISP1_CIF_ISP_EXP_BLOCK_MAX_VSIZE_V10 * RKISP1_CIF_ISP_EXP_ROW_NUM_V10 + 1)
>> +#define RKISP1_CIF_ISP_EXP_MIN_VSIZE_V10	\
>> +	(RKISP1_CIF_ISP_EXP_BLOCK_MIN_VSIZE_V10 * RKISP1_CIF_ISP_EXP_ROW_NUM_V10 + 1)
>> +
>> +#define RKISP1_CIF_ISP_EXP_ROW_NUM_V12			15
>> +#define RKISP1_CIF_ISP_EXP_COLUMN_NUM_V12		15
>> +#define RKISP1_CIF_ISP_EXP_NUM_LUMA_REGS_V12 \
>> +	(RKISP1_CIF_ISP_EXP_ROW_NUM_V12 * RKISP1_CIF_ISP_EXP_COLUMN_NUM_V12)
>> +
>> +#define RKISP1_CIF_ISP_EXP_BLOCK_MAX_HSIZE_V12		0x7FF
>> +#define RKISP1_CIF_ISP_EXP_BLOCK_MIN_HSIZE_V12		0xE
>> +#define RKISP1_CIF_ISP_EXP_BLOCK_MAX_VSIZE_V12		0x7FE
>> +#define RKISP1_CIF_ISP_EXP_BLOCK_MIN_VSIZE_V12		0xE
>> +#define RKISP1_CIF_ISP_EXP_MAX_HSIZE_V12	\
>> +	(RKISP1_CIF_ISP_EXP_BLOCK_MAX_HSIZE_V12 * RKISP1_CIF_ISP_EXP_COLUMN_NUM_V12 + 1)
>> +#define RKISP1_CIF_ISP_EXP_MIN_HSIZE_V12	\
>> +	(RKISP1_CIF_ISP_EXP_BLOCK_MIN_HSIZE_V12 * RKISP1_CIF_ISP_EXP_COLUMN_NUM_V12 + 1)
>> +#define RKISP1_CIF_ISP_EXP_MAX_VSIZE_V12	\
>> +	(RKISP1_CIF_ISP_EXP_BLOCK_MAX_VSIZE_V12 * RKISP1_CIF_ISP_EXP_ROW_NUM_V12 + 1)
>> +#define RKISP1_CIF_ISP_EXP_MIN_VSIZE_V12	\
>> +	(RKISP1_CIF_ISP_EXP_BLOCK_MIN_VSIZE_V12 * RKISP1_CIF_ISP_EXP_ROW_NUM_V12 + 1)
>> +
>> +#define RKISP1_CIF_ISP_EXP_GET_MEAN_xy0_V12(x)		((x) & 0xFF)
>> +#define RKISP1_CIF_ISP_EXP_GET_MEAN_xy1_V12(x)		(((x) >> 8) & 0xFF)
>> +#define RKISP1_CIF_ISP_EXP_GET_MEAN_xy2_V12(x)		(((x) >> 16) & 0xFF)
>> +#define RKISP1_CIF_ISP_EXP_GET_MEAN_xy3_V12(x)		(((x) >> 24) & 0xFF)
>>   
>>   /* LSC: ISP_LSC_CTRL */
>>   #define RKISP1_CIF_ISP_LSC_CTRL_ENA			BIT(0)
>>   #define RKISP1_CIF_ISP_LSC_SECT_SIZE_RESERVED		0xFC00FC00
>> -#define RKISP1_CIF_ISP_LSC_GRAD_RESERVED		0xF000F000
>> -#define RKISP1_CIF_ISP_LSC_SAMPLE_RESERVED		0xF000F000
>> -#define RKISP1_CIF_ISP_LSC_TABLE_DATA(v0, v1)     \
>> +#define RKISP1_CIF_ISP_LSC_GRAD_RESERVED_V10		0xF000F000
>> +#define RKISP1_CIF_ISP_LSC_SAMPLE_RESERVED_V10		0xF000F000
>> +#define RKISP1_CIF_ISP_LSC_GRAD_RESERVED_V12		0xE000E000
>> +#define RKISP1_CIF_ISP_LSC_SAMPLE_RESERVED_V12		0xE000E000
>> +#define RKISP1_CIF_ISP_LSC_TABLE_DATA_V10(v0, v1)     \
>>   	(((v0) & 0xFFF) | (((v1) & 0xFFF) << 12))
>> +#define RKISP1_CIF_ISP_LSC_TABLE_DATA_V12(v0, v1)     \
>> +	(((v0) & 0x1FFF) | (((v1) & 0x1FFF) << 13))
>>   #define RKISP1_CIF_ISP_LSC_SECT_SIZE(v0, v1)      \
>>   	(((v0) & 0xFFF) | (((v1) & 0xFFF) << 16))
>>   #define RKISP1_CIF_ISP_LSC_GRAD_SIZE(v0, v1)      \
>> @@ -549,6 +647,10 @@
>>   	(1 << 15) | (1 << 11) | (1 << 7) | (1 << 3))
>>   #define RKISP1_CIFISP_DEGAMMA_Y_RESERVED		0xFFFFF000
>>   
>> +/* GAMMA-OUT */
>> +#define RKISP1_CIF_ISP_GAMMA_VALUE_V12(x, y)	\
>> +	(((x) & 0xFFF) << 16 | ((y) & 0xFFF) << 0)
>> +
>>   /* AFM */
>>   #define RKISP1_CIF_ISP_AFM_ENA				BIT(0)
>>   #define RKISP1_CIF_ISP_AFM_THRES_RESERVED		0xFFFF0000
>> @@ -559,6 +661,11 @@
>>   #define RKISP1_CIF_ISP_AFM_WINDOW_Y_MIN			0x2
>>   #define RKISP1_CIF_ISP_AFM_WINDOW_X(x)			(((x) & 0x1FFF) << 16)
>>   #define RKISP1_CIF_ISP_AFM_WINDOW_Y(x)			((x) & 0x1FFF)
>> +#define RKISP1_CIF_ISP_AFM_SET_SHIFT_a_V12(x, y)	(((x) & 0x7) << 16 | ((y) & 0x7) << 0)
>> +#define RKISP1_CIF_ISP_AFM_SET_SHIFT_b_V12(x, y)	(((x) & 0x7) << 20 | ((y) & 0x7) << 4)
>> +#define RKISP1_CIF_ISP_AFM_SET_SHIFT_c_V12(x, y)	(((x) & 0x7) << 24 | ((y) & 0x7) << 8)
>> +#define RKISP1_CIF_ISP_AFM_GET_LUM_SHIFT_a_V12(x)	(((x) & 0x70000) >> 16)
>> +#define RKISP1_CIF_ISP_AFM_GET_AFM_SHIFT_a_V12(x)	((x) & 0x7)
>>   
>>   /* DPF */
>>   #define RKISP1_CIF_ISP_DPF_MODE_EN			BIT(0)
>> @@ -581,6 +688,7 @@
>>   #define RKISP1_CIF_CTRL_BASE			0x00000000
>>   #define RKISP1_CIF_CCL				(RKISP1_CIF_CTRL_BASE + 0x00000000)
>>   #define RKISP1_CIF_VI_ID			(RKISP1_CIF_CTRL_BASE + 0x00000008)
>> +#define RKISP1_CIF_VI_ISP_CLK_CTRL_V12		(RKISP1_CIF_CTRL_BASE + 0x0000000C)
>>   #define RKISP1_CIF_ICCL				(RKISP1_CIF_CTRL_BASE + 0x00000010)
>>   #define RKISP1_CIF_IRCL				(RKISP1_CIF_CTRL_BASE + 0x00000014)
>>   #define RKISP1_CIF_VI_DPCL			(RKISP1_CIF_CTRL_BASE + 0x00000018)
>> @@ -666,18 +774,35 @@
>>   #define RKISP1_CIF_ISP_GAMMA_B_Y14		(RKISP1_CIF_ISP_BASE + 0x000000E4)
>>   #define RKISP1_CIF_ISP_GAMMA_B_Y15		(RKISP1_CIF_ISP_BASE + 0x000000E8)
>>   #define RKISP1_CIF_ISP_GAMMA_B_Y16		(RKISP1_CIF_ISP_BASE + 0x000000EC)
>> -#define RKISP1_CIF_ISP_AWB_PROP			(RKISP1_CIF_ISP_BASE + 0x00000110)
>> -#define RKISP1_CIF_ISP_AWB_WND_H_OFFS		(RKISP1_CIF_ISP_BASE + 0x00000114)
>> -#define RKISP1_CIF_ISP_AWB_WND_V_OFFS		(RKISP1_CIF_ISP_BASE + 0x00000118)
>> -#define RKISP1_CIF_ISP_AWB_WND_H_SIZE		(RKISP1_CIF_ISP_BASE + 0x0000011C)
>> -#define RKISP1_CIF_ISP_AWB_WND_V_SIZE		(RKISP1_CIF_ISP_BASE + 0x00000120)
>> -#define RKISP1_CIF_ISP_AWB_FRAMES		(RKISP1_CIF_ISP_BASE + 0x00000124)
>> -#define RKISP1_CIF_ISP_AWB_REF			(RKISP1_CIF_ISP_BASE + 0x00000128)
>> -#define RKISP1_CIF_ISP_AWB_THRESH		(RKISP1_CIF_ISP_BASE + 0x0000012C)
>> -#define RKISP1_CIF_ISP_AWB_GAIN_G		(RKISP1_CIF_ISP_BASE + 0x00000138)
>> -#define RKISP1_CIF_ISP_AWB_GAIN_RB		(RKISP1_CIF_ISP_BASE + 0x0000013C)
>> -#define RKISP1_CIF_ISP_AWB_WHITE_CNT		(RKISP1_CIF_ISP_BASE + 0x00000140)
>> -#define RKISP1_CIF_ISP_AWB_MEAN			(RKISP1_CIF_ISP_BASE + 0x00000144)
>> +#define RKISP1_CIF_ISP_AWB_PROP_V10		(RKISP1_CIF_ISP_BASE + 0x00000110)
>> +#define RKISP1_CIF_ISP_AWB_WND_H_OFFS_V10	(RKISP1_CIF_ISP_BASE + 0x00000114)
>> +#define RKISP1_CIF_ISP_AWB_WND_V_OFFS_V10	(RKISP1_CIF_ISP_BASE + 0x00000118)
>> +#define RKISP1_CIF_ISP_AWB_WND_H_SIZE_V10	(RKISP1_CIF_ISP_BASE + 0x0000011C)
>> +#define RKISP1_CIF_ISP_AWB_WND_V_SIZE_V10	(RKISP1_CIF_ISP_BASE + 0x00000120)
>> +#define RKISP1_CIF_ISP_AWB_FRAMES_V10		(RKISP1_CIF_ISP_BASE + 0x00000124)
>> +#define RKISP1_CIF_ISP_AWB_REF_V10		(RKISP1_CIF_ISP_BASE + 0x00000128)
>> +#define RKISP1_CIF_ISP_AWB_THRESH_V10		(RKISP1_CIF_ISP_BASE + 0x0000012C)
>> +#define RKISP1_CIF_ISP_AWB_GAIN_G_V10		(RKISP1_CIF_ISP_BASE + 0x00000138)
>> +#define RKISP1_CIF_ISP_AWB_GAIN_RB_V10		(RKISP1_CIF_ISP_BASE + 0x0000013C)
>> +#define RKISP1_CIF_ISP_AWB_WHITE_CNT_V10	(RKISP1_CIF_ISP_BASE + 0x00000140)
>> +#define RKISP1_CIF_ISP_AWB_MEAN_V10		(RKISP1_CIF_ISP_BASE + 0x00000144)
>> +#define RKISP1_CIF_ISP_AWB_PROP_V12		(RKISP1_CIF_ISP_BASE + 0x00000110)
>> +#define RKISP1_CIF_ISP_AWB_SIZE_V12		(RKISP1_CIF_ISP_BASE + 0x00000114)
>> +#define RKISP1_CIF_ISP_AWB_OFFS_V12		(RKISP1_CIF_ISP_BASE + 0x00000118)
>> +#define RKISP1_CIF_ISP_AWB_REF_V12		(RKISP1_CIF_ISP_BASE + 0x0000011C)
>> +#define RKISP1_CIF_ISP_AWB_THRESH_V12		(RKISP1_CIF_ISP_BASE + 0x00000120)
>> +#define RKISP1_CIF_ISP_X_COOR12_V12		(RKISP1_CIF_ISP_BASE + 0x00000124)
>> +#define RKISP1_CIF_ISP_X_COOR34_V12		(RKISP1_CIF_ISP_BASE + 0x00000128)
>> +#define RKISP1_CIF_ISP_AWB_WHITE_CNT_V12	(RKISP1_CIF_ISP_BASE + 0x0000012C)
>> +#define RKISP1_CIF_ISP_AWB_MEAN_V12		(RKISP1_CIF_ISP_BASE + 0x00000130)
>> +#define RKISP1_CIF_ISP_DEGAIN_V12		(RKISP1_CIF_ISP_BASE + 0x00000134)
>> +#define RKISP1_CIF_ISP_AWB_GAIN_G_V12		(RKISP1_CIF_ISP_BASE + 0x00000138)
>> +#define RKISP1_CIF_ISP_AWB_GAIN_RB_V12		(RKISP1_CIF_ISP_BASE + 0x0000013C)
>> +#define RKISP1_CIF_ISP_REGION_LINE_V12		(RKISP1_CIF_ISP_BASE + 0x00000140)
>> +#define RKISP1_CIF_ISP_WP_CNT_REGION0_V12	(RKISP1_CIF_ISP_BASE + 0x00000160)
>> +#define RKISP1_CIF_ISP_WP_CNT_REGION1_V12	(RKISP1_CIF_ISP_BASE + 0x00000164)
>> +#define RKISP1_CIF_ISP_WP_CNT_REGION2_V12	(RKISP1_CIF_ISP_BASE + 0x00000168)
>> +#define RKISP1_CIF_ISP_WP_CNT_REGION3_V12	(RKISP1_CIF_ISP_BASE + 0x0000016C)
>>   #define RKISP1_CIF_ISP_CC_COEFF_0		(RKISP1_CIF_ISP_BASE + 0x00000170)
>>   #define RKISP1_CIF_ISP_CC_COEFF_1		(RKISP1_CIF_ISP_BASE + 0x00000174)
>>   #define RKISP1_CIF_ISP_CC_COEFF_2		(RKISP1_CIF_ISP_BASE + 0x00000178)
>> @@ -711,30 +836,32 @@
>>   #define RKISP1_CIF_ISP_CT_COEFF_6		(RKISP1_CIF_ISP_BASE + 0x000001E8)
>>   #define RKISP1_CIF_ISP_CT_COEFF_7		(RKISP1_CIF_ISP_BASE + 0x000001EC)
>>   #define RKISP1_CIF_ISP_CT_COEFF_8		(RKISP1_CIF_ISP_BASE + 0x000001F0)
>> -#define RKISP1_CIF_ISP_GAMMA_OUT_MODE		(RKISP1_CIF_ISP_BASE + 0x000001F4)
>> -#define RKISP1_CIF_ISP_GAMMA_OUT_Y_0		(RKISP1_CIF_ISP_BASE + 0x000001F8)
>> -#define RKISP1_CIF_ISP_GAMMA_OUT_Y_1		(RKISP1_CIF_ISP_BASE + 0x000001FC)
>> -#define RKISP1_CIF_ISP_GAMMA_OUT_Y_2		(RKISP1_CIF_ISP_BASE + 0x00000200)
>> -#define RKISP1_CIF_ISP_GAMMA_OUT_Y_3		(RKISP1_CIF_ISP_BASE + 0x00000204)
>> -#define RKISP1_CIF_ISP_GAMMA_OUT_Y_4		(RKISP1_CIF_ISP_BASE + 0x00000208)
>> -#define RKISP1_CIF_ISP_GAMMA_OUT_Y_5		(RKISP1_CIF_ISP_BASE + 0x0000020C)
>> -#define RKISP1_CIF_ISP_GAMMA_OUT_Y_6		(RKISP1_CIF_ISP_BASE + 0x00000210)
>> -#define RKISP1_CIF_ISP_GAMMA_OUT_Y_7		(RKISP1_CIF_ISP_BASE + 0x00000214)
>> -#define RKISP1_CIF_ISP_GAMMA_OUT_Y_8		(RKISP1_CIF_ISP_BASE + 0x00000218)
>> -#define RKISP1_CIF_ISP_GAMMA_OUT_Y_9		(RKISP1_CIF_ISP_BASE + 0x0000021C)
>> -#define RKISP1_CIF_ISP_GAMMA_OUT_Y_10		(RKISP1_CIF_ISP_BASE + 0x00000220)
>> -#define RKISP1_CIF_ISP_GAMMA_OUT_Y_11		(RKISP1_CIF_ISP_BASE + 0x00000224)
>> -#define RKISP1_CIF_ISP_GAMMA_OUT_Y_12		(RKISP1_CIF_ISP_BASE + 0x00000228)
>> -#define RKISP1_CIF_ISP_GAMMA_OUT_Y_13		(RKISP1_CIF_ISP_BASE + 0x0000022C)
>> -#define RKISP1_CIF_ISP_GAMMA_OUT_Y_14		(RKISP1_CIF_ISP_BASE + 0x00000230)
>> -#define RKISP1_CIF_ISP_GAMMA_OUT_Y_15		(RKISP1_CIF_ISP_BASE + 0x00000234)
>> -#define RKISP1_CIF_ISP_GAMMA_OUT_Y_16		(RKISP1_CIF_ISP_BASE + 0x00000238)
>> +#define RKISP1_CIF_ISP_GAMMA_OUT_MODE_V10	(RKISP1_CIF_ISP_BASE + 0x000001F4)
>> +#define RKISP1_CIF_ISP_GAMMA_OUT_Y_0_V10	(RKISP1_CIF_ISP_BASE + 0x000001F8)
>> +#define RKISP1_CIF_ISP_GAMMA_OUT_Y_1_V10	(RKISP1_CIF_ISP_BASE + 0x000001FC)
>> +#define RKISP1_CIF_ISP_GAMMA_OUT_Y_2_V10	(RKISP1_CIF_ISP_BASE + 0x00000200)
>> +#define RKISP1_CIF_ISP_GAMMA_OUT_Y_3_V10	(RKISP1_CIF_ISP_BASE + 0x00000204)
>> +#define RKISP1_CIF_ISP_GAMMA_OUT_Y_4_V10	(RKISP1_CIF_ISP_BASE + 0x00000208)
>> +#define RKISP1_CIF_ISP_GAMMA_OUT_Y_5_V10	(RKISP1_CIF_ISP_BASE + 0x0000020C)
>> +#define RKISP1_CIF_ISP_GAMMA_OUT_Y_6_V10	(RKISP1_CIF_ISP_BASE + 0x00000210)
>> +#define RKISP1_CIF_ISP_GAMMA_OUT_Y_7_V10	(RKISP1_CIF_ISP_BASE + 0x00000214)
>> +#define RKISP1_CIF_ISP_GAMMA_OUT_Y_8_V10	(RKISP1_CIF_ISP_BASE + 0x00000218)
>> +#define RKISP1_CIF_ISP_GAMMA_OUT_Y_9_V10	(RKISP1_CIF_ISP_BASE + 0x0000021C)
>> +#define RKISP1_CIF_ISP_GAMMA_OUT_Y_10_V10	(RKISP1_CIF_ISP_BASE + 0x00000220)
>> +#define RKISP1_CIF_ISP_GAMMA_OUT_Y_11_V10	(RKISP1_CIF_ISP_BASE + 0x00000224)
>> +#define RKISP1_CIF_ISP_GAMMA_OUT_Y_12_V10	(RKISP1_CIF_ISP_BASE + 0x00000228)
>> +#define RKISP1_CIF_ISP_GAMMA_OUT_Y_13_V10	(RKISP1_CIF_ISP_BASE + 0x0000022C)
>> +#define RKISP1_CIF_ISP_GAMMA_OUT_Y_14_V10	(RKISP1_CIF_ISP_BASE + 0x00000230)
>> +#define RKISP1_CIF_ISP_GAMMA_OUT_Y_15_V10	(RKISP1_CIF_ISP_BASE + 0x00000234)
>> +#define RKISP1_CIF_ISP_GAMMA_OUT_Y_16_V10	(RKISP1_CIF_ISP_BASE + 0x00000238)
>>   #define RKISP1_CIF_ISP_ERR			(RKISP1_CIF_ISP_BASE + 0x0000023C)
>>   #define RKISP1_CIF_ISP_ERR_CLR			(RKISP1_CIF_ISP_BASE + 0x00000240)
>>   #define RKISP1_CIF_ISP_FRAME_COUNT		(RKISP1_CIF_ISP_BASE + 0x00000244)
>>   #define RKISP1_CIF_ISP_CT_OFFSET_R		(RKISP1_CIF_ISP_BASE + 0x00000248)
>>   #define RKISP1_CIF_ISP_CT_OFFSET_G		(RKISP1_CIF_ISP_BASE + 0x0000024C)
>>   #define RKISP1_CIF_ISP_CT_OFFSET_B		(RKISP1_CIF_ISP_BASE + 0x00000250)
>> +#define RKISP1_CIF_ISP_GAMMA_OUT_MODE_V12	(RKISP1_CIF_ISP_BASE + 0x00000300)
>> +#define RKISP1_CIF_ISP_GAMMA_OUT_Y_0_V12	(RKISP1_CIF_ISP_BASE + 0x00000304)
>>   
>>   #define RKISP1_CIF_ISP_FLASH_BASE		0x00000660
>>   #define RKISP1_CIF_ISP_FLASH_CMD		(RKISP1_CIF_ISP_FLASH_BASE + 0x00000000)
>> @@ -1004,36 +1131,35 @@
>>   #define RKISP1_CIF_ISP_IS_H_SIZE_SHD		(RKISP1_CIF_ISP_IS_BASE + 0x0000002C)
>>   #define RKISP1_CIF_ISP_IS_V_SIZE_SHD		(RKISP1_CIF_ISP_IS_BASE + 0x00000030)
>>   
>> -#define RKISP1_CIF_ISP_HIST_BASE		0x00002400
>> -
>> -#define RKISP1_CIF_ISP_HIST_PROP		(RKISP1_CIF_ISP_HIST_BASE + 0x00000000)
>> -#define RKISP1_CIF_ISP_HIST_H_OFFS		(RKISP1_CIF_ISP_HIST_BASE + 0x00000004)
>> -#define RKISP1_CIF_ISP_HIST_V_OFFS		(RKISP1_CIF_ISP_HIST_BASE + 0x00000008)
>> -#define RKISP1_CIF_ISP_HIST_H_SIZE		(RKISP1_CIF_ISP_HIST_BASE + 0x0000000C)
>> -#define RKISP1_CIF_ISP_HIST_V_SIZE		(RKISP1_CIF_ISP_HIST_BASE + 0x00000010)
>> -#define RKISP1_CIF_ISP_HIST_BIN_0		(RKISP1_CIF_ISP_HIST_BASE + 0x00000014)
>> -#define RKISP1_CIF_ISP_HIST_BIN_1		(RKISP1_CIF_ISP_HIST_BASE + 0x00000018)
>> -#define RKISP1_CIF_ISP_HIST_BIN_2		(RKISP1_CIF_ISP_HIST_BASE + 0x0000001C)
>> -#define RKISP1_CIF_ISP_HIST_BIN_3		(RKISP1_CIF_ISP_HIST_BASE + 0x00000020)
>> -#define RKISP1_CIF_ISP_HIST_BIN_4		(RKISP1_CIF_ISP_HIST_BASE + 0x00000024)
>> -#define RKISP1_CIF_ISP_HIST_BIN_5		(RKISP1_CIF_ISP_HIST_BASE + 0x00000028)
>> -#define RKISP1_CIF_ISP_HIST_BIN_6		(RKISP1_CIF_ISP_HIST_BASE + 0x0000002C)
>> -#define RKISP1_CIF_ISP_HIST_BIN_7		(RKISP1_CIF_ISP_HIST_BASE + 0x00000030)
>> -#define RKISP1_CIF_ISP_HIST_BIN_8		(RKISP1_CIF_ISP_HIST_BASE + 0x00000034)
>> -#define RKISP1_CIF_ISP_HIST_BIN_9		(RKISP1_CIF_ISP_HIST_BASE + 0x00000038)
>> -#define RKISP1_CIF_ISP_HIST_BIN_10		(RKISP1_CIF_ISP_HIST_BASE + 0x0000003C)
>> -#define RKISP1_CIF_ISP_HIST_BIN_11		(RKISP1_CIF_ISP_HIST_BASE + 0x00000040)
>> -#define RKISP1_CIF_ISP_HIST_BIN_12		(RKISP1_CIF_ISP_HIST_BASE + 0x00000044)
>> -#define RKISP1_CIF_ISP_HIST_BIN_13		(RKISP1_CIF_ISP_HIST_BASE + 0x00000048)
>> -#define RKISP1_CIF_ISP_HIST_BIN_14		(RKISP1_CIF_ISP_HIST_BASE + 0x0000004C)
>> -#define RKISP1_CIF_ISP_HIST_BIN_15		(RKISP1_CIF_ISP_HIST_BASE + 0x00000050)
>> -#define RKISP1_CIF_ISP_HIST_WEIGHT_00TO30	(RKISP1_CIF_ISP_HIST_BASE + 0x00000054)
>> -#define RKISP1_CIF_ISP_HIST_WEIGHT_40TO21	(RKISP1_CIF_ISP_HIST_BASE + 0x00000058)
>> -#define RKISP1_CIF_ISP_HIST_WEIGHT_31TO12	(RKISP1_CIF_ISP_HIST_BASE + 0x0000005C)
>> -#define RKISP1_CIF_ISP_HIST_WEIGHT_22TO03	(RKISP1_CIF_ISP_HIST_BASE + 0x00000060)
>> -#define RKISP1_CIF_ISP_HIST_WEIGHT_13TO43	(RKISP1_CIF_ISP_HIST_BASE + 0x00000064)
>> -#define RKISP1_CIF_ISP_HIST_WEIGHT_04TO34	(RKISP1_CIF_ISP_HIST_BASE + 0x00000068)
>> -#define RKISP1_CIF_ISP_HIST_WEIGHT_44		(RKISP1_CIF_ISP_HIST_BASE + 0x0000006C)
>> +#define RKISP1_CIF_ISP_HIST_BASE_V10		0x00002400
>> +#define RKISP1_CIF_ISP_HIST_PROP_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000000)
>> +#define RKISP1_CIF_ISP_HIST_H_OFFS_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000004)
>> +#define RKISP1_CIF_ISP_HIST_V_OFFS_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000008)
>> +#define RKISP1_CIF_ISP_HIST_H_SIZE_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x0000000C)
>> +#define RKISP1_CIF_ISP_HIST_V_SIZE_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000010)
>> +#define RKISP1_CIF_ISP_HIST_BIN_0_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000014)
>> +#define RKISP1_CIF_ISP_HIST_BIN_1_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000018)
>> +#define RKISP1_CIF_ISP_HIST_BIN_2_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x0000001C)
>> +#define RKISP1_CIF_ISP_HIST_BIN_3_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000020)
>> +#define RKISP1_CIF_ISP_HIST_BIN_4_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000024)
>> +#define RKISP1_CIF_ISP_HIST_BIN_5_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000028)
>> +#define RKISP1_CIF_ISP_HIST_BIN_6_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x0000002C)
>> +#define RKISP1_CIF_ISP_HIST_BIN_7_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000030)
>> +#define RKISP1_CIF_ISP_HIST_BIN_8_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000034)
>> +#define RKISP1_CIF_ISP_HIST_BIN_9_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000038)
>> +#define RKISP1_CIF_ISP_HIST_BIN_10_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x0000003C)
>> +#define RKISP1_CIF_ISP_HIST_BIN_11_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000040)
>> +#define RKISP1_CIF_ISP_HIST_BIN_12_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000044)
>> +#define RKISP1_CIF_ISP_HIST_BIN_13_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000048)
>> +#define RKISP1_CIF_ISP_HIST_BIN_14_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x0000004C)
>> +#define RKISP1_CIF_ISP_HIST_BIN_15_V10		(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000050)
>> +#define RKISP1_CIF_ISP_HIST_WEIGHT_00TO30_V10	(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000054)
>> +#define RKISP1_CIF_ISP_HIST_WEIGHT_40TO21_V10	(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000058)
>> +#define RKISP1_CIF_ISP_HIST_WEIGHT_31TO12_V10	(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x0000005C)
>> +#define RKISP1_CIF_ISP_HIST_WEIGHT_22TO03_V10	(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000060)
>> +#define RKISP1_CIF_ISP_HIST_WEIGHT_13TO43_V10	(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000064)
>> +#define RKISP1_CIF_ISP_HIST_WEIGHT_04TO34_V10	(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x00000068)
>> +#define RKISP1_CIF_ISP_HIST_WEIGHT_44_V10	(RKISP1_CIF_ISP_HIST_BASE_V10 + 0x0000006C)
>>   
>>   #define RKISP1_CIF_ISP_FILT_BASE		0x00002500
>>   #define RKISP1_CIF_ISP_FILT_MODE		(RKISP1_CIF_ISP_FILT_BASE + 0x00000000)
>> @@ -1059,35 +1185,38 @@
>>   
>>   #define RKISP1_CIF_ISP_EXP_BASE			0x00002600
>>   #define RKISP1_CIF_ISP_EXP_CTRL			(RKISP1_CIF_ISP_EXP_BASE + 0x00000000)
>> -#define RKISP1_CIF_ISP_EXP_H_OFFSET		(RKISP1_CIF_ISP_EXP_BASE + 0x00000004)
>> -#define RKISP1_CIF_ISP_EXP_V_OFFSET		(RKISP1_CIF_ISP_EXP_BASE + 0x00000008)
>> -#define RKISP1_CIF_ISP_EXP_H_SIZE		(RKISP1_CIF_ISP_EXP_BASE + 0x0000000C)
>> -#define RKISP1_CIF_ISP_EXP_V_SIZE		(RKISP1_CIF_ISP_EXP_BASE + 0x00000010)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_00		(RKISP1_CIF_ISP_EXP_BASE + 0x00000014)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000018)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_20		(RKISP1_CIF_ISP_EXP_BASE + 0x0000001c)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_30		(RKISP1_CIF_ISP_EXP_BASE + 0x00000020)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_40		(RKISP1_CIF_ISP_EXP_BASE + 0x00000024)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_01		(RKISP1_CIF_ISP_EXP_BASE + 0x00000028)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_11		(RKISP1_CIF_ISP_EXP_BASE + 0x0000002c)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_21		(RKISP1_CIF_ISP_EXP_BASE + 0x00000030)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_31		(RKISP1_CIF_ISP_EXP_BASE + 0x00000034)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_41		(RKISP1_CIF_ISP_EXP_BASE + 0x00000038)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_02		(RKISP1_CIF_ISP_EXP_BASE + 0x0000003c)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_12		(RKISP1_CIF_ISP_EXP_BASE + 0x00000040)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_22		(RKISP1_CIF_ISP_EXP_BASE + 0x00000044)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_32		(RKISP1_CIF_ISP_EXP_BASE + 0x00000048)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_42		(RKISP1_CIF_ISP_EXP_BASE + 0x0000004c)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_03		(RKISP1_CIF_ISP_EXP_BASE + 0x00000050)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_13		(RKISP1_CIF_ISP_EXP_BASE + 0x00000054)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_23		(RKISP1_CIF_ISP_EXP_BASE + 0x00000058)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_33		(RKISP1_CIF_ISP_EXP_BASE + 0x0000005c)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_43		(RKISP1_CIF_ISP_EXP_BASE + 0x00000060)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_04		(RKISP1_CIF_ISP_EXP_BASE + 0x00000064)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_14		(RKISP1_CIF_ISP_EXP_BASE + 0x00000068)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_24		(RKISP1_CIF_ISP_EXP_BASE + 0x0000006c)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_34		(RKISP1_CIF_ISP_EXP_BASE + 0x00000070)
>> -#define RKISP1_CIF_ISP_EXP_MEAN_44		(RKISP1_CIF_ISP_EXP_BASE + 0x00000074)
>> +#define RKISP1_CIF_ISP_EXP_H_OFFSET_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000004)
>> +#define RKISP1_CIF_ISP_EXP_V_OFFSET_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000008)
>> +#define RKISP1_CIF_ISP_EXP_H_SIZE_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x0000000C)
>> +#define RKISP1_CIF_ISP_EXP_V_SIZE_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000010)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_00_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000014)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_10_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000018)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_20_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x0000001c)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_30_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000020)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_40_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000024)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_01_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000028)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_11_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x0000002c)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_21_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000030)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_31_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000034)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_41_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000038)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_02_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x0000003c)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_12_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000040)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_22_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000044)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_32_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000048)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_42_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x0000004c)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_03_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000050)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_13_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000054)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_23_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000058)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_33_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x0000005c)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_43_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000060)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_04_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000064)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_14_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000068)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_24_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x0000006c)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_34_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000070)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_44_V10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000074)
>> +#define RKISP1_CIF_ISP_EXP_SIZE_V12		(RKISP1_CIF_ISP_EXP_BASE + 0x00000004)
>> +#define RKISP1_CIF_ISP_EXP_OFFS_V12		(RKISP1_CIF_ISP_EXP_BASE + 0x00000008)
>> +#define RKISP1_CIF_ISP_EXP_MEAN_V12		(RKISP1_CIF_ISP_EXP_BASE + 0x0000000c)
>>   
>>   #define RKISP1_CIF_ISP_BLS_BASE			0x00002700
>>   #define RKISP1_CIF_ISP_BLS_CTRL			(RKISP1_CIF_ISP_BLS_BASE + 0x00000000)
>> @@ -1248,6 +1377,16 @@
>>   #define RKISP1_CIF_ISP_WDR_TONECURVE_YM_31_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x0000012C)
>>   #define RKISP1_CIF_ISP_WDR_TONECURVE_YM_32_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000130)
>>   
>> +#define RKISP1_CIF_ISP_HIST_BASE_V12		0x00002C00
>> +#define RKISP1_CIF_ISP_HIST_CTRL_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x00000000)
>> +#define RKISP1_CIF_ISP_HIST_SIZE_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x00000004)
>> +#define RKISP1_CIF_ISP_HIST_OFFS_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x00000008)
>> +#define RKISP1_CIF_ISP_HIST_DBG1_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x0000000C)
>> +#define RKISP1_CIF_ISP_HIST_DBG2_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x0000001C)
>> +#define RKISP1_CIF_ISP_HIST_DBG3_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x0000002C)
>> +#define RKISP1_CIF_ISP_HIST_WEIGHT_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x0000003C)
>> +#define RKISP1_CIF_ISP_HIST_BIN_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x00000120)
>> +
>>   #define RKISP1_CIF_ISP_VSM_BASE			0x00002F00
>>   #define RKISP1_CIF_ISP_VSM_MODE			(RKISP1_CIF_ISP_VSM_BASE + 0x00000000)
>>   #define RKISP1_CIF_ISP_VSM_H_OFFS		(RKISP1_CIF_ISP_VSM_BASE + 0x00000004)
>> @@ -1259,4 +1398,7 @@
>>   #define RKISP1_CIF_ISP_VSM_DELTA_H		(RKISP1_CIF_ISP_VSM_BASE + 0x0000001C)
>>   #define RKISP1_CIF_ISP_VSM_DELTA_V		(RKISP1_CIF_ISP_VSM_BASE + 0x00000020)
>>   
>> +#define RKISP1_CIF_ISP_CSI0_BASE		0x00007000
>> +#define RKISP1_CIF_ISP_CSI0_CTRL0		(RKISP1_CIF_ISP_CSI0_BASE + 0x00000000)
>> +
>>   #endif /* _RKISP1_REGS_H */
>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
>> index 7136292039f6..5ce1a2974b55 100644
>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
>> @@ -175,18 +175,18 @@ rkisp1_stats_init_vb2_queue(struct vb2_queue *q, struct rkisp1_stats *stats)
>>   	return vb2_queue_init(q);
>>   }
>>   
>> -static void rkisp1_stats_get_awb_meas(struct rkisp1_stats *stats,
>> -				      struct rkisp1_stat_buffer *pbuf)
>> +static void rkisp1_stats_get_awb_meas_v10(struct rkisp1_stats *stats,
>> +					  struct rkisp1_stat_buffer *pbuf)
>>   {
>>   	/* Protect against concurrent access from ISR? */
>>   	struct rkisp1_device *rkisp1 = stats->rkisp1;
>>   	u32 reg_val;
>>   
>>   	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_AWB;
>> -	reg_val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB_WHITE_CNT);
>> +	reg_val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB_WHITE_CNT_V10);
>>   	pbuf->params.awb.awb_mean[0].cnt =
>>   				RKISP1_CIF_ISP_AWB_GET_PIXEL_CNT(reg_val);
>> -	reg_val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB_MEAN);
>> +	reg_val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB_MEAN_V10);
>>   
>>   	pbuf->params.awb.awb_mean[0].mean_cr_or_r =
>>   				RKISP1_CIF_ISP_AWB_GET_MEAN_CR_R(reg_val);
>> @@ -196,8 +196,29 @@ static void rkisp1_stats_get_awb_meas(struct rkisp1_stats *stats,
>>   				RKISP1_CIF_ISP_AWB_GET_MEAN_Y_G(reg_val);
>>   }
>>   
>> -static void rkisp1_stats_get_aec_meas(struct rkisp1_stats *stats,
>> -				      struct rkisp1_stat_buffer *pbuf)
>> +static void rkisp1_stats_get_awb_meas_v12(struct rkisp1_stats *stats,
>> +					  struct rkisp1_stat_buffer *pbuf)
>> +{
>> +	/* Protect against concurrent access from ISR? */
>> +	struct rkisp1_device *rkisp1 = stats->rkisp1;
>> +	u32 reg_val;
>> +
>> +	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_AWB;
>> +	reg_val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB_WHITE_CNT_V12);
>> +	pbuf->params.awb.awb_mean[0].cnt =
>> +				RKISP1_CIF_ISP_AWB_GET_PIXEL_CNT(reg_val);
>> +	reg_val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB_MEAN_V12);
>> +
>> +	pbuf->params.awb.awb_mean[0].mean_cr_or_r =
>> +				RKISP1_CIF_ISP_AWB_GET_MEAN_CR_R(reg_val);
>> +	pbuf->params.awb.awb_mean[0].mean_cb_or_b =
>> +				RKISP1_CIF_ISP_AWB_GET_MEAN_CB_B(reg_val);
>> +	pbuf->params.awb.awb_mean[0].mean_y_or_g =
>> +				RKISP1_CIF_ISP_AWB_GET_MEAN_Y_G(reg_val);
>> +}
>> +
>> +static void rkisp1_stats_get_aec_meas_v10(struct rkisp1_stats *stats,
>> +					  struct rkisp1_stat_buffer *pbuf)
>>   {
>>   	struct rkisp1_device *rkisp1 = stats->rkisp1;
>>   	unsigned int i;
>> @@ -206,7 +227,31 @@ static void rkisp1_stats_get_aec_meas(struct rkisp1_stats *stats,
>>   	for (i = 0; i < stats->config->ae_mean_max; i++)
>>   		pbuf->params.ae.exp_mean[i] =
>>   			(u8)rkisp1_read(rkisp1,
>> -					RKISP1_CIF_ISP_EXP_MEAN_00 + i * 4);
>> +					RKISP1_CIF_ISP_EXP_MEAN_00_V10 + i * 4);
>> +}
>> +
>> +static void rkisp1_stats_get_aec_meas_v12(struct rkisp1_stats *stats,
>> +					  struct rkisp1_stat_buffer *pbuf)
>> +{
>> +	struct rkisp1_device *rkisp1 = stats->rkisp1;
>> +	u32 value;
>> +	int i;
>> +
>> +	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_AUTOEXP;
>> +	for (i = 0; i < stats->config->ae_mean_max / 4; i++) {
>> +		value = rkisp1_read(rkisp1, RKISP1_CIF_ISP_EXP_MEAN_V12 + i * 4);
>> +		pbuf->params.ae.exp_mean[4 * i + 0] =
>> +				RKISP1_CIF_ISP_EXP_GET_MEAN_xy0_V12(value);
>> +		pbuf->params.ae.exp_mean[4 * i + 1] =
>> +				RKISP1_CIF_ISP_EXP_GET_MEAN_xy1_V12(value);
>> +		pbuf->params.ae.exp_mean[4 * i + 2] =
>> +				RKISP1_CIF_ISP_EXP_GET_MEAN_xy2_V12(value);
>> +		pbuf->params.ae.exp_mean[4 * i + 3] =
>> +				RKISP1_CIF_ISP_EXP_GET_MEAN_xy3_V12(value);
>> +	}
>> +
>> +	value = rkisp1_read(rkisp1, RKISP1_CIF_ISP_EXP_MEAN_V12 + i * 4);
>> +	pbuf->params.ae.exp_mean[4 * i + 0] = RKISP1_CIF_ISP_EXP_GET_MEAN_xy0_V12(value);
>>   }
>>   
>>   static void rkisp1_stats_get_afc_meas(struct rkisp1_stats *stats,
>> @@ -226,8 +271,8 @@ static void rkisp1_stats_get_afc_meas(struct rkisp1_stats *stats,
>>   	af->window[2].lum = rkisp1_read(rkisp1, RKISP1_CIF_ISP_AFM_LUM_C);
>>   }
>>   
>> -static void rkisp1_stats_get_hst_meas(struct rkisp1_stats *stats,
>> -				      struct rkisp1_stat_buffer *pbuf)
>> +static void rkisp1_stats_get_hst_meas_v10(struct rkisp1_stats *stats,
>> +					  struct rkisp1_stat_buffer *pbuf)
>>   {
>>   	struct rkisp1_device *rkisp1 = stats->rkisp1;
>>   	unsigned int i;
>> @@ -236,7 +281,24 @@ static void rkisp1_stats_get_hst_meas(struct rkisp1_stats *stats,
>>   	for (i = 0; i < stats->config->hist_bin_n_max; i++)
>>   		pbuf->params.hist.hist_bins[i] =
>>   			(u8)rkisp1_read(rkisp1,
>> -					RKISP1_CIF_ISP_HIST_BIN_0 + i * 4);
>> +					RKISP1_CIF_ISP_HIST_BIN_0_V10 + i * 4);
>> +}
>> +
>> +static void rkisp1_stats_get_hst_meas_v12(struct rkisp1_stats *stats,
>> +					  struct rkisp1_stat_buffer *pbuf)
>> +{
>> +	struct rkisp1_device *rkisp1 = stats->rkisp1;
>> +	u32 value;
>> +	int i;
>> +
>> +	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
>> +	for (i = 0; i < stats->config->hist_bin_n_max / 2; i++) {
>> +		value = rkisp1_read(rkisp1, RKISP1_CIF_ISP_HIST_BIN_V12 + i * 4);
>> +		pbuf->params.hist.hist_bins[2 * i] =
>> +					RKISP1_CIF_ISP_HIST_GET_BIN0_V12(value);
>> +		pbuf->params.hist.hist_bins[2 * i + 1] =
>> +					RKISP1_CIF_ISP_HIST_GET_BIN1_V12(value);
>> +	}
>>   }
>>   
>>   static void rkisp1_stats_get_bls_meas(struct rkisp1_stats *stats,
>> @@ -286,17 +348,28 @@ static void rkisp1_stats_get_bls_meas(struct rkisp1_stats *stats,
>>   	}
>>   }
>>   
>> -static struct rkisp1_stats_ops rkisp1_stats_ops = {
>> -	.get_awb_meas = rkisp1_stats_get_awb_meas,
>> -	.get_aec_meas = rkisp1_stats_get_aec_meas,
>> -	.get_hst_meas = rkisp1_stats_get_hst_meas,
>> +static struct rkisp1_stats_ops rkisp1_v10_stats_ops = {
>> +	.get_awb_meas = rkisp1_stats_get_awb_meas_v10,
>> +	.get_aec_meas = rkisp1_stats_get_aec_meas_v10,
>> +	.get_hst_meas = rkisp1_stats_get_hst_meas_v10,
>>   };
>>   
>> -static struct rkisp1_stats_config rkisp1_stats_config = {
>> +static struct rkisp1_stats_config rkisp1_v10_stats_config = {
>>   	.ae_mean_max = 25,
>>   	.hist_bin_n_max = 16,
>>   };
>>   
>> +static struct rkisp1_stats_ops rkisp1_v12_stats_ops = {
>> +	.get_awb_meas = rkisp1_stats_get_awb_meas_v12,
>> +	.get_aec_meas = rkisp1_stats_get_aec_meas_v12,
>> +	.get_hst_meas = rkisp1_stats_get_hst_meas_v12,
>> +};
>> +
>> +static struct rkisp1_stats_config rkisp1_v12_stats_config = {
>> +	.ae_mean_max = 81,
>> +	.hist_bin_n_max = 32,
>> +};
>> +
>>   static void
>>   rkisp1_stats_send_measurement(struct rkisp1_stats *stats, u32 isp_ris)
>>   {
>> @@ -365,8 +438,13 @@ static void rkisp1_init_stats(struct rkisp1_stats *stats)
>>   	stats->vdev_fmt.fmt.meta.buffersize =
>>   		sizeof(struct rkisp1_stat_buffer);
>>   
>> -	stats->ops = &rkisp1_stats_ops;
>> -	stats->config = &rkisp1_stats_config;
>> +	if (stats->rkisp1->isp_ver == RKISP1_V12) {
>> +		stats->ops = &rkisp1_v12_stats_ops;
>> +		stats->config = &rkisp1_v12_stats_config;
>> +	} else {
>> +		stats->ops = &rkisp1_v10_stats_ops;
>> +		stats->config = &rkisp1_v10_stats_config;
>> +	}
>>   }
>>   
>>   int rkisp1_stats_register(struct rkisp1_device *rkisp1)
>>
