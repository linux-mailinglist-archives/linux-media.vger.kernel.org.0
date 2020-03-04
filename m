Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33FF117900F
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 13:08:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729267AbgCDMIp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 07:08:45 -0500
Received: from mail-bn8nam11on2073.outbound.protection.outlook.com ([40.107.236.73]:6121
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726502AbgCDMIo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Mar 2020 07:08:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnqEfJY4jtIrWs/SNXPLHrjxg7B7xwuKVlxfj9bh9L0bScfKqzt0NRVNGTdzoYn9SD7A83fNiubmpJ9RUM4+s0xibU+iSlTk4grYvxYXixfId7z+V1GodMRLK06OatVJ8K5plDWA1wYXm8oU9CTSpYxa38Vxw0gffi261+f8W1cG3xcrulXDRTNKkCcmrUXm4LBN6MoozhAYhhcXPlmmxJXP5GVVJchAgHVfsplPXrOcauibWGduU9KM1JsvH+JpeyKZr2IxPs9z0pC3v4KRnnbxShZ51rVCnmBhhlunMu7UNh2zHrdxOYVGyxpQQ5VEZ2vvwENMsCnJVYviLYwDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmS3LFDcoQSDq8ki825cRRq52/2NuR0kANSJc9h9pX4=;
 b=LGhc6Gc1NitfeW+1hKa6zFS3B83VYdb1DukT3ZDtwiGAErEJE09VyaPpR/WUxp4PKtuqAVXp3PAYM+q04QZBrPvp6asr18gmuY89yLRptdoO6eRWDZCs7jQJNWaBCWlHLwqAjcoYevTcjy7Kpbuo08d+o3fogHntlj3J7//ttzpIDfwe1TOOedJ22MdZE1Wzp/ycKhgYHyGMTT+o+FvNtdhNJQR/4ZntxN46M90JMCyeBAeICQdry6T5A14kf95TGEt/gimlD5Fw8IME7XYuqAVFWs6QwnOGgwbTmUkl560oGRIfsCEBcATMyVfec8P4NIhvHeJx7WQCy+iPUDDm3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmS3LFDcoQSDq8ki825cRRq52/2NuR0kANSJc9h9pX4=;
 b=lh38NKD8mvusLrQDvXIXbygqj9Jb2vTA/0BWzyiHmLuNi6cGLPuE+niZE8IqRjCHc5yZolqgT+gnMvTYewKrGWf5+XesWTQDkPgmGLYC/G7XONFD9WCwtdaqlDLAleMLcpMxa7uMh8hAl/fmDEZerO9PEWVAiBcFyIC38FQI5zY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB1771.namprd12.prod.outlook.com (2603:10b6:3:110::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.18; Wed, 4 Mar
 2020 12:08:39 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2772.019; Wed, 4 Mar 2020
 12:08:39 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to reservation.h renaming
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Chris Wilson <chris@chris-wilson.co.uk>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org,
        Sebastian Duda <sebastian.duda@fau.de>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200304120711.12117-1-lukas.bulwahn@gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b0296e3a-31f8-635a-f26d-8b0bc490aae3@amd.com>
Date:   Wed, 4 Mar 2020 13:08:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200304120711.12117-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM4PR05CA0032.eurprd05.prod.outlook.com (2603:10a6:205::45)
 To DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM4PR05CA0032.eurprd05.prod.outlook.com (2603:10a6:205::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15 via Frontend Transport; Wed, 4 Mar 2020 12:08:37 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a842eccf-058f-4a09-fb03-08d7c034c5fc
X-MS-TrafficTypeDiagnostic: DM5PR12MB1771:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1771F06139BCC56CDC75031983E50@DM5PR12MB1771.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0332AACBC3
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(189003)(199004)(7416002)(81166006)(4326008)(8676002)(31696002)(52116002)(5660300002)(6666004)(81156014)(86362001)(16526019)(6486002)(31686004)(316002)(36756003)(66574012)(186003)(2906002)(478600001)(6916009)(66556008)(66476007)(66946007)(8936002)(2616005)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR12MB1771;H:DM5PR12MB1705.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xgir3v2fXOwKkIq9q0GmBNGKDWZsSuV3/k3VAaKO7DPIi2nN9fvt8O3//LvsTfoGSXeRhY8stekjDJwD9o428SiMwS3G1cJft2pdJ50M8hPPZ5KIIZq/VqzvaxyJRwU0jyImhllDLynRUhh8PKbDqM/MVaaOgjBxJ1BpIQnFZ4UOQJjlAmp5kXi7KSmpotnfBaiMswCYtblQmYzkxxBpOdmsBWxTA3IbNfgwB4OpKJvU5bV8dntKYf4dfz7mIH9PKbQZz3TKuJlyfYBmJesWZE6KVb/pVXDonvMsCslRGrAFgn35ltfC+90iZsYuPWkFtYgje4dFXJ0ug/72LN2sz1U5Y1p51ei3jOyKCCTR+HyjNjn9+CZdXi58LDcbesqb3wsi+uV0amCxLymm69z/ttjAXbDquivwt1u1ZvkK09YRh75T3cDOxuNMBAEDSQsW
X-MS-Exchange-AntiSpam-MessageData: kOI8OTzche6HzadUtUnG55zxvxeC6/oqS58bQS0bRulKvzhfwqv1hQ+//8ntY7KvXdJ/7ejdomvJ6188jbqlKLoos8ujkI+xghbc5p/efdwKz6rzXva97plTrfWwYPdVnF7M2DdAygO08ZfXCbcB0HzU+zWu+q9PHm+lDSLqW8LZ44dA88jMW645+FvVRuV631VwFba3zSLmPQ3lwUJNLg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a842eccf-058f-4a09-fb03-08d7c034c5fc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2020 12:08:39.1276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3HJ1tYjmclI6ZXRLwaXElkI8ECZR1KewASuLXu57AA4g9OBv/sAoVvS5uUBHwvj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1771
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 04.03.20 um 13:07 schrieb Lukas Bulwahn:
> Commit 52791eeec1d9 ("dma-buf: rename reservation_object to dma_resv")
> renamed include/linux/reservation.h to include/linux/dma-resv.h, but
> missed the reference in the MAINTAINERS entry.
>
> Since then, ./scripts/get_maintainer.pl --self-test complains:
>
>    warning: no file matches F: include/linux/reservation.h
>
> Adjust the DMA BUFFER SHARING FRAMEWORK entry in MAINTAINERS.
>
> Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
> Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> Christian, please pick this patch.
> applies cleanly on current master and next-20200303
>
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6158a143a13e..3d6cb2789c9e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5022,7 +5022,7 @@ L:	dri-devel@lists.freedesktop.org
>   L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
>   F:	drivers/dma-buf/
>   F:	include/linux/dma-buf*
> -F:	include/linux/reservation.h
> +F:	include/linux/dma-resv.h
>   F:	include/linux/*fence.h
>   F:	Documentation/driver-api/dma-buf.rst
>   K:	dma_(buf|fence|resv)

