Return-Path: <linux-media+bounces-53827-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2D/GOgupomkn4wQAu9opvQ
	(envelope-from <linux-media+bounces-53827-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:36:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE5A1C1726
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 22D063033BC3
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60ACE3EBF2E;
	Sat, 28 Feb 2026 08:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="Kk7BBAin"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4377233A01E;
	Sat, 28 Feb 2026 08:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267751; cv=fail; b=lrk+tPvsXm6XB7zZRcb27K8Qa6bLFV7ZAdTa55GBHQuhfM78w0OX2DGVzubI3h7oqvssGDCJ+A71uLZ3EEiT6MQ2xwY/dZM0p4VOud3oO38y74UD/5Vq7e09Zavz1cdlOYw/zgPeWvj2wUZmVpRijskLtbFPvb+3t1e/w7gq2jY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267751; c=relaxed/simple;
	bh=0K+iU+rw+Wim54Yx4+hncmiV6mL/gxQWXMvoMxSn3g8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gj83tp1w26A119wFbOQrap8uhLUa7FV+0gd3P56yRtMA4GZA1bJeOvjl+EmqIRqufHayrpCNE2kvGdf6xBUPQSuZpxk8CfW2QtY1NZgmwOHdK+ZMUjWTK6H9n6TRAwatyKEZIkG1s3UlZGg3MyAqXbzVpcU9C85DHBDHw2m2iPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=Kk7BBAin; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6UlIC2801372;
	Sat, 28 Feb 2026 08:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=EijCrlkvqS1hipfJhyqTP+1fcXISF0tPE3iyIW54AfY=; b=
	Kk7BBAinyqfL9w4Ee5VVZAI4diFc7VOvnLeuWMZ4oL9ln95zuhC+/0/thm012nJJ
	qXt8EVXHzdVEwvY32G6AZyQtsOpJ1KjVxVpt3gwdYXDsuphScFstrmNGMUTAP0qD
	+TqhIsVKnZakDED0Mz+Y1nFNSom41TiJ2khNsja98Ez+BxAIPLehOWGu113J2g73
	H9lsCnD4ZOUWjYF5Oy01MTtlRQ5r5ScGIPUEt74AgeB7vHh3+xogDcGJZCS4MMbO
	idaPeFlqcOMu+RvzQPOv4hLvastCy6GrU7I8DjoRhpPVwcMj3VYimjis1iu2d0KE
	bOgnxt+TrCvytJzYub4yDQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011013.outbound.protection.outlook.com [52.101.52.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4g820-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 08:34:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B65J/cQJnX9VL7DpjpX9Z7Ehd9J+tjw1DFINQpk2U1grSCz6+6sw2IyqS379XA45+9/qVpfcZKp01XFhgT7vQ1AhYFLzILm13FAUXyImkqld2ty7MnKdmbhnr3rlL1xTX5l5MQV1zpn9GENPxeIyDz8kVQCuX9DLckmVabuqAYMo4p3mkvaC0Lz126FForsq/3qYX0QbEAklHGiwLAQpgXEXMR6ovgFaXaSEKiYsB0MWxoQs1Gy0DGCgOX+KEBEvu6ZI2Ci02TiDxOb3knLsTzIWNfUotLdofsrbkRUa0AXAhVQXbOG+2fH/vFmNl6EOMoNq65gPUzT0Oa0CdsS7gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EijCrlkvqS1hipfJhyqTP+1fcXISF0tPE3iyIW54AfY=;
 b=eWGkkWlL5sIZEgZCKsnGmhftDf4k1d5PgnXk6jL7tNNpWNIx9/v2IWX0WN4Td88G0kYZY2v8Q23IMWs9nsWJ9OTJaux9Jj3LzxNlBprAtqblVpQBfhwuWcxgAUKxB/giqK4kiRD6389OVt5ittn8n8kUaxRZ/XY6o4EmK72OLz2OHG8XbkK1rmkA6GBvU92IAa2Ogy7uEFuctQeiWBjIDmZBj/99aTywCaUw24D+nebKlL5hWXdFG3BCV68PF8yccIirr5c1l0llCc9efpZegRDGDV2SBraASrf10kPHRrpRvq+9WH4Ayw0+SWrvFND2jVi2mCSmNttwgTfeGzbKpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by PH3PPF67C992ECC.namprd11.prod.outlook.com
 (2603:10b6:518:1::d28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Sat, 28 Feb
 2026 08:34:51 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.014; Sat, 28 Feb 2026
 08:34:51 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, tarang.raval@siliconsignals.io,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, richard.leitner@linux.dev,
        Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] media: i2c: ov9282: switch to {enable,disable}_streams
Date: Sat, 28 Feb 2026 16:34:01 +0800
Message-ID: <20260228083401.1007434-4-xiaolei.wang@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: f4cbdce0-10b6-4cbd-b052-08de76a43d72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	xSn067aM6B05Bp/+TAvyrkDLZYei4q9U5VbsIXRYM7WlniwapHJfWcKz9bOfdbm3evqPFD/7AWBWzR/4HYEQQ3yXa6tfIsFL2bvDB5aQlzrN2G6EVPx7atY9ZJi5I//Z7j5SqgzOoWih7V2Y4HNunmdmlRazCHNEmd8benqPv/v28PVFmq0o8oMIKVIrkHBKkqLo8RB3xjzVBKJ00s5kIpUport/ultHWykr6Yjm57RHAaoV7/vx1rlIugoSv1D74pOEYGkq8p2dI0fkscy0Roha0Xk60RAPLbKr5qMzlXEXjGGN84MX7780ZVrhWmOcP6RAz5v+Yww4kDKr55MNiZVquA7n5VRLyKH39kO2GdIYOpsqJK6H5fZcf4haH7aWaUxDh0S8SlKH5nIy6qtNy/T3Iv4akgCkzall9ve+qqckk9GHhU5YJPEJGmIvBi4SiFL6mxrt/0uzokgOZn5fMqn2R/YwrpKez3nf3MZOcREICBWZQvO6k+NBFIvDBJIN2LBar7JAx0LOMOl00hHECRQKhr9aCBvZp843K9jNTvlB5fX9QNepOKT0lVGyYoQ/YcVL1e5NCVaYP5nPtfcx+KfvsnQwqzex2LvFd/zjlIOIPBp+/1r/8HqsxoZRq6t0sKFT55fcLDzQwIEWsWJPcYZoeMYzKwLEw3KLCiDfoPflSzpfaMMv2vyuu80oVzqgaTK5uPOkJ1IiN/iELSWeCgIhO/SrUQ/wU9PU/kF0GkOXVtgXkRVX0K86X/2UtM1SpFRg9vOrm4QTvb54KrH4LbfXWHmt8CBh/HnBKVK+YMoF5IUGKl+VX1uf0FSaiyLS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nxt54QW639W2bjXIZOOz+YNNIab1j/EC8Cmlef35G8X25gctmMEn65ppeJDo?=
 =?us-ascii?Q?ILKa3VHBrEjhIB1X2piUReCLkgNTP+S68Zdwz8azRddALRDgUlgiqqSWyFb6?=
 =?us-ascii?Q?b6MtMz9K1cnIL5mu/rGRevO61zCnEFIpzx9zVfVVcNg1YSNt20UVydBpv4y/?=
 =?us-ascii?Q?AwOWWS4fkMiT2cGWzj6TP3y2g3sie0M3pYP8h0HD8E2Bo+RYjrprimmUBw3w?=
 =?us-ascii?Q?De3WWuuiyrPZBY05yJScFq9n+fDpzeXEFMIGyVipwlLs2P3vk4Hg/TqM7WUc?=
 =?us-ascii?Q?LH8PsE0iVTEB1ukvmJn9gwix16FTMwY600dM18nJejMx7Mt/pRuKgGCX5WJ7?=
 =?us-ascii?Q?crC6oZ3ZmZihGjnqdufA7PSpDkz5/ULIMNQjhmmAMSo/4uYIdKpjgMLNLzC4?=
 =?us-ascii?Q?CSduSKe/meVHJYvGDiRri5+0spV5VXMRx9TxQbSoottuA4eQgdBBwz7V9BsZ?=
 =?us-ascii?Q?zkGiqVmlEnUvbWL3Jn7r3SCHX2BrDVBoDGDgW5VCs8BnS6V5CpUVIODnskU8?=
 =?us-ascii?Q?LQErBrTc8blEMeZ9grK6GUQ4n2ckQ8PeB8XSW34Y2V3xuNQ+HujhM0Kn88/D?=
 =?us-ascii?Q?EBp82iOTcdTFrB85kCUyDTt2WwMXBB1tYS4vy21sShZmifSbjZlGxXMKrWAN?=
 =?us-ascii?Q?9WAUe10Rx2lR7hCACYCrNNJYnfhLgqJDOHERr0Zso6YRiyKj5m94Cw50cI5z?=
 =?us-ascii?Q?7lb0sPboCjBNY2GbAssJTtIkM9CNhbBEbtGfyeNC4hapiE0X5qKR2vdrqcdK?=
 =?us-ascii?Q?FlxzFmjMvnN3BeAbt3sLPlIYaozfOLxAyWDbCigvDKNWVAsgG55bQYo1r1ho?=
 =?us-ascii?Q?+J9ONMCkmBdkeUn0HBhRBXMEQ7POivAmuWjWx7rm4/CBvmtJH9Wfq0Z8G0kT?=
 =?us-ascii?Q?8aDERuCv4x59NgGWvqARmUMNQpBxY0LA8efTfltaKIS0VZkdGcOnx78jCYxU?=
 =?us-ascii?Q?bKLiqK5doh1A3P65Ny8cCKd9I18LkWFCp4PVvP0asl8ZdBKg4+dv2eWoDX8p?=
 =?us-ascii?Q?cX4pjRUEXoiFfvYYP9W22VqJtTRhM9HKQVPATg7uKSc7z93NNK0LKV27LX0G?=
 =?us-ascii?Q?miofbFdgSB3qV4oCNz9N0rte6x8UzcaJ85oHumF/FCmbxBPxgyp8B3watHgN?=
 =?us-ascii?Q?WJ0YuXkT5CzbnkkTrfFKQbjjc0ScxPALNtc+INKWM0fSlio2qMcQ+5X5r2/A?=
 =?us-ascii?Q?6gWlftR3r/Nj2R6+b6OgBPvFF1L1nkksRnBt+ZBBwF2NQIYRN7te/ltjVhMG?=
 =?us-ascii?Q?fE7ryoEEbSVpkx805S0ETtf/NJ73bweO5+1EZPtVR2eYI9k9iieVIF0xHKLm?=
 =?us-ascii?Q?8FXPVdmUpQ4Pvrm3YEDi66Oe3+/3BD0h2b6iuYTZeenvtj6yN/cBRdA6CePd?=
 =?us-ascii?Q?rJt/HH3d+i/3NXBiMByLKELVUF1NbgghWfjXI3jCNCtzWxq9/H861g5SbobE?=
 =?us-ascii?Q?W97LWG+YQw26U9UJemvY4liK7iyXRUi6uPcK6eYhGem8HRIgkiFkIT18P4Wi?=
 =?us-ascii?Q?unSAYoM50OEJy5Dd8qPhr9M1E7fEg4wMnOhtfZjDPQb/pR9Pj8UDOUAq9BkD?=
 =?us-ascii?Q?1rH3fKHT7B3Su1QYt7si4XDSO/ElHdlV0FNmu/m1XmoVHh3EMaWPH7WA9PiO?=
 =?us-ascii?Q?9rJnX6zVynzrvzv6NgUhdzlCIHNrkW2TxfNSeXvnlTDxvlbYnoPbfd2xt8JL?=
 =?us-ascii?Q?VWEgd8LJ3No/qKAlmOBD4zEflpva4cv6kKnzOp1J7mmyeOXU8Ig5amKsGuS7?=
 =?us-ascii?Q?SG7KlM8H34fy1t67+OpG9D81Whv2sY8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4cbdce0-10b6-4cbd-b052-08de76a43d72
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 08:34:51.2945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFqAS9tKPPP7YD4RswOkRTSgZH/FAseCpHVGpBq9cHLFAlZvfeKL8WTGss/NE1zcUoCz8hPaI6jPWuqSbH9biSOML6L88z34A1mxfG3e9pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF67C992ECC
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a2a8ad cx=c_pps
 a=0XF06BAwF4INxAelKEegqA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=-DGD1vg1X50fszjQOB8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: y5EzskyanOc9sQnGka9DAnMY6HzlreZs
X-Proofpoint-ORIG-GUID: y5EzskyanOc9sQnGka9DAnMY6HzlreZs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA3OCBTYWx0ZWRfX7vDMKg3TOPZl
 38E26f1q3Jw8s+q3l/xV9RHnRn99ni3xzkh+RouF1cs9crlsBtqsnAhXkU/9J1fjULnchXCdQFQ
 NGWiUpWzsWqC5Wqkt+/x0ZAvew7iccTPUahI6ztFqDdVun04ETqozQG72+TLwdFLbbKXB52aKg3
 TqSH83gh0GWYwHHKiRIIG90p5Ei6w+0//OnjBgLxwlIwABRCBKeTgc8KGTmGArffyq/YI3eWWMU
 yFLFGYdmznBDyq3Bc8AnGIgmBst5hETf0UWQ1+ZhibqYY4A9t26nNQfSDaKcJgsbIW1D2tMCAnv
 GdQMi7MqYiq6WvIn9H6Qmq+9aJ7mIhN9WRf6x4gC6CBhKVdiK3E8SlVhwsHddfMBxebVsx/jtRR
 sjf7hmirDW5fJH3B9A4GeF/DfKifbQuH05EtlYB//imepiiJc0MBdNpTJIV+rJq63Er9Lppw2Qs
 C2Rik+VGcDBDnJziiVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
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
	TAGGED_FROM(0.00)[bounces-53827-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	DBL_BLOCKED_OPENRESOLVER(0.00)[windriver.com:mid,windriver.com:dkim,windriver.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3DE5A1C1726
X-Rspamd-Action: no action

Switch from s_stream to enable_streams and disable_streams callbacks.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/i2c/ov9282.c | 82 ++++++++++++--------------------------
 1 file changed, 25 insertions(+), 57 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index aa5a105136bf..b080a56d83a9 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -921,13 +921,9 @@ static int ov9282_get_selection(struct v4l2_subdev *sd,
 	return -EINVAL;
 }
 
-/**
- * ov9282_start_streaming() - Start sensor stream
- * @ov9282: pointer to ov9282 device
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_start_streaming(struct ov9282 *ov9282)
+static int ov9282_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
 {
 	const struct reg_sequence bitdepth_regs[2][2] = {
 		{
@@ -938,16 +934,21 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 			{OV9282_REG_ANA_CORE_2, OV9282_ANA_CORE2_RAW8},
 		}
 	};
+	struct ov9282 *ov9282 = to_ov9282(sd);
 	const struct ov9282_reg_list *reg_list;
 	int bitdepth_index;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(ov9282->dev);
+	if (ret)
+		return ret;
+
 	/* Write common registers */
 	ret = regmap_multi_reg_write(ov9282->regmap, common_regs,
 					ARRAY_SIZE(common_regs));
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write common registers");
-		return ret;
+		goto done;
 	}
 
 	bitdepth_index = ov9282->code == MEDIA_BUS_FMT_Y10_1X10 ? 0 : 1;
@@ -955,7 +956,7 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 				     bitdepth_regs[bitdepth_index], 2);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write bitdepth regs");
-		return ret;
+		goto done;
 	}
 
 	/* Write sensor mode registers */
@@ -964,75 +965,40 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 				     reg_list->num_of_regs);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write initial registers");
-		return ret;
+		goto done;
 	}
 
 	/* Setup handler will write actual exposure and gain */
 	ret =  __v4l2_ctrl_handler_setup(ov9282->sd.ctrl_handler);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to setup handler");
-		return ret;
+		goto done;
 	}
 
 	/* Start streaming */
 	ret = cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
 			OV9282_MODE_STREAMING, NULL);
-	if (ret) {
+	if (ret)
 		dev_err(ov9282->dev, "fail to start streaming");
-		return ret;
-	}
 
-	return 0;
-}
+done:
+	if (ret)
+		pm_runtime_put(ov9282->dev);
 
-/**
- * ov9282_stop_streaming() - Stop sensor stream
- * @ov9282: pointer to ov9282 device
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_stop_streaming(struct ov9282 *ov9282)
-{
-	return cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
-			 OV9282_MODE_STANDBY, NULL);
+	return ret;
 }
 
-/**
- * ov9282_set_stream() - Enable sensor streaming
- * @sd: pointer to ov9282 subdevice
- * @enable: set to enable sensor streaming
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
+static int ov9282_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
 {
 	struct ov9282 *ov9282 = to_ov9282(sd);
-	struct v4l2_subdev_state *state;
 	int ret;
 
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	if (enable) {
-		ret = pm_runtime_resume_and_get(ov9282->dev);
-		if (ret)
-			goto error_unlock;
-
-		ret = ov9282_start_streaming(ov9282);
-		if (ret)
-			goto error_power_off;
-	} else {
-		ov9282_stop_streaming(ov9282);
-		pm_runtime_put(ov9282->dev);
-	}
-
-	v4l2_subdev_unlock_state(state);
-
-	return 0;
+	ret = cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
+			 OV9282_MODE_STANDBY, NULL);
 
-error_power_off:
 	pm_runtime_put(ov9282->dev);
-error_unlock:
-	v4l2_subdev_unlock_state(state);
 
 	return ret;
 }
@@ -1164,7 +1130,7 @@ static const struct v4l2_subdev_core_ops ov9282_core_ops = {
 };
 
 static const struct v4l2_subdev_video_ops ov9282_video_ops = {
-	.s_stream = ov9282_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
@@ -1173,6 +1139,8 @@ static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
 	.get_fmt = ov9282_get_pad_format,
 	.set_fmt = ov9282_set_pad_format,
 	.get_selection = ov9282_get_selection,
+	.enable_streams = ov9282_enable_streams,
+	.disable_streams = ov9282_disable_streams,
 };
 
 static const struct v4l2_subdev_ops ov9282_subdev_ops = {
-- 
2.43.0


