Return-Path: <linux-media+bounces-42970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11899B940ED
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 05:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5E59446837
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 03:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAD6239E9D;
	Tue, 23 Sep 2025 03:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIADS64s"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B1921D3F3;
	Tue, 23 Sep 2025 03:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758596804; cv=fail; b=fn2e/gq/267IqO6KOW0YnI9h0iwKtsHlVyEg4Ulne78RFf7wVqurx+4fTuNLb5xgsaaxSSDtefj032O1uMRvHhxGZuhXBjBY2EHzwuRU9vQDDG7YyYQD0xVH7/Fz15/VYR/e2RgxtT/T+JLm561qqqR2aZcxFW5onMB1YQz8Qak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758596804; c=relaxed/simple;
	bh=F8ZEjLhBBLqHjKVtUumrvj9K7epv5KXZdvTWWjQZy6g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WMjCevYa7O7/Yj/ghZl+gLRZl8S59gZlHPgS068vCp+aulzQ+aygjOrCR3WTpobRzz01p+tx6FAYFQ5Tpxv6vpaLTNXBhIVI5Ia8EoQEzEzCp7eETF9Z02812ta/IsJtuXhl8ECJmFkdI3sY9OZq3DAyl+z09iR9HUeqZHNRiIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIADS64s; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758596802; x=1790132802;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=F8ZEjLhBBLqHjKVtUumrvj9K7epv5KXZdvTWWjQZy6g=;
  b=eIADS64sqg3V3YBQH5UPOHsESEzMG79uHaoorbGyRkmvDvkNKk2wF0/P
   ug79njHwl4zr9jOMitE2M3EyZfiuWD9+kxyoVxSWrR20bTLafWA2YYdE2
   ZceuQWWMc2mg4z8fnXSrP7iaXrhGEX5ruelLeTJdBpw6d30BM9f1M4aW8
   M+iIJ6k6CmNKvKkHYK50Xr6IV6e5DDAHScweoFi0uxcsTWko4+fPK5CeQ
   sfKsXNw9cEVFv/h5+rP9bF/KELjm03Hph/E++RWy4yEwegFrMq5G+JK3C
   PfWfU8IoRQFwZ6SIVZzH1g+MaGzABhpnlN2ZHASUCwn2dRei/m8M6Ui7B
   g==;
X-CSE-ConnectionGUID: Yqb920TfQKeSEJD9F0YfNg==
X-CSE-MsgGUID: 9I4kXl9jTNCzDS0Fgi88Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="83471893"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="83471893"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 20:06:42 -0700
X-CSE-ConnectionGUID: c3OLUkxZQfmBhrNo8GJBCA==
X-CSE-MsgGUID: Hbbsd0bYT96mpar8F6KcYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="175775406"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 20:06:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 20:06:41 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 20:06:41 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 20:06:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcY2Ie8wHzjyUwbCNCMP7akgLMToSgkYgzdoT5TxBVCvPV3x6/Ai/iDloARPZii43U9JKq0GVBZQhB1qH/0IeFzUfNWsa8PvsO22R4VKntN4LOXAhrrkeYYCm5bga+OhRickcoGbtqgP4ndBhiwZHvB/7c0QA9c7nzZWW+pHZd6q8624LKwu/Db5dVJ1Zkr+qzHClrJyPAnP3/CozQWnOXH55ZlEeIdnNMQfnHHRr6VIGRvmyFmeYmOFTdt1HHI+lVKbIkbq5j/MReJMUPM5CL8ukxLBxq/quXDiDZ3xDt+GtZPByaX/BLwPgFxWmhJ5elkPs1BM2IyTccykZ8p1NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiA1C46iR/mC46doMT+FgNK7pC2xOs2y1V/LCBeSwus=;
 b=KqiZWZlRz3BWNk2D96zOsEORi91lfBNrtexmSOm1E62v+JZFmexHqahngV/NtYSXtWzH0YLt6x40En3WgeJNk3qslZLwngkzmHzhKpwLtvbO8Alazw4WclRjOBVL47DJHwPHm2bGkfRJxJ/9sRrn4NGYQPINXagx2M3fn/73gI8XpFxcOWG/E5/eFmn86WXKDFvsYROoilzCD91m61fr7tERMG81gBKug6lF4B+/5zbgatb1wK+dsxDlW7aZi9UaTqWQoaFqCQlOGuRZ+03opHMEqoxKMR7tExhbLAWJDKfhKPGO90LpyLIwuZBkF5HqglFKapaNyvF9R7XDcPleXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SN7PR11MB6799.namprd11.prod.outlook.com (2603:10b6:806:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Tue, 23 Sep
 2025 03:06:39 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 03:06:39 +0000
From: "Cao, Bingbu" <bingbu.cao@intel.com>
To: Ma Ke <make24@iscas.ac.cn>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, "Zhang, Lixu" <lixu.zhang@intel.com>,
	"stanislaw.gruszka@linux.intel.com" <stanislaw.gruszka@linux.intel.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: RE: [PATCH v3] media: pci: intel: ivsc: fix error handling in mei_ace
 driver
Thread-Topic: [PATCH v3] media: pci: intel: ivsc: fix error handling in
 mei_ace driver
Thread-Index: AQHcLC8yp0z9guozCUCyYRSw310otrSgFVOA
Date: Tue, 23 Sep 2025 03:06:39 +0000
Message-ID: <DM8PR11MB56530EE7AB645AA3779AD69B991DA@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20250923020944.33565-1-make24@iscas.ac.cn>
In-Reply-To: <20250923020944.33565-1-make24@iscas.ac.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|SN7PR11MB6799:EE_
x-ms-office365-filtering-correlation-id: 596f7f76-c6fa-4131-79c3-08ddfa4e370b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?EwfESm/7meXjJ5VA0t3w39KEoLkSTULv6CA3lHfY9UfPL92O9ddeFfk3WG19?=
 =?us-ascii?Q?8gpv75LnG7Tt+TujifUb/9n4mMmKNbR8I6gVjs16urVpKrwh3jbNOoDaXZFl?=
 =?us-ascii?Q?fmlvRRWvF465tJPaGOdCPXtR59tyWvhDfhiTUM+QDisfnkHTwniiFqb+1ZOM?=
 =?us-ascii?Q?llEbSguBsEkWb0vJbn1d+B/Wic3rdqv9cpsjJyv71mIFBmDehSErQPosVQ0d?=
 =?us-ascii?Q?7C78ynfoFHDq5BO2y8/w4GG8OGgkByUf2sSt8kc7PoEXIBERUowRjcnOLyjU?=
 =?us-ascii?Q?ZTAIy8MZhdfqLJTHprSwKd3odtk9PzrO66PMd3N/xQJ110JPllqVdU8IXlXX?=
 =?us-ascii?Q?dNij/MJawz+Qsj15shR9dDfUQO+woCwRxHsATRfWDO/nnuqzOvAjWw75xl8n?=
 =?us-ascii?Q?dkdcEXlVIq6Htd4n3Sv8zyKCs1NY/eD9zEer4kuYvdBFZECPWo3VY0Ybqg6A?=
 =?us-ascii?Q?F66R/nBb23YRCTeGE5Bb4rNbM8j1BvF6IfkC4KxAZBlyo6zewjp2gGBDL5Wc?=
 =?us-ascii?Q?VS3cCx2ujLZtYVz7qMmoa3oesIcUg2wKD0cgTJyfTAA5zr4DeFoBtmclBStr?=
 =?us-ascii?Q?LxXRg/XrPr/hoQHLyC+qYcGLjG7s1Q+ZZK1mYEPcm2bFQo8eSG5MfEkIMvIu?=
 =?us-ascii?Q?rVv8g1zaa4LFRx5VFc5X7SasDtCPx9JaL7jBNzu3RN5pBghQcVnpfrLNqfA1?=
 =?us-ascii?Q?QXFVN539YETjf4JO9T+y/G9xF/rKeqX93zJ+vg3Oxak8bh4QEPWfDye92S3m?=
 =?us-ascii?Q?d9HgJBeAsZWLh5t4l/wffsUqpBqOFFo0DzFYNqi8L3o466wWaLHPLvLjMWuQ?=
 =?us-ascii?Q?L34MiHyXqCsa4S2xYRebDwcE36WjCxOHOwllFiL+jM9zJxV1b0b1AgE7l3Sj?=
 =?us-ascii?Q?gTwAmO4ewTEGRld0Nwrt/akicXVNpST8YejKdtACOYD+inlnQcWZrItHQZ0j?=
 =?us-ascii?Q?HSKxmaDvi16NRLMhV0fPDHolCgO7ipErgkiwWYkS3Gdgi3nGtpNI3bX8WUVn?=
 =?us-ascii?Q?P9AOZlhiKsGAcWvXROiNDGvBosObAoI3RbRBbZ53hiMZw9Jt5XIY8RjYQhvN?=
 =?us-ascii?Q?IfefT144sINZyEXhlwjNtC/OUksuChMyW1lj2TCBRnqE120IFI/oum/TlcGZ?=
 =?us-ascii?Q?eYjd7+Xfff+lSTvqZ7X5TsVRM0VXxFXCpUZfQ9Ey88prkP1iNzoVWO7LDMrv?=
 =?us-ascii?Q?us0zS2VC8oGoFh+T9hppg1G3hkbZK99xUdP+NAajFO/xyJievfV6w4Yc3vA7?=
 =?us-ascii?Q?m1fBEUZ5Zbgz9LyNyOIamLEudmipR+WQoIwKYxFNGRIyRwVvUbsn9VhZeOB0?=
 =?us-ascii?Q?MB9qFWffUy7PMe0PsZMNZup0vO1K6qSulUEQv78zYsORIQfSQ2bZrt2tag9Z?=
 =?us-ascii?Q?CIUQWW/sZX+ej32er87nP76lXDjU1HawdF6XrUcaFhafCbtqGll+L9T58rk3?=
 =?us-ascii?Q?lgMEdVr2Lj+vYmzAzqBc0eB89RN1uk+dKISzpYAKBZxNQ6Kr8irzi3eogZrV?=
 =?us-ascii?Q?01htlFlVNLXjosU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RE/NMSBbFA04RsUj1cjhNsAL8lcZE3tsnEJz365rWS4w7iHMbwF4ZQZ6FpOx?=
 =?us-ascii?Q?AeE5DMvt5gHcBqZJKBbpNevRO3/yXsi7l4KN9G1HXQm1xTeg8/NzSqXfl1SK?=
 =?us-ascii?Q?zVnwcrq568NMcZ8OK+kwlHGKohn5n5CmT1SntxiWYPrN7DQg/7xFbKQ0LA+U?=
 =?us-ascii?Q?NyyI4l42SJ0SR+/fE5uOhCfgeujmNEyB0WO+MPSyd+Scn9By7RqSqHKmcqNo?=
 =?us-ascii?Q?lNt9frV9uG0N+tDhzDmbSo25VwYDV3be13l9XdCfGZXC/CTRSnHHPTciU9/m?=
 =?us-ascii?Q?LpYw7NTMvskNEtlMel3VxQ/rjy4sE8LT5LlP9jWyEV7pHrnorrMy0bB8GCrL?=
 =?us-ascii?Q?b6axVw0KolGb2sNCoib0uDAhoOFoOfryWNTjhTPEBBw0wXVL1JsBsc9TMZ3G?=
 =?us-ascii?Q?SqkWRezo7KS11at7RLrV54JMXEAAzAKgZMnZZbIoh+5HUA0T3yfZrT0mXQ0R?=
 =?us-ascii?Q?KNhDcFmdyscHsmxDmedt4BJ9BvFVpqL710Lr1mnwmk58O2zrN6Eh1ZydvJlE?=
 =?us-ascii?Q?8VDDBZESCdmRusG/Yx9yhvHKpYNfwpV0OXcvaZ+xY/YxSsvPhCb6hOEaeZrm?=
 =?us-ascii?Q?1gn6/IhznUAsbzkcZLyXc6Q5wXknfElWw57zmElo/IAGHT9GKd+5NCI1htm9?=
 =?us-ascii?Q?8fCqxuoaIhQP/nRWu5XjNnIkpKfpxSrOTPxpdRcyoGVxj2Na2pFC8gAjJcQV?=
 =?us-ascii?Q?MNdzibb53PY7+c5YuTZHAHTcWaKcIm0wHbhqo6xPPzhjVt07ZHwWvJgnn8gA?=
 =?us-ascii?Q?EXM/i0vULGLKSrrKU3cn+XIh+5F00hhS5x7LM3e+x8ONrhP3oz8/ArKiJ+Pe?=
 =?us-ascii?Q?1hP8PE+nd8p/eN2IMG4Y0HIqoumSWien7haEt/stdbr8vVM4BUznbFsQsHBl?=
 =?us-ascii?Q?/iQdqQ8+QcSQ44Ds2vyFhH7AGRgTUA6xiAmCYVKDdDEf0LrowH0Zdy03FgXT?=
 =?us-ascii?Q?G6WiMow0lxLNhGXJ+G1/5BsV8lGty+M0/HCmD0Geob3v5CI0Y5BofbaND7H0?=
 =?us-ascii?Q?28CKSl3DxGU1ApaowEFOKKK97I70QW40kI9ABa2juAJ7G7cqBPvOXyFrenxY?=
 =?us-ascii?Q?9TzRX/tu4+Al/vxeu8ugmWCqeMBVWD35OJw3twGmK+xlMuAXa1dVZ1CEh0s1?=
 =?us-ascii?Q?GCn2ik4goEiTaCYm6AGZnbVzMHTgbv/2hbUMELgrYhGhsMgUZag6rvLxNcT2?=
 =?us-ascii?Q?tCYXs3HhqMHMwu2k0dQdE1nHCFftGtIRZRcZAgHnYp2RsGnid5YPTTZFAN+L?=
 =?us-ascii?Q?3Aa9jJuHvQReUbxO++n7csb2LJthPl8y4DYauHwPLQ18BrtoY3+/9Te5mNNI?=
 =?us-ascii?Q?plWAySD7+RVHt7xDFpKQt0cNLtFyvjThUM0o779MhrzNT0yvY1IGCakog61m?=
 =?us-ascii?Q?gBbHtAyDICdJWp+6pJVERmGBgHN1YYJMfj0NjJ/gQjFHEMdlVAJZIbWAq3GF?=
 =?us-ascii?Q?fbOsNt56SkbrFfWrmRCuGyfjNKHhyy2ItJWWIpPDy3GCblDrKCVWRd2SW0J7?=
 =?us-ascii?Q?gj7y+r218vQ64vO++yAxwTOaZCfT0uMv29ln+qPPiOnGrcQfR6wty6d/1WFt?=
 =?us-ascii?Q?l0qVk46l5YEWArW0axNrkPfZ6QEZlS5suFTq0FjN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 596f7f76-c6fa-4131-79c3-08ddfa4e370b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 03:06:39.3954
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ywg4oVca2cczg8H2jZb94BuE/hE/cWTl40IAM6DOO7kQwEzZFnnXQFD2MV/gS4wUvLQ3wl+8VEl8KybvdgYQgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6799
X-OriginatorOrg: intel.com

Hi, Ke

Better update the subject, it's not related to error handling.

------------------------------------------------------------------------
BRs, =20
Bingbu Cao

>-----Original Message-----
>From: Ma Ke <make24@iscas.ac.cn>
>Sent: Tuesday, September 23, 2025 10:10 AM
>To: sakari.ailus@linux.intel.com; Cao, Bingbu <bingbu.cao@intel.com>;
>Zhang, Lixu <lixu.zhang@intel.com>; stanislaw.gruszka@linux.intel.com;
>mchehab@kernel.org
>Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
>akpm@linux-foundation.org; Ma Ke <make24@iscas.ac.cn>
>Subject: [PATCH v3] media: pci: intel: ivsc: fix error handling in
>mei_ace driver
>
>The mei_ace driver contains a device reference count leak in
>mei_ace_setup_dev_link() where device_find_child_by_name() increases
>the reference count of the found device but this reference is not
>properly decreased in the success path. Add put_device() in
>mei_ace_setup_dev_link() and delete put_device() in mei_ace_remove(),
>which ensures that the reference count of the device is correctly
>managed regardless of whether the probe is successful or fails.
>
>Found by code review.
>
>Signed-off-by: Ma Ke <make24@iscas.ac.cn>
>---
>Changes in v3:
>- deleted the tag of Fixes and CC, and moved put_device() to
>immediately after device_link_add() as suggestions; Changes in v2:
>- modified the put_device() operations and the patch title as
>suggestions.
>---
> drivers/media/pci/intel/ivsc/mei_ace.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/media/pci/intel/ivsc/mei_ace.c
>b/drivers/media/pci/intel/ivsc/mei_ace.c
>index 98310b8511b1..9969c02da671 100644
>--- a/drivers/media/pci/intel/ivsc/mei_ace.c
>+++ b/drivers/media/pci/intel/ivsc/mei_ace.c
>@@ -414,6 +414,7 @@ static int mei_ace_setup_dev_link(struct mei_ace
>*ace)
> 	/* setup link between mei_ace and mei_csi */
> 	ace->csi_link =3D device_link_add(csi_dev, dev, DL_FLAG_PM_RUNTIME
>|
> 					DL_FLAG_RPM_ACTIVE |
>DL_FLAG_STATELESS);
>+	put_device(csi_dev);
> 	if (!ace->csi_link) {
> 		ret =3D -EINVAL;
> 		dev_err(dev, "failed to link to %s\n", dev_name(csi_dev));
>@@ -522,7 +523,6 @@ static void mei_ace_remove(struct mei_cl_device
>*cldev)
> 	cancel_work_sync(&ace->work);
>
> 	device_link_del(ace->csi_link);
>-	put_device(ace->csi_dev);
>
> 	pm_runtime_disable(&cldev->dev);
> 	pm_runtime_set_suspended(&cldev->dev);
>--
>2.17.1


