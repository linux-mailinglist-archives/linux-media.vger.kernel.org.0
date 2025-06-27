Return-Path: <linux-media+bounces-36062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67238AEAD39
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 05:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EECD1C21126
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 03:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6CEE19ABC2;
	Fri, 27 Jun 2025 03:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YdCvzUFn"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5628BEC;
	Fri, 27 Jun 2025 03:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750994280; cv=fail; b=DUqb3T4sa3mPPTp67Ce0YfSBbLnetlQ+bvSN/cJfBt1t9dSAuEeX1Solr0ogo1VngDZeCzvhpGKC8xAMdLES34AIsviIN9BdwPcYT4E7Ej915C8e+0VYlrEMlPTqprGQfDxyRe352Xs2qbqJAm7PloUexDkFE/nx3qHRC4e9N38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750994280; c=relaxed/simple;
	bh=fnanrOrmIqppyDRGBAND+wYg8WqsJHRvXJ3TgPY8Qv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=matVLuwQxZW6ERkc4WMg2hw/Yki+k0ylN/YShwb8C4LJlA9fRbkBsIUCgSILEXJFZ+C7ZZ20ob1Mh6aeYGa5izqbNTDDpDawXFTV3h09rZMr5YTIDNSeFt/jlKEEtEIxn6dwkS7qUkk/SPVEp0wip3CkTo3ycbXOXlKRga2Ukyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YdCvzUFn; arc=fail smtp.client-ip=52.101.66.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rw/PjKLDeMgh3/GEPSJWKGWG4xfCcTI91IfM+CF+zfdlBFhG6vFiZ6/yY5MUrNSrXOkBjw2cqyIut2cLQW3nYI69EKLj8ctCRu3JBjZc5AJa2n7pb2wds6cTv4U9i1VVjqcTC5qUZuJ5lP/+0iS3DM1vRkF994ngWPJp7uN+v/gvw5ENUUxnnqXn8+a2wFYAX9/l57hrVo21bEpcjoCK7/dQ8vbm4uKh6V3U749etmnfQT2gUH1gQxgu074FB839pNfOtxT8qOvyUAXUbFEtD2HfuA5gR7AVVBm5iWVmK3ejs93CX3DuSG/Pih1ZNGCECxQbLQcU8wdzOZWGtH3wWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2jerTHbTprYVfPxz6ryyM50g1kwcMZDZnxfzWs0E68=;
 b=mdCo10SdBLj1cjpRHXMqwqEmn/7kTjacq214v01P4ceyTyKrvxYT/tqdfceap9p84f4js0zDNS7eMtEUfsF0fCbRe185PP6GhPd32AayABsJR4duOk454KoJkqJQUpFolcuuCQxf36f64CioIdb71OHUT3NVGTS0C0HvqwFaH+5pGRweCYp4lHAowAtsu/qzRgafUj/pdw4FpulsWdZM09uUFs9eRazQjCEedWmqj6UJVfyh6jfqkWb+F3Oo+jT9gnBOva3aWBqPEGddG62S4s2PPvkTcXfhxOdFgpPxRxXTaaH0P/2d25ZHXbLgm8Gm4H2J2sBLEvy0kumyMezhoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2jerTHbTprYVfPxz6ryyM50g1kwcMZDZnxfzWs0E68=;
 b=YdCvzUFnPIbWaZAynwIklQaVfS/ppIsaZWqGkGnrVnGK/G2JHMZCbLoQnNgOrRiibQvo9pgQ/YI8RFFX+U7USbxGxsz4uZWH/SDyXhofL/ZH999HcMWCEzsv4L3MhyyuRr96D5gUzikKiUuQR03j4J+aXuEO4C9zpsnxEI7jr/npj1XLaPYdhaO1hGTd1EfUyqkmj/p9bERtu0ia0vb0czPzyFxZNfP/ctntrBRfjukfq4Y+sWDX4Al68Gqc4sndgFOxJWIduqrJ8oK0AoihY/mYIh2woS7UohOZd7qQshrkIJgneo2dNj5CklM4WALtyGgqcu595O7szhnBYplQ/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PA4PR04MB7789.eurprd04.prod.outlook.com (2603:10a6:102:c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Fri, 27 Jun
 2025 03:17:53 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%6]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 03:17:52 +0000
Date: Fri, 27 Jun 2025 11:13:06 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: gregkh@linuxfoundation.org, stern@rowland.harvard.edu, 
	hdegoede@redhat.com, mchehab@kernel.org, jeff.johnson@oss.qualcomm.com, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, jun.li@nxp.com, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] usbmon: do dma sync for cpu read if the buffer is
 not dma coherent
Message-ID: <2vaop4ykikjpqvz6hrqkcze3y4opeoyute7xqajhhw3fca7tlr@j6em6wbug3dg>
References: <20250614132446.251218-1-xu.yang_2@nxp.com>
 <20250614141647.GM25137@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614141647.GM25137@pendragon.ideasonboard.com>
X-ClientProxiedBy: FR4P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::17) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|PA4PR04MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: 11f6e64c-b234-4135-e38b-08ddb52933ee
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?CLUfza3pMzGXUnmwo750lrfxOdQ2sPKcWPPJXe8eN03972iH7jkzW5J6wtLB?=
 =?us-ascii?Q?cZ2W3otIOGfhaLWN+yB2RbAnY/sb5s0PvOL/wcNhbbMkIZY8wHbHgolUHsA0?=
 =?us-ascii?Q?JRJf9cx5VB3CNoVCKG4TU4eRxe/EulKvXbtsPLyif28PbrFWmsgZ790dJdEQ?=
 =?us-ascii?Q?4GIZHIr2xvpXlvmFJI1JeGFAF9kLibZniUR/J2fIWFxT8xF/idEt1I83hRrj?=
 =?us-ascii?Q?xyPEWHk03NflIv3nVAmr4d14W4sJW1FCX0dVFJ8mvlPE8kOlJPEPBwJqVpFa?=
 =?us-ascii?Q?29E01RGIQpHa/A0S8458Jc4L1CSs2OyG2S2sYro44hm/LKJ2qbrVFrONFAhO?=
 =?us-ascii?Q?bl0w45VnMvyl+/RT53AsgpMSVSQBoRmICOhIejobL961IgBlPgy9BtMF7i7S?=
 =?us-ascii?Q?Nfn1g8wba0vWYcL8JD1TdmXlrVl58vKOrYLJdKax7x87bz8LeQbxOPd0R9qZ?=
 =?us-ascii?Q?1BhboCJTViVWykdfK6RSM3ENMjDzOIrDjAbHbJWekEdoqFzsY/LX4LIE9and?=
 =?us-ascii?Q?3nsjL+oSdmH4GN7mycLjzP88ppulLcpUsZVn4ED152uwe5a+iootKUd3mX1i?=
 =?us-ascii?Q?aHlwZQpqBm8dpScDGU2BXpFJ/fL6WfcrLmfMBvPlsoR6wat2VKJN0Bo7WBAA?=
 =?us-ascii?Q?MqCB8yadh73TMESzC6wHBEKGPLfCMziX3RnhoaH9k7/Jj6JG1JO23RFTMauI?=
 =?us-ascii?Q?53EeazI0TgjDkq8XrmjgIN8R0Guum3iZXktS1B+2V58I0Povfx2NZwuoN5HZ?=
 =?us-ascii?Q?xYfMqPwKuo7bz+JaEyZDz2u0b2XYEit2yIm2B0aLhrYFgUpUYuNvofsrGKLT?=
 =?us-ascii?Q?goMgexihmZomd5IJC4SGQQgOA3svjAtqeNnQ8ttjba5+NedDNHsyyroeZwl8?=
 =?us-ascii?Q?NxhNOl3OhstEPX0Ugk6Kr9l0Ct1gaQ66QjkJLhoun2EIHKSWdGLYUYKfHNTp?=
 =?us-ascii?Q?2ZRzOGilz0XowWPtQlAxTJwATruOa6LQcPufTjrbzf7G+L7OIsPsYqi0UJAT?=
 =?us-ascii?Q?jW2nxmnfzqQSunTMxD6kS3XkB7T9P+K97RPt9mT8kTHve7RfXdSfvg4AmRVT?=
 =?us-ascii?Q?tjfMwR7gnQg//B/FI/QLUzq2hI5d+wQdLoYSNUcu2cPG82nFf1l6fv0HVwSa?=
 =?us-ascii?Q?B2v0ppBe1yTbTuDh3kYNrJbKmroGycRT8mtlsQFUDnfGrJbPZ2JrtfCAbzJG?=
 =?us-ascii?Q?wcYylXMqpntJRSdP7hOPIzFmrNyzvBBg/7neCjXhBp/VB0KEAJSa0OLWr/sU?=
 =?us-ascii?Q?4JYjt03Z40EByLKsbGeGVV0tLaerZgq0lwQREqQqfRw7IPEEj/sm70MfyU1r?=
 =?us-ascii?Q?V2/XWPsDF2ss1Tw9SQOHwg6Y+AYhsxdApp41ZsI8Tygb63BjQa8xuzob+hum?=
 =?us-ascii?Q?JJvKK2K3ikbXhch2n82Xzir6ceFo5Eu/RMQLgV7c0YFMOZQnFu9JLMTiW41j?=
 =?us-ascii?Q?kKQu98mBhkFGCszzYEMZ7afdndVLs6HBSZfyz9MX7aPd/EmKrdpzrw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?oXCqj14ZDzZUWT+HtFcYtNCNzw/6XbQO67JzS8+jT1LSnNdjZoZWFOd6T+sL?=
 =?us-ascii?Q?dfzefWY1levM9JEZfJ4VG0NcRLpw6teLPB2P9uApu1CDPGfXprbIOtYi3bRJ?=
 =?us-ascii?Q?2swK4kfFvdGmeOEEvCN9RvlrhUeHDl3h32m1ujgHTN//UB3Y3bjfnsR/eqU6?=
 =?us-ascii?Q?FKdWCbdAeoCivNcNs95avS7DDLLaAqMCxC5qNvjRerDLDWRZuOsivKisnYgv?=
 =?us-ascii?Q?RmSpGQECYMvh27VRkGWUqQF4q6L94GjtG3O39vsI+I9BF9UJIKhCZL6HYHi+?=
 =?us-ascii?Q?Eo7Fsh/GNo04ZtEbFPociw0528oA4R7347hnOldKYaiPtJuIg91H3gYt1/Cw?=
 =?us-ascii?Q?rD9/BjqfVYi/7qOPyZ4igcOxHfnE0/ueNsREVPQyi0zL93eHxdFmbLSDH+YI?=
 =?us-ascii?Q?qDB3XHegmtYeIaQ3NUgSHYgASL7ozLyB6L1ZToNOGFjlwARkc10Nd9w7HVZo?=
 =?us-ascii?Q?Aqe+F8uJVs9VZP8io5ntiVJrznzgVUuQl07yI3mnOWaj5Z9k5Nb3cBWiZ/TQ?=
 =?us-ascii?Q?ZYCAo01sgrx/ydQMT+fTH97LCokC3CGF0m2h25UaEIs82TfTLKW/ul5Vz617?=
 =?us-ascii?Q?YMiPodntrlgOTUJ7mFSyqEeQPmw509KoeTFwxN7z/Bdd9u09REoZabiV02Qj?=
 =?us-ascii?Q?fSGxfzoHo8SJcVgP+D6YNrVgnV8SoysxWjCaety//MMCiNai7/nEo4idYXdI?=
 =?us-ascii?Q?FRMHVn3INnYZ1uepWAW8dNddHVyLJu6Tss66/5ua5/abWGuz4WOD42/UTnj7?=
 =?us-ascii?Q?xxZe8gL/aweWqDi9LEkbYXGQTK4QIBfbhN45MOjbr4jBAnZNWRQ08Yco0dEy?=
 =?us-ascii?Q?JvSSFqPGlD9OJ2Iw+FgUIOYl+8HMtY1qZB4Di5BhC8CptZgcB1toHAcfTMNz?=
 =?us-ascii?Q?4tU2dTjBziNT5OPqXD7MzAbiE3fp4f8vmre1yLmFGm99fqiQ6wSAGNd8B+EH?=
 =?us-ascii?Q?gh3R1QsgWGQ+jP3PSeLsqfSlO+JPLtZn5eoVQ4b9qL61lJJMR7dYiTZT9HVb?=
 =?us-ascii?Q?0Kkoff1joHPkGLV7YYvyxiRKk1+0XfpNjm01CIgfSAyF702pFtPRtzEtLON0?=
 =?us-ascii?Q?q9hLcHeMPiOg9VQnfjCkXNPzPe91Bi1/keCpWikWq9K7EZAjzlTFc4CgmQyp?=
 =?us-ascii?Q?b03UceJ8DIpJCppMFPoZ3CMphxwmlUz9jIlFzp+fnyDvIwBU+jqrC2IrOVka?=
 =?us-ascii?Q?7VtUMZAm9NKW7IqEJMl3OE/3nscRWXYktFei7x2PIvjZ3GLM8l1lB8vxrbyA?=
 =?us-ascii?Q?tOkfp66FPT5RqHOan/Yqey0JzxoxTvjRIGo2nSjdab1bOd+Kou7+2WkU5Pry?=
 =?us-ascii?Q?YPYrE7V+00QalWTa6j/QWFQBcI/U7iZaIpcQOqFcrSRmXv/F+OCx0tphiqgH?=
 =?us-ascii?Q?1UFmCadmEeOSjXTatmYeLs3Hlot5YuLb4m0rV3FhCG0JxkZ9M6cJhpkOlR/W?=
 =?us-ascii?Q?yoU8X3MzxngJaob3NB7/E/Fc8yXk5KdKBUDn3BCjODgy+hQbBJwLXoxnfk8R?=
 =?us-ascii?Q?9DzgZ1+Ljchv4cpl6bd89A2hCMs32rkImZ4EQML1yc5fG/R7f2liT8CX7c7j?=
 =?us-ascii?Q?Wyd6JBeH0u2mG4BcbZnkI47ZyE0mV+Mz6NDqHL67?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f6e64c-b234-4135-e38b-08ddb52933ee
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 03:17:52.8128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6kncRK6MtKwULmrvcJJSOQQVny0WL2474Zi+L6Z2F636ULC3hT3iMQAre2SqxGm0fWPhshQKhveGSDzvvMyAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7789

Hi Laurent,

On Sat, Jun 14, 2025 at 05:16:47PM +0300, Laurent Pinchart wrote:
> On Sat, Jun 14, 2025 at 09:24:45PM +0800, Xu Yang wrote:
> > The urb->transfer_dma may not be dma coherent, in this case usb monitor
> > may get old data. For example, commit "20e1dbf2bbe2 media: uvcvideo:
> > Use dma_alloc_noncontiguous API" is allocating non-coherent buffer.
> > 
> > To make usbmon result more reliable, this will add a flag
> > URB_USBMON_NEED_SYNC to indicate that usb monitor need do dma sync
> > before reading buffer data.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/mon/mon_main.c | 7 +++++++
> >  include/linux/usb.h        | 1 +
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/drivers/usb/mon/mon_main.c b/drivers/usb/mon/mon_main.c
> > index af852d53aac6..b9d5c1b46b85 100644
> > --- a/drivers/usb/mon/mon_main.c
> > +++ b/drivers/usb/mon/mon_main.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/notifier.h>
> >  #include <linux/mutex.h>
> > +#include <linux/dma-mapping.h>
> >  
> >  #include "usb_mon.h"
> >  
> > @@ -142,6 +143,12 @@ static void mon_complete(struct usb_bus *ubus, struct urb *urb, int status)
> >  {
> >  	struct mon_bus *mbus;
> >  
> > +	if (urb->transfer_flags & URB_USBMON_NEED_SYNC)
> > +		dma_sync_single_for_cpu(ubus->sysdev,
> > +					urb->transfer_dma,
> > +					urb->transfer_buffer_length,
> > +					DMA_FROM_DEVICE);
> 
> This will result in a double sync, impacting performance. Futhermore,
> the sync code in uvc_video.c reads as
> 
> 	/* Sync DMA and invalidate vmap range. */
> 	dma_sync_sgtable_for_cpu(uvc_stream_to_dmadev(uvc_urb->stream),
> 				 uvc_urb->sgt, uvc_stream_dir(stream));
> 	invalidate_kernel_vmap_range(uvc_urb->buffer,
> 				     uvc_urb->stream->urb_size);
> 
> The difference makes me think something has been overlooked here.
> Finally, uvcvideo supports output devices, so the DMA_FROM_DEVICE
> direction doesn't seem universally applicable.
> 
> It seems there are quite a few issues to solve to merge this feature. If
> the DMA sync operation can be done in a generic way in usbmon, then we
> should consider moving it to the USB core and avoid the sync in the
> driver. That may remove too much flexibility from drivers though, in
> which case it may be best to let the driver handle the sync in a way
> that guarantees it gets performed before usbmon inspects the data.
> 
> The issue doesn't seem specific to the uvcvideo driver. All drivers that
> set URB_NO_TRANSFER_DMA_MAP seem to be affected. A more generic
> mechanism to handle that would also be good.

Thanks for your comments and suggestion. I'll try to handle these things
in usb core layer to remove above concerns.

Thanks,
Xu Yang

> 
> > +
> >  	mbus = ubus->mon_bus;
> >  	if (mbus != NULL)
> >  		mon_bus_complete(mbus, urb, status);
> > diff --git a/include/linux/usb.h b/include/linux/usb.h
> > index 1b2545b4363b..d31baee4ffa6 100644
> > --- a/include/linux/usb.h
> > +++ b/include/linux/usb.h
> > @@ -1368,6 +1368,7 @@ extern int usb_disabled(void);
> >  #define URB_ISO_ASAP		0x0002	/* iso-only; use the first unexpired
> >  					 * slot in the schedule */
> >  #define URB_NO_TRANSFER_DMA_MAP	0x0004	/* urb->transfer_dma valid on submit */
> > +#define URB_USBMON_NEED_SYNC	0x0008	/* usb monitor need do dma sync for cpu read */
> >  #define URB_ZERO_PACKET		0x0040	/* Finish bulk OUT with short packet */
> >  #define URB_NO_INTERRUPT	0x0080	/* HINT: no non-error interrupt
> >  					 * needed */
> 
> -- 
> Regards,
> 
> Laurent Pinchart

