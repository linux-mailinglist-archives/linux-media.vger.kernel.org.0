Return-Path: <linux-media+bounces-34994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2907DADB8B5
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 20:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA50718901C0
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 18:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EEDA288532;
	Mon, 16 Jun 2025 18:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IYPl9JjM"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010070.outbound.protection.outlook.com [52.101.69.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED33289378;
	Mon, 16 Jun 2025 18:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750097803; cv=fail; b=LCsxkl6R7sV27ZNhrMn3MzEDq+8SE6h+wVcsptMuGfZs+qnv5qxBaeBnAzNxNmFno+yBC0Mb86LWuiWPt5DwEpN+ZsitugQhoOy5ppxuy4Vrno/voxaBm4DFWXBuaCWSucjpdtZsns3FytOxFa0YdNIhpHzp2T+qvlYhYdZ9HxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750097803; c=relaxed/simple;
	bh=5tsRFBVxyyDirplPzyShSC4BJQwwXRlzdxNzhrao1Nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RLHhhiVAXidwcbtlNuhwUQRGTkZhMirPzFcFvjPqH8UgkLJKINt1SgAcRF9lTpOMJ7/ROFTvlU6VtAwphYpB8D7pqntfZxMUIO4htP2mrGL48/I3N47Xx6puU5xCAv1Gf6KAbxTnCG26aNSk77LwP556Skyu93jNkUVCgPxCNyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IYPl9JjM reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHjsWlqzhM5XQlsOrUBgNefwg/UariflqnGh3lRiIOJamqL/cyxyAIzdpE44ZWeEgIDloxAj2REd/zJDpMxxKoXVIST/F/l1R5oPTQ2ETuuSwAgl73ndhcyS88tgQzbuzX0gFMjC4isLQ7QFui/vOHdvone1+E0nwWEjFI0e/5ThufhaI3rF72tDEBLDzn7SEVIN0aAYbNa7WFfOtE1Prcv8Dk2z02AtyOa+NNE56BLlkR37mN0nb6VYQ/ZaN2dZixFPFXI8bDiiLwVAXiH5MGO8fLYxQlkWWaX+V2vc7Cqc+hb4Xm50K4YqYGMvih38xEoyf9r6oI/bVjVMIxWMGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QV7r0zhromraftUohQXkVkTPVwHgCQxQFNuI3G3rGwQ=;
 b=Uz14L9mxAihrIRCSbmDBxePX1TCp9iEsyEp6L9RMJl4CEHAGo0gDgXRnLnorv474tVSQkN1xN/zPAsLpW4CGDvebv6M2dLQ8sfMrFTySmuRWRiVKKFVRmKsW3BrcQ1BO6VPWZLkRnqc9hUE0rBE1Guw4ZpK1WliKzIIG+NEWngGjMmZ/NkmQJOwRnwwu+Q0JRRGnbL8OB/rsh+sJk20xFug5GNe6SnzpEIZhNV3DTCF3JxLwMisk9qlh+ac3PEv4vjFRLVtQ/Rx195/KO4Qz38buocXdBdYqbhDKPZRwZQ/tb6FQ2PBqFLmF4BhwdOQ1Zy7KiJLk2xS/S25fBV/NqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QV7r0zhromraftUohQXkVkTPVwHgCQxQFNuI3G3rGwQ=;
 b=IYPl9JjMpiMGVxhWc0h6M3dH6Lsju8hYmdeDQQ3RugsJQwyt0ts1gj3BW9qCfqLVi1hT189PtDRAsQ53XVifDFIaf0Zcly1d2l9l1swWPi2iKUOvMq4Ik3kHV06PHqKK5YxEn8+yNbeIrZdKsma3+ArNHvO8h3H7OaFhaJrxY73mgrzJOs2Q20e5gOreQfNw/RzF5xqmLxYB/ucfVGIWn/cjNKG9lzvetfe1CojXKMaMcxNj1CFpoldgQ6AjBqPimW7vZQzSTM9VUXOIiMz+IgBnRj1pYRFkHEJBWFsZnRInA3Fy/tc9uFUPLeUEKTNnYn75xX03uZt5A+g9cCKWpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS4PR04MB9691.eurprd04.prod.outlook.com (2603:10a6:20b:4f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Mon, 16 Jun
 2025 18:16:38 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 18:16:38 +0000
Date: Mon, 16 Jun 2025 14:16:30 -0400
From: Frank Li <Frank.li@nxp.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: media: convert fsl-vdoa.txt to yaml
 format
Message-ID: <aFBffjCXqA/dMn4Z@lizhi-Precision-Tower-5810>
References: <20250411213601.3273670-1-Frank.Li@nxp.com>
 <174448105342.1415739.9619142538994119426.robh@kernel.org>
 <aC9xv08a5k5Pz1t+@lizhi-Precision-Tower-5810>
 <b97c254c5169acb32b9f65f71b363a3eb1cfc8a2.camel@ndufresne.ca>
 <8b18533170e7ba395c574de69768dcc27f718767.camel@ndufresne.ca>
 <aC93vDMFM7LsoDD4@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aC93vDMFM7LsoDD4@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: PH8PR15CA0011.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS4PR04MB9691:EE_
X-MS-Office365-Filtering-Correlation-Id: 75200bee-8455-4507-d223-08ddad01efd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?NY+tIrLspy0ROrlwg0x2TJjzIOlqDtBy5WPM6qvtvhoJwFMp/mfljGCNRS?=
 =?iso-8859-1?Q?sm2YBtTaHYzzO/3JSayx8k57PG/65aDWrbkFiYoF1EGKpfVaQ2gAPHpx5x?=
 =?iso-8859-1?Q?jfZYb91XA+wlk8LetmEh0q7OgYCOMHm0QAmTDJqqJR5Mrc/ZCtHEdWfDmI?=
 =?iso-8859-1?Q?fjoA5jHVL1rGeZdz86h/UYQwAJAlECjVc65W8sQ4A0OKp2L1WzrsdPYhuS?=
 =?iso-8859-1?Q?YMHalt7tYuf1/2+wIxSIK8wSGxXBpxM7U4aM/2obXG2wp6gPSjProKBgZ9?=
 =?iso-8859-1?Q?ZwG2QSVhoNO49wXXXyQ75L+YfXJWDEOxsx6ZnsbS6bB54ef3ZvYuu0Rm4b?=
 =?iso-8859-1?Q?FZmORBXbxx0kar2XvOEPa1+hPjoUYHLczZIDng3Xvxp5Z6sgyLEfpd17JO?=
 =?iso-8859-1?Q?LEJWY/eO4G9KbYl/ArWkslPypCTZSgPHY6mU8J1a4SbQkEHz/pr49Xuwm0?=
 =?iso-8859-1?Q?q//nsItV1qFGgKBljx3m7cG6rOTXthxEIEMmcRbRd2t0OZeRE7w6xIQY0h?=
 =?iso-8859-1?Q?+QntVWVZn3B4ZONBSSnWAloBPDC/G6P8sY+M/3q8yQiyElTPJHZfBjK8t6?=
 =?iso-8859-1?Q?o4ZWnpXzHk7xPw3VOFHcN5EKrSofOyVQwvfTf3Tm2/79N3/xwUKcz4EdiG?=
 =?iso-8859-1?Q?qZuDb6B0xjl/rGIBr8L2m7UlfwjXsssYXQUkCCts2hehzHRnrLRO5lEFQR?=
 =?iso-8859-1?Q?nxobmOdmdfuXbX0+yY1GXI3YLr3HvUGbGohJI8L7LmPw1E32yhnQYIDsYx?=
 =?iso-8859-1?Q?gPBd1p9FdQ58YtEoWnZNqjjDws+0oVzB94ishEBf1s7dGHH98vuMgJbVCY?=
 =?iso-8859-1?Q?1+KZYX2//ikyiGINq6M9HIxBEmXGOa7R6oS80LUyIQviwTxpiOWLvpLkFd?=
 =?iso-8859-1?Q?dk57Yj2fLXCz1THW9/JTbOieywxV0sNmRN5dU/bVZ6jMM+x7LlLe4fKYSh?=
 =?iso-8859-1?Q?X2UwddFZuJdSMHos9cRmwm1wWotPrWXL1YQWMIfuM0Zfh9i1Pdp+zPaWBH?=
 =?iso-8859-1?Q?cfkbzrbsvv+Rv8cUDYcp2tQDs/y24vtGTU1hW19bk0qoVf1w2ZYzNmRkqQ?=
 =?iso-8859-1?Q?ZTMWzin/xheRrkmGVexwqLCl0l4IsKcF+YKhIExuwQwcYGMv+x8+9ufW1U?=
 =?iso-8859-1?Q?nmt64ax22eaw/OUsj3YrGiXsiO/3OeK4niFygXcP/sveAMKiRtv8EGhsqU?=
 =?iso-8859-1?Q?PEv5+no8HwqjjXG1dyKBKX9Na5xJuSEgbluCU5OvRT55dUHPdBfR38NCkr?=
 =?iso-8859-1?Q?Wz6L0DJqWgdS0FcMrmUXZ7aXNJmKDzfT/qVzDeqvqapFZdNsN1gq8Wt6J0?=
 =?iso-8859-1?Q?aY4sBEMnc5JZmVf1yJsDIyzMkmuz19/v2ISftwdQfWJFFvhsjUMG9PFn/s?=
 =?iso-8859-1?Q?080uhu30vLSJAZra6LFWb1UWmaquTxq1qX+mrApV085DFmJE29yUbeg/1Y?=
 =?iso-8859-1?Q?xY7TYj5kqwUAEYCOm6sQcb2g+jAdTrTfYdZKYqIjZhJSXhJE11ni2rh2i7?=
 =?iso-8859-1?Q?weEFu3bHIPlD3MJw8nV/8Q/uaTxNWSYkrIZMvCnGp1Gw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?PSD5OdjPDThNrKvYLqsQSibHyBy95dTMXiqlIgAt2Im61qEY+LRAJLa2is?=
 =?iso-8859-1?Q?gLMWjN9IGlN0ZgUlXqXdJ2dCvk/At0VqIGxzo5IH0p5Y78DDE2W2y0Pa/U?=
 =?iso-8859-1?Q?sLKNzGNWE9RN2xkLQMAcY98coSHv8Tf3vXqnuV4gC3tl1IC0gOyVge+KFm?=
 =?iso-8859-1?Q?tepvL7Sq3cNo98p+jjjAH8kXK9OiuSpfWIiJnrmjwV4jdgBCQv6staRjrC?=
 =?iso-8859-1?Q?nh7yXWSdOs7gyI99OifVG8z09zCcGdMAdRoio+LJx4xtLn7Cx9+UHtxxGs?=
 =?iso-8859-1?Q?TV8o1p3cPs11E7NVX5mSAZa00GuoyEpGSQeUiHalbdTTVLh75NgQvBEc59?=
 =?iso-8859-1?Q?ew8sLCgM1Vc0XKdLnUi7SXuMT4NQ4z6SH80pDSZV3X4e8ToJyy6WBrh9NO?=
 =?iso-8859-1?Q?QRTJRKhQjf0ALw/8TfT1/ktqNA8dWTbfEQwNjbuotL522ilNhxJj2unIl7?=
 =?iso-8859-1?Q?9aLzSVJKK0dakelEWRFCBX+ZhKvIljUUThO/SH+xFzMR270Aff55rDQB2N?=
 =?iso-8859-1?Q?K7TtUvIceBaBCf1pI8Oek3HhTSDnIOBuhAZ5673Y03tZyymAd4YjJoXycR?=
 =?iso-8859-1?Q?DdK1G/yMBdftJTLG3evG1A5NHkCZ/Bo+BDpnod/9ge1mvDOP2Axk3IMaip?=
 =?iso-8859-1?Q?drbkY5JrC2jS1ikqLZG9cyMLvfw9MwLPX1qoZmUxFJIuofnC3d6tk4lAfH?=
 =?iso-8859-1?Q?VQkGX1iXgYTbxn7z8hskkLlcYrzlbsBS0k19wu78JR/mKjabdNo+zk9V/V?=
 =?iso-8859-1?Q?ncXqrlR2o3ay/TtpIma3m2tQKnZTj3NJpuUw5Vq9bO7rkAH6B84Ia7PHAx?=
 =?iso-8859-1?Q?6IPq7tBPRF69kE59g4IGcV4Y88cAoNeujQlF5TITvq+spluHeQn4HD/a1R?=
 =?iso-8859-1?Q?oVMnycd4RWsnDweCfyUAIpnmoOapQDOAXP7gbYMhKHcH9go8ErnXJb0uFl?=
 =?iso-8859-1?Q?iILRS2kY2EQAsfpKwt7Wcym+GiMoXp/yvrQYR47sQVH2xwV4mPsOAbz7DL?=
 =?iso-8859-1?Q?usJMixaGeFnQU/6decgiSDlPdeW7Sd/Ffp7a/5yC55RB+UiP8jWWKTdqNv?=
 =?iso-8859-1?Q?UMv16rgEi0lHjMYaxq/SJyEr7SDUsknHaA5ckqcdySbJ1Q0Sqv93N32fv9?=
 =?iso-8859-1?Q?D7CGxPOC2eTuvApf9QxVhprxdcuDq33zf/k2PCvc16ZCQ4Nt22yWUmOqck?=
 =?iso-8859-1?Q?hyUG4ezjqf2j+0569t1IY+WiZicnBFWIWL1IHyziuEgM5quOx7RIIfBXKZ?=
 =?iso-8859-1?Q?nqcoUnFKqTX0TfOg6cpxKIMIOkSORPTSNX5cbf7Hw4FD8X+j3a+weur4M2?=
 =?iso-8859-1?Q?TDKsdYIA/8iWHH0N6eiODV6i5KnxRCZk6BtfNV4EomODxm9euA1SgE/IsJ?=
 =?iso-8859-1?Q?HTowdKY9tqcsSniCgz849ZCRsy96FxbFfa0sLXorA9sEKwO88uey/25Ibe?=
 =?iso-8859-1?Q?F92I7DAHPrxxS2iMyIKtO/e31+N1WDzD/NCCD5ps1+JNI+/NAaT3wk24EK?=
 =?iso-8859-1?Q?bkC1MATU02XCbQqs0+bO2TfUhFBjrZMmGFIp6m2NBeAqWbyIOL13lJyCWa?=
 =?iso-8859-1?Q?xAfULBbKK1mfwhHj21fr22firj4GOKvL8jvdq9+ek0xIFWBTLZ/GKlOuL8?=
 =?iso-8859-1?Q?LpI7zbebnn5Ls=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75200bee-8455-4507-d223-08ddad01efd2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 18:16:38.8582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPLzF5K4kvG6vzoBmeGZWZ96OqwNiARsqzZDXcuGPRVCfqc0AS6QGN1PHzTnUSd6reen4po/r3SsSPcudoFQyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9691

On Thu, May 22, 2025 at 03:15:08PM -0400, Frank Li wrote:
> On Thu, May 22, 2025 at 03:06:01PM -0400, Nicolas Dufresne wrote:
> > Hi again,
> >
> > Le jeudi 22 mai 2025 à 14:57 -0400, Nicolas Dufresne a écrit :
> > > Hi Frank,
> > >
> > > Le jeudi 22 mai 2025 à 14:49 -0400, Frank Li a écrit :
> > > > On Sat, Apr 12, 2025 at 01:04:14PM -0500, Rob Herring (Arm) wrote:
> > > > >
> > > > > On Fri, 11 Apr 2025 17:36:00 -0400, Frank Li wrote:
> > > > > > Convert fsl-vdoa.txt to yaml format.
> > > > > >
> > > > > > Additional changes:
> > > > > > - Add irq.h and imx6qdl-clock.h in example.
> > > > > >
> > > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > > ---
> > > > > >  .../bindings/media/fsl,imx6q-vdoa.yaml        | 42 +++++++++++++++++++
> > > > > >  .../devicetree/bindings/media/fsl-vdoa.txt    | 21 ----------
> > > > > >  2 files changed, 42 insertions(+), 21 deletions(-)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
> > > > > >  delete mode 100644 Documentation/devicetree/bindings/media/fsl-vdoa.txt
> > > > > >
> > > > >
> > > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > >
> > > > All:
> > > > 	Anyone pick this patch?
> > >
> > > Thanks for the highlight, this is stuff from before my time and I had not associated it
> > > with CODA initially. I've picked it now.
> >
> > Actually, before I do so, any of the following warnings should be addressed ? I effectively don't
> > see a clear entry for that bindings, but could have miss-read and there is a second warning,
> > which based on having Rb is likely false positive ?
>
> The second warning is false alarm. When convert txt to yaml, only need update
> MAINTAINS only when old txt entry already in MAINTAINERS.
>
> >
> > ---
> > [[ATTACHMENT|junit/./0001-dt-bindings-media-convert-fsl-vdoa.txt-to-yaml-forma.patch checkpatch.err.txt]]
> > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > #21:
> > new file mode 100644
> >
> > WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-
> > patches.rst
>
> This one is check patch script issue. I met many similar issues at convert
> txt to yaml.

Nicolas Dufresne:

	Do you have still concern to pick up this patch?

Frank Li

>
> Frank
>
> >
> > total: 0 errors, 2 warnings, 0 checks, 42 lines checked
> > ---
> >
> > Nicolas
> >
> > >
> > > regards,
> > > Nicolas
> > >
> > > >
> > > > Frank
> > > > >

