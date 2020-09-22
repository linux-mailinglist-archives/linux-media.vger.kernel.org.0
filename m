Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B13B527423E
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 14:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbgIVMmM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 08:42:12 -0400
Received: from mail-dm6nam12on2049.outbound.protection.outlook.com ([40.107.243.49]:26156
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726531AbgIVMmK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 08:42:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OphEYJ8hUmy8R/iC02TW3nVbpOfUb8PBeXqDIlW0GQxwrzCEtFWmKkZkDe8sCSRakrNarfVT2eQpATgJmpKR1LvMJVTPFqj/GEnAB/vRYvIdFkP6zePjBZqL+ovv4zbSnxQCTM3qgAKGtjB6ZX6LFmHOyiqZLPCQziC2xL/Xl8In3Q/tiPDQeOySwpkacIbLe1wmW0doyKvGUfYC4dmKgbc83JuHEudz4MbRkUpTQ4FviQrTzG57AuyPr9QV6tPWkxxwQ8HcOMrEzVq47XMReM5ucncx+b2WycfUaUYHleskt51/m0PyNuE2t42bcKmFvgtxBaSa5xkIv924Pj30bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8gfVxNkThlvK7Yayd0AmkNWAKjL5BAqvJhmgUHQFsQ=;
 b=P/yi/1y2kNVLff9BaOxvemUO9njiOaYT1qhlSLAEcZZaDe41RGP+eN1RTHRSUfp/Jbt1t6VOpvegFroEg3xsBk+67XAtimmCqeS8IvnaPtdZkOd2nCu6MbmlYSuro4FJ8tf1JKEYjCxxT7yrBnpKsN9+TDsQGm3Oexhy7SKSVA64mR0ccsHpjBifFiD8jYh4yxJz0P0uWoa7MSqXL3pIgqn9w+4oEqJEsj158257IwJfrUge7eAO9/NeUnd5tzaIMR++UQOoZjycgpdo6kzOZpUso478OXmqPiEykBWY3jN2bzC2Skl47syWoE1dRK/vtZx0YKC7Y2NehWMp6RuOUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8gfVxNkThlvK7Yayd0AmkNWAKjL5BAqvJhmgUHQFsQ=;
 b=eIiNVBiI8DV3KVAglkrQUGJmXGPplTX0rx9Oa7n+2YM1lrXuyJY4f4DvFzTgClfDWO/OHUgha2tG5vxqvIJW+VjvF57jGFQKmk77/0CgusXQXE9tG0UUOF1LnEl6DjNQoiVVRqiGXfYjKqcsaqAujEDwJ4zzuo7dCrjwJencEus=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4048.namprd12.prod.outlook.com (2603:10b6:208:1d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 22 Sep
 2020 12:42:05 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.026; Tue, 22 Sep 2020
 12:42:05 +0000
Subject: Re: [PATCH -next] dma-buf: heaps: Remove unused variable ret
To:     Zou Wei <zou_wei@huawei.com>, sumit.semwal@linaro.org, afd@ti.com,
        benjamin.gaignard@linaro.org, lmark@codeaurora.org,
        labbott@redhat.com, Brian.Starkey@arm.com, john.stultz@linaro.org
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <1600761208-45229-1-git-send-email-zou_wei@huawei.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <16d720b7-9bf3-ad3a-0785-76f21c87c9e1@amd.com>
Date:   Tue, 22 Sep 2020 14:41:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1600761208-45229-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::19) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by FR2P281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.4 via Frontend Transport; Tue, 22 Sep 2020 12:42:02 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6ba50b27-dbec-4380-fac1-08d85ef4e90e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4048:
X-Microsoft-Antispam-PRVS: <MN2PR12MB404880DDD8FA31193B5DBB5E833B0@MN2PR12MB4048.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LXziOEyqybva/4u0ZkGgxxYjq3dWEI+FRGozJ2ywVWVcqqIbrKQzUs5+WDPtyOBscZqirZHxrzAAeErQkGUPDTs52zWlGs0Lns9ZwHoO7HVcpBA/dt0KfwFMFF2Kg42F+YVHN4Xlr+Kq8Y6NLSCozQZHqt1ZkkdMA1G6L/gfs8dUmRCFf5bRh3NFWZCToWGTWDhFH/GkYzMWeFDFD0GJhzDEB0rWUFEUNmS7mNwohv9f9bcbKDnUoTbPpzOY4I6TAAwF16h5DTgRQ/p3qotHLFTcV5yXcL0VmboH0dZxet1TLUgqSYME5aMWIPk5m/9GhK1uGjh5QXhJ6Yp1bLL1EGUIPckLlTtY0c4YWFkyO+lWo3idU0+udUcS7wkIahe+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(36756003)(66574015)(16526019)(186003)(86362001)(2906002)(83380400001)(4326008)(66946007)(31696002)(66476007)(66556008)(478600001)(316002)(8936002)(6486002)(7416002)(5660300002)(52116002)(8676002)(6666004)(2616005)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: SFBesYf07aF8mucY9afFYORyc1RwCk5xWvlPlt7Uu2vUEA03wNLzZ31PZnVrzfArNZ1Rm+HfN6O85SA8hGOarsoIl/pkxXoG2GB7M1ZyaBeYh06sLuM/5c/UnJxd9zLomfYnAuqURhIeAmFrNgLt7/y8xGQtIoRQqNAz+t7RCzDuxF+N9tjNS2qewLmT+NTG1aps3EY7zP3tu1W3c69F6bdoZbOOqCQRHQlH/pE/iOQG4Yw2Lg4OlUMhYVZGnrA+OXTVrUskrWvtAiKfsENBytegH1HZNBn3QIOutr2bbbkIVSe7G4S3Pw72TEP54WttDiItq3+sJhSnXD5BCeg2sHT382tAktV6WHvD+C+7x3idR6kBtBZVyUp4I14bUq8C2CkvJuVNBdnic9VfHKEeiO5ugiFVi+AohnbzNKpiDHpsvmi7EnMCJvKEDuW1s0jQ5PQbQZbPjM6a1hwnw4hWKwnjq1/HGXBLBzDOB5zixTwPUonqFo5hA+979UyZuCl5NFjp6J74JEpuby+ZjkTUJYGvHEnE/IYnuWwDqzxogLHKSdiOiIcVRuc2y/4RstzMa3Pd8OlmQvkjnhiXkPFmkbAq6GJv+Ly6MI3EydbBzca/D1QR51FP17SYp1/Y8qZuGbpq17M8FLbKI7dOc2q92tlJA7+MZZagfSuFK/2o1ZGIB8IHB/c9zKvgO8XyZHSunL0wjNDN7nOQtp+du6M31Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba50b27-dbec-4380-fac1-08d85ef4e90e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 12:42:05.1867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LG2/z9QuHsN0qgGh/DviCq0IFZ23rm1qfiYV4iohgylsohKuqOHZvAGZjGz/gQx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4048
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 22.09.20 um 09:53 schrieb Zou Wei:
> This patch fixes below warnings reported by coccicheck
>
> ./drivers/dma-buf/heaps/heap-helpers.c:202:5-8: Unneeded variable: "ret". Return "0" on line 215
>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

Acked-by: Christian König <christian.koenig@amd.com>

Going to pick this up for drm-misc-next.

> ---
>   drivers/dma-buf/heaps/heap-helpers.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
> index d0696cf..7969510 100644
> --- a/drivers/dma-buf/heaps/heap-helpers.c
> +++ b/drivers/dma-buf/heaps/heap-helpers.c
> @@ -199,7 +199,6 @@ static int dma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>   {
>   	struct heap_helper_buffer *buffer = dmabuf->priv;
>   	struct dma_heaps_attachment *a;
> -	int ret = 0;
>   
>   	mutex_lock(&buffer->lock);
>   
> @@ -212,7 +211,7 @@ static int dma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>   	}
>   	mutex_unlock(&buffer->lock);
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static int dma_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,

