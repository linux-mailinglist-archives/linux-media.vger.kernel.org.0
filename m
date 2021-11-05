Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3901B44627B
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 12:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbhKELGI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 07:06:08 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:65497 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbhKELGI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Nov 2021 07:06:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636110208; x=1667646208;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=h8NXnXtM8GdSWWfER3xqVkkHBhOaFlyKZt39qY00XV8=;
  b=kzQtzPM8bYOWb5yn29J/Y1OyXOTNeZwBwv5snCG3P8n4/1KeKXlfvTeG
   gr/TXimDoik+A+iD1VSvbkT6eaWXwzxz3u2Z34pGUOquN3qu7iZwlvm1K
   xW+mqanM13PxJNCULz6J3QK0CoJPxGtDD762ZXBEoA4pl6T6AJyRRfTcq
   yE00WyKhXwshOfXcpMLaisDB3UyJAs2om3Qkgf4dHRumaYOT7/BLfRXbd
   zgANJzMi6lQbCwIkkoe0WT73ZrhL05upY4+DdXqO+qX778TUe47QrzWYp
   OPnsSx4w387rZNIsBnj+UStR5K6ByfZD98BAtjvE7uPmCu4Nk/6uwQIu8
   g==;
IronPort-SDR: uVibCmEZwrmCsQ00AZXsnuDVyKmRPyO//idT6Au8E70xveC7a0yEPKXYMarvveYlQ7RTnU9PNn
 SLSp9jR1oReTZctq/wSO3m2xg8NUDoOlmr6llawTD73tb3kWhQeSX/g6JEIqWIAxqkftNus+zi
 eLd/AdGdV/Wrtp0NZidvhCyZRfyV4Xt9E6ijFNhFPxK0M8kt3yCyAtqFelQ0NRAaT6yZbRShic
 oONHXzbqT5t2VGQeXiBrCBVA1mgjTerDals4gwFDJc9mOfJu6v+IWdmYKGuFSaxSJcQlkCaE8p
 3Wj9uNfjbQ7pMuDQioTGdoGl
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="150853173"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Nov 2021 04:03:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 5 Nov 2021 04:03:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 5 Nov 2021 04:03:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUVtgeP5iBIm3NHmPFP8r4lsm6KoGm4SYRVxDRCNeiGhTFxsLqM73bMrCnhapCEa3fYop1Jv4Yaham5vwNBOvCSiiWEuluC1JApbl3xZPEIKg9x91hokY1fKZiF1nfY/PTiGZXGLG5CEbVHa1wdSiPszRjJX0heGMVjGgqsLlZaU6sIJEcNtvD2jdZgH3N5tnovxXpU1/9sc5HoU/DLlglBTuu+Ej8lKi2jZjb16Mb91lqMVIpUMxR8NC25LGuhg669PccD/pCOVtp0eU18FXcdnfHM3ILe80OJ+79XaAo40+JvR79bJpVPEHOrYyWnneO3mxXIY9+FfKadF1esXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8NXnXtM8GdSWWfER3xqVkkHBhOaFlyKZt39qY00XV8=;
 b=mQVohqneWWd7X2lVLoqrx01gvj10tiBoxl/SlVKp/uoyQDKWOB+M/TVYyNaEvs10JL8HS81+a3OQlSTBHhew+s/S20LMI2rysUa8sxruU6hwMgpKTvmWFr/sQo550zR7wJBTmQbm2rDRYvjtPfmHYAgvdOgc6/NRiM3FIRaZ3T9NAJws2eWRnl44ShCHDGA9xrg7GHQAX8ZzLiykrh+UtjkSTo5IhyNpYzailbpzmkKWGr1VniVMnyIWAVfzchWhfeZ/dgmTo4lQDST2uCtUz26yF9sED1Svqr49tHm7P0YN4mUdIphj1gUORxbXsvoJ0tGIx9Rs+Mk7c2QLSrJXVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8NXnXtM8GdSWWfER3xqVkkHBhOaFlyKZt39qY00XV8=;
 b=dCTXBz63J+9cgiD/FF4345dotGhFCmWtmdL1eG0jUO2lV3OhNnnmdX2uxnuRWKYGDwDFFZMkWxxy+2kJYZml8mDr+DGZw8PPnPKXTR+gujNTwd2ImvBjhRmjcKPayuF8ES4UR1Y8wcE/9olCwWdt5Zf0gXV4BFgQ5/AvFVh5KiI=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Fri, 5 Nov
 2021 11:03:25 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::5933:9a3c:4793:c21]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::5933:9a3c:4793:c21%8]) with mapi id 15.20.4669.013; Fri, 5 Nov 2021
 11:03:25 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <jacopo@jmondi.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <robh+dt@kernel.org>, <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH 11/21] media: atmel: atmel-isc-base: implement mbus_code
 support in enumfmt
Thread-Topic: [PATCH 11/21] media: atmel: atmel-isc-base: implement mbus_code
 support in enumfmt
Thread-Index: AQHXxxoS1Gy/4w2cQESQ0fKslgfHtKv0wBWAgAAHHgCAABQZAA==
Date:   Fri, 5 Nov 2021 11:03:25 +0000
Message-ID: <60f0d378-d998-464f-2d95-09db4e889b96@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
 <20211022075247.518880-12-eugen.hristev@microchip.com>
 <20211105092559.ce6pdm4hwvxkmutd@uno.localdomain>
 <20211105095128.7tu4rm6mogwy2dz6@uno.localdomain>
In-Reply-To: <20211105095128.7tu4rm6mogwy2dz6@uno.localdomain>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: jmondi.org; dkim=none (message not signed)
 header.d=none;jmondi.org; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aafc30d5-ec26-42c8-3e28-08d9a04be3e3
x-ms-traffictypediagnostic: BN9PR11MB5289:
x-microsoft-antispam-prvs: <BN9PR11MB5289ABED4341E23DA0FC15E2E88E9@BN9PR11MB5289.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rof1yo/NkhC3gq6FjptiJoWt8zVUCKdC9CvHJ1Xmb+h2Fp7P4r0RURNHENv8sM/NhwgwZVhNcULaHc8aOjMdJqLEFQBkg5W25Mpo3MfmygzmMwBxgZ+jBqG2i5Aptw+6nP4ljBs76fqFOfUU4wEQTQj9HRH0bs7TRalpWL50E+Xlsp5cekjvO6+NpgpHBY5+obyCqvqgAFnlGYqPNqDuGs+lTL8Cm7I0gl51pmvukyDPqbJUg0i0Y4+UrcYrLC98R7LQMAUP8iDC1qmnHMGUya0cjGPZaBUKrHOOMt3RooUN2AHJMoTSDU3q3917YIA55FYRm1GsrAp3TIJqdZH/Xm+LfvZ1p9W+yLVf6TvD7bqNPCyC/Xtt2b1qxDa9I956ycVbkMflVK+R+trS2rPrNdxzhwP2ig/XZRQBtA/kgvWSwwWtbYqoQFpDN7CeSLjtyOUYyBiLh4A1xVX359Xvj9V7BvZDCesrrokfpQSUVl8zB4KU4MivJzE16CyBki/ZhIhxnUYRmXgXIm3IWw3f+UO7nZPhNgOnt3qH5k68QBIQWsEssysbVwJdQ9zPdLd+Hi8eDYDbWA8qVMZdrEyYp8b/SBf3WpMvu/LBaEkgRvsRhPqnMdLAQ8ePwR2d+TeBvwJd/gSTomt16oRbWSP/usJ8eX3gr+LibzqxLn5ZH6bKehtQ9b9vFdSn5wEj1k14WFiPfe39wehPc/7yt3y2IwMgsR3OdSEEwxjrQe5+o5sf9OkS/v+OfyWGLMuvljFrmSxa966KE/lhqMxKuFrUBw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(122000001)(64756008)(66946007)(76116006)(91956017)(316002)(38100700002)(66476007)(26005)(54906003)(86362001)(8936002)(66446008)(66556008)(8676002)(6486002)(4326008)(83380400001)(107886003)(2616005)(31696002)(31686004)(6512007)(508600001)(36756003)(6916009)(5660300002)(186003)(53546011)(6506007)(71200400001)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVRGTFZIMGEyUVJ5TFhlcXdFZmdMT3BxMmIvT1czYUVnelpEREpiL3VGc1lQ?=
 =?utf-8?B?Q2tRUzdBYW1XM1hoVXRIeFhjQTRXdDBST1FXYnZqK0k4Um1IbUpTU3ZFVnpp?=
 =?utf-8?B?aEg0Qnd5R1RiajBVaHZKMFA5bENKU2hwYldnaUQ0bTUyMi93WEJTOFlxRzM4?=
 =?utf-8?B?QmtiZmJ2YmVwMTQ3eGI3WHg0Y1hTNkU5RTJMYTZCT0Y5SWtoL3lBc1dxTVpY?=
 =?utf-8?B?MGsrZkhvNm1oMmxHa0l1TnVCYkdQajZaeld5Z3hqUllvKzRYRWUyZS9NUTZW?=
 =?utf-8?B?UG9BQ1RUQ1FlcGgvNjNhSmZ1OGkrdlZhOTVGZ0xKWmRLYXQxWDFkZWt0VnE4?=
 =?utf-8?B?Nk56eno0a3dLaElXVE1CeCtRM2JUR1F5RGpaOHVGTjJzWlpIMWR5NGdiOHVn?=
 =?utf-8?B?RE4vYm1QSkJzTnNmTEMxMVJSMlBTUzVsRWdkZWJwUEQ4VUVFN3pIazdhUWVq?=
 =?utf-8?B?ODIxVmtpNFZ6dWFRV1RDRWNhZm55SkY0OGxsd3Bmalp0RWJLMnROK2NQdVhn?=
 =?utf-8?B?dmRGSEtMZTZwWUJSVTJIYkxCdFVnT2UvV1NIR01mTHZYeDRkNkVCVWpwMGEy?=
 =?utf-8?B?RDhESGFxSnNndkkzUitqTTkzcE16dVZCMTB6ek9TYjdHc0RrM3orRmIxazU3?=
 =?utf-8?B?TFM1OVN3c2x1eTZkN1R5WEljUGZITzU3TFF6M0Z3ZEh0Z0xxUW9MWjQ0am9E?=
 =?utf-8?B?WHl4SDNOMDFYZm5nb3BFejhuVEFZQkxxZTVSQWNKaXRLTzJWYnJmVzgwTFN2?=
 =?utf-8?B?WnhHWmcxYk41ZHY3ODRLZzYwTUsrU2FBUUdER1FOQ1JlS0MyYTh5aXpGMzdJ?=
 =?utf-8?B?bW1ka2cxZ0NDYkI4QTlQTDVmdmhpZ1lCVys2QXMyRStPSHNYQ1Znb0lzREk5?=
 =?utf-8?B?YWJFanZMVk8rVTFLQTBBWkdteTBWcU1aWXYrRWNxZzJuaEg2VVNPcHhibStS?=
 =?utf-8?B?cjI4bjRkdE1rMUloWWd5Mkg3em9DZGdSRGxQa1ozNWVNQmFic3lvZUpGdHhU?=
 =?utf-8?B?RkZuR2g2cy82K2xvdnZaOXlKcVUxazJ3d3gwM0VPTHk2ajBmczRROWVDalFR?=
 =?utf-8?B?UW1UODM4c2ltd0EydlZqbGpYekRZcXFIQnRGcFVXaDdiVU5NckpFWFZJMHlJ?=
 =?utf-8?B?SUFwbXZSWjdsaEtKS0Q1VDdsV1dQclJCSWdTSUpwdHFMS2d5Rm81dkFiUTcw?=
 =?utf-8?B?S0w4R0p4cG11TDVHc0g2R0VxTDVUM0Q2SDRQaDJUbnl1TGhoSXZjWGwxZ0pT?=
 =?utf-8?B?WmpueXJRdU1VRlAzL0ZQbE56TnJLbVN4UGFDSjFrbjlQQUNybVV5YTl2YmMr?=
 =?utf-8?B?VHplR2p0d0lDQVphQmU5KzVCZjAxVHdvRlRMVVhYVXkwZjJrRE5Pejl1Rmkv?=
 =?utf-8?B?aVcvazJFbzFJbldnK1VnaTRaSUR0UUtWWlpSUmJsV1d5RTdmc2YrUW1XWWVV?=
 =?utf-8?B?UHlpbTZxSVB3WFppekd2Sjd2R0kyNDFDTk5jTHMvL1ZjaDQ1YUVEVlJCM1BT?=
 =?utf-8?B?VGNlUXhGSGZMNUNvb3FTMEtaK0lFNkFtMUpmOWwzRzVpUkJrbjVucHRQZDBP?=
 =?utf-8?B?SWdoOTZKZlNubkVLZEdXaWxEVndONk5pYnc2bmJvV2pRY2krQzY0RVpkeXM4?=
 =?utf-8?B?alhxeGZheCs5NVNHbC9WVEdZSEFVclNHam1mUTZXV0ttV2prT3R1VmtWUSsz?=
 =?utf-8?B?RktLNm82K3FnempldUxiVmNIRVAwZHpjeFEyR05PK0VjTkpqVmd6VHRIOXcv?=
 =?utf-8?B?QXZ0c0kzdXErKzAxTFd5SW1vSTBiZWJWckREb0UyeE9QcHdXdjhvUk9GTUVE?=
 =?utf-8?B?bW9rc2tTcVRPUlFGaHpFL1I3VGZxTWxHUmFFM04vN0g4NndFcEYxU0VIWFRr?=
 =?utf-8?B?ZFpyZ0VNOGZJK2t4Vjlmc09wRHFnZ2hXbEx0RE80Sm5LWHZKSEo4SUhub1pm?=
 =?utf-8?B?NkNEd0ZQbnZKMGdZcnhtbXY2Y0svSGNYUkhzZVhSOWpyYURVcWxZNEMwakZq?=
 =?utf-8?B?VkJtZlBaeXc2b2ZMM1QxRUhCbXpCdFZLNFJuR2dGV0d2b2hndTJpbHEwUWlS?=
 =?utf-8?B?N09SUGR6NTQrS3ZzR2M4MXJLdEkxakhiZ3NGc3ZadEc3cCtFTzhwNGtUMjZu?=
 =?utf-8?B?SDZJSVVWRnRNWjlaM3BQT0x0NlJqM3U3TjNMaU5pRUpqdXJSaFVWb3BGS05v?=
 =?utf-8?B?a1VKMitMTURHdE5VYVBFZ2JyOTZRVzhUVllUajQwWlV0ZVEvNVZ1b0I1OHda?=
 =?utf-8?B?NTN4SU0xZUdFcGY0bkYyT1NnMjZBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A31F98EA96A8E84B8DB0FFB34A8A0B81@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aafc30d5-ec26-42c8-3e28-08d9a04be3e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2021 11:03:25.5201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pVvIZ0tXmwwdADEHcyCCLJy/7Yi6DIKyGka9eIVPwUbMC70m0sbTfpA6vvyWdosDlHK5bZV/n4ycb+9RmLximqsLgpfgK3N1Ev8/S8Yd80A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5289
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMTEvNS8yMSAxMTo1MSBBTSwgSmFjb3BvIE1vbmRpIHdyb3RlOg0KPiBIaSBFdWdlbg0KPiAN
Cj4gT24gRnJpLCBOb3YgMDUsIDIwMjEgYXQgMTA6MjU6NTlBTSArMDEwMCwgSmFjb3BvIE1vbmRp
IHdyb3RlOg0KPj4gSGkgRXVnZW4sDQo+Pg0KPj4gT24gRnJpLCBPY3QgMjIsIDIwMjEgYXQgMTA6
NTI6MzdBTSArMDMwMCwgRXVnZW4gSHJpc3RldiB3cm90ZToNCj4+PiBJZiBlbnVtZm10IGlzIGNh
bGxlZCB3aXRoIGFuIG1idXNfY29kZSwgdGhlIGVudW1mbXQgaGFuZGxlciBzaG91bGQgb25seQ0K
Pj4+IHJldHVybiB0aGUgZm9ybWF0cyB0aGF0IGFyZSBzdXBwb3J0ZWQgZm9yIHRoaXMgbWJ1c19j
b2RlLg0KPj4+IFRvIG1ha2UgaXQgbW9yZSBlYXN5IHRvIHVuZGVyc3RhbmQgdGhlIGZvcm1hdHMs
IGNoYW5nZWQgdGhlIHJlcG9ydCBvcmRlcg0KPj4+IHRvIHJlcG9ydCBmaXJzdCB0aGUgbmF0aXZl
IGZvcm1hdHMsIGFuZCBhZnRlciB0aGF0IHRoZSBmb3JtYXRzIHRoYXQgdGhlIElTQw0KPj4+IGNh
biBjb252ZXJ0IHRvLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogRXVnZW4gSHJpc3RldiA8ZXVn
ZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KPj4NCj4+IFJldmlld2VkLWJ5OiBKYWNvcG8gTW9u
ZGkgPGphY29wb0BqbW9uZGkub3JnPg0KPj4NCj4gDQo+IFRvbyBzb29uISBTb3JyeS4uLg0KPiAN
Cj4+IFRoYW5rcw0KPj4gICAgIGoNCj4+DQo+Pj4gLS0tDQo+Pj4gICBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL2F0bWVsL2F0bWVsLWlzYy1iYXNlLmMgfCA1MSArKysrKysrKysrKysrKysrLS0tDQo+
Pj4gICAxIGZpbGUgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4+
Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlz
Yy1iYXNlLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy1iYXNlLmMN
Cj4+PiBpbmRleCAyZGQyNTExYzdiZTEuLjFmN2ZiZTVlNGQ3OSAxMDA2NDQNCj4+PiAtLS0gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy1iYXNlLmMNCj4+PiArKysgYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy1iYXNlLmMNCj4+PiBAQCAtNDk5
LDIxICs0OTksNTYgQEAgc3RhdGljIGludCBpc2NfZW51bV9mbXRfdmlkX2NhcChzdHJ1Y3QgZmls
ZSAqZmlsZSwgdm9pZCAqcHJpdiwNCj4+PiAgICAgIHUzMiBpbmRleCA9IGYtPmluZGV4Ow0KPj4+
ICAgICAgdTMyIGksIHN1cHBvcnRlZF9pbmRleDsNCj4+Pg0KPj4+IC0gICBpZiAoaW5kZXggPCBp
c2MtPmNvbnRyb2xsZXJfZm9ybWF0c19zaXplKSB7DQo+Pj4gLSAgICAgICAgICAgZi0+cGl4ZWxm
b3JtYXQgPSBpc2MtPmNvbnRyb2xsZXJfZm9ybWF0c1tpbmRleF0uZm91cmNjOw0KPj4+IC0gICAg
ICAgICAgIHJldHVybiAwOw0KPj4+ICsgICBzdXBwb3J0ZWRfaW5kZXggPSAwOw0KPj4+ICsNCg0K
SGkgSmFjb3BvLA0KDQpUaGlzIGZvciBsb29wIGJlbG93IGZpcnN0IGl0ZXJhdGVzIHRocm91Z2gg
dGhlIGZvcm1hdHMgdGhhdCB3ZXJlIA0KaWRlbnRpZmllZCBhcyBkaXJlY3RseSBzdXBwb3J0ZWQg
YnkgdGhlIHN1YmRldmljZS4NCkFzIHdlIGFyZSBhYmxlIGluIHRoZSBJU0MgdG8ganVzdCBkdW1w
IHdoYXQgdGhlIHN1YmRldmljZSBjYW4gc3RyZWFtLCB3ZSANCmFkdmVydGlzZSBhbGwgdGhlc2Ug
Zm9ybWF0cyBoZXJlLg0KKGlmIHRoZSB1c2Vyc3BhY2UgcmVxdWlyZXMgb25lIHNwZWNpZmljIG1i
dXMgY29kZSwgd2Ugb25seSBhZHZlcnRpc2UgdGhlIA0KY29ycmVzcG9uZGluZyBmb3JtYXQpDQoN
Cj4+PiArICAgZm9yIChpID0gMDsgaSA8IGlzYy0+Zm9ybWF0c19saXN0X3NpemU7IGkrKykgew0K
Pj4+ICsgICAgICAgICAgIGlmICghaXNjLT5mb3JtYXRzX2xpc3RbaV0uc2Rfc3VwcG9ydCkNCj4g
DQo+IA0KPj4+ICsgICAgICAgICAgICAgICAgICAgY29udGludWU7DQo+Pj4gKyAgICAgICAgICAg
LyoNCj4+PiArICAgICAgICAgICAgKiBJZiBzcGVjaWZpYyBtYnVzX2NvZGUgaXMgcmVxdWVzdGVk
LCBwcm92aWRlIG9ubHkNCj4+PiArICAgICAgICAgICAgKiBzdXBwb3J0ZWQgZm9ybWF0cyB3aXRo
IHRoaXMgbWJ1cyBjb2RlDQo+Pj4gKyAgICAgICAgICAgICovDQo+Pj4gKyAgICAgICAgICAgaWYg
KGYtPm1idXNfY29kZSAmJiBmLT5tYnVzX2NvZGUgIT0NCj4+PiArICAgICAgICAgICAgICAgaXNj
LT5mb3JtYXRzX2xpc3RbaV0ubWJ1c19jb2RlKQ0KPj4+ICsgICAgICAgICAgICAgICAgICAgY29u
dGludWU7DQo+Pj4gKyAgICAgICAgICAgaWYgKHN1cHBvcnRlZF9pbmRleCA9PSBpbmRleCkgew0K
Pj4+ICsgICAgICAgICAgICAgICAgICAgZi0+cGl4ZWxmb3JtYXQgPSBpc2MtPmZvcm1hdHNfbGlz
dFtpXS5mb3VyY2M7DQo+Pj4gKyAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4+PiArICAg
ICAgICAgICB9DQo+Pj4gKyAgICAgICAgICAgc3VwcG9ydGVkX2luZGV4Kys7DQo+Pj4gICAgICB9
DQo+Pj4NCj4+PiAtICAgaW5kZXggLT0gaXNjLT5jb250cm9sbGVyX2Zvcm1hdHNfc2l6ZTsNCj4+
PiArICAgLyoNCj4+PiArICAgICogSWYgdGhlIHNlbnNvciBkb2VzIG5vdCBzdXBwb3J0IHRoaXMg
bWJ1c19jb2RlIHdoYXRzb2V2ZXIsDQo+Pj4gKyAgICAqIHRoZXJlIGlzIG5vIHJlYXNvbiB0byBh
ZHZlcnRpc2UgYW55IG9mIG91ciBvdXRwdXQgZm9ybWF0cw0KPj4+ICsgICAgKi8NCj4+PiArICAg
aWYgKHN1cHBvcnRlZF9pbmRleCA9PSAwKQ0KPj4+ICsgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Ow0KPiANCj4gU2hvdWxkbid0IHlvdSBhbHNvIHJldHVybiAtRUlOVkFMIGlmIGluZGV4ID4gc3Vw
cG9ydGVkX2luZGV4ID8NCg0KTm8uIElmIHdlIGNvdWxkIG5vdCBmaW5kIGFueSBmb3JtYXQgdGhh
dCB0aGUgc2Vuc29yIGNhbiB1c2UgDQooc3VwcG9ydGVkX2luZGV4ID09IDApLCBhbmQgdGhhdCBv
dXIgSVNDIGNhbiBhbHNvIHVzZSwgdGhlbiB3ZSBkb24ndCANCnN1cHBvcnQgYW55dGhpbmcsIHRo
dXMsIHJldHVybiAtRUlOVkFMIHJlZ2FyZGxlc3Mgb2YgdGhlIGluZGV4Lg0KDQo+IA0KPiBJbiB0
aGF0IGNhc2UsIEknbSBub3QgZ2V0dG5nIHdoYXQgdGhlIHJlc3Qgb2YgdGhlIGZ1bmN0aW9uIGlz
IGZvciA/DQo+IA0KDQpUaGlzIGlzIHRoZSBjYXNlIHdoZW4gd2UgaWRlbnRpZmllZCBvbmUgc3Vw
cG9ydGVkIGZvcm1hdCBmb3IgYm90aCB0aGUgDQpzZW5zb3IgYW5kIHRoZSBJU0MgKGNhc2Ugd2hl
cmUgc3VwcG9ydGVkX2luZGV4IGZvdW5kIGVhcmxpZXIgaXMgPj0gMSkNCg0KPj4+ICsNCj4+PiAr
ICAgLyoNCj4+PiArICAgICogSWYgdGhlIHNlbnNvciB1c2VzIGEgZm9ybWF0IHRoYXQgaXMgbm90
IHJhdywgdGhlbiB3ZSBjYW5ub3QNCj4+PiArICAgICogY29udmVydCBpdCB0byBhbnkgb2YgdGhl
IGZvcm1hdHMgdGhhdCB3ZSB1c3VhbGx5IGNhbiB3aXRoIGENCj4+PiArICAgICogUkFXIHNlbnNv
ci4gVGh1cywgZG8gbm90IGFkdmVydGlzZSB0aGVtLg0KPj4+ICsgICAgKi8NCj4+PiArICAgaWYg
KCFpc2MtPmNvbmZpZy5zZF9mb3JtYXQgfHwNCj4+PiArICAgICAgICFJU0NfSVNfRk9STUFUX1JB
Vyhpc2MtPmNvbmZpZy5zZF9mb3JtYXQtPm1idXNfY29kZSkpDQo+Pj4gKyAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7DQo+Pj4NCg0KTmV4dCwgaWYgdGhlIGN1cnJlbnQgZm9ybWF0IGZyb20gdGhl
IHN1YmRldiBpcyBub3QgcmF3LCB3ZSBhcmUgZG9uZS4NCkJ1dCwgaWYgaXQncyByYXcsIHdlIGNh
biB1c2UgaXQgdG8gY29udmVydCB0byBhIHBsZXRob3JhIG9mIG90aGVyIA0KZm9ybWF0cy4gU28g
d2UgaGF2ZSB0byBlbnVtZXJhdGUgdGhlbSBiZWxvdyA6DQoNCldpdGggdGhlIHByZXZpb3VzIGNo
ZWNrcywgSSBhbSBtYWtpbmcgc3VyZSB0aGF0IHRoZSBJU0MgY2FuIHJlYWxseSANCmNvbnZlcnQg
dG8gdGhlc2UgZm9ybWF0cywgb3RoZXJ3aXNlIHRoZXkgYXJlIGJhZGx5IHJlcG9ydGVkDQoNCkhv
cGUgdGhpcyBtYWtlcyB0aGluZ3MgbW9yZSBjbGVhciwgYnV0IHBsZWFzZSBhc2sgaWYgc29tZXRo
aW5nIGxvb2tzIHN0cmFuZ2UNCg0KPj4+ICsgICAvKg0KPj4+ICsgICAgKiBJdGVyYXRlIGFnYWlu
IHRocm91Z2ggdGhlIGZvcm1hdHMgdGhhdCB3ZSBjYW4gY29udmVydCB0by4NCj4+PiArICAgICog
SG93ZXZlciwgdG8gYXZvaWQgZHVwbGljYXRlcywgc2tpcCB0aGUgZm9ybWF0cyB0aGF0DQo+Pj4g
KyAgICAqIHRoZSBzZW5zb3IgYWxyZWFkeSBzdXBwb3J0cyBkaXJlY3RseQ0KPj4+ICsgICAgKi8N
Cj4+PiArICAgaW5kZXggLT0gc3VwcG9ydGVkX2luZGV4Ow0KPj4+ICAgICAgc3VwcG9ydGVkX2lu
ZGV4ID0gMDsNCj4+Pg0KPj4+IC0gICBmb3IgKGkgPSAwOyBpIDwgaXNjLT5mb3JtYXRzX2xpc3Rf
c2l6ZTsgaSsrKSB7DQo+Pj4gLSAgICAgICAgICAgaWYgKCFJU0NfSVNfRk9STUFUX1JBVyhpc2Mt
PmZvcm1hdHNfbGlzdFtpXS5tYnVzX2NvZGUpIHx8DQo+Pj4gLSAgICAgICAgICAgICAgICFpc2Mt
PmZvcm1hdHNfbGlzdFtpXS5zZF9zdXBwb3J0KQ0KPj4+ICsgICBmb3IgKGkgPSAwOyBpIDwgaXNj
LT5jb250cm9sbGVyX2Zvcm1hdHNfc2l6ZTsgaSsrKSB7DQo+Pj4gKyAgICAgICAgICAgLyogaWYg
dGhpcyBmb3JtYXQgaXMgYWxyZWFkeSBzdXBwb3J0ZWQgYnkgc2Vuc29yLCBza2lwIGl0ICovDQo+
Pj4gKyAgICAgICAgICAgaWYgKGZpbmRfZm9ybWF0X2J5X2ZvdXJjYyhpc2MsIGlzYy0+Y29udHJv
bGxlcl9mb3JtYXRzW2ldLmZvdXJjYykpDQo+Pj4gICAgICAgICAgICAgICAgICAgICAgY29udGlu
dWU7DQo+Pj4gICAgICAgICAgICAgIGlmIChzdXBwb3J0ZWRfaW5kZXggPT0gaW5kZXgpIHsNCj4+
PiAtICAgICAgICAgICAgICAgICAgIGYtPnBpeGVsZm9ybWF0ID0gaXNjLT5mb3JtYXRzX2xpc3Rb
aV0uZm91cmNjOw0KPj4+ICsgICAgICAgICAgICAgICAgICAgZi0+cGl4ZWxmb3JtYXQgPQ0KPj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBpc2MtPmNvbnRyb2xsZXJfZm9ybWF0c1tpXS5m
b3VyY2M7DQo+Pj4gICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+Pj4gICAgICAgICAg
ICAgIH0NCj4+PiAgICAgICAgICAgICAgc3VwcG9ydGVkX2luZGV4Kys7DQo+Pj4gLS0NCj4+PiAy
LjI1LjENCj4+Pg0KDQo=
