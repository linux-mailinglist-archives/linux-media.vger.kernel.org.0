Return-Path: <linux-media+bounces-58002-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Kq6FSgQz2lysgYAu9opvQ
	(envelope-from <linux-media+bounces-58002-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 02:56:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D661E38FBF5
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 02:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D87CE30ACB0E
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 00:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36D926B764;
	Fri,  3 Apr 2026 00:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="lEggFb/E"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020109.outbound.protection.outlook.com [52.101.156.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C644258CD0;
	Fri,  3 Apr 2026 00:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775177524; cv=fail; b=jwhWiuHHbynSr9w9pX0GYxa7H32b+cjPM5fsfi7sCrQk1yoh5RFYMlqiHN5A2FHM3Lb18q3HIDt/W+E+cQDedCnCB/e1/NMpXYYJbiktOK7oqfcK2L8AKPLJSwTr1jnk2o96HWMNfK422kcaGZ8bKMVRmQiGRXtu2Q8J60fHAR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775177524; c=relaxed/simple;
	bh=UMSploAiaWjOQeBl6pSk3tQtPaKEzGHr4RDjLxBfBLo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MrXPwcbpl+yoTj3Ogz0uiZLZaiD19Am0eriRPxWKMQnIbvfiz3HN6kPLPAryYmNJXgyKdNbbrVU9raqOX2sM/5/kKQiGCj/M+0QUHk7/wyWso+fwO5UUNhg2sgEArcnL+6+wg86MrQbuniJNcQ2V2QF6gLR7ftQNlxRyzps5r4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=lEggFb/E; arc=fail smtp.client-ip=52.101.156.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWXUtnJlK925w4Gf+QP0Nr910vC4Yp+Ar5KhZnx2kHAWvVFWJ3jKbEyvBE9SJdTWYw/rDS19+o4fwcQo3g9EQfXxEgKzzJGgAJOSiI4SwARi9e3+dyyvu/VsaAGqIWOS42iIO0NWNy/snsdo6b4NwNVTxzVNs+9y8DuJ5OcYfkYRYZd+AlSBgBjJt8NpA1y0BZeGVTtPPyDt738qYBLaE60kTJ90pomabgrvS5mpdKHEOcM3b//ySSc2vNJUmMhNWVRNi3S0kfEq5o9sbdXbVNuJtparnNi/WYkTNUDww0OkvHmB3Un41bvs61E8NsVskLypdPUKLsv1lcJMcmYu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVrr54aY292zWxlVbcvFG9Q1EaiC0DrIDseiBwaKnzg=;
 b=lrJrxKt6+VMAMc3zqXxR3NtYAAS9PhkOFrhgnP4dbA1vDnXtPM04y5lYRGufx8ewz2Qd2D5djw5Jdk7De5l1zSq5YOYCi3rHHwFNbA4gJmWntRMjJXDc0KDfTslaG6ok9QN1SHcmh3yGm8K3ysvXKi0gleQq+fjAsiC4Uj6xHQQ7XZ1Gmx9cAYpvadzOFYm7bhInYQHcyvhf9NG3NimaC4ZbuK/2avZ5VgSwOuQnoSMAiDnoruZRC5nVBN6U0QuqVhWWwi/JYga7PJmyyescCWn+dZFIKoYHeRpMuwOeFyV97dQFb+dgT7Vll5qCbMSmJM7tzrp9/uvu3NFA7jK1yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVrr54aY292zWxlVbcvFG9Q1EaiC0DrIDseiBwaKnzg=;
 b=lEggFb/EzWrxCFz3m/iiq5HxMXEbnCaH8l59ZaCEu1JSkiNBHjHdzm7tfF9HkeCMkQUItdFvljXTs6xvhhpW7Y6bBHCjPVpysG1QFeuXhUn2BwjT8iyehdiIHC6xd49CKTeBLTYxCuXZwNc5kvUqeeqMxRnYt/jvpoJa8J4i4K8=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE2P216MB3437.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fa::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.21; Fri, 3 Apr 2026 00:51:58 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%3]) with mapi id 15.20.9769.018; Fri, 3 Apr 2026
 00:51:58 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Brandon Brnich <b-brnich@ti.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "detheridge@ti.com" <detheridge@ti.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>
Subject: RE: [PATCH 1/2] media: chips-media: wave5: Release m2m_ctx after
 Instance Removed from List
Thread-Topic: [PATCH 1/2] media: chips-media: wave5: Release m2m_ctx after
 Instance Removed from List
Thread-Index: AQHcwtD5s9lXlmDqpkiQxaj1UP7rH7XMgmXg
Date: Fri, 3 Apr 2026 00:51:57 +0000
Message-ID:
 <SLXP216MB1148BB461F8AAFEE03D37BDCED5EA@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20260402184554.1751445-1-b-brnich@ti.com>
In-Reply-To: <20260402184554.1751445-1-b-brnich@ti.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|SE2P216MB3437:EE_
x-ms-office365-filtering-correlation-id: 06626bff-37a1-4dec-9839-08de911b3556
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 UridbBcR1fMWD6BGfzyqBK76MFhPEZ6pVqVujqsoyKf8nuSiEN5JAwxwZb0FqWP2ei+ysbRqvesfDMU9y+5OzSiGFBKUOxCVtnDC3u2grbDaDFnKtm8lt7KQFP50LMFgnOuqgzV/V/iU5xchAvm4Qm7KBwgk7FC9JjtPDbBE94EGKNtK2P+AqrqAPCYq6zPPhtV5YhWJQ4X8AFppwenjCMyGso0hvNMrLC/nuIiMGDSIDBPeeHdIpVPvUSmq1KO+Vh2cA/ivCOTWlS1nxo1OBkfAE4zmgZy47h/QCihrvNKQ6cGrNiwHmc5U9lYZEacjSjEJZWSA/yaIoufQjUnPzap5Kpc459QyTbarFTO/49bb+debaZy0pelXKRTArzxooQx4YpomRcbkMW2OLt2DhTljYn7aMFayW0cSNa5zjch2HNFnImzaWZgf5oh5+EF1UwGFzdiLGFods4H3lxQtAUZS7GosVhw6rXg1AD7/r2RSbe2dMcukGQ2jaClC3+lT6r+/93+qhGpck8fELfGB7w9p3a575429khvT5Nd2UiXKVT/dRby3P4zSA156La46OX2jaq7Zxv/hhohaw7s2V8BJN0bpjOUgEDWwUVFs+arQJx/Zy5WILUphou2A9osALr1Rt5+ETmgcKtxg97qPF+AE4q1ruYO7yiMv0O2BoUovKNQ9xyeUPSXoGMUNd01+TrvsCSWRrttRKpxx6vx4bybqbdlSlgdROmAWOccBEezOZqQ6TExqhIaAWHc26C7+SPyIVsE2EJuOAucpsVzSOfPBe9B27x/uY0kWmnrPeas=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fqwu06kYQn98t9NtoMKKNQ9mQC4RyFawhkAonmibZXmyfqllCILH2CgdgSai?=
 =?us-ascii?Q?A22OAUGkMw5Jjwo2Ie0BZqbea/sD+MJ93DDixPejspJLba3ou7WrNcMpvF0M?=
 =?us-ascii?Q?EyitT6AWaz7tKNlbEEmXpFKsC8+duhaNlt+ROEueASlmWvqtxARWtZmXQVPi?=
 =?us-ascii?Q?MFeDqQdBZlBu70IUhi9zibaGF0fX05sDJuVL0hYXFomXP0xdE/psMM6xulJ3?=
 =?us-ascii?Q?Ljz5MutI8BTs07nCDpNMf94j57xewh86Hee+OmlNuRuF5RY2K8eCxXNk5rvb?=
 =?us-ascii?Q?k1sKP42joMIv3T3BY28B+XwtGQxQAsdYjfZhuLuEFre0RrVYMEYytwbPCD3x?=
 =?us-ascii?Q?xfQ2htM/SX25lKKlhrhFeuGrk2sgRteZc8bvuB11DNM/oO2yYhnXV+u6JVTf?=
 =?us-ascii?Q?vpU86aKsmiE5d2gBirlykCXMh+FbZ0CSkHA7CAUo3UUMl5rCJEQrqeieXBGj?=
 =?us-ascii?Q?w9u8O5gBt0fXml+yystMMnjexJC51xArIoZ8YkzOix73cd1Cno90CsaS0LHL?=
 =?us-ascii?Q?mKr0DPSqDd4nYPa9vCwMnB1ruh9/Igr/wO7SzOPKheMLMZ9W7M7iIxTms59w?=
 =?us-ascii?Q?Piiv1bKGWkVV2rRHc0bkJlAVEYNaKZ5mMjwHFvZJ+3uyEon6LalF6k1pNqpn?=
 =?us-ascii?Q?CR/Ww7iggDMQTXL2nSy3tzTLsQ/BZKilU/jJrVhAJCTgu9FN3pI1sV+MK2Wt?=
 =?us-ascii?Q?fEZbBByATrA5Pdlxg0kWQyR2AO9Kw5E/NaS2fGCiaOFys4BzhTH28kjghCG0?=
 =?us-ascii?Q?lcZJB/IYHSy4mLh3L2H77AoeYMDAZZZ2wK/FUwSUic+0QwzYKdkpZFdJw3a7?=
 =?us-ascii?Q?XA/k0GWcnQgJW9V6QGyAhwo0duYUVLxeCAKEYJGoV4OWGUUJLmCB0ELMHyxd?=
 =?us-ascii?Q?ozuStjUYUG/UOd/HGJReD+AgXRysqpsG6Igvxb2+3Q5FC+vQA84XFCRTS39f?=
 =?us-ascii?Q?kpZ/WfMT/wh57HKBFdDmnKQR8nQsFYT8cD7nckB+BjYIVmDjJDsX+bhGwnfe?=
 =?us-ascii?Q?DnKqcKf6Y7DlsCV6qH6N7YZI36LuoGugC9GETbn9/8AyAnBNY1H5DaT8pN0w?=
 =?us-ascii?Q?0eHOtkWTWzTFV3ubtBA2WpIp6YNFd7RX+ko44Wejww3q9Zg480GG/H/Yco+d?=
 =?us-ascii?Q?m1EpmC0Xh4H9WWSL2p6X/7HYnMxAU9aIlC6jdr4lp/JJ1JAQSCvwLOCiIG0d?=
 =?us-ascii?Q?a7o85ELXD/AEqg5pyQSn0kVK7zRAtAvmN9PcgjDgGTDzJx0cTbXBTtp218LG?=
 =?us-ascii?Q?DJrgy2n5SWQL56PuUUNYmXRtk2SgNRllj11sb8sm8x5SKjsVsTcGLz+5Nnzo?=
 =?us-ascii?Q?PRz2I836S1Ml3ceGjOiQX1Mi07G9G3iMs8v0a4nQN+M3KqdKnfuznRN2HWh3?=
 =?us-ascii?Q?Vfkl/JVjRChhnGYWkPwd3lKyKatd4MTFoRdT0kH8KpEQU/0vqT0PiBsJHvDl?=
 =?us-ascii?Q?9SP4CzP5RrEhJa6xOmm3c7ZXtohnrtndTqmZ79zUgbc9ni3cOv13GPnig08f?=
 =?us-ascii?Q?gVg42NsR2LcyYA332uVYH0IXjwlKuRVlSwa4YzBEU16qhhAohdJyxZHsf7ZF?=
 =?us-ascii?Q?ULdu5u9XO9khc4cYaCNDOnZ3cjihdEEnIABBYS3Nt4r6Sbt0ILXToY1DMp6H?=
 =?us-ascii?Q?viSw5cY6Sl1+W9+KAT+BZBf2OuTnsqkSzHK6p75A+ryTf9FJT0xGfjHmgA9W?=
 =?us-ascii?Q?ADxajCoorTYJhUY/rJEYlBBg/+vyQz2btujCg912zIc8+bvTBeg1sJNJDQ3K?=
 =?us-ascii?Q?JqrsqWbU0A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 06626bff-37a1-4dec-9839-08de911b3556
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 00:51:57.8029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QQ8no4Y5/E+9HM0ZZXDV7sdpHwZKVvY/mhlyrcVSPgiJm+d/NRPugZuk3CNIGg86fZEe4TRnUrmVSGSsNBJxUhoVEZFUp5oUJROXM0oi53s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB3437
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58002-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:email,collabora.com:email,SLXP216MB1148.KORP216.PROD.OUTLOOK.COM:mid,chipsnmedia.com:dkim,chipsnmedia.com:email]
X-Rspamd-Queue-Id: D661E38FBF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Brandon


> -----Original Message-----
> From: Brandon Brnich <b-brnich@ti.com>
> Sent: Friday, April 3, 2026 3:46 AM
> To: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: detheridge@ti.com; mchehab@kernel.org; Nas Chung
> <nas.chung@chipsnmedia.com>; jackson.lee <jackson.lee@chipsnmedia.com>;
> nicolas.dufresne@collabora.com; Brandon Brnich <b-brnich@ti.com>
> Subject: [PATCH 1/2] media: chips-media: wave5: Release m2m_ctx after
> Instance Removed from List
>=20
> Possible use after free if IRQ thread manages to obtain spinlock between
> m2m_ctx release and wave5_release function removing stream instance from
> list of active instances. The IRQ thread looks for the m2m_ctx which is
> freed so null pointer dereference occurs.
>=20
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>

Tested-by: Jackson Lee <jackson.lee@chipsnmedia.com>

Thanks
Jackson


> ---
>  drivers/media/platform/chips-media/wave5/wave5-helper.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c
> b/drivers/media/platform/chips-media/wave5/wave5-helper.c
> index 53a0ac068c2e..c3d34be833ff 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
> @@ -68,7 +68,6 @@ int wave5_vpu_release_device(struct file *filp,
>  	int ret =3D 0;
>  	unsigned long flags;
>=20
> -	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
>  	/*
>  	 * To prevent Null reference exception, the existing irq handler
> were
>  	 * separated to two modules.
> @@ -89,6 +88,9 @@ int wave5_vpu_release_device(struct file *filp,
>  	list_del_init(&inst->list);
>  	spin_unlock_irqrestore(&inst->dev->irq_spinlock, flags);
>  	mutex_unlock(&inst->dev->irq_lock);
> +
> +	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
> +
>  	if (inst->state !=3D VPU_INST_STATE_NONE) {
>  		u32 fail_res;
>=20
> --
> 2.43.0


