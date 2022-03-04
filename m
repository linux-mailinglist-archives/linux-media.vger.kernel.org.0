Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F364E4CD04D
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 09:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231540AbiCDIm0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 03:42:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232266AbiCDImY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 03:42:24 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21DEE22BDA
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 00:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646383296; x=1677919296;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dXJbxeAv0AgtEVPigKXxJ9Vwtr8tpDlW6soj8G7mayI=;
  b=gW76VU3rHqkC8eT4DWJmNWK/lJ3LmZjEsPZ4vEsF7Tf9gqmua7jRSPmJ
   /HGMT4d0Z2pDY7qXEIQnyTghyzpml64ZMKeINDIxpqlL3cHS1iqIBSPoE
   S/NcuX1NfnZJpoUOxxC9fSmiB82WHXUu74WaFGDzFqeixnMxs0aEyVUia
   BI7FZVAHhLsz/dQm3ivT4X0UfC6/5brHi8py2OGiJKjX4Fkm6EFOXUWiD
   8gm1b5gdTrqvJe+H3CJn+9o2I2Di9/B4FhTb6/SYheLKZNR0S1NffaZAa
   0u5xbI54ntyONlGgAVhc+zlf/CGV0rXnXiOG1o9+oS8Bads7MJlznsnQb
   A==;
X-IronPort-AV: E=Sophos;i="5.90,154,1643698800"; 
   d="scan'208";a="87809686"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Mar 2022 01:41:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 4 Mar 2022 01:41:34 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 4 Mar 2022 01:41:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Odu6JHHDykGw7XIpoQWy0t3AHl7gPfrJ551JEsgpBFFiCAkHoQsnH6KV23Xu7ciGmkyG2QPtXFmvDV5kBowuixXBUyzX6oR4q5P3lJjT2PB2Ijp9Ee5BfTP/ook+qjhKkdUHPDxfN9+pwUX8LuQ+hZh8Rjtf6vvM5EyLAgA/rEYddQ0a25bMhdVCAvDgSceJpnbBsijrcSD1UVid5XV7I2RGH4e7wUpFkS9N94lO5WJjA+iSZQKiQVXS5OzioyBO3AkBAjsPa0Cfes9B2M+1a+qOO0hTJaMOG6OIT3vFRcFwmZ14Akp35v+3NOlcic4EYBWufByK5NXKyYhl/pFrWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXJbxeAv0AgtEVPigKXxJ9Vwtr8tpDlW6soj8G7mayI=;
 b=AGCEmo8yr/KtA114+5Kxgo8bKBE5PP1Li71/LcjfAJM+WwRLhjdJGNkmJar1DtlHLyD81hGtUrRXohxhibetz04JSahfqJVWvi6aOmzACA0+LwksmKJ/V5Fq2TmUFWaHoa+YjO3PObAFmTMRxXre62jMYT8Mgj1AhPtiMnhUbvtXH6emJpRV1eWmYDV4knR2DFe/VuXaMDJmFyeAElM+AQl0VpAfKzdWCzfYvgl5wgsBnVFyC5YGoWuaTM5UPzmLEoies8M07XO0L1aKC8EbAptu/aM3K3DU4/P1PJyPC/+pNRFKyPqvREVLWd2dtpsYC0YnSr5UGTAFlu6e3+w4ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXJbxeAv0AgtEVPigKXxJ9Vwtr8tpDlW6soj8G7mayI=;
 b=TL+T/yvFuXd/Ix7SaVhDr30Zi/a9EsCakNgNnYgVSLztPK0EOa7+/4ql8fZawb/oRff+hDGYnYfce1M+XWL++d94MmDCp+oeftpbI35dlmsOI6ddZC1NJek6AMi17Q9v+1JebFEHEKy9rs5CaqAKQEFU6+9jM3Wd45JBsGoaxwc=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by DM6PR11MB4153.namprd11.prod.outlook.com (2603:10b6:5:19f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Fri, 4 Mar
 2022 08:41:24 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc%9]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 08:41:23 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <sakari.ailus@iki.fi>, <jacopo@jmondi.org>
CC:     <slongerbeam@gmail.com>, <laurent.pinchart@ideasonboard.com>,
        <hverkuil-cisco@xs4all.nl>, <mirela.rabulea@nxp.com>,
        <xavier.roumegue@oss.nxp.com>, <tomi.valkeinen@ideasonboard.com>,
        <hugues.fruchet@st.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <aford173@gmail.com>, <festevam@gmail.com>, <jbrunet@baylibre.com>,
        <paul.elder@ideasonboard.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v5 00/27] media: ov5640: Rework the clock tree programming
 for MIPI
Thread-Topic: [PATCH v5 00/27] media: ov5640: Rework the clock tree
 programming for MIPI
Thread-Index: AQHYKWMAbLA64jWf80q97eqn4al/n6yuZZaAgACO44A=
Date:   Fri, 4 Mar 2022 08:41:23 +0000
Message-ID: <6462a1b5-3a8d-7d6f-d8ae-85a751805866@microchip.com>
References: <20220224094313.233347-1-jacopo@jmondi.org>
 <YiFY1UGvVHTEeVVu@valkosipuli.retiisi.eu>
In-Reply-To: <YiFY1UGvVHTEeVVu@valkosipuli.retiisi.eu>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19156976-93b3-435c-6d0d-08d9fdbac3b2
x-ms-traffictypediagnostic: DM6PR11MB4153:EE_
x-microsoft-antispam-prvs: <DM6PR11MB4153B1120DD6ED17376F5818E8059@DM6PR11MB4153.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tHU0awOi1eNdRZwY1F982qlya89quzoO87Cg7pEqxMVEK6hA3rgVuNl1NL2r5+Yrrz57sgbTbXOaWxqFIfJoAKNlRF9l5B2TQFtYJ0JWYg6TbTlP0jZDz1SDCr20wuBCt5z9E/QcKSnvSATs08v5EXnQR2KVtKbPx551XdfzOja9wOAc7pXmIEVUa1B/tkkLQhJnbbJgWnrXrA+ka8ZOaDUfx4vcXoaCYDmLON3Lp03uRatYm0X/Scl/Mt8W1zyCoQEMBLQJFrPfOylVB5d7KfSk36y4WA3RLKPJEOYBiYQp8spkypRgqrNjBs+8PL12FWbDho6E6nOQWID36QBWwgEy3Uoqndarqsxjam1pCiwdt65jiyx982wMa0V18qSw6EP2SoMrwDokwHC77VsvU0c6tY3BA5lTOuxiyJKYQHwupqqUCf/Sh/2UM084BOo955q5l+MVXCUEL+1pTi429u59Puyb8SoNRx22XroShV1rxVTxEZtB0Bno0YIbjhZz4ar1bxy27XX2+9Ju6uK5qWe76anrgsz1bWOd9Zw4g2ntRE3rfxQn8ETcs8YoHkuqvdOyWLJMDPpWEUjn73kmEOVUvEjyAXB8PxbbG91Araf7K8yEWt3HQXHNrpq+OCTfXf6h9tRweacILHBBAI0mRb/W2jwVhxT4Tw3FfiYrC5xdu7oLtV6D3lsiMvfedUnrSw18KXg6YcwtFWRKjvVm59AzQJeBg0yT4fY9pXjDtzOqzeAI5tCNJugHOdYgNexeKulgE/jB4EyR+S+IG/0zjOMU9Gphqk9Q6hSeIvlVwQ1jM3CvhnwwkTGcvJnRCnE7bAbw5SUZ57asWPDvYrLzhNgved1UPyYq0Znadzkr6/o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5384.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(64756008)(86362001)(31696002)(316002)(83380400001)(4326008)(71200400001)(91956017)(66476007)(66556008)(66946007)(76116006)(122000001)(66446008)(8676002)(508600001)(6486002)(966005)(38070700005)(54906003)(110136005)(53546011)(6506007)(38100700002)(6512007)(8936002)(2616005)(5660300002)(186003)(7416002)(2906002)(31686004)(36756003)(4744005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUVvaW0xVEhpUk84NnUrVzBJSTE2bTJkQ0RTaWV2dnFJd0QvNGN0SFFrRUF4?=
 =?utf-8?B?aGhpZVBhRHNTeXVZUndXL0tOdXZzc3FJbklzWEwrNzQ2S2N4RXB5VWtXODhK?=
 =?utf-8?B?aVA0K1l1L2tTeVhXVm5JSzZUVVJuL3FzTlMxRFNpOXhBcGg3eW5NSngrbG03?=
 =?utf-8?B?cVhueHowbjJqU0RmUkZpS25adi9UUlYwalVvMmFGMnJiSi9TV2puN1M2Y0hi?=
 =?utf-8?B?KzR0QmlGcVBjUXdXWncwTE9XU1JhWTBrZDhQQnhIaUM1MmlGQVhnaDB5eUg2?=
 =?utf-8?B?SnNYaEQ0ZkFCWEYyZlVCNDB1OXp3eVJRSGhFSHIrSmI0UGQxbHE1K094bjFi?=
 =?utf-8?B?S1JiSEU2YXZkcUpnV01IUEdXVk9iNDBYWFVtUXdQbUpMR0ZlYUY0V0lMYkVs?=
 =?utf-8?B?QStPTTdjWjl4L0tibUFsS0NsMStFK3BjQ3NmNDVsd2dFUCtoeEUvZXZBOUhF?=
 =?utf-8?B?K3JaZVZacUVSU2d4OENnczUxUDIyVS9xRk13NFFnNzFDamo1SytmTnluYVJB?=
 =?utf-8?B?OVdadXEvbU1Lc01rK3Q1UjJUL3lzdGpWc3ZIZ3I2My95ZnB5OFZsWFhkZ0Zw?=
 =?utf-8?B?VDczZWhFdGR6T2kwdjdEZ2FGWTBkemNoNjMzcGIyWmNaT2VKaGl5ZlkyUWUz?=
 =?utf-8?B?VU5SVUtVd2hWbUFPU2tMQkxjTDhwSEtRbWZ0eTd3amxkOGJFU2d5SWJZUlNm?=
 =?utf-8?B?L1c5QkZXbi9rbzR2S1lzeFNmVldadUhXLzJxcHlyenJsdnQrRnMra2p1M0xE?=
 =?utf-8?B?Tnd2aU5JZG1YTEFHYkd6eXNCQ0R0K2FtOUFKYTUwc0lsbUxBSjMyNEhYempp?=
 =?utf-8?B?R1BJbFQzRkxsNTRpQzlMRkpQNXhHTFVmd1M2VEdqMU5BTmMvVWdVamJNaHFZ?=
 =?utf-8?B?RXJWUWY5K0pNS215SGVxNmFNOUlXb0RzaVZjYTd2Y3RLaVMyaWY1bkhFaGxp?=
 =?utf-8?B?L0ZKcW5NVTl2dFh1d0NyaVBZTDdHakw1akRqQWlzb1hqTjhXejRIY1ptVWhI?=
 =?utf-8?B?OGIyRGpGaFRzSTNtMkpoc0NyU1JjWXU5N3RWZG5tWkswY0lnVk1haE9ieDY1?=
 =?utf-8?B?Skp5M1BOaVFQZmRwSm40dkNRSkxHYmFoZ3JmbURSY3RNdlo0Ky9Qcmo3U3Ra?=
 =?utf-8?B?RG5XZFYwb0hFVVE2L1pPUTNJYW9sTjYzZjM5NjlaRUpOYUVSWHI3MStGRncz?=
 =?utf-8?B?T0paYWI0bTBvVUtTYTRHQnBvUExJbDI0Y1pXWVptWlQwb24xQnNZOVMwOXJU?=
 =?utf-8?B?UE1XL01hVUxrNlJoRUMwWWpYRG95WWlVZEUrbkFXTU15Um9lWDRONHRBQnpE?=
 =?utf-8?B?K2hYdTN5ckt6Y3pJT004VEl6V1c3Q09wRHhGV3B4RkZ4ZjlxYUpESUp2dGlo?=
 =?utf-8?B?VmI3Z0c5MHcxaG1ha2ZwWXhBVHliT3lOZnEzWHl3L1VnUXhiQzJ0aHhEM0VR?=
 =?utf-8?B?NDNYOVpyWkdETXRwdVppcGdoM1lKWmJPQXBMTXVHQnY3OGRhZnd1aFVSSzhi?=
 =?utf-8?B?Tlc2Zmw5ZEFBMTBwbWJWM1Q0VDhEWGtOREU4YkFtcnFzdjExQzdsSmtocm4x?=
 =?utf-8?B?Tlg1cWs3d3ltZTk4MHdxQm5DOGpXYlZwRUhPM0Rxem4zQzAxeDZ1REJuVHQ1?=
 =?utf-8?B?aGNyV3BXemZwc0tzeVNpYWgxVnBLalN0RjAyamcrK3crWDY3MGVtdWVPMzI0?=
 =?utf-8?B?anp4dVhyUmlMSTBySXkwNnB2NGJiYXhCUVNKbFdYeXdld3JpTlJncHg1NDVl?=
 =?utf-8?B?TmtwOXZZSGM2dHFPb1o5MlIycDJIRGFHWEpEdGc2cmwyV2krVmVUSG5tUlNt?=
 =?utf-8?B?U2Q3SXFEaTU4QWRFc2kzbU1mNklLS1l1TS91OEpHWVFCKy9NSXR4UlhuNWsv?=
 =?utf-8?B?TW5zckExeVptNmp0VVhsVEVjRzRhNDFwcWt5V0I5YkZ6OHRGRDZtdFQ3Rnpj?=
 =?utf-8?B?VTF5dlhQdm0wSnpxTmNzT05LR2RUUVR2SlFsMmtTUUtyM2g4S1QvUERhM0JH?=
 =?utf-8?B?WkhyMEpmTUlrejR3S1Y3MytENEJQN0VWU3hBRzl2SmMrWEhMNE0zR21PWmxP?=
 =?utf-8?B?Ujhjd3V5T0x4MXFDNU8rOE9sOGpOM2JVT09Zb0greHByVjQwUlA3ckI1N1lC?=
 =?utf-8?B?ZkdpUE0xVUVHcDd0aEZ4aFNuVGtoOTRzRG5mYVpFaEd1Z09tVTkyalVSK3ZG?=
 =?utf-8?B?R0lYaTMxbXVsY1NlQVN0Z1lOUEJCQ0J1U1RHeC8zeUcraWZFZGxnMTA4Q1ZG?=
 =?utf-8?B?bFl1SGw1Kzk4SmdDZ2o2S3JIZkVRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77EB3DDA930F7049BB43D3B125B0EAA8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19156976-93b3-435c-6d0d-08d9fdbac3b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 08:41:23.7693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PkDdoJdgeaWUu6nQKTwu4011Ynkq4XPLfcWHgQjeMkwBQVHv+aIUij1V0bPSKU7enHcQHxRdC/SSFWBm+gIbh7KGkPrmWJZnTj+MkNw0mys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4153
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_PERMERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMy80LzIyIDI6MDkgQU0sIFNha2FyaSBBaWx1cyB3cm90ZToNCg0KPiBIZWxsbyBmb2xrcywN
Cj4gDQo+IE9uIFRodSwgRmViIDI0LCAyMDIyIGF0IDEwOjQyOjQ2QU0gKzAxMDAsIEphY29wbyBN
b25kaSB3cm90ZToNCj4+IEEgYnJhbmNoIGZvciB0ZXN0aW5nIGJhc2VkIG9uIHRoZSBtb3N0IHJl
Y2VudCBtZWRpYS1tYXN0ZXIgaXMgYXZhaWxhYmxlIGF0DQo+PiBodHRwczovL2dpdC5zci5odC9+
am1vbmRpXy9saW51eCAjam1vbmRpL21lZGlhLW1hc3Rlci9vdjU2NDAtdjUNCj4gDQo+IFRoZSBz
ZXQgaGFzIGJlZW4gYXJvdW5kIGZvciBxdWl0ZSBzb21lIHRpbWUgd2l0aG91dCB0YW5naWJsZSBm
dW5jdGlvbmFsDQo+IGNoYW5nZXMsIHBsZWFzZSBkbyBsZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBj
b25jZXJucyBtZXJnaW5nIGl0Lg0KPiANCj4gVGhhbmtzLg0KPiANCj4gLS0NCj4gU2FrYXJpIEFp
bHVzDQo+IA0KDQoNCkhlbGxvIFNha2FyaSwgSmFjb3BvLA0KDQpJIHJldGVzdGVkIHRoaXMgc2Vy
aWVzIGFuZCBvbiBteSBzaWRlLCB0aGUgcmVncmVzc2lvbiBpbiB2ZXJzaW9uIDMgaXMgDQpnb25l
LCBJIGNhbiBjYXB0dXJlIGltYWdlcyBmaW5lIG5vdyBZVVlWQDEyODB4NzIwIC4NCkkgYWxzbyBy
ZXRlc3RlZCAxOTIweDEwODAgaW4gUkFXLCBhbmQgaXQgd29ya3MgZmluZS4NCg0KWW91IGNhbiBh
ZGQgbXkgOg0KVGVzdGVkLWJ5OiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1pY3JvY2hp
cC5jb20+DQoNCkkgYW0gbm90IHN1cmUgaWYgeW91IGhhdmUgdG8gYWRkIGl0IHRvIHRoZSB3aG9s
ZSBzZXJpZXMsIGJlY2F1c2UgSSBvbmx5IA0KdGVzdGVkIHBhcmFsbGVsIGludGVyZmFjZSB3aXRo
IGF0bWVsIElTQyBjb250cm9sbGVyIG9uIHNhbWE1ZDJfeHBsYWluZWQuDQpVcCB0byB5b3VyIGp1
ZGdtZW50IHRvIGFkZCBpdCB0byB0aGUgcGF0Y2hlcyB0aGF0IGltcGFjdCB0aGUgcGFyYWxsZWwg
DQppbnRlcmZhY2UuDQoNClRoYW5rcyBhZ2FpbiBKYWNvcG8gZm9yIGltcHJvdmluZyB0aGUgc3Vw
cG9ydCBmb3IgdGhpcyBzZW5zb3IuDQoNCkV1Z2VuDQo=
