Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4E52532EF
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 17:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgHZPIS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 11:08:18 -0400
Received: from mail-dm6nam12on2072.outbound.protection.outlook.com ([40.107.243.72]:2913
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727104AbgHZPIQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 11:08:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvcIaSnW182+YZUo1pWrTrGoOBFqCbBsQV32wZjYbCmqzLZauL0kSj4LZi2Z/AcCMNiidU7VXBE8Zbda4a8zNWksZKqOj9HBQQvhhv002T1+gw+xGaKzCHCh1+7/MPvckvn2z0XMXGILPzeu7WGuM3IUG689N51KW0maOaU13cfw83FhXxZaVERGNCCJ4MVrCJVEbV+ksw6abbMVu7AXUVWtf4G6sk613WctLXj/c2OXfjlVQaPDIUltv8U/WO0BOjyeJJV4KNqwPr9lmlcgFOsTbi14oCJm5niR4o8kX9RmHIk9lSaHeIBLLV+tVu63YbyfVbKHb8dHXI2YLSKl+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drHFO8KIKuIF4cUAkRI/W2NE4KQ0EjRuMo01gkwBFUA=;
 b=d3Xhkn2wduCoa9W3QavLeGodPC6VPFyfuF2ktWWr53UB8o69XUeqxLy1D+a6Ev17KUNARjF77gyYZSHXW27BtwUgQosmP0NIYyatpfoBJ/x4gstIKPl9f9EFxPxQqTnXnsSVLTI7uHHYeHLok8xUjSBwoCF55ssYIDNmhrxDQ3ynt3EAcy02veyaUmOezjXdaM0UtgVxd3yjqomvNDsaat1dfvN0AT2hWQ6MZk8QReGvI4RWOcXHZ/ygOsrpa12QmNAZF1+Jaf0HPeZoSVzx/ToeMefOrk5XcvuQnppb6QaJHqptzt42ua1DxiDdHY7RjBvyYO5iD9Kb5DmUQAWnuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drHFO8KIKuIF4cUAkRI/W2NE4KQ0EjRuMo01gkwBFUA=;
 b=ZfmheNC21olK/L5nB1sb8KzPR3fVDPfOsYTtXudkP5rdDSYfNVOs7bMrMTDmIr41fboEiQdYCpufZRfoz7q5zCC+eJPdVLPkSdkPqYrCyE4vYI4d7hG4nVTPSEjAfWvwd7j5yP7+WeK+iGgK10BeFL91wM8qCjMgOnxuDxsLYA8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2417.namprd12.prod.outlook.com (2603:10b6:207:45::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Wed, 26 Aug
 2020 15:08:12 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3283.030; Wed, 26 Aug 2020
 15:08:12 +0000
Subject: Re: [PATCH 08/29] dma-buf: Avoid comma separated statements
To:     Joe Perches <joe@perches.com>, Jiri Kosina <trivial@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <cover.1598331148.git.joe@perches.com>
 <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d5ea3bc7-bff2-c702-51ed-cb85767824a7@amd.com>
Date:   Wed, 26 Aug 2020 17:08:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0070.eurprd03.prod.outlook.com (2603:10a6:208::47)
 To MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR03CA0070.eurprd03.prod.outlook.com (2603:10a6:208::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Wed, 26 Aug 2020 15:08:10 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bb70ce2f-c8d0-4f70-2cf2-08d849d1d97e
X-MS-TrafficTypeDiagnostic: BL0PR12MB2417:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2417123FB233B0DF5E23BCCD83540@BL0PR12MB2417.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8yXKfz3ZrYeIkNDxw1MQpi+yDmtX3xUt2+kQTdhF/yjlIpJSZ06M9Z/UbH4SV84kzMqyOeeLOUcOK3IQfaNpJJmDkVmsCjfvV+RsdZAXJxDvN7kocrxObbX6y4Zu2iVflj7X+3C4Pe7gSy8SDvBlV3JUxsl93nxO1mMzNP3TUX3WmMLy7czhfWkv2S/8cUO/tLayjbbevCZgra4rDnnfA8q1Egh7BWfcYV2uSq7Z1e0O1Vg81b9YjbEJ4GmH42AWJrA0Dwv57udZPv3TlFqu5MMxpKpGKtU+KxtG1GBO56ZmplEgXBrcgLqOgcEkSSJ6SLsEl9HHqN4RG586XcV2LJjYMHNvdmnVVqhGj9O76PoAEG1CbloIuWc9jP+nl+5H
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(478600001)(66476007)(66946007)(31686004)(8936002)(36756003)(5660300002)(6486002)(8676002)(186003)(16526019)(66556008)(4326008)(110136005)(316002)(6666004)(4744005)(31696002)(52116002)(2906002)(86362001)(83380400001)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: vVdKUTxFLmQOZCwNLnoon6BfFHFYPYehM3fzMClPyzss8yd0WVaklMyiPMCIJOrtOlN8399FSOvkEj6RgnMLDfwD/05IcQ9WxucUC2MhZ92inUnzF4AI6bW4q4Cust0aW9i8MtoqxkkbnMYuw4uMIVsre2Oplw5xjajjcIB5A9jxe8MYUz6rksN2pdJA61xEcfHI39wJYTZDpsAOV2s8SPrECzJf4j8q3QE4RQu7cUlZv5vp8tUAWyaBUOg8UnHhSKkyeY6NyI8ivFap/9y6L6t+2PNnpRW/DlCgWjGWabiwNyHKJMSiryxh0V/saRgYaAAo6l235dCE8N4I3MkE2auFEDotidSXQkqIWhFnp+WApQtO8BUcx5lr8YeyyG//TbPS8GMHs2TV2cTtAmFBzIidt1zZuZvIYl2GKrGZoUc0uNoilTDCmwfiI7QjL3QrtFcCnkZ56mgeLED1RSR+vz4pEk8Teyjqde18iX3OIA868aKNgIKD1aVEiCp3cwFCryqVKpQfC1J3CyhfsGMi8zS4OKHLdvpSvhzufBem5Mx1tFsT9v62bmMAesdniLfuv8RHDsWyLFPVp2uZIKra4WKA84laivZ9g3K/H93vUOdWO5LBY5gdKkYvuSHeba3XqkhipUcZ6RaKSqLtzyWuTNjwAOn83Nm2wVF2SAFZTAqgjk6cBElUpiuHXmruDlG+PsUI+pV8YeDJxaa1Qdki2g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb70ce2f-c8d0-4f70-2cf2-08d849d1d97e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2020 15:08:12.2260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kkmx3Hr+2JXf+Ct1/b1Sa3shHETXkAdTkoxAGE2F35ujeWLqCkU17r+/WLxZLn0+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2417
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 25.08.20 um 06:56 schrieb Joe Perches:
> Use semicolons and braces.
>
> Signed-off-by: Joe Perches <joe@perches.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/st-dma-fence.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
> index e593064341c8..c8a12d7ad71a 100644
> --- a/drivers/dma-buf/st-dma-fence.c
> +++ b/drivers/dma-buf/st-dma-fence.c
> @@ -471,8 +471,11 @@ static int thread_signal_callback(void *arg)
>   			dma_fence_signal(f1);
>   
>   		smp_store_mb(cb.seen, false);
> -		if (!f2 || dma_fence_add_callback(f2, &cb.cb, simple_callback))
> -			miss++, cb.seen = true;
> +		if (!f2 ||
> +		    dma_fence_add_callback(f2, &cb.cb, simple_callback)) {
> +			miss++;
> +			cb.seen = true;
> +		}
>   
>   		if (!t->before)
>   			dma_fence_signal(f1);

