Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF5DB72BB27
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 10:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233345AbjFLItf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 04:49:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjFLItd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 04:49:33 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2042.outbound.protection.outlook.com [40.107.15.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4634EF5
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 01:49:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUuIfo3M7BzmqUGTGpY4ScOn3ewSRTZAVBWYrf2A7t4M5YUPsj9hkwfC/9k0JOhiw1PusIznKBsT2N2Sc932iNEabDmrVjdA3eajLaE6ZPrOjr4UwUCtitek5VopUMnPQygbXSADu6zP13IJ4z8v4ooSMIIoDuSWqeJfs7V8S+GXMOtCJy2cdirJ7cmX6XT9eEu6ZDYhMYJwtlcdx9AOg5BM73cLLhtsqSmV8zRPdRqySdUe+Cwv1G/DjbyoT3OH+fDHNH0PDqHa8RPXGVCfgIXvuDw8ho362mQKDyXnYT0Fz/HKDWrXbPQL0iNKfD6Ze7KTKU5NwSJUIWFq/heoJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWMPw6oOhXnf2Qz03imw4CtSE6lmrDFHMgJZiRq9FM4=;
 b=lkOpZM2RLVRK/Le4vZhLPejrwvZRZ3jMnkgRb9H572vMFzW3IycqXNllytiuwBR7NHgdI5bfxB3x19Ow+z1rPrN4ITWlTovsrLGaLUzqQwxh+EefkzkHacYUZwSgnHhdQ2AFgbbMrJMpQn7D3ZPB6x+d287mN2rseWe9MFSswfTdmqPSwG8zq7NCEIG+Li82NYHzYVJH2NVIZF7hf+PcuFeyF7DFU6wPQMZ94XkHOa0orCqfhj3Sg1UdU/9jcTB3gOq2KvaF2eHQiT8DhoWohp6oiPAnbmHkKss9lwkvUhrzu6D1VWXAYwYx/YrXAEl/VBoA1HSpgYorHcm6mGEuvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWMPw6oOhXnf2Qz03imw4CtSE6lmrDFHMgJZiRq9FM4=;
 b=FX1v1HNSUXgW4ZLUKKMHmYbpMQRWGK+t/ESYynijFQt95QzLV7R+LYZtLU4yztZTYfLc1Re0EBChR49DoQRoSyY1hw121E7S2aip2l6iFHgre3UAmcaZz3S/9fxAjEMmP1D6hUZUqONT+wMKdm5sm4wT6tgKW950Ib0Z++KFfjg=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA4PR04MB8031.eurprd04.prod.outlook.com (2603:10a6:102:bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Mon, 12 Jun
 2023 08:49:26 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 08:49:26 +0000
From:   "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "jacopo@jmondi.org" <jacopo@jmondi.org>
Subject: RE: [PATCH v3] media: ov5640: fix low resolution image abnormal issue
Thread-Topic: [PATCH v3] media: ov5640: fix low resolution image abnormal
 issue
Thread-Index: AQHZnNcGrtDqk/HDAEa7Sn0Lg82Zzq+Gs5EAgAAoSVA=
Date:   Mon, 12 Jun 2023 08:49:26 +0000
Message-ID: <AS8PR04MB90809DAC326BE6B578FBE6EEFA54A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230612024340.313662-1-guoniu.zhou@oss.nxp.com>
 <gqbulxmced43etsayy76mr5wb4g3qj5gz4e5pb2thvsp6qkztn@6y64s7sdeik4>
In-Reply-To: <gqbulxmced43etsayy76mr5wb4g3qj5gz4e5pb2thvsp6qkztn@6y64s7sdeik4>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PA4PR04MB8031:EE_
x-ms-office365-filtering-correlation-id: 15763b62-454b-48a7-4d0f-08db6b21ed71
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CGCUvNCUCc16mODH+X5zouvau9tESw4xyMpLsB/2FldLoehnIQ7HO4xuIPAC4EeHwmw+RGZBWNAlP92LGYPFcG6TNXAZKBOKfpEYpj0wp8nx87V/yKOVXkjrfPzoya3VPppu/xI3C72UtdpT95sqiEaJgDfca8az6ZqxTyQliZajutqglpqCETPVisMhJpwH/1cOZx/ZcX4O7Ec/h95wdrlsvceBf0WAWiiZq/8s2w3SJNocWghVotBK3PkEmcm3XXj2Z2G1blWBtO2ECgZefoqWtuBo+6fuhW6ZY0cqwjoG2kXbk2dnSUU4QFPV+NRjwpvo4E5oN0vXdqGp7ML7gvffpkXfWNgXbjkaqPcj+F4JevR0f9BuPhbdxxSKijVZlFuFK7xjuXTqBHa7qvvBt0FnnlWEK4O5xvHFdF4U/HOlwYf9YmsA444UhleCUXMw0eia/duKvoxVYzpmhOiAJuEBgB6Dzj9c67Ta9jtrFNvKJ113Tss0s0j2FbtCMjhJfhpyB2GQh22DUQFc2gF6yYGznkVQ7WXu7zP6cGQLe0iY//g8OjUCr/O8dwyywlL2FtvwUDd3saYheCXADyl/sdNFhMjzAb7F2RGiM3fogsmtHm/Om8TLzho3Mj5lS+ci
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199021)(55016003)(83380400001)(66556008)(122000001)(4326008)(33656002)(66476007)(38070700005)(41300700001)(38100700002)(316002)(7696005)(6506007)(26005)(53546011)(71200400001)(9686003)(66946007)(66446008)(64756008)(76116006)(2906002)(86362001)(5660300002)(8936002)(8676002)(52536014)(54906003)(110136005)(478600001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFg5Y00xWDVZZzA4RnRzV1pjQVJRc1kxbTd5dUM5bEdINGJJUFRsWGx1d0R0?=
 =?utf-8?B?bi9TYmtFUmVSUm5hWjBUNHQ1T24xLzdLRVhEUk5rLzJKdVN1UTBqZS95bUdO?=
 =?utf-8?B?ZVBhNHExdjBISE5EMWNXczhGQmxCZTRwZ3crUWtTeE5GTDlTNW5kdGNTSFJK?=
 =?utf-8?B?bjBXZzRjM2wvZXBVSGluUkxBNWdWUTVuUjg3ZUFTY2JCRVlpN1VBeFdpLzRY?=
 =?utf-8?B?K1R3Zjk5M3JjWEpjUXdWcUJ6Q0FYSEVFNmNVUTBZb2JXME5QeTFnQVJDQVdo?=
 =?utf-8?B?bWV3YU9pcUpVbGl0U0JHMFJ5NU8xN0lwWUQrLzdkaGZKUHlMTk95dDc3STNz?=
 =?utf-8?B?dG1QS0xPUHQrelpVZllaOGxqMWUzcGgvSHEzSlhocWhhTFlFM2t0Nk5uMDFi?=
 =?utf-8?B?RjJuMGsyU2k5SEZTKzl0WnhSeG5WbDZLejBYZnBFK2VON3lWcEpsQXhlS041?=
 =?utf-8?B?N2ZQOGZpR2NOTVRPeWNjYXg2Q09seE9FOTNDUnF0clAxSVE4TXV5N0EvL3VG?=
 =?utf-8?B?eERRMlJwbmNITXRJZ2ZEV21NNkd4ZUwrc3luL2hmVjkwU1R0K1lkd05Uek9G?=
 =?utf-8?B?aWpzOGtFc3VqdFFKRzFEUzBuQS9vekljY3dQWDM1S3J3Z3NuWkZoZk1rSk12?=
 =?utf-8?B?NmhFb2w0ZnJTMS90eWFjV1grWnUvZU8zd2VoblZ5cytVcnRUNitkcjdTNmky?=
 =?utf-8?B?L2xWbU84ZG1qN3d1TlN2ZVRaOHZ2M2lETU1ud093Q0RjQ09ZN2l2WjVRMk01?=
 =?utf-8?B?N3BreUdRMmozWWxHQ0tqT3gxdFV2VDFWVmJFNitBZ2RIMjA2ck5mMUx5Q1dX?=
 =?utf-8?B?RFBaVVpiR0NsTExtNk1QUGVPUmdVaktOZnE3M3N3c2RwRWIrUHFtcXkyM2NS?=
 =?utf-8?B?UkRzd2o1dXV1TzJXU0JyWDRVVVZZclArT3JmUU9wTXA2b3dDTWZGVEZEMXpr?=
 =?utf-8?B?RmlCVEg3Y1Ewb0lLaDd0WlVHb0x0WHlIQnNkaUk5WUJLa1Qwb2tDak84NjRz?=
 =?utf-8?B?cWg4QjNTT3ozcXUrYW5Nc2U1ZjluK2s0bEIwV1NMcXJ6Q0tTMUp6MUlHTVdC?=
 =?utf-8?B?ZHhLejhrbGVFS05VNTRjeEJSSTE1aHJoZVFIalZ6c1FYek1iV09YZjRjWmNx?=
 =?utf-8?B?NlJRblF4bXg3VjVNZzExeU04dWxtRFJHblh4NkxqL1hxMVNUdkZ1NVd4YjNv?=
 =?utf-8?B?YWc5azFRdXRkeFc3UERaTDZWZXM1TjA3ejVPbmJrTGFnN1BGVytDVVVUdEJp?=
 =?utf-8?B?L1dXSGc3VlBkZjA4b203VUhNL09OQnNNUldoa3RKR1BSdkxUWmNNVVBHNVZi?=
 =?utf-8?B?NWpza1k2K2NMRitHTnJiRG04cXI4VWVUWUpHdTltRG16eklZOUdtQlB6S2tB?=
 =?utf-8?B?dDExVmV3a2ZWckdueCtyUHRBNDN3WXlORmtvTWNhL0JCUHhUV3M4OVFPV29Z?=
 =?utf-8?B?ekNXeU53NHFzcmxpZ2tRaDg2WDNaZHcwZDdGalcrdERVTG53Zyt6Rkw1bThY?=
 =?utf-8?B?M1o0cDBORWdLcFFZVDZ0VzRva3JWdVlaek9rN1p3L2NPVG9iMGxhYW1qNnRj?=
 =?utf-8?B?Q0xBNVZoSXIrS1NvcHN5c2ZHa3ExbU9YakJFVXhVWGptaE1MMENEOWZwd3hG?=
 =?utf-8?B?ajBiOWMvSzViVFM5OEs1dHMwMHJjMjhJbm9DMWE0WkFNS0NxbzNGcUFqSGFU?=
 =?utf-8?B?VlF4bkhHcWJ5cnpxLzZXbThiQWFuK29mTHlUOUYvWEJNL2wxczMwcm43dVE5?=
 =?utf-8?B?UlhyYmhqZnRLWlZYVkZtem54cDRTNkRWQkQ2LzNpZjl5RCtFRjhZSWFiaXZk?=
 =?utf-8?B?dWZRaEJMdTU0YVRIeGZVUk5LMFh5RE1SUnNsSVdGYTI1aXZqRCtOd05JM1VT?=
 =?utf-8?B?dFhWTGRyL2RCWU1COUJ4WXhsd1ErT01HMTZ2OGUzS3B1Qm9CYjRudHBOcnpy?=
 =?utf-8?B?YWZRbVZxaUdjalV5L1JwVDJUWTNEQng0UXhXRUNUZ1doRWFucGwralVDajl4?=
 =?utf-8?B?R0xLRi9uYStHbm44OGIyenBvRXRRNGMzbXNBTUIxcmlIZjF2L3pRQ1l4UlFI?=
 =?utf-8?B?SWRObEVEZ2tJQkl6RHZIeVJiSFpyZ3k3TkZCcDRFK2pTTGJwbGdYbEZoSy8v?=
 =?utf-8?Q?mL4QAzANXWNSVMNJKKSN01dsC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15763b62-454b-48a7-4d0f-08db6b21ed71
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 08:49:26.4727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P0L7dwkq7QKEC1bixyAkWV88vCbDbxd78i19ykwvYfLofDoUdYYsq6zNPMJnqwNRMDrj0ovY/bQ+3R6s1ktAYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8031
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

R290IGl0LCB0aGFua3MuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFjb3BvIE1vbmRpIDxqYWNvcG8ubW9uZGlAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2VudDogMjAy
M+W5tDbmnIgxMuaXpSAxNDoyNQ0KPiBUbzogRy5OLiBaaG91IChPU1MpIDxndW9uaXUuemhvdUBv
c3MubnhwLmNvbT4NCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgamFjb3BvLm1v
bmRpQGlkZWFzb25ib2FyZC5jb207DQo+IHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb207IG1j
aGVoYWJAa2VybmVsLm9yZzsgc2xvbmdlcmJlYW1AZ21haWwuY29tOw0KPiBsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb207IGphY29wb0BqbW9uZGkub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjNdIG1lZGlhOiBvdjU2NDA6IGZpeCBsb3cgcmVzb2x1dGlvbiBpbWFnZSBhYm5vcm1h
bCBpc3N1ZQ0KPiANCj4gQ2F1dGlvbjogVGhpcyBpcyBhbiBleHRlcm5hbCBlbWFpbC4gUGxlYXNl
IHRha2UgY2FyZSB3aGVuIGNsaWNraW5nIGxpbmtzIG9yIG9wZW5pbmcNCj4gYXR0YWNobWVudHMu
IFdoZW4gaW4gZG91YnQsIHJlcG9ydCB0aGUgbWVzc2FnZSB1c2luZyB0aGUgJ1JlcG9ydCB0aGlz
IGVtYWlsJw0KPiBidXR0b24NCj4gDQo+IA0KPiBIZWxsbyBHdW9uaXUgWmhvdQ0KPiANCj4gT24g
TW9uLCBKdW4gMTIsIDIwMjMgYXQgMTA6NDM6NDBBTSArMDgwMCwgZ3Vvbml1Lnpob3VAb3NzLm54
cC5jb20gd3JvdGU6DQo+ID4gRnJvbTogIkd1b25pdS56aG91IiA8Z3Vvbml1Lnpob3VAbnhwLmNv
bT4NCj4gPg0KPiA+IE9WNTY0MCB3aWxsIG91dHB1dCBhYm5vcm1hbCBpbWFnZSBkYXRhIHdoZW4g
d29yayBhdCBsb3cgcmVzb2x1dGlvbg0KPiA+ICgzMjB4MjQwLCAxNzZ4MTQ0IGFuZCAxNjB4MTIw
KSBhZnRlciBzd2l0Y2hpbmcgZnJvbSBoaWdoIHJlc29sdXRpb24sDQo+ID4gc3VjaCBhcyAxMDgw
UCwgdGhlIHRpbWUgaW50ZXJ2YWwgYmV0d2VlbiBoaWdoIGFuZCBsb3cgc3dpdGNoaW5nIG11c3QN
Cj4gPiBiZSBsZXNzIHRoYW4gMTAwMG1zIGluIG9yZGVyIHRvIE9WNTY0MCBkb24ndCBlbnRlciBz
dXNwZW5kIHN0YXRlDQo+ID4gZHVyaW5nIHRoZSB0aW1lLg0KPiA+DQo+ID4gVGhlIHJlYXNvbiBp
cyBieSAweDM4MjQgdmFsdWUgZG9uJ3QgcmVzdG9yZSB0byBpbml0aWFsaXplIHZhbHVlIHdoZW4N
Cj4gPiBkbyByZXNvbHV0aW9uIHN3aXRjaGluZy4gSW4gaGlnaCByZXNvbHV0aW9uIHNldHRpbmcg
YXJyYXksIDB4MzgyNCBpcw0KPiA+IHNldCB0byAweDA0LCBidXQgbG93IHJlc29sdXRpb24gc2V0
dGluZyBhcnJheSByZW1vdmUgMHgzODI0IGluIGNvbW1pdA0KPiA+IGRiMTVjMTk1N2EyZCAoIm1l
ZGlhOiBvdjU2NDA6IFJlbW92ZSBkdXBsaWNhdGVkIG1vZGUgc2V0dGluZ3MiKS4gU28NCj4gPiB3
aGVuIGRvIHJlc29sdXRpb24gc3dpdGNoaW5nIGZyb20gaGlnaCB0byBsb3csIHN1Y2ggYXMgMTA4
MFAgdG8NCj4gPiAzMjB4MjQwLCBhbmQgdGhlIHRpbWUgaW50ZXJ2YWwgaXMgbGVzcyB0aGFuIGF1
dG8gc3VzcGVuZCBkZWxheSB0aW1lDQo+ID4gd2hpY2ggbWVhbnMgZ2xvYmFsIGluaXRpYWxpemUg
c2V0dGluZyBhcnJheSB3aWxsIG5vdCBiZSBsb2FkZWQsIHRoZQ0KPiA+IG91dHB1dCBpbWFnZSBk
YXRhIGFyZSBhYm5vcm1hbC4gSGVuY2UgbW92ZSAweDM4MjQgZnJvbQ0KPiA+IG92NTY0MF9pbml0
X3NldHRpbmdbXSB0YWJsZSB0byBvdjU2NDBfc2V0dGluZ19sb3dfcmVzW10gdGFibGUgYW5kIGFs
c28NCj4gPiBtb3ZlIDB4NDQwNyAweDQ2MGIsIDB4NDYwYyB0byBhdm9pZCBzYW1lIGlzc3VlLg0K
PiA+DQo+ID4gRml4ZXM6IGRiMTVjMTk1N2EyZCAoIm1lZGlhOiBvdjU2NDA6IFJlbW92ZSBkdXBs
aWNhdGVkIG1vZGUgc2V0dGluZ3MiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b25pdS56aG91IDxn
dW9uaXUuemhvdUBueHAuY29tPg0KPiANCj4gVGhhbmsgeW91LCBpdCB3YXMgcHJvYmFibHkgbm90
IG5lY2Vzc2FyeSB0byBzZW5kIGEgbmV3IHZlcnNpb24gYXMgdGhlIHRhZyBjb3VsZA0KPiBiZSBh
ZGRlZCBieSBtYWludGFpbmVycyB3aGVuIGNvbGxlY3RpbmcgdGhlIHBhdGNoIChJJ20gc3BlYWtp
bmcgZm9yIFNha2FyaQ0KPiBoZXJlIDopDQo+IA0KPiBQbGVhc2UgZG9uJ3QgZm9yZ2V0IHRvIGFk
ZCB0aGUgdGFncyB5b3UgcmVjZWl2ZSB3aGVuIHlvdSBzZW5kIGEgbmV3IHZlcnNpb24NCj4gDQo+
IFJldmlld2VkLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wby5tb25kaUBpZGVhc29uYm9hcmQuY29t
Pg0KPiANCj4gVGhhbmtzDQo+ICAgag0KPiANCj4gPiAtLS0NCj4gPiB2Mi0+djM6DQo+ID4gICBh
ZGQgIkZpeGVzOiBkYjE1YzE5NTdhMmQgKCJtZWRpYTogb3Y1NjQwOiBSZW1vdmUgZHVwbGljYXRl
ZCBtb2RlDQo+ID4gc2V0dGluZ3MiKSIgaW4gY29tbWl0IGxvZw0KPiA+IC0tLQ0KPiA+ICBkcml2
ZXJzL21lZGlhL2kyYy9vdjU2NDAuYyB8IDcgKysrLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvaTJjL292NTY0MC5jIGIvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMNCj4g
PiBpbmRleCAxNTM2NjQ5YjllOTAuLjFiYzRkNzJhOTA2ZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL21lZGlhL2kyYy9vdjU2NDAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0
MC5jDQo+ID4gQEAgLTU2OCw5ICs1NjgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ192YWx1
ZSBvdjU2NDBfaW5pdF9zZXR0aW5nW10gPSB7DQo+ID4gICAgICAgezB4NDAwMSwgMHgwMiwgMCwg
MH0sIHsweDQwMDQsIDB4MDIsIDAsIDB9LCB7MHgzMDAwLCAweDAwLCAwLCAwfSwNCj4gPiAgICAg
ICB7MHgzMDAyLCAweDFjLCAwLCAwfSwgezB4MzAwNCwgMHhmZiwgMCwgMH0sIHsweDMwMDYsIDB4
YzMsIDAsIDB9LA0KPiA+ICAgICAgIHsweDMwMmUsIDB4MDgsIDAsIDB9LCB7MHg0MzAwLCAweDNm
LCAwLCAwfSwNCj4gPiAtICAgICB7MHg1MDFmLCAweDAwLCAwLCAwfSwgezB4NDQwNywgMHgwNCwg
MCwgMH0sDQo+ID4gLSAgICAgezB4NDQwZSwgMHgwMCwgMCwgMH0sIHsweDQ2MGIsIDB4MzUsIDAs
IDB9LCB7MHg0NjBjLCAweDIyLCAwLCAwfSwNCj4gPiAtICAgICB7MHg0ODM3LCAweDBhLCAwLCAw
fSwgezB4MzgyNCwgMHgwMiwgMCwgMH0sDQo+ID4gKyAgICAgezB4NTAxZiwgMHgwMCwgMCwgMH0s
IHsweDQ0MGUsIDB4MDAsIDAsIDB9LCB7MHg0ODM3LCAweDBhLCAwLA0KPiA+ICsgMH0sDQo+ID4g
ICAgICAgezB4NTAwMCwgMHhhNywgMCwgMH0sIHsweDUwMDEsIDB4YTMsIDAsIDB9LCB7MHg1MTgw
LCAweGZmLCAwLCAwfSwNCj4gPiAgICAgICB7MHg1MTgxLCAweGYyLCAwLCAwfSwgezB4NTE4Miwg
MHgwMCwgMCwgMH0sIHsweDUxODMsIDB4MTQsIDAsIDB9LA0KPiA+ICAgICAgIHsweDUxODQsIDB4
MjUsIDAsIDB9LCB7MHg1MTg1LCAweDI0LCAwLCAwfSwgezB4NTE4NiwgMHgwOSwgMCwNCj4gPiAw
fSwgQEAgLTYzNCw3ICs2MzIsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ192YWx1ZQ0KPiBv
djU2NDBfc2V0dGluZ19sb3dfcmVzW10gPSB7DQo+ID4gICAgICAgezB4M2EwYSwgMHgwMCwgMCwg
MH0sIHsweDNhMGIsIDB4ZjYsIDAsIDB9LCB7MHgzYTBlLCAweDAzLCAwLCAwfSwNCj4gPiAgICAg
ICB7MHgzYTBkLCAweDA0LCAwLCAwfSwgezB4M2ExNCwgMHgwMywgMCwgMH0sIHsweDNhMTUsIDB4
ZDgsIDAsIDB9LA0KPiA+ICAgICAgIHsweDQwMDEsIDB4MDIsIDAsIDB9LCB7MHg0MDA0LCAweDAy
LCAwLCAwfSwNCj4gPiAtICAgICB7MHg0NDA3LCAweDA0LCAwLCAwfSwgezB4NTAwMSwgMHhhMywg
MCwgMH0sDQo+ID4gKyAgICAgezB4NDQwNywgMHgwNCwgMCwgMH0sIHsweDQ2MGIsIDB4MzUsIDAs
IDB9LCB7MHg0NjBjLCAweDIyLCAwLCAwfSwNCj4gPiArICAgICB7MHgzODI0LCAweDAyLCAwLCAw
fSwgezB4NTAwMSwgMHhhMywgMCwgMH0sDQo+ID4gIH07DQo+ID4NCj4gPiAgc3RhdGljIGNvbnN0
IHN0cnVjdCByZWdfdmFsdWUgb3Y1NjQwX3NldHRpbmdfNzIwUF8xMjgwXzcyMFtdID0gew0KPiA+
IC0tDQo+ID4gMi4zNy4xDQo+ID4NCg==
