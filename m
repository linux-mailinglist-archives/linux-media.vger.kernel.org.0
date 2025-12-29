Return-Path: <linux-media+bounces-49634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 224FBCE656D
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 11:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D18B3007ED5
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 10:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3E626CE34;
	Mon, 29 Dec 2025 10:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uMYmQvUG"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011051.outbound.protection.outlook.com [40.93.194.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1486B8821;
	Mon, 29 Dec 2025 10:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767002860; cv=fail; b=DuS01KXmW1+JIVQ34tMIFsIc2xui0THNUzbU337UEwGEYOi8JEqw9z+VwBo2nJLU03DWqt12FO3FPN9E5+j8G+JTe5Ugv6cJyuBpQvgRPK5QAwexzjm2WIIJFBqhGMMEopXwWcDsz00xAyoridcAGqHS42/ZPnj4vS23IIUn8bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767002860; c=relaxed/simple;
	bh=iZLlVISsiYzL3Qp49afxjMY7S48uSkI/iv2coIv9FOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TGTt5RQ1BC0rxhUqNxy+dqDSCO9v52x9ObcbbuYUeilrjp25sRzEkcc/nAOrP3fB9K52mrMwJk/80Jw0a/cUgnjC1PMMsODSyh7g4Cf1FPmfVHPx8BXUdl4/bh5LHaz6ASJvr3oWbk59uvf5NiX/zhyZmGrbR3/ZnSR7yluSY9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uMYmQvUG; arc=fail smtp.client-ip=40.93.194.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPahoms/87Yvif/0DzvzeNwX9DuBPqKf4XMfUPEtDVelIz6O5N1VA1tQSpPs34c4KVMlzA4+jndDz//wj1BjXpjs91keUnSa68Fdjl9cv5YsFoh3ND5f9Uxt2o8ZRHRrOzNI/aWAUerjGlzWV3FZjhpXhkK6AhtpotY3EdQ8epT6z95U7c+cyY8KoUY9tLfhmDe3iAP6tgXJ9d7odByHp2gOqRyS0py8684XrNZIZkR9MvjEgvNNFcoKme5TnCXk7w7rwF6CkqUkNOlHr2C5TD4UxLMxrIs6B7hukmaf9UNUsKAjdG12+trkIM0tHvxXu4+r8Llx+/ZpmDxwyesFMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pf5kGQMKtHj6lbUDZ4tWDT43pA7M6euTMuQdzxB8ZJ8=;
 b=a8S2sylW1hLIb8sST26LXLGXX9p1rW6+vVemvZhAFSccmoTkueKkvxRjehYbb6CT3l/LcBE5YWPdsScone94n2wtXAZwmdfhMIQnpdThb9wqy9ZsJ276CJoIAN+juthTqM2D2OXnSB7MYBrpp6ycHjCWuy5utSWzjEksMk/DZRDLnQSJGwzUbIDPS+ppDR7G9ZoC1wRUAFLUIcrUQPlJ7WNPga7G56Yw65leEgjUbkLE0RIy1JpU7+ZLoiMEcPff025Sh/kBGVP89iN0aFI9OfQiaG6XS2fH1CVV+b8qzEsAccnE7T/wO5woPfNqgejdyFWTzyt1U1XWiKqhnerBrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pf5kGQMKtHj6lbUDZ4tWDT43pA7M6euTMuQdzxB8ZJ8=;
 b=uMYmQvUGmIOOFc5gQoCW8TTp2XLK8ZPRWTjTWztB/h8Uuu1KkuWsl6aIlODQtRA9XMMWIDKOLMkMI6rq0cPianY2OsKn5eC08lgz4rwg7I8kSAXO7scnx/XE6lkN4UZLn4Hxfy59nr4brOnB7UWkIJeCMjEMPlt92hENsE/g79E=
Received: from BY3PR05CA0018.namprd05.prod.outlook.com (2603:10b6:a03:254::23)
 by CO1PR10MB4466.namprd10.prod.outlook.com (2603:10b6:303:9b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Mon, 29 Dec
 2025 10:07:35 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::1f) by BY3PR05CA0018.outlook.office365.com
 (2603:10b6:a03:254::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.2 via Frontend Transport; Mon,
 29 Dec 2025 10:07:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Mon, 29 Dec 2025 10:07:33 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Dec
 2025 04:07:27 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Dec
 2025 04:07:26 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 29 Dec 2025 04:07:26 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BTA7KOP3220205;
	Mon, 29 Dec 2025 04:07:21 -0600
Message-ID: <facbd20d-15ac-4aed-a95c-dacc0076ae5f@ti.com>
Date: Mon, 29 Dec 2025 15:37:20 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 17/18] media: ti: j721e-csi2rx: Support runtime suspend
To: Jai Luthra <jai.luthra@ideasonboard.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <jai.luthra@linux.dev>,
	<laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
CC: <y-abhilashchandra@ti.com>, <devarsht@ti.com>, <s-jain1@ti.com>,
	<mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<changhuang.liang@starfivetech.com>, <jack.zhu@starfivetech.com>,
	<sjoerd@collabora.com>, <dan.carpenter@linaro.org>,
	<hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20251112115459.2479225-1-r-donadkar@ti.com>
 <20251112115459.2479225-18-r-donadkar@ti.com>
 <032b441e-eefc-4574-bf7a-5c4d09599925@ideasonboard.com>
 <176517937821.20066.4604793543801654609@freya>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <176517937821.20066.4604793543801654609@freya>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|CO1PR10MB4466:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ae8116-8be8-462b-0dec-08de46c2159d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NW9mZ1YzMWxUWjM3MUtoUkRPdy84dzhrTzlud1RPSTlJQXJ1RVNpUVdkZkVM?=
 =?utf-8?B?em85a3RST2I4QUw0UmU5b0JwOTBsRWxCU2t3VzB3UWl6MmkyejhxMFBGd0VV?=
 =?utf-8?B?dmRGYUNONUc1MkozeFJjVEZJNUpLZzFGeDVla2hpWitYVFZjSGF1T3RnNlpl?=
 =?utf-8?B?UXRicE1pV3habEdQQkRuSVpkOUcydTJOalpFWmlFYlRyTEZobUNzKzRFeENC?=
 =?utf-8?B?dXYrRnhTc3h0TkMwVjhuOG9Sbk9QMkpJQ3N0ajJYSzg1MzRiL3pEZUlhaWRI?=
 =?utf-8?B?YmorbElTeGF2TWRDdk04UFlFaEo3aU5CTTh1ZFgxbjVYckNMZjcvMUtQQjNh?=
 =?utf-8?B?SFc0U0pOYkM4R0xJRkFZd0ZGRFNLTHlEU1pFYkFZZ2JGOVBjRTlyY3o1Uitr?=
 =?utf-8?B?bUYxZkZkWjFTQmF1Q2o2aWY1UUxrTy8vWlUzNVp0TjhqK081TDZyZVpvdWVN?=
 =?utf-8?B?YnRjQXBSdjFmOHFPTDlaM2tyUzF3ZE9NQjk1VkpXZGU0UG5WeUNXekdJamxC?=
 =?utf-8?B?ZG1Kb3k2QWYzY2hhRUFueXp2cWlPTndSVWpSTndYWWVXL0pTN1pEaDlwejBx?=
 =?utf-8?B?TnFURmtQaS9UNVBOdkVaVnJnbGdGckt3MWM1QlV3VGhyb3hJOHJtYUxkWmJ5?=
 =?utf-8?B?bUwvNHRvbTJpTnk3Tm90M1BmRHdHczJFLzJrbldYQ1NBRjZIOTltbDNuU3By?=
 =?utf-8?B?dGwvaGx3MEZGbytiVDZOdkFWMzdmOElEdUNyeUN1Z2g1anNzMmF1amZocWRS?=
 =?utf-8?B?T214ZXFQRGN3TFNNQXRwYXRjWi8yemYxOHFWOTBDL0l6STJFak10TmZwRGZ3?=
 =?utf-8?B?MDZGS201UGxNMkUzNUVZVlRqUDViS2lldHgrdE1tNUN3dUoyQkpOVzRYTVZP?=
 =?utf-8?B?NTBkS281RG1BaEoyVUI3NzIyNXMrbndDYWhuOEl2M2ZGVFJzVC9ucC9Xb0RR?=
 =?utf-8?B?L0QzdDJLTFdkWi9ydVlPbXZiM0trMjd0ZXBES1BrMHlOb0daUUxWOXVIVWkx?=
 =?utf-8?B?dXpJcGVoQ094SU52MG44K0ZwUytDSVY1ZFZlcE5veHlJb2hQTUVjc1NSYmsx?=
 =?utf-8?B?YkhQd080Rk9uSC9jMXIrRWZDZ3d4Z3oxNkhpeHpsdUp3QytNTkZXcTFLejZt?=
 =?utf-8?B?dVFQQ3NzODhUemkvUnlUTjdwSnBhRWVmZFlFcTZIdkozcncwaXNQNjZacTFR?=
 =?utf-8?B?ZnAyQlRIdHorbzA2NE94TXJRN2hJWlFiMHF2Mkl3WXNVSlF2VXZjaElTd3Ix?=
 =?utf-8?B?L1I0Mlg2QjR6czdwaHM5NElHRDhxbU5CMndLclY5d3ZpTmZiM0FKN3FnOVNO?=
 =?utf-8?B?UTRHa1dxVTljNjIzMG4rYmNpazlpZVdiaWRzZjRTK1FUd083UWRVdXY5bnZF?=
 =?utf-8?B?aWF2N25OekFNZEdWSDBzRGFsNGZLOXlkU3RWdjhDektmK05NL2F1VzREWk5M?=
 =?utf-8?B?a3lTcDBaeGVJZWVydkdTd0lUNlgraEJHaUNtQ1hZQ0poOWZobE1ibytKUnRl?=
 =?utf-8?B?Y0dlMkZPNk5SZVdydWJWejV6R3VJMnI1UFFKUkRqVllUR1paeWtYdlpHSUpk?=
 =?utf-8?B?Z1lYRDNOQ1FmcDFpSmxNU1RheG9xQ0JrS1ducmJvNGY1a1RaZDNpQUNWaDFI?=
 =?utf-8?B?SFc4dzB6QlZQSXFHQ0p0cHBWQkIwcTNWVWluRExzMEdSRWVZU3pFRHFoZWlz?=
 =?utf-8?B?N0xCTlkrVzdnUmFPQUpCQ05yWXl4a3hxcitPdlRVSjd1L0xtYWFMYTRPWlNl?=
 =?utf-8?B?ekw0TFNZZWlDNDF5dWhScWFWb3NWR3YrYmRQU3crTDlmY0FRQVJvZTlMQkIw?=
 =?utf-8?B?dE1EK2c5dGE3QmVleEtER2lQekRjdk4rMGFXTkVBRWt2MVFQZzJTMDFiRDVE?=
 =?utf-8?B?cGxFeTJrYno5aSt0NlBoblcyKzNpSEg2a3RkV01PMkpUUjJtWk54OUtnM0dh?=
 =?utf-8?B?L0xHQ1NqZWRzeS95QytGUEk5OVNDM2pqeG1lZ1JMMzRubW85OVBTSlZaTWly?=
 =?utf-8?B?R2Nvelh0U3BCRzU5ejM2Ny9ueUJyc3hLWmJ3eGZTcHB6WHNWL0hYanJNbEti?=
 =?utf-8?B?U3o0eFNFS3lqeUVOR2pWNDFTdFQxenN5b0pmeGZ3blBNVElxTmNZWFhUdk5H?=
 =?utf-8?Q?yK1k=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 10:07:33.2623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ae8116-8be8-462b-0dec-08de46c2159d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4466


On 08/12/25 13:06, Jai Luthra wrote:
> Hi Tomi,


Hi Jai, Tomi,

>
> Quoting Tomi Valkeinen (2025-12-01 18:52:36)
>> Hi,
>>
>> On 12/11/2025 13:54, Rishikesh Donadkar wrote:
>>> From: Jai Luthra <jai.luthra@ideasonboard.com>
>>>
>>> Add support for runtime power-management to enable powering off the
>>> shared power domain between Cadence CSI2RX and TI CSI2RX wrapper when
>>> the device(s) are not in use.
>>>
>>> When powering off the IP, the PSI-L endpoint loses the paired DMA
>>> channels. Thus we have to release the DMA channels at runtime suspend
>>> and request them again at resume.
>> I'm not an expert on the dmaengine, but to me this sounds like a bug in
>> the dma driver. It just sounds very wrong...
>>
> Cc: Vignesh
>
> IIRC this was done because on AM62 the CSI2RX is on a separate power domain
> and it uses DMA channels from the system-wide DMA engine.
>
> And as those two drivers have different set of users, we have situations
> where CSI2RX goes to runtime suspend state and turns off the power and
> clocks, while the DMA engine remains on as it has other users. This leads
> to the paired PSIL channels to become invalid, and needs a re-pairing.
>
> I am not an expert on DMA engine APIs to know how feasible it would be to
> do the book-keeping of the power state of various devices in the DMA driver
> and manage the re-pairing entirely there.
>
> On AM62A and later devices, there is a dedicated instance of the BCDMA
> engine for camera pipeline on the same power domain as CSI2RX, so this is
> not a problem. Rishikesh/Vignesh please correct me if I'm wrong, as it has
> been a while since I looked at this in depth.
>
>
>>> Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
>>> Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
>>> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
>>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>>> ---
>>>   drivers/media/platform/ti/Kconfig             |  1 +
>>>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 55 ++++++++++++++++++-
>>>   2 files changed, 54 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform/ti/Kconfig
>>> index 3bc4aa35887e6..a808063e24779 100644
>>> --- a/drivers/media/platform/ti/Kconfig
>>> +++ b/drivers/media/platform/ti/Kconfig
>>> @@ -70,6 +70,7 @@ config VIDEO_TI_J721E_CSI2RX
>>>        depends on VIDEO_CADENCE_CSI2RX
>>>        depends on PHY_CADENCE_DPHY_RX || COMPILE_TEST
>>>        depends on ARCH_K3 || COMPILE_TEST
>>> +     depends on PM
>>>        select VIDEOBUF2_DMA_CONTIG
>>>        select V4L2_FWNODE
>>>        help
>>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>>> index 528041ee78cf3..21e032c64b901 100644
>>> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>>> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>>> @@ -13,6 +13,7 @@
>>>   #include <linux/module.h>
>>>   #include <linux/of_platform.h>
>>>   #include <linux/platform_device.h>
>>> +#include <linux/pm_runtime.h>
>>>   #include <linux/property.h>
>>>   
>>>   #include <media/cadence/cdns-csi2rx.h>
>>> @@ -963,12 +964,16 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>>        unsigned long flags;
>>>        int ret = 0;
>>>   
>>> +     ret = pm_runtime_resume_and_get(csi->dev);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>>        spin_lock_irqsave(&dma->lock, flags);
>>>        if (list_empty(&dma->queue))
>>>                ret = -EIO;
>>>        spin_unlock_irqrestore(&dma->lock, flags);
>>>        if (ret)
>>> -             return ret;
>>> +             goto err;
>>>   
>>>        ret = video_device_pipeline_start(&ctx->vdev, &csi->pipe);
>>>        if (ret)
>>> @@ -1024,6 +1029,8 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>>        writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>>>   err:
>>>        ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
>>> +     pm_runtime_put(csi->dev);
>>> +
>>>        return ret;
>>>   }
>>>   
>>> @@ -1055,6 +1062,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
>>>   
>>>        ti_csi2rx_stop_dma(ctx);
>>>        ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
>>> +     pm_runtime_put(csi->dev);
>>>   }
>>>   
>>>   static const struct vb2_ops csi_vb2_qops = {
>>> @@ -1261,7 +1269,9 @@ static void ti_csi2rx_cleanup_notifier(struct ti_csi2rx_dev *csi)
>>>   
>>>   static void ti_csi2rx_cleanup_ctx(struct ti_csi2rx_ctx *ctx)
>>>   {
>>> -     dma_release_channel(ctx->dma.chan);
>>> +     if (!pm_runtime_status_suspended(ctx->csi->dev))
>>> +             dma_release_channel(ctx->dma.chan);
>>> +
>>>        vb2_queue_release(&ctx->vidq);
>>>   
>>>        video_unregister_device(&ctx->vdev);
>>> @@ -1512,6 +1522,39 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
>>>        return ret;
>>>   }
>>>   
>>> +static int ti_csi2rx_runtime_suspend(struct device *dev)
>>> +{
>>> +     struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
>>> +     int i;
>>> +
>>> +     if (csi->enable_count != 0)
>>> +             return -EBUSY;
>>> +
>>> +     for (i = 0; i < csi->num_ctx; i++)
>>> +             dma_release_channel(csi->ctx[i].dma.chan);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int ti_csi2rx_runtime_resume(struct device *dev)
>>> +{
>>> +     struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
>>> +     int ret, i;
>>> +
>>> +     for (i = 0; i < csi->num_ctx; i++) {
>>> +             ret = ti_csi2rx_init_dma(&csi->ctx[i]);
>> If runtime_resume always requests the dma channels, is the call to
>> ti_csi2rx_init_dma() in ti_csi2rx_init_ctx() needed? If not, you could
>> inline the code from ti_csi2rx_init_dma() to here and also drop the
>> dma_release_channel() call from ti_csi2rx_cleanup_ctx(), making the flow
>> more understandable.
>>
> Makes sense.
>
>>> +             if (ret)
>>> +                     return ret;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static const struct dev_pm_ops ti_csi2rx_pm_ops = {
>>> +     RUNTIME_PM_OPS(ti_csi2rx_runtime_suspend, ti_csi2rx_runtime_resume,
>>> +                    NULL)
>>> +};
>>> +
>>>   static int ti_csi2rx_probe(struct platform_device *pdev)
>>>   {
>>>        struct device_node *np = pdev->dev.of_node;
>>> @@ -1579,6 +1622,10 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>>>                goto err_notifier;
>>>        }
>>>   
>>> +     pm_runtime_set_active(csi->dev);
>>> +     pm_runtime_enable(csi->dev);
>>> +     pm_request_idle(csi->dev);
>> I always forget what exactly the runtime_pm funcs do. What's the idea
>> here? If you do something else than the plain standard
>> pm_runtime_enable(), I think it's good to mention what/why in a comment.
>>
> https://docs.kernel.org/power/runtime_pm.html#runtime-pm-initialization-device-probing-and-removal
>
> The pm_request_idle() is done to queue up a job to suspend the hardware
> until userspace starts streaming, to save power.
>
> The runtime_set_active() is used because the power domain for CSI is by
> default turned on when system boots up. But Rishikesh, please double check
> that before v9 on AM62.


I checked with AM62 when booting up, with CSI drivers being probed/not 
probed. The device state was OFF by default on boot in both cases. So, 
plain pm_runtime_enable() should work. That will simplify the 
dma_request/release_chan() calls  in the runtime suspend/resume flow.


Thanks & Regards,

Rishikesh

>
>>>        return 0;
>>>   
>>>   err_notifier:
>>> @@ -1609,6 +1656,9 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
>>>        mutex_destroy(&csi->mutex);
>>>        dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
>>>                          csi->drain.paddr);
>>> +     pm_runtime_disable(&pdev->dev);
>>> +     pm_runtime_set_suspended(&pdev->dev);
>>> +
>>>   }
>>>   
>>>   static const struct of_device_id ti_csi2rx_of_match[] = {
>>> @@ -1623,6 +1673,7 @@ static struct platform_driver ti_csi2rx_pdrv = {
>>>        .driver = {
>>>                .name = TI_CSI2RX_MODULE_NAME,
>>>                .of_match_table = ti_csi2rx_of_match,
>>> +             .pm             = &ti_csi2rx_pm_ops,
>>>        },
>>>   };
>>>   

