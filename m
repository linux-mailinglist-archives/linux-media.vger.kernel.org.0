Return-Path: <linux-media+bounces-58690-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLh3Dr+X3WlbgQkAu9opvQ
	(envelope-from <linux-media+bounces-58690-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 03:26:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 944F93F4CA2
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 03:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6784A303CA7C
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 01:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD5F2D061D;
	Tue, 14 Apr 2026 01:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGjWkHjw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22021186A
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 01:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776129944; cv=fail; b=fgR+tDbAxizhPtkztWl90LR0LSiggBiAANN+BN2Le9Hbvk16+dX86ktoibVGY0YBill6G9OEXmdZWcmawVAlT3uITLi6m+qT3HNrLPi03lVkUiS3OBjDA60oLwGzv7dlAEjlGurVaT0ZQ+NJyDbVTqoRDgT2vy0UnO6d7jozYm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776129944; c=relaxed/simple;
	bh=hd//ql81u28Wo4n1Rl9L4HCmPh2rHXTrfUd8BiWAxjo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=B8yOyOIFf2XD7ubKizwye/6nfix7yU1Mhh+hmC8D1zVSM0dv/HYZr8fn/pWAnNMO5Axtli6LsnH8Aqm0DEoA0MEqU0NVsiJ3TLG61Py3JA8gHcKvPgjpLAGhEVSVx/fs3Wt80c8sbd3IeqWdErnFbioa0UbsLHbmvbSLQ5vO7PY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGjWkHjw; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776129942; x=1807665942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hd//ql81u28Wo4n1Rl9L4HCmPh2rHXTrfUd8BiWAxjo=;
  b=KGjWkHjwyQsw8q747MKLaY9P6h3qESwJzhg2/jLIIHmdw+zpojy76Y7+
   dTlVtFTJtbWxz5xgYw/QOm+eOcjiXGCRdGEtTWgcNOKGDyfhKNCv9hsR1
   JEodZbg/8ZTgFEfxzaDpECZXq1+kZDbGj53y+6nMe3a2zE46JaBgNJc+h
   tZYo4sWle4W3adaFJbZ2XekN7wLyzIspAry2ck1kuJqZnyJAto3oHd6Iq
   y9PFCL0tf9aKdbNMslTN5FG74H9tzkMpeALwBWdC6XsuSRjRgdgs1tjN/
   Ab3TRB1Mjp0ZLNzL+eFhVpnluihHwlfp874imrQ71X5VuZG6IOTPirphD
   A==;
X-CSE-ConnectionGUID: MBEsE+lqTFqPsr2XNKsHMQ==
X-CSE-MsgGUID: 51NvC+SIRy698N7nioaPqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76240936"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="76240936"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 18:25:41 -0700
X-CSE-ConnectionGUID: z8Pyo1aJTHOjsRHDJnBYmA==
X-CSE-MsgGUID: bRqcafBkTouvRmIMOXGdJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="227277151"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 18:25:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 18:25:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 18:25:40 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.43)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 18:25:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2dk/lbEZN+c+YRiTYNjw+Hqnzodh3+8p/CRCTnGae8zgP+QPiwCbvkvGwamrSZ1j5mlfC+Fw93AauYv6ivGpKAW/1+vRCvmULsfA9ZfsxDTbpQwfWEgl06t138JeesTUdbNjFVj/yWIBXp6lhgHQFoZb8rdpTveSyKjUhoVpr889UnNNWkHj8UARngn87rd3uDz705vENt/Y9A3Zt0qCWVZYWaWOT6Eq4jApYUF58JT0tgx6T6rhWbPIHpPIUyWIkft/03zW6QKwvD0mAnPtMpVhU504+yr8V1mV+AXEsfAHDeRUs+gmtmOSiObmm49njDjjFHinRMDYLvkgCqlLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJUOPr2QOzrRGU4EDAQDTPDuDKn+9BXIWx8SBwbpNOQ=;
 b=GRAWp/vucO5HBWm3rCI+BmTp/N6kXkWxpoLy/uB3PEZP1lKcbTJXQ5yM/1sR7A2b2udVnKQ/k95hz44UCl3AAcZ4rpUzTlQXVunN/+cTM0iWWOuiCATZGp7lbDIPNqcAxBjbjZm8ZfycBR5mcS0JEhzwo1h1kkct+5ssQljFi9SW9HLn+jNzMEf6jtGko6AxLBWrnUJrgUZm7XmQ0O3ZByH5gCB4+JdVyzOuEI20iD9Ghm3K9jB5t71R3aETTDnTsV6GPFryqR8njFQxu+RF4Aw+r1LXwwOehrMW3zkSHtZX79hatOC60//u1xPN59LywETZmfEULT+hiFPaZC/a1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by SJ2PR11MB7503.namprd11.prod.outlook.com (2603:10b6:a03:4cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 01:25:38 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.044; Tue, 14 Apr 2026
 01:25:38 +0000
Date: Tue, 14 Apr 2026 09:25:30 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-media@vger.kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>
Subject: [linux-next:master 6143/13679] Warning:
 drivers/ps3/ps3-sys-manager.c:43 cannot understand function prototype: '
 struct ps3_sys_manager_header'
Message-ID: <ad2XiiTXBBAErOsw@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|SJ2PR11MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: f6747508-98cb-463a-980e-08de99c4bc0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 7IEAMhe9z5pnuSXfQfxatEBIdL0aA5P6onsao5Bp5UII+1ea99D0wR1Yeszqb0t7mNbsNp+uUg4obKe7105DiJ3XwkypivdjtI2g7FCJSKW49QKz6QTndP6B5m5apo+hM7atfJUGNdN4oAq8kwH5bjErwIILC2hco4e8Wen8NJebOLXXsxZ2BSKuD3Bkwk+8ZiuPJZDDPsEyzqg0zLRcf2l7Cvzbhc3YK37IXZk57/zmoR3u63tBEjbsUZFJ0jkahybxxwPCL2S10TBmStww9k8cMHdQ9dwfRcy6uje8IgA6xv/fA7icKvLIsalPa/PS97P4OmM8LRwtgaggQRa9WtBJHDXUGe5ZEbAhqv3u42suqd/WRsW8WiazMa1L7lrhl/5akgrc32VHIUD5eem72K9Wb8Z30JFaCyq3VCNDrZR9D0oD4Njz7sN9gdBYl7RsBTQAz6D3a02DLdGlBcwVu4rJw6mVqXWUnLyJFp2ciHjAhvRxkindsA4vPe7UPXtV8aPcMZICUWjCAB/8ZXEmuY8RKT958/kqyyoQqFCsAwIN5E6GnnAMJAMng5ppr09c3l/KK4dxWylhNUqcFaZy+rT882BsJUMM2O8ZeuN0jqMy453l5btQkL4bcRkKKB+coAIvQVq/vbZdAh9VAMYWbjuE9oKAVHtS4/Vj8xxvbyUNOQ6BXAGJu8xQYJYL8fU+DnsltIq3PhIC+zdqb9HATg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8fdq10MTno2uPpDPuuP327Wlawzb+uUKo1WXYUbd7woXwCkDT/yURNc2fHR6?=
 =?us-ascii?Q?4J0zQLNbtpzxQRfbHcT+35X6JrjB95h+XQU2QskofBcOP5kE+xktbvPIFKlB?=
 =?us-ascii?Q?YlfsmluUcMLGYWPzmBCNUX/FbpcYgpCquY2vvGOaEZuKyMvHDFjgfwy8antx?=
 =?us-ascii?Q?s14cgUPD+CFL/mxl5GnhwbhuZI2ByV6PHZiGzov44i2Ghwl1BZXPaEjR2jhT?=
 =?us-ascii?Q?cGi4zSz8HOannCgyf2tzW9gEHdLTK3EHXrMyJLB7Kbr3QTXGorSg8LMfaZLJ?=
 =?us-ascii?Q?OYZWrUyVexHnwgO3Kw9r/9VNvyr7ca3PiC3atYNTxAdK7dqh1UXV20rA4Qt2?=
 =?us-ascii?Q?tOXO5rqBforIu8pNWVx/+OpW3OAHaXjLdwytw0SRCQdxRy3xNpyYGEQms6Hj?=
 =?us-ascii?Q?f5DmvKjrlBvJr9mEG3At2pKhT64lt5Kp9UY5EPVnDgIRfU3L6KcYYBEB2oLf?=
 =?us-ascii?Q?spSN+QAHI4+ubW1jErLrDDylO5qq0cDNC128M8mYdhkxxvLaoxchzyKrsKjl?=
 =?us-ascii?Q?vw/gwbKupPhH6bz0+w82aVBbchkX/1Zom1pRbCyLoG3AqeH6HFwwdtaHOkRJ?=
 =?us-ascii?Q?gov2X9j4uha00TBnqDZUKhlZuuyWPEtacGKn8+a7V1VCDu5gAqvg/xsot9Px?=
 =?us-ascii?Q?E8nk9rj72q2I9WR5y2xFzvqnkbBvVmmYjjDioQCtgNkrKSWWvyFwvFrXTKi/?=
 =?us-ascii?Q?J1zXEDJLWFDzmsSxhN2R7Ci4Qulg8jLVW1Gyql1wr3HkwQnH4XD367GeSpKI?=
 =?us-ascii?Q?kGZpPXzKYflZwxZWtjdkLb+NDa7ZmvLZnt/OxJfnySQ/WtLqzyvzZ+mAL0vN?=
 =?us-ascii?Q?vd6M30xyDAzmv1F7aJPVi8OauiulYJdSGKJ5f8bQx95ur1wNynVvyQ7mHfBG?=
 =?us-ascii?Q?cqei1fqR1uqwk8xGzxHz3mQAZZrX2/r4K1jey0fW8EFBKnBJ8DUNwEhXJC68?=
 =?us-ascii?Q?ae+0weS26VPVmenuM8C7J6AI1nYvCNH9H+MK6hJOj0yMh+GstMknJY309rDR?=
 =?us-ascii?Q?FDbf9cjCj/56tEcvz1dMEf+et1AW/NcYSaamKM/BsgrgY/1GVvLepYeL4W8x?=
 =?us-ascii?Q?7wJm3f5nh/xvBTNXBHLyP/aTU5o0HgoKL53qwGdytdzZrdzA0gYuraf+WN6w?=
 =?us-ascii?Q?AeA4TPdPQZRv/RLW4O2YlogFCGhAP+aVnzIq4ieoBZjhOM8EsEPsf9X/1oKf?=
 =?us-ascii?Q?+aWE4omJDHOeaTW5RlN/SSxZHvRiKiDutzTJPS+TrargrFo2FvcysrbXSoM3?=
 =?us-ascii?Q?KCUibB3oVgDapOtoRxvmurWYvGjIOD0G3WehJu2Q3uJWmyXngNzIStSH9AuH?=
 =?us-ascii?Q?yQ9bLWYy8IgWfYPGb4lHGUbgSTVCwVMbrFHXmZ2eK2ZdoAUeK5heh98aZrwo?=
 =?us-ascii?Q?oJ9lN12z0PCrEh3I7aimHFpF0oewu/FFOnf24m/+xe8Bt63kcaxc14cVi4l1?=
 =?us-ascii?Q?TB2RBKnxya2AnXU3iV8aQp3fL30Bm6zF6j8ZciKWhJ8tTWVgNxmanG07CIn1?=
 =?us-ascii?Q?q07bP2oOQR7QLXRX/c7O3LNFh8sWVyfxLS4w61O6r/fMycJp5LEM1lA/vYp+?=
 =?us-ascii?Q?jl8HujLwaw/DCvyYvwfHb4gqlhNwOskOoA4kwYyUA3XGFnpeAxamiS7eTQOs?=
 =?us-ascii?Q?F3HyWNPbn2xRRU8e8D86g9/jagRasZW21udy3CMKOViOMeEULwr8Xxwd4e2l?=
 =?us-ascii?Q?B9jb7G2XT2EhVcnwGnKtDDXRa+a3PeV7EA0yGiDjkrFzz1MMsrzbTp6kfVPf?=
 =?us-ascii?Q?gCJZgYP7dg=3D=3D?=
X-Exchange-RoutingPolicyChecked: TsJ3VmXsWv4lwrPzFQ8bmOf3ob5+dWulyZEq69VVugEPvwgJnyxUCCQy7sxNq+WrOAyJZTxfWqZQh9oG0T+195UqoWAju6PBsYUi4AfAV3vYujgb5+OQl98rdV+HGIbSPqCR60wqAJxdvlzo223Mo8N6cD/kXsbFNvMSrLNu6nlYGtRFS4MulnZhLCKhmIEfe9bvWc5isZEMZwrmKJLFlTYnUH1zrEj4nB29JLYEH5IaSKIcE5u0YkgvkqIH5D4NJHhtjRskTKl0ClUO6jZRzEo+2uBi8KfW0FYn1UC9Jw9QAi8WQR4XpmeUzENVfv+sy8fCtzSgoueX4i5Lq7eTtg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f6747508-98cb-463a-980e-08de99c4bc0f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 01:25:38.5269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PwcNojAusr7pm8tN8JmnkO5IGARyaim5CMOKorWlvMN973qW3B0uOtzoVwUZcR7wW4RIjtWGAPYw/MpRuYx79g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7503
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58690-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 944F93F4CA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1c7cc4904160c6fc6377564140062d68a3dc93a0
commit: 79d881beb721d27f679f0dc1cba2d5fe2d7f6d8d [6143/13679] docs: kdoc_parser: avoid tokenizing structs everytime
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260414/202604140545.GxgkrpT6-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604140545.GxgkrpT6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604140545.GxgkrpT6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/ps3/ps3-sys-manager.c:35 Incorrect use of kernel-doc format:  * struct ps3_sys_manager_header - System manager message header.
>> Warning: drivers/ps3/ps3-sys-manager.c:43 cannot understand function prototype: '  struct ps3_sys_manager_header'
   Warning: drivers/ps3/ps3-sys-manager.c:66 Cannot find identifier on line:
    * @PS3_SM_RX_MSG_LEN_MIN - Shortest received message length.
   Warning: drivers/ps3/ps3-sys-manager.c:67 Cannot find identifier on line:
    * @PS3_SM_RX_MSG_LEN_MAX - Longest received message length.
   Warning: drivers/ps3/ps3-sys-manager.c:68 Cannot find identifier on line:
    *
   Warning: drivers/ps3/ps3-sys-manager.c:69 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Currently all messages received from the system manager are either
   Warning: drivers/ps3/ps3-sys-manager.c:171 Enum value 'PS3_SM_NEXT_OP_SYS_SHUTDOWN' not described in enum 'ps3_sys_manager_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:171 Enum value 'PS3_SM_NEXT_OP_SYS_REBOOT' not described in enum 'ps3_sys_manager_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:171 Enum value 'PS3_SM_NEXT_OP_LPAR_REBOOT' not described in enum 'ps3_sys_manager_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:198 cannot understand function prototype: 'u32 user_wake_sources = PS3_SM_WAKE_DEFAULT;'
   Warning: drivers/ps3/ps3-sys-manager.c:212 Enum value 'PS3_SM_CMD_SHUTDOWN' not described in enum 'ps3_sys_manager_cmd'
   Warning: drivers/ps3/ps3-sys-manager.c:222 cannot understand function prototype: 'unsigned int ps3_sm_force_power_off;'
   Warning: drivers/ps3/ps3-sys-manager.c:231 function parameter 'dev' not described in 'ps3_sys_manager_write'
   Warning: drivers/ps3/ps3-sys-manager.c:231 function parameter 'header' not described in 'ps3_sys_manager_write'
   Warning: drivers/ps3/ps3-sys-manager.c:231 function parameter 'payload' not described in 'ps3_sys_manager_write'
   Warning: drivers/ps3/ps3-sys-manager.c:255 function parameter 'dev' not described in 'ps3_sys_manager_send_attr'
   Warning: drivers/ps3/ps3-sys-manager.c:255 function parameter 'attr' not described in 'ps3_sys_manager_send_attr'
   Warning: drivers/ps3/ps3-sys-manager.c:289 function parameter 'dev' not described in 'ps3_sys_manager_send_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:289 function parameter 'op' not described in 'ps3_sys_manager_send_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:289 function parameter 'wake_source' not described in 'ps3_sys_manager_send_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:333 function parameter 'dev' not described in 'ps3_sys_manager_send_request_shutdown'
   Warning: drivers/ps3/ps3-sys-manager.c:370 function parameter 'dev' not described in 'ps3_sys_manager_send_response'
   Warning: drivers/ps3/ps3-sys-manager.c:403 function parameter 'dev' not described in 'ps3_sys_manager_handle_event'
   Warning: drivers/ps3/ps3-sys-manager.c:485 function parameter 'dev' not described in 'ps3_sys_manager_handle_cmd'
   Warning: drivers/ps3/ps3-sys-manager.c:526 function parameter 'dev' not described in 'ps3_sys_manager_handle_msg'
   Warning: drivers/ps3/ps3-sys-manager.c:607 function parameter 'dev' not described in 'ps3_sys_manager_final_power_off'
   Warning: drivers/ps3/ps3-sys-manager.c:631 function parameter 'dev' not described in 'ps3_sys_manager_final_restart'
   Warning: drivers/ps3/ps3-sys-manager.c:670 function parameter 'state' not described in 'ps3_sys_manager_set_wol'
   Warning: drivers/ps3/ps3-sys-manager.c:692 function parameter 'dev' not described in 'ps3_sys_manager_work'
   Warning: drivers/ps3/ps3-sys-manager.c:171 Enum value 'PS3_SM_NEXT_OP_SYS_SHUTDOWN' not described in enum 'ps3_sys_manager_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:171 Enum value 'PS3_SM_NEXT_OP_SYS_REBOOT' not described in enum 'ps3_sys_manager_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:171 Enum value 'PS3_SM_NEXT_OP_LPAR_REBOOT' not described in enum 'ps3_sys_manager_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:212 Enum value 'PS3_SM_CMD_SHUTDOWN' not described in enum 'ps3_sys_manager_cmd'
   Warning: drivers/ps3/ps3-sys-manager.c:231 function parameter 'dev' not described in 'ps3_sys_manager_write'
   Warning: drivers/ps3/ps3-sys-manager.c:231 function parameter 'header' not described in 'ps3_sys_manager_write'
   Warning: drivers/ps3/ps3-sys-manager.c:231 function parameter 'payload' not described in 'ps3_sys_manager_write'
   Warning: drivers/ps3/ps3-sys-manager.c:255 function parameter 'dev' not described in 'ps3_sys_manager_send_attr'
   Warning: drivers/ps3/ps3-sys-manager.c:255 function parameter 'attr' not described in 'ps3_sys_manager_send_attr'
   Warning: drivers/ps3/ps3-sys-manager.c:289 function parameter 'dev' not described in 'ps3_sys_manager_send_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:289 function parameter 'op' not described in 'ps3_sys_manager_send_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:289 function parameter 'wake_source' not described in 'ps3_sys_manager_send_next_op'
   Warning: drivers/ps3/ps3-sys-manager.c:333 function parameter 'dev' not described in 'ps3_sys_manager_send_request_shutdown'
   Warning: drivers/ps3/ps3-sys-manager.c:370 function parameter 'dev' not described in 'ps3_sys_manager_send_response'
   Warning: drivers/ps3/ps3-sys-manager.c:403 function parameter 'dev' not described in 'ps3_sys_manager_handle_event'
   Warning: drivers/ps3/ps3-sys-manager.c:485 function parameter 'dev' not described in 'ps3_sys_manager_handle_cmd'
   Warning: drivers/ps3/ps3-sys-manager.c:526 function parameter 'dev' not described in 'ps3_sys_manager_handle_msg'
   Warning: drivers/ps3/ps3-sys-manager.c:607 function parameter 'dev' not described in 'ps3_sys_manager_final_power_off'
   Warning: drivers/ps3/ps3-sys-manager.c:631 function parameter 'dev' not described in 'ps3_sys_manager_final_restart'
   Warning: drivers/ps3/ps3-sys-manager.c:670 function parameter 'state' not described in 'ps3_sys_manager_set_wol'
   Warning: drivers/ps3/ps3-sys-manager.c:692 function parameter 'dev' not described in 'ps3_sys_manager_work'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


