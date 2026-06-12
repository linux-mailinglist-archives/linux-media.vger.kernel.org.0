Return-Path: <linux-media+bounces-64651-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9KjtKkjDK2prEgQAu9opvQ
	(envelope-from <linux-media+bounces-64651-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 10:28:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCA0677D3D
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 10:28:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=a4zBHTrj;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64651-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64651-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D4CC3163550
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 08:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408AC380FE2;
	Fri, 12 Jun 2026 08:27:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125811F5842;
	Fri, 12 Jun 2026 08:27:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781252857; cv=fail; b=YLWUhl2vfbO/8pIAVOEwV/qRQtHiAenk90bO9qrGQ+KOCaPlRx6WsE0iAaBMKEnA81DEmQOV/HRBRxvR7nyU3CDYFfbVmd0fdE7Sz7AU0gwpc6vXZ6uNAttrnQQfddiA3YrrUrNWNZV2mWXF8HneuFKalw854/dgWZJ17+CHFh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781252857; c=relaxed/simple;
	bh=Scb76004SgJJMbwX89xSDCDis8uU4cknL3wBhWI/W5M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AZCOd+7Q5fTqhMwipJUSrQDHlwE9BuunpRTl2rSQs9nHEiT6q7I8G3AhjcKWMmpDyR9MY2Rt3JiFjNSOfzOMTancPOUL7x17eiqxWDKUxJgpMxRtPmbv09w4M6Qw311be/cTCDuzSwAH+9F+Pah3sUCyrHkTrfMmaVPwCo/ZYC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4zBHTrj; arc=fail smtp.client-ip=198.175.65.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781252856; x=1812788856;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Scb76004SgJJMbwX89xSDCDis8uU4cknL3wBhWI/W5M=;
  b=a4zBHTrj7dqln/vG5jNDlJI7/4M1sB+67tRjdrG2vZHHqzFqcTRBVdXg
   fwAJICl3+gOz/9IwkXC9xdm8EK+uXpDxfSs3JZroogYLKkrqIuYVHTC8r
   bPgW+5CqfqhxYSyOyE7vFvKpXHcdPBgxPTYFei1AbtDTeylWH6TkB4g7u
   97xa8Z1Ng5haoYAnTpxLxcNrWodxCO/eCpEfXudwPN0AR+0MKlwJPLKoX
   t13rqBRvfkRZk1MdXdgmhLSWznvobLBPmXLdiXUumowSCEle2mMKsCgt1
   oSFr9rzj0+E9RRERJsokJOelG6eHQt2I2MP/+Tb78fgyYzErShrBuusrC
   g==;
X-CSE-ConnectionGUID: kANEMQJESN2hfHFQtE1D8A==
X-CSE-MsgGUID: qGTtoe8bRHijnI2PAKdtmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82143459"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82143459"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:27:35 -0700
X-CSE-ConnectionGUID: TSnLhAI1SyO6OqZPOxuRbA==
X-CSE-MsgGUID: 1zCa3usYQGOYnPHyz7iWJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="250692369"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:27:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 01:27:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 01:27:34 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 01:27:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PR5EwXp6DFixvyeSBAJFx413fLSvORFsU6VsGj35gy80P7UZwEG+qSnkj0UdWsr77WXrAutW6AV63HKLLDEYc22ez5oN5uNdYMlwEIlHEap/FycvTtzhdjzE808BRmtskT/KEUQTP8oip2U+oInNStuFstEEJSgIK1zVt0HomCJsScA2xoQuKXCFrKNOX/UI7zOtyGuLGf5tBOYwHiAuv4Lc+eyhuZHdn3HSQDhitU3ZJMSl1RITUzS7TGw6GrjX5uvNnlSjXXWdCx+hgWMBXnxK7M4c9UT9Zlj0nDXP0kPk9k1XeEo8e1MxkUHXeoCvBvKlVSWgtLAwOeoF8L+A4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ko0CuUljGWKcTaBRoa59PGwmcyv/SvANLh+u6jPTiKw=;
 b=hsDdzNWuowsFbdd0DEUzePWkCGhjIQcGma/9f55nEsu/fJUdDS397/9x12NrKsbXP399r1dykT8meua2LcnEq6CZDk8E90+3wmlJ2ShVh84LSVkNb/gxR99eBzH6GSKLbd0u4EqC+ui8iVSBxMa8dH1erpeRfL8LeROmcw2TKPcRU26RBevGWP+e5CnUlcuEy/t8ePmtYa6JUvnBonbiNCqA3B9Wpgo+1aVPiqb2qTAznYhM3UnaV0Oo2simw0QENoYC3/g4iZ+al5jHcleQMbSKa/dXJOLzoCCu0Te2MI9tx7jqu5V7qBqQTZ6txAxXNQ5wAi/rt7Tedevp42wg9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3690.namprd11.prod.outlook.com (2603:10b6:5:13d::32)
 by DM4PR11MB8131.namprd11.prod.outlook.com (2603:10b6:8:190::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Fri, 12 Jun
 2026 08:27:31 +0000
Received: from DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b]) by DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 08:27:30 +0000
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
Subject: RE: [PATCH v3 0/9] vfio/pci: Add mmap() for DMABUFs
Thread-Topic: [PATCH v3 0/9] vfio/pci: Add mmap() for DMABUFs
Thread-Index: AQHc+PAJB2FDg3e4hU+WfDDhtpmx/7Y6l0AA
Date: Fri, 12 Jun 2026 08:27:30 +0000
Message-ID: <DM6PR11MB3690A65EA9D8A9B77AF93E198C182@DM6PR11MB3690.namprd11.prod.outlook.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
In-Reply-To: <20260610154327.37758-1-matt@ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3690:EE_|DM4PR11MB8131:EE_
x-ms-office365-filtering-correlation-id: 5cff3f8f-030b-4525-2ec3-08dec85c7205
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|18002099003|22082099003|38070700021|56012099006|11063799006;
x-microsoft-antispam-message-info: NlGyh0URd4H6dIh3TENlsWwGCB0iC0NjN32prAl5HAJzf3MeIwxnLP3Q25XlDTbo/itC7EYwRO2Qn0/drqFQ7FtFdmXrRQtfc23uCO1MvJPmXKyMV9BZWBW9fLMOyw2D4X0WZbO2QesM7GB3p45T6aNdTVNSFbrU1j1crcJpJaPqFWg8xQpWZ2E6xa0x4LqU7wAKtJy4aKalJF9cK/svar45f2crdVOpu8+1hULcElVnJCDNbf6URYearByIVcy9LGemYwx7T4NSn2c3PeUt6T/CoJ7h3IWeMuM11Syo8SidOnTf6nfiRI5ks9gI4UlvITf4WWSIpqaCMUSyABYhjQih7I2YFhL/a4egauUQ3j8mzx5qQ2EztfP3PAJSUDcnvZnTr2kB5+nsN5pFfXknoGC1GTOJphDRxmqcOpG3hZ4F3dEnavgLxTdWS6BcVRRMuzqMiZLoXjbVurBxxeNv7IXa/M1fdsg11MBN7M+LqNLlq1Qpz19G5IS3x9eyz+QsdkX5lBO5p+DDfPmX0pFCI2HOoitOCxdIHzRR70pskdeJ+2Wv3RTKlNjgPDYbXErP45jvJp0kfX7NUGpEhEzY7Q/SGTr3EXjbp8bFu9bt2sRRQ+gkpMxXNxgx7y5cjkLX2u5NvY4RZI9j2CN2R7Wy/UMiVyU1eSf2/J+HriVLvDddMdoTjxnBViOT7EYmasfjGsUJl7xD9cPKowsy8PULWIU7Yax+7zuL3ZeABhK1MhNjMH6P+A2hu+YOwNVPRLAT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3690.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(18002099003)(22082099003)(38070700021)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?wdBCHg/kZqLf6d+yeIRt6dy+WKRjGPDhTGLWjhZN4BuinO32/w01JhwWfz?=
 =?iso-8859-1?Q?61O8a0UZMYQOmaiJoJjBzN3Xss9cX44aAXIyV6Qfb6huOPSlSEbjer7IQx?=
 =?iso-8859-1?Q?U/IeHiwO1Azb8esFuYrVBoeagQLW4B9zAHmxaeWcu+w+5cU5PcFyK9h/Dv?=
 =?iso-8859-1?Q?2FZFFNGvDuh8vSBf+936++lmobFyBcVUDIRKQXlkchN9rb8+LG1ZKdhE/G?=
 =?iso-8859-1?Q?12TzELjWox4/DQhzmJJbLk4LiedZ/rFKl8mnS4R+SjaoS4QILnKGaABCO1?=
 =?iso-8859-1?Q?zBu6xlwaMMfqB+x2dA9e0LIySm0wEqpRNPvqUStaFGDaJ8n5YWXaZ5So6D?=
 =?iso-8859-1?Q?jsrKMu+1kkdknVWbsRgsX8wezL1+SWmM7YKCIavhgUnJXn6kGsuQR9KDgc?=
 =?iso-8859-1?Q?Y61Ub2ZB4Ij5f6nx4p/jo1wK1ONcIbhae59kdmyvkxdtycVc2j8GfjXibH?=
 =?iso-8859-1?Q?wj7hNVySjNnBenXCLC3XWZzWlFOBd1rxDoLDTKS7aas6amqcpaFH8hQGhV?=
 =?iso-8859-1?Q?zv0D+OmKLYh4vVhT7IBAVfEIYG8djltsvAhQ4XNAAY4up1lOsnSdZPp2LO?=
 =?iso-8859-1?Q?NJpl3JKJo0n3DZA0CpO604XawrTWClg032vt4ihIOJhl2LxHuRFYV2zaea?=
 =?iso-8859-1?Q?1U3Y/lnobrMXFXRjxybqrY4KhoAy8kW/85Y6gsvKm3KjUQBhs0X2OAdRLY?=
 =?iso-8859-1?Q?4nUh0xKRRv2NLHblxqI4heZRjbET/sEO86+P6kK/9k7bKMVJ8wz61rvq66?=
 =?iso-8859-1?Q?Ev3En2GNI+w1/8ApOn0DOC09mbzSpTi41NEjZ+Tr+EeRnet4rK2/CnlW4k?=
 =?iso-8859-1?Q?9EQSlABeZ3XMjsc3toTiYNEelodd901+RcvQ1I5vohhqS9iHcn0fWt1KYH?=
 =?iso-8859-1?Q?qEWSC1737Cm9d5hvH+GcA7VVtJRJubS5WlNmkmwqO+II8rZm7i9tuCsO+D?=
 =?iso-8859-1?Q?GNTu+GrlcqLpiYJBMFex+xD0A+ytBJBGyNn3zEaubiXGGxrdNbjZyAPaOO?=
 =?iso-8859-1?Q?0ghr3x3DyywWlr/tC1DQ+cN/glbuu2pqwTFXLu5nrvKfY5sFf+ayCww05n?=
 =?iso-8859-1?Q?DaapjVUaUM3ru3l2ceUug1L3PZjkGzDfnVe7PryrXt2LJWKJQfIeBYQzNV?=
 =?iso-8859-1?Q?98ZHVmaLvcFSWgK+zUr9JRJTRtdin2DB7wSSIQD/O4PEKmEmE0ZCEmhLaF?=
 =?iso-8859-1?Q?f/NjT/d44ZlfgAzwuPadf3BO/4D2/ztSvUkR9lPD4kWsslDaUmAUxgwqat?=
 =?iso-8859-1?Q?4hryjJ19j2mPQWZXw/njyMjOgLn6nBVPjrZ/uSgvn4Zd0uJ7qLspZ3aMCk?=
 =?iso-8859-1?Q?TjjKsE9Suvn4liuWtCo3RVdTk5FCyM2iqEtp8PJCBU97MXCqoe9rUqXBua?=
 =?iso-8859-1?Q?pg35X60V2Eih8pbypUPzdBRUAaTCR37i2i6MF9QMmtff6NVxANhZ60XAV0?=
 =?iso-8859-1?Q?qGjHw0Rza4tyScbJaFOz+vQoeo0BlVjAubFjEt5ttGCPGq2zyc1GsVsmvM?=
 =?iso-8859-1?Q?Huagl2ODsXN5omhu2mjll/hktNbINBDzi3UAHJLwJfuCQVrb81EFsB4T/F?=
 =?iso-8859-1?Q?USLaz7Vf+2X3gI3aiiEmNfz2xxeZraWmZTCVhifxJC530MUsoZJFHdT+gb?=
 =?iso-8859-1?Q?pdkOUASVaQQbwvmaKbbPCsefoRv/DazLnW2f3GsJjji+T1elFm70dv1rdx?=
 =?iso-8859-1?Q?AfPSxVYAmKhgAtodwBKzJ9V6rm+fJPW60xDgeT4clgrpmbEQ/JLdUS4Gfc?=
 =?iso-8859-1?Q?wNMnsPFMs4YsX5i7LXJ6yDT22d8ikiyTrCrkEGFSvRHsvK?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lbX5x1Lp50hqgvYCnt3GFy0N+8gY0W857gBkICKa0gIZqdkw9MWucCHQ3JmD2Fe0XSNxYOUOBWoyUjNuhExvZ+nrxx/00bTx5MxnSQNvmDr13P9vbRCT3xgdui5b3mkCDc+OtjoOBnOak19zIkot0/WIaDtL6WGEU34+0vkeqfq68Uz1IB+3Wf+tuwo3PZXBW5+l8InXybBypEy6uQcoEsHjpcrUbLYGvPwGlICjHxCbACSsATlzifOozDdYsZULxYpUkGpHNpHLOJFCjhm2PSCGYkqBRFWzmJ7zpXTQf1RHTcFSRr/7Rptx1BHKH5J7H787tcxCrnI1Zqdkqbl3BA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cff3f8f-030b-4525-2ec3-08dec85c7205
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 08:27:30.8241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oc5DbL8m/CcrmFFTCEO81uIIfKq67+lj7UuarbmNcvInxV2HP2Y0XTRTxF0dUu/VYmmJioMzD4Gd/hrk9kPkxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8131
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
	TAGGED_FROM(0.00)[bounces-64651-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matt@ozlabs.org,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kevin.tian@intel.com,linux-media@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[DM6PR11MB3690.namprd11.prod.outlook.com:mid,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:from_mime,ozlabs.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1DCA0677D3D

> From: Matt Evans <matt@ozlabs.org>
> Sent: Wednesday, June 10, 2026 11:43 PM
>
[...]
>=20
>  vfio/pci: Support mmap() of a VFIO DMABUF
>=20
>    Adds mmap() for a DMABUF fd exported from vfio-pci.
>=20
>    It was a goal to keep the VFIO device fd lifetime behaviour
>    unchanged with respect to the DMABUFs.  An application can close
>    all device fds, and this will revoke/clean up all DMABUFs; no
>    mappings or other access can be performed now.  When enabling
>    mmap() of the DMABUFs, this means access through the VMA is also
>    revoked.  This complicates the fault handler because whilst the
>    DMABUF exists, it has no guarantee that the corresponding VFIO
>    device is still alive.  Adds synchronisation ensuring the vdev is
>    available before vdev->memory_lock is touched; this holds the
>    device registration so that even if the buffer has been cleaned up,
>    vdev hasn't been freed and so the lock can be safely taken.
>=20
>    This commit makes VFIO_PCI_CORE depend on PCI_P2PDMA_CORE
> (commit
>    1) to bring in (only) the P2PDMA provider code.

the last sentence is stale as the dependency is now added in patch4.

>=20
> End
> =3D=3D=3D
>=20
> This is based on VFIO next (e.g. at b9285405c5f6).
>=20

Sashiko failed to apply this series. Is there dependent work in vfio-next?

otherwise getting a Sashiko review is helpful here.

