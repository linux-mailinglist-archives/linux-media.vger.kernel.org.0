Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1147D642F
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 09:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234163AbjJYH5R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 03:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233989AbjJYH5P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 03:57:15 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBEF318A;
        Wed, 25 Oct 2023 00:57:11 -0700 (PDT)
X-UUID: 165382cc730c11ee8051498923ad61e6-20231025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=jSl+Pqu8Hqw2CN2bCNSgjsyVhTTwhJvEKBNhOtt1yew=;
        b=tAnmXkdo7HbOW7PShvEErAxuhLsM2YNCEZwTvDDNYRtaAL95mVbq7qfQ4mj++3dj9pgWsUil5vvCmn2eMQsb39NGty9evi1cb0N1Qoz9d9rWrCquww4gLnFchUBm2fA9Yj73hspGEh1zS+Qfy3r1YEnA82L9cfu41ESOu97mtAE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:2db76554-043b-4e43-a1d1-e9a992ea1592,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:c504e428-cb22-4fa7-8134-287af20ad1fc,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
        DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 165382cc730c11ee8051498923ad61e6-20231025
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
        (envelope-from <jason-jh.lin@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1622812988; Wed, 25 Oct 2023 15:57:04 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Oct 2023 15:57:03 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Oct 2023 15:57:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+JWX7bqH1J7G9+z+r8dmOWQsp/56w64e6+kZ1V1aKgflY+ugRQw+bmGhtuHlYFz5pSJ78z0gEGaxl41SIOXT5r5NCgZbfW8WGmKCPVJ8cL4CyjgF2fNW2QAVN/JKO5H1O0yxMHbk+z/wYxxmL4TkYV6SAWVvkU4lbdstskxMaNre5vcHzDRgN/QtHfxH0S8cADMnOvu47wVnCaFkr7Z8oqW5ypYi2AFOyfaWyErR1Whi+gqzeneG6FOWxkYynh5H9WDgstIl+3R+WztXzPazTpAxe5rldHhuqxb6HiAf0FqfFrgJcVx117dxdBL4ByM3snv1YXlsuzGmCkCC2vSUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSl+Pqu8Hqw2CN2bCNSgjsyVhTTwhJvEKBNhOtt1yew=;
 b=Ct59wcT7q/ienl1NCk1OyfvstcYkjugOYy3ngobzTabU0O6d9qljBLmE7qE/SRNYAnsP69W2yQoQTxo5IyBX2ibtaI414aDWp4DTAM2cK7lOdbTZHi/oAjcOJ2X7SLIYgaiawYbbob5WA8iL5wBUTbq2HUl9tK7LWTZlly4LkDUU9+i7a/g/0LvjAqXFsCAeQmoJknYZm9Yo3VnmMep3zBIgAQMxXf0cWlWuARE2kEtM2AzhkRc7TYqWxX/2nE6za05FVPlHVwsosgmR4SuLNEVpa14yEL61OLVFxNwDjob9NTcfW3wsBo0P7JqQD2yTnfUS9G3sXsk9CDIvJ/ch8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSl+Pqu8Hqw2CN2bCNSgjsyVhTTwhJvEKBNhOtt1yew=;
 b=ibB0pFe0O+2Ql/HqB29JZQKZrPhDVDB5GjKSNePiJqIG+1FcZXGOs4TcDobPDVxepUg2YqEwxlrXo/4eVQdOf/GaXhnxm8+qHaQUPmlTLhQ+AH4k2jc2kbJhdVdQttrS6AQ992jrcduQ9ooRtHS/fCH/oY0YqR61nOwuh4vS6hU=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYZPR03MB7673.apcprd03.prod.outlook.com (2603:1096:400:3ca::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
 2023 07:57:01 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::8c0:a8fa:8e5:159d]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::8c0:a8fa:8e5:159d%7]) with mapi id 15.20.6907.025; Wed, 25 Oct 2023
 07:57:01 +0000
From:   =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= 
        <Jason-JH.Lin@mediatek.com>
To:     "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
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
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= 
        <Jason-ch.Chen@mediatek.com>,
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
Subject: Re: [PATCH v2 07/11] drm/mediatek: Add secure layer config support
 for ovl
Thread-Topic: [PATCH v2 07/11] drm/mediatek: Add secure layer config support
 for ovl
Thread-Index: AQHaBWvoijbhEc/R00mY51hFdbW5LrBYn90AgAGG9QA=
Date:   Wed, 25 Oct 2023 07:57:01 +0000
Message-ID: <2d297bc9ff55ca99baa66abec92af21b929df1a3.camel@mediatek.com>
References: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
         <20231023044549.21412-8-jason-jh.lin@mediatek.com>
         <0fa3bc67-baa4-4a7b-a2f2-43aee03ff77f@collabora.com>
In-Reply-To: <0fa3bc67-baa4-4a7b-a2f2-43aee03ff77f@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYZPR03MB7673:EE_
x-ms-office365-filtering-correlation-id: 2719008b-1edd-462f-62df-08dbd52ff86c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rOrTW6p8aGuf2nxDgIvIvuoN6OzQSMhMwH/1WSYk7Lqut+VXu81xbJx1spNyeC7iK/RnMVRj3/V3SxO4ZusoxNpZHnrF+CoX4OphN4XqoIeb+oU6/ibyu/JFXs4ApLlgbt/uKiCNdIipCHwCrgvKPY8NG1GkGurOlzMo+ge7HXnMF39QN0HjCFj29P0mbUzDLlSUUtx+GmeT673FbTo3Hn1wmDW4vVEpaX0ckHhsPZg9FxludrPL41NRkj8we0jm2D9j1LXCLmoOeENG95zYSBnu1YPOcMJEdXDwQ8ZkVxTXaEPAwtGqS57XYSjRkmixYMbKz8/H6+sLz4lTF/B4Bie3ZF/TiTZCUY3PmxM1GbPwgWTo0cOFtZuqqdBBpATuUbFRJKjR7DtlGfXwps6kV/9+miK5Kg0StrMwq+XK9VV7cPlnsNZPmtYo6UFJZgVxeg8ZVlmVyH/yLTrePEwp2PfdaqZPH/2wWd2G0zPSKjJBDZ5tRsjKaw4GbS0OqIHmrUXd5A4gvJdxF2GA7FGQRA0dVizXXIi3YU8zfQavHWMO9grrCcNW7sL9zmfPIAe0NcOOAwYZdEXJUR2fG1+k93sMKnfF3qAXBzsqGgkde8jrDIkcSSBAyT+nmfYovJpc1IlIAlmBDm6QKUOpjyEnCu55b2gvVyYZKlIhYJWOyB4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(376002)(136003)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(36756003)(64756008)(76116006)(66476007)(66446008)(86362001)(54906003)(110136005)(66946007)(91956017)(66556008)(41300700001)(316002)(6506007)(6486002)(5660300002)(6512007)(478600001)(4326008)(2906002)(85182001)(8676002)(4001150100001)(8936002)(2616005)(26005)(38100700002)(71200400001)(122000001)(7416002)(83380400001)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dG1tUUJFbEo2bzU2L1I0YjZ2ZXZ1SktydEQzYUxVaDYveHptdktGL0pJMXVD?=
 =?utf-8?B?bWVsVmo4aDVzOTE4dVhEb0xQVlhKclhTVVJjYzFlTTdkRktHT0NaRGR4cXpq?=
 =?utf-8?B?WDFtSlAwQXVPSUlhMWVHQjBDUk5ySUVwWFFGTzh4V2RCeHBZaVppN2JCT1RX?=
 =?utf-8?B?a3ptMERldjREcGc1akNWUklBeEZSZlZya1NCTWZ2V2ZBdEZIamNxVWk0NGFz?=
 =?utf-8?B?eXRDcDc4UmJrNTNpQnh5ZDEvblhvbHBkVlVtQ2Zqbk02Z05RQ3lkSldWMVN4?=
 =?utf-8?B?SWM3b1U0OHBrbVdUdUtSYXhxUWFvQkwvam05bnFCR1NNZVAxRUYvaStqcDVu?=
 =?utf-8?B?UndJVjJWZEdrNXlUNHNPbkU2R2F0YUtDUUliM0JOQjdOdUpxQ09oUVFDeHNF?=
 =?utf-8?B?ajVPZlYrVnVPVlEwdjdVcGxHN0xXSjZVbUE1VHhHdGZhUy9aRWIybVc3VDlw?=
 =?utf-8?B?VUpXSjZTakw3MlZ4WjJ6UGJxejhyampteVhvZVovRnkyTW9HNXVITEV0Wi8z?=
 =?utf-8?B?bWxHR0QrN2hMRTdUVFBBZU1RY0FUTUJ6YURyWTV3TmZja0s1aGtwYXQxM3JH?=
 =?utf-8?B?TFBSSnBVbnVyRnJVQVVOOG02b3dqQkpDbGxRYW5MU2hBZkFGRGxIY2JHY3NV?=
 =?utf-8?B?cTdjdkJSclcyditCU3d0VGRONDU3bWJzRDNlbEhUUGRYS1FsM3dSSXhBQmNB?=
 =?utf-8?B?QmN6UVoyWmxGUjRaZmUrRzBnTHNPZ1hkSXpxR1FsQldjWFZ1czdWV1dTM0FW?=
 =?utf-8?B?Nk94RWJYNndhNytxZWI1T3M3R2Rac1Q4b2twKzZYOWo3eGtJejE0MVJ3cVRo?=
 =?utf-8?B?QWYyK2REQVVWY1BLVUtpdUhKV1VxM0Yxa2F3WkRBUGc2UkVaQm0yRE4vVjZn?=
 =?utf-8?B?NUNVRGJPRStkd1B4MUtpSTgyTHlyeUZjU2JSYkxQbmt1eW5KT3cwTTFjU0tl?=
 =?utf-8?B?YVlkR2VsWlBWMXFIUGxvUWNlQ1VIVFYvUGhTUGlRWFcrdjVZdDZ1dUV3dytR?=
 =?utf-8?B?Znd4dUtOZlF3MWdKS1BQZWQ5TWZEaksvajlBV3dISStOSVZKQ3BZSUMvSlVx?=
 =?utf-8?B?ZXU2ZDg1MlhnL3RCbUl1djlxM2UrUDRvcE9pczNjTzJsSmpWK2ZDMWZJMVJE?=
 =?utf-8?B?dGRDWEUrbm95NlpXVkMzVWw2aDdkZW5pVVRDREpYZHhPejlqS2gxZnJCSmhx?=
 =?utf-8?B?VmRjdVRyYWc3a2lsSEpPaFFHT3NNWnpiQnp6QTFRL2VXN095czEyQ2diRWNT?=
 =?utf-8?B?azUrNzZJYWk2L3Zwd0xwWnJ6WUk1TXRQaGNZUEdLc2VucW5jWG5rQXFBQXc4?=
 =?utf-8?B?aWQ4aHFMVHJlcnptajV5blhLZGRDTGlRZDdSSFdFR3A2TVkvcVJybkRJVVFS?=
 =?utf-8?B?VDhodjdWRTcwejU3SGk1U1dTb2J1TDRPSWJSV2NTcFJMR1hIT0ZkVDZ3WWEw?=
 =?utf-8?B?ZUd4bnl3RE93MUI1MkFwdjk2bU5pVTdVeEpFVVBoSG9aNUJkVXlUT2ZwUzMx?=
 =?utf-8?B?a1FRaTgrQVJFYTFWLy9vUlgwNmN1MmdSNTJJYk9RdlRva0FCVFpmQTF4M1ps?=
 =?utf-8?B?S3AveTlzRkRIYzNSNVE4MzlPTDFqZjhSUjdUdVBFemV1MlFTUXpvVEtUbVFT?=
 =?utf-8?B?VlRlNUhpL1gwMkJmeUNmcjdCMjlWNmRZN3dUWkFMaUhjbGxDSFdtcERIZS9E?=
 =?utf-8?B?STFzYkpORWRDWVdJTkt1NWp5TGhjaWhWTU40ZnJpRnRTSnBFdy9IeDVidGpP?=
 =?utf-8?B?a1RVelllQXlvNWM3b3QrTXlaa2h0VUVQdE1ZcDVKb2JIbWNmeUpaVnczaTFF?=
 =?utf-8?B?MlMwaWVnY1dJSDRvWTB3b3JrZ0kzSWZKSyt1Znkrb1dWWFQzWWNZN3NhM1ZG?=
 =?utf-8?B?eXFmdHREWFlORnlvTlZ4OGs1WTdScUdFNUhUMnZRazEzaENNUDVsT05WUE5Y?=
 =?utf-8?B?dTJFQVUrRnFXSHZOUlhHM2VBUzRNMVNDdnI5T1NTaDYzdkw0cmxHQVdsbXBy?=
 =?utf-8?B?R2FJY2VIeHphVkRnTlJ4YVFCTDhnNC80ZGltQkdlNzJ0NnVUWE1tVWQ0YVVR?=
 =?utf-8?B?UzNqMUZ4Nzh5V1ByU2tINHp4WXRxYUFuMGdBbUFkYmphMmVUK1RURzNNa1d4?=
 =?utf-8?B?WS9FMzNETWIwdmFLVkh4U05rZW94RElWbzNPdk9SeU8yOW9UUjM4QVlSMVNv?=
 =?utf-8?B?c3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC71736A9153894A8C14A7CB4778A973@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2719008b-1edd-462f-62df-08dbd52ff86c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 07:57:01.0875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5aN09ZYj0ImW3A8RFdTgTVMKfnC1SGXxa2Lluw1tsFM60LVAK3uRMNj0gEeHqueOUBWVU2zKyes1hRtfGq7Qoxz16JaiJjZ/PCmNRl+zuE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7673
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--15.293200-8.000000
X-TMASE-MatchedRID: L8tZF6zWW2qnykMun0J1wmjZ8q/Oc1nAYefZ7F9kLgsNcckEPxfz2OLB
        DcjMHcx7UmsNbSHn8eBWz2eiIuWGmhdK6WmeO7YfQ4srjeRbxTZMkOX0UoduuTUsHjosUACSjBH
        2O7lhl4Aia1A0NjGfalq29TMwNyQqLbD3L65RKlYMH4SsGvRsA6OI1u80g4PZGNAPebYwJ/vejM
        lFftvg2Y+jpdlpqTmpO1HZ4kB5yGUkAJTC0ghkVOTuT3JcmKqquKSyOjKDwbhlSpW0oOb3q6PFj
        JEFr+olFUew0Fl/1pE9wJeM2pSaRbxAi7jPoeEQftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--15.293200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4D002ADF3C83AE18998B076D62222DD99B386F1B46BDB66C0D1232F668E057762000:8
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RDNS_NONE,
        SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQW5nZWxvLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXdzLg0KDQpPbiBUdWUsIDIwMjMtMTAt
MjQgYXQgMTA6MzcgKzAyMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBJ
bCAyMy8xMC8yMyAwNjo0NSwgSmFzb24tSkguTGluIGhhIHNjcml0dG86DQo+ID4gQWRkIHNlY3Vy
ZSBsYXllciBjb25maWcgc3VwcG9ydCBmb3Igb3ZsLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IEphc29uLUpILkxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAg
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9kcnYuaCAgICAgICB8ICAzICsrDQo+
ID4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgICAgICAgfCAzMQ0K
PiA+ICsrKysrKysrKysrKysrKysrLS0NCj4gPiAgIC4uLi9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX292bF9hZGFwdG9yLmMgICB8IDEyICsrKysrKysNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgICB8ICAyICsrDQo+ID4gICA0IGZpbGVzIGNoYW5n
ZWQsIDQ2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9kcnYuaA0KPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2Rydi5oDQo+ID4gaW5kZXggMjI1NDAzODUxOWUx
Li5kZWM5MzdiMTgzYTggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kaXNwX2Rydi5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX2Rydi5oDQo+ID4gQEAgLTksNiArOSw3IEBADQo+ID4gICAjaW5jbHVkZSA8bGludXgvc29j
L21lZGlhdGVrL210ay1jbWRxLmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgvc29jL21lZGlhdGVr
L210ay1tbXN5cy5oPg0KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3NvYy9tZWRpYXRlay9tdGstbXV0
ZXguaD4NCj4gPiArI2luY2x1ZGUgIm10a19kcm1fZGRwX2NvbXAuaCINCj4gPiAgICNpbmNsdWRl
ICJtdGtfZHJtX3BsYW5lLmgiDQo+ID4gICAjaW5jbHVkZSAibXRrX21kcF9yZG1hLmgiDQo+ID4g
ICANCj4gPiBAQCAtNzksNiArODAsNyBAQCB2b2lkIG10a19vdmxfY2xrX2Rpc2FibGUoc3RydWN0
IGRldmljZSAqZGV2KTsNCj4gPiAgIHZvaWQgbXRrX292bF9jb25maWcoc3RydWN0IGRldmljZSAq
ZGV2LCB1bnNpZ25lZCBpbnQgdywNCj4gPiAgIAkJICAgIHVuc2lnbmVkIGludCBoLCB1bnNpZ25l
ZCBpbnQgdnJlZnJlc2gsDQo+ID4gICAJCSAgICB1bnNpZ25lZCBpbnQgYnBjLCBzdHJ1Y3QgY21k
cV9wa3QgKmNtZHFfcGt0KTsNCj4gPiArdTY0IG10a19vdmxfZ2V0X3NlY19wb3J0KHN0cnVjdCBt
dGtfZGRwX2NvbXAgKmNvbXAsIHVuc2lnbmVkIGludA0KPiA+IGlkeCk7DQo+ID4gICBpbnQgbXRr
X292bF9sYXllcl9jaGVjayhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBpZHgsDQo+
ID4gICAJCQlzdHJ1Y3QgbXRrX3BsYW5lX3N0YXRlICptdGtfc3RhdGUpOw0KPiA+ICAgdm9pZCBt
dGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBpZHgs
DQo+ID4gQEAgLTExMiw2ICsxMTQsNyBAQCB2b2lkIG10a19vdmxfYWRhcHRvcl9jbGtfZGlzYWJs
ZShzdHJ1Y3QgZGV2aWNlDQo+ID4gKmRldik7DQo+ID4gICB2b2lkIG10a19vdmxfYWRhcHRvcl9j
b25maWcoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgdywNCj4gPiAgIAkJCSAgICB1
bnNpZ25lZCBpbnQgaCwgdW5zaWduZWQgaW50IHZyZWZyZXNoLA0KPiA+ICAgCQkJICAgIHVuc2ln
bmVkIGludCBicGMsIHN0cnVjdCBjbWRxX3BrdA0KPiA+ICpjbWRxX3BrdCk7DQo+ID4gK3U2NCBt
dGtfb3ZsX2FkYXB0b3JfZ2V0X3NlY19wb3J0KHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsDQo+
ID4gdW5zaWduZWQgaW50IGlkeCk7DQo+ID4gICB2b2lkIG10a19vdmxfYWRhcHRvcl9sYXllcl9j
b25maWcoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZA0KPiA+IGludCBpZHgsDQo+ID4gICAJ
CQkJICBzdHJ1Y3QgbXRrX3BsYW5lX3N0YXRlICpzdGF0ZSwNCj4gPiAgIAkJCQkgIHN0cnVjdCBj
bWRxX3BrdCAqY21kcV9wa3QpOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmwuYw0KPiA+IGluZGV4IDJiZmZlNDI0NTQ2Ni4uNzZlODMyZTQ4NzVhIDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiA+IEBAIC00Niw2
ICs0Niw3IEBADQo+ID4gICAjZGVmaW5lIERJU1BfUkVHX09WTF9BRERSKG92bCwgbikJCSgob3Zs
KS0+ZGF0YS0+YWRkciArDQo+ID4gMHgyMCAqIChuKSkNCj4gPiAgICNkZWZpbmUgRElTUF9SRUdf
T1ZMX0hEUl9BRERSKG92bCwgbikJCSgob3ZsKS0+ZGF0YS0NCj4gPiA+YWRkciArIDB4MjAgKiAo
bikgKyAweDA0KQ0KPiA+ICAgI2RlZmluZSBESVNQX1JFR19PVkxfSERSX1BJVENIKG92bCwgbikJ
CSgob3ZsKS0+ZGF0YS0NCj4gPiA+YWRkciArIDB4MjAgKiAobikgKyAweDA4KQ0KPiA+ICsjZGVm
aW5lIERJU1BfUkVHX09WTF9TRUNVUkUJCQkweDBmYzANCj4gPiAgIA0KPiA+ICAgI2RlZmluZSBH
TUNfVEhSRVNIT0xEX0JJVFMJMTYNCj4gPiAgICNkZWZpbmUgR01DX1RIUkVTSE9MRF9ISUdICSgo
MSA8PCBHTUNfVEhSRVNIT0xEX0JJVFMpIC8gNCkNCj4gPiBAQCAtMTI2LDggKzEyNywxOSBAQCBz
dHJ1Y3QgbXRrX2Rpc3Bfb3ZsIHsNCj4gPiAgIAljb25zdCBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsX2Rh
dGEJKmRhdGE7DQo+ID4gICAJdm9pZAkJCQkoKnZibGFua19jYikodm9pZCAqZGF0YSk7DQo+ID4g
ICAJdm9pZAkJCQkqdmJsYW5rX2NiX2RhdGE7DQo+ID4gKwlyZXNvdXJjZV9zaXplX3QJCQlyZWdz
X3BhOw0KPiA+ICAgfTsNCj4gPiAgIA0KPiA+ICt1NjQgbXRrX292bF9nZXRfc2VjX3BvcnQoc3Ry
dWN0IG10a19kZHBfY29tcCAqY29tcCwgdW5zaWduZWQgaW50DQo+ID4gaWR4KQ0KPiA+ICt7DQo+
ID4gKwlpZiAoY29tcC0+aWQgPT0gRERQX0NPTVBPTkVOVF9PVkwwKQ0KPiA+ICsJCXJldHVybiAx
VUxMIDw8IENNRFFfU0VDX0RJU1BfT1ZMMDsNCj4gDQo+IFRoaXMgaXMgQklUX1VMTCgpOg0KPiAN
Cj4gcmV0dXJuIEJJVF9VTEwoQ01EUV9TRUNfRElTUF9PVkwwKTsNCg0KT0ssIEknbGwgY2hhbmdl
IGl0LiBUaGFua3MgZm9yIHRoZSBhZHZpY2UuDQoNCj4gDQo+ID4gKwllbHNlIGlmIChjb21wLT5p
ZCA9PSBERFBfQ09NUE9ORU5UX09WTDEpDQo+ID4gKwkJcmV0dXJuIDFVTEwgPDwgQ01EUV9TRUNf
RElTUF9PVkwxOw0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICAg
c3RhdGljIGlycXJldHVybl90IG10a19kaXNwX292bF9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lk
DQo+ID4gKmRldl9pZCkNCj4gPiAgIHsNCj4gPiAgIAlzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsICpwcml2
ID0gZGV2X2lkOw0KPiA+IEBAIC00NDksOCArNDYxLDIyIEBAIHZvaWQgbXRrX292bF9sYXllcl9j
b25maWcoc3RydWN0IGRldmljZSAqZGV2LA0KPiA+IHVuc2lnbmVkIGludCBpZHgsDQo+ID4gICAJ
CQkgICAgICBESVNQX1JFR19PVkxfU1JDX1NJWkUoaWR4KSk7DQo+ID4gICAJbXRrX2RkcF93cml0
ZV9yZWxheGVkKGNtZHFfcGt0LCBvZmZzZXQsICZvdmwtPmNtZHFfcmVnLCBvdmwtDQo+ID4gPnJl
Z3MsDQo+ID4gICAJCQkgICAgICBESVNQX1JFR19PVkxfT0ZGU0VUKGlkeCkpOw0KPiA+IC0JbXRr
X2RkcF93cml0ZV9yZWxheGVkKGNtZHFfcGt0LCBhZGRyLCAmb3ZsLT5jbWRxX3JlZywgb3ZsLQ0K
PiA+ID5yZWdzLA0KPiA+IC0JCQkgICAgICBESVNQX1JFR19PVkxfQUREUihvdmwsIGlkeCkpOw0K
PiA+ICsNCj4gPiArCWlmIChzdGF0ZS0+cGVuZGluZy5pc19zZWMpIHsNCj4gPiArCQljb25zdCBz
dHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICpmbXRfaW5mbyA9DQo+ID4gZHJtX2Zvcm1hdF9pbmZvKGZt
dCk7DQo+ID4gKwkJdW5zaWduZWQgaW50IGJ1Zl9zaXplID0gKHBlbmRpbmctPmhlaWdodCAtIDEp
ICoNCj4gPiBwZW5kaW5nLT5waXRjaCArDQo+ID4gKwkJCQkJcGVuZGluZy0+d2lkdGggKiBmbXRf
aW5mby0NCj4gPiA+Y3BwWzBdOw0KPiA+ICsNCj4gPiArCQltdGtfZGRwX3dyaXRlX21hc2soY21k
cV9wa3QsIEJJVChpZHgpLCAmb3ZsLT5jbWRxX3JlZywNCj4gPiBvdmwtPnJlZ3MsDQo+ID4gKwkJ
CQkgICBESVNQX1JFR19PVkxfU0VDVVJFLCBCSVQoaWR4KSk7DQo+ID4gKwkJbXRrX2RkcF9zZWNf
d3JpdGUoY21kcV9wa3QsIG92bC0+cmVnc19wYSArDQo+ID4gRElTUF9SRUdfT1ZMX0FERFIob3Zs
LCBpZHgpLA0KPiA+ICsJCQkJICBwZW5kaW5nLT5hZGRyLCBDTURRX0lXQ19IXzJfTVZBLCAwLA0K
PiA+IGJ1Zl9zaXplLCAwKTsNCj4gPiArCX0gZWxzZSB7DQo+ID4gKwkJbXRrX2RkcF93cml0ZV9t
YXNrKGNtZHFfcGt0LCAwLCAmb3ZsLT5jbWRxX3JlZywgb3ZsLQ0KPiA+ID5yZWdzLA0KPiA+ICsJ
CQkJICAgRElTUF9SRUdfT1ZMX1NFQ1VSRSwgQklUKGlkeCkpOw0KPiA+ICsJCW10a19kZHBfd3Jp
dGVfcmVsYXhlZChjbWRxX3BrdCwgYWRkciwgJm92bC0+Y21kcV9yZWcsDQo+ID4gb3ZsLT5yZWdz
LA0KPiA+ICsJCQkJICAgICAgRElTUF9SRUdfT1ZMX0FERFIob3ZsLCBpZHgpKTsNCj4gPiArCX0N
Cj4gPiAgIA0KPiA+ICAgCWlmIChpc19hZmJjKSB7DQo+ID4gICAJCW10a19kZHBfd3JpdGVfcmVs
YXhlZChjbWRxX3BrdCwgaGRyX2FkZHIsICZvdmwtDQo+ID4gPmNtZHFfcmVnLCBvdmwtPnJlZ3Ms
DQo+ID4gQEAgLTUyOSw2ICs1NTUsNyBAQCBzdGF0aWMgaW50IG10a19kaXNwX292bF9wcm9iZShz
dHJ1Y3QNCj4gPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gICAJfQ0KPiA+ICAgDQo+ID4g
ICAJcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsN
Cj4gPiArCXByaXYtPnJlZ3NfcGEgPSByZXMtPnN0YXJ0Ow0KPiA+ICAgCXByaXYtPnJlZ3MgPSBk
ZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCByZXMpOw0KPiA+ICAgCWlmIChJU19FUlIocHJpdi0+
cmVncykpIHsNCj4gPiAgIAkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gaW9yZW1hcCBvdmxcbiIp
Ow0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3Zs
X2FkYXB0b3IuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bF9h
ZGFwdG9yLmMNCj4gPiBpbmRleCA2YmY2MzY3ODUzZmIuLjI4YTBiY2NmYjBiOSAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsX2FkYXB0b3IuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmxfYWRhcHRvci5j
DQo+ID4gQEAgLTgzLDYgKzgzLDE4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb3ZsX2FkYXB0b3Jf
Y29tcF9tYXRjaA0KPiA+IGNvbXBfbWF0Y2hlc1tPVkxfQURBUFRPUl9JRF9NQVhdID0gew0KPiA+
ICAgCVtPVkxfQURBUFRPUl9FVEhEUjBdCT0geyBPVkxfQURBUFRPUl9UWVBFX0VUSERSLCAwIH0s
DQo+ID4gICB9Ow0KPiA+ICAgDQo+ID4gK3N0YXRpYyBjb25zdCB1NjQgb3ZsX2FkYXB0b3Jfc2Vj
X3BvcnRbXSA9IHsNCj4gPiArCTFVTEwgPDwgQ01EUV9TRUNfVkRPMV9ESVNQX1JETUFfTDAsDQo+
IA0KPiBCSVRfVUxMKENNRFFfU0VDX1ZETzFfRElTUF9SRE1BX0wwKSwNCj4gQklUX1VMTCguLi4u
Li4pLA0KDQpPSycgSWxsIGNoYW5nZSBpdC4NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KPiAN
Cj4gDQo+IFJlZ2FyZHMsDQo+IEFuZ2Vsbw0KPiANCj4gDQo=
