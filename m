Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2230B7BC6BE
	for <lists+linux-media@lfdr.de>; Sat,  7 Oct 2023 12:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343806AbjJGKX3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Oct 2023 06:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343765AbjJGKX1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Oct 2023 06:23:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C43A2AB;
        Sat,  7 Oct 2023 03:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696674204; x=1728210204;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0IQIfkJjFn/uLfYIHSU1R09BBtXN0VB/RE04d/S7nH4=;
  b=PvvWGe53pVMYKfJBpobwbkPAgHzuwju98TzLIFqIzJF1vXlHM4X77adP
   CpViRIrYA0u/2UOpgEAK/UA+G2ibqwubzZATbesZoCRaQjUFx4rdSmDCZ
   yUpXteZY5xNToZa6DK0HZo4XHAdnmzBWSWAmAaSAgEgAwX+sbVQ6++9Wo
   nqhhUp1QsbfozJZrXDZ5GPvoN2nOxORvZ/bQrXyi9/OyUtBJJEahI2CX3
   FJk3+jtMsWq6bzCwqHtyk4NZakUNjkm430EmTfVh186jHzpVxhMLB4NPH
   PZpqYaXszkrd1XN8u+XPgfSU8ossMG/WiijKRY/UChhfZeKslh2W8Lbvt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="364198017"
X-IronPort-AV: E=Sophos;i="6.03,205,1694761200"; 
   d="scan'208";a="364198017"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 03:23:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="868647708"
X-IronPort-AV: E=Sophos;i="6.03,205,1694761200"; 
   d="scan'208";a="868647708"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Oct 2023 03:23:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sat, 7 Oct 2023 03:23:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sat, 7 Oct 2023 03:23:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sat, 7 Oct 2023 03:23:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fp34YgSrZJ16I6xD8oAgVgXLGEfdN6YI6AitKdKUX68nejyasqRn6YQ8IFeb4QFvio1m8t9v4gmjYJYK1al5lEhhqCklPQ7Ctji+EbMGiE6rn02u40DYJRqA+Wjj2GEJxqlfrcr1oUn6caBRlviuCXpja9G805HCiwKlDnkK5PXe+G+oRyMZkYfs5z7bWANmUmiFkPldEPfnIUpLd9oN0l/Ew8C7SSRdfr4ictV+er1vfluCOCTN43rJ3D8Lu8RvuiznxulQ+S7ZX4oY4uS81Lp5gcdfaTwUGdhGo/eWmVkQWoTKQPAS0TRCJNK8PJU0MItSFWCWjp1SmieM+RkfMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jjXe8EYMNKQMOXZpocs2DX8V134TtYowodZiI95Mio=;
 b=XjD4Woxh+v5/A8M3612bkAp3HQdkbq8uq7teDkfF+0z50Mc4PWOJOje9MWPGt8OLq4Sc2Lr82nT3lE7gBmd+tUbH6IZdoamG+20aGGPULjdY8qOFmzLWxywNmOYf3/rSi39I29kw1xKk2D4D1afxGlOePlMa8OxzuMhbRUhSHiHMMUde42lA0tHWY2CrFitYNs+J+5U/rTh+Qc68epRJkhamMBl4qvLhxc0IYA26UOqXxeB1CwVMjAujt8tHHZWMlRBKn01tHjYtAXoa8tv0pdOpSU3RuhPRUinXTp60Pd69dmfyYtmoYs20AZTNguhf7M/8xlVt9vCZiFdCSL5ifg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4071.namprd11.prod.outlook.com (2603:10b6:a03:18c::28)
 by CY5PR11MB6283.namprd11.prod.outlook.com (2603:10b6:930:21::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Sat, 7 Oct
 2023 10:23:20 +0000
Received: from BY5PR11MB4071.namprd11.prod.outlook.com
 ([fe80::7bab:f595:56:efa]) by BY5PR11MB4071.namprd11.prod.outlook.com
 ([fe80::7bab:f595:56:efa%4]) with mapi id 15.20.6838.040; Sat, 7 Oct 2023
 10:23:20 +0000
Message-ID: <b89c2ed2-5e19-4565-8ae7-9fd5f6e8387b@intel.com>
Date:   Sat, 7 Oct 2023 18:23:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: int3472: Add strobe GPIO function
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Dan Scally <dan.scally@ideasonboard.com>, <djrscally@gmail.com>,
        "Hans de Goede" <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@intel.com>,
        "Bingbu Cao" <bingbu.cao@intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        <linux-media@vger.kernel.org>
References: <20231007021309.9332-1-hao.yao@intel.com>
 <ZSEVSy122qTWwvdy@smile.fi.intel.com>
Content-Language: en-US
From:   Hao Yao <hao.yao@intel.com>
In-Reply-To: <ZSEVSy122qTWwvdy@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGAP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::36)
 To BY5PR11MB4071.namprd11.prod.outlook.com (2603:10b6:a03:18c::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4071:EE_|CY5PR11MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: 4994472c-97c2-47a9-fdb5-08dbc71f6d64
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yl5QZobXZBsqsY0/+v9Bl+Q05cAMJtrekbXOs44bBwIDrFBfzQGVdPismtHfkxCrBot39+Gt4DwvDTnyIL9nIJsTvwndm1xH57aeNJQMiefQcQUZrIKgqz0YyohiySJYv1iibrZetWQBRi1RJ3VNIGCbZCrmrs8PYEhLTgStGX0iXx46JaAcKx6XpyIsypw8NPhcxxj2u6dpGXn/WsrpA5/pCuEp0ULajAwJ2SF7yuVAvascswXLkoABRN3oTGmk30dDDqxErVSY8qkc56Isp6N5i1/w4n01YbG2KmQRznpkaO1anuTcrQVozcUW57+g+ZJUHHJRnAWEwKTAB6fDcrKXZn9N0aiWiWh9p9Of3iIe6yMhaPOT0aG8aj+FHDDiLqo6/IjzjkBTsoDywHqke7yjhm+4sj1fM7BsiwPO94Lj+1FGxxzBGVIEy4V14HnYN0zDfiIvyXwDrBvIVokWl8lQZJR8AeBQLwb6zmfIM2vuIXFct+56dJA3Pp8iIKfdOxKa496EyG45AA/W3rnhDfMyd66dQsobjHkxr8r7QdX8/NLNsjuBVCjp40+PgzMBqVTMDgUgLqQN64SdvoAZ2CyJvAxIF/rRgqLX6laA8rNjLqUVUSpjHNfzSlrk/jbmN/Ein8qeaDMXQMvU478uGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4071.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(366004)(136003)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(31686004)(66899024)(6506007)(6512007)(478600001)(6666004)(53546011)(6486002)(31696002)(86362001)(38100700002)(82960400001)(41300700001)(2906002)(83380400001)(26005)(2616005)(36756003)(8676002)(8936002)(316002)(66556008)(66476007)(66946007)(44832011)(54906003)(5660300002)(6916009)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dStVU0c5RXNKT3pScVF4VUdxWFpOcmE3Q0VxN0Rid2R3dzUwcy9xYWxtZFdO?=
 =?utf-8?B?b1R5bFp1MGZNdld0V2NXVnlqZFdFR0FWK213UWV0Uy9UUzhEMldxOXZFcHRK?=
 =?utf-8?B?UGE5RWhvZVRLbE9SaW5samlhNVE1RjdjRk9lTlZYNnpIOUJkTDU4VHVJelI0?=
 =?utf-8?B?bGp3a29IMTJ6TjZkL1E4RWZLaUtQQ1UzbTJkZU9TTkNKb2M0RmI5SWIzKzBD?=
 =?utf-8?B?V0w4anJiekpYSmJuc3pjM09ZUVJBNGlOWFhFSWxlNG94M21zVk5aUFJtallD?=
 =?utf-8?B?VGdNS041UTM4MFpIQ1dhS1A4b2l4RllUbzBybTcxTGlFalFuQmFPSVorblBk?=
 =?utf-8?B?cWhSNTU4aWZpQjk0VkZ0SFl0QVZ6M1JNS3N1TWdCbmNMNVFMekVDSHJhV0xi?=
 =?utf-8?B?aCtyY2ZYSE1xQlFoR3g4cGc5WmxTWUtNOTZzRXhUdkJaTDBoRTl2NStaUmpr?=
 =?utf-8?B?VW10bGVqWEVLTVlscFU3NHNkWVNLSFZUeXpjQU14eTJSYm4vbytrdzVZK1dm?=
 =?utf-8?B?SHBuKzJOclY3QTNZQTVEUkoyanN2OVAyMWRFZ1hyOWpBaytDSHZWV2RNV3Bu?=
 =?utf-8?B?Zlp0cWlQOGtDRGx2V3NmS0VGTjFKaC8yNC9Mc3pPNEZNRTVQWlpUbkkrS1Nw?=
 =?utf-8?B?TEw5cUMrNHR5UGdFZW10VFFObS9jYU1zRzhlcGtVanlsNFZpVDc2VUp5alBU?=
 =?utf-8?B?Kzc4NG4yM3RRcnczYUoxZXZCWlhDVXRqRmxPSDFEMTYvdzBKcmh3KzNiREkz?=
 =?utf-8?B?NW54cEpRRjJOVFdmaFlVWDJNaWNrcy9zc0xWQVVWeUFneVV6bGM0Sy95OWpS?=
 =?utf-8?B?QlNTNUVqbDZxaUE3RGJYNlRPVlhwOTk4MDEvU1diUlZEc1o3Q1RKRzFqSS82?=
 =?utf-8?B?d2RoaE5VamgydkNEVEJ5MmRWZm1NVndpTVF4UnVLVWhMU3J6NHlBM3c4UGlM?=
 =?utf-8?B?ZDVhQWlBOHdnY01ocTJGTk9ieWZCQ055NlI0YnQ5REMrT1JuMndTU0NBY3hQ?=
 =?utf-8?B?YStxUkhubUZhWG1qSGR1cVJTMnl5QTY1V04wVnVKZHA2R3JldjdJdjFlSHVi?=
 =?utf-8?B?VURGV1dZcmx0N2dIMys0cDUvWEtiL2lYbGptUzVpS0hEdklZMmZQSkFMaTRq?=
 =?utf-8?B?TFE1ZHBDdlhYR0Z1SUpQSmFaQnFjeUVKTzhweHdvc3NpaDdPc2hmb3lmL1h4?=
 =?utf-8?B?THNreU5vaGJ0OCtFM1d4K1dQdmMwREJPZitaNThObEtJV2NkOTNuQzhnTmY5?=
 =?utf-8?B?TkRxWXYvM1ZqWndrOUR1MU1GVnc3SWQ0c1B0SlN2Qk0zalA4QXhJVDNXRFVi?=
 =?utf-8?B?cWdVMXNxL3ppc2Y2NUpJdE9ScVRySVk0MjZlVkhNVDV0bnY3cTNURW5Fbys5?=
 =?utf-8?B?dFUvSUVNZVhlM2xwb1dMWWRkUi84L1g0dktSZEZSZ3FPeTh3TmlMZkNEUU1X?=
 =?utf-8?B?dkYyUEo4UGhwTW9YT1g1Qk1nckc2dFdDSEVNVmtFOEozWEMwOGtwMTdJSFpo?=
 =?utf-8?B?N1N3Y2d6V3E0b2l5QXI1NitPemZZK04zM0FjVGpycnVzNWJkU1dpbVhWK3Fv?=
 =?utf-8?B?ZjVCQ2Q0WWkrVGhYUWVRUTV1UUx2RWNzVTMxSW5jUkd4T1U5cVkxM1dpaS9I?=
 =?utf-8?B?eG1QZEE2YVZ3bmxtTmI1THAyTTF2Mi9tUlJsQ01ESnJJL2U1MGg0WXdVYmx5?=
 =?utf-8?B?SG9qMEl0T05BMWhTRkd2M0dKMWtqOFRrcVdHdCtYK0xHTGRWeUFWZ2c3dlR2?=
 =?utf-8?B?SEV4MDFKRjFZc2dYeHg0alBkRmVJWkZiM1hnT1hWVnFhbktCR2pRN3FwaTNQ?=
 =?utf-8?B?aEtHNS9OeEx1d3NUemZkQXhJR1NPd0o3eTJpT21nOW9PM3lrUW5JOGtQYllq?=
 =?utf-8?B?ckNxbUNCS2xqN0NhcE04OVFuQ1hqSTFMcHB0cy9DWU9HVTBmOGJmUDkvRHMr?=
 =?utf-8?B?L3hPUUV4eDZJekplZzRhOTVuS1F6RTN4bmRad1ZwcmJOMHBzMVJYNlI0dXNv?=
 =?utf-8?B?ZnFRWFdGajNJU25DaWNjRXRxclE2OUxYUXVUcWVvZlNoZXBXUXZVTmdOYTFP?=
 =?utf-8?B?SXFORjNaQmhyNG5IM2s2ekxTa3lWZjM3VlY1eXI4WkIyQjdGNXZ1RjZieGlV?=
 =?utf-8?Q?Sx0Bc9ncrkBc+dRDY5f04n+HH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4994472c-97c2-47a9-fdb5-08dbc71f6d64
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2023 10:23:19.8949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGf5up+msaDd/hDJzn+QAnJ8kdvyLZSXEIzOquxPcT94Z4pRhr6HNv0giTFePmENHu87Hgoyu+L2O/bI+1STAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6283
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you Andy,

On 2023/10/7 16:22, Andy Shevchenko wrote:
> On Sat, Oct 07, 2023 at 10:13:09AM +0800, Hao Yao wrote:
>> Strobe pin is used for Lattice MIPI aggregator to control the LED
>> so it can be handled together with privacy LED.
> 
> Thinking about this more, I am not now sure that this is a good approach.
> The idea behind the STROBE LED is that is used for flash light and should
> not be like on/off state, but rather the (quite) short pulse.
> 
> Combining these two together may even overheat the real strobe LED if used.

I agree. If the GPIO is used for a real flash LED, is it better to 
develop a new driver to control it. For example, some cameras need a 
flashlight device "LM3643".

> That said, is that platform using strobe GPIO for the privacy LED for real?!

On my Meteor Lake device, this pin is used for IR camera so actually it 
should control the IR LED. However I still don't know its detail usage. 
It may depends on the Lattice firmware, because I found only the 
handshake pin takes effects now and can't do more experiments. I think 
we should leave it open and I will update when I find something new.
