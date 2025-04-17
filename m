Return-Path: <linux-media+bounces-30431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E69BA915B5
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 09:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF01C3A8B46
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 07:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6873521D3E6;
	Thu, 17 Apr 2025 07:49:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EDE21C9F3
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 07:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876198; cv=fail; b=DN4x1IGqpmQXHWG1eJQT1fYcJ0zBieyzEiob5BNX68h2Z39s2SdgO+zGb984KkMIuX//1NpGIQ/c/XBSmRsVgFZKrrWOp9aKYjDE2fF+vgiV7QudItjDg9dLTWuTsMIorhK0xtNrjjKnRfs2ICWSGcd+MBG97PFxQG92BVbFt9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876198; c=relaxed/simple;
	bh=I4LIM4xi2bv+nSwPPoq1anjCY3dNETRQVof/vA9doxY=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VMjUHKu9O9xxYpQy7std0CUx8xO6pkDb/xiga03CWWubpuXiy+0srAVe/QeLP5rezV67GEuzdo2sMkgMmlRpDbfMgNhcZ0cfMVdo36zMtZ+PL0m2PyX8xSB9hZHae4o/QrbMD0DY40jbebaF2Kxnou1mvXdWhR+mNf6ER+JaVw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H6A2oq001881
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 00:49:55 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2049.outbound.protection.outlook.com [104.47.55.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ykf3nu9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 00:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wC7rTs5OrGid8SyzhPnGVpj6mteBuzdZo1D1wX+kASLrHroR0UDg5Lb6Phng6RQmt7Hm7FvhwBRHSYRgjruLy1d2EkSLVf3pZKXeHzMNwFnNa0Kt0UoRD1mqfyaM0ldsngMcmpfZbA9Zmqj/tSAiotfK5ZQTAYEHYCbOzlackfCdivAxE134GzyM4odItYw3vXrEf+ZL1w+AvswpXncyXHVRIySOZIIMQC3a4lD2IildbJK69vzgTaRE1AU4JuJ6yQNBb8PnB+wRZ+cysqnoPRzGpfx02jlWfRSedUnuZdr0ZXPqM2Pq4QDZu6rO13hdu/xG37pUs+Oqe8bwoBxvgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4LIM4xi2bv+nSwPPoq1anjCY3dNETRQVof/vA9doxY=;
 b=ln+LU2Cbc9VAq2MnVBwxRMWiM0esGQD89LIbhlr3QPAF/PTEMd1X+z99mY4swwgNDnVTUx7mGJrhsZmhdBfYioQMCHq0t/R7X6Oj/Q+hDyW7atU0hAfnBJ1wzafil6wBYY1aeGTouh5kttao3h8cCTjapjf+YOGWgq60cY5PXoPAid+GiO/L4xP8wZqk5OnScqMBHOXkXz2DmXu0Bb9jqKuLrZETYyCat1XYpwsCYu+jW+YcpSyWIqHloopfSUxC0xCQdsglAf8aog9VdNt6EqKXuRyAdX8FZfqoloPI+Ae5tTsjPqLRvAlSDgfeexHn4lTk6dE/jc2LPFkTVcfY0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12)
 by DS0PR11MB7970.namprd11.prod.outlook.com (2603:10b6:8:121::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 07:49:51 +0000
Received: from PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840]) by PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840%5]) with mapi id 15.20.8632.025; Thu, 17 Apr 2025
 07:49:50 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: Query regarding v4l-utils support for 2038 functionality
Thread-Topic: Query regarding v4l-utils support for 2038 functionality
Thread-Index: Aduvaca/s5rYNBopRzmw/A3E0URKAQAAoWFAAAAcIsA=
Date: Thu, 17 Apr 2025 07:49:50 +0000
Message-ID:
 <PH8PR11MB6928706D44239293EA4C73C3B8BC2@PH8PR11MB6928.namprd11.prod.outlook.com>
References:
 <PH8PR11MB692818B58CB9B2C981DF61FAB8BC2@PH8PR11MB6928.namprd11.prod.outlook.com>
 <PH8PR11MB692863CE9CB8A2396EDDE9A6B8BC2@PH8PR11MB6928.namprd11.prod.outlook.com>
In-Reply-To:
 <PH8PR11MB692863CE9CB8A2396EDDE9A6B8BC2@PH8PR11MB6928.namprd11.prod.outlook.com>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6928:EE_|DS0PR11MB7970:EE_
x-ms-office365-filtering-correlation-id: a30f80d2-802e-4633-e970-08dd7d846ee7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?WWzccZcoDlsG66Evf43Zh2ZmXMchgTYXZvakGYELkidmobJLrdLSaqIO3C/y?=
 =?us-ascii?Q?YBteQx3qJoeVhWhinPcQ/n4xKhEXUghjFdf+jQWETr/fmvP8N7hlMQCLS8pd?=
 =?us-ascii?Q?3DoebBDVPs7XPahKlkWi4yykyX42K9eUMttc6JX4GYLceMO9bdMPRzKfC4gY?=
 =?us-ascii?Q?4iQ2V2/f4lDBayEoIQgN0njUOhz1Cg8xInnGvz6VT+tmK7iI4fU8BS2YxKwO?=
 =?us-ascii?Q?9e7NKKo2d63t3x8aYE+zTZc7ifav4rXiK/Uu+eQesRXoSZWkSvAOcLtOgvV4?=
 =?us-ascii?Q?RqbUjGRKeWOtHkN+bqCCOY2VTCGi8B9fUeoHuzm4e+ZVv2sD5qpAH5Y7vSY2?=
 =?us-ascii?Q?U4s34mGOGyGzjO7roJwrI6+Y23rdB6YIY3t41Nm5Yj6vd3XbAOnXfbBSgWSA?=
 =?us-ascii?Q?iZcUnUB/3NXQ9zXIA/aCXpCFRYI/O1IFHW1V8TRCYP17yszE3xGIQu68efMp?=
 =?us-ascii?Q?ZizMYMsEiydoxolC3e2gAdGhgmRqjrmfdH5vbrBGPufXprBCuCFDaemZ2KUz?=
 =?us-ascii?Q?KOma4+hohAUfQ5qLQ0e55jyqnzbmQWW6NoPrm7LPA4bQb/eNn6E0PB+pzaJy?=
 =?us-ascii?Q?HNkNFjLSZIWeZFl+P8/WDA9YuCDygLeJUkdWLI6j+hv15/LiE+aFlfNU/goY?=
 =?us-ascii?Q?ivGwK4354auwl1A1EANcgHeLGH5Xee5V9qI7yGbrAtaAIpHSvv7g8fmW64uw?=
 =?us-ascii?Q?L4ob4xSjhneHFhsCQrfbWRN2j9RIcjLvAU+M6v6daREDkj42ghuPYMuugGSl?=
 =?us-ascii?Q?fvdN5pMsF5whZKOYgMOhapRcMWcWt1+OSg+0LjjBCx99L8YFAYZthim30e2k?=
 =?us-ascii?Q?AtZoCZP99sZjCyKfeK4YE+HLh6CT45XLO4vovddosWdIdKwu8LY8qmts/Doa?=
 =?us-ascii?Q?553wgDmsFfasudGDFINy8ppVR3pM1R6xR9zx7snpBlhI+vjOqsTN9qcWaAL4?=
 =?us-ascii?Q?Y0WuUOnTVkjWH3/yoIE4CiZlZYq1M8ndMKpiVXSwi9m/mUzraNm/6TF1btMn?=
 =?us-ascii?Q?BIs1UOYo9PqCzJIpFtv2iUU/Go+5whRHL1fT/zqYqiD4YLTd2okYT+FeAkzK?=
 =?us-ascii?Q?Bpm7+56hcZI+hAImKPNEgdJ3P4Co6JEkgtoifgSoyRx7slODvu9yLlhjaa8S?=
 =?us-ascii?Q?5g5HjQvwpqPRrH+eFaGedhML0xC6uhm4vKFsXzsdoSbq8K+Xj3TgYJmr6AJ8?=
 =?us-ascii?Q?wRpwTfgLanLOjSEh6ODxY79JcTss1jHiwjHKvGFRAcNvbkJIzZf6K8osEk/G?=
 =?us-ascii?Q?M1aOljvhGK4dMdBrqZ8XiapLeVPTxUp+Fr8TEy9MLDxiiHqO3ukU3YZGQXXa?=
 =?us-ascii?Q?qQFeayFmuGza1qoMnWX9YfDIE3Wb6g4gkreME4F98WvrTvvcyLZachtIL6MF?=
 =?us-ascii?Q?ZSx58Ej43fcs/CQJBPFCVphgp4cWKou91aXLsWXpKzy2gRAofYYFeVzGcuxT?=
 =?us-ascii?Q?mCrDf3HiX1e+VHKokU+DGqs2GD4eYd+2PInPsi6r63nw5gBJl/w2xQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6928.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0cBgKjFEsOdQtLqVfI34ffvjfmJwBYOD1L7PmgjvA7aiiLP27sktAEYUb6xn?=
 =?us-ascii?Q?EdOl9sxkcpwY60WqA+lmMlO07VCkv5ptzeT31Oudh0TF0T9zVvzHWGSvxz/x?=
 =?us-ascii?Q?LA77QMN6Vm+tWTHzVCqsHiSfOoMeO+ko2dlRMbNTkJbxDV0ry/lNrJI+7rm8?=
 =?us-ascii?Q?HH+KEgGAywwAEnpSC0n/AKtc3CAoPV1jFXWUGgpgzqFrX2G6RD4+faRaikHy?=
 =?us-ascii?Q?dFc7v1jpR2bk8m9BTcUmU4Ojb7y+3GTnSfGYMhAnv/QtvV175LGfVjyJlVhc?=
 =?us-ascii?Q?efJzBr2ait11wKFE31aWT/g1vwKDvurEc5Q4NVSWhwYFZ+z7keF3924wlJQU?=
 =?us-ascii?Q?jCaskrB+JFjNeqtyGhol3fY4XqbzPU+wmgJijCcTmhACedv3zBoYO+j2cEIv?=
 =?us-ascii?Q?LbyHl5DcUBgX3fa5JHIIb1sxt/UqElNg59BQV2GvrPfYnDfIaxQqkbP3nWJA?=
 =?us-ascii?Q?xiDHDZprTdk/dgTZ2S2Nw1GqzEMrw1eLxBbSj+TobVv6Rqfv3FQvEE+Qmn4g?=
 =?us-ascii?Q?0711nhWXx5kiTw1MNNS2z5oDSThQXM8vkGUpKha/ubz1xM+E3ZphECH3xnDo?=
 =?us-ascii?Q?LKZ1CKYjJ+/FwgzqbD2zxWubulCtWcGSQMyAqBpOMPqUI+8gBwQ1ch8Y0sV1?=
 =?us-ascii?Q?A+UMTguu0/QC8BsTazzr/5MBOX0Rej2gMhyB95tTEzUxni0msBksJVHFk43z?=
 =?us-ascii?Q?lJxjHHNLngi/XFjmh/9eu7PspdHlopj1SUGoPb8PQ85ibuyuDRoD2UsuwL0E?=
 =?us-ascii?Q?MFXgw6nvayNk87kpO0WKNNgirDChQfRQ9NwpitSBP9apNGKJ6rVjRBG3JTnZ?=
 =?us-ascii?Q?ggTII7vG6+tcqEZ7Q7HTwuDfyL3ay5Gft1q7dQaQwmT7Svq6oJ8th8mJ5vnn?=
 =?us-ascii?Q?6168lELkcpGO6FGfTvC18UYO6R8niw7CQcz+wsQG1AEukv2BxQHK6y1RLufG?=
 =?us-ascii?Q?Iio4F7ebf0bcodQYtgZy45YEP9pbMsl5hS0Vm40TzQnQbd72X+B3OSp+QzJS?=
 =?us-ascii?Q?BiFuvxlFkB/5KsZGgnzjUQeph9TxuknzYnPjbDe9WomgKgXtdTBNrSix8PQ0?=
 =?us-ascii?Q?8uGY+0QWCRncqzDDlyt+z4SRJxC08scTBWWYp1kYvlRaRZo8gdW3cyqkxkBo?=
 =?us-ascii?Q?Pcs0wqQOshU4A33emjAMHUeOzjvmuep22w8mO9/qfy2lsVhUYsvatsZ2FloW?=
 =?us-ascii?Q?79dKG+2UyTzyGms0u+YmQ9O++OZu9/LEphPUIasKzrN7s48xzJSf+HSLmUb4?=
 =?us-ascii?Q?YBz+WSlfBSucbzr6dFw36oTnnonYhPhHQSN9iw1o09HMIWH64c4WuUGNQH6o?=
 =?us-ascii?Q?5hYlUyQtauikTGw2gxa3bV3wsNACRPScmQ6x6zs1cvm4huvkvf3JV4UopckG?=
 =?us-ascii?Q?RJ/m9aYuWXW07WlulG1EmU4Iyv/5lPogWW2nDz+gfQ5R9nW+xXEgY2ds4p/5?=
 =?us-ascii?Q?nt9PrUXTxbM8Dfhx5L0RcWGwA1yXK1pFxuAI7/Vzy9eQgvyWvL075QyAztgQ?=
 =?us-ascii?Q?gAPhH5+gfrN/vYxJfEXdulX8lY337NEtuH3WhAQadoSU+CZQ+LMMwR7hPXCp?=
 =?us-ascii?Q?JPjHRTDD8OCYw67ct6/Ro4zs/ovRo1nJPjVOavc13PncaH57ZTMGfQ+smYny?=
 =?us-ascii?Q?gw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6928.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a30f80d2-802e-4633-e970-08dd7d846ee7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 07:49:50.6056
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9u8gam7AkMkVXul8VHMu/9jZI5DgbfoJk9Ywhmw5g6RFAeUl4ZbtnF32m0lyatT/CQw1BWcaBjYh3GZLCJ+Ks+2LC6EQhzt/azKGCL+ucUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7970
X-Proofpoint-ORIG-GUID: R1eFrmMOJs5fTTpzdN8gTD_IDfb2USoE
X-Authority-Analysis: v=2.4 cv=Wd0Ma1hX c=1 sm=1 tr=0 ts=6800b2a3 cx=c_pps a=OxY2RB2sa7x8oI2LU21LDQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=hKah5SDxlh-BZcmrQMEA:9 a=CjuIK1q_8ugA:10 a=zY0JdQc1-4EAyPf5TuXT:22
X-Proofpoint-GUID: R1eFrmMOJs5fTTpzdN8gTD_IDfb2USoE
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 mlxlogscore=886 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504170059

Dear Linux Media Team,

I am currently working with v4l-utils and would like to inquire whether the=
 utilities fully support the Y2038 functionality, or if there are any limit=
ations or known issues in the current release.

I would appreciate any clarification on this matter.

Thank you for your time and assistance.

Best regards,
Jiaying.


