Return-Path: <linux-media+bounces-59186-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JKRH7/W5mkz1QEAu9opvQ
	(envelope-from <linux-media+bounces-59186-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 03:45:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DECB043552E
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 03:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C56230156E8
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 01:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB8D267B05;
	Tue, 21 Apr 2026 01:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Jwg7Jlp8"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020091.outbound.protection.outlook.com [52.101.156.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3CD1EB9F2;
	Tue, 21 Apr 2026 01:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776735922; cv=fail; b=B+Qzbfb23PdcVvETa3VisIRBjd9NM04RWKopCzRiRDPLzPUB2s75l2gYmyNBFYj576X7Wd2VzwvIgacUa0wcfJBqYOjI0UOBC3naQ4lC7ZJ3oED/gZ8v19EJBvfjHwat+AM/9AGh1EH+GezuYitR2Fr/Ke9CfdNPEkUpp8Kt6gE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776735922; c=relaxed/simple;
	bh=SuNEF+ospmmTjbvX787zXUaCFtcsOupzABfIqQ9QvOE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y/2G1DCtSm5Vb48yZPaVu9Q4gyq8yjafmNaF8mzrHvvq+YC0fo5agaJ6rwkWPOCJmxu5XLsik5sOHEXNDNNPuzYqKfOV331ij6rxuP94nCVkjr/cwNQGb9Xz0Bv7wigR/elNOJ64e5riy5nxmiGAdmIW5MnBXiKsNia2MACKzXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Jwg7Jlp8; arc=fail smtp.client-ip=52.101.156.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYErxTpjSXuiV01oRkx71PC9BpKrf+7pLdoJDs6soJNQ9snX6HALixgaGhtvjG3yWOhzqthbxIH2ZN6nP8TdyADmS7uj0P7NLmBKXQoVlfCK8Y2VCJq8nDDHR3JIRQLzIJ2qTmYoiW239Bm3DklUEmqo3l9xIInjHqqUwpn3jjfeyP90LnFBAOgQw4DZTst+WAu0mazbb/nCdoihvFiC0clTAffUBTVXjqimUkkjSJJfVuOyZDc/NXanJYqqpns8oiD4V42doinpOHAbP5weYq5cGV1OB9z0QseY4tDkhqJKkLNyszUtAwlpRQFl/N4Ex+cDis2zErdeL1XU8ALjBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuNEF+ospmmTjbvX787zXUaCFtcsOupzABfIqQ9QvOE=;
 b=GH1JyyAdeJ1cyhSywFVqv3DYVxrQMsfEw0k1SrQvOP0kwLKyfO0D1QI3bD5t3G7ofz9JawzGLUpSu1kHW3RBUtLksUbitZMZgcY/Aad9HLF9j5Y/6nUjC4rAoSWw6tjsUlsnUaNR4NHJZ2YY83prVx++/GDKan3bwxb1Tmt5D/Dhc8G+VoJCVw45CuKRkXLA8x4SZb2CCF6ZNPWvo8cXNvUtxx3RKX+5Q57JiciNXJ4ju+YEI96an+HFlKuzHCy/iqCKN6gEY2LCpKf6Q59WnL5uxugFImmYM+IoMUc44F30xwhQH7e1uXtX8aMVWyGD0j4uQyop5Fhnj7o0y6xh7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SuNEF+ospmmTjbvX787zXUaCFtcsOupzABfIqQ9QvOE=;
 b=Jwg7Jlp8SKb0UAlK/K6EwP7lVfTzxnUpPjv6bjytwW84m5fVgRn/1sfQASKZa/RHVYctGJSTRZTLGhc88L9cdxLxrtxZ6Xdh2HGZ0S+WZwiSnwe+twp7GuXXloMcAZ9dp765btnJzLyitmFHJ6n0SRgHqa5Ic/gn2zKeDn0Yu+E=
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by PU4P216MB2188.KORP216.PROD.OUTLOOK.COM (2603:1096:301:128::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 01:45:14 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%5]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 01:45:14 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "marek.vasut@mailbox.org"
	<marek.vasut@mailbox.org>, "ming.qian@oss.nxp.com" <ming.qian@oss.nxp.com>
Subject: RE: [RFC PATCH v5 1/9] media: v4l2-common: Add YUV24 format info
Thread-Topic: [RFC PATCH v5 1/9] media: v4l2-common: Add YUV24 format info
Thread-Index: AQHczLnV9OhufMXTZEaLMFFL9JAUqrXoHmoAgACnhpA=
Date: Tue, 21 Apr 2026 01:45:14 +0000
Message-ID:
 <SL2P216MB24411C41BB69928E3B7DCB5DFB2C2@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <20260415092529.577-1-nas.chung@chipsnmedia.com>
	 <20260415092529.577-2-nas.chung@chipsnmedia.com>
 <90e206fad7bef6052fcf38314889e7ff525d3201.camel@collabora.com>
In-Reply-To: <90e206fad7bef6052fcf38314889e7ff525d3201.camel@collabora.com>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|PU4P216MB2188:EE_
x-ms-office365-filtering-correlation-id: 65b52328-ca8b-43e7-f953-08de9f47a230
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 4epviXiUlUqZNj+Hr656sk9IYuctd/TanKjRQYzdiegspGlBx4Or+YyrA80PoutF0qnp61weIzWIa+cTImjEqUP62P7Nhn0rAhNo6n4rFIdo6jMMSIfn12+SWRLtH5QdpfYGHWZk5Xyk9kEayGkaJw7HNfTtfqemJfjda6M0Mo5i3l853UHtwd/4Dd6P+w/fJcgIuJ018BNbbakNhXqhccWjmFFagWRAXAHSQ10PI/l5yuxMozYYwoinCyxxr8SWyri3q+1TF8YoxuxUiWo5wuNQlU9LPMePmIUy58qXFEU+rf0xjCKQNNSBcVy6cbddsvNSz5umZxhsiWSp/0g7KfOaY934MwgZNYoFUb0+/HCnhn4GTPgX+pIV3ab30c+qZr3JT34FxWb3O2FU+L5pGFHTZmXIhXdO/oXA9KWgHLaOcYHimEl0RdhQqjrmB2hYA29igfAYVFtxODagHQoDIztWWWuQssPQj1rwHJQHrQYw+UcQhEmVItgIDdHFQDGAfeU5NYWNI1fIHr2Cmei6G3wSJZPkmoPPC+6osAe+yyjHtTwIvkvjjAlnNY6I3ZXXADp4s2UKVq1RdeOss6d8jpGAksaBJ3MfMfN7oizXxRRI4Up6kOSq/dt7O+rdPF8Y+JgLmBb7bdKb5cLOYsN2mqJrU4XTriOxyqtkLbHuxekshdl7nNmEvvG6vF0GTF/eBPVcuC04dKYdpnHoqWAaPIG+QxL/r9coXISD+8xm1U1XwIEdE6ihsIJiRsPGOpap+PgRoEUSbjZRAgYvn5D3ve0fpfXaVHeG38oBRv5PHM0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Zm1WYVgzQ3BCcmhKOWhXeTFRQnFBU2R4M3ovc082UmlHZVlybGo3UTRCUitI?=
 =?utf-8?B?SmhCK05NUzF6ZHhLTmRpMkU0QXFRdHZ0alFWUFJGK25Hd2tPSFpaMVZCL3pt?=
 =?utf-8?B?bjJ5b3MvK0l6bUwzbDZoYWR3MVBxenVnamhpSkFCam5idk9DRHlyMHdsUnZt?=
 =?utf-8?B?aW9peXRTWlRraUxWclBXN1VuN3VtYjVEd1NodnFvNWV5T2JSdGJvVjI2Rk9K?=
 =?utf-8?B?SXFKVDlvQ0phMlVwNzlXR2ZuMXpnTmJLUDlqR3dBcEhSZU5lMVdmNFJwbjlW?=
 =?utf-8?B?MG1lNDQvL25ad0I1Ti9zRlFKODUrWlBpS1RzcXF1MVNKWitCMTYrWldncFJR?=
 =?utf-8?B?SExvbVlCQnZ2VU1oNkJDZFVHUUxtRUhPc0cxbnVwdVdyYmpSSm1kZVVnOFJR?=
 =?utf-8?B?QVkvRnVtc1htUE44U0lXSmlMYjIyRHFoa1F5dDJZVnU0TjdDc0N4NTQ1a2Ja?=
 =?utf-8?B?RGlTc09UWElUbWdteHNpVFA0dzRnNjRXRllrQ0RqRDlTNFJycVJ5eHc1SG1P?=
 =?utf-8?B?TkR6V1dSUllyQ2Q2cWg0MlRBejJrK0VTbVU3WURoNHpBbmUvSmF0YllBbWxk?=
 =?utf-8?B?NW5kcXExcXV4c3g0YWRqWVd3UlZaT2tteFI0R0VyT1JNVml1anNOaU8xcFNh?=
 =?utf-8?B?Vk1vWFZsZEQrWFFxY3NTMEY0Q3pFQVZadUFySzVWNDNxVmFrbWdxcnBsOFJ1?=
 =?utf-8?B?bHpxM2YwL2ZJcW1HREYvLzV1WlArUUxGb3BlelRrTTA3T0F1dnl6ek1saU1U?=
 =?utf-8?B?RCtPUVZiMHh1MVZLRHR6NHJHdDFOYXNKdmlSV2lHVm4vVnhtdnpFeWtMYkpm?=
 =?utf-8?B?ZFlWN1hMMGtnVEhGR2NERlV1QUVPY2l6TGQ1UmcrK3UxTThYU2xaUHBNbFI0?=
 =?utf-8?B?Z2dpdmt4bGJFVXdKcDhHb3ljcTJTUWxCd1lRZ0lMVEd0eFZuZTQxQUVOK0oz?=
 =?utf-8?B?Z0JKOWRRTnRRdkYzN1dXNUE0SitsRzQ2ZUVHZGxZakRoN1ZGbENaRDVPUExK?=
 =?utf-8?B?UkRUbG81ZGc3T0FOYWgxcEptWXUySFJJZFovN2JtaWZzSFROZENlN3U5cDZw?=
 =?utf-8?B?YUZ4YndxWnFad0FEVTdsNE9KZW1iOWdvWlV0Rzh4MnkyU2dUanlhOC84MFkx?=
 =?utf-8?B?VTJSWmFEVWdMa29DaSs2cXBLYlAyRThFN1ZGd2o0ZWtwNHhvdWZXZEhoTDNM?=
 =?utf-8?B?M0t0NWYwUENQMzFWQi9NR040Z1k1NGc0T2VneVVFTFVNa3pwZ2tzREVUOXlL?=
 =?utf-8?B?NUJVaGN3VTFiNTcwckRSYVIzaHZaVWFGeGNTUmtCaldDa1M0NllITmdxQk9r?=
 =?utf-8?B?Rjd0QVdoaWNlZ3B4aTBBZUg3dWl4L2Q1ZkVHdFJ5UnNLSGd1ZTJPMHR1c0Nq?=
 =?utf-8?B?L096ak9lM0dnL2NmSmNJUjFzK0Vob1VYY25vK2lBVFRSNFJoVEVabVowVDdl?=
 =?utf-8?B?b2M4bUptYktYNFljUG41YXpYM2djdTR2c2k2QnZQdUpmTTAwQlIwVDZCL3dt?=
 =?utf-8?B?YmYxNzhySDMvUjQ3bDdLY3c3Y0FXSVc4MkhPdzF4akpyZ1R1NTRLNCtaYkcy?=
 =?utf-8?B?VllOd1NQUXYwdmRjN1JUczQyWnZOQmdoaVhKWnlQbjVidDZOV2lTdUJzNVI1?=
 =?utf-8?B?M0YvajdPdWJ5cTF2UWQ3N2FuOXl2VjhuaTJIM2tjQkhCR3pjM2kyWS8rclUr?=
 =?utf-8?B?UHNYZkZQUWhYbWN6SS82WjZkLzNoUjByQjJHTTVVbmJsMXFueXNNc1ZhYlZU?=
 =?utf-8?B?VG9BNG85U0lGcG5OQlhiMG5iK1J2eFcvNUxiNGRwdEJ1V3JEeWdiS1RpNGVz?=
 =?utf-8?B?blBmUDZuamVqR0FmMU1KeEl1NElmdXNBbDRwUHEvUkJKNkg2Tzlhcmc5WjJV?=
 =?utf-8?B?QU8rYUxUN2lCdzU3UDhIU0JBRE5qV0hZVVpqempGYUQ2NUFKZCttQllKdmp4?=
 =?utf-8?B?ZzBweTNEZWN3UTJ1NSs0eE0rQnVGc2FYUlJoTFh0SHpYRDRtVFVZcjdVNllO?=
 =?utf-8?B?QTZwZVE0RDdOc2VXdTFhSXgxTytRWjBheW1ic25BeDdFYnJkMlpyb1duNzIz?=
 =?utf-8?B?K05hZklFTnZZWUlRbWZRNERieGxzRG9nYXhNamtyZDZLMkdBL2dnalZZS09Q?=
 =?utf-8?B?ZXFNc3N3UzJNV1RhWmVzcmZyQlFudEJxbmhzK3V1a0IrNDFnY0VNRCt5Z05B?=
 =?utf-8?B?SG0wN2U5Q3lYbWJNTlhkMlJGcU1rTW1LK2dmS0kzbm5idEtvZ2UvODI2K2NI?=
 =?utf-8?B?Sk5yL0N6ODFWWjNjSmgzd3RLaVVHYS8vcjNBSkpFY0lmUy9YYnZoTktrSVdU?=
 =?utf-8?B?ODlaQUd0ak9mNnRLS3BBZVFjOVBUb0ZmTHRHTDQyd0RLT2N3VXU2Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b52328-ca8b-43e7-f953-08de9f47a230
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 01:45:14.5296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mQ/r113iKUgnO74KhonKUVeOJZz2HpkxPvbXhbKLxKHnNyu8u1IxX/JwFW9+tLkzqX33K/yY09Bpfxzkner+Q5P8xZH46FZhv2LRA1vSJAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB2188
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59186-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[chipsnmedia.com];
	FREEMAIL_TO(0.00)[collabora.com,kernel.org,xs4all.nl,pengutronix.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,chipsnmedia.com:dkim,chipsnmedia.com:email]
X-Rspamd-Queue-Id: DECB043552E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGksIE5pY29sYXMuDQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IE5pY29s
YXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT4NCj5TZW50OiBUdWVz
ZGF5LCBBcHJpbCAyMSwgMjAyNiAxMjo0MCBBTQ0KPlRvOiBOYXMgQ2h1bmcgPG5hcy5jaHVuZ0Bj
aGlwc25tZWRpYS5jb20+OyBtY2hlaGFiQGtlcm5lbC5vcmc7DQo+aHZlcmt1aWxAeHM0YWxsLm5s
OyByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsNCj5jb25vcitkdEBrZXJuZWwu
b3JnOyBzaGF3bmd1b0BrZXJuZWwub3JnOyBzLmhhdWVyQHBlbmd1dHJvbml4LmRlDQo+Q2M6IGxp
bnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4LQ0KPmtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWlteEBueHAuY29tOyBsaW51eC1h
cm0tDQo+a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IG1hcmVrLnZhc3V0QG1haWxib3gub3Jn
OyBtaW5nLnFpYW5Ab3NzLm54cC5jb20NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCB2NSAxLzld
IG1lZGlhOiB2NGwyLWNvbW1vbjogQWRkIFlVVjI0IGZvcm1hdCBpbmZvDQo+DQo+TGUgbWVyY3Jl
ZGkgMTUgYXZyaWwgMjAyNiDDoCAxODoyNSArMDkwMCwgTmFzIENodW5nIGEgw6ljcml0wqA6DQo+
PiBUaGUgWVVWMjQgZm9ybWF0IGlzIG1pc3NpbmcgYW4gZW50cnkgaW4gdGhlIHY0bDJfZm9ybWF0
X2luZm8oKS4NCj4+IFRoZSBZVVYyNCBmb3JtYXQgaXMgdGhlIHBhY2tlZCBZVVYgNDo0OjQgZm9y
bWF0cyB3aXRoIDggYml0cw0KPj4gcGVyIGNvbXBvbmVudC4NCj4+DQo+PiBGaXhlczogMDM3NmE1
MWZiZTVlICgibWVkaWE6IHY0bDogQWRkIHBhY2tlZCBZVVY0NDQgMjRicHAgcGl4ZWwgZm9ybWF0
IikNCj4+IFNpZ25lZC1vZmYtYnk6IE5hcyBDaHVuZyA8bmFzLmNodW5nQGNoaXBzbm1lZGlhLmNv
bT4NCj4+IFJldmlld2VkLWJ5OiBOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1ZnJlc25lQGNv
bGxhYm9yYS5jb20+DQo+DQo+VW5sZXNzIHlvdSBkaXNhZ3JlZSwgSSBtaWdodCBjaGVycnktcGlj
ayB0aGlzIG9uZS4gV291bGQgaXQgYmUgb2sgd2l0aCB5b3UgPw0KDQpTdXJlLCB0aGF0J3MgZmlu
ZSB3aXRoIG1lLg0KDQpUaGFua3MuDQpOYXMuDQoNCj4NCj5OaWNvbGFzDQo+DQo+PiAtLS0NCj4+
IMKgZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1jb21tb24uYyB8IDEgKw0KPj4gwqAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZWRpYS92NGwyLWNvcmUvdjRsMi1jb21tb24uYyBiL2RyaXZlcnMvbWVkaWEvdjRsMi0NCj5jb3Jl
L3Y0bDItY29tbW9uLmMNCj4+IGluZGV4IDU1NGM1OTFlMTExMy4uNTViY2Q1OTc1ZDlmIDEwMDY0
NA0KPj4gLS0tIGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1jb21tb24uYw0KPj4gKysr
IGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1jb21tb24uYw0KPj4gQEAgLTI4MSw2ICsy
ODEsNyBAQCBjb25zdCBzdHJ1Y3QgdjRsMl9mb3JtYXRfaW5mbyAqdjRsMl9mb3JtYXRfaW5mbyh1
MzINCj5mb3JtYXQpDQo+PiDCoAkJeyAuZm9ybWF0ID0gVjRMMl9QSVhfRk1UX1kyMTIswqDCoMKg
IC5waXhlbF9lbmMgPQ0KPlY0TDJfUElYRUxfRU5DX1lVViwgLm1lbV9wbGFuZXMgPSAxLCAuY29t
cF9wbGFuZXMgPSAxLCAuYnBwID0geyA0LCAwLCAwLA0KPjAgfSwgLmJwcF9kaXYgPSB7IDEsIDEs
IDEsIDEgfSwgLmhkaXYgPSAyLCAudmRpdiA9IDEgfSwNCj4+IMKgCQl7IC5mb3JtYXQgPSBWNEwy
X1BJWF9GTVRfWTIxNizCoMKgwqAgLnBpeGVsX2VuYyA9DQo+VjRMMl9QSVhFTF9FTkNfWVVWLCAu
bWVtX3BsYW5lcyA9IDEsIC5jb21wX3BsYW5lcyA9IDEsIC5icHAgPSB7IDQsIDAsIDAsDQo+MCB9
LCAuYnBwX2RpdiA9IHsgMSwgMSwgMSwgMSB9LCAuaGRpdiA9IDIsIC52ZGl2ID0gMSB9LA0KPj4g
wqAJCXsgLmZvcm1hdCA9IFY0TDJfUElYX0ZNVF9ZVVY0OF8xMiwgLnBpeGVsX2VuYyA9DQo+VjRM
Ml9QSVhFTF9FTkNfWVVWLCAubWVtX3BsYW5lcyA9IDEsIC5jb21wX3BsYW5lcyA9IDEsIC5icHAg
PSB7IDYsIDAsIDAsDQo+MCB9LCAuYnBwX2RpdiA9IHsgMSwgMSwgMSwgMSB9LCAuaGRpdiA9IDEs
IC52ZGl2ID0gMSB9LA0KPj4gKwkJeyAuZm9ybWF0ID0gVjRMMl9QSVhfRk1UX1lVVjI0LMKgwqAg
LnBpeGVsX2VuYyA9DQo+VjRMMl9QSVhFTF9FTkNfWVVWLCAubWVtX3BsYW5lcyA9IDEsIC5jb21w
X3BsYW5lcyA9IDEsIC5icHAgPSB7IDMsIDAsIDAsDQo+MCB9LCAuYnBwX2RpdiA9IHsgMSwgMSwg
MSwgMSB9LCAuaGRpdiA9IDEsIC52ZGl2ID0gMSB9LA0KPj4gwqAJCXsgLmZvcm1hdCA9IFY0TDJf
UElYX0ZNVF9NVDIxMTBULCAucGl4ZWxfZW5jID0NCj5WNEwyX1BJWEVMX0VOQ19ZVVYsIC5tZW1f
cGxhbmVzID0gMiwgLmNvbXBfcGxhbmVzID0gMiwgLmJwcCA9IHsgNSwgMTAsIDAsDQo+MCB9LCAu
YnBwX2RpdiA9IHsgNCwgNCwgMSwgMSB9LCAuaGRpdiA9IDIsIC52ZGl2ID0gMiwNCj4+IMKgCQnC
oCAuYmxvY2tfdyA9IHsgMTYsIDgsIDAsIDAgfSwgLmJsb2NrX2ggPSB7IDMyLCAxNiwgMCwgMCB9
fSwNCj4+IMKgCQl7IC5mb3JtYXQgPSBWNEwyX1BJWF9GTVRfTVQyMTEwUiwgLnBpeGVsX2VuYyA9
DQo+VjRMMl9QSVhFTF9FTkNfWVVWLCAubWVtX3BsYW5lcyA9IDIsIC5jb21wX3BsYW5lcyA9IDIs
IC5icHAgPSB7IDUsIDEwLCAwLA0KPjAgfSwgLmJwcF9kaXYgPSB7IDQsIDQsIDEsIDEgfSwgLmhk
aXYgPSAyLCAudmRpdiA9IDIsDQo=

