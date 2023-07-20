Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF7375A4BF
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 05:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjGTD10 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jul 2023 23:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjGTD1Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jul 2023 23:27:25 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2084.outbound.protection.outlook.com [40.107.8.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 675F292
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 20:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFGHTMEH265YxmPP5/v5mW+XRmYFq8vf1utxOTSdAItGkWzQC246W1Qm1Ir1tzmDZsKtQhQvJV3XPUy9GSJ9ZiheiYi3ZIQvD7y40fbhFEPnJVrUF9k7eCW6oFD0mqsOraYqkD8/isebvgj/SPU6xTNFSL8GkrJoD0W3jkMEk6YKyTpsRIVcNCQ/i/Bpc3UMcatZN3wAsTd1cIfBADjzQuGlM6afLb0a4HoMjFf+9PPTT+yuvlqq5Bkjs/Ku+EMeQ3s6WwgnmGq+IDCEF4sGuhuOSY0SplAHWAFh8s8gkH4ZYzjleD3JxqHPluS/rXdwj3k+OKbmopi4piZW2KfRWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=God+COXWNCLizZm5AQV82AOA/T0pAkD34j3rSJc+Hj4=;
 b=D/qNX0EOrCyhcCwtf9cHCD6AFJcUqwdi4bnjD36b9z5JDHNc83upUguZl7ZhcXG8q74QgtK/6gfSb+Xk/HlQBHvoll2MCQ7EWBsqzbBhqcmHjT4jVZi2Sx7RvAKu8zgeNVgwOKZKNnks4zYeHLdZnNHF4TOKAHK0A8+vnSIRgwMXWpxvd6aQE8xpFRGdBHgGJoaYLrPGRdA+zBQlwFkUGsEADOMxmZ2/P7Ans4K8slbnu6W4V2lzgA+k4A82S5yvIk6720W/+isdq5VMNoW+xbnwMOeSG7s+wcaZDx7odRBvF7U+vMp+yDlsfA9vy/xBGNwJnfSC3/Cn+aYy3B/hpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=God+COXWNCLizZm5AQV82AOA/T0pAkD34j3rSJc+Hj4=;
 b=Dc3lobZt7rTaXCXfe0zXA4dFfKv2A1QCXDbTH0OOIV2yL7ldM66YFynDqqRfXbbbvxQb3BgsfDJndgKStNALGQA92+6b8A3k6CqYAiLAvVwY8U4HFStYO1OFpQ/BmizTwMzBX+Ne6cSxkDxI4Zou56tdF3jEPYkoduUSGPMUC7U=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8206.eurprd04.prod.outlook.com (2603:10a6:102:1cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 03:27:20 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d253:6cce:4b4d:ec08]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d253:6cce:4b4d:ec08%3]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 03:27:20 +0000
From:   "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To:     Alain Volmat <alain.volmat@foss.st.com>,
        "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH] media: ov5640: fix vblank unchange issue when work at dvp
 mode
Thread-Topic: [PATCH] media: ov5640: fix vblank unchange issue when work at
 dvp mode
Thread-Index: AQHZuhIxvDEI3x3mF06RFpgwkNLpS6/A+OQAgAEGDbA=
Date:   Thu, 20 Jul 2023 03:27:20 +0000
Message-ID: <AS8PR04MB9080C023F628B0C2A1AB40B1FA3EA@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230719073012.3739998-1-guoniu.zhou@oss.nxp.com>
 <20230719114530.GA1066391@gnbcxd0016.gnb.st.com>
In-Reply-To: <20230719114530.GA1066391@gnbcxd0016.gnb.st.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PAXPR04MB8206:EE_
x-ms-office365-filtering-correlation-id: ca63732f-9700-40e0-e48c-08db88d139c4
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fxJjfBlNrtUEOoFPqh7BqnW1bS3ps0svKASXfKClbD7d/CmB/tm5zD0Zf0HDQmeVul0S2S9TjXLfAIbc4slag7EfHIGQOImtniXMeuV0lIti174hH8UTF3L0Y3dwuJLExF0OExososAkmyDT2VHxv2HpM6R11J9lhkTcRQ600lTz5KBXikzZ3cX9U7St2W4ML+29d1/pvBkkPGerogDpIt3kc4XOhXcOsjQeN8+sC0O40QMnERKRrFb0BYBx7ewKRPxpg84sawklob2566yUv7YjcQLXbVMefUUEIA037ryIS6kFA+NKsI6CM5GMZwglwZKNOHcf3AGoLR/W45ppeZrJirZ102PabIE971jMzkymCPShZJzAvAyjLtr77VtAOJceEDHaRudcnfPrY6NnoA4wFNoS751gGxpvDYNC5+AS396A23+8PZuw9gjF855pN+eNGcjZ9IlpVXaLqplRwfaYwCp5WEGo3/3LuWdNkETuIrlF0QBWPHzTRoHL17JwzoOLp0SWGAkWlYvPl9SPH+pl9A5BSyDiJBf/xlhfJRTZUfKeSkXiPQgC+sv3a9jMX4agjz8zcNuBCcEj1W2nNRU8jqx2DAsHvecDeqrzwxv3SRdXp1GnWRzrlqI5aI4+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199021)(2906002)(9686003)(38070700005)(71200400001)(86362001)(6506007)(53546011)(186003)(83380400001)(122000001)(38100700002)(26005)(55016003)(478600001)(7696005)(110136005)(33656002)(54906003)(66446008)(316002)(66556008)(41300700001)(66476007)(64756008)(4326008)(52536014)(8936002)(8676002)(5660300002)(66946007)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?QVcwbmJsbVBvSUp5K2paRHRoaGY5eUtVRjQwVzlFUzNKK2NmZUNDcnptdUsw?=
 =?gb2312?B?RUdPOUQ4QTh0L1puUTBxU1ZUY2ppUXBvKzkvQmNKNGJtZVBJanB1Z3FXS2N5?=
 =?gb2312?B?ZnFiSkUwVFVLWHBoa3FjdTVVckt2Tm80WXduK1BmaFJheG1tL1pCMlRMV200?=
 =?gb2312?B?Z3JrZjBSc1poV0VQaTk3Z010OEhWKzdBY093L0lPZkpZdkMzZ2xuS05helFW?=
 =?gb2312?B?a0orc0EwVG5TdUlna2VwQ1JNWHZkS3JFSnIxN2dvdHhvVzFpRGdXVHNRL0kw?=
 =?gb2312?B?M0l4US9uN0dTbUNBUEU2MkRjeWFpNGtKbWxiUFVCRXU4dDdOSGgzS3M5ZEto?=
 =?gb2312?B?S1B3WDI5TWxZWDNTMlNJczdPRzI3dU01VGJXSkRNeFdjbnY0cUtZT044NFUv?=
 =?gb2312?B?NXZVTGJzd1ZYZURqSWtxVkxWaHAzTDRTTG5vNkd1VWY2Tm9wUUR1bVIxRlJT?=
 =?gb2312?B?UVF2aGhxcE42YlJlRkFlRWlURDIwV0xtZlhOWXVodnEvbmxZTGpFQWcrQ2JE?=
 =?gb2312?B?RllwVmR4SE5NaGtNaW5RL1oxTGtYczRpS25tNWdnUlJSOWpVRkV3OE0vbU5C?=
 =?gb2312?B?akYyYlNLOEhYaXRMVHpIeVUzSCtZM1BKS0NTek9ackdiOUJINjFsMnU4VE1w?=
 =?gb2312?B?WkFHR3FCdFBoQitCRWkyZUhMSzRnVlFyYlRIdEpPSEZqRkdwTGRJQ1ZyU3V4?=
 =?gb2312?B?MDlISWpDcnZoME1MUlJETzRiSDR2NlFsTGx6T2dYZjdES1ExcnNrMDBjWVRn?=
 =?gb2312?B?UXBUM0o4UkJZN3BuS1YzUHpuTDVqeTJ1OFRCRWNSc1g2MExSK3RObnUvU0F0?=
 =?gb2312?B?V1p0Ung1dmtia09oREhQMjFvMjUwclQ4cW9zdk5hanRsenhnZFZLMjhFWXJw?=
 =?gb2312?B?NFdiczZzQW5MT2Z0dW1RdDNoSlZzWnZEOHdRUEFkb1RhMG9iaGNIRGdUck0z?=
 =?gb2312?B?VzJjUEl1NWFWdjVDU21mWXViSTVCbS9kZkJaVWxPbldwUlNZS2pDQzhvb3FW?=
 =?gb2312?B?N0doM3BzNm14bVVqVmlnUXR1VnR3U3JXVmZZTzB6ZlJoaTVKRDNUelNFL25i?=
 =?gb2312?B?T1VjL2tONTBIK1N2Vmg5Y2NEdVIwS3Bsdnl3dHdYaFpwMVNtazJOSUFjZXEw?=
 =?gb2312?B?c2tUWU40cjgzbVhIZktYY1o1SUk3N1BmMjdUbVhFR2ZMa0hGRDlRdy80bEJm?=
 =?gb2312?B?Y1VLdVhlekQ2Z0xXUzRsMzl0Qlhrc2JYamladkdpcUNoc0RPL3Jjd3dVNjdW?=
 =?gb2312?B?SGxubW9RM1JFSUpkS00vK0VPRW1XbXhIdU5xbnl1S01tQ0NDKzh5YWVXcU5M?=
 =?gb2312?B?cit0bkRRVlpieDdvTW9HSjA1MVhPSWcxZ2c0RTZ1TzBGNENIZldYZENGSmFE?=
 =?gb2312?B?M3pScTBQNjB6eUZvdVJwMjY4bHJYMGhFeE9kTFp3Mk90WUJaT29EYzFWbXpu?=
 =?gb2312?B?clhQZ2FmamhLakJlenJYMW9LYkNQS2VxdWdEbXl1akVDZU1rMU9Qb29XMVJG?=
 =?gb2312?B?ZUxjYUZQZFlpRGhLd2xkcmxZTVpnemtCOVlsZDdGRXNIdnd6OG1zcDhpTFBI?=
 =?gb2312?B?ZGVtMHlGb0dxejVGdlZvSDUrdXUyajJ6bjBMajI4NGRBOWZKMk9hSU9OamxZ?=
 =?gb2312?B?aWg2NXBEUjJHL1VQNHIxQTdheTBCMGJuMmNTOHBhWTgzWmRBTi9IeldHRklN?=
 =?gb2312?B?RnMvbVk3dkVUaEtBNXp6bk5YNHhiOW5qRHNibVcxT2RYN3JNV0s3bERKZW85?=
 =?gb2312?B?MFRkYTBTSHNoS2dkRk00N2xvRU5FQlg2MjI3bXQ0SjloV215L3hYV1Z0Y0w5?=
 =?gb2312?B?djZZM3pYeUZwWGorN3RmN0lXaGQ2R0pCNC95SVNIeGlYNy9QdUM5VUlRK0Fk?=
 =?gb2312?B?RXB3d0tMbVdicWJac0gwczMxbjJDUTFaRUViWUVOVzRPcmZoK3B1d0twKzh5?=
 =?gb2312?B?em1VVnNLNitaV3ZqTmNOcWVnZTlpTmxKZVQrTXFOSjNJS21weit2U2ZPNU5k?=
 =?gb2312?B?YmlQd2ZhK0tybDZjRVNOS29NM0ZiaU9pbUdSY1hCZVd6V1pUOHNkblNqZWpO?=
 =?gb2312?B?dXV4WUk2akthZ013Sk5lQngzUEp0dnNwNC9JVHpQK0wycFVxaDc0SDlqamk3?=
 =?gb2312?Q?Q+RB65Oxg30hkr483dmdYBMqu?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca63732f-9700-40e0-e48c-08db88d139c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 03:27:20.1404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: an4pHWkqlVlgyuPP+knrkDZy0y6KGs2zSadsRpHKaM+mCgv2ctgsWfUM1ayzAsDDotdZugRdRXFM3ChRO76q4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8206
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQWxhaW4sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxhaW4g
Vm9sbWF0IDxhbGFpbi52b2xtYXRAZm9zcy5zdC5jb20+DQo+IFNlbnQ6IDIwMjPE6jfUwjE5yNUg
MTk6NDYNCj4gVG86IEcuTi4gWmhvdSAoT1NTKSA8Z3Vvbml1Lnpob3VAb3NzLm54cC5jb20+DQo+
IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IG1jaGVoYWJAa2VybmVsLm9yZzsNCj4g
c2xvbmdlcmJlYW1AZ21haWwuY29tOyBzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tOw0KPiBq
YWNvcG8ubW9uZGlAaWRlYXNvbmJvYXJkLmNvbTsgbGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIG1lZGlhOiBvdjU2NDA6IGZpeCB2Ymxhbmsg
dW5jaGFuZ2UgaXNzdWUgd2hlbiB3b3JrIGF0DQo+IGR2cCBtb2RlDQo+IA0KPiBDYXV0aW9uOiBU
aGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcg
bGlua3Mgb3Igb3BlbmluZw0KPiBhdHRhY2htZW50cy4gV2hlbiBpbiBkb3VidCwgcmVwb3J0IHRo
ZSBtZXNzYWdlIHVzaW5nIHRoZSAnUmVwb3J0IHRoaXMgZW1haWwnDQo+IGJ1dHRvbg0KPiANCj4g
DQo+IEhpIEd1b25pdSwNCj4gDQo+IEkgY2FtZSB1cCB0byB0aGUgc2FtZSBjb25jbHVzaW9uIGFi
b3V0IHdyb25nIHZibGFuayB3aGVuIHRyeWluZyB0byBtYWtlIHRoZQ0KPiBPVjU2NDAgd29yayBp
biBEVlAgbW9kZSBzbyBJIGFncmVlIGFib3V0IHRoaXMgbW9kaWZpY2F0aW9uLg0KPiANCj4gSG93
ZXZlciBJIHRoaW5rIG90aGVyIGN0cmxzIGFsc28gaGF2ZSB0aGUgc2FtZSBpc3N1ZSwgYXQgbGVh
c3QgZXhwb3N1cmUuICBJIGFtDQo+IHdvbmRlcmluZyBpZiB3ZSBzaG91bGQga2VlcCB0aGUgc3Bs
aXR0ZWQgY29kZSBhcyBjdXJyZW50bHkgYW5kIGFkZCBiYWNrIHRoZQ0KPiBtaXNzaW5nIGN0cmwg
aW4gdGhlIERWUCBtb2RlIHBhdGggb3IgcmV3b3JrIGNvZGUgdG8gYXBwbHkgY3RybCBpbiBib3Ro
IG1vZGVzID8NCj4gQmFzaWNhbGx5IGxpbmtfZnJlcSAvIHBpeGVscmF0ZSBoYW5kbGluZyBkaWZm
ZXIgYmV0d2VlbiBEVlAgYW5kIE1JUEkgYnV0IGl0IHNob3VsZA0KPiBiZSBzYW1lIGhhbmRsaW5n
IGZvciBvdGhlciBjdHJscyBJIHRoaW5rLg0KDQpBcyB5b3Uga25vdywgdGhlIHBhdGNoIGlzIGZv
ciBWQkxBTksgY29udHJvbCBhZGRlZCBpbiAiIGJjZTkzYjgyN2RlNiAoIm1lZGlhOiBvdjU2NDA6
IEFkZCBWQkxBTksgY29udHJvbCIpIiBhbmQgSSBwcmVmZXIgYW5kIGZvbGxvdyAib25lIHBhdGNo
IGRvIG9uZSB0aGluZyIgcnVsZS4NCg0KPiANCj4gUmVnYXJkcywNCj4gQWxhaW4NCj4gDQo+IE9u
IFdlZCwgSnVsIDE5LCAyMDIzIGF0IDAzOjMwOjEyUE0gKzA4MDAsIGd1b25pdS56aG91QG9zcy5u
eHAuY29tIHdyb3RlOg0KPiA+IEZyb206ICJHdW9uaXUuemhvdSIgPGd1b25pdS56aG91QG54cC5j
b20+DQo+ID4NCj4gPiBUaGUgdmFsdWUgb2YgVjRMMl9DSURfVkJMQU5LIGNvbnRyb2wgaXMgaW5p
dGlhbGl6ZWQgdG8gZGVmYXVsdCB2YmxhbmsNCj4gPiB2YWx1ZSBvZiA2NDB4NDgwIHdoZW4gZHJp
dmVyIHByb2JlLiBXaGVuIE9WNTY0MCB3b3JrIGF0IERWUCBtb2RlLCB0aGUNCj4gPiBjb250cm9s
IHZhbHVlIHdvbid0IHVwZGF0ZSBhbmQgbGVhZCB0byBzZW5zb3IgY2FuJ3Qgb3V0cHV0IGRhdGEg
aWYgdGhlDQo+ID4gcmVzb2x1dGlvbiByZW1haW4gdGhlIHNhbWUgYXMgbGFzdCB0aW1lIHNpbmNl
IGluY29ycmVjdCB0b3RhbCB2ZXJ0aWNhbA0KPiA+IHNpemUuIFNvIHVwZGF0ZSBpdCB3aGVuIHRo
ZXJlIGlzIGEgbmV3IHZhbHVlIGFwcGxpZWQuDQo+ID4NCj4gPiBGaXhlczogYmNlOTNiODI3ZGU2
ICgibWVkaWE6IG92NTY0MDogQWRkIFZCTEFOSyBjb250cm9sIikNCj4gPiBTaWduZWQtb2ZmLWJ5
OiBHdW9uaXUuemhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVy
cy9tZWRpYS9pMmMvb3Y1NjQwLmMgfCAxOSArKysrKysrKysrKysrKy0tLS0tDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0MC5jIGIvZHJpdmVycy9tZWRpYS9pMmMv
b3Y1NjQwLmMNCj4gPiBpbmRleCAzNmI1MDk3MTRjOGMuLjJmNzQyZjVmOTVmZCAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVk
aWEvaTJjL292NTY0MC5jDQo+ID4gQEAgLTI4NTQsMTIgKzI4NTQsMjIgQEAgc3RhdGljIGludCBv
djU2NDBfdHJ5X2ZtdF9pbnRlcm5hbChzdHJ1Y3QNCj4gdjRsMl9zdWJkZXYgKnNkLA0KPiA+ICAg
ICAgIHJldHVybiAwOw0KPiA+ICB9DQo+ID4NCj4gPiArc3RhdGljIHZvaWQgX192NGwyX2N0cmxf
dmJsYW5rX3VwZGF0ZShzdHJ1Y3Qgb3Y1NjQwX2RldiAqc2Vuc29yLCB1MzINCj4gPiArdmJsYW5r
KSB7DQo+ID4gKyAgICAgY29uc3Qgc3RydWN0IG92NTY0MF9tb2RlX2luZm8gKm1vZGUgPSBzZW5z
b3ItPmN1cnJlbnRfbW9kZTsNCj4gPiArDQo+ID4gKyAgICAgX192NGwyX2N0cmxfbW9kaWZ5X3Jh
bmdlKHNlbnNvci0+Y3RybHMudmJsYW5rLA0KPiBPVjU2NDBfTUlOX1ZCTEFOSywNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgT1Y1NjQwX01BWF9WVFMgLSBtb2RlLT5oZWlnaHQs
IDEsDQo+ID4gKyB2YmxhbmspOw0KPiA+ICsNCj4gPiArICAgICBfX3Y0bDJfY3RybF9zX2N0cmwo
c2Vuc29yLT5jdHJscy52YmxhbmssIHZibGFuayk7IH0NCj4gPiArDQo+ID4gIHN0YXRpYyBpbnQg
b3Y1NjQwX3VwZGF0ZV9waXhlbF9yYXRlKHN0cnVjdCBvdjU2NDBfZGV2ICpzZW5zb3IpICB7DQo+
ID4gICAgICAgY29uc3Qgc3RydWN0IG92NTY0MF9tb2RlX2luZm8gKm1vZGUgPSBzZW5zb3ItPmN1
cnJlbnRfbW9kZTsNCj4gPiAgICAgICBlbnVtIG92NTY0MF9waXhlbF9yYXRlX2lkIHBpeGVsX3Jh
dGVfaWQgPSBtb2RlLT5waXhlbF9yYXRlOw0KPiA+ICAgICAgIHN0cnVjdCB2NGwyX21idXNfZnJh
bWVmbXQgKmZtdCA9ICZzZW5zb3ItPmZtdDsNCj4gPiAtICAgICBjb25zdCBzdHJ1Y3Qgb3Y1NjQw
X3RpbWluZ3MgKnRpbWluZ3M7DQo+ID4gKyAgICAgY29uc3Qgc3RydWN0IG92NTY0MF90aW1pbmdz
ICp0aW1pbmdzID0gb3Y1NjQwX3RpbWluZ3Moc2Vuc29yLA0KPiA+ICsgbW9kZSk7DQo+ID4gICAg
ICAgczMyIGV4cG9zdXJlX3ZhbCwgZXhwb3N1cmVfbWF4Ow0KPiA+ICAgICAgIHVuc2lnbmVkIGlu
dCBoYmxhbms7DQo+ID4gICAgICAgdW5zaWduZWQgaW50IGkgPSAwOw0KPiA+IEBAIC0yODc4LDYg
KzI4ODgsOCBAQCBzdGF0aWMgaW50IG92NTY0MF91cGRhdGVfcGl4ZWxfcmF0ZShzdHJ1Y3QNCj4g
b3Y1NjQwX2RldiAqc2Vuc29yKQ0KPiA+ICAgICAgICAgICAgICAgX192NGwyX2N0cmxfc19jdHJs
X2ludDY0KHNlbnNvci0+Y3RybHMucGl4ZWxfcmF0ZSwNCj4gPg0KPiA+IG92NTY0MF9jYWxjX3Bp
eGVsX3JhdGUoc2Vuc29yKSk7DQo+ID4NCj4gPiArICAgICAgICAgICAgIF9fdjRsMl9jdHJsX3Zi
bGFua191cGRhdGUoc2Vuc29yLCB0aW1pbmdzLT52YmxhbmtfZGVmKTsNCj4gPiArDQo+ID4gICAg
ICAgICAgICAgICByZXR1cm4gMDsNCj4gPiAgICAgICB9DQo+ID4NCj4gPiBAQCAtMjkyMCwxNSAr
MjkzMiwxMiBAQCBzdGF0aWMgaW50IG92NTY0MF91cGRhdGVfcGl4ZWxfcmF0ZShzdHJ1Y3QNCj4g
b3Y1NjQwX2RldiAqc2Vuc29yKQ0KPiA+ICAgICAgIF9fdjRsMl9jdHJsX3NfY3RybF9pbnQ2NChz
ZW5zb3ItPmN0cmxzLnBpeGVsX3JhdGUsIHBpeGVsX3JhdGUpOw0KPiA+ICAgICAgIF9fdjRsMl9j
dHJsX3NfY3RybChzZW5zb3ItPmN0cmxzLmxpbmtfZnJlcSwgaSk7DQo+ID4NCj4gPiAtICAgICB0
aW1pbmdzID0gb3Y1NjQwX3RpbWluZ3Moc2Vuc29yLCBtb2RlKTsNCj4gPiAgICAgICBoYmxhbmsg
PSB0aW1pbmdzLT5odG90IC0gbW9kZS0+d2lkdGg7DQo+ID4gICAgICAgX192NGwyX2N0cmxfbW9k
aWZ5X3JhbmdlKHNlbnNvci0+Y3RybHMuaGJsYW5rLA0KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBoYmxhbmssIGhibGFuaywgMSwgaGJsYW5rKTsNCj4gPg0KPiA+ICAgICAgIHZi
bGFuayA9IHRpbWluZ3MtPnZibGFua19kZWY7DQo+ID4gLSAgICAgX192NGwyX2N0cmxfbW9kaWZ5
X3JhbmdlKHNlbnNvci0+Y3RybHMudmJsYW5rLA0KPiBPVjU2NDBfTUlOX1ZCTEFOSywNCj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgT1Y1NjQwX01BWF9WVFMgLSBtb2RlLT5oZWln
aHQsIDEsDQo+IHZibGFuayk7DQo+ID4gLSAgICAgX192NGwyX2N0cmxfc19jdHJsKHNlbnNvci0+
Y3RybHMudmJsYW5rLCB2YmxhbmspOw0KPiA+ICsgICAgIF9fdjRsMl9jdHJsX3ZibGFua191cGRh
dGUoc2Vuc29yLCB2YmxhbmspOw0KPiA+DQo+ID4gICAgICAgZXhwb3N1cmVfbWF4ID0gdGltaW5n
cy0+Y3JvcC5oZWlnaHQgKyB2YmxhbmsgLSA0Ow0KPiA+ICAgICAgIGV4cG9zdXJlX3ZhbCA9IGNs
YW1wX3QoczMyLCBzZW5zb3ItPmN0cmxzLmV4cG9zdXJlLT52YWwsDQo+ID4gLS0NCj4gPiAyLjM3
LjENCj4gPg0K
