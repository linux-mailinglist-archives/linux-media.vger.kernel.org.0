Return-Path: <linux-media+bounces-33196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8040AAC13B0
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 20:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E0803ACA35
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 18:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7981DE3C4;
	Thu, 22 May 2025 18:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="USwx1i0c"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED06E148FE6;
	Thu, 22 May 2025 18:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747939788; cv=fail; b=mZCQ0ol7ERcwN14/8oFeE0xLYeBQSRO74MgPNjOR9V8a7ZZHHqpInhMf/3M4BJn4cFW094o4XkUamqYbep2qavSilqvMyRqBPww93C8DPd4029x3oUfb8dJM19YfnGPGxFAdQDrxFf+oq/Cm+XDNDbXybr9xLh/JGsPHDX43dn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747939788; c=relaxed/simple;
	bh=kaujDvTfaB6fUiJ5VTVst46EQl/Hj9B+axoMCb+1sSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DtB6INRDcu+i9OFOiu9OPeeINHG+ysStGoy7fHA/8p4jUqxRGM8oB0y760Y2Emv4XpRehQ5u5KAo8TCA01U/h2qumgUXaDCsa5y6UyvWcTKX2ElfhhNrDgYqQhVkbDCnX+Eb+qGUJrVdiAcgg7vclNzv8AsnRUgRL4e/ZLEpaPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=USwx1i0c; arc=fail smtp.client-ip=40.107.22.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y73LyyLdUKq6getaaeKO1DRSmYBj/3yvuMsZ1OoTEuTbInw8icILO7UEBnVH5bJzRHUclkrVeqKSZBMM9mAEzypoAXrlUf4h5MqAjrwbvGRfuqvjEtUJ0nI7TYPiZ3unZlioSrawHsGVrPstKf2LSbuoLnzh7qa+HYutv2nvawzWSeDL9E5EM1fjHrUD1KsxOaD6cr+jEoXF9XU+EuZZw3bLlnOgmrtxChdo3GDMcD7oz/o5CDhx7crnqiAe8J2XC11VQyLkAAQ6gbmMJBAVJG9k5uLPZs1qUQTuydPNo1YD6rd17BDzpB1omJjzb6QrN4AweZR4GtijRZocknlPDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2Vkjk3KbxQl8MGvj1AvOj6e3szqrNnLjkcPVgGLnzk=;
 b=jyNl5OXa+tb31zKQ3wZd4uNBOTnxjub6n/PNnRdsqUuHB9T0FdjaXVKoedJm+7OfzEecrwdkiNtq7KzMOnEQDMhJVkWycYBMsP5EvU0Xs0hEvPbfBLQLFQ9KAyKT+VXJpKe2NcjLFLY0/MDSNecWMV+SgvLnhEDpHSoOlTdFl/1gyzzrfreT9GXBK5QY49CxHz+LuZJ+ZiZLcJhWEgCYe35MT4dWaFDklDcd7kOB1VgRpNbCbWv7dXmV/4eQs7qIMZq93AfLopPqoPJHgWTJvvUoZuW7pIsBiAWEUI1cSpzU13Q3aqiwixm1/u47r5SYnmk9lDkJQ0wGPNLCKJ//Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2Vkjk3KbxQl8MGvj1AvOj6e3szqrNnLjkcPVgGLnzk=;
 b=USwx1i0cWV1SXvQ7AHGC7M7TkXAarYXDgJumokMaI+PEEQ/pt5TjLFG4zSpiIniW51YMGk8GveDkcxuEHUP6iAKQKs+Aeq6TFawX474V2KlBv99eMOKdMRgueuL12W4hzz2E+1s7GQsXQshEv970OQ60zsBcgR5uolUQR8s2UHr5ss9b8CVAIj35By3+dl5H+Xg2ZU+S6UmH5ohY4EQrzHkqSA5QX0uoKoMtDBAwo0SrE4WkX0f9P7EpG99AwekX8sxnMjKsM5EnOylMtezQB0x50EJ7Gc1U1YHGZjj7eTAlDDdwRvTmmWmgUDjHJg4GJEkbcfJvjHuGI3oF92ijlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10197.eurprd04.prod.outlook.com (2603:10a6:150:1a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 18:49:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 18:49:44 +0000
Date: Thu, 22 May 2025 14:49:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: media: convert fsl-vdoa.txt to yaml
 format
Message-ID: <aC9xv08a5k5Pz1t+@lizhi-Precision-Tower-5810>
References: <20250411213601.3273670-1-Frank.Li@nxp.com>
 <174448105342.1415739.9619142538994119426.robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174448105342.1415739.9619142538994119426.robh@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0263.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10197:EE_
X-MS-Office365-Filtering-Correlation-Id: c5a5f54e-5c79-41c0-8f06-08dd99616aad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZmbMvZcpJSDFE/rMZefAFmJmSNYckxLpe+dOTCnP0CB7yzEkfdRPwYr2qULS?=
 =?us-ascii?Q?Nf61qXttwvfiI1SIN/pWHNzCfFhINcUTcpQjkAtNJacCbwXmWvLNvCKfsSph?=
 =?us-ascii?Q?eRj6Acyr+eJMOYOzvXD3gzss4PexAZY6mdZnXzhuxLs3fu6AnX3WJbSlIN0O?=
 =?us-ascii?Q?xuODiRCFqSn2QqhJAZe/P+e1T49GViiToYuuCPSszSxFBi/NLAXTGL/3AAsW?=
 =?us-ascii?Q?eWqgu+BBpmaN8Z3GNDAjONcHnwS56c1ZY8P8/zSvg1iXQxWVP1/9mxppvAsH?=
 =?us-ascii?Q?+hf3AgHpkIu+0JL2fmaqkjAHV9vchncAdNxMb+l4zy7hPAngDKCq0/UcjQb6?=
 =?us-ascii?Q?MkX/oXVugQ1vQ0LaWFqYTbnwpi86XZOLiykJWH6J9dElbG5PLSzGETkG6PII?=
 =?us-ascii?Q?yAjQ1ongi2PYwUQn2gFGAlX2AZpzwP8Zy4TfslsmlT9GbSeqJMQLy0+R+XDu?=
 =?us-ascii?Q?DJ18loD6V/RuMSgDzlemlMdogKQ0QUKAJ7vvLqdJRbMwW1+Evg19ZlbRMGTL?=
 =?us-ascii?Q?p4/1rJOxlh3uouZNyIe+u0AAfH1xZ7jhZ3sIve/+ir21h4qruSztDz6Y26lI?=
 =?us-ascii?Q?OwaMwaU0xK5OMv8OLW61fTnyVoyGhpCnfaLzlGSFV2eGfgJ4T0p9zOUns5lb?=
 =?us-ascii?Q?qml+aupfK5nIhVvxN+SuDUGlt5HkXdiOxbygH4lYBZj4iXLLDXQXTKmuui6L?=
 =?us-ascii?Q?9Sy6FrM/z6AWefqeFTS/45Dv29Kw5KDu4LgHCLByqRcsN2a3sWSeH4/1DK1I?=
 =?us-ascii?Q?VnLLlKoQTVOH9sjnyGP1M4PVu+CVccvHOfbMlW3z5fgiH2miGITcz8ozbOhM?=
 =?us-ascii?Q?H03kOgYWtxXa5b7VkAgGTygbcx9ew1iWAGSPuIxQAnm2UKv/fgsY+Ic80PaI?=
 =?us-ascii?Q?NDFPMyKXaMMLoHDvcQ3TyaigEPVLkzBrv+fy+oYNA8/VeniHRt+KC0RqPPRb?=
 =?us-ascii?Q?L1bpUNd5I/GZi4Vc1j3jA7QfgC5/Jv9cT8Or6ZtLRylKwsjNiILnIFo959fR?=
 =?us-ascii?Q?F2hcyqs9Lk1hJypPQu+mykBst8Y+B8c2UArX+ALnbtB5pj0kyB9EHoa442bg?=
 =?us-ascii?Q?USw7ZegALJ6kTbOPpuFaE30AD3MknhobWZ6MkC8Yo/u1n8p4JPvoM5/RUDr+?=
 =?us-ascii?Q?yE5Xvs8/aEwnE6LYhcgvgFkqtrKAxgu/Z1vCyCBJZhBP6ySzWv8th4LdJMBX?=
 =?us-ascii?Q?jcaW6QLYfd/dZfB2ZOqFuRc/rSvcVSEKt5YsNZ8U3aKu/sCakfUOqr8kpOnT?=
 =?us-ascii?Q?tqxlYrSh328s5Bo0wuUln+COaxNnkqqrOzbEdzvOFWknLfS7GVs1O2LmWnBK?=
 =?us-ascii?Q?CcRqT8HtmI01Qumc8DXNhVePzG5DXRNEbW974aI6OQDQHuqntJROJxshOplo?=
 =?us-ascii?Q?QqVYDGCra5bD2v8vEBkv6nLJbzb1ebQxkzNMLjLFfl6qMzjoVIG2mM63/V7d?=
 =?us-ascii?Q?xTMzQZ6sSNKNBxq6+VSy34Y5mvJaZGwxZFgk3SCXA+nnBQwxzOCNLg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8HCD3eK36unScKoSHpzVvJphAY1bUt57bBllNeIZ3lUiC5yDSHXtBFbXp6Q7?=
 =?us-ascii?Q?oDvSiRfM+RNvj7smQ89/HWczPqMUNeQ3ktGTbXX28y8lJLEI285KWWFSU2Hb?=
 =?us-ascii?Q?CNnyVG0ZRyh/AjC0d0G8UKZ4hvTaoMcfteunYEwUUQZ+lbOj6n9TWOECZ68v?=
 =?us-ascii?Q?jQZychojIpz9emsPyC0EVj/6IKgJ5Y4wwRrycbYN7cXEe2o0NFjM+6C/5RCM?=
 =?us-ascii?Q?qnIpaCnofAc8xET/z1PyhB3Yp2YpSS/wvHb7z4YclK1EGWUjhNxMp6vQFq4u?=
 =?us-ascii?Q?bi3WySR7O5eqDvQgB2tLEYh5c9LkE3dDDNeEKgp5Rp+jfizgVS4fSXRcFI19?=
 =?us-ascii?Q?iNU+LcyBvDwe6I/2o2Xa1zbf5EVARUG6NCT6J1RPCM2knMbDlpd294cyVUbi?=
 =?us-ascii?Q?BooZwPhOQN8GIx2359ywUFipGmvDc+B3qbCMU6VXJGRKnEmkFj4VSpTwxiff?=
 =?us-ascii?Q?OSDQR1qibp03CQ1Nx4We9mYlImTVxMRnBjBn6Y4ZLusTA83i/sMRD2tew3YY?=
 =?us-ascii?Q?nWPOkIDnztWZkOVu29m04bemFtV8m7ghrmkbmtp6MyHK4FM4L9/ClQgOGHzq?=
 =?us-ascii?Q?YyuyBoQGScu9VHVKPQhCTqAzgkLYrP35lEzDif0hfeT2SRShTZoxv0GYScAJ?=
 =?us-ascii?Q?y9XAuyn0a3+ePv7BbK1479oiCprU8vFcV/bBHKMZaGS0P3mjCMcEs+03vgjE?=
 =?us-ascii?Q?fQvzVJqExX2u61yuUDMwPL9aTL6L+7d3AUFBNHcEiDEuWcDJ9d87CoZztTPT?=
 =?us-ascii?Q?GXHH7YqQjBQY7WoCG4jdogrgkBOml/x87OLUaMcjaYirekQVjYEMGk7nwTcR?=
 =?us-ascii?Q?wLsdpotVqy5GfCa7K9ZKGNmJQWNCwADLZ2rREZP6bKu25lrrKvxXq7YRpejE?=
 =?us-ascii?Q?lcUUkHetVWw6jb11ybS6t41ijGDuuz1NkiADwLDCImmVAyb5grI8W2eax6H9?=
 =?us-ascii?Q?FKsaMoiX6bpEm8HGdrbxysHPhVPld8OJUYzc+wF5x7d5ySBF0GlvVVqEu1fu?=
 =?us-ascii?Q?9rCzvM9+neZspwxMmadNzS9NOyD6xRLeGTGcU1JliA1je8S/ONGhVOolhIuZ?=
 =?us-ascii?Q?/oj0mHvXPMMrQWQar7EmovpHv5lCkhGwRBZ8Q0B1NxvJk2uax2Wia/CshrG7?=
 =?us-ascii?Q?tec80LsuCVsDcFqEzyYueustFktlERqGZvruszWQ9liOUw0xkBbH6UcXNY5e?=
 =?us-ascii?Q?YkkjMGmTg/DA8H7lehEh939WPzMBD6OZFB5V4IsSY6dBgrnphOqVCZqnyteo?=
 =?us-ascii?Q?nAl29OP2157KwB5lsYGYD2pJqlbZW0uziOX1pfAWBQFrFlMmO6cTowzroNd9?=
 =?us-ascii?Q?zAFWvjKNLGPlv54kFmFmTxm8Wt8DmOLx2luSDXDL4vGSHmGP+l87L8oyc5V/?=
 =?us-ascii?Q?1WrKtzZw1KSZCj6pcwIqnJKxI/Gx229CCwUYiPyyPXQqexRhRjevn3K7MLM0?=
 =?us-ascii?Q?ASapiFLvvgQbF8gFceGcaT1FSysgqdQignrZaQWUfVNYdL1NqGcvPQsZjd9c?=
 =?us-ascii?Q?d3bqO6O/ED4HHJeb03WOOGDnsjb0qC96uKb14T1pvTUbTS4CAC9t5RmQ29CC?=
 =?us-ascii?Q?ta1iRZWdbaimzo7UJ9J3NZwlQa0a+sxMkKtbEnPH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a5f54e-5c79-41c0-8f06-08dd99616aad
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 18:49:44.0494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHuIqm6JouzudgtK+UGkB/cXYA/tqWxL4ocYPyiSj7ccG+izTk6eRJry0sfAQjH+NxYRw5FWcVUrwAu6tzykkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10197

On Sat, Apr 12, 2025 at 01:04:14PM -0500, Rob Herring (Arm) wrote:
>
> On Fri, 11 Apr 2025 17:36:00 -0400, Frank Li wrote:
> > Convert fsl-vdoa.txt to yaml format.
> >
> > Additional changes:
> > - Add irq.h and imx6qdl-clock.h in example.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  .../bindings/media/fsl,imx6q-vdoa.yaml        | 42 +++++++++++++++++++
> >  .../devicetree/bindings/media/fsl-vdoa.txt    | 21 ----------
> >  2 files changed, 42 insertions(+), 21 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/media/fsl-vdoa.txt
> >
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

All:
	Anyone pick this patch?

Frank
>

