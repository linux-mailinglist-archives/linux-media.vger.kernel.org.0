Return-Path: <linux-media+bounces-50185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D34D010FB
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 06:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B31BF3029B89
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 05:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D752D73AE;
	Thu,  8 Jan 2026 05:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="eC1IRcRS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C793D1E511;
	Thu,  8 Jan 2026 05:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767849789; cv=fail; b=jMJQvdKiDnOi+l2BZcCUi569XhYVM52t+SOXxLraeD5vDHWXlYOiF/BP6QiFkpWIOnTcqzuM13K1N+8XUfMn6XpBLC+Qbkru3UgCH9xR9UdbaIN/rhy32gk6MbWMM10KQvcEzaGp1aHIhj+PKldczww2aaRWCaMeRgBjul8htkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767849789; c=relaxed/simple;
	bh=sTB0fJkQ8ldyxeAu82c1nTp0fqXAMoZClpHbT3XG51s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KKUHFxfCHgKvGr4OIeGVYDp0MiX5EvxixTCgsXNIYkrqtEwHodr4M2DqTgKa/eiV8Y3hyLlr9ijJRPn5jNcY+NA8/RDYD8zGJ8IdICE7yjxiMYMZb78t3PlLROhalNyuIUEfiRejCWaOCaRpeNnxUQCdsDCsY+vh7CaJ+qEdGu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=eC1IRcRS; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608402QH394420;
	Thu, 8 Jan 2026 05:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=43mROD3vwD2zY5rAqoI2XZn3EqFPVrOIaRyEWEeDv0k=; b=
	eC1IRcRS95JFdFwTznMA3fYq5leBkkN4Eg8LEJSUwzZotj7e2KMXTSOOqvQOYFpJ
	P/D7zIJ6r98CgqMJ2exeyape9F3SpIyHujE0rS7tZHFo/MErs7WPi5BbDH+q2mhg
	XH9inxJmbnscfkUnm+sRsGEEIYe1Qbjx15uoSLmOr31atYj4YzV/n4Nl0sDJi8Mf
	xiIik61qiCp6aEwafIrPopv7puQH73t7Mxyk8jevscxqPWqhBxOSZ4YPDnOh463Z
	/1crJyeFjS8g0NZcyU8jB4UR9WlG4lhIWnTocXYdaskePpiWtOtQLA34yXDr5xrm
	YQcTSOwNzH4fCPr5IiA7dA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010062.outbound.protection.outlook.com [52.101.201.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bet33cy4h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 05:22:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrntHWcVdikP3G2MmbBFikg+DNLcFVDvZgXkJmT2pEJcgJLqZn9RYvBYKDDKTxu63DRqTb9zlWQg7PquCS3n6owjsXs2eYEtIdlGs5IBwZ2K26FjAa+5VyQp7yBjyaAyTccrRH9CJ5KfIZ225DHWNp08ArdkhAt2FWnRncQe/Vc+moOBqFOFqpAHq8YpU9XqD48Oz1g4RoYIEDbPTBAfx31x/6uXUh0iyOd6yIvU0N4HVyC+CiU9Wdnlx004Myd+1ZUgnMKUTcCGYLugy9BitV+I0eGWLIyVp3mO8ZHRb+yC/kjNMb4xjCGl5JWwQtW5lQe7f1vs5yHqqk+SthrOxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43mROD3vwD2zY5rAqoI2XZn3EqFPVrOIaRyEWEeDv0k=;
 b=JhacHtNAVb7B9D2nz289AOmUAZdAJKe1Cm73qc6a0Tnw5EU3EiVOrsR0HNh86Dqb+liE/W6JI6xf7nOIXXroCtfGEsNpqvIT62R858iS3KE2dyoFo+5YesVyTUSpL8zj3iYgCCWfaH7+X8ILu5JYAKotF1i4jP0jFgWMvyEmRC8oWCmbOCgBQOPXHluqUUGU+TnH7pZHvLKFixzQ+/pY9s2AdZHwxt7mD05xwF6Gq6qlXcWpfd97IrE7EOzEMVeObN4rETGPgY6NLH4aAsxmRbLgy8iLW08MSLFhoaFOdsOCxawT2uOj8eoqS4Qk2aQLsagMGMxkaLS6iKWYDSoAVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by LV8PR11MB8510.namprd11.prod.outlook.com
 (2603:10b6:408:1e8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 05:22:37 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e%6]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 05:22:37 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, tarang.raval@siliconsignals.io,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] media: i2c: ov5647: switch to {enable,disable}_streams
Date: Thu,  8 Jan 2026 13:21:59 +0800
Message-ID: <20260108052159.3879884-4-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108052159.3879884-1-xiaolei.wang@windriver.com>
References: <20260108052159.3879884-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|LV8PR11MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: 60999d13-52de-4204-0ab3-08de4e75efb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ipFBiDUGxtmfzwwm7o3LKFRAvsp+CwFIZmR7xP8zzy852AfhKscVL0deGxkR?=
 =?us-ascii?Q?cvMIyzlhiyeNRLkuGE0NnxQtDGLM71tYrqT6DZR1S4Pr7X/fE8X3kLqIg0t2?=
 =?us-ascii?Q?F9iqdNiUK3yTQZ215AebUYRWSHLTvSe1nyzTAmDTBazHids8au2KHbQ+be1/?=
 =?us-ascii?Q?dnusBmSr3n42F5JOv+nm0WHmmZx4nXTBsQ5O7vwvXHKlO5NC6TzICd2mrnmJ?=
 =?us-ascii?Q?jqfzK/xe63acZxYG/5G5QZTy5VkeH0Y7CaziSiPNXuFA1One5qbEplUny8Gf?=
 =?us-ascii?Q?EjuY0m6y18w8UX6oHAIOVRn6B0uOmOlZ5FOu0AWyWUSpGjNiL359DgH+q1F9?=
 =?us-ascii?Q?VxK8arXrSnawJAPMTJlZwQ5jKjPOAT/r5R+onmZqu9OvJlJh3j5e/cntEYX+?=
 =?us-ascii?Q?GXYBvI4TRf9ESJv0EUO2fTRY19UUcWenoBvII9x7vA+lzpOYVHYLN387jVMV?=
 =?us-ascii?Q?8rMB17cYJ2QjTjtekt+eg+dYrG6thizdNJmv9LDtVWlxTsnT/p89suOIuVge?=
 =?us-ascii?Q?tfykrWm6l6wGkVUYZhV8lKTpAwF0xJP1A4UxQ86WhAMSFH4zP3kZ9liofbEp?=
 =?us-ascii?Q?ItZUDfZd1os02uHAmzJIRYTnELywPTM2/IKJCA4KoPrfnykDNFZqGvuAVlp4?=
 =?us-ascii?Q?d2hjccSHcHf0E7wjQnUc071mGPMVJn6vabaXs3cYLq+ihvqKFz7RzgfPYUQg?=
 =?us-ascii?Q?fF7U3n4gbI4EZVo68ft+MHq4rYz4hgSooL6n7zi0kSpNosittCF3zTw4Qz0b?=
 =?us-ascii?Q?2XZOiOwoNrlBSIUQapbTU3Ht0oye7Yd7EPk2WorNgS8hADhfkMvrRl2tsMTn?=
 =?us-ascii?Q?YxUVTe58tOOswVvBCwOz3Ml1/3qyzOnTJA+zfT5lXQezBcLURIso1GciqIbP?=
 =?us-ascii?Q?hAPmwzr2kz7MM7jztfU5H/xuTQUWTXt7/pJrzkgvI/UikuUe7Rr7YiAjWozY?=
 =?us-ascii?Q?wdsLZuz2wEEV6APSN+y2kDm2FYYuz+9Rtb8eSpPt055l53A49HQkWP866Qzg?=
 =?us-ascii?Q?JzvO0sjpzjASCbZOBn+ViOvlRTEYWlTrEYU4aMSFmOPaCsO8ajZHMtTDJwlb?=
 =?us-ascii?Q?OFUabPGPwySaDZyzZ5IYAT5tsI1j8LBd3YbnBDuXy/0gyCGfkaV9Cb/Hl4v/?=
 =?us-ascii?Q?LJd6D5GbFsKH0PUYSplUUn6+h14uhQKqotj1CpuQ6Dg8rp7xNg8M83fEEun1?=
 =?us-ascii?Q?/lVPgNhf2ZTNubQBte1jf1CtMgrUj46J2Rc+cdNrUYZNxyK3r/51pmyJgb2s?=
 =?us-ascii?Q?7qHIS0iX0HdnRCVHedtVE2QD/9Pw9SkUrx6A3D2D2xFG+laECoOTm9XLsNCo?=
 =?us-ascii?Q?uLaWYe1/jV6tUN5do48xe/jtvNaZdRbfTq2v5nyfHfUpZsQihBeUmQ+wbpLy?=
 =?us-ascii?Q?FqQn4Mvg6FapIMaKz+JCmSS4XYBfmYurivh85mrKbRhL3LA7mFivXHtx40O2?=
 =?us-ascii?Q?IDUroTP5E7ts7yYJIWoKD9nVPTdauhXAOOWCmXlIhylQIeY9Eqaje8O3QetH?=
 =?us-ascii?Q?QuiISu+mEF+ax9aVp4psoEmYGP1tO3KtNI536MzvAlGcYLsJ86GacVu+Iw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0OZF9PSYSQ+QXmpc8ysbuwObw4Oqd3HcATC4Z+MvAFku18IiMrdM0BE7fsxd?=
 =?us-ascii?Q?3Kyeofz+gn+9E2NtqhZcmCefUsqicKaGgijv4OwLDidiNx5kgZmdyvUPggYj?=
 =?us-ascii?Q?x1C8YMezXg5kAfoTQGhhvFOINQLGuN451cdfWLYc7RIlngy4d+KicZmOs0jl?=
 =?us-ascii?Q?WxO1L/QKzCZsKLw+AkJ1FSJ4e8tgDRsEhnlYaLWxTJgUsMxo/szoWeFms90U?=
 =?us-ascii?Q?4ht/0dPvxpGYqXSOAUUkxoSx53o4AjGochYaN5H4dmwkhSHPetB96iciD14o?=
 =?us-ascii?Q?KYKmU5PRNUzQxlQhi4MbNsiyEl2BCbXoMFTNuXGztyzJr/9/fMAt98ZEx9VW?=
 =?us-ascii?Q?MOp63oneIiW517W8eXPsr8mqe1qNVPfVnirwK3klhC1HpKZkNHxxdn1kHFNs?=
 =?us-ascii?Q?+pYcqFT8dtXKxunfScNLJAmbrNAphrrT2BxlkhTbWzvdKIBmM7EJWPhXfEUp?=
 =?us-ascii?Q?nrxfJlfFd+ocOA7o7tK0FKQ2u7TkeZrmXzdFdq+gKkLjzPeknjtLZuY6cIYJ?=
 =?us-ascii?Q?2+imYmSmDmSG3I4/aQxw98jXP5G2uO25+/Jlgcqt5xAvBT8eAWAyfVBJptMe?=
 =?us-ascii?Q?EVPTjH6yR7ePK2S0c3DfFZsrQ0QpwzL7J3+vnxbu+s3XK4EyYipL1UVQ3VM7?=
 =?us-ascii?Q?BNm7dwDdjfOUUOAtnY12gTBEYf+mFjc/TNgvyHfnWzSTvvPhH9+mJhopR/lx?=
 =?us-ascii?Q?miwAeQjGgTPVTETbkCEuitzPlu/KszZBrTPjSpi3A4RveIRqVuy64xZe7R+B?=
 =?us-ascii?Q?Dkndq+7e/V/K/eYQs3BSOyOfPwwUtKwrKx24/7k9T6qYp+//neu33SYCu92D?=
 =?us-ascii?Q?eVmCZuKMsMGMDuVflI1X+9l+qZpFQGnizBKzkxTD+/tEDcV6PTd4QlfTqgYB?=
 =?us-ascii?Q?GQbyLBSBMsNmUUPEHLdMj/TWgfoqFq/dv1VVUJ+l3h5EQnQ9NXZqBuwR74x3?=
 =?us-ascii?Q?LaeP0yyiZdKUI8iw5bb+jgd7nPiA9NY0Zy1VFBNa6qZPJsMdmPzyBU/3Dm7i?=
 =?us-ascii?Q?I0CQOLDDz5J8/jMU6FWtNZHfURM+oR0oH0yy184RFTkeAaGp95+zKxC8O3kJ?=
 =?us-ascii?Q?OzkQIol5aXAsdOSWEgWGI4oWs+6ZSCTrR3bKN9qui5B4FyTZhBljIE/eOwca?=
 =?us-ascii?Q?I0XxyHUhQ3qMclzl1pZk6bCdYXvQ6jZowgcR5hUMeGprcQHpitZ0oyfQmIuM?=
 =?us-ascii?Q?Wcpzp5Uun2DPGJqOxIa74bZyjokLO7QRKiBeovRDJj4MUO0jcMRvquVMQNU/?=
 =?us-ascii?Q?isQdtEN2wSJwp0ouLbOuJdO49SycTziYvxS6B7Agh/rQyDzdBvujWzU3Lkib?=
 =?us-ascii?Q?lGLwE0Sd26oA7eh1L2iQEzIoYcL12JiJvRteZwAAlQd8L21Z6wUlLkd5O4e1?=
 =?us-ascii?Q?XXkoTca0CQnSy5yUlffQ/KXTpGrlcNmcUyjLOB8JGPh3eCEOXlt1oHkoyVw0?=
 =?us-ascii?Q?D4LjUlBoHsu5HapN2rid3/XpRBb0AbxCuNhnQEGJtzj+fZyIkRcAA5h+o8d+?=
 =?us-ascii?Q?h2Z/TYPbpi/0saUdTAAY8Ideq8CdOC0LBX/LPl8xEjHm+KoeCWPo315LYlYy?=
 =?us-ascii?Q?9JV+wOcfTqH7XAuzY30sbVCNVIrENmaC6GP/pEe3aURBu0hQtP/pf+6QS822?=
 =?us-ascii?Q?f3zdLQQdToEMM3rRgy9AtDjAaYaAQ83KDx0aIHmgybVv/wHQibQ07ZNs18kF?=
 =?us-ascii?Q?9TOH2VvFEchsHwD86+99FUhPdtjxORb2CjgwiutkVP2s2cG3i9kKH23Xb2Ws?=
 =?us-ascii?Q?mPHbTi1ogCqZkJZJXjLK3P4hHyE7bvg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60999d13-52de-4204-0ab3-08de4e75efb6
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 05:22:37.4870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FPliIEAL23jc+ngLIHpkaeGR7WC8f6yTBTpyTkehZfZdtTWrqa842abaIhs+Pt42zU/FwHLkptOiSJCUV/JKJ0YqMfvYkaobLfZlwk/TUrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8510
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=695f3f1f cx=c_pps
 a=V+mzYH1ZSfwt9Wwm8MCB5w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=P1BnusSwAAAA:8 a=pG3TpReAhpfUgZjo6d8A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: sYCgGysRFYEOT3_3NigyiREXaQbCnCfC
X-Proofpoint-ORIG-GUID: sYCgGysRFYEOT3_3NigyiREXaQbCnCfC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAzMiBTYWx0ZWRfXwOkK8QuTUjI7
 6w6k+STGINGrWqa3QCePp9kUmva/MucIuzpCTlQEiw03AL3TQiDFvISYFggxEw5WLgW9L/ZJPWI
 b9EkE1S8AbwMjCcCvDPpjKvfzdS4A3V5Qff9KOwDr7gux/mSZU4aW/ByLxEkTFjItswC1YSbnu3
 E51kSucZnmXwgW49UWPmeLt7xefYHx6PP7HiIwn+u6Mz0kiXrEXSi7R+/cNc3B2bUk5Lp6IHxqd
 ejDyb0M5/VZJhjlzPCBYZWrGbBAxv9+xlF04w150TJ9J4d9E3smDV4bU8XYvUysmphNeZgDBYfT
 AIdOq74hFlb4kpJzRQsrZOxis91t+mCAXhjYMvWRxod+aiQ8FN3SN8KutYAdruPA3x5tP4CUBlA
 x0ifwdhXbx+btbqr8YGLDRQrSifPqzGzQ2o3/5CHSVUVEeXVXSNzIpVa+Q6aJWHx8XYdxA8RuIn
 2icu+Pe1QOHD7TA9Jyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080032

Switch from s_stream to enable_streams and disable_streams callbacks.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/ov5647.c | 89 ++++++++++++++++----------------------
 1 file changed, 38 insertions(+), 51 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 4660c06de..6a46ef723 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -510,23 +510,42 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
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
@@ -536,19 +555,24 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
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
@@ -588,7 +612,7 @@ static int ov5647_power_on(struct device *dev)
 	}
 
 	/* Stream off to coax lanes into LP-11 state. */
-	ret = ov5647_stream_off(&sensor->sd);
+	ret = ov5647_stream_stop(sensor);
 	if (ret < 0) {
 		dev_err(dev, "camera not available, check power\n");
 		goto error_clk_disable;
@@ -682,47 +706,8 @@ __ov5647_get_pad_crop(struct ov5647 *ov5647,
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
 
 /*
@@ -892,6 +877,8 @@ static const struct v4l2_subdev_pad_ops ov5647_subdev_pad_ops = {
 	.set_fmt		= ov5647_set_pad_fmt,
 	.get_fmt		= ov5647_get_pad_fmt,
 	.get_selection		= ov5647_get_selection,
+	.enable_streams		= ov5647_enable_streams,
+	.disable_streams	= ov5647_disable_streams,
 };
 
 static const struct v4l2_subdev_ops ov5647_subdev_ops = {
-- 
2.43.0


