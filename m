Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2E694B0CC5
	for <lists+linux-media@lfdr.de>; Thu, 10 Feb 2022 12:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241171AbiBJLvI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Feb 2022 06:51:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234873AbiBJLvG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Feb 2022 06:51:06 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A361E102A
        for <linux-media@vger.kernel.org>; Thu, 10 Feb 2022 03:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1644493864; x=1676029864;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TLCLOwi148jFYNMhhqjMw4MzUmLu+f1sBg4NyZymlYw=;
  b=UudBYpPiBAVtgX8lbxPFR8izh7748lWyxLBQFKkICUvQ2WqzC6FgUb2I
   g2UdNRXZ87GYA9Sbz044yDWFAuBv4N0VFVc/PWiO/c0dDkW2yn/CV0Qoi
   q189aP6pZtVsF0AlH4PXthLrv3iKK123nw2vxWkuACWFARXYth6sW0eLF
   asqxupbfOJO3AmJ+7CtzPvx8T696o8h4xtQn5cL7iMp5auTQbMk3cxZ+L
   ngCY6xlWAjvMJzSKG3bNbumht/W63av2PUw7wDnPNqWMpR+FaYGM4+pV0
   jZ1502y7G/mGqa4zK7R7JGukpB3wMyEL6+GkIc6wEsZX0kVNdjHEftDPB
   A==;
IronPort-SDR: Wylmpl3gCl5z5AfWRlUi+UFDPBQ2YPLZoqZANr13gzXm7dtwt4FNSHQl/SeSuhz3VrWwbIZuj6
 MlrznDJnUBkuUq5decDKEdvu+2mdbb/1INvpOCDS5YOmtMb7lS+L5+0twuVXDCaozjrzESa+Cq
 6VbGIITp2Z5vsNi9Ll9h2mR53+ise/LPFWK9418HpviOteiQsFGxVcYR1xpYsXJN4Vz3OWO9y5
 sRnk1+UA06AmGv3cfbNO8ldkCcv1ulFvPIW6JMWeLMOzaDJhOJ9fPapAnUvUXntBlzf7xuZL+/
 nurUTqK2Q8/1b91bEA6Gn/8j
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; 
   d="scan'208";a="148264622"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Feb 2022 04:51:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 10 Feb 2022 04:51:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 10 Feb 2022 04:51:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pv1Ng3GnDAnrpX4UZyI5sACWG6OsLpd32AK07ll31konw2M/d9TjZ1LpiZHzMf7kiI9Eh9TBMjn4KwsZbSbJUSa/a3IOFASpR271xJLNj/reZaFieJz5wcHK5jU4N45aCGwSMK18oOzLGivKHbUikNBSkqGQsF7PH3lkdn2l0SRvHssiuSy5ZDSnAY5wZhzgV1bSnrsYD2CIcJ6EbT4XKnbozim1RhyAkeLogTQFjTrNmYdTQQyGbWjb9+8n4Ctt/tTP/s+tOvzYszUcmeeCxZ31gd/H3qtKHqNM71slBI1CMEyHcTry3wcELwdvoiCra5PrwZ3fKDDNngxbRGQYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLCLOwi148jFYNMhhqjMw4MzUmLu+f1sBg4NyZymlYw=;
 b=bmwq23rGrM2ZCJjNAyo9AmfWm7JLyigsQDfGUQe9Aa+iwyqKMa/fT7LuorNJRXnylnZtgaRND3XGOMVoAdQdk7Bol8Bqd0+0ZV+ZxqqoNE9y8sXQ9+nBpRWH6sQx1x5sIviwCIxdJqjwSK7RnFP8qnL4UnE0IBsXnb5kHfRDRbMs8kKyhqDC2zm8iXJ3S7CvRlqsvjjwMfEOk78UAyk8dQialL36EjrC1pqOBar64gvKPG+6+2Ekz3e6QstGUdhiA/DlnOL3MnVNc0IPuMxfVt6OV/YD/nWJWxgYJJR2b6iPh82zlDEbrwzj3jl58zwohW2zYe3nvJ9iWsNhOH/9QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLCLOwi148jFYNMhhqjMw4MzUmLu+f1sBg4NyZymlYw=;
 b=mVqhMr8z4ayEbZWzqOpb4ezLFyjvCFJe3lrYsqblMQZ9I7eDpZXUVY8p24mri1nxHAnwxh8yxyLZVIdnxDFv+LZ1oBgL9mPZLAcigb5/dAUi1klyVI3rTXbcgncH4Zqs+wtoKinLAcrpcerCw/fZ+I3FEth3sVWervClljKmDHY=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by BN6PR11MB0065.namprd11.prod.outlook.com (2603:10b6:405:65::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 11:51:01 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc%9]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 11:51:01 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <jacopo@jmondi.org>, <slongerbeam@gmail.com>
CC:     <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <hverkuil-cisco@xs4all.nl>, <mirela.rabulea@nxp.com>,
        <xavier.roumegue@oss.nxp.com>, <tomi.valkeinen@ideasonboard.com>,
        <hugues.fruchet@st.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <aford173@gmail.com>, <festevam@gmail.com>, <jbrunet@baylibre.com>,
        <mchehab@kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 00/23] media: ov5640: Rework the clock tree programming
 for MIPI
Thread-Topic: [PATCH v2 00/23] media: ov5640: Rework the clock tree
 programming for MIPI
Thread-Index: AQHYHm3R1BuGqkilnEqW9OeenxACqqyMrBYA
Date:   Thu, 10 Feb 2022 11:51:01 +0000
Message-ID: <e9fdfe03-10d0-1b53-a228-44e7c5da6f5a@microchip.com>
References: <20220210110330.152352-1-jacopo@jmondi.org>
In-Reply-To: <20220210110330.152352-1-jacopo@jmondi.org>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6d5a8e6-1aff-41f1-dcf5-08d9ec8b9c0d
x-ms-traffictypediagnostic: BN6PR11MB0065:EE_
x-microsoft-antispam-prvs: <BN6PR11MB00653A226A5C39EB6AA06701E82F9@BN6PR11MB0065.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DDJYYSU8StD7H+xCmBr46sZ1CZqQ0Wb8PsMSx9cJ35kvHS/RruNvzEdahAjTZvRy1Atk2OurBDCZxLHYV4RtMH4/IUE2To9vktD9uoDvcgRgvKA4wLj6YljF1Bv391O+4jrdf73WR9urmFBAiiyltDMsoxfNC5YvrWpmcK9/W/X7605fY50yvIxMwyLbCMPdyGn357SageMrtb41nK1Aoobhk0Fg0HQ9G/hnTZeVjHNeI8FXfaCxKbYsA9FWfPzWRfXIMDkKdU0iHVFA4K2AMXbpRuCbggXZjuum8+vrTkFzJKMhHTB8f5V+5VONMZ3HocEKT60666IahCL+yQC/0mRbGaplJwcUd4PzG1IcDWBg8FhbAaye5LyiKyM99m8T36M29dS5WtQ0NBAKvaJoIhEugBP2IYXYP/r6qUVgNCGZlkWZeIE6xr4aDQIh76JsUlZ8fEjfQlTv1DmVvBxoMJjLiTSJNBl4oPRZSxwbL6VJr/sgCqvHKLcYP/XCPWaVmyaGvCD01L/ebNk37cY5crXymIXGgWONUZbUxaUO1W7brnmlfiFcFkQWtd87gTALjYldu5XOE/IoNyaqVdqADRFbFpFUkpF2KQoNGUroLM339iT1JYDPFU+POEnIgU6aHAhbOVIStwYlHD0D0OuI/mvRzB6Z7zAuG3dpoPUMW0mM9QQCv12EhDBnVMav6MqfJe1cUCzS8kjvi4lJvSK6exL08HrDTr7CbzoOEmVvlWKDM/v+obZNFfc/hJ2fFleDzQ5NntPgifh4KxN2OmXzx5Qt3X28c13fgycRaQmf6iks6Eh5FFvWZbsawpA7R0gaAqi4Ud4ajJ5npQk9IoStELc7MwLK/7ohsXjMkeiBQGo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5384.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(7416002)(5660300002)(2906002)(38070700005)(66446008)(54906003)(110136005)(122000001)(38100700002)(316002)(66556008)(76116006)(66946007)(64756008)(91956017)(66476007)(4326008)(966005)(6486002)(508600001)(6506007)(6512007)(8676002)(8936002)(53546011)(83380400001)(71200400001)(26005)(186003)(2616005)(36756003)(86362001)(31686004)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnFlMTFRWmFQVyt0ZUlRaklvYmU5dUNqRjZjWEUxalREZTlVYit2UFQ4b2Zi?=
 =?utf-8?B?a0Z3ZEdCMktWUnFsNTlmYjhYa2xYSU1EWmRFYUVzR0tBeHNJSU9iNE5SdUxO?=
 =?utf-8?B?YkZYQWYrUVBrNlhxM1JpOGFWNW5aK2RiMTZuTTdybnkwdlkvZ3FBN0tQc2hm?=
 =?utf-8?B?QVVseWpMUHhEQlk3QXZGOWZveDMzUGdGQ0UzWCswRVpncEJOTzlEa0RUVFpY?=
 =?utf-8?B?ZHRiWEJxQm1hSVFxaWZ4WC9pZ0QvUERhbTl5U0hKd0dNS2huZG9kTXZkcTRS?=
 =?utf-8?B?OXh3Z0pOQlRuWTZEYWlKRStKWkhyNHExWTdxS1JJNnhvVTVpNXcrTFpGTXM4?=
 =?utf-8?B?bTRoUGxIWnNqelRjTUwwbmt2MTVMOXplMTdPUis0OVBoVjJjRUxkTHRSMmND?=
 =?utf-8?B?WWNPNW53VzVpQ0pwd1g1OWF0azNPR0ViK2Q1aFZhY0t6U0tCRTJXVmJKQ2dG?=
 =?utf-8?B?L1JGc2hiZk8xdUNQdmErbStEZmdObWJCNmdjRzBxYktTUEg1WDc0Y2hUSFpI?=
 =?utf-8?B?VGd4cjk1ZzVPS082VUs4SmZ4aGJ6cFhDQjZQbjdvdEMzZnNmcUNNd1dmYW1l?=
 =?utf-8?B?aVlkZFBSK2R0d3g4OVh1VzFvU1JINHVWMVNYNG5vMGUzNlRaamIrcW1pMDRH?=
 =?utf-8?B?b1NhS29GclVKSzVrWUIwRXBBM01rUy9ZWU5ERWo0RVdocDZEbFpISmliS29R?=
 =?utf-8?B?NWljYzBSOHQ2eUJPQ1BkM3pudzRrK1VIWmJQa0I5M2daVDVnVFloZXYrT0k3?=
 =?utf-8?B?WktZelIxdmd5QURaTW5uTEFjNVJFR3Brb3p0Vy9MWGp2VjRhbnJkb2d3Mkl5?=
 =?utf-8?B?cGhSaUlZWC93WGtHYWs5UnE4VlFDWDM1d2RRZGpQcytLTE8rVTRtNWt2Zlhj?=
 =?utf-8?B?NklqK2tMNFFSS3ZEQ0xjaDVOMllDOEFlWUUzZEdjY3AzZUszeTU2WVpyQ3J4?=
 =?utf-8?B?N2FxeHhuTzZZeU5LYTRENmhYSjBpcTRTbEhlNC9FV3pkOHlDVllJUDM4V3o4?=
 =?utf-8?B?dXlmYlRHK2V0L1Q0RGV6Y2hRWUNNUWQzTllvVjlJWlFPbTNJOFJENEtBcldy?=
 =?utf-8?B?K1F4cXJ1R3RSQ3poV3JZMGRqOFBNeTBaSmcxUG1kQjlQSDUvUkVLVkliblIz?=
 =?utf-8?B?RlNMNTZRTFFFWVhoQlNrcFVJWVNYcXBuTUxxdWdQa0NvaUJPMG40cE5kNmZU?=
 =?utf-8?B?anNWTVlCMXVyMlh3U0x5RGNRcTk0K1lYL2NCVHROUVpJSTJTT1VwcWZRZm9l?=
 =?utf-8?B?VVYwSWdRVzY5alZOL1UvYmY2Z1ZHN1pZZGpJU3lYOEFZdGE5VTZpa2c2MGpo?=
 =?utf-8?B?QytOVUFVbm9QNVg5dVFyamVCVE1ta09ucHhsNkNEZjVQZGZ5YUNKVjZKeVE1?=
 =?utf-8?B?M3RBbU8zUXFWZlNPZE0ySHA5Y1FXMUxqRURWMlp2eHpMdXlCQXFQOUs5U2xz?=
 =?utf-8?B?K2o4RXVMaE5wL1Fobnh1d1ZvTnh1WDZTbGZUWWt4WDVQTWxlTlNTRlZWZkl1?=
 =?utf-8?B?aTRab2ZEVTFjbUJkM2lVQnJldHZYczV5OWJqc0VKbW5kV3R1bExnN2JxbFpt?=
 =?utf-8?B?WGJjU2hxMXR5NXY1L251SHZRZVhtZktwWWcyTHV0ZFo1QVYzUnpEVUNNSy9v?=
 =?utf-8?B?UllyUmVVanpja2FUTU9mTHZVWktyUXVkVlJQZ3U1QmdLQS82MnJwdHBtWXJr?=
 =?utf-8?B?Q29Ka3ZGRlpLZXZMZXA2Z25rZWVPUGozY0RxeXpsMG5VTURkckNadlF5T3U4?=
 =?utf-8?B?cithZkpvL2J6ejlTSm9GeEtNTEpZd0lkWG40SFlNL1FyWnpVMC8vMlc4L1Yw?=
 =?utf-8?B?M2RWZnNOTFhmQUhSTjQwdG9ocWNCQlRpbzVUUlYrZGd2QmhvYnJ4cFp5a1Jl?=
 =?utf-8?B?MWhUamJ5VEJFMzloRnJYRVcyVWpMR3VZQkgyMW1yZnZCQnZ3cWJLd0VGaitl?=
 =?utf-8?B?SUczQ1N4RzlRMU5jVEZIT0s0VS9MVUZScndlL3hJaldjZ2NkK3JKSHJUdlor?=
 =?utf-8?B?bndKUW5qQ2VPVFMyZk9LVzExVUVEUWFTRnVuMHFwVFJWZmxTeU5qWFJUVDVv?=
 =?utf-8?B?QjQ0dEp2U05ERSt6Tm1LTUtESGhKamgxU2FycVRkVURFbnhjWm9JOE9rMmo4?=
 =?utf-8?B?RXIxQ2F1Vzcwb1ByMld0bGtnYk9Eb3pJMS9GUnk1aTIrNEFKRjczL1AwWXk4?=
 =?utf-8?B?VzltYTgxaFVzYVRsUFVseDJSTE9zeUJIc2FzR0VqM3cyemc3Nk55NFNZSzBP?=
 =?utf-8?B?TjRXcEJod1RRMjhCT1p0cnBTa2RRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A06308590706D549BDF546DEAA206F6D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d5a8e6-1aff-41f1-dcf5-08d9ec8b9c0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 11:51:01.1618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 081QCYqve3iYVeyz7AFtfHnBVZmUEufytv/u2BkHHGdT+/7DYIHGib0XIpH/YeQbZeh//M0nXsUK4YaiuqcO7CLiVYuA6EVrqV4En10b+wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0065
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMi8xMC8yMiAxOjAzIFBNLCBKYWNvcG8gTW9uZGkgd3JvdGU6DQo+IHYxOg0KPiBodHRwczov
L3BhdGNod29yay5saW51eHR2Lm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhL2xpc3QvP3Nlcmllcz03
MjQ5DQo+IA0KPiBBIGJyYW5jaCBmb3IgdGVzdGluZyBiYXNlZCBvbiB0aGUgbW9zdCByZWNlbnQg
bWVkaWEtbWFzdGVyIGlzIGF2YWlsYWJsZSBhdA0KPiBodHRwczovL2dpdC5zci5odC9+am1vbmRp
Xy9saW51eCAjam1vbmRpL21lZGlhLW1hc3Rlci9vdjU2NDAtdjINCj4gDQo+IElmIGFueW9uZSB3
aXRoIGEgRFZQIHNldHVwIGNvdWxkIHZlcmlmeSBJIGhhdmUgbm90IGJyb2tlbiB0aGVpciB1c2Ug
Y2FzZQ0KPiBJIHdvdWxkIHZlcnkgbXVjaCBhcHByZWNpYXRlIHRoYXQgOikNCg0KSGkgSmFjb3Bv
LA0KDQpJIHdpbGwgc3VyZWx5IHRlc3QgaXQsIGJ1dCBnaXZlIG1lIGEgZmV3IGRheXMgdG8gZ2V0
IG15IHNldHVwIHJ1bm5pbmcuDQooaG9wZSBpdCB3b24ndCB0YWtlIGxvbmdlciAhKQ0KDQpFdWdl
bg0KDQo+IA0KPiB2MSAtPiB2MjoNCj4gLSByZXdvcmsgdGhlIG1vZGVzIGRlZmluaXRpb24gdG8g
cHJvY2VzcyB0aGUgZnVsbCBwaXhlbCBhcnJheQ0KPiAtIHJld29yayBnZXRfc2VsZWN0aW9uIHRv
IHJlcG9ydCB0aGUgY29ycmVjdCBCT1VORCBhbmQgREVGQVVMVCB0YXJnZXRzDQo+IC0gaW1wbGVt
ZW50IGluaXRfY2ZnDQo+IC0gbWlub3Igc3R5bGUgY2hhbmdlcyBhcyBzdWdnZXN0ZWQgYnkgTGF1
cmVudA0KPiAtIHRlc3Qgd2l0aCAxIGRhdGEgbGFuZQ0KPiANCj4gVGhhbmtzDQo+ICAgICBqDQo+
IA0KPiBKYWNvcG8gTW9uZGkgKDIzKToNCj4gICAgbWVkaWE6IG92NTY0MDogQWRkIHBpeGVsIHJh
dGUgdG8gbW9kZXMNCj4gICAgbWVkaWE6IG92NTYwNDogUmUtYXJyYW5nZSBtb2RlcyBkZWZpbml0
aW9uDQo+ICAgIG1lZGlhOiBvdjU2NDA6IEFkZCBvdjU2NDBfaXNfY3NpMigpIGZ1bmN0aW9uDQo+
ICAgIG1lZGlhOiBvdjU2NDA6IEFzc29jaWF0ZSBicHAgd2l0aCBmb3JtYXRzDQo+ICAgIG1lZGlh
OiBvdjU2NDA6IEFkZCBMSU5LX0ZSRVEgY29udHJvbA0KPiAgICBtZWRpYTogb3Y1NjQwOiBVcGRh
dGUgcGl4ZWxfcmF0ZSBhbmQgbGlua19mcmVxDQo+ICAgIG1lZGlhOiBvdjU2NDA6IFJld29yayBD
U0ktMiBjbG9jayB0cmVlDQo+ICAgIG1lZGlhOiBvdjU2NDA6IFJld29yayB0aW1pbmdzIHByb2dy
YW1taW5nDQo+ICAgIG1lZGlhOiBvdjU2NDA6IEZpeCA3MjB4NDgwIGluIFJHQjg4OCBtb2RlDQo+
ICAgIG1lZGlhOiBvdjU2NDA6IFJld29yayBhbmFsb2cgY3JvcCByZWN0YW5nbGVzDQo+ICAgIG1l
ZGlhOiBvdjU2NDA6IFJlLXNvcnQgcGVyLW1vZGUgcmVnaXN0ZXIgdGFibGVzDQo+ICAgIG1lZGlh
OiBvdjU2NDA6IFJlbW92ZSBvdjU2NDBfbW9kZV9pbml0X2RhdGENCj4gICAgbWVkaWE6IG92NTY0
MDogQWRkIEhCTEFOSyBjb250cm9sDQo+ICAgIG1lZGlhOiBvdjU2NDA6IEFkZCBWQkxBTksgY29u
dHJvbA0KPiAgICBtZWRpYTogb3Y1NjQwOiBGaXggZHVyYXRpb25zIHRvIGNvbXBseSB3aXRoIEZQ
Uw0KPiAgICBtZWRpYTogb3Y1NjQwOiBJbXBsZW1lbnQgaW5pdF9jZmcNCj4gICAgbWVkaWE6IG92
NTY0MDogSW1wbGVtZW50IGdldF9zZWxlY3Rpb24NCj4gICAgbWVkaWE6IG92NTY0MDogTGltaXQg
ZnJhbWVfaW50ZXJ2YWwgdG8gRFZQIG1vZGUgb25seQ0KPiAgICBtZWRpYTogb3Y1NjQwOiBSZWdp
c3RlciBkZXZpY2UgcHJvcGVydGllcw0KPiAgICBtZWRpYTogb3Y1NjQwOiBBZGQgUkdCNTY1XzFY
MTYgZm9ybWF0DQo+ICAgIG1lZGlhOiBvdjU2NDA6IEFkZCBSR0I4ODgvQkdSODg4IGZvcm1hdHMN
Cj4gICAgbWVkaWE6IG92NTY0MDogUmVzdHJpY3Qgc2l6ZXMgdG8gbWJ1cyBjb2RlDQo+ICAgIG1l
ZGlhOiBvdjU2NDA6IEFkanVzdCBmb3JtYXQgdG8gYnBwIGluIHNfZm10DQo+IA0KPiAgIGRyaXZl
cnMvbWVkaWEvaTJjL292NTY0MC5jIHwgMTE0MyArKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgODMwIGluc2VydGlvbnMoKyksIDMxMyBkZWxl
dGlvbnMoLSkNCj4gDQo+IC0tDQo+IDIuMzUuMA0KPiANCg0K
