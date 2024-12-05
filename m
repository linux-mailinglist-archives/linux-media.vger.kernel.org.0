Return-Path: <linux-media+bounces-22665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 709D59E4F6D
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 09:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD3D61881C50
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 08:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619821CF7AF;
	Thu,  5 Dec 2024 08:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="Y7kCtf88"
X-Original-To: linux-media@vger.kernel.org
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazon11020090.outbound.protection.outlook.com [52.101.167.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7BA1B4F1E;
	Thu,  5 Dec 2024 08:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.167.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733386319; cv=fail; b=VYP9d1Os5BtKWItXlvo2MHnCZ3GVsNjlF4DTC9OS7s3uERCWz465wBFaHuOpjcM/XSuL1qKy3iGaQqVc2Kvq0wsh0IShu4KsTUu+OTzTKIye8oh66DKD5yvoMu/yF3dSGrlM3X/9u64t093F534a9PGmCyj44mNXXmJsT1Wwh3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733386319; c=relaxed/simple;
	bh=RciQULuyy7yy94rwKWuxbKtk8EpHKB0zunw/BkESbCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k/tbYhNH6P9u3c/Zqs/kMecBBfgTpiC3W88eOig/9W0tLDdew2MX1BEvkLeFhlzB3YtkMTEhdFDD+ImN9SywuQj6ffzQxygg7JfQdFn7H1rnPmf93ywoTeneUSEwcBl3/lgqfli6tr7oaoyn3jwMJ6kPelWFgXEIBwZrii8nVeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=Y7kCtf88; arc=fail smtp.client-ip=52.101.167.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txnL+3EjL6u5JE4pkWRARujSjVrbD/bASiIYam3dHj/rARWOsvk8qJsH2XvA1wrRxk639hg5FnI2MZ/sUpIV6hkpVsTNEW/PIGa7rJFTOAIvw23EC3ENLVEI17xHu615JkKlQFuS65x3yfS44qrtElikXeFWGL2fl3TzhQJto4YpZA24/d3GEojhLgHaPy3NiXAgG+spbyyZgDX87FcAhdFK91HsA6xFJfxDmXHzXVSqXAlmgUzNGorwxNeFoivT1GsTr5eZgZ+djTQH3V0NHID96X5qDrSnPPjMV1d6TY2IXJJ97O4o80QkzV31ssKc3wWR+SuqWyVp7cDN7UiedA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhq2KnK7xyy2flABiwXMM5RpHGTFstyHSUcRZuZ+0E0=;
 b=w0H2Gbr27nWn45wkt4xrumY6kwBG/vtuydm/hFuiEMXdQVoIbKKvM2Iq1P7hGB2xSsLq1WzvaJpXG1yw5YsuMd5Tn6SQQrt1JnRbdDQB+NpzwXS0ia76uWyDTeV9hEV6+Q+Cdebk6p7qhZL5pF8We0Q2vgu52/HOnuPjMP55+dxgPsnTl0317VvEnKqdT2kDhlOrjS/T6VaOrPBAv+bmFubidIhg82E4PJoDTxmyV9zBpQOksafGEgFHuC6JFACX050XIn24edKpk3RmDuiEtxZtEBLMJmySM3brUBYSXoOcyojd9QagA9+1WU8QH+fIDekIVZwjSwWCUe6qFETE+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhq2KnK7xyy2flABiwXMM5RpHGTFstyHSUcRZuZ+0E0=;
 b=Y7kCtf88/lJgSXP9GPrfoJru86Lra3661eTZcD17CHzFafLjSyrUuy3Y35Qpcq7iHluDT7pNGy3f426n1tnapF78609SWl5IfojtNo33K98lHFFexJbYFUbrj8cvfei9uBQn7y1Ly20V+CcNClnTJ43KnUKv2qk5e2KKHlr4L0ow/z7XZvlF/hnP+CbL2eD97UPoKNEjp4KTQ/6O73ULRHCZwcI8CjjXL5PzeiB7NhYy2UvzgxzdL67yQv7aqe8JQ83yD2xOKWCVN5EfCttSweNj/sembhZsKooTK4CJ7ZCnkqD52+AjfLQmx+ly7jo8LhlFYnU/PE8DT6Gm+sWxQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by PASP264MB5153.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:43c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 08:11:51 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f26:a361:4704:1a67]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f26:a361:4704:1a67%2]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 08:11:51 +0000
Date: Thu, 5 Dec 2024 08:11:48 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Michal Simek <michal.simek@amd.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Gaosheng Cui <cuigaosheng1@huawei.com>, Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] media: allegro-dvt: Moving the current driver to
 subdirectory
Message-ID: <46tabetrggwplddtssags6eyjcd6x7znaquerjg3z5a63ykle4@z5fqzikwv2o4>
References: <20241202102654.40472-1-yassine.ouaissa@allegrodvt.com>
 <Z02SLI05JhNDtXFn@pengutronix.de>
 <abshbp4blqxasxvf4ibumtfqcr7hytehmhzs2yag3nfpbcl47x@ndjg7al4iysk>
 <Z1CC_PQF8hCzmPoQ@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <Z1CC_PQF8hCzmPoQ@pengutronix.de>
X-ClientProxiedBy: MR2P264CA0063.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::27) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|PASP264MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b3ac719-64ed-46e6-c6c7-08dd150478d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1lNVS9iVkdwMzU2a0MyS0gwdWtnUkJYbS9iOWF2cXZHcHZlcGYyVjFWN3RM?=
 =?utf-8?B?R29URW91Y28wczRVVjNJM2ZGekxYZHZCQ3BXcHQybEtuWUF4cEJSeEV3emcz?=
 =?utf-8?B?UExQdnBvYWk1NXkva1JEbWxZYXNxL3FuQUZqNDI0RXdYbW9vdEJGTW9PeEVZ?=
 =?utf-8?B?WHNKeFRicVdFVERZb3hxdzI2NVlDQ3JHK0tOQjUra0YrWVo4UlZ3OEw1RDdp?=
 =?utf-8?B?SEFMTTZOQXZWVzFNUGk3ZE00MDlxKzdlQXh0ODJ2cnBHbXlranhmSkRzY3R5?=
 =?utf-8?B?Mk83bVRCdGRoTzFyc0o4cEdlZVF6dThiSmtyUXdqdzM2ZDZ3UlI0Z3hKWURo?=
 =?utf-8?B?Rnl6UnphZ0hJMnR0dkcvRVUvcEVPV1RTY3YzY3RnVkpnemJoTlNBQzRvUlIr?=
 =?utf-8?B?bTBpQzdvaG9iYlk1ZXRFemJFem9iT28vSnlQa1RzaTIzOGozRVFmZDVtZUtk?=
 =?utf-8?B?bzBOZk5nckxSYU8yU09FajNyNG0ya0dkQ0tZblRtQmhZbWNMVTA1TXVxTHpn?=
 =?utf-8?B?OS9QMTJjd1piTGF0MnNzemRZNExYRHJ6L21CNDFQYTRETjFKYTNNQnFGS20x?=
 =?utf-8?B?aEZyQkZ5LzMzSzVaMHBDVi9ZSWRKQzVwT3Jsb3hzUHFyZnFhdkFBYThvMlZt?=
 =?utf-8?B?Ti9yKzQ4ekV3L05PWERTWEhRQlJrekwwZzdMS0c2dDVmcjN0dElaUW51M2p1?=
 =?utf-8?B?dFFvTmx5NWRCR1VTd3ZrL0Y1bGh3Q3M1OGtjTnYrZXNaa1V1eGUvS3NESHRi?=
 =?utf-8?B?aGd4bXAzWGludlRpWjNVcWM4S3FWdTFGM1d1TGhOQ1lRNUdIU1pFTHFubkti?=
 =?utf-8?B?M0EzYlliVkllT1RORTBIZElaL3NVeHdvZG5CQ2ovYjFVSlBYdUhPSXF2Qk10?=
 =?utf-8?B?L1RmVXF3SC9jdkpEN2ZNZkc1VThZUjY2VjdWU1dDeHpUbVBlTzF5c2Rjek1n?=
 =?utf-8?B?aXorODBGS0t0Qk14Mm0wOUYyOW1rbkF3MVNOeXJiNmtSUEdKaDBBVmgyNVh3?=
 =?utf-8?B?Z28yL1F0bHZQcytYMXc4UEdaWjZjUTZiL3YrZzhLeEp0UFVPMExlOVBKN0xP?=
 =?utf-8?B?TGZIaC9Sb1ppVHRqWEF2U1ZFMytNZ0h6SzRNQzBDcThiWm5yZUN5R1pyVHJK?=
 =?utf-8?B?eng0VjZTbmNjRFQwSkJ4M09rT0RLS0VCN1M2LzZLMjNwRHRNKzBEdzVmTXNY?=
 =?utf-8?B?YWUyd3l0L3JaOUVqVzdiN1VhdmV4T3c4ejEwS1JpWUduYXJNMGdpY2FTRlB2?=
 =?utf-8?B?ZCtLaksyamtQSTRIWFozZDhzSjJPWlY0cVltWmZNQVM3SXdDZ3IvQ2pmZVBr?=
 =?utf-8?B?RDltT0NIdHUxSFJsQ0owTVRzeHZRaEsyLzNNY0FxYWRNNDB6WTczL2dhc04y?=
 =?utf-8?B?US9ubCtmSGhMeW45UE9JQ25FZTIrSW5Ea2VTZ2xIdzY0RFgwVFR0N2hjQ0dP?=
 =?utf-8?B?WHBpOThRUkZKdnl6Y2JLSjdmSDJVOHhreXlrakxUZDNhanlMRmVUMzFLUHZI?=
 =?utf-8?B?d0dRbFY2UloreW5WV0M1aFlFUnM5OVdVMmc5WjR0cVJKWkp5b0c0UFgwWm84?=
 =?utf-8?B?UllzYWZHK3ptamZZTG1zSHllZXBsT0dybDJ4YnpHdWtnTy9KTHlJZmRhSmlM?=
 =?utf-8?B?ak8vWCs1cGpJNUd2Zys1Ti85SVJZVEF1dzRlendhSVV0UjR2OEUraW5WUmNU?=
 =?utf-8?B?bHVmeHhmRS9ua2NBQkQ3MUd1TnBXanBaZmhnZzRVOCtKaCtWKzV1VFZRWThm?=
 =?utf-8?B?THI4aTRQOUdJTVA0MTdxK1F3bytDcFVsSW9FeGhRYlNNWWN0Q0xQYlM1dTFI?=
 =?utf-8?B?amsrQm5qM3g4YVRTbTJtWUhHdklNWVpYd05rTkI2Nld5M2VZZGlPbHhneUo1?=
 =?utf-8?B?R3VzQ0V1aWVteExUK2RYdHRFcDNLbWhPMEx2OFNNVzRnM0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amRNTFd5SnpaclV0SzNaSVdEc0cwd0FqRlBLcWJEUFZ1a2hCR1FpdWhtY1Jk?=
 =?utf-8?B?Y29aZU1oZnQ1QWxxN2hweFYreFBrUUFJbHk0RGJaazZQZUt2eVFiZit1aTVY?=
 =?utf-8?B?RzFmanJZQVpiWVdUaGUxTjIrNVRCY25ML1VpQ1Ztc1JVTFBTbGVONGxjM0xx?=
 =?utf-8?B?SWhsQUZsODc4L1VnMWtNWHAyc0ZkSE8wdGxYNVAzWVNBdjVjRlJTT09ZZ3VD?=
 =?utf-8?B?VmVOU1pUSngrZDNrajlGNUQzL3EzTjlWcWtNYmNxd085UDFaaXE2SXdMdzFa?=
 =?utf-8?B?NTI5aVkzekJLWkczaVZ2M0ZjaXZKNWVLekRQcDZKTHFtL2Joa0lpR0xUQ1lm?=
 =?utf-8?B?RWEwR01oSWMzN3hobTNmZDBnNjNNRm5mellGa1FTaTNTRXQ4eW9QUHlzNHdY?=
 =?utf-8?B?UitLMnZFQUsxWDNZMS93OE1KVUVjK1BVcUtxdGVaVVc2VWpqRGxuMGtwNllF?=
 =?utf-8?B?bncvV3IxTUZIaHR2Um5UK1oyZFQzdklPR1B2Sy9ZeUZjRi9UNUJEdHZzQWpT?=
 =?utf-8?B?TkF4N0psTnpicXlMLy9Fb0MzUEpUakVjdDdHNFJ4THc4dVpTWkZnTmRCNTgx?=
 =?utf-8?B?SlNzeU5aQllSQVU1c3orMlh3QklaczIxR1U2NDczekJBdDVpa08yZjhudUF1?=
 =?utf-8?B?ZTVZUzlOR0R6WGR3YnRQaW9USGg4YWFDQnVUN1BIL3d0S0c4cnltQlQ3Skh3?=
 =?utf-8?B?VVoxY1k0RTJqVHUrcGNaYXo4MnlJMFBJaDkvVFJ5bENSVDJRZzlEZUEyRVo3?=
 =?utf-8?B?MFhXbjJwQzVPbGhMMXVkRVJrY3pqSjNSeEVxY1lIb3pSOUVkeWFJcGExZDB4?=
 =?utf-8?B?dERBL0pXVFdleEJ0KzN0Tmc3dThEUm54VWk0bSszSGVMVERkYUNGZXN6dExa?=
 =?utf-8?B?MU9XTFpyYnRKWnZXQTJlR1VteG5Xd0ZNZ2JBTjlpT0lHRU9KSGIySWhKdmNh?=
 =?utf-8?B?LzVKSXdVSzZ4SHZhcHh3RWJINHdUNTRHMVVDcUt4b3RjamR3YStJWnJSVExp?=
 =?utf-8?B?WkQ1VEV0WGcwRWZaNnVLKy9LUWY5V3VDcVR1TVlVYTgwUnd2MEdmdmJBaTZM?=
 =?utf-8?B?ZEovR2Nib0VsdnJJZU8yclhvM2o0djBUNGJSZ2pKajNET3hOY29kNW82ZUNp?=
 =?utf-8?B?R21RU1pPS2dVN1p6blJXZHJsbFl5VEJKSDFTcWZMeHFyU3dwT1JkZmVpRi9n?=
 =?utf-8?B?cjFyL24zSmlCdjZKMnI1K09QUUhWM2U1eWd5RFZJeXJkVUc5RGxZZWM4b2tG?=
 =?utf-8?B?VEdBUzNobmJ4dlp6U3Nnc1RJZlg2aytka1llKzhHdGk1L3dMaEJncWg1cnJV?=
 =?utf-8?B?ZWYxeVh6RU56WWJHVjFYMGhaUmorak1ETytqNElKbkg4VmZYWWZrYXYxS3BC?=
 =?utf-8?B?K0h4OGlWWkd4a0QwNVFVMVd3UU4vaXZQa0tndE1ldmNKWVdpb1duTzlFcEx3?=
 =?utf-8?B?V0FJRS9Ia0tCR2VUdy9KT3JpcE02a3hxRm9TNmVwMUlFNmxRNE9YTzJqYnBP?=
 =?utf-8?B?QWVHelR6RmVrSGRVL0lJZ2VnYk1zZC9JQmp6NEdQejVOQ0MxRnBUL2tjZ0RR?=
 =?utf-8?B?L0IvdVA3VThyVWJxRjdReTV5dDMvcWxSK2NaT21HQzhFb2ZLOGRhTUl1Y3hE?=
 =?utf-8?B?eUhrak5qZjNBUE5oWndzVFNXaXBhdlBIVWlCZWhJekY1SUd2MS9Sc1llWDVO?=
 =?utf-8?B?OVcremFIRktoWXZwcGFRajkyZ0p6Y1FVb2dpSDlySDlvQ1B3SW1QTHhkU2tz?=
 =?utf-8?B?VnFHU0svVkVNWlVxVHVVRHErejMyWDN6TStnT1BFR3l5OUdiSHp1QUJtcldS?=
 =?utf-8?B?d25FNkZsZmtNM01uZW1QNm1yc1U5WHRMYldaL0RaSnBSTDV1V0VzWUp0MVE0?=
 =?utf-8?B?ZGVJc0RlMmk0K0xqeVFzZG15cy9Ud0xmT1d0UlhrVThaUWdTbFF6SUlxcFp3?=
 =?utf-8?B?QVhKb1BwZXFCYkFLc2tkWm9adDBSbkl2czZ5SThGbzJaTVFoT295QSs5bEJS?=
 =?utf-8?B?V213dGErbjBsMHcwUzcrNmpuU09uakdwK0graEV5KzFDOWE1bnQ5dDdCV1g4?=
 =?utf-8?B?VXZLUE5sd1hXdW9aSlFxYjFlak14aE9XUDhZWGVZUGZkQ2V4LzFYbDFjcnVQ?=
 =?utf-8?B?UDlGbzA2RzZneVhLOERzS2lSbmNsYlM2Q25JVmxCazhUK3RRT0k1SzN3YUpH?=
 =?utf-8?B?NGc9PQ==?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3ac719-64ed-46e6-c6c7-08dd150478d2
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 08:11:51.0543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: afESyGd8ZnPZLqQGYWkXlKaVQhlusc8u8YR2G6uqB2d9VZtcLKK91mnJn7RCI5jwnH5S6o3conroPjihX1pgDLr7jOvEQaSriXn46cYyR00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB5153

Hi Michael, 

On 04.12.2024 17:27, Michael Tretter wrote:
>Hi Yassine,
>
>On Wed, 04 Dec 2024 14:44:31 +0000, Yassine Ouaissa wrote:
>> On 02.12.2024 11:55, Michael Tretter wrote:
>> > On Mon, 02 Dec 2024 11:26:38 +0100, Yassine Ouaissa wrote:
>> > What kind of conflicts do you encounter or expect? It's kind of
>> > surprising that your driver would conflict with anything in the existing
>> > driver.
>>
>> The current "NOT allegro" driver support only the ZynqMP (ex : ZCU106/ZCU104 ).
>> And the upcoming driver, has support for many platforms.
>
>What are the supported platforms of the new driver? Does your driver
>support ZynqMP, too?
>
The upcoming driver is not using the ZynqMP, it can be used by other
clients including Xilinx. 
>If there are enough similarities between the encoders, I'd happily
>replace parts of the current driver with functionality of the upcoming
>driver or reuse the infrastructure of the new driver.
>

For now, we do have only the decoder (stateful). the encoder is "in
progress". 
We prefer to have a separate driver core for each platform. 
>>
>> > I'd like to see how you plan to integrate your driver, what it looks
>> > like and what conflicts with the existing driver actually occur. Without
>> > that information I don't see the point in moving the driver to a
>> > sub-directory.
>>
>> The upcoming driver is not using the parsing, conversion inside of the
>> driver. Actually the new Gen of ALLEGRO IP does that.
>
>Sorry, I don't understand what you mean by parsing and conversion. Do
>you mean the mailbox messages or the NAL units?
>
>Can you point me to some repository with your upcoming driver? I'd
>really like to know what's coming up to have an informed discussion how
>to structure the directory.
>
>Michael
>

Yassine
>> > >
>> > > Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>> > > ---
>> > >  MAINTAINERS                                               | 2 +-
>> > >  drivers/media/platform/allegro-dvt/Kconfig                | 4 ++--
>> > >  drivers/media/platform/allegro-dvt/Makefile               | 8 ++------
>> > >  drivers/media/platform/allegro-dvt/zynqmp/Makefile        | 6 ++++++
>> > >  .../media/platform/allegro-dvt/{ => zynqmp}/nal-h264.c    | 0
>> > >  .../media/platform/allegro-dvt/{ => zynqmp}/nal-h264.h    | 0
>> > >  .../media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.c    | 0
>> > >  .../media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.h    | 0
>> > >  .../media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.c    | 0
>> > >  .../media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.h    | 0
>> > >  .../{allegro-core.c => zynqmp/zynqmp-allegro-core.c}      | 2 +-
>> > >  .../{allegro-mail.c => zynqmp/zynqmp-allegro-mail.c}      | 2 +-
>> > >  .../{allegro-mail.h => zynqmp/zynqmp-allegro-mail.h}      | 0
>> > >  13 files changed, 13 insertions(+), 11 deletions(-)
>> > >  create mode 100644 drivers/media/platform/allegro-dvt/zynqmp/Makefile
>> > >  rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-h264.c (100%)
>> > >  rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-h264.h (100%)
>> > >  rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.c (100%)
>> > >  rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.h (100%)
>> > >  rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.c (100%)
>> > >  rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.h (100%)
>> > >  rename drivers/media/platform/allegro-dvt/{allegro-core.c => zynqmp/zynqmp-allegro-core.c} (99%)
>> > >  rename drivers/media/platform/allegro-dvt/{allegro-mail.c => zynqmp/zynqmp-allegro-mail.c} (99%)
>> > >  rename drivers/media/platform/allegro-dvt/{allegro-mail.h => zynqmp/zynqmp-allegro-mail.h} (100%)
>> > >
>> > > diff --git a/MAINTAINERS b/MAINTAINERS
>> > > index 7292e4a1ddb8..d79efe6f8992 100644
>> > > --- a/MAINTAINERS
>> > > +++ b/MAINTAINERS
>> > > @@ -795,7 +795,7 @@ R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>> > >  L:	linux-media@vger.kernel.org
>> > >  S:	Maintained
>> > >  F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
>> > > -F:	drivers/media/platform/allegro-dvt/
>> > > +F:	drivers/media/platform/allegro-dvt/zynqmp
>> > >
>> > >  ALLIED VISION ALVIUM CAMERA DRIVER
>> > >  M:	Tommaso Merciai <tomm.merciai@gmail.com>
>> > > diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drivers/media/platform/allegro-dvt/Kconfig
>> > > index 2182e1277568..9bc7e99788b8 100644
>> > > --- a/drivers/media/platform/allegro-dvt/Kconfig
>> > > +++ b/drivers/media/platform/allegro-dvt/Kconfig
>> > > @@ -2,8 +2,8 @@
>> > >
>> > >  comment "Allegro DVT media platform drivers"
>> > >
>> > > -config VIDEO_ALLEGRO_DVT
>> > > -	tristate "Allegro DVT Video IP Core"
>> > > +config VIDEO_ZYNQMP_ALLEGRO_DVT
>> > > +	tristate "Allegro DVT Video IP Core for ZynqMP"
>> > >  	depends on V4L_MEM2MEM_DRIVERS
>> > >  	depends on VIDEO_DEV
>> > >  	depends on ARCH_ZYNQMP || COMPILE_TEST
>> > > diff --git a/drivers/media/platform/allegro-dvt/Makefile b/drivers/media/platform/allegro-dvt/Makefile
>> > > index 66108a303774..04727c5f7ef4 100644
>> > > --- a/drivers/media/platform/allegro-dvt/Makefile
>> > > +++ b/drivers/media/platform/allegro-dvt/Makefile
>> > > @@ -1,6 +1,2 @@
>> > > -# SPDX-License-Identifier: GPL-2.0
>> > > -
>> > > -allegro-objs := allegro-core.o allegro-mail.o
>> > > -allegro-objs += nal-rbsp.o nal-h264.o nal-hevc.o
>> > > -
>> > > -obj-$(CONFIG_VIDEO_ALLEGRO_DVT) += allegro.o
>> > > +# SPDX-License-Identifier: GPL-2.0-only
>> > > +obj-y += zynqmp/
>> > > diff --git a/drivers/media/platform/allegro-dvt/zynqmp/Makefile b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
>> > > new file mode 100644
>> > > index 000000000000..a8ddb9cf93a8
>> > > --- /dev/null
>> > > +++ b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
>> > > @@ -0,0 +1,6 @@
>> > > +# SPDX-License-Identifier: GPL-2.0
>> > > +
>> > > +zynqmp-allegro-objs := zynqmp-allegro-core.o zynqmp-allegro-mail.o
>> > > +zynqmp-allegro-objs += nal-rbsp.o nal-h264.o nal-hevc.o
>> > > +
>> > > +obj-$(CONFIG_VIDEO_ZYNQMP_ALLEGRO_DVT) += zynqmp-allegro.o
>> > > diff --git a/drivers/media/platform/allegro-dvt/nal-h264.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
>> > > similarity index 100%
>> > > rename from drivers/media/platform/allegro-dvt/nal-h264.c
>> > > rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
>> > > diff --git a/drivers/media/platform/allegro-dvt/nal-h264.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
>> > > similarity index 100%
>> > > rename from drivers/media/platform/allegro-dvt/nal-h264.h
>> > > rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
>> > > diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
>> > > similarity index 100%
>> > > rename from drivers/media/platform/allegro-dvt/nal-hevc.c
>> > > rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
>> > > diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
>> > > similarity index 100%
>> > > rename from drivers/media/platform/allegro-dvt/nal-hevc.h
>> > > rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
>> > > diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
>> > > similarity index 100%
>> > > rename from drivers/media/platform/allegro-dvt/nal-rbsp.c
>> > > rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
>> > > diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h
>> > > similarity index 100%
>> > > rename from drivers/media/platform/allegro-dvt/nal-rbsp.h
>> > > rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h
>> > > diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-core.c
>> > > similarity index 99%
>> > > rename from drivers/media/platform/allegro-dvt/allegro-core.c
>> > > rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-core.c
>> > > index e491399afcc9..8895d7755987 100644
>> > > --- a/drivers/media/platform/allegro-dvt/allegro-core.c
>> > > +++ b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-core.c
>> > > @@ -31,7 +31,7 @@
>> > >  #include <media/videobuf2-dma-contig.h>
>> > >  #include <media/videobuf2-v4l2.h>
>> > >
>> > > -#include "allegro-mail.h"
>> > > +#include "zynqmp-allegro-mail.h"
>> > >  #include "nal-h264.h"
>> > >  #include "nal-hevc.h"
>> > >
>> > > diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.c b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.c
>> > > similarity index 99%
>> > > rename from drivers/media/platform/allegro-dvt/allegro-mail.c
>> > > rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.c
>> > > index aadc947a77ae..88a98f9e5d00 100644
>> > > --- a/drivers/media/platform/allegro-dvt/allegro-mail.c
>> > > +++ b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.c
>> > > @@ -12,7 +12,7 @@
>> > >  #include <linux/string.h>
>> > >  #include <linux/videodev2.h>
>> > >
>> > > -#include "allegro-mail.h"
>> > > +#include "zynqmp-allegro-mail.h"
>> > >
>> > >  const char *msg_type_name(enum mcu_msg_type type)
>> > >  {
>> > > diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.h b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.h
>> > > similarity index 100%
>> > > rename from drivers/media/platform/allegro-dvt/allegro-mail.h
>> > > rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.h
>> > > --
>> > > 2.30.2
>> > >
>> > >

