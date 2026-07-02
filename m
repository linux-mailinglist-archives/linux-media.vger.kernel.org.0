Return-Path: <linux-media+bounces-66295-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L/JDLV0dRmrfKAsAu9opvQ
	(envelope-from <linux-media+bounces-66295-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 10:12:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E09336F4A2D
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 10:12:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=KfyPzvOu;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66295-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66295-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D11830675DF
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 07:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BD8390CAC;
	Thu,  2 Jul 2026 07:25:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021119.outbound.protection.outlook.com [40.107.57.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6893E3168E6;
	Thu,  2 Jul 2026 07:25:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977148; cv=fail; b=o7PgwhYT2WjyVNfTCP8vIsE8FU/irO7RvgULFphy4Wmd4kibOPuHAOOAzpgFhggMJ2L3JQuRSr5B3bKZwoP+p3qHzurB7mHE4TA7Wyc/stJcHuqg34TYQXiGE4awFG25H5qTyM7XB2Pf8uSTnJy8rS8zhydpt11PjI/7awuMVTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977148; c=relaxed/simple;
	bh=NcXPXOiMK26Adt4M0/ZtkMOFYNzYRAbSrD7U2ukYVxI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ur7DFFCXtd34FvEklBAyv7XnQ+o0UGUu7gsdUiiX2A2jlmi1ARQuKU9EDdQdbmxSJpCJGVfHGx2UEcSYv2Ijy/vxTz4rBgpX8HOinyPrzOxAEfLJzOA5ry6ad1lWN4jmtTuGRqMgzjASDT6mq2eYAFrpPY/WdKJF667nyD07n+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=KfyPzvOu reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.119
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JecauaI4rt0NXrbHyBvnG2Z+ZFZlzJ5xQLbHZXp+VyhNweBwgqULPiFfV/atFsDAXJvyDuaWOc+A7RKfttZdF7iC49E+L+eAE524+x2ef5vXD2F64TnqDjFlSq0R7YjphfY41zNHyLTDeB1mOleStuP7l+Hsyil2GVo3aXVqun6rZUDsD71+8kqsvLKPf5xdfBWIoWkTyaeAReZZQKFutRZvzpN9MPTqF+3FeWAfjOOca8Ppg8q8HhtMOpdThmafTKooXtza8PE5OIRKR9xsLVnV4g9WdsfrDekew24vfk+RYAUDy2SKm9Bv8/jMwS7mIaxke4DXt2pMgCfb2tQ/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLJhRTN3U9N6dNNk95F4frlbUZ6wO/ajXgslFixtnYw=;
 b=W/gXCAcHxF+c5JRy1O/CEpNQOJ8pr90jaxLKuHaO4CotYnj/aebd8J3gXfAE7ru5E5RhkSqW9lAqAH0J25Ic/aPyFSs0HDabFoqGHSlof5jsNLHTT6u5B63GbzXgKGspuBjVS1SFgckMN8BtmHueI/BxcGHP8G8fN++NvduclF5qj3qLTQuXmBqANmopCJptWIXow5M14FiuBKDbuBU81ij1s2nl1nR02RjZ+qFAfHoZRbRUFwwCK8WQKxLMPLgYubDoJwEe469WFvSFQk2d1kh02RkThzm5gY2+4eLaB3TvB5px/rvhIc5shwYqkPz6s3PzMtiZNtgk0aCj6thXCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLJhRTN3U9N6dNNk95F4frlbUZ6wO/ajXgslFixtnYw=;
 b=KfyPzvOuKuIl0HlojybXPXrCYlGurcaFkHtd/W1k1xlpShoqU9uxlpD30BZpO+lYAHxVTQvQTNewrWSjAgdjYAeBHOFvmNU8arNof6I3OuXTxGgvksi8vdQhjwp6+HIF7EfZO/9YLNRyhGuAZMgOfByQRNYzRK0ZZZvCzBKdcQ/MYnOV16xwPGhhlAKbYsSzx++OaJiVMqRFyDhA0j5qZ220MR/DvrJfgLgM80Ce73G5xjVzsinDMsEPX8yXZEuS6Q/r5M/Yj9GUqwCRV/+sISmAhxgsC391ZNQbvDuygK3jY2xJ3513EYuQ/2MEuAmL40JXendL3FYbaAiZGFx7Bw==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by MA5P287MB5724.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:200::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 07:25:43 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%6]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 07:25:42 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	vladimir.zapolskiy@linaro.org,
	laurent.pinchart@ideasonboard.com
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Kate Hsuan <hpa@redhat.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: media: i2c: Add os02g10 sensor
Date: Thu,  2 Jul 2026 12:54:52 +0530
Message-Id: <20260702072502.7907-2-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702072502.7907-1-elgin.perumbilly@siliconsignals.io>
References: <20260702072502.7907-1-elgin.perumbilly@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0036.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23e::11) To MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:11e::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|MA5P287MB5724:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e016cf-9155-49f2-7029-08ded80b201a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|52116014|366016|1800799024|38350700014|18002099003|22082099003|3023799007|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	FDSOdRHY802JLQ8FmYWcLurw3SaL983fYKuaPbYKH4NSuFKHyCUuzw0mjk+3SAHelBSTl3o33YbS6cuS5mkkHXdJJB5VIUomhBdAzBAc7EIJ1rCfUoqo9hHtGUmthJZzB2uOOiGRWanHtLioUr0arV3PobJF6EL5hzgRzjYGPVJmRKcW6Ho5xKSJh6TbONvRSjZbzN3hR5u7YFhwlAR90ltTznOnwQdDWULFTucOtiR9nLZ4poCe/i54iHAJNmUEOcQsfJWGeZD+MmKIpjNefN5QlsiRh77LQA50wZ4/Bx/jOCtTT4/mHYZhzYXS0nQ6RTFQlprIYH14BYQVLBN04q6ZUGZ9+p/2vCYsIWFpqZseXf9PQve0VVGVMqFEOw5/89mgGpcslEHJFlfTLygQ5B/QmqLe/PICAsHf22WyEMeOm9oa9oQED4Ln5WpKr39vN9LTMlSUmMYg4j5gbw1hlJhCuuExKXOzRjV3eHRwR6LQQHAxqgItqj+VWXwcgFlJVGkQZ3+JwbJYi9BUVjxVnnmsaSpLdRJM/ZnREOmUQeNfBtXX7dLCdKlLo+aiHyjMEA6m7gsaXmsYXTsuBxft+6VOuwLvr6gxgvCIPySK6OeHZN1h8wS9mG0YGO7+YrdEov9Aa+pVv6et1r/rvDsSniwKiZj8Upcn+cDENP5D84U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(3023799007)(56012099006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OEVMfJ07rpmv6DhVxlcvCOzaw7Wx0iWB+V5Ti63owWXyev06UBnco0AcThOI?=
 =?us-ascii?Q?cySLEtDUiOukjodds9NoMQc7rK0aoyXuDloUd2gS63QBUWinRmiSzOZwa4Cp?=
 =?us-ascii?Q?YYw4Wjgl7VCdayFsRTX3fLHMGPhcPuNIMyP1HspkXokvW9KIqsUWCzEWaSsh?=
 =?us-ascii?Q?WO463WRgrqaiYSeQs4DcPMeMGQ0tTy8V9YvRL3GbaXp/pyFz8/IWbpkcHnpW?=
 =?us-ascii?Q?vpeCDddI3XVvdBO7VuRJ2QZtTL140zihHas+a7XwCnDzZh1urMuc1QIPoF5Z?=
 =?us-ascii?Q?2Gil3Y+qT5cZ72+hZmVj8jmOeCl59z3lUXDWmk6jky+kQTu4S+UFZcTr4znT?=
 =?us-ascii?Q?Ykm16PRM5gmK1vycdhP/M9Zo2DV6Nu2R+kYN0y3k3UxdH7IpOedun0OC5HOH?=
 =?us-ascii?Q?A+dENOPi2eBkq15thlgI/dk7DYalRmZnHYkc4S26FWkDr88DaQDdESrvoK5a?=
 =?us-ascii?Q?A1V3vqlDkNOYZkN42lIn1SGRMHpmQlPa0cdmTwxOqehua01nXIhUu7RW16fV?=
 =?us-ascii?Q?DcJzxRSZOa1W2fnvLAOq1e7LhaBMjBYL+eoioqmA3qHqljNR5CMqkNjr69g/?=
 =?us-ascii?Q?J5NNwHVwgEE+0OQW2/MGX6G5991eG0fd0cMMcgv5KuWATf0qF1Y4kLPh0VIs?=
 =?us-ascii?Q?jBFrjj3SWq40d8Kj9gw07Psgcdu0cweaUTx+5/4E5LZwYzu14QGHg3lVLEme?=
 =?us-ascii?Q?HwkerRsRMV4bUCNiQEX5jfl7gGRplGXdlu8Olhn55ubNJOotM56cazXpH7cU?=
 =?us-ascii?Q?y0N2B5PsEdgz6pbe7Yt5whY/nsWFGuaUTYyaUOBagf5rtWYoY0k1xdbVWYGo?=
 =?us-ascii?Q?PV6DlN10hlo8GM7EyWwCygj7QaxM276Rm2GZCBjt+zZShjIrOVhSXJ0EToP6?=
 =?us-ascii?Q?R/nuYJNWTOZnmGTggdyiQuzWh6tgHZZ0Z5tp4e4GPsepuKY5X472forTzICo?=
 =?us-ascii?Q?YiHGKwWDY+B/e6SOtaIPvNGcvnJxVNp8WyBD2MUvpoVWtqmHDfhzoiJnkk/q?=
 =?us-ascii?Q?FOSkAXUN9ccnAk0xBe6Q0VFvTwjXODmWZMxZ0RhmoFCtKQ3D1KOwMkqqLT2q?=
 =?us-ascii?Q?tfK1GvH8ezmrM8RDlzSFzUmHpTQ/COFCAD7LTwWuc+dHjSuLpSdGOSzCM0Ii?=
 =?us-ascii?Q?eow372rTkxIi541FFnRDB4Xs0JRCVpNKhpSmbBKHbhYSbWq9eyCAyHFFktk8?=
 =?us-ascii?Q?OsxQBBd9Zg4RXptTh6NL5qXnXUJ5fbYc+wD0h/LTWjkr5FNTYPQrPHxQHha8?=
 =?us-ascii?Q?7g65WOxlT68hcCtbhw7DDC/5fcvhY3V/ov48dnHznAAxFWR7/u2TefTDL7dZ?=
 =?us-ascii?Q?q7BDDgyoZG6PFE7fIlVW7czsoBy354Icu41UPxcqEs7PhOB2Tw9yPwIlcYIB?=
 =?us-ascii?Q?bsDEOWH/WnDmpmEKxrhyDaT4meSRnCy1h8KW1ydadDbMgWhwVuvbwokO0OtV?=
 =?us-ascii?Q?jcKbCu85vxGXLdtWDDKpq0nAL6a3pfGjO6TN71Rjn7wiwQfPhKudBhwyxDrJ?=
 =?us-ascii?Q?3nW30d8im66LC0l4bvSErFWAP/QL//jr1HFddoVwmhFQE5HEEukAmw1TJVOJ?=
 =?us-ascii?Q?UvD/rA7rnUWCtZUSkBToMyppGIN4he9DoGmKkgnm8ikzPwrUIzETsDwof+M+?=
 =?us-ascii?Q?v0KQ6+GS7ArXqPSNE+jtR1zWDO2Zr8/JkSFtIHsvFmr0bUMrl/96uN5Nj10F?=
 =?us-ascii?Q?sIkAv5h78d/Mu9vprwOrst3EZf3dOxbl587b+PCV+ij9EkgjQAz7o5rgvCNE?=
 =?us-ascii?Q?Th8Z7W0n02zKGOKBqgmGPTrHbul89OE=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e016cf-9155-49f2-7029-08ded80b201a
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 07:25:42.9010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ot630T4e/ZYw4nLaCvxuJOirxIkJ6Gme68pCR1UHBlsHxKXnfNEyUFiy04iWUTJfsxP7i0mJ/LsqC2BbjQdle8REG/XF4pDT0ZHrSi3fn1xpngv719cOkJcwcUjw6f5m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB5724
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
	TAGGED_FROM(0.00)[bounces-66295-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:vladimir.zapolskiy@linaro.org,m:laurent.pinchart@ideasonboard.com,m:elgin.perumbilly@siliconsignals.io,m:krzysztof.kozlowski@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:mehdi.djait@linux.intel.com,m:himanshu.bhavani@siliconsignals.io,m:xiaolei.wang@windriver.com,m:contact@schnwalter.eu,m:hpa@redhat.com,m:y-abhilashchandra@ti.com,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_CC(0.00)[siliconsignals.io,oss.qualcomm.com,kernel.org,linux.intel.com,windriver.com,schnwalter.eu,redhat.com,ti.com,gmail.com,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E09336F4A2D

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
index 000000000000..72c6beff3625
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
+
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
+            dvdd-supply = <&os02g10_dvdd_1v2>;
+            dovdd-supply = <&os2gb10_dovdd_1v8>;
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


