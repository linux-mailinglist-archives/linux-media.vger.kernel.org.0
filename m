Return-Path: <linux-media+bounces-26631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 474ACA3FDD9
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 18:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6326E7A1D72
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402CA250C15;
	Fri, 21 Feb 2025 17:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="akssQCau"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2062.outbound.protection.outlook.com [40.107.249.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB0E250BF3;
	Fri, 21 Feb 2025 17:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740160120; cv=fail; b=TAh52cQxAUOZneNKpdAVQbOL8a7HeHIJlcym896nKNv9K/Jilqebm5WNQjmTJfgZNnGjrjzZBbFVtTtqBo3SxeuUFE9Ka3lBXDWW/eRRR06TrOgEmdM8LtOmZHw705rYiS4K8PAyc8WzUwq1gjq6nehAYGhvceJo5KlIFwK7bRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740160120; c=relaxed/simple;
	bh=7Ntt0cvt7bV0uUGX8qYhSRp0Kv4SYgfGXSHliP+jLLc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eRqGrAgoPz1GpYkeFTbawAkRvm92Tn4dhGmW0P7Dc/bUJc36Y5rGso/64sBhPwTm1NBl6UW/8f7qrLUXFGm+gbsD8/5lbrjICLBchXl9YhMa4BXEkhxzuiGQ8SQ8I08nrKbHqaELhxuaWhzlYQvBz5XPYGRsp5ypYT7hKV1GpLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=akssQCau; arc=fail smtp.client-ip=40.107.249.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6vpTeiEy4BFKpHIC5vyvmgK7e2idx9zGZp+fqXZWLAgJSIwbu1i0orVDDUn95jG18iDzVwJdBQnMwvpIwAl2KXjNKCNS24cthzdXu8z9qhmrJDhA4kMCFZBtHCcpoVHKpNxSMoGwDfCLpc2fQcABqhGN8FqNrQiVCMTtEDBndLJXuibpZXe23NUWwqceN3Qv+1Ta5pg8gVsTR5BviiGo+vfzloF9ohRltp8WJ4jIDmJXDd+F5ns3dd+p9tg7WfIFCMj4pmiYnrmYh0tDOF/1oH0pSyTydRBI09l/h5HmSyygzzMEuJ+MkljKZjDLJBYL4V52dW5NOue902fQnd05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71xu53bGIjP4ELUrkWzI6/aQNwFGfFT8rc17y3sGpqo=;
 b=pA86j+TBAbrWRXL6FELkLJ/o79kgoGXiD6aLtdRSvQ8kFP9HgQbbE9+rV0SpFsZudfLueDxx2h8g3rbd2BYpO/0nJZJuHy5ybgvAYKNupMVvQij4kgayusA5YY5p0+UfHK3hhXGb8qxarS4fwzpXdYz9HfVrrmEkqOxUp00tM6dW+CAyuQlkywi3ZWPK70YJ383c7G58kyONR4+yN/ibjKR5F6i5cX/oPaA7+p7D6Hhkyxa8yDQnLbwakfGy2U1+h3ImCMsPapAhf6ZHAN4dwxViXbuIeGDov7UWAnv0zgs1Rn8XRgCPs5XjKJN6gvMibfBAPE+LvPn94lDXwsgJYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71xu53bGIjP4ELUrkWzI6/aQNwFGfFT8rc17y3sGpqo=;
 b=akssQCauSSN58mOdYb/WG29PAwvv7dKwmh0xHpHYdDAtgRAuX7rd8T9OqDWIDQmKdmawC8QfGNoqStlO91OLv24reMc3HE4fZDpufek252ah4ktWbbqDAqZkI1gSzi9Jy+TB1P+co3pakX5Ug+cdnYeM2tngHHNsB/2B+/ZvvQrMkxYQTvNhOuZQNpXEAeHAEdZLz4cTS66dqHf9LB1gvh6wpS10+W/Be6/wRAuSFF4LRU4lVz/XGoQHdX1wOlPU13vftVJ7NvBeXW0LhHobK+tau4xv0u8wcknAFyH2McflqCs+N8Oauc3rY565cR7jLqyI6s/zfxpSTrVtHX3Vkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7762.eurprd04.prod.outlook.com (2603:10a6:20b:241::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Fri, 21 Feb
 2025 17:48:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 17:48:36 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 21 Feb 2025 12:48:18 -0500
Subject: [PATCH 1/2] media: dt-bindings: nxp,imx8-jpeg: Add compatible
 strings for IMX95 JPEG
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-95_jpeg-v1-1-053decdb452c@nxp.com>
References: <20250221-95_jpeg-v1-0-053decdb452c@nxp.com>
In-Reply-To: <20250221-95_jpeg-v1-0-053decdb452c@nxp.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ming Qian <ming.qian@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740160108; l=2162;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=7Ntt0cvt7bV0uUGX8qYhSRp0Kv4SYgfGXSHliP+jLLc=;
 b=3LXLj00CKx5A6fFM7XHdrMWf7ERQobdvh0z0GBpDgP+7Ra8LSHFUneMgLYC6qVQjjB27KJIYD
 wORPj3SOWi6Agk+BXjMXedJPeKDmQdstMV6jIYRxO61SUaVUHgA34ya
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c669f49-8ee7-4c9a-0413-08dd529ff762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LzQxUnBlUDBjSTZGbC9pZmkvdEM1L0Z2VUpKSHpQOWJZQXBha2IzTzIvMjFx?=
 =?utf-8?B?VEtCbGZRR0hMS21hMk1BYUJ3THp5Um85Y2VXc3c1Y0IwcTF5cmRYT2ZIbXEy?=
 =?utf-8?B?ZUs2T2J4RWxnUE5OTFVRMnl1YkdnWTNTM1lqNERmTktnTm83eWgyVGcremwr?=
 =?utf-8?B?Rm9HQnovQXBGcEJVYjMwYnRXa2J5Rm1RdUZucUFvV3VWNnZtYlo3ZnlQVktj?=
 =?utf-8?B?dkMyR2VLeUFWQktHZlR1ZVhrZ2tVMC90TTFPZ3pTbHlKWHpGQlhuR1JTOFlH?=
 =?utf-8?B?RVlpYlY5RXdlcmtOcVdOaHZIMXNtaGluRUtsck9HcFhoNUdLbXVkOGI4Ukpk?=
 =?utf-8?B?WHVabDhzNVhRR0JEQkdRRXVuUWozR25WUm15SmRpK3BPdFFMOWo2M1RxbkJY?=
 =?utf-8?B?alVQL0xGbzBXaDNKZmtOeDRLR2lJOHZtZHFHbmdnNWJYM3RSN0I4T0xNMVdH?=
 =?utf-8?B?aHNtdHlSMUJ6azlzK1dmU0o2bnNydDViMG1OWjB1MW9zQjFxRnFwSGdvOUxo?=
 =?utf-8?B?cFFHUFlUSlRyYzA1YVYxczM4VUU2TUJJcHdnSEZpVFhONnZwUzIyOWxPZ2tJ?=
 =?utf-8?B?NEJLUm1nZEs3TUo1cEJrN0h5SEpnZHlxT0laUHRDM21SWDcvbTNSNmNmT3RC?=
 =?utf-8?B?QW9xbVpNTzhZd0lLdktjMGFwQlR2Q3N6YTNjVTJzQUhWajdKTE1sbjlJOVRH?=
 =?utf-8?B?MWpncnlwc2N2MGJHRzdDVndPSGRQcFVkK2QyUEpJUjZNSm9yZGdEajJlSkJj?=
 =?utf-8?B?aWpBbHJoUittaVhheHJuNkVMVEtML0s1VlYzVFptZldVRVdDRXVvaXlGR2I1?=
 =?utf-8?B?cDFhRW5NUkJSa1JJcWVCLzUxdm9jZEo4NnpxWmdCU1pRR3JIdzFNUFNoemxP?=
 =?utf-8?B?VFpibElTNFlvQ0lGQmovZERHbkZ6RGo0ekRDdWFvZjVtNzVhVGFUTk9rMWFt?=
 =?utf-8?B?YzFZdVJCcisxSTEvTXdnV3ZXeFBKMUxGWm1PQlR3aHR1b24rc2dmMUVhc3Vv?=
 =?utf-8?B?WXVTQXpPYnFqVW9YTDR2V2FzU2pHSmxNTzVFczJwY2R6L2hpTWR0ZTFrT2Fh?=
 =?utf-8?B?U0VUMXJoc2E1eWJIRDBmcGc2WkRORng4dnpYYzlLZHdxclZPaUVmTHhYYWZN?=
 =?utf-8?B?MnJyeUdFSmJnbG1zVi9OK2FnWnR3dHNNUklJL281ak4wdEVuQjhISzZ0Vi8x?=
 =?utf-8?B?QitsdXdoYnkzTVM1bnI4K2pUZDBHQ2dXZGRhalY2RjhhZUNLc05CVi9qRUhy?=
 =?utf-8?B?d0p6NWgxejJJUTJKblY1c1Jxb3hYZWx1dVFQZVdIeGtrVXdDM1FLV1JnVitp?=
 =?utf-8?B?YnY4UkpnWVVRbHpwQTk3ZGlQVW1qSUprWDVRVmNlL2NJT25wVlc0WU4xVnNy?=
 =?utf-8?B?ZjNOdnEzeHFuczMyTzZwMDRFQ3BsVGJZM1E1TGxnRXBsWStzNXdNb3pvanF6?=
 =?utf-8?B?c2pYMkdxMkErZHloN1oxN3QxZGxBd3dDdXVGQ2dKYmVYMVF2eFlHYXJtVFpM?=
 =?utf-8?B?eEZXLzB1bnJJNVQwTVY3SzNlOUV5YXd5T2hkazlBNkdud1lCWDlOL2l2cEFE?=
 =?utf-8?B?V1YvSzRwa21vSEpFR3NPMDd0UXRpK3hyWVRMRVJlT3BEQTE5WWsxWUFzU1Zu?=
 =?utf-8?B?OVF3OVhCNmVhT2N3Z2diT2R0V2RwcG5LdERSVVNndis3WDlFZXdmUTljTE5E?=
 =?utf-8?B?WVV4djhNczlPM1Q4TXhzaWFJZU0rS29tbHFuRnRZZyt1TjlQa1lxVmswYzZY?=
 =?utf-8?B?Vm5GMDRzTGxZT2dVdXliQjJDYzBjZ2dHckNSWTFJQmkvdXpOd2pRTERYVFpY?=
 =?utf-8?B?MDBwYzhJQjI0RnBlRUJXNFpWWnlKWGE2ZTVWS3N2eHlHeDQxRkxKaHJ5RGxK?=
 =?utf-8?B?bUw2KzdVTytIMkRoblZvNHJTZGNWOG14Ty9hbTkwZ1dpRjNEZHc5eEt2V21X?=
 =?utf-8?Q?iIgeITwSs2DxVWe0cRSKEXxh4LHTTY9G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzBnS2ZrakowYktqUndIU2tPZENraTZnMlc4N3NZSkdZSFdvVXRVbmZzNFg2?=
 =?utf-8?B?bmtSQWpoTURBdE14QkJUbUxFWXN3a1ErRGw2cCtBcTZzRXAwNndBTnovT1Qx?=
 =?utf-8?B?b3NEc25BZUtsU2RkUVFOR3lHMkpJMEJQSlBuUHFCaGNFRnVLeDhkeEtsZWlV?=
 =?utf-8?B?cXJDMUdqYStjaXpkZWFMMFNoWTZaZnF3MWxCYVV2bHlyTTdvWVBRelY5S0dG?=
 =?utf-8?B?Zisra1ZGdHM2bUtDbmloYmZrVEp4Uzg3NUVoU0xzTmg4dzFCRTN2VDJwTmV4?=
 =?utf-8?B?c1VIMXNpeWFxU1hTcnNDY1I3U3ROSXowVmlnM1FlMUJtd1o1T1VIZXNYRFZK?=
 =?utf-8?B?a3RoZEJrT3pUeUpQTlpCa2FnK3FOQkRRbFRnclN5dHFPTk5HRjJVNjJtaWhN?=
 =?utf-8?B?Y2RTWlJsZ3ZQWEpYSFdXVWRCdXc2WUlvcXdjZW5jeEZaOFY5MjlyTU5OYnJV?=
 =?utf-8?B?R1pOUDNUT2NETkJZNnp5L1hKK3BIbkFHV0kxcFo1bDdyOG1veHNvOUhiWWhp?=
 =?utf-8?B?MUNJUCs2aFdrbFM4d05oVjF3Vy9hNWNKUmJYeEhKZ1AzVXZIM3VNWmdGU2dt?=
 =?utf-8?B?ZFNyc2VPamFLR0E5emUxQ28rNWxmWCtLNFB6U0J0cnZ6WnJHekhEbzhTODMr?=
 =?utf-8?B?WlNKb3F1RjhJcmJaSGRycWJmd2trSmh4SldKREUxZHMxNStyMEFQd3krQnFJ?=
 =?utf-8?B?NnNnckhGb2UzdE0zVUV0UFQ4MHBjQTFLYnJFbEtLSHBtTmFhNHNyYWtHTDY4?=
 =?utf-8?B?N0lCRXZWT0tXRUpEOTdhQlFnWVVlSHI1Qk9vc2tzMFZ3NmZiMDVBdG00Nk5z?=
 =?utf-8?B?eWVGaUJWckpOTW94VkxTWm16cGJHUDVFb2FrMUd2cW01N1E0WDIvdXF3TVE0?=
 =?utf-8?B?VTZpeTREeldpZWtwWUc5cTl5eFRiWmE3OENWOFRGSkEzUlkwSEtlVDB2U0lN?=
 =?utf-8?B?bGZsTWxBRkE0ZTE5NHgxbjBNRUJIZW84UzVrUlNENkNGM0NkUUd2a2dEVUJP?=
 =?utf-8?B?ZjdWbzNZTDBnaWF6RFZjci9qQytESmhOWE5SV1hGK291WWMxQTNmWVRVTmdz?=
 =?utf-8?B?MHl0aysxODdSQnZoQ3NaMU5UZXViMk9aMlRZeDl3MllQamwvZk9EeThoUHhP?=
 =?utf-8?B?QUhkN2prc1cyYjF1L2xjZjI5d3QwTG9BVElKUWFDSzE2eDh0OTNSRlE3dk41?=
 =?utf-8?B?VmhQN0E3K01Ic243Z3NQRVZwbDltOFNXRkxpbXd1bXAxUkZLUzlkM0pTNEFQ?=
 =?utf-8?B?U0lyZ2dDaks0emx4SWxIS3F0K21MU1M4RDBYRHVjdkRzS3NVblZjUnV1b0Qw?=
 =?utf-8?B?R3dZTTlGKzB6b2l4YzI5eVBoc2FtQVBXSyt3d0dMRDVjODhPNExIclkwdHQx?=
 =?utf-8?B?MzAyb3BFNmw2T2p1SC9OeWgzaS91ZUhQRGFBQjg2SjJndzBqNHQyUWV1NTYx?=
 =?utf-8?B?cyt0clBzQUpXN1YrdVc4c292Q0dVRXF5K0Rxa3lvemZ0TTNISkR4ZldyWllW?=
 =?utf-8?B?cFdyU2V4NmhjUVpsa3owZkd0N3plVTlWd0N6enk0VWE5QWUwcEtBSzZkaVV5?=
 =?utf-8?B?YmR1R0tjYzdlWUhqZkkrM3RPQXhBNDVDaHV1S0hNOFBDcUZ3cnJZV0xCcG5U?=
 =?utf-8?B?bWpxNFQ3Ykp0RXhicDM2a0srdERsTDZJUksxa3pFUDFhSFV5RS8zYy9aK290?=
 =?utf-8?B?YzZiV1pHT3hKbkg5THBJRi9qNDRyOTdBTUdORWI0Yy9uZlhGbHRUbkswcWp5?=
 =?utf-8?B?aHkvbGRCZi9XNFpuQmhHK0ZzSm9mQkoyR0pzdFo3bHVYdVF0YUxySTVLMURT?=
 =?utf-8?B?dGpEd3hwSEo4NVR5bEFPQUNaVkk3azJKby8yZ3N2MkNmTmNTdWg0dmRhU0JK?=
 =?utf-8?B?dXE3elRMQnlzOTE2WGIzRFlEL08wamdjbTUvTUdJOGV0NmcyZitja3psY0Vz?=
 =?utf-8?B?b1ZqMkJNdEgxRXVudmFreWxGZ0hNWVE1RFVhS254c3RTVnNvbk1EZWt5dnpG?=
 =?utf-8?B?SmJJV3k0c1pkZ05xRUxVejZFZ01HeUFnR1dNNHhLV3Nvbm14eUE0Wk5YT3lt?=
 =?utf-8?B?NUpXdkFjNGFRTTN5N3FSUzZFUzBuSCtTcEtSUEg2YVpEenZublpBOVkvMWhm?=
 =?utf-8?Q?z2qJG0pz5aoghrCbDlHLeZ8q7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c669f49-8ee7-4c9a-0413-08dd529ff762
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 17:48:36.1093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jtSNRm4mVv9KW3d0bGAQ21+x+2p6jrinLwkd+tAws5OZRkF9BgOyHW2FijRRwHc94kpRYydfmRlNg0oRD3bew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7762

Add compatible strings "nxp,imx95-jpgdec" and "nxp,imx95-jpgenc", which
are backward compatible with "nxp,imx8qxp-jpgdec" and
"nxp,imx8qxp-jpegenc". i.MX95 just need one power domain which combine
wrap and all slots together. Reduce minItems of power-domains to 1 for
i.MX95 and keep the same restriction for others.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/media/nxp,imx8-jpeg.yaml   | 28 +++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
index 2be30c5fdc839..4cba42ba7cf72 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
@@ -22,10 +22,14 @@ properties:
             - nxp,imx8qxp-jpgdec
             - nxp,imx8qxp-jpgenc
       - items:
-          - const: nxp,imx8qm-jpgdec
+          - enum:
+              - nxp,imx8qm-jpgdec
+              - nxp,imx95-jpgdec
           - const: nxp,imx8qxp-jpgdec
       - items:
-          - const: nxp,imx8qm-jpgenc
+          - enum:
+              - nxp,imx8qm-jpgenc
+              - nxp,imx95-jpgenc
           - const: nxp,imx8qxp-jpgenc
 
   reg:
@@ -48,7 +52,7 @@ properties:
     description:
       List of phandle and PM domain specifier as documented in
       Documentation/devicetree/bindings/power/power_domain.txt
-    minItems: 2               # Wrapper and 1 slot
+    minItems: 1               # Wrapper and all slots
     maxItems: 5               # Wrapper and 4 slots
 
 required:
@@ -58,6 +62,24 @@ required:
   - interrupts
   - power-domains
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nxp,imx95-jpgenc
+              - nxp,imx95-jpgdec
+    then:
+      properties:
+        power-domains:
+          maxItems: 1
+    else:
+      properties:
+        power-domains:
+          minItems: 2        # Wrapper and 1 slot
+
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


