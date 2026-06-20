Return-Path: <linux-media+bounces-65302-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PK2vBj4SNmpX7QYAu9opvQ
	(envelope-from <linux-media+bounces-65302-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 06:08:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E0D6A84E4
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 06:08:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b="GLT/GYqq";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65302-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65302-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E657300D37C
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 04:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED7A23393D;
	Sat, 20 Jun 2026 04:08:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021102.outbound.protection.outlook.com [40.107.57.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDA142050;
	Sat, 20 Jun 2026 04:08:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781928501; cv=fail; b=VVaEwzCWB+spiW6LTq3UZJcaEHBjEA1ySGtjyl/Guc98WaKG6ye+y23F1uGnajR4ekWmpueMnZD4a9kKCanEIk+HdxHiSx+GEyUAme3xQ4Axuo4PevZt9uBRPm5gos75fS41Y1gJza5/8lYWbSafGtSBaHvqCFKeh5nVK42COVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781928501; c=relaxed/simple;
	bh=zpFKygeKlVKGyRYVZOoMciGAyvTh3HKguX4V07lqNd0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rRfPhiuqhutJRN+tFl76hSES6nV8T/Ct/nhusSXBMzDd8ZCuc7UoNhVhapoGmzcc5McMDobjq+li+d8zPNyJ5AMc147bxl+moykEDEIQb1Uq+ETSHzr2rXCMyMu45ghDl1zI3BXeGIOq2WGHXYVDEiZ3tzSGVpQB02rQQpkQiUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=GLT/GYqq reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.102
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WibXMQKvDwxGGWkgjkILPHF6m21OgjQdUY2JRs+juZo8SqiJiE7JXfzU2cuv7TKOBcObEgWFt2nz0TaMz89E6pLjaAjX1fjVGbwHN6V599XSMtKXt4oCeJvJYkbD2eZH6+SIE0z+KCuMtt+dT/C+Mbu0SXQBvq8Y8nxznM1OIsUKEkQrlvIM1ABXxznxB6c7KCfFhjH1EyZG6bcSoFriZqAL7HfUoqxmBq1cuypjAOwL6oV+AAKpG3tnqsyAYz059nm2AzqYUnIDb0KnC7PO39Wu1jG6AGYucpptId1FGteZe1xEoJhG2lGh928sd7Mm6vdo5GxBROhErTZjPr/ZmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpFKygeKlVKGyRYVZOoMciGAyvTh3HKguX4V07lqNd0=;
 b=nXtAOACYTIsU9yDqm8qMAfMsTaqVVqyYqlPLJJHjYoahxDHqfz1FZgQUjiQ26Qa2NwjehMs6CEgf+Fb+/cs4B16+soUt8x3/ZCsWdUtFb5QnFLy5dx+63CZ6pOOhI4hhyCAAlgJP5G4wWVVQa5FahVgPthMx1YkqQNz3DlU7TPoF6uAQakcelmZ/fDRe0vtIhf0DHbdeSBdNdmzw7jQT5iqYAi57VKbt7U2/GBIhC2e7e46lUHI+2RJa5iicZgg3iETlPe/HEtRwhD+tq0jUzCkIlTkBCk0g24F36/tLLkEsz/AMxCjVgT/OvW+Ji+Sk7hHxFcMV9Cfrb577glFrcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpFKygeKlVKGyRYVZOoMciGAyvTh3HKguX4V07lqNd0=;
 b=GLT/GYqqviYIL67vmDImk6GzaJEIa6XTz3/8XJDAOXHLImC/IhQ7n6K5G8wFQOLO8DIi4w+bQXWgQrWQ/qbu+/MS9lGJFloAtrsiUsuxEvVcrCFroEo14qTH9fzGiWCZuZWXQtXfU+o2ca6Ua+zFRxxrf49utAVQy4mkLxsRBi9PvDertyDmXuREwFAKS+JvZvEl5/FfrZdWtfl2jQfeTmCd/AK72/8q2PeI8spm6ajkrjlLqQ60aCsOJ4RBpvlP7Iw/m2H9sKV1FNkYomByK0Yzbi6xS2I/aQ1RP33I3onipqz3kSLn9PYeA5wxBZ9GbkuHVPdqh4mb+R1ZwHucDA==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN0P287MB1444.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:183::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Sat, 20 Jun
 2026 04:08:15 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%6]) with mapi id 15.21.0139.018; Sat, 20 Jun 2026
 04:08:15 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
CC: Tarang Raval <tarang.raval@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait
	<mehdi.djait@linux.intel.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, Hardevsinh Palaniya
	<hardevsinh.palaniya@siliconsignals.io>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] media: i2c: os02g10: implement crop handling with
 set_selection
Thread-Topic: [PATCH v3 3/3] media: i2c: os02g10: implement crop handling with
 set_selection
Thread-Index: AQHc08x/lu7PSsqrQUacwrxnrX9oirZEiNqAgAAVGICAAAlSAIAChdmX
Date: Sat, 20 Jun 2026 04:08:15 +0000
Message-ID:
 <MA0P287MB2178623ABA2F59869EE5538888E12@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <20260424092554.26130-4-elgin.perumbilly@siliconsignals.io>
 <ajPay8NJ233yuCLJ@kekkonen.localdomain>
 <20260618130253.GF3345533@killaraus.ideasonboard.com>
 <ajP0TtXuQhx40pbU@kekkonen.localdomain>
In-Reply-To: <ajP0TtXuQhx40pbU@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|PN0P287MB1444:EE_
x-ms-office365-filtering-correlation-id: 847409ef-5f58-4b05-4c91-08dece818d7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|22082099003|18002099003|38070700021|56012099006|4143699003|3023799007;
x-microsoft-antispam-message-info:
 JDaLrAR+9QxhgLiKkWAw/QmV+JoxWeNi/63dT2c2r5OF7QBBUCOwtL1b3yunX80w8eQyJfpzu2t7K9V/HEeHuaHIauh+MxnEDyVshJ9fnt1n4grsYtreQhDKIOQRNFnviUFW22eluvE5uKP9NMjQWJjFv7XNvgHU/7iiC1EKw4QemTTXE5baa/5Xzth/iz8VEbU4P+lSybddLXfVfxOZeQDeJvta890xAVPLwzblJkdYijnitwPptpzvmTmNFnPQcMhaDuvP0XCg1qvo3yijsfLAPXV/T+4BcPJVvkyMjnO4Uh2fEvGqSCAceJD0/BA5YV1udgMAyDXG/0zBwPQ4uBszWwOVNs5zqQq2HhR3Y5xz/HQwHB8w4fTKVhEiak5wYiaIVvBdT9gndislKCPTT2h2xM/gNIwYATgt516f89APDEh9idvQe21n5/Xomi0wk26AqtxS8//gctVbduw4lfQzmFHcA98wMwpISXV/UBHKviOzUlJMzBN92xmQLrFMNNWngszP+EiNcBO2NyqUh6EZsbYGmN7+E7TFXEY6X8++LU0lwnleE+8QupSp10QkTd+Sa1I92rfYcv3YWFYfomUqgNifH0Cg+xHeFVO51NX/Da+IAKgkUsFmWrocX8gqzrKR0tdgNySm+pa3+djKE+qy9CGexhZYlBfHrrT/L+vHgdZ1M+0GRlPAbzOyTK2ONEyoAT6K+J/WG7U6B1jEHz8uW3S9RlIK64HpglYXM6k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(22082099003)(18002099003)(38070700021)(56012099006)(4143699003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?SzHlIXV5uYReisnEnLvmVbGLeqjhoAQyGi9odEurPgrdR0yABxm/NyjkSk?=
 =?iso-8859-1?Q?/Lvu5AtCJXss9pMJF+ymqizm8W1KbJbmMEfiKfzDMoLXmctTTwVO66oBdb?=
 =?iso-8859-1?Q?J3Q9QW1RSXmFohJVhK3ZgRxgGvK++mc4GFpQZZulP4D5w75xGoFsQm7+Ej?=
 =?iso-8859-1?Q?x9zsEGFC+5nEHhDX5CBYERPoCWjqlsJcJ6j8OKwAjbHklvyqP6NXxSxzcf?=
 =?iso-8859-1?Q?HHNJCrUnjkKOZQLL8OJwFjzWVzrHFHTUuEQQ2a8dZGbIx3lGvgWLdDYSEs?=
 =?iso-8859-1?Q?p5auDgUGbWlM+stIfaKSUaad/qs41xaZ8taAW4qso5QFTCGOC85GaLI1uh?=
 =?iso-8859-1?Q?sYF9gfyzm+cePXeBIgoT9dqXbqFcH3m4yvKf1Qpqqx3B4tXhE3ipn5e5Vs?=
 =?iso-8859-1?Q?w3mMybGf7eeDu6SehV2lSIw5uFpa6824S4qknSBgtlzqEgOcrFrMZk0KVz?=
 =?iso-8859-1?Q?ZRf9gY9eQAExJZoj4L+5vZ0D/0Fi42Ra8B4ekTYSO8s0CYj4E+3kKJ7Kdl?=
 =?iso-8859-1?Q?UldIwH7TQ7kWt+pVeTc0HAVrxlItQq2TLRqg76OyC2CQY4dvmW2+PJ5sy5?=
 =?iso-8859-1?Q?LDhXo6/b0l2pRvFbVUtxTi2oiOdLz4rjwjltYoEf7q9rnL29F8peVgwm/h?=
 =?iso-8859-1?Q?GnwMuj3M/NO5LEMNUDBexnbHMDgEMd7RnRpYzgXjDu4DPEVt1tge6d40SI?=
 =?iso-8859-1?Q?IVgdvqqQZEUbFrBjF956J7XnThRQbclB0twyBAnSOTMIgGytifh0nfohlw?=
 =?iso-8859-1?Q?LY7OeL7g9fEDpki5IpS5XdABtwH+Rbi3HnUJncr09qPbfWL5mOHWBhd5z+?=
 =?iso-8859-1?Q?bJ32COOny2MiM7LkYuZouCuGB6Uqw5YHNS7gYdEQSzm1DhRH0rC5ysgEfi?=
 =?iso-8859-1?Q?1Qf5aND+ZN12xsm4GDhDLQ/wW5FdE2YPwYyNQe6l5wjw229bSy4Wwp/u5m?=
 =?iso-8859-1?Q?68vO50eQrVdudwa8xO7EuCwL8VWtdsqI7K00ulUw3xLUK5gXRFMcdxR+fR?=
 =?iso-8859-1?Q?ak2lwdGmlb2NZNB/MD7s7YDsgVdFy4GnTD/59mWg6GIeVMhy6YqEtHluJs?=
 =?iso-8859-1?Q?GQPZZKYgs4CF4LTJNWrh/JiDwpbSQpkeGaQ6KhD8l3YDH72y4VOecdr8Ko?=
 =?iso-8859-1?Q?N1xEaKg5OP/JDoo34/5slKXtVxSKvBxLUQ416AKO0cSMmUv5u94d3cf9tP?=
 =?iso-8859-1?Q?Hk07tEQVJi3lO2KJU9+FRIY7v4ub863HrF7UVTKMcsDaxiKssXXVUP+FJ4?=
 =?iso-8859-1?Q?s+g7OArFugrpbH6QSnX+ORXoX9Ej7bDFjP/i9Us92mohECAFdvSr0NNs5B?=
 =?iso-8859-1?Q?xtefL5JJi8uewCaTdrpYgnGlHmuMtfA0Agg9l4xurv/xsNoyJ2qdpqAYPr?=
 =?iso-8859-1?Q?pVhur1rjjXlISu6ppbQvoV3d4sS5uKBDMAoF2/LfnOuZ21OW72ot8bZg2z?=
 =?iso-8859-1?Q?8XxUFk5CKlNTSuIU8Z7P55DiPWRgxdRnZH44qKDK8CG2fYkWooDoZ9rKIB?=
 =?iso-8859-1?Q?eBf9queH0u8ISTjYSoFeRxZXGkEl3oGHuQIg1quVSnWHVV2xwj2h29K/s2?=
 =?iso-8859-1?Q?DoQOXiCzinrB+vRxjVYmA0nOUNbYmKbgCw2eziKyf9lIqJHyFCbXUG8udF?=
 =?iso-8859-1?Q?Au2O8XqErD/OxO/WlEUtSGrjSqhMwLTvxQe/kpq3IC8xhw7W/84Zgg80mi?=
 =?iso-8859-1?Q?FDSZ2Wx/CuEZ4ZEcR8uzsHkMKTkdh8NNchD9vNzn7ndLEZ+xo3Kt7KKaB2?=
 =?iso-8859-1?Q?uR4faD/+INLeSWhRYA2ihaUpHuvIAxJO2zpL/3ellBSz+jNng4c72V4ZX7?=
 =?iso-8859-1?Q?mtEuu8zbUHKFEkskSIZmoiZLcytQNfc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 847409ef-5f58-4b05-4c91-08dece818d7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2026 04:08:15.2888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oKuDOIA5yeg7OxFJETBxkEEQHUi5yugz1z7FZdjKlrTJI2L90EwQFVlEAnAvskRL2EBsNbnUIBrHX6qbNYeB1+y2XgIHpp4XqCPrdHPzCnJ5e9Roz66+9zVhAxlJGuc7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1444
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	TAGGED_FROM(0.00)[bounces-65302-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,foss.st.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:tarang.raval@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:mehdi.djait@linux.intel.com,m:sylvain.petinot@foss.st.com,m:benjamin.mugnier@foss.st.com,m:bryan.odonoghue@linaro.org,m:heimir.sverrisson@gmail.com,m:hardevsinh.palaniya@siliconsignals.io,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,MA0P287MB2178.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A4E0D6A84E4

Hi Sakari, Laurent=0A=
 =0A=
> On Thu, Jun 18, 2026 at 04:02:53PM +0300, Laurent Pinchart wrote:=0A=
> > On Thu, Jun 18, 2026 at 02:47:23PM +0300, Sakari Ailus wrote:=0A=
> > > Hi Elgin,=0A=
> > >=0A=
> > > On Fri, Apr 24, 2026 at 02:55:47PM +0530, Elgin Perumbilly wrote:=0A=
> > > > From: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > > >=0A=
> > > > Add crop support to os02g10 by implementing .set_selection() and=0A=
> > > > storing the crop rectangle in subdev state.=0A=
> > > >=0A=
> > > > Initialize the default crop to the active area, make set_fmt() use =
the=0A=
> > > > current crop, and update the output format when the crop size chang=
es.=0A=
> > > > Also program the sensor window from the active crop/format state in=
stead=0A=
> > > > of using the fixed supported_modes entry.=0A=
> > > >=0A=
> > > > This allows userspace to configure the sensor crop window explicitl=
y.=0A=
> > >=0A=
> > > Please wait for the Common Raw Sensor Model patches to be merged befo=
re=0A=
> > > adding this -- we don't have an established way to configure cropping=
=0A=
> > > before that. Some drivers might do something but it's all a bit hapha=
zard.=0A=
> >=0A=
> > Does it mean we should wait for the raw sensor model to merge this=0A=
> > driver ?=0A=
>=0A=
> I only suggested this for the 3rd patch.=0A=
 =0A=
What is the conclusion?=0A=
 =0A=
Should I drop the 3rd patch for the time being, or include it in=0A=
the next revision?=0A=
 =0A=
Best Regards,=0A=
Elgin=

