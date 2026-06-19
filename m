Return-Path: <linux-media+bounces-65284-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qjX+D789NWr0pgYAu9opvQ
	(envelope-from <linux-media+bounces-65284-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 15:01:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7D66A5E97
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 15:01:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=jyNDKFSO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65284-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65284-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6719C3036614
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB90838A70C;
	Fri, 19 Jun 2026 12:55:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021078.outbound.protection.outlook.com [40.107.57.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E58137B019;
	Fri, 19 Jun 2026 12:55:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781873711; cv=fail; b=mFL16WHToEB6otzDHNUNTgUcTJjBQkQY1GN/Bhu1XoQk50OyUPS+FILJtclIhkyFBGflm4U+j8VDSlpg125OeeEYWWNPMpnpnF1q6Vxw8knNgBAvMDr+NXDDGJQMrAbAXE8OtWuSpQwTmzff5f3Hw8QbSlM2ohS/Qe83uKpdMrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781873711; c=relaxed/simple;
	bh=RKordJRZcp7+sTmAjENJkIiqsMXokX61zOCkPQqzNhI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=JjaKzh4xhBmgCLENwf4S60W2gAXP+WrP0p1bUPxSRE1ox3ZbpqkR8Tn/Krsks7JoZDkrq21MBHyP0hCKN7tQkUbjF0cN8F6lIq1C6S/2tsDQiqDuoMZEhsIketRcD5ywgqhTAb5eCbRnmeabfjYK0fz5nic7a9kUzNUV/K8UOkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=jyNDKFSO reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.78
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLtStjcNNbfPafJM5LH6zxgX5E7213Sf+AsUuWVJOp+xb1xz2xIhlJtMkwVlPvh5q8saX6D3vBX/aqmH4l2rnITGKuhVciHNYZ0X7yP/c4nyyLVowPW+rFGeHCkRSs6NjopSlTYbTIbafQ+QtDOa5lL2j7a2xhc8K8/vj9aogqXmBYRR4d7+l+FqvgBNEX/JZ4D1LhyMaA357I1IiDV87wsRPKy0KgNfKBeosTsB1ur8BH4tZqzRyeOJpSEqUFWbkNaaE1Yw+QWUxWhpvLk0ah+gicXTvn84jnhaMqGAaIu6qF6DCGREK76sqovieI2zgCq7beqRh9Dyq4jzjitSWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+4ISgmfhhRfLkLYfymzp+AWI1TaVnBTkl9wzy2obk4=;
 b=a/SgxPC8Vyxpe6XfTU9CVJbS5TfF+knAT0zAiW7ccbDxpnlD9C3MxGaBTHXho5/TjhXIIO4b7nMii0El4PyGp7jZP0+f54ifVBQ+lB2cJ1S4xAQOYQCTj7L7jWFvUJ+AvYPR4MUo/5ycMXb2ohbk+D/lcQxMvHMyl56A/YMGO2xOmnRt4IBEo7tZiSV9avMjPChdxE2Tch/yp+hQhOwlP/k/P6BsT+E+U6rY8eanhd5f+Xw2baP9oxq4AuYV04IrxzuvJzE7xT2nZ3CAbJiwoZ9kNiopPjCdfJF8fz2lD/kwNWguRi3Qk8tY8IOz21g3HxRWVmg3bE5dR3Fm1bduWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+4ISgmfhhRfLkLYfymzp+AWI1TaVnBTkl9wzy2obk4=;
 b=jyNDKFSOVWFh3KVFO6JIc9fR8PgG4fEoxOBOqlK+doI/RkReAxFJ0r1eP6GqWdZ5matIVKH83tA8cQMQXHQ4Bvlm11FTMNGI1OyK3Pl26uYcIL93BcW5O/xfXIMvDc6YGPApaniv+fWhAbPl2zMa/P9cuM821V/QhZAn0IS1xk6vVOClB3AVi5v5ZUvxKVNL09nIUhOHRequYSjOjWXEtJvWIpPTBzRdIu0YR7HOsiXUKqCTjMuh0H3yarSImTn8cogbGZra82EcjUGLsKLHXRwlalPOunYe/eMk1EKcuZcfOpMuHA2Ns/ij6i8g07oI2HDQgwEflRr3bsTVriYV8g==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN3P287MB1847.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 12:55:03 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 12:55:03 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	luca.weiss@fairphone.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Kate Hsuan <hpa@redhat.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/3] media: i2c: Add imx576 camera sensor driver
Date: Fri, 19 Jun 2026 18:24:30 +0530
Message-Id: <20260619125439.55311-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26c::9) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PN3P287MB1847:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a647a76-89e5-4deb-e271-08dece01faf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|52116014|366016|56012099006|6133799003|5023799004|18002099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info:
	h2qI5izYHb0DljLkpD1H1Yjvkp+Hy9qHUV4hkg0yBNczOgX7bNV8gfws+OtSnXS8Z5cnohhp4jDe3ot8+1DizRXLnjbks/UX1KtRm1CIrkW7txfQD1qs4FwbP2d9Dlc/9EqWmz5yYU743Usw7Zdr8lzG9R70hq3pmDX4EjxRQ0wjZIf/ie1f9KLZCdB2pQah7Oyxt/8jciQEiTk23U0/VmKXAd6fpu2qwVd2TSy2onYjalJ14gymjfel7AZlsrg+cNoOXIUCqWO54x9d4T9oz/O0qbtPMFA3d+8JSy5Gum2Pe5ilHdXW8cp9JAAuopmyEYReZDAY9coZNxVrqMoH60lr4cAGtZHC/2JLOeqC3duOZnza9z91PcS+6D8CltEhYdwMzBtJCTVL9dql5YbI9ENYuVyOAzhzodr/QZkuiuDSy+FLjNA9nKaG6LmyZp2RthF+Ilo6cTzyYecI9Hlhn1M7jmYmCQK0wyUhjlZGu3DqhvPX28AMAdox3uYQ7FmHkELUZdnxgRSN+6t6Qx1zfIea5R6+XFX6CovYeckXl7CdP8wMrEGFqRNcXje3gN+bE8GLJTLv0XXxur9ZPjRNRRKlIfb/4PxPFV5ytCt/i8eb4TL8Wjj/xr5L/4G6wzuYSbDhD4yQKEfNVK4kHvHEsCxMOpBK/H2+iua04CZ2gBf9rvIHVdAmOmAWGt+LsSnY5AJV3AnK19Vqe326GiuBcSSbqZbRBcATOADRpBHx/O8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(52116014)(366016)(56012099006)(6133799003)(5023799004)(18002099003)(3023799007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tP5MBgjh+u8BmPi/SwSPBCXPyLd8Qy7+suc7zyI+mb44E73WrqGQu/I1BQ1G?=
 =?us-ascii?Q?NAC3+V82630T5Qa/D+rNX65uSnw+XR51aLZ+5lDLg/KpsLkzZCp4umBRS5vA?=
 =?us-ascii?Q?0bJHiAmFBMtvWqbB/LNTSeIDHix1Cnz7N7bT7qW5hb4CqJnvNyafipX7gXOf?=
 =?us-ascii?Q?uqW0msgrmbbvks+KfD5j9h/KIPU+TEEQc7cV2gkHMsZqVWoEyqq4gwTcgcWI?=
 =?us-ascii?Q?95+13ua3ttok3yOsDBsu8jNsqhJsgLQjCSuPtuq3/drKqL+77oQDB+hbl9qs?=
 =?us-ascii?Q?MLx1VFw/GsAqcgyoHmkZZZcbkOh9Gr1oRMyncjazoj+YcAmj6GMUTxXLVKrl?=
 =?us-ascii?Q?9FNxPVSyaABVBLJA7tlR4xS3TtaIntMSsJ78WlOlZnDxhYQGfqKctqiNJG/D?=
 =?us-ascii?Q?9cKql93++olrpKsiiT5CZY2T01msGoT4rFe1GqJW24HI8qkXs/VCoqjKl2rH?=
 =?us-ascii?Q?4pPflO7RcLSYpz6ahxnWUTDrkQ0EUCq0ITXiHc5BGPpkRE7yvSHskqZVFqSM?=
 =?us-ascii?Q?lQFJmHGK2gZRinMtNjx8GY520LrVMdDt6ovxOEOrRrzWM4ECxsXogekXJtMI?=
 =?us-ascii?Q?e89gglHWFlAa86IZU5lSicaGbUeqN0up/b5KyKFGeEXao2axzBMdTihn8llF?=
 =?us-ascii?Q?TM4VLteBatvULmqzmAT4ouW8FXcyS05HAdPGG5GrvucCtlMvwQ9/L6SY1uUA?=
 =?us-ascii?Q?R3bG+75SA+0DpniSrCO/X4+fKZp7VLHmtfN5OLQwh0nJgx9fbKSbv3zP0rhQ?=
 =?us-ascii?Q?HR+YVpHZDeTbbUwNKYt4gLFKxVxUlAU8RWGVBZDU3apdVlwotkN6X9jdfVda?=
 =?us-ascii?Q?hruWx7TtPZnrhMbKtYuUYVQFCjw2k32BOwqFilK248xKpWTtU0u3trTg9gmA?=
 =?us-ascii?Q?wjhGLvpmAy13ReS+PH+8e3snm3hIVZIyl5R1wx4x3lXx+evH/pITXXN/ahVG?=
 =?us-ascii?Q?GsLuLAajWfwL7SZwWeQlOYRy97Gu5LlRmh9DnxaAm7pBGCQ3Ondpmm+SARJC?=
 =?us-ascii?Q?1MSctY7+f8OKSkhhbySisTYOHO/sqlQLVVFumyHBvPrOuRlaHrbNJp9Dxxly?=
 =?us-ascii?Q?pODB4U/PxXU5Zn5UpbNzuUfZRr7uoRKl8sIue8COsL+z3V3GtYcGydz7w3vD?=
 =?us-ascii?Q?dvuLZ9sskM/T/TdybzBwtrBZgK/0+OIQycCLZK9jcWbjKE8FbBEZXnTktNAs?=
 =?us-ascii?Q?dvslUy+c5skIp4tVPjvIZonVwE005ctbwICdgSCztjbFFm3JhZmdY3iG13Po?=
 =?us-ascii?Q?lRMvL0JflvW58wzgZ+NUs399p3r51zRsVWcS7YhJSY5sS3JCZ3n8s/pCRiAS?=
 =?us-ascii?Q?clyGG9MCpuI1utdARLI2wu9pkL/BczQVBi4eiSJlbUYtdx1TR9pQ7uAF88dI?=
 =?us-ascii?Q?O1t5DRg8FhslEYDRc/kuxl8/a/KyCwTP2kVTmoC6yxbcZpsl1XD6IS9JVlMj?=
 =?us-ascii?Q?vfsj29NkqJQIuQ6VQqcHsCmKIizpJWy2uuQ56nb2g3haH5/UIRIJMzX66MBw?=
 =?us-ascii?Q?gDeeclAgGWP74eNNxckfkkbTOgDbs7GXz569Djxv6DpfSV0iO+xevvRqgbV4?=
 =?us-ascii?Q?Gw+5wVLdVyqnPLLTaSD0RZ5seyHKTz6ZMhIbHDIPC+b03QRtELEDDqkKK85r?=
 =?us-ascii?Q?8ZMqQtdN/sijRbCDRQrfB+hOGR+vEj/YiBoYpGy+JABROqIoQXG3zPeY0gW+?=
 =?us-ascii?Q?nDTruNvixLbYJhf7B8DoIDLM6YoGzmUa6a7vCVPvzm0ucyRWHQI9zAs3gg+8?=
 =?us-ascii?Q?uCTQat6NDiMb2k0g83v6UbhOwwMIz6j+9gTGyM7PHE0XxImisuPS?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a647a76-89e5-4deb-e271-08dece01faf4
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 12:55:03.5057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 74DF83QJvCrM+fLt4uLY+bYiOa7avvpOIrnDa5Shxxlh8bYpExRiI+Bd9hlPktC2PABzk26HeJpmA+0l09ThqknRkM4FLsPHBwrBkSC7gT/SvZJTxyRP2lW0BMOusD05
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1847
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-65284-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:luca.weiss@fairphone.com,m:himanshu.bhavani@siliconsignals.io,m:hardevsinh.palaniya@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:elgin.perumbilly@siliconsignals.io,m:xiaolei.wang@windriver.com,m:contact@schnwalter.eu,m:hpa@redhat.com,m:laurent.pinchart@ideasonboard.com,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	FORWARDED(0.00)[lists@lfdr.de];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,windriver.com,schnwalter.eu,redhat.com,ideasonboard.com,gmail.com,vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:mid,siliconsignals.io:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E7D66A5E97

The following features are supported:
- Manual exposure an gain control support.
- vblank/hblank control support.
- Supported resolution: 2880 x 2156 30fps (SRGGB10)

This series depends on the SM6350 CAMSS support series
https://lore.kernel.org/linux-arm-msm/20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com/

The driver has been tested on the mainline v7.0-rc6 kernel on the Fairphone 4 running postmarketOS.

fairphone-fp4:~$ v4l2-compliance -d /dev/v4l-subdev21
v4l2-compliance 1.32.0, 64 bits, 64-bit time_t

Compliance test for device /dev/v4l-subdev21:

Driver Info:
        Driver version   : 7.0.0
        Capabilities     : 0x00000000
        Client Capabilities: 0x0000000000000002
interval-uses-which
Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev21 open: OK
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
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)
        test blocking wait: OK (Not Supported)

Total for device /dev/v4l-subdev21: 46, Succeeded: 46, Failed: 0, Warnings: 0

V1 -> V2

In Patch 1/3
- Rename regulator supplies to (vana, vdig, vif).

In Patch 2/3
- Rename link_freq array to avoid confusion with the link_freq control.
- Use IMX576_EXPOSURE_STEP in exposure control range update.
- Make cci_write() error handling consistent.
- Return imx576_set_pad_format() result instead of return 0.
- Initialize link_freq_index before creating the link frequency control.
- Replace dev_err() with dev_err_probe().
- Remove redundant comment.

In Patch 3/3
- Added the remaining supplies CSIPHYs (0-3).
- Add comment for camera orientation property.
- Move cam_mclk1_default{..} pinctrl definition to SoC SM6350 dtsi.

Hardevsinh Palaniya (2):
  dt-bindings: media: i2c: Add imx576 sensor
  arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony IMX576 front camera
    support

Himanshu Bhavani (1):
  media: i2c: add imx576 image sensor driver

 .../bindings/media/i2c/sony,imx576.yaml       |  111 ++
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi          |    7 +
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    |   53 +-
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx576.c                    | 1034 +++++++++++++++++
 7 files changed, 1223 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
 create mode 100644 drivers/media/i2c/imx576.c

--
2.34.1

