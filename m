Return-Path: <linux-media+bounces-4380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D1984177D
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 01:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5A771F2350A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 00:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA881A723;
	Tue, 30 Jan 2024 00:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jzt/mU6j"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2119.outbound.protection.outlook.com [40.107.113.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8196C22075;
	Tue, 30 Jan 2024 00:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706574903; cv=fail; b=DHeaq10NEedQM14A579RUnQBZ6oHHdctFRJGEPk5wADGUwx9ow1wgKo63eHO2qta/k1vicvX+TzIagUg/fSMFvKWQmDWmwyP1gn0G0E3exEjMRfMhdG3rujbg3sZ6F+je0f7YjyKDnQh/TjuQZc08e4mLydu+Nmm9U65c2yEs58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706574903; c=relaxed/simple;
	bh=PMM4eeP2QfSdwyIZU+w1XlaSbZa5ypQoj+cTCLdjUgU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BB6bDDk8B63zq6mFXzsGTFLJYyPRlOk3rfSGnuR5dOrkUrx2S1v5ZjHhCPECx42Vz8Qo6JTrS0cl93Bjo4lSrhrzEstBdlhl7JLSsD8RL+QS9n+JBj+Vzxm6F00x5UzFppAH4erj5s/4o7lPLtXPOb079T09Czu7cXTFK5SAauE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jzt/mU6j; arc=fail smtp.client-ip=40.107.113.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4Ywnhjyp4g+R7qhKZjDW1MvgMZKWiO1ChLexbYZKEDDGmlTiFWzsFrQrfQPK3Xa4XO/NvUkn48FQlkAuImhacnzhuy2rvQGMoJgLxoY7g+Q5scJIOuUkL+1lrxT+jaRz1GzXsshhwnZkMcN/rWs05/p1EZ+PA1EiZOPcPQvnKGXlmnFueMItbzDTUCODZo++J/TPzqTvtjtidWRZkAID+NxR7wIpxC0T0C7Wu43XFdXovuMiL913ctaqQfRslmWeWEoq7eQ+nTKdfk/To0yzbcFyGdaYX58arpdw96tWvuySpQQToXrwhDC9bAJfBAAYzpZBUtrBsoBhh9Rkyfyhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDeIn02d7cPelOIb5bBSkJlmbF66WGaSRkDfA/21qOA=;
 b=CVRin+cfDQ6fVboCYhPkhQWNQLKmpnjTGQ4IVd2mEFqAUI+hUBfDCNstUiSFOb72hGcP7o3MZ2mZP6JSiXvSdndf7Fk9v/MlI6q4NG33RCcTAmnIFDZNgEAFgG4SDyRXAlhJ7wI7mLqN72kNcdn5lkZJ/DxkMbOAQ4Uul1PQYYVbKQSuSfRd0ls58IxQG4x5snb4TRE2d4FV4108zEoEJ4iE3QORLsHn6+mPtdJJFjbcNvHZ0rjl6zM2vq7v+yQ7tifCuz1l5u1Z2FtZC8UIA6i2zCqP+/x23u5hYC3yBJHkK73pMAW/wg6sEVH7ML+K/kq/YbbjDZd/7kMCc5iP2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDeIn02d7cPelOIb5bBSkJlmbF66WGaSRkDfA/21qOA=;
 b=jzt/mU6jNNytyO6Vs4zhdSviaA8xN8Me0FsHp8yCHQ5tMpPRQNWRtyfLOTOj52BZJ97h5fhhhEvZsPPTM8EMgZ/O/oyDDbzAQwWJRanA5usqRpqX7fal6EuUSJGg72reNFY/6dBgxbBAuwV67pfCDxmRwGrtFGp6L+wDzGkPDLc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11306.jpnprd01.prod.outlook.com
 (2603:1096:400:36e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Tue, 30 Jan
 2024 00:34:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.017; Tue, 30 Jan 2024
 00:34:56 +0000
Message-ID: <87zfwnirps.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>,	Daniel Vetter <daniel@ffwll.ch>,	David
 Airlie <airlied@gmail.com>,	Frank Rowand <frowand.list@gmail.com>,	Helge
 Deller <deller@gmx.de>,	Jaroslav Kysela <perex@perex.cz>,	Liam Girdwood
 <lgirdwood@gmail.com>,	Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,	Mark Brown <broonie@kernel.org>,	Mauro
 Carvalho Chehab <mchehab@kernel.org>,	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,	Rob Herring <robh+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,	Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>,	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 00/13] of: property: add port base loop
In-Reply-To: <ZbeoPBvGJlaJco_J@valkosipuli.retiisi.eu>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
	<20240129122736.GC8131@pendragon.ideasonboard.com>
	<ZbeoPBvGJlaJco_J@valkosipuli.retiisi.eu>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jan 2024 00:34:55 +0000
X-ClientProxiedBy: TY2PR02CA0064.apcprd02.prod.outlook.com
 (2603:1096:404:e2::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11306:EE_
X-MS-Office365-Filtering-Correlation-Id: 1445c5d9-002d-4c0e-aaad-08dc212b48b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VE3TO/MuOd/5AJmnthzgMUthBANgBtMbiSQ97gAYPZZjjqccdkiAWR8DUzOOzSJ7C/AvN3uEPYKGBtIykvzbevQG2WRB5z9kl3/ay6KFaXf7Pq/prXGT6ZHFXCi6BrN0FY8vOXW8Hib+++2eJC1M1BSWbSWSeJouswVOGzsLtR63w+E5WLUJ5KiOSPGN94iRLX4Dr1OIrfbqDrku1S1sxRQPw/3PcFs1fvKFlbny2Izvj2L5GI3+HKSVnYveBulcvwxlPM5Lx6NSgxAjcGV/FTXb4mbU/jTi4YRDXzJ+5crd585oZtV1cA1hQVYOaSFJIm03QpTiK0rVfcnQpNkYNq8DFR38o/3bJLtjs4B5uXhbdbg/3f+B6lZl0jElXB/Ws/FRdErHgxdJJ60nFTenFNTrE+Fh1zv+DcQ8zMDd5iQTxRLP60ykWB6l/NNdWhDwGRdvr/NzIXf1A7MDDFBc4PsG10aG+akCxAq/WpJJuMo6iPlapOpnP4luudpS/byRuuwdZOziq7AosEGdbZEHAcplE9zYKMDk3KbLnBC5C7tTvnbDC1NOxW25cK9nhoxn/U+2HkZ0sDBZD8/Z3OC0l0ZKX80wlwxlEHhUH3245AQHB2ZsrA+V+X4XOGdbEF8Y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39860400002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(38350700005)(4326008)(2906002)(7416002)(6506007)(52116002)(5660300002)(4744005)(2616005)(8676002)(6512007)(6916009)(54906003)(316002)(66556008)(66476007)(66946007)(26005)(38100700002)(478600001)(6486002)(8936002)(86362001)(41300700001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0QEiSwK0ev7WMyVSxAtiP+7mtrbTE9/VxYhffBiahZljK3zC2QQWi+RuBA8L?=
 =?us-ascii?Q?5YY2G+4w+1q1h8YbXh/FU2ttX42H2zQf9Eh+pK5ymdQhSIFl+iewwrgHrr0j?=
 =?us-ascii?Q?ycuSTsPW5LSL5SN6Yntx63j4WPTMAH1LGuD+6F3L3FjBqGxi52gl5FAk0rmR?=
 =?us-ascii?Q?ByDzaGnK1nadCmiYnS9hwTZYKgBfyB6uO/LrP1DYWALdY2prSRyQQl+bsT+Z?=
 =?us-ascii?Q?qnpdWqoTgcyCk5VKAOB84scb1+QFEtfs+pH3r1GxSN7NjHAGVWg9IJ2hWITe?=
 =?us-ascii?Q?JeF915Gr4x1LvsMcBTnLI5RSavpuQNlWyfP0h1+bXAMSGfcza2J1EoPHIKLQ?=
 =?us-ascii?Q?e2/bDHTVM0sIkvg1dLW11zOf+AYR2szq6Z6m4lSRDyt+/7p3hyAQvelCIX64?=
 =?us-ascii?Q?p4YSN+ZsvMGF18alrRalTJwcR03zIWHWDk+5/ytBoS17a3pefE89rzzU2vJz?=
 =?us-ascii?Q?I9MGoFJ+XgoEpq24qJRguK8CA0deZMf7LEwZegdQg9EiPAm9PDLd7L6dTgX3?=
 =?us-ascii?Q?5//Hnb9NxAcfoHGCJa3I4c+G6IGxhCmkM46yaAYA9EQVySj9A8WJyrKfv7bW?=
 =?us-ascii?Q?aAM+rsVmTvmFMXAdJPMSmJgN339q/ghusWYHZ9jOSo8xkjfTDJQb/J1NlWGP?=
 =?us-ascii?Q?LhV/uL1XHbaudf1/jluru5g6JHnoE1laHsdm9Y0lz5sH7SxzNlB1e0rYCQrc?=
 =?us-ascii?Q?ZCxvVbtoziW8mUdU2lHlBNbSglM6cY4FJM6lSYTR6O92wCHmAGTLqpEbfDEn?=
 =?us-ascii?Q?ndeYeu3pSDvUDyrrfSf+pBFdhDFsSZhBrExb0t3/f9JZRrJt4NLam2AcEKdM?=
 =?us-ascii?Q?oXhKT+WbRUPyDrme471YZ7dYMg0W0j8VR6SNMOdcZJpUKF5bNWGnuU3GQ308?=
 =?us-ascii?Q?ImbQQS0YFlrbheCDUSjBmLCR57hAvOSYmeGHr+jR3bMjC/KHPsdc0/4jWW5A?=
 =?us-ascii?Q?bHLgr2XU+IGgo7hptBJJdU9CGZBvS/qRec8YBAYjlllaFv0sMvqXCd8+4urS?=
 =?us-ascii?Q?nzW2mGrAeYD9RYh2jQ4CgTmqMqLBY6AJZImzWk4I3dZxkePx+0bvyJd1e6Xn?=
 =?us-ascii?Q?yc6JGvB3N+XGm0xJGMuWgi4ElKvi4dAztUIM+MwpbYnPidtU5Ent3mfBTmzh?=
 =?us-ascii?Q?uzpkQHpwziKub1QRxacNgtbj5mr36kyHPDNf80nDcXKW3nSfPKtsRN3lqRwW?=
 =?us-ascii?Q?xl69R3VhSR+40H8hukzU6dzrkJJvkDzcu29icvoMnYN8/wzShxolt03pAdk2?=
 =?us-ascii?Q?z9B7gGUAiPwplI87qB/XmkeWsb+fNKGICuAKqHqiqDtJCbFCZ87CG0BNiaES?=
 =?us-ascii?Q?GfxgyHSsyUsK701hz9aYn4ylPT/JmYqsSx1sUk9l+/lYDiXWQcD39f+94LIR?=
 =?us-ascii?Q?VEZe4avyhDbgfmvVBrWzy8O9m7N/B/5Z/AvMtfATr+TNr7pBz2En7cSotv4V?=
 =?us-ascii?Q?SviugJS2GF7oF7BOLiWJR7y2O7DEKnBCip2yc9Ou8NdHsv4sHj/efYqLq0OB?=
 =?us-ascii?Q?jzRlurPBTY52ZpH7gM8o/zY6Y4F0EX/7KfvH7GcM4+swULv6BAaYuYWlAjrL?=
 =?us-ascii?Q?C9BP6+4RGpiDJe1BnkSyMwwDMuB9nkXqs3HOViNLmV+DcOgqEikuJbDz5TLE?=
 =?us-ascii?Q?BQ54W9vC0RAZgPrnBm1jLDQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1445c5d9-002d-4c0e-aaad-08dc212b48b4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 00:34:56.8792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnrctYgYwKdLWjIt8RhIft3pzAcEslZ+/Ukxp+VpQqn+uDnf/hXVECX7H0AHKpLQsAL0LFkEuaMS/eKI8iXnWhXiH7wy1GJqSnIm+txUDJPuzPe+h16tIIkTc8A8m5ng
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11306


Hi Laurent, Sakari

Thank you for your review

> > The strategy sounds good to me. However, I'm wondering if you shouldn't
> > take one more step in the core, and implement these as fwnode
> > operations. Or is there a reason why OF is special, and iterating over
> > ports would be useful for drivers on OF systems but not on other types
> > of systems ?
> 
> I'd prefer that, too.

It is very easy reason, because I'm not fwnode user ;P
I'm not familiar with fwnode, but in my quick check, it seems it is easy
to expand fwnode side functions if of_graph side function exist ?

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

