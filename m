Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25AB373D94E
	for <lists+linux-media@lfdr.de>; Mon, 26 Jun 2023 10:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjFZINc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jun 2023 04:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbjFZIN2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jun 2023 04:13:28 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2049.outbound.protection.outlook.com [40.107.8.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21DD5E7F;
        Mon, 26 Jun 2023 01:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTpfFGwGszIkxJBKfNCFlcOI3x/8Aq9a7HXWjOwJj3jVCVpaDbR6J1FPJkV6kzX8fIXo/z92JJELUk+vU2RiBXXtmcWIeKC6tz6OoeYo1qt7xNoZ1YgSEoehVrUOvs0E8fauxznag4diA+YfvsfnM3JMCnlO1UokhlVTNJh8WSiKFkxwBkwiqGkfZsq9WqE+FKXsTUPOCb8bOqoFH9gJfK3u8SXYJ14zJz0Gxc80UW+LSIzM7RWTUTW2QAy0NhOsV9c0neVo/1Sf2YAh7+Hqr2y6/H00T6W6WuWTOrMqyj42ae90pvcwDsrR4AOOG6E6QY+g0d0JKk1IjIWdAF4f0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sstcMpyNOPkCKU107g5mWk5/HL8yra1HcWLb9yAxxw=;
 b=fndBCsMfEibOZ+rjZa23TKJzGxvPMTPQ5+2i3sfO24Fq5ykUJqdJNdNR+bldEfxtn9ewotiWhOkYI1LKZhOElM8gHl1yjWxsZ59j+Ad+A3K2Ty8JHwyvB62HB2VO8D4HwvDdoMQRwR8VgYMS70gmDPS1GZb/5PRQKaCiD87fxPXu6ylEN2Hl50MPKAS1sRixxN6c+1cd1ahcUKL9RgeKY7W6yYIFsYUZftbwJJ6Ci2NMkNXD6cLiaWM1gHv7mEWm15Pw90+b9X1+/CJW4Iigm2ik4HJPMXw3xANwpeP29cC/xsUYOAr8ObHOm9F9qE6jbHoE6Htut+yQMRxn50sCMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sstcMpyNOPkCKU107g5mWk5/HL8yra1HcWLb9yAxxw=;
 b=SDZ2tC1V0RH8BKBpPh9mE47xOnH0XkaiB+XGnqqcTMJfygCUnB4eeRfbwXvXK6DkYwLvnk1l9GHg6RvzrmZ/jfJ3ybw+dYZqH6qAlHYVQCgGKfHMCeuxRSMMbxaYm0KandARTuBtiKgY00YBoYSvNbnBxwftmidPqTwnUAHUR5s=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by DU2PR04MB8837.eurprd04.prod.outlook.com (2603:10a6:10:2e0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 08:13:12 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::79f2:2888:dbd7:ad6f]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::79f2:2888:dbd7:ad6f%7]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 08:13:12 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "ezequiel@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: RE: [EXT] [PATCH v3 10/11] media: v4l2: Add DELETE_BUF ioctl
Thread-Topic: [EXT] [PATCH v3 10/11] media: v4l2: Add DELETE_BUF ioctl
Thread-Index: AQHZpQtryt6+FQi9LEi1Ln2Ygf6Dlq+crahAgAANd4CAAAB3gIAABEpQ
Date:   Mon, 26 Jun 2023 08:13:12 +0000
Message-ID: <AM6PR04MB634118972326E61D84491DAFE726A@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <20230622131349.144160-1-benjamin.gaignard@collabora.com>
 <20230622131349.144160-11-benjamin.gaignard@collabora.com>
 <AM6PR04MB63410CCAE0686CC95DD2B8E0E726A@AM6PR04MB6341.eurprd04.prod.outlook.com>
 <d89a9237-8fb9-73a2-5caa-e14146b10065@collabora.com>
 <c0031a09-ceb3-011e-e1d7-dce91b84523f@collabora.com>
In-Reply-To: <c0031a09-ceb3-011e-e1d7-dce91b84523f@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB6341:EE_|DU2PR04MB8837:EE_
x-ms-office365-filtering-correlation-id: 2dc484dc-1ed1-40f3-ae4c-08db761d2fa3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rO/e+QTJ6uoWYXu9IWK9ni4R245n/0KR3o4lO7to6r32FesWSt4uWIaqHnssnCrW1mrHyuywchZwjvhAeg8eKyfqI5ps30IRg7/Rrrujznpl1jq6JOC4IKJ502X83VcQaGIvXebmmMOOiLVlYKl566XvJS9pBhLcdbjVKNsv8KFJTjxCNNu9vmaTbbEPrlLGSyq12EFGZmY5rbN0XXSPrc6ya2l+rvKkoW2UCciamDR7zG6Wk8HalouxVwG5YOtx2WE/53Yf6CAaur/+DqkRO/rd32S1HAjI9wLezuuRCHZWUhCnVIDLOYWhx07hlMFfr1fWEUpNNJ98bMNpsHttW0rKlpNkwlNLgeZ4PjIEQF0fshw22eHt8y6gca93do2KzPjg/qEXHeh3JAeAwcEMdA5GQkzpNNUbO233AwabLrfRiAQ4cL4WibffsBYxlJKMLTpuFwL9cHtpwxDUjoS3FePc716t1+hMkO7bVTHAarmuCKNRdldPz8ttdLezpIlnHe5IS6O1ZLoL1//2PgI1sN6v+eWjX/MUAq2Mqk0EF/E6EzSjGZv0Am9babQ3uDWk2tNoc8ptFm00x3ZZWNuiWv89HN5gmfC3Lg0DR2AzjrvCteINe0vqvGU/vuwh12bi
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199021)(8676002)(8936002)(66446008)(76116006)(55016003)(66476007)(66556008)(66946007)(41300700001)(316002)(64756008)(4326008)(6506007)(53546011)(26005)(9686003)(186003)(478600001)(54906003)(110136005)(7696005)(71200400001)(66899021)(2906002)(52536014)(5660300002)(30864003)(7416002)(44832011)(38070700005)(38100700002)(122000001)(33656002)(86362001)(66574015)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVpmOHVqbnpoWk5TeCs5ME1VVWlHbGpGSk9tK3o3cUdRZmhyUEJ3ODVqd3My?=
 =?utf-8?B?cHlJVXdiaHIweXlJRXp4UllwLytNUXNHY042a0tvVUl5ZlZ3bUQ4Rjd3QWhK?=
 =?utf-8?B?MmhRd0M0TDFnNnN1LzhEZ2FIdFFrbzhSNGRLcGwraWkzV1VQYUl0Qkg4bDVa?=
 =?utf-8?B?T3h0S2FQeEZ4NXZ2NjFSWnVtczQ4UXNVbDMzWFVnL2VxL3VYMlRONklIbWxo?=
 =?utf-8?B?ZWJGNk9wR0xISzE5T2NxcS9DMm5mSko0M3E3WGdKdS9YRDlFWFh2SDNVTm9n?=
 =?utf-8?B?SWxoN2QwVFFzVEVOaWpHQWsxM25KTkQ1cEIxbkkvMTZZYTJrdjlaT3RuU1g2?=
 =?utf-8?B?RzJNQzBsbno1VGFEd29PUkpRV2h1SmRrL256L2ZlQUZLVmhuNXFyUHpPeDNk?=
 =?utf-8?B?b2pyUWo1M09hZXVUUzlvT0xYR1l0b2l1V2VkTUFPY0JyeUtsQklMSW1ZNWdO?=
 =?utf-8?B?YmNlQm5zQnBJRUNiMi9hM1VmVVdHUzhxSU8wK1hiZmZFZVpoc1QwQWNNb3ZD?=
 =?utf-8?B?K3FGMVdNZUVsN2NMM1A1bFJkSGVmc1VWbnYwQVdjMHZIOGdpZXBMaHhQcFJq?=
 =?utf-8?B?Y2k3WmVCclRXWnVUSXU5YWRXNGZTd05NbWc3Vy93ZGErS0hROWZlaGtORUZu?=
 =?utf-8?B?MWU2M0NHL1hUWVE5Ylp4cFRKdUthbzMzb05DUkQyd1ErekphZldQb05kcXRB?=
 =?utf-8?B?YUNlaGdYTmtjcGl1eHJxZ2lBUnZyL3ZLOEZIdlBRT2J0Y25DV3M0UjBBMGkw?=
 =?utf-8?B?dVFBNW1GN2duYnNJdnQyR2FvVGFZU1lENUh5Wk41dzJJMy9iZnE4bHdWa0RB?=
 =?utf-8?B?NlVQVkUwZ1VneWFqZ0lJQStxckpNU2NSSnc0RGtxM0huRHBkS3NHUzNlWUFa?=
 =?utf-8?B?WVRpV1JqYWlJcEwySFk0UGRvTHpwMk5jT0VRMlQwa3BrWSswY3NjZnNJb1B4?=
 =?utf-8?B?b24rV1c3d2loZlNxckFYdUdsV0p1cE0rUTNGMTh3Ymg1Q0JMdkhLYUdJcUVa?=
 =?utf-8?B?UzJiU1BkYzRFMlFCeGREdFZ1YzFSa2I4Rk1oV24wOEdHdjNMc0NBSTB6OWQv?=
 =?utf-8?B?dUpRTmlSdVNIWWVuaEZ6YTB3aExETjdkSEt2cVA3UzRsR2FOQlZzbm1VdndX?=
 =?utf-8?B?czFyVmtFTVRPQStCSmZXc2pVNnpsMDBXeEtUV2Rna1RpMkFMbFN6RlhsZXlU?=
 =?utf-8?B?cUVIZGI5dWEwOEVXMjhxL1A3bmkyRGNtc2xIS0pkMUV4TWtBcyt5MVhZWFRl?=
 =?utf-8?B?OUVCOHhib1N1aFVYSUNqMmNhYnMyK3ErTDBGbjFwSkJOTWs5bllrZHhtT0Rh?=
 =?utf-8?B?elQ4L0lCM3dtcVZESEZPdXZ3SUhnREdVK1lRczdTNWJrbm1DSGt6M3gxSk8w?=
 =?utf-8?B?N0ZxajYxUUMrd09icFpJbXNqaHB4S3d4ejczK2FOSEpkd084VTh3QVh6VG5N?=
 =?utf-8?B?SndJaE55TU1kbmRoejM0QXV1QkNLN0RNdTdxNzZoc1FmMkNWU2xSZ0M5dks5?=
 =?utf-8?B?RmRNeThWcmY2MUcyeHFjRjBxcmJsRERRNnY3ZHZXNUs3SmxobzFQQUkzVTNw?=
 =?utf-8?B?MVBwaVpJMFBNQjdjc05aNlpDNWRIdmptWDcyd0NhUmt1U3FHelAyc3RPTTRs?=
 =?utf-8?B?TTJXUSt2cVlabUxURStRNGJINFFrSzFCS0RybUFZbmVZVTMwMTNNZ0RZUDNL?=
 =?utf-8?B?eTM3ZUlyYm5la2FGcmY3Lzl3d1QySWlJSHYxc3R2cnhqeUY3T0JQTWlGQVBC?=
 =?utf-8?B?eTJDS0FQMkI5TVlXWi9qcU5VcHhWV1VVdnZnOThNaXpIam5KMkdUNEJpSWt1?=
 =?utf-8?B?eHJ6TDFMbFN6ZFF2MDAydkVkU1pkNEVkNVMyWk9rMzkrbDVUN3RxUVpOazJI?=
 =?utf-8?B?OGtYWWNTQ1V3TWErRlFCYS9lZEl6NHUyaEhQd2ZGWlg3RXdXS2l3aUlGREkw?=
 =?utf-8?B?NzFpS0xtVTZyeXhwdlk4dWpQbmJmS1ZiUHpOc1VhMjdQNUFKMDNTd2UwTExB?=
 =?utf-8?B?OXFoNTd2K3JkMmVSQXhTRDd6bjZ6dE4wNzJaU3B5akdMb1crcExONzJac3cx?=
 =?utf-8?B?VjlmclEyZjFPc0lSMmp2QXpRc0FjVzlxT0t3eGJRVm9Yb2JZMDlhS0QwVnJz?=
 =?utf-8?Q?GcWc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc484dc-1ed1-40f3-ae4c-08db761d2fa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 08:13:12.7844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8HkCQ+9tV9nBQ+kaSjWfMU5NumjthobL9v4tjGiOEtaeQT1tmF6HMWlPuI4GW6Y5WYx8WhThDfwOUxR1nvxsmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8837
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PkZyb206IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBjb2xsYWJvcmEuY29t
Pg0KPlNlbnQ6IDIwMjPlubQ25pyIMjbml6UgMTU6NTANCj5UbzogTWluZyBRaWFuIDxtaW5nLnFp
YW5AbnhwLmNvbT47IG1jaGVoYWJAa2VybmVsLm9yZzsNCj50ZmlnYUBjaHJvbWl1bS5vcmc7IG0u
c3p5cHJvd3NraUBzYW1zdW5nLmNvbTsNCj5lemVxdWllbEB2YW5ndWFyZGlhc3VyLmNvbS5hcjsg
cC56YWJlbEBwZW5ndXRyb25peC5kZTsNCj5ncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgaHZl
cmt1aWwtY2lzY29AeHM0YWxsLm5sOw0KPm5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbQ0K
PkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LWFybS0NCj5rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtYXJtLQ0KPm1zbUB2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LQ0KPnN0YWdpbmdA
bGlzdHMubGludXguZGV2OyBrZXJuZWxAY29sbGFib3JhLmNvbQ0KPlN1YmplY3Q6IFJlOiBbRVhU
XSBbUEFUQ0ggdjMgMTAvMTFdIG1lZGlhOiB2NGwyOiBBZGQgREVMRVRFX0JVRiBpb2N0bA0KPg0K
PkNhdXRpb246IFRoaXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hl
biBjbGlja2luZyBsaW5rcyBvcg0KPm9wZW5pbmcgYXR0YWNobWVudHMuIFdoZW4gaW4gZG91YnQs
IHJlcG9ydCB0aGUgbWVzc2FnZSB1c2luZyB0aGUgJ1JlcG9ydA0KPnRoaXMgZW1haWwnIGJ1dHRv
bg0KPg0KPg0KPkxlIDI2LzA2LzIwMjMgw6AgMDk6NDgsIEJlbmphbWluIEdhaWduYXJkIGEgw6lj
cml0IDoNCj4+DQo+PiBMZSAyNi8wNi8yMDIzIMOgIDA5OjA4LCBNaW5nIFFpYW4gYSDDqWNyaXQg
Og0KPj4+IEhpIEJlbmphbWluLA0KPj4+DQo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+Pj4+IEZyb206IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBjb2xsYWJv
cmEuY29tPg0KPj4+PiBTZW50OiAyMDIz5bm0NuaciDIy5pelIDIxOjE0DQo+Pj4+IFRvOiBtY2hl
aGFiQGtlcm5lbC5vcmc7IHRmaWdhQGNocm9taXVtLm9yZzsNCj4+Pj4gbS5zenlwcm93c2tpQHNh
bXN1bmcuY29tOyBNaW5nIFFpYW4gPG1pbmcucWlhbkBueHAuY29tPjsNCj4+Pj4gZXplcXVpZWxA
dmFuZ3VhcmRpYXN1ci5jb20uYXI7IHAuemFiZWxAcGVuZ3V0cm9uaXguZGU7DQo+Pj4+IGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnOyBodmVya3VpbC0gY2lzY29AeHM0YWxsLm5sOw0KPj4+PiBu
aWNvbGFzLmR1ZnJlc25lQGNvbGxhYm9yYS5jb20NCj4+Pj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIu
a2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4+Pj4gbGludXgtYXJt
LQ0KPj4+PiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZzsNCj4+Pj4gbGludXgtYXJtLQ0KPj4+PiBtc21Admdlci5rZXJuZWwub3Jn
OyBsaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC0NCj4+Pj4gc3RhZ2lu
Z0BsaXN0cy5saW51eC5kZXY7IGtlcm5lbEBjb2xsYWJvcmEuY29tOyBCZW5qYW1pbiBHYWlnbmFy
ZA0KPj4+PiA8YmVuamFtaW4uZ2FpZ25hcmRAY29sbGFib3JhLmNvbT4NCj4+Pj4gU3ViamVjdDog
W0VYVF0gW1BBVENIIHYzIDEwLzExXSBtZWRpYTogdjRsMjogQWRkIERFTEVURV9CVUYgaW9jdGwN
Cj4+Pj4NCj4+Pj4gQ2F1dGlvbjogVGhpcyBpcyBhbiBleHRlcm5hbCBlbWFpbC4gUGxlYXNlIHRh
a2UgY2FyZSB3aGVuIGNsaWNraW5nDQo+Pj4+IGxpbmtzIG9yIG9wZW5pbmcgYXR0YWNobWVudHMu
IFdoZW4gaW4gZG91YnQsIHJlcG9ydCB0aGUgbWVzc2FnZQ0KPj4+PiB1c2luZyB0aGUgJ1JlcG9y
dCB0aGlzIGVtYWlsJyBidXR0b24NCj4+Pj4NCj4+Pj4NCj4+Pj4gVklESU9DX0RFTEVURV9CVUYg
aW9jdGwgYWxsb3dzIHRvIGRlbGV0ZSBhIGJ1ZmZlciBmcm9tIGEgcXVldWUuDQo+Pj4+DQo+Pj4+
IFNpZ25lZC1vZmYtYnk6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBjb2xs
YWJvcmEuY29tPg0KPj4+PiAtLS0NCj4+Pj4gLi4uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsL3Vz
ZXItZnVuYy5yc3QgICAgIHzCoCAxICsNCj4+Pj4gLi4uL21lZGlhL3Y0bC92aWRpb2MtZGVsZXRl
LWJ1Zi5yc3QgICAgICAgICAgIHwgNTEgKysrKysrKysrKysrKysrKysrKw0KPj4+PiAuLi4vbWVk
aWEvY29tbW9uL3ZpZGVvYnVmMi92aWRlb2J1ZjItY29yZS5jICAgfCAzMyArKysrKysrKysrKysN
Cj4+Pj4gLi4uL21lZGlhL2NvbW1vbi92aWRlb2J1ZjIvdmlkZW9idWYyLXY0bDIuYyAgIHzCoCA2
ICsrKw0KPj4+PiBkcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWRldi5jICAgICAgICAgICAg
fMKgIDEgKw0KPj4+PiBkcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWlvY3RsLmMgICAgICAg
ICAgfCAxMCArKysrDQo+Pj4+IGluY2x1ZGUvbWVkaWEvdjRsMi1pb2N0bC5oICAgICAgICAgICAg
ICAgICAgICB8wqAgNCArKw0KPj4+PiBpbmNsdWRlL21lZGlhL3ZpZGVvYnVmMi1jb3JlLmggICAg
ICAgICAgICAgICAgfMKgIDkgKysrKw0KPj4+PiBpbmNsdWRlL21lZGlhL3ZpZGVvYnVmMi12NGwy
LmggICAgICAgICAgICAgICAgfCAxMSArKysrDQo+Pj4+IGluY2x1ZGUvdWFwaS9saW51eC92aWRl
b2RldjIuaCAgICAgICAgICAgICAgICB8wqAgMiArDQo+Pj4+IDEwIGZpbGVzIGNoYW5nZWQsIDEy
OCBpbnNlcnRpb25zKCspDQo+Pj4+IGNyZWF0ZSBtb2RlIDEwMDY0NA0KPj4+PiBEb2N1bWVudGF0
aW9uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsL3ZpZGlvYy1kZWxldGUtDQo+Pj4+IGJ1Zi5yc3QN
Cj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRp
YS92NGwvdXNlci1mdW5jLnJzdA0KPj4+PiBiL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9t
ZWRpYS92NGwvdXNlci1mdW5jLnJzdA0KPj4+PiBpbmRleCAxNWZmMGJmN2JiZTYuLjhjNzQwMTZl
MTJmZCAxMDA2NDQNCj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21lZGlh
L3Y0bC91c2VyLWZ1bmMucnN0DQo+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFw
aS9tZWRpYS92NGwvdXNlci1mdW5jLnJzdA0KPj4+PiBAQCAtMTcsNiArMTcsNyBAQCBGdW5jdGlv
biBSZWZlcmVuY2UNCj4+Pj4gICAgICB2aWRpb2MtZGJnLWctY2hpcC1pbmZvDQo+Pj4+ICAgICAg
dmlkaW9jLWRiZy1nLXJlZ2lzdGVyDQo+Pj4+ICAgICAgdmlkaW9jLWRlY29kZXItY21kDQo+Pj4+
ICsgICAgdmlkaW9jLWRlbGV0ZS1idWYNCj4+Pj4gICAgICB2aWRpb2MtZHFldmVudA0KPj4+PiAg
ICAgIHZpZGlvYy1kdi10aW1pbmdzLWNhcA0KPj4+PiAgICAgIHZpZGlvYy1lbmNvZGVyLWNtZA0K
Pj4+PiBkaWZmIC0tZ2l0DQo+Pj4+IGEvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21lZGlh
L3Y0bC92aWRpb2MtZGVsZXRlLWJ1Zi5yc3QNCj4+Pj4gYi9Eb2N1bWVudGF0aW9uL3VzZXJzcGFj
ZS1hcGkvbWVkaWEvdjRsL3ZpZGlvYy1kZWxldGUtYnVmLnJzdA0KPj4+PiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjBlN2NlNThmOTFiYw0KPj4+PiAtLS0g
L2Rldi9udWxsDQo+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRpYS92
NGwvdmlkaW9jLWRlbGV0ZS1idWYucnN0DQo+Pj4+IEBAIC0wLDAgKzEsNTEgQEANCj4+Pj4gKy4u
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHRkRMLTEuMS1uby1pbnZhcmlhbnRzLW9yLWxhdGVy
IC4uDQo+Pj4+ICtjOm5hbWVzcGFjZTo6IFY0TA0KPj4+PiArDQo+Pj4+ICsuLiBfVklESU9DX0RF
TEVURV9CVUY6DQo+Pj4+ICsNCj4+Pj4gKyoqKioqKioqKioqKioqKioqKioqKioqKg0KPj4+PiAr
aW9jdGwgVklESU9DX0RFTEVURV9CVUYNCj4+Pj4gKyoqKioqKioqKioqKioqKioqKioqKioqKg0K
Pj4+PiArDQo+Pj4+ICtOYW1lDQo+Pj4+ICs9PT09DQo+Pj4+ICsNCj4+Pj4gK1ZJRElPQ19ERUxF
VEVfQlVGIC0gRGVsZXRlIGEgYnVmZmVyIGZyb20gYSBxdWV1ZQ0KPj4+PiArDQo+Pj4+ICtTeW5v
cHNpcw0KPj4+PiArPT09PT09PT0NCj4+Pj4gKw0KPj4+PiArLi4gYzptYWNybzo6IFZJRElPQ19E
RUxFVEVfQlVGDQo+Pj4+ICsNCj4+Pj4gK2BgaW50IGlvY3RsKGludCBmZCwgVklESU9DX0RFTEVU
RV9CVUYsIHN0cnVjdCB2NGwyX2J1ZmZlciAqYXJncClgYA0KPj4+PiArDQo+Pj4+ICtBcmd1bWVu
dHMNCj4+Pj4gKz09PT09PT09PQ0KPj4+PiArDQo+Pj4+ICtgYGZkYGANCj4+Pj4gKyAgICBGaWxl
IGRlc2NyaXB0b3IgcmV0dXJuZWQgYnkgOmM6ZnVuYzpgb3BlbigpYC4NCj4+Pj4gKw0KPj4+PiAr
YGBhcmdwYGANCj4+Pj4gKyAgICBQb2ludGVyIHRvIHN0cnVjdCA6Yzp0eXBlOmB2NGwyX2J1ZmZl
cmAuDQo+Pj4+ICsNCj4+Pj4gK0Rlc2NyaXB0aW9uDQo+Pj4+ICs9PT09PT09PT09PQ0KPj4+PiAr
DQo+Pj4+ICtBcHBsaWNhdGlvbnMgY2FuIG9wdGlvbmFsbHkgY2FsbCB0aGUgOnJlZjpgVklESU9D
X0RFTEVURV9CVUZgIGlvY3RsDQo+Pj4+ICt0byBkZWxldGUgYSBidWZmZXIgZnJvbSBhIHF1ZXVl
Lg0KPj4+PiArDQo+Pj4+ICtUaGUgc3RydWN0IDpjOnR5cGU6YHY0bDJfYnVmZmVyYCBzdHJ1Y3R1
cmUgaXMgc3BlY2lmaWVkIGluDQo+Pj4+ICs6cmVmOmBidWZmZXJgLg0KPj4+PiArDQo+Pj4+ICtS
ZXR1cm4gVmFsdWUNCj4+Pj4gKz09PT09PT09PT09PQ0KPj4+PiArDQo+Pj4+ICtPbiBzdWNjZXNz
IDAgaXMgcmV0dXJuZWQsIG9uIGVycm9yIC0xIGFuZCB0aGUgYGBlcnJub2BgIHZhcmlhYmxlIGlz
DQo+Pj4+IHNldA0KPj4+PiArYXBwcm9wcmlhdGVseS4gVGhlIGdlbmVyaWMgZXJyb3IgY29kZXMg
YXJlIGRlc2NyaWJlZCBhdCB0aGUNCj4+Pj4gKzpyZWY6YEdlbmVyaWMgRXJyb3IgQ29kZXMgPGdl
bi1lcnJvcnM+YCBjaGFwdGVyLg0KPj4+PiArDQo+Pj4+ICtFQlVTWQ0KPj4+PiArICAgIEZpbGUg
SS9PIGlzIGluIHByb2dyZXNzLg0KPj4+PiArDQo+Pj4+ICtFSU5WQUwNCj4+Pj4gKyAgICBUaGUg
YnVmZmVyIGBgaW5kZXhgYCBkb2Vzbid0IGV4aXN0IGluIHRoZSBxdWV1ZS4NCj4+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWVkaWEvY29tbW9uL3ZpZGVvYnVmMi92aWRlb2J1ZjItY29yZS5jDQo+
Pj4+IGIvZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYyL3ZpZGVvYnVmMi1jb3JlLmMNCj4+
Pj4gaW5kZXggODk5NzgzZjY3NTgwLi5hYTU0NmM5NzJjM2QgMTAwNjQ0DQo+Pj4+IC0tLSBhL2Ry
aXZlcnMvbWVkaWEvY29tbW9uL3ZpZGVvYnVmMi92aWRlb2J1ZjItY29yZS5jDQo+Pj4+ICsrKyBi
L2RyaXZlcnMvbWVkaWEvY29tbW9uL3ZpZGVvYnVmMi92aWRlb2J1ZjItY29yZS5jDQo+Pj4+IEBA
IC0xNjM3LDYgKzE2MzcsMzkgQEAgaW50IHZiMl9jb3JlX3ByZXBhcmVfYnVmKHN0cnVjdCB2YjJf
cXVldWUNCj4qcSwNCj4+Pj4gdW5zaWduZWQgaW50IGluZGV4LCB2b2lkICpwYikgIH0NCj4+Pj4g
RVhQT1JUX1NZTUJPTF9HUEwodmIyX2NvcmVfcHJlcGFyZV9idWYpOw0KPj4+Pg0KPj4+PiAraW50
IHZiMl9jb3JlX2RlbGV0ZV9idWYoc3RydWN0IHZiMl9xdWV1ZSAqcSwgdW5zaWduZWQgaW50IGlu
ZGV4KSB7DQo+Pj4+ICsgICAgICAgc3RydWN0IHZiMl9idWZmZXIgKnZiOw0KPj4+PiArDQo+Pj4+
ICsgICAgICAgdmIgPSB2YjJfZ2V0X2J1ZmZlcihxLCBpbmRleCk7DQo+Pj4+ICsgICAgICAgaWYg
KCF2Yikgew0KPj4+PiArICAgICAgICAgICAgICAgZHByaW50ayhxLCAxLCAiaW52YWxpZCBidWZm
ZXIgaW5kZXggJWRcbiIsIGluZGV4KTsNCj4+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOw0KPj4+PiArICAgICAgIH0NCj4+Pj4gKw0KPj4+PiArICAgICAgIGlmICh2Yi0+c3RhdGUg
IT0gVkIyX0JVRl9TVEFURV9ERVFVRVVFRCkgew0KPj4+PiArICAgICAgICAgICAgICAgZHByaW50
ayhxLCAxLCAiY2FuJ3QgZGVsZXRlIG5vbiBkZXF1ZXVlZCBidWZmZXINCj4+Pj4gaW5kZXggJWRc
biIsIGluZGV4KTsNCj4+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4+PiAr
ICAgICAgIH0NCj4+Pj4gKw0KPj4+PiArICAgICAgIGlmICh2Yi0+cGxhbmVzWzBdLm1lbV9wcml2
KQ0KPj4+PiArICAgICAgICAgICAgICAgY2FsbF92b2lkX3ZiX3FvcCh2YiwgYnVmX2NsZWFudXAs
IHZiKTsNCj4+Pj4gKw0KPj4+PiArICAgICAgIC8qIEZyZWUgTU1BUCBidWZmZXJzIG9yIHJlbGVh
c2UgVVNFUlBUUiBidWZmZXJzICovDQo+Pj4+ICsgICAgICAgaWYgKHEtPm1lbW9yeSA9PSBWQjJf
TUVNT1JZX01NQVApDQo+Pj4+ICsgICAgICAgICAgICAgICBfX3ZiMl9idWZfbWVtX2ZyZWUodmIp
Ow0KPj4+PiArICAgICAgIGVsc2UgaWYgKHEtPm1lbW9yeSA9PSBWQjJfTUVNT1JZX0RNQUJVRikN
Cj4+Pj4gKyAgICAgICAgICAgICAgIF9fdmIyX2J1Zl9kbWFidWZfcHV0KHZiKTsNCj4+Pj4gKyAg
ICAgICBlbHNlDQo+Pj4+ICsgICAgICAgICAgICAgICBfX3ZiMl9idWZfdXNlcnB0cl9wdXQodmIp
Ow0KPj4+PiArDQo+Pj4+ICsgICAgICAgdmIyX3F1ZXVlX3JlbW92ZV9idWZmZXIocSwgdmIpOw0K
Pj4+PiArICAgICAgIGtmcmVlKHZiKTsNCj4+PiBUaGUgbnVtX2J1ZmZlcnMgaXMgbm90IGNoYW5n
ZWQsIElzIHRoYXQgb24gcHVycG9zZT8NCj4+PiBudW1fYnVmZmVycyBkb2Vzbid0IG1lYW4gdGhl
IG51bWJlciBvZiB2YjIgYnVmZmVycywgIGJ1dCBvbmx5IGRlY2lkZXMNCj4+PiB0aGUgbWF4IGlu
ZGV4IG9mIGFsbG9jYXRlZCB2YjIgYnVmZmVyPw0KPj4+IE9uY2UgdGhlIGluZGV4IGlzIGRlbGV0
ZWQsIHRoZW4gaXQgd29uJ3QgYmUgdXNlZCBhbnltb3JlLCB1bmxlc3MgZnJlZQ0KPj4+IHRoZSB2
YjIgcXVldWU/IGlzIGl0IGEgaG9sZSBpbiB2YjIgcXVldWU/DQo+Pg0KPj4gWWVzIG51bV9idWZm
ZXJzIGlzbid0IGNoYW5nZSBhbmQgc3RpbGwgcmVwcmVzZW50IHRoZSBoaWdoZXN0IGluZGV4IG9m
DQo+PiBhbGxvY2F0ZWQgYnVmZmVyLg0KPj4gREVMRVRFX0JVRiByZW1vdmUgdGhlIGJ1ZmZlciBm
cm9tIHRoZSBsaXN0IGFuZCBmcmVlIHRoZSBtZW1vcnkuDQo+PiBUaGF0IGNvdWxkIGEgY3JlYXRl
IGEgaG9sZSBpbiB2YjIgcXVldWUsIHRoYXQgd2h5IHRoZSBmaXJzdCBwYXRjaCBvZg0KPj4gdGhp
cyBzZXJpZXMgY2hhbmdlIGFsbCBwbGFjZXMgd2hlcmUgdmIyIHF1ZXVlIGFycmF5IHdhcyB1c2Vk
IGJ5IGNhbGxzDQo+PiB0byBoZWxwZXJzIGZ1bmN0aW9uIGFuZCBhbHNvIGNoZWNrIHRoZSByZXR1
cm4gdmFsdWUuDQo+PiBudW1fYnVmZmVycyBpcyB1c2VkIGFzIHRoZSBsb3dlc3QgcG9zc2libGUg
dmFsdWUgd2hlbiBmaW5kaW5nIHRoZSBmcmVlDQo+PiBpbmRleGVzIGZvciBidWZmZXJzIChzZWUg
dmIyX3F1ZXVlX2FkZF9idWZmZXIoKSkgdGhpcyB3YXkgSSBjYW4NCj4+IGd1YXJhbnR5IHRoYXQg
dGhlIGluZGV4ZXMgYSBjb250aW51b3VzIHdoaWNoIGlzIGEgcmVxdWlyZW1lbnQgZm9yDQo+PiBj
cmVhdGVfYnVmcy4NCj4+IEkgY2hvb3NlIHRoaXMgc29sdXRpb24gYmVjYXVzZSBYQXJyYXkgQVBJ
IGRvZXNuJ3Qgb2ZmZXIgd2F5IHRvIGZpbmQNCj4+IGNvbnRpbnVvdXMgZnJlZSByYW5nZS4NCj4+
IEl0IGRvZXNuJ3Qgc2VlbSBpbXBvc3NpYmxlIHRvIGFkZCBpdCBidXQgdGhpcyBzZXJpZXMgaXMg
YWxyZWFkeSBiaWcNCj4+IGVub3VnaCBmcm9tIG15IHBvaW50IG9mIHZpZXcuDQo+Pg0KPj4gUmVn
YXJkcywNCj4+IEJlbmphbWluDQo+Pg0KPj4+DQo+Pj4gQW5kIHlvdSBjYW4gdXNlIHhhX2Zvcl9l
YWNoKCkgaW5zdGVhZCB0aGUgZm9yIGxvb3AgdG8gaXRlcmF0ZSBvdmVyDQo+Pj4gdGhlIHByZXNl
bnQgYnVmZmVycyBpbiB2YjIgcXVldWUuDQo+DQo+U29ycnkgSSBmb3Jnb3QgdGhpcyBjb21tZW50
Lg0KPldoZXJlIGRvIHlvdSB0aGluayBJIGNhbiBpbXByb3ZlIHRoZSBjb2RlID8NCg0KVGhhdCdz
IHdoYXQgSSBtZWFudCBpcyB0aGUgZm9sbG93aW5nIGNvZGUgY2FuIHVzZSB4YV9mb3JfZWFjaCgp
IGRpcmVjdGx5Lg0KSW5kZWVkIHRoZSBmb3IgbG9vcCBhbHNvIHdvcmsgd2VsbCwgc28gcGxlYXNl
IGlnbm9yZSBpdC4NCg0KZm9yIChidWZmZXIgPSAwOyBidWZmZXIgPCBxLT5udW1fYnVmZmVyczsg
KytidWZmZXIpIHsNCiAgICAgICAgc3RydWN0IHZiMl9idWZmZXIgKnZiID0gdmIyX2dldF9idWZm
ZXIocSwgYnVmZmVyKTsNCg0KPg0KPlRoYW5rcywNCj5CZW5qYW1pbg0KPg0KPj4+DQo+Pj4+ICsN
Cj4+Pj4gKyAgICAgICBkcHJpbnRrKHEsIDIsICJidWZmZXIgJWQgZGVsZXRlZFxuIiwgaW5kZXgp
Ow0KPj4+PiArICAgICAgIHJldHVybiAwOw0KPj4+PiArfQ0KPj4+PiArDQo+Pj4+IC8qDQo+Pj4+
ICAgKiB2YjJfc3RhcnRfc3RyZWFtaW5nKCkgLSBBdHRlbXB0IHRvIHN0YXJ0IHN0cmVhbWluZy4N
Cj4+Pj4gICAqIEBxOiAgICAgICAgIHZpZGVvYnVmMiBxdWV1ZQ0KPj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYyL3ZpZGVvYnVmMi12NGwyLmMNCj4+Pj4gYi9k
cml2ZXJzL21lZGlhL2NvbW1vbi92aWRlb2J1ZjIvdmlkZW9idWYyLXY0bDIuYw0KPj4+PiBpbmRl
eCA3MjQxMzVkNDFmN2YuLmNlYTY2NmMxN2I0MSAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9t
ZWRpYS9jb21tb24vdmlkZW9idWYyL3ZpZGVvYnVmMi12NGwyLmMNCj4+Pj4gKysrIGIvZHJpdmVy
cy9tZWRpYS9jb21tb24vdmlkZW9idWYyL3ZpZGVvYnVmMi12NGwyLmMNCj4+Pj4gQEAgLTc1MSw2
ICs3NTEsMTIgQEAgaW50IHZiMl9wcmVwYXJlX2J1ZihzdHJ1Y3QgdmIyX3F1ZXVlICpxLCBzdHJ1
Y3QNCj4+Pj4gbWVkaWFfZGV2aWNlICptZGV2LCAgfcKgIEVYUE9SVF9TWU1CT0xfR1BMKHZiMl9w
cmVwYXJlX2J1Zik7DQo+Pj4+DQo+Pj4+ICtpbnQgdmIyX2RlbGV0ZV9idWYoc3RydWN0IHZiMl9x
dWV1ZSAqcSwgc3RydWN0IHY0bDJfYnVmZmVyICpiKSB7DQo+Pj4+ICsgICAgICAgcmV0dXJuIHZi
Ml9jb3JlX2RlbGV0ZV9idWYocSwgYi0+aW5kZXgpOyB9DQo+Pj4+ICtFWFBPUlRfU1lNQk9MX0dQ
TCh2YjJfZGVsZXRlX2J1Zik7DQo+Pj4+ICsNCj4+Pj4gaW50IHZiMl9jcmVhdGVfYnVmcyhzdHJ1
Y3QgdmIyX3F1ZXVlICpxLCBzdHJ1Y3QgdjRsMl9jcmVhdGVfYnVmZmVycw0KPj4+PiAqY3JlYXRl
KQ0KPj4+PiB7DQo+Pj4+ICAgICAgICAgdW5zaWduZWQgcmVxdWVzdGVkX3BsYW5lcyA9IDE7IGRp
ZmYgLS1naXQNCj4+Pj4gYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWRldi5jIGIvZHJp
dmVycy9tZWRpYS92NGwyLQ0KPj4+PiBjb3JlL3Y0bDItZGV2LmMgaW5kZXggZjgxMjc5NDkyNjgy
Li44MGFjZTJlMWU5MzIgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3Jl
L3Y0bDItZGV2LmMNCj4+Pj4gKysrIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1kZXYu
Yw0KPj4+PiBAQCAtNzIwLDYgKzcyMCw3IEBAIHN0YXRpYyB2b2lkIGRldGVybWluZV92YWxpZF9p
b2N0bHMoc3RydWN0DQo+Pj4+IHZpZGVvX2RldmljZQ0KPj4+PiAqdmRldikNCj4+Pj4gICAgICAg
ICAgICAgICAgIFNFVF9WQUxJRF9JT0NUTChvcHMsIFZJRElPQ19QUkVQQVJFX0JVRiwNCj4+Pj4g
dmlkaW9jX3ByZXBhcmVfYnVmKTsNCj4+Pj4gICAgICAgICAgICAgICAgIFNFVF9WQUxJRF9JT0NU
TChvcHMsIFZJRElPQ19TVFJFQU1PTiwgdmlkaW9jX3N0cmVhbW9uKTsNCj4+Pj4gICAgICAgICAg
ICAgICAgIFNFVF9WQUxJRF9JT0NUTChvcHMsIFZJRElPQ19TVFJFQU1PRkYsDQo+Pj4+IHZpZGlv
Y19zdHJlYW1vZmYpOw0KPj4+PiArICAgICAgICAgICAgICAgU0VUX1ZBTElEX0lPQ1RMKG9wcywg
VklESU9DX0RFTEVURV9CVUYsDQo+Pj4+ICsgdmlkaW9jX2RlbGV0ZV9idWYpOw0KPj4+PiAgICAg
ICAgIH0NCj4+Pj4NCj4+Pj4gICAgICAgICBpZiAoaXNfdmlkIHx8IGlzX3ZiaSB8fCBpc19tZXRh
KSB7IGRpZmYgLS1naXQNCj4+Pj4gYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLQ0KPj4+
PiBpb2N0bC5jIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1pb2N0bC5jDQo+Pj4+IGlu
ZGV4IGE4NThhY2VhNjU0Ny4uMWM3MzcyNzlkM2VmIDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJz
L21lZGlhL3Y0bDItY29yZS92NGwyLWlvY3RsLmMNCj4+Pj4gKysrIGIvZHJpdmVycy9tZWRpYS92
NGwyLWNvcmUvdjRsMi1pb2N0bC5jDQo+Pj4+IEBAIC0yMTU2LDYgKzIxNTYsMTUgQEAgc3RhdGlj
IGludCB2NGxfcHJlcGFyZV9idWYoY29uc3Qgc3RydWN0DQo+Pj4+IHY0bDJfaW9jdGxfb3BzICpv
cHMsDQo+Pj4+ICAgICAgICAgcmV0dXJuIHJldCA/IHJldCA6IG9wcy0+dmlkaW9jX3ByZXBhcmVf
YnVmKGZpbGUsIGZoLCBiKTsgIH0NCj4+Pj4NCj4+Pj4gK3N0YXRpYyBpbnQgdjRsX2RlbGV0ZV9i
dWYoY29uc3Qgc3RydWN0IHY0bDJfaW9jdGxfb3BzICpvcHMsDQo+Pj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKmZoLCB2b2lkICphcmcpIHsNCj4+
Pj4gKyAgICAgICBzdHJ1Y3QgdjRsMl9idWZmZXIgKmIgPSBhcmc7DQo+Pj4+ICsgICAgICAgaW50
IHJldCA9IGNoZWNrX2ZtdChmaWxlLCBiLT50eXBlKTsNCj4+Pj4gKw0KPj4+PiArICAgICAgIHJl
dHVybiByZXQgPyByZXQgOiBvcHMtPnZpZGlvY19kZWxldGVfYnVmKGZpbGUsIGZoLCBiKTsgfQ0K
Pj4+PiArDQo+Pj4+IHN0YXRpYyBpbnQgdjRsX2dfcGFybShjb25zdCBzdHJ1Y3QgdjRsMl9pb2N0
bF9vcHMgKm9wcywNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
ZmlsZSAqZmlsZSwgdm9pZCAqZmgsIHZvaWQNCj4+Pj4gKmFyZykgIHsgQEAgLTI5MDUsNiArMjkx
NCw3DQo+Pj4+IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdjRsMl9pb2N0bF9pbmZvIHY0bDJfaW9j
dGxzW10gPSB7DQo+Pj4+ICAgICAgICAgSU9DVExfSU5GTyhWSURJT0NfRU5VTV9GUkVRX0JBTkRT
LCB2NGxfZW51bV9mcmVxX2JhbmRzLA0KPj4+PiB2NGxfcHJpbnRfZnJlcV9iYW5kLCAwKSwNCj4+
Pj4gICAgICAgICBJT0NUTF9JTkZPKFZJRElPQ19EQkdfR19DSElQX0lORk8sIHY0bF9kYmdfZ19j
aGlwX2luZm8sDQo+Pj4+IHY0bF9wcmludF9kYmdfY2hpcF9pbmZvLCBJTkZPX0ZMX0NMRUFSKHY0
bDJfZGJnX2NoaXBfaW5mbywgbWF0Y2gpKSwNCj4+Pj4gICAgICAgICBJT0NUTF9JTkZPKFZJRElP
Q19RVUVSWV9FWFRfQ1RSTCwgdjRsX3F1ZXJ5X2V4dF9jdHJsLA0KPj4+PiB2NGxfcHJpbnRfcXVl
cnlfZXh0X2N0cmwsIElORk9fRkxfQ1RSTCB8DQo+Pj4+IElORk9fRkxfQ0xFQVIodjRsMl9xdWVy
eV9leHRfY3RybCwNCj4+Pj4gaWQpKSwNCj4+Pj4gKyAgICAgICBJT0NUTF9JTkZPKFZJRElPQ19E
RUxFVEVfQlVGLCB2NGxfZGVsZXRlX2J1ZiwNCj4+Pj4gKyB2NGxfcHJpbnRfYnVmZmVyLCBJTkZP
X0ZMX1FVRVVFKSwNCj4+Pj4gfTsNCj4+Pj4gI2RlZmluZSBWNEwyX0lPQ1RMUyBBUlJBWV9TSVpF
KHY0bDJfaW9jdGxzKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9tZWRpYS92NGwy
LWlvY3RsLmggYi9pbmNsdWRlL21lZGlhL3Y0bDItaW9jdGwuaA0KPj4+PiBpbmRleA0KPj4+PiBl
ZGI3MzNmMjE2MDQuLjJmMjMyZWQ4ODRjNyAxMDA2NDQNCj4+Pj4gLS0tIGEvaW5jbHVkZS9tZWRp
YS92NGwyLWlvY3RsLmgNCj4+Pj4gKysrIGIvaW5jbHVkZS9tZWRpYS92NGwyLWlvY3RsLmgNCj4+
Pj4gQEAgLTE2Myw2ICsxNjMsOCBAQCBzdHJ1Y3QgdjRsMl9maDsNCj4+Pj4gICAqICAgICA6cmVm
OmBWSURJT0NfQ1JFQVRFX0JVRlMgPHZpZGlvY19jcmVhdGVfYnVmcz5gIGlvY3RsDQo+Pj4+ICAg
KiBAdmlkaW9jX3ByZXBhcmVfYnVmOiBwb2ludGVyIHRvIHRoZSBmdW5jdGlvbiB0aGF0IGltcGxl
bWVudHMNCj4+Pj4gICAqICAgICA6cmVmOmBWSURJT0NfUFJFUEFSRV9CVUYgPHZpZGlvY19wcmVw
YXJlX2J1Zj5gIGlvY3RsDQo+Pj4+ICsgKiBAdmlkaW9jX2RlbGV0ZV9idWY6IHBvaW50ZXIgdG8g
dGhlIGZ1bmN0aW9uIHRoYXQgaW1wbGVtZW50cw0KPj4+PiArICogICAgIDpyZWY6YFZJRElPQ19E
RUxFVEVfQlVGIDx2aWRpb2NfZGVsZXRlX2J1Zj5gIGlvY3RsDQo+Pj4+ICAgKiBAdmlkaW9jX292
ZXJsYXk6IHBvaW50ZXIgdG8gdGhlIGZ1bmN0aW9uIHRoYXQgaW1wbGVtZW50cw0KPj4+PiAgICog
ICAgIDpyZWY6YFZJRElPQ19PVkVSTEFZIDx2aWRpb2Nfb3ZlcmxheT5gIGlvY3RsDQo+Pj4+ICAg
KiBAdmlkaW9jX2dfZmJ1ZjogcG9pbnRlciB0byB0aGUgZnVuY3Rpb24gdGhhdCBpbXBsZW1lbnRz
IEBADQo+Pj4+IC00MjIsNiArNDI0LDgNCj4+Pj4gQEAgc3RydWN0IHY0bDJfaW9jdGxfb3BzIHsN
Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2NGwyX2NyZWF0
ZV9idWZmZXJzICpiKTsNCj4+Pj4gICAgICAgICBpbnQgKCp2aWRpb2NfcHJlcGFyZV9idWYpKHN0
cnVjdCBmaWxlICpmaWxlLCB2b2lkICpmaCwNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCB2NGwyX2J1ZmZlciAqYik7DQo+Pj4+ICsgICAgICAgaW50ICgqdmlk
aW9jX2RlbGV0ZV9idWYpKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpmaCwNCj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHY0bDJfYnVmZmVyICpiKTsNCj4+Pj4N
Cj4+Pj4gICAgICAgICBpbnQgKCp2aWRpb2Nfb3ZlcmxheSkoc3RydWN0IGZpbGUgKmZpbGUsIHZv
aWQgKmZoLCB1bnNpZ25lZA0KPj4+PiBpbnQgaSk7DQo+Pj4+ICAgICAgICAgaW50ICgqdmlkaW9j
X2dfZmJ1Zikoc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKmZoLCBkaWZmIC0tZ2l0DQo+Pj4+IGEv
aW5jbHVkZS9tZWRpYS92aWRlb2J1ZjItY29yZS5oIGIvaW5jbHVkZS9tZWRpYS92aWRlb2J1ZjIt
Y29yZS5oDQo+Pj4+IGluZGV4DQo+Pj4+IDA4MGI3ODNkNjA4ZC4uMGY5ZTY4Zjc2Yjc3IDEwMDY0
NA0KPj4+PiAtLS0gYS9pbmNsdWRlL21lZGlhL3ZpZGVvYnVmMi1jb3JlLmgNCj4+Pj4gKysrIGIv
aW5jbHVkZS9tZWRpYS92aWRlb2J1ZjItY29yZS5oDQo+Pj4+IEBAIC04NDAsNiArODQwLDE1IEBA
IGludCB2YjJfY29yZV9jcmVhdGVfYnVmcyhzdHJ1Y3QgdmIyX3F1ZXVlICpxLA0KPj4+PiBlbnVt
IHZiMl9tZW1vcnkgbWVtb3J5LA0KPj4+PiAgICovDQo+Pj4+IGludCB2YjJfY29yZV9wcmVwYXJl
X2J1ZihzdHJ1Y3QgdmIyX3F1ZXVlICpxLCB1bnNpZ25lZCBpbnQgaW5kZXgsDQo+Pj4+IHZvaWQg
KnBiKTsNCj4+Pj4NCj4+Pj4gKy8qKg0KPj4+PiArICogdmIyX2NvcmVfZGVsZXRlX2J1ZigpIC0N
Cj4+Pj4gKyAqIEBxOiBwb2ludGVyIHRvICZzdHJ1Y3QgdmIyX3F1ZXVlIHdpdGggdmlkZW9idWYy
IHF1ZXVlLg0KPj4+PiArICogQGluZGV4OiAgICAgaWQgbnVtYmVyIG9mIHRoZSBidWZmZXIuDQo+
Pj4+ICsgKg0KPj4+PiArICogIFJldHVybjogcmV0dXJucyB6ZXJvIG9uIHN1Y2Nlc3M7IGFuIGVy
cm9yIGNvZGUgb3RoZXJ3aXNlLg0KPj4+PiArICovDQo+Pj4+ICtpbnQgdmIyX2NvcmVfZGVsZXRl
X2J1ZihzdHJ1Y3QgdmIyX3F1ZXVlICpxLCB1bnNpZ25lZCBpbnQgaW5kZXgpOw0KPj4+PiArDQo+
Pj4+IC8qKg0KPj4+PiAgICogdmIyX2NvcmVfcWJ1ZigpIC0gUXVldWUgYSBidWZmZXIgZnJvbSB1
c2Vyc3BhY2UNCj4+Pj4gICAqDQo+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL21lZGlhL3ZpZGVv
YnVmMi12NGwyLmgNCj4+Pj4gYi9pbmNsdWRlL21lZGlhL3ZpZGVvYnVmMi12NGwyLmggaW5kZXgg
ODhhN2E1NjUxNzBlLi4zYmVlYjRjNzM1ZjANCj4+Pj4gMTAwNjQ0DQo+Pj4+IC0tLSBhL2luY2x1
ZGUvbWVkaWEvdmlkZW9idWYyLXY0bDIuaA0KPj4+PiArKysgYi9pbmNsdWRlL21lZGlhL3ZpZGVv
YnVmMi12NGwyLmgNCj4+Pj4gQEAgLTExNCw2ICsxMTQsMTcgQEAgaW50IHZiMl9jcmVhdGVfYnVm
cyhzdHJ1Y3QgdmIyX3F1ZXVlICpxLCBzdHJ1Y3QNCj4+Pj4gdjRsMl9jcmVhdGVfYnVmZmVycyAq
Y3JlYXRlKTsNCj4+Pj4gICAqLw0KPj4+PiBpbnQgdmIyX3ByZXBhcmVfYnVmKHN0cnVjdCB2YjJf
cXVldWUgKnEsIHN0cnVjdCBtZWRpYV9kZXZpY2UgKm1kZXYsDQo+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IHY0bDJfYnVmZmVyICpiKTsNCj4+Pj4gKy8qKg0KPj4+PiArICogdmIyX2Rl
bGV0ZV9idWYoKSAtIERlbGV0ZSB0aGUgYnVmZmVyIGZyb20gdGhlIHF1ZXVlDQo+Pj4+ICsgKg0K
Pj4+PiArICogQHE6ICAgICAgICAgcG9pbnRlciB0byAmc3RydWN0IHZiMl9xdWV1ZSB3aXRoIHZp
ZGVvYnVmMiBxdWV1ZS4NCj4+Pj4gKyAqIEBiOiAgICAgICAgIGJ1ZmZlciBzdHJ1Y3R1cmUgcGFz
c2VkIGZyb20gdXNlcnNwYWNlIHRvDQo+Pj4+ICsgKiAgICAgICAgICAgICAmdjRsMl9pb2N0bF9v
cHMtPnZpZGlvY19kZWxldGVfYnVmIGhhbmRsZXIgaW4gZHJpdmVyDQo+Pj4+ICsgKg0KPj4+PiAr
ICogVGhlIHJldHVybiB2YWx1ZXMgZnJvbSB0aGlzIGZ1bmN0aW9uIGFyZSBpbnRlbmRlZCB0byBi
ZSBkaXJlY3RseQ0KPj4+PiArcmV0dXJuZWQNCj4+Pj4gKyAqIGZyb20gJnY0bDJfaW9jdGxfb3Bz
LT52aWRpb2NfZGVsZXRlX2J1ZiBoYW5kbGVyIGluIGRyaXZlci4NCj4+Pj4gKyAqLw0KPj4+PiAr
aW50IHZiMl9kZWxldGVfYnVmKHN0cnVjdCB2YjJfcXVldWUgKnEsIHN0cnVjdCB2NGwyX2J1ZmZl
ciAqYik7DQo+Pj4+DQo+Pj4+IC8qKg0KPj4+PiAgICogdmIyX3FidWYoKSAtIFF1ZXVlIGEgYnVm
ZmVyIGZyb20gdXNlcnNwYWNlIGRpZmYgLS1naXQNCj4+Pj4gYS9pbmNsdWRlL3VhcGkvbGludXgv
dmlkZW9kZXYyLmggYi9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmgNCj4+Pj4gaW5kZXgN
Cj4+Pj4gYWVlNzVlYjllNjg2Li4zMWJiYTE5MTU2NDIgMTAwNjQ0DQo+Pj4+IC0tLSBhL2luY2x1
ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaA0KPj4+PiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgv
dmlkZW9kZXYyLmgNCj4+Pj4gQEAgLTI3MDIsNiArMjcwMiw4IEBAIHN0cnVjdCB2NGwyX2NyZWF0
ZV9idWZmZXJzIHvCoCAjZGVmaW5lDQo+Pj4+IFZJRElPQ19EQkdfR19DSElQX0lORk8gIF9JT1dS
KCdWJywgMTAyLCBzdHJ1Y3QgdjRsMl9kYmdfY2hpcF9pbmZvKQ0KPj4+Pg0KPj4+PiAjZGVmaW5l
IFZJRElPQ19RVUVSWV9FWFRfQ1RSTCAgX0lPV1IoJ1YnLCAxMDMsIHN0cnVjdA0KPj4+PiB2NGwy
X3F1ZXJ5X2V4dF9jdHJsKQ0KPj4+PiArI2RlZmluZSBWSURJT0NfREVMRVRFX0JVRiAgICAgIF9J
T1dSKCdWJywgMTA0LCBzdHJ1Y3QgdjRsMl9idWZmZXIpDQo+Pj4+ICsNCj4+Pj4NCj4+Pj4gLyog
UmVtaW5kZXI6IHdoZW4gYWRkaW5nIG5ldyBpb2N0bHMgcGxlYXNlIGFkZCBzdXBwb3J0IGZvciB0
aGVtIHRvDQo+Pj4+ICAgICBkcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWNvbXBhdC1pb2N0
bDMyLmMgYXMgd2VsbCEgKi8NCj4+Pj4gLS0NCj4+Pj4gMi4zOS4yDQo=
