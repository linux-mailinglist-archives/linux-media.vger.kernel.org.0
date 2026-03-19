Return-Path: <linux-media+bounces-56267-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Cx1MtFTu2lMigIAu9opvQ
	(envelope-from <linux-media+bounces-56267-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 02:39:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA862C4930
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 02:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79E7930333A4
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 01:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0941317153;
	Thu, 19 Mar 2026 01:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Rks5kqJ8"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021101.outbound.protection.outlook.com [40.107.42.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFF3329E46;
	Thu, 19 Mar 2026 01:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773884352; cv=fail; b=PqQFCB6Wahvs88yH9+PdKfekSgVu+MKqKFCKpLA0/8Www6PO2CcNG0x1rFsSb2KW8iYR6t+KVBLlH9TYie3aK8y9g7pCDGc3tCR4q5h602q6u7GG49VREYp1SnTekEv/3IIhEJt+8owHawOZLzKotbeUKw+jGWaPtuFcrg9aCTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773884352; c=relaxed/simple;
	bh=nT988mQRJc7aVodT8SvfsjpfekUJYnrOV30eNQ55KWA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KevnxI7tg14UC3sArhMDZ26UIoA8P9eCyYovgKVGLDaVH2YKri+fF4oUakqoquSiS+/LXyrHmanql6RRnh73ebdMF0UM5a9jrrluG15dOdf8RPf9rkApibvR3cRxFqHPRZhNABJANY1caSRA0hhj8HttOYvg6XTMQCtc/WwPOkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Rks5kqJ8; arc=fail smtp.client-ip=40.107.42.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HAKTGv0VWPg1yacxkFnqD94WvPnhTtSgpA6Jnx56gCFwlc+OMN0zPPney1hTdqMFUj/deNkcr89aQRS9HY517F+q5UGShyxk65jCNohbGF+QpBxSkFDik9bEHvatX95dNfa/3d69GNrIeARXMUs6samqQlHC2u7ySNagdJEJtNpTRldZcKJfO3a6iAuIaqaLk3Yl+Qh+PR6fIoUXZrYqHGiUMt6W/hm4HrD0cx+igi/HTL9N5VLbfi9wMxXfK0Cks0d8GPz13DYkV4q12syIBLe9EEGm7bdtpXJz4M8/uQrfPsx/Gq0qFL1XeQMWM2gye5SjXmExsMKr9CjIJ2ufrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUnX6SpfFjLqKcp2hdIaKotU3oafPYqcFxDi3OpMTLU=;
 b=jBKjAX62IpUTVrEmLY2gihIbtoPrBBedRrFcjemmzwbhykUj7YfW8jVKFSRvAT1/HwelW6TVEX53TIwPCOpyNSNl8vBDdH5/MXgDzfrChCUWxJ7uuzGnWRrwbr4FrBbxYC64J7G7ptQQcgti1mlC/sgmmnxiVNvNffOaYEJByqZdn5krx5WOXGLnkzILXfFielIdHj7A26ZjaHMZEusQ1nDgvNLegvMnoSfXUP4ORkXTm0i7mbGooeAfsCbCPhfi5x+qDwLFRsHb+C7jbVyjRCNpMdcdk6ZAALtCw85FDHAZ+GCCax1IJin96FQ+68/sZ0R8Ip4fooB7bn5DEEGNbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUnX6SpfFjLqKcp2hdIaKotU3oafPYqcFxDi3OpMTLU=;
 b=Rks5kqJ8DqaG4K9Qc5GIedSVte98Dui3efdXKMLuZpxZfxuiirehpTwPpnSJz2BR310Na2TLd3DJGQgr0bBox2vVyxbM2qgto2frQoV8s+iddRIs/z2XIVQWkQIEpoDr6Wa4HbhusC0kEELmOxPEUYAw/+gWRBoYrs4cOWTkhaw=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 PUYP216MB2919.KORP216.PROD.OUTLOOK.COM (2603:1096:301:150::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Thu, 19 Mar 2026 01:38:56 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%3]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 01:38:56 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Brandon Brnich <b-brnich@ti.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "detheridge@ti.com" <detheridge@ti.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>
Subject: RE: [PATCH] media: chips-media: wave5: Move src_buf Removal to
 finish_encode
Thread-Topic: [PATCH] media: chips-media: wave5: Move src_buf Removal to
 finish_encode
Thread-Index: AQHcswonZRLsbUSBmEOzFHrYtALDM7W1G7Ng
Date: Thu, 19 Mar 2026 01:38:56 +0000
Message-ID:
 <SLXP216MB11480A02F769C94303AEB256ED4FA@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20260313165446.4139543-1-b-brnich@ti.com>
In-Reply-To: <20260313165446.4139543-1-b-brnich@ti.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|PUYP216MB2919:EE_
x-ms-office365-filtering-correlation-id: b3188416-fb80-4cfb-6ba7-08de85584928
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 I7lFuYYYP3A9Xo+OdIa/n+QJjbj5pq3Rva36z1TP/gTIhzAFaCngQfjdayuYeuzCoHcie9cYyA12O5Bq1UdiyyioLzY9+ylESMOTncHJ7uGt4iPke5f99m4eZ31F2VBp/qQD+KaBFXFWOfoTcA3EMgaw2m1Yc47jEnLEVQa/f8Z4L/GyMMq/3l8ol446o9B8DDrtQt8r5Ie4nZhxx2n35TKGaHzCqA06UXKjN0kWnVCiK9Zx8WU7NUBNZuNG3EJisi7Z6qlDQ7rEXRCx9C/hMH5W0T9QWkIT6Fow1Bs+IScHz0ooHGJ/GUVXzMSIc1rKj+7utcT18oPSV7LFMDCHIlErcsYQkr/PuefHANltDXjoZClWBbTjF0JVCdXD5oGaARPN5d3/uwfrHHq9jhHvzZ3EttB73FJuZAGNoIt5jq/CTawaHv8Ci0wt8hDLYFemWMDCllGcP0/dv9mm61iJ8/v8eO/mbDDUcDNeGtlMzMrPeVXdUiHxdkjSrTSvwGfiyKmDKdaRxcdisXFIhOjnQocP2Pea29pM1Dr3uAXhiDv9sE3Fib3wis+tagjKCTzWizcIN3VXol5HmiACGN7ZoXX3uqN9yzla48Yzz2cQKYlm5l0b3lmpYIY5lfkaQH1WHCfTuncaZq4UmSutvtUQ/B+zJo5d9jrKBFZhL80AscJkJtaM7vNZO0htRCpGR2sTZwiNBgz4PrbiCtw5Doa+bEbsJvy/mxkx96+edGShohUuuJeYAvsqnvmxEmVnNqCCbDJY1HOslZWUcrV2ob4PJqXV5nRPZkciOPOevqSqUFQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?flF3TGXfqbEsEoLGjTRxSdhufH560+bdGtCOjKWNacY7/hRtEfXkqFr32hDW?=
 =?us-ascii?Q?OStmxbKs3wlzHspb3ibP9yEijd3VPVBq7bgOaiF+tQT9Jp1Ra3xZpnz4J98r?=
 =?us-ascii?Q?1FQIz6FFKRGtmFhdbq+bjP8FtIPbrjGNUxRUJxT8OuzlCRqfr9ZLG0fKn1rS?=
 =?us-ascii?Q?2CJgEYSAaYebZJX0vsgET8+2QZN487O4RMzrvaIso+EAt5px57Z7h50t3BIa?=
 =?us-ascii?Q?8HQz/C5zmKbwTbdPgqEqFPGSeKazfB8mn8qU/1jOCWPV9l8vHLdFvClg7NAq?=
 =?us-ascii?Q?KjYecO/jTRQzwkk9w2rmP6k1XaulI5zJARWHIL1QIfxNOgboMw9uEcZZ6w/J?=
 =?us-ascii?Q?8bgQsaIkjtqiBcqTPFu2SyfIxBfOpC3+7qD2ed17epaAzja8YeozqLd1oEQP?=
 =?us-ascii?Q?syqoe8u2oQLWHAN4H4a5a5cosI4PiJPoOl/IAahdb2KxZuhA2LvC3o3O5gxO?=
 =?us-ascii?Q?Ayxlt1pMMZ4LXat2jmq/PYB7dVUK/DPpddMiIAQCc0M6TDumJlOaHLK7cHA2?=
 =?us-ascii?Q?vY43nKEk9fatu9ZAhKy7n02WFV8mZIN6dnwWcHmM0XcEnZ7oJ512StKe1unH?=
 =?us-ascii?Q?R9R1xVySWqBf8ObSEgaR8Ei0773PWyJSekARKlDKXa5p3+Kore5JDKm9zzUu?=
 =?us-ascii?Q?TYLLW3j+DPztyyCZ+eNkXNw7SpyD+lIjBhcPjOrLKTrln/9mDn1tVUFoerVF?=
 =?us-ascii?Q?F7wts/Ksl/yqoqIE67OcLQ2NKa1HxEcP3xQhqbLYscg7K+5MgRhUBb1/OLqL?=
 =?us-ascii?Q?yQ3NDEe6H0q2ZAiPPc9wpNwrCWr7pAiSpw0E7AvPwBTgxPEc14HgbSy+0tQj?=
 =?us-ascii?Q?xbzR3PsJbMcfUa0ZP197mg1dUkSVODDTz0xW2gzdqpvLlP58r4awKEI+inuN?=
 =?us-ascii?Q?77ZdTQN+bJsht0gfucSDUEHp9R8Hi85GW4K20LpKZ363ckE8u7O4sHhrPoxt?=
 =?us-ascii?Q?f0JhRrnQCcnjrbsf5G0Ph3FE+K3KmKXHlHtZf4Ttg/tTC2gWPQmZzocUsl0g?=
 =?us-ascii?Q?qWCTsnZ8p2h3wp2IVWnM0VDFcPePSUFH4jGNl1T2rHB59nv7Dk6UPXaedqCk?=
 =?us-ascii?Q?E9R/7yP0uBCICS+9+4ytKA1NXVIK10EjgP2NidE6E9pvOcP6cJzUqMDzGqFl?=
 =?us-ascii?Q?jaZ/HItOJWZp4V49pHbGWIpIQY2RyUlzzuO/Da3bn3i4xbOUwxgeiEGxf9sy?=
 =?us-ascii?Q?l2lkGKx82HUwfdZfjOs6IxHIYzPe1vXasArm2XBGgvEGMod6Y6FeeTAVWFIm?=
 =?us-ascii?Q?buIErTJ2fvzL8tRfvybKtT/i/Ks1arDf8871Dbb1vv+I9m5zlCKAMyyX3IgT?=
 =?us-ascii?Q?puMtVxbr12AxjDkPYVQJuB0fwqNN+xxkGZIZzLmA9CBVpzW7Uy1U1YR5/hvS?=
 =?us-ascii?Q?TveQ5Vz5Vwqi7wbSoAqaMIPvD/8CGMxUNkS+9AbV2cjwDVi0F4iv4GrEPKBN?=
 =?us-ascii?Q?jh9tMPwjWPxuBO3Uo4vnzdNWu3hHi4/NVww16krFBb/jfUdJHA2j0VKu0s8u?=
 =?us-ascii?Q?Oj/g7JGPC7CFzBynb1ftfTy0XrAschX+h0nonfMDECv5P7iMZ/pXDceO/40x?=
 =?us-ascii?Q?sPRGO9eR0dVmGehaGuH69JDxc3n7fjjg9mC/qy4DzHq0svIAFAe4hOsRGnBi?=
 =?us-ascii?Q?MiyNRywxe8qRLIbvoWIvN4nI9+9WM06WsQU+uVosfYWhKvQeFimcYc5qPqne?=
 =?us-ascii?Q?1k71BIKNYJ2/pFpEGL5lKwD1oeRrELJ59YP1dFXjBwndhmN0ay41zQCx0Us0?=
 =?us-ascii?Q?/hSEGERymw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b3188416-fb80-4cfb-6ba7-08de85584928
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 01:38:56.3529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0LIC2LQRoFW5qtxNsC0xSDPBGmn/uSthYdPT6AjiCaWf4GZ4IxvNess9lWLcMDG6xYrYHc5SAgCc5ugWBDqJ+lKHles3OhqHtiX+hDxlz3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB2919
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56267-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4DA862C4930
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Brandon


> -----Original Message-----
> From: Brandon Brnich <b-brnich@ti.com>
> Sent: Saturday, March 14, 2026 1:55 AM
> To: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: detheridge@ti.com; mchehab@kernel.org; Nas Chung
> <nas.chung@chipsnmedia.com>; jackson.lee <jackson.lee@chipsnmedia.com>;
> nicolas.dufresne@collabora.com; Brandon Brnich <b-brnich@ti.com>
> Subject: [PATCH] media: chips-media: wave5: Move src_buf Removal to
> finish_encode
>=20
> During encoder processing, there is a case where the IRQ response could
> return the buffer back to userspace via v4l2_m2m_buf_done call. In this
> time, userspace could queue up this same buffer before start_encode
> removes the index from the ready queue. This would then lead to a case
> where the buffer in the ready queue could be a self loop due to the
> WRITE_ONCE(prev->next, new) call in __list_add.
>=20
> When __list_del is finally called, the loop is already made so nothing
> points back to ready queue list head and pointers are poisoned.
>=20
> A buffer should not be marked as DONE before the buffer is removed from
> m2m ready queue. Move removal entirely to finish_encode.
>=20
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---
>=20
> This bug is very hard to reproduce in simple encode environments. It
> primarily occurs during long run cases where CPU is strained doing other
> forms of computation. Crash log shared below.
>=20
> I see other drivers removing buffer in their device_run process, but they
> do it before any chance of DONE state transition. I can move this removal
> to there as well if that is the correct location, but I can't find
> anywhere saying this is required.
>=20
> Kernel tested on: 7.0.0-rc3-00167-g66dbdc5b5d2d Gstreamer version: 1.26.9
>=20
> [ 609.879961] pc : v4l2_m2m_buf_remove_by_idx+0x84/0xe8 [v4l2_mem2mem]
> [ 609.886313] lr : v4l2_m2m_buf_remove_by_idx+0x28/0xe8 [v4l2_mem2mem]
> [ 609.892663] sp : ffff800081a4bbd0 [ 609.895968] x29: ffff800081a4bbd0
> x28: 0000000000000000 x27: 000000000007f800 [ 609.903096] x26:
> 00000000aefd2800 x25: 0000000000000780 x24: ffff0000014efdc8 [ 609.910224=
]
> x23: ffff0000014efc28 x22: ffff0000014efc00 x21: ffff0000014eff60
> [ 609.917351] x20: ffff0000014efdc8 x19: ffff000001daf800 x18:
> 0000000000000000 [ 609.924478] x17: 0000000000000000 x16: 000000000000000=
0
> x15: 0000000000000002 [ 609.931605] x14: 0000000000000800 x13:
> 00000000000001e6 x12: 0000000000000000 [ 609.938732] x11: 000000000000000=
0
> x10: 00000000000009d0 x9 : ffff800081a4bcc0 [ 609.945859] x8 :
> ffff800081a4bc88 x7 : 0000000000000000 x6 : ffff0000014eff50 [ 609.952986=
]
> x5 : dead000000000100 x4 : dead000000000100 x3 : dead000000000122
> [ 609.960113] x2 : 0000000000000100 x1 : 0000000000000000 x0 :
> ffff000001dafc00 [ 609.967242] Call trace:
> [ 609.969678] v4l2_m2m_buf_remove_by_idx+0x84/0xe8 [v4l2_mem2mem]
> [ 609.975685] start_encode+0x28c/0x554 [wave5] [ 609.980063]
> wave5_vpu_enc_device_run+0x10c/0x230 [wave5] [ 609.985466]
> v4l2_m2m_try_run+0x84/0x140 [v4l2_mem2mem] [ 609.990692]
> v4l2_m2m_device_run_work+0x14/0x20 [v4l2_mem2mem] [ 609.996522]
> process_one_work+0x148/0x28c [ 610.000532] worker_thread+0x2d0/0x3d8
> [ 610.004277] kthread+0x110/0x114 [ 610.007500] ret_from_fork+0x10/0x20
>=20
>  .../chips-media/wave5/wave5-vpu-enc.c         | 32 +++----------------
>  1 file changed, 5 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index 7613fcdbafed..3e198a7cefb1 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -223,17 +223,9 @@ static int start_encode(struct vpu_instance *inst,
> u32 *fail_res)
>  		dst_buf->vb2_buf.timestamp =3D src_buf->vb2_buf.timestamp;
>  		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
>  		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
> -	} else {
> +	} else

The else without braces violates kernel coding style when the if branch use=
s braces:

>  		dev_dbg(inst->dev->dev, "%s: wave5_vpu_enc_start_one_frame
> success\n",
>  			__func__);
> -		/*
> -		 * Remove the source buffer from the ready-queue now and
> finish
> -		 * it in the videobuf2 framework once the index is returned
> by the
> -		 * firmware in finish_encode
> -		 */
> -		if (src_buf)
> -			v4l2_m2m_src_buf_remove_by_idx(m2m_ctx, src_buf-
> >vb2_buf.index);
> -	}
>=20
>  	return 0;
>  }
> @@ -259,27 +251,13 @@ static void wave5_vpu_enc_finish_encode(struct
> vpu_instance *inst)
>  		__func__,  enc_output_info.pic_type,
> enc_output_info.recon_frame_index,
>  		enc_output_info.enc_src_idx, enc_output_info.enc_pic_byte,
> enc_output_info.pts);
>=20
> -	/*
> -	 * The source buffer will not be found in the ready-queue as it has
> been
> -	 * dropped after sending of the encode firmware command, locate it
> in
> -	 * the videobuf2 queue directly
> -	 */
>  	if (enc_output_info.enc_src_idx >=3D 0) {
> -		struct vb2_buffer *vb =3D
> vb2_get_buffer(v4l2_m2m_get_src_vq(m2m_ctx),
> -						       enc_output_info.enc_src_idx);
> -		if (vb->state !=3D VB2_BUF_STATE_ACTIVE)
> -			dev_warn(inst->dev->dev,
> -				 "%s: encoded buffer (%d) was not in ready
> queue %i.",
> -				 __func__, enc_output_info.enc_src_idx, vb-
> >state);
> -		else
> -			src_buf =3D to_vb2_v4l2_buffer(vb);
> -
> -		if (src_buf) {
> +		src_buf =3D v4l2_m2m_src_buf_remove(m2m_ctx);


v4l2_m2m_src_buf_remove() is too weak

The new finish_encode uses v4l2_m2m_src_buf_remove() which blindly removes =
the head of the ready queue.
It ignores enc_output_info.enc_src_idx entirely.
This works under the assumption that the m2m framework is strictly FIFO (wh=
ich it is for single-job-at-a-time), but a safer approach would be:

src_buf =3D v4l2_m2m_src_buf_remove_by_idx(m2m_ctx, enc_output_info.enc_src=
_idx);


thanks
Jackson

> +		if (!src_buf)
> +			dev_warn(inst->dev->dev, "%s: no source buffer
> found\n", __func__);
> +		else {
>  			inst->timestamp =3D src_buf->vb2_buf.timestamp;
>  			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
> -		} else {
> -			dev_warn(inst->dev->dev, "%s: no source buffer with
> index: %d found\n",
> -				 __func__, enc_output_info.enc_src_idx);
>  		}
>  	}
>=20
> --
> 2.43.0


