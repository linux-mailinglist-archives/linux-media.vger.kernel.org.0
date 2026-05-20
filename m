Return-Path: <linux-media+bounces-62301-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMh9CMPFDWql3AUAu9opvQ
	(envelope-from <linux-media+bounces-62301-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:31:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E46058FA8E
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2BA931A5B1E
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F6D3E9C1C;
	Wed, 20 May 2026 14:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="tx3CdpsW"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013077.outbound.protection.outlook.com [52.103.35.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376843EB810;
	Wed, 20 May 2026 14:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.35.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286828; cv=fail; b=ZOUKhHgHRov19ZB5T/BhRAQlI8KZCg3e7nc6/l+NtNNnPkM4wilY9G0X2yAVtALVgO2ZVoJeBwStcMmfxT+Ph4OdAEQ+8e5jboBqDz24QVg6+uFrpcbltquCtRzZNXayv9AND1KcpzeI6v7OXjq0bHnmj2pURBaoQ+uD2Z4uBPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286828; c=relaxed/simple;
	bh=NhEyL20oXUeshkI1PIBP6/13DGPWbcO1syZ5+7Yo0dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fzNqL7qPv0PGVOjU2F494cDTswmGcIMUljgn0WyDIxWA6IoFBlnR/sOC8SHHreH8iuBSU38KQ3YofZgbsg8/eOjyB4AgWwhbhdnKzVVmUkV64Ps+zG+uH9T3D/CI5rj0tnVcBw7kA9+vicGva87Pj6GtUgEFf0btrSRGvLfxtng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=tx3CdpsW; arc=fail smtp.client-ip=52.103.35.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yu61EGt9VdGqAnQK8ogja/eXQYQoLkULXPR546I0+thUKwvfMOy/HZqFW+QYOQWbGK1IJ2pYNWhbLgPbx5NJkLd4oAcRY4d2zjYpQDVlcNHFzI35LxEOhiU8vpH+59gYr2DnlPuRm9O/YrdLeARBZbPrdTwAJdV2fnqbY6E+opQ7m2nLfazBtvH/txxRbYTWIViPxnwccI95L6lNbPV2Tblnj8lFhdMbwC7Yz2TTKfSDWH0O7ujIbYsIPlBxiNDGLL2tPtFFXIgvqAUkHxe+hUS5u4bWPmquaj+jywqVyk2AfC9mlEYg2mYW0KEIIPyz9EOAI9Wv5lmuoAGGefG2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9X+zKhD9OXyN4pHJBnfS3msw8ESJRcQiNaqilmvLmM=;
 b=po/2QunNB2OL5Xt6N5PG7gt6rmgEDxh2PJoxuOy7Rg5PMI+7rnIn4Yv3mlJnbP4JB3Aa8H0XsvvIhEzNxvj+dTOsErMlxlP2KATlpntycAJRsOu6vawhO0UXXu4MSJviPmYVc7XA+IFYtpWUOdVv7yNfCT/F/CFLSNht7b+C8dM7lf1lE5PenB1QdTiBnEE6pgLKDZZMv5Gw0mvArHVOwi5svRXzNNRazRW8Qd4FBkC9SN8EyDL5PTXuYVdoD+CripmTDGe7y24WWSC7L6RX3loHxnQMMGNpMRskB0dYPNNuepkqMBKpRbctXQDWs+wZCGGy2iPlZcAj6nkG+Ejk/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9X+zKhD9OXyN4pHJBnfS3msw8ESJRcQiNaqilmvLmM=;
 b=tx3CdpsWYBQ6/tre6Oi/leiZ3eN6e0c0tKTPQvTWKKaz85H8rGtc0NQyMv4toHjIAbPxw1WjJzK7M3oM9Muwp68LcLlff+FSv5qs4je5asURdjeHCbqMK4R+bCTfg1ftG+JuY3H0Mqxb0gSpp6efl4g2GKlO93VJxVfP5NW+vLD80+TyUdEoD/IqPryCs6NXnwOKxkb1MtbbMz5Cl6hmkNBrMUfiH3sVCscenkp8P9NHk09rROxV3s4tU3UCT0JWPogzHcrx5FNQz3nDbwuNuJ2JeR1fxlCAILGKLWMVmbYW+kKMbrw9URL48rlYiacllKID0l2A0KJsZDnwrPZ7Sw==
Received: from DB5PR03MB9905.eurprd03.prod.outlook.com (2603:10a6:10:4a1::8)
 by DB9PR03MB7274.eurprd03.prod.outlook.com (2603:10a6:10:222::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 20 May
 2026 14:20:19 +0000
Received: from DB5PR03MB9905.eurprd03.prod.outlook.com
 ([fe80::fb01:af10:feb7:dd54]) by DB5PR03MB9905.eurprd03.prod.outlook.com
 ([fe80::fb01:af10:feb7:dd54%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 14:20:19 +0000
From: Luciano Ciccariello <xeeynamo@hotmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bradford Love <brad@nextdimension.cc>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luciano Ciccariello <xeeynamo@hotmail.com>
Subject: [PATCH] media: em28xx: Add StarTech SVID2USB232
Date: Wed, 20 May 2026 15:20:10 +0100
Message-ID:
 <DB5PR03MB99059E1E76BBD47E3C5D1129C3012@DB5PR03MB9905.eurprd03.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0189.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::14) To DB5PR03MB9905.eurprd03.prod.outlook.com
 (2603:10a6:10:4a1::8)
X-Microsoft-Original-Message-ID: <20260520142010.17182-1-xeeynamo@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PR03MB9905:EE_|DB9PR03MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b495a0-e930-4282-0ed2-08deb67aeb8a
X-MS-Exchange-SLBlob-MailProps:
	obhAqMD0nT9m7vTSsblDzDtxCKdqflXiADSxj0qozYUS0rS+zLoQ1Lj+JW/nBKJh05FkGhn/JbvEUbZ9/+o+XVoxGnioRi1J30Ve4TBzC2h6gXcthf67SuQisuUdpI7M3IDWi0oriakoKSGcf67NZEAe/jD6X/2kRndn8qcy9OWgJ4B2Iv0Et80jTynsrvNVlKpi/9Z+NM/2DTFBJDR+iSd9m6HSnBPQeUEDTYd53HcnD2kbsUMhFvZMwl5+4zm8kJZoYEj1aaBzdQPz5fLhKEwPZhT750n4zWgJiENXRLpXSDUQyZEr3qedTr1rG77aZLCtvEvKXbtdvhgtkcpWmL0TMDdw6RQr4Jf9yAjl+tbSjZjpbNRjBlc06F2heN3fwLO8v0n78lyvs13nmLQ2HO7U9thn0trsZUGyKmKrmnDNIjSY2F0m8yMPGLIwpgjL3s8kkT+h7kFWFC4nk6tz5Bldk4GcaBCJgVElMhNpLB+earz0NMUPTQr3md1kiOd3W/ib9DWO/G6NlDwk+1SP5YRKQEIXHeTy3llbkFGGSvEEcoFwKqcC13/7AfbEk1yhxiFNmy7G6tuv2dywZHGgBPpF9Rv0ePmQx0sf2UJQURpay1B6gDFEest/tZq9ugOINCL3qVRaP9JMY3M14U1od3+kfXW05XChyvI4z3UHNSiVnSi/fYL2/XcnN0bwGWvOhz8sLB1XIbpUJc1hw8C21HTrPB29MSxUr+fo0Pzz7MikzjODsMLogdu8yBBpba4bULFqUpoxTUFuPwvUx6MwqtLipAcM36ykoM5gSHiRv7C1S8AOJRwr88ErsxUAsmoe
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|5062599005|23021999003|19110799012|24021099003|5072599009|15080799012|37011999003|55001999006|25031999004|39105399006|22141099003|10035399007|4302099013|3412199025|440099028|1602099012|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CUNBEZEn97Ll7jNdkyLRMnOO6KxDX2xRF0VbfrPIpqNHu9C1xg02gMIM4DsL?=
 =?us-ascii?Q?re5cxPVxLPVhfxDSpxxf7TCUvRUK7uutKvZ+9gnJMiXmKVmtHC1p9UH+t0lb?=
 =?us-ascii?Q?eTCHeSTXK10jHzF9OthxKU8KVSOKPQNXeTg8TV7gWrsCyVG55bpaGpMojcaQ?=
 =?us-ascii?Q?uCAVzMGhaMJup5AT9U4h17Su43iUwuDxbypmyz802wkG7WXiZ2zeCjv5gJ8E?=
 =?us-ascii?Q?VsPH9fUr1Rw80CHR+P+mmEDFp9Tq+LT1wEw4s4IzATs5bRhUAjXQtWw1K72P?=
 =?us-ascii?Q?K8sS/uGI9qO8dmbBOQHjViRp1ca4UGIYC+wUXkjqMEsY0zpLjRL3qyo0uka+?=
 =?us-ascii?Q?GY3PZW9AHcDo468GXnxmkAU1EcrV4mLn8Xlt2M9USuvDATg2xEyvtoTtQ6C1?=
 =?us-ascii?Q?ABU7ey/dKrb9S7wHqcfCjefQDcKpssRx9FmjJmZ0QqyJtG5BZqjDSniFfqx/?=
 =?us-ascii?Q?/nSXGgwm9FGnue+qQDHG4W/dRpKcno4Uk998t2TfigzCZmEbquMPrRZ3ouI/?=
 =?us-ascii?Q?ch9BVtIvaH8yTDQSNbU/kNyXjQW6itOhZ9vz7UQWqm5hUYtd/OUgj8R221j0?=
 =?us-ascii?Q?owkTy3iHJBaIPIFXH8Pl+ROirrnUnroWCtTBulr4ncmeWaDMXi7j3hCBRezE?=
 =?us-ascii?Q?0C9oKP+tw7w5V4ixcbXr9AnuU0Sr+JIbieuYFK9iuXZMboTC++s0k6HAmbN7?=
 =?us-ascii?Q?zMTWMbKEYp7YKJY3yDGBvt3MCzrKnhrY+gZLq/PBzWFrvUvMuKpnvhBiuA2e?=
 =?us-ascii?Q?7Kfmhhz/+I4xDTqMeugmKX4T/VU3YuOEJt4UhvMarO4MKc3J3BIursrkYSkn?=
 =?us-ascii?Q?xbzkrJMnzG3WsPubUX7VsNsADRti2fuj+lMPl05bz0TIHegEtPsNt8VNNkqj?=
 =?us-ascii?Q?HVIHkQj7FsRUm0cOjljANsoCz3/T2DhBdwE6WcTgfF6dArl5fUJsJhzB6UPt?=
 =?us-ascii?Q?a16Cx1hkzCbhU05Xi050gfC9TCAq/Qflb4Dk8YnmL0jEdKB5BCI+G9dA1wWh?=
 =?us-ascii?Q?gK6G4VAtOph/s/pykNIDRjglz2hxWAomjnfDAv9j+d0IWTP7Nphw72GSWnpk?=
 =?us-ascii?Q?EUkmvLJT40TsHeyUEFuRYrIFw7XYPxEZa/SPUDbXeVvRrkt4FQ6GTZSeOoAs?=
 =?us-ascii?Q?I0Kh8MRHP0EB88KroVA1Tf6Sr3ZBL8rVeJ7STK5GBPFG7zspB8SSMCbEoMEX?=
 =?us-ascii?Q?FZoRDatd+TS/w+cqhrwZjrpXAtIaQAPuUhdrvw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IksbQlrvOJI63euMaYOQY5T8HJLcgKsiIQjnrS9aQewXnsl6IwzLtS6mDj6Y?=
 =?us-ascii?Q?+Q/vsrhOwv1EX+nRi9onOyg5d5RznsLOs3XH5fowXwhaT8n/Uoztni7jI+nB?=
 =?us-ascii?Q?Z8zXw1IUGXubCdiGnyU4T678otK0od6bxzV+/nPPKutBN2r4PsZlIY0vCzPW?=
 =?us-ascii?Q?ZzCfYWqERfu4Uldp6xca9snhcXpyOVlsWQCKWz5hr/qyBaZlZh2NLHUIoFTK?=
 =?us-ascii?Q?QEnNNw5Usb8moQOxNHHHYKpudzoC7LhhSf+qtlDuV6rqh0ePlvty7+flHzw4?=
 =?us-ascii?Q?eT7tjxthSlH9HBwQlLftcKvWDVRNlkkzX5Z5EqZSdA+asHcrQwzBAXsdAx4G?=
 =?us-ascii?Q?5+A46mJ5JSsGAyPuMQ2EGuW0K+A75E4JK0dm200wkPHZSddfAnojhhbkFS70?=
 =?us-ascii?Q?B+EYjbE4Bsd1XMDUYlUJKY2A5TdiqY6HYOCz8MP5dKANfvtW8NHgybLGO9m5?=
 =?us-ascii?Q?R7R97c1pl6JH16RHvyX7kWC/nh3nCIId0BGkampBaqEkVjOLtZunjbG6s/XE?=
 =?us-ascii?Q?1bBFfEA863QV9ybJIWmsdhYhIjYz/cBgp6Kuj7QG3GfD6MPn9pNQESwe1dhI?=
 =?us-ascii?Q?mUG4S+OB+WTW3ovyvZ27vIEFcKCp+uQXbi1yT2TKnCBBJHmv+JpL4jk1Bqrz?=
 =?us-ascii?Q?WASmH0d4ADMvrXVeA6avMuaC9gBmKkA+VfSsoiSe8/UWfbNezwy2o+PFaMaV?=
 =?us-ascii?Q?+r6aJZuY1pbpOBW1tFwu+XBSFabtzbOJCLsv9/xtb9jaLC1qP9byV4YCtHoE?=
 =?us-ascii?Q?a0avIgfw+6z1tse4m+ZHjQ4+ljREQFASirUD5/hXAY7v+Vox3iTz1+gbJrI4?=
 =?us-ascii?Q?FcG91fCmBdDuYTmbie1YM9LTSoX7AxrlNPRXTFKxLHcip1nmPNFwnDgDr4xs?=
 =?us-ascii?Q?wsV7NKf3whlpPnCk266tDx+MNwF6YmrWpjdh3LF6fC3zWGjq1T44aJcbz3Lu?=
 =?us-ascii?Q?isJqejINzMgU8FS4GvPgbK66b5KVwlovhk1JJQdchDADj3H046ng3ytfVIYB?=
 =?us-ascii?Q?7UujkM5Lg4MQGgJQJtzhzKP+/avqSzHO+AeAq4ZizHfZ/J6mnpN/Hk0s5evV?=
 =?us-ascii?Q?S5Lk3z2v7OaA8HbDIY0o/rZgEkAC7TRc6rT4tStxwaNM2DSPKygoZdfdKcKg?=
 =?us-ascii?Q?I1tGUu7X8I+j975En4fVPNfEze8tqrr4ZGFIBn0r2GHTQezGoPueNzVw/YFr?=
 =?us-ascii?Q?pwzAkYIaaKvKU/e2Zl7TwbiC/0MoRreutXJhqI8p1Kop32EgaU+2wI54t2iB?=
 =?us-ascii?Q?RhZKYXTTxkILuUf+HCWDpAeR0fLzQ5qCz8onZ5L5Vqp/BgHpiv/5G0DxPzpF?=
 =?us-ascii?Q?K4swLtyPxTHcDXsbrQSDOpMhpGZkXlh75V51qz6gat6hDkJYfEBqM+ZVUCMi?=
 =?us-ascii?Q?kxcJMK48pZjCBtu3jjnUhxf70J1k?=
X-OriginatorOrg: sct-15-20-9412-6-msonline-outlook-24844.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b495a0-e930-4282-0ed2-08deb67aeb8a
X-MS-Exchange-CrossTenant-AuthSource: DB5PR03MB9905.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 14:20:19.2019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7274
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[hotmail.com,none];
	R_DKIM_ALLOW(-0.20)[hotmail.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[hotmail.com];
	TAGGED_FROM(0.00)[bounces-62301-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nextdimension.cc,vger.kernel.org,hotmail.com];
	DKIM_TRACE(0.00)[hotmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xeeynamo@hotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,DB5PR03MB9905.eurprd03.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 8E46058FA8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the StarTech SVID2USB232 USB analog video grabber
(USB ID eb1a:8286). The device uses the Empia EM28281 bridge, a
member of the em2828X family with an integrated video decoder.

Reuses the EM28XX_BUILTIN decoder path introduced in commit
8e53399c63c3 ("media: em28xx: Add support for Empia em2828X bridge").
The standard PAL/NTSC switching and composite/S-Video input
switching in em2828X_decoder_set_std() handle this board without
board-specific code.

Inputs:
 - Composite video
 - S-Video
 - Analog stereo audio (line in)

Tested on hardware with a PAL signal on both S-Video and composite
inputs (ffplay -f v4l2 /dev/video0).

This supersedes an earlier RFC posting from before EM28XX_BUILTIN was
available, which proposed a custom EM28XX_I2C_ALGO_EM28281_INTEGRATED
TVP5150-bridge algorithm. That approach is no longer necessary now that
the em2828X bridge support landed.

Link: https://lore.kernel.org/all/20260119185921.575666-1-xeeynamo@hotmail.com/
Signed-off-by: Luciano Ciccariello <xeeynamo@hotmail.com>
---
 .../admin-guide/media/em28xx-cardlist.rst     |  4 +++
 drivers/media/usb/em28xx/em28xx-cards.c       | 29 +++++++++++++++++++
 drivers/media/usb/em28xx/em28xx-reg.h         |  1 +
 drivers/media/usb/em28xx/em28xx.h             |  1 +
 4 files changed, 35 insertions(+)

diff --git a/Documentation/admin-guide/media/em28xx-cardlist.rst b/Documentation/admin-guide/media/em28xx-cardlist.rst
index 7dac07986d91..741aa7f7c882 100644
--- a/Documentation/admin-guide/media/em28xx-cardlist.rst
+++ b/Documentation/admin-guide/media/em28xx-cardlist.rst
@@ -446,3 +446,7 @@ EM28xx cards list
      - MyGica UTV3 Analog USB2.0 TV Box
      - em2860
      - eb1a:2860
+   * - 113
+     - StarTech SVID2USB232
+     - em28281
+     - eb1a:8286
diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index fbfb74eab475..e3c0f5e491e3 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -2677,6 +2677,28 @@ const struct em28xx_board em28xx_boards[] = {
 			.gpio     = mygica_utv3_tuner_audio_gpio,
 		} },
 	},
+	/* eb1a:8286 StarTech SVID2USB232
+	 * Empia EM28281 with integrated TVP5150-compatible video decoder.
+	 * Composite and S-Video inputs, stereo line-in audio.
+	 */
+	[EM28281_BOARD_STARTECH_SVID2USB232] = {
+		.name         = "StarTech SVID2USB232",
+		.vchannels    = 2,
+		.tuner_type   = TUNER_ABSENT,
+		.has_dvb      = 0,
+		.decoder      = EM28XX_BUILTIN,
+		.i2c_speed    = EM28XX_I2C_CLK_WAIT_ENABLE | EM28XX_I2C_FREQ_400_KHZ,
+		.xclk         = EM28XX_XCLK_FREQUENCY_12MHZ,
+		.input           = { {
+			.type     = EM28XX_VMUX_COMPOSITE,
+			.vmux     = EM2828X_COMPOSITE,
+			.amux     = EM28XX_AMUX_LINE_IN,
+		}, {
+			.type     = EM28XX_VMUX_SVIDEO,
+			.vmux     = EM2828X_SVIDEO,
+			.amux     = EM28XX_AMUX_LINE_IN,
+		} },
+	},
 	[EM2828X_BOARD_HAUPPAUGE_USB_LIVE2] = {
 		.name         = "Hauppauge USB Live2",
 		.vchannels    = 2,
@@ -2946,6 +2968,8 @@ struct usb_device_id em28xx_id_table[] = {
 			.driver_info = EM2874_BOARD_HAUPPAUGE_USB_QUADHD },
 	{ USB_DEVICE(0x2040, 0xc220),
 			.driver_info = EM2828X_BOARD_HAUPPAUGE_USB_LIVE2 },
+	{ USB_DEVICE(0xeb1a, 0x8286),
+			.driver_info = EM28281_BOARD_STARTECH_SVID2USB232 },
 	{ USB_DEVICE(0x2040, 0x0360),
 			.driver_info = EM2828X_BOARD_HAUPPAUGE_935_V2 },
 	{ USB_DEVICE(0x2040, 0x8360),
@@ -3859,6 +3883,11 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
 			dev->wait_after_write = 0;
 			dev->eeprom_addrwidth_16bit = 1;
 			break;
+		case CHIP_ID_EM28281:
+			chip_name = "em28281";
+			dev->wait_after_write = 0;
+			dev->eeprom_addrwidth_16bit = 1;
+			break;
 		case CHIP_ID_EM2883:
 			chip_name = "em2882/3";
 			dev->wait_after_write = 0;
diff --git a/drivers/media/usb/em28xx/em28xx-reg.h b/drivers/media/usb/em28xx/em28xx-reg.h
index 68a0fcc2fa72..8931733a8e24 100644
--- a/drivers/media/usb/em28xx/em28xx-reg.h
+++ b/drivers/media/usb/em28xx/em28xx-reg.h
@@ -283,6 +283,7 @@ enum em28xx_chip_id {
 	CHIP_ID_EM2884 = 68,
 	CHIP_ID_EM28174 = 113,
 	CHIP_ID_EM28178 = 114,
+	CHIP_ID_EM28281 = 145,
 	CHIP_ID_EM2828X = 148,
 };
 
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index 21c912403efc..2b9b95b53307 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -149,6 +149,7 @@
 #define EM2828X_BOARD_HAUPPAUGE_955_V2            110
 #define EM2828X_BOARD_HAUPPAUGE_975_V2            111
 #define EM28178_BOARD_PCTV_461E_V3                112
+#define EM28281_BOARD_STARTECH_SVID2USB232        113
 
 /* Limits minimum and default number of buffers */
 #define EM28XX_MIN_BUF 4
-- 
2.54.0


