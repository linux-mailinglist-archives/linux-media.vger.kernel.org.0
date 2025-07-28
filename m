Return-Path: <linux-media+bounces-38558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DBAB13B03
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 15:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 835B0189CF47
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 13:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB35265CD8;
	Mon, 28 Jul 2025 13:08:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020096.outbound.protection.outlook.com [52.101.225.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF25224AFA;
	Mon, 28 Jul 2025 13:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753708120; cv=fail; b=AuctMogpLEmVbZM8APIeCnAdT+lYtJLbw2ASmjsaxzB8x3nVSf2ibcfcfFlDSJd4W0yJihrT60mNL6BszNNVZ69uz6ckYwnCPRn9qRfJj5k7AfTsZhnW7j9QcLHxRT0pHwY7xrmnEri/heEKB5yzhMJC6WFmcFLHqFfQNVuJEK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753708120; c=relaxed/simple;
	bh=5vYiOw1Qev557EJF4SHWs5QvZQgGQNCx0NOYLGSBhTI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h901Ve1cE3mKUaq07zgRP4BYlxl3YqGvZLtGRhU278iq7sznp1T4PuvB/FnjlpqqZBbxVVUF41U9S2NodsSiMrlFbeneydATfqwBsROfdLtk/PTcFMekBZl4p4QJbB+lgqSYvg2/Mg6PZgyR06vkYeNfoLuVopqwyZrp6q6kCVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4T5cMuLLGt0k3SIFf9veg5NFIvw9fGju2EeG4xb7ueCWZjnDbW8nCWXO+U0zjA400eVPWSL/JSLFz5WhVZaO17gQ3CEhIeCMqeINdgX2oS1h/d5Dc41iQNeQDFTO6b2y1gfxpC73M48HH5U0Up2CDQBIw0JEdvM9GT4JDjwf6bKmfPV8iTTe5v6p+a079euHdtAXEyHzM1nmWlf7+0Y0wPHQcROMjY5h2bIg4N3MN7r6ZDY39q2ijNwiQxWgtbSHHX+CSsWmyiJhBWJ2FU6Ee0uKLyeZqHaDegHmywkgG+gOMWhvza69fSVCKA4rXIj/KRbN6zCnV/icVv7U5PsBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mv+djT5+dFut5lTOuvPwtC2gxOFtnr2ebab9ypWjREY=;
 b=iZ2hNRZbZMlrqUG0xbl0O8S0SgwH4UmSj5KBYg9CcmugtXxtvl7BfleSGVMll81mtkPxF+nxEW1knz1YSJKAVOPl86/1d8csJHfnNbmGl+BWgCcjLSChrS0DO8/zlaXyY+eoX7EEWirxKyXUj9VHUAIe3mFK+scqsodWohztQwDsKCaX3e18jvl+zHq66U+wzPSCFAJhMwudjR2nWnfZ+W57n9/+P6USl6sGxm0ANiT41AHxQAxB2lA1l3fF8163E+oYNpW2iBEWXer/QxeCab011Mr2r/0PA01HNcsih/dOnatnwYXoviBZQKw0d+B9K6FXJyi3B6xYhqhclGH50Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB2029.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 13:08:33 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 13:08:32 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Darshan R. <rathod.darshan.0896@gmail.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "jogidishank503@gmail.com"
	<jogidishank503@gmail.com>, "hansg@kernel.org" <hansg@kernel.org>
Subject: Re: [PATCH v2] staging: media: atomisp: Fix indentation and styling
 in output kernel code
Thread-Topic: [PATCH v2] staging: media: atomisp: Fix indentation and styling
 in output kernel code
Thread-Index: AQHb/5slSnzPJ9sSsUGi/SkPMddEdrRHP9a0gABABt4=
Date: Mon, 28 Jul 2025 13:08:32 +0000
Message-ID:
 <PN3P287MB182915BF3339329C269573B28B5AA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250728083943.10851-1-rathod.darshan.0896@gmail.com>
 <PN3P287MB182997CF622BC072140E4C398B5AA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
In-Reply-To:
 <PN3P287MB182997CF622BC072140E4C398B5AA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2P287MB2029:EE_
x-ms-office365-filtering-correlation-id: b763f14a-511a-4053-be2d-08ddcdd7dabf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?/FSTCJ/X5A4zG24FCL9VRER1dDbzAiqWMS5ggv+WSkUeGKBv/nNxQZ4t?=
 =?Windows-1252?Q?HrYq7gyd3uPdNcTATml1R+KghqAPa19BgjoUqZVjhdE20l+mIvaIOu1w?=
 =?Windows-1252?Q?cHF943HmKgrAtMrbUs3z5BAXL+WGU04LCtVFF14IFM7sG/5evuB3P+oi?=
 =?Windows-1252?Q?gHwPmOZXKGIMyx66MjAUl4wrytxf5j9hq8oKaAtCHCMSAgBJrRPIEfPl?=
 =?Windows-1252?Q?g/jH95Oe4LnGKiIeNDSD1clwiHe2bEqsPYV2rFUm5nqq89tfVxjWH4M4?=
 =?Windows-1252?Q?nRLSQ0VYKTaEqZJb+fz+tdr0ZBJTdCkVzZohg7gcKbc34Yz7hr+t+rhA?=
 =?Windows-1252?Q?mwKXp80h52fZ/8c6LsY0J8Q4tMgMwzrnmDkr6Kmyb8bS1t9LT5Za0O7P?=
 =?Windows-1252?Q?luhFHsa0pGx6bn3CqPHiv/59P8/FIjemrCfT0GNYFmDI0kAPKi2xBFdC?=
 =?Windows-1252?Q?l9l/uTcIBMoGVX29uASNbSPl6zqfaw7pjlkK9NbAlLTXmEzgRt3U8ADX?=
 =?Windows-1252?Q?KQqR2EeMnmg92F6kJAAP9NY9eyuGSkyHCs0S/6LcqUAhC1jMS6JkjUxd?=
 =?Windows-1252?Q?kLUSg6WHoQKWVGcsA+gcSv9WELPLQPkGNP7cgnFADkJZu+PdjmxEzlkf?=
 =?Windows-1252?Q?RMVoXO2AlPbsvZsph/Iu4z9ztsoa+lvjxJIERUFxYM2syCbMNLNgnrNP?=
 =?Windows-1252?Q?ojgshAWVQTVExgtxgL7ZGYNf5049ztyWXIQTB05VSMQ8CSDawt4v4Dls?=
 =?Windows-1252?Q?nqkC9Ii+y+Fx5hUox/3gRWDWFt7pvuhs1UD6pcKwtBz8R3FweqPjaasp?=
 =?Windows-1252?Q?rdNtGD1p3BqEHfle9Lpi4GJlWsU17IEujBgLP75dTvDgWZ++0yCsNu5V?=
 =?Windows-1252?Q?rF8rxRGq3ZrR/zr4g+zRY9rKKpeYWBiCFqDK1lg6xbltdlXDzo+LL1NI?=
 =?Windows-1252?Q?OC750c7LcoTyDf9W9l6vrsV1e6LDjRpzpwvJfVPEsJ5w+JbbIZiPzPnd?=
 =?Windows-1252?Q?BC8tW64+oAgDPpn3YRXaMJHOrtKQmoAjMHgXQqUkXFefjo7DPDOqZWvl?=
 =?Windows-1252?Q?OuCfLobWRZkrwUml+JNNfcEoTzaqwfGtjTUcP8fuxhVwwfkHYq9aGeki?=
 =?Windows-1252?Q?GdR+xyw2ALe2275+Sg6xeEe/H5Jx8/+CNQ4fJrhASKVp+r4amoQvPjtM?=
 =?Windows-1252?Q?1CfbD9AjU/LHk5VubCjlGkb0ZAEb1BR4Ecr7ITb0V+RlucG0/MvIhC/f?=
 =?Windows-1252?Q?Fo9BRJ5NQVwZ9UsCWGiKqd0BLJ1TwZXWyVMdpC/AadIDWRC/KFES/xuH?=
 =?Windows-1252?Q?HODsU6V38d8LJz03NtPmFuilz58RB0zsAmxk5YbIdBOEjXt25jmD6jcn?=
 =?Windows-1252?Q?69dVXLL8E6vmD6bhC9DSjgoBTiba3IwyyBRvUlA/InVVBeQvx8z11jvs?=
 =?Windows-1252?Q?Ofb3Lbbs8mQ0QtnBUDsjDON4MWiq19GpxeX22/0j5G0GoyWXpFVnqqjJ?=
 =?Windows-1252?Q?hOOTwl49SwX6hA6tE8uBZne8HuPph2moS1rwOyrMhgFOSULq97/k29tB?=
 =?Windows-1252?Q?muZA22bu0cBVRN2GG8AWjt0XXR+rQOlEM4Pxu8o5N2H564Vyo3uVOFfN?=
 =?Windows-1252?Q?fDk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?JoLG3DyafySwqybYfdAinxtCsSFLVefLGGV7IMelzeb3Sbmv/5RdwhX3?=
 =?Windows-1252?Q?FVRDVXAGkCIzMr9lMBkFML1N7sGi8B2w7ot0OPR4Uyl2cg2HXCONvQ4B?=
 =?Windows-1252?Q?yOFhjZ1REnzhZUEOaFsicLrzZpwZ38KfJzYMHDfdp1xk4iBjv3wYAobq?=
 =?Windows-1252?Q?PlwEATT/ls91L46qq0FXHeaLwBS8gTmq2TlV3Jo6waNfgHgvnJMPjrTK?=
 =?Windows-1252?Q?35IFIYmgBwttUwHIGwBVoIvzEkth1yFkyZDCvNvMq12v1Gbi2aeXFGcx?=
 =?Windows-1252?Q?RLZYFcuFTN7z98UQrKcIQ+r7YMIiYwmnIQg9wGILu994Q/urDJY+EPKJ?=
 =?Windows-1252?Q?5+AmaVXjbWTvD1a6IsuifqB7u7hyrGj8Ld/4fsuIMXvecXRiNLeODfrO?=
 =?Windows-1252?Q?c2d55f61hwvUidI5GvYCs5KN2grd0wQFG1U1+N+9BeKuWQ4+Zy23tv89?=
 =?Windows-1252?Q?hupFAtosiz9a9W64xFs150s62YBPg/skSYrpHZf7HTf1R2Rs22anO3rd?=
 =?Windows-1252?Q?AKdbWRBGrOCfWJu/fvdi8Ryd9Nye91jjW5kIg1qt6gcrncYktqC6jTEN?=
 =?Windows-1252?Q?TMphhBuQ/3vtB4jwUNPnZNc6xacyowA/uOGXkmqw1hPhCW6mthUfc6h2?=
 =?Windows-1252?Q?xgEHkXtBjaT07kh6Aqn865jnCOFNWIgLPPy8dJrsLeJ7Pp0uQZ3kMLgQ?=
 =?Windows-1252?Q?9goL68FlGrGoIrVYK3vCZgOWp8RkLdyLYw0MaG5XRGIdYhLias/JK8m3?=
 =?Windows-1252?Q?Ki/iksEL9J66uMs1vrENUJ0x0TevP5WxYGsv1x29P4Rk1/B9BtDfrXkV?=
 =?Windows-1252?Q?cxqtzbe5L0Sqxd+7X0G2/aFWKxU908MnGtbQMb+53GQSctS2/y8KSazR?=
 =?Windows-1252?Q?dqG6aA3UcCH3lBXhvPeHzfSt9Q1DwyJuJKYm+lOmINHGIL9Qeh8urlI9?=
 =?Windows-1252?Q?R0G+REChZ8SYfb1XjU6hV/wXTYiFjKRH4Vq8u8WEZ9J4v5jsmEfd8eR7?=
 =?Windows-1252?Q?wqPwZqYbVXzceCjPFo0rcD5x8yfACANkuK1uhGek6rkdtNneH4kXnLOo?=
 =?Windows-1252?Q?i/Jb9EwtKlP+dbTxDQAuOh4cNNNzRp25Nv+DEdvYIXLL4GIUQGPPEqWZ?=
 =?Windows-1252?Q?1P3mr66hahZTvkKvxXX7qNcaDahUaa+v6ZR3ckT30l+/IOrPogRsx9hO?=
 =?Windows-1252?Q?8OF0aQEAYV1P7FJBD+gxFvHJN4/vZPUWxjgYSSMbzdvFBMw1jebUO5oG?=
 =?Windows-1252?Q?rNADIjJEEnJFR7ynGo4mai28lww1zcutTyMGTgko200QFpHZuNmnlj7v?=
 =?Windows-1252?Q?zfRWEXSwVg9z/iIZdP13YSZRUe7XEpdHEvNG/hP0z3H47FkQvw8ufuZd?=
 =?Windows-1252?Q?JPjJyW0TUHCo0uW7ThM+Vk7/ufVD765I6wqiQj0pdhxBVJjL0Ci/8n85?=
 =?Windows-1252?Q?UE0C5Ht1z+dHmBzEIkaN5+eIFlgH8tXt8wK38FATDhGFwMQI86EdmGmR?=
 =?Windows-1252?Q?MqATMu/TmwPgLXoF/N+ZZySYlhLS33sHe/h9bt8lNsOUJNbcFGtu/v2C?=
 =?Windows-1252?Q?USHCcpV7CrwX4LB4nK1qUj3Sp/eWc9/433HuoklAepnpzCfgrkm8HnCj?=
 =?Windows-1252?Q?B5cgRNtuxtEcdWCGnYvofWYDHATeljJ+BR4dwNATYqD6afUJ1nFjvMro?=
 =?Windows-1252?Q?zhm38Ic6OrVKkobMnO+bMXcNRa/oZNp1?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b763f14a-511a-4053-be2d-08ddcdd7dabf
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 13:08:32.7875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /1/SICG3PRxvFLd/uuf2/713ABkG28Ng64tbGTJeIqqkMWINS/HRhgz+ueqKud/wpJbZd/cNsBXLup5sLKgkIdDn2d9q11BlZh3LnFp81J8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2029

> > Update formatting of function definitions and if statements to match ke=
rnel=0A=
> > coding standards. This improves readability and ensures consistency acr=
oss=0A=
> > the codebase.=0A=
> > =0A=
> > These are non-functional changes intended to address common checkpatch=
=0A=
> > warnings and prepare the driver for eventual mainline inclusion.=0A=
> > =0A=
> > Signed-off-by: Darshan R. <rathod.darshan.0896@gmail.com>=0A=
> > ---=0A=
> =0A=
> Whenever you send a new version of the patch, you should include a change=
log=0A=
> below the --- line. This helps reviewers easily see what has changed from=
 v1=0A=
> to v2.=0A=
> =0A=
> I think the following document will be useful for you.=0A=
> Link: https://www.kernel.org/doc/Documentation/process/submitting-patches=
.rst=0A=
>   =0A=
> > =A0.../output/output_1.0/ia_css_output.host.c=A0=A0=A0 | 22 ++++++++++-=
--------=0A=
> > =A01 file changed, 12 insertions(+), 10 deletions(-)=0A=
> > =0A=
> > diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/outpu=
t_1.0/ia_css_output.host.c =0A=
> b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_=
output.host.c=0A=
> > index d09365e0c471..4f84c6d3622a 100644=0A=
> > --- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/i=
a_css_output.host.c=0A=
> > +++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/i=
a_css_output.host.c=0A=
> > @@ -34,9 +34,9 @@ static const struct ia_css_output1_configuration defa=
ult_output1_configuration=0A=
> > =0A=
> > =A0void=0A=
> > =A0ia_css_output_encode(=0A=
> > -=A0=A0=A0 struct sh_css_isp_output_params *to,=0A=
> > -=A0=A0=A0 const struct ia_css_output_config *from,=0A=
> > -=A0=A0=A0 unsigned int size)=0A=
> > +=A0=A0=A0=A0=A0=A0 struct sh_css_isp_output_params *to,=0A=
> > +=A0=A0=A0=A0=A0=A0 const struct ia_css_output_config *from,=0A=
> > +=A0=A0=A0=A0=A0=A0 unsigned int size)=0A=
> =0A=
> It would be better formatted like this:=0A=
> =0A=
> void ia_css_output_encode(struct sh_css_isp_output_params *to,=0A=
> 			  const struct ia_css_output_config *from,=0A=
> 			  unsigned int size)=0A=
=0A=
Sorry =97 the indentation got messed up in my last message, probably due to=
=0A=
the mail client.=0A=
=0A=
Correct format:=0A=
void ia_css_output_encode(struct sh_css_isp_output_params *to,=0A=
                          const struct ia_css_output_config *from,=0A=
                          unsigned int size)=0A=
=0A=
Best Regards,=0A=
Tarang=

