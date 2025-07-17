Return-Path: <linux-media+bounces-38022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5C3B08E43
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 15:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A3A317498E
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 13:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750942E542F;
	Thu, 17 Jul 2025 13:30:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020105.outbound.protection.outlook.com [52.101.227.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766FA2B2D7;
	Thu, 17 Jul 2025 13:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752759058; cv=fail; b=TTtsXO4z3bwPo0IMtKtl+gS5Tn93raDFpq7zcBuBYlUEXPQ2ns99RHtMBh1n3EdzSrVVFKvRZfnhqFn6cPr4Q5tWaYADLxOSUw/B8xwJKuIodQTXytF5qjXx4T4sRTu0OHLOv8dUBiEB8VcKskSiiYA3JjEOLYWsicXnppZhGRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752759058; c=relaxed/simple;
	bh=0Gw3C5wcwB125UEleC5/xhy0qoEsRM8lpvPPKztZ2fQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lNnVKxkppcI6SoxKXRoBLkHqZcRCg60YyPXEph3KXihQUAJRHH1bMi4RevosWebrNyFzSniFAxH51DSRbm7x/hKpbeAOF4Mg65NjuT9It/eleMwgApIm+kH7ibxoNAMTj/ettrm+2sbtIUuUA8rR9b0GjQ4F0G298NaLbdxoYig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TehRt6JKCCLap4wN9TkrTUzRfR66C0lYDaH9FZLqQWVnrAgLijEpXqkU9AzLnZgdJSbDrD8mo+oXGPfjsnMfNXpABXThxffMjtCbeKDCSqVajmZUqvh44F63H/xx3otZ+qtUHU5XnTOx7AdG0Wpw2og9SDC/b1M3b002rnR0rn8nVBcu3AFQvpe2UWzxEdCpjQLIDO1F+3X/KiUBPcemGQbIU2geWPJFMKzRmrOpY8Qsi9lWQgQrLGJtKud+YdkEusCiChpq6jd/LKQC0LZ6OZ6vPzz+BHfMxFAOPfWQG5R9BHO6Iu11xDarb6G33sE4kdCEID9D8zAg+0frcq4ahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Gw3C5wcwB125UEleC5/xhy0qoEsRM8lpvPPKztZ2fQ=;
 b=lMrx2c95sjszZrSk5NFDK2GIP1Gn2f+0jFOPBBMpTPX5ZrsnS2tqOany7o3fNIFpbUAoGbu45LZ3dEZ8uK8EOkO9/WrlhsP3Z4qimM+jUkeetonV2IJfmkEZuW+ykVzcnsPtnsopFCp5QGvXwgI3YNoiGWtxT2qqpel9i8LItS3kzqp3wTNLOtofbrPf2oyA3XJodAxsf/OjgGFx0vOo8u/p26xdl7x5/ki4Vx3EqgD8touRL7tnkv+CKIXQkJXk+unLEzJf+RX/lBpp+MvNF3fURPnIgew5g/edKTb2F+QopSNW4bcHu8u+uWjNoRIUNCo3GcZ+mSjm29nVae8NBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN2P287MB0270.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 13:30:45 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 13:30:45 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, =?Windows-1252?Q?Andr=E9_Apitzsch?=
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
Thread-Index:
 AQHb9lfYoS/wf6j50k6uH/8lXesHXbQ12+aAgAAPulGAADvEgIAADtaCgAASvACAAAf3hw==
Date: Thu, 17 Jul 2025 13:30:45 +0000
Message-ID:
 <PN3P287MB351999B4DB533CCA9C6E6567FF51A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250716134426.8348-1-hardevsinh.palaniya@siliconsignals.io>
 <20250716134426.8348-2-hardevsinh.palaniya@siliconsignals.io>
 <20250717-hulking-earthworm-of-atheism-68a02c@kuoka>
 <PN3P287MB3519C2A2B8DC207AC0AF2C50FF51A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
 <25eb573c-a37e-4f8c-8fd6-5ca62e1a29b9@kernel.org>
 <PN3P287MB3519907E3C113D6CD9D564E3FF51A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
 <8cdea7c7-739a-4101-9e2f-1bb36632ff5a@kernel.org>
In-Reply-To: <8cdea7c7-739a-4101-9e2f-1bb36632ff5a@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|PN2P287MB0270:EE_
x-ms-office365-filtering-correlation-id: dfe24f6e-a67f-414b-bc05-08ddc536227c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?fEnZc+ufsr4O+XNA6XXZjUnqHeDyZB+3XbMbnfu6qN38f6Fy9y5JN+RU?=
 =?Windows-1252?Q?fTf63tVw6ug6BG7H/aLohjtX6aon6t3hkfn2Zly4TIm2D2TrYD9mMucQ?=
 =?Windows-1252?Q?iG0m8w5m4tKpaTfv8RyW/vSAcOgtCjY3kid9CnLwzSWZC6ik89uLsQBH?=
 =?Windows-1252?Q?xaspYcvhORGrM+hhP8dYYbS64f85SdBQSDqCGq4Km9Js2wxLM5YNDla8?=
 =?Windows-1252?Q?0sSR2Dz3DZNIdjkYnzVIxv5ABe5fFOi5t0rUbLCr99QeRgga/08RviHJ?=
 =?Windows-1252?Q?NSoTk8EKqBEISzwtSsZgcn70NzR77UHmDKWxOLdfotS7wAWsO7c3lP2V?=
 =?Windows-1252?Q?gH7H4MN119140lzK9aCyLFOBuVNH26BdnfA8PYbr8QukLBgUt3lkWkY0?=
 =?Windows-1252?Q?PkGkIwWxRXV83HVb5TM1Iy8bl/ZoZ8YUlJomSXaN4qbNY//B3LRLxcBg?=
 =?Windows-1252?Q?W7HfZLpvrILU4HJ/XHnIhZVgF5ifkqc1H9lS+1hw7lZz2ndVcqtric0T?=
 =?Windows-1252?Q?nZPO0KxiczKl2lgrOJ5fW8dXYEbUqMjSgrNfEfWUO1lrj2XeHBY2C1cR?=
 =?Windows-1252?Q?wdcsqsg4aQWjacuYhbX2pVhBQGNaU4Yl3ORx7zTS3r4cu2YFqBYR3EO4?=
 =?Windows-1252?Q?wvMDSKQmOm2OE4ghk942dAhyBzCDpZLrUsvvFunZCMeE1YzYZLpIRCw5?=
 =?Windows-1252?Q?al6KXu8mt0Us9p75nt2c5jg1b/nQoA+KB8E628EwC69n9fEny8cgvBOZ?=
 =?Windows-1252?Q?hblmbWRnEij3MRcbLhs6FzoT8uwnHEfhwcrphbQuTj7KYCrk5WAroxHO?=
 =?Windows-1252?Q?UGiWu19CqZwPFrKBzCFskP7FiPFfp3A5ZPmNVjf2FDOMn+btWg1b/OIV?=
 =?Windows-1252?Q?3xE3cagxG8zpwcPV0tGzKkGQzTFBUfPvToc6nj4MORSuTkk5tFe63xeA?=
 =?Windows-1252?Q?Oe0nfq1jEfmXMGOC4PTaUTsGtcrHyimjKzo1tQoinMUKhpPU1jiKpstv?=
 =?Windows-1252?Q?MNY7nYQ+rDd3VWZ7SV4umxWNU/X9GbMnfnHepjLMn9Uqh0CeakanipHX?=
 =?Windows-1252?Q?bLy2938Z/HTLbqhZ/qwLR8m+Fl3bCWovPbHcdlYYBAt7Lc7vnPUHmWVM?=
 =?Windows-1252?Q?muRJQTcZqVqDPmq7iuW+eZXEIGOB3RdXqjqBJ1EWZOLzJdyBAhP3Zrma?=
 =?Windows-1252?Q?cVH+q4JGLXJ8+75B3PTwsVWSx8KNue8Jw3PfOnyL0bYghqYydRsf1I9g?=
 =?Windows-1252?Q?Trpn/y4S4B1FsfWVIeO8ZDiS7DOpd44w4OVMwn8ojTm5Sf3/htP6BGGq?=
 =?Windows-1252?Q?Z9QMI9+ml5eXrtGVYNE5Oolw6DVvsAck2hNkoNpE/iaXLOm6vISyiNX4?=
 =?Windows-1252?Q?zZKVeDP2OvSTVXtkK+g6lJ12lDR5b6praAs8UwXKcJUH3te7rLQCCmb2?=
 =?Windows-1252?Q?XWa41s5fvax7hMAovJ9xJ71mOEVvgdq2v8GLbliQJqS39SdHTT9zhB4E?=
 =?Windows-1252?Q?qrjmWcjag7G4ZS8vKTv/jiAYJNmB5REccnoDQlFAhjTjjszS+EYcYoy5?=
 =?Windows-1252?Q?LfCs9WD+tcmoZcfl4y6e/VbzBsQ7JwBX8cX83IflntK60mXxS0q+hWng?=
 =?Windows-1252?Q?esc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?LgPTIz0PLzlNel9g9C4P6dVFax81lEtd6shDpx3aA7A5tvjCV1Ithsqp?=
 =?Windows-1252?Q?I4eDVdZ7Y+nSFiKTJlf7Y69EdG7omBEDhIJ0CzDh4OFwXJb/5vFxCHgb?=
 =?Windows-1252?Q?cJIUDWhhhZRlSwYhOf8EM8d4JEwWKfOt+TcF1hQ4wc10slsSHOfqQPQ0?=
 =?Windows-1252?Q?2SigQaLgW7Ofgg+dvnc8zNIEs8Gfb+FUbA1+fPQP+OQk7lfq5nbA+lM4?=
 =?Windows-1252?Q?0lmoeNsmCqanveGW4vOlXPcZFQ1f0F75W7MDIF9hvtnIK4qrtdLEzvcy?=
 =?Windows-1252?Q?Gxn1qZNnXYGFSVlgrebx+Zra/g1yVnmb1ifCM0ng5r0ObZ5kgcB3d2fd?=
 =?Windows-1252?Q?tMQEM3Uu82AK08SpJ69D87/daBtXx996qSGzmVT0td0wlnhWZxAX85sg?=
 =?Windows-1252?Q?GZfY2UDtgegA+hleFl75NFUX/gPbbDKP5/ZK9OdiJaZvfioi1OMD22pH?=
 =?Windows-1252?Q?tHkEcVB+A6CldsgFMB19R/WWPyS0x+wPVv/qzR1i7WQnSXMzq10y+JRI?=
 =?Windows-1252?Q?pvmdE5A4wtlhOmt0WP5vF+01JMg1y6a5PKZcMrGpdAlKzWwQWjQgfghv?=
 =?Windows-1252?Q?36dGCDy8qy/4s1Sv6zeDeFqaCONLgZ+o0Q0mY+8xK7WYsAhO0fCubezy?=
 =?Windows-1252?Q?QB8916Hw9HeO73Gr3IUeZZW+Um408VTWUMUzKDTkV8/VTFNQvMtNmThI?=
 =?Windows-1252?Q?TLoFNSwHZJctlUwK73Mk+5gOFuqT9vpUL9AbCMYGFdbV10Bhc/VVYI7f?=
 =?Windows-1252?Q?gQdlkYVNRybOPcOcMAScocH6AWZPWYAbo+u1PsrKXtMXD5PiJfWT4J+V?=
 =?Windows-1252?Q?KHKRgu5rAEgmkg9FtpggyGzgEqZ3CnhkIHU8vV14xJVjLnJl3yE4KynC?=
 =?Windows-1252?Q?iXtN7uHD2BcikZ3Wd8sUUCBwpHE/wyhPO+JwAeHA2ICEvtzvElLOsJoZ?=
 =?Windows-1252?Q?i0n7+MMXFNqSO+6DskZ8UGNMMbH2VGLo0R1TqOsKD85v5wMcJXtz0HOu?=
 =?Windows-1252?Q?Mw2239eBBblhJGSe/oEm7ijOSbxfRQmqwg7hYVluJFjqzu1HJqBqUckV?=
 =?Windows-1252?Q?pd956I2m8xNzMhTAuEsPQiGMM9LzFaNu/J1BNr9NLVRH6XPkIQk0XKSw?=
 =?Windows-1252?Q?HbhGIlaFXqGfoj7HNIh5Nvqbo8EGoXSID/RpV8e0/oPQ+ULqtLZtKMSE?=
 =?Windows-1252?Q?LZgmWAzeLFGFWTpy4Ds1XEViZf3cdatnihO/323MehRBGUefZGTMLnqC?=
 =?Windows-1252?Q?2JEj5aCZMNiChzoejAJDakMl6YFLDeLBP1d0eN0zTGsRB8As/kuItpJ1?=
 =?Windows-1252?Q?VEuMx+HMuh7RNqx5wiUnu4WhumO4zU3R6Mt2d/bgFi2HW8g4QYWBpRu9?=
 =?Windows-1252?Q?eNdjuvKCuF1cK2eQwUiQ7/AZo91YLJx3SVEUcvRfOG/jU+Bdrx2XrPSf?=
 =?Windows-1252?Q?3uIPBwfUKb6WigY2i1K3yX6fwFQZ3CJNhFG2AX0mYON4LWd2f14WZOOn?=
 =?Windows-1252?Q?vUKavwoKJ0e7rFz5D3/jacM+fwjiFJlBWY7lhzg9IxyKkx8EY0sTtA9K?=
 =?Windows-1252?Q?FpeWQ4hpq9AryjrZEuUT+U0zT/8yh87UtSI6DtGK5ky+yApoQbjcIqMo?=
 =?Windows-1252?Q?MZZa3D5tkvmNgiYnNQ6HIcZXMo0L4AJmGT8WHe9MFTlCQ5k0vMcC1dhp?=
 =?Windows-1252?Q?7yp0OFPrhz3ffmlnCL8lIKsGvgK9HJHozNJE0PIWeImookFRAMlFYrqX?=
 =?Windows-1252?Q?tRMC3nxcz07okBD9JI8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe24f6e-a67f-414b-bc05-08ddc536227c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 13:30:45.3506
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GD88zw/mYQJm8nj6m9f65YRKDQCODcS3t+aS25dzdWn/BFKr0T2dlp+qhk9P1b5b0HX6v9NaBLJsuqK3kukdxBbpJxAG8dB/zUwA0AksdYB+DQ/KMQIebyrJmDdAGbfY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0270

> On 17/07/2025 13:55, Hardevsinh Palaniya wrote:=0A=
> > > On 17/07/2025 09:28, Hardevsinh Palaniya wrote:=0A=
> > > >=A0 Hi Krzysztof,=0A=
> > > >=0A=
> > > > > On Wed, Jul 16, 2025 at 07:14:16PM +0530, Hardevsinh Palaniya wro=
te:=0A=
> > > > > > +=A0=A0=A0=A0=A0=A0=A0 properties:=0A=
> > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 data-lanes:=0A=
> > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 items:=0A=
> > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: 1=0A=
> > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: 2=0A=
> > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 link-frequencies: true=0A=
> > > > >=0A=
> > > > > Drop=0A=
> > > > >=0A=
> > > > > I don't understand why this appeared. I don't think anyone asked =
for it?=0A=
> > > >=0A=
> > > > Laurent suggested validating the link frequency in the Device Tree.=
=0A=
> > > >=0A=
> > > > Link[1]: https://lore.kernel.org/linux-media/20250710212131.GG22436=
@pendragon.ideasonboard.com/=0A=
> > >=0A=
> > > ... and I do not see here validation "that the link frequencies=0A=
> > > specified in DT match".=0A=
> > >=0A=
> > > How do you validate that 1111 Hz is not / is a valid link frequency? =
How=0A=
> > > did you exactly resolve the comment about validating?=0A=
> >=0A=
> > In the ov2735_parse_endpoint() function, the driver validates the link =
frequency=0A=
> > from DT using `v4l2_link_freq_to_bitmap()`. If an unsupported value lik=
e 1111 Hz is=0A=
> > provided, it returns an error:=0A=
> =0A=
> =0A=
> But that's driver. You said that you added this property based on=0A=
> feedback on validation. There is no validation here, thus the reason of=
=0A=
> this property is not fulfilled and that's why I was asking. I know now=0A=
> the answer...=0A=
=0A=
What I thought was: since the driver is validating the link-frequencies=0A=
property from DT, the DT must contain this property,so I added it to the=0A=
schema.=0A=
=0A=
Also, I noticed that other camera dt schema follow a similar approach. =0A=
 =0A=
> >=0A=
> > ret =3D v4l2_link_freq_to_bitmap(ov2735->dev, bus_cfg.link_frequencies,=
=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 bus_cfg.nr_of_link_frequencies,=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 link_freq_menu_items,=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE(link_freq_menu_items),=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 &link_freq_bitmap);=0A=
> > if (ret) {=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D dev_err_probe(ov2735->dev,=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 -EINVAL, "only 420MHz frequency is available\n");=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 goto error_out;=0A=
> > }=0A=
> >=0A=
> > So, validation is already done in the driver.=0A=
> >=0A=
> > I understand that `link-frequencies: true` in the schema only declares =
the property=0A=
> > without restricting values. Would you prefer the schema to explicitly a=
llow only=0A=
> > 420MHz like this?=0A=
> =0A=
> =0A=
> You missed the last paragraph of my last email. I don't want to have=0A=
> here what the driver is doing, but what the hardware is/needs/requires.=
=0A=
> It can also be missing completely, because we don't enforce such rules=0A=
> on other bindings.=0A=
=0A=
However, the sensor itself supports multiple link frequencies, which is =0A=
why I didn=92t restrict it to just 420 MHz in the schema.=0A=
=0A=
Currently, the driver only supports 420 MHz, so we handle validation =0A=
there, not in the DT schema.=0A=
=0A=
Please let me know what you suggest. Should I remove the link-frequencies =
=0A=
property from the schema, or would you prefer a different approach?=0A=
=0A=
Best regards,=0A=
Hardev=0A=

