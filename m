Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9DC257712
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 12:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgHaKCO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 06:02:14 -0400
Received: from mail-dm6nam10on2048.outbound.protection.outlook.com ([40.107.93.48]:29089
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725964AbgHaKCL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 06:02:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ji9ta2FJuBi8o9sJW0LjDhhjopNi/RnxIHABhhfhUco76LgSRcCDwLFmtkosIR93wXgILBS6CTct5tdnIfV/BWzulVQQBpdn+hjL2UOQCFImNFu9RxrqhBaUI5ZqsozTcueEDZ8v86oQxfq+9DK/XorK5LLIDhUicM0MHSl9Ff4C9dRAX3bra3XNKFk9QWdlxPrmOgRT/qsst9wTPeztz/gQqoGy/n7FWFUBBCoqfoQR2Wj2nKVUyqRv8lRPvc9OTBzp8dAt4AZkA4erd0VWebnI6oGoCLdipXRFjouy7OjddpEEGYsDFF98CJ8NxdaW3T66BJgzn9XA0jsvcItoIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/Z6VWaqqpRvDaP1C9qvuhZRKTHXlbZBZSCppNmwNA0=;
 b=NaJxoI57Bp3AcrmnEJF0s/bd0k4prNExfimvbeSKMZ9ENsJrye7dq/O1o0EfSmFUmpH2sO21T/ohd7KkUa7rrsRGnXY9YQJt+rjU9HPzqPgEx9O72JKDImHtA+AZ1gRrxxlZziPQFDSo/egtOhx3HgE6npjB+8qqWtSeIuJVQPz3dbIw/WnNmy/ghQYXYQsvAxkjGz0wMYn2vGHkUIPuPh+YFwcF0sYWc5yxILMjr3J83V4rBhEnKLx86gApFnGQK50ZH4YWDvo2+M+qd5+oSYma//rPT5G8m13JEmlabRORnSq42ye5qum3o1uG7wM+jcB8V3pyN4aTMRglOpEERg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/Z6VWaqqpRvDaP1C9qvuhZRKTHXlbZBZSCppNmwNA0=;
 b=EABVJuodYT/0binIVZxI1Fm/StBwG5Zcd6NDEVEWH2Wbq9Eu8BcEc14MlUJXmwWPBTFRNloi+iQ4Luul8rmCAVWyVkIhwXiMlaR9IkI+8pTFDQfkbWApFFfOX/trRYbb8M3XPLoMMVDfJG2xnWBQempRFmqc+ENiRe4YUl49Qzo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3968.namprd12.prod.outlook.com (2603:10b6:208:16f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.24; Mon, 31 Aug
 2020 10:02:09 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 10:02:09 +0000
Subject: Re: [PATCH] dma-buf: fix kernel-doc warning in dma-fence.c
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20200831041713.12571-1-rdunlap@infradead.org>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <81dc0a34-90f6-401a-f846-924fdff4aaff@amd.com>
Date:   Mon, 31 Aug 2020 12:02:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200831041713.12571-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0065.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by AM0PR10CA0065.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Mon, 31 Aug 2020 10:02:08 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a1829649-7b51-467a-772f-08d84d94ec5e
X-MS-TrafficTypeDiagnostic: MN2PR12MB3968:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39680EB4A0B6B171AA75876483510@MN2PR12MB3968.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uHyKa7usRwt52AmmTnvDUYCPDpgYVITz7aO2CjgjWzqvwusBYj7h1YTq56el2VT04r96uWoqy5RxwSDx9eWevNSqGCQb3rplOTZrjZuC9qQgoO+WS+SAnzopIKxcXh0e58BifIvSgL+OBbl466lRKxfQ5cjKVkMB4WdQYYHVJ1WSgREVGdcRGO8HrKTaB8XLv1xDCfq3EJmClC4K6GadaB2KefJlNmEA6k6QDyVzTOyxV8e+oYuJkZEHhue4U8UH3KKb+z+n3H63cWE3fBRUb0wD7VM7ZjFIoZtc0IDxIPCo4G97QtiUAC9q7BR8zbnbvXJe9R9gdiao4KtTQooSkXPW7RIOaOtfvK+gpuuJVTCk8CR2rgcXIpKzf0HG/Vze
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(6486002)(52116002)(66556008)(66476007)(66946007)(8676002)(6666004)(4326008)(2906002)(186003)(31696002)(66574015)(31686004)(86362001)(54906003)(83380400001)(5660300002)(478600001)(16576012)(316002)(956004)(2616005)(8936002)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: L5YdH+cTQ8JWbFSLJ1HAw7gzHHw6S0Rqu/wR+TLUuhopRC4BjAlWxmopW2rIsdXyFZVknAu2KztGLdNBm1xGOi1on2azjUyCm696MQQWUcdqCI/l6lFiDG51EWSYjhxJxEMBARdMmQR3jQHQNF3NJyveU9wag+GOBlOi7zA9o74mZFXdk5qqeh1rTz2ydi51mZ8WXitl527t7nt6/bxzMcS05GM0D4N13GD/X0u7bk7MjHcc/bpS40xamK7lEXtRz3p78Ftw9gmHX5h42CBVUyGfC0sTIvnImBycAtBrRSAMmMNoRZyzJ8R/ZJQUtzn+yqqKxeEk0qjc9Ce7a3fXRPndM7q2M35pCw9JPoKTFZd+wlsiP7f5uKU/pYUqRi3xafQ6b+MxJJF9O/nJ7XJOPEigeOsajUYwQCsIEfYc6QKN8psU7F3fm6FkuGIl3yeyH6g2Husqsdu1gcCLLKZaxIFdSkQeB+vn4prNMt7ol2F51Oi6RrDlMYEZ2IBedjTJ+AXwNbrqzRXHkwrXoFwrp1kevBzi9PHchtcc3aHWAxQ+/ESmgcuBsFVOWkYPqF1aW5PMRY4ezCOwywQ9PxzUbeeU6/Ukz8GW45lE7N9TQOhHpDwTIwM0pJcZQo24JT6nvEst3fViyeUEwmr4o4gf/XBW+Nafx4qp16gdXlw2qLU/uKGy682/Qb4KYuaKpPpLZkpijEv4VcewipQsn+Aypw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1829649-7b51-467a-772f-08d84d94ec5e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 10:02:09.2355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ykOhXXz4USPyzbG9I1YWgcuOvLPl4YODrLegYBmidBZHcEwLjC9rHoM3ZPsY3VKN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3968
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 31.08.20 um 06:17 schrieb Randy Dunlap:
> Add @cookie to dma_fence_end_signalling() to prevent kernel-doc
> warning in drivers/dma-buf/dma-fence.c:
>
> ../drivers/dma-buf/dma-fence.c:291: warning: Function parameter or member 'cookie' not described in 'dma_fence_end_signalling'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Gustavo Padovan <gustavo@padovan.org>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/dma-fence.c |    1 +
>   1 file changed, 1 insertion(+)
>
> --- lnx-59-rc3.orig/drivers/dma-buf/dma-fence.c
> +++ lnx-59-rc3/drivers/dma-buf/dma-fence.c
> @@ -283,6 +283,7 @@ EXPORT_SYMBOL(dma_fence_begin_signalling
>   
>   /**
>    * dma_fence_end_signalling - end a critical DMA fence signalling section
> + * @cookie: opaque cookie from dma_fence_begin_signalling()
>    *
>    * Closes a critical section annotation opened by dma_fence_begin_signalling().
>    */

