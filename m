Return-Path: <linux-media+bounces-55575-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAqDHMOus2kvZwAAu9opvQ
	(envelope-from <linux-media+bounces-55575-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:29:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C733A27E1E0
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:29:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8A48305A6F0
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 06:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2215A26E6FA;
	Fri, 13 Mar 2026 06:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xlAvG6mW"
X-Original-To: linux-media@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012048.outbound.protection.outlook.com [40.107.200.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3692523ABBD;
	Fri, 13 Mar 2026 06:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773383235; cv=fail; b=KmaDWU9Opvd2uncfnQ3PA7vPAd7ljkhLauSdpX2OIJcBwTEYzBFmVlMv0q6kJAqkMqaNP64ycF1F2g/r6Mkg1vT4oOt8KNwy78vefoxPRgTVLbVX4GBmn/DpBnbdR9uo1LuxJCBaa+iIG/sx+81ewDsRIexuUQ0PzzKSXhT8NZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773383235; c=relaxed/simple;
	bh=v4BM9t/bbILGb5wFbyEbuGybcMFF6GfdKPz2H+VHVtQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZixgqHvefPO8j8W7uJRCN7WbEs+B00WtUnhN0ckjIaGqMokdbdWvG0Od2Cq5SKNSb1ldSBTARUcHDfNdE1u1BRG9Qj2sn5NwUKw048zuRBAbzWs8PB2+BAS+Vo9C8eC4hhs93/gU7+B0+llPn4hEh2WYAQ+loPwiI1N4wC8NQ7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xlAvG6mW; arc=fail smtp.client-ip=40.107.200.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhubsSYKK4DaMEbzusIKgeBmCUwNOhSK2XWOJZucXrM1EtYeBAJ2wBuLXsJ6ETEiJNptiBwyWmLOpbreMKYF5Ml3ulOp+gPK//yHkMzVGmBbhIfneaevH8fuytCSXmYOzJtAzLycN8OPb2Mz+Yqk05uI8srJ1/DZHVHehAyJBF201HNY3qHy+MWOzxUv3qnqfrB5KxzI8hFvkrYawF5T3OrZwu0xdqftKy7CKhrdysRt3RnQND7NjAXKISIbdRWtBVi5QBuS4Mdoqrd15rORmpiNvfhlvleyGvsqAU684yWhU/iL8mw2ceddNsiHL92fT2XKhjoUY1slJlW+y/344A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KynTTdC3euyVJG8natxSXgwe0X4xQ/Bx+SNfkhtwiNU=;
 b=xpum5jZYNot/9KBm1NZcPyb04ItyvkWkKMZU0Po6y2d5rrzq8UqTxn7Cf/moIJe32H8cVccAhgXuy9yPO0BsRdQvrnZ2FgMInUtm4j1bVcVLibXbYRK7B7BChbcYANvrXPYlOGt5zt6uPqEnv3M+gRfWz5tYWxldd8vBLqe7URlnzpPs/qK5Q5ddXQb23qBtKvDAFHwgk8IvgntHMxbKad1qGcaqYvoLtBpP45H8Ym3gg3xV9oAWxVwQC0k2esgXI9csNlse5hTECYetwCPKwWwWpaKrHxEF5h3YxzEyI2Xbs3i8gzhwDcMFjDyPbjhoce8B+OIfuFDUMlGjo+v5sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KynTTdC3euyVJG8natxSXgwe0X4xQ/Bx+SNfkhtwiNU=;
 b=xlAvG6mWBzZsN1uevOrgR7n2D6W8wiHV1D/qb/BqlN5T7VRo1c5t9SrRPoi8JfmDYIhja3x7iN3MGbDs9XUNeqR3xCuLZ7rA9pXFu+CUPLnDT11IYqWkeWzLClNcPjKr+65lR7UGdjofriQddNE4WnbrQhFmHjBkDV6hM+8REao=
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by SJ2PR12MB8832.namprd12.prod.outlook.com (2603:10b6:a03:4d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 06:27:09 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%3]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 06:27:09 +0000
From: "Du, Bin" <Bin.Du@amd.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "laurent.pinchart+renesas@ideasonboard.com"
	<laurent.pinchart+renesas@ideasonboard.com>, "bryan.odonoghue@linaro.org"
	<bryan.odonoghue@linaro.org>, "prabhakar.mahadev-lad.rj@bp.renesas.com"
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "sultan@kerneltoast.com"
	<sultan@kerneltoast.com>, "Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>,
	"Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>, "Li, King"
	<King.Li@amd.com>, "gjorgji.rosikopulos@amd.com"
	<gjorgji.rosikopulos@amd.com>, "Jawich, Phil" <Phil.Jawich@amd.com>, "Antony,
 Dominic" <Dominic.Antony@amd.com>, "Limonciello, Mario"
	<Mario.Limonciello@amd.com>, "Gong, Richard" <Richard.Gong@amd.com>, "Tsao,
 Anson" <anson.tsao@amd.com>
Subject: RE: [PATCH v9 0/7] Add AMD ISP4 driver
Thread-Topic: [PATCH v9 0/7] Add AMD ISP4 driver
Thread-Index: AQHcqhZoYle/dCAr7EGytOuk7bkUnbWp9cWAgAIQuBA=
Date: Fri, 13 Mar 2026 06:27:09 +0000
Message-ID:
 <LV9PR12MB982947D5D6E427283A3DCBF48745A@LV9PR12MB9829.namprd12.prod.outlook.com>
References: <20260302073020.148277-1-Bin.Du@amd.com>
 <abHqL-40c9TKQz17@kekkonen.localdomain>
In-Reply-To: <abHqL-40c9TKQz17@kekkonen.localdomain>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-03-13T05:50:43.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV9PR12MB9829:EE_|SJ2PR12MB8832:EE_
x-ms-office365-filtering-correlation-id: 8cd471b6-2207-4baa-07fe-08de80c98e22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|56012099003|19052099003|22082099003;
x-microsoft-antispam-message-info:
 SQIMxtZHnXobC0Z1V/OVkDmDRCC+azoJB9n7l4Gd+9vc3ZHOmYrVnC6xgLUqn1OJ3pWuM3GFfiqbYdEPFE2NPCjpzECaXK8HEbVc49Yb7dCv61u1kDbiBVzk6flsoL5MJCJEpBO5uMVKA45a0Z9OrNwWmICksIQpdHFgdZ3GwtTDWW+uqLBGySVNGSCD2EIwOVVirQ4vSryahuiEyDLOTowPGDpCTiv42qzVACTXjrm0eNnJSfuXQguj6d1TXkzS+3SAXWyRw1kCXTZseLE1SAQfV0UJF9DVC/69+GFygOtB36Z/IDm01ypaSsredWjgLy8KreJdb6Ww15iCb5QEcT/tYr3eNJxHYBpYf+gxKLxLvo4hedSVZyWDLltZ+ZX8vLyiLWgbJfyVcZFHmsSSDB3UqI1nHeDpI/KKKuAeIWQxGNFBsSme52dM/GhE1PcEHS5zhhEoDueN9CUb2cPRCF6YIcTLRgbEWtz+G6HckjthqIN0d8ASG4cWsKFsKSZ+FQXa48OS4fpumBUNO8avNABLKqmOtk5O5+LciYoWirxdSu1n/byp2fRRYn5gPEyIdlcEH3Cmb5+IvZyhFyind1p3M7RazKR8X4WpWArIM1vdRWFB3gKvaoofxiTpdA5nJ8jZRAfHGmOl9Pb+5W2qLfSvRi5lnw7R0nlrRwnbXWLBAbsQ8lUS3Ma2Ao0Ot7oLLw2rf1mjaEXFuTxYDs9KC/vXYs1wNq37dKc4qmwdaL5GtKTkaGST4NsA94CwLoDZ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(56012099003)(19052099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kUUSplyYOCM+HX2Ly1FVlEdi51qr0SanuAkdVR3/Ho0qaiXeWqzPcCt8qXJV?=
 =?us-ascii?Q?I5mG0RBk78Ff+4/X9oVaEW1a8zdus4vCh5h8VzTym5DxyOqDoR+/IW0SGxIL?=
 =?us-ascii?Q?ZXtiPxAXTQjkycZgO0x1u3k71IlhPY0hpTzvZsiRVyOPr10n0nti/sBbhOAM?=
 =?us-ascii?Q?X2AC7l+pyx4G5UB/WHdyjIqomtrbK6OIdvrdIkYSojqVmoUgse4UqyZaYZqB?=
 =?us-ascii?Q?UQK6t8jlisFRwK15pcXc5C+Bruyx0RV9B/6ujkCM0u/NOFQnu5W2Z+UNGkmg?=
 =?us-ascii?Q?EWQ5VgUAK8KBW7ESjAwxh4K0l7KTjFN6udKbi6wfU5eib9bOYr1PtTXmspuv?=
 =?us-ascii?Q?hVFZcyp3hGHTejWblV5U983oODYhm/MRi5LOQbmaYN9vQkmrF5HkaGNY6eD1?=
 =?us-ascii?Q?K23GeQXQGvKGnZEbEU72jaI4fVLCcPU5ztTuH9J121VQDXw/oqzIz9NOI2xZ?=
 =?us-ascii?Q?rD/8sRmQOOKKRa8XneIzJNqCete6QLZ/QyVUt5UlRJ3ZHFn4JkdasC413puh?=
 =?us-ascii?Q?P0cAJ3Pr4BRrHhzHi8XNp/Ej/hexYE2UICxAtH8YTO8+fafMJi/kEbuo5yWU?=
 =?us-ascii?Q?8pjhwKyTCW9egaMgAofzQcNhOhl8ucTkOzuPbfrukXMZsZXpAWcAjg0nu5J6?=
 =?us-ascii?Q?gLqNsDJHbngWJBpC1RUyZ13qAis+81GvtgTf3goDAtQCWn0V4tnRX7f0SfYZ?=
 =?us-ascii?Q?f6gwdPWzRGWzmT9uEa21ShjA0K/dmm8vVJv8tPsiWMKr5N12R4AtSoMgqE5b?=
 =?us-ascii?Q?1BWfQsx0cDC+FkCume8NuZeryfMbHdBgN9nGFGvNtOb0OKzYe2f4gltNed3m?=
 =?us-ascii?Q?3GCu1u+8sxIVSJ5JSqL74X/upEWxCkVf4qIEFOGyCpJqpsrl+CjuSK7OgSiD?=
 =?us-ascii?Q?Wf04Ot7XOM1LxjDMYHFp9bIfptGCE8w0j61M8hwfgPieZc2hJ6c4kTc5oy2I?=
 =?us-ascii?Q?u+f9AHKRbtNcLFeB3+pexX0JoGrWVhBYEiHBnvxjn4Xqc5wuxcxyNmXPLgqw?=
 =?us-ascii?Q?EhcDHzTs52gsmAcCynfa8WEkoXHZ1RhUT5s2qMFnCoO7zoch0vuurnWL9Noj?=
 =?us-ascii?Q?HWqf40aYSW4yNK7S7uGK4/r6jfAID60q6PoimrxI3AsM5Ubd4fvlkg5mtiiK?=
 =?us-ascii?Q?gn3gr9yJ96fbIER3etDuFcic+MRsYW2Ble51H73eVvHiGzO5OOm5CzYiqu12?=
 =?us-ascii?Q?8eVZ8ELY5d7oEzURBM3EvUaTdeuRe706a0+6Bo2Gt4tX+KWlsgfpim/wk8Qn?=
 =?us-ascii?Q?V4qGEqxHxvBI9YsHqQIuecIlztmlq7Ejgrr8QxFyFO0n2Hz+D+bFBylgPTe5?=
 =?us-ascii?Q?hAgSLV2oU0U4XtHrnvSXVrvLh4lhbszuHNnqQ9l0KqUu41z5R/bDhh2YuAXi?=
 =?us-ascii?Q?Vtj9qhN7pjmDtPOfNGFtpywiH5NgfITdnky8uqcVBfQ/puloO6yhNmIBpTd5?=
 =?us-ascii?Q?djVsP1dQSejQ12BD/7b0l/LkaMMS8rpuqaqXQqw947fh5Rch41BbY50fMm+M?=
 =?us-ascii?Q?7GVfGdRiI3IeWmDuFY3pjxHqQ1XWpaLdVr/7+hLCVXxiAqfeeGEzFSz/Rb9y?=
 =?us-ascii?Q?KZdL0M43SeYVM/ps9k63I56xjdv5aqT/nWYQuttzQ7DiwBMp6yhPMReery3r?=
 =?us-ascii?Q?YGIrmWbzirx1o4AWLf98p5udNsAwx+WkEoq7/49Hjm4mb+oa3o7RSDPnrjCc?=
 =?us-ascii?Q?c+5AQBre5M+JS0h7q3Lo92yY4KU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd471b6-2207-4baa-07fe-08de80c98e22
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 06:27:09.4233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D+B5zXpRo2o3sL5cxurmhtx7KrxQblxwz2HCSKH3aSDsiqTnGkdGBEWzytYtA/J2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8832
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55575-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,bp.renesas.com,vger.kernel.org,kerneltoast.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C733A27E1E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[AMD Official Use Only - AMD Internal Distribution Only]

Thanks, Sakari

>-----Original Message-----
>From: Sakari Ailus <sakari.ailus@linux.intel.com>
>Sent: Thursday, March 12, 2026 6:18 AM
>To: Du, Bin <Bin.Du@amd.com>
>Cc: mchehab@kernel.org; hverkuil@xs4all.nl;
>laurent.pinchart+renesas@ideasonboard.com; bryan.odonoghue@linaro.org;
>prabhakar.mahadev-lad.rj@bp.renesas.com; linux-media@vger.kernel.org;
>linux-kernel@vger.kernel.org; sultan@kerneltoast.com; Nirujogi, Pratap
><Pratap.Nirujogi@amd.com>; Chan, Benjamin (Koon Pan)
><Benjamin.Chan@amd.com>; Li, King <King.Li@amd.com>;
>gjorgji.rosikopulos@amd.com; Jawich, Phil <Phil.Jawich@amd.com>; Antony,
>Dominic <Dominic.Antony@amd.com>; Limonciello, Mario
><Mario.Limonciello@amd.com>; Gong, Richard <Richard.Gong@amd.com>;
>Tsao, Anson <anson.tsao@amd.com>
>Subject: Re: [PATCH v9 0/7] Add AMD ISP4 driver
>
>Hi Bin,
>
>On Mon, Mar 02, 2026 at 03:30:13PM +0800, Bin Du wrote:
>> Hello,
>>
>> AMD ISP4 is the AMD image processing gen 4 which can be found in HP
>> ZBook Ultra G1a 14 inch Mobile Workstation PC (Ryzen AI Max 300
>> Series)
>> (https://ubuntu.com/certified/202411-36043)
>> This patch series introduces the initial driver support for the AMD ISP4=
.
>
>This seems to fail to compile on LLVM. Could you check <URL:https://linux-
>media.pages.freedesktop.org/-/users/sailus/-
>/jobs/94941990/artifacts/junit/llvm.err.txt>

This issue was not observed in my local build or the media CI build with ea=
rlier versions. I am unsure whether there have been any updates to the medi=
a CI tests. Nevertheless, I will make the necessary modifications to ensure=
 compatibility across all compiler versions.

>and also the smatch warning here
><URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-
>/jobs/94955201/artifacts/junit/test-smatch.err.txt>?
>

Based on following code, I believe it's a false negative, by line 462, 'ele=
' is either not added to the queue or has been removed by isp4if_rm_cmd_fro=
m_cmdq() called at line 453 or by isp4sd_fw_resp_cmd_done(). This appears t=
o be a smatch limitation due to list operations being split across helper f=
unctions.

static int isp4if_send_fw_cmd()
{
...
err_dequeue_ele:
        /*
         * Try to remove the command from the queue. If that fails, then it
         * means the response thread is currently using the object, and we =
need
         * to use the refcount to avoid a use-after-free by either side.
         */
        if (ele && isp4if_rm_cmd_from_cmdq(ispif, seq_num, cmd_id))
                goto free_ele;

put_ele_ref:
        /* Don't free the command if we didn't put the last reference */
        if (ele && atomic_dec_return(&ele->refcnt))
                ele =3D NULL;

free_ele:
        kfree(ele); // smatch gives warning, '&ele->list' not removed from =
list

}

>There may be other issues, the Media CI system right now isn't very vocal =
about
>them.
>
>--
>Kind regards,
>
>Sakari Ailus

