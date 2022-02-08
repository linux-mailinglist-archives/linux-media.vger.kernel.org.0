Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC3184AD2BF
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 09:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348885AbiBHIHQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 03:07:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348829AbiBHIHE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 03:07:04 -0500
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Feb 2022 00:07:01 PST
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0536CC03FEC2
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 00:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1644307620; x=1675843620;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6+oYUO1FUCBjYJ9K8mLQWI4eWTzyhvl4Ao60hP1xGFk=;
  b=j/zKovhqR0kqVf83QyDX72oNPNiQwipJbGI995IP84gUAvRpIw9df/S5
   UT9i33bGmoZnPDaeaK+s/yf0ALKG4GHEPki3hzKtHthvn3bsq6246bgI/
   COHqUeipdZaDgGtBVx+6ln5JME6uaFPozAxgQU7gI2KLHVGrzfUkSM1wl
   OHs0gVMqcfXAUpKlOpf+QTYyz43sPYAW1KAFJY9CV7UvM2lZBpywY3m3b
   D0Qy18YGUjn8fQGBmsCnBQQnfNBVc36SyA3YLwXrkC/nH5QeE2jMS3NZw
   +InAbV0pEyCE2/JR+ZQAuJoLmv5RN818vKjcA5U/seBPDaU1zBskziX1W
   A==;
IronPort-SDR: furymJ7v0W3RlBLT/6+BPoczg0Oq7o0gO6IxPdYRfJS6qdxwzzTNf6ISrIdABBr80kHhKa8QQ5
 fdT/tNxcd9hxoo79r/Ux6YaugVNsp/NsZsIv9naLbZJcPHoS90Y7Vf8FvrBw3Pn00kzfhwHi1z
 RMG9xvQI+tJmiVyZgkj2pgH5KVhkeimCMcm9EW9HJA7Mt4h5jYeKMjpf6hvH/04tPS4l1Yxiqf
 1FZg3khuv4KiG6gXnQNKuiv3SMpz3Q93EfR9z7jTLuTl/EujL0rZj2b92N0r2XQZ6dcK9P4RTa
 hmx4DWVga6mISyYmPx1DdwB8
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; 
   d="scan'208";a="152807112"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Feb 2022 01:05:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 8 Feb 2022 01:05:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 8 Feb 2022 01:05:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIh1ss7E3ztcP8eQ0dOWdIeEqreOZrOi+KWlYRt4TqdJVhZTAuDolOFNda7UKAtyMGkqU5Bpv0Vdq4Qr0PK6o+WkaAlwB3VAUTyKlTNTGDeh40ha/eZ7i7J9Ofp/Nk0lxyODg5zaIMV0Kysie5sgQku2cgDH7lEZY6U+dfoAsn6yatFzud27+rIFN4cHOTRhGERSQ3V2pu7MVzkGATmOxEJTPeVcklYYh3i8RVqYbggfQZ3U07W2txdpHeq+mCNxg7SWGmoYMyLzrYfh/rBZsGfVbxcAeZvW/EcrwuyTP4qsDHeyoTO0Kxy9SjEwirYz+pP1fXPfwp+i2dePiWV2NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+oYUO1FUCBjYJ9K8mLQWI4eWTzyhvl4Ao60hP1xGFk=;
 b=VU5Ie+JLf6W9bTjHRIyqFwifgmUH1iTS+OJpsLzgchWJYZ68OKLSNyAB9iVKtm7U1wLqq4HmcVPR02JdKi4xAahU6jN+6Z4ObnL6mnqP34rVe122BihumTrbEhr//BW1Lp+etprRou2stb59xxH6UIAzFc8Dv/fiwK/ggLIa90dZpltkQzmpJ4bjz7KUyI448O3RgOs9ivH7HheAYKyHjdPb6MGbs1RSClRcQZSI1LSIuMAN4iWJg5PZ/lfM3nwaXuVUiV4Xa0ARl9tn1tisirieYRu7iqoNwhGUJpdAL74gJpERznvK36f/HifjuXPIWkr/YLArkiaUcvKbd+O4FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+oYUO1FUCBjYJ9K8mLQWI4eWTzyhvl4Ao60hP1xGFk=;
 b=ULoMBtY9d/7JMAiBspdCIkhTMzEEvbbkcRxrE+xnKdISmqIwSzsyjTQw3NN1tl3NpPsbAcTzicVenoit8LcSD5eopYEDLmtc+sigaobUhl9KGuQb2cGqimgEtd6Hl4lWABOeLomlpukZuIumfyQk/bA0Nq9J1OWhlvYeuHMy7rU=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by BN8PR11MB3633.namprd11.prod.outlook.com (2603:10b6:408:8a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Tue, 8 Feb
 2022 08:05:56 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc%9]) with mapi id 15.20.4975.011; Tue, 8 Feb 2022
 08:05:56 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <mchehab@kernel.org>, <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/1] microchip-csi2dc: Remove VC support for now
Thread-Topic: [PATCH 1/1] microchip-csi2dc: Remove VC support for now
Thread-Index: AQHYGErW4A/BdhOeLUW3uTV7RDBBc6yJJBKAgAAvKoCAAAGTgA==
Date:   Tue, 8 Feb 2022 08:05:56 +0000
Message-ID: <0a2d4d0d-f95b-c6c7-e6c0-9ed1c697d709@microchip.com>
References: <20220202153609.240387-1-sakari.ailus@linux.intel.com>
 <20220208061129.158ba126@sal.lan>
 <ed240352-0588-d963-2b0a-7b65280e96b0@microchip.com>
In-Reply-To: <ed240352-0588-d963-2b0a-7b65280e96b0@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f5b8122-c963-47b7-28ca-08d9ead9d5ce
x-ms-traffictypediagnostic: BN8PR11MB3633:EE_
x-microsoft-antispam-prvs: <BN8PR11MB3633E9E02045A17096E2206DE82D9@BN8PR11MB3633.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B6OV9wmbORZTeYgLr0brSPJb7qovp2ApXjBx41GYiixpBk4mTQrhEwujVuXHNzTXy8HhjBOV+73zzXLVGqqvgb4oM8ghDME7/UmyLMNVVUNWwuKxYfIP4nYLRRH6vlyVjc0qiZqqtiicIHOvaH5TINJzYy18UWk4g+4rrAg9iwl067F/2YSk6Gog5j9BskhgxfkNEha7C8bZnmfN0DaY+/oPDxiBYlLp3YbPY8p6Q0Wq/ndbL4f0GInDqgC5iBS+w3hIHGvDdcBkc201/abG/zpE2RbYJ6ZiahYV/ICEotfGJKIHQ8xqNGq9BKlsABZ9HpJzBTOMFFU0CuVW87ajSgynrbOi58GhNbEY9mUuh0qXv5kzaTBGMkcIXLmDmELFvClYpajqwzffvg5fppghl6y5+8kZ1VkWr0cJzw95cQe7bdB7uK54gh9ah5y/BEXqqMDusELslpg0Q3t9TjiF+nwUFAsJWQG7gF+FlpwVcaNi2VsQOuuGGTUa2bIOzLhEBiGoO3s5R65g+S/mi6hd+4332qqqE8/wO5YpT5FyFDEK00cs4bBQb/Lq+9nbz0+1yasv7ghXfbaB//hRwjZyUYrF8xgMXlmNS277yqk2oD4HXie3aOFg5GplRai42IawOO5b7Gp7hrUzepe1ZMBhsclgJx2H2ZEN6Ovvg7bZKxP2RgxF7mupMcXOOLr5ZX6uQ3oTKqHywOSbVRs9thnii8MbMLjKSjHa0DdiQOS8bNlBrNaUMpb4fg5vHVaWv3IM1AyAzyRKwazegekyLVHTiw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5384.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(6486002)(31686004)(2616005)(86362001)(508600001)(122000001)(38070700005)(71200400001)(110136005)(54906003)(38100700002)(31696002)(2906002)(186003)(36756003)(64756008)(66446008)(66476007)(76116006)(66946007)(66556008)(6512007)(91956017)(53546011)(8936002)(8676002)(26005)(5660300002)(83380400001)(6506007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVBzK0VoWVlzdmwzYlc0NFNNU3JscnNxWE52d0JoRFc2dUU2ZWxsVVBjais0?=
 =?utf-8?B?MHVkL0lBL1ltT2NibTZ1cFdpcXJ6L1hCVnpSU0Y2VzRmR2toNU9nOHhpMUgw?=
 =?utf-8?B?MVVUcDJwQWc1aXN0WG1EU2xsdnNiVU8wQmZ1RUlXTVhTVWtNWERibk5MbWNt?=
 =?utf-8?B?aWRUcHR4d1YydlRIK2gyUE55cm14MlUxYWVCL0R5Y25ZWmpoYzg3TWczWldw?=
 =?utf-8?B?djladGh1R3BpeEFXc0xPaGtQbHZCWElqM0p1bTNlcTVoU3VWU3pZd0E5Ylhw?=
 =?utf-8?B?djROQUQ0Z242azdMREVsZ3hFbzRIUE1uQU1rdXU2dzN4bnMyWFFTUFRuNzhU?=
 =?utf-8?B?VnNTT1NkY3Zkd2ljQUdOMm9nWXNJQnRtaGN3QWs5YXNVS2VkcGkyNjlWVUx2?=
 =?utf-8?B?c2h4eXRORjFWYVhZSWVWb1hWWWNxRFREOWowVVNCMzEwRjZsbDA4N1FKTkZW?=
 =?utf-8?B?QWdxbkgzTlNockpNQXlTaGpzMEZwaC9BNHg3WmF2bGpPNFFOVWFPNU9CTW9E?=
 =?utf-8?B?SDE5OWhCamtUdkozZUlRY3ViV2ZrZlQ0NUt6MElod09zVE9mcGRHblo0RHJQ?=
 =?utf-8?B?OFdKeFpkeVgvcC8xUUxxdHIyZ3Fwa0dud0pNSjgwZGYrNm4zWXNENDh3YkEx?=
 =?utf-8?B?K3lKMk1SL3k4ZmtMWDA5T3hBT2kwOXBjSnpIVVJlWWRVeWhhWE5TMTBPMXZ3?=
 =?utf-8?B?cGw2NGxxbUhxNHNHdnBpelhDcG1BNXpHOEREbjJKSG4zYWk4MlM1cGhKbVRC?=
 =?utf-8?B?Rm9xOGErR3E5VFBWVkVQTVdwYy81b05OVjZ2bjQ3Mm9LUEpPQlhLQVFvZ0lN?=
 =?utf-8?B?cEhFTXVYcThsVGFoNld4MDZQVHl5cHdCNnU0ZGg1VmoxOHRvNzZRSU9NN1NS?=
 =?utf-8?B?cjdISlJEREhzSHVCWitWSXE3Vm84V1dyY3RXMTN2eStsS2gwSGtXRC81alY1?=
 =?utf-8?B?WnFIT0pxNUJlbkNiZ1pXQ29vcy8xRGY5eis5Kzk3OXRpVCtIT1YvMk1FVUNE?=
 =?utf-8?B?S21jMnVmVUdqREFYMjNZMEp1OWdHZTRwRmpXUEVXSlB4eEI5K1BFdWRqeUlG?=
 =?utf-8?B?RG9uZ1lDMU1HM2xOVmN0WklYdG1SSExwZU0zN084NFVEYlluTGVvMy9mNXBu?=
 =?utf-8?B?LzhySWlMMzd2UWg0ZU9aQ3NIMXNPVlBPTEFTS3U4cG56amRseHZkK3ZZK2FJ?=
 =?utf-8?B?VXU2SjAwdWFDZjZrd0tDYTQwdjRFRHd1Sk5qQ2xCbjU5cUdHaEVUQjYzSEhC?=
 =?utf-8?B?a09EdmtvbEl0ZDlHalBNUmFGQTYzVW9Lbks5aUhNbkN0NktYbWRPa09EY25X?=
 =?utf-8?B?Vm5qSkF6OVRLdWlGZ00xSHd2ZEJGNTZBeDFDUkJRS1F3Tm1iV0RXNU1OV1NW?=
 =?utf-8?B?T0hRMXVhMTVIbGQ3bG1BZFV5RTl1UkVZYkZmNU1wNlhMYkg2bVoxK3h3eUxU?=
 =?utf-8?B?V1pjcnVuaTZaTFlJOHNLSkRuOGJ4RTFEU0FGaFFnd2N1TXdzSzVqQU1BMmdt?=
 =?utf-8?B?WUhBZ1FYNG41SHd3eStEb3luZDluazIrazcxRDZsc21BQ3grNzV4dFM1TXky?=
 =?utf-8?B?bzJZQkQzcmg0ay93Qkt5akxaVFVsTnpKK1IzZ3djSE5mQllTNmZ4N1lrNkhR?=
 =?utf-8?B?ZU5wUWdXVHRMc0dqbEpDcmNGSHZtYWw5KzJReDlpNE1iUU9lZ1prbjZzSFQ0?=
 =?utf-8?B?WVIxYnhYR28xdXcvcXlSQ0gxWkRBQXA0eXZ5TmswTCs1RmZFQXdTUTFwOCti?=
 =?utf-8?B?akp5aUQvS0dhcHI3THF5b09yMlAxcUFHUTNScGl3M0NZbSsyQ3JIei9qdXNC?=
 =?utf-8?B?dWp5clRNWncxSGtrWjFLWmVDT3hFWTREV0Rmd2RTWFkxblp3MENncGdPanhQ?=
 =?utf-8?B?T2FRZ1BPTHlDa3N4bU5veFV0UWY3clo2a2hZSGUxRHhYNHRhQ2E2ZW4yMmJW?=
 =?utf-8?B?dW4vbGJ0YXdjTDFGbHZ4YkZldXhpWWg4ZWVTQ3h2Z1UwM2FWMWdmSk9RdmVX?=
 =?utf-8?B?WFlEVk1aZGlvaWtxY1cvSlJQM1pLUjJ6Y1FSTkFaRUlaQURQWXROWnFkNy9P?=
 =?utf-8?B?ZHJ4YzgyZVdzdFc3YklzcytSL3RmOHIzNUY4dHZsZDE1RDN2RnJ2Q3hnT2Nj?=
 =?utf-8?B?REdDV3NFZFA1U2lGbGRjNVFhZnArbFErQm5vUVZNVngzMm9wYXVnU0YvdHNk?=
 =?utf-8?B?VmlnV1NPTFFkcVpXZzJLMlJnMC83c3VtRHAzNXFRQWxaSFMvWmxtNTJuNy80?=
 =?utf-8?B?K1RYZEVaWnpKMmZBc3RZd2NsOS9BPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DB412E023945642B3B6A03FF4CD1870@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5b8122-c963-47b7-28ca-08d9ead9d5ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 08:05:56.4559
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7vsrNuU1/zAKDxNQxridazdpCEhAaZvOWpJLfAREf+KDPlEWWhSs8K0OUh6DV1tsqtFSL4t3XnzBsUS4AcUEIYpZ2FE/hXzF2a5Q/PDYkl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3633
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMi84LzIyIDEwOjAwIEFNLCBFdWdlbiBIcmlzdGV2IC0gTTE4MjgyIHdyb3RlOg0KPiBPbiAy
LzgvMjIgNzoxMSBBTSwgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIHdyb3RlOg0KPj4gRW0gV2VkLCAg
MiBGZWIgMjAyMiAxNzozNjowOSArMDIwMA0KPj4gU2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNA
bGludXguaW50ZWwuY29tPiBlc2NyZXZldToNCj4+DQo+Pj4gQXMgcGFydCBvZiByZW1vdmluZyBt
YnVzIGNvbmZpZyBmbGFncywgcmVtb3ZlIFZDIGZsYWcgdXNlIGluIHRoZQ0KPj4+IG1pY3JvY2hp
cC1jc2kyZGMgZHJpdmVyLiBUaGUgc3VwcG9ydCBjYW4gYmUgcmVpbnRyb2R1Y2VkIGxhdGVyIG9u
IGFzIHBhcnQNCj4+PiBvZiB0aGUgc3RyZWFtcyBwYXRjaGVzLg0KPj4+DQo+Pj4gQ2M6IEV1Z2Vu
IEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZAbWljcm9jaGlwLmNvbT4NCg0KSGF2aW5nIGEgY2xvc2Vy
IGxvb2ssIEkgYW0gYWRkZWQgaGVyZSB0byB0aGUgQ2M6IGxpc3QgYnV0IHlvdXIgZ2l0IA0Kc2Vu
ZC1lbWFpbCBkaWQgbm90IHNlbmQgaXQgdG8gbWUuIFBlcmhhcHMgeW91IGhhdmUgYSBDQy1zdXBw
cmVzcyBhY3RpdmF0ZWQuDQoNCj4+DQo+PiBIbW0uLi4gdGhhdCBzb3VuZHMgYSByZWdyZXNzaW9u
IHRvIG1lLiBXaGF0IGVmZmVjdHMgdGhpcyB3aWxsIGNhdXNlIGF0DQo+PiB0aGUgZHJpdmVyPw0K
Pj4NCj4+IEV1Z2VuLCBhbnkgY29tbWVudHM/DQo+IA0KPiBIaSAsDQo+IA0KPiBJIGFtIG5vdCBo
YXBweSB3aXRoIHRoaXMgY2hhbmdlLiBJdCBsb29rcyBsaWtlIEkgd2Fzbid0IGV2ZW4gQ0MtZWQg
b24NCj4gdGhlIG9yaWdpbmFsIHBhdGNoIGUtbWFpbC4NCj4gDQo+IFRoZSBlZmZlY3Qgb24gdGhl
IGRyaXZlciB3aWxsIGJlIHRoYXQgZXZlcnl0aGluZyB3aWxsIGJlIHRyZWF0ZWQgYXMNCj4gdmly
dHVhbCBjaGFubmVsPTAgLg0KPiBJIGRvIG5vdCB5ZXQgdW5kZXJzdGFuZCB3aHkgd2UgYXJlIGFi
b3V0IHRvIHJlbW92ZQ0KPiBWNEwyX01CVVNfQ1NJMl9DSEFOTkVMXyogYXMgSSByZW1lbWJlciB0
aGlzIHdhcyBqdXN0IGludHJvZHVjZWQuDQo+IElzIHRoZXJlIGFueSBhbHRlcm5hdGl2ZSBpbiBw
bGFjZSA/DQo+IA0KPiBNeSBvcGluaW9uIGlzIHRoYXQgaWYgd2Ugd2FudCB0byByZXBsYWNlIHNv
bWV0aGluZyBleGlzdGluZyB3aXRoIGEgbmV3DQo+IEFQSSBvciBzb21ldGhpbmcgZWxzZSwgd2Ug
c2hvdWxkIGZpcnN0IGFkZCB0aGUgbmV3IHN1cHBvcnQsIGJsb2NrIGFueQ0KPiBuZXcgYWRvcHRl
cnMgZm9yIHRoZSBvbGQgQVBJIHN1Y2ggdGhhdCBldmVyeW9uZSB1c2VzIHRoZSBuZXcgQVBJLCBh
bmQNCj4gb25seSBhZnRlciB0aGF0IGNvbnZlcnQgdGhlIG9sZCBBUEkgY2xpZW50cyB0byB0aGUg
bmV3IEFQSS4NCj4gU28gJ2NhbiBiZSByZWludHJvZHVjZWQgbGF0ZXIgb24nIGlzIG5vdCBva2F5
LiBXZSBjYW4ndCByZW1vdmUgdGhpbmdzIGluDQo+IHRoZSBob3BlIHRoYXQgaXQgd291bGQgYmUg
cmVpbnRyb2R1Y2VkIGxhdGVyLiBKdXN0IG15IHBlcnNvbmFsIHRha2Ugb24NCj4gdGhpcywgZmVl
bCBmcmVlIHRvIGhhdmUgYSBkaWZmZXJlbnQgb3Bpbmlvbi4NCj4gDQo+IEluIHRoZSBlbmQgeW91
IGd1eXMgYXJlIHRoZSBtYWludGFpbmVycyBmb3IgdGhlIHN1YnN5c3RlbSBhbmQgY2FuIGhhdmUN
Cj4gdGhpcyBjaGFuZ2UgaWYgeW91IGxpa2UsIEkgYW0gbW9yZSB1bmhhcHB5IGFib3V0IHRoZSBm
YWN0IHRoYXQgY2hhbmdlcw0KPiBoYXBwZW4gc3VkZGVubHkgYW5kIHdpdGhvdXQgbm90aWNlLg0K
PiANCj4gRXVnZW4NCj4gDQo+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFNha2FyaSBBaWx1cyA8c2Fr
YXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT4NCj4+PiAtLS0NCj4+PiAgICAuLi4vbWVkaWEvcGxh
dGZvcm0vYXRtZWwvbWljcm9jaGlwLWNzaTJkYy5jICAgIHwgMTggKystLS0tLS0tLS0tLS0tLS0t
DQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0p
DQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9taWNy
b2NoaXAtY3NpMmRjLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL21pY3JvY2hpcC1j
c2kyZGMuYw0KPj4+IGluZGV4IDZiYzU0OWMyOGUwNS4uNmE3ZjViNGIwZTNiIDEwMDY0NA0KPj4+
IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvbWljcm9jaGlwLWNzaTJkYy5jDQo+
Pj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9taWNyb2NoaXAtY3NpMmRjLmMN
Cj4+PiBAQCAtMzQ4LDI0ICszNDgsMTUgQEAgc3RhdGljIGludCBjc2kyZGNfZ2V0X21idXNfY29u
ZmlnKHN0cnVjdCBjc2kyZGNfZGV2aWNlICpjc2kyZGMpDQo+Pj4gICAgICAgICBpZiAocmV0ID09
IC1FTk9JT0NUTENNRCkgew0KPj4+ICAgICAgICAgICAgICAgICBkZXZfZGJnKGNzaTJkYy0+ZGV2
LA0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICJubyByZW1vdGUgbWJ1cyBjb25maWd1cmF0
aW9uIGF2YWlsYWJsZVxuIik7DQo+Pj4gLSAgICAgICAgICAgICBnb3RvIGNzaTJkY19nZXRfbWJ1
c19jb25maWdfZGVmYXVsdHM7DQo+Pj4gKyAgICAgICAgICAgICByZXR1cm4gMDsNCj4+PiAgICAg
ICAgIH0NCj4+Pg0KPj4+ICAgICAgICAgaWYgKHJldCkgew0KPj4+ICAgICAgICAgICAgICAgICBk
ZXZfZXJyKGNzaTJkYy0+ZGV2LA0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICJmYWlsZWQg
dG8gZ2V0IHJlbW90ZSBtYnVzIGNvbmZpZ3VyYXRpb25cbiIpOw0KPj4+IC0gICAgICAgICAgICAg
Z290byBjc2kyZGNfZ2V0X21idXNfY29uZmlnX2RlZmF1bHRzOw0KPj4+ICsgICAgICAgICAgICAg
cmV0dXJuIDA7DQo+Pj4gICAgICAgICB9DQo+Pj4NCj4+PiAtICAgICBpZiAobWJ1c19jb25maWcu
ZmxhZ3MgJiBWNEwyX01CVVNfQ1NJMl9DSEFOTkVMXzApDQo+Pj4gLSAgICAgICAgICAgICBjc2ky
ZGMtPnZjID0gMDsNCj4+PiAtICAgICBlbHNlIGlmIChtYnVzX2NvbmZpZy5mbGFncyAmIFY0TDJf
TUJVU19DU0kyX0NIQU5ORUxfMSkNCj4+PiAtICAgICAgICAgICAgIGNzaTJkYy0+dmMgPSAxOw0K
Pj4+IC0gICAgIGVsc2UgaWYgKG1idXNfY29uZmlnLmZsYWdzICYgVjRMMl9NQlVTX0NTSTJfQ0hB
Tk5FTF8yKQ0KPj4+IC0gICAgICAgICAgICAgY3NpMmRjLT52YyA9IDI7DQo+Pj4gLSAgICAgZWxz
ZSBpZiAobWJ1c19jb25maWcuZmxhZ3MgJiBWNEwyX01CVVNfQ1NJMl9DSEFOTkVMXzMpDQo+Pj4g
LSAgICAgICAgICAgICBjc2kyZGMtPnZjID0gMzsNCj4+PiAtDQo+Pj4gICAgICAgICBkZXZfZGJn
KGNzaTJkYy0+ZGV2LCAic3ViZGV2IHNlbmRpbmcgb24gY2hhbm5lbCAlZFxuIiwgY3NpMmRjLT52
Yyk7DQo+Pj4NCj4+PiAgICAgICAgIGNzaTJkYy0+Y2xrX2dhdGVkID0gbWJ1c19jb25maWcuZmxh
Z3MgJg0KPj4+IEBAIC0zNzUsMTEgKzM2Niw2IEBAIHN0YXRpYyBpbnQgY3NpMmRjX2dldF9tYnVz
X2NvbmZpZyhzdHJ1Y3QgY3NpMmRjX2RldmljZSAqY3NpMmRjKQ0KPj4+ICAgICAgICAgICAgICAg
ICBjc2kyZGMtPmNsa19nYXRlZCA/ICJnYXRlZCIgOiAiZnJlZSBydW5uaW5nIik7DQo+Pj4NCj4+
PiAgICAgICAgIHJldHVybiAwOw0KPj4+IC0NCj4+PiAtY3NpMmRjX2dldF9tYnVzX2NvbmZpZ19k
ZWZhdWx0czoNCj4+PiAtICAgICBjc2kyZGMtPnZjID0gMDsgLyogVmlydHVhbCBJRCAwIGJ5IGRl
ZmF1bHQgKi8NCj4+PiAtDQo+Pj4gLSAgICAgcmV0dXJuIDA7DQo+Pj4gICAgfQ0KPj4+DQo+Pj4g
ICAgc3RhdGljIHZvaWQgY3NpMmRjX3ZwX3VwZGF0ZShzdHJ1Y3QgY3NpMmRjX2RldmljZSAqY3Np
MmRjKQ0KPiANCg0K
