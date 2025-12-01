Return-Path: <linux-media+bounces-47992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C858C98A2A
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 18:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D43A3A2E3C
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 17:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172D73385A7;
	Mon,  1 Dec 2025 17:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K/3OP1aH"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011018.outbound.protection.outlook.com [52.101.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139C628727B;
	Mon,  1 Dec 2025 17:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764611981; cv=fail; b=IO/VYnMk3AuS2YjpkTX09Ssrrzm/HaV9JMM/R3mTCUAIEHAmqD4IH8vEBSHkvLDec5JoDZdkR4OsoZVcvxL8YvFiBDndBREyZavCicY8IGBTbvZEsaMM7Itm91/naeV5I3VUObeYiKMDmmk/afMzp2drMxdz2wihnWPlcjFVbd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764611981; c=relaxed/simple;
	bh=1pMWm7APmsBfUKJRWe7WmtDNhAgxoJkG/YP95JKmWhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O0PrmOnR1YEJofhoHzsgqoA/e/BFFAFhyRoahPivWimPyTBeVakw5cVhy8HYIpxGi+lDbwT3BppOYES8/izwD7vNazN/bCKZIA69A3bm775IKkQK8F7aMRdmOVIbIDefVnCfvQV5fQ7y0onunbld2yfOr0W/7UWbF5gYcMM9+jE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K/3OP1aH; arc=fail smtp.client-ip=52.101.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVOslY5tCpepOuxiqHaHq3E0m0C4q+ZvKycpMFoqSDRgEK9ROP9AFJ+dqbtwQ0jcQy0rQ/3+vx9WUytdzNs+uN0Gz321zf4H7Xyc4N+WRqcBOn3+xG9+0whuzyjkhjsDMm5qLw95aLuvcl47afsI/fGHlFzF3ppR4NhBt3zxCzvEJpRmky3BQlrsQzfmdTHO2+CKLRp9ZELjX14OVFp8EPeVxq0agJrGgwC2zwvd2gvHeExSrKOupBXnJA7+0/Kp+3prQlirFnIsAXObUOamad0eiZTaah+lbjrXn30SZmffPkIfeF9VFZCYfOgUUQ+4tn+zMwg6p97wQroLITjhsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YoDk7IObndRcsAKYT2i+AzAT0ZVFB+FCq+nUT+ZNRU=;
 b=XkS7CErdeAnXua3/gjVddbOnbmq8H98Xp2UQqnLcWK61EGkZTv/B4a2rWn7R/f3mNcHo+hz3dWmPEY3IE+rVuOu8pnSMo2ErtkgYpOgZSOM7gDo8v2IccS+HSzefZr4kCmczm8oPDZHD+JHf+vaxFewEa1UJntizne5ZmvamMoUwxAiWBZVBFd6EI1rhqgw4BC4oC1XG9gNYCIZxfan+mGdVsDutsSOrpatjaFS/Sz5EAOkJ8PlCxbg0CL9i43VdFqKzAkkXegxpb0/3Ti8taj/huflnVUwdt0TVJH0HYpVhK+mpTZ2VRuqki15Q3MTSC3qqbjcIxLW+MKeGEc+izw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YoDk7IObndRcsAKYT2i+AzAT0ZVFB+FCq+nUT+ZNRU=;
 b=K/3OP1aH9Kit9YCKN9phq/fOsTRrN+zAXXFFveQZRy9l1/GN4XR71PhVjlygJ8y3vAYy+JQaz9QIwZsGauNBAx0mhYq+c68MGNGM4dW4CvAEcX42MMLVB558+7WgYfFqWHA/nVn9VDl66Db+EnP45EOpVw/XIBEuIm1iIdPRR7hI+ebc5TrD8+z+4uUGQDVfa62r8VQI6Mg/OFGy9rtSJ4EzvVvFRCrPZ2XGndYGgtuHTMNM/r0gH/OtGMfmuogGJq00FHZMFBWWW+CPoHi0XPIr8b3Qj/H6mvr+4FD96AAZ3oTBNYHLcpD/9vNc5xzjCA2vV+zS352i0fRZMyMyDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DUZPR04MB9726.eurprd04.prod.outlook.com (2603:10a6:10:4e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 17:59:33 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 17:59:33 +0000
Date: Mon, 1 Dec 2025 12:59:25 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
Message-ID: <aS3XfZFF8rmt8ZT6@lizhi-Precision-Tower-5810>
References: <20251114-rockchip-mipi-receiver-v2-0-eb9b43377fc4@collabora.com>
 <20251114-rockchip-mipi-receiver-v2-2-eb9b43377fc4@collabora.com>
 <aRyplYZOrGsSxSlp@lizhi-Precision-Tower-5810>
 <554971e1-6fde-4b2c-a2de-fe178358a4e3@collabora.com>
 <aRzub5Ak6DZpO5f/@lizhi-Precision-Tower-5810>
 <87049b4c-df7d-454b-a7f4-073975a7ee94@collabora.com>
 <20251201033700.GB21943@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201033700.GB21943@pendragon.ideasonboard.com>
X-ClientProxiedBy: PH7PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:510:23d::20) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DUZPR04MB9726:EE_
X-MS-Office365-Filtering-Correlation-Id: 182c577a-8673-4995-da63-08de3103622d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?tuOB6p6i0Ke/RS2zjrrP599VaENelPC5d/7vvCPWy4HDcI4jeEJLmYFr2XPs?=
 =?us-ascii?Q?Q63H20jbyyTFG/nBYQADvjFKELN4pzpcQo6de9ZWfbelz/JHbWRHPR7sRzGX?=
 =?us-ascii?Q?k7Dvcel+CrtoEq/CFfo91wHQ8WKpjhPnFU6PCCmJnalLJcI2Ym7jQbY0Tw0c?=
 =?us-ascii?Q?J3g4e88rYZEetTyRAdXa5XZxL6tALUSNwUgfx1JpgDvyUNDxyD3C2+zn7Thb?=
 =?us-ascii?Q?cBrUNrhIEnfJIiICCJPIB8AO+QIlzxKMl8EE+UFdfPLc7QAd+LPGjYUTKogX?=
 =?us-ascii?Q?CxqdoJyHqxuLr3HbqvVR3DfHYPB9YKr2vnItTP/EQ4o9UT6OCZw/HtI9pHlj?=
 =?us-ascii?Q?TDAEb5K41Wd7xdprn6BO24nLp2qwHhVKM6ozuFbz0ZTVMsde/FYI6T8mCUTt?=
 =?us-ascii?Q?I04BE6OGxs0p3bHWzx5tR8tmgD8rqfbMekZ/LnCymXhoCgFTt7mEIAmi1lJy?=
 =?us-ascii?Q?9XpUvMpemmZHAWALal73QJoIIsQEuelmRESBU2sZg52Zuom1621ZONg2y9V5?=
 =?us-ascii?Q?0VZ2KY9OOM9mcMP+JvER0RO/qrkB6YdwXIdhgltobrvX6Aw3M2d/agNdIBO8?=
 =?us-ascii?Q?DFDdPduOw/XClLX5cUld8E/V03MlsN71HzZLSzOwCjR881OBU0eC/NOg5rF/?=
 =?us-ascii?Q?tgVqrmZ+LZklJdz59cEvfNglAqyFl54eVG/m0fnotEqEcfYoI0pp/Ux29/fp?=
 =?us-ascii?Q?x5bkcHqA96ahUEWT37u11i4gfJvSgSiAMjxqmeRPVl2pROdRP/JeBr+k6xdR?=
 =?us-ascii?Q?xSeD/5hh2xUyUh9jb5FzqA1uMc3XKVIv7oQW2CAP94jfswbo9pSfQfTCiJQ/?=
 =?us-ascii?Q?UyHp6p4tVNKmuK8Hzv8TcyvwLI7vnIJcYn/gGiSxqqEkrVL7uAErAtlmmRc9?=
 =?us-ascii?Q?It/HSz+1em+NeKJnwFxwR1l97igcFWizv4sAUc7WSnECInSS2+T1ixFt7yvr?=
 =?us-ascii?Q?haYbp+/fTvoz0iO/ZsAbMgHg/4ezPNPcgDXBaecAXKkAJoOHnbvD+HkaHqw0?=
 =?us-ascii?Q?8BByTXneIqvk5gbc7H20Tjhv4wQ5TnpoM3q2NFBWPUio2oZgC9FhAFMDpDsP?=
 =?us-ascii?Q?lFceP2Ncj2BaYGMQFk5rm/NvUPWd0gT3Y9kdPM1Y35Sylm+4gcrajrHJT/uZ?=
 =?us-ascii?Q?hyB3Uk5GFfICHreE3iZFQZj3qKB4txHF6gPEKS+S+h6ZnEuyrzsefJN5V+zI?=
 =?us-ascii?Q?r3T5PyVyArdFWBg1TkEcUPHFUS4Qv1V8xSMUX2Eo/BC/QLOH8zPHSjBHpzGw?=
 =?us-ascii?Q?SKUF7K2p2AtMAGIbH5fQM5KM8O96VcPhurydBCmApsESLPUt9dvTdcZ+gIxe?=
 =?us-ascii?Q?DpGkGxKbkLr5kXPF0BxRX9CDL7/dx3Dw2D+vBpOak5yEbukXdNHegOCvSpmC?=
 =?us-ascii?Q?oRiRvbELLiIipnlT+6paRjXrWQwO3Yf1jqzRCNJuO1pw9PC7e40FHJwG0pOw?=
 =?us-ascii?Q?1c8kIJ0Mbj5jxfj3GjDA7RfWCKyy367sJyl6X5Ihb/7HevoH51w1Ig1BaaXI?=
 =?us-ascii?Q?9lSAL06X8Adj1UKoA1frCjcWt1wyF3uxyN8A3UXlpGZBbs9xybeHJvIDWA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?aZY1DhlL2OvCoI8J87TVA2nJV55kMAXyZj+MqkbJvo0XxJDEorOkEE3EE9uA?=
 =?us-ascii?Q?gZslmAKBcxz+sPIVie3FlrhF+cXcS/TmfsK0PC6GxUeHkjLfTOv/cwkKZkxx?=
 =?us-ascii?Q?mme1daV+sZ2c+cYThOi8xN3qxeFOpSK+55OmUVLXWdo53EhYSaLttNHFo2bZ?=
 =?us-ascii?Q?kOOpK9QXkB1cU6XH6j2D7f+NI7Or0FIyy2Wy3oy+/JTE6xDoS4ZIOwYtDofI?=
 =?us-ascii?Q?5d4xhDBKQKJCC0K711PIhAVcQffPrZNI2Y02Zx2c4BCkV8qbpzIcRivXl4Wx?=
 =?us-ascii?Q?SKEaiHm6jyl8bvxk4sSCEO3R0075her+q3isOEvYxbyHuBYe/RRJtEkQieEG?=
 =?us-ascii?Q?DrKVep4gHeYPP20z+uhVO51XI5cApSqfyMQmVMe2cHEbLxKFqv3s+rKqWONa?=
 =?us-ascii?Q?lj5tuLOGfNIeZs87Y9awsEZLMI0QDDLuM/jz88A6AdBGLqYZ8dkxmp2zDG3r?=
 =?us-ascii?Q?R8fLIiCQC3j955iULszU2xlw3NgooqWLleyuqLCpTimnXYUg+187edkdjmEX?=
 =?us-ascii?Q?3qsX7d613Wo8EzBfDD0URwnFwNAr7fyCWg8qYiOvlNQ3OABq5oZ0Kxc6loa+?=
 =?us-ascii?Q?0623Fqe8qGusmkDsNruneU3y7zMtURzqJP8MAW/Mv+34iLRHemT9XnZ6HXdO?=
 =?us-ascii?Q?g/XlodKE2oAFvx6PW7sne5oAnBfI1xYx5hCX+hv+IIjfayJrgF5lGpltihBs?=
 =?us-ascii?Q?PNdJYjuEWzYTXH/myywVBrN5uruuZLO6zbOTiQoJfyn1FMntbWddOXA/VlIs?=
 =?us-ascii?Q?HAe4dmBl1aSke1wrGeFtq0Ubuyigm++GgWKRFZy/nkLdp0V6iIKax519Auvy?=
 =?us-ascii?Q?VDYJj2WsHKIbsSDKG+Y0HuoFWgoKhSQYEmYQwf9fb5/kCObCAJT1IDFsVziP?=
 =?us-ascii?Q?MxewElfqE5EKMR73AX7HqptC6f7/1PWa7qVyDDkynSV5FgCDx2wT4uELAJDc?=
 =?us-ascii?Q?GLFkyshjKi9UxiVrIxgnWCvp/ZiQlxV1/dea85gUZVkE4UANT8efpQDB4cQi?=
 =?us-ascii?Q?P6rggBzs9p988W35Fq6reuKhvJtSOp4FlOKxRDG5hqcc8X1OWgHQJHWoO5ED?=
 =?us-ascii?Q?2BpMf2R4ZMk2Wnp9eH831cTFvqPTmdQ006H5Avbcs9jmv/AROivui5Zjkqxp?=
 =?us-ascii?Q?9mlTjJO/bLzLvJe7sD/UgsLjEny1sJAAzqOni8A3zhuRgjfG321YDiNinfPG?=
 =?us-ascii?Q?NUNzr40vuuX9nlBnNvYC0YLWsAC2Hp/IfoNCssgXmaUHII57RgmWLMvR3vSW?=
 =?us-ascii?Q?kLO2UdV0+hfC7LLDqJOiNInKCb0bWsaCuW5Ajw7z3nnzDuGfcKIsBvG4v3gq?=
 =?us-ascii?Q?bEXWpAHxbE+c8KWMwEfztDlqg2hOBVGotW/obKnAYMpUi6oaXxhE/6A7GauH?=
 =?us-ascii?Q?itOK6relAyYae1yrB6nphkUhdHDpT3Y1kNztkiF/tWUgg5jy8WGbrnGjOpdh?=
 =?us-ascii?Q?S+Ubwu1nwbjYhA8kpNzbHVibKHqlVLHm4Hq834DxsuUrHXxYJxyvOQD55eM6?=
 =?us-ascii?Q?/oULnemyOCSd/HXXh3BtBtmHfE0TzOs1sibe1eI1h8/1VrKXWuMYj0nclLKC?=
 =?us-ascii?Q?6tQhzkGM0BlJct4nFmRHwKRCM0I5PGy51DGlxHrq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 182c577a-8673-4995-da63-08de3103622d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 17:59:33.7939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzdmy4P2s/o8xkAfWbBc00LaiFhCQdT40WOMOmvazxPD5BoAWAo1dinyBmR6iH5dcmEk2gqN1FlyAakA0579Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9726

On Mon, Dec 01, 2025 at 12:37:00PM +0900, Laurent Pinchart wrote:
> Hello,
>
> On Wed, Nov 26, 2025 at 09:57:31PM +0100, Michael Riesch wrote:
> > On 11/18/25 23:08, Frank Li wrote:
> > > On Tue, Nov 18, 2025 at 07:59:14PM +0100, Michael Riesch wrote:
> > >> On 11/18/25 18:15, Frank Li wrote:
> > >>> On Tue, Nov 18, 2025 at 12:12:26PM +0100, Michael Riesch via B4 Relay wrote:
> > >>>> From: Michael Riesch <michael.riesch@collabora.com>
> > >>>>
> > >>>> [...]
> > >>>> +#define CSI2HOST_N_LANES     0x04
> > >>>> +#define CSI2HOST_CSI2_RESETN 0x10
> > >>>> +#define CSI2HOST_PHY_STATE   0x14
> > >>>> +#define CSI2HOST_ERR1	     0x20
> > >>>> +#define CSI2HOST_ERR2	     0x24
> > >>>> +#define CSI2HOST_MSK1	     0x28
> > >>>> +#define CSI2HOST_MSK2	     0x2c
> > >>>> +#define CSI2HOST_CONTROL     0x40
> > >>>
> > >>> Look like that is designware CSI2 controller, can we build common library
> > >>> for all dwc csi2 controller, instead of every vendor create individual one.
> > >>>
> > >>> First try at
> > >>> https://lore.kernel.org/linux-media/20250821-95_cam-v3-21-c9286fbb34b9@nxp.com/
> > >>>
> > >>> Toshiba have similar patch
> > >>> https://lore.kernel.org/linux-media/aPZd39riAxqfw3mT@lizhi-Precision-Tower-5810/
> > >>>
> > >>> Frank
> > >>
> > >> This has been discussed already a while ago:
> > >> https://lore.kernel.org/all/20250507083837.GA11152@pendragon.ideasonboard.com/
> > >
> > > https://lore.kernel.org/all/20250702093806.GF16835@pendragon.ideasonboard.com/
> > >
> > > Laurent Pinchart prevent imx93 DWC CSI2 driver at Jul, your discussion at
> > > May, I think Laurent Pinchart change the mind.
> > >
> > > We can choose not base on imx6, but we should create a standard dwc2 under
> > > drivers/media/platform/synopsys/
> >
> > In principle, I agree with refactoring out common code. However, I am
> > not sure how similar these IP cores really are. Again, the answer I
> > received from Rockchip states that this is *not* a Synopsys IP core.
>
> That's what I based my opinion on. If we're dealing with different IP
> cores from different vendors, we can have separate drivers. Even within
> the family of CSI-2 receivers from Synopsys, I'm fine having different
> drivers if the version differ significantly enough that using a single
> driver would cause more pain than gain.

Laurent Pinchart:

	We need use unified standard for every one. In the patch below patch
is enough show the difference between Sysnopsys version.

media: synopsys: csi2: Add basic v150* version register
https://lore.kernel.org/imx/20250821-95_cam-v3-20-c9286fbb34b9@nxp.com/

	The register layout is differense, most field defination are the
same and some changed.

	I know it is hard to define how much pain and gain.

	But I think this one is closer to imx6's version even though they
claim NOT DWC CSI2 IP than imx93 v150 dwc CSI2 version. (for example, many
iio sensor/gpio expandor use the same set of register define for difference
vendor, but still use one driver for these).

https://lore.kernel.org/all/20250702093806.GF16835@pendragon.ideasonboard.com/#t

"This seems to be at least the third instance of a driver for the CSI-2
receiver, the first two being
drivers/media/platform/raspberrypi/rp1-cfe/dphy.c and the second one
drivers/media/platform/renesas/rcar-csi2.c (the latter seems to support
multiple CSI-2 receivers). drivers/staging/media/imx/imx6-mipi-csi2.c
seem related too, likely for an old version of the IP.

Could we please try to avoid code duplication ?
"

	Or do you think I should go through this ways (direct create one
dwc for v150) instead base on imx6 one to enable imx93's dwc CSI2?

>
> To explain this differently, for Synopsys CSI-2 receivers, I would like
> to try and support multiple IP cores integrated in different SoCs in a
> single driver. If, during that development, we find good reasons to use
> separate drivers, then we can do so.

I think if reviewing and landing process could go through smooth, imx6 can
support this device with a little bit modify. There are not technology's
bar so far.

I split to more simple patches from big 32 patch serises.

https://lore.kernel.org/imx/20251111-stage-csi2-cleanup-v2-0-371bb951776f@nxp.com/

Only comments change

https://lore.kernel.org/linux-media/20251105195808.297645-1-Frank.Li@nxp.com/

Frank

>
> > Can you maybe test whether the Rockchip MIPI CSI-2 Receiver driver in
> > this series works on your hardware? Then we will know if (and what)
> > parts can be shared.
> >
> > > Laurent Pinchart:
> > >
> > > 	Can you provide direction?
> > >
> > >> Bottom line from Laurent:
> > >>
> > >> "Let's keep this driver Rockchip-specific then. Thanks for checking."
> > >>
> > >>>  [...]
>
> --
> Regards,
>
> Laurent Pinchart

