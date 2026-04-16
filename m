Return-Path: <linux-media+bounces-58849-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EF/SE/ly4GlkgwAAu9opvQ
	(envelope-from <linux-media+bounces-58849-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 07:26:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 610EE40A5E9
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 07:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A79A3052706
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 05:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D0A36683D;
	Thu, 16 Apr 2026 05:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="DzzIGpjX"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021140.outbound.protection.outlook.com [40.107.42.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFE623BF9F;
	Thu, 16 Apr 2026 05:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776317146; cv=fail; b=LytQUiTyHjJydxRU158b24Ug8P9rKOVMPMFQaB0TAGECc8acSU8x95V9et9Q+Y9/blO26RgrnaeiKUiokQafs2gY0DrSbNZAXZrE67LNEIW6AdxwgmCyg8fjiAZGffmNZsYCfsdqFqEn5EH4vspiyahZTT8PJjyMktSgqJawciU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776317146; c=relaxed/simple;
	bh=uFgJ6GMv5D/Q8Q4S2P5logCH1hUIVmuaJuhWwLdggns=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PnaX5iq+xn1z8Of+2KW57MsplvXq+fjrJV0d75WpflUCu7VZ1M+987fKSIcp/4vF4YZUqptjXBIqPM9DkyMJv16qqVbnSnQ2uo/LC/RBpBBI25TS234g99GoyhAdoqVhqLmdym8zIXdP8u0Zs5uckuQAlS0nApuKsyz0A1lYZkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=DzzIGpjX; arc=fail smtp.client-ip=40.107.42.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqFDEhCI7zydtyiH/GCit2b94TFdwfA2UO2yrBRTsnV0+kHhkOoFsiEiaboX3pjJ3YbTgg1nQ+oZMorcHmKuRePrR/26KqErMOCA+M8rroqkHiULKcD62e2iIhJ/+WMr9ghgcnq0IGD17KuuQv8NkkKg320t1RSCxFGGhgmLh3NeNXt1gvv/JuJsonPbG70ro9ISWv9uSWkNshhlGfD0wZTCglLAvUqGeE1djm5XQVg24gvZE7LxS7GYnSjIpFxmlfDzRgK8nxLMMYa+ODAFMMhvuBwu6hkd/TBkqRo2WYrFJMdScZj6zIZIzCySPGm2cNBiq2WqaJJ8cZwXaYbvQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFgJ6GMv5D/Q8Q4S2P5logCH1hUIVmuaJuhWwLdggns=;
 b=DO99EmxI9WcPG+3DIpai1FosfADi0YoVT8ockt0gvylW2AFueP/goy7Hzj1NUGyrJZItieMVgKE+5FwWFg2Tcplu4f8v8XQwTY4zjk3b7SeJqajs+LCszYI2YdjW1ub1hD9kH1sDu6gqQPSttDjdNXNBEQ2leyqpiX8sQK9USLMLUXtRZPtF1wpGzeHfDKHgPmROxpz1kW+7FZm3ApRHOrxyM4rtqf/zH3H4OdfEOb0NUexrvpBpgpgzHZAfpTJc1PWcWFASjCm/ejdDg46jQ1HF0WClG+iX7MyzS7h0MR22a/p+j9VLA96VOXjKlxrtPTsyMASZWAE/fGHR5fp3ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFgJ6GMv5D/Q8Q4S2P5logCH1hUIVmuaJuhWwLdggns=;
 b=DzzIGpjXGpEvA2EnHpIFI4eM2hIL3eHiHfEzO3TSxj2TJhfch9N+MsHJgxHgxQmt7G9NkWM0uNtXxUme3yLZf+wGOT088qCFIQbwJcpf+KVG+R6YQwpQM5AptxFWIlAYVuLuw6kmNV1bVZN0NkTGse595DR67RLDPTbCYkcJxJc=
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SL2P216MB2974.KORP216.PROD.OUTLOOK.COM (2603:1096:101:287::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 05:25:38 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%5]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 05:25:38 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>,
	"marek.vasut@mailbox.org" <marek.vasut@mailbox.org>, Ming Qian
	<ming.qian@oss.nxp.com>
Subject: RE: [PATCH v4 3/9] media: chips-media: wave6: Add Wave6 VPU interface
Thread-Topic: [PATCH v4 3/9] media: chips-media: wave6: Add Wave6 VPU
 interface
Thread-Index: AQHcQygbwPgPL4VUWk2ynBZ+eD7wh7UblwiAgMZnzJA=
Date: Thu, 16 Apr 2026 05:25:38 +0000
Message-ID:
 <SL2P216MB244147720D30CEA2730D459BFB232@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <20251022074710.575-1-nas.chung@chipsnmedia.com>
	 <20251022074710.575-4-nas.chung@chipsnmedia.com>
 <7306c00b626f4030d92b908022b9a39669b07bb7.camel@ndufresne.ca>
In-Reply-To: <7306c00b626f4030d92b908022b9a39669b07bb7.camel@ndufresne.ca>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|SL2P216MB2974:EE_
x-ms-office365-filtering-correlation-id: 90d48382-284a-4136-b280-08de9b789853
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 ABD2LLgtRXogwXQGnD3ruFwOAI/eWN1t08iRsYZAoumsQtaeZvQMFlpnZepEvwc6JqbMn5JFQevWngobJwbcfeDhVVVAsXuOteSr0g/NTSwSdjMICJAfpGUp0PqnSEV19AM85AjUurZHDDpzZBlJ6BP7uBqUrYM80aycEMrt8Fe8XSf/wlG7d3OyruE1w2/Jaz8ldSHoHIu+5TL66V5quk1GgIPeElWocgOJwgKIw31JVeqXpzbWGpZ2DgmCV7QjP1gUDjfbThCGKjyYEZaStTNvj3cmWi/Q01LJYfmVguclityNg6wqyxSBqBllub6wwR42xPzFSih9waELOjlCGehmz2+W09DkUxOFhmd7dX+sY3wdAHUOVcILPdRfikvgTu/ham5NRBugbyiXZSM6LbliK85hetg67T9INmKw15lpt6uMHP2FQxZbPZn1PeD9ZxvUSCj0cxP+gtWRnZ2psZtxQvmg2eeoKlRcowG54LieBbW1vBS1UyIiqVzGira3lQplAwVXj1tFb73m1Ffh3nhLZnUXXreIacNjncP/nzXEbTwpbe2YeZxwMHZ0eNsv9JK7NC7gaNQ/DdIbWx52axD8ABM9g5AF2E+UbLJ4IzVGRj39f6OIdmjxgYWvbOoGFJL+ZD4krEmrnYCVE8jfa/0j67VFLDseuAJwwbu8JsZ5sP+U4venKXPZfvSsIj9Gpr/UVx8UTyg2HSi7vJi4IKoZk9q79+IvI6LVHm1DgRGkrSB+X/KENxJJxB+bqo/eoO9vaBE4TNzjd6gm0BAgrUjdJXrK0mbZzKNK03rOM8o=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?h66ruLH5NwH+SAx7nlUAeOOY0XtB8GEXmYMaIjASjFGrHlUuy9kKOrOmou?=
 =?iso-8859-1?Q?3LJwY9Gf1LyMoP/HdZl2ybmwb9/v4XmVJJbP7W6caW/jpbycxYfX+K3oHp?=
 =?iso-8859-1?Q?E11iZLX1zcGbWoUAki7WpR2hZMCnx2yoTb6M+Ky3bh5RL2k/FJG35fdPTM?=
 =?iso-8859-1?Q?cPeYELpMc5R5kCOJlRdWNOrI6IA8M+7Umo0bRgKRIHOSWacyQ+P2VPHFZq?=
 =?iso-8859-1?Q?OnmaI2zrhUq1a4SRolDrDdd6/Th4kc9BBK+pggz/LSbY3vNNGvydev7rD8?=
 =?iso-8859-1?Q?PcRag8nKh1uH02dJc0eGZvb66OV95KMsQ/gnD7y553byHLfv8Ea3GMMoxR?=
 =?iso-8859-1?Q?GLTqwV2xIi7XB9105jJw8rWinBTgiey6oQxHMm82o09llmtaH/9IRRa5/a?=
 =?iso-8859-1?Q?PfWM55qLKY8TOON15qXNyTETlUOzeYUne/GFhEB7NihC9ET1T3v8PaussY?=
 =?iso-8859-1?Q?dsRyXlwmIwbDsJeLmE7TncUIt9PcLEEgt2fw9/fkO03dj9luMoOCj49O4y?=
 =?iso-8859-1?Q?6tiDSwqD5Qus5XD7ZSzhODvmmESQwEbvJEnxFH/jFvJdZoWYwC+OzCQ34B?=
 =?iso-8859-1?Q?wG3RhswbhZJTzCf7iQxo0gHe+OcOk8dEZAycIcqFvvinQBzNtwZvGIrToh?=
 =?iso-8859-1?Q?ZB0ETXAl2CDtpcfqlj+jWN0+o8b/VUmAbMn7FiVKsR6vtaqtExgE/L/9Xf?=
 =?iso-8859-1?Q?60AzUtbBZ2xnZnm6KJizChmlEuowheJh/dqdOF8DlTBu/YU4It4COpliYs?=
 =?iso-8859-1?Q?3FLpXNPqaRNK9xPEVsHFPeyOucd8TBtjWJOmGQ/kWhSOWvSCIxXr+BpEnS?=
 =?iso-8859-1?Q?apfbWyE/ezZDXoAUD5xYtcUrj7jB0TZ7Nt9QAQeXZVbs682r5QGzMOgmO6?=
 =?iso-8859-1?Q?vfZvFwFYwU5ccK/VH/irwoaafeRmlTFsz/seXalHc2WfWAketOUuW3BW3R?=
 =?iso-8859-1?Q?LQCICyuIqtRMHIHNGWqL0joamDbEQht7TA9CHj7L9CQnXBDHCXFDoeQhtj?=
 =?iso-8859-1?Q?zkJ4spCj66Ra+ke4DSSLEmJY1hzwoxpd4ywwuTHMOenhEbGv2lsKb6Zy7J?=
 =?iso-8859-1?Q?UkCavqJHZuGiSudayDt67dSjT0vqXMxNyRpwwv8/u5N83+0fOgW8clBbnG?=
 =?iso-8859-1?Q?c11HE9HoPETxWBkMBX21GGNWoZkUd5a/bytV+k9Osgc3A04ICyDmQ8CzqP?=
 =?iso-8859-1?Q?N2Pwn7kH+GKfJea/zkCRNXu6CxLqmADddOMUQQvIxemaZw7vlBn4HJtTaq?=
 =?iso-8859-1?Q?waZ5S5fRGAnJpgfGHbQ72zkIkxBjT4F/Z1R1w+iEIxQ7Tk7PHSNzYDz2TJ?=
 =?iso-8859-1?Q?srx2Itp9MqSu9pQiRRi2zk6D9n+kEqCJzdoaMV/aB2cGFzJTiL8oAnbWCn?=
 =?iso-8859-1?Q?G8JO8yeFG4NrwIdIJBF5pMwbSWlTbpUrdmlNQ6bDuTd/W9JP5jOfQGC7md?=
 =?iso-8859-1?Q?vY07qFlde5jv/sprSOEtVGxhzONGWwCRvs9IltBWjpJ7t4bB7oHTWYBRWL?=
 =?iso-8859-1?Q?xG0oRkKae+WZZHQjVWp+ZUTrMg8gS7cct/woodtxftMrdKFTor0ont8aI5?=
 =?iso-8859-1?Q?p8DOFfEmgOAjL+hsaZPtHc/iSyN1m7G/mFAAJ/WLWWUgMu42SxRLHKFHns?=
 =?iso-8859-1?Q?6ndq6Z1R+pLHUNQNgEpJvRaTlZ2Pr1QNludRODOcKB5cKU+UcKKj2rNrAX?=
 =?iso-8859-1?Q?szb1bkWVdqavTb3KizqaxR5zqIdKrx5uzVGdegfNc9gXjthvMLd8uwCRS/?=
 =?iso-8859-1?Q?qU8NWQ+LU5HJHOQU3ZSc3AeoYdVW2nNs+HbUP/d4m3fgD/KGwTQT6pQk7v?=
 =?iso-8859-1?Q?TIkwLC12Ig=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d48382-284a-4136-b280-08de9b789853
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 05:25:38.7064
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: niHDSQkYdCLOOlA7/3clCDo2qYeRTCDdHmt9eemKrJNvFOxKOj8yXoW4L8xpPAhgxBFOaSrWb6AZuuEngWyxKJK0sRLQ89zinO6egU/gg8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2974
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58849-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ASN_FAIL(0.00)[114.105.105.172.asn.rspamd.com:server fail];
	FREEMAIL_TO(0.00)[ndufresne.ca,kernel.org,xs4all.nl,pengutronix.de];
	DMARC_NA(0.00)[chipsnmedia.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:dkim,chipsnmedia.com:email,infradead.org:email,ndufresne.ca:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email]
X-Rspamd-Queue-Id: 610EE40A5E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Nicolas.

Sorry, I just realized that I never replied to your earlier email.

>-----Original Message-----
>From: Nicolas Dufresne <nicolas@ndufresne.ca>
>Sent: Thursday, December 11, 2025 4:54 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org;
>hverkuil@xs4all.nl; robh@kernel.org; krzk+dt@kernel.org;
>conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de
>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>lafley.kim <lafley.kim@chipsnmedia.com>; marek.vasut@mailbox.org; Ming Qia=
n
><ming.qian@oss.nxp.com>
>Subject: Re: [PATCH v4 3/9] media: chips-media: wave6: Add Wave6 VPU
>interface
>
>Hi,
>
>Le mercredi 22 octobre 2025 =E0 16:47 +0900, Nas Chung a =E9crit=A0:
>> Add an interface layer to manage hardware register configuration
>> and communication with the Chips&Media Wave6 video codec IP.
>>
>> The interface provides low-level helper functions used by the
>> Wave6 core driver to implement video encoding and decoding operations.
>> It handles command submission to the firmware via MMIO registers,
>> and waits for a response by polling the firmware busy flag.
>>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
>> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---

[...]

>
>[...]
>
>stopping there for now. I feel like we did a big mistake in wave5 by
>allowing a
>heavy abstraction, its a lot harder to fix and it served no purpose since
>you
>went for a fresh driver for wave6. I think its proper to ask for a slimmer
>interface.
>
>The V4L2 API is the front-end, and where all the validation should take
>place.
>The HW interface should simply manage the HW in a readable and non-
>redundant
>way. In V4L2, strides and buffer size are part of the try/s/g_fmt API, so
>these
>should not be duplicated here and they should clearly use the common code.

I agree that the HW interface should be slimmer and should not duplicate
validation handled in the V4L2 layer.

>
>I know its painful to ear, but you will be remove 50% of the code, which
>long
>term will be a massive win on maintenance.

I am reworking the series to address your earlier feedback as well, and I w=
ill
include that in the next patch version.

Thanks again for your feedback.

Thanks.
Nas.

>
>regards,
>Nicolas

