Return-Path: <linux-media+bounces-51786-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIOFCn+Je2mlFQIAu9opvQ
	(envelope-from <linux-media+bounces-51786-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 17:23:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 927A8B21F7
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 17:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7B3A301F780
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 16:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590C4341046;
	Thu, 29 Jan 2026 16:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UgmJpP4k"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DEC33985A;
	Thu, 29 Jan 2026 16:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769703786; cv=fail; b=fIVU/kebdDYG2GUly4IGeSzgunbN+u1vPMaqu8aAYGJzIP6PUjr4VCJgcnkN+OfiuCiUysrs8kFklKPGqKBPSpXDfNY6WLpNZ5Qvx2I4YVUZomHbUPLYhZqmCTAeQNP23vmkA4OtMk8Xo/IGQniP/7xvn64ZWKqp3ONQhfk8hoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769703786; c=relaxed/simple;
	bh=4MhXby6QyYgnCM9P9TW27oBaWiajZnsI8wZgB4KGM5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Yl1ViP2iNEsje+EA0/6HSemqGe1Z9UAtaSySjgA3aiDHn4Oer3m8s9Btn+YUNaa3kr9DXY7LKwFFaBlc/Unnd83lDIwp9pDCKhJoEKnb3Bm9YBlk+KrYnir1jHwUvCZvHbHqFENtAgO4UhbXeZ7jvQcdIHYr7Ds6nuMzDdf4XqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UgmJpP4k; arc=fail smtp.client-ip=40.107.130.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iC0GKRCI8wrcnN1+1WrH5ZPGLVOvenqrweqoabi6vGS3adATVeKLDnCBEIvqGFFc/jDRsH6l7uRAIx6Ju3SeQkMsnrlZCr60T+X9acaJazelFeSJqrHXkRRhaehdkjX6YAgJ23D9NzVCuC55qlJb97Ces4UcBfqLuFAtynKjMI8se8wSHbotiTjSkSh+mIfPgmC0+Oq50/HOaIIhAejrYuIdlsisUXYDzizLYLOERiru4MiEs/p48J+OrCNCLHCIO1kf1UsNSerHsA4xXqS+AuyoGp+2ny3BI4tFtshzCMreTjiM2mhNGz1C1NK5etK1zq+BAw6A+M80Trshc8A1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wT+N5KYtNQTUalZvqaWpXD0UIwQ9cQbWIhbxDPBUNs0=;
 b=YrETx8LB3NtGOgOAwVHt7CS/OYzXQ4n3akFQAZTu/dcuRr0UE2S36HjXzLmpxLF5FzOfOjXtLehgGeMj2oVrnzwN4+nIzzWWX6R5dNdihWslJ+MbRu7kn5xqhTYbo5/2k1MHJwEajP77vLW9ggBNbpseXq3GrR2Ss2Boy85b7nLFrOoJB0ko2/GEn/xIERJOHc6oQXJWstN2mtLQ4OJUjVM03bYUroBV0AeVURzNcUcF4iJSmI1SApPfGYqsEuEM/RC2o2XBbveuadQBxGHNaAWciOLW+isitarHHkgPXs5p4/PEePlm09yJuxKxIhklnY9rOIfVM3OOTi5O4kcJ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wT+N5KYtNQTUalZvqaWpXD0UIwQ9cQbWIhbxDPBUNs0=;
 b=UgmJpP4k+UqnxM3vqOCWZc7bmtdU0Moml+LObvuT2blMCcSJ84ozDcYUZK9iktKMNUgZ1XWRD+xI/dYxqbVFDB+zS2HfJjF5MD0U2G60k3XYWhfBFZI+KmhFaYtYJWu5KD3MaxPBLfJhOpF+MVWgmhU3qHhgY/wP18dnuEHGOOYSvsrbzMtHRsrWoDb0XKDnCnaRbScBQlU63IgW3xb6BrgKhOWYBqiSQzpfHb/cH1+QV14cIRJqV3xaGoc6Op0v+YCW8WttN3xQxpl4mtgt5tT6GMrW5Ysybj7YH1xuYUMhsvbGWNeNrroPUCPwHH7/LbfE+yi2JcynOkR0hA0gxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB11048.eurprd04.prod.outlook.com (2603:10a6:800:25d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 16:22:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Thu, 29 Jan 2026
 16:22:55 +0000
Date: Thu, 29 Jan 2026 11:22:42 -0500
From: Frank Li <Frank.li@nxp.com>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, nicolas@ndufresne.ca,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
	linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: imx-jpeg: Add encoder V1 support for i.MX952
Message-ID: <aXuJUhFEmhjBbulb@lizhi-Precision-Tower-5810>
References: <20260127073702.1782-1-ming.qian@oss.nxp.com>
 <aXp2CHEX+YCHogjW@lizhi-Precision-Tower-5810>
 <69a3d328-748c-445d-bcbd-823b5b314543@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69a3d328-748c-445d-bcbd-823b5b314543@oss.nxp.com>
X-ClientProxiedBy: BYAPR02CA0066.namprd02.prod.outlook.com
 (2603:10b6:a03:54::43) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB11048:EE_
X-MS-Office365-Filtering-Correlation-Id: 58cf9f5c-d886-413b-35c1-08de5f52a862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sFB0b/yfwo7L3mIdxb2fQ54pNYBIV9VXdby479EQ9FiTFt8qRBJJdIbQzlbQ?=
 =?us-ascii?Q?qWnLAoP/2CWr7oSIiRPvYlkV/lwJ5Uq++OCmfEV7ZSz7Out/1B4NwUyJxLax?=
 =?us-ascii?Q?Zdck8XGLiSrTv2sdjpvo8lr/HsOTc5WpTvDbHB+GxjiVj/ul8xMezaWmGkU5?=
 =?us-ascii?Q?FfrSlp2FW0Lq3dOh1AXebmS/mv1uyMT08i1czxYJ4SWtk1ODUrAsrQWGCgaB?=
 =?us-ascii?Q?eWw6jisyMueEspN4mi0Ipj/3S6tmHijbMC9mvRsGg3s+Kn/zdS4HRxt/891I?=
 =?us-ascii?Q?K0DrUqkQRifG1AaBg9vjcZkd/cd8wB59V4KpyWTtxm72nwDxUXdWps81WRFc?=
 =?us-ascii?Q?kRLb8vjkCWQradaMxnL/2z8l20gaA4u+WbXJEQ/T9S32zfS8yJfHCzOwCy/Y?=
 =?us-ascii?Q?00r5nhAjQMiKdA2cSzxYK8aMfr0w3dq5XxNa4b/iw6VDMoiMxy/GcOT2naiR?=
 =?us-ascii?Q?jGPqKSoS0tFlMNS/i7vECWJuSrsAVElBtxE56ZysMccWJAzUmo08PYxzXYgC?=
 =?us-ascii?Q?QIjd0fbq+XFLhpgCMQaKtmUueCgbe0JSbCRe5t2WW3MfLCeJJvQLSwzXCScW?=
 =?us-ascii?Q?vEmBoNowR59uvfflCn/mYkSJ+PnJ+nqY5Q0vqPVSDrNRkwqjjQK0LLgqua14?=
 =?us-ascii?Q?v+b8kALTWXdu3IHaoUHi3Dt3ZC7b/Cb3Nd2EvDlgvtfiv4INie0xz1YsXy48?=
 =?us-ascii?Q?SYO7BNO7dXjX4aqvLUYzWetOUmrTneMwWKicQ5ln40reK9HxJnCrb9645HhP?=
 =?us-ascii?Q?t4XybbnEksbHscpb2PSzoL+41vMbnolE954oHTsPDTJUT7iEIHqzkoWfmdnX?=
 =?us-ascii?Q?Wf7NwJVDeQxHW88aQCNzTalw2HgskEWs5KzQeokQUAABxPyh7CuUo7kgc231?=
 =?us-ascii?Q?3/Kbx30M9GRzvqnL4vkzXP7C/sf7lxx9whtkxl1aKdkV3cZ69c9H+QiFxphV?=
 =?us-ascii?Q?NQze8DD46brbfDNXuGhh0npNQ5aOiKDLBMNVVsqJ0blbB5n1bf9uvq6TVNa/?=
 =?us-ascii?Q?DvWzO9qfAHPRMB9RuyWOOxY6IVBtYjCV4mhPgw+3aZfcJF/cmSb78zH8OC0U?=
 =?us-ascii?Q?CQ+PfGO9J32s6KZXt0kKWwpij8llVa50j/lKDHRxOvrwNXPMXzckvP2hgcbX?=
 =?us-ascii?Q?7p1FswBNiPIDrL/ZY09AD0cbhkuwXUnIWoA9k8Kf8WteyD9wQ3PFLcwXMOCA?=
 =?us-ascii?Q?RtmPe5WE1xkrZphBfV7uWV4yNkP8wHHXVxwJEqsPvehXChUyzqctcjlsL6lp?=
 =?us-ascii?Q?SGQjSVhtMeqkdWHfnaDao9yy/8WT+nG0/ETlARZsmRCNRLWypKkJ2gE2Rhmh?=
 =?us-ascii?Q?+KJjSJIBrdSPD+TMBciRGVX/bvKNgpAXu75RGmpBwxxF3GSFtkeFMl2vHlsZ?=
 =?us-ascii?Q?ll2SPoMJdDZVjjF/H8GJ/FnVh3AEPVKpmrVGSq5XNBN3WW3yHJYpqP/Y2FQm?=
 =?us-ascii?Q?nrYVR7NwNQNxxoq7Ooa3IASTUUpRVAVUWX69wTzo+nedb9H4aHlbJdcwUjfO?=
 =?us-ascii?Q?U6b7VprZvDbGHYpAW7MRVCpUzpm3tm0PLQp3IKHyEJKJGhe/lnfK1FdqEEi1?=
 =?us-ascii?Q?n0Jo7ea5de2oUK/SN+fL5POA+zk2IjDGyWbd6FJWaTLn8zlW1HwI8wGu8omD?=
 =?us-ascii?Q?Cve+uYNc1zIZ3jBTI7FazFQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cmNaes4hBGG74J8cFBotGL1Ok1aNHVd6x32kpb0EgngeWPUm9GdvhqZb4Qsh?=
 =?us-ascii?Q?5VVMNTGdnh+RrUYKMzGOdDXJNCq8PicdiWD0lSjnYzVXC8e8IwBbdlyUvdRo?=
 =?us-ascii?Q?fV8Gwjvx/W7vGzt6+ELXNIXuSOea35SNx8uvTlg6EY3AswohoJnsWkWNoZRY?=
 =?us-ascii?Q?xx5Z/Wj2mY77LoVhqOvLFs1fB8t9Who0TcNTOXedkdSkrOkVkEZKKDwgNgQI?=
 =?us-ascii?Q?3eCaDR9lIh1yxAnMst6N26zwIoLDHf9s2nq6A09BMnJXo5KjJc/dLwvxJ+FI?=
 =?us-ascii?Q?YnnkXF449X4T3rdPvVd2bpbXKtk/AT8GK7e6sMZtJblObaY1AM2RphYvgyVX?=
 =?us-ascii?Q?AN0OgqnzoiZ3roPqmNZfM9/a+T6yUeQ+KD15mHsQjbZSV3xhqSOYAiTnHE8l?=
 =?us-ascii?Q?DglY/+esiD95UEqHBAjbIdIEJ36RnMP+4UMTBHTFp6zvrwPQ3iOrLFd3c85s?=
 =?us-ascii?Q?u6lW03xbpZAic63u4vhmTAhjXKa4Z22nM1SY7LsctHGgdstUQoWNZ1DSSXsZ?=
 =?us-ascii?Q?mtUg6OQjqUCquH0/lezhKh8ZIsRPZJxVofpib7v5n4cD1eaeej5A2QF06Q+f?=
 =?us-ascii?Q?MVBl2RxddDIfBmmWSTIt7tz0MQSszOMg+hc2O10ihgMtYf5WH5xpXjZ7GRX4?=
 =?us-ascii?Q?iUBYSAnbZbnQFZdcRoC3dKl5Coq/KzVX4dyaLvxZkh6sChma2h1GtD+tuASY?=
 =?us-ascii?Q?APlG+Lv50jCse11qJEE6vIJbpw1ckMFCLxxCzarX8lK3BklLeZ+eUpCHprBC?=
 =?us-ascii?Q?f4oUoVfwfzQOJclMcA1Q7uG4NiHJTrjXHc4FQzbbcmEsL9HepKWtlBwhK3zC?=
 =?us-ascii?Q?lNm+llnynYTx7xwhbGRAZ6j7yVnhVOt4Lgy4kit6T7CmaHchpaRRIjqeoLa9?=
 =?us-ascii?Q?FRNwU2UJ4BkaV9v3VbfQleym7M75+yqYachibIwALaw+PZiurNwcurqeqnL6?=
 =?us-ascii?Q?zUtvsyvWou1fA/54/xDNV82C7ghP0VmGVaF+Sgo+r2MwMHJ3ljtxNmm2eARr?=
 =?us-ascii?Q?rNYxpLPGamI+4f3OU/b0UH4N5wl+SxvCI9NKaZOxBY0OY5+axrEQ9yTDLUg2?=
 =?us-ascii?Q?n/26AzXI+l345Dt9k/cTAg2EZfe34sjn1CRgw/q+Kl8FK/2eq6zLoBF3soxc?=
 =?us-ascii?Q?Xr0xsM+TNKYQniHimyGZah26i1P1eO+yHK27Ee5XK3LfshSVOtlNzBPFywWD?=
 =?us-ascii?Q?1o4F+4vs8As3FYt6GeaPU/T3IyISdqyJ318JD17JyUye+8fRImY8embVYUh8?=
 =?us-ascii?Q?OCrMunLU4p8I6x8NLbHU/1Z6Wc1be/hxr9tHaO8/i1YMomKhASqvShJSFOtF?=
 =?us-ascii?Q?kRnwUTw5lTw7/Fgd4FwIRCUpbRtbO+08kdRlNXOBhDw1wLlkBRX16gkRnxho?=
 =?us-ascii?Q?a6KbY3vttiEXoSNkbFVWuFPqm4HC3eKx00SLNzvMpzdG8+P1ur/EFjLo2IhY?=
 =?us-ascii?Q?09iadkO5ljLTdkYapU1anMMVB1FNVubli2L8dBJdae/MGc5oZoERKGszr+Zs?=
 =?us-ascii?Q?dsjhFtygd+UE11A35qowRYPIz0ctZpvNQPmeQpYVPtrR37ZIAVaqGE4WoHJN?=
 =?us-ascii?Q?/JckmM7DfGJP1WX9LGFjtxOhOsNaqrq2Fi1bR1yp4ku6Xz/2OI9UrEO7ITdT?=
 =?us-ascii?Q?/r7nthN9De3B0038q2SdfW+TyM11No/16ZmNelxzqRKN9pwCpO8RzO2QEHGn?=
 =?us-ascii?Q?mD4FgYa8NwyyNL8BqppiGR35SrXE80/Ag48RUg5ycHG8vQgQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58cf9f5c-d886-413b-35c1-08de5f52a862
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:22:55.1474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oGa7G8KHo67Idmcf53UtLikrCekfuVI81C6xo30msKfKOX/UlAoReaJazayDoJq2H/zqbCrF6p8NZIxOLr17cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11048
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51786-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,oss.nxp.com,ndufresne.ca,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: 927A8B21F7
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 09:42:39AM +0800, Ming Qian(OSS) wrote:
>
> Hi Frank,
>
> On 1/29/2026 4:48 AM, Frank Li wrote:
> > On Tue, Jan 27, 2026 at 03:37:00PM +0800, ming.qian@oss.nxp.com wrote:
> > > From: Ming Qian <ming.qian@oss.nxp.com>
> > >
> > > The i.MX952 SoC features an upgraded JPEG encoder (version 1) with
> > > enhanced descriptor-based configuration capabilities.
> > >
> > > The hardware version can be determined by reading the
> > > version register.
> > >
> > > The v1 encoder uses an expanded descriptor format that allows
> > > configuring all encoding parameters, including JPEG quality,
> > > directly in the descriptor. This eliminates the manual
> > > configuration phase required by v0 and reduces the interrupt
> > > count from two to one per frame.
> > >
> > > V0 encoding flow:
> > >    1. Write quality to registers -> trigger config interrupt
> > >    2. Start encoding -> trigger completion interrupt
> > >
> > > V1 encoding flow:
> > >    1. Configure descriptor with all parameters including quality
> > >    2. Start encoding -> trigger completion interrupt
> >
...
> > > +	/* Manual configuration (v0 hardware) - two-phase process */
> > > +	void (*enter_config_mode)(struct mxc_jpeg_ctx *ctx);
> > > +	void (*exit_config_mode)(struct mxc_jpeg_ctx *ctx);
> > > +
> > > +	/* Descriptor-based configuration (v1 hardware) - single-phase */
> > > +	void (*setup_desc)(struct mxc_jpeg_ctx *ctx);
> >
> > You use callback, suppose callback name should be the same for v0 and v1.
> >
> > for example:
> >
> > 	void (*setup_config)()
> > 	void (*clean_config)()
> >
> > v0	enter_config_mode() -> .setup_config
> > 	exit_config_mode() -> .clean_config
> >
> > v1
> > 	setup_desc -> .setup_config
> > 	NULL -> .clean_config.
> >
> > Frank
> >
>
> However, the flow for calling the callback in v0 and v1 are different.
> If use the same callback name, then additional checks will be required
> during the call.
> Therefore, I prefer to use different names to handle the different flow.

Okay, you use hidden null pointer check.  Generanlly, if no reuse for
callback, simple direct call to function.

But it is not big deal.  This ways is also okay.

Frank

>
> Regards,
> Ming
>
> > > +};
> > > +
> > >   struct mxc_jpeg_dev {
> > >   	spinlock_t			hw_lock; /* hardware access lock */
> > >   	unsigned int			mode;
> > > @@ -142,6 +163,7 @@ struct mxc_jpeg_dev {
> > >   	struct device			**pd_dev;
> > >   	struct device_link		**pd_link;
> > >   	struct gen_pool			*sram_pool;
> > > +	const struct mxc_jpeg_enc_ops	*enc_cfg_ops;
> > >   };
> > >
> > >   /**
> > >
> > > base-commit: c824345288d11e269ce41b36c105715bc2286050
> > > prerequisite-patch-id: 0000000000000000000000000000000000000000
> > > --
> > > 2.52.0
> > >

