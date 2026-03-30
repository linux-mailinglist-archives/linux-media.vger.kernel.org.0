Return-Path: <linux-media+bounces-57575-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BjXC7g/ymn46wUAu9opvQ
	(envelope-from <linux-media+bounces-57575-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:17:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E5E357FEA
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB50E30263D1
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7EC3B27C9;
	Mon, 30 Mar 2026 09:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="TsXFvw/N"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020136.outbound.protection.outlook.com [52.101.225.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3B52D2397;
	Mon, 30 Mar 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861883; cv=fail; b=Moy+2AkEk2b8NUhagyG6Lfv1ebqt4klpEzikO1sd/B7dZ2UHpys2FLmRMjsICSTMgWnvD0UjR6F9xWlfwn/7XURnbViUjwdVAKV2e6WdRD3VxGPusFH2pYSFsRQCVuH791lfkqLIZgCjNctwCaZkQ82c6cpWuxuXyunhDbhnefM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861883; c=relaxed/simple;
	bh=D4fYpQI4XT5olp2o0dKrDa6KEdZkrDl5oOTkcmWLN/U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZC+O1yVvXSAPfmh0hcRi9jX6LFsXzyF2Y3YqoxHrmHqGqIlbmsBeRfU6fEB0rxg8eMJze0mAGlp1GEQzy2x9gvYteA/0fiy641GHYRiMqRDP/n/rWsCDbOLJdz7GC1bHPr6p9Of/VXVGI1HuYnf+nvOfcFqzfTJExncJplCxbHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=TsXFvw/N; arc=fail smtp.client-ip=52.101.225.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TlhJshbH1xP53bXZokVTYhkd0UdGiRY+fFcMU9vhZnzQyezAlOAsKhEji/JabvVxZVryErT0FR6b8EBZZjOS+vfWKEaULVAg1tF7xLR4xMUYrQs1aplPuWN8wuu1OGqFiMlW20kHmDU8qj8JyLULZwGeYp8HApSx3UMJvq+W/Y1fdccyaKMyYOZL4T2hmi/N6bkqWYDL/dTmL92WZodteN89tsZEGGtNm9BUvCXeYYNRDhXCy+TzKk0uxlewNOiJg0WfschQZImUgj4ABkIHI6IiRjHfA/ocpLmpTq37QStcCRl4aZYD+ndKWfPMfrIFiFAMPwWu55iFNafJx6p8BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4fYpQI4XT5olp2o0dKrDa6KEdZkrDl5oOTkcmWLN/U=;
 b=xdaJ6GbQR0LfICXwSQj4eR3DZRrych5lkksLrguLPw92b5nSXCbWmVBt5J5i905ZkpItc+s+CMydvmmDrD7vvt+mQjuyCHU3UsYHyh2jaHlPK5LTYsAFClQiFi9fX2tK+6zquluAz0btmGiRZJSO1yXjjHXgzrFZ0fJWbxs26y/02wEvPMboUFARc34oLvao1mvjeTmMF9k5u/v1q9kVVO6EgpYDRtmyyORdYqabPEY3DCoKgYFP1wa7mNcsEIJA4BCseuK9K9F9bDdx335C+AzEjeE+sVZayXo0z7qVJvv/M39RPHlLPy0xkoeL98r39FQH6UwrVC/dh+LMEZGmHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4fYpQI4XT5olp2o0dKrDa6KEdZkrDl5oOTkcmWLN/U=;
 b=TsXFvw/NzMqYKfKVUM2gtU/+EFXbDggeoDRF9fIVUu6kIF8qinS5Cy2Ror6rrN/YrNKnb3X70exo867pcX4d4FW6ssFAUFtEXROvNc0S8UxNad0wORY+NkI/Lmua+FnCRtgvm7H7+KxkaC4HM12lvdB41phMdTovu/FnNAThuv6/ZKk09D8RsmIV2q3snK4QUxsUyk9qDHaWbeM2BAbfuh0PQ3TGJjM9Y/VLAgRwwRuD7JF+JaG2kEWTGraCxZGz0SGfUyu/K3r8PfMJlAv3p4yxc7+eiauXjHRkCVlMeTf7IEUI5Xc/OO+vt9CLFq+Z5mUwrDWrqgrUn0NYLkVfTg==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by MA5P287MB4466.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 09:11:06 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 09:11:05 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Michael Riesch <michael.riesch@collabora.com>, Tarang Raval
	<tarang.raval@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: imx415: Drop redundant runtime PM callbacks
Thread-Topic: [PATCH] media: i2c: imx415: Drop redundant runtime PM callbacks
Thread-Index:
 AQHcu4wwgYrEHvr7v0CWd5igCCg/DrW+FZyAgAEY/ACAAHfEgIAD1ZZNgACBdoCAAtSQMA==
Date: Mon, 30 Mar 2026 09:11:05 +0000
Message-ID:
 <MA0P287MB217839C14C2173DE856A78928852A@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260324124524.135278-1-elgin.perumbilly@siliconsignals.io>
 <1378ed13-6744-422a-b0b8-02621117238f@collabora.com>
 <acPU3H9pYEwzuuOS@kekkonen.localdomain>
 <3875be43-63b9-4e49-a0d8-175dd9268788@collabora.com>
 <MA0P287MB21780F5BC2F8113A10B6F0718854A@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
 <acfdV6sRfP9HGIxV@kekkonen.localdomain>
In-Reply-To: <acfdV6sRfP9HGIxV@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|MA5P287MB4466:EE_
x-ms-office365-filtering-correlation-id: ca05a7ac-fb2e-493b-c830-08de8e3c4617
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 rzSpKUOoMJ4YcYfcVqFClvAex/sadu331DxcCyXNsRYKAgasVtNDcu61OvthAnZUxvPqyKYG6IHcKBkNNPzm6FrZsPGGi85Lqo47wAq7f9cPkA7X12KClMbo5uJqiHRJxCG8RG+r2vDs783mnDy5RmYsPgBVswbDyYQtB8Wumf2UjQsxJ8YorZ21SZyM3HSWU5zhybJ9kQbpbArFnfoueO1256msYoui+4KaWnRh6L7yAiHeC4ciekXszFucDCU+kvMkh3nDRSU1g8WKmi8+DmTuc6emaWFocnNS9bTlDefJBUzLdDtkUNMSwjeY8ZqCNd1YfnUaCvie8ijDV8jGj+tayFnWJNREYEngrES4TWEB8HTjephuV3vdJUOVCRVJrRG6V9Noir7c45KEHl0djzOtFiIrbgJwn/uUGcNfLiHnsewb2hUkqLBrOOcFAhVpttzinIvFIeJaYt+qGkbWlFc7DD5RnGjKejY7wW3ua2oWrVU9igQhNUUi0WLhVdHzC/AJG5PtRb+nKpL/dupJmic8/tk2yltiBO/EOLf7jV2zb4YxGVu0HfCx+nYxbrE3h3qwGLRW2T5jVrzS8pKix6rJCCslaPmCyukx5065rAUlnM4WcNtrHePJoCOwgvglaw/BGiYDoxCbXNpLIdBTUKZ3d6gG4oBdvWEv+6yajCU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?T/SV97yoF12NsSrKEFgVlpTWeSp6JQsCBtJpyao9U+nP1pxmP8/THPcD?=
 =?Windows-1252?Q?Qa2djBRUa74Xlu4qG4aVzPkJ8Kkz8oTXQdoAEbCd7Dre+fE5TbDeY3w8?=
 =?Windows-1252?Q?rHo8XWqEPl0TcgrlkdKLC0vS9lRT/g7rr9sTdJzgeSvibfnBRBy2yLNI?=
 =?Windows-1252?Q?i12hJYADVzsY9UDfBKgH5K3gKTCcteIxX9PCNKQLDcye5+/CBULn1dXz?=
 =?Windows-1252?Q?J56GpkAZKOxkfV1twKU5h3nEtUaFEKBC2efffdvVg2l5yw9arzQHTnjr?=
 =?Windows-1252?Q?LC4K/zG74UJbYexzWYiYkr1ub4cAm3QBZTWanrbY+wx2Tl2wMaRMV4d+?=
 =?Windows-1252?Q?zstRJyq8u4xM8XxKXTdlgjoueWvH5Pq/a0ta+97NMtL/PWujYUSIZP3a?=
 =?Windows-1252?Q?Zd8MoiXcr22n4EC4Mp/RTC00DIxqzh2QH5xuYHFB143bbyMFGwdeoo5X?=
 =?Windows-1252?Q?zB94ruS39Scz0lxA5/ANPZMrHq6o386qOhhIaU34St8yiJ8wLmWjO46J?=
 =?Windows-1252?Q?5DAnM1DZSo5Z27m4sGN7JcKMgOD+PzsX8gCHBeRkIEWoN8vtlkJmB9l0?=
 =?Windows-1252?Q?Cmd/lA7enTC04lUvKQ6TLICkrW8WetkhOlYMa/to7ytMj/t6dVFRvXX0?=
 =?Windows-1252?Q?6JYGfeC4EPbaW/KpWvoFvgPr8bmQhUq81WIj7J8kCu68PuCsQ2YBEd1n?=
 =?Windows-1252?Q?401KVIUmros9ff07ZrCrhO275kPdHjguY2HTxMS4cAEaqMf/IbCKFiHp?=
 =?Windows-1252?Q?fqb7HYxibA9EZzdnCXMP2STxXHhhmvtk67T2rwxu0hqjrfkCzBdV65+e?=
 =?Windows-1252?Q?9LgTthp3ON8bBc4JFedieEdHUwPo0MZ0sxkL8fcMZdFGEnQnOQ1o4C8d?=
 =?Windows-1252?Q?8V9p/W8hPgoOn84wtwf6oYaoECh4f6LG/yxOBvc7K1STGaS5Zo8FmWds?=
 =?Windows-1252?Q?nrzAzBnvuVhflt6uQx0w4FD7El/EVvBKZCtRkiRgPHmzqyMydX7kXu4F?=
 =?Windows-1252?Q?DhpxMBXXZ/JZbJczgg9l62TdAReACLjpXVM5vmuUGuIxLD4kKy1Wj7HE?=
 =?Windows-1252?Q?tWcW8q907qVlNGVx0twXzFlC1urjV8+MUJXRrIajV/Pzkulm98woaDmt?=
 =?Windows-1252?Q?cVI8kDuErWLN5V9v4+2NDJ/TwedJDUjULKN8Mykl4be+1n3hhvKgjuzM?=
 =?Windows-1252?Q?7yXTZtFmuJUBZqeWJ/B9evsUFp1BNrqSZiIkaJdBeN71tyhsT36loDsZ?=
 =?Windows-1252?Q?HFEczUEIigop5LvyPatScdrPUlNjfKPJe6mLcS6pXH0kCau7aD2OErmB?=
 =?Windows-1252?Q?Ykx9Ji9zxey1PjMkN229LkfgUH5P3/UF5mknyULiL9I5Cm0ZMVRYyYTv?=
 =?Windows-1252?Q?hjITeSj9i/zNjIOkuWM6llvSryjraJY/o7VDP3SzOMhTvgeIzG3lb5m6?=
 =?Windows-1252?Q?ORuoFMO6hYqAr5F/bmkGuat2AFBm07B4+8+Q5jvzHCylsNHUp68CiXfP?=
 =?Windows-1252?Q?yGaJ3+2cLlBNZxnz+6gtvUXuJoF7p5FNlMczKymiGC8HNAYQpc0F5RgO?=
 =?Windows-1252?Q?DqeH/QEAA2sDVAbvndaMS6LkQRO4F2hvHp+WwIZc6qZ37T2OvLiC3Vg+?=
 =?Windows-1252?Q?NRSREjMCWPVbsHnNsVpZPavyOOsTDpRRFL0pM0r8EzNUYEAY7AjJvOEb?=
 =?Windows-1252?Q?AfyNv8UexnJ0+9B4CEIo74jfT7p9kJTcIpg1iTSMGL/7oOUkF6SO8qZj?=
 =?Windows-1252?Q?6cKAeDzMSRIkzFTCGAjpxIzoeyYSzpySoV2DYWPKkp/Ud3I+CI4hR0uy?=
 =?Windows-1252?Q?yT3rN+Htv5CUuscDpoatgbGNEu5s08LplTHLR+E5K9Nsjmh2+/Ok0KPA?=
 =?Windows-1252?Q?Y1hV1PYteJ2wv6k9pht/upoE7MKoY8tJHRA=3D?=
Content-Type: text/plain; charset="Windows-1252"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ca05a7ac-fb2e-493b-c830-08de8e3c4617
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 09:11:05.7914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yKpT4qKPd+L3ET+Mk+auYW/AHKquNYl6oWPPupKuJ34hCm31PAuU8pWkWA7r9B5pM7hLQOJb8MJkg7NVEvhiVuwJ3MINz51X0mei+0FmZLj/rHpt+AvzFmzUXOGwT7ee
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4466
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57575-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,MA0P287MB2178.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: 95E5E357FEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,=0A=
=0A=
> Hi Elgin,=0A=
>=0A=
> On Sat, Mar 28, 2026 at 06:11:43AM +0000, Elgin Perumbilly wrote:=0A=
> >Hi Michael, Sakari,=0A=
> >Sorry for the late reply, and thanks for the feedback.=0A=
> >=0A=
> >>Hi Elgin, Sakari,=0A=
> >>=0A=
> >>On 3/25/26 13:28, Sakari Ailus wrote:=0A=
> >>> Hi Michael,=0A=
> >>>=0A=
> >>> On Tue, Mar 24, 2026 at 08:42:31PM +0100, Michael Riesch wrote:=0A=
> >>>> Hi Elgin,=0A=
> >>>>=0A=
> >>>> Thanks for the patch but...=0A=
> >>>>=0A=
> >>>> On 3/24/26 13:45, Elgin Perumbilly wrote:=0A=
> >>>>> Replace runtime_suspend/resume wrappers by using power helpers=0A=
> >>>>> directly with DEFINE_RUNTIME_DEV_PM_OPS().=0A=
> >>>>=0A=
> >>>> ...why? What advantage does this refactoring bring?=0A=
> >>>=0A=
> >>> It looks like patch removes two redundant functions, doesn't it? :-)=
=0A=
> >>=0A=
> >>Well yes. 10 lines saved. Not sure whether this was the biggest issue=
=0A=
> >>with this driver -- surely it was not a big issue for me.=0A=
> >>=0A=
> >>Elgin, I was wondering whether this change is within a certain context=
=0A=
> >>or whether there is something I fail to recognize.=0A=
> >>=0A=
> >>Anyway, if you absolutely want this change: I feel it would be nicer if=
=0A=
> >>you left the imx415_runtime_{resume,suspend} and moved the bit of code=
=0A=
> >>from imx415_power_{on,off} to them. Reasons for that may be mostly=0A=
> >>aesthetical -- I claim better readability that way.=0A=
> >=0A=
> >The intent of this change is to remove redundant runtime PM=0A=
> >wrappers and simplify the code, without altering behavior.=0A=
> >=0A=
> >If you=92re okay with this approach, we can proceed as is. If you=0A=
> >feel it=92s not necessary at this point, that=92s fine as well.=0A=
>=0A=
> Can you address Michael's comments?=0A=
>=0A=
> Code tends to be copied to other drivers so cleaning up existing drivers =
is=0A=
> worthwhile.=0A=
=0A=
As far as I understand, would it make sense to follow an approach=0A=
similar to t4ka3.c?=0A=
=0A=
i.e. keep runtime_suspend() / runtime_resume() and move the power=0A=
on/off logic there. This would address Michael=92s readability concern=0A=
while still achieving the cleanup.=0A=
=0A=
Regards,=0A=
Elgin=0A=

