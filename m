Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0D272B55A
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 04:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbjFLCV6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Jun 2023 22:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjFLCV4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Jun 2023 22:21:56 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2053.outbound.protection.outlook.com [40.107.21.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06C7A12D
        for <linux-media@vger.kernel.org>; Sun, 11 Jun 2023 19:21:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixmYaa0W1uS5tyBvBoGMQCLhHstAUYNVMYxL4bbBz9h8sPFcJCsGDVuCM/o7Ch+dGJx/3REwaVArXuc0MBz91VKng2KmA9hh7MweYm4VzoSIg/LeOREp9UZ3mUsMQy/pVgf+/a8BHt0pPjhEGtDZCYOtsl2vjFfI4hZtIFdcVWwLy9w70AN4bUjqwM87i4pef7ikNqZwd3mYYEXfGuylFAxX5TCg42qsf90iq7Xki0zThm8O4oTIjoDVGQNGjC8lhUcXYkUI7cY+lmwxyxGa62/vjGTSPFiCmos9F6PUZYO2JvdKQIxasc7QX3FBATCxaSRY53Eq9eTX4A7Qx5V5NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vv7QG/u0EjW36BT6QGRUW06hRvG2lzbtW/FYaLCDM6k=;
 b=SLsCWUtP/uDkV/T8bM8ThkwLG0Z/E/2m5xAllEWz51ua+8SogY9JGWK1MWtXF+GjsigwPa2P/EDWovcqADyBpM4Wzkhj0/uMChfS2HUEfqLmZqOf9NYM5MiKIrgZywEdM1MiETZ1FAeWFKLVQcf7t4Ga+COjstVdqP9Kgpv1IKgQuhtVMojn7FfdXJLXvoAsd5greVJs8O7fgmineux8fsfdSpT1xeNPWw/XmwUc4oaDMBUcEUaXhj9RUSb9V5fcS+ypcwaPgcfKZ21qX1lULD3cknmhvdEoDOepcQ2LTw/xtxBv7P0I1bLe5LmaCDTGM5OqUp6Lxw+lsfGg5At5gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vv7QG/u0EjW36BT6QGRUW06hRvG2lzbtW/FYaLCDM6k=;
 b=VVHDqYzx0rO7tDGleHz2gyjTl3PtHzsubZYIIFQ0nDwseukr2rAmvqK/F0mo7wPiRARuGLL1BklZMS6WOxR8mg1+IFQ5d5BnHfb1so5p4LGf0VgpdzKMJ6cJjsZ6ddGtrZ4/HnPvyakMlPrgVY2j1RdnlSMa43zLfNjmo6eu9sk=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PR3PR04MB7273.eurprd04.prod.outlook.com (2603:10a6:102:89::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Mon, 12 Jun
 2023 02:21:51 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 02:21:51 +0000
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
Subject: RE: [PATCH v2] media: ov5640: fix low resolution image abnormal issue
Thread-Topic: [PATCH v2] media: ov5640: fix low resolution image abnormal
 issue
Thread-Index: AQHZmpTpLe0o4Es+SU20lGrUoLTcDa+ChD6AgAPrFnA=
Date:   Mon, 12 Jun 2023 02:21:51 +0000
Message-ID: <AS8PR04MB908026369FA2392FE81B4ABEFA54A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230609054525.4067113-1-guoniu.zhou@oss.nxp.com>
 <hylz7iar3laa3iihmbsm5iqc3rdvp7wascuiqgicmzi3jv7htv@sp7hqsjyhgif>
In-Reply-To: <hylz7iar3laa3iihmbsm5iqc3rdvp7wascuiqgicmzi3jv7htv@sp7hqsjyhgif>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PR3PR04MB7273:EE_
x-ms-office365-filtering-correlation-id: 344dca9a-afd8-4278-7422-08db6aebc885
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bVIBN65VVEMJ4jScJnBKw1i/dXHAvkU4I3agQhcQuW04Texk50lO6FsCK9Ot5sHhsruCLJeLF6F+oH+Sp2IjWBn+Y8eF/Tg/B1FzgIkPSS9W5Tjyb8D3NaXMmc50ZySOmvBMtmh/K4xUaaz3GsNhF8/FBRHDWn4/w4SfmIX35yTJ25h4LkD1pwnCBfiRPAwT/OE3DrwiuvLkXl7Ae/T/Kd2QU60DU84md6QL0yW7bb7QyX5FOgpQcPf2mPslCCltfNBZHxGMhgWY6es0kFgqCtjji1r/KFsDvTmwEpWdnWMA6haFEfuPedX+1nKnz4Szz5Tru9sZcK3O3imEOGVxgxIGgkxefbNbDGv2CGvZyejw2pNwb1GfdTwVpdh6AVU8/MHu6IWuUuP2ZoI4yYc3qaQznshYcCgQ8k2b68XOtQcjeQvrZemrc6ZOZ+64b21qGW8dn4r31wGw2XxXvYeQzYpcGB6WHDrfpwhPFKlYudcKO0RJCiJhyaxaDYdQRbM6LRNmZuHSkaPgbtBTFXCkINd6EoU1wPFO8SxXn1zJlehwXmozoXvSJTomEe615IiCFn8y6gtGoiCGUMC9KtTgOr6qkwsAmRtFFdc2GuNUsZWEwkhpXt/YqMOPHHOZXx7P
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199021)(86362001)(33656002)(38070700005)(66946007)(478600001)(4326008)(54906003)(110136005)(71200400001)(66446008)(316002)(76116006)(64756008)(66476007)(66556008)(7696005)(55016003)(8676002)(5660300002)(52536014)(8936002)(2906002)(41300700001)(122000001)(38100700002)(186003)(26005)(6506007)(9686003)(53546011)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUZ5dUFMZkxnTVJUa0tXcUxlWndTMmhhY0l0dW51NW9RRGgwTHJtT292cCtk?=
 =?utf-8?B?ZzJodFB0b0lZUHBEeEw1eWpabk8yZWlrS1M0RXhJNjNzUFpzSVJobzd1blhF?=
 =?utf-8?B?K3BHZUlRZHBGTTgvUmthYWJ5VDNMYlJZVFBkeWZhOUM4Y3lNNTZoVG1LV3Vy?=
 =?utf-8?B?UEM4dUs0N0JBSHNnRmsxaWk1QkphUGhQUzZyeU15ZVBvWFg4SSs3cFE1Zm9y?=
 =?utf-8?B?UXNqd2tvQ0FpeFpOSGJ3bDVRTXlsWTZIZUpoVUE4a3piaDhuUVNxbmt4cWtV?=
 =?utf-8?B?ZGhCQlZyRklLT29VU0kydWI1em91cXlObTlXakFCRnc1TjVtWHl3Z3JMQWVP?=
 =?utf-8?B?ZkhpaWk4UUFPUzZjODNNcFREYjkxRmgwWDBGQ0ZlMG1VMmpsemZLaWZRWW9I?=
 =?utf-8?B?WHZSeDVHZVZad2hiM0JzS1k3Ym84ekh2L3hjc2x2SDU5UnprdXFHRmhOM20z?=
 =?utf-8?B?VG1pWlFjWGVzMW1kQWdjaHBnSW5LS3FURWliSllhdEU0VDFaNlBZbkVOSzBn?=
 =?utf-8?B?eUhmcXhscjN6cis3QzV0ODBUOUNXSUFTYktWVFZ6eWpXR1ZVZlhVWFFTZkhj?=
 =?utf-8?B?ejh2YlVEbGFYWGNLOURlZUt4bmlqME5sRGtOWWpSenNrY2ZjRXRVNHRMK1hD?=
 =?utf-8?B?ZktTNWltNFNJRTJoWERyUkxYRGVtZDJQYXZuckovUG1kR21UVUlLQ3NONjM4?=
 =?utf-8?B?aGNHcTAyRGIrZHlLQmNlS0ZLVWdxaitodGlIbVppWEZvTjVCbG4rbHk3cWF5?=
 =?utf-8?B?SCtSSThMNGk3eDc3aGZYcWtJejkrajhkeXpBVERZNGxnN1QxYThMc0E0T2sy?=
 =?utf-8?B?b0hrL3lsa2pBOUs5V1BLVEdEL0I2bmJqb1BIYkNnbXI1L2szWE12d004QXJV?=
 =?utf-8?B?ekFJRWNhMkF3blVTRjdMOUQzK0N3cnpFekxWd0xsckZtN3pIbklMd1FlY0pC?=
 =?utf-8?B?ZWRsVk9DWkt1TzdMa05EeWxPR2NIV3VGaTRGUGpVQUcwT3dGSEpNbzFYRkhw?=
 =?utf-8?B?cStrdjBkOGZsbU94enBOWFk3cnBzS0F1SWVwaGYyVWt4SGt3M3lVUDRkL1FG?=
 =?utf-8?B?UnljekpjV21Gd2RQL1pQY281YzdtVkhINDdVYmNLNnZObVFwajZFY2hkYU9r?=
 =?utf-8?B?S0U1SUtDdjM0c1U3c0pwUURybjROUWtxWng1ME1SK0VCYXBwSmsvN29iZlR6?=
 =?utf-8?B?R0pWQkNGTy82czM3REdRZ0M3UWlRK0lyQkRoWi95RnJPRGRpMDBwLzlUZFM5?=
 =?utf-8?B?SkJnUDVya0lubUt6UTd6VGJ0R2o1VnBIamRsYzdWcnlLc2J3VC96OXcwR3F4?=
 =?utf-8?B?cG1nbVd0QmZZYW9aQzRvSDlaeEN6WnlyQ1N5N2pDRTEzbG1OUnhPbjh6TFM1?=
 =?utf-8?B?amRIckNhTTFYR1lwOTVlYmJTYkV3Z3JacFNaRU1RT1BueHJzUE9ML3JsalpF?=
 =?utf-8?B?VHUyNUV0Y1c2OGJKTGNia2JUNHRzdTg1Q244NUl3aW1HcGpXczE4L210THpv?=
 =?utf-8?B?QmNvelVIaDR3Y3ppSW1jTkNnUEJGRlJXMGxYaWgwVVhVYmttdVIwd3NiWDA3?=
 =?utf-8?B?ekpodUVHWlNEMGZFRE1sQzZrT3BlaVZRN00yMzhKRUtNb3A5M1QwUUFlZStN?=
 =?utf-8?B?U01USmE2Q280bUtFendMMmNGQzJWdjZkUEN1STZpYW1CdzgxM0xCbmdtQU92?=
 =?utf-8?B?M3lKRjNjOStSY3djN3lyUnAzSDJabzFpSVdqekNNL0Y2VVU5aTd2YkhBbURT?=
 =?utf-8?B?L3BaZWlQVCtYZXlCYkxsYWo1VytDVDR2MmJjV0VycUgwUW1qb01QYzYyTU82?=
 =?utf-8?B?RGgwakJ0WXBIcGhiWjcxK1hMRjdvWE50bXkwTFkzcGJXNHkyNEx2NlE1TG1V?=
 =?utf-8?B?WFViTldYcFZCVENCVGt2WkRFaURKTzV3aXBXelZmVVhiWUtTV1J6VmtkdHpR?=
 =?utf-8?B?UDgwRlB1NzFhRVppeDRpNmRNZ2lzNXRBRnlNcEdLVDV1UGdxOUFqZDdMWGtQ?=
 =?utf-8?B?VGNlUzhEMkFnQkYxb2NaeGd3cmlVWFJkMGwxWGIrc3N6Z204SXF1K00za0FM?=
 =?utf-8?B?T1ZSeVo3Q2pwOVdSaitseWJiNXJ6dmhEa1JGaFg3VDVyR1NObXFDT2J3bTBL?=
 =?utf-8?Q?bkLdRhvzaVSFaP/qfBhzsoc8V?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 344dca9a-afd8-4278-7422-08db6aebc885
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 02:21:51.6805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yvxpYoE6MVSKE/GIa76jZIXFZd5XlGL9FPZ7Dxqd+hzo5krPNJws8ZlwFRrZgzEp1yqGk+NJeS1u/Xuk/bBOMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7273
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSmFjb3BvDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFjb3Bv
IE1vbmRpIDxqYWNvcG8ubW9uZGlAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2VudDogMjAyM+W5tDbm
nIg55pelIDIyOjE0DQo+IFRvOiBHLk4uIFpob3UgKE9TUykgPGd1b25pdS56aG91QG9zcy5ueHAu
Y29tPg0KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBqYWNvcG8ubW9uZGlAaWRl
YXNvbmJvYXJkLmNvbTsNCj4gc2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbTsgbWNoZWhhYkBr
ZXJuZWwub3JnOyBzbG9uZ2VyYmVhbUBnbWFpbC5jb207DQo+IGxhdXJlbnQucGluY2hhcnRAaWRl
YXNvbmJvYXJkLmNvbTsgamFjb3BvQGptb25kaS5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
Ml0gbWVkaWE6IG92NTY0MDogZml4IGxvdyByZXNvbHV0aW9uIGltYWdlIGFibm9ybWFsIGlzc3Vl
DQo+IA0KPiBDYXV0aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFrZSBj
YXJlIHdoZW4gY2xpY2tpbmcgbGlua3Mgb3Igb3BlbmluZw0KPiBhdHRhY2htZW50cy4gV2hlbiBp
biBkb3VidCwgcmVwb3J0IHRoZSBtZXNzYWdlIHVzaW5nIHRoZSAnUmVwb3J0IHRoaXMgZW1haWwn
DQo+IGJ1dHRvbg0KPiANCj4gDQo+IEhlbGxvIEd1b25pdSBaaG91DQo+IA0KPiBPbiBGcmksIEp1
biAwOSwgMjAyMyBhdCAwMTo0NToyNVBNICswODAwLCBndW9uaXUuemhvdUBvc3MubnhwLmNvbSB3
cm90ZToNCj4gPiBGcm9tOiAiR3Vvbml1Lnpob3UiIDxndW9uaXUuemhvdUBueHAuY29tPg0KPiA+
DQo+ID4gT1Y1NjQwIHdpbGwgb3V0cHV0IGFibm9ybWFsIGltYWdlIGRhdGEgd2hlbiB3b3JrIGF0
IGxvdyByZXNvbHV0aW9uDQo+ID4gKDMyMHgyNDAsIDE3NngxNDQgYW5kIDE2MHgxMjApIGFmdGVy
IHN3aXRjaGluZyBmcm9tIGhpZ2ggcmVzb2x1dGlvbiwNCj4gPiBzdWNoIGFzIDEwODBQLCB0aGUg
dGltZSBpbnRlcnZhbCBiZXR3ZWVuIGhpZ2ggYW5kIGxvdyBzd2l0Y2hpbmcgbXVzdA0KPiA+IGJl
IGxlc3MgdGhhbiAxMDAwbXMgaW4gb3JkZXIgdG8gT1Y1NjQwIGRvbid0IGVudGVyIHN1c3BlbmQg
c3RhdGUNCj4gPiBkdXJpbmcgdGhlIHRpbWUuDQo+ID4NCj4gPiBUaGUgcmVhc29uIGlzIGJ5IDB4
MzgyNCB2YWx1ZSBkb24ndCByZXN0b3JlIHRvIGluaXRpYWxpemUgdmFsdWUgd2hlbg0KPiA+IGRv
IHJlc29sdXRpb24gc3dpdGNoaW5nLiBJbiBoaWdoIHJlc29sdXRpb24gc2V0dGluZyBhcnJheSwg
MHgzODI0IGlzDQo+ID4gc2V0IHRvIDB4MDQsIGJ1dCBsb3cgcmVzb2x1dGlvbiBzZXR0aW5nIGFy
cmF5IHJlbW92ZSAweDM4MjQgaW4gY29tbWl0DQo+ID4gZGIxNWMxOTU3YTJkICgibWVkaWE6IG92
NTY0MDogUmVtb3ZlIGR1cGxpY2F0ZWQgbW9kZSBzZXR0aW5ncyIpLiBTbw0KPiA+IHdoZW4gZG8g
cmVzb2x1dGlvbiBzd2l0Y2hpbmcgZnJvbSBoaWdoIHRvIGxvdywgc3VjaCBhcyAxMDgwUCB0bw0K
PiA+IDMyMHgyNDAsIGFuZCB0aGUgdGltZSBpbnRlcnZhbCBpcyBsZXNzIHRoYW4gYXV0byBzdXNw
ZW5kIGRlbGF5IHRpbWUNCj4gPiB3aGljaCBtZWFucyBnbG9iYWwgaW5pdGlhbGl6ZSBzZXR0aW5n
IGFycmF5IHdpbGwgbm90IGJlIGxvYWRlZCwgdGhlDQo+ID4gb3V0cHV0IGltYWdlIGRhdGEgYXJl
IGFibm9ybWFsLiBIZW5jZSBtb3ZlIDB4MzgyNCBmcm9tDQo+ID4gb3Y1NjQwX2luaXRfc2V0dGlu
Z1tdIHRhYmxlIHRvIG92NTY0MF9zZXR0aW5nX2xvd19yZXNbXSB0YWJsZSBhbmQgYWxzbw0KPiA+
IG1vdmUgMHg0NDA3IDB4NDYwYiwgMHg0NjBjIHRvIGF2b2lkIHNhbWUgaXNzdWUuDQo+IA0KPiBJ
J20gbm90IDEwMCUgSSBnb3Qgd2h5IHRoZSBhdXRvc3VzcGVuZCBkZWxheSBwbGF5cyBhIHJvbGUg
aGVyZS4NCg0KV2hlbiBlYWNoIHJlc29sdXRpb24gc3dpdGNoLCBpdCB3aWxsIGNhbGwgb3Y1NjQw
X3Nfc3RyZWFtKCkgZWFjaCB0aW1lIGFuZCB0aGUgY2FsbCBzZXF1ZW5jZSB3aGljaCByZWxhdGVk
IHRvIGF1dG9zdXNwZW5kIGRlbGF5IGFzIGJlbGxvdzoNCjEpIHdoZW4gc3RyZWFtIHN0b3ANCiAg
ICBpZiBtb2RlIHN3aXRjaGluZyB0aW1lIGludGVydmFsIGlzIGxlc3MgdGhhbiAxMDAwbXMNCiAg
ICAgICBvdjU2NDBfc2Vuc29yX3N1c3BlbmQoKSB3aWxsIG5vdCBiZSBjYWxsZWQNCiAgICBlbHNl
DQogICAgICAgb3Y1NjQwIHdpbGwgY2FsbCAiIG92NTY0MF9zZW5zb3Jfc3VzcGVuZCgpIg0KMikg
d2hlbiBuZXh0IHRpbWUgc3RhcnQgc3RyZWFtaW5nLCBjYWxsIG92NTY0MF9zX3N0cmVhbSgpDQog
ICAgaWYgdGltZSBpbnRlcnZhbCBpcyBsZXNzIHRoYW4gMTAwMG1zDQogICAgICAgb3Y1NjQwIHNl
dHRpbmcgd2lsbCBrZWVwIGFzIGxhc3QgdGltZSBhbmQgb25seSBjaGFuZ2UgcmVnaXN0ZXIgaW4g
b3Y1NjQwX3NldHRpbmdfbG93X3Jlc1tdDQogICAgZWxzZQ0KICAgICAgIG92NTY0MF9zX3N0cmVh
bSgpDQogICAgICAgICBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCkNCiAgICAgICAgICAgIG92
NTY0MF9zZW5zb3JfcmVzdW1lKCkNCiAgICAgICAgICAgICAgb3Y1NjQwX3NldF9wb3dlcigpDQog
ICAgICAgICAgICAgICAgb3Y1NjQwX3Jlc3RvcmVfbW9kZSgpDQogICAgICAgICAgICAgICAgICBv
djU2NDBfbG9hZF9yZWdzKHNlbnNvciwgb3Y1NjQwX2luaXRfc2V0dGluZywgQVJSQVlfU0laRShv
djU2NDBfaW5pdF9zZXR0aW5nKSk7DQogICAgICAgICAgICAgICAgICBvdjU2NDBfc2V0X21vZGUo
c2Vuc29yKQ0KICAgICAgICAgICAgICAgICAgLi4uLg0KSSdtIG5vdCBzdXJlIGlmIEkgbWFrZSBp
dCBjbGVhci4NCg0KPiANCj4gQWxzbyB0aGlzIGlzIHByb2JhYmx5IHdvcnRoIGE6DQo+IEZpeGVz
OiBkYjE1YzE5NTdhMmQgKCJtZWRpYTogb3Y1NjQwOiBSZW1vdmUgZHVwbGljYXRlZCBtb2RlIHNl
dHRpbmdzIikNCj4gDQo+IENvdWxkIGJlIGFkZGVkIHdoZW4gYXBwbHlpbmcgcHJvYmFibHkgPw0K
DQpTdXJlLCBJIHdpbGwgdXBkYXRlDQoNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b25pdS56
aG91IDxndW9uaXUuemhvdUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+IHYxLT52MjoNCj4gPiAgIDEp
IE1vdmUgMHg0NDA3LCAweDQ2MGIsIDB4NDYwYyBmcm9tIG92NTY0MF9pbml0X3NldHRpbmdbXSB0
YWJsZSB0bw0KPiA+ICAgICAgb3Y1NjQwX3NldHRpbmdfbG93X3Jlc1tdIHRhYmxlLg0KPiANCj4g
SSBoYXZlIGNoZWNrZWQgdGhhdCB0aGUgcmVnaXN0ZXJzIHlvdSByZW1vdmVkIGZyb20gaW5pdF9z
ZXR0aW5nc1tdIGFyZQ0KPiBwcm9ncmFtbWVkIGluIGFsbCB0aGUgb3RoZXIgbW9kZXMsIGhlbmNl
DQo+IA0KPiBSZXZpZXdlZC1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8ubW9uZGlAaWRlYXNvbmJv
YXJkLmNvbT4NCg0KVGhhbmsgeW91IGFnYWluLg0KDQo+IA0KPiANCj4gPiAgIDIpIEFkZCBtb2Rl
IHN3aXRjaGluZyB0ZXN0IGZyb20gMjU5MngxOTQ0IHRvIG90aGVyIHJlc29sdXRpb25zLCB0aGUN
Cj4gPiAgICAgIHJlc3VsdCBpcyBva2F5Lg0KPiANCj4gVGhhbmtzIGZvciB0ZXN0aW5nIGl0IGFu
ZCBnb29kIGNhdGNoIQ0KPiANCj4gDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvbWVkaWEvaTJjL292
NTY0MC5jIHwgNyArKystLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9pMmMv
b3Y1NjQwLmMgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAuYw0KPiA+IGluZGV4IDE1MzY2NDli
OWU5MC4uMWJjNGQ3MmE5MDZlIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL292
NTY0MC5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMNCj4gPiBAQCAtNTY4
LDkgKzU2OCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnX3ZhbHVlIG92NTY0MF9pbml0X3Nl
dHRpbmdbXSA9IHsNCj4gPiAgICAgICB7MHg0MDAxLCAweDAyLCAwLCAwfSwgezB4NDAwNCwgMHgw
MiwgMCwgMH0sIHsweDMwMDAsIDB4MDAsIDAsIDB9LA0KPiA+ICAgICAgIHsweDMwMDIsIDB4MWMs
IDAsIDB9LCB7MHgzMDA0LCAweGZmLCAwLCAwfSwgezB4MzAwNiwgMHhjMywgMCwgMH0sDQo+ID4g
ICAgICAgezB4MzAyZSwgMHgwOCwgMCwgMH0sIHsweDQzMDAsIDB4M2YsIDAsIDB9LA0KPiA+IC0g
ICAgIHsweDUwMWYsIDB4MDAsIDAsIDB9LCB7MHg0NDA3LCAweDA0LCAwLCAwfSwNCj4gPiAtICAg
ICB7MHg0NDBlLCAweDAwLCAwLCAwfSwgezB4NDYwYiwgMHgzNSwgMCwgMH0sIHsweDQ2MGMsIDB4
MjIsIDAsIDB9LA0KPiA+IC0gICAgIHsweDQ4MzcsIDB4MGEsIDAsIDB9LCB7MHgzODI0LCAweDAy
LCAwLCAwfSwNCj4gPiArICAgICB7MHg1MDFmLCAweDAwLCAwLCAwfSwgezB4NDQwZSwgMHgwMCwg
MCwgMH0sIHsweDQ4MzcsIDB4MGEsIDAsDQo+ID4gKyAwfSwNCj4gPiAgICAgICB7MHg1MDAwLCAw
eGE3LCAwLCAwfSwgezB4NTAwMSwgMHhhMywgMCwgMH0sIHsweDUxODAsIDB4ZmYsIDAsIDB9LA0K
PiA+ICAgICAgIHsweDUxODEsIDB4ZjIsIDAsIDB9LCB7MHg1MTgyLCAweDAwLCAwLCAwfSwgezB4
NTE4MywgMHgxNCwgMCwgMH0sDQo+ID4gICAgICAgezB4NTE4NCwgMHgyNSwgMCwgMH0sIHsweDUx
ODUsIDB4MjQsIDAsIDB9LCB7MHg1MTg2LCAweDA5LCAwLA0KPiA+IDB9LCBAQCAtNjM0LDcgKzYz
Miw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnX3ZhbHVlDQo+IG92NTY0MF9zZXR0aW5nX2xv
d19yZXNbXSA9IHsNCj4gPiAgICAgICB7MHgzYTBhLCAweDAwLCAwLCAwfSwgezB4M2EwYiwgMHhm
NiwgMCwgMH0sIHsweDNhMGUsIDB4MDMsIDAsIDB9LA0KPiA+ICAgICAgIHsweDNhMGQsIDB4MDQs
IDAsIDB9LCB7MHgzYTE0LCAweDAzLCAwLCAwfSwgezB4M2ExNSwgMHhkOCwgMCwgMH0sDQo+ID4g
ICAgICAgezB4NDAwMSwgMHgwMiwgMCwgMH0sIHsweDQwMDQsIDB4MDIsIDAsIDB9LA0KPiA+IC0g
ICAgIHsweDQ0MDcsIDB4MDQsIDAsIDB9LCB7MHg1MDAxLCAweGEzLCAwLCAwfSwNCj4gPiArICAg
ICB7MHg0NDA3LCAweDA0LCAwLCAwfSwgezB4NDYwYiwgMHgzNSwgMCwgMH0sIHsweDQ2MGMsIDB4
MjIsIDAsIDB9LA0KPiA+ICsgICAgIHsweDM4MjQsIDB4MDIsIDAsIDB9LCB7MHg1MDAxLCAweGEz
LCAwLCAwfSwNCj4gPiAgfTsNCj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ192YWx1
ZSBvdjU2NDBfc2V0dGluZ183MjBQXzEyODBfNzIwW10gPSB7DQo+ID4gLS0NCj4gPiAyLjM3LjEN
Cj4gPg0K
