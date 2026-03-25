Return-Path: <linux-media+bounces-56951-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHzJAqiPw2mCrgQAu9opvQ
	(envelope-from <linux-media+bounces-56951-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 08:32:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE18320BCF
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 08:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D9F56303EFA9
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 07:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB34358360;
	Wed, 25 Mar 2026 07:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="iATCXDs8"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021077.outbound.protection.outlook.com [40.107.42.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0924B25CC40;
	Wed, 25 Mar 2026 07:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774423969; cv=fail; b=CfNyLa1o9I22mtVIA4OrM7bUNGMVXs7IKObbw3AVCvOGLIGfhjnOCcUAr09qUJ/IxBPY8cnp48DRWcAZwfYqho1iUGel3AcdcPryv3Y0omHNMJsw/O+uTVt1uZhEVVDrAP+yrrc677q2IAKjVpV9WFNjP2y7gyOsG7+UVMIed9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774423969; c=relaxed/simple;
	bh=hCZ/3Zk8LNpYmEG4HOxvUMTfkGfUv/CPhy4jbjZgssE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JRcG8k05dTO14qO2T7h7HabvZONbWBo5IOiif7rePWdKdLs0ZS4nUdlp1xM9FZsXL7N1ww//YJ3yp6iTbGIKlMb/bvJVC7iru+cyxH7QS5K+Kh1oFut4vEo6QijYvJvyAApj3m1/Z0JiR8WO6qb9wUVTxV94+Gs5A/9C5aSFbbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=iATCXDs8; arc=fail smtp.client-ip=40.107.42.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPQGTcAAaZvwm41/V/rmL5FBmEpRI8Eg0BOw8qPvgR3YhKb5i1KiDWb9BI757haha+sy4f0atAeejtAKHEM+GsMOonbgfZPJ1EYNFO4gqo9XChWPMKTzMbQmXiFvIgky4hVcWYc9ufsnfXQM6yz47TiWejllpK+eSuK4BvUPnwXh4rJYYGDDtoG26crGVXSDirq+J/2T9KFVhLY+v8BMZcVlLlbZjv/XXZCTZwTJmsu4eavKKrI5k3SroZLRe4DAcSXd3pWm+V2e61OMTJt7l1nxmoLToqT1MSsEnjsVSYjvvyp9XqMtL8sxDc7M+c1t4pBbWKJNy4CJ3qgWH0NPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHJpeNTCuWgEG5TxfwWdJDhYbcjLdH6NzLQxcKmvRxI=;
 b=XQDR9PPw8x/2JQN7GJ8CaApxeOscri3uli1tlYytuPcAWufKr4D+SzprP2UTCv5x4cXyfrlkHvVRu8xxu7hHZky9g2KA93DCOurNFL+KmIIrPRIQKNPNPzXvojOs5LJPCm9IbDZsEQesXDAfJytbjWU0O7be2arwzMDwiTZ5zqhwLNV33ostf68M8M8ojx6muqbu0TNlC7N7F9uaO0ckXb0ZcRa0+07c/8h+iFbzI3B+oCpx2+rGJbijraEWYw+rtXT566Wc9u5p8/4Jr0YpBeYjXmWX1eI2jLc6FurHPcn/YxCM7Usah2pdqPtC69TeRzJq3bbqHt0jGa8ph17SUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHJpeNTCuWgEG5TxfwWdJDhYbcjLdH6NzLQxcKmvRxI=;
 b=iATCXDs8wX8PkPuy7UebeFe/fsVLZBKVsRtKrffdDAteLqBkW3OALrWD5RLvkjXWbgpMBG6YjsU1dyl3hePR8KVRQRPFclSvhw/IrYK6BXRMkf7IpKjIYn4aEx2gRijIVNBzqs7LRQaZ8DADn3+KDeBu1xviXC760nF893SVKqg=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE5P216MB3377.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fd::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.31; Wed, 25 Mar 2026 07:32:43 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%3]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 07:32:43 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Brandon Brnich <b-brnich@ti.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>
Subject: RE: [PATCH v2] media: chips-media: wave5: Move src_buf Removal to
 finish_encode
Thread-Topic: [PATCH v2] media: chips-media: wave5: Move src_buf Removal to
 finish_encode
Thread-Index: AQHcuJQte7c0n6cD6UWv57sioW4ZpLW+4ZpA
Date: Wed, 25 Mar 2026 07:32:43 +0000
Message-ID:
 <SLXP216MB1148FADFCA566AD0746656DFED49A@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20260320180526.351956-1-b-brnich@ti.com>
In-Reply-To: <20260320180526.351956-1-b-brnich@ti.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|SE5P216MB3377:EE_
x-ms-office365-filtering-correlation-id: 8562c26f-0296-40bf-cf1b-08de8a40b3c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|7053199007|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 MrBmnkkGzcITF0uHKAeCR2iThOFGRdMAPKCZFc8Q4MC3QEpj9vZGRhmAxDvKuuHPCroC98vuXlety/CSvOVIc4GhdRIGdzh6jhbfYXKz/XG6jHQ18IMpfz6nZA00y/tHYQKXhLsuaUjHsnXUT1HNOUS0dZ5SdH1xjWMM8m87Kei/Qsw0KqyoWfbeUWGm6f9xYhXnObBaqxS2Jh2yBKegL1NrTsvkF0DIF2tP0dh3bR9o+sRBJmllFIazOity+9do7stgRCrQfPRBDNdik2/4l6naDIWkZko6l5Qj6OQB/DwcT7ScsKAoq9o5N/JzLK9M1LJYfRLMVavkCmi0625jQE1w6fOEb1zQaM0+Ei+WppPdD5liJdOcjRdpmEGqydKMtWf5Ej4d+ZvnpIv7YO1mPLqsa7A2KOwyZU/xAPHEEqeFlLCUeElH20q3xttfwki1K9f6ioxp6jzi4rGfXuItaGjn75YO7Vim07Xj3ubvBQofGhlksLQf7bpAQkQF6a8KQ+A7zhUR64BjPYtcIjDm7xVPKXQ2hD6FaUla6RQt1Lgp2cgbC5iAAEv196MZukrgm/5xHfJa+EWJtpmlxeYynkwFrYXekuASIGPT50T7i6KNnTP/gOnL6QqVMPR7hX5+62B2VA8ooVPKmCUCX5Rr2X2opxZ3QxYeFfD3UMmF+ZY4N+3S8MbXXSj2noXLUD0IdJYa6sWPwdvUC5PW76qYVhCDQGcAt+STrAi27aSzh2UBifAsuEF09GNTfi3jP+ycf5XwbmDG94fhL3ZfqYH+RcGWtfDSS92fFwcDOLIfSD4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ASeTO2GLWrluqMySZw8uVqU7NrkPNOJ0+5moenjkse3zdYxqFoL9vZFY0Dco?=
 =?us-ascii?Q?7o8dJjkNkghzM9Fn/DFlA9zZdWZzxramrp5sQuv4KDT9FsUccmXKvamNU+td?=
 =?us-ascii?Q?PZAlQEQWS1v47gGLF6Mue5XD/qTZaieBKTPbjQUbzxMsyZsElyjEkpBbQDje?=
 =?us-ascii?Q?7UUnSyJpMcEYpq+bHdZEWC8sgtH/fTfRw+w8A1BhUj3x50i7bVl40S35xUpA?=
 =?us-ascii?Q?GSDbBlSha17PlZX1qxUKV5vUvy62Hxup4zpThNwjq8afZYXNMPLDkuLDDq4O?=
 =?us-ascii?Q?LJRNvLAqGBqMDMDDSBgtJ/kdb9V6rGamy98TV1dxeWFIRcHJIEDIr3u6A9F4?=
 =?us-ascii?Q?LDKP6ofKav7nV9k6cRbiKUl2D/Dii+sz5OToV6I7unA9DFdWPZiVgSUUd5Cz?=
 =?us-ascii?Q?39PSMNCJrjWlc+Vfw8wGsZ0BGFl3bdHGwo6kRj5ZQnv8tZ6cmfk2X2LbdDSM?=
 =?us-ascii?Q?XfQdVVYCn5roC0wx9fcT4HJDQuAhKTz5eXBXbpVKX8xMgJZuxvI5HU1djctK?=
 =?us-ascii?Q?9qm9gP0e3m0xYpznuKOkM7kiNndFAbTquAqQ2OBNi35g9QEFdHNWBtUwGTrV?=
 =?us-ascii?Q?j6aJf9EPeYSl2mR120pZ3IZ4t8VSfLCRFkzVWNhGsN2lAIfgU2RtUCt/i5UV?=
 =?us-ascii?Q?aoTqJ1cmWAokr6K5+H19EKdUrmondjaDcRJTiomuaXAijorTvsItDM2dbEbW?=
 =?us-ascii?Q?HxocrbyGBK/JJQVTi+omyiGgR0L+ikXNwz7KzTR8TVeS1HpOq9kIxMlVWgJq?=
 =?us-ascii?Q?uw1a3bQ4wEpoK0N2FDkmLO5wktGpVKcA9uvBU//XCK1ZQAqdd7OF0BiJuFbP?=
 =?us-ascii?Q?jzeY4v0R9joNAMF2NLA1tcsZkJPf/ca3J7u3PByh01DMUjzbBBHrSEvigOoj?=
 =?us-ascii?Q?L2PJbn0Rww52hfIKos6xxYnDnCx1u5icu+6O8FIZCHQZA0EzYvT5O//9lv8t?=
 =?us-ascii?Q?iGLSFyQOmSuROeeDEoIjTqPPB19TDOGfqbvFtVII+krkXgTfyXaAtd0wUHFq?=
 =?us-ascii?Q?B7l1azuqGBNYAs6RioL0IUF0emDLSPbBlqsrxHoZrMP5t3B/O7l3qUbz2CYK?=
 =?us-ascii?Q?+xvIFpcCyDu7fk1nShrEgOencUwAMt4Q8FmVUjwMohJH44AWtZg73SzzcqiJ?=
 =?us-ascii?Q?fnvqZNA35nUkoeVGTAsT9+HQva9LsCSMQmiSQyVxMUjnf9I/B6aZp/IF1ZU4?=
 =?us-ascii?Q?wnfRCEGBbnEVnpDnRdL1ftH4wAZobAsPBrFyHdYVda54eMr754wL+g42jP2y?=
 =?us-ascii?Q?mTiukqF9WHCWJpCruwVmGKsyoHcBZNRxjnHNDWmSi7/ukqL4sbq8BC6gtLDy?=
 =?us-ascii?Q?8mlnT5lV7KLTdrxDj3KNZK33JBPsgxCfFfNpLvZgwAFDZxoM2cMcvHwe7PVH?=
 =?us-ascii?Q?o8UCgRDpT64XH0BNFfuV+WxiNtrs8WZYwZoKcrkmuH/PpnGrzEryQ9lFrPpQ?=
 =?us-ascii?Q?rtLMgHyB62+JuCoIosvo6cvTQg1Fu4n67YDsZ+8MoDn20bDLJDkiWxMjyjai?=
 =?us-ascii?Q?8SV9ncWU39qqDXt+Y1r4pIRY8DG75wKyF5Dqyn/sc1j93eOsoUvDhbeY3whC?=
 =?us-ascii?Q?bwyvWItLali0ExvXOwtsBkeDPg3g86PK+wkz5YCuBvw43VGcWHlcB6z/acDD?=
 =?us-ascii?Q?luIBgLOevyfoFQbsQUEz6CvX3T/Q+qbvVokRgmtl8w469b2dw5eoSxDXWIOT?=
 =?us-ascii?Q?/cg7fmiunV0e2aMcHgNavpLhPe8G/oMqdeJMPQkthbjnS4sAqMmEkf0El+k3?=
 =?us-ascii?Q?Yrr7C0oT5g=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8562c26f-0296-40bf-cf1b-08de8a40b3c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 07:32:43.1319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5MkzDDRz8izWeBUfCWfp7JSZDDusc6mz1xIAek6wt3xy8K3siDkf9jK3S21yfCuNCQ3QmUuSLFcdI3a1/T5uRNQQFqhqe9mHNn8Kjvr7bqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3377
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56951-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,collabora.com:email,ti.com:email,SLXP216MB1148.KORP216.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: BFE18320BCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Brandon


> -----Original Message-----
> From: Brandon Brnich <b-brnich@ti.com>
> Sent: Saturday, March 21, 2026 3:05 AM
> To: linux-kernel@vger.kernel.org; linux-media@vger.kernel.org; jackson.le=
e
> <jackson.lee@chipsnmedia.com>; Nas Chung <nas.chung@chipsnmedia.com>
> Cc: mchehab@kernel.org; nicolas.dufresne@collabora.com; b-brnich@ti.com
> Subject: [PATCH v2] media: chips-media: wave5: Move src_buf Removal to
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

Tested-by: Jackson Lee <jackson.lee@chipsnmedia.com>

Thanks
Jackson
> ---
>=20
> V2:
>  - Update function to use reported index from encoder
>  - Fix reported media CI bot style errors with brackets
>=20
>  .../chips-media/wave5/wave5-vpu-enc.c         | 29 +++----------------
>  1 file changed, 4 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index 7613fcdbafed..c605a91718d8 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -226,13 +226,6 @@ static int start_encode(struct vpu_instance *inst,
> u32 *fail_res)
>  	} else {
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
>  	}
>=20
>  	return 0;
> @@ -259,27 +252,13 @@ static void wave5_vpu_enc_finish_encode(struct
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
> +		src_buf =3D v4l2_m2m_src_buf_remove_by_idx(m2m_ctx,
> enc_output_info.enc_src_idx);
> +		if (!src_buf) {
> +			dev_warn(inst->dev->dev, "%s: no source buffer
> found\n", __func__);
> +		} else {
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


