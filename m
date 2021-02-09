Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE3A314F96
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 13:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbhBIM6c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 07:58:32 -0500
Received: from mail-bn7nam10on2048.outbound.protection.outlook.com ([40.107.92.48]:23840
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230326AbhBIM6U (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Feb 2021 07:58:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6DTXgoKLIMdwD/Duuqz/pU45bUQpzPN30F0I0KwhnaliMFIpA9phkp64JUIoa6+GJk36W8TFWcGYzsxNb/R0IRpQg6Rn/+TGqIkcYHObjw1ntT+/rw9e7Xm46del7j4sgWIrz2ahIRlHnYnFU67w8w7nKKWJzUYjyn41mgS/Me9QyXLusp6ygl0DH7DluBITWfUvBOsTQmdK58fi+lDurjy9HtLmJlmhjtOPNhpK/G2u8exH+Zy54voRQAmkzu47CRnQBuRvKj0bww71zgfVNOPI1Isf9VwRRQRgXWPBrfHcFh9vzrMZ/OuSWce2TiJ9AFs+gDEiWUIwNj8ifcnhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7TVz2SNlNGDsXPz9H7DHI+Ho9841dvFoCFeN6meTB4=;
 b=EwEreemipiOZmTaQwDucoICYLkS2rrgEp9WF8l0LAfHlI9xkb1ilLXEInhb/40V0Bhp/9OuwD3aCQ7qdFULPgAuF9XVBnzExlVqnHafYN6042rZlS2+JJteddP2Omx/n649uvNYFmcOtw9yvM8BxzZRqdeNRqmrJqBXIuzd6AFd/ZCdZ9U3KrMHrBWZJI6424MEHlu/qdbojKtHQGC4cQRneiHEtsyJ3zTOCW/2LD8cO2BGI9+/BK6jtNDfwt6BDI0m12yAp+3VeNb5NZ8NKq9/hjJYSI9JOHyJKnAi0y1NJJUje8IPV9bo78q/OyBthZT7MTTEF8t0OyGAbhS2IJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7TVz2SNlNGDsXPz9H7DHI+Ho9841dvFoCFeN6meTB4=;
 b=XYUawUjxRiRVNHkM2K4/Ftfaaa6oePlD9+45PCWdEURZYIJrSHeYA72wW1d0GP+BN8Ud1NE7tGn1W36AyRpP8PHxDq1vaboLuTshsX++eyfoTh7olX2ZV3eJo2rEAiwcupnlEOAdvLr/V+zlnGaxO/fO1e4o0ohQOJlnFqm9cyQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4898.namprd12.prod.outlook.com (2603:10b6:208:1c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Tue, 9 Feb
 2021 12:57:26 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 12:57:25 +0000
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool
 implementation
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?UTF-8?Q?=c3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org>
 <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
 <48225879-2fe1-22ac-daae-c61d52465aea@amd.com>
Message-ID: <a9dd7f8a-ef30-9eb4-4834-37801d43b96f@amd.com>
Date:   Tue, 9 Feb 2021 13:57:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <48225879-2fe1-22ac-daae-c61d52465aea@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:444c:9a67:948b:2493]
X-ClientProxiedBy: FRYP281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::13)
 To MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:444c:9a67:948b:2493] (2a02:908:1252:fb60:444c:9a67:948b:2493) by FRYP281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend Transport; Tue, 9 Feb 2021 12:57:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0fbb95b4-7204-49f8-6ee2-08d8ccfa3fbf
X-MS-TrafficTypeDiagnostic: BL0PR12MB4898:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4898C6941A4848940CB73C7B838E9@BL0PR12MB4898.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LMMJ7ztuRF8F94pR7JKRERabxD1JUARFY2EUHavOU3WtpqV6uxwS9S9/49mOkMkK+F08IWKnlckOjnfzfd04LVKYLGYXRqvKSIJ02furmSSqXgER9nOdr2/5u5GK4uUeaN9eQawwIZPxyGW8cXxe2VFKEYLcYdVXYTPdiEPsDUt+4MXYLVCyKIjOL72T46slbVVVVmeQSU+WtPNtmEwEvp+WJMKcTjdfyP+yJEWwfk2wg9W0mAgrYgsu9LuXu6vObgoLc4SjhyTLnY8S/HmVg7+eWkInM7zy42Y3ohjv1Wcuzq6WJAcP0N0KNRdB6jrTU0WNgYddkKTerS62XSK9PlzyNypUwML1FsDgs0q/FCznN2k6UDeBNqKBy8HNDgyiWTcTzDtVPm9x47d9EksRgEV5zYGa64vMtZ4ci5DC5HZwb2wlglJwcbklc3ropnereaj0+7j5EoJBvsIeFtTwp7DKqahjtumtB5C8bdnwcp42DlaIf41MC3jPNhkzkjTJ3mCkYVOiwqscNNK1SN/AM5y0xzOzh4TwbXgk9uvBEcgWEbBmzl2iOMJk4C557pgnw7HlGan4UPZCDi+9BUH7xYKhxakjrDAPW/rBKb142ogFB3ZE7gQsoNgPH5DtvmB7jYGNiOztzhyBCCWqoLJRI82Ms0d1/pr350MMWcaiGsHkmgREht4rvSSlCCRVjknd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(136003)(376002)(396003)(45080400002)(16526019)(478600001)(966005)(5660300002)(66556008)(4326008)(8676002)(2616005)(186003)(2906002)(8936002)(6666004)(6916009)(36756003)(66574015)(31686004)(86362001)(52116002)(316002)(31696002)(54906003)(7416002)(6486002)(66946007)(83380400001)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MDNBT1Z1Q3o5T091YktTRlViajlzeHV1WFRUZWZHSDlIdzVpT0VrbFZQRG1U?=
 =?utf-8?B?eFFTUUNRWUJTNEp3NEZ4TVU3bHFpRUsrRXk3djh6L09heEJEUnJiMmdWUExZ?=
 =?utf-8?B?YTcrY3VKSE9MbE9sNkVVa3F6L0U1N2F4bW5SdmpDcVNUNldFQVkzN01qbkpE?=
 =?utf-8?B?TE9NaHd6a1NsUXJtUXNGekR5bktsY2xVOSsrQXlDbWVPR1VaekhldktGb05R?=
 =?utf-8?B?UHc3czVJL1ZWN3NOelA4MHh2OUxkbjNzaVlVZ2hGVzF6OWRWZE52bkZabEQz?=
 =?utf-8?B?STFGZk9sTGFuQXdUNEZHT0JHZFdrcitCYnloQVFsdFYya1RWMzZnY3Nmc3JZ?=
 =?utf-8?B?NFc1L2xwSjNXdGJ6UTU0djZzMnc5Q2ZKbll6RjRwejc5WGlQdDJYUWxtS2hK?=
 =?utf-8?B?Zk9NQ3lweU9TYUFsR2VzN2JvUG84UmpyL2NyR1VPckNJNFl4dkZsV1Q2MUNv?=
 =?utf-8?B?RmtIaW8weG1Fc2o2Z09iekpqVSt1Rm4rT0dZaG9DVkVob2FoU1ptOTE2b09w?=
 =?utf-8?B?RXdrQkJmN21MRjI0WCtWU2ZZaEEvbTlGYjNmMUdWNnZ2dHE3dlZsVUdIa2VG?=
 =?utf-8?B?aWlJcEtnWlhCZW5BcmJsa3VOMG85dEVVN1BOdFZLdHlaZC8rS3R5UFJnUFdU?=
 =?utf-8?B?KzE5ZU9JVlN4SWFQaFRBaWoxbUIwOGd4c09CL1dYcktyRHc3a3JMUXl2RElj?=
 =?utf-8?B?NjllMGNTYWJWUk5RVVk0NUxxTkNGUm54ZTVUUCtERVhNUml1TGsxaXlacDA2?=
 =?utf-8?B?MFcvaGxKVU1xQ0F1bm9yZnFEZlQ3MGhyLzhjWDFFUko2MVJWYkl3SlhJcWV2?=
 =?utf-8?B?TXltTnZuVWxwQk91Q0U0TTB0U21GOHFWempqMjJkMWwwVmx1enRobDhLcEl2?=
 =?utf-8?B?cjdkQkN2K3BxTFh0VXZRd0FBVlNoK0h2cjA2bnNreVZiVzZNUG4zSW5Fc3Bm?=
 =?utf-8?B?VncwcitMS05aU3o2ajNtcmd6ZzhYZDVzQTFSbDQ4KzFqcEVpNm9KbXRHYWNH?=
 =?utf-8?B?aFVpQ3V0RmJJNk1iSXd0em1QMmp1WUdQeDFyY3FucVBkR0wxR2ZiWGdMZmFs?=
 =?utf-8?B?SmE0eHB2a0VzYkJ4eExTdnptamY3YTA0ZVBRUXdOTlBxRGdPRDVLT0FDZVVU?=
 =?utf-8?B?YWtoNW03T0lINmVCR2lqUHZVYWxRd0VsUGl3Mm1ObFY5c2tqVjYzVCtQV25E?=
 =?utf-8?B?UmRZUEVDSzc0TGZKM281K01pTW5RVmFac29xTGoxQlpZSStWQjJ1VXVkNUpm?=
 =?utf-8?B?dXFBanJ3TTUwaGYxOFliUnU3aUdycEFjZ3hGTFAzZmVhQWo2OXVIWGNaZCtR?=
 =?utf-8?B?MUpnSVVaRk5NaUpoZmk2WDU4QnBVTTVLWFEyK1ovVVNCQitBYjE5TEVQNTgw?=
 =?utf-8?B?UTBGamIwWGxBck5idExDU1VzN0gwWFVUSElmOGRGcWlNTGIrbWVaVG84SXhC?=
 =?utf-8?B?cmlROURRUE5qcE1namtpR3ZyaXpiaGZ6QjhDMXBuaUQwWEJuQkt4cWErMDFP?=
 =?utf-8?B?WkpFcENtVXBINGdmdWpFTFV1NHgvRVJhNHJCQklKK1hZY0FOTlo4SzRCY3J0?=
 =?utf-8?B?b1lWWko2SloyRFpuY1dmSW8yZUR0dUg0VzdLZ1RzV2ZjbXk0Zmk4cHprUXcr?=
 =?utf-8?B?d2xQWnM2Y0tqK1MzQmRzS1lLYXZ6UnBieHhCZktFdHpBMUkrdkRmVWY2OEtp?=
 =?utf-8?B?S2UrV3VBOWFOOUhWbEtFbDhuOWw3SlZ4WjV0WGswNlZZLzRRRXFrc0RTLzll?=
 =?utf-8?B?K0EyUkVLMGxPYzR2aFozeHVCQVM5RFFxZDBnU0lnNUxzRStqTllwY0U4UHMw?=
 =?utf-8?B?TEFJWmtpU1ZmeXI5YVdkTjZDNTdtQWs3ME8vTC82TzN6Z3IrekRuOWtNbEY1?=
 =?utf-8?Q?1Zc+DZ81O+sET?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fbb95b4-7204-49f8-6ee2-08d8ccfa3fbf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 12:57:25.8274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fA9wfk84+w3lioFao64Dln+tqAnPqHKwckjWWjm7IidocvqU6Ml1dMh8XuLV5zJ4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4898
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 09.02.21 um 13:11 schrieb Christian König:
> [SNIP]
>>>> +void drm_page_pool_add(struct drm_page_pool *pool, struct page *page)
>>>> +{
>>>> +     spin_lock(&pool->lock);
>>>> +     list_add_tail(&page->lru, &pool->items);
>>>> +     pool->count++;
>>>> +     atomic_long_add(1 << pool->order, &total_pages);
>>>> +     spin_unlock(&pool->lock);
>>>> +
>>>> +     mod_node_page_state(page_pgdat(page), 
>>>> NR_KERNEL_MISC_RECLAIMABLE,
>>>> +                         1 << pool->order);
>>> Hui what? What should that be good for?
>> This is a carryover from the ION page pool implementation:
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ftree%2Fdrivers%2Fstaging%2Fandroid%2Fion%2Fion_page_pool.c%3Fh%3Dv5.10%23n28&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cc4eadb0a9cf6491d99ba08d8ca173457%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637481548325174885%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=FUjZK5NSDMUYfU7vGeE4fDU2HCF%2FYyNBwc30aoLLPQ4%3D&amp;reserved=0 
>>
>>
>> My sense is it helps with the vmstat/meminfo accounting so folks can
>> see the cached pages are shrinkable/freeable. This maybe falls under
>> other dmabuf accounting/stats discussions, so I'm happy to remove it
>> for now, or let the drivers using the shared page pool logic handle
>> the accounting themselves?

Intentionally separated the discussion for that here.

As far as I can see this is just bluntly incorrect.

Either the page is reclaimable or it is part of our pool and freeable 
through the shrinker, but never ever both.

In the best case this just messes up the accounting, in the worst case 
it can cause memory corruption.

Christian.
