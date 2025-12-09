Return-Path: <linux-media+bounces-48489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20170CB0D7D
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 19:29:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD24A305A3E4
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 18:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0AB23016E0;
	Tue,  9 Dec 2025 18:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dS/bfgGI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD023002A3;
	Tue,  9 Dec 2025 18:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765304955; cv=fail; b=pgGogeV0ewE8095sInovLQbw/oWu4rQWuQX3WHPWkBtxiBcr7eCj8SXlCpxWVVOTSqwdf1IjHnay9oWZZeUiL/Y+xUpB830Brv5z5203zb+/JEwtht5tZgFXn+Tl1WhBODusfVlJpsFBejCLRto/m91TSDPThTO0/ADZy0scOJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765304955; c=relaxed/simple;
	bh=HCTeVJ8i1+DELxBEHElFhry4eT3mR2HygC1Rh7UL88M=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RtRjzbPPV1BX+DWwsMYANd4wF4vmjw5c+9HtqWPxD2FYY/7YkUo7T5po52YVqoVhxOuheFPttQq+39BPyn3QOsJZ8lo+G2AVR8NDgM+7f48aB3qnXl1r4/Rfno/jt8TCl2eOLIapsv9FWKKMMyclgnmCMnZUxyRXqo7jDrjiHXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dS/bfgGI; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765304953; x=1796840953;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=HCTeVJ8i1+DELxBEHElFhry4eT3mR2HygC1Rh7UL88M=;
  b=dS/bfgGIxL+PK+WJJ/2Rxetv5VdpXX+MQn8cOCHOAKjC5R8y5IYpa5CY
   jLuU/wiCRhudRYYrgiotIPj5jhMiila4hM8roUaUX23z3wwqsAtExsvv7
   1ZShGaxnPSq5Q/edhfF04xiEnssecu7EH6XVPnw/Kval7vRa2lT6Ks/Mi
   RK8Dwc0YTG1+zWpzC4b75pW8UuE3swabObgkZrsrXpyshfypsS0mVFAFb
   Nvs8CzeGc6GX2lbsoKKfCIfO4FmKVTYtRjqnz9O/i45uqD6X3eO0jbLfP
   CjdCFKxalQXOr5BhqYmeAiLcgxxZ8n2MNa7Q8LPr6bT9Zrzn9JIo5BOvD
   w==;
X-CSE-ConnectionGUID: M0dIvzdTSX2hhBEY1DE8tA==
X-CSE-MsgGUID: IW5xgioDTqyJ7xehDx44Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="84682251"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="84682251"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 10:29:13 -0800
X-CSE-ConnectionGUID: cX6jKJm8RUO60LE/ILYhgA==
X-CSE-MsgGUID: HhdE56lrRuaw1rHJxIjwrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="196337694"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 10:29:12 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 10:29:11 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 10:29:11 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 10:29:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dN+G7qfWLxOrRaYQq3ljkylzz5GCfnFsbSgzTfp9gc52VcOxap0m5bTYreFk42XKwBdLquZP2tRd6d5+f/OQqyjDOcN7gMA/Q42bCHMHsQNP3vFA9+fkEPlTixvOHrk9y8zegpofDyZm1vu6oYAzXkrMWyws3YU140Ilr93JiYwHJg71Xgd6QbVorx9zWVaaONBaVEVpSu3cpMMyWT5ARiE9Ro1gKWp8MKWgkAAL4vrxM/piIz7M7SxA9UnR9lvHJMlkMn8/hY2+pJhQlnqHI/JbDee80lsHdmappd2Bt/Y4th98hpRj7SO4r2RwHQE5KsFiwUh7hnu3ZV74fKMJew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uceKn7KhWBV7xhzxhl/dAMUWB8IrppRsASMCZpNqZa0=;
 b=utJRSJOdoqLxnoS4HjenhEQOyy9gz8L4GdyUC2ZDnZULriY53oYmizTYFzGqmy6uCBRqk04mw4t51eUEo9N45QhjNejjK51JmQfe3hHfbLWYmXmIz3fmTFSAp6I9GRFcGYEUCwuu1ghF4qpodHfxVuZOsxShXNaRIWmmwvcNmZE0VbRZ479X+3+3WYxm7Ikdpt+e5wnDuBgLu04FsT+QTJjk6G3J8SH1gTqWq/DnN4dIdra5M/BWuTcoVYRfF6RjaWudAR3H8MInnCYrSYbyhKgCRA1zqL8KQYqe+tQfY16uVwmaZ9kZelSxDb3gi//U9PFceV9foL/mUNTkOYAbow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by DM4PR11MB6453.namprd11.prod.outlook.com (2603:10b6:8:b6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 18:29:09 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%7]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 18:29:09 +0000
Date: Tue, 9 Dec 2025 10:29:06 -0800
From: "Luck, Tony" <tony.luck@intel.com>
To: Daniel Gomez <da.gomez@kernel.org>, Eric Biggers <ebiggers@kernel.org>
CC: Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, "Rusty
 Russell" <rusty@rustcorp.com.au>, Petr Pavlu <petr.pavlu@suse.com>, "Sami
 Tolvanen" <samitolvanen@google.com>, "linux-modules@vger.kernel.org"
	<linux-modules@vger.kernel.org>, Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil@kernel.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-hardening@vger.kernel.org"
	<linux-hardening@vger.kernel.org>
Subject: Re: [PATCH 3/3] module: Add compile-time check for embedded NUL
 characters
Message-ID: <aThqcq0iGge1pQCr@agluck-desk3>
References: <20251008033844.work.801-kees@kernel.org>
 <20251008035938.838263-3-kees@kernel.org>
 <aTc9s210am0YqMV4@agluck-desk3>
 <20251209001139.GA7982@quark>
 <d3dd8fc8-ab46-4cf1-87a9-0324685ba2e0@kernel.org>
 <SJ1PR11MB6083C6D97484ED4E4710268EFCA3A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <aThSGiKwJRYOB6kx@agluck-desk3>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aThSGiKwJRYOB6kx@agluck-desk3>
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|DM4PR11MB6453:EE_
X-MS-Office365-Filtering-Correlation-Id: b383e22d-7172-4e92-c913-08de3750d7b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nRufGqQCg3FTkrqyvaDrSVsup1vT21gFpFE4xx1zqbpHKpr7+uAF8b9kjG76?=
 =?us-ascii?Q?Jt7RX/ttIReYXdTbjWuNnvlWULzeNa9rF1GxAlFj/xim/xuvKthNIi7tHbmo?=
 =?us-ascii?Q?0B6c1a0kJ3UCCXqZ2UXoHnGBGbMYGMHhDRgWFMlwZfOMMBcgi0VIRQ7iLZA8?=
 =?us-ascii?Q?3eDG4V51LHffio93zbWSMNIipzeeBx04ZLCoXnLTUEfu5PTbuaPk97siQ7Hg?=
 =?us-ascii?Q?a+PzXPW2SywmpzLcFuWaYIbYHugI5hMQVJIfcUyqtDRDopDUpx+kHc6Y5R5o?=
 =?us-ascii?Q?yvTxVla1HpVnzw5zws6AI93tOsPykYCImh+AP7UjkSIH0SJ7bZDbT5HAcekV?=
 =?us-ascii?Q?s+6TS2CMLreTxbEBpRxfSTIIIvpkZGm4x84x3KJAtID7KhsuzkG4FStgRis+?=
 =?us-ascii?Q?2/9sDwMwbZoQlhWfXojzvLfk7J37Dfr2iEeCzZAzrDab/2TbmihVkLmNaEqf?=
 =?us-ascii?Q?uSQwYMTyGDKZLgPDB3WzPOOscANxv5oIpq5TaRA2dUKQhngpg2NXl3bmTEwB?=
 =?us-ascii?Q?KV+DymKkuVcb+i8GgCJ/iqL6QyBjOHVpoRYX5777oRtqjalJGRca82wIjFoB?=
 =?us-ascii?Q?85LNuLktpgHJ6HG9NaJ14+Jrh1zA2OFkiWQjKOA0ts+k8XZVr4QjTIpB2Ucs?=
 =?us-ascii?Q?RjNa3YOQK8zqDpt8k0XOBpnjiTQoDC2uxyT7w1Z2mKrI1yFGSUpbZnCbUF3M?=
 =?us-ascii?Q?SYLe562KVVyp3WuPetInsgizDiJ/ZlXpW3CHpA305xcVxEhB37c6OxYd4m+M?=
 =?us-ascii?Q?LQs9tBuEhKxVSmGLkEYpEMx51BBYuzuM1RfxP62e6goMJZdq061X1Ls2PeLz?=
 =?us-ascii?Q?+mzragLBE2Y1pJvE2MlKvWiACnPOClDR3Aw1stem7AIGZENxqiTNEutkDYvQ?=
 =?us-ascii?Q?N6PuiK++/lFhjmsyH7Ej4D342SthIPsyACeORYgVRrXpNQI74c2zL/V8Adn4?=
 =?us-ascii?Q?BjRHht4dGMLY+ypaE0vljP9knIfjaA3FP66fqXcT43XSQoxGY30ulIz8Jz5Y?=
 =?us-ascii?Q?hAxHFgQCyVZXWyhCcqKoq6mSoJzcrr2OHYM6lHVbTSp5nw24FJQxJeEescsZ?=
 =?us-ascii?Q?bFR3DmKBLWyIqB1U9joC/FcK8hXzlYXlDseCRChSf2KDl5fCFWwiy1jwpraS?=
 =?us-ascii?Q?yr2mcMqZROvN3GsKOGXipjSQdGEi6fV9XzOLJqi6SrOfZOgXzUXVLde0+zaQ?=
 =?us-ascii?Q?xSjApMMM5gPgYxDz+PWJpnuaoXfGWoVrbbYU3D3lvEgAZ2HPFk3D5xf54rIY?=
 =?us-ascii?Q?3C9aENho3W3kCs7+UZGJL0GGsD+9k5mp0X3xVZiHhp0mEs/cvfjPOXDnoE4I?=
 =?us-ascii?Q?rMRPJ76kQ/eVftoJsObJZf3Y6bfDDs9bVWsgZ+pnXZ4BjwM0AJ5mhcpPn93a?=
 =?us-ascii?Q?973uAMvsXuBuzKVxjcUq6lCNeJQsS2fDRg0wIZ2Hsaq8J/3VrSBvz2AY0MIH?=
 =?us-ascii?Q?k1hRHF2U3OI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3CfEIBodeCbqBB9qWOgCkSAhxdiT7/fp2eLTL5jrowjTeNCRLsLTRhtTntIq?=
 =?us-ascii?Q?xIJ7ZGpd+a4G92uvOX+qctjS8cOcsB+6OBgR6l/OhHX+ZS8VFzLGpc8u4WYx?=
 =?us-ascii?Q?FD7gjvXNQC2TLuAO7nWCYfKvI87n7/j74qLfPETFW/OUocAnQH/FQhvSBbpt?=
 =?us-ascii?Q?Wg7Z0nRqDqNoI2TO/5pueP8XGlWJvyeb/M95Wesdk0qeM0dw/i4G+/iGgA9q?=
 =?us-ascii?Q?JS7vW8uQKPMy0UQ5lKVnDFXMaBp5VIoBcol2WffE+KxSITXjhYMdI5yRWuw7?=
 =?us-ascii?Q?U+xw25Bj5jW0TNilqUsfJAGTRgiR2F9WrZ4JVzg/kleZixMYzVWAkezX4/wS?=
 =?us-ascii?Q?/jTtiZIa7CeNmI0aXYfYC8j16MZ84YwaJUq1vmys6iJZwPrxIlpDpH7Znlju?=
 =?us-ascii?Q?xfKZN7uKh9mQFuFZ/Zo9Z1h9iIz8DLH/9xThhGe3Cb1e8webkypDltDFMU/W?=
 =?us-ascii?Q?hB1FE17pukeLk37ZQ5ykDtqtdvFj4ujT8VqT+LY7EF2GYkrs3JCFfZT4xaT4?=
 =?us-ascii?Q?oYCxWySYDEMCMXIhcW2kziHsQcZFlZFASPVNo8zXIKnJ/GVvt5QpTLY3vWqV?=
 =?us-ascii?Q?2r4qg0+lUr4JAsgE9yFcFpdG6J9yWXk7qjfC+q4791V8Ghk6cdlG92mQpfAf?=
 =?us-ascii?Q?GO/4KKgne7qJU8ryE8sRrln3taE4e2LEabKXxUCVhBIbvRkeOx4f4DN5DBCR?=
 =?us-ascii?Q?5oKbuC5q+8JGGcELbUv2r9DiAMPIU5T9sEa1YhsO8t8Go/xpWPcCniCNjzuB?=
 =?us-ascii?Q?rWUAmdqQsgfqWEySG49WEBJvwsP9a1lef+xY9mDmqzvwTYl7mMKT/Qjwrn5D?=
 =?us-ascii?Q?AAxIy9g14lqqBdrA7dVq2wP/HA+T0f4dRfUHWBjG04INxtUBhB+UbXU0rQD3?=
 =?us-ascii?Q?SSbOLcRaeBlmXBd6uxD3nQFKyNq/ApXoDPNBRSKytAtcabDi0vwh+4R8v3yv?=
 =?us-ascii?Q?skaEC9oqMG0+O+l994jYje/KNy+iifpz0QJtr5umnxTEsbTBxz7Vix8Q6stE?=
 =?us-ascii?Q?SLKbSCKErjt2TC8Nc9C6GRdMiR2l8P1RJQzyUb+vxjYsA/VCg+BMh3RXIVfF?=
 =?us-ascii?Q?QJH5HUUAy2eXj5+aR/sqaDmzPd3NKn+LnFktLF8Aqb8Z7IZLISLX4OALu5od?=
 =?us-ascii?Q?VPG6YdHCLcZ5c1baBPa0OeNjP9SfvYXs2i69qGcCS4rSLfmD5q2YsLuhAw3w?=
 =?us-ascii?Q?3E0fwj0LkNiCQsDawhRy/YadJn6vIZWUduc58tR5oNWIzdQDdXfZ5S600KXL?=
 =?us-ascii?Q?iENdzkWvpTcQ5rjpBSh91ihvWShBnzvRm3tNYM1E+y7z74KEGIYhVso2kzod?=
 =?us-ascii?Q?91gzXK+7hZWe3WW5F3URz2+NZ5ZvuqN8Yd+uJHVfLBjAkEQ/Yl4iPCUNiL5E?=
 =?us-ascii?Q?q00+gXu39pXweHvQ6wpohsDHy9o8Z3+6jW1FQQGkwxGB2yWaVdvCYzO35cbb?=
 =?us-ascii?Q?vBf7wq8gqb29dYFqrkUazWbmFmKcFicF+nfALkRuR07ebSWmC8+jjzh0a1qo?=
 =?us-ascii?Q?zbPDO5K/SJmN8opTIMATiy0WDX32Rcz/xYlq43Xkbro313dcHLtYKp+dPCqS?=
 =?us-ascii?Q?SGveTMMF6ZQVe0iozwxAGbPqBVlw91d+3BLF3coF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b383e22d-7172-4e92-c913-08de3750d7b2
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 18:29:09.1630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOYlD9pjRf8sFugr4bU++I59+ZgfkCOeVXNWzadGPXGO762vWSEDi86aXjYrDsgVtYC60S0We5ZCUYz5D4gv4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6453
X-OriginatorOrg: intel.com

On Tue, Dec 09, 2025 at 08:45:14AM -0800, Luck, Tony wrote:
> On Tue, Dec 09, 2025 at 04:20:06PM +0000, Luck, Tony wrote:
> > >> Likewise, I just got the following kernel test robot report sent to me,
> > >> where it's warning about MODULE_LICENSE("GPL"):
> > >> https://lore.kernel.org/all/202512090359.7BkUaiC9-lkp@intel.com/
> > >
> > > Can you both confirm which version of sparse are you using?
> > >
> > > My understanding was that this patch fixed that problem:
> > > >https://lore.kernel.org/linux-sparse/CACePvbVG2KrGQq4cNKV=wbO5h=jp3M0RO1SdfX8kV4OukjPG8A@mail.gmail.com/T/#mf838b3e2e3245d88c30a801ea7473d5a5c0eb121
> > 
> > > The patch is already merged into the sparse tree, and I was not able to
> > > reproduce the issue.
> > 
> > I pulled the latest sparse source and re-checked before reporting. Top commit I have is the one you mention:
> > 
> > fbdde3127b83 ("builtin: implement __builtin_strlen() for constants")
> > 
> > I'm building latest Linus tree from the current merge window (well latest as-of yesterday):
> > 
> > c2f2b01b74be ("Merge tag 'i3c/for-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux")
> 
> I added a debug trace to the new expand_strlen() function added to
> sparse. It is being called and doing the right thing. My trace says:
> 
> 	len(GPL) = 3

Simple test case:

$ cat -n s.c
     1
     2  _Static_assert(sizeof("GPL") - 1 == 3, "sizeof");
     3
     4  _Static_assert(__builtin_strlen("GPL") == 3, "strlen");

$ sparse s.c
s.c:4:40: error: bad integer constant expression
s.c:4:40: error: static assertion failed: "strlen"

So the "sizeof" bit is OK. But the __builtin_strlen() isn't.

-Tony

