Return-Path: <linux-media+bounces-53692-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDEaEJN+oWkUtgQAu9opvQ
	(envelope-from <linux-media+bounces-53692-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 12:22:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8471C1B67D0
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 12:22:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D65A318C8F2
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 11:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBAC03EF0BB;
	Fri, 27 Feb 2026 11:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OFLyGVap"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010010.outbound.protection.outlook.com [52.101.69.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC513EF0AC;
	Fri, 27 Feb 2026 11:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772191180; cv=fail; b=lUlxeJFz+Pz+lVzGC0MugpephDiIyQCTtHD+crmeo4BuBWZ2ViCbYYgaEBK6+AAH0r1p4DBBoLmO4f4jeBKPtWJbPu+YliPrK8VBfA7bW7Ha/Sq3GWjytyLpvWqGGRcI1wTCBXO8aWyza4lO3bmetEafYt9CbTLYBLnRxHMbEhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772191180; c=relaxed/simple;
	bh=CdyLKvVvmtYg31rL0IKxQ4LOE/TGVoM2XXjxFPveMao=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lwoRkNbH2VoL/F1ZBxLuZdP0tuyR5AghF+G2bQNNZt2HA0zgfFbB8e/m8+JaekLkY3DqeA1lCC2jBldU3bTz+5I47WWZ1ThPiiwbU/XseYOd045ZffGq52NNRp5B2UZipBPJHW6Aa4ZuoGPqlQ+9VGaDOPbA6oqaRHqe7Kbm/HE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OFLyGVap; arc=fail smtp.client-ip=52.101.69.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlWHnJV1X7oRIvUj8RC+GoNIGaNkuoy3aFiC8FTtdLfvF3YMz7Sj4sV53HyT+ebm4Zpv8oQRI/ZyF/fJSpU1KCYro6rPQhFe86C933yHqIPCU9vOi6L7phwXxxRHcpFT/1YsrCkXBWXd+lz3YxSm6lsSNYzx7Zoa+qFZVzmoUxvuBr3yl/Tm6T7t8pHMQYKxxz1oaXgdI+nNfP28ISNwj54WQyZ/PXSCX/ePrpC7UEJEIuTg0s/RAl9YvcQ1Pf92lvHgvXcGosj2O4VJfcv6NPG1M279nO6ZlS2kOtmOF6hF4ISTVkpiet1BFJw3+DL4tXe4Vu1lIHKh1izc8fIITQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49d4rXwGeeg1WxBO9LvqpfX7U/pz/TeJxH4D5oBsjU0=;
 b=o1g7+cm/SMmTSsbMnAqkNXqlNmvmKN6f20reZ7SpmBHR44eH+fD77f5sjymY3oAM/DckNCMsnkWo6sxtGuI9VuVs19BfwngcMn9SUt1uOUboNRFJ1Ks1WgCz49tb6uefg/3y7WAfuDrtGrWirasAuDMTaqUVYTfHF37e9XskSWDtCX27sahBxs3TX1uwjgrWweljGyK1PsQ/2SvWNhraJ9wkaX1lX32w0b7eeOZUTYa48I6tmW3ZnCglJz/+Ww/kaU9OH+OCn2PnJnugQA7CdYGXN7CbiwDWDmgSYNqOcYR2hFKjilfJ440YuDoGyipySCI/4HlNfNfkZmYqjbixIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49d4rXwGeeg1WxBO9LvqpfX7U/pz/TeJxH4D5oBsjU0=;
 b=OFLyGVap5nq2d9c3r4RnFrDe8dBg67ipycFISLzM3lpCBjrKjeXQKQy83r7JHQpjaENAMdWozsAarV4fUXl4wpdjqfLlZnmeARKOfICfMj5s4VXlRK9YLML+GaYVLqS2DpWfKql62rSDzvIFanKMKjn0TCIdNqEXbgI03KmS34OV6evKlCNEDWOdpZkHzuwMp7pXHXz6itucv9cbekI6sNTuu8OXgPFojFH5c8/4hHwMDIOPE2HYHG9z+YHbsBolgCZToa9+C7T0Gl361DSIcPH1MphalVbJVl/Xe8M9LlUI9HnBU53g0o8etc5NjRczFkb1OIjm85/WYFeR8gQ0rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8272.eurprd04.prod.outlook.com (2603:10a6:102:1c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 11:19:35 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 11:19:35 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 27 Feb 2026 19:21:11 +0800
Subject: [PATCH v4 2/4] media: i2c: ds90ub953: Add back channel GPIO
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-ds90ub953-v4-2-dea596205f9e@nxp.com>
References: <20260227-ds90ub953-v4-0-dea596205f9e@nxp.com>
In-Reply-To: <20260227-ds90ub953-v4-0-dea596205f9e@nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772191287; l=4554;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=pISGgEeyAzizsXSUrwBoDuW/Dqxg3k7f4qx2mZIQ9EY=;
 b=rQOHZaeUU0AQYWSHYBKQ9ZLNoY6+dQkMvqvb92fjz1Kliw7Hv9squmlSQHn6KxVe3MAVnHp8t
 DhOQWZGFo48CbHzWMzkDm1ncU9juQO4VsQY/Mn5Zf0cHaeYbp7Fgkju
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAXPR04MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 1769476f-23a6-4da7-37b8-08de75f21678
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	6Q10Hwih8xK7pL8l8hRfiaJZmLDMlJWOm+TXXVKsVChgpiAuHeRlv4wWj1FgOejr15AboZqmsxgoqpfQJLsGvmQiPKXBScdIwmJ2032WZCIcyezo/7q3paO+AWlZSUjBCsSVKvudlTZvLVhnu7SCzIg5nv9rQ/nY5rDFc+m/a/c0EJ0GdA3lJjJGyu/5YbTPf40l99GErC5SssUX5eAWzQEQUJtH42cycH7jq8R97FDM452WF3v4tnKs+nawUP2EsFgI0u+aw/xCyH6N4ot33mPGvMMxkdg9xaONXbzHZTLPrb9LtW1W7B8WCSxf51VJPBny9yes2vfCpG19I68nT8ewDhq5Y93HXFbHZvGFqvMITV8352A+eXZJuJ1pr0nhwKQHKeeAObrs+Ghb8YuvzJP0xB34B4IX7vT+sUlHGzfy/TfAZJXp3xEVCTfRa1TBimY2xokNK/XnnJs7C1NFbx8dd/OcigcTXz7gRGqMAmuvlxywuEKT+GhuoMZKU2SF7vaRKLjDjxJhBtQ9I6eU9zjlwebOB2+fn7RddOrQ69ih5xYOnA7K174tA/qszD5L4KTkbeiu4Pkpwv1tNzTpNafklpX1juceAoAUhJKAbjAREmhGsatzfNMr8C5X9pPEFwU8VjV/rk7j3iLL9IhJOt4IrHtaLNgx4bPwMbaovr1tEsBllBEsU/SyjKJ7yjz1QXNw0Zjwf0OiJ4dxEhD7O7ln/kjtbF1UdGHReuFghTZubHv66pTDLai1PcZ+Lw7RuXuzSEZ/eUWfU3ijehylnAtLr8dFpOhtt5ArzeZMWVY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGVPZGV6U1d1ZGZzRWpYeFhvdVNKKzJiaW4wYTFIU2JONHV6Y3VjMVZESkk3?=
 =?utf-8?B?Z2MxUFFZcjZMV21hZ0tTU2lVdldoSGkxbVRzeTBua0MzTnVMa1ppMDFqbWRS?=
 =?utf-8?B?cGV5M3U5d3FyVnQrNE83bmtjaWQ0elZEdkpoVXV2YmVPdk42V3l1NDRJZ0o4?=
 =?utf-8?B?SGp2Mk1CckFvWDUxejBzeEY0RnF2NlhoUnlUbXZ3QzFMYWxkWXVGSmxOMHYv?=
 =?utf-8?B?SURzekV0SXBWQmJzM0IrSVZxWGdlWmc4QXFFOTRkYWFGZFpRb1BGMlBZaG5N?=
 =?utf-8?B?UVF5aWh6SlZTQ3BESCs5VHVkLzNBaDBFK3hBVUsxRGQ3cjZuWUZoMjdUbkNG?=
 =?utf-8?B?RGduaVlwYVNUZlRzOTQzajQzK281a2IvdU1EenN2TzZXS0t0VjBoWERBdFZN?=
 =?utf-8?B?ZTFvdUxWVFFlUmNkZWVoczNIUWE1NWhWVWVKQzR3cTZ2TnYwVHlXbEp6NFlB?=
 =?utf-8?B?NGUxYWF2alUvcnlsL0lBbUJSOGhZUWNiZ0RHRW5DTXZSRnRzQWk3TVVnYzRU?=
 =?utf-8?B?dHh6TU1PdXdxMURzbnphbHdMVG8rQlVYb0MzdVJzQURwZEg4QnBObUhXSGR5?=
 =?utf-8?B?UHRRMk1wVWdEM1hVaUFhNElmMWZYclhsR3Jud095YVhTbmt2NkJ1T2N6TE9M?=
 =?utf-8?B?LzVTakNYZm1LU2YweWY2RHBwZ2RGREc3c2g4eWNRbXNvMGpiVk9HUktzSmor?=
 =?utf-8?B?TFkvWXFvL2VBMENaWHhIRm1KU2ZNb3VLOEhIdWRIL1R1ZmVqM25lN00rNmhm?=
 =?utf-8?B?NkZ5SGF1YWpLa1QvK1ZjUGFPOVp4UmlWa1dFbzE0MDV0ZThxVWU0bGYvRXpQ?=
 =?utf-8?B?SDFyR1BKS3lHb20wbXdXY2Y3RlhJenFGUlY0TE9CSGNYekhhVE9NYTduUUV0?=
 =?utf-8?B?SzBlNEdRVmdFdTFoTjVvaHdNejFZbm9iVGRIdnVEcytKSmlrcXlOenBJc3Zs?=
 =?utf-8?B?U1lPVFY4bjRIa29lWFY1UXQzWjAvTDBJNHhndjVVTFhITEZad3hVQ2ZKcXhZ?=
 =?utf-8?B?TUlPOTFxRTAxOXEyMkpHa2hnYmZXZkpNekJldkNlaDUwdDR2WSszZU5kSUtv?=
 =?utf-8?B?anJ2TzB0eExNMVFYaU1oOHZDMTdZcTJaa1V4WkVjY2hQOFdDNlEvaVlTek5a?=
 =?utf-8?B?ZTBTVUE5MkMyOElkU3N5bzNMbGJzVFBtZURnbHVXNE10cjBsWUZCL1VYWHV6?=
 =?utf-8?B?M01DYWJ5TlFYZ2Q2NW9NUlNsUzdTWkFtU3loWEE2MVZmNCtkV3BvNGp2WGhq?=
 =?utf-8?B?aFZDU3QzUnJxRXdGMElNRHhJVEt1SDNzdndyVGVoTGo1UTd5M1ZqOHV1Rldi?=
 =?utf-8?B?STFDdkNQK0ViZFUwMHpydTVocFV2dXdTbEw1RWdNVzBMcFRTSUlhSUdPMUxS?=
 =?utf-8?B?NmNKWk8vWHgvNmpGR3d4NmhMbWJGak9FTGtsZnI0NU5JUVZOWGQ2cXI4Nk5s?=
 =?utf-8?B?UitlQy8ralRpSktzcnRYcWFRZFV2RDN5L0tZZXYvcjNMWjVwdHdDUjVJb2JX?=
 =?utf-8?B?WUM0UXl5ODR0cXZsSXZ4V0g0VUhPUHFZTzlnLy96ZmxKUVlUWW9FcjBZbGRr?=
 =?utf-8?B?S2wzOTY5dldleUk2KzhaSzZOMGZQMEg5TkdWMis1SGdkSEk4RWM3clFyU0sz?=
 =?utf-8?B?U3ptWi9Lb1JSVkVhRndDMEpzSnRUMkNPUHZLRWJLdEY4bWdaVDBKdEd4bmM1?=
 =?utf-8?B?bE5EYlU2dGhvQUF0WVZtaXJYZ1JsdjZtVWxwUE9pYktzKzFwVlpNaTRDSFd2?=
 =?utf-8?B?bTVBUFVDZ2lBK0RFRnoxTVhSazJCbDVSMzgrbC92TEU0L203R1g4dW9sTVhs?=
 =?utf-8?B?Zkp1TzZtMHVNL1ZXWGkreUIvWmR5NG80UUIwNWRZTllQOEhxOEpiWVlieDQr?=
 =?utf-8?B?Q0Q0a05Kd3BBbDlwMmVqY1BzRy9vazVCZ0R5Q0UzamdNSHYwTzdpVVJiRkt0?=
 =?utf-8?B?Ymc1alB4UzhMRk1pdWM4a0tlVDUxQ2JobW9MYjJybFFvdnByUGMrd2dkYzBV?=
 =?utf-8?B?SDlQQ0pVTHpnelZuMnQrM2o5NG51SEJodDc0bStxMVdXWFlhb0FpUjUzNDEv?=
 =?utf-8?B?bm9pMU9UKzZUeFJ5OGkvcHF5c0N3eGdFZ3E1QnlZb1JqVmFhRTh5S3dyZmhM?=
 =?utf-8?B?K1FkVHNOcEIvUldnWmltUGdJSjM5bEpnVkxmc0cwZStja2pzaTExWGl0TlBp?=
 =?utf-8?B?R1NIQmt4UERZWXlrellFQzg2T3dtUFlZNGFFNm5sb014VHJMMFJndE1RbTRR?=
 =?utf-8?B?RjhsclZtbTNiWDA2U2tqSDRIZ1dETGl3czhTa2xXSUc3N3FXTDNwVUNSMVdv?=
 =?utf-8?B?USs5V1M3cElodGMwR0RVejBwVktQaktqTkx4TTFxcFFCZUlNSEVhZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1769476f-23a6-4da7-37b8-08de75f21678
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 11:19:35.4036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4FNm5g6maeS9fJOApqvH5C0+f99r6zqHryA5oVPzjR6olVfg4F0BsQZHDAyVof85Q83N8cvZP2LS4a8cBT4rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8272
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53692-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 8471C1B67D0
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The ds90ub953 supports GPIO0 through GPIO3. When enabled as an output,
each GPIO pin can be programed to output remote data coming from the
compatible deserializer using the register LOCAL_GPIO_DATA[7:4] field.

Make GPIO range from 0-3 to 0-7 to support this case. 0-3 for local GPIO
and 4-7 for remote GPIO data.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/i2c/ds90ub953.c | 42 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index daefdb108fbf402453baeaccc61d1f3530521d74..14dd0aa4cc6ceba66a8c3545c7d7d19694007431 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -32,7 +32,9 @@
 #define UB953_PAD_SINK			0
 #define UB953_PAD_SOURCE		1
 
-#define UB953_NUM_GPIOS			4
+#define UB953_NUM_LOCAL_GPIOS		4
+#define UB953_NUM_REMOTE_GPIOS		4
+#define UB953_NUM_GPIOS			(UB953_NUM_LOCAL_GPIOS + UB953_NUM_REMOTE_GPIOS)
 
 #define UB953_DEFAULT_CLKOUT_RATE	25000000UL
 
@@ -268,7 +270,7 @@ static int ub953_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	if (ret)
 		return ret;
 
-	if (v & UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset))
+	if (v & UB953_REG_GPIO_INPUT_CTRL_INPUT_EN((offset % UB953_NUM_LOCAL_GPIOS)))
 		return GPIO_LINE_DIRECTION_IN;
 	else
 		return GPIO_LINE_DIRECTION_OUT;
@@ -277,6 +279,12 @@ static int ub953_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 static int ub953_gpio_direction_in(struct gpio_chip *gc, unsigned int offset)
 {
 	struct ub953_data *priv = gpiochip_get_data(gc);
+	struct device *dev = &priv->client->dev;
+
+	if (offset > UB953_NUM_LOCAL_GPIOS) {
+		dev_err(dev, "GPIO%u can't be programed as input\n", offset);
+		return -EINVAL;
+	}
 
 	return regmap_update_bits(priv->regmap, UB953_REG_GPIO_INPUT_CTRL,
 				  UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset) |
@@ -288,10 +296,14 @@ static int ub953_gpio_direction_out(struct gpio_chip *gc, unsigned int offset,
 				    int value)
 {
 	struct ub953_data *priv = gpiochip_get_data(gc);
+	unsigned int pin;
 	int ret;
 
+	pin = offset % UB953_NUM_LOCAL_GPIOS;
+
 	ret = regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
-				 UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
+				 UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(pin) |
+				 UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(pin),
 				 value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) :
 					 0);
 
@@ -299,9 +311,9 @@ static int ub953_gpio_direction_out(struct gpio_chip *gc, unsigned int offset,
 		return ret;
 
 	return regmap_update_bits(priv->regmap, UB953_REG_GPIO_INPUT_CTRL,
-				  UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset) |
-					  UB953_REG_GPIO_INPUT_CTRL_OUT_EN(offset),
-				  UB953_REG_GPIO_INPUT_CTRL_OUT_EN(offset));
+				  UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(pin) |
+					  UB953_REG_GPIO_INPUT_CTRL_OUT_EN(pin),
+				  UB953_REG_GPIO_INPUT_CTRL_OUT_EN(pin));
 }
 
 static int ub953_gpio_get(struct gpio_chip *gc, unsigned int offset)
@@ -314,12 +326,19 @@ static int ub953_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	if (ret)
 		return ret;
 
-	return !!(v & UB953_REG_GPIO_PIN_STS_GPIO_STS(offset));
+	return !!(v & UB953_REG_GPIO_PIN_STS_GPIO_STS((offset % UB953_NUM_LOCAL_GPIOS)));
 }
 
 static int ub953_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct ub953_data *priv = gpiochip_get_data(gc);
+	struct device *dev = &priv->client->dev;
+
+	if (offset > UB953_NUM_LOCAL_GPIOS) {
+		dev_err(dev, "GPIO%u be programed to output remote data\n",
+			offset % UB953_NUM_LOCAL_GPIOS);
+		return -EINVAL;
+	}
 
 	return regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
 				  UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
@@ -330,6 +349,9 @@ static int ub953_gpio_of_xlate(struct gpio_chip *gc,
 			       const struct of_phandle_args *gpiospec,
 			       u32 *flags)
 {
+	if (gpiospec->args[0] >= UB953_NUM_GPIOS)
+		return -EINVAL;
+
 	if (flags)
 		*flags = gpiospec->args[1];
 
@@ -632,7 +654,11 @@ static int ub953_log_status(struct v4l2_subdev *sd)
 	if (ret)
 		return ret;
 
-	for (i = 0; i < UB953_NUM_GPIOS; i++) {
+	/*
+	 * Only log GPIO 0-3 state since remote GPIO 4-7 pins reuse local
+	 * GPIO 0-3 when enabled as an output.
+	 */
+	for (i = 0; i < UB953_NUM_LOCAL_GPIOS; i++) {
 		dev_info(dev,
 			 "GPIO%u: remote: %u is_input: %u is_output: %u val: %u sts: %u\n",
 			 i,

-- 
2.34.1


