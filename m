Return-Path: <linux-media+bounces-4451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D3384311C
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 00:24:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C62FAB20F23
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 23:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BAEB79943;
	Tue, 30 Jan 2024 23:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OneFDO++"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2105.outbound.protection.outlook.com [40.107.114.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE39383BA;
	Tue, 30 Jan 2024 23:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706657053; cv=fail; b=qgW4zd7kGB8R5zVc8/CwinFcebKTUgJIdqtRLB+qIyDxcGJ4kuhybhbaan6uCW99dpQX5XWQdd1E4ar6jptbwG+CNyLYxsF3cARLKd/XWkRnFhUpm8siWlHP5lL1p78uQkppH9vo+oeGPqXqjExYV81jD9Jy3u10+O8ql+eCJvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706657053; c=relaxed/simple;
	bh=6MLF/KAaYgpmHoFzFuoYCwKIkMsSWOPeviQEfbDCrf8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XUIVNP1yYz6oDNJ/SWvwPfkZ+fZ5f0A+iSYCLi4NArKY7P6t88LDr7TUKWnHhC5PsdVle1D049x7rgxUx+3naC1ybS1J1XXZtricHnVCBeuqK77aHOC1Lt64g1IecUiwkjdudLFvwwzkRdgDDaY5xJQqub5yDuEByBpD7/LdvJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OneFDO++; arc=fail smtp.client-ip=40.107.114.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXQmgcKjx7TSXZf1uCMaVetlRgz1t67Mml4XY39JEJFuuHhotLejgw6OCsMtcXCc/596f3mH2y9VmCC0D1zp0xtA0sgPFIsEg2G8GzOh0Cpsv4QDbHvRVTsiBasC6UvvpvioSRDxVims6LWHUyxOLCJInJeuVlpM4WwcYlKQCz6fuoo1oYf1JEPujExe8YAPzdJQTKB0Ne8Rio5tUTme2xip3z6fpa/qXsMGNHd2FAaOBcpE44GRdmvozWZVVbZpMMIcDk1HwxoFWYnzjltdCOHb7ab++ovIA2B5NxMIkwVLn6K0LnscUv/MwYmO1RarS90YU+VLcqhUy5uAgfdhdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcawyKc4RykKPj4HxeOmKS3j4dyzLTQHOuiPk97R0sc=;
 b=J6pv72VtSSd7IxJpVdNI4pYgp/YBiXbd3i12sk17BkLlIz6/+4neFpxbb4rGpVghAqef1vLYlgYkfoMVYRNFMK7SKXvPwJo1RyAIOMazRwodfpvPcfUfiIhB9/22sv6ChM5S8qn9FZi5aXPiD7NgIWU/swCTvkNGP7Ykg11G5lED6nXkRfxFqwAZlcf0y3Z2tyBOsnhiGhZHHRpKgTU4epopoEKTXYWBU80sOgeC/Z7f6F3Yr7u/cbUMGGXULhgPD5rDDxhNCI8F52UY9EWLP2XMXBxSAauDX4AXnkHh7QF88HdMq7ZUufMk6aMj1hJYUWt9ouwFzaDH/1xKjDFE6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcawyKc4RykKPj4HxeOmKS3j4dyzLTQHOuiPk97R0sc=;
 b=OneFDO++R03qFZQ/ngs3iO117n9UMN4PctdQaCTfoWt9Oatjbe1PKANqPspL27F2tpPs+atzgFKdzgvqGqDi3yexxEoRXDYLL8ZWUmKuGOx3kFp9jzdx3uewEXk9xZIyeqrbz2Bx2zDarRQwpKpFtPqr7ZjJRR1ob3KfBfhn3eo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9762.jpnprd01.prod.outlook.com
 (2603:1096:400:22f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.20; Tue, 30 Jan
 2024 23:24:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Tue, 30 Jan 2024
 23:24:08 +0000
Message-ID: <87ttmu76co.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,	Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,	Uwe =?ISO-8859-1?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>,	Daniel Vetter <daniel@ffwll.ch>,	David
 Airlie <airlied@gmail.com>,	Frank Rowand <frowand.list@gmail.com>,	Helge
 Deller <deller@gmx.de>,	Jaroslav Kysela <perex@perex.cz>,	Liam Girdwood
 <lgirdwood@gmail.com>,	Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,	Mark Brown <broonie@kernel.org>,	Mauro
 Carvalho Chehab <mchehab@kernel.org>,	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,	Rob Herring <robh+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 00/13] of: property: add port base loop
In-Reply-To: <Zbin6Pg6oNp0cTNO@valkosipuli.retiisi.eu>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
	<20240129122736.GC8131@pendragon.ideasonboard.com>
	<ZbeoPBvGJlaJco_J@valkosipuli.retiisi.eu>
	<87zfwnirps.wl-kuninori.morimoto.gx@renesas.com>
	<Zbil22dm9x2ZudJC@valkosipuli.retiisi.eu>
	<582ede29-2df7-4f01-a03b-da59d9f56d74@ideasonboard.com>
	<Zbin6Pg6oNp0cTNO@valkosipuli.retiisi.eu>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jan 2024 23:24:07 +0000
X-ClientProxiedBy: TYCPR01CA0141.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9762:EE_
X-MS-Office365-Filtering-Correlation-Id: 9477b1c2-c7c9-4743-0f3e-08dc21ea8ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7q214FHN5njhXoMaUn/eW1sCUtyVWauR3YJqvSauVF7uFIf03xTljP5qCki3EAMVmLB4SUq+vBx6Rqa441I3YAFk9NtipyAibEy2T2Z5YdeG/NWS0UAc8qYZGhrfLwna/K7qiNGB5Ggo8m3C0uEZIOb4h3e3E0Q49UBdBe0QqcsZE/E+Jx9unXPmD+y+SQeNOpjAdzmVl7tvPSV++nwsjhiglsLMgasvPhdJ08iOrv8ilV0wD1nVzgwuYJoH//9t0g1ilGoNkTand/eMa+bB7XpHD7imVfoE7et7BitP8OAaWiEVpDdWiykDdwCwO7zoghJVyaFfwC5NRkJRRM+y2HV+mH9h9D0V6lhpws805BK2Q2khCIg842i9qT8gxVI3I/isdyYX/5o0Dz/Vh1NFjBugVl1ohuSBz7g3+JNz606RV3H4udco132jMKbgioVY8O1St7Ba8EyWzx1xdDwlSkQHTOstIrZ6ykk7MN6uHO0Is1mpzhVn7RSF6l2KKWadhk5S/pKcIDS6fSsk97/f0VI98m5NrdQzZra49Leboy+2EfyY16/fIpXlAZjpDEtkU1e/jstOiiIcD/+uhbYZTaHDI9CORIvL7y1dqm6na6wyQlooixAyrplLl6zEBMAy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(39860400002)(346002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6512007)(6486002)(7416002)(5660300002)(26005)(6506007)(478600001)(2616005)(52116002)(38100700002)(4326008)(8936002)(8676002)(66556008)(41300700001)(38350700005)(36756003)(2906002)(316002)(6916009)(66946007)(66476007)(54906003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YocHHeMxxhtjFGZOjAkwst7EK+Mj00VH5dCmdfG7lXMPJH0E3X7hEha+juL5?=
 =?us-ascii?Q?P1nMrpio0sxTuRsNRxbFgzI1t39TbiF1LOT0YISQxtfxabxHBrTV2VZTswis?=
 =?us-ascii?Q?flh61cuxUzNXKezhhanvKhjQBpOYL8rXBNLWlbXegm3ON2sh451MhDq3yy0F?=
 =?us-ascii?Q?W3vUT6SaznFzaG9zbVCieI614Ht9IYl/qruvUR3H/qooubkT/PgHlR/h//Wi?=
 =?us-ascii?Q?apzlLsWjcDbqDC4/AlDlJn5KXkfvr1fV+AU9FWWi/rwlaWguvN7z9Jtz1mMw?=
 =?us-ascii?Q?wTtKqzzks0YpFLylRLtUzahoNXb4TOIWzeGmFBh0Kjo/W7fl0bbYTIPtTfZS?=
 =?us-ascii?Q?ulAEpMpAo+5znW2IMUYk7QLYm33+x7XNc/Kn+4/dvrgn6njE+h4UagkfmA59?=
 =?us-ascii?Q?zaQFukvqphweima3ndcWt6jwDGyFb8i1YPd3rO11uFSHuzZTJdKOI290EIDR?=
 =?us-ascii?Q?6JM2KdEjbOG47b7EPqvKygrDTIcY5VUiexbrLaIOdghZuaSixqmwVg+uOR/o?=
 =?us-ascii?Q?GcoG4CuS2fhExl/NJzxJEpYbZeiVgUEOTZwTp6rtAQfFTzsXLXoewSSSUOl+?=
 =?us-ascii?Q?SFVw35wKuXhgvAMm1PpFPnFMPD3TVdC+GwxlzSlDPFadc5v2cnWAwj3MIcTb?=
 =?us-ascii?Q?E4CIRJCrge0V/f4eGoSJyb+qoJ2gKlREBK7eVGQBHxC0+ZimPr0zuMI/7lvW?=
 =?us-ascii?Q?v9FKUd8NnkE0xbiTWOVHcPsaoY4Z+DD4KHAGQ86LGg/3oGa/Pgsxbhii8xQE?=
 =?us-ascii?Q?4s3/p17R0PlBoGLTy+tI9gE0Mn5e6FTgTKmZYmNbf76cGiprtUjanvGdbStz?=
 =?us-ascii?Q?ShrXrTNuBoFpcME1IHE1JPwWDxFfrGLhGrSnCh9/Vuahc5KOYmL4SBADJQLF?=
 =?us-ascii?Q?CA+z08fZa6yLMgI0+kT+pyJ4StymDzxc1nvmAEjKl4yVtopiU85B13l7gi+F?=
 =?us-ascii?Q?N+3qLEX/ceovsCT0nuByuzazLx1lXfaG6TkseO1OpO+xFKXMgBOgGddyYkY9?=
 =?us-ascii?Q?4I0lh/F7waLq3Rwkjo9RJX3pzLaWtB3LCEio73I/XSzbo74Zae7QV6s2Q2AP?=
 =?us-ascii?Q?KZOovIer49t0GflxEjITPjzZCCxBvfLazSAD/iJg/gvuQE0jJZsqmv68i530?=
 =?us-ascii?Q?nujz8eaahZS11VomdHsQyW9MG/mV/Oq46Wj0qgYeTKByaQghTpW/Tb78KE9k?=
 =?us-ascii?Q?Ktcn32QRHob5Qm1PVOns7GAEsBdGR7kiHJA4ccUGFEVXyQ4YT++cH5fhqEuY?=
 =?us-ascii?Q?qDLF1qOP7Q0nQ2+kmW8KyKRvE1HYwGbLF6ttp5lB/wnA3v9CZqx6cEDF/VKX?=
 =?us-ascii?Q?8YKGF6caImfcWAZvCxpy4v2X35H4tZ+HI8JGp+rW3e1D6BBjXurnyBx4602n?=
 =?us-ascii?Q?iqOXTONmkok8Z1R6ZZbYhbeQJANB2sY5Y2GH9pMPnMYdSXxa8CEFbXRtjG1t?=
 =?us-ascii?Q?b8l9TItV9aGujfLBSeKZLI0eA1QUwy0rRsdizol+i9Pfrk/BPgWPC1PWT1hs?=
 =?us-ascii?Q?Qm5qZT+N2arFUY1nb7NS3WI1RL0naT9LKGnt5/ZS9ZlLZJDaN3/2cgDNu4zn?=
 =?us-ascii?Q?u8ewPLAgRD2+Cxw7LXzbZx9zEe2sWXGQHK6NgdZMv6llSlLo0uDI4M5WAUBx?=
 =?us-ascii?Q?EHPQ9dWtruh749+mtEBdeLs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9477b1c2-c7c9-4743-0f3e-08dc21ea8ea8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 23:24:08.0220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kt7PqOuVMHeope8tj6HkcHe4VU++7wf2bufK4Qg4DSjBv72ZVSD5Pu1fXXE3TC0hmGKFhNiejw9shHY4t61C5WmS9/vyzd5f8YVQZknf+I4IAo9lVibSN0z5MpBlog9X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9762


Hi Sakari

> > > > I'm not familiar with fwnode, but in my quick check, it seems it is easy
> > > > to expand fwnode side functions if of_graph side function exist ?
> > > 
> > > That would be one way to do that, yes, but I suggested using the existing
> > > endpoint iterators as that would keep the firmware specific implementation
> > > more simple. The (slight) drawback is that for each node returned, you'd
> > > need to check its parent (i.e. port node) is the same as the port you're
> > > interested in. The alternative may involve reworking the struct
> > > fwnode_operations interface somewhat, including swnode, DT and ACPI
> > > implementations.
> > > 
> > 
> > But we still need the of_* versions, don't we, for patches 4 to 13?
> 
> Yes, my comment was indeed about the fwnode property API only.

Thank you for your suggestion.
But I'm not familiar with fwnode, and it seems we still need of_*,
I will keep current style (= non fwnode) in v3



Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

