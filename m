Return-Path: <linux-media+bounces-52222-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIOaOxz3g2kwwQMAu9opvQ
	(envelope-from <linux-media+bounces-52222-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 02:49:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 902ABEDC61
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 02:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26A63301545A
	for <lists+linux-media@lfdr.de>; Thu,  5 Feb 2026 01:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A609287510;
	Thu,  5 Feb 2026 01:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="llodvH/r"
X-Original-To: linux-media@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013002.outbound.protection.outlook.com [52.101.127.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642A39475;
	Thu,  5 Feb 2026 01:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770256147; cv=fail; b=VLqQc3L4avj7GYJ49RF/+GKbU8YDkmo7pU7Nqp7fC/+uCMHXphtmI9gFMVEosOCTRCjiQL1z3KqbgI214phNsmuaCQ83ahUjyMuwdQxrPYi4W1aYQuvSNMLAtjZpN24NPFBHj7xt0xOiQDnjL4STz/11j1wH9KpJIGqQCUuKSh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770256147; c=relaxed/simple;
	bh=Fe9yeXo2yQhEFEXOCoC3KOnjVYquoYqKWP3M41OjlkU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=OqwOV06undfONvGz80BJyOMlnCIscnIIglsyPu41/lDBMxguB4Wh7fbP7m4VXPaBhVuR8zSpirgd4vHCVPs058Uf86/21KQgbOn4521/XO7z2e/NICjLrUtZol8oo+Mg0SALg9hPfzNiWJkyJZjoDopnC7BCGrJ+i2YFDDlhzOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=llodvH/r; arc=fail smtp.client-ip=52.101.127.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cw+GA/ab2NwgBvUuc9TBRRQ8cvBuGgoNsUQUCEW+4Y126oT4xIDZmGFcYFFoifdARtMthM8rNKHeJPJwTJNLnr2RDlzVKkL8hDEalsEjcmXzSZuX2VNvWOz+jo3XK02vQLsJaEw61KPHCU7zjtWTOH88iwKljc5ScELppv9heAef/w3BKbGrqlip92PoBpcIzA1v2aLeQoDMOiZvdASSCqp6yrRxRPrI1QkzOIbaKJDD2ZLGytloB2zoG3UZnWX+IhpKdCJ5ajykYmQcIiuPJDGgJPdQNGqpL2UZ2BKMjxcRpi/i4hEpAzpS9L9PJp+XWMRIVtMEMrSVQS9fBno/rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUOYlTjl+wHS/krRXGhK6NLfQ8yN06wUGYxbnzrm34c=;
 b=FUANjKciMJOnVFZFI1Rig4K/Z3APj88YoBHE+gFz/FXIE3EMieVKBlM/OxBU0O9Gd25zv9BRLVOVh65qfVjAlP/phVpHptfQEk0tf7urRDv0wBILc/xB5xIExuFzS1APcHGg2JSoCKclWst+FUUH1MnO3uqhVpE+pJkQJb0KohjcaSnypCW54IAeoViD/1a6hspWLxKHRdzsae1tpguYiHrLjX6DFubXjMzldq2rZELGZJItgHfZCcyK1SESfsd8kFN7lWwwJwPJhQkOC2C7z3X6lUw/Ml9lOljzyBJe/awKBpv0Zh6XEZWD8sbKh9n/nqdHZAR6Oeu3lzSdJngHuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUOYlTjl+wHS/krRXGhK6NLfQ8yN06wUGYxbnzrm34c=;
 b=llodvH/rpZu6NP3wkvqwOhaMpdVoOy7N5VCGv9uj7k4AYjvy/mhyRLrne1iPgV7hmRsiFkyaA/62imBwq8+wYsEi8kt5apEMp4P2F+hzBN4e1wZ4/iHe6Hr6OiRjSGUgemg33iC9RPuugNb6FjPWQulma0sUDH3p+U9q16w/XqMwiP3f1Iz+LPa9UjUuCD0Y3nwSyM8vTAkMWdytmrOaKFarjOQN/h8UtCjZ/K50jyW+0CgssN16HL/thtTEpvNs9cK4ZSgeegS4gzmF9UDHpeA4PdeHqn8R9rcvpdFbDwIFpjKKYOTqD0giOBRW+EiLeCAONIlCAcTcRshjnFDkoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB6895.apcprd06.prod.outlook.com (2603:1096:405:21::13)
 by SEYPR06MB5109.apcprd06.prod.outlook.com (2603:1096:101:55::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 01:49:04 +0000
Received: from TYZPR06MB6895.apcprd06.prod.outlook.com
 ([fe80::67c4:dcb9:9cbf:31e6]) by TYZPR06MB6895.apcprd06.prod.outlook.com
 ([fe80::67c4:dcb9:9cbf:31e6%5]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 01:49:04 +0000
From: huanglipeng <huanglipeng@vivo.com>
To: sean@mess.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LiPeng Huang <huanglipeng@vivo.com>
Subject: [PATCH v1] media: lirc: modify the timeout waiting time for the  infrared remote control.
Date: Thu,  5 Feb 2026 09:48:52 +0800
Message-Id: <20260205014852.380814-1-huanglipeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:194::14) To TYZPR06MB6895.apcprd06.prod.outlook.com
 (2603:1096:405:21::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6895:EE_|SEYPR06MB5109:EE_
X-MS-Office365-Filtering-Correlation-Id: dfbd9382-f2c5-4f62-124d-08de6458be24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QqQCGHRYgq+1wOZh/zr2q7rzFiu1Ek/ZxoOA3lIdgHMMqKOQXF3Cv3jbi1WH?=
 =?us-ascii?Q?vwzgLF9XHuYDWs0FOZyRcFBXFhrcPf7OoO6h22Pu+4e5JsvyuH8UZL/IXRV8?=
 =?us-ascii?Q?o6G7DcXb3CRUI6lrC9ec//C68q3y+Gzj9hjNVzYRNsxY5dOFMuvm3m/vtXU1?=
 =?us-ascii?Q?kbJbEPEAlqQIoz3EpcqAZWfeagySDyP3oagq9g/C8/DN2e8XdRUREAdYK9Jw?=
 =?us-ascii?Q?K0yWu19j845IzA4EGf+T9i5JpF68CuNYOXmQX1++lBpCwuFF261UAR1ulHNy?=
 =?us-ascii?Q?s8BXnwugKPOYxLqRykDTYRhHjFDu0hA3nttLUatrchXp0ZZSkaDbPddnssl6?=
 =?us-ascii?Q?T8j9ICGMMoyW8Jfi2/vWn3t4uqdBBqdO6CIViMvkk2gltUCNA1eXYBQFpvDV?=
 =?us-ascii?Q?lb2dxYou5fvmms5ZjvTjLOpV+HhxMxGDqvI3Cxb8SJtUkuS1lA1DEcEAIWJg?=
 =?us-ascii?Q?SJ60JZOznWAx4Zfpznuq6ncS7Fz9eyvQZ6mJS6X7OyaKnNzB7SbLNzDv29Zk?=
 =?us-ascii?Q?cJz2xjD7rHOLSBhZ8iatc2uwXAFj+PC0fAfNSR7h38k0C5bF2cFJkT5OFenj?=
 =?us-ascii?Q?Px5xw8bDcmy0KKgyLTnfNVJpweybGGKkQ7wjmxysOCciefYXRtWJCOM83WjT?=
 =?us-ascii?Q?TQkfxGjH0NPRN+FqMF+zZCG5skfAMY1CF2JIyajJxQaub2igqNbnEHlRvnWg?=
 =?us-ascii?Q?JXnAlw3e8Qt4c4Rmh/ErbUEZOs/KvYsKzi1X894HO07WRJjLroSF4RKhfSR/?=
 =?us-ascii?Q?dCdNrTDq66m9uZFiq9BQw0OEfYT1w/Qh9aXry8/wEWStFY6LX1c8YQVJ+WzQ?=
 =?us-ascii?Q?stVKz6uZjqBhd1ekGgXfVS7AOz1UxdVmuUg6BDBSIOLvXCCVc8dU2BDZBQB5?=
 =?us-ascii?Q?eYXIW4NKJe8Epp0ObszGe6np0aUlOeF8gR+0UBOfHHmCegF7BIZWwNEYCRph?=
 =?us-ascii?Q?uvpyKw+Q2iGuYrK+dMWrAYxYN5Z+d92FXfCRI6KgLPwfZ4WjFDPSb7cCbCrm?=
 =?us-ascii?Q?Zh5w1Z4YLToGKSxpfZpVDxIJjsJOSObX+ISX/mQkR11XECb5cJyurHEefs5r?=
 =?us-ascii?Q?e7aajI2hr30R85pDPuRObmk9ZRk3Vx9q5nV69gG/+YnRViNSoFHe9lgNKSlJ?=
 =?us-ascii?Q?i4BNB01PfSggv+/N7D4UCjVFOd3gbZZd84Q9ddsZJ8+3vUt9WaEFYYjkUBSy?=
 =?us-ascii?Q?oK9Pid/02EIm7qUx2OQNEyQT6/HO1OWJaKcDVP4b9RUyLT2EZKbhvy/U77uS?=
 =?us-ascii?Q?KDOqaukU4px8lB+6OOG1o8shBeWKc7bK4qxw3QclTdLQnqQlh/sz/Wmq3ruX?=
 =?us-ascii?Q?33hojRlhTCQHQRyd/Ff5gt6twLnVKKwPQlh+Ak5Fokl0pdEMdAE98d+vNFWs?=
 =?us-ascii?Q?lzRUFf5GYn2QsCg+Q1poxQjL+KsHpJWC3xgci702EZ9OyWQqUpGuaOvGZ4Er?=
 =?us-ascii?Q?+U3214f/eOz3LpQpBDwgEyvmKRFCZIi1SYw1Hsr45YS6BfevWkCtXBavYgyP?=
 =?us-ascii?Q?MDRQ0BQ7quC1ScsdhwEiSDZy7fp/pBhhMTdJsB0HBdj2NEQrt4XbfQDwHvKd?=
 =?us-ascii?Q?IDvEnaZIWLPvM6JTNhvn71NI0KjVrf8Pq416zC9XBsIQm2nhMwVZG9yWPQkv?=
 =?us-ascii?Q?KNdcH3qQ0my/XaUMVtSbTbA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6895.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O8fHqZO+Pz0SQbtoxJVuhhIywMXWMV0jUWA4fOE99/jL1R9qJ+Ejny7mmMRo?=
 =?us-ascii?Q?hOI9ZeFQ+orJl50nnBleMsAeIrMXgDXAUvqmOTuuAPAUGABRHId48IOzCTqR?=
 =?us-ascii?Q?1mRayhqxdAHF+f6xvUr2mQnQcf6g7x5EkIw4CYPdiHSlIRmqpIo7+QuibKPP?=
 =?us-ascii?Q?inzYoteHw7IiqdkgwP8UC8TeJti0Kv9A7nOHBPGUEGFJa2yf0GdbqL+9yJic?=
 =?us-ascii?Q?YynrPp/yvysMLP7tp/NnLSqGh9DUoVmxyTQOaC3ZgTnSm4EvqP+uDAv+ezLz?=
 =?us-ascii?Q?iNfghs6F7jfpUr3elmUgvQGPt+tFqeisLA0wQ7/4u+ECB/WMKnv6QvuwnPyE?=
 =?us-ascii?Q?9EW/FLLf++WvNUwTK36Hj1oSdshBU1dO76nGgze+tCPXBmUaREJ4275UR+OU?=
 =?us-ascii?Q?5BUMQmeWGaWbkWE6tKNxgmFtxVq3KQPcJZLrz6T1MSbHO5RoxIDlwwPOX2nT?=
 =?us-ascii?Q?o8zioMqOCsu3m94w+Ts9GH3alNseNCfJwuve4HkZi23cA4xzKdQvDn+5IFqM?=
 =?us-ascii?Q?98P/w9PBkqiQbTOhB9zwDzcJCKCumBlUjfJVZcSNKrJhyzi0Yg/Spovc7Q5q?=
 =?us-ascii?Q?xFJ2NycIY50W/MYhfQe2112LVcq4b98gk4Tt9SlfoSLl3HUVlFuS1KVtFD2Q?=
 =?us-ascii?Q?t7OW+dlzKIMCDYofjQp59bqRlBsjLgmAeQX+UK1z62NjSTLQlZyc/QDKM8bA?=
 =?us-ascii?Q?nV6gEyWwN7A0K1JWOiPvt7R+7FMq8rlAh4RaE3QX5Mr/OQbAoXpQDuMSeP25?=
 =?us-ascii?Q?pcEYXFK5UXyc8tRasvoEHw/iK1yFDjTZIwcZMYco83U49ul2kjn9sR7aFa0g?=
 =?us-ascii?Q?OfUspZ2kxRoaQba4r2BS654Me7Lu7nL5xCxS6iBWPlqKNJRMu1Xle3gpxRbM?=
 =?us-ascii?Q?yEE8tDpCDKXcfxPqt1awIAV1PpaJXLRN60BL1qYB+1lTRxkAtUNM0D5xNS+R?=
 =?us-ascii?Q?oyjuozvvkJIBT4N/YocI9ftOCy8jExGRVtDvAZ7N713XOsBgFjl1M6BIZbKX?=
 =?us-ascii?Q?0N2rcT3ScLadvl+d+mr3FA4s6CrdzT6wqzoKkALFvNQpMqmUasjRer5pxaoz?=
 =?us-ascii?Q?K8ZOo9lr0G1UvONTYYRTPbDr76YQFW49T2Um5fhDZbgoDaQ9qMPUGvtZO5iq?=
 =?us-ascii?Q?jao+McjsyQ3iAQ242UnEdn0cqwMy69BbVrlYIqb15/BwVmeuBNU3hH4eDuFl?=
 =?us-ascii?Q?X7XwOvJl1UaSr/WA7bPoXeBdzUc3Yh8N9D5wSRFYWXbGlBk7n9C48Z367okx?=
 =?us-ascii?Q?O4LxTtsiYw6CymaEEB7ArtWSmaddGnCOl/pJZKjlFrMNjg33m7EOYvvDuE4r?=
 =?us-ascii?Q?D6g1/yorZGdsj1DBDhJyogejujmW6c8Qlx5RsIPoEpnyvRSZQ7Ff4a3d/t7i?=
 =?us-ascii?Q?+iLc/Vpxons2lPtReEkbscu+T/s90bo/azwlSFdnoLlYBQqnepm1Lp+tqrtq?=
 =?us-ascii?Q?uvEp68kyCKlE5galD7gaFlwOholSs0BWJBmnlGTjj2FLqDQhrxFfE2eHy8NJ?=
 =?us-ascii?Q?JeVFs9D5VS1baq4I4kklklc6rBHgYsPEKG/WnnjRfRVobZSxzXytEvTXDWU6?=
 =?us-ascii?Q?NWAyZ8rZKqH8dYjyT+DpDNZZz5SdCzMWbQxZvCW+XsB5vjm0WrmzOwvpRmh+?=
 =?us-ascii?Q?eMoP+Bk3dTshPFXfHG4ayF0wKzHsaX2isZSl0pL78RBTRkPFRu38iVoyqjzz?=
 =?us-ascii?Q?Y0bzfJVq62JNGa3LLoRWJ06x6bfKXujIAa7ihwsGorEWidXBvFQr8NA+gojA?=
 =?us-ascii?Q?PYK+lIrv2A=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfbd9382-f2c5-4f62-124d-08de6458be24
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6895.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 01:49:04.5129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ip8cg1NegVYN347dUvGKOyP2sehYXoOlAO3MvgJmfIJL8KNfoiaqOOrk/Bmu5OHaKH7jx6q2JzbZvj/rhZ+nMA==
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
	TAGGED_FROM(0.00)[bounces-52222-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 902ABEDC61
X-Rspamd-Action: no action

From: LiPeng Huang <huanglipeng@vivo.com>

 sensor:increase IR_MAX_DURATION to 1000ms 
 to fix long IR remote timeouts Certain infrared remotes 
 (e.g., brand-specific smart home remotes, custom consumer electronics) 
 send extended code sequences that exceed the default 500ms 
 IR_MAX_DURATION threshold. This causes the kernel's raw 
 IR driver to discard incomplete code, resulting in unrecognized commands.

Increase IR_MAX_DURATION to 1000ms:
- Aligns with common extended IR protocol specs 
 (most long sequences use 700-900ms)
- No impact on standard remotes 
 (all mainstream IR codes are <500ms)
- Validated on vivo X200 and vivo X300, 
 resolves timeout issues without regressions

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


