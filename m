Return-Path: <linux-media+bounces-60708-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOpmNMQR/GkjLAAAu9opvQ
	(envelope-from <linux-media+bounces-60708-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 06:15:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2184E2D28
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 06:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 624D8300D76D
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 04:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC3A31F98D;
	Thu,  7 May 2026 04:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="f42RQ1QG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410EB31E849;
	Thu,  7 May 2026 04:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778127273; cv=fail; b=WNUriZhfnOBMC1zW5BTVsrwTPBX2Cv+YEGx1ZmkujO82DLjrVBR6PC6bmgPP4D3zYrc1MGO+sfMTgQVSWS9+Owz6wkwRCidBIWryc8PZ7Dm6GVvqM/yW8MkOjTTkInguXr3Y+ct9nrdn7Hk75IiZS0+RkpxB7luRBX+UJYB/UV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778127273; c=relaxed/simple;
	bh=8n4pNhkrdAJFGM0uHkevtG6xGyEekFZg9hHxz/0pPtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XsTJx2fHgVrzO0X0ZywjWLh/s4IHD79OS570fDs3BxB3RgbWom7YU0OukxxVzJadaiQzUGDskthvifSoL0bdC+940Jqc62rKriQMMPvd5iFqHL3s8VxsJWFwlODQO4VM5x96TnmNqu57CUXaCejxG9DwgzqW269ZIqA22R8RiO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=f42RQ1QG; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6474DjSM3703407;
	Wed, 6 May 2026 21:13:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=KVxkIY+5+EoCac9yNdhCrvrsh7tTkzlDijvNzQDCeA8=; b=
	f42RQ1QGEQSBbzTh4aOkyl+c+9MAUmTLbg13tuVn8SfBLw2e26AzfqCKSt5eE2oB
	l++deLrrr9wN3DPeJ/m5vj35VFgTsXK7TgJQlDQsKXzIYXATeDWvN0VvlkB8o+Da
	L7ESuvapZEVMJqkViswERWXfIVtYYN86xByRIvMWmfpLnxSzx+Asvelc/sHPfdr2
	Q/YtCe6VIiV1+mX7LMcTt/puUen1OJX+5SagrxGTTRgbugHKH3xIk4wRJUUJiRtp
	Vs2eV7qnzb9SZ4JYUiu+qG/k56eObXFWzdyAShbJ+L4BaN61ej43+tBfXktbqghh
	0O/VNxrc6vFMorCKs2jI6Q==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012041.outbound.protection.outlook.com [52.101.53.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwgsddpsv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 21:13:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgjdOXU45A+5TfiMo5rx0/IeNynFuqPeoopI3oPMjI6oVFz0Ii4k2wRqUWFhc313a+jDkqpCMhv9yvpMn98LpIu2ds4tNyIYOMZpkm7Oi7Vub9sArAE0AifmhNfejJ6hsdgIYT3akI4Hp/E2Yx5+lLK0lpxm2D5kM/ErvexXXM72FXOC/sdu/CNuVM6MHSd9QATe9/HrRIQu5ayQimOJQUHpOlXPmMSnACBP49nFut8fm9Rp7ikLXctnaLuI0DjX6WH+YspMLmh9CNka5rC79oL++JeGDgL1K2Lx+y1PX09KhrYJWrucMK2Hs2vdRO7u3He1KR98CqGHnXEDep+heA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVxkIY+5+EoCac9yNdhCrvrsh7tTkzlDijvNzQDCeA8=;
 b=L1eHddyBiB874gq7bfh0HewIOenKD2LRh4o5N0vnZd2W6IUVGpYFA6xxj5YWNvAugmaiSH8R7bn3ODRBwCmWSJ1RfLkpC6TFTimvWhTbQn5Ur3k/dQFkmeuuX203ICdVJ0IQ8ftftOfmjLbWKIGOd+i7Bdl1wF1/xoxbJPb5VVTd5wXM3o26lLQwGhrquX/sib+34uigiSG2/OUIrFCFMBbL9ttsQUY5dTk81BELsyGt7wIApY6DG+Pxpz17DQuvCOqfDpe9+LDbPVKwVwgy4x6Bwht77WEwFcXS3hCLzZA9fTy2wnlsxaPLbU30Hq7jkik6yrMqfekIUQ76N+hRIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17)
 by SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 04:13:51 +0000
Received: from SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8]) by SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8%6]) with mapi id 15.20.9891.015; Thu, 7 May 2026
 04:13:51 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, Frank.li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        aisheng.dong@nxp.com, jacopo@jmondi.org, guoniu.zhou@nxp.com,
        s.riedmueller@phytec.de, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH v3 2/4] media: imx8-isi: add missing v4l2_subdev_cleanup() in crossbar and pipe
Date: Thu,  7 May 2026 12:13:16 +0800
Message-ID: <20260507041318.491594-3-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507041318.491594-1-xiaolei.wang@windriver.com>
References: <20260507041318.491594-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0026.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::10) To SN7PR11MB7017.namprd11.prod.outlook.com
 (2603:10b6:806:2ac::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7017:EE_|SA0PR11MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b42a449-fa25-4253-4a2e-08deabef0bb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|56012099003|38350700014|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5s65l6RA/797e0O0EoikeU5/ppzyGcJjy1+/a4fueJiPuFo5ppNndiI+DoUDVR6ualWhFB6513yVHIX3+kDWeSjduA3FUa/HQrPJsFV4SM1zs63RB4HjoqPMuVsnsipFxPDcAz4xy3CbbJOQ8Wh0Ll7qgALTWUthseH83mGEMYQ/glKKUYHGPE/3PTU9cusei1rZwu1j/XQO0CCGaLzNL4BvpP0T8idZaDjusBve9mqbp8NkilCR5GskAmuKB4FGe9DTbpYeuZbm7L3715KeO/3plS7D2l0DZ25Y7LuIkHYpRscxofX6lM7/iHjnTC/6MqgZXqSdlA7XFsWECOlefQ+Pd3rBGl7PR9VcCY2+E0Yv4DVOuI7iPE4daUAJnr0FccxswzFdn/LSADxFl2Otxix4yFdf79EmOVMTzJHOKUpfF1KZD22K5979xH5miI5pkmUVbuHmuIxd2NJ/1oFn+Dj+HxgDkhWtSS8aOIZqKDe1lKvnGuhEKikmFVU6VoYjPExb8uxIogSQ9lyGS+flYCDNPo9fZxXO1Zbc1eb8ZUGiudpKqJgLjOWbhLIMm6FCwWLU+/ptNA86PiXmOEddCDv27alJ3E+MbAjeykYumLUkKrhxhz3mwzvd4AXjf6ooV3tTF/GAqksccs2/I6gQmd3UZXFriI/HeZ8QfJHUucHds1pQCoK1qFmk/MR5A+znjDSoJ0h0sombJswtJxkuLFnfwsQvlv77paSg8L08nT1XpcIKJnof3PmfA852XA2tPeY1Zxcq3OXMVT974H/Ilg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7017.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(56012099003)(38350700014)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K2cJra0ilrlW1AaOSihGyw95ZAiSeHnDixC602R2ZAKWob6h3FrC4I+DNblv?=
 =?us-ascii?Q?8/Lj/Hqp60s4WwSsea9PDvN/DjGtJHnkPoV0HHo8RY58PDJKtOewhpJMlQ5j?=
 =?us-ascii?Q?O/gJIzbnhaD//E0hr8t1zEFpjTsCJSRS2gWgsuTsHmDNap/lRPQjtCX4BqY4?=
 =?us-ascii?Q?1f8Q+DiBctFX1nPzaWmXUgdiTpPTy9Z1uFFMAVv72lrH2wdn8ZlOQGeFZR9j?=
 =?us-ascii?Q?WUIJ0h90rx7nRCqIuJOqVyMnHqd3E95kTWIJ1moMYWXOu2zZ544eeDfs6g5W?=
 =?us-ascii?Q?3KBN0AfBZMlPMCn8VxvTWATRw2/HuP74twh2wNF/4RmOKIPPK1Pg3CgSkn+r?=
 =?us-ascii?Q?ay2205A63CTxJd3YpEZpOFhgHeQUrikqN1q4heVxb898UlF/vxjTiCEFoqr1?=
 =?us-ascii?Q?QnZw73soTKxJHff60UUF8RFs6RG7cSGjfp4B6fIa4ucanaS7+JQsQhsE7+bU?=
 =?us-ascii?Q?eLT0HYQVPWac0BpHV0L2azP3DGV3b2hjc6SbuhNnAKRNEKwFbY7b2Aowo/IN?=
 =?us-ascii?Q?LDcmcnLk81Sg5dlk1Tpo1UlIU2/hxtNjdyBYDxJeUJLozbm6Kq3H1reGY6Br?=
 =?us-ascii?Q?KAbUeIP/PT400dk1ajoqt3NHJYW5JIKE3qThE/+FsdN+M+izuXW6pcbXEIrV?=
 =?us-ascii?Q?9Jxuc3QdQdC3j46jHgxZmHljMc+aE//Y/11XUjH+SZrE2RmZagEAy0Q1TFnh?=
 =?us-ascii?Q?Gfm76mMVi3fLwCnoKDl3EpV/If+mwC8VXKzcMPwBohwEltPluQKQaq757LQ7?=
 =?us-ascii?Q?oIUW34CfhfhSpU+9ar4vmBsaiSgEz40xvw48DPrIjArRiIvLF8gSaaNACvUd?=
 =?us-ascii?Q?K1HGfls0U/Y/3GqwHP6Uf3QR2ZUNcAyx4WWQhDYhR7G5uph1pvjCOwZ9Jmam?=
 =?us-ascii?Q?KtryV0wKoEmSdbHLlXXaq7wcw5FHMA0zyduz546I5r95AYnPRGFrnT5RdSES?=
 =?us-ascii?Q?7bmeq3WgsX+6SEAow1KjUUMefa2qzTfcS9+iE7bm5heeTDhYTogZC0iwyTHi?=
 =?us-ascii?Q?QGsN/PNTdYHhmcr4oFHZVzBh2t/EKrIbA6FBJJ2D1iqd32XQx3NklrgzNGiK?=
 =?us-ascii?Q?Ec3zXt9pZiDYVxHJ/zRtZzIGhmU7c+k27++v0nL11ptDRB4KNpr5mOrtFQ6H?=
 =?us-ascii?Q?tSRplwlzUJ+lJlsL8tefhzYVNzHmCTVPDaw1NqR7fdNcibuazRxrVJGtT4Mq?=
 =?us-ascii?Q?2/khG3Sc8IC/Oo+Jt1L9x9/AdObVoTNNj6EFduk6gepoQbwlgSf2wWPYnQv8?=
 =?us-ascii?Q?Ee2Y6t/HgyzMDAFcbOVGD/JIcCdYSr/sqo9+GMf2XH0xex8tjeK2ZTmXqOxM?=
 =?us-ascii?Q?OicwT3VaFeXnwn/d1Ut0iDloK6tUj1DHwmh+q0/xktUdj4Z4BdNRjmmLGuwf?=
 =?us-ascii?Q?4k3rLVfsv6B+Ct+/3Wh7MjcfuT7uTnUZtv5c/y0RWvp5Bh3N+JaGpEoPFBEq?=
 =?us-ascii?Q?EHBn0gMiNgvWCJRuuZgH0qDeen4y+tPhmPwxnYE4/YMFzOiM/MfsXbaBktbA?=
 =?us-ascii?Q?vLVpyjeMD9E9SiWjYhUkhyimdtcVD3vOcbl0yU+qvs96/jMaBBPA1kw0y+sG?=
 =?us-ascii?Q?wKAicyW90zxhL2JGE4KQAh5yPR82GO+cifAUjOS1+BfYHsPS7ugC1SqhKA2N?=
 =?us-ascii?Q?YeG6f219PekFtX+QhxRo/Xgs9GK+RCa9mO/PO5sAp5dQoUygIWF7O8IH9tU8?=
 =?us-ascii?Q?BuD0jSk56GogVpUBVvIpPQ2pP+zbh0qG/Fj1gXIVlgRAdfI1snKJRL69aWGU?=
 =?us-ascii?Q?CQwxfch6lkXqYMUcfOjOpdM+Vqf2s2c=3D?=
X-Exchange-RoutingPolicyChecked:
	OJZrKk+JmO+1OPqG8ubB3ZcloEaKkq4wyjDa5V2Re2EohNdmV5D4Tzu4edkB8wZzmyAitNOWpH+tdG3KFg2sk8sbJO+RqXMk2IxP/YMxpLPpDtMci2IRj4dGoB/6kQ1rBPzoatcoLxpTzXuPu0w35MjW/9d9VxVOJBGmXycxg6NmexKWdRDyFPW4Tf5UIQ/sd+zyzNE92xqDHDq6ZmG+uQdwS4yeMJk+PyN2MnqQk6ahqmT3vq2Z3sG/n7JcUABr2zMLhNJCR0pbT1mJeVPSDHHqzCbf3Jj+NgmDNQVoxgczUwCWZonXNtrnaVCWOBFLBljXoIqbxSEm3kpPnxHWzg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b42a449-fa25-4253-4a2e-08deabef0bb7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7017.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 04:13:51.7457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/2ucjNvFtr7qkGUMhaFEAABjqnyhm0FBzexgCGdBrhYFhan+cR2oaPX+9CaL248SMAHJXabv6qJDsbMtkB2GxlKoPTsoV+Un0S0aL7rsA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
X-Proofpoint-GUID: dGxlkwxJMZjpsQdhaASLdRjYGV88RmrL
X-Authority-Analysis: v=2.4 cv=JeGMa0KV c=1 sm=1 tr=0 ts=69fc1181 cx=c_pps
 a=yZuzC5SkKTYVmguxKPWuow==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=8AirrxEcAAAA:8 a=P1BnusSwAAAA:8 a=WOeiQqRcx3Q23kswDYUA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ST-jHhOKWsTCqRlWije3:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: dGxlkwxJMZjpsQdhaASLdRjYGV88RmrL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAzOCBTYWx0ZWRfX039TPnIB5ZFE
 RSMzzM8SA/72k6ZBrSXE9ywL24mBm9du+B9Kz+aS9WUb+3cyxcnLfuwd9a1wtYdPStLL5IRjiJH
 IqBB7knByt45SHhHy95HmYSGJSR7j55YvelRRqjiHxTb9rFU3j8yXJI3W9SfqIklBYlmFmbK6On
 /EzSudxlseJs0ShqThGtGrFomqQHm85gWoeWFsvw33KKsZQAr9zXQ2HSTqDE4f4xdo/GatxRFev
 wZqHLx0Vr+ItEgygkpYnzo2O41iOi6py5+rCnqN3sBz+MsUbtdcEhIlLYlAjGoqq3BytAJv8uyk
 e9Uqr9Gi7OpZjWIqzhZCL8VRf0cwzMm6klTBnwflS/y81vRN3KpDPD8Nq4a2DVeiUgBMO6OBNCV
 B8S7twmVzClhuuGq1GnSVib5p9oXMKftXw0UQ2CofaJs4KXhza62BNlYelFgPXoDZgWQ7g4Uv6w
 8/28JCZYD3XckIHZt7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070038
X-Rspamd-Queue-Id: DD2184E2D28
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60708-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,phytec.de,windriver.com];
	DKIM_TRACE(0.00)[windriver.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Both mxc_isi_crossbar_init() and mxc_isi_pipe_init() call
v4l2_subdev_init_finalize() which allocates the subdev active state,
but neither mxc_isi_crossbar_cleanup() nor mxc_isi_pipe_cleanup()
calls v4l2_subdev_cleanup() to free it.

This causes a memory leak on every rmmod, reported by kmemleak:

  unreferenced object 0xffff0000d06fc800 (size 192):
    comm "(udev-worker)", pid 254, jiffies 4294913455
    backtrace (crc 36eeae58):
      kmemleak_alloc+0x34/0x40
      __kvmalloc_node_noprof+0x5f8/0x7d8
      __v4l2_subdev_state_alloc+0x1fc/0x30c
      __v4l2_subdev_init_finalize+0x178/0x368

Add the missing v4l2_subdev_cleanup() calls before media_entity_cleanup()
in both crossbar and pipe cleanup paths.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 605a45124103..c580c831972e 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -491,6 +491,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
 
 void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar)
 {
+	v4l2_subdev_cleanup(&xbar->sd);
 	media_entity_cleanup(&xbar->sd.entity);
 	kfree(xbar->pads);
 	kfree(xbar->inputs);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index a41c51dd9ce0..cb50af2270f6 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -819,6 +819,7 @@ void mxc_isi_pipe_cleanup(struct mxc_isi_pipe *pipe)
 {
 	struct v4l2_subdev *sd = &pipe->sd;
 
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	mutex_destroy(&pipe->lock);
 }
-- 
2.43.0


