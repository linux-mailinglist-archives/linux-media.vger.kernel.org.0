Return-Path: <linux-media+bounces-64371-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kQI8N+8PKWrTPgMAu9opvQ
	(envelope-from <linux-media+bounces-64371-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 09:19:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38933666918
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 09:19:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=siliconsignals.io header.s=selector1 header.b=cYGj+MuW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64371-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64371-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=siliconsignals.io;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBAB13181E34
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 07:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3438D385D8D;
	Wed, 10 Jun 2026 07:11:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021143.outbound.protection.outlook.com [40.107.51.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6C1382370;
	Wed, 10 Jun 2026 07:11:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075509; cv=fail; b=BZDFFwOpmBTVhcFFJkDs/xgkdboi55wjrkICn2IjpFSSYm38UC6QCPnrR30i+SdSqjsp89Z2Edc4SW2ou/e9XiNP+UMk5QyR3wRtK+EDZomVjA/iJPx4vAFsfXPb3v3fYOOgf994Kpqc3wnHlYLldl4P+npuB75fEDEI5BctKHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075509; c=relaxed/simple;
	bh=YTT7MqBnnQh9by/yxWEpL7kOw1rYm6zaif8virZ0bnA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i2RUJLqOw4ybq+U0UH9a2Wloo30ymFibU29dOC/jP2F3wiw+LILPCf92T7vbMrfg8t/tadAOGPWX46+N4Cjt7YE4CysCpT94fA3YM16TYyAVD0qL2hLbzXGfHXWC7EbSe7Voif49WPu09enqJwUgCM0HW/IPuNmuCCnJMHlv6Sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=cYGj+MuW; arc=fail smtp.client-ip=40.107.51.143
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxQ09f/C2lwALp9WFW/5ePvOTDgI7Eb/Rs26oKC+sd5wOYWy6QItLsX70NpC0jVdkBMzuvoS0D3CTjy3uqGOtJgQv0LhH5Ohbn3/gt6UtaSuP9iiboxj8cqxc0yizQBNwM3CJbM7NXAoZCvpbKyxZwNGXhZtztq7xg7UFeYDAqDb9Vp5d9aVXk3n6Pef3dfjny5IRfR0+AewXnH9SCC+ovjLjh1kE9WzpNkoQGDXBBLAQKM1vy7D/2b/eRBAmFm2CDXaEj3rTTMhr/2Y7bZCpXIS/p98C/v5qpf/XxZglU9bghvHo5Ae99OQGJsf12rqsrAZwYkifooAhu0t29i81Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tElXIuoyVSxVR/5nl14yAqLhDy2dfng6P9z038DJ1Dg=;
 b=RCYXRR2Xm5FbBxDC8MvtkjWqTAqOijzQNtF0L7BCfGSc95gptD3+ljQEmgA1mEYJ6R7tlsCyfXM85E+ddrmfd1sCZSNmNsx07BQ2DVYANHupQIajJgbEPLx8vifJVtrCrRIDBUXwb331bX/2eFRc2gnihBsnJitsMsJSeYXr2U5G8nZJ1gOukFsUNtWdbSb7K5c5Klpf6EeOFFFJmzs+8YTGPQ22+4B99VXRJ8s3K+FZ0Pc+lrZiWOmmsjv/rSLaD04G3v3fbGp9Kt+yAFyodCXYSgTnLpn3KniDBrAi97Il0onsUrf/G7W84mHZjnBkKJyWhZfFIMvVgt7qPHCv+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tElXIuoyVSxVR/5nl14yAqLhDy2dfng6P9z038DJ1Dg=;
 b=cYGj+MuWwWdy6SORx4NEGXu1oBbhT9M+McHFaElyF6gpYkT+sbeL/exEhkTAOKvY3KGpC+B4vqHSBFpOWM8OYG2z+Uub6MZOY3otLeTDbQ0ovqVU6xpuhEy47sfzQ4Aljsm9i0Ri77RRRdTge9Cx6srNqLSVKdBDP9XlWDW5830piOqcJWwJwXdN0bCmu8wygupibQ3/Rm8yqXTld4sXgTpM2YRyqSelHxFQXryv2Xz9Ytp6c9IuXg2dVdD9qy4BmnjkqIox7hxHNCoNKMerAx8jfRhg7OiwiJkWdfRGhlznomAy2oBQEFQTiLH2dx8gEmgqWFSkdoUswXZuV+8lKA==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNXP287MB4084.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:290::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 07:11:39 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 07:11:39 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Serin Yeh <serin.yeh@intel.com>, Damjan Georgievski <gdamjan@gmail.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Topic: [PATCH v4 3/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Index: AQHc+A6In5hIz4KXM0+mNILJA2o3XbY3Pnvd
Date: Wed, 10 Jun 2026 07:11:39 +0000
Message-ID:
 <PN3P287MB1829693B81531B6333461AAE8B1A2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260609124926.1038981-1-hpa@redhat.com>
 <20260609124926.1038981-4-hpa@redhat.com>
In-Reply-To: <20260609124926.1038981-4-hpa@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PNXP287MB4084:EE_
x-ms-office365-filtering-correlation-id: d82e1bdb-37e4-43ce-8b14-08dec6bf8429
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|6133799003|18002099003|18092099006|22082099003|4143699003|56012099006;
x-microsoft-antispam-message-info:
 ZFhhcEk2vBDu8dJQAFUeCfyy0tzTKza8eyUWAf7gPqCxGYLEN28tn3iI+axCHP3Wwzs8IOUrXGSXU+el6scFJ2jlRNuc0S0/RpyYSAa5kDzx+9lyKHEDdgg+YXQiPZtzDqgFMVONMYcyOUpmX4Nh4W46VyVfV0EyyRLWfXCo9qbQ4pbz6f1PC+sdIwLGBjMveQrVMP+/Lw0Gill95mfeSlqFkT9Oe1flmYGEfYBrY0UmGPwC9v4a3l97G/AiiaMtzl/fbmkc5B9A79CrY3r49P0PwxrEgQhcMT0mR/y3mFSJcZWjuL59T9DxYwWKhpogh+faUNTW0WIsTNFxPYb/0feVg6bew3fcgXGw19qxYWNYy08JsYyXEe+jrPhKTDGkXGSWLn4Ix01RufrYjle3dKQoN6eJsQadKPImyCMdiRIFQ8D2sYLiY9uzbpEs+djYKe1fVJOve2nNmxDfTok78xO53Ux8TwPC/ZDw3V2CRvSIOYEwnSGCRCP2EXJQilSoxK950Vi5hmmWIidC265RCPzE17g1EAUx4qZorvuwj+UwfLSJGcNmWJIIArvPUIhTqIaUSyzIxjebzt1eA03Z4k59deewGGSGH7M3KCct/780ZYqA/PYnFQZJGXLLzcXW52C5dgkt2ln9iJS/6BKpllx6pge6BTXeDrMJACyqtCLZKLUjTO0N3j4L7i0+qQiA9nZwnrm7+T3YraDgt4buXslfYXNBE9ecGI4uYweRP3gSz3t/Sz0syI3QDskTyYRh
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(6133799003)(18002099003)(18092099006)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0I+TE1CR7kbMbP8Udx5TGi8pubAMxfAfhJMO/mziRZSMZ76ryh4lmjFwIF?=
 =?iso-8859-1?Q?+XRa7isllN3Opqedq1yJwRcu/T2pSnuqEyv8QGAH9kdExsNC/zIyWQET1n?=
 =?iso-8859-1?Q?ikMzEH0eSXrUz8V5JFX7unMkzHeqTUdYC0H4SwiTuK6iLVVgeDo2vn2BR1?=
 =?iso-8859-1?Q?WfztpWVNe7xLonjJZDF6vLvONFQ4wF6n7hThFe6yI7JzImbv6GYUZNoce8?=
 =?iso-8859-1?Q?0eckHmtNwjtQY8SGGHKSd79MNwiFScs6pUQOzRuTJe3VimuakMVHoxOBdZ?=
 =?iso-8859-1?Q?dTmdEddnH12ynE7001JS8iPeeeQlnIUK6p46x+d1CvTSoVVuYUfoYyIjNs?=
 =?iso-8859-1?Q?8ceEZ+GWHu+7XpE0x8ZPN3lRlQjhrPyyKRa6LMZc5sSSwptWL0dKTiRu6e?=
 =?iso-8859-1?Q?/b2u0fhBGuSgi0HD4uC+4Y6GDea0VzplW6b5PNYBEfRMgxW91LsWal+Ufp?=
 =?iso-8859-1?Q?kzDGkTbh/i3CKE3yM6bPiYCOSvFICRx3fM59gkduvM3ghksi7HHW+UBTVA?=
 =?iso-8859-1?Q?40CrBhY1MwiP+8RtW+IidBGqHwhRoOfQa8OaWpQfjwRzeT2cJ3wYuUJs7Z?=
 =?iso-8859-1?Q?sJYBJGfs8mnlPqigULGDtNUz6B1Ezq7USUJSoGvgmnORvi7D/0dseZaBsE?=
 =?iso-8859-1?Q?iXieQFUY0LKG3jzXnN6G8Bw1YG4MifbtWdrHMb/MyvyMYHcMVOjFIgVa5V?=
 =?iso-8859-1?Q?0EpA8AUp1njkllr5SxceYYs6IXKr84Qv9qAbdY9ctqjEnswXALAGr1MWS2?=
 =?iso-8859-1?Q?R+xgQ4cUWWvht3qMkX+GGmFE4fv12R8mcxiPW95tDGUC6/r7ssv/edi/SK?=
 =?iso-8859-1?Q?KV3svgtC1c6agGUBV/fMIvT4J/QfDXVIS2diHB8UN+yjEmz0xfF+RZm6KW?=
 =?iso-8859-1?Q?d0sXoeEY/rWnurK9CxKTvcHQJ8XW6R5IdMn14Boij5dS0w77oQ2Eva1BBU?=
 =?iso-8859-1?Q?L9V3RrJbsAK+ONZHug5BEUw9EWm6tkGesP9Vtk33Iw2ppBochlXhW/8RgX?=
 =?iso-8859-1?Q?Dn1AWdDCzEYIIxiMPrIp9lVfk0ecVYNCyvm2oE9dH0MXY+B5LmP/WwPHfp?=
 =?iso-8859-1?Q?5Bpz7jFsR9Mxq7dhOpFdFVx8Ysztetu3rIPCr2fg3sI5dRQA7HnzaWozNl?=
 =?iso-8859-1?Q?BI3Aj/fnLSgaFg3URHCaQZEpWyPsVMv1yIoJU++yHn4QwphdwY9zD/Vbuf?=
 =?iso-8859-1?Q?/s5at1p1aGMNCjFR5DNXf8hcPx3Uxhd69OYbefwgHis0cTFN7owccvKCY4?=
 =?iso-8859-1?Q?Cw/NwG/KNxsWWAyBDTB7EzxRQVGgYfFpJJvT3sSdb0FRe2vjTyEESPqbKi?=
 =?iso-8859-1?Q?T5NLCFy4Lb8f1yjbqtAF+dYz7J3oFDnqqy1lDB4WdnCfCx/YTygSLdwu3y?=
 =?iso-8859-1?Q?ZkIwySoUYEEUw04KLrz0wxXUGY/kPUSb57j5pxi82IvHaITFCg0aJXFJc9?=
 =?iso-8859-1?Q?cs56u7Z3cnOHNkasE64SVs8/OxzsbrlgAv5ooWkAXYIaZLfXX/YR4Dd1e6?=
 =?iso-8859-1?Q?HFVpLh6umE5Md2isPAXBKi6SUkk1ORaqWMUe5T9AwdqwdYLT41/j1g3AxD?=
 =?iso-8859-1?Q?ZUZOgxIZBS6TSEaBBcEmSRFad9xIvY+XIBmDBc0rwsX9yJb33Ynt1gPibS?=
 =?iso-8859-1?Q?SOZh/mDk4VexvAyzbAl+q0XRb18RowivNw1PJH+rI+l0nKo3q3Q9ba35Cy?=
 =?iso-8859-1?Q?cwQbHZFSNbVhuM2fLVRNgJ1762lTUNhHfxyGTla5q6YC+TOaHcqcjG7689?=
 =?iso-8859-1?Q?ZDaWir9F/gz0QAP9IEtHekn22BYxaUho0O9rKMTfDy4nauBa4QqX40DpMH?=
 =?iso-8859-1?Q?3WFhpF6viA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d82e1bdb-37e4-43ce-8b14-08dec6bf8429
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 07:11:39.1515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y8lvJgCsMHIppLx2csa7ZWb07f75/5Ydt/A8rPl7DwtRyVRY8Guf+ryG4njmfj32fpkSz0xs37ADyPdJRVs5j9r4oylEA/A0/TW2TkatodE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64371-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[redhat.com,kernel.org,oss.qualcomm.com,linux.intel.com,intel.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:hpa@redhat.com,m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:sakari.ailus@linux.intel.com,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,vger.kernel.org:from_smtp,siliconsignals.io:dkim,siliconsignals.io:from_mime,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38933666918

Hi Kate,=0A=
=0A=
I noticed a few more issues. Could you please check the comments below?=0A=
=0A=
Sorry, I missed these in my first review.=0A=
=0A=
> Add a new driver for Sony imx471 camera sensor. It is based on=0A=
> Jimmy Su <jimmy.su@intel.com> implementation and the driver can be found=
=0A=
> in the following URL.=0A=
> https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/im=
x471.c=0A=
>=0A=
> This sensor can be found on Lenovo X1 Carbon G14, X9-14 and X9-15 laptops=
=0A=
> and it is a part of IPU7 solution. The driver was tested on Lenovo X1=0A=
> Carbon G14, X9-14 and X9-15 laptops.=0A=
>=0A=
> Signed-off-by: Kate Hsuan <hpa@redhat.com>=0A=
=0A=
...=0A=
=0A=
> +#define IMX471_REG_CSI_DATA_FORMAT             CCI_REG16(0x0112)=0A=
> +#define IMX471_CSI_DATA_FORMAT_RAW10           0x0a0a=0A=
> +=0A=
> +#define IMX471_REG_CSI_LANE_MODE               CCI_REG8(0x0114)=0A=
> +#define IMX471_CSI_2_LANE_MODE                 1=0A=
> +#define IMX471_CSI_4_LANE_MODE                 3=0A=
=0A=
The CSI data format (0x0112) and lane mode (0x0114) registers are defined b=
ut=0A=
never programmed.=0A=
=0A=
The out-of-tree driver mentioned in the cover letter configures these regis=
ters=0A=
during initialization. Shouldn't the same settings be applied here as part =
of=0A=
the global register configuration?=0A=
=0A=
...=0A=
=0A=
> +static const char * const imx471_supply_name[] =3D {=0A=
> +       "avdd",=0A=
> +};=0A=
=0A=
Only avdd is defined as a regulator supply.=0A=
=0A=
According to the datasheet, are there any additional power rails=0A=
(e.g. dvdd or iovdd) required by the sensor?=0A=
=0A=
=0A=
...=0A=
=0A=
> +       { CCI_REG8(0x0307), 0x79 },=0A=
> +       { CCI_REG8(0x030b), 0x01 },=0A=
> +       { CCI_REG8(0x030d), 0x02 },=0A=
> +       { CCI_REG8(0x030e), 0x00 },=0A=
> +       { CCI_REG8(0x030f), 0x53 },=0A=
> +       { CCI_REG8(0x0310), 0x01 },=0A=
> +       { IMX471_REG_EXPOSURE, IMX471_EXPOSURE_DEFAULT },=0A=
=0A=
drop this setting above.=0A=
=0A=
> +       { CCI_REG8(0x3f4c), 0x81 },=0A=
> +       { CCI_REG8(0x3f4d), 0x81 },=0A=
> +       { CCI_REG8(0x3f78), 0x01 },=0A=
> +       { CCI_REG8(0x3f79), 0x31 },=0A=
> +       { CCI_REG8(0x3ffe), 0x00 },=0A=
> +       { CCI_REG8(0x3fff), 0x8a },=0A=
> +       { CCI_REG8(0x5f0a), 0xb6 },=0A=
> +};=0A=
=0A=
...=0A=
=0A=
> +static int imx471_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
> +{=0A=
> +       struct imx471 *sensor =3D container_of_const(ctrl->handler,=0A=
> +                                                  struct imx471,=0A=
> +                                                  ctrl_handler);=0A=
> +       struct v4l2_subdev_state *state =3D=0A=
> +                       v4l2_subdev_get_locked_active_state(&sensor->sd);=
=0A=
> +       const struct v4l2_mbus_framefmt *format =3D=0A=
> +                       v4l2_subdev_state_get_format(state, 0);=0A=
> +       s64 exposure_max;=0A=
> +       int ret;=0A=
> +=0A=
> +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
> +               exposure_max =3D=0A=
> +                       format->height + ctrl->val - IMX471_EXPOSURE_MARG=
IN;=0A=
> +               ret =3D __v4l2_ctrl_modify_range(sensor->exposure,=0A=
> +                                              sensor->exposure->minimum,=
=0A=
> +                                              exposure_max,=0A=
> +                                              sensor->exposure->step,=0A=
> +                                              exposure_max);=0A=
> +               if (ret)=0A=
> +                       return ret;=0A=
> +       }=0A=
> +=0A=
> +       /* V4L2 controls values will be applied only when power is alread=
y up */=0A=
> +       if (!pm_runtime_get_if_in_use(sensor->dev))=0A=
=0A=
Use pm_runtime_get_if_active() or update the comment. With pm_runtime_get_i=
f_in_use(),=0A=
the comment should say "applied only when the device is in use".=0A=
=0A=
> +               return 0;=0A=
> +=0A=
> +       switch (ctrl->id) {=0A=
> +       case V4L2_CID_ANALOGUE_GAIN:=0A=
> +               ret =3D cci_write(sensor->regmap, IMX471_REG_ANALOG_GAIN,=
=0A=
> +                               ctrl->val, NULL);=0A=
> +               break;=0A=
> +       case V4L2_CID_DIGITAL_GAIN:=0A=
> +               ret =3D cci_write(sensor->regmap, IMX471_REG_DIG_GAIN_GLO=
BAL,=0A=
> +                               ctrl->val, NULL);=0A=
> +               break;=0A=
> +       case V4L2_CID_EXPOSURE:=0A=
> +               ret =3D cci_write(sensor->regmap, IMX471_REG_EXPOSURE,=0A=
> +                               ctrl->val, &ret);=0A=
> +               break;=0A=
> +       case V4L2_CID_VBLANK:=0A=
> +               /* Update FLL that meets expected vertical blanking */=0A=
> +               ret =3D cci_write(sensor->regmap, IMX471_REG_FLL,=0A=
> +                               format->height + ctrl->val, &ret);=0A=
> +               break;=0A=
> +       case V4L2_CID_TEST_PATTERN:=0A=
> +               ret =3D cci_write(sensor->regmap, IMX471_REG_TEST_PATTERN=
,=0A=
> +                               ctrl->val, NULL);=0A=
> +               break;=0A=
> +       case V4L2_CID_HFLIP:=0A=
> +       case V4L2_CID_VFLIP:=0A=
> +               ret =3D cci_write(sensor->regmap, IMX471_REG_ORIENTATION,=
=0A=
> +                               sensor->hflip->val | sensor->vflip->val <=
< 1, NULL);=0A=
> +               break;=0A=
> +       default:=0A=
> +               ret =3D -EINVAL;=0A=
> +               dev_info(sensor->dev, "ctrl(id:0x%x,val:0x%x) is not hand=
led",=0A=
=0A=
Use dev_err.=0A=
=0A=
> +                        ctrl->id, ctrl->val);=0A=
> +               break;=0A=
> +       }=0A=
> +=0A=
> +       pm_runtime_put(sensor->dev);=0A=
> +=0A=
> +       return ret;=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +static int imx471_set_pad_format(struct v4l2_subdev *sd,=0A=
> +                                struct v4l2_subdev_state *sd_state,=0A=
> +                                struct v4l2_subdev_format *fmt)=0A=
> +{=0A=
> +       struct imx471 *sensor =3D to_imx471(sd);=0A=
> +       const struct imx471_mode *mode;=0A=
> +       u64 pixel_rate;=0A=
> +       int h_blank;=0A=
> +       int ret;=0A=
=0A=
int h_blank, ret;=0A=
=0A=
> +=0A=
> +       mode =3D v4l2_find_nearest_size(imx471_modes,=0A=
> +                                     ARRAY_SIZE(imx471_modes),=0A=
> +                                     width, height,=0A=
> +                                     fmt->format.width, fmt->format.heig=
ht);=0A=
> +=0A=
> +       imx471_update_pad_format(sensor, mode, fmt);=0A=
> +=0A=
> +       *v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt->format=
;=0A=
> +=0A=
> +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)=0A=
> +               return 0;=0A=
> +=0A=
> +       if (media_entity_is_streaming(&sensor->sd.entity))=0A=
> +               return -EBUSY;=0A=
> +=0A=
> +       pixel_rate =3D div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);=0A=
> +       ret =3D __v4l2_ctrl_modify_range(sensor->pixel_rate,=0A=
> +                                      V4L2_CID_PIXEL_RATE,=0A=
> +                                      pixel_rate, 1, pixel_rate);=0A=
> +       if (ret)=0A=
> +               return ret;=0A=
=0A=
Why do we need this? You have a fixed pixel_rate. Drop the settings above.=
=0A=
=0A=
> +=0A=
> +       ret =3D __v4l2_ctrl_modify_range(sensor->vblank,=0A=
> +                                      mode->fll_min - mode->height,=0A=
> +                                      IMX471_FLL_MAX - mode->height,=0A=
> +                                      1,=0A=
> +                                      mode->fll_def - mode->height);=0A=
> +       if (ret)=0A=
> +               return ret;=0A=
> +=0A=
> +       h_blank =3D mode->llp - mode->width;=0A=
> +       /*=0A=
> +        * Currently hblank is not changeable.=0A=
> +        * So FPS control is done only by vblank.=0A=
> +        */=0A=
> +       return __v4l2_ctrl_modify_range(sensor->hblank, h_blank,=0A=
> +                                       h_blank, 1, h_blank);=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +static int imx471_enable_stream(struct v4l2_subdev *sd,=0A=
> +                               struct v4l2_subdev_state *state,=0A=
> +                               u32 pad, u64 streams_mask)=0A=
> +{=0A=
> +       struct imx471 *sensor =3D to_imx471(sd);=0A=
> +       const struct imx471_mode *mode;=0A=
> +       struct v4l2_mbus_framefmt *fmt;=0A=
> +       int ret;=0A=
> +=0A=
> +       ret =3D pm_runtime_resume_and_get(sensor->dev);=0A=
> +       if (ret)=0A=
> +               return ret;=0A=
> +=0A=
> +       ret =3D imx471_identify_module(sensor);=0A=
> +       if (ret)=0A=
> +               return ret;=0A=
=0A=
Runtime PM leak. Please call error_powerdown at return path.=0A=
=0A=
> +=0A=
> +       ret =3D cci_multi_reg_write(sensor->regmap, imx471_global_regs,=
=0A=
> +                                 ARRAY_SIZE(imx471_global_regs), NULL);=
=0A=
> +       if (ret) {=0A=
> +               dev_err(sensor->dev, "failed to set global settings: %d",=
 ret);=0A=
> +               goto error_powerdown;=0A=
> +       }=0A=
> +=0A=
> +       state =3D v4l2_subdev_get_locked_active_state(&sensor->sd);=0A=
=0A=
Why is the active state retrieved again here? state is already passed to en=
able_stream()=0A=
=0A=
Drop this line.=0A=
=0A=
> +       fmt =3D v4l2_subdev_state_get_format(state, 0);=0A=
> +       mode =3D v4l2_find_nearest_size(imx471_modes, ARRAY_SIZE(imx471_m=
odes),=0A=
> +                                     width, height, fmt->width, fmt->hei=
ght);=0A=
> +=0A=
> +       ret =3D cci_multi_reg_write(sensor->regmap, mode->default_mode_re=
gs,=0A=
> +                                 mode->default_mode_regs_length, NULL);=
=0A=
> +       if (ret) {=0A=
> +               dev_err(sensor->dev, "failed to set mode: %d", ret);=0A=
> +               goto error_powerdown;=0A=
> +       }=0A=
> +=0A=
> +       ret =3D cci_write(sensor->regmap, IMX471_REG_DPGA_USE_GLOBAL_GAIN=
, 1, NULL);=0A=
> +       if (ret)=0A=
> +               goto error_powerdown;=0A=
> +=0A=
> +       ret =3D __v4l2_ctrl_handler_setup(&sensor->ctrl_handler);=0A=
> +       if (ret)=0A=
> +               goto error_powerdown;=0A=
> +=0A=
> +       ret =3D cci_write(sensor->regmap, IMX471_REG_MODE_SELECT,=0A=
> +                       IMX471_MODE_STREAMING, NULL);=0A=
> +       if (ret)=0A=
> +               goto error_powerdown;=0A=
> +=0A=
> +       __v4l2_ctrl_grab(sensor->vflip, true);=0A=
> +       __v4l2_ctrl_grab(sensor->hflip, true);=0A=
> +=0A=
> +       return ret;=0A=
> +=0A=
> +error_powerdown:=0A=
> +       pm_runtime_put(sensor->dev);=0A=
> +=0A=
> +       return ret;=0A=
=0A=
...=0A=
=0A=
> +static int imx471_init_controls(struct imx471 *sensor)=0A=
> +{=0A=
> +       const struct imx471_mode *mode =3D &imx471_modes[0];=0A=
> +       struct v4l2_fwnode_device_properties props;=0A=
> +       struct v4l2_ctrl_handler *ctrl_hdlr;=0A=
> +       struct v4l2_ctrl *link_freq;=0A=
> +       s64 exposure_max, hblank;=0A=
> +       u64 pixel_rate;=0A=
> +       int ret;=0A=
> +=0A=
> +       ctrl_hdlr =3D &sensor->ctrl_handler;=0A=
> +       v4l2_ctrl_handler_init(ctrl_hdlr, 12);=0A=
> +=0A=
> +       ret =3D v4l2_fwnode_device_parse(sensor->dev, &props);=0A=
> +       if (ret) {=0A=
> +               dev_err(sensor->dev, "failed to parse fwnode: %d", ret);=
=0A=
> +               return ret;=0A=
=0A=
Memory leak, Use goto error here.=0A=
=0A=
> +       }=0A=
> +=0A=
> +       v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx471_ctrl_ops, &pro=
ps);=0A=
> +=0A=
> +       link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr,=0A=
> +                                          &imx471_ctrl_ops,=0A=
> +                                          V4L2_CID_LINK_FREQ,=0A=
> +                                          ARRAY_SIZE(link_freq_menu_item=
s) - 1,=0A=
> +                                          0,=0A=
> +                                          link_freq_menu_items);=0A=
> +=0A=
> +       /* pixel_rate =3D link_freq * 2 * nr_of_lanes / bits_per_sample *=
/=0A=
> +       pixel_rate =3D div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);=0A=
> +=0A=
> +       sensor->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_=
ops,=0A=
> +                                              V4L2_CID_PIXEL_RATE, pixel=
_rate,=0A=
> +                                              pixel_rate, 1, pixel_rate)=
;=0A=
=0A=
You can drop pixel_rate from struct sensor. it is not used anywhere in the =
driver.=0A=
=0A=
> +=0A=
> +       sensor->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr,=0A=
> +                                          &imx471_ctrl_ops,=0A=
> +                                          V4L2_CID_VBLANK,=0A=
> +                                          mode->fll_min - mode->height,=
=0A=
> +                                          IMX471_FLL_MAX - mode->height,=
=0A=
> +                                          1,=0A=
> +                                          mode->fll_def - mode->height);=
=0A=
> +=0A=
> +       hblank =3D mode->llp - mode->width;=0A=
> +       sensor->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,=
=0A=
> +                                          V4L2_CID_HBLANK, hblank, hblan=
k,=0A=
> +                                          1, hblank);=0A=
> +=0A=
> +       /* fll >=3D exposure time + adjust parameter (default value is 18=
) */=0A=
> +       exposure_max =3D mode->fll_def - IMX471_EXPOSURE_MARGIN;=0A=
> +       sensor->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_op=
s,=0A=
> +                                            V4L2_CID_EXPOSURE,=0A=
> +                                            IMX471_EXPOSURE_MIN, exposur=
e_max,=0A=
> +                                            IMX471_EXPOSURE_STEP,=0A=
> +                                            IMX471_EXPOSURE_DEFAULT);=0A=
> +=0A=
> +       v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_ANALOGUE_=
GAIN,=0A=
> +                         IMX471_ANA_GAIN_MIN, IMX471_ANA_GAIN_MAX,=0A=
> +                         IMX471_ANA_GAIN_STEP, IMX471_ANA_GAIN_DEFAULT);=
=0A=
> +=0A=
> +       v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_DIGITAL_G=
AIN,=0A=
> +                         IMX471_DGTL_GAIN_MIN, IMX471_DGTL_GAIN_MAX,=0A=
> +                         IMX471_DGTL_GAIN_STEP, IMX471_DGTL_GAIN_DEFAULT=
);=0A=
> +=0A=
> +       v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx471_ctrl_ops,=0A=
> +                                    V4L2_CID_TEST_PATTERN,=0A=
> +                                    ARRAY_SIZE(imx471_test_pattern_menu)=
 - 1,=0A=
> +                                    0, 0, imx471_test_pattern_menu);=0A=
> +=0A=
> +       sensor->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,=
=0A=
> +                                         V4L2_CID_HFLIP, 0, 1, 1, 0);=0A=
> +=0A=
> +       sensor->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,=
=0A=
> +                                         V4L2_CID_VFLIP, 0, 1, 1, 0);=0A=
> +=0A=
> +       if (ctrl_hdlr->error) {=0A=
> +               dev_err(sensor->dev, "%s control init failed: %d",=0A=
> +                       __func__, ctrl_hdlr->error);=0A=
> +               goto error;=0A=
> +       }=0A=
> +=0A=
> +       link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;=0A=
> +       sensor->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;=0A=
> +       sensor->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;=0A=
> +       sensor->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;=0A=
> +=0A=
> +       sensor->sd.ctrl_handler =3D ctrl_hdlr;=0A=
> +=0A=
> +       return 0;=0A=
> +=0A=
> +error:=0A=
> +       v4l2_ctrl_handler_free(ctrl_hdlr);=0A=
> +=0A=
> +       return ctrl_hdlr->error;=0A=
> +}=0A=
> +=0A=
> +static int imx471_check_hwcfg(struct imx471 *sensor)=0A=
> +{=0A=
> +       struct v4l2_fwnode_endpoint bus_cfg =3D {=0A=
> +               .bus_type =3D V4L2_MBUS_CSI2_DPHY,=0A=
> +       };=0A=
> +       struct fwnode_handle *ep, *fwnode =3D dev_fwnode(sensor->dev);=0A=
> +       unsigned long link_freq_bitmap;=0A=
> +       struct clk *clk;=0A=
> +       int ret;=0A=
> +=0A=
> +       clk =3D devm_v4l2_sensor_clk_get(sensor->dev, NULL);=0A=
> +       if (IS_ERR(clk))=0A=
> +               return dev_err_probe(sensor->dev, PTR_ERR(clk),=0A=
> +                                    "can't get clock frequency\n");=0A=
> +=0A=
> +       if (clk_get_rate(clk) !=3D IMX471_EXT_CLK)=0A=
> +               return dev_err_probe(sensor->dev, -EINVAL,=0A=
> +                                    "external clock %lu is not supported=
\n",=0A=
> +                                    clk_get_rate(clk));=0A=
> +=0A=
> +       ep =3D fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);=0A=
> +       ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);=0A=
> +       fwnode_handle_put(ep);=0A=
> +       if (ret)=0A=
> +               return dev_err_probe(sensor->dev, ret,=0A=
> +                                    "parsing endpoint failed");=0A=
> +=0A=
> +       ret =3D v4l2_link_freq_to_bitmap(sensor->dev, bus_cfg.link_freque=
ncies,=0A=
> +                                      bus_cfg.nr_of_link_frequencies,=0A=
> +                                      link_freq_menu_items,=0A=
> +                                      ARRAY_SIZE(link_freq_menu_items),=
=0A=
> +                                      &link_freq_bitmap);=0A=
> +=0A=
> +       v4l2_fwnode_endpoint_free(&bus_cfg);=0A=
=0A=
The sensor supports both 2 and 4 CSI-2 data lanes, but this driver only=0A=
implements the 4-lane configuration. Please validate the data-lanes propert=
y=0A=
and reject anything other than 4 lanes.=0A=
=0A=
> +=0A=
> +       return ret;=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +static const struct acpi_device_id imx471_acpi_ids[] __maybe_unused =3D =
{=0A=
> +       { "SONY471A" },=0A=
> +       { "TBE20A0" },=0A=
> +       { /* sentinel */ }=0A=
> +};=0A=
> +MODULE_DEVICE_TABLE(acpi, imx471_acpi_ids);=0A=
> +=0A=
> +static struct i2c_driver imx471_i2c_driver =3D {=0A=
> +       .driver =3D {=0A=
> +               .name =3D "imx471",=0A=
> +               .acpi_match_table =3D ACPI_PTR(imx471_acpi_ids),=0A=
=0A=
Could you please add .of_match_table as well? The driver can also be used=
=0A=
on DT-based systems.=0A=
=0A=
> +               .pm =3D pm_sleep_ptr(&imx471_pm_ops),=0A=
> +       },=0A=
> +       .probe =3D imx471_probe,=0A=
> +       .remove =3D imx471_remove,=0A=
> +};=0A=
> +module_i2c_driver(imx471_i2c_driver);=0A=
> +=0A=
> +MODULE_AUTHOR("Jimmy Su <jimmy.su@intel.com>");=0A=
> +MODULE_AUTHOR("Serin Yeh <serin.yeh@intel.com>");=0A=
> +MODULE_AUTHOR("Kate Hsuan <hpa@redhat.com>");=0A=
> +MODULE_DESCRIPTION("Sony imx471 sensor driver");=0A=
> +MODULE_LICENSE("GPL");=0A=
> --=0A=
> 2.54.0=0A=
=0A=
Best Regards,=0A=
Tarang=

