Return-Path: <linux-media+bounces-37877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46141B0777B
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 15:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A49458094B
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 13:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B471E572F;
	Wed, 16 Jul 2025 13:58:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021074.outbound.protection.outlook.com [40.107.57.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D06C38F80;
	Wed, 16 Jul 2025 13:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752674338; cv=fail; b=a1fAbhPc8Zc8YYhPfOj0VffRfj305Yux6fg8u7XNsMXOmhxPHT2T7EX/DVp5rhbsKPTjK3xAejrhONQ+cDfcFvWFdMQZyDDkmeNT1GnsIAWpO0fyjSH3aJcQIhc+0hqoSqx9l6KnmWcsGAhF/nMWhHPeL6B+9jTaoY8bksLGakg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752674338; c=relaxed/simple;
	bh=M8A4DUbQAA6EL9C1VwBkC8C8KFnSzjgV2NgK2OAZQrA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZUo5yK0yVD6QNUqzrFQB8i7Q6TG1GHIW+K1aDL8HWhqsH88eIeC8DcKh0HZIUHwoPrWoZIz4ddW6mAwkVha9ZL/yruf40OxXwEhAZEyckH/h3cOw7D3batTxlffJ3Eze+3BwZENNVd9K1xw0TUyNp1qUQFpm6ZOqLE448EaF0Y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5c7UccFI54nU822IDhkcYOGHUu+SRIktoHaSgkgOhubArDx3ldq1EXPdi9KAHjQM1SD1+jPpNT+H4t2NfItX4OfXjOaZ6P22Av3zJmy5cduXB7yvXmGmwJ+OnlV6Vz/3oxrNrSJrOL5gaiMfM9Ij9jviEcITgyOjI7bdTxfcsxy/ZWmlEtCzs8NQclq930W9RUrw0ABhGMiVDRb2JkMkJoNbtpGI2blXWmN3Z/N15nDhYstGJGjTEWTtei/SE4dMKSFDmaRaSPmYg60ISb2y2g9P1TuUdMjF799vF/NI5PQDojgraw96NWJa6jXhH8NlbNQ7n1amFPMEVBBudOzNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8A4DUbQAA6EL9C1VwBkC8C8KFnSzjgV2NgK2OAZQrA=;
 b=y08De9rLAiC1Q0241y/jkrjyA83HJ2spfGo1ZrTTGGEYUf1J229OmSDqirxzeZjK+6+FNHy1Rh3PFgtqrmh3M/U5b3P8rnUxvaYyvCeGOhDIna3uyzgyGyjjhciaLfbcMktcKO2l9uNvMjb2b3Lj2U6VIG3vqpe4bqPKFDdINHBD9fI5eLe7c2czrFBqIKFqmv20CIUixnw0XEFvP1sx0TK1XOVRiwTNXo/0hDKB4+ylxcdfCL5db3xESjdFC0RbqtKGpe31WZGz2JRp1reGwGXfr9J2DJddSSfcmvqgHP3zm70lECNgmdxsGSvK1B5R+/g0Tr/lMeKkkUXPFKvT0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN3P287MB1349.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:193::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 13:58:52 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 13:58:52 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, =?iso-8859-1?Q?Andr=E9_Apitzsch?=
	<git@apitzsch.eu>, Ricardo Ribalda <ribalda@chromium.org>, Heimir Thor
 Sverrisson <heimir.sverrisson@gmail.com>, Matthias Fend
	<matthias.fend@emfend.at>, Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Dongcheng Yan <dongcheng.yan@intel.com>, Arnd
 Bergmann <arnd@arndb.de>, Hans de Goede <hansg@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Thread-Topic: [PATCH v4 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Thread-Index: AQHb9lfYoS/wf6j50k6uH/8lXesHXbQ0xBnF
Date: Wed, 16 Jul 2025 13:58:52 +0000
Message-ID:
 <PN3P287MB35196D806DD3183F5C3AA623FF56A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250716134426.8348-1-hardevsinh.palaniya@siliconsignals.io>
 <20250716134426.8348-2-hardevsinh.palaniya@siliconsignals.io>
In-Reply-To: <20250716134426.8348-2-hardevsinh.palaniya@siliconsignals.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|PN3P287MB1349:EE_
x-ms-office365-filtering-correlation-id: 04468415-104d-4018-e10e-08ddc470e56f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?C+8cXxaB/yNpLL7400mDiQAnw1XVnsrS6E5KALkZj4OIRGHPvkRp0IsTYl?=
 =?iso-8859-1?Q?2venS943uTocbcO1cw5yl/37tTMZKTC4O/cTcwVLfyrcfonodU5kdIrK4i?=
 =?iso-8859-1?Q?df6BaaIGT2TOqTLskyUIy/zelhIPb2tcUwJ9pgoKsn11bOrHNvddzoTT0+?=
 =?iso-8859-1?Q?aG2y5LWDj24mzQk20uMacF/MO5aNpqcM5AbvC3DirN7sn+KjuTcXg+jRJF?=
 =?iso-8859-1?Q?NLQdnNQwWP9B1Xs3Oovo1dO1rXBUk5H3pfu3DX64oc68qT9daMHcCK26kP?=
 =?iso-8859-1?Q?ikl3+qrLdhAMTGqLThl4kKuXd5FsciO+0AMfH/U9gpUW4HUGRVD7v8CTMG?=
 =?iso-8859-1?Q?DsnoZ+pzVPxkxQXuoAHgirXEjeh8OUrFMZ0apZVSO7tc3Q0CxvOTDt9SYq?=
 =?iso-8859-1?Q?2ns/7kOFBLvs2Hq873NjAxEF6VTjbqdHNyoSSuLGPVTaeBJztzzoFssX/z?=
 =?iso-8859-1?Q?XxUKZwY/xasv8omSGMy/Gii+04dHPv+ddNu6C1yHhlZi4XkWLGfCZ8/mXc?=
 =?iso-8859-1?Q?6+5S6I7m4ifYQCJJLbICZQR6i0bSoBzKfZF+38A44Y2WEosL6pN7kTQFcE?=
 =?iso-8859-1?Q?ACjO70zQUJkjJdP6vQKSKulbNOpnjF4D/aE0hWWnzTBh0EYkAQH7+yKjJ9?=
 =?iso-8859-1?Q?9AaA1I7Jo9UaMnTjmoqSPQEGeIgDiJSuTYhm0xDVwl+s0h+IIi7G2Wm/Tc?=
 =?iso-8859-1?Q?aLfsNpH+l7kJZghn8wQsaSXIWH3vrYOIvkw12/kTAQsqYVcKH/GrXvZ82K?=
 =?iso-8859-1?Q?7nqeQEFGcup18XK+v3bpRtjWMqSySd0VU0Y1zpCAFhR1iYRaEpgT9cQQVw?=
 =?iso-8859-1?Q?6MVtXUSL5awipqOZqa1VMQP3WOb+uignyfIONp5/sYSOVV3P8WMufb0yRC?=
 =?iso-8859-1?Q?rhHs7MkqCNas8MQyRqGmvCOdcEeMRH8v6u0XmT3eMVS5KlhyRajip0FDeH?=
 =?iso-8859-1?Q?nDBWmKc3r3dLrR7LrPB/PhWmux6oWAPORqCcmIyiEp710kBKKwD2NmrdKm?=
 =?iso-8859-1?Q?pbeQGR3me7beOeBYQ/r6Raiq6/Ln1rQ+atef0v454mK9CjEGsPwoZI2g42?=
 =?iso-8859-1?Q?Au+gxAll8Qc0SBNP6UeBMcXSWEXeboLrjfdhBGd46e8n7Gijuk5zGFHdZL?=
 =?iso-8859-1?Q?IMjb9/ewJjOrhk3Svo7yJQokp1aedyAHd+G3pIVQ4FuAV56ETnxukHLuv/?=
 =?iso-8859-1?Q?EWBNVZtPExSMxy9v91AcYltTG9fmWIMdyTSob5M/UcQP95/flYksIEFenB?=
 =?iso-8859-1?Q?wbs0z9WXsk52xfs/YKWTktc+i4LQCrrFNkniS+gvAdmoQ6TarTbCy9s0Ro?=
 =?iso-8859-1?Q?dKo3NdWxBIQECJ8W5wVux1UjWBbjGnOK3ARlkBW9XPUUSBUwkSAmc6L+pf?=
 =?iso-8859-1?Q?/0x0O6Ao5YeA5Jgpx4DM9ayiRDMk8Cher3vT5qSW1YIx8xvs/wfFFLu0WP?=
 =?iso-8859-1?Q?vDFuvVFSB+12ah2K66VAhomz5Zlc5+42GTdOQozbBYoE3AYaDa4bhVUnC9?=
 =?iso-8859-1?Q?k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2shNWAQ7S7ISKm6cPWgqZectsfP9P4qgjwQl9EOPjYBM7JTwauh8b2WpBe?=
 =?iso-8859-1?Q?otWYQX+cFkWlk/bGb4/i8lDMwab2CisVydlFOEE5DTRLYvi5vFhi5QQBO/?=
 =?iso-8859-1?Q?QuCUGeuiyqhN6Sou5BglW775DC4YQELfCUba95mB7DXQc9si1ariGop6qP?=
 =?iso-8859-1?Q?Bu2M8lXXZHvB6tmbFyFHY15ITk32tF+8/IUajLwfC3moPUjid3QGTFCCQg?=
 =?iso-8859-1?Q?p4K4q9O8jwI/3Fhudlywl+02YicrhFdVRZ/EnLOc7ewu7uhmPyiOP8PCnS?=
 =?iso-8859-1?Q?qvJCsB1DvLIkGTZXpWsrUqmHSkoSE78dMGN6HJ0cOwvyiGA6pQEY1hO0MW?=
 =?iso-8859-1?Q?CWlrmZa4d1er/HrUpHiWe8eWAhLWXIo/NF+JtyeDU80McZXWjMFzSYuE1F?=
 =?iso-8859-1?Q?llVKZdGZGSjV3wlj7sX2zSWxeam9cZNQ06WNPUsC1R+4exmRhmI1TLgZ0Z?=
 =?iso-8859-1?Q?dTSPbRgE3zZGf05XkqjgLnilY6TKn5BV/4OHnEYrJM9ztYiWMtkcisMDzr?=
 =?iso-8859-1?Q?dsUFOq4iXpKb1m8hgdacqNyDttpdr5A9/Ih12Y6W3kxoepCd11XylaUymI?=
 =?iso-8859-1?Q?KEyif2fT8/+qrloBdge6kbk/TqzQfU/fudTDXc8J8nTwcnLEacPR3+S/IK?=
 =?iso-8859-1?Q?2HdG0UiE3qF+Ogy3g1sRMrmB08nQTa47dYUlo9t7iYvDaM2gZLGhzxzuqZ?=
 =?iso-8859-1?Q?Wf4kTxZB1brCVt+DvnjQbel1tXQjZL9W5X72pRLHKQ77ytHUPOkqp46s2n?=
 =?iso-8859-1?Q?vXATvzBXTHc/DegkYvHtHcHVXZD38kGEEgwwTauKvZ2D+FBIiCCHAmiift?=
 =?iso-8859-1?Q?QGJvC1IkIqM81mVnYay8P+26rSjUDqGOIqumDTNgno4DIQ/ekV9N7fH6Tj?=
 =?iso-8859-1?Q?b2IMvZtuYMrYFJqbhvtaPy3nyQAXOvMABOmqVMLqaeZiR/WdrGL3bFEyqV?=
 =?iso-8859-1?Q?F8W4z6pXXSU+/TG/Vdr4g+eVzekVDCDJFGssZ7VRSTt4WQueUU4HNgv0kL?=
 =?iso-8859-1?Q?lScFfzTaP8D+RL1vJ2NLXp51C42hEeh8QkPpul5cCZJgo0/1LLmO+AD8o5?=
 =?iso-8859-1?Q?gplEQJZoavYGC+Z2S3Ffahf9hSZqfvM7ZsxiwJ5Eixiua04x2HWzKZqOCk?=
 =?iso-8859-1?Q?J9EmoYMGm9NIBLANi55z1YAJ/epYqlb5Y939ZXNko/Al0QeJ8yFzVIO5vQ?=
 =?iso-8859-1?Q?Wc5vcJJpojQd/sMK5r8+ayu8e/MB6AIWqvtqu4jx7nMK216h+OsYq1FaQp?=
 =?iso-8859-1?Q?Q6v1an9L40O7mg2lrvrQEFpoEja17t9eQ21uPo6L7C+3L7UBVmWiLrN1ey?=
 =?iso-8859-1?Q?iq4uZ3jMFnIormpnRPTZXCIPMkspOSyUNSD8FXMkloymRodoav4WCfz1b/?=
 =?iso-8859-1?Q?wY2NCOykquY7H1xRN5GmfWXS3DEgkSl+rpi1cwIX8Hwd/lut8QQ3T0ryBH?=
 =?iso-8859-1?Q?clZhrcsOl6wizBvH1lSFPo9Ize3RDjLbEChqj/43rFodEZpemk2WjO9fFe?=
 =?iso-8859-1?Q?2tWzcv6POJX5QfXAm05h3IotXIES7z0XQU4We1Orjp6sICeoieQMlgZeCh?=
 =?iso-8859-1?Q?H2Dr3oTHJYeXvlPxHYqd1SQMDY8cw7H18+et8d6hX1T/LfQjwF8rctN64M?=
 =?iso-8859-1?Q?NrIBX4pkeEIUzUOYvfwgLONci50ONeKa9W/lRYzMjPptlVMjZWK5ByCQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 04468415-104d-4018-e10e-08ddc470e56f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 13:58:52.0714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HxGWwnprg5KrM+iyNVHfXaMfxZF29HcehibxG9R5eIciKP0TqQOe194GDmzINLuDU8oukvJYDYNB9x0Rq2264Zh0MwtGdO7JRwLMEFkVz9pZsWGzwARaSSe2ut5TpVbp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1349

Hi Krzysztof=0A=
=0A=
> From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
>=A0=0A=
> Add bindings for Omnivision OV2735 sensor.=0A=
>=A0=0A=
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io=
>=0A=
=0A=
I haven't added your Reviewed-by tag yet, as I made some modifications to t=
he DT bindings.=0A=
=0A=
Could you please review the updated changes?=0A=
=0A=
Best Regards,=0A=
Hardev=0A=
=0A=
> ---=0A=
> =A0.../bindings/media/i2c/ovti,ov2735.yaml=A0=A0=A0=A0=A0=A0 | 109 ++++++=
++++++++++++=0A=
> =A01 file changed, 109 insertions(+)=0A=
> =A0create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov=
2735.yaml=0A=
>=A0=0A=
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml=
 b/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml=0A=
> new file mode 100644=0A=
> index 000000000000..9236829cc00d=0A=
> --- /dev/null=0A=
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml=0A=
> @@ -0,0 +1,109 @@=0A=
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)=0A=
> +%YAML 1.2=0A=
> +---=0A=
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov2735.yaml#=0A=
> +$schema: http://devicetree.org/meta-schemas/core.yaml#=0A=
> +=0A=
> +title: OmniVision OV2735 Image Sensor=0A=
> +=0A=
> +maintainers:=0A=
> +=A0 - Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
> +=0A=
> +description:=0A=
> +=A0 The OmniVision OV2735 is a 2MP (1920x1080) color CMOS image sensor c=
ontrolled=0A=
> +=A0 through an I2C-compatible SCCB bus. it outputs RAW10 format and uses=
 a 1/2.7"=0A=
> +=A0 optical format.=0A=
> +=0A=
> +properties:=0A=
> +=A0 compatible:=0A=
> +=A0=A0=A0 const: ovti,ov2735=0A=
> +=0A=
> +=A0 reg:=0A=
> +=A0=A0=A0 maxItems: 1=0A=
> +=0A=
> +=A0 clocks:=0A=
> +=A0=A0=A0 items:=0A=
> +=A0=A0=A0=A0=A0 - description: XVCLK clock=0A=
> +=0A=
> +=A0 avdd-supply:=0A=
> +=A0=A0=A0 description: Analog Domain Power Supply=0A=
> +=0A=
> +=A0 dovdd-supply:=0A=
> +=A0=A0=A0 description: I/O Domain Power Supply=0A=
> +=0A=
> +=A0 dvdd-supply:=0A=
> +=A0=A0=A0 description: Digital Domain Power Supply=0A=
> +=0A=
> +=A0 reset-gpios:=0A=
> +=A0=A0=A0 maxItems: 1=0A=
> +=A0=A0=A0 description: Reset Pin GPIO Control (active low)=0A=
> +=0A=
> +=A0 enable-gpios:=0A=
> +=A0=A0=A0 maxItems: 1=0A=
> +=A0=A0=A0 description:=0A=
> +=A0=A0=A0=A0=A0 Active-low enable pin. Labeled as 'PWDN' in the datashee=
t, but acts as=0A=
> +=A0=A0=A0=A0=A0 an enable signal. During power rail ramp-up, the device =
remains powered=0A=
> +=A0=A0=A0=A0=A0 down. Once power rails are stable, pulling this pin low =
powers on the=0A=
> +=A0=A0=A0=A0=A0 device.=0A=
> +=0A=
> +=A0 port:=0A=
> +=A0=A0=A0 description: MIPI CSI-2 transmitter port=0A=
> +=A0=A0=A0 $ref: /schemas/graph.yaml#/$defs/port-base=0A=
> +=A0=A0=A0 additionalProperties: false=0A=
> +=0A=
> +=A0=A0=A0 properties:=0A=
> +=A0=A0=A0=A0=A0 endpoint:=0A=
> +=A0=A0=A0=A0=A0=A0=A0 $ref: /schemas/media/video-interfaces.yaml#=0A=
> +=A0=A0=A0=A0=A0=A0=A0 unevaluatedProperties: false=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0 properties:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 data-lanes:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 items:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: 1=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: 2=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 link-frequencies: true=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0 required:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - data-lanes=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - link-frequencies=0A=
> +=0A=
> +required:=0A=
> +=A0 - compatible=0A=
> +=A0 - reg=0A=
> +=A0 - clocks=0A=
> +=A0 - avdd-supply=0A=
> +=A0 - dovdd-supply=0A=
> +=A0 - dvdd-supply=0A=
> +=A0 - port=0A=
> +=0A=
> +additionalProperties: false=0A=
> +=0A=
> +examples:=0A=
> +=A0 - |=0A=
> +=A0=A0=A0 #include <dt-bindings/gpio/gpio.h>=0A=
> +=0A=
> +=A0=A0=A0 i2c {=0A=
> +=A0=A0=A0=A0=A0=A0=A0 #address-cells =3D <1>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0 #size-cells =3D <0>;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0 camera-sensor@3c {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 compatible =3D "ovti,ov2735";=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D <0x3c>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 clocks =3D <&ov2735_clk>;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 avdd-supply =3D <&ov2735_avdd>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dovdd-supply =3D <&ov2735_dovdd>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dvdd-supply =3D <&ov2735_dvdd>;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reset-gpios =3D <&gpio1 6 GPIO_ACTIVE_=
LOW>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enable-gpios =3D <&gpio2 11 GPIO_ACTIV=
E_LOW>;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 port {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cam_out: endpoint {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 remote-endpoin=
t =3D <&mipi_in_cam>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 data-lanes =3D=
 <1 2>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 link-frequenci=
es =3D /bits/ 64 <420000000>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 };=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 };=0A=
> +=A0=A0=A0=A0=A0=A0=A0 };=0A=
> +=A0=A0=A0 };=0A=
> --=0A=
> 2.34.1=

