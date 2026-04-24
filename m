Return-Path: <linux-media+bounces-59530-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK3WF0Fw62mMMwAAu9opvQ
	(envelope-from <linux-media+bounces-59530-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 15:29:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A15E645F094
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 15:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0405A300E73E
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 13:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712123D75C0;
	Fri, 24 Apr 2026 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="J+IjpQ/Q"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021121.outbound.protection.outlook.com [40.107.51.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960B03D6CD6;
	Fri, 24 Apr 2026 13:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777037334; cv=fail; b=SGD1xkVBYhwR82M3VIxsi7CmLGAFhpm9U0iF7roj4Rh3WbHO3tsgU0LeeJ9M6zNQLD4VV454aUwSqwSVpe5UkQVkJ7NG6Urxu/+lTB13shNqsy6VLdxROSBXefzDxBJe3id1FgmpwwHo6wXXz99aOnqGk03DItPjWzoPUkgbx/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777037334; c=relaxed/simple;
	bh=7TaRwFo4BEwivN5FKa9x/qJuj9zmes63wHbwoQDEKFo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZXsL7AvRINgB8l7136UQeUVMizOiZu6KrBwc42Ep3bq+vu2Y8ve1NUAw50iPbXPNDeDjqFmfDrtVIcRbkJkZgKHyCeO6uyu/qZNmdxPECZH0bcR3s5IFQJmCC2mAZj+J+Hfo7ksQV7SmR8CGmA+op3m7BjazotPDWarWIo6ChLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=J+IjpQ/Q; arc=fail smtp.client-ip=40.107.51.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAANqyfPWcRFjv7Br0MGN/LyxBLjYFf+0FhwJgWpgnh9ZY7VDuKNu3/ugfDwjHAELIfp4GOn+owrKsCsd697UqA8CAszj3uqlWCZBq27kUAEL2mts5vBBnykFD9DOWkCf+07UA2MVfJIWZKKTFmjb2xdMhQmKnTianhGkqhve+GQZr+jY2UayZuL3pyJyNqr/lLpQM+0SqwZE1q9CAMnVLdU0W4GGAsD14Q/I7cMbL0a6IWsq91YNAnChtBGpfUoSrMSqKpPN27HM0RjVS+6/V+iKJLDPRYsuu/kq5IcFdmqdG5sP70O/gp+8yQVcwU8+E2i08TXQirsza7/iK+gdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TaRwFo4BEwivN5FKa9x/qJuj9zmes63wHbwoQDEKFo=;
 b=skCWDCE6l92zZ3ymI/dzWWUshsPnR62sVTzt0oGas2ooz1u02NxLcMvOte08QOPh4tcfZ1pXqCSssGaSG55EPI9F9AMSS5WHg/q4u7D16Wu6cs/eW0Mg1sML9SUu6TVf0t07Wb3XSYQo2ryEGUhUfMF6tcUiliO+reMNtC67r2NlkLK9aXWT4J6IZl3ThbxAq8Kx15mVTNniLgZ3agnIkOGFIhR9wX28MSs6gRX7zmaFUdK6LUZo/arFL1E25cbIZjW6Moc9SrO99Exczi/zHTuCThpoJC88dBm5VpLw4Q0O9so6Jr2mFGPcwyJln6v1xMC2QMuHd+0JB4eFTx1S+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TaRwFo4BEwivN5FKa9x/qJuj9zmes63wHbwoQDEKFo=;
 b=J+IjpQ/Q2lK1wajtRJ6cXxB+RD05U49NQGUDy3K30cug/SsD3kGT5ocmwK1IeE1992k0WPJoscOr0gEw/NYNWPk/IH0VKAz9IXqBYlHV7ZwIIKgKQ2DPNexpEFjjxS001PRf8823ko6fSyCIXkCvKgWky7+HOK3hYI0GWG1BkUVZ68bZdfRKc6GyYLYgXRpfnO8JlsO8GIlefybdisfavoBZrJb/iqriYZPZ0LJ6y/E8cNzjfVrsnhQmk+q7biLmybHlVUzswvvTb5Zp90Hohv+RAMyuIbRhlWbGGvEfRt0wnABL6k2qHeeWt54TW+rLsvU/6VbEs00j5dIBEPUqbA==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PNXP287MB0030.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 13:28:44 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%3]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 13:28:43 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait
	<mehdi.djait@linux.intel.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Hardevsinh Palaniya
	<hardevsinh.palaniya@siliconsignals.io>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>, Svyatoslav Ryhel <clamor95@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] media: i2c: Add os02g10 camera sensor driver
Thread-Topic: [PATCH v3 0/3] media: i2c: Add os02g10 camera sensor driver
Thread-Index: AQHc08xq1/E6s4vLjkeE1HL5R9n8CLXuIEwAgAAUleM=
Date: Fri, 24 Apr 2026 13:28:43 +0000
Message-ID:
 <MA0P287MB2178960461C59823080DD463882B2@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <aeteuimzPdmE1rTB@kekkonen.localdomain>
In-Reply-To: <aeteuimzPdmE1rTB@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|PNXP287MB0030:EE_
x-ms-office365-filtering-correlation-id: f4aba49d-a860-499b-d378-08dea2056810
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 GrH4cXI3Id2B7t4JWgMNoR7jRZXuo09XRSCDFuyCNNO0kmyA4DusnsArgbgeDulH6mHPJ5TNXCE9xEMAVdIpqtIldzv0pc6N4KuijBN25WcVQ1C9jRrAiwWWhouhdjcIPXGxGx6X62K7On99N52cZsUf8dhG8pLvC37dCYdncApGXLSMAYwUCwJV872e613zXmm7kcmwKJOSh0ZZusC5O1/7J9q1dfD+DlkawXMcYbr/wRnwiuwWp4g/02Ys0MoI58+rhpTPt9U1ORJSHnKn61+kmh9kcyXj1HFlRhXZCnY9nQqLzzAK2cNqenbZ8J9AI2j+KgVWvfWaf9RLHXOVMsB3ehpWeKbG46XyIAdhufqbCk8STKvgFiElbLSZXd37Bxdg0Xtr5Ml1zAtvfNpNKiyJgyrxXKoLSZXcvnZVOM/a0tloYwxvk5lJ/8G77fXzsYmDf5obG5jG8YMhYxcZ4yFfQPZU7W919q/6c3c2iWkpxxl0kIXO1FmbB7KTYk9Mob6UyQLAjCVNz8BwLSiIEcTfNM9qRGsXTKi+zE5zy/lmBBTDSZ2ffzrO+WgrwP+jRu56Zs9b0AmpD/moVf0BZN5T6WHYY3Pec5k1OU0xn0EIuYFy81c55j5gSpEB28qRpx8ypYLbYb3zKdaYZ8ddPzzeh97Oy8UHubsfbBHiYt2ZiXOYw0NMeEfU+7S7Q3pDVliDrQNXsWo8cjbWIhEAWz6saQYzX1ht1kfEWsf7dmHewk4gaXWe2kqIvoARR8Ls/KSkBHq7r6F0B3kBZbHnfxGxIYyGLRtvdkrP4IVeUwI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?BBJbGQcfz+naGdIrNHE/V/s6RNas1UZBHiprRg/RfqerssqU3aei9j4qoX?=
 =?iso-8859-1?Q?Vh68/hi0NaA7f6P7EwGrHlCFXmFJODJultlSrbnnH3G6KEKoKjWQF+UZYP?=
 =?iso-8859-1?Q?4MIAvqwNvwEJRd7fVWMKbA6Db0YqPvED9/+mc1IcC06MD5aDzQg4CznPau?=
 =?iso-8859-1?Q?z873H/rTNvGw9xIWmoV3YcxsbbeDIILsz8Tky+tPMhSjI0cYx3D4XFjcBN?=
 =?iso-8859-1?Q?Z6GNBjLKg0ri0wh/qwChxjY/c6lmhMLX3zczZBf+5l7n2/r58pbQcdDUmg?=
 =?iso-8859-1?Q?jhPpcZshEWICJL4690LZEkeB04k7NIynoYxjDMxFkS7Jh++D22EdiKEjKD?=
 =?iso-8859-1?Q?AOalppJ99KUqJ0InHKwZAImypAz6pS9HB0YMoPF2V/YoTblyDSESzkGXY9?=
 =?iso-8859-1?Q?bijcyhwgPT2z95DP2BleeCAEu0OsLWDtypx2HxG3oW72ichptVEpl+VxXT?=
 =?iso-8859-1?Q?GlDMkBXpppqIMgn9zsvEB0wDiwS3CygsaAm/ySU5N3JGg6BtkgFplos2xw?=
 =?iso-8859-1?Q?em7vxbSVc78b0GdOh5OKOiifuxbU9W3nhxRmGKhsL+0sel1WGZ3VczLuDe?=
 =?iso-8859-1?Q?H+/62ySC26XvM/dqBHlqltCfxH5ms88roCM6pwmJDxfdTbjPCwObCPJUBF?=
 =?iso-8859-1?Q?FVrl+8w8tkq1wZJ1jV6V961KfgbMikFTvC7U3xZIlVLkRg6nDSL7rEnsar?=
 =?iso-8859-1?Q?z7Dt2AtQj5yhr7p1QIuPhs2k3TOBqQg7xlY6UP2nTGvBpVb6NeBNyzTGTZ?=
 =?iso-8859-1?Q?FlPiL45vMHBbZj6lNmjuF80t27VxVE0RG4plztltERrRBz9Byi1Vzd6wWG?=
 =?iso-8859-1?Q?WnM62skkA1izwgHY61GHYjcLdC/Aga6RsJKLk1VTOn9oTMA14ZdLeUIo5c?=
 =?iso-8859-1?Q?qis81AYl0OWuG+xA7nWbTLnLjC6Jhf6590FTiHc/7ELafcklsc7nHNJZZF?=
 =?iso-8859-1?Q?7LDH5I12a9mMcf/XyYsA/5ANfYRxIHJNF5kD9p8JuZLE745J0MAEV4/lYU?=
 =?iso-8859-1?Q?5qFmWlgw9+XLyT0zE5FpVW/ZXTa9SE/WM5anLavNZIGspD5/oQqeSefkDT?=
 =?iso-8859-1?Q?RJ+Eq8seYP6VkChvy5zFxXiqFnPEV3zEQ9XtAezLkzxpIyOirWbWDJNJWM?=
 =?iso-8859-1?Q?XemRH1KnwBzbtmgzcmc00orXBo26ODcam6CNa043LY0sRy3LNwfVXKwmlI?=
 =?iso-8859-1?Q?QSjZVx4C4UQRrzuMdxdcb5oDZB+SGKF7XcRfRGEUxDAMRVSpBjs/TsTn62?=
 =?iso-8859-1?Q?0ZZt4UaKvPnC/0tYsm0fzQ8XrQg8hDDs1WSL+BthuPZsTCWoBdD7YvsXiX?=
 =?iso-8859-1?Q?W5gSxP99HzCJfyXvyODNVYymenSes+nx9t800fPEOEjdinpGBrYJ8gobwz?=
 =?iso-8859-1?Q?QPekwEU/Ux/XDiamwqIkq+Xks/2vRgF+IgQK/fBRVn5xfD8m1Z+0Gzmy/W?=
 =?iso-8859-1?Q?jGYxwVN1TrijID3UJhq4scPADWV/2WIPIEZ+do7RxXT2adZV4CUI4++XWz?=
 =?iso-8859-1?Q?sQ554aiAeb9ML4tDjEYOrU0s45WBIwPWWWRZ57PAMndFsdfqCANl+A9JM1?=
 =?iso-8859-1?Q?HIh0qJIKpXn9CTUyrN8S9v70VtcW+6rrdDA9Z4Nfpnax5dDILxfqWt9vpY?=
 =?iso-8859-1?Q?MBe5/bI0yhZrdavxjxSxCSifjnYebvjWAwml3dzN7rQIyCT5xsbeJCKBIj?=
 =?iso-8859-1?Q?Drn4noowBPeB3uGRDu9QNEr0LSQM+gxhjjLiXSmE/YCpm/FNKBxmq1JxAx?=
 =?iso-8859-1?Q?u19TxnVQaFXnPLa3ti+E+49jvOfQSCHgmugZKphBOSl2raEUXV4oPE5ANe?=
 =?iso-8859-1?Q?9v9im2Yp13+tDSha3Y4OqZx+kfqsVfEDju2XyB0WXf+K6axnswaE+ssCdk?=
 =?iso-8859-1?Q?rL?=
x-ms-exchange-antispam-messagedata-1: X2T9HmrfHbkfgUqmFpwjeG8+GMxuj8GLNgo=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f4aba49d-a860-499b-d378-08dea2056810
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 13:28:43.7592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K5tWPoOxpzeV5G0bSC6RKP5+IpRCE1uOY2y/PS2T2oXuSVnXPfyZTEArU4FjaBBJWoIp9CzGT/CjCmHM7d66BbCA6NkCiQwRkrmNbJp/Nin+q7h2Z+8MPvbPmvYdNGfP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB0030
X-Rspamd-Queue-Id: A15E645F094
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59530-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[ideasonboard.com,siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,foss.st.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,siliconsignals.io:dkim,MA0P287MB2178.INDP287.PROD.OUTLOOK.COM:mid]

Hi Sakari,=0A=
 =0A=
> On Fri, Apr 24, 2026 at 02:55:44PM +0530, Elgin Perumbilly wrote:=0A=
> > Patch 1/3:=0A=
> > - Drop the fixed data-lanes property, as the sensor supports only a 2-l=
ane MIPI interface.=0A=
>=0A=
> Does it really say that in the datasheet? To me this looks like a driver=
=0A=
> property.=0A=
 =0A=
Yes, I have checked this. The sensor supports only a 2-lane MIPI interface.=
=0A=
 =0A=
There is no explicit statement in the datasheet saying that 1-lane mode is=
=0A=
unsupported. However, after reviewing all available registers, I did not fi=
nd=0A=
any configuration that allows switching to a 1-lane mode.=0A=
 =0A=
Additionally, the datasheet provides no indication or guidance for 1-lane=
=0A=
operation. Based on this, I conclude that the sensor does not support a=0A=
1-lane configuration.=0A=
 =0A=
If you still prefer, I can keep the data-lanes property as is and not drop =
it.=0A=
 =0A=
Best Regards,=0A=
Elgin=

