Return-Path: <linux-media+bounces-52015-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPa0B4utgGmiAQMAu9opvQ
	(envelope-from <linux-media+bounces-52015-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 14:58:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F09FFCD057
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 14:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88CDD3010B5C
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 13:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7008436C0B4;
	Mon,  2 Feb 2026 13:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="JJ7v1Ph1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6068036A00E;
	Mon,  2 Feb 2026 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770040694; cv=fail; b=Bwfd+jwJGyFZcj6bAw04jEs9yIK0XFSTOoaq4TujcaBoFEQYc/fa82YlBBQGKrNDJ+3P9SSo6qboBv8JkNc8xwP3HIx/iZ6EkZ68RdjI0a+ttnmQxLSFgQ9k37fnt0JX4I/6Xh+cREmqeYj3XjUjpB4cV42f6/8L7Dg8Mq1e4qY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770040694; c=relaxed/simple;
	bh=Mk+/dQZuWkw5VXCvxtVgm8Zk+2B1ilsY5vXY5qYP7Bw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YLWMKeNLntdmXl+IOOs/Jy6J0YSmw76ZJEChcE4YEGFBCUQit6Ja07IGZOPjYGxfRbDhg8zF52B5o4oyPAdJL7E9uwIzzchdKwdgNjWWN/R4c3UXXHy+cSBPlX66kMCkz7ho8I1JeankQECs0XAbOCdJbSvq5s2abXPxmgVn4bA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=JJ7v1Ph1; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612DiPKg305289;
	Mon, 2 Feb 2026 14:57:55 +0100
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4c1aq7p38e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 14:57:55 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGouOizLir6PqqKAC64wFfi5qlAwU1YBayl4+fJ59bVir3lfeY+yVhaPyWyUDuQeLF3NyVWkxW8dzojJzhKLruk90+7m2wFsM1I9jN6fVWkqgRVnf4hSELglcXewVxx+cTpBwGWj2NCBQPhrHVjlNOs9eI7qrcwWUMkNTbW1pu78ZKR4U77SrYHXFKO/MQfgNP56CzPjzihsLswNQaMbqNxYGy+n0TDRZYIAYELiiTqbQjVorwYvMzb0nJS1xDXK8Rt0lxlT45pknDSzRfHFvenfOV15kKp0pCPzfzhcOD1/t2QNyViHpeeFwuMqnI3QPwN219mnavc/fqWFyiksdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nf3XqrcSp3pK8avo6dIzno8Z6S66JjLwjY6XIhiILSs=;
 b=IGJyMacOMWPfATQdWA856txrBkGHREQ3pWnsEZ3K1ttYEQUg+s9yIMkAIZbPCt6QFR5TInh0s6L+2nUDQkW2/+ixPw223LaYP6TwI0OVged6vfka5+gM/GHFN79iD6K/t2px7j9e8HSK2O9HerFqwYNr8gtIwyU04tZZtxvFf8/SXWu/O2lKhKf/AWVyBv46/olWN7R+boGMSI/EdFTt2x6vDXaoNAs5BZNXtfoCCllFLJId+VFA5fXoasSZAjdkWTUCjS2MfEO1m4dIIW8ZhSxT+/lxk5Pf9ab+2yXmgrH6ZM/BjW8bbgaLXSRiXETyj5MdLgyO8x+aUas9HGPQeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nf3XqrcSp3pK8avo6dIzno8Z6S66JjLwjY6XIhiILSs=;
 b=JJ7v1Ph15+4/1N3lUE9rRFPyHZRnXv6xfuhFejnaW8rBzwYmZmFgWIIUNlCzedpmI//WND7bOk8W9Nn6mtXhK9BBf6DlGybQyK6TLMxNWWktR/YPfWAz/0gTIbEf4Fd8X9J6ukklTzG+nFREqRsRh2wON95OYzV7D8KhpigqqqapnNFhVxQIwFs34SyJDhIutxCmxgcZZTNo7uGT1i4WaODetYiXbTzD8/jSxD0QrwJDK1iX+IKNWR8lRUgBQWdGvj7lQm4B2wEWeTvZCWcFdenssmXKcDfsHApGCcJUw0qvGeaM5VrqwnfD53Auy+SI1Qdu+7YED5QhsXKGXK2V8w==
Received: from CWLP265CA0421.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::21)
 by PA4PR10MB5754.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:267::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 13:57:49 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:400:1d7:cafe::18) by CWLP265CA0421.outlook.office365.com
 (2603:10a6:400:1d7::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.15 via Frontend Transport; Mon,
 2 Feb 2026 13:57:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 13:57:48 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:59:33 +0100
Received: from localhost (10.252.7.227) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:57:47 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 2 Feb 2026 14:57:32 +0100
Subject: [PATCH 07/13] media: stm32: dcmipp: introduce a dcmipp global
 media_pipeline
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260202-stm32-dcmipp-pixel-pipes-support-v1-7-8d8d51f5e014@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019F:EE_|PA4PR10MB5754:EE_
X-MS-Office365-Filtering-Correlation-Id: 64f1fdb6-1521-429a-dcdd-08de62630c79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QW9yUWh2OWxqVHAzKysxZGYwcDFLOEJITTNxL0QwWWtLMXRiSnpjaEgyRDR4?=
 =?utf-8?B?NXczUGszMzNoMzlMWU8wT1haWFhEdUtBd1JzNnZBWGdYMFkyN3pVSThXbkRv?=
 =?utf-8?B?NHJMdGdrekZIYnFnK2xzcjIydFNwRUdKdFk1dFQ5UXdsUktjM2Q4UUZHdFI1?=
 =?utf-8?B?dmNBbFN4MHdxQ2d0MWNLd0E5bytWVFpSM0dvdVg0bkx4bm4ydllHL1RYTmNG?=
 =?utf-8?B?MG9EZ2FWTGtPRlBSR3FSU3RDVDl0aXlqd1IyUE9zRmNrQ25sZGtmaks4cTlu?=
 =?utf-8?B?N0VQdHY4MWhJMjNRY3lPbTVUbW9VWERPcExhYUkxajVFdGNlMlJIVnRRNUhn?=
 =?utf-8?B?RjNJWlJhVk9TbVNRMEdwdDFZcXM0bkRPRjZrUURQMS9xZ3ZSYUZBNVNHWHQ3?=
 =?utf-8?B?TWJkNDJISUhRRjlqalBtaWttQ0wvbXUxQ3Y1blVYc05EK3JjRU9jRE5vbWs0?=
 =?utf-8?B?eFpKSVhjM280dmRsYlpuSnNlRzZiT0hQU1JCWTFwamtkTVVZcktISHpMZGwy?=
 =?utf-8?B?elB6YkgxR2hBV2xDa0t3L0lMUkZBVkpJZ1Z2VENWYStheUd3KzViV0JUVnNi?=
 =?utf-8?B?T2ZhUml3cFRxOFUwYkl2SDd2OGxsWWlZNzVGcDh3ZTB2eDd4MllyYlI2bzJo?=
 =?utf-8?B?STByODlvWDFDbmUwbVUwQlFlSnZGYWlOcUYrVWRReWR6YjJXUndSdmtqeUZm?=
 =?utf-8?B?cEwrLythTGdQR3BhdmgxOWcxZjQ0N2NJTGx1VUxheG1PVzduRzVWSURta2tO?=
 =?utf-8?B?ck9DczdGZU5FYWtBMW5LS0pnVTdzK3dEckdBQTY0WnE1bzJsOFQvMGpYM1Bo?=
 =?utf-8?B?STc0TjdBTjFKb0pIV2J3czVUanZ6d1d5S01GOHRSQU81ckJISXk5Z20vV0dD?=
 =?utf-8?B?OUlrZGJmaXBmOFhPQUJ3UWduRnJ1eGxULzVHQlJCU0tFa2cyTlBmUGpsS1pZ?=
 =?utf-8?B?Qit0OEJZZjZDVmoxVmxwVjVjY3dwWFpyQU05L2pqL1E4MWNzRjA1QVhaeXU2?=
 =?utf-8?B?MjZTazZia0hFblZUWWtpWXdrT2dLTUxHbmpjMFM0WWJYZlN4aVVsYVdkN0FQ?=
 =?utf-8?B?b1dHMmd0Nmtld21xYUlCK1JiaVlLcWxMeUl0blhscThUTzJWU3hIcXpGUEoz?=
 =?utf-8?B?M3N0cThwTVdMdSs1N2hPMVgvUGtOdmlLS3RjV0VBTExCbUhteXZwVmMva2V0?=
 =?utf-8?B?VmRxbUd3WTNLeXlYd2p6cWFEcTBJd3FMZkhpaUNMNEs0NlNnS1hmWTgrYnpz?=
 =?utf-8?B?Q05lWjBNb0JwR0tXT1hwai92b3RYWXdxbkluZ05tbHAxdS9CdXU5eU44VlFP?=
 =?utf-8?B?ODIwdExCaFlrcWR6eVltandTdERBQWtTdGlQbW9ZMWhjbEc1TTZ6b0ducXRB?=
 =?utf-8?B?K3ZmN251WXJKL0N4RXJCVk9FampoTXJZL285bi8vVitndHBTQ2V3eHlmNzRq?=
 =?utf-8?B?M1phMzY4RkJzK292UFVVRmxzVVZBVFFnK2FRQ3ZreXpzMUlQeFhpSUh3dFlz?=
 =?utf-8?B?MC9OV0NGb2l3NlByK2NRTVVEZ1pUNUhSSkY5NkUrcXFQT0EyWVZ6RkwvUlBC?=
 =?utf-8?B?bmRoVkVrZ0JlbVRhRThieFVnQytCVHJISGg2ejhBVWxlRmprRkl4TFRiMWU4?=
 =?utf-8?B?RmJabkRIZll4NGJkeENhWFJMb1A0Umo5Qi9Kd2RlNWxLaC9WSFZyb2R4aGky?=
 =?utf-8?B?K3lnUzhlVGdVV0RNdWpCei90UXM5M2xlMkNGWmhHWVRpdUVjVVZVV1FQODA2?=
 =?utf-8?B?UDJnQVYyeXgxY2IxTW40VG5sakhmZ3NVUUJHYWFvbFdlTi9SRkthaUV4WDdQ?=
 =?utf-8?B?aUh4emhOVzlTNjkwYVJxUE43b0dNYlRRMTZkcDVTaTFnZ2pZOXdUZUIzanVv?=
 =?utf-8?B?bWtlY2crYm1rdDZHdnNqV3dVQmE4WVF1MFVvdlJUbmMxa2h3WWhtWVBiWkNu?=
 =?utf-8?B?cEtFN1lRZFNNZnEzVVFaeHhRZ1NSRlF1VE45U1JBdGJsZWRkaFJGY3c2U3ZH?=
 =?utf-8?B?T05TL3I4L2NxZEl4NGxRbUJUS0k2RnJ4SUczT3d2OERrQ0xiaVJTMUNseW9R?=
 =?utf-8?B?dGowR3VISDJVbkUraUJ1RlU5K3NSd0xtN0J0RHd4Snhqb3lwc2gwWVE5MHNK?=
 =?utf-8?B?dGJtamM0N1IxNEJKUjdNOWRDWjJDYlpHVjBESUx5S1A3ZlB1YXN3RDBtSjFD?=
 =?utf-8?B?cTdyNVVMcVNnUDhHaTR3UGcvOTVPaktyU2o4VHdodmkvOW02a2ZvR3QwS0ha?=
 =?utf-8?B?bkxubHVaN2pPdjQyM3h6bFkrdlpnPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xELlVRpwcDc+x1o+tvlFJbWXonFMQ4pXMAOkmt6kubkxzxX76Txjew/Ni9rfiRS8spCpNgVg+6e42RYCTdgGLAsc/9uDFyHbtwgPqUxqtI/mMD8tVSFvunggzDVqRGmwU4ZILdaxnU4IHOp22qkUbGV3hHR8TGPnc8ktoF2165x7tqVYVRwVC5N/24v5CTMnnUwRZOonMVc2HFI/7ukzVweylx/OI3G0fuNOgsGhlx5hylQkcHufg+N9E+fnKGHVuygEoRiv7Gm3HwR4AE5z7LnUNWrcl6lMFzmwu/NxmjXNSdoMPhUBWEqMJ3H3lQVJY/P2KBY8ptxVd35VGICdxjPyn8j+Dfj4N/W11/0B6jgx9Qi9dxdcgIJlB6luV+FoF63XzLbbr+3t2Uk5E0hlCYWi398de0n/eiH3okM87RFDISUH/87Seca6iIZOupue
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 13:57:48.3018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f1fdb6-1521-429a-dcdd-08de62630c79
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5754
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEwOSBTYWx0ZWRfX1u3V8svhDjhQ
 bG2qZvHMr883pa7cPYNkjzx8V/N1dGhcr24c6sKIrMTiUpzP7stujTaDr0VXk1Wh1qC4vPBj5xD
 8Ei2pyNBAdZlSnAk3LBueaFp+kwLCys+5S9jhOSGjTAlxHqbFQweEN5wobpW8d9ZtaaYoDSk1Sv
 Sl6zULe/hV3AwuOMzeOi/LkkOdh+vDJOp7MpopB8TZjwxHuVPpX7+i+ScVYRzHm8o7rfJYriIbw
 S/zkQaoj2l3bbLRfXdPh2xyLMLKUumdrVbKsr2+8G+WVJWiQ6f+9D71rWiKAPITzb1hMlH010WW
 hVHFyLeBhDYJTjwyC1Gngcg5c5cRcpZFZYYIYlLIWcIIPTt7Ju6snNtUOCSXP1Is41UrGINWp0u
 GVRaDQypC5UXxGqRjxGxLrHWbOPec16SO/GDSTPQR2LtRrTnRa0rhCPIOqzG4lDn4pAfvlCR26V
 7KrR2M3xsYhodmGo4Tg==
X-Authority-Analysis: v=2.4 cv=LLBrgZW9 c=1 sm=1 tr=0 ts=6980ad63 cx=c_pps
 a=Hnq3Tjo4AW3aKPKNM5RF8w==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Xa52oM6mtQYA:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=w34_h8Ukgoz9b-3liUIA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: mekN2OFROoPkltIr_HEVcCXvqJ1SSIKW
X-Proofpoint-ORIG-GUID: mekN2OFROoPkltIr_HEVcCXvqJ1SSIKW
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
	TAGGED_FROM(0.00)[bounces-52015-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F09FFCD057
X-Rspamd-Action: no action

With the introduction of stm32mp25 containing several capture
devices, it becomes necessary to share the media_pipeline
structure among all capture devices since subdev pads can be
shared between several capture devices.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c | 3 +--
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h  | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 0b1d1fbda5d6..2fb34cac89c6 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -125,7 +125,6 @@ struct dcmipp_bytecap_device {
 	/* mutex used as vdev and queue lock */
 	struct mutex lock;
 	u32 sequence;
-	struct media_pipeline pipe;
 	struct v4l2_subdev *s_subdev;
 	u32 s_subdev_pad_nb;
 
@@ -408,7 +407,7 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 		goto err_buffer_done;
 	}
 
-	ret = media_pipeline_start(entity->pads, &vcap->pipe);
+	ret = media_pipeline_start(entity->pads, &vcap->ved.dcmipp->pipe);
 	if (ret) {
 		dev_dbg(vcap->dev, "%s: Failed to start streaming, media pipeline start error (%d)\n",
 			__func__, ret);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index 2d26425b0b0f..ee9f36268e64 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -73,6 +73,7 @@ struct dcmipp_device {
 
 	/* The Associated media_device parent */
 	struct media_device		mdev;
+	struct media_pipeline		pipe;
 
 	/* Internal v4l2 parent device*/
 	struct v4l2_device		v4l2_dev;

-- 
2.34.1


