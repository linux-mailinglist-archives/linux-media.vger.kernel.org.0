Return-Path: <linux-media+bounces-23852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD659F8E81
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 10:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B70118978E7
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 09:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34FF1AA78D;
	Fri, 20 Dec 2024 09:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ENaExb5O"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271D21A726B;
	Fri, 20 Dec 2024 09:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734685316; cv=fail; b=u0PWfTNz6CVAYlCOwtul3CaOnYMj6f6FmusS3F8YmeNFtMQo5sbPK7yjPpQe4uJ1iecSm/QfGDN49wM2o1f7PBkMpRQL/rn972lE0gsfqaPObP3sBoxPNoTmTaw1j7XlFYckWrA/SsIaKKftgiFTDfBTuLr+Wo67GpyTCrNA/I4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734685316; c=relaxed/simple;
	bh=AwBd6LtTID85Vh985s4d5MWYHEXDW+kdZOSQtUGBrew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p1cXlWSREhf/7AsqOyhskLssw/WIS4725ThCbbfmchPye9hFQUko6tVOsJ50kpjQdA+zpnP9mqTdAh18xBaZGDMVg+jB2yHNwzGxVWF4p4lQTKg0iTdQKOJXGu/2Vt1qV3e9Y9Va/Smm9R9IYbViGx5EBsO/N2EeDR/wo93toqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ENaExb5O reason="signature verification failed"; arc=fail smtp.client-ip=40.107.21.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oegHWhR/6bsh4fRUiZhVA+Pb7aF+42HyLrdnZEl7h0xvZV5tOsnKFOwRepZiY2LGym/eVu3NLiea85zOWM3lr0eZTxzP2SyyTlAdFTN6Bki8k+Wnncmj12tujQ4eoeLTrp41MpGlKvmocZvGy4bA8093OUfI8nwmwLfZIOncVn88ahNFdJ717L0zSMBoK0Cpo6Viz1We0si7A24B7w7DMj3OOh8OvZ01NoHmx4JiyxE1pSRQSbkL9ccj9U+Gf3P3i3u1zAnkimeVSpGR6MGyBq8+LvkRtOFqrtBv9EIIdf3L58waIOeY+aRZwWJLSAXgOAAM6dzIfvbyL4winRhVRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIfoXmw3pNwcw2jhQq4YeuRw/aNnsRoghehBu1yonfg=;
 b=vlwyQAVxB/fIQgLrkvOC7HRFi5Ndu+oQQsS4dLrD1gl92/NGOC9G745qUwfimcJZy0U0ztoeQmxuKiU8/BIyIuLwtSVUJq2qOhlXHol/HE7SOxucfocl74fkeMN0QhrfD3nmpv9TfTfMg5prSKbpzkzat6+p1vK1iJ5iJ3E8bIQxHLdWw8t7dJ/16lBhyIS7DzaFZzp56EmpNlr4Ms4P48OOqNJtX69GWh6EHZv6wCHJTWRqJldwOB1riD5NGaKQJbTO2RgNNWMYs/bIlorxkjuSSxmSEU6qCXB2F9qLoA1SAdearHFAEWAIq93dsPzJzSQPqyf/U95Sm4Mw19+DxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIfoXmw3pNwcw2jhQq4YeuRw/aNnsRoghehBu1yonfg=;
 b=ENaExb5OCbfFyqH4BimuLwfMRiGpx1ra1HA7Jd7xfsO+THdttGPY8+khZkYS1H6bzWWlO8DPzJVLHqHU/FiDVXkvAQ2k2no86L5jsSwpA/0b4oOTrIsJHTgoC4LWkxumJytkV7APh2uL37OxMNqmAjnW4FKiiViR5BL8TENNvDJko1DqIEmG+GFVwRUlLRBlZSg10EVf2UhK+Ol/Z00fjAg59VU/4beBCEecz+vsBckx/JH1W5uwK6+HnKIuRhX7LgW4eleid+K6wQ0CAHEs7JT+zrh9ujTylseu5BQkKrD2dQwwrZR0eSrrAsfUrvciALDz8w82mRCfeoPdGniq0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by PA4PR04MB8016.eurprd04.prod.outlook.com (2603:10a6:102:cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 09:01:50 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 09:01:50 +0000
Date: Fri, 20 Dec 2024 11:01:47 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/3] staging: media: max96712: enable extra debug
 register for max96724
Message-ID: <ejo7shay26lt5qiij5ojd6fllin3wrqh4t2eaf3jzm6l7z5nxf@t7lnnw2nn5qn>
References: <20241219150644.64507-1-laurentiu.palcu@oss.nxp.com>
 <20241219150644.64507-3-laurentiu.palcu@oss.nxp.com>
 <20241219170923.GC3377144@ragnatech.se>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241219170923.GC3377144@ragnatech.se>
X-ClientProxiedBy: AM0PR02CA0097.eurprd02.prod.outlook.com
 (2603:10a6:208:154::38) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|PA4PR04MB8016:EE_
X-MS-Office365-Filtering-Correlation-Id: acd9a619-fc3e-4740-4ede-08dd20d4f0ca
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?oxKQvXztQ0CjoluE20WLt/0Nghh0Rw/3cdcKTixEwKyax2lHv4tiC1nIcw?=
 =?iso-8859-1?Q?W+mh9SATwNEXmIjkP6AU33QYg4wMjRqTjM5UejhH9ughK6JD8O3aCpxvEj?=
 =?iso-8859-1?Q?olOtG7wZjD7tE2cWdLQrjbvzbeexHHRYZHUBgU81lt9HWraFIsFpgQXIBp?=
 =?iso-8859-1?Q?zmSXFpFjFYkbVAAVr+4Enkp5k6Lbo7F63AFhkqYBO1IZ1qVgzbFNUnLFCF?=
 =?iso-8859-1?Q?OU0axCimQEL3hJFgaD4/76kWE9jqILOtr5q0dYB+WakA67DAT75gjlaJvt?=
 =?iso-8859-1?Q?tObVW1+N4TamqN9R/IdFUGIumVoaUXAjcLyWgFJvMAilWIp90mhDVY5Ien?=
 =?iso-8859-1?Q?Az3uNad3t6t66bodM5ZtzCVUW7C8i7wcE2+JrALVtp3UgflUOszTfUixlu?=
 =?iso-8859-1?Q?/eb306ebzS5Rr25tKyPhKy2MPhL9E0zsGPqdvHwT12HHkctlshrNqwrRIP?=
 =?iso-8859-1?Q?yhX1+GveddNeu6Ymflc8Fm2xo7WnDWyNbZMRxmxDIkRSIHnvX5c3KGEgsX?=
 =?iso-8859-1?Q?c02A0uozB0wFGjc/SyYAunSSf1zMXAMQRddW5EUFIP0E56mWF82qV6YQCP?=
 =?iso-8859-1?Q?StNFrbe0lp+E/oFmUIWymYCGLv1LK5yiWH3wryuFEDXkpdPIsI0bAAv06N?=
 =?iso-8859-1?Q?CwMPpiL6JHUsvr5rTKk5/VvBVv6+TPrcx/NekZYnBZ1jcSYETnog38VRPr?=
 =?iso-8859-1?Q?yweGgsAPYbaoKtKCvh2W8m2ifyzd4ivOpqS81GphKr3PP3SfmVWZvf/A2o?=
 =?iso-8859-1?Q?oY1tdIMLUKC8E+DzVhXB2CX81dqXBUlmZXMDQ1DWZ/EM1UqlGeJiKgKKQz?=
 =?iso-8859-1?Q?T0GgHqYxY+sGCfpYb3eLC7SgdHL39OtofDD8FkJJ4le0U7MtNoGLsjzdEk?=
 =?iso-8859-1?Q?eYovx877SKXHYOg9zF3d+HZbChYEJKxJOYJXVLK89EAngaTVeMvgAY1TDq?=
 =?iso-8859-1?Q?q5ROKugfX4ZQMddOokETbtJ+2JEN3EIp+8lFLjfGT+6AYbBui57QnfpKwy?=
 =?iso-8859-1?Q?g+XUMa5NzSWGazia1HEkVd+J2wsBdSdv2d41AiNM41WcfL/gpmuOP302sU?=
 =?iso-8859-1?Q?b7wIx3t6LPLJmmRk6mrZxXixQNv2g3iYeRvy8hnZHWIIoqN+TjjqzrDEq3?=
 =?iso-8859-1?Q?vagA6xnlmzWbymsL5DAtQzwMxZwo7lAkRke/KomisPeoTVsc6rpUH2DU1U?=
 =?iso-8859-1?Q?NHPZlK0bx1IYalVinX7tylU62D/aJnJVUcxU/PuNcBnbhB3HR00vNFpY3R?=
 =?iso-8859-1?Q?EFx/kbHkdXiGt/joKP/RJByBrPP3tUUSLy5RtMG37xdTO4BWAdwlQg6kaq?=
 =?iso-8859-1?Q?BCs9XxoSKh3m4ybJQy2u0pOKTlWzQ5Pn9sAGFFFO1sCDhjPaWLgBveaozM?=
 =?iso-8859-1?Q?aOP5vuqoSJEEUTx9K+DCzjLvJ88r8/S3DkNz/cVJc6kOrMdUitzv34fBNL?=
 =?iso-8859-1?Q?ad5e0BgU/CQ0PCST?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?iV/sW0bX5Ooan9lSaFovuxhiWScJWgDX8EsM5jeHCnskUaGqBZtStIQRid?=
 =?iso-8859-1?Q?01gDzMUu5me2Ego4CpdLCSiLr/r89yoy+Vm/Fzv+1VbqZbYF85Sce1u1zE?=
 =?iso-8859-1?Q?mqnjX0rmFsCUySsJFRuuSekCnvFulSYTMXxEci0en33tZHFo5t3NjuwBcg?=
 =?iso-8859-1?Q?ZRcvVhP+fR9QaiLbilhPSup+dNR0lU6qPvI6RjIanMR2kqZWgagBJpVbpL?=
 =?iso-8859-1?Q?1lEz+COj+28alNUj9see+h427aKcejIaUbq0MEvmrmxSWYJUjE7m/fQzS1?=
 =?iso-8859-1?Q?7pNCZwnfmQnTW7XbfeLSjENoozfCjDbF+fQKkdokL58yGo6k5clq7HZ+vd?=
 =?iso-8859-1?Q?oLG0ib4qA3Et5J8IXL6ZyponOYb7PX85eWSvATe+Ini4wwc5R8NAEc1MZa?=
 =?iso-8859-1?Q?y/OQcIJR1QU89NuDyxaNPWn25uz1wF8sPkblL2pyfKMlzQtJU9/EJcwhAX?=
 =?iso-8859-1?Q?2nmCLXMn3MIJUJ+GhGK/KwDuE/CNSf26c4XgZ0jLQLpobwP7D4cKsoGTdl?=
 =?iso-8859-1?Q?EiB2eP5fQJDkj2+zOOUKY0Uixo//QQP571DuJTqDAbOVBZeskwjAWhQ58Q?=
 =?iso-8859-1?Q?IbjTZ5oMN+QW/q0gSUJVHenozVvx0ijGVPKdKuZhQjSaGyrU0q9re6VscP?=
 =?iso-8859-1?Q?oJVtz+01hB9I8m6LoNGcsCzH3eJTn8VWwnIY6y5S2p06hWYPFHjsDClfUi?=
 =?iso-8859-1?Q?HZr+JPlU7gYER6sM++tkAX7m7x7UOZB2NisvTTEocQrNUfRiehlqJx/5AS?=
 =?iso-8859-1?Q?IFw46Z2PQj15Pmd8ZyF8INGXoS0+FHr+9PJ5wkmas/IAcVWIw4Rwr+9Y3P?=
 =?iso-8859-1?Q?hhLuBwvmd1qohSTIZJbU0H+ecUajWJ/VGVWfZWbDMI0QZRp18suilbdweg?=
 =?iso-8859-1?Q?bCcYq/Wj4dcTWWQ5gpqWpdZUhq57ChX6D3TUgXvlEem7Zy8Q69p7nEu/cf?=
 =?iso-8859-1?Q?JCAuTyk1RsVL+4QMT/9AtCrJvBhBV2Ke4mqFY7uOvIMP5K7K4IqQZgOdqw?=
 =?iso-8859-1?Q?CpzS8STRA1h7MJF5euOPzFM+JV5Depiy5rUIZ3n0e9SgWQl5O3OsUP/JEZ?=
 =?iso-8859-1?Q?FtnvrldWujZqKm7VCxapoDVbpxmJeW1hazQmRvRBnJB5XXJgcr5+9GSGQ5?=
 =?iso-8859-1?Q?acTDkuB53BlxGEdSpVNwe+iF18nGaRhxpLVIpRpeQ7Ry9omCr+OKXf4wof?=
 =?iso-8859-1?Q?FgpcYsrf88AAkf1SQciCiY1de62rAWDAGpupxaXdTTrRpLdeFR5neaCStP?=
 =?iso-8859-1?Q?9ycKJdGBwNoIZfA6fs/e92KU2dKCQPTHdrP7ALJWiURoV7IUrjTAEHlHju?=
 =?iso-8859-1?Q?e0hYCjd3QRIDY9v0+gmfqAM5I1/u5cIpq9Zv84TJP5oR5hr2Qh1aMMHtA2?=
 =?iso-8859-1?Q?09TyVj0TAj5Hp6CYVfS7whKvDdUkNdAHr7F5x2kmpZ8hZ6sAA4TDy+ynQT?=
 =?iso-8859-1?Q?A3ybRrh4z3gMIyCALmO1eYb+WxKqnTNI4tgmWqmGF0susbiQtRdeW7W6RH?=
 =?iso-8859-1?Q?R5tQyebqPW3BmjGAmJSKUm52sLR4rpFx7/R54BY44SbzCqbu5LlGcpoJ6P?=
 =?iso-8859-1?Q?UXbrlO5N+xQkTShn739mEUk1rqo4qSYnjfna5Abw1ra+lmvWHy2C4gbCTT?=
 =?iso-8859-1?Q?Z62xymqilytns0g7+TUSs5rQGwoiUqqV+VyeO0f0DMY2QsyrSueApucw?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd9a619-fc3e-4740-4ede-08dd20d4f0ca
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 09:01:50.3917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sIVXbAma+knA7MLqC4seYHqKc6+MMeX4mYzZh25zZhkoE3hDNYVtninwqZ8WiTpRpza75VNAjVSIk7PdOsYQ8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8016

Hi Niklas,

On Thu, Dec 19, 2024 at 06:09:23PM +0100, Niklas Söderlund wrote:
> Hello Laurentiu,
> 
> Thanks for your work.
> 
> On 2024-12-19 17:06:42 +0200, Laurentiu Palcu wrote:
> > The current implementation has the register disabled since it is not
> > documented in the MAX96724 RM. However, in the chip's user's guide [1],
> > in the Video Pattern Generator section, the register is documented and
> > it appears to work just fine. Before the change I was experiencing
> > approx 10fps when streaming, after: 30.3fps.
> > 
> > [1] https://www.analog.com/media/en/technical-documentation/user-guides/max96724fr-user-guide.pdf
> > 
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > ---
> >  drivers/staging/media/max96712/max96712.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> > index 5228f9ec60859..682ebd20851f7 100644
> > --- a/drivers/staging/media/max96712/max96712.c
> > +++ b/drivers/staging/media/max96712/max96712.c
> > @@ -462,6 +462,7 @@ static const struct max96712_info max96712_info_max96712 = {
> >  
> >  static const struct max96712_info max96712_info_max96724 = {
> >  	.dpllfreq = 1200,
> > +	.have_debug_extra = true,
> 
> This flag was added as I could not find the register in the MAX96724 
> datasheet I had access to at the time. As you now prove the register 
> exists in the user's guide and that it works I think a better solution 
> is to remove the 'have_debug_extra' flag all together then set it for 
> both supported devices.

Ok, makes sense. I guess I was thinking of having this driver support
other chips as well in the future and that's why I left it there, for
chip variants that don't actually have it. But, on the other hand, it
could always be added later if needed.

I'll send a v2 with the flag removed.

Thanks,
Laurentiu

> 
> >  };
> >  
> >  static const struct of_device_id max96712_of_table[] = {
> > -- 
> > 2.44.1
> > 
> 
> -- 
> Kind Regards,
> Niklas Söderlund

