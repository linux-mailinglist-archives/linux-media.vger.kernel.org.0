Return-Path: <linux-media+bounces-63746-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UT5xOSUWIWol/AAAu9opvQ
	(envelope-from <linux-media+bounces-63746-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 08:07:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B15063D263
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 08:07:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=microchip.com header.s=selector1 header.b=GVQFXnak;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63746-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63746-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=microchip.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4E71302BBF3
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 06:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9433D5248;
	Thu,  4 Jun 2026 06:07:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010055.outbound.protection.outlook.com [40.93.198.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C1E3B993F;
	Thu,  4 Jun 2026 06:07:09 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780553230; cv=fail; b=B+NFB+QI/xUNkZc5+IwzQj7vWPOMUtyWaCVam35hYy/B/QKUKV7V2Nv9SVP3ULMvGzbmT0D0By0F04EGaQ28GRImhbq5RQTkY87Y2O78pmz0W0/UdEumb8j5jd7VtHy4a4DMOFEgmtvwp+EB1WT8PKVFgt27HiSnd33zEtPCpRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780553230; c=relaxed/simple;
	bh=t3epK6Jf+IcUU0RddiA60UdGeUD86YaGa2NroYUBIeU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R9R5C4qplWIgM8hdbKjsvWmMUcl80PJjiVWQuhtohsX5cAwfKVf/enGYB63lpl2gb2qhx4dDAAnEB48FCOOvwDXzUy+M2TTwbNaySBWn2C6oU58yPiGSHTYn/aT1RDAvyDwOqHXgkJGGHgYluu81cOE2fOJNp/IQ5o/kQ2gWZ08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=GVQFXnak; arc=fail smtp.client-ip=40.93.198.55
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZKVkaE2fwvWUP9U3cL6RBP+aVaeaE+wGJq6c99tAGKFCbYVWdZh+171xP+nJDmlhFixsD0tnQWKXjBnxsBtbta7dCX0+TrfXXS8iWbvUfQi6v9nGsI7RWwnIhAbX7ZR+6XQHX3RjEZYWaq+Pb+NoaSrj6X8Q1C6q3jWJGUeZcMOE0f4NvW0P3J0/2R3W0ZDLUORnywYLX5Rtfz63+0JcYMtoXgynDiUDkugHcU9D6PDOtVgljV7wrFuJbp70s52Pyiid18PExd+NQVu5VYZDtqThs1d7SYYYScWM6YUXA7rEbuYiuf0uQ1j2m3/tvm93yM8D+bJqj3FE5Y8OlPkSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3epK6Jf+IcUU0RddiA60UdGeUD86YaGa2NroYUBIeU=;
 b=WBUHPScw8apNVqKGiBOBLQl+q2dZAANgH5lYcsOk7orW/K8o4BOgp9YS6t1p/ogAe3hX+/ZtqoZcbZ7WBWnp4G2QMDmYNiLLjbYhZc70m5NdYDn8ZX9xJ/rT2Ueco1bHPQY2vjsmRaEUCF3XrbeF0sqSfkjMcZED1X+eknDZLOzfEKkAH3h33/HLEysMPbY/LNucenLLtbcZJIpu5jThENNlroc2SkqtLJhMjJ3zNtjBKMDbxq7/koTCOOYEam3teWABUYR0yBtGi5I8QZK9Bzrlq6NXJKENFsxunSEFy6woQwSOVZmDgHckfXWomj4aJInl2Knml2M2p2qPGCjw/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3epK6Jf+IcUU0RddiA60UdGeUD86YaGa2NroYUBIeU=;
 b=GVQFXnak+lUYSBlPXt/1oreKW6Gy0F44lSHWXKzhfshiajn2PLQRx1u6rPhaxjmxgQYNbeCZtNxZANvFMoiemeN+4EZZHneubcKhx9zBeMPibZsma9ImIC3GW4fGWBsLEkXpox04bYaLucYTyM6TFLvV1tJMPob2uY7lMljT+DpypzVBOBG2JLRefwRe1xNWfepAlFXmVRF7NiMgz5zA3DAsPkZbepcCHUxsrCQfTjN39MM+x5yt/PicyCvb8uR1kzCcnCmHHnbTR1REi98pWFR0v97mOKePx/aMAH8aZm3eFllJIGrKtA/UE/86ZoDwoLen5ehDFY43xLe1BIjpyQ==
Received: from SJ0PR11MB4910.namprd11.prod.outlook.com (2603:10b6:a03:2d7::7)
 by PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 06:07:06 +0000
Received: from SJ0PR11MB4910.namprd11.prod.outlook.com
 ([fe80::7af:4219:9135:f1a5]) by SJ0PR11MB4910.namprd11.prod.outlook.com
 ([fe80::7af:4219:9135:f1a5%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 06:07:05 +0000
From: <Balakrishnan.S@microchip.com>
To: <laurent.pinchart@ideasonboard.com>
CC: <jacopo+renesas@jmondi.org>, <kieran.bingham+renesas@ideasonboard.com>,
	<niklas.soderlund+renesas@ragnatech.se>, <mchehab@kernel.org>,
	<tharvey@gateworks.com>, <hverkuil@kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/12] media: i2c: convert ternaries to string_choices
 helpers
Thread-Topic: [PATCH 00/12] media: i2c: convert ternaries to string_choices
 helpers
Thread-Index: AQHc7ebWur1y9QvNz0WdiBwxcN4wT7YiWj8AgAuar4A=
Date: Thu, 4 Jun 2026 06:07:05 +0000
Message-ID: <f5eaa390-e029-4e6a-b493-07b74ae55f29@microchip.com>
References:
 <20260527-cleanup-string-choices-media-i2c-v1-0-e8f7d2284288@microchip.com>
 <20260527205436.GB479227@killaraus.ideasonboard.com>
In-Reply-To: <20260527205436.GB479227@killaraus.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB4910:EE_|PH0PR11MB7424:EE_
x-ms-office365-filtering-correlation-id: cd4ae778-ea0f-4b97-a884-08dec1ff80dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|22082099003|18002099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 UTw28/ZY3yF8wuHjU20y/bP4k1wMn8ZfWq0eeNomBrKYgoWCzTekuyS19z1ZwyvIvgNT4QuoQC9+7DRS3RXkcw5QMq10PKr/GQNtlsY8WfKaidPxsbXLTFbMgmBf+I23/QBDfusURTdH7yJBrZCGLQ9VM5JcWNydUDsTdl5/W8h0zPiDydLQjH8cOJBG47sy24mGqU8oMVU5aFzCByfhpfAYq2nsO3H6hkC1BpHS8G8q8rAUrltsTTpeN2If/nBlAsAoLMqcawPN1sxkV2wic7xIKOLSF2KLw8ssPoeCtCMM2JY37Z2LCwko0MUyFOtEpcl1htYHrq1HJuzl74Xx6Y9sqn9LOR5hIEpELtNLKd1Z03FFaa57APeQQDFQOMzzxxuP8GKanoKMN5Xb/wpk3rJmRxD9BLWciRATXeapUSXDoeVvIrLtJ89ZxbTXfXIFAFh9NQIZm5T/nKnL1GQo6Rvhubuw2fa9Y2n7Udh/OEdHD18CxxyfLtlaBj+f4a95cqNZHPEMmsHOOsmBDXpdpsgkt/ITHSO6QFjHWfOaScEQ6p/+9kkxi3RQ+CMJ9vItbKoY4qvTnnsj0BIG+4K/IhNRKVq3KLNnmT2xc+ljMFsAMbywgG5HYGQtMd9t2xX5c0Kxcdxi2jyf4PLRUSOQ5kfnPZn5+PLpu6WM5GGfoxDWNkHW+2StnImxk1g3X4lMQlh4CWOc89vKK7futAXxQA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4910.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VTI5RVEwMUJFRE51dURNTjZpc2dVamlSQmI3TzZxbkFaZDZZWTA1MEp6NWlx?=
 =?utf-8?B?cEQ2T0N6L1pmNVk4Y0lxWFJPRUVxSXQwdDRFSFdBVldacjBGWE5JbDBQVEVT?=
 =?utf-8?B?aFk0N0hTYlJuQlFGVDVaRVk3a080UVBsVmRQRzFHSU9WSXRoRDd1cE5tcjJL?=
 =?utf-8?B?bXBNdGRHMUNIUnJuWEplSnhtRjRvczRNdXpNUEU3YnU1aVdkQ1habzNVU2Ex?=
 =?utf-8?B?SStLWTE3YzVGRWxVVmlQNTdqajlCNklmdFU0UnJFNlVYTEtDMGxDKzZRVTFO?=
 =?utf-8?B?MUdtRi83Y2kyWmNpODJuQVozNzhPWklNNGY3blpTUTBNNVIrWXRCdTA2WDlY?=
 =?utf-8?B?NGNKM1kvRW5Fc05hVkhqc1hFazRtdVcrMjNEbEQ1NDJ3aGZWZ2t2WEhwa1ZL?=
 =?utf-8?B?TzRLVWYrQkx3ZjUvdWJucEc5TmprelpUWjBhcXRDZE9Rd3UrR1QvcTQrRyto?=
 =?utf-8?B?N2hTSCtkWXBNaG1UMmoxeUM2OHA2WjN1aE5oMTA3NTN2clFlc1huVWhjb1Iw?=
 =?utf-8?B?RUpaZ1FzRzlUZ1JjMGdjZXZJNTRzSjc5eTFMejN2azgrN21Zc0VzbXFoVGdT?=
 =?utf-8?B?WmlwVzJ6bHgyVnZSRDVmYmUwbU9BUG1pbFEyT3RMNzhldlQ2YWhobG1VczZT?=
 =?utf-8?B?ZENFVjA3L1N0c0YzV1dqU2NSYm9ud3dSVVF4S1dCbE9iaVRsODNTVkNrYkpk?=
 =?utf-8?B?Zk5PN2NXVHNZZ09PdnBtdVgyL3U3MnRmbGhNMlJ0WnJtRlJqVktXdFA4L2Nu?=
 =?utf-8?B?bnVBNzN6Zy9RenllbzZld2dJUTBVTHRlUTRqeEZ3YkE4L1JnbFV0cWlWQW4v?=
 =?utf-8?B?dStEMjQyWitFNE1oYkVlUmlLK0xydU1rcWxBR3VKNWtnWkoxUWsxS285OXVz?=
 =?utf-8?B?Z25YbTBJbFlVZzlseDdWMzg4MHBRTmEwYVdJRm91Z2dwZVNmWjhBSExPc05N?=
 =?utf-8?B?OEh2Y2NTemZNcFdBWVhVdVV3WHI4SUVyd2lxY3NHanBUelhBUWVlMUVuS2hn?=
 =?utf-8?B?RWR6YjYrOW1LMkNBT2wyNnVvMlJRUUNjRzEwemZCQ2NHNDREaXdHbXdwK2dj?=
 =?utf-8?B?U3MzcGdsd3Vta3NyZ0M4Q0tVOUJqM0QyVmVSTWtKMTZ4NGdUMUI3a2RwM1hT?=
 =?utf-8?B?c0NVc0FIVExRZjQxQXQ0aDYvbVlQTVVNbmJlNTRJWTFwSHpVdDMwMXBtVmpm?=
 =?utf-8?B?YmR3N1BHVWY5c2V4Qnh4VDJEb1g5RHpSc1ZoN0NNZXR4TWtLMGo0eHFqTzcv?=
 =?utf-8?B?VGIrMjFrK3NvbU5rbEJUdlRod3ZBbGNsUFY3c2RMNTN5SGJMMFR5MzdHZmRS?=
 =?utf-8?B?SStsOGx1SUkrNldiS2dZem9HelNWeElwK3F3aXVWaHRsT0lUdS9VQko0UVZO?=
 =?utf-8?B?R2pneU5PcEdwTUFMenpzT3FYeWZzMlJVY2hNOG9wMmt6SVBWSmJxV0VZcHpj?=
 =?utf-8?B?YzhRTGZwMjdDTUx1RU5YVkxzTzRNTjBzbDlBaG03aTRVdUNYeGxnbjZRUDc1?=
 =?utf-8?B?ZXZobm9QbFlXOHc3L1k5S243RUc0VGNjMnpUVW91aHRGVWlUSlRzM1NLcTYy?=
 =?utf-8?B?ekFYdVN6SlhUVmJSc25BNEwyWVhUcVp5SHJzcTVmNlVNWU5wZmdFeFZSQzlU?=
 =?utf-8?B?ZXpTSVpGSU9jTnZKWTBkQjJCa2czRHdOd1NETTJlbk9FRktoQTh5d1RYZHVH?=
 =?utf-8?B?RVR0UzdoL1dmSUJwNkgrQm9QZ0R1N1lGNkNFaFJIRWZzSlJWSGlvcXR2Smlz?=
 =?utf-8?B?VWs4eWpaQ2VXR3F0TGpzNFhjc3BHTDAxWFg3b1lTdE1rWVkxVFZDdjk0N1g2?=
 =?utf-8?B?K2FCdFp4eTZIZVRVTlh3dXpMTjZVQjltMm1URnlFV2lKbDd4d0lJQk0zUE5u?=
 =?utf-8?B?ZEpyWHZJQWZzT1V2WEFpd1dhelZHc2tpaXBKaWowUUsyWXMxNk9QN2Q5SlIy?=
 =?utf-8?B?UER6NERxbEMzdjlNa2NxMDNGZ1FVOGpucC81WTNwTm5sekFWanVPeGdJSVdq?=
 =?utf-8?B?MStKeFZEaFRjVXVQeHMxaElGMDJLdnZiRW5veU94a1VicWhKT0I3K3FVMnFN?=
 =?utf-8?B?MTBJWllWTnQ3VnFsR3hzc3hEWldxUXcyeG1KYlc0K0hmYWVWNml1M3pLSFA5?=
 =?utf-8?B?S1NXZW9GK1NUVjRjcTlMc25jMDNOeG1va1ZlUHY0T2ZZUko4b09lMEluZGRz?=
 =?utf-8?B?N0ZHMlZPQzFvKzhYNDBtNDZScWl1ODJpUTRKRXdqZ256WndVSWlFYXQwTjJU?=
 =?utf-8?B?NFlDWHhtem05SW5lN0RKNVBFSkEzNExkY09YeXd2WG4xTzYrSkNyRWpXbzdk?=
 =?utf-8?B?aFEzWENMcFRXYlF2eVFGSWd5Z2UxL3lmUUxtTzZsb0VVaGY3WFh2Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD07D1EF1B401D489304869E05CF2576@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4910.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4ae778-ea0f-4b97-a884-08dec1ff80dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 06:07:05.5750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UiPHnDQXBNZuDb7Fruhd8F8scdJwHVBc4Jo6Tl5MYjmO0U20A4pI7/xUTMPR8+qRyQ3YkQp8zeVSUiRboLYv8jkNiJjOZq7mcwMJzbxCW9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7424
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63746-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Balakrishnan.S@microchip.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:jacopo+renesas@jmondi.org,m:kieran.bingham+renesas@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab@kernel.org,m:tharvey@gateworks.com,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo@jmondi.org,m:kieran.bingham@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Balakrishnan.S@microchip.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:mid,microchip.com:dkim,microchip.com:from_mime,microchip.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B15063D263

SGkgTGF1cmVudCwNCg0KT24gMjgvMDUvMjYgMjoyNCBhbSwgTGF1cmVudCBQaW5jaGFydCB3cm90
ZToNCj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1l
bnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBXZWQsIE1h
eSAyNywgMjAyNiBhdCAwODoxMDo0OVBNICswNTMwLCBCYWxha3Jpc2huYW4gU2FtYmF0aCB3cm90
ZToNCj4+IFJlcGxhY2UgYm9vbGVhbi10by1zdHJpbmcgdGVybmFyaWVzIHdpdGggaGVscGVycyBm
cm9tDQo+PiA8bGludXgvc3RyaW5nX2Nob2ljZXMuaD4gYWNyb3NzIGRyaXZlcnMvbWVkaWEvaTJj
Ly4NCj4gDQo+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBhbiBpbXByb3ZlbWVudC4NCg0KVGhhbmtz
IGZvciBsb29raW5nLiBJIGhhZCBub3RpY2VkIHRoZXNlIHRocm91Z2ggdGhlIGNvY2NpbmVsbGUN
CnN0cmluZ19jaG9pY2VzIGNoZWNrIGFuZCBqdXN0IHNlbnQgaXQgYXMgYSBjbGVhbnVwLCByZWZl
cnJpbmcgdG8gZmV3IA0Kc2ltaWxhciB3b3JrcyBkb25lIG9uIG90aGVyIHN1YnN5c3RlbXMoIEp1
c3QgdGhvdWdodCBpdCBzeW5jJ3MgbmF0dXJhbGx5IA0KYW5kIG9mZmVycyBiZXR0ZXIgcmVhZGFi
aWxpdHkpLg0KDQpBQ1BJOiBwcm9jOiBVc2Ugc3RyX2VuYWJsZWRfZGlzYWJsZWQoKSBoZWxwZXIN
Cmh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI1MDYxMjIwMTMyMS4zNTM2NDkzLTUtYW5kcml5
LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tDQoNCmFsbG9jX3RhZzogdXNlIHN0cl9vbl9vZmYo
KSBoZWxwZXINCmh0dHBzOi8vbGttbC5rZXJuZWwub3JnL3IvMjAyNTA4MTQwOTM4MjcuMjM3OTgw
LTEtdmlzaXRvcmNrd0BnbWFpbC5jb20NCg0KQnV0IEkgdGFrZSB5b3VyIHBvaW50LCBpZiB5b3Un
ZCByYXRoZXIgbGVhdmUgdGhlbSBhcyBpcyBJJ20gaGFwcHkNCnRvIGRyb3AgaXQuDQoNClRoYW5r
cywNCkJhbGFrcmlzaG5hbiBTDQoNCj4gDQo+PiBTdHJpbmdzIGluIHVwcGVyY2FzZSBvciBtaXhl
ZCBjYXNlICgiWWVzIi8iTm8iLCAiT04iLyJPRkYiLCAiT24iLyJPZmYiKQ0KPj4gaW4gYWR2NzYw
NC5jLCBpc2w3OTk4eC5jLCBhbmQgdGhzNzMwMy5jIGFyZSBsZWZ0IGFzLWlzIHNpbmNlIHRoZQ0K
Pj4gaGVscGVycyByZXR1cm4gbG93ZXJjYXNlIG9ubHkuDQo+Pg0KPj4gQnVpbGQtdGVzdGVkIHdp
dGggeDg2XzY0IGFsbG1vZGNvbmZpZy4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogQmFsYWtyaXNobmFuIFNhbWJhdGggPGJhbGFrcmlzaG5hbi5zQG1pY3JvY2hp
cC5jb20+DQo+PiAtLS0NCj4+IEJhbGFrcmlzaG5hbiBTYW1iYXRoICgxMik6DQo+PiAgICAgICAg
bWVkaWE6IG1heDkyODY6IHVzZSBzdHJpbmdfY2hvaWNlcyBoZWxwZXINCj4+ICAgICAgICBtZWRp
YTogc2FhNzExMDogdXNlIHN0cmluZ19jaG9pY2VzIGhlbHBlcg0KPj4gICAgICAgIG1lZGlhOiB0
dnA3MDAyOiB1c2Ugc3RyaW5nX2Nob2ljZXMgaGVscGVyDQo+PiAgICAgICAgbWVkaWE6IHZweDMy
MjA6IHVzZSBzdHJpbmdfY2hvaWNlcyBoZWxwZXINCj4+ICAgICAgICBtZWRpYTogbXNwMzQwMDog
dXNlIHN0cmluZ19jaG9pY2VzIGhlbHBlcnMNCj4+ICAgICAgICBtZWRpYTogdGRhMTk5N3g6IHVz
ZSBzdHJpbmdfY2hvaWNlcyBoZWxwZXINCj4+ICAgICAgICBtZWRpYTogdGhzODIwMDogdXNlIHN0
cmluZ19jaG9pY2VzIGhlbHBlcnMNCj4+ICAgICAgICBtZWRpYTogYWR2NzUxMTogdXNlIHN0cmlu
Z19jaG9pY2VzIGhlbHBlcnMNCj4+ICAgICAgICBtZWRpYTogc2FhNzEyNzogdXNlIHN0cmluZ19j
aG9pY2VzIGhlbHBlcnMNCj4+ICAgICAgICBtZWRpYTogYWR2NzYwNDogdXNlIHN0cmluZ19jaG9p
Y2VzIGhlbHBlcnMNCj4+ICAgICAgICBtZWRpYTogdGMzNTg3NDM6IHVzZSBzdHJpbmdfY2hvaWNl
cyBoZWxwZXJzDQo+PiAgICAgICAgbWVkaWE6IGFkdjc4NDI6IHVzZSBzdHJpbmdfY2hvaWNlcyBo
ZWxwZXJzDQo+Pg0KPj4gICBkcml2ZXJzL21lZGlhL2kyYy9hZHY3NTExLXY0bDIuYyAgIHwgMTEg
KysrKystLS0tLQ0KPj4gICBkcml2ZXJzL21lZGlhL2kyYy9hZHY3NjA0LmMgICAgICAgIHwgMjYg
KysrKysrKysrKystLS0tLS0tLS0tLQ0KPj4gICBkcml2ZXJzL21lZGlhL2kyYy9hZHY3ODQyLmMg
ICAgICAgIHwgNDQgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+ICAg
ZHJpdmVycy9tZWRpYS9pMmMvbWF4OTI4Ni5jICAgICAgICB8ICAzICsrLQ0KPj4gICBkcml2ZXJz
L21lZGlhL2kyYy9tc3AzNDAwLWRyaXZlci5jIHwgIDUgKysrLS0NCj4+ICAgZHJpdmVycy9tZWRp
YS9pMmMvc2FhNzExMC5jICAgICAgICB8ICAzICsrLQ0KPj4gICBkcml2ZXJzL21lZGlhL2kyYy9z
YWE3MTI3LmMgICAgICAgIHwgMTMgKysrKystLS0tLS0NCj4+ICAgZHJpdmVycy9tZWRpYS9pMmMv
dGMzNTg3NDMuYyAgICAgICB8IDQwICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4+ICAgZHJpdmVycy9tZWRpYS9pMmMvdGRhMTk5N3guYyAgICAgICB8ICA3ICsrKy0tLQ0KPj4g
ICBkcml2ZXJzL21lZGlhL2kyYy90aHM4MjAwLmMgICAgICAgIHwgIDkgKysrKy0tLS0NCj4+ICAg
ZHJpdmVycy9tZWRpYS9pMmMvdHZwNzAwMi5jICAgICAgICB8ICAzICsrLQ0KPj4gICBkcml2ZXJz
L21lZGlhL2kyYy92cHgzMjIwLmMgICAgICAgIHwgIDMgKystDQo+PiAgIDEyIGZpbGVzIGNoYW5n
ZWQsIDgzIGluc2VydGlvbnMoKyksIDg0IGRlbGV0aW9ucygtKQ0KPj4gLS0tDQo+PiBiYXNlLWNv
bW1pdDogYTNkNzhlNzRkZDNlZDA0Nzk3ZWEzNTFlZGI3ZjBhMTliOTYxYzA2Mw0KPj4gY2hhbmdl
LWlkOiAyMDI2MDUyNy1jbGVhbnVwLXN0cmluZy1jaG9pY2VzLW1lZGlhLWkyYy01YWJmZjY1ODAy
ZWENCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQoNCg==

