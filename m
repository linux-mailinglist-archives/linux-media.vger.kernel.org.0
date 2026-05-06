Return-Path: <linux-media+bounces-60502-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPT7F/Wx+mltRwMAu9opvQ
	(envelope-from <linux-media+bounces-60502-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 05:13:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA33B4D5D07
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 05:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CF9B302C162
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 03:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5A62D8DC3;
	Wed,  6 May 2026 03:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="HaMyEKtO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE8926E6E2;
	Wed,  6 May 2026 03:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778037219; cv=fail; b=k5xE60oDHGne9pl4Lk9bsRjykvQFFPWCz14ba5vVVo005M7Y0jgkjJ5l+QtwEiBjqErJkT8Yqab72D5CDoyNvBr2QlYx3aQ7SXWS0TlejgTSipdjqEdW+OZgTTAxJwNbxUrq1MjDNBgXSgouFS+UxoGzUBfEhtnCbuhS0zZI4LM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778037219; c=relaxed/simple;
	bh=FHgAC2iv4mH82NDmXv+NJNgSJlNoyAl9GgsORdAuP54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tJKUb7VZyR3+nQ4yU9TJL7en0JGVrowyS+GoYuPVZ+A0F5J2MUIR0Cna5YeQSqM1GpF6/EC8tkIPKZWkKvHqv+tJcFgRHQaHRgWsF2xNwPwitEyYKtN8RkROGIOw7c1I7dkVZ5VFWJgXjaYJ4aSI+DJFnkeGdP98GIvXPXzQJwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=HaMyEKtO; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6461J2iA2259166;
	Wed, 6 May 2026 03:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=nGlW5Pc8uLrglD4Wx6FUn15mIJVb6z6mXwlBcGYZwjU=; b=
	HaMyEKtO0Fek1aMunj0oFklfsAOpgF4DzgwkyfaV/7RrKg7XqAuLVLd76Hnjno5E
	ztIuiBNWyajbMgUarYearYOGDKN+tWtMOblvReyc2t/sQN9K7FknRzR8WmhAWV8w
	7H60mQpUgHCC+J6CuahH4nprtsCn8YwyHK/M6kY8K2orCRxonPhpu3Wf+Lbvfm9Z
	zowxcgbv2LHVN19e2/apEnY6LeKgwamMByzgj30PnCfyIGFY030vMNjfN9ECodQZ
	ueS4rSasysV97C3EDZJlPev/78Q6bRi/xC4Bflq3+qnJNvjn1Waz4TZWFI1wFPpV
	yGIfLXzjLmjRxikd8gvvIA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012004.outbound.protection.outlook.com [52.101.48.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dw8t5vd9w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 03:13:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCAZb2zBSBu2jS+PRfMPGq4OrKxhUfDA3ltvIPv5pc9VjyTSNvPgggmC9dZar21336ygnC0QXydFATwCbBe6bQG0SRNhehWo44NjwTSDzaRUGE8/XxVB9xXvgM/wreYoB0wYTv1b991ZyGi1RsAl58HKgdXdw25vSjWVd580ENcCJYkQFjKzvW9VrVGWX3EYVtQ7fej8EUCspnfBmREzTUGR0wzwlJ0zDdCbfZCrbI9cUhYbRlUpxssrQ0OyfY6chA16NJIcpvVfk1AgUha9L7eUJgynUlYj4q73SGU665P8Rl/yWeiL2f6Pg5Bt3nddk4na7/q+Q3beN1dJAYKsHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGlW5Pc8uLrglD4Wx6FUn15mIJVb6z6mXwlBcGYZwjU=;
 b=WlQhpxczraTBJ5Wl7ojpo3TMlbUAP2ypurQx/E9PJ0zrSWx/IrFRvBvGx0VtXTlrEmDOkiWxwJnlXaAYpmjJ04/B5uCp3xnoRklGkuJD9TC9dwwYK9MiD5ghf2uNYVf1BsUsGePTIZFdCtmp+qiN7E1hncbqvzf7SwxfVRFqokLvyO1otrflCZr910LDRYEIrs3Cc591lMuOxcpEKV/cx3CvQOta1fIqOs5gNio/tEPQDOAbgQ1qSfrV00vKCSL43cKJmeYF2nAuXOWXeaiL4Nju9/IXZcofudtkcUCl5CuzQ3wlLf/8+BtPWJLauDKWb830uU55mikagAMxt1U3cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17)
 by BL3PR11MB6388.namprd11.prod.outlook.com (2603:10b6:208:3b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 03:13:00 +0000
Received: from SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8]) by SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8%6]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 03:13:00 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, Frank.li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        aisheng.dong@nxp.com, jacopo@jmondi.org, guoniu.zhou@nxp.com,
        s.riedmueller@phytec.de, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH v2 2/4] media: imx8-isi: add missing v4l2_subdev_cleanup() in crossbar and pipe
Date: Wed,  6 May 2026 11:12:08 +0800
Message-ID: <20260506031210.2769998-3-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506031210.2769998-1-xiaolei.wang@windriver.com>
References: <20260506031210.2769998-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0050.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::19)
 To SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7017:EE_|BL3PR11MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f85a84-ab4f-4aa1-ccb1-08deab1d60ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+B0Qkadr+l96MKacDnPlp09rZ7gStF6cJzRCdjXs//JM4dlQcWV9StDKXrzkwYL0hPSoQU3DHgWmIJGDF5RlqFB2ZLhElZvtxgn0+EagfzEPAYHHx52pQJU94NsqiRAWPAr0qxHN5Opfhv/ceDd1ssptzGXPCigIEBozD0RWeCQzYmvpOhMUCv8NEYySDG78yX1+gLkm9w+1wKmYF/ZikTVmXrkZ1lLumVxNjqodfg6u6gtc20wfN1MGADSGIZg+Cxqe3lwFWI9GU4LYoD9ksLlX8te4+wQM7So3AemIba2e3vAhJ/KEqdN65DangkADslZx7k+ll+jvWsbgeLcKBy7ShCweQjBM8Nf96l0CZHG2HshKjiQtWJXJc5RbqBuEscrX8iLHI935DXRCtn4mfis1crXU4RyNJtWprmuc49zVyx0AbanFngq67rDAV3iS+Pxry8cEbZ6c9DhCDFSuFLRsIlFCAclOzzvznqH0LluYJxIrOs2L2afOHRUG3551LwhnZJyb80C/7nRPQo8vVzAReTLhnzlYxC3lyfQSxoqFQXefr426OO3UHay0c2WE72ly2+wy2F5EjD7eA0BO35ehyXjJNEEMJ5RKfJOgUUxIWXti2zeWuOFDySRRizbyUXQMU8Hz16pDUtWxnwvoDMhlf7zyJvE0ilglPpNhTEM6+3vBSEMKr8qx6Phv1C5TrSTHLINg1aqrqWHaZUTzH+ScyO5eUGEOxZOpHiw2jFCDcVmo4tvu3Q+BzJI5/eqefuiTtNrNe2VHEDED3np1qQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7017.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v8j10InFAQqGS9//+3cC0sdZwZS1se4xK3VosFuI2mSqa46kK0dHf5pj15x0?=
 =?us-ascii?Q?364EIVTv9T1dKFNafWDCrq6TAs5qoRmv5ne3dUBT6ZQiKdC+MNnx89ZNGGEI?=
 =?us-ascii?Q?dNM4/Zxx3E8Z5IuNxP6BliwC3wxmfXY26/Ir3v3QYCcrLB+KNF9xZg6Uh7aG?=
 =?us-ascii?Q?Wym+yx/CfVMGwa5WnYqh4sfreNWwLKSzd+Ql/BHKBbBrGL+2VsFOfE+Ambzc?=
 =?us-ascii?Q?KVHitHvhA4TU3P3+NNO2EkgtKhPJ3l9mgfFOv9TC9wZ62OKGiQXH+WXnbyZf?=
 =?us-ascii?Q?wd5iuHPqDQogo7swGZ/71eAe0UJ1GRmamTWY82FM+2X8yBc3SVNk/7j3QAsK?=
 =?us-ascii?Q?kK2d/hayXeyUA529Szhglo7U+butecPneNbix2ENpyRuEIhIQvL+s2HbQGJF?=
 =?us-ascii?Q?XCpouTLD2mVcW0LFkwpn/60Nxk7QZbHmJ9C50SA/0TWBwsOwV2JxgqAAWXr7?=
 =?us-ascii?Q?JSfox+5s0DJ99BH5QuSsZWbJg2T4jikzX+BFdTs7qkTEEvpk/AHLMLPewQpX?=
 =?us-ascii?Q?HExrZFtsQ9FU2Rwrvtw2jpPHOzB6bJEDx3KRztwixFkp7+vAy6gjhfkjftEl?=
 =?us-ascii?Q?vH1DZKWOrOLz2Q94gO/xUyMI630BDCO2isw+J/uy0aoIv9juhDVyaC0iJWI4?=
 =?us-ascii?Q?eWD+fZRcA7ybXKvt/eAECBsnTual8Ux7Me8YA27UEPigZ3CwLvzWQglfp/C5?=
 =?us-ascii?Q?MMX6ZztGtkhsmp3k8Y67Sn4uwX4lK3/jXCHx2tao5mbKp02BUjZZKCfGpDTz?=
 =?us-ascii?Q?1BpPA8zgtmT48gWnjqZXHefck5djZOt7ox4Tl7ucSgPrWQrULVwDRFU8Vdug?=
 =?us-ascii?Q?6ZD426hr2zgwNtT68yZLrQpyLWL9ln90hWOtZRFomiNV9mn66ASY1FW0de0+?=
 =?us-ascii?Q?Kbr0ZWUlc4oiY33yFIrG/uMZqpOuV3zEp9JcIrKVTo02VivvtZqwPwRYlO41?=
 =?us-ascii?Q?uCvhdTmI5kd0eqj8yM07iOhBocApSopgJhhW20SWtZ7wXEvaa3Wm/1Iw0Sta?=
 =?us-ascii?Q?mQIghLCwY9UkQ4u2uUsPsMihCHOmF6LkKuNis74Pgb3FL0rFy78S8c5D+lp2?=
 =?us-ascii?Q?zsmrSrFj3HrGy1N1qBvg9YW9ElIEEhMH1n+5sinPZxIGJVQLiNGIzyAqQLJ5?=
 =?us-ascii?Q?QooGicq1xyOqDvRI4gO9oWzrIsNpelbSaKckQGvgigt8tRg2CnIaEAzFjuEl?=
 =?us-ascii?Q?IQU6C1nBdab+a3+42MJve2uGw7kj8ipD9Eh2gChjPV9G1B/gqyd6BzaueL+J?=
 =?us-ascii?Q?S5CrTS2nM70fu8KqLkcJF7AIpFuj6BnF3c7zCcAgIGYsfahBHJo+z5nCcYzN?=
 =?us-ascii?Q?7FKEY6Ij4fxQThvubCJUZT340xEtvw8SgSAS1VKlNHMXi+pgRVYfwqORXF8p?=
 =?us-ascii?Q?HfGoQgZXFgwPgzmlc5fPOx3WfxMLPsCsdaDpyVBFREOeiggSNqc08nvdzYzB?=
 =?us-ascii?Q?3fZslPiQGxlrgWjP4QQhQ9+B3h+LgOMWqk/M2dGVwRi/3Nh2AcEQhi22yZTl?=
 =?us-ascii?Q?pls8G/+QlnIgwwxJrkSVqx7huHp1HvBdZoaGD8BTixywWtUdpXkVKyOGBKZi?=
 =?us-ascii?Q?21lx1ZNsrSxdpFdEyYQOlKro0ZGxqqEypL2D2ClEQ0iHBcR2ho4pAK+fAGeH?=
 =?us-ascii?Q?Z/o5ga40By0mqcqoXgcFPGYjgve/adp9ui3gXHeNyh9YXu5X3PnMqzdUC/fH?=
 =?us-ascii?Q?PCe0a+3w8bvWhk2NPJQW0JaFhfuBirNYTMtpSAhrdN3MyvZtCZ75Dr/WVv2w?=
 =?us-ascii?Q?f/xG2mODruTRToDO05lnw0Xszms/QBw=3D?=
X-Exchange-RoutingPolicyChecked:
	j4IxXg3pT0BBWmcsBSmBus99bTiMy3ZJj4PQlXLgZPFF9xNUSTWBLOAkfZBr5Ss/xDsAUxFs/1LZm8PjMEA5zhRrmBwgvolSgzaEYKBrDKfRfaPQOmG7RAB6jsaAwQUUhGU1eAQ+BKbwuZNFEavqwF15xgnE9VXfCTLIDw2yy/em/I8P7c68sa1hplUXwSzSRwZL1NO0uBq0Q956nhoggVJc80Mwmv/ULVpl6Ge6v2/1TW7VP95GrHtfDO+O3pT6KCxNhy1u8vEz2QOlHAhxxmPytY4YdmcmnEk9GO5xgzSdDiitLHTitXqvLFAfgHcKwsHJcZ+FKl5J65VjrporaA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f85a84-ab4f-4aa1-ccb1-08deab1d60ab
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7017.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 03:13:00.0469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFV5fSmzwlp2sFLho5nEBVYnoUp7stbROOtn8gvp4OmVJsryPUIgXx2tDEBPulZaubcVpLV8R+Ayl1YDFDUQYqWO/r10DEtF/a0JXJbnE6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6388
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDAyOSBTYWx0ZWRfXwj8oJ2uIAkeS
 IQh55k526isuEnlw+3rcYZ5aAALs4YVR+Ii9S6M316O65DBzzKCPc4UR2+yKZU7Rmtw9VqUDNp6
 gZSeyuCsL9IKnrYf+ulSpS/ZPMAsSuFCsQXT3nT3U4Sql5byhQBLkGKtrMkw44i1Jd0CB3eg8yC
 fnOmL3igo722SXKXxQSxPEGTBx/OHFeIxG1ia5vF4TSBgJzFk2uu9iB2vnSg08NHbj4BgWJwL8q
 lrnm975HdcqzzZHbmJgqbsBL0L15BbDsTjQ6gNCZxkGLIhdLOxZisEjs8ipjgDGIrxxs1VcbLFR
 RWgk+zYzjOYwmj7jMpQ3INdijw2VBVV+UleSVQaZmErRGNiZp/w0V43mlgIYDSA+KKpXoYo1emT
 SllS/C4HJkJRjv4ZIAsc+anfeuKXL3gg5KVid3uNDy5GDBRZLRcOgZPDq9RUjm6xJfG88Dlcjm0
 heTn7WrqMoHaoP8ayyg==
X-Proofpoint-ORIG-GUID: ae_tf4zsuTi9u0mOmA-2b1I5zaEuF91H
X-Proofpoint-GUID: ae_tf4zsuTi9u0mOmA-2b1I5zaEuF91H
X-Authority-Analysis: v=2.4 cv=BcLoFLt2 c=1 sm=1 tr=0 ts=69fab1bf cx=c_pps
 a=2pTyoxkMaluYXS6DGsynPQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=8AirrxEcAAAA:8 a=vL01Oy7GyH0ke1FiNzYA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060029
X-Rspamd-Queue-Id: EA33B4D5D07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60502-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,phytec.de,windriver.com];
	DKIM_TRACE(0.00)[windriver.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]

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


