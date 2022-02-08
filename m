Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35A9A4AD7CF
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 12:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353143AbiBHLtG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 06:49:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355643AbiBHLsx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 06:48:53 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 090AEC03C193
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 03:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1644320276; x=1675856276;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SIh3hBoixvulXYdHWqweRZZwflynMepTlaUjd4MiYhI=;
  b=NZbrw3vNCmkq7SzNOAQnGsHCRxZYCK4Qj5er8Vrq+K/SMXRdHcmsJMPp
   u1d6NeZHE8fcUdowJSOHEykGrWTCFCYO8+3B9VBc9UzsUK6iiSA5Bcua2
   Bp/YVqX3VfulPN0SF+VXeSSoyF2jOhgw/1gPalW1HVv1x8744DCnj8f9f
   jzM9/XkhiRmwLuu5K02X1zfea89NInTcQAX7TyTnNb/KEKTmV9aX+7aNt
   QTQoKiUi0EYexGscBscv/tTBYu+TaE6pQnlY4rX1IjC86/dyy9t2PKSVT
   gXzzckfva/I9tcqgdRdQGQC7iLSepLjr/bwmK0IWZcl7Q1+04C1JuPJdK
   g==;
IronPort-SDR: J1E523DJS8jW+nQvy/nvPGUsYB2HKS6MS/ML846ymYYYAr3NK9gq9tKCasA8wWydlR2Bs0fgMq
 NoAiZRuanwMfLN0VpSRmkNkaepgZH1Gjft1lCF8+7JdkWDFJ1MCLIjisKP/fDiLjmmXS8qD26w
 TbV++5Fx6Z6qpokUfw/DT5I5bE0I0eGTVEFChnEmLfxLLEyEZIUIBMKsqLWjfK+zr8fjYab9Bg
 WfNXFCPB14axAczVHDwrG8WraQh8N/uxMxvWg+NxdBI18QQbHUXA1KGFr3aJBD5VBZIy7yN3Y8
 FaX4jDx6mUq/hdBC0mxLe4/z
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; 
   d="scan'208";a="85021913"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Feb 2022 04:37:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 8 Feb 2022 04:37:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 8 Feb 2022 04:37:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5OxZfafrJ/VOOnvAh/HKstO6pZANDAA193vmDdpnGMKVzW3f+07W9wxgXXgzfKHz848tmAUsFm/bEQN8Y/MnkBokN//PQey5MBGvwKcO3d64hoWkRBDgk0Z+vdqqIKLalaeCuzorR3njaSs+TVHCSzVxcqAjDvTWGM802NIU7cYffCaHUzRYNx23T652S2Jqy+VXdyWhCfWSZuEBYGz1DzquFPiNPKHsk6RlUoM6ZHBN4hwZt5X5qKrPw8L5D98ujp+pTFpBt6TkvkgI0aRfzFNXzZ9pcsMHhSoBgpqnQUTA74WFCPoABr2eUDz3mLanq7WgbJRX0CnrYfJglIw/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIh3hBoixvulXYdHWqweRZZwflynMepTlaUjd4MiYhI=;
 b=BUhFOWdUdsUr8aoCHlpEA/O+EhygBOyT3geYZP0E/0+AaeEdNBZl0DB6j3WjExh4wKjkn1yaT7PuIYjCcw5B7nXUBlkywAcGelK5vSORsOGDpTzQV1wRrELKar6e6MjFFJKmIYSIsEgpicqLKkH0Yf43UA/lUt10M11P/ptfQSux2MzL5Kmoq7qDlL6TBNpLlMJx6JPqnKxs3IPrGHATa9mCFmNA1h/Rjh6xrnTqup8jSdGRYXbj3FQQhUa/CRHWtsdJIQrQLAU2Q3WAqPJnG1+47a9Xz9JP2VRgesB0WSoylLC01Synbq9am54vykKHYXCnYFGz+1WvkTA6/gZxJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIh3hBoixvulXYdHWqweRZZwflynMepTlaUjd4MiYhI=;
 b=Q+szcY7EGukPchI6DxlEZGcnvlSJ4LCvcYNoW8Zmi7KJjdRVEzOI1vVQFFHdgir95DRQcKqDUCZWHbV8w5HQ0bxscIKRkdyaYHzWt1xTqju07ktulD9iMpKFFRb+xDBwEEcSJ/0mM0gHmLjGZKv/2fW+n1JuNKu5TETvDQVCT2o=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by BL3PR11MB5683.namprd11.prod.outlook.com (2603:10b6:208:33e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 11:37:50 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc%9]) with mapi id 15.20.4975.011; Tue, 8 Feb 2022
 11:37:50 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <sakari.ailus@linux.intel.com>, <laurent.pinchart@ideasonboard.com>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH 1/1] microchip-csi2dc: Remove VC support for now
Thread-Topic: [PATCH 1/1] microchip-csi2dc: Remove VC support for now
Thread-Index: AQHYGErW4A/BdhOeLUW3uTV7RDBBc6yJJBKAgAAvKoCAADP3gIAAAtyAgAAF8wA=
Date:   Tue, 8 Feb 2022 11:37:50 +0000
Message-ID: <ff52ab62-355e-da59-b4b6-b85dca24b4b5@microchip.com>
References: <20220202153609.240387-1-sakari.ailus@linux.intel.com>
 <20220208061129.158ba126@sal.lan>
 <ed240352-0588-d963-2b0a-7b65280e96b0@microchip.com>
 <YgJOqb06gmNhFw6X@pendragon.ideasonboard.com>
 <YgJRD1Lt2QedgL7+@paasikivi.fi.intel.com>
In-Reply-To: <YgJRD1Lt2QedgL7+@paasikivi.fi.intel.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 470d6a3b-5eab-4d4a-ebdf-08d9eaf77002
x-ms-traffictypediagnostic: BL3PR11MB5683:EE_
x-microsoft-antispam-prvs: <BL3PR11MB56839C6A31D81EBEC29C8502E82D9@BL3PR11MB5683.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xmJQzWrWAdzlR0TOJfsYp7AhA5h/QSDRFqcjz+5qulUmkeiOOkDr/92YUkoUDPm1ejFzb1Nzl5m2/+qiBWEL2jgvYXnaZ87dIv2Cyuw4fSV4KTj9IO9090yu0ysuEDw7AyY/2Xu8TyjfzVdhaGvLOBtz6t4W3uXQmKqO8tIhPt1fFiZvvV8SNQzMf7T3rhLOxWspyUmjSCUfGOOnjoWmuFA75A/7n0MQrY14TGbFGq994BRaVcdmUr6EESOhQgZJneskrw2pzKR1S9PVyHFOEEwrA3NYF50UYsH9zUAfIju9FgeMC015apER431EWk9kTbaAuWrWNv4MbJ5ilv0oeGHl4Mz5i58wq/KWNBFKS97gmXBD631RXZD4BsqQthvNgkpP+88ULEQzg29KouwGC0+yH2xxXNSQXpg/Mst5sCHEFGtFBXZOQHQgXJSF4Xk7OZDrr4Mk+bfIrF+R6G+4ZdOwXRsuEZ4ovLy4/bQA6I21H8TaRCyf1xX5hgtH/AOg6Az+cJr+YPIucR0kM0Zc3M0JY4390BcHnbIWlOsk2CdZ33htuDiK3BwF5hMESRuzo1T8/yr+GfcdM6R00FWxH44TaXu6HGiiSXYBQUpdBjpb2sIcCDqWt7Sh7XcUcV+Bvza3tASW7hp/SeN7Y3jD5eKjdYFc8Fa/l/0++8b6vr4CrILwYs/LFDlQNm5iVQLLDq+BbCc6vG7qJPS7qVP6CpMUm4YZnKCyEZoeZheBT9+lxE40zNPWyrGH+MylslPfeOL6saQCDWkj2VVjKTbXbA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5384.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(122000001)(508600001)(31686004)(6486002)(38100700002)(2616005)(53546011)(5660300002)(38070700005)(83380400001)(64756008)(66946007)(76116006)(66446008)(8676002)(4326008)(91956017)(8936002)(66556008)(31696002)(110136005)(54906003)(186003)(66476007)(71200400001)(316002)(6506007)(2906002)(86362001)(26005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0dPdWt6TTMvaEdkeUxoNmdoQjhoVTQyOFZBNUtGMTVBOVZjZUF3SzJrV3d5?=
 =?utf-8?B?R0tmK01HUjhTazNnbVFBWHhlczIyaGdiWDd3Z1RNaUFmWlZnZXF1VkFrK2dv?=
 =?utf-8?B?RTNCQ1JJUWpVZlUwTFdudENNdWNOUk5rZ3I1NklGL2FkOGdvb0pVNnpOS1Jw?=
 =?utf-8?B?clBJQ1ZLbWFzNlBnamVUYmo1QUc1dFRBNGdFSzNiZjQveEMrK2hUdWpWZ0N0?=
 =?utf-8?B?bkg3R1IwYVVyU2hSSlcwa0NGOTdzdGd5aC9qUnhBa0VIaWxzVUZYM3poL0NE?=
 =?utf-8?B?a3FEYlU4ZFdjMm5GcjEyejFlV212NHhldHlhd1FEVno4akh4Q25DWU1wSWlq?=
 =?utf-8?B?OFcyVW5ZcmxZZ1grTHFtdmFPL3RlazZtemNJU0J6MDZOSXV3cFM1dkpQZ29H?=
 =?utf-8?B?OWNRQjBKUjUzR3M4cjd1MVNMK3NldjN6WGp2cnNwdDZYVG1tN1J5TmdoTkEy?=
 =?utf-8?B?QVRXdFZRdWVvdzNvN0h1cjk3bHNxdWs4ZTFPSW5rcW80YjMwcUFzY2pnalVH?=
 =?utf-8?B?bm9VQXE3UElNU0pabjhmUG1mVytQUmNxVDc0bjZoV1RhNjhWaEgwdm5peDcx?=
 =?utf-8?B?TENjWEU0eGpiR3Y0bjZYYkNxSkV6a3k1N09NOXIwandrQUI1ZGRSdFNpUGJn?=
 =?utf-8?B?bCtWUlNicC9jdnRUL0hxOXpGc1Z0UnpuZTRDc1hMdVNCNDFNcERxOFpDUUVH?=
 =?utf-8?B?REJCUGtvSkd3dWxaNG4vT1NWVFJNYmNNQXI1UzNpRlVwTFNxLy9FZ1dHYlpF?=
 =?utf-8?B?VUNMUmR2QVVYTjZUbEJNNnVkdjBySUY3dEY0VndKMGlLMllVSDVDbTAxL2JY?=
 =?utf-8?B?Z2hwM2RDd1NTTVpVQ3VrRzRXaW85eWowM20rTFRkYW9GUzdBTm1kbGxtTGFa?=
 =?utf-8?B?VzI4VGRoYmQ0RDVsWWVYcUhZZlcrenQrY3BOOHcxSG1aL2dWUk5YK2FCa0wr?=
 =?utf-8?B?UnF1cmZJb1l0NHhVZjlCTlVjT0pjTEVBV0toOHhSbi9uU1EzTWJ3aHMrTVVm?=
 =?utf-8?B?VmNoTm1LbGpvQno4VTlsZmVWOUNKRFRrMWZTWFZNYVQ3cklrVkg1VkR4RnBl?=
 =?utf-8?B?WWlYd1lsNFQ1WDZkRHJETGZWMmo2UWhyWXJ5SWFwYmVrcy9ub2lpSTFGd1NY?=
 =?utf-8?B?YlBwYndadWZJeWVQcVRJcDFJbldOVXRqU0g2SkRLQU53ZDdQb0pWNCtBV1VQ?=
 =?utf-8?B?MklwN0NtZEhaZlhNVk5iblhsQ1RrMmtkbGJaREpTRWljYWlMZStHVmpLdlJr?=
 =?utf-8?B?N0FscVNGUTZWK0RWWU1NZzRLTWpMVkxvcFJ1L1VRNmt1dGNFL2FXZHRrcmNs?=
 =?utf-8?B?eUx2blJXZ243RURFdTRNY2h3eHRTcnloM2hQcGpFc0FIa2VRQUlsckh4V2Nv?=
 =?utf-8?B?N29URy9xZzhqamRwY2N3YUhQZjlpTWV3NThvbjRKak5nZER3dEpXQVV6MlI0?=
 =?utf-8?B?TEpBN3lyMzhFRzJHRjM2N2xudmZsNXloeG9DWWIwS1I4dkVXMTlWNkRCbHhK?=
 =?utf-8?B?K1lDZ2ZQUUw2aFUvSTVQTC9neVUzTWc2aGtUaThzbjJZVVlvUWM0SlBPaW5W?=
 =?utf-8?B?K2FCUEJyZFdvekhsalVRdEh6dWxXWGQrdlowOTVkeWhuYjlVRGM4OHJYYzFy?=
 =?utf-8?B?bitvNUNwZ1NZTjdZMmFjOHczalVEWTZVeGJyVjF2bC9ocngwdEVhTTZSVFRh?=
 =?utf-8?B?a3MrQ0xkaHlVY0p4RjBLSHdYbUFoZXlPeTZkZ0U4a0J3ODBiVGlEY3BxSjVD?=
 =?utf-8?B?VjR5VEJFR3B2MWQvRGxlL0RTVXBHWXhmcDdFZm9ZZjNhQURnZ3Q5OEY4cjVY?=
 =?utf-8?B?R0Jsa1dIOVhYWlpLbXZyU0VRMTVmQUppNGhUZXBvWUVraVJMRHlzdHhOQXgx?=
 =?utf-8?B?S0oweVUrWU8vM3ZHa3ZBMERCVlIzQWRoQ3RmYndDK0hsTHNwWFJzNzNQbUdx?=
 =?utf-8?B?eHFua2Y3OUxNVXlobjdTK1FyZGFkNUJwSEZ1UU9FajFPc2ZOemdvVHE0bW1C?=
 =?utf-8?B?NFNCY0crVTAwOWNvS0hLdXFXUTVGL01zcWU1L0VuTi9LZFJlNjZ4TXZGdjdJ?=
 =?utf-8?B?MlB6b015dzJ1SWhjZWRDV2FjWkJJTzZYOEF6VjB6SFVGMTFRUGpYS0dCZklt?=
 =?utf-8?B?Y3hJc2E0VlRKcU1OYldmRnBGTzdQaVFRMnpESC81bmRPbHVSTHgwbnZnUGZH?=
 =?utf-8?B?L2xydVV5OFZOcFdjNzREMGNQWEd1M0JFU2NMcEhlTXQrbGgxVXhpQVFTSWRH?=
 =?utf-8?B?NE1nUHJGRG1aQ21iVW5DYzYySEx3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <43005D7A3CC4074F84E975A9FC990158@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 470d6a3b-5eab-4d4a-ebdf-08d9eaf77002
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 11:37:50.6374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D0h9/fZh14XS+Ph9svnJrv6ZmDUt73sJKGeL/R0T6/tYqiJFH9U1hVWsYmFzQrGqLflKkKjPlE3H21V6nbm0QcoQgfgix2PM1c5PAXQ2BQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB5683
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMi84LzIyIDE6MTYgUE0sIFNha2FyaSBBaWx1cyB3cm90ZToNCj4gSGVsbG8gZXZlcnlvbmUs
DQo+IA0KPiBPbiBUdWUsIEZlYiAwOCwgMjAyMiBhdCAwMTowNjoxN1BNICswMjAwLCBMYXVyZW50
IFBpbmNoYXJ0IHdyb3RlOg0KPj4+IE15IG9waW5pb24gaXMgdGhhdCBpZiB3ZSB3YW50IHRvIHJl
cGxhY2Ugc29tZXRoaW5nIGV4aXN0aW5nIHdpdGggYSBuZXcNCj4+PiBBUEkgb3Igc29tZXRoaW5n
IGVsc2UsIHdlIHNob3VsZCBmaXJzdCBhZGQgdGhlIG5ldyBzdXBwb3J0LCBibG9jayBhbnkNCj4+
PiBuZXcgYWRvcHRlcnMgZm9yIHRoZSBvbGQgQVBJIHN1Y2ggdGhhdCBldmVyeW9uZSB1c2VzIHRo
ZSBuZXcgQVBJLCBhbmQNCj4+PiBvbmx5IGFmdGVyIHRoYXQgY29udmVydCB0aGUgb2xkIEFQSSBj
bGllbnRzIHRvIHRoZSBuZXcgQVBJLg0KPj4+IFNvICdjYW4gYmUgcmVpbnRyb2R1Y2VkIGxhdGVy
IG9uJyBpcyBub3Qgb2theS4gV2UgY2FuJ3QgcmVtb3ZlIHRoaW5ncyBpbg0KPj4+IHRoZSBob3Bl
IHRoYXQgaXQgd291bGQgYmUgcmVpbnRyb2R1Y2VkIGxhdGVyLiBKdXN0IG15IHBlcnNvbmFsIHRh
a2Ugb24NCj4+PiB0aGlzLCBmZWVsIGZyZWUgdG8gaGF2ZSBhIGRpZmZlcmVudCBvcGluaW9uLg0K
Pj4NCj4+IFdoZW4gcmVncmVzc2lvbnMgYXJlIGludHJvZHVjZWQgdGhpcyBtYWtlcyBzZW5zZSwg
YnV0IGhlcmUgd2UncmUNCj4+IGRyb3BwaW5nIGEgZmVhdHVyZSB0aGF0IGlzbid0IHVzZWQgYXMg
bm8ga2VybmVsIGRyaXZlciBzZWxlY3RzIGEgVkMNCj4+IGRpZmZlcmVudCB0aGFuIDAuDQo+IA0K
PiBJJ2QgbGlrZSB0byBhZGQgdGhhdCB0aGUgcHVycG9zZSBvZiB2aXJ0dWFsIGNoYW5uZWxzIGlu
IENTSS0yIGlzIHRvIGJlIGFibGUNCj4gdG8gdHJhbnNwb3J0IG11bHRpcGxlIGxvZ2ljYWxseSBz
ZXBhcmF0ZSBzdHJlYW1zIG92ZXIgYSBzaW5nbGUgbGluay4gVGhhdA0KPiBoYXMgbmV2ZXIgYmVl
biBzdXBwb3J0ZWQgaW4gVjRMMiBzbyB0aGVzZSBmbGFncyBoYXZlIGJlZW4gdW51c2FibGUgdG8g
YmVnaW4NCj4gd2l0aC4NCj4gDQo+IFRoZSBzdHJlYW1zIHNldCBhIGxvdCBvZiBwZW9wbGUgaGF2
ZSBiZWVuIHdvcmtpbmcgb24gb24gdGhlaXIgdHVybiBpcyB0aGUNCj4gd2F5IHRvIHN1cHBvcnQg
dmlydHVhbCBjaGFubmVscyAoYXMgd2VsbCBhcyBvdGhlciBmZWF0dXJlcyBzdWNoIGFzIGRhdGEN
Cj4gdHlwZXMpLCBhbmQgaXQgZG9lcyBub3QgaW52b2x2ZSB1c2luZyBtYnVzIGZsYWdzIChhcyB0
aGUgdmlydHVhbCBjaGFubmVsDQo+IGlzbid0IGJvdW5kIHRvIHRoZSBidXMpLg0KPiANCj4gVGhl
IGludGVudCB3YXMgdG8gY2MgdGhlIHBhdGNoIHRvIEV1Z2VuIGJ1dCBpdCBzZWVtcyBteSBnaXRj
b25maWcgcHJldmVudGVkDQo+IHRoYXQuDQoNCkhlbGxvIFNha2FyaSwNCg0KSSBhcHByZWNpYXRl
IHlvdSB0YWtpbmcgdGltZSB0byBleHBsYWluIHRoaXMgYW5kIHRoZSBpbnRlbnQgdG8gY2MgbWUg
b24gDQp0aGUgcGF0Y2guDQoNClRoYW5rcywNCkV1Z2VuDQo+IA0KPiAtLQ0KPiBLaW5kIHJlZ2Fy
ZHMsDQo+IA0KPiBTYWthcmkgQWlsdXMNCj4gDQoNCg==
