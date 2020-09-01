Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE66F258F48
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 15:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728273AbgIANij (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Sep 2020 09:38:39 -0400
Received: from mail-bn8nam11on2086.outbound.protection.outlook.com ([40.107.236.86]:56321
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728244AbgIANhp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Sep 2020 09:37:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMezK79wB7tpzd59BENeXb9r7Th4tWveE5WDhrCWkLobhhPuodsS6k1kgjRX6ljRghKZWJfCkJPJTPYVGsXIeN3fGfg26J8nzmB5uqcUv0Wth/K8tACpyLRllkajKhGFSGFbtQ2Ys9C2S49jipRGMXqWtUivJeJ2/ShaK2bJ1hZ/4wKwst7WhQmh5kk2xFqZPNldofGYp82bVPQQwWdLxlYQp5jeFaZnOblooeAvbkIKVRt4QqZQootFVMwNPD46clQCsyAYqxO8e4gMOUGxZkYPu0GHLrphP1b6vJKjjXt8hgOIeNsgtUCRSjsRjR2r3AzRCMAAHSeEw0Yrkg6WfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KagnyXdQMN2/Anw0GBWefhKxJdGB26CAdN+TKRRuGg=;
 b=OWurUi7Ss1To0CpWCvsUs2+5EnfafdfRGSuacsWyQNmHUgbB0h0Sk6KFy/x43KHKsszs2anxpEtYgAWzIWgDukS2XXkQV4UOxgaXYICFGs7kYKOq8LCvw83Y4M0OnXuBmdzjo1lU9axYKoL5uDADrBKqgxxiY0W/wGC+vMEveKsGnX0zAWTi2aiuLrlOm00YaHWDF7Z6mp8RN9nnmn3C1ZX+kR1joKERRW9oIgku3B02baukcoN7IGz2DRtkPtGNUDEk+Hm43L4P640WuX2TwB129Ii1dMoqEvU0LgNvl8egi1S0yYhIs3hTsuKP8vPzdKFvDF3nHbBRBPx14ysKyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KagnyXdQMN2/Anw0GBWefhKxJdGB26CAdN+TKRRuGg=;
 b=LmfBjQaCUt0a3BBWv1RmMT1xUuae/TxyZI+u6pnjFgltzouHS6Kz9AjHrSLb5ju8c8/AWVjWrFuV3hmcwOqz3qKjpk001MTlgN7wTRjHfJ6D2EWuvNLRYd/RHluaFOCjsOoG8hI722LHCv1DX3mVgteU8DEEshIyVE1zS1rykjc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.22; Tue, 1 Sep
 2020 13:37:42 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 13:37:42 +0000
Subject: Re: [PATCH] dma-buf: fix kernel-doc warning in dma-fence.c
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        Gustavo Padovan <gustavo@padovan.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20200831041713.12571-1-rdunlap@infradead.org>
 <81dc0a34-90f6-401a-f846-924fdff4aaff@amd.com>
 <20200901133200.GE2352366@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d057988a-7ba4-7e3b-1c36-e40e9a5a8d9a@amd.com>
Date:   Tue, 1 Sep 2020 15:37:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200901133200.GE2352366@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM4PR07CA0011.eurprd07.prod.outlook.com
 (2603:10a6:205:1::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by AM4PR07CA0011.eurprd07.prod.outlook.com (2603:10a6:205:1::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.5 via Frontend Transport; Tue, 1 Sep 2020 13:37:38 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b1ec1d14-a131-4294-6133-08d84e7c3224
X-MS-TrafficTypeDiagnostic: MN2PR12MB4047:
X-Microsoft-Antispam-PRVS: <MN2PR12MB40470675FBE366BE32188FA0832E0@MN2PR12MB4047.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kTHMrM49Z867gCEjuDGoBrrZcboDoj30UMKuJwpElh0gK/QS9pRaTgKSyQKbTXHXM1urV1XisCflTOvsB3p7GvR3mfX8r8V8QHxZezCgqEXnQJ2VQGCbGhDKLMFJ49/c3t6fUwHsAoeVfTdwMZ6QYuYHJquNpdxRJrbb5OMN2k3IdqB35PIEhADmL/f67nEwvlEjWGQRO9yIIPYiOykkGNaNpSnbjVCr9iUVQZAkB3AvniLXEClj6xbBGVub7TgpYfj67a7twYvYx/5G4+FDSteYV0IMGz07JoFh81QNU9g+SPghDkhA6HidAtoV6JtkcpvAKkjCehk+MAC0T8eotTrFoSGtze5M1wKjzz9ofYnNv4qRjk8Nk7RAO9lkxU2GswjwM+5WaZDiF8fOhQ9RMTCHagGxo67hA/3bkrUr08I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(86362001)(31696002)(2616005)(966005)(956004)(478600001)(6486002)(36756003)(6666004)(316002)(110136005)(66574015)(16576012)(83380400001)(8676002)(66946007)(186003)(52116002)(2906002)(66476007)(45080400002)(5660300002)(31686004)(8936002)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: mZRydIosolN29KQyRHWZbwGw3z7WvTVuuk/GxRDYI+U6A4bU/OHt5mJLr8jK1nQC6pvD/A5yxBr00l2pxsc9DI+adQvyTE1Iw7ZmIX2viYHrLQriutYwpFbfRlVCxRLCdmguGZ49VZ/dTIGcDGLM4TjdG6bVsWdLzyCnAh8LxzesX1p/Q4RYFgSRN5dmqiGENcOzzNMKC0rugwi1w4GU2cEo5Sxu6L7IRa52HdvhOFf/UTcZ4Jil+VzmiCVBxVGxPyjgIG0jCXoocZoSdrrrTnHJwZZp0NzTTrdKYF5ixiIMvm6/zT4+JdlqAOsI5IDJjQXJouv9iRnc7/rRa/doFs92w24rwGRF252I/sQLLt75bUx984OfgjjcHtZcIvxMpE3502PGmnhbaoe5dbfsbJruJrtJc3sOFCy9pmCk5/HbhZdxnkU0T6f7L7m81iG+x+alghW1ixB9HBPZ896Acql/NMhkVeyjWUsCQYNvN81rdnbeZ79RoU08A3ImTcVjDBa/ft0p4idSG+upHOBQE02sKzm654zvDyeNc1szUMFt68Vilvo5iGoSZwqebF7r0/KAH1JB87zF0hAGi3DBPC58iaTLGB/fP4OHO9gSqNvJGBveqoXBYlAOM3JZXnE5qfsVCxgmi2gJ0DOkKWXiqTb9xByCip2lQdkiAm4so5Z8bvl6JAfRoIIl91kCzzL3l++1peXCYykpTqqlBmnP0g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ec1d14-a131-4294-6133-08d84e7c3224
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 13:37:42.5924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QR7xaG1AUouuRPXLADhPWS+qImtfoTVNYo5PJUKzIEbwsEwjvc9Frm7kJjXnF6P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 01.09.20 um 15:32 schrieb Daniel Vetter:
> On Mon, Aug 31, 2020 at 12:02:03PM +0200, Christian König wrote:
>> Am 31.08.20 um 06:17 schrieb Randy Dunlap:
>>> Add @cookie to dma_fence_end_signalling() to prevent kernel-doc
>>> warning in drivers/dma-buf/dma-fence.c:
>>>
>>> ../drivers/dma-buf/dma-fence.c:291: warning: Function parameter or member 'cookie' not described in 'dma_fence_end_signalling'
>>>
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: Gustavo Padovan <gustavo@padovan.org>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: linux-media@vger.kernel.org
>>> Cc: dri-devel@lists.freedesktop.org
>> Acked-by: Christian König <christian.koenig@amd.com>
> Will you merge these two to drm-misc-fixes or should someone else?

I was wondering the same thing and just waiting for Randy to reply with 
please pick them up or I'm going to push them because I have commit access.

Regards,
Christian.

>
> Always a bit confusing when maintainers reply with acks/r-b but not what
> they'll do with the patch :-)
>
> Cheers, Daniel
>
>>> ---
>>>    drivers/dma-buf/dma-fence.c |    1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> --- lnx-59-rc3.orig/drivers/dma-buf/dma-fence.c
>>> +++ lnx-59-rc3/drivers/dma-buf/dma-fence.c
>>> @@ -283,6 +283,7 @@ EXPORT_SYMBOL(dma_fence_begin_signalling
>>>    /**
>>>     * dma_fence_end_signalling - end a critical DMA fence signalling section
>>> + * @cookie: opaque cookie from dma_fence_begin_signalling()
>>>     *
>>>     * Closes a critical section annotation opened by dma_fence_begin_signalling().
>>>     */
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C4d8d43fbbb06475f964308d84e7b6a05%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637345639254630346&amp;sdata=hxraBxca4oxH%2BsvRJaDT44kFp%2BAXlun2GaLYY6L6LdA%3D&amp;reserved=0

