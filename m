Return-Path: <linux-media+bounces-5399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1CD859A5A
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 02:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7E51281315
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 01:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2739BEDD;
	Mon, 19 Feb 2024 01:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BDf0qcE2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C2F163
	for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 01:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708305380; cv=fail; b=FkqOULHbreYxfJAgPP/muC9auARZKWMwCkjUHaxS31T+jS/S8Lg1829anjE7qdysedyxrKXC88KyGakoJE6VHukz6U8cc+ifDqWc2jJVb5AuWBpsXKPdFZg1C4wf0L3eJBN7bPzmuJxIF4i7dIGoxvdAr8W6eI5WQrQvp8xkR9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708305380; c=relaxed/simple;
	bh=BoZQ0y5ni6P/kQSDC0gTfYqX2oiWd8yP0iMfeSpmM44=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Suym0FeE0VleEvOcj23dihT+YzMLWuf8oFizq/+hKeD4ChIksrlE6BdTYTaymiWCA7mDUPymPS6EaXqA4m6uIVd59oAx4a8KYAAyoOL0NLFSeNJtRqFGRM4y+K9aZZx80DzkflTpy90TFrKyDgdsmrYYkF5xI99L6HUL0nx6iOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BDf0qcE2; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708305379; x=1739841379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BoZQ0y5ni6P/kQSDC0gTfYqX2oiWd8yP0iMfeSpmM44=;
  b=BDf0qcE2Ap16uqGmq4AKCY3JkHSf59WNarJKgxbLkP1zK855ZrkU217F
   YdyCJppZ2vyGswixjsbbp4Ad5R/uty7kqC9NYSaY/IKnzaRxge+XJ4EC0
   ZTUGvA519ZfalDd9PYytqwAjmkIRPqYIEmgT4S8ktMdKQATEtkgCZzxXE
   F/LAx4Gmxz9BSHix4dpMDYkCcpzy3UMrQAOHZcpTI0+D4O91mVyMvbj/v
   foy6hiCbmVGDeMw3ktLZk+oiHAXmpkfDWIsd7GjKh38fJDJCE7XAp4Ogj
   fGu/GDq/I5m/DdN9W34j5y8aeCOyk4NGiRIyjIAGLfCLV4BHRSoRHyQf2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="6194180"
X-IronPort-AV: E=Sophos;i="6.06,169,1705392000"; 
   d="scan'208";a="6194180"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 17:16:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,169,1705392000"; 
   d="scan'208";a="8956270"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Feb 2024 17:16:17 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 18 Feb 2024 17:16:17 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 18 Feb 2024 17:16:16 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 18 Feb 2024 17:16:16 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 18 Feb 2024 17:16:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C00bzru6OplZMeusPj9cZU0NlzoC3WlSpF1amjKvV58TcAgXdvK4Fvdkb25kASJuu1OATMwglobNDcGbTKM/QXnuGTxrP+xDwgLfnEsOV6vyZljYxA0thDiWNUHspZ4IjMuQENWPW8YHvb05Bm3nsPprTHkVw7lTLD+ALTflnA2QyycdFzOZX+WGXQ8HXeksMOnhaGuFki7HRIIEyRqP3XF2j4bizo4ZS5kIAR2xn4Gwem9i7f2+8NXYbaQQgYLfOcZU6MsfWHLUVWSpNVyhfKd7jiU1GOeAkX95W3rJIY7hP5ZuUnpSzXPUmQw62FNc0X4mQR4vcLc5npas7zuGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHx/1SUUx0myOAcJuKKnogaymYfjl3VCjWUrCRGGPMI=;
 b=Qw9FPprPMXy5G0gxHanBztH2uO+tSqMLH5CXe09qHbyUvxc0U8bwzwAFwwMOoiOGURNZrMk423EpXbWLS3W5d7w1BXO+ksp27DhA8OiRGMEcba8BHwxqIhh7w6OO4NMeA//sGk23/EkhywryeqlEeUZ6SPKLV9fMON/XlOx2E0C7FiSu9itplucOFwZr8u+HnDCIkXVxnkCNXsDM7Ag2bQZYt9LnKQK0ER/OzTwgpKA53K/cwAgkKKwYduOZHVEOJKNeeB+FNS+ozYX3EVu1AMeT2SsnUkg4KXFvt08Mexai86NoUCBeMVXGSWFHjexesVGzGJwERN9GH7IVytZJYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH8PR11MB6777.namprd11.prod.outlook.com (2603:10b6:510:1c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.34; Mon, 19 Feb
 2024 01:16:14 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7292.029; Mon, 19 Feb 2024
 01:16:14 +0000
Date: Mon, 19 Feb 2024 09:09:19 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Bingbu Cao <bingbu.cao@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-media@vger.kernel.org>, "Sakari
 Ailus" <sakari.ailus@linux.intel.com>, Andreas Helbech Kleist
	<andreaskleist@gmail.com>
Subject: [sailus-media-tree:ipu6 59/63]
 drivers/media/pci/intel/ipu6/ipu6-bus.c:109:13: error: 'struct device' has
 no member named 'dma_ops'
Message-ID: <202402172115.mTvvIxnQ-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH8PR11MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: de778922-967e-4144-7b6b-08dc30e85db5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OboIEY0E0DSPk2rnX44+Uud27WWcMwnNVjIZQHkB8UsToewqDDwFSuBdkohbfT0Kqe6IStl5WKX/I+9OFKudVbTBTAx17OqpUGrEbRldkQTa3JBPtW9Y1jKHYg0qRTdqByRchyCARgd8GtBWQny3GKs1xu6/XQ95F3YI3AEqDGdTLVLN388J0qYD4f9Fv8ukHyWjDGPibyye+mwdq7B0WVyVkXxH6gMRDhdgzScqxZ/lItn0bgDju51N+xR876A6smYwEQEsrOe3Ud5NGqc7UqocZsQQ/8Daq4Oaq38jolopsxuaGhx6I/nUlrcoZtnVFAKqyLyM+m3ZA2siHDRCWrwKZVLQL79FSbVnCh8XRRluUKMcMYE6bj/eL5CLGp15V8mR9vFLvKVXfoPLNZtx+J3yLHxSgXutHUgpFHwqQhLDkvga5YlaMLsAlet5Cnci5tz17k6tDQRA5H5BNrl8L2O35ut3cBjp47yWvpVjIu99ICZc8XgYChCbND6FNnMJiy074NmYNGJrbaqsP5e10nN+GAQXMhw4QVJvkoCSrw+oVWenPlj/257sw7ne+Dmw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(376002)(366004)(396003)(230273577357003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(316002)(37006003)(54906003)(5660300002)(2906002)(8676002)(4326008)(8936002)(66946007)(66476007)(66556008)(6862004)(86362001)(6636002)(41300700001)(6486002)(6506007)(6512007)(478600001)(2616005)(36756003)(26005)(966005)(1076003)(83380400001)(82960400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nwe0bKB3xFJLUymRcaDsIcOK3cwBzC7hSH2SClyFKZfpBjH/d9oa3CDHgXCR?=
 =?us-ascii?Q?8NVJtf+PzjRJ30C522si8D8t6I99DruMwbBBiYXrLOakGc6XdC8jHh02iONv?=
 =?us-ascii?Q?H9BVTzmlNQhMwTm4+wXg+M6+H5oi6LYrbCaZVSuuJJ/lPIfD+G34N6JAzt2c?=
 =?us-ascii?Q?rZwlH2oiCdlmu9c18xbpyZulcgyWWk6eJ4zVTQ0pSjwGSZWFA6awJYVl+eUQ?=
 =?us-ascii?Q?yT0eESFuF6emeQ325cBay1phEoATV3p0/Dyu6GCJ7D/USths0LGIr7unGqRy?=
 =?us-ascii?Q?B0vGDj2JdhoEALY2DIo7pdMoSIILUAEcnGNM3YZSNTcl9zR+nbllGivk6yNC?=
 =?us-ascii?Q?RRxrM9Qnt8pIi9YzPdiwj/PIyaDl6QzQCrY5Lw02IbctPYDMKgezJ8QqdYsL?=
 =?us-ascii?Q?BibhC5oKZduE+3Xmerb4rZI5WakoilsAN8gg0nF5nc8ufGo/kZaJcYp8MHXC?=
 =?us-ascii?Q?4q6BtU/WFVwEUTmbgU7cIu1diVJwkkTJk0NIuZuweRJEyl1u6T0V69riZm99?=
 =?us-ascii?Q?kIxq+nc1dCWOAPT9QVvBg2Y82HE2Uz3nhhniGt//apfGl7b59S6/dyX548K9?=
 =?us-ascii?Q?ug68nOYAi+vhhtxZM3xx7J02+ZqC7wMN1Cyv6DNPd+sfeVaaSp/C+B6JKort?=
 =?us-ascii?Q?Wfl5tDIRtSNHsVqDKQwoyrz1UwRlcgBq5nPNFr6gxFPvaC8nEf1sZbE9bajI?=
 =?us-ascii?Q?DBtvd59kPAB7DSOQb3pzefIMI2HSu62KCOa+jIivvgL/kkXiA+Iln24OoN8t?=
 =?us-ascii?Q?4aLnZAiXXhFHu0LEn45OBeYdPCLttTyIjFBw24i/uonfIea/jGfgopg2OBKx?=
 =?us-ascii?Q?qNniH1OV94LPrNSE0BtHrKg7tN5c7QHkQ5QeSRYtocDwk2xPnz8uVqot1p9r?=
 =?us-ascii?Q?jYJXfQqlzh+DNsz8zp/Blp4F0z/txnp2g4frnZWqRDpphMncX1rBb2N1mCyH?=
 =?us-ascii?Q?ZbbII1LX/N1ZWX1D60tog9Rvi8MWG/rOJ7+wbF8QvDFe8iuyy0Ldsf7iyEN7?=
 =?us-ascii?Q?FzqwrFk5aADpv2Zt9yNGWLa+/FeOI07e1wVcPcSiBgZSoTgeuV3foFTwe6ka?=
 =?us-ascii?Q?3rMvVivQMAJxq2OEEmaHWippdT/lzj4yLAHEdpJeWioHPrRjl6z/PF19nUmA?=
 =?us-ascii?Q?+aWSp7/5PG+Qm1FPAqSSbWsqsizypWOUdFRPmKWrLzCbdEl59KcUq6mzg7pg?=
 =?us-ascii?Q?J5dtJ6KK1PA4NT+rFLJ21J1vGx3GU9V+EXvEnjc6qKGB6VTtGfYanRV0JEO1?=
 =?us-ascii?Q?E/EUcI2mjPm0WJbrC4kXpYVqyXGgDRO5/aU+INNEd9qKY1QNpGXDpHSQwWwe?=
 =?us-ascii?Q?cUjAkC9fwyLhSwa1eyg7FpGklAHNt3kvQauBnqgM+uYeN5nW4+hP0umQqIYF?=
 =?us-ascii?Q?4USXwbOEsznlY8Wn5x0E2tbjxvBEFNJpGVUkQ+2HiLQt1fZdxnUJZHM9WGhe?=
 =?us-ascii?Q?yOKb3aZtLV9re0pSeAykZlMkmJjcUcOYAAVfNw4abQiJ5FGUnWVYZBm+z5Zf?=
 =?us-ascii?Q?QR3mwe5Q9obs2vpHwMhhVFFDe0ECzJ3xig65H5xKAYNLhorFOljQdLj4vS3o?=
 =?us-ascii?Q?vS85ts2PVqmhjQDkvoIj+ieNd54tfrFrnvJ+HZeX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de778922-967e-4144-7b6b-08dc30e85db5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 01:16:14.4302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YbMC4LscMsY3KhCaiYcuv62Tviw/zvQPW8XgyXkVkyfNAMeExnlh/ee8vij4YBEVLbp0+S6t7ypNgqX8k+fjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6777
X-OriginatorOrg: intel.com

tree:   git://linuxtv.org/sailus/media_tree.git ipu6
head:   31343acd3c3ab852367e3f986d12b5e743d5c5c5
commit: 736ca9b346fc52b187fc620f36b20ec7dc9870d1 [59/63] media: add Kconfig and Makefile for IPU6
config: x86_64-randconfig-123-20240217 (https://download.01.org/0day-ci/archive/20240217/202402172115.mTvvIxnQ-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240217/202402172115.mTvvIxnQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202402172115.mTvvIxnQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/pci/intel/ipu6/ipu6-bus.c: In function 'ipu6_bus_initialize_device':
>> drivers/media/pci/intel/ipu6/ipu6-bus.c:109:13: error: 'struct device' has no member named 'dma_ops'
     109 |  auxdev->dev.dma_ops = &ipu6_dma_ops;
         |             ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - VIDEO_INTEL_IPU6 [=y] && PCI [=y] && (ACPI [=y] || COMPILE_TEST [=n]) && MEDIA_SUPPORT [=y] && MEDIA_PCI_SUPPORT [=y] && X86 [=y] && X86_64 [=y]


vim +109 drivers/media/pci/intel/ipu6/ipu6-bus.c

eaad32dd9543c6 Bingbu Cao 2024-01-31   82  
eaad32dd9543c6 Bingbu Cao 2024-01-31   83  struct ipu6_bus_device *
eaad32dd9543c6 Bingbu Cao 2024-01-31   84  ipu6_bus_initialize_device(struct pci_dev *pdev, struct device *parent,
eaad32dd9543c6 Bingbu Cao 2024-01-31   85  			   void *pdata, struct ipu6_buttress_ctrl *ctrl,
eaad32dd9543c6 Bingbu Cao 2024-01-31   86  			   char *name)
eaad32dd9543c6 Bingbu Cao 2024-01-31   87  {
eaad32dd9543c6 Bingbu Cao 2024-01-31   88  	struct auxiliary_device *auxdev;
eaad32dd9543c6 Bingbu Cao 2024-01-31   89  	struct ipu6_bus_device *adev;
eaad32dd9543c6 Bingbu Cao 2024-01-31   90  	struct ipu6_device *isp = pci_get_drvdata(pdev);
eaad32dd9543c6 Bingbu Cao 2024-01-31   91  	int ret;
eaad32dd9543c6 Bingbu Cao 2024-01-31   92  
eaad32dd9543c6 Bingbu Cao 2024-01-31   93  	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
eaad32dd9543c6 Bingbu Cao 2024-01-31   94  	if (!adev)
eaad32dd9543c6 Bingbu Cao 2024-01-31   95  		return ERR_PTR(-ENOMEM);
eaad32dd9543c6 Bingbu Cao 2024-01-31   96  
eaad32dd9543c6 Bingbu Cao 2024-01-31   97  	adev->dma_mask = DMA_BIT_MASK(isp->secure_mode ? IPU6_MMU_ADDR_BITS :
eaad32dd9543c6 Bingbu Cao 2024-01-31   98  				      IPU6_MMU_ADDR_BITS_NON_SECURE);
eaad32dd9543c6 Bingbu Cao 2024-01-31   99  	adev->isp = isp;
eaad32dd9543c6 Bingbu Cao 2024-01-31  100  	adev->ctrl = ctrl;
eaad32dd9543c6 Bingbu Cao 2024-01-31  101  	adev->pdata = pdata;
eaad32dd9543c6 Bingbu Cao 2024-01-31  102  	auxdev = &adev->auxdev;
eaad32dd9543c6 Bingbu Cao 2024-01-31  103  	auxdev->name = name;
eaad32dd9543c6 Bingbu Cao 2024-01-31  104  	auxdev->id = (pci_domain_nr(pdev->bus) << 16) |
eaad32dd9543c6 Bingbu Cao 2024-01-31  105  		      PCI_DEVID(pdev->bus->number, pdev->devfn);
eaad32dd9543c6 Bingbu Cao 2024-01-31  106  
eaad32dd9543c6 Bingbu Cao 2024-01-31  107  	auxdev->dev.parent = parent;
eaad32dd9543c6 Bingbu Cao 2024-01-31  108  	auxdev->dev.release = ipu6_bus_release;
eaad32dd9543c6 Bingbu Cao 2024-01-31 @109  	auxdev->dev.dma_ops = &ipu6_dma_ops;
eaad32dd9543c6 Bingbu Cao 2024-01-31  110  	auxdev->dev.dma_mask = &adev->dma_mask;
eaad32dd9543c6 Bingbu Cao 2024-01-31  111  	auxdev->dev.dma_parms = pdev->dev.dma_parms;
eaad32dd9543c6 Bingbu Cao 2024-01-31  112  	auxdev->dev.coherent_dma_mask = adev->dma_mask;
eaad32dd9543c6 Bingbu Cao 2024-01-31  113  
eaad32dd9543c6 Bingbu Cao 2024-01-31  114  	ret = auxiliary_device_init(auxdev);
eaad32dd9543c6 Bingbu Cao 2024-01-31  115  	if (ret < 0) {
eaad32dd9543c6 Bingbu Cao 2024-01-31  116  		dev_err(&isp->pdev->dev, "auxiliary device init failed (%d)\n",
eaad32dd9543c6 Bingbu Cao 2024-01-31  117  			ret);
eaad32dd9543c6 Bingbu Cao 2024-01-31  118  		kfree(adev);
eaad32dd9543c6 Bingbu Cao 2024-01-31  119  		return ERR_PTR(ret);
eaad32dd9543c6 Bingbu Cao 2024-01-31  120  	}
eaad32dd9543c6 Bingbu Cao 2024-01-31  121  
eaad32dd9543c6 Bingbu Cao 2024-01-31  122  	dev_pm_domain_set(&auxdev->dev, &ipu6_bus_pm_domain);
eaad32dd9543c6 Bingbu Cao 2024-01-31  123  
eaad32dd9543c6 Bingbu Cao 2024-01-31  124  	pm_runtime_forbid(&adev->auxdev.dev);
eaad32dd9543c6 Bingbu Cao 2024-01-31  125  	pm_runtime_enable(&adev->auxdev.dev);
eaad32dd9543c6 Bingbu Cao 2024-01-31  126  
eaad32dd9543c6 Bingbu Cao 2024-01-31  127  	return adev;
eaad32dd9543c6 Bingbu Cao 2024-01-31  128  }
eaad32dd9543c6 Bingbu Cao 2024-01-31  129  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


