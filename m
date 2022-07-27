Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 517995833F8
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 22:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234221AbiG0UMd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 16:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234136AbiG0UMc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 16:12:32 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885A156B83;
        Wed, 27 Jul 2022 13:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658952750; x=1690488750;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6HhriGAmW2yCpE58kG1Kty8M7Cn5HySbn3TjM6ES3eA=;
  b=cC4Yx1wYbG6YyVhENt+gN5dxX1C2vYFD3vbOtsyqXYnBsIqR7Tqkt13j
   y38SxgSnPYYrNuPZ2Hp437JyEWc4zFVMPGNgtLoMMpo2+PBLB6/FiVL55
   GA5nCh9rXgx8iHWUYbBzocK45mXGgefEBywevbjjnxf6G1s3puGrINlc7
   1/PDHL2oJ+jx4Q493FMX0fAwnwNoIE9KqtKx57Cv9nRUbZuEIOgoBFz+5
   +iSSf0lh/q4ktx7/k6ahrGqMrvxGbvWoINfXrk9bmuttiLT7PQkVcEG69
   fltgS7O+Eo/ZfOIyFY2Iv8yW01jzOLExNom6iEmZkeNrAIR+8CDm7qHYT
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="289531416"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="289531416"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2022 13:12:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="742786499"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2022 13:12:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 13:12:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 27 Jul 2022 13:12:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 27 Jul 2022 13:12:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUx5r6TC6zzZnvh7haR+Hq68XaOqjl6s+gVNM8BR06qAb2mWYmX9bI42zwFXMSmVV7DgInx0TAjFYqF3fWLEDLfsDqxfevbtT3Te11G/Jbb0D3V01RRxFkQ2Jhs/pDzqttpqXJ7YnqrsEZO6z9bHW2UiJlPT/H6n5E6DAnS9q2heghQR57UvmpHwFdgQVJIFJGgDkea2+n0RvON995fjMy2YI1IMuQMNJVx+qqY/DbfWn02jddJQdXci7SN/FCcppPiKMHaMDsRfOuekgfn/BYSr06uIovzuF1VYxWMpjiQgrzzaeW9QZq9bpENC747BnVZQd4Rs8XFxfPv9Az2khg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HhriGAmW2yCpE58kG1Kty8M7Cn5HySbn3TjM6ES3eA=;
 b=GeVrH4dSZJWcV9R6sWruMfFuQdtUAKBqXyFU+/zJgiIvbt8oErEOgA18+ostI2xizUMIIFUT8RJM4YRFmTdWSZLtX/V/sGJ1+JF51VpZxJmeK+bJiLi0Jv7puETnex3FVXx0RoBs0FPrbB1p0fm0ta72G9o2uaoGHGJWDL+wGp5NdFt4WWEOIOBxNm3t1SgxI88THjTORup6W5kMNIGG5RJOY68EviO1TIZrezWEKuV+fnCMGFZDNJz8qBZLARVkTMYqwV3ast8uya19Hdwj6UKNYrugmRcxAo9U/5vbKiQgkda53/7UAb5UdP4EvenUMf/VIhv1VHvk1lxidD468g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB3055.namprd11.prod.outlook.com (2603:10b6:805:dc::18)
 by BYAPR11MB3413.namprd11.prod.outlook.com (2603:10b6:a03:8c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 20:12:22 +0000
Received: from SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::8d7e:2cf8:1437:2728]) by SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::8d7e:2cf8:1437:2728%7]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 20:12:22 +0000
From:   "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>
To:     "Murphy, Paul J" <paul.j.murphy@intel.com>,
        "jacopo@jmondi.org" <jacopo@jmondi.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>
CC:     "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        "andrey.konovalov@linaro.org" <andrey.konovalov@linaro.org>
Subject: Re: [PATCH v2 0/3] Add imx577 compatible to imx412
Thread-Topic: [PATCH v2 0/3] Add imx577 compatible to imx412
Thread-Index: AQHYmkek5t1+JbcQI0SKNYyjX2tilq2I9NaAgAnA9YA=
Date:   Wed, 27 Jul 2022 20:12:22 +0000
Message-ID: <57f8897de98b5433a66983d2e175b855c6c38d5c.camel@intel.com>
References: <20220718014215.1240114-1-bryan.odonoghue@linaro.org>
         <fe14541568ab201abac5cfd4914b750d54ef4aa6.camel@intel.com>
In-Reply-To: <fe14541568ab201abac5cfd4914b750d54ef4aa6.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.3 (3.44.3-1.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 146da2c0-9940-4a20-a69d-08da700c50b1
x-ms-traffictypediagnostic: BYAPR11MB3413:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xyUOELfOz/b8siRakUKkQlo/GzlyhlksB9GR2u0s6ERG832xUWpM0sBUiZ8BW5xBdQVnrkKj6h2qU3rNDAlCLVR3Ovfgc8Elq09tbb1E1/itvwzDjw6KlLrOKDvN1t0mnTP4kVua9FhUFpA5/qdFRKQnfqHZpYeBhOZeDbm9AsesxS94ZD9igdkvdBt6B1EEV9Bvwu21HH2dEB290x8ELiS1eJXxlYVTGVnWneOQ6canzPVOsUK3X/rqY3ccvn4e/VpXb6uGBhQw1R8WYPSuyzdQVw4uThWrAUCPJ0KtkceW4gzXOkdGWvZNhgt4eZalUWm7aAClrdCh1rIKK2HAx/rP/2oEJ3WXdoc8oVkTH9V+9apeUxEheUypuJD/tqtubaoGte4uln24vBTRGe8Ahl/5m5Lhs2H212MAUTD/Dv+45Hc0ts5kuNhfnXcLAXwvyqdItvIdzOuyYDqJ/p9C+g+coTyZE09gcTt7+BLSVv2/ACT/BJX/6RPy2p5R6ic288kbS5Fx2b1WXLWnAz2JT7Qph2V9dJNXACDqTjLbOewC6YEeEPU2am5/fpLgXuOmKGqkhvkvVm5PjK1wfqtCU+zfN8dO+H0rd7XiPgfhu6NEQKMMq/zvLh41OnAbq2+VBFjXD61QOI/4Ss9Xf0vGbvj0bTYz+gr3RiG8ZEHv85BofImjUxPS1485W3Ro3B6R94trRT5HevXS7yD/aCZH10pxCApLIvVC5p994OvviRZiMMCvDtX5xa2DJnNelxzCb9HbpTdQXUu7qt8b1fwTgpfWDupFPkCvEM5MPgbq5CxUJA+bj2C4iqxPUHKL4wSAQQMe/Ru7gnsUi5nDjIcxTg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3055.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(366004)(376002)(39860400002)(396003)(6506007)(86362001)(36756003)(41300700001)(91956017)(122000001)(2616005)(316002)(478600001)(38100700002)(2906002)(83380400001)(186003)(110136005)(38070700005)(54906003)(66446008)(66946007)(4326008)(966005)(66476007)(76116006)(66574015)(64756008)(6486002)(82960400001)(5660300002)(71200400001)(66556008)(8676002)(8936002)(6512007)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0cvemhsRnd6N2gwNk9GU08wVWRRZFhJdnZCRlJzbHJzMXFYN2ZwUWxBTlFE?=
 =?utf-8?B?ejNwOGpEY0RIZytXcVlzNjFvREFNdWxqTEdPaERaby9abnVISzBielRsNTlh?=
 =?utf-8?B?QlNFdyttbVl1NHhyTjcxWCt5ZXgyd2g1bWtTb2tvdWJKUlpBMHhmTlVUY1N0?=
 =?utf-8?B?cWFoYzUyZlRhYWo2ekRSWVRvN0JoRkVvbXlLeXJNVm5tbitjc2lRRXZvbTNE?=
 =?utf-8?B?dmxBR09lNDZTMTdoa2h4TDZQVitlaXVXT2UxU1Y5OEZpWm82aVl0SnZPQ1lk?=
 =?utf-8?B?VUNiNi9JSTBtSUZoWXdMa1hyZUJzZVhFUC9NWUZscU5LRGp1S0ZobHVpK0Zk?=
 =?utf-8?B?cEtQbXFOcmhPamNDeGdGOThNbVNiSGJtK1VXenlVd01UTmtiQ25pMlE0Tktv?=
 =?utf-8?B?K3NrSDNVVjZ6ZGRyanJ4TVllV1ZQVFR4Z042VmsxUjVWWnh0UnBnN2tTOEhy?=
 =?utf-8?B?SVBzNGtzZ2p0UERITmw4OXNZakhtLzJzR0dnSEVGc3Z6VjlsVmVpaUwwbEcw?=
 =?utf-8?B?RXZ0OFc0SXZxdmViQVJhd0M1OXZmSUxXMm4rclMwcnBlMjBPZGMwamtIS0lI?=
 =?utf-8?B?dEJCUkM5RGtrc1hUTnpUMytoSmV2YmtZa2xSc0F5UXpoWkJucTF0RmljbjBw?=
 =?utf-8?B?MnlyYVFFVkhlbU9iOXBuNEZWU0pHMUNUVzBBY0k1c2lJV0hNQnh5VVZtOWtS?=
 =?utf-8?B?SWVZVklZSWcyVmRaRUQwLzFHc09VSVJXZW1LQWZMZEZKYzVvYTR6ajIydUly?=
 =?utf-8?B?blBENi9kYzh1YXIzQVovaC9SUEEwODhjcWF4ZzdDaWxJbUN4QmwzZXNxdkFy?=
 =?utf-8?B?SzQzbnByQzJIZHlMOWxDYVNPWFB6SVBYNXFFWUY1NmYrR1NlTFZpZXUyalpJ?=
 =?utf-8?B?WlF0d0xjdzl1L2YrN2MzMGZUK3dKcmdmTUwzSEw3RFh2WFRMYXVvVERIUTVr?=
 =?utf-8?B?VTVuZTJPR1QwL2g3a2tDMnNuaVp3eG9YU0tRWXFieStYMHRsd21sajVSRk5V?=
 =?utf-8?B?dkxOckJsSEFXSitHUGpTdHNWRFFINlJkZFd6YTJmdE1iTUhETmV5TGd4TFFk?=
 =?utf-8?B?UkZNdDQ1YVlqT3hPSnlBSE1ySSt4MnlJcDdiZkRVOWxCdk5MOUdjMUpyaGp1?=
 =?utf-8?B?ajl5MkNreDJiK2tHaURRdmx2R2xnN0xSM1pKZHFsbXdGOFpURjlucUdabWIv?=
 =?utf-8?B?NVQyLzFrNFl2V3B2bjAxaVZHNSs1TmxUcUh5bVRWWUZ5TVpYL0tDRTlyaHdY?=
 =?utf-8?B?bW5wOXZ1RlYxSDhBWHJhRU5HYWJySzBPNy94Y2pYRGJBa3ZwQ3E1VDFwQ3pm?=
 =?utf-8?B?K0J3dldHNkhrdkI3alFHcjVtRlJxR2oxOGNNTnU4bHRNOTBhK004UldBZnZG?=
 =?utf-8?B?M29WU1JhdlBSTUlSb3FSamVaMXdKdGhDRWxET09hNWhsNzcxVUlaQVhUMUdP?=
 =?utf-8?B?cE8wYjc0aXNqV2lFV3MrSmVheVZ1eEdaV1cvTWdJRkNBeTNIR3RlVkdyS3Ay?=
 =?utf-8?B?eHpBM3psZDV1c2tRd2VXN0U0RHZ4NHppcTlPbWFkcWhoOTJWZ29VWlU0dGls?=
 =?utf-8?B?ZjlXMDZiOXFCZFhmLzZvMVdlTGVqQ1JmWnd5TUc3dGRWMUJuUlowMUpPTFRw?=
 =?utf-8?B?UitmcnBLd0ZGbkRFejhTcVc4SGhwL0lFbFRuYWdEeGpHck9IVEZydE9yaFoy?=
 =?utf-8?B?N2NCb2xwRmlCQTd0RW0rVGJxVDY3WWR5K2gyK0hKUlV1V3V6SFVBMFRIa3I3?=
 =?utf-8?B?NVB0TTUzM3cxWXRiSVNNUWsxWFdTQlBveU4xSVB3UkNHTllyVGRYYXJJdG5s?=
 =?utf-8?B?Y1IwMW9LeDRkMDdMMGtySFNteFF4Y1FoV2F4R29XcHc1ek9iQTZNMDIraEVD?=
 =?utf-8?B?VW9MTzVNM1c1eVUveDJEQTNBYnliMXhiWmhJeWdiZk0veXRNckx6VFM4ZGFr?=
 =?utf-8?B?ZlFiNm5HQ20zcVEvdW8xRFpHc25jTzRLckpQU0plZUhTYzdsWUxRdnIwQko5?=
 =?utf-8?B?bUJ1SEtvWU44UjMvUWJCemVKeGlCdEdmbUlMalp0cWtRRVordDRDcHZBbWFz?=
 =?utf-8?B?Q1hhakV1TkJtcXdRa2ZTNm1lSlVGTVp1QWVwOTFnQit0bmxrc1RYNlZSeDAz?=
 =?utf-8?B?OGNIRWFnZDhUdThtQTNuMEx3QzJjVXhRV0RyZjFBQUtjeXZmMENMZlJJYUMy?=
 =?utf-8?Q?jSXTYHvsg/sLfCTYqES3bAA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1BADC948507B141A45946471C601892@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3055.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 146da2c0-9940-4a20-a69d-08da700c50b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 20:12:22.1772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ok3k4HYVoA+YaJ9/BLnH7HCM3uX9PK7r4d72xEApwW9tQiZKD8Lc8gCmWPrNv78H6uEzE3Xwk9dMuMK43oW0ylARo3ThZzjyw+30so5ro3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3413
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gVGh1LCAyMDIyLTA3LTIxIGF0IDE2OjE1ICswMTAwLCBEYW5pZWxlIEFsZXNzYW5kcmVsbGkg
d3JvdGU6DQo+IEhpIEJyeWFuLA0KPiANCj4gT24gTW9uLCAyMDIyLTA3LTE4IGF0IDAyOjQyICsw
MTAwLCBCcnlhbiBPJ0Rvbm9naHVlIHdyb3RlOg0KPiA+IFYyOg0KPiA+IFNha2FyaSB3YXNuJ3Qg
ZXNwZWNpYWxseSBzYXRpc2ZpZWQgd2l0aCB0aGUgYW5zd2VyIGlteDQxMiBhbmQgaW14NTc3IGhh
dmUNCj4gPiB0aGUgc2FtZSBpbml0IHNlcXVlbmNlIGJ1dCwgc3VnZ2VzdGVkIHNldHRpbmcgdGhl
IHN0cmluZyBmb3IgaW14NTc3IGFzIGlzDQo+ID4gZG9uZSBpbiB0aGUgY2NzIGRyaXZlci4NCj4g
PiANCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjA2MDcxMzQwNTcuMjQyNzY2
My0zLWJyeWFuLm9kb25vZ2h1ZUBsaW5hcm8ub3JnL3QvDQo+ID4gDQo+ID4gSSB3ZW50IHRvIGxv
b2sgYXQgdGhhdCBhbmQgYXNrZWQgbXlzZWxmICJob3cgd291bGQgSSB0ZWxsIHRoZSBkaWZmZXJl
bmNlDQo+ID4gYmV0d2VlbiB0aGUgdHdvIHNpbGljb24gcGFydHMiLiBUaGUgb2J2aW91cyBhbnN3
ZXIgaXMgYSBjaGlwIGlkZW50aWZpZXIuDQo+ID4gDQo+ID4gTHVja2lseSB0aGlzIGNsYXNzIG9m
IElNWCBzZW5zb3IgaGFzIGEgY2hpcCBpZGVudGlmaWVyIGF0IG9mZnNldCAweDAwMTYuDQo+ID4g
DQo+ID4gVGhhdCBsb29rcyBsaWtlIHRoaXMgZm9yIGlteDI1OCwgaW14MzE5IGFuZCBpbXgzNTUN
Cj4gPiANCj4gPiBkcml2ZXJzL21lZGlhL2kyYy9pbXgyNTguYzojZGVmaW5lIElNWDI1OF9SRUdf
Q0hJUF9JRMKgwqDCoCAweDAwMTYNCj4gPiBkcml2ZXJzL21lZGlhL2kyYy9pbXgyNTguYzojZGVm
aW5lIElNWDI1OF9DSElQX0lEwqDCoMKgwqDCoMKgwqAgMHgwMjU4DQo+ID4gDQo+ID4gZHJpdmVy
cy9tZWRpYS9pMmMvaW14MzE5LmM6I2RlZmluZSBJTVgzMTlfUkVHX0NISVBfSUTCoMKgwqAgMHgw
MDE2DQo+ID4gZHJpdmVycy9tZWRpYS9pMmMvaW14MzE5LmM6I2RlZmluZSBJTVgzMTlfQ0hJUF9J
RMKgwqDCoMKgwqDCoMKgIDB4MDMxOQ0KPiA+IA0KPiA+IGRyaXZlcnMvbWVkaWEvaTJjL2lteDM1
NS5jOiNkZWZpbmUgSU1YMzU1X1JFR19DSElQX0lEwqDCoMKgIDB4MDAxNg0KPiA+IGRyaXZlcnMv
bWVkaWEvaTJjL2lteDM1NS5jOiNkZWZpbmUgSU1YMzU1X0NISVBfSUTCoMKgwqDCoMKgwqDCoCAw
eDAzNTUNCj4gPiANCj4gPiBidXQgdGhlbiBsb29rcyBsaWtlIHRoaXMgZm9yIGlteDQxMi4NCj4g
PiANCj4gPiBkcml2ZXJzL21lZGlhL2kyYy9pbXg0MTIuYzojZGVmaW5lIElNWDQxMl9SRUdfSUTC
oMKgwqDCoMKgwqDCoMKgIDB4MDAxNg0KPiA+IGRyaXZlcnMvbWVkaWEvaTJjL2lteDQxMi5jOiNk
ZWZpbmUgSU1YNDEyX0lEwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4NTc3DQo+ID4gDQo+ID4g
VGhpcyBtYWRlIG5vIHNlbnNlIGF0IGFsbCB0byBtZSwgd2h5IGlzIHRoZSBpbXg0MTIgZHJpdmVy
IG5vdCBuYW1lZCBpbXg1NzcgPw0KPiANCj4gSSB0cmllZCB0byByZWFjaGVkIG91dCB0byB0aGUg
Y29sbGVhZ3VlcyB3aG8gd3JvdGUgdGhlIGRyaXZlciBidXQgaXQNCj4gc2VlbXMgdGhleSBhcmUg
bm90IGluIHRoZSBjb21wYW55IGFueW1vcmUuDQo+IA0KPiBIb3dldmVyLCBJIG1hbmFnZWQgdG8g
Z2V0IHRoZSBpbXg0MTIgcmVnaXN0ZXIgbWFwIGRvY3VtZW50YXRpb24gdGhleQ0KPiB1c2VkIHdo
aWxlIGRldmVsb3BpbmcgdGhlIGRyaXZlciBhbmQgdGhlIHZhbHVlIGF0IG9mZnNldCAweDAwMTYg
aXMNCj4gcmVwb3J0ZWQgdG8gYmUgMHgwNTc3Lg0KPiANCj4gSSBhZ3JlZSB0aGlzIGlzIHN0cmFu
Z2UsIHNvLCBuZXh0IHdlZWssIEknbGwgdHJ5IHRvIHNlZSBpZiBJIGNhbiBnZXQgbXkNCj4gaGFu
ZHMgb24gYW4gaW14NDEyIHNlbnNvciB0byB2ZXJpZnkgdGhlIHZhbHVlIHJlcG9ydGVkIGJ5IHRo
ZSBIVy4NCg0KSSBtYW5hZ2VkIHRvIGdldCBvbmUgb2YgdGhlIGlteDQxMiBzZW5zb3JzIHRoYXQg
d2VyZSB1c2VkIGZvciB0aGUNCmRldmVsb3BtZW50IG9mIHRoaXMgZHJpdmVyIGFuZCBJIGNhbiBj
b25maXJtIHRoYXQgdGhlIENISVAgSUQgcmVwb3J0ZWQNCmJ5IHRoZSBIVyBpcyAweDU3NyAoYXMg
c3BlY2lmaWVkIGluIHRoZSBkYXRhc2hlZXQgSSB3YXMgZ2l2ZW4pDQoNCkhvd2V2ZXIsIHNvbWVi
b2R5IFsxXSBvbiB0aGUgaW50ZXJuZXQgaXMgcmVwb3J0aW5nIHRoYXQgdGhlaXIgaW14NDEyDQpz
aG93cyBhIGRpZmZlcmVudCBJRCwgc28gaXQncyBwb3NzaWJsZSB0aGF0IGRpZmZlcmVudCBiYXRj
aGVzIG9mIGlteDQxMg0KaGF2ZSBkaWZmZXJlbnQgSURzIChwZXJoYXBzIFNvbnkgZml4ZWQgdGhl
IElEIGluY29uc2lzdGVuY3kgYXQgc29tZQ0KcG9pbnQpLiBCdXQgSSdkIGxpa2UgdG8gc2VlIG1v
cmUgZXZpZGVuY2Ugb2YgdGhpcy4NCg0KWzFdIGh0dHBzOi8vZGlzY3Vzcy45NmJvYXJkcy5vcmcv
dC9pbXg0MTItZHJpdmVyLXRyb3VibGVzaG9vdGluZy8xMTM1MA0KDQpBbnl3YXksIHJlZ2FyZGxl
c3Mgb2YgdGhlIElELCBJIHRoaW5rIHRoaXMgZHJpdmVyIHNob3VsZG4ndCBiZSByZW5hbWVkDQpi
ZWNhdXNlIGl0IHdhcyB3cml0dGVuIGZvciBpbXg0MTIsIHVzaW5nIGFuIGlteDQxMi4NCg0KSWYg
dGhlcmUgZXhpc3Qgb3RoZXIgaW14NDEyIGRldmljZXMgd2l0aCBhIGRpZmZlcmVudCBJRCwgSSB0
aGluayB3ZQ0Kc2hvdWxkIGp1c3QgYWRkIHN1cHBvcnQgZm9yIHRoYXQgSUQgdG8gdGhlIGRyaXZl
ci4NCg0KPiANCj4gSW4gdGhlIG1lYW50aW1lLCB3b3VsZCB5b3UgYmUgYWJsZSB0byBjaGVjayB3
aGF0IDE2LWJpdCB2YWx1ZSB0aGUNCj4gaW14NTc3IHNlbnNvciByZXBvcnRzIGF0IG9mZnNldCAw
eDAwMDAgKHdoaWNoLCBvbiBzb21lIElNWCBtb2RlbHMsDQo+IHNlZW1zIHRvIGJlIGFub3RoZXIg
SUQgcmVnaXN0ZXIpPw0KPiANCj4gPiANCj4gPiBJIHdlbnQgYW5kIGR1ZyBpbnRvIHRoZSBRdWFs
Y29tbSBjYW14L2NoaS1jZGsgc291cmNlcyB0byBmaW5kIHRoYXQgYSBmaWxlDQo+ID4gY2FsbGVk
IGNta19pbXg1Nzdfc2Vuc29yLnhtbCBoYXMgYSBwcm9wZXJ0eSBjYWxsZWQgc2Vuc29ySWQgd2hp
Y2ggaXMNCj4gPiBjb25zdHJhaW5lZCB0byAweDA1NzcuDQo+ID4gDQo+ID4gSW4gdGhlIFF1YWxj
b21tIHN0YWNrIHRoaXMgcGFpcmluZyBvZiBmaWxlbmFtZSBhbmQgaWRlbnRpZmllciBpcw0KPiA+
IG1haW50YWluZWQgZm9yIGlteDI1OCwgaW14Mzc2LCBpbXg0NzYsIGlteDU3NiwgaW14NTE5LCBp
bXgzNjIsIGlteDQ4MSwNCj4gPiBpbXgzMTggaW14MzM0IGFuZCBpbXgzODYuDQo+ID4gDQo+ID4g
RXZlcnkgc2luZ2xlIGV4YW1wbGUgSSBjYW4gZmluZCBvZiBhIFNvbnkgSU1YIHNlbnNvciB3aGlj
aCByZXR1cm5zIGEgY2hpcA0KPiA+IGlkZW50aWZpZXIgYXQgb2Zmc2V0IDB4MDAxNiBtYXRjaGVz
IHRoZSBkcml2ZXIgbmFtZSB0byB0aGUgcmV0dXJuZWQgc2Vuc29yDQo+ID4gaWQgYm90aCBoZXJl
IHVwc3RyZWFtIGluIExpbnV4IGFuZCBpbiBRdWFsY29tbSdzIGNhbXggc3RhY2suDQo+ID4gDQo+
ID4gVGhlIGNvbmNsdXNpb24gSSBkcmF3IGZyb20gdGhpcyBpcyB0aGF0IGlteDQxMi5jIGlzIGlu
YXBwcm9wcmlhdGVseSBuYW1lZC4NCj4gPiANCj4gPiBJIHRoaW5rIHRoZSByaWdodCB0aGluZyB0
byBkbyBpcyB0byByZW5hbWUgaW14NDEyIHRvIGlteDU3Ny4gSXQgaXMNCj4gPiBjb25mdXNpbmcg
YW5kIEkgdGhpbmsgd3JvbmcgdG8gcGFpciBpbXg0MTIuYyB3aXRoIGEgY2hpcCB3aGljaCBpZGVu
dGlmaWVzDQo+ID4gYXMgMHgwNTc3Lg0KPiA+IA0KPiA+IFYxOg0KPiA+IFJpZ2h0IG5vdyB0aGUg
aW14NDEyIGFuZCBpbXg1NzcgYXJlIGNvZGUgYW5kIHBpbiBjb21wYXRpYmxlIGhvd2V2ZXIsIHRo
ZXkNCj4gPiBhcmUgZGlzdGluY3QgcGllY2VzIG9mIHNpbGljb24uDQo+ID4gDQo+ID4gRG9jdW1l
bnQgaW14NTc3IGFzIGEgY29tcGF0aWJsZSBlbnVtIGFuZCBhZGQgdGhlIGNvbXBhdCBzdHJpbmcg
dG8gaW14NDEyLmMuDQo+ID4gVGhpcyBhbGxvd3MgdXMgdG8gZGlmZmVyZW50aWF0ZSB0aGVzZSBj
aGlwcyBpbiBEVFMgYW5kIHBvdGVudGlhbGx5IHRvIGFwcGx5DQo+ID4gYW55IGZ1dHVyZSBpbXg0
MTIgb3IgaW14NTc3IHNwZWNpZmljIGNoYW5nZXMgYXBwcm9wcmlhdGVseS4NCj4gPiANCj4gPiBC
cnlhbiBPJ0Rvbm9naHVlICgzKToNCj4gPiDCoCBtZWRpYTogZHQtYmluZGluZ3M6IG1lZGlhOiBS
ZW5hbWUgaW14NDEyIHRvIGlteDU3Nw0KPiA+IMKgIG1lZGlhOiBpMmM6IGlteDU3NzogUmVuYW1l
IGlteDQxMi5jIHRvIGlteDU3Ny5jDQo+ID4gwqAgbWVkaWE6IGkyYzogaW14NTc3OiBGaXggY2hp
cCBpZGVudGlmaWVyIGRlZmluZSBuYW1lDQo+ID4gDQo+ID4gwqAuLi4ve3NvbnksaW14NDEyLnlh
bWwgPT4gc29ueSxpbXg1NzcueWFtbH3CoMKgwqAgfMKgIDE4ICstDQo+ID4gwqBNQUlOVEFJTkVS
U8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgIDYgKy0NCj4gPiDCoGRyaXZlcnMvbWVkaWEvaTJjL0tjb25maWfC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDggKy0NCj4gPiDC
oGRyaXZlcnMvbWVkaWEvaTJjL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgwqAgMiArLQ0KPiA+IMKgZHJpdmVycy9tZWRpYS9pMmMve2lteDQxMi5jID0+
IGlteDU3Ny5jfcKgwqDCoMKgwqAgfCA2MjIgKysrKysrKysrLS0tLS0tLS0tDQo+ID4gwqA1IGZp
bGVzIGNoYW5nZWQsIDMyOCBpbnNlcnRpb25zKCspLCAzMjggZGVsZXRpb25zKC0pDQo+ID4gwqBy
ZW5hbWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy97c29ueSxp
bXg0MTIueWFtbCA9PiBzb255LGlteDU3Ny55YW1sfSAoODMlKQ0KPiA+IMKgcmVuYW1lIGRyaXZl
cnMvbWVkaWEvaTJjL3tpbXg0MTIuYyA9PiBpbXg1NzcuY30gKDU1JSkNCj4gPiANCj4gDQoNCg==
