Return-Path: <linux-media+bounces-63835-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JmSaGA7NIWptOAEAu9opvQ
	(envelope-from <linux-media+bounces-63835-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 21:07:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5C2642CC3
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 21:07:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=mSYA+b0o;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63835-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63835-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A1CC3014870
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 19:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64543355F57;
	Thu,  4 Jun 2026 19:07:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013067.outbound.protection.outlook.com [52.101.83.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3893F29D264;
	Thu,  4 Jun 2026 19:07:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780600068; cv=fail; b=dE5lKajF13LNmV5HQJDTaHE5dvzJvv9V03M+C7zy5zwdsFw7vK7UhK2A3LXukdES5l89scBKPTy5Ms10Zlo7Tm0oMrL3XcQZrYpAvoqj3kzYYaA8c8oPyMb5XNYROOrngiYPQ6s396pB0Uwd4KQ1t9HJxV1e9JUYoYGsSRkTdm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780600068; c=relaxed/simple;
	bh=o5zHf8EF8etvuQwix3yohX1vzn6sQxS0O2qOc+Pj8iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Bt2RcfY59/RtpxiCRGRZeG2tdg7NmlGsauUp6P8uU0YATU65kTLp3oFgxvAEJU3QoANlVIj23PgTjRnGqlSmu5pn+Ufc4ora40ys88ph0eFoFxt1utm9wWcM+1uTN6vjg4Vb6PoxsTET0inRQKIWeIQXXALQlzU79FMhpsjloxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mSYA+b0o; arc=fail smtp.client-ip=52.101.83.67
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8ch58i1+jvBS6e5yrtWZDb9rMFROCU5icEJ4CkX4NIbJ+eybBc/p0wPZGpHl0C4YsZ8ZpV0z12vnAnwkM/iXLBCurta9X9i7v2BrcfSsNwGECs5ceMmvOJ9I2BA67Ol70Lb66O9Sr31sbiftCeIEr6NsNWjlJR7afgrt9pIJl7b6Hkg9DF0jB0EbDJsChW1svLC4mfxFc3GQ3uQr4zZOX2L17HPWqac45Iaajb9hw2UO6uFswJmAhmfxB0i7wsHPR0J0ULT3iOVUX4jdITKWAfIaYjBlefzrAJKpEhpRDM+F9TJXfTczIc+I4CpaseMSWHZsTfi9lDJcDe8gSISGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCfb50eB/oY0rUN3oLM8PsXismVGH8gNzLOGDc+uKNo=;
 b=IoHo2NHiMzumz55OkQgRwMvjP/BdJ2TixoRnqzfoIkb4y9oW7NZ+2QDs/jTzsSiLiZDWJHpWrt7S2hg/Qb1L/+bDkOL99dgV2LculsjA40601dzQcGPgHO90uCur0Xld6+OPtkPqQicmqjqOuaTVbesaMtSUyTFvSNt2VksgyZn+Fni4NJswpTYmFNrequX3+zrl4vJ62AF9s0N6aQkLMf2GUz9ZEeDVgzUbod218o4AIkNdZuIdHazPuPU0t2GOHGx1gJrpbd+04+mY4NYPrwdRfLyYLte8nc7Ya6tEgou2LLe7QUgbvpKq94MeigxTql1kZgZYGNgvbm4MBWC3wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCfb50eB/oY0rUN3oLM8PsXismVGH8gNzLOGDc+uKNo=;
 b=mSYA+b0o2Lbo+w1vEBL3pkNZRZFZAaL2BBaLxmjK5IxwFZlg5rbp2U2XgZdTmqMe5B7963KxO6jyYpVXth4gsK0U5i7csXiG3S46abMROWIEhJMSeTGLmCkEArocunAVm8DGDVgaixxy7BeJxTupJnrzWnm0IUphQlqL9bqvDeskuuXtWUCEwEz4FeewXSDLRCLA/9VynmDKFVqHAqC7SRuc4CtUlW66/Ha+9rpkGgWBrocD0enlNjjtichZ8fKv511OyDSiiHnFV5cPBOZcpW4Epx8uJvckUA/gzlfU4W0VsZe0Iw4cc52BWGjnKORoOnlLr9qzB98ZK5y9aj9Y4w==
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9961.eurprd04.prod.outlook.com (2603:10a6:10:4ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 19:07:42 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 19:07:42 +0000
Date: Thu, 4 Jun 2026 15:07:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: David Heidelberg <david@ixit.cz>
Cc: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
	Cory Keitz <ckeitz@amazon.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 3/8] media: qcom: camss: Prepare CSID for C-PHY support
Message-ID: <aiHM94-IDjiJWeqe@lizhi-Precision-Tower-5810>
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
 <20260603-qcom-cphy-v6-3-e50de0b557a8@ixit.cz>
 <aiChDyKleAYuzjMg@lizhi-Precision-Tower-5810>
 <43b7da84-3390-4094-a61f-9e887660eb10@ixit.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43b7da84-3390-4094-a61f-9e887660eb10@ixit.cz>
X-ClientProxiedBy: SA1P222CA0163.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9961:EE_
X-MS-Office365-Filtering-Correlation-Id: 4702584a-fb1b-4535-786e-08dec26c8de4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|52116014|366016|18002099003|22082099003|38350700014|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	TkIyKW+o1/ffXmFRNL5zvteBqsT1v59Edh3hN0eIhOmY3IcCKImuZhQonYP6kI4r4VqD2KZ+C7j+3ig7cZqq9/g8Se94andKpbUVYQLex6S8kFfK3LGXKgvBw2W8ylwaAUWU+ytzgft/X5TM1ldwSowjYz3l5JiVUJc9C43XSdWnn0hR6T+1wCExhZNv/jmKfolrYf5PY6vOmHtJzfoHDHvKmr2AHr5S9Xhm4n7q36eFAbG7mV9M4JSuJKafwMUF3vJsHNtcdrk8kcYkFjrc+JxQ2Ab1FdrYAWt3GjNiJO4RjE02SmdT741HtiViT/7usEDDbW9gk6lFWV0I6/N0bYGy5HoPWZfICaMQ3x4RSi6mPwc4V0xqyEXFd82+MQAiJQ/VBELye8ptR7OOht68h96C9/D5iLhBT+wrCxgYnVRG/EtoU8nXuj8c+c06n6ZY73Ljuwd9yqx9QyhXtY9om7Xz2eVLkSGDc8n9ebhHJh1mZ8Qqlrql7q5PvIk433TRZLW4VspfKOS0hsLem7YchBwKmaWEPGP32HiEuSIOxNnMOh1fdBQ/WnAeFJUhJl55x6dnUuN5+XGkL9Z08GKhQh+LNyLIRK/EcPr0ZDxNxxIbBbzbQpm7LXn85Plt7g8qeyMSpcZ0tX/FiBelQnMMFMLqKHC9WWF5+edCDKRPO2CW6iw+D0mmFnSFeE+v6o5ISYg+ZCV7c/zAM6Pcsc6izF43rGWG9K3ESyBBd5zFkmQlf1y1+4hSoIfQInwY8c4q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(52116014)(366016)(18002099003)(22082099003)(38350700014)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X9ip8i7+/8HX8pQrKDS0szx8rTrASHtjUeWm3ukmh9Qr6dyZtWUXfxm3Bjny?=
 =?us-ascii?Q?VgbsngkRpWjFxwexVryBFFzf/RsmU6DXo1exyVRU4kCYG+0s3tOY0eBlWgIi?=
 =?us-ascii?Q?lKbQ8Trua4gIvAeEQM7iirmufWvLFUzEXAWPHu+fr11/KfhyVJLIaRHlylVF?=
 =?us-ascii?Q?6+GO8P10Q1rziuYju8Td3ywNMtKKNRlIGYmzwXm9hyIroZcaFnZeXj2hQAkT?=
 =?us-ascii?Q?nIXKiadmuHVYJ6QC/JeVUFN2wzRkxAmfs9cWOWUfvDITNzl0HzXgEbT8K6hE?=
 =?us-ascii?Q?6LWpYtgoTrnt9Ribvf4XDE+ripsabF/Raw0Pn9Ue0pe+/TZy4zSQNHbbhfD8?=
 =?us-ascii?Q?KuHRENsl08j6FAWU4VZWHAFObICBJDUsWHGLtG3OzA9YA61Enu9hXPBwMnuC?=
 =?us-ascii?Q?o+FQ7XuCn40bgLLQ2uYZ010YlC8MSsGHTt1dt+sw6aRV1oZYGaAebsC/50jW?=
 =?us-ascii?Q?9wnKyq++4R2lN6MZN66GKYukNS5l4rmDLdFMg/3UiG43czjlI17PQ9SHB6Hf?=
 =?us-ascii?Q?1ibcT0MiRkg/M9MN0mblSa5OtbD8utNvjVzufP8Gln9QCVj5M6AmuuygYgE+?=
 =?us-ascii?Q?lr44uhWC168Rm8+v9mC0RS1LJVpJpokxgIh4zOoenOgMCCT239rEeVICO6w/?=
 =?us-ascii?Q?0J8Gbr/JMk+cO6KCkJlUI43q10l2HYaJvYZXhpoBn0VnMzMQ1d9TuHD9LUuO?=
 =?us-ascii?Q?UWToTl3uFTGkHODpwCUfGsUzuNferqiytrMP5sqeDa0RcEY6hL2VJdf4KUzg?=
 =?us-ascii?Q?6fZdVPchslRaOT0UtF9EA8rRHf7f34TWO6D4W5VtIl/dgyF+3AwkFYvguRUE?=
 =?us-ascii?Q?EjUspiSkC2MH/ckwEL+2+7an23tqBN0iuD1KB/VKq//A2P50s18RGpg60fk2?=
 =?us-ascii?Q?vimHvIfE/gFJXCxkyPeZt9tqD9RMnBb0rrAoH920i/PeBABn3wEMPa8y4zPX?=
 =?us-ascii?Q?wXVpEFl50l4OQj+FNVK0VF911VDRAjxlW8ruzBi4JfIfWE0NkCc9kcz/N4Wi?=
 =?us-ascii?Q?jU1nYogzo4qgbataEamjT9VU7hVShWO2Arv7R06rAkMDlNx8QOlBRHPpvVXS?=
 =?us-ascii?Q?lHyf5UPaS9jw71z0IpbTSQAnVaSLRSczC7jN7IQKU4Rm+ySt8k0i3mjn7RLJ?=
 =?us-ascii?Q?+0wtvYnXLcB0h36yHEONY21QaPIk+94sRCJAZMcBJMquM2X1lCTkAOnXbSrh?=
 =?us-ascii?Q?KZx64uBdtCSiDn+IbTman7iJz7lDSgYaHyyUcSDFFRRcGsV3TUovnP80/Mqu?=
 =?us-ascii?Q?3sgkxZAYy4BL4lreVJMesIQfu+cs16/Zp8+kIwAi8xZkFy8jSq983Mnn/79l?=
 =?us-ascii?Q?OHfMoxwGVgQZHhULgvINKz1FciiFYY6FkkC7HMEGfXNcAzsWZwzYuwGdwt+s?=
 =?us-ascii?Q?BXbeYwcnBXDnyqVHe99L8VUMp9t5x2GLkK8awyGj7AHt15EjuKeZuqm8zOLZ?=
 =?us-ascii?Q?/JcW2lBRnf8kBX9f3125SUOwA5oRZ4dXOsBdqDsd0DTVsu+onQE47Q4GKWhl?=
 =?us-ascii?Q?Yg9JdDAxMKy8zc2bVjZiW1KLP1PW6406FYkYB2/M2fh74TU+QTLuFI+yzdLg?=
 =?us-ascii?Q?8gdJLE4y1WT2vSLHHXG4uuQaTm20FR97erignFCRIwkMkHVrX4TTm+GaRNZW?=
 =?us-ascii?Q?mvsnAomjxZJ9ZJDMXvaXElqtEreDEhUerrV+SPC7i/yOVZlqgxqX2HAPOXY2?=
 =?us-ascii?Q?eR9sjnh7IW/WGOLuu7S7TSCcVkfCK+Y8m4Ai7pPsgFlO56YyuhiF0FC284Lf?=
 =?us-ascii?Q?mn9yWxCsjg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4702584a-fb1b-4535-786e-08dec26c8de4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 19:07:42.7512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbTCpPBfDesVpvUfSqRAgCbQF0S8cqXkFXIeGXUP0O9qO9Q0geFT2d3z2TY6x39CTChzuWVii7JZXd7vavBpyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9961
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63835-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:bod@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com,linux.intel.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lizhi-Precision-Tower-5810:mid,ixit.cz:email,nxp.com:from_mime,nxp.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F5C2642CC3

On Thu, Jun 04, 2026 at 02:34:49PM +0200, David Heidelberg wrote:
> On 03/06/2026 23:47, Frank Li wrote:
> > On Wed, Jun 03, 2026 at 01:30:41AM +0200, David Heidelberg wrote:
> > > Inherit C-PHY information from CSIPHY, so we can configure CSID
> > > properly.
> > >
> > > CSI2_RX_CFG0_PHY_TYPE_SEL must be set to 1, when C-PHY mode is used.
> > >
> > > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > Acked-by: Cory Keitz <ckeitz@amazon.com>
> > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > ---
> > >   drivers/media/platform/qcom/camss/camss-csid-gen2.c | 1 +
> > >   drivers/media/platform/qcom/camss/camss-csid.c      | 1 +
> > >   drivers/media/platform/qcom/camss/camss-csid.h      | 1 +
> > >   3 files changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> > > index eadcb2f7e3aaa..52ef730b10553 100644
> > > --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> > > +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> > > @@ -178,16 +178,17 @@ static void __csid_configure_rx(struct csid_device *csid,
> > >   	int val;
> > >
> > >   	if (!lane_cnt)
> > >   		lane_cnt = 4;
> > >
> > >   	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
> > >   	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
> > >   	val |= phy->csiphy_id << CSI2_RX_CFG0_PHY_NUM_SEL;
> > > +	val |= csid->phy.cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;
> >
> > shift a bool type is not good habbit. some compiler may treat as undefine
> > beheavor.
> >
> > Frank
>
> Oh I found out Bryan commented on the older revisions about the boolean usage.
>
> So idea is convert this to:
>
> +enum csid_phy_sel {
> +       CSID_PHY_SEL_DPHY = 0,
> +       CSID_PHY_SEL_CPHY = 1
> +};
> +
>
> [...]
>
>  struct csid_phy_config {
>         u8 csiphy_id;
>         u8 lane_cnt;
>         u32 lane_assign;
>         u32 en_vc;
>         u8 need_vc_update;
> -       bool cphy;
> +       enum csid_phy_sel phy_sel;
>  };
>
> Frank, Bryan, snds good?

good for me

Frank
>
> >
> > >   	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
> > >
> > >   	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
> > >   	if (vc > 3)
> > >   		val |= 1 << CSI2_RX_CFG1_VC_MODE;
> > >   	val |= 1 << CSI2_RX_CFG1_MISR_EN;
> > >   	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
> > >   }
> > > diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> > > index 48459b46a981b..8d5c872f84ed5 100644
> > > --- a/drivers/media/platform/qcom/camss/camss-csid.c
> > > +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> > > @@ -1286,16 +1286,17 @@ static int csid_link_setup(struct media_entity *entity,
> > >   			/* do no allow a link from CSIPHY to CSID */
> > >   			if (!csiphy->cfg.csi2)
> > >   				return -EPERM;
> > >
> > >   			csid->phy.csiphy_id = csiphy->id;
> > >
> > >   			lane_cfg = &csiphy->cfg.csi2->lane_cfg;
> > >   			csid->phy.lane_cnt = lane_cfg->num_data;
> > > +			csid->phy.cphy = (lane_cfg->phy_cfg == V4L2_MBUS_CSI2_CPHY);
> > >   			csid->phy.lane_assign = csid_get_lane_assign(lane_cfg, lane_cfg->num_data);
> > >   			csid->tpg_linked = false;
> > >   		}
> > >   	}
> > >   	/* Decide which virtual channels to enable based on which source pads are enabled */
> > >   	if (local->flags & MEDIA_PAD_FL_SOURCE) {
> > >   		struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> > >   		struct csid_device *csid = v4l2_get_subdevdata(sd);
> > > diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> > > index 5296b10f6bac8..00e2669db64c9 100644
> > > --- a/drivers/media/platform/qcom/camss/camss-csid.h
> > > +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> > > @@ -65,16 +65,17 @@ struct csid_testgen_config {
> > >   };
> > >
> > >   struct csid_phy_config {
> > >   	u8 csiphy_id;
> > >   	u8 lane_cnt;
> > >   	u32 lane_assign;
> > >   	u32 en_vc;
> > >   	u8 need_vc_update;
> > > +	bool cphy;
> > >   };
> > >
> > >   struct csid_device;
> > >
> > >   struct csid_hw_ops {
> > >   	/*
> > >   	 * configure_stream - Configures and starts CSID input stream
> > >   	 * @csid: CSID device
> > >
> > > --
> > > 2.53.0
> > >
>
> --
> David Heidelberg
>

