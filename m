Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3007E13B3
	for <lists+linux-media@lfdr.de>; Sun,  5 Nov 2023 14:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbjKENgU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Nov 2023 08:36:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbjKENgS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Nov 2023 08:36:18 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D273ACA;
        Sun,  5 Nov 2023 05:36:08 -0800 (PST)
X-UUID: 42230a587be011eea33bb35ae8d461a2-20231105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=L7sZhwS+dWu5m7zkVIq9F2M6AYEsLlmDvxCOhgVc/t8=;
        b=H6atNLFLOzl9iFKCqUM5SgimSjn1JayqZy4rOGvzMb3ceEPJpWf4Fs8mu42pWZnkYqedUflYwvSF3aSNx9CAMjKfFeXdqJJayefjSoDdO7aGVbKVDqw/OQBtPHAfGRNXvfLbI8iVSTglLw+t0wZYFPgVeUxOeRaMhMpT9cehTNw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:1f10ec10-bcfb-46b6-9b20-6fa6d7085a53,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:b1b12afc-4a48-46e2-b946-12f04f20af8c,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
        DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 42230a587be011eea33bb35ae8d461a2-20231105
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
        (envelope-from <jason-jh.lin@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1977047925; Sun, 05 Nov 2023 21:36:00 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 5 Nov 2023 21:35:59 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 5 Nov 2023 21:35:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7nqGMmfVbkeH/4VyCMYiPrJuvSVZNiFCRceFxFHcTjluhjpCX4kCl+MrTiGJTjv/ohgTr20dQ7G82QxN5ZSggbJRD1XN0oogd3cItBLiB9/5p+cqe7fIHHiuWf04MCv24wZlWEFo1Qsyv/Qw10PByhkFMn5m2DBa39z51LUAkVXCx7ar0zF3fHe55SqUVPO0kPZAzbv4fFpkLURFMtNfY8DmlvdwVBqSYu+btX+FL/CRcvHQB8qEG6oZYSJK1NTqRpr+2lynHnuRLd6FLEWxiWBsinQ4UaMJk0g3/xAjXOQVof6pdpcHODa0GbYu0h0eyKnoRRGhSpxj+KV94p9/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7sZhwS+dWu5m7zkVIq9F2M6AYEsLlmDvxCOhgVc/t8=;
 b=ID4UvwamzLiSHhY9U4TaOr2Ub2Fc1tBadaYhTqo/mPx58Digv3ZvzE+zdZQKVzDCyFudfrN3uXuP5cSVVs6+NuEutPHAfbK/UWb2ympkKFdK2+7dgfuHd3puSfCuzf68Zx0QfSl56vu8Ht20w9cSDaoZ0cozqdypBYQkx/LvfCCtPcW8X0TuA3yA64uPYlYZ4P3XjYV6d+NGfxiVHCPKaVuu3tLe5IXHT49mvwtiaZ9wRHkjLpq0mizEGd2MRJnx0WxYQN2gjodohdkdyKD38AXu4QzFfUXlKHsecfK7HNYYd1SKwrj4rpYhzPa3yDgSxc3aJuEbD0tN9uc7e0fUHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7sZhwS+dWu5m7zkVIq9F2M6AYEsLlmDvxCOhgVc/t8=;
 b=I3TM9E21fzmJwffFRNeJi4eArHcYI/QnLGSDrek8LlikOvdYEjbeE7kSOr+6GFOifHZUJLkgU6Ezez6axR6dmrvvH+iKPmjx5/Dr9YEzKqv1Ym6wjVUB3wsxjb7Mi+ATXAnDmSZfYngHUBtpgAlpE/LBjn4lpUXTUmSFWpXPnSk=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYZPR03MB5647.apcprd03.prod.outlook.com (2603:1096:400:5d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Sun, 5 Nov
 2023 13:35:56 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::ebb9:e872:cb84:4a88]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::ebb9:e872:cb84:4a88%5]) with mapi id 15.20.6954.025; Sun, 5 Nov 2023
 13:35:55 +0000
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
Subject: Re: [PATCH v2 10/11] drm/mediatek: Add cmdq_insert_backup_cookie
 before secure pkt finalize
Thread-Topic: [PATCH v2 10/11] drm/mediatek: Add cmdq_insert_backup_cookie
 before secure pkt finalize
Thread-Index: AQHaBWvvI1CahMVgtEeLc9wOstYjZ7BbXOwAgBByOoA=
Date:   Sun, 5 Nov 2023 13:35:54 +0000
Message-ID: <393154d13115196fde483cc840393719a8844fc1.camel@mediatek.com>
References: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
         <20231023044549.21412-11-jason-jh.lin@mediatek.com>
         <7e856cd887d2f0319810f9b3ec50f9f5a52a8147.camel@mediatek.com>
In-Reply-To: <7e856cd887d2f0319810f9b3ec50f9f5a52a8147.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYZPR03MB5647:EE_
x-ms-office365-filtering-correlation-id: 34c20b41-be70-4b8a-5d03-08dbde0422b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1p1uNmxF2RMhZqPBmDApjof1CBi59OVgjmbXIfPmF/XPXQHzXiOXmF9qIAM0c2vkA59fYF/QndIc/+K8a5BVU5H9j/89RT8lYD/Taud6gZSZtGQLBfn11TmbtU5Pebhy/wYukGDaL6tMQOqbw19woKIqZI/+NZBRbr9rF62zxucSPNwv8FJlaqGqrKUvylo8Z9Jq8w0hR8rkCSrMjk2HJAopusvWqBdUMjzM7q9erqH2TQ+5ogkfB6F5x9qfJPQgmPtxelUXxDPNNdCLJx88amF+lqCldxUV2mlUMzUIp1cP6a0NxAdjSiBKaBn9vdwmzViYvDBvhx/0RnAl9oOYfBunvYDsBssI7Th+EGaYu0QZE39+m/VuRZmQo04ohJ2UcbMoKYveyjIkSdYu7W7jpzuyEfY2GNLpmXH0ypM55J/RfJMD8SX88RElNKzAk2R8PMRw7V07YFkHSIWgcQLAkPwrPoGDVYVQLoRsLaQ12VG7uUKv1E4R6gRtET2mfvZGiGRqL4ZM1Ruq0JWqARegiw+6uz/b9tJoZwxx+ksxQYgHGNooMMAN6sKrAovZtnBhUd4zJIbMxsQfql6si42dBOqxYJIt4av0sE7kKqdAftrkt5AtmEDi4aYGhMEr3IA0y+gYDhVA/YQd5f6Ttd6XRiZ1YocPhfHq1qshFUg8AJQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(366004)(39850400004)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(4326008)(7416002)(5660300002)(54906003)(41300700001)(8936002)(8676002)(91956017)(66556008)(66476007)(110136005)(64756008)(66446008)(76116006)(66946007)(316002)(2906002)(6486002)(478600001)(71200400001)(83380400001)(6512007)(85182001)(6506007)(36756003)(2616005)(4001150100001)(122000001)(26005)(38100700002)(86362001)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVQ1R0NFYldkME93clRPRHVtaTg4c09MREZadXY5ZzV5M29OOWY2U01PU0xV?=
 =?utf-8?B?d2dYbzlNVzJCNzA4OCtTcWNPTm45MldBT296QTlyZ0Q5OUJvSnNkVUlvMHMv?=
 =?utf-8?B?VnN1WW9PTi9vbHh0aDhtSkx1ajIySHdpNHhJOCthMDFyNmJBYkh0NHBkTEN6?=
 =?utf-8?B?REFESkpNTW5hYnR5QndkVW5EV3lOOEI2bVFZRkdSNWxXaENmT0doZWtpa3hT?=
 =?utf-8?B?b2JCUTZaanlGaHV1eUtJVk16c2V0YWZUU2NjNjhYVnVHd1NKaVBPUHNmbWZW?=
 =?utf-8?B?K0owNlc0UmFUZUxMSFp0YjdxdnRBSXBKKzlQeGtOK1UxaWJEQWFhUTI3YXZ5?=
 =?utf-8?B?cUNadXgrSCs5cnY0cjJxenJvcjJqanA1TDd2UkNFZVpLTG8rUmtWanNLT3B1?=
 =?utf-8?B?RTBnWkdpTStxVDQ3aHJld09sbzYvRkZMNld1TW1hclJjMTl4dFFPQkh0QVI2?=
 =?utf-8?B?V3BWelB6WWcvZVQ4K0ZQVkdqRHloNTlQcVNQdWNYSlMxUkk3MDRqN3l2UUtQ?=
 =?utf-8?B?bE90dFA0bHpmNWkwdmQ0eWRNWnhSWFNDcGRlWnFmRjAwRy91YUdTMjlSNHd4?=
 =?utf-8?B?VjQ4TXZFdEhwUk1MRlhrU1h5bTUxZzRIc21ZOThSejBaTTZHblhpUXBYVEly?=
 =?utf-8?B?UDN5Z0Z6YlBWSVRiN0E5SVZyVFk3MURBTklHamVvYnNGVEdpSkRvWXZ2OWN2?=
 =?utf-8?B?Yk14UFBqU09VTmdCbGo1THJCY2hDNnN5RGtyekVNdU0ycjJLQkc1Y0Q1c3By?=
 =?utf-8?B?ek5hbjhJRFlCSDdkMnQwTkRxSTU0Y1NlN1FzdTVOZytMNkNyRkVUU2ZuRFpq?=
 =?utf-8?B?MEVCWGlKM0xRT2pmQTRSV1ZoeERFVWpQRzlpd3NqV0pWL1dvV2UrTWtoTHFT?=
 =?utf-8?B?TG4xL0hhWS8raXI5UVpRbUhiRVJIM2kwbWdweWhldFd5YzVVWEtKMzZwYzRN?=
 =?utf-8?B?SXJ6NjQxNGM4QkIrNnN6d0k3YkpoYnlzaG9ST0xjSzY1SStvR0pOMHBpZmN2?=
 =?utf-8?B?TmFuS1NDNXFETitCa29BdE1lRWZ1VXdzblh6MWtpQ2lQUmVvclMrWjN5OW9u?=
 =?utf-8?B?ZVhXU0RLSStxTkxNVkNyUFRJMlpuM0t3QU9DNzVudzJBYUkxOWFIbFdsa1Vi?=
 =?utf-8?B?bnh0MGVpRGlPaCtJT0lMcXIvY1RUV0poazR4VU5UYU1Dc1pteTRWVUdQY0Zi?=
 =?utf-8?B?NGYwaXJKbmxWc1lOSTdNdEg3V3JhdDdYZkdXR1g4dzZMc2Q0blFuNGoxYUpm?=
 =?utf-8?B?UmFiVHR1YXNwOGJFZ1VuNVhyRHYxbzYxQVpXTlBFM251OWllK1VxUWFoeW5C?=
 =?utf-8?B?Um84aTQzNEEzQ3BnYkNRYnZRcFhySWVIeUtYL1JaQW1ZcExxbHpCM0RHUmto?=
 =?utf-8?B?VGZrSW9ETTVydjBMRC8yckR6bUdFOTkzdjlFRTVmWGhXck9LLzZ1d0ZkOGxz?=
 =?utf-8?B?MlNtUXhQRG5JUGd0Sk16Uk05NzdKSkJyaUJNMCt5MzNESVBOVzZXOUFzWmhz?=
 =?utf-8?B?NG5LbVhuZXZjL1prQXdteWhoOTgyZ2VVRTNIY2ZDWlhqeW9MTFlvQm9tRkUz?=
 =?utf-8?B?cFQydVZDQVo4dVhEQ1V6M1p6QVpYcWQzSFdQQ0pJVHF3VVRqaVQwQXlsWE1J?=
 =?utf-8?B?RVpoS28yVmdFUnFSZ2o1VTZoQUVwc3ZpOFFRSGxOaElhb1BpWXlIVlkyelh4?=
 =?utf-8?B?UVd4UUMveEprTkc1Y3orVmZadi9KaDMxakwxWW55eHEyTUgzRVpQKy85bXhH?=
 =?utf-8?B?OWt1ZUY3N2UvUGFxT2xQOFhGbFdWRzd1U0N2QU9EVkt4ejZOQ2E3dUhDeDRN?=
 =?utf-8?B?b1hIZzJsRFZWem1mZlFpWi9aS1J5YmxhOHFtd0lGREpnRUtkMnIxalVTaG9p?=
 =?utf-8?B?TnRiRU1idXBoMDNnekJQMnRoZVA0UGJVY0Yxa3F3aUtPb0RlNFgzWWRjczRT?=
 =?utf-8?B?YjJmdUd5MWMzUHh0ZkdIOTdkVk5hcE5YR29OZk1zeGI5LzhzdTJ6NmZ0VGFI?=
 =?utf-8?B?bUFNRElyemJvT3dET3FBQWFqbUlYSGhWZTh6K2RsQXFOWGU1QUlTTnltUVFh?=
 =?utf-8?B?MVc4SjBXTkhJdkwvWkY2Sy9hWVY2WWJEeC9FaytFYWhPSE5uNllQM0tzNkhL?=
 =?utf-8?B?WFBFUGxkUGZqY0dSSHh1VEJ5Q3dlMWxkOXJ2azlZeU82ZklvNm80Znl2V09z?=
 =?utf-8?B?cEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E1A9F85D004D443A5E744D7255696DA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c20b41-be70-4b8a-5d03-08dbde0422b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2023 13:35:54.5850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CFKR9C6adlc3sUGYiL+dXu1LwRxnGHy2vKxinRiQ92LHvOc94bW7PrisOgkkM6dGM0ezofpG+Xp6xQTCWYUriCZe1QKqA81J/RroomxJ/Ro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5647
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--18.592300-8.000000
X-TMASE-MatchedRID: zGP2F0O7j/sOwH4pD14DsPHkpkyUphL9GZjaqakC/Mae9toQ6h6LE5gC
        Mlq+sZ+fRoK+VF7coIOonnP74clN7vhDfjwsp9c4QpxiLlDD9FW4vBuE2X0HlcUmcSma304T9sM
        c5g5ltfiEnBOdbrVfELzMUsTL+1J5Dcy28oDHlwL0hv/rD7WVZG3eqxoVjgME92wasZo4p01v6I
        XMk14nwZJnvwSyL1fgz7PFIKYz07AYB2fOueQzj9IFVVzYGjNKcmfM3DjaQLHEQdG7H66TyOk/y
        0w7JiZo
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.592300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2AAE6CEC526BA9CC957FFEB6F8B670FC588466473C4581401D343A4936A0D6D72000:8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_TEMPERROR,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQ0ssDQoNCk9uIFRodSwgMjAyMy0xMC0yNiBhdCAwMjoyNiArMDAwMCwgQ0sgSHUgKOiDoeS/
iuWFiSkgd3JvdGU6DQo+IEhpLCBKYXNvbjoNCj4gDQo+IE9uIE1vbiwgMjAyMy0xMC0yMyBhdCAx
Mjo0NSArMDgwMCwgSmFzb24tSkguTGluIHdyb3RlOg0KPiA+IEFkZCBjbWRxX2luc2VydF9iYWNr
dXBfY29va2llIHRvIGFwcGVuZCBzb21lIGNvbW1hbmRzIGJlZm9yZSBFT0M6DQo+ID4gMS4gR2V0
IEdDRSBIVyB0aHJlYWQgZXhlY3V0ZSBjb3VudCBmcm9tIHRoZSBHQ0UgSFcgcmVnaXN0ZXIuDQo+
ID4gMi4gQWRkIDEgdG8gdGhlIGV4ZWN1dGUgY291bnQgYW5kIHRoZW4gc3RvcmUgaW50byBhIHNo
YXJlZCBtZW1vcnkuDQo+IA0KPiBJIHRoaW5rIHdoZW4gY21kcSBkcml2ZXIgaGFuZGxlciBpbnRl
cnJ1cHQsIGl0IGNvdWxkIHNpbXBseSBjYWxsIGludG8NCj4gVEVFIHdpdGggYW4gQVBJIHRvIHF1
ZXJ5IHN0YXR1cy4gVGhlIHN0YXR1cyBub3Qgb25seSB0aGUgZXhlY3V0ZQ0KPiBjb3VudCwNCj4g
YnV0IGFsc28gb3RoZXIgbWVzc2FnZSBpbmNsdWRpbmcgZXJyb3IgaW5mb3JtYXRpb24uIFNvIGl0
J3Mgbm90DQo+IG5lY2Vzc2FyeSB0byB1c2Ugc3VjaCBub24tdHJpY2t5IHdheSB0byBnZXQgZXhl
Y3V0ZSBjb3VudC4NCg0KVGhlIHJlYXNvbiB3aHkgd2UgdXNlIHNoYXJlZCBtZW1vcnkgdG8gcmVj
b3JkIGV4ZWN1dGUgY291bnQgaGVyZSBpczoNCjEuIG5vcm1hbCB3b3JsZCBjYW4gbm90IGFjY2Vz
cyB0aGUgcmVnaXN0ZXIgb2Ygc2VjdXJlIEdDRSB0aHJlYWQgaW4NCm5vcm1hbCB3b3JsZC4NCjIu
IGNhbGxpbmcgVEVFIGludm9rZSBjbWQgaW4gdGhlIGlycSBoYW5kbGVyIHdvdWxkIGJlIGV4cGVu
c2l2ZSBhbmQgbm90DQpzdGFibGUuIEkndmUgdGVzdGVkIHRoYXQgYSBzaW5nbGUgVEVFIGludmxv
a2UgY21kIHRvIENNRFEgUFRBIGNvc3RzDQoxOX41MyB1cy4gTWF5YmUgaXQgd291bGQgY29zdCBt
b3JlIGR1cmluZyB0aGUgc2NlbmFyaW8gdGhhdCBuZWVkcyBtb3JlDQpDUFUgbG9hZGluZy4NCg0K
PiANCj4gT25lIG1vcmUgcXVlc3Rpb24uIFRoZSBjb21tYW5kIGJ1ZmZlciBpcyBub3Qgc2VjdXJl
LiBEb2VzIHRoZSBHQ0UNCj4gaGFyZHdhcmUgZXhlY3V0ZSB0aGlzIG5vbi1zZWN1cmUgY29tbWFu
ZCBidWZmZXI/DQo+IA0KR0NFIGNvbW1hbmQgYnVmZmVyIGlzIGdlbmVyYXRlIGluIHRoZSBub3Jt
YWwgd29ybGQgZmlyc3QuIFRoZW4gaXQgd2lsbA0KYmUgY29waWVkIHRvIHRoZSBzaGFyZWQgbWVt
b3J5IGFuZCBwYXNzIHRvIHRoZSBzZWN1cmUgd29ybGQuIEFsbCB0aGUNCmluc3RydWN0aW9uIGlu
IGNvbW1hbmQgYnVmZmVyIHdpbGwgYmUgdmVyaWZpZWQgaW4gc2VjdXJlIHdvcmxkIHRoZW4NCnRo
ZXkgd2lsbCBiZSBjb3BpZWQgdG8gdGhlIHNlY3VyZSBjb21tYW5kIGJ1ZmZlciBhbmQgZXhlY3V0
ZWQgYnkgR0NFDQpzZWN1cmUgdGhyZWFkLiBJJ2xsIGFkZCB0aGlzIGluZm9ybWF0aW9uIHRvIHRo
ZSBjb3ZlciBsZXR0ZXIgYXQgdGhlDQpuZXh0IHZlcnNpb24uDQoNClJlZ2FyZHMNCkphc29uLUpI
Lkxpbg0KDQo+IFJlZ2FyZHMsDQo+IENLDQo+IA0K
