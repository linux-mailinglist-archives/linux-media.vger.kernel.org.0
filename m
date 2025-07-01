Return-Path: <linux-media+bounces-36447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16360AEFE67
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 17:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE88E1C22D68
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 15:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3ED12798F0;
	Tue,  1 Jul 2025 15:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Qu/MAypY"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013002.outbound.protection.outlook.com [40.107.159.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C41278E71;
	Tue,  1 Jul 2025 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383629; cv=fail; b=CMfk1/xX95ZZmdj7rzoFAMHuvus+duSI41L25ZRTMAN2tUDqmGO1l4ZkdnqC1k17GshlwBAC38zSzMFdgA/0M9wJevJzzwK/48XrjNSckR8TwoOq6/8OEyZzTBbgAoMuQeu1Hj/eu2vkeT0COrAmKCZzG/ozsEuk5n4MokaGwS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383629; c=relaxed/simple;
	bh=0STHoDJyQZnFT5aSbc7YFtcTv3OyUu5Qbc4dmfJOrUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R/POouNCIIXtwUrXIF1TwhILfIAOBthXcoenYSUTmxukRYBkNB2RGWaeckC6IjlMqD2KNpprWCdBwi2Iy6X3RypJGa1vdJ+6dZuptezvbZUuRzBkbU9eI6LhhJ/GeAV1o8JLJXmwG8LDPPziukhW9NBswxy61u5EODsdMeMCX7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Qu/MAypY; arc=fail smtp.client-ip=40.107.159.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YE+OD6/3kcwfXQaATpYg4WIrkPHf11YoWvGNWvwWCuHv1UKXMIwOhna+d9dqKC5legKRlEVbd5uB+BBL3aCGYyQt3b4zxdjUZLPgP7zqyQtBJlcc4HHuxGUPdCvOGglI8zEi6CCUaukyUwPiXnV9KNcQdRjYuGWITAWO/yWXC/XnSNnL9uP8wfmwpj81NsAVLBJYTHi2zoDkeJObA5RwAe9+zjMpRe2J0E7ht3I+ArynoaneNKwxsy2lfdkQoVpfcq1j25T/x3l7+K/KYV3P5uI88394E98pn3NPOL6f3vrfHPkivUGsuhbtuQi8m6OKb6MzGJdcns48PmZduTqGXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1vAPUnGWR1pdyehsUwVSXIDRI7Be4eSqO7E0WhnYro=;
 b=O9XS5xFFGVT2TCuuQ6f/9HmeELf46vHu5CzJurZlBMaovaINoASVCZBQUaFbyZxCigiHI6SLavVbCMbej4TzvRhb+WoMjb/O0rY70+Vp2aNgt0OzikhBP1+MVJJxrmpKeqn1VoRcA4nz//9lGiou0BwrhD3AEHY80UwavTxtmrj/6ifau1TIlN/xJn5cQMqXMaCtShRS+VaaJAiTRdNwbvyiwEdkP2Pv34AnkPVlB+abtNhx5AJM/lSJldWgS2+jpstquwPDOIinUKDX8uB864Rb2Kg39CIKHgbMS2QSVMGfKVJGESWPNvaIMQN51LG/NqoJGjzmR+ks5IZMHBpBcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1vAPUnGWR1pdyehsUwVSXIDRI7Be4eSqO7E0WhnYro=;
 b=Qu/MAypYun+o5o1IWBTXPOv39s8xEutkQKm6Z70kq78QlOvFdsPW8YosDorZaKIiy8kMSSgp80BeVmv6NGuS6ALn0mh/vsk5S2jy61RGsVA29I1J18GrrEKdKbAe+PDQuL2DrgNfggi4N/xdgUFqy6SK4kS/VH+D3XxYNQKhD3eq+m0Rb9GM1hOBXoaoy3oabi9pdIWVyoBshdE3Tdq2t+pdHSlKZc/AGVdRZ8tRlVYWwxWn+Fibejwr7pxIQCah2bj4SFrzYkHKfrNinJ/l4EvEGjkOPY0DSIQqvz+furqcmFwDJ56eDB+3y6XcrogMwqz2y2rzniSJmi59/EUd9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8339.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 15:27:04 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 15:27:04 +0000
Date: Tue, 1 Jul 2025 11:26:58 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH 2/5] dt-bindings: media: add i.MX parallel csi support
Message-ID: <aGP+L6aRsi7GT9mf@lizhi-Precision-Tower-5810>
References: <20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com>
 <20250630-imx8qxp_pcam-v1-2-eccd38d99201@nxp.com>
 <20250630225340.GE15184@pendragon.ideasonboard.com>
 <aGP2yT9ID1E0BepB@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGP2yT9ID1E0BepB@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AM0PR02CA0178.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: e783c1d2-b3a5-4e30-ec14-08ddb8b3bb65
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?nq87R146M6wuSr3U/WbDcKt6kHTcst2zd0sIKZDXuzEgWfq2BGLd+AH+OFKY?=
 =?us-ascii?Q?n+D/DcOjWDPfrmFaXoGJwPDNItAz2ykkY77J8zghY+k6Cy4uxZP0ygcbU+76?=
 =?us-ascii?Q?/8lbxOxz5CLpqhLnUr/Qf7KvxBP5ZcaGQ2FfhIcebsuzxgojkwcICDytEmYZ?=
 =?us-ascii?Q?HJl6+SXUIHMZ/VvDcZJmvYrZ3+Ml7At4OppepchwZiBM5TZmqhYjLGeSnauQ?=
 =?us-ascii?Q?3J5BMStRLXxxI4fKXmY7hP0hpUCHu5XZ3aTu1zHTxAVh5L85UQjgYgc3G/iZ?=
 =?us-ascii?Q?e9Nimm5oIQM4vA9j1OF+vsSWt8Wl5mPEe7NP43iy3V+n4hQve86m5XT/st7j?=
 =?us-ascii?Q?yFBy+HMf61Tc6pkYIhjQUoOEMZTWEAo9Tv1151a2gNJlWgMfbUmIoD8VQXs0?=
 =?us-ascii?Q?3Sa8INgEVdzsk4G+kEtJostrhe9pi9IwEQXvwvfDsrmThA/Sy8GKMhRpUb3N?=
 =?us-ascii?Q?z8VHIGa04/edVUSLq7W/+q4Ic6kPVNCs55sgALlrPXd+yALpjpzNKJAAmxNK?=
 =?us-ascii?Q?7Zw36+DvEs4exl7s6dGMXnWqxNnjTDX/KAsRZdcF/mCj/bxTeI6c6sHklxSX?=
 =?us-ascii?Q?7Dmk61ULgLExBSOsqdniNnqW39gWs9SWbnAy1uO7WcGL43C5O2LpVfeyKyHR?=
 =?us-ascii?Q?huGu18L7OpgJ16G5l2pEW86OoiNryAgsDEvJBmanb5q20Vj7Qh97iCPHGYJu?=
 =?us-ascii?Q?G8uJRh+EaMvWYAFLMs0yRYm72Nv4/0bm/CAlyISIfqdzLeJH9pqo+T7P02EE?=
 =?us-ascii?Q?MsFnqAD+06RMkKivmHobPiXn5z1C2+tDaIH26W07UupdH6k+aBIXVl+QdAVB?=
 =?us-ascii?Q?m6i52J9kGRmOlLz5M8DCObCjAbz0AYHGR1Or2lylOTsTz/k57CgEsriCgZBu?=
 =?us-ascii?Q?px9BcMMcQc+zJfPvW8OXOlHEwFyEryLRZRjlyvIPvQXIfrG8XpoDUczV5GOK?=
 =?us-ascii?Q?NH3l4uZWdJ1Eo/kuOXChGdy0w9mQ9btHfP2+95dEXN4YJa3yqmF6t34+57U8?=
 =?us-ascii?Q?myQ/mofsjvMcCzxJl9BkQGeDFKdxsDFUoPFXU8V44O/tCUvMR1x3qQreOoQP?=
 =?us-ascii?Q?QhYEn+cdYBP9Km5OPvrnU5bShdbSCtkRV45LChrtTq2jbpblBfrdYYmqAEUx?=
 =?us-ascii?Q?g2dM7MloSN0zrlOGRhP2PZn76aFANzA93n9EPDRBLPD+R+9IqtHKZ5q+Xdcp?=
 =?us-ascii?Q?xi1Oa55inrYbMMFxvRBPwVUe7zrSBHSA5X5eabv7UbaGap6tF533Lfdnp3sg?=
 =?us-ascii?Q?QbReSjmSnLqbA6Abqd0DB2806HmOS3v5KErj1kb3E2K7DWmor/ZenQS67BlG?=
 =?us-ascii?Q?98pAoWHs3LQaor7B3xo57KBpkZxTjvQoc5ZA6uUhpjhItVRBlnfEt1Wc08Ph?=
 =?us-ascii?Q?2GW6AYZnFTXuH110IJgRgeVuXM64N3xUOmeb5hEUad0OCJQ1QYgJANz7K1lt?=
 =?us-ascii?Q?3i4jr/KefcVo7EOqw3/1IX2CIA7Hug0Y?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?rCQSIph0jvGMBJSNldy7AR1F+hlavzGSuAEzTHL+Omu8Xrt/M7AsWThEuP5t?=
 =?us-ascii?Q?w38mSEO2rWZFbXotdNBkHKMLuz0GvE/CKOPVd6n75oVUizGcOLAoTzTRcEb4?=
 =?us-ascii?Q?3rKb8IM8NRQn1Tkc/W1Ck9Emmb6eke8byMRPPsO49golNFmkoSmZMAZuiKwe?=
 =?us-ascii?Q?+1ClTtQQ/pcEGVwpPt8STlUUwY+mlD2MR0zGudO4aZycc2F2gAdkg13Srtne?=
 =?us-ascii?Q?G/9jxM7b0QdXWpF48WhALrwr+ij/0Wx7fVqNY52MgEBu+MjxL/haxRLFBbNq?=
 =?us-ascii?Q?x+QsxeAm02vIitDv5LAxxOtAM0G8hfcuYQ3ktwZbyQWyvxmaNtfCG6J4Q2t8?=
 =?us-ascii?Q?L0SLTkGCmKAey849OCbjYlKjfahs/oAQ8f3MR504j57MkC0N16Pvr2VlwzFn?=
 =?us-ascii?Q?Y7qEh0cPsXg+jKCLTEwoXk4wiRib3n/iQis9s7MtZ13qbgiFQglMRrNQxqib?=
 =?us-ascii?Q?U4gU6XkLuYqdQ034akL+40Cw5fcKm634Di1qSl1Cb9/Yqx06PCvMRScnvoZR?=
 =?us-ascii?Q?2C3MM4Km0Aa3j1P4jw9jiveg+1Ntay+WNidBS2UwFDGoOP46UiXYBBZIbVPO?=
 =?us-ascii?Q?WjCY+QjMgFw7wG2gXSx6MfFZQpVCkO+VDlx8S/1oV4YuiofOkTuDOJr8KRRg?=
 =?us-ascii?Q?QpI6bNWVFgmH7ljG0+V5FFfnTXLSp2ysW3BaWO1tmzwI0LFl2rn5DgFsp0WD?=
 =?us-ascii?Q?YJBmMmE48/3h/oEgzR5qDfDFKbzDmYc5raFsAmFXr3RBVjbDp/oExx93useY?=
 =?us-ascii?Q?V+CV5BdBWQpyHYUO0uZ/jfdxEi5gDSHAIlvxVx8g5Ls7OGDuwv2zOSjk+wdZ?=
 =?us-ascii?Q?6bvFE4dwrXInawx/6T4N8p2BbVzYWw4X4yQR4S3dC88mHlOdS5kFR+jJfFkx?=
 =?us-ascii?Q?MgocfVk+uKS1+nvMRRl5Wy7zN3oKM3NCxKGj+Xg1cRWXWMl6VNU7aK92mx6K?=
 =?us-ascii?Q?FrA/342C3dM/PFx2U4V0vuDMVcz78boxiTJR/lRW619yQ6Iwj10OPkyD8tq0?=
 =?us-ascii?Q?w4Yjt1o6JSypu6K82JLEi7PgRwQjaLf0wmtZuj5aZhFUrokWlTWVpCzSVR0b?=
 =?us-ascii?Q?WiiLCV3cUx86Q3NvmMDHYakr2QJ6jT509qVDQjl+aVafl8CGjZV5KhkASjJN?=
 =?us-ascii?Q?CckHRSbEpbl0bc+/LBBWbByLySv5veviP2EyXTaGF1YqX18Bme6nOUhgdBI9?=
 =?us-ascii?Q?igLCS+AhmfVM3glSDpfC34QDczRd4pD48haDV/40YSp1L3ZV0Uc1cf1aY+7L?=
 =?us-ascii?Q?Yn9UdmKPigia6+/vfgnhfKqm8wH8ZtAJkWYh9sMTZ4HmiJ/J6sYqPiTICy6T?=
 =?us-ascii?Q?LbrMtrNivLIOq3UKipt/ls9GPxXxykKL4Q38UgRhB3x/l2BSwJktwOileo1D?=
 =?us-ascii?Q?FNe912S3c4DumNTXHDBTAivzvauwAPFSORMLkrt2Su+IZlLm9vE5Cl7YckmF?=
 =?us-ascii?Q?pnnGoq1Xcam+N7dnkcIU4wB19dhnf7suqa+24z6OfIe7K2yVLf7dC+0Y+CKW?=
 =?us-ascii?Q?q93K+WO02cZBVsf2HXgbCcq8O9Q2G6Px9MTQL9VenFUl2PnG1tm0QlglsxCM?=
 =?us-ascii?Q?jBkQHFmb3RyzK//VdcBuviQyDD3+nQ6FxutNUL/N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e783c1d2-b3a5-4e30-ec14-08ddb8b3bb65
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 15:27:04.1553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XvFtH31Ecqmpt7/fA8G41JYaIPwpp8Fl1c2A9OLSuUIB9Rz2cAXpGiW/8ZU/0zwwAZkD5hb7Gqy2HSwr6lcTaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8339

On Tue, Jul 01, 2025 at 10:55:32AM -0400, Frank Li wrote:
> On Tue, Jul 01, 2025 at 01:53:40AM +0300, Laurent Pinchart wrote:
> > Hi Frank, Alice,
> >
> > Thank you for the patch.
> >
> > On Mon, Jun 30, 2025 at 06:28:18PM -0400, Frank Li wrote:
> > > From: Alice Yuan <alice.yuan@nxp.com>
> > >
> > > Document the binding for parallel CSI controller found in i.MX8QXP, i.MX93
> > > and i.MX91 SoCs.
> > >
> > > Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  .../bindings/media/fsl,imx93-parallel-csi.yaml     | 108 +++++++++++++++++++++
> > >  MAINTAINERS                                        |   1 +
> > >  2 files changed, 109 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml b/Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
> > > new file mode 100644
> > > index 0000000000000..b4657c913adad
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
> > > @@ -0,0 +1,108 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/fsl,imx93-parallel-csi.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: i.MX8/9 Parallel Camera Interface
> > > +
> > > +maintainers:
> > > +  - Frank Li <Frank.Li@nxp.com>
> > > +
> > > +description: |
> > > +  This is device node for the Parallel Camera Interface which enables the
> > > +  chip to connect directly to external Parallel CMOS image sensors.
> > > +  Supports up to 80MHz input clock from sensor.
> > > +  Supports the following input data formats
> > > +    - 8-bit/10-bit Camera Sensor Interface (CSI)
> > > +    - 8-bit data port for RGB, YCbCr, and YUV data input
> > > +    - 8-bit/10-bit data ports for Bayer data input
> > > +  Parallel Camera Interface is hooked to the Imaging subsystem via the
> > > +  Pixel Link.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - const: fsl,imx8qxp-parallel-csi
> >
> > Is there any chance we could avoid calling this "csi", given that the
> > whole block is called "Parallel Capture Interface" in the reference
> > manual ? "CSI" is horribly confusing as it usually refers to MIPI CSI-2.
> > I suppose calling it "PCI" for "Parallel Capture Interface" wouldn't
> > help :-/
>
> PCI is too famous for PCI(Peripheral Component Interconnec) bus. It will be
> more confused.
>
> Can we use pcam? fsl,imx8qxp-pcam
>
> Frank
>
> >
> > > +      - items:
> > > +          - enum:
> > > +              - fsl,imx91-parallel-csi
> > > +          - const: fsl,imx93-parallel-csi
> > > +      - const: fsl,imx93-parallel-csi
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 2
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: pixel
> > > +      - const: ipg
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description:
> > > +          Input port node.
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description:
> > > +          Output port node.
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - ports
> >
> > Patch 4/5 lists a power domain, and so does the example below for
> > i.MX93. Should the power-domains property be mandatory ?
> >
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/imx93-clock.h>
> > > +    #include <dt-bindings/power/fsl,imx93-power.h>
> > > +
> > > +    parallel-csi@4ac10070 {
> > > +        compatible = "fsl,imx93-parallel-csi";
> > > +        reg = <0x4ac10070 0x10>;
> >
> > The i.MX93 reference manual doesn't document the register set for this
> > block, so I have a hard time reviewing this. Is there a plan to publish
> > a new version of the reference manual with the complete documentation
> > for the parallel interface ?

Sorry, I missed this part at last email. It already imx93's reference
manual, but it is bindle to

82.4.1.1 mediamix_GPR_ctrl memory map
BLK_CTRL_MEDIAMIX base address: 4AC1_0000h

because it is tail part of this space, we can simple strink mediamix_GPR_ctrl
space in dts.

I am working on this.

Frank

> >
> > > +        clocks = <&clk IMX93_CLK_MIPI_CSI_GATE>,
> > > +                 <&clk IMX93_CLK_MEDIA_APB>;
> > > +        clock-names = "pixel", "ipg";
> > > +        assigned-clocks = <&clk IMX93_CLK_CAM_PIX>;
> > > +        assigned-clock-parents = <&clk IMX93_CLK_VIDEO_PLL>;
> > > +        assigned-clock-rates = <140000000>;
> > > +        power-domains = <&media_blk_ctrl IMX93_MEDIABLK_PD_MIPI_CSI>;
> > > +
> > > +        ports {
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +
> > > +            port@0 {
> > > +                reg = <0>;
> > > +
> > > +                endpoint {
> > > +                    remote-endpoint = <&mt9m114_ep>;
> > > +                };
> > > +            };
> > > +
> > > +            port@1 {
> > > +                reg = <1>;
> > > +                endpoint {
> > > +                    remote-endpoint = <&isi_in>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +...
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 8dc0f6609d1fe..3bd6772c11539 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -15107,6 +15107,7 @@ L:	linux-media@vger.kernel.org
> > >  S:	Maintained
> > >  T:	git git://linuxtv.org/media.git
> > >  F:	Documentation/admin-guide/media/imx7.rst
> > > +F:	Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> >
> > --
> > Regards,
> >
> > Laurent Pinchart

