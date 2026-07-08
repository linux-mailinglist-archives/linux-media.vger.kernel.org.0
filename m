Return-Path: <linux-media+bounces-66980-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vYliOtxCTmpfJwIAu9opvQ
	(envelope-from <linux-media+bounces-66980-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 14:30:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F358726509
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 14:30:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=NvNIwDUI;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66980-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66980-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A1AB30379B8
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 12:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B6C43C7BC;
	Wed,  8 Jul 2026 12:26:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020072.outbound.protection.outlook.com [52.101.225.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63533F54C5;
	Wed,  8 Jul 2026 12:26:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513583; cv=fail; b=IOooNsorBeEizN4KBfB/Epm8tbpUIhU52s/lnXHD4ek9iKy+JTcsIEJyhA7gEUaDXWYYrgO4uqYzR4/r2QctjrGkgRShi143Boa30A+l6q/owsmIgRfwSCanm26ds6anhc49dsPvSma9irf0Gl299gspplYlf26evu7G6JQNgcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513583; c=relaxed/simple;
	bh=lISjHCMDk75lz6Q0y5Oe8YdA970XYy9xkURXVt48YlQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GM2uufQNO8Plsyc0OafbCXvv40Eu7kijBMMUMdyuDIjmqdLR6iKdbob6c20cMjoZQMMq6+T0lHr4XdgLRX9gB/+eD+9ZlTQKY7UfJNZYuc7nGQV8+Jehy3dNVfzi+UnpN2AxzcJlJyUOEns78rQHNKn4HEe3kaAdDtAAIs7t1OA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=NvNIwDUI reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.72
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPt82Uj10luK1aouimF0ZqNG7yGSJMDL++nIi0zm9ih/75FyXDE3IvuOARjZ8Q2u52t4FraUpkiJKt4t6+c419QBXmoQ2KZ5BheMFpw2jPyIZCLG9ExSpet/9y77/KdOo0enBr4VrvqvIPlUSx+Hqpm21iXAB2m1BLxCiNJtQqkcgD1QJsN0wgXkKXvdX7Lm2Zlif16RUDbilFNheSHwsUu5/BKZgadcJAKfHEGcvUV4EzXip//tYLe+ayNOZAwr4byT3aD7tDuEdFbOlbfsHBS2tayiS7+zZBgK8IfTj04XKk1I7/W/1Y0nhHBgeF+En5dCFR5Awa5B7XJLJXwHBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lISjHCMDk75lz6Q0y5Oe8YdA970XYy9xkURXVt48YlQ=;
 b=wv0A0rG6FZJEPUpwZ+C/hsZIRTR1nR5PBWiMH5TE5x+NRe5PS0gDBDUS3ST6U21hcGLpFV79q5xkPXH8TeHP2YviILvPKLX9OOkkhhs5mh0SZ2FpkRp5BrNOcUZf7uzSFdh6tbOLd5WhFCvfAAMqRBidSuJT5Wl9PsFFDW8L1TUPN17lfkR2Kfnt6uV/QBSDMyTdGY1BcDR+7WyQ0TL/Vn7Y6Ejm06lwBqFFYKwcMcF7SbWn79b+dcO4ZdE2O2whbkeLLG9ngQQEWwU6IQ8wVXwGw9fqYcZD8EJXuAOpRAf71oLj3v3zkqTfECLLQvR71H8tDL3Em9DGnLCzCt2CUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lISjHCMDk75lz6Q0y5Oe8YdA970XYy9xkURXVt48YlQ=;
 b=NvNIwDUI3uI9H4OFwfEJTdMDWlpvKqeuYhM0+gyTOMegy2jZAWFYH0absGPtFyyGWnJoClnbkO/ExjMv0cID+YIgjq4ZHbF9vvDkBT2LhWWR8/qrKxTQ8zMdqjtP+/SbKwX7t/0JvQYA5G/PnIjbfoyCzZM2ECdOOIwfz9mGah7BhpTvxphNgwzeT8wUsvHZidVx/xrz5nJHpWTADSpEob0JVx4tLwU3adFIm/H91kRc2CPZtGmHaBE5hhr/FDqMZ7iGym+scS9CAXvXvOyNJw83LpQbDPjlbWleVRF0uoPf5uGqkkdToRo+n1jK0SoqC9VJIxM5lUpd9I4LRSJ/wg==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN4P287MB5051.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:308::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 12:26:17 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0181.010; Wed, 8 Jul 2026
 12:26:17 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Kate Hsuan <hpa@redhat.com>
CC: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Serin Yeh
	<serin.yeh@intel.com>, Damjan Georgievski <gdamjan@gmail.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, computman <anis@talbi.fr>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Scally
	<dan.scally@ideasonboard.com>, =?utf-8?B?SWxwbyBKw6RydmluZW4=?=
	<ilpo.jarvinen@linux.intel.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v6 3/4] platform: int3472: discrete: con_id vana for Sony
 IMX471 as power enable
Thread-Topic: [PATCH v6 3/4] platform: int3472: discrete: con_id vana for Sony
 IMX471 as power enable
Thread-Index:
 AQHdB5q8NQpQtUcMokeHZdb/BmiJ5bZWs7/NgABnEoCAARLcy4AAVS8AgAAC2ICAAAgvPoAB/Z2AgAM4iQCAAlXEPIAAZyEAgALkQoCAADQBcA==
Date: Wed, 8 Jul 2026 12:26:16 +0000
Message-ID:
 <PN3P287MB18299FAACAF3E70FEB89B0DA8BFF2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References:
 <PN3P287MB18292C819793395D643D426A8BF72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <49257d09-a2fd-4a9d-9479-4d2b5e0fb8a6@kernel.org>
 <PN3P287MB182945B5747452110940BEA08BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <c7634571-4682-41d5-aa9d-8b965d641d51@kernel.org>
 <akT2CSCbaR0a3BMA@kekkonen.localdomain>
 <PN3P287MB18296E80E1786B05F5ACF37E8BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <d59e796b-fe53-4103-a94b-5ffba53246b9@kernel.org>
 <aklcEKiFDfZwCFP-@kekkonen.localdomain>
 <PN3P287MB1829FE03558376196C9030328BF12@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <CAEth8oG_jDMz3Sspayfv18Ue4vO6103fM0J_f_i_NG6tZ7c4XA@mail.gmail.com>
 <ak4U_RTLdWxx07zM@kekkonen.localdomain>
In-Reply-To: <ak4U_RTLdWxx07zM@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN4P287MB5051:EE_
x-ms-office365-filtering-correlation-id: 40054a60-b39e-481e-539f-08dedcec1bc8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|23010399003|366016|376014|38070700021|22082099003|4143699003|56012099006|18002099003|6133799003;
x-microsoft-antispam-message-info:
 LfTAT0fzokgDlu41ds2FZSbsSwAhdVdbOYkzwZGPk4V+VwQUO4jF2dnYs09Q3vfZPFGZWZr/AiV7lggu8wySTgcgNe5EgY9TPqXxnnJEn2AFqa2HmkOP2mM33tSLIaPxIDJK0wiEUcXhRgVz67r4amQoTBkyLzo1oQ6u/Uix2M42LfkNDoH9BGEB0JGjnmtL5aSPGLnZ3dqvtSIw+Tlfedqxj3ckvSbTDZWBp4IQ0xsC8YSfGmpxJsZL94R2cHKlwS8IRsK38InYM6zL+UIC+o+0I9UZcGeQPbBPyOFqUhyNnoa+FT7pKHKPmNyUsqBsIWgnqYOCOZgG/xCQhPGcEQNg/wAvDnRmxF+nrnbpv9qhb+pB31PBOJ3J4xXmDA6fhV+mn3yOs1H5i5JcmdHW4CQexTDxQBHcqmxKEOc0JAOdBv3+cfVZ4jWYo6veOd3XQlHVaUc7jfHgXxNIANM6PWdfKDWSVUfFJmMkEGpkCDOiXmGk89Y8GNPTFo0yVvc6fMUqalVbQNLza7lYBnN/EW75LRqO79EXZ94/IWeLWPniQKpJ9z22kNqrnel7kwFXfHOYQgpYXGQd7klJMXHPiD9a5K6iGFvF8gJIEdoMJFz6P0VB8AoznakbXk/KMiMMzxM9PpskpF8vdBOAc2Thy/6soWUdt/+A0YvGgqjXGS5FjBlZKi4TCna1U65jNtrzzi8HlpRSltZ3bmGoYkGqKNolZ7KWW95+Gub1CSaluMA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(366016)(376014)(38070700021)(22082099003)(4143699003)(56012099006)(18002099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cHRCaVJudlNzWC9tRGNOVzVIRGxQYldvU0Q4Nm1CNGh3YTdpSi9Xc3NUdVZy?=
 =?utf-8?B?UnErYjZ6dTlVWEhHVFZwZXlpNmNJSVdkZnRKR2hnQmJacGVmKy9FS0ZxV1RF?=
 =?utf-8?B?YkFHai9GbXlzNk1seUFmTGZTL1R0Sm8rbUU1NCtPaU1DSWtFTzNrRWQ4Wnhm?=
 =?utf-8?B?MFQzbHVNamI2RkJucDFFb05UWURPVnVudVhrMzFvSmZtVEF6S0VFMDlBSEV1?=
 =?utf-8?B?UGVROXBwQVdjSGlvcEQ3UFIzbkZyWTBZZjJKd0JDajVUUjVGRkNoclFVL2gx?=
 =?utf-8?B?U2p4VVd3eE1FbUJVNXFtc0RuRnB0Nm5MMDhSWExyU25nQ1ozWkNCYUFEV21r?=
 =?utf-8?B?bzJUZjdwNkVjcjNqOUt6UFdKNUdzZHJ1Z1JnK0kzM2h3RzY0QjdRWU13M0Vt?=
 =?utf-8?B?K0lrM0p6K0VjN0ZaMm1GaTNHUndHV3FHN2JTNkdBV2VPL2dGSHJUcGJZNUFy?=
 =?utf-8?B?dEhvVC9yTnlHRXpobWQyeVR1TDloK3ZmMnBRQ2I4d1lkRkFmZlJ1dFpBcmZF?=
 =?utf-8?B?YWlwd0xOTzhsRHA0VnluV1ZWZVo1eWFDWEl5R2xFRERQQzBBcThnNUxiUDFP?=
 =?utf-8?B?a1NmZHNxVTZtNkZrVUdzaFFScU8zRnhzTmZqeEkvNWtkbVBOWEpUTWJ1d0Fq?=
 =?utf-8?B?NElpL3dTRFAwWTV0R3FZVEZyZ1ozZTFEbVpoUXdNZHI0L3V6eVlkZE00QlNp?=
 =?utf-8?B?Vm9lOThOM3I3ak1DYmV3cHh1QWVrN1psOGhRTEw5ellNK2Z1TVJ0MUY5RTFq?=
 =?utf-8?B?V0hFS2hERHhxL3R5SEFXelFiY2N2TzhaWmpNSnc0NFNnbHV1d1FHVWtnTGlZ?=
 =?utf-8?B?SWk3azhPR2FsWkZYdjh0WTREVzR0QVhudXVTREFIbnBhZzBTbFBlY0lBb2kx?=
 =?utf-8?B?cEhjVTZ2MDhKNzM1Y0NkQUVlVkZjY05ZNkJIdmpEUUtxQ3JqU0Y0MXJRc3Jq?=
 =?utf-8?B?WWtKVERETGl1NVNOa2tNb2dDcm1EcW5WZnhpZkVWc3ZOUmZveVhCbDNrSUFh?=
 =?utf-8?B?b3FwMklIa2VRUlRjUnpVR3Z1bGZlSmRVNTJZNHdIWjhRWWdpZi8zTFkvWjIy?=
 =?utf-8?B?LzlsWlJnRGZuZFlCbDVseE94ZXZpcVZCVEROMG54ejI5VklrMVlnUG1IQUVP?=
 =?utf-8?B?aGQ5Q0xlVTNrZm14WTNvYVVPb1M1RGY3KzlWRGxHWWFCMzdPSUtQdGorNnRJ?=
 =?utf-8?B?Sk1PaUo2SzFUR3JvWlFvNm52dThCaXJJZFNYVzMwWkt2RlBGVWcvQTZrNFRo?=
 =?utf-8?B?Mm5ybUN6TWROeENXKzlHRFQvYmdrNzcvZnBzaEdsVTlBN29FSWFEUkhwV0ph?=
 =?utf-8?B?UDA1S2NZbWMyZFFlejl0d1BNaU0zeUYwcXNKeVpSU3JnTXpyVkhoK09XN1BR?=
 =?utf-8?B?eXFyZ3Vwck5rL0RQbmwyelBVQmJSSXh1UzBGSmoxZ3plNGY3MUxXZGsrajRS?=
 =?utf-8?B?THhlc2IvR1E5Nzh5dzgrNjVOamo5a0p6YnVMbEQyK0JkVDY1Nk11UjNMUUt0?=
 =?utf-8?B?UWdoNGJQZW1VSllrQmhvcnhwamxsT3lhbWhGM2hUOEdINmNUejRhcW00THlG?=
 =?utf-8?B?NHd2WHBENWh0SFNNMzYya1JuUjRkL01UZ3pZdDVOL1FCNm1nUENFams4YnhH?=
 =?utf-8?B?bDBrSkVEUDBsS1hORU1sYktBZ2JXcG12dDlKYlRrWmJTSHVuYmdZRk8vT2Nh?=
 =?utf-8?B?Ui9ERDIvMDRuZ0M1YWtyUXJmUk83T0pvMVhsSCs2d2VDN3JoUWVwcW9FRm1u?=
 =?utf-8?B?cEE2RU5lOWdwV1MyVHFMNVZzZlJDVld1dUovZHpJNDhPZnlCVnhzNG1FSGRa?=
 =?utf-8?B?SWQ3RDNhcFNCcURrd08rQTNHYnYzeHN3cnRJb1RMNUUwTS83RTN4d1VpdGFO?=
 =?utf-8?B?YXQzVytDTmtEdythRzdjSnNUSDFVOTlJY0NMRzByUFI1MFJjYnFYVm92ck9Y?=
 =?utf-8?B?VVRSMnVGdFpQWVYrRFB0QjRrdHhKNFV4RVN4Ni8rbmFXdWtxYm5Uald1cmZE?=
 =?utf-8?B?d3VjY25kZ0R4VkZPdWxNTmt5bERZNVpDTjdMMEJwTC9lMC9qYmdQUzFVSk0y?=
 =?utf-8?B?MjNsNE9ROG5ZUEdVV2tqVXMrWmpYdHVmdWc5cXhlS3hGNjZ2TnUxV1ZvaEp3?=
 =?utf-8?B?eXNLbzV2WWpKTkxYUm01dkxtVTViNWFmTnBnbzluS2MrUktrc2ZZQWw3SzJC?=
 =?utf-8?B?a2tyTkNTbitNNDlweXdwWUZ1SStJLzRUaHF4UGY3bVFCR3REZmtkYXJqL0sr?=
 =?utf-8?B?cStIM2M1YWhoSU1DcHJjd1pSaVBWRUZWOGFOQWxaSUVkdjN3enFiQVh5a3gr?=
 =?utf-8?B?MW9QakRLV2ZVU1R6WkwzUEhGMjhhdk9sNVF2d1d0OXZnUmoycVM2dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 40054a60-b39e-481e-539f-08dedcec1bc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 12:26:16.9531
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L9Rh7nh9DQ8I2rmIPyOs0YciGKBp8OTfkzoFcHTKzEmfw5Ei18Dk7PNN8B/kekOyyjhoS+wnvI+dWQkLwmUxX9qD0zL9nzMNBPXgoEW+ZfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB5051
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.64 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-66980-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:hpa@redhat.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:kieran.bingham@ideasonboard.com,m:anis@talbi.fr,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dan.scally@ideasonboard.com,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,gmail.com,ideasonboard.com,talbi.fr,vger.kernel.org,linux.intel.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid,siliconsignals.io:from_mime,siliconsignals.io:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F358726509

SGkgU2FrYXJpLCBLYXRlLgoKPiBPbiBNb24sIEp1bCAwNiwgMjAyNiBhdCAwOTowNTowOFBNICsw
ODAwLCBLYXRlIEhzdWFuIHdyb3RlOgo+ID4gSGkgSGFucywgU2FrYXJpIGFuZCBUYXJhbmcsCj4g
Pgo+ID4gVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnRzLgo+ID4KPiA+IE9uIE1vbiwgSnVsIDYs
IDIwMjYgYXQgMzoxNuKAr1BNIFRhcmFuZyBSYXZhbAo+ID4gPHRhcmFuZy5yYXZhbEBzaWxpY29u
c2lnbmFscy5pbz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIFNha2FyaSwKPiA+ID4KPiA+ID4gPiBP
biBUaHUsIEp1bCAwMiwgMjAyNiBhdCAwODowNToyNVBNICswMjAwLCBIYW5zIGRlIEdvZWRlIHdy
b3RlOgo+ID4gPiA+ID4gPiBJIHdlbnQgdGhyb3VnaCB0aGUgSU5UMzQ3MiBkcml2ZXIgYW5kIHdv
dWxkIGxpa2UgdG8gcHJvcG9zZSBhIGdlbmVyaWMKPiA+ID4gPiA+ID4gYXBwcm9hY2ggdGhhdCBz
YXRpc2ZpZXMgYm90aCBzaWRlcyB3aXRob3V0IHBlci1ISUQgcXVpcmtzIG9yIHNlbnNvciBkcml2
ZXIKPiA+ID4gPiA+ID4gY2hhbmdlcy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhlIHByb2Js
ZW0gaXM6Cj4gPiA+ID4gPiA+ICAtIElOVDM0NzIgc3RhbmRhcmRpemVzIG9uICJhdmRkIiBpbnRl
cm5hbGx5Cj4gPiA+ID4gPiA+ICAtIFNvbnkgSU1YIHNlbnNvciBkcml2ZXJzIHVzZSAidmFuYSIg
cGVyIGRhdGFzaGVldCwgYW5kIGFsbCBleGlzdGluZwo+ID4gPiA+ID4gPiAgICBTb255IERUIGJp
bmRpbmdzIChpbXgyMTksIGlteDI5MCwgaW14NDE1KSBhbHJlYWR5IHVzZSB2YW5hLXN1cHBseQo+
ID4gPiA+ID4gPiAgLSBDaGFuZ2luZyBpbXg0NzEgdG8gImF2ZGQiIG5vdyB3aWxsIGNyZWF0ZSBp
bmNvbnNpc3RlbmN5IHdpdGggdGhvc2UKPiA+ID4gPiA+ID4gICAgYmluZGluZ3MsIG9yIHJlcXVp
cmUgYSByZW5hbWUgbGF0ZXIKPiA+ID4gPiA+Cj4gPiA+ID4gPiBBY2ssIGFzIG1lbnRpb25lZCBp
biBteSByZXBseSB0byBTYWthcmkgZnJvbSAxIG1pbnV0ZSBhZ28gSSdtIG9rCj4gPiA+ID4gPiB3
aXRoIHN0aWNraW5nIHdpdGggdmFuYSBmb3IgdGhlIGlteCogY2FzZSwKPiA+ID4gPgo+ID4gPiA+
IEF0IGxlYXN0IHNvbWUgU29ueSBzZW5zb3JzIHVzZSAiSU5UIiBQblAgdmVuZG9yIHByZWZpeCBh
bmQgc28gdGVsbGluZyB0aGVtCj4gPiA+ID4gYXBhcnQgZnJvbSB0aGUgcmVzdCBkb2Vzbid0IHdv
cmsgYXQgbGVhc3QgdGhpcyB3YXkuIFRoZXJlIGNvdWxkIGFsc28gYmUKPiA+ID4gPiBvdGhlciBw
cmVmaXhlcyBhcyB3ZWxsLCB0aGV5J3JlIG5vdCBhbGwgIlNPTlkiLiBSaWdodCBub3cgdGhlcmUg
aXMgb25lIHdpdGgKPiA+ID4gPiBJTlQgcHJlZml4IGFuZCB0aHJlZSB3aXRoIFNPTlkgcHJlZml4
Lgo+ID4gPiA+Cj4gPiA+ID4gSWYgd2Ugc3RhcnQgaGF2aW5nIGxvdHMgb2YgZGV2aWNlcyB3aXRo
IHRoZSBzYW1lIHF1aXJrLCB3ZSBjb3VsZCBhbHNvCj4gPiA+ID4gaW50cm9kdWNlIGEgcG9pbnRl
ciB0byBhbiBhcnJheSBvZiBJRHMgdG8gYXZvaWQgcmVwZWF0aW5nIHRoZSBzYW1lIHF1aXJrCj4g
PiA+ID4gb3ZlciBhbmQgb3Zlci4KPiA+ID4gPgo+ID4gPiA+IEthdGUncyBwYXRjaCBhZGRzIHR3
byBxdWlya3Mgc28gdGhpcyBjb3VsZCBiZSBhbHJlYWR5IGNvbnNpZGVyZWQgKGFuZCBvbmx5Cj4g
PiA+ID4gb25lIG9mIHRoZXNlIElEcyBpcyB1c2luZyBTT05ZIHByZWZpeCkuCj4gPgo+ID4gVGhl
IGlkZWEgbWF5IGxvb2sgbGlrZQo+ID4KPiA+IGNvbnN0IGNoYXIgKnNvbnlfaGlkcyBbXSA9IHsK
Pgo+IEknZCBjYWxsIHRoaXMgInBvd2VyX2VuYWJsZV9oaWRzX3ZhbmEiIGFzIG90aGVyIGJpbmRp
bmdzIHRoYW4gU29ueSBhcmUgYWxzbwo+IHVzaW5nIHZhbmEgcmVndWxhdG9yLCBlLmcuIFNUIGFu
ZCBUb3NoaWJhLgo+Cj4gPiAiU09OWTQ3MUEiLAo+ID4gIlRCRTIwQTAsCj4gPiBOVUxMCj4gPiB9
Owo+ID4KPiA+ICB7IC8qIGlteDQ3MSBleHBlY3RzICJ2YW5hIiBhcyBjb25faWQgZm9yIHBvd2Vy
IGVuYWJsZSAqLwo+ID4gICAgICAuaGlkID0gc29ueV9oaWRzLCAgIDwtLS0gQSBwb250ZXIgdG8g
c29ueV9oaWRzCj4gPiAgICAgIC50eXBlX2Zyb20gPSBJTlQzNDcyX0dQSU9fVFlQRV9QT1dFUl9F
TkFCTEUsCj4gPiAgICAgIC50eXBlX3RvID0gSU5UMzQ3Ml9HUElPX1RZUEVfUE9XRVJfRU5BQkxF
LAo+ID4gICAgICAuY29uX2lkID0gInZhbmEiLAo+ID4gICAgICAuZW5hYmxlX3RpbWVfdXMgPSBH
UElPX1JFR1VMQVRPUl9FTkFCTEVfVElNRSwKPiA+ICB9LAo+ID4KPiA+IGFuZAo+ID4gYW5kIHRo
ZSBmb2xsb3dpbmcgZnVuY3Rpb25zIG5lZWQgdG8gYmUgY2hhbmdlZC4KPiA+IERvIEkgdW5kZXJz
dGFuZCBpdCBjb3JyZWN0bHk/Cj4gPgo+ID4gU2FrYXJpLCBkbyB5b3Ugd2FudCB0byBpbXBsZW1l
bnQgdGhpcyBhcHByb2FjaCBvciBjb3VsZCBUYXJhbmcgYW5kIEkgZG8gdGhhdD8KPiA+Cj4gPiA+
Cj4gPiA+IFRoZSBISUQgcHJlZml4IGlzIG5vdCBhY3R1YWxseSBhIGNvbmNlcm4gZm9yIHRoZSBh
bGlhcyBpZGVhLCBiZWNhdXNlIHRoZQo+ID4gPiBhbGlhcyB0YWJsZSB0cmlnZ2VycyBvbiBzdXBw
bHlfbmFtZSBub3Qgb24gSElELiBTaW5jZSBJTlQzNDcyIGFsd2F5cwo+ID4gPiBhc3NpZ25zICJh
dmRkIiB0byBhbnkgUE9XRVJfRU5BQkxFIEdQSU8gcmVnYXJkbGVzcyBvZiBISUQgcHJlZml4LCB0
aGUKPiA+ID4gYWxpYXMgd291bGQgd29yayB0aGUgc2FtZSBmb3IgU09OWTQ3MUEsIFRCRTIwQTAg
b3IgYW55IGZ1dHVyZSBJTlRYWFhYWAo+ID4gPiBwcmVmaXguCj4gPiA+Cj4gPiA+IEhvd2V2ZXIg
dGhlcmUgaXMgYSBkaWZmZXJlbnQgcHJvYmxlbSB3aXRoIHRoZSBhbGlhcyBpZGVhOiBpdCB3b3Vs
ZCByZWdpc3Rlcgo+ID4gPiBib3RoIGF2ZGQgYW5kIHZhbmEgZm9yIGV2ZXJ5IHNlbnNvciB0aGF0
IGhhcyBhIFBPV0VSX0VOQUJMRSBHUElPLCBub3QganVzdAo+ID4gPiBTb255IElNWCBzZW5zb3Jz
LiBTbyBJIGFncmVlIHRoaXMgaXMgbm90IGEgZ29vZCBhcHByb2FjaC4KPiA+ID4KPiA+ID4gVGhl
IE5VTEwtdGVybWluYXRlZCBISUQgYXJyYXkgaXMgdGhlIGNvcnJlY3QgYXBwcm9hY2gsIHRoZSBt
YXBwaW5nIGlzCj4gPiA+IGV4cGxpY2l0IGFuZCBvbmx5IGFwcGxpZWQgdG8gaGlkIHdlIGV4cGxp
Y2l0bHkgbGlzdC4KPiA+ID4KPiA+ID4gSSBjYW4gc2VuZCBhIHBhdGNoIGltcGxlbWVudGluZyB0
aGlzIG9uIHRvcCBvZiBLYXRlJ3MgcGF0Y2guCj4gPiBTb3VuZHMgZ29vZC4KPiA+IElmIFNha2Fy
aSBhZ3JlZSB3aXRoIHRoYXQsIEkgY2FuIGluY2x1ZGUgeW91ciBwYXRjaCBpbiBteSBzZXJpZXMu
Cj4KPiBGZWVsIGZyZWUgdG8gd3JpdGUgYSBwYXRjaC4gTG9va3MgbGlrZSB0aGlzIHNlcmllcyBp
cyBmaW5lIGZvciBtZXJnaW5nIHNvCj4gSSdsbCBwaWNrIGl0IGxhdGVyIHRvZGF5LgoKT2theSwg
SSdsbCBzZW5kIGEgc2VwYXJhdGUgZm9sbG93LXVwIHBhdGNoLgoKQmVzdCBSZWdhcmRzLApUYXJh
bmc=

