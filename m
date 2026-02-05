Return-Path: <linux-media+bounces-52220-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CWVNXv2g2kwwQMAu9opvQ
	(envelope-from <linux-media+bounces-52220-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 02:46:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 470BAEDC34
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 02:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 212AD301E233
	for <lists+linux-media@lfdr.de>; Thu,  5 Feb 2026 01:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F33156677;
	Thu,  5 Feb 2026 01:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Vt+bfiS3"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012064.outbound.protection.outlook.com [52.101.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B3E19A2A3;
	Thu,  5 Feb 2026 01:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770255958; cv=fail; b=K6jJJpzWsWIOxxQCwGK3zaqwut51HbSf3p5dDmDRo9rpIPf9/T80G4AXUAXKk2XMv5EIbtT91jOY/f/VMR1/jCtTSq+MczWqs7zM9tQZ1zCLcukXnYyomhehPpMwJ1ZpoVjzoiq/IvqByF2/z2WPlPG0tJux1Awl25RdYCqPHk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770255958; c=relaxed/simple;
	bh=htk0IAkKDSEZNmS8/mY8R/zbnSV+9Hqos7SwAjtr99I=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=j4+7Hc5DgxxU0uoopKWU9G1C219RzKF6WJkt3ejBntWYnNyU+oproDMxZna2IMh2k23TTYIeCN7zAPUqxcCer1ptg1a/8uxMP8iIwSykOWBs9ccg9/K5x8BOKjhbg+so9TA4V1FKUWE11tVqv4ywMFBCgTh0IH0yNOf6R80NUAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Vt+bfiS3; arc=fail smtp.client-ip=52.101.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPrOxKrCMIMf/9fB1+ulph1mrqSw5UWwLabKn1B2EfK4K/ybdJXhzQ18O2sEbq/lW/s5Sz30NXcerebq+COrzxa60dZrUfsh1GgExcMLilJ9bMiVJcSm1sAcmgj45jfjYv83/7r9z6MA5yRlMDLMyjhRj0/7jWpDIDYpTfqHV+SKSpBp59HCgD7qx++L5b5TkAlqO0e3jF/AndranUBEyusj4PmGj7kbMc6xFpRuDFt1LTw88OC8/KtCzWwrWBYFLQWqasSmHfpQzAuGlNEnQYTCktSpE6UJcOruToSCXKryAtSNDwJ3Vx/Tjs+L1OUoSjjHFq88YHiwS74WQGTMLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEU4HqaKOblR1aWcWMErEB/nDc5k6J292D+LeMo5uL4=;
 b=lHdMeLdmYcluxxatYeK3LCC6FcDnzWZpivuOUnMDBgCIZ/lNdF6L8dsTbmnBBUYONgTNHdfX0YnPd5H4Lug9VJNJ61xJfWA2tlXNFLX9lEUQGeeqTc39uggrmsmVVty0QejSPt0u2cpP9yZFdOax24v2hAnOL4QmoPUeRULVrmiLfmixyQ5VioM73hUt2tILaTO5sVZjPlVeseJNK1Km0bLtSeIuc6xv5C2jemG0xq5kslXdNbBWF1m3tH41l+b3ICbk8hl7rciYPel+m6PSySgwGh8PU0sWBEtLI4tb9yGdBPR/qwZ4L7rDzCrZO1Lh8eYIUYOpoLjRtPUO6W/3Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEU4HqaKOblR1aWcWMErEB/nDc5k6J292D+LeMo5uL4=;
 b=Vt+bfiS3S5f1/HXWx4AdJJuvW0DJiaFmYZm9v/wzfT3V6yfDllKrVf6/PMXzDOK7Cy00NvCH+IC43jPpMGNmwtN459I9WeyBIOVo4BjDX5JwJJwdDs4otam0taEOB1UeBj2Hfca4It7DRFwhbA/HNFc21q4E52DrizCaFLxYkqwuJpou2+7TNZr16gnR61aVjf9K6E9UDzI3A9M/vPegziwKCC23WkVo9ZDUutdEO0fAkyy/CLx4lQcVfzLlCvwlRzCiZyWZAbg4PDk3qORnM3lx38Pv4LMTWxRMe/ReAqJskh0zy8503GEFAQ4uWaNOPYb+dqzu01YgwP/D20E+eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB6895.apcprd06.prod.outlook.com (2603:1096:405:21::13)
 by SEYPR06MB5109.apcprd06.prod.outlook.com (2603:1096:101:55::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 01:45:52 +0000
Received: from TYZPR06MB6895.apcprd06.prod.outlook.com
 ([fe80::67c4:dcb9:9cbf:31e6]) by TYZPR06MB6895.apcprd06.prod.outlook.com
 ([fe80::67c4:dcb9:9cbf:31e6%5]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 01:45:52 +0000
From: huanglipeng <huanglipeng@vivo.com>
To: sean@mess.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LiPeng Huang <huanglipeng@vivo.com>
Subject: [PATCH v1] media: lirc: modify the timeout waiting time for the  infrared remote control.
Date: Thu,  5 Feb 2026 09:45:40 +0800
Message-Id: <20260205014540.379873-1-huanglipeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:195::23) To TYZPR06MB6895.apcprd06.prod.outlook.com
 (2603:1096:405:21::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6895:EE_|SEYPR06MB5109:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e9c3c00-4530-4d30-7955-08de64584b9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6ZbFzY40V+0UaWxzdnOqSF16fJx9bcSv3hCJWxvhrp3ybU5prPL1fUGQawMJ?=
 =?us-ascii?Q?pbymUSZHLzgTwZYr35nmL2C60gnUAHbkwYryJiEGScPzjaog+jTiNYMgU6X8?=
 =?us-ascii?Q?zr40uMxRTf4YQf2nF2EQ/tAmbishezb4y2BUEtvj4SJ7uAQrWEqO6nauQe/R?=
 =?us-ascii?Q?E9aYKBuWMyl41tuCWjUJddaTCq7FeKLp5NDSnU/C5GgIOCA3sT6ZNgmcTs0e?=
 =?us-ascii?Q?YcfZqL2by7sMoh+qTnJtQHpfHdTNLNXS73mz6pnVlNsDrlCrGn24acStbiBk?=
 =?us-ascii?Q?gP0fanbyGEYvcZqtzMyVRosPiugSPgZGji4Mvaw4fLwq70jtNoodiwBqeakc?=
 =?us-ascii?Q?+bt5HMMBJ0WgO+GR4AOwaXYN3tTsiOsTM+oBFcRIXoofufkZQ3Dw7coegdtE?=
 =?us-ascii?Q?0YEgiJhkHAKiVxSwCxHSZTOm4TV26gRGW0Ng52HpqZNIfZrZeH1pp+gnhSyJ?=
 =?us-ascii?Q?oentLb4RCZMY1B+GUSTbO5++KSIi+ySPGYS0VJmg9z+hWj/0w0IQAmAfNbSV?=
 =?us-ascii?Q?ic2DGxk1F/ehtNDMmESNOWLS+pqL3L5j8+yM4NxVqnON9ElQ+jFSW+YQl28m?=
 =?us-ascii?Q?cnDD4E15H2yhbGJZG4YjCSTmCYWdicdNg+suzSW0a1Brsvjvrk8U0JMFz8Uj?=
 =?us-ascii?Q?RyQPOeRtpcob1YbFniHM5qiAev+XahEHsM2reVYGtLTLTEr3S54DdaO7STzq?=
 =?us-ascii?Q?z5bj+u4D+GYsMR6qMGZb64hWaw0eh9swbJ9SefRNiMAY5LIjgYu/qd5ugzaA?=
 =?us-ascii?Q?OMOtGIbe2cAzezmPwMTrh01l6lYwjBuQe5E6AsL4lpsmkACI43+QOCkNgCW5?=
 =?us-ascii?Q?561WToD8X6S+SzfRQLKmsrztNAA2g3t5WtuQ3ICbNk8rFJdE5rmkiLwtSVLj?=
 =?us-ascii?Q?Kllq8Wo14MQ0uBYvUqECZ/55Q+LmMOjzeIqAtaBcjMccF6swQn/Aq8kEH5Bp?=
 =?us-ascii?Q?uTZx3PmcS4ol6ERUW8GWnO/fCwKzouAXdbO79vjP3QgGizfBNvXI3naXq0HL?=
 =?us-ascii?Q?wSBTTBEHqXWEx10G4Lc0XPlBaTotwv+AtISpWPOn0JTKYuTzwyv49ahCO116?=
 =?us-ascii?Q?I8IJ2uqdAEzK8FYqTjYBWfYmsk9itZeiVxGoVCuiCZAQCY8rcYl8n7WmWBwz?=
 =?us-ascii?Q?zvGzD3KTcF6ZivfDdCH8PslLluKYcTefQE2pwRqpWnmdYvxh0s0xGnxzd3+s?=
 =?us-ascii?Q?kF5lV9HoIaGsED4i5FxPBXFV5+gGmM+h26Cv6SDMorF6Qpbq9RImKI6N1TuP?=
 =?us-ascii?Q?zxnbmbP1S2vqFBj5w8AzwfcP5kWc3RSwtNNdE+gYRxYFO+ejnRHs/jLU/KMs?=
 =?us-ascii?Q?4WWoIEhYlbAR79lgiAj1eYEVEFq1saHDj4M9gMsdQ65AWDnJvE6IhLCH/ATK?=
 =?us-ascii?Q?pu3TPTH604zJMUSsPhsmwdlJhP0xwjG5qThQ6c3clnlhZP4SNuSgFvOPjDV+?=
 =?us-ascii?Q?yKqEVlbC+EQQ/ZAiQ3ha0txirQpamQ2gjvNjgml83JJzFj86CQxwQhMzasBO?=
 =?us-ascii?Q?+ORjGTJcPPEz3l4ntDwx3Xb5Cb4Wu7k/qL09wyUP4DQzD0kEkXSfRBE0l/87?=
 =?us-ascii?Q?1n73wR50XD6GrJeXS4WJuf6uK4QxeSEGa9KceYN5IZ0RJ2n8xjO10bfohw4Z?=
 =?us-ascii?Q?Ytp1gGenA7K1kDQi2AgCSM8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6895.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IycwJdqZI4asdd882mTOy8yRWpa3HlAl637g3fD56nrCnbJhJDNUlzUhxnfi?=
 =?us-ascii?Q?qdtQm6olmlkZmfuOpKI8wRpaQyPIIJc8pFuY21oFV8oo1NjDq/vmdm9zVnMn?=
 =?us-ascii?Q?nrlyPmbiB0fDSDpLL4aVvV5+rZPGCAtA7SRx4wIbzwIIjR7+gQwn9RdVqywp?=
 =?us-ascii?Q?HaAKTI3nOYiJdNJGs0X4WGdLGtjkGUnDet80pTRS2H/HlZwWooodXyTcnmHX?=
 =?us-ascii?Q?d7AyGkeSC/ZT7hHWWpFXrJRmaMKlttPQESATIspBQskUUuj+6ZHoOKtsKENS?=
 =?us-ascii?Q?Xkfx80MpPTHi2cQgDhQtHXUrVA1ONEX5XeasFoslIMDpm2gd9k9YNvqeemlm?=
 =?us-ascii?Q?YhvAOkVF2xoHQG6E5qztjRKPYhWp2HcDUcYzulsL0/rQkI4adnsP7Emq3+yF?=
 =?us-ascii?Q?e+8j27hiSfGYBHogVv6Cs1LOq6xsMexjXD6e3HUc1UV+muJXI9PiI2viD2yR?=
 =?us-ascii?Q?rce7oAgl5A7UoDVCzuxIVFvPwqXpxjXq9aGkQshb70nci2FpdHqlnrG2BUjV?=
 =?us-ascii?Q?IFOF2ddIyeWmd+5B0hkQ1BNeautsyPG/EiAOFocRgxt0GYHSOwuQZaN2u8QV?=
 =?us-ascii?Q?ZG1muNDRHGJ+aZgssh+SryTDkrWgVdu/v8xjLbg1U3ve8KhDpUTPDKZaGbTC?=
 =?us-ascii?Q?UZu1pH9cebRy3v8dnuSn2vMqAOINZ3SSyK4efvcvhDQwGc5MR81OYg0dYxKR?=
 =?us-ascii?Q?68xZYRn+ug1fQ2YYBfqll3877zO3cWkjDzTTN3LZvw0p8QOByZtMd5XfLcXc?=
 =?us-ascii?Q?Ondeb9eGJnntOKQmAiDJCjZbVdrBlcYdkehFYbwORlu+/EIfbSSV+i0KxrZp?=
 =?us-ascii?Q?pkr+aIujWTZLNCcYeuKDvN/4yYLZySQOXS1J4itXeIantoWWD+3hz6iY2X56?=
 =?us-ascii?Q?aagnTJlWEDcRWEQXbSzosaZoON35635mtLdjHlgv7vdnZGfyLqn6Dk6tpk8r?=
 =?us-ascii?Q?S48soRsPIKLxIuTLB3bZPp8OlKAvDaqF7ZUCDrnRPplHnKqRViBC4vWKdCZ4?=
 =?us-ascii?Q?QggelgPhGFpC//76aknlFsJrtSWIkZ+nprZ9TDTK+TOjCXDg/LHX0FCAKHuf?=
 =?us-ascii?Q?DrlfKHn/B6NrzASzKmW6GKf+qTAwBPYvIPoTR+jFVogTzlFwTEfzfzOgRPFz?=
 =?us-ascii?Q?yD4MNGko0FGhpmSfElS2z0iIur91IWPZRdOfwPdWV9bYQfUvjOSV7d7y64Gc?=
 =?us-ascii?Q?R9K1el3LA//GdSGTukUol0J14Cym+jSEnqdhagbN0qVUAq+r/Af3P43dNpXc?=
 =?us-ascii?Q?7mp3MD3u6eU9XsUdXE/rjuAtmL9DXGXjtdsJzmSgChW+9sr/gMSZtIR9MGFw?=
 =?us-ascii?Q?ErIE/jIOAsAXQJtJERNyOmyNo3S67hmG3NzQoZQvgui7BirXij9QQh7pmt0G?=
 =?us-ascii?Q?ZAvCo1KVjU/bNdKtfkt/KGmslWrWOUDyYJEUVFoOch3rzhPBsb/PaeRMhHtj?=
 =?us-ascii?Q?lz+qctyy9YiN6ZtBVM4bzo5+xo3oPEOyAterbSEs8QXoxEW1pA03E3W+vyjG?=
 =?us-ascii?Q?8aKiBFMZWL/EgcR8T7d2rxEhP5ZG8n61LvbIqkXu+2nP9sHnsRNahKkCKWu4?=
 =?us-ascii?Q?lBaRbu6gHMIjJt8KGpmWBqqHpf5iV1kgbmx6uh249eMJVROkrY19tpKESIqe?=
 =?us-ascii?Q?Mjf04wGYtDZccYDpynuLuGyN0pcpmkiqScPA9bRwMh+Plqhbl/1iBfhdzg57?=
 =?us-ascii?Q?3DCRo52aTrrBzfZr/ABGJ7dg7DPEGr+joeBpZE7X9m/oE6h65Hw5aiSYQF3c?=
 =?us-ascii?Q?Otbrc8dheA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e9c3c00-4530-4d30-7955-08de64584b9c
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6895.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 01:45:52.3997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMQeo1GJI0KgHDJ9V7VFZL6TKFOWNQ4tYjvsQG7PirH6BmNoCJCpbNLg1ua1LnVCXMyshZdM/40U9wkNmDJSkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[vivo.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vivo.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52220-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[huanglipeng@vivo.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[vivo.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vivo.com:email,vivo.com:dkim,vivo.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 470BAEDC34
X-Rspamd-Action: no action

From: LiPeng Huang <huanglipeng@vivo.com>

When certain infrared remote controls send codes, the kernel side
does not receive them, which is due to a timeout in transmission.
Modifying the maximum timeout time in this area can solve this issue.

Signed-off-by: LiPeng Huang <huanglipeng@vivo.com>
---
 include/media/rc-core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index 35c7a0546f02..9214f3fc174d 100644
--- a/include/media/rc-core.h
+++ b/include/media/rc-core.h
@@ -303,7 +303,7 @@ struct ir_raw_event {
 
 #define US_TO_NS(usec)		((usec) * 1000)
 #define MS_TO_US(msec)		((msec) * 1000)
-#define IR_MAX_DURATION		MS_TO_US(500)
+#define IR_MAX_DURATION		MS_TO_US(1000)
 #define IR_DEFAULT_TIMEOUT	MS_TO_US(125)
 #define IR_MAX_TIMEOUT		LIRC_VALUE_MASK
 
-- 
2.34.1


