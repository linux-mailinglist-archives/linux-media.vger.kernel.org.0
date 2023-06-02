Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6FAA71F931
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 06:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233430AbjFBEPZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 00:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232723AbjFBEPV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 00:15:21 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3154619F
        for <linux-media@vger.kernel.org>; Thu,  1 Jun 2023 21:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685679320; x=1717215320;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bmBdxNHynxVGuDzbvTf80PpW/So6oYm/2aG31AHem8Y=;
  b=GlRRXY3u4evbT85hiCBC3rZYGf4cuBQbcuivzJM145sjf85gD2ZuBfVJ
   bMw/zOCJJXYHmAjKr5KEvLkXiZq4qjsqIy6jpnNB7Mj+JGQGaNUrjjykf
   a1qc/ZyzYOOQ/ywUcNqBSKGVDsuBb1AVkgEpAlzNaHxdcpZsJt7Eyl9my
   gLX5gGRYIRUoIAYRAS5V24SyewL/p8qeRw4omo6UUgxiEwKkE1ZfqrLWI
   /p4XJqjVhvjk3D/+3tmOJhkfeRH4F9D+twMwRM1saCb7PLd1rtipSgQHm
   ywNnrwufut0lMpkghmvOnkdqyIyLYR+KHMjbs8CCfbYSTr7rL8en44is7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358195341"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="358195341"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 21:15:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="820107235"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="820107235"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2023 21:15:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 21:15:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 21:15:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 21:15:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1ckDevLVoTBvltyCo0q52ZxCCG0kB4/GAhtfBgFeXRGidnV11mo3/c9NPOSqzfNVJKKU5A0w7WPVpMJ6DOVjVA4FkleF5p3jIZbXHLzv+KpaaZyGM4q4VUE1udxDTjEFNLAjBvAhrTZewpc0Lol8/f3w/dtuxW+i1Tkcf1jmaOSbcRdSUy5cW7fOdvP/CQLWnyXPJBAnfnul3gD7UecI5GHPT8WOSdFNcqjx1Vzp9+pjyXK8j2NcZwq5ozj1iKwQbUSOGQz04a2g/QmOQ5Rh3PKAhhe8dNDLljUM0jo0jcZDywjahLlpmhDxeSm3fmXKR+uDCBWSfkSPjJusLk17A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmBdxNHynxVGuDzbvTf80PpW/So6oYm/2aG31AHem8Y=;
 b=SQX2ox1IzZ0EdxX6fkSBe4++owrk1U9FGdPx2R6cKH6h+JWpxA3J+SHPtYpez9goVMBBZLZc7/j5mbKF5pop7mkzkZDj7vTXqjEiDdqKOFxBq0/UzsvKXxvG9cOWK2sLLNs03GQWS/4pF36qqbzJyHbiMtgL2xIq5/dpZtHY8MYaDp81KPMzthjVoscU2y9tXR04Nwazn/SU27HAP8tym+wh1d2jk2qi0TSK7VcCCYxvlmspmL3pjZDS5ngUBhdV5+0KL+XhozkchzANOMVbhsDtwoyyjTKnfVLHorfB/p4voJLmbHi997ZVaoOZM7/dyJnhoov2fH+lMrVss4x0Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4071.namprd11.prod.outlook.com (2603:10b6:a03:18c::28)
 by MW4PR11MB6713.namprd11.prod.outlook.com (2603:10b6:303:1e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 04:15:13 +0000
Received: from BY5PR11MB4071.namprd11.prod.outlook.com
 ([fe80::bd6f:eb7:9fae:a154]) by BY5PR11MB4071.namprd11.prod.outlook.com
 ([fe80::bd6f:eb7:9fae:a154%3]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 04:15:13 +0000
From:   "Yao, Hao" <hao.yao@intel.com>
To:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "djrscally@gmail.com" <djrscally@gmail.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>
CC:     "markgross@kernel.org" <markgross@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: RE: [PATCH 2/3] platform/x86: int3472: Evaluate device's _DSM method
 to control imaging clock
Thread-Topic: [PATCH 2/3] platform/x86: int3472: Evaluate device's _DSM method
 to control imaging clock
Thread-Index: AQHZjfGHxyr4FD9swkmZJoAa/e2Iqa90cCQAgAEXZICAAW0ikA==
Date:   Fri, 2 Jun 2023 04:15:12 +0000
Message-ID: <BY5PR11MB4071F8CD81270C5029FDE791F04EA@BY5PR11MB4071.namprd11.prod.outlook.com>
References: <20230524035135.90315-1-bingbu.cao@intel.com>
 <20230524035135.90315-2-bingbu.cao@intel.com>
 <6baeafb2-29bf-ab70-2e4e-eea55d6af440@redhat.com>
 <DM8PR11MB56534308813BEBA5496A796C99499@DM8PR11MB5653.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB56534308813BEBA5496A796C99499@DM8PR11MB5653.namprd11.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4071:EE_|MW4PR11MB6713:EE_
x-ms-office365-filtering-correlation-id: 30d6e1fc-27ca-41f9-3f9c-08db631ff60a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XB0tN3rnD/FY8+cEjXQdTOgrGFzkHNSXUAx9loTh+5sBEJ22jDO0l8r4E5IFVlcnQKuOc7y29BITlXgYQN6Owij5hLMrdJS60L4ju5s83XKo9TtigtDBQgg3QQL8j4y9ZUd0TrO6CUCNlGZmWT21c211JHK9B0kE3upAQC28DDaM9jlgtgsYXOVXqeLSa96u9TD5e2krqulok9Uu7zN/1bqaDjXSbD4MIr0WrynLB4wWy7s9kUdnc+mzutXD/4IN2r0PbeNTZk8iS9i7rgYEiAJB73ICLSQLsZNqf7hW/amyegrmlMz6Q6aCp2onBsfl3XVykgFdwkvICegA3yTS5cqTnWz4X0FI0C97juDz2+kFcQOTnpCIBrWeH4THZSgmlH4s3TDYivyenC63ml6VRR9fnUMPMnEielIbOOsGQWCodM9DPM90Q6A6506yTCZhEqK2yJE4eHFOsyjtosNzeX0RYdMbYp7T0NZJKGwGp7GuzfYKiQAfALqMdYRktGntYAzcYM7IUmkBxsB3eU+MFh/X3hLsmD1b5ipEZgM6XkNLah/oZpbO/baUVfxKI79K4B8HYI3sUUm0Ee9LTvQdQC1sw7OvvbTrrLC4tD84svWfVXsbzUXQJkQMhK63GjpZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4071.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199021)(54906003)(110136005)(5660300002)(52536014)(8676002)(8936002)(478600001)(33656002)(41300700001)(7696005)(86362001)(71200400001)(316002)(4326008)(9686003)(53546011)(186003)(66946007)(64756008)(66446008)(66476007)(66556008)(76116006)(6506007)(26005)(38070700005)(2906002)(83380400001)(55016003)(38100700002)(122000001)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3dublFIWURaMm1WYXRmTVg0eWRUNG1nRUV2S3lrdm05Y0tRTlY1bnJISmZs?=
 =?utf-8?B?VS82TFA5Z3l1SGFHV2lnYWFOaU1FWStkZzFxZk1ISnRpVE1KdEhiRFZXUDdU?=
 =?utf-8?B?QS82QjMrTHNXd1kyLyt6Wkh1QTFmSnplZGJOTjEwSEJGMlFqVS9mTG5EZ2JY?=
 =?utf-8?B?aTU5a2poVjRRKzdEdEd1TzFQd092cmVoaGZyQUdLbDFQYW5IQlZCYUxhNXVy?=
 =?utf-8?B?TFZKdmo1MmRuVEhzN1JzWkpnQVRVVDd1MjVLVTNSNkc5ZnBHdlFYOVBycHky?=
 =?utf-8?B?Yyt3UjczZ1VHUmt6M3FXODl6U0Eya3JLOTZUWmhTcTEzK25TOXZsNk1hVHM4?=
 =?utf-8?B?amRVc041WUt1TVd5ZmlHU2VhSXZjWngxU1RHeXhRYzNQbWMzWGxRWlhUYnlE?=
 =?utf-8?B?Mi9KWTdxU0gzSHh4Y3I3RTFBalFXd3FLdlpKOFdNS1VCVVZuaUVpbVpJRTZ6?=
 =?utf-8?B?TUpidWZMOVhsNzBYUnFLdnZHYTV6bEhHbjZzVVRGNFZ3SURBU0g1UEp3eTFQ?=
 =?utf-8?B?a3hQa09yRUl3YW80bDBPU1BPUmwzc1dseUNaemprV2dwenY5ZUl1TTlBaEk1?=
 =?utf-8?B?YUkyQ2FROWhqTU1MYU55cG1hbGtibHg0TytGVGRtK21jK3E2TzhPSzVQaG1P?=
 =?utf-8?B?Wjg2QXBXRlN4SS93UWc5b0tNaXFXQzBiajRXRGdmNjNONnJ4c3BqazRtKzA4?=
 =?utf-8?B?VzlheGZibDFIcVhzV1lXR2hnS3RsL2xsaldLL1ZzOHBjNkZHTm9uNHJOSHN4?=
 =?utf-8?B?SzNNOEhEWkp1QytFd0ZrSGRoWDhybTI4M3NpdGpjbU4xcW40V29iQVA5VmFN?=
 =?utf-8?B?Qnc5VDFveFFCWHNsQS9hUjA1NGxYRERsQ1pXeHFOMjdsNHMzOTVuQk4yYWhn?=
 =?utf-8?B?U003eXdsZGV3UUpCTThFTDc5TUNET0s3MXkyNWJrVTdVeEFxZ1daU092aXdJ?=
 =?utf-8?B?OW80QU9WNUpmZjA3V0pvK2FDaGFGekg1ZDhGMGFKUHdHT3VJWWw3cXIvR1Fj?=
 =?utf-8?B?VkFhZzNPMjVuUjN3OWZNdFpKNS9jcjZaTlRXWjJDVWJLaXNHYXNTZEJkNTlv?=
 =?utf-8?B?M2pkbktZVXNNODJYcmdSUW9pb0RWSEFZdUdDRVJpRURHejFSOUVraUs5c2J3?=
 =?utf-8?B?Y2RMWjM4NzFyVU1mMnFVdGJSdFV4SGlUYTl6NXZPWGZHTjdHeDdwZkd4b2Jj?=
 =?utf-8?B?aUtrQVQ3ZXFGVEZ0OUdLQlJSc1g2bnhicUpmVVViSHFscE1pVXhuRVo1NllO?=
 =?utf-8?B?YUFLSWVuWlNJTHg0TWp5dTNWVDJyeUpOZUpnbHB4bGJPWjd6eXAvcG5VMUJC?=
 =?utf-8?B?R1pnaGU0Rkt3Q3E5NlpydjNScUVJc0lCbS92S2JMOTNGREo1aU9SV214eWFJ?=
 =?utf-8?B?M05DcHZtb2NOZXNFbE1Wc042SkRQcGxnWEhHdzU2ZGFxSW4zbEY5QVJGSUt3?=
 =?utf-8?B?YTVLRjBJN2pFQ2NSbXlKZk1rRlNjV2lncThYVFNyWFU0Z2VxbUl0TmpCQXlY?=
 =?utf-8?B?QVFJNm9NdS9RbENMckNmeUFFblFvM0Z0cjRrUVBNZndGYVlnRkhLRU4xZzMv?=
 =?utf-8?B?R1V6bU9wVFRTZDdGN2duZVVodVJ2R1dlb1dYcXhRU3ZnSUVBWnpBWkJyWXl3?=
 =?utf-8?B?NG83b09DazhkRHNYRnFNQUNwY01yR2xEeWZoZVhvdytDMUIrKzh6TURlQjQ1?=
 =?utf-8?B?cExocTdKeitUcXhCaGpkaXoyTFNwRjVYL0JZNHJzVXZ6dmY5Wk9nYVI4M1N4?=
 =?utf-8?B?OUpITHZTT25IT2dYYTVHckljalVidC80L2xwWmhOTDhueTAwR1M3aDJ6ZTJl?=
 =?utf-8?B?V0JZd0dxb1JNZW9NT1paRkJXVjJGQWNtUkl1QUtOZy9rVzZaK090RDh5VTU1?=
 =?utf-8?B?T2FwZVBwNCtnWVVZQ0NSdU1CdVVoSUpEY3Z0Z2NEb0Z2QjhuWWJpVytWT2NB?=
 =?utf-8?B?NHl1WTJmQTZMN21WWGcwK2VnVzlmdEltUlBPU3hMTEQxUWhxYVBxUjEwbi9V?=
 =?utf-8?B?ZncxSG9qamdFcURLQWZtNFlXRWQybElPZG4rRHdPZDNTNC9RdHhUcDZSZmxB?=
 =?utf-8?B?QWRkRHVZS3p2QUVWTHNqSjdCQkpDR0RrcVBoT3BsWE85blFlR2JPUHZJS1NK?=
 =?utf-8?Q?83ng=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d6e1fc-27ca-41f9-3f9c-08db631ff60a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2023 04:15:12.5653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jBj6TKqPCHPNdM3ukRfDPZ1LkUI0NeSkVrYe1BYway4naaE0pRma7Zli9FBu3LOIbxsTJw7K3MOO5faH0T0qvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6713
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSGFucywNCg0KVGhhbmtzIGZvciB5b3VyIHYyIHBhdGNoLCBpdCBpcyB2ZXJpZmllZCB3b3Jr
aW5nIG9uIG15IHN5c3RlbS4NCg0KQmVzdCByZWdhcmRzLA0KSGFvIFlhbw0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQ2FvLCBCaW5nYnUgPGJpbmdidS5jYW9AaW50ZWwuY29t
PiANClNlbnQ6IFRodXJzZGF5LCBKdW5lIDEsIDIwMjMgMjoyNCBQTQ0KVG86IEhhbnMgZGUgR29l
ZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+OyBkanJzY2FsbHlAZ21haWwuY29tOyBkYW4uc2NhbGx5
QGlkZWFzb25ib2FyZC5jb207IFlhbywgSGFvIDxoYW8ueWFvQGludGVsLmNvbT4NCkNjOiBtYXJr
Z3Jvc3NAa2VybmVsLm9yZzsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBzYWthcmkuYWls
dXNAbGludXguaW50ZWwuY29tOyBhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb207IGJp
bmdidS5jYW9AbGludXguaW50ZWwuY29tDQpTdWJqZWN0OiBSRTogW1BBVENIIDIvM10gcGxhdGZv
cm0veDg2OiBpbnQzNDcyOiBFdmFsdWF0ZSBkZXZpY2UncyBfRFNNIG1ldGhvZCB0byBjb250cm9s
IGltYWdpbmcgY2xvY2sNCg0KSGFucywNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldyBhbmQgdjIg
cGF0Y2guIA0KDQpIYW8sIGNvdWxkIHlvdSBoZWxwIHZlcmlmeSB0aGUgdjIgZnJvbSBIYW5zIG9u
IHlvdXIgc3lzdGVtPw0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkJScywNCkJpbmdidSBDYW8gDQoNCj4t
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRl
QHJlZGhhdC5jb20+DQo+U2VudDogV2VkbmVzZGF5LCBNYXkgMzEsIDIwMjMgMjE6NDQNCj5Ubzog
Q2FvLCBCaW5nYnUgPGJpbmdidS5jYW9AaW50ZWwuY29tPjsgZGpyc2NhbGx5QGdtYWlsLmNvbTsg
DQo+ZGFuLnNjYWxseUBpZGVhc29uYm9hcmQuY29tOyBZYW8sIEhhbyA8aGFvLnlhb0BpbnRlbC5j
b20+DQo+Q2M6IG1hcmtncm9zc0BrZXJuZWwub3JnOyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5v
cmc7IA0KPnNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb207IGFuZHJpeS5zaGV2Y2hlbmtvQGxp
bnV4LmludGVsLmNvbTsNCj5iaW5nYnUuY2FvQGxpbnV4LmludGVsLmNvbQ0KPlN1YmplY3Q6IFJl
OiBbUEFUQ0ggMi8zXSBwbGF0Zm9ybS94ODY6IGludDM0NzI6IEV2YWx1YXRlIGRldmljZSdzIF9E
U00gDQo+bWV0aG9kIHRvIGNvbnRyb2wgaW1hZ2luZyBjbG9jaw0KPg0KPkhpLA0KPg0KPk9uIDUv
MjQvMjMgMDU6NTEsIGJpbmdidS5jYW9AaW50ZWwuY29tIHdyb3RlOg0KPj4gRnJvbTogQmluZ2J1
IENhbyA8YmluZ2J1LmNhb0BpbnRlbC5jb20+DQo+Pg0KPj4gT24gc29tZSBwbGF0Zm9ybXMsIHRo
ZSBpbWFnaW5nIGNsb2NrIHNob3VsZCBiZSBjb250cm9sbGVkIGJ5IA0KPj4gZXZhbHVhdGluZyBz
cGVjaWZpYyBjbG9jayBkZXZpY2UncyBfRFNNIG1ldGhvZCBpbnN0ZWFkIG9mIHNldHRpbmcgDQo+
PiBncGlvLCBzbyB0aGlzIGNoYW5nZSByZWdpc3RlciBjbG9jayBpZiBubyBncGlvIGJhc2VkIGNs
b2NrIGFuZCB0aGVuIA0KPj4gdXNlIHRoZSBfRFNNIG1ldGhvZCB0byBlbmFibGUgYW5kIGRpc2Fi
bGUgY2xvY2suDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQmluZ2J1IENhbyA8YmluZ2J1LmNhb0Bp
bnRlbC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBIYW8gWWFvIDxoYW8ueWFvQGludGVsLmNvbT4N
Cj4NCj5UaGFuayB5b3UgZm9yIHRoaXMgaW50ZXJlc3RpbmcgcGF0Y2guDQo+DQo+QmVzaWRlcyBB
bmR5J3MgY29tbWVudHMgSSBiZWxpZXZlIHRoYXQgdGhpcyBhbHNvIG5lZWRzIGFuIA0KPmFjcGlf
Y2hlY2tfZHNtKCkgY2FsbCB0byBzZWUgaWYgdGhlIERTTSBmdW5jdGlvbmFsaXR5IGlzIGF2YWls
YWJsZSBhbmQgDQo+dGhlIGNhbGwgb2YgdGhlIG5ldyBjbGsgcmVnaXN0ZXIgZnVuY3Rpb24gc2hv
dWxkIGJlIGVycm9yIGNoZWNrZWQuDQo+DQo+U2luY2UgSSB3YXMgY3VyaW91cyBhYm91dCB0aGlz
IGFuZCB3YW50ZWQgdG8gdGVzdCBpdCBteXNlbGYgKG9uIGEgDQo+VGhpbmtwYWQNCj5YMSBZb2dh
IEdlbiA3KSBJIGhhdmUgcHJlcGFyZWQgYSB2MiBhZGRyZXNzaW5nIGFsbCBvZiB0aGUgYWJvdmUs
IA0KPnF1b3RpbmcgZnJvbSB0aGUgY2hhbmdlbG9nOg0KPg0KPkNoYW5nZXMgaW4gdjIgKEhhbnMg
ZGUgR29lZGUpOg0KPi0gTWlub3IgY29tbWVudCAvIGNvZGUgY2hhbmdlcyAoYWRkcmVzcyBBbmR5
J3MgcmV2aWV3IHJlbWFya3MpDQo+LSBBZGQgYSBhY3BpX2NoZWNrX2RzbSgpIGNhbGwNCj4tIFJl
dHVybiAwIGluc3RlYWQgb2YgZXJyb3IgaWYgd2UgYWxyZWFkeSBoYXZlIGEgR1BJTyBjbGsgb3Ig
aWYNCj4gIGFjcGlfY2hlY2tfZHNtKCkgZmFpbHMNCj4tIFJlbmFtZSBza2xfaW50MzQ3Ml9yZWdp
c3Rlcl9jbG9jaygpIC0+IA0KPnNrbF9pbnQzNDcyX3JlZ2lzdGVyX2dwaW9fY2xvY2soKQ0KPiAg
YW5kIG5hbWUgdGhlIG5ldyBmdW5jdGlvbjogc2tsX2ludDM0NzJfcmVnaXN0ZXJfZHNtX2Nsb2Nr
KCkNCj4tIE1vdmUgdGhlIHNrbF9pbnQzNDcyX3JlZ2lzdGVyX2RzbV9jbG9jaygpIGNhbGwgdG8g
YWZ0ZXINCj4gIGFjcGlfZGV2X2ZyZWVfcmVzb3VyY2VfbGlzdCgpIGFuZCBhZGQgZXJyb3IgY2hl
Y2tpbmcgZm9yIGl0DQo+DQo+SSdsbCBzZW5kIG91dCB0aGUgdjIgcmlnaHQgYWZ0ZXIgdGhpcyBl
bWFpbC4gUGxlYXNlIGdpdmUgdjIgYSB0cnkgYW5kIA0KPmxldCBtZSBrbm93IGlmIGl0IHdvcmtz
IGZvciB5b3UuDQo+DQo+UmVnYXJkcywNCj4NCj5IYW5zDQo+DQo+DQo+DQo+DQo+PiAtLS0NCj4+
ICAuLi4veDg2L2ludGVsL2ludDM0NzIvY2xrX2FuZF9yZWd1bGF0b3IuYyAgICAgfCA4MSArKysr
KysrKysrKysrKysrKystDQo+PiAgZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvaW50MzQ3Mi9j
b21tb24uaCAgIHwgIDYgKy0NCj4+ICBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9pbnQzNDcy
L2Rpc2NyZXRlLmMgfCAgNCArDQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCA4OCBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4
Ni9pbnRlbC9pbnQzNDcyL2Nsa19hbmRfcmVndWxhdG9yLmMNCj4+IGIvZHJpdmVycy9wbGF0Zm9y
bS94ODYvaW50ZWwvaW50MzQ3Mi9jbGtfYW5kX3JlZ3VsYXRvci5jDQo+PiBpbmRleCBkMTA4OGJl
NWFmNzguLmYwYTFkMmVmMTM3YiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2
L2ludGVsL2ludDM0NzIvY2xrX2FuZF9yZWd1bGF0b3IuYw0KPj4gKysrIGIvZHJpdmVycy9wbGF0
Zm9ybS94ODYvaW50ZWwvaW50MzQ3Mi9jbGtfYW5kX3JlZ3VsYXRvci5jDQo+PiBAQCAtMTEsNiAr
MTEsMzIgQEANCj4+DQo+PiAgI2luY2x1ZGUgImNvbW1vbi5oIg0KPj4NCj4+ICtzdGF0aWMgY29u
c3QgZ3VpZF90IGltZ19jbGtfZ3VpZCA9DQo+PiArCUdVSURfSU5JVCgweDgyYzBkMTNhLCAweDc4
YzUsIDB4NDI0NCwNCj4+ICsJCSAgMHg5YiwgMHhiMSwgMHhlYiwgMHg4YiwgMHg1MywgMHg5YSwg
MHg4ZCwgMHgxMSk7DQo+PiArDQo+PiArc3RhdGljIHZvaWQgc2tsX2ludDM0NzJfZW5hYmxlX2Ns
a19hY3BpX21ldGhvZChzdHJ1Y3QgDQo+PiAraW50MzQ3Ml9ncGlvX2Nsb2NrDQo+KmNsaywNCj4+
ICsJCQkJCSAgICAgICBib29sIGVuYWJsZSkNCj4+ICt7DQo+PiArCXN0cnVjdCBpbnQzNDcyX2Rp
c2NyZXRlX2RldmljZSAqaW50MzQ3MiA9IHRvX2ludDM0NzJfZGV2aWNlKGNsayk7DQo+PiArCXVu
aW9uIGFjcGlfb2JqZWN0IGFyZ3NbM107DQo+PiArCXVuaW9uIGFjcGlfb2JqZWN0IGFyZ3Y0Ow0K
Pj4gKw0KPj4gKwlhcmdzWzBdLmludGVnZXIudHlwZSA9IEFDUElfVFlQRV9JTlRFR0VSOw0KPj4g
KwlhcmdzWzBdLmludGVnZXIudmFsdWUgPSBjbGstPmltZ2Nsa19pbmRleDsNCj4+ICsJYXJnc1sx
XS5pbnRlZ2VyLnR5cGUgPSBBQ1BJX1RZUEVfSU5URUdFUjsNCj4+ICsJYXJnc1sxXS5pbnRlZ2Vy
LnZhbHVlID0gZW5hYmxlID8gMSA6IDA7DQo+PiArCWFyZ3NbMl0uaW50ZWdlci50eXBlID0gQUNQ
SV9UWVBFX0lOVEVHRVI7DQo+PiArCWFyZ3NbMl0uaW50ZWdlci52YWx1ZSA9IDE7DQo+PiArDQo+
PiArCWFyZ3Y0LnR5cGUgPSBBQ1BJX1RZUEVfUEFDS0FHRTsNCj4+ICsJYXJndjQucGFja2FnZS5j
b3VudCA9IDM7DQo+PiArCWFyZ3Y0LnBhY2thZ2UuZWxlbWVudHMgPSBhcmdzOw0KPj4gKw0KPj4g
KwlhY3BpX2V2YWx1YXRlX2RzbShhY3BpX2RldmljZV9oYW5kbGUoaW50MzQ3Mi0+YWRldiksICZp
bWdfY2xrX2d1aWQsDQo+PiArCQkJICAwLCAxLCAmYXJndjQpOw0KPj4gK30NCj4+ICsNCj4+ICAv
Kg0KPj4gICAqIFRoZSByZWd1bGF0b3JzIGhhdmUgdG8gaGF2ZSAub3BzIHRvIGJlIHZhbGlkLCBi
dXQgdGhlIG9ubHkgb3BzIHdlDQo+YWN0dWFsbHkNCj4+ICAgKiBzdXBwb3J0IGFyZSAuZW5hYmxl
IGFuZCAuZGlzYWJsZSB3aGljaCBhcmUgaGFuZGxlZCB2aWEgLmVuYV9ncGlvZC4NCj4+IFBhc3Mg
YW4gQEAgLTIyLDcgKzQ4LDExIEBAIHN0YXRpYyBpbnQgc2tsX2ludDM0NzJfY2xrX3ByZXBhcmUo
c3RydWN0IA0KPj4gY2xrX2h3ICpodykgIHsNCj4+ICAJc3RydWN0IGludDM0NzJfZ3Bpb19jbG9j
ayAqY2xrID0gdG9faW50MzQ3Ml9jbGsoaHcpOw0KPj4NCj4+IC0JZ3Bpb2Rfc2V0X3ZhbHVlX2Nh
bnNsZWVwKGNsay0+ZW5hX2dwaW8sIDEpOw0KPj4gKwlpZiAoY2xrLT5lbmFfZ3BpbykNCj4+ICsJ
CWdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcChjbGstPmVuYV9ncGlvLCAxKTsNCj4+ICsJZWxzZQ0K
Pj4gKwkJc2tsX2ludDM0NzJfZW5hYmxlX2Nsa19hY3BpX21ldGhvZChjbGssIDEpOw0KPj4gKw0K
Pj4gIAlyZXR1cm4gMDsNCj4+ICB9DQo+Pg0KPj4gQEAgLTMwLDcgKzYwLDEwIEBAIHN0YXRpYyB2
b2lkIHNrbF9pbnQzNDcyX2Nsa191bnByZXBhcmUoc3RydWN0IA0KPj4gY2xrX2h3DQo+PiAqaHcp
ICB7DQo+PiAgCXN0cnVjdCBpbnQzNDcyX2dwaW9fY2xvY2sgKmNsayA9IHRvX2ludDM0NzJfY2xr
KGh3KTsNCj4+DQo+PiAtCWdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcChjbGstPmVuYV9ncGlvLCAw
KTsNCj4+ICsJaWYgKGNsay0+ZW5hX2dwaW8pDQo+PiArCQlncGlvZF9zZXRfdmFsdWVfY2Fuc2xl
ZXAoY2xrLT5lbmFfZ3BpbywgMCk7DQo+PiArCWVsc2UNCj4+ICsJCXNrbF9pbnQzNDcyX2VuYWJs
ZV9jbGtfYWNwaV9tZXRob2QoY2xrLCAwKTsNCj4+ICB9DQo+Pg0KPj4gIHN0YXRpYyBpbnQgc2ts
X2ludDM0NzJfY2xrX2VuYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykgQEAgLTg2LDYgDQo+PiArMTE5
LDUwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX29wcyBza2xfaW50MzQ3Ml9jbG9ja19vcHMg
PSB7DQo+PiAgCS5yZWNhbGNfcmF0ZSA9IHNrbF9pbnQzNDcyX2Nsa19yZWNhbGNfcmF0ZSwgIH07
DQo+Pg0KPj4gK2ludCBza2xfaW50MzQ3Ml9yZWdpc3Rlcl9jbG9ja19zcmMoc3RydWN0IGludDM0
NzJfZGlzY3JldGVfZGV2aWNlDQo+PiArKmludDM0NzIpIHsNCj4+ICsJc3RydWN0IGNsa19pbml0
X2RhdGEgaW5pdCA9IHsNCj4+ICsJCS5vcHMgPSAmc2tsX2ludDM0NzJfY2xvY2tfb3BzLA0KPj4g
KwkJLmZsYWdzID0gQ0xLX0dFVF9SQVRFX05PQ0FDSEUsDQo+PiArCX07DQo+PiArCWludCByZXQ7
DQo+PiArDQo+PiArCWlmIChpbnQzNDcyLT5jbG9jay5jbCkNCj4+ICsJCXJldHVybiAtRUJVU1k7
DQo+PiArDQo+PiArCWluaXQubmFtZSA9IGthc3ByaW50ZihHRlBfS0VSTkVMLCAiJXMtY2xrIiwN
Cj4+ICsJCQkgICAgICBhY3BpX2Rldl9uYW1lKGludDM0NzItPmFkZXYpKTsNCj4+ICsJaWYgKCFp
bml0Lm5hbWUpDQo+PiArCQlyZXR1cm4gLUVOT01FTTsNCj4+ICsNCj4+ICsJaW50MzQ3Mi0+Y2xv
Y2suZnJlcXVlbmN5ID0gc2tsX2ludDM0NzJfZ2V0X2Nsa19mcmVxdWVuY3koaW50MzQ3Mik7DQo+
PiArCWludDM0NzItPmNsb2NrLmNsa19ody5pbml0ID0gJmluaXQ7DQo+PiArCWludDM0NzItPmNs
b2NrLmNsayA9IGNsa19yZWdpc3RlcigmaW50MzQ3Mi0+YWRldi0+ZGV2LA0KPj4gKwkJCQkJICAm
aW50MzQ3Mi0+Y2xvY2suY2xrX2h3KTsNCj4+ICsJaWYgKElTX0VSUihpbnQzNDcyLT5jbG9jay5j
bGspKSB7DQo+PiArCQlyZXQgPSBQVFJfRVJSKGludDM0NzItPmNsb2NrLmNsayk7DQo+PiArCQln
b3RvIG91dF9mcmVlX2luaXRfbmFtZTsNCj4+ICsJfQ0KPj4gKw0KPj4gKwlpbnQzNDcyLT5jbG9j
ay5jbCA9IGNsa2Rldl9jcmVhdGUoaW50MzQ3Mi0+Y2xvY2suY2xrLCBOVUxMLA0KPj4gKwkJCQkJ
ICBpbnQzNDcyLT5zZW5zb3JfbmFtZSk7DQo+PiArCWlmICghaW50MzQ3Mi0+Y2xvY2suY2wpIHsN
Cj4+ICsJCXJldCA9IC1FTk9NRU07DQo+PiArCQlnb3RvIGVycl91bnJlZ2lzdGVyX2NsazsNCj4+
ICsJfQ0KPj4gKw0KPj4gKwlrZnJlZShpbml0Lm5hbWUpOw0KPj4gKw0KPj4gKwlyZXR1cm4gMDsN
Cj4+ICsNCj4+ICtlcnJfdW5yZWdpc3Rlcl9jbGs6DQo+PiArCWNsa191bnJlZ2lzdGVyKGludDM0
NzItPmNsb2NrLmNsayk7DQo+PiArb3V0X2ZyZWVfaW5pdF9uYW1lOg0KPj4gKwlrZnJlZShpbml0
Lm5hbWUpOw0KPj4gKw0KPj4gKwlyZXR1cm4gcmV0Ow0KPj4gK30NCj4+ICsNCj4+ICBpbnQgc2ts
X2ludDM0NzJfcmVnaXN0ZXJfY2xvY2soc3RydWN0IGludDM0NzJfZGlzY3JldGVfZGV2aWNlICpp
bnQzNDcyLA0KPj4gIAkJCSAgICAgICBzdHJ1Y3QgYWNwaV9yZXNvdXJjZV9ncGlvICphZ3Bpbywg
dTMyIHBvbGFyaXR5KQ0KPnsgZGlmZg0KPj4gLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9p
bnRlbC9pbnQzNDcyL2NvbW1vbi5oDQo+PiBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL2lu
dDM0NzIvY29tbW9uLmgNCj4+IGluZGV4IDYxNjg4ZTQ1MGNlNS4uMDM2YjgwNGU4ZWE1IDEwMDY0
NA0KPj4gLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvaW50MzQ3Mi9jb21tb24uaA0K
Pj4gKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvaW50MzQ3Mi9jb21tb24uaA0KPj4g
QEAgLTY0LDcgKzY0LDkgQEAgc3RydWN0IGludDM0NzJfY2xkYiB7DQo+PiAgCXU4IGNvbnRyb2xf
bG9naWNfdHlwZTsNCj4+ICAJdTggY29udHJvbF9sb2dpY19pZDsNCj4+ICAJdTggc2Vuc29yX2Nh
cmRfc2t1Ow0KPj4gLQl1OCByZXNlcnZlZFsyOF07DQo+PiArCXU4IHJlc2VydmVkWzEwXTsNCj4+
ICsJdTggY2xvY2tfc291cmNlOw0KPj4gKwl1OCByZXNlcnZlZDJbMTddOw0KPj4gIH07DQo+Pg0K
Pj4gIHN0cnVjdCBpbnQzNDcyX2dwaW9fZnVuY3Rpb25fcmVtYXAgeyBAQCAtMTAwLDYgKzEwMiw3
IEBAIHN0cnVjdCANCj4+IGludDM0NzJfZGlzY3JldGVfZGV2aWNlIHsNCj4+ICAJCXN0cnVjdCBj
bGtfbG9va3VwICpjbDsNCj4+ICAJCXN0cnVjdCBncGlvX2Rlc2MgKmVuYV9ncGlvOw0KPj4gIAkJ
dTMyIGZyZXF1ZW5jeTsNCj4+ICsJCXU4IGltZ2Nsa19pbmRleDsNCj4+ICAJfSBjbG9jazsNCj4+
DQo+PiAgCXN0cnVjdCBpbnQzNDcyX3BsZWQgew0KPj4gQEAgLTEyMyw2ICsxMjYsNyBAQCBpbnQg
c2tsX2ludDM0NzJfZ2V0X3NlbnNvcl9hZGV2X2FuZF9uYW1lKHN0cnVjdA0KPj4gZGV2aWNlICpk
ZXYsDQo+Pg0KPj4gIGludCBza2xfaW50MzQ3Ml9yZWdpc3Rlcl9jbG9jayhzdHJ1Y3QgaW50MzQ3
Ml9kaXNjcmV0ZV9kZXZpY2UgKmludDM0NzIsDQo+PiAgCQkJICAgICAgIHN0cnVjdCBhY3BpX3Jl
c291cmNlX2dwaW8gKmFncGlvLCB1MzIgcG9sYXJpdHkpOw0KPj4gK2ludCBza2xfaW50MzQ3Ml9y
ZWdpc3Rlcl9jbG9ja19zcmMoc3RydWN0IGludDM0NzJfZGlzY3JldGVfZGV2aWNlIA0KPj4gKypp
bnQzNDcyKTsNCj4+ICB2b2lkIHNrbF9pbnQzNDcyX3VucmVnaXN0ZXJfY2xvY2soc3RydWN0IGlu
dDM0NzJfZGlzY3JldGVfZGV2aWNlIA0KPj4gKmludDM0NzIpOw0KPj4NCj4+ICBpbnQgc2tsX2lu
dDM0NzJfcmVnaXN0ZXJfcmVndWxhdG9yKHN0cnVjdCBpbnQzNDcyX2Rpc2NyZXRlX2RldmljZSAN
Cj4+ICppbnQzNDcyLCBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvaW50
MzQ3Mi9kaXNjcmV0ZS5jDQo+PiBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL2ludDM0NzIv
ZGlzY3JldGUuYw0KPj4gaW5kZXggZWYwMjBlMjNlNTk2Li5kNWQ1YzY1MGQ2ZDIgMTAwNjQ0DQo+
PiAtLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9pbnQzNDcyL2Rpc2NyZXRlLmMNCj4+
ICsrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL2ludDM0NzIvZGlzY3JldGUuYw0KPj4g
QEAgLTMwOSw2ICszMDksOSBAQCBzdGF0aWMgaW50IHNrbF9pbnQzNDcyX3BhcnNlX2NycyhzdHJ1
Y3QNCj5pbnQzNDcyX2Rpc2NyZXRlX2RldmljZSAqaW50MzQ3MikNCj4+ICAJaWYgKHJldCA8IDAp
DQo+PiAgCQlyZXR1cm4gcmV0Ow0KPj4NCj4+ICsJLyogSWYgbm8gZ3BpbyBiYXNlZCBjbGsgcmVn
aXN0ZXJlZCwgdHJ5IHJlZ2lzdGVyIHdpdGggY2xvY2sgc291cmNlDQo+Ki8NCj4+ICsJc2tsX2lu
dDM0NzJfcmVnaXN0ZXJfY2xvY2tfc3JjKGludDM0NzIpOw0KPj4gKw0KPj4gIAlhY3BpX2Rldl9m
cmVlX3Jlc291cmNlX2xpc3QoJnJlc291cmNlX2xpc3QpOw0KPj4NCj4+ICAJaW50MzQ3Mi0+Z3Bp
b3MuZGV2X2lkID0gaW50MzQ3Mi0+c2Vuc29yX25hbWU7IEBAIC0zNTYsNiArMzU5LDcgQEAgDQo+
PiBzdGF0aWMgaW50IHNrbF9pbnQzNDcyX2Rpc2NyZXRlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+PiAgCWludDM0NzItPmFkZXYgPSBhZGV2Ow0KPj4gIAlpbnQzNDcyLT5k
ZXYgPSAmcGRldi0+ZGV2Ow0KPj4gIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBpbnQzNDcy
KTsNCj4+ICsJaW50MzQ3Mi0+Y2xvY2suaW1nY2xrX2luZGV4ID0gY2xkYi5jbG9ja19zb3VyY2U7
DQo+Pg0KPj4gIAlyZXQgPSBza2xfaW50MzQ3Ml9nZXRfc2Vuc29yX2FkZXZfYW5kX25hbWUoJnBk
ZXYtPmRldiwgJmludDM0NzItIA0KPj5zZW5zb3IsDQo+PiAgCQkJCQkJICAgJmludDM0NzItPnNl
bnNvcl9uYW1lKTsNCg0K
