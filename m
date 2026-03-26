Return-Path: <linux-media+bounces-57125-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KMmNljfxGnz4gQAu9opvQ
	(envelope-from <linux-media+bounces-57125-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 08:25:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 402EF330646
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 08:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8852830BB4EF
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 07:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47E92D8379;
	Thu, 26 Mar 2026 07:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BOXHS3/z"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7548B33F8A3;
	Thu, 26 Mar 2026 07:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774509514; cv=fail; b=Udx/mfJfBoBR3D8pS2FzBBHkNIMe3TMyZgMyL7fOyBobNPLYzSYfOJGjSRmIYZXTIIKS7zS2d0U5utfI74r0AuGAYmKstH2vCaF3GJ62voOy3f9wv60apXyq97EcwS6eGdyX/n0T2dR/12vixX9IiBf61gxpEg+jldsxk5WN6tA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774509514; c=relaxed/simple;
	bh=R4YuhOeN16GPlIWH3/tWZwlzOc0fHgNvjWCLJQC2a8Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ptACVS1kKin8bYlHG5ij/BxGNAdfjDceGaGhaUAW7S1D5zbTbeAoVJjGyNd9geNgx3hAsRpXF37FZEovBrt0AMVadw9WgMsRekbN6l0vHB+7+llex5bwlJ8i+jIPCQgUD1snqxUf0Gpp5bOrpwWS0rZxqBmTl8U3DKSPCLV20gY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BOXHS3/z; arc=fail smtp.client-ip=52.101.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qA/vLtigiQrNGagpa2T8r4slCwBIh0KT5u8/5VWuq0jPhEOvksPy3pFGq+TPBRHYk/gUOzyPn3mgGhdKx/3rXiD2C0zm2j8MwXuakAB+TcJEn85LLCdF4ZvJe5N1jKQ2IvXGWJDrynAOCJOuYrBqLokzGlBY7a1CWRyUazH17OhZmgrVYgr1JAHwgQGqSw6ul+p28KZeLdw41kGoRXME2sN/GuIdDt1AV3XvfGFzgZyJnHbvKpHChBpjuGqPj7zVlalBHs8nDzED9OcByNM9FnbsZlZL9gQ5RsmJqlPoLTvyCn/WXJ2HR0Vd9rt4BZX/QXYMdzuOYVLMKOinagqosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4YuhOeN16GPlIWH3/tWZwlzOc0fHgNvjWCLJQC2a8Q=;
 b=Y9zqLNQlflVGEsxbtxaxtJuLKpDbrahVdLBiB3RyDPE9lmVfR7bsRAdtZGIz8kcgLJJ990waeJ1wooy0SV54s/oH9zhICGRbgP0HmoLyDWYak4zQ4DNVooLvk4WcpMpijAzTYy4QozhO93MoPGKvUqyX9Tp+wqB2vWDumAYR+1984zBfw0YOnPIqPgbjqggIJwUAddNWJDctcc7VFAr5iajIO8W+xLiMi6SINUiMtqqoo+3XNzC/5TF5qTjtjzGNnOP7c8ShaGQmNUJuxqm1NDYx+fDI/uF0hGMsBhVJRKVPBxqlrkWLv9gqlfss5y8tvGe7916edIcZimn7j6ZD3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4YuhOeN16GPlIWH3/tWZwlzOc0fHgNvjWCLJQC2a8Q=;
 b=BOXHS3/zKCHynYEeALNg4+Cuzufx1+h3f4tj5y7CKyfxZES9ESQvhY2uUtJUvxlMYkMo4S8ALuU1NBykRt1F7fxoiTWwMHOIb2eJkk5+X4X7NkmqMYh+iKxZ3teOOFCnqT7RIL663PfOGbj1CcCl9cRoce4Hb7muGet6sMx6qyG9lUTqBlg2Gmhm0vqrj/swtgZl1wH/UPwsdz0Og9VxPbCbO6/TAQEZInsOD7ch7qfaX2uLWb23SrfgIDpfFalpel6XrjlJ/p9Yt1XYdb12RjAVbl7IM0EovdJ+z+M2Yz8snoEyAHbcmX3lIr8EuCl3h4sb5re0qN/axPBpO63wIg==
Received: from PA4PR04MB9413.eurprd04.prod.outlook.com (2603:10a6:102:2a8::12)
 by VI2PR04MB10221.eurprd04.prod.outlook.com (2603:10a6:800:22b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Thu, 26 Mar
 2026 07:18:28 +0000
Received: from PA4PR04MB9413.eurprd04.prod.outlook.com
 ([fe80::d262:346e:5006:3874]) by PA4PR04MB9413.eurprd04.prod.outlook.com
 ([fe80::d262:346e:5006:3874%6]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 07:18:28 +0000
From: Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
CC: Oded Gabbay <ogabbay@kernel.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<frank.li@nxp.com>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
	<christian.koenig@amd.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, Jiwei Fu <jiwei.fu@nxp.com>, Forrest Shi
	<xuelin.shi@nxp.com>, Alexandru Iulian Taran <alexandru.taran@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: RE: [PATCH v2 0/9] accel: New driver for NXP's Neutron NPU
Thread-Topic: [PATCH v2 0/9] accel: New driver for NXP's Neutron NPU
Thread-Index: AQHcrW0Sx9bFLIZMFE+2EPv3Y6VaP7W5UsoAgARg2/CAAEtXgIAChyvA
Date: Thu, 26 Mar 2026 07:18:27 +0000
Message-ID:
 <PA4PR04MB9413D4380B1F71071401EBB69456A@PA4PR04MB9413.eurprd04.prod.outlook.com>
References: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
 <CAAObsKDAzfib86rXqt9FjXV68yRkBzmijcyR+x=1MsPYd=MQWQ@mail.gmail.com>
 <PAXPR04MB9424214A1AA43BD0C36653E89448A@PAXPR04MB9424.eurprd04.prod.outlook.com>
 <CAPsqS2QXcgbi9_e4QmCn1Cgkr-bOVsY-E9qpZsFw3WYWWLugEw@mail.gmail.com>
In-Reply-To:
 <CAPsqS2QXcgbi9_e4QmCn1Cgkr-bOVsY-E9qpZsFw3WYWWLugEw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9413:EE_|VI2PR04MB10221:EE_
x-ms-office365-filtering-correlation-id: be26ebd8-8e12-4aa2-057b-08de8b07e074
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 DJH+YaQuGawps5/mIGAkb+M2R9F+SFAi7a1GcGtk7FAkiK6eXerzXqYkGdRnrmsaUEsT6VpOZiApu2EEE8rtRLekwf90vbIi+SJRkvImnG3QfPqnbGCs7l9QIDkOHVRBzaavQP30eBHjOG/GvRxmHvcoLIwnkehF8aGKMVzV5I6ZWzPGL7jAg3EXO4eu8J4TQE6NftkSEy1E9xnqrYXu93Dt63d/r/esscxhUm0TQIf0U16qDF4RfO//obJJbzD5QSwq3+r0HlavcY0EBOCN5fwVf2fTsF9K0nZlJrmUdwe3eNmxhW4HmBpq0C9RDN/2CvOTUYV+OqrdUvzY14gw0u26mvd6598gWeKinLi9NSOAWDDGx/KbtWmIDiYHtizWStZIN0hZf7ipjDqtpwjenixGIqYeO74k5dNdgx36ByidPGsTQbJBPL86ht/yEJxVBp7MQHn76vqVDBmd5mzoC0Z/yezvLniJZdcX6Q1eFB5Bprf4l2juqyzgrjha+g/fjJPs4qneY6/CBdhHxJEQCACJiCWYx8IX7uICLFKZyVAQIn4RStFY73GjCRDa+Ug2qe+TbxjIM3wFK4hhRtOqopegZ1J2hnVmKXQPs4xDMn5F5Vl+opMEEH8Ro1wxqGQ7ZNKeCXph5Vj3wHK7mODszrmYX4UFfZOkX8p5irJgEGTU1mlFRK9mJsat5F0qTFF+zXHrjkL+TRYotYGZgAywk1oeGpfoMGMRWWKzYm+qRt+Z6gvKEgCR6rK9tgoeO5I8
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9413.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T054SlJvazgza2l3SEhqM1ZIOXBxNjRXNFZxbjg2cjJsdUk2cmRWMDNFemM4?=
 =?utf-8?B?N1VxRzhlTStpOGQyenBQTVQ5VWEyd2lPVFlxaWZRUkEzTWJLUUhRTUFHUFdp?=
 =?utf-8?B?TXBnZHdOVnJHN2dJOXI0WWVrdHJFR0NMcFdpVzQwYUFKaDhkQyt0b2ZHTjlt?=
 =?utf-8?B?NXErQ0tEK0pWVld2UGVEQWd6cDJURHFsYTh5d292TUN2cW9UcVlzMTlyVFRi?=
 =?utf-8?B?T2U5cnkrQWlpZG5DTXQ5WHRMdXh5cTZwdU9wRFdwcHBqQzk4QUF3c2ZpaFZU?=
 =?utf-8?B?OFdqZDJEUytBbHdUb0lyNGwycmZ5cUJrUUpHUXlrdytMa3ltTitJblg1TjNY?=
 =?utf-8?B?empkVXZJRmx3b1VwRk85bG8zMmxoMmlnQkIxVUJwUEo0a2wxTjV1SlYxUlFY?=
 =?utf-8?B?Q3FPeFJxemNYc2dOaWRTTmZ2elZPMSs1a29UalUyRERpNTJHYzRGa0k3aTdD?=
 =?utf-8?B?b1VVS0pjbnI3SnUxOU45amFqWHg4UHFhb3ZSNWx5RzRPL1M3cFR0Qlg3a2U5?=
 =?utf-8?B?SWc0ZW9XM3RLRm5sU1BEbWlPZy9YVHpyR281R0h1MVJHdVBTVW0zajB0VUNs?=
 =?utf-8?B?VzE2dmNXUks0Y1pNVFgxN1lWUDVlcm11QnlXSk9SUk00OVRuUWltd1lWNElZ?=
 =?utf-8?B?aFByUlBBQ2xyNGY3cjZObmdxQ1RtM2s3MjYvUGt6Z1hoSGVMaVNpaWtTQThH?=
 =?utf-8?B?MXQyQjFVd2xtR3o1d1EzdG9mRGRoeHVqUEVDOENsNm83RGg1b2xVTEphNXFI?=
 =?utf-8?B?akJoNEdxU25GMHZ5Ujh4Yk1uZFh3R3l4cm0rSEw5YzJiek5oSHRxcDNEQW9x?=
 =?utf-8?B?NG5NdTlsUFFkTWlsRE1aZXpmcWN5OVZCejJJMXFOVEFJVWFjYUk1YVpKTldp?=
 =?utf-8?B?NmsybHZFa2ZaaGhaVWRGbmIrUHN1bCtLUTJXejR3QVhnUWpyQ2g5b2duSEt6?=
 =?utf-8?B?ZmE5bHk1Q1MydStsL0J6THp0SE0vcGVRVXFsd1ZMTG9rejNzRUZMTUw4TWZx?=
 =?utf-8?B?TDNqd0NwdTllZkFXai9XRC9tbEpxcUNKMVFwZGhRZHZPTkh0OCs0QkFWREt2?=
 =?utf-8?B?S3dBRXRhVVlMVm1UWU45SSt0WHROQWdVZDRmSTdmaUVOOUYxVWNBWnBDYytl?=
 =?utf-8?B?NmY0bDJ3WGtPb2RVdU1lVkxkVm1WZmxnSVhXZ2h3bVlVaVdRVWNzZUJQbkJW?=
 =?utf-8?B?VkZVU0NCNU9TbjNwQW9UM0lDbXgvZXRZbnpyODBUQnFJMGVJaUxGQjR0OHk5?=
 =?utf-8?B?T3BhZXVWZElyRTlBUWRwenFPaFNucDJ6YjlxQng2MDMvU0p5VS9Sb2hSSFFW?=
 =?utf-8?B?WGliWllGV21nUkVHdUQydXhSTlFVZnFDSDhObFZHSGpTOS9SVnJsK05JMHZJ?=
 =?utf-8?B?dEdyTFcxK2RPNGhvYVkxZ3RGWjdLOTRpVHRMa1YvQTVnK3lKZUlHQ2NjTVRI?=
 =?utf-8?B?aSszZHY1dG1UY3lxR0NYMXIzakY4eERXdUkyWmdyWXQvNTlpOG45Rm9FV3VK?=
 =?utf-8?B?eklBMHdYOWNwQnZWM09XaVFDQ2V0ZXZRMVIvMlNYQ09PaGlVRDdzRVZZWVpF?=
 =?utf-8?B?NThiUFY5OXZMUnBBVU5DbXBrRC82MFpsRUNCWS9tamFLdVZ1Q082R0ZwUG5y?=
 =?utf-8?B?Y3dCcXRpK0NacVU0WGIzOEtyZ0RydUYxb25LMVZrcFpsV2d4TDRrcnhtOEQ0?=
 =?utf-8?B?dnQ5U09DVHRiT1NVNUhaaHpnclJMTElqRVp1bXAyemRsWSs3YUlMOXBZWEUw?=
 =?utf-8?B?U3NvYU9INU14RVppQU9qdmdlZmtxaWhsM3dGTmc0alE1U0tWM2JkeWdXdGcv?=
 =?utf-8?B?QlVvbFpsSFdIbGtQZWJMQTdodlV5VDhxaXFrTjgwTXpFY1Q1eDB1TzlDWmh2?=
 =?utf-8?B?ZG0xYmZDeXUrZXBONzFCQXpDQXlrMUR1RkJQZG5PTld6eE1iY21Ca1JuRmRj?=
 =?utf-8?B?aWV1UUF1WWQyWlVLbFNmWDJueEJOOVdvOHpERlJwRjRZaFRCMW42TFRIV3lq?=
 =?utf-8?B?OC9PV0NVV1RHcnZ3TnNZZzl3Qit5Z0lUTDdueXZPM2FEaXh6em5OUnptK1Rh?=
 =?utf-8?B?TTRMMThDSnhsS2lUOWtpTVI4Kzh2ZnpOZGl1dkpMVGRaZ3E2OXRTVEtFUm5E?=
 =?utf-8?B?VWF3TDg3SVE4aXJiS0FvWGs2SDZ2WmU2NmJjZ3VDcXB0ZDlrOXNxbjhmMFI5?=
 =?utf-8?B?ODZRZGZPWTBZaXVoWTFyTzk0S2lMV2kwTkR6OE14OFVRU1RZVC92bVJFcUJR?=
 =?utf-8?B?c2ZEeGJpQVVPbmxtSTJFM0NGV3JxdldrMUhrSjVoTk5JMEl6Mnl5REhXeVBD?=
 =?utf-8?B?Q3NSTHpvR3BnWUZPQVY1TlRBdzRpTitpMkVuNEhSd3hsV2VBQmVDQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be26ebd8-8e12-4aa2-057b-08de8b07e074
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 07:18:27.9597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IJ17vTUhzJbHHpiysR27Gz5mGd3Dq+1IwA6rTU4z3ORDIl7xNo8msgKGQZMBHl9Ka7e7+6zCQ4kyKMQAlq9WCi4vlTbNbc0uWgYMkiS4kAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10221
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57125-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,nxp.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.linaro.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruxandra.radulescu@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[PA4PR04MB9413.eurprd04.prod.outlook.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim,libneutrondriver.so:url]
X-Rspamd-Queue-Id: 402EF330646
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlc2RheSwgTWFyY2ggMjQsIDIwMjYgYXQgNjo0MCBQTSwgVG9tZXUgVml6b3NvIHdyb3Rl
Og0KPiA+ID4NCj4gPiA+IEhpIElvYW5hLA0KPiA+ID4NCj4gPiA+IExvb2tzIGxpa2UgdGhlIHVz
ZXJzcGFjZSBwb3J0aW9uIG9mIHRoZSBkcml2ZXIgaXMgY2xvc2VkIHNvdXJjZQ0KPiA+ID4gKGxp
Yk5ldXRyb25Ecml2ZXIuc28pPw0KPiA+ID4NCj4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9ueHAt
aW14L3RmbGl0ZS1uZXV0cm9uLWRlbGVnYXRlL2Jsb2IvbGYtNi4xMi40OV8yLjIuMC9DTWFrZUxp
c3RzLnR4dA0KDQo+ID4gSGkgVG9tZXUsDQo+ID4NCj4gPiBZZXMsIGl0J3MgY2xvc2VkIGZvciBu
b3cuIFdlIGRvIHBsYW4gdG8gcHVibGlzaCB0aGUgc291cmNlIGNvZGUNCj4gPiBvbiBnaXRodWIs
IGJ1dCBJIGJlbGlldmUgdGhhdCdzIHN0aWxsIGEgZmV3IG1vbnRocyBhd2F5Lg0KDQo+IEkgdGhp
bmsgeW91IG1heSB3YW50IHRvIHN5bmMgd2l0aCB5b3VyIHVzZXJzcGFjZSB0ZWFtIHNvb25lciBy
YXRoZXIgdGhhbg0KPiBsYXRlciwgc28geW91IGNhbiBjb21wbHkgd2l0aCB0aGlzIHJlcXVpcmVt
ZW50Og0KPg0KPiBodHRwczovL2RvY3Mua2VybmVsLm9yZy9ncHUvZHJtLXVhcGkuaHRtbCNvcGVu
LXNvdXJjZS11c2Vyc3BhY2UtcmVxdWlyZW1lbnRzDQoNClRoYW5rcyBmb3IgYnJpbmdpbmcgdGhp
cyB1cCwgaXQgaGVscHMgdXMgcmFpc2UgaW50ZXJuYWxseSB0aGUgcHJpb3JpdHkgZm9yDQp0aGUg
dXNlcnNwYWNlIHNpZGUuIEluIHRoZSBtZWFudGltZSwgSSBzdGlsbCBob3BlIHRvIGdhdGhlciBh
ZGRpdGlvbmFsDQpmZWVkYmFjayBvbiB0aGUga2VybmVsIGRyaXZlci4NCg0KPiBJdCBjb3VsZCBi
ZSBnb29kIHRvIGFsc28gc2hhcmUgZmlybXdhcmUgY29kZSB3aXRoIG90aGVyIGZpcm13YXJlLW1l
ZGlhdGVkDQo+IE5QVSBkcml2ZXJzIGlmIHBvc3NpYmxlLCBvciBhdCBsZWFzdCB0aGUgcGFydCBv
ZiB0aGUgcnBtc2cgcHJvdG9jb2wgdGhhdA0KPiBtYWtlcyBzZW5zZSB0byBzaGFyZS4NCj4NCj4g
WW91IGNhbiBzZWUgbXkgc3VibWlzc2lvbiBmb3IgdGhlIFRoYW1lcyBkcml2ZXIgZm9yIGEgbGlu
ayB0byB0aGUgZmlybXdhcmUNCj4gY29kZS4NCj4NCj4gSSB3b3VsZCBiZSBoYXBweSB0byBoZWxw
IGNvbnNvbGlkYXRlIGNvZGUgYmV0d2VlbiB0aGlzIGNhdGVnb3J5IG9mIGRyaXZlcnMNCj4gaWYg
eW91IHdhbnQuDQoNClRoYW5rcyBmb3IgdGhlIG9mZmVyLiBXZSBhcmUgY29uc2lkZXJpbmcgb3Vy
IG9wdGlvbnMsIEknbGwgZ2V0IGJhY2sgb25jZSB3ZQ0KcmVhY2ggYW4gaW50ZXJuYWwgZGVjaXNp
b24uDQoNClJlZ2FyZHMsDQpJb2FuYQ0K

