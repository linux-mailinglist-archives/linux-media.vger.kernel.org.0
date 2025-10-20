Return-Path: <linux-media+bounces-45088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BB457BF3727
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 22:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EDEB14FDB73
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 20:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9982E6CC5;
	Mon, 20 Oct 2025 20:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OtDwbtIr"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D472D94B7
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 20:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991919; cv=fail; b=lGNoJ+u6ggCYrIQnP53EoVElj73qOhdT1a7J5Pyd7ay/hkbMIu4bhWbl1dUnPWcuDWlz+IQwJ+Y/IHGNtBRJHiervuFviAyteO7WIUyZa7IBOjGNA9Q5FlrRr05POCEj1riC/TskDOTvF8suCK7CAK7/8nH9ULQ2dl+qx7kj3JU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991919; c=relaxed/simple;
	bh=9YccdtJcs+3r2rlTv3yPLx90gjjgZgvulo885zB+gc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kFMIm98JKWHXCqRKAWPBJnQ6uwx5Q0dtv5lm4NEbXmt5OOPWWKCGOQDsYJEJF68m+dPM80QE+IP+8OxJ2vNetAqSS4yvBxWuy27pxwYv1kQlbcWcJNssWNxgrmNA332J1jzcYscjOHuWaM7g9hdfhsezPIZVV7M8NV1y4/m5nMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OtDwbtIr; arc=fail smtp.client-ip=40.107.159.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8FHGWDSq0F4DDsB9RnqxaFO4vXqEfcMZmfWY4ZWa2uj3ZD8sq0TYC5JDVndUHvp71zR7K5O/ug+pbZc3XVB4m16+Oi+J355Xp4hI4+4kf78wwS7sJAUfiFuQKlrPUnfHdpHnx5LUKviogWVGXU3uEZ0sUwQKzhj3+7P7PR9ufkDiimk5KlIiWs/XH0TuoTp/6d35yq4q1/ldNLtTirqyaAend6Re1ZzeQCCPWWb8EHs6vH3rvGh6rOnKruD2RGaOwKUBaXp+rOLIFuHfzLLLx1dMWZNI6WQlkxGxckXU1CJ99EkxIh8BHh5upMJRj03y3tI2AnPXD9A4kMWjjBzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kioRySP6iDo71nVP5xGqZu915tDpHH5PuHGZxHL3l6c=;
 b=L9y45VOh0Xs/WLGjvHa6P114OHmiVy2MV5NDOzcxAWYVHzIJBvYwTfvnnW0ClmqAPM0tOcGpLzDUASook8RRpeX4CuNZi6OW0LJ81Bqqth8Q8cBOO8fgRp+mJ6sZBAIGopiW4ucQ7tMU/dcWw5luU8zdQIm+dra6lxAKI2J7lYiJydd7mrC/MoGpQ72uSPsUkzbn5tpnRq8pQ6HWfM8jphjSc3byguc5V+6YH76EjAJLiBaeknySi8YD8R2WiGj9DSPk06/EuyKW+uMdIuzxsok/iJd17dXFxYGXaNmkLZu4yBqR/Dpdn+LimGoE6VPtHuiE0ozLebGPKMx4Rkg91A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kioRySP6iDo71nVP5xGqZu915tDpHH5PuHGZxHL3l6c=;
 b=OtDwbtIr3QQcXyS/z2J8iZXhhpYu5wcd6FYUePq/bwiZtbs6uHVFaFbl6RpzKnWLckfxFq32qDDPzqnBv3aLGRlp7Vl6/JAg+C8jJXHhLWf8jzdj9CRzhJrgsm2+xM7g7gjjJDxMkJeKA2gaxKDt9AKkrgJgevaVPgItm/K8gVjfXcp7LghaWbGg4G0mI85RUMnGC0jmHYdkm+m007c8OMdEpDx2yLrFGCJFqCrsjhWjIAqpwYDfCI3wY/UWqDCwoT+Xm0K8PA81QkGGeat8vgzaIOHhEtBx+X5UHus12xPn0SJY7k0Vy7C23RgN4lCWR5mbD+nSyRVmLWNt6tXzVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VE1PR04MB7391.eurprd04.prod.outlook.com (2603:10a6:800:1b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Mon, 20 Oct
 2025 20:25:14 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 20:25:14 +0000
Date: Mon, 20 Oct 2025 16:25:08 -0400
From: Frank Li <Frank.li@nxp.com>
To: Johan Hovold <johan@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 3/3] media: imx8mq-mipi-csi2: drop unused module alias
Message-ID: <aPaak5amxOkgnN2o@lizhi-Precision-Tower-5810>
References: <20251017060051.8204-1-johan@kernel.org>
 <20251017060051.8204-3-johan@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017060051.8204-3-johan@kernel.org>
X-ClientProxiedBy: PH0PR07CA0070.namprd07.prod.outlook.com
 (2603:10b6:510:f::15) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VE1PR04MB7391:EE_
X-MS-Office365-Filtering-Correlation-Id: 57f1bd5b-3493-4bc7-a4a2-08de1016c683
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|376014|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?X8GX2tV2kPHO3wGv/2iraq28pbMoIAXzsCn7jnieHqoUQhyaqbw1zUrGmYgF?=
 =?us-ascii?Q?/U8Tmnx/QNU9u9TZWQGGN9dKlSZLIROftxwiaSIKNEGNGj9t3QD4V6Kp7de3?=
 =?us-ascii?Q?gfmsxkP+rEFD0INRSEBDKcCo4h065roCXvaahUAPx6YnvbCy6R1lW52k0E9/?=
 =?us-ascii?Q?6jnqYd4Mwiq15AjdbL46yVCUQ/WDdRIjoXMLtOT79n+LLkzB9cbRtNdlPesa?=
 =?us-ascii?Q?Wfaf2AptyuQZrdHrlzMjBNoD7LxOHZdlDcqQw6lseoFmow9k5oQpGW/8cWky?=
 =?us-ascii?Q?lehIntdZ2b9zaYIUl4qC4GevAGkvZEtv5CDr81TDDz142xrpZ7dyN+E+LJch?=
 =?us-ascii?Q?UY/WhOxPGBOaBXls/KIbPg4yFG4zazjxStV9go9L0N0syXrPnkBTDclOsquL?=
 =?us-ascii?Q?+JCFl/N8iLUokW+Uo4bS+vnXdkCMuf+AFmRGoQUfaUU7h1BiYnvEPAEM3lKT?=
 =?us-ascii?Q?GY74B49Q/NpzMcZUOMKRpbrGWZKOFBVzCyihTRFd9oxxHts1RXQkTYW8p2b0?=
 =?us-ascii?Q?g+iDTpRkU/zumm6hB3+XxymSQmD96dOprmbt04OpX2HfZe8Kda92oJkRAkCt?=
 =?us-ascii?Q?sijiUEj2wtuvt6SFblPWDTLn7MCDNQjsEnhYEUVGMoUnPFVvxRRErzjCGtJ/?=
 =?us-ascii?Q?D2fl64OxklCTCmJtTH4OGHY8LkiqX3ybl+42PtiAnwqK+SSKSH4hhvya59PK?=
 =?us-ascii?Q?0CyT+5Ucy4dInFn1hbsH6rOoi86AKTQxc8mj8nvTHRlofuJA0lij1a0i3/O4?=
 =?us-ascii?Q?lFZ9KaDFykg/LoK0NmJIycQ2ErYqkdhBeGyvLnAzMfdrF7jyQ+k/imOTJ2ID?=
 =?us-ascii?Q?7bn2x7ClKxzoSg1SMJBfO0e6IyvlkDGkAOsHlKj++7gY8GgbIN1qziktSrum?=
 =?us-ascii?Q?FNN4Oe3ihHdNcuhLnG1DVRS4HjFPEHp57ekPs/me7+xZYjSwxFRpeV5lLnl7?=
 =?us-ascii?Q?fZl9HpZwNq+HkQZy6lAsE7HQXRziv2NWVnkipad0Zlmq8S52qqtMXWeyIzog?=
 =?us-ascii?Q?o0XWqyzAO62S4fkAXuwNVxHdFmJrly8QtR2Jhz8bZScQY/Xs/ZQtamF4hRop?=
 =?us-ascii?Q?JLBin0mUOPx24Su1MGgg/xhYSwCt2GSVjB7ktyXt+jOiXWwjbIPKnUa5V5DG?=
 =?us-ascii?Q?svxLLF70k+39wOiUAQ1HlhqcjkAjvyxcOLWQpTkjFfnOPFFfFtadTTOhnii6?=
 =?us-ascii?Q?d4ptSXH/STL9swX4pgDdLgHJXANWfSj9xNrbnK/q/l8024Nkw3WnDyuoKGte?=
 =?us-ascii?Q?NA8V6ejRBMnMvUX09C7gE7wX/xp9oiSTHMhmR4jNiD18qdokGUjE5efRbXHb?=
 =?us-ascii?Q?qFr2RYAUn0uTkic+sqHAurd6dQHhvMMxZolo5wXLpvtEahrp6RosRfwehffp?=
 =?us-ascii?Q?07bwbTowo4msWkxnhZ2NfY2zhh9EnNW7DCN1ip/D1PhJbh109d5yTTRC5yB5?=
 =?us-ascii?Q?izAK0neOUT6fiE6+SGEdJqgMAYBBF9MKWbJ6T9FYY0r3zM0LeRDU2d/A5yMX?=
 =?us-ascii?Q?yAw0GVexFzND5YNDjU6QfLoa2Z4awCUT/ZhQ?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?AteqQxewCa4sEUGQ7puhxbp3KJD2TUyx2oYdei0BFUE8vBnWsoAwMOqqdtyR?=
 =?us-ascii?Q?Ar+N8abXewYutqznKu5yA9Vnhw2tqY7UPZn9N8N11a2uFMGnLy/Uim7QeYUj?=
 =?us-ascii?Q?mo0lN+A7JBRB2jYE92RaVzN6Ag8nx1ZAarhblnzq8Lqw3CUaJ5PWJa0KOgP7?=
 =?us-ascii?Q?UQGiKR1lGWuGhnITlbX62okNtPeoN5ZrvjcAHVjJ8tTZbPbt/AneEAjvZa/5?=
 =?us-ascii?Q?WlcU9lPlSQPPCvzzpCSXi+CNhzDY6zSvuJTVNX01cpmKctJQHrFCgvAl3fYk?=
 =?us-ascii?Q?GqqnN+vAmyOufPlbl6JdLBnV8DqNKu+ZE90dxh2I6csMuziTbuVI1yxkY3j6?=
 =?us-ascii?Q?aNwWdXYvdO8xTgHgIAyzSxgsTapaoPpmZc/FeIsa8gYh0OO40QRqQclySkrf?=
 =?us-ascii?Q?wjiThIDlhmcOTHLqa8t4z/ZeQhBJ/cjH5LsdRVw3wQ6IboiCV8mNQBHXJ5oB?=
 =?us-ascii?Q?eiZQV4QzEye3fhhyYy8flq2jTPcdPtJasB1MlahrI5XdinSoWuUtduzExyQd?=
 =?us-ascii?Q?BR2IDomT6awDRd1kNt1mrsoki6I4DwbD2xqiNbLS94EhieEvnpZNFkOyZCvd?=
 =?us-ascii?Q?7/RvSQqCzBQ7/pPyP0P3CsvWNgRyLfavHHRjnyCuJ63n+re822S8qkzfg+Hc?=
 =?us-ascii?Q?7BRy3C/r7OVV59dC5XtNzgZrDxQ4Pzxw+Rp2UJ8J8AUDxJUota38l5ql3hy6?=
 =?us-ascii?Q?EeKPRIdLxsv6F1Izg0i0aHr7Vu0i0+WlY5LjXFTqevncpnkZFwoFbbQYWm8L?=
 =?us-ascii?Q?vGxMmXfejC3vIu56650OwXj3pv/BQLnY703kMSS9XqCgxcY9v4IBV1FwwAVa?=
 =?us-ascii?Q?sRGCW828OSQWgKRzwS7xcLcGKH7Ce4qQSGseiWsS+reYRmFpLQTO9XvOema7?=
 =?us-ascii?Q?C1XfjlRp3UmpsRSTT8MkvmMoyMljB/KW3uCGvDuo5my12oKYFb48q6nUQ77Y?=
 =?us-ascii?Q?jpntm1T/UcjzuvdjRTBG0yvNbLkc9Od+2rkzsDBv/2FXm0Ukly3AtpZZW8sx?=
 =?us-ascii?Q?St78GEFjJDuU7mBRO+rN01XTjRQuFgNW/SvyuSIwrRX8QRPrYN7kIcamMyHH?=
 =?us-ascii?Q?C/0PmGhbgaug4uC4cv8BMmfDM/1IQRMD2fIBvfZxAYuhyr/uyZleROF8TDhn?=
 =?us-ascii?Q?DWliY75x1vQ5DCVKxZY4F4g8kDoSmH4C04Bhvv88QZvCMFvqLN0rGlZVNeh6?=
 =?us-ascii?Q?/aRGJZposv6fS1KqArhXkuNWa0Dszlk/ZIjt+t2qi1/S4NLCFfqlHtGqbome?=
 =?us-ascii?Q?W4ZRVjZotxv7QIaavVs8WpwwSpW8nLGyp6R8z85y13hGDK3FvFb+Uo5FDQI7?=
 =?us-ascii?Q?RM4RP6du8+jcPiz0DXoe+mFRYbp9Mm+COYJI27UZr3c8uwQ5cbQGjylck0S1?=
 =?us-ascii?Q?NQurjeQLZLyL6LxNljlDQySCcs6jrPV6nBFB0SHSCdGGAq61aWXOuTD2KgjJ?=
 =?us-ascii?Q?xbOkWTHknmF7JGlpuQJV9itYRXjNAASII48QLo8kV6ZD82OSXVaZ3MOAkO89?=
 =?us-ascii?Q?7qOonABCra4MfLNO7jpeZDsxx+NX8khx8DzSwcQx6LXWmlcBarlBn6mn8tTH?=
 =?us-ascii?Q?0Xxp6idUn+AcLF5R2zE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f1bd5b-3493-4bc7-a4a2-08de1016c683
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 20:25:14.3879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEMD2I9y6lGeUhML9GdD73AzZ4EpcVj05N40sATLUdrw4YrjsTjjR7exbEUNwBjLNbD7wPXVDBCmNQD4ImHx/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7391

On Fri, Oct 17, 2025 at 08:00:51AM +0200, Johan Hovold wrote:
> The driver has never supported anything but OF probing so drop the
> unused platform module alias.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 3a4645f59a44..5a5934ce1f84 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -1114,4 +1114,3 @@ module_platform_driver(imx8mq_mipi_csi_driver);
>  MODULE_DESCRIPTION("i.MX8MQ MIPI CSI-2 receiver driver");
>  MODULE_AUTHOR("Martin Kepplinger <martin.kepplinger@puri.sm>");
>  MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("platform:imx8mq-mipi-csi2");
> --
> 2.49.1
>

