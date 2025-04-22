Return-Path: <linux-media+bounces-30678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72641A95F41
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 09:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 946A93A9D8B
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 07:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0AE5239099;
	Tue, 22 Apr 2025 07:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="stbv8TNL"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [40.107.74.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C27910A3E;
	Tue, 22 Apr 2025 07:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745306674; cv=fail; b=YWVq/JEnBAyhyeUMHQfy1dBqSBXzvw/+9jvu0XBGTM1oi1BouO9Au4fNw9ko2EGfxZdYle5EtGmbq6rEWoibiLUNiW+vKEZ8fVHbnu4dslRZSa1Ad5dLQ0pJEgBlHcIgqFJaxcnQn2Af+OujvcZdUOEr0UHFu+/Pml1HLM+6K94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745306674; c=relaxed/simple;
	bh=uv7Y4htXOPXKgXb1k69cDa0fEl7w8CeTgh6Ed9pBNeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BJKZ0r1K/NMks9AV+J7nymkv9s824dpATmGq9161dXakYpp6F0xEnOygtiQd7EwVb6rftklePR/4RZdeeO7tUOSAm7MSBAh68gqVzTSd+0PAhwxWQWpbXVEl19Lom7W2cBg6vQOr9Wk9WFoP+dTrtTBcjmtpdON/GsleGOgpYCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=stbv8TNL; arc=fail smtp.client-ip=40.107.74.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aI52xY/O3nXw3BDMsAUxPo+XuX/QqYyJFORQ6/FHXudr/V5AbNr39ndh+YJiJMtrZe1VOo2GOQ6YcgV19PpT8q2LkZ9dQRXe/BldYq5PyerlnHp0n2YZVrMJ+hjv8Fu2RBbVR3F+/hqkehk93yXQsybgoWLj3UM6IJIiZbbB/vnC0HGbQTBmT15z1DqB7ku4uMShtT+R50VV5DiDG2RVyOJG9CXmyI0qRiajS2cV5ULs56/aViCurGr9BRu6mjRQ/cmCdkSldVttAaJGZcesaVW1z4k8i3aR5Go7wBg2kKZC/mFmEBJaD1jj6Sn5zbU3ljne7a25Y/vsiCIMk792Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zr76a2HwXQ9+KsM1YezZf/cMsXCb+7TVYFk9+Y1OyDM=;
 b=GRa/CzXac7qtcCCOMrXEbEpwLF0aOv8gt9VVoNRN+PB/CZJnePeUsy085QuexFV5cEphs581bUXiXpePoVaUNgXKbaQAGvD2PEfWX5QubCDAIozpupYgtC9bkKBFaoFAcAobgZwdR1CL01kV6GaLodAKlMYgVkBNI7frMp/KwyYG9dnNQAT2Qefn/h+Tt9ugc6fNIODahZWlB5h4GxQOkNxqjczRRJEbPESml41t2wVN4dwPRTn8nxGD18RfambpGIH+OzkiN6XIz8B+oFyu8FR++OBEYF36Ju37yg+6mtxHDsFqCC8SAYXhPqorWagfSGDUi64NeurCensxc3I21w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zr76a2HwXQ9+KsM1YezZf/cMsXCb+7TVYFk9+Y1OyDM=;
 b=stbv8TNLki8ubF6FpqwN0heBTN9byhZgKbltq9AYNihxljQZBvsqI6HUTjjXU9NCaRpPC04SGqrh5+XkBvrSiaY6yV91V4mPDIgYwM3sd565hzd1UKZuexMvjRVnmEUzXlphoaPYBcD3PiEo9g7pRzyNLA2ToGiY9ktygz/cG1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYYPR01MB15118.jpnprd01.prod.outlook.com (2603:1096:405:1a1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 07:24:22 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 07:24:22 +0000
Date: Tue, 22 Apr 2025 09:24:05 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/17] media: rzg2l-cru: Add support for RZ/G3E (CSI2,
 CRU)
Message-ID: <aAdEFfWcTUC0DvYU@tom-desktop>
References: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
 <20250421151108.GB19213@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421151108.GB19213@pendragon.ideasonboard.com>
X-ClientProxiedBy: FR4P281CA0367.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::11) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYYPR01MB15118:EE_
X-MS-Office365-Filtering-Correlation-Id: 9582e1ee-56d9-490e-a04e-08dd816eb3df
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Wtf/A8HyvnIJWWbsahU2YEopgWKel4gkUAUxV/uakRMfKuhE7NP+mo0B7MPE?=
 =?us-ascii?Q?cFR3ikq/LuRBGNIqU7uXf1doZC5SqaqJjwQJq4g3i4roAzYwWFnIfyu4HQrR?=
 =?us-ascii?Q?/7dzmWUcxB+OaUncug05/r2gMmIIsUAmiBDeoeJJo0/cKn70wv7UOOKv1eOe?=
 =?us-ascii?Q?3CdAVQPhWuLH97LeEj2tHrhMcr9XIjYiADwGuT+jona8H02ZHBKsw5dWA4VZ?=
 =?us-ascii?Q?grN722yT9TEZI4JsU8qPF6HyNcIHlyfRmO6tCDjl8ZAjp7edW9egHlvkML3F?=
 =?us-ascii?Q?6wwVLAhDpxNvjsBNyxs2p6MIq+Hk3e0x7T1pgntvqM1TcsNLy5qkvsZAg7Lf?=
 =?us-ascii?Q?VYzbaIxVt7mgQ4kkKsuXYMMR6QyCb5/gtD9YDlW/FNblf5tZJv5ziTyv0Oni?=
 =?us-ascii?Q?LpVaB2qiasGwu/cQFDTjRl8P3Yu1UTIgNhDQVJmPDqvwtArLnJ3YPB2B5Rsn?=
 =?us-ascii?Q?xVkG0StSNRvwOa4BeEOyML2IfvXS4QFcix6elIiDhalUEg4ZBYe7CvnofUvP?=
 =?us-ascii?Q?TJfKyQeFpxeBYuGcaGEgeK9W1lCh+3Xo8xNjQWjqwYty5CEw13Q2yOpDlena?=
 =?us-ascii?Q?1gWI0t7QtS66r5eql5NhDSyMIMWJgKVu+inHRFFP0lCFancT/oAQgjY4/7K/?=
 =?us-ascii?Q?7oOqsQ+fRJUJhcCrVzacq0LCibUQnHTLIw0fma5X/c5+d1fk9JnC5aAxZ0tZ?=
 =?us-ascii?Q?h/TT4nn8Yz8j6Nikh6Iq77eK7PUgPZkElp6Mjvim1Y3uet4RoFZs82ldb91w?=
 =?us-ascii?Q?GxT4sR9UQtpDKWNBsNaVkllxVdZuE7ZZOakASbE16LSi/cDL0+n8YwfVt1gy?=
 =?us-ascii?Q?7575ajaQIHg6WTm3p+BP3Jel9MAgINr7vfGTq82q2mPBKsRQ639LeJHmyJIs?=
 =?us-ascii?Q?GvZ7VYHStRRW/KVZRPi5lvXHNVUqC692Y7dHl+2dWuCnnKPYyRh+UwGYhr3l?=
 =?us-ascii?Q?G/Z1UEyDkOcMYVY8/AQRL8Pjrxqh2NmXnQY+AmfuZFfn+vheYmSMXiW54DOf?=
 =?us-ascii?Q?5KvK5SbLfEYI9RJFzxtM49YiYY/ni9xQNThA34ah0AvkEf8YcaDD+tgS+rBr?=
 =?us-ascii?Q?4hQgJVpEJb1zcbum4khd/tCaesHn8jlc/AvAgwWgk0XO2oXcqNgMtghPqYIN?=
 =?us-ascii?Q?8gnmuPZhcVBZ1eQPDZ4/js0qCcL/WMvyNpb4cGOEDie4kWF4crlFr1E2wF3U?=
 =?us-ascii?Q?uSqXb1Y9P3/OPESWBkGFikuRDbsdCyGhM1H8wqO1DWWF+kSTECuG0H33j8AI?=
 =?us-ascii?Q?iDIpanpmmC/p83nNjnxmSIlCMxw3rttEEP4HjEZ+nXdCyX8PMBfldN3hWJc1?=
 =?us-ascii?Q?lijw6fOATBd7u/yLqhsaEo7lUlDBWRABNyzRSTq1Vg+PsEjOY8ffa4ssqPS+?=
 =?us-ascii?Q?x/AYEAtffP4G843IzkyNgF8j/ABpG6ojZsjA8zObrUcCN7HPiykQdLMm7JD8?=
 =?us-ascii?Q?KY7MkNorr5aTO1QvFXyFHnuYpydOoJUCob8OPhJvVovgVbEP8pRyAw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?LQX1S9xS0fJzN9KPLmgMDkRudtZG5fvh3+QcgGSYc0M49eEXOJOtTvygUDfP?=
 =?us-ascii?Q?oNyVSd+L3rxWWzKh00vxX7Av08myq1v5DWvzTLQtY0+w1MioZKKhDqeHsCFc?=
 =?us-ascii?Q?UGeTdH9HXkaICdrizwVtMY+FdoQvnyZYdKkLh6qOnDFa+q3c785b0LwOmO6Z?=
 =?us-ascii?Q?zDtl9HVLM37sa7RI6Q87e8PUQOKM/W6+t7gmnkYzz2HOY+o4s6S2U/VQfgz0?=
 =?us-ascii?Q?gmH1/JSVaRyT0tnzIK2OlnF6hSJio/7mX7c30aWU1Bycnb+gVHfAunUWlwyU?=
 =?us-ascii?Q?Z76F1wdVuaOh8/IENdq8+IZxyRV1tzN2vDOGZ0qd2P+MoKof+orcteRL3UjV?=
 =?us-ascii?Q?g3swkwB3mHHvnSQ+iu/56k/RMN2kAZOU/e7rK2vHyruts7M704U4haMhpZaj?=
 =?us-ascii?Q?vIgsv5p3L5gkpFXIqnVHZl3CsLw3IcCXOF9fjLXny4wbOAfK2VyZB83sPqwY?=
 =?us-ascii?Q?iv+/ycH8Ix6lDjkYAzyh7MeN7sHDG010dN95Ldb9rmo1K8B221gefTjeC0/S?=
 =?us-ascii?Q?RpFnLPYDg4yl+7e28u3gH5uqQFQnXiGf3enRYTKcNy7hiemVzu1yGBfLh5UW?=
 =?us-ascii?Q?ts4S6bKac+Kds9mnu8MT5FCpi39OFGTz7wirdifnKgJVyNoBnd+KutGCNShj?=
 =?us-ascii?Q?ODIkX8zhemDwt8egJ9dMISuTKA/yv7gt9xDlueZWgeQ7bGkVaNbhresRnkP0?=
 =?us-ascii?Q?0ql92aWToaShWKpSA2K+OqEnhOux9o9wr5gcLvnUPM08c33RvGcGEIdgFDrB?=
 =?us-ascii?Q?PJ7kLY+VgyD1YkXJ582DkeoO3lxcbILxlrXrIHtBNo1OwqQpt6Yv7xMsTbJl?=
 =?us-ascii?Q?XSyC9jpVbuVCv5Q63hUb+Fj5Nlg+kg0nLpkP17siWQA6eEAle/hIYe4BC8ds?=
 =?us-ascii?Q?PjJri36ZsBJ7IzA6dbSJ5cnrpTvKQo3EkGPO2iWOwBPHxhZvWsC4v96+GuvL?=
 =?us-ascii?Q?dgDkaKppbSFBDU8CV/D4Pc5qjPyArC4muWyHf3ps0YZuQZkW9ABwmuhuIMb+?=
 =?us-ascii?Q?HoGTEJH3VKvXjmzL2EXDTYheGrjsdnD9UEmg/c6hlqHKzl+FrIZ/HtwhKait?=
 =?us-ascii?Q?RC8SkaY2LDPciZOX25X3aHUAndqXLLrxxK0+7ssY3SSpFdwrGFajozSaQ8BR?=
 =?us-ascii?Q?TFJvKSS6BVFyzHnL53s8mc0tL7drbEfwFKdlcEr4l/Vkyiz3hT8dOB8Dg7oV?=
 =?us-ascii?Q?O68KHSU1ROGhnNFUNgWRkb6iWWaDO3h9WDj01Qu/xT5utNAwfxh2DlhhJ6d0?=
 =?us-ascii?Q?RjxrBII5N77ZBhWCYe/LyVD1HsfMO6HyLGSQFVKYci287ZDKl9y1/MSx/sjj?=
 =?us-ascii?Q?tn3KIJzXQUjy0FQ80KAeCO+bGFL1C+wH7fQtSF1U+ZwmW+ce2KbOsRlP8V0j?=
 =?us-ascii?Q?xDvxV+ev5I2ay5LeOB6quSsey+FF6YSAd2ZChfNyesH8vRZEdAVwrCUWSEGW?=
 =?us-ascii?Q?buo8IutiJE8EZ2/Pal7EhKfR/l3ofeXUELzYxU/suFU70k9ds9iGikwjZ22B?=
 =?us-ascii?Q?YSicHqt6ZEdCpAQtpoIpG1CDKD6/7U5vmBzuZiVU2/AlddaoZuA+jcChAtef?=
 =?us-ascii?Q?yAOdTlxhnQj1/rxyYfeHlOch+/p7WoIdXRaHB6WLUQEsKx5V2s3z0m1VmpZa?=
 =?us-ascii?Q?Lc19e0jpTG5jRfb+UM4SSBg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9582e1ee-56d9-490e-a04e-08dd816eb3df
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 07:24:22.6755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stSRmzy8yABkBjCKMMnBNPgr5/ePKKIF3QdxhkI8JuuZ0lVJTWjRLq/AiXjG8tgoZD14dZXdUmvBV7w4UOJmdBokgWh0fhi67R1c8ZOOLBW597gYfQ0XjnZ2kMpIVV6h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15118

Hi Laurent,
Thanks for your review.

On Mon, Apr 21, 2025 at 06:11:08PM +0300, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> Thank you for the patches.
> 
> On Fri, Apr 11, 2025 at 07:05:28PM +0200, Tommaso Merciai wrote:
> > Dear All,
> > 
> > In preparation of supporting the CRU/CSI2 IPs found into the Renesas RZ/G3E
> > SoC, this series adds driver/dt-bindings support.
> > This adds also some minor fixes into rzg2l-csi2 and rzg2l-core drivers.
> > 
> > The series was tested in an out of tree branch with the following hw pipeline:
> > 
> > ov5645 image sensor (Coral Camera) -> rzg3e CSI2 -> rzg3e CRU
> > imx219 image sensor (Pi PiNoir Camera Module V2.1) -> rzg3e CSI2 -> rzg3e CRU
> > 
> > base commit: 7702d0130dc00 (tag: next-20250408)
> 
> As far as I can tell, the series has been fully reviewed. I'll collect
> the patches, run them through CI, and then send a pull request.
> 
> > ------
> > Some logs:
> > 
> > root@smarc-rzg3e:~# media-ctl -p
> > Media controller API version 6.15.0
> > 
> > Media device information
> > ------------------------
> > driver          rzg2l_cru
> > model           renesas,r9a09g047-cru
> > serial
> > bus info        platform:16000000.video
> > hw revision     0x0
> > driver version  6.15.0
> > 
> > Device topology
> > - entity 1: csi-16000400.csi2 (2 pads, 2 links, 0 routes)
> >             type V4L2 subdev subtype Unknown flags 0
> >             device node name /dev/v4l-subdev0
> >         pad0: Sink
> >                 [stream:0 fmt:UYVY8_1X16/1280x960 field:none colorspace:srgb]
> >                 <- "ov5645 0-003c":0 [ENABLED,IMMUTABLE]
> >         pad1: Source
> >                 [stream:0 fmt:UYVY8_1X16/1280x960 field:none colorspace:srgb]
> >                 -> "cru-ip-16000000.video":0 [ENABLED,IMMUTABLE]
> > 
> > - entity 4: cru-ip-16000000.video (2 pads, 2 links, 0 routes)
> >             type V4L2 subdev subtype Unknown flags 0
> >             device node name /dev/v4l-subdev1
> >         pad0: Sink
> >                 [stream:0 fmt:UYVY8_1X16/1280x960 field:none]
> >                 <- "csi-16000400.csi2":1 [ENABLED,IMMUTABLE]
> >         pad1: Source
> >                 [stream:0 fmt:UYVY8_1X16/1280x960 field:none]
> >                 -> "CRU output":0 [ENABLED,IMMUTABLE]
> > 
> > - entity 7: ov5645 0-003c (1 pad, 1 link, 0 routes)
> >             type V4L2 subdev subtype Sensor flags 0
> >             device node name /dev/v4l-subdev2
> >         pad0: Source
> >                 [stream:0 fmt:UYVY8_1X16/1280x960 field:none colorspace:srgb
> >                  crop:(0,0)/1280x960]
> >                 -> "csi-16000400.csi2":0 [ENABLED,IMMUTABLE]
> > 
> > - entity 17: CRU output (1 pad, 1 link)
> >              type Node subtype V4L flags 0
> >              device node name /dev/video0
> >         pad0: Sink
> >                 <- "cru-ip-16000000.video":1 [ENABLED,IMMUTABLE]
> > 
> > root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev0
> 
> For the next submission, you can use
> 
> $ v4l2-compliance -m /dev/media0
> 
> to test all subdevs and video nodes.

Will do. Thanks for sharing this.

Thanks & Regards,
Tommaso

> 
> > v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
> > v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38
> > 
> > Compliance test for device /dev/v4l-subdev0:
> > 
> > Driver Info:
> >         Driver version   : 6.15.0
> >         Capabilities     : 0x00[  580.151532] csi-16000400.csi2: =================  START STATUS  =================
> > 000000
> > 
> > Requir[  580.151532] csi-16000400.csi2: =================  START STATUS  =================
> > ed ioctls:
> >         tes[  580.168711] csi-16000400.csi2: ==================  END STATUS  ==================
> > t VIDIOC_SUDBEV_[  580.168711] csi-16000400.csi2: ==================  END STATUS  ==================
> > QUERYCAP: OK
> >         test invalid ioctls: OK
> > 
> > Allow for multiple opens:
> >         test second /dev/v4l-subdev0 open: OK
> >         test VIDIOC_SUBDEV_QUERYCAP: OK
> >         test for unlimited opens: OK
> > 
> > Debug ioctls:
> >         test VIDIOC_LOG_STATUS: OK (Not Supported)
> > 
> > Input ioctls:
> >         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >         test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >         Inputs: 0 Audio Inputs: 0 Tuners: 0
> > 
> > Output ioctls:
> >         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >         Outputs: 0 Audio Outputs: 0 Modulators: 0
> > 
> > Input/Output configuration ioctls:
> >         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >         test VIDIOC_G/S_EDID: OK (Not Supported)
> > 
> > Control ioctls:
> >         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> >         test VIDIOC_QUERYCTRL: OK (Not Supported)
> >         test VIDIOC_G/S_CTRL: OK (Not Supported)
> >         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> >         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> >         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >         Standard Controls: 0 Private Controls: 0
> > 
> > Format ioctls:
> >         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
> >         test VIDIOC_G/S_PARM: OK (Not Supported)
> >         test VIDIOC_G_FBUF: OK (Not Supported)
> >         test VIDIOC_G_FMT: OK (Not Supported)
> >         test VIDIOC_TRY_FMT: OK (Not Supported)
> >         test VIDIOC_S_FMT: OK (Not Supported)
> >         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >         test Cropping: OK (Not Supported)
> >         test Composing: OK (Not Supported)
> >         test Scaling: OK (Not Supported)
> > 
> > Codec ioctls:
> >         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > 
> > Buffer ioctls:
> >         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
> >         test CREATE_BUFS maximum buffers: OK
> >         test VIDIOC_EXPBUF: OK (Not Supported)
> >         test Requests: OK (Not Supported)
> > 
> > Total for device /dev/v4l-subdev0: 44, Succeeded: 44, Failed: 0, Warnings: 0
> > 
> > root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev1
> > v4l2-compliance 1.26.1-5142, 64 [  592.022784] cru-ip-16000000.video: =================  START STATUS  =================
> > bits, 64-bit tim[  592.022784] cru-ip-16000000.video: =================  START STATUS  =================
> > e_t
> > v4l2-compli[  592.040565] cru-ip-16000000.video: ==================  END STATUS  ==================
> > ance SHA: 4aee01[  592.040565] cru-ip-16000000.video: ==================  END STATUS  ==================
> > a02792 2023-12-12 21:40:38
> > 
> > Compliance test for rzg2l_cru device /dev/v4l-subdev1:
> > 
> > Driver Info:
> >         Driver version   : 6.15.0
> >         Capabilities     : 0x00000000
> > Media Driver Info:
> >         Driver name      : rzg2l_cru
> >         Model            : renesas,r9a09g047-cru
> >         Serial           :
> >         Bus info         : platform:16000000.video
> >         Media version    : 6.15.0
> >         Hardware revision: 0x00000000 (0)
> >         Driver version   : 6.15.0
> > Interface Info:
> >         ID               : 0x0300000d
> >         Type             : V4L Sub-Device
> > Entity Info:
> >         ID               : 0x00000004 (4)
> >         Name             : cru-ip-16000000.video
> >         Function         : Video Pixel Formatter
> >         Pad 0x01000005   : 0: Sink, Must Connect
> >           Link 0x02000015: from remote pad 0x1000003 of entity 'csi-16000400.csi2' (Video Interface Bridge): Data, Enabled, Immutable
> >         Pad 0x01000006   : 1: Source, Must Connect
> >           Link 0x02000017: to remote pad 0x1000012 of entity 'CRU output' (V4L2 I/O): Data, Enabled, Immutable
> > 
> > Required ioctls:
> >         test MC information (see 'Media Driver Info' above): OK
> >         test VIDIOC_SUDBEV_QUERYCAP: OK
> >         test invalid ioctls: OK
> > 
> > Allow for multiple opens:
> >         test second /dev/v4l-subdev1 open: OK
> >         test VIDIOC_SUBDEV_QUERYCAP: OK
> >         test for unlimited opens: OK
> > 
> > Debug ioctls:
> >         test VIDIOC_LOG_STATUS: OK (Not Supported)
> > 
> > Input ioctls:
> >         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >         test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >         Inputs: 0 Audio Inputs: 0 Tuners: 0
> > 
> > Output ioctls:
> >         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >         Outputs: 0 Audio Outputs: 0 Modulators: 0
> > 
> > Input/Output configuration ioctls:
> >         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >         test VIDIOC_G/S_EDID: OK (Not Supported)
> > 
> > Sub-Device ioctls (Sink Pad 0):
> >         Try Stream 0
> >         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> >         test Try VIDIOC_SUBDEV_G/S_FMT: OK
> >         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> >         Active Stream 0
> >         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> >         test Active VIDIOC_SUBDEV_G/S_FMT: OK
> >         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> >         test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > 
> > Sub-Device ioctls (Source Pad 1):
> >         Try Stream 0
> >         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> >         test Try VIDIOC_SUBDEV_G/S_FMT: OK
> >         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> >         Active Stream 0
> >         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> >         test Active VIDIOC_SUBDEV_G/S_FMT: OK
> >         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> >         test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > 
> > Control ioctls:
> >         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> >         test VIDIOC_QUERYCTRL: OK (Not Supported)
> >         test VIDIOC_G/S_CTRL: OK (Not Supported)
> >         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> >         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> >         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >         Standard Controls: 0 Private Controls: 0
> > 
> > Format ioctls:
> >         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
> >         test VIDIOC_G/S_PARM: OK (Not Supported)
> >         test VIDIOC_G_FBUF: OK (Not Supported)
> >         test VIDIOC_G_FMT: OK (Not Supported)
> >         test VIDIOC_TRY_FMT: OK (Not Supported)
> >         test VIDIOC_S_FMT: OK (Not Supported)
> >         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >         test Cropping: OK (Not Supported)
> >         test Composing: OK (Not Supported)
> >         test Scaling: OK (Not Supported)
> > 
> > Codec ioctls:
> >         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > 
> > Buffer ioctls:
> >         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
> >         test CREATE_BUFS maximum buffers: OK
> >         test VIDIOC_EXPBUF: OK (Not Supported)
> >         test Requests: OK (Not Supported)
> > 
> > Total for rzg2l_cru device /dev/v4l-subdev1: 59, Succeeded: 59, Failed: 0, Warnings: 0
> > 
> > root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev2
> > v4l2-compliance 1.26.1-5142, 64 [  602.158977] ov5645 0-003c: =================  START STATUS  =================
> > bits, 64-bit tim[  602.158977] ov5645 0-003c: =================  START STATUS  =================
> > e_t
> > v4l2-compli[  602.175529] ov5645 0-003c: ==================  END STATUS  ==================
> > ance SHA: 4aee01[  602.175529] ov5645 0-003c: ==================  END STATUS  ==================
> > a02792 2023-12-12 21:40:38
> > 
> > Compliance test for device /dev/v4l-subdev2:
> > 
> > Driver Info:
> >         Driver version   : 6.15.0
> >         Capabilities     : 0x00000000
> > 
> > Required ioctls:
> >         test VIDIOC_SUDBEV_QUERYCAP: OK
> >         test invalid ioctls: OK
> > 
> > Allow for multiple opens:
> >         test second /dev/v4l-subdev2 open: OK
> >         test VIDIOC_SUBDEV_QUERYCAP: OK
> >         test for unlimited opens: OK
> > 
> > Debug ioctls:
> >         test VIDIOC_LOG_STATUS: OK (Not Supported)
> > 
> > Input ioctls:
> >         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >         test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >         Inputs: 0 Audio Inputs: 0 Tuners: 0
> > 
> > Output ioctls:
> >         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >         Outputs: 0 Audio Outputs: 0 Modulators: 0
> > 
> > Input/Output configuration ioctls:
> >         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >         test VIDIOC_G/S_EDID: OK (Not Supported)
> > 
> > Control ioctls:
> >         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> >         test VIDIOC_QUERYCTRL: OK
> >         test VIDIOC_G/S_CTRL: OK
> >         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> >         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> >         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >         Standard Controls: 12 Private Controls: 0
> > 
> > Format ioctls:
> >         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
> >         test VIDIOC_G/S_PARM: OK (Not Supported)
> >         test VIDIOC_G_FBUF: OK (Not Supported)
> >         test VIDIOC_G_FMT: OK (Not Supported)
> >         test VIDIOC_TRY_FMT: OK (Not Supported)
> >         test VIDIOC_S_FMT: OK (Not Supported)
> >         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >         test Cropping: OK (Not Supported)
> >         test Composing: OK (Not Supported)
> >         test Scaling: OK (Not Supported)
> > 
> > Codec ioctls:
> >         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > 
> > Buffer ioctls:
> >         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
> >         test CREATE_BUFS maximum buffers: OK
> >         test VIDIOC_EXPBUF: OK (Not Supported)
> >         test Requests: OK (Not Supported)
> > 
> > Total for device /dev/v4l-subdev2: 44, Succeeded: 44, Failed: 0, Warnings: 0
> > 
> > Thanks & Regards,
> > Tommaso
> > 
> > Lad Prabhakar (12):
> >   media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/V2H(P) SoC
> >   media: rzg2l-cru: csi2: Use local variable for struct device in
> >     rzg2l_csi2_probe()
> >   media: rzg2l-cru: rzg2l-core: Use local variable for struct device in
> >     rzg2l_cru_probe()
> >   media: rzg2l-cru: csi2: Introduce SoC-specific D-PHY handling
> >   media: rzg2l-cru: csi2: Add support for RZ/V2H(P) SoC
> >   media: rzg2l-cru: Add register mapping support
> >   media: rzg2l-cru: Pass resolution limits via OF data
> >   media: rzg2l-cru: Add image_conv offset to OF data
> >   media: rzg2l-cru: Add IRQ handler to OF data
> >   media: rzg2l-cru: Add function pointer to check if FIFO is empty
> >   media: rzg2l-cru: Add function pointer to configure CSI
> >   media: rzg2l-cru: Add support for RZ/G3E SoC
> > 
> > Tommaso Merciai (5):
> >   media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G3E CSI-2
> >     block
> >   media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G3E SoC
> >   media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
> >   media: rzg2l-cru: rzg2l-core: Use devm_pm_runtime_enable()
> >   media: rzg2l-cru: csi2: Skip system clock for RZ/V2H(P) SoC
> > 
> >  .../bindings/media/renesas,rzg2l-cru.yaml     |  65 +++-
> >  .../bindings/media/renesas,rzg2l-csi2.yaml    |  62 +++-
> >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 139 ++++++++-
> >  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  91 ++++--
> >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  39 ++-
> >  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 165 ++++++++--
> >  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  13 +-
> >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 295 ++++++++++++++++--
> >  8 files changed, 737 insertions(+), 132 deletions(-)
> 
> -- 
> Regards,
> 
> Laurent Pinchart

