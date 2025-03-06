Return-Path: <linux-media+bounces-27683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D9DA5444D
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 09:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CD4F3AA2FE
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 08:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56FD41FAC52;
	Thu,  6 Mar 2025 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ClzHVjkN"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B881DF24E;
	Thu,  6 Mar 2025 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741248681; cv=fail; b=ldmVA3vvULeI70EB96O4jHyYAbXHjuEqJ6EY/52lzBtH+1fxaFRNODxdWo5Kgztx51AxSc4gyaYiD6kSIfXDPrTSm4DSUQHmiSffU4YF8a4vUUtO2x1pDPS4fgYVc/aUUdCzw+7oVW7E2I/t8PsVw0H4mftzeLzSYAOx9tp0m7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741248681; c=relaxed/simple;
	bh=erGf/vooNEPvWuo+gXU2xJ1+VR82KRsPyChmRO1idLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pTV7cM+5qi+P+K3HwTyUwe/ZeQzxR4bR7cmHT/LsYbBngoxZXu5BxoMAX6ohOLtPio6icgNv0dXYKXippUbIwv4UVa1+CNOEomVAtuwHnWcLaiW+wRSylJEAnokvOsDx8JB2v9C4wZa/ah0l8zBGsgd+OG9phkwDOCeDGr/0mII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ClzHVjkN reason="signature verification failed"; arc=fail smtp.client-ip=40.107.21.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWGFtL/KAzMl/NSzqaCPF4aroL3O0ngkZksFi0YxZMfb9DzBMmP023gIFcSMkAKlGOx3Kl2//gxIR9nBQOfIkbl1S/RoDb7VKz/R2sYcYEal5M1KqdN4HrX5qSCw5BNRLzxlwCRLXwbEItzAjTLr0YVCQerFVZwwiMSUmQMV5AL2p3lh16auY844HQJ5MuwGFqWBa6MGfYQjL9GAvTCFN3MbWV+asJ+Gl77p80rQOaLbGcozx8IWb5e5uoNdRnwz1clFa+73JODrjqT6dOi7/qGeL4OM+KNUcLcKZBDImLQbQ2LsqB6r2lWejbPolpN7E+0a+Fpub6Wr3DAUrUE2ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpuYd/ALbTpnJeUqsm6thZE/6AqKCuU1CTIg/6dEw4A=;
 b=FgUPmBpGeReEThJXWKEBw8cjGHuf/nnvqzivsF1usgoM35WKycsrxcZlgItbJEbPaSl3zLhZgJHSf47HqZK3FZD2fXPBRty9/QfWD7pMoZAVty0FZndMgtMFXSGO+BLxXuUqkt63sJHUKQy4TzL+Iniyd3If+XyxtfyQMataF85C9hr58h35J995WaWYsukonq1VerfoAD4uCO9LeWAbZLeQXqcVNOpzhvKiyXeyZshB65dY86CZAHZFruqFTivnwaTax8Qz+kST9/DVy4D9UlkGzIyhIDrf0r5AsYzSdIs0p6uMIMJGnrbZp5BYN5YbD+aW5W6nBXZbOPFGXjW/Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpuYd/ALbTpnJeUqsm6thZE/6AqKCuU1CTIg/6dEw4A=;
 b=ClzHVjkNlg3FSaekHQwSHsFNkOCukHzd5bRtdLD8haxn196uFAtZw0qzdqKMhy55XwkoCRH8lyxv0f9ftRvu+Ms5Bm/6B4uWIhKT9h5S8WyxM5V0M3iZo+QFrRLA4PzBE8FlPzAl9aCXffl47qcoQ8S2NfAxBfQy0E8gmOrgghUIQEoro3P056maNQKiTsmGFpe/U9iXyamHJA6VoY/ybijP8vgK2LaecZFGdMJ0ePnJ+fMKXrtjgyb7lZSTvfB4VoNRf59vq6mL1XycAv3jRdLjVe5+rFZ6bfjWsZ1EeD0v/WdJHv8utplx3X4N7JD4B9lKANS3u/DqblK0kdaKNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 08:11:14 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 08:11:14 +0000
Date: Thu, 6 Mar 2025 10:11:11 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/5] media/i2c: max96717: change internal regulator
 voltage
Message-ID: <fvwj4hi4n2uspsggikw5vce7tyxxv2pga5duoqxbqkd46msfjy@ndshmqgxm6ky>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
 <20250207112958.2571600-2-laurentiu.palcu@oss.nxp.com>
 <57262be8baee2e5c08ed7ba88cfa2716ef0138bb.camel@collabora.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57262be8baee2e5c08ed7ba88cfa2716ef0138bb.camel@collabora.com>
X-ClientProxiedBy: AM9P250CA0020.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::25) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AS8PR04MB9080:EE_
X-MS-Office365-Filtering-Correlation-Id: 26ab4d7e-1aec-47bc-a7cf-08dd5c8676a3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?J/8CmMw16C8aLLR1sAQy1L6izlmwoKJl+OsF/XsgpndUNvD/YBX+IMVZoW?=
 =?iso-8859-1?Q?85bMHDyRrXuVhZwmoE059+D/yxDFvqCmGWCY/XuGX+oQt2dEXg3TYt8bZy?=
 =?iso-8859-1?Q?D0cbyiIO8RpofPNgcIeo99IcddznPv6Rxf1IK3lUonunhJ0z3+ndOOvkRL?=
 =?iso-8859-1?Q?ZxfJZGpzEPGIN47BXMYtyjdQsR5VHKDl5cfrl2bkiWCajvkLg7qNOMSQYJ?=
 =?iso-8859-1?Q?xAi7HoN80Eto9xjZAlq2PU8QnMSj97X8/hQ8rSnECIXtbBKTjjznSR2GyS?=
 =?iso-8859-1?Q?X1yjb72UvTl7gGEXAQqmFjwr1uFz9h2CkTGYf1Jn2vhOZCz94gGpUzcYyW?=
 =?iso-8859-1?Q?k+iOl5wWCE/18dG/x93t9ml6kqgLQrlSSAjZH/YfJi8HfB5Kl/Z726PXXZ?=
 =?iso-8859-1?Q?gHufBoG3ig05Z8GDsEzOblzdt2csGm9McHvzgQnEbrQvbFne5ke5lcmPn3?=
 =?iso-8859-1?Q?cfi611WYlTLPp2hpKL0VPR7qC3uahgZ+lc1iq3yiUU6kMMOW0P6CCqQ7js?=
 =?iso-8859-1?Q?9vslr34EB4SIlRvd1JJdlyiEZ4ezDOgJqxvgv3suDTnA5hUq9hhm4NLCl3?=
 =?iso-8859-1?Q?K7ecuzueoswjsqLI2qyW1h+G3ZFsHbzNPa+B64847csPHUhxgkyPOrZoG4?=
 =?iso-8859-1?Q?a2FT+tF3Hvuke30Px+HSzzeDUqbZxb3olheoXzUag9e+mKOzfDaxYN3tq5?=
 =?iso-8859-1?Q?Slua1tdTLgiw43p/Oyk+aXTs4IueY8I8O55c0qxZ1keqG5xzBT8TTjn3AG?=
 =?iso-8859-1?Q?+Dtm7BKK4wWfh4DfumqV5YM1hVyd8ZGKQ+JkG9rtnPcMnrclRdWDoMplKA?=
 =?iso-8859-1?Q?vrN/aDlHlTutnUnvlTu+IBnXzGS0t9BRKST4waAXUshHOsI0HlK37HF/aC?=
 =?iso-8859-1?Q?BvKJehCPK80i3FEdwEglmgobhN33PSfFk0oX0RvPGUeY2vJBELuot/FreM?=
 =?iso-8859-1?Q?7Dvd6Met8Qc2QbxHWIAikmootMZWQCis1gJ5VgWQw/t2r2ZkbNdkUtFzrd?=
 =?iso-8859-1?Q?NaP7NmcT5dxHCVI+3H49MTKQiLedXBUkKqDFiIKBWvPFBLnwCrqdjJUTxv?=
 =?iso-8859-1?Q?v6MGMMxYPSckJ3licix5FzOopAM6NyJyOU6JDpgNUScyGA7GW5IHiQ1GXa?=
 =?iso-8859-1?Q?ifLai8UuiX8lzfxQqbvPccZRlEFl0EaPbGNf40qD1crmaCPC7JPDhn2ST4?=
 =?iso-8859-1?Q?75vOUiUE8q2cJ7DsQWD2hUl10QQPiWKB5ixTOw37XRq5F7Pek4iI/jCPt5?=
 =?iso-8859-1?Q?NheICIMXH+5qb6/AVwmkl68rl+oORhz4snmA5AGP9CjqaX81ctPMiNsGdV?=
 =?iso-8859-1?Q?srxul0w9aHDQrziFKH4m99QpOI2vX26QBco8Wuvh3iyUFUm6tXo2ZUHXHO?=
 =?iso-8859-1?Q?OCP3xGoT8FdSyyIh9CZ8eeasvOyuuoQqFI2U9oK49Xo5LEg0Rx//I8vioh?=
 =?iso-8859-1?Q?zm/aL6BxE24TJzYq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?zPvvCjloByacF2++PZScfpRbRkZH7yfnEDw44IExgmeCKVPJY4bKS4JUIF?=
 =?iso-8859-1?Q?aPwb9zsd4KEIwpsro+8H+1CoYkEGZ6WX7yJjPh8gnXzEpzp3Um5/fF2Jx6?=
 =?iso-8859-1?Q?UUNE84YTTQm9VkZmYYtu04P8k84Tt5AdcRxhmqKzYyE9wIY94jKl1iUu0B?=
 =?iso-8859-1?Q?K6hL7Zw+Pcj28pScPJ1rpkWIc/VjP+HjaWS/kA08lJtDLzGaqinzllhXu0?=
 =?iso-8859-1?Q?jHFkdvkzArYONoMw+vaNAZm9PnSi+ggzk/jrGkzQQqO55M086Pye72q5Io?=
 =?iso-8859-1?Q?TBW5sPQJGtA5zDzWvKzAR2Sx+ZPzjEsBT3RzZ4PzWIsuv67Qxdwd/Ijg2q?=
 =?iso-8859-1?Q?TeJmvEss8ab1CZbsK5lORQ0sKBnwXQcxDzo/7bihUsTVLCloq4DPnblr8R?=
 =?iso-8859-1?Q?vHi2OGPAR77/cH+iN35utTx1hjAGrs0xRqIajqz6EhoHo14t5iV5AF+YJa?=
 =?iso-8859-1?Q?WAuGNtLeWM+R+Pm9jfxTLMgovEbMC1jeYzrP4834prspuRSwIIockjg34N?=
 =?iso-8859-1?Q?1ivuOwWskwGhCEDJKMjXu+RaKxEN0fPkcanxLSnj29z4zB4mPDr1LQrMCf?=
 =?iso-8859-1?Q?ndqbcJW3HxRsskfgInNHvoXYgwYlP8cEjXxyIDz0FgrL1l5mOnod06CaLq?=
 =?iso-8859-1?Q?r3SXSb0UQGR9bR94uzWToZOLQ5BFtlC0jXqlBn0VEA5Jg1TtPtXqQgcSXe?=
 =?iso-8859-1?Q?pv1hgJA3rJQACbATzVKbON6fWEMUoJkyAxNgv0Qv5GMOfV9plmrHhJsrGP?=
 =?iso-8859-1?Q?bfY5roNA8oI/eyXCaHQ61tZUAp31c/tV5wF/xiblY33M65KlBR8T+W3zOd?=
 =?iso-8859-1?Q?iD8YNFsNf460BK+uGdKGp1kQXYcoNG2Qa26zMj/xKmjMOqs1MHF8WUsUY/?=
 =?iso-8859-1?Q?/w/NHohl/8x133ZL/JocZ5vrDsL/kxdKz+j5S2jgFvjVFq4c6Q0aF8Cx3U?=
 =?iso-8859-1?Q?PMWDV7OtT/lKLz18W3OeWL+kXe5lAdewN/n53sj9YQmoXJfWPPRoxgByUn?=
 =?iso-8859-1?Q?7o7AlAYygvyI9ifpqgPkGnmcj1qD/ha/dIDNT5PTzowGWvSdGl4+HGMCfm?=
 =?iso-8859-1?Q?DQ+RwNyc2z4vB2r0bc+QS2VswZdddiypF2Sxn+Y37yMrnQL8PV4cetF19d?=
 =?iso-8859-1?Q?EKEl2xvZMqmU5oTKBAeDMkF7Z+SVZRJ3cS+jnLj5vrCnGgROTJJboeWsaM?=
 =?iso-8859-1?Q?In2C7BLpTDzJ6NSFrh8fTucuThb/A42NPa86I0YGyC53aiJvMz1yNj+Rmy?=
 =?iso-8859-1?Q?hWDvsRQD33gMS8ZTPxD845pSvTW6hW37T41+xYe5crvUrBemRMe1bbUSSg?=
 =?iso-8859-1?Q?bHMIfRxdXVHGGDyF0jyrbmQwaRFaG50WVNbKECPYccBS/yWc0QSuF7v3pE?=
 =?iso-8859-1?Q?sj6KWtbudqZNZt5FBlvc8oUh1wz4bRsk1vx7faYbKaeS65PTCMwEFDNRDC?=
 =?iso-8859-1?Q?Mn/MXwhFR+NWvz2EM6AoB/gPmWwNj/qRDcs9u23cR7D+3fl4Mu4r58C4hu?=
 =?iso-8859-1?Q?Bzet/3rE/rgn04TWhfkYkZJpeW0JAel9+8zkGqAny3kkzUmMfsNl4NLNeM?=
 =?iso-8859-1?Q?IVzza0xRfWbxGLSyNn9BqJRqR6MPGDyKkTzHE0QnovckEfTRbjiykeipU2?=
 =?iso-8859-1?Q?DNDnrfbHSrAsynvIc46xU6q4bs3bjfm14FqIiB286mL8xEPJ3/oAou3Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ab4d7e-1aec-47bc-a7cf-08dd5c8676a3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:11:14.4608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zdrFn4orDQl6XIPOCfmzNgtuq7g0OSdAjmJ+HTOD5oAs6yZssjCF/fFJoCd0MpCpim2pbOdXAinqKbkS/sWqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9080

Hi Julien,

Thank you for taking some time to review this series and sorry for the
late reply... :/ I have been involved in other more pressing stuff
lately...

On Tue, Feb 18, 2025 at 02:14:57PM +0100, Julien Massot wrote:
> Hi Laurentiu,
> 
> Thanks for your patch,
> On Fri, 2025-02-07 at 13:29 +0200, Laurentiu Palcu wrote:
> > The Programming Notes section of the specifications states:
> > 
> > """
> > MANDATORY REGISTER PROGRAMMING
> > Make the following register writes to ensure proper operation of the
> > MAX96717F. Without these writes, the operation of the device specified
> > in the data sheet cannot be guaranteed.
> > Set bits [6:4] = 3'b001 in register 0x302
> > """
> > 
> > Set this register before going on with the chip initialization.
> > 
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > ---
> >  drivers/media/i2c/max96717.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
> > index 9259d58ba734e..b1116aade0687 100644
> > --- a/drivers/media/i2c/max96717.c
> > +++ b/drivers/media/i2c/max96717.c
> > @@ -78,6 +78,15 @@
> >  #define MAX96717_GPIO_TX_EN       BIT(1)
> >  #define MAX96717_GPIO_OUT_DIS     BIT(0)
> >  
> > +/* CMU */
> > +#define MAX96717_CMU_CMU2		CCI_REG8(0x0302)
> > +#define MAX96717_PFDDIV_RSHORT_MASK	GENMASK(6, 4)
> > +#define MAX96717_PFDDIV_RSHORT_SHIFT	4
> > +#define MAX96717_PFDDIV_VREG_1V0	0
> > +#define MAX96717_PFDDIV_VREG_1V1	1
> > +#define MAX96717_PFDDIV_VREG_0V875	2
> > +#define MAX96717_PFDDIV_VREG_0V94	3
> > +
> >  /* FRONTTOP */
> >  /* MAX96717 only have CSI port 'B' */
> >  #define MAX96717_FRONTOP0     CCI_REG8(0x308)
> > @@ -981,6 +990,14 @@ static int max96717_hw_init(struct max96717_priv *priv)
> >  	dev_dbg(dev, "Found %x (rev %lx)\n", (u8)dev_id,
> >  		(u8)val & MAX96717_DEV_REV_MASK);
> >  
> > +	/*
> > +	 * According to specs, in the Programming Notes section, there's a mandatory register
> > +	 * programming notice that advises to enable the 1.1V internal regulator to guarantee
> > proper
> > +	 * device operation. Let's do this before any other operations.
> > +	 */
> Latest MAX96717{,K,F} revision 6 seems not affected by this issue. Can you please make this write
> conditional to rev < 6 ? Register 0xe.

Ok, makes sense.

Thanks,
Laurentiu
> 
> > +	cci_write(priv->regmap, MAX96717_CMU_CMU2,
> > +		  MAX96717_PFDDIV_VREG_1V1 << MAX96717_PFDDIV_RSHORT_SHIFT, NULL);
> > +
> >  	ret = cci_read(priv->regmap, MAX96717_MIPI_RX_EXT11, &val, NULL);
> >  	if (ret)
> >  		return dev_err_probe(dev, ret,
> Regards,
> -- 
> Julien

