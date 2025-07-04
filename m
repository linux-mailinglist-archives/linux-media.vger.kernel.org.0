Return-Path: <linux-media+bounces-36804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A20C5AF8BED
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 992F63B0524
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 08:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79469288C0B;
	Fri,  4 Jul 2025 08:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="afo2KE3Q"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010058.outbound.protection.outlook.com [52.101.84.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C6B288535;
	Fri,  4 Jul 2025 08:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751617316; cv=fail; b=e7UhNWR2ko1PczbKpzYtHyCqtHZC2I3AJ9hSHqNzAekmB4NBdpq7mNiU8CaDcCUGVTaDwKUcbHIEfqE8ULaSEYcytUL8khtTZnY8YvqaxEQmyW+VeNFxJadxfCJwS5+QYFVeG+dHq8IVxvzLSB3Ah1piBg0gYmafdpbVUj+7SX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751617316; c=relaxed/simple;
	bh=ZiyjxB+96MunoEp5H2b18hu3LYDWFE1/CIuUXTYVvoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V1K/Rc3lPeL7ftX2qtL1nZYnT8+GNsA4pZvHbM8RMsjcv2oUNlM5ikVLXLbD0ltWfVNhXmP/CWIKDbpI4KwgNsxo6EHchUsm7IwQZZvdbDXV/kY+Cm9hyTGStRWJIHKQWJbZCX8xUO7p4V2MxbEtl/3v8oW8WpSyplpMrpgxQxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=afo2KE3Q; arc=fail smtp.client-ip=52.101.84.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9ifdcezuxSsv0dG/Zb6P7J9XaDwUBGGlfL8u0rnKdHDOHF089rPrWhQ4YMG0i2zLJo1qv+Yy5DdPq0np91Ms6xMAbWtMEXu+K7BvCtSk6OwV7MQASRKN+O75M6RuWGY0lV45kMgPCxFLhUdksENx44D1ci0BkjMMl2Fhoe8r+42qIA+bVl2iQzXEFY/kYF1hCkRexudwCN9DzRQECppAsvKNRYWwCqJK6RmQ36tKRpq93ppIy7eMhBf/jsfp3iJqwrGidWy52nFgodLeZ22dnJgaL4uHTl48F72Ql5eWbmTkVhSVEvmwicy4LNF+cgdULSZChIj6YOcuE4De34iSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNXaqcjj0ZWo77NeEuM27xXwmw6LKB/cMY4cMB/4HS0=;
 b=YHXG8PfROtaP/t+PZYmbgIQkLCruC6HpPY/jv0Xp2Iik3zVCt8bUwn1dazSvS4X3nixl/Vl8PL+QehcgM3J3X0qV5f/8GXQISwTkx3Dl9uVMxl0yiBkGXhNjA3OtKhH0oCd0g0UEP1foYZstL6rS+x93eEcaeu80SWPsyDuuGn8s5NLtQXHlldJI3dx86bnwcEqVF1cksbBOZoIJL9S/LCeZJV9vB5fBE6Q1k4mQVGW2I+5AITscc4ipHDfiUCcVJvlHvgRGJxgNTwjps7CD7SUW5/c4qL4pc5onT7pz0q8zBHkKGbPgwTLozN0zDJu2BCbfCSn82zxoa9upYuT6/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNXaqcjj0ZWo77NeEuM27xXwmw6LKB/cMY4cMB/4HS0=;
 b=afo2KE3QkoT2eBlZcuLC/32fWsoxh2tHbwOrjDF2r9I5cD5OGN0iiWK5Db5P8m2bQf5CKWO+JWQTYt8npxrdq7RRdDrtxZ4efAulbtYrvhEa6QET4VSQUIq0QxMkVP9jFEksuZR3skNSQQQK+SEVCYIFTFthppmvR/RVqlIEtqW0kLxelaHlRHRpOC8qAXE1h6RRlTeugpiadvsYHU2x5PtWns5Cbzlbp5B4qMnnhT819BhTJe3NAD2q67ot5U+52JKn7OB18U0WSGWiSAXMnFjXH9rAwRVKQQhSLEaMFup63fRFyJ8Met3fyrxkSWnPXnZVfeXq0DMP4XPO3efxEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10231.eurprd04.prod.outlook.com (2603:10a6:800:23f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 08:21:51 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 08:21:51 +0000
Date: Fri, 4 Jul 2025 16:16:56 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, 
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, gregkh@linuxfoundation.org, 
	mingo@kernel.org, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, 
	viro@zeniv.linux.org.uk, thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v4 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <aou5e5mzcnt7iy5vlungtrodbvhp3fpx7ytrrgplmdxb25h5e5@fhyiiqnrd5cf>
References: <20250703103811.4048542-1-xu.yang_2@nxp.com>
 <20250703103811.4048542-2-xu.yang_2@nxp.com>
 <30f04c8e-5074-4262-bf5a-da022b89c276@rowland.harvard.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30f04c8e-5074-4262-bf5a-da022b89c276@rowland.harvard.edu>
X-ClientProxiedBy: MA0PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::8) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10231:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b83125-b557-4af6-d04e-08ddbad3d402
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|19092799006|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?V+kKY1SRDbCBaO4xHLZk2gqWfO4mJiZsWbMC9ubRrAX4nu9S5KZz40piqR0s?=
 =?us-ascii?Q?vRerW90alzkT2Dff9zBHlVy2Z/PXlAPbyZryA4+aHlR9GEdDwM/8J9Fl+9Jy?=
 =?us-ascii?Q?s3UBFWKMu1Fkefr6fH4fJqx2WP0RBmk/+kumMnVXcfNsmuO7raWn2Tjb4EXi?=
 =?us-ascii?Q?QW9j8QSdBSdcP8EbMh/9yeyePCcfYqvYJQuMGvuu2RWoaroNGURxdZe23Hmn?=
 =?us-ascii?Q?+SiqOCheD/sp+aSHjxsD1Odfxzxdi3YfRv/ucYctNGDTCMIGPVYW/jVn1Mqt?=
 =?us-ascii?Q?cju1427N/+faXZGIZG3C1phO+Y7DYSy1RLfQZNwtmmZ9mdy/hnlczwaIWukI?=
 =?us-ascii?Q?gKFd4QeCO2bMbIfpr/FI6RLdHmrHUGr8Ca24DOL4/3ErnWnA3mVlw+fKEj0U?=
 =?us-ascii?Q?L3MbYqX5rVquFyVJbFxbifuXDz25qEk3dTb4sUAy6xhucIiop9LcNDdNEBIa?=
 =?us-ascii?Q?wp/QTM2WbY8daVWPsJXPZBtz5Du1i1pqbxuCQs6z/8iw5WFNrEgjsDN5ZxKV?=
 =?us-ascii?Q?3NX21jLnqimR3Bf4GDgE2PYTinkrdODskPyscFle4lPdpBlJqAMF89xGkXVN?=
 =?us-ascii?Q?xwwn8BHq8O/KrxjlKtaXxdcKLnFgOje8CIe/XrtLadOsd8JERxrwM8kNNozT?=
 =?us-ascii?Q?fi+yN7CKwT4zzdgzVZm17ty0AavfAmGvXqhKq5ET85TQOtQ89DlvvJujJOS9?=
 =?us-ascii?Q?yGRy8pYp6LOIVEzK0umW09GE17szoEYL86SPXPSqciCeNv7vi4zjWzUR9g/7?=
 =?us-ascii?Q?UFG7pLDyFDlZ1ebFojipeg3ZfSUwb6kuJuyASR85fJbz42MiGqR3AIUofpqm?=
 =?us-ascii?Q?Lrt2OLBJFoZoCed2tFcVOcp6CoWrmhiRXV1YMn+d74eYrnFlTk9/Y3/egDXm?=
 =?us-ascii?Q?e07vtC2sunQglL8UFXuXs28/ix899hnHtY4+QWWCjMD1tJWxOmTiltJBCJwW?=
 =?us-ascii?Q?i+wOq1VQByt6NjCQ+ty+82wCXpuXuVsGNwGLI7il1C5f1CzzaZpnSB4i6Mgo?=
 =?us-ascii?Q?6UOoj8q5gnvAD3a5kgFnjeH6Crfj7HNxxeBzKlLji15vNiI/hInkFxCmqBJh?=
 =?us-ascii?Q?o8KkFeIhtJ8EErzZrttKeApZHk7fqztovULnbwOemeVivsOuLzLhPyvEhD/0?=
 =?us-ascii?Q?bPQ1kOPb3zCpOsqRDh1R2jOLucrR4lMvifYeFyMIH9/Ht4jdYmDmWAooL0yk?=
 =?us-ascii?Q?DA3WLBioPCMz8hrhELW7X6EVgjAjiN1nk7PVFvVrywej/fCFXCaxqSU84PIq?=
 =?us-ascii?Q?SR6dL6ksdfgoMo3ALmspAU+2q/XuOfEmO8HBxszS5vl117H7jshaRCvcQ3+z?=
 =?us-ascii?Q?yIOT+yWCVZRHOmPkgCrFL8XjTDYAgPt6J/QPf6wFzq9iX0oJe840tDAbBszg?=
 =?us-ascii?Q?5iuU/LPISdR3mQDx1c3C+aqqRH7kV1K+hs3CPis2nYF5HfZsAvJZOlaiObIr?=
 =?us-ascii?Q?ptCWcp4dfg9n3uUI9mNMBwZsRllEZy6Hn77ceT0glcyPZTXLxQjTpB3V+Gse?=
 =?us-ascii?Q?UScZApWX8Doy/IE=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(19092799006)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?9BjkpNf6apdj1a/9dkbvEbzS/7OXR2jqvaqRfvQr8FpsbPxKPmcI7vVo6su3?=
 =?us-ascii?Q?VEzb3798uzG1R8RCZ7pQIh2C6yC9SWQT0cASOT5M0qe1FSKVBf5MOKHFlrOn?=
 =?us-ascii?Q?x6mGeckCgbEGZlXIDLT7bchIVTBvQ3O5SDVb2y0X2XZDCw00Dt5/R/cVn4fY?=
 =?us-ascii?Q?dGQvT48rs0X/K4RDlWDUznUuDJtpaz2Vt8L2BdeQjyqlt5f71BD37ZVr0MEi?=
 =?us-ascii?Q?B1cU1ouvnTobcQRryThP5P4mqw0pFUW9z7dQUAeVfRXbaw8TyAub8j0SZtRb?=
 =?us-ascii?Q?yQBm6vpFrOsyzji0FD7OJtGHuwmPdfQ6H5AAOhLcLWK4YDMjLX/aMTeKJUmV?=
 =?us-ascii?Q?CmYGeSaROPkWieTMKXjThzkP6bdJvnXjzrFzJcbcSLlx+RvyRYY3oNpEZvIG?=
 =?us-ascii?Q?v+tEbzfdDZr3qbCXii6aOl6JpmAUd0M7SxnoPbV5O636GDsIiL63YKqf9fND?=
 =?us-ascii?Q?M/ad1mqqk5uXI4kTAQndm3FTr3srByxSWA1d3wkSyV6N732tTQu5ZACEn9gv?=
 =?us-ascii?Q?hjHiCNn1QdAOLwuWrguDUcdSqfN3SY1tQN5zrQd2o3/gmoAgnO6KZcmcX1xw?=
 =?us-ascii?Q?X1JpT8Br09QaygzwX+zcO/Ds9DBnlWrU/wTj46Kd/KHvMgDJwtL0X0weApiy?=
 =?us-ascii?Q?/nxfv2zv/l2utJjsvKrY7uZKr37mFnHEkOolPvfywXaVQ/m/oQRpcyQ9lIQ/?=
 =?us-ascii?Q?cdUPbQkBKUhFSR0nu5B3XiuPUjXCA59NJPGvjYNvXSm7fi9m9avPMpCZm8Ny?=
 =?us-ascii?Q?XUaDxjMQFMRt+Fevnde9MyQqJUAUKYefBBkuuCyZrzTrJjm01yeoEBG6Wo65?=
 =?us-ascii?Q?M4D3QYidhDmFlBLY2SDsNCBewc4r89TyRTGfqacS+h0Ujg905QSEkv/fxrN1?=
 =?us-ascii?Q?hYSPZsXyEHF7Ws8gHsZ0c3GN29j/PypY+eqIh4CucfAn2YSDCioLlZNB5bJu?=
 =?us-ascii?Q?P/0BHehbEz7Lt36xslZOmDOsiYEFFBlh1pQPHe2m1w2VnlYx4lccs5CY+0JJ?=
 =?us-ascii?Q?lGbqchF3l//yzZygr/Rp/BDbvjwntH98CxIdLraoT6RVzSgbTizt9ZvFW89i?=
 =?us-ascii?Q?fma0g/eKa2mgI3Ujtzz1frBWHnw+eZoCYTleOJgoLyVlnkShwFTdNwSnAXwo?=
 =?us-ascii?Q?xfG+bToAHe3fy+Dc1gScTfidRoxkaki4muVn502ezchzXpJVQraMDdYj4JYK?=
 =?us-ascii?Q?a3dPi99td2vtNtra8mKMq6rbztUSOPzMYQdlLLwzhHQWIs7PV2xMt8yGeVuN?=
 =?us-ascii?Q?RR67xL+ZZ0yZWHEevbQg+5Ir37OebN23/vuhW30aJoouPSVKkD1/3dY/rKGK?=
 =?us-ascii?Q?okPSoIDastbpVSlynvq0YPoS1mLmiub6BmNCl79huTi8bdNELm0am/tfxH+Z?=
 =?us-ascii?Q?7zSdCicadRJdYkYGe775SGgnKSKuy0N9Kr2TB48f4xJbzJ7IdZbLs0r1z8Oj?=
 =?us-ascii?Q?Sm3cqjj2yiisZVAJ3rPKSRTaoKoKWaDOAaZll3VZRxafLxhKxrzxlPATkyA1?=
 =?us-ascii?Q?wpNdvqfgpL3V8Iriz6m5Hh/clCzLzTKsp+UHy6qgptfeUfrUCBd5UU7HF7oS?=
 =?us-ascii?Q?WFK8qeOWOG+M9Tc+cJ4Mqw3I/jLwIwH3r3AgkTdv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b83125-b557-4af6-d04e-08ddbad3d402
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 08:21:51.7135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jQLuCuCO14XExGOnFAOyf7cXcvR31mqIjmIwTlzfjb9b/IE5YGv3jJlW0+gYAExJC1bAQo70T/GsssqyqYqcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10231

On Thu, Jul 03, 2025 at 10:35:23AM -0400, Alan Stern wrote:
> On Thu, Jul 03, 2025 at 06:38:09PM +0800, Xu Yang wrote:
> > This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> > functions to support alloc and free buffer in a dma-noncoherent way.
> > 
> > To explicit manage the memory ownership for the kernel and device,
> > this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> > and call it at proper time.  The management requires the user save
> > sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v4:
> >  - improve if-else logic
> > 
> > Changes in v3:
> >  - put Return section at the end of description
> >  - correct some abbreviations
> >  - remove usb_dma_noncoherent_sync_for_cpu() and
> >    usb_dma_noncoherent_sync_for_device()
> >  - do DMA sync in usb_hcd_map_urb_for_dma() and
> >    usb_hcd_unmap_urb_for_dma()
> >  - call flush_kernel_vmap_range() for OUT transfers
> >    and invalidate_kernel_vmap_range() for IN transfers
> > ---
> >  drivers/usb/core/hcd.c | 33 ++++++++++++-----
> >  drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/usb.h    | 11 ++++++
> >  3 files changed, 116 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > index c22de97432a0..42d9d8db0968 100644
> > --- a/drivers/usb/core/hcd.c
> > +++ b/drivers/usb/core/hcd.c
> 
> > @@ -1425,8 +1431,10 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
> >  	}
> >  
> >  	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> > -	if (urb->transfer_buffer_length != 0
> > -	    && !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
> > +	if (!(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
> > +		if (!urb->transfer_buffer_length)
> > +			return ret;
> > +
> >  		if (hcd->localmem_pool) {
> >  			ret = hcd_alloc_coherent(
> >  					urb->dev->bus, mem_flags,
> > @@ -1491,7 +1499,16 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
> >  		if (ret && (urb->transfer_flags & (URB_SETUP_MAP_SINGLE |
> >  				URB_SETUP_MAP_LOCAL)))
> >  			usb_hcd_unmap_urb_for_dma(hcd, urb);
> > +	} else {
> > +		if (!urb->sgt)
> > +			return ret;
> > +
> > +		if (dir == DMA_TO_DEVICE)
> > +			flush_kernel_vmap_range(urb->transfer_buffer,
> > +						urb->transfer_buffer_length);
> > +		dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
> >  	}
> 
> This could be done a little more cleanly.  It's always awkward to read
> an "else" clause for a negated test.

Agree.

> 
> Instead, change the "else" to:
> 
> 	if (urb->transfer_flags & URB_NO_TRANFER_DMA_MAP) {
> 
> and move this whole section to the top of the big "if".  Then you can 
> change the test that's already there to:
> 
> 	} else if (urb->transfer_buffer_length != 0) {

Okay. It's a better choice.

Thanks,
Xu Yang

> 
> Alan Stern

