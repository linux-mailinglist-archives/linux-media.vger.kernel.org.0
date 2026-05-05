Return-Path: <linux-media+bounces-60444-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEnwOokC+ml1HAMAu9opvQ
	(envelope-from <linux-media+bounces-60444-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:45:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 496014CFAA4
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CA6B3048140
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 14:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4201643C067;
	Tue,  5 May 2026 14:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="iATTgGeL"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021098.outbound.protection.outlook.com [40.107.51.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2992264A9;
	Tue,  5 May 2026 14:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777992148; cv=fail; b=kHyjOgYT/OHWhajb2tXI4I9QkK5vhYUVyJLtVWBDds2zHA3P9bSh1IGe2UqD5If6Nop0HbjjlHcQOj9HwpAfo8iUkeuyYmraAeg/JMxcfSpOc3ZCJWXD6GzaEguXHbscnlqhMRddb0U9tcQSwegOmw/R9teS+m0ec2kOfu3hLNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777992148; c=relaxed/simple;
	bh=Sz1jPlZBySZiTKxyQN9KDz+U1zg5fdNY2UgAD4hEXIk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A/mpSGzQL3KFwGOdLPGkGHN4n+NAZSGdazTWQNvW7wojyKCKS9JHBwr9wVrTqtPAyRzJ843Mt6eQrLrmLKVyObujE4xuf6pUGPuRnusT1tQMVGqAvh2XFwWC/mgNU+FCJHGrPyiQu47SFyu2OacbxYPm76gWAjSiMXpp6+zJY9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=iATTgGeL; arc=fail smtp.client-ip=40.107.51.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcYA4ocE0htxw/F6uKYZEYqBec63/J98LgTF1GeAfEDNoZqdq4KWTTiwYPE/4AloaSTvA5HtBkNeZCcy/uNWUco3QL/Aq9wcaW2k4yXJaE4i0rTJ6JR+1C9NXvhsUQODPv81WTMKT9aDR6wGHTE+zxwy+LqWMPN1evF1PGtogMn8h3MgDajC4dR4bZAj1/Iywdie1byrT7CuYgnZG4njf4/HsDphLM46lcQV48JRa2u9NhZQdCJ2Cm90daLLvO+cYbi8rW32/QdUJvFW69J+piUrbcWyZMJDhxM9xMi+LDhEOau8BKNMBWKymNtXIUzFPdgxZz846hOqj+hHLZf5NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2bQCKAQnQppifFdPQhwLlrwVpDH74kYKm95r8p6xlM=;
 b=qfQBKbvWD0OKux5tbtvOHsGyqTWs0Jon4CSFb5ddR8fZ6Op5DlN3gbix7cYBTJRTzIJljKGmhNLqGvFBaxyYWv5S/LFEc1rdbbQsWEBAAQC+UOQLbz4ktTlgv4gzk3MBpWhgdjd18KZWsOh7BVFs8lnUaY79zb+XpCrwt5wuL5DCpl5qNzyrB86FDUqCAK/ugGcvk3raHxPKdIWs8DtmyVtRLejsKHRPCQjn8GMJkEkU0YtgDXrkk9H23T70d3thsVS+lObvp7AUd5eeiTN/2d2pCXMh74sm2P+7LzIzmdJWx7KR+gi/FjeE4ZiY2sPgKhOFViR/1B9uA351QJxPVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2bQCKAQnQppifFdPQhwLlrwVpDH74kYKm95r8p6xlM=;
 b=iATTgGeLcoyI1g6ZrYe3aT4FrqEfU9XonhTUTLnoquDYtlMqA0HqNSrrZfpUFg+8rQWxE5y5kRzB3OUKkDBWOb+rHkukxrMLWyYdOEXV0qXTl+xxFNvXx+FUDVLoaBm2MP7xNx72ULBcdEGb9GeQrbEJeGxVV33yPev8fF5MXiTBYberrq3LE6N2OdKddFYutjLWJ2fl9RQSWemdmDdgQGva0cbk9hMAJd+++7t85x1Md51zIcLmffEnpRAfpTKTQyNrWUYVfxcYNUOIqdbHycEi49OntRWtdrKCOWi25fP4gPJSwWlHsh1MpxKUFAuT0QoihJas0Ggf0Hh06WWXWw==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN3P287MB0210.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 14:42:21 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 14:42:21 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tarang Raval
	<tarang.raval@siliconsignals.io>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>, Hans de Goede
	<johannes.goede@oss.qualcomm.com>, Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Hardevsinh Palaniya
	<hardevsinh.palaniya@siliconsignals.io>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] media: i2c: add os02g10 image sensor driver
Thread-Topic: [PATCH v2 2/2] media: i2c: add os02g10 image sensor driver
Thread-Index:
 AQHcy+vUWjhtsErO5ki07Rsg8wgvDrXeSh4AgAAEK/CAAAQSgIAABiGAgAAD4ICAIUQssA==
Date: Tue, 5 May 2026 14:42:21 +0000
Message-ID:
 <MA0P287MB217836B81A73F23289CCF190883E2@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260414084952.217215-1-elgin.perumbilly@siliconsignals.io>
 <20260414084952.217215-3-elgin.perumbilly@siliconsignals.io>
 <20260414092758.GE4061@killaraus.ideasonboard.com>
 <MA0P287MB2178FAA81D07B561FA68014988252@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
 <20260414095727.GF4061@killaraus.ideasonboard.com>
 <PN3P287MB1829155B216E557C7DF7B6778B252@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20260414103315.GA1023076@killaraus.ideasonboard.com>
In-Reply-To: <20260414103315.GA1023076@killaraus.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|PN3P287MB0210:EE_
x-ms-office365-filtering-correlation-id: 6f0370cc-3358-4f58-3d2b-08deaab483f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 Sh6X/a3enjDN8cQvI1G7wDxaYFCh8R+jiJpCvqN7/UikLUxvz3460SaebOAPU144Jc8eKIjnKxhymM5P7DjnHdgJGy6RnUd2Od1l8uO+fy8ZBTAwZaKNHjWCx1Y57iqyFKWaxZ/rf/oR3U9O2vIE4EpVUvnbW6WxPH8Y95/ngGYl1SVbaoXu+o/GLjUT+GY5aVBHI+4Hhvz3lOw+eJYtIMgC2Vm5pXe0kBh3XYoumOjALYnn+YewDtkIQVEccOXgGAR7dlDYp0/ja62JfPjejCUBW+6nxmCEQ8Fw8gStfI5KjUfiWz+h21YQlcv22yUm3ZNYBdpw+U596JntXkrcWCH2iDy8RkBIiEDtcPGaZLwHz+flZ526nQlWuBveKhMpSvXsepgPWg6XUbekWSY8DQL+gT82bBHqtjxf9zZ/AMWHSkTO/D1vJg+vGcXD7dxBPTuHZkcw4+QUQJ76diC9POiDccUSOx7bJ9ef6WcQ0qc1bkatsAIELuzE4i4Zw47/5VxeKF1xGnC09f8DY5XE22fDuTE/ix1YMombKtWQK6IlYziQd8Q5CA8wYnb56zJ34P11YyRCrW4I2Vj8LwfauDqBvWHpOjvZs9/jXIAaQvlhnvIFmDHoE+KURngIY/rzeh5LHK/qkC6NefV8n/GTaaOe2Vu/P3URDPi4LZAYu8KnjvwR6v88G6gCb4O3VUJ/Rv2g54+oqJ6sCyoHOZxK+mYHRDWs4pxfW7rTSwlgh297Ps72YY7zqFp6+c4U8s4s
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?LTF2tTlu082yNzirCiSSCSmFm6Aq9/rL3JrRbqJ61tZuZcsGCCc+zPzDGv?=
 =?iso-8859-1?Q?a3lvI9Mnwf7BUrq+0e+GD47fAqrdTciwBoUnmQ1GZjuPKy4zFDzDYWyrJf?=
 =?iso-8859-1?Q?z2fAe681f4d2iptNNk+/8dAwpqKn5xn7BelO1ipZmWAZKJjp5KpHCt4A7A?=
 =?iso-8859-1?Q?QZdVDJkQtB8kMONGIlnJoLkR72RA22aZF+0aUpbXtVDRPYXf35pP5w6zr1?=
 =?iso-8859-1?Q?bSKuvMjB+TR8ZjTeMCw10y/UzGYb6X6USlUshbCcyVbrVXcIEFSVbOq/aw?=
 =?iso-8859-1?Q?RgJ7lAQLi+R52NfwKqprvpNptgeR+li8eoZT3+6X9cImMXQ2OsU1Izwk8x?=
 =?iso-8859-1?Q?ksLo0bIlMP2tSfCnmhEaB+2ryRvPAs2t+x882JX4ak7qUlpWtRYWJ1G/hP?=
 =?iso-8859-1?Q?wkiwPBnJuUM63oyDIJkGUa/EM0RRq9X63l6m6b4F4had87DLxW75/Lywh1?=
 =?iso-8859-1?Q?occzqMAho1mZv8k5fDQEEIGhKD6enuXNVDu96LomZummnb19mrTksTujYZ?=
 =?iso-8859-1?Q?raG51URjUiovMTPyZSWCJ4TExLVAApE3e27RZuUX1brazf6EMNAMRz8qr8?=
 =?iso-8859-1?Q?DZHKHk+gNLWSe0iPx+Fgu3J5sG/ix0VOzP7P/tig3kyuWkAOdDatd/2Oiv?=
 =?iso-8859-1?Q?LZIniQUMFft5MLzB50ZYLD3XQIkuJTbosDiNwsUyVzYqBFO7+fBeUwCtSW?=
 =?iso-8859-1?Q?7r44mNOrvV5HfkpqPmKVmTqcZbUSjXIFwzwE9QaJdrHWhxT3f18JE9CXzm?=
 =?iso-8859-1?Q?ukDIOuyKCY7MwQimY+uhdTHmqayRyoP4/9UtYvTDUj6nXsU7WXXyNoMQq1?=
 =?iso-8859-1?Q?nhyWf+kJNeZ5ikfejNOx3aAbW0qvEy+3vys8XGnOcSfaInXAARAToA4ffo?=
 =?iso-8859-1?Q?sDl/Xa4lUNOMBv6q4RZ8xt3PzSaA+tOoTfuvV/y8aPmpd9KidG9pTgVSOX?=
 =?iso-8859-1?Q?lo74JJdO8YpzqVplS52cvgSBzhpCs2LekIeDuyEnNI6blz4W+GfGE0r/8A?=
 =?iso-8859-1?Q?0fSBYory4pUUu7sXR9UmSpJrk4LMKEgu++zTk0c0LWABgdbdTQxESfAjyn?=
 =?iso-8859-1?Q?xe44r+nesLYThKbURNoclAaiTbpXLsbftUY7o7yAnly4LhLq+8v8dDqf6g?=
 =?iso-8859-1?Q?PQVm3BuaJALxw7D4AVb1ls08HuCFnTOF+M/fRaPFecVxYshahNw8EW/bVc?=
 =?iso-8859-1?Q?BmHQ2FQMP7hYHz7UKcmJ4AchQHICyigvxuGS/C2i9rHdnveYuJ8FyB78rB?=
 =?iso-8859-1?Q?uo7/kxVX9e6+Z+qDMaHRxiwPoV/NLWqA1Lja1wO+PbjdK4oPDOiC7JVvl9?=
 =?iso-8859-1?Q?WrdZIUz4tPVryb5VuUGggJ/zHHsN4AZVxLCBSYfB0lI+oMjMYa0jDDgFpY?=
 =?iso-8859-1?Q?ugcquKf6o2apQgsw9uchK7gySpvDTGgBsvwx4lGsGwMsWEEUwpNtLGmcwm?=
 =?iso-8859-1?Q?RODOy82LZKoeQMpV3PXSRfc3PlWiytcGGe0f1GL5Bp5tYuuaZ/IleE0PZm?=
 =?iso-8859-1?Q?NrrcWsmWtesR6JCuQ7nnALSBYJ7cBboU58iDnf0+q46fYKHtDHLXpRazTg?=
 =?iso-8859-1?Q?pjDcD3+92OnEhfYAjZgif2iTzm99RXvGK//9k8SN/023vSFDH67Rj2tRfH?=
 =?iso-8859-1?Q?pvFROhlWyyUtjyCwz9uWCjGQqT1WiizS/+dntjyoYQuvV6pgJN7oacC8We?=
 =?iso-8859-1?Q?j4QPlLJk+hItI/lGk96wZlFwwoLxQ+rJH/Hv0Bf+puD7CzFZo28ThaG2Ru?=
 =?iso-8859-1?Q?MNW+MVL4QB83sTMJHKNQMNOGNgh4ibyJJtxSfjb19FV+ArrhrqMWWCYvKD?=
 =?iso-8859-1?Q?rNYYqdINNJ/Yakqf1TjvE8TDAZrVDPM=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0370cc-3358-4f58-3d2b-08deaab483f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2026 14:42:21.7985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6FhGZPCTTQJIwD0CNIt3ECx+lymA00FgWNKPpChV9pelXoVK3MnxcKlYB9t+CQ2zzKRV/UvQf+AlJbv6oIRLpLjJX06fvwutyxJExlbgmE+tdaD99GVNfh9AdOLWLMTI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0210
X-Rspamd-Queue-Id: 496014CFAA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60444-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Laurent,                                                                =
     =0A=
                                                                           =
     =0A=
>On Tue, Apr 14, 2026 at 10:19:23AM +0000, Tarang Raval wrote:             =
     =0A=
>> > On Tue, Apr 14, 2026 at 09:43:32AM +0000, Elgin Perumbilly wrote:     =
     =0A=
>> > > > On Tue, Apr 14, 2026 at 02:19:45PM +0530, Elgin Perumbilly wrote: =
     =0A=
>> > > > > Add a v4l2 subdevice driver for the Omnivision os02g10 sensor.  =
     =0A=
>> > > > >                                                                 =
     =0A=
>> > > > > The Omnivision os02g10 is a CMOS image sensor with an active arr=
ay size of=0A=
>> > > > > 1920 x 1080.                                                    =
     =0A=
>> > > > >                                                                 =
     =0A=
>> > > > > The following features are supported:                           =
     =0A=
>> > > > > - Manual exposure an gain control support                       =
     =0A=
>> > > > > - vblank/hblank control support                                 =
     =0A=
>> > > > > - vflip/hflip control support                                   =
     =0A=
>> > > > > - Test pattern control support                                  =
     =0A=
>> > > > > - Supported resolution: 1920 x 1080 @ 30fps (SBGGR10)           =
     =0A=
>> > > > >                                                                 =
     =0A=
>> > > > > Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals=
.io> =0A=
>> > > > > Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>      =
     =0A=
>> > > > > ---                                                             =
     =0A=
>> > > > >  MAINTAINERS                 |    1 +                           =
     =0A=
>> > > > >  drivers/media/i2c/Kconfig   |   10 +                           =
     =0A=
>> > > > >  drivers/media/i2c/Makefile  |    1 +                           =
     =0A=
>> > > > >  drivers/media/i2c/os02g10.c | 1039 ++++++++++++++++++++++++++++=
+++++++=0A=
>> > > > >  4 files changed, 1051 insertions(+)                            =
     =0A=
>> > > > >  create mode 100644 drivers/media/i2c/os02g10.c                 =
     =0A=
>> > >                                                                     =
     =0A=
>> > > I have added a new function, os02g10_set_framefmt, which dynamically=
 sets=0A=
>> > > the mode register.                                                  =
     =0A=
>> > >                                                                     =
     =0A=
>> > > Please let me know if I have missed anything or if further changes a=
re   =0A=
>> > > needed.                                                             =
     =0A=
>> >                                                                       =
     =0A=
>> > You also need to drop the supported_modes array, and implement support=
     =0A=
>> > for .set_selection().                                                 =
     =0A=
>>                                                                         =
     =0A=
>> Are you suggesting that we should drop the array below?                 =
     =0A=
>                                                                          =
     =0A=
>Correct.                                                                  =
     =0A=
>                                                                          =
     =0A=
>> static const struct os02g10_mode supported_modes[] =3D {                =
       =0A=
>>     {                                                                   =
     =0A=
>>         .width =3D 1920,                                                =
       =0A=
>>         .height =3D 1080,                                               =
       =0A=
>>         .vts_def =3D 1246,                                              =
       =0A=
>>         .hts_def =3D 1082,                                              =
       =0A=
>>         .exp_def =3D 1100,                                              =
       =0A=
>>         .x_start =3D 2,                                                 =
       =0A=
>>         .y_start =3D 6,                                                 =
       =0A=
>>     },                                                                  =
     =0A=
>> };                                                                      =
     =0A=
>>                                                                         =
     =0A=
>> If we remove this, how would we provide mode-specific parameters such as=
 VTS?=0A=
>                                                                          =
     =0A=
>Those should be computed by the driver based on the format and crop       =
     =0A=
>rectangle configured by userspace.                                        =
     =0A=
>                                                                          =
     =0A=
>--                                                                        =
     =0A=
>Regards,                                                                  =
     =0A=
>                                                                          =
     =0A=
>Laurent Pinchart                                                          =
     =0A=
                                                                           =
     =0A=
Could you please take a look at the latest v3 patch?   =

