Return-Path: <linux-media+bounces-58578-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +G75IQ0Z2mkayggAu9opvQ
	(envelope-from <linux-media+bounces-58578-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 11:49:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBC43DF2FB
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 11:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F980300F10C
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 09:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDEA622F74A;
	Sat, 11 Apr 2026 09:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="OpLEPoE3"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021114.outbound.protection.outlook.com [40.107.57.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A04C1A683A;
	Sat, 11 Apr 2026 09:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775900897; cv=fail; b=ph42w48FkFv57iqHmHqYMUYZZPR9WZoi4uPh1yCAVd3VYskaWon/HzesSColALYJcKa98ND7gDrX7SvUs5XZ5w/j+VjmeuKwM8Ph4+sQNOVlD5KPTpLA/webqjDVZGCQhP56+TR9b+jYLDL/VCKTRslKUPQ3cjwfPv13+CCS8ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775900897; c=relaxed/simple;
	bh=np/Mb9ZK1pO/eHgDRBv2PlVMdP6vaSKa7nlJdZnrgM4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FF4J8R+1fd6eyHPfqSNhGrv84P89yDvsyOJORhvuBJry7eusNWZ3g/FRJZb1PajgKq6Sb1VwcXwMpU29H781a3eCaquGdBszJyeR0nO/OPrKICjjZiJ+wLDaXKitEBcVnK+MrgaeMkeXjAGyiw9dTes7UwHf9Rs7tfRn5KkS/JA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=OpLEPoE3; arc=fail smtp.client-ip=40.107.57.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cEWhWqKc360LOujD0uADayuaakbpmCuQCIBnqgwJ90Bt1torldMYwGaif/vwaGiZILsY/2pmaLko+hcxRe17I4NCi7LHMRZJMBoNMyBZPlqph8ebdpKNpx4M9dune0zHMdpSsiI+J/RURBR8cj/gK3u5N1kz2Ev/EizpS7ueOxeRBxDMgrEbIDZXeJvLqVA/1Zysnmr9IsEs34+WjPGidWiZVYB0C8yhuWCxhza2pnkHz1KRfcATMYpn+GRp7NlXDjXUFAlk9is/jn7Az2rwa9sXf6B0/LqCYg8VfX1q8rjuaO2Bg3eYlNEYunnR5QUmi6nMsSXIF/L43aYf/qbW4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3J8+ZWWAjBRyaryRpKG760vXWc0NT2MBJK1deQmJw2A=;
 b=KN+dao3V5EtxUdlQq4lVxNjVBy6HOEYm9wHrRp8WdVStLVw1zhv5jq71c/zuB2+A02DIKmOVOPDgaPm5QJRwhmMx5gsOLdK2KGbjzruJe8X0dIcDst161cmrAC82zO6mKHPOe6Sn9IW6rb9AZMRG0g7y+meM7uUrHBWY1/Pxkfq6SPNhYeGuKkm0MUCjk3ANB5yDPZjidHK/CvmSIomXcPBvsjGuapArc//pn2eVWLMBTgVYyYFZdGxhMsDZHp4vpTMeD0bttWVJipEkOxUE1WUOr1KlUTs7BhY1RWkbUrhEomMJUZyz9+qSC6eqNOJ6qFvMIDi73Y5SJgNqke+fMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3J8+ZWWAjBRyaryRpKG760vXWc0NT2MBJK1deQmJw2A=;
 b=OpLEPoE38dxsTEgJKE5ScHUeMoVwqyadjXYT4wmGn7uzUYDq5kWrx+v7oDuKKkPBOhj+YIkZxrc7UEQfvscKVfmnk4wRhgdK1dmN6zb15nuFFfLN+sC7O63/O1Whwr953jpybPAmULC6ae2SIB3NaQ5cjomrGbOHD0MIvc8GqwoyBNN+aFNSPnPZK6gZiMBjPQIeaM8iiXhpSfHBkbM5RjKLLXMIVS4VVNKdLo0cKuApmvX6eb79kBcojlCwkcuWHmAIVPhsUvbMp37CPgTLNEQTLZOj+JOQhJlA4H4mQwFJCcRF3E9uwI23SxSYj6nDAY17pIeCoSH6rKhZ+00UqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN4P287MB4782.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.44; Sat, 11 Apr
 2026 09:48:11 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%3]) with mapi id 15.20.9769.044; Sat, 11 Apr 2026
 09:48:11 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	tarang.raval@siliconsignals.io
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Kate Hsuan <hpa@redhat.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: i2c: Add os02g10 camera sensor driver
Date: Sat, 11 Apr 2026 15:17:03 +0530
Message-Id: <20260411094723.129738-1-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXP287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::17) To MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:11e::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|PN4P287MB4782:EE_
X-MS-Office365-Filtering-Correlation-Id: e47b5c64-8a77-4aa7-370a-08de97af71c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	t9mDrYalgqKTWwcAqMK1MPcBd9i3hm9rOnR0wHnmOn6QAcr21GMggp3AzNn0/eelRKWk1T8u1wTynOEsjgyXEJGMyYLrx5z5Aqa0Rx3taSjsLsw3pjR9nnKXNl+FMIY60dSrKNyj1e/ctLTMKLgEwhlrvnr1lK358JRaSYHbaOPb0YH+mA+6YC9w8WUSrxtSBtOETtqyJ5z3b43X3pkKcp/7J65tSFu0TJQmpIa29sZj2suxfKLB6UDQtZHAbNInj7VkbDgEd+4bBOpxdwsNo+r2jtrGJM0bNKQXxvkppigN3G5NendM0XiOSDdvtbh14IzvfvSvz2DCY6q3fc9/0Uy9/mLkT4vuY9u40SpLZcageLXZUcJ3d/suNMsGWOifPD70H0gw/iPpqIf1SmJ3oVbS58GgwKFs7JN5+9EUBkx7f+plHdF2mBb19EwGDpSIkhjXZG2gjjFmyQHZtLBkMWdRrzg2E32U6BOR9dnxhICT0UZlezMjDcSGR2Auw8G2dBm0mlrkG6ef3HkjYvF3/XUBoeTwvQjpWRyNNjkEdcC2Jcwt4wE199KFrU9xgNrApb+ZJhfztBbyYdNcP3I0DQ7cTiLHoVkF4iWQiFHnBnsrHyKKnvlVyPsHcBm6whApq2tulejTrqO94Zmr1GO/XfMdSI/kpfVWtYEWGyCMd8db5eDqas28+ZR4d8Bqg16onfYV3M4fQb2LdeI5FGYGSVcNW7O5HmZIQoKU9ymYR0qwnSqLI9sLLrZOK8JIzuAwXFsCKWlLMdiYSKU8C9nas85wmqqpkZ72DPYonYfGrmI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gp9VQlfNVAq5lEPq2/4pgwa0CepjoXR0bJLpyi9vK24KkCKA5HtU/DxuuQaI?=
 =?us-ascii?Q?P1a7+QhqF4/PnQH8TpisWqcSVNmlSBGnQLEhFtt7Pi2d9oPHLXpV5HkOrPh4?=
 =?us-ascii?Q?lT8jW9KvQtd/5HS/nvTBteWEQ3Xld9b76E2+cT53I0Hg1raBXpGYprxV7WlE?=
 =?us-ascii?Q?F7ZVVOFEXHdcee4MIN7D/yIYeaIRua1LJDTNn+XfgcF/jO3ZzwVgOAxDc47k?=
 =?us-ascii?Q?xzontwRMqhKjtMQCkB2BP2YAN+8KAfuRfiyJYr7gsmaagtayJJ91fkBkKyXV?=
 =?us-ascii?Q?KE/ONLmLS+X/UIumwydaj2MnUQdRUVyaVsM5KxFVNi4Za0HGy5b/i79CtseT?=
 =?us-ascii?Q?RG5t6vd7nzDefx6qxtfjpgX/5d3jUEV3kJgc4e2wzRRcmE94tLAgMYo26f4z?=
 =?us-ascii?Q?5oRsYCrMAN9KLwiwwif4vJ93jwblXaKE2hdrBRyhmeA+tjSIK5JsPhjGV+vJ?=
 =?us-ascii?Q?hZnNCpORColK/eqera79c1MUoUSFRhAtrXUiUg0Mjhc1t4Hoe7vK5RDQ0CqV?=
 =?us-ascii?Q?3d05NY+GEgY0QwxPPCq7Rn75WBeDk2MhgOnBQjP/sjNogmiNtbvnJeEL354J?=
 =?us-ascii?Q?tdFSJH8ahtbWYzgjhCh7MbwaHUzmqI6eGTxntsAe3zXedod9hSWM08e0KDiL?=
 =?us-ascii?Q?3y2qGFF1orcjdAZD3EWTU3ErTeNlbHmHJOOAkhrRTTmkoKwsW7HgVxS3Eq4u?=
 =?us-ascii?Q?bJvo0+7MWFnOXkyhxDxoLC0uTErTfl7vRIuTCXWcW/4mDqfnDFMnRMwFzkzm?=
 =?us-ascii?Q?6JgjZEBqydvSHnqtCZQsGvDyKMnvgoEgV6Ktu6TdOB6DM83y/jac9v2AVYKN?=
 =?us-ascii?Q?j6yk4JiJs+2cooVCgQp0GgFxCCwnDLkpca0c5ny8RzVxK7i8Uh4pmskIJGov?=
 =?us-ascii?Q?/1zyWSph6PSZBtEj8agdtA9gzhmoXOF99nF7COhdnePXiA/w9PItXEWrIO6g?=
 =?us-ascii?Q?F3uHV551ccuMeQItKE8k86DB7cIz9fPrfRrR92aYhkrOg454dPDRQcPn4zQF?=
 =?us-ascii?Q?QxvQHLxzPhD8xLszT1J8PcC+uwq5hdQJX6oBuoQeKwhKSWRGoiqB5DvFuMEQ?=
 =?us-ascii?Q?34ihJOMxM0OntOxjYLW3nxAPwtcPWO1q23IsDrP0JAljTJPdx3nsR/XAz5MF?=
 =?us-ascii?Q?XVd31c5TJcnOo2/QHKtz4B6EfAzw5rfnqdGVAokrZ2NsV0m2vOJ/S/my/YyM?=
 =?us-ascii?Q?i2il4qwTxsrVNPU8MmKrBFYeqEvdIgHllmODM6ldxgNKy3hOolagIHbqxlhS?=
 =?us-ascii?Q?BN57pCI+2bfe3p8r1LdoXZ+dnyYotKKbJJXRKmm2Tr6DwvlXdYKpsEsv+H2o?=
 =?us-ascii?Q?Zf7oY2PMgkNw9KU1ongINI92anC1FicDxD4mIJxg1Stb3D8PvB15u2IEjyWd?=
 =?us-ascii?Q?O2pgxbBOIqNuyul5LMv47GzCHe0poOVw0xbxhWOjVhyyOEgtmH6AOZv0O113?=
 =?us-ascii?Q?R/dA8PxQxCdVQT0NTd0LlqZsy4FfQPqwTa+7L5r771lEYYbh/jga2LAbmmrq?=
 =?us-ascii?Q?56SnDqYcCwJ2ooQN+901Cfz+Mj4cUCg+4dP/5QAqwJHcACyBcSarEmyhZq+c?=
 =?us-ascii?Q?Z52AQSJFv/ol+UThb+muH3sd8J6d0rRIHocbHM+aTDNH0xOpDn/CogJS97rb?=
 =?us-ascii?Q?dTjW/WP1bW97hlKasRYv2Oo5ogYXQ5OVlKDx68zTh+Sx3RfPn6zQCmRV+sbF?=
 =?us-ascii?Q?u4FVEr5uWvwnX9jmPZ0eoPGNiWejyTqkjGnXhnyJ1D53zYIuq2AF59qmQsIf?=
 =?us-ascii?Q?VePbmIkMtlHsdp9G9gV4ZQYE7RTLW/nmxEMUwJMnv0uyRMwvbd4f?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: e47b5c64-8a77-4aa7-370a-08de97af71c7
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 09:48:11.8316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2K7HzzCTVzdQryS4LvrPSbJ0l7o6QZv+4yREoCWyoKFkEhaQn1DrmnY3+ceITsVvgh8vs9Zi1T4QGPURLq16l/KZea3vXYGHIwdUNJeCCyVqDTAlnnVTaWQCtxtfqFqo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4782
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58578-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,ideasonboard.com,windriver.com,schnwalter.eu,redhat.com,foss.st.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: DEBC43DF2FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following features are supported:
- Manual exposure an gain control support.
- vblank/hblank control support.
- vflip/hflip control support
- Test pattern control support.
- Supported resolution: 1920 x 1080 @ 30fps (SBGGR10).

The driver is tested on mainline branch v7.0-rc2 on IMX8MP Debix Model a.

debix@imx8mp-debix:~$ v4l2-compliance -d /dev/v4l-subdev3
v4l2-compliance 1.31.0-5387, 64 bits, 64-bit time_t
v4l2-compliance SHA: 5508bc4301ac 2025-08-25 08:14:22

Compliance test for device /dev/v4l-subdev3:

Driver Info:
        Driver version   : 7.0.0
        Capabilities     : 0x00000000
        Client Capabilities: 0x0000000000000002
interval-uses-which
Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev3 open: OK
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
        Standard Controls: 13 Private Controls: 0

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
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)
        test blocking wait: OK (Not Supported)

Total for device /dev/v4l-subdev3: 46, Succeeded: 46, Failed: 0, Warnings: 0

Elgin Perumbilly (2):
  dt-bindings: media: i2c: Add os02g10 sensor
  media: i2c: add os02g10 image sensor driver

 .../bindings/media/i2c/ovti,os02g10.yaml      |   96 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/os02g10.c                   | 1010 +++++++++++++++++
 5 files changed, 1125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
 create mode 100644 drivers/media/i2c/os02g10.c

--
2.34.1


