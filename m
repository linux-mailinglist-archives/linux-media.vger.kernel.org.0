Return-Path: <linux-media+bounces-56633-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDutOIANwGl3DQQAu9opvQ
	(envelope-from <linux-media+bounces-56633-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 16:40:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7702E9D1E
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 16:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AABDF30107F7
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 15:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D568367F4A;
	Sun, 22 Mar 2026 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="aepUJAjD"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013083.outbound.protection.outlook.com [52.103.35.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A7C3644B6
	for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 15:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.35.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774194041; cv=fail; b=By4FvB/mp5JHO7C5MlG432BJwreMftpPqmJUKChP5TZe/Zm47nzeUjnS2sqzwcSsdzOSwgm/Ty4PhZNQt+Wtrzt5O668NyghDLTQzPRfFjVk76X5bsPasSTJzbukJtaWhGSsvHUbg7VaS5uwN7BVHGP5DobPbJYM1ZVUUq++Ewk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774194041; c=relaxed/simple;
	bh=UY6YOX+2Z1vVT1wx10UKKDkOZQPTHWykRjfYrgJCAbQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=K5eY+YChn+2kmjQQknO9zZwhIjSk+EyfgwSXNUPDuBl57WEUqbfWiEWeMKow8o41M/QSCPdrgOPn3XnOFjb1F/V9bI4C3h3B8z5KxOelPSnRhXah6M/M/9j2MMOjPlqnZCzEZBqYX0UF5JgVuDNhqIOYdfVR0p2giu34F1pQUj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=aepUJAjD; arc=fail smtp.client-ip=52.103.35.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akiFw0upap9V5g3//9MXPCF3u7R5n+j9Sbsw9O+4ikNfdqJYy1PROGoVGy/xrjDR/+vb0jb4Ogl+OAKtO7gvok/MzXxLgBl/2wReqUMuxZhO7eoPQrBX5D1qjKK+3ANs3ej9x2qbr8CYzHIeZVzZSDw12o8X/j2nIDaff/TCweJ679pwSRTB21bQ0noFFJVqR7gHQw3h2w0jGneARL5p8xGLd/I0Hus9jBxMv+MlPT4i4YoOyt+Ohq+sMObxXZ6SxqIVdN2+GvCMo+SX4WmIIkvYUZm1DCJpO5ZGINvVXEVECrubDCHQbKE7EZQrbj5O32hGOv5/uSz8/2dVnpSdOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UY6YOX+2Z1vVT1wx10UKKDkOZQPTHWykRjfYrgJCAbQ=;
 b=e4V0LWSlyJO2DuMmLKlr2u6tsZIIL+C6GT7dlDxRN6qTwaIMvhvsM7zR7ghZmkGtZuO8pumm/9Q2oahdxnjljfxuQ9L+qSTsa3u//QZ2hP/IIy7S4unxB93mojpJoJTcVKt13qzitwgYlH7R0WHAjXrhKMKknPFfq7bf3x4zcIXshxYkX6W8dbijpWOjfG2hedbvaida3xW28cTiysEyPX3j6ON3Wf6I8OlAJzZvW5/wlNdVTSBS3hMtvhGM6nNKxgrZuH+bVnDu3+fPn/mdLPEI60Vd3tTZbd519smgq+C5mvHWA7YZxf73KXMtnpi4bsbqL1sWkEOSLnpJjwCtLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UY6YOX+2Z1vVT1wx10UKKDkOZQPTHWykRjfYrgJCAbQ=;
 b=aepUJAjDawh2xQ/11FRVkaX2tgLBNMW2KbGEv5QUGfu0Vlp+ZeLg36d5CNFzdOXgHW4Prv47CK+aFXjY/6+ro150FeRCVhFtq5QADMS6CQvzQQ6KMRJrZaODRz/7y3IZPVyjpXNiHQAiU4o9j0iLpqLcMpWuknsHcHxZyarlDV1JEKC9z5RlhxE0I1x909x5jNRTLG1MuOsuHG+e24VtAx2QNK6VmD29Pg8Gq5mJbOwawt8jt7k9Hje0h+Vtvx5lYDOf8h5BF8ljydIwbROdOOPCaLB72mILKk7JNZuhQJZtvHMQE4JRsW8sXN7rOlQYqQA0Pr2XZ+IkI/Z9VRWRNg==
Received: from AMBP190MB2678.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:736::6)
 by GV1P190MB1900.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:53::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Sun, 22 Mar
 2026 15:40:37 +0000
Received: from AMBP190MB2678.EURP190.PROD.OUTLOOK.COM
 ([fe80::a7fe:adaa:34d:6e13]) by AMBP190MB2678.EURP190.PROD.OUTLOOK.COM
 ([fe80::a7fe:adaa:34d:6e13%6]) with mapi id 15.20.9723.018; Sun, 22 Mar 2026
 15:40:37 +0000
From: Michael Anthony <manthony.nw@outlook.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>
Subject: REGRESSION: ipu3-imgu: commit
 a66191c590b3b58eaff05d2277971f854772bd5b breaks camera functionality on
 Surface Go 2
Thread-Topic: REGRESSION: ipu3-imgu: commit
 a66191c590b3b58eaff05d2277971f854772bd5b breaks camera functionality on
 Surface Go 2
Thread-Index: AQHcuhF0MJVrBbItn0emvC0ds+vfdw==
Date: Sun, 22 Mar 2026 15:40:37 +0000
Message-ID:
 <AMBP190MB2678E7DC048409068260DCE8ED4AA@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBP190MB2678:EE_|GV1P190MB1900:EE_
x-ms-office365-filtering-correlation-id: 1c6ab5c8-d089-4d05-cee1-08de88295d57
x-microsoft-antispam:
 BCL:0;ARA:14566002|25031999004|20031999003|55001999003|37011999003|8062599012|19110799012|8060799015|24071999003|39105399006|15030799006|15080799012|461199028|31061999003|3430499032|1602099012|40105399003|3412199025|440099028|4302099013|10035399007|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ZMp+q5EZuModBczHLCQxsfT6GfyM7lG+KIzoJ4EoggICeQ6Wbyhg1mjeH9?=
 =?iso-8859-1?Q?pDpIL7zq8wwuiq2soXLAMNCU+erfmFLnmo0D3SBU8/WRy2fPtY0MQ6Ma2t?=
 =?iso-8859-1?Q?NKg0f9CPC3jG8/Wtz/ZbF4mWFU0ooE6PyFIjScTF0TlbUwfIeIo30WZzuW?=
 =?iso-8859-1?Q?aie9Cwl/SxsSbgQE0y+aZhdc5QslDZo3cgeYoqIZjmAWj0AxDBjjm4K+gx?=
 =?iso-8859-1?Q?5dvkEQZv7U2j3rtAdCY3nI/0vMM7G7rfFfrSHYdgHuAEHezA9Ohnif9h7z?=
 =?iso-8859-1?Q?jlFVzbLsoyTA65mLTlyC0CArBxwDSlFpZZ6kXiZXsYC1sxMFBZ0j6ULyXf?=
 =?iso-8859-1?Q?B/30zdU2JAc9PXp62tHdMp1olXgb668jEP8iUtmhyudx40Z5DT7ZJi1P8O?=
 =?iso-8859-1?Q?cVp2DQZoLQuUHtl+1UhYPCVtRHkw1QehVwNnJ/1zCccCDLnKHNEchrCy5F?=
 =?iso-8859-1?Q?WQWvhft7w6NNU5IYm+WiEujTZl+kGpUIcENHTO/2/tPUrdb5qnDBB0GJjR?=
 =?iso-8859-1?Q?CQwfRw88vS7x0Iewlmvie5nxSG4pSNTjl8oPRNd4Nm/EXCqIZpC3jiP2+S?=
 =?iso-8859-1?Q?0pD1ZpjDtytm4KmmsefcdWVu9070Ps/maczPBcA4IId6giHOdzAUYHP+g0?=
 =?iso-8859-1?Q?uEKjOjnBvL0Z/WnOFlxhqCTP+jMHOgv7+KH9iJbTfqAeaGs8fS097Kik/R?=
 =?iso-8859-1?Q?B0LVsDVZp7Vc6S/7dGM8OpYVT8kofj/lFyC/1revK+kPR3wmIGLfOmYRH8?=
 =?iso-8859-1?Q?R1Zu9RQ7/kHSDlhiea6PrKDDIWaYwCzfWveaMFt4hvm820JL8lrqXgyIhN?=
 =?iso-8859-1?Q?YrFh/NUZYHlOcGgjgp2wZfy96PFD+Fkj+xOoK+2IjL/exr19DglAfLVIDl?=
 =?iso-8859-1?Q?nSeHqAapOhf+7e05u0gMrHRj0ZmTWs4kZjjMS7RiyQfwHJ2nzO/oS7unT8?=
 =?iso-8859-1?Q?tUOtMGkhmQ9jj4jsWARasV1j+A1n7Uum9jAfJ+JQaTGcf6sBvr1w06AzKd?=
 =?iso-8859-1?Q?dueAIFrlyIq7y7rbpRGQeNKcphK/viUUFpzkNGX+SGo1EN1uRzmTtlS3ao?=
 =?iso-8859-1?Q?SxbAp5q5X4QYHUTrLJwTt5Z4IyRGU4whbMyYnCL7jCeZ35Eif0Igrw8UsD?=
 =?iso-8859-1?Q?vsns6I8xyfFetmtgN8p8ijheoCKwx2oTbA+6kGJdTEMX7jIsDbO6wiamr8?=
 =?iso-8859-1?Q?JUC1H/YeXYEqB/PSvWVt2ozS/5ZKzwP6CVqtI7EQDWirraHsYvO94xh1gL?=
 =?iso-8859-1?Q?ebNAcG5y7G7BpSCqWaRJHfsCNNMsMv8rzGeJ9kFmU=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Vg0Jqzkxt6hHT//vSB2CSxXUEAjJoXHhQN7nxZbUhdS8BJCmBVyMJlszTh?=
 =?iso-8859-1?Q?HS5vxGg87sam8i8vfKBxA6chWfK+RoH9wWuZWsFUwTOuOAD0aAOYnA7GZE?=
 =?iso-8859-1?Q?KtxXrptH1r1XSfRdcFeI8Vn2Z+M5pYX3jxPnWgMi+nsVMO63+OxsusuvE6?=
 =?iso-8859-1?Q?lKHCfXggN21Gl6yftkaaVyxBXgpebCHcIPOmE+C1g7oA/E0l1hMWbFq3Do?=
 =?iso-8859-1?Q?v7vKKFJcceN4CupKdDz9iQIedzO9LFgCC7XVvdrjpzsz6PWiFKT2lHOXdV?=
 =?iso-8859-1?Q?8TVfrHe3xpQMdWYHqGNTH4EAyJcFgMjV/OhbMBRXeRM8UCQg6xOKLwwEWA?=
 =?iso-8859-1?Q?xu/lxh8ToQ+R2IS/boHYndniRJ/2to4eAQ4d2SvklG+gLddFbc42Hf6rbO?=
 =?iso-8859-1?Q?U+g4CCP7xzLHB3soJIvMHr9ZQ2wKANppI7U5Np8PerKtXF/JmUZ75x5NQ9?=
 =?iso-8859-1?Q?kkfGJZrLtOekQ3Py4uccazRA6xZTchljr0Fwsb6NRhK8JPm0IE69z6EIFf?=
 =?iso-8859-1?Q?pLBCko3QNDK2yzMHgL5DeKW6iVwJeClgf934z6nLS2cjmJSNbaC61WDmlq?=
 =?iso-8859-1?Q?t55bOvYIiH3o8jEjWDWcfwwA00hHbZLnJGXB3NYC5EqLpm0j8fLuO2Jy1l?=
 =?iso-8859-1?Q?uYkOsEwiwEC85etSG0KcK/0vbDCJMIcjpqX1h/mSjfACkE2aYOL526YXYn?=
 =?iso-8859-1?Q?NWNGSZPLbxeNzm8MYthR3+OKcWmOrdLn/UOvAutqfVdL/aHzE3SU7Zn6Sd?=
 =?iso-8859-1?Q?sXe2iTRB8S4mH1XTn24ms9tWRCHu9rPt0WfWo+Oa7y/y8ApqOFL4eKhdOD?=
 =?iso-8859-1?Q?dtXKDZmOoZdhZp6JC6ze1x8Gw7qbjmG0tclnKfot5I5E5v6Ldhf1NsV7JT?=
 =?iso-8859-1?Q?10vYE1sZPm0p8EWModX58LLDJ3a/YRE3N1o2N81Ncyd9wmcCZC0IBJCS1v?=
 =?iso-8859-1?Q?a09XdKSjaFACxDtk9YDggFK+Qzm2TNHVLGvHjaVFY0rmRWDO/Bj7ACUiAl?=
 =?iso-8859-1?Q?Bt7t+n6ovv4C7FpYWPaAQFx7WWTwmmeVfSqjRhlnUMViCqUy7eMNItmKaf?=
 =?iso-8859-1?Q?6uWlb7RFNBD6JCsnkn28rxJSja7lwvTmaOLPkss7A5m/5UENa/6hTjRDqG?=
 =?iso-8859-1?Q?x+UK0Hrgrgfd7t1Kv+6mT47pzSXfFV72wACjF3gDEo87EPV7xGeQrYGx/B?=
 =?iso-8859-1?Q?0EDNgEOl78TIENpYrOVhcp3oYWxmJmaniKtcJi94j59IQRxsZ8Rh09LniC?=
 =?iso-8859-1?Q?2wRQIwdKma7sSOjXbLXmOn/e+F9Rgy4CAlwan3W/zQ9aHiCa7+T/bLa304?=
 =?iso-8859-1?Q?TazEObcl+iB1ttplDkvGfpDEuhQxsqZrvsuu8Le6vwiTCbM17va3ln3WMP?=
 =?iso-8859-1?Q?et3ZI96vMDYfz2hLlCiSm5I/yTWQTobACzY9OQ/bu4AVyB2OeBXUKRn//8?=
 =?iso-8859-1?Q?ko7R8WhZGKg7ZIC0YgcQtpfJRX7RGTnM1Uo6+/CUYS2B9EQWf6GBZer0mt?=
 =?iso-8859-1?Q?BQKPn6LA+DqLIRqYLZaY9Z?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBP190MB2678.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6ab5c8-d089-4d05-cee1-08de88295d57
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2026 15:40:37.3798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P190MB1900
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,xs4all.nl];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56633-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manthony.nw@outlook.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[outlook.com]
X-Rspamd-Queue-Id: 4B7702E9D1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,=0A=
=0A=
I am reporting a regression in the IPU3-IMGU driver introduced in the 6.19 =
kernel cycle.=0A=
=0A=
Regression Description:=0A=
Following the upgrade from kernel 6.18 to 6.19 on Fedora Linux, the IPU3 ca=
mera on my [Device Model, e.g., Surface Go 2] has stopped functioning. Whil=
e the modules (ipu3_cio2, ipu3_imgu) load, user-space tools like libcamera =
can no longer initialize the device.=0A=
=0A=
Suspected Commit:=0A=
"media: ipu3-imgu: Drop struct imgu_device v4l2_file_ops field"=0A=
Commit: a66191c590b3b58eaff05d2277971f854772bd5b=0A=
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3Da66191c590b3b58eaff05d2277971f854772bd5b=0A=
=0A=
Impact:=0A=
This change seems to have removed a field that libcamera or the V4L2 sub-de=
vice internal routing relies upon for this specific hardware. Reverting to =
the 6.18 kernel restores full functionality.=0A=
=0A=
System Information:=0A=
=0A=
Distribution: Fedora 43=0A=
=0A=
Kernel version: 6.19.x (Broken) / 6.18.x (Working)=0A=
=0A=
I can provide dmesg logs if required. Please let me know if you need a full=
 media-ctl topology output from the working vs. non-working kernels.=0A=
=0A=
Best regards,=0A=
=0A=
Michael Anthony=0A=
=0A=

