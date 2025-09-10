Return-Path: <linux-media+bounces-42169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A823AB512FE
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 11:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2C33189F689
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 09:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF63E266595;
	Wed, 10 Sep 2025 09:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cCZ/vn2g"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013006.outbound.protection.outlook.com [40.107.162.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074DD3148BC;
	Wed, 10 Sep 2025 09:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757497504; cv=fail; b=bfWx6Ah9BwYmf8xSy7Fu1xe9zi4Bo1XJobquGNvOFP+1HGgq7zrm1gqqz/K2EIqQcB22FRHnWwkv8rluqp97pA1SulBV++m8UJMGSipyrMnbuDD2t0JXgv7KeQCT3c3MO0m99olT7JSpGFde+iwg9lhsX3WuXFRrB7joawSMeTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757497504; c=relaxed/simple;
	bh=8jjier9BtzwDA1Az9yD4b9KyP0j1d2DUqsBzTNVL+LQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=SnnYWGA13DHlkr8G3KUbf+ka5kYraI0RR5bAbRJYecIQUd1u/GrrisVlrx5J50h1xXHiABIAErcPXXpfQCjZvK8xFQ/pYMdFA361+8CLVmivP1UI8MEIC7+3Yx+5dm3VUEx3Ful4OHi/UcTA/u9epTqzsEQx0WKe4pHVUi+RtcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cCZ/vn2g; arc=fail smtp.client-ip=40.107.162.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ho9xD9NJnxjtvLBwS1IaO2XjvrANCmIn6aVONuFbZ83Kfr76YZBlkqI8rw9wFEKAUN70SaY4SPDumoymUWZvBPVdDiEpEMRgxh7vSJKW6iBvdPo7s+cHjjYPhj7TAGeQLDHPD10984BxNEYyQGRUGx0tfc/W4et7YC0LNSMGUBMoFz7Wwd9L9OEbXHsdaEGYHXBoCkSL6u55Pta7qBCPT68jyLsjvetWW+/jh5SJs0nVZJJa4LVbfAYkbkEbGHsl/ExBnI5GYlMnnotTKCCBim+TgxajAf2WDBiE3y8K/MCNzh4uYkkAQmCi2gkGR7gRK1q8DQenjfbSJC2gbwoxJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgwqNbR0TyGGq5pdrHJDM3PofXhbWEg4S1shW0ijzm4=;
 b=X3AoCoGKBbvL+9SZcTwQG7kbHarrP+lg3ZZ6V57YxQjC8EjJtFjs1Bx+tnEFnC8Hl5DuDlEDm48hmia2DaTE7ipoBpa1lhkVyY901Uw7kyjvprIqSku/NWg3MW95QAPA5R7M9TwMO/+PEYyE368NF9WfWKT8+VlqLaz2JZ/qQeUGybg11Q5DnGS5JOHtw7X/6qnD/A87XMQT25UzUYFBQkYC7pJm7gnzqJ3QR95bWSuMLdBhe81KcGa2SVaJi6n3c5nfWIdg7QSlAo9rUNCbivNy90yEV4piwHRvdA6e0bMHA9ocE2c/es+vwoSSZCgTOLcEc2W0AGDOXs5LaTN4ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgwqNbR0TyGGq5pdrHJDM3PofXhbWEg4S1shW0ijzm4=;
 b=cCZ/vn2giEQECISulr3OtxOhuq7RAsBNktdt/094OiaGieB9MuldVsGziJVIsnt13Lo3fLeLosm/KTjsjHYV9wCYeZl0VV8j2g5YRq2OjLjzZJ8+d9VPXOFlTTxILWUVIKcBO0GhNRRMWLg83kYk0rCrl7UXZRrKzOdqm8J+GOObnHu0AvhK+fDzPazPSOF08oavnboO7NfgrlR5yGZTSSNar+n+/WrgQox23oB38Ts4V+ewztG8j62/3Z5upR0mi5l8WKw4SG8hjgGYKBTb46Gu8td2oh99zaqYpwhoCr97GhmeBhwWARuINUXFFMkLmmxgbmtfccHbPYuqi4rOmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GV2PR04MB11834.eurprd04.prod.outlook.com (2603:10a6:150:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Wed, 10 Sep
 2025 09:44:57 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 09:44:57 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: [PATCH 0/4] media: i2c: ds90ub953: Add back channel GPIO support
Date: Wed, 10 Sep 2025 17:44:37 +0800
Message-Id: <20250910-ds90ub953-v1-0-a7813ffbdf11@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVIwWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwND3ZRiS4PSJEtTY11DMwszI4tkU+NEAwMloPqCotS0zAqwWdGxtbU
 AdJ1dpFsAAAA=
X-Change-ID: 20250901-ds90ub953-168628c53a00
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757497507; l=1006;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=8jjier9BtzwDA1Az9yD4b9KyP0j1d2DUqsBzTNVL+LQ=;
 b=QewU/lo/zoa7geIg0zhUHVCm2GrN1IJZ0XulKQPvcHTT/Z57y4COEQ2u7RNdPgY2Sy8ErFwuA
 6Gq+UUxVthtC3oZJTLq55CvdKjZ3DGFMPYMShboXXZRBiRz7R0LJ4UN
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MAXPR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::30) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GV2PR04MB11834:EE_
X-MS-Office365-Filtering-Correlation-Id: 2491f3a9-7587-4a9c-05e3-08ddf04eb3cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|19092799006|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTAvb29DUkcyMkFsY3NzZW5PbGJqZ1dUZURGTFplZmhrYXZTeEJQUmxjYXJU?=
 =?utf-8?B?TFVMWVJxN09JczcwVGNpbWxBdkhyL2p6UC9Rd05kczBZdlVTWi9WYXozTlJN?=
 =?utf-8?B?S3F6TE9tZ2VMdkxTS2RDL0RkZWF1TEUwRmNSOWdTMG52WlNmMldpVUprL1ps?=
 =?utf-8?B?YUVrcDBQNDFlaGdPcUJBYklVb01peHVqTkxmZ0VLWHRBdVNwTUxzTGE2S05j?=
 =?utf-8?B?b1cwZjJ1VFo5V3VnNUYyeWtvbWU2eXVtTENheEdaQVhPSVFER2tBdlltZEhj?=
 =?utf-8?B?ZVFBWS9uRTZPT0tHZnpkWDIydHJiTkQzMkVkVXlRMkQxbVFncUZ5Tkc5SXEv?=
 =?utf-8?B?Nmo4ckNsQmxVLzZvTE1FNmpkNTBZZ2NKdVN4OFdiSUU4NGJsdDlraUwvdlha?=
 =?utf-8?B?WGVFYzNuZEdXc3FEK0lwaUZBZndUSGJPRUVKQU84Q3EzNEQ5NW9KY0NIRm5v?=
 =?utf-8?B?RUtPS2F2VUZ6RWdYamViVG9nb3c5SjJCblJJbHlYTWF1bVh0OHF0ZU1CYWx0?=
 =?utf-8?B?VFBETWR4OEpQVW93R09ramNPZmJqQmhRb1dERmh0VlVqU1l5bzdCU0hPTnB2?=
 =?utf-8?B?Q2tLY3VWM2Q0ZG1ueWFzUnlYWnBackYvZWZPZXpBc05vc2hBZlFRdWw0Q2hm?=
 =?utf-8?B?NXEzMEFVY1E4MG80RERFR2llK0lyZTRWVFE1NFBSYld2UWpyWHlqTk80TjND?=
 =?utf-8?B?NEt4eEFYSFRDWUhVYWFmdEpWaXRKdEZSNjNPOUp0R1dhZ1krcjdpaDRYSU8z?=
 =?utf-8?B?REJPUmxlRWZvNFJ0M1JzWHNCdmF5QXJtSm4rRS9uVnJGa2FEdWtEMVdNcHMy?=
 =?utf-8?B?blZLQ2FseEpPTzE2TUFsY01xQ2dpL3ROUTlVcVA5MVBpNWVadlhjUFFoMHVW?=
 =?utf-8?B?dkJaWDlQMzJKZjJVb0tjWFFvUEpJUHlxS2pYMzdQazFrNlNxMG9Bb1NsMm9r?=
 =?utf-8?B?UUlsbVZOQlYzai96ellNRmFpUlUwOVR1NlZnTlFXd1hSd3V5bVFNdHJVcm9X?=
 =?utf-8?B?NTF0c2orMEFyRE8vZnlpakp2VHlWbU1BK3I3Vk1LYWhPb2pvRFFDMGN2M0FM?=
 =?utf-8?B?SDJKQXBPWjl4NHVYL3pVQkNvbW1EVWQxd3NuYlhmbktrKzZPUUw3a2s2OUhl?=
 =?utf-8?B?REh0QzZhTWJGellrSVRDWjFUWm9RMjlkaW13YnpTRUMxODd6WUZ3M3JxMkpt?=
 =?utf-8?B?QjhOeXd3eFdzWERtUXU3aWpXVStqQTl6RVVEblBrTE1tUjI0bzJ6SUZOb2k4?=
 =?utf-8?B?MFJTUVFkd2dlWGM0ZlI5QVBzbHZBTFF3L21zOFdJcmwydTVKZEk0Sk02cFpy?=
 =?utf-8?B?RUJPa3k5c0U3ZzNYdk10eml3R3QvNEdtZ1dnQkIwajNSaEk4empWN0tDNG1y?=
 =?utf-8?B?YUsvQnFRUHVvNmM4STNUY202VDlRaDJ6WVZOSGJtRUFPeFYvODZTQXplTkkr?=
 =?utf-8?B?MXlXNFpQY2VPNmhCS3JLU3ZLb1JZdFduZXo4cENXTUJ6TWJCU1NrSnJnTXJG?=
 =?utf-8?B?WloxZ2dqRlBVQ1VzZzBWVEE2a09tNlY5V0E2Q1dQVlFYTTBCdnhGeWhjMVho?=
 =?utf-8?B?dFRqVUdnaFpmSnpQYVVEaDAzNktUUnppWkp0V0YyMk93NEVSSG5YdWE2NEVp?=
 =?utf-8?B?SEU5RkV5YmF1T1NXdWRSa2RZdDFZcFJhc1JVL2hmN1docGEvNlk2QjU3L2JR?=
 =?utf-8?B?K3NMMlN3bVNxY3d0S3VzcUJualdYNjR3MGVrcCtUU00zS0FBZGZFU1ZJdmty?=
 =?utf-8?B?T1BIazgvMFpLYmNJVmFBYWsySmErNzJpNE9qRlZEZEFRMGVydXNLaXU2TlR0?=
 =?utf-8?B?azgxZUJSejRZOC9pZFVGdmdFNFkvVnFHVVV5Yk9vWmtHaDRBdFhTM2hqaXBM?=
 =?utf-8?B?TUpWZjFzUHJGNkN2bU54bXJycWh5STJBcUYxSzBZODJKa3NNcXU0WENhWm9m?=
 =?utf-8?B?SzA4dEZhYzUxQXJpUURxbXBHOHV1aW1uMmFlQzdzSzN2RmZNQm5seEhTTGVN?=
 =?utf-8?B?OFZMWFJxS0tnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(19092799006)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjVvaS8vVENyWHBTNVltNkxXWUxpa05PNXRIR1JGZjRRR3FrbEkxYnlqbmhx?=
 =?utf-8?B?SHhDekpWNW9sU2gyZGR3Q3dnMjNWMDAwUHg3cG9tQnpGbkF3WHhzSjNMVEow?=
 =?utf-8?B?VThLRG9mQ3RVN1M3QkJ1NXBWRVVaS2pucTRGaE5qVS9KUFA3MGRvV1ZrcXVh?=
 =?utf-8?B?STZJSDAxTUoxK2FDYTdGajJTMzBFcEpNZXZ5aGU3dXVGNVVYRE51S3RFQ3o0?=
 =?utf-8?B?WnZsYkNTNUt4VllscUk0cW10NS8xSmppVng3dnZHVURJN0w0M1lORmVhdlJS?=
 =?utf-8?B?MEVpWU9RKzJsd0lsNGpubkpIQU90SjdmRWJhT0Z0b2xlOUJxNUhJUUtxMGxL?=
 =?utf-8?B?M1lHbDJmTW1TN0xhMThuYjRDYVF0aWk2RVBObm13UXdGKzRySGJsTkhONUcx?=
 =?utf-8?B?MXRVeDFKbzJWQjJDRVkzUE1ycS9odDlIQWN4K0ZmdjBJU3lsQUNJaUVxRzV1?=
 =?utf-8?B?Y3Nyd1YyZWhlMUl0U1pER0diYXo0U0VFVklkckN2NEJNTEpnbzdSSGhhaUZl?=
 =?utf-8?B?M3l0cEV3UlVLYTRkUWk2MHpLSFo3MjhUWkpETVJTNnRCcFRKU3hkRjE4dkFx?=
 =?utf-8?B?WTY5dlZLREcvVU9CZHFVbktvS2J2Qm9OSGVtWS9PL25qdUtIakdFeXdlcmRw?=
 =?utf-8?B?VCtIYXJVT01nRytQVmp3YzlZOVdQRXN5NWlWMk1qY2ZPUHRnZTRKQmczekcw?=
 =?utf-8?B?VUZQSlBRUTJLR29laTB4Nk9yNjJ5Uk1FWkd0Z01xQXVLRmRwTERWMzQycEg5?=
 =?utf-8?B?cGFnTXV6R2JXQUFnaElLQk95NFExUUxRdzdXUDVVUENSMVlxZWdFL0htT0Ft?=
 =?utf-8?B?MjZuUGhPMnFxSDBnZm5ReFlzQjV1UG1hNmZNOXg2YXI0WmFEVmlZSlBlNzQr?=
 =?utf-8?B?WlB0eDBNWHFIYlhDMWtJajB1MUFtMTUxN05oVk5KMEVXcE5HMjNnMHRaKzJF?=
 =?utf-8?B?dUFwSExYY2tGRS9yOFpwSFpERlI0d0EwdC84NWhqbDdnK3piemFkbkg0Q1dm?=
 =?utf-8?B?bVRyc01seXlPK1dvMStoV3h1K3BiQUFOenozL3h5Y3ZrUGsvUnoxVnVBcDZu?=
 =?utf-8?B?VFd1aXNRcTllNHVtR2lIMS9DbDhCcXRacjNuN1E2enBocjhNU2VXRmhLNkRw?=
 =?utf-8?B?a3hmaFpyUVFTcGpQdWwzU0NVZEs0NlBJU3JUODN3TE8wOU56OVp0RVVMR3g0?=
 =?utf-8?B?WHB2WUVhbm9VZ1BkZ3YxR3NKNit0Ykt5a0FKMFNsYjZnbW5mRksrQ3NOUEcz?=
 =?utf-8?B?RVFiRzQ2MUlQZXlJeTU4Ny9vM1hzQmcyYjl3eFNYUTZmVVova2k5S0FjTGMy?=
 =?utf-8?B?Nk5pQjJDM1ByNERIOUMwMy9BM1VaNUNyNmVuT3daMVNzRFNrWWRtbndwdkpZ?=
 =?utf-8?B?MGlJaDRoMDZXREhtYkhFeit0UmNiamtoQ0QxaVljNVdqOWhacEZldTVwek92?=
 =?utf-8?B?YkhKbVZ1Q3VDMk5oYklLR1Z6THpVbVJ4eXlsakFrdzBNUGFYSDBzdGEveGRv?=
 =?utf-8?B?aVlBY284UlptSHoyR3RhS3lWZ05iSkt1TG4reDZTbDFxcll1UmdJY3RhUFp3?=
 =?utf-8?B?emlnZUZiNnF6Y2t2ZURMTnVCV0dyVHNtKytXREpOa0hUY25QNnZSeEs3cFdW?=
 =?utf-8?B?NmtMVXV1K1JRY0wxaHROVzZNaXQ3V0F3UVg3ZkZ1RkNnL2FwMDE4NU5kaU1D?=
 =?utf-8?B?VVRBcm5SNWJkMlFFWnhrWUkrK0RCUkEwcmhNVWpUYWhzeERnUW92ZlJaSE9I?=
 =?utf-8?B?YjlWR0lwNmVrZUM5RXJCSFQ0SUY3SnI3azBtKzhlQjNLZXd5ZUJLUlNpZXZY?=
 =?utf-8?B?aTFOeTc4VnBKekozdEgwQzVlWUZYbjNrZk94VGViYm0rKzYySEFoYThuTUJI?=
 =?utf-8?B?VWl5VHdncmx2SW1uaXJGcUpBQ3RjUEFlQmxSYnRZUVppclkrTm1ua3dlRlRv?=
 =?utf-8?B?WnB1MS9oRDh3bFhmK3ZSY0YwdllXU3A3Mjh0MHZHWFRQQlJkNXVpenpTR0Qy?=
 =?utf-8?B?cmVZRWhVak1RZjAzd0Rybk1QcmI2NEpNU2tCb0UxcTBJdVZYMTMwczNIRTVn?=
 =?utf-8?B?NHp4bUxBVEp5dndTOVhZV05ERHNKODhLU1V4byt3eXZ4dGJBejl3ZlhFZGdX?=
 =?utf-8?Q?SjlIGfWR3EgD6zvt6rMxR1f78?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2491f3a9-7587-4a9c-05e3-08ddf04eb3cb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 09:44:57.3068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6TQ4lXSn3ztTX1VqTXzfe8s9aEDlxaJZdvE+Idbcbx6PNRTVvrjFNBb1tgwzxIKOY5PSh0MFZWHwl2x2DGSKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11834

Add back channel GPIO support.
  dt-bindings: media: ti,ds90ub953: Add new property ti,gpio-data
  media: i2c: ds90ub953: Add back channel GPIO support

Use helper macro to simplify code.
  media: i2c: ds90ub953: use devm_mutex_init() to simplify code
  media: i2c: ds90ub953: use guard() to simplify code

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Guoniu Zhou (4):
      dt-bindings: media: ti,ds90ub953: Add new property ti,gpio-data
      media: i2c: ds90ub953: Add back channel GPIO support
      media: i2c: ds90ub953: use devm_mutex_init() to simplify code
      media: i2c: ds90ub953: use guard() to simplify code

 .../bindings/media/i2c/ti,ds90ub953.yaml           | 10 +++
 drivers/media/i2c/ds90ub953.c                      | 87 ++++++++++++----------
 2 files changed, 58 insertions(+), 39 deletions(-)
---
base-commit: 34837c444cd42236b2b43ce871f30d83776a3431
change-id: 20250901-ds90ub953-168628c53a00

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


