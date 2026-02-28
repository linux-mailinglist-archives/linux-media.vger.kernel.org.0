Return-Path: <linux-media+bounces-53826-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HtkEf2oomkn4wQAu9opvQ
	(envelope-from <linux-media+bounces-53826-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:36:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8544D1C1709
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B9FDA302D6A8
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE683E9F78;
	Sat, 28 Feb 2026 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="iIFr6ZXT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168B32F3C0E;
	Sat, 28 Feb 2026 08:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267751; cv=fail; b=tD9VNauv9DHqrqKrR/Qo1NxKPiclFzCBmL/za+PI3ikmth8CsYykgspWV+yX+kt9Tegzqc/xB7TTFiDWJbZxcMwg22d43CI5BrjzKPZWQUbBVVlgwVYQae9ENn2PKOX0/FoEWLDK3qMrcWlVh6oMNZjxPdGd3jf+GD0qhuGtjrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267751; c=relaxed/simple;
	bh=PnRBduaifZmI+D20wh1lGg1JfSbbzPbEHCF87E9Cpi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uxOMGl6gMakZFx+ijyjBZ8GbUy4hXb7g88ezeXjdkfv8Eawl9bfMm2eQGqpe4CgL767MkjlNbWM5sPaHLnl5lUBPvyWog6N9SkfeqK4aZOYDQbWVI0MVKHvgcuyd2Dkt2GKikDZirFkzt3EBest2BQpLtdvLPlKd8D5cYZDAXio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=iIFr6ZXT; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S812cl1132896;
	Sat, 28 Feb 2026 00:34:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=s3vhElJT8hbgSt+3mrRP603kwZOr+QYR1J4EapcYTAc=; b=
	iIFr6ZXTJSBVKrjHWZid8qQ3BW3ss7iQQIIffi2g94VFwL1CDKX794AkIRlX4+aY
	YPjUWGrihZsi6UiRr/zSUq86wO9xF+4zoALl2yfdswN1zmn0VEGeSAfK+MvKNpL+
	8ahfkQidrypUw3AdbrVMrFawVzuwFZjv3v+jVc815m+a+F91Plbfw/EE3FFRKCbi
	iqmy+St7m0mechDg+AlUM2GI05KBAul9E+ubtEr0qpF79TG6HeSjEELuN8iezatl
	1XZTBO4GomR7R3JGXsag5fYf/4v8fp6HcInCI621HJOU8vCT5+apWGem0kKjTrx/
	fM2201Aqc3dXU4RG3LngJw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012036.outbound.protection.outlook.com [40.107.209.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdu2tyxy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 00:34:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSFI1Np9K8kZJGI3Z64dJ97BfYbUdDZN6KXrZSgh1k2g/sJhRtw+ebO5QN7EbhUok/e7wsnOgE0YUYhJWitDtICwaMoWiP1mnQI5coWPQ3gDq1b0aVwmceku7/qqnKn4RGPaoeDQvIf8vtcuEJkinTL+RtWyqew0kgv7iFgRzf93xljEUrNLMMFGkjRitXfDbpoJv8wMr5ryCY59vki0ah1yhdfoSoMoER4L4AUn1eI9ybnQSbOp2vEq1u7NGoXy8g8BoLo4OgEuLyPmoLX1cELy2VYY1DBKeqne9N+x5RVlzEvexR5sARduSVb9GoTLW41H85Zw+oBUJVE+hbAkpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3vhElJT8hbgSt+3mrRP603kwZOr+QYR1J4EapcYTAc=;
 b=GVtK46zXis5JCCqZqsfy3fwpHCwCvsxMDYSSL5lwFn3//58DhfJBvJ8QBdQgLgMgGjjYC3IBueJymmeD38IL2lcOqNV0jlTiaAKreS8eCkvhSFehl60q/HJcjdqee+5w3bo04RpY6kExnqdG6fXC1s4pPMkEN5uTPz+7zIW+n3fsPHrOjeDTNVXHDE1zQhdx1ZO4DzAJpE18cuIydx/mDNG3FHzqc5RdVWDiA6PT4ZDJmfqv7WXSDVw+uaF1MYdvPOJBczSWwP399qwSxPtrPZvupEqWCmHiKu5N3jGvtQ0O6x7Kb1H+ds8qC0ZZqB/qXswAz9sdkODRj2p0mXk+AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by PH3PPF67C992ECC.namprd11.prod.outlook.com
 (2603:10b6:518:1::d28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Sat, 28 Feb
 2026 08:34:42 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.014; Sat, 28 Feb 2026
 08:34:42 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, tarang.raval@siliconsignals.io,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, richard.leitner@linux.dev,
        Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: i2c: ov9282: Convert to CCI register access helpers
Date: Sat, 28 Feb 2026 16:33:59 +0800
Message-ID: <20260228083401.1007434-2-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228083401.1007434-1-xiaolei.wang@windriver.com>
References: <20260228083401.1007434-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0015.jpnprd01.prod.outlook.com (2603:1096:405::27)
 To DS4PPFD667CEBB6.namprd11.prod.outlook.com (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|PH3PPF67C992ECC:EE_
X-MS-Office365-Filtering-Correlation-Id: a644b2af-e40c-4973-5444-08de76a4382b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	YwZaUcEeoqQcnh1cMp4zRdZ8hhGCdjoGkM0IhyBqCBDe2C7W9WUV6idi23dULTIof2lVj2ILUoWG8PHWw+Pp76ULrnB5gdm0m59Kxix4pHMo+NlLgm1IjfsAHZyF0hKbaztC+2asmierFoVS1jXBypRt4DW4Tur+/0sDzcvHqqiUWX0LAmmWBVhOKQj6aAlgksn/f5ESVlfHt8KiCi2K31TrL1OKnce6CtvJjwyjyqJqAq4NQEq3Ik4FhpV/790IGFtRV5ZbROE/bwUunbRNeh3Ee/pZe1k6MzhCmS3DDPzoWypcXA2qmqXslNEkQ414BE3Wcz7nAiKqJlJ99+wKLq9NGDQRwvhSyMMjdQkqrQ0ZrFTJlfsg2x6tqo4dOcPgw/8qS7r/ld5r94ORfD1n7ItnV1JOjjUvmbTUXVN5SAIZHnzJ1jU0MX+DOovfbXWtutMvb1U5w+MGMAIJ6O/EIY8BKBShPYyhUXgCqDmv1A/KiaRgmfReHIWsbwFnztI9EZDpJbCP4H70hAMJC5fcQLjgQ/6eRDcEVMQS66NN03SORgZHde7QgxYnegQYE9lMlybwo3iHBRhf0e9rVD+bQENmk+v4Fx5nPatlsmQ899RV66YNMR7Hl8hFyVfrn+OkSsXLDCQEk1vYI3JIsf19UVcok6hbRXxSGP1DVjnyTOO4jaQeurmNyQuvk3n54CvFgdlu8AAYgPqqWQWRqyYj6g33gWFJZzJb0Ex5cgpVRL47Kn58ebcDElshcavQZ16yT5c9tONnwtackrMYLmP1IT41mis45Pv7fMacqQGM2Mo/18pyyfECP71GooTHP1qK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nOisax7gJIMeHor7ZkgGE78VSfo+xy3GEa7KUAe8J6sq0YowFRKP0PzXrXkT?=
 =?us-ascii?Q?NoKsKbO0B2gBEhNlkPVCEPgHe33YdS/2f8AGGWegeNkvBbwk+SuhTk4YvciI?=
 =?us-ascii?Q?G2KfLMXs/M8ioSVc8rXg1aiKWbgXeTXVYUSv0P1X0BcXf32ha/pumkYzYQT1?=
 =?us-ascii?Q?txhyOffL5MMKenCClqhC58FoXx0KesQ1PeBhww0VfcxyqSveP+1VqlcBhqfZ?=
 =?us-ascii?Q?L0oJfPwxfTog/jqW5n0WSj8ZZfE+ebxHTPxBlR5Lxy0sHRLe3sGmTLJeXcZ2?=
 =?us-ascii?Q?/ZAEqPhdb//ol1hUyyIn9X9YvJ2AJWHGBS4su9tZaghEM9G8eR+50UnDKOP7?=
 =?us-ascii?Q?wA2Ox9pxLbuISFqO5ZQYyy7u01L4a5owCjhtdWgWQuWsbFxqxcz4TKDVbbnm?=
 =?us-ascii?Q?vF2xzPbMJAbDbcNudIjMKaFVaMNmsk7W5on44xMejvJ0NAdK7qwb+JNODQ8r?=
 =?us-ascii?Q?TixoA8znaEwCTy4msJ00H6RLMCT8GJexp54/ce9bwxbBwzItJPQvfv98yRoo?=
 =?us-ascii?Q?w0RSCZdzI1S/By0X+rzDM1mGUNVuka4NhMp45qddL5zRR1gv+AJZqxQ6hLih?=
 =?us-ascii?Q?wEy0vM1QTRi+sh+ncgCmFg5aZ5YQjkSDBWdSoOZQh/GgOgXMQ0PkeIcdrKv3?=
 =?us-ascii?Q?nxsysvamIbf6kdxK6TsqKHGErzb1bmkNx3CbGTF3TXWUj1h24Otl+JTA+OwT?=
 =?us-ascii?Q?sgD3cG+DKbQOvpKQjBXLOBelYJn4//P6PD5j09YAoc4BgOtkHAWZ5Cl7X/0G?=
 =?us-ascii?Q?58vqlJ6RsyGBeV1O9h4slNSvJkE8P/N7txCORV6mNzL2SJTwdRF9Ij7RMQHr?=
 =?us-ascii?Q?0bgBc2CYR/X/q4B77+45LS7a8quEbebpFJHoh3HtosSdL0GFfPOu0jdxbhmr?=
 =?us-ascii?Q?VatI+oGW+u6rs9GN2jzLj+nYe83LF5EEmmQFZhg5PkJMj43UrR1s2xMnT6fP?=
 =?us-ascii?Q?YDRnr1qfZigOSnZ78sKWbKbZRKFS/w/nbeM8QWBFSS0GC1kN0nQv+eSGFG36?=
 =?us-ascii?Q?flExAKe/HWM5eDFFO8oqvN+0UVKK6Qjyp8VyYkUBouesGtM4JqoaYyx1bZuz?=
 =?us-ascii?Q?6grNf8kQ4DlBAYFMRrZSoQJ9nq58yP4cD+B6iDSuwEKwiLkfewNUh0hU+lwb?=
 =?us-ascii?Q?JnICrHYitYRkESB7HwXjBMwMHK8hqYFj+LVmactmqCeRA8bF4p0XqfAIozuA?=
 =?us-ascii?Q?JAAuj6a2n49cLv8EbhKiWc5APJP1TFKi3rauhW/GDKq0SqRsVlxrMe5aIsaa?=
 =?us-ascii?Q?U0rtZXu4aH2v737zYshpWLZejlibvq4w68yFRmY/H1KIP/AhQ6wL6JWBYH43?=
 =?us-ascii?Q?SWkwmA/miif9FSMUYEpQkcDxPNT1kGJqdfENQfuSUk075qquOXnWnELIdupY?=
 =?us-ascii?Q?1eTKGOspLQ0HsivtpGBqHfu7c3LKF6OBIfU8x8oBCX8IgKcdFo7kKZnmse8N?=
 =?us-ascii?Q?t/r6WG46hTZpe1v7F75CxKOqEIx6WvEzJp0QqO+Vq8g7ZYsjSCdWJwdGfwtB?=
 =?us-ascii?Q?qOv07padXfAxFWIgJ7rqEJHc2mKiEcQObjcSK9Uj7b+ImRgpaHrzectzhBVK?=
 =?us-ascii?Q?Ltz9ibj4cLy4BdkGPmCQqLayDtIjcyM8poxhXHzifEsJ/ZeRkI18LXnYoUXN?=
 =?us-ascii?Q?YayOQxKmMZ0GX8a4rK5HOiQMwKSu7XywSXKLXOxxAYREm6dZ1hFS9Qq+bHwn?=
 =?us-ascii?Q?Q+8aai8zbNe2G5VIwOqq30AK9Cts9d2CzzApyN8k3sKn6NwmUG5zL4xkNznY?=
 =?us-ascii?Q?KQYh6Tq0Xknv8rtZvbITLVEvN9VFyco=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a644b2af-e40c-4973-5444-08de76a4382b
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 08:34:42.5226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQKRA8uzM04ItrCbPfudZ/H5lww9ya4IQq8sL6ybUr/7owS3kOYM95e4LQZRrqTL/iYH54il4Wgr1QYd7ScM6vJzqzzhwEIMgUqoInLlSEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF67C992ECC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA3OCBTYWx0ZWRfXzNrt4XRqIC5L
 Llcx1EpnXpn3vYgMOym44rIi3V8subq2HJ7PAa2KaEvE94Tg6alMqt87KOeyNY9aNi15afmJ4MY
 3+8k08huuld12j4vjVJRjZjm1t/RL6ABRSccS1dz51jbAXnHE6hUkPaDvKe00i6mi87U2EF5+SS
 ETLyr1j7K4LyIAhdb5DAricZxlme91syTZ0zMTMoqv6Os14tUnuCVp4vqz/10AhsQsfv5H8WWdZ
 sdgDqXYkOaHkB2Ustr8lrPsK363n17/o1LZn5ORoEeGFioUyCYhG8RYxFnlEVugfHMwMVh7K+uN
 94yZISLcr/RGl+UWBNrw72WnRWf/Zr7ks8ROD+32trVuZiV3YutRW0ZSNdg2UvTRz5V7oY/Idhs
 RxuAPXma16HMs7WGpur6mCd96AIyNdcMi25kqW8GcbQjOjxncGB9NRnodw/fri+tzvF/7vLwXDm
 e99dZepYeNslS18F6Ig==
X-Authority-Analysis: v=2.4 cv=WpMm8Nfv c=1 sm=1 tr=0 ts=69a2a8a4 cx=c_pps
 a=1PQ19NIIScYLh/jfzFkFww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=F-GWxTvL4KY9s68XaQkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Xnw6vg2c3zx-RDvO4_GxL2gUIwXtnxYo
X-Proofpoint-GUID: Xnw6vg2c3zx-RDvO4_GxL2gUIwXtnxYo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,siliconsignals.io,ideasonboard.com,raspberrypi.com,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,linux.dev,windriver.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53826-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	DBL_BLOCKED_OPENRESOLVER(0.00)[windriver.com:mid,windriver.com:dkim,windriver.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8544D1C1709
X-Rspamd-Action: no action

Use the new common CCI register access helpers to replace the private
register access helpers in the ov9282 driver. This simplifies the driver
by reducing the amount of code.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov9282.c | 290 ++++++++-----------------------------
 2 files changed, 62 insertions(+), 229 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 5eb1e0e0a87a..3027e71fd8fb 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -690,6 +690,7 @@ config VIDEO_OV8865
 config VIDEO_OV9282
 	tristate "OmniVision OV9282 sensor support"
 	depends on OF_GPIO
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV9282 camera sensor.
diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index ded9b2044ff8..75e41a0f588e 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -12,38 +12,40 @@
 #include <linux/math.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
 /* Streaming Mode */
-#define OV9282_REG_MODE_SELECT	0x0100
+#define OV9282_REG_MODE_SELECT	CCI_REG8(0x0100)
 #define OV9282_MODE_STANDBY	0x00
 #define OV9282_MODE_STREAMING	0x01
 
-#define OV9282_REG_PLL_CTRL_0D	0x030d
+#define OV9282_REG_PLL_CTRL_0D	CCI_REG8(0x030d)
 #define OV9282_PLL_CTRL_0D_RAW8		0x60
 #define OV9282_PLL_CTRL_0D_RAW10	0x50
 
-#define OV9282_REG_TIMING_HTS	0x380c
+#define OV9282_REG_TIMING_HTS	CCI_REG16(0x380c)
 #define OV9282_TIMING_HTS_MAX	0x7fff
 
 /* Lines per frame */
-#define OV9282_REG_LPFR		0x380e
+#define OV9282_REG_LPFR		CCI_REG16(0x380e)
 
 /* Chip ID */
-#define OV9282_REG_ID		0x300a
+#define OV9282_REG_ID		CCI_REG16(0x300a)
 #define OV9282_ID		0x9281
 
 /* Output enable registers */
-#define OV9282_REG_OUTPUT_ENABLE4	0x3004
+#define OV9282_REG_OUTPUT_ENABLE4	CCI_REG8(0x3004)
 #define OV9282_OUTPUT_ENABLE4_GPIO2	BIT(1)
 #define OV9282_OUTPUT_ENABLE4_D9	BIT(0)
 
-#define OV9282_REG_OUTPUT_ENABLE5	0x3005
+#define OV9282_REG_OUTPUT_ENABLE5	CCI_REG8(0x3005)
 #define OV9282_OUTPUT_ENABLE5_D8	BIT(7)
 #define OV9282_OUTPUT_ENABLE5_D7	BIT(6)
 #define OV9282_OUTPUT_ENABLE5_D6	BIT(5)
@@ -53,7 +55,7 @@
 #define OV9282_OUTPUT_ENABLE5_D2	BIT(1)
 #define OV9282_OUTPUT_ENABLE5_D1	BIT(0)
 
-#define OV9282_REG_OUTPUT_ENABLE6	0x3006
+#define OV9282_REG_OUTPUT_ENABLE6	CCI_REG8(0x3006)
 #define OV9282_OUTPUT_ENABLE6_D0	BIT(7)
 #define OV9282_OUTPUT_ENABLE6_PCLK	BIT(6)
 #define OV9282_OUTPUT_ENABLE6_HREF	BIT(5)
@@ -62,14 +64,14 @@
 #define OV9282_OUTPUT_ENABLE6_VSYNC	BIT(1)
 
 /* Exposure control */
-#define OV9282_REG_EXPOSURE	0x3500
+#define OV9282_REG_EXPOSURE	CCI_REG24(0x3500)
 #define OV9282_EXPOSURE_MIN	1
 #define OV9282_EXPOSURE_OFFSET	25
 #define OV9282_EXPOSURE_STEP	1
 #define OV9282_EXPOSURE_DEFAULT	0x0282
 
 /* AEC/AGC manual */
-#define OV9282_REG_AEC_MANUAL		0x3503
+#define OV9282_REG_AEC_MANUAL		CCI_REG8(0x3503)
 #define OV9282_DIGFRAC_GAIN_DELAY	BIT(6)
 #define OV9282_GAIN_CHANGE_DELAY	BIT(5)
 #define OV9282_GAIN_DELAY		BIT(4)
@@ -78,28 +80,28 @@
 #define OV9282_AEC_MANUAL_DEFAULT	0x00
 
 /* Analog gain control */
-#define OV9282_REG_AGAIN	0x3509
+#define OV9282_REG_AGAIN	CCI_REG8(0x3509)
 #define OV9282_AGAIN_MIN	0x10
 #define OV9282_AGAIN_MAX	0xff
 #define OV9282_AGAIN_STEP	1
 #define OV9282_AGAIN_DEFAULT	0x10
 
 /* Group hold register */
-#define OV9282_REG_HOLD		0x3308
+#define OV9282_REG_HOLD		CCI_REG8(0x3308)
 
-#define OV9282_REG_ANA_CORE_2	0x3662
+#define OV9282_REG_ANA_CORE_2	CCI_REG8(0x3662)
 #define OV9282_ANA_CORE2_RAW8	0x07
 #define OV9282_ANA_CORE2_RAW10	0x05
 
-#define OV9282_REG_TIMING_FORMAT_1	0x3820
-#define OV9282_REG_TIMING_FORMAT_2	0x3821
+#define OV9282_REG_TIMING_FORMAT_1	CCI_REG8(0x3820)
+#define OV9282_REG_TIMING_FORMAT_2	CCI_REG8(0x3821)
 #define OV9282_FLIP_BIT			BIT(2)
 
-#define OV9282_REG_MIPI_CTRL00	0x4800
+#define OV9282_REG_MIPI_CTRL00	CCI_REG8(0x4800)
 #define OV9282_GATED_CLOCK	BIT(5)
 
 /* Flash/Strobe control registers */
-#define OV9282_REG_STROBE_FRAME_SPAN		0x3925
+#define OV9282_REG_STROBE_FRAME_SPAN		CCI_REG32(0x3925)
 #define OV9282_STROBE_FRAME_SPAN_DEFAULT	0x0000001a
 
 /* Input clock rate */
@@ -139,16 +141,6 @@ static const char * const ov9282_supply_names[] = {
 
 #define OV9282_NUM_SUPPLIES ARRAY_SIZE(ov9282_supply_names)
 
-/**
- * struct ov9282_reg - ov9282 sensor register
- * @address: Register address
- * @val: Register value
- */
-struct ov9282_reg {
-	u16 address;
-	u8 val;
-};
-
 /**
  * struct ov9282_reg_list - ov9282 sensor register list
  * @num_of_regs: Number of registers in the list
@@ -156,7 +148,7 @@ struct ov9282_reg {
  */
 struct ov9282_reg_list {
 	u32 num_of_regs;
-	const struct ov9282_reg *regs;
+	const struct reg_sequence *regs;
 };
 
 /**
@@ -209,6 +201,7 @@ struct ov9282_mode {
 struct ov9282 {
 	struct device *dev;
 	struct v4l2_subdev sd;
+	struct regmap *regmap;
 	struct media_pad pad;
 	struct gpio_desc *reset_gpio;
 	struct clk *inclk;
@@ -241,7 +234,7 @@ static const s64 link_freq[] = {
  * register arrays as some settings are written as part of ov9282_power_on,
  * and the reset will clear them.
  */
-static const struct ov9282_reg common_regs[] = {
+static const struct reg_sequence common_regs[] = {
 	{0x0302, 0x32},
 	{0x030e, 0x02},
 	{0x3001, 0x00},
@@ -305,11 +298,6 @@ static const struct ov9282_reg common_regs[] = {
 	{0x5a08, 0x84},
 };
 
-static struct ov9282_reg_list common_regs_list = {
-	.num_of_regs = ARRAY_SIZE(common_regs),
-	.regs = common_regs,
-};
-
 #define MODE_1280_800		0
 #define MODE_1280_720		1
 #define MODE_640_400		2
@@ -317,7 +305,7 @@ static struct ov9282_reg_list common_regs_list = {
 #define DEFAULT_MODE		MODE_1280_720
 
 /* Sensor mode registers */
-static const struct ov9282_reg mode_1280x800_regs[] = {
+static const struct reg_sequence mode_1280x800_regs[] = {
 	{0x3778, 0x00},
 	{0x3800, 0x00},
 	{0x3801, 0x00},
@@ -348,7 +336,7 @@ static const struct ov9282_reg mode_1280x800_regs[] = {
 	{0x4509, 0x00},
 };
 
-static const struct ov9282_reg mode_1280x720_regs[] = {
+static const struct reg_sequence mode_1280x720_regs[] = {
 	{0x3778, 0x00},
 	{0x3800, 0x00},
 	{0x3801, 0x00},
@@ -379,7 +367,7 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
 	{0x4509, 0x80},
 };
 
-static const struct ov9282_reg mode_640x400_regs[] = {
+static const struct reg_sequence mode_640x400_regs[] = {
 	{0x3778, 0x10},
 	{0x3800, 0x00},
 	{0x3801, 0x00},
@@ -485,97 +473,6 @@ static inline struct ov9282 *to_ov9282(struct v4l2_subdev *subdev)
 	return container_of(subdev, struct ov9282, sd);
 }
 
-/**
- * ov9282_read_reg() - Read registers.
- * @ov9282: pointer to ov9282 device
- * @reg: register address
- * @len: length of bytes to read. Max supported bytes is 4
- * @val: pointer to register value to be filled.
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_read_reg(struct ov9282 *ov9282, u16 reg, u32 len, u32 *val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&ov9282->sd);
-	struct i2c_msg msgs[2] = {0};
-	u8 addr_buf[2] = {0};
-	u8 data_buf[4] = {0};
-	int ret;
-
-	if (WARN_ON(len > 4))
-		return -EINVAL;
-
-	put_unaligned_be16(reg, addr_buf);
-
-	/* Write register address */
-	msgs[0].addr = client->addr;
-	msgs[0].flags = 0;
-	msgs[0].len = ARRAY_SIZE(addr_buf);
-	msgs[0].buf = addr_buf;
-
-	/* Read data from register */
-	msgs[1].addr = client->addr;
-	msgs[1].flags = I2C_M_RD;
-	msgs[1].len = len;
-	msgs[1].buf = &data_buf[4 - len];
-
-	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
-	if (ret != ARRAY_SIZE(msgs))
-		return -EIO;
-
-	*val = get_unaligned_be32(data_buf);
-
-	return 0;
-}
-
-/**
- * ov9282_write_reg() - Write register
- * @ov9282: pointer to ov9282 device
- * @reg: register address
- * @len: length of bytes. Max supported bytes is 4
- * @val: register value
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_write_reg(struct ov9282 *ov9282, u16 reg, u32 len, u32 val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&ov9282->sd);
-	u8 buf[6] = {0};
-
-	if (WARN_ON(len > 4))
-		return -EINVAL;
-
-	put_unaligned_be16(reg, buf);
-	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
-	if (i2c_master_send(client, buf, len + 2) != len + 2)
-		return -EIO;
-
-	return 0;
-}
-
-/**
- * ov9282_write_regs() - Write a list of registers
- * @ov9282: pointer to ov9282 device
- * @regs: list of registers to be written
- * @len: length of registers array
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_write_regs(struct ov9282 *ov9282,
-			     const struct ov9282_reg *regs, u32 len)
-{
-	unsigned int i;
-	int ret;
-
-	for (i = 0; i < len; i++) {
-		ret = ov9282_write_reg(ov9282, regs[i].address, 1, regs[i].val);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 /**
  * ov9282_update_controls() - Update control ranges based on streaming mode
  * @ov9282: pointer to ov9282 device
@@ -639,15 +536,15 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
 	dev_dbg(ov9282->dev, "Set exp %u (~%u us), analog gain %u",
 		exposure, exposure_us, gain);
 
-	ret = ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 1);
+	ret = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0x01, NULL);
 	if (ret)
 		return ret;
 
-	ret = ov9282_write_reg(ov9282, OV9282_REG_EXPOSURE, 3, exposure << 4);
+	ret = cci_write(ov9282->regmap, OV9282_REG_EXPOSURE, exposure << 4, NULL);
 	if (ret)
 		goto error_release_group_hold;
 
-	ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, gain);
+	ret = cci_write(ov9282->regmap, OV9282_REG_AGAIN, gain, NULL);
 	if (ret)
 		goto error_release_group_hold;
 
@@ -656,62 +553,11 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
 				       OV9282_STROBE_FRAME_SPAN_DEFAULT);
 
 error_release_group_hold:
-	ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 0);
+	cci_write(ov9282->regmap, OV9282_REG_HOLD, 0, NULL);
 
 	return ret;
 }
 
-static int ov9282_set_ctrl_hflip(struct ov9282 *ov9282, int value)
-{
-	u32 current_val;
-	int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
-				  &current_val);
-	if (ret)
-		return ret;
-
-	if (value)
-		current_val |= OV9282_FLIP_BIT;
-	else
-		current_val &= ~OV9282_FLIP_BIT;
-
-	return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
-				current_val);
-}
-
-static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
-{
-	u32 current_val;
-	int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_1, 1,
-				  &current_val);
-	if (ret)
-		return ret;
-
-	if (value)
-		current_val |= OV9282_FLIP_BIT;
-	else
-		current_val &= ~OV9282_FLIP_BIT;
-
-	return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_1, 1,
-				current_val);
-}
-
-static int ov9282_set_ctrl_flash_strobe_oe(struct ov9282 *ov9282, bool enable)
-{
-	u32 current_val;
-	int ret;
-
-	ret = ov9282_read_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1, &current_val);
-	if (ret)
-		return ret;
-
-	if (enable)
-		current_val |= OV9282_OUTPUT_ENABLE6_STROBE;
-	else
-		current_val &= ~OV9282_OUTPUT_ENABLE6_STROBE;
-
-	return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1, current_val);
-}
-
 static u32 ov9282_us_to_flash_duration(struct ov9282 *ov9282, u32 value)
 {
 	/*
@@ -740,30 +586,6 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
 	return DIV_ROUND_UP(value * frame_width, OV9282_STROBE_SPAN_FACTOR);
 }
 
-static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
-{
-	u32 val = ov9282_us_to_flash_duration(ov9282, value);
-	int ret;
-
-	ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN, 1,
-			       (val >> 24) & 0xff);
-	if (ret)
-		return ret;
-
-	ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 1, 1,
-			       (val >> 16) & 0xff);
-	if (ret)
-		return ret;
-
-	ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 2, 1,
-			       (val >> 8) & 0xff);
-	if (ret)
-		return ret;
-
-	return ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 3, 1,
-				val & 0xff);
-}
-
 /**
  * ov9282_set_ctrl() - Set subdevice control
  * @ctrl: pointer to v4l2_ctrl structure
@@ -818,23 +640,27 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_VBLANK:
 		lpfr = ov9282->vblank + ov9282->cur_mode->height;
-		ret = ov9282_write_reg(ov9282, OV9282_REG_LPFR, 2, lpfr);
+		ret = cci_write(ov9282->regmap, OV9282_REG_LPFR, lpfr, NULL);
 		break;
 	case V4L2_CID_HFLIP:
-		ret = ov9282_set_ctrl_hflip(ov9282, ctrl->val);
+		ret = cci_update_bits(ov9282->regmap, OV9282_REG_TIMING_FORMAT_2,
+				      OV9282_FLIP_BIT, ctrl->val ? OV9282_FLIP_BIT : 0, NULL);
 		break;
 	case V4L2_CID_VFLIP:
-		ret = ov9282_set_ctrl_vflip(ov9282, ctrl->val);
+		ret = cci_update_bits(ov9282->regmap, OV9282_REG_TIMING_FORMAT_1,
+				      OV9282_FLIP_BIT, ctrl->val ? OV9282_FLIP_BIT : 0, NULL);
 		break;
 	case V4L2_CID_HBLANK:
-		ret = ov9282_write_reg(ov9282, OV9282_REG_TIMING_HTS, 2,
-				       (ctrl->val + ov9282->cur_mode->width) >> 1);
+		ret = cci_write(ov9282->regmap, OV9282_REG_TIMING_HTS,
+				(ctrl->val + ov9282->cur_mode->width) >> 1, NULL);
 		break;
 	case V4L2_CID_FLASH_STROBE_OE:
-		ret = ov9282_set_ctrl_flash_strobe_oe(ov9282, ctrl->val);
+		ret = cci_update_bits(ov9282->regmap, OV9282_REG_OUTPUT_ENABLE6,
+				      OV9282_OUTPUT_ENABLE6_STROBE,
+				      ctrl->val ? OV9282_OUTPUT_ENABLE6_STROBE : 0, NULL);
 		break;
 	case V4L2_CID_FLASH_DURATION:
-		ret = ov9282_set_ctrl_flash_duration(ov9282, ctrl->val);
+		ret = cci_write(ov9282->regmap, OV9282_REG_STROBE_FRAME_SPAN, ctrl->val, NULL);
 		break;
 	default:
 		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
@@ -1114,7 +940,7 @@ static int ov9282_get_selection(struct v4l2_subdev *sd,
  */
 static int ov9282_start_streaming(struct ov9282 *ov9282)
 {
-	const struct ov9282_reg bitdepth_regs[2][2] = {
+	const struct reg_sequence bitdepth_regs[2][2] = {
 		{
 			{OV9282_REG_PLL_CTRL_0D, OV9282_PLL_CTRL_0D_RAW10},
 			{OV9282_REG_ANA_CORE_2, OV9282_ANA_CORE2_RAW10},
@@ -1128,15 +954,16 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 	int ret;
 
 	/* Write common registers */
-	ret = ov9282_write_regs(ov9282, common_regs_list.regs,
-				common_regs_list.num_of_regs);
+	ret = regmap_multi_reg_write(ov9282->regmap, common_regs,
+					ARRAY_SIZE(common_regs));
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write common registers");
 		return ret;
 	}
 
 	bitdepth_index = ov9282->code == MEDIA_BUS_FMT_Y10_1X10 ? 0 : 1;
-	ret = ov9282_write_regs(ov9282, bitdepth_regs[bitdepth_index], 2);
+	ret = regmap_multi_reg_write(ov9282->regmap,
+				     bitdepth_regs[bitdepth_index], 2);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write bitdepth regs");
 		return ret;
@@ -1144,7 +971,8 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 
 	/* Write sensor mode registers */
 	reg_list = &ov9282->cur_mode->reg_list;
-	ret = ov9282_write_regs(ov9282, reg_list->regs, reg_list->num_of_regs);
+	ret = regmap_multi_reg_write(ov9282->regmap, reg_list->regs,
+				     reg_list->num_of_regs);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write initial registers");
 		return ret;
@@ -1158,8 +986,8 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 	}
 
 	/* Start streaming */
-	ret = ov9282_write_reg(ov9282, OV9282_REG_MODE_SELECT,
-			       1, OV9282_MODE_STREAMING);
+	ret = cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
+			OV9282_MODE_STREAMING, NULL);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to start streaming");
 		return ret;
@@ -1176,8 +1004,8 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
  */
 static int ov9282_stop_streaming(struct ov9282 *ov9282)
 {
-	return ov9282_write_reg(ov9282, OV9282_REG_MODE_SELECT,
-				1, OV9282_MODE_STANDBY);
+	return cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
+			 OV9282_MODE_STANDBY, NULL);
 }
 
 /**
@@ -1228,14 +1056,14 @@ static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
 static int ov9282_detect(struct ov9282 *ov9282)
 {
 	int ret;
-	u32 val;
+	u64 val;
 
-	ret = ov9282_read_reg(ov9282, OV9282_REG_ID, 2, &val);
+	ret = cci_read(ov9282->regmap, OV9282_REG_ID, &val, NULL);
 	if (ret)
 		return ret;
 
 	if (val != OV9282_ID) {
-		dev_err(ov9282->dev, "chip id mismatch: %x!=%x",
+		dev_err(ov9282->dev, "chip id mismatch: %x!=%llx",
 			OV9282_ID, val);
 		return -ENXIO;
 	}
@@ -1397,9 +1225,8 @@ static int ov9282_power_on(struct device *dev)
 
 	usleep_range(400, 600);
 
-	ret = ov9282_write_reg(ov9282, OV9282_REG_MIPI_CTRL00, 1,
-			       ov9282->noncontinuous_clock ?
-					OV9282_GATED_CLOCK : 0);
+	ret = cci_write(ov9282->regmap, OV9282_REG_MIPI_CTRL00,
+			ov9282->noncontinuous_clock ? OV9282_GATED_CLOCK : 0, NULL);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write MIPI_CTRL00");
 		goto error_clk;
@@ -1576,6 +1403,11 @@ static int ov9282_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	ov9282->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(ov9282->regmap))
+		return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->regmap),
+				     "Failed to init CCI\n");
+
 	mutex_init(&ov9282->mutex);
 
 	ret = ov9282_power_on(ov9282->dev);
-- 
2.43.0


