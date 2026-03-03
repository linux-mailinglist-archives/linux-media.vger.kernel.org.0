Return-Path: <linux-media+bounces-54277-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKa/HGynpmkNSgAAu9opvQ
	(envelope-from <linux-media+bounces-54277-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 10:18:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 054D81EBB6F
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 10:18:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80ED43083018
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 09:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5AE38C40A;
	Tue,  3 Mar 2026 09:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RUZA+9RO"
X-Original-To: linux-media@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazhn15013039.outbound.protection.outlook.com [52.102.140.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C171400C;
	Tue,  3 Mar 2026 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.140.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772529472; cv=fail; b=KVgTqPsnl0Q5V+KyIVCJ/VjIh4dID0vda6aConGQex4LhhlbxXtf62PlSf6v8hz5uT3nf4TOmJf7gSLmkgeuoiWBcPS/T67F/6eZdXbAr+/zo6r9aJyHxoSzrz5Hm+UgOqE32zThbXRdgcKjJNQpla/rVmdknNOGdQQGaD+NAn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772529472; c=relaxed/simple;
	bh=CO+SPWfHtqoewPIdixqQUJUCjC5xFkqOH2Rayw6UN8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HIcoNwySU6wFsgvvIT01XXXj0DkfaaAQqiUL4j3b85xcwe2/zDQJoEPFAwdGEVxiUdmbKxoyBMHXqvMrG856zVlaFhFLTRMW42aM1sywvr/1iPjopZuCofQPs1Mh5VOGIVx0KDcwNQcc+4DV8MLu7dzJUeq1Fvg638+18Y/OvPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RUZA+9RO; arc=fail smtp.client-ip=52.102.140.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7EWXjJVsQ+54wk32eVLw00Vbp4naNh5+zkj6wChB7SBu8pZcH4iglvby4bxA0A04+dHvOknK0sBHG2/vpiHqaZCsDm8j6bJYQP+MESiQ9GBIY69pSMF+VDfM8tlqj8tSJcu4y4ASf7IDIV6ztVryoJ8Gqusf7OtTG3Jdyvd0RsWsbbwweBCAXu69zUXVcd/WRUJRNeqTypdLumObp+CNKrjx+reCMAcq03JQHQFdyDEPgAGnd6mb32hrRMw+l/O+gcNIyThg4/4Ebu2cppy+k4WA7JaQv7h6ZYACfHBRHlLcqD1WQDtynANgPS3gyijXC6JseEFXYs/h2TM6sTHbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4e329DICsPg+shIdtPY+4SeFG4O7YGUpw/KJIkQKkOU=;
 b=VB9hWDpLYvmKOUe/CBtpf2yc6EAnqFhNHRG66CvaOJUnCUFyUFOEn/7Dem+hNjLoyw6jaxcLtCNjU9FnvGKHuH2pwCSYDtrt/fecVy9wC2C76wxNXdiw96FMCUS1lipp/5mnIk+E74gpJA8VJDumyjki5OwcnAo49XqP5CD0TG44hmYGixEOyEnHLITC/7WlbnNncbEq+wejtl9dFmm7wKm5aEptWOtbDNzQ3wCObeW7skzCeMA/hqnSh7fjZc/ltFpVuh9fY3YMafEr9ezhvEBRpYsWy4wtWmWXCGVRAy2enH9pdaYQfaJ/BGwVhFdsfAZEJVRWSNC6MvgGOSo+Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4e329DICsPg+shIdtPY+4SeFG4O7YGUpw/KJIkQKkOU=;
 b=RUZA+9ROHinjyD4Ih/flMwtRSibvkqy8jGMn4vLtPz99C2l2CJUVVwg8AR7WbQG2lpoZCTKD5zZ61wED82vaFtMejgJHhT3Gvm4fTNF/+6gNJk7RbuUzxVjPsKJrsZsxclklOuULAo0Zyhuyg/yMbkEou94Ahmsg839qhU0SaxU=
Received: from DM6PR02CA0053.namprd02.prod.outlook.com (2603:10b6:5:177::30)
 by SJ5PPF2BE4E177D.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::798) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 09:17:48 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:177:cafe::46) by DM6PR02CA0053.outlook.office365.com
 (2603:10b6:5:177::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Tue,
 3 Mar 2026 09:17:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 09:17:46 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 03:17:46 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 03:17:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 03:17:46 -0600
Received: from [10.24.51.219] (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6239Hhfi1861456;
	Tue, 3 Mar 2026 03:17:44 -0600
Message-ID: <26808c31-ef61-4476-b36b-d6c9cf3596a7@ti.com>
Date: Tue, 3 Mar 2026 14:47:42 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: ti: vpe: Add missing v4l2_device_unregister in
 vip_remove()
To: Felix Gu <ustc.gu@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benoit Parrot <bparrot@ti.com>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	Dale Farnsworth <dale@farnsworth.org>, Sukrut Bellary <sbellary@baylibre.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260301-vip-v1-1-d90572c2c55a@gmail.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20260301-vip-v1-1-d90572c2c55a@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|SJ5PPF2BE4E177D:EE_
X-MS-Office365-Filtering-Correlation-Id: 6181ad2f-f53f-4793-3161-08de7905bbfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|82310400026|376014|36860700013|1800799024|12100799066;
X-Microsoft-Antispam-Message-Info:
	fatJDwu9aJDz4CDKAGomtGt1Iyyk2PdYYl7kLUPVSwrr1ajyAVGiQnqU9NkiUjrKkX0jmpD50ZAHA3telFPW4DBCKymbUqtkDRw80mMBoMYPMY1Mt7LB7kUk9eiQlbEFr806RdVZYTj+GNm7Rrsyh/pWzGvxjPy2ejSNsWEDwusuP4sqq2Hbe1SG5DKuhJ9fetFOiMFB4qT1kZLboOuKanCzT/IBqsO5IQowww7Y/F3LreIqgz9W4YURc7dhfSwm9FhmZdComghMiqXltS8DrWuhsQ7JE6wmTSKVGKrkwBDvp1vG1/uvXoPn24N/Vds67dlsgzb3BzsEH5XYt2ZDptPug1cap5MXy1mr3GLH2S7+HlAHmNCLPnjwmyH0gpxKjmftIrLJ5LUse9B9QrqBzxMUSuJGJwRlZvAXmLLoW12UGktAOEpCAMTk09fohqWmLNoJ8s4RytTfO/5GUH7//DRmlA/OW74+VjmcBVVM8YXxSBCC+Q7czvzZ4XFlK5rs9W72SAyR/It1sqK/uqVTK3NGO+I9xbEb32yawj0TICC99RE/nnrjpvGM3CC+CWY71uzgkgEbqAv9zwdDBMs457RLHl2HNybx44Q2ZqTlRNXdrJJwPkc3qKXdBqV+lU5NdJ93KrDeg50RIA+QyKnI9/loP1LJhK+RJLl2J9L3axU+VCUtURsN9FYzpfpLCUh9RDc0//CgcHZSdtWX3vMhbxMB/YGFbKLJivsTAjd9epzSDt5DElsQS1OjipS9L48TdgN4qVegZ+pZckpkSFjgMIlXT+3bw+eUaDNVCRaAVS/Cudy5gHnx0jiXO8oL1c7DexiH8GUdAUQiFyget4/zbg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(376014)(36860700013)(1800799024)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qFqzbJGI9M0RZbcNu6vHGRsEnE2/emR1hT2vCZWzGIcdRR2ZUG5eHNH1+fUYshHngl8NNTAHIFaWUj+PMlRaAAJ+9+WiNLgpIDF5bKTRaIZ5Wn83nBMPPlmbW6c8gcxXWTS1Sart3NEkBFccsbIP+8dmgcvPwzPmib0Tuzcb4CrJdusqKYdcPFRw4Id0xm1dsdBs2gja5A+1TtBVC9EBL2y2TB2ThUS7yz2V6G7hy5Q/pkwiGZQvg4Wsns8wkCc+4U9HT8lZlKtcyatGQ4SeKIgn4G2IxDg5rMDLkQC81sOB/N65647HXxcl4EYRecA5YqM5NC0yvo9LP7FSQTO8Fvr+UiCZ5e7waV2QbQJXhLPRScBjC+1DgUNf0Q6XFdH3/DQcL6WHnu4ejfiGYUyXW4yTtz8aimDWnG9TOxPTM/TuxeaBf0r9cWVTn150429P
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 09:17:46.7844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6181ad2f-f53f-4793-3161-08de7905bbfc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2BE4E177D
X-Rspamd-Queue-Id: 054D81EBB6F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54277-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:dkim,ti.com:email,ti.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,ti.com,farnsworth.org,baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[y-abhilashchandra@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 01/03/26 19:09, Felix Gu wrote:
> The v4l2_device is registered during probe but was not being unregistered
> during remove. Add the missing v4l2_device_unregister() call to properly
> clean up resources.
> 
> Fixes: fc2873aa4a21 ("media: ti: vpe: Add the VIP driver")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

>   drivers/media/platform/ti/vpe/vip.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
> index a4b616a5ece7..0e91e87bda9b 100644
> --- a/drivers/media/platform/ti/vpe/vip.c
> +++ b/drivers/media/platform/ti/vpe/vip.c
> @@ -3641,6 +3641,7 @@ static void vip_remove(struct platform_device *pdev)
>   	}
>   
>   	v4l2_ctrl_handler_free(&shared->ctrl_handler);
> +	v4l2_device_unregister(&shared->v4l2_dev);
>   
>   	pm_runtime_put_sync(&pdev->dev);
>   	pm_runtime_disable(&pdev->dev);
> 
> ---
> base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
> change-id: 20260301-vip-c6e932239447
> 
> Best regards,


