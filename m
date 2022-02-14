Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 212DE4B52BD
	for <lists+linux-media@lfdr.de>; Mon, 14 Feb 2022 15:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354881AbiBNOGU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Feb 2022 09:06:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354880AbiBNOGR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Feb 2022 09:06:17 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 881894B41C
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 06:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1644847565; x=1676383565;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=QtOzmdVVGLCcioPYQjiHE1GZS0IqoMT8Q9nnpFkzE2E=;
  b=gIuL685xdfHYPzHX63yRItMEmSfNOBepqyBi1oK6j9jl1wvoofz35uRy
   602sx1o83gCiqQWSSf11rGHCO+raQ+nyDjq69MUelVAebW7pQ7nvbB7wN
   Fev+jrhd3LPs/aXlJqW8RgvKASCyi/cZnMRy4y1c83GMLq75ywyOgElrw
   nTMj+N2rOfeAWPgNm6mQSZh48Q0nNx8a8EFcMO6oDOntZTn5qhAPRTTqs
   yT5Sx4fZw+XK1+/HpLFgVYtzKDxNfpU6Lqw8S4lJY8/54+SYeQXZmHAL9
   v+8YhSldXCcVG6dbGzOwqH0tTE2PzwFj171RfO6IzSGD9ymcwvKpTkYw4
   Q==;
IronPort-SDR: 2p/lbfeR3PMWjIJUepyYaDyYx9NyQ9/bu8RuwBFoZBRr/8QFkWDgsSkuVJpdqjStdpiZRqVY5M
 sgkCfS0IT6bGFCz4EPlK5bOet2pXPXvMAPrS++wg9a5m3+LMZCNB8uER/oWrRdg6Twlz0QhP8a
 6mBfAVmgbkrtvNdsjVcGyK67WzIp0nugj7MEXvpDelUa/ehHL1F840B6t8R/v9tnT1SFyuydWn
 TPDykyWI2k/pFrZcyn2OMpWelThCdXTI4y59PggzHNYMK5+EiwbL5qvKVEiG7KIftAHjMUZYis
 xrUimB1PABH8u+l6WGSVqfuS
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="152983825"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Feb 2022 07:06:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 14 Feb 2022 07:06:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 14 Feb 2022 07:06:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+Ef3amgxT+5E6e88BJ5OOwp6RYyCy1ybAwCkqU6S4I7Yp0+PMO33F2h6MK+ufeHxDIpz+wv4yXoCTy6TyfTeJNRYPIF00mcfW3fr95CJutXzrn4hWnZVYrzEGzvkLSCpd+dtXEAddHskVacGRaVh69fSnE7aGGWK3fn+E0cJ3l+EF8VkSGVGfY6wrmfAA39zgMViccVXeJwxH/IuBlL0UgxD+CyDfVxo3PB40BV8+ePVwtGRFO2u/HFIPziAHKM04D4VYPJG4J1lFLPJCB542ZNNJQGDyZhG9a6Gxg6AH8REUAvvPqc1UCoquX1cXlSx9xvz1Nr5an5rXaU7cBJGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtOzmdVVGLCcioPYQjiHE1GZS0IqoMT8Q9nnpFkzE2E=;
 b=gOgYsP1LWVzE54dprL+bPXnEa1qaXtR5ySE5qev6gTIBH/hzCF+hq8tpX7e/FRqA+mJZfWGMjpMPKb8vVBi/a2q0VQmOgFFgvsVwIaD0aqliBPeFj1O8NqA264FlvEifBo2nP5vvHQbphBa7ITdcXJJswl+0uUKv4+6t2e4gSmH4GrwjJF+xgdlMEBJHJAk7I31GeP6yRMq9dOU66B7ZvnVrksiFP45PWqjowIm3V3rmMLR8LwQZmV/zEd2+cridsxfsrJtJkjk/0d52JeI+4OVB7IWCUmMinUNdzQeTEIZ9rYrPfPce9zSqhTcVUlsIavsbG9XSy5jplifJrsLHGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtOzmdVVGLCcioPYQjiHE1GZS0IqoMT8Q9nnpFkzE2E=;
 b=GqDX/P2aXmlFkzZm0MOmEl2Dv1QUIYro5BrUzV7nO9zJ+xIBb6kkZQ9wa2N4ToNvj9vyOxnOVURfGJUMORP3tW7orYEw5B+Lt+VKVOfBUMJnhdUPqYrvi45i0YQddCS1zeqR+yfX5hQ5VsRZaDvWAsC73ribaqWLLgmRa1WCK5s=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by BN8PR11MB3539.namprd11.prod.outlook.com (2603:10b6:408:8b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 14:06:02 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc%9]) with mapi id 15.20.4975.019; Mon, 14 Feb 2022
 14:06:02 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <jacopo@jmondi.org>
CC:     <slongerbeam@gmail.com>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <hverkuil-cisco@xs4all.nl>,
        <mirela.rabulea@nxp.com>, <xavier.roumegue@oss.nxp.com>,
        <tomi.valkeinen@ideasonboard.com>, <hugues.fruchet@st.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <aford173@gmail.com>,
        <festevam@gmail.com>, <jbrunet@baylibre.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 00/23] media: ov5640: Rework the clock tree programming
 for MIPI
Thread-Topic: [PATCH v2 00/23] media: ov5640: Rework the clock tree
 programming for MIPI
Thread-Index: AQHYHm3wW57rjknMlU+S0OxseioqJKyOIe6AgAAVOACABOP8gA==
Date:   Mon, 14 Feb 2022 14:06:02 +0000
Message-ID: <23ac37a4-a979-2dbf-32ae-012d4ff45806@microchip.com>
References: <20220210110458.152494-1-jacopo@jmondi.org>
 <a5a75d0b-7f40-39d0-a8ec-4e143c5f3b1c@microchip.com>
 <20220211112500.7p3fi2xhwutap6ak@uno.localdomain>
In-Reply-To: <20220211112500.7p3fi2xhwutap6ak@uno.localdomain>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec76526c-e29b-41e3-d6bf-08d9efc32275
x-ms-traffictypediagnostic: BN8PR11MB3539:EE_
x-microsoft-antispam-prvs: <BN8PR11MB35397EA2044AC3A9B5D7237AE8339@BN8PR11MB3539.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nb9KOGffk9R2BwIdG+DG5w+l7fUTnOJXestmBB5G8YOVx/zM17Hj+4HeP9pdgmRaZJYiO1+0XzfWle2bl5JWVzRGtoXr3hpIW6rOfeINM9uSi5KwPwg3YT9ZGBnz/6VHt0qDDagUMUmCJteHwUQOLpfNKkUOUcC045euwUOBhZQpk/jNUp3bsT87Jyx6TdZDC3vCS/NHlMx22whdzQtZYKXYypOA0ti84THDwVWwH5MGcEBmE2wf8W2fHLqrO2UriYqx0YT5j+XWR+8bIsTjMLLfT/x44F+FOSmsxWaLDsbq7TBZEB6TMtptKuw4GHTDC7xW94pLDlyv8IGW8HG90ntuWWASJKwQJ70md46fncibHCcHoW/YTI6ed+06LEjc8P7UJyD4xZRN7EVjTxWzTiDBIQyMrggdwr4J1KaeCfUCWI5ot0jLDwwE3LgvmudgBmw9OSNSkFznEeXcATkOkOCsulYq5W+ohl+yyHUXG+KQv52iAyDcEKOtyt294LJjGVdI8dWrGvJv91vH/vMriL8q4aNwp0gvQxpzXMk34JiKiae0zmLLPqHmfhXcmbxcuUTp/jq3E5j8mSmf6fAPLemMAgsc2Plpx4MCwWFkjUbXAwF7lnCurQU5V9Gtn6To4wocPbyhdxREd7XpgYP6Bt9Jp/NAdtrCxONzmlf661antFyN+/R+Op4b+cetXyN5dnjgdrWTt7ZR5RMDs2cy2sLAzVODGfNqO6QMG+vIwGNksFF2WRezzdpJJWr20n8fa5VQbCoN1JniWsYmk4H44/EydhaRrmWTRYo0oBJCnERdgAV0DsY+as6KLpGo+NnLDKW0yQnbKvLd3287i6qx9ZlvrJUneEvFPl1qBpzX308=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5384.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(122000001)(86362001)(38070700005)(31696002)(66946007)(66556008)(66476007)(66446008)(8676002)(64756008)(76116006)(4326008)(54906003)(91956017)(316002)(6916009)(7416002)(8936002)(5660300002)(2906002)(186003)(2616005)(26005)(83380400001)(6486002)(508600001)(966005)(53546011)(6512007)(6506007)(71200400001)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjI1L2gyMTh6WDRQbFRPWk9hdXVZZ05xaUt0M1ZXTmdQbHJQcktQakZZVGZ1?=
 =?utf-8?B?dHlWQUFwRGtGZm9LOHYrMG9ZZW0xelQ3SE5PdDJmcHNDYWNtK2l0OVlVV0Fm?=
 =?utf-8?B?VTBuTDVMbHNVZGZ2dERHblpsMkFYS2x2TnlaMXFSVFJoVzRJbGJHZENFZVFR?=
 =?utf-8?B?ZzRSYXJ1NHo1N1E5emFMTmU3VEx6dmJ4bnZwVGhWRVFRMUR6NVV2TzVhWWNs?=
 =?utf-8?B?aXpPbzhLVlZua0J4Ym5YVFg0a0Q0Q3dmQ1BkYzN6WHk3bkliR2pSczlBQ1RJ?=
 =?utf-8?B?bzNQN1BpNEJOSFlCNW5pTXMyWmxFcmVScG05ejZuWXV5SFFjMVF0b1FXdFJs?=
 =?utf-8?B?YityTEJWMFpuWllTdTNHQXBtbktjMjljWW5RcURjTCs0S29xN0RERFJLRzJK?=
 =?utf-8?B?TzllQmNBRE84RjZuanFndE9VN2twaVdvdWVSeVVXYVFnRXhLd3gvajJwdUVL?=
 =?utf-8?B?eDZySXFvSTY5ZlEyclZWcEVKSUVsNlN6KzhYKzZydlVkTlNTNW0rbkRSNFA3?=
 =?utf-8?B?MlVSUVM1UjAwS29xNENZZlAwZ1ZZMnlidGJWQXdtZlVsaDQwSjR3YU8wRFg2?=
 =?utf-8?B?NXhJV1p4YjY3TENmUHl6Wnc0akZoaGRhVTJ1ZVdJRW1qZ3lLMUxzYUxDa2lE?=
 =?utf-8?B?NVNtTGdWYUUxdUE1Y000NDg3ZElxRUdPbHRScWw2Z0xXcTRzcXlHQWo0TjBw?=
 =?utf-8?B?ZFBHZkpva1V1bm1raHQzQU9kcU1zRXBXQTNTV0ZaS2RRazRDc3lPd0VMZmJR?=
 =?utf-8?B?QWhjbDI4dXRJbU5idjU3aURQWHdSVllyNVRzeUwxaU1HRlRNYTBPY0xvd3dD?=
 =?utf-8?B?ZDV4RDI5NDZZaGZiU0xLanZKRi9zRGFJVFAycGxkcDkyVDlRd3NGTzBtZFpN?=
 =?utf-8?B?WUI4M1VxODE5RTVnTDNlajErcXNKVjZkcG5jQ0wzeXAvdlVZVWU5K1pvT0Jy?=
 =?utf-8?B?MWtwcnpQQ0JZTGxvRVJIN2lQTjF4eEU0ZlBsNk80KzVXck1rOTZGMElXRE1C?=
 =?utf-8?B?c3pieThxR1kyVkw4a3BkZ2o3VjJYU00vTzBkbVhpWEhmZ0hDZ1pmL0lBbzMw?=
 =?utf-8?B?bzU5UmFMOFQ3QmUwT0JpeWtoR3dXWVROd2poYVNsME1EeFREUnVHY2V5NGZV?=
 =?utf-8?B?bUY4RHllcndRZlFrVHlwOUNqQlU4S1I4VFRjZ2xSTHNqK2w4NG1Lbk9Pb0ZE?=
 =?utf-8?B?ZTZrbEQ1dnlZb09MdDNFU3lidFE5TEpEY0kxNVRSNXhyaFRxaGx5R2dvS1kx?=
 =?utf-8?B?UVNsNEp1QzhNdE5FcVp0R1V3MlNQajVFVlR6K0RzQ1RydXlwWTRBdU82Vzh4?=
 =?utf-8?B?OExuQTNhSXRjTFBwbEx6U0RKblBscjAwcGNuelN2R0hyMmkwTDhPMHNJdmRS?=
 =?utf-8?B?cGxyTnNPTVl0bDRrTmYyKzdiK2lYWEVuTlptSTJCNG9WQzFzbWxoeWR2Y05t?=
 =?utf-8?B?Z3paOFp0ZlpRZDE1eGx4bGZ2RU1oK0ZaNDJCN2hzT2ZhbUVlbWJlclJxSlcz?=
 =?utf-8?B?dEF5L3IwTWVtanE2dDRnck1YZDd2VDJkWXo2NjI3QmxRbi9HYmhDNkhKdGF3?=
 =?utf-8?B?enZNMjFGakdDZVRIZDVYTmJkR1dnVi9NdkhvU0tsbEpCckthWDBRMFFDUHox?=
 =?utf-8?B?ak1HY0xmUXNZVm1xdzFUaEsyeWUrOSs2SGY0U0tpSzM1eEVLOTNhNzdTVnYw?=
 =?utf-8?B?bysvZHFWVmRVd1NjenVBUXlGSTNqSW15WlFmTUN4NHAxZHhNYnNwVHJ0WER0?=
 =?utf-8?B?VVVxVGdHS0dDTW5VT3RQTSsxcWViQU9hQWVUUHNxVHZ0MGdrV1F3T2Z6Z1Rv?=
 =?utf-8?B?MTQvU2pHV1VTWlJ4RHNuSGw4czVScXBzRGZmbnlmR3A2VXNOSlBnRitTVlVP?=
 =?utf-8?B?TklhR2FKWWlKRFBWRHBrczVSV0xhSm1zMmhTZWtHSjlXS1pHaDB2ZHkwTUJ2?=
 =?utf-8?B?ak1EQm1yak4xOHl5Y0UvQUphd1dQSW9xZVBtbXJ6SFE2L0lRS3RSdEFDTnli?=
 =?utf-8?B?dFB2TDVGZmRNaHdHK0hWZGRkMzVEcUM5dW1EYTBOTVY0Mk9DbzdjSnRrdlcw?=
 =?utf-8?B?TGNYQkZubk5xeU1VN1hiRUFjSy9JdGFMM3BGYTZxdmJBZW5Td1NSNXcwdm5P?=
 =?utf-8?B?clZ1S0dKN3FPeERYVGFKTFFGR3JKV2M4SmhjbEZaVC9IbU51c1F4SGdreC8v?=
 =?utf-8?B?OUh5VGVmS1RnTWxkS01OSlV3TTZWTlk1UnVvRk95K2hkLzUrQ2FPTGFuVXdu?=
 =?utf-8?B?aVp1Yko1cVUrZEtQRmNqdFNueTJRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <771F73EA3BEE20438A717AD397411295@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec76526c-e29b-41e3-d6bf-08d9efc32275
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 14:06:02.4820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GD4Yp0nviGxrJ3tvK9gcCMIRedC9/q2TA/n5uuG6t3idotSniA2YNHBmrvQuiQbGkErLVS1H+lYw8/oxvDy+wmKmwN1chV0azEf8IPZEcn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3539
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMi8xMS8yMiAxOjI1IFBNLCBKYWNvcG8gTW9uZGkgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gSGkgRXVnZW4NCj4gDQo+ICAgICAgICAgIHRoYW5r
cyB2ZXJ5IG11Y2ggZm9yIHRlc3RpbmcNCj4gDQo+IE9uIEZyaSwgRmViIDExLCAyMDIyIGF0IDEw
OjA5OjA0QU0gKzAwMDAsIEV1Z2VuLkhyaXN0ZXZAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IE9u
IDIvMTAvMjIgMTowNCBQTSwgSmFjb3BvIE1vbmRpIHdyb3RlOg0KPj4NCj4+IEhlbGxvIEphY29w
bywNCj4+DQo+Pj4gdjE6DQo+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsubGludXh0di5vcmcvcHJvamVj
dC9saW51eC1tZWRpYS9saXN0Lz9zZXJpZXM9NzI0OQ0KPj4+DQo+Pj4gQSBicmFuY2ggZm9yIHRl
c3RpbmcgYmFzZWQgb24gdGhlIG1vc3QgcmVjZW50IG1lZGlhLW1hc3RlciBpcyBhdmFpbGFibGUg
YXQNCj4+PiBodHRwczovL2dpdC5zci5odC9+am1vbmRpXy9saW51eCAjam1vbmRpL21lZGlhLW1h
c3Rlci9vdjU2NDAtdjINCj4+Pg0KPj4+IElmIGFueW9uZSB3aXRoIGEgRFZQIHNldHVwIGNvdWxk
IHZlcmlmeSBJIGhhdmUgbm90IGJyb2tlbiB0aGVpciB1c2UgY2FzZQ0KPj4+IEkgd291bGQgdmVy
eSBtdWNoIGFwcHJlY2lhdGUgdGhhdCA6KQ0KPj4NCj4+IEkgc3RhcnRlZCB0ZXN0aW5nIHRoaXMg
b24gbXkgYmVuY2guDQo+PiBTbyBmYXIgdGhpbmdzIGxvb2sgZ29vZC4NCj4+DQo+IA0KPiBcby8N
Cj4gDQo+PiBUbyBiZSBhYmxlIHRvIHRlc3QgdGhpcywgSSBoYXZlIHRvIHJldmVydCB0aGlzIHBh
dGNoIDoNCj4+ICJtZWRpYTogaTJjOiBvdjU2NDA6IFJlbWFpbiBpbiBwb3dlciBkb3duIGZvciBE
VlAgbW9kZSB1bmxlc3Mgc3RyZWFtaW5nIg0KPj4NCj4+IE90aGVyd2lzZSB0aGUgc2Vuc29yIHdp
bGwgbm90IHBvd2VyIHVwIHdoZW4gc3RhcnRpbmcgc3RyZWFtaW5nLg0KPj4NCj4+DQo+PiBJIGhh
dmUgdGVzdGVkIHNldmVyYWwgZm9ybWF0cywgYXMgeW91IHdvcmtlZCBtb3JlIG9uIHRoaXMgc2Vu
c29yLCBjb3VsZA0KPj4geW91IHRlbGwgbWUsIGRvZXMgZm9ybWF0IFlVWVZfMng4IHdvcmsgaW4g
cGFyYWxsZWwgbW9kZSBhdCAxOTIweDEwODAgb3INCj4+IDEwMjR4NzY4ID8NCj4gDQo+IEkgbmV2
ZXIgdGVzdGVkIHRoZSBzZW5zb3IgZHJpdmVyIHdpdGggYSBwYXJhbGxlbCBzZXR1cCBJJ20gYWZy
YWlkLg0KPiBUaGUgaWRlYSBiZWhpbmQgdGhpcyBzZXJpZXMgaXMgdGhhdCBEVlAgc2hvdWxkbid0
IGJlIGFmZmVjdGVkIGFuZA0KPiBjb250aW51ZSB3b3JraW5nIGxpa2UgaXQgZGlkLg0KDQpIaSBK
YWNvcG8sDQoNCkkgd2FzIGhvcGluZyB0aGF0IHlvdSBoYWQgbW9yZSBpbmZvcm1hdGlvbiBhYm91
dCB0aGUgZHJpdmVyIHRoYW4gbXlzZWxmLg0KSSBjYW4gdGVsbCB0aGF0IHRoZSBwYXJhbGxlbCBt
b2RlIGlzIG5vdCBhZmZlY3RlZCBieSB5b3VyIHNlcmllcyBmcm9tIA0Kd2hhdCBJJ3ZlIHNlZW4g
c28gZmFyLg0KDQo+IA0KPj4gSSBtYW5hZ2VkIHRvIGdldCBpdCB3b3JraW5nIGZpbmUgYXQgNjQw
eDQ4MCAuDQo+Pg0KPj4gVGhlIHNlbnNvciBsb29rcyB0byByZXBvcnQgdmFsaWQgZnJhbWVzaXpl
cyBmb3IgdGhpcyBtYnVzIGNvZGUgOg0KPj4NCj4+ICMgdjRsMi1jdGwgLWQgL2Rldi92NGwtc3Vi
ZGV2MSAtLWxpc3Qtc3ViZGV2LW1idXMtY29kZXMNCj4+IFxpb2N0bDogVklESU9DX1NVQkRFVl9F
TlVNX01CVVNfQ09ERSAocGFkPTApDQo+PiAgICAgICAgICAgMHg0MDAxOiBNRURJQV9CVVNfRk1U
X0pQRUdfMVg4DQo+PiAgICAgICAgICAgMHgyMDA2OiBNRURJQV9CVVNfRk1UX1VZVlk4XzJYOA0K
Pj4gICAgICAgICAgIDB4MjAwZjogTUVESUFfQlVTX0ZNVF9VWVZZOF8xWDE2DQo+PiAgICAgICAg
ICAgMHgyMDA4OiBNRURJQV9CVVNfRk1UX1lVWVY4XzJYOA0KPj4gICAgICAgICAgIDB4MjAxMTog
TUVESUFfQlVTX0ZNVF9ZVVlWOF8xWDE2DQo+PiAgICAgICAgICAgMHgxMDA4OiBNRURJQV9CVVNf
Rk1UX1JHQjU2NV8yWDhfTEUNCj4+ICAgICAgICAgICAweDEwMDc6IE1FRElBX0JVU19GTVRfUkdC
NTY1XzJYOF9CRQ0KPj4gICAgICAgICAgIDB4MTAxNzogTUVESUFfQlVTX0ZNVF9SR0I1NjVfMVgx
Ng0KPj4gICAgICAgICAgIDB4MTAwYTogTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVgyNA0KPj4gICAg
ICAgICAgIDB4MTAxMzogTUVESUFfQlVTX0ZNVF9CR1I4ODhfMVgyNA0KPj4gICAgICAgICAgIDB4
MzAwMTogTUVESUFfQlVTX0ZNVF9TQkdHUjhfMVg4DQo+PiAgICAgICAgICAgMHgzMDEzOiBNRURJ
QV9CVVNfRk1UX1NHQlJHOF8xWDgNCj4+ICAgICAgICAgICAweDMwMDI6IE1FRElBX0JVU19GTVRf
U0dSQkc4XzFYOA0KPj4gICAgICAgICAgIDB4MzAxNDogTUVESUFfQlVTX0ZNVF9TUkdHQjhfMVg4
DQo+PiAjIHY0bDItY3RsIC1kIC9kZXYvdjRsLXN1YmRldjEgLS1saXN0LXN1YmRldi1mcmFtZXNp
emVzIHBhZD0wLGNvZGU9MHgyMDA4DQo+PiBpb2N0bDogVklESU9DX1NVQkRFVl9FTlVNX0ZSQU1F
X1NJWkUgKHBhZD0wKQ0KPj4gICAgICAgICAgIFNpemUgUmFuZ2U6IDE2MHgxMjAgLSAxNjB4MTIw
DQo+PiAgICAgICAgICAgU2l6ZSBSYW5nZTogMTc2eDE0NCAtIDE3NngxNDQNCj4+ICAgICAgICAg
ICBTaXplIFJhbmdlOiAzMjB4MjQwIC0gMzIweDI0MA0KPj4gICAgICAgICAgIFNpemUgUmFuZ2U6
IDY0MHg0ODAgLSA2NDB4NDgwDQo+PiAgICAgICAgICAgU2l6ZSBSYW5nZTogNzIweDQ4MCAtIDcy
MHg0ODANCj4+ICAgICAgICAgICBTaXplIFJhbmdlOiA3MjB4NTc2IC0gNzIweDU3Ng0KPj4gICAg
ICAgICAgIFNpemUgUmFuZ2U6IDEwMjR4NzY4IC0gMTAyNHg3NjgNCj4+ICAgICAgICAgICBTaXpl
IFJhbmdlOiAxMjgweDcyMCAtIDEyODB4NzIwDQo+PiAgICAgICAgICAgU2l6ZSBSYW5nZTogMTky
MHgxMDgwIC0gMTkyMHgxMDgwDQo+PiAgICAgICAgICAgU2l6ZSBSYW5nZTogMjU5MngxOTQ0IC0g
MjU5MngxOTQ0DQo+PiAjDQo+Pg0KPj4gYnV0IHRoZSBJU0MgZG9lcyBub3QgcmVjZWl2ZSBhbnkg
ZnJhbWVzIGF0IDEwMjR4NzY4IGFuZCAxOTIweDEwODAuDQo+IA0KPiBBcmUgMTA4MHAgYW5kIDEw
MjR4NzY4IHdvcmtpbmcgd2l0aG91dCB0aGlzIHNlcmllcyBhcHBsaWVkIG9uIHlvdXINCj4gc2V0
dXAgPw0KDQpJIHJlbWVtYmVyIHRoZXkgd2VyZW4ndCB3b3JraW5nIGJlZm9yZSBlaXRoZXIuDQoN
CkkgZG9uJ3Qga25vdyBleGFjdGx5IHRvIHdoaWNoIHBhdGNoZXMgdG8gYWRkIG15IFRlc3RlZC1i
eSAsIGFzIEkgaGF2ZSANCm5vdCB0ZXN0ZWQgdGhlIGV4cGxpY2l0IHBhdGNoIGJlaGF2aW9yIGZv
ciBlYWNoIHBhdGNoIChlLmcuIHdoZXJlIHlvdSANCmFkZCBIQkxBTksgY29udHJvbCwgSSBoYXZl
IG5vdCB0ZXN0ZWQgdGhhdCApLg0KDQpJcyB0aGVyZSBzb21ldGhpbmcgcGFydGljdWxhciB5b3Ug
d291bGQgbGlrZSBtZSB0byB0cnkgLCBleGNlcHQgbXkgdXN1YWwgDQppbWFnZSBjYXB0dXJlcyA/
DQoNCg0KRXVnZW4NCg0KPiANCj4gVGhhbmtzIGFnYWluIGZvciB0ZXN0aW4hDQo+IA0KPj4NCj4+
DQo+PiBXaGF0IEkgY2FuIHNheSBpcyB0aGF0IHRoZSByYXcgYmF5ZXIgZm9ybWF0IHdvcmtzIGF0
IDE5MjB4MTA4MCAsIGZyYW1lcw0KPj4gYXJlIHJlY2VpdmVkIGNvcnJlY3RseS4NCj4+DQo+PiBU
aGFua3MsDQo+PiBFdWdlbg0KPj4NCj4+Pg0KPj4+IHYxIC0+IHYyOg0KPj4+IC0gcmV3b3JrIHRo
ZSBtb2RlcyBkZWZpbml0aW9uIHRvIHByb2Nlc3MgdGhlIGZ1bGwgcGl4ZWwgYXJyYXkNCj4+PiAt
IHJld29yayBnZXRfc2VsZWN0aW9uIHRvIHJlcG9ydCB0aGUgY29ycmVjdCBCT1VORCBhbmQgREVG
QVVMVCB0YXJnZXRzDQo+Pj4gLSBpbXBsZW1lbnQgaW5pdF9jZmcNCj4+PiAtIG1pbm9yIHN0eWxl
IGNoYW5nZXMgYXMgc3VnZ2VzdGVkIGJ5IExhdXJlbnQNCj4+PiAtIHRlc3Qgd2l0aCAxIGRhdGEg
bGFuZQ0KPj4+DQo+Pj4gVGhhbmtzDQo+Pj4gICAgICBqDQo+Pj4NCj4+PiBKYWNvcG8gTW9uZGkg
KDIzKToNCj4+PiAgICAgbWVkaWE6IG92NTY0MDogQWRkIHBpeGVsIHJhdGUgdG8gbW9kZXMNCj4+
PiAgICAgbWVkaWE6IG92NTYwNDogUmUtYXJyYW5nZSBtb2RlcyBkZWZpbml0aW9uDQo+Pj4gICAg
IG1lZGlhOiBvdjU2NDA6IEFkZCBvdjU2NDBfaXNfY3NpMigpIGZ1bmN0aW9uDQo+Pj4gICAgIG1l
ZGlhOiBvdjU2NDA6IEFzc29jaWF0ZSBicHAgd2l0aCBmb3JtYXRzDQo+Pj4gICAgIG1lZGlhOiBv
djU2NDA6IEFkZCBMSU5LX0ZSRVEgY29udHJvbA0KPj4+ICAgICBtZWRpYTogb3Y1NjQwOiBVcGRh
dGUgcGl4ZWxfcmF0ZSBhbmQgbGlua19mcmVxDQo+Pj4gICAgIG1lZGlhOiBvdjU2NDA6IFJld29y
ayBDU0ktMiBjbG9jayB0cmVlDQo+Pj4gICAgIG1lZGlhOiBvdjU2NDA6IFJld29yayB0aW1pbmdz
IHByb2dyYW1taW5nDQo+Pj4gICAgIG1lZGlhOiBvdjU2NDA6IEZpeCA3MjB4NDgwIGluIFJHQjg4
OCBtb2RlDQo+Pj4gICAgIG1lZGlhOiBvdjU2NDA6IFJld29yayBhbmFsb2cgY3JvcCByZWN0YW5n
bGVzDQo+Pj4gICAgIG1lZGlhOiBvdjU2NDA6IFJlLXNvcnQgcGVyLW1vZGUgcmVnaXN0ZXIgdGFi
bGVzDQo+Pj4gICAgIG1lZGlhOiBvdjU2NDA6IFJlbW92ZSBvdjU2NDBfbW9kZV9pbml0X2RhdGEN
Cj4+PiAgICAgbWVkaWE6IG92NTY0MDogQWRkIEhCTEFOSyBjb250cm9sDQo+Pj4gICAgIG1lZGlh
OiBvdjU2NDA6IEFkZCBWQkxBTksgY29udHJvbA0KPj4+ICAgICBtZWRpYTogb3Y1NjQwOiBGaXgg
ZHVyYXRpb25zIHRvIGNvbXBseSB3aXRoIEZQUw0KPj4+ICAgICBtZWRpYTogb3Y1NjQwOiBJbXBs
ZW1lbnQgaW5pdF9jZmcNCj4+PiAgICAgbWVkaWE6IG92NTY0MDogSW1wbGVtZW50IGdldF9zZWxl
Y3Rpb24NCj4+PiAgICAgbWVkaWE6IG92NTY0MDogTGltaXQgZnJhbWVfaW50ZXJ2YWwgdG8gRFZQ
IG1vZGUgb25seQ0KPj4+ICAgICBtZWRpYTogb3Y1NjQwOiBSZWdpc3RlciBkZXZpY2UgcHJvcGVy
dGllcw0KPj4+ICAgICBtZWRpYTogb3Y1NjQwOiBBZGQgUkdCNTY1XzFYMTYgZm9ybWF0DQo+Pj4g
ICAgIG1lZGlhOiBvdjU2NDA6IEFkZCBSR0I4ODgvQkdSODg4IGZvcm1hdHMNCj4+PiAgICAgbWVk
aWE6IG92NTY0MDogUmVzdHJpY3Qgc2l6ZXMgdG8gbWJ1cyBjb2RlDQo+Pj4gICAgIG1lZGlhOiBv
djU2NDA6IEFkanVzdCBmb3JtYXQgdG8gYnBwIGluIHNfZm10DQo+Pj4NCj4+PiAgICBkcml2ZXJz
L21lZGlhL2kyYy9vdjU2NDAuYyB8IDExNDMgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tDQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDgzMCBpbnNlcnRpb25zKCspLCAzMTMgZGVs
ZXRpb25zKC0pDQo+Pj4NCj4+PiAtLQ0KPj4+IDIuMzUuMA0KPj4+DQo+Pg0KDQo=
