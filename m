Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4BB5B3682
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 10:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731167AbfIPIk3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 04:40:29 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:35838 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729728AbfIPIk3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 04:40:29 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 47525C0149;
        Mon, 16 Sep 2019 08:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1568623229; bh=d0h186zOLUSA9C8wwtlY2L+mtw6yW4ea/KfBR3If9zY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=cvNPyJrhBB1Yakl2yjv2F7gOFCUJukbBFzZLhjJ/zaKE8OBTOs+5x3C6ooPTyfzET
         MeIwLyAyhH2fR+4oMUzKsX7zZ9R5NEueT5ECnGVcW0kcWPqV8gdDC91mmBJtg/JTVM
         EeIJBMpp0xLjZd1HoGHKK9W0+0U3mttKqxjYLijDxkoATVV0hiOhE0yzC1Fsvzqgx3
         IhWjJYTKUPrI16yvqivIM79ADOi0K0E54eS+OGOjpHKn69MNq/RzQ3O9qX5mUXZpky
         UmaaoeCqJv0J7aRUhRO8z/BPGWwEn3Xl4ZGYqEHPE1Z57iPkklG9Zx0F0tvT3dssZI
         N4ax4Z7BI7mBQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6B13EA005A;
        Mon, 16 Sep 2019 08:40:27 +0000 (UTC)
Received: from US01WEHTC2.internal.synopsys.com (10.12.239.237) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 16 Sep 2019 01:40:27 -0700
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 16 Sep 2019 01:40:26 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 16 Sep 2019 01:40:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lb66MUcXvisM8pXoh1wmXyMOh2i3/8zqpr5+48bLyvZ2TM2tq0mTtrh3OLprz2keffBfMpqcpOSraZ5ssL2nNzokaJjOragTXRxYro4uiya521i2yoD5QNu50gwe7ysDCw3Ik+AbrBq3GksFEzeZlerbFELOBMpRz7E65Fk2NXrNi0fRzXFJQ/J+fXHljRvX+bbGr+FXX4915XKlknAO4ZZIiqgn1D1znGgCiDKwyk82BnMfgwOKDLMTLUu+QMgfa7l2M7WYdniIbH/OcKnidtizCHPWSHHBff8wzghz398rL7bafFUK78OIfaX+Klm6mxRXyaTgAura0gfGnPspYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0h186zOLUSA9C8wwtlY2L+mtw6yW4ea/KfBR3If9zY=;
 b=kDK7YSSvfAfQbO+zJugcTb7kwJrAB3VI/zQhT8GFUNC/XIy2HFasuObTDr2dScIJjyOailfwygw+4QnkMEqTMoTn2vpUOITxB88pB+DoBOu1Rxmf9HXUXvw08lDlnUPEmHtyq7NfPzjERoiueM0biGh2WzVbh3RXs2zkEXdjBAg1Z0yPBFcMt+QLc/ZjmF3y+bLSPQidUgIsvI3uQl4eWaX8OR1YGePys3ZuFfh4SJrrBbyebyIR5hbGBzr5BY5o5gThwueQqJkOA1JU2gDkS5czWHJ6Yq8IRJ45FQKeRqdEW8pVeeh1ad+t4C1g5FONk5jDnhEI/vIaxN5uIlLL3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0h186zOLUSA9C8wwtlY2L+mtw6yW4ea/KfBR3If9zY=;
 b=PPlq6t/MxvMHnj4qx5r2GwhYtOtUZc8fWp5RMKfU8odnmT/ZKpcwPsBk/nd/mPRbGmGPg6mkgzzlDflnQy0EK8FcplIh5N7q5vgtJMmLPQKAKGlQyWtChXr4mHVwKM0XRGBKTru48fdg0ySP2UWaE6+9VSTjg4SBUkJhyQ4KAGg=
Received: from BN8PR12MB3266.namprd12.prod.outlook.com (20.179.67.145) by
 BN8PR12MB3027.namprd12.prod.outlook.com (20.178.209.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.13; Mon, 16 Sep 2019 08:40:25 +0000
Received: from BN8PR12MB3266.namprd12.prod.outlook.com
 ([fe80::59fc:d942:487d:15b8]) by BN8PR12MB3266.namprd12.prod.outlook.com
 ([fe80::59fc:d942:487d:15b8%7]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 08:40:25 +0000
From:   Jose Abreu <Jose.Abreu@synopsys.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>,
        "Joao Pinto" <Joao.Pinto@synopsys.com>
CC:     Alexandre Courbot <acourbot@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: RE: [ANN] Topics for a media summit in Lyon in October
Thread-Topic: [ANN] Topics for a media summit in Lyon in October
Thread-Index: AQHVVAmmUA78eRY6Uk2Ftwj2Gi70nKcpqAVA
Date:   Mon, 16 Sep 2019 08:40:25 +0000
Message-ID: <BN8PR12MB3266963E3EAA25AC2644942DD38C0@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
In-Reply-To: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=joabreu@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3218e3ea-9b2c-46eb-5b7c-08d73a81850a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:BN8PR12MB3027;
x-ms-traffictypediagnostic: BN8PR12MB3027:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB30276C70A012A761802C8A70D38C0@BN8PR12MB3027.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(39860400002)(376002)(366004)(136003)(199004)(189003)(6436002)(6506007)(229853002)(76176011)(4744005)(55016002)(7696005)(14444005)(86362001)(256004)(99286004)(102836004)(3846002)(14454004)(66066001)(6116002)(7736002)(2906002)(6636002)(316002)(52536014)(110136005)(74316002)(305945005)(54906003)(5660300002)(71190400001)(478600001)(26005)(8936002)(11346002)(486006)(186003)(71200400001)(66446008)(66556008)(66946007)(66476007)(8676002)(81156014)(64756008)(81166006)(76116006)(9686003)(446003)(25786009)(53936002)(4326008)(33656002)(6246003)(476003);DIR:OUT;SFP:1102;SCL:1;SRVR:BN8PR12MB3027;H:BN8PR12MB3266.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RJx8Xpu3qj8kJjnN+wcSLBOtkpVe068SZp7A9RgirfF6rpD0PWgW0L3zMjxI2AxeL3jZJBUTBwTvRu0JxynYWh5v0t/8bagJLlV0ViJMd49cYxtRM9nFA7OWf06sDxt/+lRvPd1qKUReTFF3xTUNdo8Lt+k+onUOTyWyE6AnfAZttEqFHnuLO41K3PYWLVW92+aIwbkieqrzSUBceYbfgfrwrBcJ/GCw+ZcKvd4PMI7bE7JvI4nXaTYiSkEBYeb9a3xSb7sfKZaJS6pY6bhZbVATO6zsGVxpJ3FGHp5UUpmoxmPYMTDc1i3WTHlEZRkhJlOFOhS9dPhHYK6CqwqbnyOOiXf99p5yom207ZI9z6Go+G576so0//IMM3LsWFjDDUbANFS9/SeFCAu5TxPZM3TlU2fxeLwzwwQTcX3f1RU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3218e3ea-9b2c-46eb-5b7c-08d73a81850a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 08:40:25.2435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sHitmV/vkRoIB88J2oqgY7XKKckdR8YKLY2KT3dkaDRy/6Sm0xHqKYlZrkBIH38sBa9xGi1h19tzCmB89JJVyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3027
X-OriginatorOrg: synopsys.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogSGFucyBWZXJrdWlsIDxodmVya3VpbEB4czRhbGwubmw+DQpEYXRlOiBBdWcvMTYvMjAx
OSwgMDk6MDY6MzAgKFVUQyswMDowMCkNCg0KPiBSYXRoZXIgdGhlbiBkaXNjdXNzaW5nIHRvcGlj
cyBmb3IgYSBtZWV0aW5nIHVuZGVyIHRoZSBzdWJqZWN0ICdMaXNib24nDQo+IGxldCdzIHN0YXJ0
IGEgbmV3IHRocmVhZCByZWZlcnJpbmcgdG8gdGhlIHJpZ2h0IHBsYWNlIDotKQ0KPiANCj4gSSB3
aWxsIHRyeSB0byBvcmdhbml6ZSBhIHJvb20sIGVpdGhlciBkdXJpbmcgdGhlIEVMQ0Ugb3IgKGlm
IHRoYXQgZG9lc24ndA0KPiB3b3JrKSBwZXJoYXBzIG9uIHRoZSBUaHVyc2RheSBhZnRlcndhcmRz
LiBJZiB0aGF0J3MgZ29pbmcgdG8gYmUgYSBwcm9ibGVtDQo+IGZvciBzb21lb25lLCBwbGVhc2Ug
bGV0IG1lIGtub3cuDQo+IA0KPiBJIGRvIG5lZWQgdG8ga25vdyBob3cgbWFueSBwZW9wbGUgSSBj
YW4gZXhwZWN0LiBJIGhhdmUgdGhlIGZvbGxvd2luZw0KPiBjb25maXJtZWQgYXR0ZW5kZWVzIChh
bmQgcGxlYXNlIHJlcGx5IGlmIHlvdSBhcmUgbm90IGxpc3RlZCEpOg0KDQpIaSBIYW5zLA0KDQpJ
dCdzIGJlZW4gYSB3aGlsZSwgaG9wZSB5b3UgYXJlIGRvaW5nIHdlbGwgOikNCg0KSSdtIG5vIGxv
bmdlciB3b3JraW5nIGluIG1lZGlhIHN1YnN5c3RlbSBidXQgbXkgY29sbGVhZ3VlcyBBbmdlbG8g
YW5kIA0KSm9hbyB3b3VsZCBsaWtlIHRvIGF0dGVuZC4NCg0KV2UgY3VycmVudGx5IGhhdmUgSERN
SSBhbmQgQ1NJIHN1cHBvcnQgZm9yIG91ciBJUHMgdXNpbmcgVjRMMiBhbmQgd2UgDQp3b3VsZCBs
aWtlIHRvIGludGVyYWN0IHdpdGggdGhlIGNvbW11bml0eSBpbiBvcmRlciB0byBnZXQgdGhpcyAN
CnVwLXN0cmVhbWVkIHNvIHRoYXQgd2UgaGF2ZSBhcyBtYW55IGZlYXR1cmVzIHN1cHBvcnRlZCBh
cyBwb3NzaWJsZS4NCg0KSXMgaXQgcG9zc2libGUgPw0KDQotLS0NClRoYW5rcywNCkpvc2UgTWln
dWVsIEFicmV1DQo=
