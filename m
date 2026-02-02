Return-Path: <linux-media+bounces-51977-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KZ9HdN1gGkV8gIAu9opvQ
	(envelope-from <linux-media+bounces-51977-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:00:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC56CA600
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6410730074E0
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 09:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E486337B87;
	Mon,  2 Feb 2026 09:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="B3v1wEfs"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D5A2E22AB;
	Mon,  2 Feb 2026 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026377; cv=fail; b=qCxSkPX75T7Tz0jt9Rd5xLiQ+d/TU0FaY0nnXNoxQYF8JVv4WzQpVy/HNXvvGfZWMPpO0ftoFBNGOTP0yvTMlnxKjXG5bIngCBP1gy++7qIZcMv4QMIQ3pZX8APFkhJbYrrPEnCZoTlMcplp7fS3xxNWrE9wO+u5BXe4fyJDL9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026377; c=relaxed/simple;
	bh=OLkSaZFzKaOQv06SZ3HsKlMrKQNy5NXK6XtiO4if+Qs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XkS4bELm4uU7cPuqBZcz9HMdG94uBGCluGhpA71XF+SrgWXB3/Zc9QZIpZKa8zhINiJre4M6wYDyIHI7I6xQ+k/6Ip4glF5qdM2DKf+YHC08LBZZv+XeQIVl+v1ULU8DMeY9TVJlX1V9U6kVdsRbK6+ax0QpIHGUeMNqO3qGGoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=B3v1wEfs; arc=fail smtp.client-ip=52.101.65.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XbzEeE+lCXvMxHKxT5mwI3Kx4VHYGkvV9ZPNz4jP50SJny03udWmYFO00Hq2Oxm7fMMGr6CeTf8I5U34rQFUJxeeW51Bn5nLp5d/IbANzavD5Ovb2rU06jusN6CPoASMQFpPz0bRvopam2Pf+stoasz09cDunWgwXlHT22G10AxKddHNgX5pZ8qfEAPfahDqTLbu94jWq82YqAYmd8dYFGuTcQv0sf6p2ZEonU10/g1oH9r8ngzeub145tuy6M02Mmkl4wOUtBvqM/HyHdZs4P9CFW8MXgXrfkhriqahys9fxS/7b7dA92qU/tR01OsW/24ls3ji+US04Sx35vDQFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3NyU7d6Bf6o5YZDfFMucZatplQ8e1HfcPub5ovN4CY=;
 b=uX03bNbabReyCeKIMYyGfnZKxN33TsgrWY4mmuKVA9WpKNaAYsVVQFbhLtrbGNdFikyai4i9E7iX53JILO2cJ+cCwNWT8wrdmJeJG6cUGCMlXpn/w/Dc65b9EoWNkSyDYF0q7G7w7nv1HmTLrs9r00x4VMZPz/agLjU3FtFu/LYykyqwKHtggfjJe5LXgn60N27eqVQiHR1q/lUCNG5bQv0/f/xtHaYprGwjWEL9LpntCFmjLjHXPfiwchNcoV99WtgjUeTaZDqFC6NSqjRQZs3QFf4cROK1G6jVqxaUkVelQVPCiOSuf3JMNqrgBO0a+b7u8YredFUu86I0j8boEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3NyU7d6Bf6o5YZDfFMucZatplQ8e1HfcPub5ovN4CY=;
 b=B3v1wEfs65oFhVpr9wvqO6Hws4BBn7UVvIDefQ0htoFowG4uvFQKrAz9IHheh7k3rpz6qobVi8X66YyNkjsKd8cN34CecF/ep9hx0Vh8PbJlxP/jw7bgn10BteCxtxN9a/f/lpMF15uHl20GMQjcdR/yHLEq01P9hQBm5nqhU1q9sgJAvgmeXorZUkGzcxM7ZJVr9x8SyrNGDI7eL+O9BDKAjQXM0qGdKjIRAAE/QZLvdtd6AJmEhMYfkpfGQNGPdCFfb0SpPvBNoLjV5RPI2DJX81CFBKmUtidMEsY8zFrk+Af1f/z8QrsP+ZlsmeMjWqWAqAld6/e3QYsOz5w5IQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DU2PR04MB8936.eurprd04.prod.outlook.com (2603:10a6:10:2e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.13; Mon, 2 Feb
 2026 09:59:32 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 09:59:32 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	Frank.li@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/3] media: imx-jpeg: Add v1 hardware encoder support for i.MX952
Date: Mon,  2 Feb 2026 17:58:33 +0800
Message-ID: <20260202095843.1030-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0188.apcprd06.prod.outlook.com (2603:1096:4:1::20)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DU2PR04MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: d37530f3-c491-4f74-137f-08de6241c2b9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SiSBvggItHWkqamW3harZbySKpSK36nnxNcZEZ4FkqLDzsH5tubL9X2w6TDP?=
 =?us-ascii?Q?Hp1+ZGinbwlUon8b6gXD16P7i/vC7hU5ekxFZ3GJumgV+NenOOhYEFuQUmJE?=
 =?us-ascii?Q?QHGVVIFP0DCn/x5/BdG+Zslj5ta87NXRmcgg0gJpNMBlSkbR+NCFIub/k/yr?=
 =?us-ascii?Q?KbkcUnnDCSZBTQnpG6CxD9Fj7oq6N+/jQXMuiGY5HnFO1oyDRMnf8bv9UFfW?=
 =?us-ascii?Q?0VAPxrYWEMk1XSt4B4gZe9Oz1LSPBk/ASTfvlJl10UVtAOe5cBLhRwRqzW/A?=
 =?us-ascii?Q?kthtmE/fi1CGqk5eqztJua04ITHi8l++r6HaCZXTytNAtb/DSdsvYfD10B1+?=
 =?us-ascii?Q?jxBe0SKt+4bkaRpd6Y2fMvyI+WSjwitIg4NIzECP7spXDm6aaVorlHJTGBbO?=
 =?us-ascii?Q?fM3ohKHcxdBdd5b/Q+D1lsnEW08tahb4bzuxETeqUyzl3DRVfOisyl0+slZl?=
 =?us-ascii?Q?dwHo2euqftaw0qYJdLoHACiPkAZevhFqmdv4nJelE3glEGG0B4/7+1ivd7ud?=
 =?us-ascii?Q?euDcAjzfYdLGeBmp5nfIHUOl3r5MzO1tpBRuTC8FDtRG5rkJrE3cluqZGEr9?=
 =?us-ascii?Q?W/QTLdb/nphncmT8gro8qHf9H3l1unD3dESL9yauUD5mRZxUOKNZp+dnEQDP?=
 =?us-ascii?Q?a+1laQ1nb1KAhcDZACFZ3uwpOQxyyT0qYP9HWaO6R6Yg481lskoz+N/P2tww?=
 =?us-ascii?Q?8nBBT8homWYEFgvJNAX1zuvpte9YPdrgkWqNVmmh9L8sVOWA4q2FAaUp+m3U?=
 =?us-ascii?Q?+QrybwSftnWGTPx94pzTDfkzUaG7QUf+go+Wtz308Wk3e8GzdUtBaQZDFSh9?=
 =?us-ascii?Q?Z2EwtSUcvyx7UaQkOwfge2oA7SXPKft506Rpc72wzSFrq46AYAfDbQsSzR9d?=
 =?us-ascii?Q?LcTiABXWvPCjLLJmAjPK+tjAtsz2amhESjksaszWlhDZWPvvJ0S0+FMNQnqp?=
 =?us-ascii?Q?7iXtSASPM78YZZG5Ayqa9IgejvHw+8HMDSIVMi/DLOZUvlj4AW5KFuDb1l9S?=
 =?us-ascii?Q?jYefILFqQC9y5jVcPvHsFcYSshZbcVHolXmj0jrISai0aUvADO73/soqxtf0?=
 =?us-ascii?Q?/R+FpVcd7GCuUQyZZztL9CIvPwQvTtTWzV3aLNJ6KeTxdu+sdBkA3zMsnkuG?=
 =?us-ascii?Q?fCkS9uFOTWhDJFj6r0MxOV4FGLRNGOHyTHY51XCzVQHK1azV7Hy+nA3ISif8?=
 =?us-ascii?Q?GY+gUd3U248zV+Geoe7ctHvs3pUM2P4/AkPnsoQrHnlBNOo11fj+jvkbC/UH?=
 =?us-ascii?Q?5/bJPruW80frlOfsIq8kJf/0sQaz2yW9J1YSxxPYa1fJNyCJFoEjkpIC5I0H?=
 =?us-ascii?Q?RbLcVw5QelzVTO77s/QSzAI+c1nOkPGKjAZ2Z0Z0DPIHXPHcs7V4i2UnnQ7j?=
 =?us-ascii?Q?4+CdVM7Sb82MBrioayeJIdUMU1/TpfZM89CrV/0X5lxsUGMfN/CD78Ffurv9?=
 =?us-ascii?Q?E1SI1ynx7XMGUxGFkzNrprdc1sbKtxhWlNRt96UEm1cuu2aL0yOQCzLIyUka?=
 =?us-ascii?Q?JuuhnEEFyaph+ctSWt7f/uYxR5P+Et5U6tdVwZQqgGIKid9r/bqsN4YCjsiU?=
 =?us-ascii?Q?nTNHoqYjGbuPKW86Mb1nv8Yk+P9RV4nEcg2gecknu12C7QMCABMKQCVNDPFk?=
 =?us-ascii?Q?BlYL5vlNi6Gn51bXhue1ThU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JchRV+ZxLRSm2lUAzxlqpjKD0j1bXj8CIDS/eFfkVy96aBuHNHKhlB4jYxxD?=
 =?us-ascii?Q?9hIRwxfdipVUuc3TuQLGAogP3NE1eUk2KlO3LkzPP6P001jWPAYc43K8PSCO?=
 =?us-ascii?Q?BidJmcse1h2vLhTbXO1/jPocT1MJeAhpsSykvSZWYDrJo4doj2oLbTieqOqe?=
 =?us-ascii?Q?S3ojDFLJi8LX1F7qBoNnkFaRANk8pg08LMrHBi4Yt2iXsgLf1vDdikhFu6GI?=
 =?us-ascii?Q?oL9ehJ+9IF+gdcw1pjHBy+fgAS1BRRZzYQSITtzLmWnKPrvbsafW1xQhzQ/I?=
 =?us-ascii?Q?+VkLQ/AzjA0TSN7RmseIazhH0it01hAbUj0AA2XhVMx1Cbpk0/IcvnYAf8et?=
 =?us-ascii?Q?aXH9bzaJjD2kdSJmCr/+ckRf+BV0xLWag6PcmfzjnORkaR8IPuddE/hR1iAk?=
 =?us-ascii?Q?xKfQm1PcDrWTh/IxsmLzGiJcXJ1I95nnGYFmTwjk9Xm/TuZ36cpu8dnZ7JfB?=
 =?us-ascii?Q?pC3yuacpHi8JaEkM2veqy7Txd2IR7ChO2aMUZD9jJeRtQynNpYtVz4EJjEHT?=
 =?us-ascii?Q?bAXUQS6OzzUGrkBV5Mx0IHBXMzCa/lOM1ikpPQHNnAHLc7EDv3Xy9uRe4//h?=
 =?us-ascii?Q?0eyQo1af7JcjSebyoRvgecAmYZE3okOMCLhWigvx1+Dsm03bScNP7k91eFty?=
 =?us-ascii?Q?NHZyP0nb6rjoxY1nnbuhYoLZJBiJLqBoMB72fTZrO5kR+/sa+TKZ9EoDqXCO?=
 =?us-ascii?Q?s0i2utSLqHHk/Ono+eUmkNsP+yPRBq9g/56ybuQ37Ia55V+mymMc/OWL04DD?=
 =?us-ascii?Q?aiEuwDFOrBHn9uOMkLX7y675BHGg2LjrZMh97A1S0h6o6c6tiCI09IIMNshB?=
 =?us-ascii?Q?EwQPn4d5h3cQqhcDjkZGlsudkusbj372nEdqav7QS6ZSok5G9ixpouCEy35u?=
 =?us-ascii?Q?/kKOFQlb7fe1nUFh2hj+b7vGTW9kYdjFciiL0/d0KyN+McVaIfuEgk8f75Rk?=
 =?us-ascii?Q?hehldOV5fkrj43ppyhIm7QS5qd92L8zkUEuOk55oMfmx/+A1RVQjal66jSuC?=
 =?us-ascii?Q?K6KGa950FRBRNcHuHrSZ29NMojOwKQFZ2Ve3XSaVs8CmJDDTogvJIvIs04Ha?=
 =?us-ascii?Q?2gCuDjVc0TcwblYYkgzQOgLO5d80Pq+AJAi7U+U6RLlVq/0AoEGhrrX7DCre?=
 =?us-ascii?Q?7jgFUsoyS+YmDeaN6ZlXpaSjBESCkmVYqojJ4jCPJRumfAK2YdMoorBaeOZm?=
 =?us-ascii?Q?U5eSHFulHS8EFFsq83tRh+d2LIDaXuTWyRSUVbyrXGsxbjdObOu+3iJ2lKpo?=
 =?us-ascii?Q?P9i6fqLoQpU6aQoms1Oejepk6Aws2yshDOW+w7pc6R9Iqe7x4whTTSazlue5?=
 =?us-ascii?Q?PnZcmHYS7c5FPkqhm1/6QtB1DOLfJcx8c3ZeTS/d+MC/ARAgh7vIHvJ3AroB?=
 =?us-ascii?Q?9Obv2D/iOgUVIOvDjqbhW+yev7gXv7tVaJiKarIenvl/KK1C++tAKLRkSmgR?=
 =?us-ascii?Q?6piuqw1k4QL9O8V0EXKCKotAUGgxxc/ZmtPB9jXJoJlX9KphAzDVeMjAHTvY?=
 =?us-ascii?Q?l8ZYk6ezKK1xmX2w7hcadji839Xk6EyteoV+lh1gXOVwzZlisX1hvCZd8rt+?=
 =?us-ascii?Q?EvkvVvG6dNNMixawnYaQc+EMdmoNsxwaLRYlgSjpb8zR0sAwXrbd824u/cCz?=
 =?us-ascii?Q?GVHnJGTGDD9LztFOGOgU24aMEddaL37Jo/KIehOXbvkzOzLzlmFfULeZ9o7l?=
 =?us-ascii?Q?EK6WCUeIwFFlYXdUQI34HFPKtW1xYxa3YDpXThbDA0L1d2ZiTvkP+sgESsVC?=
 =?us-ascii?Q?2ypma5tDpQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d37530f3-c491-4f74-137f-08de6241c2b9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 09:59:31.7252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GL8eu5IfxF/0h4XcKD7H1fufvzx/zBatFaDBTuEEYFGDreYX6s3/+W1f4/mMxMWlsBPijLpmJdw0hKztdKdj5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8936
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51977-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,oss.nxp.com];
	FREEMAIL_CC(0.00)[ndufresne.ca,kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org]
X-Rspamd-Queue-Id: 9BC56CA600
X-Rspamd-Action: no action

From: Ming Qian <ming.qian@oss.nxp.com>

Support the upgraded JPEG encoder v1 found on i.MX952 SoC.

V1 hardware uses enhanced descriptors with mode, quality, and
threshold fields, configured in a single phase via setup_desc
callback.
V0 hardware continues using the existing two-phase manual configuration.

---
Change logs
v3
- Split the changes into separate patches

v2
- Improve commit message
- Use GENMASK_U32
- make mxc_jpeg_get_version() static
- Check version in probe()
- Remove noise that update copyright years


Ming Qian (3):
  media: imx-jpeg: Simplify descriptor initialization with memset
  media: mxc-jpeg: Add encoder ops layer for hardware abstraction
  media: mxc-jpeg: Add support for encoder v1 descriptor configuration

 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |   1 +
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 104 +++++++++++++++---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  22 ++++
 3 files changed, 113 insertions(+), 14 deletions(-)


base-commit: c824345288d11e269ce41b36c105715bc2286050
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.52.0


