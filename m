Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57DF06A9D98
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 18:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbjCCR0D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 12:26:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbjCCRZm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 12:25:42 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 045F348E1A
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 09:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677864340; x=1709400340;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fa+qaHMjfMX2fHSTeN/oRxjLj+XCJ0JACuZtQ8wMBDo=;
  b=lc9cThVrcODo1PFuNBo1/mbOzVE3LuXbqYUgBLUrD/Ns/L+GR3tzVJ/M
   CCYcPp2CwmumU36tE5trqZP+PDComRisq24rB82JVJG95nOQENmEu8N0Q
   RX2QVEMIfhlJl7hCVFs/37VJRm/tC7d4mJAVNM6z2O9AAaAGj1ezSHWfL
   4mTrr/3BSOPdtaMTxMBFlBd3YUHvhMQa110Kp/upn0sdHdF1pN8ad1F+C
   NTK4UEeyEBgC1AA3Qe2+5HYxFRMWQFvb6snZmXuYcJ9aABniYYcxE2Nz/
   vGAt6AsQOB4NU+RPKozRvsSopD/5S/8CQa7oQ+6XCvvjJ+5+qdiQnZC5e
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="332581444"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="332581444"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 09:25:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="668736475"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="668736475"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2023 09:25:35 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 09:25:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 09:25:34 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 09:25:34 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 09:25:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zcfu7WmT4aT1MChn3MMHvNvCl3D81Q2Sy/m+U0ThnuG59VAdYWjEwLX6ZoNgdMfeiCzKRBtMWoY0pTf1W32QwQJ0XREFACygCl4amvsGdjiUI0pH+lLoWx3OQsj6MFkqKJyC1qrXSiZQOQgcibxR6nPNflpe8TTj2/SCbkAmnviefBZlCRJ6iMRqghzEeZdi3dd8DDbowVjAWHkbqy3v1daTkxp5yn4uVCE0kUOtTD3NmUiHJ6N0+MDu434vl+TvKD6q8DdcH9W7TiTF9mrgSYWEDmKUAUnb9decgt4U4lbRqxihDlBaejiMipn7IvvvJj1vkBenUKgOZY0BlIxUQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fa+qaHMjfMX2fHSTeN/oRxjLj+XCJ0JACuZtQ8wMBDo=;
 b=Lz6d5WpI71ov8Cy6Csd339DkqkQIDX3GhH7eCHD2HWXRDFhff+NNs/k41Uu9Zw1V+9luxytf9NRO36QxqCSVFe7DqfhzzGPEJgOtV8Arxzc9lZuXSwPwSOx0CUAAhbTdqNnwQDPDDNeRxzkHpoxL3Vg8/ZOk5ZPpG/HhpdP1tusEpIYY2/1VGKLzokZt1lx6mBZRp2MDvFYiEJvAj50fgJKG3NH4yKJXIBZqoUqpkBSfNKLt7zq0vnPm1oRcz6NW9Bhg4f+7775Pg8AdsUMPwSqpwJbNTOGlj9J5yYb4NyYJssr85lBp4wizg+PZaM6iYCTKGmuTT0G+x1HX6n/awg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.21; Fri, 3 Mar 2023 17:25:26 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3250:3daa:1e9c:b9ae]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3250:3daa:1e9c:b9ae%3]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 17:25:26 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Dan Scally <dan.scally@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "djrscally@gmail.com" <djrscally@gmail.com>
CC:     "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: RE: [PATCH] media: ipu3-cio2: support more camera sensors in
 cio2-bridge
Thread-Topic: [PATCH] media: ipu3-cio2: support more camera sensors in
 cio2-bridge
Thread-Index: AQHZTdxPvzGKIUp6MUqPfoN/kmFBxq7pNNOAgAANb5A=
Date:   Fri, 3 Mar 2023 17:25:26 +0000
Message-ID: <DM8PR11MB5653CDF7E46949B06306169499B39@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20230303143643.2095888-1-bingbu.cao@intel.com>
 <8054e6e6-84df-06a4-67fe-b4c538708eb9@ideasonboard.com>
In-Reply-To: <8054e6e6-84df-06a4-67fe-b4c538708eb9@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|PH0PR11MB5611:EE_
x-ms-office365-filtering-correlation-id: 4ca57e4e-106c-41f6-4c19-08db1c0c4748
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RLt+zp6BmWiftNCD2PjNGCNjfxgKyIlOl198kjE9tc4KQ9kf4qq9MP++pKGro8OJHSt2xk+A3gn35J32YrPo4QFPPCGsZnK4xDcPTksO0Kyaz7WD7xCWkh0HwuDYGa7C0J/cwk5DcjeT+2lOlffh3aKcUX/SFCb6o5PFRmrNxxfQKPJ3heQYcYfvSYKoqxAiW+cZsiycqrAPqMwVYoK5PEy2WTrr3ksiQkrm8Q/d3lTbDtRTwTnl/Vf+RpPdDlA3yyTLJnub9QjonbpvsGsgXNsdrVgR7HoUibr7ZCFfyZJqyjpZUbWVYU5hSRIkgXzPP5SacZ+65c+gLz/1SDwpQX7NcpM3fiHVuRmonjMwpXV8YRlSPFKx4Bf/YB7lWkQtJc5We+hwsMUX6azVsXLp++6spITu+53nopzVfIvchxUK12I1N9xl+x/LTaG2WwZW+erl99biaZ/2qNXGkIYxZ1VNBQfMlHhPQT4568HK0/6TeoORzVTvrM0QDe9C4Uh5ovJ+A1e5hZZQYeh38TGoH2mlO954SIVUve8RJIPcojeVFMo8VxENCgx6NC5ONa/WG9pcvlYpMpBbZ/B/0QahonHHKmiFtlp/TltO3i6FvBfeI2USTWYPl1yb+upyFf1CdjB0+pHBckdL3J5Mm/zxMGgrM1QurkTpF36lv9u+tK2ayPAKyi2dpc9MB9z6ba9I
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(396003)(366004)(39860400002)(136003)(451199018)(5660300002)(41300700001)(8936002)(52536014)(76116006)(66556008)(66476007)(66946007)(66446008)(64756008)(2906002)(8676002)(83380400001)(110136005)(966005)(7696005)(478600001)(26005)(33656002)(53546011)(316002)(6506007)(71200400001)(38100700002)(9686003)(86362001)(55016003)(122000001)(82960400001)(186003)(38070700005)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmFhQVRncU1SRzNYM2U0UlJrejdISTFRT203aWFlUUFZZFNWUTJ3RmI4K2Ey?=
 =?utf-8?B?VERzSFhOV2JGRkVXRi9vSnM1MWkxRWFOQ2swZkovd0RqT29KQmMxZDBJNTJW?=
 =?utf-8?B?VFp5TU9OSUtlU1VFNkY5NG1XbkEwU01aNVBHclZ2QVo1YlBXS1ZsT1J4T0pz?=
 =?utf-8?B?RHo2S21odjVrNlBDdi9tYmY2ZTgrUTNROG4yWlVialRkK21UeDhKV1d3OGJR?=
 =?utf-8?B?OWdGNXkyQ1ZGQlczYk1KUFZJSGptMng4S1RiTWNBQmhFQjRyZTluell4Tk5p?=
 =?utf-8?B?bElraE1VZzFPY0srallPWjU3cnVCUnVJWWIxYkFPbE9EendiRnpYaUNaRnRS?=
 =?utf-8?B?d1E0cWh1YkduNWpmOUttZHF1cSs4bWVKYm14RmV3ZG9wN0FQWU5ONUU2cDNL?=
 =?utf-8?B?aTRNZnFIV0ZOMUFWOVBVcVd0UEwvSUl6Wi85Z2pCUnhDVVliRlk3aG5VaG9T?=
 =?utf-8?B?c0owd2hPWUpqSnhpalVLMmZKVkQ4bDJNWTJUc0YyWnNtSXJpNDBZczJTTXJN?=
 =?utf-8?B?ZWtVRjdEMGZvNWlYM2lJZUtmUDlvU1ltdGlWWndNVFZGWEpDWWZKWXNCODNC?=
 =?utf-8?B?UDBzL0NJdExzWkhtMHlQWG1MRGVTNHJmbnpPQmlFeTV2MVdtdUtxa3luMlYv?=
 =?utf-8?B?TFhOU01jR3l1WU1vaXRZUDZxcnZGcVc2dHF6M0J5bVRRSi9VaGZET2dDUDcr?=
 =?utf-8?B?d0xydTljTndyUVdmL2c0NFN3VEk1SndlNHVTRFNKdzhxbDJwMGxGVC9vei9k?=
 =?utf-8?B?bWNHRjV6djR5OG5NcVgwMmhJMit2OGt1MURGNkdlUmNFQWhPYmJWamM0MHd4?=
 =?utf-8?B?bTdYS3BHZERBeG9XR01reUd5bTVlTzN5VHpBK2JqbVgyMDRNV0ZPTEx0ZW9x?=
 =?utf-8?B?UkpIR2Q5VTZKUXlGWm55aFpkczJtS2FuM2p3WTlWZmRtREJjc3Z5OEpQYlJO?=
 =?utf-8?B?MUxhU3lrSzNMZ2FPcjZ6TWZGTERXUTFYWVpuMUlmbCt1bHdoSXdKOE5yWDBD?=
 =?utf-8?B?WlE0L211SHA0RENIWWU5eG4zRXhKYUlpbjJFSUFEV0U1TU81eHFJakhjYnQ2?=
 =?utf-8?B?SkR3NU5mZnJQMVQzZ01rSHFuRVAybFVvQ0U3V3YrbkZON3NvUXlUQlYvVlUz?=
 =?utf-8?B?TVZxeHNlVUJQaDVyYmtCaDNTSXcvb1RJd0ExY2MrcHdlVEtpYk9zMlgxb0FW?=
 =?utf-8?B?eEl6eWxlaG1nVUhrUHE0aDhvODJsaVVFMDR5UHZ1UGNVSUNVbXBxTDV5SEMr?=
 =?utf-8?B?eHhYRWFXRGlydWltMVZLQ1YrSW96eFNKMmZPdU9zWGJVZUdINFh6UzlBbm1G?=
 =?utf-8?B?SWtvQm9VOVNVYkR3NHcxN1l4cGxIVVFia3ZqYVcvYXF1YmtVMVR3U2xjRXpW?=
 =?utf-8?B?VlBGSzlTSnB1MTViQWFwZ0orbVVZOENIMFJDSzIvRVZUY2twU1MvN2pLU1Ja?=
 =?utf-8?B?TTk0Y2JCZkJKeHllZWp6b3pYOUdhUHZaKytDSVBSTCs2ZVV2V2Y1TUN0MDBo?=
 =?utf-8?B?SytkS0JqWjNMV1VIaW41L1ByVzhraUMrZWcycm5RcFJEc2pxNnliYzBRMDFt?=
 =?utf-8?B?ZUNGeStISklhUWhBMURoUjhwNnZQNWcwanpSOWtLbHNVY1o4TXc0K3B4K0VJ?=
 =?utf-8?B?eUgxZVpuZzVIRnpmMGlNWE1pNEYremxMQVpJREVIRVFnaGNhR0YzZmVGNktn?=
 =?utf-8?B?L2kyTzRROVZhTkx4MnlraVZMb0x1NXJ6YkVQK1IrM25CQzhwNzh6WjdlU3Mw?=
 =?utf-8?B?cGJvRnlib2pyQWkxYjI5K1Y4U0FsUlFkOEhzZHdyY29UN3lUM3JVQkdWaWNL?=
 =?utf-8?B?M1ZwTVNGZ2xxc0g3ek1JM29PRWlMVCtGajgzY1JwMytCRzd2YVI0R29pNmNr?=
 =?utf-8?B?SGhocXc3MUNTK1hzazJseURaWWNEV0tCeWp2a1NDTTRnWTM2NTJjTno3NGpL?=
 =?utf-8?B?dm9OWTFUQktxblY5ZnlOMnV1d2I3dDM5bFUyNHJLT3ZOKzI1U2o3TUh4THJH?=
 =?utf-8?B?UWpsa0FjZXlCcnNodDN6ejlYOGNITWNObEtTb0cxdDF5blZDNldmOWx3MnRK?=
 =?utf-8?B?TDQzS00zTjZxZXNOeEZxb3p3dXJrdjNWaHE3dG82V3pNYjZ0dTFSR3lhdU9v?=
 =?utf-8?Q?RIPZa4E6ukGq4A/tN6NFtJHF3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca57e4e-106c-41f6-4c19-08db1c0c4748
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 17:25:26.4162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dBa99Z0FyLSfldUlwTofolgu8Yq1p1Tmrmb06KCdr2dv5v0JPvvXyjvX04lS3qgzq+to9GPfcRJ85EQASLauDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5611
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RGFuLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkJScywg
IA0KSW50ZWwgVlRHIOKAkyBMaW51eCAmIENocm9tZSBJUFUgU1cNCkJpbmdidSBDYW8gDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuIFNjYWxseSA8ZGFuLnNjYWxs
eUBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDMsIDIwMjMgMjM6NTMN
Cj4gVG86IENhbywgQmluZ2J1IDxiaW5nYnUuY2FvQGludGVsLmNvbT47IGxpbnV4LW1lZGlhQHZn
ZXIua2VybmVsLm9yZzsNCj4gc2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbTsgYW5kcml5LnNo
ZXZjaGVua29AbGludXguaW50ZWwuY29tOw0KPiBkanJzY2FsbHlAZ21haWwuY29tDQo+IENjOiBi
aW5nYnUuY2FvQGxpbnV4LmludGVsLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBtZWRpYTog
aXB1My1jaW8yOiBzdXBwb3J0IG1vcmUgY2FtZXJhIHNlbnNvcnMgaW4NCj4gY2lvMi1icmlkZ2UN
Cj4gDQo+IEhpIEJpbmdidSwgdGhhbmtzIGZvciB0aGUgcGF0Y2gNCj4gDQo+IE9uIDAzLzAzLzIw
MjMgMTQ6MzYsIGJpbmdidS5jYW9AaW50ZWwuY29tIHdyb3RlOg0KPiA+IEZyb206IEJpbmdidSBD
YW8gPGJpbmdidS5jYW9AaW50ZWwuY29tPg0KPiA+DQo+ID4gQWRkIG1vcmUgY2FtZXJhIHNlbnNv
cnMgaW50byB0aGUgc3VwcG9ydGVkIGNhbWVyYSBzZW5zb3JzIGxpc3QgdG8gbWFrZQ0KPiA+IGNp
bzItYnJpZGdlIHRvIHN1cHBvcnQgbW9yZSBjYW1lcmEgc2Vuc29ycy4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEJpbmdidSBDYW8gPGJpbmdidS5jYW9AaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+
ICAgZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1My9jaW8yLWJyaWRnZS5jIHwgMTkgKysrKysr
KysrKysrKysrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHUzL2NpbzItYnJp
ZGdlLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTMvY2lvMi1icmlkZ2UuYw0K
PiA+IGluZGV4IGRmZWZlMGQ4YWE5NS4uOWU2MDQ2ZmEwYmQwIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTMvY2lvMi1icmlkZ2UuYw0KPiA+ICsrKyBiL2RyaXZl
cnMvbWVkaWEvcGNpL2ludGVsL2lwdTMvY2lvMi1icmlkZ2UuYw0KPiA+IEBAIC0yOSw2ICsyOSwy
NSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNpbzJfc2Vuc29yX2NvbmZpZw0KPiBjaW8yX3N1cHBv
cnRlZF9zZW5zb3JzW10gPSB7DQo+ID4gICAJQ0lPMl9TRU5TT1JfQ09ORklHKCJJTlQzNDdFIiwg
MSwgMzE5MjAwMDAwKSwNCj4gPiAgIAkvKiBPbW5pdmlzaW9uIE9WMjY4MCAqLw0KPiA+ICAgCUNJ
TzJfU0VOU09SX0NPTkZJRygiT1ZUSTI2ODAiLCAwKSwNCj4gPiArCS8qIE9tbml2aXNpb24gb3Yw
MmMxMCAqLw0KPiA+ICsJQ0lPMl9TRU5TT1JfQ09ORklHKCJPVlRJMDJDMSIsIDAsIDApLA0KPiAN
Cj4gDQo+IEkgZG9uJ3Qgc2VlIGEgZHJpdmVyIHRoYXQgc3VwcG9ydHMgdGhpcyBISUQuIEkgdGhp
bmsgdW5sZXNzIHRoZXJlJ3MgYW4NCj4gYWN0dWFsIGRyaXZlciB0aGF0IHN1cHBvcnRzIHRoZSBz
ZW5zb3IsIGFkZGluZyBhbiBlbnRyeSBoZXJlIGlzIGEgYmFkIGlkZWEuDQo+IFRoZSBwcm9ibGVt
IHdpdGggaXQgaXMgdGhhdCB0aGUgaXB1My1jaW8yIGRyaXZlciB3aWxsIGFkZCBhc3luYyBzdWJk
ZXZzDQo+IGZvciBlYWNoIHNlbnNvciB0aGF0IGl0IGZpbmRzIGxpc3RlZCBoZXJlLCBhbmQgaWYg
YSBtYXRjaGluZyBkcml2ZXINCj4gZG9lc24ndCBwcm9iZSBmb3IgdGhhdCBzdWJkZXYgdGhlbiB0
aGUgLmJvdW5kKCkgY2FsbGJhY2sgZm9yIHRoZSBub3RpZmllcg0KPiByZWdpc3RlcmVkIGJ5IGlw
dTMtY2lvMiB3aWxsIG5ldmVyIHJ1biwgd2hpY2ggbWVhbnMgbWVkaWEgbGlua3MgYW5kIHY0bDIN
Cj4gZGV2bm9kZXMgbmV2ZXIgZ2V0IGNyZWF0ZWQsIHdoaWNoIG1lYW5zIF9ub25lXyBvZiB0aGUg
Y2FtZXJhcyBpbiB0aGUNCj4gbGFwdG9wIHdpbGwgd29yayBldmVuIGlmIHRoZSBvdGhlciBvbmVz
IGRvIGhhdmUgd29ya2luZyBkcml2ZXJzLg0KDQpBY2suIEkgZG8gZm9yZ2V0IHRoYXQgdGhlc2Ug
ZGV2aWNlIGRyaXZlcnMgd2hpY2ggYXJlIG5vdCBhdmFpbGFibGUNCmluIGN1cnJlbnQgdHJlZSwg
d2lsbCB0cnkgdG8gdXBzdHJlYW0gdGhlIHNlbnNvciBkcml2ZXIgZmlyc3RseSwgYWxzbyBmb3IN
CmhtMTFiMSBhbmQgaG0yMTcwLg0KDQo+IA0KPiANCj4gSXQncyBxdWl0ZSBhbm5veWluZyBiZWNh
dXNlIHRoZXJlJ3MgYSBnb29kIGxvbmcgbGlzdCBvZiBzZW5zb3JzIHRoaXMgX2Nhbl8NCj4gc3Vw
cG9ydCBidXQgdW50aWwgd2UgZml4IHRoZSBub3RpZmllcidzIHdlaXJkbmVzcyBJIHRoaW5rIHRo
aXMgbGlzdCBuZWVkcw0KPiB0byBiZSBsaW1pdGVkIHRvIGVudHJpZXMgdGhhdCBhcmUgc3VwcG9y
dGVkIGJ5IGluLXRyZWUgZHJpdmVycy4NCj4gDQo+ID4gKwkvKiBPbW5pdmlzaW9uIG92MDFhMTAg
Ki8NCj4gPiArCUNJTzJfU0VOU09SX0NPTkZJRygiT1ZUSTAxQTAiLCAwLCAwKSwNCj4gPiArCS8q
IE9tbml2aXNpb24gb3YwMWExcyAqLw0KPiA+ICsJQ0lPMl9TRU5TT1JfQ09ORklHKCJPVlRJMDFB
UyIsIDAsIDApLA0KPiA+ICsJLyogT21uaXZpc2lvbiBvdjg4NTYgKi8NCj4gPiArCUNJTzJfU0VO
U09SX0NPTkZJRygiT1ZUSTg4NTYiLCAwLCAwKSwNCj4gDQo+IA0KPiBTaW1pbGFybHksIGFsdGhv
dWdoIHRoZXJlIGlzIGEgZHJpdmVyIHRoYXQgbWF0Y2hlcyB0byBPVlRJODg1NiB0aGF0IGRyaXZl
cg0KPiBjaGVja3Mgd2hhdCBsaW5rLWZyZXF1ZW5jaWVzIGFyZSByZXBvcnRlZCBieSBmaXJtd2Fy
ZSBhbmQgdGhlbiBmYWlscyBvdXQNCj4gaWYgaXQgZmluZHMgbm8gZW50cmllcyBvciBpZiBub25l
IG9mIHRoZSBlbnRyaWVzIG1hdGNoIHRoZSBvbmVzIGl0IGtub3dzDQo+IGhvdyB0byBjb25maWd1
cmUgWzFdLiBUaGF0IHdpbGwgYWdhaW4gY2F1c2UgYW55IHNlbnNvcnMgd2l0aCBmdWxseQ0KPiBm
dW5jdGlvbmFsIGRyaXZlcnMgdG8gYWxzbyBmYWlsLCBiZWNhdXNlIHRoZSBpcHUzLWNpbzIncyBu
b3RpZmllciB3aWxsDQo+IG5ldmVyIHNlZSBpdHMNCj4gLmNvbXBsZXRlKCkgY2FsbGJhY2sgcnVu
IGFuZCBzbyB0aGUgbGlua3MgYW5kIGRldm5vZGVzIGRvbid0IGdldCBzZXQgdXAuDQo+IFNvIEkg
dGhpbmsgdGhhdCB5b3UgbmVlZCB0byBkZXRhaWwgdGhlIGxpbmstZnJlcXVlbmNpZXMgaGVyZSB0
byBtYWtlIHN1cmUNCj4gdGhhdCB0aGUgZHJpdmVyIGNhbiBmaW5kIHRoZW0uDQo+IA0KPiANCj4g
WzFdDQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJp
dmVycy9tZWRpYS9pMmMvb3Y4ODU2LmMjDQo+IEwyNDIwDQoNClRoYW5rcywgbGV0IG1lIGFkZHJl
c3MgaXQuDQoNCj4gDQo+ID4gKwkvKiBPbW5pdmlzaW9uIG92Mjc0MCAqLw0KPiA+ICsJQ0lPMl9T
RU5TT1JfQ09ORklHKCJJTlQzNDc0IiwgMCwgMCksDQo+ID4gKwkvKiBIeW5peCBoaTU1NiAqLw0K
PiA+ICsJQ0lPMl9TRU5TT1JfQ09ORklHKCJJTlQzNTM3IiwgMCwgMCksDQo+ID4gKwkvKiBIaW1h
eCBobTIxNzAgKi8NCj4gPiArCUNJTzJfU0VOU09SX0NPTkZJRygiSElNWDIxNzAiLCAwLCAwKSwN
Cj4gPiArCS8qIEhpbWF4IGhtMTFiMSAqLw0KPiA+ICsJQ0lPMl9TRU5TT1JfQ09ORklHKCJISU1Y
MTFCMSIsIDAsIDApLA0KPiA+ICsJLyogT21uaXZpc2lvbiBvdjEzYjEwICovDQo+ID4gKwlDSU8y
X1NFTlNPUl9DT05GSUcoIk9WVElEQjEwIiwgMCwgMCksDQo+ID4gKwlDSU8yX1NFTlNPUl9DT05G
SUcoIk9WVEkxM0IxIiwgMCwgMCksDQo+ID4gICB9Ow0KPiA+DQo+ID4gICBzdGF0aWMgY29uc3Qg
c3RydWN0IGNpbzJfcHJvcGVydHlfbmFtZXMgcHJvcF9uYW1lcyA9IHsNCg==
