Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 709456F7AAC
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 03:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjEEBX7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 May 2023 21:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbjEEBX6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 May 2023 21:23:58 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2057.outbound.protection.outlook.com [40.107.15.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C0C1124A9
        for <linux-media@vger.kernel.org>; Thu,  4 May 2023 18:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKU+xLsuX9SjTTBWOX/TnzrEls0lPWy7jPPx7waWwkFdWW6IlHmh8WontWdOp72zgIF46/6OVqfFkogXjneUu9JR3JKvv9RIi2UxI0PzYoeAexeF+VrntwvTkbvB4BA5WKvZa9evVVTp3DWmbTUcyTZ3SDYDRtdyS3ZtocAc8mdvEmB+bamE+QHFoJ7CAhJUZxIn/QXJSbWyGAcGuDRU6CnlQsXYI8RWtT+J5c45EzxfZdJZaSyHIqGwisex/twM0vpRoAn3TEaVxgHYDTfMSv+4efAVDJIiy71KJEGuTZP5sYoAQ0JCRCXXcfkqHUMGyujvhT+/yJyzxATQL0ckxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QA30ayhPswGekE8Y9C2t/jB79NZ/hJLLtLUBJ6pfomA=;
 b=jF47sR9WHqutXto4iyN1NQEhll4FlQWOOmgkwNHdSSUlld3ilSTR+5USYMeModN3iwt7beGAsSMuINREwptE8f85koVMM4/yYHZL6cm0vsj/2Y7H7a9Nt+ZrZCuc0w5a6eGjjF+ZwTjJPFleh6lJT2z8zffGy3s9DI/qjzMOY19J0Z8W2dw6SPswfAGOXz1x0xDjBaF1tJhJGxN2lTaZJGoxlH1ASLsB3JcTafbWUPQMA0h3wBXL1GoRoGnRKU6VZGQqtyu0BylOpqdwOL6PpVIi/dVoqoir84Ougi6lFl9XyU5szo7NUyHO66jCV6M09gWrirq4IWM6PO+6TCotfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QA30ayhPswGekE8Y9C2t/jB79NZ/hJLLtLUBJ6pfomA=;
 b=MfgGi98qb6w+YowKd+E3/yk7lrggRoisQ6ZuiNPlFCz487+/PuEjAa0eRMPdNFzlbID8FZJ7KVhpI+MZxquT99v6AGAb5VqIVEKJt5LTxTexwzluxdJXQeqS5MgHGkcibx6FJ50svCr0BiwGUBRNl+q4VvNQd2x3Yo6GdcTLLZI=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVXPR04MB9852.eurprd04.prod.outlook.com (2603:10a6:150:117::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 01:23:48 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::c29b:eeeb:d22b:7bd8]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::c29b:eeeb:d22b:7bd8%3]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 01:23:48 +0000
From:   "G.N. Zhou" <guoniu.zhou@nxp.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Subject: RE: [EXT] Re: [PATCH] media: ov5640: fix incorrect frame frate issue
 for defulat VGA
Thread-Topic: [EXT] Re: [PATCH] media: ov5640: fix incorrect frame frate issue
 for defulat VGA
Thread-Index: AQHZdYi21n5PRLJotEufk6u1C956s68/CpYAgAvp9KA=
Date:   Fri, 5 May 2023 01:23:48 +0000
Message-ID: <AS8PR04MB9080D2006C393385E12C47C9FA729@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230423021458.1138760-1-guoniu.zhou@nxp.com>
 <2t35gvk4cqen5p4d77mnod72sa3rmwflegubprph5mwfvrteti@uaudytaf4rw6>
In-Reply-To: <2t35gvk4cqen5p4d77mnod72sa3rmwflegubprph5mwfvrteti@uaudytaf4rw6>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|GVXPR04MB9852:EE_
x-ms-office365-filtering-correlation-id: 989585f6-7bd5-4ece-a603-08db4d0760b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JS39mO+A6R1ZVxdGV5louX4fN5OlqfxApASmnaqOpGrL6SLbSEE7AKdueLrVTa//xoG2nVqFIB533YY2SEfuXAyPADEQulKvTFRhK9rkQ6oK81OUBHs4Fegv4u5hChp75ryHlddh0P+EnULUDujP6Icpa1XqLsa4Xnx8d5KzgQgC7wIBuzESuxA358E0B7bNHayxi5KghqMNIIsM/XND8dClXclEJVjZCGGJ65eGJzKvBdyRXkvqBeZbCeZ4gLCap5bRZJlAe6VdSklU+PJqnJEQdDn8PJW7uGCei5jXpec5Xf4qkWgcDaQ6TSD/dJ/GZzKwuXXzSDfY25kW6M0ptaZBGotHJBPwRhrXL+0YTfzkUQLRVo8zXvcUCI0koMzYCmbl+4Mz4WYdt5/zDxVz9S7SkBuw11Ijf7e9JfILi3et65Fzihhu3mPaggkD083xN3x5CEiyZuYkg4Ei/ol7HB8q+eJokRyJquXPUjzx4oRp0fHA+THYSspkAjyGZBPj9CwRBY9Tbq6YAcfmKcfR4fRwJxphjDzCbc1R+phrb7ntI8mi9syEJ5M+rVNqSLXFkLFQR9SVVY4BXNROEocvd58CcAF8OXDI7pXZws341/nwsbfNY1VWytCpyZyXnEbE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199021)(55016003)(8676002)(8936002)(26005)(9686003)(6506007)(53546011)(2906002)(83380400001)(41300700001)(4326008)(76116006)(478600001)(7696005)(71200400001)(33656002)(5660300002)(316002)(52536014)(186003)(6916009)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(38070700005)(86362001)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1dBY0doQlNaMWd2N3ZmMTdhNkY4UTBYTnhPWXltSTJ5TUpEZU15T2VCMjVZ?=
 =?utf-8?B?d08xb1pQTGdLK2pqaUt1c0N5SE12cm1wOWtzbWYrWjdKMVFaQkhyK3JIU0xJ?=
 =?utf-8?B?Znl5UStLM01xcHRnMmZaNEVpYVlzT3M1eUFOQzgxMGJuZkVlVlNxcEFVbmZB?=
 =?utf-8?B?dGNkSFFyUXIwOTNWY0ZMS0UvaDdxWHpMcDlwRTgvYitBZnI1RE9BRUZtZkJU?=
 =?utf-8?B?aTQ0MlNxVWxKbU0zNThGcXgydi9GSnBLMm93NWJza2dBZ3FhYWVWSm5SejdV?=
 =?utf-8?B?Nlc2ZHc5bklJdVN0VWJDVE52MzFUVnJZeW1iZTVjNmxLaVdVTVVUdzBMVVl2?=
 =?utf-8?B?V1dwN1ppTDF4RTJSaThqUzhIZHVreWFXdUo5Y2w4M29FajdkTkphaUI2ZU5V?=
 =?utf-8?B?WGQzcXRhdmZZeUUxMXNLT0JNeWJUZHpvbWo4YkQ0MlRBT2sybGxIZDErVFVK?=
 =?utf-8?B?S1ZFRnpkc3NuaTRmeUhFTG8rSDR6NVVUTU9weCtoRzFra0dwZDVzTE9OczhQ?=
 =?utf-8?B?aldWOHhRcGZ6ZzdrZVV3Mm0rWkQ3eC9LdjRybWlIZVo2bFk5emxFb3RQUHpj?=
 =?utf-8?B?TWlnQ21kdGh0MUtNWGxHSmRSR1U0RjhjZkxLZDNNaG1LZXB0OFg5SjdQNmJP?=
 =?utf-8?B?eGp5UGZpWEMzQkI1ayt0WEcxMFU4Tk1icWozMGRkYm1tSFR4RFFYWEV1VEhl?=
 =?utf-8?B?TXYxRXV3b21ZdmwxQjhVU3ZNMWtuaVZCUjd0REx3ZUFyZWU0akdZWEg2Vkpa?=
 =?utf-8?B?aThiNXRtWGQ3d05mbFd3djNRZ3pHell1L051WnlhaktoTFhjRVdqTG1LU3ls?=
 =?utf-8?B?UzYvMFByN0tkckdESG1YOGNTQzZPYkZKUGttL1JjSWxpU2NnUWlrUitjZko3?=
 =?utf-8?B?Rm1kdmR0VEhFNGh1c3BtZGdwTjZBTmFQaGErc29ONWpTeU04UGNDYmVSQlZr?=
 =?utf-8?B?K0s0dHN3ZU1Id1JpOXR6L2w2dEVUK2JDSUdkT3NHOEIra1VQVGYvcVNuWVVm?=
 =?utf-8?B?YThiTjU5aGs2S2R2M2x6VXY4ekZWN3pML3EzLzNLZUR0SUZUL1ZmVzh5YndK?=
 =?utf-8?B?TGRnUzlkamdMdTdsVEhKUG1ISE9PaXhkYVFHT0k0M2M4S0tNUXRDRzFidG0w?=
 =?utf-8?B?US9SUnBwYk9yaWV0emFEVnhKbWtQeGxneXZ4MFBwNUVpNjZTNnZnUUNxU0h2?=
 =?utf-8?B?SGhsS3djWlZMOUxmUzJGWUxnVnJSb1JOY3ZOdEE0TjRYdTF6U3pJZndpU1Vq?=
 =?utf-8?B?VlpUbk04R3p3VGsxaFZpdEV1V0pkRHBQeUJxeFpyL2g5eFFSZmIySC91RTU5?=
 =?utf-8?B?SUJEZG9QZnJhSWhhVWhPc0lqS1FqZ0hGWmRLZXpkckhBbVlhd2dVRVhNYlBi?=
 =?utf-8?B?TGdmd1I1S2JMMStwNHNVM3dDdUxvcDFCVGFvTDNWcFRybEFCRUE0ZmRMdkx3?=
 =?utf-8?B?cTZyNXR5b2NUbVNoTnV6VFFWQkxVbXkwN2tIZGVTZit3cERibmQzQWt5SXhP?=
 =?utf-8?B?UlJNVUlWOXJuR3dUSk9DODJ4L2toZU43MjA2VnhWTVNEYXE3SlhtSkx5NEIy?=
 =?utf-8?B?ZmI3T1FqcnpTOXF1enZBcWlXWnF6VVQvOVQva09LcEY5bnBnUmV4Q2xTaEhW?=
 =?utf-8?B?VUJPVTZvT3JRU1B2Z3pNaVZZWGJEcEM2RGlWSzhiMWxMdGt0WkcvMXBaZEt0?=
 =?utf-8?B?MWJOYkZMQXBWZXJXYXoxL3dHMkxpTnB5TVZ1N2hRZGM5RnBZU2VlOFdEcjlp?=
 =?utf-8?B?S0dHVWRwZVJxSnRpVEtTNXU0RSt2NEdNZjdvbm9wVndGZzhuemE1MXZreWw5?=
 =?utf-8?B?dEdxQjlTemJVTENHWUlydWZXbUJhQ0ZTQVgrOWhrR0F6T3BFc3g5WG94aXhD?=
 =?utf-8?B?OUlnSVZ1dlRkcWNtRnJqaTIva0I0MGduYlNMaXVBOWtPdHRUekg4V21TaUtP?=
 =?utf-8?B?L2R6b3VIbStPMy9tUFBpY3gwN0dMN1JlK3VZalJtaHhFbXU5YlBaSGtUNlJy?=
 =?utf-8?B?NUFoVVdpMTNSQ3lXOWV3RVk3cHhrSXhOVnVvOEhaMDVOVEJJMGhnZlVzeTEv?=
 =?utf-8?B?UEE3emhQdjRSd0ozK3NJNVlodzBzcVdjSEV2WmkvRFptUm9LcUFXbEZhNTJ4?=
 =?utf-8?Q?uzh3gVqT8PLcUG+yScbk78659?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 989585f6-7bd5-4ece-a603-08db4d0760b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 01:23:48.5069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jVUh0FpeGGUVguLCW3KGl/ATcrbWxjDgZ8tm26hPh76gLOOouZBAizxc8jFObnlH5cPQ+MVzZbRl0qTogrdt6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9852
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSmFjb3BvIE1vZGksDQoNClNvcnJ5IGZvciByZXBseWluZyBzbyBsYXRlLg0KDQpUaGFua3Mg
Zm9yIHlvdXIgY29tbWVudHMgYW5kIEkgYWdyZWUgd2l0aCB5b3UuIFdpbGwgdXBkYXRlIGEgdjIg
cGF0Y2ggdG8gdGhpcyBpc3N1ZS4gVGhhbmtzIGFnYWluLiANCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYWNvcG8gTW9uZGkgPGphY29wby5tb25kaUBpZGVhc29uYm9h
cmQuY29tPg0KPiBTZW50OiAyMDIz5bm0NOaciDI35pelIDE5OjI0DQo+IFRvOiBHLk4uIFpob3Ug
PGd1b25pdS56aG91QG54cC5jb20+DQo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7
IG1jaGVoYWJAa2VybmVsLm9yZzsNCj4gc2xvbmdlcmJlYW1AZ21haWwuY29tOyBsYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb207DQo+IGphY29wby5tb25kaUBpZGVhc29uYm9hcmQuY29t
DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0hdIG1lZGlhOiBvdjU2NDA6IGZpeCBpbmNvcnJl
Y3QgZnJhbWUgZnJhdGUgaXNzdWUgZm9yDQo+IGRlZnVsYXQgVkdBDQo+IA0KPiBDYXV0aW9uOiBF
WFQgRW1haWwNCj4gDQo+IEhpIEd1b25pdQ0KPiANCj4gT24gU3VuLCBBcHIgMjMsIDIwMjMgYXQg
MTA6MTQ6NThBTSArMDgwMCwgR3Vvbml1Lnpob3Ugd3JvdGU6DQo+ID4gSWYgcnVubiBPVjU2NDAg
d2l0aCA2NDB4NDgwQDMwIGRlZmF1bHQgc2V0dGluZyBhZnRlciBwb3dlciB1cCwgdGhlDQo+ID4g
cmVhbCBmcmFtZSByYXRlIGZvciBpdCBpcyA2MCwgbm90IDMwLiBUaGUgcmVhc29uIGlzIGRlZmF1
bHQgZnJhbWUNCj4gPiBpbnRlcnZhbCBwYXJhbWV0ZXIgaW5pdGlhbGl6ZWQgaW4gcHJvYmUgaXMg
MzAgYnV0IGRlZmF1bHQgbGluaw0KPiA+IGZyZXF1ZW5jeSBpcyB0byBnZW5lcmF0ZSA2MCBmcmFt
ZSByYXRlLCBzbyBjb3JyZWN0IGl0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogR3Vvbml1Lnpo
b3UgPGd1b25pdS56aG91QG54cC5jb20+DQo+IA0KPiBUaGUgZnJhbWVfaW50ZXJ2YWwgY2FsbHMg
YXJlIG9ubHkgdXNlZCBmb3IgcGFyYWxsZWwgbW9kZSBhbmQgYXJlIGlnbm9yZWQgaW4gQ1NJLTIN
Cj4gbW9kZS4gVGhpcyBtZWFucyB0aGF0IHRoZSBmcmFtZSByYXRlIGhhcyB0byBiZSBjb250cm9s
bGVkIGJ5IGFkanVzdGluZyBibGFua2luZ3MNCj4gKGFuZCBwb3NzaWJseSBMSU5LX0ZSRVEgd2hp
Y2ggdGhpcyBkcml2ZXIgcmVnaXN0ZXJzIGluIHJlYWQtb25seSBtb2RlIHRob3VnaCkuDQo+IA0K
PiBJIHJlY2FsbCB0aGUgY2hvaWNlIG9mIHRoYXQgREVGQVVMVF9MSU5LX0ZSRVEgd2FzIHRoZSBv
bmUgdGhhdCBhbGxvd2VkIHRvDQo+IG9idGFpbiB0aGUgaGlnaGVzdCBmcmFtZSByYXRlcywgaGVu
Y2UgSSB0aGluayBpdCdzIHJpZ2h0IHRvIGNob3NlIGl0IGJ5IGRlZmF1bHQuDQo+IA0KPiBNYXli
ZSB0aGlzIGNvbW1lbnQsIHRoYXQgcmVwb3J0cyBAMzAsIGlzIG1pc2xlYWRpbmcNCj4gICAgICAg
ICAgKg0KPiAgICAgICAgICAqIGRlZmF1bHQgaW5pdCBzZXF1ZW5jZSBpbml0aWFsaXplIHNlbnNv
ciB0bw0KPiAgICAgICAgICAqIFlVVjQyMiBVWVZZIFZHQUAzMGZwcw0KPiAgICAgICAgICAqDQo+
IA0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAuYyB8IDIgKy0NCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMgYi9kcml2ZXJzL21lZGlhL2ky
Yy9vdjU2NDAuYw0KPiA+IGluZGV4IDE1MzY2NDliOWU5MC4uODBlMWEyODU4YWJkIDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0MC5jDQo+ID4gKysrIGIvZHJpdmVycy9t
ZWRpYS9pMmMvb3Y1NjQwLmMNCj4gPiBAQCAtMTc5LDcgKzE3OSw3IEBAIHN0YXRpYyBjb25zdCBz
NjQgb3Y1NjQwX2NzaTJfbGlua19mcmVxc1tdID0geyAgfTsNCj4gPg0KPiA+ICAvKiBMaW5rIGZy
ZXEgZm9yIGRlZmF1bHQgbW9kZTogVVlWWSAxNiBicHAsIDIgZGF0YSBsYW5lcy4gKi8NCj4gPiAt
I2RlZmluZSBPVjU2NDBfREVGQVVMVF9MSU5LX0ZSRVEgICAgIDEzDQo+ID4gKyNkZWZpbmUgT1Y1
NjQwX0RFRkFVTFRfTElOS19GUkVRICAgICAxOQ0KPiA+DQo+ID4gIGVudW0gb3Y1NjQwX2Zvcm1h
dF9tdXggew0KPiA+ICAgICAgIE9WNTY0MF9GTVRfTVVYX1lVVjQyMiA9IDAsDQo+ID4gLS0NCj4g
PiAyLjM3LjENCj4gPg0K
