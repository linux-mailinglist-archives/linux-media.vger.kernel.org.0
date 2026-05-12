Return-Path: <linux-media+bounces-61282-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OkfLOdIA2pU2wEAu9opvQ
	(envelope-from <linux-media+bounces-61282-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:36:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2D3523C37
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 70C79305D66D
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A163C379C;
	Tue, 12 May 2026 15:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lvZVrwRc"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010038.outbound.protection.outlook.com [52.101.84.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEECC3BFAE7;
	Tue, 12 May 2026 15:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600130; cv=fail; b=JVjYVBx5NborxtPuzDfPvDQW9iGMdMXgsJqjex/ODp2awz7LPtlJulxkU/0yzrL63fdHC9cWmLkZCB97D9lKtuDeDXejdyx8THjFdMQttd8FvsedhiU3UOGBnChmUyKY5Mc+tUeJeNBZ0eP/8UxMW392tjkpXRXmnduVKDJ5SsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600130; c=relaxed/simple;
	bh=79n7JpHCxbxcTOyAn5/07/okljxp6cvj4F2XiHntEt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZAJGejK7FrFz21zFT9uEylOsAXC3GqNOSg1T76wpZITIEa+n+DUYgvxq3vY4Z1vD592yCtppejeYjumnafu2XB/GNqw27QUXQqIanxtDIxO9DbD3lCCvlgyETi5FiN+6vUOlWl6TOht1cpcmDTGtvoC+oF3km+j0Y1jCNhVUnJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lvZVrwRc reason="signature verification failed"; arc=fail smtp.client-ip=52.101.84.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xavyOKIKOGyuMGtmQYmhNY0x1OrlnEPeMzmyN96HoHVqcAZRLlR3k5g5ZfceQCo2cjiHJYLyeCyKVL79Ro3cljOX7rRQF0mr8rvWRIj4oaSLM/vjR4p+i/9dvoZuUIRf/eEF0qQKeSMUcL+/jXGxdNy80Hej4RAi+ujWRMQmtEOFvDzL4LvmqmDqOIeOmqXTI/dkJRWF7iSxRLILU94ixORCX0GMvn9G8lrbRbV/TArNCAF91icDKh3VUh8iDwr9cAr0muboDbp8dMy0XO4xkcRjIx91Wl0terTxNuxk/F/wn625LDt0MgYQfavLggoKOBWVSDPk/lJkwZRyyDad3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvL1QLKqJKWudv8DUYocx6jzbOiTP5ZfL5aDyvY85Rw=;
 b=nw9lYGnpcvta4rMFdK3/u5XmgGImaLldDGlRXj/PfjtQbO/lT+Q0JqrC5gR6CYVLAiI2w8clnoQCLy/H1KV4I5ml0JEgU1EOmulhcEFUEOyTssr2Xnuusv7/9pLZnE3oT0akstrg5fMLgj4v1WIKYBluV1VFUyaXbtd2xBKvhEPSnzEdxcz7CR626W+A3l07tnq17FS5P0Z9vWlm43rvzkq3t6aS6p0dMtGJqRv4gi1W3exG7+8r+/RxZaVOpFlx5ETFoyjq4QE2i8BpcuvRiHHBCBAXV1aVnj+P+GIG2Td84cYKIcXyd4PHat+vpgbUteb0ja1QdUba+GOQscWmYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvL1QLKqJKWudv8DUYocx6jzbOiTP5ZfL5aDyvY85Rw=;
 b=lvZVrwRcH2LzD/cottMfXLOes3vfccTXlqTVnCiqoA2KXYuQ+Yh8QcVDMPg7CznZ8VWZUi3bwdtGpfv7QTXfLzsdVBVHZCC2bOPyZ+iqtUmSLJnzf2cjLbeULoEOvVMJCmIg+cfdrfIVo0s+LCDDtVG8CCuGUBgKwUq4knzprarIrGhSlrvo5/Eu8VgO7yJr3EFRZxnymErMds+gdd+6ocO/tlf9QivoOAHVvOOzoiTm4/7LpOe12GXXDu0MeAUCIaxNDnVz0HqDuiCql6fN5X9RqjsC91ICdqxcpw6iR0TpoDsnQhwugzA+gaVY2RyxlSPLCaknDlqcNsprbEf0nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8456.eurprd04.prod.outlook.com (2603:10a6:20b:3df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 15:35:24 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 15:35:24 +0000
Date: Tue, 12 May 2026 11:35:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/6] media: synopsys: Add imx93 support
Message-ID: <agNIs4GLcrMLWjZ1@lizhi-Precision-Tower-5810>
References: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
 <5993213.DvuYhMxLoT@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5993213.DvuYhMxLoT@steina-w>
X-ClientProxiedBy: SJ0PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eb19b00-f87a-4840-ec1f-08deb03c15c6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|56012099003|18002099003|11063799003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 9hHSr2iVvgF0oPV1N7gQcBAeYfUMiUixuoibZ+oziYnVnVzat9b8IgV2cBeSRBRRrnPSc+KhwIR0B4KxducozeHF//1pfh3EapiSobZ+A8m4/ZToCF5i4HdMUJjXzCAk87lQZfvVy6UYQ8oqbyi/VcdYAu42I3K9cvhVcRS0tzHRZqRLzEOTb4CpQCl96OYt6UQ9NCC3iqLgzDBjR+RalMgXHbdvqGF2rsasi7XV1f0KJDCoOXG1X/rPjS1xW5VzQf+gDWLp3OSFzgYTC0a3Cnqd1+PR+zgnFBPYXkw+XsWZzt2wX02h9oIm/wVx/khScZtKy8eRhs6mfBa4/bLbNsy8DZQi6xP4cQBsS/2BIBOZtI/YcUnhy0FIiUvI54IdN3mMV7vr0sAf65cCfCpM4DMGC0pLmWqs5kzfc3act3AzK4nDz/2Og7xUe0gbr0nkm4dFbRtZaan6N1WoiPr7hIFiSvbIh/W1EEKvY7yaXzdtXFFjWBNuhhv5QfpmMWKuKMzDZpbzdv2uo6pVXpM198SDQmfrOhs2/Q+qf5X+yE3009xguvfvOMS4pxftydY15ohbJFxwA56xe9rR4my2CrI+eEfGAiwZ+Ig/L4xOuTnKeBdtH1HqKEf5dYVev82crCG6CVwQfMUZUMyGyBMbCegCfyzWnD+7OieFb5FAGtV4FpGnos2Rxqsg3IsB1yix
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(56012099003)(18002099003)(11063799003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?iso-8859-1?Q?G8KDcb/jJfXwR7N7VLG/R3vkkyk9NbUuln64Kwv/IH9GdGy7C4dQkwamfa?=
 =?iso-8859-1?Q?yd8C0dulCdM1bHuaJymduxuWjnqDFOjLWScTALgOyj8UrpleEbXPlDnO0F?=
 =?iso-8859-1?Q?m37yxsU/YX9u4mfcmM+itS1VmWPCh5g+mvne8dp7WUVHkCKV0i1Gx5/PL7?=
 =?iso-8859-1?Q?X/UHy6/ESoXTSE/mjqILquWyuENUpMaUs9Fcl4wKkt9JvtBlpQwxMiTl3M?=
 =?iso-8859-1?Q?FuAoRrXHXZYoxHtS7ITyxs8gwp7Qk9RPCl6BoelPFWchfBCFCKfJVAne22?=
 =?iso-8859-1?Q?O9/4StFOhMOiEAvk3iFK0weHucosLhkyPv97UEAZwHUoC/69ukG9E1AKXH?=
 =?iso-8859-1?Q?K9zhaDt3CueGr55hhz95Opd2bIrutIYqxlI6msLGb9KUCcxIjywTUX3XUq?=
 =?iso-8859-1?Q?EJRWpM9fy1da9i/0q6tzCK6wH6zBHbukKQq9wqFy03GKNf2aTS09QVNphP?=
 =?iso-8859-1?Q?JfppGTlIy01/YV0J0bxoynw0UQ3SV0/GSlFOCZkc4CdwTTqK7zskdtClyD?=
 =?iso-8859-1?Q?qccEmw/s+W0V3J3lQq7mBjsXhskGQrXohmke2sLf77ykrdxnaP18JtMZek?=
 =?iso-8859-1?Q?AX94iJunQaWBWnPmR9Xq2KThquvQz9aevJOGNVeK7R1fQJUJbQTd0CopnA?=
 =?iso-8859-1?Q?UZPBU+FD3dH0Z4/GIGkneho7KUjfB0O0WPKMk72Zw3zF/cQoS8G1BMObCr?=
 =?iso-8859-1?Q?j+ZX2x6Qw3J7T4gXOfv3Ur3pTvFMPUAT6RduqYYukGAlhRdo27n1YXJu9X?=
 =?iso-8859-1?Q?TNMtvz5aCVT9i5ECecWe3f0uWc+ZyKN2F/QybzvehjCrW9BVzPh0G5dJzh?=
 =?iso-8859-1?Q?EP770TYt9uqxkMeJGHg4h8+SWnwpJ7VS6ugvZDjVdHpygYFH/2s4wkhusC?=
 =?iso-8859-1?Q?19xpUUT66qp48ajc0NT7P8sX0TYXFyQlAjNKw3e8uyWp94qq87mWCw/dB3?=
 =?iso-8859-1?Q?LMpFPftzU8nPbhCVsFHb8zl9vjtQDR+Zk+k2jx9+tnfXjWithQZSO5apd7?=
 =?iso-8859-1?Q?cMkJVBRziJgzZu+wWd50PlN7dtmooCXhqZ6hpemD7JhruzI3Qclk9qi6z6?=
 =?iso-8859-1?Q?5zfUkBSuAwJY6WGFkS2Wlh4a9DuvtpUENLjWO2r483PPE2cPYDMkIl7VjL?=
 =?iso-8859-1?Q?CFRTJJxP+zSYtKbUAaHBnAzoNILfsg9U127UgzQBL68ol/wuCbl1MRXuwB?=
 =?iso-8859-1?Q?pQjGUfgPXAmziiF0zuuPEM+h2WGVpWKTv+XVTqqSIY3rmSe2YH9HX2GUos?=
 =?iso-8859-1?Q?kyoiA52E3YcAZuyTdW5p/xtL+dGAbcEQQ2r4MoSS6YBNPbqFmp+o2+v4hz?=
 =?iso-8859-1?Q?7ccfgXCqLu83q9XkO5mcx1MkjcAHrBptyZGbzWvFWycdpzExHur9LSdPuy?=
 =?iso-8859-1?Q?jQq8NmWz60N1uB076lurQ3HHQw1Nano/LrkGiZAcOdaDAbq00u9oVOc/25?=
 =?iso-8859-1?Q?NINTDGvCwSNzYtzegWml/+ZeCjxYMhR4FL8Q+jsX8ai8biqGp7Vh0PcfQo?=
 =?iso-8859-1?Q?PHb48wgQeFa05+9qOF1ZHj+RzxVfuIMxg7EVQzgpi9YThSE9qfK3hx8VEa?=
 =?iso-8859-1?Q?z286kmaWMok/wh45jKcu0wOdygLG+6kozIuEEjofuW7jbKrOeEbZsM0BZa?=
 =?iso-8859-1?Q?NVmcJxoXoeMwm9diouVXXcmqYprJUnCsjAtUchwRb+FBq6LyQJ6Bgemzkj?=
 =?iso-8859-1?Q?kIhwlqNF07Und/axYFWUtp/fnOtNyk46mW9B8ngFrBUe93ryI/ar3u/nrL?=
 =?iso-8859-1?Q?lL7x6zmCeEMSbFbyEi3klm41NS+nB0UV16yUUEFK0AvZF4/G7dzILiisgp?=
 =?iso-8859-1?Q?I2eZYaj33Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb19b00-f87a-4840-ec1f-08deb03c15c6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 15:35:24.4853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddu4vtNp+3E6qzxW/R2NKTT399BhSwp4egq7WzaM2zPFJE7Rxysa6Imhy6B7uV/SUqX+1j9Hjau8Gv4pmenZEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8456
X-Rspamd-Queue-Id: 5D2D3523C37
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[nxp.com:s=selector1];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61282-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:-];
	NEURAL_HAM(-0.00)[-0.922];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email,tq-group.com:url]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 05:02:42PM +0200, Alexander Stein wrote:
> Hi Frank,
>
> Am Montag, 16. Februar 2026, 20:18:38 CEST schrieb Frank Li:
> > This 3rd time try to support DW CSI2RX support for imx93.
> >
> > 1st: Create new dw csi2 driver
> > https://lore.kernel.org/all/20250701-95_cam-v1-5-c5172bab387b@nxp.com/
> >
> > 2nd: Based on legacy imx6's DW CSI2 constroller.
> > https://lore.kernel.org/imx/20250821-95_cam-v3-0-c9286fbb34b9@nxp.com/
> >
> > Now rockchip create a common DW CSI2RX driver at
> > drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> >
> > This time base on rockchip's implement.
> >
> > i.MX93's version is newer than rockchip one. i.MX6's is more similar with
> > rockchips.
> >
> > But i.MX6 is too old. So start at i.MX93 firstly even it has bigger
> > difference.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> I'm trying to give this a try. Did you actually manage to run a CSI pipeline?
> What did you do for the D-PHY driver? (please refer to csi2->phy = devm_phy_get(dev, NULL);)

Use old thread PHY driver
https://lore.kernel.org/imx/20250701-95_cam-v1-2-c5172bab387b@nxp.com/

Frank

>
> Best regards,
> Alexander
>
> > ---
> > Changes in v3:
> > - use dw_mipi_csi2rx_has_reg().
> > - detail change see each patches's change log
> > - Link to v2: https://lore.kernel.org/r/20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com
> >
> > Changes in v2:
> > - use enum and array map to real register offset.
> > - Please keep the order:
> >  - #includes
> >  - #defines
> >  - enum and struct definitions
> >  - the rest
> > - detail change see each patches's change log
> > - Link to v1: https://lore.kernel.org/r/20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com
> >
> > ---
> > Frank Li (6):
> >       media: synopsys: csi2rx: use devm_reset_control_get_optional_exclusive()
> >       media: synopsys: csi2rx: only check errors from devm_clk_bulk_get_all()
> >       media: synopsys: csi2rx: implement .get_frame_desc() callback
> >       media: synopsys: csi2rx: Use enum and u32 array for register offsets
> >       media: dt-bindings: add NXP i.MX93 compatible string
> >       media: synopsys: csi2rx: add i.MX93 support
> >
> >  .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  47 +++-
> >  drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 278 +++++++++++++++++++--
> >  2 files changed, 303 insertions(+), 22 deletions(-)
> > ---
> > base-commit: ada3fa02f7a95623b724dfe300fce6f49cc2d75a
> > change-id: 20260128-imx93-dw-csi2-b472ddcb176a
> >
> > Best regards,
> > --
> > Frank Li <Frank.Li@nxp.com>
> >
> >
> >
>
>
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>

