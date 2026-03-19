Return-Path: <linux-media+bounces-56335-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIFfHDP2u2nkqQIAu9opvQ
	(envelope-from <linux-media+bounces-56335-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 14:12:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 686992CBBA0
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 14:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73C66306B4F6
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 13:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1393CEB9D;
	Thu, 19 Mar 2026 13:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="Hf/2Iwc6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D27D3A4F30;
	Thu, 19 Mar 2026 13:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773925907; cv=fail; b=rUTySJnHPKhYWNXl7wWyUKt2fg+xA+O6E6j8ioVINqSEnIxthVuqy7WZTuhCN0RpJgpY7fhWOfC5i80130lUxsmEE3E+R2atbulMeA0/8BopRuefAYuthucIoNdkO1lrq23Gdw2vH0W7PbavWpOqGi3uJ9bzpS92eChEMyiDQAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773925907; c=relaxed/simple;
	bh=HQ/C0ovnZu52dMz34skCFSCf0V/RHQNt+kWhzdGEHz0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qR97LH9rKLT34Df61HeWcU2TO0gNEQ7mrVGqGpEU4jEKB1hp9Hq4+f31PuANIA/bB5MoBjpIDu4mMaSmhLliL6XKfIRgZqC7jRiLkAP9rZ7fSQxyVOgLaO8Rap/o3ZdMZtEturCYwlqXuIec3syU80gvffQdWqPMHM5pjxGFA8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=Hf/2Iwc6; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JBD2OM3091015;
	Thu, 19 Mar 2026 06:10:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=rlNGYAIbI
	LbOaaPAfCpXdf2Ew+Hueng5xKbvQi2BloA=; b=Hf/2Iwc64z6PNs6/ku0ZuVwvW
	LBueHyxImSRk4E3YAVTXL9ABdYN9CedKwGLAwRri5cRQdLDq3kbFM7fpO7AclhcS
	zpWRS27Xd0AtsVZSQeDzwGyBrZ9EdvIOUHzv8LKF50dkEmyqObesYNNKeLgsuY4b
	bxrhIWyrBuo47CBkYIf6wipIgrPbfTdZy4wK7Am94HCZelPACJswyJtfg6T6LdK4
	SPDVoswsQwhSa6qgaKrJ6m75Go8D94MssaCg+HhIUpSlBRB5DrT5E1nehQUDGxgz
	4bbb+Ef7/B+R26HgA6D7xMO/sffvjzKEzB4bjbMl9oL3VcLQ1tZ/HwyhAIroA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010047.outbound.protection.outlook.com [40.93.198.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw76dx836-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Mar 2026 06:10:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xvs4eqlBJCEUgfB3I/jXwr2+pdcEBX7TRVhMdBzjdXh73NTZoBob6/mRjayyLG+H9v91DjIgXDcWQdAzwWBb/U3e9HLXt86J86MF9yxF9/+c6NIVuavLI5ZlPoYFpJLOkbC5eETfYym1p/hAUEAvwxNP1mzw8pzohpmy34tkE4naJQnN4FuappMTLwcQEJ4mBSmHD5kJudbANIGt0E7UQHP4Im3+FqFSpbPqfqHu1JDryNO1B0P9kfwuiaoYDXqd9bMULhH1DI+ecaKGV3hYiZ1hgABqDDUHAJtjMMsgrlFsTATealid6akM2x7nDu1Te2H83+0JbcVejJSpv0fD1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlNGYAIbILbOaaPAfCpXdf2Ew+Hueng5xKbvQi2BloA=;
 b=gXSmYFquI2xJTb1IsCPXJM3z/LbEfwxnTeWYkVWPZmKLDtMrKfPe+fLiBi752tHodFta5fEkPK/UeMGlxeckWGRd0E31x7opZ8v15wW65TCbr1+/XN289wDvxK/FMVPARaZ6iJXxwVh7BTWFwRIzGtU5NnLeaq5FlXpBIkg1cWjTzCAOMa1v8+uuHXFEilJspYFwJnGuFmhXkABdBKKXS/vWrktVmh/hJ49T46sgCXueBDwWTfbZ3yxoSDZ6B3OJsZvGmISF5BqRfOp50LA9XJ1SlWn0QpEYAN3JNVT9SSxHQ3DQT/yK2+Pqo9w3jd3I/N1Zcp9Wev83wIuHLGUycA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by IA4PR11MB9298.namprd11.prod.outlook.com
 (2603:10b6:208:564::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 19 Mar
 2026 13:10:48 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%8]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 13:10:48 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        tarang.raval@siliconsignals.io, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, dave.stevenson@raspberrypi.com,
        Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: i2c: ov9282: Add test pattern control
Date: Thu, 19 Mar 2026 21:10:07 +0800
Message-ID: <20260319131007.3082057-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0091.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c2::12) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|IA4PR11MB9298:EE_
X-MS-Office365-Filtering-Correlation-Id: f0afeacb-99b4-4b28-7d03-08de85b8efc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	rTL0Nicsbrg+dAB/hBoHHo5FT4Rqx5uANpP+Bl/BgOFXgyIzNCQb7d59/bTWCnVuTe8Tll+oSj+4Je1vBCK3MSw5ENiqBNcFVKeW9nt6TqAte789FXff4gzSy8gNtRwY1tzc1JPCwKvoRU3CxAnGty0ML50QekGPPo93lzKhd72EFnkjZTQxaX+lq4tiHcD51GpIb0Wpy8w+CKeUMMJcSW4R04w/ppI8AlWVUypvIxzAABwfkdWvMn9VCJ4e+AgHb6aNNfGHYrtPZXToPVz8nBXXpsAlSdnzEEHTsFT+NigCyAlR2FtYZ8sndWxjcO8agubG40zly6aAa4IKzCtiSfqeTQR9+Skym9GIYdXyshYZYtug6abW9+MWeVACgnqzdHU8HtC9VQWGvhGrbvkeYsvUtbrc/7zGURFi7p9Hdb3H1vqu1yds/HLbb1OlUZOfvRWiquJmePU/40RWa/qYjNpGshOr7lI7efGAncKHdIZRG8MzulGLlnHHT3LN/J1kRVPbUKvJs/AcFr0o/vDLH0oeMVsEA7SqevsNBzAS3jgSiRHTiAZX1gP1pTEf0f4os1B9wMWm67MZN4jcVm+MJUdDzH/QSxjBaHBlRPGfJoPZkNtQLf5V9uRFwgaBCzcWIEkdtg9l5/kAem1t2PlbFPyHcxrl5B1lprQS2WiFql0lJSi+JSrHmPFTJNuZ/K01lefX8MGcj3V0NeLYIxYriOX1V3xltKvmV3nHDdnu3pUYFIFvBo7gHDlhsMqGMYpdQcoCpGAhEP5gE+DYvu7zdOx1qAJsMLyAnIej3a0XPy7h4RNrB2mCyYEqmkY8iq4I
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wiPcHJB0f6VIGsI/50fnHoHw0k3hQ/vlJsR70EZ7uIgaMem06L/9g8yDtOfo?=
 =?us-ascii?Q?pvxlNlWjcSZ/dOfyasw/996rxrt596LB0DymKo3EJLIQpkaMvIBidfyBHk/J?=
 =?us-ascii?Q?fczjsKhd+7f2p2v0/LWyYM4alJtfs7flRii20x4TjXZYi/WPhhrb4Q1/nYt4?=
 =?us-ascii?Q?ZJI08BDOUDuy8aspcwhQuOOkFOBNIKfTMRmSgkuaVlAgxTnWzMvTaVRSrGIZ?=
 =?us-ascii?Q?tqh5zvBPYC5cuuJCdF7ty5TyIRkaZx3kcu2CXettrKHyxGTvZb2mROHE93J6?=
 =?us-ascii?Q?gIUtutDxdNTovKX/UoJw9Co0EC6sURGmfYFzlhUjN6EuQlqLo61gQknh6gAI?=
 =?us-ascii?Q?e7jxzArYF9wjylVmBdePfYbNOa2dKG79+yZ/W9fqr/LzqNklc5UP3e4mJjGo?=
 =?us-ascii?Q?PKiCwE52lzkAhT5O7lAkspwgZWsHqzWWrG+/XwM4ztA6F8Tv6pE+f43xvNu+?=
 =?us-ascii?Q?00YCj9/TFVj71N0gyyCKuurboqxp35tYnw8suMzRe4BxR7xrJ0jvMxFHyz7K?=
 =?us-ascii?Q?hkheqidxsHaL4OFzO5mSrkDAaHu/kGLHTr8bmvDeCwAwKfwBOQZcIgngK1F6?=
 =?us-ascii?Q?aWhtMfzkt0L0lgafqzVyXJAdSTD/WcMNvR99Jw3hEVFHLN82L7uOAaeSSKHo?=
 =?us-ascii?Q?d2tLXvT1qheoNogJ+JVqaRiRJfwWjfIRQRahnMmDkqRym2ciToufLNsZEees?=
 =?us-ascii?Q?PHmw4apDS5wpmI7t4J3ho/i0oFzqvIt1NdO5Tg80GXW4/0Xw8EZHU2DEwjsy?=
 =?us-ascii?Q?WdSvMdIShCMpVBrMYOoxn5BVjYe0DkRWo0U4b1sQSiWFTHoGc6QqYrPs5Tqb?=
 =?us-ascii?Q?ov0HawRVmhVekIx1/E1J/p8rzZOb1ZUP7XwQOg1mqKQ8NwfQpZ9EwbJ5eCdB?=
 =?us-ascii?Q?jt2NHQKW7gVNvAxEGWQ3fthcKrDFwnQpZSoMiVv8w6sw2KTGhGDfjDaBoyoa?=
 =?us-ascii?Q?mA3IjfYvvXO81uxA4dLosISkYqI527riw8AgduLES1aN69YdvBYiFd1LhQ99?=
 =?us-ascii?Q?jS6nVsY4Ed0bMkkvXDNTGHuxtC6L+BRwImU2Vj8t42h41ZX6fHtyG1vHeY51?=
 =?us-ascii?Q?O092nd/9H2+kIJ4YLDKPzIMvhDNhWgvWKFrglS2HlidiLr+5tReBRVQc7tAC?=
 =?us-ascii?Q?9+PFm8ugPCpwAqoubRvOg9CMnpCO+EON4UHLrVqTe0sOgGOdclNAN/Q9s8La?=
 =?us-ascii?Q?0YTJuFu6AldFwIDI0d/viX0uFfQD/25rhnkGJx9A+RNbEXfi1U8tb0GXtg4L?=
 =?us-ascii?Q?V7JllQUmyczg3wFVsZgDdFDNZWi5pt2blZYlldRuWFCthGuu498Q+gYHppmr?=
 =?us-ascii?Q?RMxU/cBMJPBltzwtVThNqdpYXhu0Mbm0UpP87VsD0BkbKr96v3ZnneL97l9Z?=
 =?us-ascii?Q?TGuaUn8il7lRTTAyfnA1MF9ss5HkRpN/66mzo57oUdNK7kMzoXUHTxzLawXI?=
 =?us-ascii?Q?1GdyV3+gpVb9xNezkC1xqXtgIJocAG+FTnZEuXBRRG76XRn05Y5gjN00FzcL?=
 =?us-ascii?Q?1ETsWzqJuxnFF7KsFBkJRecCthW/rQCoSEIRWwLeSol3YHNUA0839PJsxvL+?=
 =?us-ascii?Q?QIpfiUNtff2vokX6kGYveTOwCTz2MkBCf7hPx+pXqsrPlKu7KGj0s02ZGS3z?=
 =?us-ascii?Q?gbi9EM0Pvcg9h7JF2IsGvPHjHx0Qkk4OBUyw4JfH3TPgfyyFlhzVqmVQWdJD?=
 =?us-ascii?Q?g1GFccD8XRoGf9rzYfqD8nT97N9voC8XqaXQmn77nHyrparfrdsYDCfYdx2Z?=
 =?us-ascii?Q?7/4FRJmK8jsrdAraPSksEuzE7Mj8uxs=3D?=
X-Exchange-RoutingPolicyChecked:
	OQG09qsLV9m62jSS2oxu96n8NH6Iws2z9LwkGIkZNScgvx/km41v+8B6iCKySTQ6cSZ5H+iMHDIlSi0diMkR1IeTTyLKxE3LGEEsTYGwxfmY9/CAEmLb7OsDy6EU64PdEXd1XGFbZf/ZRYbGh7wE8X8F/aQSFKmxaItaEWClSvB4fpb/9q2ZL+DPNmnKSqPiLnz5Jy/+Y6hDZDvYheRVoEjXONvWXLkTzieSUrmARatcEjZ1qkueXYiF3tXV7J3CToJWBgYzbPh/R75LvjjWW9wwGn1BDkvEDPViRzV5VVc20TH1j/bbc31VsPDcvx3qYiJPHlmd42UKtmUk5paI0Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0afeacb-99b4-4b28-7d03-08de85b8efc3
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 13:10:48.0533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wxw1Y99Wm0msX6ibnRlxd9QbkXwCzExkutz7HiZxolr+ZP6lY6/AF8kRmgBDRkoeKJbrvETM+BeFhouPCw1f+K8YT2Q5LfkQISnyrjelr7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9298
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69bbf5dc cx=c_pps
 a=NlF6qXdsITzFGNsd7EO88Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=xq3W2uTSAAAA:8
 a=t7CeM3EgAAAA:8 a=q5_IkJXvu-bIt5wfI24A:9 a=P5L7wpMTXyg1GfFA3Gwx:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEwMyBTYWx0ZWRfXzbzX1rev9reE
 paAOn5KlRSpgC8y1kd7GpRrw0w6c+iPXK0q4zhCyYU81UBVNhk1FY8vGFuqT+9ooyE+ci79drT2
 OAvU7GudwSyvcvxp6EPeKD5foteUOSSPGeo+8WSVIKcRwSay+5nD/GfP+K+BhDfPHsqQ6m2Ag5j
 Sr8X/eJibKpPAHOB+uVZfH8tBsecGgB29cbDJ9OeQe/pr91xgDw4KNeagJokChrRYDGQehwWopb
 joJTI/A/yt4ANFm/ZKEeAHi4p7ncAaEKHtIUZEzjsl7XHaXYO13azqkm1Tvi7r1zaJ56S64PxMg
 J833LSfH9fHGQpf8e/HFl1ynSYRKJ+NAPFBHdPeh29lnc/exjgTa/saCS2qso7FIfq86oqK/qvy
 eu/8xw1DPa/MxJ/Ht1cc7scNbO7IXAbnT6QODMvv2s9kAe5zSXJoZbYq575FENrbBjxzrjHxOmd
 r8kONtJY8Wo4yDvBiiw==
X-Proofpoint-ORIG-GUID: 3N3D5nlQqCD-cDZqHulewp7wPBAgzb1d
X-Proofpoint-GUID: 3N3D5nlQqCD-cDZqHulewp7wPBAgzb1d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190103
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,siliconsignals.io,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,raspberrypi.com,windriver.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56335-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	RCVD_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtv.org:url,windriver.com:dkim,windriver.com:email,windriver.com:mid]
X-Rspamd-Queue-Id: 686992CBBA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add V4L2_CID_TEST_PATTERN control with bar and solid white patterns.
Since the OV9282 is a monochrome sensor, white is more useful than
black for solid pattern testing.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---

Changes in v3:
 - Move OV9282_TEST_PATTERN_SOLID_DEFAULT out of the ternary operator
   since it is unconditional (Sakari)
 Link to v2: https://patchwork.linuxtv.org/project/linux-media/patch/20260318051618.471375-1-xiaolei.wang@windriver.com/

Changes in v2:
 - Rename to "Bar" / "Solid White" since OV9282 is a monochrome
   sensor (Dave)
 - Use cci_write instead of cci_update_bits (Dave)
 - Default solid pattern to white (Dave)
 Link to v1: https://patchwork.linuxtv.org/project/linux-media/patch/20260316090558.1537823-1-xiaolei.wang@windriver.com/

 drivers/media/i2c/ov9282.c | 61 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 2167fb73ea41..b2fcee5c0be1 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -104,6 +104,17 @@
 #define OV9282_REG_STROBE_FRAME_SPAN		CCI_REG32(0x3925)
 #define OV9282_STROBE_FRAME_SPAN_DEFAULT	0x0000001a
 
+/* Test Pattern registers */
+#define OV9282_REG_TEST_PATTERN_BAR	CCI_REG8(0x5e00)
+#define OV9282_TEST_PATTERN_BAR_EN	BIT(7)
+#define OV9282_REG_TEST_PATTERN_SOLID	CCI_REG8(0x4320)
+#define OV9282_TEST_PATTERN_SOLID_EN	BIT(1)
+#define OV9282_TEST_PATTERN_SOLID_DEFAULT	0x80
+#define OV9282_REG_SOLID_P1		CCI_REG16(0x4322)
+#define OV9282_REG_SOLID_P2		CCI_REG16(0x4324)
+#define OV9282_REG_SOLID_P3		CCI_REG16(0x4328)
+#define OV9282_REG_SOLID_P4		CCI_REG16(0x4326)
+
 /* Input clock rate */
 #define OV9282_INCLK_RATE	24000000
 
@@ -462,6 +473,18 @@ static const struct ov9282_mode supported_modes[] = {
 	},
 };
 
+enum {
+	OV9282_TEST_PATTERN_DISABLED,
+	OV9282_TEST_PATTERN_BAR,
+	OV9282_TEST_PATTERN_SOLID_WHITE,
+};
+
+static const char * const ov9282_test_pattern_menu[] = {
+	"Disabled",
+	"Bar",
+	"Solid White",
+};
+
 /**
  * to_ov9282() - ov9282 V4L2 sub-device to ov9282 device.
  * @subdev: pointer to ov9282 V4L2 sub-device
@@ -586,6 +609,32 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
 	return DIV_ROUND_UP(value * frame_width, OV9282_STROBE_SPAN_FACTOR);
 }
 
+static int ov9282_set_ctrl_test_pattern(struct ov9282 *ov9282, int pattern)
+{
+	int ret;
+
+	ret = cci_write(ov9282->regmap, OV9282_REG_TEST_PATTERN_BAR,
+			pattern == OV9282_TEST_PATTERN_BAR ?
+			OV9282_TEST_PATTERN_BAR_EN : 0, NULL);
+	if (ret)
+		return ret;
+
+	if (pattern == OV9282_TEST_PATTERN_SOLID_WHITE) {
+		/* Set all four pixel values to 0x3ff (white) */
+		cci_write(ov9282->regmap, OV9282_REG_SOLID_P1, 0x3ff, &ret);
+		cci_write(ov9282->regmap, OV9282_REG_SOLID_P2, 0x3ff, &ret);
+		cci_write(ov9282->regmap, OV9282_REG_SOLID_P3, 0x3ff, &ret);
+		cci_write(ov9282->regmap, OV9282_REG_SOLID_P4, 0x3ff, &ret);
+		if (ret)
+			return ret;
+	}
+
+	return cci_write(ov9282->regmap, OV9282_REG_TEST_PATTERN_SOLID,
+			 OV9282_TEST_PATTERN_SOLID_DEFAULT |
+			 (pattern == OV9282_TEST_PATTERN_SOLID_WHITE ?
+			 OV9282_TEST_PATTERN_SOLID_EN : 0), NULL);
+}
+
 /**
  * ov9282_set_ctrl() - Set subdevice control
  * @ctrl: pointer to v4l2_ctrl structure
@@ -662,6 +711,11 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_FLASH_DURATION:
 		ret = cci_write(ov9282->regmap, OV9282_REG_STROBE_FRAME_SPAN, ctrl->val, NULL);
 		break;
+
+	case V4L2_CID_TEST_PATTERN:
+		ret = ov9282_set_ctrl_test_pattern(ov9282, ctrl->val);
+		break;
+
 	default:
 		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
 		ret = -EINVAL;
@@ -1242,7 +1296,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	u32 lpfr;
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 13);
 	if (ret)
 		return ret;
 
@@ -1314,6 +1368,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 				  V4L2_CID_FLASH_DURATION, 0, exposure_us, 1,
 				  OV9282_STROBE_FRAME_SPAN_DEFAULT);
 
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov9282_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(ov9282_test_pattern_menu) - 1,
+				     0, 0, ov9282_test_pattern_menu);
+
 	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
 	if (!ret) {
 		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
-- 
2.43.0


