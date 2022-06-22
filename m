Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71CBA55471D
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 14:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352333AbiFVKYh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 06:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354272AbiFVKY2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 06:24:28 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F663B56A
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 03:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655893438; x=1687429438;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cZ9fRzB6sZFGMI/lZNsjwu0Uen64X9aP+IObUtIcBQQ=;
  b=PhYkdfdwGjkvYSqr0BpEfLz4L1pG/cei72AslWSusfa6X6XK7qBEFQA3
   Qywz3IRYUBDelIiZ/dpPo81h3s4I72cZpLlMquFIpmStFqnODZm2ia8nA
   Ijo8TA/tomuK0qXvnkur2QeuPePfY36FuxwiihXmlrYqDRZAxdQomcYuI
   6aJ1fLjwx6ch/8oy4gqkcqOUrUuMG2fWoJEXzGavSEnLC/Rjtw2MExonD
   GqNJGdDVNVQimPHLmYY6GIE2FXSP+BX+Qbl151bx5cHrn08xh3cBVlQGj
   dBaytFe6TtkXSLFW+8PwbK5HeP5CRL/IrIGl3Uvp3auRwZT+fVuVus/Bu
   w==;
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="161505110"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Jun 2022 03:23:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 22 Jun 2022 03:23:54 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 22 Jun 2022 03:23:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCyFRxSf5/KxgFQ27WPdXQeuthY9HtIAKBKOQUC/Og4FVFUsGuYpmSonpFSnz4YgstyJLg6bCipUdg9HsvLNyXTawkSuleijn99Jv+7zbmqGYVlU+qWlm1nCB5wi7Orxnk3plqzXovprijAAkHZUScqmZU6UobFsYjiL1BqUtRa9DOGQlxA+cQAIa8lZJ+5tRckENF74x9utc2E/u8MRP26KMSqVFD8X3Jy3KX2AhD/4EEYpRpqk0DlgptvR3R1PSSYKJ+R45JEhKjVrhQc5QRCIl2+c5cBHS51A0DZF1Ey8miyo15caL9pUtlOjq6glc8fKLQQC9k/fV9XCQwEl7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZ9fRzB6sZFGMI/lZNsjwu0Uen64X9aP+IObUtIcBQQ=;
 b=kR+8lIPChjp9Kj8L7zxe1SvJ1i2XjYmldnM7mjb0JvFuuxgmH6+BFyxP8baUvHBpvZRSYotzO2fZbRMFE09+YpojUbMD+UhUzlNUrqPC4gDzrEL7gq5M91zWSkruGXe5A5im34LPlJlaN0c8kf8qjogTQqkgFusob73bxc4/4qxfpdcRGLxCbq+UuEfy09LEUD+nUeI9LM2s+VPJiMq2/MwKW4oq0Qv3cKUSGBcKADASL//3r4YrA20VWWa9K/Hs5V6juSKgRz8Q8pVLIuETwPV87c9F/Hw8gFHE9j115Irhx3yxKJesav8HTmgAzcLV87Z9S4hr0HvCmu8QScP7SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZ9fRzB6sZFGMI/lZNsjwu0Uen64X9aP+IObUtIcBQQ=;
 b=HPnpHcjKlVnRBOmlOvr9l0BhMAVggRHMPqrZsNfgs0mpi9qJPnOEvfmMunv5kRS4l/er7cUcDHLgl4MCclYuALAwmiwhf5PbWvvsNzMHWJAEzrWFa03sD6Rb10l+5nlMczZK159kHQREqVrvsTmfQdjDhdkT+3JExmGRbRhGbLY=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by BY5PR11MB4136.namprd11.prod.outlook.com (2603:10b6:a03:192::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Wed, 22 Jun
 2022 10:23:52 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::c9c8:3bab:6b8f:5376]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::c9c8:3bab:6b8f:5376%6]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 10:23:52 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <hverkuil-cisco@xs4all.nl>, <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>
Subject: Re: [PATCH 0/2] vb2: add (un)prepare_streaming vb2_queue ops
Thread-Topic: [PATCH 0/2] vb2: add (un)prepare_streaming vb2_queue ops
Thread-Index: AQHYhhrsFrmjCubcI0ixdixz59oiJq1bLQsAgAAErwCAAAZqgA==
Date:   Wed, 22 Jun 2022 10:23:52 +0000
Message-ID: <af762bd3-3e54-5bae-da22-385f8798f692@microchip.com>
References: <20220622093145.927377-1-hverkuil-cisco@xs4all.nl>
 <YrLkbMZYb/Jpdidv@pendragon.ideasonboard.com>
 <cda824da-723e-66eb-3773-883502a34fd1@xs4all.nl>
In-Reply-To: <cda824da-723e-66eb-3773-883502a34fd1@xs4all.nl>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bfbc7ee-e160-4ce0-0f5b-08da54394dfa
x-ms-traffictypediagnostic: BY5PR11MB4136:EE_
x-microsoft-antispam-prvs: <BY5PR11MB41363C7B49E47506C476FBC4E8B29@BY5PR11MB4136.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FeONJjUSMCnMCMPpyTOZm1K/NtSAe5ToSKuQNvGhfRhhwsgHXULKkSEI9Vboa4ua3Kt/WxhvakN1lZt7krVU8YQ5BjZWGqRoFcviEsbesjrd2nQm9qhbFuOsDy/n7ogVK5/S1pmDQC1XDKBUpCb0iTDrqe+mR9HiZBNJoKECTJWtdbKxI/LkJTmxjiQJG6VOYGeWFZoKmTBGTHbVLuLpeFSsiiWkfKJ4ouzCMvTYdGBTPIw0QPdaYME96LP7pztksBN9zOLWDqWo/vN0JcLcohYxaMpsvIvTkhaFlh7YjVhrBL5H5fBOIOgMjtWQUNTL4YQPrTVLh3HqUGlmMpVge3fquiiIJeXGeBK4I6fUcFkNixAU+BU0BdxFw/D8I/kinkYU1Y3D6ki9NyqQ9zKaeE8FQ56FP163AM+wDtdgH0IHtGevOPIRbJtRqigi1SIVBQgLtTUbxJeiIuGfW0EZWoTUWH38xoTCa4U8O/ULQbEfvlTjHv0b8TrZGbaATjvVmvH+2apttInG0nFfS0eMQvG0o3YvChygTwe7rilrpdo7c3I1L1rBWv8NRYEtpYrsiI+6fywwYFh/YMPs3lZCxPU1Yv8i8ixFjGv/eDkLMwXTFcD47/DRWNe+x1BGa6kfk/kXEGQlD1Xt/IIbzQWaYN8TucLBiJ/KWrgD0Y/AippWC28rZ0ohZk/mrxLqBdZvie6axqKs4BXEbB5cT5gnHtJZo546YgAPM6w3gwmSVxLsF/JZtBWJLE3tqkvtdYWhdD9aZVYgVVO6A+UyklRLoBs11uz431VsQQnuNaFXxopPBht4tTi52xaSsP7YBz6RHjC44v2sPMoNYoFPhqxVziz2v7PBwJv3S7fMN8AtS9M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5384.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(366004)(136003)(39860400002)(396003)(8936002)(6486002)(66476007)(316002)(8676002)(186003)(38100700002)(5660300002)(478600001)(41300700001)(31686004)(2616005)(83380400001)(966005)(122000001)(36756003)(86362001)(31696002)(53546011)(6506007)(71200400001)(110136005)(76116006)(91956017)(66946007)(38070700005)(4326008)(26005)(66446008)(6512007)(66556008)(64756008)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2pyQVhKaWt2MktFRG90Mlc1TlRmWlVJMDFPbkFiVjR3QWUrV2hzR1BpNTdj?=
 =?utf-8?B?dTYvbk1DVUlGb0FZekdDZWFDeDl1U0UwQll5SXc0dGZGL3Y4SDR4d29uMC9G?=
 =?utf-8?B?Q2FLVmNsQ3ROVExQMjdFZDJNKysvRk5wb1YrNDh5N0dXMS9UODZxOEJRd09K?=
 =?utf-8?B?a2tONFVWeDJINWgweEdWS2xoSkQ2QXVNeUtmNnJUaysvVkV1cjJIeGRGZlJ2?=
 =?utf-8?B?U2gxQUM1VlZlK0dkSi9ESjNra3Yyc2JhMlJDTGFuU3Q5eDh1NDZVcDBMWjJ5?=
 =?utf-8?B?QUVkQUhkVHVxUjBVRDBtSmdhWGNYc2lTQ0kya1YyL1czYUVCY0dBZEh6UEdV?=
 =?utf-8?B?UVNXODNCYnZvQ0dVRUUyclZ5eVZOZkNlRkZ5OEZDTncwSERYZEJaMjZWTmVH?=
 =?utf-8?B?TERJZ3NzQ2VpOTNnS3EwTzYxUVh4aGg2VmtHcGo5cXpKeFJxWHhNb2Q4clVQ?=
 =?utf-8?B?eDdMcFFHKzA5Mjk3SnUzOXl2dWJCR0lkL1I5ZWdGbVIvRE1mN0d1Um1sUlNu?=
 =?utf-8?B?enNnZTMwcGh3a1Y5WDdzODBBM1c2OFJZUTF2VVJwTFprT1d3NTdSYUhTYWZE?=
 =?utf-8?B?Q3QxNy8wMi8yVlVYdFkxNFVJY3IyYnV2cnRiZGlCZEM0UkhYdENKVmd6b1Vt?=
 =?utf-8?B?dWxVM0tsOWtNelBkcHJIOSt3VXUxY0FOdFYrelk5Qko1U1dOOUlTN3haM3E0?=
 =?utf-8?B?MUNQd2F4RVAyc0l3SmpXbE9VZzFhaFZvRmI1S29qWGt1cVZnWXRTM2hwblZa?=
 =?utf-8?B?bDhkQjc0c09WQmdhRmZyL0J2NEFXK2ZmVnFXSlE0ZThFbUc5dSszTXY0Q3ox?=
 =?utf-8?B?RFQ0Y2Fhd09XeXBWdzdlOXZlbnRxeC9nM1llemhuKzBiYVROYUw2NjZtU0d5?=
 =?utf-8?B?aDgyb3VVUzZ2eFZINzBrQmt4cG5POWVyajhkYzZ4ZDErbWwwZ01BR3VEUnNH?=
 =?utf-8?B?S0E2TlpjcThYajNVUHlGcVVST0hDM0c2ZXFjMUZFNXREMCtFSVYwSDdiVzkz?=
 =?utf-8?B?K2lKcFR5OUd6RVh4WTRIYk9EZmtZME91RnpabDZmSlZpQUgyYTFjMEpoRDJO?=
 =?utf-8?B?aWhlbkI3b3d6aTNIUDkzcXhWa3o4amErYzZmSC90R3QwRFZOTkJHZE1uVWVT?=
 =?utf-8?B?NVpHMWRialh4NUdxOE1FYW5ZWm00Vzg2b1ZPTXh2NkkwZlJTK09JaFpCYWRu?=
 =?utf-8?B?TmJuYnpwbVdMbWFYRVBwZW5NL0lVb1d2cVJsYmNMS2E2KzFnaUN4cDFwcGxz?=
 =?utf-8?B?YktBa2xnUWN6Z3BIbU9LUncxQWVRYklZcDJjNmYwUGhPa0RxSWppNEYraVp5?=
 =?utf-8?B?ejQvM3QvSlFJa3liR2VVSUIwRVZ6SFYrS3p2VHNYVGRvU3dmK0xqV21maWZx?=
 =?utf-8?B?Ym9sVUJVUUxMa0IrRE5jZHFabGVUY0hYbUgxSDVHbHI1MmE5STlCNStKek9i?=
 =?utf-8?B?Yjh0RnRIY2FxbU01VGNyYjFJaEEvYnN6QlJtNWlGYnhPMDh6SWFZQjdBeGVM?=
 =?utf-8?B?V3JOaGoxaHhWRjFUZ1NKUE84YUNGN1M1ZHZmNlBmcDhmTTdJR2F0VXQycDJ6?=
 =?utf-8?B?amxqRUl4T09LR2lPUUNPUCt3cGhRVHVWMTdoa2VBV2dJY2tEWGYyaUNRZWQ4?=
 =?utf-8?B?OXRkYnNHK0lUVWVFdC9aVlM1SzVHMjRrSzJkQTUxNmJhUitzWnZLNVpyNE05?=
 =?utf-8?B?YjMzTXpVQjBaMnE1OTh2RWhsdkdub1I4ZnVud0VlOEx4TStFemhQSFVGME9m?=
 =?utf-8?B?OVVOa05EUkV3dFVyUTZVblZEd29xelU0L0xocFMvckdGTVNOalFNUE9hNFhS?=
 =?utf-8?B?YWFmd2ZETmxHZGlsU0Nxa0lIWEh5S21sZUZsKzdqaFF4WjMxTEtCUTlHYjY5?=
 =?utf-8?B?NGFaZ25YSFpuUTlFb3lnNU9rZVpTVk9mZS9tWjh5dE1lVHZwRXRHUXhZL1lR?=
 =?utf-8?B?K2VodGg4YnZjaW5KdzlVVjZ6cmxyRTAwNGUxVXVQTkYxVVR0Z0lYc25EZm1m?=
 =?utf-8?B?OTRHM2Zkclo4cmNPK1RKNGNDdVF1Z2RNTGtadEUzMk1jRStiNFRDbkk0dUVG?=
 =?utf-8?B?ZXZQYTFCOU5zM25NR2RXdlBYWkhQYTMvKzdYUjlMMjhZMHk4cVhIQ0JWclNK?=
 =?utf-8?B?WDl5RTRjbWxSbENxV0x2ay94KzVOOHNpM0kvbm9xRXlUVitKczFBTWRDUmpn?=
 =?utf-8?B?OVRvS3g2bzgwU2drcWtmUEt3dUVKaFg0R25SQWx5SWdNTG1PUk9KNTIxS21o?=
 =?utf-8?B?aFl5MjNXRFdLdXV2REZSUnBjeFVPWHc0QnBxbEtoRUZ2ZFhxTDg0T3IyaVM3?=
 =?utf-8?B?c21KZFVSQkp1djZIVG9tZC9jOCt0ejZYU25jYXkzRnFnUUI5eVR4ZitKdG5a?=
 =?utf-8?Q?U25u29vE4C3YjB8c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D504C36EEA2D246BF8E3C8334026598@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bfbc7ee-e160-4ce0-0f5b-08da54394dfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2022 10:23:52.3980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xwrcu03KHZuDXXwUqSIsbHHFPaSW/yTTLNDk7lws7bx7RWQDu/qvupAh7mRsyiPBT7W8C5wtmyKanv7TyJBXJckh96VganZ00SnJpOy7A2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4136
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gNi8yMi8yMiAxOjAwIFBNLCBIYW5zIFZlcmt1aWwgd3JvdGU6DQoNCj4gSGkgTGF1cmVudCwN
Cj4gDQo+IE9uIDIyLzA2LzIwMjIgMTE6NDQsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6DQo+PiBI
aSBIYW5zLA0KPj4NCj4+IE9uIFdlZCwgSnVuIDIyLCAyMDIyIGF0IDExOjMxOjQzQU0gKzAyMDAs
IEhhbnMgVmVya3VpbCB3cm90ZToNCj4+PiBBZGQgc3VwcG9ydCBmb3IgdHdvIG5ldyAodW4pcHJl
cGFyZV9zdHJlYW1pbmcgcXVldWUgb3BzIHRoYXQgYXJlIGNhbGxlZA0KPj4+IHdoZW4gdGhlIHVz
ZXIgY2FsbHMgVklESU9DX1NUUkVBTU9OIGFuZCBTVFJFQU1PRkYgKG9yIGNsb3NlcyB0aGUgZmgp
Lg0KPj4+DQo+Pj4gVGhpcyBnaXZlcyBkcml2ZXJzIGEgY2FsbGJhY2sgdG8gdmFsaWRhdGUgdGhl
IHZpZGVvIHBpcGVsaW5lIGFuZCBjbGFpbQ0KPj4+IG9yIHJlbGVhc2Ugc3RyZWFtaW5nIHJlc291
cmNlcyBhdCB0aGUgdGltZSB0aGF0IHVzZXJzcGFjZSBpbmRpY2F0ZXMNCj4+PiB0aGF0IGl0IHdh
bnRzIHRvIHN0YXJ0IHN0cmVhbWluZyAoVklESU9DX1NUUkVBTU9OKSByYXRoZXIgdGhhbiB3aGVu
DQo+Pj4gdGhlIGFjdHVhbCBETUEgZW5naW5lIGtpY2tzIGluICh0aGUgc3RhcnRfc3RyZWFtaW5n
IGNhbGxiYWNrKS4gVGhpcw0KPj4+IGlzIHJlbGV2YW50IGZvciBkcml2ZXJzIHRoYXQgbmVlZHMg
YSBtaW5pbXVtIG9mIFggYnVmZmVycyBiZWZvcmUgdGhlDQo+Pj4gRE1BIGNhbiBzdGFydC4gVGhl
IGFjdHVhbCBwaXBlbGluZSB2YWxpZGF0aW9uIG5lZWRzIHRvIGhhcHBlbiBzb29uZXINCj4+PiB0
byBhdm9pZCB1bm5lY2Vzc2FyeSBlcnJvcnMgYXQgVklESU9DX1FCVUYgdGltZS4NCj4+Pg0KPj4+
IEFzIGEgYm9udXMgdGhpcyBhbGxvd3MgdXMgdG8gbW92ZSB0aGUgaG9ycmlibGUgY2FsbCB0bw0K
Pj4+IHY0bF92YjJxX2VuYWJsZV9tZWRpYV9zb3VyY2UoKSBpbiB2YjJfY29yZV9zdHJlYW1vbigp
IHRvIHRoZSBhdTA4MjgNCj4+PiBkcml2ZXIgKGN1cnJlbnRseSB0aGUgb25seSBkcml2ZXIgdGhh
dCB1c2VzIHRoaXMgZmVhdHVyZSkuDQo+Pg0KPj4gQ2FuIHdlIGRyb3AgdGhlIGhvcnJpYmxlIC5l
bmFibGVfc291cmNlKCkgZnJvbSBtZWRpYV9kZXZpY2UgdG9vID8gOi0pDQo+IA0KPiBUaGUgc2Vj
b25kIHBhdGNoIGhlbHBzIGEgYml0IHdpdGggdGhhdCwgYXQgbGVhc3QgaXQncyBvdXQgb2YgdmIy
Lg0KPiANCj4+DQo+Pj4gVGhhdCBjYWxsIG5ldmVyIGJlbG9uZ2VkIGluIHZiMiwgYnV0IGl0IGhh
ZCB0aGUgc2FtZSBwdXJwb3NlIGFzIHRoZQ0KPj4+IG5ldyBwcmVwYXJlX3N0cmVhbWluZyBvcDog
dmFsaWRhdGUgdGhlIHBpcGVsaW5lLg0KPj4+DQo+Pj4gVGhpcyBpcyBhIGZvbGxvdy11cCBmcm9t
IG15IHByZXZpb3VzIFJGQ3YyOg0KPj4+DQo+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsubGludXh0di5v
cmcvcHJvamVjdC9saW51eC1tZWRpYS9wYXRjaC9iYTRiY2ExNC00ODhmLTk0ZWEtNDhkOS1lNzM0
MzEwM2M1YWFAeHM0YWxsLm5sLw0KPj4+DQo+Pj4gSSB3b3VsZCBsaWtlIHRvIGdldCBjb25zZW5z
dXMgZm9yIHRoaXMgc2VyaWVzLg0KPj4NCj4+IEkgZG9uJ3QgbGlrZSBpdCBtdWNoLiB2YjIgaXMg
YWxyZWFkeSBkb2luZyB0b28gbXVjaCBpbiBteSBvcGluaW9uLA0KPj4gZ3Jvd2luZyBpdCBpc24n
dCB0aGUgcmlnaHQgd2F5IHRvIGZpeCBpdC4NCj4gDQo+IFdlIGRpc2FncmVlIG9uIHRoYXQgOi0p
DQo+IA0KPj4NCj4+IEknbSBzdGlsbCB3b3JraW5nIG9uIGEgbmV3IHZlcnNpb24gb2YgdGhlIFY0
TDIgc3RyZWFtcyBzZXJpZXMgdGhhdCBtYXkNCj4+IGNvbmZsaWN0IHdpdGggdGhpcywgSSdkIHBy
b3Bvc2UgZGlzY3Vzc2luZyB0aGUgdHdvIHRvZ2V0aGVyLg0KPiANCj4gV2hhdCBpcyB0aGUgRVRB
IGZvciB0aGF0PyBJIGRvbid0IG1pbmQgd2FpdGluZyBhIGZldyBtb250aHMsIGJ1dCBpZiBpdA0K
PiB0YWtlcyBhIGxvdCBsb25nZXIsIHRoZW4gSSdkIHJhdGhlciBtZXJnZSB0aGlzIGZpcnN0IHNv
IEV1Z2VuIGNhbiB1c2UgaXQNCj4gaW4gaGlzIGF0bWVsIE1DIHN1cHBvcnQuIEl0J3MgYSBrZXJu
ZWwgQVBJLCBzbyBpdCBjYW4gYWx3YXlzIGJlIGNoYW5nZWQNCj4gb3IgcmVtb3ZlZCBsYXRlci4N
Cg0KSGksDQoNClRoZSBhdG1lbCBNQyBzdXBwb3J0IGlzIGRvbmUgb24gdG9wIG9mIHY0bDIgd2l0
aG91dCB0aGlzIHBhdGNoLCBhbmQgSSANCmhhdmUgYSBzdWJzZXF1ZW50IHBhdGNoIHRoYXQgY2hh
bmdlcyB0aGUgYXRtZWwgTUMgdG8gdXNlIHRoZSBuZXcgUkZDIEFQSS4NCg0KT25lIG9wdGlvbiBp
cyB0byBoYXZlIHRoZSBhdG1lbCBNQyBsaWtlIEkgaW5pdGlhbGx5IHNlbnQgaXQsIGFuZCBhZGQg
bXkgDQpwYXRjaCB0aGF0IHN3aXRjaGVzIHRvIHRoZSBwcmVwYXJlX3N0cmVhbWluZyB0byB0aGlz
IHNlcmllcyAuDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiAgICAgICAgICBIYW5zDQo+IA0KPj4N
Cj4+PiBIYW5zIFZlcmt1aWwgKDIpOg0KPj4+ICAgIHZiMjogYWRkICh1bilwcmVwYXJlX3N0cmVh
bWluZyBxdWV1ZSBvcHMNCj4+PiAgICB2YjIvYXUwODI4OiBtb3ZlIHRoZSB2NGxfdmIycV9lbmFi
bGVfbWVkaWFfc291cmNlIHRvIHRoZSBhdTA4MjggZHJpdmVyDQo+Pj4NCj4+PiAgIC4uLi9tZWRp
YS9jb21tb24vdmlkZW9idWYyL3ZpZGVvYnVmMi1jb3JlLmMgICB8IDI2ICsrKysrKysrKysrKysr
LS0tLS0NCj4+PiAgIGRyaXZlcnMvbWVkaWEvdXNiL2F1MDgyOC9hdTA4MjgtdmJpLmMgICAgICAg
ICB8ICAyICsrDQo+Pj4gICBkcml2ZXJzL21lZGlhL3VzYi9hdTA4MjgvYXUwODI4LXZpZGVvLmMg
ICAgICAgfCAgMSArDQo+Pj4gICBpbmNsdWRlL21lZGlhL3ZpZGVvYnVmMi1jb3JlLmggICAgICAg
ICAgICAgICAgfCAxNCArKysrKysrKysrDQo+Pj4gICA0IGZpbGVzIGNoYW5nZWQsIDM3IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+Pg0KPiANCg0K
