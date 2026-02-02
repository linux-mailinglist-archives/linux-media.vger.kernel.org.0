Return-Path: <linux-media+bounces-52017-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKfiKlqvgGn6AQMAu9opvQ
	(envelope-from <linux-media+bounces-52017-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 15:06:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2B1CD1EE
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 15:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40BA8308FEB0
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 13:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501CE36C5A1;
	Mon,  2 Feb 2026 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="BSDejgXy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A011735EDC9;
	Mon,  2 Feb 2026 13:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770040695; cv=fail; b=R5L8iu5g5qG3emSc+1pkM75WRqcReX0PvJQnoE+YPzkXLM3hRFIOrQlzKV42fxDcpG71qn0Xl2syKPhLweceUUImsWzDwuV01Cb4mjXKP6NaovsbLFSSIrXTps5WvUG3/Yd/9NdCcXLI3/3XH9or74/k3PlOHAwyAPqTs38DGR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770040695; c=relaxed/simple;
	bh=XMjBq3XDV8IYExk+69WdbPVyJRHmzhCZnevx+KDQ8gA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mtkC2OIIzq7Fnq69fTurbPecT+XLm+OdH5RHd7iGB6A9NLN+c1BlEe5+R4KhfqhtLc0EdU8v4Q2lAQRqajpjacmqjMPQnevuekss3VZmtFxdH5gKYrFy1hR2t1oigMLfkgMecQWSv8EXRbPNjezq8oSJCH+k4Q3YaFfF+pc05cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=BSDejgXy; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612DpBRI2968032;
	Mon, 2 Feb 2026 14:57:49 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4c1wjq45nh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 14:57:49 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrmOjZmUCOCyzafGR2EvBNdJP0d4tRiVh4dQ+kfAjXxtyGhQpUyRsA67VTy2TPjE8SfLyZG4Cf3uPR8jUgGaBPLZnIyE/IhyybUWyU4FRe6Oe1xlqKDIFFH5vqyEI8C3RdisLaOtLsI4IA2lmGVIL92OII4KwAvibpgYf8NFgWeQX3ZPlgaaSziICgaIHre1wbi0DZuom67oYaEZGNLchGxwmX3IRQ8kOxXyBLmDFkdjYwEJUGieIjHtXs7d5Zjb5WydsMbkk7HKiy1SuBfjBqnVly7l7mp4RB/7aaHLSFzze3V7dfkIXx+qU7YhBIZTGVfetrESPcnlqhMI9bGtaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEeG4jqNYprpJnAWtY7nnrgl69+/I2mb998PNhBVy0I=;
 b=EleugOEsSqaPaoj7qB54wt9/ylGFR/2Olf9VB5JNmS7sJnd5cyLeRATbFSGIoknYo67Tu6c0RMxQVFLKOoJgdxp9JJiuq3EDT7/hsdvZQSaUokUdmhiNshojnIt/LQMBW2k9SrfGABdS84XIIqZmSEi/kT4D64ZwDBwWiKWBU3xAtXkiGrwZ1S+WDqw02Zd9ptPYZqiUdgDeXdFqxU3whDyyq3auvcOODpQkioPQfn6cqi1ByHHvPePDxLnkEvj4aNMX6Zhua+Efw9gTklxs0q7kxnjCAiagZPgvsZR3GVBR+nBn8eaAJ55UE+gtTt3/ys0zJ2DUsWSAzlDy1FHE9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEeG4jqNYprpJnAWtY7nnrgl69+/I2mb998PNhBVy0I=;
 b=BSDejgXyjgBfPU2CKJnmIASQoE3/Ez1/XElGFwbzRxHiPMDK/MQzBBMIqYw6M0Q2qAhiRTXZJao0J8oUWRjCGleaz3fTetnDUedjfN3jWkIxda6ehB71IkPOTje8lalHTx7h+HME+USMDPHkeyCCN5cUvP/l9flxKGWKySyc7v0n3LHtfaASKTBX7EvBhXBN+dkJu4Q4xVW0TfL2ArbNO4lfoy6rM0X8eKXvMy9L34NWf0+/o/RYWkG7sd6GWqVDrMxxQxXZ7sLkyEKiss09tgSraWJFzefwrz6XmFFNS8e8NVVPORj+YNU+KJi7s1qpdV3Wu2dUadeZUGAxgC6KhQ==
Received: from AS4PR10CA0012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::15)
 by PAWPR10MB7697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:35f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.13; Mon, 2 Feb
 2026 13:57:43 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::e) by AS4PR10CA0012.outlook.office365.com
 (2603:10a6:20b:5dc::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 13:57:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 13:57:42 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:59:27 +0100
Received: from localhost (10.252.7.227) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:57:41 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 2 Feb 2026 14:57:26 +0100
Subject: [PATCH 01/13] media: stm32: dcmipp: share struct dcmipp_device
 among subdevs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260202-stm32-dcmipp-pixel-pipes-support-v1-1-8d8d51f5e014@foss.st.com>
References: <20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com>
In-Reply-To: <20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019A:EE_|PAWPR10MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 216e5a34-6a70-4c71-70c7-08de626308ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?engvM2tIZmg2WXdrcElPbkIvQzFwSU1aKy9uSzRHQjJxUTh4QVg1Smd1TzVK?=
 =?utf-8?B?NWdKeWQ2TEpoQjY4L1RPdVcxRmJaT3V3dXVSWlNaaUlzTzBQQzNzUG9kSzdO?=
 =?utf-8?B?TDhOUGI5UVhZV0RnSEFPSEx2Z05XK2RGajZiWGZTcWI4MFhFMjhZcDh1RmZl?=
 =?utf-8?B?K2dYUTFkYjdBRTh4UjJtVEpVRzJQd3Rub1ZTc1M3eGE0alJoUG5aNldobm84?=
 =?utf-8?B?RnNjWHY5WFlDek1hRXBNOTVEQVhDQjBaRXFpZ0FKemJMaHJSSXVMV0pVNkxW?=
 =?utf-8?B?eHdiNy94VWs3RmtrZ1NxMUhLOHhZbFZ6L3NoNVBxY21FVE9KR3pxa1liZDdx?=
 =?utf-8?B?cFNwS3dqSnNYTi9NamVIWlhrVW96UGhsdk5XWElxOExqekNvZjhGd1MyejBT?=
 =?utf-8?B?TTMzbWU5NjRXRFNneUVJT1c4Qk9JbFJpQ1o1WXJTMGpQKys5MmJlTUticW0v?=
 =?utf-8?B?cWtEZUNwN29DQXRibUxzZGgzTWk2NkJRUlA1NTVsL01OUE1TeXhxbElmOHF3?=
 =?utf-8?B?UGZVbkpYMm1hTklVa2RGcngwNWtIQ0NFaFdjUDkyMlVBT2NVMFdWWVZ3bGsx?=
 =?utf-8?B?UzB1M3MrclJBdDVvNS84Z3dOTkhSclEzbnQ2YjRlNmJtMFE0S0RtQkFZbzJK?=
 =?utf-8?B?ZWNLQ3dXcWtIVU9BcE8rRFFXdjZzeU1aWXRvRFVTT2tOUWdBKzM1MytOMENv?=
 =?utf-8?B?WEF2NnJXckM3d0w5YTRrUGFoU1BTUlhzWmhXKzVJTC9TMGIyeVRNODdOa1Uv?=
 =?utf-8?B?eStBZWR0RFlBTU95V2o3cTVLMlM0eEdJV29mN0VHc1VKY1hCVThzcDFVaDQ2?=
 =?utf-8?B?RUZPVUF1VHRQeXpxVE1rUkpmZ0JPM01qTkhReU91TGl2a083NysrelBjbG9Y?=
 =?utf-8?B?S3ZFL0JoTjBUYmlNc1R1bHBRcHdTR2N6dnNTRkNGWExGaEZ3UndrVVFvZEFE?=
 =?utf-8?B?bE9idHJyUHlrc1pIbHRtRlVkNnhRSEtZM05mdTlWbjk0eXF3ejh1ZFNSa3pw?=
 =?utf-8?B?MUpENlZyZzdyczdENWZHdmgyb3ZkZklTNGVqR1JMWksrMTYwZEptRWtnZVRh?=
 =?utf-8?B?aGpaRjZ5VGQweUUxUnQzenVVNXNveVlMWkw5aWkvR09sUzQvMkVWOGZwV3kw?=
 =?utf-8?B?SlQ1TWtwOFZJRnJRS2IrK3JFZEZyNU8rU3JYL2Zjc3ErRXQrSVFhVlBDYXFX?=
 =?utf-8?B?ZzlCazlVcDlzam5KUGUxR1hrWjg1aWFiMTBUL2MyamFLVml1RWtBYTZCQVBZ?=
 =?utf-8?B?RWJpdnZpZk9xVUlCbDlCdFUvY01hWjNBMjRNSkdNQWZPOGNaNVZWbEVUb1JQ?=
 =?utf-8?B?R1BiMWRsZkx5NTZZT01wNkl6L0VFYXI2bFFBVm9aMUdXT2MzWCtyZUcwak95?=
 =?utf-8?B?bnBBRW0yanFKRVFHRVNCbjJpSUlFR00zVlo3U1NEMU1TS3VvSHBkNG4waDJt?=
 =?utf-8?B?WXZCZDJSSU91TEJzclQrWEZ0eWdYaW5ickdwV2hXTENlV3EvUWhUVDFoQ3BJ?=
 =?utf-8?B?clFWdWt6ajlLMXJYc0Z1S1Q2dVRlNVFqSjBNVmNWSE5tMXY5U0FMS0VIUUlx?=
 =?utf-8?B?MjFqNzE1Vm5zeEp2QjNreGxBR05LSmN3TjBUcHRjbkdLK1ZhUjh4SDNuNDkz?=
 =?utf-8?B?V0dnNUNnYkpsUjRJMDI1c2lMY3FjcHFCbklFRzN3YlF0R0NScGpOb1h1N25w?=
 =?utf-8?B?WXdYVi9hT1pMTlJISWhKWWFHWTRrdlVEV0ZJRjZPdjJPWGtwbjlNZ2RtQnFX?=
 =?utf-8?B?ZkZoRjBWSUdTSW9HNjQ5RU9vTXFtVEdrbFF3RExESlRaSWJNa05JN2NkTk9O?=
 =?utf-8?B?TlBWemoxWGF4ZlpyTDFCNXE0amxBSXgyU2lpV0wzT0dRZWkyK2VBK0M3elZO?=
 =?utf-8?B?c2wvcVBoRFU4VlBxdno0bTM5c1JXRGt6WW4rcjZCeWRucXNkdm5KZ0h2STk2?=
 =?utf-8?B?dHpnTTMxdk5zaDJyNno5OG9TdW5VY3JSRW5wMmZNUWlsN2NDdFFxM2JyK3k1?=
 =?utf-8?B?dWhqY2wyZzN1MXkrQzRlbEdaUk1VNGtVWU84OWd4K1hHbkdIQUd3NnQ4VHVr?=
 =?utf-8?B?VVRBdGN1RVFQUFZGTkVDRG9HT0pTLzl3T3lpcWkxWElGZ0w5b2VJOGFTUmFK?=
 =?utf-8?B?YmptOUZzc0hGbVJpanZGYU51V2ltSDVQSXkzNGZIbTRBYXU2NDFHaUFBaHFK?=
 =?utf-8?B?WlJHVDV4Y2hZZjcyVUJSU3Z4akdJbVYvQ0pSUlg0THFRN0ZXSzhMaDA2T0gz?=
 =?utf-8?B?akpnTUxCSFdqVGJNRjhrRVAybktRPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NBPDMKh5hZDoVw4a/anE2uNUorK7S4Z40jBgmOYQ5pYM6cWjiWhxjUbI0xt/ESLz2G8hEOGo7ol1N7Yz9xRdPfzdtJym8x9clqrDIFjJ4Qttd6iefW74NXDVkSR3/E+QaXrBL3vhhUtR8Auz0QINeI5kWhftQw/7kr2WIlROkM7bJS0PKtBq6eOCM4+qbmPkLW3OvCuViYdpiQcN8gYBViRy8bZl9tKdN/qr2fPeAALafr7m09ku2l8ZrE4lXdiWOxRf8fa9VdG1g5wDumIDGP6fkK1dZ6caJFvMSQhY75r+y/KEzADXKmMt1/orwa4AL1DjXQTmy0ayq2gg7BtQOo4SO3hcl375Vnow1TPCtdmm133fxuSeHYsM/oCIqTSafUtGcrTlJ1gzxN1ObpCRcT6rUzQqUZLpaarvWIa7D8Jr9+oKCmzjqCjZaHrk2fvV
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 13:57:42.1014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 216e5a34-6a70-4c71-70c7-08de626308ca
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7697
X-Proofpoint-GUID: 7QerdSwG0JufuuTC50767wMde6DwL1cl
X-Proofpoint-ORIG-GUID: 7QerdSwG0JufuuTC50767wMde6DwL1cl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEwOSBTYWx0ZWRfX5rkx5S1rzAnB
 fvnPaibokISEBxFggJ00c7YEQaJjyPdw/nzvYgHh5lY2DGbMYb+uqnEY6i+5lLnn0znVcKnuz86
 WUJ9jM8tv94oRAvgLFCko2Pb2O6l3UhV+A87P8unNrPVK+Ykwanr5cDfD9S6mYY5eJZV1I9FUiT
 xRCvxbTcDpEmYx4HEjAQUbLDW+2fDsuJUWxYMi9yI9BDMdQRiztmuFmyINt6zQKxvaAM1qXA/mt
 HZTEmkr8MOCUR4Y5Jpxewtd1NS5eU4bRIzT6T0o4rLpG4BZJFZr95FV3jLYJFb6PNRhLKQwpNyg
 WpS6AQcFNaJsl2ftTPXXgSq8qy363rlCgOirwuxWWuNwBK+bAxGfNI2oxFKNIGpTOlHOT0AAkOt
 tgAXyyy94xmMWecTewDDMNA2ejNNEBFw/JUAmYNJ60ADUVO51XSoOlv1lfqMmMXaSkD4ckPbSt+
 /NB2gqXDIPsQNe3FL6w==
X-Authority-Analysis: v=2.4 cv=HuZ72kTS c=1 sm=1 tr=0 ts=6980ad5d cx=c_pps
 a=TPI4aLKDjCd1EbHbt8/hbw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Xa52oM6mtQYA:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=KeAM96LYraSxUco4NP0A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52017-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,st.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0D2B1CD1EE
X-Rspamd-Action: no action

In preparation of need for sharing of data between subdevices,
make the struct dcmipp_device structure part of dcmipp_common.h
and share it with subdevs at init time. This allows for simplifying
parameters of each subdev init function as well.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         | 13 ++++---
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        | 11 +++---
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h | 43 +++++++++++++++++-----
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 33 ++---------------
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 12 +++---
 5 files changed, 55 insertions(+), 57 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 19e6b187be22..f4b962867dc2 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -855,12 +855,11 @@ static const struct media_entity_operations dcmipp_bytecap_entity_ops = {
 	.link_validate = dcmipp_bytecap_link_validate,
 };
 
-struct dcmipp_ent_device *dcmipp_bytecap_ent_init(struct device *dev,
-						  const char *entity_name,
-						  struct v4l2_device *v4l2_dev,
-						  void __iomem *regs)
+struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
+						  struct dcmipp_device *dcmipp)
 {
 	struct dcmipp_bytecap_device *vcap;
+	struct device *dev = dcmipp->dev;
 	struct video_device *vdev;
 	struct vb2_queue *q;
 	const unsigned long pad_flag = MEDIA_PAD_FL_SINK;
@@ -878,6 +877,8 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(struct device *dev,
 		goto err_free_vcap;
 	}
 
+	vcap->ved.dcmipp = dcmipp;
+
 	/* Initialize the media entity */
 	vcap->vdev.entity.name = entity_name;
 	vcap->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
@@ -928,7 +929,7 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(struct device *dev,
 	vcap->ved.handler = dcmipp_bytecap_irq_callback;
 	vcap->ved.thread_fn = dcmipp_bytecap_irq_thread;
 	vcap->dev = dev;
-	vcap->regs = regs;
+	vcap->regs = dcmipp->regs;
 
 	/* Initialize the video_device struct */
 	vdev = &vcap->vdev;
@@ -939,7 +940,7 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(struct device *dev,
 	vdev->ioctl_ops = &dcmipp_bytecap_ioctl_ops;
 	vdev->lock = &vcap->lock;
 	vdev->queue = q;
-	vdev->v4l2_dev = v4l2_dev;
+	vdev->v4l2_dev = &dcmipp->v4l2_dev;
 	strscpy(vdev->name, entity_name, sizeof(vdev->name));
 	video_set_drvdata(vdev, &vcap->ved);
 
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index f9e4a3a9ef3f..aa0561957b80 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -571,8 +571,8 @@ void dcmipp_byteproc_ent_release(struct dcmipp_ent_device *ved)
 }
 
 struct dcmipp_ent_device *
-dcmipp_byteproc_ent_init(struct device *dev, const char *entity_name,
-			 struct v4l2_device *v4l2_dev, void __iomem *regs)
+dcmipp_byteproc_ent_init(const char *entity_name,
+			 struct dcmipp_device *dcmipp)
 {
 	struct dcmipp_byteproc_device *byteproc;
 	const unsigned long pads_flag[] = {
@@ -585,11 +585,11 @@ dcmipp_byteproc_ent_init(struct device *dev, const char *entity_name,
 	if (!byteproc)
 		return ERR_PTR(-ENOMEM);
 
-	byteproc->regs = regs;
+	byteproc->regs = dcmipp->regs;
 
 	/* Initialize ved and sd */
 	ret = dcmipp_ent_sd_register(&byteproc->ved, &byteproc->sd,
-				     v4l2_dev, entity_name,
+				     &dcmipp->v4l2_dev, entity_name,
 				     MEDIA_ENT_F_PROC_VIDEO_SCALER,
 				     ARRAY_SIZE(pads_flag), pads_flag,
 				     &dcmipp_byteproc_int_ops,
@@ -600,7 +600,8 @@ dcmipp_byteproc_ent_init(struct device *dev, const char *entity_name,
 		return ERR_PTR(ret);
 	}
 
-	byteproc->dev = dev;
+	byteproc->ved.dcmipp = dcmipp;
+	byteproc->dev = dcmipp->dev;
 
 	return &byteproc->ved;
 }
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index fe5f97233f5e..e5c0eda8b18a 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -58,10 +58,36 @@ do {									\
 		(fmt)->xfer_func = DCMIPP_XFER_FUNC_DEFAULT;		\
 } while (0)
 
+struct dcmipp_device {
+	/* The platform device */
+	struct platform_device		pdev;
+	struct device			*dev;
+
+	/* Hardware resources */
+	void __iomem			*regs;
+	struct clk			*mclk;
+	struct clk			*kclk;
+
+	/* The pipeline configuration */
+	const struct dcmipp_pipeline_config	*pipe_cfg;
+
+	/* The Associated media_device parent */
+	struct media_device		mdev;
+
+	/* Internal v4l2 parent device*/
+	struct v4l2_device		v4l2_dev;
+
+	/* Entities */
+	struct dcmipp_ent_device	**entity;
+
+	struct v4l2_async_notifier	notifier;
+};
+
 /**
  * struct dcmipp_ent_device - core struct that represents a node in the topology
  *
  * @ent:		the pointer to struct media_entity for the node
+ * @dcmipp:		the pointer to the parent dcmipp_device
  * @pads:		the list of pads of the node
  * @bus:		struct v4l2_mbus_config_parallel describing input bus
  * @bus_type:		type of input bus (parallel or BT656)
@@ -84,6 +110,7 @@ do {									\
  */
 struct dcmipp_ent_device {
 	struct media_entity *ent;
+	struct dcmipp_device *dcmipp;
 	struct media_pad *pads;
 
 	/* Parallel input device */
@@ -199,19 +226,15 @@ static inline void __reg_clear(struct device *dev, void __iomem *base, u32 reg,
 }
 
 /* DCMIPP subdev init / release entry points */
-struct dcmipp_ent_device *dcmipp_inp_ent_init(struct device *dev,
-					      const char *entity_name,
-					      struct v4l2_device *v4l2_dev,
-					      void __iomem *regs);
+struct dcmipp_ent_device *dcmipp_inp_ent_init(const char *entity_name,
+					      struct dcmipp_device *dcmipp);
 void dcmipp_inp_ent_release(struct dcmipp_ent_device *ved);
 struct dcmipp_ent_device *
-dcmipp_byteproc_ent_init(struct device *dev, const char *entity_name,
-			 struct v4l2_device *v4l2_dev, void __iomem *regs);
+dcmipp_byteproc_ent_init(const char *entity_name,
+			 struct dcmipp_device *dcmipp);
 void dcmipp_byteproc_ent_release(struct dcmipp_ent_device *ved);
-struct dcmipp_ent_device *dcmipp_bytecap_ent_init(struct device *dev,
-						  const char *entity_name,
-						  struct v4l2_device *v4l2_dev,
-						  void __iomem *regs);
+struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
+						  struct dcmipp_device *dcmipp);
 void dcmipp_bytecap_ent_release(struct dcmipp_ent_device *ved);
 
 #endif
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 49398d077764..dd784cfcaac8 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -33,31 +33,6 @@
 	.flags = link_flags,					\
 }
 
-struct dcmipp_device {
-	/* The platform device */
-	struct platform_device		pdev;
-	struct device			*dev;
-
-	/* Hardware resources */
-	void __iomem			*regs;
-	struct clk			*mclk;
-	struct clk			*kclk;
-
-	/* The pipeline configuration */
-	const struct dcmipp_pipeline_config	*pipe_cfg;
-
-	/* The Associated media_device parent */
-	struct media_device		mdev;
-
-	/* Internal v4l2 parent device*/
-	struct v4l2_device		v4l2_dev;
-
-	/* Entities */
-	struct dcmipp_ent_device	**entity;
-
-	struct v4l2_async_notifier	notifier;
-};
-
 static inline struct dcmipp_device *
 notifier_to_dcmipp(struct v4l2_async_notifier *n)
 {
@@ -68,8 +43,8 @@ notifier_to_dcmipp(struct v4l2_async_notifier *n)
 struct dcmipp_ent_config {
 	const char *name;
 	struct dcmipp_ent_device *(*init)
-		(struct device *dev, const char *entity_name,
-		 struct v4l2_device *v4l2_dev, void __iomem *regs);
+		(const char *entity_name,
+		 struct dcmipp_device *dcmipp);
 	void (*release)(struct dcmipp_ent_device *ved);
 };
 
@@ -221,9 +196,7 @@ static int dcmipp_create_subdevs(struct dcmipp_device *dcmipp)
 
 		dev_dbg(dcmipp->dev, "add subdev %s\n", name);
 		dcmipp->entity[i] =
-			dcmipp->pipe_cfg->ents[i].init(dcmipp->dev, name,
-						       &dcmipp->v4l2_dev,
-						       dcmipp->regs);
+			dcmipp->pipe_cfg->ents[i].init(name, dcmipp);
 		if (IS_ERR(dcmipp->entity[i])) {
 			dev_err(dcmipp->dev, "failed to init subdev %s\n",
 				name);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
index c4bc76909b1c..597f88ac7915 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
@@ -515,15 +515,14 @@ void dcmipp_inp_ent_release(struct dcmipp_ent_device *ved)
 	dcmipp_ent_sd_unregister(ved, &inp->sd);
 }
 
-struct dcmipp_ent_device *dcmipp_inp_ent_init(struct device *dev,
-					      const char *entity_name,
-					      struct v4l2_device *v4l2_dev,
-					      void __iomem *regs)
+struct dcmipp_ent_device *dcmipp_inp_ent_init(const char *entity_name,
+					      struct dcmipp_device *dcmipp)
 {
 	struct dcmipp_inp_device *inp;
 	const unsigned long pads_flag[] = {
 		MEDIA_PAD_FL_SINK, MEDIA_PAD_FL_SOURCE,
 	};
+	struct device *dev = dcmipp->dev;
 	int ret;
 
 	/* Allocate the inp struct */
@@ -531,10 +530,10 @@ struct dcmipp_ent_device *dcmipp_inp_ent_init(struct device *dev,
 	if (!inp)
 		return ERR_PTR(-ENOMEM);
 
-	inp->regs = regs;
+	inp->regs = dcmipp->regs;
 
 	/* Initialize ved and sd */
-	ret = dcmipp_ent_sd_register(&inp->ved, &inp->sd, v4l2_dev,
+	ret = dcmipp_ent_sd_register(&inp->ved, &inp->sd, &dcmipp->v4l2_dev,
 				     entity_name, MEDIA_ENT_F_VID_IF_BRIDGE,
 				     ARRAY_SIZE(pads_flag), pads_flag,
 				     &dcmipp_inp_int_ops, &dcmipp_inp_ops,
@@ -543,6 +542,7 @@ struct dcmipp_ent_device *dcmipp_inp_ent_init(struct device *dev,
 		kfree(inp);
 		return ERR_PTR(ret);
 	}
+	inp->ved.dcmipp = dcmipp;
 
 	inp->dev = dev;
 

-- 
2.34.1


