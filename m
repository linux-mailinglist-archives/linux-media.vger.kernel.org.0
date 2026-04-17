Return-Path: <linux-media+bounces-59022-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SE05NhtI4mlh4AAAu9opvQ
	(envelope-from <linux-media+bounces-59022-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 16:47:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B78F41C365
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 16:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FA283113D26
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52473A6B86;
	Fri, 17 Apr 2026 14:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b="lzhISymM"
X-Original-To: linux-media@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023124.outbound.protection.outlook.com [40.107.44.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B003B4EA5;
	Fri, 17 Apr 2026 14:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776436260; cv=fail; b=b54/GlF5TaWsFbXZ4hFTYkcZZnsnEVt0DdypiEBaJRLhadwi5TDBPn1ytd2kIM73WmSbdc3CUG0vpp7bfhzbAYnl4wd8oHUbF41QjH6+2fw+hTfmNsRqCW7fg4Hw+pIOG7rqgG/xPui3f1xqDAbcA3b1EMYW7j8QfrvfPcdMBOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776436260; c=relaxed/simple;
	bh=xvGvlRxQRdtCo8x1ZP/gtAJWJ4BEAa0cutILoQBgxfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qzliOzpNFI2GQiJZuE8coWBmtTZp4zi6sLNid1ftlS3O17jEUeTeRU+ZONbuFDYiM0VGijNviW49ZahdvCRw7AEgJrjJcoPYDVgVALgTC5lzpDmBWud/8iDjXS+uCriYQSIbuG8aVwZs4+ejkJT7034JloZC1L1PkNVAUs8KFkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg; spf=pass smtp.mailfrom=smu.edu.sg; dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b=lzhISymM; arc=fail smtp.client-ip=40.107.44.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smu.edu.sg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbOYDg5gMcqkUVH9rtyKY4LnciB/Nv1/ybJfHqqcNRjIeNw8x9jDQgJuJ7rOepHY8+B+eqfi7vj2oa9ymSWve6CmDISXcXfCrsfO1Ryo46y+BPSZmz/V7F/b9UPRicyO9qRuAmCr+EhUl9zXNsEfD2tHWQdM6MiBKjHx3TskfV7InPuQ85uoOcS8XCK7KtQ3YrIqDeCTCf2R913jjuB15fPO6ZLr5sZAb6J82+MmYgqFVN2IcDhQe7uKuGfqaoTtXvzA0jg2KN6JDBRotnBLkYUbQuEQaLvY2vOXybLBXrCWgzaxM8eBv7peCIJEV0sxo5GDigibAcX1WbBzqoctTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auUvwFlI+lwxkiF3dF3grWsPNbXU68FPtAdI3ezEgFI=;
 b=d1YPdFhA48HRS6ahWXrV5J2GIP4loegkoQqR9XicZ/YoqKtf/wDzcFsXoL1BqOgtxSONtb5G3S1OE4s6Q3WUKv35naZPavElT2+EcOQ5s+Ok1PQ/tSsqHWBjmqjqLqxrAPfmwGJ/AHOoH+Zzljs6hM36rvPAq9hSgmpWLBvDeOzsT5iK4As4tU9P/m/wvdPSEc4oYs8h8RjGg/j5mwmepya651/mH+s2xpGpqvQst0xpyjgfwHt2QdD3Bi0fVCMzTg34qAdme1VQvy6huyy0pv8qJz4YfxYbre25+wqpR8uGMgVvDlESqhOVjI3iMkZB1PwXujKN5zBdxLqdEeBvPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smu.edu.sg; dmarc=pass action=none header.from=smu.edu.sg;
 dkim=pass header.d=smu.edu.sg; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smu.edu.sg;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auUvwFlI+lwxkiF3dF3grWsPNbXU68FPtAdI3ezEgFI=;
 b=lzhISymMRz275LyB6a7A5G9C5Uma9HysYGmfmlGoY9HLV7nL1oeVicOUj55SsPQKEqfQcTxd0ciCpU6zUVg0P81ALl9CuyykqX/0Cj/hM1x0vQnq9c4D5AjauZD/Pi4e6u5Sky7utwOgpuOO/wg3crE3s+OAQw/RxHwvKw5q4/6aUkN0GaUXar1d8UZuwq7tDHosAyVgY2BoUXvnredjkS9JlXORVejKpE4J3RmRHm7RQHcH5hEuIgBZ8qvjFauKgNqovqa0BM7FiESi3CQ+cTgIfnaKMM134MCatBvYlV8I7yHDaQDEOHqX/8hwhDNkldH+9PTPiqZAEaoCmVYlfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smu.edu.sg;
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9) by KL1PR01MB5091.apcprd01.prod.exchangelabs.com
 (2603:1096:820:dc::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Fri, 17 Apr
 2026 14:30:52 +0000
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595]) by KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 14:30:52 +0000
From: Huihui Huang <hhhuang@smu.edu.sg>
To: error27@gmail.com
Cc: bingbu.cao@intel.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH] staging: media: ipu7: fix MMU resource leak in ipu7_psys_init()
Date: Fri, 17 Apr 2026 22:30:46 +0800
Message-ID: <20260417143046.2771253-1-hhhuang@smu.edu.sg>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <aeH2VjOV4_Ql_zeY@stanley.mountain>
References: <aeH2VjOV4_Ql_zeY@stanley.mountain>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0092.apcprd02.prod.outlook.com
 (2603:1096:4:90::32) To KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUXPR01MB7791:EE_|KL1PR01MB5091:EE_
X-MS-Office365-Filtering-Correlation-Id: 017d5191-9f53-484b-9235-08de9c8dedb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|786006|1800799024|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	hAsBSpQ/LVvbPYwgaBPZgQPoEbhtR41463O3l5CCBatkllQ6/lZvMsPRo9/+jJCyoaIC89PpZ9Rv9Y1ey41wdEqxRdjBTu7sGLuoqnH1QkRXGJk9cN8qpk6UpPCho6C9mFuQUsSWaf8OKJiRE64YutaEqgwnanDR3S86AVe/rZs3LuqpfcGBq1yu6EV5VRvqsoiLf0RkVUCqehSzRbuLOOOsZ25FHdKe4bwH2iCNNL1nXfM046aUzi4NwaGzx1e+zS8Wkw/qXFBdIQsd47NepLYD5fnCboe+vl2lLc5BIum2yni7dB8nmrMVRtoltRrWxEFuW3mRU04a88pEZmFWJtje30dDTbqC9SYlWb8WMY3+TjueEYKgAR71bVVMHStg4e3HZtYC6i/mW1N5J/cYIfG+k+6rErSLgrDVw40rey6mTZR/dKbhzSEuFcFMK36LZZtrxZE8N9TBs8ayf+PrqOgd3PWiGJLTlXrl6xS0cQEHTTFxs9w9EmJbgIfMskIQob2w9iYpitWUtm7FcCUiGXJXKgUeCUZYeMTs3tr8imDwcyWxAMm0fZskPpp7ZtzNSQrDWwEi4adZ6Knmq2N5sYhFOK6m18R42+4xkbWJYAcWo4BOOoP8Xw9jSql1OKiabyZNzHyAaINv+Wq38IzVtYN9gkns+ZCQwt1GqUHRwQgS1rmJM8eECDeGPffCRnsH6yhmSU5JbY1EeQmKKWaGjexYGnwEP9+xvSJyIFzo22JoPrGgSue9fN8R6PjgSoJyjzinTPBKbjgqc5YSOySWebZ8aNMj6pwYksOXy1CDWVo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUXPR01MB7791.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(786006)(1800799024)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ELlGO+3GWzEzDfo9jJPNKdzTGm8okW+fgqHZH7lgICOT7en4gVNAo04AmWri?=
 =?us-ascii?Q?Urq053BHq3zjAXpAtsozsNoFLn/8bUtVfl/JQ8SlbpuXTks1eTek4YpwzsvW?=
 =?us-ascii?Q?Xj7koNli7tNmt1Mj+HStVum8A+sGILGBi32VNM/tQsQ/V+0n85p06nlhGY9t?=
 =?us-ascii?Q?aFZpP4O2NSgTZCmdxBZGi07Y4zXsbzLtJRMClU44uw61ecNSsSUt3i1O+X8O?=
 =?us-ascii?Q?M4SGFN3whezqdi4pADq1Vayseza8ZGwFFKxYgqGrAPXzqP5kRKCw2W4AK2n7?=
 =?us-ascii?Q?fQvBZt2aKVQ64T4XoQNgIUctnwnVFYw30PpVVJXuln53u4qsAbunhXYkUkSb?=
 =?us-ascii?Q?6gjuD/IlUxhpkPjt91+UlxbLcoJMC0HB3WKRki1VPnTS7SPJLIjazGdRt+Fk?=
 =?us-ascii?Q?b0i1BHsqZrN6LoM3rf7RLMRpdNB+P/cRs1dujsarZrcXH4WOiYyDMKrR3hzm?=
 =?us-ascii?Q?dyX8HDyNbBGK7GzJKQdk6uQg8aDrz8a7r/hEdhHC8Ygq6TNcXBLgSuxLyuqW?=
 =?us-ascii?Q?VOfUrpetDK18xabc/1LggEKq0u+YlBSI4jrpXKJqkgGjSCdbRPUQqfUpkGIH?=
 =?us-ascii?Q?gYh2/s5lnDYnZSPajviar0d7+nQ85Kfq3+7o4EU6iXqv8yjP9/onRoEpSR9f?=
 =?us-ascii?Q?oodsuoLwSk7C5DLuDDiyY1rIBFAkw8wZ33v6ohN3fyz3yBErHo5WtIaqvsc/?=
 =?us-ascii?Q?4m3kmuSBNBytSAGZlgM/eZ3xm9TevdBYsTmgS5m00XUDEUgTTNDUcZ0eR0iI?=
 =?us-ascii?Q?Rl8IR4BazDoIrX1HZ7WZnOdpHbZv8JMZdYfVGgeMcSVxgl8/jOhuo2wvq89s?=
 =?us-ascii?Q?l+10Yllcizy3Y+g11SuPDkszOpcZN6lyCDbAacrQlk92V+xrv3qKY4o5Pb74?=
 =?us-ascii?Q?y5J3uO6Q2PBF7A5JAvttywqZMW07ron6aCh/bwCiMq5SzEn0qO4gpQVeddT4?=
 =?us-ascii?Q?OKDsB/YSp3MCcV7DboF9CdjeHI7aE8FJUSfcG6bLktVMg/jC9ykc0T+vXpON?=
 =?us-ascii?Q?3IQ4JHvb4Pe9dJq2gs2T4FmP/Xtls6Yw7cygd1K2nrL1WNN8/RI6tLOW16S5?=
 =?us-ascii?Q?oF5+KSYlta6y7d4QoK2rlurc2FZwxyLxfpjE6r35DbhsIuOL++KbG6Ch2Jjm?=
 =?us-ascii?Q?l6DVhPLo03D7+WKIiEeVQrIZ+0KLCSPVypf8gGxS+OiB0F1EJPQW5fRhJ4Xg?=
 =?us-ascii?Q?Z2c97V6xES/wnmu89vM9Q5xMrGNpITkMc1Q1sO81t+YRCUy8naifpFzUDbQF?=
 =?us-ascii?Q?D8uxjB7Av92GUcFag/1b+QhLQj6dkpqxSSRGG5Z1wa6VtKONfpV4K19LWed7?=
 =?us-ascii?Q?tWVtNsTDDU5xeInKut9jt3DSLEMnq368i0FlMk2EdmKL6AyT8Q/QJjqVtEhh?=
 =?us-ascii?Q?dE6HcscRtI0f7jquOddNN9Y3FEf6d9VMMxV54WYJ/vf0WqX2taOdWTJ6k/uU?=
 =?us-ascii?Q?HXmt9Ac6QvC+SJ5K2p909IKvLBy5y9IHqWLhawezC/x+IYoGgc6xnnyQ/OgX?=
 =?us-ascii?Q?8hRncLUA+fjrfCNHTnPXNKMFR6jhQzxdOiO6lB8VZnOX+GBz61Mh6AoRITjW?=
 =?us-ascii?Q?iSLS2KuzqGWYIXKEbpltJrlOqFjqhgCrVWeXa7w2Mo+q5jVmvxnJEO+o3IyY?=
 =?us-ascii?Q?Q7BaQY0GibqljgNTBMCW3x7o7cHpangcVJuNyju3Nuj0+veuXM5B/tEXVkmZ?=
 =?us-ascii?Q?zUit1QBJkeWCbpXAQ9N7GT5YrlZxc605Lc+48emlUkkWXUdrHtFgJyzhP1c4?=
 =?us-ascii?Q?PgGGlytBUw=3D=3D?=
X-OriginatorOrg: smu.edu.sg
X-MS-Exchange-CrossTenant-Network-Message-Id: 017d5191-9f53-484b-9235-08de9c8dedb5
X-MS-Exchange-CrossTenant-AuthSource: KUXPR01MB7791.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 14:30:52.7235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c98a79ca-5a9a-4791-a243-f06afd67464d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oWCA6TFUqryEW0GlPrVH9YURq8eQeUng5W7ZxHhwef6b3WgghYoMdu26jBYTNLx3/YfNqoT9yP7rGDNvur+W0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR01MB5091
X-Spamd-Result: default: False [5.84 / 15.00];
	SEM_URIBL(3.50)[smu.edu.sg:dkim];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[smu.edu.sg,quarantine];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-59022-lists,linux-media=lfdr.de];
	R_DKIM_ALLOW(0.00)[smu.edu.sg:s=selector1];
	DKIM_TRACE(0.00)[smu.edu.sg:+];
	NEURAL_SPAM(0.00)[0.015];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[hhhuang@smu.edu.sg,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smu.edu.sg:dkim,smu.edu.sg:mid]
X-Rspamd-Queue-Id: 4B78F41C365
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 11:59:00AM +0300, Dan Carpenter wrote:
> Same thing.  We call ipu7_mmu_cleanup() in the caller, and it looks like
> that will trigger a NULL dereference.

Thanks for the review, Dan, and for catching the kfree(pdata) issue
as well. Please disregard this patch. 

Thanks,
Huihui

