Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 995775E9A7E
	for <lists+linux-media@lfdr.de>; Mon, 26 Sep 2022 09:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233279AbiIZHdr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Sep 2022 03:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234059AbiIZHdq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Sep 2022 03:33:46 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F0B02228E
        for <linux-media@vger.kernel.org>; Mon, 26 Sep 2022 00:33:44 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28Q6ksf7032222;
        Mon, 26 Sep 2022 09:33:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=o+WCWXJ3wYtxfO3LMeD4n9d9ZzgtuglPGuw1G9gA0Rc=;
 b=EFW+HHT7f4CSHCtY9dqIeqLbbnhj+LOm+/Di3oBdGNDTRmkA34R53RBATc/sH7HD09Ye
 +hmIhE46OhC9RKY6Fs6hgypHDUiIWT8O+hOUJRWBGZxZnbOrBm3OYge7Eufx3F2RIPoc
 HDPVAjlNhN2Rneuglx732UplWVBUt9t1KUWZSlPVb5uwqP9gyASQPN9GCscutgHd6b9R
 nmhVdZIkUCfRmH9RZQx9Hn0OFxETmlHt19vUvcBwaZ6uYFumnRvXYAnHJVfDJTRxEp5d
 sa4/pha05b60GM9UPQimyrxB97HEg+cSveHqZez7mTNXGcfP9JudleJH9rNKbF+D3JLG YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsq1asyj8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 26 Sep 2022 09:33:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1BDDC100034;
        Mon, 26 Sep 2022 09:33:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 143AA215134;
        Mon, 26 Sep 2022 09:33:11 +0200 (CEST)
Received: from [10.201.21.143] (10.75.127.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 09:33:10 +0200
Message-ID: <0c8c3878-6d4f-e01b-f614-3cdb0c9f25ff@foss.st.com>
Date:   Mon, 26 Sep 2022 09:33:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH -next] media: stm32: dcmi: Remove redundant dev_err call
Content-Language: en-US
To:     Shang XiaoJing <shangxiaojing@huawei.com>, <mchehab@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20220923100708.17392-1-shangxiaojing@huawei.com>
From:   Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <20220923100708.17392-1-shangxiaojing@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_04,2022-09-22_02,2022-06-22_01
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shang,

Thanks for the patch:

Acked-by: Hugues Fruchet <hugues.fruchet@foss.st.com>

BR,
Hugues.

On 9/23/22 12:07, Shang XiaoJing wrote:
> devm_ioremap_resource() prints error message in itself. Remove the
> dev_err call to avoid redundant error message.
> 
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
> ---
>   drivers/media/platform/st/stm32/stm32-dcmi.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
> index 2ca95ab2b0fe..70e1b6af0448 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
> @@ -1997,10 +1997,8 @@ static int dcmi_probe(struct platform_device *pdev)
>   	}
>   
>   	dcmi->regs = devm_ioremap_resource(&pdev->dev, dcmi->res);
> -	if (IS_ERR(dcmi->regs)) {
> -		dev_err(&pdev->dev, "Could not map registers\n");
> +	if (IS_ERR(dcmi->regs))
>   		return PTR_ERR(dcmi->regs);
> -	}
>   
>   	mclk = devm_clk_get(&pdev->dev, "mclk");
>   	if (IS_ERR(mclk)) {
