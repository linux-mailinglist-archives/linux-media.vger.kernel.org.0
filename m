Return-Path: <linux-media+bounces-65863-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w7fFKRsnQmoa1AkAu9opvQ
	(envelope-from <linux-media+bounces-65863-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:04:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F41BA6D7469
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:04:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=WqhGA06U;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65863-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65863-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D9C8303CE07
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 07:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458E43C3BE2;
	Mon, 29 Jun 2026 07:42:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013015.outbound.protection.outlook.com [40.107.162.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD933D9DDE;
	Mon, 29 Jun 2026 07:42:31 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718960; cv=fail; b=O1fLIeKxljFBwI+Ky9b8eTBLgzYnPPM4nq/Xyd2zP2OfIZDFJ7kcmpcbdYr7E4hqaGGcF8FP8KqaQ5nZjDCANOnQp4qendTuWZCBe2yULdPvFvLgDbfvmeBgr8dKMuHIqAOfIRmK4VnRlCFuLIb+pT+pWGNvvK3c9IAvpylPAVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718960; c=relaxed/simple;
	bh=aELTHbTcrZXxfNMain4pLWKLDyCMfG9Y3lXQf4B5dew=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LWLCvbzUVpboMqGmjsn1ISl0IHQZ/G0/2mB8IZS+i50IooriJwnqKbXaTsXzMast3bvpLkRkd1kTrQjt/xnYuPQ2pmrN5i8UBmCb3GpHGdLVMYGcMx5/WnJCCb5E7oDL4AOm4DCyKJKGDwBfbu0T1Jdrxr7uBjzXuoNeklbaCpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WqhGA06U; arc=fail smtp.client-ip=40.107.162.15
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXa+/3FZnyHQXMyfer9FDg7rAawfye63ixfYerNCyb8GFTXnwNimd2/75x2raIMi/Vb+sTrwEvcX56cp03rAp9oskVh6gJj29NSN12dh8dzregG85s6cJ5QGGFZIbHwHwAbygB/rSUREORuxwLi8XUKE2EQ01ntNXf4vVLbNAEaaEJWMnfhB1faZKBgcj7H0Wr2qTmtNBM9a19bAq9W/rd95E1XKuq+UaSVhUxVDYgtxZ+l08AfFreTZjAQXN2P1u/dCK4rrZXl+GACxO9SJlSkskWWpvTuRWGfvMN0CB6ogtDNHhBiejvWtu22MfT/zt192B8DjEd3r6snDASWTYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLmVYzjIeUaRKxS2S8XNQ5KWaucqB34bZRZKP1mtzHU=;
 b=VGg7xuxiAvXa7YHbzYFr+V/jQ3gY5S6RPHEmDWbutTCZlIPf/o61z+TTqtV+ZlhX41zb2sH7K3MANTE2IdqboopvUFS/4rUF4ThDVQqn//PIMHdIyoTPXp/bG3SAvVVmWh4RxIvMyX4IaZFd1lcpm8yQbPcrvBXuzc6ixFkeTSf+r4s82GU7JLHPdUzKfYPkjzTkdUJlkpmYTZLHQW30YL/4VzBVDohIKElFK/kKE/eGHKT8H9wovA6bGt4xJCj1pBU5Dvxw04ofa0PpsRORsSCF0so0lSq+g3uUD5GxmwKrJNV+2oZmCr7VgTzltdyyZF5htryEWBczr/rRyLyeMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLmVYzjIeUaRKxS2S8XNQ5KWaucqB34bZRZKP1mtzHU=;
 b=WqhGA06U+hh5h/sHSF+wtxWXjCqnlBW3WhTr7BB+j3IOwuf0zCeg3++O3QSLDPV0oGF7xaMADavFEnrbCTSHK5dbR9p1wJA+FvgHNR8ShJZE/uYd80dnkrIvh6LXqzpdhXbZ3D24aW5rK9ZUibANgnTizOGXXgWeBm5xICjg5k9U0nEZj7BxEbC+tn8OWfYI9C4vWMsyf127ioPeBGtyxI3M3l7DyOsQFwZMadrjVTaztd1dmHtfjiNy74Ax43aryX0WG4lqL0Dk8c8R4R6kY+vRzyeU0R1nrEhWzSFCdaLw1COZfSSCsDARfC8r8gyrnyYGHMsUNq4DRYDS2n15Aw==
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AM0PR04MB11932.eurprd04.prod.outlook.com (2603:10a6:20b:6fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Mon, 29 Jun
 2026 07:42:25 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 07:42:25 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 29 Jun 2026 15:44:56 +0800
Subject: [PATCH 2/5] media: nxp: imx8-isi: Fix per-stream reference
 counting for multiplexed streams
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-isi-v1-2-deebfdb1b07b@oss.nxp.com>
References: <20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com>
In-Reply-To: <20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Christian Hemp <c.hemp@phytec.de>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782719134; l=8285;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=aELTHbTcrZXxfNMain4pLWKLDyCMfG9Y3lXQf4B5dew=;
 b=PWHgCpu5xEESH73HLf8K4kfBTQ1WeKxU3EavqQsU0n5zSy7OiJtMTbZCUXvVPCvpPNjUU2qEt
 liqtf+pRTIWA+e8V8RC1kvLbLalFEKnwoh2ngtMaph2ufzBJXe6uwgZ
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::12) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AM0PR04MB11932:EE_
X-MS-Office365-Filtering-Correlation-Id: 019fcfe5-72ec-4a26-4b92-08ded5b1f678
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|23010399003|7416014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 2voIUfn6/cHo4lW5xM03mO5cOcUUajSdHNu70fD70+jd2jg9LAQKVCncZzy4BZTY3SRJjeSqSYfBkS8vUY3wAmayRe7z+2/Vd8Z6Eu90qKUhP5LtvH6sPKiol7EvEOi/iDNEPiOeGILh4xI0vJfcelJ5gg4yJo+qxHadylJTKyLC2VMCmKsreYNZVyaS8ojEgDcEgvy6Am4MBiw7krc7tAe5tnTLQ+/klDM/pf895x5J9TXbLoUkuqVQvBPnQRI4Ae9LkCbfo+anYpLxfRqwfVTJG1nYByJpEdXb50Ua0duPZLSxM0YWuQ5hKFS1lstlojDP/nN1po9tQXgEGcCFe8xLO4XWbzJ/VY5TlweXjEheQQ0/V3VgbNFV6Noqfn658xqx+XFPOue0CFjzQ27TpsT/z80qJhhBfl1uOvAgTdq6GqA8JxZX97bg4cKz7fN70fcSio0o15M+F+tP0mO3rh05TifmqpJASM60Y0z1Eq/XPdqV8sZI/VzF03w95Ig/ycwYinaMsGWqKDFj4k/HaN6fz1IO5com20ZHb0FBHWMR8UaMwgIpkkeOKwrgXhx6YK+TtMzo03w35vbnCUjxRBlsPbhYA0fU5+bB91+ISRU9wdUnD2EF+wKBJFnvusCp4xlnWn+MPBYxPqsGpHwGLEpgCneFqzbcZm4rtDwWBpc=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(23010399003)(7416014)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TFNURDRTYzZpbVdyTzVoeDdVT3laYzQxa0p5cDZVc29GNGJxcTE1bnc5M1cw?=
 =?utf-8?B?ekd0VkJxU1djdzhxdS9oSkNJVVAvN25CSTBCOWw1UG9IbmNWNlZmQjZ2YXJW?=
 =?utf-8?B?YUtBL2R3RUVBNld4WVU2SFpCTlhzN1lHQkZQTTdRMlM1QjZMNTNrSjlMQnJB?=
 =?utf-8?B?WENveEtNc3NiVXgzUG04UFhCMno0aWd0aGwyN3dGZ0l0MDg1bUhpYXdSZFY2?=
 =?utf-8?B?MTQvbHVRQTBDM09adDkwSlhRN0J0SG1vZnJuS2ZDNXNRdlhJMDd2ZjlSSU9q?=
 =?utf-8?B?ZWpFdENwemoxcEY0dk5TOEo0d0NuejREN3dLanF2cytUc0RtRy80ZzBQYnRi?=
 =?utf-8?B?ZEFISGYvdlRuMUhjNW5GbjBhdzU3TXFkTm13a3MxQ1ZpSXJwZHdqakx6M05a?=
 =?utf-8?B?cnRnM2pwdmFUQ0FUL0k4dmdOQU9rNXFQSzJnNldXbWdybFdzTW5RNjZIdFEw?=
 =?utf-8?B?Ymw2ajZXWFFwb0NrQnhrV0F0TU9UUU1qaE9hWFdhKzZUeFpCem1MeWptZzhy?=
 =?utf-8?B?SUZTWDVrRmxBVEk3L1hIdjhlZDlvRFIxVWF0NlR2akZRWUY5VWdiYTV4UEht?=
 =?utf-8?B?cURNaTUyVjRzRkg3NnZScStKMElENloxODJ1a29oTWk4Uk41VkVocjgrNFl4?=
 =?utf-8?B?TnJPQUdnR2JjamV4Qk9GUW5rWE1wUWE4VmJuZVp4YjVKeWhjc0tjNkhuQit6?=
 =?utf-8?B?WkFGU0JCbUxTVVprWEVHNVJmcGE5cHF1UDVqQW5OUzVLT3U4bWxsR0QyNXNN?=
 =?utf-8?B?WWNud2tsZkh0Wk5vQzJZZEszaGF3UU5wQWtWeGZsQVNhTytoTmpBWTBVME16?=
 =?utf-8?B?U3Rxb1BRRkFxNFA4Uk9DaDhtdzY2TnYxZ1d5SFFtMUdTTyswbXpNaXZHM1pS?=
 =?utf-8?B?UWRuZC93OTF3cktDdkswL3YyMGRqYmxCYjdwL2wyd1JuWFhkWWlubVZMQkpT?=
 =?utf-8?B?WVl5QWN3WUpKaElFdVpZMHh3VVpYRjNPZmd2U1J4WjZXUER6emZPR250K1Y1?=
 =?utf-8?B?MkY4UHk0Nm5NeStRbUIrUTBXaVZkbWRmRUJtdFRwS1Q3SVVROVFQVVM4NVpl?=
 =?utf-8?B?Rzl6TnppY1dXVE8zRVJXVmhMVmZWWThGOHhuZ0lmVGVrZDVIb1krN25pTW4x?=
 =?utf-8?B?cDhtL2t2aG9GUkZJeDlicEx3ekR0dndGSllzTjBpYU1LdEU5WGxpVUx1Mlpp?=
 =?utf-8?B?dG1wK3BENlpGbDRKYVFyRm4xUy82NHh1ZUdJT25sR21FSlcvdTBHckdRNkxI?=
 =?utf-8?B?Z0g0d0tDODRYQXE0UUdsZk1vRVVHS3k5ckhUdE8ycVRJSzNKMUw4MFdtSzZO?=
 =?utf-8?B?R2hUWXVNV1EwTGdINnFzM2FZMFJiajdReDR2eHdZUHpnUXRNL1RxNlN4VUFI?=
 =?utf-8?B?ZVJPR2FWNmFmS0hNOUlTT3U2UTc5OHBPdXBNWjJ5cTBFR1ZPTDd4czZ0Wldm?=
 =?utf-8?B?cWRobDBoMVBUdXpnMWRSdmsxaCt3VXpyQUQ3WElRaVNQcFRZYW5Xa1ZsUFFU?=
 =?utf-8?B?cjZ6N1NsNnFCZ0JMT1liZk9ud2VPcjJIREFKa1NHZUZaZnNna2dVYU02NjQ0?=
 =?utf-8?B?MnBoZW4vNnFwZTJhZ1E5Z3ZndXd2WEFyRStPazl6a3NWMktkellWRm1ScnRT?=
 =?utf-8?B?RFVxaDNPK1R0T29DQk1NM1pjKytVczRxQmtBbTYxOUlicGYxQ2xJMERLNjBo?=
 =?utf-8?B?NG5lcjR3S05ncFFqZlM2aGVmRzdYUVdadkRHTU1CbUwxVTU1SVJSQkMvMXh3?=
 =?utf-8?B?OWF6ZnUzWnFIUDJCY0ZtOWk3ajdxc1pUUEJpSEU3MlUveGtndjJlYjZPOFAr?=
 =?utf-8?B?RXlsd3hBZ0ZJRnN4bUY2ZmRXSGl2d1psRk80QnJLTlk1LzI5bTJSdnc2Z3Fs?=
 =?utf-8?B?dlkyWXk3M3cyK3hxVjRXTEwrdUdzSnlwK2hybVhiUUptQXg5QVVEQ09abUlp?=
 =?utf-8?B?QXdKdXRESEY1MHBJc1FOWHFhNXhnM1VWbVBwbHFodmhTQ3NTd0hCRjU1TVk2?=
 =?utf-8?B?enRsYWNxdkRKZWVlUUhlWFZ0b0V3dE9OK3RPQ3c0dTFueUErZXphQndGSmlo?=
 =?utf-8?B?L1FqNzNVWkJadWQ1cVpNOXAreWF3Z21IY2tEeG92R3F5N1N5aDN6OHNubndz?=
 =?utf-8?B?RXZFOGJHYVQxRk1zQnJtMkMvcVdRcFpsQmM1NGEydC9POXNCTVZNU1RCZG1x?=
 =?utf-8?B?ZmV5K3ZzRGVFZ2o4WDZOd1UwbVpFTExXeHg5dG1qMzUvMWorMU9XTG5hQkEw?=
 =?utf-8?B?aWFHTi9jMEFGaERuR092ZWVBb29xSk9tQzlQZVlyS1EzVnhIMkFiYmVMNFp3?=
 =?utf-8?B?bTJEejFCblBrb214RTh0b1Z1c0gxM3RKVXIvYlY3SVpyU1MyYVRyd0xtUzVv?=
 =?utf-8?Q?w35q1Ic3hJU5g832fgq4zh6tixfuCkO2Yv9R9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 019fcfe5-72ec-4a26-4b92-08ded5b1f678
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:42:25.6470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jm9out3S726ONe9fhdqh3iXun2koH99BgOBIr4g3lzQh2dfZYX6ngiUguBoiuNVAqg0pyFmYK9O+YPFuF+1xY/XUyNGEBiZwpEA2ooJN7+qnZ3aDzTDkrlm2eaeO/wza
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11932
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:c.hemp@phytec.de,m:s.riedmueller@phytec.de,m:jacopo@jmondi.org,m:aisheng.dong@nxp.com,m:guoniu.zhou@nxp.com,m:linux-media@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:guoniu.zhou@oss.nxp.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,phytec.de,jmondi.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65863-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,vger.kernel.org:from_smtp,oss.nxp.com:mid,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F41BA6D7469

The ISI crossbar fails to properly enable multiple streams from different
virtual channels on the same input pad. Only the first stream gets enabled
in hardware, subsequent streams are silently ignored.

The driver uses a single enable_count per input to track the input state.
When enable_count is non-zero, the code assumes the input is already active
and skips calling v4l2_subdev_enable_streams() for additional streams:

  Call 1: enable_streams(stream 0)
    -> enable_count == 0, enable gasket and stream 0 in hardware
    -> enable_count = 1

  Call 2: enable_streams(stream 1)
    -> enable_count == 1, skip hardware enable (BUG!)
    -> enable_count = 2
    -> stream 1 never gets enabled

Similarly on disable, when enable_count reaches zero, ALL streams are
disabled regardless of which streams are actually still active.

Fix this by tracking per-stream state using:
- enabled_streams (u64 bitmask): tracks which streams are currently enabled
- enabled_count[] (array): per-stream reference counter to support the same
  stream being enabled/disabled multiple times

Now each stream is independently enabled/disabled in hardware based on the
enabled_streams bitmask, while enabled_count[] provides reference counting
for scenarios where the same stream is enabled multiple times,  such as
duplicate cases in the ISI stream.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   4 +-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 121 +++++++++++++++++----
 2 files changed, 104 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 7547a6559d4c..bb2cfba27e20 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -185,7 +185,9 @@ struct mxc_isi_dma_buffer {
 };
 
 struct mxc_isi_input {
-	unsigned int			enable_count;
+	u64				enabled_streams;
+	/* Counter per stream */
+	unsigned int			*enabled_count;
 };
 
 struct mxc_isi_crossbar {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 29f14d30dbbb..a4a063c60c76 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -345,6 +345,8 @@ static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
 	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
 	struct v4l2_subdev *remote_sd;
 	struct mxc_isi_input *input;
+	u64 streams_to_enable;
+	unsigned long stream;
 	u64 sink_streams;
 	u32 sink_pad;
 	u32 remote_pad;
@@ -358,30 +360,47 @@ static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
 
 	input = &xbar->inputs[sink_pad];
 
-	/*
-	 * TODO: Track per-stream enable counts to support multiplexed
-	 * streams.
-	 */
-	if (!input->enable_count) {
+	if (!input->enabled_streams) {
 		ret = mxc_isi_crossbar_gasket_enable(xbar, state, remote_sd,
 						     remote_pad, sink_pad);
 		if (ret)
 			return ret;
+	}
+
+	/*
+	 * Track per-stream enable counts to support multiplexed streams.
+	 * Only enable streams that are not already enabled.
+	 */
+	streams_to_enable = sink_streams & ~input->enabled_streams;
 
+	if (streams_to_enable) {
 		ret = v4l2_subdev_enable_streams(remote_sd, remote_pad,
-						 sink_streams);
+						 streams_to_enable);
 		if (ret) {
 			dev_err(xbar->isi->dev,
 				"failed to enable streams 0x%llx on '%s':%u: %d\n",
-				sink_streams, remote_sd->name, remote_pad, ret);
-			mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
-			return ret;
+				streams_to_enable, remote_sd->name, remote_pad, ret);
+			goto err_gasket_disable;
 		}
+
+		input->enabled_streams |= streams_to_enable;
 	}
 
-	input->enable_count++;
+	/* Increment reference count for all requested streams */
+	for (stream = 0; stream < xbar->num_sources; stream++) {
+		if (!(sink_streams & BIT(stream)))
+			continue;
+
+		input->enabled_count[stream]++;
+	}
 
 	return 0;
+
+err_gasket_disable:
+	if (!input->enabled_streams)
+		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
+
+	return ret;
 }
 
 static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
@@ -391,6 +410,8 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
 	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
 	struct v4l2_subdev *remote_sd;
 	struct mxc_isi_input *input;
+	u64 streams_to_disable = 0;
+	unsigned long stream;
 	u64 sink_streams;
 	u32 sink_pad;
 	u32 remote_pad;
@@ -404,19 +425,36 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
 
 	input = &xbar->inputs[sink_pad];
 
-	input->enable_count--;
+	/*
+	 * Decrease the enable count for each stream. Only disable streams
+	 * whose count reaches zero.
+	 */
+	for (stream = 0; stream < xbar->num_sources; stream++) {
+		if (!(sink_streams & BIT(stream)))
+			continue;
 
-	if (!input->enable_count) {
-		ret = v4l2_subdev_disable_streams(remote_sd, remote_pad,
-						  sink_streams);
-		if (ret)
-			dev_err(xbar->isi->dev,
-				"failed to disable streams 0x%llx on '%s':%u: %d\n",
-				sink_streams, remote_sd->name, remote_pad, ret);
+		if (!(input->enabled_streams & BIT(stream)))
+			continue;
 
-		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
+		if (--input->enabled_count[stream] == 0)
+			streams_to_disable |= BIT(stream);
 	}
 
+	if (!streams_to_disable)
+		return 0;
+
+	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad,
+					  streams_to_disable);
+	if (ret)
+		dev_err(xbar->isi->dev,
+			"failed to disable streams 0x%llx on '%s':%u: %d\n",
+			streams_to_disable, remote_sd->name, remote_pad, ret);
+
+	input->enabled_streams &= ~streams_to_disable;
+
+	if (!input->enabled_streams)
+		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
+
 	return ret;
 }
 
@@ -447,6 +485,42 @@ static const struct media_entity_operations mxc_isi_cross_entity_ops = {
  * Init & cleanup
  */
 
+static int mxc_isi_stream_counters_alloc(struct mxc_isi_crossbar *xbar)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < xbar->num_sinks; ++i) {
+		struct mxc_isi_input *input = &xbar->inputs[i];
+
+		input->enabled_count = kcalloc(xbar->num_sources,
+					       sizeof(*input->enabled_count),
+					       GFP_KERNEL);
+		if (!input->enabled_count) {
+			dev_err(xbar->isi->dev,
+				"failed to alloc memory for ISI input(%d)\n", i);
+			ret = -ENOMEM;
+			goto err_free;
+		}
+	}
+
+	return 0;
+
+err_free:
+	while (i--)
+		kfree(xbar->inputs[i].enabled_count);
+
+	return ret;
+}
+
+static void mxc_isi_stream_counters_free(struct mxc_isi_crossbar *xbar)
+{
+	unsigned int i;
+
+	for (i = 0; i < xbar->num_sinks; ++i)
+		kfree(xbar->inputs[i].enabled_count);
+}
+
 int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
 {
 	struct mxc_isi_crossbar *xbar = &isi->crossbar;
@@ -484,6 +558,10 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
 		goto err_free;
 	}
 
+	ret = mxc_isi_stream_counters_alloc(xbar);
+	if (ret)
+		goto err_free;
+
 	for (i = 0; i < xbar->num_sinks; ++i)
 		xbar->pads[i].flags = MEDIA_PAD_FL_SINK
 				    | MEDIA_PAD_FL_MUST_CONNECT;
@@ -492,7 +570,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
 
 	ret = media_entity_pads_init(&sd->entity, num_pads, xbar->pads);
 	if (ret)
-		goto err_free;
+		goto err_free_cnt;
 
 	ret = v4l2_subdev_init_finalize(sd);
 	if (ret < 0)
@@ -502,6 +580,8 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
 
 err_entity:
 	media_entity_cleanup(&sd->entity);
+err_free_cnt:
+	mxc_isi_stream_counters_free(xbar);
 err_free:
 	kfree(xbar->pads);
 	kfree(xbar->inputs);
@@ -512,6 +592,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
 void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar)
 {
 	v4l2_subdev_cleanup(&xbar->sd);
+	mxc_isi_stream_counters_free(xbar);
 	media_entity_cleanup(&xbar->sd.entity);
 	kfree(xbar->pads);
 	kfree(xbar->inputs);

-- 
2.34.1


