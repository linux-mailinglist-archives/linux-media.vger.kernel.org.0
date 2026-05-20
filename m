Return-Path: <linux-media+bounces-62213-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPdTGBxkDWquwgUAu9opvQ
	(envelope-from <linux-media+bounces-62213-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 09:34:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 845EC588FEC
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 09:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A1CB030210EE
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 07:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5D43793CC;
	Wed, 20 May 2026 07:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tf8duYi2"
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011005.outbound.protection.outlook.com [40.107.208.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E494371D15;
	Wed, 20 May 2026 07:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779262481; cv=fail; b=j3oU3aK8Gi+nt9MtZBTlTeJQjTwQf0WjiA0EezUiGv7ldSBrS7SASYTWP/D/+XQH46X9wzZxzIHXSs/nVReomOZtSyBCn0YLv5QWLk6h02cTVcfdSIAgiB008EPEly6ckSqmTcHdLKvYY5pIUVg9nn2DHrSaCVFRDa5TNj00SEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779262481; c=relaxed/simple;
	bh=SSPvnnzFMGOQN9hWnnEeGEbsaYLsfbDm/u3Yu/ffE3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dnb0b4NVjpknbHQMjoIrYKtenH+aR5x7/BzHlJXlycHTfTEBjh7vwj+v/SSXCq3ObE377Hq6HjeWRoh1SAcV3WLlc7OG1WCSo4QvDm7ZyggIysSBUg5eDN01fGgvFiSwlmU2B0I8BVtgc1ygBj7RQRLrpRwMvfKmKEDorPslyEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tf8duYi2; arc=fail smtp.client-ip=40.107.208.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLhmcBESSnhr8AJz5houl1kdlGXYVtQCHq1JIiU/8Ml+8tbaHzHUvKPrYGPkclUTMTB7v3MZKc91LkEMvzsHK4GHRo7RP9eGMaQNDIwjF7a5VCV7XBvkD4SBAN6sBNDnjrSt1TeNs/hWTr6LIbvMQQMIzaymjjZ8rTW63xEJ+/kXe89F+dCoE0cpB0sXsekcP48FXwsrVLFGu9ISxlDlH1xbHbMws0WVcDvVQY2hgv4lVQqa6zaglYZR0PixNcYhASr4JrbSg+Xpaw45WQ8k0veNvVn9RGVW9NK78AUSOZumXlQViUKSic9VllwZsW6pvetgNB29kYLlIZQ22E2XuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bT63RlaAEOAex9WhyhkiyIO0JZdglVaRjudYc4hM3lw=;
 b=AiimN+OCar7ulA4U3599JMiTiTTzubwQcalKae57omFBHSpRD1ODSSQppQx0J49igLJKtCTUoeHGxReKk/A+tCYDOtdBHpSsbjU1odv9yfFnTf2tqGqPotEa8oTmnLSWLaq3aG9xhsv2nfPQQ3Vp5ULLHuqc954FGZkUenVfWDOEhnkMh6I+HBX7cRGbxElQWmfZuT1EZa0aveuOgs862my4QJJ+Uw/vbRzrFdr9xYwKrzim6ptZCeVvJF/NFjJtH5LFivxLnrVgm+oaY46vAef+gCi2yct+4i2Nxi6m6lhxCCCZ3cxcU3U9CVGXsn88xgVHWWArhXPfd07PNX9SBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bT63RlaAEOAex9WhyhkiyIO0JZdglVaRjudYc4hM3lw=;
 b=tf8duYi2Ntzkb3cYNBTv08eYMmRSAkAggLv9EDArbO97pEAh+BGi3qzQqnGIS/oAh6jd4ZqfSQJY1pC1/GaBF0Aw+k0u/smS/7kApCwy/RLbaqnAkXZa08wjVGTgfmbHzQ9TEcmEIp1OE5wRd6TaSkePlmP25oV7PbwZ+l1aOno=
Received: from CYZPR14CA0007.namprd14.prod.outlook.com (2603:10b6:930:8f::13)
 by BN0PR10MB4997.namprd10.prod.outlook.com (2603:10b6:408:12b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 07:34:26 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:930:8f:cafe::48) by CYZPR14CA0007.outlook.office365.com
 (2603:10b6:930:8f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 07:34:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 07:34:26 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 02:34:24 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 02:34:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 02:34:24 -0500
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64K7YHpH1516390;
	Wed, 20 May 2026 02:34:18 -0500
Message-ID: <7e8b284d-807d-4167-83a9-bfdb76606623@ti.com>
Date: Wed, 20 May 2026 13:04:17 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 10/17] media: ti: j721e-csi2rx: add support for
 processing virtual channels
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
	<jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
	<sjoerd@collabora.com>, <dan.carpenter@linaro.org>,
	<hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20260313090701.646534-1-r-donadkar@ti.com>
 <20260313090701.646534-11-r-donadkar@ti.com>
 <agxQhwefGqKx9nu-@kekkonen.localdomain>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <agxQhwefGqKx9nu-@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|BN0PR10MB4997:EE_
X-MS-Office365-Filtering-Correlation-Id: bdffdbda-1e2a-40d8-bad7-08deb642384c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|4143699003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	T8ZSabccDG/uuSxNjVme04jUDtQU8D9HN92NJfM8Jxs8AfxMBVdNyf8K2Fp2C0z9YZDajad1uxFhs/xzXWuuBFJc3XLn/Qifk+/JYxGScBLQ7/hV+l0oni+PYW2VfVsdcu8b5hqGIWeUf0wlkxC+09jgzTMP3FY+x/V2sWMhfNHF1BzjpgaZUoJzsEUiD5W++IxhoDExZz+je4PniN+kNs/fKzQ7JGx4/dkaDHzUoL6itkKypY2mxKzuyfUFCbvQaOmC8X3CxmudWIArs1DXundn9vQhSREfB7S/lFSN7ByaQX6HuqncH9Hnhs45k6cbGgd3xVum+SBlH93aUNRmOOBFm7qKCJiNCmk4rWX3vHDcGxo7V/ZUCkEBHidZK5bvIEvfREZaDaE0xXfkSsrNuRd320dTyqpZe4K6rKg0OrCeOZ7y90tHHYfj46A2YQiNfrC3OWmnbP6mS3eSo8zobUJG9bsAL3TI0GlQGMwq28Q4/qCRhnzQI9hPv7QkN9JKuvAuQ3EI1FsqKq1bTN42THS5DC2Hv1TKEavNYk+LhFikIz9PFKzGqXxrHQR1fvrDE5ARZPwrYA6jIZ95UsILqGa9Bu69mAKOJVW68gcTZEPp9RWUQKAn/iPzW0EAv1a/hisi47bbZvSByJUAGL0+Wv7EbDsUmra08y0ufBhQp0yyCu0JKwvHDn9LYJ6H+H+K3APTI6Tb11ppbA8UKZrd0l3edymEBM6PDJ5rIhxLgjY=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(4143699003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xVwM4Wt7I6yuG8l9P4zlZ9QN8dlCSoWE+C0GjIL8tuqlyC4OnrDa1hkrGJkRMd1miQlCTomDg/x1oWVIAF1OaQ9IoEn9QlEJZp3Tby9dYCKG77rFYtYmNYzfNDCgtgIuVfUXRfz3lNpW15JUkyntjJz7C3QACmMDSbupJLKtVLRRuDpnXdIb+00fzl+GnNsKDKWK6fK1TGDiB9ctpWd8sSHgfeDOOjxc0XQRsjiOQUSiMyVNr+alv+soMC7eZ2ViaYxAK652qJvKUOF6kRCLhtn4GkyoiOKtRxPnxUY8g5QNNb1+Ns/0m2IrvOvoNplDyXFrr1VEdz2kJfrXf4RlzF6wNzSoF9PoSvj+z4MH1zoagWLBbbMrVJ5rz1+8qIAjVzQLwJ+I+IaqHdp1+J50S7pyY6UZ+iXXxEtMFIXYFs64y3l/gy+RNik6LBN21j7S
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 07:34:26.0948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdffdbda-1e2a-40d8-bad7-08deb642384c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4997
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62213-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,ideasonboard.com,kernel.org,ti.com,pengutronix.de,xs4all.nl,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ideasonboard.com:email,ti.com:email,ti.com:mid,ti.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 845EC588FEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 19/05/26 17:29, Sakari Ailus wrote:
> Hi Rishikesh,


Hi Sakari,

Thank you fro the review !

>
> On Fri, Mar 13, 2026 at 02:36:54PM +0530, Rishikesh Donadkar wrote:
>> From: Jai Luthra <j-luthra@ti.com>
>>
>> Use get_frame_desc() to get the frame desc from the connected source,
>> and use the provided virtual channel and DT instead of defaults.
>>
>> As we don't support multiple streams yet, we will just always use
>> stream 0. If the source doesn't support get_frame_desc(), fall back
>> to the previous method of always capturing virtual channel 0.
>>
>> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 51 ++++++++++++++++++-
>>   1 file changed, 50 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index 26a8eaa98b3da..24b687b4ea32a 100644
>> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> @@ -32,6 +32,7 @@
>>   #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
>>   #define SHIM_DMACNTX_DUAL_PCK_CFG	BIT(24)
>>   #define SHIM_DMACNTX_SIZE		GENMASK(21, 20)
>> +#define SHIM_DMACNTX_VC			GENMASK(9, 6)
>>   #define SHIM_DMACNTX_FMT		GENMASK(5, 0)
>>   #define SHIM_DMACNTX_YUV422_MODE_11	3
>>   #define SHIM_DMACNTX_SIZE_8		0
>> @@ -110,6 +111,9 @@ struct ti_csi2rx_ctx {
>>   	struct media_pad		pad;
>>   	u32				sequence;
>>   	u32				idx;
>> +	u32				vc;
>> +	u32				dt;
>> +	u32				stream;
>>   };
>>   
>>   struct ti_csi2rx_dev {
>> @@ -569,7 +573,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>>   	ti_csi2rx_request_max_ppc(csi);
>>   
>>   	reg = SHIM_DMACNTX_EN;
>> -	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
>> +	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, ctx->dt);
>>   
>>   	/*
>>   	 * The hardware assumes incoming YUV422 8-bit data on MIPI CSI2 bus
>> @@ -608,6 +612,8 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>>   		break;
>>   	}
>>   
>> +	reg |= FIELD_PREP(SHIM_DMACNTX_VC, ctx->vc);
>> +
>>   	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
>>   
>>   	reg = FIELD_PREP(SHIM_PSI_CFG0_SRC_TAG, 0) |
>> @@ -881,12 +887,46 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>>   	}
>>   }
>>   
>> +static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
>> +{
>> +	struct ti_csi2rx_dev *csi = ctx->csi;
>> +	struct v4l2_mbus_frame_desc fd;
>> +	struct media_pad *pad;
>> +	int ret, i;
>> +
>> +	pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
>> +	if (!pad)
> Same for media_entity_remote_pad_unique() it returns an error code on
> error.


Will fix the error handling


Rishikesh

>
>> +		return -ENODEV;
>> +
>> +	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index, &fd);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < fd.num_entries; i++) {
>> +		if (ctx->stream == fd.entry[i].stream) {
>> +			ctx->vc = fd.entry[i].bus.csi2.vc;
>> +			ctx->dt = fd.entry[i].bus.csi2.dt;
>> +			break;
>> +		}
>> +
>> +		/* Return error if no matching stream found */
>> +		if (i == fd.num_entries)
>> +			return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   {
>>   	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
>>   	struct ti_csi2rx_dev *csi = ctx->csi;
>>   	struct ti_csi2rx_dma *dma = &ctx->dma;
>>   	struct ti_csi2rx_buffer *buf;
>> +	const struct ti_csi2rx_fmt *fmt;
>>   	unsigned long flags;
>>   	int ret = 0;
>>   
>> @@ -901,6 +941,15 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   	if (ret)
>>   		goto err;
>>   
>> +	ret = ti_csi2rx_get_vc_and_dt(ctx);
>> +	if (ret == -ENOIOCTLCMD) {
>> +		ctx->vc = 0;
>> +		fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
>> +		ctx->dt = fmt->csi_dt;
>> +	} else if (ret < 0) {
>> +		goto err;
>> +	}
>> +
>>   	ti_csi2rx_setup_shim(ctx);
>>   
>>   	ctx->sequence = 0;

