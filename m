Return-Path: <linux-media+bounces-49788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F26BCEB8EC
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 09:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D873C30142DB
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 08:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167CB313E1C;
	Wed, 31 Dec 2025 08:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="RlZwXLUW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992413126C7;
	Wed, 31 Dec 2025 08:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170437; cv=fail; b=mdp1OiyIAbQvbympLAtkDVeublnyw3riHLRDIbqhcwaB8ZnfLyh/76qMViP1GtDUErml7icBQBcAfV/9LOxUrKZFGfh/s9C5OCr1cQOBycAHRAzLnla5GPUNz6xMec6YW+iju3oFowNwPXwSh8Prq0n+1vnWgs9RHOgDyFBc/ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170437; c=relaxed/simple;
	bh=l5nkOUFNDnFG49z2ItcyLUk4GxsnfWC7ejhJ1kVwgnA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oihGY3/eR/2ZXDwjGaNdu4+laS/7OLIxbpjqXZDXNhPblSXy6E8suHG7tMuRkKOs3vV1FOeyebuyHw1rrKDhma0OCR50jumFHaXq4rVwCGPITy8gCjGKxKJ1MSbtXY/5hvhN9XdaLIRO/c22qEb1vAwj0ZDxO0OH6SnNobcgouw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=RlZwXLUW; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV8MZ8m2737448;
	Wed, 31 Dec 2025 08:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=46QB2HyOT
	aOvbtcEMytnPu7wEQYnDM2IKYx0MPn5MrQ=; b=RlZwXLUWeLrKfU+u0rOaL7H/6
	YvMEdmTqRXw0qU+ygP/geLMi/Mf+36yZB+A5F9Pw/PuSZcDwFNxn91vqAkNyONbP
	6aZglEgV2G5wWHUvd3SiIGMQ+JugDJvbxC/D2/DcLcLpP9qCH/HVms3uI+uJ58l+
	lRXMTYOr0X10UMbEAn57GxIGGYZaqcdAK0UawAn8urWF41CfVBZFw/FaXDkRw2dw
	Hyr64Bo9nlTpqPANudqiy/bADFqdIJWYfqxndUQ7Ak08yUh2hX8S9GUAa2Rns/8C
	QxUP8ZwkgNfknpGyDyQHCJvJ9TKsZtzJfAGjo/JDUb4gjqikpmdUkIXX1zHyQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011018.outbound.protection.outlook.com [40.93.194.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba6e4umtt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 08:40:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVaP1oA3SBufMEr0Yzzafc0luyVofQbRQcT5FKfRTPypzDCDOD1eEOWLdjAL3Nj0Kqp39YW+150chB/voo94SePtONEIHXOM8O/4XeTsEW5+9k1TJ9zGgEkS64ZsBrf/RWqbK1D+HiBKTgbOu9hRSWaKYuBKcpHBcIzixkJgdATXWB68WcjoeaeWeJDoMHni7RBnHujk3e6Hig4ZyxQ68rglxCB4suYEQz1JOk05Ygruv7FyVzzuGn1OYjydlIAngNE7awywbE8XK1X91ROOXkwPxBFa0hV829g6qsubgAes3hD92J5pmDHzvC1XtReavuZbN98x2p3jT+A55TpR1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46QB2HyOTaOvbtcEMytnPu7wEQYnDM2IKYx0MPn5MrQ=;
 b=Ra/upH9DjIMMUkkoKTF3YQRYXwSvKlIwUyjvETaBY3uMUMP7QTK1tK1UfijrGtIfIZgYNthx+SLD/Cg6DftQ0IxXq8U+RSIL+UZmIDgb68z2/4AGq1T25q3bmcOa8N8dJ5qdAVQ+xLXWKEkp0La1cDGAaJfz7cwwyJn9NLs50CQqW1EiBc0LdjuBRk+RMTgrNNCCR52pLt5H8l6C+aqk1Yo+U2JSQAD6Mz2kmLGPJiDdU0yrOF6jGb9GrlUrO7h230LOofinrB/bJ43zmbg5Ru+Frvai0K0b2nB6xsY3CONmefmNRItw9wclM2QnkAnlWAIv0g8DyAmjVQESMTaIsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by BL4PR11MB8845.namprd11.prod.outlook.com
 (2603:10b6:208:5aa::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 08:40:06 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e%6]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 08:40:06 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: tarang.raval@siliconsignals.io, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, xiaolei.wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] media: i2c: ov5647: Modernize driver with CCI and new stream APIs
Date: Wed, 31 Dec 2025 16:39:21 +0800
Message-ID: <20251231083924.2657165-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:196::21) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|BL4PR11MB8845:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d3f6da-7e6f-4d03-14f8-08de48483304
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/EZyyNxceg7Ey/CqCRGNrC3fFGso17H0Hbmed5oeQ6SENMhwrPzpZW6FUTiI?=
 =?us-ascii?Q?vvh9ydWQcTZuSwCWE+28EU96og9ZzUJ3t+SevjW527t73texTtzIS0SJZS+1?=
 =?us-ascii?Q?6MQnoBqKdkzcxGy1Yp5wwicJ5rO9oRDvfLQk8KLCtiszSCvpRfG2NdONOzeN?=
 =?us-ascii?Q?RUt8yE2z+MAsnarWP0Hj/VhVbyPJa0ojANzGmeM2NDlLUYjeyNfzX5rkNImy?=
 =?us-ascii?Q?D6mKCVP0j3GaChFxOqdek34LU5tc+CeSByo0/rkSGIZI/edpbCJ71z80dWZr?=
 =?us-ascii?Q?MM02Zy3JvaCz3/RfsZY9taBdo8a0+TrOTTeb2pmzAnZILCiEIZf9VDbpt/ci?=
 =?us-ascii?Q?wjXbArweiw2ATVegbK4oUBL3lXfhQ2ttVbTZnP61j3yB9FeUIm/aifx0pLQo?=
 =?us-ascii?Q?mMqcULITegqfn6iM7lNrFBVYVHnI/8jpEXytm+FVlXD0EZKsB2ph9mv52orE?=
 =?us-ascii?Q?tGGtgppCeVYvkAjXQOsrT1xRDhUCHTBDC+OaZ/tQRraVtE5H4jpb/cOMtLV0?=
 =?us-ascii?Q?emVj1FiGegKGmRQR0vIwL/KrFsGkISlTWM63ZYZXoVqpjGFqLtEcpQBORwxt?=
 =?us-ascii?Q?9c7nP2vwoKGBg8kDAYqEEqEFvokyFIMWZXIZWKL0gbjP8/6DC3IIGhKe+J3R?=
 =?us-ascii?Q?0FcQSvs44iLUNu91rIGM+FZDftjmUP9eU+VD1c9rwfACJyF12ltdb0G0lb8T?=
 =?us-ascii?Q?Md+b5AvENAETGVwqc8luXU9HRB6bQuK7ozfv7fnZ+xz2YYq6Uy+B8Hsnp2Km?=
 =?us-ascii?Q?qyQXmd+WSI/O8mCWONnbRLbA62IJhlz3Z1e0Od3QgjbdttwHqSB0EQoJ6Lq4?=
 =?us-ascii?Q?YXIuXTnsxTyvW+ctPzpDublA+jffnBJjaSCLVqkzmnIr8g6nPOq7h4DIBX85?=
 =?us-ascii?Q?MXvkSisYbB4DWGpfZBlmZGJ3LNfMmaktxZGyZo6Awai2Hw8qJyl/Us2p2J8t?=
 =?us-ascii?Q?lwCOSxBuh+J+p4V+Q0MMa7Uqe4GG8L7wXBWSpmbXvRU7eB78y051jGE1jis3?=
 =?us-ascii?Q?x4eqVgzGlF8rTvgTFuIxzxTzKlPQirg0G6zpdFZZXerPiNUGf+6AICIAgj2V?=
 =?us-ascii?Q?LjlpYLTaIqOUkw2PguX+4Jj0YxeIyP+eJmOxrCPB79R7ra/fQOIQGOe5rNqm?=
 =?us-ascii?Q?TOzyJzflDu1oneNLPuWMP+i3TKZ4TapYlyuIHGZ5sbY/eCc6ygWT2uil9sGr?=
 =?us-ascii?Q?sUejsOorgWaEhwYQKdAoucY6v/MntJVE2uoCP9IsnOOTY/Dcs5haWkjUvEYm?=
 =?us-ascii?Q?hzlIm22WYOmoIQyShHL/KHSSdeExVhFFr69rLpdid70/ChwsLGyijStS8v+9?=
 =?us-ascii?Q?z2UsTmmC2sbHoXr4/Ld5ZTCG4YS3t4IwLkU97QdNmniRDrR4Kf6IXHJfuiS8?=
 =?us-ascii?Q?MrBSTGoBadnEclgJbs6EaqRQgADkni+5r0BZXNR6V/UBQBMzpRthkeh6KD2f?=
 =?us-ascii?Q?fviYlkRdkGSfdK1wpJNBQnPADaSsa6BSkNP7ksDWiIwMLHEHbkiCi3fqedg+?=
 =?us-ascii?Q?z44zUVVQC9Hu1XwCsQVz6rnWcS93TdrfhS7LNy72ZCVJAVQ3jurH2oEi+g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XAiF07AibpFJb9YSZG73IlIRkN8HkPNUVglLaie/N7zIHtA+7VsoK/QULxs6?=
 =?us-ascii?Q?Fw5b0XdK5SQm3A0biKCmw9V0vcEhwlmKNR8Wf4WbLH/72uQR9RRK02P+8tus?=
 =?us-ascii?Q?g9Lus7RgjCi2K7pEi/9U0OnafyrRQ26Hx4qiq/fALSbSGUZuZpJqHwNhsiSu?=
 =?us-ascii?Q?fpe4Ljo3irR4Of8d65axpwqrHe1hPhoe0/aD5FyfIF5N5X7Npyi2gJx8wwF7?=
 =?us-ascii?Q?TSsb2pW34kGxB0LFCmoCGOqeemKcoIsj7sRG0ga5ip4gJGPtpkVjczUS9HSc?=
 =?us-ascii?Q?0wav4a+xNx7R9qPVf8JgOpxeS4RuwtvrZJTDcw156JM7CDOxzHoFHKY4U808?=
 =?us-ascii?Q?fGra5RZyyDezqvl9RHej28HcMJR5KJqgPizMJZwytfyaICVCLIvY0qZBnDxn?=
 =?us-ascii?Q?obz82wDWBfUQBbwVdZPhl8f7O9Rxjz7WAji5p15lmoh67IgSMZZpQPunnOUI?=
 =?us-ascii?Q?MbneKqpEBeabklFzegpNo+dWoe1uPePFCy3qx4w5gjqEtSB+O4mD1mWRYq8x?=
 =?us-ascii?Q?z8LUajxETbNAcjB1ha/ha3IJuf38+9cRka4juRlTbSy9uoYEWvRUoY8Emrjg?=
 =?us-ascii?Q?YnYZ5Y2g2thzT9PK2LN1iBWMkOtfmnP+XFUHULaTPXtttdyzIxpZrJWNR2Dp?=
 =?us-ascii?Q?6jVmMbQi2h/9zyk6MpioQWftTfXO1sCUVtKmlzuHfvYiI7TKxpugW9AJ/uCN?=
 =?us-ascii?Q?pgm23TgH84QMSg8DTylPInB3/u3iGA0MIqWneI5d3dtxZOyV9iNccQnLasW7?=
 =?us-ascii?Q?xmcPdH3v4oTSBpK6Iiggx2qTcfsDANOR9vy6O2GMyBea0ChRHpCahwqrmIW/?=
 =?us-ascii?Q?csXwaLWPrUAdueVtp+/unTMr6/Z1igKxhEHd+3KyqW6h5qI/TtD8F3I5b2ku?=
 =?us-ascii?Q?I+QZwBBv3ajVQzm8vfToaAOkj2WnKX5YVGrQ5DbLFo/sYR8Hyu9dTKHicHwq?=
 =?us-ascii?Q?NlC2vKczs3HojNbxdDGfvm3QKXAuZAFO+nqGOCbbZ2sLIIAwODKseviVvwts?=
 =?us-ascii?Q?MxIEyx3cdYPib4l/zRmR5ouz+dgjRm48GMyleaLHLBkqfkVyUaNFpdAH5x3X?=
 =?us-ascii?Q?BkcawrK+o4avSHw3olFgbAfyPXKwu/M+EpeM3COiHLxx0GyqQmZhtt5nOdtF?=
 =?us-ascii?Q?AfcC5u2DLboI+9ani70TKvr13ZeaJx5jde6DepKTjOnXAKC1FyGBvw0t6eHG?=
 =?us-ascii?Q?3XiWNs137Il/7UZzEwHEVah98cxWasqcsy8GrCS8lkBjijZqQSWWMXapU8Qz?=
 =?us-ascii?Q?Kh9FhRlKpAjlmbFZBRoj5DOyhT1QEhbp1KyynM02SSEYYxYrtKeGCBFZY09b?=
 =?us-ascii?Q?WSRdDMqLI+xG89zV6EGSI7ICvxYOH7HMgd6JCcfzG85W1Pyb45jBdWwaf6sR?=
 =?us-ascii?Q?I/vBzUhWBh3K22VtS1gjw8+hTEVea663YdXU3A/MD9+EI89PAe5U1H9ewJ60?=
 =?us-ascii?Q?9m6ZDnWL9WdPN15zIVZOlwLwjNAxnkAywHgayEZ+QU54slsnivTdlayWnTNb?=
 =?us-ascii?Q?W8ApaWg0EeQt239I9GK1UVZh+3ELD+Dk9ty/Z0pwO/9XVTpBYIF5cGjFpAq1?=
 =?us-ascii?Q?vFuIpwH9/E7iygHlK1lbkM3uOjR3882G6yF18mWDKHH13GrTFXWtjpDwewLU?=
 =?us-ascii?Q?IxHhDQ4uWAFaJqEvsQoCIiF0VHLMc47ZtqLvBa0GG5fw2oeRFPK1vTpNNW/X?=
 =?us-ascii?Q?sBUKDId30Mhq+inskDXbebu0dsPltxY6SjPtiUpQb5XU+A/MqD3sPsRDPzlc?=
 =?us-ascii?Q?Qf4aZTC7eVZFeFi1zSb4GSuYJeBjiAk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d3f6da-7e6f-4d03-14f8-08de48483304
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 08:40:06.5922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SfVr2vmzV+Z2mFuIW6peqlSN6AGpuAMtIV17eQlCfDKySYJlddujLeg8ke5EnP6OY6aaJZgpYbmsVwObKoFlmT87mDvCCrb8Adhk2kPspBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8845
X-Proofpoint-ORIG-GUID: hlyM1aozdU2LE3F1qjJfQdFf0g_gJjl3
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=6954e169 cx=c_pps
 a=jA10WLhXiBAWrDGJQFCh7w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=e-NImqCR5jq8QaWzZYQA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: hlyM1aozdU2LE3F1qjJfQdFf0g_gJjl3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NCBTYWx0ZWRfXx6ByxXhb4f24
 WngE6rNKhlhShS7BOGCORQmeHw7ZzDPUheCal+fsKNIc18Jff04oqM4pPP296D/Cb3j7YB/sSL5
 C15tfxND0nXsnLg+lIKI2rF9E48ZZEGaQdhGD1dOjFzGFLYcoCF2gxH/sY7MOPjOojxtBRZVHmB
 evfqrsalgI8GBmPsch7CVphPJAY+w1vOPGI8Fdqih7Ic90asuWAxTAta0l9d7MyxPiqWR5dKEvO
 +VyysLXobogQA4j1ZhIBlzfAQJE28vJBGZ3fL0PRiNipC5oz2YAEqAUOWbDeXVQ9o3JRhpIVITd
 Xuqu0eO7wfY3OjIyFVqmA8Mnti/7pBksjKucGjSYwDwPI/pFI97cJ5pMmugi5iztNjh++GY7GKQ
 ZQYNse2uoxvK4N2w9MfNqsmowryuCwjAvdM53INE6G9xyM74OLAu/2/k+F6E/DAgk4/RzOF7c3d
 cdxXXm51Z5Wba9OzH3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310074

This patch series modernizes the OV5647 camera sensor driver by:

1. Converting from private I2C register access functions to the common
   CCI (Camera Control Interface) register access helpers, which
   simplifies the code and provides better error handling.

2. Switching from driver-specific mutex to the sub-device state lock
   and properly implementing v4l2_subdev_init_finalize() lifecycle.

3. Converting from the legacy s_stream callback to the new
   enable_streams/disable_streams operations to align with current
   V4L2 subsystem standards.

I tested each patch on a Raspberry Pi 5 using the following commands:

rpicam-still --output test.jpg
rpicam-still -o long_exposure.jpg --shutter 100000000 --gain 1 --awbgains 1,1 --immediate

Changes in V3:

 - In patch 1, I replaced cci_multi_reg_write() with regmap_multi_reg_write() and
   fixed OV5647_REG_GAIN at 0x350a. I also replaced the original ret = PTR_ERR(sensor->regmap) with dev_err_probe().

 - In patch 2, I replaced the mutex with v4l2_subdev_lock_and_get_active_state() in s_stream().

 - In patch 3, I replaced err_rpm_put with done, and added the ov5647_stream_stop() function.

Changes in V2:
https://patchwork.kernel.org/project/linux-media/cover/20251229023018.2933405-1-xiaolei.wang@windriver.com/

 - Proper register width definitions
 - Fixed formatting and indentation
 - Error chaining implementation
 - Simplified chip detection logic
 - Clean compilation with -Werror
 - Add a new patch, switch from s_stream to enable_streams and disable_streams callbacks.

Link to V1: https://patchwork.kernel.org/project/linux-media/cover/20251226031311.2068414-1-xiaolei.wang@windriver.com/


Xiaolei Wang (3):
  media: i2c: ov5647: Convert to CCI register access helpers
  media: i2c: ov5647: Switch to using the sub-device state lock
  media: i2c: ov5647: switch to {enable,disable}_streams

 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov5647.c | 389 +++++++++++++------------------------
 2 files changed, 140 insertions(+), 250 deletions(-)

-- 
2.43.0


