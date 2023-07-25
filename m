Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6907760A1A
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 08:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbjGYGQE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 02:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjGYGQC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 02:16:02 -0400
Received: from mo-csw.securemx.jp (mo-csw1122.securemx.jp [210.130.202.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B47BC1990;
        Mon, 24 Jul 2023 23:16:00 -0700 (PDT)
Received: by mo-csw.securemx.jp (mx-mo-csw1122) id 36P6FFG03650406; Tue, 25 Jul 2023 15:15:16 +0900
X-Iguazu-Qid: 2rWhuF4Kh8U7cvjA2r
X-Iguazu-QSIG: v=2; s=0; t=1690265715; q=2rWhuF4Kh8U7cvjA2r; m=mePywfFADdNnR7zHFijPrUR96ne6CGeGLx/6YN7zmJ4=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
        by relay.securemx.jp (mx-mr1123) id 36P6FCrV2017701
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 25 Jul 2023 15:15:12 +0900
X-SA-MID: 5052269
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlbCKfG4MzFwSRz+4YlxGZU/GMYiUkSNxHzbkPIT6wBNOHCncG+U/ltOcuCwEp7AB4ZtOu0e3PndYC1EW4UUKmh3BTNfjvVUy3nzrE25mp5kiToWDGnD9S1mY1+Hj7sUl/ukKqpQo4aqbFQeY5W4kq4UtlL8Ac7bv4T4RVmHUyrtxZiENHronCWBYMs0Wid6XD7VaO0cZVWsI6hwd6ROxjNehpx8JqvDdk7SGNG6w/W4Xi+c0paF5+HB67w1C8MCSMJCNNLWV82vuIwtwWvb98IaTGjV1gEgr6FQ++obWv1bSb4HI+bJ0hVst2xfNh549Ol9cAzeVw/IACoQPawhVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvwJGAcFc6dKsqCA7c1tZx9mOTO94zpSmSJwPLej6ho=;
 b=TP2cdUIBdkFAGbrzThIfB6CAoAY0rotXrbP9dir4kUg0eAFimPWd8z6CEV5RWfr+aFqobwp8uskym5e5nuTR1Qr8jply5POJUoslPVhDhtAvigZW9/VouKhUmlFJYrJlcq3Jl4J5w2/8IANGL3CsyRpZMCnxJJCdvO1UbU/shcu/GFvZqMVGDwQp/UU48JSpyXqfTSmQ4h00f62zvW2c1BO08ts+mZaghcCZIBVhgT2KA7jj7sMg+vZWNrVj6cc03G7ttYoyZKTWKn+7lrSVH0h4YYoAYKjo2cTeEC1aLi6pbBoeHBV81g4WDCq6du5vg+y3aOyIO05KAwu+Cy0k9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From:   <yuji2.ishikawa@toshiba.co.jp>
To:     <krzysztof.kozlowski@linaro.org>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <laurent.pinchart@ideasonboard.com>,
        <mchehab@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <nobuhiro1.iwamatsu@toshiba.co.jp>, <broonie@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v7 2/5] media: platform: visconti: Add Toshiba Visconti
 Video Input Interface driver
Thread-Topic: [PATCH v7 2/5] media: platform: visconti: Add Toshiba Visconti
 Video Input Interface driver
Thread-Index: AQHZtfW5hu3ISayHZk2QIdiCHPOlgK+45pCAgBEqX6A=
Date:   Tue, 25 Jul 2023 06:10:03 +0000
X-TSB-HOP2: ON
Message-ID: <TYAPR01MB620105AC2EDF36751EE654C89203A@TYAPR01MB6201.jpnprd01.prod.outlook.com>
References: <20230714015059.18775-1-yuji2.ishikawa@toshiba.co.jp>
 <20230714015059.18775-3-yuji2.ishikawa@toshiba.co.jp>
 <0d0cec7f-030f-ebc1-11f0-06214197a351@linaro.org>
In-Reply-To: <0d0cec7f-030f-ebc1-11f0-06214197a351@linaro.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYAPR01MB6201:EE_|TYCPR01MB10843:EE_
x-ms-office365-filtering-correlation-id: e502967c-1020-48e7-8aef-08db8cd5c953
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bl6JhMyML5R7lVCQbalGL+4yeHhvNlitTJ6niAV0jCFa974KZDGDEZ5ZfwdZ7bO+cLYIWZjR3UohEzcl8MlWDQ1PE5s/NHQx9Q8X9hJAabgTU+rN1hOYxBzfC/ypY8P1djxdHEfyzDPWe4mQuHgYJjc9CkNlDr0so42dG8434TIiYtBS7QvOQglS7DBTRYCfLbwdoFG9zk+k0RsDmPb8t3UgLNOp1uAKKVfcjn5xYLPPDRCJMDAaYAHjsNXdxl+lu6O8N+KFL8fxTxqWLDHU/4NMTPgagO5XIdsYtbo+EOYo/kTqK1q2dxorMlJtYfS5+cIRdef3SfBi0eql8QaCCxtaJOknityLiaZszo8SlJhgFcSC1whWOydUh0r4+Z/4js92bxMY3GOO5Q5DLBxBSCpOrRNKojSyV8lFCFHnLDONHWRo7DT1T9e5j1p4JF0LDk/XrdYNuDrvxrsvYtkswXD0lco288ANbVoreSlLTh3MUH1MdMgejgS63Nnu/L0fHnJ9gaFxuumGrd/oaEd9ucy6IvYJAooFtEd26TOZwYacyY5CJpIBykEq42Pr/qjkruYIxCyGAXfQYsxAMDQa66u5hf3vYM6SWzYkY8Gc4a5Lvm1KFbg53Ymih8Rzt2cd/8gvd2vWQjLukMwuyPzyXw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYAPR01MB6201.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199021)(86362001)(921005)(33656002)(122000001)(38070700005)(55016003)(30864003)(2906002)(110136005)(54906003)(478600001)(38100700002)(26005)(186003)(6506007)(53546011)(71200400001)(41300700001)(7416002)(52536014)(5660300002)(9686003)(7696005)(8676002)(8936002)(66946007)(66556008)(316002)(76116006)(83380400001)(66476007)(64756008)(4326008)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUxPMllPYXZhblFCL1RMSnJvSEVXNjFSUDQyYS9RZUdVaVA2QzJPdDMxYVpC?=
 =?utf-8?B?Q3BBYWZrS0NITWNZNmZSaFQ1cGdsamlMcjdlUHppaDM2ZXU2QXY1TU5heEZF?=
 =?utf-8?B?SU8yN3dHbkJCZkN6Ui9odWhrdTl3bWt4NHhsNTZYQ1gycWQzdGVhUHdHU3RI?=
 =?utf-8?B?c09sUFNCVndmSDlYb3R3UTNib3lIZ01PdThXWHp4WE91WGUwYXlNREp0UXFW?=
 =?utf-8?B?bFMvam9JK0VUNHJQRmpSUVFBNWc3M1RYL3RXU2tMbE03d0MrR00vclo2ZFZI?=
 =?utf-8?B?NURZUEZSb29YVmlmenp6Y1hlN3RIMmplaURqWTZBVG1QQWh2NWtGd3R5WTQr?=
 =?utf-8?B?QlZCOFoxT1Q1NXRRNkI4Znl6UVN2MUFHSHhVZjFRNkQ2aEtOemJBdFgxNTl0?=
 =?utf-8?B?cHpGRjBLYnFaMklPZW02MnowZGx4OXlYWGgrZExkcUgrOExVVjFMb29wVDRN?=
 =?utf-8?B?L0NLQlhramNMV3pRa0J3ZzhhK0RnZ1NBZ1k4V3ZCbGdnN0JMaFNrTEdzTEFE?=
 =?utf-8?B?YnFEUEN6OUxzNUJJVExXYmFnMDNWTUFWcVFpTjM1NlNmR1NoL3gvMm5yMWxj?=
 =?utf-8?B?eE16RXQrS3krdlRNK085alpYTFhScTVDRjk4c290T2lCOFA2Mnd6VmlYYWNq?=
 =?utf-8?B?TUFwVUl2VUNOTk85c2Y2WUpYQVBPWFdpTTRmRTM3R21rdzcwU3lnWnhEUW1i?=
 =?utf-8?B?TjlQdTllUjl4ZTRUTmZiSHU5RGhya0F5d21JNDB5WWtmdFNnZEZmTllyOTUr?=
 =?utf-8?B?SnB6UTYyQjJud1B1c3NoWG1pYjhjWXlWa1lid09KTm05MmRoUEpLQlRveFVU?=
 =?utf-8?B?THJobjkxekc5Mm93KzVQYi9TQ1BVaDJkMnFWdUlzd0pSQlN3Y3llUDJPdGE1?=
 =?utf-8?B?Tm9aSlpmWUJVL1FWbUkwcHl4RnR0VGR6czlwOXBCVEl3bGo4V2tQeUx5UVRm?=
 =?utf-8?B?NFhtZDBCOVBZc2xINXY1Z2FyMVBWVVU0cERBdm5SRE42N2JaMDc3R25VZkZz?=
 =?utf-8?B?OENJVS9scGdrVXNIMk01Q1NtclJsaHNRbzg3WUErMWVGVWxRYTg1d0hHYVlk?=
 =?utf-8?B?V1owQ1BsUmFiZXF3MnZYUU1uZis3UHJKQ2NKT2IzVlVXdkVsQjlRdHpzdHF1?=
 =?utf-8?B?SERvTHF5RmRtc1c5RG9OY0xIQktDK01vM2dDNHFtZHlwZzROVlZVOXFPWVN0?=
 =?utf-8?B?aUJVTkRnY1lFbCtXeHpOL2kzYnV5Z2hqOU81ZXc2QTNwc2VYSG5RWjUrL0pG?=
 =?utf-8?B?Y1RpRkY0VGRwaGZ6Y3l6Q2lSenVDaXdxMzgrQUFuRGQxZTVKS2kxVzNqWHRY?=
 =?utf-8?B?T05KV0hLWGlFeGVWYi9TUTVnWk10Q2hUYTdlMXdua1c3YWhGU1Btbk9qU3BJ?=
 =?utf-8?B?YnJQQ0g1bFdteHZtS1F1QWthV1pjQ2hKMnU1eG5aRTNNSVZHamxUTlFuV1pu?=
 =?utf-8?B?bitOWkZaTklQYjYzSkVIOWlGNGY0NTVQbDZUN1Y2N1lYeWVqemxycFd0Nita?=
 =?utf-8?B?T0pTdHNjdHA0RS9pZW1sbU9JY2kwc3JuNTQyMDhhVkkrOWZKQXRTTmM4Yjdz?=
 =?utf-8?B?OVV4R1ppalpta2Y5enUxbko4ZC9WU3grNGZ5dVBuQWhTN3kvZ29XcFJQbHQ5?=
 =?utf-8?B?bG5OU1FHVHR6ZlN5ZXkzNU9ndVhZeGdJZSt3U3Fkdm5CeEVpQzJXVnVMRnlr?=
 =?utf-8?B?ZlI5N0Q1dFRpaHYzclpBbzdJaHd3aEFTN0k3OEVPVGd2M1dxaGxtcWtaRUhQ?=
 =?utf-8?B?K0ZlN3pVUUlhaWtGcE8zaHJ5VHV2dWpvcW94YVlkK0poK280a1J0TFVXb2pC?=
 =?utf-8?B?TSsrL1BRRWM5NkZlZUVrbkdWdWh1MzFSZ2tuWEtQdHpvWnlzc0NmV01obGR6?=
 =?utf-8?B?OEFDTElnVm5wL3dxZHNRK1A2a2kzWXdjcTR0NU9Sajc0d2tOTFNqQ3V4anUy?=
 =?utf-8?B?VFZIVGM0VE93WVU5ZWRYb1RSRmZDaU9vRitFNjM4K0F4UDdyZkpPanpSNU1I?=
 =?utf-8?B?RUJDRUVxRm8yc3MzQ1p1WGlFRE9SSk4zNnl2c1lJRHBCMTF4QzdWeXpjbXE2?=
 =?utf-8?B?RjhYa0U2WWgyWGlVV0FHOWU5S0krdC9HcC9HNVNuS1NOa2tCeWVNaWpTSFZr?=
 =?utf-8?B?NUtJQU52akZBUUprb3ZjZDROeklhK25ROEJMeXZPWWdjeStpdWFBTXk0ZjI3?=
 =?utf-8?B?QkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?OFBVYzR6VG16aU54bDBLK29DdDVXcGtHaWpkTnpMcmZTbzBGbU1jZ0VJSER1?=
 =?utf-8?B?VFRtKzhWVDhpZ0VFc2VnSXdRbTNNZDlCZVlBV2pGc3p3YXlXb1ZGS2lZZUdS?=
 =?utf-8?B?SUxkMldzZDFzRVMyM0tNTjJpTHNmL0w2elovVUNyMTV1d0UvMEUrTHE4UXZQ?=
 =?utf-8?B?Y1lyMDBOZWxDSFhCWVhxUFhBc0c0WXF3bkx6N1VzWjJkeXFBYU50Rkl2UU0z?=
 =?utf-8?B?cWxGcktGZC83ckhNSms0RjZ2SmZTSVBDb1o3c21QZTdjSDZoQXV2MTliTUJV?=
 =?utf-8?B?MzFGblZoQVNmbHc0YjRNSkNIc2RERmpRbnZ5SlU3WWV5eU16MWFLTitGVHhp?=
 =?utf-8?B?NHJ6T0FudlhyRi95OEl4Smd5TDV0UnJFWC82SzlJQWdobEh6WEZGc2cwbmlP?=
 =?utf-8?B?UmpJOGVsdWxxTERMM2U4elJGUEcrbFdTSE9tc2dqc08rdXVkY0VweHRaclo3?=
 =?utf-8?B?QUNTWUxaQS8xT05KdmpmZWxyNGVYMXV2eTlUMzI0NURmMXdPc25LWU5BUlJG?=
 =?utf-8?B?aVpPRnBCcGdoSk5PaTFDcWZoMFVETTVsVzFZUTAwb1cvYlh2RUZ4djBZWVl3?=
 =?utf-8?B?YURFVTR3aWxSS1U1Tmc0N21ZemJHTXNxQWlUczVRdkFxUjNYSmlnS21QeUhW?=
 =?utf-8?B?alJ2aDViY05FR1NCSFRQVHFIUDI3aXo5T0s1L29aS0FuSGY2UFcyaUwreDNk?=
 =?utf-8?B?V2l4RXlpdlBZVVFoRFBFSm9EanVScm5sa3FNektYSnRVZHc5b2c1VGpOWG9M?=
 =?utf-8?B?SnQ4bTRZY3JZOEZ5VmtITGxqSEVJc3lTRmJvWjVGYSs0U25KNnNLQ3JCR0pa?=
 =?utf-8?B?Nis0eEhwK1lzeFB3VWNicUVNMXlVQnRSUStTTUtGblA0V2pQZWpBazkySGpF?=
 =?utf-8?B?ZSs5RWNxU0JXQjB4U1BDdERxNzBnS3pqaUw4Tkd3Y1BaN2ZUUFFyNlN2REtV?=
 =?utf-8?B?TGtwcW5KaXhBR1RhUnNoM3JiT1ZKWVZDU2dNaVRBNzlHU1U2Wk00bzEwWFhm?=
 =?utf-8?B?SUhNSEZvSWlXTUFPYkFleEpjT0MzK0Y4RVQ0OHJEajgxTEdEV011RWJ2blVN?=
 =?utf-8?B?cUtOZnhIY25BTFh1Y0RHNnBTdUtFSmZlREpxNmtFa2FjRzFlUWN6VDhVWmQ0?=
 =?utf-8?B?VVlERkVqbFV3Rzh3S1JtWmx4Z1pXUmoydDFYdkVCTUlLOEdmV3V0bWhSbDg1?=
 =?utf-8?B?UEdCUDJtZTZsbEVZaW1XaEZ2UFRocElMNFpkeE1zMlRwdjQ5a1BhYVN6bDI5?=
 =?utf-8?B?d2hGRkU4R0pQNGpnSVY1T0xwdXlhaFR5VVNFd3dNWHJmTkpVOXBKaDR0RHlR?=
 =?utf-8?Q?wPPIOaDkyEVcCx+X1nkBhC94I7Frb1+mTw?=
X-OriginatorOrg: toshiba.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR01MB6201.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e502967c-1020-48e7-8aef-08db8cd5c953
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 06:10:03.6388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WyBrKdyKcSjSN6DJk0AuzNaAC+vnADL0C1V7keH1W0y1y0O9w2fvstStHlo+8bnq8ls2+DuCQ3rNpR5a0JFtXn4HF4Q1bd0Hr0vmhY8qKGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10843
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbyBLcnp5c3p0b2YNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcgY29tbWVudHMuDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiBTZW50OiBGcmlkYXksIEp1bHkgMTQs
IDIwMjMgNTowMCBQTQ0KPiBUbzogaXNoaWthd2EgeXVqaSjnn7Plt50g5oKg5Y+4IOKXi++8su+8
pO+8o+KWoe+8oe+8qe+8tO+8o+KXi++8pe+8oemWiykNCj4gPHl1amkyLmlzaGlrYXdhQHRvc2hp
YmEuY28uanA+OyBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD47IFNha2FyaQ0KPiBB
aWx1cyA8c2FrYXJpLmFpbHVzQGlraS5maT47IExhdXJlbnQgUGluY2hhcnQNCj4gPGxhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT47IE1hdXJvIENhcnZhbGhvIENoZWhhYg0KPiA8bWNo
ZWhhYkBrZXJuZWwub3JnPjsgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlz
enRvZg0KPiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IENv
bm9yIERvb2xleQ0KPiA8Y29ub3IrZHRAa2VybmVsLm9yZz47IGl3YW1hdHN1IG5vYnVoaXJvKOWy
qeadviDkv6HmtIsg4peL77yk77yp77y077yj4pah77yk77yp77y04peLDQo+IO+8r++8s++8tCkg
PG5vYnVoaXJvMS5pd2FtYXRzdUB0b3NoaWJhLmNvLmpwPjsgTWFyayBCcm93bg0KPiA8YnJvb25p
ZUBrZXJuZWwub3JnPg0KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djcgMi81XSBtZWRpYTogcGxhdGZvcm06IHZpc2NvbnRpOiBBZGQgVG9zaGliYSBWaXNjb250aQ0K
PiBWaWRlbyBJbnB1dCBJbnRlcmZhY2UgZHJpdmVyDQo+IA0KPiBPbiAxNC8wNy8yMDIzIDAzOjUw
LCBZdWppIElzaGlrYXdhIHdyb3RlOg0KPiA+IEFkZCBzdXBwb3J0IHRvIFZpZGVvIElucHV0IElu
dGVyZmFjZSBvbiBUb3NoaWJhIFZpc2NvbnRpIEFSTSBTb0NzLg0KPiA+IFRoZSBpbnRlcmZhY2Ug
ZGV2aWNlIGluY2x1ZGVzIENTSTIgUmVjZWl2ZXIsIGZyYW1lIGdyYWJiZXIsIHZpZGVvIERNQUMN
Cj4gPiBhbmQgaW1hZ2Ugc2lnbmFsIHByb2Nlc3Nvci4NCj4gPg0KPiA+IEEgZHJpdmVyIGluc3Rh
bmNlIHByb3ZpZGVzIHRocmVlIC9kZXYvdmlkZW9YIGRldmljZSBmaWxlczsgb25lIGZvciBSR0IN
Cj4gPiBpbWFnZSBjYXB0dXJlLCBhbm90aGVyIG9uZSBmb3Igb3B0aW9uYWwgUkdCIGNhcHR1cmUg
d2l0aCBkaWZmZXJlbnQNCj4gPiBwYXJhbWV0ZXJzIGFuZCB0aGUgbGFzdCBvbmUgZm9yIFJBVyBj
YXB0dXJlLg0KPiA+DQo+IA0KPiAuLi4NCj4gDQo+ID4gK3N0YXRpYyBpbnQgdmlzY29udGlfdmlp
Zl9wYXJzZV9kdChzdHJ1Y3QgdmlpZl9kZXZpY2UgKnZpaWZfZGV2KSB7DQo+ID4gKwlzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm9mID0gdmlpZl9kZXYtPmRldi0+b2Zfbm9kZTsNCj4gPiArCXN0cnVjdCB2
NGwyX2Z3bm9kZV9lbmRwb2ludCBmd19lcDsNCj4gPiArCXN0cnVjdCB2aWlmX3N1YmRldiAqdmlp
Zl9zZDsNCj4gPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqZXA7DQo+ID4gKwl1bnNpZ25lZCBpbnQg
aTsNCj4gPiArCWludCBudW1fZXA7DQo+ID4gKwlpbnQgcmV0Ow0KPiA+ICsNCj4gPiArCW1lbXNl
dCgmZndfZXAsIDAsIHNpemVvZihzdHJ1Y3QgdjRsMl9md25vZGVfZW5kcG9pbnQpKTsNCj4gDQo+
IFdoeSB5b3UgY2Fubm90IGluaXRpYWxpemUgaXQgaW4gZGVjbGFyYXRpb24/ID0geyAwIH0/DQo+
IA0KDQpJJ2xsIGluaXRpYWxpemUgaXQgYXQgZGVjbGFyYXRpb24uDQpTYW1lIGZvciBzaW1pbGFy
IGNhc2VzLg0KDQo+ID4gKw0KPiA+ICsJbnVtX2VwID0gb2ZfZ3JhcGhfZ2V0X2VuZHBvaW50X2Nv
dW50KG9mKTsNCj4gPiArCWlmICghbnVtX2VwKQ0KPiA+ICsJCXJldHVybiAtRU5PREVWOw0KPiA+
ICsNCj4gPiArCXJldCA9IHZpc2NvbnRpX3ZpaWZfaW5pdF9hc3luY19zdWJkZXZzKHZpaWZfZGV2
LCBudW1fZXApOw0KPiA+ICsJaWYgKHJldCkNCj4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ICsNCj4g
PiArCWZvciAoaSA9IDA7IGkgPCBudW1fZXA7IGkrKykgew0KPiA+ICsJCWVwID0gb2ZfZ3JhcGhf
Z2V0X2VuZHBvaW50X2J5X3JlZ3Mob2YsIDAsIGkpOw0KPiA+ICsJCWlmICghZXApIHsNCj4gPiAr
CQkJZGV2X2Vycih2aWlmX2Rldi0+ZGV2LCAiTm8gc3ViZGV2aWNlIGNvbm5lY3RlZCBvbg0KPiBl
bmRwb2ludCAldS5cbiIsIGkpOw0KPiA+ICsJCQlyZXQgPSAtRU5PREVWOw0KPiA+ICsJCQlnb3Rv
IGVycm9yX3B1dF9ub2RlOw0KPiA+ICsJCX0NCj4gPiArDQo+ID4gKwkJcmV0ID0gdjRsMl9md25v
ZGVfZW5kcG9pbnRfcGFyc2Uob2ZfZndub2RlX2hhbmRsZShlcCksDQo+ICZmd19lcCk7DQo+ID4g
KwkJaWYgKHJldCkgew0KPiA+ICsJCQlkZXZfZXJyKHZpaWZfZGV2LT5kZXYsICJVbmFibGUgdG8g
cGFyc2UgZW5kcG9pbnQNCj4gIyV1LlxuIiwgaSk7DQo+ID4gKwkJCWdvdG8gZXJyb3JfcHV0X25v
ZGU7DQo+ID4gKwkJfQ0KPiA+ICsNCj4gPiArCQlpZiAoZndfZXAuYnVzX3R5cGUgIT0gVjRMMl9N
QlVTX0NTSTJfRFBIWSB8fA0KPiA+ICsJCSAgICBmd19lcC5idXMubWlwaV9jc2kyLm51bV9kYXRh
X2xhbmVzID09IDApIHsNCj4gPiArCQkJZGV2X2Vycih2aWlmX2Rldi0+ZGV2LCAibWlzc2luZyBD
U0ktMiBwcm9wZXJ0aWVzIGluDQo+IGVuZHBvaW50XG4iKTsNCj4gPiArCQkJcmV0ID0gLUVJTlZB
TDsNCj4gPiArCQkJZ290byBlcnJvcl9wdXRfbm9kZTsNCj4gPiArCQl9DQo+ID4gKw0KPiA+ICsJ
CS8qIFNldHVwIHRoZSBjZXUgc3ViZGV2aWNlIGFuZCB0aGUgYXN5bmMgc3ViZGV2aWNlLiAqLw0K
PiA+ICsJCXZpaWZfc2QgPSAmdmlpZl9kZXYtPnN1YmRldnNbaV07DQo+ID4gKwkJSU5JVF9MSVNU
X0hFQUQoJnZpaWZfc2QtPmFzZC5saXN0KTsNCj4gPiArDQo+ID4gKwkJdmlpZl9zZC0+bnVtX2xh
bmUgPSBmd19lcC5idXMubWlwaV9jc2kyLm51bV9kYXRhX2xhbmVzOw0KPiA+ICsJCXZpaWZfc2Qt
PmFzZC5tYXRjaF90eXBlID0gVjRMMl9BU1lOQ19NQVRDSF9GV05PREU7DQo+ID4gKwkJdmlpZl9z
ZC0+YXNkLm1hdGNoLmZ3bm9kZSA9DQo+ID4gKw0KPiAJZndub2RlX2dyYXBoX2dldF9yZW1vdGVf
cG9ydF9wYXJlbnQob2ZfZndub2RlX2hhbmRsZShlcCkpOw0KPiA+ICsNCj4gPiArCQl2aWlmX2Rl
di0+YXNkc1tpXSA9ICZ2aWlmX3NkLT5hc2Q7DQo+ID4gKwkJb2Zfbm9kZV9wdXQoZXApOw0KPiA+
ICsJfQ0KPiA+ICsNCj4gPiArCXJldHVybiBudW1fZXA7DQo+ID4gKw0KPiA+ICtlcnJvcl9wdXRf
bm9kZToNCj4gPiArCW9mX25vZGVfcHV0KGVwKTsNCj4gPiArCXJldHVybiByZXQ7DQo+ID4gK30N
Cj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHZpc2NvbnRpX3Zp
aWZfb2ZfdGFibGVbXSA9IHsNCj4gPiArCXsNCj4gPiArCQkuY29tcGF0aWJsZSA9ICJ0b3NoaWJh
LHZpc2NvbnRpNS12aWlmIiwNCj4gPiArCX0sDQo+ID4gKwl7fSwNCj4gPiArfTsNCj4gPiArTU9E
VUxFX0RFVklDRV9UQUJMRShvZiwgdmlzY29udGlfdmlpZl9vZl90YWJsZSk7DQo+ID4gKw0KPiA+
ICsjZGVmaW5lIE5VTV9JUlFTICAgMw0KPiA+ICsjZGVmaW5lIElSUV9JRF9TVFIgInZpaWYiDQo+
ID4gKw0KPiA+ICtzdGF0aWMgaW50IHZpc2NvbnRpX3ZpaWZfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikgew0KPiA+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsN
Cj4gPiArCXN0cnVjdCB2aWlmX2RldmljZSAqdmlpZl9kZXY7DQo+ID4gKwlkbWFfYWRkcl90IHRh
Ymxlc19kbWE7DQo+ID4gKwlpbnQgcmV0LCBpLCBudW1fc2Q7DQo+ID4gKw0KPiA+ICsJcmV0ID0g
ZG1hX3NldF9tYXNrX2FuZF9jb2hlcmVudChkZXYsIERNQV9CSVRfTUFTSygzNikpOw0KPiA+ICsJ
aWYgKHJldCkNCj4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiArCXZpaWZfZGV2ID0gZGV2
bV9remFsbG9jKGRldiwgc2l6ZW9mKCp2aWlmX2RldiksIEdGUF9LRVJORUwpOw0KPiA+ICsJaWYg
KCF2aWlmX2RldikNCj4gPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gPiArDQo+ID4gKwlwbGF0Zm9y
bV9zZXRfZHJ2ZGF0YShwZGV2LCB2aWlmX2Rldik7DQo+ID4gKwl2aWlmX2Rldi0+ZGV2ID0gZGV2
Ow0KPiA+ICsNCj4gPiArCXNwaW5fbG9ja19pbml0KCZ2aWlmX2Rldi0+cmVnYnVmX2xvY2spOw0K
PiA+ICsJbXV0ZXhfaW5pdCgmdmlpZl9kZXYtPnBvd19sb2NrKTsNCj4gPiArCW11dGV4X2luaXQo
JnZpaWZfZGV2LT5zdHJlYW1fbG9jayk7DQo+ID4gKw0KPiA+ICsJdmlpZl9kZXYtPmNhcHR1cmVf
cmVnID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOw0KPiA+ICsJaWYg
KElTX0VSUih2aWlmX2Rldi0+Y2FwdHVyZV9yZWcpKQ0KPiA+ICsJCXJldHVybiBQVFJfRVJSKHZp
aWZfZGV2LT5jYXB0dXJlX3JlZyk7DQo+ID4gKw0KPiA+ICsJdmlpZl9kZXYtPmNzaTJob3N0X3Jl
ZyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAxKTsNCj4gPiArCWlmIChJ
U19FUlIodmlpZl9kZXYtPmNzaTJob3N0X3JlZykpDQo+ID4gKwkJcmV0dXJuIFBUUl9FUlIodmlp
Zl9kZXYtPmNzaTJob3N0X3JlZyk7DQo+ID4gKw0KPiA+ICsJdmlpZl9kZXYtPmh3YWlmX3JlZyA9
IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAyKTsNCj4gPiArCWlmIChJU19F
UlIodmlpZl9kZXYtPmh3YWlmX3JlZykpDQo+ID4gKwkJcmV0dXJuIFBUUl9FUlIodmlpZl9kZXYt
Pmh3YWlmX3JlZyk7DQo+ID4gKw0KPiA+ICsJdmlpZl9kZXYtPm1wdV9yZWcgPSBkZXZtX3BsYXRm
b3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMyk7DQo+ID4gKwlpZiAoSVNfRVJSKHZpaWZfZGV2
LT5tcHVfcmVnKSkNCj4gPiArCQlyZXR1cm4gUFRSX0VSUih2aWlmX2Rldi0+bXB1X3JlZyk7DQo+
ID4gKw0KPiA+ICsJdmlpZl9kZXYtPnJ1bl9mbGFnX21haW4gPSBmYWxzZTsNCj4gPiArDQo+ID4g
Kwlmb3IgKGkgPSAwOyBpIDwgTlVNX0lSUVM7IGkrKykgew0KPiA+ICsJCXJldCA9IHBsYXRmb3Jt
X2dldF9pcnEocGRldiwgaSk7DQo+ID4gKwkJaWYgKHJldCA8IDApIHsNCj4gPiArCQkJZGV2X2Vy
cihkZXYsICJmYWlsZWQgdG8gYWNxdWlyZSBpcnEgcmVzb3VyY2VcbiIpOw0KPiA+ICsJCQlyZXR1
cm4gcmV0Ow0KPiANCj4gcmV0dXJuIGRldl9lcnJfcHJvYmUoKQ0KPiANCg0KSSdsbCB1c2UgZGV2
X2Vycl9wcm9iZSgpLg0KU2FtZSBmb3Igb3RoZXIgc3VnZ2VzdGlvbnMuDQoNCj4gPiArCQl9DQo+
ID4gKwkJdmlpZl9kZXYtPmlycVtpXSA9IHJldDsNCj4gPiArCQlyZXQgPSBkZXZtX3JlcXVlc3Rf
aXJxKGRldiwgdmlpZl9kZXYtPmlycVtpXSwgdmlzY29udGlfdmlpZl9pcnEsIDAsDQo+IElSUV9J
RF9TVFIsDQo+ID4gKwkJCQkgICAgICAgdmlpZl9kZXYpOw0KPiA+ICsJCWlmIChyZXQpIHsNCj4g
PiArCQkJZGV2X2VycihkZXYsICJpcnEgcmVxdWVzdCBmYWlsZWRcbiIpOw0KPiANCj4gcmV0dXJu
IGRldl9lcnJfcHJvYmUoKQ0KPiANCg0KSSdsbCB1c2UgZGV2X2Vycl9wcm9iZSgpLg0KDQo+ID4g
KwkJCXJldHVybiByZXQ7DQo+ID4gKwkJfQ0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCXZpaWZfZGV2
LT50YWJsZXMgPQ0KPiA+ICsJCWRtYV9hbGxvY193YyhkZXYsIHNpemVvZihzdHJ1Y3QgdmlpZl90
YWJsZV9hcmVhKSwgJnRhYmxlc19kbWEsDQo+IEdGUF9LRVJORUwpOw0KPiA+ICsJaWYgKCF2aWlm
X2Rldi0+dGFibGVzKSB7DQo+ID4gKwkJZGV2X2VycihkZXYsICJkbWFfYWxsb2Nfd2MgZmFpbGVk
XG4iKTsNCj4gDQo+IEFyZSB5b3Ugc3VyZSBETUEgbWVtb3J5IGFsbG9jYXRpb24gZXJyb3JzIHNo
YWxsIGJlIHByaW50ZWQ/DQo+IA0KDQpQcmludGluZyB0aGlzIGVycm9yIGlzIHVzZWxlc3MgZm9y
IHVzZXJzIGluIGdlbmVyYWw/DQpJZiBzbywgSSdsbCBkcm9wIHRoaXMgZGVidWcgb3V0cHV0Lg0K
DQo+ID4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ID4gKwl9DQo+ID4gKwl2aWlmX2Rldi0+dGFibGVz
X2RtYSA9IChzdHJ1Y3QgdmlpZl90YWJsZV9hcmVhICopdGFibGVzX2RtYTsNCj4gPiArDQo+ID4g
KwkvKiBwb3dlciBjb250cm9sICovDQo+IA0KPiBEcm9wIHRoZSBjb21tZW50LCBpdCBpcyB1c2Vs
ZXNzLg0KPiANCg0KSSdsbCBkcm9wIHRoZSBjb21tZW50DQoNCj4gPiArCXBtX3J1bnRpbWVfZW5h
YmxlKGRldik7DQo+ID4gKw0KPiA+ICsJLyogYnVpbGQgbWVkaWFfZGV2ICovDQo+ID4gKwl2aWlm
X2Rldi0+bWVkaWFfZGV2Lmh3X3JldmlzaW9uID0gMDsNCj4gPiArCXN0cnNjcHkodmlpZl9kZXYt
Pm1lZGlhX2Rldi5tb2RlbCwgVklJRl9EUklWRVJfTkFNRSwNCj4gc2l6ZW9mKHZpaWZfZGV2LT5t
ZWRpYV9kZXYubW9kZWwpKTsNCj4gPiArCXZpaWZfZGV2LT5tZWRpYV9kZXYuZGV2ID0gZGV2Ow0K
PiA+ICsJLyogVE9ETzogcGxhdGZvcm06dmlzY29udGktdmlpZi0wLDEsMiwzIGZvciBlYWNoIFZJ
SUYgZHJpdmVyIGluc3RhbmNlICovDQo+ID4gKwlzbnByaW50Zih2aWlmX2Rldi0+bWVkaWFfZGV2
LmJ1c19pbmZvLA0KPiBzaXplb2YodmlpZl9kZXYtPm1lZGlhX2Rldi5idXNfaW5mbyksICIlcy0w
IiwNCj4gPiArCQkgVklJRl9CVVNfSU5GT19CQVNFKTsNCj4gPiArCW1lZGlhX2RldmljZV9pbml0
KCZ2aWlmX2Rldi0+bWVkaWFfZGV2KTsNCj4gPiArDQo+ID4gKwkvKiBidWlsZCB2NGwyX2RldiAq
Lw0KPiA+ICsJdmlpZl9kZXYtPnY0bDJfZGV2Lm1kZXYgPSAmdmlpZl9kZXYtPm1lZGlhX2RldjsN
Cj4gPiArCXJldCA9IHY0bDJfZGV2aWNlX3JlZ2lzdGVyKGRldiwgJnZpaWZfZGV2LT52NGwyX2Rl
dik7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCWdvdG8gZXJyb3JfZG1hX2ZyZWU7DQo+ID4gKw0K
PiA+ICsJcmV0ID0gbWVkaWFfZGV2aWNlX3JlZ2lzdGVyKCZ2aWlmX2Rldi0+bWVkaWFfZGV2KTsN
Cj4gPiArCWlmIChyZXQpIHsNCj4gPiArCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byByZWdpc3Rl
ciBtZWRpYSBkZXZpY2U6ICVkXG4iLCByZXQpOw0KPiA+ICsJCWdvdG8gZXJyb3JfdjRsMl91bnJl
Z2lzdGVyOw0KPiANCj4gZGV2X2Vycl9wcm9iZQ0KPiANCg0KSSdsbCB1c2UgZGV2X2Vycl9wcm9i
ZSgpLg0KDQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmV0ID0gdmlzY29udGlfdmlpZl9jc2kycnhf
cmVnaXN0ZXIodmlpZl9kZXYpOw0KPiA+ICsJaWYgKHJldCkgew0KPiA+ICsJCWRldl9lcnIoZGV2
LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIGNzaTJyeCBzdWIgbm9kZTogJWRcbiIsIHJldCk7DQo+IA0K
PiBkZXZfZXJyX3Byb2JlDQo+IA0KDQpJJ2xsIHVzZSBkZXZfZXJyX3Byb2JlKCkuDQoNCj4gPiAr
CQlnb3RvIGVycm9yX21lZGlhX3VucmVnaXN0ZXI7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmV0
ID0gdmlzY29udGlfdmlpZl9pc3BfcmVnaXN0ZXIodmlpZl9kZXYpOw0KPiA+ICsJaWYgKHJldCkg
ew0KPiA+ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIGlzcCBzdWIgbm9kZTog
JWRcbiIsIHJldCk7DQo+IA0KPiBkZXZfZXJyX3Byb2JlDQo+IA0KDQpJJ2xsIHVzZSBkZXZfZXJy
X3Byb2JlKCkuDQoNCj4gPiArCQlnb3RvIGVycm9yX21lZGlhX3VucmVnaXN0ZXI7DQo+ID4gKwl9
DQo+ID4gKwlyZXQgPSB2aXNjb250aV92aWlmX2NhcHR1cmVfcmVnaXN0ZXIodmlpZl9kZXYpOw0K
PiA+ICsJaWYgKHJldCkgew0KPiA+ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVy
IGNhcHR1cmUgbm9kZTogJWRcbiIsIHJldCk7DQo+IA0KPiBkZXZfZXJyX3Byb2JlDQo+IA0KDQpJ
J2xsIHVzZSBkZXZfZXJyX3Byb2JlKCkuDQoNCj4gPiArCQlnb3RvIGVycm9yX21lZGlhX3VucmVn
aXN0ZXI7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJLyogaGFuZGxlIHN1YmRldmljZXMgaW4gZGV2
aWNlIHRyZWUgKi8NCj4gPiArCW51bV9zZCA9IHZpc2NvbnRpX3ZpaWZfcGFyc2VfZHQodmlpZl9k
ZXYpOw0KPiA+ICsJaWYgKHJldCA8IDApIHsNCj4gPiArCQlyZXQgPSBudW1fc2Q7DQo+IA0KPiBy
ZXQgPSBkZXZfZXJyX3Byb2JlDQo+IA0KDQpJJ2xsIHVzZSBkZXZfZXJyX3Byb2JlKCkuDQoNCj4g
PiArCQlnb3RvIGVycm9yX21lZGlhX3VucmVnaXN0ZXI7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJ
dmlpZl9kZXYtPm5vdGlmaWVyLnY0bDJfZGV2ID0gJnZpaWZfZGV2LT52NGwyX2RldjsNCj4gPiAr
CXY0bDJfYXN5bmNfbmZfaW5pdCgmdmlpZl9kZXYtPm5vdGlmaWVyKTsNCj4gPiArCWZvciAoaSA9
IDA7IGkgPCBudW1fc2Q7IGkrKykNCj4gPiArCQlfX3Y0bDJfYXN5bmNfbmZfYWRkX3N1YmRldigm
dmlpZl9kZXYtPm5vdGlmaWVyLA0KPiB2aWlmX2Rldi0+YXNkc1tpXSk7DQo+ID4gKwl2aWlmX2Rl
di0+bm90aWZpZXIub3BzID0gJnZpaWZfbm90aWZ5X29wczsNCj4gPiArCXJldCA9IHY0bDJfYXN5
bmNfbmZfcmVnaXN0ZXIoJnZpaWZfZGV2LT52NGwyX2RldiwgJnZpaWZfZGV2LT5ub3RpZmllcik7
DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCWdvdG8gZXJyb3JfbWVkaWFfdW5yZWdpc3RlcjsNCj4g
PiArDQo+ID4gKwl2aWlmX2Rldi0+d3EgPSBjcmVhdGVfd29ya3F1ZXVlKCJ2aXNjb250aS12aWlm
Iik7DQo+ID4gKwlpZiAoIXZpaWZfZGV2LT53cSkNCj4gPiArCQlyZXR1cm4gLUVOT01FTTsNCj4g
DQo+IE5vIGVycm9yIGNsZWFudXA/DQo+IA0KDQpUaGVyZSBzaG91bGQgYmUuIEknbGwgYWRkIGNs
ZWFudXAgb3BlcmF0aW9ucy4NCg0KPiA+ICsJSU5JVF9XT1JLKCZ2aWlmX2Rldi0+d29yaywgdmlz
Y29udGlfdmlpZl93dGhyZWFkX2wxaW5mbyk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4g
Kw0KPiA+ICtlcnJvcl9tZWRpYV91bnJlZ2lzdGVyOg0KPiA+ICsJbWVkaWFfZGV2aWNlX3VucmVn
aXN0ZXIoJnZpaWZfZGV2LT5tZWRpYV9kZXYpOw0KPiA+ICtlcnJvcl92NGwyX3VucmVnaXN0ZXI6
DQo+ID4gKwl2NGwyX2RldmljZV91bnJlZ2lzdGVyKCZ2aWlmX2Rldi0+djRsMl9kZXYpOw0KPiA+
ICtlcnJvcl9kbWFfZnJlZToNCj4gPiArCXBtX3J1bnRpbWVfZGlzYWJsZShkZXYpOw0KPiA+ICsJ
ZG1hX2ZyZWVfd2MoJnBkZXYtPmRldiwgc2l6ZW9mKHN0cnVjdCB2aWlmX3RhYmxlX2FyZWEpLA0K
PiB2aWlmX2Rldi0+dGFibGVzLA0KPiA+ICsJCSAgICAoZG1hX2FkZHJfdCl2aWlmX2Rldi0+dGFi
bGVzX2RtYSk7DQo+ID4gKwlyZXR1cm4gcmV0Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMg
aW50IHZpc2NvbnRpX3ZpaWZfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpIHsN
Cj4gPiArCXN0cnVjdCB2aWlmX2RldmljZSAqdmlpZl9kZXYgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0
YShwZGV2KTsNCj4gPiArDQo+ID4gKwlkZXN0cm95X3dvcmtxdWV1ZSh2aWlmX2Rldi0+d3EpOw0K
PiA+ICsJdmlzY29udGlfdmlpZl9pc3BfdW5yZWdpc3Rlcih2aWlmX2Rldik7DQo+ID4gKwl2aXNj
b250aV92aWlmX2NhcHR1cmVfdW5yZWdpc3Rlcih2aWlmX2Rldik7DQo+ID4gKwl2NGwyX2FzeW5j
X25mX3VucmVnaXN0ZXIoJnZpaWZfZGV2LT5ub3RpZmllcik7DQo+IA0KPiBXaHkgdGhlc2UgdGhy
ZWUgYXJlIG5vdCBjYWxsZWQgaW4gcHJvYmUgZXJyb3IgcGF0aHM/DQo+IA0KDQpUaGVyZSBzaG91
bGQgYmUuIEknbGwgYWRkIGNhbGxzIG9mIHVucmVnaXN0ZXIgZnVuY3Rpb25zLg0KDQo+ID4gKwlt
ZWRpYV9kZXZpY2VfdW5yZWdpc3RlcigmdmlpZl9kZXYtPm1lZGlhX2Rldik7DQo+ID4gKwl2NGwy
X2RldmljZV91bnJlZ2lzdGVyKCZ2aWlmX2Rldi0+djRsMl9kZXYpOw0KPiA+ICsJcG1fcnVudGlt
ZV9kaXNhYmxlKCZwZGV2LT5kZXYpOw0KPiA+ICsJZG1hX2ZyZWVfd2MoJnBkZXYtPmRldiwgc2l6
ZW9mKHN0cnVjdCB2aWlmX3RhYmxlX2FyZWEpLA0KPiB2aWlmX2Rldi0+dGFibGVzLA0KPiA+ICsJ
CSAgICAoZG1hX2FkZHJfdCl2aWlmX2Rldi0+dGFibGVzX2RtYSk7DQo+ID4gKw0KPiA+ICsJcmV0
dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgdmlzY29udGlfdmlpZl9ydW50
aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KSB7DQo+ID4gKwkvKiBUaGlzIGNhbGxiYWNr
IGlzIGtpY2tlZCB3aGVuIHRoZSBsYXN0IGRldmljZS1maWxlIGlzIGNsb3NlZCAqLw0KPiA+ICsJ
c3RydWN0IHZpaWZfZGV2aWNlICp2aWlmX2RldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiA+
ICsNCj4gPiArCW11dGV4X2xvY2soJnZpaWZfZGV2LT5wb3dfbG9jayk7DQo+IA0KPiBXaHk/DQo+
IA0KDQpJJ2xsIGRyb3AgdGhpcyBtdXRleCBjYWxsLg0KDQpJIHdhcyBub3Qgc3VyZSBpZiBydW50
aW1lX3N1c3BlbmQoKSBhbmQgcnVudGltZV9yZXN1bWUoKSBhcmUgbm90IHByb2Nlc3NlZCBhdCB0
aGUgc2FtZSB0aW1lLg0KTm93IEkgdW5kZXJzdGFuZCBjYWxsYmFja3MgYXJlIG11dHVhbGx5IGV4
Y2x1c2l2ZSAoYXMgZG9jdW1lbnRlZCBpbiBydW50aW1lX3BtLnJzdCkuDQoNCj4gPiArCXZpc2Nv
bnRpX3ZpaWZfaHdfb2ZmKHZpaWZfZGV2KTsNCj4gPiArCW11dGV4X3VubG9jaygmdmlpZl9kZXYt
PnBvd19sb2NrKTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAr
c3RhdGljIGludCB2aXNjb250aV92aWlmX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRl
dikgew0KPiA+ICsJLyogVGhpcyBjYWxsYmFjayBpcyBraWNrZWQgd2hlbiB0aGUgZmlyc3QgZGV2
aWNlLWZpbGUgaXMgb3BlbmVkICovDQo+ID4gKwlzdHJ1Y3QgdmlpZl9kZXZpY2UgKnZpaWZfZGV2
ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4gKw0KPiA+ICsJdmlpZl9kZXYtPnJhd3BhY2tf
bW9kZSA9ICh1MzIpVklJRl9SQVdQQUNLX0RJU0FCTEU7DQo+ID4gKw0KPiA+ICsJbXV0ZXhfbG9j
aygmdmlpZl9kZXYtPnBvd19sb2NrKTsNCj4gDQo+IFdoeT8NCj4gDQoNCkknbGwgZHJvcCB0aGlz
IG11dGV4IGNhbGwuDQoNCj4gPiArDQo+ID4gKwkvKiBJbml0aWFsaXplIEhXRCBkcml2ZXIgKi8N
Cj4gPiArCXZpc2NvbnRpX3ZpaWZfaHdfb24odmlpZl9kZXYpOw0KPiA+ICsNCj4gPiArCS8qIFZT
WU5DIG1hc2sgc2V0dGluZyBvZiBNQUlOIHVuaXQgKi8NCj4gPiArCXZpaWZfbWFpbl92c3luY19z
ZXRfaXJxX21hc2sodmlpZl9kZXYsDQo+IE1BU0tfSU5UX01fU1lOQ19NQVNLX1NFVCk7DQo+ID4g
Kw0KPiA+ICsJLyogU1RBVFVTIGVycm9yIG1hc2sgc2V0dGluZyBvZiBNQUlOIHVuaXQgKi8NCj4g
PiArCXZpaWZfbWFpbl9zdGF0dXNfZXJyX3NldF9pcnFfbWFzayh2aWlmX2RldiwNCj4gPiArTUFT
S19JTlRfTV9ERUxBWV9JTlRfRVJST1IpOw0KPiA+ICsNCj4gPiArCS8qIFZTWU5DIG1hc2sgc2V0
dGluZ3Mgb2YgU1VCIHVuaXQgKi8NCj4gPiArCXZpaWZfc3ViX3ZzeW5jX3NldF9pcnFfbWFzayh2
aWlmX2RldiwNCj4gTUFTS19JTlRfU19TWU5DX01BU0tfU0VUKTsNCj4gPiArDQo+ID4gKwkvKiBT
VEFUVVMgZXJyb3IgbWFzayBzZXR0aW5nKHVubWFzaykgb2YgU1VCIHVuaXQgKi8NCj4gPiArCXZp
aWZfc3ViX3N0YXR1c19lcnJfc2V0X2lycV9tYXNrKHZpaWZfZGV2LA0KPiA+ICsJCQkJCSBNQVNL
X0lOVF9TX1JFU0VSVkVEX1NFVCB8DQo+IE1BU0tfSU5UX1NfREVMQVlfSU5UX0VSUk9SKTsNCj4g
PiArDQo+ID4gKwltdXRleF91bmxvY2soJnZpaWZfZGV2LT5wb3dfbG9jayk7DQo+ID4gKw0KPiA+
ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlz
enRvZg0KDQpCZXN0IHJlZ2FyZHMsDQpZdWppDQo=

