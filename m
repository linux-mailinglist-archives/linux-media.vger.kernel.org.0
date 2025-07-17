Return-Path: <linux-media+bounces-37951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E07D8B0869E
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 09:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47AE6189A575
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 07:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9922E239E6C;
	Thu, 17 Jul 2025 07:28:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020114.outbound.protection.outlook.com [52.101.227.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91812376FC;
	Thu, 17 Jul 2025 07:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752737289; cv=fail; b=anM1Vtiu72EoIW8ozg5BmRRK2PK0+eOrgAN9K8HXhqgWRuHB8o/UlziqhwXRovLm8vF6xEIebrGT5I8VeiGTV0YG5X7ELDjUS15X1erz9eTf7gr2lUpNhUcjYcGtrEtgeX8MQxSdt3fojzojUPlG9pX961aSmoxAHHpsNm3kf0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752737289; c=relaxed/simple;
	bh=UfEC8awLqrdgwjowCfEaWGgV7pWLauXtarm0FDo/5ZE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AFamP9shSsTRcZJxIVvz5jjBGPuyTrH5S38BrXfKW7Qn0F0S3nGZSrUEkk6cEI4njukZyOxqBfniZmMFB4KCET0qo84CsC+8UnFE31xF4a5lX13UkVE0rjaoYJZGNHYJzzaD4nOd7agHlqlVqifAl+JN8DMFbFt0kiP4lybfz9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Io4lg1UVRNlOpwUmeFQfTwuwLOmm243Yizi1tobH/qPKmu9ifdrWhc7iWPZMmA1aPmlcwLIYdxkLmSvF1XJTmIjEhB88sAvtusfUDmaly3CIIUGx8rfMpYB6a1EDv17nklK83b1lwzRhFurUdOf6J2Ah276TBFFQ4x3TAP7lPeSXII89c3RBBQL9BmjNwfNTxSHY0rradMU8D22A0GE5G1xEeiWS5ZncoVfSbkatYJ9Z4efDdjlIh3CrDKLJ8OzSfBMbk6br7wR6eK9AoFvy6SFvQMm95w3tpRiOYHsHSWEqxaLKLU+5qc3LKELR8tJORMFWsxa86qWzgAzsGEo+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxl7U42iI5rFZvDO2yku6isjg4BQSPwmGqx/j5kGjzs=;
 b=VmjcXQl3riBDLcHyG+U5j4Id7RxqDZ2aeL4aYRsm+Oy9DCgriZrUWEd2frmQEnDPwCN7cWGjgUvmP4IHjknreF1vfNd0NPD3BoT8srAzpZwOgPfYlHFTOhA0fQGExWxDcKuWsHg+F2M+C9E416hdfegLQaqIlfG9dpYZTospZJTjD28xJ3HLciUZ7N5cSuClyyyFa/XTCE3qLcdo3ehJeg8IkeSPw/TnELQn/BVCTvTroP/ffYE6u38CXk8q4loz4RX/Cf9PVfmZy/i/LU9MkEo9RQfJabdUJv6j1tiGphd00vs/Q2K8cZ6f9M7iD6FyUu8cZirWSo/vwtUZABACfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN2P287MB2158.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 07:28:03 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 07:28:03 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, =?iso-8859-1?Q?Andr=E9_Apitzsch?=
	<git@apitzsch.eu>, Ricardo Ribalda <ribalda@chromium.org>, Heimir Thor
 Sverrisson <heimir.sverrisson@gmail.com>, Matthias Fend
	<matthias.fend@emfend.at>, Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Dongcheng Yan <dongcheng.yan@intel.com>, Arnd
 Bergmann <arnd@arndb.de>, Hans de Goede <hansg@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Thread-Topic: [PATCH v4 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Thread-Index: AQHb9lfYoS/wf6j50k6uH/8lXesHXbQ12+aAgAAPulE=
Date: Thu, 17 Jul 2025 07:28:03 +0000
Message-ID:
 <PN3P287MB3519C2A2B8DC207AC0AF2C50FF51A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250716134426.8348-1-hardevsinh.palaniya@siliconsignals.io>
 <20250716134426.8348-2-hardevsinh.palaniya@siliconsignals.io>
 <20250717-hulking-earthworm-of-atheism-68a02c@kuoka>
In-Reply-To: <20250717-hulking-earthworm-of-atheism-68a02c@kuoka>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|PN2P287MB2158:EE_
x-ms-office365-filtering-correlation-id: 9ffc3184-c4bb-43e7-7c6b-08ddc5037725
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?MyLl/W7xpo4W7TvS4v2iubcswMRIKziAQtTXfiZFYknXlWlHS+M8lg7lRP?=
 =?iso-8859-1?Q?Ni9ZSnlDn++kfKRJzg8lEmlIoF7BVFdhXukIpyWmAIOs+5+Sm4ipQTnLyx?=
 =?iso-8859-1?Q?9+6FqWIksEKqypEhI3qeHHaVsqXlZTmSQEWF8v9vJAWM7eSyZ8ujP+rusQ?=
 =?iso-8859-1?Q?HsEOdFgauHHZ7EvsPSHruwvTXBtTr0j5wcCO+42Zh5mxX1haR7RAoIeiQT?=
 =?iso-8859-1?Q?FHsFfOJj6Vm8GTgo2iLUJkmAoinp0h20leQhwCLI2gaan1DC9MdBBak4rf?=
 =?iso-8859-1?Q?yUsrAbLIjTwx8dbGPXd8V9DAvUAheB+WEy1n/TIofJuqbJnmKE3Av3wFcD?=
 =?iso-8859-1?Q?HwDI1qkXdqTIThF4cJM4kcaxmjittZeCKRJf38K7BsVxYBVoO7epBlkGy7?=
 =?iso-8859-1?Q?kq62dd30sNGNmEw14DhaxUgFkxR8/GyZ9b4s/e+yLUYXMH97WofWpBSVeF?=
 =?iso-8859-1?Q?WixYnGKLh6K8HBV9s8FTqeyvCMjEuCYRyGR7IyX999VRwfT/92pN/Heyuy?=
 =?iso-8859-1?Q?f2vKDWv7WRmmHgUFNsc2wLGUezCGp8FUC3xHRBGfSqLnztWhjyQ6AYa2xj?=
 =?iso-8859-1?Q?IVr7uhsu3QHrdYR0nMf97lp0JpngJ/Vt8glHP7Z7cDQuvkIBAVyYYImXu8?=
 =?iso-8859-1?Q?+onXnyXHdEjAwu+5CxeP/zL7Go3JOryH3kOjfSwPBOOTJlqELZyOKgKG+c?=
 =?iso-8859-1?Q?ztzU7MYhroaYGTw5UZoJRaBr0uRklWhTaRklJ58ycESIhLcR7VeTmdJw0e?=
 =?iso-8859-1?Q?1vqWULr2hGYLNhxnA3nJw2kFAMSnyshUUPfGzo/v0rWP98wqtOFt4oo0Ad?=
 =?iso-8859-1?Q?31yX/fKC1w8VBsRexHjdl/cZH/NJWXJ8+fKF6O40fv49Dm+ksJy/+sqkSJ?=
 =?iso-8859-1?Q?t/un3+qJpizn4Q6rm04kWOCEbRXbssPtpROqETM8t21XPUeGG08qqyonfZ?=
 =?iso-8859-1?Q?Y0rrmmqKzFYq1psEO8+DzAwh6cxmnx2m0iTSuhG9xTbGzXJin5KnH3p2Xn?=
 =?iso-8859-1?Q?dwzZdgytYhAKbe+LBAAwRzQZdL+uqhJslhvVB3bNTzra238eKlPQPj8zVk?=
 =?iso-8859-1?Q?Fi19aYVd1n+1K5SPmGfuLQgK/l5yw8WwsJFqymbsBJhYPzAE0xUmePJ6O3?=
 =?iso-8859-1?Q?2cmcZu0o5cvyOiLA5/zj/Dn7JxPD0/NzCU8WgpDGM6E3QMBO+iCSwsh679?=
 =?iso-8859-1?Q?WhxjZsnQzRtuuRu5j60+qcE64KeFOD8/Fw5eMWQ0OFz9p8XAVDhylctbP+?=
 =?iso-8859-1?Q?QZ4ymaDPT+i0sTDq9HRBfkZU9/K3Fn46DzxYI8Z892OTeNkWTtLWVHro2n?=
 =?iso-8859-1?Q?sWkd4M5KReIX5BwlbQs5SIEGSMAW897pxiqzBJkyxE7mYoYQsVzfuxw+Kg?=
 =?iso-8859-1?Q?eDGU3R6RE62zG2cC9UGaYr/pMNK4hRrPGJaDe2eXf6dnx9tcrTa7I+RIcr?=
 =?iso-8859-1?Q?IlUp5xMQtPKklm40iBwbIWUYIt4NnNYPyC0quVcMkiRE1lY91Ifj5zWOtO?=
 =?iso-8859-1?Q?SiKSRhYmumK62lGyG8fGIguy6O2kDGnq0yWPMFzLjou+5gnMRNVqmiLsy8?=
 =?iso-8859-1?Q?zvaJJoA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?BuI3F9yx4XKVdIErLAbh05+9CmCio/jovszZWy0BBqWzo6Lw8RImoZY8Ok?=
 =?iso-8859-1?Q?X5A4qIZ3GS/szTgLefVhZHOQwHAsJOiYAdZw9xUqCDEB+CKRzNeSP0ECkv?=
 =?iso-8859-1?Q?xtJrqDwJUvzViSFSS6L8xO3uJI0G3Od9HULwIgfAGGdrTlMspb242fgIPv?=
 =?iso-8859-1?Q?YLKeOsZv84CUYfkdNkqciJZvbLSJEXHBekvFCwtKX41H3mtt5m0f8NCpy6?=
 =?iso-8859-1?Q?K8r6qEIyKI8S/6REruXNECMqOjyvOVQAdukv9vZw4JvSkuyFylVKS9LNls?=
 =?iso-8859-1?Q?oIV/y3xc5rKmo+vOW/lQl1EDBfdMhiLcuMS2/FFQ8LhAU4jsEiJEmtcFn3?=
 =?iso-8859-1?Q?fdTBWdFXYlkqnpHpnRorxnu9W00ZztKsrIiNF9pT3iI0gQ9J2ZUtCQBatO?=
 =?iso-8859-1?Q?eoEpy2hUhpg4Fdn371BxUjEakR1LLNm+STJRoxQNHy9h0YCTYXMqH79cG7?=
 =?iso-8859-1?Q?kcxpam//8SjNNKTJdB3wQWA7VfWqEYqy5efS9jsKaP9PPzOLZTN2n7RDhX?=
 =?iso-8859-1?Q?6uPFDnK2gjuyjcZusycOQGfMfAnso3dRhxnBSZ5fCYs327SPwcykYKqN2n?=
 =?iso-8859-1?Q?3tNKfruQ+aunKqrufD3BgbRsF4fkzYDGHhKSvL2ujCKi2Ev3I60cA6jxai?=
 =?iso-8859-1?Q?NCPBeRmhK4k7hlyFlj/UojCp+OshPCHylzL8THyVEwsZypekQ3/27PS9EK?=
 =?iso-8859-1?Q?M2nLY6mMyjhoD6PZCJsEqKS3mdMCxJF3z6aGfxmIgwVyhdqyUQ0mprw18n?=
 =?iso-8859-1?Q?iSNLzy6Nkf92CcEK5C4XdJKscEMdPkMsiaEnVb79wik67vwoDYkXh/ZLii?=
 =?iso-8859-1?Q?dRvtQiYL/W0g3wRZRPAftP4bRN8vAzqkroYsItc+i13kANJLHsL8kipUCX?=
 =?iso-8859-1?Q?w81F6/KqFo8YIeQK+GzwVqCrwuSuvdPG5fmH4n9OFFmja28+GVZkr7TQn2?=
 =?iso-8859-1?Q?kHCmjVnlUK0SMvqrjNi7WVg3zFgM7xyN9BGtOTAF5abIfd+BXqGqqt7sza?=
 =?iso-8859-1?Q?UglCxya0IAnbRtCWJu0VquaVws0SdEX4/ueZNafeyFQELLJVI4x5uS5k2c?=
 =?iso-8859-1?Q?olfRSROFh3YBQ9djGJzmTPeu1c9R2Z3qwf5AqeiS87elTvUWR0Dev9cI8+?=
 =?iso-8859-1?Q?XnQjYgOZVG/+3EV0wF6UiJv9rTlyHv2VmT51dK/GGQ3JTVBdR0yiyy9GZl?=
 =?iso-8859-1?Q?9O325024+zzdZmkUex05Xa1tUuJapuiyVTaGPjMjfcU+EHVW61jKMNUD/9?=
 =?iso-8859-1?Q?aLmEaRyLQ1J7mgfMC/KIroNXn818Yl2wlbW/im4xk41zmAXrBLRaN29XJY?=
 =?iso-8859-1?Q?rXvVWMIj5KVJ43wGQIyxcnkYGfyJ8UUUuz2AsRZnbU6FkL1osl5xIHpmFM?=
 =?iso-8859-1?Q?OcDHaqUtk1TMWGknHYY1MecKgbW9xiIndPIffYji7mPVWiWfIBA/Itq5c2?=
 =?iso-8859-1?Q?ygaOzp6ecvWH8KnWkaHTvXkp8aCpF5bJ8zGcjwmhzsvOLR0LCcaz+tencT?=
 =?iso-8859-1?Q?KP1Ht1uB8115HOiIYehmGsPe2k+1ekoDuDpPe7pC4wog1TaaUBtfly00mp?=
 =?iso-8859-1?Q?Frr+h/M0ycTpmmo8maSeluSTbYI8OnHypSQWdrBlH2lfyiOa5Lk+904lV8?=
 =?iso-8859-1?Q?42D7AlPdE+XRfNer0Iw5xrF3SpZ9q/9OFKWpXueB1bXX1ClkHcn5KtpWcP?=
 =?iso-8859-1?Q?QI8ByxQIu/xDpDOowq0=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ffc3184-c4bb-43e7-7c6b-08ddc5037725
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 07:28:03.0634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /zJDGh6nWy19xQx4JQazI7EwmVZ7wZ9F+jJiNJP/vThf4/DVWllKsGSnL0dtycJEjrq433AIo9HRJ9TUwcZlQ11gNsheFC7Cze4dirNU7eE5Hx5rYKwCjVpODYMuQzvk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2158

Hi Krzysztof,=0A=
=0A=
> On Wed, Jul 16, 2025 at 07:14:16PM +0530, Hardevsinh Palaniya wrote:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0 properties:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 data-lanes:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 items:=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: 1=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: 2=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 link-frequencies: true=0A=
> =0A=
> Drop=0A=
> =0A=
> I don't understand why this appeared. I don't think anyone asked for it?=
=0A=
=0A=
Laurent suggested validating the link frequency in the Device Tree.  =0A=
=0A=
Link[1]: https://lore.kernel.org/linux-media/20250710212131.GG22436@pendrag=
on.ideasonboard.com/=0A=
=0A=
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>=0A=
 =0A=
Thanks!=0A=
=0A=
Best Regards,=0A=
Hardev=

