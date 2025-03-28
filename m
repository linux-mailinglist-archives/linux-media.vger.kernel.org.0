Return-Path: <linux-media+bounces-28927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2C7A74C70
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 15:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70AA916B7C5
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 14:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADFA1B424E;
	Fri, 28 Mar 2025 14:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F3SjsVg+"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011044.outbound.protection.outlook.com [52.101.65.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA821A315A;
	Fri, 28 Mar 2025 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743171831; cv=fail; b=SpsEJsNNtdY3gt8uFGbUmdsA0l1aZ7hMUGVw70I1k4NLsJuVdoMEfDodscW5RvuTKFQP1QfT0YZvNPSDxl/PudUCTbFBCYwFtY/yjdPjvPROEkMHqC+/vGzRaLCAh0xZImXm+sMN0feOjg8Jfp2cER5vUbSZ6tJhWxF+M7fhM0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743171831; c=relaxed/simple;
	bh=9Au4ZXef7R/b8VIl2G/iQt+MexHd1ZLyKPSd6ze4A/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qv8nd9RHlXsaHP7xhUePlNVY23VD2kCB/Md/s/qhZ9szFWHPAUM3CQx9TIGEKVDF3g+vGBtkY4VrjdIXpOapL9aayi55AKpVCulfCyfqoV1KztQ70bVmeUToGOmw4qOk7R2Pp6cW0UU/LQDCQo1sbj1OFO7TV3SjmOax2XbhlUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F3SjsVg+; arc=fail smtp.client-ip=52.101.65.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lx0ENUGNNFdqeofC8mTtNMPitKSy4HajFqnhw996ez/gxmIF2zuNBBlbjYOXLxb8LPQnr1BXRhywu75LmdyOspYW6huzItoUxWLQ6JhsMwmuDkduzKGCtquLS+y19A7F0cAuUm74h5lzXSGLmp2fFiyxTm42JhAyZoBkMxadbMu3ot7iPVY0dRRRf/baX3ag5nhjN4JKY9PUfaZrP/9mIIR2raeTKuD60uScGkWk7wQpy1fGs+IPDSH62oxEz8rBzl6PYXGB/vL5KUwibl4/fkLMApe776r8j2SBQjZBiOlKQ/7PqNyvJUXdhZXaYVUUWmT2Xw2PdmZIzFf1EYT1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ananZCJv+0x4LI/6MdRB3IxA1bH7PQklr2EVK8DUsfo=;
 b=Dtffa5lQOPTaeGIRe1OtK+2gCUCv68lRtRd5NJsiyrlMfXMuupkmMUBuC+uDI1KveCc50F18ElpC/qIuutd/slaOBRz9RCHHVEFwMoY0ZgsoAWGkL3Fon89p4JBD375F6Ju9HNd23XS8dCc4EcVLrprF5rk/pYyml/wgYgXxzS3IIwCY6rohz2wz+qf2XfiuokNpiyN4CRa8/zXMaLEAr9CVww4dawkry8PqWgsZ1xlJW1tfGjHv/jeh663AN/qUmdHOfAsri6NKNgwo8M6vjh5Ima2vOsWN8mFh0mCS8Pg+yER0XQCy2HFhPlW5p8OdVrMlXQdvRR53dggnJJ5eag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ananZCJv+0x4LI/6MdRB3IxA1bH7PQklr2EVK8DUsfo=;
 b=F3SjsVg+9g2xaDuWqXq8sP0nLTTttfdrihYvklN0WmwoTwxyYAdzBPRpxhppIMwb3KWkC2j89MMBVfWl8MyJhXN4Br7hj7JJNka8Bn8vCWp4aeo1wOzZM54SWC6DqktxuPg0IjqFN/4e+mo0+5j88hBLUj/Hv5vgXhAdQvn64b1hQmWSc43Vntxv1bHvXlV6JkEJRdTNP/B1wzpbz64mAH9Y3qYgo8OKm6mhOZrAZXKvFFBqBbMHFhvX2KvOdaO8EhymP272E93iipCs9SXNevjFx+UTvQH+JkWovRhhuqJUdCHGRLWDrt8dvKc7cpgAzZvk+NbAaD+DIm9b5cfW2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DBAPR04MB7301.eurprd04.prod.outlook.com (2603:10a6:10:1a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 14:23:45 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:23:45 +0000
Date: Fri, 28 Mar 2025 10:23:37 -0400
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] media: amphion: Reduce decoding latency for HEVC
 decoder
Message-ID: <Z+aw6bFdwTsxwLTa@lizhi-Precision-Tower-5810>
References: <20250328064819.784-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328064819.784-1-ming.qian@oss.nxp.com>
X-ClientProxiedBy: PH8PR22CA0006.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::10) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DBAPR04MB7301:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ef3c06-bb7b-4495-503b-08dd6e042606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j9gZXUNcPEU09ZWbQ56x4TcV69/uZ8khv4txh9fQ6zld+SEZ3UhutM+788UA?=
 =?us-ascii?Q?4Cqr2iDflmgMhdxV7q6Dx1tk3j9ISGkHcIl9JrxAJAFwaD5MvzpfQR3pL8x1?=
 =?us-ascii?Q?uLH51j+MQIBH2V3LvuDaiIyQAtGPEN7nlumKSQxWOfOG2vxjcQ6ImrVF7by+?=
 =?us-ascii?Q?zV5SV/9g26Vy3hVKI00xBJTZ2IZexjd+q7JqE6lvUKkGIpXRc3aKwrdPwcor?=
 =?us-ascii?Q?YXf34ednwW6jyBBs/exvBmw6EPKOlICykpfAHpWZZrOTpmIng5nHVnURJITe?=
 =?us-ascii?Q?hoAMHFe6HQNoTyss8aa2K87+fRoKC1D66ZrZm8h82U4y/Pz7+Vm0kRzBmnc1?=
 =?us-ascii?Q?aUas3WUQrSm9wbTFZ3oUh7zjPZksgbUxkTaKL3PX0plvDNYQM7paQaRoI1qg?=
 =?us-ascii?Q?Nvb6Pg5tAYpaRorrcCnGuuwnEnup/q9LI/75O4zEqNjPVF/EXNe6Tl0AJbE7?=
 =?us-ascii?Q?MYfVSGtLhRJC6Jxdse3kyOEUpBWC0qsL/pOVSsqVXHsiuo3kSj55025UWt8r?=
 =?us-ascii?Q?mS+oq8iZUvFpmY/6++c8Be9+8YmvT6rfqSuO4wX4jwwd39V/0gW6Sq37nEn9?=
 =?us-ascii?Q?i9CFW2nQvF+vyPHCHV155Cf1i2FvRP33ez0Vr8e2WAs4Zh4ZCnHMZmGJ3K5M?=
 =?us-ascii?Q?STQR948V0h6NL5zKY21xlZH5hvOStBqxF6o+IN9+oBseuopxzvpP/+9w2l5l?=
 =?us-ascii?Q?WaQmK6mNTXzgdlbuDX8nTZ9LEi5GBM7oIutlpX/6XdcvwXf7CtP996qmvuzM?=
 =?us-ascii?Q?UyHs4NdcnIZqJvlMEqSXKiyYbOMOK+gj0T1M1VbWEnCM1gtm1REP7vFWZROR?=
 =?us-ascii?Q?ynjh42WkvwDxGNAws9k+4t2OpdisEm4b3IspGQhAyZMJQpLbbNanVHdTYr6F?=
 =?us-ascii?Q?rQ8v37Vx7cGv/ucIDw54oXVeV88K3sGPQ6Vsj9cPBf9ONftY2u/Al+yXbSEN?=
 =?us-ascii?Q?W0mnj5e6GrDhJNIM1M6RhnWh+7OHmSbI75i4mjsXX/1vTXafVJ3LdHwflfMy?=
 =?us-ascii?Q?DoBLLJIaczjQrgn/u3iVx+f0uMKNDqxKQ7/tzcgIqFvmxD3xh7rv7lWkl1e8?=
 =?us-ascii?Q?4ndU13eJOKGzTwJamiGn9U0Us6cg5tP3BOkji8T5nQMLHjlDAkkouAaj/MHZ?=
 =?us-ascii?Q?hgy4k9hYYz+VbyHwlZtyB67jslZf9ns+9npladbNgPsx5Sjr5vQxOjTPiava?=
 =?us-ascii?Q?MrFwVf8RI7KnIZlGDExaMyOW74asYim+UFutPE6l+i80aa+J/wnQJRaqgHS+?=
 =?us-ascii?Q?wmj6w0KBNbZkihoBPl4SItticss4rRTwSLg3Nn3vwNdux6GkDwfuj+rPUOWu?=
 =?us-ascii?Q?+SXWKUJ42WFy6Jzk4kXxeyw9c1WcAsYbbyTO3rZt+NNR/cJ0w4zYZhutS2S8?=
 =?us-ascii?Q?X+EV/Ab0B6RwROgkil8CSn8xMMNCLPwZrR1gjwKFalblXZOzkjnDVBPmlTMN?=
 =?us-ascii?Q?U6DRen0F+Yq537JjqQ7LJjf0IbQMnFhK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a8E7+1Apsfw/ZsL1ox+uFhIZ1V2zZFpj75mavQ8cyG4L0hsNntR+b8XFFqty?=
 =?us-ascii?Q?42ihuY7BzMv9VCuTmYfr7dTv/mYz2sfUrFnm8TGT/vIz4mzYSid18w/dpHti?=
 =?us-ascii?Q?vN2HgPm82MAHBz9hqMdxC3B1DH/QK3EOrR+q6U+4QfikK2CQO0F/8DRY/02G?=
 =?us-ascii?Q?D21sW6R4fE6OhxnYo5nlKFVI80MmI4gXHd28IGD6JkTxfJ/0CR6nTAaMlaMJ?=
 =?us-ascii?Q?A/QILu+oFiqU//w4ufQQTvc9tCRS1wquDVCyIClHVYhnh9PIopz9SAE8ix8f?=
 =?us-ascii?Q?rHgnxJMQ4qRwR0gBrR3EGTeJOmNM7D8ZivCCQhZhsqZG5ufPv2mCwrW5lu3T?=
 =?us-ascii?Q?K1VLgrBa+q3D7itOH1kbmI1GhVKEXAjhtK3UGZYoa7wa53Tg92Ro2vLgrzs/?=
 =?us-ascii?Q?xSeH2rZcmuuQsYrgp/99Ei4gZM+DmD4JClmwqUubZEzskqqyyF2d0YG5GPhI?=
 =?us-ascii?Q?mFczR/3GSuhiDv4g5a+3E9jQpcHOcA7v8j3BqxLJAgrjcuye5dV/waDBwPGV?=
 =?us-ascii?Q?tPyTyznDvmrFBzddUYvZt/GI4HqH0Dm1zjctNwpD14jySU0T7mJkPtB7F6rW?=
 =?us-ascii?Q?Zzn7WG2H3HRI249pVibooAbCLLwGCer9hPZuKFzxjlKeLUb08IZcPTIV13fN?=
 =?us-ascii?Q?SF3+KSSwgIWqMm839F7mHVCZ8XhrvsorWlBnznziUJcgxIYpmGISFfhWKOI7?=
 =?us-ascii?Q?/X0mfPZWiH+9dZcOF7oqIPdrL9DVy6ZichAAM2H+fv4bnDI7lyX6efDChYbF?=
 =?us-ascii?Q?6d2TmeKYkiX0/RJJTGzxVWnQ04/LI/dT/CaYPA37qFNzFCO/CbavzFodVQOr?=
 =?us-ascii?Q?uXfP/WdddFAvoM0OnXL8BPuZiIpFCNweHfzBrKFepyGeo9DJgnt/bzodWP0i?=
 =?us-ascii?Q?5Og41sroDFhkxlbY2RboaU22CHG3TOcoyFUneOcisjBXzq48mtNmPYescnxP?=
 =?us-ascii?Q?mM6tRigwxO/pcbfeasuNvApZpchyXphZB8vsz3MZaRVZRoar1WBhOXjvCXBs?=
 =?us-ascii?Q?nhxyIkJh4b2GP+Jm/eHq7ebsuRGKiOTR3f9AFtqbbDPfq7JsBmxw0UPEIOnV?=
 =?us-ascii?Q?YSLQ1yAy95dovJJPESO4zXFGbgNdQQF9ULb1LW/QheO5lbl1r2bqiWwtyYqL?=
 =?us-ascii?Q?Syv2OjLAkBKEHzidO5YB5iy+zC8cEs7+wxZliJEpHKcMeVFJT7rV2zgC7BdM?=
 =?us-ascii?Q?Lpaod4/bUOeNzuKVwSC8YWGzmPlmsPwtYKtYfN6XiMpNLFI5RtZqw7WpYmrn?=
 =?us-ascii?Q?fSJAWlXtc7CdEyltSIKxXmqvJIvyk0I22A9nzqaaf72tWeNcSTqFs98kuKcx?=
 =?us-ascii?Q?d+3jt/ubp5l+Zkglapj6+Qt4Yqu6wI7diHrEXchvdrI8MbBOvNDlSAS4y67b?=
 =?us-ascii?Q?2abbHKNduTmgZ+9b8PTIWTk+YJZQBs/lgF3++YPb1y+68wCQrb1scWlCihXF?=
 =?us-ascii?Q?cKIbrIeIOR3S4nfQTcZoOwb8e59vFW+yXPCPwxz5spcSmvsvfvn8Vz2QFJSV?=
 =?us-ascii?Q?3e6pu0QsyR+DYAnafCftdzAITnYeJ9jdWPoxj1abVEdGyRNArWWcauQncqRD?=
 =?us-ascii?Q?1BlSqaN+tFA71SZe03MCJ/RocIRW10vBjS4GSJTH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ef3c06-bb7b-4495-503b-08dd6e042606
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 14:23:45.5976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFIryxFf8ctf+sqO30dWil8SBcGIvLt8JNjRyj9cBq26f+m/RxGix+FVV8/4CbcsxzFaoC1Ce9MJL/tA/wrqag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7301

On Fri, Mar 28, 2025 at 02:48:16PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> The amphion decoder firmware supports a low latency flush mode for the
> HEVC format since v1.9.0. This feature, which is enabled when the
> display delay is set to 0, can help to reduce the decoding latency by
> appending some padding data to every frame.
>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
> v4
> - Add CHECK_VERSION macro
> v3
> - Improve commit message as recommended
> v2
> - Improve commit message
> - Add firmware version check
>
>  drivers/media/platform/amphion/vpu_malone.c | 24 ++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
> index 5c6b2a841b6f..88f8c16a451e 100644
> --- a/drivers/media/platform/amphion/vpu_malone.c
> +++ b/drivers/media/platform/amphion/vpu_malone.c
> @@ -68,6 +68,12 @@
>
>  #define MALONE_DEC_FMT_RV_MASK			BIT(21)
>
> +#define MALONE_VERSION_MASK			0xFFFFF
> +#define MALONE_VERSION(maj, min, inc)		\
> +		((((maj) << 16) | ((min) << 16) | (inc)) & MALONE_VERSION_MASK)
> +#define CHECK_VERSION(iface, maj, min)		\
> +		(((iface)->fw_version & MALONE_VERSION_MASK) >= MALONE_VERSION(maj, min, 0))
> +

Suggest use FIELD_PREP FILED_GET macro because it can check input value
exceed the range.

#define FIELD_PREP(_mask, _val)						\
	({								\
		__BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");	\

		^^^^

		((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);	\
	})

Frank

>  enum vpu_malone_stream_input_mode {
>  	INVALID_MODE = 0,
>  	FRAME_LVL,
> @@ -332,6 +338,8 @@ struct vpu_dec_ctrl {
>  	u32 buf_addr[VID_API_NUM_STREAMS];
>  };
>
> +static const struct malone_padding_scode *get_padding_scode(u32 type, u32 fmt);
> +
>  u32 vpu_malone_get_data_size(void)
>  {
>  	return sizeof(struct vpu_dec_ctrl);
> @@ -654,9 +662,15 @@ static int vpu_malone_set_params(struct vpu_shared_addr *shared,
>  		hc->jpg[instance].jpg_mjpeg_interlaced = 0;
>  	}
>
> -	hc->codec_param[instance].disp_imm = params->display_delay_enable ? 1 : 0;
> -	if (malone_format != MALONE_FMT_AVC)
> +	if (params->display_delay_enable &&
> +	    get_padding_scode(SCODE_PADDING_BUFFLUSH, params->codec_format))
> +		hc->codec_param[instance].disp_imm = 1;
> +	else
>  		hc->codec_param[instance].disp_imm = 0;
> +
> +	if (params->codec_format == V4L2_PIX_FMT_HEVC && !CHECK_VERSION(iface, 1, 9))
> +		hc->codec_param[instance].disp_imm = 0;
> +
>  	hc->codec_param[instance].dbglog_enable = 0;
>  	iface->dbglog_desc.level = 0;
>
> @@ -1024,6 +1038,7 @@ static const struct malone_padding_scode padding_scodes[] = {
>  	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
>  	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 0x0}},
>  	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 0x0}},
> +	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,        {0x3e010000, 0x20}},
>  };
>
>  static const struct malone_padding_scode padding_scode_dft = {0x0, 0x0};
> @@ -1058,8 +1073,11 @@ static int vpu_malone_add_padding_scode(struct vpu_buffer *stream_buffer,
>  	int ret;
>
>  	ps = get_padding_scode(scode_type, pixelformat);
> -	if (!ps)
> +	if (!ps) {
> +		if (scode_type == SCODE_PADDING_BUFFLUSH)
> +			return 0;
>  		return -EINVAL;
> +	}
>
>  	wptr = readl(&str_buf->wptr);
>  	if (wptr < stream_buffer->phys || wptr > stream_buffer->phys + stream_buffer->length)
> --
> 2.43.0-rc1
>

