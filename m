Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0C27D61BF
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 08:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbjJYGjq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 02:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjJYGjo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 02:39:44 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E8DB0;
        Tue, 24 Oct 2023 23:39:38 -0700 (PDT)
X-UUID: 424708c8730111eea33bb35ae8d461a2-20231025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=TzZRtm184GBRvvv0oEurMmQduucwtPO/RQ88+gzKgcQ=;
        b=J4GtM4jJ0ENS7Y0FKE4pPM9eKRpXA2VGOH3JXXdgvT+0rcrhCCGmrMXvrsG4B1DoXOYeDki13UA1WgvsYJy7Pm9zVtHx/DI8GoKEuobyJn85zie4BqbIATSMGswpQMX+3DLP1AGrqxRNdKMhJJmH3MIYnmsrrHeCb0o2YrrRgCc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:6b317c2c-a678-46af-a686-c9b7ce249048,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:6b0fe328-cb22-4fa7-8134-287af20ad1fc,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
        DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 424708c8730111eea33bb35ae8d461a2-20231025
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
        (envelope-from <jason-jh.lin@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 75358473; Wed, 25 Oct 2023 14:39:33 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Oct 2023 14:39:33 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Oct 2023 14:39:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSFAWz9ERFOenjLcBj3UVOk98FiSye5Os3IWzpg1/TJghyFWD3e8wSZh9+Y0OE4cmwVTA36OGnLvHtw/gQSoUCqadHWIa9RbKcfgUX/k5AK7h1GIRou1+0vLEBiQMPo8J0zMlUM7B3FJcC+CReignkVJBi/Nl6uKrNn7XNAEazQgwKf0VHbcSPBOLCvX0xd08FW/xf8cuLFewFLBqzOdf74wb4zBT9Q137pgExpYG4Vsps+3JKfpKYUuqky40Ew97QVyW7VW7As+axy8pVdqGkFcCrctMU+BjJdWqhq+9sVAKQIorMcIDxodRm6QsgNnzgZNdT/8+U/kYFQeYVH6eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzZRtm184GBRvvv0oEurMmQduucwtPO/RQ88+gzKgcQ=;
 b=kI6qVsqJaQg1sLHF/xGcv8i04dH69cT85a7yIM2LQrPhYDdthKXO7r54YWFxRZn7lk1xuPwStDS0OulYU6yifu50bYd89y05Gij+FtuCAyo9FdAnnA6jA+nrPsD7mYcEDKDoxP92Ht4ntcGj9i+3+m4tpxauwjfGU/drcA3puMhdp1RSwOf1/kFzdahAGpI7AX+6VEXDIwD9a1RM4xOG37fwApeZtUFDAy6uavOowgmQOdj08IENE5qtUsWyLDnU32V7OjLd22N5DJum1ZdyVrk0eqo6zVWb65zTvgrHW0r+Dv1X9bwE54LgiONGsAzlYqw9FzOy/+c1gXT/Xj+mGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzZRtm184GBRvvv0oEurMmQduucwtPO/RQ88+gzKgcQ=;
 b=L+tb/nbzZjK7QJDfM2j5eHdEa/vfP4m1c0jqzGjIjHNjfcmkmLju+wA66E24MYXuu9Z8szc9OEzri11e+OiY/+vPwFsJbnO94/XFc0B90HWvRTfasUj6uGt4yvNb8DkE+7V8kDvIrrD6M10s347zv6i/TJAv23AP3o9y5YssK90=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SG2PR03MB6537.apcprd03.prod.outlook.com (2603:1096:4:1d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
 2023 06:39:30 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::8c0:a8fa:8e5:159d]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::8c0:a8fa:8e5:159d%7]) with mapi id 15.20.6907.025; Wed, 25 Oct 2023
 06:39:30 +0000
From:   =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= 
        <Jason-JH.Lin@mediatek.com>
To:     =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "angelogioacchino.delregno@collabora.com" 
        <angelogioacchino.delregno@collabora.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= 
        <Singo.Chang@mediatek.com>,
        =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= 
        <Johnson.Wang@mediatek.com>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= 
        <Jason-ch.Chen@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= 
        <Shawn.Sung@mediatek.com>,
        =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
        "jkardatzke@google.com" <jkardatzke@google.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 04/11] drm/mediatek: Add secure identify flag and
 funcution to mtk_drm_plane
Thread-Topic: [PATCH v2 04/11] drm/mediatek: Add secure identify flag and
 funcution to mtk_drm_plane
Thread-Index: AQHaBWvrGfz3uVxX6kaFpHwsv4Tbh7BYS4wAgAHFnoA=
Date:   Wed, 25 Oct 2023 06:39:30 +0000
Message-ID: <0ef62165e31baeb189f9e85891d6995f6bc1c60a.camel@mediatek.com>
References: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
         <20231023044549.21412-5-jason-jh.lin@mediatek.com>
         <b639b18e073e0eb38c439410c753f61486762a10.camel@mediatek.com>
In-Reply-To: <b639b18e073e0eb38c439410c753f61486762a10.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SG2PR03MB6537:EE_
x-ms-office365-filtering-correlation-id: daedfcb6-2237-43ee-c147-08dbd525243f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eHLPfq2FaKPYSq0fxQSSyn6hRZpzAa4hZD2C6eR3PHV3ORI0z8uCDcfifgphRTt2SNwZsghYHheZ74bIK6SxC5PIueKPDS7rlEZIgo9bNWmlxHpqHlJUTmSvvF6znpDd1JPTFOWzBRtpWzidhEvUpB2KNGCNjw5ycE83GKfekM3jEayvu5zJqcZsr1pWlq7CMEIhhurBPmBmDRS00t9qdk3OjVkeloxK14Z2ZIBvNN94Ckh1IvfHB4R8XzmgYWOxbOznDD9Uf2QrrLmlLfVjhwtrfryp/XiDD+oFVZz/q3AFll5W5lmIGvByQTaqGeRXYwOovMQbG2p3qQUgwdBulJNVA3fkVWBWMcNRukvIcQ1ZaZwdbc7FetVDvTBjBOwvBqknjQK0gYlWZEWEtlZTk7kz+ifrFEgQjzkjVw44OhNX8WHj/9LjcnTnGsGABdIWpz7dsrUq8DD3IKbwBV9ueATJAezQcwq4r4o95mYoZRmu8Si/7dmxB3hLKl7gq8eMn6hjNKpn8WzeQtWZfajHUIADorB+A5+1X0FVROuTHgvGDY0/r073mCoPkkq2sUIkmuAuXVF/JmRnizNxl/Lxkvau+cwyKraYiKaLt4E7zF6U6h0+p2mc5gbtb29JIcygGXKYcCJvew7eNARQVnBfqnmOyr5aZ67gG1x3KDPV/A0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(366004)(136003)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(38100700002)(4326008)(5660300002)(8676002)(6512007)(85182001)(2616005)(316002)(86362001)(36756003)(2906002)(64756008)(66446008)(66476007)(66556008)(8936002)(76116006)(41300700001)(110136005)(66946007)(7416002)(4001150100001)(4744005)(6486002)(54906003)(91956017)(478600001)(6506007)(71200400001)(122000001)(26005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amZiYlZnb3IrSUgxZDhwUk1yUTdlSEtwMElDdXFYbjZ0TXMybFAvZTVINmJi?=
 =?utf-8?B?KzFYSDZXY0pnQnVCWVBBT21SNmNUd0dpdDdQcDFSYWtnaGdJRU5scUdkRUkv?=
 =?utf-8?B?WTVVeHdjSXpMemxWdEVVU3hvVmZLa09UOGIyaXRLRjVZNks4NEVyVENwRmlu?=
 =?utf-8?B?U3NDNjVOSWN6RzRjZnZraWZ0MjdFZWxuODZCc3I2a3EzV3hTekR1L3JPVUV6?=
 =?utf-8?B?UWQreGxtUEJVWCsvWXR6UXYxRnhnOCtoa3NTenZYa3JtTmkyaEJUaXJoMklG?=
 =?utf-8?B?MUVBU0F5UFBrODBqOTFhUVV2TnJXWnpGQXhjWkZwblJ5NFQzSERpL1dlaERU?=
 =?utf-8?B?R1RxU01CNDd0ZkpMWWs3eHRIZEFoSkMzWDhGMjNTMkorRXk4c3lGcE9adVlR?=
 =?utf-8?B?WmQ4TzQxT293MkFzL2tpUjc5OGJWekYzb21lWHlTajdEc3V5MzM0TUZPU0x0?=
 =?utf-8?B?ZWRHcmxKaEhqaDh4TmUyemhFKzl5S3JkT3MyKzZTeWxPelM3UFBsYXNQTFVx?=
 =?utf-8?B?RTRiSUwwNmgyTWdjMHZwaWZzQ0ZMN2p2WTZtSHdiTC9hUUhMZ3VuU1EyOXVY?=
 =?utf-8?B?Zk0rbFN0Wjl1d21NZE5nbDdUSXdBTnpzUUlFTTl4UFBPS1NiN3RrdzJwYk1H?=
 =?utf-8?B?ZjN6UDJvVHZHSU1tTUk1SkpFMWZDSlAvaSswNHRSVGdJdzhBSng5TVhIdFUy?=
 =?utf-8?B?Tk5JQXFEWFVMV0Fkc3g1UERqUW1kRHgvK2xhamFUT2thUUszdjlhMnUwTnNz?=
 =?utf-8?B?YXhhUGxPWEIzMWlpVFYxbVdUSVhqamV4c09FdTFBSDhlZUN5Rlk2d1FIdGps?=
 =?utf-8?B?NlkwSUlQdklYdVViQ0lxUXFOcHYzQk1UVTl3d3FSeGhuMHRQeFRjOGdkL1du?=
 =?utf-8?B?UWZXRktGSHVFUVVjVHgrQUo5bVJNNHB2eVZUVVZjV3VXZFoyZkNjWVBuUDNw?=
 =?utf-8?B?OHRDMjNidUNhRXlkZzg5VlJ0OVI0aUttL25YempPaFdGVnZTMEs4NHYybkE3?=
 =?utf-8?B?Z1VETzBydnRtOXVBeG5xanFZT1hKQ1BqdFpOaWtUd1FNRk9YVHBGTUxIQ1Vj?=
 =?utf-8?B?UzMvaUdTS3Z5UG1IczRkazc0R2xqSHpIcGZvZGc2SWNXbk02NWdNMzlnT1k4?=
 =?utf-8?B?TVYvN0ZDSzl0cGlxWkJHUE1uMEhQR2trSEQzOEcvMVlxVk9ZK3BLNThOVkFr?=
 =?utf-8?B?UzNob0FGTStNR29GcEpabXhoc0xPbktpcHVHUjM4cXZtWHlYaEJzWExHNWo3?=
 =?utf-8?B?TGd1cU1ZYkprVWFvS1NpZ3dIMTJOR2gxMi9Kb3dndWk4M1NsVFMrdkljZGpj?=
 =?utf-8?B?MkM4T2ZQYjVsKzUvZTdzMUs3ekZXUHB3bGhqMG9CQlhJRjd4SitTQkZUQjU5?=
 =?utf-8?B?Q0pRV1padURhQU1kRlMyNmwyYnIwK1c4NitaaEhSOG85eFZ6WmsrVFdzTXdF?=
 =?utf-8?B?bjFMc1VWUjM3MkVHdnJCdnljeEVsU0ord0RzNm5TN2xLZjFKZDJsYXBKZmpP?=
 =?utf-8?B?VW9JQXdlNTNQQitOUjF2ZDhmQUJqYVlkbWtFOWR1U05jMXhqVGNnaDloYW9h?=
 =?utf-8?B?Wmh4RHJabUh6U2JBSzZrYVF5Z2lCYjd0RTlROFkyZzJNYW40VnVmTHRtT2cx?=
 =?utf-8?B?YjBSVTZsY1kxK3Q0azlqK0JxSXRzRC9NUzF6QlZXa3U4OEZSUHhUaUhqdG0v?=
 =?utf-8?B?eVZRRWptckpaOFIydFBUUUlFalhWWDBaQmNWUjJJNS82VnRNb2IyaHdMTktE?=
 =?utf-8?B?V0VlaDQwWlBkTjVhNExGWWdGZVVjeW8yTWRWczdxUTdneTA3N3JxMmVIVDZ0?=
 =?utf-8?B?b25BSUxZTE8yaGphNXRVMS9qWjJvV3cxZkhZczVhbi9iLythdThhUllFM0tJ?=
 =?utf-8?B?M1p3TTdmM0EzTVV1NXIvZkx0VlF2cnpPazBjZ3ZscXRYVkZObDVVV3Y5WTRy?=
 =?utf-8?B?aUVLdkE4ZThPaG9TKzcyYThucE9ydVRMeFRJTXVSdnl3eEhoUzRkQ3h5Yk1V?=
 =?utf-8?B?NDFKMDc5NlN1MzMyRWRNd2ZZOVpYV2E1aXpXdjV5c1dCRFR4dUpJZXFvdkZm?=
 =?utf-8?B?ZEhPeUpZd3dGbW9wY3ZkRFFNY25UZm4yL0xJSzdMUG5wdmFCKzZ3bnlSM3RL?=
 =?utf-8?B?b1I5ZTk3R0hJQVU1dis2VlhKNExvYk5uSVl0SnFELzhHYzJBRit5dXowM2p3?=
 =?utf-8?B?ZHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD82B217B7A31D4888E42042B1C7778A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daedfcb6-2237-43ee-c147-08dbd525243f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 06:39:30.1176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S0kokaYJIIPj9DRrzl9mClxWELd5ow3POYxDXtYyXYjkhS+fTrzp5qrqBD9ZGotmROpUJbYAzY5+KHw014q2eiJJFFAH3NgT2+vO4YKbjVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6537
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQ0ssDQoNCk9uIFR1ZSwgMjAyMy0xMC0yNCBhdCAwMzozNSArMDAwMCwgQ0sgSHUgKOiDoeS/
iuWFiSkgd3JvdGU6DQo+IEhpLCBKYXNvbjoNCj4gDQo+IE9uIE1vbiwgMjAyMy0xMC0yMyBhdCAx
Mjo0NSArMDgwMCwgSmFzb24tSkguTGluIHdyb3RlOg0KPiA+IEFkZCBpc19zZWMgZmxhZyB0byBp
ZGVudGlmeSBjdXJyZW50IG10a19kcm1fcGxhbmUgaXMgc2VjdXJlLg0KPiA+IEFkZCBtdGtfcGxh
bmVfaXNfc2VjX2ZiKCkgdG8gY2hlY2sgY3VycmVudCBkcm1fZnJhbWVidWZmZXIgaXMNCj4gPiBz
ZWN1cmUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24tSkguTGluIDxqYXNvbi1qaC5s
aW5AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9wbGFuZS5oIHwgMiArKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX3BsYW5lLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5l
LmgNCj4gPiBpbmRleCA5OWFmZjdkYTA4MzEuLmZlNjBlMjBhNmUxYyAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5oDQo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuaA0KPiA+IEBAIC0zMyw2ICszMyw3
IEBAIHN0cnVjdCBtdGtfcGxhbmVfcGVuZGluZ19zdGF0ZSB7DQo+ID4gIAlib29sCQkJCWFzeW5j
X2RpcnR5Ow0KPiA+ICAJYm9vbAkJCQlhc3luY19jb25maWc7DQo+ID4gIAllbnVtIGRybV9jb2xv
cl9lbmNvZGluZwkJY29sb3JfZW5jb2Rpbmc7DQo+ID4gKwlib29sCQkJCWlzX3NlYzsNCj4gDQo+
IFdoZXJlIGRvIHlvdSBzZXQgdGhpcyBmbGFnPw0KPiANCg0KSSB0aGluayBJIGxvc3QgdGhhdCBw
YXJ0IG9mIGNvZGUgaW4gdGhpcyBwYXRjaC4uLg0KSSdsbCBhZGQgdGhlbSBpbiB0aGUgbmV4dCB2
ZXJzaW9uLg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCj4gUmVnYXJkcywNCj4gQ0sNCj4g
DQo=
