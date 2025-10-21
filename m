Return-Path: <linux-media+bounces-45139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B67EBF770B
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 17:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2517466454
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 15:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55463431E3;
	Tue, 21 Oct 2025 15:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nepIzfoC"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012051.outbound.protection.outlook.com [52.101.66.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219621DED57;
	Tue, 21 Oct 2025 15:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761061203; cv=fail; b=WYRYAXOhUaf+U7EfSyg9V5dFJOHPFBaYxIw01DO5JD5avdc6sKgGvqv25oV+XtXYJmCdjnVxWo4SEUM+YkFzD3lbIzKWFbt/2tViFzb0Wq6L8SILmZ6zs5ZjCE6YFuvx2Chlh2K64WbSYOgu1PxKLk2xn23RyLRlZjK1lU94kiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761061203; c=relaxed/simple;
	bh=QaIS8+PQKm7nrYTts7tZbq8lvJnpSllgG/QUNGhKlFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K2VCV1fIwwfz+DV8UaE1NbyhJ+c1dal5jqk4cv4xIIf/aPSw9MwZME/VmbD5NP4sxiAgC9LN+Ko48KMsIf9oJ7fN6kcjD1qfNVmApBw01KngKXu+UiO/ET3qrM/ohdDJJOHDWYNQmOOYa/oxYMvsb6COBMri4m/RK3XW3er7ZnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nepIzfoC; arc=fail smtp.client-ip=52.101.66.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqmJWU/rtbUnBHatB21uckWem73+beWZVXQW3qJrb0zjwiVGP6Ur25WQToUbQ/5jdcaBP+R2GDEG3n5BrZr9n5AB6hTQRUE4UKWK9kMvVeHVpGFpJfCMujMO65s6fSdRX78B7QaFtYNofTDT5M6csvxjfOcui7Buv3DoB2X1mAdrf98iBo/3kCQKSanpSWvJl36iOroPw7BQqVaG4n0sv/dQAjN05Ru9R4fwShNi5NAb21/Wb3IrlYrCpeJ6aZM37REMPhh8ypsi+4ZH0SpaDxKEFC1TJi+Dpy1Ey7KGsuzP94Lr/LXadA7puvTAjs59Z7CEwaumch2bvehxAM4Tyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Se2ynN25aRz9I9bxuyPcwYH8t09ENbu4XAJthB8BVcY=;
 b=aFFp9nCnpAFbvRbDEDpa5aezFYLdkxDvEPThMgLGDD9ho60GPC4PNMcxRfCe5kjW6M4QKl873k/eQ82rMg0WS8kwXYOQPM4yEEGukgAq0GAjZ1xPWUPOGscRY5kaU/mcqEHb8oOypmZyUzatCm8vsqoX4g0U5j5w38xoiEkZMoNmgS5kvy0EUWNvrPVT5fCpXEjbi8Dbvo442SxW0jOY284AtjWHV9Ru+/niNnP0XnCep/bhTwHFZ43i98i3DFN8lzagFjhhLjrGlo3tT6o1NkwAa34nFKmEckaSolJ8ojeyX5fKTQYzQxO2TcTHUcIvxVHX5uMFc//Al7DmwIEKXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Se2ynN25aRz9I9bxuyPcwYH8t09ENbu4XAJthB8BVcY=;
 b=nepIzfoCTc4aNIJy4LMAupM8jNHSVFg4tNCrYeuA1wfR3Y2ErAXuROG6zTbfObkEk0gWgVoP7lg71iPrZv7csiNucfb1PHNsl1A0q4Qim/9CPlvYwsTpUbZPgE4md/+sGdeT+ko4unQZYevEJBJaRt2rHXslx+7ZrDq0+CkYTVjDspAhzQOR4sksvXEiepi7YJ6fcIlw6v5R9bfPN8oTk/XE+70hHgUfXwi2CJoD/Lgqag1mEZw21mDS0vjngJ5+Huf3wkovheGSg/SxxfRFTw64zfQBTu7Y2x6sZWwtIh+l0KEZ47V5JjwWf5iPX5cPkSiVaVMVBeuOfK2Bg9fZ1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PAWPR04MB9765.eurprd04.prod.outlook.com (2603:10a6:102:389::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 15:39:57 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 15:39:57 +0000
Date: Tue, 21 Oct 2025 11:39:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:OMNIVISION OV2680 SENSOR DRIVER" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] media: dt-bindings: ovti,ov2680: Use
 unevaluatedProperties for endpoint
Message-ID: <aPepRZOL1Ys4PH/u@lizhi-Precision-Tower-5810>
References: <20250827194919.82725-1-Frank.Li@nxp.com>
 <aPdLmWM8a_ikhJfK@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPdLmWM8a_ikhJfK@valkosipuli.retiisi.eu>
X-ClientProxiedBy: PH8PR21CA0004.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::11) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PAWPR04MB9765:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f188736-df00-4ae9-256e-08de10b81692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1svFwhRUkg8W+tJt+CXFQat52f2fnusWvncMEGUfytDBSGRQYO5HaYJtM/wO?=
 =?us-ascii?Q?mDMsvlIXPuYYcgghbasEVy5ZNti/qn8E+qm0EmZCc6JLaaDooNomTbrKFzWL?=
 =?us-ascii?Q?Bsgj6bWreVf60nTVJYb7cbbqGQAimExCou+11dmxw16WapI2NxIt8EffcEqA?=
 =?us-ascii?Q?uZJDSlLSbLDmsVj8vpACt59TH2xrHj43uteU3VLQUvUVHXOAc2QPBg7RR9tq?=
 =?us-ascii?Q?Ob3Ki5lxltbY5Bi8HbGKX8rSQEv5oVj4+lObSHiZa72Vi0qpRpeSMOATffPR?=
 =?us-ascii?Q?UyDYbHOdYr51ibdzWnnU6nByVEof7FK0B+FsKyhhZly1mFZwZ4g8NAkA6KBn?=
 =?us-ascii?Q?CGo3JLCFB0+eOUKt72DgLolHW2+Cl2R9g/IaZMwm9KWAJWoUz9F0WE+l++EJ?=
 =?us-ascii?Q?LmQV4Dms3U0Q3nfPbMY/vtivaK3f54Ba+L6UI/GJV6xUVs3ty+5A7NF7zLMA?=
 =?us-ascii?Q?keIfh0mZnl9lqaRdzCY1F7FlM7a/SNvRoKRtB87o90L+s8il2MtN5LFKzADI?=
 =?us-ascii?Q?7CZC4t4Mz6+G6x2vfOl941S/gG4d3eRwQQBOKmFtRH7/ft54oDAUf1FPXMzA?=
 =?us-ascii?Q?bEnIgQ5gFz6c0g8qXSvTuOAoHxXorShV6fMk7HKBHU5zOmOS5WfWdMfEOWnu?=
 =?us-ascii?Q?cwsUk7+h1hde28PWfmTTBS0VLfJRpzWqJWuncKJ6NWzpH+IQnhldYG3bAS46?=
 =?us-ascii?Q?Ry6NF8iuLkf1LdCjSL0RUImqX/Q6okEZj2HmYlSHJucGXLMDfx2GmRPGS4lQ?=
 =?us-ascii?Q?BxI5w6v3YQMtrVuKEqs+AQFhrLMERIdRR7ZlU824KVC4dpaZy2VLzO/ehHaT?=
 =?us-ascii?Q?/MCWvCgoHwmm5XqpcM/HbnAnTUcg1sF03tSUjCrga7wznhZgML/rtnvUwR+a?=
 =?us-ascii?Q?8w4h/qVygjETDLoBPspSrjRft63CFYMd81bbMpm909LVw1uU678UmwhZHUr3?=
 =?us-ascii?Q?72lv6Z6/iQsm21CXnyqB5dfV7Flt78qlrGPWy+vaxLlG9lFj8ayUopXyp2Mm?=
 =?us-ascii?Q?eQBaifAmP1YY8PrQdxIS6LUU5t9ukEThgbMakXPUZ/I0itAPSk0CkqpEdsba?=
 =?us-ascii?Q?YFs3c1T0yTeELQQFKUgBbBd0goD7aBCkSmk0dX1teVDFiS2SrmUutiE8h6Q6?=
 =?us-ascii?Q?7DVP7f4Tx0sNxO2Zmv0mzruMIgGV1ibZwxXu5LWpU089Muaajkf193Du+d4P?=
 =?us-ascii?Q?Jsc8MiRSbYrG8xelxU5eHXwfZbQOO0ZD+sDuUSdlgwpuLk2t1mGbygJWgQu8?=
 =?us-ascii?Q?DSQgw0NSwLuMRghkOLBcmR37RFEuTBwNWUTjJocaCF1YgVFrf2z4LcmWK9Ym?=
 =?us-ascii?Q?Lw6hCE0tHmQOIO7XFT8rmJ1sg2ynIG368sQLHGHeSMla4JVxkLN+53KsLkex?=
 =?us-ascii?Q?4I0/EKzAzeVtZRAySZ4bR/XA9qMD/tRPAI4PVcodajMfPExG9jqQUjJg+wW8?=
 =?us-ascii?Q?kcw3SuaPnupxVblx1F6e+p212I1vNMVTtWYU9IT7zXDmf3JT9+enGaG5t913?=
 =?us-ascii?Q?7I7mfR4rWUEPC0X8awQZEPjp7R6tIzImEDfL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+6+1JxUFo+R6dHr+pum0AItsYc9B4V69iMlPgNV8bLZ+fC1uz8zSQTHf1ZPt?=
 =?us-ascii?Q?9cWr3n7ctrTRZIsZG3QP4szui572X9Ik/6IzfLZkQ5zBZJ7EipfAEKvQqTrW?=
 =?us-ascii?Q?GWxGcX/AovUrUMTNzOFrRe1zzBBri8qNuHZ5uagBTfrz2kUs1nDQ8PwL/HER?=
 =?us-ascii?Q?jpUY+/W9SEASP3AIVrfh8Xdmoaohzp4+R3VWDN8G1BWXI5v/eE/wcaPnO85f?=
 =?us-ascii?Q?pLnukeLLADIhLNy2rsrbVc+RgnFHWhVooYcpyBg4lg3f0m0xCfvsLy2U+bjh?=
 =?us-ascii?Q?4fLr09dQj0mgXfV8bmw5lWSYhOl/IaPJUlFhSmyXBcYgKQJZe4RzNuOpYq7T?=
 =?us-ascii?Q?u+3+gjDr+FxxJM3JTBPz5kg2ksIpwPEPEFxKJFZy5xw1q4jk2lJiZI+2gmSM?=
 =?us-ascii?Q?9xCm8o8Lh6L8DfpgABwSeNNcQGDDNyqGPun5HsglbJO4hHzm/6VG6xPhftA1?=
 =?us-ascii?Q?djcU41uz+t9dZ0xm53OEFNHShZbou1sgwwKv1zAIOhzEjoL2R4Y0fdUzqAds?=
 =?us-ascii?Q?kTYbtgRr+RfIL52A5THQXN9vHnMsrc7/f7w3ofWpmcQ4CR2jiVb23ik70Bl/?=
 =?us-ascii?Q?yBR00TIqZYa3JV8LW4Fg36nsGciO1u93waHVylBpxpcpH+NMke3ePHuRw/3c?=
 =?us-ascii?Q?XKyeef5sJCel4Vep77AsJY0ofc60Mg0soxFqwls5TJoDddKo8YP8Km1wAlNS?=
 =?us-ascii?Q?Ly1usXvQfNXg/tJlqj1xPs2TYmmd60lscxhFtnQCIrrrQkHze+qcQ7EOPzx2?=
 =?us-ascii?Q?CcNCdj48hWG4+v126KMVJDGgdajzZ6muD45pzZsB5t1jbBEP6/9MHaeMGMAb?=
 =?us-ascii?Q?6KQcsZ9Z01RqwW3pipJJlpcLIdFpXLVU+sbwrRUoNp7Nhf9T1NJkr1Q4Bm86?=
 =?us-ascii?Q?w4MKYO0ipzVKxUm5Qo5FQAu1TcRfVSEtjlqZM3cnqW2Eul6I37GwA82opkYu?=
 =?us-ascii?Q?GinarW4Ibhdtd98jCiPmmD7kb07Tci6IbQ6fEnDK34wOfPdCy6VXCenDFYqn?=
 =?us-ascii?Q?b/XOIazT0ZG8l34EuXwZXRvcq0sFcTryRbJZ5dFo5ttqCnyt2CosuXIgEAq7?=
 =?us-ascii?Q?lnizPQie2oLmIW3MWWyLpP5KRjZCY7EVRPdRAFye5lV9EnNodY6lRT4+u86e?=
 =?us-ascii?Q?/uPqUh8M/7bPTbf6L84psE1CcjIPVoLCEV89xSlIm2EgXMRKmtCCKlucE/bT?=
 =?us-ascii?Q?DvqrvwWDi37aUCLq+9i8/BZa6Aum73yxuj8xuBVrLDLZr8DeJgfuflhzIqDE?=
 =?us-ascii?Q?O+cb0P5NOPCcYMGsHR8KJOiAQ8va6Eg/oFMyxEiJqkHdEQ5IzzMbuXGY+CmM?=
 =?us-ascii?Q?mnkXN5bXiM5lZJr3ps0IAYO6dUhKOF+e1LcIiUzErpNRX2gJRVjPlSjkbkOB?=
 =?us-ascii?Q?/JmqS0w4y5A7TzOXdWmfZmw7IgukvgHL7JGPHit3uqvlL2ZznV252J3f9QyT?=
 =?us-ascii?Q?IwkXe8JxFqlY4Jzw9H0T5O1K4p1Udj8cKaiElYU09hirshWQFkYCg261aFYF?=
 =?us-ascii?Q?VkAbsD+97RS6+T0oVv8xtU64XezuvEDxwCXdP1gXnhWTzNH4r8Mqm9o3yZKq?=
 =?us-ascii?Q?V+bXVFZ2rmXgobuXVnvOo6NPWi40UFyLea1fAerF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f188736-df00-4ae9-256e-08de10b81692
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 15:39:57.3962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89CChHu0joEqaARSpF5HaHXFg6S1oAr1ml3ndnulV40icJFkjyYLCgS7zv9m0j/jsr+T7sfk8hnH/eMJfZTn/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9765

On Tue, Oct 21, 2025 at 12:00:09PM +0300, Sakari Ailus wrote:
> Hi Frank,
>
> On Wed, Aug 27, 2025 at 03:49:18PM -0400, Frank Li wrote:
> > The endpoint ref to /schemas/media/video-interfaces.yaml#, so replace
> > additionalProperties with unevaluatedProperties to allow use common
> > properties.
> >
> > Fix below CHECK_DTBS warnings:
> >   arch/arm/boot/dts/nxp/imx/imx7s-warp.dtb: camera@36 (ovti,ov2680): port:endpoint: 'clock-lanes', 'data-lanes' do not match any of the regexes: '^pinctrl-[0-9]+$'
> > 	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov2680.yaml
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> > index 634d3b821b8c7..ec5c40684b6bd 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> > @@ -58,7 +58,7 @@ properties:
> >      properties:
> >        endpoint:
> >          $ref: /schemas/media/video-interfaces.yaml#
> > -        additionalProperties: false
> > +        unevaluatedProperties: false
>
> There are a lot more than just data-lanes in video-interfaces.yaml.
>
> Could you instead drop data-lanes and clock-lanes from the bindings? They
> are redundant.

What's your means?  drop data-lanes and clock-lanes from the dts file?

The board design may use less data-lanes, why it is reduntant?

Frank
>
> >
> >          properties:
> >            link-frequencies: true
>
> --
> Kind regards,
>
> Sakari Ailus

