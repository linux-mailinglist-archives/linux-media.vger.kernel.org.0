Return-Path: <linux-media+bounces-12753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D5E900570
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 15:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FB561F22383
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 13:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CA8194ACE;
	Fri,  7 Jun 2024 13:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9WI9zbX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B91DDA3
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 13:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717768091; cv=fail; b=UQvkpb9VxkXO+Yt0Z7TZpFxpWhM8V3BUyxpLRD2Mt/BCw4m2XLs1DeuaRgTMDf/45ryzUybe3JNgSB/Urzi0Z06FFm/4Avb+DJfhNwzMwm5V4k+liQeHnRhOOAVUPz2vwibr03koxLY12mXBgE9DP+e/NsZpx3WkZ5KvA1QMETU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717768091; c=relaxed/simple;
	bh=2yQVgewDFxdg/hSn+cR5piAbd1iUZVNT8rKUFFvi0gs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rbKBi/kEIm1Q3sxcaSopo/uHJUBOqLXHGRnuUS7cGn62tRHgabDVeTWZ0ThwKOeKDZbZS+2wnnbNB8VQyokd9XN8FWf24WriFVmM1BZoGRq0wk/bl0LCmEANHqKjybXd97kxRNREyH+8jMk7Yyff+VuWh5MBrzK+2seeZtRCHGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9WI9zbX; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717768089; x=1749304089;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2yQVgewDFxdg/hSn+cR5piAbd1iUZVNT8rKUFFvi0gs=;
  b=V9WI9zbXataw5rNHlM9AqeqEJphKv7qNndTqCxjHWkr1038rqQzKL9zE
   ps+OhREnDUjlmjQVSu8aorSCCnCUcCMUjTOAGExiqyC21kSeptsQsjgtv
   EWccefAq/QYh7DXcXJ+pVlvRxoK8YfVakrzoURyXm5bB6hFfhQuSYW+1d
   nzlLeU3SK5MGutGcARPwLvyVHUkuhnA8IjLHtJ2eU8fBRVab3LrufNEvx
   u4u5m+wxPaEqCaRzB3hYF1h/s560rvQo0VY07PUNjnr2iJ+IeyCjkW/iP
   ck8q3zqFgMDgQHNor1TyfSa5xBXsCwlWkLPC5yf4tumKupAEVWizCbFqf
   Q==;
X-CSE-ConnectionGUID: h39iKlvyRRKJffIw+goySA==
X-CSE-MsgGUID: 0o5OX/OHSaSsvdLiagp0ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="31983691"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="31983691"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 06:48:09 -0700
X-CSE-ConnectionGUID: dZkeybP4S0eIUQA4abQesg==
X-CSE-MsgGUID: 69pD//KMS+K1mmVuBPy+8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="75814714"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jun 2024 06:48:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 06:48:08 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 06:48:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 06:48:08 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 06:48:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAAuTi0MDqN/ruiBwYclnlNxj4LE6b+AyngZtEaKd0ExfqOBeFrjqB5rOTFlQ2+SEYlCx+M3iLtOjC+o2J0VGfelh8TOzIz2mijOB3veXx0yfiMWmZlenanpgYuoTZuUcyi8Jwm+8DVOfv7TPSTRFI6S63GhYxPntYWngqGqOHlORzztu1uEExCfDaZ4mmftoXp+joQAkxbTBBm8hVKIdiITWa46rjB5S0d5/JeHQ1dtSDUKqEilYgtnEAe624hRpd2jEoP2uoPxVkGCRqZ8DFDsJaEgHvq1a2aveIK8z+raAKo/sgQksdKbXo8rhqKXL6uOtROrrmrHp/3H3h1m9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yQVgewDFxdg/hSn+cR5piAbd1iUZVNT8rKUFFvi0gs=;
 b=OexlH50wS6S24s0Prf1/9xYpYhdYeUifj4VkHDvQMhGFJosSon8DwpqUazsTyIIDAAgqtAE6aMsrB1k32P96wHiqP7ISNliG+DKMThKDWIvR6pjU23/HqyGDzQTai5DvTb6ftkYgSctPaIBhZvP50DrySaNmLRtP3YLBEGa5wWxgk+1VGaq13qZjsbeVa29f/LW7VO8mlfxyLc1sXgLyOF9k+fXZlGvq4QtRtv3TRiAllNO8edYxMPHqopOdpTlr3tKe+1ubMBL3yOszNGpJDOOq0T9Keqym0zFooHT0pizWp12lzemCF+YCzuthfGjIhw1F+AJn41AAPMRoyy/skQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7)
 by SJ0PR11MB4943.namprd11.prod.outlook.com (2603:10b6:a03:2ad::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 13:48:06 +0000
Received: from MW5PR11MB5787.namprd11.prod.outlook.com
 ([fe80::20f8:8626:d842:9ba3]) by MW5PR11MB5787.namprd11.prod.outlook.com
 ([fe80::20f8:8626:d842:9ba3%4]) with mapi id 15.20.7633.021; Fri, 7 Jun 2024
 13:48:06 +0000
From: "Wu, Wentong" <wentong.wu@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "Yao, Hao"
	<hao.yao@intel.com>
Subject: RE: [PATCH v2 0/3] Fix privacy issue for MEI CSI
Thread-Topic: [PATCH v2 0/3] Fix privacy issue for MEI CSI
Thread-Index: AQHauNsyS/6jH2PZrkGQ+m3RAqay87G8UBgAgAAAbMA=
Date: Fri, 7 Jun 2024 13:48:06 +0000
Message-ID: <MW5PR11MB57879CBCB12D753D479BE45D8DFB2@MW5PR11MB5787.namprd11.prod.outlook.com>
References: <20240607132547.2820515-1-wentong.wu@intel.com>
 <ZmMO4vjde9VT_A4b@kekkonen.localdomain>
In-Reply-To: <ZmMO4vjde9VT_A4b@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR11MB5787:EE_|SJ0PR11MB4943:EE_
x-ms-office365-filtering-correlation-id: 629111e2-3f4e-4d40-bc36-08dc86f875ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?NyeSm3BHyhHkvvk+UqI3axj40+uRzLpH2HvidNJU+zaTyMjAPd2453CkzOiu?=
 =?us-ascii?Q?fN6y0G0NbNQylSnMVJinkx+Xsh8sGdzSMgd9y7+hcNCw1f6okjasIcob4v9d?=
 =?us-ascii?Q?kf8WpNCjiXUl7+sAz2avEbTYL+ZgP6uHOCShgcafclxdaoNcVDvF2iUFregt?=
 =?us-ascii?Q?v1Y0DSI15MEf+KXHkVDppIe8iYih3Qrmz0fVZXBW6pFYXQiqSLVFNWkSNmHU?=
 =?us-ascii?Q?G6GZiMyDKBAISdYUk5dy+rng/uLgxohQRHICqp9ieErr4mV7pGUSb6DyR3JC?=
 =?us-ascii?Q?rEl1QNcbPH6kDOgOhO+6zyQL0WI/mkeTWMlhk3XR0Kst0tKfcECjS3kuFO53?=
 =?us-ascii?Q?dUiT1aK+xqzx38w8lWlnBk/GduC9p1o2chJdCY+FVvU1z40I2RhgL/JEU19g?=
 =?us-ascii?Q?EssO+Y96erpwDapbKr89b47QQMvDdMPeMhpCeWeUqykopvnhusBXaG54C/AH?=
 =?us-ascii?Q?Qq54HIGesGYmsIvTw1++6RprtjMGYJw7lBNzvpmubCB/cufejYBkZTXyY7ZY?=
 =?us-ascii?Q?Gv1/4/OddoybbHcq2hwgp9bNiLHHF22D9q+FyBHVBmrRZcZ/YycsL2NYR455?=
 =?us-ascii?Q?MVFBUoF+DK1bCN6jt62RdQLO+WdyB9YTBcJCZfvlGoNZDZU840M0cTdP0szM?=
 =?us-ascii?Q?FgewS0j1gueA07bd1/H36TbU9N929CPLzWWs3fIhaeLDlKVdVyEb6XyHaCw4?=
 =?us-ascii?Q?LcFtDN6cZMyeUdEy9giroCnYlb2cRf6bhamdsmZB9nT8Hh+NOL2hADuA3PRR?=
 =?us-ascii?Q?oBFwrdJjXJ5e36XiV707ZuKKqy62PX0e5rgEnZNTMZeblErUJLZdTudBeKWS?=
 =?us-ascii?Q?+S+txcbsSuMhSpoAFsTgvhYWqcOHxP/ipqKxP4vmz6586S2+KbeiSPI0h4k/?=
 =?us-ascii?Q?D9J/iUKQioCAitChFxe8UTZvEyVixHoESTZACMBZFEy0Pycv4MVuGa7qE868?=
 =?us-ascii?Q?4rwO+9W7UBHI21WtDo62uCNHSrrh+xcZer43vlbASAWunFtccF+69rDxB5tQ?=
 =?us-ascii?Q?LyThGwdVVtsrh9sz0D3PN5jqOHQa9mpITqgZ9AGENat6iSjDystnYvCE4wra?=
 =?us-ascii?Q?0GZKQleVsZzEAhSJipkezBZPeveduoQPj65yxO6x1JikH5qpnhQpZOiYSsX3?=
 =?us-ascii?Q?vYARQwXUX5wWxoctb5WXSE2WQFJY9o6FW+LERP5kBE5Vyf8D4a2/hPijWOVo?=
 =?us-ascii?Q?IGeJaeplvOPxpA0wLvfrvcBmfTj9wDLtMFqY8Enszuo78mh9i1kVMf+IhrEY?=
 =?us-ascii?Q?K9upwhgycdcr1bsZY/A6O/Btch+gGF22IB2/Fjqeyy7wgLOZ2c1mC0YRqgjd?=
 =?us-ascii?Q?ziix/vhdT+XJgewespWxQeKN4rpuKuvwinPZ2FtsQLSeNOIPD+feSFCj8LM3?=
 =?us-ascii?Q?gXdo1cc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hd7eS4dAhfhwbTvggDGu7TjcBpeJAqsKG190zvqmeWTtOjhipeVqIX4VZOqr?=
 =?us-ascii?Q?JbtNrcRHURQe9mjJvxWjqYbBYR4vy4soXqYYl/4usVsvDgmaLz/z4p1H4dF5?=
 =?us-ascii?Q?4LHg0xPSAW+L2qiOOt2q6RzMn8HqhaYOje48jLL8pP8Ww5Y94zspzf1OoCLc?=
 =?us-ascii?Q?YdBF8hVius373wQlKrxxuVIZSagIp4aKHTXoOJiXwZQMzdV0O9fVAkSDZ74n?=
 =?us-ascii?Q?Ol5mngJ4oYRZb5xoAkvcNFpEwwI+T1GOcJklXEzpmsLnr7ETzksPhHoL0L59?=
 =?us-ascii?Q?Tzl0YoMMdfGf6MhilM5VZ5m7QZZQMIrm2x2czDYak0b2JUUvuLJk68jUWwAo?=
 =?us-ascii?Q?thBL1h30ekzFZHP9CxpTfZ2WGJEAMpa/pfKk9fFVWKIz81t4Ij/ViHcRezaq?=
 =?us-ascii?Q?Ml4sHcrEAP5UCMG24edCTg6AAV16LP5v2zI80i2UOoIIeqvi2ac0EyyBSW8A?=
 =?us-ascii?Q?MsY0aCkks9A5TtGSEmYsG1Sls9gVUMxWH9/0sxzQ3y0ZtVsb5wDt2T00c3Pd?=
 =?us-ascii?Q?SIJGhKW6PDN+DSnmvOlEvdYO1dAXSYsDV8HbxQfymokf09BB+rxHB0g8t+Op?=
 =?us-ascii?Q?eOiH3dlaZGERNeILRhcUAgrtZPR8bhDdCiP2dqRxn5+F+Fp6L/vHTSE+m2hA?=
 =?us-ascii?Q?t/dCv/KnY8VrCYmRrj/Gz6Kxcq53e+e6Kju8oY0iHNUoSpnxx6TYip8ajo11?=
 =?us-ascii?Q?aUHJAjPHM04U9FF+85vID3Bb6eP/5W0wKr3VF0tEjHvW38yFx3vbu3VXsFmW?=
 =?us-ascii?Q?dtvfC4CYfZnSaJC2UIWh3yN3SxoVs9bf1BrKT3hsAX1SClWCk+tbpbJ8fuOs?=
 =?us-ascii?Q?nhWWOIzUQcLvB3BeWVYtRnE294Ao3hNDmbBPi4ky7IJW8hxR+dPLamTnqXEt?=
 =?us-ascii?Q?on30gK6tWrS0EWZdDnzJ2a/la2aj1IrTM+VkpFyTJpKqxzHbJSWW/tpclcA0?=
 =?us-ascii?Q?OZuL3PZ1HsrnGGhsGFY+/Gogan06RrB869XpIJsgfCc38j+TO2ynJm8K8mYU?=
 =?us-ascii?Q?YjQmIVeodGARVNi7D9pIoR5yEO1w7Rmvl5uWjzrIgE2Ev6zoXKcWgCcExJXN?=
 =?us-ascii?Q?2mbxmUuBX8tlxqNvi2XD/0YEL/y6mQTBoQo7yAF95vnnIJApNnnH/GlaNM3g?=
 =?us-ascii?Q?ZWJ+Fzg0L6FIuBAP08S5RlmXfqtLikpoks1pqXv6n06oBowFy6zg01isjK2y?=
 =?us-ascii?Q?C9F97mHpRn5t4HIaGAFuikfI44tZvEcM75Hh+ov4kjIk94I6gLW1OVVRonfH?=
 =?us-ascii?Q?WzazSONh3ogNSl4C4hmejzdu+5ZT32mrZubU/XAvJ9z99K+JJ4DDRtStSHGH?=
 =?us-ascii?Q?dRj8Sq1/tHTUp/jtL1DeSjMuDy4WZHNfG91ha4xnxG6ho378rgnSoLJAxU6O?=
 =?us-ascii?Q?4PqbeRhnjPfUVzf+k9PYALubBpPK0hO5e56j2ZFz7wL9cjXABKjmbcNeJap5?=
 =?us-ascii?Q?9fPKXV+JSwvzGm01ApkW08z/e9yOepwrybu+Lf90qje2ZrbbRQJWCPkyCrQp?=
 =?us-ascii?Q?5JDriiStI29UquGz5EKNthy8XvaeJViEVxi0rmjOqbdSXTQdtmMV2wWIDM4k?=
 =?us-ascii?Q?6K6d/C8RhIyskbChDv2xJnYzyggfZdTKcRcE1pYI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 629111e2-3f4e-4d40-bc36-08dc86f875ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 13:48:06.4351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8afg8FATagJLes2bmgMD3rg+IddcBndiiJvK2ENdKCXvGVrmFDJ1LTOegYi0DKx/MPLJ1mCnZAmGDSto5Kz+qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4943
X-OriginatorOrg: intel.com

> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> On Fri, Jun 07, 2024 at 09:25:44PM +0800, Wentong Wu wrote:
> > Currently if starting stream goes with privacy mode on, the whole
> > pipeline will fail because MEI CSI counts privacy mode on as error.
> > In fact, the ongoing MEI command is well executed by firmware as well
> > even if privacy mode is turned on. The status (-1) of command response
> > is just to indicate current privacy on status instead of failed to
> > execute command by firmware. This patch set changes the behavior to
> > notify privacy mode on via v4l2 privacy controlinstead of fail the
> > ongoing MEI command.
> >
> > This patch set adds one dedicated lock for v4l2 control handler to
> > avoid dead locking issue as well. And the useless privacy status in
> > struct mei_csi is removed to make code clean.
>=20
> Thanks, Wentong!
>=20
> I'm reordering the first and the second patch, to avoid a deadlock before
> applying the other one,=20

Make sense, thanks

> and adding to both of the two:
>=20
> Fixes: 29006e196a56 ("media: pci: intel: ivsc: Add CSI submodule")
> Cc: stable@vger.kernel.org # for 6.6 and later
>=20

Thanks

BR,
Wentong
> --
> Sakari Ailus

