Return-Path: <linux-media+bounces-31810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 091B9AAB9EC
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 09:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FF167B9304
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 07:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCC422DFA2;
	Tue,  6 May 2025 04:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iS4XINEN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDFB2BF97D;
	Tue,  6 May 2025 04:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746504837; cv=fail; b=L4KLSKplGqTnvLhsjOYXcaIlIitui91CMYnmTuDBu1i6dkC8FbJ97jSBU1N22bwDxlgN0C/1f8lHvrloG2Jt0EXQGCKzY8984Ck1RbS5/XLlVjUhC/V/tnFba0faYjd1zcLr/j5+bZZ6sAtXUGx5HeMH7sZ2k/QGMwqX3L+4YrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746504837; c=relaxed/simple;
	bh=eJcUHHaHjWCCL6LBz0oirxq4qmZTuD7LLFZCXf4Wkro=;
	h=From:Date:Subject:Message-ID:To:CC:MIME-Version:Content-Type; b=IbmUIBsbBYUEg08B5F1sBT8CN1E9TDzg4tBFk+TuBroWCSGNm0HyKwSx681HWVVBGeDbL4Fd6qHEGQp/z9KaG6aRWAk6STkdXqfmf9bpORzBq9JfR2XUEvVKFPL5CfWCNYix8r7O4wyV0MhnEqMkwcSTdhd7h89jfFJC+5Wb9io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iS4XINEN; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746504836; x=1778040836;
  h=from:date:subject:message-id:to:cc:mime-version;
  bh=eJcUHHaHjWCCL6LBz0oirxq4qmZTuD7LLFZCXf4Wkro=;
  b=iS4XINEN0KxqEwhpMfe7Src4gnEC+4M4KJMasm+3ZJeutSuADHwLJTBK
   VzYPMaJKpWzApytjfJF7+MDlGIL7lC9ltWG7lPntdkrfcPuMzUDgf+h/F
   xz/Ew6+xvMC1EJz/UBVUrCK1q3tI/Fij3NLLHcTE+hXOsMhday77qrXlM
   pAKZyhQ55uzFj3RVM3mTVgXHer1B0Al5XIsXiP1myNnCPb+8CoC2BuYMr
   S1BTQ5esdINBGBYztlfNRQ0uD//m/WzsROBqEkfqYdjjaqLSL7wCQJXq0
   26M0Yua6lhzfCSuGmKIu4I69BPqWIstYi+y9KriHI3QMLK1nNJfEgG9JS
   Q==;
X-CSE-ConnectionGUID: XSa3m7nVSPK2LcuVyycWnQ==
X-CSE-MsgGUID: MfaHs6pOQb6DXoZSzVyiEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="59502869"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="59502869"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 21:13:54 -0700
X-CSE-ConnectionGUID: eN86ExlgRkOptcIQ+tr5Aw==
X-CSE-MsgGUID: 7Nkx3qTCSmCmSses6qwiSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="135997159"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 21:13:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 21:13:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 21:13:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 21:13:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PCTjCtc3+b4HJ2l+qjSWBV2MfmCQMyYX/TWgiX0VJzwf2aDRsfLzXickxNjuJEstEh67HS5kMINRHYIgQyvXaivZ0xYM7qFEwBE15KdQ9KzgHHZQsQkGZidBKmekU5xWO4cUjFHENKAJIRQ567dgJvGRODbNyiawD+9QbgnY02gZDQAXZWnWjEn7qEQjVLq8qMmzDhrk/Fow3WsU4DqIr82tYX3vFwzNYreIw/IscmOcLqDdLUFTfUDkZAc0qVSca1UVzfQUAYQcTBdo8PblUwQViJK5iGTsvQun05/RNvl4EtQl0o/Rn3oOO0HaqQyEIP2HSvWrcHaM4SbYJvpmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJcUHHaHjWCCL6LBz0oirxq4qmZTuD7LLFZCXf4Wkro=;
 b=b2UhGvbvyv84oIOJKXgGly8GK/m7E9MqOH+FEd+NX98H0Ff/2CjWHCxtKOQCDrpp0QqKVN6YvmOIhsocVeNsDHNreu0S7JGOkCNUviAlrIK8+ZWevw7NHgRx9zb3CGEwgp0HYksGgGwVVwjHOhBFhtUoSrlUqzR4DY1pn0/QiRXdBCUOLu3iz7o/Pq7T7DkhyikTaqZ7UUPKGyjLZCU9dQc6fxV3GL3LQeqtWlqgirDy05LZI75S5N2nnRWOIHx67PwMqysExrSI0uZu8JY0DkhbCf0DsPS0kV+qZTfF8ceVi9Ifd9TCfaolPxuIeNpiwcsTlcmjKBHptcXUg/F8mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from substrate-int.office.com (2603:10b6:a03:539::19) by
 SJ2PR11MB8401.namprd11.prod.outlook.com with HTTP via
 DS7P220CA0039.NAMP220.PROD.OUTLOOK.COM; Tue, 6 May 2025 04:13:04 +0000
From: "Yan, Dongcheng" <dongcheng.yan@intel.com>
Date: Tue, 6 May 2025 04:13:01 +0000
Subject: Recall: Re: [PATCH v3 1/2] platform/x86: int3472: add hpd pin support
Message-ID: <LGGMF9F53QU4.FAW81U31YUFP@mn0pr11mb6085>
To: <sakari.ailus@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<hverkuil@xs4all.nl>, <andriy.shevchenko@linux.intel.com>,
	<hdegoede@redhat.com>, <u.kleine-koenig@baylibre.com>,
	<ricardo.ribalda@gmail.com>, <bingbu.cao@linux.intel.com>,
	<stable@vger.kernel.org>, <dongcheng.yan@linux.intel.com>,
	<hao.yao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-MS-PublicTrafficType: Email
client-request-id: e1301f60-0d65-705f-d22e-e749aced98fa
request-id: e1301f60-0d65-705f-d22e-e749aced98fa
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8401:EE_MessageRecallEmail
X-MS-Exchange-RecallReportGenerated: true
X-MS-Exchange-RecallReportCfmGenerated: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cS9nV053T2N6VEh1c2x4M214Zk9BR29Rb2Rrcklia01ueS9sUXZDMk03dUxF?=
 =?utf-8?B?RTE3UEdGb3NkM3FsQnBSVjFvaU1meXVuVjNqc2NXUHpMeEZUQTJxZ0tYZkdp?=
 =?utf-8?B?SXJlaEd1S3k1c0VoVGxNVVR0KzN1VzVJeGhnOTErcjQ5WHFQRER3TUNXa3JZ?=
 =?utf-8?B?L2ZyWG13TzdmOEpYR1FKbE5XZkkwT2tUa0RDK3lzRXJRcTE3d0taRy9XWE1K?=
 =?utf-8?B?c2VhN2J6NndpSWU2bFoyWUEzZTArSXBVNkZWRU9SRjlaR2xTZXZidFVqM2hU?=
 =?utf-8?B?V2tIVlhvTGRpNVZ5U0xHMW9LMzFCeFhZbmRiVXAzdkM1VTVTb2RGaTFwMzFV?=
 =?utf-8?B?TnpyWU43bGRUc2drMUZDMUM2eGJPTUxsUnZHMHRwOGlkVTRiSTRVc1ZWU2Jy?=
 =?utf-8?B?MzlXOFJkVFVEUmY5U29QVTNCN3FEMXBwOE5sRXVMZVNLZWVlYzJuTi9SSldt?=
 =?utf-8?B?TTdLQ3VTeFRIVGk5aFNtWTlNWWlDOXhiVXd5bmpOZHlhMlBhUHVFSnVVTnNF?=
 =?utf-8?B?disyUFNLWFRSWThZb3cwcHBLSFRvUWc4VnRaNzlvclQwa1N5MFMrdDFLcUt5?=
 =?utf-8?B?VlB2TU5xa2UzeTRGT0RLcHU4NHN5bnhpNGpURlExVUp3UUxOU2pXWE1TNVZ2?=
 =?utf-8?B?R1loV1kyV2tUbkJsU0NOL3FWTVVNRXFXK01xU0tXOHJURGwyRjNGUkdEYlM2?=
 =?utf-8?B?cE5VZW5NNWh4Mm5SeFJJS2JzakI4czlIa1lRUVEyOHFuQTdHV2NXcG9MdDEz?=
 =?utf-8?B?d1d6UE9HR2hEOVI3ZkpoSllqanFFYS9Db1pCUEp3MHRGUXdtbitSWC92aXJJ?=
 =?utf-8?B?RmFWbmdvWlVabTk5UU5LbmVkbXJtdFE3cmVDL0tVdndZOU1jZHVZK1JFaFZ6?=
 =?utf-8?B?VkxnNXNQek5BdHBXOXRNMEh1OWlheUoxdlkydVJHZG1LM09Wc2lINU05bFF3?=
 =?utf-8?B?RHVkN28wQ25zOWZPL3BkNG9QTnl3OHZFWEZnaXQxNDJmT0FXTmV4QjliZHY5?=
 =?utf-8?B?TUZQeEdRd3FQQ1BJNGFFRnJHdnlteks4d0NMVmF6Tkk5dkdkK2ZtQmk3Y3N5?=
 =?utf-8?B?dGJGaTFDMFZXWUFodktRSnk3UEZmbHlaTkFFU05wMG1aMmhHNTJwLytJYUVu?=
 =?utf-8?B?cHU1V1AreU1pTTFXTGFuNEtZcTQwbTlleGJweURMdUNZYk9vc1RPcnBxa2xV?=
 =?utf-8?B?UjR0WElXSmN3ZTlSRWZGaHNhV3dkWnlRZWFrYUl5RHppS0MzNm9NOG14S2tE?=
 =?utf-8?B?K2xZd0dSMFpZcWNEa1h3eFM3UUtMQnYvUmlmMlkyTjBzcTJIUWpIRWZZeCta?=
 =?utf-8?B?a0JKNEJNd25sUW5NRlo1WC9LTTZKVDdHYUplV0dPNXhMYnVVWjV0YVBNeXN6?=
 =?utf-8?B?RHd4aUhmdnpCajZHMmR0MEFhMkp0SFllNnVLUUNhQW9LNEd1THN2WlRGVk01?=
 =?utf-8?B?VVJDdmY4RjRwSHdHdEFsSFZoU2xjc0VJcmpzZUwvSWdaRVJWUU5pT1NGRk0y?=
 =?utf-8?B?b25oTFFUK2FRcThoalFvV21SRkVLOFN2Z2p0cTBvcGtZdTVNMFhEY2NUT1NZ?=
 =?utf-8?B?M1RCT2t2aTRmY2xxWFZkUDFtdzhaUXVLQWVzMzA5OEp3d1RvWkJ1QWFKR2tM?=
 =?utf-8?B?QmZKbnl2SUk4UHd4NkJZSzM4SFllak5GeHZIS3VLNTVRWlJHeU5lUmlMclFC?=
 =?utf-8?B?RVhpZ0xoeHNTZ2VSL0FJVEhOZ2xKaHZmSlY4UThzUnBmZG5HMlpLQ0FiZko0?=
 =?utf-8?B?TUk3WmRERTlhSGdFaUpEZWExV3JCWEhPaTRKaGtLMVBhOGc0ZmlGdW9UTTNK?=
 =?utf-8?B?QlhQSVRGVDUwZW90VGo4NENDVnhXMDI2M0lmK3o1Q3Awb09MdFl5d0NGQkh5?=
 =?utf-8?B?VXJsYW5TNHg4L0N6dzZPcFFkNWZJVUFaMXNtZEhEU05vNDk4VUdveDVyUjlv?=
 =?utf-8?Q?wv1+NJHLWhw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bI36/skVFBvNwMuCRVj7R8y0Fkv+XqxmBnL4wSURs2+Q6rZ+6FVYB0Y0X/9P+IaXaXc5XeWjpy5+A8nAX8Solb4S/AQNvrYn6WexXnGHVN+vyl7rkMlzVTAiZmSM+rJtr/9QpJZigR7pRMjkXE/wZQK0tCoXdFqxZMpT+SXLJW5rVkRUrxJ1yrGiQR1bZZXEnsREOqIckP7Sj4TeRohvhG1/hNpYYV5Uyy65Mucqn+wHqVlEvvdc9Wz4dZSsuH5+7fcKSMN+a7ENN1Fmv8Xzi0gfmj0XBa7/u43qx6KFGmScSNqa/KkQ0eUgSairjOXdmCkMtPwyz6rStc2mx4bSsBwLuVGUrb5LH1GsX/75upAM/B0V+vrcA4DC20gAOjO4SjifchWOfP9k8N/eePqB8N3CUANOlw1Qw4yu0GhUp/U=
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HttpSubmission-SJ2PR11MB8401
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 04:13:01.7106 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a603ee9-9138-4b20-78b7-08dd8c544c4b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8401
X-OriginatorOrg: intel.com

dongcheng.yan@intel.com would like to recall the message, "Re: [PATCH v3 1/2] platform/x86: int3472: add hpd pin support".

