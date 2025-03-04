Return-Path: <linux-media+bounces-27429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E862BA4D392
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 07:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 598893AC526
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 06:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41871F4E27;
	Tue,  4 Mar 2025 06:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="kK5xykuh"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2078.outbound.protection.outlook.com [40.107.102.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2123953AC;
	Tue,  4 Mar 2025 06:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741068830; cv=fail; b=hW0tmtR6H4zmvwwCtKsI/kM0WR6+1CFxTnLUryIVC92sVtOHc1C5aB6D/HhW6FXLeuG5cCeItuQRwp1MuwQ1zTV3EtnoHGg7gbYO1+1VAaiuwfGBK5nkfTS/1Tv8fudbDNI8jBwGZE5+zeF7dRkmpQEwf+nfAW7dVOKKHwvSwM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741068830; c=relaxed/simple;
	bh=UVNGiUO2+69GCddmGG6fNBZJIGcTV/8bJuJ4JB9RCLw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kqooiQkQLCJKFBMDzlYWUhiVahBaIad99QtjxD6cnrToKvmbk6CLX7sARBzyQhsS0LMN85PXpynTS4/3jsPFYpPHBojI9JVH48XnP29q0BBcx/B3waouWSj//Z8lSv6T2ZIKgA5XnlZTPbJLD09sknexIO6IkLd7WNhpKq/6JVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=kK5xykuh; arc=fail smtp.client-ip=40.107.102.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0q5ljtrPy6vHskzn6ADGsdHgtBxCvOlmQjb5oKihj0GQ/jgON6U+/Xgu1F1pzTqvtZW4b5VtzGEhiwQoUOsT6g6v3Ftgsak+dDOsWITkK5+wUxHKXtfc7p6ChAZ8wODP6PhKIgFYhSFGEm0MYLUfag+yKmYy+4QPiEI/tKU3Uy5lm8JQVbmFi84UaXL8KdPzBIsN/2aBFWDqQ6cGjs+z/1bP4R0NPazpRPr+63KArtcRd1hsXUs0nUHl/DifCMPDaPNGnuCUXH9ewdFThSWQhHZMzvN4KEQURUo/e/baBWUBf5ww2mFgRlD6Dsdx5Zt1mwRcukUQyf9TDEJ5B3uAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9euTXKoz9PqnOUFDeTKncdDaP3nWS52U/DojlTvZHPE=;
 b=ELcrQc4kRjnydmP4Yr3EBoEkiq74ponN0fBd2Oi7kkc28+m0WdGrwZ+NHCWt7r6WZaWdfbEVc9L1YvM6dgCvn5VgInhx/ot92B3WW001L/KmoOmpBsdAYVc3G6bZ5ejadC16QmLi3/XpvmUfxSSIpzmI4DGwOGHLsgZkdbjxN+7QvxwdHyMDwiiawbJfn79YiGJcnPdEufO3LqIlnx98dSIBupCCyP+slhRbxuphME/QwIxUYM4uu0ipxl5536S5STaYka4d/aFKxzNX1htnm2ZPlf/aHDLeBWnduW24S+VDbE9NHB9jPkrKcC3s2onmxikme15AXm0S3pOi42MTCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9euTXKoz9PqnOUFDeTKncdDaP3nWS52U/DojlTvZHPE=;
 b=kK5xykuh0ACuAI4tQQnoGQPc8j8cabP+aCam0inT/9Yhl1aJuKv8WBDWFs4LAIqGfepMdvZrr6350XzeeneiZttBIm5gxTKnzUQwV9qSXmKsFSbT65ybzZCjN+nnN76T7uvO8Ps47IjCYlcqTOYetV3iWwykz9C3fTVPxg2QJT7lY3Ll7Y6r2a7xzpv3XYevgjrjhcN7ovUUmJdJy1nUrgKQLRrWNrfRhO5leHbhdrN4ZHvZ6Um6DxNk4gNBKUz7KwOKHV21FSqLSDnzQXsqoyQxqlpjZEjJbySwTEjOqsnwhHi7fcYCiWbUyb/5VY2HRJxAiHlpaakFUN95/g/b8Q==
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SJ0PR11MB5182.namprd11.prod.outlook.com (2603:10b6:a03:2ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 06:13:45 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 06:13:44 +0000
From: <Shravan.Chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>
CC: <mchehab@kernel.org>, <kieran.bingham@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<Conor.Dooley@microchip.com>, <Valentina.FernandezAlanis@microchip.com>,
	<Praveen.Kumar@microchip.com>
Subject: RE: [PATCH V6 1/3] media: i2c: imx334: Optimized 4k and 2k mode
 register arrays
Thread-Topic: [PATCH V6 1/3] media: i2c: imx334: Optimized 4k and 2k mode
 register arrays
Thread-Index: AQHbicx/NYQCRnacwE+Q13BsI0u1H7NcmeaAgADbiwCAA5oUAIAAAD+AgAFz0QA=
Date: Tue, 4 Mar 2025 06:13:44 +0000
Message-ID:
 <PH0PR11MB5611D7DD41867106B733137281C82@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20250228103332.3647098-1-shravan.chippa@microchip.com>
 <20250228103332.3647098-2-shravan.chippa@microchip.com>
 <Z8GiqSfuyQdUNylt@kekkonen.localdomain>
 <PH0PR11MB5611466B2027B79F7598534B81CF2@PH0PR11MB5611.namprd11.prod.outlook.com>
 <Z8VgUoNklDUd_jaF@kekkonen.localdomain>
 <Z8Vgh24HtnjmuBNy@kekkonen.localdomain>
In-Reply-To: <Z8Vgh24HtnjmuBNy@kekkonen.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|SJ0PR11MB5182:EE_
x-ms-office365-filtering-correlation-id: 6099c1ad-afb9-48b3-a540-08dd5ae3b7f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?MoPxAgJWauMECuhPUPihLXf3Yd464GPr/it4yTv6DORBgmdozS4MzevKD+Pa?=
 =?us-ascii?Q?+of7HRRZqwJRC3SBw99Nf/ox1dMKvCzgvCrdQdpB8MYs3IaCHkE/cjysNv3T?=
 =?us-ascii?Q?042y7WwvxJmicIoZqVUP1ZYuyrqiXpCET1jmAMgHRTeUnJZN2WN3AlaPmPbZ?=
 =?us-ascii?Q?/1TGLvFC+zbWuemX0MMY8PEnoSUjyZi9yXF5bz4JHlLjDPvK1FrjnOEajq20?=
 =?us-ascii?Q?UwUlrWTbSOPMg4aAUphTmWuiJPC/SwY0hv5v3ts0qkRYscSo/cpzDWeFec72?=
 =?us-ascii?Q?E/jl2rm7WiHYfIwq+cTLbhfvCGHepOWYipxJLUkJCEuKAPoFNVoLYbURiRkL?=
 =?us-ascii?Q?bNkNg/Vz+iQQYwzxSq/fIzM/JJDg97qrj8UiQ8h+xN/G5HkDym6gyGwEqz9k?=
 =?us-ascii?Q?BlG+7xE6EUKUMbf1MK1bFQw27QCiD6EiN6eU7l529NjQkMemYn9R6VzEo7bg?=
 =?us-ascii?Q?xUdydYVgnYq9Uu5oV2ZMJVZmaSJ55sXpw29eplCFR9vGF/vbfoJgL2KniXFK?=
 =?us-ascii?Q?ATeplQ4LG1NXE7jAgZZ3uL7iHqC4I8OQPTkvujotBNScK9EEErKd1BDyuFm1?=
 =?us-ascii?Q?EcEWmvdFVVKx2/5/Buvg21fwV7qJ2jHz68XWG7/7dYirptaSPcvZ+ko9MWxL?=
 =?us-ascii?Q?cK2l3+inUleqKMtwYE2rRKMppPm6tjS+D5XFa+uDdPsJghuAulhzYVbNb7hC?=
 =?us-ascii?Q?M8g1KNHf+eItV6kpSOxDEjGePfgk86Jtwkh3LXwqjw+DMbrEwN/AqJ+G+2kG?=
 =?us-ascii?Q?a5VW9wWz4B/C8JtflV6RI9Q4HldyPkTHMI3YrnPMCEBE4m+kwoeol839TY6Y?=
 =?us-ascii?Q?BXXoQntyxa2HT3qJaYXr8+cI8VGndgSwZdDF4aIMTzzOjXHXyW3low/j1DbW?=
 =?us-ascii?Q?cGb96LAh4sdnJFdl/dxLVgc1cV+XY9HWqeARcaJzR+gYG+YzDgFM3MZpcrc/?=
 =?us-ascii?Q?dVe250FNcEx8x6sNbi6pjJ/CD7oc+3SMx4GtrwxpkfkLu9Y1Af/jF0kC+g0S?=
 =?us-ascii?Q?LzqK2tglK015PIZKF+pOokstJ6Nr81LxVR43lQpHCNbE5XDRvIzj8MvA0KBp?=
 =?us-ascii?Q?u8JCcD1geQNvXpb8T5YPK2rD43wjnnXaEgTVThL2Q2sEiz7XIdsrLRITHpUi?=
 =?us-ascii?Q?bgxHbYbEcPqwCKRaUtZrc9UsyRx3xjrhDf03DaJYsHZAsRRpSK2iR0F8/qpQ?=
 =?us-ascii?Q?943RHIa/vyuxTifJSlnul0Qf5Nm1KsaQK6AVSXOOfnBZWOKkPSfWIBhmi/CK?=
 =?us-ascii?Q?h+XVx0qlnVwWODdQLFrE8sz4m8ncnQQQb/jUijaRuloCRm5GoOZi99Hh3jq3?=
 =?us-ascii?Q?MBazYE1X+Vfs4+g/8o52xpzZZrYgrQBA7WwGAP+2Dvy3ElJ/ngdqIHTIrXMX?=
 =?us-ascii?Q?vTq2wzF1wiULz2oQqOGPezeMicBw3GiYxPt+/2WEdhLmjF1pr12Wd767utFd?=
 =?us-ascii?Q?m9Unj+ZMIBcpT3uoLDLbMktNm2h+OAqf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?P7U4RgmI3ZayAe6Drf2nQTX1L7CpcpsTIzGts0nMSv5imjAj3s0m8Q4Vn9of?=
 =?us-ascii?Q?IVhFNwX7M3dg9FUVxu04hYxf/FRmsZEOfFc/yHFEAi1EmQKX9Q9l5ji5mzLv?=
 =?us-ascii?Q?e1cuFS2yD66cyKfZ+YxgDyiWYx9CdDA+AJcFe/hQqW9m+dH0GB02RgVVHB7n?=
 =?us-ascii?Q?bvEnS4qTuizeP3z6UlR5t+tzspDLwtt2bnKaN7+ETqQG+PjfKVTVHunbGh1c?=
 =?us-ascii?Q?eqnPvy5521uwkqPoAmcMKrjEZIihKlNly6PXPwY383epM5YBxZ3VGqzlbOyc?=
 =?us-ascii?Q?oe69pjI1jz9XjlU4HNAGJiqldDL9B5xFT5r01+iVC3ou+6vuOguUbqnqrlQR?=
 =?us-ascii?Q?2/q2+jgc3aikX715Rv9yrusJWTwoyg1mmC8txDKFrD6ReNky+D9HOsptqVNK?=
 =?us-ascii?Q?6Q+uhSoxD7YcNP3fxuxKV21kGDuRENXmDnPEBsrMsWCDtSLlLTXagKI1/fOl?=
 =?us-ascii?Q?e0b3RcbCQ4vOt/e1MIOfaJOFhac9mHKlFZ2Ao5RTHuB48ldQVuxsKLOTZlpm?=
 =?us-ascii?Q?UwFtliLGv7WCO2useV37Ffq3NlYKrfxKVwub6ZC3bTCP1N+cnDlIQiCe8zG1?=
 =?us-ascii?Q?lbVE9gkDV8VZyt/QFNN1WkXBpJ/xC+gYB9DGWPLk9sjEXoBensnbjjqRFeBe?=
 =?us-ascii?Q?ziBiLxUZihdBYukRBhtBMoFZckUHD5I+odqGl5AAgAO31z7FGXbhGT54bzNU?=
 =?us-ascii?Q?ZkOGml3i3HtEOf40DKc8i8ti8xdadQIVUCaa/Rju4IlM0mrypDEdoN0H0JOa?=
 =?us-ascii?Q?J67pKO3lNfB/KWQqdfCTBJ0iQ+HeGBvKTjSFNNfHaV61Q6xMJBN+kT/T9XoW?=
 =?us-ascii?Q?GZ/u6HJMsrNJimTthWYYRAT0XJrddMZKzq8H3PtzH7EOpUORO2af5ccCmPik?=
 =?us-ascii?Q?BHSP/NkQEEqn8KCz3w8G621YY52rK3h3Hlz+nX9oVCObKV+IbV/rQSDKMH5b?=
 =?us-ascii?Q?Onaqk5cpoQY2Hga00Mb9KgcfF3JgsWVvz2KEFQDjbfavJW65hW+pqvIjumXo?=
 =?us-ascii?Q?un+6wZZZXcnI8lCicATP8eHmMxLBBU6V3dKLUX181kwmo1PV3EiWECW36Y04?=
 =?us-ascii?Q?XZ9kP9nIgZGVBhaVSAYVB85E7DFOGPlYZiqZTrFeXT/Oo0tmfQlRHEXCdM0G?=
 =?us-ascii?Q?cYWUnumGALi9SkvArJtZjl9PrRCA3csS0PSIIRsMdiilSmgnK8HE0UiOQy/z?=
 =?us-ascii?Q?qhnj+ZEp4UXFKhQgb1RAtg2pJJjaz2OXQnXO+kvUIRolbaSLT/FKG2BDDEip?=
 =?us-ascii?Q?/DFGpMVXVAIIT6qWX/Ddvd1jwEDEhDA4a9wEfduKx5uxeaqadtXvT083Kdx7?=
 =?us-ascii?Q?Iz+ITzUfPwK7mVd8MhJtXve+/9xLifBsWjSHc2LmFsxlJVr2vU8/MNoeq1pu?=
 =?us-ascii?Q?cpMogDjKUjcvXoVW3iXgBx219j+8kHSpXpj+Pis5hjlDgeotuHgPp1nUB8eH?=
 =?us-ascii?Q?NqbQ2dGCesa4wCFQhfn7KkyBzvm4gO0xXNmwN6YTUxI9N5/XCaovRYOwoS6q?=
 =?us-ascii?Q?8obqVXpYYblaDFsuB66ExYALHMb/5tH60jvyrs0QVDXBNFXhmYr05zCOXvYb?=
 =?us-ascii?Q?3/TB9T+hZwXLrwYm+1HaoVPL6XgO/VtZC7M4H1Y3IfYV8EU7kA9H+p4b7WX2?=
 =?us-ascii?Q?MA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6099c1ad-afb9-48b3-a540-08dd5ae3b7f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 06:13:44.6229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6xI8q827REN6D0Pxv2xQDUHM7zIh7WDpQ6SRKKlNqUB25869btLX9pxwSZEu+Eu4wR2bxrCBRyW2LWqKvIQlEJQYJTwNRBXcQviyh+uoQXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5182

Hi Sakari,

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Monday, March 3, 2025 1:26 PM
> To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> Cc: mchehab@kernel.org; kieran.bingham@ideasonboard.com; linux-
> media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dooley -
> M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> I30718 <Praveen.Kumar@microchip.com>
> Subject: Re: [PATCH V6 1/3] media: i2c: imx334: Optimized 4k and 2k mode
> register arrays
>=20
> EXTERNAL EMAIL: Do not click links or open attachments unless you know th=
e
> content is safe
>=20
> On Mon, Mar 03, 2025 at 07:54:58AM +0000, Sakari Ailus wrote:
> > Hi Shravan,
> >
> > On Sat, Mar 01, 2025 at 12:56:55AM +0000,
> Shravan.Chippa@microchip.com wrote:
> > > Hi Sakari,
> > >
> > > > -----Original Message-----
> > > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Sent: Friday, February 28, 2025 5:19 PM
> > > > To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> > > > Cc: mchehab@kernel.org; kieran.bingham@ideasonboard.com; linux-
> > > > media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dooley
> > > > -
> > > > M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> > > > M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> > > > I30718 <Praveen.Kumar@microchip.com>
> > > > Subject: Re: [PATCH V6 1/3] media: i2c: imx334: Optimized 4k and
> > > > 2k mode register arrays
> > > >
> > > > EXTERNAL EMAIL: Do not click links or open attachments unless you
> > > > know the content is safe
> > > >
> > > > Hi Shravan,
> > > >
> > > > On Fri, Feb 28, 2025 at 04:03:30PM +0530, shravan kumar wrote:
> > > > > From: Shravan Chippa <shravan.chippa@microchip.com>
> > > > >
> > > > > Optimized the resolution arrays by integrating a common register =
array.
> > > > >
> > > > > Adjusted the register array values for 1920x1080@30 and
> > > > > 3840x2160@30 resolutions to align with the common register array
> values.
> > > > >
> > > > > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > > > > ---
> > > > >  drivers/media/i2c/imx334.c | 132
> > > > > +++++++++----------------------------
> > > > >  1 file changed, 31 insertions(+), 101 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/imx334.c
> > > > > b/drivers/media/i2c/imx334.c index a544fc3df39c..a800f2203592
> > > > > 100644
> > > > > --- a/drivers/media/i2c/imx334.c
> > > > > +++ b/drivers/media/i2c/imx334.c
> > > > > @@ -167,8 +167,8 @@ static const s64 link_freq[] =3D {
> > > > >       IMX334_LINK_FREQ_445M,
> > > > >  };
> > > > >
> > > > > -/* Sensor mode registers for 1920x1080@30fps */ -static const
> > > > > struct imx334_reg mode_1920x1080_regs[] =3D {
> > > > > +/* Sensor common mode registers values */ static const struct
> > > > > +imx334_reg common_mode_regs[] =3D {
> > > > >       {0x3000, 0x01},
> > > > >       {0x3018, 0x04},
> > > > >       {0x3030, 0xca},
> > > > > @@ -176,26 +176,10 @@ static const struct imx334_reg
> > > > mode_1920x1080_regs[] =3D {
> > > > >       {0x3032, 0x00},
> > > > >       {0x3034, 0x4c},
> > > > >       {0x3035, 0x04},
> > > > > -     {0x302c, 0xf0},
> > > > > -     {0x302d, 0x03},
> > > > > -     {0x302e, 0x80},
> > > > > -     {0x302f, 0x07},
> > > > > -     {0x3074, 0xcc},
> > > > > -     {0x3075, 0x02},
> > > > > -     {0x308e, 0xcd},
> > > > > -     {0x308f, 0x02},
> > > > > -     {0x3076, 0x38},
> > > > > -     {0x3077, 0x04},
> > > > > -     {0x3090, 0x38},
> > > > > -     {0x3091, 0x04},
> > > > > -     {0x3308, 0x38},
> > > > > -     {0x3309, 0x04},
> > > > > -     {0x30C6, 0x00},
> > > > > +     {0x30c6, 0x00},
> > > > >       {0x30c7, 0x00},
> > > > >       {0x30ce, 0x00},
> > > > >       {0x30cf, 0x00},
> > > > > -     {0x30d8, 0x18},
> > > > > -     {0x30d9, 0x0a},
> > > > >       {0x304c, 0x00},
> > > > >       {0x304e, 0x00},
> > > > >       {0x304f, 0x00},
> > > > > @@ -210,7 +194,7 @@ static const struct imx334_reg
> > > > mode_1920x1080_regs[] =3D {
> > > > >       {0x300d, 0x29},
> > > > >       {0x314c, 0x29},
> > > > >       {0x314d, 0x01},
> > > > > -     {0x315a, 0x06},
> > > > > +     {0x315a, 0x0a},
> > > >
> > > > We still have this change in the patch that's just supposed to
> > > > move register address/value pairs around. :-( Please check the
> > > > changes yourself before posting v7.
> > >
> > > Do I need to split the patch or drop this change ? in v7
> >
> > Either way but it does not belong here.
>=20
> Oh, and btw. if you want to make the change, then I think you'll need to =
make
> HBLANK configurable with the default being the original value.

Ok, I will change according to datasheet with respect link frequency in V7.
As of now, I will not be able to do configurable HBLANK changes in this dri=
ver.

Thanks,
Shravan

>=20
> --
> Sakari Ailus

