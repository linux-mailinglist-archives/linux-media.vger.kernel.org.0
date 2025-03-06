Return-Path: <linux-media+bounces-27687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F63BA544E4
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 09:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A50C166AEA
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 08:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4712040AF;
	Thu,  6 Mar 2025 08:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mqGdxpkO"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2078.outbound.protection.outlook.com [40.107.21.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8C21FF7C3;
	Thu,  6 Mar 2025 08:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741249832; cv=fail; b=HFuIyFdHf+P0osTV9uMEs+ADnSil6x/Z21n5TB7QsHvt8hKXyyDTbGVgY9fmQPsTGArhWzmLn542+0vSSafsiFlH5Mn5Ahgxsjmf3D/4S/z50dvuthucdbnUnlRngvRJTcp7YMkhrD0PMyptfdeEfsdzYhc9EZ+V1/7klnA9W8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741249832; c=relaxed/simple;
	bh=O+mkegKxDnn0N9mb7bK+8c6kJYciB5w/jkHH5qT7x3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZtB3Pu6fMJZMlE5av1sYrlhh5hv2fSWfazBB+NHLrwfieYe5XiVgRqsEIfpZRUVFYtK8jtdboqbBPo4/mN9FfVXtWhecs4OQLUBwTnY2HvakGAGPVELkl+pRC6MEVnqfbVhGFCbb5jxhXp//3mrybTcCfzcTroarivjEWD+x4oo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mqGdxpkO reason="signature verification failed"; arc=fail smtp.client-ip=40.107.21.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndupO6bUWCyj49+NeZqkU5c79xgrQN1zeTiBWzVOH1+eNhYJ1q8wxxF4nhFjdie4dFhkP8eYDmS9qxWNfPlOm/0E+lN3kvogAim5Cl6wvOZNaKtIIZ7WhsrG2ibchc+VbpMGRlmllTHOV9XZrNQMSY140n+BTs3V6PJkSN8+zs3RZUWBvpvX1oDKATtaULtd/i9ntnTJX9p2A/GVIPWyGOrSelFh+27oQnCw/Adj9Pgc2iWbE7cE+nZ3fZDQygpDeO1/a4btEMwEvBus/XQ8zqJW+PDVgY2aG/q0x+X9IEllVGDzU8G0Qr1MjFCM5gXD7spdnHEbC/tRlg6lmR5woA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knfcTGs2iuXDzK3YHrCsfVmZs73kkkgqCxIavCRZn1I=;
 b=muqGfOYvdL2cMEsU2KEhVJNydOW8KK2Xw0TXyOTUahkvdH4d79uj5AoLmxEyH9Egx2MS+o01Ta9xqlwYOZ/o9n3tYsZx1Weg3nduVjwFDTBc02w8xxQKvouaN+0ImOBbrw8p4g9Z4ttrVj8GqtBs4awXtUVrLnWaOTicdjtcEMx4mQ0rjU0jUWu716iy1ZcpwcYZQp1SDF1BThMd3di5DXcEjxfgVAothhl53BCo22R8VAuwRQBC73tyzpaZNkeq527UArKN9LOS+EAs76HATLTA8kWa0y7Z25PK56/MBA+vA7JpYEo3rpiJ4OS3rpIXiGeU5nSlLXCYjCcGkyu7XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knfcTGs2iuXDzK3YHrCsfVmZs73kkkgqCxIavCRZn1I=;
 b=mqGdxpkO2qvDlUs4LIw3c3DRd0qdRIh9kglggStJjlLqOMdW2h0x+rc/7S7wPNHpCdQ+Rus0TtGrvrX77Hf1Zh7ZcalFGab3y4s8Se0dAtBDwmlxbDLanI9Eq3lq2nJ0L2Zo6bAutSxRC19LifWEAuouJ7moPUeinI5xWW0QCt+IlHrxOA5Lyq+Ia5DQDJa/nYjLATFw9eF5hHrgOYbqMFp8CxwTT0Z/8mhXe5AVNMle2lunC47+mS4tVcGQrzpL3jVd6ZXPSN7l6YQ5hoj1dxVXDatsf2ttBCENBBXsqk778r6vOBu5owSp6ZT9ej7M5ujRSEOwJS6NaFRs7+oVgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by VE1PR04MB7359.eurprd04.prod.outlook.com (2603:10a6:800:1a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 08:30:27 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 08:30:27 +0000
Date: Thu, 6 Mar 2025 10:30:23 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 4/5] media/i2c: max96717: add FSYNC support
Message-ID: <c5xuuugbw767ns74vggnwibjmbqz2p2xooq2xan3vk5wb2t2bx@t7hxhhyhowil>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
 <20250207112958.2571600-5-laurentiu.palcu@oss.nxp.com>
 <46ee390957d980189887badc1ca5e8ed437166d5.camel@collabora.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46ee390957d980189887badc1ca5e8ed437166d5.camel@collabora.com>
X-ClientProxiedBy: AS4P250CA0005.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::16) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|VE1PR04MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e64857-61fe-4424-4fb6-08dd5c8925c4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?rWuUwF1NB1SZ1sNqWkS/hm6FQRSNCip+63KT9MPWQW3vu66LY/Iitu0neE?=
 =?iso-8859-1?Q?ljLLnBFOirwr1BjFjKTCCcsajmOQTNva0ORBsX6RV1cO9Tk7dy1xvqTxb+?=
 =?iso-8859-1?Q?n1eoZmf8aM95CRr56wR/Ock95MFpLLZUj8My+bnIdOd0Ttd85a0V6FM6n7?=
 =?iso-8859-1?Q?V9KbSFcIu2JD/Jyl/Eust93Pvjq5coEjJqV/SgwaJOWyhBufqFTJerVOT6?=
 =?iso-8859-1?Q?5IpchNpEO0OwuXUMZdxjp6EAGuZHWH1vvFfxhBoulmUvZwvKupIr0vL6mg?=
 =?iso-8859-1?Q?Y17MskQy1g4n8KW9D14gK/9ucIO7Q2vgxZSgxbPCTgJmXO8dVr5k3621wf?=
 =?iso-8859-1?Q?u7bS5YyjHJjZsxS7FMvY3JeCLmvSuqTHvkIotjQUyKGfYw/oI5WHI65G7u?=
 =?iso-8859-1?Q?kkUXe+UpO2XRZb+pg04myJUeS1k1q1eGaNGv2QGTEuCwc5rAw5F9kznjxK?=
 =?iso-8859-1?Q?O13cdgSS4663tdmlvg8wGra8ke1EHyrwDcWJ6R84bKODkmoRG060iSeamF?=
 =?iso-8859-1?Q?6HRtdcvBVP5Dz1u9aj550WUMylT4KRN7SIhsk8bz1yX94qp7J7zL+K7R/0?=
 =?iso-8859-1?Q?1cbNfOWS6bBgL627no0Rz2fbfzDomk0NLpXtBo5sFGivZgr5GOHX94hUuu?=
 =?iso-8859-1?Q?F0blbybIqxgnqCta/sTzM3TrjJyREuVZecol7/3cGt4coozqOlMLB+IQ/H?=
 =?iso-8859-1?Q?B0ts/Z4bzTbxieQGsRUPHbmv3BvajGNQ0whQ+PzQ1m5ZvIGqEJYo60U4sL?=
 =?iso-8859-1?Q?Pn7Jmn5WkGDAI/92jrCvjRiLounrUi2H3BG8iBeElaodBBpW5Y9hAvIuLp?=
 =?iso-8859-1?Q?O4mncQyPSbZ1X3WkCZ/la3jU1pqnMw5T977rkvuRSQcxd+C6sC4kq3DWX4?=
 =?iso-8859-1?Q?2b/xoC5S0ly4vbciZqEoZZLUuWWpMxMWyUmlxmTOZASm6SEATyYexMSP07?=
 =?iso-8859-1?Q?PY5P5SRTg7BMouopDbLz2NlyNdoYuREWaIl0TBktR2yLXUA7QxHS2Rg81N?=
 =?iso-8859-1?Q?Gmc8tCBN0/7Y7Yb4keK/6tfiaZ7mJl+uulfcKm5SCwhByest5RxOQlwMPe?=
 =?iso-8859-1?Q?8zs0x9HQsmp8MXl1M2CogEk/WJMomggAwV95VeZ59fjzhnlDpTLvArnyVB?=
 =?iso-8859-1?Q?7vj0tIt1P8xmp1A8aQADtMHZ39+K5oqWOGswBN+l1hvUrG/AUEBkq5GDK7?=
 =?iso-8859-1?Q?HAyZraA9tn9TbfSDHXdfH/fBDzvu43I1eW4q/54B6TSLP0NeSH2Kx/cL20?=
 =?iso-8859-1?Q?uaKmEvulrHRu0Yyp3VY/CkQNuNIRSpwbcNY1fRjsOd0z0z2weuzZ3z8GwM?=
 =?iso-8859-1?Q?0+7eQQxhYCtvnGMzB33ZZ9ySfCmpTP7s5BAEehYMYESQlDAWi0T4XqF2mg?=
 =?iso-8859-1?Q?xibUv8SsWfJz/W0ZIiMqGzJYfeU4z3SuUDhOSaB3QhZF+f2N7c2cD9SEGw?=
 =?iso-8859-1?Q?K5n4ZgUHIVogqLI5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?zJx4J3KkxCDP0B9Sa213x7HGg4rikHmY1ey7Yf+61CuR4ho7+NqiNfI5dO?=
 =?iso-8859-1?Q?sqdiX/RwmSL4/ooaO0iosHcyESDjzlxbX84ngqyzPuKdw5JPM/OKmFLmI7?=
 =?iso-8859-1?Q?x97I1/Oe2rCXa+PFsfu+iz/TDZZ9z9MGMH/ZrItm4s0ZXFRMIZPTBJaWhi?=
 =?iso-8859-1?Q?vy1WsAQONh4T2hytypuqVPDEd+dYxHmPUH4fBGtrHjE+l50ajvIs15cI8J?=
 =?iso-8859-1?Q?ctL8tgkO+rvRubHbFuDGvavzk5EXV27qBMzMk8S4hMfCFEpKILiTmvc8dy?=
 =?iso-8859-1?Q?zH/uqF+wUiZcaTnWe6/vhsPIhCCBwUlApzlcZly2rCsG31Ik2yqZPFmfGN?=
 =?iso-8859-1?Q?8EaovVqQdeFfDLWuLER5eYszgfXW8vTZdBhYzvBNUCso2L7K/p1prwoAF/?=
 =?iso-8859-1?Q?9vkfIY7rAbjCBdqtaE/petFHnD2z/a/KxgYd+CYH9sZ2p+EJSLb3dygbQD?=
 =?iso-8859-1?Q?yIxX+Gt6f7OSTvWz5yuzOCw7QUtFq5BsXcP6FAtUJ/IGTAymiQUvNlCVkh?=
 =?iso-8859-1?Q?lWVgKqiHOxAFmV8oFRgY+yosIRwau1kxQvVoaFXuE2jSUnwlMnyNyd1XF3?=
 =?iso-8859-1?Q?6PkmjFi7pYPLmgbLGE6Qa9IfluF/GA5vizsvIzxLrhds1lFWARHiqgr1OC?=
 =?iso-8859-1?Q?BpLRH7zhnbHTZVOvHyqR1k+UH9TRwhfLlmSesWSVmDNK7Op0zfaRFEU6Zx?=
 =?iso-8859-1?Q?t67FXXhf5TXba4UXmEt0VOwxibVPY+tAi4ai+9WOJ7SsxHDV3PSnhu5F1v?=
 =?iso-8859-1?Q?2D5yehpnaowN6dax6AUOPfvz4yRtQmw9ZnZgB/mx2qc+D8zXcihBV8JrPb?=
 =?iso-8859-1?Q?nzivGv7g5qkkidx2nHSzPY86j72GxW7M9Z52s9XcAo/1INz+pA4kGodQs6?=
 =?iso-8859-1?Q?c+z6DD44BjesxJT1+7WUgQ4sQCqpajIWuteKz2doO6alp0qvlukOXdoaoJ?=
 =?iso-8859-1?Q?NUq9wTuZlX0ws+KNfbXM0HAoRHaBMZcG9gCyUiLVSqMb4WbA7j+bUeWzpk?=
 =?iso-8859-1?Q?Z2Yhr/n4eF1Fq0xEXn34osMYaPpAWH6InYfbKRXH3g56Q3VJ3SsvrUH1d8?=
 =?iso-8859-1?Q?5seLTKUIgEQ3xoQS8dsO4XmhJ+EL7cdMmqKikklDHXZfrf5sc3V82v2qag?=
 =?iso-8859-1?Q?7DEowdvRtbcAR0Ax63x52zcgcpLecfVV2OqPRKDhRZL0RwE6MXVXhrQ7tE?=
 =?iso-8859-1?Q?fdE0j23fxWltwVPdZEvsbj22J5JeQBRmYfxRKGrrrPnGAUGy/z5IhOAqZ9?=
 =?iso-8859-1?Q?WOTY8dmSmTVQgKPWu4hxxRObL//rmDCoaKGaAe/XsHhMASPMm/1R6mBidH?=
 =?iso-8859-1?Q?F5HwSVd45W+O1K1xZPlXJ8ko9TR2I+5N/KyqZnB9XqlEB5To+/PbLG380t?=
 =?iso-8859-1?Q?2JoTz96zkxmjGbenWx8JiAbDf7VJ3oMjQmEJj56+qzIRgCcDrfpb/Ampd8?=
 =?iso-8859-1?Q?BKFE7h+06hXw3Et7ZUsbu02ScYAZ1Wu0nu5Y0i2MH10i0ZFYZGwiZaRdxd?=
 =?iso-8859-1?Q?ZK80tGrWZQCDyr3we7TV28HdpZ7cTGYnpBr2WmWE3T9tO4oagI8qqU6Co4?=
 =?iso-8859-1?Q?5EX8zkBWrZRW34rTsJyq0xr6GRvrd6kWGQjak1oxvCvRMeDQrNb3vHX+u8?=
 =?iso-8859-1?Q?xIr6VSzjDcwW49rs/kyuLP3qKcCsDIbgEZIaHv/jYkhDDuI4+UM3OaUQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e64857-61fe-4424-4fb6-08dd5c8925c4
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:30:27.2331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wiw9Rx5K9YLn0c3lhrujFeSxP2rn0Zac3IQEJ+yu5+0+8h311rjt0M0XF26rpzZfnZ2LVp+rmm7H/eI4tIlhNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7359

Hi Julien,

On Tue, Feb 18, 2025 at 03:46:02PM +0100, Julien Massot wrote:
> Hi Laurentiu,
> 
> Thanks for your patch
> On Fri, 2025-02-07 at 13:29 +0200, Laurentiu Palcu wrote:
> > According to specs:
> > 
> > """
> > Frame synchronization (FSYNC) is used to align images sent from multiple
> > sources in surround-view applications and is required for concatenation.
> > In FSYNC mode, the GMSL2 CSI-2 quad deserializer sends a sync signal to
> > each serializer; the serializers then send the signal to the connected
> > sensor.
> > """
> > 
> > Since max96717 can be used in multi-sensor setups, we need FSYNC
> > support. For that, I added a DT property("maxim,fsync-config") that will
> > be used to configure the frame sync output pin and the RX ID of the
> > GPIO as sent by the deserializer chip.
> > 
> > Also, add the .request() callback for the gpiochip so that we can use
> > 'gpio-reserved-ranges' in DT to exclude the pins that are used for
> > FSYNC from being used as GPIOs.
> > 
> > 
> > I'm seeing different features in this patch:
> - Adding the request callback 
> - Adding GPIO forwarding 
> - Adding support to some pinctrl features such as pullup/pulldown

Ok, I'll add support for pinctrl in a different patch. Though, I don't
believe a separate patch is needed for adding the gpiochip request
callback.

> 
> 
> 
> > 
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > ---
> >  drivers/media/i2c/max96717.c | 87 ++++++++++++++++++++++++++++++++----
> >  1 file changed, 79 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
> > index 6a668a004c717..47a3be195a971 100644
> > --- a/drivers/media/i2c/max96717.c
> > +++ b/drivers/media/i2c/max96717.c
> > @@ -70,13 +70,28 @@
> >  #define MAX96717_VTX_CHKB_ALT          CCI_REG8(0x275)
> >  
> >  /* GPIO */
> > -#define MAX96717_NUM_GPIO         11
> > -#define MAX96717_GPIO_REG_A(gpio) CCI_REG8(0x2be + (gpio) * 3)
> > -#define MAX96717_GPIO_OUT         BIT(4)
> > -#define MAX96717_GPIO_IN          BIT(3)
> > -#define MAX96717_GPIO_RX_EN       BIT(2)
> > -#define MAX96717_GPIO_TX_EN       BIT(1)
> > -#define MAX96717_GPIO_OUT_DIS     BIT(0)
> > +#define MAX96717_NUM_GPIO		11
> > +#define MAX96717_GPIO_REG_A(gpio)	CCI_REG8(0x2be + (gpio) * 3)
> > +#define MAX96717_GPIO_OUT		BIT(4)
> > +#define MAX96717_GPIO_IN		BIT(3)
> > +#define MAX96717_GPIO_RX_EN		BIT(2)
> > +#define MAX96717_GPIO_TX_EN		BIT(1)
> > +#define MAX96717_GPIO_OUT_DIS		BIT(0)
> > +#define MAX96717_GPIO_REG_B(gpio)	CCI_REG8(0x2bf + (gpio) * 3)
> > +#define MAX96717_GPIO_TX_ID_MASK	GENMASK(4, 0)
> > +#define MAX96717_GPIO_TX_ID_SHIFT	0
> > +#define MAX96717_OUT_TYPE		BIT(5)
> > +#define MAX96717_OUT_TYPE_PUSH_PULL	BIT(5)
> > +#define MAX96717_OUT_TYPE_OPEN_DRAIN	0
> > +#define MAX96717_PULL_UPDN_SEL_MASK	GENMASK(7, 6)
> > +#define MAX96717_PULL_UPDN_SEL_SHIFT	6
> > +#define MAX96717_GPIO_NO_PULL		0
> > +#define MAX96717_GPIO_PULL_UP		1
> > +#define MAX96717_GPIO_PULL_DOWN		2
> > +#define MAX96717_GPIO_REG_C(gpio)	CCI_REG8(0x2c0 + (gpio) * 3)
> > +#define MAX96717_GPIO_RX_ID_MASK	GENMASK(4, 0)
> > +#define MAX96717_GPIO_RX_ID_SHIFT	0
> > +#define MAX96717_OVR_RES_CFG		BIT(7)
> >  
> >  /* CMU */
> >  #define MAX96717_CMU_CMU2		CCI_REG8(0x0302)
> > @@ -125,6 +140,11 @@ enum max96717_vpg_mode {
> >  	MAX96717_VPG_GRADIENT = 2,
> >  };
> >  
> > +struct max96717_fsync_desc {
> > +	int pin;
> > +	int rx_id;
> > +};
> > +
> >  struct max96717_priv {
> >  	struct i2c_client		  *client;
> >  	struct regmap			  *regmap;
> > @@ -141,6 +161,7 @@ struct max96717_priv {
> >  	struct clk_hw                     clk_hw;
> >  	struct gpio_chip                  gpio_chip;
> >  	enum max96717_vpg_mode            pattern;
> > +	struct max96717_fsync_desc	  fsync;
> Here we can have multiple GPIOs forwarded.

Now that you made the point of the serializer not being aware of FSYNC,
it makes sense to change this in order to allow more forwarded pins.

> 
> >  };
> >  
> >  static inline struct max96717_priv *sd_to_max96717(struct v4l2_subdev *sd)
> > @@ -364,6 +385,7 @@ static int max96717_gpiochip_probe(struct max96717_priv *priv)
> >  	gc->get_direction = max96717_gpio_get_direction;
> >  	gc->direction_input = max96717_gpio_direction_in;
> >  	gc->direction_output = max96717_gpio_direction_out;
> > +	gc->request = gpiochip_generic_request;
> >  	gc->set = max96717_gpiochip_set;
> >  	gc->get = max96717_gpiochip_get;
> >  	gc->of_gpio_n_cells = 2;
> > @@ -386,6 +408,26 @@ static int max96717_gpiochip_probe(struct max96717_priv *priv)
> >  	return 0;
> >  }
> >  
> > +static int max96717_fsync_setup(struct max96717_priv *priv)
> > +{
> > +	int ret = 0;
> > +
> > +	if (priv->fsync.pin == -1)
> > +		return 0;
> > +
> > +	cci_update_bits(priv->regmap, MAX96717_GPIO_REG_C(priv->fsync.pin),
> > +			MAX96717_GPIO_RX_ID_MASK,
> > +			priv->fsync.rx_id << MAX96717_GPIO_RX_ID_SHIFT, &ret);
>                         FIELD_PREP(MAX96717_GPIO_RX_ID_MASK, priv->fsync.rx_id), &ret);
> And you can get rid of the _SHIFT define.

OK

> 
> > 
> > +
> > +	cci_update_bits(priv->regmap, MAX96717_GPIO_REG_B(priv->fsync.pin),
> > +			MAX96717_PULL_UPDN_SEL_MASK,
> > +			1 << MAX96717_PULL_UPDN_SEL_SHIFT, &ret);
> 
> The serializer can't guess what kind of pin configuration is required for the design.
> This change deserves his own patch most likely implementing pinconf support.

I will have a look at this and, hopefully, come up with a separate patch
adding support for pinctrl.

> 
> > +
> > +	return cci_update_bits(priv->regmap, MAX96717_GPIO_REG_A(priv->fsync.pin),
> > +			       MAX96717_GPIO_RX_EN | MAX96717_GPIO_OUT_DIS,
> > +			       MAX96717_GPIO_RX_EN, &ret);
> > +}
> 
> 
> > +
> >  static int _max96717_set_routing(struct v4l2_subdev *sd,
> >  				 struct v4l2_subdev_state *state,
> >  				 struct v4l2_subdev_krouting *routing)
> > @@ -1037,7 +1079,8 @@ static int max96717_parse_dt(struct max96717_priv *priv)
> >  	struct v4l2_fwnode_endpoint vep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
> >  	struct fwnode_handle *ep_fwnode;
> >  	unsigned char num_data_lanes;
> > -	int ret;
> > +	int ret, count;
> > +	u32 dt_val[2];
> >  
> >  	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
> >  						    MAX96717_PAD_SINK, 0, 0);
> > @@ -1058,6 +1101,30 @@ static int max96717_parse_dt(struct max96717_priv *priv)
> >  
> >  	priv->mipi_csi2 = vep.bus.mipi_csi2;
> >  
> > +	priv->fsync.pin = -1;
> > +	count = fwnode_property_present(dev_fwnode(dev), "maxim,fsync-config");
> > +	if (count > 0) {
> > +		ret = fwnode_property_read_u32_array(dev_fwnode(dev), "maxim,fsync-config",
> > +						     dt_val, count);
> > +		if (ret) {
> > +			dev_err(dev, "Unable to read FSYNC config from DT.\n");
> > +			return ret;
> > +		}
> > +
> > +		priv->fsync.rx_id = dt_val[0];
> > +		if (priv->fsync.rx_id > 31) {
> > +			dev_err(dev, "Wrong GPIO RX ID. Allowed: 0 -> 31\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		priv->fsync.pin = dt_val[1];
> > +		if (priv->fsync.pin >= MAX96717_NUM_GPIO) {
> > +			dev_err(dev, "Wrong GPIO pin used for FSYNC. Allowed: 0 -> %d\n",
> > +				MAX96717_NUM_GPIO - 1);
> > +			return -EINVAL;
> > +		}
> > +	}
> > 
> > +
> >  	return 0;
> >  }
> >  
> > @@ -1092,6 +1159,10 @@ static int max96717_probe(struct i2c_client *client)
> >  		return dev_err_probe(&client->dev, ret,
> >  				     "Failed to init gpiochip\n");
> >  
> > +	ret = max96717_fsync_setup(priv);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret, "Failed to setup FSYNC\n");
> > +
> Configuring GPIO forwarding can be done when calling GPIO chip probe.

OK.

Thanks,
Laurentiu

> 
> >  	ret = max96717_register_clkout(priv);
> >  	if (ret)
> >  		return dev_err_probe(dev, ret, "Failed to register clkout\n");
> 
> Best regards,
> -- 
> Julien

