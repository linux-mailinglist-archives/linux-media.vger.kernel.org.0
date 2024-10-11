Return-Path: <linux-media+bounces-19413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C84299A117
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 12:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DF761C20B9E
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 10:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB44210C0E;
	Fri, 11 Oct 2024 10:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SVwlURYP"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2046.outbound.protection.outlook.com [40.107.105.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81BC28EB;
	Fri, 11 Oct 2024 10:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728641803; cv=fail; b=HoLLFOxk2iOy70jtnXzapp74fH8UbauHguKHYrvwSt5TrJcvGJnX/EL6HLdTnX11UKGeCnuJOmUkt2Hz7jBhlH0rk8SYl9o/PGi8vS8YZNg/OaOQsD8UKixkOcgcwxCwr5QRtbR/0mBPGGM89xPrhngYzxxmODccnncudVP8XU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728641803; c=relaxed/simple;
	bh=dtggG/3Yn9myRn7rMnK8KwnvT0EvZu/RKWqacsA6llw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=pwZwHpRnPleM5iO9QBPDl1VtXF1piSAT+tiD9fJpHUXabvD/jyh6JZuu64WGHNKUEeyjwcJeWrWyrzWHCiybLpEuToWtCJKl2teZPPAuVfC41PZwijFvmN2Z7CgFpNW/iUkEx1O8MLGqRFcffSVzykJoDraeeQxKc52XE7MPBkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SVwlURYP; arc=fail smtp.client-ip=40.107.105.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0rxleBYhVgcaRz1/SsWAZXRpG84xwRK2i6E/zEU5dqHt0Nme7CjfwTwkPcXUO+6rFtBU0i9v3PANNZT+gsvDoj2dZsTrcllmOI8N0ixE1YvkJ+kN1MeQ7+pgQkn8vne2VUhV6ZhEz2w7hk4liGsQIIomhULK8UEeuqSqf/Wsorzt/dqP08BYOD0+WKlfYXaR2FKQL7ZVBdNZpl+4yQ3uU+Tdzwqp8QELgpVjVnvgYlvmBTqrkFi2CRrNJr2FtGeYBcOpOkUhpgHieGDsDt7VLvqKG+rH4NxSCKtIpNngKd1wJHbcXuQzf6wsK0LZysaaRs+GwONNt5JfQemNyS2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjxsmJaxQynYinvF445fjQQUKe9GYZ0Yon98UalA4I8=;
 b=l4aRyc6cl19b9tJBgU/6RwPc1eULjwt5jC4hNVWRhp8nOou/eZJFi7ysSiMcOM7YAyPEJC/Lk73IKO5ABC8fUEED298E0Z6Qyl1RbdHAFJBrmxjTomgOGCpv+/uosbTubcX4eZ2gI1t54VglOL+uIfJJP51op9a/Yd3NXj48jt2bCegLdVq8yvuBJrhfea+Cme6v3u4lWOwJbXlsx0UpmC1tRMFPYT45J171O8w/iz5h4qOY/eGpunS3DdfRdJ84O5Ov7M4DLLdL45inb/mC1rebGLRJe7P8/N/+Fry5p+Bbpvg4eX/G791sSFnTmu/Cbnn/dtln2qxMgkuvyrrtqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjxsmJaxQynYinvF445fjQQUKe9GYZ0Yon98UalA4I8=;
 b=SVwlURYP2VaCFZRGGC/EY8OA4dksB6S0Q/sFVqx8SLmQV6M8phC8xdgBSGCRItRcTc6jzjPC+Ry58rlffUg6sYgC96cuJcl/M7PM+o2f526l2Y3As3uQV0gMWdNxqE3ovfWJcTFa81ANrIYo12HDyNeIUXF9wvkeSee6m4HeggRfbvJMpH0Aq5uyXYvE5+Pe2lGWxdDOj17bGnG2gCbtR81n+vXxQFHiwbkzamD1mhC6XFFA39XWRQn31KyOtd/0ajYAsmSHdRm30tVWFDYs8zB6ThVE6rwmGL7QaYrxdYizaghcrkEI6Df6go0XAjy6SpiV69nHHqnhkUuUoMVPIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS8PR04MB8852.eurprd04.prod.outlook.com (2603:10a6:20b:42f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 10:16:38 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.8048.018; Fri, 11 Oct 2024
 10:16:38 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	jacopo@jmondi.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.d,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: nxp: imx8-isi: Add i.MX8ULP support
Date: Fri, 11 Oct 2024 18:17:10 +0800
Message-Id: <20241011101711.704226-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0070.apcprd02.prod.outlook.com
 (2603:1096:4:54::34) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AS8PR04MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bf9fa39-c725-4623-eeae-08dce9ddca5c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?c2lhczE5cXdiZ2NvVmtGVDJwc1doOWtUUi9qdGlKVjBZbUlDODdyQldDMTV0?=
 =?utf-8?B?L3h6b0hqczk0RUUvSnVlVXVHd3lvSWJkeENlQUgzaktrbnJYek8xS1hLaG9E?=
 =?utf-8?B?NVZQdXQxQ200MDkzbnY2QzZqZ0o3TnlMMXJ2b0s1NHIvVkM3Q1RZNjFsOGMy?=
 =?utf-8?B?bGx0ZDdSSmFYYXpLY2pwb1hQdm1ra1ZQR0lYM2I3ZlU4c2hVNnFHcWZwbWs3?=
 =?utf-8?B?L3pibjVQNnh5ek50b00zKzRhSDlrSGZHNmZQNSsxSVZ3cUthNm0xOUF5WHdN?=
 =?utf-8?B?VGI5d3BUMStHd0lPV09ZVVJYbzEzdi9xTU5HMlFtN3p0V21wbG1CcUdqeU9M?=
 =?utf-8?B?WitjUHpZRzV5a1F0SHFGdkJuQTUveUVzVnVoUWRqN0Z0dFhKaTFxWjFCK3Qr?=
 =?utf-8?B?VVkwMmF0bkw2bGF2L2tQQlAvSWNnRzBsUGtOY2xMRldpNUNnVFZxNmhuM1Zz?=
 =?utf-8?B?TXZ4SUhKRW5jSkJTY3hpUEhCODRMODRySXBYMEJFcExncnVrNzlkczhhVU5J?=
 =?utf-8?B?RVdsT1I5ZzRtclFpVm8vZnZObXh0NmpodExmbDZucDB3V2l4TlY0VkNQV09s?=
 =?utf-8?B?TmI5QStXZE4rYmNCbmZzMzVFOWw0emNnZVRBZzJObkFDb045VDExbXJMVnVZ?=
 =?utf-8?B?SDR1Rk5lWVJWSW96Yy9MZ2R5WHdqSUx1OTk4eHdmbzhTdmhEb1JFeUJuZW5I?=
 =?utf-8?B?di91K2ZBeTYvbVBFM1VZSDBmS1dRTDFEU2gxcE1sOVEwc004cjA0N1hzVGda?=
 =?utf-8?B?L3ZiUUxqUTdnRVZlSDNXMWNXTS9BRzViREpXWmtJeEZMYjRiU3dxWEhzWU50?=
 =?utf-8?B?Zy9iKytMN3VuYzQyQVRxSGVLdUU0TmZiUm8xOTAzY2xIQUVVUTFHK1V1eUpO?=
 =?utf-8?B?bEJrY3dkd2lJclN0TmdDRnZQVXpJKzFDUUdnYmZrSXAyQkw4RjNaWVFVZE56?=
 =?utf-8?B?cWtnMjJUcW1RM1Q0RldVRnlzeStyT1lmNi9lb1ltT1hXa0hrUkR6b1VLbDNL?=
 =?utf-8?B?S3JDM2tvdGlZakZaSGRheGxFUGI1S1B0YSt5eHZCUmNlOFFmajh4V0JNZ2Ux?=
 =?utf-8?B?dC9ON3NIeWdqRnNtRnpsdyttUGZKS1dFS0pkN2UrcG1jL0wzS1lVcEppYnVq?=
 =?utf-8?B?d1pSSEhrdjZwemNWYW1ldXhQZjRlcXAvNWJhUmFyc3MyNGcrVGdFaWI1cG1h?=
 =?utf-8?B?cFFlTUR6MHFnM0U2U1RyOHlma2lsQ2Rxa0JlaHBZOENlZUhDVkNVK1dDSGtz?=
 =?utf-8?B?YlNMcVpDQmNWRnYyczZ4ZjRKMzBPbmN0T3lsck1UM1VSdmZqZ1JSRFp4anRq?=
 =?utf-8?B?N25Md0xEZDJDRFhpQWJpMEc1QW1kR1hISkFqaytuMDRwNmhiMHFTck13M2Mz?=
 =?utf-8?B?N0UrRVBncnNGMWFSQjZMTnlVU1VCOVcyUU15NnBBNWZKc0VadmtQSjZGT2VW?=
 =?utf-8?B?MXhENnA4TGpFSXg1TDFaamgrd1VpV05JT1JSMjZSN0l6d3dwbVkreFU1cDlW?=
 =?utf-8?B?QjAzdXdtcEZDUXFVS1hRY2hyUnpCVGI1cWRwRWEzYlFYUzJDZ2hDRW5tTTlL?=
 =?utf-8?B?WmhucEZIY0JSOE14YlBCeWs0dnd1c0didk1rU0Vudyt5R3NEWnkrVUEycG1F?=
 =?utf-8?B?MXhMNTFnMW5uMElQUUFwb3VIcWpaRTJXaGl6dVZaUFBXWnZUaGJpY3kwZVZW?=
 =?utf-8?B?QzRTeGl4TE95SHJSYlR6cjFlU3JrM1F3TkQ0dnBYa2RCam42YmkwNWF5WGFQ?=
 =?utf-8?B?RzhRQWNISGNrZitlanZVYkExcmJEL1ZWWVpFdU5sV0RwTFE0N0gyWUg1QlRX?=
 =?utf-8?B?OHl4K0ZHNG9HLzJBSksxdz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dGVWVnlxeUxObXlvbHVCOEtQT2NRL1VLbDRPaHRmbkVaS2F5RlRZQ2ZHZm90?=
 =?utf-8?B?dlZlYjNXL1lMQmVIOWNXRHpuY0hzRXhPOVQweHhKdFhjcXFJakRxRkp3STZ5?=
 =?utf-8?B?R2FESlZ0S3EyVWVUNEM1dWxEMkNmaEhkYytqSm5oaDZFYUQ4a0I2Ri9OTEVQ?=
 =?utf-8?B?MStUZVFVc3hDNXU5R2lBMFZLM0hEMFc1bk9oZnUyejhLdDNyL2wzUk9HcXV3?=
 =?utf-8?B?YWx6bWJCT3pGalJVYS9HY055Ui96OS9rRjRLcUdOb3B1Wm9scDdtWjdUemg2?=
 =?utf-8?B?d0JFWTRaZWxsNk5CNkJuZFJjMi9LS0JmaGxHK1F0M2wwbmNiZzBYU1VxUFZ3?=
 =?utf-8?B?THZkbkV5UGRqZThJMGs0NWppRlhzV2hHT2t6NndpUWs0VjJVVU1VQU16OUpp?=
 =?utf-8?B?Zk93MkFvaHUzWksvOWd6RGE1Q29yK0xtRXFiV1U1cHcyN3d3cnhGQUkrSnZH?=
 =?utf-8?B?eVRhQXYzSVVldDdKenhQUnZzQVJkbzE0N1k3Mmwvb0h4Z3ROMzhnams1SUQ3?=
 =?utf-8?B?Y2MwaFV0RmVPNTJrUytpakdQcVhhalMrYU8xNnMzc3Rqd3VqNy83R2g3WjhJ?=
 =?utf-8?B?VXBKNVcrN3pEUzBRQWZaNmVDMy9MUE1FcDR0U1I4NzMyK2Q3b1QwYmVZZkZR?=
 =?utf-8?B?Z0g0M21GazJSVUx3MFFFV0VWUXA3OTh4NDlQL200VDVTeDVxajFLV2RwWlps?=
 =?utf-8?B?KytteFdFQmFYWnNjdXozeFlnZXlkTHFDMXM1R0tmT3BTUEdoQmo1Z3M3R2w3?=
 =?utf-8?B?dFdYeDczWGFiNFE5SHIyRGtuYjNCaHEySjZZTU1SWDNkSHVyc1NHVjVFaXI0?=
 =?utf-8?B?dE9ucVF4UGZPclNKcTBIWXBBYVpIVG5BVkRGMFBPU3FmRUZYSWlrenREeWRy?=
 =?utf-8?B?U1hVUjdjTzBoY2hQc3BYOXlZYnpuTlRQWDUzNytLcGVjTDdhV1RYZlVlRk9B?=
 =?utf-8?B?SjcxOEsrTzZWQ3JDSWNzaWdVdGtUWlBoT1RiRk0zZVl1K0NkUmNPZzFVdStB?=
 =?utf-8?B?NkwyWFpueUlzS0pKTms5eFNJdmxGOTFlVmdoTWpEMUhQWXpCTWJMR0R1NVdn?=
 =?utf-8?B?YkpSYVFjcUZpV3JHZis5dXJ2S2pmZkovZ1A4OVFLbGVNakJsaStYRHNrU3hO?=
 =?utf-8?B?TTNlc1c4N1JYU3pvNlFsdzIwRHNJbTR3cE05Ty9pS2hZV3BqZEdVUmdlOHJi?=
 =?utf-8?B?V3lGNmlaTE43emVtSG1zankwYnptR0ZaYkhURXhYNnRUS0tjTDdKVkJ5VFdT?=
 =?utf-8?B?dmcxVTFIOThQWk9HTnR2ZFNEZ0hWc0NETFdxUlhDc21JRHkyM0JML0FQd3hj?=
 =?utf-8?B?eEtuYU5MREx3cmlTTmxLMGJvcmJRM3pHZVQzWTliNitGNUhKUllZWFNyL21D?=
 =?utf-8?B?bnhTQUpkdm9PQjdmWUtmVURWcGgvbDVtZmJsVkpkYU5aMTRZalhYM2xtN1Qr?=
 =?utf-8?B?R1B5enhUaTdnakZ5UzkrZHQ1eW9SeFdJd3VNcjJDSVZKNzBWYVFCRFlLWkZq?=
 =?utf-8?B?Uk9pbCtpSzh6RDhYc3JhcnRUUlYzSUNaZ1RtbC9lWkFyVmsxaHRhVGRGSVQ5?=
 =?utf-8?B?c0JrN0pMUXNrL2tRbnJsa0dUekc0cW53TUVKMEJOMmR4Y1FCQy9QOWdublli?=
 =?utf-8?B?RmpoZ01tNVcyaHBzdXdsbktxeFBlVzgveWFVRmQxdGRqaTFaR1pIMTUwN01u?=
 =?utf-8?B?YWh0M2U1YWpneW9iMExjT0tOQ3VDQ0NmUHJ3Qmx0SDdONW5EenNxTkJkbXNK?=
 =?utf-8?B?YTlwU0g1UDg5MzRQYzhWSnVjWjV4RWU4T1V6SGpDYmo4S3pNenpYdGtUcVhH?=
 =?utf-8?B?cWNDemMyaTg0ekpuMzI5OU9UVVdQc29pOWljdXBoZmlpUXcvZ3dmclIraFlO?=
 =?utf-8?B?NmlWYURQOEtXNUY3VnAxZ092N2swbFZ5d3ByaXozTENFc0dFREc3L2s5UGpN?=
 =?utf-8?B?VTNQNFBBQ1pnanRZamJKVjhzM1VvOXgzeUU3UTJzcXlHdyt1Szd6b1Y0MUZh?=
 =?utf-8?B?cjhlcFJiSDU1S3JwdlRjTThRbE1GblZjaEt6WXdncGRRMm1jZlRXT2xTeFVS?=
 =?utf-8?B?bDRvMDcwaERDaitmc29VZElrRzE1Nyt3VXAyanl0azBtYmZXU01EZ0QzWVg5?=
 =?utf-8?Q?nOGH5AUCPFY+Em7yXtK/8Pe3+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf9fa39-c725-4623-eeae-08dce9ddca5c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 10:16:37.9240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbCkmquxadI178RlycxM7qgM88GBPTfzj9LbhXEBtnZecjkJgQtHpxBNA0EXWdSKmzVxMfNqoGPXDzX/LSDfMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8852

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

This small patch series is to add ISI support for i.MX8ULP.

Guoniu.zhou (2):
  media: nxp: imx8-isi: Add i.MX8ULP support
  dt-bindings: media: nxp,imx8-isi: Add i.MX8ULP ISI compatible string

 .../bindings/media/nxp,imx8-isi.yaml           |  2 ++
 .../platform/nxp/imx8-isi/imx8-isi-core.c      | 18 ++++++++++++++++++
 .../platform/nxp/imx8-isi/imx8-isi-core.h      |  1 +
 3 files changed, 21 insertions(+)

base-commit: 67cefecf2a039b9ed0030b9213ceafcd45e6f9e3
-- 
2.34.1


