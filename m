Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0F6F18510F
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 22:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgCMVZI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 17:25:08 -0400
Received: from mail-eopbgr1400104.outbound.protection.outlook.com ([40.107.140.104]:7584
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726620AbgCMVZH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 17:25:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfdNp7K5u7DSLaW5xamgoRUJA+YP8Z2wEqN/GLcIajh66RISA1jTnsdwNJ7EUflNvkwRAp3QOQFFQ7218LcCySnKn4AlofoyLTFTBIbkYs+z0qPWhjckPVrqBU6jVvFplCvQFr/ZOz7PSPunCrJ7eDrjUkxs+BeNthjDX/4khj6SHWHwG6xHveeA0eSASfgT/5ml9hdmqoiCXvwBnomQdyUbiQBFC+UBX7aaMVs2hSrwomlNQ2K4SBP0v/U7NoE3qjg1QCi2LfWoexkXWxCwEyvdEamwk2vgvdZH03bAfiVTW9PzuqqXQ43fHhoASqXAucjvGD7UH88tfe2f4vj0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7JRhV6s3kKwhiv15ix+AGBH3k/HQHmucCnPKIIctFk=;
 b=Xm0nJD96+rSBth7MjM8g+oZmnFdhgn0aBI74CULn9BRVd69hZzZ2oNRDuI5o4ybN+bwMRLRXtVbSl+Dim0Sk49w3YmwxGyzTPmrFeGj5zLo7i82gfcTF3cTHMWP9l5ZpNtGCcR0vLpcZhoVVzbeXg56jJiS6OF0YIo8KXnXshFzdudTXVAKUJCbh2K8HmP0r7YaU5lKEcZVC1c7a6Oouj28fXE8l3WAOcYOXFqV+WCe+AOPyMVqPE/xqEY7BMloRsfWiiR/fOjnWOOjVTaq27toA+72mbq0DzVlmkkeyB+1Ddy/sdFVUfOXipD8Lc37AGmF9Hk2w5WRJZiqw7gSwgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7JRhV6s3kKwhiv15ix+AGBH3k/HQHmucCnPKIIctFk=;
 b=PrQmO1N8ztin8zSUCdbJHmW3CABa54pAHpFE/S+6RALHOTChKP/UYPDyfd0eBrOtM2HJhu9/2lDtEg7MwrhEHC+0etRvbL3y7cXYXPQ/TI5SmU/x1G0HkCd2Wfeca29zwf8CFAdvEm82jC37ZVbFAwN5XJrYgmoAdpZ96AliIlY=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB3014.jpnprd01.prod.outlook.com (52.134.254.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13; Fri, 13 Mar 2020 21:25:01 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::6df0:eb47:a259:b94b]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::6df0:eb47:a259:b94b%7]) with mapi id 15.20.2793.018; Fri, 13 Mar 2020
 21:25:01 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 1/4] media: dt-bindings: media: i2c: Switch to
 assigned-clock-rates
Thread-Topic: [PATCH v3 1/4] media: dt-bindings: media: i2c: Switch to
 assigned-clock-rates
Thread-Index: AQHV+Xwm6MhU9NdxpEy/88ufjKFO7qhHB2QAgAAAj+A=
Date:   Fri, 13 Mar 2020 21:25:01 +0000
Message-ID: <OSBPR01MB35905D6D72DCBF154FCF7C88AAFA0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584133954-6953-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200313212012.GL4751@pendragon.ideasonboard.com>
In-Reply-To: <20200313212012.GL4751@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 182d8207-d814-4cc6-dd1a-08d7c794fd50
x-ms-traffictypediagnostic: OSBPR01MB3014:
x-microsoft-antispam-prvs: <OSBPR01MB30145F9B2DAD635F031462D0AAFA0@OSBPR01MB3014.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 034119E4F6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(199004)(316002)(54906003)(186003)(71200400001)(7416002)(6916009)(86362001)(55016002)(26005)(4326008)(8936002)(478600001)(8676002)(64756008)(52536014)(5660300002)(9686003)(6506007)(76116006)(66946007)(66446008)(53546011)(66556008)(81156014)(2906002)(7696005)(81166006)(33656002)(66476007);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3014;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9Qz9ZA7REl0qVYGagVB5WnZLhSSFhpueQSFsurC0AlPOmdccYKML1rY7ASnGe8Qx5njsJ8nlgBfeiVLj2JuF5Y0IPU+JVcvHVNFOpE+70V0ewg65xoh2+ZOXutHX7cIa2L/7edWCAlBb+ZUjs+jlemujQ3E7qHjicwHrlRNmxqXOny5K7ioAZx+08+E2qDI2YV6/zCxz93dodHUfZQb/gDMZ5SVw+tQlCvdkq42S3jqNZ0q4y/5KzaQJ3WKMQMpe4ZyxgyQjd84/GT2+ySxz2F3PDJn5YUi1+darDtZnrMBbniHGh0/KiM/DNaQjGXUVMm/kWGFij9LD03Fd+wWov8Ps3Zu3X66gNPowybPoKXll9vwR4rrfo/45YnbUB55vSMmWg/D6yz+cieysAUudYYbRcDa6gFN6vYN8M4nweqks3r59/uVzwxB9e/Q8opt7
x-ms-exchange-antispam-messagedata: bAbAe8SCvGtm9dZuvfI4Ed3HPZuj88KBX1hkGW5DDbgE/aNBPB87Cgy9my7qBXJIpYrhPSyDzbPC4O+Kzvo3EqvXWRQIsDCJVtjtQepDe/1uZoT4iLez19yWAq9hapFj2icf07Jl1a8G1fsiRf8XBg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 182d8207-d814-4cc6-dd1a-08d7c794fd50
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2020 21:25:01.3867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zk4CGtvNrkt64xNwvQDdjAPlaZhUhjjHEa7g74cu5+UDtr2hiQqw/uedyr73BBQg4ZY3FbvighMJOyB3V1AzuvWDghkaZGqdHLAv5YzoZYAh+l/rhQBN6/u2HCGI98u1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3014
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB0aGUgcXVpY2sgcmV2aWV3Lg0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2VudDogMTMgTWFyY2ggMjAyMCAyMToyMA0K
PiBUbzogUHJhYmhha2FyIE1haGFkZXYgTGFkIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAu
cmVuZXNhcy5jb20+DQo+IENjOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVs
Lm9yZz47IFNoYXduIEd1bw0KPiA8c2hhd25ndW9Aa2VybmVsLm9yZz47IFNhc2NoYSBIYXVlciA8
cy5oYXVlckBwZW5ndXRyb25peC5kZT47DQo+IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJu
ZWxAcGVuZ3V0cm9uaXguZGU+OyBSb2IgSGVycmluZw0KPiA8cm9iaCtkdEBrZXJuZWwub3JnPjsg
TWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT47IFNha2FyaQ0KPiBBaWx1cyA8c2Fr
YXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT47IE5YUCBMaW51eCBUZWFtIDxsaW51eC1pbXhAbnhw
LmNvbT47DQo+IE1hZ251cyBEYW1tIDxtYWdudXMuZGFtbUBnbWFpbC5jb20+OyBFemVxdWllbCBH
YXJjaWENCj4gPGV6ZXF1aWVsQGNvbGxhYm9yYS5jb20+OyBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPjsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXJlbmVzYXMtDQo+IHNvY0B2Z2VyLmtlcm5l
bC5vcmc7IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT47IGxpbnV4LQ0KPiBtZWRp
YUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEvNF0gbWVkaWE6IGR0LWJpbmRpbmdzOiBtZWRpYTog
aTJjOiBTd2l0Y2ggdG8NCj4gYXNzaWduZWQtY2xvY2stcmF0ZXMNCj4NCj4gSGkgUHJhYmhha2Fy
LA0KPg0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4NCj4gT24gRnJpLCBNYXIgMTMsIDIw
MjAgYXQgMDk6MTI6MzFQTSArMDAwMCwgTGFkIFByYWJoYWthciB3cm90ZToNCj4gPiBVc2UgYXNz
aWduZWQtY2xvY2stcmF0ZXMgdG8gc3BlY2lmeSB0aGUgY2xvY2sgcmF0ZS4gQWxzbyBtYXJrDQo+
ID4gY2xvY2stZnJlcXVlbmN5IHByb3BlcnR5IGFzIGRlcHJlY2F0ZWQuDQo+DQo+IEkgd291bGQg
cGhyYXNlIGl0IHRoZSBvdGhlciB3YXkgYXJvdW5kLCB0aGlzIHBhdGNoIG1haW5seSBkZXByZWNh
dGVzIGNsb2NrLQ0KPiBmcmVxdWVuY3ksIGFuZCBhcyBhIHNpZGUgZWZmZWN0IHJlY29tbWVuZHMg
dXNhZ2Ugb2YgYXNzaWduZWQtY2xvY2stcmF0ZXMuDQo+DQo+ICJEZXByZWNhdGUgdXNhZ2Ugb2Yg
dGhlIGNsb2NrLWZyZXF1ZW5jeSBwcm9wZXJ0bHkuIFRoZSBwcmVmZXJyZWQgbWV0aG9kDQo+IHRv
IHNldCBjbG9jayByYXRlcyBpcyB0byB1c2UgYXNzaWduZWQtY2xvY2stcmF0ZXMuIg0KPg0KQWdy
ZWVkIHdpbGwgZG8gdGhhdC4NCg0KPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHBy
YWJoYWthci5tYWhhZGV2LQ0KPiBsYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4g
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvb3Y1NjQ1LnR4dCB8
IDUgKysrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvaTJjL292NTY0NS50eHQNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZWRpYS9pMmMvb3Y1NjQ1LnR4dA0KPiA+IGluZGV4IDcyYWQ5OTIuLmU2MmZl
ODIgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL2kyYy9vdjU2NDUudHh0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL2kyYy9vdjU2NDUudHh0DQo+ID4gQEAgLTgsNyArOCw3IEBAIFJlcXVpcmVk
IFByb3BlcnRpZXM6DQo+ID4gIC0gY29tcGF0aWJsZTogVmFsdWUgc2hvdWxkIGJlICJvdnRpLG92
NTY0NSIuDQo+ID4gIC0gY2xvY2tzOiBSZWZlcmVuY2UgdG8gdGhlIHhjbGsgY2xvY2suDQo+ID4g
IC0gY2xvY2stbmFtZXM6IFNob3VsZCBiZSAieGNsayIuDQo+ID4gLS0gY2xvY2stZnJlcXVlbmN5
OiBGcmVxdWVuY3kgb2YgdGhlIHhjbGsgY2xvY2suDQo+ID4gKy0gY2xvY2stZnJlcXVlbmN5IChk
ZXByZWNhdGVkKTogRnJlcXVlbmN5IG9mIHRoZSB4Y2xrIGNsb2NrLg0KPg0KPiBJIHdvdWxkIGRy
b3AgdGhpcyBjb21wbGV0ZWx5LiBEcml2ZXJzIG5lZWQgdG8gZW5zdXJlIGJhY2t3YXJkIGNvbXBh
dGliaWxpdHksDQo+IGJ1dCBEVCBiaW5kaW5ncyBzaG91bGQgb25seSBkb2N1bWVudCB0aGUgbGF0
ZXN0IHZlcnNpb24sIHRoZSBoaXN0b3J5IGlzDQo+IGF2YWlsYWJsZSBpbiBnaXQuDQo+DQpTdXJl
IHdpbGwgZHJvcCBpdC4NCg0KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPg0KPiBXaGlsZSBhdCBpdCwgY2FuIEkgZW5s
aXN0IHlvdSB0byBjb252ZXJ0IHRoZXNlIGJpbmRpbmdzIHRvIHlhbWwgPyA6LSkNCj4NClN1cmUg
d2lsbCBkbyB0aGUgaG9ub3VycyDwn5iKLCB3aWxsIG1ha2Ugc3VyZSB5YW1sIHBhdGNoIGlzIG9u
dG9wIG9mIHRoaXMgcGF0Y2ggdG9vLg0KDQpDaGVlcnMsDQotLVByYWJoYWthcg0KDQo+ID4gIC0g
ZW5hYmxlLWdwaW9zOiBDaGlwIGVuYWJsZSBHUElPLiBQb2xhcml0eSBpcyBHUElPX0FDVElWRV9I
SUdILiBUaGlzDQo+IGNvcnJlc3BvbmRzDQo+ID4gICAgdG8gdGhlIGhhcmR3YXJlIHBpbiBQV0RO
QiB3aGljaCBpcyBwaHlzaWNhbGx5IGFjdGl2ZSBsb3cuDQo+ID4gIC0gcmVzZXQtZ3Bpb3M6IENo
aXAgcmVzZXQgR1BJTy4gUG9sYXJpdHkgaXMgR1BJT19BQ1RJVkVfTE9XLiBUaGlzDQo+ID4gY29y
cmVzcG9uZHMgdG8gQEAgLTM3LDcgKzM3LDggQEAgRXhhbXBsZToNCj4gPg0KPiA+ICBjbG9ja3Mg
PSA8JmNsa3MgMjAwPjsNCj4gPiAgY2xvY2stbmFtZXMgPSAieGNsayI7DQo+ID4gLWNsb2NrLWZy
ZXF1ZW5jeSA9IDwyNDAwMDAwMD47DQo+ID4gK2Fzc2lnbmVkLWNsb2NrcyA9IDwmY2xrcyAyMDA+
Ow0KPiA+ICthc3NpZ25lZC1jbG9jay1yYXRlcyA9IDwyNDAwMDAwMD47DQo+ID4NCj4gPiAgdmRk
ZG8tc3VwcGx5ID0gPCZjYW1lcmFfZG92ZGRfMXY4PjsNCj4gPiAgdmRkYS1zdXBwbHkgPSA8JmNh
bWVyYV9hdmRkXzJ2OD47DQo+DQo+IC0tDQo+IFJlZ2FyZHMsDQo+DQo+IExhdXJlbnQgUGluY2hh
cnQNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBHbWJILCBHZXNjaGFlZnRzZnVlaHJl
ci9QcmVzaWRlbnQ6IENhcnN0ZW4gSmF1Y2gsIFNpdHogZGVyIEdlc2VsbHNjaGFmdC9SZWdpc3Rl
cmVkIG9mZmljZTogRHVlc3NlbGRvcmYsIEFyY2FkaWFzdHJhc3NlIDEwLCA0MDQ3MiBEdWVzc2Vs
ZG9yZiwgR2VybWFueSwgSGFuZGVsc3JlZ2lzdGVyL0NvbW1lcmNpYWwgUmVnaXN0ZXI6IER1ZXNz
ZWxkb3JmLCBIUkIgMzcwOCBVU3QtSUROci4vVGF4IGlkZW50aWZpY2F0aW9uIG5vLjogREUgMTE5
MzUzNDA2IFdFRUUtUmVnLi1Oci4vV0VFRSByZWcuIG5vLjogREUgMTQ5Nzg2NDcNCg==
