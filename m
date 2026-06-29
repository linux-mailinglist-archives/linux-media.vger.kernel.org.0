Return-Path: <linux-media+bounces-66027-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q7NQFsrnQmqqHgoAu9opvQ
	(envelope-from <linux-media+bounces-66027-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 23:46:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B46646DEF03
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 23:46:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=HBH4HycE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66027-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66027-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC3C630293E7
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 21:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA863CA4BB;
	Mon, 29 Jun 2026 21:46:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FEA2DAFBB;
	Mon, 29 Jun 2026 21:46:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769595; cv=fail; b=r72BdWFTx9w78kkvkGfv/ExmLB8/iqpC+AE+mVangT0yaNUXffk5z6gmBoLbP6VVDHVv+HBfkD6uTgsESqu3UolGjqVgVPTaWI/wbvHHOgLYV0qlGoayyJTiRkgapvIqLbWkFM0faojRy26yDdiag5YbAyJ3n3x5Bb4831dPPH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769595; c=relaxed/simple;
	bh=2ZvHPSEMZbsQ6a/z3TrBmeaEQu3ZZbM6Sw+zf4UdOcc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=I6YlEIPMFfrXMQtTrB+rqcAE5N+Xhdsfz3Ie/V99G062D4d6b9aECWprTWGx0o1hWC/MKqOuOCV0ePTtTYajr9LY68ZQxWFyQ7kR/nvMwZIM87CV0HZnlJ1s/ka02eswRVwPX/YdA7Ag2/NeMo+s9aX7+eBMjcx6u2txREFRaqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HBH4HycE; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlY854Vouxr8Q2CKWlU1OLAez7V68A6eW9YJgZwP6xx62kTAGkX5m8oosNJ0I2cC541zthQYVk98eXDnlVQ4CQNbJTtyMgehs6BFoWGL1PocCm1xVjJnXRfoMgCedklDuFKoOIsKkp6F4D8MquAtva+39u3tspyJ1WkrQe5abCi9vS3ECccgjk/JJYwK5GI1oP5aMEA/i/c4BixkyNQqkJe86o3OMuXYZPNBLfpN1YrV5jQKej9RLvhVzof0FYil/qlceRCjo1XXBRUsO6rvjlJsgecif5jDx30NePxGSgOKID97upsvI7AumvEyev0YbU+ozt7L4jLV+2/yWWFZjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/mG6UJVy2kzHTIEjfpOWHBi5pqmKexIBYJOP/4boTzc=;
 b=bBEWfpx2OWKf8HpCMTt/5+1YXeGP0qkF1/+e4wm+hnVx/VBhVysnbjeJHX+E8DEdCzmENZjfovNa2fkpDudGtJseBnMcxB1qJrewmezYiMDPgBMrGnta8fChMiJYKYnwFIIX/kXj0AEDdHk+Ylg6E3lED8UUBbFJlt2j+AS5MjNxiF4PTTH8MfPjom/cwlp1xIGFoqomwaAzUEffWTNPcNYTCawqqmRYkiGXyh9Qb6d+TOLRmiQzSJgyCWEoC88vtlAWVWe2OQwuxcmhZELO6vXO15wlZveWXJ3ftS1pTVooNnGOWiYYDPqDinh4nU5/UrZbUhvMwdJGYP9GR6nIVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mG6UJVy2kzHTIEjfpOWHBi5pqmKexIBYJOP/4boTzc=;
 b=HBH4HycEC9r1H+RGLLSXkJf9jec76Subd7A1AHYkGbyGvk1xG0CkuGAOVDLkw2wthvjFUmckAZ4jyNQ1OHsa89BrPVcHRFkYLJzZhuSo6htbrUsCOKTgH+7Rt7gzTlqoNOCZfiZllCdMMOtRk7/9lgu3oWgLBqC0gCpKFGEOc1oQ/wHNbsASsorXDBKwGGzlIsH0fMcjTs/tJqGPjKN8/kAmEj0ooqtkqpMkaFfx8V55R+JCq4acW4p4cCGhLussstOlv+r97aYAw7bgw5i6OQdOOhmLCkMT5jj/jDXhlC5aJwY8dpahq96Mf4IXnJExgdwIPmXv/KBMCXZ3acN1sg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB9093.eurprd04.prod.outlook.com (2603:10a6:20b:444::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 29 Jun
 2026 21:46:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 21:46:28 +0000
From: Frank.Li@oss.nxp.com
To: bod@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	laurent.pinchart@ideasonboard.com
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] media: qcom: camss: Add Frank Li as reviewer
Date: Mon, 29 Jun 2026 17:46:18 -0400
Message-ID: <20260629214618.2523099-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR12CA0006.namprd12.prod.outlook.com
 (2603:10b6:806:6f::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB9093:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e375da-dbb2-4ece-06f3-08ded627e038
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|23010399003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
 9pqf+B+4KBgT8ar+rG6jA7tAKzTQ1p7h/oV9UsfbnFleSClvmsV0M5wxG+YDDX4HIe/2xSeeD9EIScKn7qTbdKa60B5urRh1CBzUovHkT0Dq8mfGr9VQTzvZGXaLTgIiUMPR63HKPRsQcEbJe3Mas6ISEml7HQhR4y8MQEwWRJgd/Xkj12mC6E9BFmMZlE82Pls1awcCkXYAZOmTWKgxYE97+yBwCtYpJNrXIJKFrExeOY9jDpyXXPYOxqGcPWhXNTMJEuJ0OU+KwPZH2t0rEXGXlfheeNqvzwEE8/AYgd9ZRuquoX76OOnty3qSX5P0Lx18NWPPkNqFsZHq0Xu6OQnj1AT9kNPoJPvrSS6q37w0Wz+Dzd8ijki9TO28quh2mnIsAIozY1Ug0g/nvcRfSadJ78yIsumCqGZw4zIJy4Gb3EwvTPHpjq/ybEV8bHXDQ8aRgU5HkOAOi9cvDIxGsJ44PTdPi0iz14YRvmY7htV5aKKXO6S8+aEQ41bplmVtY38ucACNx56smQdjmS9sanROYepXpjzDhwDYJSccbDhyQFHbalCztLrN9p85R8ieiQhMZ8sOwK7BvTVMMYcYPU0FBFCBzoThrV9ja2kb/q8udSQVLbVkAQ330hNqe813I608but4IZ9F3XFVkkIimEC3NiRuzRy7XkUR7gCRovM=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(23010399003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Oe9rfWo5gCH/52T3VC/YGhTL0RKBBF1N4fEViULkM4xVr4DZpIYm8DZA/2cX?=
 =?us-ascii?Q?E+KQ0uP8IJbAhTvIlI7NbJQA3nNgiQ3KErnJAekELigEV0MDf7LwCPkeQyHu?=
 =?us-ascii?Q?0ArSVXeWqvxme6dm1L4twnqX/tuYNgH4uPvG7gW+Gd+nmf6dC6y+N7AYzEdg?=
 =?us-ascii?Q?2YLGtNlxFSdZGASReQARvQfGb5F6vypL3+vuuBsmWSs2dKiscUHfSgbiuH0b?=
 =?us-ascii?Q?TedGQ+1ptWQ30UIJcW34e15+T5dU5IY+rHxJbneOEPFDVejvO/5RzaT2dO+G?=
 =?us-ascii?Q?xjDMGJTUUCnXOqou9oQuv15TKFgHDqR0Pj70QtwzJhFb5ujovwfOKaEFGN7v?=
 =?us-ascii?Q?sSUz0sufCUWu2cRHvDA9uI+lQrCNkYH68szEaVpBv9QfrPooejDrIP4nH+IH?=
 =?us-ascii?Q?2iK8QJqRgwPPvtvhwFralxghmVpFPjsmg6ldH8WarCGF/RuWKL+rdgijvEJk?=
 =?us-ascii?Q?U0iqt5keZ4z1l5uGjroiETGHZQnr5TXnooh6UfdQhXA8pjNnnPq5wKMSCDcw?=
 =?us-ascii?Q?1sS91gjTGLWrI+5pTnD5fiepY1Ssi2IFOXhLFELdZWrgFkorO4rfJAqq6RNb?=
 =?us-ascii?Q?yitTVlyL0s099uglqyQX+j8RrsI2qTN/5BrEPK3+AgUOxbxZN9kUucmJyHEM?=
 =?us-ascii?Q?GW3G+//BlyCU9g8tRwJ1+Ku6+oMkTdDN2hrzgw9hWapYMPF2rA0UwGXTmMVi?=
 =?us-ascii?Q?Nd2rBpia3T6hwy0nUgj47I9GiMXHLDJ+oe2rvAyShBQr1mKbwV6QSX84dvYo?=
 =?us-ascii?Q?cT0yV80twhJEpbvGFjUXnddxM4rDcbmj2wtg+qKKZfAvq45sqidjKdukWxQx?=
 =?us-ascii?Q?YIduMQqT3h5vp+VmQrPJcmEHmf9rvWY6cziNhDnNSJaEZqvCTzC/JqUHlCJ4?=
 =?us-ascii?Q?00GY5EKD1BPKw4zxfX30ePwnwVqN2rYVWX+L6DWKoo60oS6l9xrTB/UNlqH5?=
 =?us-ascii?Q?F3kNhLZCIecAe0qwCRhB4Jdks6NNV51Oa11sXxmz6TC6nRqRRgnEA4XqGQsJ?=
 =?us-ascii?Q?aX09y9FobHKlwr+W/efTjc2tU8jQ35XGM0rh8/PV8r/9Kw4+2X+ZC91MJB1v?=
 =?us-ascii?Q?slIexgxvslYhUtFFsBTEWLgzfYtdZpl0C+WGzNgxOhk9X4c1PgsehKDtQi+2?=
 =?us-ascii?Q?GsNwv/wP8B4ath8tJxOpXZ47LnY5c9rQ8EyQ1bK7inDYk+YTwskoSxfswVmL?=
 =?us-ascii?Q?AC6qY1F/ghHRRrn0Pnvn58kyPWBgRYcMgYy+iArluZ71L9xRxSwmez+L2ITf?=
 =?us-ascii?Q?3sIDRekDZ/2CKqSvXvT61qyhisuPFhCtSJxMkBYrLF6LA2FS3EBxnQ4STm/E?=
 =?us-ascii?Q?MxPgwqU0aw92ROHOBNQiwxLlW5xv1j4Sa3ZXuipzyqRFtEuc23fDOEBmNBG8?=
 =?us-ascii?Q?nN8IDYXOSPyaeLJfMbuPfAvjZW3wf7LA0T6vadTXF9u9b3Pds9BJNvfOhO0N?=
 =?us-ascii?Q?79dRoXZ7eIYgjGqIGTrG2QdICouKuY3GDNht+yHEDq2kyijOacIf6Iz9lhPC?=
 =?us-ascii?Q?Y9cjESIdDrBifxtr/4wa2fwu5larD+K/R9YvA5dcrjqvdE810HA+asZgFAyj?=
 =?us-ascii?Q?Bt5x62ZwFXwHMKVKJJWOQIiPmpLfYthnO/EjzwLQK3eTYY2wmpJvopoaCtXO?=
 =?us-ascii?Q?8EcbGFRXQ+Rj8gSqIeycyn0BzvRm6qcGUpiGqdJkvjgxB/0ZOGncJ2fZLh8a?=
 =?us-ascii?Q?M7tP5YPQpXARFFP7MtKAngL0mrNnOyKbCHnoTB6aNZlyN+BDIAqvQltyJQ6H?=
 =?us-ascii?Q?EwsrV6T22uEC8qOiqmM29YSgG5PfHdTCSxCiN7aXWtEZB6W7bbSy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e375da-dbb2-4ece-06f3-08ded627e038
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 21:46:28.8587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/pHdotdkOcheroNM1U705sUgjkiWUOTgUoVxqiWpiap1KlLrGqFjx1PPoPQ5hFXG3YFRLmu3sU50WuF8o6lLt9O/ngWGFk/JXOB7mCXbZ/Ukze82yQy0iADGwJZoQ6X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66027-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:email,oss.nxp.com:mid,oss.nxp.com:from_mime,qualcomm.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B46646DEF03

From: Frank Li <Frank.Li@nxp.com>

During the 2026 Media Summit in Nice, a discussion highlighted the lack of
cross-reviewing between maintainers and contributors from different
subsystems. Laurent suggested encouraging collaboration between the NXP
and Qualcomm media communities through cross-reviewing.

Add Frank Li as a reviewer for the Qualcomm CAMSS driver to foster broader
review coverage and knowledge sharing across platforms.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 34b8dff9bd69b..361a4f447277c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22114,6 +22114,7 @@ QUALCOMM CAMERA SUBSYSTEM DRIVER
 M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 R:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
 R:	Loic Poulain <loic.poulain@oss.qualcomm.com>
+R:	Frank Li <Frank.Li@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/qcom_camss.rst
-- 
2.43.0


