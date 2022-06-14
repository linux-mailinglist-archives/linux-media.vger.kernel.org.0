Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 004E654AB5E
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 10:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355571AbiFNIC1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 04:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240296AbiFNICT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 04:02:19 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632C1286C4;
        Tue, 14 Jun 2022 01:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655193738; x=1686729738;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=b5qXyTKs9yEq9MVsMEfSSgoAjBwu5d2eu5KCnYF3faA=;
  b=ErX0SmadHRh+dSSEF1xSwNz3l1Bjpkw6atbwNSbAoglewxUNBxfSg/Q4
   /C7m/nt2VlYi9xJuSvNpkG1z+EsE5jR89uv+XUnppK2BvaGyX+lNXP0Sk
   H0cv9Be8/mj0/QXCnMnAItC3ZV2/LSJrL4JsP0mVcuqj8oLPqxajm/YfH
   CnpWoRqOAcEtkm7II4LLkEK+BuX2UTPZ+/IeKkldvcMOdV3cKW+J3Lwq1
   tKIKkeLSrOlWxwHUMSNWj9IuQE4AHUmChS2qh+GQN4NcXtULlyKLI6rKV
   1vx/50nFaxTjmFqkVrgvADJtKpz47LcGj11sUidsJH3p54+wWNq8GwRMh
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="340211099"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="340211099"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 01:02:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="651897212"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by fmsmga004.fm.intel.com with ESMTP; 14 Jun 2022 01:02:16 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 14 Jun 2022 01:02:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 14 Jun 2022 01:02:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 14 Jun 2022 01:02:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N319bqiKri0orlfUn5hpaQg9PtTfdKHWf3+DCELhNwuQvzykn8QJzqSyQ0ijt7qmeoD0g7aPn1nOFBTTRrBIygt8yBmtT4UTgamCPF8SeXsZfXF8sXhACKqaaEKr5d9IPAXPbP/wwrPOYoP47bdTGBHROJqHK53b5pQs85x8xG1HBxt3nVTPqxlZ93xqSMtg845vwotGp/fVTDq4/+EEJe4imKcpYpugDqOxKS082Xz2dtbR8mXUljJqbWoQi6HzVNrqLJN3eGYeM4LGco63I3CR8PXJePNxJTYNuwJBTcJZMcCmgbDyH4/MMZMdEK8c3c9L9596WyILbdy8JoKuEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5qXyTKs9yEq9MVsMEfSSgoAjBwu5d2eu5KCnYF3faA=;
 b=B/iZK4H9NGhqm/Gz5GZ32Uh8XOtBFHz5EoEefeN1Cm+VI/uimFdmwV7NybdnDgw8OF/mraH3j7/AeqQ7AgUuSx6n9Yow+0kMWgflHNUdHiph1yHZodHTgoNAX0kq22plYXRjErUIcQJIKu5I1WTBi36unPhPHeVwFUaxp9gSlaQzmwO36R27R1n5+1T3WQS79ZLPSKpe4HReY8zIWxNFrgtdz02ljKS6aLdO2RmwWeCo2hppVZHmX7niORICKYKG43GHCOxA00Ak0YM2wtkAUJpMt/hko3q6oJ8uLRpudnbQ9tMsTyRKX0lWLb78rBS5EKosrwiK5TVes3aGRekTvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB3055.namprd11.prod.outlook.com (2603:10b6:805:dc::18)
 by SJ0PR11MB5055.namprd11.prod.outlook.com (2603:10b6:a03:2d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Tue, 14 Jun
 2022 08:02:13 +0000
Received: from SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::dd4e:b4a9:f7ca:1b5b]) by SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::dd4e:b4a9:f7ca:1b5b%7]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 08:02:13 +0000
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
Subject: Re: [PATCH 2/2] media: i2c: imx412: Add imx577 compatible string
Thread-Topic: [PATCH 2/2] media: i2c: imx412: Add imx577 compatible string
Thread-Index: AQHYenRXomGjADE8XESfcpS7O9y3gK1OlTIA
Date:   Tue, 14 Jun 2022 08:02:13 +0000
Message-ID: <4e5aefa1dec1b90c9f43e175fdf82d75ad0fe46f.camel@intel.com>
References: <20220607134057.2427663-1-bryan.odonoghue@linaro.org>
         <20220607134057.2427663-3-bryan.odonoghue@linaro.org>
In-Reply-To: <20220607134057.2427663-3-bryan.odonoghue@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-5.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19bcd09f-00ab-4a01-0c06-08da4ddc30a2
x-ms-traffictypediagnostic: SJ0PR11MB5055:EE_
x-microsoft-antispam-prvs: <SJ0PR11MB50558EEA7982067189C9B281F2AA9@SJ0PR11MB5055.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IUflo6A0irCWRjcUMpOKUkapsSn/I7NXD/FEd+4OvxGc4UF8GE35CMfGacfc+sEXMZORZeyA8zxWbMGLYwYFDA8SyhviuJFMz93eE79EwXgDWfn4G/SymkbcywvxITlE+fMiphPuHWsOtl0SKw6LrTmeXy5IIHxGBirOgV68mGJmMyHdQKpR/P6Bs3h5vhkdw/S2izXgFfPjlu67AWTUlVV5+EOITRnD7cvO4255oDJrplusc5cYcxWTiB5vIyqgrmPjX7xkJobszi1lDZSPGUsEX8H85Q5Y0UW/NqUV26RHSff/6F2igIhPbwArqD1eeyNof1XPaOc3xsvlL4lyCtUXYUM3fdqXwwG69be4b7hOu0ctUv6/dwD663Q5HEL19m5FqUPdE2NqRkXeGrJIfIuJvgAfIS2vc61kBflRY7T9Xj79Yb/qd4VIzZiaghCIMyyOTiJAwjeujCGjtLtLaf8MHT+LjGPedQg87cgsb30xb+TUErLvdOvRxzdsBUT15yuI/rslW9o3lYGK+in9m7T20ZHGHx5HWiEz0oA8CGbM7b28wiUReA/jifcvEhYXPafMAiV5PB7SekOayqfA8hTEYAsANLShzPqp/bFh/UQr9LFkjLPK209i9oqpGagJheuaKlNWqqSwb500SZQv1PxJhtOc2j2YH2njR1KvxtwZHyid0oVr6EiegS8Wb7sgdlsyNpAKX3oiJazBqk/dqw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3055.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(38070700005)(66446008)(82960400001)(508600001)(66476007)(8936002)(122000001)(86362001)(2906002)(4326008)(66946007)(91956017)(54906003)(66556008)(64756008)(76116006)(6486002)(8676002)(186003)(71200400001)(316002)(110136005)(6506007)(26005)(38100700002)(36756003)(6512007)(5660300002)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzVIZW56aXAxcHBBbjcyYzczWEppQ0ZkVGtSdHZhUWZCZ2dSVUlyT2U2YXJC?=
 =?utf-8?B?akNVUUxyKzVKSVhTSmJsQm5YdDF6eG9NbjF4ZWFxNUdUV1NWSzk1M09ZWlEv?=
 =?utf-8?B?MlFQQUZwelEwbTRWVkordFA3Z2NNckdHKytZc1dpTFl4Z2dFTXZrbFRlVHJO?=
 =?utf-8?B?NXE4Wmw5YUhZeDQ5YVRETWxORU02dlI0cjlaZ0xXOGhDakt0bzRoK205Nyt3?=
 =?utf-8?B?K2JUWVNjSUZPZTR6d1ZIOXlXMDc5TCtkeEdTSGZVM2ZyRVVaa1RvWTNLYVo4?=
 =?utf-8?B?eGhEV0xweXZvQUdpeHFicnVTQ25Hd3ZjVW1XeHk2a1EwbkR2U1lPVEswSG50?=
 =?utf-8?B?QlNVT2YzRStBU3RmOGZTbm5lTXdPNm4rQ2xIWmtCMmg2VmQ1QndmNkVQdGpx?=
 =?utf-8?B?T0lXaDE5Z2VqSkNwdlprWXN1bjdLdlJZRmhWaTVLWC8yTmhZa01LVm10SGps?=
 =?utf-8?B?SmxBQTBJOExOZzN1MnVIOERqRStlcjRkN1pyWnduclJ0QjVrTS8zSDQ3aXp5?=
 =?utf-8?B?MWN0U0lNQkxDNVl0REdiMjJqcjg4aWFyYkZvOU91a0k0MHFnTFcrUXlEd1hw?=
 =?utf-8?B?a3dNRmNFVVBhRVZTK3c0cVErMFhJaEljbnR4SFYxWUgxY1AwSmY2RXJzU1k3?=
 =?utf-8?B?YURkVEx1TTQ0TjUxWmUzc09CV1RzeDBEYW9LVCt3MmRWMzgxOURjTlExUkw1?=
 =?utf-8?B?d2NvS1Noci81U1MyTGhJczdvenJnUGFSUkxGbUlZNEZjSmpIMnZacS9QblUx?=
 =?utf-8?B?TnVnaWZKa2NqZ1pFaXVxeWNmSS9Gdmc5c2RJL2tUMEJrZ0hEZlE5U0RoUTR5?=
 =?utf-8?B?UytUZWpGU015emgzNlF4enpBb2lsTjVSSkZGQjNBOW12UGpWbTdicUZEYWsx?=
 =?utf-8?B?alQzSjJGa1FTeFZTbDNXSGpmRUpvYjJSejBaMlBrL2ROc1hGK2lXbVc4Nit6?=
 =?utf-8?B?SjNBY09aZ1ZiSm5DR0xJcVpRRVVLdy9TYkcwbTVjRlV4a1dpcTVXUzUvMU1Q?=
 =?utf-8?B?UkY3N1BRd28vOTB6ZFZIR3RzSWtycFNDMXRaTnJXQ25FbFdvZkVwWVlPeXpv?=
 =?utf-8?B?NEt6aWRQcnZxQ2RCaWxBNXdqYk9yK1NCamllTEVTZjRmYnhTdXhyYXliamFB?=
 =?utf-8?B?MUIvbTRPREVUZWtlem5HUUlPNmJBTlBVQzBUamIxdDF4L3FSLzhZNjZ0M0pP?=
 =?utf-8?B?MTdVZTVFRUNLQnc4bElTUDcrVUxHZUZrV0RocW96TzdPMFVVRjRHajJEL0Jh?=
 =?utf-8?B?bE1neGpsOVFKWTdTR3QwR1ZnVTNuTUFMWjFxZUttTFhHcGpFTWFsbFYzZDhJ?=
 =?utf-8?B?M1hMem5odXU2QmlSQm1ZaDhwMGFQWE03Y2dWT3VLNExwVmdUUnNxcTZpclpU?=
 =?utf-8?B?UnNIcGdXcU9mUXYxUEtEV2ZOWVNzWU5WMm54ZHJIa1VoUVNlNWpSekxVOHZN?=
 =?utf-8?B?YXNpUXAzVmxLOUVVRjJVVzBLeGMwTzJ6K1Q1NmhNTUs1L1FpbUdBYi9zb0xo?=
 =?utf-8?B?YUNaTElwUkJvdmtNc1BKTUlVN2szMFVadDd2SWdPazFDejIrd2pvVnErUWo4?=
 =?utf-8?B?c0VKMXFXTjR0Y0lEQVFKTEpnSFRLQ05vZi9uUlg3dnBmUnFFTm5OcXpkWVBK?=
 =?utf-8?B?Q1dma1Z0anlXbDVsYk9TQVIwc3gvQ3FJNWZFL3o5ZUJIekk3amJQV1hDYlNp?=
 =?utf-8?B?VVptUUV0NDF1QVhROFZXNDBkSXUxWmFFNzZkeWgrSXlHNE1mTExPSVVGZHdC?=
 =?utf-8?B?RzhDVGR6bVg2N2Y5NFNOcG5jNnp3K2haREl3SnN6OGd6QW5vbWFmNXh3Zy9o?=
 =?utf-8?B?Z3cyMGU5QzN6bjNndXJGVlc1akNDNFpaWTBnL3NMek10a2xqbE95Tk1Lemxh?=
 =?utf-8?B?T3BYL0VVTXVWclVDL3I2K0RpZzlWV0U3aU5FU1V3WEJlbGJ5SVRNeWlsRWFj?=
 =?utf-8?B?Si9keU80TXRPdldEN29ETTl3ZXRva01mc1RNVkxIZ0RrWVFYNVJtL25XdUpi?=
 =?utf-8?B?ZnNiQXBFVGtWc0lubU1NTTRqNnpycVNieGpPVWFYeWFEVzZsQ2JmRmJRRk15?=
 =?utf-8?B?UzZ4YlZVaGMzZk01NTFIR3g2NkFYMmgvT0JvV2ZFMXpuclVXcHc5Y1JGYm9q?=
 =?utf-8?B?MStyMmt0OGFYT0xVVU1MYTIwRmlSZ2NXRERjTEl4azVTTlB2dUhSakdqekV3?=
 =?utf-8?B?YmJDa2I5VTY1T3dtRnRPWlg4RjFPdi9vcjVTMUxwN3VTZHBGd2F4c2ZGQnhx?=
 =?utf-8?B?K1RxNndLbUpKR1FVeEcvNEtxRWt0emc4dFJlLzJlck5lSUJJUE9ETjVNUnhB?=
 =?utf-8?B?TThlZ3E0Z3ZoRHRlOHZsdTh6Y3huelh6Sjd6dGhmZzJDanBud2NsQkhUMkto?=
 =?utf-8?Q?o6jkNq5zjneN9L4CAXz75Jar/gSgFoUbtTnE4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D3E32CE8A646548844F9D8BE61A646C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3055.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19bcd09f-00ab-4a01-0c06-08da4ddc30a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 08:02:13.0260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cJuNgnF+UupDYMv4oJBu2hWg5s1UwIhG89o9p/ZG/w99iMcxarfMFYwmrGmlmTuXLeqT9bUW6LiqVe1JquqUmCKBy3H38wy8TPxJw2T9dWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5055
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gVHVlLCAyMDIyLTA2LTA3IGF0IDE0OjQwICswMTAwLCBCcnlhbiBPJ0Rvbm9naHVlIHdyb3Rl
Og0KPiBUaGUgU29ueSBJTVg1NzcgdXNlcyB0aGUgc2FtZSBzaWxpY29uIGVuYWJsaW5nIHJlZmVy
ZW5jZSBjb2RlIGZyb20gU29ueSBpbg0KPiB0aGUgYXZhaWxhYmxlIGV4YW1wbGVzIHByb3ZpZGVk
Lg0KPiANCj4gQWRkIGFuIGlteDU3NyBjb21wYXRpYmxlIHN0cmluZyBhbmQgcmUtdXNlIHRoZSBl
eGlzdGluZyBpbXg0MTIgY29kZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEJyeWFuIE8nRG9ub2do
dWUgPGJyeWFuLm9kb25vZ2h1ZUBsaW5hcm8ub3JnPg0KDQpJJ3ZlIHJlYWQgdGhlIGRpc2N1c3Np
b24gZm9sbG93aW5nIHRoZSBjb3ZlciBsZXR0ZXIgYW5kIEkgYWxzbyB0ZW5kIHRvDQphZ3JlZSB0
aGF0IHRoaXMgY2hhbmdlIG1ha2VzIHNlbnNlLCBhdCBsZWFzdCBmb3Igbm93Lg0KDQpJZiBpbiB0
aGUgZnV0dXJlIHNvbWVib2R5IHdhbnRzIHRvIGFkZCBJTVg1Nzctc3BlY2lmaWMgZmVhdHVyZXMs
IHRoZXkNCmNhbiBhbHdheXMgY3JlYXRlIGEgc2VwYXJhdGUgZHJpdmVyIGZvciBJTVg1NzcsIGlm
IHRoYXQncyBwcmVmZXJhYmxlLg0KDQpSZXZpZXdlZC1ieTogRGFuaWVsZSBBbGVzc2FuZHJlbGxp
IDxkYW5pZWxlLmFsZXNzYW5kcmVsbGlAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiDCoGRyaXZlcnMv
bWVkaWEvaTJjL2lteDQxMi5jIHwgMSArDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9pMmMvaW14NDEyLmMgYi9kcml2
ZXJzL21lZGlhL2kyYy9pbXg0MTIuYw0KPiBpbmRleCBhMTM5NGQ2YzE0MzIuLjNiNzAxMWFiMGE4
ZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tZWRpYS9pMmMvaW14NDEyLmMNCj4gKysrIGIvZHJp
dmVycy9tZWRpYS9pMmMvaW14NDEyLmMNCj4gQEAgLTEyODIsNiArMTI4Miw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBpbXg0MTJfcG1fb3BzID0gew0KPiDCoA0KPiDCoHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGlteDQxMl9vZl9tYXRjaFtdID0gew0KPiDCoMKg
wqDCoMKgwqDCoMKgeyAuY29tcGF0aWJsZSA9ICJzb255LGlteDQxMiIgfSwNCj4gK8KgwqDCoMKg
wqDCoMKgeyAuY29tcGF0aWJsZSA9ICJzb255LGlteDU3NyIgfSwNCj4gwqDCoMKgwqDCoMKgwqDC
oHsgfQ0KPiDCoH07DQo+IMKgDQoNCg==
