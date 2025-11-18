Return-Path: <linux-media+bounces-47311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 151EDC6AF1E
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 18:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 893C43A2388
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 17:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38462BF019;
	Tue, 18 Nov 2025 17:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bmT66TYc"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011022.outbound.protection.outlook.com [40.107.130.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EBA26E703;
	Tue, 18 Nov 2025 17:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763486119; cv=fail; b=Cxt+6xYrAe/vEQ9mO6Ln/e0imRDD+Oqsm0u/GGsB5NuiakLTS+vKlsX6iNAmsxdgUALKf7fWYM4gfC9WxAzwHawJqgxyWM0VERglh3DQ3zBgXg2BYGHMmRtx9Tn57lYpl6WZSq8g/fkyw64VEu/ZKrD4uhaSO5nkNS+uranUiD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763486119; c=relaxed/simple;
	bh=Axa0IGxGx9/IhExj77nG7KvkBSVlZ2+UWtc9q++wIG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t5SP7uG5ia/S2lduRLnXKWO7a9PT+5ieqVKtb7OzXGkQ5AvZZPTxGl7OSNXlJBviKsJ2KNOjs0wT92OOIWBJ4hoZlmnGdaatAIgxIzuKFRcVOB2qb6x6ZNr4mHhR6Km3mr/hpvS2tgI6a0MrSgFTLwQ8xEXWDjy49dz75OZeJsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bmT66TYc; arc=fail smtp.client-ip=40.107.130.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggk2nj9GRBP10PN0fzb1aOs/6V7VnkEJQ9yvEwiJ3mtuNGDBk7SOEcZ+blSCO52PmhCjB0cpnDc8aUFhMJrQiEzECua9ZZVGkEg5WE5XReqNjWDcigxYQAoHtZ9S1WUxIiGyvQIAx0HbF5B2qN+CNMtY0bCXxAwtYgacTdOCVJ+0lW6zCzNUnuXsy5nWTEQRUtR9ASRB+S/On7XODGnDyqvaGiRpxyyu1cMmOfUcLIonZ/x25A4VsdO6Hda7TJbNV7QqKcwYZvM69/1nbCdR6QZJFxJhQkN3dhEGNuO85VApVKIhEli2FDiDzHwvZ8xfQxWz8m3QiBiINZdUwlpqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2RXYUj/81NkNwSEDNfEL9S2GtsxTJggPDsne+5Chzw=;
 b=hVzV8YD7+sZDNYR9ESzyQdoNJb7BpOx/V4Vh8LqvWn+MA+kmyXXDzefkFQW5nJ/IR/AFUhdNoyEAdnqrBDs3VARiDa+iRbiwjDmu5fxPJ6RmqPUlWWE2x+5x3s//ii4JnwiMtMLdF9TFdytZB5sZXwGm43ZMKg+ReFrKUHwzTwSs2v60VSlbTyYunKwfQeg+2PsTZYhBedXxiDWJ7pci11gRkVS4KhcpnSY3DlVpluFAznS7LSY6r9XRFH9z3U1m7eU4yWcnBTaCh+yatpsAKCkcIimxeXohIWX9UvnNvJLH9Gk+RilqTWc5pufn2DROMmfhF3DEZAxbPdUpWuutOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2RXYUj/81NkNwSEDNfEL9S2GtsxTJggPDsne+5Chzw=;
 b=bmT66TYcLZE3CBH3YHn7zPx7eWO5WR4DZ9cCxAK+6cR2QItnvuR7wina9rBOjPXRspq5Xf8zLMHu0mW3AKbO5UMlb2Vf5tC0juwTVXDQpj3LQEKTs1rhGfbRVT0eb59mRpE2EQEfx4t7jauivBcBEX1bPXwp+EXCbeoPQA/D6dEz0bWIhDK2a6tLl7C4nLf5iFWhUylWqZI/4gV3DLIPOUAvAqMa0XwXzqBnvMnS532PX71saV7bz6cUTMNNs+QUpg8gQqON63g4LmtnP644qLB8x1n3lPAxyCp5CweK/KsisP6UxVVvCUg1Eu7oMIGq+FUEijiSHDZwAdmtHWWb7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB8PR04MB7180.eurprd04.prod.outlook.com (2603:10a6:10:12c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 17:15:10 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 17:15:10 +0000
Date: Tue, 18 Nov 2025 12:15:01 -0500
From: Frank Li <Frank.li@nxp.com>
To: michael.riesch@collabora.com
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <aRyplYZOrGsSxSlp@lizhi-Precision-Tower-5810>
References: <20251114-rockchip-mipi-receiver-v2-0-eb9b43377fc4@collabora.com>
 <20251114-rockchip-mipi-receiver-v2-2-eb9b43377fc4@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-rockchip-mipi-receiver-v2-2-eb9b43377fc4@collabora.com>
X-ClientProxiedBy: PH0PR07CA0105.namprd07.prod.outlook.com
 (2603:10b6:510:4::20) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB8PR04MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: 16a723d9-db50-4100-4962-08de26c60731
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?skRpVcouZ0HZzEoVF5/6xPeNUnnfALSp7e/F5mArjb4t2OPt4V66VoK8JP1O?=
 =?us-ascii?Q?q27ZsMC/twn666YcwhwnTF5/JmKI5VmINLqR1Smje+t7LzBwqhtX+ZcAptvI?=
 =?us-ascii?Q?8rCb5tvVkGJVYGDqnKPZrhH5ds5YGlA9EwsprAFfMQBwCW0L56AfjwHpQsXE?=
 =?us-ascii?Q?3WCIfhVUFe3qAWKC/M2rQ2k7WNf6LDBt6XmDFp+hCwHElYrOy9zxfrYkLwA5?=
 =?us-ascii?Q?bBHNvqpg8S3dmFNm+MPo0ABjlz5f3VUUrQLzpdS663I4Xp1GhvWb7wBSW4gz?=
 =?us-ascii?Q?5h6iGvJGgJkHRzX2ABcCGe2WB2cV6S3LKJ79XUBVgc6NOGNYZm8IdOp5LMhh?=
 =?us-ascii?Q?B6mUPJSLiGtwOr34GbxzstldejCrnPS2VptVTm7UF9wPNgpuqBDb85Omhaum?=
 =?us-ascii?Q?EBLXOql7jVqil7H7QpXqUKmCoI35/+FVNqJTxIJ7Qwu9EQuEYD+jdaDNwwUn?=
 =?us-ascii?Q?XKYUXZLVhibwiSh6NUuyGQgc7qfKlamLmECNUlbA00NjvN2KH8E1e1Be1Mdh?=
 =?us-ascii?Q?JenjqAyVAltvarx8NjA6kHkX57PCCL6D7rW0Lr8ln8eYJDHsDzfCnU7VfkFX?=
 =?us-ascii?Q?aewtHlKSDJos9mIyLzfV3AYw1PRoz90mhUwQi0b6HCaPPyhpqrg4K5sWJ2Rg?=
 =?us-ascii?Q?FDc/WXxK2goO4AH8G3FG9P19fWZLlaTbGSBE0a97Kp2dygbGpGg45/L9+807?=
 =?us-ascii?Q?8fOlHyQ4wxI9UhO0AS9GmlvGvBlL6q2jBCaoQgSIRzji1Zg6/WxetIuLURMh?=
 =?us-ascii?Q?JEIg4nR7k89EmnWU7HPri/o8/exVd3oo3ocbuILEdIbOU56OW6J50zDJPDO4?=
 =?us-ascii?Q?aCfMOnY2ce1F/k4D8Sb+HGU8i5tHfpCu8pVi7qzkhI9gaTBJIUCJJBg8LSyb?=
 =?us-ascii?Q?wRNLFkd9ttGpWHfBwKgF0Z2Fm3HtxNFlIEQZ127LRpxh/+uvaWPak9of11ut?=
 =?us-ascii?Q?LaNk3TzSjynRwTvqzGMPpoqQis2NP7/slL0mOJWrUMC1Eup6c3WlHRj0ac6K?=
 =?us-ascii?Q?X06T1C9J9QJ3QUV7mAWP3ylk0i098vUy/Kjqqp/adPdxdm+ar5RgAWa7nZkh?=
 =?us-ascii?Q?vpmmSsGTr1nxNEzzgTh2mSdygKGxgGzpflhqt+EdL/C/SmOSWuqS0MvqMbSq?=
 =?us-ascii?Q?GuxJhtrbwK/0PP9zzFatC9e+yI2bAkxPvb2EhVxVoajWKR/GC6bCEXI7gQYu?=
 =?us-ascii?Q?ycXK7Wj+qgFDPf+czah6Sq4v5eqLBCj37FW8egVcd2DReg+vpt5A22Bl1nFQ?=
 =?us-ascii?Q?dbB1RDrck0G6D77wVLZvZwCiFyOY7PK2KmMOLRutMOK8k8Fv2KTZrDh0sBno?=
 =?us-ascii?Q?1XzqfOjQmwPMQhtEFUbHNCOwsXNbW793Slz7UtbikUm7ig/odluPHxSOOzjz?=
 =?us-ascii?Q?gFMflxOOIhcKl7YMuk9jlFFt78kEkbtWR1StKNGKpkCyc7gtWd0/y4CRQgQe?=
 =?us-ascii?Q?zUtJUPojMjk2Pcd2mESs/zTlgm3VQ5LKjyhHbwTY5Mkz+4oEJAhJXZ3EvrDt?=
 =?us-ascii?Q?kJDofedf+QcJyHpNColgwENjKLH2lU2plf5tbjZIqnNwF4quZYfRu7Y98w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?FnQx/q7P6jcLHI4eL/KjIys24oqK248Oo+1J5ra7autPDjjaqdqOCZXeV5HT?=
 =?us-ascii?Q?7dIBXIYVwTNbkxLsro8gj+9X5vE6XDRuKU1ozVVWx2hqizQuOpf/If8FKNHH?=
 =?us-ascii?Q?/fwCJ5Ek86ZtwWFN/9K8l42GoVS7b/B+6pSKM4v+HWvV3GNMlGLG8M7tDh65?=
 =?us-ascii?Q?gTH2coiZaHuS8ZGF8DSWsWSrYWX7fLVQnwoZmHkQtbFXWH/aHXuwWwlCcExo?=
 =?us-ascii?Q?HyCkDh2cE+YQDyuLD+zYpElnd+WYVCinXVRhz/vzulHbZdOmDErCTlx++G5s?=
 =?us-ascii?Q?TDFtLk9S9gfSf/y8swQxxfjXlS+1WHIJFsYucld0LKwR/BQCt2iFVy0Avw7I?=
 =?us-ascii?Q?6UCNczwuQsBTe1i9G/ys12IFtQkENESgEsK6HATHxTEDHU6kJpfBjyjVubMr?=
 =?us-ascii?Q?mbbGFzHQ5FpytKILi5LhyUgoEkIXTMUTZ0mIN73MdmLqQ7INz2fzTIx7WYF8?=
 =?us-ascii?Q?DZUTZEszqOWU2erffugTW4wDEe8YMOg0Z/ftDcUwDZTCXdlcDSQGghC4JmGO?=
 =?us-ascii?Q?henjunMlSIalFtQhCrqaBbE3XCRsutaJ8ugNEXkIgHuw+LPaiENQQBsJoM5p?=
 =?us-ascii?Q?EOS7ov5yiyh4iPNdUQ+KfDt2f8z4Ld/XPXA41MNIca0NSwo04oHU+K7p2F7s?=
 =?us-ascii?Q?Khs6DlF3SJwNrdXpKdLIh+TZ0sbaM9nzdLbf8aVxqsrUf6Ku6LWVZVuQERY/?=
 =?us-ascii?Q?cztRzm7YprkVpSL40DJRUVnBH+uev3001CwPt6nHeyw15mUzW5Rz3rWv1BVJ?=
 =?us-ascii?Q?SwCv4WcWVnLZnGs/ZKhoQUgOSKzXfAn3sjN9Ygo3LGRA311L4gojpiTwz6/0?=
 =?us-ascii?Q?k6qNJVx6CIbX1BCM2qX0eyXx2UJhroOSGvo08NyJeOhJT/9chcrVnArsSDjO?=
 =?us-ascii?Q?JbbU8apRd8wDgxeURqqrw7f1DeQno6m4dt4d52WrhX+P1XXvUzbkRXkJXGtK?=
 =?us-ascii?Q?pt6L2CKbEfagj1obEBB5K8eom6pDlhvVq/zHJwVFZ7HXgRwNubVzrCob2o1h?=
 =?us-ascii?Q?lNvWmoD+B4viVgX/OYOohEUL9oaWRxD9+PjGk80cE5aA2rubPLKXk91yPZwb?=
 =?us-ascii?Q?Rv9UkzHPn7EVSdwlcKdAKjztEE2v1GFbb1GKJsXxTbbv7lLAF04mbrA9/JTr?=
 =?us-ascii?Q?DzaoMEDX5ygCbt8ky37FcDPBuZwK/6DRkzK1xWaQ27XfMZXNg9cF2wtRZmLX?=
 =?us-ascii?Q?0QSkWPlP+qp7UxYo1xlLs/T1ZK8Z+qLmhfLfsg5G8XLx9y3kVXJrlDjBDQ6Z?=
 =?us-ascii?Q?4VJCFoCJEIlsGp9PW0zBuKM55ja4hFgftebx+nZO6sOS+3VSbSj+wfW5ut4H?=
 =?us-ascii?Q?wKzFVAuMAgw2ULlQPZ9SHK0bEjmdzQxtyR0T8lS2+tp+GB6BVkg2QwtrYY8l?=
 =?us-ascii?Q?lzJOobvZ6MouApZokDCqCMj+0tIJFlOind3UN13vplltJo8L+xyfjfVcABnu?=
 =?us-ascii?Q?MNpzFla/mTjCFAU0mtvg0Ga4m0AdKxQGqkaOKGd0IlHqlda41O4+lT6zq2wh?=
 =?us-ascii?Q?kJYnwR/LXdPLRNvEz3FZlIVM0vS8+i0+GcQ7LI7EYI7QT2fPHCLptxOeEYFD?=
 =?us-ascii?Q?6ePykfYpwb/pjZ5CTZ2MdNO+DS6FkEn8m3BWHlEg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16a723d9-db50-4100-4962-08de26c60731
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:15:10.3409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gow3Ran90rCQMnMa49c2gbcCxyVS8UWXhRNlTTUQjqdHlF2Q8DZDNfPuWy68GhsT3LeWxeW/1x2QXQxJ8Z8PuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7180

On Tue, Nov 18, 2025 at 12:12:26PM +0100, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
>
> The Rockchip MIPI CSI-2 Receiver is a CSI-2 bridge with one input
> port and one output port. It receives the data with the help of an
> external MIPI PHY (C-PHY or D-PHY) and passes it to the Rockchip
> Video Capture (VICAP) block.
>
> Add a V4L2 subdevice driver for this unit.
>
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  MAINTAINERS                                    |   1 +
>  drivers/media/platform/rockchip/Kconfig        |   1 +
>  drivers/media/platform/rockchip/Makefile       |   1 +
>  drivers/media/platform/rockchip/rkcsi/Kconfig  |  16 +
>  drivers/media/platform/rockchip/rkcsi/Makefile |   3 +
>  drivers/media/platform/rockchip/rkcsi/rkcsi.c  | 742 +++++++++++++++++++++++++
>  6 files changed, 764 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 145473671a4a..b389f2e631ce 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22304,6 +22304,7 @@ M:	Michael Riesch <michael.riesch@collabora.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
> +F:	drivers/media/platform/rockchip/rkcsi/
>
>  ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
>  M:	Daniel Golle <daniel@makrotopia.org>
> diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/platform/rockchip/Kconfig
> index ba401d32f01b..54b698c4cd2c 100644
> --- a/drivers/media/platform/rockchip/Kconfig
> +++ b/drivers/media/platform/rockchip/Kconfig
> @@ -4,5 +4,6 @@ comment "Rockchip media platform drivers"
>
>  source "drivers/media/platform/rockchip/rga/Kconfig"
>  source "drivers/media/platform/rockchip/rkcif/Kconfig"
> +source "drivers/media/platform/rockchip/rkcsi/Kconfig"
>  source "drivers/media/platform/rockchip/rkisp1/Kconfig"
>  source "drivers/media/platform/rockchip/rkvdec/Kconfig"
> diff --git a/drivers/media/platform/rockchip/Makefile b/drivers/media/platform/rockchip/Makefile
> index 0e0b2cbbd4bd..522a7d3e30b0 100644
> --- a/drivers/media/platform/rockchip/Makefile
> +++ b/drivers/media/platform/rockchip/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-y += rga/
>  obj-y += rkcif/
> +obj-y += rkcsi/
>  obj-y += rkisp1/
>  obj-y += rkvdec/
> diff --git a/drivers/media/platform/rockchip/rkcsi/Kconfig b/drivers/media/platform/rockchip/rkcsi/Kconfig
> new file mode 100644
> index 000000000000..d8004198c386
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcsi/Kconfig
> @@ -0,0 +1,16 @@
> +config VIDEO_ROCKCHIP_CSI
> +	tristate "Rockchip MIPI CSI-2 Receiver"
> +	depends on VIDEO_DEV
> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	depends on V4L_PLATFORM_DRIVERS
> +	depends on PM && COMMON_CLK
> +	select MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  This is a driver for Rockchip MIPI CSI-2 Receiver. It is featured
> +	  in various Rockchips SoCs, usually in combination with a Video
> +	  Capture (VICAP) unit (see Rockchip Camera Interface (CIF) driver).
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called rockchip-mipi-csi.
> diff --git a/drivers/media/platform/rockchip/rkcsi/Makefile b/drivers/media/platform/rockchip/rkcsi/Makefile
> new file mode 100644
> index 000000000000..147712cbb68a
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcsi/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_VIDEO_ROCKCHIP_CSI) += rockchip-mipi-csi.o
> +rockchip-mipi-csi-objs += rkcsi.o
> diff --git a/drivers/media/platform/rockchip/rkcsi/rkcsi.c b/drivers/media/platform/rockchip/rkcsi/rkcsi.c
> new file mode 100644
> index 000000000000..d4108ce5bbf9
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcsi/rkcsi.c
> @@ -0,0 +1,742 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip MIPI CSI-2 Receiver Driver
> + *
> + * Copyright (C) 2019 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + * Copyright (C) 2025 Collabora, Ltd.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_platform.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +#include <media/mipi-csi2.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define CSI2HOST_N_LANES     0x04
> +#define CSI2HOST_CSI2_RESETN 0x10
> +#define CSI2HOST_PHY_STATE   0x14
> +#define CSI2HOST_ERR1	     0x20
> +#define CSI2HOST_ERR2	     0x24
> +#define CSI2HOST_MSK1	     0x28
> +#define CSI2HOST_MSK2	     0x2c
> +#define CSI2HOST_CONTROL     0x40

Look like that is designware CSI2 controller, can we build common library
for all dwc csi2 controller, instead of every vendor create individual one.

First try at
https://lore.kernel.org/linux-media/20250821-95_cam-v3-21-c9286fbb34b9@nxp.com/

Toshiba have similar patch
https://lore.kernel.org/linux-media/aPZd39riAxqfw3mT@lizhi-Precision-Tower-5810/

Frank

> +
> +#define SW_CPHY_EN(x)	     ((x) << 0)
> +#define SW_DSI_EN(x)	     ((x) << 4)
> +#define SW_DATATYPE_FS(x)    ((x) << 8)
> +#define SW_DATATYPE_FE(x)    ((x) << 14)
> +#define SW_DATATYPE_LS(x)    ((x) << 20)
> +#define SW_DATATYPE_LE(x)    ((x) << 26)
> +
> +#define RKCSI_CLKS_MAX	     1
> +
> +enum {
> +	RKCSI_PAD_SINK,
> +	RKCSI_PAD_SRC,
> +	RKCSI_PAD_MAX,
> +};
> +
> +struct rkcsi_format {
> +	u32 code;
> +	u8 depth;
> +	u8 csi_dt;
> +};
> +
> +struct rkcsi_device {
> +	struct device *dev;
> +
> +	void __iomem *base_addr;
> +	struct clk_bulk_data *clks;
> +	unsigned int clks_num;
> +	struct phy *phy;
> +	struct reset_control *reset;
> +
> +	const struct rkcsi_format *formats;
> +	unsigned int formats_num;
> +
> +	struct media_pad pads[RKCSI_PAD_MAX];
> +	struct v4l2_async_notifier notifier;
> +	struct v4l2_fwnode_endpoint vep;
> +	struct v4l2_subdev sd;
> +
> +	struct v4l2_subdev *source_sd;
> +	u32 source_pad;
> +};
> +
> +static const struct v4l2_mbus_framefmt default_format = {
> +	.width = 3840,
> +	.height = 2160,
> +	.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +	.field = V4L2_FIELD_NONE,
> +	.colorspace = V4L2_COLORSPACE_RAW,
> +	.ycbcr_enc = V4L2_YCBCR_ENC_601,
> +	.quantization = V4L2_QUANTIZATION_FULL_RANGE,
> +	.xfer_func = V4L2_XFER_FUNC_NONE,
> +};
> +
> +static const struct rkcsi_format formats[] = {
> +	/* YUV formats */
> +	{
> +		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.depth = 16,
> +		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.depth = 16,
> +		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_YVYU8_1X16,
> +		.depth = 16,
> +		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_VYUY8_1X16,
> +		.depth = 16,
> +		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
> +	},
> +	/* RGB formats */
> +	{
> +		.code = MEDIA_BUS_FMT_RGB888_1X24,
> +		.depth = 24,
> +		.csi_dt = MIPI_CSI2_DT_RGB888,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_BGR888_1X24,
> +		.depth = 24,
> +		.csi_dt = MIPI_CSI2_DT_RGB888,
> +	},
> +	/* Bayer formats */
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.depth = 8,
> +		.csi_dt = MIPI_CSI2_DT_RAW8,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.depth = 8,
> +		.csi_dt = MIPI_CSI2_DT_RAW8,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.depth = 8,
> +		.csi_dt = MIPI_CSI2_DT_RAW8,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.depth = 8,
> +		.csi_dt = MIPI_CSI2_DT_RAW8,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.depth = 10,
> +		.csi_dt = MIPI_CSI2_DT_RAW10,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.depth = 10,
> +		.csi_dt = MIPI_CSI2_DT_RAW10,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.depth = 10,
> +		.csi_dt = MIPI_CSI2_DT_RAW10,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.depth = 10,
> +		.csi_dt = MIPI_CSI2_DT_RAW10,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.depth = 12,
> +		.csi_dt = MIPI_CSI2_DT_RAW12,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.depth = 12,
> +		.csi_dt = MIPI_CSI2_DT_RAW12,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.depth = 12,
> +		.csi_dt = MIPI_CSI2_DT_RAW12,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.depth = 12,
> +		.csi_dt = MIPI_CSI2_DT_RAW12,
> +	},
> +};
> +
> +static inline struct rkcsi_device *to_rkcsi(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct rkcsi_device, sd);
> +}
> +
> +static inline __maybe_unused void rkcsi_write(struct rkcsi_device *csi_dev,
> +					      unsigned int addr, u32 val)
> +{
> +	writel(val, csi_dev->base_addr + addr);
> +}
> +
> +static inline __maybe_unused u32 rkcsi_read(struct rkcsi_device *csi_dev,
> +					    unsigned int addr)
> +{
> +	return readl(csi_dev->base_addr + addr);
> +}
> +
> +static const struct rkcsi_format *
> +rkcsi_find_format(struct rkcsi_device *csi_dev, u32 mbus_code)
> +{
> +	const struct rkcsi_format *format;
> +
> +	WARN_ON(csi_dev->formats_num == 0);
> +
> +	for (int i = 0; i < csi_dev->formats_num; i++) {
> +		format = &csi_dev->formats[i];
> +		if (format->code == mbus_code)
> +			return format;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int rkcsi_start(struct rkcsi_device *csi_dev)
> +{
> +	struct media_pad *source_pad =
> +		&csi_dev->source_sd->entity.pads[csi_dev->source_pad];
> +	enum v4l2_mbus_type bus_type = csi_dev->vep.bus_type;
> +	union phy_configure_opts opts;
> +	s64 link_freq;
> +	u32 lanes = csi_dev->vep.bus.mipi_csi2.num_data_lanes;
> +	u32 control = 0;
> +	int ret;
> +
> +	if (lanes < 1 || lanes > 4)
> +		return -EINVAL;
> +
> +	/* set mult and div to 0, thus completely rely on V4L2_CID_LINK_FREQ */
> +	link_freq = v4l2_get_link_freq(source_pad, 0, 0);
> +	if (link_freq <= 0)
> +		return -EINVAL;
> +
> +	if (bus_type == V4L2_MBUS_CSI2_DPHY) {
> +		struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> +
> +		ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq * 2,
> +								 lanes, cfg);
> +		if (ret)
> +			return ret;
> +
> +		ret = phy_set_mode(csi_dev->phy, PHY_MODE_MIPI_DPHY);
> +		if (ret)
> +			return ret;
> +
> +		ret = phy_configure(csi_dev->phy, &opts);
> +		if (ret)
> +			return ret;
> +
> +		control |= SW_CPHY_EN(0);
> +
> +	} else if (bus_type == V4L2_MBUS_CSI2_CPHY) {
> +		/* TODO: implement CPHY configuration */
> +		return -EOPNOTSUPP;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	control |= SW_DATATYPE_FS(0x00) | SW_DATATYPE_FE(0x01) |
> +		   SW_DATATYPE_LS(0x02) | SW_DATATYPE_LE(0x03);
> +
> +	rkcsi_write(csi_dev, CSI2HOST_N_LANES, lanes - 1);
> +	rkcsi_write(csi_dev, CSI2HOST_CONTROL, control);
> +	rkcsi_write(csi_dev, CSI2HOST_CSI2_RESETN, 1);
> +
> +	ret = phy_power_on(csi_dev->phy);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void rkcsi_stop(struct rkcsi_device *csi_dev)
> +{
> +	phy_power_off(csi_dev->phy);
> +
> +	rkcsi_write(csi_dev, CSI2HOST_CSI2_RESETN, 0);
> +	rkcsi_write(csi_dev, CSI2HOST_MSK1, ~0);
> +	rkcsi_write(csi_dev, CSI2HOST_MSK2, ~0);
> +}
> +
> +static const struct media_entity_operations rkcsi_media_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +static int rkcsi_enum_mbus_code(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *sd_state,
> +				struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct rkcsi_device *csi_dev = to_rkcsi(sd);
> +
> +	if (code->pad == RKCSI_PAD_SRC) {
> +		const struct v4l2_mbus_framefmt *sink_fmt;
> +
> +		if (code->index)
> +			return -EINVAL;
> +
> +		sink_fmt = v4l2_subdev_state_get_format(sd_state,
> +							RKCSI_PAD_SINK);
> +		code->code = sink_fmt->code;
> +
> +		return 0;
> +	} else if (code->pad == RKCSI_PAD_SINK) {
> +		if (code->index > csi_dev->formats_num)
> +			return -EINVAL;
> +
> +		code->code = csi_dev->formats[code->index].code;
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int rkcsi_set_fmt(struct v4l2_subdev *sd,
> +			 struct v4l2_subdev_state *state,
> +			 struct v4l2_subdev_format *format)
> +{
> +	struct rkcsi_device *csi_dev = to_rkcsi(sd);
> +	const struct rkcsi_format *fmt;
> +	struct v4l2_mbus_framefmt *sink, *src;
> +
> +	/* the format on the source pad always matches the sink pad */
> +	if (format->pad == RKCSI_PAD_SRC)
> +		return v4l2_subdev_get_fmt(sd, state, format);
> +
> +	sink = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> +	if (!sink)
> +		return -EINVAL;
> +
> +	fmt = rkcsi_find_format(csi_dev, format->format.code);
> +	if (!fmt)
> +		format->format = default_format;
> +
> +	*sink = format->format;
> +
> +	/* propagate the format to the source pad */
> +	src = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> +							   format->stream);
> +	if (!src)
> +		return -EINVAL;
> +
> +	*src = *sink;
> +
> +	return 0;
> +}
> +
> +static int rkcsi_set_routing(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *state,
> +			     enum v4l2_subdev_format_whence which,
> +			     struct v4l2_subdev_krouting *routing)
> +{
> +	int ret;
> +
> +	ret = v4l2_subdev_routing_validate(sd, routing,
> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
> +					       &default_format);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int rkcsi_enable_streams(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *state, u32 pad,
> +				u64 streams_mask)
> +{
> +	struct rkcsi_device *csi_dev = to_rkcsi(sd);
> +	struct v4l2_subdev *remote_sd;
> +	struct media_pad *sink_pad, *remote_pad;
> +	struct device *dev = csi_dev->dev;
> +	u64 mask;
> +	int ret;
> +
> +	sink_pad = &sd->entity.pads[RKCSI_PAD_SINK];
> +	remote_pad = media_pad_remote_pad_first(sink_pad);
> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> +
> +	mask = v4l2_subdev_state_xlate_streams(state, RKCSI_PAD_SINK,
> +					       RKCSI_PAD_SRC, &streams_mask);
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		goto err;
> +
> +	ret = rkcsi_start(csi_dev);
> +	if (ret) {
> +		dev_err(dev, "failed to enable CSI hardware\n");
> +		goto err_pm_runtime_put;
> +	}
> +
> +	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index, mask);
> +	if (ret)
> +		goto err_csi_stop;
> +
> +	return 0;
> +
> +err_csi_stop:
> +	rkcsi_stop(csi_dev);
> +err_pm_runtime_put:
> +	pm_runtime_put_sync(dev);
> +err:
> +	return ret;
> +}
> +
> +static int rkcsi_disable_streams(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 streams_mask)
> +{
> +	struct rkcsi_device *csi_dev = to_rkcsi(sd);
> +	struct v4l2_subdev *remote_sd;
> +	struct media_pad *sink_pad, *remote_pad;
> +	struct device *dev = csi_dev->dev;
> +	u64 mask;
> +	int ret;
> +
> +	sink_pad = &sd->entity.pads[RKCSI_PAD_SINK];
> +	remote_pad = media_pad_remote_pad_first(sink_pad);
> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> +
> +	mask = v4l2_subdev_state_xlate_streams(state, RKCSI_PAD_SINK,
> +					       RKCSI_PAD_SRC, &streams_mask);
> +
> +	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
> +
> +	rkcsi_stop(csi_dev);
> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_subdev_pad_ops rkcsi_pad_ops = {
> +	.enum_mbus_code = rkcsi_enum_mbus_code,
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = rkcsi_set_fmt,
> +	.set_routing = rkcsi_set_routing,
> +	.enable_streams = rkcsi_enable_streams,
> +	.disable_streams = rkcsi_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops rkcsi_ops = {
> +	.pad = &rkcsi_pad_ops,
> +};
> +
> +static int rkcsi_init_state(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = RKCSI_PAD_SINK,
> +			.sink_stream = 0,
> +			.source_pad = RKCSI_PAD_SRC,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +	struct v4l2_subdev_krouting routing = {
> +		.len_routes = ARRAY_SIZE(routes),
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
> +	int ret;
> +
> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
> +					       &default_format);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_subdev_internal_ops rkcsi_internal_ops = {
> +	.init_state = rkcsi_init_state,
> +};
> +
> +static int rkcsi_notifier_bound(struct v4l2_async_notifier *notifier,
> +				struct v4l2_subdev *sd,
> +				struct v4l2_async_connection *asd)
> +{
> +	struct rkcsi_device *csi_dev =
> +		container_of(notifier, struct rkcsi_device, notifier);
> +	int source_pad;
> +
> +	source_pad = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
> +						 MEDIA_PAD_FL_SOURCE);
> +	if (source_pad < 0) {
> +		dev_err(csi_dev->dev, "failed to find source pad for %s\n",
> +			sd->name);
> +		return source_pad;
> +	}
> +
> +	csi_dev->source_sd = sd;
> +	csi_dev->source_pad = source_pad;
> +
> +	return media_create_pad_link(&sd->entity, source_pad,
> +				     &csi_dev->sd.entity, RKCSI_PAD_SINK,
> +				     MEDIA_LNK_FL_ENABLED);
> +}
> +
> +static const struct v4l2_async_notifier_operations rkcsi_notifier_ops = {
> +	.bound = rkcsi_notifier_bound,
> +};
> +
> +static int rkcsi_register_notifier(struct rkcsi_device *csi_dev)
> +{
> +	struct v4l2_async_connection *asd;
> +	struct v4l2_async_notifier *ntf = &csi_dev->notifier;
> +	struct v4l2_fwnode_endpoint *vep = &csi_dev->vep;
> +	struct v4l2_subdev *sd = &csi_dev->sd;
> +	struct device *dev = csi_dev->dev;
> +	struct fwnode_handle *ep;
> +	int ret = 0;
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> +	if (!ep)
> +		return dev_err_probe(dev, -ENODEV, "failed to get endpoint\n");
> +
> +	vep->bus_type = V4L2_MBUS_UNKNOWN;
> +	ret = v4l2_fwnode_endpoint_parse(ep, vep);
> +	if (ret) {
> +		ret = dev_err_probe(dev, ret, "failed to parse endpoint\n");
> +		goto out;
> +	}
> +
> +	if (vep->bus_type != V4L2_MBUS_CSI2_DPHY &&
> +	    vep->bus_type != V4L2_MBUS_CSI2_CPHY) {
> +		ret = dev_err_probe(dev, -EINVAL,
> +				    "invalid bus type of endpoint\n");
> +		goto out;
> +	}
> +
> +	v4l2_async_subdev_nf_init(ntf, sd);
> +	ntf->ops = &rkcsi_notifier_ops;
> +
> +	asd = v4l2_async_nf_add_fwnode_remote(ntf, ep,
> +					      struct v4l2_async_connection);
> +	if (IS_ERR(asd)) {
> +		ret = PTR_ERR(asd);
> +		goto err_nf_cleanup;
> +	}
> +
> +	ret = v4l2_async_nf_register(ntf);
> +	if (ret) {
> +		ret = dev_err_probe(dev, ret, "failed to register notifier\n");
> +		goto err_nf_cleanup;
> +	}
> +
> +	goto out;
> +
> +err_nf_cleanup:
> +	v4l2_async_nf_cleanup(ntf);
> +out:
> +	fwnode_handle_put(ep);
> +	return ret;
> +}
> +
> +static int rkcsi_register(struct rkcsi_device *csi_dev)
> +{
> +	struct media_pad *pads = csi_dev->pads;
> +	struct v4l2_subdev *sd = &csi_dev->sd;
> +	int ret;
> +
> +	ret = rkcsi_register_notifier(csi_dev);
> +	if (ret)
> +		goto err;
> +
> +	v4l2_subdev_init(sd, &rkcsi_ops);
> +	sd->dev = csi_dev->dev;
> +	sd->entity.ops = &rkcsi_media_ops;
> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
> +	sd->internal_ops = &rkcsi_internal_ops;
> +	sd->owner = THIS_MODULE;
> +	snprintf(sd->name, sizeof(sd->name), "rockchip-mipi-csi %s",
> +		 dev_name(csi_dev->dev));
> +
> +	pads[RKCSI_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
> +				     MEDIA_PAD_FL_MUST_CONNECT;
> +	pads[RKCSI_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&sd->entity, RKCSI_PAD_MAX, pads);
> +	if (ret)
> +		goto err_notifier_unregister;
> +
> +	ret = v4l2_subdev_init_finalize(sd);
> +	if (ret)
> +		goto err_entity_cleanup;
> +
> +	ret = v4l2_async_register_subdev(sd);
> +	if (ret) {
> +		dev_err(sd->dev, "failed to register CSI subdev\n");
> +		goto err_subdev_cleanup;
> +	}
> +
> +	return 0;
> +
> +err_subdev_cleanup:
> +	v4l2_subdev_cleanup(sd);
> +err_entity_cleanup:
> +	media_entity_cleanup(&sd->entity);
> +err_notifier_unregister:
> +	v4l2_async_nf_unregister(&csi_dev->notifier);
> +	v4l2_async_nf_cleanup(&csi_dev->notifier);
> +err:
> +	return ret;
> +}
> +
> +static void rkcsi_unregister(struct rkcsi_device *csi_dev)
> +{
> +	struct v4l2_subdev *sd = &csi_dev->sd;
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_async_nf_unregister(&csi_dev->notifier);
> +	v4l2_async_nf_cleanup(&csi_dev->notifier);
> +}
> +
> +static const struct of_device_id rkcsi_of_match[] = {
> +	{
> +		.compatible = "rockchip,rk3568-mipi-csi",
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, rkcsi_of_match);
> +
> +static int rkcsi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rkcsi_device *csi_dev;
> +	int ret;
> +
> +	csi_dev = devm_kzalloc(dev, sizeof(*csi_dev), GFP_KERNEL);
> +	if (!csi_dev)
> +		return -ENOMEM;
> +	csi_dev->dev = dev;
> +	dev_set_drvdata(dev, csi_dev);
> +
> +	csi_dev->base_addr = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(csi_dev->base_addr))
> +		return PTR_ERR(csi_dev->base_addr);
> +
> +	ret = devm_clk_bulk_get_all(dev, &csi_dev->clks);
> +	if (ret != RKCSI_CLKS_MAX)
> +		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
> +	csi_dev->clks_num = ret;
> +
> +	csi_dev->phy = devm_phy_get(dev, NULL);
> +	if (IS_ERR(csi_dev->phy))
> +		return dev_err_probe(dev, PTR_ERR(csi_dev->phy),
> +				     "failed to get MIPI CSI PHY\n");
> +
> +	csi_dev->reset = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(csi_dev->reset))
> +		return dev_err_probe(dev, PTR_ERR(csi_dev->reset),
> +				     "failed to get reset\n");
> +
> +	csi_dev->formats = formats;
> +	csi_dev->formats_num = ARRAY_SIZE(formats);
> +
> +	pm_runtime_enable(dev);
> +
> +	ret = phy_init(csi_dev->phy);
> +	if (ret) {
> +		ret = dev_err_probe(dev, ret,
> +				    "failed to initialize MIPI CSI PHY\n");
> +		goto err_pm_runtime_disable;
> +	}
> +
> +	ret = rkcsi_register(csi_dev);
> +	if (ret)
> +		goto err_phy_exit;
> +
> +	return 0;
> +
> +err_phy_exit:
> +	phy_exit(csi_dev->phy);
> +err_pm_runtime_disable:
> +	pm_runtime_disable(dev);
> +	return ret;
> +}
> +
> +static void rkcsi_remove(struct platform_device *pdev)
> +{
> +	struct rkcsi_device *csi_dev = platform_get_drvdata(pdev);
> +	struct device *dev = &pdev->dev;
> +
> +	rkcsi_unregister(csi_dev);
> +	phy_exit(csi_dev->phy);
> +	pm_runtime_disable(dev);
> +}
> +
> +static int rkcsi_runtime_suspend(struct device *dev)
> +{
> +	struct rkcsi_device *csi_dev = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(csi_dev->clks_num, csi_dev->clks);
> +
> +	return 0;
> +}
> +
> +static int rkcsi_runtime_resume(struct device *dev)
> +{
> +	struct rkcsi_device *csi_dev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	reset_control_assert(csi_dev->reset);
> +	udelay(5);
> +	reset_control_deassert(csi_dev->reset);
> +
> +	ret = clk_bulk_prepare_enable(csi_dev->clks_num, csi_dev->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops rkcsi_pm_ops = {
> +	.runtime_suspend = rkcsi_runtime_suspend,
> +	.runtime_resume = rkcsi_runtime_resume,
> +};
> +
> +static struct platform_driver rkcsi_drv = {
> +	.driver = {
> +		   .name = "rockchip-mipi-csi",
> +		   .of_match_table = rkcsi_of_match,
> +		   .pm = &rkcsi_pm_ops,
> +	},
> +	.probe = rkcsi_probe,
> +	.remove = rkcsi_remove,
> +};
> +module_platform_driver(rkcsi_drv);
> +
> +MODULE_DESCRIPTION("Rockchip MIPI CSI-2 Receiver platform driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.39.5
>
>

