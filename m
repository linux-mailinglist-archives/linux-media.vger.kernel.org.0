Return-Path: <linux-media+bounces-45682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19319C0EF2E
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 16:27:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B96A83AB451
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 15:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77F030AACE;
	Mon, 27 Oct 2025 15:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="eG5sAfXU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC37309F00;
	Mon, 27 Oct 2025 15:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761578419; cv=fail; b=mcKJcgUZo5wVG38sKGI9LsyACw6lylbaLKEuQHMeGfZ6bnxVw21XDxXJBzZXhVBSwVRiuYCs8tjv4mll/SlhL/MH49xMdZqwloS8izOXs3xjOBnbyD6OusF1eWEavAqK4N7MMad8zVKOMsuThYAtw1P0vQmz+fTBSjxPAZ3bmqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761578419; c=relaxed/simple;
	bh=yoXp+Qe97Z5WunielHqgBrsWkQI9Db7bO3Ixx/i2KvU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRxYM5u56pJXKMukdfbBTdgZC3F287w2Y6rm1XYxs5uALSBTXSTAI1oEQUPJvuYdxdHk29PBcKiv4ZXOBOTUsraowBfl2ZjFEvscmkmkFOSr8DG48cZVMC+4a+lgEuZhinAC/Nf674SoSXbCChcHG4xnIBX5/EBzYRy9HeCxXuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=eG5sAfXU; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RExU0n2120316;
	Mon, 27 Oct 2025 16:20:04 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a29hmgf94-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Oct 2025 16:20:04 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izhqHS76YuSFGqI6D472Rb29KNg7YCnU1SZnmvssi8zcvzfdOzGX0SnOFj7T9NCoAn4U6mtk//y/PCNTAammvf1b3acn24BTtveEMAQbeVEww3pkd6jmd+DDjZQIefWpF3QXBfz90zgRLY2cMlFHeOeDSYNWjg1hL8KpRJYvs+Fe/+8ycUbIZjyQjL+uIzMshUUha0oWdjFOrpZk4EGGH4ocyMUjW22Ul52CW7AvdK02vY+4szDnAVtf/IckZiu3a1d70hYxjzWjnq5qkD3+Dspn9bLyxP8upzkUdoIFF9XX+oVJOqpnnQrS5NBMQux7u+/kSZimhEfJz0k4AgDiIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWYB+OTeZ/fnzv1CZJI+Z/shUjJXFTdam06/NTUCKag=;
 b=Bp/+PUoQfUAAns4caiIMG2n2tDc2a/pDxirzRshdzFwM+7YUwsiVhJhqvYjTPGeK0M448lPsAM87ef2p7GB5kxMhgG6ZwIXz3suG/JzOqtbySTEoqHHjaKg2nhdsDIUsMXDJ0FiGUV3LR7/RV6KUjv8Eel0dJdT5K/oD7HpnUNureF/I1iIdW8HYUnU66DTd0cR2TJMwTOj3TUS5NKBUY/YU7jBH0f/GmpUYBEdgV6XzXwrb2LplDDoARKXwwd1UgrBx/cJehkyz69PsZ22RRIrN1ImpNafe7FhcFwREp+7DdmXsGo4n8EdrjO7y/1J6poIIQMdp5aCPNVEYpUni3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=web.de smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWYB+OTeZ/fnzv1CZJI+Z/shUjJXFTdam06/NTUCKag=;
 b=eG5sAfXUBk6nFwc3v7fpcZ4dwsmIXor69SLdBDg5Gow0lqxUfEAZRi5z7Ir0ovlahx0nNNNFFEoAuVBcRelXUsxkImpaMrKKENuV4hRMpW9O+bZUUv0WTUq8QBe04hnE2aYDiwDZVx0iiE07dPdC4hUBSenEbtIvOpU5TQW+O3FUbWbBqftGnyl6WDd3iy4++VzNO7O669SgpGc+fBMA5/FexbqgfM2OnWYMP1EfLfC0wWDS0i1MKb3yI8cVVFGZhyC58dFSo2mUc3CP9W7t25u2h94E0ZOw8yeOXNSuNFzXl6nWdgEXlZHIqT0uGeasbHFkZBF3MSSIBEQ8yk64gg==
Received: from AS4PR10CA0022.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::6)
 by AS2PR10MB7369.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:607::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 15:20:02 +0000
Received: from AM2PEPF0001C717.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::ed) by AS4PR10CA0022.outlook.office365.com
 (2603:10a6:20b:5d8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 15:19:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM2PEPF0001C717.mail.protection.outlook.com (10.167.16.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Mon, 27 Oct 2025 15:20:01 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 27 Oct
 2025 16:17:46 +0100
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 27 Oct
 2025 16:20:00 +0100
Date: Mon, 27 Oct 2025 16:19:51 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Markus Elfring <Markus.Elfring@web.de>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "Mauro
 Carvalho Chehab" <mchehab@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Anand Moon
	<linux.amoon@gmail.com>,
        Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] media: stm32: csi: Omit two variable reassignments in
 stm32_csi_probe()
Message-ID: <20251027151951.GA1160161@gnbcxd0016.gnb.st.com>
References: <b462b48a-eaf3-4324-86cf-ca45c1a74a69@web.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b462b48a-eaf3-4324-86cf-ca45c1a74a69@web.de>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C717:EE_|AS2PR10MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d5e91a-b043-484a-d035-08de156c4caa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eXAzRorJcTrMI8ZQEjXjgUFUQz2vNv/Mhyg0yn9dhzqYmTiclb55Ygn3PL7q?=
 =?us-ascii?Q?H30U0PJ/x7gnUNfbEvIP9pabjQzbQcqi9FHpOoQTIyVwQStJprFnmgmPXfuv?=
 =?us-ascii?Q?76NnVGzyi4+N1Ea7xJEIGWxuLONT7thq9e58qQWowpnU6J/O+hkQ0BIxd7V7?=
 =?us-ascii?Q?IThrUtVi6cc57b0vofc9+/RemW0rmN6M4B0glCqbtyXM2R/wjmrAsWRJ5Eah?=
 =?us-ascii?Q?DfrX0bgIPknUEAaB7AX9wW5jC8onNrVEJgxd2913aL7U5MJhhjSy8FO3iB1P?=
 =?us-ascii?Q?bGoTWBUCPbCItRyj46dONmF3M6fKp+FBvlUfoARqXbB+DBE94V11vpQqRXXA?=
 =?us-ascii?Q?b3tRTxfFV9awxd7lKrpdZJ5ebjYhvotZiDfz47YyKkviFqYwwce38aUqvd1y?=
 =?us-ascii?Q?bF6Hu9DxHrFw0t98JJ/06EAJZInleU5ykORhqQ/gKc1wNxj3pyXrxJ9lYjG5?=
 =?us-ascii?Q?PIrwaU3BpoK2/4quKX4pSWSKqORQGhtEg1WhYMyLmSpyoh9SfZQeC92iQiiD?=
 =?us-ascii?Q?mnidz9YKg/pvEvcVDjGEcMswmNfFa7h687inDc6teq7Btn44TUU0dBs8xtfn?=
 =?us-ascii?Q?rVzZJpQLTPweaXIpPBVxl8Tq43wLUMPRGkWIGE+uOte0nsvCCYB+krQTUYol?=
 =?us-ascii?Q?XEOjM95eT+CClWOuJldAQuQLDL+yw+jf8K0vfN7nYo1xvlJI/MUQc1UUJ79S?=
 =?us-ascii?Q?TSiUTpz7lW9Rm4VsRE6TXFQSwGDFC7p5PH3IlBS8AKF2nr4xQmt9mEhNlP+T?=
 =?us-ascii?Q?txbDBLZrePkz1ilizmYkU/+7gkbrQLenubf6Pwb+AVoWjVPJvQJyyW+lNgqz?=
 =?us-ascii?Q?FQSblmJvfOgf/rUvZaCRzmgdHEQthfdDZfN8WECy2vUIKc8ekfRB11wy4ClT?=
 =?us-ascii?Q?cQApYamx1NcWnZCWXtm2PQpVz/LL8rVVYPOhHjsq5YQNuE7uTRJLJxBPBYAW?=
 =?us-ascii?Q?kMe/WICuz2MbOBKXItbDi+pB3kKiRitN/zfnVCu5VaU0hHNNI04twJroX5MG?=
 =?us-ascii?Q?NwPQYlIo6Jvb9Atp1a3PVnK+c132/6nW2ifHbqr4IVonYiYoUMonL5+K2dK6?=
 =?us-ascii?Q?L/QEt0XoP5kw8+bxyN6zU+mlIdbgSP47BKYfDaY/KbhzrWI2ogymEGJIhlxL?=
 =?us-ascii?Q?xl8IYharpEClu0dxfNoOwsKzZkcvP8n/z/hzKaV8eHesKVweFPJck6OIPjxK?=
 =?us-ascii?Q?j8scXwygup8s1w/T454TbUcP91paacQcKkrJhJREiG9qTWrhtrKqLV89GRdK?=
 =?us-ascii?Q?PpUyI1mdJtTsc+hN7Aammw2JV4/9hxwrnLoFTWdjtdXPxuDJO5KNVpy4tJVN?=
 =?us-ascii?Q?D4biUzd8hHezDncz+rS2OYJQAyzvrf68x1YH5fL7NcuRzrWFqroWBl/rRZcn?=
 =?us-ascii?Q?zXJt2kVhVu1zeVKKAbpt7IMVxmBux5NKWkNo2YP4rwITlp1NY2jEwfbK2Shs?=
 =?us-ascii?Q?3JkF2GCiuQhcJCg5XJ14/X/fWrBZB//+B15Nc/mtO9Pk7mjkIpWY8RsjHZ7R?=
 =?us-ascii?Q?3aATTJbncFrFh8XKGkkxErJsY8+aN0oW88uSHd5njEOA893YXW6LDczE4SZl?=
 =?us-ascii?Q?BOh0m4GNK+JuB36pjBA=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 15:20:01.8977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d5e91a-b043-484a-d035-08de156c4caa
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C717.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7369
X-Proofpoint-GUID: kCgebp749YWGaDU1ABgOzrvs7bgti4_R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE0MiBTYWx0ZWRfX3ApBWJAEbbil
 W/ZS02sEtx4evdnuUT3ryw9nHc6RylKW5PkXSQfMUDr2p23r9ALVSadbII4MN7AS/u954yVPecZ
 nuGaTDKcvtUuMCBoQt/+247B5KYT9oxqlaZBcX4Um9AOxcxz7eHJLkl+hmkvujmBc0FUdytk7k+
 hgpckrBsETtwEYd+sAFfulm+Mdpd11f4EQuT4OTzdrmnEGgvt1E7rvc470roF9UsmRFCmsegNcV
 iCHOyoGmPdwiT4x95TWi6OSx78MsZxZesoJ06q4jDHEXR4T04/NBafcpvLenyHSlayYSdVpkmmI
 c5icLuwevZzRxZz0GUEsXFen0QYkDiCw4ZCba+Pk0n9iYVSKCyf9nS7vTuXC6zuJ729mAUpeuaA
 74WnqLnETRpu8JdUldWD3K3xWmU4hg==
X-Authority-Analysis: v=2.4 cv=CLInnBrD c=1 sm=1 tr=0 ts=68ff8da4 cx=c_pps
 a=EUaLOA8Z8AdjKRxvbO/E2w==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=n5dE7JB0mAkA:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FP58Ms26AAAA:8 a=8b9GpE9nAAAA:8
 a=2kwyBWd3arp2w0R20MkA:9 a=CjuIK1q_8ugA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: kCgebp749YWGaDU1ABgOzrvs7bgti4_R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 suspectscore=0 clxscore=1011 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270142

Hi Markus,

thanks for this patch.

On Mon, Oct 20, 2025 at 02:38:08PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 20 Oct 2025 14:30:06 +0200
> 
> An error code was assigned to a variable and checked accordingly.
> This value was passed to a dev_err_probe() call in an if branch.
> This function is documented in the way that the same value is returned.
> Thus delete two redundant variable reassignments.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/media/platform/st/stm32/stm32-csi.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
> index fd2b6dfbd44c..a997b34a73d7 100644
> --- a/drivers/media/platform/st/stm32/stm32-csi.c
> +++ b/drivers/media/platform/st/stm32/stm32-csi.c
> @@ -1033,8 +1033,7 @@ static int stm32_csi_probe(struct platform_device *pdev)
>  
>  	ret = reset_control_assert(rstc);
>  	if (ret) {
> -		ret = dev_err_probe(&pdev->dev, ret,
> -				    "Failed to assert the reset line\n");
> +		dev_err_probe(&pdev->dev, ret, "Failed to assert the reset line\n");
>  		goto err_cleanup;
>  	}
>  
> @@ -1042,8 +1041,7 @@ static int stm32_csi_probe(struct platform_device *pdev)
>  
>  	ret = reset_control_deassert(rstc);
>  	if (ret) {
> -		ret = dev_err_probe(&pdev->dev, ret,
> -				    "Failed to deassert the reset line\n");
> +		dev_err_probe(&pdev->dev, ret, "Failed to deassert the reset line\n");
>  		goto err_cleanup;
>  	}
>  
> -- 
> 2.51.1
> 

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

