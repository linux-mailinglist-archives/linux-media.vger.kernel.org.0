Return-Path: <linux-media+bounces-51802-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MbYOasufGkOLQIAu9opvQ
	(envelope-from <linux-media+bounces-51802-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 05:08:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86901B6FEB
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 05:08:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00CE03013D6B
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 04:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D864366567;
	Fri, 30 Jan 2026 04:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sueSWJFO"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102942620DE;
	Fri, 30 Jan 2026 04:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769746080; cv=fail; b=RmHpx5wbvsvfLPqNvszaC6znngGaFPRmbdQwsKnHrzVivfqlfpOXoLGjkxnvp603dqFR1vErd9AtzK3h2ICmp+2SpgRu+3+YEfvsE7pkc2Ooc9HWbU8x/+Ib0PAMcvirs7RQXt8AizBnn8gUmUVErUS0B6pgZ070SdJsCdWtSlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769746080; c=relaxed/simple;
	bh=38uI7EbWur+CGgzM/Ul5pEaGhCqPhFN0K+5bqz9GA20=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CzRyaARHN508w3bZBlesmRoR1hL/xXPhrtHV9Zbm/Le+whVllcXVzyKtEk9ZI7XC1vGgXbQyx38bSLkaPeVeD3zVldgqU8xJ56eu9dQ5pcMysk6RiTz/OYF70MpLhEBE3k/V6eRnlKWG/fiXjthONAwX+iVxNX4Bs7U/Cq6kyYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sueSWJFO; arc=fail smtp.client-ip=52.101.56.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wb7hyTZnFxgZHmftmgul3IstqdOthIRbTwuQicFf7LKmBbTuF5cZa2R85bqddBx2Y2p3IOI2Lhsrks4BvWzKlCXp4Ku1A5ksLy19K2MpW4MTbwVRoaVf3AYnO3nz5LmTQ3HVy+CGwBrJUTkVumaSHAN9RCBz8lOsEetIWBRQbXkvmvIU+RtNSvkfj0VbmCudIu7HUbuX4G2irAaZ7M7/ysklKyYURQxJjKIXnJfxw/7XE3x/YmWm1Q+ZDUjRH6X9nLrReqPR3AMj9lhxEaCq8tD46OBv/odP89x2KSX+I9m2Uu5LiFHHlW8XoX3HtAfvF99H3KnuTR9N6e5OkDHzWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQvgDH9CF0DzE3YLTaibb/GQpOkotwIl8XkEmyluxKs=;
 b=NzTKBo6XxE+Tq3gcSdoCk5QEFIiu5tFfLrLfcZgFHK7Zpowy6KvcmYH25wKD4MH3/LUdH/HelQmFeeyujHWhOGXo9yPcLYtfOw1RPkTiGiNekv4xBg3XhnSTYJWlPyUm1q8wvx702MVXg+bUS75zFabvpZtvfx9m84bYTwnjjx0xgIgPKTyfYomKEeh6kkfZgIvAGTgaxD+MkaIDsX9B0Qc/3jOgt17+YtB2O3PjSSf3KY1xw/Z95BikflRDTUb9jizZJPy12D/heKQwkYJhMJMVsLsDmgI+rMn0Cw2AbdvQ2JKEiXvfo4GSJEoI6fo06g6hW/lJKzleONnE2mfUtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQvgDH9CF0DzE3YLTaibb/GQpOkotwIl8XkEmyluxKs=;
 b=sueSWJFO9KUUljLF3ATAf244h4S1YKbzBpKi7gvjEJUcLe5uLuEge+Wk0bsdMifoVy/bMA9cHLALd6/+k3W8saAPR1+2EXy1LkJKSSVmwH80rbY+x78URo85/7dDif7OElhMS4A6RKoY4XPfVqfUc21LPITLFax/SX3lnBcmxsg=
Received: from DS7PR03CA0117.namprd03.prod.outlook.com (2603:10b6:5:3b7::32)
 by SJ0PR10MB5664.namprd10.prod.outlook.com (2603:10b6:a03:3e2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 04:07:55 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:5:3b7:cafe::b5) by DS7PR03CA0117.outlook.office365.com
 (2603:10b6:5:3b7::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Fri,
 30 Jan 2026 04:07:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 04:07:54 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 22:07:54 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 22:07:53 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 22:07:53 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60U47lJW1078249;
	Thu, 29 Jan 2026 22:07:48 -0600
Message-ID: <d19d1cd1-b7fa-43ab-9ef9-ade414efc508@ti.com>
Date: Fri, 30 Jan 2026 09:37:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 12/18] media: cadence: csi2rx: Use the stream from
 route to get format
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, <jai.luthra@linux.dev>,
	<laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>
CC: <y-abhilashchandra@ti.com>, <devarsht@ti.com>, <s-jain1@ti.com>,
	<vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
	<jack.zhu@starfivetech.com>, <sjoerd@collabora.com>,
	<dan.carpenter@linaro.org>, <hverkuil+cisco@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>
References: <20260121135424.1185710-1-r-donadkar@ti.com>
 <20260121135424.1185710-13-r-donadkar@ti.com>
 <55b08e0e-1921-4d37-a716-ff60852ec51b@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <55b08e0e-1921-4d37-a716-ff60852ec51b@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|SJ0PR10MB5664:EE_
X-MS-Office365-Filtering-Correlation-Id: 238c239e-c905-4155-dc8c-08de5fb524e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amtEUmhkMEhyeWw3NFVmeFRPQ21mUnp3bXhzWUVpQ1owbnJvQ1ZVcXYwVk9B?=
 =?utf-8?B?WEtuaHgzOUlJUmxwanNFSVBzb00vV1Z1NlBKOTVqeG1lYThYNTZBenRnbTJC?=
 =?utf-8?B?d2FnR1VDMm80eEp2MzVWdmtMSmRBK1YvcjdwMVBCWGxhdE0yd2FkbGkrUExX?=
 =?utf-8?B?cm1XREVjbFJBY01MeExXc0dtdTNJeURxOG9RcVRSSnpma0RFQk1zTnJjaVEy?=
 =?utf-8?B?Q0J3cG5oeitidDVzQ0VPNUJQZXhzMklVZGtidzVrZ2p2RWUxcjMrbmliUHRZ?=
 =?utf-8?B?bDNaUHlKOGlMaWZ1VlBPTjUrcmVrajdOQnFxSFJYYWJDbUhod1RpTVFlVW1R?=
 =?utf-8?B?YVQ3Y0w1bDhkOThXcTBWU0ErZ245NkovejJWTzJzUU1LS3p1RjNObjlYU0Yv?=
 =?utf-8?B?QTN1Z2NVSExLYmFnWklIV3NrLzdQRExRaHNHcDFHQ1dmaitnZWVMbXBQYWwz?=
 =?utf-8?B?ZE16MUN1MGhRTVVDNlpzQm9HU3ZWeFhxY1R5SXRZMXVwQzd4ZGJSQnJrOVE5?=
 =?utf-8?B?UTAzMU5jL2MrV2RJTmZ3K0ZaSWhGYmVsM1FHVHZvTnlSNW4yRlFwZlFON0hv?=
 =?utf-8?B?eE1OQm1DMkpkR2RxQjkwaUNpYjN2WE80a042Skk3QXJqT0JxR1o1ZUlVUUFH?=
 =?utf-8?B?eUZEZGJqYkJxSWJYekFXdUxmRDhiUUhCYXBIUWRKazJoc1hDTjZQOXhoN2do?=
 =?utf-8?B?c2dYY3hmVmZnd25SVTBpeE5SQzUrOEI0aEJtbmZhdFdXVXZYWWovYktJVUgz?=
 =?utf-8?B?YkhiYVFhYm01blp1YjRIR0ZrMEtrakk4MWFvTXVDLzdDRTZFWG9kSFlwVFkx?=
 =?utf-8?B?Vlc0S0tRazlzMUdVLzZjbmZzMUN3YkQvcDc1SUZUTktVTzBRYXZnaGhhU1J2?=
 =?utf-8?B?blFraVhFTGx2V003N3hzWUFlSUlpUzZlR2F4bjgxbDUvdll6NTgwYlhBckky?=
 =?utf-8?B?R29EOG12UmxFQ0I5M3NWNisrbWtnTDZzS0FjSmFsQ2FlckdOZWJXYk5raTR0?=
 =?utf-8?B?MmxudU1zV055cUd6b1hBMVM4SnBvNjRFSUJCc2p4cElacDRLYldqbHJYS0lY?=
 =?utf-8?B?cEdGY095N0lDeUp5N2RvbXpCeE5QaVIvSW1KcVliWTM1MkVoT01QeDFGcU9m?=
 =?utf-8?B?QmljVHhuUjhZdWxQR2lGaUZ6d3VIamNKSkZjWFZ2UmtvT3dMTVNzNS9qdXVx?=
 =?utf-8?B?eWtnQll2ODZVZUN3bTQ0MFNCYUlQVXJTODhVamVPdTVJNWdNL3hUelpqWm41?=
 =?utf-8?B?enVRQi9HU3JNZVpjY09pRXYxOTBRTkxWUS9aRk4ycjhqaGJRUGtQNlZsdnk4?=
 =?utf-8?B?Q1hWM2I4Z3d2TjVDdDdUNzZXWndvVTZ4VHVGa3paLzVWTk1janJ5TUI1anRp?=
 =?utf-8?B?OXJvcFVUNEZWTkoyaElra016VloyQVh1OWpNWkpROGlKeDU5c2pTanhoaVVO?=
 =?utf-8?B?R2UwU1lLd1lLYUxnVHpUQkN1Qzk1YVF0QXRqclZRNHJubnBYNHBFcDl6SmhQ?=
 =?utf-8?B?SWRDTFhIT3dZdEtqU2trd0ozcldzZFBRSEtqcUE0K1BVcEFuVGpkNGVrY2lU?=
 =?utf-8?B?ZmZHYUJUc3QrazRvZ1FvQnNmMlZxc0VCSi96c0ExVU5ubEtUZmNBTE1kdmo4?=
 =?utf-8?B?azhpMnR1UC9lUENwSFBFb0ErbVh2ZmdESXVEc3J6b3l3ZWNtVzVmdEFEdkE3?=
 =?utf-8?B?S0hheG1uU3VCOEsxbGNYNHg5RS9DdmRCVjRISFlZV3dNMmVyRURNY2pRUmwx?=
 =?utf-8?B?NmFnS1B3SEM3WVJHTjFSdGorK0pWMFdTMTh5aDhrK3E4ZEZqV3Fhcjc1aXcv?=
 =?utf-8?B?WGtCd084ZnNNOUl4MXQvdnJOLyt1ZXN5Y1hMTTdlbFY3YWpCaERQak9EeG05?=
 =?utf-8?B?TGpzbFduRTFoR0RiT1FMVm50Z2ZWTUttRXJncG82NU9QWjBER0pFeFNxb29N?=
 =?utf-8?B?WGI2cHB1WVJXalZyRzlXSmxIL0RTcUloWWtJd0dQMmFVcmpPb0RvS1A5bTlW?=
 =?utf-8?B?cGlETXhOUElpTWdxOEtwTzE1SnVmSWxVaDlmOG1JLzgzZDlMR0krQXZ6Rm1O?=
 =?utf-8?B?NE44TTFGeHBuRDZleVczUXZjWmp2UEpKNE5vVUpZNldQR2lyRmU2cXJ4TjJE?=
 =?utf-8?B?ZkhyVlJzSUJrMTltTGREQUFnL1hxV01mWWFWak9ONVNiL3VNd2NKOGVxODFq?=
 =?utf-8?B?YzZOZGlWL2FnRTVDVWdpQmQydWloeDhUNUt5b2tia1hmSzJFRGF5MVNRRmEv?=
 =?utf-8?B?cnEyMlZISHJmSkhSUlZFeTN0MEd3PT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cMYGES0/uBsJIcUOyW7Wxv0IlRq5bmIoN133UtbNqySJFEmxUAhjdxFTTTaQgO8+0MCcSPcfiVK8DEw7FVDCb3RVzxHIK04ThVx7A1hukaAmJuqz/XBQYunbBjUqpo9yH8EsxsOv0fXnfqPUZZteOGWKw+YWaduzoWYdZHEl9R3eY0n8tsJDOz0LUct8jU/qh9ZILmanGe5Jl/kulywlHmPmsoaFFJTVj1dYuL+IK9lP4xmb+JeV9oqCyPYjIGwEuanV7uqtbLcrT8g1teW/eUv1J3rwjaaDyGbRfFwn9SRtYLdAYU4ZzLoJpqBMxw1Bvn5wzLkWFaf8SecnXhU/pBX8y1fIdS0b/utfF1FHOjdBFKScim5Ndt54FTDGNIT5yGImP+R4Jf9SeYHtPIdKaSznScTnyt61dE7KWNwPFfZ2IIlsvrD4VBdUcfg7J1de
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 04:07:54.4835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 238c239e-c905-4155-dc8c-08de5fb524e0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5664
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51802-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ti.com:email,ti.com:dkim,ti.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 86901B6FEB
X-Rspamd-Action: no action


On 23/01/26 13:23, Tomi Valkeinen wrote:
> Hi,
Hi Tomi,
>
> On 21/01/2026 15:54, Rishikesh Donadkar wrote:
>> In multistream configurations, different streams can have different
>> formats. Update the driver to use the stream number from the routing
>> configuration when retrieving formats instead of hardcoding stream 0
>> or ignoring streams.
>>
>> In csi2rx_configure_ext_dphy(), use the sink_stream from the first
>> route instead of always using stream 0.
>>
>> In cdns_csi2rx_negotiate_ppc(), iterate through all active routes
>> for the requested pad and retrieve the format using both pad and
>> stream information.
>>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   drivers/media/platform/cadence/cdns-csi2rx.c | 34 ++++++++++++++++----
>>   1 file changed, 28 insertions(+), 6 deletions(-)
> So if I understand this right, v9 was working by luck, as it was always
> using stream 0 format (and expected stream 0 to be there)?


Yes, when I tested using IMX219 connected to the port 1 of the fpd-link 
board, I faced an issue where the v4l2_subdev_state_get_format() 
returned NULL when no stream was passed to it, here the default 0 was 
considered but the fpd-link driver which assigns stream number wrt ports 
assigned it as 1.

>
> Two thoughts here:
> - This should be merged to the previous patch, shouldn't it?


Yes, will do that

> - Are you now testing with different resolutions, fps, etc on the
> fpd-link ports?


I will test the v11 with multiple resolutions and formats. I will 
mention the tested ones in the cover letter


Rishikesh

>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>
>   Tomi
>
>> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
>> index 175366f889115..db9871fdbe3a4 100644
>> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
>> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
>> @@ -279,6 +279,7 @@ static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
>>   	struct v4l2_mbus_framefmt *framefmt;
>>   	struct v4l2_subdev_state *state;
>>   	const struct csi2rx_fmt *fmt;
>> +	struct v4l2_subdev_route *route;
>>   	int source_pad = csi2rx->source_pad;
>>   	struct media_pad *pad = &csi2rx->source_subdev->entity.pads[source_pad];
>>   	s64 link_freq;
>> @@ -296,7 +297,9 @@ static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
>>   	if (state->routing.num_routes > 1) {
>>   		bpp = 0;
>>   	} else {
>> -		framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK, 0);
>> +		route = &state->routing.routes[0];
>> +		framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK,
>> +							route->sink_stream);
>>   		if (!framefmt) {
>>   			dev_err(csi2rx->dev, "Did not find active sink format\n");
>>   			return -EINVAL;
>> @@ -706,25 +709,44 @@ int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
>>   {
>>   	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
>>   	const struct csi2rx_fmt *csi_fmt;
>> +	struct v4l2_subdev_route *route;
>>   	struct v4l2_subdev_state *state;
>>   	struct v4l2_mbus_framefmt *fmt;
>> +	int ret = 0;
>>   
>>   	if (!ppc || pad < CSI2RX_PAD_SOURCE_STREAM0 || pad >= CSI2RX_PAD_MAX)
>>   		return -EINVAL;
>>   
>>   	state = v4l2_subdev_lock_and_get_active_state(subdev);
>> -	fmt = v4l2_subdev_state_get_format(state, pad);
>> -	csi_fmt = csi2rx_get_fmt_by_code(fmt->code);
>> +	/* Check all streams on requested pad */
>> +	for_each_active_route(&state->routing, route) {
>> +		if (route->source_pad != pad)
>> +			continue;
>> +
>> +		fmt = v4l2_subdev_state_get_format(state, route->source_pad,
>> +						   route->source_stream);
>> +		if (!fmt) {
>> +			ret = -EPIPE;
>> +			*ppc = 1;
>> +			break;
>> +		}
>>   
>> -	/* Reduce requested PPC if it is too high */
>> -	*ppc = min(*ppc, csi_fmt->max_pixels);
>> +		csi_fmt = csi2rx_get_fmt_by_code(fmt->code);
>> +		if (!csi_fmt) {
>> +			ret = -EINVAL;
>> +			*ppc = 1;
>> +			break;
>> +		}
>>   
>> +		/* Reduce requested PPC if it is too high for this stream */
>> +		*ppc = min(*ppc, csi_fmt->max_pixels);
>> +	}
>>   	v4l2_subdev_unlock_state(state);
>>   
>>   	csi2rx->num_pixels[pad - CSI2RX_PAD_SOURCE_STREAM0] =
>>   		CSI2RX_STREAM_CFG_NUM_PIXELS(*ppc);
>>   
>> -	return 0;
>> +	return ret;
>>   }
>>   EXPORT_SYMBOL_FOR_MODULES(cdns_csi2rx_negotiate_ppc, "j721e-csi2rx");
>>   

