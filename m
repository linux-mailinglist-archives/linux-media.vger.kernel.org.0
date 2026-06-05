Return-Path: <linux-media+bounces-63886-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wGZjDw6YImqkagEAu9opvQ
	(envelope-from <linux-media+bounces-63886-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 11:34:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D350646E30
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 11:34:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=siliconsignals.io header.s=selector1 header.b=FqxKQ9c0;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63886-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63886-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=siliconsignals.io;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21D18303AF25
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 09:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C353B71DC;
	Fri,  5 Jun 2026 09:32:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020078.outbound.protection.outlook.com [52.101.225.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4119D3B71A6;
	Fri,  5 Jun 2026 09:32:36 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780651958; cv=fail; b=GZYZE6S310q8dT9TYNaZUbzloxblZv7etCv9+VJugxvCamOTlPRvEGZIIEtAXRQvSSF++qws+IP/X/gQyr6Rs1DhmuZ0UHMsOsUAh30HHxQebtZkSboMV0IjO2ihZ5Y7HJLWG3wU9pyEfj9MOZvtRT56jlv4nPBzOx6chtOLqqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780651958; c=relaxed/simple;
	bh=b8f+mnqxMBlu5Ny2zsNU8h5wiUGjhrsUGtcc61MLRa4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TGMu8nNp2H+CQJYz1wGZBMWUD3xl4ymCSiL0hF35jD5Fz5NROS//4gcSbi3A2eOGDEk8yov+Ts35qCFL0T8Qrdxx+FEt2DisMxYhsKcQ95q9dfnOevOQO6EFltpALMd80A4Lc7jxmc5ynrtJCC1G41GyGLdBOThUQcXB1MYlEDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=FqxKQ9c0; arc=fail smtp.client-ip=52.101.225.78
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNtr1WZKQkbSmrrnIugeCKPWNj5OuehCv9O6N2CyJNEdS88kb/h55fcbCcxuoHhHlBRKezcy9GGYGV+Oed5lIOF4f4c1HKdVvPLvsgzADqr1MaQBsaGDmiREoG/EuMtH4OIGsYd+0+6qfcCqb7Wb3/ObFNkl9egnuwAFycdJea8pc+EvhtvlNT8JDwFuP5fmXd3wNgAdELR6C+2nEN89VoA5QjWOwTfRA2ZhS0xSCiR8zbllYkFTnIwGWOEQF30RYOOXOA73iUwLAawSQQRFmDpKosTHqfYH//LKlgjhJfv7y8vRCdMgsG+Q/NBnWpCoZpBGK/dZX4QHydqj+iSe8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8f+mnqxMBlu5Ny2zsNU8h5wiUGjhrsUGtcc61MLRa4=;
 b=EgYslvu/0DynbqwffSi3xOtroEvyibLdmKeS58jrE6yVYGAPfB8XRmGIVut/AxjbPYlrjGfOGmJ+XM2q2TcUnqHG6va/YhNBane79SsrXT0IJ12btpanR1YFGT/8u7lnd2OzFgU10SrSVaxvPnnUNkMOtVRvIZFk5p92bN+a/EdGVoZ3j4NkLL8f6cggX5XgnfQ3+drhIDGhouliAaNNfa7kPr5q7wGd99hNr1OOWARxhB/8CP4RiBNcSoUUd9VvkBUAOZPVGOJWZFp3SgqtrrF2IvM6Hr5ct8QOZJ17qhWcW3xPxB1tS0wwQ6Yinb8yewthkJJr7zAVwVYwa2KbQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8f+mnqxMBlu5Ny2zsNU8h5wiUGjhrsUGtcc61MLRa4=;
 b=FqxKQ9c00zaj9xLi7vJYD5nZbbvpC//mWTmvTfzSMV5oTZSPvqvKmG1buphMZH5XuTkuRIkjEso6OmXXleCkbqEEGq/ESL3v4AkQ53EkNrKAJOeeefKkbSETDLGm6EhvtWjgngkErdA8olmvDRlSEnZxSYFY/VUZD03A1qUjSItczXcsnFYNls0JLhHlGZgnR7PJsQfTUe/A89ACdt8RrrUc467/nvpUggKppbeXAGKe3rUNlwg6hapoo6D1s7M+RkFeLc9oVFV+L3rzOJIBu4B+xzNzsd5PRbsaZWP+jKtfc/bOMA5V5yBt2Xs+Qdski35IvgTUa9hJpEDuf9qLBg==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB0965.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 09:32:30 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 09:32:30 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Kate Hsuan <hpa@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede
	<johannes.goede@oss.qualcomm.com>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	Serin Yeh <serin.yeh@intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Topic: [PATCH v3 2/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Index: AQHc6ZnV8EzqZpFcuUOHpM8Iev0rOrYapvWAgAbF+ACAAFuogIAN8tmAgAAKGp0=
Date: Fri, 5 Jun 2026 09:32:30 +0000
Message-ID:
 <PN3P287MB18299B4251956273620C610D8B112@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260522031121.11968-1-hpa@redhat.com>
 <20260522031121.11968-3-hpa@redhat.com>
 <ahDdMZjID07dRDhZ@kekkonen.localdomain>
 <CAEth8oGWfYpC2umZ49g5qEp_QoZXNKNJ6vMu2EtmnOy6BxZGBg@mail.gmail.com>
 <ahbYo3CSzkYI3jF9@kekkonen.localdomain>
 <CAEth8oHOgPXWGFp9OYa3VGUK3p10Rnx=Kv-zPJRAS4k-rR-DFg@mail.gmail.com>
In-Reply-To:
 <CAEth8oHOgPXWGFp9OYa3VGUK3p10Rnx=Kv-zPJRAS4k-rR-DFg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB0965:EE_
x-ms-office365-filtering-correlation-id: 8f661b22-0aef-40ac-28ad-08dec2e55d5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|38070700021|22082099003|4143699003|5023799004|56012099006;
x-microsoft-antispam-message-info:
 PnjOSShdALe1+/hbzSWg6ylDmGyHttCKRGvNwS61aYKzpOWtqpZXiMhQqo7QxKmhR62AxsE1EwzbAh2Gr5cmhAjG4EZCXCuKdk5i/1q6AH7st4L/we6h2rxV0EUJJwd9r1+CEMUaZUxQ4NFinzTEI6DWHrLNaAPXqq4KHTjl9EhwTYdodjJM/VepjJe4TtHk17HhhmY43Zg7e5unYBuiPwhk1Bz6+YN3TfN5FrbUrqNrNVQleEbows83mL/EaTHKx7NQ900upnd/j1mtZ4hDbFaVHmlDI8+E5++oVWJm9tnvDNq+bWEWxqhjUeNsJTFE5uR+ze2pJgS+4G3+CA3ENTTVcGi/BevYQGfDAkRb0ZTTL4P5ekNIk23VfY3U3OjBp4oo52dqcEcdw3xyVBwaii1gZ6j646ooy6YbhYOrGrPQkfsg3bmKiWxR0sVIe+1nGyH43iOKOb6Zqhp1AZxYm+jUT88N1/Cl9KuOjQeT1UxtnTE4mS08UWproIHx7QVcosCO+pT6C9A0pkbEJ13ro64Aavs8Hl1NJWTs/pAwKkPx9i0Nm+0uBANJz2M1yw9VU+CGp7UrJANccMDmXP2USe2ZcB2rwUFFN9DElnx13U2BuAEHB03Mia/kZZJ6bVZmfhsB8/YbBOY6gpSPhTsswjmiS0mcsmo1LB70SEND2pOGYgjVV6H+t/RxaD/Z8AO+fahjMgB/+z/9ceXdnblRyQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(38070700021)(22082099003)(4143699003)(5023799004)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?anpPcS93cUxvdkQ1bzR0Z1lBYm01TGJOK3dOZHQxaW11WEFsMWlzVmhCOXNE?=
 =?utf-8?B?bXRJRExnRW1iNjE0WEowSkVXM2R3SzdVdlBPb00yL1phalBFSVl3akVZSjha?=
 =?utf-8?B?bUVZRUg3bTVZdHlyWUNOeUtuOVRvSFpvU2F3WnRpYTdwL2YvK2xyL0YwM2Fp?=
 =?utf-8?B?WW9UV3I3eTk0UWc4YUI2cVNtRWpvMlQyNnp0MFlPN1kyU3BOdUE5RUZPbXgw?=
 =?utf-8?B?c0gzdGo0YWpEb2dNWitmcEZackE2YlRSUjBacHNzZDVJQVRNZ0xkT3JhdXVK?=
 =?utf-8?B?K0tIeEdzS1VRbU1IN1FkaE0rYmQ4aEpMM2JueU0xRjBKMEtFTkg2d2NuUDVS?=
 =?utf-8?B?TGhzQjQ2WGhtbXlnazRVRGYyUzVncWVBRzRiWVR4S01pc1kweURoVzhuRnpH?=
 =?utf-8?B?bm5hUm5iSmlrTStqOWtIU2xadGFSaDRhZ1ZLUC9CUXBFNnVhSkFmMEcwRjJp?=
 =?utf-8?B?MGZya25wcjN6eTFxL3dIMWF3ZU1iTlBtaTIvbUMzbm5JK0V5UHFkcWVURXBM?=
 =?utf-8?B?R0VTdUNoSkxaQ1ZKcXNRd2RGc0dSSjFLUmhPYytFaFVDaExRemtWSUE4bjFh?=
 =?utf-8?B?RzljSHkydGs2dGpxMStELzl2TXRjQ29DZGx3cloyenpYK0laRTNnempjWU5r?=
 =?utf-8?B?dkVrMVVZM1J5RjdIN1lzNHY5Zk5HejJ6MDM3S2FvWi9VQUVRdnArYXQxYzFU?=
 =?utf-8?B?OThUN3Fhd0xFVzNrM2JKM0pWMjRnWG9uQmpURyt4T3hick1VcVkyUWZ0Nms5?=
 =?utf-8?B?eU9zQlc5WXRyZUsxYmFMVlpsK0pXR29Hb282V1hGNkowZEg5N2tiNmZweDJH?=
 =?utf-8?B?M0RTa3IyTHEvV1lSNVdGY2RmMnNvRGZFb2dGSHpnTjNBa3hVOGt0U2F5SERH?=
 =?utf-8?B?eFI3V1o0VVNoekM1S1drWDRKVmFuSGFCUHFFazNlaVQ5cE80YTVkQWVRQ2Fv?=
 =?utf-8?B?TXFFMFZFZVU1L3B5N1N0cFhLcmttVWFZNnJpYnMwWng0cjFKOUVFZTVMUUhS?=
 =?utf-8?B?OVh2NkJPTVAzZWZNVkllQWl3NjNaQlV2N1ZDcnZJMExiN0pURmJLTmFjc3k5?=
 =?utf-8?B?L2xibWlnbjV1OXVDMldsdTFzR2ZHNHFNWWlVN29YS1g0NnlFbVd3TzV2clNT?=
 =?utf-8?B?OTVJQXZCMkVjSjQzVGMvbnJGc2tBc3c2UElRa2JaM2hOK2lmTnh6RURWREtM?=
 =?utf-8?B?cVdVWXpwRXdMWHBTNnNOWjhIWDBHVVNuQ0dWejhlOU9mL0dONFJKM291OTlU?=
 =?utf-8?B?ajFFVUhyZTBSTHJZUGxHUUdnakFrbW1vQTVtVkdabWFwc2taeFdkWTMvMUxC?=
 =?utf-8?B?T3dKWm5TSHk1KzlVR253bmVnVldwRXJDOGVobnFBYmx0VGtJRXllWVJlV0N0?=
 =?utf-8?B?ZG9MR1N1Y0xYTUp0bW5xMWJEQ0tGMTFvL1NuVk5nYVByTmZvK3VhT1J5QmhF?=
 =?utf-8?B?ZlNEYnp6Vm91VzRHRjFCK3hyT3huZWNhRVlZN0ZFT0hjbzg1RXVIQmNNUlVU?=
 =?utf-8?B?Y3ZnYlpyZ3BrREJBbmg1aDhFbWpnYWNDUHF3RXhFNWFZNWQ1ZDA3ZkcwQXRG?=
 =?utf-8?B?NmszZHdLUHdMb1RNWm5XZFk1bFlqK2pZbkJDb0lSTmh6ZlRGTGlyWEx5Z0hY?=
 =?utf-8?B?dStyTk9zYjZsOE9ITHVjQlU1cmk2V0grUyt1TlZXZTZ3ZEVseXJRaWQ1bTZL?=
 =?utf-8?B?VUxwUmE5RS9FVjFmRkNnU1NNZDcrdEVvNEZUT0ZvOEx5amVneHF4YzRaeVRF?=
 =?utf-8?B?RzlCSnBhRVY3TE83dDFTdHRDbFlRbzN3RFdyNTA4NnZiOGVpRnNRUHpWcVdj?=
 =?utf-8?B?bDIrZnY0NmVIZ29paEVHT08rUXFDdU1nYkFwOG85bGNKdVpzeFhMaXlZcVQv?=
 =?utf-8?B?cEtrZjg0WG15OGppNHNCa3puT28xSVArd01IM2c5MmNxdE1kWHVRazlucVFa?=
 =?utf-8?B?dUhOdnRyeVpuOWZibmY2d1NnTWk4NWQ3Q1IwcE9jSWFFTlV2Z3lPeG9uc1pw?=
 =?utf-8?B?dWo0ai9lTzRFUHhzMkRPcGZKby9xQUFoUVFmampSVXcxUURnOTF1TmhMenpm?=
 =?utf-8?B?bGdFMU9zUWJzaUdoL2RCanY2RTRjeS9mb3AyTVg3S3lDOG15TWRXVUVMVGZ0?=
 =?utf-8?B?eXFSVktLTDBPWlNxdEVWaGR0Wmw5Z0pJcjhMUUdPa1U1UkNrR01GWndZTlMx?=
 =?utf-8?B?RGlMajhDWmlBem5yRVlBMzArQmhJVXpoc3B1N0FRSjNHUVIwTjROazRwOUl3?=
 =?utf-8?B?TC9ZbHlNSVV6L0VZVk9VMHNVaC9NTW5hM2ZoRmxVZTF0NEJmemxuKzVIU3F6?=
 =?utf-8?B?ekpHWlc5Vko2YmZHN09vdEdDdjBnU01xaDRwMmdCZTZwWFo1Q1pZMVBscnN4?=
 =?utf-8?Q?PDLBPkyz+UfcJ0Fc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f661b22-0aef-40ac-28ad-08dec2e55d5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2026 09:32:30.2180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QySExdzBGMplrZ+Wxou0OvjMHqXPfb87yWY41hLtzL0gNNG5k5LNROVgc0h8kFF4Eu4CdkOKMkVigqZ+ehjKkHPXR4IGWQsSkKJvJxX+I8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0965
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63886-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:hpa@redhat.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D350646E30

SGkgS2F0ZSwKCj4gT24gV2VkLCBNYXkgMjcsIDIwMjYgYXQgNzo0MuKAr1BNIFNha2FyaSBBaWx1
cwo+IDxzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBLYXRl
LAo+ID4KPiA+IE9uIFdlZCwgTWF5IDI3LCAyMDI2IGF0IDAyOjE0OjI0UE0gKzA4MDAsIEthdGUg
SHN1YW4gd3JvdGU6Cj4gPiA+ID4gPiArc3RydWN0IGlteDQ3MSB7Cj4gPiA+ID4gPiArICAgICBz
dHJ1Y3QgdjRsMl9zdWJkZXYgc2Q7Cj4gPiA+ID4gPiArICAgICBzdHJ1Y3QgbWVkaWFfcGFkIHBh
ZDsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgIHN0cnVjdCB2NGwyX2N0cmxfaGFuZGxlciBj
dHJsX2hhbmRsZXI7Cj4gPiA+ID4gPiArICAgICAvKiBWNEwyIENvbnRyb2xzICovCj4gPiA+ID4g
PiArICAgICBzdHJ1Y3QgdjRsMl9jdHJsICpsaW5rX2ZyZXE7Cj4gPiA+ID4gPiArICAgICBzdHJ1
Y3QgdjRsMl9jdHJsICpwaXhlbF9yYXRlOwo+ID4gPiA+ID4gKyAgICAgc3RydWN0IHY0bDJfY3Ry
bCAqdmJsYW5rOwo+ID4gPiA+ID4gKyAgICAgc3RydWN0IHY0bDJfY3RybCAqaGJsYW5rOwo+ID4g
PiA+ID4gKyAgICAgc3RydWN0IHY0bDJfY3RybCAqdmZsaXA7Cj4gPiA+ID4gPiArICAgICBzdHJ1
Y3QgdjRsMl9jdHJsICpoZmxpcDsKPiA+ID4gPiA+ICsgICAgIHN0cnVjdCB2NGwyX2N0cmwgKmV4
cG9zdXJlOwo+ID4gPiA+Cj4gPiA+ID4gRG8geW91IG5lZWQgYWxsIHRoZXNlPyBBdCBsZWFzdCBs
aW5rX2ZyZXEgcmVtYWlucyBlZmZlY3RpdmVseSB1bnVzZWQuCj4gPiA+IEknbGwgdHdlYWsgdGhl
c2UgY3RybCBiYXNlZCBvbgo+ID4gPiBodHRwczovL2xpYmNhbWVyYS5vcmcvc2Vuc29yX2RyaXZl
cl9yZXF1aXJlbWVudHMuaHRtbC4KPiA+Cj4gPiBJIHJhdGhlciBtZWFudCB0aGF0IHlvdSdyZSBh
c3NpZ25pbmcgYWxsIG9mIHRoZXNlIGZpZWxkcyBidXQgdGhlbiBub3QgdXNpbmcKPiA+IHRoZW0u
IFlvdSBjb3VsZCB0aHVzIHJlbW92ZSB0aGUgZmllbGRzIGFuZCB0aGUgYXNzaWdubWVudHMuIEJ1
dCBJIGNhbid0IHNheQo+ID4gd2hpY2ggb25lcywgYXBhcnQgZnJvbSBsaW5rX2ZyZXEuCj4KPiBJ
IGRyb3BwZWQgbGlua19mcmVxIGZyb20gdGhlIGRyaXZlciBidXQgaXB1NyBjb21wbGFpbnMgb2Yg
ZXJyb3JzCj4gcmVnYXJkaW5nIGxpbmtfZnJlcSwgc2hvd24gYXMgZm9sbG93cy4KPgo+IFsgMzYy
OC4xOTU3MjJdIGludGVsX2lwdTdfaXN5cy5pc3lzIGludGVsX2lwdTcuaXN5cy40MDogYmluZCBp
bXg0NzEKPiAwLTAwMTAgbmxhbmVzIGlzIDQgcG9ydCBpcyAwCj4gWyAzNjI4LjE5NjIwN10gaW50
ZWxfaXB1N19pc3lzLmlzeXMgaW50ZWxfaXB1Ny5pc3lzLjQwOiBBbGwgc2Vuc29yCj4gcmVnaXN0
cmF0aW9uIGNvbXBsZXRlZC4KPiBbIDM2MzEuNzU0NTUwXSBpbnRlbF9pcHU3X2lzeXMuaXN5cyBp
bnRlbF9pcHU3LmlzeXMuNDA6IGdldCBsaW5rIGZyZXEKPiBmYWlsZWQgKC0yKQo+IFsgMzYzMS43
NTQ1NjJdIGludGVsX2lwdTdfaXN5cy5pc3lzIGludGVsX2lwdTcuaXN5cy40MDogQ1NJLTAgUEhZ
Cj4gcG93ZXIgdXAgZmFpbGVkIC0yCj4gWyAzNjMxLjc1NDU2NV0gaW50ZWxfaXB1N19pc3lzLmlz
eXMgaW50ZWxfaXB1Ny5pc3lzLjQwOiBlbmFibGUgc3RyZWFtcwo+IEludGVsIElQVTcgQ1NJMiAw
IGZhaWxlZCB3aXRoIC0yCj4KPiBTbywgSSdsbCBrZWVwIGxpbmtfZnJlcS4gOikKCkkgYmVsaWV2
ZSBTYWthcmkncyBzdWdnZXN0aW9uIHdhcyB0byByZW1vdmUgb25seSB0aGUgc3RydWN0IHY0bDJf
Y3RybCAqbGlua19mcmVxIG1lbWJlci4KClNpbmNlIHRoZSBkcml2ZXIgZG9lcyBub3QgdXNlIHRo
ZSBjb250cm9sIHBvaW50ZXIgbGF0ZXIsIHRoZXJlIGlzIG5vIG5lZWQKdG8gc3RvcmUgdGhlIHJl
dHVybmVkIHBvaW50ZXIgaW4gc3RydWN0IGlteDQ3MS4KCkluIG90aGVyIHdvcmRzLCB0aGUgc3Vn
Z2VzdGlvbiB3YXMgdG8gcmVtb3ZlIHRoZSB1bnVzZWQgbGlua19mcmVxIGZpZWxkLCAKcmF0aGVy
IHRoYW4gdGhlIFY0TDJfQ0lEX0xJTktfRlJFUSBjb250cm9sIGl0c2VsZi4KCkJlc3QgUmVnYXJk
cywKVGFyYW5nCg==

