Return-Path: <linux-media+bounces-27671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 335F9A54234
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 06:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7961B7A3066
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 05:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC1419E97A;
	Thu,  6 Mar 2025 05:35:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021074.outbound.protection.outlook.com [40.107.51.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8619E14F98;
	Thu,  6 Mar 2025 05:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741239307; cv=fail; b=aqgwb++5wc/tJUoEjOC2ts5Tjp8OOxerZdnaoEv+5YG+so3Asg+LgvRZuhS2V1xD1ZkL4OrSShj2b18d64p42cixMiPW7OtfHLuhkNRqYyAkiPM1+hjrnk3wiNCI6N2T4AnZXBJkwDHEvrQr3I5lKglIwL5zYb1EqYHkQ2JQwhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741239307; c=relaxed/simple;
	bh=AD2T852xkCgJluY8Wnhh3Cz5vuYurovKAagHWM00zS8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=honw+TRviqsAMBBvkH55nLGvkfNgNK7mmkxpnmQbWWIJSCeEbUq4ENqLxRPWqkebJ6oUXMQzPVr7KkowC9eqAq3Ow9vJRHDHDqxsj+KVn8QtTe/qlQLPEv0joELPIEdzJoA/ntRCmIdzLAW7PYCeeFkZYn5yIsAPXc9O50/PyGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=homUYwPDeUpMbT3UZM/1GugyHMg/kvRsvRbBzVJ/3H5IFGRwVS5H7cEtIppN5VxyfiE1G8kaQvOLa2Ged4+s/riCKnPwSp9NOzP/omaHR/0SnpGWQR336MQ3VUOvSJvm57iokz55nCWGJeM2PxVFZ6U/+omDqdlpanVG+O+3LDV4P5D0lfKInKExmwPS4GqwWyuaLEnYA9TKYHDZ95xpnttbjauO8aveRGNWkdbP44KbA6dgljGaE5qREFIjY5CRtfuF/I6wEzxS1gHc1nG6wVm/XHCIBAU08aPOt6o151n/N+RJzQGnNbR41mFJu0GkhdXoAssRjxfb8oAEpFstmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zD2mpD+Q3t3g4uBSOyM87DfA4bHgBqVb45LVDfOwuYA=;
 b=nUrGUTr25CMgj9CrGMXhro/B9TLEvTvsi/11CBwFSh4II8XwySi7cXeOgO9+29R5Q8LmU4z8tKVs0jvRycCF3tp/iefHVp9hdTW6JVSyayT1sU8yXHJZqAmG4nnB0cyfP/bidp+9rPJsOLEbL8Sxs3wf+6QItLQRuF2hUIymQxTvm79XNjDOHe24+eiVM1K+aEwFbFPosl5QL0RFvgzEqZYfOM7kA/GLah2Ir0nh9CYDlbOoUlIXZwsMFRHpJe+cP0s/l1cpZn0FqbsYR5NFgL60yE8HRXQ/IS0yZANC5uQrzCGacbhpoJCXthM9//g+KNtnRDdyGYvvdouvte17ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN1P287MB3789.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:256::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Thu, 6 Mar
 2025 05:34:59 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 05:34:58 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] media: i2c: imx219: Minor improvements for runtime PM and stream handling
Date: Thu,  6 Mar 2025 11:04:42 +0530
Message-Id: <20250306053445.40054-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0128.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::13) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN1P287MB3789:EE_
X-MS-Office365-Filtering-Correlation-Id: f2e3e63e-fe41-404f-d16d-08dd5c70a240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cO4vQlc+7y3Bpa0JPdOwQvYSZF/DDEfgnzd9puYgWT334SYOd9dyECLotXly?=
 =?us-ascii?Q?+jgttQlgEr0cuMw/eKguaPOECd8WPgm01f4LvQyz2oNmWstWpXdrUfTLTUkw?=
 =?us-ascii?Q?dyH6HLMuG4tu2QEu9aMj8ZNFDTXbvhIb9qA7FuDCx1n6qUeEt1LZxYuDMw7Z?=
 =?us-ascii?Q?e4kkL84IsxTZdwfg6xz0RgH8aHkoygEZsc6D83nvWRYud9UwpbdRQ+ST0J9o?=
 =?us-ascii?Q?eBIDxZbH806qBVEIB9lve/4cE9xdh2xdI8E7a6CmNn1cFSUMqxFRHHlqOgjN?=
 =?us-ascii?Q?T7yoZ+UWmViTsQaE6XaFAs7yneOMBjbOYSD6wDdKJwWpdhrVvMDC8AlRWknF?=
 =?us-ascii?Q?KSfraA2dVXESuqbcs/uUiMMVsTAiUPSFI6pNvSwR7A0EUSH0/BiR4D+VAF5O?=
 =?us-ascii?Q?Wx5e9NlTh35O6NGub/TUTfpxYUMoh1idxIK4wHsFXnVUA9sKOlqKL5n3eTEf?=
 =?us-ascii?Q?P4zZrPT75Ww5ileMQ2jEUP/H5yQpX/SBqDhaTa5wRuK4lQXQhqEVRDBKLO+w?=
 =?us-ascii?Q?pMaqtpOggrEgQTXcy/f94wUW1k0L2WRLjikhlCz8X3HccWySlGhBDuVGe2q+?=
 =?us-ascii?Q?6YEdhRPgsEToaeUZVdpO6gIiT0Z/l0Asc4EMcVaCqCbwyGskVCJWriM2hRbu?=
 =?us-ascii?Q?MhZfLW6hpNUqUby9pGsFjO/vIjvmtcITRtAA49A62rxBR8f7WIHFgRB9YnsK?=
 =?us-ascii?Q?UluM00X2wUCuI7Q6zsKe/CXsJGP5n16jHvStg9fpf7bdZGMohIatSSAgt96a?=
 =?us-ascii?Q?yK59o1Xk0Cb3Z67WOytDN3NzjY13oNdYW01qK+qF3nhDSeFxs6wUpCJMsWz5?=
 =?us-ascii?Q?0v7XGmLJbjmrHUJgMOAo5zds1kGha4BSy9hEhybG59Dqy+xG1MNe0wNM+Asg?=
 =?us-ascii?Q?otgylZj0mxo1Hr6GXw5w3BqLqW0qoKIoQdUL/7k2pJ8Ugd/yp8UhYHreiNkF?=
 =?us-ascii?Q?MeYmRr0Ue2nhsmMTnL1Dtnk0z2I1NFO1J0VFPdOv7HoyWx7QPfF1AXK8N7nj?=
 =?us-ascii?Q?3KjX3S75UHJt3ndppo7Jwg2OBTJk6gObWS6GGztZUaP8vvSuaJFrqrXt8mDJ?=
 =?us-ascii?Q?x9jPVUWIcGKKiiS+3WCzgF+GhUWZz/0CIjQjep9R5p6hQpNo6+IidycvdDsV?=
 =?us-ascii?Q?CY428onnUbyHDnJA7X1qWV1Kq9rNrTmNc1nQ/Z37is88sKhgb+II/HuS81bi?=
 =?us-ascii?Q?LmPXO95LKGB/bXUdho+6vLqjUPtRh834vByWuNO93HqOjMdFcvp77tB7k88U?=
 =?us-ascii?Q?mqXN/ANwrFHs/4QRH0oaBWhluMOnEB0yGeerxoB17Ri26PQMuV1w+S1qb51+?=
 =?us-ascii?Q?mLcANktR9PWtEZaiq/MmfERA8LsL3XMZcv2MQQ24lKCtWxdYd5qtvtlr3i/Z?=
 =?us-ascii?Q?uaZ68FqhSYmBAhGrRbcsq7GFFAf5Jhp2aMTelqUHJ03uNW41eJaJnr/w90kW?=
 =?us-ascii?Q?nsOOg3MEk2yNqYMU7ZXrInYXJwfLdP2d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FnuLgH+bisUc5bLGCE/nYhQkTamqT/AcERpaKAEoeTUKZKTNQiXNIyHWzkIk?=
 =?us-ascii?Q?UwMg/PKuDCI8ksb5thJte8+qgb2f3xCbsoccBSbGTOg8hjDkOLJ+gar0mhbR?=
 =?us-ascii?Q?C9e0mvFQb2t9TV6Pvol147Vi03WQflzfAmNi1f1qpRyZNdTkk0Y0MlxcFnF8?=
 =?us-ascii?Q?4wnUpz6DNelwU6YYCo+32jDerTKlUQ4UKUZnFOwf6m1hsbYUldIhpzejwaNJ?=
 =?us-ascii?Q?SeW5uzeVCFKhIiBwv56y/x6B5KT63OM/mH5PpftcsNu5Y4exzLDhwTMlRZVc?=
 =?us-ascii?Q?k/CvkSr8BGoS5fuixRB66l+rQ3DjmPb9mxsNcfjdR/9Sf3ZDkbIgkGLg9x3D?=
 =?us-ascii?Q?JIjWVK4u+J0ou7LzTxypDQZR4849E+FbflmlPdzxYVMywQ7TLAauJO/uVpZW?=
 =?us-ascii?Q?O+jLVY6Kp53q5II63xd65vAjZUMyREoC9mHcrJvWKg/dH1EOc0JGpUz9XqRQ?=
 =?us-ascii?Q?dwZ2PYEMsE1PyEgknEWUhi3wYM5CJT1/1oi9uE+F1bHo/U2eFOsdfBGygzsH?=
 =?us-ascii?Q?QmwSYAfuMubLO2QtOragfxfVDWaoPCA4vALO/oswc2yHK4TT+Z5hkH+50ORn?=
 =?us-ascii?Q?bpCD/ZPo7VEQOKJi9JGtm8AGL6w4L/47mhMqOmy+RpY9xLnB3qQ3icNEstKu?=
 =?us-ascii?Q?RZPigF49kDG0zD+3urZL0FbqCEywFrpIS8WjuFTvIE6P6qu31wrj1JFyAQgo?=
 =?us-ascii?Q?9/z0ssOKlrfWh2nfMl0dPwXEtA7pniQkPIb7C5mMotIVcPTj+wqgZ4CHZhnv?=
 =?us-ascii?Q?5hRyWWQ9mp/iNm1HjgU00oLrfFQ90a05mYHfJWPyM9b5v3VYrUCFsUe9/GNV?=
 =?us-ascii?Q?MV1nV5wr6Tu7eZA0qdGiVr++6ltjPAKFYADYNb4m9Ds+Jjzsbvev/BMwPZ8H?=
 =?us-ascii?Q?mzxTZosCCycTetq8ZO82MW5Jcff1dtqRPejlFZcAjoeVeD5lQrJ6GyfXlUuq?=
 =?us-ascii?Q?Ikni0QoENYQZeDW56CDAD8zbPyYnCf1QHLzh3TMUEeTAbFYteAw40416TNkx?=
 =?us-ascii?Q?IKj7YXmHML21cApdH59QwAAVYYMTnQKBJhBtWyemVXr8eVT08STSFjeCToSL?=
 =?us-ascii?Q?RPEQyMiDMomtiC+tugkCMF9FAaE0JdMIScY9QL8T4FReYT/daFfAPIu196VU?=
 =?us-ascii?Q?986TzFxyijs32GnIaYG9KWLU9LICf5dL2Br7TPBrj5LQRzYSFf56jUzXBWEZ?=
 =?us-ascii?Q?eQk/cKeKF5MoKjPynV9wgGRksI7aQ89lggrctjSfPR2FYTy2D4LWEkV/OEqx?=
 =?us-ascii?Q?VN4P6aw9ko26rxSXbhD8K9DXQS01o3Io9MXatbUKxciR3ZBn2GV1Oi2YAwTU?=
 =?us-ascii?Q?inA2vyif1sRrJFFy0ACPrqXeTjyd+q7uzb8Dc0cuU9rc7ZXtdd6Hkij9QZ9L?=
 =?us-ascii?Q?WFcL7C3hwk81gVxqEv9puoMVIvhKDW5VLPzIxWht7DEnWbS0fpFHLjsaQ9yc?=
 =?us-ascii?Q?ToBAHhIeQKueOUKQ8FciL4c+HiUymZ3ybdAuHBn4Bmygc23Uu6r3NWX0LvgB?=
 =?us-ascii?Q?T9e7aq/uWVTVppa1K51GDZZBtQT5yJxflfP21uW0u6Afir2Vg5JUSC2aFFIC?=
 =?us-ascii?Q?RpCcdcK9JS5IAe9GqFwvWhcimmZA+dPLADLa4P4Med770oL1rKDl+gtRf4lo?=
 =?us-ascii?Q?3Q=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e3e63e-fe41-404f-d16d-08dd5c70a240
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 05:34:58.5947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXvLUr5m5voHPwKhH9M1E7frXSdL5BF3hWVE20+DpEbqPY7BdrPawNlF0r6u1CvnHgvzXPwGsM91lNVYvG4dypVwJmK9Uk6lvE3lnBz2xJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1P287MB3789

v3 -> v4

- No need to check for the pad argument, dropped pad checking. 

v2 -> v3                                                           
                                                                   
- Add locking/unlocking of vflip and hflip controls,               
  which was mistakenly removed.                                    
                                                                   
v1 -> v2                                                           
                                                                   
- Dropped "Enable runtime PM before sub-device registration" patch,
  as it has already been applied.                                  

Tarang Raval (2):
  media: i2c: imx219: switch to {enable,disable}_streams
  media: i2c: imx219: media: i2c: imx219: Enable runtime PM autosuspend

 drivers/media/i2c/imx219.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

-- 
2.34.1


