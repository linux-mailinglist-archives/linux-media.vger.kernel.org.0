Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60E951B9939
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2020 10:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgD0ICb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 04:02:31 -0400
Received: from mail-mw2nam10on2057.outbound.protection.outlook.com ([40.107.94.57]:6088
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726003AbgD0ICa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 04:02:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eunK4BtvvyrpfHkNqSVf/O4SKWpKltbLhwsiXYtL4r51iiZAgLcDVTKgpipReO78iOGnAkuOYlMqeTbla+RXDvrCJem7OnjJEJSdIXAzgQjdkA+WQGde3dI1oGNxTNmD/orxTDo1p6lW8v37soynYTzobpx86kCy7Hax9aTGvOYBcOx4S0OveCAd/vM/8Gwj6L6m1Ov9O04GSXZFdau3baSlcd6KL2i6cI0i3ZoTgdsIukUlZFzrq1T4xN+FFRF60VbR2EO2UgY1ODT1+SyvKBUU+alloXt5DWPpiQJ46ILkDPT4zf2FSZtUH4xx7nVSDIV3iNa6svX9Svz6+ouU9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfAuTqNdZrxCCoiSEe+Wf0k2MuD/uf7U4RsxgDeBmn8=;
 b=C377x//CPqC+SKKzCt2F5xhQXgfDEWPQ4rST38YGHcLSrfLQhuMdvfVddLyrcXMibAGGcenquhC9ZHO64ISJF9UgNJcnkNS6isviqXcctapSIKO33tqNEvG6AvJnQCMES/Rww9+FSe7WytnQwxKuRkJ/EL9n0+L/lPAzdWZgX6ytG+uDk2hgp5QuAXYnWJj+xKM/D8Zg1nnipbcqKXVZ9gfihRXbXrZ7bhvMnSoukgBdq4mtkg0xi6QTKHMHOdOF04de4rKNDt5lwgbtiW7ZFwGcCtzU86wkunogalUxX7vsF5y3a7cCn1EJ8WvDY6KU75avBT4gwUfEGjgVNndE2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfAuTqNdZrxCCoiSEe+Wf0k2MuD/uf7U4RsxgDeBmn8=;
 b=RWcxERoXtHifnUjyDKb9JsvJGWqVsC9BKSiprpr/HrtGQDZ2VHoPXy5AqpTbbGTzLXm2WzNt41bllXqR+AHbCZjKG9Rogw/Go2BN2d2c7YDM7w6tWbuINXuleVWSh+Am8/41tr3macBKlmtFjIHYI4f6bq1FDPX6Mc7L/DACfqM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4564.namprd12.prod.outlook.com (2603:10b6:5:2a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Mon, 27 Apr
 2020 08:02:28 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2937.023; Mon, 27 Apr 2020
 08:02:27 +0000
Subject: Re: [PATCH] drm/amdgpu: remove conversion to bool in amdgpu_device.c
To:     Jason Yan <yanaijie@huawei.com>, alexander.deucher@amd.com,
        David1.Zhou@amd.com, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20200427063655.21169-1-yanaijie@huawei.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <69374bbb-7e17-8b3a-8a24-591de2c55ee3@amd.com>
Date:   Mon, 27 Apr 2020 10:02:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200427063655.21169-1-yanaijie@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0126.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::31) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR01CA0126.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Mon, 27 Apr 2020 08:02:25 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0fa1a210-ff05-4229-9595-08d7ea8153dc
X-MS-TrafficTypeDiagnostic: DM6PR12MB4564:|DM6PR12MB4564:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4564B5BFA3E2B7B60FFA2BA683AF0@DM6PR12MB4564.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 0386B406AA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4401.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(81156014)(6486002)(31696002)(8676002)(8936002)(2906002)(66574012)(36756003)(86362001)(316002)(6666004)(31686004)(2616005)(186003)(5660300002)(16526019)(66476007)(52116002)(478600001)(66946007)(66556008)(921003);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 92tJyVm4S8PTKYb/DN0apie4GIbwdLtJZBfOFuybwNkurcruae3jK3ddWAsJXho0luD9T2fXRXSzScTYdh00rYpPUTYcu+LkwImTocOtof822T+tjVv0VkmNw88ni6smnglGX3uX9LYt5q4UJtlUlls+mPpmx+VVKyeZ3g0M4dLQ4UYDyDf91vtZJarRPgn3f6783HNEO8fHRi0ITIqFjpffODHNq06MgZpQ30zrb7eCzcJDrkNGGd1rPEhTrnWaBFdj4ItEfFkorgPInm7TkCwDzmNeGaUf+PnBNJpt1w8vJmxhigR8egL5apPAYsV+gozMp8Z6ALimp9g8FJq5cpFGEG4Ohjwk0cKUDqNvt7nn3XJf+pQAkjTBTxoVjrh/iDfC7JUhE1S9wYMe3yPuTRa/jpEo3Bg/DmKNyG2y3GGvUc+Ur08zxrL6FfH57FpDnA+id37GBt7F4H6Nf5avehq5zERbGd04bApMkGJDKIM=
X-MS-Exchange-AntiSpam-MessageData: bi7Zslq4G9+9LkEP45OSn6S8dXZJ1MPS/5yD7aXZkw81N5MjmC2lxOWUkztXm2AOcdjazvuffxiQeDghDrCC+HHTWhYpN42z/gWTAVcKSSdNqFmx5r6v8stul0TSmeOCD21FTN6UjKwjSrrYoj+BFVywZmLMKszmC2gRMpk6iiByl4fksF/tt8IFaOZGn3BNsg73Eby1H718qjhJ7cFl9C69Pcpfuyrs99+RnMG9bUeMU0Au3zUlBN0LqYsk+O49HSJyW9gLgnyiNgsJy2iYcFb6jQmkeKRD/ezGlOkUclNo8OlnzQjJ5rgB45EK8MHEBSYup79ORsJS/BehCH+gg7P5WkzN2Jnwd8l5dlC0nmysPgqeYl1r/RNJ0n8ljdtQDagircaCngOhF4DXSgMCtzKr9om7ZSFbZy7h3cbNNnQnaCtocOkQyMDgYOU5Y0coVf8MwKFazy26EDWYmqmD338NDDTIwLUhP2QMaQ/oUnNgc08aC3p9MLEVI5iHILSUGe2MsKS9twDzYrPBTf5zha9MGsyKJ5fYoa7GzWHHn4QsTKdiRjlc+XZKLyNLefMzYD5LVghzp6z3tVzpAw96+KjECX6bKGTbD2PmZ7pMdzQblFYAp2dZ22RdTUdAPNYjPJbyav9VCYHt5i9l7j9d8DfIASKv2PeGx8CLG17I1DfLkIosGL7RIBCJ4+bYTkTttWRhcBb0UEgssU2Hvj+dMyYpOjO7h1dVcUv9yvVxZyjA5Bvqm9aUHrwPT3tmFDTm9bkX0TlwrDfHDQYfqeHTyy2Nev0C9DVOCqt4/CvRz4iKuYcr5jh3LG0WydM4r836Zu405La145vgxxxiDRLYSsXvaPq7yR+s+RbACtp5wTM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa1a210-ff05-4229-9595-08d7ea8153dc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2020 08:02:27.8036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rODL7CwHx0iNHsKWqS9dEyCVOthl/LxvVqVq6VKOFsW4cYo9Gceo1wAXp2wbySLP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4564
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 27.04.20 um 08:36 schrieb Jason Yan:
> The '>' expression itself is bool, no need to convert it to bool again.
> This fixes the following coccicheck warning:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3004:68-73: WARNING:
> conversion to bool not needed here
>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 3d601d5dd5af..ad94de3632d8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3000,7 +3000,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   	INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
>   
>   	adev->gfx.gfx_off_req_count = 1;
> -	adev->pm.ac_power = power_supply_is_system_supplied() > 0 ? true : false;
> +	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
>   
>   	/* Registers mapping */
>   	/* TODO: block userspace mapping of io register */

