Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 753044AD2A3
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 09:00:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344103AbiBHIA3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 03:00:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236611AbiBHIA2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 03:00:28 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5091BC0401EF
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 00:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1644307225; x=1675843225;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bgc5GfCKBHN8ILPTDkAL701WWyRoAQshg3Tch45/9K8=;
  b=UEpl2y/X2kTcuztJK7Q3tXq0sa8Js+FdM+J1figmqYuKB2qihjc/FDCP
   JCgDF/ru/OKzZOJmdB4u71xFM1pDLNluESjhIIPOd2qLr4LsKTwiXA8Qb
   fYo7IVgAi+BvY2Z5VDcm2KvY/7LfVUwAVn6ErSPFBO2r1fOYP4kGB7VlX
   bhYnwiI+08nLKhi9z8FidKorZ3OeD7ChMUPWPkHFU0ozDDKP+DkKmf5Vm
   VkHyXCKF4ij+yOdaeVBgi230dCn0iCBlMEUe6hRG0JcOkVfXETqduZPCt
   EsXi5S/XiYDUGJKfsJf73qWW3T9ZARtFq3wSyKPbJdm/r4wJ6dD4Ityfb
   Q==;
IronPort-SDR: EEhrcaNm/s6zG72VONls9uRAV/Ho3qHjRAYR5JB7QvpV9BP9g0Cldal1BtwuAT3VvS2oKaBfcj
 6q7z2hTkZ+woGUaZmnUnV3OiQ+my3GkqaK3+L/F6w/VLFv9L/8aIpWwRdK1chj32SaqIDW/62r
 VxoEBLSCtqydL91TD42E1goT6mBb4xKG+0WClDBjPlxxLR0jKAuzj+fRSlxhxgd26OVLWUnNUz
 s0LhYPdV1fbL7OKZ4vzDpnCjxdydGNHfR0CuTBQmw8XqIvqfCCMSdP1m9ta1T6CIheQT5THcvw
 CX1h3QROuk/URoWhWN38IIfn
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; 
   d="scan'208";a="145223105"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Feb 2022 01:00:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 8 Feb 2022 01:00:24 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 8 Feb 2022 01:00:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cra0IxsawA50OVpedwxznBnjX5K4iFEZJWbIcUcREL58bLRsmfdgHFES+EomjNzp3uoczjcIhkU6Iv9jUmxzer/Rlcu55b8jR7IqN1Trf31o3NSrt0SSQYJ8w5vxhMuUUeWeEkZSCdT1cGCeHUjFoILEQmUo5GWFpu0ygssOjf1iji2noQbhY8+nhaECFgAW8SmALq6pEAErjJuYWn22OIHg+hteRTVcKmOJkTAjJZOttl4LdRGZlYxDuwloZHj08d/7RyKAjny7B8oInUirkM4PUaAMVMSPdx4/NSKausvY709tMfR15seAChhWsl9oYIjW+inPZyVOD7dOdEJNkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgc5GfCKBHN8ILPTDkAL701WWyRoAQshg3Tch45/9K8=;
 b=mpbt+B115UDcRaeWkRn4lnqlq13R8j7Lf+xHWp6hBXkqclsB4BAS+RinwB2yr5mH12owZ/DjCu6Ack8kFPUP2sog61GEMEpfueLCusFni6bTpmKmWeLTH/NYhHzAE1jnVdRACBpH7ssJDunSeqVyBc3Qcg8liUnhRiouYYxfm6xbSrbkH/+2vKU7R+b3PB1+gwLi3kT2GfL2DwEGbdafOI+KxNVe1HOhygM89MtkAlaMWEYHD+vg1gXYmc16cQe5SrVFBkI4M+QnT2bKlqKy3jnSQZsxi2TbiFxxq7DBOKlLz1hWRY97DyvGNOYvrRkH27REtD35ObExQvwhgKvJGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgc5GfCKBHN8ILPTDkAL701WWyRoAQshg3Tch45/9K8=;
 b=YsJ9MmpFQ9bNzW0GEhUfFkV9hgqB74WyjU21XtyDZwj6/RZ1VlDuxtrCAz+4h6tZX1zZAWz5L42Kt+vUa8c7YsgxBmiAcqRazCCgfCn8T/gh/r8adepNizUk8ydDyR1rwxVddjLMIKMW5MT9hstigWrP78MMk9/Uc7CMLeYf60I=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by CY4PR1101MB2358.namprd11.prod.outlook.com (2603:10b6:903:ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 08:00:19 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc%9]) with mapi id 15.20.4975.011; Tue, 8 Feb 2022
 08:00:19 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <mchehab@kernel.org>, <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/1] microchip-csi2dc: Remove VC support for now
Thread-Topic: [PATCH 1/1] microchip-csi2dc: Remove VC support for now
Thread-Index: AQHYGErW4A/BdhOeLUW3uTV7RDBBc6yJJBKAgAAvKoA=
Date:   Tue, 8 Feb 2022 08:00:19 +0000
Message-ID: <ed240352-0588-d963-2b0a-7b65280e96b0@microchip.com>
References: <20220202153609.240387-1-sakari.ailus@linux.intel.com>
 <20220208061129.158ba126@sal.lan>
In-Reply-To: <20220208061129.158ba126@sal.lan>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c467483-28e2-4ee3-0b72-08d9ead90cb9
x-ms-traffictypediagnostic: CY4PR1101MB2358:EE_
x-microsoft-antispam-prvs: <CY4PR1101MB23581A06FF65E081212B3982E82D9@CY4PR1101MB2358.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1ajauKaYRw3inv81Ned5uMRcJDARb7vqF0h0DythWKbMp1jEdvDKECgq3V7DJvtgM0xCBf2aj3NUMDOH9IXjOdkkKwFmLVMCiSgV5EOQrxL0midOtuliiT/Ar3jKuAfXVQSeUuVfedJF+0sta4xq4H8nvkQxESJ7KS0z50ShIbm90ljpgDQphPdk5+YtnZRMHL+e0msqMpsoMtmyIq+GVtQYemfE1KtOOFAQoEg5ZsNBDwSsXjvV9muI/72oUvN7pauVgWYvmV24xl/ZJrCcphMWHzwhUuYEG5JsuJdKSKXPAtfGQpHlliNeO0kLLHUH/I6rIVSwMTVHL77iwZ8B8K8lgwX4zE5wVWOHn7qExuiKcVVeRTLVB9fo34Eyfs3vF1ZPbH5JZYhKQ8ArJ8UcPL5ovKLj0HbKMAVjPIZBc80S5wkdGIt0pBwwpVZGNWT05UPRB4Kt8KzXH9iqCevWdsY21DoIr11ssnC/h+/QDPiAdlx/pFHlOfx4/9ua0Fm1vOabUzEHxLR4w4c/oSGnrdnHPHhez3zjeJ3AH3yrC1oVeVV+4VFmF+/acsNxEes5Kjl1gXpT4+nqSf6lUbsrT491hS+7gNwT0lbF8P5pmrqZIgn49uRerNHtUBTx0t5dFE82tJs5vlyy7Gfwniq8A1dOBMgHl4kjedpuEbnA0gdZAr14LITOPYpaYLVQlaEN5aV0JqmyvTfCaTY57qcAnY8xFXnX1ZWGqo2AzOatqSoTFyFtgtFWhaiyv6X0n4RaSAF6S9F5K45Utnjmjkq5Ug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5384.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(36756003)(186003)(6512007)(64756008)(6506007)(66476007)(83380400001)(6486002)(2906002)(316002)(2616005)(122000001)(38100700002)(31686004)(53546011)(71200400001)(4326008)(110136005)(38070700005)(86362001)(31696002)(66946007)(8936002)(76116006)(5660300002)(508600001)(54906003)(91956017)(66446008)(8676002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWNXLytrdDhHdXdTdlMyUzkrbWZQUnJwWDAwQjZ2Um04bEdXVkFBdkRLeEg1?=
 =?utf-8?B?MWlOUWlMNGdtNHRPckVNQlNMYnpGYS9BT0x5dDBrMjN5MGhya044dWRKeDBT?=
 =?utf-8?B?TVlFT3B3NW1IR25BOWFXL1NMeGdaNVljQzVmS0wvZEJ5enJNK2s4RnJSTUp3?=
 =?utf-8?B?SU0vY1lWaUp5M1lwMUQ4Q2RkMDc1Y25aanRiWVJFN2JaT1NnWEIzVnNLa0Ur?=
 =?utf-8?B?ZVhWNnFRUlE5NDRLWmVNUmdMaUZnZUJmY3J3MThHZlFqNlBuZXBUaUhTaGRV?=
 =?utf-8?B?VVY2eWVWb01JT2FrbnRYbTQ4TGJpOTByZTVSbnordHhrSHFRNFpGYUV0YzVJ?=
 =?utf-8?B?eXNZeGVHSUd0NS9XcTlkYkpSSkU3bE5hUFJXOVN0RE40aW5EaTdPMnpZNDMy?=
 =?utf-8?B?ZWZ5WHB6ajNJblh2R1pLUkQvcm5uT3BvZlJZTGNvc1BrUWxWNkZFcXJWQzUy?=
 =?utf-8?B?djZpVEgzL2JiMThCOFhtK2E5NDZ2LysvQkdXQkIzYmJsQ3hWTmtBK3FTZFRh?=
 =?utf-8?B?a1AyektvTzVyVnRzZktGbTAySWxYWU9pUmxQU3B2OEc2eEJLUXhvc3RidDRa?=
 =?utf-8?B?N0FxT3VyZFlrall0V1BVekFtdk04Vi94cVE0VWZjNnJxVitBUnZkZzBYQXJ4?=
 =?utf-8?B?eDRuR1pkL0Uxbm41UmpBajhYQzk2dU1zaEZOeEwyaHhCcDlSOFBMKzNBRnJI?=
 =?utf-8?B?UWo2b2RVYnR4ZE1RdEt5V1FzaWZNZW9CS3lEVW9ybW1kUDlNVFZqMlNCQTIr?=
 =?utf-8?B?N25YNFV0TnN1ZkN5aWY4RDdacEhrcklKVGNZNFd6VmlpU2FhQmJmSzYyd1Vw?=
 =?utf-8?B?SFY1WHFwek83NjEyeC90OWZjNnROUEFTbTY0eUtobFJScENVQll1anVkUmp4?=
 =?utf-8?B?cFBMSnltTXJCamlXOVpOVEkvNFB2cTFkenQ2Q2NMWDFLWndaRHE1aDRaRDRW?=
 =?utf-8?B?V09ScTNaVnJ4ai9Fb2JxTlZRSTQ2NktUTEFuVEE3bmdSWXhGS0d6U01oeFdB?=
 =?utf-8?B?QVIrNk1IWTZYTzB5WGJpMXVvT3pNZkhBVWdwb1k5R0pTeDVZMjVLYWkweTZq?=
 =?utf-8?B?L3I4clMwVnZYZWgwU3lvZ3VYc1oraXJ6WnU1d1JhOUxiNTlEWHNRTUl3T0tL?=
 =?utf-8?B?c3UweG9CbStJamVlMUt3LzJIWlEzb1RwZW9taXpPT2lqb1lYQ2Qzd00rcDFR?=
 =?utf-8?B?Qmw2ajdOU0RDYUpaMkRnS0VzY1U1dkpORmQvS2RYMEw3SjJEMXNCUHJSYklD?=
 =?utf-8?B?VnExbldTYjZJQVcwbEpPTTBlNnFuSHUveXFIdHQ0VzdrK08xY1laUGlVRW5V?=
 =?utf-8?B?L1oyYVNrajRCbFBBNHR0dkVubHlDeklZRUhiMU1jUThzVC9SaGdqcDQwTHRS?=
 =?utf-8?B?dCtoV0JYbFBKMWwzY3VVOHMxRlZQbCswRitVNThqTzVwenBSMlBDdlM4QnFF?=
 =?utf-8?B?aUZLcDdYZW5GNWxINHpCbXE1cE1pVXlYRFhISFg4K1FZdERQTTlCS3lhdDQx?=
 =?utf-8?B?WXVpVTMrQzIwU2wvZEZSZFZlMms0UmRSZDRwd2NQcmY4bVpXd0N0QzAwSFRD?=
 =?utf-8?B?Z3NrV0NYQ2c5dzJjcmRwRWlZVGJBY0dHRThzclJsQU9KaWpENWhpQWlBamd4?=
 =?utf-8?B?S1V5Y2M1NytZNFNaTUNhUHlGRGJjK3BjWnhEUnNoQm1LNTRqSEFLU2lUM2RI?=
 =?utf-8?B?b05GSGd2NzRhclVlamU3YThZa2J6OVFqZFNPNnBvdDlMd2ZsNkpKMEhRMkI0?=
 =?utf-8?B?dHB1Q1FDNGhxOThRenlxc3liRzhHT3hydmJadEcrTFEyOWo4a1UwNGQzSjFu?=
 =?utf-8?B?ZE5Zem11QUlZaGZ0VXdlQzd2czRaRjhUK2hrSytOZ0VJT1UwQmJKc1NUdjhC?=
 =?utf-8?B?MmtMMlNpcFk0Y1NodjFiem1zcHBKUVlxUTVYQnJPU1BvaFJLTVNxMDVBYVhQ?=
 =?utf-8?B?RWVyeFRPdzhKemViRGQ1V0hrSUkzY2hJVEdCQkxwdWdmZlVOa3JydkN5c2pr?=
 =?utf-8?B?TkQrNERUNENRbVlZNG5WSVpOZ21DY0xtZVY3RG5SSG83YjVYWUMvdHVkTWxu?=
 =?utf-8?B?UVNJTEI4cEhYWHUzNW9pWlN3eGZjcFI4N0xINVdPak9aaXpRZDlVUjlUQlQ0?=
 =?utf-8?B?Q3Z6Ymd0V2VvYzNzdHIycnRFMGhuNWI5N0hRZkVzNHlWTUtOakIxOUdkQlRz?=
 =?utf-8?B?NDBDSU55cjkzRHVCRE1PSTg5VHBhMU1TWWxzZm9TakR0clNIcnUxRGNrUjBs?=
 =?utf-8?B?ZXRLQURJbTlqZHprcUs3THN4VHB3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D5D518844E2B14986C0463944319217@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c467483-28e2-4ee3-0b72-08d9ead90cb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 08:00:19.0485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YIezTDWYHD2YaVSU8lOZGfissnfHqvtCc86d8XIi30yImbEka0chxvnYUPHmUXslhvk5t6NI+pwqly/tbHBAc2LUgnWS90EuCFBHnh7ews8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2358
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMi84LzIyIDc6MTEgQU0sIE1hdXJvIENhcnZhbGhvIENoZWhhYiB3cm90ZToNCj4gRW0gV2Vk
LCAgMiBGZWIgMjAyMiAxNzozNjowOSArMDIwMA0KPiBTYWthcmkgQWlsdXMgPHNha2FyaS5haWx1
c0BsaW51eC5pbnRlbC5jb20+IGVzY3JldmV1Og0KPiANCj4+IEFzIHBhcnQgb2YgcmVtb3Zpbmcg
bWJ1cyBjb25maWcgZmxhZ3MsIHJlbW92ZSBWQyBmbGFnIHVzZSBpbiB0aGUNCj4+IG1pY3JvY2hp
cC1jc2kyZGMgZHJpdmVyLiBUaGUgc3VwcG9ydCBjYW4gYmUgcmVpbnRyb2R1Y2VkIGxhdGVyIG9u
IGFzIHBhcnQNCj4+IG9mIHRoZSBzdHJlYW1zIHBhdGNoZXMuDQo+Pg0KPj4gQ2M6IEV1Z2VuIEhy
aXN0ZXYgPGV1Z2VuLmhyaXN0ZXZAbWljcm9jaGlwLmNvbT4NCj4gDQo+IEhtbS4uLiB0aGF0IHNv
dW5kcyBhIHJlZ3Jlc3Npb24gdG8gbWUuIFdoYXQgZWZmZWN0cyB0aGlzIHdpbGwgY2F1c2UgYXQN
Cj4gdGhlIGRyaXZlcj8NCj4gDQo+IEV1Z2VuLCBhbnkgY29tbWVudHM/DQoNCkhpICwNCg0KSSBh
bSBub3QgaGFwcHkgd2l0aCB0aGlzIGNoYW5nZS4gSXQgbG9va3MgbGlrZSBJIHdhc24ndCBldmVu
IENDLWVkIG9uIA0KdGhlIG9yaWdpbmFsIHBhdGNoIGUtbWFpbC4NCg0KVGhlIGVmZmVjdCBvbiB0
aGUgZHJpdmVyIHdpbGwgYmUgdGhhdCBldmVyeXRoaW5nIHdpbGwgYmUgdHJlYXRlZCBhcyANCnZp
cnR1YWwgY2hhbm5lbD0wIC4NCkkgZG8gbm90IHlldCB1bmRlcnN0YW5kIHdoeSB3ZSBhcmUgYWJv
dXQgdG8gcmVtb3ZlIA0KVjRMMl9NQlVTX0NTSTJfQ0hBTk5FTF8qIGFzIEkgcmVtZW1iZXIgdGhp
cyB3YXMganVzdCBpbnRyb2R1Y2VkLg0KSXMgdGhlcmUgYW55IGFsdGVybmF0aXZlIGluIHBsYWNl
ID8NCg0KTXkgb3BpbmlvbiBpcyB0aGF0IGlmIHdlIHdhbnQgdG8gcmVwbGFjZSBzb21ldGhpbmcg
ZXhpc3Rpbmcgd2l0aCBhIG5ldyANCkFQSSBvciBzb21ldGhpbmcgZWxzZSwgd2Ugc2hvdWxkIGZp
cnN0IGFkZCB0aGUgbmV3IHN1cHBvcnQsIGJsb2NrIGFueSANCm5ldyBhZG9wdGVycyBmb3IgdGhl
IG9sZCBBUEkgc3VjaCB0aGF0IGV2ZXJ5b25lIHVzZXMgdGhlIG5ldyBBUEksIGFuZCANCm9ubHkg
YWZ0ZXIgdGhhdCBjb252ZXJ0IHRoZSBvbGQgQVBJIGNsaWVudHMgdG8gdGhlIG5ldyBBUEkuDQpT
byAnY2FuIGJlIHJlaW50cm9kdWNlZCBsYXRlciBvbicgaXMgbm90IG9rYXkuIFdlIGNhbid0IHJl
bW92ZSB0aGluZ3MgaW4gDQp0aGUgaG9wZSB0aGF0IGl0IHdvdWxkIGJlIHJlaW50cm9kdWNlZCBs
YXRlci4gSnVzdCBteSBwZXJzb25hbCB0YWtlIG9uIA0KdGhpcywgZmVlbCBmcmVlIHRvIGhhdmUg
YSBkaWZmZXJlbnQgb3Bpbmlvbi4NCg0KSW4gdGhlIGVuZCB5b3UgZ3V5cyBhcmUgdGhlIG1haW50
YWluZXJzIGZvciB0aGUgc3Vic3lzdGVtIGFuZCBjYW4gaGF2ZSANCnRoaXMgY2hhbmdlIGlmIHlv
dSBsaWtlLCBJIGFtIG1vcmUgdW5oYXBweSBhYm91dCB0aGUgZmFjdCB0aGF0IGNoYW5nZXMgDQpo
YXBwZW4gc3VkZGVubHkgYW5kIHdpdGhvdXQgbm90aWNlLg0KDQpFdWdlbg0KDQo+IA0KPj4gU2ln
bmVkLW9mZi1ieTogU2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPg0K
Pj4gLS0tDQo+PiAgIC4uLi9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9taWNyb2NoaXAtY3NpMmRjLmMg
ICAgfCAxOCArKy0tLS0tLS0tLS0tLS0tLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vYXRtZWwvbWljcm9jaGlwLWNzaTJkYy5jIGIvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9hdG1lbC9taWNyb2NoaXAtY3NpMmRjLmMNCj4+IGluZGV4IDZiYzU0OWMyOGUwNS4uNmE3
ZjViNGIwZTNiIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9t
aWNyb2NoaXAtY3NpMmRjLmMNCj4+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwv
bWljcm9jaGlwLWNzaTJkYy5jDQo+PiBAQCAtMzQ4LDI0ICszNDgsMTUgQEAgc3RhdGljIGludCBj
c2kyZGNfZ2V0X21idXNfY29uZmlnKHN0cnVjdCBjc2kyZGNfZGV2aWNlICpjc2kyZGMpDQo+PiAg
ICAgICAgaWYgKHJldCA9PSAtRU5PSU9DVExDTUQpIHsNCj4+ICAgICAgICAgICAgICAgIGRldl9k
YmcoY3NpMmRjLT5kZXYsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICJubyByZW1vdGUgbWJ1
cyBjb25maWd1cmF0aW9uIGF2YWlsYWJsZVxuIik7DQo+PiAtICAgICAgICAgICAgIGdvdG8gY3Np
MmRjX2dldF9tYnVzX2NvbmZpZ19kZWZhdWx0czsNCj4+ICsgICAgICAgICAgICAgcmV0dXJuIDA7
DQo+PiAgICAgICAgfQ0KPj4NCj4+ICAgICAgICBpZiAocmV0KSB7DQo+PiAgICAgICAgICAgICAg
ICBkZXZfZXJyKGNzaTJkYy0+ZGV2LA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAiZmFpbGVk
IHRvIGdldCByZW1vdGUgbWJ1cyBjb25maWd1cmF0aW9uXG4iKTsNCj4+IC0gICAgICAgICAgICAg
Z290byBjc2kyZGNfZ2V0X21idXNfY29uZmlnX2RlZmF1bHRzOw0KPj4gKyAgICAgICAgICAgICBy
ZXR1cm4gMDsNCj4+ICAgICAgICB9DQo+Pg0KPj4gLSAgICAgaWYgKG1idXNfY29uZmlnLmZsYWdz
ICYgVjRMMl9NQlVTX0NTSTJfQ0hBTk5FTF8wKQ0KPj4gLSAgICAgICAgICAgICBjc2kyZGMtPnZj
ID0gMDsNCj4+IC0gICAgIGVsc2UgaWYgKG1idXNfY29uZmlnLmZsYWdzICYgVjRMMl9NQlVTX0NT
STJfQ0hBTk5FTF8xKQ0KPj4gLSAgICAgICAgICAgICBjc2kyZGMtPnZjID0gMTsNCj4+IC0gICAg
IGVsc2UgaWYgKG1idXNfY29uZmlnLmZsYWdzICYgVjRMMl9NQlVTX0NTSTJfQ0hBTk5FTF8yKQ0K
Pj4gLSAgICAgICAgICAgICBjc2kyZGMtPnZjID0gMjsNCj4+IC0gICAgIGVsc2UgaWYgKG1idXNf
Y29uZmlnLmZsYWdzICYgVjRMMl9NQlVTX0NTSTJfQ0hBTk5FTF8zKQ0KPj4gLSAgICAgICAgICAg
ICBjc2kyZGMtPnZjID0gMzsNCj4+IC0NCj4+ICAgICAgICBkZXZfZGJnKGNzaTJkYy0+ZGV2LCAi
c3ViZGV2IHNlbmRpbmcgb24gY2hhbm5lbCAlZFxuIiwgY3NpMmRjLT52Yyk7DQo+Pg0KPj4gICAg
ICAgIGNzaTJkYy0+Y2xrX2dhdGVkID0gbWJ1c19jb25maWcuZmxhZ3MgJg0KPj4gQEAgLTM3NSwx
MSArMzY2LDYgQEAgc3RhdGljIGludCBjc2kyZGNfZ2V0X21idXNfY29uZmlnKHN0cnVjdCBjc2ky
ZGNfZGV2aWNlICpjc2kyZGMpDQo+PiAgICAgICAgICAgICAgICBjc2kyZGMtPmNsa19nYXRlZCA/
ICJnYXRlZCIgOiAiZnJlZSBydW5uaW5nIik7DQo+Pg0KPj4gICAgICAgIHJldHVybiAwOw0KPj4g
LQ0KPj4gLWNzaTJkY19nZXRfbWJ1c19jb25maWdfZGVmYXVsdHM6DQo+PiAtICAgICBjc2kyZGMt
PnZjID0gMDsgLyogVmlydHVhbCBJRCAwIGJ5IGRlZmF1bHQgKi8NCj4+IC0NCj4+IC0gICAgIHJl
dHVybiAwOw0KPj4gICB9DQo+Pg0KPj4gICBzdGF0aWMgdm9pZCBjc2kyZGNfdnBfdXBkYXRlKHN0
cnVjdCBjc2kyZGNfZGV2aWNlICpjc2kyZGMpDQoNCg==
