Return-Path: <linux-media+bounces-56766-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFHvKhWRwWnFTwQAu9opvQ
	(envelope-from <linux-media+bounces-56766-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 20:14:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0012FC067
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 20:14:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4022303F7CD
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 19:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3954833A014;
	Mon, 23 Mar 2026 19:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hcE6xiNd"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010035.outbound.protection.outlook.com [52.101.69.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80B03321D4;
	Mon, 23 Mar 2026 19:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774293061; cv=fail; b=lwjGLE9/8AKzYWMIK5EKLr3IYUNJP2yyNGo38Fi68EyUpMHKT7qVB+Xtrm2A29hpmYetkfX+r0XqIXlI0ZPZgYQmuiXUWpPOTur5qDnE6EEK81ueclg9dmwJR5HOlGHA+ajF2iDHkE4mxSsDrVXhVXMy0r2kc/KMBio8Zidc274=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774293061; c=relaxed/simple;
	bh=ZQDaqn4gDMjnmGX7M+kaWr/JwNknEDu1tjqTLnF3zu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=juGiY+7bC2dGGimX1Sg4suEyf9tNQubwMzrOyJ0Ibw5+x6gIrLjh6vLH5czXOZh1oq6Wapt0CAKHb6F7e1rad8LOOUD/1ue6czwnQAjUS+MHFLqwDk+f2eI9w8JSIuwGQXguEtClk3qw1ZfXIBYoO3y1WBlQtDs3nyRNtUfx5YQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hcE6xiNd; arc=fail smtp.client-ip=52.101.69.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hyvmgVLrzPPAxWOKEKK7KufO7oMeb82GwS487yUHGNW6U79mAVzUcaD+Qi+mEjBfm0wWkKexEgCOpDFhZwxN2313blq+HZTsMWXoTgvfiO9Y9JWnku5a1VXhEG66px0lony+SmbSphyjC4lBQakfLgZdWTqxrHCjzgDC0NSGv/P6XngW4e2lpb/jAX6PDPe+i9i0abgFBoSr+uE2zkDZOzOl922eQB2Um+nkqSe6j6aMJbqHHxDdESUc+dj5J3xjDtFA048j6xiqTwGINb8+GzM6CMJV9dEcC2M5XwxW7Uz0VSy+/CqsvBm89L0ElzFs5C6tb500sgdc+RHn8Mu25g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07SDZXFCKqng8eoszyi1QoNcVmTC8ksAU6GAoyt/Ujg=;
 b=ZCCpTdNjbzTsjk3vJzC8TS9Ep42kORlnCRvhXvIjgPiHeVdNwxuE1iyHLTJq6+iXeCjWuW8y9gAjCf0rmKEOPv1HUc12NEwWl4tab9Y3+g5F3mil0otkIDaf4mBYkOJKxPah/4SpRviW62v7jS8BcA5kwWLpfcfOnPiOI9XnwA99AAmtspZ8/5sHBlW2+NilVQygsDoTh4DA1BPQtgD300DAWVVGzMpaX5GhFATlerAOh2dDl7I9bQNxEGknag7DX2ChY8bTSHkATpmYUwOUXhlNfVhGyc/dODMl2dICaCyPEF3w+2U46xJ+D5R6RkEw9qYYSFrAtDdw+ZM8FaG7QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07SDZXFCKqng8eoszyi1QoNcVmTC8ksAU6GAoyt/Ujg=;
 b=hcE6xiNddACfigavzEEv0YsHa9UG+FoMXqXfHtYJb+h0n9+954yMWFTDY4xx2HrQ2lcV7kPGE926acfoC2v4Vgiq5RMJFNIXSyQKj/ATApSgK6mnG/S77Vrm1LyZ8ZGdN8gyGP37ilQixDpjOAtTJb+L2vHP5bcCFa3rhuqDr/7xiOrFis/b4/T3BXxZMjZ3FAAhiucsrPxkI0KHXVUBrzNlzRr+nlMv9+o53/SvX9sRf/pF2TBnHREOp3KaH0iALvNniuDkkbPwUglPzf2iD8PdtrVT+Qas0LqX7O4bR9W6UHzCSSpMyQ7kCFqHK1Oa1dwCUxAoe7LIMjyDO+V1Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB7655.eurprd04.prod.outlook.com (2603:10a6:20b:292::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 19:10:46 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 19:10:46 +0000
Date: Mon, 23 Mar 2026 15:10:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	imx@lists.linux.dev
Subject: Re: [PATCH 0/6] media: synopsys: Add imx93 support
Message-ID: <acGQNIUKqfh8eWNB@lizhi-Precision-Tower-5810>
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
X-ClientProxiedBy: PH8PR21CA0021.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b2a54d2-d9c8-40eb-8276-08de890fe334
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|19092799006|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 aWKzQwjAoQydVFkIWr/vl9nx8a30HsdzkTRmCS58p2sPSxNsEOU6aOuhxDCLt2wtYk45v1kk+6mXf/JKQZLRStiXCP0rvZNe3F4oyVPnVK5tj9w76lysH6lVxcdNAnL15MkTa0W3dKlh02VLCj5vJMEVN7FLpOd0eMb0A81ADsn/W15qvQaLonlI4vMfQ7bfvqOV8IzyaOReg8G85eO94zhJ+pMWoZWFKIUKp0h5NMyH06Gj9RPZY8hLNSO0Bpb0ch4q/Yi5Pjdr9EHcAdO5LZVMjGw08xq2KKcQZFkGASK+foX+smSIi0ENG2E/5D19bu2Kl/ac4yH31P6QRAdc8Ev/wiIJCvaAplQwGVH4DYhsb/EUTTsRkdqWuYw2ocyQcm+HGm88+DQTOcrqZ6V8mI1XOF0fNvNZ/EdYLsiAMvcXKt4GTLCJPhTGte6InKLhj+rvZKcN+rOm4rl/ysdtRO2hJXbUw/1YZKPlhresVdtEXG/RDVRVWivF4SwzF8zr872xampxB9n3uwg51lN9h1p8YTc8PM9TPBdDrHgKPKKfvBQlYyNWjNJKzIbUyUV2fE4AUM8eJYR5v3DjuDTRh2kyZW+61/zKR3YII/9On4SyQLS2AevbamV/XrEDxmhNyZWGGz3j1/obEdN+cV8NVNerESzynQEyPOTfaYdJDxcAxXiAdhhWKcll8YNi3bogEhNmIoPqLHWMgllfvd+YBEOVrSsYv00XVpnganTu5r55OrQBOXls+KHEnFLAKu0nTmzpizyNMpk8GOgkzA/K3QgKgjkTINniVAt9smzQ+hA=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(19092799006)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?MatWXGa48Rfu/sjHwg8Di4xGs54T6z6beFBYcwM7U0HYhXmNGl0S3S1ssiI/?=
 =?us-ascii?Q?x8wLg86MRd41iwBH8NVijYwKyOwwLAhwYrZpYjR+7O4tCR7zG+48tJFXKj1+?=
 =?us-ascii?Q?qiRvH3tjFLOdT1Y/R7MjSc8v5kMkn4+wbYxqMR6WstFEF0vUuJQqkYQmfHCQ?=
 =?us-ascii?Q?h5jfOIVhhYTiBhujMe1N0HWisTzm5mD4NXm1PprSECrKR36xjRH6J5+38JHm?=
 =?us-ascii?Q?dEMEeZoGOaLTn94Fh7MPYtHASjmZJBRSjVBD3+0x51Ui7aAh6lZEBZ2M0+4x?=
 =?us-ascii?Q?d/HQ8/rx/0aQNCS78wKm/RY696V0hUK0SoXJ4A7AsTjHH7orL7nly1eneOp9?=
 =?us-ascii?Q?wfHN0B+d6yLo9kYI2DbziNJZo/mFI2rLTnT1/OWMK6orBzlRkm6ddY62+lSE?=
 =?us-ascii?Q?+tOE4eUxssTyk/yS9p3xTNzEKVoeqI0S/5j5TDBFf37eIpFXpvM+Ev1o4qk3?=
 =?us-ascii?Q?DcV9BUhJ4OWkHyQdEvOVWCs93OmjtfBuq1pe840hcPazNU2SRk6IaGRovf5X?=
 =?us-ascii?Q?EV1D8Qpf41yF4E/spn9JWztMeTi98/DTzMKcQC2K71vRfKXXIBV3e46FNcPF?=
 =?us-ascii?Q?+MsXli/GX7NHlPsHAXcN+asyLLSQ2wUdqdtj3Fq49XVrwgRQqvsQJQnB6Z1i?=
 =?us-ascii?Q?Mm15AjvVZufUQ99SOhxDb9G5HCxHRzqtqXITWTuEz/Hm8GHTPMPMfV5tllnZ?=
 =?us-ascii?Q?FqxjVPWhJywRBsw0C8+mJ2mNGKuCy2JDNu3sdFktYSvUEX3xseCFFk/XEDZW?=
 =?us-ascii?Q?YcovuGsb1bbnXASt/zsNlJIyplFyDPxkNaTnH4j9l8glNQfl4B7BRHOAD88Q?=
 =?us-ascii?Q?+N9Fo6VQECx6aIFNgGZzg0qGjQ6Yl4UiDMePEcTsneTLTZleusCl9xPzDoLG?=
 =?us-ascii?Q?oqDU31Tw+RX+ff8SBMax1Kn7xtv9BD97x9AZvOkJsdJD78h22C5MJFrzUeyc?=
 =?us-ascii?Q?30rKOCadl6oomDqRCx81EebwfV6Uh5uVdPJQXo9y9SOM4Wq7JDZhltDcZ6Ro?=
 =?us-ascii?Q?/lHA7eGHC66l3UBx54FL9+PeT6NQq6h/yySeQ+4qeF36W2I0n26I7PkHsgjo?=
 =?us-ascii?Q?3NyOaIYXJMrj3wSbRSZyTeAbIaWHUVLVgwnG4rsbGP4f1HhpQBXo243nMfGL?=
 =?us-ascii?Q?skmSLTePRHMDOZt8uBErxDMESbuMof6sztE4E+tKqArJSLYg/3cIirnIL5jy?=
 =?us-ascii?Q?sVcShoEOG2H6BjwtBfNun1kbfJr8JSUvlsvf/EcF0EAqHH3BkxmTIaGUSy56?=
 =?us-ascii?Q?ygOQayCGloJX+QhEDjKjGqeId1lnTLzknRwGFS3NM21Ft0NBsVgRz2pXC+4S?=
 =?us-ascii?Q?ZJWnRNwhGtJK3l9xvEG9EYn0tCHGvgE3r4tiEcBdnrv/zKG2Vihtb2Sha2T9?=
 =?us-ascii?Q?/CpzEV4VCUj6fs+1VFNRunpdrAGIw/nYa+E8x64yDHo94m33QevZctIB+thS?=
 =?us-ascii?Q?4xZVrrtEmgQad8nbcFNryszaWnBpVPz5x1XNQeZF4TAso6uu6ozm03K0Gaby?=
 =?us-ascii?Q?XBAvJ/s3WH/np7EGJhsvoAGYgYZr8AjMxBzZ7Y4sl27HsFWi6ELIg4kgwy58?=
 =?us-ascii?Q?pfY9FTcxiXUDmW/kn0Ir1dJWFvAsfE6qvyO1Yzyy3yzLdNSxbVtQJyAe1P5r?=
 =?us-ascii?Q?JkfdBYCiWV+10Pk+leFy8D4RyEqJVCpfurNkB7W6J4+D91zzDKuZL46ynQlS?=
 =?us-ascii?Q?SHw/DCh30wQvGvhUj7wGbdYrq7ahRZNiRyjm4waBOXVyhOW85V0ljohnCQxQ?=
 =?us-ascii?Q?b+szubnH6g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b2a54d2-d9c8-40eb-8276-08de890fe334
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 19:10:46.4651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGWUvLzPkB5xuPg13q2JWOODK/opuSzYKQaaERU+PBgSABNZdKJLDSUuBtSoHevRbR5eSBcyyW35ejCZH6wIEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7655
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56766-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4E0012FC067
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Feb 10, 2026 at 12:11:07PM -0500, Frank Li wrote:
> This 3rd time try to support DW CSI2RX support for imx93.
>

Laurent Pinchart and Sakari Ailus:

	I am not who will take care this patch?
	original drivers/media/platform/synopsys/dw-mipi-csi2rx.c picked
by Sakari Ailus

Frank

> 1st: Create new dw csi2 driver
> https://lore.kernel.org/all/20250701-95_cam-v1-5-c5172bab387b@nxp.com/
>
> 2nd: Based on legacy imx6's DW CSI2 constroller.
> https://lore.kernel.org/imx/20250821-95_cam-v3-0-c9286fbb34b9@nxp.com/
>
> Now rockchip create a common DW CSI2RX driver at
> drivers/media/platform/synopsys/dw-mipi-csi2rx.c
>
> This time base on rockchip's implement.
>
> i.MX93's version is newer than rockchip one. i.MX6's is more similar with
> rockchips.
>
> But i.MX6 is too old. So start at i.MX93 firstly even it has bigger
> difference.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Frank Li (6):
>       media: synopsys: use devm_reset_control_get_optional_exclusive()
>       media: synopsys: only check errors from devm_clk_bulk_get_all()
>       media: synopsys: implement .get_frame_desc() callback
>       media: synopsys: use struct dw_mipi_csi2rx_regs to describe register offsets
>       media: dt-bindings: add NXP i.MX93 compatible string
>       media: synopsys: add i.MX93 support
>
>  .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  47 +++-
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 280 ++++++++++++++++++---
>  2 files changed, 293 insertions(+), 34 deletions(-)
> ---
> base-commit: ada3fa02f7a95623b724dfe300fce6f49cc2d75a
> change-id: 20260128-imx93-dw-csi2-b472ddcb176a
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>

