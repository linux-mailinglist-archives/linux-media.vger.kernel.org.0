Return-Path: <linux-media+bounces-66971-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OeXAHKEyTmrjGQIAu9opvQ
	(envelope-from <linux-media+bounces-66971-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 13:21:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCBE724D9C
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 13:21:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b="YHhx/Blh";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66971-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66971-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D412305CA23
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 11:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735903F823C;
	Wed,  8 Jul 2026 11:10:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021092.outbound.protection.outlook.com [40.107.51.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA9538837B;
	Wed,  8 Jul 2026 11:10:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509058; cv=fail; b=EgcxwFkrQqHMXuIWyvh8SoumANeF/M56wRlb1KL7Nraw1Cs3y7q+rltWRMLfFTVmJ7xg4peMY4CBkUMXnUoCu9BEL0DtfINOadhtacVyPq9G0WZzZ1xqcahKyqzAdKT9rjjgxfsl0dOw/LMb1exNGqJCe+vgb0psTGi4JqrSEEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509058; c=relaxed/simple;
	bh=Xb5VMEKBeHTHhsnSrZxW7LKk3AvlfogV9UAh7CSK+hM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gwiIAOiaQhYQwwIr21SWfwksnSkRSZsqUD+HrZoZjWodNTO527D4uU76zDC6al792Hn5puuMEPKwnbOkSb/FMeyQcDdGfpJPqgfOEFBa4PnuFbIhF+MS6H1fxxYsapIGpCzTJ4vVf9JgpR52JkZ5Pk5F/Ob7GiygCVWoC+ss290=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=YHhx/Blh reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.51.92
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nM4xxUol+RIX/iSCsx6FrPhVzshHSHurs/X+hcGndA3Qwfonv9aN+RTIoYprFUn87umv19dnWFvKXuTQS9CwwKZUJdGqShfZ4PKKsivEjGVNvSkzyuldwjze7skJhDWyB3qqnzbWuH38qkxue43MLl4nKpwkK2jZDujumj4opskfij1eQhPfx5wrylTL+JK9M+SzrIaMmOgw+th7Ubm/RDoVNzJgD+v49REci5heK+z1R1WR5VdMGYMp+9sg3Om50noRH/u4s0RVvrPofPalSmdaVvSw1pvh8126dAHnQEA4NIOp1sS5nzjLKIDB2byFdA5JtARfbPbSdDHtz6yX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehCKQnLxHSE4C4+WTDO3T0zTcTYYGdzF3pflJ42v4xE=;
 b=ms6wdO5+5zH4lRwHTEwU4gGET+NvOr0W/tbBlfGymKAVdL4OavlRBBrHfm+yCx00sfTiI6BR7EjvTMmRCLY0lVqycZbuQnhXMi6K9ji/v2of/1VXgDlrTZ2Z9nsL9TkvakvJnRJWTcFj5lMmQuNotUDSBZZCkUwMi0KyoQUfEaHRWH0uLIqjw1hcidFTCYhf8weI9Gg9XAw6IfABjthIQT4fcYzfQJV6i8cgka+ynBfAPVXeeFpSv20Mn+G/wvJ4P/gbH3q9O8DIj4sbpPdGejrERLaZ5WwfdP5xNM/u4TBKTsBMtHYrMIQtO9DdrJuIYeJrChrKQlsPhCyIlQSfvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehCKQnLxHSE4C4+WTDO3T0zTcTYYGdzF3pflJ42v4xE=;
 b=YHhx/BlhTWz10JE3MiidIvzNouKmz/ZSh0Ntc4I5o18swGBHm3HWG0nKIgUM3yZiFhed+veCOR4XWnq9dW1303fkTRiFYSrdcEOqwUmzfKp1ntpEkfRTftE/WKsX6ttxNwKW/WSnC3qhitgoWZdDqPWT95MmJgOKo1M635iex6MwulME+3z3i4jb4ejelhRwKhE+q8N5Xu4mrptaOqjOlQdRNkl3pUfPr4wNko0cnCvPOct4IoeAn9pL+WMF8ltNxtXTfEdEFOCEzFvbrlpXAQ2AWRjAFdJCUVtvZv4j6r+FEixK+GKSuDUiSFee9nLbw/JhOuHbv3I7Zi+xT89ctw==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by MA5P287MB6144.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:236::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 11:10:51 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%6]) with mapi id 15.21.0181.010; Wed, 8 Jul 2026
 11:10:51 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	vladimir.zapolskiy@linaro.org,
	laurent.pinchart@ideasonboard.com
Cc: tarang.raval@siliconsignals.io,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Kate Hsuan <hpa@redhat.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: media: i2c: Add os02g10 sensor
Date: Wed,  8 Jul 2026 16:39:39 +0530
Message-Id: <20260708110949.31313-2-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708110949.31313-1-elgin.perumbilly@siliconsignals.io>
References: <20260708110949.31313-1-elgin.perumbilly@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0108.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2bb::11) To MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:11e::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|MA5P287MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: bd6ab417-013c-47ed-0ffe-08dedce19262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|23010399003|52116014|22082099003|5023799004|56012099006|18002099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info:
	Vww7yU69fwf4e9vks0EwmJQa5eqIfO78O4HL2sq3zt8FHb/IRf/XwJZqjzx65g5018ELfz9oAYYDVl9LYjNi/AjUGLuDIqMtsW1TiWx0g5EXeVpOuQ0Xxj9MpqeRU44APKRWyeq2Gplga9FPaZOZ2RfmWe4YT7oKSG0yhj/I6IgIjBFsjnmmNEt2dHYVrnx/vMMR8F8X95mASj2dgiaxsHIpWUDP93S/PBolmxf9pob6Xy+0hz25sarnM5pmNK2apyF/VRs4Cf0xW+u2TLTQeVkEYZsP2domVxwkOZj1Zig5Fgtqv9DK8UClUCo00qCgUrN1CFOskZvhYp4RfReGPPqVnCAkXjK2x8U0rO2D6RlmWe94gLmSHlr4uttd54c/wmF52WMeSsktDU6nZCR6PYv2K0k6q8Cag1yWtWoa3Ep89wV1FrufdSki1L8HuGiiZQzabEPJeJuJPriUYbNnAfJr0pIJoJzaLVxcEP/j/iYT+ZXXbPlv7jzRd9Kn/VYOgydNoM03fUUNAXDyo4V+iM+SKpKSlW8v8cbEVzdCExq45yrTXLC5czy9033DT1sG3JtccT7fKMGOywcU1jRB6+A13iob3MfA0hSb3KcX08clFUWEduxlFX1Zl+J8HdFPHfnlnCOH2xYsj0ji2+8jbFczzh0TgfrDlbW/ktMP/oY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(23010399003)(52116014)(22082099003)(5023799004)(56012099006)(18002099003)(3023799007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MKUl2oX3KHXGa6JnfZUp6x6nJgh1Ya3Cn4ge2OJ6jr1OcXiUAMpubb1a1NH4?=
 =?us-ascii?Q?Lkk9x2TpadrO8FVlQo5l+QwWEaVtMWQf2FlTVv9P3Uihly+FSO49dXDwnZq/?=
 =?us-ascii?Q?PqKyY23VVfKCGtK9WGLP6hpbs3XLcMrCyirNzilhWHjmoZWROKHttRsjforT?=
 =?us-ascii?Q?fE5DoJ5aet6oNGlZ4Ue/7D4ueisKxAR8aqxsoFZDdDEPW/gHlQ6u2Eq0UpNe?=
 =?us-ascii?Q?nobnY0pQWZaNuWY2KaoeTtRN0dZCKmrHXZqrgtS98g28bROBtFB6F2hOZ7aQ?=
 =?us-ascii?Q?MWdbwQXkW2bHBMhJRBzczSXgzYAzhomleTQJ0OwRkGF8mh4t6ZDJ5n3M68ql?=
 =?us-ascii?Q?Nrj5JxYhGDiTWU1wxck2vxIHgUQ9lGftn9gVbkucgdHrF2joKL1vcbmtkB1M?=
 =?us-ascii?Q?JFK2N/rctViZqY1kg6EZKe42ztHFPHtQ9zztP2dzFFHead6XFTKC/xwRmiju?=
 =?us-ascii?Q?GARiVBFDMB6SKO1CHyfSHsFMVsBT37sN9ovju2HlMdnzhEIvmtRMcw/Y3pSq?=
 =?us-ascii?Q?FxvvpQlDMyiXPboZ4G5MHCi6oafaNri40AGWOxjo4KOjZnzn2+/rPJxc9JF9?=
 =?us-ascii?Q?jr9I9idLuuia4cghgT5ELJQATj1FtE89tpe1xP2rT9MeOZGQ8xfnWG7O8P0B?=
 =?us-ascii?Q?knv3QtRDw23epbpvw/fe5+iFZwm57CJatk0+57aqgg3rBOxr1VzHfTXN7inC?=
 =?us-ascii?Q?/vWGgW+WzuaDte/yrHu+Sy6BM7k8QfgUnNK1flqSEPnoyRf1l4OFKiDYn272?=
 =?us-ascii?Q?ss7PMww3YKc0weUucKRa5XGTFLEyx1wRaAuBuDESyxJwwUJROlerd4uaYISl?=
 =?us-ascii?Q?FrFDd4UlQoE7zHYsAqf89pur3ghmOUGv8QkrhfGBnjXZa67uQ5YowUJw34X9?=
 =?us-ascii?Q?KS/cOpvwtYaC6n1Hfs2fIglNstY6xzTxZRdADvoxuYNbGMogiAgY1eXoElZc?=
 =?us-ascii?Q?08zcaBpUTtDKN7slXlueztIg8n4sRAugbm/fXQbnP5GPq7dYkbMpQUhbsSez?=
 =?us-ascii?Q?jtMcgr3GDNWQKyG6/PZD9tpqKFuheukzsWDtj1B5zmBbrmiSkzQOWWvXYvsR?=
 =?us-ascii?Q?EMKp1/xvU6OyknLUWNirQCS7iMj3DnQKm2aKoK1K/XuYniixMtXAq1XmqEan?=
 =?us-ascii?Q?e9Fz/JseLmruuE4Ya3otrT3A1ziUqAy6KvUbDU5XvrtL3jNG6IPgfae+VSQx?=
 =?us-ascii?Q?SFh2gHxsotjaNe1jpTEG0MUUzRkIlsMOUU08O8XHCcgFQCyhe3d7+fHqIewh?=
 =?us-ascii?Q?0FHilZO3A8GjdFbm0h/f3T5uUVG6haT4DvT4M+V5lYCRZidY4GAVWCdxzFe7?=
 =?us-ascii?Q?Uy1JhBXyLe8If0HnMJmbL98i/BjvMtEQPRgQd5z2KZoV/sJdMAEKleUb0ik3?=
 =?us-ascii?Q?mAabFOwr98wK8izjIjfIIZbABWtbidKz3Usod7NQ9LIXnJt2yUdRSo8nOvTG?=
 =?us-ascii?Q?TBvnkGIdHyXY3dTIeZjp5/jQIqH7Qx3SWtr8QhfN9rsNwwg0BvSKye43MGBj?=
 =?us-ascii?Q?VKy2cOKKPkVh95TSFeHWmtJoQ84AtVibXBzZO3skvqpH/GRd8NHO7Csnr3cA?=
 =?us-ascii?Q?EL94sh7Zk8mWit4UmFSaD/mnkKz81q4ofXMVLdj5JAdfSSe+/E/GlQ8Isq04?=
 =?us-ascii?Q?S9wS4o9fwX2IKdkJig7SOwHoJVw1sok0Wqu39nzjvLMKaOl97YoFgnGCOsK6?=
 =?us-ascii?Q?5v0VyD+EAgmPGrhBPtHdk7NTng+Xx4elegiuqW60Y7zu7xrVHOMzVmVogI0W?=
 =?us-ascii?Q?AgiO12wqsO4BrHDulKT9Blokua1g/mI=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6ab417-013c-47ed-0ffe-08dedce19262
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 11:10:51.5689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27f9Rxak8wtMT8+FpMsp8KU4Qsdy7EZW5mFGnAS+AnKWZVHFHwrtz1wO8eWxROiIp7kkjNnxPMno1UqGELtTSglAu5aNpT0E8e0ovUi3wCheQ5nkO7yZX7EAV1S5LfY+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB6144
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66971-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:vladimir.zapolskiy@linaro.org,m:laurent.pinchart@ideasonboard.com,m:tarang.raval@siliconsignals.io,m:elgin.perumbilly@siliconsignals.io,m:krzysztof.kozlowski@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:himanshu.bhavani@siliconsignals.io,m:contact@schnwalter.eu,m:hpa@redhat.com,m:y-abhilashchandra@ti.com,m:clamor95@gmail.com,m:hardevsinh.palaniya@siliconsignals.io,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_CC(0.00)[siliconsignals.io,oss.qualcomm.com,kernel.org,schnwalter.eu,redhat.com,ti.com,gmail.com,vger.kernel.org];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,siliconsignals.io:from_mime,siliconsignals.io:email,siliconsignals.io:mid,linaro.org:email,devicetree.org:url,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFCBE724D9C

Add bindings for Omnivision OS02G10 sensor.

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../bindings/media/i2c/ovti,os02g10.yaml      | 94 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 2 files changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
new file mode 100644
index 000000000000..8a9c253c26b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,os02g10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OS02G10 Image Sensor
+
+maintainers:
+  - Tarang Raval <tarang.raval@siliconsignals.io>
+
+description:
+  The OmniVision OS02G10 is a 2MP (1920x1080) color CMOS image sensor controlled
+  through an I2C-compatible SCCB bus. It outputs RAW10 format data and supports
+  a 2-lane MIPI interface.
+
+properties:
+  compatible:
+    const: ovti,os02g10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XCLK clock
+
+  avdd-supply:
+    description: Analog Domain Power Supply (2.8v)
+
+  dovdd-supply:
+    description: I/O Domain Power Supply (1.8v)
+
+  dvdd-supply:
+    description: Digital core Power Supply (1.5v)
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Pin GPIO Control (active low)
+
+  port:
+    description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        required:
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port

+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@3c {
+            compatible = "ovti,os02g10";
+            reg = <0x3c>;
+            clocks = <&os02g10_clk>;
+            reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&os02g10_avdd_2v8>;
+            dvdd-supply = <&os02g10_dvdd_1v5>;
+            dovdd-supply = <&os02g10_dovdd_1v8>;
+
+            port {
+                cam_out: endpoint {
+                    remote-endpoint = <&mipi_in_cam>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <720000000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c9f2780b2d31..83bce5e9dc49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19829,6 +19829,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
 F:	drivers/media/i2c/og0ve1b.c

+OMNIVISION OS02G10 SENSOR DRIVER
+M:	Tarang Raval <tarang.raval@siliconsignals.io>
+M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
+
 OMNIVISION OS05B10 SENSOR DRIVER
 M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
 M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
--
2.34.1


