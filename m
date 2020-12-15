Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 756C82DAEB9
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 15:18:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbgLOORo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 09:17:44 -0500
Received: from mail-mw2nam12on2052.outbound.protection.outlook.com ([40.107.244.52]:39104
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728359AbgLOORo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 09:17:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hf6hC/mVqW7PAXZMIGha/mAygjtDu8JQGRYQFeAfF1q20Xk7oRdbb+4sKW+oY5DVFzBA7tyUNRecvweOjZuVGs701ZZqZPymePNwnwnE1XDwunPwXIHnQWLX2ynRBrCYPNwd6J8hbn38oD+SmW5um2K7j9lanD2dB7LD9PbCFqBQqUoSVLpVlj34RZcu+mkWXGte48px2KfDY2D4O0SSqzz6SXUdX+rOyX0mUsuAbrVZPNvEYbTH7EqYL+PlBV9hnLsyVbf9W3FQ0s26n3t7eTq2Gf6IlxGYb+q6uE5iYlXGZSMLI19R2iRbJF1wr6/8wVDTYD9UpBLHgnIbgs7Rng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8H+1TKFnoYjeUAxyS9WxXBmu2iDOIpEL1f2sBKH8Hcs=;
 b=EdQXVMeCYb9aSDeJDoD1wEi/oeE3R4fVkVdWKF9+LwWD7wU824io+AnoLWG/Nc+muCaIdujMHhoeiJQmWIItbiKASikq2J/pFNhogIsPKvqGEQFZvVwAMeVu5GZodOZNeMwb4u7AxD5Zan1zEtBbwtyOql3O4LTewaiDbYleBkGWQtod+07mtMQaCvNiRu5E8Im2ewAdm4on+C6DSGqI85EIqlKb2Wbn2nbHeUlUr0m4i/NCIOrlZnnuQcDtds8gEbiZZKtWtE+8IR/61D+M01g+XuL1VG1xseKKQ2Ng7bxdLlN7Rfxonz2OUrDj9hNx5L+5at7asdpQLsZE53NdJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8H+1TKFnoYjeUAxyS9WxXBmu2iDOIpEL1f2sBKH8Hcs=;
 b=0eQiTyvkrad5Rzm2OrfM6nFApLDCsL9jzs6U1KRO80ud0QWmz9fdYZbmDt8OU/9m0UDb4MZzDY3NnLXPr9XRSF6mM/1G5IiIG87Wcxbbzdhul5aLVOPnuDWGlHcIABfCBav0Df0jayccSd3AYKHWSrfJ6VnGdODQszojyABKcM0=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2513.namprd12.prod.outlook.com (2603:10b6:207:4a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Tue, 15 Dec
 2020 14:16:48 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 14:16:48 +0000
Subject: Re: [PATCH] dma-buf: begin/end_cpu might lock the dma_resv lock
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20201211155843.3348718-3-daniel.vetter@ffwll.ch>
 <20201214171622.3868883-1-daniel.vetter@ffwll.ch>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1bfb390c-4050-b242-34df-ba0a926c7a93@amd.com>
Date:   Tue, 15 Dec 2020 15:16:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201214171622.3868883-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0302CA0005.eurprd03.prod.outlook.com
 (2603:10a6:205:2::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM4PR0302CA0005.eurprd03.prod.outlook.com (2603:10a6:205:2::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 14:16:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a399724e-ae04-4e78-4cd7-08d8a1040f60
X-MS-TrafficTypeDiagnostic: BL0PR12MB2513:
X-Microsoft-Antispam-PRVS: <BL0PR12MB25139B7EE336588D097383B283C60@BL0PR12MB2513.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RMnQ6WEmPYVVhbj7LJO8f8o6LPNF/qZRHByIA+2OdWzI4QmnebDy/h488bltyho/JJMnhHI5uUgE2PmC66J0CLoA3RNue39NQRcykTa/7aeZCK/HdPnvqXIrmR5wR5AMd9b6r53hH9b2SHwhAznsXLgY3SjrYMTDSmkMZU4fH38ONKioJWt4uZYbe7s86/rxztZk0S66mWsgy7fKgPUCzRWrbBvRs/qhqvbvfYC3v5yxf7A9pyBaEfQNqzHVQkWBp4gvPngO7fUc9Kk6810a8wmgrGpC7F0KbiBS28OAT1bMxZeAmhhE9OSEH1uxbsNRT8lgUpNGSM9y1oP6CJ5T6kgSooCTRo1pNNiBYWCMEEo58p/LIbiApVf0h90Ss2oGI2muvjluFqVbXFQ7i2ggxgs3s9yONINa5JN0zfDUDlzOpo/xA2emQrIb+O1dY7/j
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(136003)(31696002)(83380400001)(66476007)(66574015)(508600001)(8936002)(6666004)(86362001)(66556008)(34490700003)(4326008)(52116002)(6486002)(186003)(16526019)(110136005)(66946007)(5660300002)(8676002)(2616005)(36756003)(31686004)(2906002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NVphalhRZyt6N2d5bm5NQVExaktZaVpIYXJLK0ZzNTZpVUhyQ0dzYnZsZnJR?=
 =?utf-8?B?QXdTQUNzMm1EUy84WEszZi9IeGw2bEMySmllUVdCbVhadno1M2t2YkYwM21s?=
 =?utf-8?B?NEVpYnFoZ1ppMzAvSzdad3hhN1hKZ2daYmxCd0hieEpaSjZ1ai9xRE5jMmdv?=
 =?utf-8?B?N3pMMkFheFE0L29ORzNleW96RFJGZE9ERmVkRHZYczJqeldsa2dqSlN2Ujls?=
 =?utf-8?B?WDdKS2pJcTIyc0F0Ly9MMndIQnlia3hFeC9HckR1TjJ2NCtYTm05NmN2K3p4?=
 =?utf-8?B?M0FNMmZ6MEVpR0lWT0xQSHRENE1Ydk1aUkFSVmdzWEsrK0xvaTZVeWdTTVN2?=
 =?utf-8?B?RU1HNWJ2TzJDa3FNTDVxZXJvWHJlVzhrSVI4aWdPcWFjSlduL1NCUk9Sa2Jz?=
 =?utf-8?B?ckQ2ODJwbU11UHlWSVN0cVd1d05kaGNWazYrWFpObG51VUlGVFQvNTdVL3hm?=
 =?utf-8?B?NGRUeFlON3RueWh5dEVjVzdvcFB4Wmh3S1k1bDdSNmFyaVRudy8yYVBIODN5?=
 =?utf-8?B?d09kbGZpRkhFMGRFNTlrYmFDcVVpQVplMm9FVSsrenR1eFRQOUY5L3lqcFVU?=
 =?utf-8?B?N1JWVXR3R2t0WmR2WnUwd2hZdmd3SlJ4d0x2RnVaZXRjSkMyZnl4WmdIcHRJ?=
 =?utf-8?B?akVSdW5ZYjlnRXlDL085VXk1YlRia2hXMERCZGlhOWRKeGIyemVhcXRFc0Vh?=
 =?utf-8?B?MkJlK2lBYnZBOFJCZHhNZTE3RlVEL3dTR1lGMkRsU1VSZklCdFRCQi9oWklv?=
 =?utf-8?B?SHRBc3pMckNpRXZSemVKZEZ1TFcvcTQ0enJOZDFxUmlBMUFqVVJ5bFk0S2g4?=
 =?utf-8?B?aXdJc0JOanlSZEc1VUZWVEgvNW5BdVdndE9vd3Q5bVBOMktoS0Y4MFdNZ2kz?=
 =?utf-8?B?MVp2YU03VTBzRk0wS2hxOXBEOE5sbHZCQlAxUmRBbmhpQzZubXhuaXJJakVP?=
 =?utf-8?B?OVY0WmliTUxac0tlMDB5ZDFsZjEyR1Nock1wNU5rYWRVOHoyQ1UyMmFuVlVZ?=
 =?utf-8?B?VElCS2UrVHJ1b0ptaGxKSlZiSXB0Y0NmRk5tZ0ZBdW1wN1F1WmRmRXVKQkhh?=
 =?utf-8?B?cTV6eXgwWmF6eE9QLzZGZXNScmR4dHNQbWtBZUhlc1ppc2pCYm1HSlVPT2Y2?=
 =?utf-8?B?dkI1MjNZWnJweDNoNXIzRjRESTlicURBU0RZRmxMci9lRmRhbXB1NVZmZXhJ?=
 =?utf-8?B?TWcwdlhYdUNVN0hIOFdadS9ZSUpiM2J4a21jTm1oVWFOcWVJRWdFMmxZNk9z?=
 =?utf-8?B?T2ZxVGxpRS8yQ09GWHJmNVExQkJTOExqQlFIeXFDWno1bGw2bDRVbmdzYzM2?=
 =?utf-8?B?Ylg0UlA5NjR6SmR6UTU2ZjdLZCs3d1BSNGFaSmsyQktPR0NUSlNJOFgxRGVH?=
 =?utf-8?B?L3Z4cVJVcG5vZE5yVTJIVnNnL2xYaUFoR0M1enBkdWhNSzNTRkMxSm1LLzkz?=
 =?utf-8?Q?2mirsCgB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 14:16:48.2016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: a399724e-ae04-4e78-4cd7-08d8a1040f60
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hjy2nB8xEctSWHMXsRZCreK7FM4F53ltYrLtqQzMXye2U/qc3dW0oh6iySUY0T3+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2513
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 14.12.20 um 18:16 schrieb Daniel Vetter:
> At least amdgpu and i915 do, so lets just document this as the rule.
>
> v2: Works better with less typos (intel-gfx-ci)
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/dma-buf.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index e1fa6c6f02c4..a0a02ef888da 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1118,6 +1118,8 @@ int dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>   	if (WARN_ON(!dmabuf))
>   		return -EINVAL;
>   
> +	might_lock(&dmabuf->resv->lock.base);
> +
>   	if (dmabuf->ops->begin_cpu_access)
>   		ret = dmabuf->ops->begin_cpu_access(dmabuf, direction);
>   
> @@ -1151,6 +1153,8 @@ int dma_buf_end_cpu_access(struct dma_buf *dmabuf,
>   
>   	WARN_ON(!dmabuf);
>   
> +	might_lock(&dmabuf->resv->lock.base);
> +
>   	if (dmabuf->ops->end_cpu_access)
>   		ret = dmabuf->ops->end_cpu_access(dmabuf, direction);
>   

