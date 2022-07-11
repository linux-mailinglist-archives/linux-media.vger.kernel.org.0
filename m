Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93360570B0A
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 21:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbiGKT6Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 15:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiGKT6P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 15:58:15 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E13285720D;
        Mon, 11 Jul 2022 12:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657569494; x=1689105494;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2Owfg+8Xs7u3AU8ArozMNs5Bms2DyqZl2JPC4yiSJ38=;
  b=Jyq9+BDHBL6RvoeYNwlFJL08tK7od0MG+Vfs4sbW6qOwlJb4Ke2iPEo/
   Gmy1p2UPNE89wTDjtGq/u3sqLBa6GL+mrlUgw/7GrBythtbLYmnjJtgJW
   NISVEE8FDoGjiPskSvXWdWe0vNp9HYE3CIM0dLZcObhjzPXE325hdwH8G
   0PgQnPCNVigIP1PyiXtccxh8/V/+fI8YKede5t/KlIq6ipuRbX6ktdN8V
   KqIwwei9QyUSM7VFW/dQFuAvzNXPJOJiFhCoLuf5hgz50cDhZ3Nj4OHiO
   7Td5HBN0UlQoRhsDrgKzmYQK9U0RePSprsy/gxWf/SiK+aZBGaRS4moqR
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="283510994"
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="283510994"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2022 12:58:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="622215412"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga008.jf.intel.com with ESMTP; 11 Jul 2022 12:58:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Jul 2022 12:58:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 11 Jul 2022 12:58:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 11 Jul 2022 12:58:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3dpMpiLE/vzd3ECFqY1uRqsM/yFK8pqP90IHIcK2Nx/G7FMfExb9i5k/IMUiOdswVKGAgZ2pv5Q+/fCtqh/9+wAm+teUwr9l3YGF6j/kLXnjHR/H1vMyapVMy05Sb5V7H1zl3T//rmJpQQ4alMHNONAsMSusDK7wqR6Z59IxZCJGuAdfwDkutbbr9mzXJV8+VfA2wIcnHMnByDzyb0pxgtY+DiN5lEF8xtndK9OZYwuGWICZPG6y6c7ypYtDr3Dnf24pDp6mRn1chHmTxEXkpxjt9J3XJ9DToTBjnstzpMYIlD84MzF3JZeom1MYzUTRmynrxIRXNZnBtFGxovmFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Owfg+8Xs7u3AU8ArozMNs5Bms2DyqZl2JPC4yiSJ38=;
 b=REnLYwPiqq0mPzfWyiSx/59YF9GNO0GF5yUIsWmqFvya9opwBx8WTcl578b4gUjkEPtS6GSU6poGhej7IEfmBk4CCLdXDtTyQzGz3a3fNNoF0+6XLUZe7RW18sDa67nuf/IoxFnDF/ksW8S+6nIXojr352MUThTWawXV0MkkSNfGprlquGEVHgOJw0K2dh29zrv3gNEdzb48EnHOIWfG1g7Hz01SNCzz6ASz93BV8Ec5V27LP0/xfsHmOg3tW4Lbd/p3jlqbLCwMKZKtxh3y7/inEedxihduM+uP6YHk6ny0Mk+MBvR3fWh0BHlB36S63OF0rK+TLOoMFCAJfh6wlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB3055.namprd11.prod.outlook.com (2603:10b6:805:dc::18)
 by MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 19:58:11 +0000
Received: from SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::dd4e:b4a9:f7ca:1b5b]) by SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::dd4e:b4a9:f7ca:1b5b%7]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 19:58:11 +0000
From:   "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>
To:     "Murphy, Paul J" <paul.j.murphy@intel.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 6/6] media: i2c: ov9282: Fix device detection
Thread-Topic: [PATCH 6/6] media: i2c: ov9282: Fix device detection
Thread-Index: AQHYlP6eivfBdYd3dUySws6rlcwo0a15lxoA
Date:   Mon, 11 Jul 2022 19:58:11 +0000
Message-ID: <2fabd63f6494770de39187e16a83b8ec50b90355.camel@intel.com>
References: <20220711081639.150153-1-alexander.stein@ew.tq-group.com>
         <20220711081639.150153-7-alexander.stein@ew.tq-group.com>
In-Reply-To: <20220711081639.150153-7-alexander.stein@ew.tq-group.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.3 (3.44.3-1.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ae47dd2-dac7-489f-537f-08da6377af34
x-ms-traffictypediagnostic: MW4PR11MB5872:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: obb9XkVcVh26OhfBp7gjVUoewcz/rztjFvtM3KGyvqt85JSTBKTDxuDxNz8FaIBC7ap3ckmLX+h0UkREftcB9GrXdyZ/u442wEkgOHiSg+qwO4KUI18l0hteJIO8lxu2T8yGa9WnVxOVcruh/8r7swi7LyGSwgiiwE0SIC31nx2gpz/FwwjDMU5Pd0hoFYzgCtEtIMNXbvbVFAKPIiK/aJjEMefoXT2OgJcf0arLftDOEyk8vo1q2+w/5ZEEugDHujaIgsszKUI85CUG3iDQMDtzKV+EaMrk7TwrVtyZa1669ViDoiBB5n3eRlFa0GCcJypffIlk1TYEoC8rGZ6u23xjbo3Q+iU3bspwBrEwYvA6HChkvO5wh3ns/rBJmZ3pB0tWSrq1C4zNs6ayrtuBglUiYYdNl385EM5qLqTErikhgLoLhYdnrrAJab7m8pfUwqNxQnWRYN8LPN4e4s54GuNpjI2MWwleh3O+epoYlYtXF4pgL7FKIr5iGX6qdVS8G0qUXLhL8bSUiFPgIGGzW809xPnxeb+7btrf58dpeDTARBA5Ecwy7D9CiXa3YNlXxt1cjzgyC1WQCuoim4QFXWCZQiI54IAn71ObpwFUXOEQJhcOcoaoc38wty4SxH5V+cIi+6h7qt7B43DXyByv0bpME6w3s0Uu2we5ltMkVGAw/0YALrhVs7SZSrSeJakPM2oTv671rrAUj+Zcy0qeJRoFktD6T4tgosjTZuJAt/89SLf8OHXEspVc4k3YhoQSDoFHhKomokp0HkvaeeNu9z5bjsRvDd8YUl96yDlUEnRVMaz9OXpifyRA2wU4+sms
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3055.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(396003)(136003)(39860400002)(346002)(38070700005)(71200400001)(83380400001)(110136005)(478600001)(82960400001)(8676002)(66946007)(91956017)(4326008)(76116006)(66476007)(64756008)(86362001)(54906003)(6486002)(66556008)(66446008)(122000001)(186003)(2616005)(316002)(6506007)(38100700002)(26005)(6512007)(41300700001)(2906002)(8936002)(36756003)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2Y0R2RIOFdOVldmdmFMdUlodDVlSzFWZzF1ajF3WWM0bWRJbEZDVzZWSk5h?=
 =?utf-8?B?QWhHdVIxMHNRdGl4aE12eFh0UW5yVEtJNkpFbUk4Q0hjZE1GM2dxVm5tNzVS?=
 =?utf-8?B?ZlNXNEtJTzZpOXU1QlNMakdiREpnd1M5clZUeEkxMk9Zb0s2dTFGU0wwQTFx?=
 =?utf-8?B?T2NrNTY5NDNRMlljbnJYdytwcDBhOGpBaDBVTFh1THdseW0raktHQlVHVUFD?=
 =?utf-8?B?WlhjaXdpUytBcXU2Ti9ack5EeHVIdUtuL1dQdU9HMEVTL1ArR3lZbGpna0Ix?=
 =?utf-8?B?R0lyQjdvYjRCTlVYUUtkaWlQZlU4MS9OZmZVZXltZWJhTXdaSHhQMGtrbmJh?=
 =?utf-8?B?UllUNjNBMTcydmRwYnZscUdNVTFZTytQbmIyLzMwVzRSMUdMaDY5RUszRWxu?=
 =?utf-8?B?dlNuMWwzSWc0U1pFV1o3Z3RjVmZ2b1pISUc5MWw2dEdSVklGYjlmVE5qTUNu?=
 =?utf-8?B?TWtLM2FwT1UxYWFHY1J4QStWT2JSc2sxUGduZWNhN3RUbm1VMHFLUUxBb09T?=
 =?utf-8?B?RTR3YlR6S2J1VHBVbmdZMHlkTnpFSmdPWFFCdEdLM3EwTG8zL0dqeHl6M2tN?=
 =?utf-8?B?dFhDTXA0dGdjdFFLMzU4UGt2MzRMbndoQ2RLK0RRMTBBbmc2OXFJVko4M2Fv?=
 =?utf-8?B?aU5PR3N5elo1NnVlODBGTDFuQW43QmhRK1NDZkVlWG1XUU42VWNYdkRKamt0?=
 =?utf-8?B?clpJMWdhZW9iblAzUldwbzdaMnQrV04rdFNZR0Jkejc4eWxiODdyM2N1Nm1X?=
 =?utf-8?B?YW4xcTF4QWJkREdrQ3BQV3Bjc2owcis3eDVFTkNUZmc0NnZRTThKTnZqZmZz?=
 =?utf-8?B?WTE0S1VsMUlJUTBKSjhZTnpnQm9LSTh3U3ZaY1dNMFFEUnNSV2RsQTdxMGtS?=
 =?utf-8?B?RW5WOG5SdEdhSk1jYWhHbnNqdmhyc1JSdU5GbFhpbStMa2JjdURkVFNVazBB?=
 =?utf-8?B?Q2ZPUC9lTHFnQWc1M2JSNUZES3RXZWFPN1cvVnI5Q2ZON24vUU14OC82UkNw?=
 =?utf-8?B?SUpWY3M1dnZoNEFEYXZ4L1Q4cFNxQWxtNFNLeGpITXFaTDliY1NGMWwvQmhY?=
 =?utf-8?B?SjNlb3lmSDlFUCtac3JQK21GTWVpQkhXVTZVSG5wQysrZmJEdUgwRHArUnFX?=
 =?utf-8?B?cjhIaEdjeDdtRVVzeklCOUkwelZlbzlWNU9ualVIWHE2c3MrYVRpYmU5NTVq?=
 =?utf-8?B?Nm9wc0xUdEluMmxKNys0ZWVwV2F5T0UzbnJYNGRjZWpzWGFHMmNwUXByWmlG?=
 =?utf-8?B?U1dsSURJZWpkMDN1Vld0K1A4SDNhM2o1TDRIOXpnTlZTWitxakV3ZG9MYUZy?=
 =?utf-8?B?dkJEN1diQTV5ZHN2Z2FkRUg5TEtUazBtVndNbG1FNTlTRGhmc1A2ZCtWV2NJ?=
 =?utf-8?B?OGFnSGVxalF1NmZZTU56emtjcmlBdUtsSVV6NVFMS3RoT0pGSldZVFFIVGdR?=
 =?utf-8?B?NWx2anpEOXQvS2pNaXZiZUNmRGRVSWppSU9kVWdNOWpwYy90TzZjbEFrWGhL?=
 =?utf-8?B?ZTJHTXBjWXJFNk9XQlNYMCtKbUxzUDZTYzRJMUVmaHk4QWNxYWhwL3gzU1Jo?=
 =?utf-8?B?aTFRRUFmcDkwMW10eE80bTh1VHgzUjVVTEZqa1M4U2RMUElUeEE2ZEladVo0?=
 =?utf-8?B?L2lBUnRKWlRYRmRNOGVBQndrcmZsNWhJcmZaTkhHMUQ5ZHZtenBOcmo1S2Fi?=
 =?utf-8?B?UVVkWEtockk4Qng4WVpKTTFPOEhzblNlaGZQbER5TFl1NTBZeDlDc0R3bC9Q?=
 =?utf-8?B?bDNVSnZNSk0yUEZrWlBCWno3RkMvTDZ6K2FpL29Dc25uS1lDcWFWU29RM09N?=
 =?utf-8?B?VlhpQ3lpV2NQSFVtelRDdC8xQVZUUlZOZ2llcG1pVExtUGM5ZnJQcThwbFFR?=
 =?utf-8?B?N05pOFpUOWRhTjFnclErVHhlT3F5Z1Z1dnNTWEVXZnJtQzllUE1EcmZCZnQz?=
 =?utf-8?B?MWNWMDIzU1hYNGV6dFRyQ0VaaTRSMVpGdFhManYwVWZ4eCtEU3ZBL1lhOWFr?=
 =?utf-8?B?MEZNUkw1RjZuL2xxWWFSQjJWTSsybmtrTEcxK1BLQ3JPK3gvdWFRU3FzNHk1?=
 =?utf-8?B?bUVwTGlxMjErcHRPUURZRWE0bUFmb0kybjV4aWk3RlJudzBPcGN3SkxZblpV?=
 =?utf-8?B?eUN4NkY5a2JDeklyQ0tHUE4yRDBHZlJDQisvZ1BXRmVsTlBjRmJybDNKVWUr?=
 =?utf-8?Q?J5ktas9xdC4+WCPRwT67rck=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBA76FAE25C23D418F30F0E15CDAEEAA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3055.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae47dd2-dac7-489f-537f-08da6377af34
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2022 19:58:11.7577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pvaIXMIXNq2NI7IZKSbQqCsAclnEvA6+WP7Z76kmODYb9kLRr97c79YrxAGEmAcWGB5Bho6tUa03Os5ge1dJogR1j1rFdku2NSn5WwspY4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5872
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gTW9uLCAyMDIyLTA3LTExIGF0IDEwOjE2ICswMjAwLCBBbGV4YW5kZXIgU3RlaW4gd3JvdGU6
Cj4gQXBwYXJlbnRseSB0aGUgVmlzaW9uIENvbXBvbmVudHMgbW9kZWwgKFZD4oCvTUlQSeKAr09W
OTI4MSkgZG9lcyBub3QKPiBzdXBwb3J0Cj4gYWRkcmVzcyBhdXRvLWluY3JlbWVudCwgc28gcHJv
YmUgZmFpbHMgd2l0aDoKPiBvdjkyODIgMi0wMDYwOiBjaGlwIGlkIG1pc21hdGNoOiA5MjgxIT05
MmZmCj4gSW5zdGVhZCB0d28gYSAxIGJ5dGUgcmVhZHMgdG8gY29tYmluZSB0aGUgcmVzdWx0LgoK
SSB0aGluayBzb21lIHdvcmQgaXMgbWlzc2luZyBmcm9tIHRoaXMgbGFzdCBzdGF0ZW1lbnQuCgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBTdGVpbiA8YWxleGFuZGVyLnN0ZWluQGV3LnRx
LWdyb3VwLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvbWVkaWEvaTJjL292OTI4Mi5jIHwgMTEgKysr
KysrKystLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL292OTI4Mi5jIGIvZHJpdmVy
cy9tZWRpYS9pMmMvb3Y5MjgyLmMKPiBpbmRleCBjM2ZhZjExYTk5YjUuLmM1MDdkOWQ0NTMxYSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lZGlhL2kyYy9vdjkyODIuYwo+ICsrKyBiL2RyaXZlcnMv
bWVkaWEvaTJjL292OTI4Mi5jCj4gQEAgLTc2MSwxMSArNzYxLDE2IEBAIHN0YXRpYyBpbnQgb3Y5
MjgyX3NldF9zdHJlYW0oc3RydWN0IHY0bDJfc3ViZGV2Cj4gKnNkLCBpbnQgZW5hYmxlKQo+IMKg
c3RhdGljIGludCBvdjkyODJfZGV0ZWN0KHN0cnVjdCBvdjkyODIgKm92OTI4MikKPiDCoHsKPiDC
oMKgwqDCoMKgwqDCoMKgaW50IHJldDsKPiArwqDCoMKgwqDCoMKgwqB1MzIgaWRbMl07Cj4gwqDC
oMKgwqDCoMKgwqDCoHUzMiB2YWw7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqByZXQgPSBvdjkyODJf
cmVhZF9yZWcob3Y5MjgyLCBPVjkyODJfUkVHX0lELCAyLCAmdmFsKTsKPiAtwqDCoMKgwqDCoMKg
wqBpZiAocmV0KQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+
ICvCoMKgwqDCoMKgwqDCoHJldCA9IG92OTI4Ml9yZWFkX3JlZyhvdjkyODIsIE9WOTI4Ml9SRUdf
SUQgKyAxLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAxLCAmaWRbMV0pOwoKUGxlYXNlIGFkZCBhIGNvbW1lbnQgZXhwbGFpbmluZyB3
aHkgcmVhZGluZyBvbmUgYnl0ZSBhdCBhIHRpbWUgaXMKbmVlZGVkLgoKPiArwqDCoMKgwqDCoMKg
wqBpZiAoIXJldCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gb3Y5Mjgy
X3JlYWRfcmVnKG92OTI4MiwgT1Y5MjgyX1JFR19JRCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDEsICZp
ZFswXSk7CgpTaG91bGRuJ3Qgd2UgcmV0dXJuIGluIGNhc2Ugb2YgZXJyb3I/IEFzIHRoZSBvcmln
aW5hbCBjb2RlIHdhcyBkb2luZz8KCj4gK8KgwqDCoMKgwqDCoMKgdmFsID0gaWRbMV07Cj4gK8Kg
wqDCoMKgwqDCoMKgdmFsIHw9IChpZFswXSA8PCA4KTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBp
ZiAodmFsICE9IE9WOTI4Ml9JRCkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ZGV2X2VycihvdjkyODItPmRldiwgImNoaXAgaWQgbWlzbWF0Y2g6ICV4IT0leCIsCgo=
