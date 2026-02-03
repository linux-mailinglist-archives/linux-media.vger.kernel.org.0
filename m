Return-Path: <linux-media+bounces-52083-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id f7vbMwGxgWloIwMAu9opvQ
	(envelope-from <linux-media+bounces-52083-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 09:25:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEFED6331
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 09:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEE1830574BF
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 08:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CA2395D8F;
	Tue,  3 Feb 2026 08:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JO1Z/JkM"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013051.outbound.protection.outlook.com [40.107.162.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143D8395D81;
	Tue,  3 Feb 2026 08:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770107104; cv=fail; b=Hj4Qz68E92P5o36zpJhjaSBEpI7+dsV4/EzTVPcSfqSoPXp1d76ijrD4ZnrD+1bpjnyGIhDLduZswKDxZhrjoldBJyu0jfWYpt0ixT/nrWW6ealeoH8q2yXdAfwL6F1z1AwOYtKUys1y/dwmJ2EFWvNNkQqWj13ex9k8f8HNwxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770107104; c=relaxed/simple;
	bh=vXKEhsb5o7x+ogTNwdxPudpah0otEe2+GnwgWO4zLb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JB60TgKCSokPu4xIQnjq2hnUOsUSVVNu+2+86UfmSkHKv8UQZUqrpRNHUw/WAUvrO+ws8GreK3OHulq8fFFWzlFDSrkuze67hgRhhYNxuLq0EfXnsjD75HDCs5ppKR/MA6N4416ejHWiFqqSD8Vsj5rBmbNMmGHK9LRJKPk0y80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JO1Z/JkM; arc=fail smtp.client-ip=40.107.162.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2jz+jorK+gPOCyRiaFimPfNEpWSUBiGhJz50Bx/bwEHuIv7WGyBGPPnVKGyenBlLeIarSthAgraIjHamzfx4L6RIagSxxDQOsbpriZak/hQWn/jBz1hYKeWre67vEXauuEjVlqV3zL3qvLCzpHH3UKXqAnCbjZIjMGerxYWiN3U88703Ag92zmXwQDBLB9swjF3BASrxyfUODqKWRXGU75xz5NkkUn7IvBGhCYuWlKklk5eE/UkSxgApucoGJKTof1eT2Ni8i59/duR8ohorgiTC8r/FE9A9cTgxNg8zL1j+nozMU44HMpyPeiXSxIeVPLkEYqiOE5Oj8Cwvh+PSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMT8+c8e3g0jrispwFZ7vLFyeHIUVMUiOUUqJYnNxx8=;
 b=K0CYCZW7wpLXELYAL9s4gbcMru1Zh06TsJ5xC0yBnsWxqLB5eUHOr96HG0U8NLKKZaeaF4DSy1J38GzVswZNHlpCg3HHv89K8OETflYyVuoU5MYWGcbJhX507fPzJklIGqsIrKr2ZnhIy1ddHsZWPe7eqhCMYxHR8ahkWZhiGM9+EGgCyTUyeqyamgKfJBxR5Vn85J0JTzy5TbEFSgWzjz8NqxzUDVRwQeMHB+OiCQMnSPZJtIJ/9qUteVHq5gxp8KZ+PxMQg6haMjcVTJjRL10l3CWaHpImnKLDq+zC3f8tFvmfDpJxQiimnpEcZERAPjKd5zwxWNg32uvtkq2EhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMT8+c8e3g0jrispwFZ7vLFyeHIUVMUiOUUqJYnNxx8=;
 b=JO1Z/JkMx/pH5BgHQmGtcHcUmuvjww3KxEnwSb2Y3AN2qYsBNHMYPMi3GI1UyihPGaitWXebLBEkTbv9c25hsu1YGczRhE5ZzXiAZEIxNzO1AczCIzRi6RFMM8/pK5/nZS2ZYxDk2d6vkQj89tJTAenY2ukTFoiMGZFFFRFhzjyH7281sKLorv/gcXKsqqMOAfxBPnQEvlI/XIU7H6u5uAmddRMxyQXFmAXv+9GKUfhAczqquR2SdGn/E4VmAyWjWwYTuR2FozKy59xjEr78nEvX1/diuyQxRiq0/NCwn5tICkD0jkNcrvd9jSK9wxsYdrxjXdLkf8uJ4Z2HVPrmeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DU6PR04MB11182.eurprd04.prod.outlook.com (2603:10a6:10:5c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 3 Feb
 2026 08:24:58 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 08:24:58 +0000
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
Subject: [PATCH v4 1/4] media: imx-jpeg: Simplify descriptor initialization with memset
Date: Tue,  3 Feb 2026 16:23:38 +0800
Message-ID: <20260203082349.1082-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20260203082349.1082-1-ming.qian@oss.nxp.com>
References: <20260203082349.1082-1-ming.qian@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f7a1cc03-024b-4439-e32b-08de62fdb7cc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+URPK9WknAWMIoNPEA1t6hT1721ie47+4YXlkL7VS8z0JwZxh1up8Zm7WJm0?=
 =?us-ascii?Q?hy4uH47ZEJ2PAsk9XRzLbfrXWO4wHmTDARTcDZUhWJB0j/7OnCl/MN2OMXth?=
 =?us-ascii?Q?RM6hRxAi1qSE6IY1g7HDgDdS54wQ0SiNwr5F2nS0BDUL7dOcM4NiTFJyvGVY?=
 =?us-ascii?Q?Ax0ITmXkuoObClL604xhA+ijW7QQiQ7V2AzqFhX8Z6VzB4DioZeFniGBD2BK?=
 =?us-ascii?Q?7nHOG7ldzQmeDfzc1HDdLILNAxTcvmfHVLdFMWukHE3K2JQ//HhwR+DrYRa7?=
 =?us-ascii?Q?Cb6mYTosWIaHM9jwdKLmFDlDFwsAJuzdOhOkiRw+IEYxNdur3GK5TTyo7Cv6?=
 =?us-ascii?Q?QCrucFYwFuMGxxSiTtaiG7HrawSyk9UZFjQKNytbEtLy2xiQFfo5qH0xdaby?=
 =?us-ascii?Q?APc+qH/NXOI3GrvRQUnmKvF2eu2AdXThbWlwGt0ghrYGvht+xwwazjRijoNG?=
 =?us-ascii?Q?3HAGJzgxK0WyBKI2lfFrJsne9ot1x4xUxBiDD8JG99BHMmmi+Sgvh2hopVg1?=
 =?us-ascii?Q?jseqyydR/w4ztvAmZRjmdetGuJNw/MJ4enSH6CQHU8ZBdKrQutcUSFl+iUDd?=
 =?us-ascii?Q?oZo9O011l+ZQ9lljycK9dQ3w6oMDFf/l6AQGGHf0XwYJa+IxdWtVlW5yPjkW?=
 =?us-ascii?Q?64mhpQfw0DvinDS6TGVrTzQE6b+qEsRE1BXNcU6eEFwgYUPY+i9Oc15/52Vz?=
 =?us-ascii?Q?sbbMgXhqg96O00pHuMndn4PfuZ9/nVWPwd6K1H4FWVTy1JsQphhcVC7T71Ro?=
 =?us-ascii?Q?nKdmLLWZPg0GtVAS7YT/Fvbvl5fyk7G3dVyJYAUjloBRSG6bDV/K5LM6KSCi?=
 =?us-ascii?Q?luN1g3FVTcW8NMp7WAX93QRrvT7Mv23Q3UV/8Mm0JDXi/lgGplFCMCbAA4uv?=
 =?us-ascii?Q?bBU+Bmh5B3NJ7sLz6KHWgQ/ZPviGZq7Mwi3rgFz3tNpu2W3RG64UNbyYZfpj?=
 =?us-ascii?Q?ZLPpRi0uCaQ5YVLxPGSWhnWEskpnG69zPsN/KyHc+fQPwv/M4xBycf9cfpFT?=
 =?us-ascii?Q?13cT4WRo2vgo0ST5ucJE9ODgRgpi6/aqskiaYEldcWqSvwpMsAQYbH20/+m8?=
 =?us-ascii?Q?/q0GO97Bx0AIfISMjar1rGzL7G1sfDmovphF1i7Vc/vkwWc2oAM1QxD2xK/S?=
 =?us-ascii?Q?gHUMxfsMtVhJ2GlfOlTCFf7Nh0D3mhcLACgXoj3aEoXi7NtQGgeBLmOHgliQ?=
 =?us-ascii?Q?ioA322BJ/V63gEZ5V0s51bSWzuZ4E/6KPFO5Vus7cRm9TxWXF60e2Djwcwoj?=
 =?us-ascii?Q?Ge0dmJipS86m/IqZhSjweqD8q1fFjh7h0MObVjATX/tYCdsH+aPKWaTNCnAH?=
 =?us-ascii?Q?rW91L+E1snAAcHWX5uPlDOwtxkvJG5kL2a8QXNLKEWEhUWcoFzerWtC3eNjf?=
 =?us-ascii?Q?mYIEDyxaN/yAiQxmoado9M2vXD7iLW/X8DdKJcQUgjV7ZyLJoTOiZdqJhgol?=
 =?us-ascii?Q?r8cbqGGNPuxMkR0WkxwptaQ5K0X0AYj/aq+r4G0rBQL5BKtwc4M5FVGefYBk?=
 =?us-ascii?Q?h+kWiaNPe7W/IOSVlAdzPv+Jgx//BPkMMNgt0NB7AopZqfnmGZ/GSpodzdHz?=
 =?us-ascii?Q?Ox1IukKOnQvnFdyx0DfUy7AO5ONcHRek5VlTM5cwBa0hj3I7sH12bSuq9hJR?=
 =?us-ascii?Q?OiWAZjtnF7ymTJoFW990Ok4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QGLTWVIBNQ+LXOIvWybecIMYjW54/e8AWZePyhysUJTD0GmEYWxf8Iw2Y35N?=
 =?us-ascii?Q?XVOI/es4VANlFOICOHgQDoELyb90kFLFDSVm+2cCBSdUuQAty9P9D2IcE6Ys?=
 =?us-ascii?Q?jWvt8fNpeVoYtvAuM9qP946foAnii/gtltSjWkbblgsgfMdjvQG5rgRyeIMH?=
 =?us-ascii?Q?ygbVWDKAkolgErjnIvClSinkS48VbCmjLHr7sooAyEFVwFkBBMkUn4JQHqMI?=
 =?us-ascii?Q?jTvXdBoa/n2i9AS/nun4uTQYJiiIAJvDmbtWGDja6zLoyiEFEZUNwEfSPi46?=
 =?us-ascii?Q?bbotVpBFntOMWlmvl0/EZa6WbxvbkDvaA9pIK2M7Ke1/A1X2XfN9LpAVoETA?=
 =?us-ascii?Q?/VWdmyd3FaeGByFZFA9mJuAZs7pgKlkVyDyGxe8LugI9UUv1VYZSQ3peWsw/?=
 =?us-ascii?Q?YXv758SReeIBqYZ/tVcTk45mm1BucG0kXMYOw8bvcXFDLVY3oOpNBpRh84gk?=
 =?us-ascii?Q?yrXZ0WCQuaUe2AIVyyi9Co6vYnGXJE4lGWI/siyixcLoryMiO47oSmFBBybz?=
 =?us-ascii?Q?2FIGcn8tq1aPCizYUjsEA7JZRfKauTDmKY8CgNxPARlFzgFZ/tjCqoEFIZ0M?=
 =?us-ascii?Q?R2zIxAP0jquRazaNDB+fhcsAWLWxbOCkiLOv1FpDPstxBN3sbfjz5354SVha?=
 =?us-ascii?Q?7ImsyQRv6bpo+9GJtDGPybKCBDamqD7R3VsgBrbXQZqaMlaHGNtB97JyMYtY?=
 =?us-ascii?Q?qKxl5YDePKF5yv0iMjV5o9rODq+TOPewJ5VH5e0Ygmi1o1bf+LtPSTbUaC4k?=
 =?us-ascii?Q?Ul+uVjIihkGi15O/rrelb8eMQALJf71AMqWOOXhrzioVRwKXLj3fklv81swN?=
 =?us-ascii?Q?+f/lWsM6Mu6dsqMfQ3P/o6f9TGWOopVdiUohO+/JtCpMrwLZ+dWleRYEAvmN?=
 =?us-ascii?Q?kzddx0aPbZtSYE7JNnSRY23EtW02hEvG42k44azqjjEJC7NzLQwch6SfRd36?=
 =?us-ascii?Q?NK1kZNz7ekWubxQaHj1Waup4ONlhjyzRW+t23vodqmTmj5W4NJ9AdCCgfJvQ?=
 =?us-ascii?Q?wapAnIbObVgwtCu2U0IKWXOJ8rmkg5HEpl13z8VHxl/oxMeLBqVLDs8UulC8?=
 =?us-ascii?Q?4E9nTlNQ7IESff9zl8pjvRhngEXoTgIJBf9S7URG46redc596tG74eMzQpeO?=
 =?us-ascii?Q?FfHCqSHfm39jPZfYTilqPLU9OywnTgl19udLY6DE1//u+5MD8N+txAq7oUsF?=
 =?us-ascii?Q?3W3vTIwZl/d2Zy1JgDjUqe8a78xchs4Yb57QY89qCeMFrQT8C2dgFYVERjUn?=
 =?us-ascii?Q?jo4FwVVbWxoWExS0rLfxVufdezmJ1niHwLBT5BnKqP1eHRtJZz49HhoGp2XD?=
 =?us-ascii?Q?E/+dqm+6M7MEICgXIODq1Y/3QHPJXdQLxSN1mvUcjns7xLYGwGftNG++IFxD?=
 =?us-ascii?Q?NqoDgkzOZpib0L8apD67bMjKq8cEUJbj37hTTtDJ/N+2HN2xL2yw3crRmPPf?=
 =?us-ascii?Q?AvJU4R5iQtqm0c70QppVaUeuv2xk77yHw/UpGprCOemWurCcXUDQuk+QL1f3?=
 =?us-ascii?Q?lrxC8YnWD8BTEyqGHFq43XuRmdWzTXFOSgU+6DbS0iGsYOoVY0NmdAm/gNLZ?=
 =?us-ascii?Q?HTvy2O7VcgYAeTjjU8e/Qb4+RA+bT3j7G1j6H3cqyjg4jMVvFMmHr94ipYEm?=
 =?us-ascii?Q?FRwCgwU8QyQriGod0XP2cFrLtLU5sDAyGmzWccrvjZC/vi9a7g/pse4SvkN7?=
 =?us-ascii?Q?ZHyUWg3Q9FpmBqtEvu9vvaRnoI1UwzgJ9jO8Fsrj+kOkqJn9Z8Ayh938QPPo?=
 =?us-ascii?Q?CqGmO27zJg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a1cc03-024b-4439-e32b-08de62fdb7cc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 08:24:58.5959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBW/C3+2VqmhtNKEiGDjzA11peM/2ajcr2DXbvRrfWRi5IR5uyPoxV6A5/P/g9s0m3YgPUtGTi0Q3mQ812j93g==
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
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52083-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[ndufresne.ca,kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 1FEFED6331
X-Rspamd-Action: no action

From: Ming Qian <ming.qian@oss.nxp.com>

Use memset() to zero-initialize desc and cfg_desc structures instead of
assigning individual fields to zero. This is cleaner and ensures all
descriptor fields are properly initialized.

No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index b558700d1d96..39022c1bf36d 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -1338,6 +1338,8 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 
 	q_data = mxc_jpeg_get_q_data(ctx, src_buf->vb2_queue->type);
 
+	memset(desc, 0, sizeof(struct mxc_jpeg_desc));
+	memset(cfg_desc, 0, sizeof(struct mxc_jpeg_desc));
 	jpeg->slot_data.cfg_stream_size =
 			mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
 						  q_data->fmt->fourcc,
@@ -1348,11 +1350,6 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
 
 	cfg_desc->buf_base0 = jpeg->slot_data.cfg_stream_handle;
-	cfg_desc->buf_base1 = 0;
-	cfg_desc->line_pitch = 0;
-	cfg_desc->stm_bufbase = 0; /* no output expected */
-	cfg_desc->stm_bufsize = 0x0;
-	cfg_desc->imgsize = 0;
 	cfg_desc->stm_ctrl = STM_CTRL_CONFIG_MOD(1);
 	cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
 
-- 
2.52.0


