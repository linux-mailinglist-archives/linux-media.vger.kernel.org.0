Return-Path: <linux-media+bounces-57837-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGnXN6y+zGmYWQYAu9opvQ
	(envelope-from <linux-media+bounces-57837-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 08:43:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7AB375560
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 08:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A88FA308D7DC
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 06:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA2E33B96A;
	Wed,  1 Apr 2026 06:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhBvXYKs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02A433A6F2;
	Wed,  1 Apr 2026 06:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025831; cv=fail; b=k4SNI4/yTjZx2QjfhxAX+d/fihAqX4GvADpZglzxTR4XI9A8L+P8W7qGWd+mmDBrelGLIV1wdKvJeWu/nKMmIhPamlr+cIDqPHhbs78h2z3lkGMNDGhMCPKMlBnsy5nRFXKPtJn1Pqed67Bp/cJYGaZ/wz4X+YxU8K1gueGvrbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025831; c=relaxed/simple;
	bh=inAqq1puFpYiHf2rEaJPiJ5gogKSYjGnBq7dGhxIpiQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h/hxNKqqLkIMaEEcjsKf/55r96Sv1/Zcv8Usk/o8dbs25Iq4JULlnb5iKMUIK9Tyju2gWiuEN5NtE7p9ZAhcKYhf0Q8Z2hfBDtSiNRKd3wRSQnjpiVl6gWVysevz85LZaX+pi0tWte2YzwqciaZN0UVV9d8ujz81Zip1+UbuUHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhBvXYKs; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775025830; x=1806561830;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=inAqq1puFpYiHf2rEaJPiJ5gogKSYjGnBq7dGhxIpiQ=;
  b=FhBvXYKsK8KAprJ1xe3jqYW1sBnf5OyrYOrBH1X/18955XIN1GA3MRZs
   okJR3/nUUyTN8AJhDdY82hXrcjTXTQTzgxj78xmESeiKgLUFszTB7UnNx
   cvIPnFcOfcGqfY1mv8zTbjEu68erEnuw3aDiXCVXsU75qPG4CJNnJ6FcY
   YoHUXYLfxoA1fQOWi8yM/dG4x5j0XvB8cJSz5FtbSRsN3BTVe9LRbqU1c
   pGOCjUOT+kxYvozYfcKuwpm0Pq1Q/+QkL7xTAg4Wm0swOwX0Kv1bkQTNg
   c/+Ytn3qIzEF24Fiwl/zq12PJWfO+gNWJa0PxFI3sCEaJoeYeA4lCitOQ
   Q==;
X-CSE-ConnectionGUID: 1h/WUPnZQ1Su1FDtRzcATw==
X-CSE-MsgGUID: aU8hHYI+T1KvF9f09bkk6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76244204"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="76244204"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 23:43:49 -0700
X-CSE-ConnectionGUID: 6I4S6894T2KDVI2CK9g0Qg==
X-CSE-MsgGUID: 04/hLgc/QQCuYWDIalaLXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="230651015"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 23:43:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 23:43:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 23:43:48 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 23:43:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIyomFyLLIt9pb1Yowv26cGQCDkAEySTj+iptXSrPdLd/Fs+6ORz5+u1KOy02I1xbxyTYCqlKdRcx41zuyD0cDx7hBdSDPnwcT+j7Ev+Jr20C7l6Eur3VeZ31szTduSdYEqOkgOuFTHHNmCPVjGiCIKFkKGBne6FRm02mf1klufEc/YPsd9g14IzqTZex1njrsExjknbSPr09l9t1EvUQOi4PgOYAFZAP1vN3lq7smkn67yk4+hbJZBBDrtddTxpY83Ffm6Cvh9/BaRzdRsm9qF6/g9vomKc6Va5+ZzN6W2EEDFW5r+27slBdmERnV+A+9xPJZBwe0NK5p/jzc02Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sq8HHJyC6ThZDycOgPLvteLA74DaJwxoqYqSySvZHsQ=;
 b=bdRN25nFyeQCh8qB2lAi3FNXecp/vtlyGyGXEZZ9+e0ZP/QCVPGOf/mU4G9yZAZDoDUH1np5jM7MtwzOwYdrxsYy4Zgw1bKgA2xS/vPyqYhY3Nv/e3KpULoN+pP13jcr7XWQKq7SuDTPeYB1G58aiomZUgBnfKZKUxU9n15L+xzRIdZA7vj7TZashruFMYD97rwYmCg81giqBUPdDT3fJC3635ARamuHc7x0Z0SqgxxORc4OweAvq8WzVlH3ZB1OOSUz+D5eLlr0wvrHQwtxFBiFjkyr6DjZScyfNJ+ND8dME3Z+NA+Po/XJu9SVNGJjSCg4sLOryi4OeXFYB27Z2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB8016.namprd11.prod.outlook.com (2603:10b6:510:250::6)
 by SJ0PR11MB6576.namprd11.prod.outlook.com (2603:10b6:a03:478::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 06:43:42 +0000
Received: from PH8PR11MB8016.namprd11.prod.outlook.com
 ([fe80::1880:d6a8:7f5a:6e93]) by PH8PR11MB8016.namprd11.prod.outlook.com
 ([fe80::1880:d6a8:7f5a:6e93%6]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 06:43:42 +0000
From: "T, Arun" <arun.t@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>, "Kao,
 Arec" <arec.kao@intel.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "dan.scally@ideasonboard.com"
	<dan.scally@ideasonboard.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Djait, Mehdi" <mehdi.djait@intel.com>
Subject: RE: [PATCH v6 1/2] platform/x86: int3472: Add TPS68470 board data for
 Intel nvl
Thread-Topic: [PATCH v6 1/2] platform/x86: int3472: Add TPS68470 board data
 for Intel nvl
Thread-Index: AQHcvhc7PV1kkAULr0iXIPSOZa8WobXIhj8AgAE+1jA=
Date: Wed, 1 Apr 2026 06:43:42 +0000
Message-ID: <PH8PR11MB8016901A604B7463AEC482E59D50A@PH8PR11MB8016.namprd11.prod.outlook.com>
References: <20260327181959.3528753-1-arun.t@intel.com>
 <20260327181959.3528753-2-arun.t@intel.com>
 <acuvZPg6saIw53lv@kekkonen.localdomain>
In-Reply-To: <acuvZPg6saIw53lv@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB8016:EE_|SJ0PR11MB6576:EE_
x-ms-office365-filtering-correlation-id: 9cb470e4-c3cc-4c20-0c34-08de8fba03b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: dgNhytYvRhutw+bisKWIuy/ZANB6BRZ/I3+eKELjvdxTrDIK4CoHWayRDe1pHaxRewcuyI3QP+b3vOGaP8qzZ4vR3pvMusCRQ3GbgdGRQzbq6lHkbQAXurJR6vIG6JjshM6ez3lz27Wk0ds/9HpB1NUtMGoepTERe5foVAsfm5cIHmSXOGO6N60GUJsC/uB7U/nutmgRp90WaycttYO0t3QoLSBMoyldY+FQvaIM21nHfCEbx6WZIOg06XGCNzntsgcyrvSujikKOFPrU2qsfiVzU025ddzlEDx+7obeeyFqrsJISydbSXGC8Cue5jFnDPGF4RGlhbh9LBAif9ySwDasc1cbfoRnpRJqgOWNejOQA2RobeuSIAVbxb6Z+Y3gkIN18Qdpl0AfFL1Wg8oaWHxDT3Mnqup0soDwII2qctQT+eqFw9QlaDPuO5WZy02lOgxa0tkaEfWN5r11qMPH85SFMevQ5xU2uQJWS+rdTKmVTmcvZFmoYUy/Q8aDWOjZsE/AFuJjWvRzEjFtnGZE+F1vo4absNZn0Nhfw69TBNktlnO+SLE4gTbaotuSVr6Y2XIFyXN4FEl/FbhEUsJydTuEqSKq9L86++4Wi2uLs1922q0CSNuPXHD6rz+RecaiRlEEeQSoCewSgHTlWzL7QW2v4uwy4FI++fiVlwLMDeqx1z/m6W9pI2gJHnJcdA1d/okmieLGDLbFYt8KiEQj5So4lj8OC3xy4PGK0vBWtvnsDFZ2/OHAnxkyGRm1BVRZ4hyO0vC5PiIS6wSPo/hKYevSn5skJ+JwhsXBeFbt2cE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8016.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t0NWi6jz/st7VXKqAXmTw4qIXiTVcN5+evPGzi+3WSh6BrX3B5ZNIkLLMXLy?=
 =?us-ascii?Q?BENoQQmVd/6qcFYRHmytZ1fRitkxJQi5k4mRjyDIZb63AmSvYpayZ9e3me/G?=
 =?us-ascii?Q?6YWofKH7pCdJbNQqz+cIIJZHEfvLTgliXJVZrPE0Dvrm1EQZbXs62eODG9Rz?=
 =?us-ascii?Q?RIMwhimqUtlmPRpIAlsEbSffS7e8tLKyT0XqE35eWjn9LmOaPra40gq/d+F9?=
 =?us-ascii?Q?fPZlURyVmSs0JxOErhFkGu/zFy2+4pWYmvfDmbhxjZwRGr7F1a3wYZtwyQJ/?=
 =?us-ascii?Q?PpFS0m3BaQtshD5CE4Xsa1oSpRQNK3AGauxs0XQxocLgxPF3CSUugTh6igvz?=
 =?us-ascii?Q?lfUIIaF6lC9xEOvUuc9F9FvI/gH9JIYfvfnAz0adOJfLYogzpxRF5g71kV8G?=
 =?us-ascii?Q?9grKsrJ44arQig6b8G2sV7aDib6T2EaFeeMoIKxUtscsIz7hpNY+6f03/NIy?=
 =?us-ascii?Q?M4dB/IcuLYGdy2mFd7U1cX/MUlfFX3/Ej3DkK+KmhKf31qtdXhoziu2kcWBu?=
 =?us-ascii?Q?fUhYGssiJbVoMJefUDO8W9ZDzHyb1XkYEJhpmaOAJzm5FSLyLcb/ED+ag24I?=
 =?us-ascii?Q?/qq/bdFckUmBzlX65NBdui81FKLJMZsQf/B0vfknrVDrVBnyTMHqd/veXYB5?=
 =?us-ascii?Q?PyKOq1nstY+C7gxpAhf6afgH/Oqt6JLkcu1dzOvhcdxQw+OyOPm7heg2EzY/?=
 =?us-ascii?Q?yDJNj68F/Mw2VV1seacmXE9CysLtlj1HTcIpMQAs58bc6fLvrZNGMZsmuLaG?=
 =?us-ascii?Q?sAIVj10oQWUUIjPBuV38eYdoB30aHOtFtWiUGnt2CBx309OzHRkhJkmMNlwb?=
 =?us-ascii?Q?BQdCp0SFPq1/PTqykya8zPwb/PZweEeAUlQW3xpOBCYHvCfpQvg0Xd9HfR0a?=
 =?us-ascii?Q?kuWPnnlKDaWV0lXrXznk4rc8o8QuJpi4Za4hYcyQUjEtXBQ7jZRAO+ahZiT6?=
 =?us-ascii?Q?BpiUEOZO7BV4ZurwzAWIDYK6YwJVXWEK0a5yBlyrBDWnBicFHShEP1m3j5eZ?=
 =?us-ascii?Q?J++4yTCQ8QPK9zmCtKjvRBaonryExGCeWbEWJ7klAen1HO8ZXBfiHxhQTRnw?=
 =?us-ascii?Q?ntxLTR1gQIo37RC50WY94TdvwpRL93j7kMylb4I2tf/hwtoZ002A9n0PhoDH?=
 =?us-ascii?Q?6ALMPetQP1X+wXS0JQDFQVpo7WxSbSsy27Yh8ZtFWhUgsCQjh2ENEndSv8+i?=
 =?us-ascii?Q?X1G1gHHT1anooTpJ1+WgfEbEsl8EoLjL6DCS2nPcDyt7dMyIpzSs/IK//wvj?=
 =?us-ascii?Q?1PDK3/MDFQewByzIe/HxuSYoDSJGWKHfh+5pODX19XTU8/y48mAK7fZ5I6mD?=
 =?us-ascii?Q?H0fY+d0sBOz9ynHFNY7AinPosK5Im4gMxJnlxvhyp9Tzmn2JhLY6lU1BL8Uu?=
 =?us-ascii?Q?hdnrRGvtApQdGmrkFgyODVboF17vWf7LWbKvJJmFxg/AvsSe33G4saz6kvC6?=
 =?us-ascii?Q?heuZT7tTi0k8h2240PS7p2/pUs1OvChmHBj9w2VIpvRCziMhcCcq7CafUyCV?=
 =?us-ascii?Q?0D9xyuc3ViRhzp3n+7t0yzNYoNsApvHgUAUR6lBb6rq1sJ6E2QdolNnawqvS?=
 =?us-ascii?Q?T2AVCrKTO0i4xcu1gdzyJUURCXux028Ghg1d87prVnfDii50PSnjUQodNqhM?=
 =?us-ascii?Q?2tijx3KNmoy58UlT7q+GkR9AcKeupN3aj4pNMNADcwJkM+0SNKvKtX49pUol?=
 =?us-ascii?Q?OFoS2IY36uaXdvCgpGJn1uo+ZTCoHt+gAWTLzX+9ZoAq3a/G?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MnG2o+bcFlO2XGIsrs7zst8e8+1A/OZC4B651fqCW7nfWtbKnqt1W8fNw7AWja+ZnLLY6MBQsTZfaDY2e3AaKtTQYb2y6IZ0JXAqAz1xIFJeKCdcV2Yq5F5OQZBf7HGfTgnxy9fPAB0s+RbWZ32nDNceKBeMvDEbazJo5vep881sTbJp3wsKZERKOOH5gzClnJa7ZY4P9v9LhRJPMNuJjmMXnOxErmXw94j1stTbvNfrMD/egcnbCiNWkUZD07xuNJSmJi8l9EVPhZzte3Er056MhkNCXYCoxmGR3XiRfBsotnb2Izawr3ZHixS7u63U5YwzA1h4kn5wBLL/kjX9ow==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8016.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb470e4-c3cc-4c20-0c34-08de8fba03b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 06:43:42.1823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Inyj7QPY342+ZVq2dRUocMaM5cIi0LwFrFNKkhSujqI1+vecNMtiJi6w1+THmsv3Y3qZOzkJgtoK2BQBYoCkWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6576
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57837-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6C7AB375560
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

HI Sakari,=20

We are seeing below errors when launching the camera with auto focus enable=
d for DW9714.

The regulators VIO, AUX1, and AUX2 are not required incase if  DW9714 is di=
sabled in the BIOS settings or kernel configuration.=20

I believe we should not remove the unused regulator, as it is required when=
 using autofocus for the sensor.

Please let me know your opinion on this.

Camera pipeline error:

[04-01 05:07:41.452] CamHAL[ERR] V4l2_device_cc: SetControl: Device node /d=
ev/v4l-subdev7 SetControl(int, int) error: Input/output error
[04-01 05:07:41.513] CamHAL[ERR] V4l2_device_cc: SetControl: Device node /d=
ev/v4l-subdev7 SetControl(int, int) error: Input/output error
[04-01 05:07:41.546] CamHAL[ERR] V4l2_device_cc: SetControl: Device node /d=
ev/v4l-subdev7 SetControl(int, int) error: Input/output error
[04-01 05:07:41.571] CamHAL[ERR] V4l2_device_cc: SetControl: Device node /d=
ev/v4l-subdev7 SetControl(int, int) error: Input/output error
[04-01 05:07:41.604] CamHAL[ERR] V4l2_device_cc: SetControl: Device node /d=
ev/v4l-subdev7 SetControl(int, int) error: Input/output error
[04-01 05:07:41.637] CamHAL[ERR] V4l2_device_cc: SetControl: Device node /d=
ev/v4l-subdev7 SetControl(int, int) error: Input/output error
[04-01 05:07:41.671] CamHAL[ERR] V4l2_device_cc: SetControl: Device node /d=
ev/v4l-subdev7 SetControl(int, int) error: Input/output error
[04-01 05:07:41.704] CamHAL[ERR] V4l2_device_cc: SetControl: Device node /d=
ev/v4l-subdev7 SetControl(int, int) error: Input/output error
[04-01 05:07:41.738] CamHAL[ERR] V4l2_device_cc: SetControl: Device node /d=
ev/v4l-subdev7 SetControl(int, int) error: Input/output error


Kernel Error:
[   70.953426] dw9714 i2c-OVTI13B1:01-VCM: I2C write fail
[   70.958675] dw9714 i2c-OVTI13B1:01-VCM: dw9714_vcm_resume I2C failure: -=
5
[   70.967467] dw9714 i2c-OVTI13B1:01-VCM: I2C write fail
[   97.330226] dw9714 i2c-OVTI13B1:01-VCM: I2C write fail
[   97.335456] dw9714 i2c-OVTI13B1:01-VCM: dw9714_vcm_resume I2C failure: -=
5
[   97.344461] dw9714 i2c-OVTI13B1:01-VCM: I2C write fail

-
Regards,
Arun T
-----Original Message-----
From: Sakari Ailus <sakari.ailus@linux.intel.com>=20
Sent: 31 March 2026 04:56 PM
To: T, Arun <arun.t@intel.com>
Cc: johannes.goede@oss.qualcomm.com; Kao, Arec <arec.kao@intel.com>; ilpo.j=
arvinen@linux.intel.com; dan.scally@ideasonboard.com; platform-driver-x86@v=
ger.kernel.org; linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; =
Djait, Mehdi <mehdi.djait@intel.com>
Subject: Re: [PATCH v6 1/2] platform/x86: int3472: Add TPS68470 board data =
for Intel nvl

Hi Arun,

On Fri, Mar 27, 2026 at 11:49:57PM +0530, Arun T wrote:
> The Intel NVL platform uses IPU8 is powered by a TPS68470=20
> PMIC,requiring board data to configure the GPIOs and regulators for prope=
r camera sensor operation.

Please run scripts/checkpatch.pl on this.

Could you rebase these on Antti's patches adding support for an MSI laptop?
They're here
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=3Dint3472>.

>=20
> Signed-off-by: Arun T <arun.t@intel.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  .../x86/intel/int3472/tps68470_board_data.c   | 121 ++++++++++++++++++
>  1 file changed, 121 insertions(+)
>=20
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c=20
> b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 71357a036292..f0309fd1e515 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -143,6 +143,20 @@ static struct regulator_consumer_supply int3479_aux2=
_consumer_supplies[] =3D {
>  	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),  };
> =20
> +/* Settings for Intel NVL platform */
> +
> +static struct regulator_consumer_supply ovti13b1_core_consumer_supplies[=
] =3D {
> +	REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:01"), };
> +
> +static struct regulator_consumer_supply ovti13b1_ana_consumer_supplies[]=
 =3D {
> +	REGULATOR_SUPPLY("avdd", "i2c-OVTI13B1:01"), };
> +
> +static struct regulator_consumer_supply ovti13b1_vsio_consumer_supplies[=
] =3D {
> +	REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:01"), };
> +
>  static const struct regulator_init_data dell_7212_tps68470_core_reg_init=
_data =3D {
>  	.constraints =3D {
>  		.min_uV =3D 1200000,
> @@ -220,6 +234,77 @@ static const struct regulator_init_data dell_7212_tp=
s68470_aux2_reg_init_data =3D
>  	.consumer_supplies =3D int3479_aux2_consumer_supplies,  };
> =20
> +static const struct regulator_init_data intel_nvl_tps68470_core_reg_init=
_data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 1200000,
> +		.max_uV =3D 1200000,
> +		.apply_uV =3D true,
> +		.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies =3D ARRAY_SIZE(ovti13b1_core_consumer_supplies),
> +	.consumer_supplies =3D ovti13b1_core_consumer_supplies, };
> +
> +static const struct regulator_init_data intel_nvl_tps68470_ana_reg_init_=
data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 2815200,
> +		.max_uV =3D 2815200,
> +		.apply_uV =3D true,
> +		.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies =3D ARRAY_SIZE(ovti13b1_ana_consumer_supplies),
> +	.consumer_supplies =3D ovti13b1_ana_consumer_supplies, };
> +
> +static const struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_=
data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 2815200,
> +		.max_uV =3D 2815200,
> +		.apply_uV =3D true,
> +		.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> +	},
> +
> +};
> +
> +/* Ensure the always-on VIO regulator has the same voltage as VSIO */=20
> +static const struct regulator_init_data intel_nvl_tps68470_vio_reg_init_=
data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 1800600,
> +		.max_uV =3D 1800600,
> +		.apply_uV =3D true,
> +		.always_on =3D true,
> +	},
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_vsio_reg_init=
_data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 1800600,
> +		.max_uV =3D 1800600,
> +		.apply_uV =3D true,
> +		.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies =3D ARRAY_SIZE(ovti13b1_vsio_consumer_supplies),
> +	.consumer_supplies =3D ovti13b1_vsio_consumer_supplies, };
> +
> +static const struct regulator_init_data intel_nvl_tps68470_aux1_reg_init=
_data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 2815200,
> +		.max_uV =3D 2815200,
> +		.apply_uV =3D 1,
> +		.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> +	},
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_aux2_reg_init=
_data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 1800600,
> +		.max_uV =3D 1800600,
> +		.apply_uV =3D 1,
> +		.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> +	},
> +};
> +
>  static const struct tps68470_regulator_platform_data dell_7212_tps68470_=
pdata =3D {
>  	.reg_init_data =3D {
>  		[TPS68470_CORE] =3D &dell_7212_tps68470_core_reg_init_data,
> @@ -232,6 +317,18 @@ static const struct tps68470_regulator_platform_data=
 dell_7212_tps68470_pdata =3D
>  	},
>  };
> =20
> +static const struct tps68470_regulator_platform_data intel_nvl_tps68470_=
pdata =3D {
> +	.reg_init_data =3D {
> +		[TPS68470_CORE] =3D &intel_nvl_tps68470_core_reg_init_data,
> +		[TPS68470_ANA]  =3D &intel_nvl_tps68470_ana_reg_init_data,
> +		[TPS68470_VCM]  =3D &intel_nvl_tps68470_vcm_reg_init_data,
> +		[TPS68470_VIO] =3D &intel_nvl_tps68470_vio_reg_init_data,
> +		[TPS68470_VSIO] =3D &intel_nvl_tps68470_vsio_reg_init_data,
> +		[TPS68470_AUX1] =3D &intel_nvl_tps68470_aux1_reg_init_data,
> +		[TPS68470_AUX2] =3D &intel_nvl_tps68470_aux2_reg_init_data,

Vcm, aux1 and aux2 appear to be unused. Is there a need to configure them?

> +	},
> +};
> +
>  static struct gpiod_lookup_table surface_go_int347a_gpios =3D {
>  	.dev_id =3D "i2c-INT347A:00",
>  	.table =3D {
> @@ -258,6 +355,14 @@ static struct gpiod_lookup_table dell_7212_int3479_g=
pios =3D {
>  	}
>  };
> =20
> +static struct gpiod_lookup_table intel_nvl_ovti13b1_gpios =3D {
> +	.dev_id =3D "i2c-OVTI13B1:01",
> +	.table =3D {
> +		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
> +		{ }
> +	}
> +};
> +
>  static const struct int3472_tps68470_board_data surface_go_tps68470_boar=
d_data =3D {
>  	.dev_name =3D "i2c-INT3472:05",
>  	.tps68470_regulator_pdata =3D &surface_go_tps68470_pdata, @@ -287,6=20
> +392,15 @@ static const struct int3472_tps68470_board_data dell_7212_tps6=
8470_board_data =3D
>  	},
>  };
> =20
> +static const struct int3472_tps68470_board_data intel_nvl_tps68470_board=
_data =3D {
> +	.dev_name =3D "i2c-INT3472:04",
> +	.tps68470_regulator_pdata =3D &intel_nvl_tps68470_pdata,
> +	.n_gpiod_lookups =3D 1,
> +	.tps68470_gpio_lookup_tables =3D {
> +		&intel_nvl_ovti13b1_gpios,
> +	},
> +};
> +
>  static const struct dmi_system_id int3472_tps68470_board_data_table[] =
=3D {
>  	{
>  		.matches =3D {
> @@ -316,6 +430,13 @@ static const struct dmi_system_id int3472_tps68470_b=
oard_data_table[] =3D {
>  		},
>  		.driver_data =3D (void *)&dell_7212_tps68470_board_data,
>  	},
> +	{
> +		.matches =3D {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Nova Lake Client Platform"),
> +		},
> +	       .driver_data =3D (void *)&intel_nvl_tps68470_board_data,
> +	},
>  	{ }
>  };
> =20

--
Regards,

Sakari Ailus

