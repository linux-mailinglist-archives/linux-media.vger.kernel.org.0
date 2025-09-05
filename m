Return-Path: <linux-media+bounces-41865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E28B45E43
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 18:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BD293B74D6
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 16:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53244306B00;
	Fri,  5 Sep 2025 16:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Lm9ELflq"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011050.outbound.protection.outlook.com [52.101.65.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F522F7AA9;
	Fri,  5 Sep 2025 16:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757090150; cv=fail; b=S1sc/VxDRxTYtlOmWlzEAMFdC0q53bwE2gNQtseHIrZ9TIgevRqMq9N+yOsksQQ5o4pngtYlNug+lGLIMUgalnTKz6sSePwbNgQ/u+LdtJ4thRDcKHTuBCAdNw4FTA5n76ppqkKTO2RtWVUHm/Nd3icq0bfj9WnDxd9mg2IU+uI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757090150; c=relaxed/simple;
	bh=2RnfDBIdYnxuDP6P3P3cdY+v8s0DlC2ZalRV8SnLXp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qZDijRTZMlYWUbYiLPBVObow+f8y366r86r9N8/cUuTG/3z1f+6DrPpXBvGGe4Z2rKNhOgjxZdak7JbmlgJbINShOEGfDZl/LiTcinPW55Wwydqslyv9YuzFIo902uRGEePCBIci9Kzb2dDYTOYaX+rQJRsh0QY3MxV0DsLsD34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Lm9ELflq; arc=fail smtp.client-ip=52.101.65.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vheFUebPZbiv4WmS1pGJcKekFfv8l6Tk2zNsFeLmzPCVpLHpH42tZYJIRJWrSS6ef836q0R0Pt1opU+8Xd8z6j2By5G9XgBG/u32kzKcnRzR/FsqazryQFn1XbbXXD6SN1+mMpvfRPK3dl0hDTn5o+fHARJQpgGFgW3XDbViyP12XEgpSYG68Jifub/jmLZuW/kSh4UuzDxeejw4I7pX5fnAN+ZT6lWc+bg7T3K1Z7gEVvQceBdBUmn40gJ0TLa/5pVRH7/jX0pqQX1EB5FAfeQjkUqfehMQj+kh0jykDa3Oi3rNZWbIb+//ysey5oQsFJgkRs0/kDlYXzpdxkNTMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVWRRKcgFzA5BLlMDeghbywTUl/yF9aqBeqCH/Undcw=;
 b=cZ/1/NOhSFO8Aajhjft4AY89inKYu+IdI4AiprKkNoHlxPBIroji0RA3PL+QvmoRG/ahcErQNU3Z4f81h+jzlOeWCHxnyvycyKKwAPMRkyyLyGm6p/SiVCvlkrk09fYjPvc0jk/vbYMjPiW2akYI0xyYZIHfFV/KSA4PjzoDI7MmXzGUubm3peTP0i79PbEJfZyWwr7NVcn+ksrSeYQcA/BMq0OXoAcOtdJMweP2TcQZUUnBH0nykrPVGGYo5O/VcHytAiIujgr3OWOT8zBphFltppNvEWLzSq3LC0+f8YAlgT9PJXsyFK7RHH3LYybaPkTvN6dmJGSr/1FJUuZoDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVWRRKcgFzA5BLlMDeghbywTUl/yF9aqBeqCH/Undcw=;
 b=Lm9ELflqHU1yFZM1Z7fmwdkHiCXGPJTClElB6B3O6mhhb62cG78UoH5zV5YV6LopoCiUqQS8BOfO8tdgyKr7Zx/K1G5cVfiD1CU8/uwcpqJKNrj8Fnz+6ECWxpc5S5i2/JJzMUyigEetMYQ7ljPKoB4HGmfgm8qRiBNvWaMg3QRjsJLeeVY7e6vrgX1he3cNaqMTcR5YmMASjT91zCyix4t27ELi7q5PncN2qdBK3WvER0qh8RWMZwNZLleEftojB+BSDCb5kYKbmNSfU8e7SY21BVQKpeosoPCwWslfCJDEHDbAnkaHMoszZgKm8lwnTtpfi4Gj1SahyAyNKNdwPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA4PR04MB7503.eurprd04.prod.outlook.com (2603:10a6:102:f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 16:35:41 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9094.015; Fri, 5 Sep 2025
 16:35:41 +0000
Date: Fri, 5 Sep 2025 12:35:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, rmfrfs@gmail.com,
	martin.kepplinger@puri.sm, kernel@puri.sm,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, mchehab@kernel.org
Subject: Re: [PATCH 1/1] MAINTAINERS: media: nxp: Add Frank Li as reviewer
 for nxp SoC
Message-ID: <aLsRVWhK2mT32Kzf@lizhi-Precision-Tower-5810>
References: <20250904161720.514889-1-Frank.Li@nxp.com>
 <20250905160453.GA21773@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905160453.GA21773@pendragon.ideasonboard.com>
X-ClientProxiedBy: SJ0PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::33) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA4PR04MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: af585b21-42fd-440c-e661-08ddec9a40b8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?z5ka3z21VnNMn3ptj5BIjQLiQhqgH18j4ARD33RmneU4MlW0AjekJCz26jJR?=
 =?us-ascii?Q?fbjhPq71g8VYMIXKRWVbQl/e+lgT4T2q6PWZSTTsJn+WrWl1dIt6qFODf95w?=
 =?us-ascii?Q?stMkO/UipR3Rvzsc6nzVGINJNyTTHorvxOB6Xnm+j+3SUtumHQMgsV5ujBFF?=
 =?us-ascii?Q?Qbqz6aOAfTp1g4pxiLdyrLRvXO1l2j7X1LVm+yT6OD3w9qmESf9SHt/Gfzbu?=
 =?us-ascii?Q?5329D1zqd4Ze3jYtm5FmO2jkTBW50Nc+g9diP+35IhWkiYkyeK6Hbzr7RJRl?=
 =?us-ascii?Q?0XmEoovKsnl3mjNHruvt6sEPJU8CjDYmpRsVFExn+cQDjuZlpw8SE5A4nlJR?=
 =?us-ascii?Q?EV3s6zNFfO1OnzLaR3R00dV/p28o1J2rReS6jXx1pXvFkLE5dopfvcA4UtKx?=
 =?us-ascii?Q?K7syf43CHzew/u6HAebMCj1ZUmM8HqTZ5K7NMy22pETaK4lg2AJIB7ygIbVn?=
 =?us-ascii?Q?csXlMWTFfsWObVnJZjB9gAKC1AVBGHst/uhpRbEtTnyho+PzNhlcvTfoLPgy?=
 =?us-ascii?Q?Il7gezs6DZvP4sBINdKoZS7TJaLxjw0VM0Ht1rikPB5dSAgbqsBVyQMhxWrQ?=
 =?us-ascii?Q?btLF/EFU/AgefbmiNf5q62Wbqbam3eKJoq1HTNX2DTjIF9rAmVNeuXstWPZv?=
 =?us-ascii?Q?WL3qkqNzaX8t/j3+Z3ggwaQbsvb44Zr134LtCseWNOGdc8dpCZJFZRDFJlwy?=
 =?us-ascii?Q?FlXebXVY/mBRNEmo4qtlkjBOfm4Qe/nKiZgtwobRt/7/MuvQpBQ/2NwNUma8?=
 =?us-ascii?Q?3J72usEVGDMIGtIx6hlsiqeMxh48XS3CwpT2JyR/rKzyc5FKsAE1sqMatR0M?=
 =?us-ascii?Q?tddHQuREYLgR4HWs61XhG6ApNRh2ByEoJCHF3Rp0av7Zy3p2yu3lOFCScIce?=
 =?us-ascii?Q?6urapUz3LY2BtSfLt6cWc1X+auUhQer4h88Ex/KcLuV/rX7BpfGrpvNVBDbp?=
 =?us-ascii?Q?RCCN94JcGwINyhbb06WLEICz9ys45gZjlSHa2NmoHSTdOSxlQTrJ4KhZLjUo?=
 =?us-ascii?Q?7kuki+gZ/sLpfKIqaQ21EYv55IwSpgeHib9m++0nSC2saWOvw1qx1zkeRnSS?=
 =?us-ascii?Q?ASgoc8C3XV4/FOetdFZzzZDt+JHI2Ae+9rrRQXf6J/Mgb0GvHF60DvKQngGM?=
 =?us-ascii?Q?C62odjWdaOLNuXYp2SunijNWbgbOLxcugVIYAV5+V0dOfcJNP/StsdznN1yZ?=
 =?us-ascii?Q?wYrfF9ZAI7nFPfQe98sNtqhDit0djz9RnTOYNXaomk5aAEgKL2v7s756l11M?=
 =?us-ascii?Q?dHD0eDazx2GHXWrK2tID2OM8J3ldcifFc9S8BDgxxYgNk2e5NKvnFyTcGvaC?=
 =?us-ascii?Q?1BqGGmU0Jat+9UAOM6677LQEupJEQRj6xZetD8AjQcxz+CKNhjgPdtLMQYEx?=
 =?us-ascii?Q?/a07f7u10Etay7CQCstFgg4Bnz8FjvfQJQp+EA0tYLt6XE3wDDyVAf2t0Fu6?=
 =?us-ascii?Q?2wD7h+xBQiUpUMi9mQpi970/dOjKzfpK?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ogfUWdzQNeBCWDh/CyTUfPoGZXofyBG1IWRjlGSJ34yKheHxlt+2F/HidPCY?=
 =?us-ascii?Q?WzziO3gvvNrw1/ZXfJWmJwVI+JzU8yA9LEdfOKlDUYPU8wZRvn/F2gGVBmpi?=
 =?us-ascii?Q?AZKncq+AH/O/LniKF7baeYuW+U7rqwAPgEGhBOmFC8yH/hSp9YTAJK+janmP?=
 =?us-ascii?Q?3nBtkvJ0SWyLnzmxxIgvvV8c/i8ELsHqZ5ISIHUi9/4VdSGOByKXR5mb0MRs?=
 =?us-ascii?Q?dcWHVZeI1RVLQ6oYInuORD4dNEGe+UG8xGTMa8OlpOh0p7WBLuSc7VFqYAiw?=
 =?us-ascii?Q?TnpxdUCxUyKUjZ7mKSNneJkWWF9J5d9Ko7PmX7MbA1Sdbsm4NWF0vEnW5OMq?=
 =?us-ascii?Q?m92z5mbsrfFI0bT/iHlhV2MMbNY5Lzig//a9itXgAcLp5uwmh41zjNiXI8ph?=
 =?us-ascii?Q?0VEeiZZ3YVK7oFFzt0McvLvCQ9/SnSNJ7vLuQyU1bwqpIZblpmzx9nv+Ar1Z?=
 =?us-ascii?Q?vWQJQwQT6w3DI/eBODAdVIPifQ/BN2YxiAMs7jcLbbeXejXcKD2eihDC5+mu?=
 =?us-ascii?Q?PU7v40d2EaIEvJuE8UEHhDr5nLbF09eyIe3u+fUZJ36w6Mg0lEQpFFViX1HI?=
 =?us-ascii?Q?in1II3/WHIoQfSKMTXjkhSRXkVyy7nlrl9xVHfcbj8WNAkPQZ5aoDKopFEoe?=
 =?us-ascii?Q?2KmMboRT91xmSUUDq7cVHM4hkX02TXhVms/W17kDko7y5k0G9gcWh7ZxH55G?=
 =?us-ascii?Q?gjC+IT+ZPlnHjQj+jvHNN1n9kOvk8kdIG3G0FzGPD+kNDB2AiZF7lPcl4QBG?=
 =?us-ascii?Q?8p0DKoqHQGzFx4dJRx/A4hPL+x6oQJMr6rwUOyFe54EeldFBwSKkN1AupeMQ?=
 =?us-ascii?Q?nE59LbhiDMphdUTSj8I1juQg95fMBQnPacDcNd3emYsYaOZsttPDwUM96PB/?=
 =?us-ascii?Q?6YmZFN46ok84Yf/rMkhnm2Qm/H3vyff8mzMSRiT/az6j1/qQq4rwi02yGGml?=
 =?us-ascii?Q?yI44OZcQW4C/eFFyOyA38pZhMr29fFEmzkxum82ukJ0BDs6QceKyh4y9+AS/?=
 =?us-ascii?Q?hxpNpcbc/S6b/HCqrBUTPDrRwiyIBL5u6lFbN1WbW+pHBFRIxCG7jL/VH7CM?=
 =?us-ascii?Q?Le7AcydcO8HfdLJmiR03OCAdnabAzlifc1avzmyEiJ/sBBTaOx0Gw1O5a6GK?=
 =?us-ascii?Q?cPQY9a3XOH7zQvqptAETG45Oy0fic8SDmodUNPfPgtC+0JCVekkGWQf1Fa85?=
 =?us-ascii?Q?5kRKKaRczLnWCZ+sDgCyWZIbTiHyftpIP4jB8+GY4FbuMsCt2ad3EfWmnf9v?=
 =?us-ascii?Q?IItOcDNIVqAOZFdQjRkNVKuT8oKhOL2nTCdWRN8kzHdoRUAt5ZHWQsuerWuf?=
 =?us-ascii?Q?c6Ft0e/ksl7bCsnLBVZ6obp6ryxKY1pgkxm1ki5NXk5gWHY+XYBbWwBEeoj1?=
 =?us-ascii?Q?zx8DUq6QYwP1MD4GtoO15Wi61jVqS7Dm7YvrTpVGTBLrxYzu6szO037WxNxA?=
 =?us-ascii?Q?EQr75tkozdrUF7RTZMZsw+202U1/VOYlQB93W0PkXRYl2/oRZFsMxuAmMn1/?=
 =?us-ascii?Q?xuOIyRD+qQ2FmmxKgQJDkS6WltH5SIYf8Sh2EuaJUrg3yXNauzgBowfLfRGF?=
 =?us-ascii?Q?gu9AVwOmB//vGptXkbK7Zlt/AMaiNbynkfWiLUyQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af585b21-42fd-440c-e661-08ddec9a40b8
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 16:35:41.4007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ir3tsomtxpdosKZJBU4fedvUAuaGTDVjtH4IW5g2nm2tI8dfv8V2mIqXdLDE7xpJESCRyvohJ3B5npsoNdU4nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7503

On Fri, Sep 05, 2025 at 06:04:53PM +0200, Laurent Pinchart wrote:
> Hi Frank,
>
> On Thu, Sep 04, 2025 at 12:17:20PM -0400, Frank Li wrote:
> > Add Frank Li as reviewer for nxp SoC.
>
> Great idea, and thank you for volunteering ! I really appreciate your
> help with reviews so far, and I have already mentioned it in a
> conversation with another SoC vendor as a model they should follow.
>
> I'd mention media drivers here though, unless you want to volunteer to
> review patches for the whole SoC :-) Maybe something along the lines of
>
> ----
> MAINTAINERS: Add Frank Li as reviewer for NXP media drivers
>
> Frank has been reviewing NXP media drivers for a while, and is
> volunteering to continue. Add him as a reviewer for the IMX media
> drivers.
>
> Also add the NXP i.MX platform mailing list (imx@lists.linux.dev).
> ----
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Do I need repost it with updated commit message? Or you can handle it when
pick patche?

Frank

>
> > Add nxp open source mail list imx@lists.linux.dev.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > I am work on kernel community for the while. And upstreamed/reviewed:
> > cee06ca7a6748 media: imx8mq-mipi-csi2: Fix error code in imx8mq_mipi_csi_parse_dt()
> > 51ad3b570ea7b media: imx-jpeg: Account for data_offset when getting image address
> > 642b70d526ab8 media: imx8mq-mipi-csi2: Add support for i.MX8QXP
> > 382d53e9cefb3 media: imx8mq-mipi-csi2: Add imx8mq_plat_data for different compatible strings
> > 859278460faa4 media: imx8-isi: Add support for i.MX8QM and i.MX8QXP
> > dee8521f69874 media: nxp: imx8-isi: Use dev_err_probe() to simplify code
> > 73a40554f979e media: nxp: imx8-isi: Remove redundant check for dma_set_mask_and_coherent()
> > 60b8de2b9b4be media: nxp: imx8-isi: Use devm_clk_bulk_get_all() to fetch clocks
> > 66ede6d71d4e8 media: nxp: imx8-isi: Remove unused offset in mxc_isi_reg and use BIT() macro for mask
> > 2021b8d51cdb5 media: nxp: imx8-isi: Allow num_sources to be greater than num_sink
> > 038d27acf987c media: imx-mipi-csis: Use CSI-2 data type macros from mipi-csi2.h
> > fd5b6cd730676 media: imx-jpeg: Check decoding is ongoing for motion-jpeg
> > f65fbf8c3d671 media: imx-jpeg: Change the pattern size to 128x64
> > 7500bb9cf164e media: imx-jpeg: Cleanup after an allocation error
> > faa8051b128f4 media: imx-jpeg: Reset slot data pointers when freed
> > 46e9c092f850b media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahea
> >
> > On going thread:
> > 5 patches, https://lore.kernel.org/imx/20250729-imx8qxp_pcam-v4-1-4dfca4ed2f87@nxp.com/
> > 32 patches, https://lore.kernel.org/imx/20250808-95_cam-v2-0-4b29fa6919a7@nxp.com/
> > 2 patches, https://lore.kernel.org/imx/aLbdRdS3TmLHjW+Q@lizhi-Precision-Tower-5810/
> >
> > I am volunteer to review media related patches so add myself to MAINTIANER
> > so I can get notified when related patches post.
> > ---
> >  MAINTAINERS | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b3ca0ba848879..2884a5216b427 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15327,6 +15327,8 @@ F:	drivers/media/pci/ddbridge/*
> >  MEDIA DRIVERS FOR FREESCALE IMX
> >  M:	Steve Longerbeam <slongerbeam@gmail.com>
> >  M:	Philipp Zabel <p.zabel@pengutronix.de>
> > +R:	Frank Li <Frank.Li@nxp.com>
> > +L:	imx@lists.linux.dev
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >  T:	git git://linuxtv.org/media.git
> > @@ -15341,6 +15343,8 @@ M:	Rui Miguel Silva <rmfrfs@gmail.com>
> >  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >  M:	Martin Kepplinger <martin.kepplinger@puri.sm>
> >  R:	Purism Kernel Team <kernel@puri.sm>
> > +R:	Frank Li <Frank.Li@nxp.com>
> > +L:	imx@lists.linux.dev
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >  T:	git git://linuxtv.org/media.git
>
> --
> Regards,
>
> Laurent Pinchart

