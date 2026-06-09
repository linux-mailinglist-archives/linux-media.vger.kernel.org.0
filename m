Return-Path: <linux-media+bounces-64258-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EG+zJQpfJ2pFvQIAu9opvQ
	(envelope-from <linux-media+bounces-64258-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 02:32:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7C365B5AF
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 02:32:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=Bl8vw6LS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64258-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64258-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F60A30262D3
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 00:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB71215075;
	Tue,  9 Jun 2026 00:31:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021095.outbound.protection.outlook.com [40.107.42.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B256A2367DF;
	Tue,  9 Jun 2026 00:31:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780965074; cv=fail; b=Y+9yWCJhcYUj2rvOfWw94fMqMy01tReuOQLuDnR1SUTrPMYfftwM43JTwKC0vWOC+/1cuAWOABEd2LJ4sMJZjumyIPwJOuFywgFVkOS7OkTXBvJoLP42fTwG6pDhcSGEGVdhH4Sra4uWb7UZS5zO8z2WF/0AmPxoysTkhdt7U2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780965074; c=relaxed/simple;
	bh=faCk8NVh6N2dkCxz0FmcDrUEXG6x35xxr/jW0louAfw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ax0GdkHZ0nMtaoY61D+r6ZbGh9GEZSFQz20Vi955RKVNYgDT8OKbe1Dq6CqnG8IeRDGRal37Aneh/t1kgPbZf27DH3yozf2jg4f/LHAtCO4Mm3k40ST43bw6X2iCn2ZCMEaU7PN5SdDpKfotIaBvkp7gAr1xE+PfJ1z1+Orj6lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Bl8vw6LS; arc=fail smtp.client-ip=40.107.42.95
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPK8UmOAC6Fc15yIBkvsDZHhA7it4K6XN8osnxgqXBK8X3wHzvXdwVCdFhYDm+NRQhwThHhglY4s1POXsoBgDsJgMkS5aUBx0z8DUXiB8Jh+b8bUVBs4jRBWQGhuieMbXcNy9+RsK+lUE98tdbxtBtKdXR4pKTbA+3cFYIKcExsWRZIJf33gJYQ9/6HZiRx0Ubt4N/y1T6a97DftEH50OlMtFsJ6p2WaXkB4ilGKsNPEZPZr2DWmImzh1e9jVi2wAo7dj5KHkMzN8Jo+WKZ6+lTRSEEAJ0I9Kv9JkwwNfOwrMB4wuRYDDMNUjlcbhXPfxB+n6/Mz3JQ+8vIEyMOYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faCk8NVh6N2dkCxz0FmcDrUEXG6x35xxr/jW0louAfw=;
 b=H2S/xSApm5bmcyrHKlp+xHC6ecsZMCun4oP8bi8E5kIF/xrlmOU9oS0y48AC4Eyg826Rg8CFVAmVN+mSRTUQT5b9qw9rum70tkeG6GHMQPMfUVimzloJInWHEwBRZL+5paFSZc4VlFYc3RYA3BNm3K7wxBtXkrxY3s2DaZG6Cxcxpvt4rZjB0pWlBnNVJTSjDqkJDAbc9g17d+yfGu8n7nu1EszVLBiBwMwtNytxZqfMD3Grd9EMWlII56c2YWuT8SZ1YoEx98B/QE2teTfVTJlZi019IRNHJIca9E8s9SOSw3vsNuB/cbXnB5bmkDA5zq+kZps3vTA9nSYE/QdC1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faCk8NVh6N2dkCxz0FmcDrUEXG6x35xxr/jW0louAfw=;
 b=Bl8vw6LSlxfnWfniQ0RW0I+SKIUfCx6N+S/wajZQQKCoafhsaEnTp47vjP723vSQ0LJ4uZt12J1Z3o/gXO73DMOv5W/ZR3BBplkP31P5C2tqHg13CNTpL207JqvS8m4zEVdzutKrNtxYimEzYdgTyr8mI1MXJJbhkNnPu61hVlI=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE2P216MB2950.KORP216.PROD.OUTLOOK.COM (2603:1096:101:291::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Tue, 9 Jun 2026 00:31:08 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 00:31:08 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Brandon Brnich <b-brnich@ti.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas
 Chung <nas.chung@chipsnmedia.com>
Subject: RE: [PATCH v0 0/4] bug fixes
Thread-Topic: [PATCH v0 0/4] bug fixes
Thread-Index: AQHc88YkZrUnrhwm0EmQaoCd51Efs7Y0uykAgACrSjA=
Date: Tue, 9 Jun 2026 00:31:08 +0000
Message-ID:
 <SLXP216MB1148C7C5EBC8DBBC19AF9881ED1D2@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20260604020155.77-1-jackson.lee@chipsnmedia.com>
 <06f8d2b9-89f3-4951-a001-9a89149ae315@ti.com>
In-Reply-To: <06f8d2b9-89f3-4951-a001-9a89149ae315@ti.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|SE2P216MB2950:EE_
x-ms-office365-filtering-correlation-id: 084eccc7-7ef0-4dc0-9566-08dec5be662a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|4143699003|56012099006|38070700021|6133799003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 OYx/JVlMR522COrD53ISzC4yLPk2UCtVwoQdTYt5nfOcdda6XZxOAzqF3ZAucMFgv1skD4elYjJ0nPaa3AOvI5998VADaP7BLVwN8kZfNgtbUX/Uwts3oYplk5Ur9B37QRvp8L9v73DqOdAFBu85sm0tFvEezk1tp6KUOiQUp5sl7pqfya06WuigF5vSsQU0OTHuOM/tMsuNzc+VeNvTuARzgCPB6rLNtrhGqJE25VcdoBbdT7r+WxuDZ/0FJbnjAy9GrBke48/WRgXn9tHzC1hAWDukkCnrtMU2JeXEBfW2rg2k3ubjoOKdrzp65Q50TR0au5VCZOkef6J2AvLzcaW6RR7aoUf3Cj4wLHuJpXNqr3HyKtNx35yqz5BfHQgE+eJETXy53JNu0jLIa0aiugVwzXDysPcmnRN0sOnzK8piy4O41voyT+4Dvvto9c3gkwKtf5eO+epSRYtxmCTfbp6CyEuNfePH1nU7dEsFIUSXUIuSxnzY9JhnqbJct50tPgGxfCvvVxfpEzof+sGQS4BKpIYEizeL5dlb2HA1MOJ2DTSWz8GGvk1XgaPO0o2IDbVgsr1G1kr3pGfJd3ACD0E8jKehtFkqsAc2zXf4QAhBwYShdke9c2+ZzV1ucpKeHjM7mL+xVzMXe2pfOVpzhEC5h+VIDBe+KnLUZupzCBLt9QzELGC+RY6FmCjkfu0VovV2MJlIXvjx2tQIM6871UeN437KoE7UBcuqrqWxSc9I76I7H3KbVJbx7Mq0TpI0
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4143699003)(56012099006)(38070700021)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ejdJSXBORUsycGxzWjFmU3RkcXZMcVVwaWQzbEwwWEtFQ29TaEtJc3ltd3BX?=
 =?utf-8?B?c3VEWkx0Ymx0Z2VGRmFodm9ScEhpSC9hQlVGbTBoaDhvVXRwSG5ta0x5UlFp?=
 =?utf-8?B?QkZlNnFkK1NNMzZLSitiWWVjLzFwR1dNNkRLaFFyNDYxZVY2UDNpL3JDOEgw?=
 =?utf-8?B?YjJ2ZHhwaWlBWG0wQXM4TTQ2cm10R0hWNnNLT29YYmQ4aEo3MUw4NG5waXRR?=
 =?utf-8?B?cm5GS1NpNFQyL1NCb2lqUjh4eXo2SE1hWTZGWk93Z2FvRXZ4UlVYZXR2NWkz?=
 =?utf-8?B?S3J6SW9iM3loV0ZwMFhsQ2xUU3Bwb0JXYUlSSTlzTldBcHpDUklyVGkyRkxI?=
 =?utf-8?B?WnlyMHdGZFZ0b1BhNnBrcHpIN3VMaDNoRy8xUGhEZzE5SE45OFMrYnZtZWFQ?=
 =?utf-8?B?UTR0ZEZDd0xvSEY5bGNnaE1EUEZsM0pEeWNXSmJsMG1yVVZ4TTJBS1dYR3ZR?=
 =?utf-8?B?MHRabWk1MWVPMGNpWWxtYXRNbFFNVkpVcWtESXZtOHp2NVNWNW14NXo0dEda?=
 =?utf-8?B?MEZqTlU0WnhXcW9sOHJTdkd5SENpeUEzd3lwc1kxMlRacS9aLzZvL25kZDlk?=
 =?utf-8?B?WEU2VktYVlVPUHFBVXYyK3NvWm4yeExMYXVpRlR2NTU2M0d5czBTcmpHcUtB?=
 =?utf-8?B?RkdLWHlmZjJCdXNDQlNXNlBIV2tFZUxtVHJOK2g0OEhMSzdyQnp4NkU4Rk5q?=
 =?utf-8?B?RTNURVZUWS9NT2JScDRONHBSZUptL092aWhMQXpMQkpaK0JHR29GSkM3Nld4?=
 =?utf-8?B?MFBWOXJnNmFRcit6ZVBkUGFZTjVMSmc5ZDBYdmpqT0FkT0RtRUNsMmV4cXlH?=
 =?utf-8?B?Z0xnVzZjeUZBUDdXaUhkQ0x4STErSHlBd2hIcjd4Y1d0bVZwcjFHbjh6NHQ1?=
 =?utf-8?B?NkgvbTl1TEZ4NVhBSWNNQmZteFI1Q2Q1R0pxa095MkE4S3R0ZFpLYUJhelph?=
 =?utf-8?B?Rlpua0lRZG85eEp2b2VvS3pMZTByVHhYRGNQVWFpZUx6ek9zZVVKUG5hUHVn?=
 =?utf-8?B?K0N6alBQL1BHVkl1V1MxUWN6cU1OLzFmL1JJNU9kTmVySVZWczZGOTJsMlE1?=
 =?utf-8?B?MU9BMWJHMnkyaFNJa0ZmVjF0aDMvbTg3NFdTNmwxemFWUnJOeEs4M3FsWmF5?=
 =?utf-8?B?MDBBeEFXM2lKV1JONVk0QUk2NkIvN05tRVBGbnpZTXFUT0pDM3h0eTErOCtB?=
 =?utf-8?B?MkJDSk9yUFNoOUdDekZtWjI2WjBnc0FtNFVtV0txZENJSGo5aVBsQVFlSGJu?=
 =?utf-8?B?Zi9hZUcrQ080TjBEWFJrNXI4V281Q29rV0dsOXZyQWFHSUFqNDd3RXlEVENm?=
 =?utf-8?B?MmJjbVpLWmMwZ1d3TGNtcHk2VTlWZTdSRDhOOXNzTjR0dVZ2dkVrYWFsSyti?=
 =?utf-8?B?NWh6REdxT0RZVFJOK0dQRDcydWdqeVhwbnpPK0ZBbWc3MVNJNlJtOVFtbkND?=
 =?utf-8?B?QlFFc0p3NHErN0psbXl2Qy9UU2FyenJFOVIyL2RUV3RCZG1TQUhibndvZ0g4?=
 =?utf-8?B?LzZ5WEZiMktUcmRISkY2S1VVMzVhcUR2bVI0V0grZjVUa3JlZlhXS0w3S20z?=
 =?utf-8?B?WE10USt2UERsbnlSeDNreTZuK2NodUsrQTgyNGJKVU5PdU5lMS90UFpzczBY?=
 =?utf-8?B?WWV3eHJYNFFpVXpIaDB4VktNZGZOVjI1bDBqTnpBc0ZCTU51ZXBuRXNWSzJR?=
 =?utf-8?B?TEQvWFNYOGxyMWRwd2Z3dHRKdmY5ZTZRWmxDcldMQitJcFQvU00xYUZ0TUYx?=
 =?utf-8?B?VWlZVldaTDhQMjl0VE1welE4RDBEV0NoSmZHK1haMDc2Qkx0SjZKYzQrczZP?=
 =?utf-8?B?cElYZWtrQUZKUUZocUdZNGZWeEJkWGhTeGNCMGNWMXJqTmJZaExzZzdTNitt?=
 =?utf-8?B?R3Avelc3cml4ZVpaaXQvUWcycXRFQ1d0WFI3dktDRERsTEkxa0NqNzZIYVpO?=
 =?utf-8?B?eFFtU3ZQWlhpb2dYeS8vZ1E1L25rcHhuVzkvdUthTmlEWTVJZzhndE11QTFQ?=
 =?utf-8?B?M21GamszSUJsU0FpUWxFOFloV3I2ZjZEYjJMY2wzQWVsanRUZWpzVVE0MC9D?=
 =?utf-8?B?V3dlTHFrKzErdVBOZ0k3MUtyS1piNS9DSjI5MHNUQk1paHhrOGRYaW9BQXRS?=
 =?utf-8?B?VnhHM0hNbkhUMDVLNFpQVlNabzRMdS9QTDdKYjYySFEzWnN4eUhTNEh1emdH?=
 =?utf-8?B?cVlVanUzZE82VUdPTXFkQUQrbkZ6K2s2U1ROcWV3RlFOWmVvWGdLaVMrUjA2?=
 =?utf-8?B?RmJOUE5Nc1NRSU1yUEhoWDdNRngydWpyYXJYQ0lCN2JHUHMxbzcwcjdnYTdJ?=
 =?utf-8?B?VTRFeWVFL09jMzkxZTJ4WGlSQWFnN2krT3ZRM0pVZ1RKWmNZR29vUT09?=
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
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 084eccc7-7ef0-4dc0-9566-08dec5be662a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 00:31:08.1164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AAMrS6R7kM72UmkXWT3UjhNslSmLpX6jKOCGe1YStmgn7Phu1awdVgmzNE+kCE28+ZBQks6/xLhCrpEbijrDQIWdYcj7NNnDx8CTjZngbhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2950
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:b-brnich@ti.com,m:mchehab@kernel.org,m:hverkuil-cisco@xs4all.nl,m:nicolas.dufresne@collabora.com,m:bob.beckett@collabora.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lafley.kim@chipsnmedia.com,m:hverkuil@xs4all.nl,m:nas.chung@chipsnmedia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[ti.com,kernel.org,xs4all.nl,collabora.com];
	DMARC_NA(0.00)[chipsnmedia.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64258-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,xs4all.nl];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:from_mime,xs4all.nl:email,SLXP216MB1148.KORP216.PROD.OUTLOOK.COM:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B7C365B5AF

SGkgQnJhbmRvbg0KDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBC
cmFuZG9uIEJybmljaCA8Yi1icm5pY2hAdGkuY29tPg0KPiBTZW50OiBNb25kYXksIEp1bmUgOCwg
MjAyNiAxMToxNiBQTQ0KPiBUbzogamFja3Nvbi5sZWUgPGphY2tzb24ubGVlQGNoaXBzbm1lZGlh
LmNvbT47IG1jaGVoYWJAa2VybmVsLm9yZzsNCj4gaHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sOyBu
aWNvbGFzLmR1ZnJlc25lQGNvbGxhYm9yYS5jb207DQo+IGJvYi5iZWNrZXR0QGNvbGxhYm9yYS5j
b20NCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsgbGFmbGV5LmtpbQ0KPiA8bGFmbGV5LmtpbUBjaGlwc25tZWRpYS5jb20+OyBo
dmVya3VpbEB4czRhbGwubmw7IE5hcyBDaHVuZw0KPiA8bmFzLmNodW5nQGNoaXBzbm1lZGlhLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MCAwLzRdIGJ1ZyBmaXhlcw0KPiANCj4gSGkgSmFj
a3NvbiwNCj4gDQo+IE9uIDYvMy8yNiAyMTowMSwgSmFja3Nvbi5sZWUgd3JvdGU6DQo+ID4gRnJv
bTogSmFja3NvbiBMZWUgPGphY2tzb24ubGVlQGNoaXBzbm1lZGlhLmNvbT4NCj4gPg0KPiA+IEEg
ZmV3IGluZGVwZW5kZW50IGZpeGVzIGZvciB0aGUgV2F2ZTUgVlBVIGRyaXZlciwgY292ZXJpbmcg
ZGVjb2RlDQo+ID4gc2V0dXAsIG0ybSBzY2hlZHVsaW5nIGFuZCBzdG9wX3N0cmVhbWluZyByb2J1
c3RuZXNzLg0KPiANCj4gVGhpcyBzZXJpZXMgYXBwZWFycyB0byBmaXggc29tZSBpc3N1ZXMgaW4g
djRsMi1jb21wbGlhbmNlIHJlcG9ydCwgY2FuIHlvdQ0KPiBhZGQgdGhlIHVwZGF0ZWQgcmVwb3J0
IGluIHRoZSBuZXh0IGl0ZXJhdGlvbiBvZiB0aGlzIHNlcmllcyB0byBtYWtlIHN1cmUNCj4gZXZl
cnl0aGluZyBpcyBub3cgZml4ZWQgd2l0aCBsYXRlc3QgdjRsMi1jb21wbGlhbmNlIHRhZz8NCg0K
SSdsbCBhZGQgdGhlIHRlc3QgcmVwb3J0IGluIHRoZSBuZXh0IHZlcnNpb24gb2YgdGhlIHBhdGNo
IHNlcmllcy4NCg0KVGhhbmtzDQoNCg0KPiANCj4gQmVzdCwNCj4gQnJhbmRvbg0KPiANCj4gPg0K
PiA+IEphY2tzb24gTGVlICg0KToNCj4gPiAgICBtZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1OiBH
dWFyZCBiaXQgZGVwdGggY2hlY2sgd2l0aA0KPiA+ICAgICAgaW5pdGlhbF9pbmZvX29idGFpbmVk
DQo+ID4gICAgbWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZlNTogU2V0IGluc3QtPnN0ZCBkdXJpbmcg
ZGVmYXVsdCBmb3JtYXQNCj4gPiAgICAgIGluaXRpYWxpemF0aW9uDQo+ID4gICAgbWVkaWE6IGNo
aXBzLW1lZGlhOiB3YXZlNTogYXZvaWQgc2tpcHBpbmcgZGV2aWNlX3J1biB3aGlsZSBWUFUgaGFz
DQo+ID4gICAgICB3b3JrDQo+ID4gICAgbWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZlNTogQWRkIGlu
dGVycnVwdCB0aW1lb3V0IHdoaWxlDQo+ID4gc3RvcF9zdHJlYW1pbmcNCj4gPg0KPiA+ICAgLi4u
L2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LXZwdS1kZWMuYyAgICAgICAgIHwgMjAgKysrKysrKysr
KysrKysrLS0tLQ0KPiA+ICAgLi4uL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LXZwdS1lbmMuYyAg
ICAgICAgIHwgIDYgKysrKy0tDQo+ID4gICAuLi4vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1
Y29uZmlnLmggICAgICAgfCAgMiArLQ0KPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiA+DQoNCg==

