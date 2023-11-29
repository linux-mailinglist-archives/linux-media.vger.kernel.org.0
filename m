Return-Path: <linux-media+bounces-1303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE147FCD20
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 04:01:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C13628338D
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 03:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556044C6D;
	Wed, 29 Nov 2023 03:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LzTPXDdl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B45C719A
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 19:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701226871; x=1732762871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KaJWSgiyxrF7M919R1YlXCenbY/HxHr0t7zHD2jq3Lw=;
  b=LzTPXDdlsznU+AzRFL6ZK9CRu6U/QfVpRLgS+1e+kMMSuSuSM4yaAIOS
   u+xFdDEHlzPzN2WkZmsN50iJVAVTYEZPie96ff1Wz80YxFJJ4rrbGryUY
   rB1UDQolTza+YuJ6QomCKDlN65Sj8ATl4Pkifde9Z49zwunwNwZ9XAaL2
   DcdLwor+SF9o0LBW85sYGXHNzktZAafNnD9yGD537CkGYtoqtvb39Jgei
   sXitHzPWt0NMmSbCEyKQqzgOxpRr1YS9GTfnOdWQnx3k94Y3EXABjOeM3
   gLJosM8jk9W9etbU6pPkmOHyA/BfZpaF+1pyz7ecgUQY34N0yHuhZML5s
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="459582208"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="459582208"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 19:01:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="797768978"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="797768978"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Nov 2023 19:01:11 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 19:01:10 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 19:01:10 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 19:01:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XerofnvFBKS1pCOHpqsfuCDTRUBOqMzNsenje6sX1Mo6bNsffhgfH1B27oNxvvHwnePr2UIZ9Ss2FkbC+t6k5qC64FxY++pbf/m/YRyjv0X3Bk3ABw/dD9DChRCSOX2XZ7BVSrJimbk1+4y2U4KvjAVwFbeBV4dXcipFPX4CUN66e21cu6lBsJbGtolPAqgsD0a6UBQJliDN7ep+BrTxjILu2um78ZmqOcYqhM9XOqXOB7nEk7YjODwGULzmjorJMSxIvRALKm7gr4zvXBMSL7CJgqTNuuZhFA6BqVuSzaxLIlYtyBicOaP1ZVXV3qpTGUiUreDRzxkMPw0ePuqYoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8D0zodcePSkMDFuwAivmKMVwxp0llF8EcY1W9BQk73w=;
 b=FJKA5eRSpcm+pzbuz4QzWVhMZVH9DrjJ6Mvc33jgKZyUSlwBGyG7eRTP0mSw+65IKd6fbRdWnEvsp7vgTWIuqnDmH+U+D/CZMscYWiNGG3L5l+LtogEVfuDPNlislPDtZ3LCA0K2HRrxNOC5Nukr8Y6/Rk3IdRkDmlm+k2sgte2U9HbaHi58ZKaAuqA7S5iNP2U0oowDN3eXDACITsQzuNtV1JN6nxdW4v8QMPSGlKDgwBxV8+gNU+uF8Wy4BBXNujmkZY1aYEkYsPjLzTHspfwMBcqK+OmdSn7ragFhBfYKmIkXPivHi+6ZKtCHA5AqVhjxHEQOY3Iy2yZQKtPPWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CO1PR11MB4996.namprd11.prod.outlook.com (2603:10b6:303:90::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 03:01:09 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 03:01:08 +0000
Date: Wed, 29 Nov 2023 10:56:32 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-media@vger.kernel.org>
Subject: [sailus-media-tree:metadata 59/72] drivers/media/i2c/ccs/ccs-core.c:
 media/v4l2-fwnode.h is included more than once.
Message-ID: <202311290754.2apI277B-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:4:91::15) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|CO1PR11MB4996:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c083ca0-0c9d-48f1-f12f-08dbf0876f81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IXoXEa7nU4XKasqoYon4CtHjVEI+kt7qjJDMeX0USvh0KYj4Gx5Wbo30pAw0Bb8BWnMrHnmjSbExa3dmBOFUQunguyqRHOb4olOjwA3VjfmtmXaGt21Hsn3OJbH18kfVpr2XNv/t3FRuVv26f+KRq0MOdy1kJMjwPFa8mvDIIIp60Zea6MOodo/XYgoS/5a/mn9f43uq0sKJwbRHy+iw3+Zs4peFL3sBcxuXGhoC6QjUqZnWa9tpec05CdubkMuQHXEG2Ddd+eYy5M9qs24nBTpARdnIpLIyc4dJ/bROTYBpbyAhSyICT4CWwr1KHfzmBukpfROUmx6XMYYhkeqpv8vExpIe2sgfS7VriiCcdM1KBhqz2tL1Uh1jq7Um8udhemAmMVFPx+o2zed0oPBY67ev4PfUvr/5JjY6OmQBt+8XwK1dUdb2tJhSSMlSzAJPv28WuSit2j9TTUcbsX5E6A+bDNnxD0RIOqggP0fpfkj2q/XMadVY0BPbK/5/MbkDcr9P+27D8Inn2TBP+34x9J27IwuQx3JqumFli99TwrqA7s0hPVRh2JEzEuB0JD1HB1+RSzovtnfHtKNA1TJpLBDB7qTRFrVia8jzWp271+XZk8+SegGkWRlmg5YjkEvXY3+1KxlLgrUGSMfufA3Usw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(366004)(376002)(346002)(230273577357003)(230922051799003)(230173577357003)(451199024)(186009)(64100799003)(1800799012)(66556008)(66946007)(316002)(966005)(6486002)(66476007)(6916009)(6506007)(478600001)(6512007)(82960400001)(83380400001)(36756003)(86362001)(38100700002)(2616005)(4326008)(5660300002)(8936002)(8676002)(1076003)(6666004)(41300700001)(2906002)(26005)(4744005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V8EmA9EGfBGNzjcJh7jJUJFO+lpjWIqR75GnSRbE5izC6e6HPwDK0cTj4vV0?=
 =?us-ascii?Q?SBHlTRS3Oq33veWtGn2mZROmCH0m4Omj0ebYPEsq9CNl7sIo67TobZFRr03h?=
 =?us-ascii?Q?o/y4BeMo8Hzw5arAxEgxEJx1ebQIvYOck3G18KTcifqXhCQQmI294+aalNaH?=
 =?us-ascii?Q?Q3Kj0uryk2FUbFxOlWGjjn2kRUWWSoq+1epjhbEpVu1H7Qhha6v9SX7BqQM4?=
 =?us-ascii?Q?TpcuvsRdcjrEqAPfyfqYgnhqHMfNN1obnlCrAlJ9WoVB2H6VBufD/F0pzQzz?=
 =?us-ascii?Q?fLzY4sa+Uw6dIKcXPiaG5BrQcrELnhj6E+alyaGzDTVCgeRoJfFOkr3EHT84?=
 =?us-ascii?Q?dNKhzez5/eo2oQ0R2s8vt0a7fcaQQxi4e6TTLkBepL58z15LyJsulZqszQ72?=
 =?us-ascii?Q?zy2OB1gppYxzGBCC689aSbZYS27IB2AHgeF376xKrpHzPPHu1wrBRpPTgS/J?=
 =?us-ascii?Q?BdxR7enJ10P2mduIUrZrR3z5oXxq58JUbNMzMAn1bUVlSTzdOdSSNHD1GQ/a?=
 =?us-ascii?Q?5cTTdUBJaort7WuuRPyMsuyHCiiapekBhywuKr+u8BsFGv1ODdavVEI4g25r?=
 =?us-ascii?Q?kdeJ798XUFpl/UgtPS9SKARAnCjAMaO0LxigYd9NvorRvY60qK+1W7dRGTVa?=
 =?us-ascii?Q?okeNPoIxLO9w2SUMQuVeGzbj9oUxaMRWYqHglrGL07rVA3dqTrUKJFy31h6C?=
 =?us-ascii?Q?PQMLCm1ngVmoSRsiwxoTl2LUFcNOJ7RY8Dxy62kaKWy75jixJc4vkq/pGkRJ?=
 =?us-ascii?Q?jgpixIjitYYe406v0SfQpy9NLqPKjLpxlWFWUqAwjcJGyB3IPT8YXx2wlYyn?=
 =?us-ascii?Q?55djJgZb2aqZQ9msi3EJXE0uTgFAZneGO5ovkZums1fwg1c8JjDXPqbn3ceu?=
 =?us-ascii?Q?J0KtX6j6Hh3Nao8MhRtYG5pomTaPzlgeHzmMOvN9vX5Q3U2oz2XV5Vg8GXLI?=
 =?us-ascii?Q?etG5PMnSPMenPQZsyGas64N6395TJ7+7Um0vswUJocpU+Ox5Di9sgjsSyX6u?=
 =?us-ascii?Q?p4ShicfSG5Q8nqGfaeVfXv3dIXLWJGgmYVNdL1/pxDi/trwbME+niz1Ix7zb?=
 =?us-ascii?Q?n5USpTEi7ne3v3FUoghuifT7Ai70M7/H1Blg2AyL66lw4Iipsb5j6M3QKfNg?=
 =?us-ascii?Q?MVyohcizo7dJzS+/J8WfiMLLHzpkLJegA1RVVeXPLHIPko4FDkxd1drPoGMS?=
 =?us-ascii?Q?oBgD7qom9ByMDL9REEC4hiS9ZKGIZT5KzeXuDeThBFB6xqWnLZTFaKW5lB5U?=
 =?us-ascii?Q?zaZqYmhtozm5+0u7kX9isVDA/hw03IlrVkPuyfoWqpm2Whx1vIxD2AT9pnt3?=
 =?us-ascii?Q?MjFK844PHZMFu/AKJBOuyFzULsRX7W/qzo+VOA2aEe/BJrMlwYqr2AInfdsv?=
 =?us-ascii?Q?eb289k64w+HYJLgBX2MCWZkymDARPzDAkr5ddVkc4HM7N4BJH0NLr8qnhZrc?=
 =?us-ascii?Q?qxigwtyCSLOIMKcvqDfm0sg5lMWIGwYF4npGb/2t/zr7dWqzHeUhRPcHtGfG?=
 =?us-ascii?Q?m0symh3uNNlSJhPBC7oDuHhoIVMNNIbscKAFSIh1I09PabCXYY1LWdforEdE?=
 =?us-ascii?Q?mfJ52mcK7c/jHVgfh85EeYpUhmjEbuapd+qR8JKz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c083ca0-0c9d-48f1-f12f-08dbf0876f81
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 03:01:08.5768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HW3zN0PeQaFSHdaU9rMZDCwDyndiGSXQdZRIYo7vv/kkCbI1sq4DUYj5O1ppiKS5irQovDogdU7xqapkxV82OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4996
X-OriginatorOrg: intel.com

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   d7f1e9eefb0ffe8ed37933b2dbd1806401f5beaf
commit: 4fb0cc41147989b09a86c615141abfd6b9e6a953 [59/72] media: ccs: Support frame descriptors
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311290754.2apI277B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202311290754.2apI277B-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/media/i2c/ccs/ccs-core.c: media/v4l2-fwnode.h is included more than once.

vim +30 drivers/media/i2c/ccs/ccs-core.c

  > 30	#include <media/v4l2-fwnode.h>
    31	#include <media/v4l2-device.h>
  > 32	#include <media/v4l2-fwnode.h>
    33	#include <uapi/linux/ccs.h>
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


