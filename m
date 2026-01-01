Return-Path: <linux-media+bounces-49820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5929CECF2B
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 11:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 561D6300928E
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 10:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FD6298CDE;
	Thu,  1 Jan 2026 10:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="UNVxtimo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC40F19EED3;
	Thu,  1 Jan 2026 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767263476; cv=fail; b=MYfpohk0/pQiZuUtsvGmzHe12o3rYOLjPoLGBMRQ9wa8Air61xIBMBho1s4vCmCmsSrZ3QVDaVapy1zkuP8m0wtyQf82w4lifcXpegqsp4XeoYcfYZSC7KP5OH7krn/aibB3is6NJOJAxF/Xyk9PUaPzCOiw+FntR9M73NijtTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767263476; c=relaxed/simple;
	bh=YSIaGyZQ55sO6ZzYhpN73xt2Fju7EbJikhysK0aTQWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hlgYTx6qS37cALBAtPw1kfdJews7U4hRGN9yeo9fo4Lqb4sko4SiFUOj/riHE1d6H/CqwZhNolU/BQ5uS81J+v/tgsekexHrgmYEbkUnvI8iLBQLXJkN3E8D0TMGnSWznMGQ+RblaFFuUpHGSghfz9CQwc+5BXUbyqnI9+LyfPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=UNVxtimo; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 601AUjgd1049998;
	Thu, 1 Jan 2026 10:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=2p3XglXRxd+XJoiB3h0yRx1XYAWjIhqHHcSeJ4GSFsM=; b=
	UNVxtimoXP5xK/1kMVbTonZqb1Ik0Df4nMnhTDBd7UEtnukg/nar2Rtj0tSYPGle
	1VEUIOcBGwwK/8VxrqqnqCFnB2lUfcs+gtTLJr3yioPz3UwWNK31xB0CDk7Obl4g
	7S70lfHhOEfSsi32mYBveqpKnMgfmNZOobyJ3gFQXnaSvy4evacdi7JJXzcmUHcA
	/DPjhzuO7wbbViJnVcAUusQRT//mgPEN9oCie3Y8DL7BV9q+BJwMmm/LUsh59ZyV
	Dvv5uOl8Sbyr51lGKg95Am7sPxHXUiUjvQ6Fy3SwmrBgopGvQb+Tz1tlT3n6j5hf
	JZ1ZqgaNBmhwu4mktJh3ug==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010054.outbound.protection.outlook.com [52.101.56.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba6e4vfqs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Jan 2026 10:30:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ax6CKtmpB1Q4e+FZU/zLqUP7xzKkQC7x0eqhSth7v8qTqvwtmLAvnTT6FKiB5BtbQf3qE4mBkzOR7YfRmX418OykZcCO12BxNua6Eimd8AWt5Y1BQSA+xK9MWUa5JEIGPDeoXfb/TQqDJ6MG9xrdgVlcLpdV6uAQFaAmJSjhK9es44abmv6aI32WrdsQOIy6y+SrRyGXpty7Nf+LvR8LgVfcdpnpfV5qmQMCGoF25qUAJA/LJ4t6zdBsBlA+2MMHrVq4rR7/Mb1z3t1Wk3AsEos1DtrSv6bVGnXWJ+s/3elQh2dfWfrJHjyi93UNAKy5QOOa/WcjGKGKCQ9RdAvJeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2p3XglXRxd+XJoiB3h0yRx1XYAWjIhqHHcSeJ4GSFsM=;
 b=MUcV2E5u+Rc3bL7YKPUDq21J3aHyKpXdTA3sbGFT7zg3SN8P1sY4lygvbaq8HKIqRYIrc875u7YSkNzF8+wJNDrH9pZ6Chg8QFe9ucwgSyLGwNAXE208Eqz0QljSXOisa4kM5j3w6nZ+3FPOSr/GZK1acQNU6ePwSLlz03noYt92EkG6Xuxn4p+sDpNKrDoGH6yJWrtNPy8iSewNcJHUBqlZzacQuyghUHjUr+tz4sreJrzJu3DoINgMNnwywftdIXsU93LZ1j4ERcd2uMY5hSaVGf9QqfY0lOdVSP5d2fa3EukNIflEXHMaZNbEK7Unm9OV5l+rOCWAUxqkTy/yuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by CY8PR11MB7876.namprd11.prod.outlook.com
 (2603:10b6:930:7d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 1 Jan
 2026 10:30:43 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e%6]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 10:30:43 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: tarang.raval@siliconsignals.io, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] media: i2c: ov5647: switch to {enable,disable}_streams
Date: Thu,  1 Jan 2026 18:30:01 +0800
Message-ID: <20260101103001.207194-4-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260101103001.207194-1-xiaolei.wang@windriver.com>
References: <20260101103001.207194-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:4:197::14) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|CY8PR11MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c5161df-d9a4-42bb-3d8d-08de4920d16c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|7053199007|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+tR7Tn6GyDdSIwceGw0ge1kjFa+Q71By7rNQvlQsgOMzywdp6kG0Itjs9CqY?=
 =?us-ascii?Q?p0htGF7ipYrpQlaYJcpJIhZ78VHql5iB1X4CP+JKa/tPszK0Susc8HqGs2GT?=
 =?us-ascii?Q?RsRYyW8vugUDhOu8X8knTmFa2i0lOiGm5X/Dm/yzkGqtTYjqC5Egtmvr6vFj?=
 =?us-ascii?Q?O8Yiq1T5c0i47ew97MuIP7gf1PRYOc+NyG1IQBa/rTJj/OTP1OlvgW2mpU4L?=
 =?us-ascii?Q?ojst4PkamGvGrv+nxtiAJ+OgzmeY77A7uLHuYfmbuNKpGXGqMWVABPCzeKu1?=
 =?us-ascii?Q?srIhNQgZNJMIeAZFvmQw0t95z7qGLiV32uUyNmVUtQZNvWeJ8coD89LugNlM?=
 =?us-ascii?Q?5Uy6Ui8oiP/D/jQrsWCK7F9lKxo9xhxP+Gaq+QKTvOZhVX9yPydkSS+Atr2l?=
 =?us-ascii?Q?1JuUUm+xdfKaP+qDgkuuRXOXKxAdbUguyRlJKNv1P0FMZcPgop7IdVe7/X9X?=
 =?us-ascii?Q?/YXRVbepzdVJk/gvIQbQLpGeGvBPOiG/irdWOBaRSG81hVRpRNFdeqQj+HWi?=
 =?us-ascii?Q?2eM8657ucYptlse6llSk+mS60MRLOLG94jnCRCp4roB3A8kAZH6TruVDIff1?=
 =?us-ascii?Q?gH3NCpBnAWt4Y77KedJP5VS1n87Y5wyhybcvcc8hZ/z9g12AVt7lCpSaC7Sp?=
 =?us-ascii?Q?Yd929OteRTRC5vGJKBa74pd/BDCiBomTYWzaNKzHdZz/muh/L3/xVSonfig0?=
 =?us-ascii?Q?6SsGaHw0gNiXBFoKH0umhAJMjQQ+qrx503YsWlbXWCRUtHHDZ+Zo/mLlRzj2?=
 =?us-ascii?Q?+wuGAlDdjb/trA5KFtbsWukXlSGZnNgm3YbHGAszmrQrGv9Pf5h9Y6/GBwgJ?=
 =?us-ascii?Q?k/yWr/l9EQiNS3lv/7N+iFw41oCaq5rc64HGs/cMqWR8Q/1NlvKXy9GzBawx?=
 =?us-ascii?Q?bD0csUUeaFiYusa8B7nL0lgCGgvCX7645+m3mGwegEJTuzp4M0znEqYIdcG0?=
 =?us-ascii?Q?0IqUWTPAahRXEnTMv9RuoSvOe8kjksA+eQbl1YaJ3De7E2j0jTooZSW8HO1u?=
 =?us-ascii?Q?Cqxn1/NuQjO2B4EzoBycEx+3MDs7XIHjcZl8SSUnOgizyQy2Lb/rf+8LPdoJ?=
 =?us-ascii?Q?hoIdymhIog+dyC+vs2DZQMZGKpU82Xn2/4CbFPXxAILmDsMieZKy2Eut6Qqc?=
 =?us-ascii?Q?FG70AJ9trcDpeXR8n0c0fr2OvF3EOUUdkQcGTdI9aCyDkJIIJA6RUi+MRnx+?=
 =?us-ascii?Q?WtgPIZpCKAnktQ4wHpQvs1TFEu8rttgX3gGAwONxJMMCxed5ArQI6Sv6LxjM?=
 =?us-ascii?Q?e6NWtuY06R6RFkKzVs07v+qatE18hzMLCBz4mwTV75vEjQYS0xSMB+DW9iRu?=
 =?us-ascii?Q?fYSnP31pR2pAV37akg3ml42eE4TyWSd7tuhVX9ByqkGf0w1ygRf0d4OOHXA+?=
 =?us-ascii?Q?C3etApmQDEmCx6jeOwPJuiTMuDg0JabBKKqBjb3ObFvTE3PCk0k6Nzsy4TlA?=
 =?us-ascii?Q?V6d4p1S54/OWKaWBXUNQmuX4zm/4B35d3JmS2Y9C960k9JKkjx9TqCn/Df4/?=
 =?us-ascii?Q?tS9Aw5CNfoWZB4M7WEvWdRi8yvDzPYLXT1jCpPoxFwHL+MXjzGAomW/mFw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(7053199007)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4KumN6QMzumWjbOSNab1E0z+0wAG/6D2hD2tiLyxNzqdnT1MKDi4S/MOrYSV?=
 =?us-ascii?Q?IUoNRbP5SKBoIRqxvQjmHBvECUi7nH6mD+PMNh5fjtqBR0EGEKhGIXphKyJu?=
 =?us-ascii?Q?WlyIgmE5VPRDLKKq3i77qQAG28rb1e7Jd19HcgRe3bnGha9LlaOJEGcpQyED?=
 =?us-ascii?Q?5L5ZycXxXnIxXUxr9Cyiy8r48dzBwFds5QmmCo/vLAJLL30xLt+2Yzc1UsHt?=
 =?us-ascii?Q?9mpL3OSWq+1wIOVxOMW28ZznTYVqhEo3cKJE1gvJaDH9zC3Ztu7owutTNt7W?=
 =?us-ascii?Q?jUoM6vFZF/d04fGmEKLrf294gscj5l+5ZaYGhLCcO6MfJBcOGc7FOt4oIJCd?=
 =?us-ascii?Q?yZNpliyZA3IJBvGHPuaS7+MgAEUTZ/gHdzlkoZyga4C8OeJhUwpyDiiLwNyZ?=
 =?us-ascii?Q?qC55cJpQNOESXVhw/lZQB0c2iyfO/sP6+FPdtlhnhIyzFbaUEsZq9sa/3wE0?=
 =?us-ascii?Q?0NXdW+pzjpLi3Kxbyufkj/nZl7OlCoUo84BYzBigWTbv4g8/E6afmKTJLKsm?=
 =?us-ascii?Q?GLKvcsIQwteQb4MR/QeDUo7VMs+S1+CEGlUeLa10EMFNbF/zuT7L7UY19mCd?=
 =?us-ascii?Q?QmdDNs1l4jwzi70rP6Ljb8jtOc7QipSzqHfViqpzm1+VOhqwmU17XgwWV3kB?=
 =?us-ascii?Q?gy18YBNf/Heb3xPGU2iOKqddUwBk8A2H8UojOeIVHpI4xS3uKFfleCqXvq4G?=
 =?us-ascii?Q?oGNuBcb/VoMPgz7dh60UGNWV2QNV8CpRcKSep/ak53v1zVTNncxGPcpxwnte?=
 =?us-ascii?Q?ld/h5ybjbRh2HGoKYPnV73mwQb05VZvt/QC1D9gVuV02M8WJfV03aXP9Gcoe?=
 =?us-ascii?Q?5xfLZAQk+innoNP3x3tUE6tkiza7y1exFIAdm+EuNjr4QTNNuB9dZI9tDQqv?=
 =?us-ascii?Q?/82q6PHiDCZEIdurWCM3b7PfRxqnB+W43UgaCoto+chmpAQ7m6x51pDDSEj/?=
 =?us-ascii?Q?h6Eyjdp9Nef14YDnRcPxjtDZrZ5IM7TlnahT8Z5ZqzM0gquRo6EZ1fK/TrHS?=
 =?us-ascii?Q?Sj+bsziE9IGvoGoFyHDwYH39ldhf9TtsJ+1/REiCQ/m0gkmf7Qme0k0SdMhv?=
 =?us-ascii?Q?FG1lr+IMcmHwvw1pDHUUgonoUTSPMNHhaGhjyA/Q8/kQ7xBkQy+ijU8urLTJ?=
 =?us-ascii?Q?7araAQ0SKmJxupItNi/TEouRiBpus77G/pQLAepPCtH62/YuP6J6BiYLbBSy?=
 =?us-ascii?Q?Mt0e7mJpmn14Yh7HgIBTdencfbhxgs1wSAIMSnctWV7GJQ/ouSSPemBzjMTt?=
 =?us-ascii?Q?qfpoJMo2CNsWxRf4MCZ/7DyHE1gqwWHGqYZRPTVPLtagBc7FC1Z+hn/xAgGV?=
 =?us-ascii?Q?AEyIBwyhNNeImcQpbyJAo/i8jDKX7rq58/FKJyazA0Ai6CNbwp3uWfznw5SC?=
 =?us-ascii?Q?OfRhhTsar9tmeQIQBtNhN2wOfNkj/GPM2ch1MDGdti97cKt+spsiaxsdoDzU?=
 =?us-ascii?Q?JTGxzMb1/+ArBWGbectkit4IxhbOQkVzmW5R8AM4VkYkSdsFVkuuYOb/zav3?=
 =?us-ascii?Q?u13LtHQ1eTHWHkfoUDSspSZa0QqokK05Iu4tSZZlDstzUq1wy+e9NpXRfTJL?=
 =?us-ascii?Q?7u4v68UfBihZd1/w4q4voMQlVJ42gqM9MgSeCNxD5v8ipAZs5/8Zut1SXc12?=
 =?us-ascii?Q?g+Gm2WSwfvHZjamy3U3/qMiKqxY467VAqJ8NltEKUWmMC99Ru90JtG6CTijF?=
 =?us-ascii?Q?KqMo9RsTcbhwVxPRCj1VoeJjdyNUw99U9Fggm8El+ekVPaxido9+N8bZitKg?=
 =?us-ascii?Q?ppqU4lB6tKjPZfKF07R54/qwlD1zdZ8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5161df-d9a4-42bb-3d8d-08de4920d16c
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 10:30:43.6426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FkzoxrP5Yk0zP2nD3JCmx8W6Z8pg4r66XpBhJbEaXMJG9RS1Xb9D67CaOnU7GBSLzDXidXOXQBA0vCOB/FcKzJA9lMVPilpUOV1aKIP/5wg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7876
X-Proofpoint-ORIG-GUID: 9z_i2ZiRPwxQYwqIwxSu2wnre0NjB0UB
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=69564cd5 cx=c_pps
 a=2iQKv3wDMkjwRE6X2MvZ0A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=P1BnusSwAAAA:8 a=pG3TpReAhpfUgZjo6d8A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: 9z_i2ZiRPwxQYwqIwxSu2wnre0NjB0UB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDA5MiBTYWx0ZWRfX/AA0OwP5Tad1
 52OGAwPhKIqgIvsOzmf9zQRqZQe9XjD0sOl/863BTHaphKfzkAvYxKU/u+8xOqGU4NAKdWiUXV5
 f0RSAJ47UPID6JpDPunpwr/I556EK0pYCYO+NrlklNxeqlhPdwEY+A4IVWYdG7KPSbeqRgW/Bt/
 h926muol+CClqeD8Kkgw3IkEfOOE6pn09Vkrs8OaOzIS30IUAvAMSPL6BcMJvot8cqgBdVxDU1Z
 G5TRLLcc9vUdnUsj/zNeyUVRpTvkSDsbqV63aKcifEsppo0872dcUrVrfF/W30yJDVPB7UV6htB
 AvSYTTyN2BH4pc8xG2lDAkUjkwR/ZKXy8M6J2JPukJpeSMnbQP3KHAuVUGY1AhAOdfdzjFf6buk
 K87YhjSaxrlZR42q7a+LYJf3XplBTqRiUwA4ktxUio8/VJDkvpgWk6RvFjHutWmMzs7E06A9xB4
 K3AxEfW4++41eyYqFhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601010092

Switch from s_stream to enable_streams and disable_streams callbacks.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/ov5647.c | 89 ++++++++++++++++----------------------
 1 file changed, 38 insertions(+), 51 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 822804633d0f..35ec65a0e578 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -635,23 +635,42 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
 	return 0;
 }
 
-static int ov5647_stream_on(struct v4l2_subdev *sd)
+static int ov5647_stream_stop(struct ov5647 *sensor)
+{
+	int ret = 0;
+
+	cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00,
+		  MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
+		  MIPI_CTRL00_CLOCK_LANE_DISABLE, &ret);
+	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, &ret);
+	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, &ret);
+
+	return ret;
+}
+
+static int ov5647_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov5647 *sensor = to_sensor(sd);
 	u8 val = MIPI_CTRL00_BUS_IDLE;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret < 0)
+		return ret;
+
 	ret = ov5647_set_mode(sd);
 	if (ret) {
 		dev_err(&client->dev, "Failed to program sensor mode: %d\n", ret);
-		return ret;
+		goto done;
 	}
 
 	/* Apply customized values from user when stream starts. */
 	ret =  __v4l2_ctrl_handler_setup(sd->ctrl_handler);
 	if (ret)
-		return ret;
+		goto done;
 
 	if (sensor->clock_ncont)
 		val |= MIPI_CTRL00_CLOCK_LANE_GATE |
@@ -661,19 +680,24 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
 	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x00, &ret);
 	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x00, &ret);
 
+done:
+	if (ret)
+		pm_runtime_put(&client->dev);
+
 	return ret;
 }
 
-static int ov5647_stream_off(struct v4l2_subdev *sd)
+static int ov5647_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
 {
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov5647 *sensor = to_sensor(sd);
-	int ret = 0;
+	int ret;
 
-	cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00,
-		  MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
-		  MIPI_CTRL00_CLOCK_LANE_DISABLE, &ret);
-	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, &ret);
-	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, &ret);
+	ret = ov5647_stream_stop(sensor);
+
+	pm_runtime_put(&client->dev);
 
 	return ret;
 }
@@ -704,7 +728,7 @@ static int ov5647_power_on(struct device *dev)
 	}
 
 	/* Stream off to coax lanes into LP-11 state. */
-	ret = ov5647_stream_off(&sensor->sd);
+	ret = ov5647_stream_stop(sensor);
 	if (ret < 0) {
 		dev_err(dev, "camera not available, check power\n");
 		goto error_clk_disable;
@@ -795,47 +819,8 @@ __ov5647_get_pad_crop(struct ov5647 *ov5647,
 	return NULL;
 }
 
-static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct v4l2_subdev_state *state;
-	int ret;
-
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
-		if (ret < 0)
-			goto error_unlock;
-
-		ret = ov5647_stream_on(sd);
-		if (ret < 0) {
-			dev_err(&client->dev, "stream start failed: %d\n", ret);
-			goto error_pm;
-		}
-	} else {
-		ret = ov5647_stream_off(sd);
-		if (ret < 0) {
-			dev_err(&client->dev, "stream stop failed: %d\n", ret);
-			goto error_pm;
-		}
-		pm_runtime_put(&client->dev);
-	}
-
-	v4l2_subdev_unlock_state(state);
-
-	return 0;
-
-error_pm:
-	pm_runtime_put(&client->dev);
-error_unlock:
-	v4l2_subdev_unlock_state(state);
-
-	return ret;
-}
-
 static const struct v4l2_subdev_video_ops ov5647_subdev_video_ops = {
-	.s_stream =		ov5647_s_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
@@ -978,6 +963,8 @@ static const struct v4l2_subdev_pad_ops ov5647_subdev_pad_ops = {
 	.set_fmt		= ov5647_set_pad_fmt,
 	.get_fmt		= ov5647_get_pad_fmt,
 	.get_selection		= ov5647_get_selection,
+	.enable_streams		= ov5647_enable_streams,
+	.disable_streams	= ov5647_disable_streams,
 };
 
 static const struct v4l2_subdev_ops ov5647_subdev_ops = {
-- 
2.43.0


