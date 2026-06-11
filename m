Return-Path: <linux-media+bounces-64544-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UkGpKd5jKmqEogMAu9opvQ
	(envelope-from <linux-media+bounces-64544-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:29:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6F366F634
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:29:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=siliconsignals.io header.s=selector1 header.b="jCk//yrQ";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64544-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64544-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=siliconsignals.io;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A3CC23019829
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 07:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B904539098C;
	Thu, 11 Jun 2026 07:29:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020109.outbound.protection.outlook.com [52.101.227.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F62D365A00;
	Thu, 11 Jun 2026 07:29:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781162964; cv=fail; b=YymT3phV99Xi6A9G0fAAjCgCsIWDkZUzT+58AshOm2mE4XbljuEQM9LUY8IETUQFfWiSdfInUVQZ5Oxizwzjt2MK/36iCUYgwDk5cCiHCx3g9KtgEfsggjBgbJTHMqq7aYr/zVSiCPSC4JO4fQ+BF8ZgYLun6k4OmVUnHZZGPG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781162964; c=relaxed/simple;
	bh=lae1RjZd0weKS1jmu35i6Id8XqhRY5sjEFsb6NCqqlU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NYHaiKvNybA2De/14HKpFmF+XkQoJ/HYO1Kpepe9Grx651cldVwvVM4FL0nIv22p41dc7T4L7PMH/Efa+o6Adzdn/XvZmzT9bpmvVfYdCKQeOgmNFKaFR2wTFQlcxOHuI30KQyQDzfgi57tVTqlMxUg4gap6ZgXc2lDrMbdl7Jw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=jCk//yrQ; arc=fail smtp.client-ip=52.101.227.109
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADFychv5rqxnLNKB98tk2+vA4OiqzIf76lqhtitffMe6ugd839eRBIvGCH1GAvDpYR9IBojcbdoO5Z0WBMt51A6kI1Z2TyjtxnF/Vx2D2YzKqmIMrZtPKXYciYjOFB2BN4/6SBKgN4RN+X1AspPM1xCrbbpuiufnfeUBW/0mx1JXV9bzxfD4LOGCvO7N8zv5QUwzXNzZFe+arztt6/nnvWIwA1SCUXK6Ga1lhSoeXUaoBgtVu3VjSzGlB3H/KUA//SadAGzk+ikfZbaLaey/I5DKvVeoJR2BQDuU6sbb00BAg3EYKFtX60mtD9VOBZDNNfY99ox4XLBvT3KRoY0K4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9T66dQVFMsUonrJNqMfJ+VKBRQmj8uqC0ATlAa/yQs=;
 b=R9ImNJI7HO8AV3MPM3WorCuou0EXGIqDpYLR3sCNpWla2MvSkIPlfFIoMLjctSr3i/AZXJH3RFxnnJiaXMZUvhExEEmTRofwLXF3a0wt0JqNVMFmiXdkvUSw2Q0xW83OgZHhhGmVO5cAPIegZEL3/sd0wjT45980RfZ9UKHW0ihyaryXKLhK9XOe8ZElZSpAlvQSXKQuD3bbqtvdknA2IascPEjerRtdTKyB7mGVmNAu4UTVKlHpAutvUnXW7bRrd1U+3q7nfnvhEyz7334Y51iTzOBvgUtIFjYe8o/aCsW8tthcz9KiGGja68RVN6f3KxKTUtDnA/alIxhwU5wdWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9T66dQVFMsUonrJNqMfJ+VKBRQmj8uqC0ATlAa/yQs=;
 b=jCk//yrQX+MtZegvTEEGHPfQoMd6fXoGE7gDnfbUXl8DvyJ3FqrH7RHakMfVoT75podoP3xbXRgcN3+SlUyfToTOx0e525mCm/lMS8Kpb+kOiCMPXjTW+DIyKQof2yEJECa9SSuqU5vbge27/6KsoxR+3mfqeJN1bu7K4nw6NSi59i4eIrXa5DBYwvMW6hN07lRmdF3lnXpEbwviu3jAo34ZdcMm4Blh+fzovfspgNd4P8hidW1PBC4rbiEUGfFPgVh9iJ4FpfzI+uk2IGD5G+z2KsInHcxuZgdJnOK8+ndInAFm/2zGDK5wTTMVPX70XDmSs9jmZqmVWdypuRHVoQ==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN4P287MB4638.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 07:29:18 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 07:29:18 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Kate Hsuan <hpa@redhat.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede
	<johannes.goede@oss.qualcomm.com>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>, Serin Yeh <serin.yeh@intel.com>,
	Damjan Georgievski <gdamjan@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Topic: [PATCH v4 3/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Index: AQHc+A6In5hIz4KXM0+mNILJA2o3XbY3PnvdgAGta4CAAAoaCw==
Date: Thu, 11 Jun 2026 07:29:18 +0000
Message-ID:
 <PN3P287MB18290ACF5BDCB563A710261D8B1B2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260609124926.1038981-1-hpa@redhat.com>
 <20260609124926.1038981-4-hpa@redhat.com>
 <PN3P287MB1829693B81531B6333461AAE8B1A2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <CAEth8oFetuGzP8BUMyFmLdSy1i4Y=d0onAaS9QGf_GZQM55n5A@mail.gmail.com>
In-Reply-To:
 <CAEth8oFetuGzP8BUMyFmLdSy1i4Y=d0onAaS9QGf_GZQM55n5A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN4P287MB4638:EE_
x-ms-office365-filtering-correlation-id: 6f7dbc79-6ad5-4cac-d16b-08dec78b25ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|38070700021|56012099006|4143699003;
x-microsoft-antispam-message-info:
 kp8ppHGsR6qB8g2/QNd04+8LfxlrK6OnJSYYDzhQeOq96VTVpw9i1HQUj1vbqFkJ9+z59mYkxWPQGym1TLlRz8IDN0pREdJzQhYf1KpusmyouLoycAyb+g6lloperwMRcoQDnwtQuiOrcPLem3aVsCFKc2h8Lk6ze7C7vj6CvvX4bnyJoX6yy8rvG/5eDcCCy0CVQkYXS77vDuHXj4rC4QBtGCXCOLoLSCRMJ5UUxnbJCxquSrZbKDaza98dCC8loDjyVemiefIRvGxOJqFIC3eKh8hfTHnnwGf/gls677jG14Mux972pPijkyxee2wZCSybDQ/aah7QsZgmVWAKo9UAKhQMHkjadbmzliGc6b4fOtmG3dBFFEj8ZKWoJbDkT3DNeqm2ATLcXRDLwMya99apqYndXmn1M+rgPzzcQnLiKK4kl341CL6M6Sbedwdqbxfo6qLobypQ+lcyVw4WfXBes9X4TDgh+ybtRcHjMVo35OSTjuM04ZpK3aHDRhBEpoeJlExQL3Zz7eEVNLtuUrMhFuDr2pGVEH10iCaRIG8bbHLb82gpGnnCTdV956ZO4yo9CmWbsF0dPVaNafYri6NzvdcXPMqSrTOY0KGg41g5/dJ1l6Bm9ULDVth+YTdjmntnL8GxLL1au1AoCHQPhRhm+cB3ra+eexVvaqflpeBoqhd03gGO3NxdOzMfQhGlaCflQjcprZAC1bbZTwTf3zgR+Jt/8NRs1+BPeTOHOBlbtXJ13XTkFnGgX9JuaOIG
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(38070700021)(56012099006)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3Ne5rjFaLNgaQne5mY3tEqF2Ajye8FQ4D6FuJ2yxIN2LGS0tzzt4XMbvdf?=
 =?iso-8859-1?Q?2g4wDuQ06Dz4FUNJZHURUjQQSNLLQI5FU1A7XDd4Qf4V3oI+PT1m83HFW6?=
 =?iso-8859-1?Q?bhriVe1H5sXFfxOY7NHMHrsoYU9kp99ltpUoVksM7sXCGC3Qt9yKv+n7D1?=
 =?iso-8859-1?Q?N3yOE1eSBSEmJJWYvNSBDgYOLSweRhIg+aG5yaYDrxMPdUcWeBPCSkkKCi?=
 =?iso-8859-1?Q?FBaMXmH1s9v/1Nblm4RCOYqsGN/cI1kDCtNimC5d1a0N14zGXzq1ELbKuN?=
 =?iso-8859-1?Q?812W2ee+P95IOC0nrS4+XTXL8XWLFAexhCS9eSHAb4vZNQeEjNGe1d4gUQ?=
 =?iso-8859-1?Q?AEbj4yqRp/645RilrD090oeyuf8stB2e7RHGTl3N1xSNfIchneMCOdsA1V?=
 =?iso-8859-1?Q?VCDGzu8akj++jiE8UFPANOiBYdh3M3RL27zc/sIFGQt1Hh1Cye/rlq1utZ?=
 =?iso-8859-1?Q?nQzCzocX4Ymp7mmkIHKCbsC0HdEaihCw968JwNXsJq+NQxsNJaungIgIww?=
 =?iso-8859-1?Q?45FetFURRAIhCSRqH48bgdFDhNC5IFv0vvP7RlXk+RiDsv7FV9ljWGUJFS?=
 =?iso-8859-1?Q?ikNNIPFifoxBXlebAJ4jbhaAwxgcpR0qdGKQUBJNM73dDlQ62N689k8Zeq?=
 =?iso-8859-1?Q?opfEDYj9K6F+SsDchrzZdT81frHgf4VQ2P6gzZBrSfGGNLmSuNfuS008t9?=
 =?iso-8859-1?Q?+lkurbHZZ68GZsGwsTYccsZzXw9yJLMGS3r8nlAy2sM/WmomAU3V+GGL/h?=
 =?iso-8859-1?Q?yv36XNEEWU/CkgIqimRLUa471gvAi1E13kD7JM7svpd0gB33iVLSBy/pQ4?=
 =?iso-8859-1?Q?Vm4V6rUKKJfyC3w9yx03m7eWwGvWPL/vqfYltf2IeB1FHwb90y3eD7/xcW?=
 =?iso-8859-1?Q?p4zuH3iFe3JMJkHlw0R5BKZ0VPeBeAginGrM3kN20R/KKD1IVw2AYUpfo7?=
 =?iso-8859-1?Q?B+CxYEDt/9IAB1+1IP4wDLagYwQzRg9aZpBbm45cwZm3FfWvKlQ9uKWRxX?=
 =?iso-8859-1?Q?DsKY1ds+ZfW0jRjPFS7IJeKnd2FavlG4IQj9TBPsHz79X7TBAadEjYQh7S?=
 =?iso-8859-1?Q?1sYA0oZ5Y9k5nVlLAwjMr5NQE8v37US5/BHfI+RebgDiNl3bVEN8cbLeLF?=
 =?iso-8859-1?Q?8RgLyNE8BYOoaKq2Bw1z3ArpRwUGlCpIqRW9D3DVYPZc67CPe+jp8A1Uzu?=
 =?iso-8859-1?Q?HaeLGl5SdJrx5+fmqNy7esy/V+edqkam1igMLCeIJe/BS3gO1mdhMJh1tr?=
 =?iso-8859-1?Q?n7eT641L/QSG/Z2ATqBXpfawEHEEeKAPXNBsiXIyxSer1QwSuVP5b7jMHR?=
 =?iso-8859-1?Q?QN4T7aEqhcexWq4nXCGTOeLlSF1X1hlJ+KVplEWuTxaeSTv6O2lLDLNDoh?=
 =?iso-8859-1?Q?+a6lVK78STzHuWlvNEhHLHWA19mcWzbma9yuEYKqGt5/HJrSVFfcEr8lgB?=
 =?iso-8859-1?Q?ng95csfsPs/Y6unia+/UepLjzaLyua3OdtsQB82VCK4lm3Pp/quJbkc4yb?=
 =?iso-8859-1?Q?KegQZBmADlXEuZFlL0+QjrJuDVTeUXVmbKwxUOPpxBMqai+3W8bhrM6+aS?=
 =?iso-8859-1?Q?ZRleZPphFbVWnnGEQySqsl0Lm6SVK9YL0/Khur2/EHDV+AiseZT1Dn18c4?=
 =?iso-8859-1?Q?KiaQVudvNeb/aGLCzfQF3NW8CKBMd5FzkntZmYk5Bv1fHxZlN6gt30GzQb?=
 =?iso-8859-1?Q?4pywKffuk38/YqiIZW/pJ/lHaBgZODPtRbS9EfoozIl+s7JjsEQs2L2tbL?=
 =?iso-8859-1?Q?RMVxEbFtLE9IkwWIu/mcD7Wcoo1mK0XyQVY7Vhxfc0DF7CMJRGqCS+68j9?=
 =?iso-8859-1?Q?vifbYkv2tA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7dbc79-6ad5-4cac-d16b-08dec78b25ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 07:29:18.1863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H6bdjwBsis7wvRYAp8aXSPtzDbLprPsGrGbDesGdlZiW9G57WNRrZ7YDcShw5CoCEEwzW9jpLLRXa2DnVjsWBGIdk8X+43Qy/K+EGxyxvg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4638
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64544-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hpa@redhat.com,m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:sakari.ailus@linux.intel.com,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.intel.com,intel.com,gmail.com,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC6F366F634

Hi Kate,=0A=
=0A=
> > > +static const char * const imx471_supply_name[] =3D {=0A=
> > > +       "avdd",=0A=
> > > +};=0A=
> >=0A=
> > Only avdd is defined as a regulator supply.=0A=
> >=0A=
> > According to the datasheet, are there any additional power rails=0A=
> > (e.g. dvdd or iovdd) required by the sensor?=0A=
> I only found avdd on X1 Carbon G14, my X9-14 and 15. I only have this=0A=
> one regulator to test and ensure it runs.=0A=
> According to the datasheet, I found "VNAN, VDIG, and VIF". Should I=0A=
> add them to the list?=0A=
=0A=
If I'm not mistaken, avdd corresponds to the sensor's analog supply (vnan),=
=0A=
So it may be better to name it vnan. =0A=
                                                                           =
=0A=
For the other supplies, I don't think we should add them without hardware=
=0A=
validation, as additional regulators can affect the power-up sequence.     =
=0A=
=0A=
Best Regards,=0A=
Tarang=

