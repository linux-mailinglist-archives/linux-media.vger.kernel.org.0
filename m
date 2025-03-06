Return-Path: <linux-media+bounces-27689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB46A5452E
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 09:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E6177A7E1F
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 08:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD6C207DE7;
	Thu,  6 Mar 2025 08:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QMvKCuOE"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2066.outbound.protection.outlook.com [40.107.104.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861BC207A04;
	Thu,  6 Mar 2025 08:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741250535; cv=fail; b=tQMJyYn3HtlmDGtGqFqOqqOa7pz4P08wmdCOUlQjs7d7LP48POwv1yXASQY/vpxzdT9T8DWRqKp6mT1MLy1y9+PSECxJpzQR0vALjJnm6OxcHWE5V+tl8TLA8Z3CsJwxHeR/F0/rQiA6c4ok//bit/coR0w+sukWWjQf42D7zWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741250535; c=relaxed/simple;
	bh=++KX7G/EsBmh4NNh/x+QSf3vhSePKppaA1hRhlW/HJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SydW4w5BS+txX0LKovJ2dgdhh+sEJ1yUsR1ngesMVVqf7OTQXphc3tOhh9rVUNbiXlb1nx6CnWOpQ9vy4mqwZK2qJZgVZ4cEL3X/aUTAvojRWoM2EPU+6yDCp6c6V9i+VQt62xI20IAiqVvmpWIIUyCZlAUQmnrkA4DBNBWnncw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QMvKCuOE reason="signature verification failed"; arc=fail smtp.client-ip=40.107.104.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQKohYQ9NJt0+FSURRsa8TdRaJMaPJVg1fD/qdkUG3gKhzThJquwPf+et9lZs8L4qZjh3xYFPlEEtB5hxuHR69UaeSR17NGiuMHgn0w+T5G9n1tLVKqEDN0V3YRES+jJui3lNgbc8J2KXD69C0K3RA+WPKL18O28dY3blCJXHVtC+AEQbA/GCJUXMeNCKAGfLshRVo/pfPucrwxh2kYeMjbeyfAetcnunRbovZChnSyCj6hjG7iNa6QaGDcsk2ZL5Zvf5iJisx4kcK+Vzn5MQHNURJXXW2VP0Y2pRFf4/AlF+0IcLWE7L0rvcu1LfepdaDjJp7llmtn9ar50XBwWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djHcqphDkxIppl+QiAfFXHlgVuPeKKUqjFcJzkf8agU=;
 b=ANwxwxvxge2rigf8i3EtlR3LJccrFUPMvDpkWxDj97r3zrpWz20iowaS1AGIlQ9C5ponYqIKN3bSzzsEdhm8g/GcgshkBmoOU75miN3w6vNUfNGqDThyOCphtwxxazBuhTBet7CLbu/kdvhZp/dRAffqTo2MIopLrG1Dlk+49e3kAVy8Zy05qdiEVazY0nCP19NeC+kOqf4/WRV4LFkmpbcdDhcrLw3lHAt2c/XO6TlbDUud9His3d10HAXrUbayZ1BtDQVOH7yLCF2kPQuOSNdk3j4ue3bob5kNE/mNiy5qAShI9Kfz03EtyQfFTAXI6Q6ukVcciDUZCg/W44xwEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djHcqphDkxIppl+QiAfFXHlgVuPeKKUqjFcJzkf8agU=;
 b=QMvKCuOEyxtiSSHBlUIkMNCtr73sfx8k34FIIQX2S0OgEyc/yOmNQkIVJeq+pCEuojEkhZLPVW8DK+V12OtoLodL/qnabEELfK/jAQPXJMQZUGObDYX/cyLVr6ubRpnL6iFHpIx2HM9DHI4e+9d5EAope120wTMxOg1yuTj6CebJktsaggcmBJ0PdiolyOrrNMBvaGGjl1Pd8yivJEGgfnVpqdzTCeY9XsYv4RDhKQtkyDsUna2p4mjaZYSUwDPk6R6h5LCbuyDe9DLN6vUw6dz8fhxuAkdV+NSzzzTsxrpepI3/q7MM7Oo7PvzwdR39t/rr/pDDc9Lfzc1OjFPrww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by VE1PR04MB7472.eurprd04.prod.outlook.com (2603:10a6:800:1b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 08:42:10 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 08:42:10 +0000
Date: Thu, 6 Mar 2025 10:42:06 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 5/5] media/i2c: max96717: allow user to override
 operation mode from DT
Message-ID: <twfyc6qllxcssrw7ydfinby56azxadw6zjcinzukncoxnunixu@swknfqwn2qez>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
 <20250207112958.2571600-6-laurentiu.palcu@oss.nxp.com>
 <3c46bbb64e6e9c7b836c3ca82d678e550d1b2ddf.camel@collabora.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c46bbb64e6e9c7b836c3ca82d678e550d1b2ddf.camel@collabora.com>
X-ClientProxiedBy: WA1P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::24) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|VE1PR04MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 025a5747-009a-4191-ceb5-08dd5c8ac8d2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?2tF2JAGYbWsxQWf6F4dz3sB7Z7KihU78LfY3qqK91VUexa0cRnIBOpxG6Q?=
 =?iso-8859-1?Q?RLJ89iJVPrM4bMYZwCt+13aCP53gDMNJM6Vnon7632XwOJwOFIWlRw1sl3?=
 =?iso-8859-1?Q?2VUBFvMDtcmvmjQShqPcWHshT5tuvXYLuohnqMFoTvHCtQWxtaurXa6NPp?=
 =?iso-8859-1?Q?HooGk0Wg59LGiVBNdKQRjiZxcfnio8KQCE6RrPIwq3K+6FuMFwzFreMCpQ?=
 =?iso-8859-1?Q?KfO+ly4fwFixJxtct/BNPGfsAlj+zwvv09/0adTtMKFdiEwKCsQtoSlDG9?=
 =?iso-8859-1?Q?+HI6acluwtt70X6ean2fkMNB7Hk71WkEW1c7u6PUAKd8t56a4BJgnWzHDS?=
 =?iso-8859-1?Q?6N1Xxi6kaJwwzfRHCxIQNUFBscEFL5LfPWJwfiJdRhseK4d5v3CEneAibG?=
 =?iso-8859-1?Q?vGsGvcw2U0f7qg41yh8i68lvhO3PAe7EkKn9rcSchBAObdEVTwBgXNv5Sm?=
 =?iso-8859-1?Q?HdIkNxym0syd7igheUNiLwsmY52onE1a541BUkHcic+IBnuzAIdhge6Pk+?=
 =?iso-8859-1?Q?bLEWJdUp/HNEBnodPSuUFhuNfNLMvoXUjdLsjodfb/tMhZ2yr/dHmjAR3t?=
 =?iso-8859-1?Q?qZ/E4RevRm2aGzEmOai5FArO9Q00Y6yNtiSkpJjIXkIbT5+ln7yY04L3CY?=
 =?iso-8859-1?Q?2Es7ube1PFRgRzXlVgWKOIVVkhOkxWeInARfFJjAhM40Gy7wSI6m0egvsI?=
 =?iso-8859-1?Q?3DViWTIuFJsbpmqA3YKgGALcxk6+yg4lkZqpT47/q1X81ooR5lbX0eyGYG?=
 =?iso-8859-1?Q?pYUTQZlFYzpzKq/r3/sXIcO4EzLb8GZbGSMREZhxsxb0AouwzCsf3H48Oz?=
 =?iso-8859-1?Q?uI1fyTuE3V7DJMv3g0UCfAog0WeqTP00OKf0CEGKbvbKhmLoCOSbLldxQr?=
 =?iso-8859-1?Q?CdEqOYIjMgbVSkcCTPd6sG+p8/MhFWrU0dtTl/4Ak8GKwSBYxGSTlOZmu3?=
 =?iso-8859-1?Q?m4SzkVwtSCjVjWDuQGha5K36LYu6qF3B3j8i7vvD6JTGVcEjNtqXBoUbvw?=
 =?iso-8859-1?Q?XB+SIElRf5hGIWIXnhBLOG6MpgIFGpc5IDAu52h7pp3GPnEohLp4sWMssh?=
 =?iso-8859-1?Q?UIGngp+6C4Y3AeomjYvAkgSKWtx2DszENj+KUCznttaYgUzD6YboN9L9jg?=
 =?iso-8859-1?Q?5TQN58huVHqKN0w5bhJeV/B+LdQGG2dHgCuEaNjlkCgVSS9Qb3sGeEebv4?=
 =?iso-8859-1?Q?CROGcNIud/2NoQmn492csm6RROePtrMEFNJdVooDS/DDNyVLQ/ka4BVqxl?=
 =?iso-8859-1?Q?YZqhx87lfJ1CS5CdJ13BJRsJsa9ZolwxxzelljVI3riTw6J8RvHctjNrVc?=
 =?iso-8859-1?Q?IXT5sxP+CPAlK+ZRXTw42x6BHIWG/Z9mSo96iuEdf2Rfe8EGI0+jdIeAGg?=
 =?iso-8859-1?Q?6Tyhd61bgAjBXckQz9e/GXcgS7UhudK2ZO6mwNTdkmGJFud2ou9Ur2w4ej?=
 =?iso-8859-1?Q?BXhVJd/fv5tfIwdj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?zb10kKLOXeY7MCdcoOGzFJ3mpi5vPhdN4nhpDEPac/L5332ZZ2+T73LOIy?=
 =?iso-8859-1?Q?QcVYug/8ziJ6f7XL3ct5CW94RKnQcIiymAM7tLlF//IzuemP+0dN+tNFan?=
 =?iso-8859-1?Q?G5hs/u7Vt7ny2VB4fEcMGUkriGZvSL+WEKfn6RuWnDhSz4ld1aYNojAigQ?=
 =?iso-8859-1?Q?p8TjzqNF96LSz1w7EFj+0hpen62yjMFzstp7l8yVn27BKUkiK8XAQZG3K0?=
 =?iso-8859-1?Q?7FeA4tlIGwMmXoOK+YAwyMv5UkSq2lSV6Ia1mx4+O0a8uieEUCDnnwo47h?=
 =?iso-8859-1?Q?Lqx70cfSWCy6AVt3O2s/DkHvBvKi+U8b737DTts0JJhw8KuFA4GK8K1lJD?=
 =?iso-8859-1?Q?IayoSMqwDaY2fj8hQHIHLhfj3ByM7weJzNDcgagHCE38uito3A5DaSEG62?=
 =?iso-8859-1?Q?UPc7DRHtc4Le0FnpHR0EnbYOHKXN+/rANS/JqvGmNypJhg/ZScNDHd/CUR?=
 =?iso-8859-1?Q?0ZjCj/O8PMHyBHqs1BJlQkb9Z+0rFNU2EW5gexFH+fkrEaXRc7KCUMjerz?=
 =?iso-8859-1?Q?3npQW2tOuRA4DVsI854YpSCToXGilchCECOfc3waCjxTiVijlLwf+mfx7c?=
 =?iso-8859-1?Q?SwZvfLb+A3WZBWdPbBkrkwEjjQ5SY35gPXnVLXRPTf5TYiwSJTSTFOSr04?=
 =?iso-8859-1?Q?7P04dHWiFaVv4PUrnjaGcMx/PoERgZSizXT0f0UPYfq9F9b9Xw5FFe+Bfs?=
 =?iso-8859-1?Q?161TSwKebiwQqRvDFNBt4xJzB6WHZEJwbCw/E+o+O1xxAeP5av5YXcNwAY?=
 =?iso-8859-1?Q?02CUB7tGdgiSWOlFGhh8fJIMmQKhnHS6vZcaPfeEY74oVaL7d29KlXHSD+?=
 =?iso-8859-1?Q?zMp7PkyOsqw68ebQpaOMW6zWAMbw2mn6Eme8YyDE5Hx91/Dl8MIEZYvWOU?=
 =?iso-8859-1?Q?B4OfKMrh/YcbG8aSh4xJ/nybNd7lO2DWZ8KNx9zGi291fgOzeqjwwT5zb5?=
 =?iso-8859-1?Q?zeqXtn410cZ36rcBqrs9ouoxUfQW3zCBKgOMnI5TQG4dC7dVnSCMrds1a8?=
 =?iso-8859-1?Q?fRgSErIckun+nTZXU3psmsX3tFQprf0kwySZJTE8TCfD4e4/lK91rnyLWC?=
 =?iso-8859-1?Q?5TLmjQ+/V18jxhC4BsZXfWCVsp8vfB4RLK4xj3bMQRAgva4gsq3O+nZYgu?=
 =?iso-8859-1?Q?qb+/bSz1Mrjlv/dgJ9jxS9I5DKyLb7JKqd0Z88gG+UD64eDN6TXW+KLUay?=
 =?iso-8859-1?Q?MZnaJnd3qwUkfzXL4OkFFKSD0i3zvJ7a+0MFx7/rYBGfyA5Q6RQte/81FB?=
 =?iso-8859-1?Q?TjC06lfpxw1KlcuQ+e8EZwZbN/XJQtELE5m9Ly+p7fsZuKanQUSXDU813D?=
 =?iso-8859-1?Q?xVqIXOW953CjKAB1ant50mP0bVUqMr8sJOV9zGW6zfmElOkxqAeFOZjPqG?=
 =?iso-8859-1?Q?3DWs1WvCt/cA05f+7F7nv1CFVs289qN8nMTdYO7pVvWjuRPRrB2fXz4G/c?=
 =?iso-8859-1?Q?vTx/DWX+CxBCSkIk1FXNmTyH73QJ4pnxw++mJSGPBHTpJBqKQUT45mzMuW?=
 =?iso-8859-1?Q?aP+sggb+/2stYl+FrtF67DGBI1ynApKRSJZUyvpmRrr5x0TBYZIy8w0psI?=
 =?iso-8859-1?Q?IqiNLZ+EEvnFRkYV7oClEt19iefHgsmYpUmtGbRJJTtFhHkpJFD0uKHzmj?=
 =?iso-8859-1?Q?JgabohsW95PvsbJgGECM7iySLTfbb4hyxyYTPxESvkfHe1BmMxejv8TA?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 025a5747-009a-4191-ceb5-08dd5c8ac8d2
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:42:10.3614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idLa/4x7TGxJasBzuaP3TjREEHfw5jXIVLzR9XVGEX73O6u3IudGdZVwkYzfgeWoS2thkVxftPeq3swv50ug7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7472

Hi Julien,

On Tue, Feb 18, 2025 at 04:21:36PM +0100, Julien Massot wrote:
> Hi Laurentiu,
> 
> On Fri, 2025-02-07 at 13:29 +0200, Laurentiu Palcu wrote:
> > There are situations when the CFG pins set the chip up for a certain
> > mode of operation (ie: pixel mode or tunneling mode), because the HW
> > designers decided this way, and we, the users, want to change that. For
> > that, add an optional DT property that would allow toggling the
> > operation mode from the configured one to the other one.
> > 
> > The driver still only supports tunneling mode, that didn't change.
> > 
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > ---
> >  drivers/media/i2c/max96717.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
> > index 47a3be195a971..a591ca5d5f44f 100644
> > --- a/drivers/media/i2c/max96717.c
> > +++ b/drivers/media/i2c/max96717.c
> 
> 
> enum gmsl2_mode {
>   GMSL2_PIXEL_MODE,
>   GMSL2_MODE_TUNNEL,
> };
> 
> > @@ -161,6 +161,7 @@ struct max96717_priv {
> >  	struct clk_hw                     clk_hw;
> >  	struct gpio_chip                  gpio_chip;
> >  	enum max96717_vpg_mode            pattern;
> > +	bool				  mode_override;
> 	enum gmsl2_mode                   mode;
> I would prefer to set the mode in an explicit way instead of toggling
> the bit in the register.
> 
> >  	struct max96717_fsync_desc	  fsync;
> >  };
> >  
> > @@ -1066,6 +1067,14 @@ static int max96717_hw_init(struct max96717_priv *priv)
> >  		return dev_err_probe(dev, ret,
> >  				     "Fail to read mipi rx extension");
> >  
> > +	if (priv->mode_override) {
>         if (priv->mode_override && priv->mode == GMSL2_MODE_TUNNEL) {
> > +		
> > +
> > +		ret = cci_write(priv->regmap, MAX96717_MIPI_RX_EXT11, val, NULL);
> 		ret = cci_update_bits(priv->regmap, MAX96717_MIPI_RX_EXT11, MAX96717_TUN_MODE,
> 					MAX96717_TUN_MODE, NULL);
> > +		if (ret)
> > +			return dev_err_probe(dev, ret, "Unable to update operation mode\n");
> > +	}
> > +
> In case we are overwriting the mode to tunnel mode then no need to read the EXT11 register.
> 
> >  	if (!(val & MAX96717_TUN_MODE))
> >  		return dev_err_probe(dev, -EOPNOTSUPP,
> >  				     "Only supporting tunnel mode");
> 
> In fact the driver can works in pixel mode, but since we don't set the "stream id" the
> deserializer have to configured with the right one :)
> 
> > @@ -1101,6 +1110,9 @@ static int max96717_parse_dt(struct max96717_priv *priv)
> >  
> >  	priv->mipi_csi2 = vep.bus.mipi_csi2;
> >  
> > +	if (fwnode_property_present(dev_fwnode(dev), "maxim,cfg-mode-override"))
> > +		priv->mode_override = true;
> > +
> 	source_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
> 							MAX96717_PAD_SOURCE, 0, 0);
> 	if (fwnode_property_present(source_fwnode, "maxim,tunnel-mode")) {
> 		priv->mode_override = true;
> 		priv->mode = GMSL2_MODE_TUNNEL;
> 	}

So, I don't think the boolean 'maxim,tunnel-mode' would work well when
the pin configuration is 'tunnel' and the user wants to switch to
'pixel'. Maybe, replace the boolean 'maxim,cfg-mode-override' property
with an optional enum property 'maxim,cfg-mode'? Does that sound better?

Thanks,
Laurentiu

> So we can parse the tunnel property from the GMSL port.
> 
> >  	priv->fsync.pin = -1;
> >  	count = fwnode_property_present(dev_fwnode(dev), "maxim,fsync-config");
> >  	if (count > 0) {
> 
> Best Regards,
> 
> -- 
> Julien

