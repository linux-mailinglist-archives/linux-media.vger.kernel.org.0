Return-Path: <linux-media+bounces-57664-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJIHO4ikymmx+gUAu9opvQ
	(envelope-from <linux-media+bounces-57664-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:27:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB0F35EC38
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F386E301C120
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBE5377ECD;
	Mon, 30 Mar 2026 16:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IuEoYscp"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010029.outbound.protection.outlook.com [52.101.228.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38210377541;
	Mon, 30 Mar 2026 16:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774887975; cv=fail; b=Ae80OwFMg+K64FptKRguz4iFUsub2HJwjgkwwCn8mOa5OWOKRhwhzsppVnPfjW/l4ZoNgjJIRNpyP0GxAHErrH8FWa8+cHs+tApwMU1bUg9Ci2pg2LNktNPF4wY92KSi7CiIKJIfktLrL/OkbsWRA11h8/zI1dxP12xYdB+KYEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774887975; c=relaxed/simple;
	bh=tcO8+B5c1vvwZhZNyn4nJiEE3cWsvhbLAHhtuTifm84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AGCi/BaiYERq/md7y/yWADA1wIJq8ZUe5tgAsJ+Fcz9ashDBLauKZP2udTeQm298DOrvHdC7QRz8K4l6U/0y8zZE8xGDx/bU7pGzTYWPtItIbCGoVHqz4yC0ieeE6KDGR30YTbI6cf8xhaDN2fN5gcwbXuxPQeQrF10zX84anRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IuEoYscp; arc=fail smtp.client-ip=52.101.228.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOIYhccPWx9B5mII0fkZUQ2/WL2fcHhFzCh87Xf3mR16hiQhPz7gm/EJc+dWaG6YTi4cg1byLcOKcgM7I6eH4/9tMxK1DykmbNBsnKDUDpqbqb8w9cx45zXt295Qxo8+oIAlowE0KwXWyvmkR933aJg7LflEjnWixJvD6t2wMGNaMk8Cne6VPvl+yUFKg0MOUsIj5FS13kU86CPB7FLyV3c1wdIhRT6jGfrq3ozsPcZ0GyuDYNDotU1XNqTfOAxWGdO9dsPiBImKXDhZ3lLQwKuonzqF1Eizyvkk/Ma7If5mBEtJfk8UXrsLMgFC9fqwiOkwOMLMofI7ShpPqia/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQYyHcn2XW5v7bMD0cxoLKigD2NeJImZRvOMgL2Ei00=;
 b=hVZm1ih1VsDNNj2C8IaC/FhZizfeuUZYJ1S1OkaN9n01RxrsQghDZQi3kZ9Zs5MtSOCC26/26uEyisy0OYpkLpD6eJx7+T4YqZxwB9vR9iKQBgNaxSPo9B5mNWD+Ju6M2IChseJ6v6CSMLigJt/pqBpTwPIjzZ5Z7t2xxHytDZ+/V+TPM6j1vWUUCSg0Gs1XWSqG1Nxdb1CC7gpKH24LAUaO+qwaOgMPLYZL/ULyj54CcScccYgZ+KTpruEH7XqVwwn11hjm2fDVDVyQo5PydJCcAuI/Qxyfq94l3KDmp0nDhoxPLXYUKdpTxuuGcVeQXKC+XoKcjHqHLGzOD76exA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQYyHcn2XW5v7bMD0cxoLKigD2NeJImZRvOMgL2Ei00=;
 b=IuEoYscpAHqwu3MdZTHdOdKbjfaISZzLhIWxaxusQ43re+hhJhRX+juTRrB4KR1wQOnwPCBtUC6DlW7WmFMtE0s/SSVPD45H0NzcLR9uNuYLVF29zgAzknfArh4qluUHYSubMtMeq7gB0SBCl7RbhCxmT1nYjW+cITs/2cis3UY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY7PR01MB17049.jpnprd01.prod.outlook.com (2603:1096:405:328::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 16:26:11 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 16:26:11 +0000
Date: Mon, 30 Mar 2026 18:25:59 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH 10/14] media: rzg2l-cru: Manually track active slot number
Message-ID: <acqkF1otRjrBuPq1@tom-desktop>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
 <20260327-b4-cru-rework-v1-10-3b7d0430f538@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-b4-cru-rework-v1-10-3b7d0430f538@ideasonboard.com>
X-ClientProxiedBy: FR3P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::11) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY7PR01MB17049:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a9b35cb-daa7-4f2c-7091-08de8e790dec
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	n/+5dWJqoHxLr3kZcMA5HXdctZUXbzx3aI++hr3GlI7BJj7DIgeD6xA9NRtLQeFZUsxXfiSiPTNkwTyslKjZEu0b1gIL8Jr5Skbc1NeitBFs9o17WVafDwB7O2oAgbyujsdV1GJE3k5U9v4OgYVxJuT9Yf3O68CjrIOxW8vMgSgjvk4zbnb+/uz+m9pR24MpKXKfq/PPEPKH+IK04sqsgJZ6pWHOtXx8YQ9KlAxdPp8aPIynu1FmW9cXNn4ccZmyuFOwynUAAesc6rt0xzOfXKK5iSKb1vlv5OyYd/bWKWDsWJ5uZwzr1PNYlR7eMO2pJ+f8Tz+8uZ6EwfDfFxwADrs/D9vmcvvS4y1Bqzv1U+LLHLrZWTHX/zJrHbYXHesm2XlpCcTrVOIfNu4MuikHQBybMuwV2kSJFmgwuTEVppVEeHTUmzUGAv0a6lvn0MTIoI8N3e3liRjdSoe5TJM2dVuL3bBoYLhmUBDU/83jOpW41gGTXfdGBVsV33kNrQbq8nncxWBSTQRQB/IpMnT4keleo16IrG/EUGBNgmvrwc477a2oGf7sgaq9cvOxL42W3wYym3zcEuaF/szh+xoCO2IJZssx2TkvxaEOxrcPok7QXHN8DR2QqxKctroSG+nSuTFu2m2q4P2ql3G5LueMAGB2pBtqGheiR25JD9/spmvELqvqZhUEZ5PXuivVlNJaupkGnVus6YJcy0/F42wh1Muxb6KW3U8a64Kdhjs7DddOma3HJnZDsxdmOtX0nXitJjps8RHgb99yB8hA4rzO/wB7Yn4SDih2k88Tu/pWcHU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SGia1PzLAelVpIsI1sLiKlrAsumGQxXNzgFlXX0Lb3/tWuc1u55eNnOL3Nkg?=
 =?us-ascii?Q?4aUfHcBMMpL0l4WnBA+Ln8xUNYzdG6+z1fITBlT3BH9JT7a5PFavq1oP3z3P?=
 =?us-ascii?Q?Hy4VdhSIlq9GyXZOz7lKG8HH3KkgpMGNby92uBYQy7ORhVfuHP5L8hQ3XILx?=
 =?us-ascii?Q?0L6e+9VbIyhrlqg1ZNp71C7syv8KjiQ5phWAN9I9dkUGzxIsOAbKpGkTvcAm?=
 =?us-ascii?Q?nNxDBYRXcjlUrDumlXlItdjF2dQ6yN6vMomw72fLJn42D5ZUG/aHhwsbDTDj?=
 =?us-ascii?Q?SeiEItbcfmLlU3WaGyaBPjNMS1KKVqEEt1bD8wdCSLvI5L+EfHtI+yjr+dS+?=
 =?us-ascii?Q?crlQaSq66cz3LLO3xRDR1mj6C+QjWb1c/UMze8/Q+EZepUomQW1ZFSfzsO3j?=
 =?us-ascii?Q?kKQ0KWmrkYf+KNkUdG0Yz2WhqYJwpZQn7HRHkpDEljXaMY1bCp4zpDKmh68D?=
 =?us-ascii?Q?fMhgsNqObjRFVa6rweccBx7km4wAHZkX+aObp5LOkEhdSH6QnZc/EmgNSIE2?=
 =?us-ascii?Q?Jqph0Co0BCrN/zZpZc1GR2kbUqfkMPph2T9nt8J1O41gDC6BBXRS1gUyfyGm?=
 =?us-ascii?Q?djl8+39k24gGzMnvq9DzhLbBpcnLRNihMDr3EBbz7xpDqv26YKfH+LuS/MNa?=
 =?us-ascii?Q?ScxYE9TuL7wx+ETAb5PJzu3WmfffxdxeSsR3NPMuIFCxzdGY7s5x3+ORwady?=
 =?us-ascii?Q?5cGjs4r/+cuJs+XF12ATXZ9y1/qMTbIHhhFX/3sVTDezwGWywnD4K/JvI6gb?=
 =?us-ascii?Q?C1HjeZZl71fpEgEVrVQ/ka2HE34SdbDzoEMxIzxAyKKErYWFQ0PjjUQpixJ1?=
 =?us-ascii?Q?WasT+D95amUGAL8xliF5WwEIzhdJhJz8+tju64kE+sf2hiOqGlSl+a6wf5hG?=
 =?us-ascii?Q?Qf7RCZvzt3vvdoSkB11OKUSFz2w+9otsJrP6RcQQ5yNalboowYEfhNXXObcl?=
 =?us-ascii?Q?HVfanVdPIvUtHdlRsMe9mujGe2Pcbj2kAWc/LpTp7i2Reslf7GioVIIyrnYk?=
 =?us-ascii?Q?OpvVeo7HH/u4xYwblILCI2DednKK4T9RUraiL711Rm3GUTfiquxEP/zlwXnF?=
 =?us-ascii?Q?LwzdUFntJKvzhgF/QRQ/AtF1U1PrgcYvyiHsRpmHKfsZtpfh1Io7Me1ySs5o?=
 =?us-ascii?Q?oi/2xxzALLRbINZr8pjpyXj853F9G0XADv4ske38Og0MCSMQXJl0vAql4XFF?=
 =?us-ascii?Q?wCJvtQCDtgCasPIpCy9jZul7kK97vgO2Qipc2QR6GZGep7/Ql4N8Va8D2/s4?=
 =?us-ascii?Q?ZWwZwpBGfUmVaaso3gTrWDHvgqekW9d+MuztPXg04KS11agbGK+858y9lZEL?=
 =?us-ascii?Q?hujvebhZPcTEQlXP3gXSo3882h5A/iURQGwx2LsAsHHM1GWOG11D3yOP1Alp?=
 =?us-ascii?Q?rbGrPEf2KR7Oz8BOdG7293+yX0kFG3EMSmjiTxv0/ptWN+AH3stdfQBjjCSW?=
 =?us-ascii?Q?bRulq+nhSWXre7ClH3M/JNh+TpzEttjO8M8DE1eiiemLpDaq14BtiT+a0VlK?=
 =?us-ascii?Q?JQuAhm14XtINd5CLpkFsA1Fja2oc5tFiN9GzGtnfJJ1pCr9WAof/VwCW2dkm?=
 =?us-ascii?Q?E9yXP15t8SiN9WdoT00nFcqbrFQPmIwzqXa/qdGj/C/8TTAYyx+S/LdAldev?=
 =?us-ascii?Q?myEwFY73j6igLjVHLHlr1u5JKIIhSxjJptfys9nuGFYHw2wFa/wpTxlspWde?=
 =?us-ascii?Q?E8TXMIC7rGoxuKzZyTAy+sGUEuvhrJx5iShjYGxF6Axs/WzwKzkHCjEPE0/Z?=
 =?us-ascii?Q?tERwFxZ6ls2g/kVA4nt9ycAuxsLqEXB/K8F9kmAzMZIuiR7+Bpsl?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a9b35cb-daa7-4f2c-7091-08de8e790dec
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 16:26:11.2163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OKTHu6RH4mVyo80CyMIJwjruZGc19yhOl8dIJHkZCKDgsoFDl0hSANkW4+h4GXpV0JDJ9CTjP5BboXatVrl8mdfQbCYsTRgsKM2Uwq7cQQyAyDD36JgQESYt4N54p2aa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17049
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57664-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,bp.renesas.com,linux.intel.com,protonmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,renesas.com:email]
X-Rspamd-Queue-Id: 6AB0F35EC38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi Jacopo,
Thanks for your patch,

On Fri, Mar 27, 2026 at 06:10:15PM +0100, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> The CRU cycles over the hardware slots where the destination address for
> the next frame has to be programmed.
> 
> The RZ/G2L version of the IP has a register that tells which is the
> last used slot by the hardware but, unfortunately, such register is not
> available on RZ/G3E and RZ/V2H(P).
> 
> The driver currently compares the value of the AMnMADRSL/H register
> which report "the memory address which the current video data was
> written to" and compares it with the address programmed in the slots.
> 
> This heuristic requires a bit of book keeping and proper locking. As the
> driver handles the FrameEnd interrupt, it's way easier to keep track
> of the slot that has been used by ourselves with a driver variable.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  7 +++--
>  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 35 ++++------------------
>  2 files changed, 10 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index b46696a0012b..bc66b0c8c15e 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -108,6 +108,7 @@ struct rzg2l_cru_info {
>   * @vdev:		V4L2 video device associated with CRU
>   * @v4l2_dev:		V4L2 device
>   * @num_buf:		Holds the current number of buffers enabled
> + *

Maybe you can drop this.
Sorry for the nitpick.

>   * @svc_channel:	SVC0/1/2/3 to use for RZ/G3E
>   * @notifier:		V4L2 asynchronous subdevs notifier
>   *
> @@ -117,9 +118,10 @@ struct rzg2l_cru_info {
>   * @mdev_lock:		protects the count, notifier and csi members
>   * @pad:		media pad for the video device entity
>   *
> - * @hw_lock:		protects the slot counter, hardware programming of
> - *			slot addresses and the @buf_addr[] list
> + * @hw_lock:		protects the @active_slot counter, hardware programming
> + *			of slot addresses and the @buf_addr[] list
>   * @buf_addr:		Memory addresses where current video data is written
> + * @active_slot:	The slot in use
>   *
>   * @lock:		protects @queue
>   * @queue:		vb2 buffers queue
> @@ -160,6 +162,7 @@ struct rzg2l_cru_dev {
>  
>  	spinlock_t hw_lock;
>  	dma_addr_t buf_addr[RZG2L_CRU_HW_BUFFER_DEFAULT];
> +	unsigned int active_slot;
>  
>  	struct mutex lock;
>  	struct vb2_queue queue;
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 9406a089ec9f..17e0153052e1 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -637,31 +637,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>  	return IRQ_RETVAL(handled);
>  }
>  
> -static int rzg3e_cru_get_current_slot(struct rzg2l_cru_dev *cru)
> -{
> -	u64 amnmadrs;
> -	int slot;
> -
> -	/*
> -	 * When AMnMADRSL is read, AMnMADRSH of the higher-order
> -	 * address also latches the address.
> -	 *
> -	 * AMnMADRSH must be read after AMnMADRSL has been read.
> -	 */
> -	amnmadrs = rzg2l_cru_read(cru, AMnMADRSL);
> -	amnmadrs |= (u64)rzg2l_cru_read(cru, AMnMADRSH) << 32;
> -
> -	/* Ensure amnmadrs is within this buffer range */
> -	for (slot = 0; slot < cru->num_buf; slot++) {
> -		if (amnmadrs >= cru->buf_addr[slot] &&
> -		    amnmadrs < cru->buf_addr[slot] + cru->format.sizeimage)
> -			return slot;
> -	}
> -
> -	dev_err(cru->dev, "Invalid MB address 0x%llx (out of range)\n", amnmadrs);
> -	return -EINVAL;
> -}
> -
>  irqreturn_t rzg3e_cru_irq(int irq, void *data)
>  {
>  	struct rzg2l_cru_dev *cru = data;
> @@ -693,9 +668,8 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>  		return IRQ_HANDLED;
>  	}
>  
> -	slot = rzg3e_cru_get_current_slot(cru);
> -	if (slot < 0)
> -		return IRQ_HANDLED;
> +	slot = cru->active_slot;
> +	cru->active_slot = (cru->active_slot + 1) % cru->num_buf;
>  
>  	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
>  	cru->buf_addr[slot] = 0;
> @@ -762,6 +736,9 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>  		goto assert_aresetn;
>  	}
>  
> +	cru->active_slot = 0;
> +	cru->sequence = 0;
> +
>  	/* Allocate scratch buffer */
>  	cru->scratch = dma_alloc_coherent(cru->dev, cru->format.sizeimage,
>  					  &cru->scratch_phys, GFP_KERNEL);
> @@ -772,8 +749,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>  		goto assert_presetn;
>  	}
>  
> -	cru->sequence = 0;
> -
>  	ret = rzg2l_cru_set_stream(cru, 1);
>  	if (ret) {
>  		return_unused_buffers(cru, VB2_BUF_STATE_QUEUED);
> 
> -- 
> 2.53.0
> 

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso


