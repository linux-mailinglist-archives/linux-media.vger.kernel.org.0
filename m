Return-Path: <linux-media+bounces-56440-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOENOZOhvGnZ1gIAu9opvQ
	(envelope-from <linux-media+bounces-56440-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 02:23:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC922D4A11
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 02:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA86C30BBEBA
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E0F2BEFE8;
	Fri, 20 Mar 2026 01:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Ha7vWcj7"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022130.outbound.protection.outlook.com [40.107.43.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317BB2BE034;
	Fri, 20 Mar 2026 01:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773969796; cv=fail; b=DJNRlLNLJKJvqgkNtX166rH6aHlNTrrj1lfp/6JHiOk4PZ0MobGr1prIlEvymgu5nuhnTtpyNod/tEDnkKq2VHX8eVrM8+FB8ApV3nc0/ruxGiUktNE4X/dt0+iDykj83VO4mT6id4SNsAR1R5aYlH8VqtwTKrpHjoRB4NIG8fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773969796; c=relaxed/simple;
	bh=2x5xiBMKWGnBo3yzmvkQg48IC8x2Ttbi8GjtxaQ74GE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o2bXqs3TsYaWJO3uTT8F1UpQfrsxk+9Tq8eq13c1QZYMGzcCc9MZpClbDkkdVRhvMlzLiSUpP1hC9VRQzZCaWShiNrVC4M5tLlJUEuf/By1sUafJwwbrAthhrzs5oDq22gNNm0ICNq2rUjcDUY6RHhVsb40SYzexkRKiiJoHfZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Ha7vWcj7; arc=fail smtp.client-ip=40.107.43.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCTbYDYyKX+D88CrcWjs78HeOmFEa/AYxbobyIQSReOvs6CEeqSvyaz1GfGmPUWTz1l58bKOL606/I8UoaQQ3IB30SZU5Lp12mzu/H4pHFEBnXYI83EwAUZH1qXo7/hzLtIL9wELIdnDPHyccSHFF60npVFbr+EY0jKX9W7Zdmx8jIWlYC0iPIRrdM5bo7XlQ6hPRZenk5yGaGTRFrbeW+L0wdL2RuVzfplBbCdX+Q5pfMLtZIL2dbZt4/aBcLpAujvnkDlTgW4nVd5jbPxV9vaYkrwAWz/vwCWbN26w4Ki5/T+jKGu2dqJlmI/5yDXLOFxXPGiI5++BTA01sFMjPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2x5xiBMKWGnBo3yzmvkQg48IC8x2Ttbi8GjtxaQ74GE=;
 b=tilh7UxtWL6WT60VB3Vy9FxoKQEyAfWgTbXDhkbnE9rjs79feC3J/BmmPVRtJ7IOYM4xs9Mi4SZCE3ip7HbatSr4fgzOwq/CUmllqdH4Z3Ynro/molrF0oH6HE5/zrT0SY9uHWBZzhpRPXowuo4zLZXbjPAt70odgx4WC6NxF2sRP+BpJR81lwc15g821xoAsEw/voYPIeIhydkEB/eEHxhZfRZfdkPeMpSY3ruMBz4Y7OD+/quCdQeYrok4JJzuAvF84PyhcfB0EUWhh2Akszxxi0tIoR5XwC3MHQRIA/O8a1u1A5IpMmCfOxpgeZP1q90I7VOIVffNDK8fpI/zcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2x5xiBMKWGnBo3yzmvkQg48IC8x2Ttbi8GjtxaQ74GE=;
 b=Ha7vWcj78nTSQ1mx0/3g2G2aImFfXrY9j+ayxtDrtp36a/6o6ygeNQNKFo9VbXvkjO1KK9ycNY1PGZUZKOUYVcTRfuW2H473LHo576ph6MOJYX1TogbhXStalxyonMWM/hbw3kgeacSSd48J0guYgvmKSXWQv5du7uCdfF4plgE=
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::14)
 by PU4P216MB2290.KORP216.PROD.OUTLOOK.COM (2603:1096:301:131::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.22; Fri, 20 Mar
 2026 01:23:10 +0000
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::31e3:e5:b0a4:2f2f]) by PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::31e3:e5:b0a4:2f2f%4]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 01:23:09 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>
Subject: RE: [PATCH v0 2/3] media: chips-media: wave5: Support CBP profile
Thread-Topic: [PATCH v0 2/3] media: chips-media: wave5: Support CBP profile
Thread-Index: AQHct2HB8OoboXpSEUad+EELARE8Y7W1yj4AgADXAtA=
Date: Fri, 20 Mar 2026 01:23:09 +0000
Message-ID:
 <PU4P216MB11491F8F792A075D77749805ED4CA@PU4P216MB1149.KORP216.PROD.OUTLOOK.COM>
References: <20260319053210.90-1-jackson.lee@chipsnmedia.com>
	 <20260319053210.90-3-jackson.lee@chipsnmedia.com>
 <5d1cf57fcfa10d224b05f6f1fe5bb33979dce750.camel@collabora.com>
In-Reply-To: <5d1cf57fcfa10d224b05f6f1fe5bb33979dce750.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU4P216MB1149:EE_|PU4P216MB2290:EE_
x-ms-office365-filtering-correlation-id: acf62ede-c784-458e-e3ac-08de861f3f37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 cyLFuTi8GlC8LlhL63H6iiie5Vpmxf48NBqMnc6kGwWVgw8Y/kp/tkVzZ0pjzGBiLGY6zhMphmrKNGVuS6dxpSrdzZ6e0+aXdyTsQIAghn71LGP+63qNh4iwN/MvD5Urjfmw+LZwYPRpBRAtXxsqZrKbw7QSAgbuZz9XtBTF/3Ol6vjjUhTIlF8Tv9hroZWQOAsrZCQaPRN2QlhcMvFfk+T+R6FYbl/F+GCMqx8Rn00G9yWGqQIiFgE+Dx66F/sK10z+HWlwxlD+/oL4RJXs8XSyFuKgTWcjGMm0XSSmLqBY0ODp/h3BJcZX6IYoRn1BSBDhFt/9RgYRP4WXedrVgm6ffC7pEtcsG6/uIvfz0RGTcmMNuCN4dQ+Smuad4MHPfd90bQEYvlVHn4PlgFEnpgU4M6BNkn/LDOnjHBkoXAIL+OYdfcelOe3FILsE/CnP63QczFmviHxzkMYm5jsVFNJn4grUtymkaWlO7ylDklUhuFBpYzym6UNqQQej6Ou2HYnoQMq9yBaWJjbniEC9i9RDhCs6sqpCwoIhpbPFpluvBBvne7GxWrL8jyb2YKisBbQJ1hHAdYw3ecbZx3Va8MMPlIoNZCfh+EbuUCMV3F/ArDUA9UZXpQPi4nYjAF0FDN/J0gjrjTtS7hM3f3PO66JI6i5JLcCdMuyr6n1skVG62bE//cEKPCHTMSCUIDJlmyw6B5L1yn/LirE3LpiH1t4chYN1wMcgfJNwHzCnE7I7+pUmE44/o04pOBUOP6/qrL9ohakd5+Py1Q0QKcQ71bjOUNwjxe7o0kWlW9vEvWE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1149.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MEtPN002VGdhZ0lJVC9oTkJGbXh3NHYvNE0vT0ZyN2M3ZlVHQXJSNjNqelVz?=
 =?utf-8?B?L3luVmFUNUJMSWVndjVQMWZ2bFNXUE1Yckl1RjFQd2ZKUW5yVGdpT1NhL3VQ?=
 =?utf-8?B?c0xualRFbmxQdnFib3R1TDQ1ODFWakU1S1lIWHVTUWtBUHRaUDVWcDI1SlZG?=
 =?utf-8?B?aXAzamhPSXRpWkdnb0V3c083RFJHajhYakJmck1FZlFiRTFsNHhGNjd0TWNV?=
 =?utf-8?B?bHZWQktBKzlyUm5Od2N3R2hlVGl3cnV2TzZPMHFQWmhtajBWdmZaSyt3dTZX?=
 =?utf-8?B?L1ZDNjJuL3JSWmpNRVpWdnZCR1VURE90UVU1RWpMVW5CeWk1VXlFZXorNlV1?=
 =?utf-8?B?MUd6UVJqNVpqSko5K0RnKzNCT3pIL2lyUTNsZklwNFBHRnJJQ2ZPQVQrcmdx?=
 =?utf-8?B?cDBGMnpxSEtJWDlGdE5TV2FJODZOZDVBbExhOTZseHZZMnZwQThJclFvdG80?=
 =?utf-8?B?ejBGc1IvRGJ0N2QrQ2IyS1I4T3pvNk13Y0k4TVBSb1locWJZZFErd2xjVkpj?=
 =?utf-8?B?Y1dOSEhBVjhXY2w2MGRDM2U0aU9WdEZqblF1UGhlV29vMHhiRi8rK3Bqb0t2?=
 =?utf-8?B?V00vQU04ejJwUmhRL1Q1eU5PMzR6OU9pMDFFbXhUZjBTaVVISFNUc1YyLzZX?=
 =?utf-8?B?aW9PcThocCtncysrT01hanFmNHNmaWlEU0tuemhSVEdqczVNZ3hHSlVDS1ZH?=
 =?utf-8?B?M3N6bW94a3VxYjFSZHNMbFN6N1lHQUppMnhzS2h3YVlBSXBocGlFVDJncGVq?=
 =?utf-8?B?K3ZhYTNQQ2dXR0lBaHg5MDQ5YlI5eWgwMUZkSmY5a1F6aGc3TTkvbWFrNCtw?=
 =?utf-8?B?RTRsVWtzWThHVTM3NU5OUnc2Tmh5RHE4bi9ocHNaMkRsck13eEREREhUZW5H?=
 =?utf-8?B?K1ZGTFN0bEhvR0hyUzYrVlUwcDIrZHJLNW1La1c0QmxSQTkxY3F0ai9FS2Nq?=
 =?utf-8?B?bHYxaGwzQ1FPcDZNTDR0UVFWM1VuOEdMazFyd0dGYm5LMWVvbGxMd2wwUkxY?=
 =?utf-8?B?bTdFajBOK2lRVXVmbWJrOVI4NHJ0YU9pZithbmpLVDNvVFZTNVR0T2RtS3Br?=
 =?utf-8?B?YlhPRzFBVWp2WmJzbEpUdmF1MHhtQTVtRW16K29uVFlzRng4c0RXYVpLb2pG?=
 =?utf-8?B?RGc0Zk50cnR0ZUhOWncvUUUvVnkrazkvdFlnMmk1L0ZhQjZNVk5KU1VPbVZx?=
 =?utf-8?B?V3FQY01OMFFidzJWeGZtT0JtSENWdnlZTGkxUzlhN1YzN1lGRE1iRXBnbVds?=
 =?utf-8?B?b25CS3NUai9scWRCeWIxMUZ5ZUdoZDN5Sm9DeU5sd2ZscWJLczNHK1J2K2ti?=
 =?utf-8?B?aG50b1lsMG8zZERQejhXWVlOTk1PdHBURDFHbHowaVYxdWl6aUQ0d0lXQ0xt?=
 =?utf-8?B?WVRZdWFpN3cwbm5zSHdhVXJBeXdES3g0TXkxK3ZIbGViUjVFRUd0emlyR2VC?=
 =?utf-8?B?cjdnVDBGelM5V2QvN1NJNWFrc1NTOWhZTURJYWJWc1hnVjRPbDhWWE1NYy90?=
 =?utf-8?B?bWdRSlBiUzBFZlRsSWNYR2p1WmRxUXozWHZpRExRRmhsN1dMWTBwQ3V6V2s4?=
 =?utf-8?B?b1ZrcUtWbzFJRHg4Qmp5NXpjY2Z5dDRueWVsTWJlTWhrTFlVVTE5eWdXcmxB?=
 =?utf-8?B?MHR5VjhQK29tdXF5Rm92VVAveURCWVo1QkJrdHdLcEVKelcrcWpiUWNaYVFq?=
 =?utf-8?B?UEpKa1FQOUZQR1BFUHJrREtEdVV0bzluQjFuVWxaVWRFeERRakIweGhERFRY?=
 =?utf-8?B?aFV4OU9tWDh6NFRzOS9QdnU3WThCcGRhdzlSZUx4NUVDTytLSFhTbDJoZFIw?=
 =?utf-8?B?RUE1OUZ0V2FDa1diQ2RkaGpGUm1OdFQrMHpwbG9qUXB1MTFGM2xvYmRPS2JF?=
 =?utf-8?B?dnEzVjJkdmpkb0cwbENCeCtadGVsMkFPeW1XNWloU29JNnZyYzIxMXNPNy8r?=
 =?utf-8?B?bnp0ZnhkQ3l3c1FCMUl3T2xFN1Z5YVl5Q0ZiSUF3QnRjQmphN3JtbUg3ZGI4?=
 =?utf-8?B?NVR4dHAyTFdKMDZDUGkxamxLSGxCRDJaeUhtMXEvMFoxaFoxSzVIWTZDZEk5?=
 =?utf-8?B?YllCMXlTS3VYUmRWbm5ESGtuM3pWcjNydmhVN0ZmUUtROWl1emJMRXQzaXNX?=
 =?utf-8?B?UXErMVpnc2N2OWlTYjdnbUQ5TnBoMDBoWjdNMEdxRmxoV3VzcmxoUDdNVzBx?=
 =?utf-8?B?TDVMUVRyLzRKYW5aaS8rRzBxVWFOdWFiaExpckh6SzJ4OTVtc2JXNzlHemlw?=
 =?utf-8?B?N0JLdE4wek1pVnNyaVdlTUUrRDBtWU9yZG82aXlGd0kyWHhPOWN2eXdzT0xk?=
 =?utf-8?B?ejg1cG1SakoxY0pWcjBQaFJlYjRWV1ZFeTEwQ2JGZXluaklhUzZLZz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: acf62ede-c784-458e-e3ac-08de861f3f37
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 01:23:09.5738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i8e7bQslWnnlj1eojMLcQdjVpmQDalIdRjLAfGHd0nZzba5f9AO6z1AkP6JH96RdnIf0yUfs+vrfPgtiXRk6s+XqnU4MImYcephX/9wk1u4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB2290
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56440-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,kernel.org,xs4all.nl];
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
	NEURAL_HAM(-0.00)[-0.927];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xs4all.nl:email,lafley.kim:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:email,collabora.com:email]
X-Rspamd-Queue-Id: 4AC922D4A11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTmljb2xhcw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5pY29s
YXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT4NCj4gU2VudDogVGh1
cnNkYXksIE1hcmNoIDE5LCAyMDI2IDk6MzMgUE0NCj4gVG86IGphY2tzb24ubGVlIDxqYWNrc29u
LmxlZUBjaGlwc25tZWRpYS5jb20+OyBtY2hlaGFiQGtlcm5lbC5vcmc7DQo+IGh2ZXJrdWlsLWNp
c2NvQHhzNGFsbC5ubDsgYm9iLmJlY2tldHRAY29sbGFib3JhLmNvbQ0KPiBDYzogbGludXgtbWVk
aWFAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsYWZsZXku
a2ltDQo+IDxsYWZsZXkua2ltQGNoaXBzbm1lZGlhLmNvbT47IGItYnJuaWNoQHRpLmNvbTsgaHZl
cmt1aWxAeHM0YWxsLm5sOyBOYXMNCj4gQ2h1bmcgPG5hcy5jaHVuZ0BjaGlwc25tZWRpYS5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjAgMi8zXSBtZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1
OiBTdXBwb3J0IENCUCBwcm9maWxlDQo+IA0KPiBIaSBKYWNrc29uLA0KPiANCj4gTGUgamV1ZGkg
MTkgbWFycyAyMDI2IMOgIDE0OjMyICswOTAwLCBKYWNrc29uLmxlZSBhIMOpY3JpdMKgOg0KPiA+
IEZyb206IEphY2tzb24gTGVlIDxqYWNrc29uLmxlZUBjaGlwc25tZWRpYS5jb20+DQo+ID4NCj4g
PiBDb25zdHJhaW5lZCBCYXNlbGluZSBQcm9maWxlIChDQlApIGFuZCBCYXNlbGluZSBQcm9maWxl
IChCUCkgaGF2ZSBiZWVuDQo+ID4gdHJlYXRlZCBhcyB0aGUgc2FtZS4NCj4gPiBJbnRyb2R1Y2Ug
dGhlIGFiaWxpdHkgdG8gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIHRoZSB0d28uDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBKYWNrc29uIExlZSA8amFja3Nvbi5sZWVAY2hpcHNubWVkaWEuY29tPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IE5hcyBDaHVuZyA8bmFzLmNodW5nQGNoaXBzbm1lZGlhLmNvbT4N
Cj4gDQo+IFNob3VsZCB3ZSBjb25zaWRlciB0aGlzIG9uZSBoYXMgYSBidWcgZml4ID8gSSBzdXNw
ZWN0IHByZXZpb3VzbHkNCj4gY29uc3RyYWludF9zZXQxX2ZsYWcgd2FzIG5ldmVyIHNldCBpbiB0
aGUgYml0c3RyZWFtLCBhbmQgbm93IGl0IGlzIHNldA0KPiBhY2NvcmRpbmdseSB0byB0aGUgc2Vs
ZWN0ZWQgcHJvZmlsZSwgd2hpY2ggZml4ZXMgYSBtaXNzLW1hdGNoIG9mIHVzZXINCj4gZXhwZWN0
YXRpb24gdnMgYml0c3RyZWFtIHZhbHVlcy4gSWYgeW91IGFncmVlIHdpdGggdGhpcywgYSBGaXhl
czogdGFnDQo+IHdvdWxkIGJlIG5pY2UuDQo+IA0KDQoNCkkgd2lsbCBhZGQgdGhlICJGaXhlcyIg
dGFnLg0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KSmFja3Nvbg0KDQoNCj4gPiAtLS0NCj4g
PiDCoGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtaHcuY8Kg
wqDCoCB8wqAgMyArKysNCj4gPiDCoC4uLi9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZl
NS93YXZlNS12cHUtZW5jLmPCoMKgIHwgMTANCj4gPiArKysrKysrLS0tDQo+ID4gwqAuLi4vbWVk
aWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1YXBpLmjCoMKgwqAgfMKgIDEg
Kw0KPiA+IMKgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVk
aWEvd2F2ZTUvd2F2ZTUtaHcuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1t
ZWRpYS93YXZlNS93YXZlNS1ody5jDQo+ID4gaW5kZXggYzUxNmQxMjVmNTUzLi4yMzkyYmNlOGQ4
NDAgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93
YXZlNS93YXZlNS1ody5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1t
ZWRpYS93YXZlNS93YXZlNS1ody5jDQo+ID4gQEAgLTE3NjMsNiArMTc2Myw5IEBAIGludCB3YXZl
NV92cHVfZW5jX2luaXRfc2VxKHN0cnVjdCB2cHVfaW5zdGFuY2UNCj4gKmluc3QpDQo+ID4gwqAJ
CQkocF9wYXJhbS0+c2tpcF9pbnRyYV90cmFucyA8PCAyNSkgfA0KPiA+IMKgCQkJKHBfcGFyYW0t
PnN0cm9uZ19pbnRyYV9zbW9vdGhfZW5hYmxlIDw8IDI3KSB8DQo+ID4gwqAJCQkocF9wYXJhbS0+
ZW5fc3RpbGxfcGljdHVyZSA8PCAzMCk7DQo+ID4gKwllbHNlIGlmIChpbnN0LT5zdGQgPT0gV19B
VkNfRU5DKQ0KPiA+ICsJCXJlZ192YWwgfD0gKHBfcGFyYW0tPmNvbnN0cmFpbnRfc2V0MV9mbGFn
IDw8IDI5KTsNCj4gPiArDQo+ID4gwqAJdnB1X3dyaXRlX3JlZyhpbnN0LT5kZXYsIFc1X0NNRF9F
TkNfU0VRX1NQU19QQVJBTSwgcmVnX3ZhbCk7DQo+ID4NCj4gPiDCoAlyZWdfdmFsID0gKHBfcGFy
YW0tPmxvc3NsZXNzX2VuYWJsZSkgfCBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LXZwdS1lbmMuYw0KPiA+IGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHUtZW5jLmMNCj4gPiBpbmRl
eCA2ZmUwMTIxNzIzM2YuLmYzMTVlZDcyNDNhNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LXZwdS1lbmMuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1LWVuYy5j
DQo+ID4gQEAgLTkzOSw2ICs5MzksOCBAQCBzdGF0aWMgaW50IHdhdmU1X3ZwdV9lbmNfc19jdHJs
KHN0cnVjdCB2NGwyX2N0cmwNCj4gKmN0cmwpDQo+ID4gwqAJCWNhc2UgVjRMMl9NUEVHX1ZJREVP
X0gyNjRfUFJPRklMRV9DT05TVFJBSU5FRF9CQVNFTElORToNCj4gPiDCoAkJCWluc3QtPmVuY19w
YXJhbS5wcm9maWxlID0gSDI2NF9QUk9GSUxFX0JQOw0KPiA+IMKgCQkJaW5zdC0+Yml0X2RlcHRo
ID0gODsNCj4gPiArCQkJaWYgKGN0cmwtPnZhbCA9PQ0KPiBWNEwyX01QRUdfVklERU9fSDI2NF9Q
Uk9GSUxFX0NPTlNUUkFJTkVEX0JBU0VMSU5FKQ0KPiA+ICsJCQkJaW5zdC0+ZW5jX3BhcmFtLmNv
bnN0cmFpbnRfc2V0MV9mbGFnID0gMTsNCj4gPiDCoAkJCWJyZWFrOw0KPiA+IMKgCQljYXNlIFY0
TDJfTVBFR19WSURFT19IMjY0X1BST0ZJTEVfTUFJTjoNCj4gPiDCoAkJCWluc3QtPmVuY19wYXJh
bS5wcm9maWxlID0gSDI2NF9QUk9GSUxFX01QOyBAQCAtMTIxNCw5DQo+ICsxMjE2LDExIEBADQo+
ID4gc3RhdGljIGludCB3YXZlNV9zZXRfZW5jX29wZW5wYXJhbShzdHJ1Y3QgZW5jX29wZW5fcGFy
YW0gKm9wZW5fcGFyYW0sDQo+ID4gwqAJCQlvcGVuX3BhcmFtLT53YXZlX3BhcmFtLmRlY29kaW5n
X3JlZnJlc2hfdHlwZSA9DQo+IERFQ19SRUZSRVNIX1RZUEVfSURSOw0KPiA+IMKgCQkJb3Blbl9w
YXJhbS0+d2F2ZV9wYXJhbS5pbnRyYV9wZXJpb2QgPQ0KPiBpbnB1dC5hdmNfaWRyX3BlcmlvZDsN
Cj4gPiDCoAkJfQ0KPiA+IC0JfSBlbHNlIHsNCj4gPiArCX0gZWxzZSBpZiAoaW5zdC0+c3RkID09
IFdfQVZDX0VOQykNCj4gPiArCQlvcGVuX3BhcmFtLT53YXZlX3BhcmFtLmNvbnN0cmFpbnRfc2V0
MV9mbGFnID0NCj4gaW5wdXQuY29uc3RyYWludF9zZXQxX2ZsYWc7DQo+ID4gKwllbHNlDQo+ID4g
wqAJCW9wZW5fcGFyYW0tPndhdmVfcGFyYW0uYXZjX2lkcl9wZXJpb2QgPSBpbnB1dC5hdmNfaWRy
X3BlcmlvZDsNCj4gPiAtCX0NCj4gDQo+IG5pdDogSnVzdCBrZWVwIHRoZSBicmFja2V0LCBzbyB0
aGF0IGFsbCBicmFuY2hlcyBoYXZlIGJyYWNrZXRzLg0KPiANCj4gY2hlZXJzLA0KPiBOaWNvbGFz
DQo+IA0KPiA+ICsNCj4gPiDCoAlvcGVuX3BhcmFtLT53YXZlX3BhcmFtLmVudHJvcHlfY29kaW5n
X21vZGUgPQ0KPiBpbnB1dC5lbnRyb3B5X2NvZGluZ19tb2RlOw0KPiA+IMKgCW9wZW5fcGFyYW0t
PndhdmVfcGFyYW0ubG9zc2xlc3NfZW5hYmxlID0gaW5wdXQubG9zc2xlc3NfZW5hYmxlOw0KPiA+
IMKgCW9wZW5fcGFyYW0tPndhdmVfcGFyYW0uY29uc3RfaW50cmFfcHJlZF9mbGFnID0NCj4gPiBp
bnB1dC5jb25zdF9pbnRyYV9wcmVkX2ZsYWc7IEBAIC0xNjg3LDcgKzE2OTEsNyBAQCBzdGF0aWMg
aW50DQo+IHdhdmU1X3ZwdV9vcGVuX2VuYyhzdHJ1Y3QgZmlsZSAqZmlscCkNCj4gPiDCoAkJCcKg
IC02LCA2LCAxLCAwKTsNCj4gPiDCoAl2NGwyX2N0cmxfbmV3X3N0ZCh2NGwyX2N0cmxfaGRsLCAm
d2F2ZTVfdnB1X2VuY19jdHJsX29wcywNCj4gPiDCoAkJCcKgIFY0TDJfQ0lEX01QRUdfVklERU9f
SDI2NF84WDhfVFJBTlNGT1JNLA0KPiA+IC0JCQnCoCAwLCAxLCAxLCAxKTsNCj4gPiArCQkJwqAg
MCwgMSwgMSwgMCk7DQo+ID4gwqAJdjRsMl9jdHJsX25ld19zdGQodjRsMl9jdHJsX2hkbCwgJndh
dmU1X3ZwdV9lbmNfY3RybF9vcHMsDQo+ID4NCj4gCcKgIFY0TDJfQ0lEX01QRUdfVklERU9fSDI2
NF9DT05TVFJBSU5FRF9JTlRSQV9QUkVESUNUSU9OLA0KPiA+IMKgCQkJwqAgMCwgMSwgMSwgMCk7
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2
ZTUvd2F2ZTUtdnB1YXBpLmgNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVk
aWEvd2F2ZTUvd2F2ZTUtdnB1YXBpLmgNCj4gPiBpbmRleCBkYzMxNjg5ZTBkMjcuLjdiMDhmZWY1
ODIxNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NoaXBzLW1lZGlh
L3dhdmU1L3dhdmU1LXZwdWFwaS5oDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9j
aGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHVhcGkuaA0KPiA+IEBAIC01NzAsNiArNTcwLDcgQEAg
c3RydWN0IGVuY193YXZlX3BhcmFtIHsNCj4gPiDCoAl1MzIgdHJhbnNmb3JtOHg4X2VuYWJsZTog
MTsgLyogZW5hYmxlIDh4OCBpbnRyYSBwcmVkaWN0aW9uIGFuZCA4eDgNCj4gdHJhbnNmb3JtICov
DQo+ID4gwqAJdTMyIG1iX2xldmVsX3JjX2VuYWJsZTogMTsgLyogZW5hYmxlIE1CLWxldmVsIHJh
dGUgY29udHJvbCAqLw0KPiA+IMKgCXUzMiBmb3JjZWRfaWRyX2hlYWRlcl9lbmFibGU6IDE7IC8q
IGVuYWJsZSBoZWFkZXIgZW5jb2RpbmcgYmVmb3JlDQo+ID4gSURSIGZyYW1lICovDQo+ID4gKwl1
MzIgY29uc3RyYWludF9zZXQxX2ZsYWc6IDE7IC8qIGVuYWJsZSBDQlAgKi8NCj4gPiDCoAl1MzIg
YmdfZGV0ZWN0aW9uOiAxOyAvKiBlbmFibGUgYmFja2dyb3VuZCBkZXRlY3Rpb24gKi8NCj4gPiDC
oH07DQo+ID4NCg==

