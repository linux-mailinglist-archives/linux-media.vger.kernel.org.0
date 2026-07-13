Return-Path: <linux-media+bounces-67436-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DlZnN06cVGrroAMAu9opvQ
	(envelope-from <linux-media+bounces-67436-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:05:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1105C7487D3
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:05:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=Nz5QaS41;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67436-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67436-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 674AC303D119
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 08:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C623A2559;
	Mon, 13 Jul 2026 08:03:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011030.outbound.protection.outlook.com [52.101.125.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6D1CA52;
	Mon, 13 Jul 2026 08:03:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929829; cv=fail; b=ZaFTfZVLx7feJMxmRlFdSMIJj6fTI6dJItJMJRvHi8tPWkx2NgiRFdPh5HRGLdcPHO2dhfNd4bpEsLz5a1Gx8rI7hMAyxBffRpQLfVjtx3/Y2ysDVWc5vvJjpYHgZH48BFHJUd8gNJdEKuQgtyDKQZDQHqlZAtnDCwTSDWSbXF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929829; c=relaxed/simple;
	bh=3PauuHuWbAY8glQdpGNO7ZmxumbrXFDVBamhCrvRWNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XLM3KX29Ze+LA5cgxbBpF2iX8cGQ7zJRKqO5wYfICjwfF6rZsdAjlPGzmPFRCF9Q8Lj/J39eHJUztS84KEX69Nj7yY2HSDIBm91oFyf6xjiIgCTuEYNyh5HhEcJ4qEI40UDf2lx0ikaREQ0GX7DqlvNQ4RzE5xsUPYLdKXts44U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Nz5QaS41; arc=fail smtp.client-ip=52.101.125.30
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vufj20daN/ETtEKlPQdXC1mtgC413Df/XWv8+vubpQtkGGE/8dzlmE7R4BqJ6CVoSS5cyn+P65tAppldj6Z1SANGioJhJ0acAdU9ateoz5Q/ci9pxR1zmjItZwdOyENrFe5/pDDMNQxGVzehg12ENs21rLpe4ZWIPK1FKN0zXf372bEq+um4c9c15zkQMSloRwz6nIykK6w9T5gKJRQ8RT/nLBIQjnaIhgeuUBWeyl4kX9/L6VQJjzFPd1d4wqCrEmsgM8MphWTgw4UXZ9lumtg/pY2GecVf/q/x+EZVRD4195jQzBCUdn51flZyfHUfoFbSb1vgw9wuX/2MtF7UbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZg7L00OhcXovjIJCrw/T+K+ShziKIFkz73JhIy8jmo=;
 b=L0/GH8WIA/A5watWCjI8xXyWuVUJhRBSfjj5F9oC6CLtRnjeq/nIDzlqizE8ukbeaDOPyVkR+kxub9Yr6N9KmB1PKoQRZezNEU2wCGUHPWdgO2maaij35Q0QHtEFVqbswh94wc5e/NpgRfCuZvjOmNsZgIS1pIX/WTOjYW69M2kBIDA1gHRwpiZsUHpEA459r9UEUvqgLJ24PKPqn0XiOnHnLc/B/JIvUwDIx/VqFW8qKFs7nFcVMJeIOBYClS0EcEWMPmACDxz/+F23l/v/OLpYpplU5l2ZyeE0bRiskAefTOaQ1TKkGoG/BNF5Nxc4T2dZW4XAYxP8dV+z/vS7+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZg7L00OhcXovjIJCrw/T+K+ShziKIFkz73JhIy8jmo=;
 b=Nz5QaS41UX+mToxSnUIEUpmQaSMEtFx21rEuGe+PyrgXonEoSgym6+9kNA+YjYRE3V+iKONrruSqZKiUl2ItNk6KbEgBiKqkFu3Ld515YRalFgLWR9MqZHQrZbKcSEXJgL/hGf/nBpibr7BV5Hyv4j6n6Wy33gSBeaGMl4A9Kws=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB11657.jpnprd01.prod.outlook.com (2603:1096:400:3b8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 08:03:45 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 08:03:45 +0000
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
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Sven=20P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH v4 3/4] media: v4l2-common: Add kernel-doc for v4l2_fill_pixfmt_mp_aligned()
Date: Mon, 13 Jul 2026 10:02:52 +0200
Message-ID: <20260713080259.21835-4-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713080259.21835-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260713080259.21835-1-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::9) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB11657:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c9324e2-088d-472a-9a56-08dee0b542df
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|23010399003|366016|1800799024|3023799007|18002099003|22082099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 jgSlwF2vlyy2oFzQWAS9Qq4/AoZL7IRArpr0BxAO+yvfwEECFPMQ9AvUKv1D6cbpJEMkHxujHdaczhJPQdbUYbmGbbjUG5llGnUgxPwgBLUkmkCLaSQLbhbYKOYiob5JTrX6AyvuDlOJZrkW5A7dEduLqj/MRTYf7rETMp/3pJty+hcDyjUqvowq/z22PzXy7K+xaF2DW4mELDOOzYJwrrm1vdjijYLB0uOP3607OsJw/+Y1wiOjLd2f28CiX82kWGKCDuMVB/lALRNlDmPPqqLGG+vZG4M5syffudt5KuPaDt6g0/hnVNBXXucOn/v0m7Zt+OxH7n3srgKPzS5NdmED/LGH7QFiXmGxezUZtEzEzDaC+U8ry2YRYb+i8B1QLsOl4GTSWww4fkdvezfz/lRQ7hUSL8mbgYp5fr43+bVG5qdPQ+3mUvFu/J2rGEQC/UVNC7JoOYoQdDBSVUInW8fj71bnkIZoeeu8KuzbLs4qkfBK4MVzYHYvpiMiK8kbFxI8POOj9gM18QihbzPto0LS9gKrELs46PVbow3zXQIwDL+C3OuK9RZ8kY9/UzB5uSbIuD6xt89YTyOPttHBIFnFY8fuPq+p7rqTWeaQqUCZjnIjtmgmnp+Sy/PZddO9rlsxNdbTlNg0DKJtbG7SVulbftqcEPRzvRMzNIUxnHr6GTFag0cUjIV9AqmWgx6LfL/14R8CzCoDUk25ZVLtwATG11p6P6sVOBtvzLVq954=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(23010399003)(366016)(1800799024)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QitqeEprbVVmMEtpMGFPTExDamZGR25TbFkxTHFxZElqUU81eGxtQ28vZzd4?=
 =?utf-8?B?Q0N2ZkVuZlNpUDVOZWRGY2twWkxwbGM2cTZOdVZKQmEybDEvSWo1Wmt1dlBQ?=
 =?utf-8?B?K0hiM0F1OE5Ubmk1VHNyN0xsWWFuaEo0UWQ0WUdVQkVHZGpFMUkveTVvY3pS?=
 =?utf-8?B?MllZN21acVBFZUx0ZEFtNEx0VllnVkxIcUl5ZmgrWWd4Z2RJTDFmQXAyTmZT?=
 =?utf-8?B?UllEMG4rR0VRbXB6NHlDbnZUaGQra1NnMFcwL3RXQ2VkUjkzTlVhTHhPbWZj?=
 =?utf-8?B?cERLTlNUc2Z0SUhJSkhPNGtMTFlmQjVNb3ExZ0MxWVZEaTJxblhRR0M0Nmww?=
 =?utf-8?B?dThwT0xvQnJKZ041T2d5MmFhdUZYQXN3cEtqeVZUdXpEMTliU0hYRFVLbHJa?=
 =?utf-8?B?dnhoL1diWHpHRk5uM3pQVmRGcXV2eXJsZzJkQndDTVRFdmZtdDZtZXJwM0JG?=
 =?utf-8?B?QzlNTkdtOUJwS2gwQ3E4Y2FXZjQ4ZG41ZEJSUUgzQmdra1hwdndJcXc2NFNP?=
 =?utf-8?B?cktGZmhpcENmbDBESEJzYVYrMm1QRWdLQ01qTVltUGdOTG1xeUdHQkQxTC96?=
 =?utf-8?B?RlFpb0x5VzZBZTAyRW4vNzRVZkVGRWRFOWtFQnhIeUYyUFhzNVprc1lzcW1X?=
 =?utf-8?B?Y2lLeHZQclF2OHNCQXVFNXdrZWpMNHpIVHA4WDJ3VmJwU2dXMUJGMUEyd0Rr?=
 =?utf-8?B?SXdSTTlvTEFXWUhwenZKTDFiV0MzOFAxa3Q2NXpPR3JaWHpLakRNa1A2ZU9t?=
 =?utf-8?B?REJ2Q0hJc1BYclkvTVd1WnZWRmNSTUhkY2JNWVdQRFRZZmlackgyanJNcWd6?=
 =?utf-8?B?RnlTTS8xQWR1ZDEwZHdXYkUzajN5VEZIMWo4T2VXQ0JhWGdncDBiQTFGb0pJ?=
 =?utf-8?B?eURkNDBnVllpTnNRbWZRUmdqUS9jVktHVzRtbHMza0szVnM4MTMvYUdGMzZV?=
 =?utf-8?B?RzVCVk10N3lKUVVEa0JoeUcvYlpuMEd6UWFCZ0NsUy9IcC9tK2JNeDRYS1p0?=
 =?utf-8?B?SnVQbDVoM1N4SUE2OFBydWNyYzR0TlpkbU9DL2xhREpXdHppT2w5WVc5cVI4?=
 =?utf-8?B?eXdjZmU5aExGcHVxbjNVKzIzTDlMZFVKWDVmYm53WWJWMld0OGxNMDVUbHdr?=
 =?utf-8?B?L3J2Y2VWZGRLZTgyMkdvL2hRVEVOMlZlUW81UVgvSEVKNHN6MFl1VWVXU2xm?=
 =?utf-8?B?QTRNemQ5Q0NEYmlQbWhUOTVObEJhV1NaMjZlbjVCWU9obmplaHlJeHQzK1Jx?=
 =?utf-8?B?Q2UvaDhJT0FMUzArTlRoZThOWEhXRmhtVTNOcVNJMW9lT0QvczRPZVk0eXFV?=
 =?utf-8?B?TGNBN1pSL0czclJWd2MxQk91aGtBcDB4TXJJUkpaOFFTQnRpYWE3YlBUc090?=
 =?utf-8?B?UnhMYmYwREUxMm5WdzRqZWcvcGtMYnhyby9NVFlLUTd0MmNWUHh3c3ZXb0hm?=
 =?utf-8?B?VGRjM3NJb0FSZWNzK3VQc1B2NlMza0kybUtnUTlad2RkVHpjWUtJaUxGekxY?=
 =?utf-8?B?ZGs4ckVEMGE0SytTUGtBVGUxSnlRSE1VQTlBU045S25Yd0R1MmpDVjR2V1c2?=
 =?utf-8?B?UVpGSjZNNE45bUc4eGF0V0RGemVVYTgyaTNGQW9PVDlXTlRvWmozbGxiSVJ1?=
 =?utf-8?B?RkZCdWtmMTlpS2JIYzF3bFRES1Boa1NzbkhiZ2hnK3ZXQlJZVDdSaWtSMVNr?=
 =?utf-8?B?SjFFUFF6YnB0WDdLQVk5OGJnejZVYWh5OTlXemZIeUtUVlJ1VFFZNEt2MkhJ?=
 =?utf-8?B?cDdRbXZzR1NEVDZsVGJXNU1rcG9hdCtldWhJeEhxYzg5RUdNODVFOVdYbWYv?=
 =?utf-8?B?Sk9xb055UitvbVM2c1pxQzUzcGx2eUdWR0x3Q0k0STRJV1FsNFdRQ1QrMGpz?=
 =?utf-8?B?NzViODlvaTJVUGNlcFpuWVdrOEJ6MWRVS2hSN3hIc3FhRXpESEpaWHRCRy9z?=
 =?utf-8?B?b0ZlU0ZOZm55elQ5Z2FLTmRjZ0x3SG4waXBRWEw4WUVuekJpYWQ3WlZ6V1h4?=
 =?utf-8?B?dnZ5cjFUTjlhTDFadmhtMTh5SlNhVkUxeTFQNjVoMjZ4UDBWcm1TUmZWWFR5?=
 =?utf-8?B?a3FxMzB1U1VxQUJ1WHVpcFVreTNDU0V6aVcxWlZEUnhMQnUydDlkeVJ0WXVp?=
 =?utf-8?B?UnQxaTdmbzJWdHpGVHAvdTVWa1VtaUMyTU1PZHFPbnZ5aUJ0dDhlK2dXZGpn?=
 =?utf-8?B?RmREQ21SU0RhUjRaeUEwRlVPUnRDVWwvQjZFcDZiU2VaQitOTEhybldPNUF5?=
 =?utf-8?B?SSt4YTAvT2lDejV3K2FxbGUzemllMEpxeXhlSWhicE91ZzRHZGF5NVlqaGNw?=
 =?utf-8?B?alB0RzUySmlSMW5veEpMRzIrWGtPcHpkTHJRcXpsMEVFS2t2OGtJaWhCMVdG?=
 =?utf-8?Q?UaRWrNwoThrwBNIBdh3Upc7H5CCHmDQWUEHtL?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9324e2-088d-472a-9a56-08dee0b542df
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 08:03:45.2177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kla2HXqzZ3B4iYrUc4M1pTbrJvfmsgzfpTNyhJDfVBDxztAfLXwwhvZOK1nL4hgTjWe2WsWvn+Sg3t2fCiN/b1+RvoVfJSFeZFAuDCzTendEjx/54qUVzZA/5gLdcc9J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11657
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67436-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:s.pueschel@pengutronix.de,m:m.szyprowski@samsung.com,m:mehdi.djait@linux.intel.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp,bp.renesas.com:from_mime,bp.renesas.com:dkim,bp.renesas.com:mid,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1105C7487D3

Replace the bare placeholder comment with a full kernel-doc block
documenting all parameters, the function behaviour for both single
memory plane (mem_planes == 1) and multiple memory plane (mem_planes > 1)
formats, and the return value.

Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - Collected tag.
 - Fixed function documentation.

v2->v3:
 - Moved to PATCH 3/4
 - Fixed documentation as suggested by Sven Püschel

v1->v2:
 - New patch

 include/media/v4l2-common.h | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 4e5c5ffaf651..33f5713734cb 100644
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
+ * bytesperline is independently rounded up to @stride_alignment, and each
+ * plane's sizeimage is set to bytesperline multiplied by the plane height.
+ *
+ * Return: 0 on success, -EINVAL if @pixelformat is unknown.
+ */
 int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
 				u32 pixelformat, u32 width, u32 height,
 				u8 stride_alignment);
-- 
2.54.0


