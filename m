Return-Path: <linux-media+bounces-65378-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C5YQH1dIOWqCpwcAu9opvQ
	(envelope-from <linux-media+bounces-65378-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 16:36:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5F26B05C2
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 16:36:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b="uxLOmU/g";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65378-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65378-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 992B2304CF74
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 14:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182A726E165;
	Mon, 22 Jun 2026 14:30:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011058.outbound.protection.outlook.com [40.107.130.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401AF1A681E;
	Mon, 22 Jun 2026 14:30:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782138640; cv=fail; b=QaX2OmsFOx42G+zqa7PCTMXFEPY3iGIn9XkPIykTOr3MBPTO1oVZwrQv6gwXJJGyW6D3SIGtZ4afgYwWLTAVmaKShgv++W7oX7vziOVPpqpaPmCcMOI1OEf9jtzXR3Mhs8ZLQUX6yMeRq7kGUXw5CbJvXGWHwjVnixihK9xW5M4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782138640; c=relaxed/simple;
	bh=o0n5t5MXVYrBfYMGgAcaP6fExsALJXrw+ZgOLUmH8KY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=GEhRBLY5gYbiuTW14Wp5fTStfkN/dIRgY/9Ji+ECNvOaeMvNq9hhsGT0LI1HCQWWU5WQ7k70fUX+oAvxq+o39Kpy4hV8JBssumPaI1qwGEFuqDszSI66imG94fXVpHqKseKINxZwla0LBy7YjjPF1Ze4fxaLeoMPMtDTPSDWKvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uxLOmU/g; arc=fail smtp.client-ip=40.107.130.58
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0+owfQOBJ7q1KgMN0cdD+b1Hpf0+Mrkxx3Alal99Cl4rLnxCVlJk0FvOIfAz99WUCZavUDPQAE+eJCSsIcn/lUj3iozcZ/zGrd5ThLTLlsh8wtQjPb/LM30/8uzTbuWcUmLenh+3YOvtVSP11z74tTCIbyy8eAM6QxJCfBTlOTWJOhXmp1LrwdIbPmfFk8uG4aYY/9H9s4ve6jiAZDPWn065B2yuhneahuRLpznuZX9xBSIzxNUyjRTWCedi/hNsxTxHL/o5IlM1Xh4NFRse/konPaNYaRthkCD0jyIMrroUHmn6T8ZN4cyyYrjIBUWWj+cswQAPksXBAoa1tnm/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2ZXRNfX9yaOgVUBEaEfSEv6mrZPWfmfCUtLnARN6Ko=;
 b=COCUDtLemR7wCkLcFvGOhRUBuGq0RUfMoY3nwL2zCHASyZuXmfyRQ9PSi4l4hUdu1NDA0kvZIiz5HLbr1EQYrTJ/An8kOWAtrT90q3rYon5y9yvgzQqKS4Aqroc33uJlzytvLzZZs0coPsLbVUc3sWXILD+4MFd2+tq23zbe5SObEYNGlhzwJ46SMowjTQG+9An/z528AhMBv2dSl/m7Rzxwzy/e7WuoryXgu2zGZZQMqeCdtyszHh3ShMjoYNWRkiaoDVzk+1OV/sUzIHCHrDttjA8zebA3dhwwIl6WYju9yeT0e4ZDlIMSB8iGqTNqleZdcpClGRjisqz3PnojVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2ZXRNfX9yaOgVUBEaEfSEv6mrZPWfmfCUtLnARN6Ko=;
 b=uxLOmU/gvIXsQx8UjHRkfYvPdyHrVfbpU+7N/M6Dp20/wO8liNrQwK5zIGA1tAoZ8OlKkcyrfH+ys0KLs2++QbjcRfddK7qB19vRNWP0tZVoNx2Ig364NZMgZhcCun8FSSJtXsRI1RCXR4YEvKXwjm+Ox2suifKgwODKJG5cKb0EDe+W/IeLUVu6ALoTcetXBMo5i9CpIs7SJsRKBG0PtadR1rsdig5f6J/ChVXhzGPBsoywUscfwP6fhzRM4jQCNfnC9qvi391wY5OWrO5ZbsjP2Xz5xNWxmAgyQhrWJz6Xo3IvBc1gz8aAOUogdmjUCddHAece7BDDTC+XjhNQhA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB12304.eurprd04.prod.outlook.com (2603:10a6:800:304::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Mon, 22 Jun
 2026 14:30:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 14:30:34 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH 0/4] media: add and use
 fwnode_graph_for_each_endpoint_scoped()
Date: Mon, 22 Jun 2026 10:30:10 -0400
Message-Id: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPJGOWoC/yXMTQqAIBBA4avErBNUykVXiQjTqaZFhdMfSHfPa
 vnB40VgDIQMVRYh4EFMy5yg8gzcaOcBBflk0FIbabQU/dmyW1b0ovS2M0VRKmkVpH4N2NP1ver
 mN+/dhG57B3DfD94gNIFtAAAA
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
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782138630; l=1362;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=o0n5t5MXVYrBfYMGgAcaP6fExsALJXrw+ZgOLUmH8KY=;
 b=eToJbjj+TRgfjnXfQiIoZC/Mj3JzY4tpc6ykLIrFIKEDKfLX7P0eZ40tU1Ua+F2AAFhk0zpsQ
 SRbW5dtAWecD7s0M1Hkk+Wo+eDzTSAatz1artBp2iRe6gzKih1tD1HE
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA0PR11CA0113.namprd11.prod.outlook.com
 (2603:10b6:806:d1::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB12304:EE_
X-MS-Office365-Filtering-Correlation-Id: 405d701b-e857-4eb8-19b3-08ded06ad240
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|376014|7416014|921020|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
 VZP/jHyEARBZx7uS0yr55HchgzWNujDORZh4yTDuVLJMuItRUOhT4I1sz6HNRI4UTG1v0GthWKfa4xIKp7ISNCY4IS8fDc/MZ6TZyETJ+RhsTE0Z1pZq6I7l5tbCGSNKrudC+rD4gTEjfE/kKA+hQeRSgiYjrLkV388ZgQvsoNlwZS6uFx83huOYCUfHl/W5OR8xHw/i7nEyfBpjP8NEj9PEKyEkaCuWrwg4J0qwq8kOFJJQBUUXqRNG9m1SWmiB30RkkEdd2JCOJIlalZvTsRoofyXTNeHFuTCVgGcS92ImNNXJxpU01BCQfBKp/fWdBX9XrpGGWP/t0mpyEwe8Ty+1KpXOTs3p+qoZpMEanYXbKyH8pg13yv1yqU6QzG3ELGM1yYYzJFJXzEB4vFZbL21eP3A7tf/qS11wlLVI/i2e42LqdxMIEZD1jikiY2wLkKOQJsMV53+ZQ2ntN0stAQNZ7TvN/9v5FlaOjbxD3fOartYrbueILepzr+EwWhPN7BxZSx4tsldfjXt/kwD9g4TF0oEUBDLGS2eDPupNlC/IDJwwkNCZXq4xVB2GCY3kOOy/RZMagonTvdXt1BE11kDYbPinuAB6CDK0upAuO5ZG6g0Xa9OCPX+IG7uxkotGAtpXn2ILHyJXWmINQ51OMeaYuN9kzUpvANfxWMWA5u/YqHCeFims9ZXQUKTinRvj8r/8eNvFrU5UWV9LGWew3g==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eHZzT01ZekVSWW1SQ0UzNzQ5SEtuRGROWVJPaVI0NklkMSsvTlV6aCsvZEwy?=
 =?utf-8?B?dDRKVUExaWF4c3crTDJ0VEJVODNlRktOT3ZiNUFTRzJ5MjhIWE5seTcxZmFG?=
 =?utf-8?B?SlhpY2FFbUJJTmlwcktDaSt4NmQ2cjZtVHI0cGVLa2lCUWdrVk5FMytjUVpP?=
 =?utf-8?B?Zy9EVDBBMDZnSHdPTjJmYk4vbVBaNjhxdTRDQnRhbWFYajZyUjc2Ly96dTdR?=
 =?utf-8?B?UnAyYmpwdk50NlVFSGFpV2s4YTU3bG1ia2hYaVQ4SU5Fem1wNHh6OGF5aFlQ?=
 =?utf-8?B?MnpjcTEzdWEwTEx0WXpSaDJOcXJsSURscUUrelI1eDdOajRPUkQ3VjF5dC9T?=
 =?utf-8?B?MmxWb21lYmo2cnJYNG4vM3luemUxVzh5dHhURzdLOE5yaFFaQWgxREVGWWJN?=
 =?utf-8?B?MENrOG9aTmV1VUcxZXAxMGxWR3UxQ3lzS1JtQ08rcUZzbUdRQ1Z1a2NsL3dF?=
 =?utf-8?B?dmJBYlVWRkRNOFU5RkZyZ0RvSmZIRTg2a0Q1Y1QwZzR4R2p6T3cwV2hCeldy?=
 =?utf-8?B?c1pSRVNJVzloSW9wL2RrNmZMVXB5by8waWFxTjgyWWV4ZGhqUitBVnpZdUtp?=
 =?utf-8?B?SjhlNnZOZm1HUmM2ME53OXFlRUtTeG9OdS9jQ0ZTM2VFbUxyQncwM0xoYVZk?=
 =?utf-8?B?QXd5WUdvSXlYWUZtcUJ6VHJVMHRPQmZpUE9HMUFNaU9ES05HaGw4Yms5NXFX?=
 =?utf-8?B?aEJYTzZlVDlCM1JLMUpxL1UvaElEMjE1QmNERzNHK0VDV1BzOHJ6Z0hZWGlG?=
 =?utf-8?B?M3h3VitrbW52QU85TU5ZQW9zY0xpOEd0MFhjaGZXUS9XdjVIRUNCUDJiZ1Zy?=
 =?utf-8?B?dXppZ2Vqbi83U0Q1Yi9oRm1yWjN1NDBjamlzbzZhWlhpR0tYZHljWHk4d3Fa?=
 =?utf-8?B?cjByR1ZJekd2akJxMkN3TGd6WnpVdkhPT0FueHFhTUI4bStvYld4emFnQy9x?=
 =?utf-8?B?czBnWmlQOEdLY1hlUHNLVjlSYXJ2a2krNGJsS3dEQjJxTWtjVzdxc3ZKNXB1?=
 =?utf-8?B?MXVUZFRJeVI5N3Rta2R2clFYWjlNTStLSVBpVThZSU5IQ3FTMEttS1E2T3hF?=
 =?utf-8?B?SDlJOTkxMDIrWE9uZXNiY1hOWWhNS255OFJ5c3BYVThGcHE4MkpYdXA3bEZv?=
 =?utf-8?B?aktVK25OWDdySXVXdkNETFVJWDRiOXk2bmM5bHBBckRLUUtSZFYxSlkzV3dL?=
 =?utf-8?B?N3V6NTVwSUxmLzNTZXlpNGsydlg5c2JlV2NGK3M5SnNONlptMTlFblQ3SGho?=
 =?utf-8?B?WS9WdjNWeHV1RmNRUzloZnFiS3ZoQUp1YXk1M3BZaGI5TmZVeS9nMDk1NXZq?=
 =?utf-8?B?NUg1b0hJZ3d2dlkzNGJxTGUzYkVXM0xjcGpjNnBLOGJIVXhlUXhBSEhSaFAx?=
 =?utf-8?B?SUxnMXpLUjBKS0dtNFRTaWM2ZXUxSzdncjJrUmEvTlZrNEw1S0dCQjBsRmxP?=
 =?utf-8?B?bHFyMzlyZGFacXltTlF0NWxNRWxQQWNkSWpxZGtWTnpRZjdHZE1seEJzNWJm?=
 =?utf-8?B?WGxjYUVHcC9GZS9LUXRlcGYySzFjVnpiTUZNR1BSUHdHcFlSLzJLV01JdUh0?=
 =?utf-8?B?ZkQwUUZlUlBhemhUeEhNUW1zUTU4QzQ5Y2R6NHdmRitNaTRyQ0E5REdQaEJr?=
 =?utf-8?B?d3hDUjdrRUhrTXI2aXNCdnYrN0V0SnJ5L0hUZXNMdW8wQnBnYkxLbGJXQVpS?=
 =?utf-8?B?S29henpBZll1K0M4N0JIOWVhUHZoWUhFdzZmNnMxdkU1eElMbUlaMHp6Z3J1?=
 =?utf-8?B?Y3ZUais0aGNZRGQ3RVFwWUxwNVAwQUJhV3IrNzY4NWlJT3lzYUtUZm10Y3VN?=
 =?utf-8?B?OW13eW5nUVdEbEFROUtHRnllcnRwcmJCYWRyUGNVWGRZdU5Yb3RtMC94a2JC?=
 =?utf-8?B?UmRHQ0ZwMy9aaUFOZGRiUmxwWkFrRzFHNHpRNkQ1VHQ4aDFyLzl3VGlBV0xI?=
 =?utf-8?B?L0R4ZnpBWHV4UmVVaFpwalZyZzJwbkJTSXNXUkVSUTVGV1VDdWV0Z1FhaHh3?=
 =?utf-8?B?MklMcWtkS0l4S1ZhM0psV21Ha2MzU3Npb3F5NUlNcFd4NTJnZWY2SHhXSlhR?=
 =?utf-8?B?OFMzYnRMRlZtR2REdjBCR2JUTWtmRm1aSWE2bVVPNUlUZTlGWnZzLzJuNDJq?=
 =?utf-8?B?S2E3VGRjZGVnZFd0Uy9WcGlRWXlqdW1yYW4zOFdlR1UzYmlNY1FYc0p5QTA0?=
 =?utf-8?B?dlc4WUdwYXJzTlMyY1ByOEhjK3p0YnhwaVd1akYzOU53cnhVSml0SXdNZGQ2?=
 =?utf-8?B?WHFIU2NTcXNpWWIrOWQ0RUJBRy9TNms5dGxUaFZCOW0xQVR0YWFFdklFVmJ5?=
 =?utf-8?B?S3ZOMnEzL281bVJ5Q0lFUnJ2U1dtbUJxdjkvSk9SRzhtVHMwTHJuNzk2NzB4?=
 =?utf-8?Q?v5aO24msCiXmGVtc=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 405d701b-e857-4eb8-19b3-08ded06ad240
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 14:30:34.8087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aiNVLTbwwp+j5Iw/WZgeGLPsnKbSCMwnN7SkG9C2+UK70jPQgQ+XBxxWH7Zdopto2WCBfaCoJxYzm1GjBkDJxDr7bOWOF6R8G48TfPQpoOg899ffVZGg//tJBuORw05D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12304
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:laurent.pinchart@ideasonboard.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,ideasonboard.com,sntech.de,linaro.org,oss.qualcomm.com];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-65378-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA5F26B05C2

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
Frank Li (4):
      device property: Introduce fwnode_graph_for_each_endpoint_scoped()
      media: mc: use fwnode_graph_for_each_endpoint_scoped() to simpilfy code
      media: rkisp1: use fwnode_graph_for_each_endpoint_scoped() to simplify code
      media: qcom: camss: use fwnode_graph_for_each_endpoint_scoped() to simpifly code

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


