Return-Path: <linux-media+bounces-57608-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBfnL9Vjymn27gUAu9opvQ
	(envelope-from <linux-media+bounces-57608-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:51:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 265FC35A957
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB7BD3095327
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295AC3C9EC8;
	Mon, 30 Mar 2026 11:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Sffdroil"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF1C3C8702;
	Mon, 30 Mar 2026 11:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870917; cv=fail; b=H1LnRQgw552cgQ/zrLnQ+LE3aJREerMQLFyXtribvLv0e//1jTA346irQklVLdYZi6Hrxda9N1TMDCic9ngqX6E5lrEMm4zmxNysT4FRaWPLEpYvmJhDrdkzYRLbIj0Bx31oP7dtMWo+A4O7j/+gzQk3AUyrLFYItV6hizv6Ylo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870917; c=relaxed/simple;
	bh=6h80Z/609Fsols/QNYhVSLuNiOPJ4u2s+mOUHXtiYWk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lNWBPN4Cwd4vBdDrQhJ1Xqc882FD9UpCLOq+O4FnNpZw8sc+RKNXpB4AH48St2qppdEypecxkraUJCGdVzcI5j3RJKe7l3TA6WYQBxMCDd9AJiu+m07e2AWrhY+2V+zB9P9+rQdohG9WkaBeIinb8QEdKd0yc7cZgxr9hrrfqkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Sffdroil; arc=fail smtp.client-ip=52.101.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=inL4EP2XQSBMx4h3VFRcLIWXlu7AFHb+iYsXUjUSvil/RDLE736cNHmRpRjzPJvnaGeHkJWnBTk7CmGyDe75maIqxSq5IMVjuIthnZOZu3X4GPf1D70jce5Gk6oITmYbGlouGDu8PFgpF+2v0sZWt4mI4uLp04megbN6Ppxxqhq92CjJ+DP1Z0ffrKOoaNdXOHBYO2ppPW+oFaETsS1Ffw3pOEEhlAFw4lub8x0wRcS8wb/xUa1oGQ07pahwcBVWiLlh8W/9SD64q9TV3fzM7NChG/QJWJ/mJqQ4F6mU4Vb9nUTyTo8UCHb9OQBCq74ZrzadcmvtaqoLQpwm+5mrZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqwcHfpEzVjP2UnUvU4FWupSKcCXlQqmD9QSB5JIFM4=;
 b=AEn0lkYzBkiUDUJ3FwrlDMnAUmtggEADzPw/0Du6rsQr6ggfbjanMbz1WwFiZUtyCccSt5GYRwtWSVx6a6KEwKEDgrzuC0El81CzsSGTEiYOiGzrtwrdfbpIRGuM/CBOB2r1mYfZIiL10c0mQ+Hftd54rl25mUkTBShRvbOnSJqL+llgJxdXfSSKsCt/+cweu06x2a4RfA3oua+kvlInaMvuqbuP9bDS6WWJ1V6/AZbc1wHeT0tbSxRUN5HjPgq1ReGNR0V2o2oEoRhtcHHmqHiD/rpCWd1rUc1Kpl4smoqBPkLt1/c69yS+FoVDHbyWlAj8vuqsgvSYUmQ6n42qNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqwcHfpEzVjP2UnUvU4FWupSKcCXlQqmD9QSB5JIFM4=;
 b=SffdroilQnLxpcSnGLD+vl2lboOATw0XsZU0Ag5NvEjcjvksnZ2AomNxtq/DpHBI7/1gEEit2qg/ZQ97gKiIGVPIyQbog0Gj8ikkpzxbeZr3g8Er6anW6DjWrIXnHtLme502pcC48oLms7V8t22XhVBEDWStTcIPBSvZFjm/sCA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB13714.jpnprd01.prod.outlook.com (2603:1096:405:189::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 11:41:52 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 11:41:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, jacopo.mondi
	<jacopo.mondi@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	dan.scally <dan.scally@ideasonboard.com>, =?iso-8859-2?Q?Barnab=E1s_P=F5cze?=
	<pobrn@protonmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Jacopo Mondi
	<jacopo.mondi+renesas@ideasonboard.com>
Subject: RE: [PATCH 03/14] media: rzg2l-cru: Modernize spin_lock usage with
 cleanup.h
Thread-Topic: [PATCH 03/14] media: rzg2l-cru: Modernize spin_lock usage with
 cleanup.h
Thread-Index: AQHcvgyorvEQ4lXCOk6ddIkBXAgNYrXG8BIAgAAHlOA=
Date: Mon, 30 Mar 2026 11:41:52 +0000
Message-ID:
 <TY3PR01MB1134607F4DCD0CC01345D8C368652A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
 <20260327-b4-cru-rework-v1-3-3b7d0430f538@ideasonboard.com>
 <acpamLH3xqP72ffE@tom-desktop>
In-Reply-To: <acpamLH3xqP72ffE@tom-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB13714:EE_
x-ms-office365-filtering-correlation-id: 9c13990f-1f36-4c3d-0159-08de8e515629
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 2dofIK16GxojAzGvZZG1A7Fi2d+dEn29Gy10M86wH9W/hqxQvQEyOISsTiLM7QTcuUreg9jW52pyMFzlb78oJ00n1r7X14B2EVnbzFhUuTBPbqjCr/fJMmVntiFyv8JjYJRzxnaU6oPRQE1msKWI2zydgsRvOzgGtwBtopb49fQRFzRcRm4hy/FF7VDZvUXoOf/1zNUKRHXf3fUlKzPQFFUdslq69VIb6lC4YJSTyYvvTbnrsGmRd1w9tdyE2MCVIOunwYCYMmkTlCOPGS29iqUxS41bkjMh+yqt1M0E5VyqVvpYaS07jQ+j4m7mTFH+KZO9JNkUzprI4vgRd3cq4cJPhV5nUjBcCIvhWoS54AGlJHylD8PN5HR0bh5KXHhk9ql7kdgLLiyWBX5TYHr2ouWAjLPUeiwcadUeI6729UJkjEXz0OjqseBUmNBQtqHDgogojgRAi7WqWDJaAdW8+zqVQTUOLP5WLE6nxrnia3gRle6byCGYs3f7w9u59ikfn1OfZkYBL1RtXFHznMME44HnO2tcCoYdj8aCXObp/XnpPU+hfvK4uphAtYadC3DxBBM1I2lgYWtq+7hU6M8hGlnvpE0sDRW/oSUU9I7IAAlSBFkk3+hufdK9mZqC1k/QnuSAvex3TkPlM6KhabPO6Tv4yzFzTV2KRQjtgxmuGLzHq4OMiJ/uPEZCgKKo5TNfOtFawM1spss4Klo6InZHIAQ8lcrERNEO2Dq6Mdq+s2KsbyEeT+IM9RBMVBxLmehUeLAqKZldwwHlOzzk7/qlIZG2f6XY/a5d9QeG6inoYFI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?suTqcd5MkTU4QQYwmOLzuydZhnfhqx610c4eVC09rDlu2n2WAJIra85sWl?=
 =?iso-8859-2?Q?TAYuzDO9h4o+Yb50hqavCGmwkfp5u72lEqvm6/sOQeMxj1cQDrhkSXsIGc?=
 =?iso-8859-2?Q?ecwHuedoousK7CTZ0AiYhQow5kvSTH8trCzIxR9EEX7XIkgoAWjdA42f5h?=
 =?iso-8859-2?Q?BadKSzI+QatimEc5WBKPM/f4MggUP3UI1kykKecyDGvE/MxvF2wX6m8j2j?=
 =?iso-8859-2?Q?3EAf1IqLYmN2AGeDKLCS4AFahGFp2VGTSPK1RF9K5UzjpYw6Z9ehx6zQzu?=
 =?iso-8859-2?Q?zE5GurtkaXlM4VWIre9qDkfciHLNIpUrf5/Qi/0KTO74L/oo4Kj45hJIdi?=
 =?iso-8859-2?Q?wFDrGJ+JdBA+NufwBkCOyarnQ9VxO/amapxZIReaiLAGemv4TC5MBh/4iv?=
 =?iso-8859-2?Q?GaAVjQ+0Xu3Lx+5vBU/PgOXPYhJOQUc0HuxW0W521+82KDoiKUZAMu93NJ?=
 =?iso-8859-2?Q?jTJbicoQgMV74eXGq/rsk5+vSRI5FClxsL9OZxO64Bp5PcYqOiGzfA/yav?=
 =?iso-8859-2?Q?6Izgg8kjT8Uw1RXCOXXZFPVkBMnuMeuoQFBgllP2GNiFqqirDrTDbXFSCt?=
 =?iso-8859-2?Q?vBq/x+MjERRjChylFisdiGSzRTrQjINpHgpvgIdONdkF3xVZYDpkIiUEPJ?=
 =?iso-8859-2?Q?oyNFIy91DngYGU9pD6OhKnjd+ufY6vEOfFM1v1GtQ1Oz42xAY65y7YH8lD?=
 =?iso-8859-2?Q?ux9CmDqxwk1Y2VNDIguhu9tVUEjQLswcbD6ravaEyyI/V4dmVjhPNOwnzK?=
 =?iso-8859-2?Q?XLTStBp1nnwOtDF6LJL4woQxKLF1SeFW8zYdCq6iJntFnIsBYJJVhbhStI?=
 =?iso-8859-2?Q?eRMuaiv1t7VpOh4WFgHmgFUDUNBuoCs5Pjm4R4zA9T1ro5jbACPmU3IHkm?=
 =?iso-8859-2?Q?0WCxWGvI+m3z9i+q71g7c2YqI4aBiiLhRN+kGTEDaqvNfVTtcwRK13uGMj?=
 =?iso-8859-2?Q?wgPi1FIfVp6WJ0gBoL8Afwhtivme/82ejCC93EuzlhqtCc4VBuY8OxN0aN?=
 =?iso-8859-2?Q?P5PHiy65QRu8wKgUOHQtDso5uAeqb4lQM7TX3elIrhuxZ5VjwPHPu8dyrx?=
 =?iso-8859-2?Q?6dsMqZAheelaaH2nZ3OBMRXEHUfAQJH9aFC/WENSOVMgDGLg2ZQ/jFO7t+?=
 =?iso-8859-2?Q?Hw/H+FosX03gnMlXQP2+do7JOf27xlsdj5JI4RrXW1CnY04e+jPjrnAemr?=
 =?iso-8859-2?Q?4fA81gZxuMZeTrZMqvLSt9Du2FfIXswyEbVUhjKfGDgo8F43kffn8YRNqX?=
 =?iso-8859-2?Q?JTKoBs9+EYAm0WOdXICGKfZaebkQyXSFPqOTCs/EvfF15aeVqkdTNWpeas?=
 =?iso-8859-2?Q?3Z+N3XFRC5p8ssjoAFgcMUXgW3WSmf9lXOFnDBkJZ1lkPWjWNmUXrJhEFz?=
 =?iso-8859-2?Q?0K8W+Vov6VyXN4ySk/WFf9we7JBt/7fQi8X7T+SUbkmmTdBNdtj5X5TdXO?=
 =?iso-8859-2?Q?zZiD/2i+0ctrU0pG/1I85xLmsFvSGjPEnB3E7Gdr8TGXEFdfJYgh1ShOg7?=
 =?iso-8859-2?Q?BcSazYkk/eW8UALqcMy2TVP0CKoEMp+k0wEx/G+foU/FM9tN3JwA/lJ6gT?=
 =?iso-8859-2?Q?J8wuCaX9wsj+nTbR0+J0AQjq7OHga6kbU/ClEgelj7/cCPnJa5oY19wd1m?=
 =?iso-8859-2?Q?RY6xU4M1JKIc/Zs/E2ZIbvoqQdl4cPtw70j75L8qo1ArmOgsTrDH5Dr8/T?=
 =?iso-8859-2?Q?kfKjmpm39RiaqZJHH8hkgopxoHAazlteOok7hwQM8hgnGF3b4nzi6QfQpm?=
 =?iso-8859-2?Q?meb3LtPQE2qbTaODTwfoRTGHk4Cv7Fmo1T1jBmtZof3rCRFTDCy4nFgALs?=
 =?iso-8859-2?Q?cCh8JO61Gw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c13990f-1f36-4c3d-0159-08de8e515629
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 11:41:52.1793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fdvKtiGEPhlJi3DEFRP7A31t6s5Y2fsDq/zRb+ivHQp2pLdAe91P34evCV9QiiyxRi5UI9LOGVcWRg6fBualHl4hm3zLMQBlqZTJNRmSL/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13714
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57608-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,linux.intel.com,protonmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,protonmail.com:email,intel.com:email]
X-Rspamd-Queue-Id: 265FC35A957
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 30 March 2026 12:12
> To: jacopo.mondi <jacopo.mondi@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>; Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com>; Biju Das <biju.das.jz@bp.ren=
esas.com>; Hans Verkuil
> <hverkuil+cisco@kernel.org>; Sakari Ailus <sakari.ailus@linux.intel.com>;=
 dan.scally
> <dan.scally@ideasonboard.com>; Barnab=E1s P=F5cze <pobrn@protonmail.com>;=
 Prabhakar Mahadev Lad
> <prabhakar.mahadev-lad.rj@bp.renesas.com>; linux-media@vger.kernel.org; l=
inux-kernel@vger.kernel.org;
> Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> Subject: Re: [PATCH 03/14] media: rzg2l-cru: Modernize spin_lock usage wi=
th cleanup.h
>=20
> Hi Jacopo,
> Thanks for your patch.
>=20
> On Fri, Mar 27, 2026 at 06:10:08PM +0100, Jacopo Mondi wrote:
> > From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> >
> > Use more modern constructs from cleanup.h to express the locking
> > sequences in the rzg2l driver.
>=20
>=20
> Looks good to me.
>=20
> Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>=20
> Kind Regards,
> Tommaso
>=20
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > ---
> >  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 32
> > +++++++---------------
> >  1 file changed, 10 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index 98b6afbc708d..2d7ac9f37291 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -11,6 +11,7 @@
> >   * Copyright (C) 2008 Magnus Damm
> >   */
> >
> > +#include <linux/cleanup.h>


Not sure, asper comment from [1]

The spinlock guards should come from spinlock.h

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=
=3Dirq/drivers&id=3D9fd2170d70178faa0427adaa9d2dfdbfa231d1b7

Cheers,
Biju

> >  #include <linux/clk.h>
> >  #include <linux/delay.h>
> >  #include <linux/pm_runtime.h>
> > @@ -110,10 +111,10 @@ static void return_unused_buffers(struct rzg2l_cr=
u_dev *cru,
> >  				  enum vb2_buffer_state state)
> >  {
> >  	struct rzg2l_cru_buffer *buf, *node;
> > -	unsigned long flags;
> >  	unsigned int i;
> >
> > -	spin_lock_irqsave(&cru->qlock, flags);
> > +	guard(spinlock_irqsave)(&cru->qlock);
> > +
> >  	for (i =3D 0; i < cru->num_buf; i++) {
> >  		if (cru->queue_buf[i]) {
> >  			vb2_buffer_done(&cru->queue_buf[i]->vb2_buf,
> > @@ -126,7 +127,6 @@ static void return_unused_buffers(struct rzg2l_cru_=
dev *cru,
> >  		vb2_buffer_done(&buf->vb.vb2_buf, state);
> >  		list_del(&buf->list);
> >  	}
> > -	spin_unlock_irqrestore(&cru->qlock, flags);
> >  }
> >
> >  static int rzg2l_cru_queue_setup(struct vb2_queue *vq, unsigned int
> > *nbuffers, @@ -165,13 +165,9 @@ static void
> > rzg2l_cru_buffer_queue(struct vb2_buffer *vb)  {
> >  	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> >  	struct rzg2l_cru_dev *cru =3D vb2_get_drv_priv(vb->vb2_queue);
> > -	unsigned long flags;
> > -
> > -	spin_lock_irqsave(&cru->qlock, flags);
> >
> > +	guard(spinlock_irqsave)(&cru->qlock);
> >  	list_add_tail(to_buf_list(vbuf), &cru->buf_list);
> > -
> > -	spin_unlock_irqrestore(&cru->qlock, flags);
> >  }
> >
> >  static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru, @@
> > -465,7 +461,6 @@ void rzg2l_cru_disable_interrupts(struct
> > rzg2l_cru_dev *cru)  int rzg2l_cru_start_image_processing(struct
> > rzg2l_cru_dev *cru)  {
> >  	struct v4l2_mbus_framefmt *fmt =3D rzg2l_cru_ip_get_src_fmt(cru);
> > -	unsigned long flags;
> >  	u8 csi_vc;
> >  	int ret;
> >
> > @@ -475,7 +470,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_c=
ru_dev *cru)
> >  	csi_vc =3D ret;
> >  	cru->svc_channel =3D csi_vc;
> >
> > -	spin_lock_irqsave(&cru->qlock, flags);
> > +	guard(spinlock_irqsave)(&cru->qlock);
> >
> >  	/* Select a video input */
> >  	rzg2l_cru_write(cru, CRUnCTRL, CRUnCTRL_VINSEL(0)); @@ -492,7 +487,6
> > @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
> >  	/* Initialize image convert */
> >  	ret =3D rzg2l_cru_initialize_image_conv(cru, fmt, csi_vc);
> >  	if (ret) {
> > -		spin_unlock_irqrestore(&cru->qlock, flags);
> >  		return ret;
> >  	}
> >
> > @@ -502,8 +496,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_c=
ru_dev *cru)
> >  	/* Enable image processing reception */
> >  	rzg2l_cru_write(cru, ICnEN, ICnEN_ICEN);
> >
> > -	spin_unlock_irqrestore(&cru->qlock, flags);
> > -
> >  	return 0;
> >  }
> >
> > @@ -573,16 +565,15 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
> > {
> >  	struct rzg2l_cru_dev *cru =3D data;
> >  	unsigned int handled =3D 0;
> > -	unsigned long flags;
> >  	u32 irq_status;
> >  	u32 amnmbs;
> >  	int slot;
> >
> > -	spin_lock_irqsave(&cru->qlock, flags);
> > +	guard(spinlock_irqsave)(&cru->qlock);
> >
> >  	irq_status =3D rzg2l_cru_read(cru, CRUnINTS);
> >  	if (!irq_status)
> > -		goto done;
> > +		return IRQ_RETVAL(handled);
> >
> >  	handled =3D 1;
> >
> > @@ -591,14 +582,14 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
> >  	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
> >  	if (cru->state =3D=3D RZG2L_CRU_DMA_STOPPED) {
> >  		dev_dbg(cru->dev, "IRQ while state stopped\n");
> > -		goto done;
> > +		return IRQ_RETVAL(handled);
> >  	}
> >
> >  	/* Increase stop retries if capture status is 'RZG2L_CRU_DMA_STOPPING=
' */
> >  	if (cru->state =3D=3D RZG2L_CRU_DMA_STOPPING) {
> >  		if (irq_status & CRUnINTS_SFS)
> >  			dev_dbg(cru->dev, "IRQ while state stopping\n");
> > -		goto done;
> > +		return IRQ_RETVAL(handled);
> >  	}
> >
> >  	/* Prepare for capture and update state */ @@ -621,7 +612,7 @@
> > irqreturn_t rzg2l_cru_irq(int irq, void *data)
> >  	if (cru->state =3D=3D RZG2L_CRU_DMA_STARTING) {
> >  		if (slot !=3D 0) {
> >  			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
> > -			goto done;
> > +			return IRQ_RETVAL(handled);
> >  		}
> >
> >  		dev_dbg(cru->dev, "Capture start synced!\n"); @@ -646,9 +637,6 @@
> > irqreturn_t rzg2l_cru_irq(int irq, void *data)
> >  	/* Prepare for next frame */
> >  	rzg2l_cru_fill_hw_slot(cru, slot);
> >
> > -done:
> > -	spin_unlock_irqrestore(&cru->qlock, flags);
> > -
> >  	return IRQ_RETVAL(handled);
> >  }
> >
> >
> > --
> > 2.53.0
> >

