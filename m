Return-Path: <linux-media+bounces-39122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A72B1E86F
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 14:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16C81585695
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 12:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E5C2797A4;
	Fri,  8 Aug 2025 12:34:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021077.outbound.protection.outlook.com [40.107.57.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386E2219E8;
	Fri,  8 Aug 2025 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754656481; cv=fail; b=gSmi83Li9BcStCmRBRJdb/2dEm1yGF83BzeGKjuWnShWJ2YFXHBLRuDi0kWDoPIGL0GU4UEID21KeNbaJJXGJG4bDRQHdKGM4aVG1KAmAm4eFRAcy3aJ+hzEYiTfb6qvK4uwccBySuv8VqcOB/gqrpvhsfM7EvRD2KiPnHrLu3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754656481; c=relaxed/simple;
	bh=X34vzz37fuXCKB30YrN3iwfGvcNOLa3Xf3393Um1Un0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KiDfwCB8vdmiu7N8BHXCEmVgxvGGnegqMI4fG9LxAp1TpOgcHxb/3mm9/7b4UERQZrQ66AjKDyOsAvXtegczNHEC97IbeoYbozhGHMPDOVQd8lgLifDV+vueLYrLlpF3JljQwc+UEkKpHdvC0zLY65Bnsd3+3NEV0bhMeeM7kHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efH7gHM2pZpyXIv8oCnWTFJEQqJbU5ktFdT0Q2fkL/3skRlcnNIAObgVluXdGCiNrzbtrnJD4FSStR1QNmjBfbCuWbWKuzkyad/2FP2rNSpMvwH01JLwmAamYNstoHaUViAoDuCPm3+whX9S0HfJCDk0fkuqSHMmD8qt6SuwOaHbvk8JOgnZnBU1kwqqGAzFZSoc2FY7GAjvwjb6egoX7pSyQsezClaAhpdgFKWM9P2FZ1MW/yt+d1vE3MjdMWzdca89ncjx6yNni5VI6jWMYqSKRXh7cwdvVCX+AkYGnwQn69kXkzMqaSqCJp39AiMXhIWchSvRNkGruq+c5SViOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X34vzz37fuXCKB30YrN3iwfGvcNOLa3Xf3393Um1Un0=;
 b=uDjNFTssE023Q/b+cYdWKt9sPDVX+sI+jhIc9PIw6kmiRtP6Gf5Y3DNqlWmn1KhbdO3VWb6ImvRwYHZTftG9W8f6kdYOztIx/dF+BzYlRLd35tiScK1sqD7QqkYnZcuwLtuMuLGHZFTzPmZGomuWM0TNkdXwYqLOjHgIpXVn89ivR2BiFEZERYm9WUqCIV+lnK5AExRdHjQVw7IBJ2hiOKU+nLonCScHEa0ePqWxWZXP/V1Ynr+bjiTzbd4w0W092eoen2UBMGiPvittNYBZZJJCafyBpVsBJ78/IRt1BpiDza9aGgPHrvVejvl3hiIMxtGukAwPkFv4WXqyKdt5uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN2P287MB1549.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 12:34:33 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 12:34:33 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Himanshu
 Bhavani <himanshu.bhavani@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede
	<hansg@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	=?Windows-1252?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>, Arnd Bergmann
	<arnd@arndb.de>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Dongcheng Yan
	<dongcheng.yan@intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>, Matthias Fend
	<matthias.fend@emfend.at>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] media: i2c: add ov2735 image sensor driver
Thread-Topic: [PATCH v6 2/2] media: i2c: add ov2735 image sensor driver
Thread-Index: AQHcAeHiVCljdpdLHE+nzjgq9sz23bRYr2WAgAAOGlI=
Date: Fri, 8 Aug 2025 12:34:33 +0000
Message-ID:
 <PN3P287MB351940E03B0D0AD1A933E99AFF2FA@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250731061004.5447-1-hardevsinh.palaniya@siliconsignals.io>
 <20250731061004.5447-3-hardevsinh.palaniya@siliconsignals.io>
 <aJXiv3VeoIhpNBhB@kekkonen.localdomain>
In-Reply-To: <aJXiv3VeoIhpNBhB@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|PN2P287MB1549:EE_
x-ms-office365-filtering-correlation-id: 376532cd-714d-44ce-cf0b-08ddd677ed9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?09M61rTTG+TZBlHT26LVJJE8n9CtPX+uOzfhJrGLU++HqhazDET/gaWO?=
 =?Windows-1252?Q?3mKIrRKQw9tnbUPgLrDH2di5SqKl3W45JO1opmO+5cYmdjy6rF/0MVUU?=
 =?Windows-1252?Q?W5uOkw3hff0AsunJEsCrmLS75k81Gm2Hz+ZT25Xv9N6fe9a657hTFDBN?=
 =?Windows-1252?Q?YLhlD7pbWoVlWdostSqJI2psCFuvRQn7Zl50y6KWE0hjeucrybj0RpNa?=
 =?Windows-1252?Q?e/5OnSNRrqgSQEpkASdDL4nixjhHr0bVWw0Qozm3CQ3boHc3Acv+vVLX?=
 =?Windows-1252?Q?GdX5jXWFcC0ZKyDM1S1Y6a9kY1mAP1CeWK1WcV4qJG5d0GRRs3zPnhAy?=
 =?Windows-1252?Q?8y3GchaZ5fT6PnG6/cKuicXOhC+9MToRjo8O/4ceiPoqCy4MB7dzjCVR?=
 =?Windows-1252?Q?V/NdzY3O2U8cGhAqJfgFW0aWsKCU7RhBr0B3GniMpgu7cYbHuPBCN5bQ?=
 =?Windows-1252?Q?dzXCtvUgFRvte4hPcQrGs0vlRWpfMIFRu261BYCAdrMT7UmWtLaMBHdD?=
 =?Windows-1252?Q?kHQtjdXVJUbJR6DXi1wqcqNl12m2TuvfJ1aIWvB90tptrrCYOLi4Hvaz?=
 =?Windows-1252?Q?mSJchpyp4xYsJEAyOPMCPrpcYFEsQaIG5iyuYXbTsjTlybAM+QNE0nt7?=
 =?Windows-1252?Q?5v3EIfyNQ0GzQ/9pK759sSRhMKm/XDAkiIWbSIMmEJqwGrp78ER8Lb28?=
 =?Windows-1252?Q?zoyP64KbcIA3alTCq9z3GkxxKDhgXmhjphkE3lempgwywNAigCRDq4II?=
 =?Windows-1252?Q?WFCXzVaDhOOLDKqcWggNHHjO3vGRb42nsDBCBhkX19a7rGq0cg4oqD3T?=
 =?Windows-1252?Q?+Y/N7rkF7oc8jT/9aA78HaAE2r6fNlnKbV9QCKFYvnnP5kOSC6/HAP8g?=
 =?Windows-1252?Q?tbjC6nD8qDqc3UXYbMBill15pFLOcIXZzmDbwks2T7YDI0dq1S+9wjvD?=
 =?Windows-1252?Q?RaquS5HZ0bfJo06cX2GwvccA9M6yWQQ1W+m0dvLaxdQ37dD9FQ+eRLFR?=
 =?Windows-1252?Q?5012qIkZHaRTPNZZDgmo94vMTrv/7avLO2cj6Ql+LNF9Bq0QiOwxTtJZ?=
 =?Windows-1252?Q?t/t/HjC1nln/xpGQEIBqlOx2l/PwCReZ8gXoltAP3lqxQJHAWukauKDq?=
 =?Windows-1252?Q?HAqXQXDX44ArV6toMCdXnEFWeRGHZS4wW41incQcrYzj/zcYnDmYmE9Z?=
 =?Windows-1252?Q?hLKNDmVT3uiBuEB8Sqp6yuGKPGgx8v3m76cg10ywbha4OIIsuYD05UTu?=
 =?Windows-1252?Q?nnlMMMxdl25742qLsFfBesuo1xQHnzNuAfRJWJ8pmtt0uM9r4rE6CFHS?=
 =?Windows-1252?Q?ASZv8Y9T/IBwo1zqkcYOXl1IrA9FEDZ1Qr19PBxZQkAke1klgjJ32Me1?=
 =?Windows-1252?Q?IiGWhUFnK8ysfButfBvK0mOiZsSkz2PSs4JD44xs68KtQZiVxzVsIP/6?=
 =?Windows-1252?Q?QOC4R4Gi501Y5kSA1eX8DqOQO/4sn2byAYdTD3D7rBFu6n7I3q62mKQx?=
 =?Windows-1252?Q?CJw6C57yqC8qxra0OlurAK+FX/vKKiw/NVDSogeI9+y0AcIdThrkqU5q?=
 =?Windows-1252?Q?4XkNgtbShW9cvO1x+J0pCCClUNwGEdfdqh0qSw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?TySkOSBvbVRpnbYM5TNkxDE7mvnRn8wipFnPCwn/61+6kZmZAI+azXsz?=
 =?Windows-1252?Q?91ZAxmNQAOtM2mz9UJMbSHnBboZ0eaqH5wZGdjCjbKFL28iKJGikdJ93?=
 =?Windows-1252?Q?yprQn+4KOplOAmM4u8iprkxFAlnXG0g12VkOoEL5s+0hyJL0eqAhCrtD?=
 =?Windows-1252?Q?YXG268OGN3NypchL4ffHYPp0rdDLx2TKVvqlMU63PiuLC9yHZDiGmzTg?=
 =?Windows-1252?Q?497OYDROIEiOgcXOJPTeeChRIA6rOZ1HhEQ8sxTn9txRcwUwPwZFputJ?=
 =?Windows-1252?Q?+thrF0tPH0v9/RRwV7QFKTLGotQDgcF5MJUUsjydTTzHBFlORpPzufpM?=
 =?Windows-1252?Q?YkCtvpvbs/1XjNdrjnGi5jUMDw3QVq/IWZfPe3Z04dHA+E8ZwM6rBsco?=
 =?Windows-1252?Q?0sWfcorFPviwO3IX3EkSZe4cNrY2OnPRAzvalbWPP6xiSX9iHng+gkXL?=
 =?Windows-1252?Q?obh9WK8hqHPO01DJAvMobPT7Hhjh7QtILmPcbg0XkJUeEMdk9OGsEy8f?=
 =?Windows-1252?Q?t4W2NeqpeQgStXk90oJ4yWbjRLBD4eocw0WhZXRYTXkc8kbjOnH4Vyxq?=
 =?Windows-1252?Q?Ft2wxM5X4ZFictQZZE2gEVu3s5KDa+4WS2Te9q84IHhzRNXEy4QU5rH9?=
 =?Windows-1252?Q?NPl+SrB+CZgRWjrNz/KL1zf0mG8lmXmH7TZq6NgFmySXmkroXhrpKseK?=
 =?Windows-1252?Q?V1ADaV8sdygdAtchdea3zUksjrHnqdx4RHMPDMniKo9Kp3DBqpkqU1cs?=
 =?Windows-1252?Q?b5rb72GYgLZsT5SwDzrr0XSaGxemgRDs+cTy2F/zew+aIqZn9YaM4DjK?=
 =?Windows-1252?Q?AOz6fjvQiVlvIgkahvVvUNZjtSTxB1yz+oZevJPi+PU4jx7Y18azKaTP?=
 =?Windows-1252?Q?434mFfMRHKcFQeGP3JSUZFUvYJtoFYaLAQW/oV42qNeuXo2/GHmmVYOC?=
 =?Windows-1252?Q?8k/89QkN0T6IvhsItpGg0uON5QVdeF8sjjY5mTy9YfNRNH6ja5cH7Ekg?=
 =?Windows-1252?Q?+wsp6LEq1BWqdz12mJbdka2oeXO29Eu7wkfAgFYIgKfpgwJ9B9reeJ/o?=
 =?Windows-1252?Q?oTi+uip4w2fSfgSbb6VwuyKsnDsGvq/7IauMZYRKRBNjG/GDA3+zNsG/?=
 =?Windows-1252?Q?niisIUe9OK17AsXOQRo2jc/trgq6f7MgWl2TZW4ZwWVboFAfDId9hAKb?=
 =?Windows-1252?Q?7RsFKDBxf2WJl3S5ItZFbMx3S2h1eHY1KAWkfKr13/B3QGaedQyBi8Nu?=
 =?Windows-1252?Q?I7w6dMllnH/ueBk4Wxbryjn2AzVp+QFcsR96P06bjH4M5lvO9CyfEIRi?=
 =?Windows-1252?Q?2RWOyoWcpNopVVnM2F2412qowMWtdLGyVX3bbTW3y4J3biV9bE31nkGg?=
 =?Windows-1252?Q?Y7fRS17QyvHpAsA6LgfZNxdW1OnrSwNv89yygxnM26q4DQKdCHfwJZNE?=
 =?Windows-1252?Q?tnyeg+0UwAOAO0+crfMPOuaLqUu9bBQt78vLLosudIra8NvlGy/iPVIj?=
 =?Windows-1252?Q?AAi8qqKsa/DkrvtsBfludo6eWvILPgU9LHBdUZuUwVcd6DzgdaSknj4s?=
 =?Windows-1252?Q?ZyJsTeKWp3BZrePfIqURWHJ5ANaoxhMceLCDUR0Bd5ickzu1Zu2V24rs?=
 =?Windows-1252?Q?f80Mt2BAmsC1wPk+APJ3hbMCCJ7tyf4ofVhCvwR2BMCqmq5TOm8kSns9?=
 =?Windows-1252?Q?KDv2qPxMKPbOCKjJmJBDLNgb3nel7jHTIvokto2aSOE/q8p+6nSm5w?=
 =?Windows-1252?Q?=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 376532cd-714d-44ce-cf0b-08ddd677ed9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2025 12:34:33.2022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gqYG7t3qM7CJb8Jb3Q/M16t98mFX8WCqd1BVqRu/2XY0K3PLSF9jUkjaDt1vAGjpfRLjW42u11dUKH72QFDeqjs8KS3xAVq9A9SQIm6rkTWC3pGx3JrxzBQhUnfpiStD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1549

Hi Sakari,=0A=
=0A=
Thanks for the review.=0A=
=0A=
> Hi Hardev,=0A=
> =0A=
> Thanks for the update. A few more minor comments below.=0A=
> =0A=
> On Thu, Jul 31, 2025 at 11:39:58AM +0530, Hardevsinh Palaniya wrote:=0A=
> > Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.=0A=
> >=0A=
> > The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an=0A=
> > active array size of 1920 x 1080.=0A=
> >=0A=
> > The following features are supported:=0A=
> > - Manual exposure an gain control support=0A=
> > - vblank/hblank control support=0A=
> > - Test pattern support control=0A=
> > - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)=0A=
> >=0A=
> > Co-developed-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=
=0A=
> > Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
> > Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.=
io>=0A=
> > ---=0A=
> >=A0 MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0 =
1 +=0A=
> >=A0 drivers/media/i2c/Kconfig=A0 |=A0=A0 10 +=0A=
> >=A0 drivers/media/i2c/Makefile |=A0=A0=A0 1 +=0A=
> >=A0 drivers/media/i2c/ov2735.c | 1071 ++++++++++++++++++++++++++++++++++=
++=0A=
> >=A0 4 files changed, 1083 insertions(+)=0A=
> >=A0 create mode 100644 drivers/media/i2c/ov2735.c=0A=
> >=0A=
=0A=
...=0A=
=0A=
> > +#define OV2735_XCLK_FREQ=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 (24 * HZ_PER_MHZ)=0A=
> > +=0A=
> > +/* Add page number in CCI private bits [31:28] of the register address=
 */=0A=
> > +#define OV2735_PAGE_REG8(p, x)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 (((p) << CCI_REG_PRIVATE_SHIFT) | CCI_REG8(x))=
=0A=
> > +#define OV2735_PAGE_REG16(p, x)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 (((p) << CCI_REG_PRIVATE_SHIFT) | CCI_REG16(x))=0A=
> > +=0A=
> > +#define OV2735_REG_PAGE_SELECT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0xfd)=0A=
> > +=0A=
> > +/* Page 0 */=0A=
> > +#define OV2735_REG_CHIPID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 OV2735_PAGE_REG16(0x00, 0x02)=0A=
> > +#define OV2735_CHIPID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x2735=0A=
> > +=0A=
> > +#define OV2735_REG_SOFT_REST=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 OV2735_PAGE_REG8(0x00, 0x20)=0A=
> > +=0A=
> > +/* Clock Settings */=0A=
> > +#define OV2735_REG_PLL_CTRL=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 OV2735_PAGE_REG8(0x00, 0x2f)=0A=
> > +#define OV2735_REG_PLL_ENABLE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x7f=0A=
> =0A=
> This register address doesn't use the macro to define one. Why?=0A=
=0A=
This is not a register address but a register value. =0A=
I will correct the naming to OV2735_PLL_ENABLE to make that clear.=0A=
 =0A=
> > +#define OV2735_REG_PLL_OUTDIV=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV2735_PAGE_REG8(0x00, 0x34)=0A=
> > +#define OV2735_REG_CLK_MODE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 OV2735_PAGE_REG8(0x00, 0x30)=0A=
> > +#define OV2735_REG_CLOCK_REG1=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV2735_PAGE_REG8(0x00, 0x33)=0A=
> > +#define OV2735_REG_CLOCK_REG2=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV2735_PAGE_REG8(0x00, 0x35)=0A=
> > +=0A=
> > +/* Page 1 */=0A=
> > +#define OV2735_REG_STREAM_CTRL=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV2735_PAGE_REG8(0x01, 0xa0)=0A=
> > +#define OV2735_STREAM_ON=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 0x01=0A=
> > +#define OV2735_STREAM_OFF=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 0x00=0A=
> =0A=
> It's a good practice to name register values with the register macro as a=
=0A=
> prefix, with "REG_" removed.=0A=
=0A=
This is not a register address but a register value. =0A=
=0A=
> > +=0A=
> > +#define OV2735_REG_UPDOWN_MIRROR=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 O=
V2735_PAGE_REG8(0x01, 0x3f)=0A=
> > +#define OV2735_REG_BINNING_DAC_CODE_MODE=A0=A0=A0=A0 OV2735_PAGE_REG8(=
0x01, 0x30)=0A=
> > +#define OV2735_REG_FRAME_LENGTH=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 OV2735_PAGE_REG16(0x01, 0x0e)=0A=
> > +#define OV2735_VTS_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x0fff=0A=
> > +#define OV2735_REG_FRAME_EXP_SEPERATE_EN=A0=A0=A0=A0 OV2735_PAGE_REG8(=
0x01, 0x0d)=0A=
> > +#define OV2735_FRAME_EXP_SEPERATE_EN=A0=A0=A0=A0=A0=A0=A0=A0 0x10=0A=
> > +#define OV2735_REG_FRAME_SYNC=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV2735_PAGE_REG8(0x01, 0x01)=0A=
> > +=0A=
=0A=
...=0A=
=0A=
> > +static int ov2735_init_controls(struct ov2735 *ov2735)=0A=
> > +{=0A=
> > +=A0=A0=A0=A0 struct v4l2_ctrl_handler *ctrl_hdlr;=0A=
> > +=A0=A0=A0=A0 struct v4l2_fwnode_device_properties props;=0A=
> > +=A0=A0=A0=A0 const struct ov2735_mode *mode =3D &supported_modes[0];=
=0A=
> > +=A0=A0=A0=A0 u64 hblank_def, vblank_def, exp_max;=0A=
> > +=A0=A0=A0=A0 int ret;=0A=
> > +=0A=
> > +=A0=A0=A0=A0 ctrl_hdlr =3D &ov2735->handler;=0A=
> > +=A0=A0=A0=A0 ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 9);=0A=
> > +=A0=A0=A0=A0 if (ret)=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> =0A=
> No need to check this here explicitly.=0A=
> =0A=
> > +=0A=
> > +=A0=A0=A0=A0 ov2735->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov27=
35_ctrl_ops,=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_PIXEL=
_RATE, 0, OV2735_PIXEL_RATE,=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1, OV2735_PIXE=
L_RATE);=0A=
> > +=0A=
> > +=A0=A0=A0=A0 ov2735->link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr, &=
ov2735_ctrl_ops,=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4=
L2_CID_LINK_FREQ,=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov=
2735->link_freq_index,=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0,=
 link_freq_menu_items);=0A=
> > +=A0=A0=A0=A0 if (ov2735->link_freq)=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov2735->link_freq->flags |=3D V4L=
2_CTRL_FLAG_READ_ONLY;=0A=
> > +=0A=
> > +=A0=A0=A0=A0 hblank_def =3D mode->hts_def - mode->width;=0A=
> > +=A0=A0=A0=A0 ov2735->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_c=
trl_ops, V4L2_CID_HBLANK,=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hblank_def, hblank_def, 1,=
 hblank_def);=0A=
> =0A=
> Can you run:=0A=
> =0A=
> =A0=A0=A0=A0=A0=A0=A0 $ ./scripts/checkpatch.pl --strict --max-line-lengt=
h=3D80=0A=
> =0A=
> on the patch, please?=0A=
=0A=
I tried to keep lines within 80 columns, but in some cases a slightly longe=
r line =0A=
improves readability. I=92ll revisit these and fix where possible to follow=
 the style=0A=
guide more closely. =0A=
=0A=
Best Regards,=0A=
Hardev=0A=

