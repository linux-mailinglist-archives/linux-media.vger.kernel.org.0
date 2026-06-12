Return-Path: <linux-media+bounces-64655-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7bd6JLHGK2o/EwQAu9opvQ
	(envelope-from <linux-media+bounces-64655-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 10:43:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 054FA677E43
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 10:43:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=EbMv1WnX;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64655-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64655-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F20A30D0F0F
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 08:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270413793B6;
	Fri, 12 Jun 2026 08:43:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B9A2E7F2C;
	Fri, 12 Jun 2026 08:43:13 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781253795; cv=fail; b=uKIZVLrOyEHKCczLugvjCTp2tWBAjAIutr8gtd30meBsKGyaf8GI2U69l9nlz/Ffc/V6OcbUIlMjrZpMXzh3BtWnArazDGhu42OYsYytsf9VewplPpS5R3pWLtBBjIE616J1n4qzBtfdJUIjWS/uemnRri2KuQAB6xgq2VEBQZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781253795; c=relaxed/simple;
	bh=/Toq0gUT2QVZW56ATqLevxEhxfMlHaQ7Uky8LTsouHE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C+vkdgO0MH0WjJZhy5XVFU0aB9H4mT7v9Imwra1LvQHfu2pA7R2tAU7f+RTbtvM+i+Bg7SUpfAg6rY/HZACVKsK0IzRIiMv/i5/3TVSPwonkg6VzN9sSWRXmj/OoNpsEJuBq+2kx88JGuItakb0m/i3rmoh8U6Qnv0ojdK9MhFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbMv1WnX; arc=fail smtp.client-ip=198.175.65.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781253794; x=1812789794;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/Toq0gUT2QVZW56ATqLevxEhxfMlHaQ7Uky8LTsouHE=;
  b=EbMv1WnXte+ib84FV9oYWSLqd6ZU5GK6hY0VlBz/NV01Ixvov/SN3wHK
   aUFsgEJZfDlgKX014MJ+drmh9943rJmRRjY/+MzyzMtfn+2GbLOvqPQEf
   6a3/A6O/qoIN7d20aJmTuq+rDuO/MJfkxnfj5SLw/psPfW5cP9nNrV4Fg
   +DLsU3TNgrqIxsjwl3ViRsPeTHbT5aMOcfJuIZMVLJ3W5WAMsz2W8fUYY
   2d0XV3mzl4L3aXhcmtWiRgld5hTbw9gb31XxWxCvkxgZ9NHExZa/ROU4W
   JYxDYP+/roybZ6w4FIVNndmxgrtu24qjdm8NjV+T+HqxaC8GYv8Be5TvN
   Q==;
X-CSE-ConnectionGUID: oC7MCAZ8TheDZSLPoP5MVA==
X-CSE-MsgGUID: HlItZbXcRVSXnXzQZKQRkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82144906"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82144906"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:43:13 -0700
X-CSE-ConnectionGUID: aFB4sHqKQAy+Sj6HCEGs7g==
X-CSE-MsgGUID: 9nIJivXjSRKpmBcc6theTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="250694635"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:43:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 01:43:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 01:43:12 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 01:43:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UtY4p7OeLawnNQZqGdqDB8McKLcjC3O6s4zZ7UmSAe/EL7ufYhfIhXZCB+zfWyPGEk8Lne73ZgL2dX0nrYTjuvda+JuD4/x3D1w4ZxNF1W61tJ1O4S0UnYyGxIFS2KcV4X4zjDYWFPR/PsuCEqNkFlw37Ye7c3698ro6xYZGoe5IhwL11R0A1v2pKggCavDBvYZwlWAH86jjq1KJlwoQyyRGbrRsQgHsLSgWp/YxR40bT1WNE1qQdTnnM1935389WZ/jIoV5mRKdlaCR4iHHzwRc8Jx+vSDeSGGZi0tsVOj5VzWBwtEze/i+IBsO0hfXN/xPe5qWAL5KMGSZhShOFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ljnr0/vsff4SPRAKutL8WSYiLx1lxq0XdsjeEqjT7SE=;
 b=sZ+37p/HgHJZHQ16bVaxXFS8WKnhyyFlyy/qNLTRbMBp848XKQwbzO4gggAtGLWiue7srTErvsoQf3CVWnr67BXPDdV7OT1VLDZWBJQUaSDnFoQ2V8ihWzNNzIxLMipFEArI1w/LWxfbVBplf3qz1aCltTWEdHWKUAMOZXzuqgU+KTL3zFqckChhazZJw9/lHYD/g3ZVoQY+36TYiXXakLfew6TRV3dfEHjuqgD8KQCLcwALcxC/pA7s2DjtPJf9yxde55pUiuxXpY5ECrP+vkSm4REBOBMTFVi6+xjBNVwuKAhDmxtHuUEPLalF5SrjM7dJrwPPL83XjHxbItSKbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3690.namprd11.prod.outlook.com (2603:10b6:5:13d::32)
 by BL1PR11MB5238.namprd11.prod.outlook.com (2603:10b6:208:313::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 08:43:09 +0000
Received: from DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b]) by DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 08:43:09 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Matt Evans <matt@ozlabs.org>, Alex Williamson <alex@shazbot.org>, "Leon
 Romanovsky" <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro
	<amastro@fb.com>, =?iso-8859-1?Q?Christian_K=F6nig?=
	<christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, "Logan
 Gunthorpe" <logang@deltatee.com>
CC: Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Sumit Semwal
	<sumit.semwal@linaro.org>, Ankit Agrawal <ankita@nvidia.com>, "Pranjal
 Shrivastava" <praan@google.com>, Alistair Popple <apopple@nvidia.com>,
	"Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>
Subject: RE: [PATCH v3 3/9] vfio/pci: Add a helper to create a DMABUF for a
 BAR-map VMA
Thread-Topic: [PATCH v3 3/9] vfio/pci: Add a helper to create a DMABUF for a
 BAR-map VMA
Thread-Index: AQHc+PATtuyK/NTU8km1pZyqZQ81w7Y6nO2Q
Date: Fri, 12 Jun 2026 08:43:08 +0000
Message-ID: <DM6PR11MB3690919D58694FB93503F9168C182@DM6PR11MB3690.namprd11.prod.outlook.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-4-matt@ozlabs.org>
In-Reply-To: <20260610154327.37758-4-matt@ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3690:EE_|BL1PR11MB5238:EE_
x-ms-office365-filtering-correlation-id: d6b8687b-49b3-452d-8e2d-08dec85ea133
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|38070700021|22082099003|18002099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: rVNG/i3KK17GSme0m8OmQ1bf0he3lUGACvyDxmk6BiMdKHY51IIwclx8CcoymGxE26nghwB2L9N1fifvFEt5Tzu+Eugg6AtdzU7rARDh78UyrOv3ZgSsoEwqxzAx6vdt187brXNZAJjVVyOD0myv8wHQVS0D3v8lDOZrbLpjIhTjbJRXmmiOmZVedxAnNc1IasbhwHfFtB6qa4yO+RnF1Mqpw11GLzb7fCu9z75giDWKD9+twHHp3Y27lUPEGHNuW7pWXirV8K/8id3sLqJXpdOQEtCn5aldeUfK/QZQr83n+cGQnjZK1LLUraWXaeMzmLk1WunK7WWgy3BgXmY+2oMdDj8z1FfbB9feJdMrV3c/yqbBdL0yLxvDaz7j+UjkNqm7tjP0hxWoqDhZYVmRQYVZ908QlaclyNuRyx7+4O1YF6EVjDpx7u638Plm3HLnhf+wbOUJOOL6ZMUUvF538CB9aNrrxH5SL5AWn5r0hKvkf6M0WptI/vFJuF0A3VLs7uf6lxRNdzubxyPL7TtFjRzca94fXFwdMJUr9L0gNTwNjNj3M1kUKUQZuUttoioxF1EAPtY6f7PjvFhbiBp6CzQY86KFREQpoj1jVZ3sHq1UbBnEHEyB6oHI7SDujjMQJteOIhGuqVz6Qs/U4ZavQE0yVTlMDlnYZk7N3s66c1VcqY82oTKpJF5rC6cb+QQY8Nf896NZEXj9/cUZZ2e/OqE4zHMxWkOutWpV0hMF4vzsd/viqw+rbHTSeaPLygyT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3690.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(38070700021)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PLu4y0QEZYt6op3UuSPQdbuLUWTykngwzQ5oA9JFYwK2otDXquSESSvCMK?=
 =?iso-8859-1?Q?i9tDNFIT+q+9w59Emj3KOlu8KuTdLhZYiqajPdK633OdM4Hi2mlauIftZc?=
 =?iso-8859-1?Q?tgYvBQOJvYP9wJxbo03aB+pV1N1BoMsb7q1IWSiadSQJ59hek0UAi3TAlr?=
 =?iso-8859-1?Q?7zwwxyzdXwsb81PQxJVYdk10Dygj8p15C2l240t5d7lg0UhxmELXtWYYv3?=
 =?iso-8859-1?Q?gOJfBsAo0av7RsxqoU0HJk6QmYIZbf7riqeV8FIEBCfrx8H7qjLf3ovDxp?=
 =?iso-8859-1?Q?xPHnEvhbQXee/ADw2GFnA5tVbAg3zuJrsWiJsbCW9LsOV0u92M8l2FKmlN?=
 =?iso-8859-1?Q?4sjhGkKJqTyKO9ldWTpub5lP9cUfLOSLobIpOcDdjZiO2dXihEOJ0FcR/n?=
 =?iso-8859-1?Q?UDRwtee+lGrx8S8eKt1OWl2ZIvtEtLzWGmrJMu71OueUmZoxb6Cr3XHblp?=
 =?iso-8859-1?Q?Mwi7O/sckP1yPaW2b7E890S60RQCRdxj1gjB1DueQqcFdec6m7GIJGePbn?=
 =?iso-8859-1?Q?zPZBKy5WTe43GSMtyaQQfNxiTpejv2aFcZOmRpqU2h9lOBhttuThXJomHQ?=
 =?iso-8859-1?Q?ZgJaxnrLI1vXWUQyVqLIbpfOPymHez4pEWOVGnwgIaePmbLCnPKMXE/lAL?=
 =?iso-8859-1?Q?Z5tqmFM2mKiWJS8mhl0PAKCT8Dqddkjj5ai5lQHGSYHpxWWSUudUD5d/uU?=
 =?iso-8859-1?Q?zsEwG934DnFe7cBrNxwNGSX5ew1at7Q0bbB3mIU/zahdeYsyFpI1yBJ7Wa?=
 =?iso-8859-1?Q?k0lKYQcN1zNxptQK9cidQx+U+qP9xGI0EVJX+Mfz+ppTgadWAaX1KzAllE?=
 =?iso-8859-1?Q?AHbhNhNEiQyuGrc/CiGvUJtDC8RzsytfnKhqbnxWIjTboeJxzl9bcw61nq?=
 =?iso-8859-1?Q?/xj5AATqtTe/xVQvxa5XGes3Bbf6lXHXBfnBwN0pMmxFphPJt7HWhGrX9O?=
 =?iso-8859-1?Q?Vk1a6NWaP8HsgMOVKR73/yr+USAl9ouJDO82r6dr0Yzf7hPgASk0Rpc/Wu?=
 =?iso-8859-1?Q?tSquYMqQ4fC/TObUWDVi4QQyDxBGQA50yBr4kcsrMxKtPUHaLdoud/JYJy?=
 =?iso-8859-1?Q?tFr9dg0hzsYrEgspLR0I9cHnfop2P00xKIQFIsgiXXtuzX/5LXG0Idm9BB?=
 =?iso-8859-1?Q?l800rPwZc7rIRjWWGW3nsJrQdmRGw9wZYMcTT7FDWG47LloLNTo/MlFOnD?=
 =?iso-8859-1?Q?foj69F0KhYZVFJA7wA0wYEqge8wFXYXDagQSuFsP1kiuyTsDBvErEJ9C2s?=
 =?iso-8859-1?Q?EKPdB6w3EqtuZ/nvVBlQgspzEwQX+7zul2tRzJcqc/h49Er5+VXj8G6/Fh?=
 =?iso-8859-1?Q?rnaaT2R67FDwfV7kAaba3Ax1kQwZC6xJGF4DVILSGOsmeSKFG/sbS5uDNP?=
 =?iso-8859-1?Q?Cnb49JPbGwvTapbtMKgTGhdibVpmeL8BwxpMtRKGkSBlkLY12zDHt+zatP?=
 =?iso-8859-1?Q?SIJSma6xzrFp0F+5tWn37dvKVz2ed+m9XiDtyudwp8v5Gjmcj4V3WXZ/r4?=
 =?iso-8859-1?Q?YHMG+NL6VsAq5Jms2GYn4AQKl2Fb3f5jNuQKeOqfBD6gXtWO5CXIqRPTpt?=
 =?iso-8859-1?Q?7VcnAxmhXqDYY9zer3Q28SYMgG/bCx5qtVNW1clbeLaSuaPalIVEsqcQaT?=
 =?iso-8859-1?Q?eAZMB/oTg9jhb+QmmVq2RneLqo8Cf/QygDMTBEizCl8ik78vaH1TvT1ylB?=
 =?iso-8859-1?Q?MGmItcwx0AMPtOIPRXTF3IACUHnxekW2ByXzUhwinJoLSjsl+4+teddOX4?=
 =?iso-8859-1?Q?n15WuNLRW9PWplh5+JTi7adUhmyiKhg9tnaAIJhZImyPmW?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WPLtRdavpMBWIxA5v4mZLnfnc9ZBJnpx+GBNZCgLawNBeKeyEw+bdb7iioWlUanVrK91L1WYwccRmsUyntfkGMH17TtKRxVkO6U6k6w+/SUQ4ufvd3K90OqpMTaCYgW6iHYiUP4F1a2sCFj3i3ikVpX5nHzLs+8QTsE7kyDMEGQk54QEV2D0thoQ43Ud6XskSK36G7b0bHsCmpYQb3U4yxGY6b465v9/yaH9QId5YQKHOw0bHs22waguGBQeiWgYgWRHYcbjffxupbvNRBYyqOmax0xlOWDIrBRFzw/FXGtubDyo4Oyw28iV5uDSv6E6cWg3eC3ygy7iACw5f7CTiQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b8687b-49b3-452d-8e2d-08dec85ea133
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 08:43:08.9804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: txrbmPqtiooTHLlN7XqMx6p3EkDxytxFkvaFDxj4hFKqXcK1c9Ki571sW6msRxzazIDymMODLBEi827oPvmiqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5238
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-64655-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:matt@ozlabs.org,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kevin.tian@intel.com,linux-media@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.tian@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 054FA677E43

> From: Matt Evans <matt@ozlabs.org>
> Sent: Wednesday, June 10, 2026 11:43 PM
>=20
> This helper, vfio_pci_core_mmap_prep_dmabuf(), creates a single-range
> DMABUF for the purpose of mapping a PCI BAR.  This is used in a future
> commit by VFIO's ordinary mmap() path.
>=20
> This function transfers ownership of the VFIO device fd to the
> DMABUF, which fput()s when it's released.
>=20
> Refactor the existing vfio_pci_core_feature_dma_buf() to split out
> export code common to the two paths, VFIO_DEVICE_FEATURE_DMA_BUF
> and
> this new VFIO_BAR mmap().
>=20
> Signed-off-by: Matt Evans <matt@ozlabs.org>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

