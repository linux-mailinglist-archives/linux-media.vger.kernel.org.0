Return-Path: <linux-media+bounces-48097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9578C9CF0C
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 21:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EE8A3A8725
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 20:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAE22EDD62;
	Tue,  2 Dec 2025 20:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DaK2j2h6"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013049.outbound.protection.outlook.com [52.101.83.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E551D5160;
	Tue,  2 Dec 2025 20:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764708146; cv=fail; b=JTDdKGjrTKLwbRPnhKZkJJwHznHaJ7p4j8dPMsWrO+/5ugq+lKvp0YwuCwldm3giFoMe9GjtnFg+hhOBwbSAfsYdR9CTBV2Fbcrfr/uVBt23dzMqcU49EsoLiT1mw8QGi/pOFwdTzzCrw6XAOfy+t/N4jB2un79+nwhdQTvTuf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764708146; c=relaxed/simple;
	bh=SDUjkYOAv+CzMNG2PbYgyVhK63Ds7UbnHD7ls7Tu1HA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WAx/rLBmiNfj9DlGjbSPYqxrRse7VdNAihGSdt0kgSjC/3ytzSohhoVMidh6/Kuer5DYIQs7LaGMZI6PUGH+q+iO+5Z2WPVl2O/PUcKysjM61R7k2yvo4Gi8WusNutjhlP6sAWyt1sMuzE11kFtUdyaBD/TV+K0aiA7gfmqyGyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DaK2j2h6; arc=fail smtp.client-ip=52.101.83.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sj9JGRPkdj9hHuKqk/gs4+Xe3GeF0W3CmUK3QAIh7k6HRjVjOH1QIfdV16U7gJhqnks2q5RY1e/L7765Su0IZ+WHQTt67f8IaX/CbhgJC6nnnTBgMC8cmx86/h1M4RHbsa3hDqgupRvYuEhwkial1QHqF7qBH3dWQOhossii8dgpppQjvbKKeLiho0moBXEbh04DRC6fHJmqGq9J+mo1eHUo4x+VqKN1U3MS1/vT0ulIAzxgzmoRB0lwjWF65gc0mGIj6DR3u15tHwIuk8T7voRePOI/BRLEmXNe7knmTU91B/xLlVQIHTKubt7DcZvfaYppz6HdDbLMwvZp0f04Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCh7b/G/JzicQ139EdPMnys0FOPAte83IHTjNXbXOqk=;
 b=vQjQeZzwYjz6+I1uYpRQ5zGn6W4M4oZKXDJMr/VjtIu8FIpu32s6mMSkJrMVCjg1tXPHwYAQDdzPSO+FAe//pKXn1CEsk03hhIZHH3khCUDI1Qw4XH5Hh4wNua3W7MMGEtWh54Cb/3NdH0q2VGt1EtQ8IhDLWuECDPy4Or/bhyN3I+RSP6pjIxerPe1Lhc5yPLCfPkIOOx2RnAyvp5nAzh/hHeTO3a1NV+ymmsKkPwF5rLOLfyUNjI7qZQgMIzFdLjJFxx7I69WUnDY4g1sd5J9LvwDvxKjnoesVxFHvtluZbqETSJLkdx/DbmCYsJsZgo9fQqqscr5U6ddKnHOX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCh7b/G/JzicQ139EdPMnys0FOPAte83IHTjNXbXOqk=;
 b=DaK2j2h6UneAJlcgYyiKQNbYC/8kWpjzAnh4l2LPB6QYCXytPdq3MDf2fgTLdH2Qm2ZEd3aZuwgQXMuqG5VbVfnsXnjZrv1XfZ2z2Oh0zTZpk3wFLpt5RVWaM7MpY1L+rYeDa9QpAS7JvX4KEbHuhD4AfljrzRlTkiOGnWAwBJprLIdNU1Zng4sYTPZLUD40eu2PqT2BmclWeEbOPV+CQ+fsWN+CxBgwKu+ZNF1HTBEkZDxuzI7S9DdbAY65+u94AejBwUlGmI18vymsSWBWfChLyjJ9qC8ZOFkXzMHqP3/fnjscA2V9Key6UJ9L33a/ZmTxgv2XJRxCpaR8KYTxzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GV1PR04MB10377.eurprd04.prod.outlook.com (2603:10a6:150:1d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 20:42:21 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 20:42:21 +0000
Date: Tue, 2 Dec 2025 15:42:13 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kumar M <anil.mamidala@xilinx.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Stefan Hladnik <stefan.hladnik@gmail.com>,
	Florian Rebaudo <frebaudo@witekio.com>
Subject: Re: [PATCH v4 0/2] media: i2c: Add ON Semiconductor AP1302 ISP driver
Message-ID: <aS9PJfqzZRSOJiIf@lizhi-Precision-Tower-5810>
References: <20250811-ap1302-v4-0-80cc41b91662@nxp.com>
 <aLbdRdS3TmLHjW+Q@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLbdRdS3TmLHjW+Q@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::14) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GV1PR04MB10377:EE_
X-MS-Office365-Filtering-Correlation-Id: 53596b35-7961-46db-aae4-08de31e34aa1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Nk5hUoddtlkO6sxEMEF/IctO1LzFHZF+/I/6Aas6uvq7N2ftDDD3QniaqExj?=
 =?us-ascii?Q?7TMdpfq2Oi9Zgv5oaLAgn0s4XzqRSS2lWGp/Cj4b1XdonBWnO745chE1S6fu?=
 =?us-ascii?Q?cS4298e0ABHohAlYKeBHeonpH5mHzvBFeBr5pl8NOa/CYEYwrCb0p9sgAIp+?=
 =?us-ascii?Q?t3zAAVk2K1warVwdxIZOHXkcjPUwvA5sYViEkd52CzzKwGRc6ADo0SxcHqKg?=
 =?us-ascii?Q?vXSFSSQIhAfyNWC6wQz5fLe3JB+a3AAyWfpo/FnbMaLR2SCmMag/7bf6xGhQ?=
 =?us-ascii?Q?NJYOQ681wJYyow4USy/5KDej7WDmEY1WDnJalU0kqHRqEchXD9iIM9OYVZ1r?=
 =?us-ascii?Q?AhRLxVC7i3HjNrXfjEeMzuTAntlvanqSsblxl56mVIUg9B2srOWqJAbIUKxr?=
 =?us-ascii?Q?QIYB4JYF/xC7T1ItYmlhClFUFjwFpjt9XRwB9iASWQM+lu0nAz2vlM65q+7i?=
 =?us-ascii?Q?6OPdG3KbjnW9b6aY7hP67n/ZcZ1gmEM8fMha+kN5/orvXKYr0end/l1IcQfO?=
 =?us-ascii?Q?ZK7WfuxCuDHvYCd0Yq+0V3kH/ol0iYIIVdaxP2J101M5k2skyoVC4SbmEDvl?=
 =?us-ascii?Q?C69cSqcKCSL1b2h2yVcQu/BU/wZTG90mTHJGH8Y+7f5kAOUE/6mAnO4RbyvW?=
 =?us-ascii?Q?5CC5cxBgN4eungVqK2uL7DGFAglzX3DYr6WHwlxo4j/u7xnQG0FvDQTdkRhe?=
 =?us-ascii?Q?GEKNemuCFF+kOG2OeIF2jbJdqy2dLWArRQTpHGyBB3F7EqeBI1qxtPc5yDKm?=
 =?us-ascii?Q?K4QusnKfMgJHseMM+03K5DhLz/E67mzzyWOPSy4Zx2wVDO2srrymbyBWXkf/?=
 =?us-ascii?Q?WsRYWYSvDC4JkD8RgoS8jn1P8F/Td68Eb80mEb32YdJASzRzk13iq4XXxNV3?=
 =?us-ascii?Q?iTr+iJTmCM0uBH2Frf8fusE29xpCNwK/jo2ZIvjqBKvwcb5VU+mmmFlXHXvm?=
 =?us-ascii?Q?I9t/nZdXXULX6HjuFPYD9jCQN3alZjXncAGDfhRdnVp4B74LU0AJxvgq7DhM?=
 =?us-ascii?Q?IQOE5pdDHVAbOvWL8aa7EkSFLHRqr8ymYIWUeF3ypTS9HABkuMFzA5ITxZV1?=
 =?us-ascii?Q?q/AAxuB9qXp9sLjXXoG0YvTjHwyF2MoJS036VbcYxfgphaT6cREfo+Wlzqoz?=
 =?us-ascii?Q?D9KrP08/M2zNOjVXQ+tiAEeNYL4hH3+IMdqXJZFvJqj08rvg7oHWlRnHKH6T?=
 =?us-ascii?Q?iI8iRj1UqbRVn6RWvDMsbHtWE8jTuUKBpm/Ad9o4Q2qQh6sAxR3iW2qfvZMT?=
 =?us-ascii?Q?HiYL5Eq/WDD/O1mO8q1b6gLlYUqWy+auVV4X2n1om/TPNdes5Wc/zHOlir/o?=
 =?us-ascii?Q?kfpZqxLZr9354Yqt4DI7rCI7uKZGHfp5M7Iorrggs4k7kZ3u5SuZ9yKrogAY?=
 =?us-ascii?Q?n/DrZoJGMhTX3JhycdvSiwt8wYOEZeQaChsHiXop1bmAwyiAMJjKrP2T9avX?=
 =?us-ascii?Q?6zXbc4vfQW8e1bcyZnl9J79QDShwHq2OAnxJU3H5fNxH8DFE8kmRtuR6vaGc?=
 =?us-ascii?Q?GY8x9ZRGeNkmVwG4hC/GhsV3DOJdjbSjj/LTfq8eke2d3mPH24LRIwtaEg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?z8XSBxw2m/cHsKbvI2iS9yC23WRkon/KRc4hGGXPte/SNY0ypPbXRFCE1lEA?=
 =?us-ascii?Q?RuY5PEaFsOGJmP9icxJ+xqvdbtu4kRnPvFvLRZFskfg8VGKMXINvLssoAZgq?=
 =?us-ascii?Q?xZ2b6MFnBvNHFpqXtF7qrA/DyaWYwXGfCTuih38kbO7prdXgMMl+siC7BaY5?=
 =?us-ascii?Q?r8GeDlKzSQWs3re0NMh9XiMZZYZ34myy+QMTiMsb10P76NDFc/O6sZZsCFAl?=
 =?us-ascii?Q?6e1n3jBW2O6nXW3YVNVyAu5PJnRnynnEnl1fVAMMb3GIcYWsf5RawRvFPJVL?=
 =?us-ascii?Q?rLgkFJ7K+ZFzK7eTWo8hCd4nvrhEyTE/5A/0RBrK0p5TzUvJ2PS7Ti39V4y6?=
 =?us-ascii?Q?OlgF0FZiQz0VKAYgJ9LWeP1xd5fpSFw07K1i6WHS1UHONXg1yx4V0uL7VGd+?=
 =?us-ascii?Q?8edTKAWXjtkws9vHK2bKpmH2fJ/B9ReMrHMXXzjbAEa3AmQ5PMHaHEmTzBq7?=
 =?us-ascii?Q?XFnzd1wALObwaTWdNK+taf0gSwpexezr2Lns9CyvDYn7QDHFHgF9jaL8407f?=
 =?us-ascii?Q?gRPepAGwdCwagRFaKQJJgUXs5LNz0qIQAkqHE0T0t/NsyaUXnY4d6BLGT07d?=
 =?us-ascii?Q?ZbQOC9BtD5bMTfWT87wIkskB6PuonxJ1BXsFvnjkpTBQ+8KROw1uQKt5E/MB?=
 =?us-ascii?Q?Nbb57W8LW4PFNKMLtRVZqIUqX8PALfFDn9UQI/yDrf6W4A7kZ3i4isUzS0BF?=
 =?us-ascii?Q?gSkYzfzv6k25cX1rw7WvpXlhwN4cNBSCvsN/lhinVWN1c5XMp/IJVidKfwSQ?=
 =?us-ascii?Q?eneoQOcbo71eFRVBP6Vna6V7ISMI8H871JYXZjY93CifjWA4lRMRG+yn/btE?=
 =?us-ascii?Q?92fO7CEyWqCuNnUEkyL0I+DXzD97AsxkLY8UpHRYGWhXHmax+84v5JCA7+dk?=
 =?us-ascii?Q?7+ipgPtDxIuMzu+50/WmZIqdzkqbyHfRqauvhZVrm+0//kbxF+RcY6/w3chR?=
 =?us-ascii?Q?vvT8jpZ64WDJfjOywFD2J9nyX2Q9xsj+8bh8ocBD/ozOrBbhH14GMNLTQGHh?=
 =?us-ascii?Q?ht57ykiY2/ejUq4CA/aW7ZPFXD7RNGZ7JOXfJ4qwLUBmHGpfzETxyV+90hHm?=
 =?us-ascii?Q?q+yrWjyGoKMn2IrSymXbszAebqB0w/sFEaZ6+M7A3PhTf/ci8OO3yeXrw0tD?=
 =?us-ascii?Q?lzF3sBZYdWQXl0rRQqg3R3oSgq3LiNkygJQapflrNKttRhVfvpZMRgm869Lf?=
 =?us-ascii?Q?KiIwdOsRhUnbatSoz39zzcgPKrpdpNIdm1ymBfL8SfXd2htw/04oX2JhRq6L?=
 =?us-ascii?Q?Nyru/NymRFTWbDjsbzyxV1qGZJshgQQCIb0Ii2qDQXKvPFJN7kT88ncLFw6I?=
 =?us-ascii?Q?Qr2C2l8mo2EH1WgR35HUIGhN4Jq9BIfBToDFCv7bDZUIZ3nzvrajdQMy4uET?=
 =?us-ascii?Q?gDi06cdUjXs8+UMKikm1qYmjQ636dIIdvs4N+KlY6Eq7lXfNUyf/+UT+KXUd?=
 =?us-ascii?Q?JFruLaA7ZOkw8+uxkuRHZtAyW1k8RYyv0T/ewpLPLd36RR1U7peO1vhj+xpa?=
 =?us-ascii?Q?YwjrL3ByOVb5ZgDvXk+Aya+WPUTSvauhYBIuXnUXV4W7rTqGT6JBpo3uxup2?=
 =?us-ascii?Q?TP2jfCFcwYuhbfYiVxE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53596b35-7961-46db-aae4-08de31e34aa1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 20:42:21.4012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LfyAx2vJ6AwzBQYGIr3ZGrinMmmYwd1xo8sv9JEZz8PGqqQ2aHBBrmoFnhf2BwtQeB4zrjqyyj2QZ8sHeQms7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10377

On Tue, Sep 02, 2025 at 08:04:21AM -0400, Frank Li wrote:
> On Mon, Aug 11, 2025 at 04:42:29PM -0400, Frank Li wrote:
> > The AP1302 is a standalone ISP for ON Semiconductor sensors.
> > AP1302 ISP supports single and dual sensor inputs. The driver
> > code supports AR1335, AR0144 and AR0330 sensors with single and
> > dual mode by loading the corresponding firmware.
>
>
> Laurent Pinchart:
>
> 	Rob already ack binding part. Can you help check how to move forward
> driver part (firmware header)?

Laurent Pinchart:

	Does this patch missed at review queue? It is quite long time
(over 3 month) that no any feedback! Or I missed some steps to trigger
review?

Frank

>
> Frank
>
> >
> > Continue previous upstream:
> > https://lore.kernel.org/linux-media/1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com/
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Changes in v4:
> > - roll back to use onnn,module method: see discussion with Rob at
> >   https://lore.kernel.org/imx/CAL_JsqLUj2h1OxUokOGFL34czroJnJ33cpvn9jO8b8=cu8Fz0g@mail.gmail.com/
> >
> > - Link to v3: https://lore.kernel.org/r/20250623-ap1302-v3-0-c9ca5b791494@nxp.com
> >
> > change in v3
> > - move sensor in binding into ports.
> > - add missed regulator and enable-gpios.
> > - detail change log see each patches's change log
> >
> > ---
> > Anil Kumar Mamidala (2):
> >       dt-bindings: media: i2c: Add bindings for AP1302
> >       media: i2c: Add ON Semiconductor AP1302 ISP driver
> >
> >  .../devicetree/bindings/media/i2c/onnn,ap1302.yaml |  184 ++
> >  MAINTAINERS                                        |    9 +
> >  drivers/media/i2c/Kconfig                          |    9 +
> >  drivers/media/i2c/Makefile                         |    1 +
> >  drivers/media/i2c/ap1302.c                         | 2829 ++++++++++++++++++++
> >  5 files changed, 3032 insertions(+)
> > ---
> > base-commit: ce5d48bfb56d70cfbdf29770c5c392a979cc3871
> > change-id: 20250617-ap1302-4897c591871c
> >
> > Best regards,
> > --
> > Frank Li <Frank.Li@nxp.com>
> >

