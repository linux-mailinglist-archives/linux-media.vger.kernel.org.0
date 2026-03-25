Return-Path: <linux-media+bounces-57003-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBF/LHbNw2lKuAQAu9opvQ
	(envelope-from <linux-media+bounces-57003-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:56:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D753244A5
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2469309CD4D
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32723D0939;
	Wed, 25 Mar 2026 11:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="WMMAF+Di"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020124.outbound.protection.outlook.com [52.101.227.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B353CFF42;
	Wed, 25 Mar 2026 11:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439230; cv=fail; b=VFA7t0ufExT1Q85G79rXk6PSsYZ74YuivW4d7QvPDXtCP/+zkvJ1zExlstC64t2DBvFHOJtllmVtEylNwJndhJxlcYYbmfw5jL8egCKkK5VxFi45aIPqOevaEjpBqFPYBb0rJODhALE/v22YA3d59LnqDJTC2kAar9Jf1xTavvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439230; c=relaxed/simple;
	bh=sV0//TpYrSdAvr8C9HURf9op49zldOiqFHBtU9Ojp38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=suwq+erA7ggkDydSuc+uPHyI27rWERG60cA0HKm3ilEMAcWAXH86gT6RCrXHXWMa4Q85I3tn1eJwHiLxArVdZGEjCPcDixymnBYSjSsi5jhwq3utuBglnTpMRzOdEmLxFTUyBqQhUUCQfdW8z77kcye/t+QFQxDFMs3VCnXzyDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=WMMAF+Di; arc=fail smtp.client-ip=52.101.227.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OelM7JZS/Gc2Qv4M/NGx0ws0FMQ/1YsM8h1elUWmxIm0Wq+DAUIDi2K1tThUW7RFZYRlMrxI8iKmmH6mjoaVVijzt7X1qCBMjpsUL8N4UKJZBi6jg3EJjtfSec+v5APasubYlfmmsAzwk9wzX5XPGkAwomnTtOx7AnIOIS/nbqroGXEXBnbmzzbYaVJFIggvAbEGbweDoD14dDjsynCk2Mo+a6neDmEKLElJVSn3wPGgwvEzpH1GNVnxevq8/4c0ph5PHAEbeicNhDgAgTd1ePI3doOawTfbekcTeWWilJfHrgtA4JgTRU4lF12MTp/kmF4khm/1p/ozvbWwy/QpaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IM37VSQt1QHB+R0sC4mC4iXEo3Wjrgx1apr29kCLO0Y=;
 b=gArFvyHoEtBSq2O71QUuif4S0+Hkg1OYDWGUV/q9fxMnta1SQwBNE/xnX/VhdxPYrCAZGDsqYy9TM7nOTw3dqcbB1daqQc5W/QTZExbFuoCYGZtAbpNz2zk784TXSA0oOZl0ZcVZkyFJHh4D6R4/Yt5wrg9ArjF4LJQGGJXRopv9ocqdS4dsfd0BNPEsK8l+aXJmGE8qtM5uvT3+Wf5LF4qQCyuGyUrpY8FRk0KEhRsBlhpmLWbNKjm8NEnoKWXniAuzjbnO5DMKD2j57LlwYacFQC4u1U9YbL2pBzsyEtup3c7Y2UKUAqJZflIabRtpOrgJXVhtBkQCL2rZ1dn3HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IM37VSQt1QHB+R0sC4mC4iXEo3Wjrgx1apr29kCLO0Y=;
 b=WMMAF+DiSUpbBKyivWe/k/seBU8nkDSJVpKpxArC7CZ9XmVv1uuE86wz69ETDcncTBv0d1IsPKQt1tGR3eR8iSE8ccp+0DB2qTf+tK4rCY05b7HoVqPexYBPdapGka5P6ZUjaTCaQoNn8gy+mbrwTV2eLpUUE3nGiJZY7s3cYo9mOVv3E2Ka9M7S6s1sXJTGNgX7GB6CjO1GM2+dtQENxkX75EcGuh7BryFd+3r0XORyLUDTsS6acvHBXXi4655XBiWYLcNpejz/HWBnMAe8eoOrBeEfynQ3Le1bRMPUcJtaiE4nMRx7fNINry+AdAVVofL5Xg4tntZDQneBipH96g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAUP287MB4907.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:17f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 11:47:06 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 11:47:06 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/15] media: i2c: os05b10: drop unused group-hold programming
Date: Wed, 25 Mar 2026 17:13:48 +0530
Message-Id: <20260325114404.95188-3-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::13) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|MAUP287MB4907:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d4653de-9149-46b0-4e54-08de8a643d54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ozQo4F1Hg6dndlPgQrVj/k+raC1qen4mZ9/417ePaeAB3qBExvTJ1PnSOGRpShCYle1bEs3vcgxtJCUIv/rzgCBPqnpr7yjupJQO5tiyNevDBb5ylD/est47obUNknBBynIMjm9m3dUZR33RQVq3pCIG+m5e644FLNYG2r7YormoMfp7PZeRh4ff+Ft7BzOx2cYZ6lofefMHLdX/2DwKvjTHsueNlmUcDZSwPKAkd1pTYA0NpPl4Y0vA+SbeApc6X/YwkUlTxXgopmTBgdV3Jk3XeQWoLbfD0glpkhRv0G3f/4R/eR5xzvOePryHxuRLkPCIOPm7lVt8yg27ZthAR3okXU9eIkITkHxGEUZyMo5/5ApgHe4Wb9WuHZVwaoFOeLn1Yul9RNP6uNJBhhKRhsZyDw+ygxvQhpLc+qN1PcG/x4KQ+DJ3t5vFccvf8BgY8as8Zd9R6zOsjmR64OKJ94nNU13t3V/9tXkNVlCCKfmQMrLh4yVuZ9kIWLLysyCaE/LybyJramB77IG5qNjPa36Va7l+F4G9tKUEVC5PN0raVu8wLwt5OQ3oTfkVVK0u1Ltwg2bf1ii8wHurrXwVKOWsbQmPIujwLwPEhoCzkmt2oNJ+ocMKryIvHiw791OIRrQuauT8ZLeeJspm3nPPv1kwUaow6k/SakfmVqz0PuJaKv533jeqETT3dNdxLUBBjoLR+1rBXCefw7IuYMOov77knmrMHRjECaPhRgnDN0CwC2VGCm0sqTybwH+yIzb1HyjxDXfe4QQxYqwdLx+08+G8jkp2AIk6L5kftRf8r38=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l5Lc9HmRmNh5jykj91uJgM/wOjZuVFAsBiwq/5eUcnklerkbGLl/F6nOT94l?=
 =?us-ascii?Q?CQzIHODTxqBaj5uRI99wx/kl57H398lYdxVlNScKGKtI49DYRtfRbOEgpbau?=
 =?us-ascii?Q?Gwkze+rldeVw/L/nctpaWCbDrcReonUaJVlpdulVsYEIONtwppNplu7DD1ps?=
 =?us-ascii?Q?rATS8ZJuQSObb437wZc2JFErAn91n7nCSMI75zjsharHEvBVsw2rHPbic98B?=
 =?us-ascii?Q?0WNAMjBxwnejqmgNTamNcAx5PD3gSNDPg+MCB6v8PCSlSVap9wsYSDk9tEPI?=
 =?us-ascii?Q?dumqnTbzZ8ODoqusQf6WECZw44HwE9XQ/+hwzb6JtxfemTPO/jKGacVEv1iL?=
 =?us-ascii?Q?mPD+W47FTEkR3kosrRNov6NTA+DiN8BfuKymsIrZmZYXqeEVjCm/AutnlcHS?=
 =?us-ascii?Q?JoI3dBEQbcdx0oOWD8Tm9oQ2jAc04x4k60fPy/xh9NvNUAdumtbnSPiHlO9G?=
 =?us-ascii?Q?XLweQYFL4HQNqPxNxWn0tLdmnvdK6PvaXYFiai4jf7EBLDW8WAsg4dyiYLvL?=
 =?us-ascii?Q?fTmK4URELRS1k+24gyMzHX+gwtjn3MOfhpzVNRXs2CJmu8eMikr/zQ6xdQMW?=
 =?us-ascii?Q?uTZVoaKTq83JKZ7M3VdWdME2ZyesvRZwk7kJURzHjFPl/R3eOob3UtCDJgCb?=
 =?us-ascii?Q?Q2JQ8e34+A+BSlKKwjLjQw3v7HQ7D6PLz6DpgWE5DMF3d15ZxnFdRg/eqUO1?=
 =?us-ascii?Q?oSQcC5QPnAivXwM3QRqrQ0VLc4oAQbyr5u5v+kE/0YacwmYfMO3VwyZcwl3X?=
 =?us-ascii?Q?6R5ifx9LqVZAM/8JLJj4qpfhl0CzpOYnpWUYCdfeUSglWZrAqSP7SW7TdkNk?=
 =?us-ascii?Q?TEr+b1DmWfXURZHPPrrK48E5m97J3ZL5mhDrL/mrPwK0kLGXkqbrx+bGp2Ys?=
 =?us-ascii?Q?Dta1oEFX/qFHN1CjucxcVuEGEt4oMziDfsLYbaSjvDS6KF4kBdpBFsdNhE/n?=
 =?us-ascii?Q?M5tC5W8su5cp0L67vFR3CEV26AiZdlpQkT0CrlZZ1qdGjipkySA8s2clovnQ?=
 =?us-ascii?Q?W7jF1Rup4pccga52u1HwIfhTLp1kYdGQ6p6f6sPUBsiDSvxcHFShoI4C6jxK?=
 =?us-ascii?Q?g0q32A5rEr/Us5iyb3aUObqT0wtfMI8/MSbU2ZzGakexy4dsvK6pRXYfNzyT?=
 =?us-ascii?Q?L7QJkAX5wjit9UJusxazzWiOxi+bVpAfdqw2eUmQ7LPRMH81hmDJIo1XFLiU?=
 =?us-ascii?Q?YBZ4RS8DQKh5oUxIAk+m2TFeFHu/gXm0AsBPUHsmtFYojLHloK1Zga4wkwfO?=
 =?us-ascii?Q?2jwiuAE7H5O0xLghdNeAFblUPH/U0L+AFwfXOwt7Ha8AG0tCaubHvRME8tMo?=
 =?us-ascii?Q?4FtEloLdoyI9ZFMbSQ5r9ZILKGH6YOuMDZZg9PsDQTUUKYMNkKhOkkvZ6B3f?=
 =?us-ascii?Q?u8CbK//uavgT1JieZ4bFPyIT6zEb4bWQXt0atSBxLUXqS5ErafA8GNRTbGSy?=
 =?us-ascii?Q?UYTLGDKZYVx67l+ayeErPZxzHMaMcNG8CPAUDCLSHibbhKKzSwysq0KFwZow?=
 =?us-ascii?Q?maj7Oe7BrPDobEJPZj7Y+6lkJA0tHqVuwz36ruX9fGVTmfDSI4hRzqiVdtAe?=
 =?us-ascii?Q?5d+jCc0OKfseu9YLJLO/Jwp7jUVWOY1L5/2qaIspTdOXhlcTkGjytCchV/Ik?=
 =?us-ascii?Q?Co0LYVOAjlELPDIehcGT+xG4TOf4+VR9s5nT+fLksr0HSQheynE5aqq/LB8R?=
 =?us-ascii?Q?mtHXUF2+nkfIBEFmvwfVmqOVHtCslnZSUYgE7oT29OgTvKpRYIKnXvu1Karf?=
 =?us-ascii?Q?/DJsH1vqZFgyOGQ5klVwrdjij2ECRXs=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4653de-9149-46b0-4e54-08de8a643d54
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:47:06.4540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3z142djBweI8ujEFxqD2NXUS0hMky8Id2GmmJ8BUnoLrOE7VHjITyjSEbSOmJPZgNum1e0F6qY94FgSYpDHG74M0FUO0s7VocekUaxUOG6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4907
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57003-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 56D753244A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Register table included group-hold (0x3208) sequences for
groups 6/7/8/9 that only stage alternative tuning values in SRAM but are
never launched by the driver. Remove these group-hold blocks.

Also remove a duplicate register entry for 0x37bf.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 5da5b7d21f31..62fb856cbdea 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -250,7 +250,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37ab), 0x0e },
 	{ CCI_REG8(0x37ac), 0xa0 },
 	{ CCI_REG8(0x37be), 0x0a },
-	{ CCI_REG8(0x37bf), 0x05 },
 	{ CCI_REG8(0x37bb), 0x02 },
 	{ CCI_REG8(0x37bf), 0x05 },
 	{ CCI_REG8(0x37c2), 0x04 },
@@ -415,42 +414,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x5820), 0x00 },
 	{ CCI_REG8(0x5821), 0x00 },
 	{ CCI_REG8(0x3222), 0x03 },
-	{ CCI_REG8(0x3208), 0x06 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x01 },
-	{ CCI_REG8(0x3790), 0x21 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x5a },
-	{ CCI_REG8(0x37bf), 0x1c },
-	{ CCI_REG8(0x3610), 0x37 },
-	{ CCI_REG8(0x3208), 0x16 },
-	{ CCI_REG8(0x3208), 0x07 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x0e },
-	{ CCI_REG8(0x3790), 0x21 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x5a },
-	{ CCI_REG8(0x37bf), 0x0a },
-	{ CCI_REG8(0x3610), 0x87 },
-	{ CCI_REG8(0x3208), 0x17 },
-	{ CCI_REG8(0x3208), 0x08 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x0e },
-	{ CCI_REG8(0x3790), 0x21 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x5a },
-	{ CCI_REG8(0x37bf), 0x0a },
-	{ CCI_REG8(0x3610), 0x87 },
-	{ CCI_REG8(0x3208), 0x18 },
-	{ CCI_REG8(0x3208), 0x09 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x0e },
-	{ CCI_REG8(0x3790), 0x28 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x63 },
-	{ CCI_REG8(0x37bf), 0x0a },
-	{ CCI_REG8(0x3610), 0x87 },
-	{ CCI_REG8(0x3208), 0x19 },
 };
 
 struct os05b10 {
-- 
2.34.1


