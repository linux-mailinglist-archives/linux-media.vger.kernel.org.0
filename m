Return-Path: <linux-media+bounces-47549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B53C77A0E
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 08:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E245D35F646
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 07:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E13333556B;
	Fri, 21 Nov 2025 07:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZZRSvzL6"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011051.outbound.protection.outlook.com [40.93.194.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7602E613B;
	Fri, 21 Nov 2025 07:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763708412; cv=fail; b=bdq+BBmmC71ZBekZU8cfC0rvCioJd83dRzeCXarn+4zYMO4V0XNrREaj9jQWpKl9bBKbDYrOtqNDt2jazYmmwpmZ/23eS40Wljlv8gDqg10kujHTb/8f8oStgZHtH/4k6VERtk26OiM/aem++1l1sLmPkWIh3syynneiDQDLPCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763708412; c=relaxed/simple;
	bh=zo0eeYpRoMI8Y+niRdZ9BqHuox/UMOwlYCx5Vnm73vQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fQVzjk5n7dR0bkuDAfiXuJr8PWLGRdVrFx8UJS0/MMq0tYSzgbRucg/r+duRuKGJBn8LminEfTk7lhICWTQAMSmqA3A7zfLlSDi60ZKq+lKDRwpFhvBO8Rg80Nj4gdIHMD7zmCH0XvUEwq4a/LQ82imPlW2RHemA8UOrvflUUYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZZRSvzL6; arc=fail smtp.client-ip=40.93.194.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NS3/4MtOcEQkaAAk1pzodDDJFgpguIFQPc+j6fczUswRFzRhwyBH9/cOKYFoWzxj31+mGref67abudGW2pghcqcbh9lIHccHUaBUifFYoxHD6xYujkU/DVNjlQBi1KGBL4tve3xZZ1jA6fsZt5w6MM0xJoSE3345VwbMMGkYQIPhU2W4/496mD23hbAhMf1dMIp4+T9DC7iVvfFhhFq4TprMQdGjBrIW1vxt7ZOY/utOYMkODxIzK11ZL/csSHLFl9cefrZnU09F6uhl4/Ku4Ij4b6iv8eTsI1ZUk+wwMkR1pZiAG/H38IiCOZfM4lr4RAh8lEc5Ve5ehQZDQiL9tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMDucU4VXmPgQ77AhWzruNEb2LJfvE0CshzUHdupAu4=;
 b=MoTKbZUQIt1NHo9Rs4DNy/y86eTll+FbsCTq6tNCrCSrzR/hhusEL0+SCaFUQXGoLeSxAq1dRLttzOC+1oPpAEorTYrnD+0FZT+cuXkC/iPfrKh40MJlwX770C8ulxn2YMjcLgtLMSw/ZO43Od11qQYTGrL3wycBR1d/VK1HfueCf4XEKGfZx0Ya5710zVB/8dEmBQNO3BeZyHfl/pbCiG9bwskxhtqE6eDhMY7h0r/fO6bvzpbbIxw/UZkYayAioobAHdcIHvwRg9/R+GpZdJrRJ2yOHDiSC9RdglBE+WzR6Nl8wtPT0Xag+g+MmknATOijNvt712HBm4QQR9AYGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMDucU4VXmPgQ77AhWzruNEb2LJfvE0CshzUHdupAu4=;
 b=ZZRSvzL6bZi6Ar6LpjqxOb3zXwAeas7OKMzrfDeWV2mu7mDk0o4xXTivLx77LRmgWcRyf4XBUrY+SXbchNwv382e7gL5+8pbUF/eA0EYjFdsmmcCqXrVzN2ndtACv1xogqy6TTVB13LXwWqo+hmvCydNr2VS9rc5w2dgsrloFnQ=
Received: from SJ0PR03CA0078.namprd03.prod.outlook.com (2603:10b6:a03:331::23)
 by DS0PR10MB6752.namprd10.prod.outlook.com (2603:10b6:8:13a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 07:00:04 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:331:cafe::e0) by SJ0PR03CA0078.outlook.office365.com
 (2603:10b6:a03:331::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.23 via Frontend Transport; Fri,
 21 Nov 2025 07:00:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 07:00:03 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 00:59:59 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 00:59:59 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 21 Nov 2025 00:59:59 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AL6xrdd842476;
	Fri, 21 Nov 2025 00:59:53 -0600
Message-ID: <a0096484-c2cc-47cb-940d-2bf003a38b1f@ti.com>
Date: Fri, 21 Nov 2025 12:29:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/18] media: ti: j721e-csi2rx: add a subdev for the
 core device
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
	<jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
	<jack.zhu@starfivetech.com>, <sjoerd@collabora.com>,
	<dan.carpenter@linaro.org>, <hverkuil+cisco@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>
References: <20251112115459.2479225-1-r-donadkar@ti.com>
 <20251112115459.2479225-7-r-donadkar@ti.com>
 <aR8L9kIFcRJoWQUi@kekkonen.localdomain>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <aR8L9kIFcRJoWQUi@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|DS0PR10MB6752:EE_
X-MS-Office365-Filtering-Correlation-Id: e1cda17e-1504-4f3c-b9f9-08de28cb98b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dy9NZ3VhTHIyUkxFZDR0Y3Roak5yRC9BSHZVWmlQeU15cTVwaVRFNWpFb1Jx?=
 =?utf-8?B?ZjFnb3luSlROa3hTU2dWbkE1QWdMaXFrZVNTSVZMUkZ0MUU0Q3VFRG5icVRF?=
 =?utf-8?B?bE9FazVpTDM0MUFzMFh6TjY3QWExbHNFNVN0ZW9KbnhRakk2U0dwRjIwTGgr?=
 =?utf-8?B?SUZnRjBJWi9penNwcUNBMEpyMTcxQ0txSThrMmt1T3BKNG5NY2h0NXJpVHJj?=
 =?utf-8?B?WEZHa2VkNUwrRlo4c01rT292YmpvMW9QK045K0VVT2lrWTZka3RDcWVlZEZt?=
 =?utf-8?B?SEFpTVpPeC80eHR5ZVU5QU5YQjNrRW1RUm1zeHlWOU1jMWNCSGM1K3RXUGly?=
 =?utf-8?B?bjlJSmRVeVNSWmlCZXNwSTArMVQydmxDMGtiKzlxOG9Gd29WMUlTWlNKMm9V?=
 =?utf-8?B?M3l2NzIyN3llRnB4eEo4RlNBZFg5ZkN0bDJhMnM4ai9HVXBHOTZieWFOaE9t?=
 =?utf-8?B?MndkKy81dEl2OExiSHVsVFI3Q09hcXgycFNFRXFXOVB2NGkxUWNHU24vYnVl?=
 =?utf-8?B?d3crWmRaRjNCNmZ3TVhURmxESmJzT0FaQlRGcEJ1T2Z4NVVyQnZwKyswcGFY?=
 =?utf-8?B?c21BVDZTT3o1MG5CUmw0UUNaRGJrZ0lrQ0xDT2VEOGFadWdrS093YWxxUmpN?=
 =?utf-8?B?bktmN2dXSnNXNURBRllZZUMwdUZ6aytmZWxRRmVRMXV4RGZZQzhKVTJhMnJr?=
 =?utf-8?B?QnF2Qmp3NHc2SG9IV0IvK3JPeTAwNUlUQjRJWlEyeldCYTBFNGxVTGRhNzRm?=
 =?utf-8?B?YSsyMStWUG1wenNrTnF4MVI1VnBzeGhIeEpraFV4cTZOVXNaSkJXUk9IS2tY?=
 =?utf-8?B?R254VW1PcHl2cmF1QWNiUVdvczBwdExDbzdtSDlCSkdWeTZ3aDFTTVhBTlNF?=
 =?utf-8?B?enQzTFl3b1lJNE5NRzRFTXFDbnk1L0l5VWZqZUNWZWlzL044YkhNc2oyQkxs?=
 =?utf-8?B?UXFvNksrSVljVGRBUFlKYVhiaC94ZXVCb3RCNnBxL0FiZC9aK1BiNEVnM3Ay?=
 =?utf-8?B?dXN2c3dxbjZwMEdpS1lwWERTVGpRcjRjNjRvK01POXAzaHRaRm0xTDV5Vkow?=
 =?utf-8?B?RjhHV2ZtbGZXeTZaWDhRWVE1SGU3RG13WHlJY0k0Z0k4QmN2YnFPT1J6OExJ?=
 =?utf-8?B?N0prMnpkN2MxRXBkZlN3NkpOUnNGKys0OEJuUFppcHdhc2FzUEVBK250Szk4?=
 =?utf-8?B?OGtXblBMbnlaTGpYY1B2NG9YcGYrd3N4ZTZGcDBBSFF3ZmJhNk4xRlI4MFd2?=
 =?utf-8?B?cU81Ylp4bTM2OW9oeEZzNkNCbVp0anFWaHBBODk2ZWwzcGVBSTlub0ZHSU9j?=
 =?utf-8?B?djE0QzVEQUJJR3lxMzhKTlFRRmpDYTB2LzFqbG1GM2JKN2czT0VYc3laYTVK?=
 =?utf-8?B?U1B0aVpVVWZoRDZ2UUx0M0NnQkExcHFQRnFJTjNjNDJWNXdxRUptSVQ1cWN4?=
 =?utf-8?B?MHZEOGxsOVhoTGtEWVNEMHhYOVVyUE5IeVZDUERsaVVmcVgzRjJMNndwbE5Y?=
 =?utf-8?B?T2gwNS83dGVVUGlaUWQvbnQvTFlvWGxOWUY3MjU0ZnVmME9VUnAzcmVEcFEz?=
 =?utf-8?B?NEdOaElZcmxFVlkwTk1YQ2ZUeFNRNXVoWGpvUGhtNVVUamxyNmN1QkpBM0Jy?=
 =?utf-8?B?MmFnTDRrOEdHZFp0M1hUZFBRczQ5cFRRUDI2MjRBak1NOGFFbG1HUmgrMHhS?=
 =?utf-8?B?TTFWM2RGYWtGTERQZHlOcGFreVhZVEhuR1Y1QUNXRTFiK0hHTnBpeXNkRC81?=
 =?utf-8?B?bVkyRmROc0xzUHlTK0lKajFYcEZGSUh5aTBBNmZNUmZianVia3p5aUdQOXp4?=
 =?utf-8?B?WUwrS3JwQmJUZGV4aW1aNVZOY0VWbXNtbUpPalpWNzhhVFlkYUYxdFNteElo?=
 =?utf-8?B?b3BvR0ZrRVZ3VHhXZnhFWHkvUkord2pIbGpVZGkwdVFpVndadkJLYkJkK0Rh?=
 =?utf-8?B?UElPZmhtQW1aamVvdnlHRjUvdG5VK3lubWw5MGxoS0tlOVB4TVRJL3Y2dExR?=
 =?utf-8?B?OEJ6NDBzT3RxNS9sNkhlWWxBenNIQUxGZ05TRkVxRjZRS2FmMW1rV2I2YTdk?=
 =?utf-8?B?aDlXT0Q3ODI3MzdWbWgxRG5xVFk2VGl2MmdsSFFOUDRIT0k3cG1zTHV5OExO?=
 =?utf-8?Q?FAMo=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 07:00:03.7934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1cda17e-1504-4f3c-b9f9-08de28cb98b7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6752


On 20/11/25 18:09, Sakari Ailus wrote:
> Hi Rishikesh,


Hi Sakari,

Thank you for the review.

>
> On Wed, Nov 12, 2025 at 05:24:47PM +0530, Rishikesh Donadkar wrote:
>> +static int ti_csi2rx_sd_s_stream(struct v4l2_subdev *sd, int enable)
> Could you instead implement enable_streams and disable_streams pad ops,
> please, and use v4l2_subdev_enable_streams() from there?


This is done in 08/18, I will merge changes form 08/18 in to this patch.

Rishikesh

>
>> +{
>> +	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
>> +	int ret = 0;
>> +
>> +	mutex_lock(&csi->mutex);
>> +
>> +	if (enable) {
>> +		if (csi->enable_count > 0) {
>> +			csi->enable_count++;
>> +			goto out;
>> +		}
>> +
>> +		ret = v4l2_subdev_call(csi->source, video, s_stream, 1);
>> +		if (ret)
>> +			goto out;
>> +
>> +		csi->enable_count++;
>> +	} else {
>> +		if (csi->enable_count == 0) {
>> +			ret = -EINVAL;
>> +			goto out;
>> +		}
>> +
>> +		if (--csi->enable_count > 0)
>> +			goto out;
>> +
>> +		ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
>> +	}
>> +
>> +out:
>> +	mutex_unlock(&csi->mutex);
>> +	return ret;
>> +}

