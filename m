Return-Path: <linux-media+bounces-56692-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFNrMBwZwWn5QQQAu9opvQ
	(envelope-from <linux-media+bounces-56692-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:42:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3722F062B
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:42:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A74BA3010912
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42F9386C30;
	Mon, 23 Mar 2026 10:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="mCDiza0Q"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013077.outbound.protection.outlook.com [52.103.46.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E312D9ECB
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 10:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.46.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262308; cv=fail; b=boEjORn5qrDpzcqkbftRmk3EfBPexoTk2zMTJHaV5Gi0hAPRvfK6I59JAuE2O9FY4kW91yE0txK5I8hBX34B9eOVUWlf99dSK7n3yRnwSP3T71w/NVNI0NWtHOWuJOB1XR3G6DBaOLPk6oZPm2O3AAHuJaDwXqR9J6uTBP8LeHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262308; c=relaxed/simple;
	bh=FtB/tgvZ3zgeO3sbq6xI9X0KaXfgWJQmdRFfGKlxsq4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KhB3LBPF8PsjdXFbH/lGzIClGQtF+7lYaZLrEu+287DWxr0CBd7A2RbsP8l7+NMQYm//2GTmPZGck1NTwM7mdUy4pUgWItxj3dbAeP9H+wh6dl6Q64zxVogrIjuIv+H73QhXd+2diUaweAz6NDcfvXjiC9Kz1BDu8a7EpiaXF4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=mCDiza0Q; arc=fail smtp.client-ip=52.103.46.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dN9CuMtiCppaGuOEWByiVe+yNZhzWsps+NOsaq/GTVe7cqGL1SA9ZGSLTiS9j9KzbGLIljNr413g0oVHAxceXJWsPRDEoarz0lnpa5yRzunneg+CtQQ4YQ2ALPWiwAHt1ndvEOuOgDVXoNMGUg6PJstt/4Sb5ZzzSSksN+EJAi4GAxnt3ALy7bUZh0ks44IVRf0EMOBjrkqGg41+rYhkjazy68fTkSzJs/5lfO6fRYp/JQOGrVaT+NkUa23QAVQcRJdWnQUywvIP2tbNCcXBuamNz1RTVet7+iGQ5PzjdcFNWUVdMCtYY6Rve8owlgMbJl+WSxq08E/XybLn99NNeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9h/nZMNkHY+NoHg6hhA+uTcfC60awV2Q+vypSK4oYSA=;
 b=mnsbOk9af2Q/5UKBMi5tdb9QcWQwoFYkoIGlzStPAnHGysEcbvSvT/FHMbn7K+etRI7FowMAd7iXXELZ+RTE/w0t/NKc4oeRK/J02RYHyYX9lMuWDObod9VwCrlDsN3xrVBzMqjRvtGMENyerdw5G4h6O3YCmeXoNsprjpeK6z7W67bBZQAAwRZNOVPgrPQrV3nyckWrr44qAL0quuawkPeNLiTr/7oqhDOyitrb5ewPPAPdwoqVsB/ZpaiU7OF8q9w8OeG/VCSRXE6tzIzzp6m3e+R7aN7S9WMPH2ArRjmsqX2UvzPPOWP3uETSAoohh/X//VZNBL6iiY/l6ZRmDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9h/nZMNkHY+NoHg6hhA+uTcfC60awV2Q+vypSK4oYSA=;
 b=mCDiza0Qm7kbTeyzR0ghltiUUPPkbpWl74m7/OBg2j9q2Oue2IuPPHf7+NH44uF1TM0EVlBEbW3s9PVdJny4PYj56w/B9LTlUxFYZms+F3yI+sKTEdguC5XtG57TbpMGnr00rx8FWTiiLEuZF2Iin7gzsKg3OGDcxxNroxF+a/9RiwBWjZWOwfWFDR6R1MRK3VzZdJjzqSrUz1YtyNQqIdMe/XtDENxj/Zf/cmVxQEK3UbuU585FQPzisIr1yonymUfOBwmBfSFP2dLBZIvU1zDEQsAK9+6oQNW1IL4sBVfr16S3qS0oD9Bd6w/jVnm0Tqzfs+Zj9nrj68AYL92FbQ==
Received: from AMBP190MB2678.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:736::6)
 by GV1P190MB1948.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:57::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 10:38:23 +0000
Received: from AMBP190MB2678.EURP190.PROD.OUTLOOK.COM
 ([fe80::a7fe:adaa:34d:6e13]) by AMBP190MB2678.EURP190.PROD.OUTLOOK.COM
 ([fe80::a7fe:adaa:34d:6e13%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 10:38:23 +0000
From: Michael Anthony <manthony.nw@outlook.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>
Subject: Re: REGRESSION: ipu3-imgu: commit
 a66191c590b3b58eaff05d2277971f854772bd5b breaks camera functionality on
 Surface Go 2
Thread-Topic: REGRESSION: ipu3-imgu: commit
 a66191c590b3b58eaff05d2277971f854772bd5b breaks camera functionality on
 Surface Go 2
Thread-Index: AQHcuhF0MJVrBbItn0emvC0ds+vfd7W74lQAgAAHpEc=
Date: Mon, 23 Mar 2026 10:38:22 +0000
Message-ID:
 <AMBP190MB2678DA83087A5C045C0A9FF1ED4BA@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
References:
 <AMBP190MB2678E7DC048409068260DCE8ED4AA@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
 <177425975200.3376561.11999798013858190771@ping.linuxembedded.co.uk>
In-Reply-To:
 <177425975200.3376561.11999798013858190771@ping.linuxembedded.co.uk>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBP190MB2678:EE_|GV1P190MB1948:EE_
x-ms-office365-filtering-correlation-id: ee1b7c7a-7ea9-42a2-7e97-08de88c84ecc
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|15030799006|15080799012|8062599012|8060799015|25031999004|37011999003|461199028|51005399006|19110799012|10035399007|4302099013|3412199025|440099028|102099032|1602099012|40105399003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?N+V8qFSjpZVeUqrGXd66t3SKtyQsFSq8XWS5x83tUfwAIwK6KT8O4VhT16?=
 =?iso-8859-1?Q?/GW8IMS5jJn8Qx1XOfr2MnLiltvolSgX4DrRihKT/X992o7XnfCCL4HKpF?=
 =?iso-8859-1?Q?hYEH35HKKw/p3f50oA5vbelWhS3XOiDO5wP5K3H2hFRv/NlaWP1FtYsH9u?=
 =?iso-8859-1?Q?Ui/3X51HpizqHnwrIdwBC5+CmHJ1bvEYTpc4B1tI2S95R8aqIm5hYPiZxT?=
 =?iso-8859-1?Q?aNaluNUEDjJ8bE9p0N1p3iKIdmIC9wnvR5GE5pnC3jCOOWv/p2+Xy3/nT/?=
 =?iso-8859-1?Q?IrQUCz1Fy+LQA/k3Cmhh9pJrBkWFeQBNIVsGxH5EdS8iYyEHpGYoTEkx2X?=
 =?iso-8859-1?Q?6d+pRMtSJMIJqZvoAdVkkusm6Vd5Pz9bxSi746aEZpO4ztIiBcWxc6SJKh?=
 =?iso-8859-1?Q?XhzNWxYHGXpouneO3L9rJkCxpzWHqAt7wHc4V57Cmcqqj1Sk2zK5ss85Ey?=
 =?iso-8859-1?Q?c4s7GjNE9C1Y38A49lFhCgOfa+upiDfMHvir/JbS0Zx8b2oCduy/vrbrqS?=
 =?iso-8859-1?Q?sboIQ8cQLAPmxNN99+WU29SAKE2QsHawOI0jNGp0uvkDu7uaSBnEFTsNKU?=
 =?iso-8859-1?Q?BDnMmnvNY4PvhOZZ5+YynqJUsoSTFMgJ+MfZxYR8TiKmVAA+aPdxhOuEbI?=
 =?iso-8859-1?Q?l78K45WJ/wNxfkukiC1XWfvBWQwynwKQBfJtYVKRmvrXJs0IdPvmVoSYZb?=
 =?iso-8859-1?Q?Xgb4MROb1Yv4peGwZz6B4zSJiHO1xeXhsOflzrtvSy//EYenN2fBHH3812?=
 =?iso-8859-1?Q?cyI3JTUfMWkaE+LcTRKz5XWs6D2LtO2771tSrFmDTz4bRT3QFpwbwHlWOv?=
 =?iso-8859-1?Q?of7bQWZANSXVEcbqzAInj7qyO2ect8DvvvZmgvFOawtrG7AGEasXL/Jix3?=
 =?iso-8859-1?Q?2lwGSBMITUiSk1SzNBVERfo9khfse65VVbv4z1+hxE/038FuO8ndKHEzhH?=
 =?iso-8859-1?Q?amIKq5j8jgDIckaMfajaTG82CMqhICwmigKEHKD3U+scyswKMLxLXxp4kU?=
 =?iso-8859-1?Q?y/18t4VeU1wY2aweGBxhaaCPkJ0kWDP9Bbin/yT5zYAW7NofDxDu7DyIWp?=
 =?iso-8859-1?Q?8Cz2fbHR2esgomJRH8x5lFN6094oF0x+2wUfNp3TBmiYR629cQWh95qd3N?=
 =?iso-8859-1?Q?7JUhB/e3WlHsCQXhkvxXZe08ez2GHv7LGGHq4QFpaRmONnjzhe6J+u7x7v?=
 =?iso-8859-1?Q?56J7k7LV/Bs+Eg=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yEBnPcS9zltrBvMN+kbOvUwJJ0q4g6eKewV0tCppE94zGZ0mNUH9QI2x9j?=
 =?iso-8859-1?Q?zX6vM+OPqs4lpFA+Zfj0xd5T3NfCsYSUVbtNoWhIFmzgBX9ltVQYs+raMS?=
 =?iso-8859-1?Q?Xr9Uy5gCg+Oc9Ap2AZLMD+Fv5ty12nxtaHZmNu8oME3Tx1p7fz30VrfY3V?=
 =?iso-8859-1?Q?h6llv1Z0AQu+wplhbA+qTNX7eHTCTs+Y/rJYC0IxwbHO6OABGIsiSTaq6m?=
 =?iso-8859-1?Q?TZZxXB4rfunVOIp7mrWpwIMCeVI5OmZ2RsWDghS/9n2PhecHA4bXeD6tVv?=
 =?iso-8859-1?Q?wkUVZyqfU/rxq81b6vFUkIQvSdrCK0NeFjpG4wv6wOgFPDdkPmJQGKU40y?=
 =?iso-8859-1?Q?vRo9lJTnok9KPWK7GemtCy51jXTzdENJ92E5jik61JRpvc76mbsiZ+WjWe?=
 =?iso-8859-1?Q?jaSMaRsJpT3QEBk5704S3oUqG67etLmJkEQgsS8oIopuf3pTIxj8nV61aE?=
 =?iso-8859-1?Q?AqZQAcSrdv0nI/vj8q2CM3HYWqoMEbpOBkIMQzPfFAfQgJfjnI91/mOdAM?=
 =?iso-8859-1?Q?lUKphyLelicALpP9v0x8We0gsgS8lycC84FFRY5LyqGiaiZpP/hpBshYe4?=
 =?iso-8859-1?Q?dWdEKkLW0s6RxQUAlGjeH28CrNf07F7JxqQBy9tLNPzYmrLr7vxTdXYJbo?=
 =?iso-8859-1?Q?HHgliipbLdWfHv18mRadTTorQdfZ52Tpin82M1nGdcesDnEdFTo12qnPS8?=
 =?iso-8859-1?Q?S/dmaO9oMZUF+2+Acf+b2xyIzUeloX64ML3RIqPYJtclZ9dcG+ODvMZ0fH?=
 =?iso-8859-1?Q?iOxzeykH1EZCgN+tjS73H6ECVtP4e1UgT7sB3mC7/vc3Nz5V796vWb4tLK?=
 =?iso-8859-1?Q?FHN9l9aQ7Si9CwoPZ3+HODe7F/WWTgvFW4fhKlyldQc8TvRoVum2JNM+dD?=
 =?iso-8859-1?Q?CeOJCX9CYHZLI9Ybu2G3rpSDkjW4HWg5BqKoMbQ2+uDQdhaKrJQHgzugVD?=
 =?iso-8859-1?Q?F67So6fk/tfxl2NBZQcdXt4UwqZ7pSJ4EOBVY3q74hh+/kuB2O/yuhRXqE?=
 =?iso-8859-1?Q?nyBJpaMJDXf2NHKTVP8Khhxu02oBXIWmzYlMAbRX1UFkjPosVY+PZZYSJj?=
 =?iso-8859-1?Q?TD3jioA/gVr36bryYJ4KiBLKnVj+tt4t0FlRsdQ9zSwKVN5tAeP6XHJU9Q?=
 =?iso-8859-1?Q?tK5oSD8Y4Jq79LWYPrPK3AIr4yYoE7MiuPVi1+f3L5ZgHl7Syi5apI2g9s?=
 =?iso-8859-1?Q?QEsqBQoBtZJUyAl7YgWKOAI6+nXhRQBx3GbcwGgh+/PUPyrJhaHYoGrwnW?=
 =?iso-8859-1?Q?MSxdiDIPbQzve+sF5mcwLXb+Ml/PVCuOz5ex8s2k5+C5JPZvLgHmE1Za+3?=
 =?iso-8859-1?Q?LKKCUE5pNT0qPMnXkR7+5enkTJODoV2GDaVygxJk6x+ue2k82epNT6r1Ir?=
 =?iso-8859-1?Q?erIgyqUluAsF/WDblxF0lcK6CIHmdc6AgFEsw5rOu4GfOv3rsoMhSGZ9/6?=
 =?iso-8859-1?Q?GRpi9lVzbVBbJr1Ygq6OEBKol1s283Qhq2WXcjiE+MuOZr38PhWdqc8MrL?=
 =?iso-8859-1?Q?dva8DMlN/cvpUz6r2IeM2Y?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBP190MB2678.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ee1b7c7a-7ea9-42a2-7e97-08de88c84ecc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 10:38:22.9794
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P190MB1948
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56692-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,xs4all.nl];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manthony.nw@outlook.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[outlook.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:dkim,outlook.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: BD3722F062B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kieran

Sorry about that.  The commit that I suspect caused this regression is:-

5d505becf75a9696937815ab147e1f2d81165ad8

media: ipu3-imgu: Drop struct imgu_device v4l2_file_ops field

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=
=3Dv6.19.9&id=3D5d505becf75a9696937815ab147e1f2d81165ad8

I am new to this so am not absolutely sure that this is the culprit, but it=
 seems to be the only relevant change between 6.18 (working) and 6.19 (not =
working).

NB: I'm not sure if this is relevant but on kernel 6.17 both front and back=
 cameras produced an image after booting, but on kernel 6.18 only the front=
 camera produced an image and the back camera just showed a green screen un=
til I entered systemctl --user restart pipewire in a terminal.  After this =
the camera produced a image.  After upgrading to kernel 6.19 in fedora, nei=
ther camera is detected.

If you need any more information, please let me know.

Michael



________________________________________
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Sent: Monday, March 23, 2026 09:55
To: linux-media@vger.kernel.org <linux-media@vger.kernel.org>; Michael Anth=
ony <manthony.nw@outlook.com>
Cc: sakari.ailus@linux.intel.com <sakari.ailus@linux.intel.com>; mchehab@ke=
rnel.org <mchehab@kernel.org>; hverkuil-cisco@xs4all.nl <hverkuil-cisco@xs4=
all.nl>
Subject: Re: REGRESSION: ipu3-imgu: commit a66191c590b3b58eaff05d2277971f85=
4772bd5b breaks camera functionality on Surface Go 2


Hi Michael,



Quoting Michael Anthony (2026-03-22 15:40:37)

> Hello,

>

> I am reporting a regression in the IPU3-IMGU driver introduced in the 6.1=
9 kernel cycle.

>

> Regression Description:

> Following the upgrade from kernel 6.18 to 6.19 on Fedora Linux, the IPU3 =
camera on my [Device Model, e.g., Surface Go 2] has stopped functioning. Wh=
ile the modules (ipu3_cio2, ipu3_imgu) load, user-space tools like libcamer=
a can no longer initialize the device.

>

> Suspected Commit:

> "media: ipu3-imgu: Drop struct imgu_device v4l2_file_ops field"

> Commit: a66191c590b3b58eaff05d2277971f854772bd5b

> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/?id=3Da66191c590b3b58eaff05d2277971f854772bd5b

>



I tried following this link - but it's apparently not the commit you

expect. Can you identify which commit you actually bisected to please?



--

Kieran





> Impact:

> This change seems to have removed a field that libcamera or the V4L2 sub-=
device internal routing relies upon for this specific hardware. Reverting t=
o the 6.18 kernel restores full functionality.

>

> System Information:

>

> Distribution: Fedora 43

>

> Kernel version: 6.19.x (Broken) / 6.18.x (Working)

>

> I can provide dmesg logs if required. Please let me know if you need a fu=
ll media-ctl topology output from the working vs. non-working kernels.

>

> Best regards,

>

> Michael Anthony

>


