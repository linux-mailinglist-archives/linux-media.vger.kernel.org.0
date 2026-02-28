Return-Path: <linux-media+bounces-53825-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aECZLPCoomkn4wQAu9opvQ
	(envelope-from <linux-media+bounces-53825-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:36:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD911C16F2
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 16A063022C06
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91323D7D63;
	Sat, 28 Feb 2026 08:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="OKh8NEqT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D1526ED59;
	Sat, 28 Feb 2026 08:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267750; cv=fail; b=V1YVq5qQoCFLkEwTNt/1BrzbBc5CvT75pqIwiHI3qwvA/ZaZNn4iAt2DpegV/Wcs4VKNxS9nKKYWZTkjTS8V7VYdPDbKUBxocgjyAZNI92rnLD6I6Jdh+ggZhfwNSm3X+X9N5aj6s5ph1NUeh3fEXGWYzjCZ0jNus6XqrKQ2wN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267750; c=relaxed/simple;
	bh=zOrS9fjMj5/l2CLT43UyYVNBvCTybo6bmBOJEJ6EhDY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AW5Z4EdXHEmcAR+JxfRk9P/lBJRwFAq3LX9kw2smtg21NF61qe+dbscgtVxWliiwqAQ+9EWVxQyN+4CkmqB7mpZppzcqc3zI555/kzKSF6JoCfSyq3zF1u8m3agmCAb3e7kpVTzptU1uSOU28MyOcl0U4sXemlwvu4jIowK0pAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=OKh8NEqT; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S8NoUp1119996;
	Sat, 28 Feb 2026 00:34:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=L2r/gYxU+
	KZQZV3O0W582wOqAYXJavOUAVRHLB15QZU=; b=OKh8NEqTkkWOQfQQsr3Olbki3
	40AwnXAk1l/y6QwQKm2CgX7E3sGtlq7oYX1v2hzVbniTxSoGZZ/uf7EK+e7zUnYu
	jdiWOvzIjswamveJeuyky+NmCVCj1+p2LsrQDUoBuQfmRSkjlIpnWc7tptUvl3K1
	A1s8YtvfKvlSPBtmvoFAjQpU4+/R7WAJ8ZgzsmlxIo1OACS8w7bqqqBzBwAkzjq8
	Y8C1Uz8JkZqx4Q09fy+2R4stzy6/0V9jxXF/AHe7igD5ZQ/h/0Rdh1A0Lt6ubcUt
	kh9VAOa6HfHvLxpuEQAd98LY6ErWuvhKlq2MG11B9GzKrpTQRjNwEVW/koMqQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012008.outbound.protection.outlook.com [40.107.209.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh400ks-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 00:34:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6ARarJidgzuWovEvePN3DAsQycDlWWsxDiaHqxI1pE3L0bFsBhyJYsQvhnO5ixjs5QZ9Qf9LS5XNMAMQ/C4Qn99iL9AgrnVTTDBOwSAHPy4wYdoZy/tdUj794f5/vhLAKevLQPXZ5uqBl08/G0rm1LEXl5cS+ZxZI7bJt1JkdMEG8Xyg26mPoTqYm//6xsHwNiJr+4DjRfZPxOTwWs4m4COthtGc23hCXXL+fz+O04qnsJuWyd28Woz3e9lAQR5JhQj1sPp8XrTXOexYCIZValdcigzmY4YQups4SuX+tFfbvmdxz8QoumQ8l+OnZBIKDsePBwxRYb/xMJ8RYUVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2r/gYxU+KZQZV3O0W582wOqAYXJavOUAVRHLB15QZU=;
 b=VyoefSdkdwyepIBgUs9crViMqs4C4mgeR1DgLynkxGSZOs+DO9PvNuDcEDt+kmYp59pUgPjjLPes9TFv+7tWWxEI9PKZmmVpXuTgxtcv2VxR5qmbnfhK9ZyranU6qRGQ4HlesNUPSldj2AfPFB+FGeveStaCPNOBMbEAsa9Ws5+4tHAYfE2gXWkUysena8XQh6o90h1wDh9He2vbJazkn6PWeAyVN1CNqUZMoNDwaIxuDNM3XID9cJGppaAGWyiiFyTUNTkwCbiQuBkoLGV0O7j/pHXx/WnXFnvr3vLYQkJI9EYDhkF4x5AQte7jXJ0osGdoD1Fms4kS/LLJzPlH0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by PH3PPF67C992ECC.namprd11.prod.outlook.com
 (2603:10b6:518:1::d28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Sat, 28 Feb
 2026 08:34:38 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.014; Sat, 28 Feb 2026
 08:34:38 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, tarang.raval@siliconsignals.io,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, richard.leitner@linux.dev,
        Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] media: i2c: ov9282: Modernize driver with CCI and streams API
Date: Sat, 28 Feb 2026 16:33:58 +0800
Message-ID: <20260228083401.1007434-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-Office365-Filtering-Correlation-Id: 6dd38abd-1569-42c5-a37b-08de76a4356e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	zaQZbAbAvVfRDJMZHhtaHPpL01EFJibFvNNU1ThIEIa4UwHrikliUR/KjhcJotzzrXiXOhJJJgbUvqDVcE2SwmG1KhsNVZDxokr26FlE7NnR3388+G3WvF/RZbVxwGcjandQoZU98tgYOl7bMb7oHWQ5kUuwkVeceEKTLgdM/BI+rP6I8rFDg/gdaHh+kGb044DASFxCXvhr809QWR+wPeZJeu+FTlF0elnIdOzDrREOqiCDPPrg7EVDaZF4e7J6xdtl1kXZDKPEQdQCCbENflIWlqAzNMS07yRoWIzyDJzeutrug3fbrDyeU1p/HwYd01bdSmG1CWhGAHuzSGHSr9wM+/F1jso5eLH7iu8Igp5kSGDn+SoUG0+/FTvHmLedVi0NvWfl80FWMLLndLk2canWUrHkjbBKijEeca00Kvp4w5wcOF47e6lWZDt3w4bAQSKy/BjtmMfpLQVISDHNbnP1+Ke3Sx2ib0ey37ZL9XRhIeKfVImJWoHDRGapFnNeHivqI3wMxVmCw66YV0MNSlEEY9FNynXY6RUHl4E6fsQ0Fq2vzB1966j0nnzc1ugWYUl2G5r1vSKcQNF0/lJnvsYK70bbskrRscSBX+qxTZX+KM7NJglazhXKT31y1n7EWEJion2lqgviXGk0ri3wUWJn9pw26F+FmyKI3dVuCG36tGpdNFsrP0fiVxUkyM5BXl/GdxOf0EnXWDa5mLYzqvA6PEPoQnrMzsCiaYVF8AQhOtSQjLwRvGpj/r9o/JqYuVbIkch6wH8OmC2QuVA25xTcy+aYJdFrp/l3SGsbc9ZTVbHSaGm6eJ+iX1GzmETW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5GWS80BNfoS8r23u4RoL9CSvkrOTVf+fyleyiZ6IFztIoXckeFb2WhjKBBTR?=
 =?us-ascii?Q?S8yqdLC3Utb7+Y1QZPO6ezbiM2wvxS4+H5VEwnGzbr71EUgtY9QBeLrNjYqH?=
 =?us-ascii?Q?BzndJJOhbQ4zjIKe6jMWDs4EN+00Hw4AaO6xQKtJZmDRMGBMfJ+Hgv+EcheJ?=
 =?us-ascii?Q?jN1taRW1KsieCeG4cIImoJYfzy3QlYM2RhmT35jbPnlGd6/YFtAz+80eXczA?=
 =?us-ascii?Q?oP3CKkDx8dTLCbwWM4S9WsF+mJ91NvU3YT7LGdKH+rmPrhGfy8dWVI6gnn+M?=
 =?us-ascii?Q?lnurXlppU63LCw86hZgN/Qhz7IfTYtdRlLMQ8YwdWs8wnZOedMBgS0NAXiv7?=
 =?us-ascii?Q?Zs9O8ZMkeNlVCVJmWnJ35bROgo3i0+b59xfPhR+b+nMy2tcooIcb5rFqBDdi?=
 =?us-ascii?Q?ZSHWsvUj9tDOAgrTSSary7ToPohqIdSEQ7YbHtq/F7nE+VVsTyXKYBhK3oho?=
 =?us-ascii?Q?aOIv4u4rmtXGTpq91mqlStZC575j4ENSzAo7tN9a9M3ACqlJw6nUKLe6FUyQ?=
 =?us-ascii?Q?ldzfzku0hDrZb9lK5WMraC5H/jKPOHZOpSuMm/gNd6iMC90zaqMUC22tZrez?=
 =?us-ascii?Q?BeK+yc2B6ZB+XoovfcTt8DfB+9oUT0tJhxEgnbgXemUU0Q2xUuz1b/1EVoVD?=
 =?us-ascii?Q?USh/whKtAqCejeBzKZlIyVJcVKz1RpZFJ2B2X9UQKXncUsXlmvuBv5puWVnQ?=
 =?us-ascii?Q?UTFRuy8F4hlIaC5pJWK8c+0YLEFDiQpeDIbw8Z2yEe9uLPpK7Q5r2Pta7onA?=
 =?us-ascii?Q?kjQRPB9ri12QfYhBIUv7Hf4B6a/zPS3n3/RiJV6BlNY+EAKVA+Wpe9sgvLnv?=
 =?us-ascii?Q?AR06YtcYiOXPZNckrk0LbrKuoz+q8jxLsuelkaow66fk99ZPzX59ju+qjwwq?=
 =?us-ascii?Q?ACUaw8pQdnQSsWYVqIg237BkAVh+vheucQHLK0+jhQnTCvKmE8ZLEjBJt1qU?=
 =?us-ascii?Q?36Ec25hxdgrU3muzaspc1K3UE9hE/7W3CDEyzEe3jqaMPtQEVHywMmUsboWm?=
 =?us-ascii?Q?66VZNf6g/qZkSF0vFSMCrBWaOaZY260sHS0BSI61nN1lzhhshIy8QV2rzrMW?=
 =?us-ascii?Q?xhsHBc6S8l7+u3hxD7YVEc2Vu/9MXh5x1kEsAuu0SnlRz96aQm9S21TLCLhv?=
 =?us-ascii?Q?u5w1jLD9AARzcnZKg/+zRjGeIv/20tbt+x7TDSTmf4apSVRUs42L0x6OWJQ1?=
 =?us-ascii?Q?6lYJ7x4i6gn9UHRAuL99ee/X66HdwRdht2z1K1WY61oKMKhC+UNADmxOyrcV?=
 =?us-ascii?Q?4a6jzTOnDm8Zru/k8906Wj2/IqJzJ5Q6KYzfnun44711KuoY+wrdtebn/OYB?=
 =?us-ascii?Q?qxWAYkZl9KJ7fjGAVKSVpAnHWD11eHrUvg/nVHny8gBQF414x4n/Tlyt4oF+?=
 =?us-ascii?Q?vTXoVRr2axqmnczfnxZko6wYEJl6jbi0VHyok/Sfp+9QKR3nnUs6NefekLfX?=
 =?us-ascii?Q?os/3lnsNyCeIRRDTypIy8z/AGucktTWMH9c38HfpCGy+8TNSKsh2csVo2Ff6?=
 =?us-ascii?Q?ZdRH9ThRqt+cVqC1DQRmiSFgL/Nk4EZLvP0QsmT2d8OTtVXiQzPVayKbdL1b?=
 =?us-ascii?Q?wcT2smPfgKKV6LIjU+bKCSFAzWtlRE3Z177BAeOwzFRysRcaiv8WLXbom7Q9?=
 =?us-ascii?Q?80zVaU3qcSubmg6w+OvK7psxaqZeYBMonUvB3aTMTW/ntSgvH1gTXURdWy+n?=
 =?us-ascii?Q?fp+vwqLB83gUuft5eYGzTbFbrt5DiWYgTKHGucASwDwgRCER/i+OXRKryfMh?=
 =?us-ascii?Q?QajPt6IALIpotqdmIzgU1aah5tXwtsE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd38abd-1569-42c5-a37b-08de76a4356e
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 08:34:37.9400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07Mt6YsZNr00Gw066+Yg4WqVY1O7NhqZ7nLfkaIJNhdHzGcrFrQarRev+asBYinu0UYK5ukK8kj5aqLyvgurH66B8ERBU6y6KThQKuTl8Lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF67C992ECC
X-Proofpoint-ORIG-GUID: 4UGNmI2NzTu9aEF6-CBAVVp9otNfYlPJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA3OCBTYWx0ZWRfX9LsZwn5FZkf8
 gyZ7+si1RLodrzvZN/3WFaITqjax4P50gUo8c6GeYt3sXt04uSgH2h3ZF5RDdwvrEbb6K40Y/j7
 STAlbRaZ+WO8KJa13hwjWl0oHEEWP0K6Znq5nJrWJZv6L0NuP9JsQ4IsOGEEJomP1aQ0rsaGdwA
 8izveWdWdTXw0Ry7c/SDX8H1qyYs1Uj1qzaoTPFwN70ASsELdycsPc3b05hNWJ2BkVd33k2ZvcZ
 CClhzYyqzJAUN05A5lpp4yZFc7Ru1bd92H1g3XHQHDZPVBbxLMXXMaNkAab2OMwWTESv9GPG4lA
 SoMavXBySNMzxzI5LVn55T72gars2DGjsrLOxHJZTsHWH7vP5YR60Oxb0mCtc9S0mMtFGHaXM19
 qsNTot/YbRGen//KDxiBYaOHy7kGuv1dwwB3VNKKIjEGoGM702c8ziUJ91P1YDaWo1TWplBJOMG
 DnvLBjZy9h/1BMulnUg==
X-Proofpoint-GUID: 4UGNmI2NzTu9aEF6-CBAVVp9otNfYlPJ
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a2a8a1 cx=c_pps
 a=COQGWIG0gBNyFO/LkKr7KA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=ekXEql0GMc9u5THJ3pMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
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
	TAGGED_FROM(0.00)[bounces-53825-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	DBL_BLOCKED_OPENRESOLVER(0.00)[windriver.com:mid,windriver.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CFD911C16F2
X-Rspamd-Action: no action

This series modernizes the ov9282 driver by:

1. Converting to the common CCI (Camera Control Interface) register
   access helpers, which simplifies the code by removing custom I2C
   register access functions.

2. Switching to use the V4L2 sub-device state lock instead of a
   private mutex, improving integration with the V4L2 framework.

3. Migrating from the legacy s_stream callback to the modern
   enable_streams/disable_streams callbacks, providing better support
   for multiplexed streams.

These changes reduce code complexity, improve maintainability, and
align the driver with current V4L2 best practices.

I verified each patch on the Raspberry Pi 5 platform.


Xiaolei Wang (3):
  media: i2c: ov9282: Convert to CCI register access helpers
  media: i2c: ov9282: Switch to using the sub-device state lock
  media: i2c: ov9282: switch to {enable,disable}_streams

 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov9282.c | 406 +++++++++----------------------------
 2 files changed, 97 insertions(+), 310 deletions(-)

-- 
2.43.0


