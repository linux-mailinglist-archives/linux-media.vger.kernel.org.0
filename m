Return-Path: <linux-media+bounces-67053-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 41aGOgJ7Tmp4NgIAu9opvQ
	(envelope-from <linux-media+bounces-67053-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:29:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BF4728B89
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:29:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=D6xqkt0O;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67053-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67053-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A03F83083A24
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 16:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D788542DA42;
	Wed,  8 Jul 2026 16:14:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE8042DA2F;
	Wed,  8 Jul 2026 16:14:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527293; cv=fail; b=BBKPgp0E0ncK6j3g92IjUDCGQr012g9UrBBKG3OpJtTKVbBNlihEKebk+IbzaHY7kWKWZnu0bMVs9cDnTV5BEDCxI9wWA++mHZTExie+jhfRDpR2W1zD2uLK2T3OMk+jaX7+os2d0+T37sLs+LfKhFBumQKVQfZ79x6veYtwcug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527293; c=relaxed/simple;
	bh=mQcixcKYxeJ8K0DLSvBkcbAT+WHfmjcGV8T/pxhOG1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ayh8U0TQqsqaTU6aD737Qfpr0AjjGXfDF7T2VWdJV+qhn4Hj1JrNDl68wkvfjIRInYlXTR/SDG5jsX1JSqv4wAhRBeZs4WwUMDq5G6x9wWlfRFflLxoUyJukmC4HRTpLU3H+yLxAfBZmOk7Gu+oEMrze46oCbALoXQPu1IBvup8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=D6xqkt0O; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+XJKEIdZn8OvN0MiR1Ig0CBuqj/U9Elmr//Zwa2PvrGE2CSa7bZyJMVhrHSEVYjsqvo/oRYPLnzG7f4X2YkF0tkVlT+nVgG+6t/krKpw+xuhUDC5BMlDL37h8KK5bINX1JFgZvEQ8DcIjs7Evvs+prxMe81/uyDVu9zVlQBzaChqZx+ADC7LFRhCHNo+x7+vKTj5oiWH57qq5Qk19LybCUCqM/0Pea7X7fyrd4JefJgkwmA2u8GY3e/sQ5UK1K6hjS5FQymg1evBOPdR+KnKDTo6hpC3YuPNhSuOybsXECdWRevp+u5/Qf/W3wZoGENTMy63MHpsX2j/d7ARkTFmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Bul+ygrUilI0dcto5cM+jDcCVP+rCLpA2XDOEXFdyo=;
 b=ZqxGcobPfr6osyifWbn3NhorcxylZ7cUr0Zutv7fPTmPb7M+NakjkE9mgn9Ehi3bP6jKiHaol8keTF65jYUG0dmjE3WNpAxNDqO9pgG8xpMLG1ymINPrzNBL32Y6dxFEu1MQjGSJL4H32n+zXND5/WXW2JLcN6M86c0qod19JpXjO92TdoK+LjpWirDcHNbo1othip0pKFbTUeaCHov72Whe7FGd0tC2/LcyYB2jpC2b3H/s3EZqrrxcvIGMpVvWu37CIWlgmg/m7g8oy8yQDpV3uX8+ch3TqCFWVKup8f2Hz/p+MbFiBs8gJM62JwX00yc87IL3/gYjQXYFscMjYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Bul+ygrUilI0dcto5cM+jDcCVP+rCLpA2XDOEXFdyo=;
 b=D6xqkt0O+BZo7JH9ghOrzfjnJUcnnbDI4GVdHFHuE7L/++UJjy/gHiBMGgojS5Vp+B+y2YAbMrur3QHym9K7eKUFDQoassP9235r+wayrFey0flU+4lbYek36NI2rTEuI8J6RJE41P0yqBlkRfB1I78LgJaC08UUaa2Qk3FVJCc=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB11590.jpnprd01.prod.outlook.com (2603:1096:400:3b9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 16:14:49 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 16:14:49 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	=?UTF-8?q?Sven=20P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] media: v4l2-common: Add kernel-doc for v4l2_fill_pixfmt_mp_aligned()
Date: Wed,  8 Jul 2026 18:14:04 +0200
Message-ID: <20260708161406.396183-4-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708161406.396183-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260708161406.396183-1-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0250.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::8) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB11590:EE_
X-MS-Office365-Filtering-Correlation-Id: ce23818d-eca5-4483-7753-08dedd0c08c9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|23010399003|1800799024|366016|38350700014|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 a8WLGPrFSGho5FLAKfTyJ38woP3N6OCGFA+PYO3PT6WDZwUc1vtmJeBOEE3OPDy6GDk3yt2c8GfdpbURG6B3eZwgt//9NMadwJCQVotdYBEvj557yt35b+h3jw9Sls4E3Kl1eJZiIZn0vMyT25uHPUhR9nwyUUBGj09J7TEobmxvfnG4QxpM9eaWov1BD0ina5cwru0bjJfIPljKd/DpWP/eZhltF0xs7LpguXl8DcJFnL6JWJ8LWZLIkzUIpkjWLk3AEht/Wf4zBMv+2oiBMSO3F0SlwSU+398buXtaLmZS01tpTPHUP5y6/EC4tqzq6qr1NaQKEap/y2agM8Aa33S2eQIIwmWaXWKd1qpfk0RPTffcHqk+9Pdra8uazweK0kvKq58mCxCvPoJv1gsFqds+b0F7xf9rmmJtRw3jfax8BqhYSwNJBes3cipNuJSFhLtnZk9dgX0C4M10nt0lGMKcCpI6VUPwaoPuWvIpf2XpIBSnJGhyx4OUKpm0m8KPZcK+QyJhFslSvadPR/gBkmLMeJIrKCk4zpIT8jwXwsmQdD7J8G4xEY0ryVAFEvzy5Gs+A5kFq3jkIIukx15LtyBueACWBddrs32PVLswaET1EvrJJuocm7dh94gMEXvI57LMouki3OWa9pBh75z6x7aiiBFPvFlNHTNw1t8reuab+K1b4An4/hefE8KxbfSupN6tZZa6DxnYNYCbgS3hQOetn2mnupyKvsuB4AkAcgk=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(23010399003)(1800799024)(366016)(38350700014)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?V204MkVaSHJIOHlvZVFjY1Era2FqdC9VcVZyYVRKODdJeW1jZ0dGWmh2aWRB?=
 =?utf-8?B?RlZRWmpjYUI1SzNKMFVUZ2xpOTIwUEE3TG9vM2U1NWhoMlBoak8zY29QME05?=
 =?utf-8?B?cjFidk9ZdDdpNHRDV3FGMmJPcDRVanZKWmdlRXRNOE8xc1h5N1dwVWdBV1Uy?=
 =?utf-8?B?Z0w2QTlXUDE5WlpPZkpOajVoV1E0dHdQc1NVQXAyRWpxOGhtbWJiTEF3WmVC?=
 =?utf-8?B?RElxUmcybHFTRUVFNlhrQnlTa1R0YjVnemcyQU9Id1N4MmV6aklOdzFDcjdH?=
 =?utf-8?B?RWdIbHJyYW9xTmhxQVRpZWxwZWNKQkFtaFV1d09JWCtkQlNrOXNITmhZNTQv?=
 =?utf-8?B?YkVkdVl1cTVOWkF5SVdZR3FhcERBbjcxUGlBMjBpaEtPaFd0ZWUyWGtPM2JW?=
 =?utf-8?B?dzZKWnpZVTIyYi9GbkFMK2N0Rk1mUkkxNCswRnZ6RXB2WHF4NmxhVEs2dDg2?=
 =?utf-8?B?WHpRbXRuSUtMNzhWdFI1ZUx6b1hydlZtUEdTZldXblg1Uy8vZTdsMCtmL3pp?=
 =?utf-8?B?K2FVNzFkZXM2K3RvSWhnMFV3aVdZbHBMNUhPWnpjWGFPamdFMlRXNWZVRkU5?=
 =?utf-8?B?QjVGTUJ1RGZkeGNGTnp3ZGpiYU1oYVdaM1orWG9iS0lhbXU1OWlPclFGbTNy?=
 =?utf-8?B?ZDBSYS8zZURkZXJDMDc2cXBZVkJpZXpQYjBwL3paanhIQ0d2a21DTit3QnND?=
 =?utf-8?B?eDc1QnVZRkVUWjRUSFJUcjRvQ0tBWVJHSU01YXlwR0VCSW5rR1FYbndLQU5z?=
 =?utf-8?B?b0ZMK0RtdzRiemxLajNWTkhDUkJkWDZzdi8rcU0vQ2dSTmZTbnVyRGoxNllt?=
 =?utf-8?B?S2k2U014aVA3SWJRNkJQWTZ1OUluMGpUZVQ2dkdhQnp0akdncS9GOVIzOHYw?=
 =?utf-8?B?bjRaTWJFcTdsOVM2ZGpnZ2tXdWNRNG9aTGp3VGZ4ZlJBL0JGcVpxUUMyS0hm?=
 =?utf-8?B?TWxpRGxzT0poa0pyeldDbm4zVzRCZWtHSExTUkFOcVoyeXB3MVc5dnJnbjQr?=
 =?utf-8?B?QmY1NWd4UWUxYzdOUFczWUZTbGdNRzdNNGd5WVprcDlkVGYyb0dvOTA5bENF?=
 =?utf-8?B?U1BZeGl6OFR1THdiUHdhWlplUmFwMGE4bi9xMnR6Y1dZTGVtd25yQ0QzejNN?=
 =?utf-8?B?YjQvY3lDYjhDckpuRmgxdEY2TEFaUkswWVRlOXY5WWhKU2lyRFBoNS9tZFZN?=
 =?utf-8?B?QWV2Njc0WHU5c2pTd0c1TkFwQ1AySTBUMGQ1Wm1zNURHNjVXVENGQnlzN0RB?=
 =?utf-8?B?R1l6VGw2UzlaeFN2clFBV01PWkxzREtLdkJhUmNTZlltbGJwZis2anB0Y3pJ?=
 =?utf-8?B?ZUEzcHEzeXlHQmU4aENWRGdpV1oyTmdDamV1SkxsVEpSZVJjV0M4bURhODQx?=
 =?utf-8?B?SUUza094eFFSRFJCQUJXMWZzRkJhSzhDRzRXR1pzSWgwQjFZSi9UZEw4Slcr?=
 =?utf-8?B?Qno2WXFSOWJybnorR2JRMStET08xM01HN25Ld3RQajBzbnl5dmlIMjhTbGhm?=
 =?utf-8?B?MVVoMytnckVvTk1BRHFVSlpSSFBSdU9GeS9DMXdyUlFSNmV5U2FlR2o0N21u?=
 =?utf-8?B?a0ZublVkMFE4WDVrVGpUQytuaXA1eFhKQnV6NjRKMDJRWlhlMTVWMUhrRm1n?=
 =?utf-8?B?RS9yUjRta1lHUnNjSXdsNFFSTGI3YWowZFdsUmhTSSs3aThrbXlGMW8vaDZP?=
 =?utf-8?B?eW9RK2VDVklTZU9MbWFnQm4yZEd5TjY3b0VTekFDbUlwaUtDaklLeDBqOStS?=
 =?utf-8?B?bUI0SHdDV3Y0UTZZMFRIa2tYd2h2ZkNvNVU2L3VMVnBCcHlmWllkS0JjUkNu?=
 =?utf-8?B?M09VVjk3YTg4M3draGJYTmQvTFB2MkppRVdGQ0hpcm9FYWRvTFRSVmp6SStX?=
 =?utf-8?B?Z3E4NGIyZFBmbkg2NzV6UEtaUHhORko5Y0JaZ1RsTTFRZ3o0NkgzQXB1U2tk?=
 =?utf-8?B?dDgwZGkxSW96eUNVMnZSQmlEY0xKNU04bithNDcwa1lpdFN4bWtzb2hpRFFQ?=
 =?utf-8?B?YVI3MUk1N2tqSkpWRFh2d0NvdlNZUHh3NDBLVHBFL0xkSkFmVWFOd2VUV1pW?=
 =?utf-8?B?MjVrUG10TUxZb0hib1hqaGVrVTh5VjRlVkpuTFlHM1JZZGlOUmxkS3ZVTFZz?=
 =?utf-8?B?WldXNWRwZ0hGWTg4UFM1RytNaHdtRHFjaEs4VnMycW9PNTU2RVhDUkhxRUN3?=
 =?utf-8?B?ODhiUGlQc1Z5UDlNc2FlRXExVGplN3lad3pIa0t6d0cxQjI1Z0VEM1JITytR?=
 =?utf-8?B?WnB3V01oRERLZm1GVmxsWThXZGZySEp3SE5KcDYrM2FURVR1RnlQQ3hHNmNL?=
 =?utf-8?B?VDR4UE5HT1JIZ3dRcjJ3eFBsMXdmUkhOSk9PM3c4OFlYY08vTEFUMk5RQVNq?=
 =?utf-8?Q?0iy1prwMatDV+hD1yZV3lqm6lgwA8bE7KiDH+?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce23818d-eca5-4483-7753-08dedd0c08c9
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 16:14:49.3018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kcuL9u2YRi4SVyDrGi8B0jhPJ9p9xb4nX0zNunXoLF3bBUE8jIQMbnHi0ATsGE87vWip4vr5zyx9XdvpqJcE2grIxfCWFzSKtMRNWL3BC5jyOLbgd/TGE/LDk6pKfdie
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11590
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67053-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:s.pueschel@pengutronix.de,m:m.szyprowski@samsung.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:from_mime,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7BF4728B89

Replace the bare placeholder comment with a full kernel-doc block
documenting all parameters, the function behaviour for both single
memory plane (mem_planes == 1) and multiple memory plane (mem_planes > 1)
formats, and the return value.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - Moved to PATCH 3/4
 - Fixed documentation as suggested by Sven Püschel

v1->v2:
 - New patch

 include/media/v4l2-common.h | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index be4dd9762196..f2b0c336ac81 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -591,7 +591,33 @@ static inline int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt,
 	return v4l2_fill_pixfmt_aligned(pixfmt, pixelformat, width, height, 1);
 }
 
-/* @stride_alignment is a power of 2 value in bytes */
+/**
+ * v4l2_fill_pixfmt_mp_aligned - Fill in a &struct v4l2_pix_format_mplane with
+ *	stride alignment requirements.
+ *
+ * @pixfmt: pointer to the &struct v4l2_pix_format_mplane to be filled
+ * @pixelformat: the V4L2 pixel format (V4L2_PIX_FMT_*)
+ * @width: image width in pixels
+ * @height: image height in pixels
+ * @stride_alignment: stride alignment in bytes; must be a power of 2
+ *
+ * Fills all fields of @pixfmt for the given pixel format, dimensions, and
+ * stride alignment.
+ *
+ * For formats stored in a single memory plane (mem_planes == 1), the
+ * behaviour matches v4l2_fill_pixfmt_aligned(): plane_fmt[0].bytesperline
+ * is set to the primary plane stride. The strides of all components are
+ * aligned to the @stride_alignment. To keep the chroma strides consistently
+ * derivable from the luma stride, strides may be aligned to a multiple of
+ * the @stride_alignment instead. plane_fmt[0].sizeimage covers all
+ * component planes.
+ *
+ * For formats with multiple memory planes (mem_planes > 1), each plane's
+ * bytesperline is independently rounded up to @stride_alignment, and
+ * sizeimage is set to bytesperline multiplied by the plane height.
+ *
+ * Return: 0 on success, -EINVAL if @pixelformat is unknown.
+ */
 int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
 				u32 pixelformat, u32 width, u32 height,
 				u8 stride_alignment);
-- 
2.54.0


