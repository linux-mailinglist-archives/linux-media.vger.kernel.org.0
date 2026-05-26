Return-Path: <linux-media+bounces-62747-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIdSHuhHFWqLUAcAu9opvQ
	(envelope-from <linux-media+bounces-62747-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 09:12:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DABB55D18A3
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 09:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D9243047BEB
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 07:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFAF83C583B;
	Tue, 26 May 2026 07:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="KHlSqaso"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021104.outbound.protection.outlook.com [40.107.57.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828623438A3;
	Tue, 26 May 2026 07:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779402; cv=fail; b=QHqt7+lV3j2H8D0LTs1Cwci72dz271couB0r9z1RfK0w1g1fxAk1sX3LZaw3lkfrwksp7URUPgcbeVu6xXhFpyyHa3BpacBsonGECUxAuo/SeHCuCf2t8IKwA4Tv+5ASaVCCu/a3JLFBPzKWOFVceLdH8l4JCq17oDfPdedSY2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779402; c=relaxed/simple;
	bh=4jbdUlsdsZEBRK4rnuhq/xgpV/rvHM8fwx6L4jiAVNo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZArQ9ES12/8dnsYIzzQPJwXR1zA4qWRHhk5Y+klSrwOEAZ3iKbEieA3rFm5q+Qf2tcbmOl2MDLUymvdaeghyWISi6RApJJdOI/nHpFUBKipg+ifRhoRscPuh3XLz6AXUEtDTPJOOhtW5Y4K9g6i+yZQM6zEb4A9rfnDvjBOHrg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=KHlSqaso; arc=fail smtp.client-ip=40.107.57.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OG1YyflZYvt2WB4irH8YQSWbR5QtV99hcjsXOHyjsPYX8HMpoidq1E393L7wRVWbufAAEO4Oz9PfX0uFIle9KE+BW/dUXDOmyqoon9vDkU3eBwA3n99aoBKuHkrDJhIjki9bGV4ElixespXQ4ySIVpTF9S9j5PoeAV+p+T4xtnn/I6vT9hQNQht0SxUvb1E/ise/dmUKEXtC6vvjIfe6xtosztOHPlvONNy70DaGtVPONluttQCHB+nxpxJlZqpRMngi3olOCo2e9lUUEVgsxlJ6tzRaMfAA61hhN0L11PyjVlEk6qnVl0Gwn0UH1/PJSk8nej9ImAY3B6KrLcyK2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eDEcBR5ZPAjOBshsiXIGCM9SpdcuQ7utw7Msz4DFfE=;
 b=ndYELWmgnHCC5sMInkfd/Klvw2xeICPt683JMZGmqUJL8i+RKH9poEPzCQQ8cI5WzvtPU4I49gBeYyG+8t3dWZ0Rhq3PidhFDuHoMpF99wrTE/nR+x12OXhcKwuXqDYLrYZyCPdFE5ewdw9y32FAfHZb9WYFGboP/cuA6u820/U5R+qTSyb0ls0UftrqtbhA7HmMLvzvFmjj4qwtC7Sgx45DuJPoet/JnIJHs5eBxI8NTC+3crhRrChWnjR5k92TLgN4DgirW2eUbPVWdoFDrHNIepfNzzfi4ae8e+mMhahtJxiUTnqfJn2cK+HnqeA6j+GsmOvKzDa0LugfufLbpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eDEcBR5ZPAjOBshsiXIGCM9SpdcuQ7utw7Msz4DFfE=;
 b=KHlSqasopYaZDUdpWC6KmDASDtz4AyvXRotlr+a9Emdi6rATyjczsglrMMOwd0FvxdMJN0WbDbE1KSnlYQnqT+s149NYbv/ygn1PHlYsXv/Io0wDhofcyrDj3OEpGl6bb5JmtDF+L2boWAtc1dPdRQ4rkkmzhSI1ld54yzxpY1T/fQuH+CZukyHSb/Y1UULH7KCIK/pWuKZF1c79vA0sLL4RBAUn4ELK/C+3NSZ9aTnbP2rEqOQqiSCPbK9URju00A7Z9z3laMFygDvvlhgUHMAPf68Yk8uIV+TtqijW/HzhYGMZbLt+20gp9pqZaVP94gy9oMnrkWNS0AxVAqvaBA==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAXP287MB4271.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:15c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 07:09:55 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 07:09:55 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mehdi Djait
	<mehdi.djait@linux.intel.com>
CC: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vladimir
 Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v2 00/15] media: i2c: os05b10: Refactor driver and Add new
 features
Thread-Topic: [PATCH v2 00/15] media: i2c: os05b10: Refactor driver and Add
 new features
Thread-Index: AQHcvE0RwA1nT6Y23Eqs8Q7SF1wgrLXy1fCYgC1opnQ=
Date: Tue, 26 May 2026 07:09:55 +0000
Message-ID:
 <PN3P287MB1829CAAB606558641ADEA34C8B0B2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
 <PN3P287MB18293C332106D4A13EAC07668B362@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
In-Reply-To:
 <PN3P287MB18293C332106D4A13EAC07668B362@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAXP287MB4271:EE_
x-ms-office365-filtering-correlation-id: bcf51a6a-5449-44fe-405e-08debaf5ca20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|4143699003|6133799003|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 XT0o8Bx5F43rk+grkhqZgMZa5Tf2a4iLQEglImgrkoyEIUgL7QgO6mJQGBQV717CuoQPwwA5cd/9nFtuMCf9q5PQsK1E7uxguUpxIfL3I5EuLuqtFmg18sxzWz5Icu7EunbAtzID2x6IH5n3OH8dXGMP42E2RP9VRAGPvCe1lNJ7lwJXTYKQo/Xw0f0dU6icte1aLDSnu/BtHeyePRcHGcKN8TfiLt2nzz22i354fh9HbIqXWMBMv+YAoicqLFcvGgSDkpSfbMidhXpWV21PpdAOatCEnwIZ0HEikrJNGwqTMgbshmSOmy17bZ/CgeALLiYzezHFbyYVK+fW4V/VOM69uL3bSuxUfNQrw+UxOOeWEIDAcy7Mn5JgM1OS0H6BiwYR4QKVmgAsg8Wgafpbwir+hxdZ38vcgyo7Ffpd240pV8vOxZviiFrLD7mEX5toPrNcCWPnURF+Indw2SlbdmZhXfiLP6ZkFs8aHrA/6aFf7b+WoTJ8TFdMm1pCO0PDwBLOFBQnZBx/FE0n9bnI9tPWwLEXVAiIeR4QbG9vp1l1AH+QGyG/P8IAPoMPQxvgJ32HPiYSV9ASjtY2VWEUrbxtu1c6QvKwleIH1scykS4YtIIs1s4QmuGjd+0iWw/Wu3mDA+2ZWbWv9/g/V0II6XN++BJWiBGdVkfM3WjpnsEjPfQEW5t9qhulzvoiaKc/jaN0DGd/B7pMZ0J1OYqXHMoEsFSo2wihgPmyuVfVuig73BgOuEsLNvjq94rbrlF+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(4143699003)(6133799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?4SI49RBQ35diT2twEvA+3bhS4QRkxCNZ+FPFXBXCr5ghLsU3w5mccUVL?=
 =?Windows-1252?Q?NIcMPDfR23SOznjM4ClPblGlEg/DSThv53m9jp1NbTBHmhX6BwVR0xbH?=
 =?Windows-1252?Q?r4yzerYt02VK/iP/0PHgxO6hDDR2XqKGjQUVW+8gye8ZOTFZDiGmFC9y?=
 =?Windows-1252?Q?wuh9nx4BMNcbyaRSTtBx3KrWNXoibMCR38OMQCSxNSNfPlueCbsiDDC2?=
 =?Windows-1252?Q?jT0SqhCALEG73GSJ4YMKLgSHTUNH4oc1NQ2LTcOJCQ+jMQAx3QTGpLkq?=
 =?Windows-1252?Q?1EqSMSAXFoanc9sOXUO/IOxut980XJB2jM+BXlQC0+ndxS2FSYC0MrWz?=
 =?Windows-1252?Q?Vtak928wLeHSRLEZEMOymGAxqNNEjuFnZchcfOJoHz7efloPcmTBg4yZ?=
 =?Windows-1252?Q?0PClPtbq6gX/jXbxXkiM40vtcLnWMXovXV/vbp5H2ZkuHILqa7t6UsaY?=
 =?Windows-1252?Q?3AkxO4FIsTiO0lpxL+OluTzRIr+LNqn0VdkGsptmcKF3YhdS0r0DeBHd?=
 =?Windows-1252?Q?LcBvgXybnQzLstUvrdUFV8V4yfqkle6kTDhHuMZwShAV6Cz66bvOtUKN?=
 =?Windows-1252?Q?iMK1njK4vLJHnyTEAl7gY2+WYHWPyKnyvOXgpTl5knEPdAtuzz4p3QSd?=
 =?Windows-1252?Q?wRigEbOvDK09E9AVCUDmNlVQmPjHNf9GhKxlnfluMBHuQOluUVVxOhHc?=
 =?Windows-1252?Q?bcUUOVYKHqR0ff2202Cxxh/YYqX8laG0R3l3CZpA+zcdu+jVXUXU4QC+?=
 =?Windows-1252?Q?k8CWrtDstlaIpvqOx7EY+cqTYCIaXzTpc2swPUFdZjjbMZ0SPy1lsCC0?=
 =?Windows-1252?Q?UAgzUbpwZvoid3CX0V9dPa/347i3K6E0XyrhQT2YC3O4fY60bUDs+Tyh?=
 =?Windows-1252?Q?IWMfEtDJTmJ55zbcy08/q8ONWeMpRYlSL7Uw6o2udPT4BFDOnXN02CAA?=
 =?Windows-1252?Q?ACfl5T4QXnTaWLTrh1iBoJPXKAPjDsa9O2pb1MPa6wMglk4BWgOqeTES?=
 =?Windows-1252?Q?sHJ2lZfJppTeUfHTMH1vgv/qOQJ7Qa1OftM2Rk6ufGg1oUmdnMjFgjM2?=
 =?Windows-1252?Q?WN/+PbOeVBSgj+8UelPXN7rQKpisVx2pz5XetCkBWfg7bdbTSUl5ckNW?=
 =?Windows-1252?Q?LeOrQtvGhh8onRIvnKgibt4hmBIzC+3vfE9E8WdirTm/fq/O24kKT576?=
 =?Windows-1252?Q?D6hW+DCrjzdTQSWLw5wNVXKVdG7P+vxon6tcupVKPuSP76Ei2nSW9fbz?=
 =?Windows-1252?Q?3uZBG0cM6WH5JzLWW8dxXyC0xWyr49Uah7/Cd8cz4ZJENYouk3isiqhp?=
 =?Windows-1252?Q?7FBGHAhHjD91oAZ3zM3lJGjUJ5bpE+ZqED6TIf3wb1QMMUGp2eic3Rus?=
 =?Windows-1252?Q?WldpeP97JIzhs9DxLEcaSIhYChYrjAcKnfWgz/a+xXtqS6j1azCYR1sN?=
 =?Windows-1252?Q?UldLir5Hw7plPnIt63SW7cX4IvdKTuIN+oSUJlo6GfbU6b/cQtSjVRtP?=
 =?Windows-1252?Q?Aipth/I1PyBX8qj60vAC1mkGCII1xhvj4bcc3DpfruOvTKl6H5XxDd+L?=
 =?Windows-1252?Q?ji9haeI2cD46RonIIiUq+yZcVn5ZQMxLxF1z6ymWUzaeh2sPUmRJi64E?=
 =?Windows-1252?Q?hfYS8YdPuoCWm5QD1bqBfr/1ddEUg2YKU9kWNb80Eqbdf2nQiRcyLwRH?=
 =?Windows-1252?Q?76O7LCkBaTVCzRFYTHwxH3nb+PxtudbuYGDZy9pKkEr8nV6MxEgtEVRB?=
 =?Windows-1252?Q?QDpNj+/4lwohneejYxq/yjl8Tqu2k7TJhC97rvYPZz/JGfgmIEK/dWcL?=
 =?Windows-1252?Q?XfAkAOC+dbFmVZ2FO3gKdyx9rTp0seoc7qPX1C4LW1gwg5lpwuVpCMpD?=
 =?Windows-1252?Q?lf4ea5fjhLNX/w=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf51a6a-5449-44fe-405e-08debaf5ca20
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 07:09:55.3878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 09UNKCLuPd5Z36M3Xn5xX+y3r73/r7Bl17i+pR/0lX21FIv+RGuOL8Tt0oL8HM15n7hSKbBhih184ZvsqHkmnBse5VZJZp87/DJZFuWYWD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXP287MB4271
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62747-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: DABB55D18A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mehdi,                                                      =0A=
                                                                        =0A=
Could you please review this series when you have a chance and          =0A=
help Sakari with it?   =0A=
=0A=
Best Regards,=0A=
Tarang                                                 =0A=
                                                                        =0A=
> > This series improves the OS05B10 sensor driver with cleanup,        =0A=
> > refactoring, additional controls, and support for new modes.        =0A=
> >                                                                     =0A=
> > Patch 1 Use pm_runtime_get_if_active() when applying controls.      =0A=
> >                                                                     =0A=
> > Patches 2=963 perform initial cleanup and refactoring. Unused         =
=0A=
> > group-hold programming is removed, register definitions are         =0A=
> > introduced, and the initialization tables are reorganized by        =0A=
> > splitting common and mode-specific registers.                       =0A=
> >                                                                     =0A=
> > Patches 5=967 add additional V4L2 controls including digital gain,    =
=0A=
> > horizontal/vertical flip, and test pattern support.                 =0A=
> >                                                                     =0A=
> > Patches 8=9610 extend the driver with 12-bit RAW support, update      =
=0A=
> > pixel rate handling when switching between 10-bit and 12-bit        =0A=
> > modes, and add new operating modes including 1080p and 2x2          =0A=
> > binned 720p.                                                        =0A=
> >                                                                     =0A=
> > Patches 11=9613 improve control handling and internal logic by        =
=0A=
> > keeping vblank and exposure in sync on mode changes, updating       =0A=
> > the active format before adjusting framing controls, and            =0A=
> > renaming the vmax variable used by the VBLANK control.              =0A=
> >                                                                     =0A=
> > Patch 14 adds support for 2-lane MIPI CSI-2 operation.              =0A=
> >                                                                     =0A=
> > Patch 15 fix negative hblank calculation.                           =0A=
> >                                                                     =0A=
> > All patches were tested on the Debix Model A board running          =0A=
> > Linux kernel v7.0-rc2.                                              =0A=
>                                                                       =0A=
> Could you please review this series when you have time?               =0A=
>                                                                       =0A=
> Please let me know if any further changes are needed.                 =0A=
>                                                                       =0A=
> Best Regards,                                                         =0A=
> Tarang                                                                =

