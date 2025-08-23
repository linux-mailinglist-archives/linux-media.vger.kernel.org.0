Return-Path: <linux-media+bounces-40811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AE4B32834
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 12:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 954F7563469
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 10:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7893B24679A;
	Sat, 23 Aug 2025 10:24:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021141.outbound.protection.outlook.com [40.107.51.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C496B393DE8;
	Sat, 23 Aug 2025 10:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755944673; cv=fail; b=nYNgD9uN3UU+ByYDQhJrq5Ot8cY1C5JPqo+cy2fhF4QIhF/ATxspSZLsJwYX5hA35twxnnqn+mFd9kb9OTdYPD7wu3BOoegkviFuP0UKyjeejDEdAgVWEH6CtqkJofvpxQPJvmaOuJZb2PKygcFkXzsDVhYpUC0WKAyt26RV3Qg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755944673; c=relaxed/simple;
	bh=T5YPehRgcFCXmAMb/9Yvz6L506fxxBct6OSHwd/4k9Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XvgKM5kD3Aqu/4v8u5Xo/U5JzDUFg09sKSSbLvOD5VizXiwkeQ3UA+tsSXJGhMTr7XmlzBTw45ZLq+OrDTBxlQvMTcUd8IExmEoMT30UcfQgI7AX9Ce/sXp3//SOF/FBEBXFnVs9BfhE7D0y+Pl14VuN8ynAYm6n1Uxa0JPNkxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1oHOau4jiteQ4cse3usPsQZaMTXZGvdZ1TO+LxRTQvdJpV22xGWM+us1w8LbPhfZ+/ph+EZWrMGdp4ChsEVtoIqkkzFyHJthx+qTj1mQJcBemu+gKoTOa5NFDKeW+4v7sHEkc5QEL/8wiiERTzhxTjr9MbYWNu4Y9WQmVxZ5ovT8P3j/cSMP/GIBkvCxr8xW9bhjJhM66O4vAHqubQqeTZYZsNOBVXESdMnCWIuFnL4CSKqCp0avLqRJ9SA5rUdzygSJLbwqV565LHo6WbDsOCp+iq+/msp1oSr9uWfMQjSkURghPG8JDUQgf2+0+ITfPX74Ikicn8SClf0Zx0xDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBlyQ7LA6e5RkPQmlTBR7k7hgV+TkXpky5oZoTUc3xk=;
 b=ixjVjBqD9By0pySwnZlLmZn+npgk3m9Lle9QJJ/H+HlWT0aejFWDpcKbALGdhdzm9GHQWcOYZpVsNKLGKZjSySekAq3CPbH3UxhHiLQLNUW0YdT4qqEwRQGpcmOQG46U9StH+jmpPpfMI4AwnkEzRDzw5f+LBpJ92qt9W7W5OmMNqyD+IErm9s9F4+/DYoBgSkJ44nWLAhitvZ6bzmwtDFFAdHou6mkojQ93QrNq6nxqM9sUMQk4lXZZc+fLGysD/9z4uScef+3rIDvDUnbAbN1v2yHNYiYt93kLAg/dmMGZ8HNKmdZOXL8YFJ07wfWqj0RMAxQBa9x7THZDHKrTEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by MA0P287MB0348.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:aa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Sat, 23 Aug
 2025 10:24:26 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.9052.017; Sat, 23 Aug 2025
 10:24:25 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans
 Verkuil <hverkuil@xs4all.nl>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>,
	=?iso-8859-1?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>, Arnd Bergmann
	<arnd@arndb.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Matthias Fend <matthias.fend@emfend.at>, Hao
 Yao <hao.yao@intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Thread-Topic: [PATCH v8 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Thread-Index: AQHcEqhgTfnvmiLlR0mEJAojKcQgWrRtMuMAgALXZSg=
Date: Sat, 23 Aug 2025 10:24:25 +0000
Message-ID:
 <PN3P287MB35193D19023BBD6E4607A579FF3CA@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250821143126.319470-1-hardevsinh.palaniya@siliconsignals.io>
 <20250821143126.319470-2-hardevsinh.palaniya@siliconsignals.io>
 <462abd9d-bd4c-485f-8663-70dd20cb75b1@linaro.org>
In-Reply-To: <462abd9d-bd4c-485f-8663-70dd20cb75b1@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|MA0P287MB0348:EE_
x-ms-office365-filtering-correlation-id: 07081844-d8b1-4953-fc95-08dde22f3c2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?x3jSE1jRCHpOdL+yQubpLy6/xYt5ZYcrHnhl7LFUlpStqROk17G9jTRtz/?=
 =?iso-8859-1?Q?kE91LNvuTdjIpPra8/kqnSPFDlc4n4A1aIdQ7Ke/nHAX5UdEzk4Dd0CqTO?=
 =?iso-8859-1?Q?C0nycN54nN6uFQrDO1p473G1LjGzTSdAeKBQhPc/fdABj0taLHCUTqHFiA?=
 =?iso-8859-1?Q?7h12DZMVVRnSjm9RojKA/TxPwzsqCyKZSs1KIn0OyQG865hOkaPD2Sdcdl?=
 =?iso-8859-1?Q?VT1V6aFH85iuAFPWOpVEJWTR6cSfrkefSUIQPHXkYKm747uEk54LJdqAoB?=
 =?iso-8859-1?Q?vjP7WAylA52cUHbTtWY4I9gkFjtI2J1FD1RuJAA+WkCcqJUDPXhNX+NL0j?=
 =?iso-8859-1?Q?8MC2v8Qo5fpB4Ss6sy1TliEG3ZXObI2k1XY94cHVSYvBQI5aPnZhDcNG8p?=
 =?iso-8859-1?Q?B5oaY5KWE3sBWpwdeLfYrVht2dN1FYmYDcFtm23/C4Uwy4Y8sxAJB/GFXA?=
 =?iso-8859-1?Q?juJfb2lhQSKz9GSWvYnLpS5VEYPvlnTS7MwECQiDNEZp9VStorxNnSdCxT?=
 =?iso-8859-1?Q?LUYGfjDl1qT8I14fj1dIfYAXV39XGxyTmV3vbMQyHVCMko5OJhJp+MmPDX?=
 =?iso-8859-1?Q?gNVG1+R57YXSm02i9bu0Q6PaQtfWh7mXYnItv8OnaY++MTA5/q1MyUCxQ0?=
 =?iso-8859-1?Q?wGYXIiPwDQ27wFr+azqBmWtre7WVu4G3d5x++GKtzusGAP3kUXOTQYm20M?=
 =?iso-8859-1?Q?lEFjNQR3rSDqQJnV86kP36XthsnA6whn99HWn5NuSqwXkxZlFT4bPdfGqr?=
 =?iso-8859-1?Q?yUQ+lv+/RThGjcLiv+xt9PRIwdd8gKxql7stAaafxqEnI7LUhjdny+Q2dp?=
 =?iso-8859-1?Q?25qFMrhcuGmXY5wqDXjpZxbnKAQuz687XRE4ezIsp6dL1AfTS0alc8oMlW?=
 =?iso-8859-1?Q?U+ufHR5/TzEGF/mvng0xgJO2DasZvm/5bPFSMSkuh2Bb2eVctf3BhW3lUE?=
 =?iso-8859-1?Q?anTiN2WhpMpJREfNU1xKxkMR3YmfHiUu1r0u0oewDCYlOlEVhJQ1oFuVGu?=
 =?iso-8859-1?Q?mX5aL9r66OKzYhY2yAe0oVUgdQBZAbxP2hHzYklPUya9mKGjfd/8crWIw6?=
 =?iso-8859-1?Q?D9pjLn/SORwnLz6xE8ihePg/nUl7nwt7CEqLtt0kz14pfN3BuQfwZFm3A2?=
 =?iso-8859-1?Q?yrkd2CDw3mLGrRW6XcQZgq/pDXKW9oCdnY2PLP/LCPpFEHGMrypZS1m9Hp?=
 =?iso-8859-1?Q?wbTMOJcJ+HgP4o1mlROiefT6IQm/zeCMMzLcjxi75VSFgG2qfF8yf2o5rn?=
 =?iso-8859-1?Q?EflgBYGUynjm/6qIy78/vULHN9v+uhLpDHie3qRW0y6Shko5hCQJ4EeqDv?=
 =?iso-8859-1?Q?r3ybQr6ZXKeIxKOmj6REtPoa1snH7k8kA4G16z5WBk/EsuItuyJWdNemas?=
 =?iso-8859-1?Q?sep73fEr9xY+JPP6FkJUxDkJJyiXrWtfe5mfkne+hmd9R64dtgIXJ45cBI?=
 =?iso-8859-1?Q?WdQOrQOYZw7P/vh+yKQdq1A15b8hZAXudDhCTxrPpvF3GLTda2wwb/Bcoq?=
 =?iso-8859-1?Q?gWvaBQ5egDWb4Fgt2mcqrzABHBco3ND3qUI1ZR6uEfvw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hiZC8tIvfLcrzSWwnlZyb/RbnIZu+wqxFchhS+dCUjyf51XVX7f1RVSoU8?=
 =?iso-8859-1?Q?r6StMpxziQvI3aYuMQI/oaJaOOVKpI/2xmm79hHWPYeSkcmv01NL/52kns?=
 =?iso-8859-1?Q?+CYb5e6SPqL0NKFnt1dvVorU59MsK3HOKImTfE9JX22mgLJAC8iuh114UZ?=
 =?iso-8859-1?Q?ddC+UpNR+QYsA1u4inPoY8ZnaJN2J+kMCOx6oknZ2gz2PjcpvoPZirAoUO?=
 =?iso-8859-1?Q?sbaODXjdoi7L9uzGfY8NyrO8gTsjVncd51TY/4sagyGRpWaHvWzwoZoCW3?=
 =?iso-8859-1?Q?Rt31tOqi4JTbI5J805AJy/zqepkz2TEMJU+vavCbdY5Sxyc7x3bLDM8Q7q?=
 =?iso-8859-1?Q?eo5m0jsg8UVrwmqeS+UE1h7SGYuCcqonbVvwUvUIQ989r/WTajzT9SBBZ5?=
 =?iso-8859-1?Q?SJDNKWjsOl0bWD1LM13cZEhnQS/RQ8zJDWL9UakQZKGYCytMM8kpahDBK+?=
 =?iso-8859-1?Q?XqqNR6wggdhEl0a2Wvkx03z16CMZiH9EVZzg/D31u0jCvSy1/eflkc8xyT?=
 =?iso-8859-1?Q?lTsX4Y9JI4iNSAWj2W9hZFCsilCgDyjeaStFzOSIeLx+ScoMH6rRDqPYtg?=
 =?iso-8859-1?Q?/JWGBr7KoQyGlWDgntbcwgit00jR8XOrj+GNUqAlreDsYl2kU0b/x8bqlh?=
 =?iso-8859-1?Q?VDXorq0DJvxymzoT2I8OYS/Aut8uVSpbu7RhGfe2SsrfTcML2/XA7rrO5h?=
 =?iso-8859-1?Q?f5UNHqd0wzL/9a3aEvdLLvIoS01cR5Z8UWtROvFlKfJ/jsXFuDxa3co6tB?=
 =?iso-8859-1?Q?2TM0q6PD7bps89iO7ElIkrCXSG+AottBZhABDqkMMOEYGv2vd8sI9yPwoL?=
 =?iso-8859-1?Q?yDjL0a6+UFguJPqgSl3lizkKBAEq4qiOZ5KLQcjKdy1lTOeqEJn6U82nxn?=
 =?iso-8859-1?Q?k6E2xcosbAoLZsVxtraedPfta8hRCNA6IH0MkqnSkIRdfk/J0onVR0QIuo?=
 =?iso-8859-1?Q?hlITCS5oyyPAk9NJlbpW75foVb+vHW71+xOz8yOU/ZifRA8M7spIYqwW3I?=
 =?iso-8859-1?Q?4YB/jasRrsWZiuI/9q+Qk3x5DVT9WVXOQqQ8ljBSAA23ZcEX2EjZgtoKzJ?=
 =?iso-8859-1?Q?hLNZNPAlRA7s6HQS51QGLbq56E6+LG0Tdu1rAoTF4FcOG+pxme5L5CyL6B?=
 =?iso-8859-1?Q?vURVzvx3g/E0j7JB7LTNel0wfSI0E3ezxSSjmZPnxvnH9FgYM9UxdvJAMz?=
 =?iso-8859-1?Q?+rMR9vavXn5LfEfM2j1GHZO7O7qHDoXsMD5wFnqQdMkwgIZm2/Ab4uj9Ks?=
 =?iso-8859-1?Q?/QBbKi3DW6kP6MOHOpDxsaFvhZEGzx19OMvktW1e/HNmmbFtHWMITpk6uH?=
 =?iso-8859-1?Q?Zz7XODq/xPcj4zIqtOR1it57rR0ZR4j8jVd7QL3Uaw4b+Py7heNZj9KwGo?=
 =?iso-8859-1?Q?Z8lWfH9sxEl+AGmmblw1UNSZ+gwITAyc63kuCX3yFaBt8YlYJjSnucQKAH?=
 =?iso-8859-1?Q?zbg1hFPWTVAFoeUycSvkYiVd/DjTSvRSkwQsvumRi55UWwEMJIL8O5qgBq?=
 =?iso-8859-1?Q?Cmx2uD2btt6Ehw5x+16nr7brvuU0l6u6yqd8UhaZ7PNij4st827DM/mbJI?=
 =?iso-8859-1?Q?0iiqq8l52AO6I6OmZT9ztSB8J/LjiDFRqjPmRifEG8+gliSONCzBy5XYKN?=
 =?iso-8859-1?Q?W2WqUy91T7U3xfEb0+snsGPNUeVESgDLO/UUEETurIn+OD/L7k5xVf1MCY?=
 =?iso-8859-1?Q?gRiy6uz1dxJvVmsi9rk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 07081844-d8b1-4953-fc95-08dde22f3c2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2025 10:24:25.7413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IDhn1qQxBo3EQ7fLDgFZKAyrmEV9OtHttZuX6YZ5hbrxXFXSvipdJtnhUzOT7ZQcunvmu3w1LBQnqZtOWcVQH2L3TVq1Id0jLnwuf+qfI1Q5FKXbiXiev5ppy4T4NDeo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0348

Hi Sakari,=0A=
 =0A=
> On 21/08/2025 16:31, Hardevsinh Palaniya wrote:=0A=
> ...=0A=
> =0A=
> > +OMNIVISION OV2735 SENSOR DRIVER=0A=
> > +M:   Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>=0A=
> > +M:   Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
> > +L:   linux-media@vger.kernel.org=0A=
> > +S:   Maintained=0A=
> > +T:   git git://linuxtv.org/media.git=0A=
> =0A=
> =0A=
> Do you have commit rights here? If no, then drop.=0A=
 =0A=
If there are no further changes required in the sensor driver, would it be =
=0A=
possible for you to help with this.=0A=
 =0A=
or should I send a new version just to drop this one line?=0A=
 =0A=
Best Regards,=0A=
Hardev=

