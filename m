Return-Path: <linux-media+bounces-57195-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFNGKuYtxmnEHQUAu9opvQ
	(envelope-from <linux-media+bounces-57195-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 08:12:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4792A34038B
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 08:12:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B116304415F
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 07:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161733C1961;
	Fri, 27 Mar 2026 07:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qDf741Z/"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011046.outbound.protection.outlook.com [52.101.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759ED1A08BC;
	Fri, 27 Mar 2026 07:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774595387; cv=fail; b=AOamERoAhzzT+olfVG88ThBwxHlNFzCeD4w5tfBk7iAWDrUg0bYoOIHtv9Agl/55YTDfPnG+Arq8f5GZEeorwu1JrlTb8+gHT/M7K0d6s2zGxKd78LNycqJN5JMob8grxdNZnBRhlKuoW217BPqZm/RkJ6o38Pd+XRhKrNQe0WY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774595387; c=relaxed/simple;
	bh=wQvvZKMwYF8Gz+uRTzY6v4tvnVdkf7i8cO6R7Wuclh0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=PEG8uRXZ1vRl94dJ9LAc8Wd0JZVN1Wd38afNSLCYqjYrDl1+3emClufVrL4PsBgGuhvkGtI4WoaFRkNOAWuw5YmvWYLdm0Bu0jCUuAYw2bhFHCYpV14FF28U92sMz46PeCSHIVvXblAz6zQMibiXnZ7UU+Nbhzg84P6hZLyuk60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qDf741Z/; arc=fail smtp.client-ip=52.101.65.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atQSD6FdVOodLhvpumaiJs24V45vmCXpZhrEz6jbzUfEJr0Z0uBH/F/0qNw8tK/5KwAa/yjxRw+JDDWu6D2jUng5owEG3DMSNn1rw/RuuX4PlapvPZTWWUbmqMLT/sP1x0H8WempFBneGCiK7HgulWmUSaOAyb4mXEVi6dO8Eoa9zaKCoVHjVDjiyyfK/xWOOoc9EB3EAmqOGkB6bIEJ+phBKxnjSiqj0aSzjAVNJ3QnY4FiGEV4ogsgG9uTO9eNDyxV5GVWMAQaJLzxepOmzy1iru3JxnP84GpmS7tGQ62ifXa0qrWNo4ycKl/unTRdzyS+YJN6c4QJoYLF4SEqng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlL2pHTb5SH0BiV/4PG3kjt7uFy3kMYEn/f8Zj21ux4=;
 b=PLPaqrZ2i4ksIHI/80pd6eLXUqRxJY1kRTjETjW3vFPbZ+HSRughasaF6A9MiQ3lwrwyaOXFrEaLBI8k63b0L8U8DKfzXopfaiWNN7i2H2iQ6nYzYH2TDmXYGmayyoKkYJePEwXzZu2XZ8USYgQh4XnEcBYapdg5WTmoYu67DXtQ/7Es2xzmt4sCeiezgnaz/tm7i4k/trw5THYE+A/258emaUfqu15KxSk205UzpJtnBfw1IAYVq7HvNxcT88F8lKW/+LyLpujSqN1FTEWRhJhI5U5trn+4/CCNWRVKTMPzi16609m7PqWk8SAD6GY9XxHOAQ5tGE5XwpcD11p+Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlL2pHTb5SH0BiV/4PG3kjt7uFy3kMYEn/f8Zj21ux4=;
 b=qDf741Z/OXq0CCIzsezXWGzPSaO6z4EHokEhsHGoPK1IQAMYL8PGoEgnTS1VYAm1qGk2NPqYPzobm2CubiU/utpRCJPEpT3ZYpz34G+v0emmwPC8A0HtPOXna/ejpwGvw5tUE+IiZVY1sWBaYMYbdpb94JoMbZTkgB0XzsArHq8OqfMDyOiizBUlcMv2rKJig4vRSk3utC/N7jZcaT/dFQZPaUZPmzd3PcXtd/Z4ZRONmCtZLscn7vv5WCWtecAcSfIn/5uLwCIcjNH84lDqvGfZcBJlfsMm+upjngpfJiB1brcr7exNzRHXFUQSXl23CmBDfBK37R1YTd9Hbvq/4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DBBPR04MB7724.eurprd04.prod.outlook.com (2603:10a6:10:209::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 07:09:31 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9745.022; Fri, 27 Mar 2026
 07:09:31 +0000
From: guoniu.zhou@oss.nxp.com
To: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"G . N . Zhou" <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v11] arm64: dts: imx8ulp: Add CSI and ISI Nodes
Date: Fri, 27 Mar 2026 15:11:05 +0800
Message-Id: <20260327071105.4110282-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::11) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DBBPR04MB7724:EE_
X-MS-Office365-Filtering-Correlation-Id: 30998a99-5b87-44b9-bf99-08de8bcfcb03
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|52116014|376014|921020|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 +Ld3XhqTxUvTJHsrKkvN55hMV3FRSAWx1NpRqpof5+yDPuFAJs+BRpq9SHMt6F/9RQV6EpPeO1qcczJTUqMFCqMFw4Q2Va8QKbjsQreACUZ9txxfWtCk0pkjn/hVrg9rvYLJSs/hsdSsGfYvIwHkIWQB6vv3GNH8x0+6hypplxS7YnfGlfijVxlknwKzl4E83joy410+QVYTF2jSJqGYizWk2tth+OcHbUPE/H4EoLR0/ZBAMSZWkvOWy3XXvF7llA9WCiW6Yc8K7TZkiIBWzyJzt3Btsg0VzpwqJVWkw+zPAXU2G4VUQdwCGMawJZKUJK+ciRfobsAF65ViCjQduSa7U3raIp7IWlaNyKZo2wJLYQJp7QmwlUnAhLZ61xn5Ewm6PLT0ScQX0+LcPUygZNOMVuHUkW9o00LAVjO0UM4yPyDqAOaGIC4QkxKqQWKQyQDtMP1bWbZzBvMbLfQfYe23PKbWs9ZTEskA+rCtrpCTEA3ryHubNqpvo9iz+TdS7bv/88lefTtz1T0PRYpb+S/hkOsVoccMpCSwPKaj05C+rfxiQxlIlT6kVYXBvAiTt252stMPmMyxL4PmJQvU/r1K+GyBZb8EDV0VzwBfHCXcrr0ua5oZR0gYADG8C5JMOclJyyM6eVv91IupiiS8QTVS0bwZEbsf6GZFG5JomwAoyib1gnD3amNuQyu5vQ0rnJrzcQkc0qlDWpvA6AapbOmsSz3YFhMG4l6ycuVW/9q1LrbJbAD5gc3SAJgqk38LtKnAFjacQqeCjuwQU6KgIRCF6N0IJ/+av1ZnV8bptzo15xaGGoAaaVnSoDGaW2FY
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(52116014)(376014)(921020)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OWFrWk44L3JkYVdVZGovVktqWG1uOThJQ0tFU3ZXdFpPekRLazBVRjNzNW9R?=
 =?utf-8?B?YkM1cHNDWHQ1cVlYeGplMDJMdWNteUhJaEpzZUJMTXo4UHdra2lWa0ZEb09a?=
 =?utf-8?B?azZQTGFhVE16dDJQaytCNkg1Q3B1RVRlVW40dkpmamJRVC9HUUZIQVRacjJa?=
 =?utf-8?B?SWZZZUJlTDZDbDB6VEh5UzVUclArM3JnR0lJak9oalBHMmFBbFlJNnVJbXp6?=
 =?utf-8?B?V2xHWXZVaUpzL3NxMWNWZTBrZUpsRm03ZDJlZGZLTmVxRzVJaWFjcFVHNHdQ?=
 =?utf-8?B?L2lWb05qV3d5WnZoTmlKOE13bXRiU0k4T29CSTlBS1A0L20wempjQUtKY09U?=
 =?utf-8?B?V2lERkNtNjdQT2hsNXlBbFJVRjQrcjU5OHdqMlJhMG80Y1F2TjdpUW1YTXZI?=
 =?utf-8?B?eWh3UXBQUTczQUk5TTN2SGdlN0xjaVE1U2FwSFFSOEZpdk85QjkwUDZaNklT?=
 =?utf-8?B?aW9IR2NrbEduR2lHYjcrOEZnUE40Vldma3lDSm9URnJicWtnbE5KTFo1SjNF?=
 =?utf-8?B?WUR6UWh2R0crWUFXVnlUVUpCMGIzZmw1YW9DTDVHUXEwVFlhS1VKeW9EWVNN?=
 =?utf-8?B?YklMWTNSbXNSTTZqMkNacEFLcVlnNkJVanFMSndLV0h4VitmU2hwNks5VS9Y?=
 =?utf-8?B?V1A4UWFhckNld0RsYmNnQVZMK1ZWMTBWRWxFNTJIS3VoSkFpWDNrQ01zdGVo?=
 =?utf-8?B?ZEQ4amlRQVV2K0NNYXlydEQvM01WaFVOYzcyckJjV21PaDZMZUgzRGxFUUl6?=
 =?utf-8?B?TUtsSGFCWUNoVzViYitwOG5zNTBBdDBGNkhEMFVTSTRob1ZSSEhWNlNpbm1x?=
 =?utf-8?B?MjB0bEVEaG5mbDlGSldJc3BIblkvWis1ZWQxM2REelNQN3FKdEhsY1VsYUox?=
 =?utf-8?B?ZklUSjhMNmNMZStjcVRwblNMSit5bW9lRXZiRDEyUXFQK1BMaUlGWkFNNmh1?=
 =?utf-8?B?SzcyYU1mY1phQ1crNjhtbjBmR3VFajhUVk94bWpFVUM4cUozaFU0ZmwveDBr?=
 =?utf-8?B?SWNxOWMxUUNRU0drNEYwSTRkNnFCOU9xU0FlLzViZGVMRHluS253dUZCMG1U?=
 =?utf-8?B?U1VkL2lLY1V1Q1MvWkJOa3Y2QmxVV2pieUEvM1ErdGE0c2V6emxJN0Q0aTR6?=
 =?utf-8?B?OVNpOHVOd09KV01nVUFjdnk5UC82R055TGxHTDZOcFBXbVppdXNkdkpFalVO?=
 =?utf-8?B?bXMvSjBwdUJhR2FwNWgwWTB4cEx4bm5CSm1oZEYvWVVrU1h3QXFaSzhscUMz?=
 =?utf-8?B?NDF6M05pb3JhYzlzc2lUeWJmeXlkY2JHMjU0Si9tL3RzR0lwcGFGb1dnZC9O?=
 =?utf-8?B?U0xPNmdNaEpRYmE5aUJXYmlNKzlLeFlnazc5ZXd5dlpLakp3WUZyYU9CUUZE?=
 =?utf-8?B?U3hSWkcxRVZrMVNrZmNoTmRpcThobVY0NkUveTdBUjFDMXJNK0NuNC81L3Bk?=
 =?utf-8?B?bDI5eFFPYmY1eVFMRUFNS1FjNG9vT0s1aWRnd3g3TlM0b2VGeXB1TFBjV2JQ?=
 =?utf-8?B?NWhXSWl2dGR1TjFvc1Rrd2xCaXVqWXZzem9DNXlGYmZqYUZvUnJMRVUyUlVL?=
 =?utf-8?B?Q1dwYWNvZ0kzcWpOZzRHcUNuR3N3cm0rZ2JGYWxucE56Q1ZKckVITkVnVmJt?=
 =?utf-8?B?RTUrZU1xNFBJUHU5ejI4YVZ4MWVVZUs1c1BSd3pjcmM1bXhoblpaOHZrQWZI?=
 =?utf-8?B?RFBXcGFkNnBmMVBWeDEzWVRvbk5pT2t6cmZYSkEvYXpWNVo3VHRyZWFTNk11?=
 =?utf-8?B?SnFFbG8vdng2V1NZQXUyM0xCaTY3M05CWU9ybjZOa0dvQ0dQSE9iWTQyVldt?=
 =?utf-8?B?VFk3K2tjeDE1WlZHZ2pPd2F1NTAxckRhSzhWelJXSUdoSE9qMUF5bmdWVFJL?=
 =?utf-8?B?VlBhaUcxU29GN0JRK2xoT2EzSVlTWTgydFVWWjBla3A2VnJud0JRMnpVWDRN?=
 =?utf-8?B?eTlWRG9kWk14bjYxbHM4N2pqRXBKZXlYaEh1WjkxdDBXVWF6cTI0R3RJV3Qw?=
 =?utf-8?B?d3g5T0wySVB3MkgwRXJRRnFaYzMvd2J3RWRwcFN3bnZDMDNWRDQ5RC9IU1JE?=
 =?utf-8?B?cHg3Y2QreUdaeGR5Y2haeCtVTkY0SVEyMG1pV0hkMEM0M2ZSUjEvdEJBeWVB?=
 =?utf-8?B?eFZEVS9JUGswV0pSVUdrRTI3ZUxtS0t3dFRhdnBwUmFMZ1lvNFRSNWpCOGV4?=
 =?utf-8?B?YmlHdXQzSWFQRHVFcENmditZKzNNTTNndVd6bml3ODhVUWN3L05hRGJLMmp0?=
 =?utf-8?B?T2xNVEdoT0VQVmVlcVdIQ01KMVB2djl2WE5OUXBDYmx3dUVhTCtNL1FHQmFL?=
 =?utf-8?B?cWpVRkF0MmNncjJ5YzRIL2VWVWZxSjUwMzQ0UzRHbDVaYWgzSzJYZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30998a99-5b87-44b9-bf99-08de8bcfcb03
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 07:09:31.5814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59XpU06mN2ZhclPzT1mAa4YXgYSk2QEBdB/tGj6FSN4jW+BWP7fhmTIyPHLm+NPEF/82LaHdbp1jNRlc58usBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7724
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57195-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ideasonboard.com,posteo.de,puri.sm,kernel.org,pengutronix.de,nxp.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4792A34038B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI-2 in the i.MX8ULP is almost identical to the version present
in the i.MX8QXP/QM and is routed to the ISI. Add both the ISI and CSI
nodes and mark them as disabled by default since capture is dependent
on an attached camera.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
This was previously sent as patch 5/5 in the v10 series based on media
tree [1]. Patches 1-4 have already been applied to linux-next tree, but
not yet to media tree . This v11 addresses the conflict with the removal
of include/dt-bindings/reset/imx8ulp-pcc-reset.h.

Changes in v11:
- Rebased on latest media/next
- Removed #include <dt-bindings/reset/imx8ulp-pcc-reset.h> which was
  deleted by Rob's dt-bindings cleanup series [2]
- Replaced reset macros with numeric values and added comments to
  document the reset indices
- Link to v10: https://lore.kernel.org/r/20251205-csi2_imx8ulp-v10-5-190cdadb20a3@nxp.com

Changes in v6:
- Update compatible string in dts for csi node.
- Link to v5: https://lore.kernel.org/r/20250901-csi2_imx8ulp-v5-4-67964d1471f3@nxp.com

Changes in v4:
- Change csr clock name to pclk which is more readability.
- Link to v3: https://lore.kernel.org/all/20250825-csi2_imx8ulp-v3-4-35885aba62bc@nxp.com

Changes in v3:
- Change pclk clock name to csr to match IP port name.
- Link to v2: https://lore.kernel.org/all/20250822-csi2_imx8ulp-v2-4-26a444394965@nxp.com

Changes in v2:
- Move dts patch as the last one.
- Add "fsl,imx8qxp-mipi-csi2" to compatible string list of csi node.
- Link to v1: https://lore.kernel.org/all/20250812081923.1019345-3-guoniu.zhou@oss.nxp.com

[1] https://lore.kernel.org/all/20251205-csi2_imx8ulp-v10-0-190cdadb20a3@nxp.com/
[2] https://lore.kernel.org/all/20251212231203.727227-1-robh@kernel.org/

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 9b5d98766512..84f05c83c702 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -859,6 +859,72 @@ spdif: spdif@2dab0000 {
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};
+
+			isi: isi@2dac0000 {
+				compatible = "fsl,imx8ulp-isi";
+				reg = <0x2dac0000 0x10000>;
+				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pcc5 IMX8ULP_CLK_ISI>,
+					 <&cgc2 IMX8ULP_CLK_LPAV_AXI_DIV>;
+				clock-names = "axi", "apb";
+				power-domains = <&scmi_devpd IMX8ULP_PD_ISI>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						isi_in: endpoint {
+							remote-endpoint = <&mipi_csi_out>;
+						};
+					};
+				};
+			};
+
+			mipi_csi: csi@2daf0000 {
+				compatible = "fsl,imx8ulp-mipi-csi2";
+				reg = <0x2daf0000 0x10000>,
+				      <0x2dad0000 0x10000>;
+				clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				clock-names = "core", "esc", "ui", "pclk";
+				assigned-clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				assigned-clock-parents = <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV1>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV2>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD0_DIV1>;
+				assigned-clock-rates = <200000000>,
+						       <80000000>,
+						       <100000000>,
+						       <79200000>;
+				power-domains = <&scmi_devpd IMX8ULP_PD_MIPI_CSI>;
+				resets = <&pcc5 5>,	/* PCC5_CSI_REGS_SWRST */
+					 <&pcc5 6>;	/* PCC5_CSI_SWRST> */
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mipi_csi_out: endpoint {
+							remote-endpoint = <&isi_in>;
+						};
+					};
+				};
+			};
 		};
 
 		gpiod: gpio@2e200000 {
-- 
2.34.1


