Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F417064072C
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 13:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233572AbiLBMvO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 07:51:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231929AbiLBMvM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 07:51:12 -0500
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2045.outbound.protection.outlook.com [40.107.13.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1692A5546
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 04:51:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRiEVQ37uObwV3ioJaiE5zJqO/Tn65Ab93IcQntVdYjZcPpAon+H0VYO+0W/Zx4dntxY0s6k01gRcAObwgY/vgM8l7FvABe6tgmKhifzGV4MiDs+csoLUxnf1ExllqQqo47934HGSEZnortFuIchXkNNH7ERb6cYWNZ3RRvYZ0k8XhvGid2bWzbgMxITNFkKsmStxB0Iu5osWovip4xbOOn0nADh/sVnRgFQHAsAJLnjr3ncH0FtoF8ywBWv5wT0wkWIOU/bPWev47mp1mNueywCCN8e30HMPnpgfNVH8tUA21z6f9xHGoDWY6yUYrV2hC4vGrSndDTWRfaSGtkXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqrUKuEHEjqntq02wxryvys1Lk0Ueg6gDdhiBC7f5V8=;
 b=n8Zn20xlasfw9S8PaIby22le90xxNfMFjJdn2EUeHq1DVfcPcyxCfzVHAseeTTZF8o/E7+YWTD5heeAv06YtV91zKqP+GweFqZXm9G24w7SJizvIw1VwgQZZYY+5TOYfkLZc7tJaYMAciw/Q44PvY4KDgl0rHiWOTMLeqy9vWLDgTrdQSCdyUzr2Ks7eXAv/b31uM+mgoUw/TONdOOKUcgqjkODKPUHABhGecc81w94VjsOLyiHf5TJc1zR/rFvydX+f7Gcxq5ts0QU+e2/KUXHvYxGrotEc6f1f2eZW1hDKtwfT2KppmgU9oEA53AVEg/vMqIlGjdYN7CKBr3kWlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqrUKuEHEjqntq02wxryvys1Lk0Ueg6gDdhiBC7f5V8=;
 b=Oqz9p6nY8jgtrmGxjK2SU01ZYH1FTtZmud54O1sSHpGlA4pjjthbKDEPvRWxbj/PUz8m1QftvYaW6wNhXPDUh3FnxJm9qbGGFD3qVDRUwBSYTkgUCEpGAn6UY7kC0nD+mrE0LDNj51Y5VMckoNjMXCWe/b880MBpc+NCSFHGsks=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB8PR04MB7004.eurprd04.prod.outlook.com (2603:10a6:10:11c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Fri, 2 Dec
 2022 12:51:07 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d355:6f96:866e:b857]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d355:6f96:866e:b857%3]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 12:51:07 +0000
From:   "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "jacopo@jmondi.org" <jacopo@jmondi.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Subject: RE: [PATCH] media: ov5640: report correct frame rate to user
Thread-Topic: [PATCH] media: ov5640: report correct frame rate to user
Thread-Index: AQHZBjqs+HWSIeW/wEGXkychLnAPTa5acDyAgAAE+OA=
Date:   Fri, 2 Dec 2022 12:51:07 +0000
Message-ID: <AS8PR04MB90800323EE89C16CAC1BD585FA179@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20221202104250.2634726-1-guoniu.zhou@oss.nxp.com>
 <Y4nck1V4ScHOAtCN@pendragon.ideasonboard.com>
In-Reply-To: <Y4nck1V4ScHOAtCN@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|DB8PR04MB7004:EE_
x-ms-office365-filtering-correlation-id: db916ee4-be8e-4084-7b30-08dad463e168
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wxqTVJeX89zpR5ypVKRnICj6oettJMh1ekPxMfl+sAaQWPhKY1y7tWSdpCUoSh5DXauKBy3MLFWmF0UTtKta9ulXcgpYopD7oIGVR7gK7Qy7liPvW/GHDkTCfEZ+Gruuqyv15zPXE1dawN1TV8sjJLu6AYVSPitEzBhTWTMNwFvf8rgj4Z9MI6FH3ELJsd480vayiwV7VQr0R+36CXHn/8qJu9MYRRCPW+KbREsEpeNu6TAs424WzoLHj7495GVTje9SKeabVW9CuyG/6NgOo1QSu+yu7WQdRFztL+F1h2i/dK6vkDqSp9zN2QnwW2MAtpPzo0Kfx2r9PPJd4StdTRv+K8LqsfBI/BXKT1vNO7nIWrwwJ2RjA4i34si10CHmGFXes4hWLVaknK7D+HQCQAnmm3oLIX/ReKYS8XYbIhBG0uQD9qVrAG1nU0EKfGkH9tSiufTqdyo5PorzfGJClXhmFVXcsP9pCnMAM/M+UP+ebDocEcbYsZqa5LVY86ThiYrSk0lw701eeh7I+FIu8wIoerVZRez4onumC1z2kbPN1HZ14CMupaKFVrvOXW8x5Ik/MZcCeM2MbHd3LcnfcX4GXydekZXJWjThAyVlvaMfGFGrn8wAWerPHAJVq7Qln9es1ugHlyy4O/4JOfrEMsffwvpV/9yg6Sxon++yuMTX7lhN579EAuwp4u93e0bY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199015)(4326008)(8676002)(41300700001)(66556008)(66446008)(76116006)(66946007)(5660300002)(64756008)(66476007)(55016003)(38100700002)(122000001)(52536014)(8936002)(71200400001)(54906003)(110136005)(38070700005)(83380400001)(316002)(2906002)(186003)(53546011)(9686003)(478600001)(6506007)(7696005)(26005)(86362001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGRnRnpWV0RHTVU3bmZ0NjQxTDMyRXY3NFYyVHQ4Wkh0VmhIVzhvVjIzdytr?=
 =?utf-8?B?ZFQvNmltT0w1L2hVdmZaUjZUSmo5dWhCTS85UUcvalNHSmlKRW9wZ0d2Tmts?=
 =?utf-8?B?UXEwMzhIajcrTXdMTVIxczd6M2hIdkl4NFJRKy9EVlNzd2xmNlRIVEI3SXVU?=
 =?utf-8?B?NENvTFI0ZXZtT0pBdHFxdmEranRmeElvY0ZVaVIvSFBSeDhjdzdseUg2NFRP?=
 =?utf-8?B?bWU0aDFBWkpiVW9qY2RjeUpMR3ZISkV5QzNKbDVrZnlXRkFHZC9WaUd3R2pm?=
 =?utf-8?B?b3diVGk4N29GUVJpWklTcWlUZy9oRUJyNEV2dUYrb0dIUEc2RjBHa1g2VnVw?=
 =?utf-8?B?MWNJTFZIa1pPZUVGK3VINkRrVzM5elZzUDR1WlhYT3lhZmxHVUJVV3kzeSs5?=
 =?utf-8?B?TTN5VVZyRFM3TnVlS3VBUG1PTmNIWi90YWpqQnBvNFZ3b1hBL2hpeXN5SVhQ?=
 =?utf-8?B?Tml4M3JWWTIwZm5BMDNMdVJoeVprMnJXUjR2U3dFbk43SXZETEk5eDBOeWEz?=
 =?utf-8?B?Ly81a251bjExT2IxM2hNTHJ4REMxVjVWbllBYXVXdkhsTUVtRUoyQnB0UWZv?=
 =?utf-8?B?aERoQUQveFFmVGZKcUZyRWNxM1Q2K2dYcm96WTBIMk5HTVg2MlVOR1poNW9U?=
 =?utf-8?B?ZS9WNENrem56dTF2S1d2UmVHcFZSMEFrNHBPN0dZUHYwekU0WXVjbmFEUzhr?=
 =?utf-8?B?ZkNGTitwT0VjTlYrNW1acjFuWTFOWkhGRllBYlArSnd1YmpldUU2dnliUGg4?=
 =?utf-8?B?Tlp2cVgwTFdSZ3pFb1pQdnU1U1cyMUpIdkUzTThTNkZSWkhPMXJLWURWUHYy?=
 =?utf-8?B?WGlXMExYcHBDcml0MXNlOWNZTnI3VDN5SFluSmJ4eFR1OFpJamQ4Ly9hdkE3?=
 =?utf-8?B?NjBkT0NkMjlOV0hWNHE5TnV1Nm5Ubk04MjdSRkM5aTZ6VlZvMTFzK2g3My9r?=
 =?utf-8?B?WnlqclhUZWlXYTJrUGpLckpqZHdxZnBWMFhjL1N5c3UzaTRnck15UGJFM3Ri?=
 =?utf-8?B?MXVTcGxOOUQ5YldzdmY1bjdWNDc4bnlqeUp2OGRLclBoaGplUHByNlphVnVN?=
 =?utf-8?B?VTNVNnV6ZXJOcmlxZlNqeHo3b3hVaFppckp4bDdwMlNaLzkrZ2dKbUJnYVJy?=
 =?utf-8?B?RG1vN0lKNkkxNG9uU09Nc2xmaFk2T0FSbHBBTTI0bUdDaDZPNktyMzVxWDVI?=
 =?utf-8?B?ZjU1eUR1dzhWVjBmYnpIZmJBTjczY3ozY2JFZDhqVWs1ZWxiN25IaUh1Z2hs?=
 =?utf-8?B?bWFWazBoLzFNZ3VQY0pHNVhwUWh6WEN5K1h4S2tuaVRISUhFdE5pa21HdkZs?=
 =?utf-8?B?amw4RjU5ZXRUdW82R1FiYS9ERnhJUmF0N2piekJXczVRa29pWllDZDk3Zmxu?=
 =?utf-8?B?Yk8rOCt6OHJBaDYraWZTdFgrNis2VGN3cUVuNEl1U2VzVDF2WEFjN1QzMFlQ?=
 =?utf-8?B?QmxkTnNzeml2MHE0RjBJK2RBemNsMGV1THJmcEVPVnB3SlBEMmxsY2kwblFy?=
 =?utf-8?B?dGoyUUNkYloxdVhsVVdPdGk1Uk44Y004ZWlIbEtlZW5zcHllTHRCWVVxY0tj?=
 =?utf-8?B?L05nMDdRbVozZG9wL2VlQzE3SjZrYS9JMmg4TVl0cjA4NllOU2tlVFd5bTdM?=
 =?utf-8?B?djdPSVNRUkhONXBvWDFkbUJRR2tsOGc3SjdEV2FIMWM3eUZYVDFTMWc0SUxm?=
 =?utf-8?B?WkFnakRQdVBGQzROUnpoWmV0MUo4b1BwYkxIWWJhR1lIMEdpNGxzd3N3d3FT?=
 =?utf-8?B?dkc4Wi94OFQyeUcwZDFKMEt5Zkw3YTlMaWpkZ085eWRaWDNKU01yM1RhMmJl?=
 =?utf-8?B?WTkwMjdaWjU3eHFjK1JhRUZFQ1JtSHUrSHloa21xM3U5NGErNmZWam9LWmhY?=
 =?utf-8?B?aVJjazFVRkRHR0VoSmRWSjdsaUd6cTdvWnhndW5aN3FhRWJlUVB1RDVhVktl?=
 =?utf-8?B?WUlRYWM5K3JmUVZpcTV3T2VoWWFFSzRLcXpjMXBybTl6dnBkY1NkVUhib253?=
 =?utf-8?B?S2cyVnowcHN4MStaWkhudVFSQWg4WHBWQmFKQzhJZUJHQ0E2K1hPYmxvbVUv?=
 =?utf-8?B?R29uNjZsaDNibENmdmRQa1dqYzIzUXgycjYzYXNEaTgzb1MvNngwL0VIQnZH?=
 =?utf-8?Q?b63otiTcdlvGeoasToEauDWJv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db916ee4-be8e-4084-7b30-08dad463e168
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 12:51:07.4761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RUXhuQRFhd7rDxNaBnzkviq8S9mN1AuCxhiA3LBvVpXL3bgEQa1u75+jcYLWaKoQo8DYh+Dj3ltKB0ZtnByOUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7004
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTGF1cmVudCBQaW5jaGFydCwNCg0KVGhhbmsgeW91IGZvciB5b3UgcmVwbHlpbmcgYW5kIHF1
aWNrIHJldmlld2luZy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBM
YXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNl
bnQ6IDIwMjLlubQxMuaciDLml6UgMTk6MDgNCj4gVG86IEcuTi4gWmhvdSAoT1NTKSA8Z3Vvbml1
Lnpob3VAb3NzLm54cC5jb20+DQo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IHNs
b25nZXJiZWFtQGdtYWlsLmNvbTsNCj4gbWNoZWhhYkBrZXJuZWwub3JnOyBqYWNvcG9Aam1vbmRp
Lm9yZzsgc2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENI
XSBtZWRpYTogb3Y1NjQwOiByZXBvcnQgY29ycmVjdCBmcmFtZSByYXRlIHRvIHVzZXINCj4gDQo+
IEhpIEd1b25pdSBaaG91LA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBP
biBGcmksIERlYyAwMiwgMjAyMiBhdCAwNjo0Mjo1MFBNICswODAwLCBHLk4uIFpob3UgKE9TUykg
d3JvdGU6DQo+ID4gRnJvbTogIkd1b25pdS56aG91IiA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4g
Pg0KPiA+IEluIGNvbW1pdCAzMTQ1ZWZjZGI0ZDAgKCJtZWRpYTogb3Y1NjQwOiBSZXdvcmsgdGlt
aW5ncyBwcm9ncmFtbWluZyIpLA0KPiA+IGl0IGRlZmluZXMgbWF4X2ZwcyBmaWVsZCBpbiBvdjU2
NDBfbW9kZV9pbmZvIHN0cnVjdHVyZSB0byBzdG9yZQ0KPiA+IG1heGltdW0gZnJhbWUgcmF0ZSBz
dXBwb3J0ZWQgYnkgZWFjaCBtb2RlLiBCdXQgaW4NCj4gPiBvdjU2NDBfdHJ5X2ZyYW1lX2ludGVy
dmFsKCksaXQNCj4gDQo+IHMvLGl0LywgaXQvDQo+IA0KPiA+IGFzc3VtZXMgdGhlIG1heGltdW0g
ZnJhbWUgcmF0ZSBzdXBwb3J0ZWQgYnkgYWxsIG1vZGVzIGlzIDYwLiBCdXQNCj4gPiBhY3R1bGx5
LA0KPiANCj4gcy9hY3R1bGx5L2FjdHVhbGx5Lw0KPiANCj4gPiBvbmx5IFZHQSBzdXBwb3J0IGl0
LiBGb3Igb3RoZXJzLCB0aGUgbWF4aW11bSBmcmFtZSByYXRlIHN1cHBvcnRlZCBpcyAzMC4NCj4g
PiBTbyBjb3JyZWN0IGl0IGJ5IHRha2luZyB0aGUgbWF4aW11bSBmcmFtZSByYXRlIHN1cHBvcnRl
ZCBieSBlYWNoIG1vZGUNCj4gPiBhcyB0aGUgaW5pdGlhbGl6YXRpb24gdmFsdWUgb2YgdGhlIGxv
Y2FsIHZhcmlhYmxlIG1heGZwcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b25pdS56aG91
IDxndW9uaXUuemhvdUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21lZGlhL2kyYy9v
djU2NDAuYyB8IDggKysrKysrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2ky
Yy9vdjU2NDAuYyBiL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0MC5jDQo+ID4gaW5kZXggM2Y2ZDcx
NWVmYTgyLi5hMzk2ZjNlYWYwNTQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9pMmMv
b3Y1NjQwLmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAuYw0KPiA+IEBAIC0y
NzIyLDEzICsyNzIyLDE3IEBAIHN0YXRpYyBpbnQgb3Y1NjQwX3RyeV9mcmFtZV9pbnRlcnZhbChz
dHJ1Y3QNCj4gb3Y1NjQwX2RldiAqc2Vuc29yLA0KPiA+ICAJaW50IG1pbmZwcywgbWF4ZnBzLCBi
ZXN0X2ZwcywgZnBzOw0KPiA+ICAJaW50IGk7DQo+ID4NCj4gPiArCW1vZGUgPSBvdjU2NDBfZmlu
ZF9tb2RlKHNlbnNvciwgd2lkdGgsIGhlaWdodCwgZmFsc2UpOw0KPiA+ICsJaWYgKCFtb2RlKQ0K
PiA+ICsJCXJldHVybiAtRUlOVkFMOw0KPiANCj4gVGhlcmUgYXJlIHR3byBjYWxsZXJzIG9mIHRo
aXMgZnVuY3Rpb24sIG92NTY0MF9lbnVtX2ZyYW1lX2ludGVydmFsKCkgYW5kDQo+IG92NTY0MF9z
X2ZyYW1lX2ludGVydmFsKCkuIFRoZSBsYXR0ZXIgYWxyZWFkeSBoYXMgYSBtb2RlIHBvaW50ZXIg
KHRha2VuIGZyb20NCj4gc2Vuc29yLT5jdXJyZW50X21vZGUpLiBJIHdvdWxkIHRodXMgbW92ZSB0
aGUgb3Y1NjQwX2ZpbmRfbW9kZSgpIGNhbGwgdG8NCj4gb3Y1NjQwX2VudW1fZnJhbWVfaW50ZXJ2
YWwoKSwgYW5kIHBhc3MgdGhlIG1vZGUgdG8NCj4gb3Y1NjQwX3RyeV9mcmFtZV9pbnRlcnZhbC4N
Cj4gDQo+IE9uIGEgc2lkZSBub3RlLCB0aGUgb3Y1NjQwX2ZpbmRfbW9kZSgpIGNhbGwgaW4gb3Y1
NjQwX3NfZnJhbWVfaW50ZXJ2YWwoKSBhZnRlcg0KPiBvdjU2NDBfdHJ5X2ZyYW1lX2ludGVydmFs
KCkgc2VlbXMgdW5uZWVkZWQgdG8gbWUsIGl0IGxvb2tzIGxpa2UgaXQgY291bGQgYmUNCj4gZHJv
cHBlZCAoaW4gYSBzZXBhcmF0ZSBwYXRjaCkuDQo+IA0KPiA+ICsNCj4gPiAgCW1pbmZwcyA9IG92
NTY0MF9mcmFtZXJhdGVzW09WNTY0MF8xNV9GUFNdOw0KPiA+IC0JbWF4ZnBzID0gb3Y1NjQwX2Zy
YW1lcmF0ZXNbT1Y1NjQwXzYwX0ZQU107DQo+ID4gKwltYXhmcHMgPSBvdjU2NDBfZnJhbWVyYXRl
c1ttb2RlLT5tYXhfZnBzXTsNCj4gPg0KPiA+ICAJaWYgKGZpLT5udW1lcmF0b3IgPT0gMCkgew0K
PiA+ICAJCWZpLT5kZW5vbWluYXRvciA9IG1heGZwczsNCj4gPiAgCQlmaS0+bnVtZXJhdG9yID0g
MTsNCj4gPiAtCQlyYXRlID0gT1Y1NjQwXzYwX0ZQUzsNCj4gPiArCQlyYXRlID0gbW9kZS0+bWF4
X2ZwczsNCj4gPiAgCQlnb3RvIGZpbmRfbW9kZTsNCj4gPiAgCX0NCj4gPg0KPiANCj4gLS0NCj4g
UmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg==
