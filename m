Return-Path: <linux-media+bounces-12727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A02900423
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 14:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03D721C23C57
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 12:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A76194A6A;
	Fri,  7 Jun 2024 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QO7eN/Y4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66561922F9
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 12:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717764897; cv=fail; b=nSGhl4B6xD/e18vKb2EKAQ5C2CAl2WG1BP8+GVy4PuA6igj5cHsA4yo/+lvBJ3uBZmEWd0vt+5NEnZ1P0pO5rHuO0Nqh809xKznygDdtiJ88AxivG0msxy9U9410ge3I6yC3tNoEo5Vb3V8LvBo1U5umXqvb3o979gm7my0FAKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717764897; c=relaxed/simple;
	bh=KPm+ARmKDYbPHNiNs/6kRFs8trtWYhRrsSGqMYmUiqk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jehPmXNc34KA07zBi30PCuQzDTYL92CkPAhIatoBuDl6n8bRHGFfrEqjghixhjukkonUm1t3cKzf6e4npWM4vd1+RSrIDaR31EX5XUXFeHQvpaWvMSX60g6BHUV/zCdkEb1foCbOZeNGRs5Vjzesx8w1sgyAeKT4M1ioFJE10NY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QO7eN/Y4; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717764896; x=1749300896;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KPm+ARmKDYbPHNiNs/6kRFs8trtWYhRrsSGqMYmUiqk=;
  b=QO7eN/Y4cpu5z3s7j6CKkOUzXEM34IDSl3kQetnFPpRBBPZFOxe+lD7Q
   yhqJD2nqXOLy55YLfG7iYUifXg6Ubd0ONZyoXrVqaTL04vxSGIkZCJOZf
   H44tvUudfy/tfgsm5zWedy3jNCKS0diA4BK5kJ94Qe49tZhb/1pWkjLr7
   fgzTo/yGKGjrrvdp9EwSokzPOjZxVmcJUReGApi8dqNEtz1JNEl6+2+he
   NYq3P+ebhE1cGRAW/zojJ7f+n/ahePWhXIjO8u5S9A+1wc3gKUvSDvqfN
   llQYE4JzCbUmEyQDRGG9lsOQzUU52qI9pfX6Bxn99I5qSxhc5lqR+TtKM
   g==;
X-CSE-ConnectionGUID: HIyX/KfXT8im9E0/rS3CLA==
X-CSE-MsgGUID: 7T1+vOQmQXC+dEhpI1Gkrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14366427"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="14366427"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 05:54:32 -0700
X-CSE-ConnectionGUID: y/CIl3OTSLCpP0Nu3ir0BQ==
X-CSE-MsgGUID: ul9kkTYYSneQK04DYZC7Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="38392753"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jun 2024 05:54:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 05:54:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 05:54:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 05:54:31 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 05:54:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgB+7tkdrhaosh+/dB/ihddNfaRAD74Hxx2CPQcdcjxP6HiAsK7NIg0Wzhe14r9shagftCFY20xdmsn6Uy/i3ZPdpRUner/Yo5lznf0ahRVEwNpCc/pjg5Ac529VbJQaJbI0PpqmEctW0wAzmPW1zTr8XJc6ZgoPfkw0YtL9WbLH0gs1KRup0f5oH67jQaLo8u3cBpu5BST6o0i+TH+VWC7mQwjF6QcDcDTThw0K174B7tqbhzWmx5VtnjT6e2K7bUEm6x/iEcTnBAJ1dNZw9UcGrgxPgGAO7PUeXLP3oYZzM70KYzXik1McS3k9lu6P/LpNRRTbAbfCDFG8o7E0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4CuJRSXtsVMNEYo6rPjX11o7RrwPHeSw9w6GnXC04A=;
 b=jxO4UNc6FKUIeSdGo8XHzD1s/uLn0k7T60/L8Ac8Uf/wKwo8+oqnEaSpeqpHqYQKJYHlzhw1rrVqGGH3Cmfbmz3ZYjWeYdGy2XcX7rEBERsBdscuhr3dCchsdozUdxoYLRczJ5osFIkhdqel7Lyr2Z723eHp6yX23Kd0fQIE6yHSkmFCigfDwNPpEry1ksQaCcVaYa9w1kmkR5RAT8F2FmLj+p00cjZOP7tjGybDE+QZ0ZzbJuQCaM/PPtzYy70Akj2e+m91c6GtjtrRThMq+3Bb3djZT7kayVVHB/SC3Kv7ePR1YxhdS7gkMzUE2O8KnwmyHlYc0wEJ6Ry2JGurvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7)
 by SA1PR11MB6968.namprd11.prod.outlook.com (2603:10b6:806:2be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Fri, 7 Jun
 2024 12:54:29 +0000
Received: from MW5PR11MB5787.namprd11.prod.outlook.com
 ([fe80::20f8:8626:d842:9ba3]) by MW5PR11MB5787.namprd11.prod.outlook.com
 ([fe80::20f8:8626:d842:9ba3%4]) with mapi id 15.20.7633.021; Fri, 7 Jun 2024
 12:54:29 +0000
From: "Wu, Wentong" <wentong.wu@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "Yao, Hao"
	<hao.yao@intel.com>, "Chen, Jason Z" <jason.z.chen@intel.com>
Subject: RE: [PATCH 3/3] media: ivsc: csi: remove privacy status in struct
 mei_csi
Thread-Topic: [PATCH 3/3] media: ivsc: csi: remove privacy status in struct
 mei_csi
Thread-Index: AQHatYzNDFrlQzaFGkqYRPisx7GTyrG8RfIAgAACXUA=
Date: Fri, 7 Jun 2024 12:54:28 +0000
Message-ID: <MW5PR11MB5787DA0946AD9C7A569D7A5F8DFB2@MW5PR11MB5787.namprd11.prod.outlook.com>
References: <20240603082614.1567712-1-wentong.wu@intel.com>
 <20240603082614.1567712-4-wentong.wu@intel.com>
 <ZmMA0pahCizgRdE2@kekkonen.localdomain>
In-Reply-To: <ZmMA0pahCizgRdE2@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR11MB5787:EE_|SA1PR11MB6968:EE_
x-ms-office365-filtering-correlation-id: a7b76ad8-5243-47fc-efb0-08dc86f0f7f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?yGoA6wS2O5BTHEKv9fj+F9jKExM8wWjnRG4RpBw4Z0bT1+lsZqHn1fikU/kD?=
 =?us-ascii?Q?qvbgm7l/THHmuJ1Ziskv0qRCvO+JW34AaO3PSrF2vkDBguhzL2VUEdDLu0eM?=
 =?us-ascii?Q?GEoQVfCu0JZGw918KzVEPmBj/+5Ndbg3v8gyF9AHjc5Ywl2LN0TxkzwS8P76?=
 =?us-ascii?Q?xy/6+QhqLqUBfp3LZ1VW/TzY7C+TuH9yhPgst3uzr/H7DUkyq+pByAT9wmql?=
 =?us-ascii?Q?G13vY2Dv7sNmF6h8wbQavTYOEbL3aKF7OxZiFkcjB8bzlWOFrAR1SU0hzG2z?=
 =?us-ascii?Q?UNWQs4rmQigitnSiCN/EhTc54WfqxHr2sorBYfno1yflCjv1oweblrJ+zm+X?=
 =?us-ascii?Q?LhFuT4zisZJBFqpSiRdmFFjXsMie1xMX04yJWrQN8bQGX1cltCo91yW6YcNB?=
 =?us-ascii?Q?ABafJbXGLCosxqYOeeX1BfbtO/ZnSWUDQzhFgJtBoVmX+MQvMcErx3kDrPOO?=
 =?us-ascii?Q?h3oLvmY20dyR2nAzJK40vYBtM7ashEpCktXH1Evo5uyZp+Dlzd1KP3twItnb?=
 =?us-ascii?Q?dOjkw3hEfxY43qXvmJG7rtz5Ckj56Cxtc03yOhgT3sIKp/yaAtTX1GzHBuQF?=
 =?us-ascii?Q?+4ob0WUolII61PV5ns9lEUd228x208IA3ymWW8AXs6lj8j8CeN4PcywTvxs6?=
 =?us-ascii?Q?Pgpw9gAvPw834oknsTU5OitMWW7wNZW9eIPXW9E2f8aQ7caNsR0oQqe7eLyh?=
 =?us-ascii?Q?2rhkvNskiI0dNn3agNZRpvgY3SM0QIT72YHmSTNZo0O3ItpazP1Dq8K8qtWm?=
 =?us-ascii?Q?C2rbo9gCP587F89Ilf7sfzhaAbJTgZonQX7522Jf4qQ3Jfc1VvzQB88xK2xZ?=
 =?us-ascii?Q?I4Pr5WdVuoqqj0vRQOvx/UghndaaWgXNRXaHYnhNVLSA1lH52Z7SGTlgNvmR?=
 =?us-ascii?Q?0sv7xBwR/oGbczjg6q+3qb6h9lFJqzjydHWm5qYZrnPAiTur7+bPexwb3bWn?=
 =?us-ascii?Q?KrfHCzp1Ct+c+iSOJ4CAuqe1luK95ENJqmVmDI6aBJpKf69E/DpgT+6jCaa5?=
 =?us-ascii?Q?d5eeWQaVblrFyDMVrHnntsgVoQuoF3z6NpZcY72om06Atg009wqVTN0gf1EK?=
 =?us-ascii?Q?8mkcaEIq8y5dIwCjNh/KHkNdtzghV6uQ3J9DGDSyt23c+FCNZ+QsO4h7Sf4P?=
 =?us-ascii?Q?4MSUtRM9+sz+/O4rJV9QFKsAifyruFe+0Dd8G4D+fh7qmd73Y0eWuhlu0DzT?=
 =?us-ascii?Q?m8FGhQQQmIyjnsWAcKI/PoUmTyngJb2Qw1cX40k0Dab8Vgg+6AT7zgVfDhA2?=
 =?us-ascii?Q?tWPZyopTtNTAGUTx87DZHZDQzjxFTAEhdm9xeIHe7IQbePfeWmJvQvmX1g70?=
 =?us-ascii?Q?0cDpNSwJn7r9Vfff+76ByHB1BpY9urQmbymKT+lh1VFWdrjf06yuLm57Zxh9?=
 =?us-ascii?Q?0eZDqRQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5787.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7eGR5sElqTuKQsiq4zNurGZaMAvJnbhQ4VnqO1BiNk6/ic9/pjmKFhy91h1F?=
 =?us-ascii?Q?4DOQ+D2q9ALbRQ9f0VkqCsmexika1qztBdT54Qiqo5lE1SJ/Iy9wSUEVBKh4?=
 =?us-ascii?Q?RrUdCYdvuHY0Oe1i+OY8QKfqUCiHee4rYh2BCFW1QGL5sFYBLA6VPjTDjM45?=
 =?us-ascii?Q?QhqJNXVaMGoQwxX8GPfj+XK6hIxql9WPbyw1nNXPxctg466CLGSMTy02tz+d?=
 =?us-ascii?Q?H0YixvwYYSMXo4np/sjpK9yfTEdzSTUg8SCZQBRcNj6d/3N2726V5wUJ53oM?=
 =?us-ascii?Q?CKxyHuQim6UO7zXkuFMiJpa3JoC5nEUynFP7qzA72tLVn6bQHBObWvKA1JDL?=
 =?us-ascii?Q?SviXnva0gZdSVBrqWSkx7LsTWr6P1qI1gV3U5lfrvlrJMKOFKjcP69kIiGVu?=
 =?us-ascii?Q?Q5u+FYhh116avENepcjQH9YJJVEjpr5PxYrUnK9mR9YypaZBtQ4mjC7XLF06?=
 =?us-ascii?Q?1VnedOF3Kirxh58RBarmxId5qD8rvuzftC/33rSZaPgVjmbvSPb/c4icIhUj?=
 =?us-ascii?Q?nbTCnwiQxrvpmObd5HXIadPKg8ih3P+svCCOF9LNx+rAG36L8qFqzskP8Ohg?=
 =?us-ascii?Q?on2Y/SRn2YZQBNhaGdEa48gq0wQBFuUQylAYiMUaiyFxdbZc9X3HGbohf/Ud?=
 =?us-ascii?Q?HREq9nelWuAtUOH1jDAZp92zt9SXYAGcdZTUXdfUsHIN36Y7c2dVd293/qJA?=
 =?us-ascii?Q?g9vYRiV8bePvygGWazvJWEg4YDKAXoCJxNqvZ6QyXdmJNvTG+/2pFzdq7y2e?=
 =?us-ascii?Q?WOd0MTk1EaqBGrUHk1Akw/Wcgoihv9jYQapysqL8f7MHjhlrfolqRtOvaC3S?=
 =?us-ascii?Q?Ddel6mcpWXmt92WhUx1x3d8wWOBA5R60jMC+17lCf1VwhdjGFBH9MCWXIv7k?=
 =?us-ascii?Q?nEY2aXtjYISRmLOtDaqqke8eFFULpW46JLtbI4TLwv8u+YbLyAi6gwIYCtUW?=
 =?us-ascii?Q?jAnGnNKnYBz6nOqxhfhyN8dz2H0mRzh5bDHM5aNjEjuMWLaXDbLKGdiq1bzr?=
 =?us-ascii?Q?DHdQ4FC0U7p0UdUw3ELYRYUTurbqI9dhlU6y9JtyUpNIrUfom9VqgGY6U93c?=
 =?us-ascii?Q?yZ/+oGjFO33KP/b6iV0rzJq2AIbjvfN6QAiag9HI3h+Jo0AfzMhI0WnCwrKe?=
 =?us-ascii?Q?yNp8ik31MOmXobBC8fsnbPReYYzOxyb1R7YJ9M0TMa08saEXRDK58rXlka6G?=
 =?us-ascii?Q?WcS92m7k0N4EfhHl2GIknDn5n4sIZcyA3FbaLXql6EVZ6mJHl1bQqNKxaczm?=
 =?us-ascii?Q?WE33hta8sFwY2VXHFltAaUdxbbLCAVRPlOG2BbS+W4xtlIRCJFAVOtQuE2oA?=
 =?us-ascii?Q?Y4tdPdOKl/KuFJpTy2aQwphqZ7KsZrBzjmisDmrtsuM1HnvjDQDyV3A47zfQ?=
 =?us-ascii?Q?Y37hlQahfDSpCJhq7xpxtUuQ4p3LeBDj2vZQxj0oLmz4HMlJlwbuF7ug/va9?=
 =?us-ascii?Q?ch5f+uNvu5WDPQLJbzKtqUHErkT25oxNElFkYM7eSHkbcX9lIcGEoWACIMuu?=
 =?us-ascii?Q?X/0CiVKhtXIRKnHBHiB+YLtYVhUMIhMgKysgvosvWdS/aWg6arzj4flZsDcP?=
 =?us-ascii?Q?4sMHGvndZv+5kxcC87HqS2UC1h9ZmsPKfNZomfHD?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b76ad8-5243-47fc-efb0-08dc86f0f7f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 12:54:28.9435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dykdpg//SCCeGauASaxAnXRvyLvvDQPh52T7tIuJKsXnH+uV1nurM+EdH/JkSx0KZmXMBONPRZXgXtS0Jbfa2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6968
X-OriginatorOrg: intel.com

> From: Sakari Ailus <sakari.ailus@linux.intel.com>
>=20
> Hi Wentong,
>=20
> Thanks for the patch.
>=20
> On Mon, Jun 03, 2024 at 04:26:14PM +0800, Wentong Wu wrote:
> > The privacy status is maintained by privacy_ctrl, on which all of the
> > privacy status changes will go through, so there is no point in
> > maintaining one more element any more.
> >
> > Reported-by: Hao Yao <hao.yao@intel.com>
> > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > Tested-by: Jason Chen <jason.z.chen@intel.com>
> > ---
> >  drivers/media/pci/intel/ivsc/mei_csi.c | 9 ++-------
> >  1 file changed, 2 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c
> > b/drivers/media/pci/intel/ivsc/mei_csi.c
> > index d6ba0d9efca1..1d1b9181a50a 100644
> > --- a/drivers/media/pci/intel/ivsc/mei_csi.c
> > +++ b/drivers/media/pci/intel/ivsc/mei_csi.c
> > @@ -138,9 +138,6 @@ struct mei_csi {
> >  	u32 nr_of_lanes;
> >  	/* frequency of the CSI-2 link */
> >  	u64 link_freq;
> > -
> > -	/* privacy status */
> > -	enum ivsc_privacy_status status;
> >  };
> >
> >  static const struct v4l2_mbus_framefmt mei_csi_format_mbus_default =3D
> > { @@ -271,10 +268,8 @@ static void mei_csi_rx(struct mei_cl_device
> > *cldev)
> >
> >  	switch (notif.cmd_id) {
> >  	case CSI_PRIVACY_NOTIF:
> > -		if (notif.cont.cont < CSI_PRIVACY_MAX) {
> > -			csi->status =3D notif.cont.cont;
> > -			v4l2_ctrl_s_ctrl(csi->privacy_ctrl, csi->status);
> > -		}
> > +		if (notif.cont.cont < CSI_PRIVACY_MAX)
> > +			v4l2_ctrl_s_ctrl(csi->privacy_ctrl, notif.cont.cont);
>=20
> notif.cont.cont represents is MEI's idea of the privacy state which just
> happens to be aligned with V4L2's.
>=20
> While this issue is not related to this patch, it'd be nice to use e.g.
>=20
> 			v4l2_ctrl_s_ctrl(csi->privacy_ctrl,
> 					 notif.cont.cont =3D=3D CSI_PRIVACY_ON);
>=20

Agree, thanks

> So could you add one more patch to the set for v2?

Sure, thanks

BR,
Wentong
>=20
> >  		break;
> >  	case CSI_SET_OWNER:
> >  	case CSI_SET_CONF:
>=20
> --
> Kind regards,
>=20
> Sakari Ailus

