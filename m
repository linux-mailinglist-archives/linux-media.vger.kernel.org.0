Return-Path: <linux-media+bounces-27684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2995FA5446F
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 09:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47EDA18963D2
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 08:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEC41FDA95;
	Thu,  6 Mar 2025 08:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XPFlizap"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012039.outbound.protection.outlook.com [52.101.71.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C48E1FC7FF;
	Thu,  6 Mar 2025 08:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741248901; cv=fail; b=muuLu5QBC6kypbkeMZZZYec87kpEaADoKRKPq22tltaITX7kXfCY6+ZbbSx42gWxCWrFDSvn4VBqPgLXFWD5NsIlXsPsb5PBLC/vPud/ncy7OP9/eYRvMUIOFCTfLoAcE/+GDhm3bYy8tlLPUo3t0C62cvf1zjW4fXb8qJn11+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741248901; c=relaxed/simple;
	bh=Ki6rApT97dsLgXgZoMGAgK0r3FY1vzR5VOSHKJNfK1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RDvKZM38VB5eIhAEo8ARf0SR7AyaHMs5wxN+svjZDPlHVcR21KH62/i0Hl06FjfuopFA0utCeIWI7PXLyde3/KEbvyMdmFVXwXH9DoiNQA294jdCDeGHexnHzjMqvnF4SQLWQ23R3OtHHnYJ8MP9/3+T8+imBgGmBr877/+9aYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XPFlizap reason="signature verification failed"; arc=fail smtp.client-ip=52.101.71.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrQPMwyCvrtrr0RJjWLdYVzc0wx2Q9JmIktZZieHYLsGeC9MZ94MtfjzMhCEY4Ul4fD+R+U2Ia8/Bo3zwrzKPAltax89mSLoL9s6mAR93L/6GEiBaPpN66hP01HUm8uHMuirhUszorneESR1jeIy1qm6Gs9ufYDa5S6gryimeozKVbaxrMwN4gPKgoBWBkSrwjCn5ujiE/kZmbqSlCNFuyQGax5r6FDYaM4zAXKSpaUIoGMNYPC/SsM/ZYW7l3wVyNuk1JB4rqBJXLH49g458rEsBH7euhHO2hveDEkLETLKXk49WDyUhjo6NVQPQEXbEhm1vvYEp/OXPYqQfUzVzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvRZtRwmOjdMgAgMglw+9ots5sw7Uwyxu9QPdesDkrU=;
 b=nLT83ft0TYpKcqirClJsLdq5mHvxROheGVRx4JV2m+Ep9uL3LeltsrgfVYeAyM6Rfbrqu7n5OEWHFm6NyUP7GEAXq6CThC8n/1K2XKsX4u+zi9BnxmTTJYrWHctaNjhr2lrlHYwSc7vVYS702/dIq/VVEtUVRqcG7+N1oIw58zhR9ss8qFgLhgc2jQC4XEZKc5npmzrpTCG3qObmNyIilqkpDgMT6GSjqVsyEyCXfBHfiJiYVx3WKxbSJZkxkj0pj6xxAhyFm6SIl9JDQ/YWzdifFer8yyaE2UeTiaYOhkrvtTxQVRp9AQ5fuKjVGKali+frHJRRqAV61DKE80Cr2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvRZtRwmOjdMgAgMglw+9ots5sw7Uwyxu9QPdesDkrU=;
 b=XPFlizappvKUyLfhtqIpnPHr0rt52TX2Ff0kbuQzudnAZrOCV2YBtIsdWyWkbAyE2PAV0gaGMIV/SBL8NN42nS7xVM7MOW6fb4zv6NFwAHJxAJc74VtK53aMQqOoM5tJN3WuoFZtx0+svCi26lHlRv4iBhD8HVWtPiM3RmT6ZVF/XHl1KTJGwSY6JX/s+5D7I0twWOUg//yz6yNeg8tEPdNJEuPf1DPWuOjGYwmQKda1UBqW3tTCdDz8vxTp85e+Kh195g5ISXxGBAGbjm52cQa1zxFTJKJz0+mrqnmJYUkV4mJTyVMFfv2kVLkTSAx/2oJisx1nNW+rxQNHFHFMAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 08:14:55 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 08:14:54 +0000
Date: Thu, 6 Mar 2025 10:14:51 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/5] media/i2c: max96717: implement the .get_frame_desc()
 operation
Message-ID: <iowx7ej5qfkwhoqvdocpuvjzytihukephb7lpuazll754e45kf@yo22sxya5n36>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
 <20250207112958.2571600-3-laurentiu.palcu@oss.nxp.com>
 <f5940c764af6587b97d39fdb9b64ec9bfe09b4e8.camel@collabora.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5940c764af6587b97d39fdb9b64ec9bfe09b4e8.camel@collabora.com>
X-ClientProxiedBy: AM0PR07CA0031.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::44) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AS8PR04MB8676:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f096ac0-5148-4dec-89ca-08dd5c86fa02
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?Pt1CzQinm+N0fXY2ll6jyFiMMA0JgwJU5UlEQKevjZ9bXOfaqHo9YBCSJ/?=
 =?iso-8859-1?Q?CCeaQQUdbAgsHSqpdL8UrmuhmiZNuzZedPabFHTJWC8dJ2u6RuGGky7xMn?=
 =?iso-8859-1?Q?sqKSe1loRvuocLthWfZkX1RczCdaAUHvEJiNzjDMfQ1cezJDixdutriNSE?=
 =?iso-8859-1?Q?IMcFeKqKn9Kdk0c9vWhTSqNN3Hnfr4RIn/gSa5EyOO3s/DyIoeLDQeuS3w?=
 =?iso-8859-1?Q?bgtUr5oWaym0XpDBq2jdCPvjrsAZQRgFl0Hy3g6J7eGz5X73SiwAn+Wpv9?=
 =?iso-8859-1?Q?D8s7tiMqiGYmaPI2nUAp+rClfqQZBKuF8pzdXyAWiuO1eAY17krORobN8F?=
 =?iso-8859-1?Q?YPOSRLYL67sAUlZXZlLERzYa2Zt+aCgUpJLpyGExgQYuOHLzfPdsXghqL0?=
 =?iso-8859-1?Q?BOdbz9AXfznQwsX0SByvlIbNu7MSvpxvSW8HScnyCzZ2SEcDqvX0NwtDe2?=
 =?iso-8859-1?Q?Re5e412FIug62Bli8azjM+zMO859ec5Ymiup0QCRF8b2WGn2LzQ1dWDKTY?=
 =?iso-8859-1?Q?yOLMBh/cqWVWw9W3Ip7JR/Cz2p2cVzh1hcZvMJfEXN3T9tEon0CSrSX/+j?=
 =?iso-8859-1?Q?rFW25MmHynSiN95LAOq84ZgBxrbzvM5a4x9742sZao5kf0P9HAJPvOu7NB?=
 =?iso-8859-1?Q?SlrskM1/oHwpVV1rjQ2xgw2xgk7bVs1evNxSPI5P6np3Hnt0FESn+33l7+?=
 =?iso-8859-1?Q?5FTSe1XjtPdqgPWTctzeUE3ciVOgpmXKEc8Ak1E1jjqswAcwf128nkHkZZ?=
 =?iso-8859-1?Q?hp4SmGH2uVH9TADe+OaSGkhEoWJeZhs1PQi3riElmPNC6l74I5b7wt2wiM?=
 =?iso-8859-1?Q?F3Fzw6bbJnJMIsXTQ0sohPdxWZyxPOm8YypZUv+y63NrJ+IaMQ96PH8Gq8?=
 =?iso-8859-1?Q?ji+qtmKy202wg3cmydNFIRx4xpFvlfT9FbsDP/0WHtDeq96F9IZmyROdXB?=
 =?iso-8859-1?Q?0FYZFsnBLzbNK7hQBIFYrwVOuKfGS456e5vrlEsU9zpqtmksDv+Q+aqGMm?=
 =?iso-8859-1?Q?bAiimpY9urUVFrTsCctdc71a8VFMzRqF9nUXqflnO0JvZxD3zvMUxVT7tJ?=
 =?iso-8859-1?Q?Sapah3CsogENhoW/iGU0h8FjCrgIqhG01EacW2UqaP3ol5QYk4QF8Y2Qgc?=
 =?iso-8859-1?Q?1b84v8fW4k1bKRYl2nb86uBJ7rhLvXch1Lf1v7o32pT986FFypV0jFw8AQ?=
 =?iso-8859-1?Q?sgyG80izd0pcJsQr82GKq/QE3Pm9YB0NlJ2wuXNPyIkAWFe/WOj+ESWhEI?=
 =?iso-8859-1?Q?nG1jJakWxiLxFOdHpSS1pC1so5Sse0mFQBrOgz33BzqlW8MCh/5k6Z6B3T?=
 =?iso-8859-1?Q?VLbO8Y5ZNaVopaBCIW6Teq2ZMF/bbebtJ6jBWjZehti0sk7UzqoFNKyrwn?=
 =?iso-8859-1?Q?yhIJcrNQs0tjnoZxlk9mn8kB9sojKBuKq/DeL/hAfLCTqCY/UYYs6bAo/e?=
 =?iso-8859-1?Q?veA2PqexzwpEHJYI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?1Ev8VC+EUnTchQRRA7XEC4DdnnHnbTxHMsAUF58+4MN82E8TfFh+hBkvzs?=
 =?iso-8859-1?Q?tuzf246XD8j+kNjuUJ7IKlnyTz4BrvV5p3DzS4MLa3cMgyJhMYAljhvNwo?=
 =?iso-8859-1?Q?rwYFs2tJxrSfdNLiAK2EnCZC3JuIDf2LqXFtF2jSOvzqeIGUHd22GnRRrs?=
 =?iso-8859-1?Q?CbEikVlvJVjOV8btwRfS6oCWk+6DulXvKyV6LH083sheMvHX++uPH4plUH?=
 =?iso-8859-1?Q?HCsq6s81aG1n0KhVg103W1bEQJo0xeLWeIxBtpI53DkXewEzUdFRB00yNC?=
 =?iso-8859-1?Q?FAmdEJFMl+SoSlC79rNw7h6pEWUz1HBmv45fNdmoQZADreyzCbszuntgwS?=
 =?iso-8859-1?Q?MYkEoPFNwXQnZh/f49GF5uzbPYPNjRjiYLVGxx9ZIKy3aNSP0EMb9Gkipq?=
 =?iso-8859-1?Q?+KcmVJzN3KLk9OWVPC2ZQju5ZkYjcR8cPLKD+Gr4l/UVoAevCRoxMc42T+?=
 =?iso-8859-1?Q?IN/5/+SS7MAQQNOLaPtqoXoQFZkHpU9VJZ6rD/dsHcJX4Ii6cQXMg+svcD?=
 =?iso-8859-1?Q?Oz58SFpt5TGOruEHD4I5f6vZp/PSbCeYighe8ZOqJf6yLnPk2rJoReVOEK?=
 =?iso-8859-1?Q?5jJcqkIcd1HyqmoUO6q6/JxVP1IyhkqTgKaepCq8mKUtUZrY8k/G+bPKgF?=
 =?iso-8859-1?Q?6Drna9hnbN5Fb1q3UEW5UtriYUDJQaheGDKWayYE5VMRrnNdCZpqpnOwqE?=
 =?iso-8859-1?Q?y2zc8OJXtSinCTuHdeBz4eiZYf/IhVwOz4xb+pUE/yrbJVQBUHkFnWmiTL?=
 =?iso-8859-1?Q?XF6qXpTOGjELOpvjeqZD1dHlpJ8PGHRrQcXTsTMA3v1kQsD9ieKXP2FWXT?=
 =?iso-8859-1?Q?lT4I1swuLIXlbvnxrcLd8r2RE7ky0YlWwy8Sh3unCQMO8TvxOv1TR622rx?=
 =?iso-8859-1?Q?d09UoSrcmdpTCf0s9HTVHZK433byevi0dDC2jt4bvwFolO7UxmdAWGNZ7s?=
 =?iso-8859-1?Q?oLcygFcVrZtg3dQEe1a/t6AVgDXKBDhLltzlWEoRassOETBuKSkKU7rasZ?=
 =?iso-8859-1?Q?zAqsVPD3X/zxexY91RnwskHu+hnrk88JhCAC4K6urk7D+i4//SHgmfjVcF?=
 =?iso-8859-1?Q?lIUg9JpT8OXmp/RyFagwAjtLJSLNpNARjDxj3sd5GYIKynSx1G9myMyv3g?=
 =?iso-8859-1?Q?rNho0L1WJG8NMo7Rjnw65U77eUGQKfO8R9y3UB/ET+tEt/7dvb2/WdTCH1?=
 =?iso-8859-1?Q?ztJz2YBHCQmOj+qwxg44N+8zCJZyqly45WmIRNNTedycHSoZNYl5fcm/Qw?=
 =?iso-8859-1?Q?rk/Fm5BBoTq6hXoCYsKm4KkGaHdqUqjj9UYLRSMVwlqd8pZsnwI5ALcN2d?=
 =?iso-8859-1?Q?z2j0fLN5cj2uJdJ13+0fc8ZfIfca/tQsHSBksEQV7icPGYoapU7KykpInx?=
 =?iso-8859-1?Q?7bUphLBEBVFvmO6SPju2OWtDrRoHfSCzcU3aGL2PKeEE9jmP1OsEFY64B4?=
 =?iso-8859-1?Q?uBi4XwApju+fEZChEFDLzf3vSdylQAf0XtcXHdEcq0vXPeLvJya8XRtxHy?=
 =?iso-8859-1?Q?gXeILSzdVFqy8ISoiRD84ehFnRZSZjoxlz5RV2369EgxmGZhBhoPOel4Eg?=
 =?iso-8859-1?Q?UPcL24LL47NBigVq5dC3A1C06nYcgq+PCoP4N3tErmSosjqiHEetvXnrNj?=
 =?iso-8859-1?Q?1R4ZH/rnYZQYzVtzm6iV3CaE96N+J8WUJyR1L2IYXQ4U8Z6hL/FssfHA?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f096ac0-5148-4dec-89ca-08dd5c86fa02
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:14:54.7657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7SaIlihkZF90kCxqvgbNlTizJMLcy+rQKgKIQQnrDx6sjgIdsF9bf+YFG49aNfdquxtzXad5RBoBV+Ykm41Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8676

Hi,

On Tue, Feb 18, 2025 at 02:29:30PM +0100, Julien Massot wrote:
> Hi,
> 
> On Fri, 2025-02-07 at 13:29 +0200, Laurentiu Palcu wrote:
> > Since the max96717 serializer can work with various sensors, we need to
> > implement the .get_frame_desc() callback to get the VCs and DTs for the
> > incoming stream(s).
> > 
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > ---
> >  drivers/media/i2c/max96717.c | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
> > index b1116aade0687..6a668a004c717 100644
> > --- a/drivers/media/i2c/max96717.c
> > +++ b/drivers/media/i2c/max96717.c
> > @@ -575,12 +575,33 @@ static int max96717_disable_streams(struct v4l2_subdev *sd,
> >  	return 0;
> >  }
> >  
> > +static int max96717_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > +				   struct v4l2_mbus_frame_desc *fd)
> > +{
> > +	struct max96717_priv *priv = sd_to_max96717(sd);
> > +	int ret;
> > +	struct v4l2_mbus_frame_desc source_fd;
> > +
> > +	if (pad != MAX96717_PAD_SOURCE)
> > +		return -EINVAL;
> > +
> Please check priv->source_sd first, we support the case where we only have a test pattern from
> the serializer. Then we can simply return the result of v4l2_subdev_call.
> 
>         return v4l2_subdev_call(priv->source_sd, pad, get_frame_desc,
> 			       priv->source_sd_pad, fd);

Ok, I guess I missed the test pattern functionality completely.

Thanks,
Laurentiu

> 
> > +	ret = v4l2_subdev_call(priv->source_sd, pad, get_frame_desc,
> > +			       priv->source_sd_pad, &source_fd);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*fd = source_fd;
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct v4l2_subdev_pad_ops max96717_pad_ops = {
> >  	.enable_streams = max96717_enable_streams,
> >  	.disable_streams = max96717_disable_streams,
> >  	.set_routing = max96717_set_routing,
> >  	.get_fmt = v4l2_subdev_get_fmt,
> >  	.set_fmt = max96717_set_fmt,
> > +	.get_frame_desc = max96717_get_frame_desc,
> >  };
> >  
> >  static const struct v4l2_subdev_core_ops max96717_subdev_core_ops = {
> 
> Regards,
> -- 
> Julien

