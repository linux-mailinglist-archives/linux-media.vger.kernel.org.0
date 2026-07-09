Return-Path: <linux-media+bounces-67106-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KOH2C1ZFT2obdQIAu9opvQ
	(envelope-from <linux-media+bounces-67106-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 08:53:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7857572D5E4
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 08:53:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=O2qawZtn;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67106-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67106-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 520DD3014DAF
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 06:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9973CDBDD;
	Thu,  9 Jul 2026 06:52:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BB53CC9E4;
	Thu,  9 Jul 2026 06:52:31 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783579954; cv=fail; b=suuo1qHDEaSzgBdVakVSR25zyMkayMvMyki7i6H3WbR6hyRr4S6mqM01uG2Zb9Ds5i1gvGjsG0HkUi/OCECTZXxHBr6W/vEGnTgHrIoN5925r2kTXFkoy2AgYZAGhpn5qwI2olPcub2/cIPSSqCDYYK9+87n/FJ+ysbXPlbJMZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783579954; c=relaxed/simple;
	bh=kzl3PaRD2dSib1B0uAhcj4UzSxUYFYx98hCFcF9Tu+o=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=XfmPO2jPPZDBhYac8a4nv3gf81WlERUf7gMAJrHWhqG+MvUpOUiCxciWHkWd0XSq6mdr7JXBK8xmNHWMpDiU562C9EtrcO/XEe/NuEwSicOcDuebvxsjjgshiOKz+4PLisyRQexKnOnqs9vn7MIBDGhN8AYLtCRYSvIhtqF5CBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O2qawZtn; arc=fail smtp.client-ip=192.198.163.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783579952; x=1815115952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kzl3PaRD2dSib1B0uAhcj4UzSxUYFYx98hCFcF9Tu+o=;
  b=O2qawZtncROrRvBPrY/vX/MXGXGwHqFZvWZ9nbQgOFlemW/DDytm1jqL
   2LM7Cly1iUR4vJyqqkFCUfQgQjCrqGC/uNQjpDEUVyePJRVypi9vELk+C
   c2jPrQO2hkTWWQntM1KvWrEtWCRIJUBesh4s3hhHngaPWNAChJWqJN/aD
   KBHX8xwOkNkwdZeL4ceoKCth4CTnwks+uRv2PDQB03+LQicYEgTp98url
   ZCZ9JbsiixQ5LIfkMHw4goEwxEYbWk+Y9KhxSXIfoLg9mnmhh+9sk/byD
   fzffz0Ipn1W2MTJBM/CaUUTSF17HhfW8ooea4vSzv7XcrkEQHp5KSp8/H
   Q==;
X-CSE-ConnectionGUID: a3i9fXjaRLGVYf4bvESBYw==
X-CSE-MsgGUID: NAAur6O5QgmOZbBuxD7xvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88078801"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88078801"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 23:52:32 -0700
X-CSE-ConnectionGUID: 3O7tJJFaTvKcqqcAqxn9Ew==
X-CSE-MsgGUID: nmim2bRRQ7esRDruXd89bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="292693484"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 23:52:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 23:52:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 23:52:31 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 23:52:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwrmGrV+V2j9U/9Ul63XVuSc5J05zvxXHhFUbqROpVgtfHCltgt+Yw4zO/C3AzM1S/XxEwA+mtEA5Pwat7p06xrcdZoGCDr6LhKbM3iXDYP2tjUJOfcRGbg+kWb3nhoOeND4F5FNwuzxB2OHGm8xVJG/GbYOG7oeJ3JmLyZrXNUyliS36ALKefXFQVtyf/458Ik5F+HPEWZQPRWlJy3WN9rpurPh+6kMMux7P0Cmh0BgqMfVQvoZCvyHJO0aRHUzqmx8TYV6aEUjTP+PMJUr1aS8O8VVjUimB6bLvMHDeM17EmPRVGEW0zrY0IaHTtt/jXDy4U74TPuo9wlefoVjow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6/VmWcNy6bwNsdoQ7ECiKBFipxPc4Z5kzqCMVTHP2k=;
 b=NprvXW2uhe1EMaheJyr/kQ5KURSz4kmsLGw7rc+nmWHD1iJ/AQ1DPYFMHCr19K2RcOX6Bj+Mqmrrsw97XRT2p7KTqwL+94reLKzaz6Gg4B4SaQ8kfu5nQpXMIOIw0N7k4HKk3Y7xFdKb4H8CLRY+Stn8zoqAq+x7o+RFfMxszcm/gq9wjTvz9cXFfBy3XXYwRZ2v9n6l4JtCHnuzwGn3ojH9LQN8drfbG7A+Y5esevjX4a3Otk5gE8gH/ytmGOV3kM2/w07UGOSxl07hpfyig1Ee5V0XBjiDKGLc66PlBdPBI16+rQF4MSIp73Icn/yN4GnhpGsnpq9I/rwWZ6UwmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by SJ2PR11MB8470.namprd11.prod.outlook.com (2603:10b6:a03:56f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 06:52:23 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 06:52:23 +0000
Date: Thu, 9 Jul 2026 14:52:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-media@vger.kernel.org>, "Sakari
 Ailus" <sakari.ailus@linux.intel.com>, Conor Dooley
	<conor.dooley@microchip.com>, <linux-doc@vger.kernel.org>
Subject: [linuxtv-media-pending:next 15/16] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
Message-ID: <ak9FHzwiE6Kc6NB2@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: JH0PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:990:5::20) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|SJ2PR11MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: 24cc1702-0e49-409b-6af0-08dedd86a134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: qnsxaOSRh2/bdhcL/SpbuGDw1ln646QCBIZIHYUXxOCN2ztygG/vXhtmI2DyqVAWG+r2O3532S8oCauhyW7N6MTRhf6LIcm8kqv3zoopAFp1N/hqGnN/WRhFzk6FI30R5CmLRzqKz6Gg3SJZDPI9wnS8iS6gG3Q1lBFPaIU/gJcD5uLX+16Wk08eqL+Bknj6RFydcbQecDGKLPrYuhCgGPAzQn0caaF3I8taoO0D4hItdAgsr7qqE9uqOprMlbAzxYFTyMeEUVh6UJoylt7G+rFywgSQUiAHCwISW4L16+iKYApaCfszJktpXUTJuG7bn3bk4Mv+a62Gp9ZKHYposO2AZCI5L4iZPQpJWYalMQBKTu3AB+a1mj3uZlJ4grzuSkKsE6XwaJI+I+gx8ulKRb3QdADuYQ+oCn+kZBA9r9IxCK4mD36uKSfdOSdjQOGu7/JYOqf/+dHka1gVfz/0N+hYJ3QLN0NUjMFArjZ3Un+qvMwndOURKsGWhtBJY6EaK99P6W5YCVxnsgHlVu+hruEM6pC0WsBzrj1c3fkoHs42wEgq41Zixs3+U1ZM3XoR47NZXJWwE0kmKDTvJ3Txf3fFkoEUzjSlREZitGybitvJwT039pzhFMEle3YwswiJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NTggTUgrr4fjTPHoUzZ5G0Iye8rGFP2104Dla4OhLuazhZlnaypI3nt/6hEC?=
 =?us-ascii?Q?j9yBfEkavjMHFkP9oOT819fP/xohG0Ketjh9tqlsAab3By3CwE4map9ndxgW?=
 =?us-ascii?Q?OR1lx8CfIegGegiakXqeCBX3OOV1ybxdt6jvSM9F/1b9tQ/W+r+7biQclUlH?=
 =?us-ascii?Q?9P2ZJU3jXWcls4Ojz07BO6FsXsLHkCfJuvVtCYSMazy9hGLGFGw5Gvtrtnp0?=
 =?us-ascii?Q?63ml5ZbNA7VE7/sY6lVwAEPQWzoEaeXDcRP+cqIIi9zVSmZ89YsNvKjRWx+/?=
 =?us-ascii?Q?L+6nT4lrjxmUPHmyCgupzICcrjsmnKFIbIRYreY0LBd755CJj8Ed2gnMMgsc?=
 =?us-ascii?Q?pw6P47dxnycZ2m1PF6Og20rggj1hgO/UVXzAUdyfF5d5I84eAYUVjTBOl+yi?=
 =?us-ascii?Q?Wvj/8qn45pMmuj3jotOptXthCPhuPi0Lq9GXNtblIofeg4Mp9AxsAdkWmkeR?=
 =?us-ascii?Q?w+xzGfOR+XNyG20kSfeuwx645U1qcTPqd2ymYXhaKsfT7buN6VRmozSB7VcH?=
 =?us-ascii?Q?B8oQJua2ID/qkIy22U9sdl+GIfJcimIYzUjXgIbHzmrduIbnFNBGfWJftrTa?=
 =?us-ascii?Q?EqMIyL/iAkhKpjGJm+mV1uGsW0aFh5xGRUBnqYU5CIwTAoXdWUuhjqr9hqhv?=
 =?us-ascii?Q?e27TlxKlXgmGpsTQIB3FFFD+aoloDXmu+heEM7ad9OG6T5mHz4t4496oYM28?=
 =?us-ascii?Q?YRjK3GRrydpBmu+J4xQ1gK2bKnDGo/O9V3du/ybPu8aijBJcmBmNT0LMjkZl?=
 =?us-ascii?Q?LVQHC98C3HfsbR3OjosjSnwo3izHautAxxuHbrc/KX1T5fqlDEL4A3/OdLTD?=
 =?us-ascii?Q?Bv11zbU7+LFCN0rG+Q8iTZ1CjaRW9s7Ne9dEI+jSJFyn2Le3JOXFKhM7Ot05?=
 =?us-ascii?Q?IASbw+HLIHFwT7Vg+e1WbNRxQgE2nMDrsQMW6O7W5f8QcYr2oZEJkU+vXbjL?=
 =?us-ascii?Q?/9SdakBsBhb4L7lw8KzGKHP6pC1dL96KPomJq/5vSCUtcmprcy3qArSnU+E5?=
 =?us-ascii?Q?irMANul5cqsFi7kNvCW06O3Y/qOHNUEVr1Hw0a3SgQK9nH2boJM37LOI8O79?=
 =?us-ascii?Q?WSz+G9RjzkUAFbjj8IhkiiatEAcPYaylmvXZwdmKSuKlgHecLKUnoEe5pCac?=
 =?us-ascii?Q?801wf872eXJQiHUIb941xwyMmxzW9gCd+ahV7vSIbixcsgo3dRDYi6bWCpGN?=
 =?us-ascii?Q?3zKygg8rYDphBkWhJHwXAU43aAOvK+nyxMBySTBqA+EAjO7nvQOzehIHbKkq?=
 =?us-ascii?Q?8N/g8D/VxDzEZBbxKxhMo+1z3F2zg3HAnIvD98im5AMpXtRhZ0pH+Efcl59+?=
 =?us-ascii?Q?QCodJqbkRp3eXjhihPEEjXQAzPhIePXhf6I38y2Raxb5fr194AbW1pUt6ZgX?=
 =?us-ascii?Q?7YR9eNNKX2CWnruGUnmqgsSiwuMJ9gHz7jXTu5lQfmXWaDB3aU+MCjPZCxyO?=
 =?us-ascii?Q?6MOlGc3wZmn1mFXbDXH1K+1PxjiU9j1C/Xg3NUZh9Vvjr4uI11Ig2jwPTTfY?=
 =?us-ascii?Q?Bi8i+W1ilLhjECWPv7AMvsNGliZT3saWdnqWX55h+eGSCsMk17nKvcpYj5G7?=
 =?us-ascii?Q?7ysS7PwvkzljKKIViu6KC8rMwVA2TPJGwj8S3PWqZe9fxpyGn2/dmFOSfQih?=
 =?us-ascii?Q?LjkC6DpP77HgjurNQaK0mD7T2IV5oYXdQWLj3iIWCKdPG2Q4U/z4uB3LJ3RY?=
 =?us-ascii?Q?5/qjvUF0GO1np2rROzuXBzgwzFtoDlqUyrBRjHFyMXru1XDUQyIePXlNO4GG?=
 =?us-ascii?Q?cj5oga7oAg=3D=3D?=
X-Exchange-RoutingPolicyChecked: U4FxtZrrXacwuEnb/C3fLHOoVqNKA8b6XJtW/lftNvogimz2v54taI6fSxgAhzFskbBeHjueAieea6zCBzRX/jXiVNizJqJX1gECdF8lpIz3j8EQG8qT1j2hVrX4IoGFy2NgL7aG7/GnuIrZlIcaXqYaDXL2OA49FQ3d8wBklwdGxI6usCaVB+ChnfufguCp90B+eQMssw532rkO0VnjlWN3v55RTgumUjWb34GuuC3ZZ+tsMAIZ4WAO7EbHhSHEIog6wWm8Huh7gVC5pq22N24IFfDde4frgCdCCc38Kj2cwsaT+rGAOoIbStrIH2zIElux8YmLLrBJ7ac+hYTTBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 24cc1702-0e49-409b-6af0-08dedd86a134
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 06:52:23.4302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9k0hOyNTlyTKQRFgflGaMSHvZ9XwdcQKTJr9dlQ/QN6X/ShjBUAdP8nTVBGPBdixV300H8Z4RlHE0ISOnltG9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8470
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67106-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:oe-kbuild-all@lists.linux.dev,m:linux-media@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:conor.dooley@microchip.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:from_mime,intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtv.org:url,01.org:url];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7857572D5E4

tree:   https://git.linuxtv.org/media-ci/media-pending.git next
head:   bf40cc53b1e00c312046f6dd88e9054bc91865af
commit: 447ea0c26e57c1b423426e6c46d7ff89fd66eb6b [15/16] dt-bindings: media: i2c: Add Sony IMX678
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260709/202607090421.gqivJwOm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607090421.gqivJwOm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


