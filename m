Return-Path: <linux-media+bounces-14369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA2291C7F4
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 23:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83214B23C98
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 21:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76747D3F4;
	Fri, 28 Jun 2024 21:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b="JIaZUMqx"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2110.outbound.protection.outlook.com [40.107.102.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2718B1C6A4;
	Fri, 28 Jun 2024 21:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719609436; cv=fail; b=dQjgxMhBKZWEyyBLwWuL/5kOnyG6X0n5rTdr1bMFslGbWJk2/UQsvHXM0DnHyLMfaLoI1NRgKhAt72L4u8uqVeYtjb2zgRxIxJPNI31/XKw2aUxahodI5dQpv7nKyshPodZi3lifNQHcYe/sd7zO/AS5HwHoPaOvVew7wbg8nMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719609436; c=relaxed/simple;
	bh=PNNkJGRHkHBDalXz9ix2gkNWTTWQ53dGil4+Ou4eGCE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=FenvShy+0LUZJ3+zwW76fRueza966yyhJA5haf9YffvsqtK32O+qmhREaCVXruR4oOZkT7FEQQpszwnLQQ0IB+MN7p2yzXfumeUMW5ufAZGvEb6p3kGfnD+KhCvS8/GGt6PnU/rT6SYGnJbzBXXcYhEXByFc+I3fXaZGGcKyTfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com; spf=pass smtp.mailfrom=d3engineering.com; dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b=JIaZUMqx; arc=fail smtp.client-ip=40.107.102.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3engineering.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKc1ZxbOeDpzi/D2N4/CdzAcwF4bhVT75D0YeqbbIAUGlf7fEuN/n9leDbtLAmldTCBAMsMp/6HWDTLvbV39s6FTsMaVeoyFqtsvWHiFMVdBON7peUmDiDVpmewB90GhcFX4Bb/ly0P8D46RODMdCvNaU3+ieZ1THdc9ewEteBYANlcilko/tSjsnXHBR4+g+RB4Wp7aL1EIxahJawUgYKpIwmxB6mL9/VVPmEecjjpTaOj7foQ7IIsvL73XLUtZRSIH6xErRdISxfKOYpSqnD6daxOXPZet/46iMFGFkLrIB+QKsz7Uz9uEZrokmC4LsygvruqYo5TR24RQP9YKPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vVB26Yzb3uqClPsjxAFCoiHytQlJ9Jpf+WJCOHCU+4=;
 b=GtV/KxnsQs2Tbeyt0oovCf0NSKH1UmEKyqVjlWhruiUoOf5ipgh+vEw/nIhXbJpQJuI2l+EHf5FIQeUNPZkHujBm8ovhVsqg8qNUWTg/Blm6O/ItxsFWFETiaEp8w3sh2PADOsuonmxl34A0fcrDPM/epES5htkYTnfqxaYo57b6PvQ5aQL6/f8k/tmHlsdZlaKxrJMaB7lNBu0drlAP+Wty27+B8l6py4O9aEUKzHvpKxnijzCyacb/3kzvY8zvK9vMOsJKhteLIiCZWxFHbchJUcH9gAG0oFTb1Pu1oG/cGzMiXSEEkg5PzZf73xzFwHTsFyjKU/+oBAGkW9A8KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3engineering.com; dmarc=pass action=none
 header.from=d3engineering.com; dkim=pass header.d=d3engineering.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d3engineering.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vVB26Yzb3uqClPsjxAFCoiHytQlJ9Jpf+WJCOHCU+4=;
 b=JIaZUMqxYO3fcotm/zVtgDEbT8Z3QAyX0ddDLwbeu1LcEJWoHelGDGdidmpZOB1qY4O+tGoepHDNoTMAMxqwTS6swEVVNcBTzwxeifUuHkOlvRtCR5w5/RM0Tu5ihHnG4aY9kTADMow69kcAIN+i6V+GC7F0l/RICU3bDBOuGHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3engineering.com;
Received: from CO6PR14MB4385.namprd14.prod.outlook.com (2603:10b6:5:34c::9) by
 BN8PR14MB3314.namprd14.prod.outlook.com (2603:10b6:408:78::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.8; Fri, 28 Jun 2024 21:17:11 +0000
Received: from CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864]) by CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864%4]) with mapi id 15.20.7719.014; Fri, 28 Jun 2024
 21:17:11 +0000
From: Spencer Hill <shill@d3engineering.com>
Subject: [PATCH v2 0/2] media: i2c: Add driver for Sony IMX728
Date: Fri, 28 Jun 2024 17:16:59 -0400
Message-Id: <20240628-imx728-driver-v2-0-80efa6774286@d3engineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-B4-Tracking: v=1; b=H4sIAEsof2YC/03OywqDMBCF4VeRWXckjrfYVd+jdBHMqAMmlkkRQ
 Xz3hq66/Bbn55yQWIUT3IsTlHdJssUMuhUwLi7OjOKzgQw1pqMeJRw9WfQqOys66wfTjm7y5CF
 v3sqTHL/e85U96Rbwsyi7/0pHVdXSUJLpbNPXWGFaZF0fvuY4S+R8Kc7luAW4ri9MeQ8DogAAA
 A==
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Spencer Hill <shill@d3engineering.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719609428; l=4812;
 i=shill@d3engineering.com; s=20240628; h=from:subject:message-id;
 bh=DMtS2ZFuhnys6Y8E7NT67n2teu8l89J04bVyrbHfp9Y=;
 b=QPhWwVh6A5VTWkKjRmdPtAKeSWrGKS9Ha1/xwgEcwj5mGoKfevwCLnvNRvyBytHN4WlCgQl4j
 zNzRTt7d/KTBB0jwEZ8LERxRso6HG83yXnhf/jfLVp6tr9mZ3fu8+ZI
X-Developer-Key: i=shill@d3engineering.com; a=ed25519;
 pk=WiUnCaWmHh41mktqx3wOb/1u4lviNHgPHRL6fwkHnsY=
X-ClientProxiedBy: MN2PR11CA0027.namprd11.prod.outlook.com
 (2603:10b6:208:23b::32) To CO6PR14MB4385.namprd14.prod.outlook.com
 (2603:10b6:5:34c::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR14MB4385:EE_|BN8PR14MB3314:EE_
X-MS-Office365-Filtering-Correlation-Id: e8a9d829-e1be-4878-4588-08dc97b7ac8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmFaRUNmbUZ2a080R2pWN1hEMGtGWTJ5WG9vYVNvMlVJemJoWDhpaVRzRXNi?=
 =?utf-8?B?SVo3dkZEWHlHQ2tKR2VpbG85SjlwWnI1ZG5GdXB0YmVmODJTMGd5U09MRU51?=
 =?utf-8?B?UjlucnNkYkNwNnhOK0p3VzdPZGJNRmMyOTZlTld2b2g5cTBzRnZVQllBZUUy?=
 =?utf-8?B?RXlLbmlHelBRSkdDZ2J3MW9FcDh4OU1meEI2K05iNFN6UVRPZWhHVWFOL3M2?=
 =?utf-8?B?MW9yTTdQNS9EbXRabXJUem9vUnFGaDB2Mm9vbEpmMFQveUthSVBnT3RqS1dw?=
 =?utf-8?B?RDkrS09ZWHJlSG5KVDNvcysxMUY0RXpmMWxHSGJDSW15YkZxZ2Y1ZHh5QUg0?=
 =?utf-8?B?eVhDd1ZOcFhISFdRSFJXSVQrbjNGNzFIKy9GTFYrbmxGOXhYUkZ3RUw0enNU?=
 =?utf-8?B?RldGWXVSVFVGREVnN04xeFM5ZjBQbElGL2JxUjRsaDdMM0t5a1M4bGdFV2tu?=
 =?utf-8?B?elJyZ2JhdW5na2x4aWdkL1hSU2hQNzhqaDN6ZmVLb200dGZHN09rcmJIT2Fs?=
 =?utf-8?B?aUoySGdPNk9CL2RJTjhjMUt3WlEvQzVCSUxRUjlMS3B1U2xPL2tKeE5qa0Zz?=
 =?utf-8?B?WWowU1RLbUs3Q0JhUkNCb3I5NlRqOU0vMkdtY0d4Kzk3ZHhJQzV6aGExSTNO?=
 =?utf-8?B?R21vQnNGN2RvcU5mdTEyVWFRaU1hbHRWZDNIVFlUQWYxNjdCNmwrTGJESnVj?=
 =?utf-8?B?ZzgwcHdSYk5pNU04a0tQR2QyZFdhVGc2MmlSMFRWdEZBNVNGK3oxWnNJaGIv?=
 =?utf-8?B?UWErT3k5Q2ZyQzkxbnV4UmZoZzIyLytZYnVBT21PNi95Y3hML1ZHUm1LZ0VI?=
 =?utf-8?B?MXpDRVEzYStmK2tma01QVUYrZlM0Vktob0FlaXYyY3pON2hURG1EME0yNUVy?=
 =?utf-8?B?My9yV0p6R2ZYY29EbXRkMzQrZGRZeG5UYTFTWExEZzIzR2E2c3RiYlFUUjR0?=
 =?utf-8?B?YnozQUlxWm43N0c0YTNnTmMxcFp1eEorWlFlR2lvZDZycVVFeXFmMkJGcU9E?=
 =?utf-8?B?WEpJWDBzNll4QnhZWUxlN3JnNkg2UU41Wkc2em1sL0lma0tpQlY0cVYvN1Mz?=
 =?utf-8?B?cVQrSUZ0S3RRZFhVSk1CbGZGUkx5VFVhQmZpV05wdFZVTndGODdMeThBYnVW?=
 =?utf-8?B?ZGJqaGphQlRuYlF0OUJuRkE4dWR5cEgxL2ZyOG5yR3ZGdkhYWjVVNE1YRUx0?=
 =?utf-8?B?Y3JaQzhid3lYNDBnd0pDTXgyaS8yT0lINnNBQ2NGQzFGZ3RodDRFWDZuSElr?=
 =?utf-8?B?Q3dmbmFybjRLRHlsbmQxeU5Fak9XVm9KMXFUb2xpSDdvTTR4bWlSazAybk1G?=
 =?utf-8?B?bktEd1RwWEFEUVdlWTA2WkxVVVdiVDgrM0NJckxWeVhtejNFQ3UzZkpKcURR?=
 =?utf-8?B?OTR2OENjdnFFMStIUTl0UFZiR3ppL0tOMXhvWS9paFN4dldRUWJmaE5iVHRT?=
 =?utf-8?B?NHNnQU1UNkFqaW9sQ0l3UUZHSXNvbVVFcVV6eERvRUtzUDZqZERPVE5oaXRH?=
 =?utf-8?B?WDBZUUQ1UmpWZENhelNSL1J5aFROT0IvUFg2OU1rR1Fwam9qVFpBbXU0QUVh?=
 =?utf-8?B?TzNWd3FNanpjbDIrQ3hkZThidWduUDg2aVE5Q2JucW11ZUtFZ2wzTTZFYUhE?=
 =?utf-8?B?ZVpiRndyZlFrZURrdWYzVHNpMEcrY0orSXJxNjBVREgxTUMvZHVUOVZGYzR2?=
 =?utf-8?B?UEJzVlBoVENNUnBWVmVWUHNkeURDaVJzTmtURjNPTERXNkswNGRXOE5Fb29I?=
 =?utf-8?B?YTdmWTBqOEhWSFFoc0lLYW1taTluN1lEVE1NbGF0SkJqMkowN1pNWnBwWGty?=
 =?utf-8?B?WnBOYWZWUFlNaUFJYVZrTG5KUDdDRFhteEZadzF0bmo5QzRjODY0L2tFbUt1?=
 =?utf-8?B?OXNoVUNZZ2FaUS9HbUZsWm9haFQ4WkNBd1owRzI2dXEzR0FoMDBKTEdVL2oy?=
 =?utf-8?Q?dPQODu47bfY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR14MB4385.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3RnMEIzMDNtNmQ0NktOV3NDZWFCam1WY3lGWEhJSVBwZFFSSkt2Yjg2ZHpS?=
 =?utf-8?B?ZUNOakdpNnRXWlRiQVBPYW1VdkFSbDJwUE9tOUVOREpMdmJEcmx5OWViNm9n?=
 =?utf-8?B?dlkwZ2ZzMlk2VEozVU5WaFRXeEhyLy81WlRHNCtwZFdiNkl3Ry8zWjdDcnVQ?=
 =?utf-8?B?cThlTlVVdXhVemFVc2NxMFVRS0dTWTdBdUZZcVg0MVV2NUZtajZRSXdjQ1l0?=
 =?utf-8?B?cTJIcE92K0tockM5aXJQMXdzU2UzaEtaSDNCVmVyTDhzUlBJVTlySjA3NVh1?=
 =?utf-8?B?QlRzbTF4bnpQU2I1WC9NVEw3RDg5NGRMd3E0TDlRU2daUTRUbjUrNkNqaVcx?=
 =?utf-8?B?OEpoK3cvdXRhTUwzODZML3RvZUZTbFhWR3gwNThUZkxlOXhmR0NXOWhZbTVt?=
 =?utf-8?B?V24xUmg1aTdIb0YreUs4WFlsZHdnbzNrRnNTNUNtUFh6MVRDVGRDMFZ4NUpX?=
 =?utf-8?B?dysySm12bFptU3JWVDdGS2JIeTZKSFp4VHFKZ0hialhzTUcraTRJUDcxeE9L?=
 =?utf-8?B?dTZNL3UrQXFLQzc2Sk1VY01IblFXek1iR3pSVVVqVTR3NlZ4OUZINXZ6bzNC?=
 =?utf-8?B?Z0xkNHoyR0hoVlQzQThyMlZTdHdCdXV5ZVFVcUMyOWdpaUpYd3VBWFBNMlU4?=
 =?utf-8?B?NU1WUDVIZnh2QXVWQ0NyMWkvQ2ZncmtwNXRTL3Vra3YwVTJDUEtaY3R6TE9E?=
 =?utf-8?B?V0l5YmFoNGlENlFFU1B2bVZGYlBCR29wKy9LdzVvV3dlN3BNb0xFaTRWVHlS?=
 =?utf-8?B?N1dWazArT0JNUi9qUUhqektjU3FVMFJNRTErSjVhcEh5SDVuMGd6bS9jZDdn?=
 =?utf-8?B?QVNzMENGZmVXZFMvTWR6WWM3MUFXd1haWXpPOEJ3UGVHNlNLcjluK2RKUmpl?=
 =?utf-8?B?TktCdlNkQmZ3NVp6L0xuVk9pZlAyNVd0WlZzQllIeExjcFMvaSt3YnZTOWNS?=
 =?utf-8?B?NmRJbXVOSTZOdXFoY1hpNVZsdlNRUGdhWURockhrUXZ3MmlUT2ppTWl1aVRm?=
 =?utf-8?B?TzMwdkd2a05HNWRHbGN4YmV1Qk9CWkFCSHNvQTNSU1EzQWNhUk9nRlNHTG9v?=
 =?utf-8?B?Z29WZ3VTTzhCV0JqMEFySlBWWHpEeTR0UWlqU1BUanZQWnRCQkNWcGxqTnhW?=
 =?utf-8?B?MDhBVElER0ZpU3J3bHZPcXZoZndWbjJ2bitDMW1vbWJ3MVZWMWxXbFhZT3ly?=
 =?utf-8?B?bGRwQjhELzBhWUhjQVE1blhGTm1QRXFNQzU3UFFheVg3K3pUQU15cWl1UUJq?=
 =?utf-8?B?Q1RobjZDWXdQUjAvd3Uvby85V0xBZXMxWE1QZmVXdmlDYjN3empXUG9jb2xz?=
 =?utf-8?B?WUEvbmJ5SmhoeGxXUGgvNFhNUCtNaXJLSnM4TnVDeW5zUkVNejY2SlZKQ2VZ?=
 =?utf-8?B?NXdJQy8ySENYazNKRmJidjhqNnIraXJnUFMvVW5UbitSVEJ1cUNSOG9HU2li?=
 =?utf-8?B?SllHbjh2TzA0YytJMmdma1pvR1JtZ2IzejZ5b2dWSFR0d2pPUk1YWGFocnJy?=
 =?utf-8?B?OEl5ckh3U1p1ZGcrRFhCQ1ZHZEFQZHdzOGJDNEJ5Q1RtSVdrY1FPUGdFSUVG?=
 =?utf-8?B?bVBKMUU1VjRQOU9IaDFUR0ZwaEQwWURqc0k0WmF2QUU5UnM2d28zMHAreUtF?=
 =?utf-8?B?dkNleHkwalVVWUloTit0TlhPQVZpUmJzUnVJSFE2UCt2RnNUcGpna0lWUnB0?=
 =?utf-8?B?cGJlMlhGc0J0b2traWxFaXJ5MUVVVGRGaE5kS1hwakM0a3ZwN3hmd2pZRFdu?=
 =?utf-8?B?RjlmYkJDaG53cEdDVnNvd0U4S1ppMEF6NDNSSkpHTEpjZjg0YVg5R0tybXNL?=
 =?utf-8?B?V3NhZlVzVmFUb0RIbU9XOENCZENYbGlJQlJISkRjdGI1dmYxSG9RcXp0Ukxx?=
 =?utf-8?B?Z0FTUjhRekVseENyQTdXdkZFaW83Y3owQVg5YzcxakhwMFhhRG5oclBMQWZV?=
 =?utf-8?B?d2FlNk9IYjhQUkVkYWxxUDlEMDBXK1NjWFRyOFdGbUd2dUlTbll5M2RtYUtW?=
 =?utf-8?B?YXAyVDNzVTNnT1JuUnhYVUNiRHFhd2VCcDN0VHZ1RmVUME1KSldhck4vVkxx?=
 =?utf-8?B?S2I4aitEYzN1THprK08wRm1HTmx3ODZWdTB0MUhVTHZxcGNrZmhNNzd2cUp0?=
 =?utf-8?B?NmM4dlliRWxUZVR3c1kvT01VZjlqb2RnV2s0Q0dlWnBoNEpkR1NFYUM0WDRx?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: d3engineering.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a9d829-e1be-4878-4588-08dc97b7ac8c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR14MB4385.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 21:17:11.1099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrqxU9f8aXTA0EM8VRZ8GGFVVDlI8YBMPAHeDgCOHidJ9Wj59ZkqzlabJJxBmjVFQu2Dvo4MqGEVmflH9tJR+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR14MB3314

Add a v4l2 sensor driver for Sony IMX728

v1->v2:
 * Elaborate on device details in dt-bindings.
 * Add links and voltage supplies to dt-bindings.
 * Re-order so that dt-bindings are applied first.
 * Move pattern gen config into v4l2_ctrls.
 * Switch to using CCI functions to access the sensor.
 * Merge header into c file.
 * Move verbose prints to dev_dbg.
 * Add missing v4l2 format params.
 * Added support for software reset if no hardware one is available.
 * Move register constants into defines, these are vague as Sony
   requested that I not use register names from the datasheet.

v4l2-compliance 1.24.1, 64 bits, 64-bit time_t

Compliance test for device /dev/v4l-subdev4:

Driver Info:
        Driver version   : 6.1.80
        Capabilities     : 0x00000002
                Streams Support

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev4 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 12 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev4: 43, Succeeded: 43, Failed: 0, Warnings: =
0

Spencer Hill (2):
  media: i2c: Add driver for Sony IMX728
  media: dt-bindings: Add Sony IMX728

 .../bindings/media/i2c/sony,imx728.yaml       |   78 +
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx728.c                    | 1167 ++++++
 drivers/media/i2c/imx728.h                    | 3458 +++++++++++++++++
 6 files changed, 4724 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx728=
.yaml
 create mode 100644 drivers/media/i2c/imx728.c
 create mode 100644 drivers/media/i2c/imx728.h

--
2.40.1

---
Spencer Hill (2):
      media: dt-bindings: Add Sony IMX728
      media: i2c: Add driver for Sony IMX728

 .../devicetree/bindings/media/i2c/sony,imx728.yaml |  119 +
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx728.c                         | 4660 ++++++++++++++++=
++++
 5 files changed, 4798 insertions(+)
---
base-commit: 8771b7f31b7fff91a998e6afdb60650d4bac59a5
change-id: 20240627-imx728-driver-a8d905cafd2d

Best regards,
--
Spencer Hill <shill@d3engineering.com>

Please be aware that this email includes email addresses outside of the org=
anization.

