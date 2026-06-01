Return-Path: <linux-media+bounces-63232-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPHEAXtfHWojZwkAu9opvQ
	(envelope-from <linux-media+bounces-63232-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 12:31:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CF061D761
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 12:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 960D3315756D
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 10:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94F63988F1;
	Mon,  1 Jun 2026 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sNQ2xH0q"
X-Original-To: linux-media@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013050.outbound.protection.outlook.com [40.93.196.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B88139EF2C
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 10:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780308030; cv=fail; b=GFYPpAgJ8duWK2U+p4s6oLuSWtp6y9JY4gxhwtVxODeNWOuQXsOOpdH6egjfIIAoUDK0XsNpMf0YcNCk0NUnX4X4gSnz+hitOScUx8foNj0ZFwiF6DtjW3wUm6YYc+zGeXQtVPUteKqCQgkwcAyAwD+J0U3R/VNkAm2gDJj+tCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780308030; c=relaxed/simple;
	bh=EI4ETtjxkmvMQdixU9mRLwGJEfPiJFFQRMMTFxYA8VY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gRCMQdFNUMaULW/+6s7oqMcRdcgmHIPdold0mIJYaxPS3IouaWLXpTcEHfLUsAr3zkd1vOZdtG0oeRhL2LGNgxHGHDzWVvtEwRLIN0F8Y33U9Q+mJD+3eeogN/KDDES5z5zNdHdpyJOUP8XADrKXnORbPJs2oeqfHe4WUZfyWGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sNQ2xH0q; arc=fail smtp.client-ip=40.93.196.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgIbo0dBgF2JDKo6+E+ydBuFGBF196ItpjnCs15+xQ8NH94vlM0CzqY+LZkOKO4UPHeEHmaH6C57ZVXfV0DrZM1rwgB2WSo3TnsGbd3cBcyCSqE+KmVQX1Tl6eAuOIMFG0J9dmubbWRRD62BzIv8Qohzul4YCW/AEDyIcIsUPF3v3HJSy2nCYGgl+6AOR15ffeVbEcVmmiwkdV0wfiBKWnbFREKhMfMES/w9nhNE3E6ZZM1QiE3OxU0fTiEvnJhDWN+GSYIesEIqLBdUkYFuBy4VNAo+IPNr+l1fGeu+y2iD6lkkjA3+U7zsQ49HQj/v8KmQ077uDi82Ch5bdaEx9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EI4ETtjxkmvMQdixU9mRLwGJEfPiJFFQRMMTFxYA8VY=;
 b=lu7XwZey3Ujb9qaAKxpZqkCCFjBzOQGefDXy0XgWybP5Kt3Q2h9+MtRj6+/e3lKTz/Pbk4etKmAkf6BnAbBtVDjh6eSuciq18Wo0Uc9Vz7g/eK3JnXKFggI9iHxAPb+h2DJ2v+tWglwRHBm5W0xEel7TNq7ifodUc/JJDOx/TiAF6fcviVG1GKyCnixw8qPzo/lEVa6wCeNtlR952pBJ9qXEaVsY4w7QuNK4TwS3Cf3mw04/+QSR2YPT8yGGEllCLKux/j032ThUXWIeO/wQ0LconsgZrEEjiiCja6Y0XDx4YYQNpIdSOcYkTQ+S2va+pVfKZuSFEX2zJQ1CL+fnyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EI4ETtjxkmvMQdixU9mRLwGJEfPiJFFQRMMTFxYA8VY=;
 b=sNQ2xH0qOJFx92gyN+7BGQQuZfuoG3U6AEFI3SfpnpHFzWCFx++BEslR8eIvRZ1Jbxa3Bj8MgXlsqMubTJsPrCsqLzHl2E0oHxUJnpgAreJl6Gc8sGNPoz5i0tdGVfiluXQWWP880QN5Zh5c31Q7yy/vluvo3JMDOgY1v3o+g8Y=
Received: from BN3PR12MB9569.namprd12.prod.outlook.com (2603:10b6:408:2ca::9)
 by LV2PR12MB5800.namprd12.prod.outlook.com (2603:10b6:408:178::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Mon, 1 Jun 2026
 10:00:15 +0000
Received: from BN3PR12MB9569.namprd12.prod.outlook.com
 ([fe80::2aa1:eed7:b03f:5020]) by BN3PR12MB9569.namprd12.prod.outlook.com
 ([fe80::2aa1:eed7:b03f:5020%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 10:00:15 +0000
From: "Cao, Bingbu" <Bingbu.Cao@amd.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "tfiga@google.com"
	<tfiga@google.com>, "ribalda@chromium.org" <ribalda@chromium.org>
Subject: RE: [PATCH v2] media: update contact email of Bingbu Cao
Thread-Topic: [PATCH v2] media: update contact email of Bingbu Cao
Thread-Index: AQHc8ZPGyawsf8eYuUWun7yTLn4c0bYpXT0AgAADltCAABSDgIAAAMtA
Date: Mon, 1 Jun 2026 10:00:15 +0000
Message-ID:
 <BN3PR12MB956901A268C35C90BD53E2208B152@BN3PR12MB9569.namprd12.prod.outlook.com>
References: <20260601065555.150536-1-bingbu.cao@amd.com>
 <ah1B9h8baqGqZ8Zj@kekkonen.localdomain>
 <BN3PR12MB95698640E1B433B04559BD438B152@BN3PR12MB9569.namprd12.prod.outlook.com>
 <ah1WLSwptKxFrHkN@kekkonen.localdomain>
In-Reply-To: <ah1WLSwptKxFrHkN@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-06-01T09:54:31.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN3PR12MB9569:EE_|LV2PR12MB5800:EE_
x-ms-office365-filtering-correlation-id: 90551028-c825-4225-6234-08debfc49462
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099006|4143699003|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 Kgyoj7X1d7IlQ4je8+hni7s3am4+YfZgh09xrVKTy1WpCA6I1EG9hipQWlFXJ+8uYBQeq/z3cvtf+2sEnmDruQMhSEPXy1w5ICaspqQ5nfZNqkNbSn0GDCYPb4wdUFI5a8ZC6dAYnsLaaKqzRydCS1qDDOsISjeGg5VTy1x89u/wQ562dJEzFfjQBG1jsT7cwrtGE3zUsarn6tA45GQjYzAqWLtKuhsn/e7evZOheXZe+guqYN+hd5adzN/tKCrK9np1ZhdL9i+LyyI1EiXqumfP0/mA9h4v1LGqazqEsxNhE8wb2cAzNfqSzblWkRh7SwLVL8sv+3wUUp9M0GApgzPr1qeaaPh/0/bbg6IAC6BEhiy6zmLQjWSjqegI5uY8eJihWzmDXZ2z+3TuLdVz/Wq+oSpu4jiqPqk7H1nujqRRETQJgg/hvLzd0gPsB/vEVnXfUUj9FVEsErbmY+ErgZFCIXmh4mhQ/PFwBMGwVMAKBioFHfs0ZytKyZo9+/n1E4pInYspHYR+F5a7SPOhCmLS4qs2rBtsq4iCUhSMbeXftNejylNT+byQbAXof0lz6v5LMF/cdyvYkUGXWHflF5bov3fXZa6nyRT/ys26qSgvnh8I2Y44PhJOSn9lZRtUaS7RcEcjnNS5nE2OQYP6fc5FUPLKvDsfsMcDfxMyJyUmKK55tir4t5DL+NX+QblO9jlutNmXuA5CbiVli4GS/N2Q3t7PB+G9PuZyY3KBedatnRWU0e2SygeuAO48eyiUDmPK03YS7iqx4cCmTNVGsQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR12MB9569.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1yjvGWPxiB6xSEEzbfw+9PihUoZW4yAnHdZN+vjsYFispFOX1EGgEvUE6Wzm?=
 =?us-ascii?Q?88RGGtomrYfNrWJBO0XUA+AO+BtpresMVKEzd/JipXPMyfsOl3jbistDKQJO?=
 =?us-ascii?Q?mgxZoG7cX+Q9QyxZbgKN3vaQ7btF86QdnC9yKLSPn6A4T45UUJ5C+ql95EGR?=
 =?us-ascii?Q?LesZUs4h0fewsW96qpRjLJCCiO8ZSAM5b+Lot5EwkeO1Wriqa4Is0X9e6djs?=
 =?us-ascii?Q?zrCLAvzPdjnlOnWdoTo9nsGWikCv/4ec0FZhLcC96mDgNo95jg1uQ5FLjD3P?=
 =?us-ascii?Q?bIBZ2R78ol+1xoRP4uw0mdZAKF+eMYW+ZYLKLeygg9BVKSBHorIVi8L2sTcj?=
 =?us-ascii?Q?+zw/aTvQ0KRqltB+5t7Gp+hRyiOqaW/GngqfMHtXmPHjqpr6U43e2CCkl62g?=
 =?us-ascii?Q?JneuNUGM9DhvzYaXoAZ2qQ2HGpt0BN9ci0ZUlirT3AR3zbCpgNAEbNsElTSI?=
 =?us-ascii?Q?pUGk8+wlFETVCLS9QYejRTiDa674sA3hq5QuUMNq2XofXK+RIXY7SuyiieWU?=
 =?us-ascii?Q?JEzKsaTsKXTtR4KygbjMSjOZ6lal28QMdb5D/m5PTMYMnPclKa2l+p7YquHc?=
 =?us-ascii?Q?2vaPFRQkKIpOtlk6+0g4AA2lrorDBFoETPG3yLPb7hKH/VzqlHGq1BGK8xJ/?=
 =?us-ascii?Q?ob712qEV6p7i/s8PKnmWiVUEw7g1J3/PXVWEbGXLzEkqa3W+4hoPvOYzOExv?=
 =?us-ascii?Q?bj//u8cCPtub3AYByWv6OsykqVLChVTbIDqQPNp8pXoSKzVILe0H1f2iatOX?=
 =?us-ascii?Q?6SIyieMX4IWD6iXlf3V9jZx4xAo9UH5L5mhPNpoNmfYAgDrgqiIi5wQjg7Ag?=
 =?us-ascii?Q?0+Z0z80IVQzy976cJEDp6q1i2TMYB9Z/HlzRBGt7m4fFvbSIulq/rM1k+W5y?=
 =?us-ascii?Q?d/tm66zj24OnUY6F/01zd1akBBQrlLVxmjNAdgxC14B2pub997Bc6EiWoMpS?=
 =?us-ascii?Q?eaSMeJzeGwECHHfffiMM92zWlTPtYo52C4mtB6gBGsJBWikq6a6OZ1myaF9z?=
 =?us-ascii?Q?f2pgttjzN9gcFYdpeb78+GI80i7sMkuMVmS/oibkBzSsDqUvQGMENGz7bWBl?=
 =?us-ascii?Q?OV8QKOJFrxrx0sErxI46ywhFfQV69/dn09ZapkMpcMonDxlXS7jKqAmrETmW?=
 =?us-ascii?Q?cIDD9mRgflIKCgM1ocBJCYksB/iM6M8cMoqGFshFWpESeTGg7IQ22vRniXqt?=
 =?us-ascii?Q?/azDmQb/zf8wCDooScoR3zwkgWAKdLMNTSQcTyPPb7zZ7Tu2F8eT57y1kVTv?=
 =?us-ascii?Q?JE7hV2JgyZwWoxa4uLQJVPxloVLzs6r6Hl/NjjrAW0DjGWEhqnVb0uZfmM1S?=
 =?us-ascii?Q?OiYmxgHuHrdjBRDD7VPbNZblBjxC+v7OsSig2iS7rxaCUTW/S2kBvsRyUAur?=
 =?us-ascii?Q?teWUs7WLsizXnR5bwZ5P4fLVh5zqMz0wGJLvU0ITuZVWRDlIx5CKM/md/hfp?=
 =?us-ascii?Q?3gSBIGGcdb6hSN7HhMXZlAsUq5DOD4MdDeZ/4x1uPO0wVvG78EKZd7tF5nM9?=
 =?us-ascii?Q?mC16MWQavup3zubQLzLzVixiJPCp4EQggj8C3FY5vtz07zjCt/Wh3kJDoy5P?=
 =?us-ascii?Q?NDSlWgTyxfkhRRrDVFVjlMog/s8pfGEFyRECCAZLTs+jntU6b4nUcxz21tKN?=
 =?us-ascii?Q?FcaZqY5VxEWXB4WqU3YZICujROEFnB7yN/tSTdK/9dFkRoNSwZ1GGXoIu0yj?=
 =?us-ascii?Q?XERObjiQdPj+na6d8i9h6h0efE0=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: BN3PR12MB9569.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90551028-c825-4225-6234-08debfc49462
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2026 10:00:15.7079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: REgU4WcHYupbjfqyL7P7ZvDLaqpHZh8CBeNKJqT7RSa/nOmYFf+KxrLA6tmLNBYr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5800
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63232-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bingbu.Cao@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email,amd.com:dkim,aka.ms:url,ideasonboard.com:email]
X-Rspamd-Queue-Id: 53CF061D761
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

AMD General

Hi Sakari,

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Monday, June 1, 2026 5:52 PM
> To: Cao, Bingbu <Bingbu.Cao@amd.com>
> Cc: linux-media@vger.kernel.org; laurent.pinchart@ideasonboard.com;
> mchehab@kernel.org; tfiga@google.com; ribalda@chromium.org
> Subject: Re: [PATCH v2] media: update contact email of Bingbu Cao
>
>
> Hi Bingbu,
>
> On Mon, Jun 01, 2026 at 09:03:37AM +0000, Cao, Bingbu wrote:
> > AMD General
> >
> > Hi, Sakari,
> >
> > > -----Original Message-----
> > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Sent: Monday, June 1, 2026 4:25 PM
> > > To: Cao, Bingbu <Bingbu.Cao@amd.com>
> > > Cc: linux-media@vger.kernel.org;
> laurent.pinchart@ideasonboard.com;
> > > mchehab@kernel.org; tfiga@google.com; ribalda@chromium.org
> > > Subject: Re: [PATCH v2] media: update contact email of Bingbu Cao
> > >
> > > [You don't often get email from sakari.ailus@linux.intel.com.
> Learn
> > > why this is important at
> > > https://aka.ms/LearnAboutSenderIdentification ]
> > >
> > > Caution: This message originated from an External Source. Use
> proper
> > > caution when opening attachments, clicking links, or responding.
> > >
> > >
> > > Hi Bingbu,
> > >
> > > Good to see you're staying in the Linux media circles! 8-)
> >
> > :)
> >
> > >
> > > On Mon, Jun 01, 2026 at 02:55:07PM +0800, Bingbu Cao wrote:
> > > > I left Intel and joined AMD, so update my email in the
> MAINTAINERS.
> > > >
> > > > For the Intel IPU3, IPU6 and IPU7 staging drivers, I am not able
> to
> > > > continue the code review from now, so remove me from the
> MAINTAINERS
> > > > and remove the invalid email in MODULE_AUTHOR.
> > > >
> > > > Signed-off-by: Bingbu Cao <bingbu.cao@amd.com>
> > >
> > > Dave posted a patch related to this:
> > > <URL:https://lore.kernel.org/linux-
> > > media/ahiSOvQ2zQuHDHWI@kekkonen.localdomain/T/#t>;
> > > I'm planning to post v2 based on the discussion and I can take
> this
> > > patch
> > > into account as well.
> >
> > Sorry, I miss this as I have not read the LKML for a while.
> > Please feel free to post v2 based on the change from Dave and me.
>
> Ack!
>
> >
> > >
> > > That patch however is just for MAINTAINERS and I think it'd be
> best
> > > kept
> > > that way. Can you post a patch to address this for the media tree?
> I
> > > think
> > > I'd keep the ipu7 (staging) and Documentation/ changes as separate
> > > patches,
> > > too. Tian Shu's e-mail isn't valid either, could you drop the
> address
> > > while
> > > at it?
> >
> > I can submit a patch for ipu7 and Documentation/ based on your v2 or
> you
> > can submit a separate patch.
>
> Could you post three: one for the Media tree, another for ipu7 and one
> for
> Documentation/?

OK, I will post them.

>
> >
> > >
> > > It looks like the ov9734 driver will be left without a maintainer,
> > > would
> > > you be interested in maintaining it? I'd also add myself as
> maintainer
> > > for
> > > the imx319 and the ov01a10 drivers.
> >
> > I would like to be reviewer for ov9734, could you take the
> maintainer?
>
> I don't have access to the sensor nor I know where it can be found. :-
> ( Any
> idea?

I think the Intel camera team on Chrome(in India now) could help you.


>
> --
> Regards,
>
> Sakari Ailus

