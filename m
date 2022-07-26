Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D814E580C24
	for <lists+linux-media@lfdr.de>; Tue, 26 Jul 2022 09:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237745AbiGZHH4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jul 2022 03:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232155AbiGZHHz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jul 2022 03:07:55 -0400
Received: from mo-csw.securemx.jp (mo-csw1114.securemx.jp [210.130.202.156])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12F227CEA;
        Tue, 26 Jul 2022 00:07:53 -0700 (PDT)
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id 26Q77NnZ022666; Tue, 26 Jul 2022 16:07:23 +0900
X-Iguazu-Qid: 2wHH7L6a1PduFNsKxI
X-Iguazu-QSIG: v=2; s=0; t=1658819243; q=2wHH7L6a1PduFNsKxI; m=jDvWsJEVvSdpW0tZ6tLylv65+94EP/dNmaGpUs+klZ8=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
        by relay.securemx.jp (mx-mr1112) id 26Q77LS5026069
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 26 Jul 2022 16:07:21 +0900
X-SA-MID: 42674565
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7jCQbYP8fTazxdvzrG7dYJ1677kfCcvuadjrGxeZ2S0gOmeR8grfizYxnj3bYy8VSM8OtIgC4TC+K1BK4pDybE9U7QF2J0Ms0aqBSRatnuG94yC/pr4P42V1D6LnKkmCZiQrOdetJjrcBaTH0BEQeEYwyZY1udGFMZyCJfxoJbXsPOZ3GTBqxbgqKvkKnqVQ5w2BLhs4fzkoHvyrPVr4+2Mm9znLpOsxH0P0B3XBYTU9poP2qiaYL7nf5GXDgkMD8ISQY6HrZR2oA8mVVEfnzCtNgmyVMA+TrvM50f88Y+SInNsRk8vsRF0N8Y3gWkH20kOsZOn2+5bQubvmIZNtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXRETTmKVZGsUUwjFdphCxau96107fvsZUY05vc1Jr8=;
 b=Z4HbaHs2Lj7lDI3+Tb/KgVTkaWyI2fSMAx4+6YsfUqxixSTyb2baThRYcbaBfMsZVYqooTRehrAihK95lV44m3j451ZTj85+zjcj/HhBsAwvx1iqa6XO80ppTcdEvjsnawoCfCpvAogE38wyoj1FcAsoKY93EzChldyQlud/rjoJPFgbvSHZvris6v0YZpnPXvktymqU8uBSSBG1/pxHZvJ4u3ve1vQGyNPvNJ7DabhnsN28Y3r7lTwkWp6Zdca1Fa6yfsNFppQlxL2Dlv9QL5bzx2nmtyxb1RoXNiwJ1jHG3dva1ipw14rMKL78yrLhEULSkW0yjhfNC8kGVkBzog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From:   <yuji2.ishikawa@toshiba.co.jp>
To:     <gregkh@linuxfoundation.org>
CC:     <robh+dt@kernel.org>, <hverkuil@xs4all.nl>,
        <nobuhiro1.iwamatsu@toshiba.co.jp>, <corbet@lwn.net>,
        <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
Subject: RE: [PATCH v2 2/5] soc: visconti: Add Toshiba Visconti image
 processing accelerator common source
Thread-Topic: [PATCH v2 2/5] soc: visconti: Add Toshiba Visconti image
 processing accelerator common source
Thread-Index: AQHYnaUnMLJIQDZ2M0OZN7MAOYMpo62PDb6AgAEkV2A=
Date:   Tue, 26 Jul 2022 07:02:12 +0000
X-TSB-HOP2: ON
Message-ID: <TYAPR01MB6201082C58C5BFAF6902120C92949@TYAPR01MB6201.jpnprd01.prod.outlook.com>
References: <20220722082858.17880-1-yuji2.ishikawa@toshiba.co.jp>
 <20220722082858.17880-3-yuji2.ishikawa@toshiba.co.jp>
 <Yt6Qk6jdAjDVSBh/@kroah.com>
In-Reply-To: <Yt6Qk6jdAjDVSBh/@kroah.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac14d00f-a9a8-450e-6f79-08da6ed4c3ca
x-ms-traffictypediagnostic: OSAPR01MB3859:EE_
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jw2A6gFu9Eyd7uIbzYc9cuUBIaZ2Sc/lGO3vXq0iznqmCIoh3j6S6uxfhMB5rqg45WPT4GVgY0HyyUwJ4jyfNtpcso4dcrothenWvEGPEDd6kdyJFVpxBjhMBFAbWG6aPXRet+fh6RVw6NmRqigOU/ZzOJe6Xn913OjxN5kD38Y4XswFEDuXiYNWZAVRVrGqUxmIurTmDEgF2SkqANLfRJjJlWVYX73XUfcqMJvidoYOtbdJUTwb10wjW8jXpXdOTYbn9tG6jzWqTdS/py9SAnzgNvNeLNj+ED9w3Fq/IaxCp4FMMKUXt/42b/hXJeFx3LUujQzm9IJ99JhaZXSXen6g+YqSbnhK8swFtJ9EcrQ/oKjCLsaEOXqz8arau17Si8QjHsmMnw3GKcb4epI756Gn5wesSTB+tu93Cq+9YjRJJG/poXPwsY7QCD3z42oqnT2jSit9RK4EsxkUag9gFugv49C9aDFA0tUN61F7/JdisVAIfJryL2PvkUhzq999btrEclMyYY770wzC/YLT6QSjl6r3gcA1JshJrkVL8ByCWFJu2yoaiAQeZBFpBHrsF90lVH5b89wExSAGyrMj4sNbgiDLEIg/GFjF45MpDxa/xhE5X1aMQ5j+NioueszIr6EuYnpNr+jUdHmvfhV96FrCRZ52IMx2m/XjmVmzQkmZRBRHpkyju7vbyRmhYjZ5hduKhc81Q/dkHwX+rgUO4TLWTPzNqUXoSpIPMby2SkdB8BAPZI1kmM2NwI9wxWpFRYA+6HXEwE6VD6ldjcz5soYQBc9jGgShIBuEDhEUl62tEDLMPZpTjJjwaHUftwtb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYAPR01MB6201.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(66446008)(76116006)(66946007)(66476007)(66556008)(64756008)(4326008)(8676002)(5660300002)(54906003)(316002)(52536014)(8936002)(33656002)(55016003)(7416002)(2906002)(478600001)(71200400001)(41300700001)(6506007)(7696005)(26005)(83380400001)(122000001)(66574015)(9686003)(186003)(53546011)(86362001)(6916009)(38070700005)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmZrUkJqdUJJNWFjdlJEWHRYYitFWW4zbkFsTittOHVHR0MrUkowblZNSzZt?=
 =?utf-8?B?VUtjTmtHM0lFdlF4QzQvdmp4UzY3L3RrVTY4MWtOS0RVaGxocHo0aVNVbUlP?=
 =?utf-8?B?eWx2cVYvMy8zc0htNWVNbytuSHFoSTMxZm5Cb3E1VUh1SGJiRnZkNlRnMmhs?=
 =?utf-8?B?VDNHakt3RkhkbGlXdlRJNUdlNzRyQ2JBV0FIQTExL25nQVZCWlFJdUFVOTRv?=
 =?utf-8?B?Q0p1VlA5OWtQRVZaVCtRRWkxeVlPazIzTjhvaG5oYlZqOTNRRW1Jd2NmUXBW?=
 =?utf-8?B?RWY2MExoZStucDRnSFdnVlFlLzJGUGR3aHpjelRRZEUyektOTmhJdFhQeURQ?=
 =?utf-8?B?dzVua1ZKRXUzQTVxOTBiSGhpUWRVNmdydEZyOEEzN2JHRHl5L2d3cnJHYnlY?=
 =?utf-8?B?bUd2YmoxVlNnTUtuK05PZzdHTGMwYk40Yk11QmRpMEhWbXM3SWlEcXVXOHZM?=
 =?utf-8?B?QnV1RXlKTWxNMWR4OVFDemI0dWZZREFEZHE0MHBPb2Y1bExKTzdndlc1dHFK?=
 =?utf-8?B?T3pYWXE0L3RqcWJ4bXZmcFdTQ0VsYWtVV1p1RGE5azhzTW8wTUJTYjZFMEVq?=
 =?utf-8?B?anRZRFFmQ2RJWXJrMWtqcGZYeWhwK3NLY0ErR3U1NStCeG54aDhMNHFLdWtP?=
 =?utf-8?B?TkE2aGkyMVRhWXFuQ1hVYzVyT2JtWTNjc3k0OUNXWmpwc3l3UnZXdXRXajYw?=
 =?utf-8?B?ZXRzUUYrK1JuRGV2VlplcVRPbnFXdy9iY3lNVDB1UFZhY3llRkF3SFFMb2Vr?=
 =?utf-8?B?Rll0VDJDTzdEVVlMK0NVWlBCZmV5M2hIL0ZBVktwamg2enJXbGNYUndqRUVD?=
 =?utf-8?B?S3BFTU9xZUkwQTZwNGl0RDlONGt3LzJyS1dDclI2dkRLTERHdVZRYkRMbmxu?=
 =?utf-8?B?UGxNOEcvMEpxWkRhVVhBdVI1M0g5UEdTM2VERkQ5OGVEQktrQ0Z0ckVzTFlp?=
 =?utf-8?B?Unh0Q1EyajMyb1luRmpxemJER3NtNmtXdjgzTlE3c3FrZ2RxQTNjYVlxakp2?=
 =?utf-8?B?REFSUEJkc21ZVzl1NTkxenRlZi9wd0ZWVE5CVTZaMWpEQWE5U01JdUhXQ2hU?=
 =?utf-8?B?VWVMRkVWcU1Db3dJd3hSWUJZOXBRMkpZeXlnUDB6SStzbVhEU3JPcHE5bTJW?=
 =?utf-8?B?T1hKUG96dXBsVlZGazVxYnlWYVQwU0VXMXI5R2ZIRk1zODBEKzhjUjJUVjZ1?=
 =?utf-8?B?NkJwSEtYOWhOcjBwaHRWRzdxUjZzM1haQjdVY0tpVWRjUEZFYUlSeC9DRktQ?=
 =?utf-8?B?ei9CcEtxQTJDSDlWVVB3QzFnQkRyRGpiWm5WRXladktnRXJRZUhycDRWREJt?=
 =?utf-8?B?WGYvcTRaMjdEcUNOckVmM0l5V01QMjk1dXJFcE1RWWs5MkQ3WEIvN3NvQm9O?=
 =?utf-8?B?OGRjMGJTcG9SUGRhUkhYSTFGYzJtREdFSVNMSlRmM3ZSTzFDTTAxME51RjRp?=
 =?utf-8?B?cU5oQUZPbDkyUXZLRUlZeEwzdG1YZkk0WUpLVlZDQWRpd25BblhwQzRaYXcx?=
 =?utf-8?B?MzlYbjJHU0czVDVXeVRvZE5pNDlNeENpYzRiekpUNHZtbWU1UjhCWmtTRmtC?=
 =?utf-8?B?ajNOOVJ6c0tUQ3Y4K3Q4dDFTOUlCcCs4MlJvaEcxWnVtTzQxUTVNemhBbzdm?=
 =?utf-8?B?bnArNFRqdHp2ZVM0UTVkZ2lMT0drN3dXT00xUEh6eFIxVmQwNGR0a29ZTVdM?=
 =?utf-8?B?akthOTN5WTJLRVlpNmprTktqM2o5L2loemtwaCt4OFMzVGhYT05HdFo5c2d6?=
 =?utf-8?B?aXl4THp4Y0RITDh5dUZKYVlyMTNTMm5MakFNTVhIN0d2YUg2WmpLSEtHQklG?=
 =?utf-8?B?ZERJWThlK2VjdnV2eC90RGlIcis3WGhidUJ4RVE0RkU4anFFeFNEbUh0MWpt?=
 =?utf-8?B?TkVQcWZPTytTMnA1WGFKL1F1RGFwbjJHbDBMU1BtTm9qVGVaalAxYy9OVklU?=
 =?utf-8?B?QTB5QUE5VnBTNDBwZmJZWEpOZ2RRUUprRDBmWmZLc1paKy9DSmZ2cmFsQnBB?=
 =?utf-8?B?cGpmbWVTZWdjbVBTR3kzRXNUVzF1bEQvWFlBVGlFSGNGaitiYUFVeUFxaFZW?=
 =?utf-8?B?UFZXSVFXR0Q0NlBnSjRUcjdTVFBiY1U4Mmh3Nm84NlhIa3NqK1ViYklBM0NU?=
 =?utf-8?B?TGwyZ0RFcCtKTXNzTENpTXRLc3ptYk9kUVNzNVlSeWZobVdydm5ScG1LN0dE?=
 =?utf-8?B?T1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR01MB6201.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac14d00f-a9a8-450e-6f79-08da6ed4c3ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 07:02:12.2667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wtAX4dGMyogZOC/m2tHZLskth76bfFMqX0v/Q27jI4KxVOmk5w9PBn7KLGa1967JQGzxOkxx4V9+SqGycvlebFdps356pgS6x0elwJkzEA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3859
X-OriginatorOrg: toshiba.co.jp
MSSCP.TransferMailToMossAgent: 103
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgR3JlZywNCg0KVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnRzLg0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPg0KPiBTZW50OiBNb25kYXksIEp1bHkgMjUsIDIwMjIgOTo0NiBQTQ0KPiBUbzogaXNoaWth
d2EgeXVqaSjnn7Plt50g5oKg5Y+4IOKXi++8su+8pO+8o+KWoe+8oe+8qe+8tO+8o+KXi++8pe+8
oemWiykNCj4gPHl1amkyLmlzaGlrYXdhQHRvc2hpYmEuY28uanA+DQo+IENjOiBSb2IgSGVycmlu
ZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgSGFucyBWZXJrdWlsIDxodmVya3VpbEB4czRhbGwubmw+
Ow0KPiBpd2FtYXRzdSBub2J1aGlybyjlsqnmnb4g5L+h5rSLIOKWoe+8s++8t++8o+KXr++8oe+8
o++8tCkNCj4gPG5vYnVoaXJvMS5pd2FtYXRzdUB0b3NoaWJhLmNvLmpwPjsgSm9uYXRoYW4gQ29y
YmV0IDxjb3JiZXRAbHduLm5ldD47DQo+IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFy
by5vcmc+OyBDaHJpc3RpYW4gS8O2bmlnDQo+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+OyBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsNCj4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi81XSBzb2M6IHZpc2NvbnRpOiBBZGQgVG9zaGliYSBWaXNj
b250aSBpbWFnZQ0KPiBwcm9jZXNzaW5nIGFjY2VsZXJhdG9yIGNvbW1vbiBzb3VyY2UNCj4gDQo+
IE9uIEZyaSwgSnVsIDIyLCAyMDIyIGF0IDA1OjI4OjU1UE0gKzA5MDAsIFl1amkgSXNoaWthd2Eg
d3JvdGU6DQo+ID4gVGhpcyBjb21taXQgYWRkcyBjb21tb24gZGVmaW5pdGlvbnMgc2hhcmVkIGFt
b25nIGltYWdlIHByb2Nlc3NpbmcNCj4gPiBhY2NlbGVyYXRvciBkcml2ZXJzIGZvciBUb3NoaWJh
IFZpc2NvbnRpIFNvQ3MuDQo+IA0KPiBQbGVhc2Ugd3JhcCB5b3VyIGNoYW5nZWxvZyB0ZXh0IGxp
bmVzIHByb3Blcmx5IGF0IDcyIGNvbHVtbnMuDQo+DQo+IEFuZCB5b3UgbmVlZCB0byBwcm92aWRl
IGEgbG90IG1vcmUgaW5mb3JtYXRpb24gaGVyZSBhcyB0byB3aGF0IHRoaXMgaXMsIGl0J3Mgbm90
DQo+IGVub3VnaCB0byBiZSBhYmxlIHRvIHByb3Blcmx5IHJldmlldyB0aGlzIHdpdGgganVzdCBh
IHNpbmdsZSBzZW50ZW5jZS4NCj4NCg0KSSdsbCB1cGRhdGUgY2hhbmdlbG9nLg0KDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBZdWppIElzaGlrYXdhIDx5dWppMi5pc2hpa2F3YUB0b3NoaWJhLmNv
LmpwPg0KPiA+IFJldmlld2VkLWJ5OiBOb2J1aGlybyBJd2FtYXRzdSA8bm9idWhpcm8xLml3YW1h
dHN1QHRvc2hpYmEuY28uanA+DQo+ID4gLS0tDQo+ID4gdjEgLT4gdjI6DQo+ID4gICAtIGFwcGxp
ZWQgY2hlY2twYXRjaC5wbCAtLXN0cmljdA0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3NvYy9LY29u
ZmlnICAgICAgICAgICAgICAgfCAgMSArDQo+ID4gIGRyaXZlcnMvc29jL01ha2VmaWxlICAgICAg
ICAgICAgICB8ICAxICsNCj4gPiAgZHJpdmVycy9zb2MvdmlzY29udGkvS2NvbmZpZyAgICAgIHwg
IDEgKw0KPiA+ICBkcml2ZXJzL3NvYy92aXNjb250aS9NYWtlZmlsZSAgICAgfCAgNiArKysNCj4g
PiAgZHJpdmVycy9zb2MvdmlzY29udGkvaXBhX2NvbW1vbi5jIHwgNTUgKysrKysrKysrKysrKysr
KysrKw0KPiA+IGRyaXZlcnMvc29jL3Zpc2NvbnRpL2lwYV9jb21tb24uaCB8IDE4ICsrKysrKysN
Cj4gPiAgZHJpdmVycy9zb2MvdmlzY29udGkvdWFwaS9pcGEuaCAgIHwgOTANCj4gKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICA3IGZpbGVzIGNoYW5nZWQsIDE3MiBpbnNlcnRp
b25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy92aXNjb250aS9LY29u
ZmlnICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBkcml2ZXJzL3NvYy92aXNjb250aS9NYWtlZmls
ZSAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gZHJpdmVycy9zb2MvdmlzY29udGkvaXBhX2NvbW1v
bi5jICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBkcml2ZXJzL3NvYy92aXNjb250aS9pcGFfY29t
bW9uLmggIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IGRyaXZlcnMvc29jL3Zpc2NvbnRpL3VhcGkv
aXBhLmgNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9LY29uZmlnIGIvZHJpdmVy
cy9zb2MvS2NvbmZpZyBpbmRleA0KPiA+IGU4YTMwYzRjNS4uYzk5MTM5YWE4IDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvc29jL0tjb25maWcNCj4gPiArKysgYi9kcml2ZXJzL3NvYy9LY29uZmln
DQo+ID4gQEAgLTIyLDYgKzIyLDcgQEAgc291cmNlICJkcml2ZXJzL3NvYy90ZWdyYS9LY29uZmln
Ig0KPiA+ICBzb3VyY2UgImRyaXZlcnMvc29jL3RpL0tjb25maWciDQo+ID4gIHNvdXJjZSAiZHJp
dmVycy9zb2MvdXg1MDAvS2NvbmZpZyINCj4gPiAgc291cmNlICJkcml2ZXJzL3NvYy92ZXJzYXRp
bGUvS2NvbmZpZyINCj4gPiArc291cmNlICJkcml2ZXJzL3NvYy92aXNjb250aS9LY29uZmlnIg0K
PiA+ICBzb3VyY2UgImRyaXZlcnMvc29jL3hpbGlueC9LY29uZmlnIg0KPiA+DQo+ID4gIGVuZG1l
bnUNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvTWFrZWZpbGUgYi9kcml2ZXJzL3NvYy9N
YWtlZmlsZSBpbmRleA0KPiA+IGEwNWU5ZmJjZC4uNDU1Yjk5M2MyIDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvc29jL01ha2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9zb2MvTWFrZWZpbGUNCj4g
PiBAQCAtMjgsNCArMjgsNSBAQCBvYmotJChDT05GSUdfQVJDSF9URUdSQSkJKz0gdGVncmEvDQo+
ID4gIG9iai15CQkJCSs9IHRpLw0KPiA+ICBvYmotJChDT05GSUdfQVJDSF9VODUwMCkJKz0gdXg1
MDAvDQo+ID4gIG9iai0kKENPTkZJR19QTEFUX1ZFUlNBVElMRSkJKz0gdmVyc2F0aWxlLw0KPiA+
ICtvYmotJChDT05GSUdfQVJDSF9WSVNDT05USSkJKz0gdmlzY29udGkvDQo+ID4gIG9iai15CQkJ
CSs9IHhpbGlueC8NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvdmlzY29udGkvS2NvbmZp
Zw0KPiA+IGIvZHJpdmVycy9zb2MvdmlzY29udGkvS2NvbmZpZyBuZXcgZmlsZSBtb2RlIDEwMDY0
NCBpbmRleA0KPiA+IDAwMDAwMDAwMC4uOGIxMzc4OTE3DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+
ICsrKyBiL2RyaXZlcnMvc29jL3Zpc2NvbnRpL0tjb25maWcNCj4gPiBAQCAtMCwwICsxIEBADQo+
ID4gKw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy92aXNjb250aS9NYWtlZmlsZQ0KPiA+
IGIvZHJpdmVycy9zb2MvdmlzY29udGkvTWFrZWZpbGUgbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5k
ZXgNCj4gPiAwMDAwMDAwMDAuLjhkNzEwZGEwOA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysg
Yi9kcml2ZXJzL3NvYy92aXNjb250aS9NYWtlZmlsZQ0KPiA+IEBAIC0wLDAgKzEsNiBAQA0KPiA+
ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gKyMNCj4gPiArIyBNYWtl
ZmlsZSBmb3IgdGhlIFZpc2NvbnRpIHNwZWNpZmljIGRldmljZSBkcml2ZXJzLg0KPiA+ICsjDQo+
ID4gKw0KPiA+ICtvYmoteSArPSBpcGFfY29tbW9uLm8NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zb2MvdmlzY29udGkvaXBhX2NvbW1vbi5jDQo+ID4gYi9kcml2ZXJzL3NvYy92aXNjb250aS9p
cGFfY29tbW9uLmMNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAw
MC4uNjM0NWYzM2M1DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvc29jL3Zp
c2NvbnRpL2lwYV9jb21tb24uYw0KPiA+IEBAIC0wLDAgKzEsNTUgQEANCj4gPiArLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlDQo+IA0KPiBXaHkgaXMg
dGhpcyBkdWFsLWxpY2Vuc2VkPyAgSSBoYXZlIHRvIGFzaywgYW5kIGFsc28sIGhhdmUgdG8gc2Vl
IHNvbWUgc29ydCBvZg0KPiBqdXN0aWZpY2F0aW9uIGFzIHRvIHdoeSB0aGlzIGlzIG5lZWRlZC4g
IERvaW5nIGR1YWwtbGljZW5zZWQga2VybmVsIGNvZGUgaXMNCj4gdG91Z2ggYW5kIGEgcGFpbiBh
bmQgd2UgbmVlZCB0byBrbm93IHRoYXQgeW91LCBhbmQgeW91ciBsYXd5ZXJzLCB1bmRlcnN0YW5k
DQo+IHRoZSBpc3N1ZXMgaW52b2x2ZWQgaGVyZS4NCj4NCg0KSSdsbCB0YWxrIHdpdGggZGV2ZWxv
cG1lbnQgbWVtYmVycy4NCg0KPiANCj4gPiArLyogVG9zaGliYSBWaXNjb250aSBJbWFnZSBQcm9j
ZXNzaW5nIEFjY2VsZXJhdG9yIFN1cHBvcnQNCj4gPiArICoNCj4gPiArICogKEMpIENvcHlyaWdo
dCAyMDIyIFRPU0hJQkEgQ09SUE9SQVRJT04NCj4gPiArICogKEMpIENvcHlyaWdodCAyMDIyIFRv
c2hpYmEgRWxlY3Ryb25pYyBEZXZpY2VzICYgU3RvcmFnZQ0KPiA+ICtDb3Jwb3JhdGlvbiAgKi8N
Cj4gPiArDQo+ID4gKyNpbmNsdWRlICJpcGFfY29tbW9uLmgiDQo+ID4gKw0KPiA+ICtpbnQgaXBh
X2F0dGFjaF9kbWFidWYoc3RydWN0IGRldmljZSAqZGV2LCBpbnQgZmQsIHN0cnVjdA0KPiBkbWFf
YnVmX2F0dGFjaG1lbnQgKiphLA0KPiA+ICsJCSAgICAgIHN0cnVjdCBzZ190YWJsZSAqKnMsIGRt
YV9hZGRyX3QgKmFkZHIsIGVudW0NCj4gPiArZG1hX2RhdGFfZGlyZWN0aW9uIGRtYV9kaXIpIHsN
Cj4gPiArCXN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaG1lbnQ7DQo+ID4gKwlzdHJ1
Y3QgZG1hX2J1ZiAqZG1hYnVmOw0KPiA+ICsJc3RydWN0IHNnX3RhYmxlICpzZ3Q7DQo+ID4gKwlp
bnQgcmV0Ow0KPiA+ICsNCj4gPiArCWRtYWJ1ZiA9IGRtYV9idWZfZ2V0KGZkKTsNCj4gPiArCWlm
IChJU19FUlIoZG1hYnVmKSkgew0KPiA+ICsJCWRldl9lcnIoZGV2LCAiSW52YWxpZCBkbWFidWYg
RkRcbiIpOw0KPiA+ICsJCXJldHVybiBQVFJfRVJSKGRtYWJ1Zik7DQo+ID4gKwl9DQo+ID4gKwlh
dHRhY2htZW50ID0gZG1hX2J1Zl9hdHRhY2goZG1hYnVmLCBkZXYpOw0KPiA+ICsNCj4gPiArCWlm
IChJU19FUlIoYXR0YWNobWVudCkpIHsNCj4gPiArCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBh
dHRhY2ggZG1hYnVmXG4iKTsNCj4gPiArCQlyZXQgPSBQVFJfRVJSKGF0dGFjaG1lbnQpOw0KPiA+
ICsJCWdvdG8gZXJyX3B1dDsNCj4gPiArCX0NCj4gPiArCXNndCA9IGRtYV9idWZfbWFwX2F0dGFj
aG1lbnQoYXR0YWNobWVudCwgZG1hX2Rpcik7DQo+ID4gKwlpZiAoSVNfRVJSKHNndCkpIHsNCj4g
PiArCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgZG1hYnVmcyBzZ190YWJsZVxuIik7DQo+
ID4gKwkJcmV0ID0gUFRSX0VSUihzZ3QpOw0KPiA+ICsJCWdvdG8gZXJyX2RldGFjaDsNCj4gPiAr
CX0NCj4gPiArCWlmIChzZ3QtPm5lbnRzICE9IDEpIHsNCj4gPiArCQlkZXZfZXJyKGRldiwgIlNw
YXJzZSBETUEgcmVnaW9uIGlzIHVuc3VwcG9ydGVkXG4iKTsNCj4gPiArCQlyZXQgPSAtRUlOVkFM
Ow0KPiA+ICsJCWdvdG8gZXJyX3VubWFwOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCSphZGRyID0g
c2dfZG1hX2FkZHJlc3Moc2d0LT5zZ2wpOw0KPiA+ICsJKmEgPSBhdHRhY2htZW50Ow0KPiA+ICsJ
KnMgPSBzZ3Q7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICtlcnJfdW5tYXA6
DQo+ID4gKwlkbWFfYnVmX3VubWFwX2F0dGFjaG1lbnQoYXR0YWNobWVudCwgc2d0LCBkbWFfZGly
KTsNCj4gPiArZXJyX2RldGFjaDoNCj4gPiArCWRtYV9idWZfZGV0YWNoKGRtYWJ1ZiwgYXR0YWNo
bWVudCk7DQo+ID4gK2Vycl9wdXQ6DQo+ID4gKwlkbWFfYnVmX3B1dChkbWFidWYpOw0KPiA+ICsJ
cmV0dXJuIHJldDsNCj4gPiArfQ0KPiANCj4gV2h5IGRvIHlvdSBoYXZlIGEgd2hvbGUgZmlsZSBm
b3Igb25lIGZ1bmN0aW9uPyAgVGhhdCBmZWVscyB1bm5lZWRlZC4NCj4gDQoNClRoZSBmdW5jdGlv
biBpcGFfYXR0YWNoX2RtYWJ1ZigpIGlzIHNoYXJlZCBhbW9uZyBzZXZlcmFsIGFjY2VsZXJhdG9y
IGRyaXZlcnMuDQpWaXNjb250aSBoYXMgb3RoZXIgOCBraW5kcyBvZiBhY2NlbGVyYXRvcnM7IEFm
ZmluZSwgUHlyYW1pZCwgRFNQSUYsIC4uLg0KSSBzaG91bGQgaGF2ZSBtZW50aW9uZWQgZGV0YWls
IG9mIGhvdyBpcGFfY29tbW9uLmMgaXMgdXNlZC4gU29ycnkuDQoNCj4gdGhhbmtzLA0KPiANCj4g
Z3JlZyBrLWgNCg0KUmVnYXJkcywNCiAgWXVqaQ0K

