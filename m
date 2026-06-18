Return-Path: <linux-media+bounces-65151-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id viZ0NKiOM2pfDQYAu9opvQ
	(envelope-from <linux-media+bounces-65151-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 08:22:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C8C69DD31
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 08:22:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=mNY7JK4I;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65151-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65151-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68113309DA18
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 06:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A76E331EA5;
	Thu, 18 Jun 2026 06:22:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021112.outbound.protection.outlook.com [40.107.57.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000942877C3;
	Thu, 18 Jun 2026 06:22:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781763741; cv=fail; b=ExaRIBRcl9FvCeLWf4b90aBoHk8EkxIUu4gOa3dBNlfk+gQ6YuaXe6ScGEhmR17EBQgGOskAy6MzJ6i1MVeBCGVnORI8gb9KmbAZ46M7vrio/NTcUesfuO4feQCdWqPAg8UHEgi0vGhlmn543XYKjOqSPTaqfejt8Yxex7eCWJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781763741; c=relaxed/simple;
	bh=u4qvids3R1PRi+AGDR4DTh+q/xxsv9yzo1liKjjKSyw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gAAI7eKiXWaLOhldYILg0rOPdne5aIAuHMUBKLUbWaNLXOFuSlZyPBfU6+K587kQ8kNhrSGqNOTSWFfcVYHZD34TPdUVN5rorlHMbMFXOsS9FDdzMtyqcodv0ZWKeCqKgEbN/iwpXKNZjGvtwdpWlNcDYQoquibKWM5wlhljuKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=mNY7JK4I reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.112
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/xrM7wAUkWB3SW2BBFojjZmTJzSIeCwJDEQFst+dyhRkpV71G6Y7htV0lzH2jQkNJzNbOcWE8iDyBKI+Czppa7bsQK5Ca7skwvsT9BNzv+CzS8x5FmZdKgXr+A8gJogKkLAL6Wl5mspZ2WiG3kZOmRvKNVYtLWJSNXFeAdJN5ZXHaMLcNE8CaExs/MXUXvtqX+R/yvuIaTDofsHhFECtK3FDpHdByWJAbM90ky6e0MD11co2xqBO6T+gqUNcXcDRTwxoQNtMSB6eanfgNiVXWD8L5XUg8GFP4OLsGCPL/FmHKoIEl/0vFYeC6oQsWVciv71qxyTpDUB9iar1F7MJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bA9h6nWtpnirb3kJivPfKWlIGo0I3cNDafxVuC4um6k=;
 b=JjqlajKG2mPyNurU+2cSOGcZ619p+HiZZShhrNZRvHcOE5hreIbCWNQwjhlAw0TidTtC2Fsi7pcArV6WUxrX4VmJuWhXyTQ4nmIGj1b9aSpgQYJrSAFguZ6cZM8Id/KTPOZWayXHsLZAyF240i+fNGYXptPWNNezVYkCw8vUEB0cNvOLecs0wZm7LgtJnBEsjkH39vHnqPuMg0/Eb5uK9m74OKzpkgHw2L/GE97DiNTWyCawnmkIB1OsEdpVKOCZ5KhN6lnhqJCDhekv91vEfF5VE9QCqBEOL688YTrAEizeoAI86o5ccU2v7SsuqpdBsx6faheDunP5MLmrmNy/3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bA9h6nWtpnirb3kJivPfKWlIGo0I3cNDafxVuC4um6k=;
 b=mNY7JK4Iia+lknsABsd+ZNlGGKQcokQT9mWAEzpQVwO32Fx3LUaypgyXdjcqpjyQaanGEfscPneeL6zVv4aFd1QShyKtlYgIpuZvwzeuJ3FvzXjeWl49ntvfHDbSCfYAb0mCyjWj+pEZU+gSx+1ROAWV6nsoJmXWf3z8iBj1//6zj94GbyvYTe8SHG4wReLQkM2Rq5N/8ub9phtQWFnbElzOceIo30/bKPr0BQCzlUn+nH4zHgF0FdSKNZAFJJW1xWh9AgAkYDfCUtgOPR4B/iaKjYzFD0B5dZqM2Qp0b55eWMGYRl6IiDgwtLz9W1tx5h2bZp/V4hrWzOODQ/h/Xg==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN0P287MB1817.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:18f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Thu, 18 Jun
 2026 06:22:14 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 06:22:14 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
CC: Tarang Raval <tarang.raval@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, Jingjing Xiong <jingjing.xiong@intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] media: i2c: add os02g10 image sensor driver
Thread-Topic: [PATCH v3 2/3] media: i2c: add os02g10 image sensor driver
Thread-Index: AQHc08x1b9/g16idYEOEV5tDIRsV+7Y7AGGAgAktQL4=
Date: Thu, 18 Jun 2026 06:22:14 +0000
Message-ID:
 <MA0P287MB2178300B0541EC81B91312F588E32@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <20260424092554.26130-3-elgin.perumbilly@siliconsignals.io>
 <421ae63a-88c6-4e81-8478-7f581357676b@linaro.org>
In-Reply-To: <421ae63a-88c6-4e81-8478-7f581357676b@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|PN0P287MB1817:EE_
x-ms-office365-filtering-correlation-id: dc58f22c-7ca7-43fb-e887-08decd01f031
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|38070700021|18002099003|22082099003|4143699003|56012099006;
x-microsoft-antispam-message-info:
 cUFad667sFLcxu2hVoeeLfzDv75s8sE4pqghk/FCwiJzbSrGX3cEXhe8GKoqIbwdQHhk/j4o53hWlFoZTEVOrIaPXkRAPL11vq9+xAWb3gf9s6p0DLWEj589DQZ6A6gd3I9gSHYMIFVDU7lXOjvGuJAo+Gv7Nb1Ys4Rl4GBIlNXlu9rJ9u8dry9X5xdqXedG8G9Z0M5vPA94HwwBTyFrdQndVGVIGbfZv7y5syv7eE5y8XoIIlJx/KdFRGrjRVKT/XG+V+IF6EzHYPSelKZDMKQwVG3auIF1T4bopedOO3POJcibgWuZARDokd2g5Vg3VN0N4IirRu1uf5zuExYmMhZ3tHw2qQylWeRaafLQoiekHHNrnF1JhcKtcJ48btJF+0TJ3bHHphecRi0sitX6OfSBbVrCnIGPIZT1sQ1FY4lnMvevZtP/UUhgrdZd8yojCbGsS3Y743JKW/465SO5O80+3HKjiPDCziI15eL+E10oBizSlG1EO5yATEULKKNUakI90FX03kKu6H7Zv7q+Ilt0Dj6Ddwe/ee8EutjwfjhykJLHLBbRpRxLw0aayyP3Wst/AGeTKi52RhlaAhkooPsVbTQIo9qvbph25RjQDzkAvu5pjV3zi/7s4BX97wct26rvVKNRMbVf1v5CxrtPLmtIv4JGFUXjtlW+Ht42HAC8iwtAM4z9sBp/yBmOkpX4PMQGW8Pa8XT2g6s6JjfwOZMhNt5IdHc/hR/5341wHxuRMfNWBAW9OltDXvskVl40
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(38070700021)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?38ZzaFgymiwrK0QbyH9ZV4Nlmo85IFz6gKjkof6D5Z0UeZQl3XuggsOWAx?=
 =?iso-8859-1?Q?VHmCxPds4vp2l/G2nl0BN6aoEm7vFrHKTxmnmOj9UPseH8xc0He2U3e9Qc?=
 =?iso-8859-1?Q?Uqp41A+w7SJYMVi+S3MqhX+UAw/g+0VtK6XsreOf4poCO2Dr+BXj1s2bmx?=
 =?iso-8859-1?Q?riSiQ3DjCDjIh573nP8Kt4HHl+tB6Opdmtbop1p08dRynHbq1WxqBKbYnZ?=
 =?iso-8859-1?Q?6TnBVMJA1s21puJ6ZN8dR/hm15PXmcxX7Q2txbiUcNAtbj7t1HD84Rdj28?=
 =?iso-8859-1?Q?8kiJvnePakfgq2voohJOG7PkxS+xfy8jZeyfj2o3DFvLIPlpEQK4i8XS2T?=
 =?iso-8859-1?Q?e8XhKow6apLDyFNDOr7HBsSOW1lRGsuJe+O6+/+te318WgnAr2ZwoFQhsI?=
 =?iso-8859-1?Q?cYB7zX1cwR8sPacqPxdfMXwFEPm8ZNqN8UpeXjyALsK+sHXCRJPHVQrJsS?=
 =?iso-8859-1?Q?Qxp4MtW70EDx6GW0ahlqQ5MxFOaXBeT5D0v7OVmDmDaXL/TjeqeCbyKwuq?=
 =?iso-8859-1?Q?piJuxqvjcr9Bcx8jv2X0o7LM77HJbEEegUsPscrME7CSejRY/ykYeToV49?=
 =?iso-8859-1?Q?mKD3VCqYr4TVe5v/Gp4Yo2/2o9ZCiQ6qxgVllY6//B2nd2uuxYHPSP9uGB?=
 =?iso-8859-1?Q?hf4GkmlDlQgh922Lcff9XDS7i0sbWNdehSDTyZPN8+5kMxo1osv26uOnxf?=
 =?iso-8859-1?Q?kp284DI0n8Px8H32Bf77PUK5DYz/X6/ilqMERkNEgZq7FsK5FfmTA/prYM?=
 =?iso-8859-1?Q?BMyczOQn34A/D5m9MpGVRWC7AZpjP/H49urD/ie9fiATnj3kzjdfk9rdkW?=
 =?iso-8859-1?Q?WO+vWDPOZOS0yyBRvtscFREq+5xWHxGzmexWIhRlydzVFu0HAV8kw2TPzZ?=
 =?iso-8859-1?Q?+NCCLW+ZTxoeaFa7d9GT+I0dQVAMqDn0rTulrfPqGDAh0GDDfTrQml3R9Q?=
 =?iso-8859-1?Q?u7dtAU0a8hw5t8sHw0hxVcwG4kzmjdhiweBZkR0BP28z094GCEliC4WKBj?=
 =?iso-8859-1?Q?0+YVlYvnb1f6kfFAuGjOUTduzwq03LrVKcLGMcsbYJdpFd3bjfuSpnqg/W?=
 =?iso-8859-1?Q?yOnrixpwzwtYk/YtI2x2Ihvq/lg2xZ2v355Oe03MEuP9Df6NgPUpdcFbiG?=
 =?iso-8859-1?Q?dgu9XiXjFikRH95Ls/mhVl/aj1tWjhBkjmG/qIKriVvIt3+FBOaiZlivPF?=
 =?iso-8859-1?Q?OiWTld5b8HoMru6bgMTiRAor0WvvelLRPEVWNMJV43dJzWGMWupXk3SKwx?=
 =?iso-8859-1?Q?1KGdsUaAh0aBzPbTobQQr2ZOOEs1g8pFYLAuMqYqAD7lUc/luQhRjZriTt?=
 =?iso-8859-1?Q?YRiDz0hJGmZVhdCfNl0rHRERippETjDk/eufUZvnipeFvQQfs+66sKxeft?=
 =?iso-8859-1?Q?x9EM5hU+J7omox+uWosedBxYGOrtLYBqDGA3asgaMYEAbSK+Qvb0ygsgr5?=
 =?iso-8859-1?Q?affNymqXUX0tmHLzeblQp0SEc9osUFqVF1XuDt+8w3d+6QgzT0w9ht8nPn?=
 =?iso-8859-1?Q?rtIUfRCkx5g/CDArwhpR+kHXrfTuejhdjurnmTsj6ECQrehDkWL756pjcB?=
 =?iso-8859-1?Q?9cmVxr7ti1MX4pVSByhOXIWlcJP+UQRMIwN3bZoiQazC6k8QpGBgCjH9ZB?=
 =?iso-8859-1?Q?eL50bDoBJTqobjar0C02+mJ/RoKok/z1Mii4dNEYXU2ezZcxU9sJU21y50?=
 =?iso-8859-1?Q?QOdghpFktgi0z8CN+kE8oWcewmvnUvrwPgdybudjF8FZ+XJkLX1S6jfQUi?=
 =?iso-8859-1?Q?d4SCPoPAZ/MqktaYJ29Cu5h69TDz6F/rZ1cLWvUSVOUEi+hLaRXEW7DDOH?=
 =?iso-8859-1?Q?TamJbsLiYsAkDQCZlGRXOpdcnlvSM6E=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dc58f22c-7ca7-43fb-e887-08decd01f031
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2026 06:22:14.1419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P9lfhyN3LFHOJiuKxHaJ0mXthm0zOP4J85/F93dw7LGEKSAkyA0h7sRvlTSKepN107V+MDLCrd7GSVQHVwkqPY7m0/7+DJW3db8/YKdFh1lEi8TPx3h6N1r9XGMTwNVq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1817
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65151-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:tarang.raval@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:mehdi.djait@linux.intel.com,m:sylvain.petinot@foss.st.com,m:benjamin.mugnier@foss.st.com,m:bryan.odonoghue@linaro.org,m:himanshu.bhavani@siliconsignals.io,m:heimir.sverrisson@gmail.com,m:jingjing.xiong@intel.com,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linux.intel.com,foss.st.com,linaro.org,gmail.com,intel.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,siliconsignals.io:from_mime,siliconsignals.io:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0C8C69DD31

Hi Vladimir,=0A=
 =0A=
Thank you for the review.=0A=
 =0A=
I have addressed all of the comments except for two, where I am not entirel=
y=0A=
sure about the requested changes. Could you please take a look at the point=
s=0A=
below and let me know your opinion?=0A=
 =0A=
> On 4/24/26 12:25, Elgin Perumbilly wrote:=0A=
> > Add a v4l2 subdevice driver for the Omnivision os02g10 sensor.=0A=
> >=0A=
> > The Omnivision os02g10 is a CMOS image sensor with an active array size=
 of=0A=
> > 1920 x 1080.=0A=
> >=0A=
> > The following features are supported:=0A=
> > - Manual exposure an gain control support=0A=
> > - vblank/hblank control support=0A=
> > - vflip/hflip control support=0A=
> > - Test pattern control support=0A=
> > - Supported resolution: 1920 x 1080 @ 30fps (SBGGR10)=0A=
> >=0A=
> > Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>=0A=
> > Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
 =0A=
...=0A=
 =0A=
> > +#include <linux/array_size.h>=0A=
> > +#include <linux/bitops.h>=0A=
> > +#include <linux/cleanup.h>=0A=
> > +#include <linux/clk.h>=0A=
> > +#include <linux/container_of.h>=0A=
> > +#include <linux/delay.h>=0A=
> > +#include <linux/err.h>=0A=
> > +#include <linux/gpio/consumer.h>=0A=
> > +#include <linux/i2c.h>=0A=
> > +#include <linux/module.h>=0A=
> > +#include <linux/mutex.h>=0A=
> > +#include <linux/pm_runtime.h>=0A=
> > +#include <linux/property.h>=0A=
> > +#include <linux/regulator/consumer.h>=0A=
> > +#include <linux/units.h>=0A=
> > +#include <linux/types.h>=0A=
> > +#include <linux/time.h>=0A=
> > +#include <linux/regmap.h>=0A=
>=0A=
> Please sort the list of includes in alphabetical order, also you=0A=
> may consider to shrink the list by removing quite many inherited=0A=
> includes.=0A=
 =0A=
Some maintainers prefer the "include what you use" approach, like Andy,=0A=
so I added all the headers that are directly used. Should I now remove=0A=
any inherited includes?=0A=
 =0A=
> > +#include <media/v4l2-cci.h>=0A=
> > +#include <media/v4l2-ctrls.h>=0A=
> > +#include <media/v4l2-device.h>=0A=
> > +#include <media/v4l2-fwnode.h>=0A=
> > +#include <media/v4l2-mediabus.h>=0A=
 =0A=
...=0A=
 =0A=
> > +static int os02g10_set_framefmt(struct os02g10 *os02g10,=0A=
> > +                             struct v4l2_subdev_state *state)=0A=
> > +{=0A=
> > +     const struct v4l2_mbus_framefmt *format;=0A=
> > +     const struct os02g10_mode *mode;=0A=
> > +     int ret =3D 0;=0A=
> > +=0A=
> > +     format =3D v4l2_subdev_state_get_format(state, 0);=0A=
> > +     mode =3D v4l2_find_nearest_size(supported_modes,=0A=
> > +                                   ARRAY_SIZE(supported_modes), width,=
=0A=
> > +                                   height, format->width, format->heig=
ht);=0A=
> > +=0A=
> > +     cci_write(os02g10->cci, OS02G10_REG_V_START, mode->y_start, &ret)=
;=0A=
> > +     cci_write(os02g10->cci, OS02G10_REG_V_SIZE, mode->height, &ret);=
=0A=
> > +     cci_write(os02g10->cci, OS02G10_REG_V_SIZE_MIPI, mode->height, &r=
et);=0A=
> > +     cci_write(os02g10->cci, OS02G10_REG_H_START, mode->x_start, &ret)=
;=0A=
> > +     cci_write(os02g10->cci, OS02G10_REG_H_SIZE, mode->width, &ret);=
=0A=
> > +     cci_write(os02g10->cci, OS02G10_REG_H_SIZE_MIPI, mode->width, &re=
t);=0A=
> > +=0A=
> > +     return ret;=0A=
>=0A=
> Just "return 0" here, and remove the local variable.=0A=
 =0A=
Could you clarify why this should return 0? The local ret is passed to all=
=0A=
cci_write() calls so that any write error is propagated. Returning 0 here=
=0A=
would appear to suppress those errors and always report success.=0A=
 =0A=
Best Regards,=0A=
Elgin=

