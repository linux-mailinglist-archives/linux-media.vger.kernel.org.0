Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 559EC78D16A
	for <lists+linux-media@lfdr.de>; Wed, 30 Aug 2023 02:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236947AbjH3AwI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Aug 2023 20:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238855AbjH3AwG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Aug 2023 20:52:06 -0400
X-Greylist: delayed 60 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 29 Aug 2023 17:52:01 PDT
Received: from mo-csw.securemx.jp (mo-csw1120.securemx.jp [210.130.202.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E414E1A1;
        Tue, 29 Aug 2023 17:52:01 -0700 (PDT)
Received: by mo-csw.securemx.jp (mx-mo-csw1120) id 37U0pDpl2313923; Wed, 30 Aug 2023 09:51:13 +0900
X-Iguazu-Qid: 2rWgDRdQ10M1rG4fiu
X-Iguazu-QSIG: v=2; s=0; t=1693356672; q=2rWgDRdQ10M1rG4fiu; m=Aht6ugH86BdfufBwHJt6XAIzdojyBzwWi3xqjNTaHTs=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
        by relay.securemx.jp (mx-mr1120) id 37U0p9wG467860
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 30 Aug 2023 09:51:10 +0900
X-SA-MID: 6092064
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOTVr7uT0NUo0vXc/4Q1SQOyoO9uOuIOm/7CpPZNbDivUPKNI7NumU+7L6dZdlLsQ97GIDPVVf+sB17B8FV5c6dny0MrZZf05O7bN+UuPuLdt2BUyKqfbFCWJvtdUHb87VM7JDw063lGW6eJW7WF32oL1ZGVK2AvPVG5Lwd/g/E8/vCI9ne5aRSsfC4fDOdXz6oHlf4SDE/Q3AU0GmMAg8Axzx8N8cAuX7OVN3c7FGNFGHT/h0NaziQTlMQMvpFXuPJrxOYdCTSI75+BA0rXhPRCY4fifb2gE68a/mSaSZvbV1ElMCkZonqjnYyN5vniooG5vz3QHF0/Npuo+k+GEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kb62jdmUMxMbbj8ziNvPyHPZshdC1ubx2WXKFA6TThA=;
 b=YkcK8w+jSci3tGJdGSuSjguXj8Nk072+81iwpfpQNq7QfHhF8xITOHB844jDcsWp3qBASvSOhelzoSNblGromwpSZJ7Zcme+ifiwIeFWkFZiyueaDWO0Iuxh3bCFz/z0HiV0jmn0kk1DDWhip2qMJbFPEczsQgntWNxVDuyivPhcYFAFR0W9lsxhTeKLSp7x9sjkXqjvRt+oGhn4w7+U+E3LsAmgoAKLB+LuPzno9deoR316Ur2QcXoj8LtvNw4mgdKx80+cLq9pIxxipR4suVNfVS+gFbuzOUcLTUIG9e4ibIcUPox6CEbhYggPduKgayZdGlLSMAWlQjZH3ZAUDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From:   <yuji2.ishikawa@toshiba.co.jp>
To:     <laurent.pinchart@ideasonboard.com>, <hverkuil@xs4all.nl>
CC:     <sakari.ailus@iki.fi>, <mchehab@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <nobuhiro1.iwamatsu@toshiba.co.jp>, <broonie@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v7 3/5] media: add V4L2 vendor specific control handlers
Thread-Topic: [PATCH v7 3/5] media: add V4L2 vendor specific control handlers
Thread-Index: AQHZtfWzEqevcwGz1UOaqGUA5smVJa/06fqAgAABmwCADV74MA==
Date:   Wed, 30 Aug 2023 00:46:03 +0000
X-TSB-HOP2: ON
Message-ID: <TYAPR01MB6201E9B3F4CAA41B17DCD24492E6A@TYAPR01MB6201.jpnprd01.prod.outlook.com>
References: <20230714015059.18775-1-yuji2.ishikawa@toshiba.co.jp>
 <20230714015059.18775-4-yuji2.ishikawa@toshiba.co.jp>
 <d2925a76-ab66-9d76-803b-3e3a421411d9@xs4all.nl>
 <20230821123356.GH10135@pendragon.ideasonboard.com>
In-Reply-To: <20230821123356.GH10135@pendragon.ideasonboard.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYAPR01MB6201:EE_|TY3PR01MB10028:EE_
x-ms-office365-filtering-correlation-id: 68047161-0608-492a-de87-08dba8f27cd9
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gFpntsWG+WmGx6amCS7V9Uh1nD3I5ngOmjFF2v9y4Rj5kG0s0oOXnin1A4oKD+qy/VEUYcluwBxJypPEOcpmvL8uEHtxxz0M41Ecd6K8lQ4ZiQJFZGHbaY2wEQeuuKj3ro7rpefVVDEUtLcIJXyOvgyzPtFXR4eTqIPKXqlfAFl7omU5zjeBoIDy41QMTii7qjEgzOUaadv3ZlDXxYtm9NPlVjHe9NVXyNMLp8DAE4BRkF6m8kTXM1BGvstGloTgk7yHELEPRyqAYR3mGT589YV5YHFhHwbXv+0H22YS5YX847xDPmPpPoo+H1rzc1tbujArJM+AGcLAWqEMi1Eo89wI0tpx2XWpiW8567ARq2xA0ub544qgNh+Ozxa9KhF4kNjYhB1zKwtocNH6a1G2AhG8plFtFwvhHB6cwneM1H19+mNCr5TQbcOuBhvuo/AQph1zK7uAxconXeN1qdpOQ+3nxb9YRQzrZCr4RaCk16tNm554LdWDaa2YT8kCRfeYPFQBBL286Z23kiXVkG0sEPjb1HFZxsrWE51IGMS9eQ9TTxStrPlN5PLKEEUcSWs96nC3k/Rl25tPy2gW81C6Heh7RBj2sUAAu+2QJnha+k51nqm3+GzidyWOodFXXiXLjOHQAe7cfD9tsf4L6f0Vww==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYAPR01MB6201.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199024)(186009)(1800799009)(2906002)(30864003)(7416002)(54906003)(55016003)(66556008)(66946007)(76116006)(66446008)(64756008)(66476007)(316002)(33656002)(41300700001)(52536014)(4326008)(8936002)(8676002)(5660300002)(71200400001)(6506007)(110136005)(7696005)(53546011)(86362001)(38070700005)(38100700002)(9686003)(122000001)(26005)(478600001)(83380400001)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ym1la2VZUEg1SGdXQlIreEptNHBrVVA0RmUvd1htZ0tpQytMYXlHODFRVEFm?=
 =?utf-8?B?SmsvT3JqdGhGSitHcXlTSjV5Z0VUK1hzalIzRThOVUlpR0RGQkU5SG5pMHF6?=
 =?utf-8?B?eCsxVlRvTUgxWWxCYUs1aThzSWpKdWR2V3FnMUVLQW5aL3lraXRXQVN2QTNM?=
 =?utf-8?B?YmV5bnZFa1ZrQ01lcEtKWXhaNzdBT1lKUzZ2L2kwM282T0dBcXBtemVEY3NG?=
 =?utf-8?B?Z2FkOVNvL1IyWU9Kd3UybUxNYmh5UlMzWndOU09aYUlseGlRRUZaTjFwdWth?=
 =?utf-8?B?QlBzbXRXTW1pd1kvaFlIeURCMDJoSndpT21kZ0ZiVllEQkRFZSszcjhmZXpW?=
 =?utf-8?B?MDVyNXJUZXhmL09vZzV4NUhsOFQwYnhpYzNhMDVxVmNVV3NZRURsOHdpSjg3?=
 =?utf-8?B?akVhR0hHMzVSRlRHQ3pQcGxVQmZCRG4rbHVUNndLL3p2SmdzRDZrVmdhU0Zj?=
 =?utf-8?B?ZEF1Q1h0bnU1czFZcmtYa3VzQkgrcHB6Qi9ucUR2alh4QTlrT1Qzc0RYTjEx?=
 =?utf-8?B?dTIxRTA5UStQYXp6eHRsUm11SEVadU1BczduandzZ0hhOXlDMnVRb0QvYmNi?=
 =?utf-8?B?QXV0d3lRYkZRemFnbFhDTmRlM3RuR2p2R3l4VUhKK2lVbW1LUkxhUmxiN2Y5?=
 =?utf-8?B?R2ZvWFlNenFSQXZ6ZW1SSXRKWThEUWFNQjJKTnF4SEdkM3YwdGFuWnhUUytE?=
 =?utf-8?B?bGhzamJHM3MxZ1pDWDN2NHhCU2pETXo3K0Z2azgyeHNkeWt3OG8rbXF0QW9V?=
 =?utf-8?B?K0trci9JcjVsUGNocUg1NlM5Z2ViUFAvdG8wMG1TREcyL1hjSW1PSUxqcDdX?=
 =?utf-8?B?L1g2SUpWcENTdHRURWQyUWdCWTFHN0FTTndrcE40WkNOQ1FqRDI4QkdjcUR0?=
 =?utf-8?B?SlFNU3RMWFZEZ3lnV3FhWmM4UXJKQnpscHNUanZXUGFtL2hVQ0ZIeXdHRHZp?=
 =?utf-8?B?MDdmYW1Zd3J1OU1IajlzR3ljR3FxQ3hRcjV0OUVjNDRGYURWYXIxS0FuOUYr?=
 =?utf-8?B?Tm15MkxUVDRsTU1WUUw2M3RpUGlzbTllY3BDcnBXaXRwZ0NIQjJCKys1ZHNj?=
 =?utf-8?B?bDlyUlg3aU9hd2JoWXVpTVV4TUdnR2wrTlVlLytQbXh2Nm0zYnpFaEtYNjFt?=
 =?utf-8?B?K1RlTDg5aEFSb2JCdkNVbXhvOW9LbmdrZk1YOS9QeGt6eldHQmp0RnZOYTRB?=
 =?utf-8?B?TVFoWTFwSXdOL3lzRlZzZVJJdWdoRzQ3MkV4WnlOUjMzTnJkMG5sV29FNm5a?=
 =?utf-8?B?SGY4V29YNGI2U21JbS8vYmhwV3IzRVJVTjI4ZGdJdlZPWU1abkU4WWRGK0Vz?=
 =?utf-8?B?SEhaRmpYMU04M2N2OThleVFYK1orMG9WTFhyNGxUR1IyV2wvVlhMZEdvQzha?=
 =?utf-8?B?UFFtRC8rRTIxMithYi9OcGdWYmhMN3FNZlA5SkROOHFPaGRTY3dCejcrclp2?=
 =?utf-8?B?SmhxV3VURExReGF4ck9YL0RpTkR0cFY0Ymp4L2cwcGhmVzkrM3BtZmM1Qngx?=
 =?utf-8?B?dmZuLys4c29qVzJBSW5taUhJQ0gzTVRUZmlLckVUL3lUVGYxNG84ZzFrWEVO?=
 =?utf-8?B?SjU0cDN4SndhOXBNZEs1ZFlHbndlZ3cvSnhUU21GaW9VSWxmL0dNTkVseGFa?=
 =?utf-8?B?d251ZG9nYlhWRXBIdGViUkMzWVlxYlpreGFSejVlT1RJT0ZUd3lvNXNXSXJD?=
 =?utf-8?B?TkhEZDY4NGJ3TXNOSUpwRTVsL2hMY3NFM1E4KzdIVUhyOVErbDdiK2laY1Z2?=
 =?utf-8?B?SnBwUWtLR0k4Zmp3YUFrUzZPR3Awc0YvZVUrcHlWc0xwS2xVNDc0Z0JqMDgz?=
 =?utf-8?B?Q29ycGgxWDk1ZkRTVHdRcU12bEwySFo1RVIwZWwzR2FOUzgxeDhyVTN3UU1G?=
 =?utf-8?B?ZFVyV2pSMVNEWHJNZ1FIRDJzYmxwWVduSFk3NnIvWjFYejYwcG5oc1JiOGQz?=
 =?utf-8?B?bm1ISytUWklMVVR5Y1ZVQ2FnWEE4Z3FxWjhVQi85MkRmYjVnb1JFbGI1U1B2?=
 =?utf-8?B?bVg3VHNLREJWUEZLNkM5ekdUNXY2MzdmUzR3cGRUWGRYdVFKdS9TZENhRzg0?=
 =?utf-8?B?RXdPVVZXTUc1WTlybm1QaEJnQ1Y5MDdyVkNRa2UrckZmNHdDaGY5RkJGN010?=
 =?utf-8?B?cSs4WGZtZENYWDdhM1lCWEVVU1BpTUZUTHF3RllZVS9MYkxLMDVwM29rQWxr?=
 =?utf-8?B?ZWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?aEkxc2p0cU9Oc3NKczZXdVpXWnp0Mm0vQjllVG93SGxFdGlPMStWMWZvS2tr?=
 =?utf-8?B?N0pFSklNYzZJbUV5eTFCRWIreG5rRzhreS9ML1A3bTZxQkdaTGJOdlVaRU4r?=
 =?utf-8?B?RUltbHpZNXM0dHVFRUxuKzkrbTFuZDRFSzZPbkMyZm5LQ0J3ZjVSRkVkU2F6?=
 =?utf-8?B?WWYrbTZobzAwbHB3Z0FwNUVjenhTWlJOWEZQa2Z5dHBOaUJFVVdZQU10UThI?=
 =?utf-8?B?cEV3RDFiOFFOZjlwVVJpV1c1QVpzQzd6WDFhSEFrdjNpWURqLzY4Ris0aDVu?=
 =?utf-8?B?ZGNPK0NIWUU0MUFrTkY4TXRQdUVzNDd4Ly9lUkk5UDQyWnhVSGJVRnRtS2s4?=
 =?utf-8?B?WGxtUFZlL0tTbkpVZHNwYWlTYVBPRnpidysySERLbW5aV252K0dOd0hsamFp?=
 =?utf-8?B?Z2ppLzBsY1YyajBHMjRzZmdQQXdwQnFGemI5aEJ0UkF2VjFseUZUN1JJdzFW?=
 =?utf-8?B?SWdFSzJNc2FMMDY1dlNqaEMyblloM2p3MEpWZzBVVWE0UHlUUXZJaEVmdjUz?=
 =?utf-8?B?VEI2dUdJTkdQWVlXMnhNMnFBRWVNNWsyQWUvYmFIVFhmRHpLRFZJVGhwa3VG?=
 =?utf-8?B?WGQvU2NURVFUVTNnY1RYa2V2VUU2S3JvYytaV3UrTWRtaExGRmlKMEpzZTBp?=
 =?utf-8?B?Y0paZ1dFUmJQVHNreFhGdjVaaEZyMUppL3FEaE41QTk4YU12dk1PNmVxTnVP?=
 =?utf-8?B?b3pDTkhQK2VWN2NwZmZBWG5ydVpKSjZxY0VDSXd6Ullta3VVMm4rTHVMcDgz?=
 =?utf-8?B?djZzSi8rVENzR1hYSGk0YkFmSDdHNDNiSngyL3dEaCtJMDFlem9ER255SlNJ?=
 =?utf-8?B?dnc5dG9mVURMTXVmZW9rdytJODl6bEY3RGc4TUNwblV0YmZuN1dGd3V5cUg0?=
 =?utf-8?B?M3VhejlOTzMvVlJ2aU90TTlwNWNlaUNRelQxQ0dmZStwLzVOWUZsTFkyZ01Z?=
 =?utf-8?B?MnR3WlZGYlQvQldtN3ZBdDRPMXBKQ2ZBbmFqSnhhNHVzS1QrMWZiNGVkcmhU?=
 =?utf-8?B?bVdkdU5xT3p4YkhXRVYxaDQrRkF0dk9JRklaeWo3MUpyUEtzTnFEQWZKQ1dy?=
 =?utf-8?B?Rk5WMHhuRzNDaUw5U3k5Umc1REhVeVNReFFBTm14WTkwcGJ4enNnYVRKMEpt?=
 =?utf-8?B?ZGEvbDNBdURRSVZ1WU9aYU1qcWZNM2R5czVRREpuaXNrenhhVjF5Qk1CVk96?=
 =?utf-8?B?Ri8vUmRGSCtEeDR2dXFja0tGRUdNZzQraTNCZ2NqVkd5Ris2Y3ZTNGJwMnhu?=
 =?utf-8?B?dG43dWRtZXdiNjZMbC80RzRrbU5PNkpHNXF3Y3g5UXFIdGRhaUlLSUhScXF3?=
 =?utf-8?Q?NtuGo7ioYQskcqnjQ8oFa7WJ65i8LndOfp?=
X-OriginatorOrg: toshiba.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR01MB6201.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68047161-0608-492a-de87-08dba8f27cd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2023 00:46:03.2790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KhPi2dffEPlYxgqv6WafxaCT4LngQ0FuW3PYN60oThl+yoBgowMAw4o8K72YYfzgrf7dp7ZlkqWA/OihLM//GiAyW6E4Iz87sOd65ENhMxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10028
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8gTGF1cmVudCwgSGFucywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDIxLCAyMDIzIDk6MzQgUE0NCj4gVG86IEhhbnMgVmVy
a3VpbCA8aHZlcmt1aWxAeHM0YWxsLm5sPg0KPiBDYzogaXNoaWthd2EgeXVqaSjnn7Plt50g5oKg
5Y+4IOKXi++8su+8pO+8o+KWoe+8oe+8qe+8tO+8o+KXi++8pe+8oemWiykNCj4gPHl1amkyLmlz
aGlrYXdhQHRvc2hpYmEuY28uanA+OyBTYWthcmkgQWlsdXMgPHNha2FyaS5haWx1c0Bpa2kuZmk+
OyBNYXVybw0KPiBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz47IFJvYiBIZXJy
aW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+Ow0KPiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0
b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBDb25vciBEb29sZXkNCj4gPGNvbm9yK2R0QGtl
cm5lbC5vcmc+OyBpd2FtYXRzdSBub2J1aGlybyjlsqnmnb4g5L+h5rSLIOKXi++8pO+8qe+8tO+8
o+KWoe+8pO+8qe+8tOKXiw0KPiDvvK/vvLPvvLQpIDxub2J1aGlybzEuaXdhbWF0c3VAdG9zaGli
YS5jby5qcD47IE1hcmsgQnJvd24NCj4gPGJyb29uaWVAa2VybmVsLm9yZz47IGxpbnV4LW1lZGlh
QHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDMvNV0gbWVkaWE6IGFkZCBWNEwyIHZlbmRv
ciBzcGVjaWZpYyBjb250cm9sIGhhbmRsZXJzDQo+IA0KPiBPbiBNb24sIEF1ZyAyMSwgMjAyMyBh
dCAwMjoyODoxMVBNICswMjAwLCBIYW5zIFZlcmt1aWwgd3JvdGU6DQo+ID4gT24gMTQvMDcvMjAy
MyAwMzo1MCwgWXVqaSBJc2hpa2F3YSB3cm90ZToNCj4gPiA+IEFkZCBzdXBwb3J0IHRvIEltYWdl
IFNpZ25hbCBQcm9jZXNzb3JzIG9mIFZpc2NvbnRpJ3MgVmlkZW8gSW5wdXQgSW50ZXJmYWNlLg0K
PiA+ID4gVGhpcyBwYXRjaCBhZGRzIHZlbmRvciBzcGVjaWZpYyBjb21wb3VuZCBjb250cm9scyB0
byBjb25maWd1cmUgdGhlDQo+ID4gPiBpbWFnZSBzaWduYWwgcHJvY2Vzc29yLg0KPiA+ID4NCj4g
PiA+IFNpZ25lZC1vZmYtYnk6IFl1amkgSXNoaWthd2EgPHl1amkyLmlzaGlrYXdhQHRvc2hpYmEu
Y28uanA+DQo+ID4gPiAtLS0NCj4gPiA+IENoYW5nZWxvZyB2MjoNCj4gPiA+IC0gUmVzZW5kIHYx
IGJlY2F1c2UgYSBwYXRjaCBleGNlZWRzIHNpemUgbGltaXQuDQo+ID4gPg0KPiA+ID4gQ2hhbmdl
bG9nIHYzOg0KPiA+ID4gLSBBZGFwdGVkIHRvIG1lZGlhIGNvbnRyb2wgZnJhbWV3b3JrDQo+ID4g
PiAtIEludHJvZHVjZWQgSVNQIHN1YmRldmljZSwgY2FwdHVyZSBkZXZpY2UNCj4gPiA+IC0gUmVt
b3ZlIHByaXZhdGUgSU9DVExzIGFuZCBhZGQgdmVuZG9yIHNwZWNpZmljIFY0TDIgY29udHJvbHMN
Cj4gPiA+IC0gQ2hhbmdlIGZ1bmN0aW9uIG5hbWUgYXZvaWRpbmcgY2FtZWxjYXNlIGFuZCB1cHBl
cmNhc2UgbGV0dGVycw0KPiA+ID4NCj4gPiA+IENoYW5nZWxvZyB2NDoNCj4gPiA+IC0gU3BsaXQg
cGF0Y2hlcyBiZWNhdXNlIHRoZSB2MyBwYXRjaCBleGNlZWRzIHNpemUgbGltaXQNCj4gPiA+IC0g
U3RvcCB1c2luZyBJRCBudW1iZXIgdG8gaWRlbnRpZnkgZHJpdmVyIGluc3RhbmNlOg0KPiA+ID4g
ICAtIFVzZSBkeW5hbWljYWxseSBhbGxvY2F0ZWQgc3RydWN0dXJlIHRvIGhvbGQgSFcgc3BlY2lm
aWMgY29udGV4dCwNCj4gPiA+ICAgICBpbnN0ZWFkIG9mIHN0YXRpYyBvbmUuDQo+ID4gPiAgIC0g
Q2FsbCBIVyBsYXllciBmdW5jdGlvbnMgd2l0aCB0aGUgY29udGV4dCBzdHJ1Y3R1cmUgaW5zdGVh
ZCBvZiBJRA0KPiA+ID4gbnVtYmVyDQo+ID4gPg0KPiA+ID4gQ2hhbmdlbG9nIHY1Og0KPiA+ID4g
LSBubyBjaGFuZ2UNCj4gPiA+DQo+ID4gPiBDaGFuZ2Vsb2cgdjY6DQo+ID4gPiAtIHJlbW92ZSB1
bnVzZWQgbWFjcm9zDQo+ID4gPiAtIHJlbW92ZWQgaHdkXyBhbmQgSFdEXyBwcmVmaXgNCj4gPiA+
IC0gdXBkYXRlIHNvdXJjZSBjb2RlIGRvY3VtZW50YXRpb24NCj4gPiA+IC0gU3VnZ2VzdGlvbiBm
cm9tIEhhbnMgVmVya3VpbA0KPiA+ID4gICAtIHBvaW50ZXIgdG8gdXNlcmxhbmQgbWVtb3J5IGlz
IHJlbW92ZWQgZnJvbSB1QVBJIGFyZ3VtZW50cw0KPiA+ID4gICAgIC0gc3R5bGUgb2Ygc3RydWN0
dXJlIGlzIG5vdyAibmVzdGVkIiBpbnN0ZWFkIG9mICJjaGFpbmVkIGJ5IHBvaW50ZXIiOw0KPiA+
ID4gICAtIHVzZSBkaXY2NF91NjQgZm9yIDY0Yml0IGRpdmlzaW9uDQo+ID4gPiAgIC0gdmVuZG9y
IHNwZWNpZmljIGNvbnRyb2xzIHN1cHBvcnQgVFJZX0VYVF9DVFJMUw0KPiA+ID4gICAtIGFkZCBS
RUFEX09OTFkgZmxhZyB0byBHRVRfQ0FMSUJSQVRJT05fU1RBVFVTIGNvbnRyb2wgYW5kDQo+IHNp
bWlsYXIgb25lcw0KPiA+ID4gICAtIGh1bWFuIGZyaWVuZHJ5IGNvbnRyb2wgbmFtZXMgZm9yIHZl
bmRvciBzcGVjaWZpYyBjb250cm9scw0KPiA+ID4gICAtIGFkZCBpbml0aWFsIHZhbHVlIHRvIGVh
Y2ggdmVuZG9yIHNwZWNpZmljIGNvbnRyb2wNCj4gPiA+ICAgLSBHRVRfTEFTVF9DQVBUVVJFX1NU
QVRVUyBjb250cm9sIGlzIHVwZGF0ZWQgYXN5bmNub3VzbHkgZnJvbQ0KPiB3b3JrcXVldWUNCj4g
PiA+ICAgLSByZW1vdmUgRVhFQ1VURV9PTl9XUklURSBmbGFnIG9mIHZlbmRvciBzcGVjaWZpYyBj
b250cm9sDQo+ID4gPiAgIC0gdUFQSTogcmV0dXJuIHZhbHVlIG9mIEdFVF9DQUxJQlJBVElPTl9T
VEFUVVMgZm9sbG93cyBjb21tb24NCj4gcnVsZXMgb2YgZXJyb3IgY29kZXMNCj4gPiA+ICAgLSBh
cHBsaWVkIHY0bDItY29tcGxpYW5jZQ0KPiA+ID4gLSBTdWdnZXN0aW9uIGZyb20gU2FrYXJpIEFp
bHVzDQo+ID4gPiAgIC0gdXNlIGRpdjY0X3U2NCBmb3IgNjRiaXQgZGl2aXNpb24NCj4gPiA+ICAg
LSB1cGRhdGUgY29weXJpZ2h0J3MgeWVhcg0KPiA+ID4gICAtIHJlbW92ZSByZWRhbmR1bnQgY2Fz
dA0KPiA+ID4gICAtIHVzZSBib29sIGluc3RlYWQgb2YgSFdEX1ZJSUZfRU5BQkxFL0RJU0FCTEUN
Cj4gPiA+ICAgLSBzaW1wbGlmeSBjb21wYXJpc29uIHRvIDANCj4gPiA+ICAgLSBzaW1wbGlmeSBz
dGF0ZW1lbnRzIHdpdGggdHJpZ3JhbSBvcGVyYXRvcg0KPiA+ID4gICAtIHJlbW92ZSByZWR1bmRh
bnQgbG9jYWwgdmFyaWFibGVzDQo+ID4gPiAgIC0gdXNlIGdlbmVyYWwgaW50ZWdlciB0eXBlcyBp
bnN0ZWFkIG9mIHUzMi9zMzINCj4gPiA+IC0gU3VnZ2VzdGlvbiBmcm9tIExhdXJlbnQgUGluY2hh
cnQNCj4gPiA+ICAgLSBtb3ZlZCBWSUlGIGRyaXZlciB0byBkcml2ZXIvcGxhdGZvcm0vdG9zaGli
YS92aXNjb250aQ0KPiA+ID4gICAtIGNoYW5nZSByZWdpc3RlciBhY2Nlc3M6IHN0cnVjdC1zdHls
ZSB0byBtYWNyby1zdHlsZQ0KPiA+ID4gICAtIHJlbW92ZSB1bnVzZWQgdHlwZSBkZWZpbml0aW9u
cw0KPiA+ID4gICAtIGRlZmluZSBlbnVtcyBpbnN0ZWFkIG9mIHN1Y2Nlc3NpdmUgbWFjcm8gY29u
c3RhbnRzDQo+ID4gPiAgIC0gcmVtb3ZlIHJlZHVuZGFudCBwYXJlbnRoZXNpcyBvZiBtYWNybyBj
b25zdGFudA0KPiA+ID4gICAtIGVtYmVkIHN0cnVjdCBod2RfcmVzIGludG8gc3RydWN0IHZpaWZf
ZGV2aWNlDQo+ID4gPiAgIC0gdXNlIHh4eF9kbWEgaW5zdGVhZCBvZiB4eHhfcGFkZHIgZm9yIHZh
cmlhYmxlIG5hbWVzIG9mIElPVkENCj4gPiA+ICAgLSBsaXRlcmFsIHZhbHVlOiBqdXN0IDAgaW5z
dGVhZCBvZiAweDANCj4gPiA+ICAgLSB1c2UgbGl0ZXJhbCAxIG9yIDAgaW5zdGVhZCBvZiBIV0Rf
VklJRl9FTkFCTEUsIERJU0FCTEUgZm9yIHJlZ2lzdGVyDQo+IGFjY2Vzcw0KPiA+ID4gICAtIHVz
ZSB0cnVlIG9yIGZhbHNlIGluc3RlYWQgb2YgSFdEX1ZJSUZfRU5BQkxFLCBESVNBQkxFIGZvciBm
dW5jdGlvbg0KPiBjYWxscw0KPiA+ID4gICAtIHVBUEk6IHJldHVybiB2YWx1ZSBvZiBHRVRfQ0FM
SUJSQVRJT05fU1RBVFVTIGZvbGxvd3MgY29tbW9uDQo+ID4gPiBydWxlcyBvZiBlcnJvciBjb2Rl
cw0KPiA+ID4NCj4gPiA+IENoYW5nZWxvZyB2NzoNCj4gPiA+IC0gcmVtb3ZlIHVudXNlZCB2YXJp
YWJsZXMNCj4gPiA+IC0gc3BsaXQgbG9uZyBzdGF0ZW1lbnRzIHdoaWNoIGhhdmUgbXVsdGlwbGUg
bG9naWNhbC1PUiBhbmQgdHJpZ3JhbQ0KPiA+ID4gb3BlcmF0b3JzDQo+ID4gPg0KPiA+ID4gIC4u
Li9tZWRpYS9wbGF0Zm9ybS90b3NoaWJhL3Zpc2NvbnRpL01ha2VmaWxlICB8ICAgIDIgKy0NCj4g
PiA+ICAuLi4vbWVkaWEvcGxhdGZvcm0vdG9zaGliYS92aXNjb250aS92aWlmLmMgICAgfCAgIDEw
ICstDQo+ID4gPiAgLi4uL3BsYXRmb3JtL3Rvc2hpYmEvdmlzY29udGkvdmlpZl9jb250cm9scy5j
IHwgMzQwNw0KPiArKysrKysrKysrKysrKysrKw0KPiA+ID4gIC4uLi9wbGF0Zm9ybS90b3NoaWJh
L3Zpc2NvbnRpL3ZpaWZfY29udHJvbHMuaCB8ICAgMTggKw0KPiA+ID4gIC4uLi9wbGF0Zm9ybS90
b3NoaWJhL3Zpc2NvbnRpL3ZpaWZfaXNwLmMgICAgICB8ICAgMTUgKy0NCj4gPiA+ICA1IGZpbGVz
IGNoYW5nZWQsIDM0MzUgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pICBjcmVhdGUgbW9k
ZQ0KPiA+ID4gMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdG9zaGliYS92aXNjb250aS92
aWlmX2NvbnRyb2xzLmMNCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiA+IGRyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vdG9zaGliYS92aXNjb250aS92aWlmX2NvbnRyb2xzLmgNCj4gPiA+DQo+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS90b3NoaWJhL3Zpc2NvbnRp
L01ha2VmaWxlDQo+ID4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdG9zaGliYS92aXNjb250
aS9NYWtlZmlsZQ0KPiA+ID4gaW5kZXggNWYyZjkxOTljLi5hMjhlNmZhODQgMTAwNjQ0DQo+ID4g
PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Rvc2hpYmEvdmlzY29udGkvTWFrZWZpbGUN
Cj4gPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdG9zaGliYS92aXNjb250aS9NYWtl
ZmlsZQ0KPiA+ID4gQEAgLTMsNiArMyw2IEBADQo+ID4gPiAgIyBNYWtlZmlsZSBmb3IgdGhlIFZp
c2NvbnRpIHZpZGVvIGlucHV0IGRldmljZSBkcml2ZXIgICMNCj4gPiA+DQo+ID4gPiAtdmlzY29u
dGktdmlpZi1vYmpzID0gdmlpZi5vIHZpaWZfY2FwdHVyZS5vIHZpaWZfaXNwLm8gdmlpZl9jc2ky
cngubw0KPiA+ID4gdmlpZl9jb21tb24ubw0KPiA+ID4gK3Zpc2NvbnRpLXZpaWYtb2JqcyA9IHZp
aWYubyB2aWlmX2NhcHR1cmUubyB2aWlmX2NvbnRyb2xzLm8NCj4gPiA+ICt2aWlmX2lzcC5vIHZp
aWZfY3NpMnJ4Lm8gdmlpZl9jb21tb24ubw0KPiA+ID4NCj4gPiA+ICBvYmotJChDT05GSUdfVklE
RU9fVklTQ09OVElfVklJRikgKz0gdmlzY29udGktdmlpZi5vIGRpZmYgLS1naXQNCj4gPiA+IGEv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS90b3NoaWJhL3Zpc2NvbnRpL3ZpaWYuYw0KPiA+ID4gYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL3Rvc2hpYmEvdmlzY29udGkvdmlpZi5jDQo+ID4gPiBpbmRl
eCBjMDdkYzI2MjYuLjFiM2Q2MWFiZiAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vdG9zaGliYS92aXNjb250aS92aWlmLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vdG9zaGliYS92aXNjb250aS92aWlmLmMNCj4gPiA+IEBAIC0xOCw2ICsxOCw3
IEBADQo+ID4gPg0KPiA+ID4gICNpbmNsdWRlICJ2aWlmLmgiDQo+ID4gPiAgI2luY2x1ZGUgInZp
aWZfY2FwdHVyZS5oIg0KPiA+ID4gKyNpbmNsdWRlICJ2aWlmX2NvbnRyb2xzLmgiDQo+ID4gPiAg
I2luY2x1ZGUgInZpaWZfY3NpMnJ4LmgiDQo+ID4gPiAgI2luY2x1ZGUgInZpaWZfY29tbW9uLmgi
DQo+ID4gPiAgI2luY2x1ZGUgInZpaWZfaXNwLmgiDQo+ID4gPiBAQCAtMTc4LDEyICsxNzksOSBA
QCBzdGF0aWMgc3RydWN0IHZpaWZfc3ViZGV2DQo+ID4gPiAqdG9fdmlpZl9zdWJkZXYoc3RydWN0
IHY0bDJfYXN5bmNfc3ViZGV2ICphc2QpDQo+ID4gPiAgLyogYmVmb3JlIGEgdXNlcmxhbmQgY2Fw
dHVyZSBhcHBsaWNhdGlvbiBpcyB0cmlnZXJlZCBieQ0KPiA+ID4gdmIyX2J1ZmZlcl9kb25lKCkg
Ki8gIHN0YXRpYyB2b2lkDQo+ID4gPiB2aXNjb250aV92aWlmX3d0aHJlYWRfbDFpbmZvKHN0cnVj
dCB3b3JrX3N0cnVjdCAqd29yaykgIHsNCj4gPiA+IC0JLyogY2FsbGVkIGZ1bmN0aW9uIGlzIGlt
cGxlbWVudGVkIGJ5IHRoZSBuZXh0IHBhdGNoICovDQo+ID4gPiAtLyoNCj4gPiA+IC0gKglzdHJ1
Y3QgdmlpZl9kZXZpY2UgKnZpaWZfZGV2ID0gY29udGFpbmVyX29mKHdvcmssIHN0cnVjdCB2aWlm
X2RldmljZSwNCj4gd29yayk7DQo+ID4gPiAtICoNCj4gPiA+IC0gKgl2aXNjb250aV92aWlmX3Nh
dmVfbDFfaW5mbyh2aWlmX2Rldik7DQo+ID4gPiAtICovDQo+ID4gPiArCXN0cnVjdCB2aWlmX2Rl
dmljZSAqdmlpZl9kZXYgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0DQo+ID4gPiArdmlpZl9k
ZXZpY2UsIHdvcmspOw0KPiA+ID4gKw0KPiA+ID4gKwl2aXNjb250aV92aWlmX3NhdmVfbDFfaW5m
byh2aWlmX2Rldik7DQo+ID4gPiAgfQ0KPiA+ID4NCj4gPiA+ICBzdGF0aWMgdm9pZCB2aWlmX3Zz
eW5jX2lycV9oYW5kbGVyX3dfaXNwKHN0cnVjdCB2aWlmX2RldmljZQ0KPiA+ID4gKnZpaWZfZGV2
KSBkaWZmIC0tZ2l0DQo+ID4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdG9zaGliYS92aXNj
b250aS92aWlmX2NvbnRyb2xzLmMNCj4gPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS90b3No
aWJhL3Zpc2NvbnRpL3ZpaWZfY29udHJvbHMuYw0KPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4gPiA+IGluZGV4IDAwMDAwMDAwMC4uM2NmMTBlMTVjDQo+ID4gPiAtLS0gL2Rldi9udWxsDQo+
ID4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Rvc2hpYmEvdmlzY29udGkvdmlpZl9j
b250cm9scy5jDQo+ID4gPiBAQCAtMCwwICsxLDM0MDcgQEANCj4gPg0KPiA+IDxzbmlwPg0KPiA+
DQo+ID4gPiArc3RhdGljIGludCB2aXNjb250aV92aWlmX2lzcF90cnlfY3RybChzdHJ1Y3QgdjRs
Ml9jdHJsICpjdHJsKSB7DQo+ID4gPiArCXN0cnVjdCB2aWlmX2RldmljZSAqdmlpZl9kZXYgPSBj
dHJsLT5wcml2Ow0KPiA+ID4gKw0KPiA+ID4gKwlzd2l0Y2ggKGN0cmwtPmlkKSB7DQo+ID4gPiAr
CWNhc2UgVjRMMl9DSURfVklTQ09OVElfVklJRl9NQUlOX1NFVF9SQVdQQUNLX01PREU6DQo+ID4g
PiArCQlyZXR1cm4gdmlpZl9tYWluX3NldF9yYXdwYWNrX21vZGVfdHJ5KHZpaWZfZGV2LA0KPiBj
dHJsLT5wX25ldy5wKTsNCj4gPiA+ICsJY2FzZSBWNEwyX0NJRF9WSVNDT05USV9WSUlGX0lTUF9M
MV9TRVRfSU5QVVRfTU9ERToNCj4gPiA+ICsJCXJldHVybiB2aWlmX2wxX3NldF9pbnB1dF9tb2Rl
X3RyeSh2aWlmX2RldiwgY3RybC0+cF9uZXcucCk7DQo+ID4gPiArCWNhc2UgVjRMMl9DSURfVklT
Q09OVElfVklJRl9JU1BfTDFfU0VUX1JHQl9UT19ZX0NPRUY6DQo+ID4gPiArCQlyZXR1cm4gdmlp
Zl9sMV9zZXRfcmdiX3RvX3lfY29lZl90cnkodmlpZl9kZXYsIGN0cmwtPnBfbmV3LnApOw0KPiA+
ID4gKwljYXNlIFY0TDJfQ0lEX1ZJU0NPTlRJX1ZJSUZfSVNQX0wxX1NFVF9BR19NT0RFOg0KPiA+
ID4gKwkJcmV0dXJuIHZpaWZfbDFfc2V0X2FnX21vZGVfdHJ5KHZpaWZfZGV2LCBjdHJsLT5wX25l
dy5wKTsNCj4gPiA+ICsJY2FzZSBWNEwyX0NJRF9WSVNDT05USV9WSUlGX0lTUF9MMV9TRVRfQUc6
DQo+ID4gPiArCQlyZXR1cm4gMDsgLy9ubyBuZWVkIHRvIGNoZWNrDQo+ID4gPiArCWNhc2UgVjRM
Ml9DSURfVklTQ09OVElfVklJRl9JU1BfTDFfU0VUX0hEUkU6DQo+ID4gPiArCQlyZXR1cm4gdmlp
Zl9sMV9zZXRfaGRyZV90cnkodmlpZl9kZXYsIGN0cmwtPnBfbmV3LnApOw0KPiA+ID4gKwljYXNl
IFY0TDJfQ0lEX1ZJU0NPTlRJX1ZJSUZfSVNQX0wxX1NFVF9JTUdfRVhUUkFDVElPTjoNCj4gPiA+
ICsJCXJldHVybiB2aWlmX2wxX3NldF9pbWdfZXh0cmFjdGlvbl90cnkodmlpZl9kZXYsIGN0cmwt
PnBfbmV3LnApOw0KPiA+ID4gKwljYXNlIFY0TDJfQ0lEX1ZJU0NPTlRJX1ZJSUZfSVNQX0wxX1NF
VF9EUEM6DQo+ID4gPiArCQlyZXR1cm4gdmlpZl9sMV9zZXRfZHBjX3RyeSh2aWlmX2RldiwgY3Ry
bC0+cF9uZXcucCk7DQo+ID4gPiArCWNhc2UNCj4gVjRMMl9DSURfVklTQ09OVElfVklJRl9JU1Bf
TDFfU0VUX1BSRVNFVF9XSElURV9CQUxBTkNFOg0KPiA+ID4gKwkJcmV0dXJuIHZpaWZfbDFfc2V0
X3ByZXNldF93aGl0ZV9iYWxhbmNlX3RyeSh2aWlmX2RldiwNCj4gY3RybC0+cF9uZXcucCk7DQo+
ID4gPiArCWNhc2UNCj4gVjRMMl9DSURfVklTQ09OVElfVklJRl9JU1BfTDFfU0VUX1JBV19DT0xP
Ul9OT0lTRV9SRURVQ1RJT046DQo+ID4gPiArCQlyZXR1cm4gdmlpZl9sMV9zZXRfcmF3X2NvbG9y
X25vaXNlX3JlZHVjdGlvbl90cnkodmlpZl9kZXYsDQo+IGN0cmwtPnBfbmV3LnApOw0KPiA+ID4g
KwljYXNlIFY0TDJfQ0lEX1ZJU0NPTlRJX1ZJSUZfSVNQX0wxX1NFVF9IRFJTOg0KPiA+ID4gKwkJ
cmV0dXJuIHZpaWZfbDFfc2V0X2hkcnNfdHJ5KHZpaWZfZGV2LCBjdHJsLT5wX25ldy5wKTsNCj4g
PiA+ICsJY2FzZQ0KPiBWNEwyX0NJRF9WSVNDT05USV9WSUlGX0lTUF9MMV9TRVRfQkxBQ0tfTEVW
RUxfQ09SUkVDVElPTjoNCj4gPiA+ICsJCXJldHVybiB2aWlmX2wxX3NldF9ibGFja19sZXZlbF9j
b3JyZWN0aW9uX3RyeSh2aWlmX2RldiwNCj4gY3RybC0+cF9uZXcucCk7DQo+ID4gPiArCWNhc2Ug
VjRMMl9DSURfVklTQ09OVElfVklJRl9JU1BfTDFfU0VUX0xTQzoNCj4gPiA+ICsJCXJldHVybiB2
aWlmX2wxX3NldF9sc2NfdHJ5KHZpaWZfZGV2LCBjdHJsLT5wX25ldy5wKTsNCj4gPiA+ICsJY2Fz
ZSBWNEwyX0NJRF9WSVNDT05USV9WSUlGX0lTUF9MMV9TRVRfTUFJTl9QUk9DRVNTOg0KPiA+ID4g
KwkJcmV0dXJuIHZpaWZfbDFfc2V0X21haW5fcHJvY2Vzc190cnkodmlpZl9kZXYsIGN0cmwtPnBf
bmV3LnApOw0KPiA+ID4gKwljYXNlIFY0TDJfQ0lEX1ZJU0NPTlRJX1ZJSUZfSVNQX0wxX1NFVF9B
V0I6DQo+ID4gPiArCQlyZXR1cm4gdmlpZl9sMV9zZXRfYXdiX3RyeSh2aWlmX2RldiwgY3RybC0+
cF9uZXcucCk7DQo+ID4gPiArCWNhc2UgVjRMMl9DSURfVklTQ09OVElfVklJRl9JU1BfTDFfTE9D
S19BV0JfR0FJTjoNCj4gPiA+ICsJCXJldHVybiAwOw0KPiA+ID4gKwljYXNlIFY0TDJfQ0lEX1ZJ
U0NPTlRJX1ZJSUZfSVNQX0wxX1NFVF9IRFJDOg0KPiA+ID4gKwkJcmV0dXJuIHZpaWZfbDFfc2V0
X2hkcmNfdHJ5KHZpaWZfZGV2LCBjdHJsLT5wX25ldy5wKTsNCj4gPiA+ICsJY2FzZSBWNEwyX0NJ
RF9WSVNDT05USV9WSUlGX0lTUF9MMV9TRVRfSERSQ19MVE06DQo+ID4gPiArCQlyZXR1cm4gdmlp
Zl9sMV9zZXRfaGRyY19sdG1fdHJ5KHZpaWZfZGV2LCBjdHJsLT5wX25ldy5wKTsNCj4gPiA+ICsJ
Y2FzZSBWNEwyX0NJRF9WSVNDT05USV9WSUlGX0lTUF9MMV9TRVRfR0FNTUE6DQo+ID4gPiArCQly
ZXR1cm4gdmlpZl9sMV9zZXRfZ2FtbWFfdHJ5KHZpaWZfZGV2LCBjdHJsLT5wX25ldy5wKTsNCj4g
PiA+ICsJY2FzZQ0KPiBWNEwyX0NJRF9WSVNDT05USV9WSUlGX0lTUF9MMV9TRVRfSU1HX1FVQUxJ
VFlfQURKVVNUTUVOVDoNCj4gPiA+ICsJCXJldHVybiB2aWlmX2wxX3NldF9pbWdfcXVhbGl0eV9h
ZGp1c3RtZW50X3RyeSh2aWlmX2RldiwNCj4gY3RybC0+cF9uZXcucCk7DQo+ID4gPiArCWNhc2UN
Cj4gVjRMMl9DSURfVklTQ09OVElfVklJRl9JU1BfTDFfU0VUX0FWR19MVU1fR0VORVJBVElPTjoN
Cj4gPiA+ICsJCXJldHVybiB2aWlmX2wxX3NldF9hdmdfbHVtX2dlbmVyYXRpb25fdHJ5KHZpaWZf
ZGV2LA0KPiBjdHJsLT5wX25ldy5wKTsNCj4gPiA+ICsJY2FzZSBWNEwyX0NJRF9WSVNDT05USV9W
SUlGX0lTUF9MMl9TRVRfVU5ESVNUOg0KPiA+ID4gKwkJcmV0dXJuIHZpaWZfbDJfc2V0X3VuZGlz
dF90cnkodmlpZl9kZXYsIGN0cmwtPnBfbmV3LnApOw0KPiA+ID4gKwljYXNlIFY0TDJfQ0lEX1ZJ
U0NPTlRJX1ZJSUZfSVNQX0wyX1NFVF9ST0k6DQo+ID4gPiArCQlyZXR1cm4gdmlpZl9sMl9zZXRf
cm9pX3RyeSh2aWlmX2RldiwgY3RybC0+cF9uZXcucCk7DQo+ID4gPiArCWNhc2UgVjRMMl9DSURf
VklTQ09OVElfVklJRl9JU1BfTDJfU0VUX0dBTU1BOg0KPiA+ID4gKwkJcmV0dXJuIHZpaWZfbDJf
c2V0X2dhbW1hX3RyeSh2aWlmX2RldiwgY3RybC0+cF9uZXcucCk7DQo+ID4gPiArCWNhc2UgVjRM
Ml9DSURfVklTQ09OVElfVklJRl9HRVRfTEFTVF9DQVBUVVJFX1NUQVRVUzoNCj4gPiA+ICsJCXJl
dHVybiAwOw0KPiA+ID4gKwlkZWZhdWx0Og0KPiA+ID4gKwkJcHJfaW5mbygidW5rbm93bl9jdHJs
OnQ6IGlkPSUwOFggdmFsPSVkIiwgY3RybC0+aWQsIGN0cmwtPnZhbCk7DQo+ID4gPiArCQlicmVh
azsNCj4gPiA+ICsJfQ0KPiA+ID4gKwlyZXR1cm4gLUVJTlZBTDsNCj4gPiA+ICt9DQo+ID4gPiAr
DQo+ID4gPiArc3RhdGljIGludCB2aXNjb250aV92aWlmX2lzcF9zZXRfY3RybChzdHJ1Y3QgdjRs
Ml9jdHJsICpjdHJsKSB7DQo+ID4gPiArCXN0cnVjdCB2aWlmX2RldmljZSAqdmlpZl9kZXYgPSBj
dHJsLT5wcml2Ow0KPiA+ID4gKwlpbnQgcmV0Ow0KPiA+ID4gKw0KPiA+ID4gKwlwcl9pbmZvKCJp
c3Bfc2V0X2N0cmw6ICVzIiwgY3RybC0+bmFtZSk7DQo+ID4NCj4gPiBEb24ndCB1c2UgcHJfaW5m
byBmb3Igd2hhdCBpcyBqdXN0IGEgZGVidWcgbWVzc2FnZSEgRWl0aGVyIGRyb3AgaXQsIG9yDQo+
ID4gcmVwbGFjZSBpdCB3aXRoIGRldl9kYmcuDQo+IA0KPiBJbiBkcml2ZXJzLCBhbG1vc3QgYWxs
IG9jY3VyZW5jZXMgb2YgcHJfKigpIHNob3VsZCBiZSByZXBsYWNlZCBieSBkZXZfKigpLiBJdCdz
IHZlcnkNCj4gcmFyZSB0aGF0IHByXyooKSB3b3VsZCBiZSB0aGUgcmlnaHQgQVBJLg0KPiANCj4g
SW4gdGhpcyBzcGVjaWZpYyBjYXNlLCBJJ2QganVzdCBkcm9wIGl0Lg0KPiANCg0KSSdsbCByZW1v
dmUgcHJfKigpIGNhbGxzLg0KDQo+ID4gPiArCWlmIChwbV9ydW50aW1lX3N0YXR1c19zdXNwZW5k
ZWQodmlpZl9kZXYtPmRldikpIHsNCj4gPiA+ICsJCXByX2luZm8oIndhcm5pbmc6IHZpc2NvbnRp
IHZpaWYgSFcgaXMgbm90IHBvd2VyZWQiKTsNCj4gPg0KPiA+IEFuZCBoZXJlIHByX2luZm8gaXMg
dXNlZCBmb3IgYSB3YXJuaW5nLCBzbyBzaG91bGRuJ3QgdGhpcyBiZSBkZXZfd2Fybj8NCj4gDQo+
IEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBhIG5lZWQgdG8gd2FybiBhYm91dCB0aGlzLCBpdCdzIGEg
bm9ybWFsIHNpdHVhdGlvbi4NCj4gDQo+IFRoZSByaWdodCBydW50aW1lIFBNIEFQSSBoZXJlIGlz
IHBtX3J1bnRpbWVfZ2V0X2lmX2luX3VzZSgpIGJ5IHRoZSB3YXksIG5vdA0KPiBwbV9ydW50aW1l
X3N0YXR1c19zdXNwZW5kZWQoKS4gRG9uJ3QgZm9yZ2V0IHRvIGNhbGwgcG1fcnVudGltZV9wdXQo
KSBhdCB0aGUNCj4gZW5kIG9mIHRoZSBmdW5jdGlvbi4NCj4gDQoNCkknbGwgcmVtb3ZlIHRoaXMg
cHJfaW5mbygpIGNhbGwuDQpBbHNvLCBJJ2xsIHVzZSBwbV9ydW50aW1lX2dldF9pZl9pbl91c2Uo
KSBpbnN0ZWFkIG9mIHBtX3J1bnRpbWVfc3RhdHVzX3N1c3BlbmRlZCgpLg0KDQo+ID4gSSBzZWUg
cHJfaW5mbyBiZWluZyB1c2VkIGluIGEgbG90IG9mIHBsYWNlcyB3aGVyZSBpdCBkb2Vzbid0IGJl
bG9uZw0KPiA+IGFuZCB3b3VsZCBqdXN0IHNwYW0gdGhlIGtlcm5lbCBsb2cuDQo+ID4NCj4gPiBT
b21ldGhpbmcgdG8gZ28gdGhyb3VnaCBmb3IgdjguDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiAN
Cj4gTGF1cmVudCBQaW5jaGFydA0KDQpSZWdhcmRzLA0KWXVqaQ0K

