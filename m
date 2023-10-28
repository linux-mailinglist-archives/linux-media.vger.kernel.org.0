Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95EBE7DA4A6
	for <lists+linux-media@lfdr.de>; Sat, 28 Oct 2023 03:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232936AbjJ1BcY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 21:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjJ1BcW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 21:32:22 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01olkn2038.outbound.protection.outlook.com [40.92.107.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20387128
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 18:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAg2qZZz46tjnTR3SxmejB91G9EPFdNde7r+7R24/jYmMzNO9xB1E/ITXX/fe35mAp63iWxjwE8+tGmoPpWUwssBCdsbUZGnErmS8XFdHtK4jzLEhXyOWNBb59fxTnO+W3HB6yTBLL9zWRfN03pG1yHxwOUGxATNPGSCzfyS/bZVM8GNmfnBvTgBkn+iTcCqGigpLCXaXecGYvjBS76o+CI5i6pYB4YwgkKk6U97iwsnVQB24adgdmZKyL9tqyTqIRJTyAk1z1sBlZlbUwmpC+OZD2KX6cPbDaFo5/GqgcZl38NRY6vt0C5qRQqkDx1ZE3YoU2clQWE/CgjKhN2sGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COaMORrVQSNiFn9DP0oseUh0PeylsYttsycVJ6Vn1nY=;
 b=TlKpxUH4B0ayFbrWO8hI9VblWJq5bJ2KphLAfAXDn7tlRrsF+ZcvDHvR8w4i2xum0cdGVrD1QEVRnifmncSwir3ebrwW2M7obttQ+wG1VTC5cjY4w5i7vbbLMJidhRRd5wBns1vbb31Nbd/7xru8Rngy6bvA5YhJT+I5v8mI/VYSFgBQoesCz8+CrS+emnwYOrmXrot1cwP5ZGVgE8wpwxMloYmE9NrFP0+Frfyk8H09O81w5bbY0EktQ53lLdlohdURmHfgVQYQjElem9EGzTFTIqR/yeah8CnwXgOEjnXcJlp068rSmd5LzkYyFFSGchn1OjVXL9na8o2Ne/SHbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COaMORrVQSNiFn9DP0oseUh0PeylsYttsycVJ6Vn1nY=;
 b=Uji5t0CMtg22ipwqU3AaJ4o2T1tzqqqgYst5mejjPCrS1SYD8RVZ+NW7xnf1j2mo+uSdBdvzrFtZR1qtZNZE02qcY6DXVEI1Rfy5vUedrgi6cAM4/Juyf2EduxbKxAYfXV2WCxfzea/MOQRIXyZuAtuZL0sD04Oziez8yitXBwU6vId4DH6SPtLmfAj88fBYYVYh1o36J1tJN6esDPof8gapkGLROa3aftH7EVZy0qnwdImv320lXKiadBXGPdvmEwkQ3QW9P9wq28GCawGA8Fo+vJgw8LF9PwqoTHzAmUkO1f41o59zIK6gbu9SMaYam+COhXAMpK5SzRxEEo+R7w==
Received: from TYZPR01MB4593.apcprd01.prod.exchangelabs.com
 (2603:1096:400:261::8) by JH0PR01MB5581.apcprd01.prod.exchangelabs.com
 (2603:1096:990:10::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Sat, 28 Oct
 2023 01:32:04 +0000
Received: from TYZPR01MB4593.apcprd01.prod.exchangelabs.com
 ([fe80::abfd:21f1:b2c1:64d7]) by TYZPR01MB4593.apcprd01.prod.exchangelabs.com
 ([fe80::abfd:21f1:b2c1:64d7%3]) with mapi id 15.20.6933.024; Sat, 28 Oct 2023
 01:32:04 +0000
From:   sales sales <salesbest83@outlook.com>
Subject: direct
Thread-Topic: direct
Thread-Index: AQHaCT6CywaEAkFu8UWzx9jcLcVEdg==
Date:   Sat, 28 Oct 2023 01:32:04 +0000
Message-ID: <5c7260098598430f9579f189719cf65eTYZPR01MB4593FD4D7A88BF7CA25BBEE3BFDCA@TYZPR01MB4593.apcprd01.prod.exchangelabs.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [EKPeRmWUN8LJ0DeekaiZVf+yEUCNP/N5]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR01MB4593:EE_|JH0PR01MB5581:EE_
x-ms-office365-filtering-correlation-id: f90756e9-c09d-4c3b-e1a3-08dbd755b0c5
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y2dR2Wjwg7SEKBLXza9YJ+6Dr1Vrt6sPv3psPs5Zj5B86OSxW5rsurcOP224NCP8t/jlb3IktmlNeEhkvVaPVkasgv8M3ygE3DaSkaH76GT2kMfKzQYMD0OZzypgTYfSxu7gr3CmiK5/wh4gAYPbwyLJ/I+a79bYBcqTTFZ6epKKFT2TnSQP5DoGVU2e+CVP3Uy2BxO3ATFgyGxhcUvfCQqlBJdNvxLLB+n1uG1WzqgRzXBRSQDfkbC+GPTRiN1vm8RAdHi6i/1BV/+xEnNXwWTNIac2kug8VWsndSd0FMKEK7EsYrwA293y+4Ga5Ar4ivvDo5pu8Z7PoJNq7KBAgV4iTqZooAEEQ5vJACoS4gRT3B6xTOf1vITBd5JHx1pUDB13gScnfMZIEmbyBQbfnREOCVLSn8s38pGOpeBsjR2iT+bkCMFNRyu0ipY83kpd1H053/YbHtpObLA8YL7si7WdZyZ1XDCBn1xi4xJ6/DgmTaIGQCvs7o2Ueu50OUF2rL2O5E7rr8qRrJescwny9Ic0RJ76XQyru75By85Rw7oZT7VLnW/ZN8nVJT3MIt4m
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?bk5BRS85ZXBLUE10aUcxZVpWV1Z2cXoyMk85RDhEVjd6SitMOEtveXk0RU1p?=
 =?gb2312?B?cjI4b0VXL3BneFJBRVFsT2ZFMy9NOUptQUlhZnZNUXdkN0FQdGs1ZzVmVlJh?=
 =?gb2312?B?cjJBcU5CdjlTeWxKOE1KdDBqM1pPdmxRNGp6WWxScno2ZElCNnRkVDlQNk5C?=
 =?gb2312?B?ZnNJT1I4aFg2MFN5SjVKaFdWeEVWdnkvTCtvUzQxM0V3MzlFRFJiMUlQS2tw?=
 =?gb2312?B?NnY2Y00zaFhVMzJiSk83Z2JDVHNRK3ZScjJBd3dYUHlEaDdBVXhXQUZGdHo0?=
 =?gb2312?B?enNXNHc5UzE4eW9QL29LS1NKbUgvRGp3eWlROEdsOXRXUkplUVUrREx5bmd0?=
 =?gb2312?B?QnNmZ3loL093ZVBxUGNPWTJxRDQwdjlCdStCMGxFazdoRk1SSnFPNDBqbEpZ?=
 =?gb2312?B?VkNFTlQzakt5UmFOTHV5bU8xZzd5N0w2VGVFVG50WC8yYTlRN05TaUovVmxT?=
 =?gb2312?B?TCtaQ3QrRGNvbndGd2VFWHNUdWwxMC8vei8zb1A4bkN3MFo4aWpNU2VnN2VW?=
 =?gb2312?B?Tk5Lekxpam5HNnNwNTQxREUrREUzUjNReDFsVHBhSnpCOCsvanhzY1NCdGxK?=
 =?gb2312?B?VGhBUFFSUlRHNzBVZHdiMGdvaGZrL1dnOTJsS0tQNENvWDNGL3F4R2czVFE1?=
 =?gb2312?B?ZHVIV0hBQnJCRnl1bzE2NHBYZUlsdUpBSnVVNnk0VjJqZCtXa3phRE1OZDQ1?=
 =?gb2312?B?Nmh3VGRvdW5mdkVpMWJ6aEtKZkRVUHVaTzZydk5RZGlXekk3SGhwc3J5anpj?=
 =?gb2312?B?cWczYmtzTnVkWVZjRGNORk9JRWNkQTc2WGNFSkUxVkJyMm8yTXJiZGZQY1Mv?=
 =?gb2312?B?ZnlXSjVWSnBwcEFUQ1NQSUZBQkg5R3ZKMjNrcTBkT2IyajNUb0RJandzZlF4?=
 =?gb2312?B?blRXNkczWXoxQ1JtMThBdUJ3Wk5tK0ZNR2MwR1V2VG5DR3hZN3pmeHJ0M0h2?=
 =?gb2312?B?dEZzZ1ZJL1BUSGgxSVIzaHdvU2RSYU5aTVk4YU5MaUd4alNyS0ZCYWpiU2tC?=
 =?gb2312?B?YmxQZndYeGdWUUFBNy9ZUFo4RU1rbTh6N2pEcm51NEU4RlA1d2x0WHFnSWJI?=
 =?gb2312?B?UllkdUNpYXhJT1laTmswcGN0QUsybzhKemFwOHlTdm1lM0lJNzNzV3p1UFF4?=
 =?gb2312?B?VDhGR1ZWMDV6THFLS1ZtUVVoVHphb1lBRkRiSm9xN1pWYWlzWW1oVElRWkZ4?=
 =?gb2312?B?RUlyRHhDSG5FRXBxeEc4dWhvY0gxcCt3YkZxVlVSWkNQbnVSd0dWanc0a2d6?=
 =?gb2312?B?Lzh6dTJ6TytnV0RkMnArUzRNOTAyc3RHeXNFQ0VsM3lsZS9NWmEzTGRDajRj?=
 =?gb2312?B?dHU4WXlxcngvVEpybnNLTHdodnI1VHN2S1QwNU11NHY3YUkxUTh5R2lXbG5n?=
 =?gb2312?B?RlNjWjNMZlJoOE5laExDQnZBbUVTalNPUTZQemRvYWhMV1BKOERHM2tCNU92?=
 =?gb2312?B?S3FOakgwYm0wRXR4cmtZbk14SDlON3lnYTF2Mm9JVUlXbzEvWjIwSEdCNHRy?=
 =?gb2312?B?QlNncytuaS9CR0ptdDJta2Mrc2IrbkJEOS9mdU03NTYxc0YvL2dsalR2dldD?=
 =?gb2312?B?NUJVa2hwZ2tLVXFwNWI1SnZGaVZlZm1acHU4Sk9tdDlpNHdtdUlOOXpSSzVw?=
 =?gb2312?B?RFM1YjNVYnhpaUk4ckMzU25UVTYwSmc9PQ==?=
Content-Type: text/plain; charset="gb2312"
Content-ID: <6081540798AB3B4A94002D68491E8A87@apcprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB4593.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f90756e9-c09d-4c3b-e1a3-08dbd755b0c5
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2023 01:32:04.0451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR01MB5581
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,MISSING_HEADERS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVGhlcmUsCkhvcGUgeW91oa9yZSBpbiBnb29kIGhlYWx0aC4KV2Whr3JlIE1hbnVmYWN0dXJl
ciAmIEV4cG9ydGVyIG9mIEJhdHRlcnkgZnJvbSBDaGluYS4KV2UgYXJlIGZhY3RvcnkgbWFudWZh
Y3R1cmluZyBCYXR0ZXJ5IGZvciAxNSB5ZWFycywgYW5kIGV4cG9ydCB0byBvdmVyIDYwIGNvdW50
cmllcy4gT3VyIHByb2R1Y3RzIGFyZSB3ZWxsIHJlY2VpdmVkIGJ5IGN1c3RvbWVycy4KSGVyZSB3
ZSBhcmUgcHJvZHVjaW5nIGN1c3RvbWl6ZSBwcm9kdWN0cyBhcyBwZXIgY3VzdG9tZXKhr3MgZGVt
YW5kLiBDdXN0b21pemUgZGVzaWducywgbGFiZWwgJiBwYWNraW5nIGF2YWlsYWJsZS4KCldlbGNv
bWUgdG8gZW5xdWlyeS4gSSB3aWxsIGFmdGVyIGdldHRpbmcgdGhlIGluZm9ybWF0aW9uLCBzZW5k
IHlvdSBhIGJlc3QgcHJpY2UuCldpdGggbXkgYmVzdCByZWdhcmRzLApBbmR5
