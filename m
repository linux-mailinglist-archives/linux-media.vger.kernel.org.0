Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18BF54D4875
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 14:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242590AbiCJN5P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 08:57:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238203AbiCJN5N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 08:57:13 -0500
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20061.outbound.protection.outlook.com [40.107.2.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1599C14FFC4
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 05:56:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ys+iORjBXFQZt3d1f2RAVMvtj2/WsaTG6jOOThDjA8aAOKo2v8XqW/aMBo97Sw0fxDAUIZO2SlYi4+a2cwaK5y+NywW8EDhNumefxyfNTZYywBzMkdPug3IKow8w/s8qn0AmgE0gkgpWdOPoXQPmxbAODJLriWDp1YVIzrTVydK0yq6uqtQ6JsWxj6sgqSqlfr9oLfOAoiIh2TF1OYNqDZ5BNOPz6T3MMWYuXv7ApJonpNEZTUlmxGfRVEGahNLKYM8RKAR6ZIphFc+BXdf4DnW+5Hp+0qQ2iHXLOjUKUJl3297Rchhpwynm2T4k4QBE0/DiwcK0+6opJIzNYCd97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZEwACOvbZZ9b1hzEGxmL+YKy3110HdVAeiALMWXdwc=;
 b=BNeMroOVV5gVsqYtKC7HrsqSIqg6Zfb06f8MOgPi+XMuUX+IzoLK03Ox9nzMRftUPMSrUHVZqo/I9H48S6p7xSh41G4eBT5IPkFC+PXCDzj9Cp2Rd5hIlQ9ElW6q5IoopMwFgsGG6Wdju71VA6IzGblrai2HDKzHaZhCEIAAGshrHya/lGPujx+JwwEIrLOXpCLChT6d7130SVNsjAmzAVaYXkdjU/bkaxERFzX+Ke5p2IT9+a6+gfezBvEOJAOOVsLRw/s+b7U1i0B/0vzIcvLIP3U6YQl/sZl6RkFdZ9H5f/rE1xuvlLNF/JVCPaYAiShHPRplp3jnWVtnZJcz+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZEwACOvbZZ9b1hzEGxmL+YKy3110HdVAeiALMWXdwc=;
 b=jZteIy3JX2H3IKoFYplyWtSb2kqfoUSA0NUHDfwMABHFHEsblsov2f3c9jrQPBx5vTQH86TT1OSRT/pFdkpdnOQ4CoAsXEP28aSSCdfqhgqQ+k4Y8s87uInRrd9rJvLtTUGHZEGvjFKE3mWGCsbGbFbpvQ9NfNCOmQuLL64WNfY=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM0PR04MB5617.eurprd04.prod.outlook.com (2603:10a6:208:125::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 13:56:07 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c39:69cf:c4ea:967]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c39:69cf:c4ea:967%5]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 13:56:07 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogW0VYVF0gW2J1ZyByZXBvcnRdIG1lZGlhOiBhbXBoaW9uOiBpbXBs?=
 =?gb2312?Q?ement_windsor_encoder_rpc_interface?=
Thread-Topic: [EXT] [bug report] media: amphion: implement windsor encoder rpc
 interface
Thread-Index: AQHYNEwUqlIrQniockijQZsabe8Zuay4OJTAgABHhoCAACFwYA==
Date:   Thu, 10 Mar 2022 13:56:07 +0000
Message-ID: <AM6PR04MB634124BEAB999850980D88ECE70B9@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <20220310065654.GA3476@kili>
 <AM6PR04MB6341ACEC2D4188333B4A88F5E70B9@AM6PR04MB6341.eurprd04.prod.outlook.com>
 <20220310114533.GE3315@kadam>
In-Reply-To: <20220310114533.GE3315@kadam>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 727602f0-ce3b-4e2a-6ec5-08da029db990
x-ms-traffictypediagnostic: AM0PR04MB5617:EE_
x-microsoft-antispam-prvs: <AM0PR04MB5617A33FB5B8B278764C4CB3E70B9@AM0PR04MB5617.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x4SS8iIjXuGgZC14bubf/24u79g/XEgK/QQEGLqj0k+PDk0I0Vu5oCxwYtBROIUawzNgyDU+BepOXzuEwazeR3piEXmRM9LplPZy2tVhwr3UozjAX1qMv8LG9M/YuL9Hta1RNHgCpKbde4j5BLTkZpVy8YXKtGMRUNnDJijf0QNdXUmaUJPNrrvyFSEVNZjkU2YqoPGFXllskbEfznJKi2RldnvvvQJj0i7TlZVxYKIwfJG0aOUSpjzTqMDljzv/SIAXbvQp6u3qiPXVJIsdMq+wTo2R8MdHOkoPDr9D6WXqNzMAXKn5nXr/iZB5Iw5cBBr1JfaLjE1nVu18IFA6dshvX0m0BqDsEAq3xjv0eJeOWFz6uQfiiqk+NNy9Tpzb5KD1lqyjxdj4Ky3u2KeC1IbjCpjZUTBLj0IDPk7o2ZOl+YvV+uONmH8j7Wx63tmP23DOEd4IMphbjLwvjv0rfWVwsjundASgJCiDGL8CMvzVgz49OrDrytjMS07zt6oFWCeryog17hBa69Q/JXjQAO9OLX3IU/gtSUGs6Hv5tlX1heEaCLyklNK1FsqBX+abwYGR/Q8O5CoHQlnAyU40RrjmbZZMy8WPlryfy6FcjUNyLcKRxylo/FFOxG7x2jVPQRhjZyVcrAxNh2oGANKMfO3TWpR2m+HnsbknLsQE4PmAV+UglqKpNq8s2uJgbhHhpwlKmQVVMoQpJhXfA3k1Zw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(83380400001)(38070700005)(71200400001)(9686003)(44832011)(52536014)(2906002)(26005)(8936002)(186003)(55016003)(38100700002)(122000001)(33656002)(86362001)(498600001)(64756008)(76116006)(4326008)(66946007)(66476007)(66446008)(66556008)(224303003)(6916009)(6506007)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?NkplY0Y2bTJxYkRWNjk0bEdrYmYwZ0lUTDUwNkl1bzN5dVJmSmRYVE94NzRG?=
 =?gb2312?B?SjNMakVncTJXWm9uNkYrc1QrTlVJdDdnZTRsRGdQa09ybXVsaDNMcU1sdVhR?=
 =?gb2312?B?dWJJTWFZSFFLbnQ5UlEyVDRrTlFvczYzUHdHbG1xZmtuNkFFUUxVWDZnZURH?=
 =?gb2312?B?Z0hLK05GcW9QeGcxUVo3SlFMdVJpUk1ZVW9icFJhenlFa3AvNDlFWjBtZTY4?=
 =?gb2312?B?QVAzVjJ6QWtLTEo0MTdPREE1djlXQ1hCZzgyVFhnb21UeEpYWERnaFRIdk4v?=
 =?gb2312?B?eU1XYWZpejdnNVVIQjhSblpWNzhDMlBocGdMVEQ2QnBQMmlmV1lkZDlmeVhD?=
 =?gb2312?B?Mzkwd2VpcWtWMnVPeVV2cEF0K0RSa1NIL0hFdVpaakN0TzRhTjMrb20ybGYr?=
 =?gb2312?B?WitWVFRYZlkvL0lGZFdqaVhCRnBoRUhWZTQzTHhCbUM3QlpEQUo4UGgvOGxB?=
 =?gb2312?B?QXpHV3dybVgyWjV6djF2dVhuaVA1K1BmczQvSy8rcnVNY29TUml6dE1ETCtO?=
 =?gb2312?B?OEU1MkRUckxQQ1FmRDNZNW5XNWFuc2RpbWpTRVNMdk5OYXJwMFJNdkFCbzZ4?=
 =?gb2312?B?aTVGOWEyS0dDdS82bnNHTGh1OGhsY2dJbUlHRzBiRk9KcG5MQ0kxRXBGQzhi?=
 =?gb2312?B?djB1OW9CelcxbWR3dzhKeGVJUVYyZUtsRXdvTzRpOGVrWjJJMmU3cFNTOGRj?=
 =?gb2312?B?R3c0bDJqYi82Tk83a21RUFd6UjBJc0tuWEc5YVdJeEExNE5hakE2SXRXbGRT?=
 =?gb2312?B?VHdhZlZHd1RQamdrbHZZblE3dmRzZk9taEg4RERFMEd3YzBZbmVVdGhuTnMv?=
 =?gb2312?B?dHVOVkhna2ZBMnhIN0ZsTFZvRnprMnFJeHlKVWtOUkZXek0wTERZWWs4OHNS?=
 =?gb2312?B?NGNBVEl1dDBIUWIvMSsyeHl6Unk0SDRldktBOVZKcGdhZVpqcUZZVkFWbDM4?=
 =?gb2312?B?TU1ZRzVYbjdTbmxYdzRJUTQxWm1VTkFnTGNzcGRNY2ZOakpHcGZvVWhkWXRr?=
 =?gb2312?B?ZmUwQTlqajBLa2hyM0xNNW9QYno5eDRMeGRBc3Y0aFp5TkFUZ1N1LytSdFhT?=
 =?gb2312?B?aE5mS1p1SzZJeHFSS1BlZnQ3VG9uVWE4cGNGckhNbCtRcUdZdGtIVU1aOFpp?=
 =?gb2312?B?dUtncWV0ZnhRN2pyNnZoeU55MHFzL3o0Rk0xTzJqZm1GZHZNUnRRN1pHZ1pv?=
 =?gb2312?B?b2JZTGdYRFJNVzBjTUlSMnZsY3VGV1VodlgzdXkycEdRY2UwNlA1ZCs2WkNh?=
 =?gb2312?B?WFpmUldvdXZ1bDJFS05xS0wvclJIdjd4cllwUlk0Z0Y1MkwyVVdrcDE4SnZ5?=
 =?gb2312?B?TkkrdjZDcmNsTGlvZkNXNC9CT2pHdkloMkQ4aE5RUFhuTGRQL0lkQmNUdStK?=
 =?gb2312?B?QURWaUt4dEppMDZ6MStxb1o1UEpDOUdmS3p5ZnlZUDc0eFBpSnd1UFBHVTgw?=
 =?gb2312?B?NW1Odm9IUDhHcDBieXZ2TVVFRkhtU0Uwc21WcFNjZCtNSHRRL2NBODE2Ukp0?=
 =?gb2312?B?NlhzNFRLTXA4TkNRQlFVaTRjakM1TFpJMVJiSFRnWkhXNzR0SHdCM09jNHVi?=
 =?gb2312?B?UVRrcUxLN29JQm9UeTBUcXBWcUdXWGQ2Y28xaTV4ZEF2WUFEZFdDZ3hBc0pi?=
 =?gb2312?B?SkNGQ21VempKaTJpbENKL3p2eFR0MTZjS3RidHdjME5VWlZhS050MDNhbktD?=
 =?gb2312?B?MGV1VzIwejRtUlNxSDJwK2FIdTNmZkQzcHorbmZ6L3BSamwxSmtCMUYxU1Vi?=
 =?gb2312?B?MGNLM3hoVmJpZ1lPdm9HMGloMEUzekdFWXZHeXErNWpCQkhGVzIwbWZIRDNn?=
 =?gb2312?B?YjNadUZpbGdYeDFPNE50cEUxOExrYWliVUdzdnp4V0wyYnV5cFZpajMrYlM5?=
 =?gb2312?B?QkNhaTBBak8yakFyS2IrZzFUaTVPMmxsR25hTGw3bnFCUXZ1RFBCNVIxWE9D?=
 =?gb2312?Q?aOr8wspKT3Y=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 727602f0-ce3b-4e2a-6ec5-08da029db990
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 13:56:07.1936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LTo9/f/328QGizt3sJp4NHakoC8CZz85xM+NU/GoLEp8mLXh/zclxCOEyYWFUzR8TM0zW6b8h3trr8wyqesR0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5617
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiBPbiBUaHUsIE1hciAxMCwgMjAyMiBhdCAwNzozNDo1NkFNICswMDAwLCBNaW5nIFFpYW4gd3Jv
dGU6DQo+ID4gPiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FtcGhpb24vdnB1X3dpbmRzb3IuYw0K
PiA+ID4gICAgIDgwNyBpbnQgdnB1X3dpbmRzb3JfY29uZmlnX21lbW9yeV9yZXNvdXJjZShzdHJ1
Y3QNCj4gPiA+IHZwdV9zaGFyZWRfYWRkciAqc2hhcmVkLA0KPiA+ID4gICAgIDgwOCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgaW5zdGFuY2UsDQo+ID4gPiAgICAg
ODA5ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiB0eXBlLA0KPiA+
ID4gICAgIDgxMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgaW5k
ZXgsDQo+ID4gPiAgICAgODExICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCB2cHVfYnVmZmVyICpidWYpDQo+ID4gPiAgICAgODEyIHsNCj4gPiA+ICAgICA4MTMg
ICAgICAgICBzdHJ1Y3QgdnB1X2VuY19tZW1fcG9vbCAqcG9vbDsNCj4gPiA+ICAgICA4MTQgICAg
ICAgICBzdHJ1Y3QgdnB1X2VuY19tZW1vcnlfcmVzb3VyY2UgKnJlczsNCj4gPiA+ICAgICA4MTUN
Cj4gPiA+ICAgICA4MTYgICAgICAgICBpZiAoaW5zdGFuY2UgPj0gVklEX0FQSV9OVU1fU1RSRUFN
UykNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5e
Xl5eXiBUaGlzIGlzIDguDQo+ID4gPg0KPiA+ID4gICAgIDgxNyAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7DQo+ID4gPiAgICAgODE4DQo+ID4gPiAgICAgODE5ICAgICAgICAgcG9vbCA9
IGdldF9tZW1fcG9vbChzaGFyZWQsIGluc3RhbmNlKTsNCj4gPiA+ICAgICA4MjANCj4gPiA+ICAg
ICA4MjEgICAgICAgICBzd2l0Y2ggKHR5cGUpIHsNCj4gPiA+ICAgICA4MjIgICAgICAgICBjYXNl
IE1FTV9SRVNfRU5DOg0KPiA+ID4gLS0+IDgyMyAgICAgICAgICAgICAgICAgcmVzID0gJnBvb2wt
PmVuY19mcmFtZXNbaW5kZXhdOw0KPiA+ID4NCj4gPiA+IFRoaXMgb25seSBoYXMgV0lORFNPUl9N
QVhfU1JDX0ZSQU1FUyBlbGVtZW50cy4NCj4gPg0KPiA+IEhpIERhbiwNCj4gPiAgICAgSSBkb24n
dCBnZXQgdGhlIHBvaW50LCB0aGUgaW5zdGFuY2UgYW5kIGluZGV4IGlzIGRpZmZlcmVudCwgYW5k
DQo+ID4gb25lIHZwdSBjb3JlIGNhbiBzdXBwb3J0IDggaW5zdGFuY2VzIChWSURfQVBJX05VTV9T
VFJFQU1TKSwgVGhlDQo+ID4gZW5jX2ZyYW1lIGNvdW50IG9mIG9uZSBpbnN0YW5jZSB3b24ndCBl
eGNlZWQgNg0KPiAoV0lORFNPUl9NQVhfU1JDX0ZSQU1FUykuDQo+IA0KPiBIaSBNaW5nLA0KPiAN
Cj4gSSBhcHBvbG9naXplLiAgSSBtaXMtdW5kZXJzdG9vZCB3aGF0IFNtYXRjaCB3YXMgc2F5aW5n
IGFuZCBtaXMtcmVhZCB0aGUNCj4gY29kZSBhcyB3ZWxsLiAgSSBnb3QgImluc3RhbmNlIiBhbmQg
ImluZGV4IiBtaXhlZCB1cCBhcyB5b3Ugc2F5Lg0KPiANCj4gSG93ZXZlciwgd2hlbiBJIHJlLXJl
dmlld2VkIHRoZSBjb2RlIG5vdyBpdCBsb29rcyBsaWtlIFNtYXRjaCBpcyBjb3JyZWN0DQo+IGFu
ZCB0aGVyZSBpcyBhIHBvdGVudGlhbCBidWZmZXIgb3ZlcmZsb3cuICBUaGUgImluZGV4IiB2YXJp
YWJsZSBjb21lcyBmcm9tDQo+IHZwdV9pZmFjZV91bnBhY2tfbXNnX2RhdGEoKSBzbyBJIGRvIG5v
dCB0aGluayBpdCBjYW4gYmUgdHJ1c3RlZC4NCj4gV2UgbmVlZCB0byBoYXZlIGFuIHVwcGVyIGJv
dW5kcy4NCj4gDQo+IFRoZXJlIGFyZSAzIHVwcGVyIGJvdW5kcyBjaGVja3MgaW4gdmVuY19yZXF1
ZXN0X21lbV9yZXNvdXJjZSgpIGJ1dA0KPiB0aGV5IG9ubHkgY2hlY2sgdGhhdCAiaW5kZXgiIGlz
IGluIHRoZSAwLTcgcmFuZ2UuDQo+IA0KPiAgICAgICAgIGlmIChlbmNfZnJhbWVfbnVtID4gQVJS
QVlfU0laRSh2ZW5jLT5lbmMpKSB7DQo+ICAgICAgICAgaWYgKHJlZl9mcmFtZV9udW0gPiBBUlJB
WV9TSVpFKHZlbmMtPnJlZikpIHsNCj4gICAgICAgICBpZiAoYWN0X2ZyYW1lX251bSA+IEFSUkFZ
X1NJWkUodmVuYy0+YWN0KSkgew0KPiANCj4gVGhlc2UgLT5lbmMsIC0+cmVmIGFuZCAtPmFjdCBh
cnJheXMgYWxsIGhhdmUgOCBlbGVtZW50cy4NCj4gDQo+IEhvd2V2ZXIsIGFzIG5vdGVkIGJ5IFNt
YXRjaCB0aGUgcG9vbC0+ZW5jX2ZyYW1lc1tdIGFycmF5IG9ubHkgaGFzIDYNCj4gZWxlbWVudHMg
YW5kIHRoZSBwb29sLT5yZWZfZnJhbWVzW10gYXJyYXkgb25seSBoYXMgMyBlbGVtZW50cy4gIFNv
IHdlIG5lZWQNCj4gdG8gYWRkIGJvdW5kcyBjaGVja2luZyBiZWZvcmUgYm90aCBhY2Nlc3Nlcy4N
Cj4gDQo+ID4gICAgIE1heWJlIEkgc2hvdWxkIGFkZCBhIGNoZWNrIGZvciB0aGUgaW5kZXggbGlr
ZToNCj4gPg0KPiA+ICAgICAgIElmIChpbmRleCA+PSBBUlJBWV9TSVpFKHBvb2wtPmVuY19mcmFt
ZXMpKQ0KPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4NCj4gDQo+IFllcywg
cGxlYXNlLiAgT3IgbWF5YmUgd2UgbmVlZCB0byBtYWtlIHRoZSBhcnJheXMgbGFyZ2VyIHRvIG1h
dGNoIHRoZQ0KPiBhcnJheXMgaW4gdmVuY19yZXF1ZXN0X21lbV9yZXNvdXJjZSgpPw0KPiANCg0K
SGkgRGFuLA0KICAgIFllcywgeW91J3JlIHJpZ2h0LCBJIGhhdmUgYWxzbyBub3RpY2VkIHRoYXQu
DQogICAgSSB3aWxsIG1ha2UgYSBwYXRjaCB0aGF0IGFkZCB0aGUgY2hlY2tpbmcgY29kZS4NCiAg
ICBIZXJlIHRoZSBhcnJheSBzaXplIGlzIGRlZmluZWQgaW4gdGhlIGZpcm13YXJlLCBzbyBJIHRo
aW5rIEkgc2hvdWxkIG5vdCBjaGFuZ2UgdGhlbS4NCg0KICAgIFRoYW5rcyBmb3IgeW91ciByZXZp
ZXcuDQoNCk1pbmcNCg0KPiA+ID4NCj4gPiA+ICAgICA4MjQgICAgICAgICAgICAgICAgIGJyZWFr
Ow0KPiA+ID4gICAgIDgyNSAgICAgICAgIGNhc2UgTUVNX1JFU19SRUY6DQo+ID4gPiAgICAgODI2
ICAgICAgICAgICAgICAgICByZXMgPSAmcG9vbC0+cmVmX2ZyYW1lc1tpbmRleF07DQo+IA0KPiBB
bmQgaGVyZSBhcyB3ZWxsLg0KPiANCg0KWWVzLCBJJ2xsIGNoZWNrIGl0IHRvby4NCg0KPiByZWdh
cmRzLA0KPiBkYW4gY2FycGVudGVyDQo+IA0KPiANCg0K
