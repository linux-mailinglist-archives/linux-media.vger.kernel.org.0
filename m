Return-Path: <linux-media+bounces-40662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF19B305BB
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A2D01CE271C
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFFE34DCFB;
	Thu, 21 Aug 2025 20:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VRXu5vch"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011031.outbound.protection.outlook.com [52.101.65.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE22E34DCD6;
	Thu, 21 Aug 2025 20:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807404; cv=fail; b=IernrpEJTbtHD1WXr6lVSZFqzxtoloKiEWJsqgkgCS9ZYHgb6xTacdJM/Fombwzy/b7hzuMv2pzhr/+AXYeJt2fK78qPbhh5oPyOGNRVxrFkc0bxBTt9ZujYH5KimfyXj7nJv7JrpX096jLrJs673dQZXs2PW8lQ9hXDdCiGhfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807404; c=relaxed/simple;
	bh=JykNP3Wr8V27V/V5mRXR63Vo77tMC6HLDGjlTMTwCO0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=T9YpjNZAPI+YwqC4r5Ia3+jlsm+QD0wx79JfYtTkneP5Gr4UpgfMhet4J89GOu70F5xJfqH2VL8/qdQZYgYlPCqydxvOWN/rmNJwuwYKwcuYCcByMFXLmJg3gzTyIBuKXKYkQYaFsNLi3JyTJDhUFmFbM5ikepacVnL4SDCcGPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VRXu5vch; arc=fail smtp.client-ip=52.101.65.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSwOn+TNCpf5MyFcB+yrmfbxYkB/osh60pLJaxtI1oIqbbrGbOwEWq3+M5HqbSCRpIMPc5tR/k1jcImMVVGYRsVu1qny+tkAw8k5fqoVVQ+7wgHZMHowt8awH1SIaKONS7ssAX1LWqpHPaLvoxl7wfF8fWOVE9it/reVFv1Iga+TQ2axjxoYVnky2nfPoJKC3F55rDdqxQqNEepJdGarj1DGTlnDiHQN8CFPZZax2TtADTKd4BlXTVU2vKBlcuhsVPa9IQZrGuHPwo2M+jRrOYMdnOsK4EDKpnwATO++BhpEH+FLfppyXCwh2GvXkY9R6mYSIPOQnuj3Oc4DSSYILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16r7ZGQxZ/iSnep82FApZjOgA5LJ98oPP+SxebBXSDM=;
 b=ClEmPrqNB9k7SDFVGdIxKOboT6kxgvP6N+oXUIjaJ823ONbuuYVmC73M4exIHGRlTlX476uGazqAkPDt85VEFfS7SPJgY4HTHMY3RsGKkNKVTmWsogmiKCaBqYU4awu3pDNGICIFETIbZXLhyEsMNacunQ+rOfqB4KAWg32HsCMCuckwbot5MB013J148st3rfYUu8Z2tGgXDYLpoJ1GhuSDBl8SYpYk713CjyFwXan9QNzIkxidfiQkL2ycADIoLUZ0GGyaRgWwIs+1wTMV7MSi/xEeAn8wyNyFzvc8V5tJF2HwU+Vnkuxv5doBVqcNwIlk83+gKTAbXgOAFWqynw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16r7ZGQxZ/iSnep82FApZjOgA5LJ98oPP+SxebBXSDM=;
 b=VRXu5vchf9wBhkRhYdJ5CiDz9HKYW0QQ/c2l3Zqb8ELZ+M9BHZFtc1MFz6OAeMWNOxJAh2c2TQ8nBTc3Qc1rStc+m76zeSW1mS4FRLXAKDLmn5eU22OF6w7F1KEQfoJ/ph/h6GPLmaEKDQ9EBlHKB4bhdOWPoGSyNDNiMGN8OIb2n9phBl31oEaW3F8zW7NCeAPEebL2bIa3wqpsMvli+6rgSkUSTLAi/b4ac/mj6YihjkEKLQXbYWhjk6J8ZV0HNOGj4RvSJRhkneTJj6HDY1bYaqqvIeA3Cd/hz8xBK1D0ERDFNMaSS9mEiisDshOsMz/zoPWewIAuXd661MtpsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI1PR04MB7181.eurprd04.prod.outlook.com (2603:10a6:800:12a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 20:16:40 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:16:40 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:40 -0400
Subject: [PATCH v3 05/31] media: staging: media: imx6-mipi-csi2: use
 devm_add_action_or_reset() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-5-c9286fbb34b9@nxp.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807361; l=1965;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=JykNP3Wr8V27V/V5mRXR63Vo77tMC6HLDGjlTMTwCO0=;
 b=ZRUfDt+t7fvvq4eHZclIfIAt4sWaXtaw4xovnARUYAHPs/MmZ2W7cN0qOOERw7XvAKI1NmPyE
 H1csb/rjFSjASTrIMYsldJULfRDHGgKS053l8bqTjYCdI6VCrPzeR1x
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI1PR04MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 627f0e25-ff22-4953-49ea-08dde0efa34e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?T2E5c1BqaHNEd21GekcxNXpWZmYydlRwL0drMkMySnpZN2JsZlFyaExod3dt?=
 =?utf-8?B?OWNLM0lyRCtIUGtMcGxQL285UkpxOTNuZVN0OXJPbWkvT0pmQTZUSnQybVEv?=
 =?utf-8?B?ZGYwWi9ITk1kVWI4eWpUZ2UwUUQxVW5md3NmWVZOSzJLZ1RCOXJVcVVUczdS?=
 =?utf-8?B?WTFKWmE5eS9jbExGNnFJNXdoTGNqN2RLek4wRTlra1B6dHgwa3o4ZElsQ29E?=
 =?utf-8?B?Q0wxUGZpdktZYjEwbkVUcFFTOEg4SnFUZlhHNE9tVU9KMWFXUTFVY1VJSVc2?=
 =?utf-8?B?d3Vka3VqL0I3RGI1SjlwbnR1NUVFb2hiMVpvMXFPTGovZHZjZ0RiTWFZSXFh?=
 =?utf-8?B?ZUhDNk9jOUN4dHNBSjV6UmxnTGtTNkpMM0Z3RGJyNk9KZEZyTzNhVjlHdkhv?=
 =?utf-8?B?MWsxcXlnYTh2YUJPNDFMS0tkNTEvNHY2MzhEdm5OMTNEUHdIK1BSbFFHVzFK?=
 =?utf-8?B?Q2ZSaTNRL3o0enpscjdBUWlMbTlJREpuNGhLdTF3NUxIaFVlZEFPWE1FZVdE?=
 =?utf-8?B?OTVNWjVLd1FINlE3MHF4a0svNlFic1hBWUFJdDJNcXlUVmdCMnJ4T1BXeVJu?=
 =?utf-8?B?aGVza0tYMDJCVzVuWHV2WGQvUE01UWF1ejdhd1dsbnFHK3NVYW14Q09ONVh0?=
 =?utf-8?B?YWM2OTJKSDdqQVdaYkZlV2hnbmwyalZ5dnhDaCtmVlZTK1FqNnhHREhiWXZu?=
 =?utf-8?B?OGhwcUFSckpLNmg5NEVJckY2TWNWRndWZjlmUVk1R2dHOFRROGNxR3ZqNVVQ?=
 =?utf-8?B?MjE5WjBEVFQ5V1YvQVB2WUMxdXhybWZaYU1oNklOVHd6U0x3Q3RMdU5DNlZa?=
 =?utf-8?B?Tm41YVZtN3hsZmdjcDZnbW9CZ29OanJIWGl6cDUwT3MyWFFUTEZkQmFMNk5L?=
 =?utf-8?B?QnRDelVEZXBxZ2NKVGp0S1o1Qm9LSDd1SEYrWHU3RkdXclhjZnZOa1o1VXJZ?=
 =?utf-8?B?V0ltaHkycWEwOGR3YkV6c2ZjN1dnVm1YcS91MTd1a1RyKytvU0xYTEFzQmhq?=
 =?utf-8?B?bWQzUit0amJPQUk4c1plQUNtOXVudVBPZVlHVEVKOEdpc3BiTmsxck1XK0JK?=
 =?utf-8?B?bTh3MTVDczFXUS90bVJ3MlVCbjdzWjNXVWhiUS9KZVVZRFI3OFU1blAwVDFm?=
 =?utf-8?B?T3BYNVhkZFBDdHlIQWtvZWdTeWs0Z3l1RUpLM1FpNkNQaTRnTHl4OWlvYkdP?=
 =?utf-8?B?c09Ja1lxMU1zVVlPUHo2UXFkd2JJTmtNb2JmNmR2NEo1dXZBV2RyUlZFRmtN?=
 =?utf-8?B?NUFFaHM0Q0pINjAwNFN5d2tUS2pYVG9Ebk5aclFYRTlCU1FBdW9rbTljRUJ4?=
 =?utf-8?B?d1R3Y1BZNXZTeWk4akl3dkdNbjVubStseHlTa1lEYVc0alB6VE93ajJIeUlR?=
 =?utf-8?B?VU80TEg4QUMzVWhvOEw4TExieXNQUk5CQVlDdDM4RTNVWWhaWGRJWUxQS0R6?=
 =?utf-8?B?VU5TekZqMU1DSlo4RHd2UkVMVWVKemlXVTI3Q1I1QlFiQi9COUFOVXNjR2xv?=
 =?utf-8?B?aEJUNngwQ1VZWEl6cWJ0bnFPZkZWaTNQdFlCR1g0NXVvUlQrUXdQekVETElh?=
 =?utf-8?B?ZWlsUlMzUnpsaGc4WElnVHZxWGpWYTBpTDZVUVRyR1hKMkh0Vm9wQ2lPdlR4?=
 =?utf-8?B?SlA0TWZZb3hXZEtEWm1ud09wSHRGZXBUcjd3THJoczVuUFpqUVJVOGVGN3A4?=
 =?utf-8?B?V2swT1huVEtxR0JKWXVSdWFvMkRxQUNlQ0gyUzB1dFRJazFhQTE5VSthcm82?=
 =?utf-8?B?Vkp6SnpaQ3RHcFN6dG1xa2ZTbDMzc29ieWwxYUhIQTJBcnFtS1Z0NWJFdDQx?=
 =?utf-8?B?RGtYNnYrZ0hrazFsYTV5MFNMbENKREdNclpPREszd3Y5ZnFRODdRcG9YWjFO?=
 =?utf-8?B?YmNaL3VQV2Z4ZG5RRExiMldoMFBsOWE2bUdGL1E2L1ppQVdnRmJGd0ROQU1x?=
 =?utf-8?B?dFhuVEJya002cWZxQWhCakJqTXpRWi9paGUvVk41bEc2QTZVUTA0L0dMWkZB?=
 =?utf-8?Q?feYxlHpzHhjueHwGXG4LWPcHksY0s8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?L0gzSGFPdGJ3NExhYlY4M212c3JkU2pwL1lzRkdrUEYxcmdiU3hLazAwWWNO?=
 =?utf-8?B?MWxwaUEvNm1YNVYxd0dRQXIzRjc1WldNUHh1N2w1MmhJcDN1NzNEZThOcmlZ?=
 =?utf-8?B?S0lUV1pFYTdDT3hveU9WeFBRWUNCN0J0bTVGQ1RlZlJaUkRCZmtYcDhWQkpv?=
 =?utf-8?B?N3JwVXlNZmtUUWFIc3Zuak5CTXBhVVZ5b2N2ekVuaCtwRFlPK3FwL3ZXV3pN?=
 =?utf-8?B?YnRIRmQ1ZVlZYWtZNHNzU1dBK3g4Q3RjWXQxNWxLcWJKZ2FTNUgrTjlWNkJW?=
 =?utf-8?B?U1VhSlNhVHNVNURIZDBRbWVtVWZiTW4zd3dHaWlXeTUxM0liWGptUjBkNlho?=
 =?utf-8?B?Snc0anBoaVhMTGUxbnZmWjlDUEJOL3JJL00rY0QxTWZJL0RQbzlJcXArd2pQ?=
 =?utf-8?B?bG1Lbk9oTy8weGduU3ZDZ3pCV1ZnaGtMcnM1eE54b0llaGp5dGZzUnFSeEhr?=
 =?utf-8?B?NHIrVXhtcVBYczNSSVNsdXEyNnRoeGlyZjc3MXM1UWV0UG1scmIyemkyRGMv?=
 =?utf-8?B?b0g3YmVkTUtiNlhiTUI5VFdZOFNtenZLWFNickxIZnVjM2NpWHVTMzVnaFFN?=
 =?utf-8?B?dGZ1L3JBam1QSlNXU1hlR3NqSkVzVEEwVGhtNlBES0k4bzQ0TjYyZ3VzMUdt?=
 =?utf-8?B?NlFnUkI3ZnlWaW1YcmpYZzd2T04wRFpWTUt1S3B3NDN1cWtLcW1pYUpZMG1N?=
 =?utf-8?B?MnljTjFFWWp0UnlrcXcxN3ZhdnlmQVp3cVVBVEk1emtTa1JKMlU1eUxsNnVI?=
 =?utf-8?B?VW02ZU9sU0JhR1BETk5pSGVqRFVJd0R0VWlMUnhGOWxPUWc4OS9ZcG1CLzJo?=
 =?utf-8?B?QzQyZ0xlS3ZaaDkrK1BmZ3hYSmFqMEwvalFkK0xadXErc0lsemViV3BRZm5v?=
 =?utf-8?B?cEw0Rm1sMnRKSVFLb211ZStORkhEUjdLdDFhZDd1dGJraURxcVRjWko4TGZK?=
 =?utf-8?B?eWhTdUY0R1Zuc0lIeEVta1RJRUZ3UUJPRmt1ajlxVXV4cER0ak4xR3VHaXlD?=
 =?utf-8?B?dGtUYzZ3N2IvWlEzbGxNbThMNW44Z2hST1Z6YWFTSHVPMHljbitGZ1BMWjdh?=
 =?utf-8?B?cFNkYWFPdk5LN0dBbFozYlNWNExITGh0Z2ZLdVV2ZEMrcHBkY2dvdGk2aTZx?=
 =?utf-8?B?azM1eTU5YURFOVNrMHpjRXI0bkMzemZVNUx4WTVRcms3c3hyNmRiZS9nUEhW?=
 =?utf-8?B?bGpDVDZXVy9TR3BidVBlQ2pacUZ2eXgvbEJnU1NBditCVlVYWUovMmh0VFhr?=
 =?utf-8?B?Y2NJZ1ltcWFxUGIyL2ZiNnF5VnpEc2pPSUlqQ2s1RkpKdnpPR3JseG9xeEhi?=
 =?utf-8?B?T0lKcXh0cVQybTNrYkM5ZmdheEJLRmVHODNocWE4N0lQWWU1OUFuWlJ4NVFD?=
 =?utf-8?B?RENFZXIwVXRIR00rWm9LVzRScVBxbmtUMG94dHpiM0tjSUN1OE51bW01Sjll?=
 =?utf-8?B?NjBEQ2JodEhrT1p6SW5VNkJIYTBHRkpsM3FkMXJlRURoK205TVlrYThnM0Yv?=
 =?utf-8?B?TUJWTjNVMzFJQ1owTXQ0K2tSZUN0dkpTUlM4RURDODRYZm5VMkJ6NytsTzF4?=
 =?utf-8?B?ci9VdDR2U3RZK3Q1M0Z2czM2VjJnNEppQW1BcFl0MDZTaVpmWFErS1N6Tm12?=
 =?utf-8?B?dzFKQzFXbHJZSWN3MUdKMlJMQUxoM3dwVCtHZml1U3UwdVRBZXZJa29QUmU0?=
 =?utf-8?B?aGlUWnF3NEhRNlJGWTVDYUVqaUFvZGczeW5RVlNpTm05c25xc2c1YmJPTHVz?=
 =?utf-8?B?VEtITEVPMU9nanp1TzlXZ2o0TGJaZVVNWmR3dVpYdWwrU1ROcGQvMXJiWmdy?=
 =?utf-8?B?VW1zV2FvRTZCRFFOS2dZbWFQc2ViTDN4azlEMmRRRFhQdXBNQVE0bENMWmNU?=
 =?utf-8?B?NzB6RnF6eHZxckxxWVllODBGRU5HQ1FkcDF4RkttZWdBbFdWbC9TWHI5ZUZZ?=
 =?utf-8?B?aWsxWjRaaDdVN044akJpY0pVcnd6Vnk3ZWRNVVlIOHZpa2xybnZjdTUzVWpC?=
 =?utf-8?B?b0JORld2ZTMxaEZNcXZwMVZBakRCRmdnc3Q1UU1SMUlkc285allxcXBwWitU?=
 =?utf-8?B?UEZQR2g5TE5EbHNxZ2dubFh5NUswNWVwQm5jZFZDV1E4R1BpTXJLVUI4ZVlU?=
 =?utf-8?Q?NpGM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 627f0e25-ff22-4953-49ea-08dde0efa34e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:16:40.1040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26cttLSvnEs+uoFdvvcAdAvWFU977etnodgzOShwtPonHWqT/j3gP6V2QEKQD5pW/qXWNA+t0yrVyw6V/E+zQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7181

Use devm_add_action_or_reset() to simplify the code. No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 42256441b881d9f132ad7ff899d6f1e35643b4ac..eba9a650030f5e380aa900b94728ad375171c6a5 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -716,6 +716,14 @@ static int csi2_async_register(struct csi2_dev *csi2)
 	return ret;
 }
 
+static void csi2_nf_cleanup(void *data)
+{
+	struct csi2_dev *csi2 = data;
+
+	v4l2_async_nf_unregister(&csi2->notifier);
+	v4l2_async_nf_cleanup(&csi2->notifier);
+}
+
 static int csi2_probe(struct platform_device *pdev)
 {
 	struct csi2_dev *csi2;
@@ -749,6 +757,10 @@ static int csi2_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(&pdev->dev, csi2_nf_cleanup, csi2);
+	if (ret)
+		return ret;
+
 	csi2->pllref_clk = devm_clk_get(&pdev->dev, "ref");
 	if (IS_ERR(csi2->pllref_clk)) {
 		v4l2_err(&csi2->sd, "failed to get pll reference clock\n");
@@ -800,8 +812,6 @@ static int csi2_probe(struct platform_device *pdev)
 	return 0;
 
 clean_notifier:
-	v4l2_async_nf_unregister(&csi2->notifier);
-	v4l2_async_nf_cleanup(&csi2->notifier);
 	clk_disable_unprepare(csi2->dphy_clk);
 pllref_off:
 	clk_disable_unprepare(csi2->pllref_clk);
@@ -815,8 +825,6 @@ static void csi2_remove(struct platform_device *pdev)
 	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
 	struct csi2_dev *csi2 = sd_to_dev(sd);
 
-	v4l2_async_nf_unregister(&csi2->notifier);
-	v4l2_async_nf_cleanup(&csi2->notifier);
 	v4l2_async_unregister_subdev(sd);
 	clk_disable_unprepare(csi2->dphy_clk);
 	clk_disable_unprepare(csi2->pllref_clk);

-- 
2.34.1


