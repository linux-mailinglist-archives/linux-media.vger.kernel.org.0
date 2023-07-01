Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC2B7445E7
	for <lists+linux-media@lfdr.de>; Sat,  1 Jul 2023 03:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjGABkt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 21:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjGABks (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 21:40:48 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01olkn2015.outbound.protection.outlook.com [40.92.53.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CAE94204
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 18:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+F0JErc4NE1h6hnMiWQtqsyvzFHK+YiEWahwU97fwh00PUcvdRCc1Q5p6RSvHwg7GfktW7YZbcOrNjp3DzzBh80+a/MKWlXtW6a5JdryEhHlAA5SsqNBIxhlKjRsMG5oqZ8KODynJ6KbbEGbhHtjaMOi80H1/qwcqEU3lwaDkd42o07uWsW4+DqsDFuHsemcQQbgYCDUORsKrxuzpvShzpJRDRsJcbNVfCBwNin9ekpfVlrC6hBw9+hrlloO+538Z5goBBGgRHe9CYpix3vgjjuAjKfngDK+PIpzjVD5YHFBcgmv4ghaBQS7E6TVZaHTafR312cVuOqsXWxYPbmfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXW1kdHkYPjT4Em+CuWfSkfA4iKBk3bbzc1uWQ97pDE=;
 b=mTu4Hbmrm9+1tPyStWuDy5F97y4NojyNXFzcAPZ4L5a3DrfkO/Y71qlXumzZUoto/Tg+oYAGtNDFXL0/hl0KOZtI6to4RZXSIRCn+UXkREBXpaBh4/E95relwoAJbfMSC8fZVsbf5KJjnZW2cWbrud3EqVRBUvwUO5A1GMIkVHwhDichwAl/aOdtI18ZS9XcfJZP45IcJBg4FWDtKdBeslXd0te52hmLQGf8SuecsaQlWJUjxm66x0UyqXBZuCaLM/pgwM73vNRXN0y1/dzKSvvTOyJixay0mGP2Jb8tr8XRlxTWU4VwkC5VD0/mu1geJUQNPGoNPD34E1TcF1+/Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXW1kdHkYPjT4Em+CuWfSkfA4iKBk3bbzc1uWQ97pDE=;
 b=Mvnw5oOcchv6KK4RsHOj68+X9iaZcPRlH4sG5vVqy2wt/ASZnPtcrfggn8Zxgb5cPsFys5N/hWeqxsuHpkI05ZfXcW8RvpPIFXionOBjdEdQJwZRC3nl+PyUKf+rExISS0sd8GHpf6PU73LSek+tBPYjsMP9JpKhrPUh1fy4QaMW9f4fuFoOlvf2wDyEU7bC6WMwFCJmQUdYz6Nkw6/rGgLlw03bkwNdryg8tYdEuVvnsQHkxfP4St0orlVZzjxplDyc2bHMFL8o+X1IXDOTK6OConQgugdDSw1RPxo4G5P/LzY9fAMFuWQ9Tzm4J2y942gnvrv8PlvsB73fX/dpdQ==
Received: from TYUPR01MB5308.apcprd01.prod.exchangelabs.com
 (2603:1096:400:35f::6) by TYUPR01MB5283.apcprd01.prod.exchangelabs.com
 (2603:1096:400:353::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Sat, 1 Jul
 2023 01:40:23 +0000
Received: from TYUPR01MB5308.apcprd01.prod.exchangelabs.com
 ([fe80::93eb:4a29:83e5:a0f3]) by TYUPR01MB5308.apcprd01.prod.exchangelabs.com
 ([fe80::93eb:4a29:83e5:a0f3%7]) with mapi id 15.20.6521.026; Sat, 1 Jul 2023
 01:40:23 +0000
From:   sales sales <salesbest40@outlook.com>
Subject: Battery Factory
Thread-Topic: Battery Factory
Thread-Index: AQHZqvKYheSWlb6+BkW1nncEihTduQ==
Date:   Sat, 1 Jul 2023 01:40:23 +0000
Message-ID: <9be669d8fc794e3d8e7d0458dbc991b9TYUPR01MB5308D21226BFABAB3561C1F1B02AA@TYUPR01MB5308.apcprd01.prod.exchangelabs.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [UdBQ5XmseBvuO1qeGNl3c5mJwAmOnXU+ul4+IUObVA/wg0ktUu/vLA==]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR01MB5308:EE_|TYUPR01MB5283:EE_
x-ms-office365-filtering-correlation-id: 965e7747-febf-4292-ca03-08db79d42318
x-ms-exchange-slblob-mailprops: 2pQMrP2hzeYYwv7y6kIq9jf8/L5Ld2y4UTMS3dDkWTClWiLBhGR3jAMyDSKarjYVed3j+X1bYQeZZ3yADCVQ1RFuFrx5l9/AJzl3q5js45TtaMcGqN+qCC9RYLZKw4wjkreJU+woIrt6tiq9fGxb9uJpIb53Sm4u1drQOyjjlH+gif1Dd3UUZJflM8qnfr8YKVg1KozvTvytZsL0Ft5RHd0a2VWDQe4xcvVdWCV2VQc6OA/fPH5t/51CRYt40coAzFE3mDPFyWYmeUhSJj290rPktfp/T87zGO/RjX/Cqhl2yiN94LmvvjnBJ3T9KM+kH4s55i86geSvzdVDrnQf8HfJ90tCc0KrUf5YdX5lP9w7FihM8i7gzltiPnq4vIOsfFbztW1mWfbgssI+CHD1OYYJ+GoMv8Tr6VA0IwahnFv/zpL7P5nwkRj08l2nwUR3HMzGAZ71pTxY412FlIm9xw9oumHAcoorNe2AZaTmkTLzYaSYj4R/0zTik04Mx3qhxYqbnm37s+liiaSPVdXDO+22ZutGe81SuoTC7m1pOUh38yuTUQRRglhpt1qIPC27KllXiZREH8mnUHpyhxbda+rQEc4AGdGgSp7T7W2Xxpk=
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LbHyCaKJXtUfdv/AtbqASvLUBIT+kwIB50AEHCvGSWtvTr5nvK290+H0qdRi8Vdxxm9yld0Ln/HX36XNGmMiTBoWSkolZ9XcBJpRwJIxMYht8ge7xw2S+W2BaLm7jLkPac3uTF7iXiHFZtvBbpr70PiDsC/ok07NQ7BY+XZvSJCi0rzPhwmHDyiVissm5Cj8SgjBbbBWppMScruKBGb70ecTy9oP7rCjvqTieEylevZZ89j8LeCtsjusmhTQC+hgAAsKPmjfHJ61WabiDGB3s55P6xcAjqvnzlgAJ8T3g+9LH4hszX6hrSUYbNrCLgR4/aVkJ4I5Y8XaVyxsTvoV36+pX4pHNWN3lIGXvzxq2XY0nr6DHcn/zYUwKYuklq+pmAqmSWmpx9Fci8jX4MdEofeaTX4duV0TDlcY+dpsCYTLBp8mRqY5Qoi0uESulPrcMjmxFYfTrZnwAmaysp+dhwNcCH0R5Tqs6RzHg4LQBAp0u+fqjb/gPljFCwbmlD0HNhgLQL6hBrudc5LcC8ORHFkezh+T+VtOuZnC52rb2frgb8dm4QzM4Q4Rs5DT/cZW
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?WE40Mk5iOWt5a1hYRXY3MVc1YnovbEwxTVlYVGxjRElkeWhSQU1vVXFDcmR5?=
 =?gb2312?B?ZE9yYjlUL21qeUV6ckxmdWZpbGFqOEFUTGtVR3h3UWluclg2Wnk2Y0lCMnhF?=
 =?gb2312?B?ZmtKVmhnRUgwbG93dW12aWxmVjk4dEZjdUcrSTJiaDhSaG83QldtaU9yYWx0?=
 =?gb2312?B?TG9Rcll0TjFwREtoT2diaEZwZWN0ekQ1UFBjN09GZHJoQ1NWT0gzeTFMZ2RS?=
 =?gb2312?B?VjAvSXlzYkd5TjFySFdOaHQ3R2o4eDJ4Rk9iMzBCSGpxS1N0ZW0yaXNGdWw1?=
 =?gb2312?B?eG8xYWVpTEQxYXZRRFdqVEFrZ1ZmdktXN1FvcVFRUG0rcnd6UzErUU1ER003?=
 =?gb2312?B?N081NkhxVEpSUmxRWGZXdG5oY1dmUDdIUTVjempRcWFrbWhNYjF4SDFCcnl2?=
 =?gb2312?B?bm5GbWc1a3JtTU51SStscDREWGljUS9oVHFKZTZod3F5QWliaFM5UWlLNWQw?=
 =?gb2312?B?bXF6dW16R3AwSW9xSmFqZ2wwV0pCb3VqZ1ZZc2FCQTJnT3JhejA1SlJHN0Rk?=
 =?gb2312?B?MmJINGUxUjFQaVBWTW1BUE5HVkh4dGtzR1dPbUhZeFdxdDdvM0Rta09aV0Rl?=
 =?gb2312?B?L2tIcTlRWHVXcXZJS0FYd3o1RG9wTWtXS1pXMG1aTXkxZVhOWG9keVBoS3FO?=
 =?gb2312?B?R0lKUTNUbDlwdTIxZ2xBOVZOM3lKVnRYMElxZEsvTUtuUG9PaFh0RXhBUkNn?=
 =?gb2312?B?aER3VWptdnR5bWQzQTNERVJXOHcwRDBVTHJxQ0FZOUtoWWFkNlJJRzZvOXJI?=
 =?gb2312?B?bks4aTRTLzcrUmZGNDc0OHphem1OeFVlcmZZaHhodm5oS1IrMjBhdCtXc2wy?=
 =?gb2312?B?U0ZvaTA3STVTOThxejdRK05takpjczd4aFB5TjBFSGZxTU9WTFJPUEV5eHZh?=
 =?gb2312?B?emcvOWs2UUZ5L2prL3RDOXNNYk1zYWsweDRDNE1sUy9XaUZ3dW1zL2xEamVS?=
 =?gb2312?B?THM0cFNKMjVPY2ZQVU5XOUhDSElxcThDMjdyaHhLUFVCbWl0eVc0OXdWcU5k?=
 =?gb2312?B?c0JtMEY0M2xEWDBRb0lyazVydHc3eWtOU1ZuemVoRVlyOXByREVsM2VuT0VQ?=
 =?gb2312?B?V1A1SkVoZG9pMXB0RHk4MTI3TW5CM01obUx0U0IzNCswSVRNbUFGK1RibllI?=
 =?gb2312?B?T3g1d2Fnb0U4TE9LeTJ0K000c0tPNmkxbmVaMGRONmwvZ1FYdXlEUlRZK25T?=
 =?gb2312?B?OC81TWRmbm1kM3NLTXdjeHpGQmlxd3BYOHI3bHVpVFBpazd5U290ckN4NHdr?=
 =?gb2312?B?OGNXVkpqakhaL0xlTjBtOUF2dVdCbEV0ZmlXNXhiSDdLcjVudXlNNFV0YTVW?=
 =?gb2312?B?MEE1Yms5SUgvZEdmL2srZDlUbzd6cEVNL0tLVWlrS3lJcFBRRUE5RVk0c085?=
 =?gb2312?B?K0lkUTNrREVjbGpwN25TRlRtN0lPVDl2UDJoWUpxWHdsV2Y1NVFCZ2owUEFY?=
 =?gb2312?B?czJNQ1d2b0dRaHNYZzlKQVpKVDIxR3VtSVhJZmFITjJRRFBYMlR2Uno5L0xP?=
 =?gb2312?B?REsxWlhMS3B3TU5wQ1NySzFVNUx3V0xpVmp3dlM2ZXBVcnB5SU1aZDlGR2Vj?=
 =?gb2312?B?Z1FvWWYrbXJuYldwck1mQ0FPWW9NT2k3S25ibHR4ckZXejcrVktxSjhGYkpY?=
 =?gb2312?B?cGM5RWZEVlhvY0llQWVnMzRETENqOTUvcldCSkI3UlpqdFd4cHRSR3pLYS9H?=
 =?gb2312?Q?bY4vZlcyUM2aYeJFzWV8?=
Content-Type: text/plain; charset="gb2312"
Content-ID: <4EE4930B9DA70747A5A089FE60E34581@apcprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR01MB5308.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 965e7747-febf-4292-ca03-08db79d42318
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2023 01:40:23.1311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR01MB5283
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,MISSING_HEADERS,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVGhlcmUsCldpc2ggeW91IGhhdmUgYSBuaWNlIGRheS4KS25vd2luZyB5b3UgYXJlIGluIGJ1
c2luZXNzIG9mIEJhdHRlcnkuCldlIGFyZSBNYW51ZmFjdHVyZXIgYW5kIEV4cG9ydGVyIGluIGFs
bCBraW5kcyBvZiBCYXR0ZXJ5LgoKMS4gQ3VzdG9taXplZCBpcyBhY2NlcHRhYmxlLgoyLiBPRU0g
c2VydmljZSBpcyBwcm92aWRlZC4KMy4gSGlnaCBRdWFsaXR5IGFuZCBTdGFibGVkIGRlbGl2ZXJ5
IGlzIGVuc3VyZWQuCkFueSBpbnRlcmVzdCBwbHMgcmVwbHkgdGhlbiB3ZSBxdW90ZSBnb29kIHBy
aWNlLgoKU28gd2Ugd2FudCB0byBhdmFpbCBvdXJzZWx2ZXMgb2Ygb3Bwb3J0dW5pdHkgZXN0YWJs
aXNoaW5nIGJ1c2luZXNzIHJlbGF0aW9uIHdpdGggeW91LgpCZXN0IHJlZ2FyZHMsCkFuZHk=
