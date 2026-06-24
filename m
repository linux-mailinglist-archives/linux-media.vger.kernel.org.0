Return-Path: <linux-media+bounces-65526-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hIIPNkGqO2oMbAgAu9opvQ
	(envelope-from <linux-media+bounces-65526-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 11:58:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4126C6BD1CD
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 11:58:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=kLMCwWaW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65526-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65526-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3B233016B9C
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E908A3B2D1A;
	Wed, 24 Jun 2026 09:58:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021099.outbound.protection.outlook.com [40.107.51.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193CA3955EC;
	Wed, 24 Jun 2026 09:58:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782295097; cv=fail; b=UjnU06vD1X8pNZrMslcwh5ydD0c6nrhihoirGio177BN4JBpbXEVsTxsBz24vjRJdvFHIQa968ZwaD5EkMwBK+ahU37Ak/qBnZtRINstcdPul/KcEe/8T0aLIr7zK7jrP98agc9iayuQ+oCsg36SsM8C8gyj4KFh3Q1K60G5wzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782295097; c=relaxed/simple;
	bh=fTKc0FPdD1AHDjzjEWG7gxRN6Wi9vuGs7XURTmG0h3w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nUbIHtQgkMY3E1szCqmtC7t2fxYxmrOn2CxLYsMHQKBoU7HpM+XrTJTFEjE5fme04xeffugFqMXmv45YTY/nMOrX+/f6TzzMIFCtNoT06TCzmNrQBV/ThqDsK7xwI1ZvldIgL32k6KEk0XHoEvDhVUgVfxOkeSZpyPTgwPQqxNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=kLMCwWaW reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.51.99
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7a8sSKXxtcYAXW/5iLDW3jECqm0+gZmMZvGKDf22sXftvO7ecD/kehfpb8Js76vVo6pozoAuZOlibPZUYq5571uar3L0Bz/Vt6G2E8XRcuh2SwoaNaFEJFrxlzkK5EnIh1LCAKmauVYZI5uk63b5MngKILkuJbE7yA5AbPOGdNlQfEqBDxCMDkwcsagE1LOIRH2jW4odj5Fs4qlKHKiWmkVROAw6g2hObGG3fWEfn7me9i3LHYT6NmVzkFe3aDRY4mopCxvEMuTuXT3+ikcF2kl9GPSmOhLO2+f15BLmt8UF5Ptr0KI7IoUI5805Oi4C/FFJ98yOhF9rLcIOEHFCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTKc0FPdD1AHDjzjEWG7gxRN6Wi9vuGs7XURTmG0h3w=;
 b=PapHrGfklw9h0QUwk9pvk2foiPyd9WVoafAYOgcMfgq0TQNH9wcC5a/8sI2NiNLZf8D/k+QEzjduBfCJ4Q4FSa7/gKvLiUC7mEeHL62BJnvqiEUYlPV1wda2x1x+s46Ypxq7WZUZlXHWipg2nFbvN6pKyGw1fPCWf8eBZiCz342cMaZgS2BNgwH/1XIlTTIIC3aMV/MXnE+phPqvA60oH+yk49HyLN0KkI23E/efwLGlVxm6EhfC5+ClxNhqQd12Qt3fv4RzljIK9d6hBiPAPN88+SzePL5yh9VILvi54D8OvB+Ey2fhGKOjyOX6daJsMMsknosJUXKDsHESnqXQBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTKc0FPdD1AHDjzjEWG7gxRN6Wi9vuGs7XURTmG0h3w=;
 b=kLMCwWaWCNPeHEF5yDm57/nYRLRi7ZOJUD0KRo8BtpHmGN03SWX8htKRJ3ANHMILel6ymyxCaGZB0C/ZlwQU2dYnVTzYwS8n9RP+Ann596V7xxTi7bhfkosotYkEOrSnUvIQ4K6tH5bm13NBfOToMsz7iwGzc6m9Pu5en5CB/oMGOGIxA3jMyWtFW1Ks/nivv48FrLgueQU3bkQwyza9zmYJlA77Chbe/Oy2Q1+JyLbMY//iXU6HcE/m9zRVvfq8GydUJv5q96uBHbgXmHKWxSoByeSApXONBx00QcCEdTxshhxYp1RO1Vx8GkkwJYsG4qzH7XoK1IoNdiTE5vhI7w==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB5850.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:323::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Wed, 24 Jun
 2026 09:58:12 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 09:58:11 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Kate Hsuan <hpa@redhat.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Serin Yeh
	<serin.yeh@intel.com>, Damjan Georgievski <gdamjan@gmail.com>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v5 3/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Topic: [PATCH v5 3/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Index: AQHdA4qWGFy8lHm+wkeMR2iQvDfKqrZNXfrmgAANBACAAABeuw==
Date: Wed, 24 Jun 2026 09:58:11 +0000
Message-ID:
 <PN3P287MB1829B3B10DBA560A46BC96038BED2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260624033508.27391-1-hpa@redhat.com>
 <20260624033508.27391-4-hpa@redhat.com>
 <PN3P287MB1829650C00C45055F7E923468BED2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <CAEth8oFeS_aQ=6rdiJwCN4fuj1H530qFEG5iXMRJWJCL23rtiw@mail.gmail.com>
In-Reply-To:
 <CAEth8oFeS_aQ=6rdiJwCN4fuj1H530qFEG5iXMRJWJCL23rtiw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PNYP287MB5850:EE_
x-ms-office365-filtering-correlation-id: 78b28b0e-d79c-4147-8aee-08ded1d719d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|23010399003|366016|56012099006|6133799003|18002099003|22082099003|38070700021|4143699003;
x-microsoft-antispam-message-info:
 dyMfbXCUf9VnBacOKf3cMkGk4hc6Yqhd2UqkafqiEIE81Aa17qmZobHTHshaSuJgVYXXG4dpX6KvS8/9bdIKBeZZfh3fjedWY2eK/5EoWSgl7/SwyvDNDuoAo6q6mxI0lByTcc7n96gKsl8kJloGYKfiSN6b5fA2rwrUV9Gf/RS0rRUzS6/y7X9Pm9sLKkEYc9314k2HZWYv0zF9LUfrZ75XQEoFpcTRbIREJ37BvVWRozXL6DYeg2eO5Y/B+30WR5jpXNyQjMiFHnunD6IZpuhgve4gJWdN3GcsowD245yuyUVashvfpwbjeOfPgwbi8bAgcGr61V3k62aa2nlSWZrQiVu7yhPin1lGLrZmncpZBpH/zsv39rUtxjGFn4x9d/4HSC3cf/IYyg2UeOanlogXb/pWfNI4lbnq4qRUP6GXEJAwic2w5hz80OatJMO/4kp/uQDakVYvCoZlyV8oe6/iuVAfn6DK6CnBf7alQOGs8wyofr71gIwLp0wH+MC0dkce0/GfsblkTSfrXxkNgqnywrbRwLG9Bsy0P2a2a2qNN8l4leYsqsUVEoOva8TWWpstq9+plEtWSOxKI0N+WNMiteDgxjK6nH4yMxcYPrc1teSU2DKNvU7gUc3FfuO4A7pGR33+nU60RALLJX/QbGx+uIA9jIsQvJDpjfwORyBAjXLE05Z5me9LAwvOQOyfGpvzn2Mx4noqHVCDwbInByeqq6Ck7NGj10iKmn8Jrag=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(23010399003)(366016)(56012099006)(6133799003)(18002099003)(22082099003)(38070700021)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bm9pSUJsVDRnczJPaFphS0RHM2dITFFWR1Y4NUlhMEdKYmFhV1RVeWd5RGs1?=
 =?utf-8?B?TURhdTNlVkd4WC9yWWNFRzhvK3RVTkpueU16SmxXam5WbGZ3VEpaMjB4WlM5?=
 =?utf-8?B?b1laU3BmMy8vNk9jcndCT3RHZmpnZFFLbVJmVUsyQjlrOXJNTHkrci8yMFVt?=
 =?utf-8?B?bE9ndVFZMVpMOUdXVkVYRFphOVNsWVJkWlpNTlRLSjU5aDdRS09xVVJ5YUJX?=
 =?utf-8?B?M0lOY1Nxd1dpY2Z6bWRUNGV3SXJzUWJadktnV3hEOVFHOXZXSUFlUWc0cnk0?=
 =?utf-8?B?aXVxZldEa1ljbVk3WGRJS200ZExsWDBqY01KaC81ZXpXTmpsVWpBSUNIN29h?=
 =?utf-8?B?UlBSMGdvL3RSeUdDZkoza0liTEdzR21mUXpLMGxEdXh4Vmg5RTZHMUVqVitI?=
 =?utf-8?B?T1VYZWhtQlBCTm5RelhRU2lDSFFoNlUyc21NSjd4M0dNaURQaU9jSHdMV3Vh?=
 =?utf-8?B?MTZiVHVwODZIZEU1S0d2eHU1L0RtOTFWdFZub3dWSjVSRm9WckNlU0NqQ0U4?=
 =?utf-8?B?VDZCYzdOcThteTUvV3RmYi9VamdobDM4ek0xb2R2RGRDTFJBa0x0Sm9NM3Vw?=
 =?utf-8?B?UkxQTjZieTVWeWFMbmNMVVNqU240ZXpjQ1h1VmNRaHZCL0xxZTFtcVhDNFJQ?=
 =?utf-8?B?bjVsUVlNb0dMNEkydS9PVGJYQkVRSVpNV1VkMUpkaDdPdXlodkg3OUxyTjls?=
 =?utf-8?B?STc4Q3RtaWhpcy9BN3hjOStZTmNrWXI4S3R6ODlPUzVMbXRDZlNOQlBHQy94?=
 =?utf-8?B?T1c1bENDSFdxQjJ2aFBpQzNTWk9iNlhkU0xzcThOWTBvb2YrTFFpbUJDbVEz?=
 =?utf-8?B?RENyMTVxYWNCdlNXUW9zMVUxVTFvMUlIdFFBNS9VU1B1SEM1VzNMbkpURmNT?=
 =?utf-8?B?eU1ISnJENVQ2ZlowUDRQREN1bDgwVDkrZ3d5UHQ0c0grV0dlaUVCVTZ3K2x3?=
 =?utf-8?B?MUdrb0gxaTRDeUxBckVzWkJBYVo3OE83RHQ3ejV5VkpMMEVhZlh2T3k4VmNv?=
 =?utf-8?B?ZzY0U3BMZDR3VU1vNVZFL0Z5YVF6dGVPWFgzUHV2V2pWRjBTeFMyOWR3RTRF?=
 =?utf-8?B?UE5WekVzNTM2cmp1UForTXQrczBCdUdIWklWWGpjZWE2MFdOOHFHWnhERXRE?=
 =?utf-8?B?OHg2MmI1bnNzOERWOWoxd0tjU2dtL2szaHhOdXBPWFB6QklrL3VrUDFQNEZa?=
 =?utf-8?B?RWF0NElHV3dqWm10MHpPQW5pb05USGllTFpHOUQyMkRtWEViVXl0YTBSSnRM?=
 =?utf-8?B?Q2RBV05CRGRHeTVBd2VJMzhGRTF5aUdPVHNZV3ltMjJNUGlZNDBRMEdtY1pI?=
 =?utf-8?B?NWx5WitUVFluV3lIektRM1l6T1B0NU5qYk9yOHBIYk8rNDd2Y3YzY09tR0Vr?=
 =?utf-8?B?bkVML3FYM05wV05md296NzkrNTBSZVlJUm5jZmdIQ0ViZm8xdEJTd1VITk1M?=
 =?utf-8?B?cUxhV1NlZ2RZNmtBbkhwNGI4S3VmOEVMWXdtbGh5enl6b091NTZNbFdMeERt?=
 =?utf-8?B?Tzh0Uk1BLzhOWlRDSmNmUzhWRDZEV1JISUN4RTBQbUxlNEF1bmw0S01IK1ow?=
 =?utf-8?B?OTZoN1FxM0J0MFBMNWpvMHJoTk9MTmR1MkVZRnJPMlRNc25XdjEyV3ZHdDJM?=
 =?utf-8?B?WVl4ZW1ZUnp3VlJaWk9FaFBOVHpQSCtVa2lVUkppdTVWbVN5Wmxjam1DYmw5?=
 =?utf-8?B?L3pkOTBVckpsczQ3WkFUUkMxWkZna2hTSW5SbXVmektBS0duM1JkQlIydHln?=
 =?utf-8?B?Mkx3VytkV3ViMi9jTDh4UVpDQXZQMkFMVE1Nc2NSM2lWOVB0WTEwUUxMNHdl?=
 =?utf-8?B?N3RSNVB4WFVxRTVCdWFwMjR2bjlRRGlpSHdieCtNUTl4ZVdXN3RkSnpCVUpi?=
 =?utf-8?B?TU5oY1UreFNETnhxUkN6cytHTDhlbnorWnVFV2Yyc24zR2ZqYVY2M3N5M1lG?=
 =?utf-8?B?UWk1UXRjTHNhSlhUUUlLZkhCU0MxM0dwNmdCbE1XUjQyQmxvT3lyZ1pxSGp6?=
 =?utf-8?B?MkJyeWozOUQvbzVhOXorRmtCNWFJQzZDbHBCKzBSQlhCM2NqK1ZDcTJkY2ZF?=
 =?utf-8?B?c0hhc1VVNkxVcDJqdCt6QkJlZjRvdnZwTlgveU5HY2IvM2lNRUpkUllkTGlh?=
 =?utf-8?B?Mi9JM1BXeGpVL3dKT2lFZGlQWWd6VnFKY0M0Wm9md1FkWDUwM1NvbDJ0K3B6?=
 =?utf-8?B?THZlM05kNjdEbnI5cHJqOTNpUU9zalBjM3RBelJPTVNVMXpnanFpQ1IzTmRT?=
 =?utf-8?B?RkpqSVJOTXAraWg5M0ZMa214VUd3N1BWdk0zUFVFbWErZlRsZFljeEROUEZE?=
 =?utf-8?B?VHU0elUwZkU1SVN6c3hJYnhtUk9PRkVqbDRybGIzVVBLRDFJREMyRDZnMkox?=
 =?utf-8?Q?ZfgLntIqB/Tz3NhzkuKWVyEPnGAhlaotHPTyFtOSPVsfC?=
x-ms-exchange-antispam-messagedata-1: EVaNnqJDmvSznyBoSJ+H/lBFB2RK+15hy0s=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b28b0e-d79c-4147-8aee-08ded1d719d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 09:58:11.4280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /KRUXEbnjExzS/xqI8JFgrz2/oHjeqMjkJLuYpG6i2nz5VXpjVTHf51FggD+5m/USN0We7jJbJU8LXo6500PXr4S+zX4fY0BoIL0Zo7Dbq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB5850
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.64 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-65526-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hpa@redhat.com,m:sakari.ailus@linux.intel.com,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,gmail.com,kernel.org,oss.qualcomm.com,vger.kernel.org];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:email,siliconsignals.io:from_mime,siliconsignals.io:email,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4126C6BD1CD

SGkga2F0ZSwKCj4gT24gV2VkLCBKdW4gMjQsIDIwMjYgYXQgNDo0M+KAr1BNIFRhcmFuZyBSYXZh
bAo+IDx0YXJhbmcucmF2YWxAc2lsaWNvbnNpZ25hbHMuaW8+IHdyb3RlOgo+ID4KPiA+IEhpIEth
dGUsCj4gPgo+ID4gPiBBZGQgYSBuZXcgZHJpdmVyIGZvciBTb255IGlteDQ3MSBjYW1lcmEgc2Vu
c29yLiBJdCBpcyBiYXNlZCBvbgo+ID4gPiBKaW1teSBTdSA8amltbXkuc3VAaW50ZWwuY29tPiBp
bXBsZW1lbnRhdGlvbiBhbmQgdGhlIGRyaXZlciBjYW4gYmUgZm91bmQKPiA+ID4gaW4gdGhlIGZv
bGxvd2luZyBVUkwuCj4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9pcHU2LWRyaXZlcnMv
Y29tbWl0cy9tYXN0ZXIvZHJpdmVycy9tZWRpYS9pMmMvaW14NDcxLmMKPiA+ID4KPiA+ID4gVGhp
cyBzZW5zb3IgY2FuIGJlIGZvdW5kIG9uIExlbm92byBYMSBDYXJib24gRzE0LCBYOS0xNCBhbmQg
WDktMTUgbGFwdG9wcwo+ID4gPiBhbmQgaXQgaXMgYSBwYXJ0IG9mIElQVTcgc29sdXRpb24uIFRo
ZSBkcml2ZXIgd2FzIHRlc3RlZCBvbiBMZW5vdm8gWDEKPiA+ID4gQ2FyYm9uIEcxNCwgWDktMTQg
YW5kIFg5LTE1IGxhcHRvcHMuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEthdGUgSHN1YW4g
PGhwYUByZWRoYXQuY29tPgo+ID4gPiAtLS0KPiA+Cj4gPiAuLi4KPiA+Cj4gPiA+ICtzdGF0aWMg
Y29uc3QgY2hhciAqIGNvbnN0IGlteDQ3MV9zdXBwbHlfbmFtZVtdID0gewo+ID4gPiArICAgICAg
ICJhdmRkIiwKPiA+ID4gK307Cj4gPgo+ID4gQXMgd2UgZGlzY3Vzc2VkIGluIHRoZSBsYXN0IHJl
dmlzaW9uLCB0aGlzIHNob3VsZCBiZSAidmFuYSIgaW5zdGVhZCBvZiAiYXZkZCIuCj4gPiBCZXR0
ZXIgdG8gdXNlIHRoZSByZWd1bGF0b3IgbmFtZSBhcyBkZWZpbmVkIGluIHRoZSBkYXRhc2hlZXQu
Cj4KPiAiYXZkZCIgaXMgZXhwb3NlZCBieSBJTlQzNDcyLiBJZiBpdCB3YXMgY2hhbmdlZCB0byAi
dmFuYSIsIHRoZSBkcml2ZXIgY29tcGxhaW5lZAo+IFsgIDIwNS44Mzk1OTldIGlteDQ3MSBpMmMt
U09OWTQ3MUE6MDA6IHN1cHBseSB2YW5hIG5vdCBmb3VuZCwgdXNpbmcKPiBkdW1teSByZWd1bGF0
b3IKPiBbICAyMDUuODU0ODIxXSBpbXg0NzEgaTJjLVNPTlk0NzFBOjAwOiBFcnJvciByZWFkaW5n
IHJlZyAweDAwMTY6IC0xMjEKPiBbICAyMDUuODU0ODMwXSBpbXg0NzEgaTJjLVNPTlk0NzFBOjAw
OiBlcnJvciAtRVJFTU9URUlPOiBmYWlsZWQgdG8gcmVhZCBjaGlwIGlkCj4gWyAgMjA1Ljg1NDgz
NF0gaW14NDcxIGkyYy1TT05ZNDcxQTowMDogZXJyb3IgLUVSRU1PVEVJTzogZmFpbGVkIHRvCj4g
ZmluZCBzZW5zb3I6IC0xMjEKPiBbICAyMDUuODU1MzU0XSBpbXg0NzEgaTJjLVNPTlk0NzFBOjAw
OiBwcm9iZSB3aXRoIGRyaXZlciBpbXg0NzEgZmFpbGVkCj4gd2l0aCBlcnJvciAtMTIxCj4KPiBT
bywgYXZkZCBpcyBuZWNlc3NhcnkuCgpDb3VsZCB5b3UgcGxlYXNlIHRyeSBhZGRpbmcgYSBtYXBw
aW5nIGZvciBTT05ZNDcxQSBpbgppbnQzNDcyX2dwaW9fbWFwW10gaW4gZHJpdmVycy9wbGF0Zm9y
bS94ODYvaW50ZWwvaW50MzQ3Mi9kaXNjcmV0ZS5jPwoKTm90IGZ1bGx5IHN1cmUsIEkgaGF2ZSB0
byBjaGVjaywgYnV0IGhvcGVmdWxseSBpdCB3aWxsIHdvcmsuCgpCZXN0IFJlZ2FyZHMsClRhcmFu
Zw==

