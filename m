Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4798664867F
	for <lists+linux-media@lfdr.de>; Fri,  9 Dec 2022 17:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiLIQ3F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Dec 2022 11:29:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiLIQ3D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Dec 2022 11:29:03 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBEB686F4E
        for <linux-media@vger.kernel.org>; Fri,  9 Dec 2022 08:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670603342; x=1702139342;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WCTtQCclqj36hQuNOBm03mtFTYjqoczSbltRnRHN2eg=;
  b=ep/HbCGUYUQiooMbcwNuyYmB5/HQ8+RHdZ4aGHZN36pi492lDKkZXk6a
   RIS31u9JvfuIx7hsOI9xEE7NCUAwMFzLx0QeHND+WrsY4Oc9DOKHu6V2O
   zn4MTNCFO05iC1rE0EQHatAns13hqPfnxgWx0QfePtsrKagoj0EtYek9B
   WSw2FGPLDm3S1lCy/+Ytd23Yr4kRRV8HIzWd6SPEPZsihaiVAgsK/mDT9
   XDcQPmlMVo+tNnAygfXv+ABeKyJVJ4rWdQOcEqcG72xpL/M5yCgwNsHej
   QlR5kQkNDFBgDnY4XSLbttqgRKz/f4VXMQM9h6MF2PhxW7gtD9/Rw8BjQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="381798299"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="381798299"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 08:29:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="892721558"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="892721558"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga006.fm.intel.com with ESMTP; 09 Dec 2022 08:29:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 9 Dec 2022 08:29:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 9 Dec 2022 08:29:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 9 Dec 2022 08:29:01 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 9 Dec 2022 08:29:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/2xt0YlWlu6rhArOt3MCMcTuCTm3fU0Q04DNoeFB11z9jnfAPgeTFTt9I0yr1FthrBNhXGWYnr3wxUH1VUQYP95+Pf3WZtP/XoptgMn7Ap1afRCsYvNdZU8fCT5f0iUzR2H40wQbC85KDgRRuhftAspGYFYDM8L+HTDL6HXYaNOfjRtOVu59gh6wkG2NdPNmZLjoi7qpEe3GQgAJ1pFI42UW/1xYLxY4EvOCRJO6dIvkzUYfXLcYhJHUxSgCQhWHOuTtZizB247ELtm2mXtbpROFpjngovsCZ1wdkTP8kdwXGUaW2Y3UQMsyU0qFS/LEAI5XD/7Z+dez45PkkeS8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCTtQCclqj36hQuNOBm03mtFTYjqoczSbltRnRHN2eg=;
 b=RM/SFDob2SMy47ah32fjI7U52PaFVyAoTWYmifCZOod77uh8kY/CGoZgjhZ6MlDCGHJ1TSQYBW4hyOQewdBjTHa0sSfApslADVYvFvXMi7cEcA2oSFn9QXiX+RPCMdCYbLqHs48OhCjARsH89REkpbcxJiL9oPmv+nUUYr/kNsuL1Vr6twiWsPh+CoxmGvwTX6ALLToB46tSU+qHbim7g/tyFupH8CDWUSEYYgr0qKy/iWKk9YBZdu2NnexY+LbPQeLalUxeDl0V0+4X6kDe3wRUjvL/D9tbyeJOZMYUfdtd4Man+FR8VjAYl1Z0f5Rg+TayrXcF96OsP6FQ/95/Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 CH0PR11MB5476.namprd11.prod.outlook.com (2603:10b6:610:d7::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14; Fri, 9 Dec 2022 16:28:58 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::d9e7:a3d2:e99:632a]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::d9e7:a3d2:e99:632a%8]) with mapi id 15.20.5880.014; Fri, 9 Dec 2022
 16:28:58 +0000
From:   "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To:     =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= 
        <ckoenig.leichtzumerken@gmail.com>,
        "quic_charante@quicinc.com" <quic_charante@quicinc.com>,
        "cuigaosheng1@huawei.com" <cuigaosheng1@huawei.com>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
CC:     "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH] dma-buf: fix dma_buf_export init order v2
Thread-Topic: [PATCH] dma-buf: fix dma_buf_export init order v2
Thread-Index: AQHZC54ecr+Y7GO6O0uQE7orK/lqIa5lvy3w
Date:   Fri, 9 Dec 2022 16:28:58 +0000
Message-ID: <DM5PR11MB1324800C9F9755A0DA45023FC11C9@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20221209071535.933698-1-christian.koenig@amd.com>
In-Reply-To: <20221209071535.933698-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR11MB1324:EE_|CH0PR11MB5476:EE_
x-ms-office365-filtering-correlation-id: 322fab9d-c415-4ef9-3b30-08dada027921
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zT4XRz96Zd82d2Q8XrVfh/z7hzU/1s+ZR8k4G4OrNp/0bS9vzr4a3ZRwGjcmDiIda+rzdZk94sStkzZ6/463CMnLHilQ5y7odALAVdombCnOcHg5b+remBRWNBM4AXDkglIqT+a2ncAEX8F1WLNPGISi/x+iXhnTdjMiBD4Ld5RKe6QNre+gSQVZTfQlvLZ3QDts8K80TP+bD5KLZ3p+GDtURkye/I+kJFThoKRcweTwQXM4F6serjaW1m0/bqIhvpqtF17LSudCi6Kn41PU9hvK1/8yhZn7y/ixz12q1iYRo4DhZkRlexR3OuZIOJeVo82yPNAEFJCrePp5X0+ttsqIU7YLWy9d2pZW70joBePmYV0ya/Kcsg5OQZA2eFiHp3ButnjHVpBTgkXKPjkIOmaFxmjmX0QKWLykXh2okTWf5IHF3sJAICpVPxu64bOSDls9yvR0BMfZ+bQeUcjyVcLgBLDUEsPNnBCjqWFqo/ZpldtNjP5EW+umm4XWt6nqViAn355BCapdj05KmRD9xFf+6RxS/x9traAHic5W8ui6s69PdsHGuyWNbSX2uZ/tklBUxU4DUenq5y7UPxoiBnDwht/UI2cmZpbEXRoahN5L8BU3EY1jj8OWnE1ulfz266Qx8YEzfkwl1lr3+c4UoLZ8YRiPKI7l6do5+PBngBqiMxAuMRBP3128CdhKGNSUJqk5bgruMrVH/E1YgCI+oQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1324.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199015)(83380400001)(52536014)(2906002)(41300700001)(186003)(5660300002)(66574015)(8936002)(82960400001)(26005)(64756008)(4326008)(66556008)(38100700002)(66476007)(8676002)(76116006)(122000001)(66446008)(66946007)(110136005)(478600001)(9686003)(316002)(33656002)(71200400001)(54906003)(86362001)(38070700005)(7696005)(6506007)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDFXRWYyRlVmY1B5RTZUcmJ1TUp4RXhoU3hnVUVuNXowU2xEUDg1K0RiamFU?=
 =?utf-8?B?OG40QXlMcUs2TkhFdFVESDBGdGs5dmZoRG5GU1FBVlVjQ3l1aDNYdHlkd3ZZ?=
 =?utf-8?B?b3BUTmdUdWtWdFlVYXJ5SHNBU1lhMUU1TWx6cDU0eGVsZWNtSkJiUDFVdXll?=
 =?utf-8?B?TWREeEVQUGFpTEFVRUNJTWlCRml3cXNHa2lNOXpQUHB4bTNBcFJSci9rR0lW?=
 =?utf-8?B?R2tvQjVCa1ZSSGJPWlBlU1JJWVJMRDQwb1loSDFvR2lWMCtvdWVlNWY1clV6?=
 =?utf-8?B?dUwzZnUrczZQL3pPb0ljSG5McFhsOXVpbWNTOU81N3VobTJKeWMzb0x4ZHNZ?=
 =?utf-8?B?ZzNFRVc4Q1VJaGdnREZ4cEZWTVl6VVdEeUY4bU1xNE1wanU0K1VCdmJtRzhT?=
 =?utf-8?B?bWVCaVllc0QzNnM4RXI1RGx3S3U3TFhTMk1WSlQvZ0sxZUpYblRpdXRJZlQ3?=
 =?utf-8?B?QjB5dlNPcXB6RTBmbDRmakpNMkpXOC9xNVRmM3JDT3h2MTFSa0NZMHJZUGRI?=
 =?utf-8?B?MnlLb3Jubks1eU4xMngySnYvM0tYejE4K3l2ZGp0NWE3U21DK0UyaDg1VUdB?=
 =?utf-8?B?OWpLVUlFNDBDUEh6VTFPM0R5ZXRseVBUcG01ejdPak91bXo1NStTcmlicUJZ?=
 =?utf-8?B?SWlrRlVVUnFwQ1RQbnNkUDZ6VkNBMUNZbExMdDE5TllMNjgrekMrYVZtMUFV?=
 =?utf-8?B?N1BZdkdyTWZBbXdpbHlCcFM3alRpMHl6Z1VRbHlzdFByWTUrUHBYaVNzQkw0?=
 =?utf-8?B?bUJUclVsVkU4Q2dWWXBwRHAwR2ZhbnJtYmh5eVVDL2xLQXFvRHdIWDRmbUhB?=
 =?utf-8?B?d0RIY3Q0SkpNOVJVb2tVbFVUT0NlOGIrblJEeGM0YW9yWFV3U1BZSHpvQlU0?=
 =?utf-8?B?Ti9rOXZOdFo4R2R3Zm5TNEVjQ0Z5Y2FaZU5XYzh1ZC9tZVRaZVVrc0VCMDBU?=
 =?utf-8?B?S0lHeXc5YjM5Rk1DZWR6V2JDUUdvTm0rcCsrekVzMjRBZTRKc0pOcStIQzRQ?=
 =?utf-8?B?Y1phSFZabTRhR0NKV2FZMlV0UURyd2VkditLdWxCUVVISTdNYnpNOHUvY2Vs?=
 =?utf-8?B?TjBQYnpxdkhKMjdBdElvaDlFUkI3Z2R5YytKSjhIUUlpeG94VjN5aTdINnJL?=
 =?utf-8?B?ZUY5VWVsSmhTU2diakhZanpSc21wcm5aSE5MbXcxUDRVZkVRNjlmK0xkb0hD?=
 =?utf-8?B?ek9DZTdvcWhuYnh0MUxGdGhLblNOQVY4Y0laSnFNMUJhY1pnNmRUUnZaczRR?=
 =?utf-8?B?TDdwb254dHp6MzlUMm92anprMjRYekE5ZDN2OTdvblI5aUZPbGdaNUFiSDk3?=
 =?utf-8?B?djl1SVZmNVBGdkExNm4xVkpERjlSd0RaYmE0eHE4YWcvc0pudFg3RHU3bGpF?=
 =?utf-8?B?TlZMK3haQnliL2JHdldNTFkzdlBlRUVnL2kwYkJNU0tlazZqa25rWlV0UEFQ?=
 =?utf-8?B?Qk9HVk0zUlhDOEtaRWp1TjZUZzdzYVlXWFRXSGFRRVptWmpYcC9Sb3BIa1NB?=
 =?utf-8?B?aW5NbldKUGZaM1hJOTRzMkJRWTIzT2JSWVBKaXBvd2owN3BweTQzYXp0YWZ1?=
 =?utf-8?B?d1QzZ0pOcStPMEw2SndKU0xxZnhVRlpQd3Y2WU5UOVBiVG4wbFAwMGpxMTNR?=
 =?utf-8?B?U0dvUXVTallvQkc3VUdGYUxUSXZvemFiUzBDeDc4ZkJnZ3ZNMTZBUzc1dnN5?=
 =?utf-8?B?dzVERXNsMWFWenc0RytpSXQzVFhTakIwQU1RTDUybmgvK1JBeUNaNzRjRFI2?=
 =?utf-8?B?K3dobTlVRkw2OFpYQlVsMXExQ1Z4S3krZmprZ3RSQjZOUFpXQXRYZDV3Mk5Z?=
 =?utf-8?B?Y2cyOGEyZ3RsZlEzV0NQa0pKSlJVSlNzVzNsTGd5Y2RxeDNYZEMxb2ttajNO?=
 =?utf-8?B?UW12My9iYXZPVWI1RXBnZUozbUt1Z21QZFNhSEJ5TEsvMW4yR3Z3SEVNSk1j?=
 =?utf-8?B?ZC91ZnJUdHZpWUVQZUhoM2RVU09DbGpjQ1FrdmEwYjdidDdaSmxoU1lwbU44?=
 =?utf-8?B?NUdRT1ZmOWlLZ2JVSWJtMmU1ZzhDTDIwNWVJRWJHaCtQdUpULzRXTHFHZ0RL?=
 =?utf-8?B?RG9xTDBRM2ZEUDEyTDd4Rjd3eHNkQWd4U3RNU0pJRVQ3bHIrYWFSci8wdmhH?=
 =?utf-8?Q?Fh4zHbQfVGhKWpK/wIrov48cZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 322fab9d-c415-4ef9-3b30-08dada027921
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 16:28:58.3201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WBnFU77T2tpM1/lVnwS1K8Ns7Z5HgpgG4Elr+ZsKXiN1gvCFjq3XYCt2PbeGq09ugtoq/8CF0vkCF7OMcd1dzenPTADOQp3zUCHgHtkENuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5476
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPkNocmlzdGlhbiBL
w7ZuaWcNCj5TZW50OiBGcmlkYXksIERlY2VtYmVyIDksIDIwMjIgMjoxNiBBTQ0KPlRvOiBxdWlj
X2NoYXJhbnRlQHF1aWNpbmMuY29tOyBjdWlnYW9zaGVuZzFAaHVhd2VpLmNvbTsNCj5zdW1pdC5z
ZW13YWxAbGluYXJvLm9yZw0KPkNjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmc7IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LQ0KPm1lZGlhQHZnZXIua2VybmVs
Lm9yZw0KPlN1YmplY3Q6IFtQQVRDSF0gZG1hLWJ1ZjogZml4IGRtYV9idWZfZXhwb3J0IGluaXQg
b3JkZXIgdjINCj4NCj5UaGUgaW5pdCBvcmRlciBhbmQgcmVzdWx0aW5nIGVycm9yIGhhbmRsaW5n
IGluIGRtYV9idWZfZXhwb3J0DQo+d2FzIHByZXR0eSBtZXNzeS4NCj4NCj5TdWJvcmRpbmF0ZSBv
YmplY3RzIGxpa2UgdGhlIGZpbGUgYW5kIHRoZSBzeXNmcyBrZXJuZWwgb2JqZWN0cw0KPndlcmUg
aW5pdGlhbGl6aW5nIGFuZCB3aXJpbmcgaXRzZWxmIHVwIHdpdGggdGhlIG9iamVjdCBpbiB0aGUN
Cj53cm9uZyBvcmRlciByZXN1bHRpbmcgbm90IG9ubHkgaW4gY29tcGxpY2F0aW5nIGFuZCBwYXJ0
aWFsbHkNCj5pbmNvcnJlY3QgZXJyb3IgaGFuZGxpbmcsIGJ1dCBhbHNvIGluIHB1Ymxpc2hpbmcg
b25seSBoYWx2ZQ0KPmluaXRpYWxpemVkIERNQS1idWYgb2JqZWN0cy4NCj4NCj5DbGVhbiB0aGlz
IHVwIHRob3VnaHRmdWxseSBieSBhbGxvY2F0aW5nIHRoZSBmaWxlIGluZGVwZW5kZW50DQo+b2Yg
dGhlIERNQS1idWYgb2JqZWN0LiBUaGVuIGFsbG9jYXRlIGFuZCBpbml0aWFsaXplIHRoZSBETUEt
YnVmDQo+b2JqZWN0IGl0c2VsZiwgYmVmb3JlIHB1Ymxpc2hpbmcgaXQgdGhyb3VnaCBzeXNmcy4g
SWYgZXZlcnl0aGluZw0KPndvcmtzIGFzIGV4cGVjdGVkIHRoZSBmaWxlIGlzIHRoZW4gY29ubmVj
dGVkIHdpdGggdGhlIERNQS1idWYNCj5vYmplY3QgYW5kIHB1Ymxpc2ggaXQgdGhyb3VnaCBkZWJ1
Z2ZzLg0KPg0KPkFsc28gYWRkcyB0aGUgbWlzc2luZyBkbWFfcmVzdl9maW5pKCkgaW50byB0aGUg
ZXJyb3IgaGFuZGxpbmcuDQo+DQo+djI6IGFkZCBzb21lIG1pc3NpbmcgY2hhbmdlcyB0byBkbWFf
YnVnX2dldGZpbGUoKSBhbmQgYSBtaXNzaW5nIE5VTEwNCj4gICAgY2hlY2sgaW4gZG1hX2J1Zl9m
aWxlX3JlbGVhc2UoKQ0KDQpMb29rcyBnb29kLg0KDQpSZXZpZXdlZC1ieTogTWljaGFlbCBKLiBS
dWhsIDxtaWNoYWVsLmoucnVobEBpbnRlbC5jb20+DQoNCk1pa2UNCg0KPlNpZ25lZC1vZmYtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4tLS0NCj4gZHJp
dmVycy9kbWEtYnVmL2RtYS1idWYtc3lzZnMtc3RhdHMuYyB8ICA3ICstLQ0KPiBkcml2ZXJzL2Rt
YS1idWYvZG1hLWJ1Zi1zeXNmcy1zdGF0cy5oIHwgIDQgKy0NCj4gZHJpdmVycy9kbWEtYnVmL2Rt
YS1idWYuYyAgICAgICAgICAgICB8IDg0ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQ0KPiAz
IGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDUyIGRlbGV0aW9ucygtKQ0KPg0KPmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi1zeXNmcy1zdGF0cy5jIGIvZHJpdmVy
cy9kbWEtYnVmL2RtYS0NCj5idWYtc3lzZnMtc3RhdHMuYw0KPmluZGV4IDJiYmEwYmFiY2I2Mi4u
NGI2ODBlMTBjMTVhIDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLXN5c2Zz
LXN0YXRzLmMNCj4rKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi1zeXNmcy1zdGF0cy5jDQo+
QEAgLTE2OCwxNCArMTY4LDExIEBAIHZvaWQgZG1hX2J1Zl91bmluaXRfc3lzZnNfc3RhdGlzdGlj
cyh2b2lkKQ0KPiAJa3NldF91bnJlZ2lzdGVyKGRtYV9idWZfc3RhdHNfa3NldCk7DQo+IH0NCj4N
Cj4taW50IGRtYV9idWZfc3RhdHNfc2V0dXAoc3RydWN0IGRtYV9idWYgKmRtYWJ1ZikNCj4raW50
IGRtYV9idWZfc3RhdHNfc2V0dXAoc3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0IGZpbGUg
KmZpbGUpDQo+IHsNCj4gCXN0cnVjdCBkbWFfYnVmX3N5c2ZzX2VudHJ5ICpzeXNmc19lbnRyeTsN
Cj4gCWludCByZXQ7DQo+DQo+LQlpZiAoIWRtYWJ1ZiB8fCAhZG1hYnVmLT5maWxlKQ0KPi0JCXJl
dHVybiAtRUlOVkFMOw0KPi0NCj4gCWlmICghZG1hYnVmLT5leHBfbmFtZSkgew0KPiAJCXByX2Vy
cigiZXhwb3J0ZXIgbmFtZSBtdXN0IG5vdCBiZSBlbXB0eSBpZiBzdGF0cw0KPm5lZWRlZFxuIik7
DQo+IAkJcmV0dXJuIC1FSU5WQUw7DQo+QEAgLTE5Miw3ICsxODksNyBAQCBpbnQgZG1hX2J1Zl9z
dGF0c19zZXR1cChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmKQ0KPg0KPiAJLyogY3JlYXRlIHRoZSBk
aXJlY3RvcnkgZm9yIGJ1ZmZlciBzdGF0cyAqLw0KPiAJcmV0ID0ga29iamVjdF9pbml0X2FuZF9h
ZGQoJnN5c2ZzX2VudHJ5LT5rb2JqLCAmZG1hX2J1Zl9rdHlwZSwNCj5OVUxMLA0KPi0JCQkJICAg
IiVsdSIsIGZpbGVfaW5vZGUoZG1hYnVmLT5maWxlKS0+aV9pbm8pOw0KPisJCQkJICAgIiVsdSIs
IGZpbGVfaW5vZGUoZmlsZSktPmlfaW5vKTsNCj4gCWlmIChyZXQpDQo+IAkJZ290byBlcnJfc3lz
ZnNfZG1hYnVmOw0KPg0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi1zeXNm
cy1zdGF0cy5oIGIvZHJpdmVycy9kbWEtYnVmL2RtYS0NCj5idWYtc3lzZnMtc3RhdHMuaA0KPmlu
ZGV4IGE0OWM2ZTI2NTBjYy4uN2E4YTk5NWI3NWJhIDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvZG1h
LWJ1Zi9kbWEtYnVmLXN5c2ZzLXN0YXRzLmgNCj4rKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1
Zi1zeXNmcy1zdGF0cy5oDQo+QEAgLTEzLDcgKzEzLDcgQEANCj4gaW50IGRtYV9idWZfaW5pdF9z
eXNmc19zdGF0aXN0aWNzKHZvaWQpOw0KPiB2b2lkIGRtYV9idWZfdW5pbml0X3N5c2ZzX3N0YXRp
c3RpY3Modm9pZCk7DQo+DQo+LWludCBkbWFfYnVmX3N0YXRzX3NldHVwKHN0cnVjdCBkbWFfYnVm
ICpkbWFidWYpOw0KPitpbnQgZG1hX2J1Zl9zdGF0c19zZXR1cChzdHJ1Y3QgZG1hX2J1ZiAqZG1h
YnVmLCBzdHJ1Y3QgZmlsZSAqZmlsZSk7DQo+DQo+IHZvaWQgZG1hX2J1Zl9zdGF0c190ZWFyZG93
bihzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmKTsNCj4gI2Vsc2UNCj5AQCAtMjUsNyArMjUsNyBAQCBz
dGF0aWMgaW5saW5lIGludCBkbWFfYnVmX2luaXRfc3lzZnNfc3RhdGlzdGljcyh2b2lkKQ0KPg0K
PiBzdGF0aWMgaW5saW5lIHZvaWQgZG1hX2J1Zl91bmluaXRfc3lzZnNfc3RhdGlzdGljcyh2b2lk
KSB7fQ0KPg0KPi1zdGF0aWMgaW5saW5lIGludCBkbWFfYnVmX3N0YXRzX3NldHVwKHN0cnVjdCBk
bWFfYnVmICpkbWFidWYpDQo+K3N0YXRpYyBpbmxpbmUgaW50IGRtYV9idWZfc3RhdHNfc2V0dXAo
c3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0IGZpbGUNCj4qZmlsZSkNCj4gew0KPiAJcmV0
dXJuIDA7DQo+IH0NCj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyBiL2Ry
aXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMNCj5pbmRleCBlNmYzNmMwMTRjNGMuLmViNmI1OTM2M2M0
ZiAxMDA2NDQNCj4tLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jDQo+KysrIGIvZHJpdmVy
cy9kbWEtYnVmL2RtYS1idWYuYw0KPkBAIC05NSwxMCArOTUsMTEgQEAgc3RhdGljIGludCBkbWFf
YnVmX2ZpbGVfcmVsZWFzZShzdHJ1Y3QgaW5vZGUgKmlub2RlLA0KPnN0cnVjdCBmaWxlICpmaWxl
KQ0KPiAJCXJldHVybiAtRUlOVkFMOw0KPg0KPiAJZG1hYnVmID0gZmlsZS0+cHJpdmF0ZV9kYXRh
Ow0KPi0NCj4tCW11dGV4X2xvY2soJmRiX2xpc3QubG9jayk7DQo+LQlsaXN0X2RlbCgmZG1hYnVm
LT5saXN0X25vZGUpOw0KPi0JbXV0ZXhfdW5sb2NrKCZkYl9saXN0LmxvY2spOw0KPisJaWYgKGRt
YWJ1Zikgew0KPisJCW11dGV4X2xvY2soJmRiX2xpc3QubG9jayk7DQo+KwkJbGlzdF9kZWwoJmRt
YWJ1Zi0+bGlzdF9ub2RlKTsNCj4rCQltdXRleF91bmxvY2soJmRiX2xpc3QubG9jayk7DQo+Kwl9
DQo+DQo+IAlyZXR1cm4gMDsNCj4gfQ0KPkBAIC01MjMsMTcgKzUyNCwxNyBAQCBzdGF0aWMgaW5s
aW5lIGludCBpc19kbWFfYnVmX2ZpbGUoc3RydWN0IGZpbGUgKmZpbGUpDQo+IAlyZXR1cm4gZmls
ZS0+Zl9vcCA9PSAmZG1hX2J1Zl9mb3BzOw0KPiB9DQo+DQo+LXN0YXRpYyBzdHJ1Y3QgZmlsZSAq
ZG1hX2J1Zl9nZXRmaWxlKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsIGludCBmbGFncykNCj4rc3Rh
dGljIHN0cnVjdCBmaWxlICpkbWFfYnVmX2dldGZpbGUoc2l6ZV90IHNpemUsIGludCBmbGFncykN
Cj4gew0KPiAJc3RhdGljIGF0b21pYzY0X3QgZG1hYnVmX2lub2RlID0gQVRPTUlDNjRfSU5JVCgw
KTsNCj4tCXN0cnVjdCBmaWxlICpmaWxlOw0KPiAJc3RydWN0IGlub2RlICppbm9kZSA9IGFsbG9j
X2Fub25faW5vZGUoZG1hX2J1Zl9tbnQtPm1udF9zYik7DQo+KwlzdHJ1Y3QgZmlsZSAqZmlsZTsN
Cj4NCj4gCWlmIChJU19FUlIoaW5vZGUpKQ0KPiAJCXJldHVybiBFUlJfQ0FTVChpbm9kZSk7DQo+
DQo+LQlpbm9kZS0+aV9zaXplID0gZG1hYnVmLT5zaXplOw0KPi0JaW5vZGVfc2V0X2J5dGVzKGlu
b2RlLCBkbWFidWYtPnNpemUpOw0KPisJaW5vZGUtPmlfc2l6ZSA9IHNpemU7DQo+Kwlpbm9kZV9z
ZXRfYnl0ZXMoaW5vZGUsIHNpemUpOw0KPg0KPiAJLyoNCj4gCSAqIFRoZSAtPmlfaW5vIGFjcXVp
cmVkIGZyb20gZ2V0X25leHRfaW5vKCkgaXMgbm90IHVuaXF1ZSB0aHVzDQo+QEAgLTU0Nyw4ICs1
NDgsNiBAQCBzdGF0aWMgc3RydWN0IGZpbGUgKmRtYV9idWZfZ2V0ZmlsZShzdHJ1Y3QgZG1hX2J1
Zg0KPipkbWFidWYsIGludCBmbGFncykNCj4gCQkJCSBmbGFncywgJmRtYV9idWZfZm9wcyk7DQo+
IAlpZiAoSVNfRVJSKGZpbGUpKQ0KPiAJCWdvdG8gZXJyX2FsbG9jX2ZpbGU7DQo+LQlmaWxlLT5w
cml2YXRlX2RhdGEgPSBkbWFidWY7DQo+LQlmaWxlLT5mX3BhdGguZGVudHJ5LT5kX2ZzZGF0YSA9
IGRtYWJ1ZjsNCj4NCj4gCXJldHVybiBmaWxlOw0KPg0KPkBAIC02MTQsMTkgKzYxMywxMSBAQCBz
dHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1Zl9leHBvcnQoY29uc3Qgc3RydWN0DQo+ZG1hX2J1Zl9leHBv
cnRfaW5mbyAqZXhwX2luZm8pDQo+IAlzaXplX3QgYWxsb2Nfc2l6ZSA9IHNpemVvZihzdHJ1Y3Qg
ZG1hX2J1Zik7DQo+IAlpbnQgcmV0Ow0KPg0KPi0JaWYgKCFleHBfaW5mby0+cmVzdikNCj4tCQlh
bGxvY19zaXplICs9IHNpemVvZihzdHJ1Y3QgZG1hX3Jlc3YpOw0KPi0JZWxzZQ0KPi0JCS8qIHBy
ZXZlbnQgJmRtYV9idWZbMV0gPT0gZG1hX2J1Zi0+cmVzdiAqLw0KPi0JCWFsbG9jX3NpemUgKz0g
MTsNCj4tDQo+LQlpZiAoV0FSTl9PTighZXhwX2luZm8tPnByaXYNCj4tCQkJICB8fCAhZXhwX2lu
Zm8tPm9wcw0KPi0JCQkgIHx8ICFleHBfaW5mby0+b3BzLT5tYXBfZG1hX2J1Zg0KPi0JCQkgIHx8
ICFleHBfaW5mby0+b3BzLT51bm1hcF9kbWFfYnVmDQo+LQkJCSAgfHwgIWV4cF9pbmZvLT5vcHMt
PnJlbGVhc2UpKSB7DQo+KwlpZiAoV0FSTl9PTighZXhwX2luZm8tPnByaXYgfHwgIWV4cF9pbmZv
LT5vcHMNCj4rCQkgICAgfHwgIWV4cF9pbmZvLT5vcHMtPm1hcF9kbWFfYnVmDQo+KwkJICAgIHx8
ICFleHBfaW5mby0+b3BzLT51bm1hcF9kbWFfYnVmDQo+KwkJICAgIHx8ICFleHBfaW5mby0+b3Bz
LT5yZWxlYXNlKSkNCj4gCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4tCX0NCj4NCj4gCWlm
IChXQVJOX09OKGV4cF9pbmZvLT5vcHMtPmNhY2hlX3NndF9tYXBwaW5nICYmDQo+IAkJICAgIChl
eHBfaW5mby0+b3BzLT5waW4gfHwgZXhwX2luZm8tPm9wcy0+dW5waW4pKSkNCj5AQCAtNjM4LDEw
ICs2MjksMjEgQEAgc3RydWN0IGRtYV9idWYgKmRtYV9idWZfZXhwb3J0KGNvbnN0IHN0cnVjdA0K
PmRtYV9idWZfZXhwb3J0X2luZm8gKmV4cF9pbmZvKQ0KPiAJaWYgKCF0cnlfbW9kdWxlX2dldChl
eHBfaW5mby0+b3duZXIpKQ0KPiAJCXJldHVybiBFUlJfUFRSKC1FTk9FTlQpOw0KPg0KPisJZmls
ZSA9IGRtYV9idWZfZ2V0ZmlsZShleHBfaW5mby0+c2l6ZSwgZXhwX2luZm8tPmZsYWdzKTsNCj4r
CWlmIChJU19FUlIoZmlsZSkpIHsNCj4rCQlyZXQgPSBQVFJfRVJSKGZpbGUpOw0KPisJCWdvdG8g
ZXJyX21vZHVsZTsNCj4rCX0NCj4rDQo+KwlpZiAoIWV4cF9pbmZvLT5yZXN2KQ0KPisJCWFsbG9j
X3NpemUgKz0gc2l6ZW9mKHN0cnVjdCBkbWFfcmVzdik7DQo+KwllbHNlDQo+KwkJLyogcHJldmVu
dCAmZG1hX2J1ZlsxXSA9PSBkbWFfYnVmLT5yZXN2ICovDQo+KwkJYWxsb2Nfc2l6ZSArPSAxOw0K
PiAJZG1hYnVmID0ga3phbGxvYyhhbGxvY19zaXplLCBHRlBfS0VSTkVMKTsNCj4gCWlmICghZG1h
YnVmKSB7DQo+IAkJcmV0ID0gLUVOT01FTTsNCj4tCQlnb3RvIGVycl9tb2R1bGU7DQo+KwkJZ290
byBlcnJfZmlsZTsNCj4gCX0NCj4NCj4gCWRtYWJ1Zi0+cHJpdiA9IGV4cF9pbmZvLT5wcml2Ow0K
PkBAIC02NTMsNDQgKzY1NSwzNiBAQCBzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1Zl9leHBvcnQoY29u
c3Qgc3RydWN0DQo+ZG1hX2J1Zl9leHBvcnRfaW5mbyAqZXhwX2luZm8pDQo+IAlpbml0X3dhaXRx
dWV1ZV9oZWFkKCZkbWFidWYtPnBvbGwpOw0KPiAJZG1hYnVmLT5jYl9pbi5wb2xsID0gZG1hYnVm
LT5jYl9vdXQucG9sbCA9ICZkbWFidWYtPnBvbGw7DQo+IAlkbWFidWYtPmNiX2luLmFjdGl2ZSA9
IGRtYWJ1Zi0+Y2Jfb3V0LmFjdGl2ZSA9IDA7DQo+KwltdXRleF9pbml0KCZkbWFidWYtPmxvY2sp
Ow0KPisJSU5JVF9MSVNUX0hFQUQoJmRtYWJ1Zi0+YXR0YWNobWVudHMpOw0KPg0KPiAJaWYgKCFy
ZXN2KSB7DQo+LQkJcmVzdiA9IChzdHJ1Y3QgZG1hX3Jlc3YgKikmZG1hYnVmWzFdOw0KPi0JCWRt
YV9yZXN2X2luaXQocmVzdik7DQo+KwkJZG1hYnVmLT5yZXN2ID0gKHN0cnVjdCBkbWFfcmVzdiAq
KSZkbWFidWZbMV07DQo+KwkJZG1hX3Jlc3ZfaW5pdChkbWFidWYtPnJlc3YpOw0KPisJfSBlbHNl
IHsNCj4rCQlkbWFidWYtPnJlc3YgPSByZXN2Ow0KPiAJfQ0KPi0JZG1hYnVmLT5yZXN2ID0gcmVz
djsNCj4NCj4tCWZpbGUgPSBkbWFfYnVmX2dldGZpbGUoZG1hYnVmLCBleHBfaW5mby0+ZmxhZ3Mp
Ow0KPi0JaWYgKElTX0VSUihmaWxlKSkgew0KPi0JCXJldCA9IFBUUl9FUlIoZmlsZSk7DQo+Kwly
ZXQgPSBkbWFfYnVmX3N0YXRzX3NldHVwKGRtYWJ1ZiwgZmlsZSk7DQo+KwlpZiAocmV0KQ0KPiAJ
CWdvdG8gZXJyX2RtYWJ1ZjsNCj4tCX0NCj4NCj4rCWZpbGUtPnByaXZhdGVfZGF0YSA9IGRtYWJ1
ZjsNCj4rCWZpbGUtPmZfcGF0aC5kZW50cnktPmRfZnNkYXRhID0gZG1hYnVmOw0KPiAJZG1hYnVm
LT5maWxlID0gZmlsZTsNCj4NCj4tCW11dGV4X2luaXQoJmRtYWJ1Zi0+bG9jayk7DQo+LQlJTklU
X0xJU1RfSEVBRCgmZG1hYnVmLT5hdHRhY2htZW50cyk7DQo+LQ0KPiAJbXV0ZXhfbG9jaygmZGJf
bGlzdC5sb2NrKTsNCj4gCWxpc3RfYWRkKCZkbWFidWYtPmxpc3Rfbm9kZSwgJmRiX2xpc3QuaGVh
ZCk7DQo+IAltdXRleF91bmxvY2soJmRiX2xpc3QubG9jayk7DQo+DQo+LQlyZXQgPSBkbWFfYnVm
X3N0YXRzX3NldHVwKGRtYWJ1Zik7DQo+LQlpZiAocmV0KQ0KPi0JCWdvdG8gZXJyX3N5c2ZzOw0K
Pi0NCj4gCXJldHVybiBkbWFidWY7DQo+DQo+LWVycl9zeXNmczoNCj4tCS8qDQo+LQkgKiBTZXQg
ZmlsZS0+Zl9wYXRoLmRlbnRyeS0+ZF9mc2RhdGEgdG8gTlVMTCBzbyB0aGF0IHdoZW4NCj4tCSAq
IGRtYV9idWZfcmVsZWFzZSgpIGdldHMgaW52b2tlZCBieSBkZW50cnlfb3BzLCBpdCBleGl0cw0K
Pi0JICogZWFybHkgYmVmb3JlIGNhbGxpbmcgdGhlIHJlbGVhc2UoKSBkbWFfYnVmIG9wLg0KPi0J
ICovDQo+LQlmaWxlLT5mX3BhdGguZGVudHJ5LT5kX2ZzZGF0YSA9IE5VTEw7DQo+LQlmcHV0KGZp
bGUpOw0KPiBlcnJfZG1hYnVmOg0KPisJaWYgKCFyZXN2KQ0KPisJCWRtYV9yZXN2X2ZpbmkoZG1h
YnVmLT5yZXN2KTsNCj4gCWtmcmVlKGRtYWJ1Zik7DQo+K2Vycl9maWxlOg0KPisJZnB1dChmaWxl
KTsNCj4gZXJyX21vZHVsZToNCj4gCW1vZHVsZV9wdXQoZXhwX2luZm8tPm93bmVyKTsNCj4gCXJl
dHVybiBFUlJfUFRSKHJldCk7DQo+LS0NCj4yLjM0LjENCg0K
