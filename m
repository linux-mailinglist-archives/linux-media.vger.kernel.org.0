Return-Path: <linux-media+bounces-52221-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAKHE8j4g2m0wQMAu9opvQ
	(envelope-from <linux-media+bounces-52221-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 02:56:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D2DEDCD9
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 02:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDF7B301993D
	for <lists+linux-media@lfdr.de>; Thu,  5 Feb 2026 01:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106A223EAAB;
	Thu,  5 Feb 2026 01:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="HAoh7pfj"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012012.outbound.protection.outlook.com [52.101.126.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2BF19A2A3;
	Thu,  5 Feb 2026 01:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770255994; cv=fail; b=PHq1AMnX5Y3eHM6IzVgY7y45xdPj3OW4UzWKNb/WX6OWRGq41qtvWD+zq13NxmmWRfdQRyN/X5ztXU7lrKDF7bb/1NaqXjmH2bBQ3AoA869ziwrRQgfU8T+mKM1u3d+Qo4No/ZnkVPTxU7kngiq+YXL0NQO7NW4Nj2MZK8oqZCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770255994; c=relaxed/simple;
	bh=J7/qBWI/PrmESuaZw2AOKEheg/bvQrAY3X3+ONYy0qQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FNA/AT/z6a9LV7UxWetGPfQF5h2XXv2NROBSYEfHnv/24IkEOv5YrdQLbK6BU+Cn2ArS5mWanAKo6so2oHV/z6Dkfekp87GeEKbnTxyjBFVJTBgxfWRBilHX9cVNjMaMtaDLohSFgT4YJJqR328TRsBHxO//dfUOksZP1AJrZm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=HAoh7pfj; arc=fail smtp.client-ip=52.101.126.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EwGTP8Yoa+o/6bl1dPRyCBqImoyQEAJfwbH3a4/3fN1bL/Aa6SdpzXwHWhMvD82RmDD/CLPVfFzw19M2ne3opZAGWKmniK2bE6bO+lv045EBoWlnjIBBdOUkR9ABzdNURsJADL/SLerlCg/U23QUz83R4FrW+5eJTyxIbpDdZ4clvxlG+dLO+yv1YUT3fybL6CaDXlKDuxaz2z5EivfAihZQl3NUGbageYK6pRoTd+BKMzaAwyeRlq6eZMRgZD+R/n1VvCIu26gHdyyfsT80l89XPj6N3JACRIk1DBvPVAonC9Wmu/2XQB6q1MmDCRNFL7IgpXI8PUPUFQX7WqoAdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McqLsHQGOMKLEDNspx4ZZDVuNyRwk/XrjUsPMC6nv6Y=;
 b=P1n5YCtpqrXSm4NUt8T/bOfjC5P5hE7leM1Lhmw7Jvy0OH2CDiKBaFOgajSjpdYb9lT9LSMPCXE4k2cZDjRRy/tWLCaez+7iaPMtMXydpv+1YcPjCz4I0nXUQazjSVa+qJjdOKrQ/7bLnssi2WvNRbU1nFRhi+VwZ8Q8ZiKtFKb+lGiy8joe3C+ha7sjzs5md/id/mWOv+H6mtkMrtiq/ndyI0mW7wMH4mWINOVMt+hk41CcInJrjykJ7GDul+a4Zdp+Gns+HyZB/L1nE5ynS6eAqvPMw49ZH8D8iGlESMFWSkeHIIdDsqc6tGWPmUaGxBJ6zcWPTW6wZGTdHw3cMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McqLsHQGOMKLEDNspx4ZZDVuNyRwk/XrjUsPMC6nv6Y=;
 b=HAoh7pfjWIrteCVcfYFxyYuDTOuctLhj6bPfZEwtC0oYPmyxmd3FSOOIAYkrD7wwofYLqt0SoZNJXqXKNE6gQPFOn2zSBYEEtjMC4QHSXVUyiL5BEK9tMNhoQSksoZ1vFtSe9nb1RYMrPtGbC87s79qYITXqCp0tnrW5lW+P3tOQEkLnU0wD0/aRT746LT8RHiRVOuAonXyo7IcvSBb9Gpcd+J3TdvyY5Dm2EphUzwQ+JNZxQk1eYo5W0YX82FkPmOGvlFMrX/zl+u9J6Q814HTO3A3CNadhwZHc9RiKmfm7aYcDaj7xp8Z0g1uEp0VSdzUPrveupOc+tS+ZkUh4Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB6895.apcprd06.prod.outlook.com (2603:1096:405:21::13)
 by SEYPR06MB5109.apcprd06.prod.outlook.com (2603:1096:101:55::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 01:46:31 +0000
Received: from TYZPR06MB6895.apcprd06.prod.outlook.com
 ([fe80::67c4:dcb9:9cbf:31e6]) by TYZPR06MB6895.apcprd06.prod.outlook.com
 ([fe80::67c4:dcb9:9cbf:31e6%5]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 01:46:31 +0000
From: huanglipeng <huanglipeng@vivo.com>
To: sean@mess.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LiPeng Huang <huanglipeng@vivo.com>
Subject: [PATCH v1] media: sensor:increase IR_MAX_DURATION to 1000ms  to fix long IR remote timeouts Certain infrared remotes  (e.g., brand-specific smart home remotes, custom consumer electronics)  send extended code sequences that exceed the default 500ms  IR_MAX_DURATION threshold. This causes the kernel's raw  IR driver to discard incomplete code, resulting in unrecognized commands.
Date: Thu,  5 Feb 2026 09:46:20 +0800
Message-Id: <20260205014620.380126-1-huanglipeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::7) To TYZPR06MB6895.apcprd06.prod.outlook.com
 (2603:1096:405:21::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6895:EE_|SEYPR06MB5109:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c4a29f3-722e-49aa-22dd-08de645862e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wc78c0khOI3P9tdAO4EgtmIwjm0es5FakTKw1DlDZ+h0NCvq+M4IG+Ii0CMh?=
 =?us-ascii?Q?pFMXqjwjmLVMN3TbvV3u6qv/NL/n7QsCYtQilN8v19x2RVRF6Wuk+YeghpLq?=
 =?us-ascii?Q?mxnVcf/fPuR2ROGjr00rdfdX8t9FbWRw8toPRI1pPqjNg5bJuRiqES1Az+JA?=
 =?us-ascii?Q?gBQIexCq96Pc8h1w+RhrC4KKvb+X7fXhtx9yz8sDaUDlE7KdismPZXCzJw/y?=
 =?us-ascii?Q?JnszqaMYclVew9uHY2YNPHeewar1TW/RTtqVwGZL6nsRj4aG7p/e5r3C8ump?=
 =?us-ascii?Q?9CDJtRxxChb0yolq9HsE47HT0cHtZvezgysruqldCX/zON96ASDFP2dXnmzi?=
 =?us-ascii?Q?brcPe2ovrFhape+m5xE4wWn/9oi+1oRMEPMh2sESR/27sF1Oe7UpoOGmo1N0?=
 =?us-ascii?Q?4cDjipUtt6ILJOnCBuehHHJ8MG3QnlU9GKLSubhPIpUzBsEXEXSxeLWXvT16?=
 =?us-ascii?Q?jMYJiKByJ8T/tMIjwPA9rqSs6FsGFWH61YJiPlvZFne9xwfCZHIMRRGGV6Tl?=
 =?us-ascii?Q?A4xv6w3eNlQ3BtvUM1U5jjvTvAoJv0qLBP/SZdW1j00WkHsSnA6u1MozQ7p9?=
 =?us-ascii?Q?xGfATBSFl8IZ/Ez7mXUp+GruQQFzWSdlFlHdoJDOGAFAWbmZe0AhtcB4Hx0h?=
 =?us-ascii?Q?8zu1pJ11KjOx6y7Ad4U1L5QHPZedNnD/va5Eux4WFlKRQSz5DI5Y1Q6/DRef?=
 =?us-ascii?Q?mfv2vWJNlmxAbxAj606dUuFmaQtkBtV3bTMP1S8i4pNalFkfwrYhiGntT0MH?=
 =?us-ascii?Q?oAXin4hPtADHYgmDMtKtmgcQbqwwE/PQTmAPL+naU+ZM8chUs26GzctQkc2R?=
 =?us-ascii?Q?jEraVl0+Q7B/McZgt7lscf6x1xpHH/EVkehpXEfV90RebRD5jaEht9c13cVT?=
 =?us-ascii?Q?dqZ0cCiwsmpz8XsT58vw7L2bY4jKroHhU9kmO7DBIwTDt7SU0wJp5ZDZkWOn?=
 =?us-ascii?Q?omtqPZcMPQNWBS+JDYUYLjurThVzEJWqXiNFZdEvnW/R0dAvawjmhXZC58FT?=
 =?us-ascii?Q?dBi+lpC+Y0Nx45S4FWrQA2LMXPP2Vw1Bd4O8ScSV/lnrq+gCcYa77xN00YbQ?=
 =?us-ascii?Q?mkADOgY52toQTHJsxmUgDQlU+1Djn+1U8T71lBGIddmko8tYuUo6qYSAGLsd?=
 =?us-ascii?Q?1eDBgxNK0foPyq6UXAUuGJgltP1pbl891UzDEcntZl/HB8Kcivk0vhWEVrRC?=
 =?us-ascii?Q?IgC86UszkqwllSvIVu7VOZCXgUx3qdf/t1MnvjJVFmcwzp1h9PSrsLaE9EP9?=
 =?us-ascii?Q?s/ymufET1tE98v4CxigmRGMr9Y/DjJo5jTWWbqg2CCXTd6CZ9m5vkuXKCmgn?=
 =?us-ascii?Q?Cpe9LDqnF70M5TNaeuLkGFqTQmjEeW79zY8/R4AM7XjYdIMDGbx5EQESI3HQ?=
 =?us-ascii?Q?s7KUY/rvUOS46QpFifa9M95YQVj4ZT668glJhqARt7B2/cz9Uhfl0axW8M7J?=
 =?us-ascii?Q?QbxKZolU1aTA+ed4B4XnUu/CytCUEh9n4ms9CIJOtWFk3ic6eYBpBIsttmke?=
 =?us-ascii?Q?P4OIaCaOyIBHOrZ3RxsorIgKzRsgc4ljsrDZ31lALM4sDYAOsaAf425lAvbU?=
 =?us-ascii?Q?ftgr0JhCQ02wFE3ePK/umHLci5nDJIyVp+rN2LYtvjZ9l9pqNaPPNdYEUK9C?=
 =?us-ascii?Q?U/mwBTBdmUOWgyZCkYS5s6k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6895.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r24IQH1z/8qhTUg+lJlZh4zknkHttmHhzmpdikfwChg3KBSBSwuzgRTLkjTH?=
 =?us-ascii?Q?SH/v1tQaBep0S6ecxW17UKysfEgUKuEFNtRHjAwUH7NaIjCWCC6q3j3spopV?=
 =?us-ascii?Q?tj6/QHA5TTM6Eu1ewbCF/9OPK5agUiFOw1xPnTimY1tlSIPR3vqlfHEOPBLV?=
 =?us-ascii?Q?KqfSntuTHJx/YzZAp1Z9Ar+q0FBGs4+zDIZNg6ZfD3p6FjH0m1KArrUTb5st?=
 =?us-ascii?Q?W6C5OhKAsitfIw8f82OUDd5iGU0Ec/1T6HKOUHVs1UsDAs7QdhvVMHNtjXpE?=
 =?us-ascii?Q?H0FDq6vEjndqsDD9AnD5FgTxB/PN/M0TCmbRKdcPrOzeuVrNxiBLUhZDK4yM?=
 =?us-ascii?Q?QXEasAlxx4NQtaCtXHtQnrV+BaAuPE2hcsQj8zcQh98lrTjAuLM9pjH5FBBD?=
 =?us-ascii?Q?K9y3Ooj0GBMEG2JtX+nHFyz5KVkjWHrjn0RIlTotFc1ej5OQEbu4p0lLZx75?=
 =?us-ascii?Q?bUe4zYCf6GWUEXToBK9q92pYqD/KQXAOoyTxW1EzHGNugi58x1jOygLhwN08?=
 =?us-ascii?Q?Avt8CGNzSw8AqxYg0LkGTWuPBEqVIzo2HTXOBbdelUIVjoUHN8VIZNN/isK+?=
 =?us-ascii?Q?wRQ0lKH9UE13xGs/To5kbYjcueNqbULnBzPjU/XU+tMLJSHtkEoo/0YFvn8D?=
 =?us-ascii?Q?ZLcy1PssIv+KY8/rWb5/m8m6kLkyB43K3caMKsfT5fPCPhGY4fffOuiYR9ul?=
 =?us-ascii?Q?ZdToywTIHiH3XS9bgtZX7x8wSpPZ1TV/tyf3j1vwn9DjM8QJAhWqsr2wiZsf?=
 =?us-ascii?Q?bAzYnFRWzjAhMNdlmFXjR9jn1TZyVfPiK62xm6vxhWN/G8ABEu62tPVQKnFs?=
 =?us-ascii?Q?UdE4/OM2HZM7fTauICub41D/sh4MVCdN0CtkLbSMER3naRUvzotVLFllXdrh?=
 =?us-ascii?Q?RjZFwf8On7idba/ZwXXOb4DYogJRpryuKaQMfwKn6o5JP1CUShWdOqHi0QjN?=
 =?us-ascii?Q?yRotMO8zHqnmQr2bGNENwpMjDafJFyAz5wzsKgg6kSGoIlv8Ww8hS9MkvOaR?=
 =?us-ascii?Q?BxZQe7CJXlJNf0lIOdmHd3pCb5KnZef0A0T+Pga11Z0u5nNv6cJOidTN/C5K?=
 =?us-ascii?Q?EJ9WijsKNvPX0aZf/sPZ9Et9CxFHogwJz8uzjIT4SOxMcEpzqlu5veMWBma2?=
 =?us-ascii?Q?5zxS2eZvGwAFQckR0xvWoV+iCHpNbqGFVsxEB7lMSIoo3SlgAT73IyfmP6Wt?=
 =?us-ascii?Q?8kqVakQLMgwhlNIC8zLNZ998qaU3VoiP658gOorgTYubOOs5L99r2zyUaG4J?=
 =?us-ascii?Q?nBXJNyuoiz5F6Ph+fdFBuhiiTcwbIeMRtrzFvEghVwv3RkK1zUlniXAkmF5t?=
 =?us-ascii?Q?EPpt74Z1461YNkxJfzeRESDBH+Ifnzu+BU8VB7T0UrRJ1SG/W3StKMHSF4og?=
 =?us-ascii?Q?YNDHnCtna14yYB/0FbuKNVTZ1xmI2IJeNotwRGCRopSOhJlejlknYOC4YJym?=
 =?us-ascii?Q?OG0DxWtlpDOsLM3VC0HP5Y4xDjABuzxtLRXriwu9TUN6sYKUcsLk7ukj1tbO?=
 =?us-ascii?Q?GW8I5J7cqiQkot+m9xHogJvs5fyiSxFNHqRVzmQ3gaEXMvYev6odU+ebZRdl?=
 =?us-ascii?Q?M4Q42fJLLQz5zk6zunifuspq05SdD/WoicrJNC7rVcZgKpEgKxZWhwUj0Hf2?=
 =?us-ascii?Q?rNptK7rDrz8RMusTqkUHyUekzq+yDesfIZcQ3KmKVnvlZJsGkppvvq9sK8Zb?=
 =?us-ascii?Q?DuZZNHaf1TsFETDKcpgWarE9UmqQNmFRiUnrtT0B3HJKvPj1AD1ntMgmbkgO?=
 =?us-ascii?Q?AOMdmSGihg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c4a29f3-722e-49aa-22dd-08de645862e2
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6895.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 01:46:31.4767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tuge0mZWHMUljzgdaB1EuoUrRLyQlH8NY48rJirDfG0hSJ0tjqNvStuB3XDNibB+foY6FTt5zTSLlRZJZrJC1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.19 / 15.00];
	LONG_SUBJ(2.85)[380];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[vivo.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[vivo.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52221-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vivo.com:email,vivo.com:dkim,vivo.com:mid]
X-Rspamd-Queue-Id: A8D2DEDCD9
X-Rspamd-Action: no action

From: LiPeng Huang <huanglipeng@vivo.com>

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


