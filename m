Return-Path: <linux-media+bounces-5238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D90F985761C
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 07:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20C6A1F25248
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 06:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0491429F;
	Fri, 16 Feb 2024 06:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="PwnL7KmF"
X-Original-To: linux-media@vger.kernel.org
Received: from KOR01-PS2-obe.outbound.protection.outlook.com (mail-ps2kor01on2134.outbound.protection.outlook.com [40.107.128.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F92DEEAC;
	Fri, 16 Feb 2024 06:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.128.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708066129; cv=fail; b=iN/SWUqzacFpu4quCCG83UDT7x7jgyH4S69DHycg1XLk4kkpLngNRvCs2cbkUSyadlwJ2pIyjL48Q/CsPCazHOfkdSEdfpM9gVx2iYPdfINRLfstVGIi7QLjdJ7HMiZi/lwBpr2yNI8DJ9QUJytX8OSwBjxMRFHJDuIsVFflTuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708066129; c=relaxed/simple;
	bh=T3FKBq3hX3F1wIF6XkvTJByQkcpXSWEXxth5xxXGblU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j/XenD/wP9oU3LBxf2d341fmtPr8IN5XVn5pQhSLkCYry3mqCA7oITyEklzSnRWYbTGozmqsMXtYwH8ioKb6T67R2pOy/m8kFdnJWELG/9+StnRpTjx2nPqkRGgNAHqM5xwalcR9AN1nFpsP/DwWY8TCcTox+W/JHUoEP5MCyKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=PwnL7KmF; arc=fail smtp.client-ip=40.107.128.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YvEQZ4RG+SWVClQbVyd30PjmWAGbPjXmvT1//WwgjZ/kdDkrlyW5OAf/93sjgxruMrCRk0OLTjddOzdUxloYLxZH6gB5K+y8EEMe+pM6m1dhGPFP8sa/O2siSH2QCRKlFp8iG0o05NNoYdbUNaYGyClCxpVgjpM/MBFtYKx14VR5hfjcnQcjCWYP8xGXhXHvLK+CmVSdLXsJAxEzVZtXfUD0CopfY9K+5SshOr5nBNS43FY/ZH7IZ6L3CGlDL+pHZk/rR6OoH1T3OuUlZHbecCtUelGvPP0d/DIrF40osjl1AImmY+yQ9NCZJWE3pjITr/anc1FXkBwNIbKiBG5gUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3FKBq3hX3F1wIF6XkvTJByQkcpXSWEXxth5xxXGblU=;
 b=VmfDC88QPTYPnjLzjrUqfQjiB5HVakksuGc2lps0a0pMPcDXRmcuUBExI13GzjIRIqVnzRtrv9AJeF7tlPu97EhsieMZ7mQTeoop7gM2bITjZ4dZnEFWYye5vGjcFcJvgKK2WxhMIpbMS2Y0NZ74WlH1/lzYrf+r49DaVv+H2hFQptM4votnqRnE5hGFXjtHMSmfuL94fPpBtreNt3nVic2uRstucsi4DiYrDoeBWHoEY1qt/xgLDmnZOyTI2cGQQEb4QMlV4ftpZ4YyqDWtjzZLE18x2VdDK8lO/tlmW3ioY1vZQE09SQ+k4LH3539qCfn2nJY2rLMt0gIN+W7PjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3FKBq3hX3F1wIF6XkvTJByQkcpXSWEXxth5xxXGblU=;
 b=PwnL7KmF7+NE+Z60kYoCMrG/Q6n7RLd8W1zE8Imw/i04e/psPKFT5m7TPkSkxAUl9CtojTcObs5uwzeEKuVujTbTfxtsXccWnp3be5YHlD+neOMe1JShvOWbQulIQrh3PrmjVibtA8G0xouWOMvT144nWgSOAUzC//hrbjgkswY=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE1P216MB1861.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f4::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.31; Fri, 16 Feb 2024 06:48:43 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::de27:9f30:e1f9:1b5c]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::de27:9f30:e1f9:1b5c%4]) with mapi id 15.20.7270.036; Fri, 16 Feb 2024
 06:48:43 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>
CC: lafley.kim <lafley.kim@chipsnmedia.com>, "b-brnich@ti.com"
	<b-brnich@ti.com>
Subject: RE: [RESEND PATCH v0 1/5] wave5 : Support yuv422 input format for
 encoder.
Thread-Topic: [RESEND PATCH v0 1/5] wave5 : Support yuv422 input format for
 encoder.
Thread-Index: AQHaU+Ui5aW0d7pxRESeJQ4k9LrmFbD/NeGAgA1qdEA=
Date: Fri, 16 Feb 2024 06:48:43 +0000
Message-ID:
 <SE1P216MB130332C3BB8A4BA43A74B397ED4C2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20240131013046.15687-1-jackson.lee@chipsnmedia.com>
	 <20240131013046.15687-2-jackson.lee@chipsnmedia.com>
 <baa85477b241880e1cf96efd7037fc1b2423fab5.camel@ndufresne.ca>
In-Reply-To: <baa85477b241880e1cf96efd7037fc1b2423fab5.camel@ndufresne.ca>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SE1P216MB1861:EE_
x-ms-office365-filtering-correlation-id: e488524d-c06f-463c-2bfd-08dc2ebb512f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 AaiGiacI10C74FkQQqmj5zdPYNXBzlELblnOlwIdMw2vaT1RzotVwrYNntZMxAIiJOe8rleT6EqT4Xb7OAF72tROdt3n68N5KAqgzRy7ZC0n5gEOo4TmmjqM4X+HPOZl7OauhjDn+cU+rzh37akNWZYjoEDayiMfNoK32Ysk8WN44iPEz7zlyl7qx+KPvGWEWyadtyijomCRVxG6K6lv9AYjA4OVQAPPyz+3+wEpNfxErCAZMwW4/nDINoO3ONcMLhovtq3MOUp/YA3KN42LSvGCoW3isWKZrrFgQ3gZUS/JjrnI21LFRl2+etG6FGBZj1KXRLZuxkX/Aa23DDgy1So888Lbsuo7s6HTiw9ZUXuh7PHUCxBSewp+de2RECMHhT0UeG+QAxrL5t3j+9Ib8y4McSD6pQF46H9477VLTxapy852DD8eRSp9X/qIYX2Z/rgyePa4M8tc5p69lU1o4UKSL9RtC/l2D20n5pv7Os9grcwdQCG0InMlN8Y711LvC5sJtAdlLkhAcrIsBMp/4UGUhTLC6PH5upp0kvWFMzCgannd4XrmbeLFRdig5/8xp/PqZZOPiIb6dTzCtx302Z9LoU31ofpQAb9XpYuP+50AHYvAm4LVQ/2Uq/j/Hx1V
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(39850400004)(366004)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2906002)(4326008)(8936002)(8676002)(5660300002)(66476007)(76116006)(52536014)(64756008)(66946007)(66556008)(66446008)(54906003)(41300700001)(26005)(66574015)(38070700009)(83380400001)(6506007)(110136005)(316002)(7696005)(478600001)(71200400001)(9686003)(53546011)(6636002)(86362001)(38100700002)(55016003)(122000001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d3FiODJnOENjTXk2ZE9TcG1iaDMzNDFvL2RLZE5hb3RiYUFhbnRJdStpME0x?=
 =?utf-8?B?dk1YS3BBMW5JM2g4K21XaXo3TStwRWxraEhvWjBxczhrN2tMaE1YYlZ2OGZk?=
 =?utf-8?B?TmZCTXVmaEVBelpTWFZJWDVIdjgraVZvS2E1TEhDNkozYlh5aVdyY0RyZVJs?=
 =?utf-8?B?Tk52ZlIxQVpRMmhnZWVXWloxS01uS2QyMWIzeDBPV3R1YXVHeHAxdGJnZ0Qv?=
 =?utf-8?B?cFk1bTZsdlRnckkyWmc3RnZLNmJHWi8xRzhCODJyeUFOekpXMTJOM3JlSnE2?=
 =?utf-8?B?bm1NdmRIbzRGQWs2elBqV29FNFlpdjQ0RmRmTjBWN3hPQXMxZ3Fndm9rQXpy?=
 =?utf-8?B?L3BWdGxkT1JCR1QzeTNZSisvRFhybGptK2RrQ2JwRjEzbFFqUkJ2T0lmWFRT?=
 =?utf-8?B?cFppSnBkVDg5VjQ1akIxdm93a251eHMyMmlZREx0QWpjS0MrK1NrS09pWDZT?=
 =?utf-8?B?VmpwR1ppNEtEU2k5Nm95R1RCQ1F4RDJXWWdLMVlHam84dmZ2bk1ZUll4bG0r?=
 =?utf-8?B?Q0RGMURJK0NKSmd3ZFdPSnhnUy9obmpWcm0xOVAvVWNQN3ZnVlY1WjVjNC9o?=
 =?utf-8?B?K2w0akdGTHlESzBZSjBubXdTY3JhOWlPUXpvTExrb3RFdWZwU0k2VWxGb3kr?=
 =?utf-8?B?a3Jqdm5Gd3dkNVR2QncrZEEvdDNuT1g1cUdKdWJna2hJTUFhSllqUkZJQUoy?=
 =?utf-8?B?b3VKVitWR0YvVHdxRCtxRVNjaUR5ai9WbndzQUZpWDhPeXVoaWV4eG5YUU5S?=
 =?utf-8?B?WDFPQUEyUVVzcDBjdmVYd1pTODA4dlAremNjTDZlcWExWjR4ZS85TE1ZbjNJ?=
 =?utf-8?B?Z3U2MVlWcFh6YUFJd0dXVDBYRm1YNFFkblNGbU5yRHVVOHR0SzliSVZRaWIy?=
 =?utf-8?B?T05BTC9mbjZSeld4RmVmUGtFWFd5V0tyRVdRZ2tDSmVYbkpmVUpLWXJCaDNU?=
 =?utf-8?B?WkV4OHdGREV4bmVObmNBZzJYbExRMUhTNzFSK25vK0ZabksvcWxpNzFqRHRT?=
 =?utf-8?B?a0k0WHF0MmFZSjFKc0R1d0lLOEF0VTRjWGxxRmZOK0xiYjdacUtKWHZVaFha?=
 =?utf-8?B?bGdYYzZnUy9KUXl2cHNremh1ZE55UWF4clZBNWV1blZ2UVZSVWhPSkhZZXZM?=
 =?utf-8?B?TkZLZGU0NVF4VXZEbmxTS29CZkY3TzBmd25pMm1LNzhaNGV4N2VuM2FLOVNP?=
 =?utf-8?B?ZlNGbDI1YUJtY1BlcWVWZkZidXFTOFZTa3k2SmNDN3ltVEYyTUNvTUlCc2hQ?=
 =?utf-8?B?LzNzOWRteWRzdEJsTGpWaUhtbDdRRllYSHRzYThSSEU2QmF3T2o1ZU9lT3V1?=
 =?utf-8?B?bStJQ3FvdzFXSUZ1VHFPWUZFeXQxd3FmLytoN1FJcnl1Sm5qU242djhiUGQ2?=
 =?utf-8?B?MkRoV1JnVDkyeUplVThHZGlhcUtEc1RyK1VtdzBhSUp0NnFMa3RzR0FzaFFL?=
 =?utf-8?B?NWdVOTBtdU1QZEZWNytSdytYQ0J3R1o4RHlycnIyLzJvMlROU1N6VTFOdUtn?=
 =?utf-8?B?blhLSHFobkUrU20wWERsZkkwdG5KK1NNUGNUaVZZWmtGMkI0SzdSbjZ6TWw3?=
 =?utf-8?B?OE9ESDkzSk5pTE9PNWV3eWJWOFIwT2FZb042SThoazlUTU5IazVGNTVEay9E?=
 =?utf-8?B?UjVnRVk5cWxrTDdKSFR0MXlMWUZGWTFLUnB1R3VnWEhRTTBYT0U5UEpPRzFB?=
 =?utf-8?B?WVl6SU1jYmM1VkF3TUI0YjVDZGRjQlM5citPR3N2aVQ4MHg0RWcyY1JpZktH?=
 =?utf-8?B?WjBZVHAzQXR6ay9VSWRxOE82eUVkT01VM1lMZUFiNFM3NWRSbkJMNEpQTDN2?=
 =?utf-8?B?Wll5b2RzYWY2c21YWXlEemtpQklQR2dsbElvSkhGY0syYjFYOFd3dHVxMEda?=
 =?utf-8?B?OHlKN2JJUE9Vb3BkaFJVUFRRbEN0UWI2MkV3QXl6cnRrMDVRZ0JSOFNjcXpL?=
 =?utf-8?B?NE5tSjhzSlU0b29qQno5OUJta3MyM05iVHRydVllTUR5SXNzMmxFYmJvY25l?=
 =?utf-8?B?eTMyN0diZUVCUUI1Sndpc0NWekxKbXFtRnhFWk5WZno4OHlIOEhldGk2TExU?=
 =?utf-8?B?eTdBTVpwSko2VGtpUVlsOWI1Zm1GWE9aZWlNSGZsdXliVWF1dGZ6TDZINHoy?=
 =?utf-8?B?UWJVTXV4L1lROVRCcDhWNDZlRDVuelhTWjR6SHdMUEtscklJUGZEVTBHSHpa?=
 =?utf-8?B?R3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e488524d-c06f-463c-2bfd-08dc2ebb512f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2024 06:48:43.5484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iyq42u0Xqj59+LTOQ6TR7ks0sklgLS2BrZt6plyGo4MstkNFQTyHx+Tb2gUrqwIBh/9RZAfITvWSHkBOocLW2J0LtlC3Fj8U3f5NU5eYNEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1861

SGVsbG8gTmljb2xhcw0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3LCB3ZSB3aWxsIHJldmlldyB0
aGVtLg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmljb2xhcyBE
dWZyZXNuZSA8bmljb2xhc0BuZHVmcmVzbmUuY2E+DQo+IFNlbnQ6IFRodXJzZGF5LCBGZWJydWFy
eSA4LCAyMDI0IDI6NTUgQU0NCj4gVG86IGphY2tzb24ubGVlIDxqYWNrc29uLmxlZUBjaGlwc25t
ZWRpYS5jb20+OyBtY2hlaGFiQGtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBtZWRpYUB2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IE5hcyBDaHVuZw0KPiA8bmFzLmNo
dW5nQGNoaXBzbm1lZGlhLmNvbT4NCj4gQ2M6IGxhZmxleS5raW0gPGxhZmxleS5raW1AY2hpcHNu
bWVkaWEuY29tPjsgYi1icm5pY2hAdGkuY29tDQo+IFN1YmplY3Q6IFJlOiBbUkVTRU5EIFBBVENI
IHYwIDEvNV0gd2F2ZTUgOiBTdXBwb3J0IHl1djQyMiBpbnB1dCBmb3JtYXQgZm9yDQo+IGVuY29k
ZXIuDQo+IA0KPiBIaSBKYWNrc29uLA0KPiANCj4gTGUgbWVyY3JlZGkgMzEgamFudmllciAyMDI0
IMOgIDEwOjMwICswOTAwLCBqYWNrc29uLmxlZSBhIMOpY3JpdMKgOg0KPiA+IEVuY29kZXIgc3Vw
cG9ydHMgdGhlIGZvbGxvd2luZyBmb3JtYXRzLg0KPiA+IFlVVjQyMlAsIE5WMTYsIE5WNjEsIE5W
MTZNLCBOVjYxTQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmFja3NvbiBMZWUgPGphY2tzb24u
bGVlQGNoaXBzbm1lZGlhLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBOYXMgQ2h1bmcgPG5hcy5j
aHVuZ0BjaGlwc25tZWRpYS5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9jaGlwcy1tZWRpYS93YXZl
NS93YXZlNS12cHUtZW5jLmMgICAgICAgICB8IDc5ICsrKysrKysrKysrKysrKysrKy0NCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDc2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93
YXZlNS12cHUtZW5jLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEv
d2F2ZTUvd2F2ZTUtdnB1LWVuYy5jDQo+ID4gaW5kZXggZjI5Y2ZhM2FmOTRhLi4wY2I1YmZiNjcy
NTggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93
YXZlNS93YXZlNS12cHUtZW5jLmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2No
aXBzLW1lZGlhL3dhdmU1L3dhdmU1LXZwdS1lbmMuYw0KPiA+IEBAIC03MCw2ICs3MCw0MSBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHZwdV9mb3JtYXQNCj4gZW5jX2ZtdF9saXN0W0ZNVF9UWVBFU11b
TUFYX0ZNVFNdID0gew0KPiA+ICAJCQkubWF4X2hlaWdodCA9IFc1X01BWF9FTkNfUElDX0hFSUdI
VCwNCj4gPiAgCQkJLm1pbl9oZWlnaHQgPSBXNV9NSU5fRU5DX1BJQ19IRUlHSFQsDQo+ID4gIAkJ
fSwNCj4gPiArCQl7DQo+ID4gKwkJCS52NGwyX3BpeF9mbXQgPSBWNEwyX1BJWF9GTVRfWVVWNDIy
UCwNCj4gPiArCQkJLm1heF93aWR0aCA9IFc1X01BWF9FTkNfUElDX1dJRFRILA0KPiA+ICsJCQku
bWluX3dpZHRoID0gVzVfTUlOX0VOQ19QSUNfV0lEVEgsDQo+ID4gKwkJCS5tYXhfaGVpZ2h0ID0g
VzVfTUFYX0VOQ19QSUNfSEVJR0hULA0KPiA+ICsJCQkubWluX2hlaWdodCA9IFc1X01JTl9FTkNf
UElDX0hFSUdIVCwNCj4gPiArCQl9LA0KPiANCj4gRHVyaW5nIHVwc3RyZWFtaW5nLCB3ZSBkaXNj
dXNzZWQgdGhlIGxhY2sgb2YgdXNhZ2Ugb2YgdjRsMi1jb21tb24gaW4gdGhpcw0KPiBkcml2ZXIg
YW5kIGFncmVlZCB0aGF0IGZ1dHVyZSB1cGRhdGVzIHN1Y2ggYXMgdGhpcyBvbmUgc2hvdWxkIGZp
cnN0IHBvcnQNCj4gdGhlIGRyaXZlciB0byB1c2UgdGhlIGNvbW1vbiBoZWxwZXJzIGluc3RlYWQu
DQo+IA0KPiBUaGlzIGltcGxpZXMgZHJvcHBpbmcgdGhpcyBjdXN0b20gbWFkZSBzdHJ1Y3R1cmUg
aW4gZmF2b3VyIG9mDQo+IHY0bDJfZnJtc2l6ZV9zdGVwd2lzZSBzdHJ1Y3R1cmUuIFVubGlrZSB5
b3VycywgeW91IGNhbiBlbmNvZGVkIHRoZSBuZWVkZWQNCj4gcGFkZGluZywgYWxsb3dpbmcgdG8g
ZW5jb2RlIHRoaXMgaW4gb25lIHBsYWNlIGluc3RlYWQgb2Ygc3ByZWFkaW5nIGl0DQo+IGFjcm9z
cyBudW1lcm91cyBmb3JtdWxhcyBpbiB0aGUgY29kZS4NCj4gDQo+IFdpdGggdGhpcyBpbmZvcm1h
dGlvbiwgeW91IHdpbGwgYmUgYWJsZSB0byB1c2U6DQo+IA0KPiAgIHY0bDJfYXBwbHlfZnJtc2l6
ZV9jb25zdHJhaW50cygpDQo+ICAgdjRsMl9maWxsX3BpeGZtdF9tcCgpDQo+IA0KPiBUbyBhZGp1
c3QgeW91ciBkaW1lbnNpb25zIHRvIHBhZGRlZCBkaW1lbnNpb25zIGFuZCBjb21wdXRlIHlvdXIN
Cj4gYnl0ZXNwZXJsaW5lDQo+IChzdHJpZGUpIGFuZCBzaXplaW1hZ2UuIFlvdSBjYW4gb2YgY291
cnNlIGluY3JlYXNlIHRoZSBzaXplIGltYWdlIGFmdGVyDQo+IHRoaXMgY2FsbC4gWW91IGNhbiBo
YXZlIGEgbG9vayBhdCBya3ZkZWMgZHJpdmVyIGFzIGFuIGV4YW1wbGUuDQo+IA0KPiBQbGVhc2Ug
cG9ydCBleGlzdGluZyBzZXQgb2YgcGl4ZWwgZm9ybWF0cyBzdXBwb3J0LCBhbmQgdGhlbiBhZGQg
dGhlIG5ldw0KPiBwaXhlbCBmb3JtYXRzLiBUaGlzIHNob3VsZCByZW1vdmUgYWJvdXQgMy80IG9m
IHRoaXMgcGF0Y2ggYW5kIHJlbW92ZSB0aGF0DQo+IGh1Z2UgcmlzayBvZiBtaXNzLWNvbXB1dGlu
ZyBhIHNpemUuDQo+IA0KPiA+ICsJCXsNCj4gPiArCQkJLnY0bDJfcGl4X2ZtdCA9IFY0TDJfUElY
X0ZNVF9OVjE2LA0KPiA+ICsJCQkubWF4X3dpZHRoID0gVzVfTUFYX0VOQ19QSUNfV0lEVEgsDQo+
ID4gKwkJCS5taW5fd2lkdGggPSBXNV9NSU5fRU5DX1BJQ19XSURUSCwNCj4gPiArCQkJLm1heF9o
ZWlnaHQgPSBXNV9NQVhfRU5DX1BJQ19IRUlHSFQsDQo+ID4gKwkJCS5taW5faGVpZ2h0ID0gVzVf
TUlOX0VOQ19QSUNfSEVJR0hULA0KPiA+ICsJCX0sDQo+ID4gKwkJew0KPiA+ICsJCQkudjRsMl9w
aXhfZm10ID0gVjRMMl9QSVhfRk1UX05WNjEsDQo+ID4gKwkJCS5tYXhfd2lkdGggPSBXNV9NQVhf
RU5DX1BJQ19XSURUSCwNCj4gPiArCQkJLm1pbl93aWR0aCA9IFc1X01JTl9FTkNfUElDX1dJRFRI
LA0KPiA+ICsJCQkubWF4X2hlaWdodCA9IFc1X01BWF9FTkNfUElDX0hFSUdIVCwNCj4gPiArCQkJ
Lm1pbl9oZWlnaHQgPSBXNV9NSU5fRU5DX1BJQ19IRUlHSFQsDQo+ID4gKwkJfSwNCj4gPiArCQl7
DQo+ID4gKwkJCS52NGwyX3BpeF9mbXQgPSBWNEwyX1BJWF9GTVRfTlYxNk0sDQo+ID4gKwkJCS5t
YXhfd2lkdGggPSBXNV9NQVhfRU5DX1BJQ19XSURUSCwNCj4gPiArCQkJLm1pbl93aWR0aCA9IFc1
X01JTl9FTkNfUElDX1dJRFRILA0KPiA+ICsJCQkubWF4X2hlaWdodCA9IFc1X01BWF9FTkNfUElD
X0hFSUdIVCwNCj4gPiArCQkJLm1pbl9oZWlnaHQgPSBXNV9NSU5fRU5DX1BJQ19IRUlHSFQsDQo+
ID4gKwkJfSwNCj4gPiArCQl7DQo+ID4gKwkJCS52NGwyX3BpeF9mbXQgPSBWNEwyX1BJWF9GTVRf
TlY2MU0sDQo+ID4gKwkJCS5tYXhfd2lkdGggPSBXNV9NQVhfRU5DX1BJQ19XSURUSCwNCj4gPiAr
CQkJLm1pbl93aWR0aCA9IFc1X01JTl9FTkNfUElDX1dJRFRILA0KPiA+ICsJCQkubWF4X2hlaWdo
dCA9IFc1X01BWF9FTkNfUElDX0hFSUdIVCwNCj4gPiArCQkJLm1pbl9oZWlnaHQgPSBXNV9NSU5f
RU5DX1BJQ19IRUlHSFQsDQo+ID4gKwkJfSwNCj4gPiAgCX0NCj4gPiAgfTsNCj4gPg0KPiA+IEBA
IC0xMzYsNiArMTcxLDIzIEBAIHN0YXRpYyB2b2lkIHdhdmU1X3VwZGF0ZV9waXhfZm10KHN0cnVj
dA0KPiB2NGwyX3BpeF9mb3JtYXRfbXBsYW5lICpwaXhfbXAsIHVuc2lnbmVkDQo+ID4gIAkJcGl4
X21wLT5wbGFuZV9mbXRbMV0uYnl0ZXNwZXJsaW5lID0gcm91bmRfdXAod2lkdGgsIDMyKTsNCj4g
PiAgCQlwaXhfbXAtPnBsYW5lX2ZtdFsxXS5zaXplaW1hZ2UgPSByb3VuZF91cCh3aWR0aCwgMzIp
ICoNCj4gaGVpZ2h0IC8gMjsNCj4gPiAgCQlicmVhazsNCj4gPiArCWNhc2UgVjRMMl9QSVhfRk1U
X1lVVjQyMlA6DQo+ID4gKwljYXNlIFY0TDJfUElYX0ZNVF9OVjE2Og0KPiA+ICsJY2FzZSBWNEwy
X1BJWF9GTVRfTlY2MToNCj4gPiArCQlwaXhfbXAtPndpZHRoID0gd2lkdGg7DQo+ID4gKwkJcGl4
X21wLT5oZWlnaHQgPSBoZWlnaHQ7DQo+ID4gKwkJcGl4X21wLT5wbGFuZV9mbXRbMF0uYnl0ZXNw
ZXJsaW5lID0gcm91bmRfdXAod2lkdGgsIDMyKTsNCj4gPiArCQlwaXhfbXAtPnBsYW5lX2ZtdFsw
XS5zaXplaW1hZ2UgPSByb3VuZF91cCh3aWR0aCwgMzIpICoNCj4gaGVpZ2h0ICogMjsNCj4gPiAr
CQlicmVhazsNCj4gPiArCWNhc2UgVjRMMl9QSVhfRk1UX05WMTZNOg0KPiA+ICsJY2FzZSBWNEwy
X1BJWF9GTVRfTlY2MU06DQo+ID4gKwkJcGl4X21wLT53aWR0aCA9IHdpZHRoOw0KPiA+ICsJCXBp
eF9tcC0+aGVpZ2h0ID0gaGVpZ2h0Ow0KPiA+ICsJCXBpeF9tcC0+cGxhbmVfZm10WzBdLmJ5dGVz
cGVybGluZSA9IHJvdW5kX3VwKHdpZHRoLCAzMik7DQo+ID4gKwkJcGl4X21wLT5wbGFuZV9mbXRb
MF0uc2l6ZWltYWdlID0gcm91bmRfdXAod2lkdGgsIDMyKSAqDQo+IGhlaWdodDsNCj4gPiArCQlw
aXhfbXAtPnBsYW5lX2ZtdFsxXS5ieXRlc3BlcmxpbmUgPSByb3VuZF91cCh3aWR0aCwgMzIpOw0K
PiA+ICsJCXBpeF9tcC0+cGxhbmVfZm10WzFdLnNpemVpbWFnZSA9IHJvdW5kX3VwKHdpZHRoLCAz
MikgKg0KPiBoZWlnaHQ7DQo+ID4gKwkJYnJlYWs7DQo+ID4gIAlkZWZhdWx0Og0KPiA+ICAJCXBp
eF9tcC0+d2lkdGggPSB3aWR0aDsNCj4gPiAgCQlwaXhfbXAtPmhlaWdodCA9IGhlaWdodDsNCj4g
PiBAQCAtMTU1LDExICsyMDcsMTkgQEAgc3RhdGljIGludCBzdGFydF9lbmNvZGUoc3RydWN0IHZw
dV9pbnN0YW5jZSAqaW5zdCwNCj4gdTMyICpmYWlsX3JlcykNCj4gPiAgCXN0cnVjdCBlbmNfcGFy
YW0gcGljX3BhcmFtOw0KPiA+ICAJdTMyIHN0cmlkZSA9IEFMSUdOKGluc3QtPmRzdF9mbXQud2lk
dGgsIDMyKTsNCj4gPiAgCXUzMiBsdW1hX3NpemUgPSAoc3RyaWRlICogaW5zdC0+ZHN0X2ZtdC5o
ZWlnaHQpOw0KPiA+IC0JdTMyIGNocm9tYV9zaXplID0gKChzdHJpZGUgLyAyKSAqIChpbnN0LT5k
c3RfZm10LmhlaWdodCAvIDIpKTsNCj4gPiArCXUzMiBjaHJvbWFfc2l6ZTsNCj4gPg0KPiA+ICAJ
bWVtc2V0KCZwaWNfcGFyYW0sIDAsIHNpemVvZihzdHJ1Y3QgZW5jX3BhcmFtKSk7DQo+ID4gIAlt
ZW1zZXQoJmZyYW1lX2J1ZiwgMCwgc2l6ZW9mKHN0cnVjdCBmcmFtZV9idWZmZXIpKTsNCj4gPg0K
PiA+ICsJaWYgKGluc3QtPnNyY19mbXQucGl4ZWxmb3JtYXQgPT0gVjRMMl9QSVhfRk1UX1lVVjQy
MCB8fA0KPiA+ICsJICAgIGluc3QtPnNyY19mbXQucGl4ZWxmb3JtYXQgPT0gVjRMMl9QSVhfRk1U
X1lVVjQyME0pDQo+ID4gKwkJY2hyb21hX3NpemUgPSAoKHN0cmlkZSAvIDIpICogKGluc3QtPmRz
dF9mbXQuaGVpZ2h0IC8gMikpOw0KPiA+ICsJZWxzZSBpZiAoaW5zdC0+c3JjX2ZtdC5waXhlbGZv
cm1hdCA9PSBWNEwyX1BJWF9GTVRfWVVWNDIyUCkNCj4gPiArCQljaHJvbWFfc2l6ZSA9ICgoc3Ry
aWRlKSAqIChpbnN0LT5kc3RfZm10LmhlaWdodCAvIDIpKTsNCj4gPiArCWVsc2UNCj4gPiArCQlj
aHJvbWFfc2l6ZSA9IDA7DQo+ID4gKw0KPiA+ICAJZHN0X2J1ZiA9IHY0bDJfbTJtX25leHRfZHN0
X2J1ZihtMm1fY3R4KTsNCj4gPiAgCWlmICghZHN0X2J1Zikgew0KPiA+ICAJCWRldl9kYmcoaW5z
dC0+ZGV2LT5kZXYsICIlczogTm8gZGVzdGluYXRpb24gYnVmZmVyIGZvdW5kXG4iLA0KPiA+IF9f
ZnVuY19fKTsgQEAgLTU1MCwxMSArNjEwLDE1IEBAIHN0YXRpYyBpbnQNCj4gd2F2ZTVfdnB1X2Vu
Y19zX2ZtdF9vdXQoc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKmZoLCBzdHJ1Y3QgdjRsMl9mb3Jt
DQo+ID4gIAl9DQo+ID4NCj4gPiAgCWlmIChpbnN0LT5zcmNfZm10LnBpeGVsZm9ybWF0ID09IFY0
TDJfUElYX0ZNVF9OVjEyIHx8DQo+ID4gLQkgICAgaW5zdC0+c3JjX2ZtdC5waXhlbGZvcm1hdCA9
PSBWNEwyX1BJWF9GTVRfTlYxMk0pIHsNCj4gPiArCSAgICBpbnN0LT5zcmNfZm10LnBpeGVsZm9y
bWF0ID09IFY0TDJfUElYX0ZNVF9OVjEyTSB8fA0KPiA+ICsJICAgIGluc3QtPnNyY19mbXQucGl4
ZWxmb3JtYXQgPT0gVjRMMl9QSVhfRk1UX05WMTYgfHwNCj4gPiArCSAgICBpbnN0LT5zcmNfZm10
LnBpeGVsZm9ybWF0ID09IFY0TDJfUElYX0ZNVF9OVjE2TSkgew0KPiA+ICAJCWluc3QtPmNiY3Jf
aW50ZXJsZWF2ZSA9IHRydWU7DQo+ID4gIAkJaW5zdC0+bnYyMSA9IGZhbHNlOw0KPiA+ICAJfSBl
bHNlIGlmIChpbnN0LT5zcmNfZm10LnBpeGVsZm9ybWF0ID09IFY0TDJfUElYX0ZNVF9OVjIxIHx8
DQo+ID4gLQkJICAgaW5zdC0+c3JjX2ZtdC5waXhlbGZvcm1hdCA9PSBWNEwyX1BJWF9GTVRfTlYy
MU0pIHsNCj4gPiArCQkgICBpbnN0LT5zcmNfZm10LnBpeGVsZm9ybWF0ID09IFY0TDJfUElYX0ZN
VF9OVjIxTSB8fA0KPiA+ICsJCSAgIGluc3QtPnNyY19mbXQucGl4ZWxmb3JtYXQgPT0gVjRMMl9Q
SVhfRk1UX05WNjEgfHwNCj4gPiArCQkgICBpbnN0LT5zcmNfZm10LnBpeGVsZm9ybWF0ID09IFY0
TDJfUElYX0ZNVF9OVjYxTSkgew0KPiA+ICAJCWluc3QtPmNiY3JfaW50ZXJsZWF2ZSA9IHRydWU7
DQo+ID4gIAkJaW5zdC0+bnYyMSA9IHRydWU7DQo+ID4gIAl9IGVsc2Ugew0KPiA+IEBAIC0xMTMy
LDYgKzExOTYsMTUgQEAgc3RhdGljIHZvaWQgd2F2ZTVfc2V0X2VuY19vcGVucGFyYW0oc3RydWN0
DQo+IGVuY19vcGVuX3BhcmFtICpvcGVuX3BhcmFtLA0KPiA+ICAJdTMyIG51bV9jdHVfcm93ID0g
QUxJR04oaW5zdC0+ZHN0X2ZtdC5oZWlnaHQsIDY0KSAvIDY0Ow0KPiA+ICAJdTMyIG51bV9tYl9y
b3cgPSBBTElHTihpbnN0LT5kc3RfZm10LmhlaWdodCwgMTYpIC8gMTY7DQo+ID4NCj4gPiArCWlm
IChpbnN0LT5zcmNfZm10LnBpeGVsZm9ybWF0ID09IFY0TDJfUElYX0ZNVF9OVjE2IHx8DQo+ID4g
KwkgICAgaW5zdC0+c3JjX2ZtdC5waXhlbGZvcm1hdCA9PSBWNEwyX1BJWF9GTVRfTlY2MSB8fA0K
PiA+ICsJICAgIGluc3QtPnNyY19mbXQucGl4ZWxmb3JtYXQgPT0gVjRMMl9QSVhfRk1UX1lVVjQy
MlAgfHwNCj4gPiArCSAgICBpbnN0LT5zcmNfZm10LnBpeGVsZm9ybWF0ID09IFY0TDJfUElYX0ZN
VF9OVjE2TSB8fA0KPiA+ICsJICAgIGluc3QtPnNyY19mbXQucGl4ZWxmb3JtYXQgPT0gVjRMMl9Q
SVhfRk1UX05WNjFNKQ0KPiA+ICsJCW9wZW5fcGFyYW0tPnNyY19mb3JtYXQgPSBGT1JNQVRfNDIy
Ow0KPiA+ICsJZWxzZQ0KPiA+ICsJCW9wZW5fcGFyYW0tPnNyY19mb3JtYXQgPSBGT1JNQVRfNDIw
Ow0KPiA+ICsNCj4gPiAgCW9wZW5fcGFyYW0tPndhdmVfcGFyYW0uZ29wX3ByZXNldF9pZHggPSBQ
UkVTRVRfSURYX0lQUF9TSU5HTEU7DQo+ID4gIAlvcGVuX3BhcmFtLT53YXZlX3BhcmFtLmh2c19x
cF9zY2FsZSA9IDI7DQo+ID4gIAlvcGVuX3BhcmFtLT53YXZlX3BhcmFtLmh2c19tYXhfZGVsdGFf
cXAgPSAxMDsNCg0K

