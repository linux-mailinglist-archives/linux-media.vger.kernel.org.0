Return-Path: <linux-media+bounces-65499-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3pnJMBVuO2oJXwgAu9opvQ
	(envelope-from <linux-media+bounces-65499-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 07:41:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A776BB8ED
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 07:41:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=EoAaHOek;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65499-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65499-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C659630158AA
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 05:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A4E3242CA;
	Wed, 24 Jun 2026 05:41:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337CB30AACD
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 05:41:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782279693; cv=fail; b=bVTCYayhOUirLx7ScGAWlFUTWL+FS+vfgobMVGR7M7Fw6Yaitz3m+fqfV3Z+WPFipX/pq2c7z9MxyhXOtFhrSP+qkL1F2dHm/u2f5GEpn2r9IntUfdgjo3qCdqsOgp2At0zLGuYUIAK5uur1XBsDHwym7GNvaIse+/ke/Abbmsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782279693; c=relaxed/simple;
	bh=yJHnmYEHeVoNkjvBbAu0XQgFqxxjX+d8aGnPzxfoQyY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o2+pH4+c6ZzlncV2gdqccozDuhUa+ukrfLZezHhhfnfI2FptBH9o3bgSwuC/WKaujPG0w0u5pjHP1Rk8WwGlLgUnT1u3mgAo37RTYFk/QAj3tAEpxgUQJ9iV+BBpWuBLRo35JZjvo4kG/RLy7RzxwXaNjXXQMg8J5uzNKGZ13kA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EoAaHOek; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fnZLHxK0ok2sfwNjkqaSjWxIAtxmOFR3zxMVRiwdBGaiCpxL1994BUN1+pqyq/6OAKOwnLsJ7dkxEk38k6K+OEkguaeXSZ0U7JYxhtMpOl5rXeh9xIrl2gE9YBPpFrYU/bMq7+ZKE9aSI8Kxr3QghlBQldRtTpPvxDhBYosAcWWxouUPiw/u61XL+uBJ2SeLqC3eMq+JZMb60Mx0LvxhpuiAr7PwOvnzO0Dww8eCDTlws1rjaqUkKAvHY61Npf8Hd4FmVw+oGGnfW23F6FjEY3UasaJZFSoMaeKUlUBiv6oT4L9MR2uEFIrVPp8yaRWhrLgcQdbVcrsVnoSO0VpnsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuqvqeHHKV7kg4O9fjLprY4hyTMDbhfNqIeKpHDkVJc=;
 b=b55lkLGdpW3gUMjofX27ax3bpetlCDNu0lq8c/n75XZ6GCcbjWFo15wLqTLZr9PhQ3vCKacAAT7dgD082XUpFHb55DQh/ysc4eD9T8aR/nekIkTWs0qlSsXQIidIL8GdGQcD81KJwhTkakgxfjWoLhez8V0gEdVt/3cjCLuKDjsiGUezn9O/r3hAkZ9nZYcoh3bIPJsQFSV+GDktgxpDJfJWTuikFBa9pho+I4CsltpZfdtRNCnARYP3jMAEhwh7HL9r5eP98sUfSauXlN/+AOIKzjio0/lIVpP6t3i1dP+ukuzajB5Sp5XejYlmIp6j/FxraMBuPlfuatucUCURBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuqvqeHHKV7kg4O9fjLprY4hyTMDbhfNqIeKpHDkVJc=;
 b=EoAaHOek4XsRGP06CaTULPw9elzCdGV/p1tWm9PEiCFuHsH3TPMkBXmpNglrh5v3iDiM+Erl4BW8tp6jvPxsoimD9OF/TkPWpKv95O2sZe/vOo3iPWwxZLnnaiLS4L9b0TkQ2RLCZWCw9D1b50MRbvURP90GoEvswDfOQ23r1rW12vzbmwQoEbCgR/4VjODs7S90Y9HKrNWhFg9ERSmvLrQetv0L8q0SulChXpU8HFz392A4ra5lhjXQl3SR7oYHZfkMmLaU8mIj2J1dqH9hCFZObwVUMOq7slf7JT1Fho8mpC2NSR3sx6JdMiposCXzkRyMSrVKFQolBg8k2/3VGQ==
Received: from AS8PR04MB8563.eurprd04.prod.outlook.com (2603:10a6:20b:422::14)
 by AM9PR04MB8683.eurprd04.prod.outlook.com (2603:10a6:20b:43e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Wed, 24 Jun
 2026 05:41:29 +0000
Received: from AS8PR04MB8563.eurprd04.prod.outlook.com
 ([fe80::3f00:4490:e559:74a4]) by AS8PR04MB8563.eurprd04.prod.outlook.com
 ([fe80::3f00:4490:e559:74a4%4]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 05:41:29 +0000
From: Ming Qian <ming.qian@nxp.com>
To: Ginger <ginger.jzllee@gmail.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [EXT] [bug report] Potential atomicity bug in
 drivers/media/platform/amphion/vpu_core.c, within vpu_request_core()
Thread-Topic: [EXT] [bug report] Potential atomicity bug in
 drivers/media/platform/amphion/vpu_core.c, within vpu_request_core()
Thread-Index: AQHdAiiGO+zwVeQh3EyeOYqZESTN2rZNMhrw
Date: Wed, 24 Jun 2026 05:41:28 +0000
Message-ID:
 <AS8PR04MB8563EDFE2589BC4F925ED742E7ED2@AS8PR04MB8563.eurprd04.prod.outlook.com>
References:
 <CAGp+u1aMp8PL0_OScboJ_DrTLa826uwQSgO1JKNK7Zj2GpGDHA@mail.gmail.com>
In-Reply-To:
 <CAGp+u1aMp8PL0_OScboJ_DrTLa826uwQSgO1JKNK7Zj2GpGDHA@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8563:EE_|AM9PR04MB8683:EE_
x-ms-office365-filtering-correlation-id: e28d8956-24f6-46f9-a6f4-08ded1b33d56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|23010399003|22082099003|18002099003|38070700021|11063799006|56012099006;
x-microsoft-antispam-message-info:
 df+7Ey1cBalStGlzFUOVR8bDOGfJJcDAt9fe6jIYYTlo//quw4j+ZCJVhaCU+aZp3lN6a3+Fo7QhWeHbglOxOUixDPHGNktKrfdVL3RqzDkCwJbBEhlWCQHPT1I0ZgDy0nUC6cynzh1Y1tDdUFRPkd5SEzlBdMGPzafWmIOqJdSrpPFUhIBn2FE4AF8VTjMw5P8x/Ny5tDRYmgoM7R89v3hbT6y/5GJk/bmaZ0QmEe2WNOXIYXVY+c1QNyszM3scrrY02EpSRIIV5BGTRMjdb0cGZaGPUvwUuXLc09m6nLKz0wdFJI1TXT5pDjXxQNIG0gFlzOcDwUiNrJ4RqvcLBqlbihyTctvMHmzMvXZOgiVFU0VnvgwOy2c5SI9NhbjN6us+tCwf35SR32AOqd+dj//qj/xkh+RBWXmiN2gOUGXwF93H9HXh3/EgKzWJAYiMRlGBO9XvITuzgpmtpWoZIwfj7DKs4hJnD+WxRCLVw3B8FzBGovhLDqTzM9cvj5OAmjvL0Cy/Hqplkp7Ub/Al4rrFP8O+RiPHv5YVwct7Hx46qmtRlaUNqB3mlpBY7w9hxdsP76OzlXfOGRubdoj5UmEHACpBJ+Ko8z0Xj90UdkUwKp2Ye5HMHTRsIpr5pmZXSFIH0BYVOJNUdcgB+k2miMdWf/bHq5M0stfYEvcKsZdZWZmCN2jIHqFtrPAxqgCglK6au7cp04kx6tQCv/g3CQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8563.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(38070700021)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qD4jELqdEM7Lx8oupQdZHliiYM4dmgGmy4qo82Vcg+1TMwNBNneuj+iqpUSZ?=
 =?us-ascii?Q?rcvu5kA4Ugo90KT+1UoK80CEqHjxbpYtQJ38U8Qt3yKgPWgyaKY7RGxSEIIe?=
 =?us-ascii?Q?HsRk3Td4sP8q42ylUiY2tIqwkZKO/Yfuhwc8CmblGbA0RHSiM4nx4feT4P5v?=
 =?us-ascii?Q?PhH+SXWY0jr+psJKXcrAI/GHNr0htCi1dAImzSsPZaK63Wjulyu5sKWr9yDq?=
 =?us-ascii?Q?n6VZgS62hNKcR2hwRGZYdw1TmHknSim9UNv7MpVLDRiqV2/fj6D+kbHdluh7?=
 =?us-ascii?Q?3oOo36ejjCRaUyY0g3iCQPB3pZ4K0qwwuxrYkiMqWIQWDJCnJjytHJnL/SGK?=
 =?us-ascii?Q?1Z7Z3F++J94uEgISaFkyKnevH7uUnpXce6tYmujhxo/A0WzQBr0sUFfAKZhS?=
 =?us-ascii?Q?Frm7z0mJ6KRAJI/tCjvYlTk17jnK3W4GFLmpsbiuTbqNM7K76BuAnxqPFcMz?=
 =?us-ascii?Q?BHLaSEe3hr47gF7Q1RpxH7ssfy6MY5Ud3QhysMfbxY4iLMdcEz7tXfO/rDMx?=
 =?us-ascii?Q?K53Z5Byl8OsSl/tS2t4+G+OHaqxuc75TbIBKCEA+YnJq3rRY4Um7w+/wCUgK?=
 =?us-ascii?Q?vTm4/DzTmNwi306LbEM7LFov1On4y2pjHihVH4ZNkE/VlKDx4YI5TJf0r0bF?=
 =?us-ascii?Q?K4yBPyID5LZ1cfkRLRdFCMkXYWslEuAxlzqC1iersWLOC5WgiqXIzyL0SHEC?=
 =?us-ascii?Q?E7bqeEc/LOeraykut9WQvL1HT2U7cEdTq6uSosmuJ/EAUAEHaD24PN+Annjg?=
 =?us-ascii?Q?O8CqOS+tK5rQ/kBCMbUlyTMMhDQKedopAjCfXoqXxsSxwMGeJPL11FP3H3fo?=
 =?us-ascii?Q?1hGDhO32YabsylOEVcy+hKJN9iUdMI28yLu4lOfPiEqRBx9baC2ZgjVVSTMn?=
 =?us-ascii?Q?EOjRjAWEDx0o0QIR2IoRRRH0RABkUAU08BfRLDrrR5BPu/4CV8PJTae41rMm?=
 =?us-ascii?Q?FWz+0/v0IlE8swZMT90B2iwK+AaOBjlo5UG03HwcdfjchhZAEaGrXlv8ur3Z?=
 =?us-ascii?Q?yYCYnin8D0U/GPod1+kvv9zoDG3I0PpzKSghRBmi3PZIP8KIXCnQtRMmf08y?=
 =?us-ascii?Q?QRALnII0tJZX8ZLOlTV3Ok4VwpQWqqkkwSGBsVJ5NvI57pr3b6MN6WhEij/0?=
 =?us-ascii?Q?fm/L+gMQIwZz07zscjROS91cvOCl8S9FtFc9QZ1ws5FRy7+uqfucYkIMQTxE?=
 =?us-ascii?Q?6xnfe2xef7wQx6tEVwdKgIIG6mvRSr2G2i46oJGxQqNfMhavqmWpqNzLFzwU?=
 =?us-ascii?Q?udjJn5UoAAEwsISSM88oTpbTf3ExOg/LPqvv5WoPtzUxdShL1DVV295z49GP?=
 =?us-ascii?Q?sTNNH9sEl49BgTUsxHD7N/JhJQd5bnHYyciqkUn8OSbvWi07eObMX6JDlecX?=
 =?us-ascii?Q?EVEUBxJl5peWZypR4rQc/+OXS8blS0FEhNmtljR3cvVF8pVzN0EM3pxiuPg3?=
 =?us-ascii?Q?0/s3F5CJwB6Nud+9soc/r6RRcs5rOoDqODGx+ydvkm+Cy78/XejuJxk65wNd?=
 =?us-ascii?Q?IQVG9ESfnEuNYpHmMFYrnRsok6pIIFtRMV71DU/U4AoE8iG0/HGTHdyHG17h?=
 =?us-ascii?Q?Hlesl5GsEAFBbl6UHpIYdwpR6+ACRgX2BF0h0FGoIClbwopvCk11idvx7z+o?=
 =?us-ascii?Q?omoftwoIM3hOCbBmKlyOLqvXcxWvQMEgAtSK8+lpW8U7blVOb2gS168DUfxW?=
 =?us-ascii?Q?ODNJGQSFOmnX0HR3U/uK3OcxE3sJ2HffkXoupmetv8fOdBW1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8563.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e28d8956-24f6-46f9-a6f4-08ded1b33d56
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 05:41:29.1066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +V7HvAoeyewdjJD2d1n98nbDAzjbO7tULhJo10l+lPUAYHTQGO7saIG9n76Z2lxgAkpJqjwwUTEHTm4YG6FXBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8683
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65499-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[ming.qian@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:ginger.jzllee@gmail.com,m:linux-media@vger.kernel.org,m:gingerjzllee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,aka.ms:url,nxp.com:dkim,nxp.com:email,nxp.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,AS8PR04MB8563.eurprd04.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14A776BB8ED

Hi Ginger,

Thank you for the report and for taking the time to look into the amphion V=
PU driver.

You are correct that in `vpu_core_find_proper_by_type()` the `c->state` che=
cks that follow `vpu_core_update_state()` are performed without holding `co=
re->lock`.=20
Note that the state *write* inside `vpu_core_update_state()` is itself done=
 under `core->lock`; only the subsequent reads are lockless.=20
After reviewing the code, however, we consider this an intentional design c=
hoice and the race to be benign rather than a bug.

The state check in `vpu_core_find_proper_by_type()` is only a best-effort h=
euristic, used to avoid handing out a core that is already known to be hung=
.=20
This check cannot be made race-free by locking: a core may hang right after=
 it has been selected and the lock has been dropped,=20
so extending the lock scope would not close the window in any meaningful wa=
y.

More importantly, correctness does not depend on this lockless check:

- After a core is selected, `vpu_request_core()` re-checks the core state u=
nder `core->lock`.
- `vpu_inst_register()` again verifies `core->state =3D=3D VPU_CORE_ACTIVE`=
 under `core->lock` before actually registering the instance.

So if a stale state were observed and the core turned out to be unusable, t=
he instance registration or the subsequent decode would simply fail.=20
That is the same outcome as a core hanging at runtime, which is unavoidable=
 regardless of how the locking is arranged.

For these reasons we regard this as a benign, by-design data race rather th=
an a defect,=20
and we don't plan to change the current behavior.

Thanks again for the report.

Regards,
Ming

>-----Original Message-----
>From: Ginger <ginger.jzllee@gmail.com>
>Sent: Monday, June 22, 2026 5:21 PM
>To: Ming Qian <ming.qian@nxp.com>
>Cc: linux-media@vger.kernel.org
>Subject: [EXT] [bug report] Potential atomicity bug in
>drivers/media/platform/amphion/vpu_core.c, within vpu_request_core()
>
>[You don't often get email from ginger.jzllee@gmail.com. Learn why this is
>important at https://aka.ms/LearnAboutSenderIdentification ]
>
>Caution: This is an external email. Please take care when clicking links o=
r
>opening attachments. When in doubt, report the message using the 'Report
>this email' button
>
>
>Dear Linux kernel maintainers,
>
>My research-based static analyzer found a potential atomicity bug within t=
he
>'drivers/media/platform/amphion' subsystem, more specifically, in
>'drivers/media/platform/amphion/vpu_core.c', where vpu_request_core() call=
s
>vpu_core_find_proper_by_type(), which reads the vpu_core state without
>acquiring the core->lock.
>
>This potential issue is present as of git commit
>eb3f4b7426cfd2b79d65b7d37155480b32259a11 of the mainline kernel.
>
>T0:
>vpu_request_core
>    --> mutex_lock(&vpu->lock);
>    --> vpu_core_find_proper_by_type()
>          --> read and check c->state
>               /* The checks are lockless */
>T1: (for example)
>vpu_core_resume
>    --> mutex_lock(&core->lock);
>    --> vpu_core_update_state(core); // writes core->state
>    --> mutex_unlock(&core->lock);
>
>The potential issue here is that for other accesses to core->state, the
>corresponding
>core->lock is held for both reads/writes. However, in
>core->vpu_request_core(), this
>protection seems to be missing.
>
>Best regards,
>Ginger

