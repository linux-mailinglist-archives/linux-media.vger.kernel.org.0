Return-Path: <linux-media+bounces-50190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA627D0126E
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 06:41:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75974304D84F
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 05:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F7B25F99F;
	Thu,  8 Jan 2026 05:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Kn7mGMnK"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010000.outbound.protection.outlook.com [52.101.56.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FE1328B5C;
	Thu,  8 Jan 2026 05:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767850694; cv=fail; b=et7sE0k2doq6HP1cxjuCeMOXK9Agqv5IlbFfkT0FKHK7fzBhOFRC0NI3VidJ7NgpJNmrFzg177DosWMA9biV0excMahFBvZ7fFmYzmcUZ6T63UuXKRY/oPAONYLOrY61PhKsueJl8gOL6UQXGUgLuPQKkqCGp/ee0qTgTdHNRl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767850694; c=relaxed/simple;
	bh=4HEWsCRkpETzrnxQdTMDIDQc7Uy/g7epLkQ3zdLTNkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DdNcyb4718QbTHVuqx0qiDiW2R/pbyJtYglFr+5e9igcPTjITmFzjYOp9FbRTUTcQvOr2TtxklyPS4DhbF8LrMbVVLdVMQTSxDdg92ciTPE9m6o4p42CCp7s3ioP7g/ni4Lsp1+mtGRb6mwwqt6uSL+U/v9qAs73qMSR0rnQ2to=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Kn7mGMnK; arc=fail smtp.client-ip=52.101.56.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPW9A8/WuiigYzdL7jAULYAStOltUax93icooxJ49WDMXOavZiFSfOzzT3jKnW56sXxk31CrqkIPHn6+wHgtdO4rd5pM0uYmMGd1pLfPkcYZuCFODPBspIAkEAW0BOuuid2Wudqj+2E2Xyv/izb45RShzVEGpKFPJ5PBvaFQ2+QwGQZ9cW/7QN9ynCmRufisduppkjOhh4tvfoNC+Xy/tamDe+uIkZm4eluEeh/hKZvUsXYG9SqS944tntP/a+Yxpma5gnZbkGCSuD+UpB9+fr9Hy8h3AhMVEehkXChUVCMKuOqGQr6AwDkiXI1xmoKB0sOETS5skW737NiWXBpj0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6/fTVRfCvquEhwN33ZBNE8glqbEzgMqhxAVjOcSmD0=;
 b=fiizC+L1fTn5fHNWTs9BcoxENCBSxjgI1YhDzSPojDR/RCjeDqml059mg8oqFCRqDfkLZRVOAsNFwKbQgBziQPa599V3MTBv8kZD2NG+p1ocbse+vSb9QJcaMg45SPXB+5c6gM/feCErebvRgY4DxkwzyMBzclXi33FR29Lx5ZPCbWRKMlBi5gVJORd2kVmjMg5TephkJ1uBC/W8+w989bPwyym4fg7yOXbob10UPkhTcVnoajuJwGFz1aZKo6jXlewziwEiUAVSrWeV2eIB6odBFewAUgnwA5PjdmqhFAERD4/Y9yvLDbMHvGnzxRmQ2d3PPEwmmAxiFgSIfc7WLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6/fTVRfCvquEhwN33ZBNE8glqbEzgMqhxAVjOcSmD0=;
 b=Kn7mGMnKN9OVtDv6qF3A/qwGpQkFuvybZraw8lu1xY0g3+keozIvfkl4lnpLaFRKxA11jtWUAYtVLgShcPgLMl8KqRMxAfc3xPqbiEJ80jDAoAnlW6gCu5EK2lOahuOoJjdh+uaivWQBSz83O1c8TePW6Gep9DGpQOf3cfgqFeE=
Received: from CH2PR11CA0012.namprd11.prod.outlook.com (2603:10b6:610:54::22)
 by MW4PR10MB6438.namprd10.prod.outlook.com (2603:10b6:303:218::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 05:38:04 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::8d) by CH2PR11CA0012.outlook.office365.com
 (2603:10b6:610:54::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 05:38:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 05:38:03 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 23:37:58 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 23:37:57 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 7 Jan 2026 23:37:57 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6085bpkD1947872;
	Wed, 7 Jan 2026 23:37:52 -0600
Message-ID: <997b6e05-9621-4860-b310-b588312c457d@ti.com>
Date: Thu, 8 Jan 2026 11:07:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 16/19] media: ti: j721e-csi2rx: Return the partial
 frame as error
To: Jai Luthra <jai.luthra@ideasonboard.com>, <jai.luthra@linux.dev>,
	<laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>
CC: <y-abhilashchandra@ti.com>, <devarsht@ti.com>, <s-jain1@ti.com>,
	<vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<tomi.valkeinen@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
	<jack.zhu@starfivetech.com>, <sjoerd@collabora.com>,
	<dan.carpenter@linaro.org>, <hverkuil+cisco@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>
References: <20251230083220.2405247-1-r-donadkar@ti.com>
 <20251230083220.2405247-17-r-donadkar@ti.com>
 <176769815259.1604677.2330177800630667072@freya>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <176769815259.1604677.2330177800630667072@freya>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|MW4PR10MB6438:EE_
X-MS-Office365-Filtering-Correlation-Id: bc96737d-db08-406e-31b9-08de4e7817a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|34020700016|34070700014|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YURGYkI3Yk1CTlhmN2JHU2JUM0VwOXBmMW9WVG9IYXIxMU94UXhlQmt6OTdk?=
 =?utf-8?B?NkJUTDVVWVd5bFNDeDhwYkI0R2pIbkJEZ2NHa1d1U05LNnFDM0ZWU0ZHelZX?=
 =?utf-8?B?UE9zdDVhL0RZd004eDZLSzBnVlBaNS8vZ3BuOTJTTVFqMXdQOTVLcEVjQUJS?=
 =?utf-8?B?M3BuYW1TUmdRNmR4T2V2VTFuY0pMS0FWL0NLSzJNMGdqWDZxdnpkd21KVnlU?=
 =?utf-8?B?UXNLaHBRcHJzcmEzSWJWcUN4TFMvaFRHSTBTczZma2tjNm9pUG9VSkM3ZDVO?=
 =?utf-8?B?VU5FNElYRE5VTG1Dbm5NaDdOamZ6TUF5aWt5b1djd0p5cys4RlBMNytoMU9U?=
 =?utf-8?B?YjNEbThCcU1ZL2NwdTFZVWE4UzlLNFJaZE1NWmhIYS9Ea0poSTZlM05aclFG?=
 =?utf-8?B?UWExdGdhVHhPUmhVQ2FoaUt1UkRhYlJtR29RRDBnYlNOWHRwUUNVVkU5Vzgz?=
 =?utf-8?B?Und0ZFFJaEI3d3VWSGpVSm5nbWNCbUNSME5PQmlibjZxVHZrUDRZaE83L0RG?=
 =?utf-8?B?cDc4dTBNM0M2dTgrd01sQk9iRWJjeXhGR1RUbDcxcVA2bm9sRW1EaWFRekNU?=
 =?utf-8?B?U1ZPNzU0TG9MaG5tQ2lWQ2RjbEk3ZjN0UHVScEszN0hONCsweDBvcWtsT3hZ?=
 =?utf-8?B?cEpqdnlnRFNPNVlDMldMMlFlbCtTb3Fkcm4wakcrZEkyWTlzclh1OWo4bVRr?=
 =?utf-8?B?bHZwd0lEZWJYZ0FaV2g1S1o3QUcwQ0N2SkxKSkV3V1B2R3hLd2pmV2NESXZM?=
 =?utf-8?B?djNtUFFxRXE3VGl5czFmTWpjSy91dXhpQVA3WlR5UHBXZlBjL3ZWRnBweC9W?=
 =?utf-8?B?OUxHdXRVYUF1anZJa2dLbnBtUFlMSFB4Zi9rNG9HUnBSTHJ6R0FVVDQ2TVlq?=
 =?utf-8?B?YXlyWGgyUXJTZFNveTFCd014REhqMUhKMjBDUi9tS3RBVUZLNWpHZEh4Qzdx?=
 =?utf-8?B?RFNyaFNXN1dEbXliODdNZGdTU3BjZ3dZZElxOWRNR202QXNjdkMwcGJqSE9U?=
 =?utf-8?B?VkVpWmJSOTlCQjRteXk0QldNTWV2eXY3VENIS3NXUHlBQStCL2pDbHhiMWd2?=
 =?utf-8?B?Tkx4WEc5dFBzc0RXRWNPMDM1aTRDK25WZEEwRjdad3B6Zng0MWthWFJKeFZO?=
 =?utf-8?B?a3hjZEorU05lek12d2IyTEJRQTJuNXhYNmJjZnU4S2FCd2VHS2dlaEluRmli?=
 =?utf-8?B?dFBTa3Y3eG9rckExODBCQUkrTTdNb2VTOXZBcVkyVGRPVDFxZVRETzIzOE1S?=
 =?utf-8?B?SnBUSnFMYitZRWtxZkIwY2RlSDh3bVRQK2hPNkZjUnY0REptRjBCY242NDMz?=
 =?utf-8?B?VmJBT3oyemw3cWZzWi83T1h5c3RQZU1LdEhmUG1HTnpDM2FmZnd2cnFpTDBp?=
 =?utf-8?B?TmVoak9NUGhaN2d4WlZmdUdnTUhTZlpaZ3pBeWMvRTNFQW0yWElya0YwZkI0?=
 =?utf-8?B?eCtpbUMrU2YxRUdJNHQ5QW9YbHptT21KbWU1RWRzM3dkb1hSdHZmdW9mSW1l?=
 =?utf-8?B?ZmZrQUFxTVRpeXJ3L2NzSUZJSlVTcVRaUkdCQ3Bybk4yOFNJVFRMUFlpTDI5?=
 =?utf-8?B?alpDWTVIYnRkNUxrUjFKSVZlR2YwbjBEdWhmZUVwRy9NdE96cWFlQzhRUm9q?=
 =?utf-8?B?ODkycFNDSm9LaUREdEh4Z1JvaXQzbnp6Z1VUSWs3N2xnaTJtL1E3RVpUWWFG?=
 =?utf-8?B?bEhXUDVHSG5WWEtic0V2RVhRaUdMOFkxaUFYUldSUHFOYzNiKzQ0M2w1eE9N?=
 =?utf-8?B?d0ZEL0txdVJkMkhxUVNvVHY2eVhTWTdDWjI1eTlucEU0UVZDQkNmN2FzWG9y?=
 =?utf-8?B?c25PaTdVczJhc3YxOUZWSFBNdUp4QkUzTjFwakZqb0ErVzF5T3ROT05KRUcr?=
 =?utf-8?B?alRoZU4rdEVjMUtLWmJtQ3B5aHpFVXRMd2NzdTU2emYxTXBjSjE5dE16bUVJ?=
 =?utf-8?B?bWduc0dOMktoNHJJZy91N1AvZEhWQXdOWGN4RUlteVpnd2FMSFJpTExpdzJh?=
 =?utf-8?B?Y1hUMEJDZ1U2Y0ovR244WEQyTDNQMFBIMk5ZMVZIUndHNk5ydzRIWjRLbGx1?=
 =?utf-8?B?N2xLdjgzeEdRNkUvakNFNDFUSVIvMzhQQTRzTG5GbnpOR0Q1amFJRXVoc2VE?=
 =?utf-8?Q?0+X4=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(34020700016)(34070700014)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 05:38:03.2108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc96737d-db08-406e-31b9-08de4e7817a7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6438


On 06/01/26 16:45, Jai Luthra wrote:
> Hi Rishikesh,

Hi Jai,

Thanks !

>
> Quoting Rishikesh Donadkar (2025-12-30 14:02:17)
>> After draining, when a buffer is queued to the driver, ti will fill out
>> the buffer with a partial frame as some part of the frame is drained.
>> Return the partial frame with VB2_BUF_STATE_ERROR.
> This should be squashed with the previous patch which changes the drain
> architecture and leads to the partial frames. So for the combined patch:

Will do.


Regards,

Rishikesh

>
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index e713293696eb1..3922bd67e78da 100644
>> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> @@ -83,6 +83,7 @@ struct ti_csi2rx_buffer {
>>   enum ti_csi2rx_dma_state {
>>          TI_CSI2RX_DMA_STOPPED,  /* Streaming not started yet. */
>>          TI_CSI2RX_DMA_ACTIVE,   /* Streaming and pending DMA operation. */
>> +       TI_CSI2RX_DMA_DRAINING, /* Dumping all the data in drain buffer */
>>   };
>>   
>>   struct ti_csi2rx_dma {
>> @@ -728,12 +729,20 @@ static void ti_csi2rx_dma_callback(void *param)
>>          spin_lock_irqsave(&dma->lock, flags);
>>   
>>          WARN_ON(!list_is_first(&buf->list, &dma->submitted));
>> -       vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>> +
>> +       if (dma->state == TI_CSI2RX_DMA_DRAINING) {
>> +               vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>> +               dma->state = TI_CSI2RX_DMA_ACTIVE;
>> +       } else {
>> +               vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>> +       }
>> +
>>          list_del(&buf->list);
>>   
>>          ti_csi2rx_dma_submit_pending(ctx);
>>   
>>          if (list_empty(&dma->submitted)) {
>> +               dma->state = TI_CSI2RX_DMA_DRAINING;
>>                  if (ti_csi2rx_drain_dma(ctx))
>>                          dev_warn(ctx->csi->dev,
>>                                   "DMA drain failed on one of the transactions\n");
>> -- 
>> 2.34.1
>>
>>

