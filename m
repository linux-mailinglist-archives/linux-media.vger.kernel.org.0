Return-Path: <linux-media+bounces-32137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5205AB172D
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 16:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0453DA20AC5
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 14:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0517C21B196;
	Fri,  9 May 2025 14:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YxQ/9R0p"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010045.outbound.protection.outlook.com [52.101.228.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B391B7F4
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 14:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800282; cv=fail; b=IKqwXyeJY2kpnFLIPC/4X9pmlJbv5Xj9cv9x7EJqOQOXNinwvYm5POK3Bns0hMi3f15hFRsLrY/IyOrJWDzDANMQrwOflfpxNZ4DpzWcNbjTku8iH0Ngjd10fm6JiWSWd162vPh3BHdO0EwOWE/mR0PdLDrvwH5ZZ4QR7VrOwa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800282; c=relaxed/simple;
	bh=qbSdM8frp7iRSeRWoF+Y6SaSK5217B3jWU7nnyDC510=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SiOkuXcFN75TBIVZqUQtBTJVe6xuus/jUT6nD3PsMD61Ae4CYFLma4lnAgIXp3JBHBRHbyOS3nvLSxudYe/DQZb+/7q1s1ydFrePsVoM3A5Dl7NSq8jO2RWTVO7F0QUhd3qLZ03SVZBBqMuAMWLf0lbzN99CDBkzZ3KmJwydXa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YxQ/9R0p; arc=fail smtp.client-ip=52.101.228.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVne+9+IgdUSe8+uD5s9XacqWw/CLF43ZvF5ABk0wYnfkR0P0x9iPRYlLlb4OZwE6eog28fW68HQxGrKE6D4AxA18sT+IDAsMHoy34SW9Ra4VBQ9ihDd+dMD9eug6kPU6O5wNZmqjQXMRqEnqJir+wtyaVEUlhVj4BSa+2Q9jxHxNwNsgLDUAfiZYZC0HQZYCiSftVgCN2zwZwcHK5ZTvqFUUhxbXS0kUw7BYUzDu90uSkoVTesWcM2KxhVa3TAYkZEnVqi3YXOLX7HJ1EzSmk6fYkAg3QsXGhcZTSfTlOv4lVgyRVbc0R2reETpPAkRjA/COhlGXwdocuQhCVrt8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFD43HFJPLBHTC3eZQpJne4jUBKJThxbxkW3uPJDcho=;
 b=tpBGeGjL33H0LCL4+2CjpzAWr3H5UJhWEeOczZK+2n51a/p9AZ9qjlIAoGllJEzxxch1priOCy42z+nfHddTh5/j7dMI3XrMLhHjxThKNE2hriF6fj5bNMeHTJ9laU9bVSNHvD1CaNIa5pgnITEpfOFv8uWiQTR01esKZc2Asp3Cbz31LZ+FAbzMu3/Yjx5+zzLlpMCStNK6+zFQX4z7DJlhgzSfc4kR+7PCIVgSa5iFHJhp5G8WWbgk5T7v0NWp+keKqfD7RoyjPmIWr5OiGInCWHIT7Sp3mtqhwMEf7viFuWW3hwqx/0Wa51jaTlEobXA/ZkKFON21oKWzM9hCHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFD43HFJPLBHTC3eZQpJne4jUBKJThxbxkW3uPJDcho=;
 b=YxQ/9R0p2+VLYww/6pjBqkkZtW+qpodxr92yZHTAQn4oHFN0rG0Ta0Ee2dVVcJm4NzvjVbjZuB9sPjG7i29soYAFig1GbY/UalqNKqfeKyy6sSTpL4oxOBhD4x1HpzABvGk4Mq8LQAZ19ArF+taVOGLFMB3sL4bqWZ5BybzXndE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY4PR01MB13945.jpnprd01.prod.outlook.com (2603:1096:405:204::7)
 by OSZPR01MB9410.jpnprd01.prod.outlook.com (2603:1096:604:1d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 14:17:55 +0000
Received: from TY4PR01MB13945.jpnprd01.prod.outlook.com
 ([fe80::d31a:b7f3:d305:92bc]) by TY4PR01MB13945.jpnprd01.prod.outlook.com
 ([fe80::d31a:b7f3:d305:92bc%5]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 14:17:55 +0000
Date: Fri, 9 May 2025 16:17:34 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 3/6] media: platform: rzg2l-cru: Use
 v4l2_get_link_freq()
Message-ID: <aB4OfjTGktdu7Yos@tom-desktop>
References: <20250506125015.567746-1-dan.scally@ideasonboard.com>
 <20250506125015.567746-4-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506125015.567746-4-dan.scally@ideasonboard.com>
X-ClientProxiedBy: FR0P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::16) To TY4PR01MB13945.jpnprd01.prod.outlook.com
 (2603:1096:405:204::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY4PR01MB13945:EE_|OSZPR01MB9410:EE_
X-MS-Office365-Filtering-Correlation-Id: 07c41c61-51f9-45ba-2f72-08dd8f044a87
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?cAT8MQX8XpXlM9t7QbzjkB5DHS6AApAVlmN67ZqcrlL4EabO7W680RJCCW2w?=
 =?us-ascii?Q?eGcc6LyP1YVxULJJEWNtVZXYye9VBI1TBlTy3V+M5CI1Rmy7dMGzfIgAAlNI?=
 =?us-ascii?Q?MbmKd0RXEBKjxBzDpSa+pQMiYbqC7gJ83BhfFmfzew7CfhRPkvQoQwUco5H7?=
 =?us-ascii?Q?IUzq6GdVGTRYHbguX/B4LgAt+6V+2J3AgxS5g5ZWeSHi9EOouuiNJyko/mOM?=
 =?us-ascii?Q?e+eeRZ/P02jSwtobu/45GSI0RMzQjDXDT1e8fAadVqiFsIPCwsqUn1rMgD0l?=
 =?us-ascii?Q?+2j/Ej/kGQB+cpym1Xn+0SbWZPMi21GIPUhhBjnzi5SwNSNV86XX6vkMpXSW?=
 =?us-ascii?Q?vkXmrtPIuomOpGM8Y3TXWv55rPt4bwCONEAs72C6fM943g6sSM5pMcmoVHwq?=
 =?us-ascii?Q?0Yckw2dMwcu1/wHEue4vmL8vIUkJaZjavvfbTp6U/ckxMeDMOJ0dMNmgRPLB?=
 =?us-ascii?Q?W+sOVQT+01VPXYsw5cvhrGcrUPmWq9g/srnlBl+gtvMjW4/Ltk3G0Wq12taV?=
 =?us-ascii?Q?TDismL25O3/M1lhOvi6Vu26B7ULusszpDeSwxHUXie3IKDoG2HlZcvKePPrc?=
 =?us-ascii?Q?9VSoIVw69aCbJEUh8stRfFbNVnu+yYwWkWcfHYB7nPkUxszt351HEZeMttHk?=
 =?us-ascii?Q?1QRaVtC1npi6IKKl9dFGBLu0djv5n6N7T+7db+8i8sWaxmvgF+6GTzmvDXgy?=
 =?us-ascii?Q?zdlmzK+p9+bPKHxfKOQOc+rLCQd2lNI34SxB9UB+8yvxglyjlQaADikcs6f1?=
 =?us-ascii?Q?oCn91jgn3O5OeOqYRZ97xykUdE+2LDHy9UT49bHQrv/As/wP/ZDOpwt2uLWR?=
 =?us-ascii?Q?TnI51SM2qTXbiXmLmdik6vztKx3DRupHn88sgZntAbhUcdvJcevIwGFCr5nF?=
 =?us-ascii?Q?shr8kneqGNGA0evex6fhk1fEsZ7Bx5FmZPBeHPhCmb2Kj5qwu6s6z/OOJppj?=
 =?us-ascii?Q?W4HTqbjZSBnNWcbACLqdDo+xBgUD4Prtg2SWlYEKkO3S7CqNRC+HeKRSN9iE?=
 =?us-ascii?Q?UZrObisQ03W+4RwmobvbeAQCU2xyZm3zVglxPr2crF4MYn47/flcPX2H646I?=
 =?us-ascii?Q?JHc09JBM5XWRiHFS6ArgcOYwbHVvQX/u0brXVkZ8GNsoqCraxb9k7WPoTRxn?=
 =?us-ascii?Q?cgicvf9TSfE5McMmaw9WRK1+3T5hkFStzSEIrjnIbFbRI3/1kO9WscxARa+V?=
 =?us-ascii?Q?LLEn4nD9fFhxYRM+F15fTHkgFZKyl9WA7AfVX2LaYi2gF70kkq3lq4yZ4Ihx?=
 =?us-ascii?Q?d74l5e+sDpPMWoVp2EiBJnOW4Y/1cj83KBmF0ZHWyw0uPZv5+pfRXzcUmPuz?=
 =?us-ascii?Q?cqef7ARGZbkG/ocr+FtlV9KRU+NErHGZGmX0/XUMzt7KxpcSUamABBwTpykw?=
 =?us-ascii?Q?k2RgazSDSgmn4hmius3mSj2uB4ynjWJoVp53WqxBfWun40s5QVy8LxPYFlsL?=
 =?us-ascii?Q?UtJZINnA2knUgsfuaKh3VqN11/OwFNLsvYs9eN6Lslrm1kGjSGWSjw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB13945.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?5gWhnFMe+HaGOFd+ne0lkLD6/IozY+nM6nQMFJgKgZyx7QItzBFt3G51D1eq?=
 =?us-ascii?Q?Tu3CtKCpKAnjYBbnh3hgJ+XQYaKiRQAA2Hx9E6gxSApANBXM2f67824VyIXo?=
 =?us-ascii?Q?1LwiLMgUl/fJOtXa5iC+C9PYWi+YYa2ImKNA74hd+MOuJopW7a/0H6k/EmnP?=
 =?us-ascii?Q?chsXlhdbSgx4NzczZtuT3RUyT5S2k8yKB8YDA2iPq2UajCQwK9KAQbAnFouk?=
 =?us-ascii?Q?+0pJenYlvI/Wk+q+y5aWb4UHc/TYlT1GAOleNQOetZRT+MPKSgen96pRW8uE?=
 =?us-ascii?Q?9T8kItEdfNKG36xgp659zSKnFyiQ7Vls5JzLnqBcLOEdm8l1nFMlvd27WwKQ?=
 =?us-ascii?Q?4C+DHuthQeY3yEskBx++Dbhvb8qSnuMdg4+AMRgd/rRfifZS/sVnmbD7LgIo?=
 =?us-ascii?Q?A26j58/GGdWRSeOVOC1j4xOm3IS3bLuzRgQIdb+XiSv+JK7HaQz1Km6SeiTF?=
 =?us-ascii?Q?35eEiyBReFzoWOuyBvcXI0hRHp2H2JENB1lVLygg5AR2+mNmo9810iaNt2Fe?=
 =?us-ascii?Q?NrbmB/8l6gDR6gl3HgdesO8FM0d53rUaseMlPChFP45hcV6CFkofFUCDz4gy?=
 =?us-ascii?Q?u3LHNZNoH2tGLhL1r8Pnj0ukKIEgD/lVXH4OsVuin4IGDq5B2r8+fz6RZho7?=
 =?us-ascii?Q?zaxAYOru7iDRrSIfFaUvdyNqoevji8CjQmvFQWek9XgAX7eDBwqfZQErAuzu?=
 =?us-ascii?Q?7CfLipS8AZhcvxFwnsrOGYZRv6VWDyyVTWD+L6vKToCRvHa2+4pNu3eNWm83?=
 =?us-ascii?Q?lbLKkHpa25qzUusyoskWCmyNHNTDIVtQRBcCMhZD3v00bN0SE76fEzEQPm5s?=
 =?us-ascii?Q?nfUYHLB9CLi8zgAWtv9yUBTUdwUAkXEbNyj1bwob6uy6mJdHvwOWS7MJ3wEJ?=
 =?us-ascii?Q?VqCS0sXFUmLNMlx3/uSOAZa79wbEjZlTqJjkXENRU2fubo6FqEJZe6b0Fr0a?=
 =?us-ascii?Q?Z8Y9TtdZyYIHc+4b3xeRSn2CH1IIHJCRruTzrflD1I+AfJ2phEEB+rj3D0GJ?=
 =?us-ascii?Q?rc+Z8a0GzwOg/vhwSA91o1DT6J/c4rp5tZr2qtQyv5SSW5M//1cKlAaTV18C?=
 =?us-ascii?Q?E57Wngh3qM2FNMYH4QJeaT+00bTP8t6xpkJU8UL0uqosstexD2m5F3oBymB+?=
 =?us-ascii?Q?zGoJah34CQVO8tOQdDmJOpeJBHZqg0Y9liXMpWXdbhKOXArUMx2Sd47qt122?=
 =?us-ascii?Q?110mBvar4vDsoam5RVOu/TIrR65ViecHs8la1V7/zMmLpvU49T1Jt0lvBmSk?=
 =?us-ascii?Q?aDWRUaExgEHCFEYCNIeE1ADcQpEMXnU8IZFuetyBpuf+knAgDhYzQC6JF+VG?=
 =?us-ascii?Q?FgjbtTQAzQv+2y0u0O2hOM/GKefeEGRrRp1LP5BJvPv1X/2qaUukPtS/M+Tw?=
 =?us-ascii?Q?qFY+wQzKaPQujExjXufSc4IiA4thq3ZwOnCpELsU8fXEPJjJNcRVntyDp5I5?=
 =?us-ascii?Q?QmW15brOzBdFtL1C6/xgUebw4SlcpKV4XvPKCTMz+Dags+p//ppCwEcZMdr2?=
 =?us-ascii?Q?oP528ZuhcMHs0MDiFOF8CE35vglZ3hHP5W1fwNZINZI8XVVpxibWUzjbQNS+?=
 =?us-ascii?Q?MfBBZTwK/gR5ER0nvD9EURtuiCeCp1mPSpiFMnR6wqtlgtiRjlTGQBeYQUyi?=
 =?us-ascii?Q?IhdelVspcfE9qZvVpI6p+Ew=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c41c61-51f9-45ba-2f72-08dd8f044a87
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB13945.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 14:17:55.4065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3b8FDB0qzO2bmRUo6apSgxCkTtzTREWZr39cUUKQzgJOpnBN6ONmb6i3ANK8ptcVDAuwKuRKlgVvdvCRRmkp3kAP1EwexIDtc90PDtGD0F7Dk86uz5VWVVgBNq6RNfoD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9410

Hi Daniel,
Thanks for your patch.

On Tue, May 06, 2025 at 01:50:12PM +0100, Daniel Scally wrote:
> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> 
> The rzg2l_csi2_calc_mbps() function currently tries to calculate the
> link frequency for a CSI2 bus using the V4L2_CID_PIXEL_RATE control
> of the remote subdevice. Switch the function to v4l2_get_link_freq()
> which correctly targets V4L2_CID_LINK_FREQ before falling back on
> V4L2_CID_PIXEL_RATE if the former is unavailable.
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> ---
> Changes in v4:
> 
> 	- Used separate s64 variable as return value for v4l2_get_link_freq()
> 	  and as the mbps variable for do_div() to avoid compilation warnings.
> 
> Changes in v3:
> 
> 	- Fixed mbps sign
> 
> Changes in v2:
> 
> 	- None
> 
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 27 +++++++++----------
>  1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 9243306e2aa9..8870c2cb8104 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -282,28 +282,25 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
>  	const struct rzg2l_csi2_format *format;
>  	const struct v4l2_mbus_framefmt *fmt;
>  	struct v4l2_subdev_state *state;
> -	struct v4l2_ctrl *ctrl;
>  	u64 mbps;
> -
> -	/* Read the pixel rate control from remote. */
> -	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
> -	if (!ctrl) {
> -		dev_err(csi2->dev, "no pixel rate control in subdev %s\n",
> -			source->name);
> -		return -EINVAL;
> -	}
> +	s64 ret;
>  
>  	state = v4l2_subdev_lock_and_get_active_state(&csi2->subdev);
>  	fmt = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
>  	format = rzg2l_csi2_code_to_fmt(fmt->code);
>  	v4l2_subdev_unlock_state(state);
>  
> -	/*
> -	 * Calculate hsfreq in Mbps
> -	 * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
> -	 */
> -	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
> -	do_div(mbps, csi2->lanes * 1000000);
> +	/* Read the link frequency from remote subdevice. */
> +	ret = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
> +				 csi2->lanes);
> +	if (ret < 0) {
> +		dev_err(csi2->dev, "can't retrieve link freq from subdev %s\n",
> +			source->name);
> +		return -EINVAL;
> +	}
> +
> +	mbps = ret;
> +	do_div(mbps, 1000000);
>  
>  	return mbps;
>  }

I tested this series with an imx219 image sensor connected to the CSI-2
RX IP of RZ/G3E:

Some notes:

 - pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample
 - hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes

Then hsfreq should be:

 - hsfreq = link_freq * 2

Please correct me if I'm wrong.


After applying this series. I'm getting the following issue testing the
imx219 sensor with SRGGB8_1X8 and SGRBG10_1X10 color format.


[  947.305876] rzg2l-cru 16000000.video: Invalid MB address 0xe8bf8300 (out of range)
[  947.305876] rzg2l-cru 16000000.video: Invalid MB address 0xe8bf8300 (out of range)
[  947.339165] rzg2l-cru 16000000.video: Invalid MB address 0xe8c9e900 (out of range)
[  947.339165] rzg2l-cru 16000000.video: Invalid MB address 0xe8c9e900 (out of range)


I'm suspecting that this could be related to this formula.
Let me know what do you think.

Thanks in advance!

Tested using:

root@smarc-rzg3e:~# media-ctl -p
Media controller API version 6.15.0

Media device information
------------------------
driver          rzg2l_cru
model           renesas,r9a09g047-cru
serial
bus info        platform:16000000.video
hw revision     0x0
driver version  6.15.0

Device topology
- entity 1: csi-16000400.csi2 (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: Sink
                [stream:0 fmt:SGRBG10_1X10/640x480 field:none]
                <- "imx219 0-0010":0 [ENABLED,IMMUTABLE]
        pad1: Source
                [stream:0 fmt:SGRBG10_1X10/640x480 field:none]
                -> "cru-ip-16000000.video":0 [ENABLED,IMMUTABLE]

- entity 4: cru-ip-16000000.video (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev1
        pad0: Sink
                [stream:0 fmt:SGRBG10_1X10/640x480 field:none]
                <- "csi-16000400.csi2":1 [ENABLED,IMMUTABLE]
        pad1: Source
                [stream:0 fmt:SGRBG10_1X10/640x480 field:none]
                -> "CRU output":0 [ENABLED,IMMUTABLE]

- entity 7: imx219 0-0010 (1 pad, 1 link, 0 routes)
            type V4L2 subdev subtype Sensor flags 0
            device node name /dev/v4l-subdev2
        pad0: Source
                [stream:0 fmt:SGRBG10_1X10/640x480 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range
                 crop.bounds:(8,8)/3280x2464
                 crop:(1008,760)/1280x960]
                -> "csi-16000400.csi2":0 [ENABLED,IMMUTABLE]

- entity 17: CRU output (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video0
        pad0: Sink
                <- "cru-ip-16000000.video":1 [ENABLED,IMMUTABLE]

# IMX219 TESTING SGRBG10_1X10
v4l2-ctl -c horizontal_flip=1 -d /dev/v4l-subdev2

media-ctl -d /dev/media0 --set-v4l2 '"imx219 0-0010":0[fmt:SGRBG10_1X10/640x480]'
media-ctl -d /dev/media0 --set-v4l2 '"csi-16000400.csi2":0[fmt:SGRBG10_1X10/640x480]'
media-ctl -d /dev/media0 --set-v4l2 '"cru-ip-16000000.video":0[fmt:SGRBG10_1X10/640x480]'

v4l2-ctl -d0 --set-fmt-video pixelformat=CR10,width=640,height=480
v4l2-ctl -d0 --stream-mmap --stream-count=100


#  IMX219 TESTING SRGGB8_1X8
media-ctl -d /dev/media0 --set-v4l2 '"imx219 0-0010":0[fmt:SRGGB8_1X8/1920x1080]'
media-ctl -d /dev/media0 --set-v4l2 '"csi-16000400.csi2":0[fmt:SRGGB8_1X8/1920x1080]'
media-ctl -d /dev/media0 --set-v4l2 '"cru-ip-16000000.video":0[fmt:SRGGB8_1X8/1920x1080]'


v4l2-ctl -d0 --set-fmt-video pixelformat=RGGB,width=1920,height=1080
v4l2-ctl -d0 --stream-mmap --stream-count=32

Thanks & Regards,
Tommaso

> -- 
> 2.34.1
> 

