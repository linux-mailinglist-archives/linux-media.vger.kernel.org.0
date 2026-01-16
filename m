Return-Path: <linux-media+bounces-50910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBDFD33734
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 17:20:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2EFA30E1ABE
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 16:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C36C33B6E5;
	Fri, 16 Jan 2026 16:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="edNF9PlK"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011000.outbound.protection.outlook.com [52.101.65.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3468D39341A;
	Fri, 16 Jan 2026 16:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580339; cv=fail; b=sgtvDgs+c85R4U3jRekb+x0leb6r3BtVd4Q3Mr8SeqkCZWZ7Fr5x/pvs4WRibGnVJZzvWhbX0J44+Znkc+kSo+U6tNltL4oOiMCID8/oPFpCJaRfDHHKaFN7iTKzcqhhc7b+8kwFvrmXaLbBqr8O0jaYMwP57ktUQiz/0T2Oxpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580339; c=relaxed/simple;
	bh=821JGvweGkZLeCSbUFTn/43wIZ6Bq2oJDylytEPu72k=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oIJ5c913RdppsAxUNiURWclX/eVXKPK9qXTyynS+s/HUf5fPUB2zF8uzs4QayJqDfSwu6RQXy2H/B9/W7Rl6B/8FL3mNqMxFVwqXWeIuANTB4mLOlbiaDBnDmu+C23jLaRgaAMv/rOf2F5Syr/4LQ5qEoU+4dq2+Gzmw/Gd6PmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=edNF9PlK; arc=fail smtp.client-ip=52.101.65.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jvmbKVpBUafFUhIEs0L/v0eFbrzL9Cpq8KFN/GW7+ypbN8uP4/Na/Dp4xeUM5NxvlfeHfhi6WLATkWz/Ml8Gx5inmJZwkASxB5j1wLlzkfr0c0Jtk36OaSfo4pnr3HYjdrofNxVUMq/A5ftKTRiztHppsqFaaGBebdEJp1XSeGdOaX3SkROmrqlJReU1lERRBLn11tT7BxvNN77TFWn6Nm3zXo/pVrt5fb6ixxCKcK50QHQe5wDBUfoEYalCiAi35fasIo/XkM02Sr7kGsf4v2k0m0R87N58ahk161KjJPmLJX0b1DLalek8gyUO6KWPU5IQBsySFWvC8InPhwuWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ul57GZxBQ5hVeglnhBoJ4mLRK8WpOeZqpkhL4ytFbu8=;
 b=Jh7wdu1CTTS2QXmERBbwmImd+vIAqGYPxyqWClACZVC5slPCWbL0xqTC2Jht6x15g2Gtd9P/6iBlF7hTirFAJo0ztuLPDfvJ34csVmV8QgbX3TvtDGi0962yzXFF+leYK+wQ4eu5zAlg31uQ0XSZgnTvscjvvi15kUWd+0Sr9AupezLAC40ctoy/u8iq6HWFyxDZ8FqAxaAra5qe00Uad82ds/fyVPmzQy7ZZHv5AKjLvtBLdUypAGX/CRJ/kBIZtfOA8AW0IUt0I0Bl0fUbbzhx1HxjXsG5+awNdycVio5YCTjfpdndcUecKQwUmoSyjGwPTnuEgy23aZimtU1q3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ul57GZxBQ5hVeglnhBoJ4mLRK8WpOeZqpkhL4ytFbu8=;
 b=edNF9PlKU0UZ7gNnZAkcdYwdyl2GfItwigB+QAJktLhgoeVHEviQBZfwuoEGtCv84m/Jv55/iPfqhQ99jFCke6n56Eb2bF6pbDuopkBzZ1KkRBr76dGPahmHZNaRaWh8fN0BR3CC0N7JBId/Cw189xNNzSQWFGg176uvK/wnFDqBV2BywPgJIN9kOMl1vlbwo2qiitoeorn96F3G6g6NOe2Go7VogUSpKq4q4Xs+6NFoP+VYae46vJA+QiCKTcVfGOFthwSKkZ5dX6EhZz4vnTtEwclzQqCkwDsxUZIasy/fG3TpdVs1ouHrz0oJI6Zxe+XXXR2QIt+5bW3o1a6adg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB9733.eurprd04.prod.outlook.com (2603:10a6:150:119::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 16:18:39 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 16:18:39 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 16 Jan 2026 11:17:58 -0500
Subject: [PATCH RESEND v2 3/5] media: staging: media: imx6-mipi-csi2: use
 devm_clk_bulk_get_all() to fetch clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-stage-csi2-cleanup-v2-3-a56e9cb25196@nxp.com>
References: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
In-Reply-To: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
To: Steve Longerbeam <slongerbeam@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768580309; l=4713;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=821JGvweGkZLeCSbUFTn/43wIZ6Bq2oJDylytEPu72k=;
 b=svgmcfsSiH8P86qy/hf9551A25CFflsDHwYAcqjdkFRGEEFDIes3ifQPI83zDFTIHmPRJwJiY
 eqmcHXe+2HQAnm77TXq7MmEF+zASTdzTs97dznzfAJV5iUVJgkXyytF
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::9) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB9733:EE_
X-MS-Office365-Filtering-Correlation-Id: ab918c99-23a0-4850-db59-08de551ae867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWFpa0lMTXJOTStwZFBMTmJKdUtCMFFJVmV5UkdSQzNnQkdsUjJnQlkwSnlH?=
 =?utf-8?B?aXd4UjBOMHVLU3Z2bHpsNENYUzRRMUF3bm5HVit3MFpDOW83UVhKK1prb1FZ?=
 =?utf-8?B?MGs3c1k0SUlUZEtCVW9ZODhjWWZDdDM4QUZmc1FRcFg5VjUvWFdSSGFKT00x?=
 =?utf-8?B?YktWWUhzYkFoa1phcEQ1MmpuazdLd21ZQTJ6QVBSdDh0RFR4QTBjcllmWDho?=
 =?utf-8?B?WG1MVmhpanZvRlA3T1ZBTFBhRHIwSUozazZOWVZqeDJKeXpuSmFRS3FTYVQx?=
 =?utf-8?B?WDZmY1dGbmZ4VmFhQllPWldDWHA0T0M4a2Y4eVlhWitremsxdnpjc0VoWkNS?=
 =?utf-8?B?WDJTcTg0QWFUMkhnaklJUURGQTExU3hWVWRaWjJzazNLanYzWEhzbWpCRE9t?=
 =?utf-8?B?Uys4ZC9pUnpxU09nR2VEMUZTbkRhU1diTGdiVkQ4WENKSjRTcFdNeUhIYnVm?=
 =?utf-8?B?MjhRdXk2Sk9BcGdBL2JFQUlYeWRZcVJzdGJlZVVMbEMwWE1nWGF1ajFZQkpp?=
 =?utf-8?B?Uk9ETnJpclR4cTIxVGs0ZXJEbmY2VnJ4QzZSR0Eyd1Bnbk1Rc1RoR1JVMGNs?=
 =?utf-8?B?R3I0Ung4dEhUbG10dkkxOG9LS0FsdEsydmRpd29rS1JOb0RxMkVROFYxL1ha?=
 =?utf-8?B?bU90TkxTcWRoZ044ZXNVdHh6MnpRaG5XcHRkUldTc3QwQkpRaU41dVdvMnpv?=
 =?utf-8?B?YlREeXIvYzhlM2JMSjNKQm9XRENIMzEvZGhSTjh6NmNGMTkrSldWQndoL25Y?=
 =?utf-8?B?U0pJak5RTUpmRktaRG5kNU1OTXRoYXlQRThpMi8wVlMwYTZvV2pwR1VQRnFu?=
 =?utf-8?B?OE85R1c2Wm1oYjFmSzBqU0ZhUFhSZmtNRVdkVjdqRGQzajllS2t3L1N2SW4w?=
 =?utf-8?B?eHFaaU14UjlNbU9ScElEZXVQSUlFQ0c1bmdMamJPQXMyWmdVS1czajlsc0xi?=
 =?utf-8?B?T2ZWVUpiYjBaSnRJbDV0VzNFdGpiOVhxUXc3eE55MEc4cTlBRjBuRlR4WkNy?=
 =?utf-8?B?VStZTkw2L3JHb2V3bWp0dEdOblVJVlJ6UXlOV2QzQlBteUtvK1IySmlBMExS?=
 =?utf-8?B?YVVzTzNNencvRGZyek1CRFJjc29aT01jWitSNlpoKzBNcW5BMzBZMjl4U2VR?=
 =?utf-8?B?TXVtQlRXMWZ2THdhMjBFcmdaU0RNLzR5bmpBODJ1ZGg5SER1a2JaS0RaaVY4?=
 =?utf-8?B?WmxER2dpWjlod0w2T0YzWFpaVEJFUVR5WDlLVlVCeTBISVYzaWZQNzBTYTZr?=
 =?utf-8?B?d2dCT28yYTdEcFNjUU5oU0I1UWNjWE01aWV6YStaRTBlcEhiRjFESHR0c1gx?=
 =?utf-8?B?TVN2VTUrTXFCRmpuVkw4M3VvNmY3TmQvejR3ZFE3ZkxGN0M1YjI5NjlsOEJH?=
 =?utf-8?B?blRZWVJCZ3h6MGxDSVpGVjJ4TERYRlMrN0NkNkRCNnBPQXU5bm4vb0FrOFFS?=
 =?utf-8?B?TzA4cm9EbWVQQzRIWXo0LzBUUnJWUTAwR3pieDFEdlAraXhFV2l1U3hLb3N3?=
 =?utf-8?B?Zm5DNlhhQk56dUphWHY4RHVqK3NCR2toWkZibU4rL2Q0WkNva0lqeGtIS0JN?=
 =?utf-8?B?ZXRXZ2ZCMzdNZ3IwMUhGbU9lQ1BtcDFkdXhhTzIzZVIrMlkyVDlpcnZEOFRB?=
 =?utf-8?B?Nkp5YWwwS3BRQlF6V3VBWi9BWHhySnVueXkybTJ2OERKRGwzZjFuejRWdU1p?=
 =?utf-8?B?eFBWN3g2QXNJTVM4KzdMVmNrbFQvaFp4VTZaWWhkT0pkaEtMNXQyREF3THg2?=
 =?utf-8?B?ZmE1THE2UjU0ZG9MZ214SmpXR21HUEdQdmZTL0tsaThQRmx3M0VrRTYzN0N5?=
 =?utf-8?B?Q1c0eEJiTEJpcnYwR0hQWDRzL0tYQXN3U3ZwK3JJUEdjMnlUYzJMODlTbDYw?=
 =?utf-8?B?NGpKbjRlc0lqelJhTG9oU0xXeW5DYk4vTEIrRzJXN01oSVVmZTdyWFowcHZq?=
 =?utf-8?B?N0R4WUZLMEhnTnplTEVJOUhzd1RVNW9WR2xPeE9vSHlLcU1tc1lNVjBXMXJ4?=
 =?utf-8?B?MkRXR0t4QlNNeU16RUYyd3dkT2lZNmVxS3Fza3RGWkJYYW5nZ0tlQ21uM252?=
 =?utf-8?B?Vzk5Ymp1ZFZqZXBEM0RndC8weUE4dDNvZkIrbUxWTXpFQ3g3djZnS1hRYk13?=
 =?utf-8?B?U1FUZC9leDBicjlvdjRkZEJsYURCNzRWdmp6Q0pkRUl5L2JGdkJKSm5XaGJH?=
 =?utf-8?Q?poMP9Kfi5ktvy4Dm99Dln0M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0ZlczF3elhNWjVCZFVZRXJSRGZRRUNFYVlpZHk4YzFRM3pXWjBtUjE3d3ZV?=
 =?utf-8?B?L2pEOFcwc2NsZVZTV25HeWlXSUdFNWY2RXlJVk1KN0dkRDR4YkdKWTM5YWtM?=
 =?utf-8?B?U1c4YWtYbzVhS0RVMHo1QzFINU1EUTlsTVRXNnNab3lBN0RLOEMyZlBpYUdE?=
 =?utf-8?B?a0Eyb0RyVHpUQlhxaFJVMUg1UlpwczB2YXVkV2RVUVNHWUdUK1lqVTNhK0ZD?=
 =?utf-8?B?L2NNa3RQT2dvWFlCT1kzUWVxc2ZZbU1YckJFZTZlNWhUdmhFREtIaWpJRkdB?=
 =?utf-8?B?L2dUamJBNGdzZ0lWSjZsQ0pGOTdOWHJVS0tPQy9UYUtOOFZrTVQ3bnNzWEY0?=
 =?utf-8?B?K0taVVpLSGxSQjE5amxxajVsWUwzaGJWbmdGQTl0ekdUWEJKTDAycFEyQWVJ?=
 =?utf-8?B?L0FKeWFyUjR5bHE5cFNrSURCd0NVM0JqS212eVFiMlhXUC9KNlQ5ek1IZ0d0?=
 =?utf-8?B?bC83Y1Z5TlQxMlhPeUZiWklWOUUxb3prTHFubjdDbWNVQWdrUkJOR0JiNEdr?=
 =?utf-8?B?eDkvNERYWGY5TTRVVzgzRU80a01xK3laRjVHL1lEYkFCT2Z0K2FIcE5JUjFY?=
 =?utf-8?B?OG9mM2txZ21UbHR0dTlUYWJHZERUNnRMRWxZWXRBc3dhOFlGYmJ3WkQ5cWNs?=
 =?utf-8?B?a0MwSjNlVmVSa0xvdFBqZWsxa0pnUVh1ZDh2TlpoUGdHeTYwZlVWMWRqd3Ey?=
 =?utf-8?B?dzJaL2M5M09PNm5RV29nVkNSYlkxMlFyLzNDbGNwR0xRNkNLMXUvZ3VqSzhu?=
 =?utf-8?B?ZEJGMmM4UHNibFRUellNUVlmM0QzUlc4dW9VNUkwb3FsVnRKbEJKQ0dyeFZo?=
 =?utf-8?B?TTk3eWVUcnYyejZmdkpDUHVDSENMRTlYdHNWdlV6VmFQeElNcGIrQmhMTUt1?=
 =?utf-8?B?QUhiYUVaV2VrNHBCVDJWWkh5VzJrdHZ6OWN2b3VpeCsyd2FBaEc3Slp2cGwr?=
 =?utf-8?B?amc5Z000RGd1dW0rbFVVWHhsemhYZ2RrN2FUL0xIeWJuazVzV3dYLzR6Ylp5?=
 =?utf-8?B?VE9XMW5rNlZtZEtScEZ2SVNuWU9KQm5zamhsam1qT05wNURrd3BwWnZ4Z085?=
 =?utf-8?B?T2x4U0wvZXVxcktzMEpyZ2g2Yno5cWlDSWZyb3RQTkZDZFlBSmNxaXdlMFEv?=
 =?utf-8?B?cnRFSlE4VWtxeDlWaUoxaDhOZHFuY3NEdmZHQWY3MG9GMmZkMi92ZXk0VXFx?=
 =?utf-8?B?T2R6ZDYyQnJJRmg3ZmNoeVdPY2ZQcU9DZFZvOW4wSERrdVNLdUI1R0pndm40?=
 =?utf-8?B?QUZWcDlWOG9YaUpVRkxKRVIxSE5QN2tsemRxMWxRL1Rkdm9oVEI2dzRHT0VR?=
 =?utf-8?B?MTFMN2dmOU01dFJyKy80emwwMklLQXJxZEZGVHBYdUQyWmpRWTlMdHhGTlVM?=
 =?utf-8?B?SUM5bTJwOGk5SkNIMmo5cW4rTjVrckxad3N4K2JvaWpoSDdpZmUyc2RlQVZn?=
 =?utf-8?B?b2VrUGtwMENXTUdUaHQ1bTNkNG5vUy84Z0VNSWM1NjhFV3poMkk3QnRMbDVG?=
 =?utf-8?B?bndDSzJKaWFXRE5nWnJBUlFHRjR1Tk1yNjRjK29pa1grYmR4cXlZbGx1M09n?=
 =?utf-8?B?RERqSktCSk54dk5WbTViTWk4RmkxZTd3czA1cUR6dlQwYVB3cWdHSGJHUVp0?=
 =?utf-8?B?aGI5S0JrMFlEY2gvUytjeHNvTnJ0QmtJYUVjTS9sN2oxS1VtUngxcmVLcVBT?=
 =?utf-8?B?dlVaS21VenZTUXNnek14enNpdVZYNk1Ed2xxTkM5REJ6eUlnazl1YWdxT0JK?=
 =?utf-8?B?a3RzaEd6SmJsT2k4cDZ4TFk3Mk1KMXJQbmRTSW5Dem9qOGdMRWRHOGk4RVFT?=
 =?utf-8?B?ZFN2a0FteGh1VWJ3b3cwdTB2VEdYWmNRSCs5SXNwV2JrZ1FRaTZCOVFBbjhy?=
 =?utf-8?B?YnhPNGVVZFVYZTh4SE4wYVNQWWNUY2F5VXJLYndBOG5wM09zOXJoMmNQY3J3?=
 =?utf-8?B?TXpVRmdtZzFaNDBwWEYvY1hlV1NOUWY2UllONmFDSkxFUjcyek5KTDFBTHNR?=
 =?utf-8?B?bnJIZUlZWXNEMWZvelBXSGI3eVBZNGg3VzM4UzJqZXo5OC9pWGRkcUd1VXBp?=
 =?utf-8?B?dHB1MVF4YXpyaUhKd3pIbisyeFhWOXYzWm5lK3NySmJ5WWJlVWlES3lxMmto?=
 =?utf-8?B?UmZYRktiK1Fhekl1Y0RIbGtuUFU0emxORWNVaDFyclZMTWdvZFREdmlCcEw4?=
 =?utf-8?B?TElGUW96SUROR3NOdk9pYTJIS0hmc0FId21DNnZ6OXgwbGhHeG9NV3RYdGdF?=
 =?utf-8?B?Z2pBM3RyL0xnNDRaVkcxUFRsNEhzMjVFc0o3UUxWMkxaRWRMcjV0ZnV5UCsr?=
 =?utf-8?Q?pVXn+tG4e0FO4rCMl/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab918c99-23a0-4850-db59-08de551ae867
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:18:39.1161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9RbEOrp/SxYL7OkynJxmej/AKvXiDJ1XHgjAJu8HPW2b6wpm3SMPTgVZrLcYSojmEXTSwffTwv35ptnM0Na5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9733

Use devm_clk_bulk_get_all_enabled() helper to simplify clock handling.

Defer all clock prepare and enable to csi2_start(), which previous only
enable pix clock here.

Add clk_enable at log_status().

Do that safely because there are not register access before csi2_start().

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in v2
- add clk_bulk_prepare_enable() get at csi2_log_status()
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 57 +++++++++---------------------
 1 file changed, 16 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 4f740170d2bbf586ac0a58b5d25f8f8432e9e6a3..e1b4b7fb53131ce9515b9441d8fc420e85d3e993 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -39,9 +39,8 @@ struct csi2_dev {
 	struct v4l2_subdev sd;
 	struct v4l2_async_notifier notifier;
 	struct media_pad pad[CSI2_NUM_PADS];
-	struct clk *dphy_clk;
-	struct clk *pllref_clk;
-	struct clk *pix_clk; /* what is this? */
+	struct clk_bulk_data *clks;
+	int num_clks;
 	void __iomem *base;
 
 	struct v4l2_subdev *remote;
@@ -343,7 +342,7 @@ static int csi2_start(struct csi2_dev *csi2)
 	unsigned int lanes;
 	int ret;
 
-	ret = clk_prepare_enable(csi2->pix_clk);
+	ret = clk_bulk_prepare_enable(csi2->num_clks, csi2->clks);
 	if (ret)
 		return ret;
 
@@ -390,7 +389,7 @@ static int csi2_start(struct csi2_dev *csi2)
 err_assert_reset:
 	csi2_enable(csi2, false);
 err_disable_clk:
-	clk_disable_unprepare(csi2->pix_clk);
+	clk_bulk_disable_unprepare(csi2->num_clks, csi2->clks);
 	return ret;
 }
 
@@ -401,7 +400,7 @@ static void csi2_stop(struct csi2_dev *csi2)
 	v4l2_subdev_call(csi2->src_sd, video, post_streamoff);
 
 	csi2_enable(csi2, false);
-	clk_disable_unprepare(csi2->pix_clk);
+	clk_bulk_disable_unprepare(csi2->num_clks, csi2->clks);
 }
 
 /*
@@ -570,6 +569,11 @@ static int csi2_registered(struct v4l2_subdev *sd)
 static int csi2_log_status(struct v4l2_subdev *sd)
 {
 	struct csi2_dev *csi2 = sd_to_dev(sd);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(csi2->num_clks, csi2->clks);
+	if (ret)
+		return ret;
 
 	v4l2_info(sd, "-----MIPI CSI status-----\n");
 	v4l2_info(sd, "VERSION: 0x%x\n",
@@ -601,6 +605,8 @@ static int csi2_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "PHY_TST_CTRL1: 0x%x\n",
 		  readl(csi2->base + CSI2_PHY_TST_CTRL1));
 
+	clk_bulk_disable_unprepare(csi2->num_clks, csi2->clks);
+
 	return 0;
 }
 
@@ -749,24 +755,6 @@ static int csi2_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	csi2->pllref_clk = devm_clk_get(&pdev->dev, "ref");
-	if (IS_ERR(csi2->pllref_clk)) {
-		v4l2_err(&csi2->sd, "failed to get pll reference clock\n");
-		return PTR_ERR(csi2->pllref_clk);
-	}
-
-	csi2->dphy_clk = devm_clk_get(&pdev->dev, "dphy");
-	if (IS_ERR(csi2->dphy_clk)) {
-		v4l2_err(&csi2->sd, "failed to get dphy clock\n");
-		return PTR_ERR(csi2->dphy_clk);
-	}
-
-	csi2->pix_clk = devm_clk_get(&pdev->dev, "pix");
-	if (IS_ERR(csi2->pix_clk)) {
-		v4l2_err(&csi2->sd, "failed to get pixel clock\n");
-		return PTR_ERR(csi2->pix_clk);
-	}
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
 		v4l2_err(&csi2->sd, "failed to get platform resources\n");
@@ -781,20 +769,12 @@ static int csi2_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(csi2->pllref_clk);
-	if (ret) {
-		v4l2_err(&csi2->sd, "failed to enable pllref_clk\n");
-		return ret;
-	}
-
-	ret = clk_prepare_enable(csi2->dphy_clk);
-	if (ret) {
-		v4l2_err(&csi2->sd, "failed to enable dphy_clk\n");
-		goto pllref_off;
-	}
-
 	platform_set_drvdata(pdev, &csi2->sd);
 
+	csi2->num_clks = devm_clk_bulk_get_all(&pdev->dev, &csi2->clks);
+	if (csi2->num_clks < 0)
+		return dev_err_probe(&pdev->dev, csi2->num_clks, "Failed to get clocks\n");
+
 	ret = csi2_async_register(csi2);
 	if (ret)
 		goto clean_notifier;
@@ -804,9 +784,6 @@ static int csi2_probe(struct platform_device *pdev)
 clean_notifier:
 	v4l2_async_nf_unregister(&csi2->notifier);
 	v4l2_async_nf_cleanup(&csi2->notifier);
-	clk_disable_unprepare(csi2->dphy_clk);
-pllref_off:
-	clk_disable_unprepare(csi2->pllref_clk);
 	return ret;
 }
 
@@ -818,8 +795,6 @@ static void csi2_remove(struct platform_device *pdev)
 	v4l2_async_nf_unregister(&csi2->notifier);
 	v4l2_async_nf_cleanup(&csi2->notifier);
 	v4l2_async_unregister_subdev(sd);
-	clk_disable_unprepare(csi2->dphy_clk);
-	clk_disable_unprepare(csi2->pllref_clk);
 	media_entity_cleanup(&sd->entity);
 }
 

-- 
2.34.1


