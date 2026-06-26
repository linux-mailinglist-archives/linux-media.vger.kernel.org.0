Return-Path: <linux-media+bounces-65775-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bw7EDfLAPmrXLAkAu9opvQ
	(envelope-from <linux-media+bounces-65775-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 20:12:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 988606CFA72
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 20:12:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=talbi.fr header.s=selector2 header.b=FegAOaLy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65775-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65775-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=talbi.fr;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE365300B3F4
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 18:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB95B3AFD09;
	Fri, 26 Jun 2026 18:10:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023104.outbound.protection.outlook.com [40.107.159.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EF83AE71E;
	Fri, 26 Jun 2026 18:10:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782497429; cv=fail; b=QdXoGONwZeiS/4JHfxVkuuC82NJrMWgScxsycEBK3HH6qUSE+CaqFeNUHE1ccH18jZYK5HMKubpMYsjuTy03WEc/Skctf8YajZfvwYS07MDN0F24c8e6wqWUoBXL+O7iMNzAeYDhaftgWZjnWr0Us2t0FrNfuEvCFeFo6nj3Y4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782497429; c=relaxed/simple;
	bh=X3mByBekX9YLjElFy7ZnOF4JOriqJuDALkCiOmn3knw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=eVsrzQVKUL2zMtKoB+pKX2XHJvS1YtDmcc+qEJdl/iV9sVAJekHDB33f3NZuVP4Sri2he/JdjY9KvQAej4ihmZGUJLgpnpw1PTRmzkgmYdpse4wK8IIWDMg5O2SGojb5IQfgwULs9U63QcZnVKLGsscCYBB9S1RWECjUb9bHSZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=talbi.fr; spf=pass smtp.mailfrom=talbi.fr; dkim=pass (1024-bit key) header.d=talbi.fr header.i=@talbi.fr header.b=FegAOaLy; arc=fail smtp.client-ip=40.107.159.104
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOWU7GYVPTCWVrVpJSrWd8AsF5pRMYkVxJ05MhjX5Bs/xKGWcfjAHuj5eqEI531C/jn7OSno5kNZBFbTOV5cxC8kK8lYQF+EHSy6fxXUXQJ1IyzYh/qkhTEj3VQBFO4OvUo4z9hGioj16FNfA+OA2Jqo5h7cVbgrpE+PrQaY+EqdanfxKbPAjdzwhHomKd6GAAZoBiJctujZx7Jw4AgEZVnqI0RQi2LMqkhexhCD0LAIxMtkWOP0Iy/UO7hDW0JjlPrtScuIu1JWI5PqoINAeJOapNwx2k7P6WApn/UFJHHCl3poBrm0S3nYWw0BouO6KYRygEz8/hhnmEkabGLVgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3mByBekX9YLjElFy7ZnOF4JOriqJuDALkCiOmn3knw=;
 b=Z1wAu8hvvF9MK3MHosEMlE49j5Nf/DFRNM5vWun3aGhP3W3e9pMACEHDyY+faz4xU8qlDx6ezACLuK+i3Xic0IMAYsUO1Urqh2yWYCkOM6cJZx5zcSJV7PmV/pw6NNnWslzgGoxwRnze96Lu8hdcq2DlamYe/CD2CK5JPE0iiCfx8byb66gV/5bTD+GrBustcdw8ZRWAYkJL+SbsTHCsNc5ml0Un7bfguxGb++les/rkoD8EsWT5zwn9Wevk69KU7fz7auV4TH7gCj1pMqcHmbtYQ9vSDpZc+f0evq1KYfm2B89zsCg2vAVqPzEx/+Dd1Zw0pCFtfTTKFsdL9RjjQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talbi.fr; dmarc=pass action=none header.from=talbi.fr;
 dkim=pass header.d=talbi.fr; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=talbi.fr; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3mByBekX9YLjElFy7ZnOF4JOriqJuDALkCiOmn3knw=;
 b=FegAOaLymUvFzIEmepKZdFjZUR7cZYbccXCE5VUAfr4hyhf+Jf3CsGQgZrKh9XZB9ArKHq/bKaO8zSC7IEHcumm7cdGey7FreFKcajUiYUaFXwDl0xLaTJNsZC8MIU28o0THUMTBsWpPPSvjJIXdzwINjwImC/51lKgg4SGm0co=
Received: from AS4PR03MB8364.eurprd03.prod.outlook.com (2603:10a6:20b:513::14)
 by VI0PR03MB11298.eurprd03.prod.outlook.com (2603:10a6:800:333::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 18:10:23 +0000
Received: from AS4PR03MB8364.eurprd03.prod.outlook.com
 ([fe80::b3ac:87d3:603:923d]) by AS4PR03MB8364.eurprd03.prod.outlook.com
 ([fe80::b3ac:87d3:603:923d%4]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 18:10:22 +0000
From: Anis TALBI <anis@talbi.fr>
To: "hpa@redhat.com" <hpa@redhat.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>,
	"hverkuil+cisco@kernel.org" <hverkuil+cisco@kernel.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"serin.yeh@intel.com" <serin.yeh@intel.com>, "tarang.raval@siliconsignals.io"
	<tarang.raval@siliconsignals.io>, "gdamjan@gmail.com" <gdamjan@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Topic: [PATCH v5 3/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Index: AQHdBZXnJ8TnHo6XxEOg2BMIcg1tjQ==
Date: Fri, 26 Jun 2026 18:10:22 +0000
Message-ID:
 <AS4PR03MB8364E300C6CBDF8A04969C70A7EB2@AS4PR03MB8364.eurprd03.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR03MB8364:EE_|VI0PR03MB11298:EE_
x-ms-office365-filtering-correlation-id: b240150b-65dc-46f6-9e5c-08ded3ae30b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|38070700021|18002099003|56012099006;
x-microsoft-antispam-message-info:
 bMxB4TzwE9MhnP9nIs/6JexHO8eJzTfiLAxgVnJ4JcmKOfFLH70k/38Yh4At4GL5jZMpILR+HFfaMlANEZTgB1k3Rzz2K1hZDRPXOZDChKlyqXpezZy8eXsmqplsNnCgL7PyT6UAAOYQR70qDWnVNnMrOPBBU4PwjOuZJXDMgQHKY4wulaig87OeJvXKwPUZ6PqGL7GZ9NhHCRGpyyT34njpdSK9bX033WMHCgh35668WZHFZ9ASwfb4RJ5b/o4hnzpdfkajOyw5aj9kJ6qHaFG235oXS0mhoy8x3jCXIoacsb6YjBVFzm7aLsgNSffzuo06nEV8D7aYEmzyjsrfMmEjmcjvdTCh3+OFar0jKJEUs9YW1tKYyGbA/jlMXqEYY2exGsAMBaclg2QOcwRj/cuNhFNecAUSr7CZbUXzR8KIvPZs+AbLJ6hXQ+pla1U+y6vR3Jy+dl5TPxbFhwUn6BMnhRShappB5In4WR8D8RYFqOHdLsGHHuTCpZhcMOTtMlaFYFr3hzYNPsKuyrQuwP3Dqu8kYOO+bE2hK4nyqeDgwGfaWp2oB09xlFaqys3dJ1iFsJHSZUTPZTiLzEztVJ5N0dS/ZNlV6W7SqZLHV86b082NvI0tl86Mzjv1Rvfoy7izN7PqdlKoJiUxVKeJZTl2qMrOr4HkAJAxDCdmOrYNij1by3XilcYhKGORX09k+UtU0uDmYmRL5YZwcWYmpw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR03MB8364.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(38070700021)(18002099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ykTVruRyXmX0VpY8MVlMI5aQkpcpyC8CjHJ8W084UFDWtzTMoRGq85XA44?=
 =?iso-8859-1?Q?UWRckvlKCBEMvSy0kGVpJfG4AenXhhEwz2IrULvvzg8P4CEr0OMunIwuxe?=
 =?iso-8859-1?Q?11hN3PRZmOwI6/zMKxJRNiXpNmVcKtU5MG33XOLyhAt5S6++E03m6phO8Q?=
 =?iso-8859-1?Q?80QBYnyjkAjZOfiGd4YmewBIbjHfDgqrvA/6wYqw7YOZdtW2Oe57Jf51Gh?=
 =?iso-8859-1?Q?HceCfpDWRpQ3Jqb03BxlXYs76TCnqrNyofuK0EfxWY0ym3/jXierdNezDX?=
 =?iso-8859-1?Q?e5Oo7Cx301J8G23b0cY/IQT2dkvVOYjFO38JaWzEHv4+s75IHV2wCgYIgX?=
 =?iso-8859-1?Q?JCJbuC8eQKwH+++5dPuGfZh3zZMJ3eNxz59xYkceH7jQgKMdPSw5xiaASn?=
 =?iso-8859-1?Q?Z46yyvAGswuy5RKPoo0a5FO5XV7U3HRCkQqdPZIxyM+d1bCVw2NsLM3gYu?=
 =?iso-8859-1?Q?FSyZBaLSIxGy1Zf0/yaPyN6i1Zmw4ND/pzKlUjTyTMt8N870iiCGxnVg8K?=
 =?iso-8859-1?Q?k9VkZbmf524ymtxJhn06Y7Q2Gy64TdmVRoyCLmc+ZZerbv1gmuGbwKc7st?=
 =?iso-8859-1?Q?MjJG5n6MqpCk8AWozp9M3UbFBgBVyXOuwa5+u7Om1GTxpOkNZYe1cPxsOb?=
 =?iso-8859-1?Q?iDM2a3Vo//+AvX/x/T34Eo23okojDCjC4Z//sR6s/7rTpeBKLudGVntGIR?=
 =?iso-8859-1?Q?j5qi06s857FtviH7deJT+aK9VwBkewlUb0qWvZQwEBvNU1IlYHUi7xfSvm?=
 =?iso-8859-1?Q?ZN0xDcp+Sox7tjwqAmHk9j3lY+UtfgSNOvMWqIQ5YF4d8uyfW42c2AVLZg?=
 =?iso-8859-1?Q?mMkCw74ls72MA9UW5qghfesyq82M3oPeZUDxoIdSWYjCdiEWb7Im9JZy2v?=
 =?iso-8859-1?Q?fe5D14KzD8XC9efBcBr2ItOz67QCcz1o3REdgarquYuxTLK5RvXqfKJZRp?=
 =?iso-8859-1?Q?5tewNNrGBCkbn4z++obkmDImgjoK3DxlsLGN61mTFAFXd4ZdPFb5wj7UfZ?=
 =?iso-8859-1?Q?yLjeVI1GVLXEYQ38T9BWsB+4dn9Azww0AJ43xHfI20oUAGWc77m3ym5C9o?=
 =?iso-8859-1?Q?gxcPoL37mtj7gSWAiryHK7XMoGgUR4bsSbdgUzAhVpbSgcxYQTKQe0rE3n?=
 =?iso-8859-1?Q?fZ9AGaJmlLlNZu4XJmVfQWnxBpGO6RLwP4K+8qqJknn7WKdQKaZmEZS/d2?=
 =?iso-8859-1?Q?vnxpZbGaxbtfr2oRx/8TWtmhI5j8R+uw2lbQLPtC9svRwKMZWWyd6Xl4Ae?=
 =?iso-8859-1?Q?/KXmQcqVcW/6lI5T+F/XwUS2CrffI9bBK58XzWxpQFbczaERscDNSajplF?=
 =?iso-8859-1?Q?qMCZu3MK+yz4RdKzkHuDqDrn34yCqUJyaJ5FpYPEgx+dUayWzLgbld41ge?=
 =?iso-8859-1?Q?Q1WTq1qvtWTTfIChsqwI1Zj+DAETapDrst6vWraO2WsjPTHsCKrZW8LV9w?=
 =?iso-8859-1?Q?6sxl1maoHqyqWCT6Tn5EReA9uf+Fo327QP7sZtuqAZ0bCPTVAyDQMKK0we?=
 =?iso-8859-1?Q?ER3uff9hafv1a335WnQL0xT76DJv34pHDL/FAR3WrobGYibsZfD97A6raE?=
 =?iso-8859-1?Q?XtSlmbrS5BtpJuWoYailA5oz2/o8f/QmoFVpV9TXCcQOxuQteVOfCG2aak?=
 =?iso-8859-1?Q?VktXXtHrFkrnzTrPeu0iObhUBMAbNS/aa9wdek2hFgr7T+xhXgzWq1CHvy?=
 =?iso-8859-1?Q?s78eyo9sC0oui21hHomsxoJeVEfXf1oBLn8jSgQ3p+kZAu1tigWpFYyxZQ?=
 =?iso-8859-1?Q?2HDB1kEgLAzgwIpPT3lt4knFM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: talbi.fr
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR03MB8364.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b240150b-65dc-46f6-9e5c-08ded3ae30b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2026 18:10:22.7968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5fda0bec-b398-4879-9e68-144d9bdec805
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5fxiPlyX7LQO76q5Ltk7vVNKKdCZAnf3RNyzZdCCxXKegZ2vtzMZf6LMZ7lBhhOM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB11298
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	FAKE_REPLY(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[talbi.fr,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[talbi.fr:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65775-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hpa@redhat.com,m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:sakari.ailus@linux.intel.com,m:serin.yeh@intel.com,m:tarang.raval@siliconsignals.io,m:gdamjan@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[anis@talbi.fr,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.intel.com,intel.com,siliconsignals.io,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[talbi.fr:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anis@talbi.fr,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 988606CFA72

Hi Kate,=0A=
=0A=
As mentioned on Bugzilla (#2454119), I successfully tested the v5 patchset =
via the Koji build on my Lenovo ThinkPad X9 (Lunar Lake). =0A=
=0A=
The camera stream works perfectly, and both the image orientation and the B=
ayer order (colors) are now 100% correct despite the upside-down mounting.=
=0A=
=0A=
Tested-by: computman<anis@talbi.fr>=

