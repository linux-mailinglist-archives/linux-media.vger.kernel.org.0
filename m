Return-Path: <linux-media+bounces-56470-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEEsA0/rvGkL4gIAu9opvQ
	(envelope-from <linux-media+bounces-56470-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 07:38:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D572D6480
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 07:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3F5330990B4
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 06:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CD9326951;
	Fri, 20 Mar 2026 06:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="kEk3cpGK"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022135.outbound.protection.outlook.com [40.107.43.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2C231F99E;
	Fri, 20 Mar 2026 06:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773988651; cv=fail; b=VGAR3DEwG0T//Ok9BAUDquDs58Jse0SfC7mbwXqu2z4sWoSdPBP1PW2vLbTDRD7gC5nhuoKCAlhGhPhfMxtxswGMhAK5lnDmOmWWgIM9GVlRVT/mtGiQXyBEpA2+M19tjQ8yT4vYEMRpWeXusZt3N084/wJyjLWJJrmBdpiARu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773988651; c=relaxed/simple;
	bh=13QzAGFN6NRQ0c1z1oSryypTApUpWDVav3rkWdAUjJ8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ecMy1iKN2UAgQm5YIMH6WDWlz5g/00MMev7kw1y0VpscP2QPIVmZk6/gCWjb2oZkcMs9Adw3kJoNUDG65fp4KVqGGUB7WegDv3uqxs6SzZ9EHZDlG0v+M3nQq5dwKiJaKO6MBjB9DHTV37kURg6C4qEae1TpXNE1GpX1UsfXSQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=kEk3cpGK; arc=fail smtp.client-ip=40.107.43.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPXnnvEaM94wmR1ugCvVkbOPt6Phw5H+344UI2HxQXfNfqWp/yBUd+Byq0kkTgsEXnd7L3GvH6hjDu93nagWNJQYB4Gs+ZvEukwR+10s8wW7I3k2Ya4+RkqfE4ogzx4m6noUbA3Pu8baWca0Jpljgi+x/f+dfFs6UDMQSUYkYlHSJf3DvGSnLmeTb/Qn9ZwFrCJgOkv87qdM4H+TYa0YW8j71D9M1DO4oxjyztXZ7jKvoc7hRfsv7c+B1hhcY0rRQMZuUCBjzkT7vvP7ommLG3uDPbD1Uzhwr05uJod6nSA6qyoQ3G2lDKk7H4eHNklKIB+xI4gTyBOJqz+9l913bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOqFbYH35b98fmjTxL9I6wc8k2KisJMkJATA05OhWDs=;
 b=mIoold+9eAX8ozsWZA9zM03NubiBXpvvgxeVy4yJAOLGWpsDzRseG91YEViJvXJe1+VAAQ4cIW951VXXrp0ULkFiydSdPqFOPz98lO+npH3jtfw+LMnk7HoGFS1gAi2Vz6HAHNUgKDj92dw5WRE5hulgzD1fhzOp8Y+E1xOVL3/A+4+TibQAFuPuWEr2KTqL6eyHzqzUi4B2OuWvHGHE8OlXb35Gico7QQoGfYMiY4nTxgRAyx1LFM3CviwOje80ViSuk3w2l4O4AnuqycuQK9ZhI9EOTZS3oWU1+aBQmz2Mi8UEak2og/KH64zX1mxOvHP0SoRf2kGbPxaEyrN2EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOqFbYH35b98fmjTxL9I6wc8k2KisJMkJATA05OhWDs=;
 b=kEk3cpGKqWAez+r2bhfAGJwontli1IsHBEKUFgSPSKwoiR7dYqLAkE0YFl55G4wfkC8jQP7So+vBUcaMwEREcFDZEN3kYrqo3GAH52YJ51MkvTzbyiHWPDW0b/Emn9QP6nqC6gctIBigVtgNYp6P5OR5nW9hmbZmiSUZtxse9hw=
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::14)
 by PU4P216MB2035.KORP216.PROD.OUTLOOK.COM (2603:1096:301:129::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.22; Fri, 20 Mar
 2026 06:37:25 +0000
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::31e3:e5:b0a4:2f2f]) by PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::31e3:e5:b0a4:2f2f%4]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 06:37:24 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "bob.beckett@collabora.com"
	<bob.beckett@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>
Subject: RE: [PATCH v0 1/3] media: chips-media: wave5: Add Support for
 Background Detection
Thread-Topic: [PATCH v0 1/3] media: chips-media: wave5: Add Support for
 Background Detection
Thread-Index: AQHct2HAfFKpFpiwkEild+fkOz33vrW29/bA
Date: Fri, 20 Mar 2026 06:37:24 +0000
Message-ID:
 <PU4P216MB1149773711B9A9E0642D0945ED4CA@PU4P216MB1149.KORP216.PROD.OUTLOOK.COM>
References: <20260319053210.90-1-jackson.lee@chipsnmedia.com>
 <20260319053210.90-2-jackson.lee@chipsnmedia.com>
In-Reply-To: <20260319053210.90-2-jackson.lee@chipsnmedia.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU4P216MB1149:EE_|PU4P216MB2035:EE_
x-ms-office365-filtering-correlation-id: f058ca35-2f4c-4754-31d3-08de864b25c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 7NiZBKGWwk+mOEEotz1l7pJAOvCjcbiOWfrG8nWjaJ2/oSYtcKnczeus2VTbg1MnblTrtidyY6HTvmTffOl48zh7s4C0/jt6JavTRwtRxCNKSJJ4svQr8ljakLCfvL6PDPatCOw/Dz4fICVXAUbEKYNtaQfvjBeukEjO+SJVizGi09pbVNC+w8RzdCdVhFM9T9unG5WFhU6ScIrYunVITZtTN1+YFLT0JNm1cXyseROO9xFqiuN8tmVCdgpO/IMLuSO3s/hqcsih1aYS8LYhFfYCGDpY1oCMqdgaNO9Ewf/i4qotERy4hac5xbZq+fYi2Po3sVKTkllfHKJO2giZ+o7d5s8wUc0syIoYFgDEOim/GFaHdjEqbRUBkHj5xxKVLCzfxgngTC4Ftxrz9yKLpcRTpRtsZm2+P5Y3dbFtpJ4BPnS4ZKOQGfx0YeReOPuC/CzoX5NuZEQaXw3MjX4uTTYk/VzrejPoQASIiBvN49FL4ueMyo4WdhGwo0gxj8xC3+1/2eUT1pL5H10kSV58Np3fAKOLAkn+gDZE19vTkS/T3+O2asscFUQol0eeo/BcZ912ZdT/EApTXCGCxyr4xRvwBXSla971eSGOX3If1fsvjIntwHFBWLutYPclSj8cdzqTHn3L5KTNI6id0Nxc5Ze2cWbKmRDqGffX/cAfBQegDygp7ssbZ6lFRTLPnFMUmQUDQtwY7HYL7JEFNnAMS3vB33ME71u3OA9KHSUpA8n/TvWqBhHezjEUogY0QTHB
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1149.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3xgzoNLFAWP+BdjqOZPMnjSPVzWbOo+1wOvWM2wtYvfNzrP63rIzi1HLDNM2?=
 =?us-ascii?Q?PkeJAD5WgvEGz1x/D1Ixc55A0pakm76TAZJ3oklB8KoZsflHEPTn2Eu1/yrL?=
 =?us-ascii?Q?3p8yjanyy4NND4sQZ53QxYeuO7ZZWEBJD8z6Ap50LfSuo0/W0ADSUpAYX5WK?=
 =?us-ascii?Q?N3RUa8PJQxzkeXqYNeVvGxJNzYR1wvLqObQVNCXpQtnFMJj6uWSaYW53ebkR?=
 =?us-ascii?Q?SBgE7EV9u0X6NgwHM0e+PbDKTMUdYklAlJrLq1fGZjTQN1pUqcwwOPQCGYMB?=
 =?us-ascii?Q?U9Wy2mXYdLEGuXrgUdypSYUaXx9bTFbg8h/rTc2zhGy73LKOhnMt5XudzT5R?=
 =?us-ascii?Q?I1hN8XaGKyC4ySM2RPph3YR3PZIYET9nOvEZNQ0n8NwlCpfKRug4xyOvVhnf?=
 =?us-ascii?Q?xuip8kDqkcXlwYMRxHGzG/Nb/cB/qEn5ZDx7w8/Q66NI6bpT7X9rda8HKMW4?=
 =?us-ascii?Q?eGOVZLhLYJTkA8kwJos7KV9X8cR566UWJcKKvJX2fekmkTI8V079QM6xldNL?=
 =?us-ascii?Q?ASYmR9Udb0sNQQLKs2obAtzDTcVESdUOHdHHLfvFA5xULIZXBphcMxlRke5n?=
 =?us-ascii?Q?sXZpOoDEhjoXHksMtL0VNjlnTpv2ZJTibQ8cek+u//Qong7XGY0M4+Ysiezp?=
 =?us-ascii?Q?sUWE/Z3cAyhdibT+W5tiCa2STLxg2HfIkGjd3y1lLQ7NEiGqOJ2f70572feR?=
 =?us-ascii?Q?QnjH5JP7C0IHN8xxiRyoRhUz9254haCBMtwxgWbaaRSbOVM9sIQNMzB3r7Lc?=
 =?us-ascii?Q?MhwOf9POCrPcAll2LWuayvvPUyxbkv0ex018d9OUL25DhWAOaDntZK9Z43fP?=
 =?us-ascii?Q?4n2OhM29wZQgsr7K1/iSSPD3yCb3TdHjd7bxqmEJEUyGwoFze/ARQ7lCeoNB?=
 =?us-ascii?Q?IZxyhjYS3B8FedMOtdl1ShEQ6SV5ZMXFCEGPeyEhjP+93OYBB6BnOkgtVSk1?=
 =?us-ascii?Q?YbO+A92xrdl9CZnZE+77N03/44dTAdLWkalaYoFdPv0obFYfL1bluNKTko7R?=
 =?us-ascii?Q?q8qnlBgSUXehiOhyFNgUlV+rVW1hJX9ZsvLp+nGA5kSZIfuUnq99VqfuX3OL?=
 =?us-ascii?Q?isX+ZJQnr1iodCEorfbZCA+OgCRsJzPr3X35zNRNhe/IZUFvQtN7Il4tUnMU?=
 =?us-ascii?Q?o2e3G671r269hyaGYjDWnSyLlLuw1Ug7DfW2TqYstFKTEpFdzMpKWrGaCT8n?=
 =?us-ascii?Q?mw1LlYLz4+2HxtRKcCT0Wa5PLaQmYbhek7bU0OXv+KViha6NwzvkI7QH2Gqn?=
 =?us-ascii?Q?Ajy4OBxYGUgxYBZlJCtwQUB3WFDowV+MwfTubxVUYG29f9zZ9HhUXOanU1kb?=
 =?us-ascii?Q?lvn+S0uEYRGFnRil1wKPiqFHfmU+D4viQ8fGQhqUTLfPy848LlU0odNGaIoY?=
 =?us-ascii?Q?155wqh4R6cfzccKsNj9TbPgnan/DFUSyaJ6gdjeUKqIzqzVOLfYef9yjGI1A?=
 =?us-ascii?Q?sthrpP/Pjvi6CLAWgq1gtUecgR1jbHwjj+MniaETvX2ZpITcCf2/SV/pp1wo?=
 =?us-ascii?Q?HxT0K/hE1zwz0jYBt/oKdm0778vv4PrF2qLnYiK1QVcspNCiBNdizZSc2hMv?=
 =?us-ascii?Q?tF+IK3IDPu+gFVyG2YjoVAiKskcXxluYbgBYP22Tshp9UVNR/lzUT9C9LS62?=
 =?us-ascii?Q?qPz89eq1zUO1Hrdrtv61g82EY2neL9cS93Mh0sldxOkOBexUGo2bQMvQpNeW?=
 =?us-ascii?Q?4Tu0QSTL3Mtu/g2xub4tRvKLB2NBHsrSeQ/WOORWdJhaTWYrg4lphDBaKCGM?=
 =?us-ascii?Q?Wj02n62CZA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f058ca35-2f4c-4754-31d3-08de864b25c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 06:37:24.7465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +peqRhkAiW1vn0d6tXxgAJ3U7/gMLhjfLmcjZJLnG6HV2f2BNB5pG88+CsTejy43V9APxu2vHJn4UN6KtflTz9y+guT4k1NCRzfpSsH0Ecc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB2035
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56470-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,collabora.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,ti.com,xs4all.nl];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 05D572D6480
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Nicolas

I got the message below from the CI robot.
But in v4l2-controls.h, none of the defined strings include spaces around "=
+".
Can I ignore this warning?


# Test checkpatch:./0001-media-chips-media-wave5-Add-Support-for-Background=
-D.patch checkpatch
CHECK: spaces preferred around that '+' (ctx:VxV)
#134: FILE: include/uapi/linux/v4l2-controls.h:467:
+#define=20
+V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION(V4L2_CID_CODEC_BASE+238)
                                                                     ^

total: 0 errors, 0 warnings, 1 checks, 81 lines checked



Please fix your series, and upload a new version. If you have a patchwork a=
ccount, do not forget to mark the current series as Superseded.

For more details, check the full report at:
https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/95650311=
/artifacts/report.htm .



Best regards, and Happy Hacking!
Media CI robot on behalf of the linux-media community.

---
Check the latest rules for contributing your patches at:
https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html

If you believe that the CI is wrong, kindly open an issue at https://gitlab=
.freedesktop.org/linux-media/media-ci/-/issues or reply-all to this message=
.

> +#define V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION
> 	(V4L2_CID_CODEC_BASE+238)
> +

Thanks
Jackson

>  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
>  #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL
> 	(V4L2_CID_CODEC_BASE+270)
>  enum v4l2_mpeg_video_mpeg2_level {
> --
> 2.43.0


