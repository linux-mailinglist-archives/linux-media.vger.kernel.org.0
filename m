Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88F712F2D2E
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 11:49:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbhALKsn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 05:48:43 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38828 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbhALKsm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 05:48:42 -0500
Received: from [IPv6:2003:c7:cf1c:ce00:f910:3ddf:79d3:b08e] (p200300c7cf1cce00f9103ddf79d3b08e.dip0.t-ipconnect.de [IPv6:2003:c7:cf1c:ce00:f910:3ddf:79d3:b08e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0F8E31F451D5;
        Tue, 12 Jan 2021 10:48:00 +0000 (GMT)
Subject: Re: [PATCH 1/2] media: rockchip: rkisp1: carry ip version information
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>, helen.koike@collabora.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Laurent.pinchart@ideasonboard.com
Cc:     linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
        christoph.muellner@theobroma-systems.com,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Tomasz Figa <tfiga@chromium.org>
References: <20210111234011.3642481-1-heiko@sntech.de>
 <20210111234011.3642481-2-heiko@sntech.de>
 <0154ffe7-19a4-28a9-003e-4f3af7c76274@xs4all.nl>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <81d0ce25-98a9-1785-d046-913c322d98bb@collabora.com>
Date:   Tue, 12 Jan 2021 11:47:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0154ffe7-19a4-28a9-003e-4f3af7c76274@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 12.01.21 um 09:32 schrieb Hans Verkuil:
> On 12/01/2021 00:40, Heiko Stuebner wrote:
>> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
>>
>> The IP block evolved from its rk3288/rk3399 base and the vendor
>> designates them with a numerical version. rk3399 for example
>> is designated V10 probably meaning V1.0.
>>
>> There doesn't seem to be an actual version register we could read that
>> information from, so allow the match_data to carry that information
>> for future differentiation.

There is a register RKISP1_CIF_VI_ID.
The datasheet I have says: "MARVIN revision ID"
The datasheet says that the reset value is 1085'3017H
which is also the value for the rk3399 and is described "M14_v2 id (Rel. 1.1)"

I don't how this register corresponds to the versions from
the downstream code if at all.

The register is read and kprinted in function rkisp1_config_cif
Could you report the value printed in the px30?

>>
>> Also carry that information in the hw_revision field of the media-
>> controller API, so that userspace also has access to that.
>>
>> The added versions are:
>> - V10: at least rk3288 + rk3399
>> - V11: seemingly unused as of now, but probably appeared in some soc
>> - V12: at least rk3326 + px30
>> - V13: at least rk1808
>>
>> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
>> ---
>> changes since rfc:
>> - move rkisp1_version enum into uapo
>> - show version in media-api hw_revision
>>
>>   .../platform/rockchip/rkisp1/rkisp1-common.h  |  1 +
>>   .../platform/rockchip/rkisp1/rkisp1-dev.c     | 22 +++++++++++--------
>>   include/uapi/linux/rkisp1-config.h            |  7 ++++++
>>   3 files changed, 21 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>> index 038c303a8aed..bad1bd468f2f 100644
>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>> @@ -354,6 +354,7 @@ struct rkisp1_device {
>>   	void __iomem *base_addr;
>>   	int irq;
>>   	struct device *dev;
>> +	enum rkisp1_cif_isp_version isp_ver;

I don't think we need to add this field,
seems to be enough to set the media_dev.hw_revision

Thanks,
Dafna

>>   	unsigned int clk_size;
>>   	struct clk_bulk_data clks[RKISP1_MAX_BUS_CLK];
>>   	struct v4l2_device v4l2_dev;
>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>> index 68da1eed753d..f594d7cd03d0 100644
>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>> @@ -104,6 +104,7 @@
>>   struct rkisp1_match_data {
>>   	const char * const *clks;
>>   	unsigned int size;
>> +	enum rkisp1_cif_isp_version isp_ver;
>>   };
>>   
>>   /* ----------------------------------------------------------------------------
>> @@ -411,15 +412,16 @@ static const char * const rk3399_isp_clks[] = {
>>   	"hclk",
>>   };
>>   
>> -static const struct rkisp1_match_data rk3399_isp_clk_data = {
>> +static const struct rkisp1_match_data rk3399_isp_match_data = {
>>   	.clks = rk3399_isp_clks,
>>   	.size = ARRAY_SIZE(rk3399_isp_clks),
>> +	.isp_ver = RKISP1_V10,
>>   };
>>   
>>   static const struct of_device_id rkisp1_of_match[] = {
>>   	{
>>   		.compatible = "rockchip,rk3399-cif-isp",
>> -		.data = &rk3399_isp_clk_data,
>> +		.data = &rk3399_isp_match_data,
>>   	},
>>   	{},
>>   };
>> @@ -457,15 +459,15 @@ static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>>   
>>   static int rkisp1_probe(struct platform_device *pdev)
>>   {
>> -	const struct rkisp1_match_data *clk_data;
>> +	const struct rkisp1_match_data *match_data;
>>   	struct device *dev = &pdev->dev;
>>   	struct rkisp1_device *rkisp1;
>>   	struct v4l2_device *v4l2_dev;
>>   	unsigned int i;
>>   	int ret, irq;
>>   
>> -	clk_data = of_device_get_match_data(&pdev->dev);
>> -	if (!clk_data)
>> +	match_data = of_device_get_match_data(&pdev->dev);
>> +	if (!match_data)
>>   		return -ENODEV;
>>   
>>   	rkisp1 = devm_kzalloc(dev, sizeof(*rkisp1), GFP_KERNEL);
>> @@ -494,15 +496,17 @@ static int rkisp1_probe(struct platform_device *pdev)
>>   
>>   	rkisp1->irq = irq;
>>   
>> -	for (i = 0; i < clk_data->size; i++)
>> -		rkisp1->clks[i].id = clk_data->clks[i];
>> -	ret = devm_clk_bulk_get(dev, clk_data->size, rkisp1->clks);
>> +	for (i = 0; i < match_data->size; i++)
>> +		rkisp1->clks[i].id = match_data->clks[i];
>> +	ret = devm_clk_bulk_get(dev, match_data->size, rkisp1->clks);
>>   	if (ret)
>>   		return ret;
>> -	rkisp1->clk_size = clk_data->size;
>> +	rkisp1->clk_size = match_data->size;
>> +	rkisp1->isp_ver = match_data->isp_ver;
>>   
>>   	pm_runtime_enable(&pdev->dev);
>>   
>> +	rkisp1->media_dev.hw_revision = rkisp1->isp_ver;
> 
> This must be documented in Documentation/media/admin-guide/rkisp1.rst.
> Document that this field is used by this driver and the mapping of the
> version number to SoCs.
> 
>>   	strscpy(rkisp1->media_dev.model, RKISP1_DRIVER_NAME,
>>   		sizeof(rkisp1->media_dev.model));
>>   	rkisp1->media_dev.dev = &pdev->dev;
>> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
>> index 6e449e784260..bad46aadf838 100644
>> --- a/include/uapi/linux/rkisp1-config.h
>> +++ b/include/uapi/linux/rkisp1-config.h
>> @@ -124,6 +124,13 @@
>>   #define RKISP1_CIF_ISP_STAT_AFM           (1U << 2)
>>   #define RKISP1_CIF_ISP_STAT_HIST          (1U << 3)
>>   
>> +enum rkisp1_cif_isp_version {
>> +	RKISP1_V10 = 0,
>> +	RKISP1_V11,
>> +	RKISP1_V12,
>> +	RKISP1_V13,
>> +};
>> +
>>   enum rkisp1_cif_isp_histogram_mode {
>>   	RKISP1_CIF_ISP_HISTOGRAM_MODE_DISABLE,
>>   	RKISP1_CIF_ISP_HISTOGRAM_MODE_RGB_COMBINED,
>>
> 
> Regards,
> 
> 	Hans
> 
