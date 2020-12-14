Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 425712D965F
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 11:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436836AbgLNKeX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 05:34:23 -0500
Received: from mail-bn7nam10on2080.outbound.protection.outlook.com ([40.107.92.80]:4161
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2436975AbgLNKeK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 05:34:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMUt7dvt0AIkwxKPnqKTny+DsDdd31zwFkKW91ayTgwzwsXBso2jsMyQK5DsfOGncP9dnq3jezQLiWetAKDneAvYxAwwW5PN8/1Dn0k408Ku5zNYzNMNE51GVwk2chL/sU0bWuRUuspwSCJDUjHj+LHMPPSxelyRv/QIzOLmewq2yu9lA8tVxB0Z7E1nRrQSOyCOS8Qblu7HxeTgS9Vy6Qov8njgkwHqXlTIqSWnd9LEiL/hAHU/Ix8vwvU+a8YBZDJbt98ig+pRa67Z6DOdNpUmQ+Z6OJnCQYY7Vkd6+1VIR/KJraW4HGnqqNQeLGiN/1CZvtUvoPDzC7Q/1jjAfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbLEEWZs6skVwzBgKae6CTChzQTACX9vn4mz1Ko1jTk=;
 b=Q60TiAxFUg7raStM26BSySIYfjdDl7BI+8NiK9xNv0gc0AMdAFw3br+N46WlJKdQpzordTrPFTpTVNF5IINWiDdMFVzSTYVcFan7diCtRiliCPiS8T/6WBq/JDB+kQUXOb5P3NylA7a5Pfdz51vpo9dTvaZS68R+lUHnwlQieZqwUd1k7RchyRN371Jm2YK+0r148FIFfwTF3D0vDR75isvxA0ZiCMZRoL2Z3zs6X0uSYa1XdOD3HGn/B+mEDPu0zlvzEhKE2mfaaVFLkqQwMsI93Qw+7oNs0CQj0Prg3zKlBTGzGDWTMIo/IDTqOYzGN7V+ko7j2KE7w4/ZIppGXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbLEEWZs6skVwzBgKae6CTChzQTACX9vn4mz1Ko1jTk=;
 b=ucunRnjDHBfl5phMKHP1V6dgW80FpaIrTKvlJ0HO5Q/KVU6uvvzf0+QHzvvVx3JVuOwBQciftOJm2YyT6SUBYnB+qPnNhYX08WgNhtP+117GdGv0uhemcE8HI9xvD8yk9GSgKd6NGzpr4HItsLRjYnJ8JONoX3O06fWyvuq1+9M=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Mon, 14 Dec
 2020 10:33:16 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.024; Mon, 14 Dec 2020
 10:33:15 +0000
Subject: Re: [PATCH 1/4] dma-buf: Remove kmap kerneldoc vestiges
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20201211155843.3348718-1-daniel.vetter@ffwll.ch>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9508713a-2a83-dd53-bddf-828a460e11cb@amd.com>
Date:   Mon, 14 Dec 2020 11:33:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201211155843.3348718-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR06CA0109.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR06CA0109.eurprd06.prod.outlook.com (2603:10a6:208:ab::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Mon, 14 Dec 2020 10:33:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f0cd5ae8-05b8-460c-4319-08d8a01baa94
X-MS-TrafficTypeDiagnostic: MN2PR12MB4390:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4390C234F0D3D08B102058E083C70@MN2PR12MB4390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pTzH+dJf0KUgRcCH5aeA0+SGSzgmaiNhmfIrqf3Og3HD+gpqRj0z756AvOJjA2aPg0i+cHdrA/cixHX66gi4I8vf0iH6rk8KwtIWdYagjMu6zxUvEXVC7iqzX8pI0HAY05GuTXGWScmGvXL8x1u4+WRBtAIyVMfdfUbIedJEa53UDzL8jnPG4yacHmaRz+wv8386/kEHVVOr1xxQIc7bMK8C3wbSO4i6vpeObZhEqUzZW6Q2pueushAppAbBGwH2QOH/V/DokvTzYUpVM1tg6txAr7gE/BpOQWxk4UiBkybebMOg6aaQMxPFzpxgeUKNrfees6So4AxHSda3iZibHuHeNMeaQYn6hATz1SsrOLxO5ubSMb0f1qSj2g8pXENRQWsKKGCurUYzEnIx4Zzshan09EB+8U7NnpkrJELs4VMtPDM/SwQhSnH4y0n1oG2e
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(5660300002)(4326008)(66556008)(66946007)(66476007)(508600001)(6486002)(2906002)(86362001)(31696002)(52116002)(8676002)(6666004)(16526019)(110136005)(186003)(54906003)(36756003)(66574015)(83380400001)(2616005)(8936002)(31686004)(34490700003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZzlucG40UHRORFcyZGZRQzFxUG0yOGt1MGt4TDNhQ0lwUFRGWW11VDliQVlV?=
 =?utf-8?B?ampSR3RVTU9tVjJJUzNWNEV3MU1ONnd0NGNPOWZXZEsrMTIyOG9wMlRJYzlz?=
 =?utf-8?B?SzJhb1VBamRjbXB6aTVuMnFVdWlsU2V5dkNqcVBGWGlaS3FyMk1tS3p5RERE?=
 =?utf-8?B?SWNnMmIxdjhwVHQzcE5xVFJkYWNCaHc1NDMzOTNqTEtGczlOY3lIOExUVy9x?=
 =?utf-8?B?MGZTQytaY0JqUWFnMnE2WWFWYUwxWUlvOEZjOFAyNmY0L3UvKysrdzFrZ0dv?=
 =?utf-8?B?dndOdkNUZmtkVlR5QVRXYkFOQmNTSGpyOEhLS0JtVTljMzZiZmpRaE91emsx?=
 =?utf-8?B?d0NqZHUxdERmSzF5ZEhQcTY1dEphNVJSS05HU1htMzRaNy9oQnE4US8zaFJ5?=
 =?utf-8?B?eUNsOUF5U1BpcTNBV0dTWmlOUHNta0hPQThzaStOd242NlRFWFB4K3U3Z1Ra?=
 =?utf-8?B?TkFCWFhxUDRSR0VuMlNMSjVaeEt4MDNhV1E4ajhLTTI5alBkVjFIeEs1UXEv?=
 =?utf-8?B?SFZHbUEvUzY3OVBnTjBWNXM3N2lrRzFNTzUzcGJnY1oxSW93WUR0Q0tza1lD?=
 =?utf-8?B?TDJUTEJXdm1IS1hneVlWd0p3eFBBd3I2bndjVm02dTJTRlFDZ0QvdnhjOGZ0?=
 =?utf-8?B?VVdxY01yVWRzTnRucE1rYWlabitCcEdGbDZROEJEUGtIUjd5WURsNFltc2pO?=
 =?utf-8?B?bWU1b0NEeEJzazh4THNjUlRoK0d5aXZZdWkxZjdXcGlraEw4UU84SlA5dXo5?=
 =?utf-8?B?NmR6SzVxNTYyTDlqdDVFbVVIS3hYVU83Y2llUTR4VWJXNHRMYjYrUUx4YVMw?=
 =?utf-8?B?QVdPTElMRHBDVWVKT1Z6NGF5azBRTjFJb2M2dEluOEhacCtHbkM1a3Y5aUtr?=
 =?utf-8?B?VjRxRm5WVnNZa0d3T2JHdmlqRkNRQ0hXanJ2UUhHWTM2akViZHI5T2NFMjVx?=
 =?utf-8?B?ZGZjRUg0RFNQZFUzQ2hJWU1RRFpzTVRTTVIxOCtkZ3ZZTFA3OE9PZEhYUTBF?=
 =?utf-8?B?a0dXVXEzV3oxN3c1MHpuRjJKcm05cWI2bnBnNnB0WXBwejBKRmpLUDVNV0Q0?=
 =?utf-8?B?K3diY3BURklzMSsra0hvQnlzZUJHZ3N4VkVyK0ZUcFpoTnkwSFh0TDYwMXZz?=
 =?utf-8?B?d1lwRDB6SUlUbm9xSGR1TVFkZFNwRU96R2JsTXh4dHMxenIyakVhUkVJQnll?=
 =?utf-8?B?SlN4SDhxZm8vUjJQZUFTVDF0WUN3N1RQbzN1OXhaT3BlNEFhbm4rNHAyMWJ5?=
 =?utf-8?B?dTN6YkhFQkhZcmdiUysyVndGZXA1bEhjcDd2TStKeW81RHdURUJESC9UL2JD?=
 =?utf-8?B?TjlqMXZXdlFhQ0dpLzR3a3RkaVhHWUg0RlVjbVZvdCtsQXVFYUR2NUkxQUJT?=
 =?utf-8?B?OTNGV0hLalhLZkdqcEZFRHI5TG1UaC84OTN6MHh0YmVKaEJxdTcvRFB3WUts?=
 =?utf-8?Q?8NMUskFJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 10:33:15.8230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: f0cd5ae8-05b8-460c-4319-08d8a01baa94
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZpPhcLU6plyZCoqVWydJs084y13fnb+3iZKel3aFPdVwEBIcUSZiP4IXhDAT17k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 11.12.20 um 16:58 schrieb Daniel Vetter:
> Also try to clarify a bit when dma_buf_begin/end_cpu_access should
> be called.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>   drivers/dma-buf/dma-buf.c | 20 ++++++++++++++------
>   include/linux/dma-buf.h   | 25 +++++++++----------------
>   2 files changed, 23 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index e63684d4cd90..a12fdffa130f 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1001,15 +1001,15 @@ EXPORT_SYMBOL_GPL(dma_buf_move_notify);
>    *   vmalloc space might be limited and result in vmap calls failing.
>    *
>    *   Interfaces::
> + *
>    *      void \*dma_buf_vmap(struct dma_buf \*dmabuf)
>    *      void dma_buf_vunmap(struct dma_buf \*dmabuf, void \*vaddr)
>    *
>    *   The vmap call can fail if there is no vmap support in the exporter, or if
> - *   it runs out of vmalloc space. Fallback to kmap should be implemented. Note
> - *   that the dma-buf layer keeps a reference count for all vmap access and
> - *   calls down into the exporter's vmap function only when no vmapping exists,
> - *   and only unmaps it once. Protection against concurrent vmap/vunmap calls is
> - *   provided by taking the dma_buf->lock mutex.
> + *   it runs out of vmalloc space. Note that the dma-buf layer keeps a reference
> + *   count for all vmap access and calls down into the exporter's vmap function
> + *   only when no vmapping exists, and only unmaps it once. Protection against
> + *   concurrent vmap/vunmap calls is provided by taking the &dma_buf.lock mutex.

Who is talking the lock? The caller of the dma_buf_vmap/vunmap() 
functions, the functions itself or the callback inside the exporter?

Christian.

>    *
>    * - For full compatibility on the importer side with existing userspace
>    *   interfaces, which might already support mmap'ing buffers. This is needed in
> @@ -1098,6 +1098,11 @@ static int __dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>    * dma_buf_end_cpu_access(). Only when cpu access is braketed by both calls is
>    * it guaranteed to be coherent with other DMA access.
>    *
> + * This function will also wait for any DMA transactions tracked through
> + * implicit synchronization in &dma_buf.resv. For DMA transactions with explicit
> + * synchronization this function will only ensure cache coherency, callers must
> + * ensure synchronization with such DMA transactions on their own.
> + *
>    * Can return negative error values, returns 0 on success.
>    */
>   int dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
> @@ -1199,7 +1204,10 @@ EXPORT_SYMBOL_GPL(dma_buf_mmap);
>    * This call may fail due to lack of virtual mapping address space.
>    * These calls are optional in drivers. The intended use for them
>    * is for mapping objects linear in kernel space for high use objects.
> - * Please attempt to use kmap/kunmap before thinking about these interfaces.
> + *
> + * To ensure coherency users must call dma_buf_begin_cpu_access() and
> + * dma_buf_end_cpu_access() around any cpu access performed through this
> + * mapping.
>    *
>    * Returns 0 on success, or a negative errno code otherwise.
>    */
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index cf72699cb2bc..7eca37c8b10c 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -183,24 +183,19 @@ struct dma_buf_ops {
>   	 * @begin_cpu_access:
>   	 *
>   	 * This is called from dma_buf_begin_cpu_access() and allows the
> -	 * exporter to ensure that the memory is actually available for cpu
> -	 * access - the exporter might need to allocate or swap-in and pin the
> -	 * backing storage. The exporter also needs to ensure that cpu access is
> -	 * coherent for the access direction. The direction can be used by the
> -	 * exporter to optimize the cache flushing, i.e. access with a different
> +	 * exporter to ensure that the memory is actually coherent for cpu
> +	 * access. The exporter also needs to ensure that cpu access is coherent
> +	 * for the access direction. The direction can be used by the exporter
> +	 * to optimize the cache flushing, i.e. access with a different
>   	 * direction (read instead of write) might return stale or even bogus
>   	 * data (e.g. when the exporter needs to copy the data to temporary
>   	 * storage).
>   	 *
> -	 * This callback is optional.
> +	 * Note that this is both called through the DMA_BUF_IOCTL_SYNC IOCTL
> +	 * command for userspace mappings established through @mmap, and also
> +	 * for kernel mappings established with @vmap.
>   	 *
> -	 * FIXME: This is both called through the DMA_BUF_IOCTL_SYNC command
> -	 * from userspace (where storage shouldn't be pinned to avoid handing
> -	 * de-factor mlock rights to userspace) and for the kernel-internal
> -	 * users of the various kmap interfaces, where the backing storage must
> -	 * be pinned to guarantee that the atomic kmap calls can succeed. Since
> -	 * there's no in-kernel users of the kmap interfaces yet this isn't a
> -	 * real problem.
> +	 * This callback is optional.
>   	 *
>   	 * Returns:
>   	 *
> @@ -216,9 +211,7 @@ struct dma_buf_ops {
>   	 *
>   	 * This is called from dma_buf_end_cpu_access() when the importer is
>   	 * done accessing the CPU. The exporter can use this to flush caches and
> -	 * unpin any resources pinned in @begin_cpu_access.
> -	 * The result of any dma_buf kmap calls after end_cpu_access is
> -	 * undefined.
> +	 * undo anything else done in @begin_cpu_access.
>   	 *
>   	 * This callback is optional.
>   	 *

