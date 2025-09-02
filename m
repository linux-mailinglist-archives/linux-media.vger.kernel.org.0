Return-Path: <linux-media+bounces-41594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B252BB406D0
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 16:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37D21545BE2
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 14:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562782FDC5A;
	Tue,  2 Sep 2025 14:30:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020117.outbound.protection.outlook.com [52.101.225.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377D12D9EF0;
	Tue,  2 Sep 2025 14:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756823445; cv=fail; b=qpAyy7wOqCSNwXGOZwZ/rkVHeAtQk47WqzbWAaIsRZRZKsK/TUMWCQCEIZc2wH6MQHJ0OdXv8C+M3zybxujAZUxgbtnO5ZrSNRzEJjuSlz7LjDAS4baFAgVg+pZucF/egrA62hZlKrQDYKEa1kSeQZ+pb5LWg+8p5x7MAZf+dyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756823445; c=relaxed/simple;
	bh=mxRIvw8HsKTpXd110u8zN9wHG8N0sj9l0hjCJroqaJ8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RtwYMQAQfjMRuyYfrfgdDecUVI0/a6x0PDBDWjIyfw6lPzs0uM+0BJXzdoidVqIdHxlpQoA11DJZvmJWwVlxLo/tBDhOzt4XzvdXrZVBoq9uMwbiXRFevTOlGjmsVKUjiAtVk87109vr+619vJB8TL7s1RVpiWRO10OQjfDhJ5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjtgqmCk2cyWsA9boPVBb1HOnWC+1+2yscFire45Fdp4Vvw55IsJEMrFyC2M+4QKzouJZ7gJ7M4vqC/g7wDyifZwTKrXwtvXocMCv45kGCdZARYecRYyKaoDX43nZNtElltlvT88Wf99qygZNBy9OzdEL/Mo4N/UnUNSWneTwZk7L7FF7P11kCQAEN8pMUnp4d+qGIB1kaEde2ChITJFhcwsNGlLVQVHTfUpj1SVfdomf5T6XmZlvJeGAskMQuVoO7zXIAlNWqPk2zKVuPZKYteISLy+scpcca3BILgiN2FSLow1pLrv0aGSfASxclvuIGwBbxSbgWfQw0yDTFuh1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxRIvw8HsKTpXd110u8zN9wHG8N0sj9l0hjCJroqaJ8=;
 b=kv+qqmdZdrSi9v6wLO575i9CY7XqT5sg0755UBupo3o283DTiWsnE/KCORUiPRXJH0euVxN4pY7dAzs9GftTG8z9pb2CpKDgvi8LGkpO+MDj5YxLPxz4C0HTW0YKaBGflva+u7FlD1SGSB94uAF6OMhMR2DWy4yyGegQ886hZvz0KHum1XJf9JYetqkikimLMvrBhdcoCN2AwKzE1JjQID1LKyPjgZL8M+gBnHyAXIe1nUmjDIO9Mk0UnmZHV/K02fL5N3uHOG15WRWL6l2uCMfarc8as8HZ/y6ARUmPSfz5No4p8T6/yUgabfTjae+T659peBmwFs3pz1t6AiMbDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN2P287MB1165.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:154::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 14:30:39 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.9094.015; Tue, 2 Sep 2025
 14:30:39 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans
 Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>, Bryan
 O'Donoghue <bryan.odonoghue@linaro.org>, =?iso-8859-1?Q?Andr=E9_Apitzsch?=
	<git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Matthias Fend
	<matthias.fend@emfend.at>, Dongcheng Yan <dongcheng.yan@intel.com>, Sylvain
 Petinot <sylvain.petinot@foss.st.com>, Arnd Bergmann <arnd@arndb.de>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Hans de Goede
	<hansg@kernel.org>, Jingjing Xiong <jingjing.xiong@intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tarang Raval
	<tarang.raval@siliconsignals.io>
Subject: Re: [PATCH v9 2/2] media: i2c: add ov2735 image sensor driver
Thread-Topic: [PATCH v9 2/2] media: i2c: add ov2735 image sensor driver
Thread-Index: AQHcGMTYgOUZQjHc5UmWpQKIK5ImzrR95kUAgAGlZ4CAAG0SMw==
Date: Tue, 2 Sep 2025 14:30:38 +0000
Message-ID:
 <PN3P287MB35195F77DB9C8690ED553E1BFF06A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250829090959.82966-1-hardevsinh.palaniya@siliconsignals.io>
 <20250829090959.82966-3-hardevsinh.palaniya@siliconsignals.io>
 <PN3P287MB18298FB93EDC498572742B2A8B07A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <aLaiXTw2cieUCzn_@kekkonen.localdomain>
In-Reply-To: <aLaiXTw2cieUCzn_@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|PN2P287MB1165:EE_
x-ms-office365-filtering-correlation-id: c589b224-05f8-4a2c-18e2-08ddea2d49d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?JDiWxKC2O6VMr1NQpdLvNfY26QB5kDm45n4UqqTUBJH6azk4g+dozpEOCg?=
 =?iso-8859-1?Q?aNIikMxrQTUo/Ksg9wpvut1MYxAbDpMxDaexuwo/kTdgSXzfcCIQqGr7X5?=
 =?iso-8859-1?Q?o7NcyOIZw6S009smt8Jq8tRUckDtfs6DZdOb1NKVS454XNE8pkJdlupCG8?=
 =?iso-8859-1?Q?GrNZMK08S/es1IZDimsId6APwHhh5+F/bY3lKC+PcDSu57vRHaXQEMLFBP?=
 =?iso-8859-1?Q?CuorsPvr8B5Og6GnShnOeRjysh+yYepVmk6lmQSD3VsfPa2OyrX+GHm0XG?=
 =?iso-8859-1?Q?KdAOdNYeOl8aOHtctMw1LqquwVsdKMPNZHbTBmWFAqXpKDVRLzThIK/04m?=
 =?iso-8859-1?Q?Gkfrnn0vF6tI4IZefAxMsGA0LToRTR6jhRFQTjf/hXVz2LLNvGBRqofSHf?=
 =?iso-8859-1?Q?rpW59jx29PJ198qRnj87tNlDPn3UkjbdEaNHFMUoVskDiaTPPXOZZ2JzN+?=
 =?iso-8859-1?Q?MUoWq2OjTT0Qdsc6RkX76Dv3ZrcUM8uOR8J5+17FDNhOzVRd8wtaW6DV/L?=
 =?iso-8859-1?Q?SuKEyb2aL1WBJBxXc7RFKETYTtzngEw75EyEb9GrRzLv2z0PjnGBlOLlkl?=
 =?iso-8859-1?Q?hyc2dvbcSxqnvQzRonrPbmiqyLau3kNXq6FKSqb3EdLCrbOCbfo/O0RdEl?=
 =?iso-8859-1?Q?WUHukaQRT0FqKygzhSTfHGP+lEg69cneky7sIXuFe/aCsHHWdnlH9ggFXh?=
 =?iso-8859-1?Q?zakhp86Hgaqve4zDukJ5kV9DAwWt+053xtN+X78R996FQcOo7fv/esaFtJ?=
 =?iso-8859-1?Q?nVPa3xf/aLCqpnfeeQNsiwAinCLzf0W2VFQP0rm/ClDStip5KFCAOJMq0J?=
 =?iso-8859-1?Q?IBl2jIYoqy3zeKsx9EzGBvZLv8uE3DibeGuiiq3wteTalXOS+L68xhET3O?=
 =?iso-8859-1?Q?WfMafqonr4/oe47bpnU0HqnVS3Ua3bW4OUvTJnJObJ9qT9w7hKXpvjS8+z?=
 =?iso-8859-1?Q?YWbVNXirizWKMJOvWP1ulz5qlawmVB84Gr/B7cP43bLyKKiivtAhHDN1Se?=
 =?iso-8859-1?Q?2qf+JOV6D1/ziXl6LksXBz8LGk73yjPEnailtPor2DvWqDkijy3tCKN4Vq?=
 =?iso-8859-1?Q?VnA7OirH+vYjSQyizTObnq428bWR10YkTsgYEfl9yq8ifV5aKigNtGvslj?=
 =?iso-8859-1?Q?9kZxpDoPf/VBH8SWvGfCYGnHfQZUDvE6mnWiPcBWFaMImF2I1oR39sR6Hb?=
 =?iso-8859-1?Q?0bDyWwzpDY4iT1mQwgE5hbkCj3yZsG97Wuxmoccm3rNLk0YBQ3ju/mV2mR?=
 =?iso-8859-1?Q?fEe1WyGAkbZfslj8dmQrYP4wewdHzGyEMyrdTekfZMOWqrYrWI2QKz9kJE?=
 =?iso-8859-1?Q?C2kBXuHL7pSsXio16QcKjDnG2qvWv666+WqNwcYJtB6XRg7LiZqTD5drjx?=
 =?iso-8859-1?Q?xcV6wcLe9RZfb/zoDGGC2BVIBACj/re5t+vuARTEUQ/bP4tXYpjwev2AQU?=
 =?iso-8859-1?Q?eQcoY5krTZB7/BKJEMOVEuT6Hau5KdPwu195gqq3C1J9WKwkMqSWGIV83f?=
 =?iso-8859-1?Q?tzMKNRul6dk9gOpIm0CG6GcYob9mXD8v2kSqxXAEOeYQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yIGkZuQuBcbRrcHbCh45zlXoouE8KH2+YeMX06Ujdn0TcGCJJpW6g4oysQ?=
 =?iso-8859-1?Q?sY3TxGfWO9j57IfxAQW97kB84QzW+EZA/FglJsR2coaGG0ArQOicge6rYs?=
 =?iso-8859-1?Q?QMskCu4v0qFQE+Y4PoYLnymkEUVxgi7GCP1z0DBit0rbCtDywT4MfnLdzr?=
 =?iso-8859-1?Q?S5Pi55sr4QgZTXMM772vtIuMk97XC6hDV4kOqN/9cfM+GMA9pP40ud1tcX?=
 =?iso-8859-1?Q?prZcoiVcK3B8zHFFs1LcM/HWIwUEVIRXkE9W/UzRy6M07UC5yWLl1n5yFT?=
 =?iso-8859-1?Q?t6quBnls0fALhEceMvTKeEsVfuJwmhLwXvHzxDk0eICm7hJ/vEqipEWkFq?=
 =?iso-8859-1?Q?NveMIhIfeEjimq7gPKeR/Uw/dXbV9gKnODsv5hcb7HY+LlKGabvW2qCeEx?=
 =?iso-8859-1?Q?TGi1i2GZcxJR1xfNribJNplcg7hWXpoiRzygL099VGm0m77ZA6UM9i3JRF?=
 =?iso-8859-1?Q?/wclvQJjfk8yGpfCciBcV+/ILg6t2WkYuPN+bqCG0X5ey9+ZkcFouzDusI?=
 =?iso-8859-1?Q?NP2Hn+97Rpw14wgXKFxBO6XdF27fxyoYyPHrpWf0ARPpigq71jqsHm0X6M?=
 =?iso-8859-1?Q?2AESY85NlONd20gIHH15CUN/EJ5qep6j24ROWGjcc5h5p21cqxeaSjmhUz?=
 =?iso-8859-1?Q?kqy1WXBdLRW73j1GRDSagxsjbRGKw6h8CgqHfZIvoeoHqpbzPi6HVLkljB?=
 =?iso-8859-1?Q?49P/QdTALcdX7oH0DJNaRCS9ZKUAyA4wABdXmyUV4ckmyBd1jAGPXet8MI?=
 =?iso-8859-1?Q?vm8AzjogWT3PaKr0oiEQrI3B2xKbwWi+70xmPdJNU347iWCyljsFycdZ3D?=
 =?iso-8859-1?Q?4Y24WeMa/Rbk6cJRgIunuGxJfzpg6d+zP1uH2BNtGXaa5YNhSLZrPiF8Am?=
 =?iso-8859-1?Q?R9lx6VPW5RkfVrwGK9nZOmb9STJFVEx5zL84FI3ZCYagYTCNUND9+cf9Gz?=
 =?iso-8859-1?Q?rbKiAs2jR7Sx1/W0jrLRSuDAiuVl3EnLIJrMRIEwbxoz8TqCblq6GX2FaG?=
 =?iso-8859-1?Q?Gf+kBXHFLdPs9y8ZKVb0jSsgBidleEfq+TtaCPF07q6Oe4CPEql4qxY44K?=
 =?iso-8859-1?Q?vWz3RBbhic9iOmNDqgUklm6KfVZ6uF4RVP96V7EuaABMFVAPt+PxbcX2Eq?=
 =?iso-8859-1?Q?UBfF+R1/YQquG1k+ZDg3C8kb6BvyOaUFs96mpQyPebpatM3Mc7VlR9Fc/U?=
 =?iso-8859-1?Q?aPPTziQSth9iaQgZtlUgEEkyPhtouvngTqnWLY5bnpbkYY1W0IMCapj8xG?=
 =?iso-8859-1?Q?rX4b6H5OmDuxuUdtrGZSI5lzH+r9SpbDMptuHINTHaXUaMXzluxakD0AyT?=
 =?iso-8859-1?Q?6fK6Vei7jcP4xkO47CnC6ukRf2q+0RaemY3O6SvBG5DfmqdrwIDNxdiOrV?=
 =?iso-8859-1?Q?e70TT/4bexuN/kViTqrxXg3pgsTuOuCwwFak/YwEN9uhp1yMbTyZjbzRQu?=
 =?iso-8859-1?Q?hktKh6ZB5GlqNCpdXRSD6hBR9BjuMsgQyz258cFOAZIS4qPwz2e2J1V0Ml?=
 =?iso-8859-1?Q?LcV4YBrzXos5zN8+KCmckCqwrP4oTGloIhJNturEwlK8aC/0/0zEAh15JH?=
 =?iso-8859-1?Q?8nqcvEBReEoQxda8kGa02PTLQzymHwE6Aedwo4MVHN7p8sAVQhFnKDqDoa?=
 =?iso-8859-1?Q?ZefH8/PwWDImEPnRqb77pTVfmZ2ba9FfLiym7vDjRhk1By0q4mJnIZxg?=
 =?iso-8859-1?Q?=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c589b224-05f8-4a2c-18e2-08ddea2d49d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 14:30:38.9100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8kwOJd6+dSd2Jc5G/lP0fslidwXq+qgS/OHZFcmxp0hKPbDcfDP9NHRD8WMFLd9/wQ+mXFVIsgEG0wCmf28MZla5+YT7FUo72E6JBZ8rp9K4wY5RqyN2wYyb3N6O6gkO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1165

Hi Sakari,=0A=
=0A=
> On Mon, Sep 01, 2025 at 06:44:46AM +0000, Tarang Raval wrote:=0A=
> > Hi Hardev, Sakari=0A=
> >=0A=
> > > Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.=0A=
> > >=0A=
> > > The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an=0A=
> > > active array size of 1920 x 1080.=0A=
> > >=0A=
> > > The following features are supported:=0A=
> > > - Manual exposure an gain control support=0A=
> > > - vblank/hblank control support=0A=
> > > - Test pattern support control=0A=
> > > - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)=0A=
> > >=0A=
> > > Co-developed-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io=
>=0A=
> > > Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=
=0A=
> > > Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignal=
s.io>=0A=
> > > ---=0A=
> > >=A0 MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=
=A0 1 +=0A=
> > >=A0 drivers/media/i2c/Kconfig=A0 |=A0=A0 10 +=0A=
> > >=A0 drivers/media/i2c/Makefile |=A0=A0=A0 1 +=0A=
> > >=A0 drivers/media/i2c/ov2735.c | 1109 ++++++++++++++++++++++++++++++++=
++++=0A=
> > >=A0 4 files changed, 1121 insertions(+)=0A=
> > >=A0 create mode 100644 drivers/media/i2c/ov2735.c=0A=
> >=0A=
> > ...=0A=
> >=0A=
> > > +static int ov2735_enum_mbus_code(struct v4l2_subdev *sd,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *sd_state,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_mbus_code_enum *code)=0A=
> > > +{=0A=
> > > +=A0=A0=A0=A0=A0=A0 if (code->index >=3D 0)=0A=
> >=0A=
> > Hardev, I believe this condition is always true.=0A=
> >=0A=
> > You should write:=0A=
> > if (code->index > 0)=0A=
> >=0A=
> > Sakari, Could you please remove the equals sign when you apply the patc=
h?=0A=
> =0A=
> Done. I also switched it to container_of_const(); the diff is:=0A=
> =0A=
> diff --git a/drivers/media/i2c/ov2735.c b/drivers/media/i2c/ov2735.c=0A=
> index da5978b96146..b96600204141 100644=0A=
> --- a/drivers/media/i2c/ov2735.c=0A=
> +++ b/drivers/media/i2c/ov2735.c=0A=
> @@ -402,7 +402,7 @@ static int ov2735_multi_reg_write(struct ov2735 *ov27=
35,=0A=
> =0A=
> =A0static inline struct ov2735 *to_ov2735(struct v4l2_subdev *_sd)=0A=
> =A0{=0A=
> -=A0=A0=A0=A0=A0=A0 return container_of(_sd, struct ov2735, sd);=0A=
> +=A0=A0=A0=A0=A0=A0 return container_of_const(_sd, struct ov2735, sd);=0A=
> =A0}=0A=
> =0A=
> =A0static int ov2735_enable_test_pattern(struct ov2735 *ov2735, u32 patte=
rn)=0A=
> @@ -428,8 +428,8 @@ static int ov2735_enable_test_pattern(struct ov2735 *=
ov2735, u32 pattern)=0A=
> =0A=
> =A0static int ov2735_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
> =A0{=0A=
> -=A0=A0=A0=A0=A0=A0 struct ov2735 *ov2735 =3D container_of(ctrl->handler,=
 struct ov2735,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 handler);=0A=
> +=A0=A0=A0=A0=A0=A0 struct ov2735 *ov2735 =3D=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 container_of_const(ctrl->hand=
ler, struct ov2735, handler);=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct v4l2_mbus_framefmt *fmt;=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state;=0A=
> =A0=A0=A0=A0=A0=A0=A0 u64 vts;=0A=
> @@ -697,7 +697,7 @@ static int ov2735_enum_mbus_code(struct v4l2_subdev *=
sd,=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *sd_state,=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_mbus_code_enum *code)=0A=
> =A0{=0A=
> -=A0=A0=A0=A0=A0=A0 if (code->index >=3D 0)=0A=
> +=A0=A0=A0=A0=A0=A0 if (code->index)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> =0A=
> =A0=A0=A0=A0=A0=A0=A0 code->code =3D MEDIA_BUS_FMT_SGRBG10_1X10;=0A=
=0A=
Thanks for your help.=0A=
=0A=
Best Regards,=0A=
Hardev=0A=

