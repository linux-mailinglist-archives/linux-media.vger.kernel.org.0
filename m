Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADC7A211B66
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 07:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgGBFKO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 01:10:14 -0400
Received: from mga05.intel.com ([192.55.52.43]:15717 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbgGBFKO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Jul 2020 01:10:14 -0400
IronPort-SDR: sC2fTnT6+N4IgqKdIKSs6dMfxodnpzcInrMyg8eMgLoikQ54pNDQyK3pGSFzHwz9TcFhxt2U6T
 iQBGOzmn2GCw==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="231670446"
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="231670446"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 22:10:12 -0700
IronPort-SDR: Fu75ajSn0PWGywgA3u+v8hVbz3MGufwMLqiR4uRit1gpN/7PE8jsT37I72u9T5mlkfizoMqzah
 Jf5LmE/5eKoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="314007193"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
  by fmsmga002.fm.intel.com with ESMTP; 01 Jul 2020 22:10:12 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 1 Jul 2020 22:10:11 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.59) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 1 Jul 2020 22:10:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RV4gqdow3Dd3wH7CD45E2UIaDYYAFuMwZ3b/KY/6Gbzpzs755RPmFE5zRBTejpOGyN4a8gxxnfBW0O0kWNinLh8avivXkiwWvGUYZjb6uaYbENLNYNGxZ6r9vN/TL9IPKfP/BaLh+XJVwmxfQiiMcy2FLH09V0ngMnUz0f2ShbCn8r5vNCIoLXBH7qTKrT/LgPPRBQQoMwMfIKg0VwmHaRD4TxjkX1BY3pfjS07UxskxZ+UNZaF264d0EMzVryt0Yp+ryAR2kqx830CXqWUZqPRQ33Gvk9sgOdB+FuDNJn63u8JOMlt5IGid6JVcWL/u1l7YLTANx6trnKphxRa72w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1c0zirHCLiIGv9X7fHCwnViyqUQZ3ntbZUbcDc++jGk=;
 b=gGXG+vXy/yRmDrTxHZdbXFdrIPtv9Uh7CsvS+lUzSF9iHU0BkFQx84mPJ2OI2pFj+sWslPrTltqMLv6xpbIFDff+iBd2zsIKC/lS4xOPpPWUwbSralKie2spBehIPYSSthOdccGsEN7YJPpL1PfSzQAShZxDWVeD9AxR+wNsu3sgGfwpnokuN2RWC/09djlcluL1fQkgfgjhSnOobpbj7Z3qfjDDD0iWrtNHgwUJ3gGvysreo3sceKjZ0+qg+BN4wZJY7OIyu5kLyLlqdKGLM9tPdvAIKHDaB0i9B7zKfxGdCJRirbJxpsD+6ZPZtqBM0tvWBVAwpDAQ3gjrIB+lig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1c0zirHCLiIGv9X7fHCwnViyqUQZ3ntbZUbcDc++jGk=;
 b=AsVRSdb8lnLxUtiwchdlZb0rw+sMc+W/ANDpYItoKLqLFTiddDChMaUW6F/FLOeVtZM8UaQBLQMd+F1+4FV6A2/cjrSjg5E29CP22MSKMliDO18kbIvSssAfwnxfsw2O/4t5xHFyAcYo0XTC2RKcgaOY6kxbDWGnwW1Nd+mWUP0=
Received: from SN6PR11MB2638.namprd11.prod.outlook.com (2603:10b6:805:58::21)
 by SN6PR11MB3295.namprd11.prod.outlook.com (2603:10b6:805:c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Thu, 2 Jul
 2020 05:10:10 +0000
Received: from SN6PR11MB2638.namprd11.prod.outlook.com
 ([fe80::48a2:d72f:4b80:23bc]) by SN6PR11MB2638.namprd11.prod.outlook.com
 ([fe80::48a2:d72f:4b80:23bc%6]) with mapi id 15.20.3153.021; Thu, 2 Jul 2020
 05:10:10 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     =?utf-8?B?RG9uZ2NodW4gWmh1ICjmnLHkuJzmmKUp?= 
        <Dongchun.Zhu@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "drinkcat@chromium.org" <drinkcat@chromium.org>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        =?utf-8?B?RXJpbiBMbyAo576F6ZuF6b2hKQ==?= <erin.lo@mediatek.com>,
        =?utf-8?B?TG91aXMgS3VvICjpg63lvrflr6cp?= <louis.kuo@mediatek.com>,
        =?utf-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        =?utf-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= 
        <shengnan.wang@mediatek.com>
Subject: RE: [PATCH V9 0/2] media: i2c: Add support for DW9768 VCM
Thread-Topic: [PATCH V9 0/2] media: i2c: Add support for DW9768 VCM
Thread-Index: AQHWTqbpqbdb8EVieEyTx+eQ9+/3xajx7SQAgACjHpD//6fAAIABZ/ZAgAAfz0A=
Date:   Thu, 2 Jul 2020 05:10:10 +0000
Message-ID: <SN6PR11MB263852A0928999854D8A43A9996D0@SN6PR11MB2638.namprd11.prod.outlook.com>
References: <20200630062211.22988-1-dongchun.zhu@mediatek.com>
 <20200701091618.GN16711@paasikivi.fi.intel.com>
 <bf610d1b13c74656b2ffeeb9cc2a96ac@MTKMBS31N1.mediatek.inc>
 <20200701134416.GQ16711@paasikivi.fi.intel.com>
 <e55e7b405a084a0298cd839c05b52c79@MTKMBS31N1.mediatek.inc>
In-Reply-To: <e55e7b405a084a0298cd839c05b52c79@MTKMBS31N1.mediatek.inc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1ddbf79-d65b-4f0a-79c2-08d81e4631f8
x-ms-traffictypediagnostic: SN6PR11MB3295:
x-microsoft-antispam-prvs: <SN6PR11MB3295D82B9F640E951203B24E996D0@SN6PR11MB3295.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0452022BE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JZDFOO1ZHiimp4Ps+HfeITFPH9iB+eeFMFpRt7FeTJWkLJg2vIEVuBDOzblsqn7R+wDinKclubOt6LCI+mB4aUvi3aZ9WYZtF7IAAqlTe5sHfJKjgM5AAXmQlsu8fwFORNzhLeFC9VJttCEzuIthSSw2wOcjdII3cx/rTbVOL3fERHb6tuuaB5ibNYUDKODb43cEvt0jEfLdJqvMJ1k0TjkbLsJodJHHcAr0cPlSL7juuFankiBuF62450R9CoMFigFmznLLee091AwTwBkADUtDqko2l0s69CtxfS2wSmcN+1OZwTXYkH9af8XDd0GuqcFBoSPG6nMi+ytmrQzTEw7kSGMDaag92tbRqgy5vGqUNEBnzdNCRnnbyBFqkNaWzXrynr5Of2V+CdCq0OIunA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2638.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(71200400001)(7696005)(4326008)(52536014)(316002)(33656002)(55016002)(6506007)(86362001)(54906003)(8676002)(53546011)(9686003)(83380400001)(5660300002)(110136005)(7416002)(26005)(66446008)(186003)(64756008)(66556008)(2906002)(66476007)(66946007)(966005)(478600001)(8936002)(76116006)(19627235002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: qJ4npXcINOEeILw1fuIicO7Mh5+3QvPXAd0ksrgjiaizWhNvJQJ2rWvbbhFkAPpvDreLnhX73HhF40Zf9m345/Ji/QeMYDG5qktfTgTIIAbBJ9MILTB7awVTxrGmrhrBPI2ztzWIuT57JTkrdLOkol3mXIaNEjlZo+J13XCaC6+m/c4mROQAj7odS13d05HF/R892lZ4JiGsbSO/xqKcNben9FCS2pUiprUIo10i/tiiyYc5fmDhJF6L+tIxCQp5cTP0XP2N5akgDFzdh7YzxeOvM8k6ZzP00SwZoyM566jZEChl9gJBV2bieGo1/Qqw+Zv+tmdQvhhTRfGhekFMPNKkyFtfBMu/PoRvg64+1l+SzzYCSqhWI0fx4u0ck8UtYyipMXpVLcjRv2mWRb9HiJYuTbAkM0KujukDYAN1T23fMTh0bJOH4GBjN1Prw+00xxsGhtzjyaL8bthmcRx4r6NHyTgKVjD41x2Qi3OR43xpKgaCb8KIuwnwYlWYxs3x
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2638.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ddbf79-d65b-4f0a-79c2-08d81e4631f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2020 05:10:10.5718
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NrJj6VxP2TqFdwcClTnR3bM7R57SOiKjQ7VjGjeoIF2zEjgH1aP+qY7MRTy421qn8kCTnI9kbCLOpaSxIeNFYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3295
X-OriginatorOrg: intel.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksIERvbmdjaHVuDQoNCkkgdGhpbmsgaXQgbmVlZCByZWJhc2Ugb24gbGludXh0di9tYXN0ZXIu
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fXw0KQlJzLCAgDQpCaW5nYnUgQ2FvICAgICAgICAg
ICAgICAgICAgICAgICAgICANCg0KDQpGcm9tOiBEb25nY2h1biBaaHUgKOacseS4nOaYpSkgPERv
bmdjaHVuLlpodUBtZWRpYXRlay5jb20+IA0KU2VudDogVGh1cnNkYXksIEp1bHkgMiwgMjAyMCAx
MTo0OSBBTQ0KVG86IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT4N
CkNjOiBsaW51cy53YWxsZWlqQGxpbmFyby5vcmc7IGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb207
IG1jaGVoYWJAa2VybmVsLm9yZzsgYW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tOyBy
b2JoK2R0QGtlcm5lbC5vcmc7IGRyaW5rY2F0QGNocm9taXVtLm9yZzsgdGZpZ2FAY2hyb21pdW0u
b3JnOyBFcmluIExvICjnvoXpm4XpvaEpIDxlcmluLmxvQG1lZGlhdGVrLmNvbT47IExvdWlzIEt1
byAo6YOt5b635a+nKSA8bG91aXMua3VvQG1lZGlhdGVrLmNvbT47IFNqIEh1YW5nICjpu4Pkv6Hn
kospIDxzai5odWFuZ0BtZWRpYXRlay5jb20+OyBtYXR0aGlhcy5iZ2dAZ21haWwuY29tOyBDYW8s
IEJpbmdidSA8YmluZ2J1LmNhb0BpbnRlbC5jb20+OyBzcnZfaGV1cHN0cmVhbSA8c3J2X2hldXBz
dHJlYW1AbWVkaWF0ZWsuY29tPjsgbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZzsg
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1tZWRpYUB2Z2VyLmtl
cm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBTaGVuZ25hbiBXYW5nICjnjovl
nKPnlLcpIDxzaGVuZ25hbi53YW5nQG1lZGlhdGVrLmNvbT4NClN1YmplY3Q6IFJFOiBbUEFUQ0gg
VjkgMC8yXSBtZWRpYTogaTJjOiBBZGQgc3VwcG9ydCBmb3IgRFc5NzY4IFZDTQ0KDQoNCkhpIFNh
a2FyaSwNCg0KU29ycnkgdG8gYm90aGVyIHlvdSBhZ2FpbiwgYnV0IEkgYW0gc28gY29uZnVzZWQg
YWJvdXQgdGhlIHF1ZXN0aW9ucyB5b3UgcmFpc2VkLg0KSSBqdXN0IHN5bmNlZCBtYWlubGluZTog
NS44LXJjMyB0YXJiYWxsIGZyb20gaHR0cHM6Ly93d3cua2VybmVsLm9yZy8sIG9uIHdoaWNoIEkg
cmFuIHRoZSBnaXQgYW0gPHBhdGNoPiBjb21tYW5kLg0KVGhlIHBhdGNoLWFwcGx5aW5nIHByb2Nl
c3Mgc2hvd3Mgbm8gZXJyb3IuDQotLS0tLS0tLS0tLS0tLS0tLTg8LS0tLS0tLS0tLS0tLS0tLS0t
LQ0KW210azE1MDEzQG10a3NsdDMwNyBsaW51eF0kZ2l0IGFwcGx5IC0tY2hlY2sgbWVkaWEtaTJj
LUFkZC1zdXBwb3J0LWZvci1EVzk3NjgtVkNNLnBhdGNoDQpbbXRrMTUwMTNAbXRrc2x0MzA3IGxp
bnV4XSRnaXQgYW0gbWVkaWEtaTJjLUFkZC1zdXBwb3J0LWZvci1EVzk3NjgtVkNNLnBhdGNoDQpB
cHBseWluZzogbWVkaWE6IGR0LWJpbmRpbmdzOiBtZWRpYTogaTJjOiBEb2N1bWVudCBEVzk3Njgg
YmluZGluZ3MNCkFwcGx5aW5nOiBtZWRpYTogaTJjOiBkdzk3Njg6IEFkZCBEVzk3NjggVkNNIGRy
aXZlcg0KLS0tLS0tLS0tLS0tLS0tLS04PC0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KT24gdGhlIG90
aGVyIGhhbmQsIEkgYWxzbyBjb21wYXJlZCBkb25nd29vbixkdzk3NjgueWFtbCBmaWxlIHdpdGgg
b3RoZXIgbWVkaWEgZGV2aWNlIGR0LWJpbmRpbmdzKGxpa2UgaW14MjE5LnlhbWwgYW5kIG92ODg1
Ni55YW1sKS4NCkl0IHNlZW1zIHRoZXJlIGFyZSBubyBhcHBhcmVudCBkaWZmZXJlbmNlcyBiZXR3
ZWVuIHRoZW0uDQpFc3BlY2lhbGx5LCB0aGUgc2VudGVuY2UgJyMgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSknIHNoYWxsIGJlIGNvbW1vbi4NCkkgZHVu
bm8gd2h5IGhlcmUgZG9uZ3dvb24sZHc5NzY4LnlhbWwgcmVwb3J0cyB0cmFpbGluZyB3aGl0ZXNw
YWNlIHdhcm5pbmdzIHdoaWxlIG92ODg1Ni55YW1sIGlzIHNpbGVudC4NCg0KRm9yIHRoZSBwYXRj
aCBmYWlsZWQgb24gTUFJTlRBSU5FUlMsIEkgYW0gc3RpbGwgY3VyaW91cyB3aGF0J3Mgd3Jvbmcu
DQpJbiBmYWN0LCBJIGxvY2FsbHkgaGF2ZSBydW4gcGFyc2UtbWFpbnRhaW5lcnMucGwgc2NyaXB0
IHRvIGNoZWNrIE1BSU5UQUlORVJTIGZpbGUgYmVmb3JlIHN1Ym1pdHRpbmcgcGF0Y2guDQpUaGUg
cmVzdWx0IGFsc28gcmVwb3J0cyBubyBlcnJvcnMuDQotLS0tLS0tLS0tLS0tLS0tLTg8LS0tLS0t
LS0tLS0tLS0tLS0tLQ0KW210azE1MDEzQG10a3NsdDMwNyBsaW51eF0kcGVybCBzY3JpcHRzL3Bh
cnNlLW1haW50YWluZXJzLnBsDQpbbXRrMTUwMTNAbXRrc2x0MzA3IGxpbnV4XSRscw0KLS0tLS0t
LS0tLS0tLS0tLS04PC0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KQXMgdG8gQmFzZTY0IGVuY29kaW5n
LCBJIGNoZWNrZWQgZWFjaCBwYXRjaCBmaWxlIGFnYWluLiBUaGV5IGFyZSBhbGwgZW5jb2RlZCBp
biBVVEYtOC4NCkFzIGh0dHBzOi8vd3d3LmJhc2U2NGVuY29kZS5vcmcvIHNheXMsIGZvciBhbiBl
eGFtcGxlLCAnNzcnIGluIEFTQ0lJIGZvcm1hdCB3b3VsZCBiZSBjaGFuZ2VkIHRvICdUJyBpbiBC
YXNlZDY0LWVuY29kZWQgZm9ybWF0Lg0KVGhpcyBtZWFucyB0aGVyZSBzaGFsbCBiZSBtZXNzeSBj
b2RlIGlmIHdlIGFkcG90aW5nIEJhc2VkNjQtZW5jb2RlZCBmb3JtYXQuDQpCdXQgSSBjYW5ub3Qg
c2VlIGdhcmJsZWQgbWVzc2FnZXMgaW4gdGhlIGN1cnJlbnQgcGF0Y2hlcy4NCg0KVGhlIERXOTc2
OCBzZXJpYWxzLXBhdGNoIGlzIGF0dGFjaGVkLg0KQFRvbWFzeiBAQW5keSBAUm9iIGNvdWxkIGFu
eW9uZSBoZWxwIHRyeSB0byBzZWUgd2hldGhlciB0aGUgcGF0Y2ggY2FuIGJlIGNoZXJyeS1waWNr
ZWQgb24gTGludXggbWFzdGVyIGJyYW5jaCBvciBub3Q/DQpQYXRjaHdvcmsgbGluazoNCmh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTE2MzMyOTEvDQoNClRoYW5rcywNCkRvbmdj
aHVuDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFNha2FyaSBBaWx1cyBb
bWFpbHRvOnNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb21dIA0KU2VudDogV2VkbmVzZGF5LCBK
dWx5IDAxLCAyMDIwIDk6NDQgUE0NClRvOiBEb25nY2h1biBaaHUgKOacseS4nOaYpSkNCkNjOiBt
YWlsdG86YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbTsgbWFpbHRvOm1jaGVoYWJAa2VybmVsLm9y
ZzsgbWFpbHRvOmFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbTsgbWFpbHRvOnJvYmgr
ZHRAa2VybmVsLm9yZzsgbWFpbHRvOmRyaW5rY2F0QGNocm9taXVtLm9yZzsgbWFpbHRvOnRmaWdh
QGNocm9taXVtLm9yZzsgRXJpbiBMbyAo576F6ZuF6b2hKTsgTG91aXMgS3VvICjpg63lvrflr6cp
DQpTdWJqZWN0OiBSZTogW1BBVENIIFY5IDAvMl0gbWVkaWE6IGkyYzogQWRkIHN1cHBvcnQgZm9y
IERXOTc2OCBWQ00NCg0KSGkgRG9uZ2NodW4sDQoNCk9uIFdlZCwgSnVsIDAxLCAyMDIwIGF0IDEy
OjE0OjQ4UE0gKzAwMDAsIERvbmdjaHVuIFpodSAo5pyx5Lic5pilKSB3cm90ZToNCj4gIEhlbGxv
IFNha2FyaSwNCj4gDQo+ICBUaGFuayB5b3UgZm9yIHlvdXIga2luZGx5IHJldmlldyA6IC0pDQo+
IA0KPiAgRm9yIHRoZSB0cmFpbGluZyB3aGl0ZXNwYWNlcywgZGlkIHlvdSBtZWFuIHRoZSBtZXNz
YWdlIGluIHRoZSBjb3Zlci1sZXR0ZXIoMC8yIHBhdGNoKT8NCj4gIEkgYW0gYSBsaXR0bGUgY29u
ZnVzZWQgYWJvdXQgaXQuIEluIGZhY3QsIEkgY2FuJ3QgdGVsbCB0aGUgd3JvbmcgcGxhY2VzIHdp
dGggbXkgbmFrZWQgZXllLi4uDQo+IA0KPiAgRm9yIHRoZSBjb25mbGljdCBpbiBNQUlOVEFJTkVS
UyB2cy4gY3VycmVudCBtZWRpYSB0cmVlIG1hc3RlciwgZGlkIHlvdSBtZWFuIHRoZSBmaWxlIG5h
bWUoZG9uZ3dvb24sZHc5NzY4LnlhbWwpPw0KPiAgRG8gd2UgbmVlZCB0byBjaGFuZ2UgZHQtYmlu
ZGluZyBmaWxlIG5hbWUgZnJvbSBkb25nd29vbixkdzk3NjgueWFtbCB0byBkdzk3NjgueWFtbD8N
Cg0KSSBtZWFuIHRyYWlsaW5nIHdoaXRlc3BhY2VzLiBXaGVuIGFwcGx5aW5nIHRoZSBwYXRjaCB3
aXRoIGdpdCBhbSwgdGhpcyBpcyB3aGF0IHlvdSBnZXQ6DQoNCi0tLS0tLS0tLS0tLS0tLS0tODwt
LS0tLS0tLS0tLS0tLS0tLS0tDQokIGdpdCBhbSAtcyAvdG1wL3BhdGNoc2V0DQpBcHBseWluZzog
bWVkaWE6IGR0LWJpbmRpbmdzOiBtZWRpYTogaTJjOiBEb2N1bWVudCBEVzk3NjggYmluZGluZ3MN
Ci5naXQvcmViYXNlLWFwcGx5L3BhdGNoOjEzOiB0cmFpbGluZyB3aGl0ZXNwYWNlLg0KIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQ0KLmdpdC9yZWJh
c2UtYXBwbHkvcGF0Y2g6MTQ6IHRyYWlsaW5nIHdoaXRlc3BhY2UuDQojIENvcHlyaWdodCAoYykg
MjAyMCBNZWRpYVRlayBJbmMuDQouZ2l0L3JlYmFzZS1hcHBseS9wYXRjaDoxNTogdHJhaWxpbmcg
d2hpdGVzcGFjZS4NCiVZQU1MIDEuMg0KLmdpdC9yZWJhc2UtYXBwbHkvcGF0Y2g6MTY6IHRyYWls
aW5nIHdoaXRlc3BhY2UuDQotLS0NCi5naXQvcmViYXNlLWFwcGx5L3BhdGNoOjE3OiB0cmFpbGlu
ZyB3aGl0ZXNwYWNlLg0KJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZWRpYS9p
MmMvZG9uZ3dvb24sZHc5NzY4LnlhbWwjDQplcnJvcjogcGF0Y2ggZmFpbGVkOiBNQUlOVEFJTkVS
Uzo1MjE1DQplcnJvcjogTUFJTlRBSU5FUlM6IHBhdGNoIGRvZXMgbm90IGFwcGx5IFBhdGNoIGZh
aWxlZCBhdCAwMDAxIG1lZGlhOiBkdC1iaW5kaW5nczogbWVkaWE6IGkyYzogRG9jdW1lbnQgRFc5
NzY4IGJpbmRpbmdzDQpoaW50OiBVc2UgJ2dpdCBhbSAtLXNob3ctY3VycmVudC1wYXRjaCcgdG8g
c2VlIHRoZSBmYWlsZWQgcGF0Y2ggV2hlbiB5b3UgaGF2ZSByZXNvbHZlZCB0aGlzIHByb2JsZW0s
IHJ1biAiZ2l0IGFtIC0tY29udGludWUiLg0KSWYgeW91IHByZWZlciB0byBza2lwIHRoaXMgcGF0
Y2gsIHJ1biAiZ2l0IGFtIC0tc2tpcCIgaW5zdGVhZC4NClRvIHJlc3RvcmUgdGhlIG9yaWdpbmFs
IGJyYW5jaCBhbmQgc3RvcCBwYXRjaGluZywgcnVuICJnaXQgYW0gLS1hYm9ydCIuDQotLS0tLS0t
LS0tLS0tLS0tLTg8LS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpBbHNvIHRoZSBwYXRjaGVzIHNlZW0g
dG8gYmUgYmFzZTY0IGVuY29kZWQsIHNvbWV0aGluZyBJIGhhdmVuJ3Qgc2VlbiBiZWZvcmUuIFRo
YXQgaXMgbGlrZWx5IHVucmVsYXRlZCB0aG91Z2guDQoNCi0tDQpSZWdhcmRzLA0KDQpTYWthcmkg
QWlsdXMNCg0KKioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoq
KioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1t
YWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVu
dGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20g
ZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0K
Y29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRp
c3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlp
bmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRl
bmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5s
YXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFp
bCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJy
b3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0
byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFp
bCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5v
dA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNv
bi4gVGhhbmsgeW91IQ0K
