Return-Path: <linux-media+bounces-41146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 045ABB37F54
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 11:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BADC3460EA7
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 09:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49BB307493;
	Wed, 27 Aug 2025 09:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UUKzTrMb"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A491C860B;
	Wed, 27 Aug 2025 09:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756288469; cv=fail; b=ENGNESy42uOvZAixNbcqoKCxOMBTXeUlCbpgmQMYCEnrR/jOWVWdIb3O5Jh+gBZWWssNUhi8Gm8GVvftt3Yjmy1lQ/29X/2bjnkkKak+/8Zef8lwBLzYJjpHcL72iKOuOzfeIqZUKxcO8lH+toRGfBRO0frjyyYVFslZyqejcHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756288469; c=relaxed/simple;
	bh=WZC0nVilH0ZK5TtByPwGIlUeDhGnv4y9QPgXEBcvisk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=i8eqh4gOsiaxUb/H5XtLsKTEsYgIlj8cxGyLp2J9tGVLHwboA4PLkRakzbhhTE+zfRt1hBSSLr2GOpA9h1arGr/BerOdb2UgM9ZBh6cFcJ3EiHQj0LLxBqX2wZaKkCor4nrgE9OVhwrJzL8JJWFWOJwXZxhAYW1FdDDuU8oxVIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UUKzTrMb; arc=fail smtp.client-ip=52.101.69.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdq5tj+qeEpEj0vIKiVix/g9gYRq7VmCkOmiVZAFc3ooZhT3iy0RWl5pcJ5yrgal2bz4z7rrEM/mVeIpVPvJ1Aa+Ykxm9C0KhKx+ZQoCRqFIp2kkcwB9nVL5a9HpPLTlWwhZ5lEoPrAZlMV3wD2Jex3Yti6Ybr96oPVt8qato+6cEjZjfwN638QUHb9e8jkId67Utlu18/GV9s91iPxMcuXvRT8rVUIrL0sMrcyAov1+esZhdZ9sDSUBHqz420R49vFF0UQzPUgeXWzvE2afXkhZGnD0eGUX/31/yqHMRdxMszDg/Z11oWc+aMoKIE7CSBQYJE3zt9MCjY2xCNPrxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mjvTeBkV0OCGHI2wnILdFZRc33ylNF9x/uhfrTtirI=;
 b=TRKN6ue+v2DM3VTcactxMYyBC0k6SB+svm960JBpbi5yAn6dP0L6Zg5h2e5OTyyW9ZtiD0pdtOGEwtNFJlWgGmR8M0D1qxqMvdqgk2BSiipwojI5czOVacPSk3+y1rxfWLfs0SXtnNjMgiTdah2u/uTyNiq34RzKnO+CBmyBd6HIwq6aodOXR72nmClCY6aBjuMZWkcAlhfDjDX9sFELAtseqInzhsrZ0iEJU2JtETXtrIVN/7H0AjGG7KaV2mjjiP/LGapAKo0iSQNOU0m1SsXsDEGiC0qTOGhCxEYROWuro+q4/rf1A6DMfo+xAr0c9pIchgpwoTfOk4bZXhMMCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mjvTeBkV0OCGHI2wnILdFZRc33ylNF9x/uhfrTtirI=;
 b=UUKzTrMbGE+lI2McDuMkIOwbY2AgLP+BBkz0f+IL41QVhDSKRU4aWz9bix3KuimIW6220juu0zmcbq8TJRmmfrCZFijfhQ2REUe3R0HZBpmIjf6NIuo3T5SrFKy9g0cJq8LVrySUHOlI7+2BZExA172w2+ZVAKlMuAP+eqhMMKbiOaPpDNyNQ9yQNhEDkzHe1f6yzkMjaGjT8Xz7DeVax/bb1j/prC2TvpLKp93uL6zY14fUDcQrKW4Ilx78cTXmlzvizKlaQggN1zIr/Ko3EZm2oUgGU1cXvSVvbN+0Px1Ih8lGz052J61aB3H1We6NnyZkzup/gfWF2gnnQfnr4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU2PR04MB8839.eurprd04.prod.outlook.com (2603:10a6:10:2e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.10; Wed, 27 Aug
 2025 09:54:23 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9073.009; Wed, 27 Aug 2025
 09:54:23 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Wed, 27 Aug 2025 17:53:48 +0800
Subject: [PATCH 1/5] media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI
 compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-isi_imx93-v1-1-83e6b4b50c4d@nxp.com>
References: <20250827-isi_imx93-v1-0-83e6b4b50c4d@nxp.com>
In-Reply-To: <20250827-isi_imx93-v1-0-83e6b4b50c4d@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756288458; l=1631;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=TBS8upmza1QMLsN7CwQq+8wmL/KuQI0vacfG78Xnhqo=;
 b=Oy4J9DJ5N/JcCoOqTuiA2BhrFLN2YyZiGqs0f8BHYjzy1sw319qiLo2xm3+Gm/Cgm10uCk7Nc
 CMvbRk5B1+PD3y8vsq21SHnbLy2znIJRceoBI2lp7uESxAt9H/JEdet
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU2PR04MB8839:EE_
X-MS-Office365-Filtering-Correlation-Id: 296c3c35-809a-43ff-cc12-08dde54fb3a6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|7416014|366016|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?QTBtdmZIUUVxc0dXSVo3akZQMCswZ2hORnU4Q29BOHRNY3YzN2gzZkhXaUx4?=
 =?utf-8?B?VlVabFBpc3AwN2x6N3MvaFVwbmgxRUhBU21pWm9KR0x0ajIrcWQxRlJ3aXJh?=
 =?utf-8?B?dDZmdWoyVDV1anVhOERrbHpYTE9zZjJqdGo4S2RseW43a2FDUVBOQ2pWZE1K?=
 =?utf-8?B?Yy9SODdPZ2tQaWhQY1orTG9tQVNnWmxKcVdaUHczYVdsWW4rNGpZT0NQZkkz?=
 =?utf-8?B?elVqQmsrcHdxRjNSbi9xdCs5ZUNTR0YwdmdLNTdTaUpoeXkvNjRKQjVKREZJ?=
 =?utf-8?B?WHBpdlo5b0FvYWdFbWFOK1U3Q2dVWEhUY0hTa3lXUDNNVjVUU1gvYWFmV0po?=
 =?utf-8?B?R1pyOWZWUTY5blEvMENUWFBPN21NdnZLQnVHNFZhMVZ3ejk4NUlZMTNYcVhx?=
 =?utf-8?B?UlBSSitHR2Z6bUlQK2hKNjJPb25tcGRXclNQdFNGVFhUaEl3a01hcWN3cFk2?=
 =?utf-8?B?TEhJWG83b0pPYkg2akV5S28vSmYwQnRjeEtQbFdCZ1BtcVAwV1A5anQwQitn?=
 =?utf-8?B?SURWWGZLU1VqbVB3Q3laUHZ0NmVKc2dQQzRlUVlVcEhQS1hMZ2hKdDhXc2Nl?=
 =?utf-8?B?T3IyaU95Y1B1cmZCREQ1TjZVU2JZNkxaN1dlSWVKYkVpYUZUOFU2NExKMm9O?=
 =?utf-8?B?ci9IZWVTOU1mY2VYenFVK2RPR3BFTmNCU0ljWkpteGx3ZGJBTG1UVDFnU0hz?=
 =?utf-8?B?ckUyODlrMjNlY0NUVyttOUdFMi9xQUgydVFtYWtxUytSVGZUTW50dk8vS0dM?=
 =?utf-8?B?WjBBanQwc2l5RnNKRWFRdHpkQXdYWTlVbW1Fb1M2YmNGV0ZyVkpTMHl2MjVK?=
 =?utf-8?B?SGtFblJKRkpCMUlqSFVXR0Jpbzc2NWowcTlTN1M4ZDB5b21WQzQ4VlIzVGF6?=
 =?utf-8?B?clJwNkRvUVdwM1JSdy82TXZMTTg0VWdSaEhDNWIvZ2dNbXFOajJhaTlqd3NQ?=
 =?utf-8?B?TTBaOVJIMXVFeEdjS0twbHUySlpwbjFBTTBocWEyZ3QvSkdiYU1EcUh4Mk9C?=
 =?utf-8?B?RmFqaUoyVEdzdFJpNGwyRHVnajg3L0xwbzE2ZktKdjQwQk9BYm1HdTlIS2tU?=
 =?utf-8?B?TDJVdlBZaWdHRDZVaWlZTVgvK1RhS05sclFYSjhKeGY1Wm5RWkg3aG1QcXpu?=
 =?utf-8?B?LzdwaGZRbnBGOWQ1aHJQa1o1eW5MaS85cHFrMlBqOHdqUWxJN3YyM0hPQ1Fq?=
 =?utf-8?B?dUVyWDFMenNmcjVEbEFwemUyelV1OFRqUFJISDdMQWtTUGtMeGtpUnhXaTBC?=
 =?utf-8?B?dGZZRjVTTWdJZ2o2NEZWd05jMGVVN2lSQWlXR1kreG9pVk9YQmhEQ2c3OERM?=
 =?utf-8?B?VzZlYmRhd2lOVFJvNGQ3aXBuYnJZYVVCMmtodWFUVWZvN1BSZ0VpODFiY1ZC?=
 =?utf-8?B?c1JDSXEwYzFNcGFUQ2loL0M3THJrU2l0T2EvUzRyWUNEVU0yTkV2MytldzJv?=
 =?utf-8?B?WGRrWnJjWWxLOUNtNlc1dFZRbGN1NWxnMmlJWTBXV25NTEdoeHJWQXZlcjl6?=
 =?utf-8?B?eEczeFpYeXZrdkY1VnJ4UElxSjdSblhGM051ZnY5L0N6RjBWdThsSSt5Tk1h?=
 =?utf-8?B?cTkxZlJSMW1ESDVUek10Mm5nYUJ3Y1ptU1d0ZmM2cUZDQWhwM0NRaVdiMGpS?=
 =?utf-8?B?T0plWHdIcjBZM0JzN0Vsc1lGdjRMRlRYTk9KaWZvQ2pRSjlYTXRYU3k4T2h0?=
 =?utf-8?B?TXVGM1JyL0NxQnRiVlhoWmZtVUk5UytZSFVRcFhSMUVjSjlLYkl5VWFDQW50?=
 =?utf-8?B?bGtmODlvcWdFMXpsdTZQSGhPdlJGK2hOZStSaWlrbjVBT2tMcldCU1VrZzB3?=
 =?utf-8?B?VURGaFUwSU9XYzJLVFk0b0R6V0U5aHMwM2RBVlRzVkxWNHdjREJEVEl0cVlk?=
 =?utf-8?B?Z3JrdStNVUxWNnY4STB2WmkvZUZTdTdER2VHeDVwV0U0SUpMWVRKampKTnpv?=
 =?utf-8?B?d0V6dUcrL1dVOXFja0FJWGxMS3VoVlZZc004aSs4TFFFd2xVb2F4UFllMGhk?=
 =?utf-8?Q?+TmeAfSK051DbH80SU1pEYRvwPHUzU=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bFJ6TmV6TnVUcGY3S3NvZVVpaVNNZ0hTdWRKbUhMWDFaWE11TFpMd0pkOEhR?=
 =?utf-8?B?U20vVGRkSGxROFkrWkFNQUxQdk80KzVYQWdWRFZwZ21kZklnU2FVL08ydmcz?=
 =?utf-8?B?Um9lNzN6RGhsY0hrTWVTSEV0QWl1amhFbEtjQ1BodGkxcGhWNGFTblNONGF4?=
 =?utf-8?B?T0NMSTFiUmtFdVM0dGttUzBKWHRoOXoyTUlMSTAwOU8weTUzSmFyRTV6S25o?=
 =?utf-8?B?MDNSNWVUTnVTdVdTQWRHb3lIdjFsanRYNk5qOS9Yb3dCTzZCSFg5TDlsLzg2?=
 =?utf-8?B?dnprS0dKUkxYaTF6UDQxcUY2R3VpVjhkRjlsWHpnQTQwVkJQK3V0UGh5bUlH?=
 =?utf-8?B?bWdGdXd4WHluRVVwOE1RV3NXK3RaSWppaGJmSzVzd0RkeStQRlliM1V4OEsz?=
 =?utf-8?B?d0JMSGJETHoyQkNrOTltRElkOHh0czRNS2M1K0tKLy9UUEt1RDVGdThYWXI3?=
 =?utf-8?B?Zmx5VjlxK3RNSXlDMytaQ2tJZDFXTEFxdDBrLy9lbUI1QlVISUZSR25FZUlp?=
 =?utf-8?B?ZWZaaXVUNE0zZ3M5elBBbnMrK0E3Y1NjTDJteTAvb2ttSGN2RnBJTDNiUmxM?=
 =?utf-8?B?NjgrOFg4UmN6Z3lsT2Z0VktaeU5EM2FTR1Rwd28zc0c4WUl6cGk4RzhCa2Y1?=
 =?utf-8?B?R2thNFV0T3hWdGdEU05UUnhHWmdQK3hBMDV1T1V2SndZWkZKa1dDb2IxOVQ3?=
 =?utf-8?B?ZHJ2Z09wTTBaQmwxaXFTenpqeXFFRlRzeGpIeUlBTzUwMkZld3BHcmREd1F3?=
 =?utf-8?B?bUFsVHc1OFpqL0hCdlNPbzI2OXNPbTU4WEZFUFIxay9xQVY1UFd5anhGa25Z?=
 =?utf-8?B?RFUrWWU4dnJsNG1FZ1JXREhvK2FtVFhCLzFvT1JYSEREeHBnWXdPU05kNjZx?=
 =?utf-8?B?REh4eGZoQ1Bka1N1TXRzSzBSbXFNQ0t0WFFqTGhrSG5DYUFiODFsNk5Vc1lN?=
 =?utf-8?B?dkNLRjlpVjdIaUZqb1ZEUXhoeGZSWmprN0RqVm1BL3N0ZGpjd0hrYjhYZlRY?=
 =?utf-8?B?b1dyL0pJN0hhMG0wdWZtUlYydGYxeURGRFZBVG14L1dhdGszVW5Kb2swZ0Zi?=
 =?utf-8?B?cmxVSnNuQzNmUFUvV3RWbUMzS1NNYndnenJTNVVaSFEvNDFJMXpyMTBmcWxW?=
 =?utf-8?B?bm1Nd0xXbWdTN2FuZWhEQjZod2VULytzUGtwZEJpODFiUG1lNjJKbmsvdXBT?=
 =?utf-8?B?em9vc2UxaE1jYWRJNzlRcGVTdEFheE8vQjNFdmhsTkkycSt5NFlUOGpJa2g3?=
 =?utf-8?B?OXJGQVZYMFJYV201OGNuSkJCUEpnc1pRQ3lZanZMNnJyS2lGaVlQbjl3b3lC?=
 =?utf-8?B?THhTZmJtcENOMTE5dnBMNHNLM0xJSkRudGQ5QU51TlBvTzRoQ3lmTCtMS3RV?=
 =?utf-8?B?V1NtYnhMNkt4c3VsOXRySkxzWWtVdG8wWnR5cUNuZWNIT3RMVzZDUWJXQ3Vr?=
 =?utf-8?B?R29hQUdWTUF3MXorQUhWZFFqazl6WVg5MTJCN0dTSDNKbmVZMmpLT2lPU0NY?=
 =?utf-8?B?UEJvS3FuVGFIaGhaK1BzTEcxS3JjcFNvQ0MxVjROczQ0S21td2k2N0MzcG9z?=
 =?utf-8?B?VHVvdXlKZE5OSmtvNVhLa2lxb2duZUs4TEtTY1JkNWR6ZjNCZEgyNHZ0WUd1?=
 =?utf-8?B?bXMwNkFnS0xRTDdiT0psaVROSDYrMTZJbitGSjI2NnowY21TK3kzZEI2NVhV?=
 =?utf-8?B?Q1QxbDFVWTY5UXJaYW9rM3NjdExlMzNkeW5kT3ZMd1VzODdRN0lrU2ROS1dS?=
 =?utf-8?B?QmRSd2E4bzlSRTlEMkQxck9aeVc4TVIzdTRmemxVcXd3SStjWE5OazJ0NFJC?=
 =?utf-8?B?RnN2L2RBVkxwTXQxcXIwQ2VYcm9LWnhUaEtTV2dIN1JxaEEra2JOMzUxcnor?=
 =?utf-8?B?ajBtOHVUVlpJME93cjhpeVI0Yk1oT2ZOS2dPbDJiT2l5cm9JaG5qY2VxdCtE?=
 =?utf-8?B?eXJqSFE5ME9LQ29mWkFnYTIxUEJTcGdZM1pRODFuTmVXcTJiSHFIbnlubERC?=
 =?utf-8?B?MFk3a1MyVllXeUhONmJSWGVTTng3L1VKeDg2RUlHbUFVTW5GUCswakpqckQ5?=
 =?utf-8?B?QXl0cU1uN1BBK3BCNFJiRU1oUzJJcWx0aXZTUkdiY1VnVWJsQ3lUSmNka3d2?=
 =?utf-8?Q?ddaDNBJNFkseCGBLSjX9/n+vq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 296c3c35-809a-43ff-cc12-08dde54fb3a6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 09:54:23.8044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XaD5sMt/S55e6j0jFNN3NXnENxKe8KSe/QLWHZbLYFkgif6Oc3uLZtCh9+8m8q4slWWaSRotNKGgJiq1hxnCPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8839

From: Alice Yuan <alice.yuan@nxp.com>

The ISI module on i.MX91 is reused from i.MX93 and implements one channel
and one camera input which only can be connected to parallel camera input.
So needn't to select camera source like i.MX93 in gasket ops.

Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
index f43b91984f0152fbbcf80db3b3bbad7e8ad6c11e..001a0d9b71e096db3f543adaad40b84af378d707 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
@@ -22,6 +22,7 @@ properties:
       - fsl,imx8mn-isi
       - fsl,imx8mp-isi
       - fsl,imx8ulp-isi
+      - fsl,imx91-isi
       - fsl,imx93-isi
 
   reg:
@@ -66,7 +67,6 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - fsl,blk-ctrl
   - ports
 
 allOf:
@@ -77,6 +77,7 @@ allOf:
             enum:
               - fsl,imx8mn-isi
               - fsl,imx8ulp-isi
+              - fsl,imx91-isi
               - fsl,imx93-isi
     then:
       properties:
@@ -109,6 +110,16 @@ allOf:
             - port@0
             - port@1
 
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: fsl,imx91-isi
+    then:
+      required:
+        - fsl,blk-ctrl
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


