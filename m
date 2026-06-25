Return-Path: <linux-media+bounces-65648-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pICGBoQ5PWrlzQgAu9opvQ
	(envelope-from <linux-media+bounces-65648-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 16:21:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8690A6C691B
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 16:21:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=QgPcvCq8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65648-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65648-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50480307566D
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 14:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DAF35F161;
	Thu, 25 Jun 2026 14:17:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AA7349CD6;
	Thu, 25 Jun 2026 14:17:38 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782397059; cv=fail; b=FWAmoy6eU4vNOQzePV3DEFMIqPjAwQ3BBbdh608G3y2QxGJQHABRa+wYeFo6dY4bAIgUc39Yx1GwHCI6uVH8UwQJ+l4xWCVK0DCMzE6puWNxMyo9WX+gOlPMCXs8swSD+z2zOxhvWlHJUZ826IW5keU9kb7Wz5CrhUf6PpIIKBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782397059; c=relaxed/simple;
	bh=36IN5Q2iwXjvb/gW32HxPWcNltOrgUfKH72mePT2sYA=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=KA0n4NSBc2VYVWU3LZvU+TE1scMt/TItGQ+KbO3LycZQxy33wumvCKwWZ1meFa1oz0Bsh80dYft2KkwTtPR+gC0UMZn2yHD9+iNHKCN2B3iofhOJvewp7RgQKOgOQGd7xXWYYIzEiAFTvWmtoHEV7DAjoQKSU+pHU7AJjcDEXE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QgPcvCq8; arc=fail smtp.client-ip=52.101.69.7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aao/AIo+RAtxOOY4ZZYse3hoq3PayPn2/BXxYNvPuD9cB+zSXa+TrVzP7O5Nr0Vuhi1acuobWkjUgvPLo1Vi3Fr8rZw/GWrl2J9mwWSRz01YmwJVj9iaOUyOpSgKz49LIgbpK5gaW8E2R0K6NHZuUz/oLvctFI+6pJCjLr9u3SS5Fz9OFTCRW7biAIWiD/e4gQKwtStonC0yritvP+eSMX/tETyfEI7PPCuNVRQPiJlXCTNybYEYST/KbFXGlxSm6i8MgNPwtQc89I/VTplBn0I6cTY2GmsCUtISpmQIbPzwMNE5VF8pOINBljKM1XYT9KJzPdcfN3KS2JWQxhr6hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdF3YxJ14qpS26gxOk7ReYaKBqGfyV+4Ap2jP7dlOYk=;
 b=ALrwsVyX2nAYTJvATHRQr6irLa3uSK+/KQbbTaE+AxOYrZOlbc7StXLXBo7rUglzGmTY5X0hwfMtPlajUprvZJqGCULboilgZQrGl91+31JkgJPH/7d8JndO/p6mUtkY7mepQMBAb3aplPd47Kya9QYlER/pqtPJdH93lJXcznPEE6HTbkDIPlAad7Q0OqGdKLWpaqaO5Kcza2hiIrDfA/eam2F/CUfXWUg0yDFZbWrIXutWDrEgcfJrfR+J3nYPvjTqJ01xNel8rdEAN9Xz6H9vBkgf9rm9FdFb9dJQBaxM+XH/iiUoa7TO2ho/QpzR2lnV1PMliNybhCvQEr7zCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdF3YxJ14qpS26gxOk7ReYaKBqGfyV+4Ap2jP7dlOYk=;
 b=QgPcvCq8nzsvfxZXKVNtXL2SVjaO4UwDi7ieq4JgHZPwYa0hidgrxaKQ7K+n9O/ZOm8/yhDf27VFwtMDNkYqACtxBZD9WWXh0be62rzzMDOMMcvuiCSytVl3AYcj2gRHxdVnOIulhuzNxfmMEQG2lLRzMVOfN4g3bdqPdGpHq0/iHBxQnD8PzZHC3MkbXKqO37jQtXscPq6XfRnhO+KPinQLWUFAtkJ7XofK0h5ZZ+REJ7XB07KnOrDJdirBt68+EdyG2lEuFkdGiBjYB+IrpRNcLHItVVfOBSMrc7XX/PDKmpi9u6KCNfI+TiKhAGho4lOMav+TL+Y4d6oz/WMtEQ==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11888.eurprd04.prod.outlook.com (2603:10a6:102:519::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 14:17:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 25 Jun 2026
 14:17:32 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH v3 0/4] media: add and use
 fwnode_graph_for_each_endpoint_scoped()
Date: Thu, 25 Jun 2026 10:17:20 -0400
Message-Id: <20260625-fw_scoped-v3-0-ffd0868e498d@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHA4PWoC/02N0Q6CIBhGX6VxHe0HEV1XvUdr7RcwaUscGNmc7
 x7YWl6e7Tvnm0kw3ppAjruZeBNtsK5PUOx3RHXY3wy1OjHhwCVIDrR9XYNyg9G01NhIIUoGyEj
 aD960dlpb58uXw7O5GzXmQF50NozOv9ezyPLu1+WbbmQUKBaVBkQFKOtTPw0H5R4kVyPfemLr8
 eQB1roRFcdW4N9bluUD5YDUFuoAAAA=
X-Change-ID: 20260620-fw_scoped-5dab644510a1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: driver-core@lists.linux.dev, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782397047; l=1729;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=36IN5Q2iwXjvb/gW32HxPWcNltOrgUfKH72mePT2sYA=;
 b=I4Nr/iT3C1kmBhjjCStbO8g7hpn/epyktMs4VGiv4WMqJzAq4kTTqjQh6otlgThmOVLs2k373
 QayAnh8xuYEAllm50h6RWxVQZz4SqCt8eG/Eby5xQhaulziIc98vsAI
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN7P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11888:EE_
X-MS-Office365-Filtering-Correlation-Id: cbcaa237-8de3-4568-38d3-08ded2c47f17
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|19092799006|921020|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
 9lqAe5P3bxzspXLBKOiKUZi4Lws0GCU4hJA/X7CX/KIl2n1gWGqxUwMovpcB23iVxejwxCz85upmbX66MtHkEmI61aSlGk82PUHjLUpKVw+Pgtf3hi+bpGW7J3++9YbxbpQyDX3qMjJqbHBkm+8ZSb2ZRtqQo2sd4m8gp0wMGBT+6zrSyS9mmXCOXJwUa48IMuxmK8Cq6HLJ2gxpK/z2K9Fbz0VUi00ZcZWu8FFyLec9/TOhm/mdOmgZ+aN2XvKr/MJuOugzLAPX9j0q7yvxWFRqwsXMFF/Kd/jFlIijMBzaadlhM4cloRAsD2Uj8P0inJUHYI2Y9Hw+MzT8zWCiHF2rHsjgBGDI3KQmg35e1KJ1HUWhof+wmLi2RdKadPO4od3CK2x5lqQndmMbxhmnRC9TIk/8I3XA/hMN+nHAN6nJbYythC8P/o6bzWPvTsW5vNgJ9qnjzN7Y+DNtKJh6s9L7BwukyWuxVRCCDW8UlMlSaKDb4aYWGmJnzqoSA2GUv8o5LQOECLtVTcUSo3oiQOuzFlZfapAqtszJyL5vbN7lQUCscYcNG5IPsSz2+gpwxeA9hsx361LX9UrlIaTAuoy4D0RZSlseeKaQ+QSfb9QHJfe6f1XFgRY3BiCM7aNXpIC+4WB/Yay2fOGLldcpRxRMQDH2t68rjCnOrYnZ5MI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(19092799006)(921020)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WWo2MTJCTi9PQTJiaFB1eldKenVqekZSclV1VHJJSkt4ZSswdzNHUUFNNkJi?=
 =?utf-8?B?c0UvQlh5ZkIyeENXTzJVQ0h1Um5hbnhDeENhT3NsL2RqbEtXUGF5THRrMUJL?=
 =?utf-8?B?MUlOQU05eEo4VFpwRVNGdEtZbmIwWXZEejRpZFRSK0NXTDdicThOcGJPb3k5?=
 =?utf-8?B?SjlyU0xGdHpVQmlvVHJZR3k4VXowcHNZeXVRcncrYklKNWl4WUlyckVMZEJN?=
 =?utf-8?B?OVgrWTlGMU1lWHl4eVlEbG9RalVmS0hmUlk2Nlp6dHNKNnhYbzhZTWs3VEpp?=
 =?utf-8?B?anYzV0hyd01Pc2QraFQ4NE1IbWZHYmxxTjdvU3FWVFVRK3E0K0JycTlINitv?=
 =?utf-8?B?Q1p4emh5MzhCYktVZW4xSlQyZVhucVBxVy9nSmgrc2t3QXpyOWZHdTc0MVBT?=
 =?utf-8?B?RlFOL1BDZnBVb2J6emNaS24zTW55SVVGa09sNWoyVTE1a0liZU9kbzhQSTlL?=
 =?utf-8?B?YkZLc204aXRvSktCNkF1bWVZV2ZiWnQ4dXNhK3gzY2RIc2NQYW80dUthdVFZ?=
 =?utf-8?B?RDVObjBCa2VwQkVWWFZVd2VLTDBtUytqMFlKb3pDUloyOWwrdEdrQ3N4anlK?=
 =?utf-8?B?RmtmRmM3KzF5b0lsWC9qNjd5NmtpV2RWaWl6Z0YxSW9WNXFSdWUxbGlicE1x?=
 =?utf-8?B?RnJXQjVYRUFkNmZ0WmwyUmlabUQ4bWo4cDFNTlFTUUduL01pRk5ZV3UvVkhN?=
 =?utf-8?B?YmVKRnRlZ0ZrZEhBSS9KQ2drU1VseGtwd1VCdVNLR3J2cU0vMjVSUlRQbCsv?=
 =?utf-8?B?TGRGU25Hdnc2QXVQUXUxNy9WTE04dlZ5RUVHNGM1eHQ1YXVZeEJYdFRCY25I?=
 =?utf-8?B?Z1NTTWMyWlJqWlN6dmZOR3dFTGJFS3FiNERnNlI1Tkk1QlprM21HUE8xSmhS?=
 =?utf-8?B?MEc1bU52MWZRcEFDYjJwcUxta2o1R0RRb2dNMnQzNXpGWitIcU4vUTVSZmFl?=
 =?utf-8?B?d3ZPYmNOb1duLzlaMHJSUHovc085cHR5VmIyd25IMjYyQmMrWDl4aWo4MG8y?=
 =?utf-8?B?OEhsRjV4bHBKMDRudTRNWnZBY0NUQWt5QXZhbDhyWUp4eXRISU5zRUJYSjBo?=
 =?utf-8?B?YVVSYk9UeG1hbEFMNWYrQlh1cDZmZ3QyWWVaeURpSGdmbStDMGRTdGZsb2xW?=
 =?utf-8?B?c2VGOG1vRFRkbXFLZE52WjB4OHl4Z2tRaE54UldrSDF6MGV2QVZUSFVDaTA3?=
 =?utf-8?B?cXNHdlBnU09MZVdsbFErNnFxajRjZVZSRHEwcUJyYTdLamNOZityamo2VWY2?=
 =?utf-8?B?V1RISjc4RVVJaFpFNWFpZUYzVzFENFdTTElyRHIwUzAyQkZkdjBXZzI4U2c3?=
 =?utf-8?B?YkRoYVIyOGRyYUZ1eitab0NIQ3Q1QnFBYjEvV0tKUlZjSFlWYnUyRWgxblE5?=
 =?utf-8?B?VzhhR3cwWnVHMXp6WDNQamlJZ090RnV1ZG9adkgxT0NBNFdGSkl2SHRlRDdW?=
 =?utf-8?B?dVMxSExYV2NvL2krdEtzSzhZTWpIbSthT3p4NisrTEYrTUZtdm56ZWRFSGJu?=
 =?utf-8?B?K0ZXOEJ5bmR5QTBnZmQ5TXMxamc3eml4QTRoM0g4ajV2M2UzWWplZ0ZSbHFn?=
 =?utf-8?B?eTdyejZaYzZ3M2Y2UU1TOHUvMHBTT1YrVzE5SnBBQkxQTUxOdzRycGhNVGxG?=
 =?utf-8?B?NXVjNmZUS3ZWNVlFLzdIZ0tKMk9PWUIxcDcrTzNWd0J6V01oVUlSbXRxTFBM?=
 =?utf-8?B?dFVzekV2YzNueHlJaGsyZzJ1VzREbzFNWnpTZXhqdm5oNzQ0MGROaWM3Ynd3?=
 =?utf-8?B?bWg1VXZLeTg3QlQxWG5Od3gzc0pnYzNvSzQwTTUzSHE3cVhmVXVPTmNUYjZm?=
 =?utf-8?B?YTN2T0ZBZmJSY2JkbFgzanVkc2VFZDdiMHBGYnlwNWpDQ2IzTm5mZTZGQ1Ix?=
 =?utf-8?B?cU9OcGFMWEdad2tmcVFEaVk0NVRIU1p5SjBEdlE3eWpjT1hkUlJ0bXNGVWU2?=
 =?utf-8?B?QWdEQlVsVzRCU01EVWFZMzdwRTk1U0xQY2NVbll3Y0NUOGltL096VlQzZEJL?=
 =?utf-8?B?emQveGlVdHRXczI5Z0pZalBXWWl6bUE1Yk04M3ZhR256ejNORUE0dkErSDZ5?=
 =?utf-8?B?SzVGL2VrTGQ0SmYrSlNPbUlLNGFOWEdyMmEyYnpIc0Q5NGpOY2ZlaDgyQXA3?=
 =?utf-8?B?SExNdG9CdFFSaGJtSlZIZGxXL1ViLzZmSkI0cjZZMVZ1NWVkdmw2SnJqa3Bv?=
 =?utf-8?B?Q2QxcGpRd0FWenpBWU5pVFNaRDZGZUsyd3h2T1BNL0NWK0JvZnNRSzhsKzlG?=
 =?utf-8?B?TGM1K1E0U2FoUkgzenl6Wm5hSkhPNDZqTUFvdjRZOVF4V25KNnhITExUT1dy?=
 =?utf-8?B?ZzlSM2c1VXBxNFVGSkVRTVFsMHFuQUNBT0p6MVhERGJsYzBXK2RlUE11ckIz?=
 =?utf-8?Q?ahfYSgcOs2XGqMvrULA5D8urkGsdxvhzH0AGl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbcaa237-8de3-4568-38d3-08ded2c47f17
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 14:17:32.4694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2Ydl5WNDtXnU8sgunSMYYXX1xTYn54SUN4AaXZF1F3dh1q/SBi04MPqICHC4Znltm47W5aycf3m8SEjOPAoaorDjjC/i1IH/gvofzBRvyCNOkb+NcciseSXp7c9VC6p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11888
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:laurent.pinchart@ideasonboard.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,m:guoniu.zhou@oss.nxp.com,m:laurent.pinchart+renesas@ideasonboard.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65648-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,ideasonboard.com,sntech.de,linaro.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim,nxp.com:mid,nxp.com:email,vger.kernel.org:from_smtp,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8690A6C691B

Add new helper macro fwnode_graph_for_each_endpoint_scoped() and use it
simplify media code.

Typical example should qualcomm's driver (camss.c), the v4l2_mc.c and
rkisp1-dev.c only silience improvement.

Anyways, *_for_each_*_scoped() already use widely and make code clean.

Build test only.

Sakari Ailus:
	when I try to improve the patch
"Add common helper library for 1-to-1 subdev registration", I found need
camss.c pattern, so I create this small improvement firstly.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- colllect luarent pinchart's reviewed-by tags
- fix miss tab before \
- Link to v2: https://patch.msgid.link/20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com

Changes in v2:
- colllect review by tags
- fix typo and indent.
- see each patch's change log.
- Link to v1: https://patch.msgid.link/20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com

---
Frank Li (4):
      device property: Introduce fwnode_graph_for_each_endpoint_scoped()
      media: mc: use fwnode_graph_for_each_endpoint_scoped() to simpilfy code
      media: rkisp1: use fwnode_graph_for_each_endpoint_scoped() to simplify code
      media: qcom: camss: use fwnode_graph_for_each_endpoint_scoped() to simplify code

 drivers/media/platform/qcom/camss/camss.c           | 17 +++++------------
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c |  4 +---
 drivers/media/v4l2-core/v4l2-mc.c                   |  5 +----
 include/linux/property.h                            |  5 +++++
 4 files changed, 12 insertions(+), 19 deletions(-)
---
base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
change-id: 20260620-fw_scoped-5dab644510a1

Best regards,
--  
Frank Li <Frank.Li@nxp.com>


