Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B76D7732C77
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 11:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234405AbjFPJuL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 05:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245419AbjFPJuE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 05:50:04 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B32119;
        Fri, 16 Jun 2023 02:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686909003; x=1718445003;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KMCl87clsqKc2Lg0tXsgeVQfvb3siYREwmcgHyYwilo=;
  b=ZpTuwA0uJM3BDthQu11YcA7enNC5YpFHdto1ED1C/BXNxmc9S3A0/FCx
   LZc2TZgIp3zhR9yY+xPddv0xyqi92DG+d8OrJLD/k8IUp8G66h5a2Rji0
   yqdchRnwhiKB94f9nZMI1D0H3g7JKI+aSDXV4whS4f9yNvvZgcwhE9cUU
   NKAKx5Djb3XLeOYG0y1AqW+MSL7CtcT4ehffkNHvjLSXjxMJECD9nfUJ1
   /VSUZ/8mTQPKkWz9lVQbtBZ0YqFzChpzbUUMbR7UxrQVSn/BcMlZxuxUq
   AP/IARAK+9GcJgJ1daD7a+haT1mfU8YiIfFLJMjhqL+1fZwgyynF2bY32
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="356662201"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="356662201"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 02:50:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="887046573"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="887046573"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga005.jf.intel.com with ESMTP; 16 Jun 2023 02:50:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 02:50:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 02:50:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 02:50:01 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 02:50:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mokx7PmMC7y7lp1afOtPphS+7DrqzbK396vJjFzZ/zZGsIbaLnl6EazdpJ61Z7jrD6FPnqIV6m5leOkUdJwaWxiI+sZX6/tOUASQbZJVfspifkCweD9VS4EwXNkCmbRZmW8MCKGTadmrEABu73Yh+dEsU5GuqkUUG7BkeL4PqSe2P/OMPgtPo1kmSrl9S+srFUMYoEmasbwj0fDx6L98+o4ZHN8m/gKPK/ekwPMTnV1F0ifIo1n0J3Afn9Vj0D0JTnnxuDpODIxDLyskSYz418pclmOMPbgaAOGerEilo6L+OBI2Dtv9zNNkl0KNpMml4sC/gB7aIyVagQXKQLtF9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZpqzgm9eWiX0++/y7kpemxPvSeXLd5tuBeLpWfm/Mw=;
 b=hHbVB0i7Xi+Ojd7wrOaeDQqTaeournhqEcXXpddK3E6V6pXuhxjqPmay5sUmh5YVYEjQ/c101eT8FzWctGJKoLe/ASzHGvoG3RwFTcA8JxOgyMj6LZxq39o69uCxEHwJMPzqUJMA455bKSATA8cFWCPgIxeEk3z0I7y1PFHP49ZNgHRf5Gx7qJjxf/q36cSksA0To2D6XMbOKVtTYkywaNAOeGMVN2TWD7wiIsI44WynH14A+c/2+qudlsCiQ6XRgLwTtMWEzSMElYmhk5HVES8QO1SPCeipTP3nai8ClMbsKrfGFQqN8uXbZ8xPcThP7ez5Nvq5B3OGKTLZgw4/uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4071.namprd11.prod.outlook.com (2603:10b6:a03:18c::28)
 by SA1PR11MB8574.namprd11.prod.outlook.com (2603:10b6:806:3b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 09:49:54 +0000
Received: from BY5PR11MB4071.namprd11.prod.outlook.com
 ([fe80::e2c:dce4:e7b7:4e02]) by BY5PR11MB4071.namprd11.prod.outlook.com
 ([fe80::e2c:dce4:e7b7:4e02%4]) with mapi id 15.20.6500.026; Fri, 16 Jun 2023
 09:49:53 +0000
Message-ID: <8d6d6058-76f5-eef6-68a1-42857924df35@intel.com>
Date:   Fri, 16 Jun 2023 17:49:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/4] platform/x86: int3472: discrete: Regulator rework /
 Lenovo Miix 510 support
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Dan Scally <dan.scally@ideasonboard.com>,
        Bingbu Cao <bingbu.cao@intel.com>
CC:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        "Andy Shevchenko" <andy@kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        <linux-media@vger.kernel.org>
References: <20230609204228.74967-1-hdegoede@redhat.com>
 <0f58b3ca-125f-d4c6-9f7f-87a240e945dc@redhat.com>
From:   Hao Yao <hao.yao@intel.com>
In-Reply-To: <0f58b3ca-125f-d4c6-9f7f-87a240e945dc@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:4:197::10) To BY5PR11MB4071.namprd11.prod.outlook.com
 (2603:10b6:a03:18c::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4071:EE_|SA1PR11MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: c860a8dc-efb8-421a-1de1-08db6e4f0893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CX/SkQ1PQe9290S+emays5R0rvK7bGl9Yld7ERApORQPkv18hue0a9GowSOnpM0fkKnKurzCZQAsGuRPvkK/veWXFHlklKSMAhLJAihT5T5EFc9scqn9Z+OENLDjh76i7jHe+ybO2CvthfNOLO6a5DbT6VVkEx8NZGkrB1Pad5U5G5IztjJuWOUPZoNn27/gu5E70mIjcTpdIRB8Xipv1dsmeTpY7UVdoiDER972LFzH0YvFL5BUPAEDOkcttt0kF7l2mrOGRaTx87BV2dCeBJPOrWwP1kes+BqRi9XBmZKtHwgGKHUUyH7efIXKgEG2e4hRzBH+vJI3CSj4xF3BIEjApw66VqCue2Ov8dFeCWC/Mzql+fNyb6rfv0MybzoqywCQkVjAhAN1No+A4FAxEFPMur9iKp2xvEKQjPj96bJdJno39ZdNAJRh24eZiZB6+jgCtOA2PC07zIY4DEegt+iTwt7Abp0USHKTi4YlUjB6fTewrwZfR8Nc2/XXSQZJSpfrM3Hc6X5roH23VwHl6JkCdQ1hJDCZ0WAURmmgseCz5McS5cwJmkbzz5ub9uxTsTCeWojAJ31pPMAin6ODQMkZCF6wwskyC5+W8Rnn1safYQpne6H/euje+PnOnz10
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4071.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(6636002)(44832011)(6486002)(5660300002)(66556008)(66476007)(66946007)(6666004)(8936002)(966005)(4326008)(83380400001)(316002)(31686004)(82960400001)(8676002)(41300700001)(36756003)(6506007)(6512007)(186003)(26005)(2616005)(38100700002)(2906002)(53546011)(478600001)(54906003)(31696002)(86362001)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEJLcmxQWGUwVUNjRGM1WEVaNVJkWmJyUHJrMFVwcmJ6Ly9tczlzdE8vcG9C?=
 =?utf-8?B?bDRpNXAydlBTZTJyT3JvZU5RMERUVGdlaUl4Z29uYU1mWVpRa0xnVWd2OGxW?=
 =?utf-8?B?ZmhYaTBDNEowZU1TUFZUQ214RkR4VzZUUFZmaW5JaGZzNzFnamF0K0REeWUv?=
 =?utf-8?B?azZvdmlGdE9panVFc2lXeE9QZUIxaVZ3OExRVmVBQUhKNis2Q0ROcVFUUi8x?=
 =?utf-8?B?alpEMXo4eVFNYlVWWThtVDEyVVRLTDZxeTdLdytTdElob2Jha2FwTWFKRDlM?=
 =?utf-8?B?MTBxaHU0YXJ2Y0FKbWtiSHN6SXZNZU9uQmhCd1ZwQ2VFeHdnTER6STdwc0VN?=
 =?utf-8?B?blI5N2RqMm96UitPMHRiQldEbG9XY1plNjV2d0JBQUNVZXBVVnBna0FrRVZL?=
 =?utf-8?B?T2gyU3duTk1UM0VFUDF3TVBoRUJaZmRBZ0hrY0NmN3VNYTYydUk4ZFBod1Yx?=
 =?utf-8?B?Y1UvTXIrUmxHTkFIWUlidUVMMUUrZmZZR3BwdjczcldhZ2JzU25VQ2Z4Njdr?=
 =?utf-8?B?eEd2d0pvZ1drNk81M0o1YjdRMkdzRVRpaFlUTC9FYVh1L3BVbWQ5YVd2YndG?=
 =?utf-8?B?aHZXZFZFYXlvbWo1TnhvVFJhUkVtWllCZmd3U3RwTmtWb0JBYkZ3dHVSNDRS?=
 =?utf-8?B?dVc2MVQxcTIvb1VMZ0VPVEVLOUNnQjc3bGRtYkE1RzRIVWY1OXVrTHhjMXlN?=
 =?utf-8?B?SjVNUmNNVlE2UDZvaFN5REw0L2FBK3hkb2Jrd1ExZVlUZ1AvNG5MdXUydTJG?=
 =?utf-8?B?TEJVYjdVdXFUV2pObk82KzRZMkVrZU1rajdUSjlUMDUyQ3A0NkZ5aVh3Szl0?=
 =?utf-8?B?K2VXOEZ3VGVMLzdTd3B6enBLWWJua0NkaCtRQTFJWHdkejlsQllkczVNMVdX?=
 =?utf-8?B?LzRDa2orbjhWWjFydGVvTVlDWlZqTklBYStBUnNUbUtzTGpSVmtkWnYva05s?=
 =?utf-8?B?Ym9RcnhRbjkrT0ZxUkpjNEVpSXl5NWx5MEgxSXpseThXMXk1MHdrZ0xsdytW?=
 =?utf-8?B?dSs1aDNUdXZCYmJmQ1Fjc2RnS2dxOGw1VjBaRG9WcEpUZmw2NFFNSDZ0Y2ov?=
 =?utf-8?B?dE9FRVBweC92SmNQTk1lRktyM2hyakhwRk9XWWlFM0d4bkFDb3Z4enprUDBy?=
 =?utf-8?B?NzdLTnRUbGFlbUlIZklXOXlBaGY4aU5NU29UTS9heGJIYmZkaVlYQ2M4R2tP?=
 =?utf-8?B?NGdHUHYvSnZqODJTSDZZYXNlZFY1SHQyZWY2djE2dWUzM1BJeXdoKzJsOUYy?=
 =?utf-8?B?TktMTUFHMllrZjhuamQ2b2JUa1ArMnBHbUxJUy9TR3RTa2RZQjFINTM2c2pY?=
 =?utf-8?B?SnVJSFFVYnlkTG1LMHMycURuM3ZWQmF6RnV0NVNTVHJFM0l5WDZFb1UxNnpI?=
 =?utf-8?B?WVlUOEQ4OTFzUzdRQmJpUGt1dVhNek5uT2dsVHR0cTlOcGZ3VlhzWklDNHJN?=
 =?utf-8?B?Y1JjQXJEaTI5SFNMV3FjdGcyZGU1cklTYmhBZUJ4bEJRT1lFV2hubUVubXBo?=
 =?utf-8?B?RmFKZDRBYjQ4QXJVakt0alg2M0dLU1IwS1h1WEs3bjNQRTRMak1WVGV5WDFu?=
 =?utf-8?B?MzVBQmdDR25HTmo3THlwT3dFdjNyQUJ1K0RVTWtvdFVPbGk5Vk9tRzNub294?=
 =?utf-8?B?M1V1d2kxeGJQclJKckd4UVN0NTNmTVB2dmRYRUNRc0tkYU1ZdFdkTE03TGln?=
 =?utf-8?B?bzJaSlJEbTFWSHJxaGl3c2tTcjljdkZKaEFrTVpBbHIrZDFxZUoyeFVUQ21K?=
 =?utf-8?B?T0hRdEV6YTNFVTB5RG4yaWxXNDZpV0JGNTBVcGN2cHR0dEVId2ZaZzJkS2Zx?=
 =?utf-8?B?bHVtUmNrUzlvUVNWZTFDODFpUzRFd3RyWGRLRmJQVzRSTVBYODZwbElES2NO?=
 =?utf-8?B?NFViallaOFlQNVFhR1pQcnBJWXlIeWJPSytjaUdYZXJuTWh2QjdQM2JkUmlR?=
 =?utf-8?B?djF6dWxiN2Fzd2RkYkJSZXR6ZGo3ZktlRTd0UWtiMUtwVjRDVFMvV2xpZW5a?=
 =?utf-8?B?bzZJTm92WWc1VHNBWG41bXFCekJYeXQ3bHpHYWZ2Q1Q0QjZycWl2SHhmblhY?=
 =?utf-8?B?c0txazlVWDFaSGZqKzFMODRvQVAwTlpKMlJCN2tNbFJIamZINU1UUHRUb0hD?=
 =?utf-8?Q?eS0oikV/lZtxswRUAiyxMiBDg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c860a8dc-efb8-421a-1de1-08db6e4f0893
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 09:49:53.8110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9hyOAEquIg4RRAcKwOveRLmI1MdXwTELF7+Z9kF6/aYaMJ5IBWxE2Cl+GKATZjfQGGcoIAZbPbU7Uh3xtn9Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8574
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 2023/6/15 20:38, Hans de Goede wrote:
> Hi All,
> 
> On 6/9/23 22:42, Hans de Goede wrote:
>> Hi Dan, Hao Yao and Bingbu Cao,
>>
>> Patches 1/2 drop the sensor-config stuff since I thought we should be
>> able to make things work without any board specific fixups.
>>
>> This is the result of my working on getting IPU6 to work on Jasper Lake
>> for $dayjob and then tonight I switched to trying to get the ov2680
>> on the Lenovo Miix 510 to work and it turns out that does require some
>> board specific workarounds after all :|
>>
>> With this series together with my recent ov2680 sensor driver series:
>> https://lore.kernel.org/linux-media/20230607164712.63579-1-hdegoede@redhat.com/
>> I can get the ov2680 driver to load and successfully read the id register:
>>
>> [   11.365319] ipu3-cio2 0000:00:14.3: Found supported sensor OVTI2680:00
>> [   11.431595] ov2680 i2c-OVTI2680:00: supply DOVDD not found, using dummy regulator
>> [   11.433125] ov2680 i2c-OVTI2680:00: supply DVDD not found, using dummy regulator
>> [   11.454698] ov2680 i2c-OVTI2680:00: sensor_revision id = 0x2680, rev= 0
>>
>> Dan, currently the DMI match used only matches the 12IKB version of
>> the Miix 510 I think you have a 12ISK version. Can you verify this
>> works there too?  I guess we can just drop the KB part of the DMI
>> match if this works on the 12ISK version too.
>>
>> Hao Yao and Bingbu Cao I think that the way the issue with how different
>> drivers may expect different regulator supply-ids is of interest to you
>> too. Note I see that the mainline version of ov13b10.c does not have
>> regulator support at all yet. So when adding this please just use
>> one of the existing set of supply-names + the bulk API like how
>> the ov5693.c driver is doing. In this case no int3472 driver changes
>> will be necessary at all.
> 
> I've added this to my review-hans (soon to be for-next) branch now.
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
>> Hans de Goede (4):
>>    platform/x86: int3472: discrete: Drop GPIO remapping support
>>    platform/x86: int3472: discrete: Remove sensor_config-s
>>    platform/x86: int3472: discrete: Add support for 1 GPIO regulator
>>      shared between 2 sensors
>>    platform/x86: int3472: discrete: Add alternative "AVDD" regulator
>>      supply name
>>
>>   .../x86/intel/int3472/clk_and_regulator.c     | 72 ++++++++++++++----
>>   drivers/platform/x86/intel/int3472/common.h   | 14 +---
>>   drivers/platform/x86/intel/int3472/discrete.c | 76 ++-----------------
>>   3 files changed, 66 insertions(+), 96 deletions(-)
>>
> 

Thanks for your patches.

I tested them on my devices using int3472 regulator, including Lenovo 
Thinkpad X1 and testing platforms with ov13b10 camera sensor.

Tested-By: Hao Yao <hao.yao@intel.com>


Best Regards,
Hao Yao
