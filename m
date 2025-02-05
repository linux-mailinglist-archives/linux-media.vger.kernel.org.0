Return-Path: <linux-media+bounces-25689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC76A29728
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 18:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AADE5167E65
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 17:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE151FCF66;
	Wed,  5 Feb 2025 17:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hUCLd5r3"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C629E1FC10D;
	Wed,  5 Feb 2025 17:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738775955; cv=fail; b=LUa7LHPZ0Py2jlXiTh5ry1AZNCh8/HTeO9qep5g+0q/rbXtwTzHWBYvDVbXhl/lsAWZyhbEqUZ1NpRAtB/ldxTXVb0dlbqecE1Ugaq3vmTd7RL0WDwCy7hOTdiq3PsXhoxGSRbC36fVGRm74stBn/wmL/rhfYlJq8UMG1YGdh+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738775955; c=relaxed/simple;
	bh=GWf9VAn+sdqu9KvC6irFudTvhz5QbnJbT4US8Oi8BGI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sGNtFTdgmUYqyUoG+64xb7IsEyISMFo8oPQ4WJAaHVwNTUyQ3st31f5j+tJgRL1JDZzqQo4Wwf+Y+WkhayF3Ankzw+C98gPpt5ZChnnRnKXiQhdjuhHL40CmS3QoONmnJeQrb+xbe9uD8VBorM9gmW9VApQ+JRlZoi4p5v/Bzl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hUCLd5r3; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VoMauvILOeGO71dd0nI/7o4sDU/ydVHfVuGphrqxegTutT80bgIAaGqt51Vb1XSWlItzAtX4s5Y+tG9NfJncKyfPsr2uIRaUIVVd96qKcVpxIGl6tJvIF3bvJkZxUdweoZywycdM4HKKci/qyLkfgJ+TUKzoB5ojnVuOA9luZ7El6GZ00MCE0d7hrLa6naDa8GYM5TBzaVqqX1Ct+0AQpEYRFGtVovvNzVmvV143um4h2BfXv0NKtKBkF65mCF2XxLPSw4zsU+RiuWRzLVp2CKObPXVj8syimE8ITilt8OtFzMY7uxZ0SZfEMGY24schkTo6MY8rv2DX4jLYUq+8Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qejNUTEePKH5gvq/JmnTO+U/0WKgFhNfn/UkQibdECs=;
 b=LCVCliJJItQIQQcVtsDWxWd8VEk30hEzYI6AKcXz6UuBRAnnBEVNQNZ5WDEO/Y3m7YnUs1ruFC6gmXajkrV4his8dgtYV4GwiJ/OTeP01ZlH6F8f5fk8jFPJTI9PFjk1skuDvs1T83Q30wdQ4/a/KGStaT9YjCn0IS0kC1kKl1NuCgOVA6ATay9Fb3WRPrfRbDZEbUUKde2+GK6UW4tG3aBCIFNcEjvqyhTWaGjb2ZLRdPXVO/ERWvpegd2X0PbJ2OoJAzgNIbTjklnZs9PMIivVg+Nj4ao2m7HEcnyB9EiYOLtdsTwcAUm3KDKbiZirHHI9pPJytMtscNw7ebAzdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qejNUTEePKH5gvq/JmnTO+U/0WKgFhNfn/UkQibdECs=;
 b=hUCLd5r3UrgPHFQkRucW2njtC7WzXMwtTGVjwDIo4Oru8zOA7MyWCKJRQTpmeDcCBeD6bSDBzNqW8ShUC9yPo6fSYgf6qCKkfEQCXX6fKnfzwOZgtfhykNbVpmplXPeps0P/ly1fKM1VixUqeeUuZNoP4VTxMxZqBoMne7tSzZD1u6v5+KXhp7hyCcSkYRpUVSSGHMnzxwRGumsBdMVUaIM8+zC7vaOvuyu3jX15Hh2TOE3GqaP06WxJBIRQfCuSHsjiyjgFVQvBaWiitElRqtKxKB295SflS0MBZpvAPOkXJ5oaFfVT7SL4wz11P6yFmq63pDYQWdnYoRXP0kTIQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10546.eurprd04.prod.outlook.com (2603:10a6:800:274::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 17:19:10 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 17:19:10 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 05 Feb 2025 12:18:13 -0500
Subject: [PATCH v2 04/14] reset: imx: Add SCU reset driver for i.MX8QXP and
 i.MX8QM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-8qxp_camera-v2-4-731a3edf2744@nxp.com>
References: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
In-Reply-To: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Robby Cai <robby.cai@nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738775920; l=4608;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=GWf9VAn+sdqu9KvC6irFudTvhz5QbnJbT4US8Oi8BGI=;
 b=rqT7eNb2NFHms6dRN42otoHsS2a7bRB63qdc7ksF/Xjd3aYjx3Zkf79rF7fLWZWQt7Dj0Kgyl
 9ntzZmTSc0OCl1Y9fL5/wPZqoaNhEPbpVmuRBGMFTEsWq46ASszbiyw
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10546:EE_
X-MS-Office365-Filtering-Correlation-Id: 24155d83-fe6a-4249-a21f-08dd46093425
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?YzNxMVFqcHRkdHY2aE1xYUsxdnZITjRMcmtWM244d3VMNTJ3aGpZTmhONlBP?=
 =?utf-8?B?eVhsdjZLWW94VGtyNzJwZSthTWRSNzE1K2o2RzBGcnRtaWxGQXk2TXhqU2Vm?=
 =?utf-8?B?R1dtT0ZWRnFQRnYrdGRGamhVYWhsZUNKc2hDVEpWdmFEYS9HbFYrQS92QnFH?=
 =?utf-8?B?NFFHZlpNRG9nZ1Z3UXZPODQxeDBJQkJ2a2dNbDlDV2pPK0FyMzlneTNWNnBS?=
 =?utf-8?B?b1lDdnVsdENvQnE4em9ScFhaWC9rT1pFZGVLNlArdXVINXBqajdLbUZ5blM2?=
 =?utf-8?B?TjJ6VXFycnVqcGhZNWdub0YwUG1KdmVGYU10VXVCUk9ZY1NwbW1ib0dHZ1NU?=
 =?utf-8?B?cWw5OVFUdUlKYjJ5STk2ZnRKRlFrdlpIalY0TEVOR0hlbkJnVUovMkNlZGsw?=
 =?utf-8?B?Z0NGNVZXNGZOY2VhcjVCa2ZhZUlvWStCcFlYRzdWQ3B1a2h4U3dSbk9JUGxy?=
 =?utf-8?B?VUY4SGRLcVNiNUIvNXBxZW9ZZ281RDYxbUQ5cGdzejBnV1dOQ20rSTI1UGFY?=
 =?utf-8?B?VDg2emZRWGp3TXBEVmZyeHZ3ZjVDSmpDeXJNU0U1Rmc4VzBTZjVPdXcrOGRj?=
 =?utf-8?B?THlkdWUvZEJ6RFJadnd6bkRESTNIMWwzQmQvTGNUSndiTnZ0M1VOYU5iQ3pG?=
 =?utf-8?B?RW1wK2tXQzNEVmpmME95dHczMWNrWXVMTnA0K3NrTW9zSm5hb0k4M2IrTjc5?=
 =?utf-8?B?cWxPUytaVXJUUlhqT08yNkoraGNZbDlRd1dRT2VHYkFnVkNnQmxFdUZzZEQv?=
 =?utf-8?B?UHpyRVVPeGVwY0EzUUZVOXpqMU14MWlUbTM0NnBSdjNnT0MyNlM4L2hXM2VZ?=
 =?utf-8?B?djBEWVJaRG81cVNvSnh4eThLbUNVMWZZVDVwcWFoVytlZkNGZWFVeVU1S3Zn?=
 =?utf-8?B?NDJFWk1MRnNhWk5ja2ZXbzlMcDg5U09iSVVXWThHSGtkd2JqN1RiMUc5SWJL?=
 =?utf-8?B?YjVoWG94WlVKZEVnN1B5RlFiUStCWmRNQnUwajlrZHhlNzVXb2RDaU1kS1Vs?=
 =?utf-8?B?THVPcVRyRDFUVzhSR1RoMTlIckg4MVFvOVZ0alYxblNXYmUweEZjOS8wVkpF?=
 =?utf-8?B?bGNLdGRtYTFIbEk0eHNvTU1pOVRRQnZ2eGsvV29ReXR5Mml2QU4xakdtTHQ3?=
 =?utf-8?B?YU0zNlNoZXVvRDh4ek1QUjNaa1pVVWNIbThLSHk5dzVkaFBCSG9jTEdISWJl?=
 =?utf-8?B?V2pKTTYyTG93eEtwMkllWlhoeTNHNU9XUXNSTUVZMDFVTXc5RFZleWd1Z09i?=
 =?utf-8?B?eUZtRUNiNzdiUW4xdEpUZW1XMFJ6NjJwS0c4MGR4dGVTdFMzK0c0WjFZMzdD?=
 =?utf-8?B?akJGOFdlMHdsZjdGNmpIV1V3bGJDWVF6RURPYXJBd1hjMTcrMFZ5RXRYS1NK?=
 =?utf-8?B?NXdJYTNrNGdHaVFjYWJmRHZ0U2xYRCs0R1k3Z2hidG5mWVBGQXZLQmExVDNW?=
 =?utf-8?B?ZEg2dWxiM3plT1hBeW54a1QrNS9PVzh6T1c4Uk4xVFJFSVE1RkRWbU9nMllD?=
 =?utf-8?B?dXdiRkhTSVpKdk9CZHN6N0NvTWliRzFWNENhRzlYK290eGliTy9BemMwc013?=
 =?utf-8?B?WDBwc1Erd3ViWGFGaWJjODB1S2xROVJCWkJxQVBmYUgvTC9BWlFWQzVtb0tI?=
 =?utf-8?B?blZ1V2RZMlgrQk50U04vZy9GZDRmYmVCYWR4SFc3cEdYMnAvdS9DNFo3Unpm?=
 =?utf-8?B?MklvR01WZnQvelJPUkRvems4T04yNWUyRWsyT2NTWGJpMTlVQU1JU1ZybzBi?=
 =?utf-8?B?WTRVbXhUU0EyVERZbVE0eTZ5UTZROWUydXA4cCtWbHhxSU5IWk11a3FuZzJ6?=
 =?utf-8?B?aW0vWG1zL3QzSGRrYjFqcDk2aS9yV3g5RzNleEx2RXpFbUNxUnp2MFRXckVK?=
 =?utf-8?B?aHkySUEvb29KNlRWeXAzOTJSZFJ4Um9mVzNpK3RvUmtaRUhuRmpiYUtWcEFL?=
 =?utf-8?B?TlhTM0MxZkNCa2N6MTJvQndEclh2eDREVTI2T0pSWFVmUkpyNklkNDhWMkJv?=
 =?utf-8?B?QmJ1N1E1RU93PT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cFNwZVQyeXNlcEZDam5rT01HQzV1S3BTMEVrUzFBcjkrNGpjQXV2Mi9SWkQw?=
 =?utf-8?B?ZmFidkhmSUh2M1FhS0lzYk1TeERUdjV2WUlHNlR4UnZUSnhRVS80eGpQK3hI?=
 =?utf-8?B?Tko1eUlJWVZqTkgrZ3lSS1RrNVVsUmZSSnRPbS9IWi84YmJyMkRXaGVmTFFp?=
 =?utf-8?B?cHpobTZRZVVPalhGV21RSEJQUDNDNXZOaVo0S0VpTytiRVB3Qk9tdXRBV2pw?=
 =?utf-8?B?M053eEM2VUt6aEo4QjNNL3Y5aFIxUERVTnc1RGVUV1Ftem0zWUlvUVBUS1hJ?=
 =?utf-8?B?NXF0M2k3MTM3YktIRmlpRWEzb2dsVWp6ZXpvaWxOS1l5TnljUW1WZnlqcGRI?=
 =?utf-8?B?SG91T29vVmVqbGRaT2Vod3o0Z2FPYzJISElNcTBtcGpUaks1YVAyZG0raVdk?=
 =?utf-8?B?Umx6SDh6empEeitlREhZUUd2SFBoWTVLOStXKzFzTzRZajkraFFBRlQ2czNt?=
 =?utf-8?B?cWtmTHRiUWlIUEtzd1M4SUJVYmcrQmUzL0Z4YVYrSU9VcitwWSt3VnpWeWY4?=
 =?utf-8?B?YUVZMjgvYk5RcFU0clpQWkhZaFN2ZVRCVlE4Wks0aVN6SnNHMzRlL3kvZmkz?=
 =?utf-8?B?ZWY4R2FId0RMT3c5UGJodXJKK1VBUjBuRCsxQXcxcEYxSEtOM1FxR3ExYnhs?=
 =?utf-8?B?Tkh0QjZ1NjdTM0oyS1IxOWZmQ3RZN3BrOHEwM0IwMVFPMHZ1aTBJdTl2Tmsw?=
 =?utf-8?B?Q1RxRzRiWERzTWM5WGY0TkxXeGZLZXM5ZWhEM1pYeWY1MU5DNVM5NXNkdlpk?=
 =?utf-8?B?UG5kUStwKzlhckdKTitzMm82OFFydGxVbURVUnF6ODROQUFyM1dGMDlqTUEx?=
 =?utf-8?B?dGhNd3VVOS9pNUdWcWxFejdtanJPZjRDY3pPVUxRaGRNcXFPRDlYdm5zTjBC?=
 =?utf-8?B?cUZkTVQwM05DNU5pcFY3aTdjMkNNenRhbkNXSWJSUjVWdXdRNnlyYWNPejZz?=
 =?utf-8?B?blArUDZ2L1RCdjhwUStYcldkSWVFa1pjZWtnU1oyY0tQaStRcVBaR2VhR0xr?=
 =?utf-8?B?eWVTZWlaYjZTRzBWZVlIUS9pUmN6TDFGMWJvbjlZNHJacEQ4SHlobm5OVTlJ?=
 =?utf-8?B?a0VGY1M0dGZvTXF4VmxJM0dMRnNSb2oyUUxiaTMwazlBcm1pVk5SMXF6bVZB?=
 =?utf-8?B?NkY2THllcS9nY0JEemZPS2VOUXlJakNzbjVuLzdkWVptNno4OWE0elNSWkRK?=
 =?utf-8?B?cXNBb3FBcWdPZjNxemF6TFBPQ0xnTzhQUXlkY2hwaGh4ZmphNGJtYkVFVGJF?=
 =?utf-8?B?L3JQU0ZUQk1DTExOaUFtV1I1ajJ0bHlMWG42Y01CVlRwT0I5NFU4R0hOWnBZ?=
 =?utf-8?B?Tnk5RFVnMUYxQzBwZWJFanBaV0tnU3h4MXBRUG5NWVU2SHhwY1BZaVZwYmVp?=
 =?utf-8?B?TllxZ1JubGxJczV3d1N5NGJSQWV6OUkvcTdhUHd1VnpjcFc5b2h1TVNzdk56?=
 =?utf-8?B?bUwxRkFhYklmOEMrVUQweHk3NXJSSi9uZWROUGd0ampOUnV3QmNQVlJCVmJG?=
 =?utf-8?B?VElWc2tGZzA0V1RsZlZERUtKemtBdGMxeTU0TFJSeGlhT1R0Y2F3RjJVSlRv?=
 =?utf-8?B?SU5jS0I0cG1BdkRSSG80aURrZWlESmNBY3JmWXQ3K2NDZnBjZnh1bGtpNWNY?=
 =?utf-8?B?MTk5V3B4dHlrYVVKc0U5YWpQNzdzamcySlhCY2lNTzVqc2FoUEFrcDVNL0wz?=
 =?utf-8?B?NnAvbllJaXluY3pKQ1dvSVhZYmlZUUdjcTBsVTV4VlpvSEUvd3VFeW51dmky?=
 =?utf-8?B?VjR6Ykc0ZVBRZGJBTFp6UzQwSDRKWHN2QU1wUkFoKzdxL1ZSZ1ZabE96VEhJ?=
 =?utf-8?B?akIwMnExM2dibVA1QTVycC9aQzVuU1NLNHZ0d0RLdU9vM3hlam84aDZLYjRq?=
 =?utf-8?B?ek1RU2s2aHV0U3p0ZGNrZnVvRnN4TkdlTDFmQmUvd0Z3YjRSVDdMRHJUdXR4?=
 =?utf-8?B?MWYzVW9QNjNlL1pyenIzbHVYbWNvUHM5M2EvOWUyY3hRVGtVUTRMaWovZGFl?=
 =?utf-8?B?Nytta1JQWjVjYXF2amNrY0JjT1lPYkQ4OFZiT2JjT1N5MHM0QXlxRTlTTG00?=
 =?utf-8?B?MERzRThJS2ZMK2xWd1ZISnlMelpkK01uM0p1L2FCUGJ2dURLNTk4cHpwbmRV?=
 =?utf-8?Q?HsqF4k9O+xUEw7dsOqiuai6l2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24155d83-fe6a-4249-a21f-08dd46093425
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 17:19:10.1009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGJAeYvg5skPHnXGcDPUxpepZy4HzVOFFO4PPsMEtoRMRdiNEx0/SW/+SU9lQiZYnlFhWKB2G3OJB6L7VZHJRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10546

Add System Controller Firmware(SCU) reset driver for i.MX8QM and i.MX8QXP.
SCU Manage resets for peripherals such as MIPI CSI. Currently, support two
reset sources: IMX_SC_R_CSI_0 and IMX_SC_R_CSI_1.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v2
- none
---
 drivers/reset/Kconfig         |   7 +++
 drivers/reset/Makefile        |   1 +
 drivers/reset/reset-imx-scu.c | 101 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 109 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 5b3abb6db2489..99f6f9784e686 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -96,6 +96,13 @@ config RESET_HSDK
 	help
 	  This enables the reset controller driver for HSDK board.
 
+config RESET_IMX_SCU
+	tristate "i.MX8Q Reset Driver"
+	depends on IMX_SCU && HAVE_ARM_SMCCC
+	depends on (ARM64 && ARCH_MXC) || COMPILE_TEST
+	help
+          This enables the reset controller driver for i.MX8QM/i.MX8QXP
+
 config RESET_IMX7
 	tristate "i.MX7/8 Reset Driver"
 	depends on HAS_IOMEM
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 677c4d1e26320..31f9904d13f9c 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
 obj-$(CONFIG_RESET_EYEQ) += reset-eyeq.o
 obj-$(CONFIG_RESET_GPIO) += reset-gpio.o
 obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
+obj-$(CONFIG_RESET_IMX_SCU) += reset-imx-scu.o
 obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
 obj-$(CONFIG_RESET_IMX8MP_AUDIOMIX) += reset-imx8mp-audiomix.o
 obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
diff --git a/drivers/reset/reset-imx-scu.c b/drivers/reset/reset-imx-scu.c
new file mode 100644
index 0000000000000..d3074eaad4c99
--- /dev/null
+++ b/drivers/reset/reset-imx-scu.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ * Frank Li <Frank.Li@nxp.com>
+ */
+#include <linux/firmware/imx/svc/misc.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+struct imx_scu_reset {
+	struct reset_controller_dev rc;
+	struct imx_sc_ipc *ipc_handle;
+};
+
+static struct imx_scu_reset *to_imx_scu(struct reset_controller_dev *rc)
+{
+	return container_of(rc, struct imx_scu_reset, rc);
+}
+
+struct imx_scu_id_map {
+	u32 resource_id;
+	u32 command_id;
+};
+
+static const struct imx_scu_id_map imx_scu_id_map[] = {
+	{ IMX_SC_R_CSI_0, IMX_SC_C_MIPI_RESET },
+	{ IMX_SC_R_CSI_1, IMX_SC_C_MIPI_RESET },
+};
+
+static int imx_scu_reset_assert(struct reset_controller_dev *rc, unsigned long id)
+{
+	struct imx_scu_reset *priv = to_imx_scu(rc);
+
+	return imx_sc_misc_set_control(priv->ipc_handle, imx_scu_id_map[id].resource_id,
+				       imx_scu_id_map[id].command_id, true);
+}
+
+static const struct reset_control_ops imx_scu_reset_ops = {
+	.assert = imx_scu_reset_assert,
+};
+
+static int imx_scu_xlate(struct reset_controller_dev *rc, const struct of_phandle_args *reset_spec)
+{
+	int i;
+
+	for (i = 0; i < rc->nr_resets; i++)
+		if (reset_spec->args[0] == imx_scu_id_map[i].resource_id)
+			return i;
+
+	return -EINVAL;
+}
+
+static int imx_scu_reset_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct imx_scu_reset *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, &priv->rc);
+
+	ret = imx_scu_get_handle(&priv->ipc_handle);
+	if (ret)
+		return dev_err_probe(dev, ret, "sc_misc_MIPI get ipc handle failed!\n");
+
+	priv->rc.ops = &imx_scu_reset_ops;
+	priv->rc.owner = THIS_MODULE;
+	priv->rc.of_node = dev->of_node;
+	priv->rc.of_reset_n_cells = 1;
+	priv->rc.of_xlate = imx_scu_xlate;
+	priv->rc.nr_resets = ARRAY_SIZE(imx_scu_id_map);
+
+	return devm_reset_controller_register(dev, &priv->rc);
+}
+
+static const struct of_device_id imx_scu_reset_ids[] = {
+	{ .compatible = "fsl,imx-scu-reset", },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, imx_scu_reset_ids);
+
+static struct platform_driver imx_scu_reset_driver = {
+	.probe          = imx_scu_reset_probe,
+	.driver = {
+		.name = "scu-reset",
+		.of_match_table = imx_scu_reset_ids,
+	},
+};
+module_platform_driver(imx_scu_reset_driver);
+
+MODULE_AUTHOR("Frank Li <Frank.Li@nxp.com>");
+MODULE_DESCRIPTION("i.MX scu reset driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


