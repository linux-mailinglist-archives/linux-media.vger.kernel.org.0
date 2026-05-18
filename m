Return-Path: <linux-media+bounces-61874-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OxCANh2Cmo61wQAu9opvQ
	(envelope-from <linux-media+bounces-61874-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 04:18:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 729E5564FA3
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 04:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EE113027116
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 02:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04612E6CC7;
	Mon, 18 May 2026 02:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sENFjXYP"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013065.outbound.protection.outlook.com [52.101.72.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D37921FF30;
	Mon, 18 May 2026 02:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779070640; cv=fail; b=L/JMkn/JDl+PtfO1H7xa8d8EpIfj6YDEHeFuAm2gSK99ZxEgRQmJvj68ZmB9h6IrJnOLe/kokUg2csNuyMnZIGzGmSAxRY1Sg8EzIc/Q5IwW+uyN/RTtg+/f+WYxHqx3YWql3PprZJOn+j0mylQn3c1r4/SAodzBW3eGasiC0tY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779070640; c=relaxed/simple;
	bh=d0fmodqxKgNr6ABavYyMbhg/wVSURJOK5CDPMZXk+nM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ohntCtrVltY3dT3UHx9KgkMTi/QMjyRHTLC0hw+Jc3Zpe1qfkJDTlWZiEpn8zb5zP1T1v2CaxzQW5sqE4ya+Ei3yqpM5BNh9h88eJn+QTHiQyPxi7yO0KAtTE1UI4HgV+cxYNdmqneGsfyrGeYKkOUWV1bxUTmBQtvb5qj71QX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sENFjXYP; arc=fail smtp.client-ip=52.101.72.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYs848njsBHtTQBg9w0BrTVjVqEZj+QO0T+9A6r4JSmaU3qQrpDtFIgodyeiNNITXT+1LpPrsEGC9f51Dvi65RzewhF+HY4OVv8Vami4pcna0k90f3ZohUtsuGJhVZ8X1sKLdhon4ksoWnJeoeneTv/jYQh85qj005Q76LU/HVmQGuy7/N29N26oa81/fZA4oS54X6h8tseJFHlfLKzU7sVKNNzej5fowyRTkFMQdnKM2vcJN+f/EFAo0SV7sdp0RZOj64RWVjyHt2ekXF0593RSGRln1YMVDX3sbGEM4IzdSwJkfz4LlYx/F3lsf4KAPBLuiEjodAabONbjCUPa/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHWE3KnYFoCNTNAqiYS1qJxQoY0QUdfoW+pGsmZ0eNA=;
 b=WGuUAJtCYBbVcEAy1nYaFW8f9d0CcXDR2Sl2G8gyvTsjev7GL5Kh9Ql+wB49Pzw1lMajCxywp4AbdqqipbxeeYxJTF0i3E0vmjiJD3/BYciDzHZ3e3+7udJRw5y+HHLvPbaWvQ1+o7cmAFzxHr6m5D27rn+B7+a0sPRvyeS5IaHFAFa748u+tkulOvafB5avnoqbxaAecEi7IReb99NiZn+oyK0BYOQsUNU45xdeEP6ScU1pYPcHCh9eTtGrcBEVc+aaZ4gpdzkUuE9NbFRQ8IQOVjIjgXB+02eoL8tbFVANCqNWsCaQ0yRkP7p9LQaSzcxACJURSwxB7Q3DXD1TJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHWE3KnYFoCNTNAqiYS1qJxQoY0QUdfoW+pGsmZ0eNA=;
 b=sENFjXYPMhAyRyMRp4wYi55NSfCfcbpJTcTrq7v3gG+b85qrh1ahciNiNrl45Pz/lvezOd3GoNRv8fSLjSN9uOzpSrzK4uZIRf057Akc3ZSLJwaVwur0ErANjTNsWpjXh8241LyLhgbuHfEThJhMYpn/0HYbOrxBSPLuebQt2KJCdikeN0BH/jTNTd0qcq9OeETBYIO7YWb282wG2ynrO9QBkrDQTxPZkq5K7zlEr/EHxjUdKncIr5prbAbsUYWvC6zgBiFiRYUIduvx5zRkwZZEfZw/8gmXYJTRB2zyLMSBKphHPhNI2w+bDi8TAW/7NfzX79C1GupcASUAsy/IQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB8PR04MB7179.eurprd04.prod.outlook.com (2603:10a6:10:124::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 02:17:15 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 02:17:14 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 18 May 2026 10:19:46 +0800
Subject: [PATCH v7 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-csi_formatter-v7-1-562b750557e3@oss.nxp.com>
References: <20260518-csi_formatter-v7-0-562b750557e3@oss.nxp.com>
In-Reply-To: <20260518-csi_formatter-v7-0-562b750557e3@oss.nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779070804; l=3108;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=wf760uCgsG+wUpFBLE5Il4kLNLGkLKR9Szl79UUNhec=;
 b=bdQQBt1CnufUV5vQRyQ5+E+LpIrAEf/mOZm7MSRzneJUlXnEfnnjgZdkUQlO8t6cscrZIkWeK
 W4/27/I8cTuCK429u55LKsKesy6yMwo8heMyYBFUIFsAe83KjejIyWv
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MAXP287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::25) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DB8PR04MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: cbc34e74-a00d-404f-7b17-08deb48393e2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|1800799024|366016|3023799003|11063799003|38350700014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 4tHc4x8OuJpW4YjIMOF1pOq8lzyJR/mVatC91HW9g2Mj6A/2Nkn/7/26w9hRwnvOTxII2lgWKRw+mlBfShg+NMHHfwhqYuDhxKD9zRb0DSZOFI83rDX4fmWKTKdt4Q0POJuU9Okzmn6uBBnNwBq9mCq0lPlpJb2/kzEC0R2WVR72PjmGyZLB8SBnqv0Y3uhE70b0UcAx1a0Jvbij/L/CQJzhDd1b1KKwjPXWBCqOXV3wyg05bt3c7tQHmp1gh/Z54qWCNK2Q0MLEmn3inNIYsMMSvf2PopKip3+fSvsiwBT3T40I6TDb8KW86YdhKNqwZDqcMm6XwDOxbnQrfymZivuEHT8ZytbXKUbK4rgqe563pJ95EBuOso5oS8tCIohIGnAEsUnPx2QqSVW56b0iaoL/ftHdwyV0Hx5brC1UZtGyLq+HohSBI0lYVGEkM36R8b7dcOzzOpyMwwRSI1+uGRBOiL8SSDY/tDgCaDhLdy49zGxHn/jmeSW3zf1WGM6WTg/7tTkKAheGqga3AUoWVEjcd7lkThY9/O/NXtG/nMzej6aucuZcPCa8nKyYWs+lrzlfg2hUzGuAx3QJnDsVO9M7kdqMt83LWvMhT8/j6oiNA2KMtporF1VKci1WWRcJthkt32kTvkLevX/ue8l9+gZkFPZic+vkpYOoX4+8OYuoB+6XBSDZB6Hph54oUjalx/NM0jmfO/lnurqCHQqJrQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(1800799024)(366016)(3023799003)(11063799003)(38350700014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?aXU4dTNXVjdhY0ZuaHpCYmNGQlBNd2NTbjdGWU5qbmhtTVZwUjE2WWQvUFFN?=
 =?utf-8?B?UENRUVF4TkVTMmhQK3U0bVZ6d1plZ0ErYzFoRXJZamUxSEpVSlhKa0h3dVJv?=
 =?utf-8?B?NXNaQVZzYm93eCs3U3ZSV1JFTkdNcWhyakEzOU5kMTRwS1gvRTlmbzdUTFN6?=
 =?utf-8?B?VU5YRlAxaWN5WGRSRldJc3IrYWd1TENkOFd3a3paanFjL1o3c3lpZGw5N2c2?=
 =?utf-8?B?R1RHZEtsNEgwWWl1amI2Mk5ja2RuZkdmdkNoMzNaUWN2Rnk5eFY2cWdjeWRq?=
 =?utf-8?B?N1A4aWxjUUNQUWhwTzdJbUs1bXdmajlzdm9RWVZEM0hIWEZUMlp5Vm5Qb1F4?=
 =?utf-8?B?NDNqT0RlZStjeDQ2Sjl3SXJkbGxrSHk1S2FBaFFJaGVLbE5VN0pwM2hCTzFJ?=
 =?utf-8?B?Mk9GWFRSbGpVeUxCRFVkd1FKYlF1QTJzNWZhN2NacUNnWXN5N1JCVzVLdGgz?=
 =?utf-8?B?b3UybDBEZDdlV0JjeCsvQ3RHMEpxUjhsOXE3VDErN3pDTjA5L0ZqWVljcjVJ?=
 =?utf-8?B?MGZOc2E1Ym5QQVhYT1B6OTk0QWNpdjQweDNvV0t3SmhMa0FybUxhVE9aY0N6?=
 =?utf-8?B?WHVuclg1bzBEeHl3WEdPUXVqcEM0N3dxcUNsWk4ycXkzM3VJMjdRWkJOUjNW?=
 =?utf-8?B?K0VtaUdVMU84S2czellxamdvc25yeGVjbnd2RCtRVVlaTkcwMzh4eWRjVExZ?=
 =?utf-8?B?a1B0dk9DQzVkRHhMK1U1L3NYRUdPWjBJNEI3anZlNmN3TkpPOFU4dThrbkRl?=
 =?utf-8?B?QURDQXJ5L0xaNzZuOTVEMUJCaXdSSEgvTVcySEFEdVhtMVVrd0t4MnJNcGQr?=
 =?utf-8?B?YUdvK2dLbHVOSjU0MkNZeCtUOGZGR2UzeU1IYXBNNTBrUUk0TGFhTjdBelJ2?=
 =?utf-8?B?OGlocWY5ajV6WkllWWx1cDUwNU5oRTdxaUh2MUd4Znd1R3p6eGExVjArMUF3?=
 =?utf-8?B?cTdNTVIzdVdmUVNIaWk2OTNsUmx0cjR1U21LQmQyamhpaG1STy8rT2I1eHpJ?=
 =?utf-8?B?aFRKMFZCZmZUazE0anVyakh3S01SYUs1SXU5MjdPbUNmRTdyKzhnY01iSHN3?=
 =?utf-8?B?U09tU0ljN3JlM3A2bHUyT3JXYjh4cHFPekhFYW9GRWYzYjZvcTA3OFlKcG82?=
 =?utf-8?B?WjNlZ0Z3NWRxVElKd2Q3SXpCWXJYcW5CYkFZOWZVUnF3VGpENGRaeEJMUXVz?=
 =?utf-8?B?RmFCSWV5NXllbDJUaitBd1laR28rSnh5Zjl5UllDdHJONnJaWlh2UnZZNUlQ?=
 =?utf-8?B?cmhISGNzS1lzQUc0OVdkSWppVzE0bDI0WU5ITmxoM1AvR2ozRDNRemVPRjcr?=
 =?utf-8?B?VVVlRE03NUlZb3UvWUJYOXcxMXR5UWd4dFkxMFZYOWRmUzYxRDUzN3RqdTdT?=
 =?utf-8?B?WWhwNU84YU1xUGwxR0txem9uQkF6YTdIYXY5cWYwcERIcDBSWklVWnZkWWhY?=
 =?utf-8?B?YUphUElqY0lzYVZDK1dVV1o0Tk5aTFRjZmZ3MzZWbkNmTmVjdHV5T2ZSWnAr?=
 =?utf-8?B?aTNNcHhPWmVWL3o1eWNrU0ErOURWYkE1d1BNc2xIODR4NDkxdmxNcGhxQVB6?=
 =?utf-8?B?ZUNycCt2NTlxclJRNUpjczZJemZHRUppRGI4QnEwekxzaC8xVSs2eWRvMEwz?=
 =?utf-8?B?K0VKL1A4ZnkxUXhiRXIrN28wcHErVDViNkt5SHUyR1M4T1d4ZExJMFFuSUpz?=
 =?utf-8?B?c1pLTTl4dXV5WjVqYlJrTDA3Y0dTZDN0S0tIWDMvd2kya2REVGFoUUM5cE9O?=
 =?utf-8?B?aEpNYkNyeVlPRENWcWNMMVlWallnK0xkMFJieVBsNkFwSk45N2RNbWxtWmY2?=
 =?utf-8?B?c1pKcUZ5Z0srcXlJTDFhT3RiZXlOWTNmUi9oN0UzZjVudWhwZlF5SGdUMlFT?=
 =?utf-8?B?U0REUTAvR0lTdldDVDJKRE12eWdPUWF1RjFsZWlORDVUSitwcnJwQmNraWFS?=
 =?utf-8?B?MGtDcUYyQ3lGTzhHMmZDZTdQTHdKWVRHUCtoY1ZVbVY3blV6d1BKT0EzNXpK?=
 =?utf-8?B?MlFId1I0NDhWc3JMYk5jM0V6WXlCbzlZZTRlWDhWWkpKK3F5N0pWT3hjc2hQ?=
 =?utf-8?B?Q2xmM1d5YUdBWW0rdy9ReDVHNnRRTWxOSUxMNE9QNTJsNHc2WHhuRHZFbXYx?=
 =?utf-8?B?YUNNMkxKNEtBM2xxMk15bnZOazl6OEFWNmE4aXFDYzFhRi9iRzNqbEpzdFNW?=
 =?utf-8?B?dTRZU2k5TTlpSUNaVkFDY05xSys1REdJanpsYTBZUXUvbjQ5MHgwK0hib2JE?=
 =?utf-8?B?YlJOWTVSb3JlNDh1a3FYUXdwd2srR25COCt1amU2dzlhcmx1NU9VL0lxQU9G?=
 =?utf-8?B?R3ZtS1RuVWYwWUx4QlgyVzIvdlYxNWhTM1p4eTFEZnZCbmZWM1M1dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc34e74-a00d-404f-7b17-08deb48393e2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 02:17:14.9386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GAGBNrztBzDR6RJkcvVBqi/kvyynf5shUlrKrIaLQFcu8pFS3jmvI9hTwhrPnEvdHYFZUq06c+dGEIUmN28itg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7179
X-Rspamd-Queue-Id: 729E5564FA3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com];
	TAGGED_FROM(0.00)[bounces-61874-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,devicetree.org:url,NXP1.onmicrosoft.com:dkim,0.0.0.20:email,oss.nxp.com:mid,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The i.MX95 CSI pixel formatting module uses packet info, pixel and
non-pixel data from the CSI-2 host controller and reformat them to
match Pixel Link(PL) definition.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v7:
- Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
  Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
---
 .../bindings/media/fsl,imx95-csi-formatter.yaml    | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
new file mode 100644
index 000000000000..28adea06c494
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx95-csi-formatter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX95 CSI Pixel Formatter
+
+maintainers:
+  - Guoniu Zhou <guoniu.zhou@nxp.com>
+
+description:
+  The CSI pixel formatting module found on i.MX95 uses packet info, pixel
+  and non-pixel data from the CSI-2 host controller and reformat them to
+  match Pixel Link(PL) definition.
+
+properties:
+  compatible:
+    const: fsl,imx95-csi-formatter
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: MIPI CSI-2 RX IDI interface
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Pixel Link Interface
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    formatter@20 {
+        compatible = "fsl,imx95-csi-formatter";
+        reg = <0x20 0x100>;
+        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
+        power-domains = <&scmi_devpd 3>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&mipi_csi_0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&isi_in_2>;
+                };
+            };
+        };
+    };

-- 
2.34.1


