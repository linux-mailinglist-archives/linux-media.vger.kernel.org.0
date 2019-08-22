Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C77A599793
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 17:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388894AbfHVPAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 11:00:42 -0400
Received: from mail-eopbgr80070.outbound.protection.outlook.com ([40.107.8.70]:47174
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731841AbfHVPAl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 11:00:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPiprhyfyrGP6KsQ7wb4+579WDyAjKuyuBB3O28pJrzftn4bCTqfMLhSRJ9gIOzq4EKPxaZes99AD6UtxMqZg2D1DHPqCvF9z2Ldx/gvU5rPs5O3B26EMlRl6oGQ8y1jwznIvzqerwGdkQVqponbk9jUL+ISPh9pdlPCpYxATzFTHF1Z7ueifNKYoW14Jara0fbk5RrHh3v32NIdkqD4tu9a0OT9x71Gf5QV189VESQy0hKeAeHeqWEiNK44qoK/3/YyabYx26hGfEZwlLyqhdq0hT2dsV3jakBz2v5Z6wYAvva7yuhzElvQASH9qUHJZOZunf1nH8ghx9NVymiRbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNILLnb0U6DQY3s6UsoVuZVA1qwV5ndIBkDAu1ABjuE=;
 b=NaN88rEiEgdNe/VS4Bo+93adXCWBoIQopGyxsCAlA/l7J+lsrw6xm1psz2UfYjNZYj+csTQs0BNfK9sdJS33WUU1OXAdeU5V1FUtqPEzE3fjntiw2x24fy7lSD1hl0e2g4aHN3S9wQyTmfYEiPDzR3P6a6DNC+em4ovTaarAPINcDbeH4nCBiOr3Lv/9n84dP9MaaVusSKrAKaPnflvtWm5pR518a2VWTerFhNG7C1oR9cC71eFVdtEL+ADrNlezNc2ckCcbyKGGrfjMIpZ0HRya/OtHfXtO2lsZPsuR6QmsL0y7hDvjuaAeDzMz1OEI5VLXcQGEq/Yy16L4aLpctA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNILLnb0U6DQY3s6UsoVuZVA1qwV5ndIBkDAu1ABjuE=;
 b=LNWB3SBqH5HLPkfB4+nB+tvVlL+5EXDTYks2koLdJx86e4Z08oZaT0Oycbc2Kw+9+GNr9QF1jFxWoiAkP3UyQ/EbHrDyfGcL6vC0b/2CEARb1HGBm+X4Nzi3FS5WXqIJDIycJNSnYMmlxl/NInilT6p58Ts60DWU1Q1jj3KZObU=
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com (52.134.17.31) by
 VI1PR0402MB2797.eurprd04.prod.outlook.com (10.172.255.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Thu, 22 Aug 2019 15:00:37 +0000
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::e82d:4c2a:86ad:9cdb]) by VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::e82d:4c2a:86ad:9cdb%5]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 15:00:37 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "vivek.kasireddy@intel.com" <vivek.kasireddy@intel.com>,
        "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>
Subject: Re: Re: [PATCH] media: v4l: Add packed YUV444 24bpp pixel format
Thread-Topic: Re: [PATCH] media: v4l: Add packed YUV444 24bpp pixel format
Thread-Index: AQHVWPpbGXRuhMDnyUSf4fCykuwR+w==
Date:   Thu, 22 Aug 2019 15:00:37 +0000
Message-ID: <1566486036.21340.20.camel@nxp.com>
References: <1562166911-27454-1-git-send-email-mirela.rabulea@nxp.com>
         <a6b91ccf-8961-d9a9-c007-d113bcba7156@xs4all.nl>
In-Reply-To: <a6b91ccf-8961-d9a9-c007-d113bcba7156@xs4all.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mirela.rabulea@nxp.com; 
x-originating-ip: [92.121.36.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c98e2a1-c415-43ef-09a7-08d727117dc0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VI1PR0402MB2797;
x-ms-traffictypediagnostic: VI1PR0402MB2797:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB279757D50556F3F1B61F284D8FA50@VI1PR0402MB2797.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(199004)(189003)(66946007)(26005)(76176011)(486006)(99286004)(54906003)(4744005)(76116006)(11346002)(446003)(2906002)(91956017)(8676002)(53936002)(86362001)(478600001)(256004)(81156014)(81166006)(50226002)(8936002)(71200400001)(36756003)(71190400001)(2616005)(7736002)(6486002)(6512007)(66066001)(7416002)(14454004)(6116002)(6246003)(305945005)(2501003)(44832011)(476003)(110136005)(316002)(6506007)(102836004)(186003)(25786009)(66476007)(66556008)(5660300002)(64756008)(4326008)(3846002)(6436002)(229853002)(103116003)(66446008)(99106002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB2797;H:VI1PR0402MB3918.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GN7kcwh/04TZZnGLhwPkdgTIzKzHl3IVvO/IaOIAexoKJSghAY7ChC11UFawRaeYV0cLWGGNE2aKtTdmYZh4DN3E/zV+ipWHih7TiXn/2pVFK7BJm7NP6axEFvpMECj2ARm2xY+w+X1Pw2I2b4ImdEv5jgSFlVYMZ3vnAd2Y0LJcUGL5aYaOxc0wqyRSTPGMa23ELrCd24Au2JxJ2FnZN9Y2N1UlnA+c7vsrIoxQgV9VOIt21pEFKaWfxNyxZa3p9qHVSjJO58hl0vRfAWgoNEIINvxWUaV7xzry1D4P36kjtRIbdenbrZOtx3HnoCi3bKQ29ohyEI9TbQ/BWi31rv+qGOp16t/Sd38TiwzL4Pqc0dSGBjPMsTUNkc7NT64M0XRItjjUFLOV4Kchufij6pZFQtMvIZXO6mu5F9tgTgE=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B830FFEC59A9EB46895F5844E411DE13@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c98e2a1-c415-43ef-09a7-08d727117dc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 15:00:37.2739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /5ATfcTDPIeNrstlU8bfB1kMWJ1Ao4PwBbjwiVHHzrm/ZsaF2Pvbkgxl9943G1VgcPBaXAyToz+M8a1MRhPnpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2797
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSGFucywNCg0KT24gTWEsIDIwMTktMDgtMTMgYXQgMDg6NTQgKzAyMDAsIEhhbnMgVmVya3Vp
bCB3cm90ZToNCj7CoA0KPiBUaGlzIHBhdGNoIGxvb2tzIGdvb2QsIGJ1dCBpdCBjYW4gb25seSBi
ZSBtZXJnZWQgaWYgd2UgYWxzbyBoYXZlIGENCj4gZHJpdmVyDQo+IHRoYXQgdXNlcyBpdC4gVGhp
cyB0byBhdm9pZCBoYXZpbmcgbG90cyBvZiBwaXhlbGZvcm1hdCBkZWZpbmVzIHRoYXQNCj4gbm9i
b2R5DQo+IGlzIHVzaW5nIGluIHRoZSBrZXJuZWwuDQo+IA0KPiBBcmUgdGhlcmUgcGxhbnMgdG8g
dXBzdHJlYW0gdGhpcyBKUEVHIGVuL2RlY29kZXI/DQo+IA0KDQpBcG9sb2dpZXMgZm9yIHRoZSBs
YXRlIHJlc3BvbnNlLCBJIHdhcyBPT08uDQpZZXMsIEkgaGF2ZSBwbGFucyB0byBzZW5kIHRoZSBK
UEVHIGVuY29kZXIvZGVjb2RlciBkcml2ZXIgdXBzdHJlYW0sIGJ1dA0KSSBzdGlsbCBoYXZlIGZh
aWx1cmVzIGZyb20gdjRsMi1jb21wbGlhbmNlIHRlc3QuIEl0IHdpbGwgdGFrZSBhIHdoaWxlDQp1
bnRpbCBJIHdpbGwgbWFuYWdlIHRvIGZpeCB0aG9zZS4gV2hlbiBJIHdpbGwgYmUgcmVhZHkgZm9y
IHVwc3RyZWFtLCBJdA0Kd291bGQgaGVscCBpZiB0aGlzIHBhdGNoIHdvdWxkIGJlIHVwc3RyZWFt
IGFscmVhZHksIGJ1dCBpZiBpdCB3b24ndCwgSQ0KY2FuIHJlbW92ZSB0aGUgUkdCMjQgc3VwcG9y
dCBmcm9tIHRoZSBkcml2ZXIsIGFuZCBzZW5kIGl0IGxhdGVyLA0KdG9nZXRoZXIgd2l0aCB0aGlz
IHBhdGNoLg0KDQpSZWdhcmRzLA0KTWlyZWxh
