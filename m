Return-Path: <linux-media+bounces-12726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB40900417
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 14:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F66D289CF3
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 12:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0EC0194094;
	Fri,  7 Jun 2024 12:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="neohMwBF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77C6194091
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 12:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717764864; cv=fail; b=E5MbWqQbdhXGJaq+Xx21rSY8KqleqJO6TpjqWFf/mMnu6aABXgpbLqqx4aanWbPipsQo1k5AJrWCwlIuWesB0+1LeD9lPfnzsWODj9r/tx39U35+eB0uD7DVZ8i+Dck9V5AUnOfyrZFDlLaZbtCsGpN/mtSowyp2hJ7fRJ0FnOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717764864; c=relaxed/simple;
	bh=XSSusBR1Xz6dVVqh+Sf0N+5iijhZQxBCg04mCVJwIdY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CbI3Fw9HOQ+x/nLKM7mYnAqgj6nISpW0Pa7tbX/cHUd2cx0PNbq9GJRmMA6ROGHGkwIlvudswIJ+FEQw9nGPoJHvlaBsxl6tPKaQReYAAL8mEEydqr2jwcW73OFDaDby8nPSXrJ0cM7lW/y4YsQqOGJbp2X282BV95dUlue49nk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=neohMwBF; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717764862; x=1749300862;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XSSusBR1Xz6dVVqh+Sf0N+5iijhZQxBCg04mCVJwIdY=;
  b=neohMwBFcUZb1hnRVpIJsUfpdtK16ta2zHlYVPak2jqsbt6PiUvge3Gm
   /Q6pXyQ+QpJ5OaeuNYB1RZ25DwryYE2nj54hOCYmif+Xs+9O2EAwx8Pdz
   kv4uln315LupG+0ihUb1fpG3oDrretNBRzGPI7wuamgPR3G939P+1W6cv
   S71CNol54/QNCCVgq5cJ/eOgG/08xH8IeicvgTUFHFdHcUhZVaOuD/zks
   ZxYarlpXTHlsx8eOaQafOqufNGNFEYLADnf6gmEzNLZLqCEwa/hOSCqYT
   065EBSMODnwulO7cp/OmidN/7sgwA136LrOmtB82nsNZCX4CgEZgt+UyZ
   w==;
X-CSE-ConnectionGUID: z3ojpDS8RJOIAzjgHMUtWA==
X-CSE-MsgGUID: eznyQyOrRXWGFcZB12rNyg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14366233"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="14366233"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 05:53:06 -0700
X-CSE-ConnectionGUID: ig87o9XCThCLLRZSc+8A4Q==
X-CSE-MsgGUID: j+j1ucgvRf6Zm7CXiPsbPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="38392108"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jun 2024 05:53:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 05:53:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 05:53:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 05:53:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEX1GQyNeyatqWsHBNyPuGBO15wTcpRplzv2MGMLO8bYQLEO6I+a2/ZQPdPE1KeiczhTtcXAridg1assZOfeP5x378I3wrCyDUccPTYjntwar0OZKToGBoFhXft7MyyK6L3nz8EiFkXE8MdFfHBnXRLL5cm0yJPrzXwoFWwToOVpdsMSJCGQpZRkdeHCZw9/sdygLVbNEoT3Mg2iBTu8MYTsLyjkgvkf9gHuu9FnDbrK+qUro7PFs5gTkXn2THHqO7Vwa/q63iUkr/IAp2PEhl1Cu8ADcHXCaci3E4olWF603br4PjA/8CWhPOf/0HMkIV4RJDS/LsoZYGw8ua4gfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/i3QpvXahiLOoj5Gj3rOnr3LFD8BSmVbdAMWAVsrvE=;
 b=IgiY4yT44+K65kmqMf8c6NYQWtieH8MKkNtwNehBDtx2WA+ZNQDfE358cs2IoQza1IBvFUKCxMdHQJGNlvdU1Eq24ON9lCPT8N2cyXYO6Z3l4yNhO8BvCxQXJHmezN74FgoYhnlc1snGWCFbKTggGTxxfLTJR2l5FWxNReiinjgqxWmEpur+H+AKTYEIEjxLtLifTujTcd7M72CmPCWfHtn7tr6vr3MVmgEtmte/nftFsE8zWf1WCPVXDMhXAIJXgOf9PpNFVCYKDl5MWiRDff7Nngv8E3GUf8ejlDtD9lvoFUiJ+5y87b9ZUe0aD/0s0A2ymYvxsZwhOPBWUudVlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7)
 by PH7PR11MB7498.namprd11.prod.outlook.com (2603:10b6:510:276::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Fri, 7 Jun
 2024 12:53:02 +0000
Received: from MW5PR11MB5787.namprd11.prod.outlook.com
 ([fe80::20f8:8626:d842:9ba3]) by MW5PR11MB5787.namprd11.prod.outlook.com
 ([fe80::20f8:8626:d842:9ba3%4]) with mapi id 15.20.7633.021; Fri, 7 Jun 2024
 12:53:02 +0000
From: "Wu, Wentong" <wentong.wu@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "Yao, Hao"
	<hao.yao@intel.com>, "Chen, Jason Z" <jason.z.chen@intel.com>
Subject: RE: [PATCH 2/3] media: ivsc: csi: add separate lock for v4l2 control
 handler
Thread-Topic: [PATCH 2/3] media: ivsc: csi: add separate lock for v4l2 control
 handler
Thread-Index: AQHatYzIfFJeKOhTUUan1NRC65HxVLG8RNKAgAACSOA=
Date: Fri, 7 Jun 2024 12:53:02 +0000
Message-ID: <MW5PR11MB5787D2EDC8826CD4ECC4C5F88DFB2@MW5PR11MB5787.namprd11.prod.outlook.com>
References: <20240603082614.1567712-1-wentong.wu@intel.com>
 <20240603082614.1567712-3-wentong.wu@intel.com>
 <ZmL_4f8UIab5qaZp@kekkonen.localdomain>
In-Reply-To: <ZmL_4f8UIab5qaZp@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR11MB5787:EE_|PH7PR11MB7498:EE_
x-ms-office365-filtering-correlation-id: 3d6a9485-4253-4ec3-1a9a-08dc86f0c48f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?Hn/Mvt3+tD5yY4OrY+MMp5/l8KoAJ8HQCwpGh+PXCd/q9E+hG/RCrJbP0R9D?=
 =?us-ascii?Q?XI0lOavCe+5VuSS+m2JhGl3dQxbAeXm8G7wbeY15k8YKQ/mRq1U30T46KGFW?=
 =?us-ascii?Q?yJxTOKYS0EptZSsWxaLCFuPNvo87hO9nBAyLDjt5ukoEUlduX1+qjUwvOfFG?=
 =?us-ascii?Q?1wB5aneHOPgeLcqgC9ypkCJ7FE8gl81irawzzY8jzK8+rqMSsIZK+1Mx1vaF?=
 =?us-ascii?Q?HE1cZPK0Kbm18fmWnVYtHOyDA9eZ4UxDc+kNHyun0HHM2w7+mAKK1Z2L0LKZ?=
 =?us-ascii?Q?rLiSBd2Jgy1Q2YSCPThna3CHLcozgkoKl32k0ag/lTG+I3fQT+YQS3DcLdxp?=
 =?us-ascii?Q?ivKQysf3Psi+klq1FRmEHUKTXZ8vlRQeGJRMMGpkp9K3uwOafuTl7xjmmY/W?=
 =?us-ascii?Q?BoEm+D7zXVwg0ZrEk0tlKQdnFsoMXJ8Ns+cXQZb0DZ5DL+OPtUdC9oKWss18?=
 =?us-ascii?Q?hrkmMv6gv6VkAvP+f9ipDvT7zV7bHPDPBTUNyUbUCvBFEIwn4LUONgeCo1vX?=
 =?us-ascii?Q?w4gw8rilv2Wq3wStnajzVEvg5PBvwY/CYAYJ80ePkQpn1qiB2TBcWCi2G5FF?=
 =?us-ascii?Q?aarRDXgjgnN811NwlNifJHAUpKbcOt5RgbKAup30OvDXVAMJwcaYSUgl94ye?=
 =?us-ascii?Q?YEd/VN4/ey0R7qDI5KWIRrQWOIBfQa6XuxClo722x0TYCvSMV8wlAaHF8+fn?=
 =?us-ascii?Q?C+bImhDT5dxRY42HyVWbElW6BWfagSZnamTvw3iusyDMzg1+j0s1YdcifHo2?=
 =?us-ascii?Q?zhXYhRRDoo5Tvv1sHn7Q20qHGMj69LMwgrjFyjY06TdHgKj0Y3tUDqANL5Oj?=
 =?us-ascii?Q?UBm+DNnl0HfzMyg2G3+v+RhZeRE48c59eLcmB7883vn0KUcQNtg9Sl7tCSLm?=
 =?us-ascii?Q?rHNb7wwR03GWJa3U66AhGOFM2WxY3FgwfA6ZeF4EWfgx3TTGYtkZR2IKEQ//?=
 =?us-ascii?Q?ml3E19g0rJHy/YEfbTzh64X4BN1XoeICe3N8RnlU0xfjlCcFgaHXai10Hfa5?=
 =?us-ascii?Q?/4rDOCBWbqznW7qYCjMBG9R/qN3z/2ZjqZFs1O9Goh9GodJZrvDz9Bz4pepU?=
 =?us-ascii?Q?DBC8H/SRj43eLEZnMPTZFqM19WRqwcZHHg10QJ++qHRD60fwE7DfbjYdyL60?=
 =?us-ascii?Q?AjCLd+X/+c+eYvMw+osejBA65RXA9CezNs5pNy7NkBBeHBbJB2jzICzVptTv?=
 =?us-ascii?Q?DyRo+xQGsTM2rdDHwM+9qPSI7KnXLnX0UrFMv4OKDKHwmnfiajrWsBtFPALP?=
 =?us-ascii?Q?4TOoR3RW4e23mZHXUKw0oIfYWYohlLLXQ9Ys0LqGYMVBj3xq6knWqw/8cbAl?=
 =?us-ascii?Q?ZouBdPr9o/mnjr47u9AJjBqdxkciwzALVsUkK3kPpcWCQogdVeFTqmTF8iiR?=
 =?us-ascii?Q?qbTQnxM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lvyfAUkUAIV3EO1BnFptYtrZBAPPO1CUXAGe2+0TjAWiVVc5exqSmeqH/Df9?=
 =?us-ascii?Q?okxBMfP+nSyjzOmbCOLwu7etsrMakW4KRPuctx2uxJ22ESEomwuRxo+/4ISw?=
 =?us-ascii?Q?UbeHpVI8y0lTzq7UjXg6RXqMkmqU1Ex0OTzD3oR5kjPqBHa2sohKwycyH+yG?=
 =?us-ascii?Q?nmTzWduHUqA7RAtOZ7KKj80xluU38vzXj02Y4HIjweZfddMU2IaGCv9//Pwb?=
 =?us-ascii?Q?6lhQ427EjpZ98d83mCu7cECMGeqAlDT8C1ArJ+IGjgutYFkCiTm4kzV54JyK?=
 =?us-ascii?Q?1RxMjsckakDbz9FvIwnR411xT/W4VLnfpf14RH7MBqbBoo8JtdO3qqxVIaNO?=
 =?us-ascii?Q?IK4c+sRSpYdy61Y3AOhZFmW2vAMYm1gMzXXDe3U2zbCXA4Dp4c2Y0hVBBriI?=
 =?us-ascii?Q?HGyX8zeb6d/nBQ7hZHMXANA04g6WdpnmCkNc7U8odU5l8uEyo1bAck7ed1vt?=
 =?us-ascii?Q?SMXfTyZc4rtRfQcu0K9gK3D4NQdbU8GhXZu0VEDWW08kQZAOgi60O7bINfDZ?=
 =?us-ascii?Q?Hhg0a92gOwodIE5K5SofvxOo67Vbsb5oLEp2kH8GEJu+Ypb5wNEqek9JaykJ?=
 =?us-ascii?Q?m5xkSqEiFfuIZvUNQTkIz/ftd8TRXOARN/UpHgLzgSOs+Fp7f0MPXwqp8WYa?=
 =?us-ascii?Q?ugkTHINnkzFrkJrkjNIRUVYyhTnO44UqGLg+C4I1cDeh4oI1+JDGrbqoOp9x?=
 =?us-ascii?Q?Z2eZ7D7Iegvxv5KA7bVSe6I65eHFNEFiatXqKI8OZE7+uzZPRWLnRSZ9bx+C?=
 =?us-ascii?Q?RxpLXuKDKUV41nhDpy/vj57I7Sznnqnqfy/h92munPbhR2yXu9wvTyF3fdvY?=
 =?us-ascii?Q?wrpzfhrxMDB+ZG79WnKb4Dre5ydVFoMp3oJRC3+6Ln4cVtDYtdCs7yor64nR?=
 =?us-ascii?Q?fFg3Oq2s4AnkA/aSyJ1pmClEkSM1Jb9WN72ZPPP4abaTIF2l0WaIDZ3Jh0Zl?=
 =?us-ascii?Q?wVOPC2Qn28nQKElTwSeR5wCrRH7HEpqdGcDVfrFY1WE2tqIm9gdKp9nJIkjN?=
 =?us-ascii?Q?DrS5W1qrj7qhfYtLHmyS78vTNcmA66nPML4DK61HQAK3x49J6tkK/0YjISfd?=
 =?us-ascii?Q?bwQ+paYWNRgt+QfnIygKa9lPf0fSxkIflsDI7ZZTGCn16zf08l3qpi8FG/kv?=
 =?us-ascii?Q?fdLQf0YS635OBqvaiknd6eVOQlzu6D7hpaYF1H7mONJIwsmxSWo/8IENnlwR?=
 =?us-ascii?Q?vKKJMXv9maC9q+4eRwnw6SShJXLaO+QlF4Ath5wZSavS05+Vrf/jxgfoCqTL?=
 =?us-ascii?Q?yS+Wiy5mt8eccmFd1Or9I7VA8gwG0fE6IBSDxzWUcUYY+LA32OThpAlEQ560?=
 =?us-ascii?Q?16HNjudrd5/FDAswg18Heaa/akUNpt5lbsxZxFSfzfcrnzaUOEynqLEOjmj3?=
 =?us-ascii?Q?gMUarjRR4ZvH8GTV9CPg2PhJG3zkY4EDBsCbMJm2cTWkrfmWdUTEHyxI2Q1M?=
 =?us-ascii?Q?2YwxBcqEHpy94RwLCwiNPm7lG4anpuWp1rZPaNYqOTlTqmTCmqXLL/zNQ45E?=
 =?us-ascii?Q?7Sr8ZhC1i5B1JshRJhmdD3W4Q4D8JDaPO7wwKcjZaBHlHeBlOh1uZ3h8W/qm?=
 =?us-ascii?Q?kyPh7htgfz0PR8yrYhLAKcG3J2yNrH2iz2c+W7zl?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6a9485-4253-4ec3-1a9a-08dc86f0c48f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 12:53:02.7330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OHi0s/tbFfe5npoDGr7QktHNUG77QRjTHqnIEq4vGbo7cWMIacuAOK82wBru2ZPmh7cnQ12xPWTCNRjphLFPig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7498
X-OriginatorOrg: intel.com

> From: Sakari Ailus <sakari.ailus@linux.intel.com>
>=20
> Hi Wentong,
>=20
> Thanks for the patchset.
>=20
> On Mon, Jun 03, 2024 at 04:26:13PM +0800, Wentong Wu wrote:
> > There're possibilities that privacy status change notification happens
> > in the middle of the ongoing mei command which already takes the
> > command lock, but v4l2_ctrl_s_ctrl() would also need the same lock
> > prior to this patch, so this may results in circular locking problem.
> > This patch adds one dedicated lock for v4l2 control handler to avoid
> described issue.
>=20
> Before this patch, wouldn't the ongoing MEI command simply complete
> before
> v4l2_ctrl_s_ctrl() could proceed?

it can, but every function calling mei_csi_send() would check the return
value and call v4l2_ctrl_s_ctrl(), probably the code would be duplicated.

BR,
Wentong
>=20
> >
> > Reported-by: Hao Yao <hao.yao@intel.com>
> > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > Tested-by: Jason Chen <jason.z.chen@intel.com>
> > ---
> >  drivers/media/pci/intel/ivsc/mei_csi.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c
> > b/drivers/media/pci/intel/ivsc/mei_csi.c
> > index 004ebab0b814..d6ba0d9efca1 100644
> > --- a/drivers/media/pci/intel/ivsc/mei_csi.c
> > +++ b/drivers/media/pci/intel/ivsc/mei_csi.c
> > @@ -126,6 +126,8 @@ struct mei_csi {
> >  	struct v4l2_ctrl_handler ctrl_handler;
> >  	struct v4l2_ctrl *freq_ctrl;
> >  	struct v4l2_ctrl *privacy_ctrl;
> > +	/* lock for v4l2 controls */
> > +	struct mutex ctrl_lock;
> >  	unsigned int remote_pad;
> >  	/* start streaming or not */
> >  	int streaming;
> > @@ -563,11 +565,13 @@ static int mei_csi_init_controls(struct mei_csi *=
csi)
> >  	u32 max;
> >  	int ret;
> >
> > +	mutex_init(&csi->ctrl_lock);
> > +
> >  	ret =3D v4l2_ctrl_handler_init(&csi->ctrl_handler, 2);
> >  	if (ret)
> >  		return ret;
> >
> > -	csi->ctrl_handler.lock =3D &csi->lock;
> > +	csi->ctrl_handler.lock =3D &csi->ctrl_lock;
> >
> >  	max =3D ARRAY_SIZE(link_freq_menu_items) - 1;
> >  	csi->freq_ctrl =3D v4l2_ctrl_new_int_menu(&csi->ctrl_handler,
> > @@ -756,6 +760,7 @@ static int mei_csi_probe(struct mei_cl_device
> > *cldev,
> >
> >  err_ctrl_handler:
> >  	v4l2_ctrl_handler_free(&csi->ctrl_handler);
> > +	mutex_destroy(&csi->ctrl_lock);
> >  	v4l2_async_nf_unregister(&csi->notifier);
> >  	v4l2_async_nf_cleanup(&csi->notifier);
> >
> > @@ -775,6 +780,7 @@ static void mei_csi_remove(struct mei_cl_device
> *cldev)
> >  	v4l2_async_nf_unregister(&csi->notifier);
> >  	v4l2_async_nf_cleanup(&csi->notifier);
> >  	v4l2_ctrl_handler_free(&csi->ctrl_handler);
> > +	mutex_destroy(&csi->ctrl_lock);
> >  	v4l2_async_unregister_subdev(&csi->subdev);
> >  	v4l2_subdev_cleanup(&csi->subdev);
> >  	media_entity_cleanup(&csi->subdev.entity);
>=20
> --
> Kind regards,
>=20
> Sakari Ailus

