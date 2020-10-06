Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8038C284E7B
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 16:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgJFO4s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 10:56:48 -0400
Received: from mail-db8eur05on2053.outbound.protection.outlook.com ([40.107.20.53]:52065
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726123AbgJFO4S (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Oct 2020 10:56:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nh5h1EwWBfsfkA1eWV7Bt7pBwSpB8ev9fMT/5pUQobMJOJNUtc65TN28vs6uecEr/UbGUNKtPLyz2kG6g/YSH+wNOJejiYmhQyykK1BdURxVb76r0qQ6Ir7z4J9n+bA39p5tlEpoDYsDoHCGzn6/tqJ6Ny5adoh2UWHC0DYL4LObndZJTH8fNXaWTBFBcmk77mIwESRzNmm5mSNBG49Tq2S7W5nZUhi59vXyQMfASMdZWfmzQXiqdZ7oDCv0pD5mmWue89iVoeKMsve47cRMwRyXPkN6rW3CNuPGs42Qn2+NtwNdX91/UAWzduRXC6thZIWRlQCANdhQvX1i0yk/1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yF1qc3yceO+kxjCaxVNhyuwcCsDepd4AIH0sE0KYP64=;
 b=i10k+bbHCBo8DZMQMnrYJxFEtn58otf+3NPrPOh0VSxZh4npaOKjuAdSkI/iqqD0frRrGMyuMQ4jBT1FVsKE0Jkaxc3fzDIQedLIF83YT/iR4RKTby+aIp3xWytVQLhmPyapFslzt4zUG7GBni+pWk8xgYuEy0iuPLaW9ScmhNUDHH3pG8ok+Ab6THMA4/yVRHbWmsK/7z7Rqi1CcWYOd/DvaqFnljTY02J008n3axk3dBMxj/626PS4ueUF2rjEgwrTxo3YyFa/WaG9L1mkQRzRQSy2qCnxhWM3KjiiSkgRc1LYyu2IaeUwD3uyvC0e6hRXGHgV94mS/bJhKGSTYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=skidata.onmicrosoft.com; s=selector2-skidata-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yF1qc3yceO+kxjCaxVNhyuwcCsDepd4AIH0sE0KYP64=;
 b=ukBbULXnhQtooQdGQBjJXep4GSUAriA52csyF8hpuJRqXYQx93K3PKLmLLf9lthZ/TR5+cOxHBsA8aCHHlBr1vCQgZYVP3N9z57C+saBSRIiCx4TflYEwAaaRj0tlBNtoaETlRX5EiJGWmGaneLt9m7xRi4lUN65yhGlsUb6u/M=
Received: from AM6PR01MB5574.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:fc::33) by AM6PR01MB5190.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:99::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Tue, 6 Oct
 2020 14:56:11 +0000
Received: from AM6PR01MB5574.eurprd01.prod.exchangelabs.com
 ([fe80::50fd:53c1:f010:fdbe]) by AM6PR01MB5574.eurprd01.prod.exchangelabs.com
 ([fe80::50fd:53c1:f010:fdbe%4]) with mapi id 15.20.3433.045; Tue, 6 Oct 2020
 14:56:11 +0000
From:   Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: RE: [PATCH] media: coda: avoid starvation on well-compressed data
Thread-Topic: [PATCH] media: coda: avoid starvation on well-compressed data
Thread-Index: AdZ3sFkqxzglukE+Rf6iMENtrYblXQAAhVYwBXiB3HACD5hPAAGHEh6A
Date:   Tue, 6 Oct 2020 14:56:09 +0000
Message-ID: <AM6PR01MB55747704D5C56A44F5E08414E20D0@AM6PR01MB5574.eurprd01.prod.exchangelabs.com>
References: <3b140eaf883b4666985c0be0db8d53e8@skidata.com>
 <9444c9375f58436b9e6a0fa3a4088e17@skidata.com>
 <AM6PR01MB55741EE09532A7C60CD05B71E23F0@AM6PR01MB5574.eurprd01.prod.exchangelabs.com>
 <CAAEAJfDnC5=iomoNivrwKt5th866qMKPY0Tw9i_PfKqsFTm69Q@mail.gmail.com>
In-Reply-To: <CAAEAJfDnC5=iomoNivrwKt5th866qMKPY0Tw9i_PfKqsFTm69Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vanguardiasur.com.ar; dkim=none (message not signed)
 header.d=none;vanguardiasur.com.ar; dmarc=none action=none
 header.from=skidata.com;
x-originating-ip: [91.230.2.244]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9568a045-8033-4154-41af-08d86a07f6e9
x-ms-traffictypediagnostic: AM6PR01MB5190:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR01MB51907F2F0A1A1FE0849B1B98E20D0@AM6PR01MB5190.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hrNWaEBrIKNZ7epEgG5189bB6BpPAMxZTgtj/Y6yt3IIIVySAQEhrLiJ2bGdJR+e4SO7dZjljkJGy4Sb5S9JNwMNq2qgU3Ix3ll569IV/cLKSvIwKGA9rkZGR/nKRBTKnIAYWAQw24dF3IHffO4zr1AWyv+z3bTCv1fpiZsDZoRWl8FbeSxpUEo/Rkka8eNzhZ595KYxLVrvu/hBWv+fGDZA1EhR2g6SyzwE6OBhMHBDkc/L5xGtQBw2cVn7/gqLP0a6mQsgfUZr5LveqAapWY1Vc2F3BoaKAHoPfo7QzFx3HpG2MErrj+Qw8CRAL+uk2NXioSJHUAjwBV7N4ykF9F34p8WYLFMKeM4NzA4y4yJyWxG6eMYiAJiGLKVFRWVOj4SejtCb6SbqRlbpDD1BUg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR01MB5574.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(396003)(39850400004)(136003)(8676002)(66946007)(8936002)(76116006)(7696005)(478600001)(83380400001)(83080400001)(6506007)(26005)(2906002)(66476007)(64756008)(86362001)(66556008)(66446008)(186003)(316002)(71200400001)(33656002)(5660300002)(52536014)(54906003)(4326008)(9686003)(55016002)(966005)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Z0pEplb1XmljGVmJIADmeVJVK+f9bgQX8CEhRK9bNAKHbo8p/vAtDRH86+CXFqat3hC0hbPf1n1l8wDkKQk2J161YdE2DoOI9IlkwEL3mFjvbAIPbXif6TLLzsLpNTfhq9aqYcc0YzcT4hPrPYqCjEg8yb+qGsKtSNlsxLUUbGA4eK8xoC3yRJtAR3ieCJNIWL75OnyQKzpQThHBiHme03nssQJoV2nM93KVxvn2blWtd2OEzXAl7pMSEVocE1E5kpH8oNoSH9jmhzi7KdpC/2ENszGjFQ81l1ukdpM6rvtPp3lg+C368yZYkX0+7ORzhED+i8fitUj9K8FXTk2v+w6FfYsplaLrdY4O7xtNc1BGMud31oH2HBNFk3F8zQEkeMUJgo0TbjKCFX7GsfMqg8kxFVETSZlsP9qSLz/QtwX5ugF7DIE8zhP1M92iKRp/izXadk/ZB0KrhJoQRvM7xbvh9PMOnRlRvHRN9hF5p280Rx1baZRsPHREgyPSYRFtkbpgO4Fxrp7JgRsP5mnm55WSiregp0EBmio59tClYK4dtn1m5JPryZpiTXTaNlPcK7WgENWD2K1iOLDUGu49rfiRlD2Gv7hBLwOlouGVzero/XkBp4whd+soqq+rfaO1hVtBBi4+DqsatXULG+4a8Q==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR01MB5574.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9568a045-8033-4154-41af-08d86a07f6e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2020 14:56:11.1832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3d52ce8f-cef6-4b27-bace-cf9989cf3973
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dnx5KR+PLE2vvJ9lWP2Gk29c4p0hRLOipY1NN0cPxLml3t3+qqyWFhiofhOchuKPsA5wkY3X2o2aRchLoDRKbXMMnwdJ942ieYJ7iz3Uz5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR01MB5190
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBFemVxdWllbCBHYXJjaWEgPGV6
ZXF1aWVsQHZhbmd1YXJkaWFzdXIuY29tLmFyPg0KPiBTZW50OiBNb250YWcsIDI4LiBTZXB0ZW1i
ZXIgMjAyMCAyMjowNg0KDQo+IElmIHlvdSBoYXZlIHNvbWUgKHB1YmxpYykgYml0c3RyZWFtIHRo
YXQgYXJlIGtub3duIHRvIHRpbWVvdXQsIGFuZCB0aGF0IHlvdSBjb3VsZA0KPiBzaGFyZSB3aXRo
IG1lLCB0aGF0IHdvdWxkIGJlIG5pY2UsIHNvIEkgY291bGQgaGF2ZSBhIG1vcmUgY29tcGxldGUg
c2V0IG9mIHNhbXBsZXMuDQoNClRoYW5rcyBmb3IgdGhlIHJlc3BvbnNlISBXZSBvbmx5IGhhdmUg
TVBFRzQgYW5kIEguMjY0IGVuY29kZWQgdmlkZW9zIGluIHVzZQ0KYW5kIHRoZSBkZXNjcmliZWQg
cHJvYmxlbSBvY2N1cnMgb25seSB3aXRoIE1QRUc0Lg0KSSBhbmFseXplZCB0aGUgdmlkZW8gc3Ry
ZWFtcyB3aXRoIGZmcHJvYmUgWzFdIGFuZCBmb3VuZCBvdXQgdGhhdCB0aGUgcHJvYmxlbSBvY2N1
cnMNCndoZW4gdGhlIHZpZGVvIGNvbnRhaW5zIGEgY291cGxlIG9mIHNtYWxsIFAgZnJhbWVzIGJl
dHdlZW4ga2V5IGZyYW1lcy4NCg0KRm9yIG15IHRlc3QgYml0c3RyZWFtcywgSSBiYXNpY2FsbHkg
ZGlkIHRoZSBzYW1lIGFzIHlvdXIgY29sbGVhZ3VlIE5pY29sYXMsDQpidXQgYWRkaXRpb25hbGx5
IEkgZGlkIHNvbWUgdmFyaWF0aW9ucyB3aXRoIGZmbXBlZyBbMV0uDQpUbyBnZXQgcmVhbGx5IHNt
YWxsIFAgZnJhbWVzLCBvbmx5IGxpdHRsZSBjaGFuZ2VzIGJldHdlZW4gZnJhbWVzIGFyZSBhbGxv
d2VkLg0KVGhlcmVmb3JlLCBhICJzaW5nbGUgY29sb3IgdmlkZW8iIHNlZW1zIHRvIGJlIHRoZSBi
ZXN0IGNob2ljZS4NClNpbmNlIHRoZSBwcm9ibGVtIHNlZW1lZCB0byBiZSByZWxhdGVkIHRvIHRo
ZSBzaXplIG9mIGEgZnJhbWUsIEkgdmFyaWVkOg0Kd2lkdGgsIGhlaWdodCwgYml0cmF0ZSBhbmQg
R29QIChhbW91bnQgb2YgUCBmcmFtZXMgYmV0d2VlbiBrZXkgZnJhbWVzKS4NClRoaXMgc2hvdWxk
IGFsc28gYmUgcG9zc2libGUgd2l0aCB5b3VyIGdzdHJlYW1lciBwaXBlbGluZSBbMiwgM10uDQoN
ClRoZXNlIHRoaW5ncyBhbHNvIGxlYWQgdG8gbXkgInNpbXBsaXN0aWMgYXBwcm9hY2giIHRvIHNv
bHZlIHRoZSBpc3N1ZS4NCkkgc2F3IHlvdXIgcGF0Y2ggc2VyaWVzIGFuZCB3aWxsIHRyeSBpdCBh
cyBzb29uIGFzIHBvc3NpYmxlLg0KDQpSZWdhcmRzDQpCZW5qYW1pbg0KDQpbMV0gaHR0cHM6Ly9m
Zm1wZWcub3JnLw0KWzJdIGh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9kb2N1bWVu
dGF0aW9uL2xpYmF2L2F2ZW5jX21wZWcydmlkZW8uaHRtbD9naS1sYW5ndWFnZT1jI2F2ZW5jX21w
ZWcydmlkZW86Z29wLXNpemUNClszXSBodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcv
ZG9jdW1lbnRhdGlvbi9saWJhdi9hdmVuY19tcGVnMnZpZGVvLmh0bWw/Z2ktbGFuZ3VhZ2U9YyNh
dmVuY19tcGVnMnZpZGVvOm1heHJhdGUNCg0KKkdldCAicGFja2V0IHNpemVzIiBvZiB2aWRlbyBz
dHJlYW06Kg0KZmZwcm9iZSAtaGlkZV9iYW5uZXIgLXNlbGVjdF9zdHJlYW1zIHYgLXNob3dfZW50
cmllcyBwYWNrZXQ9ZmxhZ3Msc2l6ZSAtb2YgY29tcGFjdCB2aWRlby5hdmkNCg0K
