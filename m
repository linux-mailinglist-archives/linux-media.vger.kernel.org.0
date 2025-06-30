Return-Path: <linux-media+bounces-36253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 843E8AED70B
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 10:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74BED7A321F
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 08:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A734F2417DE;
	Mon, 30 Jun 2025 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IZZPY6+6"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010062.outbound.protection.outlook.com [52.101.84.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C940924166A;
	Mon, 30 Jun 2025 08:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751271828; cv=fail; b=OhrE73zQbGLKQuJYyPqAEVQZWZ0k4wbRdVEtWDnqPTuhCtgtpKyM3COtGnirbRfblZuBy9CrL3A/dx9l37s8wKUkfvTunzyf+VUXndaPwDlEMhcrsAzG6wsOuu48SObAjSiTYFcm0N4LkCmrNMJo3pTLGN/GJa0KfercEr0gceU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751271828; c=relaxed/simple;
	bh=MHiRt6BRvQdBs9Yuo5AoH7riwn7uHaTxFzABCw64uh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PP963qFhGjTV7kKY9P6w/SnPukJvuY8dPEHz1Irgi1thCGxXE8s8T6ICDoDvR7AYuJPTJSy8GgjR5Cj5UYfrdwxqiFA+yDK2Ypf65bg988N7+W2oLU3VmlwWxk44XTgUJXZlksPatm8k+epiLIpUe0Z/gTI41LfyzbliX7z2+4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IZZPY6+6; arc=fail smtp.client-ip=52.101.84.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttj/6Y2DzA5CmMI/uqz2TV9w5onmuEkoawHbncpfCiy2BL1KarIqo3hdX4m394e3QRDC60fza9EoB3IaskW5gEDJzOmBbK7tGuQG/prUVytP76jNBKeugQ1Io8IuV4KBIdzAko5PL5L8k9hCEyjXD9XzTNcp/aWZqy/Nlyw4bNmNHSQv98uzYvJDDsKo/GnVlHpMz7sZyraLzUjOKBfnHY30tBIS3COgmlz2fTZJts1SwSz8slmdRXIA/XIVE/1zg/Gj8fj25PMJk/gupHzSIC19sdVq+A0nEwCHRbdab+Stf7mc1cFhsVDOtKswj2Y+LvmCzALS3obLuUN958B7BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odOa7NBnUIPKua65+OUbpJ4xD7sDqXygvxXU/cZcJxA=;
 b=zCzEcIB5bSHNCljG4+M0mDt5GrXiQCqRmuzXtYKi4ILTy+XxRryOj+jfd26pWl1BlgAjT4hpQ7MdPZ024SOdobLxR460loMEH+4zIDLzFIE5gCwsND9w5MMfzrutv5xCv15SU5PnZ+1l+DqXkZFMm18LWws9Khpt1qQpP5NiLwkUWiplXrhp7DeecvEH51iE4HrjoSorBdGkyLqSrPynsG/enwMWtwgxxrBN0b3MFcld2GDTz6wkawGbnQSKimGMkCAYYguqjHQJ6iznoByze6mDQevOY+Snf1XK2F1zICfhePlPYgjdXReq0t0O5qxl6v4KIXMrMbRFzSdlSAcoQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odOa7NBnUIPKua65+OUbpJ4xD7sDqXygvxXU/cZcJxA=;
 b=IZZPY6+6bDuMsNTCeJG5R82qqRMS/NoBjTjBYPlxvqgZvsYZ5gB/03YrvPs/zpSiDipSiZx8bQgpIhH/sbnJND4bJI9LB3BtAYFeVl5Vi6GCq/His6E6tKs1WvXZ6zPplaFXfeLDjW7KmRI1BljaagTAgwB/vOlhk03CPiFYDZExlAPMmB6J6wnZcHoKsXgvRdgiDv71PJJGXNm5C7UB4ZIdV8XC9XdVII6T/2xuD/n2fE6hZBP7951rfAaFPY5D4YH29gCvxrDUH9th9a/h2u4trH90voUU+MOx/MN4amUXnr7U2h93xL/+B+rFJDk1b/rHcI0qP9We2da2iB+81w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI2PR04MB10192.eurprd04.prod.outlook.com (2603:10a6:800:229::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Mon, 30 Jun
 2025 08:23:42 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 08:23:42 +0000
Date: Mon, 30 Jun 2025 16:18:51 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, 
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, gregkh@linuxfoundation.org, 
	mingo@kernel.org, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, 
	viro@zeniv.linux.org.uk, thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <wddmyx4lccthln7mbngkd4zbh6y7mwetdba5e7ob6u4xevecmj@zopp65eqbeuu>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com>
 <20250627101939.3649295-2-xu.yang_2@nxp.com>
 <1c4f505f-d684-4643-bf77-89d97e01a9f2@rowland.harvard.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c4f505f-d684-4643-bf77-89d97e01a9f2@rowland.harvard.edu>
X-ClientProxiedBy: MA0PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::17) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI2PR04MB10192:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e4ed2a6-0ef6-4ff9-5cbf-08ddb7af6c6b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?3dyuPMmDKwoSEAQ/UMInNfAC1+9MD6Un+/pSmeWCkZVp6G4zv8g+IRdrsQdL?=
 =?us-ascii?Q?lm2/OpR3STqdoYXykWuVvEg4/fJX6QljkHv7ZqGghJ7v8vDZ/7dhRKCC4Pj5?=
 =?us-ascii?Q?XX/HiY4k6w4urazLCpq68ewfMp5JNThd4VwJFub14Jjl4CEgAdFGII9oeG8H?=
 =?us-ascii?Q?J5YErmuuQVPgL0ggm5nmpxJwu+YLWn7+TUow9koQ8LEhPTMZAXeuefSaAize?=
 =?us-ascii?Q?WhEHChUEZLfGoEOVObeOjioT4Z/abu/3fQeV1DaQp31x3zMO4sJs8HkwnKRn?=
 =?us-ascii?Q?p6WRpCWsKYW3f9C6iN1RKEjWEhxHPQKYUzL98YaecishYCF+PSjjXQKbgCAB?=
 =?us-ascii?Q?cbPCbQAzFrtawqyDZcSKNt7DaIi/3K2BSZlbSvTXtdQiKNqn/yC/elmva410?=
 =?us-ascii?Q?BJ9uQF9PoKdrffpYaOW2xBN5BuL6jlz/A6Oou8nSsYIY4vPRwAcSZE6hByq1?=
 =?us-ascii?Q?EH3G55A7DtcksNLl1Fn0Wq9K2aXlCIqahHIDSAwIt/VWILCtaWvzWm8V87dw?=
 =?us-ascii?Q?io1BG4s7oLtC6D02tH4Hjb+aHqxMeIPsK5XkO7s/yNIZ1k8tkAwpOqSjpVjy?=
 =?us-ascii?Q?MSZyzuIEvT8ez735/VLUqkC1D2VFYoKAGNpCPg16R5ibpcEzAQHnBKsS8HL9?=
 =?us-ascii?Q?f7IZaA8YpYT8hqEDI+xw7AN8G27y5R9p5YNS29dei+aVe2QvPehp4hba70PI?=
 =?us-ascii?Q?NnTt8rQwkaDMXD+beEYBQejKi0zmXJj2Db3U7UoVCNrSUl2D6zU04QpF0aEa?=
 =?us-ascii?Q?XCIJPgMdshjxhRemrrRU9SO4/xGjFGQq94g5RCxnI9lO/2+z2XJoh2B4N/1G?=
 =?us-ascii?Q?KNK0T5eQR1SU93sbdickzJOYoCnpbwfH11OkmLG50gGmrGxT3jC/peWvvsgU?=
 =?us-ascii?Q?Z4hztiSTeKMX2JiymUiNZcJpCZ8pk3XBfc5N+GlYyrs2QW0m1YWkdAUTfvPz?=
 =?us-ascii?Q?Ik7SLgTw9SsBvA9QQHaJ2uNZVmvMWJBOfOCeN/P4D3ir7I3tKaPxfcsHDoEb?=
 =?us-ascii?Q?4uBaBNm+Kk5IOO3NSDYJYSroL8bRSTyR5JePs33DkAKKLyDPC5vHaMxspDCb?=
 =?us-ascii?Q?AGqLwFqJckOYq1/ixB+bhrXBYZAa9uOTvVZ0Cia+hwUB7CpGt6+aaFTclNX/?=
 =?us-ascii?Q?J8Om/+6fuVLBoFDTBAvh4HDW9h3zvyPF5Eczji0gLPlhQj59Bl/jfM/D2jTK?=
 =?us-ascii?Q?7045qbpNert19lyQgWvEMDlb0/nyuApMg/N7tEyR/pt7r9Ixc8pVAr0dy1p6?=
 =?us-ascii?Q?VdDETIcQH7EdhFvz6p5CtaLY8iAZOhjhj4gkLvuPLprNobLjnUIDo41Ro9qV?=
 =?us-ascii?Q?DuDu+PqAxoj5h5F69FBruauzTRFGoIEydJ3tP2MahcoS/I+3RKlT/Knwjw7z?=
 =?us-ascii?Q?I5JLxR3CKCe6jpGGQsgZyr08cHGj4EEIMI1esy9b74v/areAy1qgMWNZzYGX?=
 =?us-ascii?Q?BHS9/pmrxlSvgHcb8ztJ+za4FdslYjmgOiQ8AOniYmFBLpYF6muM9jYSbFBR?=
 =?us-ascii?Q?Aio1DugFm7JfFHg=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?vzWkJpWfDERskYLVUnEkteojrdtde3/tNr6m/uMIZlhZWdhDjaVMoiCoq7qv?=
 =?us-ascii?Q?wik8Vv3tE+NkGK07mMUQiOhDIw2eFI6r7r5ViqpeFCdFGD1QW7kp6MsOBYf1?=
 =?us-ascii?Q?29EYsRB3ZtkZQ63+iZgcsvc2ZCdtWpZZAkos0doCyAhkwGEY6E+9ydCahJdT?=
 =?us-ascii?Q?hzTFicSAaSDk+FYA/cACPzV49jC6Wd0FmsgXeBRckosG2QVRO9rD9WrH/Ysp?=
 =?us-ascii?Q?cYSJn0oxNZ/nIkPWIyits8GrrmSyBOVlwOfIAy5pAR98DKxiqzhMiLq5kOcm?=
 =?us-ascii?Q?Fe7WiIjeE6trLYdymZTcGyMlilZad+TxAO2Y9GB2XQvFqI9mImeFenOqCU3j?=
 =?us-ascii?Q?ieZ7O2+piDpCGpl1qHgc+MTV2yM2dUh60q8HGoWSM3SLNJ7AH0Zb7aXmZS0r?=
 =?us-ascii?Q?dBCrK4gWpHXy82sJutR+EPOzeqdSvbsUANeZqkq+a7FPXSn8phTF5G6iSkwT?=
 =?us-ascii?Q?EIMT7qnuIBZ/uUEyATvb324GK/gQh323BAWHZwveYG7GPujndqWaIU7s+DrK?=
 =?us-ascii?Q?TA47YM/xL3TTlN5lZHA42ZF1AMcxfyr0xfkWLjq8E60I35l6DBfZ82qjRDbS?=
 =?us-ascii?Q?RGHmdZq0td4EC6/yKTyl1nMJY1U+uXGUmGR42HaMfvxz2srVUkwNB9LbNNAi?=
 =?us-ascii?Q?2hjGJPSc/+czrGmHVDX5zariCDSBsNsu6jiqXAx0vUgPbyG1AMi8IKG1xYCL?=
 =?us-ascii?Q?xnuFUSWfW+63mMge65vyeQZJeWUTO9KDXkc5q6U9JHKNpf2wL+a8hBKtCKBY?=
 =?us-ascii?Q?LL3TlLzVMLO8mQWUX97ehFYYGGN1cYEPWea5Ufe/r1apnK30K9bLC3RA3SdF?=
 =?us-ascii?Q?uCQutKVyeTsC/0kNDwlR4KkXT/YA8jIXDCYDR/iqc0eN820ig5ILAg/nP/TT?=
 =?us-ascii?Q?uz702qFbGppmOLSD/Mnyqc2m4rWnOPDX/AcCDX5k45Tf4yoabMHIEEO3QrL/?=
 =?us-ascii?Q?/kpYEGQQBO0I1iIgnrHqDxc/NmR2J6m0ryPpPfti3Y30UPGq27IZZrB9Zrju?=
 =?us-ascii?Q?Ao39GY13GLeU6zA6/GfFMVxbpUV4ygivu6guD6VZsfCPcF0O2EpGo1u/0YzB?=
 =?us-ascii?Q?c6THcxXNtG/grz1nSRJ0k0C8xLUH7WPI9jAsvozwpi2gH0sTbj/D2F5lmvBa?=
 =?us-ascii?Q?whqb0hi/1WLCOLv5/KLzZoAFNgumYQcJlMZQ0iP2Y+AOYaNtQr/2ilBKuNpH?=
 =?us-ascii?Q?+Burix+iAwPwWfed4IAukd4ST2Kb+eIb6dV6nXSusCxSkerN59XScZXNJUGg?=
 =?us-ascii?Q?UpzOW3ZDkoxocqcupGkQrlmCik4arNjLPE0nilz7vUmbh0FtDsa7VgyPVxzL?=
 =?us-ascii?Q?P31zKK/uOeJQnMVL1xO73N+odB3hU/Xj9wm7cx0/etevATVhqc7Wu4mFfPkm?=
 =?us-ascii?Q?0hpdjGqcdU2vuPM/DHlIvCayEcEN5UIYkwsofJnb13km6vWS93uBFX39JA5A?=
 =?us-ascii?Q?ZfF81SmX508LezZt5EVsrkkEfc3OBLlx2dNIxjlhEawszXscTah/5e1hoDFc?=
 =?us-ascii?Q?lpwmJ4b8TRn1caknKSmkRhLGVy/GA4mz8lKbnrSV7MVUrlnDBnC29E+UWkx8?=
 =?us-ascii?Q?Mk1asz7IO2vJESUygfdl/5bKl8W2FbDuyPkTSgdM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4ed2a6-0ef6-4ff9-5cbf-08ddb7af6c6b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 08:23:42.4252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kJdG4q/5aewk0RJACOD+qhzmER3eVQKYMzj4Ey1ZBJI9NOW6BQQ9b7QqBd8tGwQ4mj/k5IhHxO2AzuuBp+qJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10192

Hi Alan,

On Fri, Jun 27, 2025 at 10:23:36AM -0400, Alan Stern wrote:
> On Fri, Jun 27, 2025 at 06:19:37PM +0800, Xu Yang wrote:
> > This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> > functions to support alloc and free buffer in a dma-noncoherent way.
> > 
> > To explicit manage the memory ownership for the kernel and device,
> > this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> > and call it at proper time.  The management requires the user save
> > sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/core/hcd.c | 30 ++++++++++++++++
> >  drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/usb.h    |  9 +++++
> >  3 files changed, 119 insertions(+)
> > 
> > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > index c22de97432a0..5fa00d32afb8 100644
> > --- a/drivers/usb/core/hcd.c
> > +++ b/drivers/usb/core/hcd.c
> > @@ -1496,6 +1496,34 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
> >  }
> >  EXPORT_SYMBOL_GPL(usb_hcd_map_urb_for_dma);
> >  
> > +static void usb_dma_noncoherent_sync_for_cpu(struct usb_hcd *hcd,
> > +					     struct urb *urb)
> > +{
> > +	enum dma_data_direction dir;
> > +
> > +	if (!urb->sgt)
> > +		return;
> > +
> > +	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> 
> Are the following operations really necessary if the direction is OUT?  
> There are no bidirectional URBs, and an OUT transfer never modifies the 
> contents of the transfer buffer so the buffer contents will be the same 
> after the URB completes as they were when the URB was submitted.

According to Laurent's reply email, it may be needed for some archs.

> 
> > +	invalidate_kernel_vmap_range(urb->transfer_buffer,
> > +				     urb->transfer_buffer_length);
> > +	dma_sync_sgtable_for_cpu(hcd->self.sysdev, urb->sgt, dir);
> > +}
> 
> This entire routine should be inserted at the appropriate place in 
> usb_hcd_unmap_urb_for_dma() instead of being standalone.

Okay.

> 
> > +static void usb_dma_noncoherent_sync_for_device(struct usb_hcd *hcd,
> > +						struct urb *urb)
> > +{
> > +	enum dma_data_direction dir;
> > +
> > +	if (!urb->sgt)
> > +		return;
> > +
> > +	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> > +	flush_kernel_vmap_range(urb->transfer_buffer,
> > +				urb->transfer_buffer_length);
> > +	dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
> > +}
> 
> Likewise, this code belongs inside usb_hcd_map_urb_for_dma().

Okay.

> 
> Also, the material that this routine replaces in the uvc and stk1160 
> drivers do not call flush_kernel_vmap_range().  Why did you add that 
> here?  Was this omission a bug in those drivers?

According to dma-api.rst:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/tree/Documentation/core-api/dma-api.rst?h=linux-6.15.y#n664

"Once a non-contiguous allocation is mapped using this function, the
flush_kernel_vmap_range() and invalidate_kernel_vmap_range() APIs must
be used to manage the coherency between the kernel mapping, the device
and user space mappings (if any)."

Possibly the uvc and stk1160 missed calling it, but since they won't be
the only user of the USB core, so we'd better call these APIs.

Thanks,
Xu Yang

> 
> Alan Stern

