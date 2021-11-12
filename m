Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFF044E2EC
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 09:19:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233189AbhKLIWf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 03:22:35 -0500
Received: from mga02.intel.com ([134.134.136.20]:26932 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230464AbhKLIWe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 03:22:34 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="220304196"
X-IronPort-AV: E=Sophos;i="5.87,228,1631602800"; 
   d="gz'50?scan'50,208,50";a="220304196"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2021 00:19:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,228,1631602800"; 
   d="gz'50?scan'50,208,50";a="471086979"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga002.jf.intel.com with ESMTP; 12 Nov 2021 00:19:41 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 12 Nov 2021 00:19:41 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 12 Nov 2021 00:19:41 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 12 Nov 2021 00:19:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SuqlkffTPN9jpDn9zt8DlO+VKLLcprmPeO7G66HqnnKLeB2I/yyyTmMxJIbuVHqE/4NVKQvE/+ttXKmGUKNbxgf98giuGDC4OnjV2VrMHBAvmdM1WdwNjx+BKR1o0H3ctF2AuWmlrSNsNNLv8fpWBHBmHhQm6aRwyFDnBKnutmw7MpkCboTbM/kEC+BeB515RgZkbSAxP9oBuihoU4/61GkpsDk1/zQEop76CzcPbWgX06XTqgIH1CeSjHuTVR5JJFAIIFaybO4aQx+EfHKngJCHHKsa3TrrGIE0gaeY3dqzFrnhYEIRFZGvaMkWqy9ONRxPCrC39/hvqTJPZJPOGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByflvSAORdb9h4i6a0qLB2Oja5yxkkdtiZ8BW2FlMG8=;
 b=WuRKDjznuXjY+Q4TMO0oBKR6F6pRYNT7bWTKrrGh1zMhEe9P6Rni4lkQ0jaIZRfx4lf1EulAB90Bkx9srzDx5U6RAmWQmCD15lXak/XWsjgML3BZo2SMXkdCXvZW+kRSCfN6mO7wTmY4KI6XyTYgjH78+IXzvkoJn0EJrWcTLLVv8NnnKD8lmRvJXoS94B2rkWYFfvC4Q7VDc6N2UHqGuxy1YTN4tJmFkCGWzCuD6oURBRG+f1wrqfo8zMqOFAVUmbUQc+yEBpyzm0L9Aa77sum6fO1LVZNWGtIym3ZyiR82ot1njHPiXYOdfD6gw9jxPUc4EzoDfhFkpqdPN5CGuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByflvSAORdb9h4i6a0qLB2Oja5yxkkdtiZ8BW2FlMG8=;
 b=lmr5TBWfDT3e91KrX3Trs8EGXD/B+5IYNJSXz7BNYAS0R3thw5NT1kenb04D7GC4kC2CgEcXj2dONJXZylgpODMXD2UtkgqFVPu1VxtwWDVDhUK4kW6FEABu4Q0iXrHIQNH42vHeoBTIJOMKMc1DOJVVlhhSrjkABVsEZIe8B14=
Authentication-Results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by SJ0PR11MB5615.namprd11.prod.outlook.com (2603:10b6:a03:305::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 12 Nov
 2021 08:19:39 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::3455:d126:2541:7723]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::3455:d126:2541:7723%2]) with mapi id 15.20.4690.019; Fri, 12 Nov 2021
 08:19:39 +0000
Content-Type: multipart/mixed; boundary="------------mc8mXMnrEk4FI8VYVzI06Qls"
Message-ID: <28564d1c-6620-b57f-84f8-0e6319974456@intel.com>
Date:   Fri, 12 Nov 2021 16:19:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: drivers/media/platform/qcom/venus/core.c:377:2: warning: Called
 function pointer is null (null dereference)
 [clang-analyzer-core.CallAndMessage]
References: <202111081514.Lq3LTsjm-lkp@intel.com>
Content-Language: en-US
To:     Mansur Alisha Shaik <mansur@codeaurora.org>
CC:     <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
From:   kernel test robot <yujie.liu@intel.com>
In-Reply-To: <202111081514.Lq3LTsjm-lkp@intel.com>
X-Forwarded-Message-Id: <202111081514.Lq3LTsjm-lkp@intel.com>
X-ClientProxiedBy: HKAPR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:203:d0::20) To SJ0PR11MB5598.namprd11.prod.outlook.com
 (2603:10b6:a03:304::12)
MIME-Version: 1.0
Received: from [10.238.2.77] (192.198.142.18) by HKAPR04CA0010.apcprd04.prod.outlook.com (2603:1096:203:d0::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend Transport; Fri, 12 Nov 2021 08:19:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fc7b7c4-dbff-4ddd-28d4-08d9a5b52be7
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5615:
X-Microsoft-Antispam-PRVS: <SJ0PR11MB56157A5AA478CB06AC7F1260FB959@SJ0PR11MB5615.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uQ6TxSrtRDS8t/n/78ZKcaEgs98XnNaQdOD5pZpmuEJLrKmk1fhaCFMgrmyWU+/v5eJCpe0fiatBSxl2Z/E3wTLWoprEbZ+r95Sn4KBO5Da6bYuotJYsGABwS//eCnoB+KnSB7fE1uXzxKnH+NbJ+DKdp/cLZuRkZ1mjf6RM7a/0lYSsoh8vIGcb1yC4TJH4Dmk+gm9NKtWt7aSH5ZWQT1Z0ihBxq+i08DZt1R2m1hktx6ufTn1bbVAliq79fKD2x/BSXBJ74C3utFsF7o//LyKKtrpXzDatuT4ORddV8/LYxUoVxuL7CGvY/JO4usGB/68CQ+G8wITE1D0PKjPfY4a6HHrEXdDJ9jFRforvhdhSuaGYNRd4OvdSCKkAK9ZD+2i+xMqVNXOEVu5A59rrUNxUggxfviQy5CGHYT77sbTbUqmPdZVgXctZZU0G6imEUc3QqHSN0sx3isQidUGnt0EzMgNKP++rP/92zJXxMZ7edaSpDU/JTW11XR9ZaP0SNyCQ34cTQpyggmfpTC+CPbt7sBJI+zsqRos/w5bU46v5kocKKkTNDam4vYTpP0ZUh8G9VmwiJS0XYrPyUh4WuCZCF1RRKlZInokx/0LLc3Flt4bgfeGPdkYlw9cYhB03FwMHqnoibKVKK5VJmL5V3xdvLNLuVl5hSV328KQT+upnZCCX+p4NoBP55s9jK0CjmJ+0LLc4jTcOGH+C79dzY5yvJAIX1KuV6c/7DGXG1PCTgeiIrTxF2Sv2Oq9dZg8TwVyWSWMxL3SENiQ+g/UrAuDET5/125+TZ/6J7qNVuzhyizwxoi7rKgBM24R7M6uY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(82960400001)(4001150100001)(5660300002)(966005)(2906002)(316002)(16576012)(31696002)(33964004)(235185007)(31686004)(38100700002)(54906003)(86362001)(6486002)(6666004)(83380400001)(66476007)(2616005)(956004)(4326008)(66946007)(6916009)(66556008)(8676002)(36756003)(186003)(26005)(8936002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXFBeDdzWjhkelYyQ21ZUnNFdzhudzlVWkdWNTk4aG81YVUzN0w3ZTJyQ2or?=
 =?utf-8?B?a3RtbEh1bUNwalhhc3BIM2tvSVZhT2xCT2s1TWJWbmo5SGZoc1UrWUNxSjhV?=
 =?utf-8?B?MlJEdzhYRitaRXRGa0FzUERxVThsa1pNNXpvVEl0U1BtQk54QTh3MnhHcWtx?=
 =?utf-8?B?M1BKQ0s1Qmd1eHZLcWtCK0ZEc3RvSFdRMUVZdHhLVjlmaFVwa2taOGYxTW5t?=
 =?utf-8?B?ZUJrU1hIbXFnM1E4ejVmYmFTRHZQZWRXam15NjVUcjQ0ZzNVaTZKMVA3NTFF?=
 =?utf-8?B?bUNma3ZtVHBweGFWVkp5am5DSFZ4elJ3Ry9PZHZlU25xSFVxeFBTS0hBL1BZ?=
 =?utf-8?B?ZUFxVDlEQWRmWkxHRGpMODV5ZmF5YXdIZTE1L1hSVGtBUWZjYS80ejVRRFZK?=
 =?utf-8?B?Ym1EN1kwRUdJbWE3OEdia3htNlU1U1U5bTNXNGZKaW1RK1c3dFozOFZuK2VX?=
 =?utf-8?B?UzdxUEJBbVQ0bExKVkZyUk5YcFBtMFhLdDgyVGdaZGk0Q2FsY2UyVUZVVnla?=
 =?utf-8?B?bDFMcTlHSW4yOGNSNEcyaXFPVWw2ZzY5NWlnenJrbzNTT3MzUzB2RForZHhB?=
 =?utf-8?B?bzdsaUtXYUdBSE1xdnpWNElua1c3eXF6MzZwTEhuZmpOOWFqWkdmcklLSGor?=
 =?utf-8?B?RExlcjRzRkZXS0ZuTVlxbk9hSVZYU2t2UVhlbVN0V0hnS21NeHo2T2V3ZUcr?=
 =?utf-8?B?OTF5dGNxYWlxeVNKa0xmTytRUFVSOTd6QWp4S3I0c0k4ZmUwQ2xUekpoZE1o?=
 =?utf-8?B?M3lXTktSQW1EWU91bUJNR1hxK2ROSDllTDhZMnhhc3R2SFhLVzJhQmNXY0py?=
 =?utf-8?B?YVkzR3lod2VNYXdmOGZNcTdZM1dza0E1KytZWU5WUWwxcGRrWmYzYlJ3MndU?=
 =?utf-8?B?S28rdGFYWjdGL2k2b3o0RVpjNUNpbWU2RGE3TTZacElmMmErTWlzSGZJS1ds?=
 =?utf-8?B?TGR0UnpENk8wd256eWY4S0pvNDRnREcxdlF0NVpvRUt1WGE3bjFRUHkwaEpz?=
 =?utf-8?B?YVMrNUVMbC9BeWR3UlFnOGVxdG9CRXd4cEhqOVR5c2lkaUtoa0NjUjBxVVBG?=
 =?utf-8?B?NTlTZ3ZrNUxHczhmQ1FUNnlsRzZRazZTdnBmdVludXVhc0hJdXBDd2RPU2Na?=
 =?utf-8?B?ZUlJMDJvY1RHOUZ1Q29wVFRoQVdSa05JczRIUDI3SWxFZHQzL1pDVFlENTBw?=
 =?utf-8?B?NnJvV3ZtN0h6c0FGMWJOR0RLVlkvOER2cW5jckpjaHI1VGNyU0FWVWVsS0M5?=
 =?utf-8?B?aHQyM2JrWElyTXFhU0d1ZzloZjd2RlFxNjlXMEJZREFCL2xTSWVOV2N6a0JC?=
 =?utf-8?B?WmV3UzcvbkRJU0ZwSDU4aTgzdjRFSlhPOGlvb2tQU1VYZGtuREkrcGY1cW05?=
 =?utf-8?B?dmp0TE1DNGYrSk9hQklMVE9QcDBHbFltZ043UFYzRHMybGhURzVQOHVPSGhH?=
 =?utf-8?B?aDVRMkwwU1ZSSmltSHRnU0pNaElLckUxenZya0tlakhyaHFUTlltTkdsU3do?=
 =?utf-8?B?MzF5dkthbVYwYlBReUZiaThvUHh0MDNES2F6Zko1bFRFMElsTWN2a2R1bGZZ?=
 =?utf-8?B?OUMxYzRKcmo4QllRTG9JM0hSM2pHWExCemtGc0VraXNOVDJiMkNhWm9Ibms2?=
 =?utf-8?B?eDVPNzhpWEp6cFA4M1l2Mk93SXhkZlBxeVlRVCtJMm5EaC9zdDhuZW5VQlcr?=
 =?utf-8?B?dkk5SVFFMmpFOXpNWDR4cklTUk9GSTFEVlFTbzdyK2VvV3l3UkNQdzZqS2I5?=
 =?utf-8?B?LzVzWjF4SGZOYXVueHBLRFVwRW8zSWlJT1FKazNJN2lEL2ptM1lITmR2NGJW?=
 =?utf-8?B?TzhOWGhQbW55cyt5d3RiRjgzSnYwaTFFbXZJbHhtR25kVzZCR0VkelBQM2Z1?=
 =?utf-8?B?VjNOUVpCNUtvemlTOUQvVTFObm9aZTFaNHlrclpVNHJaQ3pNUmhuUEdEZzNr?=
 =?utf-8?B?QnRDU1RySmdieW5vL0YzQTlUbHZKbytNTTJwbnFrSnkzT0lZV01oeUdqR2RK?=
 =?utf-8?B?cTdjUnZLR1ZmSnQ4STRqTHlGdFF0L0pneW1VR3BoYWRHQkI1ZGtQYjdMWnAw?=
 =?utf-8?B?TlBFUTd4ZE5DYVc3TDloeE40UDNINWhzM3piWXFhYnZra1hsT2NSUkVLcmQx?=
 =?utf-8?B?aDN5ZFRpRWpQd2NzNmJDM0NMTnhUcitCYVJheklnc251UFQvam8zVTVjeU1L?=
 =?utf-8?Q?RVLnsUgloQGMY57OqA649zQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc7b7c4-dbff-4ddd-28d4-08d9a5b52be7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 08:19:39.6437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLToYlu1E8YqZ+HY6PN2OyBwXZT3ZJKj8CwmpYk9WXym4s28tEn91LmsEnMdgQdydo4poxWAIhv3i3Bj88GnfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5615
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--------------mc8mXMnrEk4FI8VYVzI06Qls
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6b75d88fa81b122cce37ebf17428a849ccd3d0f1
commit: 9e8efdb5787986cc0d0134925cf5c4f001bb3f2e media: venus: core: vote for video-mem path
date:   12 months ago
config: riscv-randconfig-c006-20211001 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 962e503cc8bc411f7523cc393acae8aae425b1c4)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # install riscv cross compiling tool for clang build
         # apt-get install binutils-riscv64-linux-gnu
         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9e8efdb5787986cc0d0134925cf5c4f001bb3f2e
         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
         git fetch --no-tags linus master
         git checkout 9e8efdb5787986cc0d0134925cf5c4f001bb3f2e
         # save the attached .config to linux build tree
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> drivers/media/platform/qcom/venus/core.c:377:2: warning: Called function pointer is null (null dereference) [clang-analyzer-core.CallAndMessage]
            pm_ops->core_power(dev, POWER_ON);
            ^~~~~~~~~~~~~~~~~~
    drivers/media/platform/qcom/venus/core.c:358:6: note: Assuming field 'core_power' is null
            if (pm_ops->core_power) {
                ^~~~~~~~~~~~~~~~~~
    drivers/media/platform/qcom/venus/core.c:358:2: note: Taking false branch
            if (pm_ops->core_power) {
            ^
    drivers/media/platform/qcom/venus/core.c:365:6: note: Assuming 'ret' is not equal to 0
            if (ret)
                ^~~
    drivers/media/platform/qcom/venus/core.c:365:2: note: Taking true branch
            if (ret)
            ^
    drivers/media/platform/qcom/venus/core.c:366:3: note: Control jumps to line 377
                    goto err_cpucfg_path;
                    ^
    drivers/media/platform/qcom/venus/core.c:377:2: note: Called function pointer is null (null dereference)
            pm_ops->core_power(dev, POWER_ON);
            ^~~~~~~~~~~~~~~~~~


vim +377 drivers/media/platform/qcom/venus/core.c

af2c3834c8ca7c Stanimir Varbanov   2017-06-15  347
eb918f915f5bdf Arnd Bergmann       2017-07-17  348  static __maybe_unused int venus_runtime_suspend(struct device *dev)
af2c3834c8ca7c Stanimir Varbanov   2017-06-15  349  {
af2c3834c8ca7c Stanimir Varbanov   2017-06-15  350  	struct venus_core *core = dev_get_drvdata(dev);
7482a983dea3b8 Stanimir Varbanov   2019-12-05  351  	const struct venus_pm_ops *pm_ops = core->pm_ops;
af2c3834c8ca7c Stanimir Varbanov   2017-06-15  352  	int ret;
af2c3834c8ca7c Stanimir Varbanov   2017-06-15  353
af2c3834c8ca7c Stanimir Varbanov   2017-06-15  354  	ret = hfi_core_suspend(core);
7482a983dea3b8 Stanimir Varbanov   2019-12-05  355  	if (ret)
7482a983dea3b8 Stanimir Varbanov   2019-12-05  356  		return ret;
af2c3834c8ca7c Stanimir Varbanov   2017-06-15  357
21926d466e3a4f Mansur Alisha Shaik 2020-10-19  358  	if (pm_ops->core_power) {
21926d466e3a4f Mansur Alisha Shaik 2020-10-19  359  		ret = pm_ops->core_power(dev, POWER_OFF);
07f8f22a33a9e3 Mansur Alisha Shaik 2020-04-10  360  		if (ret)
07f8f22a33a9e3 Mansur Alisha Shaik 2020-04-10  361  			return ret;
21926d466e3a4f Mansur Alisha Shaik 2020-10-19  362  	}
07f8f22a33a9e3 Mansur Alisha Shaik 2020-04-10  363
21926d466e3a4f Mansur Alisha Shaik 2020-10-19  364  	ret = icc_set_bw(core->cpucfg_path, 0, 0);
21926d466e3a4f Mansur Alisha Shaik 2020-10-19  365  	if (ret)
9e8efdb5787986 Mansur Alisha Shaik 2020-10-19  366  		goto err_cpucfg_path;
9e8efdb5787986 Mansur Alisha Shaik 2020-10-19  367
9e8efdb5787986 Mansur Alisha Shaik 2020-10-19  368  	ret = icc_set_bw(core->video_path, 0, 0);
9e8efdb5787986 Mansur Alisha Shaik 2020-10-19  369  	if (ret)
9e8efdb5787986 Mansur Alisha Shaik 2020-10-19  370  		goto err_video_path;
9e8efdb5787986 Mansur Alisha Shaik 2020-10-19  371
21926d466e3a4f Mansur Alisha Shaik 2020-10-19  372  	return ret;
af2c3834c8ca7c Stanimir Varbanov   2017-06-15  373
9e8efdb5787986 Mansur Alisha Shaik 2020-10-19  374  err_video_path:
9e8efdb5787986 Mansur Alisha Shaik 2020-10-19  375  	icc_set_bw(core->cpucfg_path, kbps_to_icc(1000), 0);
9e8efdb5787986 Mansur Alisha Shaik 2020-10-19  376  err_cpucfg_path:
9e8efdb5787986 Mansur Alisha Shaik 2020-10-19 @377  	pm_ops->core_power(dev, POWER_ON);
9e8efdb5787986 Mansur Alisha Shaik 2020-10-19  378
af2c3834c8ca7c Stanimir Varbanov   2017-06-15  379  	return ret;
af2c3834c8ca7c Stanimir Varbanov   2017-06-15  380  }
af2c3834c8ca7c Stanimir Varbanov   2017-06-15  381

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--------------mc8mXMnrEk4FI8VYVzI06Qls
Content-Type: application/gzip; name=".config.gz"
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
RdTCaxVU9/8B1anRBPfPAQA=

--------------mc8mXMnrEk4FI8VYVzI06Qls--
