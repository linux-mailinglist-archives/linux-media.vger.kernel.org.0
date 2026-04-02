Return-Path: <linux-media+bounces-57925-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGHrJtIdzml7lAYAu9opvQ
	(envelope-from <linux-media+bounces-57925-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 09:42:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BE738556E
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 09:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D14CD30374BA
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 07:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5978A387358;
	Thu,  2 Apr 2026 07:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BkNq179e"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD751C84BB;
	Thu,  2 Apr 2026 07:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775115347; cv=fail; b=Za9+mUM4yYufUPuNlkcdlnCAUAmnA4E368TCTzDWKNvnAUrBS5Z1wMbBPAL7h0HWzh7btvfTu/u7fZ7uZP20f3ShpCQaL2q4wbk9RQKRrXyvARAF4ieesHd88I5zbn/nlJd9Wzfu2BqAkvusHahM82cFkJHIvspwW1ir4iMe4gY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775115347; c=relaxed/simple;
	bh=fOged9+g4rqc9/Tw4RZFGNDbW1rgBRUVhIH/tyKDu+8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dsw8lt1ZRHxWflZookb2YaTVmbY7xTnLNhSReXO0XP1/bbUe3br0Hm8pSAC23KddvWAxKzGealmPvEyXg10rW8AWadwUBs04p0KH3ntqkQvpO1CMiWYQ8hS0Z9NV3BH15PH9ovC1idZhonmBV2o1nFtHYghs+544XUdvFBQmNSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BkNq179e; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775115347; x=1806651347;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fOged9+g4rqc9/Tw4RZFGNDbW1rgBRUVhIH/tyKDu+8=;
  b=BkNq179eiqOsXfRQPshugi+zKRQVK4hNL+z8Zv3OxEeD0laDeum93gM6
   YDd1dXyNF8s09TGUojgvucCzZ16EWS6GA0umYuAkOydCB3jkWzwE5rK8g
   5DoBZ5lJji+mPk0ED8YUQF361OTfoBlKvcO44nfAricVZafUgJPYv+a1J
   cIJxdXGaNqZZ3j7DAZgFc2O1HSNE4ndn8LjLRZ2nPCcICq5PIads1K4DE
   VGtdxkWBDcrs8CA+KiWzTKc4p5XJ1PEVWdBhUgj4kiInQcqj7tjuOxJ3r
   HFnvVxkd2aFf1nc+S0fNSoOek+Ckgox1871ogo5PGFcie82rbJvE97uTn
   Q==;
X-CSE-ConnectionGUID: Hi3HmjVpSlaqvlLuip9THg==
X-CSE-MsgGUID: TEG1rVk1Q6+nU4qZNSCkdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76048032"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="76048032"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 00:35:47 -0700
X-CSE-ConnectionGUID: YkUXVSINTBechVVAr0BNUA==
X-CSE-MsgGUID: HKjFQ9nmSwyN52lTmLSGZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="250114458"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 00:35:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 00:35:45 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 00:35:45 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 00:35:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VEKDpwMBoC3qmH5+Q6SaFUWedu2kvt0WbRpso4KlhRt8VKB/VgSwnv9LVIqTQpNiZrU5IxFETgpsVEEvnd/QgBWeZWCw023nlg1GDfe60oNidy7PHNO4mM/sqpkuwqd7+bQc0fKPMiXXv73XcFGRVVvVymEcdMPGfyJsvG8jxvpHi0Tg8iYnhbxPd+3g2SJZR9X0xvsNFMNBq8gVBND/fRmORhmwLw5oN2fUMFnq7/0DHK2IA69O77LT1sqgSEdmR2fZUbDquBRy59UZRhayj+cllXztEj/FbxAO+pp4/QSLa57tSKY4w4Cowl1I5hMUsNFizhVVeztquIMK6nnDUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOged9+g4rqc9/Tw4RZFGNDbW1rgBRUVhIH/tyKDu+8=;
 b=dOscYPAsu1lJ3w07Z56YX0q62aD93ZUnOmEsyjWgppU2KM57JYRnRjkOcn06YDbyTHpqCtoplcLMM9PwVo647PRlr5WZqTfUZpP1eezP0JBlDGTwIlo3ymxGcymnbGh4sa6KSu2r8pe5WRKX4Fy0NiOkOXVeF5SAae2HBeFBYTGVSIIgb+P+WAyLQ+fcmsShBLhNFVx0JvYtCzwVe6vqe2XAIL5Kupgzh+ti6Lafdptdt6b6B4jxGRi50/klu82iuIOjqJdVHcqTfnGIAmjH0mSNxYpI4FqcwRfp6nOWXBqcAFfytTrvITWc7fNUVO8B7HWv16VtzWk/Q2FzL9voWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8022.namprd11.prod.outlook.com (2603:10b6:806:2fe::14)
 by PH8PR11MB9770.namprd11.prod.outlook.com (2603:10b6:510:3a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 2 Apr
 2026 07:35:37 +0000
Received: from SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce]) by SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce%4]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 07:35:37 +0000
From: "T, Arun" <arun.t@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>, "Kao,
 Arec" <arec.kao@intel.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "dan.scally@ideasonboard.com"
	<dan.scally@ideasonboard.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Djait, Mehdi" <mehdi.djait@intel.com>
Subject: RE: [PATCH v7 2/2] media: ov13b10: Support multiple regulators
Thread-Topic: [PATCH v7 2/2] media: ov13b10: Support multiple regulators
Thread-Index: AQHcwdLgUI4iEp3uq0KngMOcwjUgbrXKJesAgAE7obA=
Date: Thu, 2 Apr 2026 07:35:37 +0000
Message-ID: <SA3PR11MB8022E9841A586040992170349D51A@SA3PR11MB8022.namprd11.prod.outlook.com>
References: <20260401122030.3955499-1-arun.t@intel.com>
 <20260401122030.3955499-3-arun.t@intel.com>
 <ac0SWIPXv6SQo2zy@kekkonen.localdomain>
In-Reply-To: <ac0SWIPXv6SQo2zy@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8022:EE_|PH8PR11MB9770:EE_
x-ms-office365-filtering-correlation-id: 681a6e91-0079-43f2-31f7-08de908a6f01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: +b1MU0DM1RArufhCf+TCGBgP12ACiwdeHHAgw98nzlOJGEZQ6jLQikHStPSO6/sCdAtT1YHtXNNbR92B8K+628ncuM/t5XFZn+7CX4+An0RHHcOQqYC8Svtcg+UAwK2gBodsMrI5iRidNDxR28fQ1gtJcD7wdzFbArZyz6tJTgluRy12y8BU02VhIBSAde5N1Q7N//h8m9H8laYcQGX2VKqAb4ToVtTWtyoVh+Z3bf31GgbVbxqwo/GSZHoAjNdIPcNL2KvZGrwSQ88mYSc6TwycrWj+usZjlq8pgcDn0yi1UrIpmZJoUpKJO8TzEXBzxoBAtpV4RF0PKPSUGBAVEGbxhNy8bvn9ObOjkrVjUhMnyRyF0Cz6H5Ei90wdBF+8VfE5UqRhc0xftEffiPwxoAifztHehU1sEM1JDhs7Dt3viUZIGIHee3OXUOzZhwgIKgGlyji10Q2WhiV5QUjcLZVdtFA3rGCeloLPjT+n7pVXaQRzTqUwN57P4Da4nwnFvOFM1b7O/DZOLRGygroAOSIfgztHfQ7V2Gxvt9iIjwYw1/jMJbvRTmjVUbpaLcXIaZW3gQLQcK+TaVt0HF/ziAZ9v4/NjW/xzVz4s2el8Fr+BH5gHfIqIdPWsmo7pi3PzJwo7a2aisdf+XKH5sUzmSYSj0TgmnOz0LxfztX4EC2QHfNXTDBFeLb0s5SdnQ7DStcDNWarPkb64MJAucE1wrHSJT6PiZ0dNiwbyOkuIz8apHqNAuroGnjF6KoZtpN5euTtIHZ3EYgSdgzxhC47TVO9GyxcSetWM2qdxrHd9vw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB8022.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ySriNt/3+NsbNxHhjtYLRaNsU8XzOqUr612h7HGbZ+CmwQj3wqTsWXFaynpa?=
 =?us-ascii?Q?vpGD4Wo4ZX0e8jgFc0vg1Zc4pR3Ho8pHxhDnV+xGJFgGZY3blnat98iX/d/3?=
 =?us-ascii?Q?duQHEPWstHXP7JErdpBbNeuFtCCMRQTYgF/RSBY4qhzp+QJ16SeCON7l70Dk?=
 =?us-ascii?Q?gRLETWdelp3yUG7yCHvKIROeQbaxCl+XQaXggLczAl7/2rZbZJOu3l1As+yd?=
 =?us-ascii?Q?27C3dm4IwezuVwyX3iWhY+PBiVXCbYETIHa4pvOxDKP/EMf2DIrKaYTjFPKN?=
 =?us-ascii?Q?ePjaKLPV7s4FFvo1LMvvy3iuIH/IhM9/PqWTpg3lt2vDMeE3Yvs6283FVnmR?=
 =?us-ascii?Q?9I+OVo9j9bGmplU5nzjYF+iN9DxgbD8O9zetzRBvnCWZyhRLzgu/8L4vDyIb?=
 =?us-ascii?Q?5a59+jxEUlHO5Ay0PiI+kLSAr2kPDjOJME93CuNTY4kpvcHpzoz7y4QS/m+j?=
 =?us-ascii?Q?QYKO8wsSBRKrH5QeCCL+K1R03sIp281U0xqDz1vrGduB7t7cjDUsE5z5M/Ex?=
 =?us-ascii?Q?9ei1El4qi00FDsvH8LSzTjHbI0GTg1tsmFNDwI27Yx0ujKOLXtVHqSHyMMJA?=
 =?us-ascii?Q?xqk2DxEkSoZ2w3OsjXpzwHeI70bra4sluMGTqZvWanIJwX7BtfDdSSttC/ny?=
 =?us-ascii?Q?rTx3hm/fjoAj+Ju1zYBY7gqRP6nKWn3kJQ96pTkaXOEcHY3qkU2xuOAbHNuF?=
 =?us-ascii?Q?/80BUt1hfDhseMecnWjPAUhxBRFuzQZ38V+/jjw3ruODoGoF6MvTHkCP4MT7?=
 =?us-ascii?Q?IQvOQnoQ67TxCK22O7Vji3E/ClmYkNOtA+Qc/2bgJyWW9YLtBjoaEJWOxtfe?=
 =?us-ascii?Q?Qfk8AKdxyKC/bWEBGMkRiyi6pYvjXmCsLo+B7Yepzbq0t56F4sYrR7xOmew8?=
 =?us-ascii?Q?agHL+ix25wrgGkCfJP7N5LMiy7rCEG7gl94M/rOq/3Jy+QsLoDqUOhYHXe6Z?=
 =?us-ascii?Q?w0IIqomuVaXu9HB94cbDrHqSDa0md4bitJbk+iNOs3S8LVnV9tvjVPZ1n3Zo?=
 =?us-ascii?Q?cKM3tuQFUqUNqT6PD9j0BTUrHrIJpmlp8+7v+ag5H7/LMCH3kYEdb5pWbRyO?=
 =?us-ascii?Q?G4Ol8hhHwdOYM/HxhclbqPL/9nyO7pM0mYJE2wam+L/6uKic3PvgSHJ/4xoM?=
 =?us-ascii?Q?QFUFJfyqsq+WpW4yBZ68Iii5+EX+wj1duU52yWytY+bMb6HOtaxQEalw/fo/?=
 =?us-ascii?Q?V4gJgLCI2z1LTXQYEPt9jJgjaCP0B2XrIO9hi+GLX7V6E7CJ1ZwG0odzBMaz?=
 =?us-ascii?Q?SqxGL1wtjEH+kCcrby3KlFMHxv7KgfexNr/dEOWCBfkCl5NpFzLrRXLWkx+d?=
 =?us-ascii?Q?UZshPwD6+pVN9pk/GaNI8EjAorLbNLXtgWKbDuMT8bziqhsWXig5qr2xGITn?=
 =?us-ascii?Q?3Saeel46ZWYZrNx64iaQV/WvslI55c/18k/mYd/um5E3HB/rxtMBSOOgh+q9?=
 =?us-ascii?Q?mginV1qhEz0y3izdwXwcpygsXVgSVDRUBknQ5kWo3AfPGyfqFjLqBUyNWOBQ?=
 =?us-ascii?Q?6PVMPKK4VXNiZvrf8MQkftIyN97NX/ruwiHDMCN0avQPWSMGLvd59Y6uk7q/?=
 =?us-ascii?Q?525JXXfHe1ubQ2eo5NIIGRUC0lnC5yBJkqQnnHHHPoh8sWhlh5flUAPv3gjX?=
 =?us-ascii?Q?rUyptQiYAlGzL7ymJviqbV+W0ra88OXecoUihrfWkFz74ddzyrSqcEmvWuvQ?=
 =?us-ascii?Q?3pMK/PDEhWzr96WTtUGV3depCKwHNMW0/OWsBPVZ2fmysPCl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TNkYShohzxhiO2viMm5iRomhMQofxflkkINOJzIlXMPLJNbmWW38HyidpKciH/HLlF/sJdvqOvGGTPs7D0leHwPuf6GUpHSsFB22t7zFOyZcDjv3/8SL/4e6LHVPzgZjszZsVLl4v+YAV8wEOXKYVbNMR02gG0Ncr5lfEkwvbEv/6lLhD6LKABQnJW9tp9D9IaQ6WMIRzHxDufJdnyVqo7hdjLi7jy0xcxBZLtIHFMw3cDb39w4mzHCi6Wg1JKgENwzmaLxVZ9EktKtAR+K1Xle+pskBN/gXUVWeMpRhK5luQiZvtBhsChxNhIwUUrpGi1p4ncvJcDoo30DzDhX1Sg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8022.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 681a6e91-0079-43f2-31f7-08de908a6f01
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 07:35:37.5245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 26Htgy5AZBKE/79DvEwQSOhXN+KWNHJ1NMRC8+N6DQdaxzVqfzX9yzcI0YUy4nNzWe2hpaG2a6WeX9HmJdZSVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9770
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57925-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 52BE738556E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakarai,=20

Thank you for reviewing my patches and for your comments. Based on that, I =
added you as a reviewer.

The other reviewers explicitly asked me by email to add their Reviewed-by t=
ags, so I included:
Reviewed-by: Daniel Scally dan.scally@ideasonboard.com
Reviewed-by: Hans de Goede johannes.goede@oss.qualcomm.com

Sorry for the mistake. If you do not want your name included as a reviewer,=
 I will remove it and send a new v8 patch series.
-
Regards,
Arun T

-----Original Message-----
From: Sakari Ailus <sakari.ailus@linux.intel.com>=20
Sent: 01 April 2026 06:11 PM
To: T, Arun <arun.t@intel.com>
Cc: johannes.goede@oss.qualcomm.com; Kao, Arec <arec.kao@intel.com>; ilpo.j=
arvinen@linux.intel.com; dan.scally@ideasonboard.com; platform-driver-x86@v=
ger.kernel.org; linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; =
Djait, Mehdi <mehdi.djait@intel.com>
Subject: Re: [PATCH v7 2/2] media: ov13b10: Support multiple regulators

Hi Arun,

On Wed, Apr 01, 2026 at 05:50:30PM +0530, Arun T wrote:
> The OV13B10 sensor driver currently handles a single regulator called=20
> avdd, however the sensor can be supplied by up to three regulators.
> Update the driver to handle all of them together using the regulator=20
> bulk API.
>=20
> Signed-off-by: Arun T <arun.t@intel.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

You can't add Reviewed-by: tags that haven't been explicitly (or otherwise)=
 given. I haven't given mine on either of the two patches, for instance.

What about the other two?

> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com

--
Regards,

Sakari Ailus

