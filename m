Return-Path: <linux-media+bounces-1055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C457F96DE
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 01:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DF3CB209E7
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 00:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED1BA44;
	Mon, 27 Nov 2023 00:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
X-Greylist: delayed 256 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 26 Nov 2023 16:48:55 PST
Received: from mo-csw.securemx.jp (mo-csw1800.securemx.jp [210.130.202.134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5980210F;
	Sun, 26 Nov 2023 16:48:55 -0800 (PST)
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 3AR0mYRn2561163; Mon, 27 Nov 2023 09:48:35 +0900
X-Iguazu-Qid: 2yAas7v1iGkBVWH2NN
X-Iguazu-QSIG: v=2; s=0; t=1701046114; q=2yAas7v1iGkBVWH2NN; m=dy75h22WapHojbphbKTqWDJ6C59xa3umETdyotrSToM=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1802) id 3AR0mW4Y1866510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Nov 2023 09:48:33 +0900
X-SA-MID: 12452523
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dId9FAfuG0R7Cqx5keqStMvagUL2lyNDjPr0BhlXfP56fj3XWUN5ZtBGWSkfZvRdINe/dnzcEHclFwUVTKEvqrnU0MWvLN2F5ZUNd3yefUYTZ5SznIYE5jEIOqoLUEoXYqu4gnnB913crL3hFkERwP9F+305Y+xE4AnGWmGxi+IXbbH6+S8gVQ1vZwMhg/B8kxo/I57U3P/XLguIpz7mi9vyNJv3hZNhYsZrsvzVTtlsCS3GWQHL9cX26vuuCCUJqvzsuj2swv+U0mqjQtxbeS1MakQyOaT7yg4OauJ0LS8C+7odLhzacF2IxYXUB/nK2OuFEOcdgZVPcbuNwR3q2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgNpg1iUeKvjWSB6B+42YIRI11/sySL8xMQ8nVjdXhQ=;
 b=Dcflwg5mzVhyEKF4vD5maL2/7EmqHncITDfBNL0CWT1wm4nVAQfUQylTEmN2Z/FeWRjyy/mTKbnO2CIcx3MmD7VU2M+D2zXLLCWOsDDoWtBesbMQu+emlThP2FnkWEQZSvW53ILWojkHggq8ei7CCljRShOGJmClznf2gFOxTitOFomODtX7LUIFhUwaABF/nm3Zu8npxpdeNw375GLgQCSczURFhpL2u8DHDgyfnsZOEjF0D5rDHD4b26j/8ntYWU+yaUxjXbOzgVgZg75MkYCEP3e1Ax7UPLfHg10REBZT+CWrfMg8f+ZYUKPDIyEViV1yGwzFia3e4YiXiLJifg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <hverkuil@xs4all.nl>, <laurent.pinchart@ideasonboard.com>,
        <mchehab@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <nobuhiro1.iwamatsu@toshiba.co.jp>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v9 3/5] media: platform: visconti: add V4L2 vendor
 specific control handlers
Thread-Topic: [PATCH v9 3/5] media: platform: visconti: add V4L2 vendor
 specific control handlers
Thread-Index: AQHZ/Nve8uFsKwuA1kS5qZEegWb9T7B5uM0AgBPix1A=
Date: Mon, 27 Nov 2023 00:43:21 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TYAPR01MB620109D13BA981F8F6BBA49092BDA@TYAPR01MB6201.jpnprd01.prod.outlook.com>
References: <20231012071329.2542003-1-yuji2.ishikawa@toshiba.co.jp>
 <20231012071329.2542003-4-yuji2.ishikawa@toshiba.co.jp>
 <6095bd3d-2580-44e2-b622-3ad31e12787f@xs4all.nl>
In-Reply-To: <6095bd3d-2580-44e2-b622-3ad31e12787f@xs4all.nl>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYAPR01MB6201:EE_|OS3PR01MB10234:EE_
x-ms-office365-filtering-correlation-id: 7c47a131-a810-4590-3aa2-08dbeee1db6d
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 WF7Lcu+GIgKO/t7UJm5AaGCM7mhiUDkC08nF3xI/cL5Oc6oM7MrCRWbyyf0b+Dr33z2g5BDej7bkT0+NgqE5XK0xRMSSM2I29Efj7mIqVLx7fmnHi0zkGbezcAeuBFlvxqYJF6y6bSYnVe467PX3dE7IFtdxXt3uHEAi7WGCDr8k/2J/VjIZZB1UvznBwO0eobmTrzalzPOicJi9a0OcGiN3KQTxLkw+cFhy+PyLpVRVjJlcn5efjaH286lPvQNehelqCgE1YcOLdm123vM6QezUQSrGW69Ie7dOTgQD1qITgMqpvPLh0OJHNo7KGbTDM16/f5uw/zRM8V87VCQFGIDtbDKcgIWh7XW+XjnsqqrP2YA/3txmpxrXK/2/uF0BoOFS2NCfkPy/rN0kJaRhTDg2injJdxGRDa2J0fPOR54h/2QRF+zhMw5uEzAOUEww9nnAgzgoxxVXiIxeJJHvnchqADCVKk8kRSdMthckUG4O/2NU9Drmjntwvss/FV2Ov85wsEH5Tk8p8omy6prrY98U2X02McpasUcS5KBq9U/z+n/7THHqR+xu/U3hxXsPuVlUKvM7lOnEKTVG4Z9tk/2TLnvu1xim/du1+0zZ7wLpkru4SNX3KnRJA31Z9Njc6bCQ+g7jMcjGGsXA4jGWw3Pfd6XsWaskIWa02mwa6P+0ytEnYqAyN2mGs0MU/eGe
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYAPR01MB6201.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(230173577357003)(230922051799003)(230273577357003)(64100799003)(1800799012)(451199024)(186009)(5660300002)(7416002)(2906002)(52536014)(4326008)(8676002)(8936002)(41300700001)(54906003)(316002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(110136005)(55016003)(26005)(478600001)(71200400001)(7696005)(6636002)(9686003)(6506007)(53546011)(83380400001)(38100700002)(122000001)(86362001)(33656002)(38070700009)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N2k3YmhQajdXT2J3RHduQkZNZjlEMUY0TzVxdEE4MlVMcHRwNFB1dDNGY2ZO?=
 =?utf-8?B?Z0JoekJiUURIcmVud1dEMDZqZFhldzJWQ1NkSWszejZGVDBJNzJaNFRHYWJj?=
 =?utf-8?B?UERjU2IxVVlOb0dDTTRJNEs5VktFa3BYcTB5S2F4TmMrTk1PQ0FJampCaEJH?=
 =?utf-8?B?M29Ua0ZZdmFXUHEzbTdGYmdWZkhaTzBJOUE4Z0ZWTDhqRU9PTGE3MS8xVVFD?=
 =?utf-8?B?WWMxaWhPQ0I1TEFCQkM0MHllLzFhSEFMWlNibFVXdmtWNzhlRmd5V1BHWXRI?=
 =?utf-8?B?SVkxNHVVU01YM0FOaTVCUnhuTEZaUS9aSC9OYWFwSXFNUlVPRmIva0xKWFB2?=
 =?utf-8?B?NnA0OWdLbkVKUWoxc0NtYXlWOU5mNklmcTRuWWF2T1U5TGMzaWVSbHBMblRo?=
 =?utf-8?B?ZEgvR3dnMzVScHAvTXpKMCtmWEJGQTJFTDVqSENTUFJYbFJMVU5ZQnBMbGhM?=
 =?utf-8?B?YUtXWUFYbi8yMTc3Wm5SSE1kMlhqZWJFNC9CdUE5RHRSY29EWloyQ2NVUm9v?=
 =?utf-8?B?TmV0cTFRdS9GN1N5NUFGaktUOEYrNk52Q21GSk83Y093c3ZZajJQZzJoYm81?=
 =?utf-8?B?TU5mTE1Ba0cyNUozTXZVRDRVUWxaUGxZOGE2dmx3RUZwbElXNWJ0NDdRUE5Y?=
 =?utf-8?B?S3B2R3FNQTNCK2k2U2p4c1V6Z29pZEpIYVZOblFNSU96NWw0TU1UVlNEU1dz?=
 =?utf-8?B?cTV3WnowcHVEblRUbUxpWklXRm40dHplaE1Za1hoaEk5ejVyVUsrUFdGWGhO?=
 =?utf-8?B?VXJYcEpsNkNHc0tLMU5UOVBJc0lHODAwNTNiVWxMRE1kcnFheEhVNWlIcFA3?=
 =?utf-8?B?c3BBRGNMRHZ5cmNwRndOdGFldkg1TklHclo2K0tLdEtUaEFEYXhUSVRLY0pO?=
 =?utf-8?B?TFVxdDdDblhJRDhRa1E1TnlZQ0ZLU2tCbU13MncwSTREMGVRNWhqZE1pcHZj?=
 =?utf-8?B?RGtncEJUdUFFYjVrb3RTSlc4TEhLUWd0V3V4V0V5TmkyUFNuQjhMS3p5MWRw?=
 =?utf-8?B?UUlmU1BGZGl2SnF0eEFnUUg0ZnpZSTNKL3U0WjNzbmVDbjhZd1JuTFNzaHpv?=
 =?utf-8?B?Ymh0Um15S1FiMm04QURSd1hUV0sycmJQbkVTN1ZONkpEM3liaDdaS2gwcitK?=
 =?utf-8?B?KzFpV3ZDcHdMMTU2VnJzZFcydGpEbEcwOUsvNU1Tb1VyU0JoUWxXZzAraWh1?=
 =?utf-8?B?ZkVWL2FZbmQrSUpnY0VrWlQ1Q1ZsZ3Q0ZlVCMncrNWhtc3lUZDBuajN2a0x4?=
 =?utf-8?B?UCtuWjliV0s3L2cyQjMwa0VySlZoeFp4dGY2Z0J6ZDN2UEpYd2tJRGQwY2NR?=
 =?utf-8?B?VjNDcW1sSXZKbElvNnJLSXlpTmExeE1malBpQXFsYnRzRm5EUkZpZnlRVktH?=
 =?utf-8?B?SlV6TkVQTXFPQWZJd010Vm9hK3V6SThtUGlJNStQcmRiQVRzK0poeFUvZzVp?=
 =?utf-8?B?OFN5c3RYemo1MmM1aDlENkZ6ZnBGaFl2OUtSVSsyT3Q2cmxCcDRKUjBxcGxv?=
 =?utf-8?B?L0FBNTl6aGRjUHdoK1NjaUo0cmpSeDVteHY0ci9sbE1sSGZNZmgreFpJVnBm?=
 =?utf-8?B?U2pIc2s0UFhJN2FhU3Z4aUlZM0VEcWFVa0dPaWh4T253VW9kV0ZqZDF1MHFX?=
 =?utf-8?B?QnNsK0N2bXJtVG5ub1JNYVpvQTd2RSt4NG1ocmxDelNKQld5V0pzSzRiTVhS?=
 =?utf-8?B?L093a0pONSsxZWlmTU81U3p0WGJMRGdLekU4ZnpGYmxycDJYSmo3Z2lOckMz?=
 =?utf-8?B?MGh6VXhwSlpHbVY3aVFIUlVydko2bG9ZRnJPTzJtYTFQU3Q5WmFQUmQyd0pZ?=
 =?utf-8?B?cDAzU2hPMjZyNGlTOVBnNVpOdzRkWGg1Q3VBdnlYbVR5dVFJVGpVNDdvNUZX?=
 =?utf-8?B?aXR2S084Qkd6Q3V1VmVXeU00T3hHbk4yREhvVDdjRmxQd01KT0sycWR4ZHRZ?=
 =?utf-8?B?b0tOR1hGUmRreW14LzV1Wm5LYUhNOTM4VDlrUnZJaG51Mmo0M1R0eGJlZjQ3?=
 =?utf-8?B?YkxxMis5WHdtcVQxSEVSb3VEa3NuQ0RNZlhqSkJCajRVL043UlBrYmV4b3ZE?=
 =?utf-8?B?RCtZWTJ1c2RncUdBZGtqWVcxbFIvYnIzcm9CWXB5RXUwa2VKVE03RGJPQzk0?=
 =?utf-8?B?UmVVWWxtZGMxaDFYeWh4NlZkMlczVFVpUXFQMXlKbHh3ZE5PNVh6NFdZTGpO?=
 =?utf-8?B?cUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: toshiba.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR01MB6201.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c47a131-a810-4590-3aa2-08dbeee1db6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 00:43:21.9397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LbOOzvNTKQ8/cC+WGO0ldipeS672pQC93gAYdjaTj9CzWkls3O78jr/FtM04nn5NZHOicFHGKhGEX/oScqd+iNK5z0HrFEXFeX9JhsAck48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10234

SGVsbG8gSGFucywNCg0KVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3DQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFucyBWZXJrdWlsIDxodmVya3VpbEB4czRhbGwubmw+
DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDE0LCAyMDIzIDY6MDIgUE0NCj4gVG86IGlzaGlr
YXdhIHl1amko55+z5bedIOaCoOWPuCDil4vvvLLvvKTvvKPilqHvvKHvvKnvvLTvvKPil4vvvKXv
vKHplospDQo+IDx5dWppMi5pc2hpa2F3YUB0b3NoaWJhLmNvLmpwPjsgTGF1cmVudCBQaW5jaGFy
dA0KPiA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPjsgTWF1cm8gQ2FydmFsaG8g
Q2hlaGFiDQo+IDxtY2hlaGFiQGtlcm5lbC5vcmc+OyBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJu
ZWwub3JnPjsgS3J6eXN6dG9mDQo+IEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBs
aW5hcm8ub3JnPjsgQ29ub3IgRG9vbGV5DQo+IDxjb25vcitkdEBrZXJuZWwub3JnPjsgaXdhbWF0
c3Ugbm9idWhpcm8o5bKp5p2+IOS/oea0iyDil4vvvKTvvKnvvLTvvKPilqHvvKTvvKnvvLTil4sN
Cj4g77yv77yz77y0KSA8bm9idWhpcm8xLml3YW1hdHN1QHRvc2hpYmEuY28uanA+DQo+IENjOiBs
aW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0K
PiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OSAzLzVdIG1lZGlhOiBwbGF0Zm9y
bTogdmlzY29udGk6IGFkZCBWNEwyIHZlbmRvcg0KPiBzcGVjaWZpYyBjb250cm9sIGhhbmRsZXJz
DQo+IA0KPiBPbiAxMi8xMC8yMDIzIDA5OjEzLCBZdWppIElzaGlrYXdhIHdyb3RlOg0KPiA+IEFk
ZCBzdXBwb3J0IHRvIEltYWdlIFNpZ25hbCBQcm9jZXNzb3JzIG9mIFZpc2NvbnRpJ3MgVmlkZW8g
SW5wdXQgSW50ZXJmYWNlLg0KPiA+IFRoaXMgcGF0Y2ggYWRkcyB2ZW5kb3Igc3BlY2lmaWMgY29t
cG91bmQgY29udHJvbHMgdG8gY29uZmlndXJlIHRoZQ0KPiA+IGltYWdlIHNpZ25hbCBwcm9jZXNz
b3IuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZdWppIElzaGlrYXdhIDx5dWppMi5pc2hpa2F3
YUB0b3NoaWJhLmNvLmpwPg0KPiA+IC0tLQ0KPiA+IENoYW5nZWxvZyB2MjoNCj4gPiAtIFJlc2Vu
ZCB2MSBiZWNhdXNlIGEgcGF0Y2ggZXhjZWVkcyBzaXplIGxpbWl0Lg0KPiA+DQo+ID4gQ2hhbmdl
bG9nIHYzOg0KPiA+IC0gQWRhcHRlZCB0byBtZWRpYSBjb250cm9sIGZyYW1ld29yaw0KPiA+IC0g
SW50cm9kdWNlZCBJU1Agc3ViZGV2aWNlLCBjYXB0dXJlIGRldmljZQ0KPiA+IC0gUmVtb3ZlIHBy
aXZhdGUgSU9DVExzIGFuZCBhZGQgdmVuZG9yIHNwZWNpZmljIFY0TDIgY29udHJvbHMNCj4gPiAt
IENoYW5nZSBmdW5jdGlvbiBuYW1lIGF2b2lkaW5nIGNhbWVsY2FzZSBhbmQgdXBwZXJjYXNlIGxl
dHRlcnMNCj4gPg0KPiA+IENoYW5nZWxvZyB2NDoNCj4gPiAtIFNwbGl0IHBhdGNoZXMgYmVjYXVz
ZSB0aGUgdjMgcGF0Y2ggZXhjZWVkcyBzaXplIGxpbWl0DQo+ID4gLSBTdG9wIHVzaW5nIElEIG51
bWJlciB0byBpZGVudGlmeSBkcml2ZXIgaW5zdGFuY2U6DQo+ID4gICAtIFVzZSBkeW5hbWljYWxs
eSBhbGxvY2F0ZWQgc3RydWN0dXJlIHRvIGhvbGQgSFcgc3BlY2lmaWMgY29udGV4dCwNCj4gPiAg
ICAgaW5zdGVhZCBvZiBzdGF0aWMgb25lLg0KPiA+ICAgLSBDYWxsIEhXIGxheWVyIGZ1bmN0aW9u
cyB3aXRoIHRoZSBjb250ZXh0IHN0cnVjdHVyZSBpbnN0ZWFkIG9mIElEDQo+ID4gbnVtYmVyDQo+
ID4NCj4gPiBDaGFuZ2Vsb2cgdjU6DQo+ID4gLSBubyBjaGFuZ2UNCj4gPg0KPiA+IENoYW5nZWxv
ZyB2NjoNCj4gPiAtIHJlbW92ZSB1bnVzZWQgbWFjcm9zDQo+ID4gLSByZW1vdmVkIGh3ZF8gYW5k
IEhXRF8gcHJlZml4DQo+ID4gLSB1cGRhdGUgc291cmNlIGNvZGUgZG9jdW1lbnRhdGlvbg0KPiA+
IC0gU3VnZ2VzdGlvbiBmcm9tIEhhbnMgVmVya3VpbA0KPiA+ICAgLSBwb2ludGVyIHRvIHVzZXJs
YW5kIG1lbW9yeSBpcyByZW1vdmVkIGZyb20gdUFQSSBhcmd1bWVudHMNCj4gPiAgICAgLSBzdHls
ZSBvZiBzdHJ1Y3R1cmUgaXMgbm93ICJuZXN0ZWQiIGluc3RlYWQgb2YgImNoYWluZWQgYnkgcG9p
bnRlciI7DQo+ID4gICAtIHVzZSBkaXY2NF91NjQgZm9yIDY0Yml0IGRpdmlzaW9uDQo+ID4gICAt
IHZlbmRvciBzcGVjaWZpYyBjb250cm9scyBzdXBwb3J0IFRSWV9FWFRfQ1RSTFMNCj4gPiAgIC0g
YWRkIFJFQURfT05MWSBmbGFnIHRvIEdFVF9DQUxJQlJBVElPTl9TVEFUVVMgY29udHJvbCBhbmQg
c2ltaWxhcg0KPiBvbmVzDQo+ID4gICAtIGh1bWFuIGZyaWVuZHJ5IGNvbnRyb2wgbmFtZXMgZm9y
IHZlbmRvciBzcGVjaWZpYyBjb250cm9scw0KPiA+ICAgLSBhZGQgaW5pdGlhbCB2YWx1ZSB0byBl
YWNoIHZlbmRvciBzcGVjaWZpYyBjb250cm9sDQo+ID4gICAtIEdFVF9MQVNUX0NBUFRVUkVfU1RB
VFVTIGNvbnRyb2wgaXMgdXBkYXRlZCBhc3luY25vdXNseSBmcm9tDQo+IHdvcmtxdWV1ZQ0KPiA+
ICAgLSByZW1vdmUgRVhFQ1VURV9PTl9XUklURSBmbGFnIG9mIHZlbmRvciBzcGVjaWZpYyBjb250
cm9sDQo+ID4gICAtIHVBUEk6IHJldHVybiB2YWx1ZSBvZiBHRVRfQ0FMSUJSQVRJT05fU1RBVFVT
IGZvbGxvd3MgY29tbW9uIHJ1bGVzDQo+IG9mIGVycm9yIGNvZGVzDQo+ID4gICAtIGFwcGxpZWQg
djRsMi1jb21wbGlhbmNlDQo+ID4gLSBTdWdnZXN0aW9uIGZyb20gU2FrYXJpIEFpbHVzDQo+ID4g
ICAtIHVzZSBkaXY2NF91NjQgZm9yIDY0Yml0IGRpdmlzaW9uDQo+ID4gICAtIHVwZGF0ZSBjb3B5
cmlnaHQncyB5ZWFyDQo+ID4gICAtIHJlbW92ZSByZWRhbmR1bnQgY2FzdA0KPiA+ICAgLSB1c2Ug
Ym9vbCBpbnN0ZWFkIG9mIEhXRF9WSUlGX0VOQUJMRS9ESVNBQkxFDQo+ID4gICAtIHNpbXBsaWZ5
IGNvbXBhcmlzb24gdG8gMA0KPiA+ICAgLSBzaW1wbGlmeSBzdGF0ZW1lbnRzIHdpdGggdHJpZ3Jh
bSBvcGVyYXRvcg0KPiA+ICAgLSByZW1vdmUgcmVkdW5kYW50IGxvY2FsIHZhcmlhYmxlcw0KPiA+
ICAgLSB1c2UgZ2VuZXJhbCBpbnRlZ2VyIHR5cGVzIGluc3RlYWQgb2YgdTMyL3MzMg0KPiA+IC0g
U3VnZ2VzdGlvbiBmcm9tIExhdXJlbnQgUGluY2hhcnQNCj4gPiAgIC0gbW92ZWQgVklJRiBkcml2
ZXIgdG8gZHJpdmVyL3BsYXRmb3JtL3Rvc2hpYmEvdmlzY29udGkNCj4gPiAgIC0gY2hhbmdlIHJl
Z2lzdGVyIGFjY2Vzczogc3RydWN0LXN0eWxlIHRvIG1hY3JvLXN0eWxlDQo+ID4gICAtIHJlbW92
ZSB1bnVzZWQgdHlwZSBkZWZpbml0aW9ucw0KPiA+ICAgLSBkZWZpbmUgZW51bXMgaW5zdGVhZCBv
ZiBzdWNjZXNzaXZlIG1hY3JvIGNvbnN0YW50cw0KPiA+ICAgLSByZW1vdmUgcmVkdW5kYW50IHBh
cmVudGhlc2lzIG9mIG1hY3JvIGNvbnN0YW50DQo+ID4gICAtIGVtYmVkIHN0cnVjdCBod2RfcmVz
IGludG8gc3RydWN0IHZpaWZfZGV2aWNlDQo+ID4gICAtIHVzZSB4eHhfZG1hIGluc3RlYWQgb2Yg
eHh4X3BhZGRyIGZvciB2YXJpYWJsZSBuYW1lcyBvZiBJT1ZBDQo+ID4gICAtIGxpdGVyYWwgdmFs
dWU6IGp1c3QgMCBpbnN0ZWFkIG9mIDB4MA0KPiA+ICAgLSB1c2UgbGl0ZXJhbCAxIG9yIDAgaW5z
dGVhZCBvZiBIV0RfVklJRl9FTkFCTEUsIERJU0FCTEUgZm9yIHJlZ2lzdGVyDQo+IGFjY2Vzcw0K
PiA+ICAgLSB1c2UgdHJ1ZSBvciBmYWxzZSBpbnN0ZWFkIG9mIEhXRF9WSUlGX0VOQUJMRSwgRElT
QUJMRSBmb3IgZnVuY3Rpb24NCj4gY2FsbHMNCj4gPiAgIC0gdUFQSTogcmV0dXJuIHZhbHVlIG9m
IEdFVF9DQUxJQlJBVElPTl9TVEFUVVMgZm9sbG93cyBjb21tb24gcnVsZXMNCj4gPiBvZiBlcnJv
ciBjb2Rlcw0KPiA+DQo+ID4gQ2hhbmdlbG9nIHY3Og0KPiA+IC0gcmVtb3ZlIHVudXNlZCB2YXJp
YWJsZXMNCj4gPiAtIHNwbGl0IGxvbmcgc3RhdGVtZW50cyB3aGljaCBoYXZlIG11bHRpcGxlIGxv
Z2ljYWwtT1IgYW5kIHRyaWdyYW0NCj4gPiBvcGVyYXRvcnMNCj4gPg0KPiA+IENoYW5nZWxvZyB2
ODoNCj4gPiAtIGRlZmluZSBjb25zdGFudCBWNEwyX0NUUkxfVFlQRV9WSVNDT05USV9JU1AgZm9y
IGRhdGF0eXBlDQo+ID4gICBvZiBWaXNjb250aSBzcGVjaWZpYyBjb250cm9scw0KPiA+IC0gU3Vn
Z2VzdGlvbiBmcm9tIEhhbnMgVmVya3VpbA0KPiA+ICAgLSByZW1vdmUgcHJfaW5mbygpDQo+ID4g
ICAtIHVzZSBwbV9ydW50aW1lX2dldF9pZl9pbl91c2UoKSB0byBnZXQgcG93ZXIgc3RhdHVzDQo+
ID4NCj4gPiBDaGFuZ2Vsb2cgdjk6DQo+ID4gLSBmaXggd2FybmluZyBmb3IgY2FzdCBiZXR3ZWVu
IHB0ciBhbmQgZG1hX2FkZHJfdA0KPiA+DQo+ID4gIC4uLi9tZWRpYS9wbGF0Zm9ybS90b3NoaWJh
L3Zpc2NvbnRpL01ha2VmaWxlICB8ICAgIDIgKy0NCj4gPiAgLi4uL21lZGlhL3BsYXRmb3JtL3Rv
c2hpYmEvdmlzY29udGkvdmlpZi5jICAgIHwgICAxMCArLQ0KPiA+ICAuLi4vcGxhdGZvcm0vdG9z
aGliYS92aXNjb250aS92aWlmX2NvbnRyb2xzLmMgfCAzMzk1DQo+ICsrKysrKysrKysrKysrKysr
DQo+ID4gIC4uLi9wbGF0Zm9ybS90b3NoaWJhL3Zpc2NvbnRpL3ZpaWZfY29udHJvbHMuaCB8ICAg
MTggKw0KPiA+ICAuLi4vcGxhdGZvcm0vdG9zaGliYS92aXNjb250aS92aWlmX2lzcC5jICAgICAg
fCAgIDE1ICstDQo+ID4gIGRyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItY3RybHMtY29yZS5j
ICAgICB8ICAgIDcgKy0NCj4gPiAgaW5jbHVkZS91YXBpL2xpbnV4L3ZpZGVvZGV2Mi5oICAgICAg
ICAgICAgICAgIHwgICAgMiArDQo+ID4gIDcgZmlsZXMgY2hhbmdlZCwgMzQzMSBpbnNlcnRpb25z
KCspLCAxOCBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlDQo+ID4gMTAwNjQ0IGRyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vdG9zaGliYS92aXNjb250aS92aWlmX2NvbnRyb2xzLmMNCj4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0DQo+ID4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS90b3NoaWJhL3Zpc2NvbnRp
L3ZpaWZfY29udHJvbHMuaA0KPiA+DQo+IA0KPiA8c25pcD4NCj4gDQo+IFRoZXNlIGNvcmUgY2hh
bmdlcyBiZWxvdyBzaG91bGQgYmUgaW4gYSBzZXBhcmF0ZSBwYXRjaCwgbm90IG1peGVkIGluIHdp
dGggdGhlDQo+IGRyaXZlci4NCj4gDQoNCkknbGwgcHV0IGNoYW5nZXMgZm9yIHRoZSBjb3JlIGxp
YnJhcnkgaW50byBhIHNlcGFyYXRlIHBhdGNoLg0KDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWVkaWEvdjRsMi1jb3JlL3Y0bDItY3RybHMtY29yZS5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3Y0
bDItY29yZS92NGwyLWN0cmxzLWNvcmUuYw0KPiA+IGluZGV4IGE2NjJmYjYwZjczZi4uMGM0ZGY5
ZmZmYmUwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItY3Ry
bHMtY29yZS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1jdHJscy1j
b3JlLmMNCj4gPiBAQCAtMzY3LDcgKzM2Nyw5IEBAIHZvaWQgdjRsMl9jdHJsX3R5cGVfb3BfbG9n
KGNvbnN0IHN0cnVjdCB2NGwyX2N0cmwgKmN0cmwpDQo+ID4gIAljYXNlIFY0TDJfQ1RSTF9UWVBF
X0FWMV9GSUxNX0dSQUlOOg0KPiA+ICAJCXByX2NvbnQoIkFWMV9GSUxNX0dSQUlOIik7DQo+ID4g
IAkJYnJlYWs7DQo+ID4gLQ0KPiA+ICsJY2FzZSBWNEwyX0NUUkxfVFlQRV9WSVNDT05USV9JU1A6
DQo+ID4gKwkJcHJfY29udCgiVklTQ09OVElfSVNQIik7DQo+ID4gKwkJYnJlYWs7DQo+ID4gIAlk
ZWZhdWx0Og0KPiA+ICAJCXByX2NvbnQoInVua25vd24gdHlwZSAlZCIsIGN0cmwtPnR5cGUpOw0K
PiA+ICAJCWJyZWFrOw0KPiA+IEBAIC0xMTYzLDYgKzExNjUsOSBAQCBzdGF0aWMgaW50IHN0ZF92
YWxpZGF0ZV9jb21wb3VuZChjb25zdCBzdHJ1Y3QNCj4gdjRsMl9jdHJsICpjdHJsLCB1MzIgaWR4
LA0KPiA+ICAJY2FzZSBWNEwyX0NUUkxfVFlQRV9BVjFfRklMTV9HUkFJTjoNCj4gPiAgCQlyZXR1
cm4gdmFsaWRhdGVfYXYxX2ZpbG1fZ3JhaW4ocCk7DQo+ID4NCj4gPiArCWNhc2UgVjRMMl9DVFJM
X1RZUEVfVklTQ09OVElfSVNQOg0KPiA+ICsJCWJyZWFrOw0KPiA+ICsNCj4gPiAgCWNhc2UgVjRM
Ml9DVFJMX1RZUEVfQVJFQToNCj4gPiAgCQlhcmVhID0gcDsNCj4gPiAgCQlpZiAoIWFyZWEtPndp
ZHRoIHx8ICFhcmVhLT5oZWlnaHQpDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51
eC92aWRlb2RldjIuaA0KPiA+IGIvaW5jbHVkZS91YXBpL2xpbnV4L3ZpZGVvZGV2Mi5oIGluZGV4
IGMzZDRlNDkwY2U3Yy4uYmJjM2NkM2VmYTY1DQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVk
ZS91YXBpL2xpbnV4L3ZpZGVvZGV2Mi5oDQo+ID4gKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3Zp
ZGVvZGV2Mi5oDQo+ID4gQEAgLTE5MTUsNiArMTkxNSw4IEBAIGVudW0gdjRsMl9jdHJsX3R5cGUg
ew0KPiA+ICAJVjRMMl9DVFJMX1RZUEVfQVYxX1RJTEVfR1JPVVBfRU5UUlkgPSAweDI4MSwNCj4g
PiAgCVY0TDJfQ1RSTF9UWVBFX0FWMV9GUkFNRQkgICAgPSAweDI4MiwNCj4gPiAgCVY0TDJfQ1RS
TF9UWVBFX0FWMV9GSUxNX0dSQUlOCSAgICA9IDB4MjgzLA0KPiA+ICsNCj4gPiArCVY0TDJfQ1RS
TF9UWVBFX1ZJU0NPTlRJX0lTUCA9IDB4MjkwLA0KPiANCj4gSSBzZWUgeW91IGFyZSB1c2luZyB0
aGUgc2FtZSBWNEwyX0NUUkxfVFlQRV9WSVNDT05USV9JU1AgZm9yIGFsbCB0aGUNCj4gY29tcG91
bmQgY29udHJvbHMuIEJ1dCB0aGF0J3Mgbm90IGFsbG93ZWQ6IHRoZSBWNEwyX0NUUkxfVFlQRV8g
ZGVmaW5lcw0KPiBkZXRlcm1pbmUgdGhlIGNvbnRyb2wgdHlwZSwgc28gZWFjaCBzdHJ1Y3QgdXNl
ZCBieSBhIGNvbnRyb2wgbmVlZHMgaXRzIG93biB0eXBlLg0KDQpJIHVuZGVyc3RhbmQuDQoNCj4g
SSBhbHNvIG5vdGljZWQgbG9va2luZyB0aHJvdWdoIGluY2x1ZGUvdWFwaS9saW51eC92aXNjb250
aV92aWlmLmggdGhhdCBzb21lIG9mDQo+IHRoZSBzdHJ1Y3QgaGF2ZSBob2xlcy4gSSByZWFsbHkg
d2FudCB0byBhdm9pZCBob2xlcyBpbiBzdHJ1Y3RzIHVzZWQgYnkgY29udHJvbHMsIGl0DQo+IGlz
IGJhZCBwcmFjdGljZS4NCj4gDQo+IFRoZSBwYWhvbGUgdXRpbGl0eSBpcyB2ZXJ5IHVzZWZ1bCBm
b3IgdGVzdGluZyB0aGlzLiBJdCBpcyBhbHNvIGhpZ2hseSByZWNvbW1lbmRlZCB0bw0KPiBjaGVj
ayBmb3IgYm90aCAzMiBhbmQgNjQgYml0IGNvbXBpbGF0aW9uOiB0aGUgc3RydWN0IGxheW91dCBt
dXN0IGJlIHRoZSBzYW1lLA0KPiBvdGhlcndpc2UgeW91IHdvdWxkIHJ1biBpbnRvIHByb2JsZW1z
IGlmIGEgMzIgYml0IGFwcGxpY2F0aW9uIGlzIHVzZWQgd2l0aCBhIDY0DQo+IGJpdCBrZXJuZWwu
DQoNCkknbGwgYXBwbHkgcGFob2xlIHRvb2wuDQoNCj4gRmluYWxseSwgTGF1cmVudCBhbmQvb3Ig
U2FrYXJpIHdpbGwgYWxzbyB0YWtlIGEgbG9vayBhdCB0aGlzIGRyaXZlciwgZm9yIHNvbWUNCj4g
cmVhc29uIHRoaXMgZHJpdmVyIGhhcyBiZWVuIG1vc3RseSByZXZpZXdlZCBieSBtZSwgYnV0IEkg
YW0gbm90IHJlYWxseSB0aGUNCj4gZXhwZXJ0IG9uIElTUHMuDQo+IA0KPiBSZWdhcmRzLA0KPiAN
Cj4gCUhhbnMNCj4gDQo+ID4gIH07DQo+ID4NCj4gPiAgLyogIFVzZWQgaW4gdGhlIFZJRElPQ19R
VUVSWUNUUkwgaW9jdGwgZm9yIHF1ZXJ5aW5nIGNvbnRyb2xzICovDQoNClJlZ2FyZHMsDQpZdWpp
DQo=


