Return-Path: <linux-media+bounces-32236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1492AB2937
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 16:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 406A8189287E
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 14:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4770F25C6E2;
	Sun, 11 May 2025 14:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="VDugBkeE"
X-Original-To: linux-media@vger.kernel.org
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazon11022081.outbound.protection.outlook.com [40.107.161.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3935D7081A;
	Sun, 11 May 2025 14:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.161.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746975013; cv=fail; b=jp1gvTLXwgIfiwXCpki5yyc5S+cwCU9FF6r8b2dIUL89NIf1RJsl75oMgZJqC33ljIwSphSsbNXjTLzs2G7IcspbhKIXcgbti0fAMBuT+xlY2zepgYpOYNXhPONaXUv3qQaL2VfT3er3eCurVktJIWBsTqJfkJbG3iISm3z6uig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746975013; c=relaxed/simple;
	bh=KpFIi1Ajn5sYFOWrrAErHNfNCx43waXiHs0hqm5lHtc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VbaF907gcFLjaizIftupc2P19zkgRI/D3kEQ310W7JlTHSGzgtBbsqnvPfX0bLtLIbq/c3Z8L6RGlkQHjNlep/sOkTjghKn5K31frQzeddqLq0KfHn9hGRSVg4hZsHOtQ2Yq6yKFy/TetFri9Za9x+PeWd+0CWdViFfAWGvj+wY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=VDugBkeE; arc=fail smtp.client-ip=40.107.161.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ib1MwGlpQqQpOa0rTWoqQd1E1dmqhwTpmOKY29RjJjbBFLmWG138ZXC75q5vR7dG6yrCjVAMi8fIffgWPLYfMSle94m3XwtI1CE14GaXUF+Sug8F7IG4dVaQqqMU4sHEr1Jsec/7YaR6c2u3ZILX88ZqR9nCylMFpTH292/5tUaIaXxBPimCkjFfT6NWnw7UXAZpDHeQWzeBz8i2yFdM95COUYJYyTjVOb4fPpxUaLuS05Byiqpi+tvxoa/WNPFwKfjilo3ZF6t45917ty03kKYfMAOFsGftOmJeWbYXBzRvdj9yvCE41r1g4FQmhGnBHbjmxhGVEs31fvs2fSJxhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzUazx6iBs64AEsyxJAiqGGwIlTSdMC1yjC1DXGxq8o=;
 b=UJ52iRmIJvRNjuqtxXvzuctDkwQm3uudo1qGZIpbYWMms//NDqiosemZ0deQdP1sWqJf1TcCrquJbIU8KVlWdld535FDZESH6/o8ruCUbqyY1Clu7XVFNJjCYOBmt7c0D3mqr1zO9iWFNSYNfpeZLCIuRrxsAVTCn/wCAiyHM9TfBAEE9fT8jiRzYO9UVzGiZPoOBPCDNine+1l7k7Jhu6PtT0ECAJ1zhYHKVc/Bn7wBGSsqkboVCMpv2Duhf8fKH7xY2vjnUpXFwrpaYS61Fb/j72LTGDrPFHjPLqYeJ8gq1KFxqfzKSb/ToL8XNFr9wmrIu7hsvajm/BXHyIQ2Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzUazx6iBs64AEsyxJAiqGGwIlTSdMC1yjC1DXGxq8o=;
 b=VDugBkeEVygOwXl42QSXtpWAHsCBfCQNAR6ZethJ4CNUv/eo7rrf3z+K2XlY53m1xwxjwq3gYTpub6VGkZvA1XiAmgTxOZBhB6Emi72nJE6niz1XYT6CRscEbOW3PEoA+5+vtsFeYsBRNrSv6lS9VFOSM0R+XnnRBct9bg42aPJJQ7buikVgItYAy4R8dITvZhmCp1u0Tchr4pctufd9s0eQ3Z0dSxWpqqFtnmJmVxejYf9bNAIZC9UNAq9ub2+g+5aXhid5EdSN52ZR/737ZV8OvX+90IVMgplif8tk3P4Fx/qtTMxYKf/Fin+Yrv15UR2M58USyFOJBhLSK+D4HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by MR1PPF375D3D4D7.FRAP264.PROD.OUTLOOK.COM (2603:10a6:508:1::21c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Sun, 11 May
 2025 14:50:04 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%3]) with mapi id 15.20.8722.027; Sun, 11 May 2025
 14:50:04 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Michael Tretter <m.tretter@pengutronix.de>,
	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Junhao Xie <bigfoot@classfun.cn>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] media: allegro-dvt: Move the current driver to a subdirectory
Date: Sun, 11 May 2025 16:47:32 +0200
Message-Id: <20250511144752.504162-2-yassine.ouaissa@allegrodvt.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250511144752.504162-1-yassine.ouaissa@allegrodvt.com>
References: <20250511144752.504162-1-yassine.ouaissa@allegrodvt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0330.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39a::24) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|MR1PPF375D3D4D7:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f09acaf-e1d6-4e64-cc2b-08dd909b1d8f
X-LD-Processed: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?9XWNaJPQ20G85vALdKROcW0+XqSBUyzm6vc+a4IKC540TaOjN8qwe6uPCEl5?=
 =?us-ascii?Q?NcJF3Wod4sOFLg40/BpXlJ9HXzQOUPc0R9BcUdSc1rdloe7gGKPaHt4IT18S?=
 =?us-ascii?Q?KcPNKAploNVyceSbXB8JUvdKut2GRBWfEDS9PWTqehOOMLEz4aGHM56nhJEJ?=
 =?us-ascii?Q?x9+Th7hPlnrLg0PujTQ23181w+2+VnQTHBkK+kARVnZK7uN4vA/GR95RIrR1?=
 =?us-ascii?Q?FKR4VMma4FufBb7gdmcxXSGUQlkWiDWzySVlZMfb5bdwdOkrNRk7IHx9GqYW?=
 =?us-ascii?Q?hQk+Qr4jkqV3gNZo0C+2g9NwXtJeXxaCtrFTgXUwk+Ryh2/RfyaJGhUz0i7g?=
 =?us-ascii?Q?VwEMW55+UrYpB5MAW9xGaUvzvg/OUXTgr36PSp9A9l27qErchlKms+ckP+ba?=
 =?us-ascii?Q?pl/d38W6JrzbaSsM9HoCpCQ1EXjwHVNsvvjclxboO950AlAI7jJRXnj1N76y?=
 =?us-ascii?Q?ePv3Wc1MsVx0gnOt3sV6a/f32iRWQvC1LDckO18SEy/vinsivJl2HMl3uF2h?=
 =?us-ascii?Q?2kxGJWEDQP/pP5hFCmn29EhJC6YmhbWxHkJBlDz6iThUJMXKtPs6oQbpcZUE?=
 =?us-ascii?Q?h/XxvgpVRR0lTbesuK2ujrfMLzAV1mMQhYf15F29JVxedQ5QS4Y2Ne9XoooW?=
 =?us-ascii?Q?U5+NMalGPUdJ7mIfdHKAA02U/dwgar70CRhGfEdNvHMTVUeWvZuwazpcKI5w?=
 =?us-ascii?Q?1NK2eAiCLYBYQTsSb+0bgbEPPuX4OWkonRIP/VJIXJd+qx3iRKRhIRrcgujS?=
 =?us-ascii?Q?wLfu2Rmw+xBqyyOrKzPasdw+VXTu17kL//ByJwzLjBKn4GAAZo6RvJ8wUjsH?=
 =?us-ascii?Q?L6bcHHOA+34aUE+haJ6C2GBlhv5KBoyLoyErcqwLGkHAUel2yx96sAxwS/iE?=
 =?us-ascii?Q?54389rVKnRYcLEw7PqDSHqL0dEUqKwXp+wTgBSh1YJLKuXXYAKe7QEL4NLcW?=
 =?us-ascii?Q?rTevO+tF5ziMQV32uThPSsxokmtXRVQysw6XcF+iJKaj3yI/K4/1NLXwVs/H?=
 =?us-ascii?Q?PGVL7uL0ejivG4J16QBL9V+ME1foxvmJfJVpiY5Xsvv8Yv35uT58u4CGUk7w?=
 =?us-ascii?Q?Awe5RB/LCBq7lhr5SB47N6ribEQk2RYKjE6hQjghF4WPOGQhfV0D/RRVeFzb?=
 =?us-ascii?Q?Z8bvp65cB30xtTGQrl9jRUXoudC+Hv+9vY/12AbX0j8ze3iFp5AHJvK7fvGi?=
 =?us-ascii?Q?osR5+2+5m0259XZF4WUWSmu3Mk9CTS+NCTnU1ERGyyQQk50omb8n6jYrV4Uk?=
 =?us-ascii?Q?cVYSBW/iaVaKlEFCXw6KstotAIkolbjvZ1MHzWQA8X1oJ5F5J5z3vTFV7099?=
 =?us-ascii?Q?B5BncCA8yFb1uFYDkkcjQ7mvCCmWIa1eAOLHwiP4VBgj+kcnQGSdXhYe7qp4?=
 =?us-ascii?Q?xjflHPbngDHpXrMzfFEPM3fQO0gZcks+YnWpU2xHPsMu4LOevHo72NWOOnzW?=
 =?us-ascii?Q?tgx3hRuUcGz7RBkhu/+quSLZlnxNOxzd3eaC+Ri62sH8OojCYw5EAQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?9cFS+qdrEsVB7m5IHayauvao9eSppcRxJtt3f7P17wTgW8bx958O8UtYKV1x?=
 =?us-ascii?Q?JftPv/IVF+k5HwNBTwcDJaJeZ4lI/3aSmFJkscZZSPdtQgp5YPkL9GSR6Q2O?=
 =?us-ascii?Q?YkIVQjSpcdm5ds7j7gy0jLh1JwIadVED+MgEG/QUsDs+eGMl3uzXwgGyd6q9?=
 =?us-ascii?Q?07jArrXhPEnQZbzVKSy1JH9DogYrwE4PnjhCnOC7EmVgy8BQMRagnyhxQ2pB?=
 =?us-ascii?Q?z/yaytuddBNOC7ULnAFQhQEkaVwuws0uo1mJrRSuCTs0xNoMnsGKnbeMoyYi?=
 =?us-ascii?Q?Lzd+IrM4OEJdkGr87iKPSVtAqgUdbTb5F52tjBgFbAYArcKPVARnwK/gpEkd?=
 =?us-ascii?Q?M9IKB9XBfk4dZgB5hNAsGnVnkSvHTyX/PyJOCp4wmpO9ElQQ6xwF7wsy0IBJ?=
 =?us-ascii?Q?hjeZoBx0HPcIlw0avnNPR5dNZGUTs+Z91dO8n+AKWDPoQirkaqG2TBHengRX?=
 =?us-ascii?Q?pQaSdyavHWX3F+sqYQcTlfpCb8IjgA1t3boXDDN33QEcrDIZPfQVhZ6Y7vGq?=
 =?us-ascii?Q?inbmZYtw/haHgZCtzvz0AlsaMMw2E/I7ddbbKRRaBEXghUbwz3k4d2UH6ivO?=
 =?us-ascii?Q?dDpVS3lJy6KuBrAb6Wx9290VFwYIgQshuZ1tMutXpxpd7X296Ser9DdyLTGz?=
 =?us-ascii?Q?AKKLdhJSfVc39Hhe5jl24yOYz9xTJz/PNA0qArWJQzsbWB8DQ318i3jEZ16s?=
 =?us-ascii?Q?sp+KDbBH62O9mS8B+TKvqb98VgNFxg9yHsLxzktIB9Wr0w611SaHpNPU1ooO?=
 =?us-ascii?Q?mmxE4LJqbODACGFdNuuCPheyZI7c2aVI1FAcraZ/FReutIjysxye1196xfbO?=
 =?us-ascii?Q?BeqQf6h1QX6It/LfGWn3kaZi/Mh2pQQ67NMx/78PH8p0S1zGOnIAKIysSfSP?=
 =?us-ascii?Q?6wTd18xrizPsv/YvSGfTK0Ne9yXjkwNkO12xvUNaB62hxUoufixRmjzX0UBD?=
 =?us-ascii?Q?014Lf012GHWajmAhKV+SanyKBeJP2Hiow6L6RkiZwTWAzu2UZk3+qtxUEHgA?=
 =?us-ascii?Q?YBYbvv5wDCkJ2PXZCryjGV5hnwTLMCG3nRFtqZ0hAOxAopqR2GuRzc/9vd0v?=
 =?us-ascii?Q?ddpwkPOGHU4E9F6ZrBUq9wA3/iNVdv1+GZf7Bwwn5IR6HKjbKNAdSm0piPu9?=
 =?us-ascii?Q?MBOg+wUUMJrhFAVcfGnqYRCBfXDLiwtyzQjZ9G9lB0L826gRnH/cDWNK7YKv?=
 =?us-ascii?Q?5n+dMzhlA4X2g63wd8J88yvROL7WTUU4nFW003O6gNbj4JQ7p4uXJqvap2Tq?=
 =?us-ascii?Q?8uIzcMietBbPrDTf1szNe1irnPQcDzk7ngqA9ZvnH2051iOFFQRFrH1uLFwU?=
 =?us-ascii?Q?pB3X/0jQ8vOk559d3D9rrZV+7iLdpyG4V+J5icvM/hTQ422MwoHyPR8cBrxu?=
 =?us-ascii?Q?eZDpSdUPcFFOTIlG27SlIqsI5IBbNBNgW4QCRqLrXuQ4yQ5j3h4ys5vnkIxt?=
 =?us-ascii?Q?zVuzlsEgmh/N5y/86XPhnsodrQVHfNi4Mm9LYsD/Bv941bUWxQwoYeE9NJY7?=
 =?us-ascii?Q?/fBi8UETa/YPx4gEv2z/dJW1umf1Y/0bVVyQ+DTkEHOOrX5ocIqRnpsXe1oB?=
 =?us-ascii?Q?TvUE78GODS0hU//GJCDP/PwcYksUtPqLkqjCP8UXOmQdTQSk8SArFcC/vKfZ?=
 =?us-ascii?Q?o52/Ky/Uhr8vQGM+T9QYUj8RZHUaisZyUnBMdOHQicp6XaHFNoMBCsia1yEV?=
 =?us-ascii?Q?UoIJbA=3D=3D?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f09acaf-e1d6-4e64-cc2b-08dd909b1d8f
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 14:50:04.8375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80LOATIpi8xjgTjHcHN5BmCLyiK9BpJiN1xGvBp1qNvsNbSaIdk10AxA+2EEC9Kv2rhHDTRjpQl5yIIKMLvLwJN7eVQAPFpEBGV/9kWCx/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1PPF375D3D4D7

In preparation for the upcoming driver update, we need to relocate the
current driver.
This will help ensure a clean transition and avoid any potential
conflicts with the new driver.
This patch is crucial for keeping our directory organized and
facilitating a smooth integration of the new driver.

Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 MAINTAINERS                                     |  2 +-
 drivers/media/platform/allegro-dvt/Kconfig      | 16 +---------------
 drivers/media/platform/allegro-dvt/Makefile     |  5 +----
 .../media/platform/allegro-dvt/zynqmp/Kconfig   | 17 +++++++++++++++++
 .../media/platform/allegro-dvt/zynqmp/Makefile  |  6 ++++++
 .../allegro-dvt/{ => zynqmp}/allegro-core.c     |  0
 .../allegro-dvt/{ => zynqmp}/allegro-mail.c     |  0
 .../allegro-dvt/{ => zynqmp}/allegro-mail.h     |  0
 .../allegro-dvt/{ => zynqmp}/nal-h264.c         |  0
 .../allegro-dvt/{ => zynqmp}/nal-h264.h         |  0
 .../allegro-dvt/{ => zynqmp}/nal-hevc.c         |  0
 .../allegro-dvt/{ => zynqmp}/nal-hevc.h         |  0
 .../allegro-dvt/{ => zynqmp}/nal-rbsp.c         |  0
 .../allegro-dvt/{ => zynqmp}/nal-rbsp.h         |  0
 14 files changed, 26 insertions(+), 20 deletions(-)
 create mode 100644 drivers/media/platform/allegro-dvt/zynqmp/Kconfig
 create mode 100644 drivers/media/platform/allegro-dvt/zynqmp/Makefile
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/allegro-core.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/allegro-mail.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/allegro-mail.h (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-h264.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-h264.h (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.h (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa1e04e87d1d..d81d2756cb2e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -806,7 +806,7 @@ R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
-F:	drivers/media/platform/allegro-dvt/
+F:	drivers/media/platform/allegro-dvt/zynqmp
 
 ALLIED VISION ALVIUM CAMERA DRIVER
 M:	Tommaso Merciai <tomm.merciai@gmail.com>
diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drivers/media/platform/allegro-dvt/Kconfig
index 2182e1277568..e9008614c27b 100644
--- a/drivers/media/platform/allegro-dvt/Kconfig
+++ b/drivers/media/platform/allegro-dvt/Kconfig
@@ -2,18 +2,4 @@
 
 comment "Allegro DVT media platform drivers"
 
-config VIDEO_ALLEGRO_DVT
-	tristate "Allegro DVT Video IP Core"
-	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV
-	depends on ARCH_ZYNQMP || COMPILE_TEST
-	select V4L2_MEM2MEM_DEV
-	select VIDEOBUF2_DMA_CONTIG
-	select REGMAP_MMIO
-	help
-	  Support for the encoder video IP core by Allegro DVT. This core is
-	  found for example on the Xilinx ZynqMP SoC in the EV family and is
-	  called VCU in the reference manual.
-
-	  To compile this driver as a module, choose M here: the module
-	  will be called allegro.
+source "drivers/media/platform/allegro-dvt/zynqmp/Kconfig"
diff --git a/drivers/media/platform/allegro-dvt/Makefile b/drivers/media/platform/allegro-dvt/Makefile
index 66108a303774..d2aa6875edcf 100644
--- a/drivers/media/platform/allegro-dvt/Makefile
+++ b/drivers/media/platform/allegro-dvt/Makefile
@@ -1,6 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 
-allegro-objs := allegro-core.o allegro-mail.o
-allegro-objs += nal-rbsp.o nal-h264.o nal-hevc.o
-
-obj-$(CONFIG_VIDEO_ALLEGRO_DVT) += allegro.o
+obj-y += zynqmp/
diff --git a/drivers/media/platform/allegro-dvt/zynqmp/Kconfig b/drivers/media/platform/allegro-dvt/zynqmp/Kconfig
new file mode 100644
index 000000000000..0a0a697c420d
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/zynqmp/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config VIDEO_ALLEGRO_DVT
+	tristate "Allegro DVT Video IP Core for ZynqMP"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on VIDEO_DEV
+	depends on ARCH_ZYNQMP || COMPILE_TEST
+	select V4L2_MEM2MEM_DEV
+	select VIDEOBUF2_DMA_CONTIG
+	select REGMAP_MMIO
+	help
+	  Support for the encoder video IP core by Allegro DVT. This core is
+	  found for example on the Xilinx ZynqMP SoC in the EV family and is
+	  called VCU in the reference manual.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called allegro.
diff --git a/drivers/media/platform/allegro-dvt/zynqmp/Makefile b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
new file mode 100644
index 000000000000..66108a303774
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+allegro-objs := allegro-core.o allegro-mail.o
+allegro-objs += nal-rbsp.o nal-h264.o nal-hevc.o
+
+obj-$(CONFIG_VIDEO_ALLEGRO_DVT) += allegro.o
diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/zynqmp/allegro-core.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/allegro-core.c
rename to drivers/media/platform/allegro-dvt/zynqmp/allegro-core.c
diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.c b/drivers/media/platform/allegro-dvt/zynqmp/allegro-mail.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/allegro-mail.c
rename to drivers/media/platform/allegro-dvt/zynqmp/allegro-mail.c
diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.h b/drivers/media/platform/allegro-dvt/zynqmp/allegro-mail.h
similarity index 100%
rename from drivers/media/platform/allegro-dvt/allegro-mail.h
rename to drivers/media/platform/allegro-dvt/zynqmp/allegro-mail.h
diff --git a/drivers/media/platform/allegro-dvt/nal-h264.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-h264.c
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
diff --git a/drivers/media/platform/allegro-dvt/nal-h264.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-h264.h
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-hevc.c
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-hevc.h
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-rbsp.c
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h
similarity index 100%
rename from drivers/media/platform/allegro-dvt/nal-rbsp.h
rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h
-- 
2.30.2


