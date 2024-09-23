Return-Path: <linux-media+bounces-18470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED96E97EB2E
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 14:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 452E5B20D89
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 12:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADAE1974EA;
	Mon, 23 Sep 2024 12:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sRSeRQcT"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F76C944E;
	Mon, 23 Sep 2024 12:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727092872; cv=fail; b=Dpl87n1Tp6g1g00Hty4y0i3kpDpdkbu29dKqMfdkHgQoSquDUWXVRYfL7vnpRabtlYjaPh7qpXY6zltEyxyqla8CaSLWLPZjVqXXf/kzJXskBPebwZhnTNCvV4vXIa9PjLQvztq4x3FtrBIWdtS19finu6bZDFTnbZDjTWwG0Tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727092872; c=relaxed/simple;
	bh=IllR5eQSWSl6HVBTbdsO0qRpAH+Dy+VQ5j4WUD4LoEs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UxqtyLqQLmO4OORccBS5apKNsrm4YLdZ1Y4qR1hma+IJ7DvghexeIduzCrTJlFucJ4EVQaKy3NHq3CELGQUN/jed9+LnHrauzHzAyk4t1pmxEMmvB9OAtbaA4k+1YW3qCbLtJ1XwQP1t/m/u3NCAeV5UhklpLl9HKRBaBQiDewo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sRSeRQcT; arc=fail smtp.client-ip=40.107.20.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TX9eU3IJpuZNB+RU64/P3DMbz7nR7YBq/UOfd57fEjhK/f2nf28I6EzEJORicySfUskMZaI1hLR/mWeJRzdSaeAkPdoLDs5g+HnQttJ6zXQEN4Q4nu4Mycgk+GV0N672rJQtDMrw6GicoxFCNBTRGzolFAO6mYGAZb4SLsLEHIFr3MsMwht2au4lQT0GWVdC3NqsVrIutpBZL23BWPhWrDOXNCmy5WDuJMW9/koQ4ttYjTMSBl/q1D3003pQghCzzQZXhN/HT7Y1px6g08Ft65+9Ehhv7ux7LSi3Cd2UqLfQoqoXRsHeyHmJtDaN1yae9zS0ODPhl0UF8A94kxzCyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gs2fF0NR1FUS8ZaqTfGyuzwFuv0XOucL6OoHTrHiU60=;
 b=IeZtRe1sTHo83hYtIc5e1/7ON9NarIiKtDj+7hvtkKUtIXm+khbU6d96bgJQ/Qi18R+iF6McJxeGrMgEZotmKc6u/quE8X5spz9OQWO2gkLejSp7ElhYyzCCgPrHYg/4GqP1pjQGTXoL+NCr81Y1vPsH4u4R7yFZhTmiceQswXospXu/pLo6CwCyaQL66muvx6+f5eSRPENljKA37WmFnrnUqVi1TTK3mUVgpbbbEFE76xpPelqrNzS5HsnNots2bBuiyyUU41YdLNQ4T8/dwyEMRJruSeutQSwthBqlRArkGhrCbjvkGRKV4icqJDwTqiSZlVMSe714gjjAqQ/JeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gs2fF0NR1FUS8ZaqTfGyuzwFuv0XOucL6OoHTrHiU60=;
 b=sRSeRQcTiPCYD5v+Nw8VDOFusor1VACracIj5avfsSIOoklOxfpGPgfzZYy/OMgp2B3Xsnn15aASYsLrQGbUcHnRdnXmc4kq6zmmSMdlXOrQuf2gcumiZGjoZmQXX9keOeCmXcIFCKOGXjBsMXJ2DEoC8a7SmDc8AtxftkRYP7ocFLgPK6OiW1oPnwvzqlX0B5IiNe5lACq1+SEM/5SMaHj6OY1iIyc2O7rhQ0dboiqSiINSHECejt7fnoEvRZgkb4B+1+/6Q6lhQjpheCI9WGaWf1gihmILC/goEQY3WF9wSlJnh2Ich0HOJVACOgUtiDIvVv/WFCbzuOPHt0SK0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by GV1PR04MB11063.eurprd04.prod.outlook.com (2603:10a6:150:20c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 12:00:53 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%7]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 12:00:53 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Stefan Riedmueller <s.riedmueller@phytec.de>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: nxp: imx8-isi: fix m2m device v4l2-compliance test errors
Date: Mon, 23 Sep 2024 15:00:48 +0300
Message-Id: <20240923120048.3200166-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0011.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::15) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|GV1PR04MB11063:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ecf3e0-4f7b-4ac0-4ba2-08dcdbc75f77
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?LtN3uuMISe8ZeqdbnLhCXIiHAVc6KVZAZsCFKwIihxO8jeZ1AanyzgmuT4Up?=
 =?us-ascii?Q?Xm9iedxjlUfj0CAvfhxY7Jg3ch6kRTQ7vKXiUtKbxvt4wEUUmLYzNcGz5gfI?=
 =?us-ascii?Q?hew8pQ/XBLHL/cpuBXHRIJbeXYJF7n5wEkC+gkTtL+U2UjcPB47h3O6jnSmj?=
 =?us-ascii?Q?Pd0K1duJ3K5jvfTuB4fsblgXmLm6bH/dteUFILWNXG5TisLmL3aKFXs3H13/?=
 =?us-ascii?Q?pBST92WhQqhpRNAYFIWrOIPkOIuOMK5I7xZukra2YeA1EKSxRVgVwhTzIpW9?=
 =?us-ascii?Q?OejcJtC+psbOAS6dCIbS53cQlgjq9hoRFRSKN0v3kWJKOBjhSS5ogPH+HMQk?=
 =?us-ascii?Q?RL3UGC5m91ZmVXOVGVtEfXkXKYZvp1DqImKaORKnmCcBxg0l4j2D0ZS9tjda?=
 =?us-ascii?Q?TUXgZJMpR8/rVcvXaw+qOcFjEi0BDKc4EJF7/rEhjwE8fbM9rg5o05nCoUff?=
 =?us-ascii?Q?ucdJDjp8i9dWYv2vwTeXKf2x/tciKd6RjY1yTXDqQJ2fcIrFR8rUqVyGUXGh?=
 =?us-ascii?Q?DD7VNr3VwHQkajgARRRwYg6CnadvMdN0s3PJx2PpH5KKyWLPOWdsbBS4fMXM?=
 =?us-ascii?Q?/pCkH0538nq7oHcjmicUMWQGqMJNYy28VuOPlqgULEFurvkH9z0JGwoQdI+L?=
 =?us-ascii?Q?hSrVc7Ex+TJdEkqjmZ5wKg8bFIv1xMYEEbq+B4w8uSuiRftQEM1wala4x04Q?=
 =?us-ascii?Q?PteCnetF8rPrWzeKBD1Z70UCygEf+DgLb6p3R0lpN0Dqb9v4DXulwsr+hVid?=
 =?us-ascii?Q?6cFE/h0GvzJU4QfrB7fjhE/vwJhnsc7xQxL6U6ycuC+TeF4IpvnWo9EH23vI?=
 =?us-ascii?Q?CPmiuEb1b2zKhKY/wr1MqBEjCjfPUQWkfXHHIivQU+K2Y30s7UmSVnO6g1T0?=
 =?us-ascii?Q?wLJLtu0fYUIOuJSsvwXu00DdnteWdYQYHWo2aqDUNO4aPVfV98gGOSjbN/EM?=
 =?us-ascii?Q?vA/yX910y0I5ZXjcfNvzRUch/IiTfyq4F7nZEDtdAx2/Pe+ESBhMPRMR4xEK?=
 =?us-ascii?Q?/v/xA1e+w/4bpvM5dtfkpHqUagTYyrhk9+Fff7e1L5hm4w29SRzLFKXt7/nC?=
 =?us-ascii?Q?4DKjz/zvFW2pwVs58VIcHC5HYm8W2G7va0uupY3IeB1yenpWR6Cx7jcFAKds?=
 =?us-ascii?Q?cEJPYKBjlwEqyFVwTk52JTp/3F6S8HBgBhQt4x6BwoAUS6WjK2esdyVds3pf?=
 =?us-ascii?Q?M+dgvQo3J44lLA1X4YEU95lh4IP+nwHlBl4q3JkX+GDW8YrF+GmFvJoJvxEy?=
 =?us-ascii?Q?viGKfsFDntjr/AF5PGEWXvUuK/mkNUayOMoZJBYC6BP78LicO4J6MSOirmQc?=
 =?us-ascii?Q?vUKJ5b55z8pvPdlxgfPaxWSep2mId18u9mdZJ5oAzrsvFJmEl92Xq0a5v9tm?=
 =?us-ascii?Q?LVPGAIH4/pLWDv03t4SgdeofXn29?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?X2bpSrUV/PEO8CpPlsXYWfmHyx4xMp5lGpXOlOFDQMTPP6wZYkibHqX/gHr8?=
 =?us-ascii?Q?T4SVZ6u3TAWM7h+ql6bXOaJtSfPNs6tgLGP5HPnBri31nBfGTkRkFjhVZDlx?=
 =?us-ascii?Q?JnEchpL2PXnXfu4qFLJtSUSCXN989u8qJmW9e9rg5jbY4eTsx6XaPeUFksOK?=
 =?us-ascii?Q?PXDPsVoQg2V8TN6cJASUrKEuAJBUuqPwouMK1bzKem8NxgUIXp5zm9ID8CCz?=
 =?us-ascii?Q?6h7OQJ9Y37DIXCTb5Hk5CKTLYLRi053kHf1b+wd3/Yjor4Msr9SxNccbips4?=
 =?us-ascii?Q?r1bNt83ZHa4WyBTeOFWVaEwS2EDgkmnPo50K8YcVVyVgbqjmfsvX8PF/6jbn?=
 =?us-ascii?Q?guAzbjVhCBSYoNzSNa6PCkSaLlakAnywbtRj8Br4SHPEi9yaiSozXdXv1ZFX?=
 =?us-ascii?Q?KSoI0mc1U5BJ3kABLrGFEAi7pJxNpBpPkzgjak94G0Mx1Uex+W7PEqERcC/Q?=
 =?us-ascii?Q?bcdOaFShONpBgRlmTRd3AS2pC3u7gZe47TXOgzOdJzCP7m2ur3nohbK5bBqh?=
 =?us-ascii?Q?nYkp1nySVT4vCQoUSuYkEKz/fB0Ck8ZOQOJebjcl4CQKbsSJ7PeUp2n9wHLx?=
 =?us-ascii?Q?WJtYjBHmrnbVNhAKfyFJYPgf6M4suCqtCK/S/K5wNeP1Dg3YzP0/eKwCPnOw?=
 =?us-ascii?Q?QKOalU7G3rltaEdPiyKo1vEgXMZQphmlDKI4wjNd7JlZg0a/Gu+24Vf1djJ6?=
 =?us-ascii?Q?P2MYodbsfvPSXG7VXRARyDJwK2UWkqNbDRu7u0gSwvzeDiZmEgT3UpoyL78g?=
 =?us-ascii?Q?waXMGsXJK3I4W5tf2Tyk2VCwiUa2062bwFwwiKUYpfTMUMv1+7TTstWCko/u?=
 =?us-ascii?Q?IsXjt1YfcXhup+cdixAJ51AiTs7duSxi+f5L2VgnaYzeqVXYOO3EyFhyvCmU?=
 =?us-ascii?Q?Xi8TAnm+QX7DfNXB6Kanm8NN923coVzYGB041ygQEXBXgHONSnQtPqDJjOFJ?=
 =?us-ascii?Q?favyEkXijPK0pGQPxGDdpxwAZwktjBmxoT+S9pxsmOdgljIO59WdMsAupm3+?=
 =?us-ascii?Q?PXN2ic+W3dUEixYVzOBl7GuzLe2B61pZY5ToIDulN4p4T4wmWzAYE3n0C1oJ?=
 =?us-ascii?Q?l9cGCL3Q5wWg38X35L6hgzMy4akZbBDcViYsUGT1qycgK4OiIuldPP3PPDXQ?=
 =?us-ascii?Q?JrisRWerbEIlzAL7rJgIVJA1IJYaI64aoojxVn8SpbfhLye3N5WFSTe2lInV?=
 =?us-ascii?Q?Ac2kB0WLLOOicsVrJnP0re+u7bHBKuR4+rYrqseDdu2HW75c5wz8WmSZfdob?=
 =?us-ascii?Q?hkz2E6n8Hg3MlPFMUPkq+NJ38rcx9ARslnCMJxFnOOkf+KaB2SXED1w3yYI/?=
 =?us-ascii?Q?Yr3xqtXTKyIVdMPvuTGX0J2wfH3EyXsbVDEDCRqdzHfPwHQO4eG95ceMbnNf?=
 =?us-ascii?Q?FfwaSYQ2AdWEIIQxDhPG/+oYHC7FfCH53qTLTsLC5zsPWkDG+AFt/7IFbjAL?=
 =?us-ascii?Q?hdGLzcxuKNak8dC4b0v/xvQzobhKlkVMV/KkBlqGcMKX8vR6CElu4LsuOSxj?=
 =?us-ascii?Q?aNYrDMoP3bsvAOD1xw1+JS73aJolb9JHLbcVfzRnBhMF0B6PzdII8fB6PAWa?=
 =?us-ascii?Q?IPoQZ8rdKQdWF8901oWMMR9BdWXYMa9c/KSZiQx0a9EdoYf4kJu7F1eBeod8?=
 =?us-ascii?Q?Bg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ecf3e0-4f7b-4ac0-4ba2-08dcdbc75f77
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 12:00:53.0512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PHEyle14ZBSshLJOPDJHWvYFFSeKZZPeDkyf6pwp1pnM7IJzgHtdy+J95MPZwo5Z5RWTqy7JDZsxGS3dzDSzPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11063

Running the v4l2-compliance (1.27.0-5208, SHA: af114250d48d) on the m2m
device fails on the MMAP streaming tests, with the following messages:

fail: v4l2-test-buffers.cpp(240): g_field() == V4L2_FIELD_ANY
fail: v4l2-test-buffers.cpp(1508): buf.qbuf(node)

Apparently, the driver does not properly set the field member of
vb2_v4l2_buffer struct, returning the default V4L2_FIELD_ANY value which
is against the guidelines.

Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index b71195a3ba256..3f0c9e2ac802d 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -222,6 +222,11 @@ static int mxc_isi_m2m_vb2_buffer_prepare(struct vb2_buffer *vb2)
 	struct mxc_isi_m2m_ctx *ctx = vb2_get_drv_priv(vq);
 	const struct mxc_isi_m2m_ctx_queue_data *qdata =
 		mxc_isi_m2m_ctx_qdata(ctx, vq->type);
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb2);
+
+	v4l2_buf->field = vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ?
+			  ctx->queues.out.format.field :
+			  ctx->queues.cap.format.field;
 
 	return mxc_isi_video_buffer_prepare(ctx->m2m->isi, vb2, qdata->info,
 					    &qdata->format);
-- 
2.34.1


