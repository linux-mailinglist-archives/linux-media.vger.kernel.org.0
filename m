Return-Path: <linux-media+bounces-63169-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKT8CUDpG2o0HQkAu9opvQ
	(envelope-from <linux-media+bounces-63169-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 09:54:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A478614DEB
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 09:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 245C3302F736
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 07:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FCEF379EE2;
	Sun, 31 May 2026 07:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWLINlPf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435D5379974;
	Sun, 31 May 2026 07:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780214067; cv=fail; b=iboXrY6ssHJ75DKY051dfyiPw4CKwlck1Zhm3L12l8ke/iE1FtTqOFADM7RmiC8tSmkIV+GAIldoAoUHMLU+P7EFLNpXw1X7Bz4X4AJB9MGiOhsbyyQGo3J1JQdwJhD+OejEDSb+51eiRPraPxqhFhaYhhk20JQtkhkRH5fxm2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780214067; c=relaxed/simple;
	bh=dfM3cJ4PyM3QS9iBlKddYb1EseKZWLU596Ab+GYdtYk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uHCwPTeBsOUcD9+YFGLWHb3iAapAHfdlzi0agEn/tnNQVh5VkCh89zJeQSdTd9HOt1+6Udxp3vAKu8IuDED8YUsZAme/urVCxujyME359h8SJmhp82d9qso0Xm+wKElJ03sbw6mI099IKWKBUVCAuQxXpSBp6+mZuM1ASTQlDz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWLINlPf; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780214064; x=1811750064;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=dfM3cJ4PyM3QS9iBlKddYb1EseKZWLU596Ab+GYdtYk=;
  b=GWLINlPfSdVGC78V47CguBxXWZcgIiYH9VfbRj8e+hST/kX2f73QRg/w
   b3ID7YDVWiUp8tFvNQ2qM16ZuHkv5xYscM9YylFjJHreIBbBkeu21MpKq
   hjrCqpC2qK7tRQbp93+QPd5F94RRwFZPnopOXNOs3Klqbt0lIm+ZW5A+X
   i6AGApUmo3Sdgt7WgjjYUFo8fcI72x8lUtG96xGlzg9cXgu3nfQv9dozY
   rtXJ+3zYzChXOUULEalihJKm1bm8G+d/1AKZLQMEjg9otbFJzT4dNCWFV
   5eqWrmid72pjjLaE3Ann7Z3yRTKRie6aIyzjQIaK4vRdzNVXYpcm6I8lv
   A==;
X-CSE-ConnectionGUID: gV7JDmnDSlGn/cKiQVHV/g==
X-CSE-MsgGUID: kuzl+5qdQq6kI4zrCwbqLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="80973678"
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="80973678"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 00:54:23 -0700
X-CSE-ConnectionGUID: f/ZU/5foRBu8XAqjgcPMoA==
X-CSE-MsgGUID: n0jRTO5PS5G2nSWHXv9JwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="242461008"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 00:54:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 31 May 2026 00:54:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 31 May 2026 00:54:21 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.14) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 31 May 2026 00:54:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STr+49PLQp45Y6EjeIhvX85SKfc3C0+oQePu4+mKRJ6bBIib5O/tSENCgXRz7qqvzfnxk1TIADmQVQhrB+qoe7sgzQ3dsFmylacU879lFQQGsY3IdOhJ0j7h4y/J94Ii5fcu/F5sy4WIB32HlXZaehhZ8vBt0gFqDATYySVUmv6NtLATCVhNT0JSgNnReteYDlxGYDkoO4aTeMhWj/c8IxuTP9U/BOKAGV9RZKxnkxLZHeV6GpOe8WX3B7CHwPydWS+JCgwI1snjUE34e0uj70DyVanp2mPxGgSFBIjzwlvv4vE1vd31NV76U7Fg6euecSQUCOLm0ZqTl8RRCqRIMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+l2/CC+1grcxcplQx4OOXSZXCdZP4TKSqpayKRe+kbM=;
 b=xXUzCgM76cfE1Pj/4wQ/Jx72x3L9HDh5Xtp5VudVQdTSVmU1mXz20etn5XdgE9bx5dDXn2LeKraIXlK7V/knq/skt5ftjOEyRj0OlKMBOWhBNJLSmM3qRuoSURRuD7btmCekcl78hW8I6e6CGKBDeT9v/8oNUY5ESEj+kLQyKJbBJ6WbbSAxwQZ+bjOgMzEh6ls31+B8Eu2TEWd29n4hIw11Xm6uuUauMuvSd0+GqeLKITRxP12uBsRUns4CAIWW8SnUBlxVPVz4p/8nV8SeBU9WyfHyQW7KK/pxsQbGTm1k/Nid7V1z9RfGNtl3aDWSRAK5wDY5lEoVYiDyJ3Zsxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by DM3PPFD2F4A0090.namprd11.prod.outlook.com (2603:10b6:f:fc00::f50) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sun, 31 May
 2026 07:54:19 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 07:54:19 +0000
Date: Sun, 31 May 2026 15:54:09 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <w15303746062@163.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
	<dri-devel@lists.freedesktop.org>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
	<jeffy.chen@rock-chips.com>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>, Mingyu Wang
	<25181214217@stu.xidian.edu.cn>, <stable@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: Re: [PATCH] drm/prime: Fix unsupervised rb_tree corruption in
 drm_prime_remove_buf_handle
Message-ID: <202605310941.ddd52610-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260528082912.1051262-1-w15303746062@163.com>
X-ClientProxiedBy: SI2P153CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::21) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|DM3PPFD2F4A0090:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ed14536-d9ca-4014-4150-08debee9d1cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|6133799003|3023799007|5023799004|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: C9zm/Jih5Q3UlAYfrvXopRtZKCeulD2MNaSj9AmkBIEMkjLLdrHG44AU2aSBsO67OoMpvZmi1bUB7IkY9BcAzenyfQwq3iQozPfhDgDU6aYplMcrj0pK3e0sAmTlqsyKaMUbHMp/nqt2aC3rg/PW3Xkc6Jp6e6VfkEtU2cQ13O+TOd1cBO9qFpkt3rnuzMQ1WhilhPdZYD1iTAN6BoKpkkQuwUt6zawEPAErvaQ/udjMrma2e1/9p92tO2Id4SR0G3pgPlo6wVZPUwZyPORsdMopQvAMY3xhMsF0lySMlAlhDfckWX6LfroRVnAvccnquOlI6sW4agRGAwckwW81okXrPnh/MUYpAb9ERtqr8OXdIHAjsH6wJDvZ0vMoKtoZJwdQ455QsrBOwzj+IzLKfBRauDVO90X0RU2OA6I+e4eLPVH1K0Wsf8zk4o5vgDbvxTNIgpEsgifEC2eQf2vPDRcdcIL9Nntw79NUpXvC7iqZHk0Lt+4oGJ1VsBFyqnY4/Rg7jJ9m5OSZLDo+BNOf58B4myLR8OKOE2SldGj4H50VGc9Ke5rCJjHV+EFF5mmxCKMkIDAMTkNvddn0o8a3dcs5+CHU6fLnWbUrvTHhC/nQAMUdSlONRKQ8h0GT0rH1n5mdo+ymkwlRveLkHPE0Gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(6133799003)(3023799007)(5023799004)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z/EWBuB+a4Q8/960397psuYC9ZvaT4Ml4UQ04te/q+xAkKqbwe17Kp9yM55g?=
 =?us-ascii?Q?NpCP0euXkwI16CK91k1o2bw2yFqfg31mUEKyHwtfLBo72u8ZnTNxYamkEw7m?=
 =?us-ascii?Q?zcsVuvo2TRCxHyPdKL86FuLiMAfbhEV/4Yz6qRgk1olrxvg4grnEasegY7Jp?=
 =?us-ascii?Q?H7Wg2MnMLI1x8K28IAOiEencSna1gUzBgRjvQFPIVAyJNfuiv484ojd5fNPL?=
 =?us-ascii?Q?4jqtEpX3qv88XB4++TudSiYybYaIVkmZ/JxxkW2BM0/d580siiSCNpbx4W0u?=
 =?us-ascii?Q?BeMRKm4T4IB1xohuD/ZEHXbQfUBrDt3ZupdS2hyeDi42EGxOC3uZ2YqF/ABh?=
 =?us-ascii?Q?B+eRY7sb9vEt4jxz8/W6Exhgv4DbTNhQr2kaFZhlW/8bWtl4aeGj0+CY1Ktg?=
 =?us-ascii?Q?nn53Gw40/Jjy5yvPcE6XrgsFn+kiXbd0aqHqiEL8FjSA8oum02qAEYfJilj8?=
 =?us-ascii?Q?wNPVtIWQH+FHFTpnVIvypaHZfZ2MzcNdV+6dWKDxbnylIsJB6M5nYg1iS/8e?=
 =?us-ascii?Q?0p8y+3CKn69Be1dN7uhYBPDDsvdjAXFjL0OfevR7z3aCrcQtGBjRoMOiHrB1?=
 =?us-ascii?Q?UL/XsK/YvXns5eTwULl+EdquDgN+3Z9gV7XLSMkRSXisQYYKSgA/n3kwbC0i?=
 =?us-ascii?Q?l/wbxMBmcR5ftq8RVpfGLGNH9d4wFn4ssOo3Ebc8gBX7KxXYwLnS0wT8vJ80?=
 =?us-ascii?Q?sGTu665t/l1XKYVLLi9WsfcjrbZdIdODLrvEBRI2gVrHsa51nDwFj/khjWFa?=
 =?us-ascii?Q?Cedp4ilyxyTGgwyhqIz50fu2S+WR5xQE4V+UPDzBgi/XinwqxRxJjxqfUZDQ?=
 =?us-ascii?Q?wdOWIlu0Pa4iSzBNV8p0ZDew2IUPySMrlkUWbeT/vgZcGDOjLsY+q8w9Xqal?=
 =?us-ascii?Q?YquXjnCucfMEO62sxrOGa8oxmBXOPTyUj+steqqe89LPLCG+BPx7WeBdXrc1?=
 =?us-ascii?Q?7tm1kIB+0QJ0sJsYHhqPTp7Sum37YkwttTS2yiNJNFkDafKxKNCMsXusY3pw?=
 =?us-ascii?Q?jiiwZ2VkFLzxJFo31yijqnmM1es3Ue6aup7eB/ZmpnKqQ2i4nMqT6HEsWsuW?=
 =?us-ascii?Q?DvjJpksP5vlGU3oriJKgNef8CVWCcnwuj+S9PqCQkx1DYgY6075KoiN20xc6?=
 =?us-ascii?Q?UxiGRM/P+VDxsPSzVRhGfXhirx8Q8QVQL5HO2gGFs4uLtjEAlbaJhhwacaOr?=
 =?us-ascii?Q?ajdDu5CDj9RgSRJ0I1R1iNsUr5OnzyjvR8Fm7SedYMVCJns03WYTv1TKRs55?=
 =?us-ascii?Q?r3z+y70k/KfTsHiLni0tYnKXDks9NMhDuWaD9eq/jBz742iMkk9yMi7EAPx9?=
 =?us-ascii?Q?UiP0xfRIxRAqR/lw9PmIZltcRafLc0oUAeLYZZhMNlvliwl/llRhmxmOfHm5?=
 =?us-ascii?Q?t+2LyfxuUk5V9vSIWvnExG4D1eDmmBIIGbpYtUNHefD0NCXOK02meA7+jhjI?=
 =?us-ascii?Q?yNh2J9vFMQ2iO7PcZJu/xH+4ErUR/SGhYkv4yTEVWwALPffIprmTYo+D/xOq?=
 =?us-ascii?Q?BnoQWyi57hNfeVYLILmciv18WPa3jnGA5ClGIyew2LaLv3E6nRVRx9Z/8bKs?=
 =?us-ascii?Q?qiDusNrnEDan7dAsj/R6v9k0atJUvLTVzZ4L8gNlPzqk1+R/i+KWIzjzja1T?=
 =?us-ascii?Q?ziaToKgD87q1nyMnmz0Fu+1V3wp8GYsvMn0J9JkjlQaiX7M4HDWjKxSqUtmr?=
 =?us-ascii?Q?huJm75pyVdAItXmxasxtxzrWscgK05raxqX3hwmWcCncam96xJ8vpjNSIMwz?=
 =?us-ascii?Q?QO2CD5o+Pw=3D=3D?=
X-Exchange-RoutingPolicyChecked: SotBIqOrlzwtXkrJ6YeNCT9nJxcUvKerrDg6XcaLy51YC/u2nv1E0UDTm/yTdsqfifuQevktZhzHJA1mjqySHw2ksVBZAANKzEhzcCVeNBiLDTUEpeBhfKK3ABRgv947QPSrhlbt0hCVEgjPf+T1LtMWz/PBHiyJPv/xI3OAxl2mcPvQkCXIydLnHoNDkg9t6d7h8gOjq2m6nXvQlKB4l+C6Wr+CI94d7TL93SEpz54QCR1JDTJkO7L3zIcuvEa93B2ISOJV+qnykL/IpV6ievNKgYG0VwC8WfeQB/V98trhhHxcJ1yR4DJx7PukdrPuUBJWI6sKo62PCGu4jwBgHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed14536-d9ca-4014-4150-08debee9d1cb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 07:54:19.1104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3tnhFZqBobOXOXdaasounhRoNi89n5NqB9bKTTWT3JXVqUihFQbnrHsN8oSrH5rJ/+TYMckvojKe92/T7/tfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD2F4A0090
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63169-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,intel.com,lists.freedesktop.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,rock-chips.com,vger.kernel.org,lists.linaro.org,stu.xidian.edu.cn];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,intel.com:mid,intel.com:dkim,01.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oliver.sang@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8A478614DEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



Hello,

kernel test robot noticed "WARNING:possible_recursive_locking_detected" on:

commit: 60a023d26c97753be2beee6062d71ce9416725b1 ("[PATCH] drm/prime: Fix unsupervised rb_tree corruption in drm_prime_remove_buf_handle")
url: https://github.com/intel-lab-lkp/linux/commits/w15303746062-163-com/drm-prime-Fix-unsupervised-rb_tree-corruption-in-drm_prime_remove_buf_handle/20260528-163356
base: https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link: https://lore.kernel.org/all/20260528082912.1051262-1-w15303746062@163.com/
patch subject: [PATCH] drm/prime: Fix unsupervised rb_tree corruption in drm_prime_remove_buf_handle

in testcase: boot

config: x86_64-rhel-9.4-bpf
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202605310941.ddd52610-lkp@intel.com



[   86.630882][  T218] WARNING: possible recursive locking detected
[   86.631312][  T218] 7.1.0-rc2+ #1 Not tainted
[   86.631634][  T218] --------------------------------------------
[   86.632065][  T218] (udev-worker)/218 is trying to acquire lock:
[   86.632529][  T218] ffff8881ab017388 (&prime_fpriv->lock){+.+.}-{4:4}, at: drm_prime_remove_buf_handle (gpu/drm/drm_prime.c:195) drm
[   86.633434][  T218]
[   86.633434][  T218] but task is already holding lock:
[   86.633951][  T218] ffff8881ab017388 (&prime_fpriv->lock){+.+.}-{4:4}, at: drm_gem_object_release_handle (gpu/drm/drm_gem.c:377) drm
[   86.638664][  T218]
[   86.638664][  T218] other info that might help us debug this:
[   86.639229][  T218]  Possible unsafe locking scenario:
[   86.639229][  T218]
[   86.639769][  T218]        CPU0
[   86.640006][  T218]        ----
[   86.640243][  T218]   lock(&prime_fpriv->lock);
[   86.640581][  T218]   lock(&prime_fpriv->lock);
[   86.640916][  T218]
[   86.640916][  T218]  *** DEADLOCK ***
[   86.640916][  T218]
[   86.641480][  T218]  May be due to missing lock nesting notation
[   86.641480][  T218]
[   86.642060][  T218] 4 locks held by (udev-worker)/218:
[   86.642446][  T218]  #0: ffff8881022921f8 (&dev->mutex){....}-{4:4}, at: __driver_attach (linux/device.h:1040 base/dd.c:1174 base/dd.c:1294)
[   86.643133][  T218]  #1: ffff8881ab020260 (&dev->clientlist_mutex){+.+.}-{4:4}, at: drm_client_register (gpu/drm/drm_client.c:129) drm
[   86.644051][  T218]  #2: ffff8882a2b58a70 (&helper->lock){+.+.}-{4:4}, at: drm_fb_helper_initial_config (gpu/drm/drm_fb_helper.c:1717 gpu/drm/drm_fb_helper.c:1710) drm_kms_helper
[   86.644930][  T218]  #3: ffff8881ab017388 (&prime_fpriv->lock){+.+.}-{4:4}, at: drm_gem_object_release_handle (gpu/drm/drm_gem.c:377) drm
[   86.645880][  T218]
[   86.645880][  T218] stack backtrace:
[   86.646300][  T218] CPU: 1 UID: 0 PID: 218 Comm: (udev-worker) Not tainted 7.1.0-rc2+ #1 PREEMPT(full)
[   86.646307][  T218] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   86.646311][  T218] Call Trace:
[   86.646316][  T218]  <TASK>
[   86.646321][  T218]  dump_stack_lvl (dump_stack.c:94 dump_stack.c:120)
[   86.646333][  T218]  print_deadlock_bug.cold (locking/lockdep.c:3041)
[   86.646341][  T218]  validate_chain (locking/lockdep.c:3093 locking/lockdep.c:3895)
[   86.646350][  T218]  __lock_acquire (locking/lockdep.c:5237)
[   86.646366][  T218]  lock_acquire (trace/events/lock.h:24 (discriminator 15) trace/events/lock.h:24 (discriminator 15) locking/lockdep.c:5831 (discriminator 15))
[   86.646372][  T218]  ? drm_prime_remove_buf_handle (gpu/drm/drm_prime.c:195) drm
[   86.646516][  T218]  ? rcu_is_watching (x86/include/asm/atomic.h:23 linux/atomic/atomic-arch-fallback.h:457 linux/context_tracking.h:128 rcu/tree.c:752)
[   86.646521][  T218]  ? drm_prime_remove_buf_handle (gpu/drm/drm_prime.c:195) drm
[   86.646659][  T218]  ? lock_acquire (trace/events/lock.h:24 (discriminator 21) locking/lockdep.c:5831 (discriminator 21))
[   86.646665][  T218]  __mutex_lock (locking/mutex.c:646 locking/mutex.c:820)
[   86.646675][  T218]  ? drm_prime_remove_buf_handle (gpu/drm/drm_prime.c:195) drm
[   86.646814][  T218]  ? drm_prime_remove_buf_handle (gpu/drm/drm_prime.c:195) drm
[   86.646952][  T218]  ? __mutex_lock (locking/mutex.c:656 locking/mutex.c:820)
[   86.646958][  T218]  ? drm_gem_object_release_handle (gpu/drm/drm_gem.c:377) drm
[   86.647103][  T218]  ? __pfx___mutex_lock (locking/mutex.c:914)
[   86.647109][  T218]  ? __pfx___mutex_lock (locking/mutex.c:914)
[   86.647116][  T218]  ? idr_replace (idr.c:304)
[   86.647124][  T218]  ? drm_prime_remove_buf_handle (gpu/drm/drm_prime.c:195) drm
[   86.647264][  T218] drm_prime_remove_buf_handle (gpu/drm/drm_prime.c:195) drm
[   86.647408][  T218] drm_gem_object_release_handle (gpu/drm/drm_gem.c:379) drm
[   86.647555][  T218] drm_gem_handle_delete (gpu/drm/drm_gem.c:413) drm
[   86.647700][  T218] drm_client_buffer_create_dumb (gpu/drm/drm_client.c:424) drm
[   86.647840][  T218]  ? __pfx_drm_client_buffer_create_dumb (gpu/drm/drm_client.c:267) drm
[   86.647977][  T218]  ? drm_fb_helper_single_fb_probe (gpu/drm/drm_fb_helper.c:1414 gpu/drm/drm_fb_helper.c:1445) drm_kms_helper
[   86.648030][  T218] drm_fbdev_shmem_driver_fbdev_probe (gpu/drm/drm_fbdev_shmem.c:151) drm_shmem_helper
[   86.648045][  T218]  ? __pfx_drm_fbdev_shmem_driver_fbdev_probe (gpu/drm/drm_fbdev_shmem.c:119) drm_shmem_helper
[   86.648055][  T218]  ? __kmalloc_noprof (linux/local_lock_internal.h:62 slub.c:4771 slub.c:4883 slub.c:5294 slub.c:5307)
[   86.648064][  T218]  ? rcu_is_watching (x86/include/asm/atomic.h:23 linux/atomic/atomic-arch-fallback.h:457 linux/context_tracking.h:128 rcu/tree.c:752)
[   86.648073][  T218] drm_fb_helper_single_fb_probe (gpu/drm/drm_fb_helper.c:1454) drm_kms_helper
[   86.648121][  T218]  ? __pfx_drm_fb_helper_single_fb_probe (gpu/drm/drm_fb_helper.c:1391) drm_kms_helper
[   86.648167][  T218]  ? fb_copy_cmap (video/fbdev/core/fbcmap.c:187)
[   86.648174][  T218]  ? fb_alloc_cmap_gfp (video/fbdev/core/fbcmap.c:124 (discriminator 1))
[   86.648180][  T218] __drm_fb_helper_initial_config_and_unlock (gpu/drm/drm_fb_helper.c:1635) drm_kms_helper
[   86.648230][  T218] drm_fbdev_client_hotplug (gpu/drm/clients/drm_fbdev_client.c:66) drm_client_lib
[   86.648239][  T218] drm_client_register (gpu/drm/drm_client.c:143) drm
[   86.648376][  T218] drm_fbdev_client_setup (gpu/drm/clients/drm_fbdev_client.c:168) drm_client_lib
[   86.648383][  T218] drm_client_setup (gpu/drm/clients/drm_client_setup.c:46 gpu/drm/clients/drm_client_setup.c:35) drm_client_lib
[   86.648390][  T218] bochs_pci_probe (gpu/drm/tiny/bochs.c:776 gpu/drm/tiny/bochs.c:747) bochs
[   86.648405][  T218]  ? __pfx_bochs_pci_probe (gpu/drm/tiny/bochs.c:254) bochs
[   86.648413][  T218]  local_pci_probe (pci/pci-driver.c:325)
[   86.648422][  T218]  pci_call_probe (pci/pci-driver.c:387)
[   86.648427][  T218]  ? __pfx_pci_call_probe (pci/pci-driver.c:653)
[   86.648432][  T218]  ? find_held_lock (locking/lockdep.c:5350)
[   86.648439][  T218]  ? pci_match_device (linux/spinlock.h:390 pci/pci-driver.c:156)
[   86.648444][  T218]  ? rcu_is_watching (x86/include/asm/atomic.h:23 linux/atomic/atomic-arch-fallback.h:457 linux/context_tracking.h:128 rcu/tree.c:752)
[   86.648448][  T218]  ? trace_preempt_on (trace/events/preemptirq.h:53 (discriminator 21) trace/trace_preemptirq.c:120 (discriminator 21))
[   86.648452][  T218]  ? pci_match_id (pci/pci.h:466 pci/pci.h:460 pci/pci-driver.c:110)
[   86.648459][  T218]  ? pci_match_device (pci/pci-driver.c:168)
[   86.648465][  T218]  pci_device_probe (pci/pci-driver.c:448 pci/pci-driver.c:482)
[   86.648471][  T218]  call_driver_probe (base/dd.c:631)
[   86.648477][  T218]  really_probe (base/dd.c:709)
[   86.648484][  T218]  __driver_probe_device (base/dd.c:871)
[   86.648489][  T218]  driver_probe_device (base/dd.c:901)
[   86.648495][  T218]  __driver_attach (base/dd.c:1295)
[   86.648500][  T218]  ? __pfx___driver_attach (base/dd.c:1004 (discriminator 1))
[   86.648504][  T218]  bus_for_each_dev (base/bus.c:383)
[   86.648511][  T218]  ? __pfx_bus_for_each_dev (base/bus.c:205)
[   86.648516][  T218]  ? bus_add_driver (base/bus.c:754)
[   86.648520][  T218]  ? trace_preempt_on (trace/events/preemptirq.h:53 (discriminator 21) trace/trace_preemptirq.c:120 (discriminator 21))
[   86.648526][  T218]  bus_add_driver (base/bus.c:756)
[   86.648532][  T218]  driver_register (base/driver.c:249)
[   86.648538][  T218]  ? __pfx_bochs_pci_driver_init (bochs.c:?) bochs
[   86.648548][  T218]  do_one_initcall (main.c:1392)
[   86.648555][  T218]  ? __pfx_do_one_initcall (trace/events/initcall.h:10)
[   86.648561][  T218]  ? kasan_unpoison (kasan/shadow.c:146 kasan/shadow.c:178)
[   86.648568][  T218]  ? __kasan_slab_alloc (kasan/common.c:336 kasan/common.c:366)
[   86.648575][  T218]  ? rcu_is_watching (x86/include/asm/atomic.h:23 linux/atomic/atomic-arch-fallback.h:457 linux/context_tracking.h:128 rcu/tree.c:752)
[   86.648579][  T218]  ? kasan_unpoison (kasan/shadow.c:146 kasan/shadow.c:178)
[   86.648586][  T218]  do_init_module (module/main.c:3106)
[   86.648594][  T218]  ? __pfx_do_init_module (trace/events/module.h:50 (discriminator 1))
[   86.648599][  T218]  ? load_module (module/main.c:2528 module/main.c:2523 module/main.c:3575)
[   86.648603][  T218]  ? kfree (linux/kasan.h:235 slub.c:2689 slub.c:6250 slub.c:6565)
[   86.648611][  T218]  load_module (module/main.c:3580)
[   86.648620][  T218]  ? __pfx_load_module (module/main.c:3020)
[   86.648626][  T218]  ? __pfx_kernel_read_file (??:?)
[   86.648632][  T218]  ? do_syscall_64 (linux/irq-entry-common.h:279 linux/entry-common.h:320 x86/entry/syscall_64.c:100)
[   86.648640][  T218]  init_module_from_file (module/main.c:3777)
[   86.648646][  T218]  ? __pfx_init_module_from_file (module/main.c:3634)
[   86.648656][  T218]  ? idempotent_init_module (linux/spinlock.h:390 module/main.c:3688 module/main.c:3788)
[   86.648661][  T218]  ? rcu_is_watching (x86/include/asm/atomic.h:23 linux/atomic/atomic-arch-fallback.h:457 linux/context_tracking.h:128 rcu/tree.c:752)
[   86.648664][  T218]  ? trace_preempt_on (trace/events/preemptirq.h:53 (discriminator 21) trace/trace_preemptirq.c:120 (discriminator 21))
[   86.648669][  T218]  ? preempt_count_sub (sched/core.c:5874 (discriminator 2) sched/core.c:5871 (discriminator 2) sched/core.c:5893 (discriminator 2))
[   86.648676][  T218]  idempotent_init_module (module/main.c:3789)
[   86.648682][  T218]  ? __pfx_idempotent_init_module (module/main.c:3778)
[   86.648687][  T218]  ? preempt_count_sub (sched/core.c:5874 (discriminator 2) sched/core.c:5871 (discriminator 2) sched/core.c:5893 (discriminator 2))
[   86.648696][  T218]  ? security_capable (security.c:660 (discriminator 20))
[   86.648702][  T218]  __x64_sys_finit_module (module/main.c:3815 module/main.c:3799 module/main.c:3799)
[   86.648708][  T218]  do_syscall_64 (x86/entry/syscall_64.c:63 x86/entry/syscall_64.c:94)
[   86.648713][  T218]  ? rcu_is_watching (x86/include/asm/atomic.h:23 linux/atomic/atomic-arch-fallback.h:457 linux/context_tracking.h:128 rcu/tree.c:752)
[   86.648717][  T218]  ? trace_preempt_on (trace/events/preemptirq.h:53 (discriminator 21) trace/trace_preemptirq.c:120 (discriminator 21))
[   86.648720][  T218]  ? do_syscall_64 (linux/randomize_kstack.h:58 x86/entry/syscall_64.c:92)
[   86.648725][  T218]  ? preempt_count_sub (sched/core.c:5874 (discriminator 2) sched/core.c:5871 (discriminator 2) sched/core.c:5893 (discriminator 2))
[   86.648730][  T218]  ? do_syscall_64 (linux/randomize_kstack.h:58 x86/entry/syscall_64.c:92)
[   86.648734][  T218]  ? irqentry_exit (linux/irq-entry-common.h:280 linux/irq-entry-common.h:325 entry/common.c:162)
[   86.648740][  T218]  entry_SYSCALL_64_after_hwframe (x86/entry/entry_64.S:121)
[   86.648747][  T218] RIP: 0033:0x7f3757f90779
[   86.648768][  T218] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 4f 86 0d 00 f7 d8 64 89 01 48
All code
========
   0:	ff c3                	inc    %ebx
   2:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   9:	00 00 00 
   c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48 89 ca             	mov    %rcx,%rdx
  1d:	4d 89 c2             	mov    %r8,%r10
  20:	4d 89 c8             	mov    %r9,%r8
  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
  28:	0f 05                	syscall
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	ret
  33:	48 8b 0d 4f 86 0d 00 	mov    0xd864f(%rip),%rcx        # 0xd8689
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260531/202605310941.ddd52610-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


