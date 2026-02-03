Return-Path: <linux-media+bounces-52082-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNfbOvKwgWn+IgMAu9opvQ
	(envelope-from <linux-media+bounces-52082-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 09:25:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A14BD6312
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 09:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04C6F3050EFE
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 08:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9A8395D99;
	Tue,  3 Feb 2026 08:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LmFRAAdQ"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013051.outbound.protection.outlook.com [40.107.162.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AE2395265;
	Tue,  3 Feb 2026 08:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770107101; cv=fail; b=CHtZ0Zg2nnZDlgRe7khdxzphbFZ4Vq7gc5mSjuf7HogsxUx4JzEAgeR4c//ma3jflR6W0ZXpLZoIFmGtgyGBQoGcox1UD3BKzEWmplnK6dgfRpEhqsqiOluceZSpuxMeSt8Sif9rnX73W+NK0a0I8XT22ryOQRR8Y0rtVfzjcFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770107101; c=relaxed/simple;
	bh=/0S/2nvdnK7nN0IyChANYN6QWqEypzjIrALO0eMgIbk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UG9y88OKFIroopClh1XfkmbcDioTLutkb2+VduPbOKQEryqz5HbmISoRGkJlozKkZ80SdqHNaGlVPU++MxN0cBJ5gdbGmpI3gTqnuWuTViXQfRk0yHAK/c1EVjWG1Sz/mfNgEUBaGxSY6P9obyjL1ewq8GZI9qiOOAILoL/X4dA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LmFRAAdQ; arc=fail smtp.client-ip=40.107.162.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4TDQr5wwDSSQiNqCJcQBUHhruYeX/f2iPSmGCdZK2+4zFdG9SdzZ7yPoDDFl7aRS7gDEAlui2GH/N2hb+05C6NacVDxa8CA/Ex3NV2X7B1n426j9Dbnbk2lkafTjYyeUnIR/ocnt2iru6VdNFv/LKHv1WZJrRMU9/WK8yJzqd3v2yrYs6rk/7AuMvuT1h2MZlAe1HElZLUNidM/5SPd/jcgErYO+gVoM6LxWMEDca54GV4nGtHLN6FKGpedR2ZxMlllfwJiSnJ23w+8lG+1i1A+MUuZaEFu3gXwSbkbLcJBEIjK7NntA/fTlJuKpoYPdlC+1vzU6WCXAB5L1kX8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12XRfW4rLWKTg6hTiwwL5IvulkL0lvTR3u18lKWr4tw=;
 b=PwV9C/krcSPR/a9I+K2e+0mpKmP7q1DonH8T8Gj8gpUc2rhsoPH7eZ436G8DBI3TL9nOXOXg+FYTqIHcF4XkmJ8tNRI/qX2BHbkpjhvfD9ARxtEitRBQgnnusMFd615cUtTu1oTAfx7+pCNWvi/V4hAP8y2cars47NVQBIuWjgZgBdV3M2yR2UDLiXs/EdOy/euw3+yz1KSrGfzzXoED/5nyaijehQa2kjYUFDLdaPOPGsVOW/9QM9NeJUrVLD2JnZbk5BFtqSo/xcEfolhrQmhdPbZjWonYb00Ya+ZPZWHe1zQq6oYF7xvIE++Xhwrg+nr2era+tnQ1Sb3viaTNdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12XRfW4rLWKTg6hTiwwL5IvulkL0lvTR3u18lKWr4tw=;
 b=LmFRAAdQ5RTagfn+5ESltYts4djeCLKWQQttrqw7+asKgp0A8oY9uljFce96J14/VgO5aJTy3iiMKEN47izcvvlr6SHO9DDs4/KX7Zt8tqIbSm2e44FdBl4uh2WioLwymqGZNEGLMj+zf2cI284mLzdNroS0zk4Wt2eQpSBw9h87UU3nrwESFhhRVvIoaMsUrHilUGosgvKgRPeA+SXFJ47QwVh/ERht6Tp9m2SeDrY1SUUakBT8h7UyFKQfigp8mnaFgxpQMCFW6R9LTUApu9Y/9jhZ0VwZEjsJ8Uzy/Sa1ReueK/VtBki8o5JXmWhBvdmIYLuk5m//Qq59qbA3GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DU6PR04MB11182.eurprd04.prod.outlook.com (2603:10a6:10:5c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 3 Feb
 2026 08:24:52 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 08:24:52 +0000
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
Subject: [PATCH v4 0/4] media: imx-jpeg: Add v1 hardware encoder support for i.MX952
Date: Tue,  3 Feb 2026 16:23:37 +0800
Message-ID: <20260203082349.1082-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0112.apcprd02.prod.outlook.com
 (2603:1096:4:92::28) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DU6PR04MB11182:EE_
X-MS-Office365-Filtering-Correlation-Id: 999188e7-1bdc-4d82-adce-08de62fdb445
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C+4U+1zUnIiuuzrjX5o9rUW52kNf82pTsPnovQyJd5nyCvPkWuFN9fALWJR0?=
 =?us-ascii?Q?BRAv/qBKVDCNGu47pUbDCJA6NdZcFU+A1Vixm0AzfEsq7l8JNh4lIFFh6TNH?=
 =?us-ascii?Q?m/9jrePLVUBb5AmHyNnI6RaKkaa4e0RpNF6/LwfZWsZQXygYcWm3eA9xVPLZ?=
 =?us-ascii?Q?WoGbL7AKS/EA4lQ9Qn8ZcuZ2YOaajX28tFnxFcI5TBPZfB5sG40XUTMh4OLa?=
 =?us-ascii?Q?InzozBzPOEYRCm/7K6GLS9kY6lyZumAVB86fhCJkn0Yj4QyqAUoeZX/M+DFm?=
 =?us-ascii?Q?x12lPAjEvZuiECWKxG2mIg0JtT0QEKZM33mzj6pAvxcXuVaEac71RLQm0zlA?=
 =?us-ascii?Q?IT+pB/xAW0BAs5a8FqBKlarM5b9zd95yfGxyuwCQlzWYRowMB2iSN7LQVEHG?=
 =?us-ascii?Q?vK9tyQHA4v47SqLPlU/MFrZdaIEP3cDV6NYFHnPmAJ/oTH2u0jIoJRroRyLp?=
 =?us-ascii?Q?ALSR0CV++9ZtDs+NHXjhKEknJWfwwDr1j/Ee4pCvYVDYttAiA+OxRCBrlxXe?=
 =?us-ascii?Q?+9853Sjnnyd+fDfoJRUNHMFME08NychOaTRaxiBI1Kew3kLZSw5z7wQOnBb+?=
 =?us-ascii?Q?kjD1dcqC2xzyjYm4gEL37rsa1btU9WkDW6URHBUbJNh4TOArM7/Cn8NhIhnC?=
 =?us-ascii?Q?PAvHrdcntABqGLw2ENT6hWYBWMWhFgB9Cz8QKDgfKihFEX3dwCs1AbnxlW+q?=
 =?us-ascii?Q?HYTWr43bNtHwpjOwW0Wkcif4U55VA8+S3wgvKV640NYGeb2ejsdc5j+dkgnX?=
 =?us-ascii?Q?L1GwGYQWbesWViikjNxEf3yzZiyt3o3ZpyYORj3AdMRs0FkBQK4viFaiuQ0z?=
 =?us-ascii?Q?khjSAnb66Rn5H0ilDs4BwmOXRri5dLH1AxT2tskBjOlmz0IYUej2ilKdC05S?=
 =?us-ascii?Q?3KVAJJt6eWB9cNVxd7/USs+MRHTRWeEZW39DCJdtKniuanoXSVoQPCw/6ErP?=
 =?us-ascii?Q?IKzPh8IAjBytabUryymLxC53XfXufKE5utfQUJZHW77KoPiklAjkrJewQiKy?=
 =?us-ascii?Q?ceR6bNpZTW4K6hIN9rOwEWa3Btv806Dp0YpbXcG5boLmdj6A099sAsqFGKpE?=
 =?us-ascii?Q?JZ7Ltm4w2LhxFp6Hi9C65hLDyo9e+Aaw6mBg1pCX5FCUD7E13VSLyMdTocwA?=
 =?us-ascii?Q?/Hu9xhuOZ+0wfl+L6lsDncLwIQ1T1NSsI4EbzUL11Qr1ad9fJFCFuoSU1AGe?=
 =?us-ascii?Q?pMfLGT6t1Tn6eLnmrjYUL8mSKd2QmJmOfxrcuuZOR9X/00FB0ArNbMRPjlLq?=
 =?us-ascii?Q?dLCLO09UBL2DeWnFW4Mn/Lx7fwTufxIWvWPNZK4WJJbsX0enRkSYCQHZpIpp?=
 =?us-ascii?Q?Uwrolik+H5C53O/G/icCQPdvH33ConWhCdDJPVygsuMpDFLEqZlmV+cJR9at?=
 =?us-ascii?Q?5mE60Ye7BybVdD2rka4+rf4hOWRv8e35dM06FXLfHHFgG7FXA/kJ4rZY+iB3?=
 =?us-ascii?Q?55AfA238SIFLybnzfpPM095x68n2ziMjMWYIiYUSh6PvC6wARb9xOaIGUlY0?=
 =?us-ascii?Q?9Tda3a5QWoopt6qRZEbifrVe9hQElJ48JYA2007DZ6EmCbS/s/WyWQPkY10M?=
 =?us-ascii?Q?B8J+3yM1aMSApS9DjiZy9ssErUijTLVvte5zddCfvzuW3Ny03EU96deJVjvG?=
 =?us-ascii?Q?jfAWgDHilAq+h1qa3ptMgEg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xzTprgpFmzpCChIh3ZcBENuUN2E80ZJdi8TTo78ZP1KwKJe1lgwaae+YnsQY?=
 =?us-ascii?Q?w0BvMgBdaxspW7ptZUUEIW6bMtDqUKc4WCNgZ5FxbBlcfnBw+cXK0G2+DrnC?=
 =?us-ascii?Q?tWgmgCihlLhFFukZrkWcJI4EiEK0xNwvG83P8AgAktNwr5sj2hotA+PU+OHg?=
 =?us-ascii?Q?Vnamni8sBjmmsQWk7LioC49xjSPdFFR2b+2mwHCiRPbyapDVQr/sq6DNtfg6?=
 =?us-ascii?Q?Q8WHI+Qx+3Hit2aigQcjk/RcgIMeru/cPUQi27EFt0exqAq7KymNTdoYsiqN?=
 =?us-ascii?Q?LhMhR59dikGO1SPE8n/zS2KTaKvvRHJm1EX2ahsMqHNOV18wvLWvRtLRJQHx?=
 =?us-ascii?Q?NBElBmZS0jBZJeow7lbaG2zvoOH7iN2Dwfg1CDfnGaYmeKgP4KgiUbnROV11?=
 =?us-ascii?Q?rGGpalUHFq2wyUAy9TBf8moLaJgYqabFvh5Vz+3JyzvaBqlGo/mK345fThgz?=
 =?us-ascii?Q?44T8O7hdUONuoftNhG1mLp1rO0PLPeAdPjd0zTjTcphm7CnSM6pt9HiPj5Tx?=
 =?us-ascii?Q?9zXZYhB3Ekn3GPpkWQS7V62J6mQkKBMyxvKi0javPq7MDwGAw7iEx0sIHOy/?=
 =?us-ascii?Q?XdxvLQh5nvwqTvVsZEjwYP1rPwPhLXq/Yi0e/lsRU6j6iNgpDw4JqB7QTvV1?=
 =?us-ascii?Q?/PRHQu/R3DQzwaSPieUbbLGETZlVO0xcs04tJHgsYTRN31mniDpmFoDkhTM+?=
 =?us-ascii?Q?XlhZ/zQkjSvkuwfE+0K4bcUMYwmyWPyfLw8bENPDQqyZ5W1Rh+dNnGV6Ul6Y?=
 =?us-ascii?Q?M+WoQ/lnmTJyJAxBBHu4KRRXEVJyjgo8ErtE+NXqVd0gCYEHEiqCRwz3cvg2?=
 =?us-ascii?Q?oYH3A3n8m79SKgyR6v+CK9r0IIaCSfYn9LpTTF5M32BmQdWhFwSBfRXPyRRM?=
 =?us-ascii?Q?teOWgT/loe8tlvozzQJNVI1pRzOgCShnk9qyu99gpc66LRC+NwwpQ+wpfZfe?=
 =?us-ascii?Q?yPjgk9ST6QJxZW2jHL5esF15jKAgo6YUr7vO1KX6bDhRTyIZ/Kp5sjKee4RL?=
 =?us-ascii?Q?D28pO/E7SbMB8O8U+esOFsO88nKej4jMiaWWLywiUXpazsd+8060k8twwLZi?=
 =?us-ascii?Q?n4NlxiMfxMzBP08CHW6lKBDPfS0Qy1l4jl35zC4UJVBTEM4euUjTTpPHRXwF?=
 =?us-ascii?Q?1rU2bMtgpMr7m2zWlj09XauzfkHgSSZMxODdSfZVh9DNYxq6gJIIe4V6QHfX?=
 =?us-ascii?Q?MjS4HZnnAawRLE7xMAGq2zhwJeF1SuKUDGOfcgpwxtZai23s2izrNqJ0y8of?=
 =?us-ascii?Q?jG7/v35miOS0m3FR4tTehOoF8WHOqZEpfYmZgsYNHQN3oiR1vwAuMJ46lBKU?=
 =?us-ascii?Q?mOzy/k0X7jV+5WnLBK0dDrtmK6KHzB4um4Tt4VTOQeDk1LNCa+WKcC4wIU36?=
 =?us-ascii?Q?fFNGay9ItL3jbMwrQc0jXRMyTm45t7FnYgCYN3O1swP+IiRF+xOnIFMSHd5X?=
 =?us-ascii?Q?4XWS/SqEtKcGaoPWy33a3UrbbhoVc9W5uJijYDjpjta64npei04WZLIE9VMO?=
 =?us-ascii?Q?qWU5xva0MOH6RNhPx5J2CkahJ1z+PewDwmp0GV7vmnqdI8s0hOWyS5mNUaK7?=
 =?us-ascii?Q?0USjfSIYNioT4pR6n5Gn2dK5W8aQsQY1zddNPuB8BPnQC/hQlyy3PURW2iM0?=
 =?us-ascii?Q?uT/c7WRJl5j2MWvcfyd+9LzIe0bSFI4TVAKyHGHlZAw7B1flrcMZJfOKcxTd?=
 =?us-ascii?Q?0KNReHvmxAWOdAiMbOs39EKjxiOVEn/HkZHA9BFrGxfZV/NUTqiW48puqPmr?=
 =?us-ascii?Q?FIN/fwQ77Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 999188e7-1bdc-4d82-adce-08de62fdb445
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 08:24:52.7447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmSMSN1+ARuy7zkbHu8GOpJJCY4u2nuK7eOhpiVS762Y6JBnIAgYy6vAZA9bQpV5nRi4/lMcWcXu65LGFlxGDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11182
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ndufresne.ca,kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-52082-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,oss.nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6A14BD6312
X-Rspamd-Action: no action

From: Ming Qian <ming.qian@oss.nxp.com>

Support the upgraded JPEG encoder v1 found on i.MX952 SoC.

V1 hardware uses enhanced descriptors with mode, quality, and
threshold fields, configured in a single phase via setup_desc
callback.
V0 hardware continues using the existing two-phase manual configuration.

---
Change logs
v4
- Use devm_pm_runtime_enable() helper
- Correct the typo in the title

v3
- Split the changes into separate patches

v2
- Improve commit message
- Use GENMASK_U32
- make mxc_jpeg_get_version() static
- Check version in probe()
- Remove noise that update copyright years

Ming Qian (4):
  media: imx-jpeg: Simplify descriptor initialization with memset
  media: imx-jpeg: Use devm_pm_runtime_enable() helper
  media: imx-jpeg: Add encoder ops layer for hardware abstraction
  media: imx-jpeg: Add support for encoder v1 descriptor configuration

 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |   1 +
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 117 +++++++++++++++---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  22 ++++
 3 files changed, 123 insertions(+), 17 deletions(-)


base-commit: c824345288d11e269ce41b36c105715bc2286050
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.52.0


