Return-Path: <linux-media+bounces-12728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48548900439
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 14:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDD5928CB74
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 12:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3443E1993AB;
	Fri,  7 Jun 2024 12:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCD3uuSd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9CC199253
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 12:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717764916; cv=fail; b=eNZT00TU8qYio1nydx9IecvoPj2KvSiIWMYx2th6PoG+M1TgudRpkmlBIxhMYbZeaA2zhBF5+y0NVtQ6Upd7NVrc2NuKtaBfUUkJs9kYRaJ/dS/0DPR2kzHhX97YDsG3QXSONAm4XkGG5u/mGSI8Rs1TcAPDc9Z8GbEiZZUZRgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717764916; c=relaxed/simple;
	bh=MnAHwlcX43mbwZU0eY5P+8HeCSBkkKvrmVTnLzDNjfw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GGLvYPoc/7jKgWov+w7MkaPtH9uymJo8vyRvJ23IdHQUjb/CZYL03lGjuFPzH+OIUCXHHuJTl+uN04mf99GA9YiLcLjMc0IqiReVRF2+/FaAkq61r/qRmjSdPoD98wpd/YfqpYALRcc0o6LzBlFJM/K+AozJN+aVtO4n/SQjS+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCD3uuSd; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717764915; x=1749300915;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MnAHwlcX43mbwZU0eY5P+8HeCSBkkKvrmVTnLzDNjfw=;
  b=GCD3uuSdZUTg2V5MTHklyxpMTyE476P2BEqv21M6SLMYGe+ApoB4ssPU
   7278rsu2GtqbvdCk1fj6VlF/4d/8I0jZphIWdMJx3/cTACFk9jCb2JdJX
   aTUimVEi5RdYUVUdB62ZreC0/X73XijbF1NDjqwNSp0yChcRBdoqkzpSP
   pBZPBgR/QxwVpzpTgrF3eBWa6ugQCB1Zz2FBIjF2oUc11VTBzFc14DSen
   WTHX0+DzoMoIm6OimWfI7Xx91CW+JIBJAUggRDLmWITGYYfWHKKHk6VHY
   I+gKJmQmfz+tLrGyqySzcbQqxpnLzFvE3GtL5lSWN+9U0fmmR7r2l3N0f
   A==;
X-CSE-ConnectionGUID: nF1lEYQ2RiGqVbSCetFzLw==
X-CSE-MsgGUID: UWHdwU+ASR+IR0Uk+5koDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14664883"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="14664883"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 05:55:14 -0700
X-CSE-ConnectionGUID: 3p0PSdawSY64hEWa2oMR2A==
X-CSE-MsgGUID: ueiO+VBQSNC+ujQki1zdLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="43244352"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jun 2024 05:55:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 05:55:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 05:55:14 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 05:55:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mm122Labc2vsB3H3Q0bBGFJtnpkbt+MJygFGOW/HoRiO9JNNn5QOcvr5DMt5QH/+zA//32HNMOi6O49eu9QeE8IWq9ENYRKWmjWTyU3OZEDGQYnjF0yeC4Rf5YQNv9NqEVvf5p/3qeQfxiwdoRbb8ckDqZaNKwmdP8rISBHuyjSaVXt4RyvCrmR6jHQ0BIo9m90RywE8XyBKE+BIVEnMBMmIlXhY6Ib1XGSr1t6B9f7ljXIujLQ0NpeUH/JjNJP1srReiVBUTzDBlXHFvUWFNR3fuf0b6lAdpQLLgIj6aPXdEoWVRsNV0zb1srs11c2OCGOfo2ocVrJxAdlJgoAfSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPpxNCv+/rBCHI40csvppaTOay65mfApKXLNhEmgZEg=;
 b=bTI6AkYcjP35To1JHJwdv2VWME4zAn902un+RY6PmGiIGh3FpqPlaLl95jzdW+J70vqqA7z8jsPGBRVZ5LDFBCj1ey8h3TLBxuRzduCggwu8AgRW6sTXk07G7fg4zeu+Q9IsKlcNNOB2w6iMfT9dJwnDljes1WfB7nFTy/DLVc0blOqlYLbcPB1Txp1Oz5lfNF7LPzjpPRbbKKOQ8Uy0BQKlozOkeJcacdPWgoSxWkDvrcHoNB95P/eURGIF3Nd5i/Fk1mfK7/8oYOjrhRL6ba10gTSFu7Ha4SLGj2MjVYuW+93y29nUkA0t1HyTZR44NyE4bxBFQALX3nNmPp/U2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7)
 by SA1PR11MB6968.namprd11.prod.outlook.com (2603:10b6:806:2be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Fri, 7 Jun
 2024 12:55:11 +0000
Received: from MW5PR11MB5787.namprd11.prod.outlook.com
 ([fe80::20f8:8626:d842:9ba3]) by MW5PR11MB5787.namprd11.prod.outlook.com
 ([fe80::20f8:8626:d842:9ba3%4]) with mapi id 15.20.7633.021; Fri, 7 Jun 2024
 12:55:10 +0000
From: "Wu, Wentong" <wentong.wu@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "Yao, Hao"
	<hao.yao@intel.com>, "Chen, Jason Z" <jason.z.chen@intel.com>
Subject: RE: [PATCH 1/3] media: ivsc: csi: don't count privacy on as error
Thread-Topic: [PATCH 1/3] media: ivsc: csi: don't count privacy on as error
Thread-Index: AQHatYzHBYkvacE27k+qrHLdvsBTxrG8Rh8AgAACfqA=
Date: Fri, 7 Jun 2024 12:55:10 +0000
Message-ID: <MW5PR11MB5787C7922167426D7980E2928DFB2@MW5PR11MB5787.namprd11.prod.outlook.com>
References: <20240603082614.1567712-1-wentong.wu@intel.com>
 <20240603082614.1567712-2-wentong.wu@intel.com>
 <ZmMA-G5Dr68AEwbx@kekkonen.localdomain>
In-Reply-To: <ZmMA-G5Dr68AEwbx@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR11MB5787:EE_|SA1PR11MB6968:EE_
x-ms-office365-filtering-correlation-id: 47b49078-0ce3-4842-0714-08dc86f110d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?Nw1HuQavi0c/+LEvGmKAn93iJEsj/P4cN2VeZ7J6esfkCV/IPEJOLKHAUHkX?=
 =?us-ascii?Q?PtIf2zUMlbq10mLUphf7yMZ2fbt1dUzXiyXIEcPBfgrtkNiDhYLXoqjGN52y?=
 =?us-ascii?Q?qrmXhqBaHCtc9ZSF66WR71B7ExwzfjHQCmQetNzoamDXQ+RGUh87F6710P8s?=
 =?us-ascii?Q?Gk5+/jeukYIzCVfY7d7VRz5DGjEio6rD45vProPr4wQ1RFBmRCEoGnLJynZx?=
 =?us-ascii?Q?l6ZUKs79k4eS/Z+1iicMFarxi3OFEu1Be/XleraUvDkp9dGnFYDQLEVkfJK+?=
 =?us-ascii?Q?RKysVnHlMDRkcplbJjCs/WkGF00oDLxJjx21Thcl2gUS3ovUAR1YOO/Y1wmx?=
 =?us-ascii?Q?WMpIVUcnSkqxx50pUoEYLFSMYDmnHOb/CWd55PR0BXSdlOe57/x/CliN5i9v?=
 =?us-ascii?Q?YeL6Gk1PZgj0pAnAjLVV7NXX71rgQvMDHZ9MpWFZoi5DChDITw/B301RClRB?=
 =?us-ascii?Q?OBqeqpvVyRAULUMGqRunKkx46oftwEIuhIcKTUn0uEJEqweLeffZ2B/f/4no?=
 =?us-ascii?Q?65TskuC1FWWCWG9nOC+o/KS1J9fNZSNjdZMZ5qMghapGJvDPVcICdWjX8LWy?=
 =?us-ascii?Q?45+ZAC6w4MG9aTS50kNpxXNiE7vuwabJAO6zxgGxfv3AQCk226UhZfhI1FRt?=
 =?us-ascii?Q?6X4Kdi0Hqqz02bmNfsJfNiccXFZnKu+csvaL+pz96OgjSFUaat3X/Oux3U9a?=
 =?us-ascii?Q?lMv3eZiz1X87MAkxURwJUVmBLp4rXZM4N80RYnS6VWg+hjIyTV5cw2r5SZrJ?=
 =?us-ascii?Q?a52DjQstplZBr8LBDPtBbGgT+xAu1KVf035qMpwW7Gr2igq0Idp6apMjFR2a?=
 =?us-ascii?Q?2ctGsuh0PXb9yF/uLaG9lLVvTzCIbEwya47QfOJWRc4ttv1RV5Xr+8UzungS?=
 =?us-ascii?Q?Ru6d6lmHjkT4YZwdsrDH35g6q0SGsBy3Up4Ygs2tYTTHUjgHkba/lh9venBC?=
 =?us-ascii?Q?Xh3z92YZEVhrJd4YX4XuZKxZdLDpWT3fxH3btO9F1cL7rBQ1EaDcC+tzW5HW?=
 =?us-ascii?Q?DBXcrL3wWKn3JGKbmLd4SbWMeZZs3pt1uEWJTKcy0PLjooJVuvTO/os6YAx3?=
 =?us-ascii?Q?kyEhgRmzF/mizTfujKPFinFvtqGmg+7Zv+oGV5gNl/vziYt+wBn1AEtb7w8j?=
 =?us-ascii?Q?OzqNo9VdoaoIRb/GnT0qauLUAmQomdhdAwoh+Evlh2OT2/OUdq5XcLyVHgwW?=
 =?us-ascii?Q?NPjmSf1m/pFavt5C4xnqh8rqvdQUr4a3qaMmKPBnq3885AvU46pdqtK7DGOR?=
 =?us-ascii?Q?VSyXb9/SZ78byrc5I/MUV2v7WPKjP1EdMXsIJlYa6PoAJ7f9BywPUWWsc8xS?=
 =?us-ascii?Q?O/nF5pGGGQhrjivVT2HIXokwxOIoMLZOv6UQ7vzfkjldwf+e50y47Y4FQP4A?=
 =?us-ascii?Q?2D+/iTc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JvyzhwWjW+VPuDJnxch2j+VDvMGNQ/aqPMxSuoROWbv2Xjr4QfiPyuGXksHU?=
 =?us-ascii?Q?Fh1Fl48l9mnUPnzsjxkHdBkstop+FXFA6g6a8u6IQlFfRa4GsSgwho29C2G5?=
 =?us-ascii?Q?0OdrdCarvBDFFksifofAO3koadQmCm2Y81cVVTGeM63iWYYmW6jjnR5kDOTH?=
 =?us-ascii?Q?nehAIE7XR3N7DG/w/2G+2Q7CNCHxI/0m7TLW8IoXlK/6AQOgpnPSWb9n7owj?=
 =?us-ascii?Q?+rQBNPtcY6YqyfYFCyYfKaQFHHs9I7IaaYl6Rm6W7dFcOD1bJRL7EYSt97Kb?=
 =?us-ascii?Q?LXSINw4k1SMuNHWP2DN4U8Oo+NVYoGv3OzCizveXaAUMqtkNebD2k4ckzRpA?=
 =?us-ascii?Q?4rxLRZexixVxwjfUhbklmlOdXmCgbguMzLH2lhTh4vBabssOJqIfGBvkJT9F?=
 =?us-ascii?Q?e8N76RyJvziuNdYsa1sgyAdnWRJVm6mxJBfJDIWBLdHN+E2sZJG/2O6qY+uc?=
 =?us-ascii?Q?dYEDHE7NxWVHVRpfyyxU9iuTD/dY7GjyXL2zdLJSHlcGb3LjIkqz9HMxckBC?=
 =?us-ascii?Q?X7ZlI/gLYbLp5kSfLwsJFUVthNviDqZ2cDy1xiq0os0cK5NBTYBfiRMZgbYm?=
 =?us-ascii?Q?c4iTfEu0yNitoLMAoPWeN/Ag0XVIdWVKweYvo1yoHb/fqNVOQqLGchlrSrKq?=
 =?us-ascii?Q?RNhXdB9SeYy1O7TYXSwLJYNSBWI6ijX3kYRLVFj7AztHHM28Fve4xGK53ndE?=
 =?us-ascii?Q?i/h7pMlB01Ng6WbbCTivo/x7LIWPU2bYX8sIQnr6Fsfg9KgF/GGq59aJ0DJy?=
 =?us-ascii?Q?64RVjWZy3SlG6fNCMFxTu8BNdLpA1/W/JEwCSVrf15e22P8yr8Qy5l9dRarr?=
 =?us-ascii?Q?NSZRYVhVmMskvt1a0oU7vuqh0bGnxZnTI9DGcgxDFEiWm+hWVRgVujAXlm4p?=
 =?us-ascii?Q?zOXax8HgExF3NPlbOTdEUyjhkUkjCuXzB8F4wArElBlQg9NY4Rfe/jciIS+M?=
 =?us-ascii?Q?4LD63w+QZBhWGX5t/x45gaa0nvyONQbdq2IvDPjWZaMXf77tWOtKppp7mvNi?=
 =?us-ascii?Q?7RlsJRsiKrBT5+IutcC7tuIwoFOT0wBhlUoRMMoQB9N3kRnvca8aKaZbXGU0?=
 =?us-ascii?Q?jIG704EZrANraLGtvAQ7L+6LMQEHIHaCar8XdFH1QaA21nKmrZkwzPR3xr9e?=
 =?us-ascii?Q?ovOJXE5yLvQ/w+Y4rQtDyzuov/h/2wnwQ0oKrVzcoRqg1rU9vH3kVJo7sGWe?=
 =?us-ascii?Q?p6EgtVqWHmQ4D50yywduvYsOSyV/ohzeuNPA+z+0waRNyxf8HNhIto+izYYD?=
 =?us-ascii?Q?AP0ET4oMYxEtJxDriHwKiDMenCpIBEpBaDKwpLq5ig+y5SHU4C4wGlU4oIsP?=
 =?us-ascii?Q?Fn/7p9W98wXdyF5LGLt9nFuXksTV9BceEilM+XdCShVY5A2puGAS5eVMWXyk?=
 =?us-ascii?Q?SadWOSP5hC19aB8BukHZg1NiGCdO3mCIax4cPgAebH3XjvWq5LFRNSCJbLOw?=
 =?us-ascii?Q?FG1wtHOT3OF4TfLdXulMDb/tuKMFzKr6dvkt+JpW0yvGGJE58lpRVp/0OB/B?=
 =?us-ascii?Q?FA75h1I8/3tS1HNbIZJeBWnMPnHZcbjM+37w+9apaP/ZoxYCgPuwCCQQeEMd?=
 =?us-ascii?Q?mfD5sZttOUvs34JnQY7JelpMPJAGKnU34iICV+LC?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b49078-0ce3-4842-0714-08dc86f110d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 12:55:10.7247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fFSlnJjslgLTm8u7vSXu05XVV4b4Uf8gS1Z06/SCVYm9Pn9tdwQJpHf8zbqLo90jdv5lffDszkgW8cdh6urBsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6968
X-OriginatorOrg: intel.com

> From: Sakari Ailus <sakari.ailus@linux.intel.com>
>=20
> Hi Wentong,
>=20
> On Mon, Jun 03, 2024 at 04:26:12PM +0800, Wentong Wu wrote:
> > Prior to the ongoing command privacy is on, it would return -1 to
> > indicate the current privacy status, and the ongoing command would be
> > well executed by firmware as well, so this is not error. This patch
> > changes its behavior to notify privacy on directly by V4L2 privacy
> > control instead of reporting error.
> >
> > Fixes: 29006e196a56 ("media: pci: intel: ivsc: Add CSI submodule")
> > Reported-by: Hao Yao <hao.yao@intel.com>
> > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > Tested-by: Jason Chen <jason.z.chen@intel.com>
> > ---
> >  drivers/media/pci/intel/ivsc/mei_csi.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c
> > b/drivers/media/pci/intel/ivsc/mei_csi.c
> > index 89b582a221ab..004ebab0b814 100644
> > --- a/drivers/media/pci/intel/ivsc/mei_csi.c
> > +++ b/drivers/media/pci/intel/ivsc/mei_csi.c
> > @@ -190,7 +190,11 @@ static int mei_csi_send(struct mei_csi *csi, u8
> > *buf, size_t len)
> >
> >  	/* command response status */
> >  	ret =3D csi->cmd_response.status;
> > -	if (ret) {
> > +	if (ret =3D=3D -1) {
> > +		/* notify privacy on instead of reporting error */
> > +		ret =3D 0;
> > +		v4l2_ctrl_s_ctrl(csi->privacy_ctrl, CSI_PRIVACY_ON);
>=20
> s/CSI_PRIVACY_ON/1/

Ack, thanks

BR,
Wentong
>=20
> > +	} else if (ret) {
> >  		ret =3D -EINVAL;
> >  		goto out;
> >  	}
>=20
> --
> Kind regards,
>=20
> Sakari Ailus

