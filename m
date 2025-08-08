Return-Path: <linux-media+bounces-39164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EACBB1F0DC
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 146ED7A4AFF
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3AC0292910;
	Fri,  8 Aug 2025 22:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RZXwukRy"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013034.outbound.protection.outlook.com [52.101.72.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F1B291C28;
	Fri,  8 Aug 2025 22:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692874; cv=fail; b=czENjLiUh+gdLwBgn+HPIIsmCXw+zVsE2s5Ejl1gUxR4Hyo3Oot9WxggpRoH1inKMYxWDlSGkduXzBOpv3KJcxjEen6inZ55/vJmVUBu3NezUc2uPD3Y94OxJqT7JevUsKh67W5EnceNEz7qxQl4VSPX4aG28Dmw7yAJjqCQ2d0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692874; c=relaxed/simple;
	bh=6LUn6oZ/mosOHFJlGgAl00/Ei9lNYV5ShTCSTzjgSh4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=S5CAmXM/MbFU9fSDWLViUV+7M1NdFWaMozETjkwegZg6C7wslHiEqnQIjLGXUWy/0QTQFf93lGOLZlFkgjc+xZFrW67RX07tpJTgSA4jY4N6tvPVRuo6sF5HNPBcejvLEN6WpArkMfgruPTZ6Gjsf39PT6T11RjWc+P+ipr95Hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RZXwukRy; arc=fail smtp.client-ip=52.101.72.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDeaZHktvBZQHgYdKyLrZY/7eTdzmOTplOFHLnJ/+eWIDJrcF2QdGs9pRjD8J1W+G/CeYpi9QCFFJhWibAUyIST/S1kECTDgsqC+xTmA2CbYkrPV+Wa+r5f1HKKnnlgWPBWJrFGEoRDODomO81ablvWkQNj/BlufkIdIuj54LiebrrrqgZipPawIW4Cd5usR6xUAqmmoXpa1qSLWmRHecZ2FLd1KTyOyB2PB6GXUkBPn/7iginu+QPMNeZh7dNkkF0UGZ7zyX2d2FHGmXxrlv7RA5xpwSqb8mCvTaYFmZ8VD/xfIYP78MItyATufAwRohM9Gwa0+XfJ6XxjNmMogvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzAu/6NJ7TH6Ykm1w+TnMJGoAtUuJGOhYYNOXfp09J0=;
 b=v2xKDTcCHgKHipLYickHG0IzSbErSvAlXFlYxfwtiuYeTlyeMjwYze9o093f2z+iu5wEVKLnS5tSMwkM1YdQBzTPUvlES2/NiFW52PUOAO9hUYCrHQ4TSzrK1N5xwxJRElqvNMiLo2oqmfL6EKIkn3wa4DUqYgwgpBJlD7x2RDhCxlOgfveMR4bK0T85uW1y3GrOwmiIn6mDpdOew1huTfee8leCpKn7McM5htfOaWyiZiMpMn6K1GOvopRf3Fy1h3wADQDBztUB8p9g+IGZgEiH+Me59RNPgB4l2HE3CSp9jABKCzW0jUG2K2NLMlu1uw0uBA91tePoAErC9Jhl3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzAu/6NJ7TH6Ykm1w+TnMJGoAtUuJGOhYYNOXfp09J0=;
 b=RZXwukRyix0yxoRh/hYDeH0nd2jGgqNxj2oEJjf/699AwrU/t/4XnlXFe+U00l/QJbBgyqdWhA9ZlTOUSW6IwZLFtKtZLtQdavmT4cjMGdfQiS4O9D40xEeef9YvUCrzJNwPkJnxHrgJQPvcwySQ6/nrNfKrFoBJ0eP0bH+5qwtPRcL7TYmxGO/NPf5+CbLAlHoLc+QL03tl7jm61cjMucacV5Sxu/Ube2wWobwEYtZLaMFCHEWN6pl/0YYnTne1QP+d3UByWdB4UsbQ3xVjd3lWxwIWZ+6nsdGBJ7gYOL5LhqzAGEZgtJhr3HAm+WfmebgMMPCSt8fKaeLyxRftTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10528.eurprd04.prod.outlook.com (2603:10a6:102:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:41:08 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:41:08 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:15 -0400
Subject: [PATCH v2 12/32] media: staging: media: imx6-mipi-csi2: move probe
 part to imx6-csi2.c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-12-4b29fa6919a7@nxp.com>
References: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
In-Reply-To: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=16267;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=6LUn6oZ/mosOHFJlGgAl00/Ei9lNYV5ShTCSTzjgSh4=;
 b=LrWZk0549h3MRg7AUm5OVsIG9BxM4V89e4ajRFECKJrFd6CGU3OQh09fOmHDST+QZa6lwzsTW
 jYPGpPfffSOD1H9NR2TKgexfk0dT77c12Fh7dWxQgnh93u9t6MMji4N
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:510:339::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10528:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c602b7-d8f3-420a-34d3-08ddd6ccaae8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cjgzZzZCdE9CbjZwaDQwNVZJVVZicEZzR2ZSTGgxeGxsR1NoL2hwSmsyZGtY?=
 =?utf-8?B?SzNEWnduWFhqd2QyaW1Ra1oycVAreGlyOWtEWXdlZW1OcS80TW1IT2RaY3RV?=
 =?utf-8?B?WTRocktRVEM4UTlkK3NRdXZaamt5SGtWRjdYQTdEdFM2ZDl3b2FORGxoZDRl?=
 =?utf-8?B?dE5RTTY2dnA4R0d1T1dVZGxEeUxvMm1ndTNqemZDZnpkVVA1cytEWml6V1Vs?=
 =?utf-8?B?OUFwL2J0RDJIT0tBRDFrZVZBa08zcm03b0J3RDNPSnF5NHI4NlFERmw1Vm1W?=
 =?utf-8?B?SEEzT3NxVTJrKzBMWW0yMHZpMUd0a1UzaS9jU1RSV2tSaWZ2dFM3YlExTGVC?=
 =?utf-8?B?Y1ZDTzZmdnVMM0dOeFF1SXFGS0ZPRWZaYUtXdVdmU2toVVBhM0txSmVnR2F6?=
 =?utf-8?B?WGd1MzJxcGwzaERCT2FDR3JpTkR1cXhPVmxjeEw4dm5HU3dnZ3dxaU40S0lL?=
 =?utf-8?B?L1I5RnM4bGhsTDVHTXBqakV4eUJ6amJFeDBrN0R4NTJRNGR3ZVFVcFhIMUpy?=
 =?utf-8?B?d04zREZhYUVpVUxCc2ljS3o2N09uRGtnYkVYWWR4THRwUUZiZlBDRUpvdVRh?=
 =?utf-8?B?ay84eW5FankwQU5yN3JzcVVVWE1KeUZYY1VrUmpyc1VPelUweUNrUHEwOXVF?=
 =?utf-8?B?cTV0WEY0NmdlNk1ZdDdkMDAvK2k5S04rVlFWRFZlQnVuSGFFZWxTUVExM0xp?=
 =?utf-8?B?QWhqeCtSdWVCeUhKTngzb0hPejBnU2V2QUZZbTJON2xTOG1GNG9vdlczYlgx?=
 =?utf-8?B?QlZOR3AwZytRck8xUzlydHQ3TUdJMTZpMTMwSm1qY3VZZzgxVW1FSEg3eWVU?=
 =?utf-8?B?b05nVHZ0dG9xSU12Nysydk16SXFMSDhLV0dwUXZDMzZ4Tm1LQVo2dVlaaWRU?=
 =?utf-8?B?UExvV2JkQ1JTRVhCT0gyZEk5VmxFMGZla1ZHcGhpVjJMOXppUzhVeEhtbHFa?=
 =?utf-8?B?b3gvZTlJOVg3eXE2M0cvWmlGeXRPVVBHTHhOTFdPajVRSEJ6VEtnVEp5UmRn?=
 =?utf-8?B?bmJ2TEJFNnJuck1YQUNYTXZGSVpObEdnYVJzZksvRzdsK2FtN0VoeUg3KzVF?=
 =?utf-8?B?Y1d5YXRiNHUxVE5tTWFubCtGcFJuejd5NjJqQmllbzRybDR0ZVhnSHpUVUx6?=
 =?utf-8?B?MFBNb2JMQzZNRTJDQWwrdDBoQzQvdkNkUmo4STE1SUhlR2g0QmVONHhtdFpn?=
 =?utf-8?B?aklLT2daUnBZVXJzdG9vRTlGM3NHOHRiMFZMNGNyMVdYMGdhN2J4TGFFWlVz?=
 =?utf-8?B?WjdqNnBJWXBaRzFaZ0NqV29JckIxVk1zdjZxRnNrWlpqMHVpOFFhS3FoY1BB?=
 =?utf-8?B?QnlIUGtjdUlxaTlEUmhxNkhBNk1YTVJQTFdFNklmbGRjY2kyVHBtcWFCb280?=
 =?utf-8?B?TllMcTNJN2FRck1scno1Z3pwSGllaVNYVWtObVpkVjNWMktLZnVIYThObGtY?=
 =?utf-8?B?Vkh3a0VkREJtcVgrcVpJNkMrMmdGM1RGNVlOVE5jQ3ZYSExVblVpVDVsYlR0?=
 =?utf-8?B?N1VOVWFsRS9mUC9xSW9WSnBZanUxbk9QeDVtaml6azZYQlF0L3loWTZEbGt2?=
 =?utf-8?B?aDl2aVhhTGxkeEFyT0IxN1kyZGYwSWZmNTBHUWxvZDhBRCtGcHhJZzlrSGtW?=
 =?utf-8?B?RFNrQ3krc3NaYTJhdHFZYmsxbWIvQlNyQ0pORzBrU3hWdGJmWDZiTFVzamU1?=
 =?utf-8?B?Y053TDhNeEVZOUFLNEZ2ai9Zc3VNZ0F4cWxKckc3b293bGJpSlVLS1RKcG1V?=
 =?utf-8?B?VlllejJiNnBpZm5FTTlIQjU3SFVTUThYUFZES3FiZVM1Uk9Eb3JpNmh0R3dn?=
 =?utf-8?B?aWhKblB4VHFnMStoWjFERkUrOEF2dWgwU29Zek5ndysrelV4SVhvVFNxOWxR?=
 =?utf-8?B?SWpjREZBWHN3Z2pUaE9wTVpyZ3VOMjVzQ2dOeThzK2Q5OUUzbXdmdlNxWUoy?=
 =?utf-8?B?OER6Z1BacGVvOFA1VG1rcllpc1hDemZRSS9pRXRXNmNGekdjQyt5YUcyVDVi?=
 =?utf-8?Q?YJbJoaYSpxCgi3b1DujMKUZyBS4JO8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dWJiZXRMc2E2WVpISWJWRzhqU3R4NzRZdmNvbFdtR1lQWFg5eVVoOENDZVRv?=
 =?utf-8?B?Y2c5cGNkUWxzbGh0VEc4NmxkRzZLdUZNeWMvRkZpRVR3T3JKUVZtOFhUNDFM?=
 =?utf-8?B?TjdJcEVQMmh1M2M0U1dGTVV1VEZFYTFDKzFTZ0kxOU1zYmZLZktVOXR5T3g3?=
 =?utf-8?B?Wm5CK1N2OWZObWlnMGlkeE1Pa3p6OXdwTVFncG95UXcrRlIzb2lKaXFKODNF?=
 =?utf-8?B?YUZLR05rQUNWWUxPZURpdnpHMHpHTUxnbFQ2azlDL3JEZGFBdWttMjg4ckpG?=
 =?utf-8?B?Uzk4SksxSFRnaXZiR01nMlVXdnlCTE0zdkd0bUkwZnphVDd2U0VNWGRsTjVo?=
 =?utf-8?B?Tjg5bEoyblBwcTdzeUNTb1FjUnBzWWtGdXpOdU5kT2hEQmZCUGpIR3IxeDNR?=
 =?utf-8?B?ZHI2VEFaeFpRNEFlVjQyNE8wOXJiWnFnWnE4MW9WTmlxd2lIVFJ6eVdEeFBh?=
 =?utf-8?B?Ymt4di9qejZtR1V0OUJMTzZkeDVZbHhIRi9Jc0NpRUZGRUJOUXQvNUM1U3pW?=
 =?utf-8?B?VFRhbTdEUHVrdXYrT2UvSG11blUzMVI5aDh3eDhndDFXc01wOXQyc3hyTkd6?=
 =?utf-8?B?aXdMZnRmU1V3SWsrZG1HMEdOMVpicUUySVlqSDN6dTdvSVA5Mk1jZ2hBRzNG?=
 =?utf-8?B?OGFTL2RKWGZ4RVhuWEF6NncyQ2lPUS81UGgvemREY0gyUVR1cG1JNGt5Um0y?=
 =?utf-8?B?NDFVYUozNzBjUGZYMkhnWkFjS29tREZJa0RySGxaK3I1cXNPeDV5ZTE1RUVz?=
 =?utf-8?B?SVg4SVRkWnczV0MzQ1czTnUyTzVyak51Y3hFRDdKcy9qaUpLRjJxTWJRNHMz?=
 =?utf-8?B?U0FMWENCUHVoTXpON1lyUkZwM3BITXVjb0dORTJJa1dmMjYzeVJyQ1Zqb2li?=
 =?utf-8?B?eU1xUjBwZ1FhV1lYbVFFTENpNnZVMzliL2lCQkc1RENQUm40dXAyRWJ4MzlL?=
 =?utf-8?B?a3pqRDEzYTBiMHFUSFgrL2VGbEpyeUtVTGh1N0NQcUNsaStWbzI4T0dDdjY0?=
 =?utf-8?B?M3liZDlETjhBVG9hYW5malRSNWxNandaZFdUVUNnS21kTjh0YXNOallUSVI1?=
 =?utf-8?B?dWtxT2tSTC9JcFZBa1I4cFhLZnZvT1ErOXVCVkZpbVVUcE82SENxRzZITzZs?=
 =?utf-8?B?bUdEZVFRNWhTZUpJREVvbmxiak1aaVJ4aitmbXVwTm9xU1R2NVZLOS9lVXl5?=
 =?utf-8?B?WEpZM0VRbUpLUFppYlBxZHk2SFRMaTM0MzFxdEQ3ZmRmTnRMWWJ5clo3aHND?=
 =?utf-8?B?NElyeUF2Y1pOMXRrWkpvSDlJekJrUzVEemN4VG5FTUlYS1VTNHIxaFlsWi9E?=
 =?utf-8?B?cnY2aStUNVR1Q2hkK2Zyd2xDT2RSSmxCT0ZtYU9QOU9aUUNNSDRKMWpRWHBW?=
 =?utf-8?B?ekZsQ1VScHBMS1FkcU9qNjN4VS9tMXM5WDVZZ3cwMDFPcUoyckJpUWlqWkhP?=
 =?utf-8?B?akhEUExhYU8wZ2VBalgwTDh1aXFiTkgrSS9YTGlONG5yOEJTcWdpY1l4NGxR?=
 =?utf-8?B?bEZhSjArLzEvRjZCY0h1RzNJcjZhWFdZNHVteWtLOW5pM0x5SnBpamlnbDdF?=
 =?utf-8?B?c2tUQm8rM2JGL0xzaXZETjJhTUNqMEVxMkN3dDgrY0dwMUI2SDhld2d5YmRz?=
 =?utf-8?B?THpKRGVMVjNBYmMxakY5eFJLaGtyNnE1ajkrU25JN2cyVytRaWpZK3hEOThM?=
 =?utf-8?B?SGRsaGRFWGdrNDBsMHN5UkhxRzF4V3REa2dtd2tPdUUyZC9EVEMwVUd2R21i?=
 =?utf-8?B?S3lhNG9sL2EvUk5TeUsybjAzTTB5dlNpYXNmL3dZV1lYcCt5YlRNeDYvbUtE?=
 =?utf-8?B?VVFHYmZKQnZyeGZzdlFSQVBTV1F1dE1zbGFTYkhjbG1rMW9UbzJRTG9TZEpl?=
 =?utf-8?B?R0hwdkhXaktGd1BkbTVDZGdlUit3NG8vWTRydDdNT2h0NHBId2c1ZmFNSkpm?=
 =?utf-8?B?VkhqcC9EYlBsc2pSbzRYNW5oU1NibXNkcU56Z1kwd3FVcjNiNW5BTHpNUTRh?=
 =?utf-8?B?WEtsQjR0cTEvU25IcVRJK2k5UnNFTUVBUnhheFFFc1Fva054NnlmTFJ0Tm8v?=
 =?utf-8?B?NlVzbDZxa1NYTUZMWXVvbEU3c1hqK01ScWpOSG5rd1FIQkVUcHJqdytscmND?=
 =?utf-8?Q?2jXYSvnOHVbJYGESD3ZfoIBe5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c602b7-d8f3-420a-34d3-08ddd6ccaae8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:41:08.7664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5D8sr/rmVW5vpxiLxwPEUBFIOVFM3ZMwAmoaCQdx0TjyWohL6AVkt+Sa8/PViko0GGWFMEpiAEVDD9+Dx/LjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10528

Prepare create common dw mipi csi2 library from imx6-mipi-csi2.c.

Move probe part to imx6-csi.c.

Rename struct csi2_dev to struct dw_mipi_csi2_dev and move it
include/media/dw-mipi-csi2.h.

Create two API dw_mipi_csi2_init() and dw_mipi_csi2_deinit().

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/Makefile         |   2 +-
 drivers/staging/media/imx/imx6-csi2.c      |  61 ++++++++++++++
 drivers/staging/media/imx/imx6-mipi-csi2.c | 130 ++++++++---------------------
 include/media/dw-mipi-csi2.h               |  62 ++++++++++++++
 4 files changed, 159 insertions(+), 96 deletions(-)

diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
index 330e0825f506bd98d6a8093a58d3b7d06a94a626..064a6c6c069aa440c72a483080cbedf89d370193 100644
--- a/drivers/staging/media/imx/Makefile
+++ b/drivers/staging/media/imx/Makefile
@@ -11,4 +11,4 @@ imx6-media-csi-objs := imx-media-csi.o imx-media-fim.o
 obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-common.o
 obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-media.o
 obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-media-csi.o
-obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-mipi-csi2.o
+obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-mipi-csi2.o imx6-csi2.o
diff --git a/drivers/staging/media/imx/imx6-csi2.c b/drivers/staging/media/imx/imx6-csi2.c
new file mode 100644
index 0000000000000000000000000000000000000000..72eff685fad99b3def46cf2866565191b7de9a8b
--- /dev/null
+++ b/drivers/staging/media/imx/imx6-csi2.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * MIPI CSI-2 Receiver Subdev for Freescale i.MX6 SOC.
+ *
+ * Copyright (c) 2012-2017 Mentor Graphics Inc.
+ */
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <media/dw-mipi-csi2.h>
+#include "imx-media.h"
+
+struct imx6_csi2 {
+	struct dw_mipi_csi2_dev dw;
+};
+
+static int csi2_probe(struct platform_device *pdev)
+{
+	struct imx6_csi2 *csi2;
+
+	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
+	if (!csi2)
+		return -ENOMEM;
+
+	return dw_mipi_csi2_init(pdev, &csi2->dw, NULL);
+}
+
+static void csi2_remove(struct platform_device *pdev)
+{
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dw_mipi_csi2_dev(sd);
+
+	dw_mipi_csi2_deinit(csi2);
+}
+
+static const struct of_device_id csi2_dt_ids[] = {
+	{ .compatible = "fsl,imx6-mipi-csi2"},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, csi2_dt_ids);
+
+static struct platform_driver csi2_driver = {
+	.driver = {
+		.name = "imx6-mipi-csi2",
+		.of_match_table = csi2_dt_ids,
+	},
+	.probe = csi2_probe,
+	.remove = csi2_remove,
+};
+
+module_platform_driver(csi2_driver);
+
+MODULE_DESCRIPTION("i.MX5/6 MIPI CSI-2 Receiver driver");
+MODULE_AUTHOR("Steve Longerbeam <steve_longerbeam@mentor.com>");
+MODULE_LICENSE("GPL");
+
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 3956c352a27ae6d962e74a4ce7733946574668ef..29b27a58d9bcaf882d7f434605ee7b424b2588bd 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -4,6 +4,7 @@
  *
  * Copyright (c) 2012-2017 Mentor Graphics Inc.
  */
+#include <linux/export.h>
 #include <linux/clk.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -12,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
+#include <media/dw-mipi-csi2.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -19,15 +21,6 @@
 #include <media/v4l2-subdev.h>
 #include "imx-media.h"
 
-/*
- * there must be 5 pads: 1 input pad from sensor, and
- * the 4 virtual channel output pads
- */
-#define CSI2_SINK_PAD		0
-#define CSI2_NUM_SINK_PADS	1
-#define CSI2_NUM_SRC_PADS	4
-#define CSI2_NUM_PADS		5
-
 /*
  * The default maximum bit-rate per lane in Mbps, if the
  * source subdev does not provide V4L2_CID_LINK_FREQ.
@@ -51,31 +44,6 @@ struct dw_csi2_regs {
 	u32	phy_tst_ctrl1;
 };
 
-struct csi2_dev {
-	struct device			*dev;
-	struct v4l2_subdev		sd;
-	struct v4l2_async_notifier	notifier;
-	struct media_pad		pad[CSI2_NUM_PADS];
-	void __iomem			*base;
-	const struct dw_csi2_regs	*regs;
-
-	struct clk_bulk_data		*clks;
-	int				num_clks;
-
-	struct v4l2_subdev		*remote;
-	unsigned int			remote_pad;
-	unsigned short			data_lanes;
-
-	/* lock to protect all members below */
-	struct mutex			lock;
-
-	struct v4l2_mbus_framefmt	format_mbus;
-
-	int				stream_count;
-	struct v4l2_subdev		*src_sd;
-	bool				sink_linked[CSI2_NUM_SRC_PADS];
-};
-
 #define DEVICE_NAME "imx6-mipi-csi2"
 
 /* Help check wrong access unexisted register at difference IP version */
@@ -100,7 +68,7 @@ static const struct dw_csi2_regs dw_csi2_v0 = {
 	.phy_tst_ctrl1 = DW_REG(0x34),
 };
 
-static int dw_csi2_reg_err(struct csi2_dev *csi2, const char *name)
+static int dw_csi2_reg_err(struct dw_mipi_csi2_dev *csi2, const char *name)
 {
 	dev_err_once(csi2->dev, "access to unexisted register: %s", name);
 	return 0;
@@ -134,14 +102,11 @@ dw_csi2_reg_err(csi2, #__name))
 #define CSI2IPU_GASKET		0xf00
 #define CSI2IPU_YUV422_YUYV	BIT(2)
 
-static inline struct csi2_dev *sd_to_dev(struct v4l2_subdev *sdev)
-{
-	return container_of(sdev, struct csi2_dev, sd);
-}
+#define sd_to_dev sd_to_dw_mipi_csi2_dev
 
-static inline struct csi2_dev *notifier_to_dev(struct v4l2_async_notifier *n)
+static inline struct dw_mipi_csi2_dev *notifier_to_dev(struct v4l2_async_notifier *n)
 {
-	return container_of(n, struct csi2_dev, notifier);
+	return container_of(n, struct dw_mipi_csi2_dev, notifier);
 }
 
 /*
@@ -172,7 +137,7 @@ static inline struct csi2_dev *notifier_to_dev(struct v4l2_async_notifier *n)
  * steps 5 and 7.
  */
 
-static void csi2_enable(struct csi2_dev *csi2, bool enable)
+static void csi2_enable(struct dw_mipi_csi2_dev *csi2, bool enable)
 {
 	if (enable) {
 		dw_writel(csi2, 0x1, phy_shutdownz);
@@ -185,12 +150,12 @@ static void csi2_enable(struct csi2_dev *csi2, bool enable)
 	}
 }
 
-static void csi2_set_lanes(struct csi2_dev *csi2, unsigned int lanes)
+static void csi2_set_lanes(struct dw_mipi_csi2_dev *csi2, unsigned int lanes)
 {
 	dw_writel(csi2, lanes - 1, n_lanes);
 }
 
-static void dw_mipi_csi2_phy_write(struct csi2_dev *csi2,
+static void dw_mipi_csi2_phy_write(struct dw_mipi_csi2_dev *csi2,
 				   u32 test_code, u32 test_data)
 {
 	/* Clear PHY test interface */
@@ -243,7 +208,7 @@ static int max_mbps_to_hsfreqrange_sel(u32 max_mbps)
 	return -EINVAL;
 }
 
-static int csi2_dphy_init(struct csi2_dev *csi2)
+static int csi2_dphy_init(struct dw_mipi_csi2_dev *csi2)
 {
 	struct v4l2_ctrl *ctrl;
 	u32 mbps_per_lane;
@@ -270,7 +235,7 @@ static int csi2_dphy_init(struct csi2_dev *csi2)
  * Waits for ultra-low-power state on D-PHY clock lane. This is currently
  * unused and may not be needed at all, but keep around just in case.
  */
-static int __maybe_unused csi2_dphy_wait_ulp(struct csi2_dev *csi2)
+static int __maybe_unused csi2_dphy_wait_ulp(struct dw_mipi_csi2_dev *csi2)
 {
 	u32 reg;
 	int ret;
@@ -294,7 +259,7 @@ static int __maybe_unused csi2_dphy_wait_ulp(struct csi2_dev *csi2)
 }
 
 /* Waits for low-power LP-11 state on data and clock lanes. */
-static void csi2_dphy_wait_stopstate(struct csi2_dev *csi2, unsigned int lanes)
+static void csi2_dphy_wait_stopstate(struct dw_mipi_csi2_dev *csi2, unsigned int lanes)
 {
 	u32 mask, reg;
 	int ret;
@@ -309,7 +274,7 @@ static void csi2_dphy_wait_stopstate(struct csi2_dev *csi2, unsigned int lanes)
 }
 
 /* Wait for active clock on the clock lane. */
-static int csi2_dphy_wait_clock_lane(struct csi2_dev *csi2)
+static int csi2_dphy_wait_clock_lane(struct dw_mipi_csi2_dev *csi2)
 {
 	u32 reg;
 	int ret;
@@ -326,7 +291,7 @@ static int csi2_dphy_wait_clock_lane(struct csi2_dev *csi2)
 }
 
 /* Setup the i.MX CSI2IPU Gasket */
-static void csi2ipu_gasket_init(struct csi2_dev *csi2)
+static void csi2ipu_gasket_init(struct dw_mipi_csi2_dev *csi2)
 {
 	u32 reg = 0;
 
@@ -342,7 +307,7 @@ static void csi2ipu_gasket_init(struct csi2_dev *csi2)
 	writel(reg, csi2->base + CSI2IPU_GASKET);
 }
 
-static int csi2_get_active_lanes(struct csi2_dev *csi2, unsigned int *lanes)
+static int csi2_get_active_lanes(struct dw_mipi_csi2_dev *csi2, unsigned int *lanes)
 {
 	struct v4l2_mbus_config mbus_config = { 0 };
 	int ret;
@@ -379,7 +344,7 @@ static int csi2_get_active_lanes(struct csi2_dev *csi2, unsigned int *lanes)
 	return 0;
 }
 
-static int csi2_start(struct csi2_dev *csi2)
+static int csi2_start(struct dw_mipi_csi2_dev *csi2)
 {
 	unsigned int lanes;
 	int ret;
@@ -435,7 +400,7 @@ static int csi2_start(struct csi2_dev *csi2)
 	return ret;
 }
 
-static void csi2_stop(struct csi2_dev *csi2)
+static void csi2_stop(struct dw_mipi_csi2_dev *csi2)
 {
 	/* stop upstream */
 	v4l2_subdev_call(csi2->src_sd, video, s_stream, 0);
@@ -451,7 +416,7 @@ static void csi2_stop(struct csi2_dev *csi2)
 
 static int csi2_s_stream(struct v4l2_subdev *sd, int enable)
 {
-	struct csi2_dev *csi2 = sd_to_dev(sd);
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
 	int i, ret = 0;
 
 	guard(mutex)(&csi2->lock);
@@ -493,7 +458,7 @@ static int csi2_link_setup(struct media_entity *entity,
 			   const struct media_pad *remote, u32 flags)
 {
 	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
-	struct csi2_dev *csi2 = sd_to_dev(sd);
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
 	struct v4l2_subdev *remote_sd;
 	int ret = 0;
 
@@ -528,7 +493,7 @@ static int csi2_link_setup(struct media_entity *entity,
 }
 
 static struct v4l2_mbus_framefmt *
-__csi2_get_fmt(struct csi2_dev *csi2, struct v4l2_subdev_state *sd_state,
+__csi2_get_fmt(struct dw_mipi_csi2_dev *csi2, struct v4l2_subdev_state *sd_state,
 	       unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
@@ -541,7 +506,7 @@ static int csi2_get_fmt(struct v4l2_subdev *sd,
 			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *sdformat)
 {
-	struct csi2_dev *csi2 = sd_to_dev(sd);
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
 	guard(mutex)(&csi2->lock);
@@ -557,7 +522,7 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *sdformat)
 {
-	struct csi2_dev *csi2 = sd_to_dev(sd);
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
 	if (sdformat->pad >= CSI2_NUM_PADS)
@@ -581,7 +546,7 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 
 static int csi2_registered(struct v4l2_subdev *sd)
 {
-	struct csi2_dev *csi2 = sd_to_dev(sd);
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
 
 	/* set a default mbus format  */
 	return imx_media_init_mbus_fmt(&csi2->format_mbus,
@@ -594,7 +559,7 @@ static int csi2_registered(struct v4l2_subdev *sd)
 
 static int csi2_log_status(struct v4l2_subdev *sd)
 {
-	struct csi2_dev *csi2 = sd_to_dev(sd);
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
 
 	v4l2_info(sd, "-----MIPI CSI status-----\n");
 	v4l2_info(sd, "VERSION: 0x%x\n", dw_readl(csi2, version));
@@ -649,7 +614,7 @@ static int csi2_notify_bound(struct v4l2_async_notifier *notifier,
 			     struct v4l2_subdev *sd,
 			     struct v4l2_async_connection *asd)
 {
-	struct csi2_dev *csi2 = notifier_to_dev(notifier);
+	struct dw_mipi_csi2_dev *csi2 = notifier_to_dev(notifier);
 	struct media_pad *sink = &csi2->sd.entity.pads[CSI2_SINK_PAD];
 	int pad;
 
@@ -672,7 +637,7 @@ static void csi2_notify_unbind(struct v4l2_async_notifier *notifier,
 			       struct v4l2_subdev *sd,
 			       struct v4l2_async_connection *asd)
 {
-	struct csi2_dev *csi2 = notifier_to_dev(notifier);
+	struct dw_mipi_csi2_dev *csi2 = notifier_to_dev(notifier);
 
 	csi2->remote = NULL;
 }
@@ -682,7 +647,7 @@ static const struct v4l2_async_notifier_operations csi2_notify_ops = {
 	.unbind = csi2_notify_unbind,
 };
 
-static int csi2_async_register(struct csi2_dev *csi2)
+static int csi2_async_register(struct dw_mipi_csi2_dev *csi2)
 {
 	struct v4l2_fwnode_endpoint vep = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
@@ -729,21 +694,17 @@ static int csi2_async_register(struct csi2_dev *csi2)
 
 static void csi2_nf_cleanup(void *data)
 {
-	struct csi2_dev *csi2 = data;
+	struct dw_mipi_csi2_dev *csi2 = data;
 
 	v4l2_async_nf_unregister(&csi2->notifier);
 	v4l2_async_nf_cleanup(&csi2->notifier);
 }
 
-static int csi2_probe(struct platform_device *pdev)
+int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi2,
+		      const struct dw_mipi_csi2_config *config)
 {
-	struct csi2_dev *csi2;
 	int i, ret;
 
-	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
-	if (!csi2)
-		return -ENOMEM;
-
 	csi2->dev = &pdev->dev;
 	csi2->regs = &dw_csi2_v0;
 	v4l2_subdev_init(&csi2->sd, &csi2_subdev_ops);
@@ -785,32 +746,11 @@ static int csi2_probe(struct platform_device *pdev)
 	return csi2_async_register(csi2);
 
 }
+EXPORT_SYMBOL_GPL(dw_mipi_csi2_init);
 
-static void csi2_remove(struct platform_device *pdev)
+void dw_mipi_csi2_deinit(struct dw_mipi_csi2_dev *csi2)
 {
-	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
-
-	v4l2_async_unregister_subdev(sd);
-	media_entity_cleanup(&sd->entity);
+	v4l2_async_unregister_subdev(&csi2->sd);
+	media_entity_cleanup(&csi2->sd.entity);
 }
-
-static const struct of_device_id csi2_dt_ids[] = {
-	{ .compatible = "fsl,imx6-mipi-csi2"},
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, csi2_dt_ids);
-
-static struct platform_driver csi2_driver = {
-	.driver = {
-		.name = DEVICE_NAME,
-		.of_match_table = csi2_dt_ids,
-	},
-	.probe = csi2_probe,
-	.remove = csi2_remove,
-};
-
-module_platform_driver(csi2_driver);
-
-MODULE_DESCRIPTION("i.MX5/6 MIPI CSI-2 Receiver driver");
-MODULE_AUTHOR("Steve Longerbeam <steve_longerbeam@mentor.com>");
-MODULE_LICENSE("GPL");
+EXPORT_SYMBOL_GPL(dw_mipi_csi2_deinit);
diff --git a/include/media/dw-mipi-csi2.h b/include/media/dw-mipi-csi2.h
new file mode 100644
index 0000000000000000000000000000000000000000..4e656f09c81db9dc9f232ed061f70803a5478c85
--- /dev/null
+++ b/include/media/dw-mipi-csi2.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DW_MIPI_CSI2_COMMON_
+#define __DW_MIPI_CSI2_COMMON_
+
+#include <media/v4l2-common.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+struct dw_mipi_csi2_config {
+};
+
+/*
+ * there must be 5 pads: 1 input pad from sensor, and
+ * the 4 virtual channel output pads
+ */
+#define CSI2_SINK_PAD		0
+#define CSI2_NUM_SINK_PADS	1
+#define CSI2_NUM_SRC_PADS	4
+#define CSI2_NUM_PADS		5
+
+struct dw_mipi_csi2_dev {
+	struct device			*dev;
+	struct v4l2_subdev		sd;
+	struct v4l2_async_notifier	notifier;
+	struct media_pad		pad[CSI2_NUM_PADS];
+	void __iomem			*base;
+	const struct dw_csi2_regs	*regs;
+
+	struct clk_bulk_data		*clks;
+	int				num_clks;
+
+	struct v4l2_subdev		*remote;
+	unsigned int			remote_pad;
+	unsigned short			data_lanes;
+
+	/* lock to protect all members below */
+	struct mutex			lock;
+
+	struct v4l2_mbus_framefmt	format_mbus;
+
+	int				stream_count;
+	struct v4l2_subdev		*src_sd;
+	bool				sink_linked[CSI2_NUM_SRC_PADS];
+};
+
+static inline struct dw_mipi_csi2_dev *
+sd_to_dw_mipi_csi2_dev(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct dw_mipi_csi2_dev, sd);
+}
+
+int dw_mipi_csi2_init(struct platform_device *pdev,
+		      struct dw_mipi_csi2_dev *csi2,
+		      const struct dw_mipi_csi2_config *config);
+
+void dw_mipi_csi2_deinit(struct dw_mipi_csi2_dev *csi2);
+
+#endif
+

-- 
2.34.1


