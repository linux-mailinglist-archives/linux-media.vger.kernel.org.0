Return-Path: <linux-media+bounces-65049-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SPPVBs+CMWrwlAUAu9opvQ
	(envelope-from <linux-media+bounces-65049-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 19:07:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCF5692BDC
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 19:07:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=aJV4QAPR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65049-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65049-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3AFF8303094B
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 17:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8534B47A0B5;
	Tue, 16 Jun 2026 17:06:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011022.outbound.protection.outlook.com [52.101.125.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4B3478E41;
	Tue, 16 Jun 2026 17:06:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781629597; cv=fail; b=ou4o/yQcRpVUDWSquiuZnX7jb02Tj38ngpFznzc1f22yLMErJVNM1lQ7JNR1FEeQbx3p2c75ZyoR5bZO9OtlX5Vx6iKvxtHdED86gtLecKYx3SrCqi+3FciMrLZPA/QOiC/m1gMMgkTPo3oXA3ORvVEYEY0NYQcpF6b+lj6bENQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781629597; c=relaxed/simple;
	bh=2F6bvx8Fo8qoRPgAoic8F9OY5H0duY7mLXus0meBG0M=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XHkLVLFic6Dm9dD8RVGUot/aA8Vjhlcnpo2508lWyeKQTSAarceADjfB6k58l+T+6uc6T68n0QjG0vLsH0ZkxzynTMHjyQIhvhTH4MF7zoEoTPKN203LE7wgDKVJ5xYZ8URTyUSV6qtZmrjTWreXp0eDUlAd3PwPKNwObosKxaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aJV4QAPR; arc=fail smtp.client-ip=52.101.125.22
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6NKEiY4U8172QOFMj+l3OUvuzO0rsZWKoS1Hj9/oXrrDsQaKAOJl8ZQLB+xbUVF6DZ7gOvv1YVFfncUEoxMJjDllMPlxmeaJP2avCEQvPESs4yECjCnNdb27ulbVArp7eyRJJCW/WV4N7sL7SSCKuv095Zauub9CMctgYaJD4JF/8ksu11VselsMYZ3TJi59EV+xaRcPfdl2YbpSvaOYMfo8mj2aWsWUvqLAKOjbvyTNmZ4Dy7+I90kyqKahzdn/MMyh5x+CQRNKrXb+eQXe+2hbLtZJ5Aq1jPKKHPPozkF2HcJlbS8ET1V9cm8aigOR6cZT+k4rD/hPxHcgdTZ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/uEpWFGpzp50gZ2l3JNbHKc4t5nbY97Tvk2ofXxyX8=;
 b=iGWFR4nT5iWXdsV59tR5fRosR+lzznSw1xtQNncB/H3lQHN1Mf7aYwqB0rwJ6duVFlYWvrBJ7d3M9xEby83mHbYsDF5KCQd8A5g8Q4PTTwgK+f9ugE1TDPH1Idu/tXdo3bngBTkY4CnMIWVsrgpyjiLvJDvFvzrDSzC6v5a75B1J6HP/2nsEz86lpABdrVCs29biIO6MHkU1dM6xcfxTN1PNqkj16jTAmFjZC+ea/XNOWWX3LsoIIH/KUsL8EyJk2pvDIij+rHPwyIvvC+t7g62qbfbnTj2friblTyaReszGww8hhZFuOXV3T6YhwX3XyGlAaeZJz3hEhD31xFunOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/uEpWFGpzp50gZ2l3JNbHKc4t5nbY97Tvk2ofXxyX8=;
 b=aJV4QAPROqhGGzIniLcV/aIPDXYYTX+MHgmLM6ZUUhPeZGj+Ok0uVAll3BlD5SAJrkguCXjhbmS8At1j16fx1bziq2Mm6GADoOiBd7aL4o1kybHomzwuZR4OzHjsYgzMfynhfr0u618XXepBrQTDMC9/LtkDvNrWgOBacRR698c=
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB9637.jpnprd01.prod.outlook.com (2603:1096:604:1cd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 17:06:31 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 17:06:30 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] media: rzg2l-cru: Add suspend/resume support
Date: Tue, 16 Jun 2026 19:05:30 +0200
Message-ID: <20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0393.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS3PR01MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: 72ebedff-f8af-4f63-16eb-08decbc99c40
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|56012099006|11063799006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	SvFM15qX6BKPwTPOQBdOSZqeRj5Wtmpi/ViDgmWnCkCtN8B9+rKLeTGNk5fUddqcANMC4V6ecCOG2XwfDi/kpZ+o93/pl/WemUViPmoNfsWvsg4AtTyttZPHkBpjZ/fQIU6nvdx31DOZIhi8IL7xn0vpi27trc/5Omh9tzVA6GF+R2drFOOifQ417DAh1mmDbfGzeNpIFhWXctYRE7FFN+nJXK2GWeaK74302/lcD3AhO95mXay8KrixqkKJcdU032tpWKv5FMBAksoHR3K74lz1Dj2nQpMCd/0tNPJtSlOyZPSHgi1jS6BsSlQS8IMCx8QQO0JpkgUqwL09h31PCVH+OFZvHCPRAHo6DX8Uxzxljf+Iqm77Lfqv703cch4QwI6DA1IIM0Ov9Krzo39UhJXKbjoWCFcmlSZtTeId3KoCQVgJaS7u29XBGGBZ/WQRqX2wQ9s1mXkcOEAxmJ2mernZfrkPoJVdpzQRhGJLpG3hb5mn+QCEf3jzSAM5tT6s95IhxdGB/zOrbqfKz1jXQp3WmKDiwjMfq2AEHRRXN43c4rr8USMozaJh8ZYR5e6jCApPkuOt46//ccJyeC5M6TyRVvHhT+EJYlxUiDLnFmHkXYp/VEtEiVOS9eqs7bD9GVVbM1WOQocvkXPoDnD/raK0KFk9ZvCbIp+usMLGJWUVA6YPVflfrhpJTnaTmjSiop2j5nBrJ0abQ9+nO41Pqazoy1N+OOAX5DLrV1HWCnHR34HEqZ+1WvI/5rnyFC85
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(56012099006)(11063799006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vl8T7Cio2N64D+33lpqE315VwooAM3yTnqO65IQuMqAFaPXUlCGbgimF+MIh?=
 =?us-ascii?Q?RiXHRv9U4O2AVDXvlwWgEiLFGPyMAp3NmouwqO4dr19U1DoeFR68i1XSq4es?=
 =?us-ascii?Q?5b/MKP6PfGtJssGKehnlDyvOhJwx1IMn+RR2zxF5A3Z5cyobTEsbqofWnDXB?=
 =?us-ascii?Q?YtCVsWSQlvgivegtQLJyr3nKU0algy4d+Ipnyh/8zece48+8u/zX46TqcRIp?=
 =?us-ascii?Q?2QZHcBXLAFZ8ZstQv1iE0CHJKReAPTeQdXGlfor5e/NBR4VtvdNqwtXLWpcf?=
 =?us-ascii?Q?ki3s99WsdW49uAPmAYp9Yr51yIaIpkVJZe7AJCFEzI4zEBEUAolIvZkNX8kU?=
 =?us-ascii?Q?1k2wApklK35lMaFWTKqzgRVROeFDzENZUOfi98IXvmMX8YSJXkThAbewzw06?=
 =?us-ascii?Q?IzbNy34Bn05abO02V56zhgY56APseLNpPDG1HIFIzvHigpw14e8IW5/IOk3e?=
 =?us-ascii?Q?wqclKTyIAjhgieJDI20+YXdKA2K97eX88FXcCcozFg1vZi950WGnT3v+pwYW?=
 =?us-ascii?Q?ru5Yrc6UJIfm9yJM6Rlz7Md76P2fejKyNkCTNXm+UFJLUKdpdE1LHIrbWpTJ?=
 =?us-ascii?Q?k7sNa6UMJgC60Ys+Z9pt6mOoNdGO6sgHRzUD325tMSF8sLuWPh1g8hO1t76s?=
 =?us-ascii?Q?pdS5bvap/2JgMo+BVs80G5arqA3HM0wy3kjHW7PI9WRtJte3IEN/nPfKUmc2?=
 =?us-ascii?Q?fgIA1SLizDO/p1kxb9XK1rOE/0t6NxBjl04P37YG2gUiwFtwQSClGMVszIFW?=
 =?us-ascii?Q?x5e+RVtmQosIG8XHr8NT7lKqV7nWdsMGLMLcnf0EuhzTN4TF30a5ovt5D2A5?=
 =?us-ascii?Q?BQ580F97Tc8wq8/kKi3IM3wO7fuYH4WITgh5VelknVWFSyIzYUuCglwq4jSt?=
 =?us-ascii?Q?jrqqlQdIj/XVH9ggCjDPsTh8HAfRUE23pi2djrgYqjQmrYjfdVb8m8J/pKZT?=
 =?us-ascii?Q?v55ImJyfRelrr4fMBYyJ2Xw1MxDGKpo5faFnE+4AIyozBbiwbQ9tgZF+mmxq?=
 =?us-ascii?Q?G0CLT3EFwFNHYea0+GPX4UzQRNoCOq8w3Or+pF51Aqv1ulZubzbxqkaOYJI1?=
 =?us-ascii?Q?V+ROFKyW5Fo/Df0v0JAdehjfsbPyBYC6i41IUGLjcoweNtxpXhy1Cfv8WKP8?=
 =?us-ascii?Q?YvRyNjVGPoTxVwv7Qk/bftK/vEy/fFRTAwtxkx/kVnOB3BcqYF13Mze/NZGS?=
 =?us-ascii?Q?EjV/hnrdo+NqqOfMeuAgT30PTzDAGVdNcfyp0fXp62D0WL2nMEi7P0tM8VXL?=
 =?us-ascii?Q?CMrOV+UGe0dsNC9icbGmpL33X2p1nfLwILWDd2L1KH1zZvCF+yytppUD8WcR?=
 =?us-ascii?Q?z2KaIOEy3tfel6DTf93t5jbMDG4f6i1mAvrwWBk4DTkPs3BCRymB4qUxgvhP?=
 =?us-ascii?Q?FzniCnrA5VMLZdpvLpXCWKBbWrcMrGsHaGbKKtl2A86xFQwk00mYThw9bqMr?=
 =?us-ascii?Q?kGoq0H1LYeuqRqpyMhZcnyIvg6pH2FCP0DDtSCdZEUVzionjOaQeoVjHX0MA?=
 =?us-ascii?Q?zJ8kOZg6xPYZxQxwz5aPN0jYz7AZ05zJ18mDGW5VenN6uaLd49kRWXu/NjIC?=
 =?us-ascii?Q?dz9V+sDjJIyLU45lTIkcwz93uipIEfgphSEJuTkonwUwMm0jKXxNVMXyqlOj?=
 =?us-ascii?Q?Dw3USnnv4jaRIhd5dpSzIiHDGu6vn0RzFlv6cnU6+uX0dmX/Z6W3+x+/oEiI?=
 =?us-ascii?Q?o0xo6yhHG6MPKzEvm0F7AOzzsCC94XKZQUTqc7v7UPhiK6UaODu8OFzGz2/s?=
 =?us-ascii?Q?cJIdKxkdismRVLhnkkm0cSs/0Ry7/PAXNPo9q2/WZeTAJ7xHG3VN?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ebedff-f8af-4f63-16eb-08decbc99c40
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 17:06:30.7382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMU6rflpZ87sqM/pmkcmXykXZRbZm4DxjUiY54ieh2lkU5GH0d5UZjUCa6iARyR8NGI38YOjmNjE7htp3xbRKH3LUdipSXmMugm4gnvE62yvDTmTU/o2Mm88uNLMwFRo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9637
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65049-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDCF5692BDC

Dear All,

This patch series adds suspend/resume support to the CRU/CSI-2 driver.
The series has been tested using ov5645 camera sensor connected to
the RZ/G3E via CSI-2 connector of the RZ SMARC Carrier II board.

Thanks & Regards,
Tommaso

Tommaso Merciai (9):
  media: rzg2l-cru: Add device_link from CRU to CSI-2
  media: rzg2l-cru: csi2: Add device_link from CSI-2 to sensor
  media: rzg2l-cru: Use bulk reset API in rzg2l_cru_start_streaming_vq()
  media: rzg2l-cru: Drop stop streaming function
  media: rzg2l-cru: Move active_slot reset into rzg2l_cru_set_stream()
  media: rzg2l-cru: Add suspend/resume support
  media: rzg2l-cru: csi2: Add system sleep PM support
  media: i2c: ov5645: Switch to RUNTIME_PM_OPS() and pm_ptr()
  media: i2c: ov5645: Add suspend/resume support

 drivers/media/i2c/ov5645.c                    |  5 +-
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 74 +++++++++++++++++++
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  5 ++
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 25 +++++--
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 55 ++++++++------
 5 files changed, 135 insertions(+), 29 deletions(-)

-- 
2.54.0


