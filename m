Return-Path: <linux-media+bounces-52025-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDvOAi2ugGmiAQMAu9opvQ
	(envelope-from <linux-media+bounces-52025-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 15:01:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0DBCD0EB
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 15:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F2DD3031CBD
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 13:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813B236F438;
	Mon,  2 Feb 2026 13:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ViyOJ30P"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E6F36D4ED;
	Mon,  2 Feb 2026 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770040699; cv=fail; b=jVqlSCRrTQMr6BiKJh3OfjSQphqN8Gg9mcCyj6gGA2/lZeSV0kQjxCkGwfsfcxiG23P+hzSmvkDgVkapzqaw2t88gw5H5GUCDFyME4KLNdK6uWMbMCxIY6U+5TTLdosZMvpyIVhRl0toNm14+x1sXEzgd8H3Q8L8FHgREyzXzxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770040699; c=relaxed/simple;
	bh=I/IagQkiLKt9/m5/X0eE+BXLL1MEAsCCTnXDvqmJXN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rr8v5R1JmGgOLODB5knIxh6oWh49phlkVWRsCUPX7XnQm0PTZAc4HSAkem66Lx8ogfPWMv0fhpjGU+AJvgcy/WA1qCf8jzsUQt+yFP2IlP64N0Ajjg3iKnm+PESSZyVezWqYalnW5gjCxM6LCQP/+qjZbovIWsv38NWqCPwaGPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ViyOJ30P; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612DcUIm294926;
	Mon, 2 Feb 2026 14:58:00 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011058.outbound.protection.outlook.com [40.107.130.58])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4c1aq7p39t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 14:58:00 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDkKqtyVjPzoC+0u/o0MZdhapBu85akEvpOhWt9urhYcJ5gWI/IWNVn5jsSlrgCykNTh3OwvKubVi65Soay6Y5FAoARV2qZVgUSHYHT3eX3WUXaj0Uyg9rn/ROxmwJRyXaArX2XC4sicAO/NUR8qf+gqLMNkSeyFH5bDY6boHYrd65dYjzIOlDMrGwzTblcTUuIW8iXK8mF5TBHIJsQuqQH/6jj7FLoxGpZF/649SV/jJH9hR4j94NQJSIPK48e58Ox5Sd40XfBYqy1y69NO0nQvncz+fjvkonFZX6X0vG8dk/tTzMcvC18+wUHR+jlQzAM7PonDY9XIc3nRUerkuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sk4Ym5XNYu+tAp9SzfPnnwR8yBDUjTo3q68puuxuqeE=;
 b=yDOmO75SYyJLw1GpxiVapYS9XEbiFDPVP8VI7RGp+XXVVVr2Nxs4G95/uOr7FBX6jamebysZsGnCNYjmk15M3OeIfDCt2ki2pOVTamqho8+XBSviWIIhlRho99MMX+E7MywthB/O+BR7B0xH26vsv8XZnXIuELJKLCwvIa2HetvvC+YZLgrhnnkvx9FUg/Mtaaq47MfidachpR59weT7dONyDP0yviiNRlDqHVwRN6YwSziosY2aBjFKqZU6x5pvm90CtIDq6RP6GG9UiWEA3nvPzsdHkDxIok9RzPyZRI21N2G6y7BQeQhNd3gvl5MHAeSVFKLatWqI+V93fiqs+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sk4Ym5XNYu+tAp9SzfPnnwR8yBDUjTo3q68puuxuqeE=;
 b=ViyOJ30Phz1eYhRqnt+VmZgnHyzhlMvlGacGu9dzgYGyzvrnxUPza6hcRirJ6O4goHcW9+e7XrZIGA2FdBlGEGegmwqldvbX/G9xTq9w7x/3lRoGx7EjMqeOgb6alwaHz3nZ1Sx6EqhOheyW4S6DuXMB6kdUU6ty5pcWwSQ190rRY7O0NyvWaojeUVk/S1YiANo3+QTlv/AIoNRu1kDLclp5lUgJNFqE7Lt+Z9wOCmMngurq8r14Eu6tYyndfBmB6GuZflYfvIxST7AKyPAo5jwMYpNli+JuIr7qLmljfTczX2Uzo4QXjUyE22Al5tItOOe96eH7SFUtmTZ860Qotg==
Received: from AS4P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::6)
 by VE1PR10MB3951.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:161::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 13:57:53 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::30) by AS4P191CA0002.outlook.office365.com
 (2603:10a6:20b:5d5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 13:57:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 13:57:52 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:59:38 +0100
Received: from localhost (10.252.7.227) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:57:51 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 2 Feb 2026 14:57:36 +0100
Subject: [PATCH 11/13] media: stm32: dcmipp: add pixel-pipe support in
 bytecap
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260202-stm32-dcmipp-pixel-pipes-support-v1-11-8d8d51f5e014@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019D:EE_|VE1PR10MB3951:EE_
X-MS-Office365-Filtering-Correlation-Id: af1773c7-e9ff-497b-4d52-08de62630efa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWlGMWxvUHkyaWxFRFRRaXIvd1VBWENBSmFqZUJqNTduSGZ4bHFCK1E1ZUNi?=
 =?utf-8?B?THN1elFOd3B0TmxmcjVUQ205d0dWUkZMUTltQkQyVGVubXhETU9sZXIwMHRt?=
 =?utf-8?B?WEF2L1VFTExFZFprdXFvMVBmZ08yQkptcHNSR0ViRFFxQXBqM3JlekxjZlJS?=
 =?utf-8?B?NVBNVVdiL0s0QzVEcHdGQjBwM2JpeFJpbmZnek9jVllwMUV6dlRrdmxGKzBS?=
 =?utf-8?B?MktXU0t6TVJtR3pleDdtRGZKSDM3dXc3VEZMaUFmVmZWb0ZBWDhlRDdFK0lE?=
 =?utf-8?B?R2M3RFNaNFQwMjhuNEJKY091RG5EazJLWFkvRmErVUQvSnpMQ0VaMWVoeGYy?=
 =?utf-8?B?NnlGSmxkcmhrOG9adDdNNlFNbWdjdk0xRy9EUXN5WDYwY3k0N2x3OGF3YlZz?=
 =?utf-8?B?eElOY2NGdllLZlU2ajRQYXB1bTF1ZlJRM0J4cHVMUTZiYVVxWXBpZEVwWjFQ?=
 =?utf-8?B?bU9SMWZ2bHVVcjZ1S3hNZXN4UmZ5TlFtY3hEeDBwMlRmTnhFWnM4Wk1tRU5X?=
 =?utf-8?B?N2hjTmdxMFdoeEVJdGhRZVJ3ek5FZW1OUmVKdEt3ZWNKYUpIbzhqQUhNRUs5?=
 =?utf-8?B?WmtpOEs1NnRFLzVUTVhVRTQ1bHBFNEpZNVZoRzBBMHJJZVM1RmwrWjEybUw4?=
 =?utf-8?B?UVlOZmhsTUFjajQ5b2pjRVpnSmkva0wyRlBycGFVUTY1QjZmTUV1OTlkMUh3?=
 =?utf-8?B?RiswM0tLWjRVdExLdnMvcHBTeWd6YmVoa2lmNzIxQ29sKzBFUmxUZzF0ZmZa?=
 =?utf-8?B?L2ZiajhaSmpYRjF4V2hDSmZvb0tJcUhUL211VXhtblFoR0ZUcmMxeEdzbTBV?=
 =?utf-8?B?d1ZQa3h0ejN5cUNWNnRGMklEanhtZ1ZPZ0QyWXpaS1FWQ2pPQVN0WVAyR3Ju?=
 =?utf-8?B?ZkxyZWRaZk9GMFhxYTA0SmNvMWpJOFBiYmNlWkJUWGZKRXJvdWthUDRnVTZP?=
 =?utf-8?B?eXVnRTh6elRvbDhTb0dUbmN3VGZSdldpaC9sbktNckVwTzFHS3dROXhCa1Ft?=
 =?utf-8?B?NkxmUTZzVGI2NmxTUWpGNXU3Z0dWVytrNmFxcFRkL3h1Tk4yRHZmV01adUN5?=
 =?utf-8?B?bEpLc1F3RzZLalF6MjVEL28yeWNDSG1BQ0RQZkp1Tm1NdS9qTk8rN01tc0t4?=
 =?utf-8?B?SDdZZUU3dVZYYURTYThuZVptTGRBRnROaEFGUzVyT1RoQ1g4TEJkMHN4YTQ0?=
 =?utf-8?B?cW82VVVtOFM5aEw2NkRkNWxuYmZZQUxwd2ZTT241ZjFHenVRSTNYRk9sOUI5?=
 =?utf-8?B?QWtuaVBMdVhySTIrMElFamRTNmJLMzhXRVpCM1lUeXNsYWtxUUV5SHVzWm83?=
 =?utf-8?B?cVhHVUNhMXBLcUxmWWkreDBFelVkVTB2M2UxRy96WmZBM0ZZQ0JNMEp1dmhP?=
 =?utf-8?B?UFZsM2k1RTBaL0srb1BGTnN6Tld4eU9MY0JqMzRWSE9IT2ZCYXM5THc4WnNw?=
 =?utf-8?B?MVBmQjJLVFR3L2FZa1NWblR5QkhVRGVBYTBhRmhnc3R4WittZmNPd2V3S0h3?=
 =?utf-8?B?Y0V3ZllDcSttNkoxamFEWDR4MThpdERSZmsxR05FSWhWL21kVi9YaUxBaHpx?=
 =?utf-8?B?WDJtdXgrMGZKY2R0THFZR25hc0lRVDVNM1lWKzJmS0xoeThRQis4WjlOQWM0?=
 =?utf-8?B?aldMM2V1K0E5UTFlZk5TczBQZTFXUVlZZlU3b1RpNllYMUJsdlJIaDZ5c2Q2?=
 =?utf-8?B?SXZzTjl2N3RxVW1mUE42VVZaRDIwdnlhbGJsdzBDdlZIK1BqclR1dWtrL3c5?=
 =?utf-8?B?dkY3ZUJFelMrZWMxUDVlS01SUm9Mb2ZhdlVQNzdPbGFGdnVGOG1aMCt0RTNF?=
 =?utf-8?B?YXVYMVJyU0M0T1huWS85WXkvcFNSSUVGeEFKdHlYZHE0ODl0dVdLTnplRCsy?=
 =?utf-8?B?K3FmZEtuL3BoRGxnaTc0S2R4eUZiSTh4ek5ncXlQSnJHUmtwMjhnb0VKeXZW?=
 =?utf-8?B?dE9zK1NmSlYxZTRvUGl1czdJZ0tIdS85d1NnWlF3aFBjSU9qYnpxc1ZhSWVD?=
 =?utf-8?B?V0FTYjNzSXYwdlN1NUFjZm1TeEFzRHplc0tOYXlJa0ROY2dQZnJBS3N0MDVN?=
 =?utf-8?B?eVFrcjFTVUxCdDhPdm1HeWtBdGxYRU82VG1GN0lpL1Z5QVNnbm9BRVRMTW9r?=
 =?utf-8?B?a0JYa1BOazZZbEpKNWc3ekJlbGo0di96eGZHMzl2UDFWZVloZDRqb3pLbTJQ?=
 =?utf-8?B?c3VGN1RpWGlhYTNDejdKSkQ3MitpZGVUQVFNZ0kwbEZnaGgvVVBTbllxSm1p?=
 =?utf-8?B?dXQ2dE5nT0NXWVJLOUFwaXdreWN3PT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZfDJlrMM5iV+wi7gj7+MOe4ShZIa9OSC9Y9rbwNTg/4ElclRBJo/unCxUnf+yBGXdZlztTptDtd1WzUOIZDJqL06DQqR/KD076QKcK4PRI8DoslwiwitKO3a/AnCZLrLGoVOuFz1DkZVTaIsUwv8EP2yAC7fzz4ijid6/RfSiMQWPTAxufOhABAOxWo5p/52VutyBD862ImnfDQYwL2kqMIoGzi60QA1kwS5Zg19T0WtsZrjgPBGtipcM69iwaH6z4P30oqF1LsmLQtzY4F7klVfh4RNrpSLtt9jkmQWAVBF1PXEHSTSTkecS/cyFaXnq9GmfAnQUoqDe1cS6BGcbkSPpyfODS37oydLTqVsuvwlpNUZwDt0GgLPzVaZD96E3nVq82W5yoKmmcWH8TK1sK/rDdzqH6rNDmqpv6UIMG5/Z+LPd0aJNuwN5YSoUxZ1
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 13:57:52.4968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af1773c7-e9ff-497b-4d52-08de62630efa
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3951
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEwOSBTYWx0ZWRfX8/8/RuERMmMh
 QyIADKm1EA04lJrrb/dE/nOAG2xatVttZujpMlOVwXCWKOYmg3Yvu/NB9uauINWNyOEeIZ7C/CT
 m6kNwXP0josfHS2GCvOFBhMqbGvcVyDBGQTGUXZNTbbYYVWhaaTWdizAgEkO4qxPtQzgnausMRk
 VEZeLISUGyOZV8TsxcBUBJlTARtaBmr52+9T2LwEm1CdcYZ8a2QV45F0CGMWEfOl/E3pMa58Mpt
 kUGMHwFMerpRfLpGTpmDNXmtK2DMiywMX9YUcoZONm5PeG8t10v6NOFibAa2erqigrfWp4fsN9d
 zLJGuzS5UpaEDsmjs6KygfIqSy9GcHLyhUNpheOyFgWFBRKnyd3U3efhiB5y64LrvJfHq150o5/
 0JWA8x4+AM/5ztqQPmEE45ktJDV3K2GDOo7cAxnvHkIVJZ0kQEwpZp47vH0PDeQCkhB4TC4mh8S
 l3Am0wFoiZ439rscDsg==
X-Authority-Analysis: v=2.4 cv=LLBrgZW9 c=1 sm=1 tr=0 ts=6980ad68 cx=c_pps
 a=9AYPsD8W/ECldZET4Imr7g==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Xa52oM6mtQYA:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=MSClPMRaPwh2puV3uXMA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: vlF4B7PvpGiNypoR_uZ7tQMqlNvQAE-8
X-Proofpoint-ORIG-GUID: vlF4B7PvpGiNypoR_uZ7tQMqlNvQAE-8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52025-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,st.com:email]
X-Rspamd-Queue-Id: 5C0DBCD0EB
X-Rspamd-Action: no action

The dump pipe and pixel pipes capture part (tail of each pipe)
is different in that pixel pipes have a pixel packer capable
of generating various output format while the on dump pipe no
such manipulation is possible.
Still, all the buffer handling, format related manipulations
are all same hence both dump and pixel pipe capture part are
put together to avoid having large duplication of code.

This patch adds the pixel pipe capture within bytecap hence
name isn't modified and a further commit should rename the
file and probably function name to not only highlight byte
capture (aka dump pipe).

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         | 414 ++++++++++++++++++---
 1 file changed, 353 insertions(+), 61 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 2fb34cac89c6..e96ba7931b27 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -25,27 +25,82 @@
 #define DCMIPP_CMIER_P0ALL	(DCMIPP_CMIER_P0VSYNCIE |\
 				 DCMIPP_CMIER_P0FRAMEIE |\
 				 DCMIPP_CMIER_P0OVRIE)
+#define DCMIPP_CMIER_P1FRAMEIE	BIT(17)
+#define DCMIPP_CMIER_P1VSYNCIE	BIT(18)
+#define DCMIPP_CMIER_P1OVRIE	BIT(23)
+#define DCMIPP_CMIER_P1ALL	(DCMIPP_CMIER_P1VSYNCIE |\
+				 DCMIPP_CMIER_P1FRAMEIE |\
+				 DCMIPP_CMIER_P1OVRIE)
+#define DCMIPP_CMIER_P2FRAMEIE	BIT(25)
+#define DCMIPP_CMIER_P2VSYNCIE	BIT(26)
+#define DCMIPP_CMIER_P2OVRIE	BIT(31)
+#define DCMIPP_CMIER_P2ALL	(DCMIPP_CMIER_P2VSYNCIE |\
+				 DCMIPP_CMIER_P2FRAMEIE |\
+				 DCMIPP_CMIER_P2OVRIE)
+#define DCMIPP_CMIER_PxALL(id)	(((id) == 0) ? DCMIPP_CMIER_P0ALL :	\
+				 (((id) == 1) ? DCMIPP_CMIER_P1ALL :	\
+						DCMIPP_CMIER_P2ALL))
 #define DCMIPP_CMSR1		0x3f4
 #define DCMIPP_CMSR2		0x3f8
 #define DCMIPP_CMSR2_P0FRAMEF	BIT(9)
 #define DCMIPP_CMSR2_P0VSYNCF	BIT(10)
 #define DCMIPP_CMSR2_P0OVRF	BIT(15)
+#define DCMIPP_CMSR2_P1FRAMEF	BIT(17)
+#define DCMIPP_CMSR2_P1VSYNCF	BIT(18)
+#define DCMIPP_CMSR2_P1OVRF	BIT(23)
+#define DCMIPP_CMSR2_P2FRAMEF	BIT(25)
+#define DCMIPP_CMSR2_P2VSYNCF	BIT(26)
+#define DCMIPP_CMSR2_P2OVRF	BIT(31)
+#define DCMIPP_CMSR2_PxFRAMEF(id)	(((id) == 0) ? DCMIPP_CMSR2_P0FRAMEF :\
+					 (((id) == 1) ? DCMIPP_CMSR2_P1FRAMEF :\
+						       DCMIPP_CMSR2_P2FRAMEF))
+#define DCMIPP_CMSR2_PxVSYNCF(id)	(((id) == 0) ? DCMIPP_CMSR2_P0VSYNCF :\
+					 (((id) == 1) ? DCMIPP_CMSR2_P1VSYNCF :\
+						       DCMIPP_CMSR2_P2VSYNCF))
+#define DCMIPP_CMSR2_PxOVRF(id)	(((id) == 0) ? DCMIPP_CMSR2_P0OVRF :\
+				 (((id) == 1) ? DCMIPP_CMSR2_P1OVRF :\
+					       DCMIPP_CMSR2_P2OVRF))
 #define DCMIPP_CMFCR		0x3fc
-#define DCMIPP_P0FSCR		0x404
-#define DCMIPP_P0FSCR_PIPEN	BIT(31)
-#define DCMIPP_P0FCTCR		0x500
-#define DCMIPP_P0FCTCR_CPTREQ	BIT(3)
+#define DCMIPP_PxFSCR(id)	(0x404 + ((id) * 0x400))
+#define DCMIPP_PxFSCR_PIPEN	BIT(31)
+#define DCMIPP_PxFCTCR(id)	(0x500 + ((id) * 0x400))
+#define DCMIPP_PxFCTCR_CPTREQ	BIT(3)
 #define DCMIPP_P0DCCNTR		0x5b0
 #define DCMIPP_P0DCLMTR		0x5b4
 #define DCMIPP_P0DCLMTR_ENABLE	BIT(31)
 #define DCMIPP_P0DCLMTR_LIMIT_MASK	GENMASK(23, 0)
-#define DCMIPP_P0PPM0AR1	0x5c4
-#define DCMIPP_P0SR		0x5f8
-#define DCMIPP_P0SR_CPTACT	BIT(23)
+
+#define DCMIPP_PxPPM0AR1(id)	(0x5c4 + ((id) * 0x400))
+#define DCMIPP_PxPPM0PR(id)	(0x9cc + (((id) - 1) * 0x400))
+#define DCMIPP_P1PPM1AR1	0x9d4
+#define DCMIPP_P1PPM1PR		0x9dc
+#define DCMIPP_P1PPM2AR1	0x9e4
+
+
+#define DCMIPP_PxSR(id)		(0x5f8 + ((id) * 0x400))
+#define DCMIPP_PxSR_CPTACT	BIT(23)
+
+#define DCMIPP_PxPPCR(id)	(0x9c0 + (((id) - 1) * 0x400))
+#define DCMIPP_PxPPCR_FORMAT_RGB888	0x0
+#define DCMIPP_PxPPCR_FORMAT_RGB565	0x1
+#define DCMIPP_PxPPCR_FORMAT_ARGB8888	0x2
+#define DCMIPP_PxPPCR_FORMAT_RGBA8888	0x3
+#define DCMIPP_PxPPCR_FORMAT_Y8		0x4
+#define DCMIPP_PxPPCR_FORMAT_YUV444	0x5
+#define DCMIPP_PxPPCR_FORMAT_YUYV	0x6
+#define DCMIPP_P1PPCR_FORMAT_NV61	0x7
+#define DCMIPP_P1PPCR_FORMAT_NV21	0x8
+#define DCMIPP_P1PPCR_FORMAT_YV12	0x9
+#define DCMIPP_PxPPCR_FORMAT_UYVY	0xa
+
+#define DCMIPP_PxPPCR_SWAPRB		BIT(4)
 
 struct dcmipp_bytecap_pix_map {
 	unsigned int code;
 	u32 pixelformat;
+	u32 plane_nb;
+	unsigned int ppcr_fmt;
+	unsigned int swap_uv;
 };
 
 #define PIXMAP_MBUS_PFMT(mbus, fmt)			\
@@ -54,7 +109,7 @@ struct dcmipp_bytecap_pix_map {
 		.pixelformat = V4L2_PIX_FMT_##fmt	\
 	}
 
-static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_pix_map_list[] = {
+static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_dump_pix_map_list[] = {
 	PIXMAP_MBUS_PFMT(RGB565_2X8_LE, RGB565),
 	PIXMAP_MBUS_PFMT(RGB565_1X16, RGB565),
 	PIXMAP_MBUS_PFMT(RGB888_1X24, RGB24),
@@ -89,24 +144,47 @@ static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_pix_map_list[] = {
 	PIXMAP_MBUS_PFMT(JPEG_1X8, JPEG),
 };
 
-static const struct dcmipp_bytecap_pix_map *
-dcmipp_bytecap_pix_map_by_pixelformat(u32 pixelformat)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(dcmipp_bytecap_pix_map_list); i++) {
-		if (dcmipp_bytecap_pix_map_list[i].pixelformat == pixelformat)
-			return &dcmipp_bytecap_pix_map_list[i];
+#define PIXMAP_MBUS_PIXEL_PFMT(mbus, fmt, nb_plane, pp_code, swap)		\
+	{						\
+		.code = MEDIA_BUS_FMT_##mbus,		\
+		.pixelformat = V4L2_PIX_FMT_##fmt,	\
+		.plane_nb = nb_plane,			\
+		.ppcr_fmt = pp_code,			\
+		.swap_uv = swap,			\
 	}
 
-	return NULL;
-}
+static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_pixel_pix_map_list[] = {
+	/* Coplanar formats are supported on main & aux pipe */
+	PIXMAP_MBUS_PIXEL_PFMT(RGB888_1X24, RGB565, 1, DCMIPP_PxPPCR_FORMAT_RGB565, 0),
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, YUYV, 1, DCMIPP_PxPPCR_FORMAT_YUYV, 0),
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, YVYU, 1, DCMIPP_PxPPCR_FORMAT_YUYV, 1),
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, UYVY, 1, DCMIPP_PxPPCR_FORMAT_UYVY, 0),
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, VYUY, 1, DCMIPP_PxPPCR_FORMAT_UYVY, 1),
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, GREY, 1, DCMIPP_PxPPCR_FORMAT_Y8, 0),
+	PIXMAP_MBUS_PIXEL_PFMT(RGB888_1X24, RGB24, 1, DCMIPP_PxPPCR_FORMAT_RGB888, 1),
+	PIXMAP_MBUS_PIXEL_PFMT(RGB888_1X24, BGR24, 1, DCMIPP_PxPPCR_FORMAT_RGB888, 0),
+	PIXMAP_MBUS_PIXEL_PFMT(RGB888_1X24, ARGB32, 1, DCMIPP_PxPPCR_FORMAT_RGBA8888, 1),
+	PIXMAP_MBUS_PIXEL_PFMT(RGB888_1X24, ABGR32, 1, DCMIPP_PxPPCR_FORMAT_ARGB8888, 0),
+	PIXMAP_MBUS_PIXEL_PFMT(RGB888_1X24, RGBA32, 1, DCMIPP_PxPPCR_FORMAT_ARGB8888, 1),
+	PIXMAP_MBUS_PIXEL_PFMT(RGB888_1X24, BGRA32, 1, DCMIPP_PxPPCR_FORMAT_RGBA8888, 0),
+
+	/* Semiplanar & planar formats (plane_nb > 1) are only supported on main pipe */
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, NV12, 2, DCMIPP_P1PPCR_FORMAT_NV21, 0),
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, NV21, 2, DCMIPP_P1PPCR_FORMAT_NV21, 1),
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, NV16, 2, DCMIPP_P1PPCR_FORMAT_NV61, 0),
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, NV61, 2, DCMIPP_P1PPCR_FORMAT_NV61, 1),
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, YUV420, 3, DCMIPP_P1PPCR_FORMAT_YV12, 0),
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, YVU420, 3, DCMIPP_P1PPCR_FORMAT_YV12, 1),
+};
 
 struct dcmipp_buf {
 	struct vb2_v4l2_buffer	vb;
 	bool			prepared;
 	dma_addr_t		addr;
 	size_t			size;
+	dma_addr_t		addrs[3];
+	u32			strides[3];
+	u64			sizes[3];
 	struct list_head	list;
 };
 
@@ -140,6 +218,11 @@ struct dcmipp_bytecap_device {
 
 	void __iomem *regs;
 
+	u32 pipe_id;
+
+	const struct dcmipp_bytecap_pix_map *pix_map;
+	unsigned int pix_map_array_size;
+
 	u32 cmsr2;
 
 	struct {
@@ -155,6 +238,30 @@ struct dcmipp_bytecap_device {
 	} count;
 };
 
+static const struct dcmipp_bytecap_pix_map *
+dcmipp_bytecap_pix_map_by_pixelformat(struct dcmipp_bytecap_device *vcap,
+				      u32 pixelformat)
+{
+	for (unsigned int i = 0; i < vcap->pix_map_array_size; i++) {
+		if (vcap->pix_map[i].pixelformat == pixelformat)
+			return &vcap->pix_map[i];
+	}
+
+	return NULL;
+}
+
+static bool dcmipp_bytecap_is_format_valid(struct dcmipp_bytecap_device *vcap,
+					   unsigned int pixelformat)
+{
+	const struct dcmipp_bytecap_pix_map *vpix =
+		dcmipp_bytecap_pix_map_by_pixelformat(vcap, pixelformat);
+
+	if (!vpix || (vpix->plane_nb > 1 && vcap->pipe_id != 1))
+		return false;
+
+	return true;
+}
+
 static const struct v4l2_pix_format fmt_default = {
 	.width = DCMIPP_FMT_WIDTH_DEFAULT,
 	.height = DCMIPP_FMT_HEIGHT_DEFAULT,
@@ -168,6 +275,73 @@ static const struct v4l2_pix_format fmt_default = {
 	.xfer_func = DCMIPP_XFER_FUNC_DEFAULT,
 };
 
+static inline int hdw_pixel_alignment(u32 format)
+{
+	/* 16 bytes alignment required by hardware */
+	switch (format) {
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
+	case V4L2_PIX_FMT_YUV420:
+	case V4L2_PIX_FMT_YVU420:
+	case V4L2_PIX_FMT_NV16:
+	case V4L2_PIX_FMT_NV61:
+	case V4L2_PIX_FMT_GREY:
+		return 4;/* 2^4 = 16 pixels = 16 bytes */
+	case V4L2_PIX_FMT_RGB565:
+	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_YVYU:
+	case V4L2_PIX_FMT_UYVY:
+	case V4L2_PIX_FMT_VYUY:
+		return 3;/* 2^3  = 8 pixels = 16 bytes */
+	case V4L2_PIX_FMT_RGB24:
+	case V4L2_PIX_FMT_BGR24:
+		return 4;/* 2^4 = 16 pixels = 48 bytes */
+	case V4L2_PIX_FMT_ARGB32:
+	case V4L2_PIX_FMT_ABGR32:
+	case V4L2_PIX_FMT_RGBA32:
+	case V4L2_PIX_FMT_BGRA32:
+		return 2;/* 2^2  = 4 pixels = 16 bytes */
+	default:
+		return 0;
+	}
+}
+
+static inline int frame_planes(dma_addr_t base_addr, dma_addr_t addrs[],
+			       u32 strides[], u64 sizes[],
+			       u32 width, u32 height, u32 format)
+{
+	const struct v4l2_format_info *info;
+
+	/* Only used by dump pipe hence addrs[0] is enough */
+	if (format == V4L2_PIX_FMT_JPEG) {
+		addrs[0] = base_addr;
+		return 0;
+	}
+
+	info = v4l2_format_info(format);
+	if (!info)
+		return -EINVAL;
+
+	/* Fill-in each plane information */
+	addrs[0] = base_addr;
+	strides[0] = width * info->bpp[0];
+	sizes[0] = strides[0] * height;
+
+	if (info->comp_planes > 1) {
+		addrs[1] = addrs[0] + sizes[0];
+		strides[1] = width * info->bpp[1] / info->hdiv;
+		sizes[1] = strides[1] * height / info->vdiv;
+	}
+
+	if (info->comp_planes > 2) {
+		addrs[2] = addrs[1] + sizes[1];
+		strides[2] = width * info->bpp[2] / info->hdiv;
+		sizes[2] = strides[2] * height / info->vdiv;
+	}
+
+	return 0;
+}
+
 static int dcmipp_bytecap_querycap(struct file *file, void *priv,
 				   struct v4l2_capability *cap)
 {
@@ -192,19 +366,20 @@ static int dcmipp_bytecap_try_fmt_vid_cap(struct file *file, void *priv,
 {
 	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
 	struct v4l2_pix_format *format = &f->fmt.pix;
-	const struct dcmipp_bytecap_pix_map *vpix;
+	/* Take into consideration the width constraint of the pixel packer */
+	unsigned int walign = (vcap->pipe_id != 0 ?
+			       hdw_pixel_alignment(format->pixelformat) : 0);
 	u32 in_w, in_h;
 
 	/* Don't accept a pixelformat that is not on the table */
-	vpix = dcmipp_bytecap_pix_map_by_pixelformat(format->pixelformat);
-	if (!vpix)
+	if (!dcmipp_bytecap_is_format_valid(vcap, format->pixelformat))
 		format->pixelformat = fmt_default.pixelformat;
 
 	/* Adjust width & height */
 	in_w = format->width;
 	in_h = format->height;
 	v4l_bound_align_image(&format->width, DCMIPP_FRAME_MIN_WIDTH,
-			      DCMIPP_FRAME_MAX_WIDTH, 0, &format->height,
+			      DCMIPP_FRAME_MAX_WIDTH, walign, &format->height,
 			      DCMIPP_FRAME_MIN_HEIGHT, DCMIPP_FRAME_MAX_HEIGHT,
 			      0, 0);
 	if (format->width != in_w || format->height != in_h)
@@ -262,7 +437,7 @@ static int dcmipp_bytecap_s_fmt_vid_cap(struct file *file, void *priv,
 static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file, void *priv,
 					   struct v4l2_fmtdesc *f)
 {
-	const struct dcmipp_bytecap_pix_map *vpix;
+	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
 	unsigned int index = f->index;
 	unsigned int i, prev_pixelformat = 0;
 
@@ -271,17 +446,20 @@ static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file, void *priv,
 	 * care of removing duplicated entries (due to support of both
 	 * parallel & csi 16 bits formats
 	 */
-	for (i = 0; i < ARRAY_SIZE(dcmipp_bytecap_pix_map_list); i++) {
-		vpix = &dcmipp_bytecap_pix_map_list[i];
+	for (i = 0; i < vcap->pix_map_array_size; i++) {
+		/* Only main pipe supports (Semi)-planar formats */
+		if (vcap->pipe_id != 1 && vcap->pix_map[i].plane_nb > 1)
+			continue;
+
 		/* Skip formats not matching requested mbus code */
-		if (f->mbus_code && vpix->code != f->mbus_code)
+		if (f->mbus_code && vcap->pix_map[i].code != f->mbus_code)
 			continue;
 
 		/* Skip duplicated pixelformat */
-		if (vpix->pixelformat == prev_pixelformat)
+		if (vcap->pix_map[i].pixelformat == prev_pixelformat)
 			continue;
 
-		prev_pixelformat = vpix->pixelformat;
+		prev_pixelformat = vcap->pix_map[i].pixelformat;
 
 		if (index == 0)
 			break;
@@ -289,10 +467,10 @@ static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file, void *priv,
 		index--;
 	}
 
-	if (i == ARRAY_SIZE(dcmipp_bytecap_pix_map_list))
+	if (i == vcap->pix_map_array_size)
 		return -EINVAL;
 
-	f->pixelformat = vpix->pixelformat;
+	f->pixelformat = vcap->pix_map[i].pixelformat;
 
 	return 0;
 }
@@ -300,14 +478,14 @@ static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file, void *priv,
 static int dcmipp_bytecap_enum_framesizes(struct file *file, void *fh,
 					  struct v4l2_frmsizeenum *fsize)
 {
-	const struct dcmipp_bytecap_pix_map *vpix;
+	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+
 
 	if (fsize->index)
 		return -EINVAL;
 
 	/* Only accept code in the pix map table */
-	vpix = dcmipp_bytecap_pix_map_by_pixelformat(fsize->pixel_format);
-	if (!vpix)
+	if (!dcmipp_bytecap_is_format_valid(vcap, fsize->pixel_format))
 		return -EINVAL;
 
 	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
@@ -355,14 +533,27 @@ static void dcmipp_start_capture(struct dcmipp_bytecap_device *vcap,
 				 struct dcmipp_buf *buf)
 {
 	/* Set buffer address */
-	reg_write(vcap, DCMIPP_P0PPM0AR1, buf->addr);
+	reg_write(vcap, DCMIPP_PxPPM0AR1(vcap->pipe_id), buf->addrs[0]);
+
+	if (vcap->pipe_id == 0) {
+		/* Set buffer size */
+		reg_write(vcap, DCMIPP_P0DCLMTR, DCMIPP_P0DCLMTR_ENABLE |
+			  ((buf->size / 4) & DCMIPP_P0DCLMTR_LIMIT_MASK));
+	} else {
+		reg_write(vcap, DCMIPP_PxPPM0PR(vcap->pipe_id),
+			  buf->strides[0]);
+
+		if (buf->addrs[1]) {
+			reg_write(vcap, DCMIPP_P1PPM1AR1, buf->addrs[1]);
+			reg_write(vcap, DCMIPP_P1PPM1PR, buf->strides[1]);
+		}
 
-	/* Set buffer size */
-	reg_write(vcap, DCMIPP_P0DCLMTR, DCMIPP_P0DCLMTR_ENABLE |
-		  ((buf->size / 4) & DCMIPP_P0DCLMTR_LIMIT_MASK));
+		if (buf->addrs[2])
+			reg_write(vcap, DCMIPP_P1PPM2AR1, buf->addrs[2]);
+	}
 
 	/* Capture request */
-	reg_set(vcap, DCMIPP_P0FCTCR, DCMIPP_P0FCTCR_CPTREQ);
+	reg_set(vcap, DCMIPP_PxFCTCR(vcap->pipe_id), DCMIPP_PxFCTCR_CPTREQ);
 }
 
 static void dcmipp_bytecap_all_buffers_done(struct dcmipp_bytecap_device *vcap,
@@ -421,8 +612,25 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 
 	spin_lock_irq(&vcap->irqlock);
 
+	if (vcap->pipe_id != 0) {
+		const struct dcmipp_bytecap_pix_map *vpix =
+			dcmipp_bytecap_pix_map_by_pixelformat(vcap, vcap->format.pixelformat);
+		unsigned int ppcr = 0;
+
+		/*
+		 * Configure the Pixel Packer
+		 * vpix is guaranteed to be valid since pixelformat is validated
+		 * in dcmipp_pixelcap_s_fmt_vid_cap function before
+		 */
+		ppcr = vpix->ppcr_fmt;
+		if (vpix->swap_uv)
+			ppcr |= DCMIPP_PxPPCR_SWAPRB;
+
+		reg_write(vcap, DCMIPP_PxPPCR(vcap->pipe_id), ppcr);
+	}
+
 	/* Enable pipe at the end of programming */
-	reg_set(vcap, DCMIPP_P0FSCR, DCMIPP_P0FSCR_PIPEN);
+	reg_set(vcap, DCMIPP_PxFSCR(vcap->pipe_id), DCMIPP_PxFSCR_PIPEN);
 
 	/*
 	 * vb2 framework guarantee that we have at least 'min_queued_buffers'
@@ -436,7 +644,7 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 
 	/* Enable interruptions */
 	spin_lock(&vcap->vdev.v4l2_dev->lock);
-	reg_set(vcap, DCMIPP_CMIER, DCMIPP_CMIER_P0ALL);
+	reg_set(vcap, DCMIPP_CMIER, DCMIPP_CMIER_PxALL(vcap->pipe_id));
 	spin_unlock(&vcap->vdev.v4l2_dev->lock);
 
 	vcap->state = DCMIPP_RUNNING;
@@ -467,7 +675,7 @@ static void dcmipp_dump_status(struct dcmipp_bytecap_device *vcap)
 	struct device *dev = vcap->dev;
 
 	dev_dbg(dev, "[DCMIPP_PRSR]  =%#10.8x\n", reg_read(vcap, DCMIPP_PRSR));
-	dev_dbg(dev, "[DCMIPP_P0SR] =%#10.8x\n", reg_read(vcap, DCMIPP_P0SR));
+	dev_dbg(dev, "[DCMIPP_P0SR] =%#10.8x\n", reg_read(vcap, DCMIPP_PxSR(0)));
 	dev_dbg(dev, "[DCMIPP_P0DCCNTR]=%#10.8x\n",
 		reg_read(vcap, DCMIPP_P0DCCNTR));
 	dev_dbg(dev, "[DCMIPP_CMSR1] =%#10.8x\n", reg_read(vcap, DCMIPP_CMSR1));
@@ -494,25 +702,26 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
 
 	/* Disable interruptions */
 	spin_lock(&vcap->vdev.v4l2_dev->lock);
-	reg_clear(vcap, DCMIPP_CMIER, DCMIPP_CMIER_P0ALL);
+	reg_clear(vcap, DCMIPP_CMIER, DCMIPP_CMIER_PxALL(vcap->pipe_id));
 	spin_unlock(&vcap->vdev.v4l2_dev->lock);
 
 	/* Stop capture */
-	reg_clear(vcap, DCMIPP_P0FCTCR, DCMIPP_P0FCTCR_CPTREQ);
+	reg_clear(vcap, DCMIPP_PxFCTCR(vcap->pipe_id), DCMIPP_PxFCTCR_CPTREQ);
 
 	/* Wait until CPTACT become 0 */
-	ret = readl_relaxed_poll_timeout(vcap->regs + DCMIPP_P0SR, status,
-					 !(status & DCMIPP_P0SR_CPTACT),
+	ret = readl_relaxed_poll_timeout(vcap->regs + DCMIPP_PxSR(vcap->pipe_id),
+					 status,
+					 !(status & DCMIPP_PxSR_CPTACT),
 					 20 * USEC_PER_MSEC,
 					 1000 * USEC_PER_MSEC);
 	if (ret)
 		dev_warn(vcap->dev, "Timeout when stopping\n");
 
 	/* Disable pipe */
-	reg_clear(vcap, DCMIPP_P0FSCR, DCMIPP_P0FSCR_PIPEN);
+	reg_clear(vcap, DCMIPP_PxFSCR(vcap->pipe_id), DCMIPP_PxFSCR_PIPEN);
 
 	/* Clear any pending interrupts */
-	reg_write(vcap, DCMIPP_CMFCR, DCMIPP_CMIER_P0ALL);
+	reg_write(vcap, DCMIPP_CMFCR, DCMIPP_CMIER_PxALL(vcap->pipe_id));
 
 	spin_lock_irq(&vcap->irqlock);
 
@@ -525,7 +734,8 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
 
 	spin_unlock_irq(&vcap->irqlock);
 
-	dcmipp_dump_status(vcap);
+	if (vcap->pipe_id == 0)
+		dcmipp_dump_status(vcap);
 
 	pm_runtime_put(vcap->dev);
 
@@ -541,7 +751,9 @@ static int dcmipp_bytecap_buf_prepare(struct vb2_buffer *vb)
 	struct dcmipp_bytecap_device *vcap =  vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct dcmipp_buf *buf = container_of(vbuf, struct dcmipp_buf, vb);
+	struct v4l2_pix_format *format = &vcap->format;
 	unsigned long size;
+	int ret;
 
 	size = vcap->format.sizeimage;
 
@@ -557,6 +769,24 @@ static int dcmipp_bytecap_buf_prepare(struct vb2_buffer *vb)
 		/* Get memory addresses */
 		buf->addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
 		buf->size = vb2_plane_size(&buf->vb.vb2_buf, 0);
+
+		ret = frame_planes(buf->addr,
+				   buf->addrs, buf->strides, buf->sizes,
+				   format->width, format->height,
+				   format->pixelformat);
+		if (ret) {
+			dev_err(vcap->dev, "%s: Unsupported pixel format (%x)\n",
+				__func__, format->pixelformat);
+			return ret;
+		}
+
+		/* Check for 16 bytes alignment required by hardware */
+		WARN_ON(buf->addrs[0] & 15);
+		WARN_ON(buf->strides[0] & 15);
+		WARN_ON(buf->addrs[1] & 15);
+		WARN_ON(buf->strides[1] & 15);
+		WARN_ON(buf->addrs[2] & 15);
+
 		buf->prepared = true;
 
 		vb2_set_plane_payload(&buf->vb.vb2_buf, 0, buf->size);
@@ -690,7 +920,7 @@ dcmipp_bytecap_set_next_frame_or_stop(struct dcmipp_bytecap_device *vcap)
 		 * for next frame). On-going frame capture will continue until
 		 * FRAME END but no further capture will be done.
 		 */
-		reg_clear(vcap, DCMIPP_P0FCTCR, DCMIPP_P0FCTCR_CPTREQ);
+		reg_clear(vcap, DCMIPP_PxFCTCR(vcap->pipe_id), DCMIPP_PxFCTCR_CPTREQ);
 
 		dev_dbg(vcap->dev, "Capture restart is deferred to next buffer queueing\n");
 		vcap->next = NULL;
@@ -707,7 +937,13 @@ dcmipp_bytecap_set_next_frame_or_stop(struct dcmipp_bytecap_device *vcap)
 	 * This register is shadowed and will be taken into
 	 * account on next VSYNC (start of next frame)
 	 */
-	reg_write(vcap, DCMIPP_P0PPM0AR1, vcap->next->addr);
+	reg_write(vcap, DCMIPP_PxPPM0AR1(vcap->pipe_id), vcap->next->addrs[0]);
+	if (vcap->pipe_id == 1) {
+		if (vcap->next->addrs[1])
+			reg_write(vcap, DCMIPP_P1PPM1AR1, vcap->next->addrs[1]);
+		if (vcap->next->addrs[2])
+			reg_write(vcap, DCMIPP_P1PPM2AR1, vcap->next->addrs[2]);
+	}
 	dev_dbg(vcap->dev, "Write [%d] %p phy=%pad\n",
 		vcap->next->vb.vb2_buf.index, vcap->next, &vcap->next->addr);
 }
@@ -743,29 +979,39 @@ static irqreturn_t dcmipp_bytecap_irq_thread(int irq, void *arg)
 {
 	struct dcmipp_bytecap_device *vcap =
 			container_of(arg, struct dcmipp_bytecap_device, ved);
+	u32 cmsr2_pxframef;
+	u32 cmsr2_pxvsyncf;
+	u32 cmsr2_pxovrf;
 	size_t bytesused = 0;
 
 	spin_lock_irq(&vcap->irqlock);
 
+	cmsr2_pxovrf = DCMIPP_CMSR2_PxOVRF(vcap->pipe_id);
+	cmsr2_pxvsyncf = DCMIPP_CMSR2_PxVSYNCF(vcap->pipe_id);
+	cmsr2_pxframef = DCMIPP_CMSR2_PxFRAMEF(vcap->pipe_id);
+
 	/*
 	 * If we have an overrun, a frame-end will probably not be generated,
 	 * in that case the active buffer will be recycled as next buffer by
 	 * the VSYNC handler
 	 */
-	if (vcap->cmsr2 & DCMIPP_CMSR2_P0OVRF) {
+	if (vcap->cmsr2 & cmsr2_pxovrf) {
 		vcap->count.errors++;
 		vcap->count.overrun++;
 	}
 
-	if (vcap->cmsr2 & DCMIPP_CMSR2_P0FRAMEF) {
+	if (vcap->cmsr2 & cmsr2_pxframef) {
 		vcap->count.frame++;
 
 		/* Read captured buffer size */
-		bytesused = reg_read(vcap, DCMIPP_P0DCCNTR);
+		if (vcap->pipe_id == 0)
+			bytesused = reg_read(vcap, DCMIPP_P0DCCNTR);
+		else
+			bytesused = vcap->format.sizeimage;
 		dcmipp_bytecap_process_frame(vcap, bytesused);
 	}
 
-	if (vcap->cmsr2 & DCMIPP_CMSR2_P0VSYNCF) {
+	if (vcap->cmsr2 & cmsr2_pxvsyncf) {
 		vcap->count.vsync++;
 		if (vcap->state == DCMIPP_WAIT_FOR_BUFFER) {
 			vcap->count.underrun++;
@@ -797,7 +1043,7 @@ static irqreturn_t dcmipp_bytecap_irq_callback(int irq, void *arg)
 	struct dcmipp_ent_device *ved = arg;
 
 	/* Store interrupt status register */
-	vcap->cmsr2 = ved->cmsr2 & DCMIPP_CMIER_P0ALL;
+	vcap->cmsr2 = ved->cmsr2 & DCMIPP_CMIER_PxALL(vcap->pipe_id);
 	if (!vcap->cmsr2)
 		return IRQ_HANDLED;
 	vcap->count.it++;
@@ -826,6 +1072,26 @@ static int dcmipp_bytecap_link_validate(struct media_link *link)
 	if (ret < 0)
 		return 0;
 
+	/* On pixel pipes there can be alignment constraints */
+	if (vcap->pipe_id != 0) {
+		u32 width_aligned;
+		/*
+		 * Depending on the format & pixelpacker constraints, vcap width is
+		 * different from mbus width.  Compute expected vcap width based on
+		 * mbus width
+		 */
+		width_aligned = round_up(source_fmt.format.width,
+					 1 << hdw_pixel_alignment(vcap->format.pixelformat));
+
+		if (width_aligned != vcap->format.width ||
+		    source_fmt.format.height != vcap->format.height) {
+			dev_err(vcap->dev, "Wrong width or height %ux%u (%ux%u expected)\n",
+				vcap->format.width, vcap->format.height,
+				width_aligned, source_fmt.format.height);
+			return -EINVAL;
+		}
+	}
+
 	if (source_fmt.format.width != vcap->format.width ||
 	    source_fmt.format.height != vcap->format.height) {
 		dev_err(vcap->dev, "Wrong width or height %ux%u (%ux%u expected)\n",
@@ -834,15 +1100,13 @@ static int dcmipp_bytecap_link_validate(struct media_link *link)
 		return -EINVAL;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(dcmipp_bytecap_pix_map_list); i++) {
-		if (dcmipp_bytecap_pix_map_list[i].pixelformat ==
-			vcap->format.pixelformat &&
-		    dcmipp_bytecap_pix_map_list[i].code ==
-			source_fmt.format.code)
+	for (i = 0; i < vcap->pix_map_array_size; i++) {
+		if (vcap->pix_map[i].pixelformat == vcap->format.pixelformat &&
+		    vcap->pix_map[i].code == source_fmt.format.code)
 			break;
 	}
 
-	if (i == ARRAY_SIZE(dcmipp_bytecap_pix_map_list)) {
+	if (i == vcap->pix_map_array_size) {
 		dev_err(vcap->dev, "mbus code 0x%x do not match capture device format (0x%x)\n",
 			vcap->format.pixelformat, source_fmt.format.code);
 		return -EINVAL;
@@ -855,6 +1119,18 @@ static const struct media_entity_operations dcmipp_bytecap_entity_ops = {
 	.link_validate = dcmipp_bytecap_link_validate,
 };
 
+static int dcmipp_name_to_pipe_id(const char *name)
+{
+	if (strstr(name, "dump"))
+		return 0;
+	else if (strstr(name, "main"))
+		return 1;
+	else if (strstr(name, "aux"))
+		return 2;
+	else
+		return -EINVAL;
+}
+
 struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 						  struct dcmipp_device *dcmipp)
 {
@@ -870,6 +1146,22 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 	if (!vcap)
 		return ERR_PTR(-ENOMEM);
 
+	/* Retrieve the pipe_id */
+	vcap->pipe_id = dcmipp_name_to_pipe_id(entity_name);
+	if (vcap->pipe_id < 0) {
+		dev_err(dev, "failed to retrieve pipe_id\n");
+		goto err_free_vcap;
+	}
+
+	/* Initialize supported format table format */
+	if (vcap->pipe_id == 0) {
+		vcap->pix_map = dcmipp_bytecap_dump_pix_map_list;
+		vcap->pix_map_array_size = ARRAY_SIZE(dcmipp_bytecap_dump_pix_map_list);
+	} else {
+		vcap->pix_map = dcmipp_bytecap_pixel_pix_map_list;
+		vcap->pix_map_array_size = ARRAY_SIZE(dcmipp_bytecap_pixel_pix_map_list);
+	}
+
 	/* Allocate the pads */
 	vcap->ved.pads = dcmipp_pads_init(1, &pad_flag);
 	if (IS_ERR(vcap->ved.pads)) {

-- 
2.34.1


