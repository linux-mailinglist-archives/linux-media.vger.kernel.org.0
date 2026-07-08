Return-Path: <linux-media+bounces-66970-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j+JEEJ0yTmrfGQIAu9opvQ
	(envelope-from <linux-media+bounces-66970-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 13:21:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCBF724D90
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 13:21:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=c8f+OVPO;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66970-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66970-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40D4E304116B
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 11:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3AB38837B;
	Wed,  8 Jul 2026 11:10:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021117.outbound.protection.outlook.com [40.107.57.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82CF3C3789;
	Wed,  8 Jul 2026 11:10:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509042; cv=fail; b=KphMFA8icbRs6SgdX4fn0CBid+k3Uqxcg8oc3bPMSuiuHDgrNu6kvpg8EcsUxT7Fjo8E1visRROM/He8Zzs8z34CoYmSK0FjIVg/s2vuZpA4y5rBqqKasQerQI3R3QSfufqFrDJcCEU7sZKkIbUmdPwv8NQn+bpie5weNwlyy+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509042; c=relaxed/simple;
	bh=CzIlD1nLa+hMXdbnYbgoh1pjVgb/dfuJLUVNOPQbenA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=H2EAlDQ2BkwvXGEXrRpTpNw0tuw+NqE/jPmCplt9AIUxy2RTqWbC9fis6hUuH5YCxzbxX/qxOZCgwS2GXoEVdtk21dWvxpyCzCtLowXogDKa6PDO639AsHzPxJcGydss5/LnGKhdnVwujiCv1gukN15MosSDuTsrWhQARzHS6Kw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=c8f+OVPO reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.117
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHZhoxsU2nfMQwxY+wt6eD4KgcfECAuCKsRgAHJiSFiXe/BjbRqThJH5XBLXupfPTVMA9flwelSkIkwuZRc/pAcMLpkFs/x7lcAdGEkyMYgI2G7fxot6zUMnXQmKskWO7Zcwf+PM7WtyQjwx2EIO8Y0KgRo+3sCl8Bya5GjOT1BEWZbDr61kBHHZ11iR9B8RjUCxwCSqf2V311Cp3B+L4uAtAqHo8ULjcqnxnbAiSssxGZHSaai5AArEIA5BZBvh3eWLRUqWhZCdEGVtEIv4MW6uBzr66DQtHOGcPBp5w1j1o8m0Hc0+P0H6tLyGomsAWVmVCKXNRsl7fg/RKXVUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKS8rrF11dfqYLbML7D/r0dWaLJQA+yFaIJb3Pgs0Jk=;
 b=s18uXZhEk+EilVm0wEjWCMZ8fzaLZAUfk39MsGYvaYYxpp7I7qx7/brb+HGNd1YgDX+Ce0u6oN69oHQDcjT73NqLMe+h7ZA/oN9i29rNG6pPmVHLHUZcn9D5yUApEdAf5FY7yAFvP3SsSo+1EMs/Z8zNMJVVh8IR/AMqgDZZR+EzZh4FA5oPAumRBVp2eBwSPVinJbb+ORhGb15rXgr3RYMCxOb+NQtiUlM2+QrSyqhi2niGHMtG1MTq97vkJopVuFlVC4baNNvjSSJzWDVpyPhwH/xo+VJRwOxFrHNeaqOqyjTPA0+VLluDJvYnkPm/1rdIS/IaPGptDFM5oXcCCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKS8rrF11dfqYLbML7D/r0dWaLJQA+yFaIJb3Pgs0Jk=;
 b=c8f+OVPOihYl452Oj4+EKsd4lnI8idpnMMGczmn9B2Uw7whaGv6FvmJQtRlWV8Gdm6v86wXYQPkm39Xa8InXuTC1lzzVbkwylrRRKHskvPTrpt0GxilqDjtIIESqZMsXObGqmqub+iz0usNAfO3azelw/1MoxWGmHyFu521cTzc4D4YqI/XeOWVD0cpFfjBq8PMfm4kEN8hpieFFuSMjN1EXuMI+nQr6jmEvBcNnQSSwjw0isgNCdtWK8MoG7XI8xbYfFQGrSGiaY/GXViHEurHfMt7tO2SgnfKXFhnu+RZ4OAv7cpkZyCGwYnCnzJql0GENEazx7RM0IcGBxCaCwQ==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN4P287MB4807.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2c8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 11:10:35 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%6]) with mapi id 15.21.0181.010; Wed, 8 Jul 2026
 11:10:34 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	vladimir.zapolskiy@linaro.org,
	laurent.pinchart@ideasonboard.com
Cc: tarang.raval@siliconsignals.io,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
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
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] media: i2c: Add os02g10 camera sensor driver
Date: Wed,  8 Jul 2026 16:39:38 +0530
Message-Id: <20260708110949.31313-1-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|PN4P287MB4807:EE_
X-MS-Office365-Filtering-Correlation-Id: d15bbcb0-afc1-4278-6f5e-08dedce18854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|23010399003|1800799024|366016|38350700014|18002099003|3023799007|5023799004|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	h18muNkYXo7EGnyVLbC/MxQWk8cViXxpzeXCiZPh48itrwCLIddgbnVI6Gd6i6M6IS/zWjvdJdItJGpFlJuC6+678A1hEc2hyEut22B7uL6YPSgWUEtOc3hT+/79jtf8f+Mrxw3bu5l64fSGsNdjnfep9FMKgeqE60cUPUzPDItdekHBUshDNTBa1WHhxk4IRPzxIExiVUgQwtwtLZ4Bywqc+xZEu0I/XIJlfgE8J6gV5Ig7Mt2JZVjYVu8GQMcWAN0a+mZJcIpzcgPxV4XEKyzwtelOEFL5CKVk6kzAsgI6eLiKUSpKgPdo+fJzAxhznWn4CEJZtwJWWtFwfpPVwtusZKN+pkTDZQL1BM67WDzR89wcGcD13QhBOALzPQzpt51Dn7cUZMRMATuZ0BmuvUJpuFsxEbBx/kE5Er8zzuw8gMLGT8Q4f3EE8wd0YGYD+fC/Iiwq8UysWH1L1JjDu5oxfky2ycMGEQ+KuhTaQWIIh3PsgphP7rMeB2d7FEWQ24Bwa0nweTP8DkSEockSCkWgjq0KWcxM0E362ThqgcSEkue2q4mY511KsL/eW2e74QcOMQRhntr75qo9m2gg5o036OhDT/oeCZwb18TTC0komAvB58h67ayRTBgPnsloNXt5R5Ipl1NMbNfqdjAStJ+D0YPVR7u3uzaNOIPSy+ZyjYp7uYXqfmqjj9iNSxN+oQgWkjmTUhpmCRmwOFxtbuV/jXamsirxLYkU9bQv2vI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(18002099003)(3023799007)(5023799004)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aLtRpy6/r6TUiwtLICD91dcv/K40lMCg0cmQhxVT7hlML4wOdw1OEyYdzkvI?=
 =?us-ascii?Q?lAhUQEpGZUwAPY9LK3J5tWTnGR+ZsOVy35Sh5PgyrgSOqaQVpgl9f4aGLCIZ?=
 =?us-ascii?Q?uwB9u5by6ane1SRaRj/8NbGwtCS5hPbcD3I2POF4R07L3i2x1F03jW/NdYEC?=
 =?us-ascii?Q?EmCNPRH+kwCbeibYtI3qU/SSifhlSOsteqJB6WkLE1qzhDaJjibmQVQRA3Nu?=
 =?us-ascii?Q?CEwq4sAeM1+tysPE5i49Rd37twlRjuCtCoHoEyMeTROWV3KZ38ymz3k+AQAA?=
 =?us-ascii?Q?gN/dsSlfKhWaylfgocPvmBsps9zXgFPA80jKa8TjlldFBOaRrrNlmnmAvyzG?=
 =?us-ascii?Q?Rc/iEcsHuCysY7HFdOjsEwL8biBjez2l0vhx4a6oV9xwXPdzA6WPGYZWbx6l?=
 =?us-ascii?Q?MQCUySWIfcXnu7yGq48g8wDLFcFJKkmJsvcIy/cEgFJXjgDmwO8+PHFOddcv?=
 =?us-ascii?Q?cgny8UVgfal/2ha2Y6Y428iPeUWrSOxAmtl5NrtlCMFG1f9wJ9oKGbpikqbt?=
 =?us-ascii?Q?kKDdXausKOmHLfiq9axSisGKdxWKWjRaga93uZCMMirSCcZkX6ekVKkLnpjq?=
 =?us-ascii?Q?GA/b8C1jgAjOeKO4+pbP0HEIjcgdMkpGLmkuJyfZbYnaxo9fx2y3BMqG1iv8?=
 =?us-ascii?Q?zCyReZ6G4BtDIX5/CV8GfM/xSH5WjuZlhn8HNBaGZ6BzmRRtqUuE9yCs0uIF?=
 =?us-ascii?Q?yvYH2w1oKtf0qUh+pS3gB9XwzYAoQu7WLL73GpYxnzxjpYq4YJ0eFkWgNnXG?=
 =?us-ascii?Q?NIaVcFhDLJ22IXAFx/G9eE0kNfc6o7/E39ZcVwLNrn6EbiVHsbp2+ZMToiyS?=
 =?us-ascii?Q?GiChXhBipmOiwIjPa81e1ovGD0CvmOe5oErAAos5NLQCh+gkI9x39aO7iUzW?=
 =?us-ascii?Q?GmX2Rz+/N1eiJdf0fgf1k9T9Pude9hZOvkDi0AvNlya1NuU4G+lD4xozZ2Ie?=
 =?us-ascii?Q?y4AUW2S0DddF4DEEn82+yCMF0w9XRUjEPhvS6A2He+ZzmGI2fHRtSMbjBXah?=
 =?us-ascii?Q?UZrXAx5Z4j/c8+h5h/gazFtaPw6LeKNTXKm9kNLFpeFNM5aywg7enT9wCszB?=
 =?us-ascii?Q?qMffitKQ2xBxAMEN76l/5NMrCYdC6NBFvi7iPil/ky9FAFCv+dXjI1uqs7CM?=
 =?us-ascii?Q?ynfnbe28e7q9I1jaayks/FR940Vyrtc/dwAI+VhCtKS6s2/7aRJru3E8q+Yt?=
 =?us-ascii?Q?G/Z8m7FmYY7sOBi5J0eLgAR3AmNyZsa9xpxL7Zz/PUYYYY0giSLIs0OJAkJm?=
 =?us-ascii?Q?CkkbL4UNI9AOvFlsEIl5Bgpu+jWL9wocaAa5p79TG9wuH6vOrw931bq+ShdT?=
 =?us-ascii?Q?Dp7QiB4lgTPdm0yUtBmO9EeHa8DekV/Jhyt0nKPR82jY70I+LCgTR1FQeQy3?=
 =?us-ascii?Q?myLu0mek1QHHjb/lvXlzrKHwVJn1XUy4QWzXX0PcEXArQz9tRmjBgjmg8jKc?=
 =?us-ascii?Q?Csm9BtcOelzorJT97NnbV2mIKEc85DfM0wHPvIC0hEJ9uk/YUARQlaK6Hbcv?=
 =?us-ascii?Q?S000jTxpBUOCFTHPkGAwUv8uj2AQnheEk6vU7nvY8DliedEAxgds7gHSJHGw?=
 =?us-ascii?Q?EGWFJbAP9BWdjg8VqSRZMJ39YFzkmUhyeC9XMNNZ5zgXx20KSjNgrfTaSFwc?=
 =?us-ascii?Q?8PaksgP3OG0v6Sz1YG1mEf5bRfPyhkWz4seyJYUqOUJMPdctparqQwiqAFyI?=
 =?us-ascii?Q?Xpav8W9EaXI1h+b2klmM+5Jj2QGJTr06eSLaYvrZlbvPVKeQ6dAJ0/UstYHx?=
 =?us-ascii?Q?pohLe0I7dMF5jY77/DVG+iRBN/nFnWI=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: d15bbcb0-afc1-4278-6f5e-08dedce18854
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 11:10:34.7964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eT2QzDQCLkLKaaJ0gGgoEVHPnJ+ngliDg9zmJ8HL14eVOEwYKsEgo4A+BhExtYUza5tX6sl0+nnsHVF6aEQtzrIThiKvH6kv/hDEKZkctluA80FU7Dg2dl+7fWUUibSp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4807
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
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66970-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:vladimir.zapolskiy@linaro.org,m:laurent.pinchart@ideasonboard.com,m:tarang.raval@siliconsignals.io,m:elgin.perumbilly@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:himanshu.bhavani@siliconsignals.io,m:contact@schnwalter.eu,m:hpa@redhat.com,m:y-abhilashchandra@ti.com,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,schnwalter.eu,redhat.com,ti.com,gmail.com,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:mid,siliconsignals.io:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBCBF724D90

The following features are supported:
- Manual exposure and gain control support.
- vblank/hblank control support.
- vflip/hflip control support
- Test pattern control support.
- mode support 1920 x 1080 @ 30 fps, SBGGR10

The driver is tested on mainline branch v7.0-rc2 on IMX8MP Debix Model a.

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

Total for device /dev/v4l-subdev3: 46, Succeeded: 46, Failed: 0, Warnings: 0

V4 -> V5

Patch 1/2:
- Correct typos.

Patch 2/2
- Remove the data lane check, as the sensor only supports two lanes.
- Fix the error path in os02g10_parse_endpoint().
- Remove the error message from the clk_prepare_enable path.

V3 -> V4

Patch 1/2:
- Add the required endpoint.
- Carry Vladimir's Reviewed-by tag.

Patch 2/2:
- Address small review comments from Vladimir and Sakari.
- Drop Patch 3/3 as suggested by Sakari.


V2 -> V3

Patch 1/3:
- Drop the fixed data-lanes property, as the sensor supports only a 2-lane MIPI interface.

Patch 2/3:
- Use regmap paging features for page selection.
- Use sd instead of _sd.
- Remove an extra blank line.
- Remove hblank control, as it is not used to set hblank on this sensor.
- Remove an unnecessary error check.
- Reduce the scope of the ret variable in os02g10_set_pad_format().
- Rely on the control value for link_freq_index.
- Call os02g10_parse_endpoint() before initializing regulators, GPIOs, and the clock in probe().

Add new Patch 3/3:
- Add dynamic mode configuration instead of using a hardcoded specific mode, as suggested by Laurent.

V1 -> V2

patch 1/2:
- Corrected $id to ovti,os02g10.yaml
- Fixed data-lanes property structure to use proper items format

patch 2/2:
- Mode-specific register writes handled dynamically.
- Moved page 2 registers into a dedicated page 2 block.
- Used pm_runtime_get_if_active() in set_ctrls.
- Resolved negative hblank issue.
- Improved error messages in disable_stream.
- Updated V4L2_SEL_TGT_CROP and V4L2_SEL_TGT_CROP_BOUNDS.
- Added my name to the author list.

Elgin Perumbilly (2):
  dt-bindings: media: i2c: Add os02g10 sensor
  media: i2c: add os02g10 image sensor driver

 .../bindings/media/i2c/ovti,os02g10.yaml      |  94 ++
 MAINTAINERS                                   |   8 +
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/os02g10.c                   | 932 ++++++++++++++++++
 5 files changed, 1045 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
 create mode 100644 drivers/media/i2c/os02g10.c

--
2.34.1


