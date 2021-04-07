Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6244A356DAE
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 15:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236295AbhDGNpv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 09:45:51 -0400
Received: from mail-mw2nam10on2073.outbound.protection.outlook.com ([40.107.94.73]:13281
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230142AbhDGNpu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 09:45:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lh+KkMuRLktnSZOELXGHH2ptzfoLbcXvVI07e4eOjdXDcHkbjTjOZp5S6M4SkPupz7QTDbUvQ38rr1c8YNHU6MA6zGVDsbIkYjPW6yG+1GnBXLPL1yIQaIRMOjVgUYgyVm3TiR1NNUiWIztDLApKnhRgR5INibHIujPDUPD++ambAIJftwadWnu+jn5xVN4PxQCyyvfX1P19Gw73ufqaf5QqAEcZ/cYnHLivJRMSy1+2q/X81nlzakcUNQcIY/iinYuAdm9xHj6N0grqTp7Dpcdcq5zrxnjxjxTl1uqTD6P1QVYsOrdnzWjHK1oFOxeFNXXMcPPRNsRmvf2X8BLTFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hss2GxAYzhQr2v377fSU3WwaodSWsEjnUwYHMfnRKxc=;
 b=ggW3YFomxCNDtOQD5n7XhYmbnmV7DXNHXK+qkGO2HUK9KX4MQT3nM5i334HaRpfAo3jZl7uZSapWp/4jIRbE/pUgcf533mLNOnJE1QvYcOrcuDVkRMMPZwZMIL5OtOqQ/7YkZdxYCIIRr4hZnjIQy0FkE8tG9Q2O5ES6QTE9Vtqk4t+QnlJaIckZjktwiQg33jHbHsbSUdzmveJt9637is1tDwQBkkWS80Leb7bkxTGGaWrVx8c0y0Fcgk3QALknBr9Oi9Ui7ZHhtJfCjaUQoF1dp9sGnBCjF/hI/wNdkYxHGCrthG/p18eJaG2gv7tb9k7JCAi4iqV4HFrRQaZv/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hss2GxAYzhQr2v377fSU3WwaodSWsEjnUwYHMfnRKxc=;
 b=UEq4550HxWeWIHNZHjKDNFKtMwEbg5TCiUgQOSpU09iSkSrP09KaQ1QE2Em739yDGHuGE7jphDc+5A3Fc3M7egJYpDJkPJSF3ytf5n8/Wcexud7XjkrI6/i1jYTR6xvs32wCrxvGHYEEQe4tD8AmYC4SVRg3YUcX4XHD/2ufKmVtlLzn0y4ef4zjGVICTQ2AQRtNiaoMKLuMJ2l+73w4A7x0ayQz8U1B9WqmDvgVCR/naLP19AY0X8y+xvY4HroIQJlMLTJ8wbE0Ng36qr/pr25xXJCJLMJNfRHp2h1KuRMHfQ+Fm749mgQ39dkyT9DiJWlXBd4wg7JIkx5XQkxtwQ==
Received: from DM3PR03CA0017.namprd03.prod.outlook.com (2603:10b6:0:50::27) by
 PH0PR12MB5466.namprd12.prod.outlook.com (2603:10b6:510:d7::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.16; Wed, 7 Apr 2021 13:45:40 +0000
Received: from DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:50:cafe::8f) by DM3PR03CA0017.outlook.office365.com
 (2603:10b6:0:50::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Wed, 7 Apr 2021 13:45:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT019.mail.protection.outlook.com (10.13.172.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 13:45:39 +0000
Received: from [10.21.26.179] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Apr
 2021 13:45:37 +0000
Subject: Re: [PATCH] media: Fix compilation error
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Bixuan Cui <cuibixuan@huawei.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <skomatineni@nvidia.com>, <mchehab@kernel.org>,
        <treding@nvidia.com>, <john.wanghui@huawei.com>
References: <20210402074017.49009-1-cuibixuan@huawei.com>
 <c5b9fc40-0d52-4a31-2e73-14ec07434af4@xs4all.nl>
From:   Mikko Perttunen <mperttunen@nvidia.com>
Message-ID: <78d1052a-9f9a-315b-0bba-4628a6fb3ddb@nvidia.com>
Date:   Wed, 7 Apr 2021 16:45:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c5b9fc40-0d52-4a31-2e73-14ec07434af4@xs4all.nl>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 977937d1-334c-4b0c-05f6-08d8f9cb6e82
X-MS-TrafficTypeDiagnostic: PH0PR12MB5466:
X-Microsoft-Antispam-PRVS: <PH0PR12MB5466FB75652A37BEC39FE8ACB2759@PH0PR12MB5466.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xMqovzYcduPDj35sRKrH2fYZnz+2FE2+DoWaPLINuaB8sTmo0WMsMoaGRnkVzAyKGp/O1t5UvFdTp9HK7VBLIqyTgD7yvIJXR10G0lcc4O6yp9Vula00v/El1XQohjVV3bkockBNtT8sj6/Q9q8ipHSl42zm2qeEAe08ny2YawXOKnPzv2uEbnBUFOC/ntPfEGnrLZ+pt2n6BlKYQoUKHJB8K1qYXpCAl2eiZVh1Ifjae9aa2SBPSk1+xK+PsqC1yM6D5tZGyi4gQ1dQhOBuWQpcw4h0XJGFQbjdy66GdNk+FAh2iMB3TSrLITGdOJA8WDiCwXGdKJr1ibiJKWjSCOnqUy03WR2PcCJ9QypXTFR225XrqgYOsFa2vzNs7P/mAJxSPuPYcL78fXWOHXgkiJndTEOpPOCfJoC48KxsrbFYMqC5HHHyRdY9Bz2U2ywC04CPiu7QwtBfX4zKgr5M5ezUHaeUbYvTE6jFGiVQxLVRk4fY4mEZRlAvIqYvHWxvxG9YQBQkOTTGhGYAHSE5YwbPMN5Oyr2MgXBMSqOeCGuFEhZ+E0m/gTXI3KXbMIUubFlp2BzYXKlbPx1MlgeWCumQztn/GqLoOtj+99ACcxYFJ/yKwU+ZiaFftDaPoPfebImSEe8Bi/vr7jWBwUnPdqw3wS+gMKOEJYHvk7iWOhw+TbA0sD72yaRs0BcccOfmEZNyxdQGBQuI7jODDSzmIg==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(36840700001)(46966006)(53546011)(16576012)(8676002)(83380400001)(70206006)(16526019)(7636003)(356005)(6666004)(70586007)(110136005)(54906003)(36860700001)(31686004)(478600001)(31696002)(316002)(47076005)(5660300002)(36906005)(8936002)(86362001)(4326008)(82310400003)(426003)(336012)(2906002)(186003)(36756003)(26005)(82740400003)(2616005)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 13:45:39.9528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 977937d1-334c-4b0c-05f6-08d8f9cb6e82
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5466
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7.4.2021 16.29, Hans Verkuil wrote:
> On 02/04/2021 09:40, Bixuan Cui wrote:
>> Fix the error:
>>
>> drivers/staging/media/tegra-video/vi.c:1180:4:
>> error: implicit declaration of function 'host1x_syncpt_free' [-Werror,-Wimplicit-function-declaration]
> 
> Against what tree is this being built? The mainline kernel doesn't have
> host1x_syncpt_put, only host1x_syncpt_free.

This change was done only very recently, it's in linux-next and 
submitted for 5.13. I missed this one host1x_syncpt_free call in vi.c, 
but Thierry has already applied an equivalent patch on his end so the 
issue should be resolved.

Thanks,
Mikko

> 
> Also, the subject line is very vague, something like this is much more descriptive:
> 
> [PATCH] media: tegra-video: replace host1x_syncpt_free by host1x_syncpt_put
> 
> Regards,
> 
> 	Hans
> 
>>
>> Fixes: 3028a00c55bf ('gpu: host1x: Cleanup and refcounting for syncpoints')
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
>> ---
>>   drivers/staging/media/tegra-video/vi.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
>> index 7e0cb5529b49..df5ca3596470 100644
>> --- a/drivers/staging/media/tegra-video/vi.c
>> +++ b/drivers/staging/media/tegra-video/vi.c
>> @@ -1177,7 +1177,7 @@ static int tegra_channel_host1x_syncpt_init(struct tegra_vi_channel *chan)
>>   		mw_sp = host1x_syncpt_request(&vi->client, flags);
>>   		if (!mw_sp) {
>>   			dev_err(vi->dev, "failed to request memory ack syncpoint\n");
>> -			host1x_syncpt_free(fs_sp);
>> +			host1x_syncpt_put(fs_sp);
>>   			ret = -ENOMEM;
>>   			goto free_syncpts;
>>   		}
>>
> 
