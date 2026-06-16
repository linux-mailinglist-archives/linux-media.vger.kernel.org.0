Return-Path: <linux-media+bounces-64985-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pXXZH6IcMWoRbwUAu9opvQ
	(envelope-from <linux-media+bounces-64985-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 11:51:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5CE68DB53
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 11:51:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=QLQeqWN3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64985-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64985-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C88953094B20
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 09:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327C4421F11;
	Tue, 16 Jun 2026 09:48:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0148E35E1BF;
	Tue, 16 Jun 2026 09:48:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603300; cv=fail; b=OajJS467jWfuyuHaUbF7vWh2cYvAicGFVl03ec/ZHJvj2jmWMDZkPFZoWJGqrWHW7BKGO/Gn4QDAWHRAjy6pYSWSGyE/CkWlovWrSSDXg7NGEEWIm5QAdXWCuXhxNhnPW7Xf4ZLVWVuF3CbE1jLQlanSbJg10aR+xTrZPTCWq64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603300; c=relaxed/simple;
	bh=S8+6+13CRuHgOpz59PQ7Qun4r+Vairlky0FUQzQZl6I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZSAVtfBUJ/4SjzZA3P9QlJZXsCzFwegMf+p2FAdDhjwWannCY/uh4fjNEk8rR1TSGGAPDupNkliImeEmKP3Ai12QBCTZ/M2qwcl8yaxJW99jRoTBEKu9vxER+j+eGbGz3XlSpeXVUDGZTaz2oCspcKTl2PeqmBwkvjvxbccpzX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLQeqWN3; arc=fail smtp.client-ip=198.175.65.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781603299; x=1813139299;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=S8+6+13CRuHgOpz59PQ7Qun4r+Vairlky0FUQzQZl6I=;
  b=QLQeqWN3rhhrH1P/U/6M/6DC4Gj/bI836hb9FXV2GH0HULid1BXniz/u
   S6mKHIwcn8j8kvCYz6yQpEiiSHpoGFug2SJoLZ+itTs3kI8GlFzZYw2Ph
   f9kfRnBnlQ5ujK0N8d0mN0uNmLavxUs84U5m9uO6CVEM9TYHjCMU9CEH4
   pEmoSwAEv2FNRMVNG2NIjiT6KcaORFJ+sBARQIunmBHZyMSQjg/tGgujy
   Ra9kPFv0Vm83p+Zk/R+wPH8ZsLx3DbcxAl4/YC59rcH2LPxix6uHXBHOs
   ONPzwkbebbq33nwwPep3QtQpFUdl7XdE1qH9CN6HMi5JjluHCe/V8/bdU
   Q==;
X-CSE-ConnectionGUID: EU1/QhywQweINjheunwLOQ==
X-CSE-MsgGUID: SsbEAA3wRBO6wqRRWnyJdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82426653"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82426653"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 02:48:18 -0700
X-CSE-ConnectionGUID: pdir8RGJSC+llBtMPnikRQ==
X-CSE-MsgGUID: ZFHMg0xUQAmjgiTO6JohLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="252031368"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 02:48:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 02:48:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 02:48:17 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 02:48:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2V8IrRJyPw2ynsGTNpHC+oPgz74ZkCHdJQCvDpaqvZOq5fu3jEYxNEft6mfRQCNasJ/WEDgEy6PcUHMBwTLJz5A8p2u0C2J0K4/CNYaD0mKVHNqH+u6e1y0kj1smrEVsV+n2Gvfgal48hOxZBzVE35x16og1HlHcF+M9osVlMKe9IJyPKUFb/goIxHT5mhY83/bMt6fahyYaG29nk0S0/mgtD+1MYs+KcySdjI1s4i8w8bBtoWWHUj+Ki7qG9p6D7Pq6WgRqmu26mF1uLH/v8QhyijMmqjQRcUA6Oja1vWQDhzicrMjISWwr3eoaSwJeMPEvO9eYUxGc3JgE5JOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abPYk6hrSq4dKOLfRdKwntD8kDy/fuJZ416UyRO3lOQ=;
 b=XPBrc6MtRxwPOmfm9fZzgme6pWDfEOxW4VBlobWaZ4Oy2V0LsW51M/XfDHcmllLKW0NtY0CmjwYKSpe/0V4nUBkroLYxzXfHH6DO7jLV0cyZEFS69jhzodhoNhoNZD2qZFN7Kp/Jvaxw1RGhXv0vD9KHT0R8Fs13LOHe1s7q7/4zFVAOpByVy+TLOtIN3xPVK0dIX162DZtyvEJPb21PBlIdM1XUXWRBCfyO6L/SIIsokz/67eyg6G+ht2i0+Z5DgBfGpY1Ojwv5AN8AFpmeF8nrIK58x+uIuiYR4cRdWWG8K7ng7oME42oWE+F125chtzLmDe0YUp9Wf9OtJXerLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3690.namprd11.prod.outlook.com (2603:10b6:5:13d::32)
 by PH7PR11MB6652.namprd11.prod.outlook.com (2603:10b6:510:1aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:48:14 +0000
Received: from DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b]) by DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 09:48:14 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Pranjal Shrivastava <praan@google.com>, Matt Evans <matt@ozlabs.org>
CC: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
	=?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Bjorn Helgaas
	<bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>, Mahmoud Adam
	<mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Sumit Semwal
	<sumit.semwal@linaro.org>, Ankit Agrawal <ankita@nvidia.com>, Alistair Popple
	<apopple@nvidia.com>, "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>
Subject: RE: [PATCH v3 6/9] vfio/pci: Clean up BAR zap and revocation
Thread-Topic: [PATCH v3 6/9] vfio/pci: Clean up BAR zap and revocation
Thread-Index: AQHc+PAbYETvhcTyrUu/DN8Pu72QKLY7VG+AgAWiCfA=
Date: Tue, 16 Jun 2026 09:48:14 +0000
Message-ID: <DM6PR11MB3690489DB5FA611413BF60558CE52@DM6PR11MB3690.namprd11.prod.outlook.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-7-matt@ozlabs.org> <aixgZQiBQKgS7yIM@google.com>
In-Reply-To: <aixgZQiBQKgS7yIM@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3690:EE_|PH7PR11MB6652:EE_
x-ms-office365-filtering-correlation-id: 0b756e2c-e4d3-4945-4b5a-08decb8c62a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|56012099006|5023799004|11063799006|4143699003|6133799003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info: h7nKpIpHfrGZ7ayPPXQ5MjcbmwYqDwtswSVzvVSqNu/tnPp20sjnVaVdPaFID91DPRsQ1GXJ28m2XK+TE+OsiDG71p+LmsgKiYVbo22EQSthf0GHkham+5FCSail3q+jwTC9FOAAjoiFop3j6tvoMKEMAeoXgPvkB11CYWwkC4IMbrh1LIopsH4gOMpLG3IT0VvZyV1eV1Q2wI02pUwowd93zMumIIpR7QURVww8P/QO3yCuI5yPYiO4NovVY34ZLJuEBf3MGWh1nio3mlZWK/Sdh0WFpAxyBkl8CBhEYKLD1qmou9mjrbiscU8F7xd7GmDhmh5I5WwzewFER4AytyrmaSsxuqIYzNotcpbSMAspCsGLF6YuyuU5Im5pRkkY7amBly8rGra3OdaBn5gK4/0T95ZIVhGdDKQ0ZBscVey+ypZ41HSl4r6SyRh4HHy1866DMfZIVkrWAPSG0Kj6wSmpVFKM6VFahOIHdqm/31tGpU+hucVGZBlTk2SDTdhvlGOmi/gpwK+sIWc1uESN/1v9CCh3hM5hiCNqkXH20j6Uz6qmzTARm/Ctqlj2lnq++7EonitiRpZ//1NFZcIhg39OA5ySwlFt+zDD7lQVEyJ5to2swh6Oh/pwck5D3fEUrjFtmc+u0U+clgO6ZZB2qSXVLK0ksDArKTWKeqK0Rz00ORtyav/ULmMrQiNIOzL20R1PIDFAC4JlsYZX5M/LdP5hQFIjQz/ebSm9Z54u0wEUwi8lRK7KBte2sOK/5C3n
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3690.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(56012099006)(5023799004)(11063799006)(4143699003)(6133799003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?bRUygWBZ+Lv/yMNtDIFtTtLUWIYJWlDZ8tuoz0HCiXKIPe9vnF5MKQe+wg?=
 =?iso-8859-1?Q?VZzzeCv4HeM4DgggCY9aAW/L1Wj3TbtLi7rPQWsVhU2ngVR9XfH2a33JHV?=
 =?iso-8859-1?Q?VXPWq8tdx8cIpsJdopy87wcA5+XjIgG/z3k/mOHTmRZVo9tyghzGlXzzk9?=
 =?iso-8859-1?Q?uHvbV6NvdV2+IoshwDlV8ctUO3tgUi4wcvBxALZF0xIi3fyNlv1GzMZ8m+?=
 =?iso-8859-1?Q?Rl8mjmfdRuKBVqL/IRBL8zq8RE71ujcPU03t/FPWDHIQTiChJcNJNitchd?=
 =?iso-8859-1?Q?C6W+4HTOKO2AVO17hrHKFAfC4iyIX9fFWYM3MzCwSIrP32aC8BTBEcRK/L?=
 =?iso-8859-1?Q?N1v9dEVmQYs06cSTu60rDaERZUoqZy3tKCUy35Q+vkizv/I8siXRd+2zHF?=
 =?iso-8859-1?Q?+IyIaenNseeZuChCZhXTsmG5Xm8AeA7zXK1tGhkFblUENBeOCFLp56u41c?=
 =?iso-8859-1?Q?uUq3zTMySc4saCIArqB/HXZeuwflp1sjUj8RPsb+w8u64L+HSaPA/4FP6g?=
 =?iso-8859-1?Q?3l6wnbGqJGE9/AW1XG6VHRQA9xYUMr4UvzTIFHqZg9vdCLRfv6uf73ACVG?=
 =?iso-8859-1?Q?C6ekv1pICygq6B2L45mxzToiRnTug2fTrp1IamYVNZbj4vW0B102UzzLo6?=
 =?iso-8859-1?Q?haVA8kMB0m3j65SjVNzrI6xSs97YO2mzghsIO7INg3k7uQxTlxMutOJ8bd?=
 =?iso-8859-1?Q?bnPAwt4lcYDs9endeoc2cRsSCn4nSSYbv/9f/3PjBSk2TCGiJLEktnmpt9?=
 =?iso-8859-1?Q?ggAsmQQYm/a3UWNipqbeN+CDVSyiYatCDU8ln8xXQgmfwrKPXAC0Ozlurk?=
 =?iso-8859-1?Q?BauZKypAjeXzjuDCz+8Q2krHz32T99V+Xh2Ge7Ll/r/NvwcMbrKQdrlbZk?=
 =?iso-8859-1?Q?RVMw1v0Xonr434l6ACOl1G661H3EQFHwzSAfhbSX4MlXHuW3uiYIC28FSL?=
 =?iso-8859-1?Q?vGFRP363zR/a58tPyy/B8NvR4zkmR8BQhkftkD2K4FwScYGZIsKJAK7YvG?=
 =?iso-8859-1?Q?8K1A7VVDfTsHhV55xY1CU4lnXyNQbLyKBys6iyIKbVymKCXKroBXJJK1g2?=
 =?iso-8859-1?Q?PE6GCB00qKuIQczFh4JI43WVmOo2toMJ0zme4TtMQ3KdBRHMEzR1bikncm?=
 =?iso-8859-1?Q?5cpnslXgvbjwkUPsba6f0Zhn7WO9U0jDvLDLV7eMSOVuGRrhfrrrNfrMr3?=
 =?iso-8859-1?Q?eJmcnTrhYcfXR/+tRxdhS6p9gXf6X2avCWbXYwJhYHkBYRUxXSk/AiWP57?=
 =?iso-8859-1?Q?n8eczcbzO5IGct4WAuIZY2Qc2TlFqmZ9h7gnJuJHWwIrMPl/JlerLblpZD?=
 =?iso-8859-1?Q?1wPYwzekPdI0zjN6w0ImEhf7/52VgYoHTk54AAG4g1pgQaI3rBWflvROWZ?=
 =?iso-8859-1?Q?FrBAh2AM8mxMsN01BjSlP1u6w4f+IdQ6mT95YqK/E4dsuJ0BqQlDXGvpPy?=
 =?iso-8859-1?Q?5mRNmFhU3pD7YYZ1lIplBU8wf08s+AXS1SWdHT+ssqbg3xSPnyk687CzyS?=
 =?iso-8859-1?Q?JCjKtvthJirMqiEmxYUOMSG7wy1OJ7sgCl75MWW0R+WVUdxjHuJDIpSH5g?=
 =?iso-8859-1?Q?xPBn2UjPSRJ81ze7vABELU4+OEKkRI/RQi2U5HDNT+czNB9eLpPUyXp9A2?=
 =?iso-8859-1?Q?MMnhy1PgN4YkPW3wvXlhCHvtB6Xbc5vHoKfTFgOnkOXtnJhCLnlokv6nLd?=
 =?iso-8859-1?Q?ZQKZeDGqSynyw0kT0rg3CH9UhnyKpgO199t1kgdLtV1fZLfqAuyKNSCypb?=
 =?iso-8859-1?Q?0yK7sZxCul5vCzi3o0wLzp/CknHTW+C1Wnc+B9I2w3Mu3F?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: H8+QHx1yc8AKgysVyBhD34Ke5A2Qy8IBF4gGtdSpnbuaPa/KTzJgq0R+3A3iPMXaIj1y/mqu4aOX50vtc1HdIqcC2TRpiwbo5Oy1Tc/AY+jnouvzm6cxF3np3XkaN1cTq5LLE+yAc11MGXSiBGp8p/rxUjjMBn80gdNYzZPf5F+jMIUwWOcK++MPgSwKqMSM/m5pAb0dGZUuw4VIIdaeXENijBeHeRjcH3Fh50ts6Axe2LjW2U9HnzoEttacYoJMVqQNyL9INVrDfxhTB0M8FOZCOQkONIogYd1pwLRq8SJjDgqhAzjUfjLgzb0dN/pEKz3Yc5DNO+8Jf3+UESQW7g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b756e2c-e4d3-4945-4b5a-08decb8c62a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 09:48:14.3936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZcKfp1K6cB9Y9JdoRLABeFsmit5tH4CmssCSt0eh4naDBUg0KSJs72M2Gq3z0OoPIus6CWNAKEchmSFE/1UDwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6652
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
	TAGGED_FROM(0.00)[bounces-64985-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:praan@google.com,m:matt@ozlabs.org,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[kevin.tian@intel.com,linux-media@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,DM6PR11MB3690.namprd11.prod.outlook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:from_mime];
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
X-Rspamd-Queue-Id: AF5CE68DB53

> From: Pranjal Shrivastava <praan@google.com>
> Sent: Saturday, June 13, 2026 3:39 AM
>=20
> On Wed, Jun 10, 2026 at 04:43:20PM +0100, Matt Evans wrote:
> > @@ -1264,7 +1265,7 @@ static int vfio_pci_ioctl_reset(struct
> vfio_pci_core_device *vdev,
> >  	if (!vdev->reset_works)
> >  		return -EINVAL;
> >
> > -	vfio_pci_zap_and_down_write_memory_lock(vdev);
> > +	down_write(&vdev->memory_lock);
> >
> >  	/*
> >  	 * This function can be invoked while the power state is non-D0. If
> > @@ -1277,10 +1278,11 @@ static int vfio_pci_ioctl_reset(struct
> vfio_pci_core_device *vdev,
> >  	 */
> >  	vfio_pci_set_power_state(vdev, PCI_D0);
> >
> > -	vfio_pci_dma_buf_move(vdev, true);
> > +	vfio_pci_zap_revoke_bars(vdev);
>=20
> I'm wondering if this change in behavior is correct?
> BEFORE this patch the sequence was:
>=20
> 1. zap vma mappings
> 2. Enter D0
>=20
> After this patch the sequence becomes
>=20
> 1. Take the lock
> 2. Enter D0
> 3. zap vma mappings
>=20
> My worry is if user-space accesses a BAR *during* the transition to D0,
> it could crash since the mappings still exist during the transition?

not 'crash' as you also noted later with all Fs on read and dropped writes.

>=20
> The old code is immune to it because it removed user-mappings first.
>=20
> Following the discussion from v1 regarding the ordering of
> vfio_pci_dma_buf_move() and the D0 transition.. while it makes sense to
> perform the DMABUF revocation/move after the hardware is in D0.. I'm not
> too confident about moving zap after D0 :/

probably add a comment to remind that ordering requirement for dma

>=20
> I mean, sure, the user would just see all Fs on a read and writes will
> be dropped silently until we are in D0.. but the behaviour before this
> change was that the user access will fault and hang on the memory_lock
> instead which ensures that the user observes a consistent dev state..
>=20

I see this more consistent from another angle.

Old code only removes/blocks cpu access but not for device. DMAs
are allowed to this device while it's transitioning between D0/D3.

New code at least make this part consistent - both cpu/p2p are allowed
in the transition window.

Ideally a sane userspace shouldn't rely on the content read back when
it has initiated a reset in parallel. So this behavior change sounds ok?

