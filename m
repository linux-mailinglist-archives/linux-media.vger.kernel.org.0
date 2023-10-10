Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78B757BF4EA
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 09:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442613AbjJJHyP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 03:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442635AbjJJHyK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 03:54:10 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99CCCC4;
        Tue, 10 Oct 2023 00:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696924445; x=1728460445;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XckaF1xsqIUt67kmRX05FiGkJv6OWk/maetsOFTF52M=;
  b=J5UWHeXZdmSuuzC7b80QY/tzWTOg3CQKAADnSGqQDJIGDYnHY4zFfgVf
   SusRHzzPt4F/bZIYBhQncrflHWgiRbCoEjRx/Zo9jK2ovpuxNt7lBnEhJ
   5SYr0Q8oPQejm6kW1osVixb4XEIJ1fPc2Gny86csTEeZ1JvaA/lT5ArEY
   p/m7X1YOgqwAAmFxGbJ9/SgLLqov5n7hxcmMPuptwel/fXOOnxBqAkgtH
   YUmeXt2+pKSzDUrJtsJhSwTNb1FDndtTYiL6AQn68VBWcgL9g9ndCExYW
   PORvvc88OILE0rKPmklWsR6bZddqH1L+zKDB+o6mS/1heTQW8e1vLtOwd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="450829698"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="450829698"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 00:54:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1084679019"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="1084679019"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Oct 2023 00:54:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 00:54:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 10 Oct 2023 00:54:03 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 10 Oct 2023 00:54:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJVcV3iA5KFr75tM25uXoCawIO74vVESSBj0XZJmsv0Zec/c12tCJkCrwpI2FBj4Q7ApYsUZ7UsXaQQZ+fPwvveGP263Qu/vXcLkFStE/OYr8SaS4bSCrc/HJUnEzkN49NVMbr6Imd60AakvrTDLsom7jMvif8WXm2N2ltfYxETskWMPmyFchNzrHuMiT5LRddo9m+i62f8o2IW5fuWvQqKNX4MjirofJ6Y4Jg2P+jYLcoDgiYe7cuYrhQhcebEhLWie0fO4etoSpXlWskHg6olbLOxljXdg+23tBDmi8G1jaPUazESXeQWvXV2UnfCJCdt6i0djJw0KumA2kvPiYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gGhbfZMypm/smom7NV7TEeoEXwWhUOHsb3l4lqE5oo=;
 b=TMfJEN/oWMJLxB4+hbjnG9jw1w4qzxdPK45ltsmVPowXDjjSg+SPqrFjdx/sp+Wwi8N8BQhyouRFzoxZWW33qoOcr8Grhr4HLj6+eJhTdFVIPOdPFILPOiSOAr/yQTRRSqFGXG8kzkhUkrCK48DgIVdplE//QZEF1VMVYV+0s9TIKVmn7dxqN+a2N41JOeYYWmIiAvAxbJiUUsLANW3jxCQgeRziuQV6mhqGq9uzKVER6mBmMRCItHRj9/sJnvWeSSPL2YzXT/ybtFigibuFOi0KLX86Z1hA6HnFU98qWunhmnW/exKLc0+cXHb03wn9mtvXfHQt18tmMahTZ7vG+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4071.namprd11.prod.outlook.com (2603:10b6:a03:18c::28)
 by CY8PR11MB7921.namprd11.prod.outlook.com (2603:10b6:930:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Tue, 10 Oct
 2023 07:54:00 +0000
Received: from BY5PR11MB4071.namprd11.prod.outlook.com
 ([fe80::a9f5:29c8:2288:ea98]) by BY5PR11MB4071.namprd11.prod.outlook.com
 ([fe80::a9f5:29c8:2288:ea98%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 07:53:59 +0000
Message-ID: <57379273-c290-4a69-893d-b40c25023148@intel.com>
Date:   Tue, 10 Oct 2023 15:53:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: int3472: Add handshake GPIO function
Content-Language: en-US
To:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        Dan Scally <dan.scally@ideasonboard.com>,
        <djrscally@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@intel.com>
CC:     Bingbu Cao <bingbu.cao@intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        <linux-media@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20231007021225.9240-1-hao.yao@intel.com>
 <38c9ff1c-8d3b-8675-9780-2bb6c87ba815@linux.intel.com>
From:   Hao Yao <hao.yao@intel.com>
In-Reply-To: <38c9ff1c-8d3b-8675-9780-2bb6c87ba815@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR01CA0107.apcprd01.prod.exchangelabs.com
 (2603:1096:820:3::23) To BY5PR11MB4071.namprd11.prod.outlook.com
 (2603:10b6:a03:18c::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4071:EE_|CY8PR11MB7921:EE_
X-MS-Office365-Filtering-Correlation-Id: 19fa5196-ff15-45d9-319f-08dbc9660fbd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Om/E9tIxlMz1lfuzCvHj18TRbWHNA15i/l7MHsWyhdrbW3GtW6sEbTexxxLIIdVJNgkKFsqcUwjDlW0/QZFTJiNIiFqcE/4xUoKWFph3CB13Cy3sAej45RrdBtL2Ks74y+j8Ckn+KtQpEVqc0mNaNDklKRyMEB8MsT6xWmHOM5AvrEWZQ/EMKv7C5q7Leoi/NHr1pOJFJ75O5HYiYRGrDNcTia3c8nVlkvlCcQgwBZvtuHLu81helUpVXMtQg3hYRveH/Cp0ztaFNccCGl1EXdoFpKXC9xpX+70uVBSFtPtmBOFVypPeHWnxGjZKzkL0+uxCa1UQuTemFRLOtA4Q/SIEcx6NtyTZjA8yM6Y87HQEIqH8K1LWSOa0Or1U5x0DRQ64jd1OaMx2Y9ohot8So0KXSzMuFDinT5yILXlm5v8zVxQuCyMX7H8qf8HpI+50TMPd4d4ebdtsg4IE31+ZDQcgnFwAJyVSMhIaTX/kRYo6O3sgRClIOW/iBHz/hu2NwhvuBGn1GSgqrGgS8rZFFujaEW0qHOLmWdN8PcA4p5ySW/p/nLiNpi0n18ufW5poXXUxGejMuXAJyA565ww28n70qrpI8KrHITjvqAuunIDoJdkgiZTrIoowysaIzpYbDE+HLmy2B5wRaUZCC29eqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4071.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(366004)(136003)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(31696002)(82960400001)(86362001)(38100700002)(36756003)(31686004)(66899024)(2906002)(6512007)(6486002)(478600001)(41300700001)(8936002)(53546011)(4326008)(5660300002)(44832011)(6506007)(8676002)(6666004)(2616005)(83380400001)(6636002)(66476007)(66556008)(66946007)(110136005)(54906003)(316002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjUrS2VwNllva2d1NWNLWFZHU2pQb0piSkQ3Zk5uS3ZxZGlLaG9yWlMwWUc5?=
 =?utf-8?B?YWhpdGd4cmtFV1JOZ09PU2h5Z3JEaTBnYUhVblBnMWtYU0c3UjNNdlVSbzJY?=
 =?utf-8?B?QzQwSUdBYzh5UnlQZzZLU2lNWjVaT3hzZnJZbk5LNTlWUjRaaXNCWERLOVht?=
 =?utf-8?B?M0F4MENic2VCUDYrZnp1QlM5QXZJZnF0R3p0ZFpoalZOOWtzaEJIUlJPSFh6?=
 =?utf-8?B?UTQ1L2ltZDRMd3AvcUg5THRrb20xdDFGU2hEV0lKU3BMNStrZERUZlZGMmxC?=
 =?utf-8?B?K0x5NHJjdDA0MktiM00xR0paTGhsN3JKU1ZLdVE5Mm9zMFNXN1QvQTRLN0Zm?=
 =?utf-8?B?RnNPN1h0bmNhUkQzeDkwYmdwaWlSekZtQjJ1U29QWXBGWUxZamNuT3l1blRL?=
 =?utf-8?B?YmdrODZpOGNNU1R6Q0s4cEZKMkVWcDRtbG9iL3lidlNxSzV2cnVkUm9IQmpX?=
 =?utf-8?B?YUVtMEg1a3cvaFNLM1dON0JZTUpqblJKclpFeE9yME51aDREQTBXUFVPUnI4?=
 =?utf-8?B?WjhPQTl4VzBhRFdSeUVuUUwxNkhzZWJoUXF5ZkJwUVJDRjJRZm5hbDdEemdr?=
 =?utf-8?B?d1BwRzI4bU9SMXVwZEpCWGtycHA2SEdLWmhNV3gxem52NmdySXBHYVZLVzI0?=
 =?utf-8?B?M1dZaHdNWTVEUmFEWEMwOFlpUThJWmVyQm5SUlFzZitoY1Bnd08zRWZUdFoz?=
 =?utf-8?B?ZW1qU3VyT0lVczRDclZCS3dEcW5NaExQZ050ZnJ5YkF3dExncWd2N3hDcDF3?=
 =?utf-8?B?L3FNM2sxa1I1VWpzTVZpWlVxMnFVSnNnSkUvRGN3ZEVJSmN0U3h0YnhJSzRQ?=
 =?utf-8?B?QXZ0R2pXRCtqT2dBT3BQR3VrYThTb3JVMmRLV28zLzBVdW00Ny9DVzZmOWtG?=
 =?utf-8?B?YkRYd2R5Tk1DZzNidi9DZWVuOXdidTZhbFFTd0JkdTI4T3psdzVRdkRzVXVW?=
 =?utf-8?B?THFSLzI0S3VKOWdGUEhMbnFsUFpuK1VkdncybjExZzhvdUdsLzRvQmxlaWN3?=
 =?utf-8?B?TmxiaFBXUGwyckQ4a3c0bGlGSWk4a0dzYjg2emFYWXI0dEdKTkIvV1NOd0JM?=
 =?utf-8?B?VjZVNXFpMnROaHB3RE9UT0U5VVJ0Y0dMMC9VMFlvRlVKaTBsbmtIZ0lCRXlx?=
 =?utf-8?B?UE03UG1wTnpDTW1uTHVpYjBsSnRBQmpIVEh2SHpodHYvSzBBYy9xcjYwc1hE?=
 =?utf-8?B?UDBBUG01VUhPVU9JaXhpY2RTRVhSdUFXMzRqREV1a1Y3Nm9tbk94SmlpYjE4?=
 =?utf-8?B?ajQ5TEYxcWVVUnFuOGxKaHZ3QmpvbnZaTU9FQThNYUljWkkrRDJnNUJyTGJ2?=
 =?utf-8?B?a0RhVFpwRmRNaHFqNDRrTTR2bTlwVHdvR1lseVZTcFFwRTBQS1R6RFZCY3VC?=
 =?utf-8?B?d1c0akhueEwxZ1NsVW5pM0JhNE1HWUt3SDRKOWk0d0xpWU1HSE9iTDJJS0ZE?=
 =?utf-8?B?MzNwM3JKLzZkU1g0L2pBZG9Lbk1LSUFSWmRQWWlHdG5aUnBldHNTSFJKdlVI?=
 =?utf-8?B?UTNsUWJFaUNlbnZuOTg1NXMwVFhzV2dxanRWNmw1SDFLa3RVSk10Z013dnVS?=
 =?utf-8?B?L29CRjNCTFNmanR6bmdiMTdHaVVyak13WHdlekR3c0VObVg5aTJSaWU0TmZH?=
 =?utf-8?B?ZExFQ2JwbUlsanhkMHVMUThYQ2pYdW10MUhuSHFaaVJjYUhtM0NVMytMbmp0?=
 =?utf-8?B?djNWYmtDTnlYVGtVYVp3OG9Bb21US0NxUXg1VWRadWYxc0FBS0NTaE1FVlZo?=
 =?utf-8?B?c0R0dXc1aFg2QzA5TUFKQ2xFUmhpL2w0QmZmY2RKRFFrVHV6VDJqdHdLT0lR?=
 =?utf-8?B?SS8wcDg0UWNjVmtWWlNudjJNbjhsUmlpdGV4dS8rWVNUVFQwWEIxQ2k2T2lX?=
 =?utf-8?B?RmVoeGhVdnBxTEFPREdCOGt0eEtadWhLWGJsR0lLeHJoTjdzVlp6MzJJbXFy?=
 =?utf-8?B?SDlGeXJUbjZTdjlOczNWWkErOE15TmhCNXJTMU1VelAzcFNMc3Nja0txeElM?=
 =?utf-8?B?S0JybzVMTVl2cCtSSUtyeHdZLzhRSlQzeG9zWS9MUVF1cW9JRkxFS2tCTXdW?=
 =?utf-8?B?SzAyTUFSR1RiK2VUTkMxY2VydHJZc1RGZURCWjdUSGQzbG5sZDZRbFUwcmc2?=
 =?utf-8?Q?j1oGnBJZjxdSOvLz3e4WVbYBm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19fa5196-ff15-45d9-319f-08dbc9660fbd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 07:53:59.3753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJBXT0ErQ1SdNL3aUShAXYqMSrrIdXCp3WCUZJZrZNCmfwwkKlW2crPlI8rpHadPyTrvKVqv6d+kEjF1tCbeWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7921
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you Bingbu,

On 2023/10/10 15:17, Bingbu Cao wrote:
> Hao,
> 
> On 10/7/23 10:12 AM, Hao Yao wrote:
>> Handshake pin is used for Lattice MIPI aggregator to enable the
>> camera sensor. After pulled up, recommend to wail ~250ms to get
>> everything ready.
> 
> Is the delay for specific camera or requirement from Lattice.
> 250ms is bad for camera.
> 

Actually the handshake pin is used by both Altek M1 and Lattice chips. 
As far as I know, Altek M1 required ~250ms delay while recently Lattice 
team told me they don't need delay. However I don't know if there were 
any devices using Altek M1.

>>
>> Signed-off-by: Hao Yao <hao.yao@intel.com>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> ---
>>   drivers/platform/x86/intel/int3472/common.h   | 1 +
>>   drivers/platform/x86/intel/int3472/discrete.c | 5 +++++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
>> index 655ae3ec0593..3ad4c72afb45 100644
>> --- a/drivers/platform/x86/intel/int3472/common.h
>> +++ b/drivers/platform/x86/intel/int3472/common.h
>> @@ -23,6 +23,7 @@
>>   #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
>>   #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
>>   #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
>> +#define INT3472_GPIO_TYPE_HANDSHAKE				0x12
>>   
>>   #define INT3472_PDEV_MAX_NAME_LEN				23
>>   #define INT3472_MAX_SENSOR_GPIOS				3
>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>> index b644ce65c990..4753161b4080 100644
>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>> @@ -111,6 +111,10 @@ static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polar
>>   		*func = "power-enable";
>>   		*polarity = GPIO_ACTIVE_HIGH;
>>   		break;
>> +	case INT3472_GPIO_TYPE_HANDSHAKE:
>> +		*func = "handshake";
>> +		*polarity = GPIO_ACTIVE_HIGH;
>> +		break;
>>   	default:
>>   		*func = "unknown";
>>   		*polarity = GPIO_ACTIVE_HIGH;
>> @@ -201,6 +205,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>   	switch (type) {
>>   	case INT3472_GPIO_TYPE_RESET:
>>   	case INT3472_GPIO_TYPE_POWERDOWN:
>> +	case INT3472_GPIO_TYPE_HANDSHAKE:
>>   		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, polarity);
>>   		if (ret)
>>   			err_msg = "Failed to map GPIO pin to sensor\n";
>>
> 


Best Regards,
Hao Yao
