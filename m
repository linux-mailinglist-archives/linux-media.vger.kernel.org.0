Return-Path: <linux-media+bounces-64025-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l6dvBCtJJGq14wEAu9opvQ
	(envelope-from <linux-media+bounces-64025-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 18:22:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A1D64DEB6
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 18:22:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=siliconsignals.io header.s=selector1 header.b=gePH9Wr5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64025-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64025-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=siliconsignals.io;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07FCE30209D5
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 16:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9BD3AE190;
	Sat,  6 Jun 2026 16:21:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021072.outbound.protection.outlook.com [40.107.57.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434152FC01B;
	Sat,  6 Jun 2026 16:21:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780762905; cv=fail; b=Wds4HDzkY7E6XZ10xZeUbEPPMaKaebBAIg/MxGbyfWyYxkBBXoWbTCnwlbRyaiIcgjaKQMcfhIHln6IJnYRjlon5mjZEk+qGD1H2JREfUA2IfC8Jam/wYEWxA8GFhtY2HHOC2+OMkqI2ImtbAEW/ix5j+7beUiP3ki/y/7oGBdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780762905; c=relaxed/simple;
	bh=Kr4hNKaxXC0D/CQ3rJpLWpWjNu71dXnfzUQvzp4orhk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dTlVXxdF+sAI48ZML5i67tEDuP1w5w/aDfK9+kMUV8MHcDdYOkczLDQxiZ0HlkKwE23+wNLkZOQBNmrP4y3tDN+vRbHwkLglrxzw60g7tppMSbKxD5HKRNuTw+5/ciO8f8G07D6t4AnY3zCyOFdL9TaXbgkyQmM5JIrzIoSC4OU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=gePH9Wr5; arc=fail smtp.client-ip=40.107.57.72
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KrgDnszLFBDOnrJGdRaoRehscsAXsNkE3cdEQlxqcwbjX54eXUAEMuNuzbwid2qBubGDkI5IujmwO0kNg2eRYWjC3UMeZ4mjz1JI/uzbdNB1rOXh1PaCe9N6NjQAg1HgOVkdRnZBIxtrmNsDiFAUuzsL5h+D8xepNk9saX1+W3aya3rQLioTY+6YlA6Wu/Y7xxQX0VyLICWdbVOIjqi0LWnO92XXybl9avloyZXKbIrzIDascPQv1zlrfN+STAP0i1G6U/80gFs8O4HfnFwqYkNDCWSO7SZvUDYHLFvo0GbU4DDlXJJW1MHLAnHgzorV5XO5gNnG/WP9+2KnZO+Jcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hl+t+KtZQLCtCmdgeVy3OG3tF/O02ti45zt4TaRPUo8=;
 b=hkYzB21iOEs4FnvFhCs1ylM4CfQQKvAHCIkTad1MMbJs/JLgWUFN/Y9Qc9PIIFYV9StVlxvGrFEo75lw+wSzgkS2hsZ4Y1B0LMdOst2nssllFQwPWm/RK09hrP/7ihUnViiPqsp0uYSiE7SveoSq96gkEtkiDaOUDB5qQBEE4S1z6dqjCuRy+A1PvAXQ8Adf9L1vvI8bTXpvO/A4saUQewdMnG7UZrXJej4CtnA1Aq9a5y/JLa695FTwXx1aMD1R971bpIgwoX/Sq08kV7RFoLB4HWPwTYP2XoeUdENy/6LGc2btD3TnL/d9MGq9cDBfkefajQEzU4WLAOEyd7gZhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hl+t+KtZQLCtCmdgeVy3OG3tF/O02ti45zt4TaRPUo8=;
 b=gePH9Wr56THYyCr/vKYx5IYup78YCoDm9ti1YHb8nFVKnF/JBv8QvqvDwNvPmhhD2TmSPi9sU+P5w5Nc/fXbjsnWsRq+UT8rjFfFE4+MJgTSGTDL7EB8jvE/9Ov3ZbWbpnQuKKkN+AkkqmiRwkB5QfFBkJEmHVAw9bP4Rsba2sE2kCFuIOWtXRjMrTSZo88WS7OWmER9gL6oVapbvjbwACfnjpz5XtZm6bW9/G9myKtzR/sme37mtscLgOkAs7P22HVp2PXBwyuKY+GIKoX5yrrUDJ+wMHi1+e+4MWGqxIj8WbJnGb9z74NoSySKW3UaMOONs4JZwdM0WJRwWDaqCA==
Received: from PN0P287MB1828.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:18b::12)
 by PN3P287MB1607.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Sat, 6 Jun 2026
 16:21:38 +0000
Received: from PN0P287MB1828.INDP287.PROD.OUTLOOK.COM
 ([fe80::2e4e:1a44:6d5:1565]) by PN0P287MB1828.INDP287.PROD.OUTLOOK.COM
 ([fe80::2e4e:1a44:6d5:1565%6]) with mapi id 15.21.0092.007; Sat, 6 Jun 2026
 16:21:38 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Jai Luthra <jai.luthra@ideasonboard.com>, Conor Dooley
	<conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: Lachlan Michael <Lachlan.Michael@sony.com>, Ryuichi Tadano
	<Ryuichi.Tadano@sony.com>, Kengo Hayasaka <Kengo.Hayasaka@sony.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] media: i2c: imx678: Add driver for Sony IMX678
Thread-Topic: [PATCH v4 2/2] media: i2c: imx678: Add driver for Sony IMX678
Thread-Index: AQHc9QDxR/cbdD8AmEyAZncD5gOfZLYw/V86gACHxYCAAAc0YIAAHBQAgAALeNw=
Date: Sat, 6 Jun 2026 16:21:38 +0000
Message-ID:
 <PN0P287MB1828B9AF2057CE964675318E8B1E2@PN0P287MB1828.INDP287.PROD.OUTLOOK.COM>
References: <20260605-imx678-v4-0-58e57c67143d@ideasonboard.com>
 <20260605-imx678-v4-2-58e57c67143d@ideasonboard.com>
 <PN3P287MB1829593C2DF9AFF8F24A39AF8B1E2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <178075217188.9570.14789474340505402551@freya>
 <PN3P287MB18292FBAEABB556C051434848B1E2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <178075974823.9570.15829300390679437100@freya>
In-Reply-To: <178075974823.9570.15829300390679437100@freya>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB1828:EE_|PN3P287MB1607:EE_
x-ms-office365-filtering-correlation-id: 27cbe7f3-8c53-426c-13ae-08dec3e7af75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|10070799003|18002099003|22082099003|38070700021|3023799007|6133799003|56012099006|4143699003;
x-microsoft-antispam-message-info:
 A8l4yxr1T9qqmWe6bXv4j6vt01o380Ikx/bdy9s2Bl/osZ75WOG4HFF6QnTPUk3bh9klOc8taZG0hMhbrl1l3UMj4VwvRroeb8HkxzYeaxLwRT3yY01lx4LxKvnmS/boYtKykxfbl3KD1al2mIaGuGVrRzSd7bXvP8QPPfWUFfjAPEomcWFBquNqWPEzr+0gmRhyHm4rRnOoO/Ga64l38EelG6e/3yojPwvc9OsurL9QYW5g7y1YtYj+DSDRWTYrKsmfzPQ0E8FPO19jbU7zrU/3w5/9i7J8+Hkd7gZe+QNbCQ/jRBadJelkvfxy8O8nz98HQDQjOg78s9UeDtEpyjwNDTEwrXU+QicdYLGUtrFv5jMuJOkCinHQ1WsjWR3uYz6sJOenOHJ/cUOU+hwvVzQEqO4sBvIQ+srVV5U1CoXU4uUNEYEqOLxsmQNzfwivYSkKxYJB4duq+KrnKj2AIm6ll4l3AHaV5bLdgkhbQT2qu1sPRk75DrJvwZqXbnsbNiFvfApdeinODXhFQrWiLBSqkeaH7Lgr+ApcMrdbZKhLZNQz2sGi49VFlInctcVvlgDCI1GQidBa4vEWj0w9I/8L4Ifj5kc0ij1i8uYCzz5lh5Ts4v3LMa1PiA1N6pCh1XCiGr8N5GAQbjUr3r0MQ2kqrnmaL/O3pv0gIQME4FYjAd6tzbDNGQUHVWSMJ2UlbP4SgOaKRIbEp7C98ZxcrQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1828.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(10070799003)(18002099003)(22082099003)(38070700021)(3023799007)(6133799003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?idWeIlAvDw0OeypfPvIZ9/dD7/JI6Byf1fl5Ad10jggKJKL6aC9hGW13Z5?=
 =?iso-8859-1?Q?uRxxz1MLZuEPSU5b3m41wKKbW9ibfqmJSGm88x4AnMw+mZAs/mt78es0Cw?=
 =?iso-8859-1?Q?9WLSkeic0ygOsxTGZBF77Cq6+mhuRJTM1bdvzi1ztM/qe/J1r2XwjvbYDf?=
 =?iso-8859-1?Q?Bc4tyXjNRiM4em3ZQqfvmn6eaqXkJUBVxVwDWMty8kedm3v9Gj2tj98PNW?=
 =?iso-8859-1?Q?RDZ5EteLp5hkjQArsOvoQGzB+9HQroo+D/5013mYIrsJHlTGI/XhCkL8P0?=
 =?iso-8859-1?Q?yRlQLM83Ec1vHx0SKICm/WIC5UqiO1uEHbIpk9qnRtabk5tf5EvUG7u6BZ?=
 =?iso-8859-1?Q?QnBZUR/2tZpPWyFexMLKgf3Y+glYBX5GS24pe+uacgRw59lrzrb16DI3Zb?=
 =?iso-8859-1?Q?eM1E1wjWMkIjbM/TPYRq/mX62XkfNJsoG4nIDAeBwrbDy6N8hbek+8WsTg?=
 =?iso-8859-1?Q?iMyYYb6TX3A4WJV2Wl4+MELxJf/OGhmvOkWbVuczXQ/JuqXCw0gnagOPZn?=
 =?iso-8859-1?Q?JNVx1PWe84IeV2NmbcxaWKr3kw6NkKS+xrHFI0WE4MedddYMeMyzyPjtxJ?=
 =?iso-8859-1?Q?K4pccKuUmmjgyRk+hOZOhuq4vkuXrI2NVSB3ZjbfccBlG1GT/f8nJA/+OD?=
 =?iso-8859-1?Q?IsxROhAI6PBQaVFFu65KRjbhbDzZcnVEEjyneKFa4cqMrxc4fFI+ZZkTcN?=
 =?iso-8859-1?Q?d3GAJVpDcClMeHYSXOA6mi6NK8wuF2+itoxypxl6JZNThar/wS3HWSyUH1?=
 =?iso-8859-1?Q?8pb+44yryGG9vg88bYDK2KWUIDsaauyZKM6VV8UsrDOigqJqmmJaOTKb8B?=
 =?iso-8859-1?Q?ylV5aRZnHvmVe5TGHMi6eU0srdeqELPs/rw5q6AgBOaHRld4JCoq9ROYvO?=
 =?iso-8859-1?Q?LZUN7IME9w9FeW+2Jd16Nz8mUYWmfKzVzApi0rOKcPJHABmAaGVsI/oUTe?=
 =?iso-8859-1?Q?1GyZXuMkRfTSpYotKZ1zvpK4Qa0stegFLQYYxXeAFT4SDpVwBFTo+lxhCh?=
 =?iso-8859-1?Q?u9azyN+SRimaFOfxH88aVD8+o5uL39qgZjG6bgAvbLfMQtwBx8wOnYDP7b?=
 =?iso-8859-1?Q?pmauxKPVaUK1u3y0rFa4P6bRCD7TNJk9p0We+P2XxXEz83L0QdR3gFl9sZ?=
 =?iso-8859-1?Q?3QSW61lWN9Q11SfNMyxX3hqvnIqDp+p4nCHWsSXv/wBg6Qz6YWYUQ/Tol4?=
 =?iso-8859-1?Q?V8ySHCnYYYA2ehUc34Ix12744IpcPCIVjb8S1ywG2M96q8bZAxb8cVh8C5?=
 =?iso-8859-1?Q?NG8xJ+Sv8rLfI9j+vzE0Yah/hPyAB1hBQSMaXUQQ5Vuo/EUsY+sQ7dYtuh?=
 =?iso-8859-1?Q?7+a3V4qua00efp9KYDYwqf8Pyv32jskvaNzHi99xqR7MQ5l886/aAhyDdF?=
 =?iso-8859-1?Q?AiCbj7iUiU8Y8MmxRUcSHsKkoV5PSKlzd5F2Tj7G8UDv7cP03ATokVRH7G?=
 =?iso-8859-1?Q?iLvezWnMfJ/MIszpgkQCfjgi/99ebU52mfxROR1E3+/IQXy5vMeyPq1fl5?=
 =?iso-8859-1?Q?FxYv6joxQk2ct6cdtbnQrz+O7XeE2omVLev/YFK/cuNpdXiAgb61HSCi77?=
 =?iso-8859-1?Q?pEc5nRgeGT3ypEGwoIeiq1QRispVnoNPw7XvIH946FON3FolL40GuujRQx?=
 =?iso-8859-1?Q?cUo08ZgzpnUup35d2UeU6eVm3OiDOeuvbzLg5IvMvSZRXuUsV2+rhyHhTb?=
 =?iso-8859-1?Q?ebg60k9MP7Kl4JVWEHzXthuCcXgLpH5c4gfBJau8tw8wkA5/QZQdy2RtBs?=
 =?iso-8859-1?Q?5sMKc9712zzCWmtrMP7tIQIVU/DEfMRT6gO5VCdm59lTE4QBZMoTv1qfpT?=
 =?iso-8859-1?Q?WdFY3Xm2BzZQkECG84p3yXQvi2kys1dNH81m81HCc5TgJdmpJznqdiOWdf?=
 =?iso-8859-1?Q?sO?=
x-ms-exchange-antispam-messagedata-1: 7+OW6hjudy4YWC+Uc95zxHap8AA3nTYSTQ4=
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
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1828.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 27cbe7f3-8c53-426c-13ae-08dec3e7af75
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2026 16:21:38.1444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7lK0+bcDCkEa0188W/BefyvRECOw7nLe13DTY77p3aPNay2dF8RE4u4nWDu4KA4xU3fJEST/rOTzULfLGnOX0WRn5y3c0BI2SHsqq9vypzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1607
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64025-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:conor+dt@kernel.org,m:kieran.bingham@ideasonboard.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:sakari.ailus@linux.intel.com,m:Lachlan.Michael@sony.com,m:Ryuichi.Tadano@sony.com,m:Kengo.Hayasaka@sony.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,siliconsignals.io:from_mime,siliconsignals.io:dkim,PN0P287MB1828.INDP287.PROD.OUTLOOK.COM:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64A1D64DEB6

> Quoting Tarang Raval (2026-06-06 20:15:48)=0A=
> > Hi Jai.=0A=
> >=0A=
> > > Quoting Tarang Raval (2026-06-06 13:47:36)=0A=
> > > > Hi Jai,=0A=
> > > >=0A=
> > > > Sorry, in my first review I missed a few minor issues listed below.=
=0A=
> > > >=0A=
> > >=0A=
> > > No worries, thank you for the reviews.=0A=
> > >=0A=
> > > > I also noticed one major issue in the driver. Please check the comm=
ents below.=0A=
> > > >=0A=
> > > > Other than that, the driver looks perfect.=0A=
> > > >=0A=
> > > > > Add a V4L2 subdev driver for the Sony IMX678 image sensor.=0A=
> > > > >=0A=
> > > > > IMX678 is a diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type=
=0A=
> > > > > solid-state image sensor with a square pixel array and 8.40 M eff=
ective=0A=
> > > > > pixels.=0A=
> > > > >=0A=
> > > > > The following features are supported by this driver:=0A=
> > > > > - MIPI RAW12 output=0A=
> > > > > - Monochrome and Color (Bayer filter) variants=0A=
> > > > > - Multiple input clock frequencies=0A=
> > > > > - Multiple link frequencies=0A=
> > > > > - VBLANK and HBLANK control for variable framerate=0A=
> > > > > - VFLIP and HFLIP control for flipping readout=0A=
> > > > > - Exposure and analogue gain control=0A=
> > > > > - Test pattern control=0A=
> > > > >=0A=
> > > > > Following features are not currently supported:=0A=
> > > > > - MIPI RAW10 output=0A=
> > > > > - Pixel-perfect crop reporting, accounting for the shift-by-1 whe=
n=0A=
> > > > >   doing HFLIP/VFLIP where the sensor maintains RGGB bayer orderin=
g=0A=
> > > > >=0A=
> > > > > Along with the ones below which depend on the new raw sensor mode=
l:=0A=
> > > > > - Embedded data stream=0A=
> > > > > - Freely configurable cropping=0A=
> > > > > - Increased framerate when cropping=0A=
> > > > > - 2x2 binning support=0A=
> > > > >=0A=
> > > > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>=0A=
> > > >=0A=
> > > > ...=0A=
> > > >=0A=
> > > > > +static const u32 codes_bayer[] =3D {=0A=
> > > > > +       MEDIA_BUS_FMT_SRGGB12_1X12,=0A=
> > > > > +};=0A=
> > > > > +=0A=
> > > > > +static const u32 codes_monochrome[] =3D {=0A=
> > > > > +       MEDIA_BUS_FMT_Y12_1X12,   /* 12-bit mono */=0A=
> > > >=0A=
> > > > Above comment adds no useful information and can be dropped.=0A=
> > > >=0A=
> > > > > +};=0A=
> > > > > +=0A=
> > > > > +static const struct imx678_model_info imx678_aaqr_info =3D {=0A=
> > > > > +       .type =3D IMX678_COLOR,=0A=
> > > > > +       .codes =3D codes_bayer,=0A=
> > > > > +       .num_codes =3D ARRAY_SIZE(codes_bayer),=0A=
> > > > > +};=0A=
> > > > > +=0A=
> > > > > +static const struct imx678_model_info imx678_aamr_info =3D {=0A=
> > > > > +       .type =3D IMX678_MONOCHROME,=0A=
> > > > > +       .codes =3D codes_monochrome,=0A=
> > > > > +       .num_codes =3D ARRAY_SIZE(codes_monochrome),=0A=
> > > > > +};=0A=
> > > > > +=0A=
> > > > > +static const char * const imx678_supply_name[] =3D {=0A=
> > > > > +       "avdd",  /* Analog (3.3V) supply */=0A=
> > > > > +       "dvdd",  /* Digital Core (1.1V) supply */=0A=
> > > > > +       "ovdd",  /* IF (1.8V) supply */=0A=
> > > > > +};=0A=
> > > > > +=0A=
> > > > > +struct imx678 {=0A=
> > > > > +       struct v4l2_subdev sd;=0A=
> > > > > +       struct media_pad pad;=0A=
> > > > > +       struct regmap *cci;=0A=
> > > > > +=0A=
> > > > > +       const struct imx678_model_info *info;=0A=
> > > > > +=0A=
> > > > > +       struct clk *xclk;=0A=
> > > > > +       u32 xclk_freq;=0A=
> > > > > +=0A=
> > > > > +       /* chosen INCK_SEL register value */=0A=
> > > > > +       u8  inck_sel_val;=0A=
> > > > > +=0A=
> > > > > +       /* Link configurations */=0A=
> > > > > +       enum imx678_lanemode lane_mode;=0A=
> > > > > +       unsigned long link_freq_bitmap;=0A=
> > > > > +=0A=
> > > > > +       struct gpio_desc *reset_gpio;=0A=
> > > > > +       struct regulator_bulk_data supplies[ARRAY_SIZE(imx678_sup=
ply_name)];=0A=
> > > > > +=0A=
> > > > > +       struct v4l2_ctrl_handler ctrl_handler;=0A=
> > > > > +=0A=
> > > > > +       /* V4L2 Controls */=0A=
> > > > > +       struct v4l2_ctrl *exposure;=0A=
> > > > > +       struct v4l2_ctrl *vblank;=0A=
> > > > > +       struct v4l2_ctrl *hblank;=0A=
> > > > > +=0A=
> > > > > +       /* Tracking sensor VMAX/HMAX value */=0A=
> > > > > +       u32 vmax;=0A=
> > > > > +};=0A=
> > > > > +=0A=
> > > > > +static inline struct imx678 *to_imx678(struct v4l2_subdev *_sd)=
=0A=
> > > > > +{=0A=
> > > > > +       return container_of(_sd, struct imx678, sd);=0A=
> > > >=0A=
> > > > Use container_of_const.=0A=
> > > >=0A=
> > >=0A=
> > > Why is that necessary?=0A=
> >=0A=
> > container_of_const() preserves const and avoids accidentally casting it=
 away.=0A=
> > For non-const pointers it behaves the same as container_of(), while for=
 const=0A=
> > pointers it preserves constness.=0A=
> >=0A=
> > >=0A=
> > > > > +}=0A=
> > > >=0A=
> > > > ...=0A=
> > > >=0A=
> > > > > +static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
> > > > > +{=0A=
> > > > > +       struct imx678 *imx678 =3D container_of(ctrl->handler, str=
uct imx678,=0A=
> > > > > +                                            ctrl_handler);=0A=
> > > >=0A=
> > > > Use container_of_const.=0A=
> > > >=0A=
> > > > > +       struct i2c_client *client =3D v4l2_get_subdevdata(&imx678=
->sd);=0A=
> > > > > +       const struct v4l2_mbus_framefmt *format;=0A=
> > > > > +       struct v4l2_subdev_state *state;=0A=
> > > > > +       int rpm_in_use;=0A=
> > > > > +       int ret =3D 0;=0A=
> > > > > +=0A=
> > > > > +       state =3D v4l2_subdev_get_locked_active_state(&imx678->sd=
);=0A=
> > > > > +       format =3D v4l2_subdev_state_get_format(state, IMX678_SOU=
RCE_PAD);=0A=
> > > > > +=0A=
> > > > > +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
> > > > > +               u32 current_exposure =3D imx678->exposure->cur.va=
l;=0A=
> > > > > +=0A=
> > > > > +               imx678->vmax =3D format->height + ctrl->val;=0A=
> > > >=0A=
> > > > ........(1)=0A=
> > > >=0A=
> > > > > +=0A=
> > > > > +               current_exposure =3D clamp_t(u32, current_exposur=
e,=0A=
> > > > > +                                          IMX678_EXPOSURE_MIN,=
=0A=
> > > > > +                                          imx678->vmax - IMX678_=
SHR_MIN);=0A=
> > > > > +               ret =3D __v4l2_ctrl_modify_range(imx678->exposure=
,=0A=
> > > > > +                                              IMX678_EXPOSURE_MI=
N,=0A=
> > > > > +                                              imx678->vmax - IMX=
678_SHR_MIN,=0A=
> > > > > +                                              1, current_exposur=
e);=0A=
> > > > > +               if (ret)=0A=
> > > > > +                       return ret;=0A=
> > > > > +       }=0A=
> > > > > +=0A=
> > > > > +       /*=0A=
> > > > > +        * Applying V4L2 control value only happens when power is=
 up for=0A=
> > > > > +        * streaming=0A=
> > > > > +        */=0A=
> > > > > +       rpm_in_use =3D pm_runtime_get_if_in_use(&client->dev);=0A=
> > > > > +       if (!rpm_in_use)=0A=
> > > > > +               return 0;=0A=
> > > >=0A=
> > > > As in the last revision, as I suggested before, I will again sugges=
t using=0A=
> > > > pm_runtime_get_if_active() here instead of pm_runtime_get_if_in_use=
().=0A=
> > > >=0A=
> > > > This does not seem to align with the comment above:=0A=
> > > > Applying V4L2 control value only happens when power is up for strea=
ming=0A=
> > > >=0A=
> > > > "Power is up" implies that the device is in the runtime PM ACTIVE s=
tate,=0A=
> > > > rather than simply having a non-zero usage count.=0A=
> > > >=0A=
> > >=0A=
> > > I agree with the comment being slightly misleading, but same as the l=
ast=0A=
> > > revision, I still don't fully buy your argument here :-)=0A=
> > >=0A=
> > > In the case you talk about, where PM is ACTIVE but usage count =3D=3D=
 0, we=0A=
> > > anyway know that the count will only increase when .enable_streams is=
=0A=
> > > called, at which point the driver will anyway write *all* the registe=
rs=0A=
> > > including calling set_ctrl for each control with the cached values.=
=0A=
> > >=0A=
> > > So why should we do (redundant) writes here?=0A=
> >=0A=
> > I think this is mostly a difference in expectations.=0A=
> >=0A=
> > My view is that if the device is runtime PM ACTIVE, the hardware is acc=
essible=0A=
> > and register writes can be performed. In that case, I would expect a co=
ntrol=0A=
> > change to be applied to hardware immediately.=0A=
> >=0A=
> > With pm_runtime_get_if_in_use(), there is a state where the device is s=
till=0A=
> > ACTIVE but control changes are only cached in software and not written =
to=0A=
> > hardware until streaming starts again. While the value is not lost, I w=
ould=0A=
> > expect hardware and control state to remain synchronized whenever the d=
evice=0A=
> > is already active.=0A=
> >=0A=
> > So I understand the cached-control argument, but if the hardware is acc=
essible,=0A=
> > I would prefer applying the control immediately rather than deferring i=
t.=0A=
> >=0A=
>=0A=
> Why does it matter if some sensor register doesn't match the value in the=
=0A=
> cached controls for a brief period after streaming stopped and sensor is=
=0A=
> powered off? We don't have autosuspend timer here like other drivers.=0A=
>=0A=
> I'll update the comment in v5 for future readers/developers in case that=
=0A=
> changes.=0A=
=0A=
=0A=
Fair enough for me.=0A=
=0A=
=0A=
> > > > I also don't understand why we need to be strict here and require t=
he=0A=
> > > > runtime PM usage count to be greater than zero. What matters before=
 accessing=0A=
> > > > the hardware registers is that the device is powered and accessible=
, not=0A=
> > > > whether there is an active user holding a runtime PM reference.=0A=
> > > >=0A=
> > > > Anyway, rpm_in_use does not seem necessary here. The check could be=
 simplified to:=0A=
> > > > if (pm_runtime_get_if_active(&client->dev) <=3D 0)=0A=
> > >=0A=
> > > The rpm_in_use value is used below in this function to ensure we don'=
t do=0A=
> > > pm_runtime_put() in case of a negative retval. This is not really han=
dled=0A=
> > > by most drivers today, but I wanted to fix it here given recent discu=
ssion=0A=
> > > [1] and annoying Sashiko reports.=0A=
> > >=0A=
> > > [1]: https://lore.kernel.org/all/ahyh0ZlwlZqr7VNa%40kekkonen.localdom=
ain=0A=
> >=0A=
> > Thats my understanding as well. With:=0A=
> > if (pm_runtime_get_if_active(&client->dev) <=3D 0)=0A=
> >         return 0;=0A=
> >=0A=
> > both the 0 and negative return paths exit immediately, so neither the s=
witch=0A=
> > statement nor pm_runtime_put() can be reached.=0A=
>=0A=
> If we do that no controls will be written to the hardware if userspace ha=
s=0A=
> disabled runtime.=0A=
=0A=
Do you mean the case where userspace disables runtime PM via sysfs while =
=0A=
streaming is still running?=0A=
=0A=
In that scenario, shouldn't the device usage count remain non-zero due to t=
he=0A=
active stream?=0A=
=0A=
Best Regards,=0A=
Tarang=

