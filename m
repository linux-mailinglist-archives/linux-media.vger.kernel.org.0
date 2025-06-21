Return-Path: <linux-media+bounces-35525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D04AE2892
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 12:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34BD117D306
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 10:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCA21FDA6D;
	Sat, 21 Jun 2025 10:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=piap.lukasiewicz.gov.pl header.i=@piap.lukasiewicz.gov.pl header.b="MhYOc/gd"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2126.outbound.protection.outlook.com [40.107.21.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A57194A44;
	Sat, 21 Jun 2025 10:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750501289; cv=fail; b=UYeMHjTTfInOXfJXpS+MKBay3vArlKuGItV8k+AHxcxc1sT+iRYFF2d/Vsrm3C8cb/bC+sTvLJmceCnEiLuSuXiA+bzaLH2oTw0zpuu9qF5Qsu6CPBVtCGM6xxGdp2M8LEa9EfwhjcuOG7eu8aWLCEGRuXjLpaTyY8KFBZbAb8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750501289; c=relaxed/simple;
	bh=9f2dQSUN7ykpUD3myGXKK+zInI4biB7QhITqn7b244M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XHBuMCn7HA0the/XwDla75fgTaK1Bfz9aUTnNrwQEbm42lgqRdgX5h7yzrzCxKuPF2KVxtYzO9twfcKy31t+EU4aBgD6Uy7GT2y0So26TWJFUb0lOjAfKcbu67jdU8bnRxM5LpeF1kGteJ0HBbNJiv5eWH34hIx0hN13ymxRq3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=piap.lukasiewicz.gov.pl; spf=pass smtp.mailfrom=piap.lukasiewicz.gov.pl; dkim=pass (2048-bit key) header.d=piap.lukasiewicz.gov.pl header.i=@piap.lukasiewicz.gov.pl header.b=MhYOc/gd; arc=fail smtp.client-ip=40.107.21.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=piap.lukasiewicz.gov.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.lukasiewicz.gov.pl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQpog7VcMWeXna6tL6+CiHq1ZnjVCNGWOKIV0mqcNe0cc76ceCpbb1wgqQY/R5LoMfazgnA6d0fXDu/5u8f5dJiLjWXTvij/EwyY/xpXcIq8fxUHWRpySGY7dR62XcH8lHX+Yz2wEG2XM368nQN4wnj/ld/4ojzBF3/2T7lkrPDNi8q1/LKb2am7FNbraBFLYCFcYIaDd43tTVjWH6hT6u0BoKs894qUiIZ42Sc15RQPaJxvlHd/ok3itZd4yP6pecDX0ZWYvMcTM0yZYYJmIErBa3RULKMQRhWVJLJXxF3JKmBUKuf57Gj1kiJpB3VaGqMFVMEJQi2rbUfyzzyEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfJt4qcdXYE4c0YD47FJCFrMQ8hwNC72V/FFROPDrBc=;
 b=IW6mEzcxFsVMQaas5CiJV32tcv2NYqRiPb0SRfGrwpv1OSmUPPM/pw6PJAxWNCAougVBolpWtdiCfMDSma7qwqNwF0s2Y2QnEeHTt8BgLwiJeQQHqoKbvYJ0v32UdMtVlZc/5XBN5PHVV0CrBjCRSJ7y0zOxu3ABge8/uMMqpOwj8s/VmHmkiXxf5JGcFvO2X5xjYdBnTjqw0fT2mnYbLZDEYBfez6Qz6X4Vcdy7JeGqexD5n6iKRCPP9h8IJ6xFAB4PSwCkP/gDKmUTOZjazglH/BYQ7gWre9y2NLeL9MGeRDSe3jXoYn8vOme+/2O5pK3FRXd5TKOtq2zp7S+1qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=piap.lukasiewicz.gov.pl; dmarc=pass action=none
 header.from=piap.lukasiewicz.gov.pl; dkim=pass
 header.d=piap.lukasiewicz.gov.pl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=piap.lukasiewicz.gov.pl; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfJt4qcdXYE4c0YD47FJCFrMQ8hwNC72V/FFROPDrBc=;
 b=MhYOc/gdWsq18dz0J9zq60ywDwh4HpIK+UMIXZ8IuODzeSylz5eAgISogjlcKvWqQ0Lffwr88apNJBofu8bH01O08YThJVEoIXUiHATrvxI5J4Rh2YSnDxgnDo50nKOQxERZLqQ9BvoD6pqE9g9BLcKBny2BecnDoJSTG/CXSTP8I9sQITDFfNc5dlxsWR+7yeNAkHlryJ5jIOb1amPGfmS71zFE4LvVucHjR2oIdo/nOuYbVA/wgMvTZyoYpIYzRqCHZIclJ+x0B16RvhKAfaHBOGGsy13za84c83/NInNsiAJ6fl7hoWFd34GAYkkkJUgxM7DZHzTN2d8QmDF2Ew==
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:155::18)
 by AS8P193MB2110.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:40e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Sat, 21 Jun
 2025 10:21:21 +0000
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::5128:6404:88a7:d524]) by VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::5128:6404:88a7:d524%5]) with mapi id 15.20.8857.021; Sat, 21 Jun 2025
 10:21:20 +0000
From: =?windows-1250?Q?Krzysztof_Ha=B3asa_=7C_=A3ukasiewicz_=96_PIAP?=
	<krzysztof.halasa@piap.lukasiewicz.gov.pl>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "jacopo.mondi@ideasonboard.com"
	<jacopo.mondi@ideasonboard.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH v1 03/55] media: i2c: ar0521: Use the v4l2 helper for
 obtaining the clock
Thread-Topic: [PATCH v1 03/55] media: i2c: ar0521: Use the v4l2 helper for
 obtaining the clock
Thread-Index: AQHb4UQUycT+dhzDhkW3705SSIZWj7QNZwCO
Date: Sat, 21 Jun 2025 10:21:20 +0000
Message-ID:
 <VI1P193MB068579285B70F3B7EECD136F837FA@VI1P193MB0685.EURP193.PROD.OUTLOOK.COM>
References: <cover.1750352394.git.mehdi.djait@linux.intel.com>
 <193004ef9f9ace1b4c1289da7bacbee5adcd5ebc.1750352394.git.mehdi.djait@linux.intel.com>
In-Reply-To:
 <193004ef9f9ace1b4c1289da7bacbee5adcd5ebc.1750352394.git.mehdi.djait@linux.intel.com>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=piap.lukasiewicz.gov.pl;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P193MB0685:EE_|AS8P193MB2110:EE_
x-ms-office365-filtering-correlation-id: 08b85dba-785e-4d26-a112-08ddb0ad5df9
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?windows-1250?Q?IxdFEdmxsj1RpDAAI5bPhWxR7XZJY9I8lSRSBP1zDUdZKdLFYDEXRFb1?=
 =?windows-1250?Q?gjneAr1EzsNcyar/1NYwWTso16+U/jkC0/hFM42xNOmZEUgbfXzk+O8l?=
 =?windows-1250?Q?SlmE7Ony7Ipd3ylfN35Cm2FVT7RgwRv2vEClwqP5+cDTilK9aWVUmfy4?=
 =?windows-1250?Q?nnczo0Jbc8ZvwD05btRnEiro49X/Jh+ypXI94BwYPibXXfIoxqAT5kyE?=
 =?windows-1250?Q?tUSVHIYJICK5GcYAfD6sSffK8gCCbSybOB96Kn7eMVtH+2N+zzCHIFX0?=
 =?windows-1250?Q?6tl/IB7l5TwnBa7vDST9j5DvAv+D6/KeIUlvVZuEY2cVUOHB8j6Kc37e?=
 =?windows-1250?Q?AYtMZTRaSfb75H1IZwh1RDLVSzRxtE0mSXlzmjiVDBAW6/WUpKn8PhMI?=
 =?windows-1250?Q?nycFn2VY7HD4KsaVK7BovsKaah4BxmfTR5z06MQCAh3gP78/y21Y/PnH?=
 =?windows-1250?Q?GTuBseuKP9X4hRqY+uSXoXnwTlnjFp8HwQpQNqL/xo3/T9BptP+nQeZ3?=
 =?windows-1250?Q?2nqAoYmreU/cyGkk7HSXyfvHPOw+VfzBNMGeJvwkyEoVdRqMVkJgUevH?=
 =?windows-1250?Q?B/Ru4QRA7ltMNyBG+yoB+p2yxGEYGqol1iH8UiIHN4I2SnnIqPWX1aFc?=
 =?windows-1250?Q?uFzgEgksXonSe/RIF+Vd+ILAuSB/FtlExVei3npYYDUVmxYLjvpNMLUU?=
 =?windows-1250?Q?TAfGrynXsap87qheTAQbqIZpwrk7Y9ntAVbS1TJkUQa7JYsKU61pXx6j?=
 =?windows-1250?Q?ro3hkxuQ0jAqJdAHr9ljdo5XSeYOKOyAFE/4WPazL5L7VRJZfhC1mGy9?=
 =?windows-1250?Q?C0MIiK7wOHzSUYGYoq1BCUCtCmFDnWHl/NJh8SyWf2JQ8L/4R8qWXqqz?=
 =?windows-1250?Q?apOTM+XXpGHoYHYt670pITTjSxUQ+YcvpuxmD+E8mf4ePzoNDWD7WiEk?=
 =?windows-1250?Q?chEUWZ4FhDWTOVF3XIWehqpOA10ofpIxchQ3U2LGdtV+iaTh6dJwIMjZ?=
 =?windows-1250?Q?5c5Hav0BgiuPjvS+/r/DJKQH2yGGyASKc96ABCmOvDSwKyQrwO/y7qMc?=
 =?windows-1250?Q?k+4OIrJYYRVqHxcFwaRorCHGiZ3L6LUu+OZtgCEM7w/bySdv3rJO9xxC?=
 =?windows-1250?Q?aUeJifwC9HNxNed5o4mg46saJP5vtP6lXR0cfq5J+FJ9scdcZ6n+aELX?=
 =?windows-1250?Q?XtzfRUV2m4a0E4sYE+Z2huM+hdKQwyVFRgHexQ+yCV2BwJ8LXeIR32um?=
 =?windows-1250?Q?YkIQM6PDWHSPrrEUI6lJAGWYNHrXsAAB8zKSkUIvXaywiV2xaZtehyX0?=
 =?windows-1250?Q?jZO7y1Re6jTvv2vgjDGRSsa2oWvGsMpggUmvPIGYwGB/ttplAO/WPjkT?=
 =?windows-1250?Q?c223HQ05FPqa7eSZFPRhovbUzO9BNxxe+zEgVzUDWR59iczSEBBsPqFQ?=
 =?windows-1250?Q?bxUzpWemsotod1tS9kPuNX0sUxpjrJPst3Tkh1cle0Gejco3L/gjSmIR?=
 =?windows-1250?Q?wy+/Ikh/E2dN6h4nPQremMAKwmlmLnP86LQi3ixVf4RxrSHkme/2yqug?=
 =?windows-1250?Q?Q1nPICPJO7koz6EvHyel1fST6LpQdIsUjFA6iA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P193MB0685.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?windows-1250?Q?45ALPhh80hG3HCGWbuZEJnbVZDx9d+FelcfgZ+LBzHyEMI7JlB+QruNg?=
 =?windows-1250?Q?i8xtlom5UwfvJvNCLEA4S+vAmeNlzjeDF22qCuABd1ou1dd6Z35c9lb+?=
 =?windows-1250?Q?uIi2rxgKSdLPnDob85HDkkXRVsxVfoRpObaNlBsTtCYZNQf3U7Z3y8Rx?=
 =?windows-1250?Q?xhsAcqiDbriqiZoMN4qjTW0WDDBJBgGVWZn6Ep4iBpB5L1fvG26kfIwO?=
 =?windows-1250?Q?K0xk+c0t8kdp4ySBrmNiiqfYrrmkTG1Zyy9ux0lfN9Rpcp/4jaafXqqQ?=
 =?windows-1250?Q?WOirDfHVaWC5zQ2NECns2SEQKoHcMHZU7YDxytOYdvSngoxFAVBu2Ma+?=
 =?windows-1250?Q?LUQxHbFMpVHhTmQ9pBSMJQbmtaNI6PblplDVkAqQK8GsLdSM10Ahh7z7?=
 =?windows-1250?Q?pBPKEf1o55WuMomSVLNs1wT35IUDlyVhBNcvcS1RrJSqkHNVIA600t0W?=
 =?windows-1250?Q?sGwdkL0qI6+PzdO9S+mwjiXxopx8vCiRp/Xyw5yMOC59Qq/6t4L7SVyA?=
 =?windows-1250?Q?tmRIm6tEKnc9VWe1fSp77ocwVMakWuE9/mbUFSfpdjFFIAUdKZJng7Hb?=
 =?windows-1250?Q?5dmWlukHFBAOBad5petos29sSANloP5cmP/vQA8LhV72odquSmeDTEn+?=
 =?windows-1250?Q?66YgCBkoNsGnTPHiFRtI+brt49ft0gHoumjh9uVTbzItMSE5wkkxhT7m?=
 =?windows-1250?Q?hPHqaIXKAF2mA0nC8UHIPZpJHtseor8rqVlWa1Tdf77E+MiDs48PXqSu?=
 =?windows-1250?Q?yTVifRluHU5TLnQrFUHITEGAOQLWZnIqd9MEosFCp2UH3DHfDGCUB3dz?=
 =?windows-1250?Q?yUgZ7+fhP5HHotxhX2oOHnzYbHcs4hoUhASEfOoBAF2/YdQRL/2flZLV?=
 =?windows-1250?Q?mA3nJUiF6hZCUMzo1C5CF8fIAQCnaFEopkFxRHx08uz9b42vuOX5MLzr?=
 =?windows-1250?Q?nzoveQHZ0iG9AmPyZ9EVE8nFn2HafEOEgRmWtqafnAX1QNvBP4zXGvBo?=
 =?windows-1250?Q?3iwviGAL39LgwG7T/jHOMeJXB5SLWiYIxnPsIT5hAqjBe5UQoDlBb4lN?=
 =?windows-1250?Q?XBVHniMSlpbM8OLVFu4UBlLhwmeV4Nn9Nn0xYFXu/xIrbY/cF9aP41df?=
 =?windows-1250?Q?eS+NqpI0PyPKffbFDAKuSGZzvU9I5a4wJOPxqExgoO0i5OY9Xczkj39h?=
 =?windows-1250?Q?iTdbxijV27+6Vg8i5iJjYjEB/BHGj6KYKii8rhdcmwOj/vCB1Yimo3HC?=
 =?windows-1250?Q?ZetWUyl3shogvdmn2ersG9gXcsNTOKRNYe+uMzyQV9L2WpVIUwKhWokD?=
 =?windows-1250?Q?SUWc2tT7MCpqxzm/X+1ch0xl1A4VK+X3BydgdBKG5S7FW2+awtfeAO+t?=
 =?windows-1250?Q?9h7h/YOSljKWA0OJ6Y7uvX+EueRcAn5yAHF80AgtDeYp2JG4iw9pqNiT?=
 =?windows-1250?Q?fzGrj3UVhPDvd25P4aCKo7u7B6Lm/52UfL5D5eXgJoJ/QsPfuXE/JKVT?=
 =?windows-1250?Q?M8+PvYEtLg5g+n53n1Ma62qqwRuLDYz+o5xuomNoBwcIxLILhM+AWKLm?=
 =?windows-1250?Q?gNEuL4BVh/xJjwaJ4rZy13NBD8Ixzg1pAep3t2H7yH1ZsSzTwDxUregY?=
 =?windows-1250?Q?ELuS7QBHktm7LWu5aO1ZWPaR1qOVZ4NqXiSr5t9Ef39VNha6r3DcuPgk?=
 =?windows-1250?Q?O1NLCVP630eVspyRr3lLuBbvsElDuDcuqrzV66bro0tABe8Q/0PMObnd?=
 =?windows-1250?Q?1WOZ0WnYy9vXu+DHEj0=3D?=
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: piap.lukasiewicz.gov.pl
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b85dba-785e-4d26-a112-08ddb0ad5df9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2025 10:21:20.8812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3e05b101-c6fe-47e5-82e1-c6a410bb95c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SQuhfA8vnnHz4yO9/M4/GexU/OfCdpzmwK5ciL/HHA0pWQ/SuFGRzEon7yISQKeTqmQhmeRHQNVczMyDHaTtofBOsz7D3SmGD07V2KkpO4x3hPgb/XPzJhtySnSyTS6ZOd5xiRFJEKT2JwZ3XsvQiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB2110

Hi Mehdi,=0A=
=0A=
I guess it's the same as all other patches in the series.=0A=
=0A=
Sorry if the message formatting is weird - I'm a bit offline now.=0A=
=0A=
> devm_clk_get() fails on ACPI-based platforms, where firmware does not=0A=
> provide a direct reference to the clock producer.=0A=
=0A=
> Replace devm_clk_get() with the new v4l2 helper devm_v4l2_sensor_clk_get(=
)=0A=
> that works on both DT- and ACPI-based platforms to retrieve a reference t=
o=0A=
> the clock producer from firmware.=0A=
=0A=
> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>=0A=
=0A=
Acked-By: Krzysztof Ha=B3asa <khalasa@piap.pl>=0A=
=0A=
--- a/drivers/media/i2c/ar0521.c=0A=
+++ b/drivers/media/i2c/ar0521.c=0A=
@@ -1077,7 +1077,7 @@ static int ar0521_probe(struct i2c_client *client)=0A=
        }=0A=
=0A=
        /* Get master clock (extclk) */=0A=
-       sensor->extclk =3D devm_clk_get(dev, "extclk");=0A=
+       sensor->extclk =3D devm_v4l2_sensor_clk_get(dev, "extclk");=0A=
        if (IS_ERR(sensor->extclk)) {=0A=
                dev_err(dev, "failed to get extclk\n");=0A=
                return PTR_ERR(sensor->extclk);=0A=

