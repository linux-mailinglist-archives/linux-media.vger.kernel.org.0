Return-Path: <linux-media+bounces-65083-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BkisFWs9MmoqxQUAu9opvQ
	(envelope-from <linux-media+bounces-65083-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 08:23:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F62696D2D
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 08:23:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=chWn2muK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65083-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65083-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34ADB3098500
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 06:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE743B42E5;
	Wed, 17 Jun 2026 06:23:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E76E31326F;
	Wed, 17 Jun 2026 06:23:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781677393; cv=fail; b=bXLxZYc9q0HvPM8OGRptwBhzdJx+yLWVt+HUkMm/F4lqQI9E9Gm0hrk9T63W1oyJnEiZXdVladuhQs67idTJ/NQgnop+DwKG/L9/Jr5X1uucumF/hh5f722U5ISCmhmtULhIwPooxK7EnjHBS0Nwyc/QXKAvFWqZWrKcn/vIUoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781677393; c=relaxed/simple;
	bh=3L7CUNdCwLzcZEINJ6i6yO/iceN2Cr86bwG42BxKe9M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QEa4rq+/aCXc6Ngn38C4b0QHd1NDNChJVMo+lo1aImISmVtjqGPbksDViup3aQbXpkbEYlFk5nkn2QBOO750EvQB33W3CZKIIzN6e3MKZLOVjUXAdtwzVgNbDA/M6p2qlUWzUXHHZWBASYAOolOydBIgKfRQ6jjwo2TCphvz/Cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=chWn2muK; arc=fail smtp.client-ip=198.175.65.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781677391; x=1813213391;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3L7CUNdCwLzcZEINJ6i6yO/iceN2Cr86bwG42BxKe9M=;
  b=chWn2muKIP9n+pi1V5vqesUsvCQd2BiSzsC3BV8RJNgMlLL9c4nw+fLq
   /8Ef21ZMs1xij49iSJNLAps2TDC9JMRln+uIuu38cqWGlR5c3rbN4QMGW
   V+ZF7OTOU1tst8FHtGkVe/OOSWN2kyY9/K6misykuMmSYBp+DsiOSWplv
   Lgnmsdp7Pb1wTExY2o+Q2j0IBx1WHb1rttdEnatvgIaMzEpnNR7GGiCEu
   Z2s2Vyev9Zp6xaaAtgQLfo/OgoQsBuEFFfvXnitZNcCG42+7DGn9z1fHd
   eouemed9IjjiwQMXXf3gLFFScJvGVHtqCfVH+WsXSXkUWBAeNgl9xww9o
   A==;
X-CSE-ConnectionGUID: BLJ8Nv/9Qp20+Ru0XTkJjw==
X-CSE-MsgGUID: 1DQuuxPXSJOP7QZ5u2qV4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82571197"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="82571197"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 23:23:11 -0700
X-CSE-ConnectionGUID: tC9+5AxqTlS7aDimNtdQFw==
X-CSE-MsgGUID: dMr17gGqQCqRRIfdlAEHAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="243821375"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 23:23:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 23:23:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 23:23:05 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 23:23:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZAU6ebBUZAclWyLQmnkn3IwrfeH1sAeQ7rNhl76X5AYmYpFwsqEM8qL0vf82RVTzXFh6siFuXLUbpqiko4GLKKrqrG+Qwjps5YebdjulkNZVShBcxR5nGLW5Q4hY8AkYBkixz9ZZiwcKob1BNSaoaX3wSjbjf9gpsU6oRRIOzD0Bdzpkflg9XXe0DGPWwEnZS5QKdhN6Xly9YEWOY75JsZS8+FlMT+4gLLOITa8MHKPSpSXZpsfc3DP9BVHw1GdYnJQjeDwbjMUZmuwBX+etNkUACwhgE+FRX7PMYaVVjUYJt2Kyp4VciKMI/z7pG6ePnO4wX59j1doJaSLSKssjfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POK3KX22aNgG0qPCnRzg2PDGkFFlOrFVMgCdgKvDHv0=;
 b=gxWPK3xyuU9fbPdMcxGQvvme5COgLvcjtAVO0sdMnjw1F26LoeIC8tCyN2uVFzWe25eNFW0/sSSqD8Zjx43C/J9qzV1tiv8gE3ZcvJ8xyzeT9TUgO0MFi11QJGaKXRsnVK5Xr54iYMiUetLsXx5QIRnZRK04yQoo7J6kSIukItbkEWcbXGIrlfgM4gHgl+BBCQwtuYHLtLaVCUR8oQLT6zw29bl05bKxlONX6DcJ6uJFDOiNXR5SUM5atcDbaL/GZKMrT5fwxiJ7S7Wm+LvOW9hwParSPbi6S2S9R5CkTQyX+8GxvcLTkmsPe6T0wkMTlFXfbQSUELSvDvHPkgoNMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3687.namprd11.prod.outlook.com (2603:10b6:a03:ff::26)
 by PH0PR11MB5952.namprd11.prod.outlook.com (2603:10b6:510:147::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 06:23:00 +0000
Received: from BYAPR11MB3687.namprd11.prod.outlook.com
 ([fe80::14b0:6b4c:1431:d2ee]) by BYAPR11MB3687.namprd11.prod.outlook.com
 ([fe80::14b0:6b4c:1431:d2ee%4]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 06:22:59 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Pranjal Shrivastava <praan@google.com>
CC: Matt Evans <matt@ozlabs.org>, Alex Williamson <alex@shazbot.org>, "Leon
 Romanovsky" <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro
	<amastro@fb.com>, =?iso-8859-1?Q?Christian_K=F6nig?=
	<christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, "Logan
 Gunthorpe" <logang@deltatee.com>, Mahmoud Adam <mngyadam@amazon.de>, "David
 Matlack" <dmatlack@google.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Ankit Agrawal
	<ankita@nvidia.com>, Alistair Popple <apopple@nvidia.com>, "Kasireddy, Vivek"
	<vivek.kasireddy@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>
Subject: RE: [PATCH v3 6/9] vfio/pci: Clean up BAR zap and revocation
Thread-Topic: [PATCH v3 6/9] vfio/pci: Clean up BAR zap and revocation
Thread-Index: AQHc+PAbYETvhcTyrUu/DN8Pu72QKLY7VG+AgAWiCfCAAJoGAIAAuK3Q
Date: Wed, 17 Jun 2026 06:22:59 +0000
Message-ID: <BYAPR11MB3687AE280241C9E00B46FCF98CE42@BYAPR11MB3687.namprd11.prod.outlook.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-7-matt@ozlabs.org> <aixgZQiBQKgS7yIM@google.com>
 <DM6PR11MB3690489DB5FA611413BF60558CE52@DM6PR11MB3690.namprd11.prod.outlook.com>
 <ajGbRE3WWJxNxcrg@google.com>
In-Reply-To: <ajGbRE3WWJxNxcrg@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3687:EE_|PH0PR11MB5952:EE_
x-ms-office365-filtering-correlation-id: f221a3d0-f056-4f6f-6a97-08decc38e103
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|4143699003|56012099006|6133799003|11063799006|3023799007|5023799004|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: kKXv9n/jC0aLIy8LedzpGNbKhJm8WMkCWCemPzxBtEDJ2cH3C0cm7eLPkBgSrNsGOK1io7pxNPfBx0eh4MC+AR0EjoXuiVjETz6tbRNQgTj3g1/MGgRNCDbdQG1BgybmGZij0ca3ZJXylwr2M/+CC7Mr73iAw4CfNt4AgxB7tqj5w9SSkbFLqMepCGdnYHf8GHR4NtV1pW651YcrmPk1SEtUf4Se1D0WYlT76r39I8j0OYtRvQSsvNZyBXmKlTH6MyuZSUOTY1z5aNOQDbACUq6KDU+oIMow6XM1hbtbE7cbdFV1nqiuF2kR7mJMXZPInm8So3r8mxdJgOohycUjxE72wyKP5ocabf62lAzIdSBROq69ChChzJYVultYBFvd+/UFCxB2MEpAIokeLqzd5bfmLQceNYIBPe3pAxFmgKgX/ZtCAz08+zGZHN981n7E1ASJNYJaqVHd8iS5BMcxPdo495MH5ZHI41gBTDI1aM5pjvtAQ2T1lSsub2BQgZfM50vNBGPdnD3hYbWIx87ckVh1CCGQF0i5hgPHEv8wYokVJE5cWWLIkGyzkE4Y2Ojiz3BLWs7GcAG2QCqae1NG053EBAz6dpUtrxX8FnVFPGPhpT/RqUWGpZ6LSQTp8PwnReKZktveEJsSLLaWCbHTSDGY9vu+z7/ZOrafZF8M1oZOrlTSEfw4WOEqLWJ9nQhQtrL1mhSnjye0nmYc4oIlFtYt7VGYNngaqLdLgncWc4J3w0iE0Jjpjq1vPx2Q3kpl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3687.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(4143699003)(56012099006)(6133799003)(11063799006)(3023799007)(5023799004)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ATE/rHjUJTj5fKxH+oKzqeT0cPRjekxh1c3baSv8SEroqfgFcYE+4xRgq7?=
 =?iso-8859-1?Q?oU9ELpHQ3q4XfuD++fT+XgAmVjk9KVrCq1Zqm4QWRdmxXpUVOjLUvIlhCh?=
 =?iso-8859-1?Q?rervXwwS4zWO38CUbKWDBUPjUTDdIM6twWznNggsY6h/kx3Nt8OhpHWNK5?=
 =?iso-8859-1?Q?gyfE6F0t4Ea/t8ih3nf9ha/Ikn2eQBT64T2jJQGv+6Zt7zFyBOZJSJ7ZNQ?=
 =?iso-8859-1?Q?0ydLuzfKij7RaXZpDcye3LxAohK0pJtjDn1IiZc0GW7L82OkyQsduxE+/2?=
 =?iso-8859-1?Q?30pu0aEtuWbwj7rT7oFPKeE2W5Mw3IezD0SU7u+Ca3QoHvLXTqp856UjWK?=
 =?iso-8859-1?Q?cnxJRhOFLy3oH/tGHdQSXsmeX81VZHixWMdA/I9A7MQm2ye3xOx+Zlo+Sh?=
 =?iso-8859-1?Q?tCf8GMfOyz4G1j1/Ttxl5COwRIOanJK3o6o7tcZ1Fes7WN4pLM3VfY/Cms?=
 =?iso-8859-1?Q?gmu75x7TeQqDpX0X7bQ4ZZfLzTp/fz2FPJChEVbA6keCMFIZJyWPmr+X6t?=
 =?iso-8859-1?Q?Qzf347opK1CVkfjSFRD9nTpkImV94V97BzgCz7rGlcl8Xfgfp+uglrS1g0?=
 =?iso-8859-1?Q?lYY2GXBb7e09IbjELStMqbrQdKsFeUgRa3HZKlAceK5ZDDxwldgjAyMIW6?=
 =?iso-8859-1?Q?5YFeceaophUQU6w0fvXqRsqGiO7ZBfEzGKehMco8S/jthSwnMcrcVLtt+Z?=
 =?iso-8859-1?Q?nmscr3WcgZ4/fkMOKQtG05qyYMpuwJ578Gs0HVO8zyivsl8f+iY3akoqcJ?=
 =?iso-8859-1?Q?QxTMWI/n6O7REiZbwaDhQdTQ+Jk3OUNd2/l/JEineMpxuAjiHtXaSno+Qk?=
 =?iso-8859-1?Q?22NHWj7FeU6IaQAdTE/3v8F1TeTTDxRKDyXEMALJavJ4xCgHxfM1oxW/WT?=
 =?iso-8859-1?Q?Eviww8qfnEMGvUOewEgN/aG0VeYojK8KsVr+S5N8XfjsEmIM7c4XnIUdPv?=
 =?iso-8859-1?Q?a53MwqODuRGrhpE4bYtly2MBgTrTxd6OXzLb0FNjIYaboK2nTsTYkP9FHR?=
 =?iso-8859-1?Q?f8ML7xlwstn3/T4q+NtYoUTUHPROkr3Ezc9dzLzBbJV0geds4mKa+yR9op?=
 =?iso-8859-1?Q?QkgsBS9NPdukmlYZ2Fs8fR1bo524LrfmI08MhwXU40UWNcrrIL9z3HO6Gv?=
 =?iso-8859-1?Q?6fl/n9Oz9Soz139cf8adhL3q+/HazmdLLAtbz90vmHr9rInaAJ7Zszw3y8?=
 =?iso-8859-1?Q?/CuTkvX2SCCXzrWk7cdhtfnmwyl8f0fjDLkDa+v3kjIAkJlYrYKMIdltUV?=
 =?iso-8859-1?Q?rZsHQF+WJd4zfHf8YcVzsJDQoWL13YOaedZA1AlBx3eYQ/jKIHxsuGPAqO?=
 =?iso-8859-1?Q?xsJVPLJ6R+jBTBBo+QAcopUrXnEe57Y8wI7GhLDmWR+dHR9hd4ouy2k9EB?=
 =?iso-8859-1?Q?ibe6Zi2AFd4xBPq+E3GI35lAmCljvtP1BEYTK2kXc8rXtkvAPlxmIF8EG/?=
 =?iso-8859-1?Q?t/A8AVqtEs5g6mQO5GbIwx4/69psWNrl1mas6fDovH6nN7OvNZJ5V55OFL?=
 =?iso-8859-1?Q?WNGwI0wiYlg9WyNFhktV+FKLeUTqcTSiob3oShnzzJn99PwpFwXcS4wS1a?=
 =?iso-8859-1?Q?jelmysq7ShalYiM8R+gxzXO3hU3917gKCY6zLY/eE+oFrMiBIYWAFYAT1g?=
 =?iso-8859-1?Q?NaOoQsZ7YMOOpRYPFWvMV3XSOlH4lLTBaBcWvZ7eHS0NTgNlqe1DFEhg2o?=
 =?iso-8859-1?Q?lHsWDX5z6dUu7VRsOaRtc7dwjP06c1B+HpBS6lC6Yp/TI4KEQJnYHh4k/T?=
 =?iso-8859-1?Q?asWFC8Bo9t/FOke9/MU53ghkdc+ErDCvapn1oYlTg/EjSsr3y3CJsJx6LT?=
 =?iso-8859-1?Q?6S0mthGpmg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TWfeO+9Ba5LeIFKiz24ewfMOHZpj10i6sxQPfgHfYhJmjYBKIguf5oB9aEdK4t+DRARAjH4x9KL0RWLSNatttYBj24XtB0HCTwHuserqwhvwGob9LOL2KQjlMcAA3OCyxwRGrCaymh31rDVtelbfyDORSN6bm2mtom0gcReg+r3HAAzc3tlFWTLvwSDIo43366PqpEiZNusGcibheMSzsB+20wgZOZsGGGAwtbRVixl3bXnSgYHSqAqcvlT5fIXR6ySm+FteGV/5NrlbAaKgj1I6852+c97MlQ10Ce3quzXHQQx7pj89mKCVbwu/e4Mjdh09Out5sz1S2xpRBwd3wg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f221a3d0-f056-4f6f-6a97-08decc38e103
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 06:22:59.8485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MIkBp0BHC+zieSNpx1S0VJfTONQJR1JYh+Eb2RbElrt9Rm6JCKi5RL0h/6MnWOjc6CGPyWVFq9MW6gEobbGRhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5952
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65083-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:praan@google.com,m:matt@ozlabs.org,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[kevin.tian@intel.com,linux-media@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,BYAPR11MB3687.namprd11.prod.outlook.com:mid,intel.com:dkim,intel.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.tian@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3F62696D2D

> From: Pranjal Shrivastava <praan@google.com>
> Sent: Wednesday, June 17, 2026 2:52 AM
>=20
> On Tue, Jun 16, 2026 at 09:48:14AM +0000, Tian, Kevin wrote:
> > > From: Pranjal Shrivastava <praan@google.com>
> > > Sent: Saturday, June 13, 2026 3:39 AM
> > >
> > > On Wed, Jun 10, 2026 at 04:43:20PM +0100, Matt Evans wrote:
> > > > @@ -1264,7 +1265,7 @@ static int vfio_pci_ioctl_reset(struct
> > > vfio_pci_core_device *vdev,
> > > >  	if (!vdev->reset_works)
> > > >  		return -EINVAL;
> > > >
> > > > -	vfio_pci_zap_and_down_write_memory_lock(vdev);
> > > > +	down_write(&vdev->memory_lock);
> > > >
> > > >  	/*
> > > >  	 * This function can be invoked while the power state is non-D0. =
If
> > > > @@ -1277,10 +1278,11 @@ static int vfio_pci_ioctl_reset(struct
> > > vfio_pci_core_device *vdev,
> > > >  	 */
> > > >  	vfio_pci_set_power_state(vdev, PCI_D0);
> > > >
> > > > -	vfio_pci_dma_buf_move(vdev, true);
> > > > +	vfio_pci_zap_revoke_bars(vdev);
> > >
> > > I'm wondering if this change in behavior is correct?
> > > BEFORE this patch the sequence was:
> > >
> > > 1. zap vma mappings
> > > 2. Enter D0
> > >
> > > After this patch the sequence becomes
> > >
> > > 1. Take the lock
> > > 2. Enter D0
> > > 3. zap vma mappings
> > >
> > > My worry is if user-space accesses a BAR *during* the transition to D=
0,
> > > it could crash since the mappings still exist during the transition?
> >
> > not 'crash' as you also noted later with all Fs on read and dropped wri=
tes.
>=20
> Ack, "crash" is definitely a strong word, I just meant that the
> user-space program isn't expecting to see all Fs today. Since today any
> access during reset is faulted, however with this all apps may have to
> lookout for all Fs during a read. Could this change cause existing apps
> to crash?

I expect there will be certain handshake between the resetting process
and any subordinary processes using the exported dmabuf. The device
state right after a resetting is not functional. Presumably the resetting
process (as the userspace driver of the entire device) needs to re-initiali=
ze
the device into a state allowing dmabuf to work correctly again. This
window is much larger than above, within which I'm not sure what'd
be reasonable expectations from those apps.

> > >
> > > The old code is immune to it because it removed user-mappings first.
> > >
> > > Following the discussion from v1 regarding the ordering of
> > > vfio_pci_dma_buf_move() and the D0 transition.. while it makes sense =
to
> > > perform the DMABUF revocation/move after the hardware is in D0.. I'm
> not
> > > too confident about moving zap after D0 :/
> >
> > probably add a comment to remind that ordering requirement for dma
> >
>=20
> +1. That'd be helpful.
>=20
> > >
> > > I mean, sure, the user would just see all Fs on a read and writes wil=
l
> > > be dropped silently until we are in D0.. but the behaviour before thi=
s
> > > change was that the user access will fault and hang on the memory_loc=
k
> > > instead which ensures that the user observes a consistent dev state..
> > >
> >
> > I see this more consistent from another angle.
> >
> > Old code only removes/blocks cpu access but not for device. DMAs
> > are allowed to this device while it's transitioning between D0/D3.
> >
> > New code at least make this part consistent - both cpu/p2p are allowed
> > in the transition window.
> >
> > Ideally a sane userspace shouldn't rely on the content read back when
> > it has initiated a reset in parallel. So this behavior change sounds ok=
?
>=20
> I agree on the CPU / P2P consistency part. However, my concern is for a
> shared reset scenario where a reset triggered by one process (I guess it
> was vfio_assign_device_set?) can affect multiple devices in a dev_set
> that are owned by different, unrelated processes.
>=20
> In the old code, these peer processes are protected because their BAR
> mappings are zapped immediately. Their MMIO threads simply stall in
> a page fault until the reset is complete.
>=20
> I agree for a single-reset scenario, sane user-space should never access
> regions during a self-triggered reset.
>=20
> Am I missing something?
>=20

Given the resetting impact is intrusive, IMHO handshake/coordination
is also required between processes operating on devices in a same=20
dev_set otherwise peer processes will break quickly even with the
protection in the old code.

btw I don't remember all the detail but holds an impression there are
restrictions on the caller owning all devices in a dev_set or they all
belong to the same iommufd context...

