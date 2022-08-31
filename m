Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAF4B5A814B
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 17:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231742AbiHaPch (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 11:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbiHaPcg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 11:32:36 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2093.outbound.protection.outlook.com [40.107.114.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6973ABF2F;
        Wed, 31 Aug 2022 08:32:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3fCOzKuHtl8sHZWDjCk5fbFmev0nQW/hr9zukgiy4ySyU0PUQcQ+hH0UHWtBfs1VhoaVIVAojmkT5T54JeUHLDsX3zpytVSNGioU0lBFPcw51eL+GggsE7f3oFP5AfB1TxqWxOdOdot92NYd0FI6KK0LVJ8WYkL70lB0uvAzWACg7rjlIb3lfHcYhYToF5m/wRJiiZQ0LuP09W3v4Qgd2KzJKHSwraZ9GBFRFYb3fPl99xTFR+TXggEU7Csr9s5N9t0NWdhi49thAzPJQvRJVQpYEUNLDSJkgdFXSD38y/doFRtBVirnGwP/XxEZYrrrBJU/alwUhtaMY4uHeLf6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohDmAaYEX66dBctlpaQO0rGAEHGIKr3HMyiqOkwx3TM=;
 b=BIJyRK4jRLXkXm+yrm18nEfDDY2hntE1Im2ipxz2D0xrcHr850erimnsA4sLj45rQSIcsDmS2soKpX+1Nod2TV/pmeeRoyKjkqSY9RYGtG0jaV0sc3fP7vUOg0qQdqY+JU4xFwXAs2Y+yy2PwfmG+hl1aX472dkfB/iuxUE7yZRL7RGT7YmXgXpCmKdVYLTAlIR8iIL3A6vzsIVTOFIGYrkQVIgJZ5onJqgOUZ7OS1q5li35vm4H4IkGMl8uvAcpQGnCS0A09YhelBhisJgY+FkqAsu+8vrsi1bzS8ALe0NnSyDSjXQUnH5jG7YusvgiCPrzEpqG0+impcP+DP9gcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohDmAaYEX66dBctlpaQO0rGAEHGIKr3HMyiqOkwx3TM=;
 b=oKVrHDToc6k7HmfnTzHGPsGoaYj+VSCUSRJwzBoeJCWzWaA0b9z2y2wBm2Y82Tj1qt2xV1WvxUDN1S8WDzcNVlQE3L5leUdRd8DlhBViia4FfFgc7uWgR+0qQFvMLzyY6hDXi1e6tmkldWkR2cKs1UDJva5zdHPW6RFpF9WBxyM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB2126.jpnprd01.prod.outlook.com (2603:1096:404:6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 31 Aug
 2022 15:32:30 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%4]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 15:32:30 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 1/3] media: dt-bindings: media: renesas,fcp: Document
 RZ/{G2,V2}L FCPVD bindings
Thread-Topic: [PATCH v2 1/3] media: dt-bindings: media: renesas,fcp: Document
 RZ/{G2,V2}L FCPVD bindings
Thread-Index: AQHYvUc3CvHikovqnUm4x8onYIKlqK3JH7sAgAABj5A=
Date:   Wed, 31 Aug 2022 15:32:30 +0000
Message-ID: <OS0PR01MB5922C8F9B25D2F54716CD73086789@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220831143722.2067457-1-biju.das.jz@bp.renesas.com>
 <20220831143722.2067457-2-biju.das.jz@bp.renesas.com>
 <ac6ed365-a44c-6e48-899a-3d692c61b70f@linaro.org>
In-Reply-To: <ac6ed365-a44c-6e48-899a-3d692c61b70f@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a66694e7-0168-4e48-f2e7-08da8b660452
x-ms-traffictypediagnostic: TYAPR01MB2126:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bZTEiQ/7Ncv5K655KX3SUwp4rp33JFrNQwncuqPc4tUT6AYJWk2vDYagqCYXYCjrg3/9Q40Tr5xJvhJu5SF6F1vscijRIwuz7rSwKne2JMvSs10B5cI1aqF5XZ5U+ceEouzQIuLKcJRgY9TbNpIbXtkZqoNzrzsz+sTuDOlNvYTv/A3b/lFWte+G9C39NShsPy5Z+4oywOU4YLock3K4mHfdzKefj9L1h/xaSJl1L/ohCZk44rYjFb7jR8v1RbeNUbFcTAy0C/12PXK1IP44oymbWtQg3Gnss+pXC0MKLPzkdB5HKi1DVO/CpyxRbag/aTRPCF4+upCyas/7wV6AwYLM3EHAIP+1PTrNUoMlM4bQBNMnvsbSQ0Ao9/XDI8jTfU0xoOWXbQ+PHF9gHZo+/gMIeU1KgL3d3jMpJu/sirTqenferolkacprx/hr+Z3+q09yiGiJCHZmqNIXCbRDT/l6ofeWcVJjJ8Znv2aO0QJ0bX6EUCtkICxxvLBEqCbf2aejAkdphVM0gIgqIqnxQ23nzjBd2xYJ6nWELv1OuIVZjJav0312MC5hzNz9ELmzL3aP5c9hMRaxP0R/fH5j77nGSeKD/vy7hX9o46LAeISIxqPTnzOTR9/D5DVBY15cJGR0CNeb68Srv5Ri8bVY2RQihKCZiUXdAf/eF7YrLLx3P2gBojKSbmSRkoT4ZJPC9vOlE3izzCamytyqMh1sj9sHy3jh6I4a7Yx844hDmjD5ekB3DuE6agtje57o5ywboKzF3Cd0P5slhOuSFvPSpSkK3aKFlB6bimUGltifZ4k=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(9686003)(26005)(478600001)(41300700001)(107886003)(7696005)(186003)(6506007)(71200400001)(83380400001)(52536014)(966005)(8936002)(55016003)(66476007)(316002)(53546011)(110136005)(54906003)(5660300002)(2906002)(64756008)(66446008)(8676002)(66946007)(76116006)(4326008)(38070700005)(66556008)(86362001)(33656002)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkdOd1dLOXBYbTFjcVdVMDV5dERXQ2xrbE9RbGtmdGV6VjE1TWZzRzY4dVo2?=
 =?utf-8?B?ZCtOV3pyODhnRHVwbHZta21YQWJNVnpmT0RaL2NiOHJ0MExFUC9qeVd0OGN6?=
 =?utf-8?B?elVDbmM1SGZMNkdmNE9OY0RsN2JuWklWTDVyMTV6dDJ0Q2hURHNMcEJuN00v?=
 =?utf-8?B?cm5aWHVGeldEVmFZZzRmS2t5eDdnQ2Y4NEs2WllrSUdNTFY3RzdUTURjbjRQ?=
 =?utf-8?B?WUNtenJZc2dhZDU1eVI5UG9JKzJDNk03dk9FVnVFNG5IMW9GVHFQb3dpR1Qx?=
 =?utf-8?B?OC9tV1JqZldTdTFZb01oYnYzTTVkUmFwQzc1TlN3cHpzQW1IV0k3WFhLcXJ2?=
 =?utf-8?B?ZmJpL0doMWozeExhaHhRSGZhMTI5QkdJSFB5Nnh0cERSOC9pOFZrc2ROSVRE?=
 =?utf-8?B?ZGVyM2YxbjlEbUFUMVpNdmFSYlg1cGE0ZkErYXFySkI4UDFvdU5WVkdCVTlu?=
 =?utf-8?B?U3VqZFRRckloZ2p3VEU0SWZGcXZVejdVTGZhSjdQdmRUSmZNbW1XODA3MjhQ?=
 =?utf-8?B?dFF3NStnb2VwYnkwdTBaMXo1WGlYbUNQclpJUWtiTE1nS3Jja09DeWNMMmFZ?=
 =?utf-8?B?Q3pIc1VwekxmVmNJY1YySkRlZWhCZ2VnZlNRRjdkQnpzNWtTZ3JWUmYzOHJ0?=
 =?utf-8?B?a2o4clFOcWl1bGpiQVljbDNWd0NvWlQ1aGY5dEt5TUFKQXpZNFJKbUhWbEoz?=
 =?utf-8?B?aU1aRVhPQUhKMjdoV1VKdndFMFJsWjBRVjl5TXNsYXNERnR3TFd2czYzSjh4?=
 =?utf-8?B?Zk52dDRQYjM1QjB5NVB5VTZtYVpkb1AzZ3lvbFg0eWhmd2JkdWlPc0FrMmcv?=
 =?utf-8?B?cUlsdkh3VGEvSkJyaDBnLzlhMVJBN0NjMS81SFl5WndFTEJ4KzZyQmJjUUhN?=
 =?utf-8?B?cklSTkwwU1hidjhDS0VpRCtjQldJUHgzZUR2ek53YWFsV3FrNFlvMGYrNldi?=
 =?utf-8?B?cVp3aU1ZQVYrYWxpNDZlb1dnK2FCUEJmdzQ3WStYRmR5VW1OUTBlakhVVGJB?=
 =?utf-8?B?OFNVNXc5ZVRxcWJGM2Q3QzcxMlh5NGZwT2FnYUtURmNDMDduRi83RHY5dUFV?=
 =?utf-8?B?UFNTVnN0RjAyR2x1M1FqN0lJc01obnYzL01HOEsyYU9TTk1nelY0UlJWOHRP?=
 =?utf-8?B?cVFPcjlodmRhbys1ZGVTM2czdE56dHh0M3h3NW1WRjdpSVByY28xTlpobzNE?=
 =?utf-8?B?ZXpNS0hNS3ZodUlYNWRQWU1sK21ZeHZlN2pQNW55Ym1XRk1KMjNhaXVuSHZt?=
 =?utf-8?B?Kzh5a21aWXVQU0Y5ek1GRTJjNlR4d2FCNTJnclM2eE11MHgyY3N4L0t1Z044?=
 =?utf-8?B?R3ZGOVJYdnlXWHRFY1Vxbk9mdGVycFFaVXlvYzZkKzZIbDhodHRudVNhWXJP?=
 =?utf-8?B?dnlEM3FrMnJ3YzN6Qll1eWJIdG1HVk5LaThmbExjbHBnbjh1RG9FNlYyQkJ2?=
 =?utf-8?B?R2pZd1ZxNDJxSy95dlRNQytzUXFNMStNVkJIYXNUaXduUzZyZzNxRTF2SWZw?=
 =?utf-8?B?YVFYR09uU1YzKytmYnJPUTFaOFNGYXVYMTY1WXRuRmVNSll1b3VZR2NMZjZK?=
 =?utf-8?B?OE5LNStjK0ZqOEpNN00yRHMzUGo2aEZYb1FpVmJkVVFvbitoci8venRwOFQ1?=
 =?utf-8?B?YWpucE5jbzhxODZiWG45R0pEVCtKZ3lJSVQ0eWI0N3Y0eGtVdHlqcmFxR0Np?=
 =?utf-8?B?aG16NDBjQ3hVNWNzaStBdWQ4aWwzSEhXbnFoS2Z2ekE1TmM1UFZhUE9hQmN3?=
 =?utf-8?B?NkFIVWptb2pHdXFxRFBqbythaDlVZHNZc2thWjZwVTJzT2NjN1dmQWZnWXhW?=
 =?utf-8?B?b2dKZFF4Mk40QUxtUWIvNFFERUVVclVpYUZqVVl1V2hBOUV2Ykd4QlhtTVRj?=
 =?utf-8?B?bk1SOWNWYXhHUUE0VlVYY2k2VExyWGtOSFpvN2UyV1VaVGlBcGIrd1N5Vysx?=
 =?utf-8?B?NFIwanFrMk9qQU1CeEljZDJiQVpWREtOK2txQmwzYTYzbnhYRUd3VVdMYits?=
 =?utf-8?B?VUxXOWVMVkpJYmtVUUswd1FuVE1KWjFtN3Q5MU1PSGZwUDI5NHJNR2dyME0v?=
 =?utf-8?B?K1JvMFJNRVIrdzRmZ3hybnQwZXhCSnVzcGgzKzJYanNNdjQvd0JyWjdkWkdI?=
 =?utf-8?B?cHd6blBkeGN1NmFDU2loOVdyaFlhd1Z3ak1zSTMraXJFaXRHRm83citQK3d5?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a66694e7-0168-4e48-f2e7-08da8b660452
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 15:32:30.1191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r72clgQXaALT0kH0s6M/QvHJIEUbyBGAhweE4ZW9E0sXHunh3pRvLkPZPv3+w+HbHz2B3cx/UpMAHZusdQrlCnP2V4uIEKs0rFwPWRV4Syw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2126
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiBTZW50OiAzMSBBdWd1c3Qg
MjAyMiAxNjoyMA0KPiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPjsg
TWF1cm8gQ2FydmFsaG8gQ2hlaGFiDQo+IDxtY2hlaGFiQGtlcm5lbC5vcmc+OyBSb2IgSGVycmlu
ZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mDQo+IEtvemxvd3NraSA8a3J6eXN6dG9m
Lmtvemxvd3NraStkdEBsaW5hcm8ub3JnPg0KPiBDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPjsgbGludXgtDQo+IG1lZGlhQHZnZXIua2VybmVs
Lm9yZzsgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZzsgR2VlcnQgVXl0dGVyaG9ldmVuDQo+IDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT47IENocmlzIFBhdGVyc29uIDxDaHJpcy5QYXRlcnNvbjJAcmVuZXNhcy5jb20+Ow0KPiBC
aWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+OyBQcmFiaGFrYXIgTWFoYWRldiBMYWQN
Cj4gPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MiAxLzNdIG1lZGlhOiBkdC1iaW5kaW5nczogbWVkaWE6IHJlbmVzYXMsZmNw
Og0KPiBEb2N1bWVudCBSWi97RzIsVjJ9TCBGQ1BWRCBiaW5kaW5ncw0KPiANCj4gT24gMzEvMDgv
MjAyMiAxNzozNywgQmlqdSBEYXMgd3JvdGU6DQo+ID4gRG9jdW1lbnQgRkNQVkQgZm91bmQgaW4g
UlovRzJMIGFsaWtlIFNvQ3MuIEZDUFZEIGJsb2NrIGlzIHNpbWlsYXIgdG8NCj4gPiBGQ1AgZm9y
IFZTUCBmb3VuZCBvbiBSLUNhciBTb0MncyAuIEl0IGhhcyAzIGNsb2NrcyBjb21wYXJlZCB0byAx
IGNsb2NrDQo+ID4gb24gZmNwdi4gSW50cm9kdWNlIG5ldyBjb21wYXRpYmxlcyByZW5lc2FzLHI5
YTA3ZzA0NC1mY3B2ZCBmb3INCj4gPiBSWi9HMntMLExDfSBhbmQgcmVuZXNhcyxyOWEwN2cwNTQt
ZmNwdmQgZm9yIFJaL1YyTCB0byBoYW5kbGUgdGhpcw0KPiA+IGRpZmZlcmVuY2UuDQo+ID4NCj4g
PiBUaGUgMyBjbG9ja3MgYXJlIHNoYXJlZCBiZXR3ZWVuIGR1LCB2c3BkIGFuZCBmY3B2ZC4gVXBk
YXRlIHRoZQ0KPiA+IGJpbmRpbmdzIHRvIHJlZmxlY3QgdGhpcy4NCj4gPg0KPiA+IE5vIGRyaXZl
ciBjaGFuZ2VzIGFyZSByZXF1aXJlZCBhcyBnZW5lcmljIGNvbXBhdGlibGUgc3RyaW5nDQo+ID4g
InJlbmVzYXMsZmNwdiIgd2lsbCBiZSB1c2VkIGFzIGEgZmFsbGJhY2suDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0t
DQo+ID4gdjEtPnYyOg0KPiA+ICAqIERvY3VtZW50ZWQgUlove0cyLFYyfUwgRkNQVkQgYmluZGlu
Z3MNCj4gPiAgKiBJbnRyb2R1Y2VzIG5ldyBjb21wYXRpYmxlcyByZW5lc2FzLHI5YTA3ZzB7NDQs
NTR9LWZjcHZkDQo+ID4gICogQWRkZWQgY2xvY2stbmFtZXMgcHJvcGVydHkNCj4gPiAgKiBkZXNj
cmliZWQgY2xvY2tzLg0KPiA+IC0tLQ0KPiA+ICAuLi4vYmluZGluZ3MvbWVkaWEvcmVuZXNhcyxm
Y3AueWFtbCAgICAgICAgICAgfCA0NiArKysrKysrKysrKysrKysrKy0NCj4gLQ0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvcmVuZXNh
cyxmY3AueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L3JlbmVzYXMsZmNwLnlhbWwNCj4gPiBpbmRleCA0M2YyZmVkOGNkMzMuLjc5YTU1Njk0YjJhMiAx
MDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEv
cmVuZXNhcyxmY3AueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9yZW5lc2FzLGZjcC55YW1sDQo+ID4gQEAgLTIxLDE1ICsyMSwyMyBAQCBkZXNj
cmlwdGlvbjogfA0KPiA+DQo+ID4gIHByb3BlcnRpZXM6DQo+ID4gICAgY29tcGF0aWJsZToNCj4g
PiAtICAgIGVudW06DQo+ID4gLSAgICAgIC0gcmVuZXNhcyxmY3B2ICMgRkNQIGZvciBWU1ANCj4g
PiAtICAgICAgLSByZW5lc2FzLGZjcGYgIyBGQ1AgZm9yIEZEUA0KPiA+ICsgICAgb25lT2Y6DQo+
ID4gKyAgICAgIC0gaXRlbXM6DQo+IA0KPiBObyBpdGVtcyBoZXJlLiBZb3UgaGF2ZSBqdXN0IG9u
ZSBpdGVtLCBzbyBpdCBpcyBub3QgYSBsaXN0Lg0KDQpTbyB5b3UgbWVhbiwgaXQgc2hvdWxkIGJl
IGxpa2UgYmVsb3cuDQpDYW4geW91IHBsZWFzZSBjb25maXJtIG15IHVuZGVyc3RhbmRpbmcgaXMg
Y29ycmVjdD8NCg0Kb25lT2Y6DQogICAtIGVudW06DQogICAgICAgLSByZW5lc2FzLGZjcHYgIyBG
Q1AgZm9yIFZTUA0KICAgICAgIC0gcmVuZXNhcyxmY3BmICMgRkNQIGZvciBGRFANCiAgICAtIGl0
ZW1zOg0KICAgICAgICAtIGVudW06DQogICAgICAgICAgICAtIHJlbmVzYXMscjlhMDdnMDQ0LWZj
cHZkICMgUlovRzJ7TCxMQ30NCiAgICAgICAgICAgIC0gcmVuZXNhcyxyOWEwN2cwNTQtZmNwdmQg
IyBSWi9WMkwNCiAgICAgICAgICAgIC0gY29uc3Q6IHJlbmVzYXMsZmNwdiAgICMgZ2VuZXJpYyBG
Q1AgZm9yIFZTUCBmYWxsYmFjaw0KDQoNCj4gPiArICAgICAgICAgICAgICAtIHJlbmVzYXMsZmNw
diAjIEZDUCBmb3IgVlNQDQo+ID4gKyAgICAgICAgICAgICAgLSByZW5lc2FzLGZjcGYgIyBGQ1Ag
Zm9yIEZEUA0KPiANCj4gPiArICAgICAgICAgIC0gZW51bToNCj4gPiArICAgICAgICAgICAgICAt
IHJlbmVzYXMsZmNwdiAjIEZDUCBmb3IgVlNQDQo+ID4gKyAgICAgICAgICAgICAgLSByZW5lc2Fz
LGZjcGYgIyBGQ1AgZm9yIEZEUA0KPiA+ICsNCj4gPiArICAgICAgLSBpdGVtczoNCj4gPiArICAg
ICAgICAgIC0gZW51bToNCj4gPiArICAgICAgICAgICAgICAtIHJlbmVzYXMscjlhMDdnMDQ0LWZj
cHZkICMgUlovRzJ7TCxMQ30NCj4gPiArICAgICAgICAgICAgICAtIHJlbmVzYXMscjlhMDdnMDU0
LWZjcHZkICMgUlovVjJMDQo+ID4gKyAgICAgICAgICAtIGNvbnN0OiByZW5lc2FzLGZjcHYgICAj
IGdlbmVyaWMgRkNQIGZvciBWU1AgZmFsbGJhY2sNCj4gPg0KPiA+ICAgIHJlZzoNCj4gPiAgICAg
IG1heEl0ZW1zOiAxDQo+ID4NCj4gPiAtICBjbG9ja3M6DQo+ID4gLSAgICBtYXhJdGVtczogMQ0K
PiA+ICsgIGNsb2NrczogdHJ1ZQ0KPiA+ICsgIGNsb2NrLW5hbWVzOiB0cnVlDQo+IA0KPiBCb3Ro
IHNob3VsZCBoYXZlIGhlcmUgdGhlIHdpZGVzdCBjb25zdHJhaW50czogbWluSXRlbXM6MSBhbmQg
bWF4SXRlbXM6My4NCg0KSXQgaXMgdGFrZW4gY2FyZSBpbiBjb25kaXRpb25hbCBzY2hlbWEgcmln
aHQ/DQoNCkl0IGlzIHNhbWUgYXMgWzFdLCB3aGVyZSB3aWRlciBwZW9wbGUgaW5jbHVkaW5nIHlv
dSBhZGRlZCBSYiB0YWcuIA0KDQpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC9jb21taXQvP2g9bmV4dC0yMDIyMDgz
MSZpZD0xN2I1MTc5ZWY2Y2Q2NDMwOTQ1YzFkYTQxNzRjZWFmNDNjOTNjZjFlDQoNCkNoZWVycywN
CkJpanUNCg==
