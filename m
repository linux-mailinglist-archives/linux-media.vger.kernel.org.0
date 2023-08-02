Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 588B776D84F
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 22:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjHBUBO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 16:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbjHBUBN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 16:01:13 -0400
Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1522103
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 13:01:10 -0700 (PDT)
Received: from 104.47.7.175_.trendmicro.com (unknown [172.21.162.147])
        by repost01.tmes.trendmicro.eu (Postfix) with SMTP id ED1D7100004F7;
        Wed,  2 Aug 2023 20:01:08 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1691006467.858000
X-TM-MAIL-UUID: 30c891ba-866b-4c06-963c-1e8deb0cbe87
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown [104.47.7.175])
        by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id D192A10000317;
        Wed,  2 Aug 2023 20:01:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ng20REyPp3ROJ4yfU+lR7UfoZmchiQMYFknFw2hNvpe1LeKRHU/0H8MZ6gDaTuODL5RwMak1lAJWFiHfHgsq36ORAi+RIlBm5JC2fIhxikzPJQra/U7hnkQzw2y+jdXSzZObZIzzLVn6agxNzikbDycnFvYMQ6jqnIlnkTzehjPjIYzDCLWP9eOsmB+5Tb1Y3wgPdPdHH0lhuhjAGeqwUITXo0nPazoXKzq6QU1A5IAyAdL5iBg8IjAj2ZPpBRb/bD1FzuSIq/YUobcBnis60m1reIpfLTKIt0v4y6iWAvZlFvKdCvW+ttY3pyY8cdxEzqFKn4HERReAvVjRalmQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOCWA1hFiiqYecSXkmLQ3ZGv6TE9Zoz0f0wq43NLUJc=;
 b=PAxI5EFtFq40Xofo5Dv7ZtP6Jy/ZAXIlkcXHMvCU8CKCoePurCfhzHab6wZJic2kvAi51y4zW3UMNrNAAdtyDwRrAjbJbT2iVsPnqBgUhbTMgQsDLNrxEBaMUPSEKvArxMBqGoGnNEGJ8hAFPujgBmbjN9wghn0vCbnQJf4eGLpoyIeHO8Ae98NmM4lKHFMaxlLCLxigv1uzJw52CyuUzzsdMFwc144JqGivhc52+IiRE68HeSZdkZ7OTyLltF8gV4sQHVKhwIeL8ll6IfBybtlA/QKwdLJjC8eY+rcFt7MW7sY+Hkl5o67Dnd1A9QD49UMTvxDTAlvQbq6vpFZMrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <2578189f-947a-c75d-72e6-d0404c1d3106@opensynergy.com>
Date:   Wed, 2 Aug 2023 22:00:49 +0200
Subject: Re: [RFC PATCH v8 1/1] virtio-video: Add virtio video device
 specification
To:     Albert Esteve <aesteve@redhat.com>
Cc:     virtio-comment@lists.oasis-open.org,
        virtio-dev@lists.oasis-open.org,
        Alexandre Courbot <acourbot@chromium.org>,
        alex.bennee@linaro.org,
        Andrew Gazizov <andrew.gazizov@opensynergy.com>,
        Andrii Cherniavskyi <andrii.cherniavskyi@opensynergy.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        Enrico Granata <egranata@google.com>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Marcin Wojtas <mwojtas@google.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>, Matti.Moell@opensynergy.com,
        bag@semihalf.com, bgrzesik@google.com, hmazur@google.com,
        mikrawczyk@google.com, srosek@google.com, zyta@google.com,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
References: <20230629144915.597188-1-Alexander.Gordeev@opensynergy.com>
 <20230629144915.597188-2-Alexander.Gordeev@opensynergy.com>
 <CADSE00K7Tc2y58x=6yTV5dXkOdfwm9yO+nkya8B4Jd=y7Gad5w@mail.gmail.com>
 <363411d2-31d4-e7f9-7e65-534b6ede3d1b@opensynergy.com>
 <CADSE00LjAhSOkM-TwkzAz1_E=z1pDOQ2kiENVXu8TJeQ64SjTw@mail.gmail.com>
Content-Language: en-US
From:   Alexander Gordeev <alexander.gordeev@opensynergy.com>
In-Reply-To: <CADSE00LjAhSOkM-TwkzAz1_E=z1pDOQ2kiENVXu8TJeQ64SjTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0488.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7e::10) To BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:4d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2663:EE_|BE1P281MB2420:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ff1907-43fd-429e-ab6a-08db939334f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SmQc3RekLEOy413/1f2yKfAlKE+onAsCNiwEFnbT2QrWvD2eSyOrZnMlKG7Sy1Za8wohgsoTzAx+QRAE6J6MDsucoYl3FoH0S1x72i1LZKwpVDRcWmsMemJSNr7Jx7rrbBa15IwAp1WTY9bLdr1jCCWIxxMl1qrFHkfvOzVSA1h3kltk3jeCiLUhbGfd2f03rvWG+w+uRE6dSeTKLXXAcJbcewPa+R6Q30smwT/s3b1aO4oK5Vjp2iA2P+BHr3ZzsfD5ozHM+2781q0j76qQSRDzjk9dZHeEq65pVcEV18nAZDmBq0YYT5LiB75r8IY3TgMP8WENe7a2Xly5qipkmkvhYwOvAQ22t/qDZpsYL391Dae/OmdrR2w5WGbXHmx5C9NULixe32MkiiujUr0sAk7W0g8rUs2qOCEJRNLhssw4Hjh+hUP+1WYpug7dUpgSrsSli3Rc+o0R10oDyeTMSYrdCQp6FZaQuaHTdVSwsEKTTFjVHtxxcfXGdNqEbhQ2JSp+GNjeG5mBztUHP2xBjKHrpvH5ge2lOyswN82Ze9ngmJ/5rnokEV4QFqsu/bjDWeN7fW2SlX2rDFKCcyJ8mhr8kQUEWpuRbRimqIc1klm+k6FhXaama5vfNIeiRYKaSf+tVl96hLj12zo5tc0erg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(366004)(396003)(136003)(39840400004)(451199021)(31686004)(66899021)(53546011)(38100700002)(26005)(8676002)(478600001)(7416002)(5660300002)(44832011)(15974865002)(8936002)(6916009)(4326008)(66476007)(66556008)(66946007)(54906003)(31696002)(86362001)(41300700001)(42186006)(316002)(2616005)(66574015)(186003)(2906002)(36756003)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkxzTTRkbTJucGJDUDhWUUlOOVBiSEV4RWNQb1llMHZRTEZsTVNNQldZTkFH?=
 =?utf-8?B?cGE1d082QmJaSUFWQytxYjlTeFNRRlo0b1Z0bDF2a3NNaDF2ZHlZUmpIWFJP?=
 =?utf-8?B?RXQrdFVWMlhDUTBKc05Nc2VlYnVkQ01UdXRNMjlMa01uSFBaTjNiZURIN1M2?=
 =?utf-8?B?aE14d2YwZC9BL3Z4c2FLa2syVm9oaDRFMGxXc1hHNGJtUE5OMkdtakNmWm8z?=
 =?utf-8?B?VmRITG1rb2pDR1p1MmVweC9HcU5lWTBvWlJ3RjM3VFRQaDQrdFJpc2RlNit6?=
 =?utf-8?B?M2w3K3hmVy9samZuNllmUTI5bU1KZUNDVWxDcS8rL1BUMndxWEV0RWFhYlIv?=
 =?utf-8?B?c21QdllTSG5OYW5PMGFTUGNWdHJua0MwdU5HOHp5MEhKRm16TU4yN1ZadEdt?=
 =?utf-8?B?YmxwVDl4S0g2WkthMURUdzdxR2ZRbVQ2RHRnbFErMGE1ZjQ0cUkvaEdsd3hS?=
 =?utf-8?B?UTlZeTdWNm5Lc1MxUE5IU1BFUnpCdFp1cmMyM3c4MTg5WnJBSU0yNVdDaFky?=
 =?utf-8?B?S0dSVUpoSGZTOFdjSXZQQ2lwUVZOQTRxYnRGK09PY01STXJ3eWJqTHFEcy9p?=
 =?utf-8?B?a3lWZ0JNZXBDRkx6dys4aWl4RmhKWmJteVFTZ2VQS3dCMlVoT1N2ajhRQ1Fl?=
 =?utf-8?B?UHFLRnplamV3ZWIweXk5SGJlMGtHYUdKVjhUSndYWGJWQW4ybkdYRWhSR3Br?=
 =?utf-8?B?S0FrbjZLbkRyaE54a0xsYzVvdWc3MmsrYnhoUWRaS1NxTTBxQ3Nld2Zrbjdy?=
 =?utf-8?B?TER1UXlkWVNLZ21oaU5SamtXbzRDMDJQVllMYURwVkhTK2Y2RVZvb1FScllR?=
 =?utf-8?B?NjVFeFBMRWN5d1FqUmQ4MFU0dVRqcUZGMURmQWIrMTQrQmpCeW1vajVKU2dP?=
 =?utf-8?B?dEFXamR6SnlRSnErRGJEN3pzYWdUQ1dvNXZlNHJXS3FuRlY2bzNPaFMwMkpK?=
 =?utf-8?B?TzJacVUwbEpDSXlBQnFlQ01PcEhQUlZoUkVOY2wwU2E2b04rcE9tSmgzYytO?=
 =?utf-8?B?YVQrNGs1bTA4UjhRWlNyTUp4cVIzYUdiNDlFMWw0WkdpM0RQcXN6ak5iRmhr?=
 =?utf-8?B?d3RTcFpIeEszOWw0eGx3T0p1ZE9CR3FBY0NUTHkyYjUxajR2Unh0SlFmczQ0?=
 =?utf-8?B?VDl5Z2daK21oNE52dFNUNUZjdm5hcVdab2crcXFtVFJCTE1OWERVUEVnQXAy?=
 =?utf-8?B?VnV2cmFML0F3ckdtd2JkYXNab0hwczlZbTlNM3Y1QUNxdmFVU0JnZG1sNGI0?=
 =?utf-8?B?S2VXUG9LcXNvcHZBVmlCcXVyOG5EWktKTklZWU96cGcrRTNxY3V1eERXK1Yx?=
 =?utf-8?B?MWk2Y0xKcDBwTG40TEx5dVExOUd6OXZuRG5KZWlmWGp1TXlRTXMzWUxQODYw?=
 =?utf-8?B?V3ZRaXVRRXVzYXBvZllQdVY0NHJoS3NSNktWYUlKayt6aEswcUJBc0V4SGdS?=
 =?utf-8?B?VWc3MDBzQlhpZGZWcmRUbEZLRDdqcjVNYXMwOGFBQVBvL1RiTnFUdmQ4Z2Uy?=
 =?utf-8?B?L2hoQXhRNVg3TS9SRHVIZkxJS1NneFNNMXlXeXdmS1Z2clZYclQzZDVRUXRH?=
 =?utf-8?B?NjQ5Zll4TlduRU1MRXliSll6RlE5RjI1MWFOT3h1TFliQTV2dFBuTHFuaWZU?=
 =?utf-8?B?ak5YcGJuWmc3RXhnU1E2b2pFM3ptdzY0UnF3UUwrckRwTkU3Zy9FOVFVMjFu?=
 =?utf-8?B?WWhoRkVEOExOeG1KWFduRUU5UXRKdHlLQjM3M2JhOEJhZkIxMTJ2OTJnZDY1?=
 =?utf-8?B?TWpvRnpoZjlzYWx1SzB0c2lULzlicTl3ZmtmbGpmTFZOY1E0bHBSTFJPaElu?=
 =?utf-8?B?Z1hJVVc2OW5keGN5WnlGa2dPVkptUldTdFVnSCtCcDNCVjdGZUZxNmh0d0No?=
 =?utf-8?B?SGpwK0p0YzROeS9nbFpsM1hrRFBpTzRva1g5ZGhCNnN0SktlWDZFYktMdnBS?=
 =?utf-8?B?c2ViS3RaSW5EMldmMnpLNWo0bEdrQlZERW44RjhjekxPT2hjaERxZlJWYitO?=
 =?utf-8?B?NWRNeC9PN2EvdStOSWJVbWJLdVlZR0Q0WDRDOFJ4enJVQy8wMnEwbWpmdUVn?=
 =?utf-8?B?OXBDcVR1a2dROEJKT0ZQMi82TUlIaFh5MzRkN0E3UnhpaWZCREc2eDMzK2FK?=
 =?utf-8?Q?I4UfYboPfkhX8j0Ku9FJ+IcbC?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ff1907-43fd-429e-ab6a-08db939334f8
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 20:01:06.3012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chqWAyKFKpryUk4ikQCuV3ZgCCahDrgoujqT2hIqFZc3ykdSYkpZPVx1qJn4r3MhVgaT3rnKZm2BbEudocz4ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2420
X-TM-AS-ERS: 104.47.7.175-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1011-27790.002
X-TMASE-Result: 10--39.886300-4.000000
X-TMASE-MatchedRID: gTucSmrmRMP5ETspAEX/non73EnA6dC3lR7tN56aWVVjIOKZDN+g+50d
        k83tludhGqipXvgy4vJovyoV5f98wayK4uYIquiJzxHg3Mb1A4x0pPFWgq1KNsMGovRDcJZ9OfK
        UeIrSi79lpml2ucVEMEJf2dwTm1HC0kZ2qtir6YlbuM63pQtoa1hAFa9hyLt21NUhCFvbuLmjPe
        6aYKpTiV/gwpP7wJ6412DQIVM4kygKzzzfrOL1fSJU+CNj7ImHWsmn/TLgDPHSlcm0ThcAICloZ
        PgsZg+2z1rQsQS0vjNW5N3GJgL8+SUNmG4s++cMCNaaoXrP7wmMVe9CAxGt5dC8P2kUIeC54ABK
        +pmN83jRfJvw1mkjJsoPoUA/LJCaGS1B9xM4BRRv4UG/TUKo0b6JFLmgip31ohylTf+BwIxUSTR
        u2gXOp5MsyTLk6XXr2oWFkmZBCBbWrJyuoZUfTlwHkvsOWIEllZroRtOiCG0N1dNYE269LFXx7S
        y6v/RZxyWmjWIJIoJBRtfd3mxkzLIB51qhyAMoL2a/BgQLeNWFCkPhi2xezVJ0RLdATbnA60nd6
        FCWsGFDFPIF0Vh5UKDs0GSf8SsOZaA4dfYcAHochtK5AYhkNzCgTL4opfSy6VIbcsw5Z9IKE01K
        ijBgBxoFYM0/xszzaD2UKQ7oadOPINzWub/Qc0I9AEPfED/dn8cUfSHIwCASCDdzAMeX/U7zkly
        hPTD9YIyQM4JfnWl4bd6tiMFuXX7cGd19dSFd
X-TMASE-XGENCLOUD: 4343dd2e-90be-443f-9387-cf26758267cb-0-0-200-0
X-TM-Deliver-Signature: 019BD3410BA12C268D8D7B8800478E37
X-TM-Addin-Auth: JeYGHUiT4/eopYZiJJueY2UOKvILjvwLdqDZigvJzDavfZcZ1Ajz5JJkoOr
        CepgyXdzkDAfHhMYv3XZV5xjFesOVajwOVV0TsK1VyhLf4UUuNyoWolDF8igiwoVO8cNUFlkW1l
        ausniD7hmDRldoXgevOI66qvO536JpsM0tqQeWAeMdJTxEWlRZ0/DWY+m45WdU7XFYens/k516h
        FvN6ubemIkHXELP0jUwKLm+NcRuIS7Lh4b0Ia09z7kzIxOAKa3Bkx+oJ7cPiG3HAoI+0yBjRqsY
        ++HzrWpssFDN5Bg=.3CEO54Z4vv1Q6YdHTORvxJSSTolxrkF5m6h8tnDvwyT++SP+B9Hae0em5k
        AEaEQYlHkoqIL4KrK2GXy6kdXAoJaonm1SYLM0FUxgejYx+tsyHVJUuN/NB7MX60yZarJshirxg
        5f8KLY0xxnx/pv8KQrb1PVQ8gRnpx9vyeTP5LCilF61YtpcsAM7oXP+o24er8NgV+7zZn0tt0tE
        KSd8mTK8KW1nf3KheKfK1x3rTkUEozhIQdTFn7oCo/Knru5w7ieNqfFHlKONd1IpSJ9KesRnlBM
        v9WRAPpTN/WKpr9jxfgDXVrEbxcC6SrjpBPWygxrf7fHIeMzTd9s9ZsbjvA==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
        s=TM-DKIM-20210503141657; t=1691006468;
        bh=NgTXKHwBgpda+8MSoVYhrShhcp/vVeJrYQBDLuRyyOA=; l=9003;
        h=Date:To:From;
        b=cMaNiCcpM2WzvmNAH39nCELPnsUIW2SHnnRWpt9SPe5slTv1N2kB2EzjwLRO2BFlF
         yMGY/X9PUoU/oEX6ptZ17Kxl9a5RkrpjDR6WtGFrjj6TKK6ylAInDPW7DSbSjj/viE
         GuTarmwiBeytsAf01ZP4lWi0arry6Um9bAKeF7091ynJRzdFB8wPl3BO2dxktHymc3
         EQxXEqjKKGn65G356lytyovkQb0bsWGMfKdzBmwVryvsMvf/CR0OIiJfKxwyyqU6FO
         WYyKKu3qbrxhvRv0Hw/apomnd7gRinVBY9eFX39MssuPypTBbPeuiAILnvAqPce/LG
         DiP64ixzVr40Q==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26.07.23 16:32, Albert Esteve wrote:
> 
> On Mon, Jul 10, 2023 at 10:52 AM Alexander Gordeev 
> <alexander.gordeev@opensynergy.com 
> <mailto:alexander.gordeev@opensynergy.com>> wrote:
> 
>     Hi Albert,
> 
>     On 06.07.23 16:59, Albert Esteve wrote:
>      > Hi Alexander,
>      >
>      > Thanks for the patch! It is a long document, so I skimmed a bit
>     in the
>      > first read. Find some comments/questions inlined.
>      > I will give it a second deeper read soon, but overall I think is in
>      > quite good shape. It feels really matured.
> 
>     Great! Thank you for taking the time to review it.
> 
>      > On Thu, Jun 29, 2023 at 4:49 PM Alexander Gordeev
>      > <Alexander.Gordeev@opensynergy.com
>     <mailto:Alexander.Gordeev@opensynergy.com>
>      > <mailto:Alexander.Gordeev@opensynergy.com
>     <mailto:Alexander.Gordeev@opensynergy.com>>> wrote:
...snip...
>      >     +
>      >     +\subsubsection{Device Operation: Device Commands}
>      >     +\label{sec:Device Types / Video Device / Device Operation /
>     Device
>      >     Operation: Device Commands}
>      >     +
>      >     +This command allows retrieving the device capabilities.
>      >     +
>      >     +\paragraph{VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}
>      >     +\label{sec:Device Types / Video Device / Device Operation /
>     Device
>      >     Operation: Device Commands / VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS}
>      >     +
>      >     +Retrieve device capabilities for all available stream
>     parameters.
>      >     +
>      >     +The driver sends this command with
>      >     +\field{struct virtio_video_device_query_caps}:
>      >     +
>      >     +\begin{lstlisting}
>      >     +struct virtio_video_device_query_caps {
>      >     +        le32 cmd_type; /* VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS */
>      >     +};
>      >     +\end{lstlisting}
>      >     +
>      >     +The device responds with
>      >     +\field{struct virtio_video_device_query_caps_resp}:
>      >     +
>      >     +\begin{lstlisting}
>      >     +#define MASK(x) (1 << (x))
>      >     +
>      >     +struct virtio_video_device_query_caps_resp {
>      >     +        le32 result; /* VIRTIO_VIDEO_RESULT_* */
>      >     +        le32 stream_params_bitmask; /* Bitmask of
>      >     MASK(VIRTIO_VIDEO_PARAM_*) */
>      >     +        le32 coded_formats_bitmask; /* Bitmaks of
>      >     MASK(VIRTIO_VIDEO_CODED_FORMAT_*) */
>      >     +        le32 raw_formats_bitmask; /* Bitmask of
>      >     MASK(VIRTIO_VIDEO_RAW_FORMAT_*) */
>      >     +        le32 num_format_deps;
>      >     +        le32 num_raw_format_caps;
>      >     +        le32 num_coded_resources_caps;
>      >     +        le32 num_raw_resources_caps;
>      >     +        le32 num_bitrate_caps; /* If
>      >     MASK(VIRTIO_VIDEO_PARAM_BITRATE) is set. */
>      >     +        u8 padding[4];
>      >     +        /* If corresponding
>     MASK(VIRTIO_VIDEO_PARAM_GROUP_CODEC_*)
>      >     is set. */
>      >     +        struct virtio_video_mpeg2_caps mpeg2_caps;
>      >     +        struct virtio_video_mpeg4_caps mpeg4_caps;
>      >     +        struct virtio_video_h264_caps h264_caps;
>      >     +        struct virtio_video_hevc_caps hevc_caps;
>      >     +        struct virtio_video_vp8_caps vp8_caps;
>      >     +        struct virtio_video_vp9_caps vp9_caps;
>      >     +        /**
>      >     +         * Followed by
>      >     +         * struct virtio_video_format_dependency
>      >     format_deps[num_format_deps];
>      >     +         */
>      >     +        /**
>      >     +         * Followed by
>      >     +         * struct virtio_video_raw_format_caps
>      >     raw_format_caps[num_raw_format_caps];
>      >     +         */
>      >     +        /**
>      >     +         * Followed by
>      >     +         * struct virtio_video_coded_resources_caps
>      >     +         * coded_resources_caps[num_coded_resources_caps];
>      >     +         */
>      >     +        /**
>      >     +         * Followed by
>      >     +         * struct virtio_video_raw_resources_caps
>      >     raw_resources_caps[num_raw_resources_caps];
>      >     +         */
>      >     +        /**
>      >     +         * Followed by if MASK(VIRTIO_VIDEO_PARAM_BITRATE)
>     is set
>      >     +         * struct virtio_video_bitrate_caps
>      >     bitrate_caps[num_bitrate_caps];
>      >     +         */
>      >     +};
>      >
>      >
>      > Maybe nitpicking, but some of the member structs are inside a
>     comment
>      > and some are not.
>      > Does not seem to correlate with them being conditional.
>      > I think is nice to have conditional fields in comment blocks to
>      > highlight it, but then the
>      > VIRTIO_VIDEO_PARAM_GROUP_CODEC_* structs need to be in their own
>     comment
>      > block.
> 
>     Yeah, this style comes from draft v5, then I added the conditional
>     statementson top, so now it is harder to understand. I also would like
>     to do this in a different way. I was thinking recently about
>     extendability of this construct, it doesn't look good. If a new
>     codec or
>     a new codec-specific parameters is added, it has to be guarded by a new
>     feature flag, say VIRTIO_VIDEO_F_CODECS_2024. Then the device will have
>     to provide different structures depending on the negotiated flags and
>     the driver will have to parse it. This looks quite painful and
>     error-prone. My current idea is to replace this with something like FDT
>     to make it much more flexible. The resulting blob with all the
>     capabilities can even be mapped directly to the guest memory. I'm still
>     exploring this idea. WDYT?
> 
> 
> Yes, the struct looks a bit cumbersome and difficult to expand, as you 
> mention.
> But I am not sure what do you mean by FDT, or how you plan to map it to 
> the guest
> memory. Could you expand the idea?

I mean maybe it is better to use something like a flattened device tree, 
(which is a serialization of a device tree) as a way to share the device 
capabilities. I think this would be well compatible with the V4L2 
capability discovery process, as it is tree-like. Unfortunately, FDT 
seems to be too specific to device trees. The ideal candidate IMO would 
be a well known standard for a flat tree, that we can easily reference, 
with an existing implementation in the kernel. That's why we thought 
about FDT.
The other thing that comes to mind is type-length-value (TLV). It is a 
relatively well known thing, it is easy, but I'm not sure there is a 
standard to reference. Still using a number of TLV descriptors organized 
in a tree-like fashion seems like a good way to solve the extensibility 
problem because it is easy to add new types, obsolete old types and 
overall the approach is very flexible. TLV is used in many parts of the 
kernel. For example, ALSA. Still thinking about this.

About mapping: there are concerns, that the size of the resulting flat 
tree blob would be unpredictable. There might be some limits on the 
driver side. One of ideas was to replace copying and sending the 
capabilities to every guest with read only mappings. This can be done 
using virtio shared memory. Still exploring this idea as well.

> But from what I see, structures for most formats have similar fields for 
> capabilities.
> Couldn't this be unified into a single capabilities struct and fill it 
> with the raw data obtained
> from the host device?

I'm still trying to have a single structure that represents all of the 
device capabilities. I think there is value in this. We have many listed 
codecs, so the structure has to describe device capabilities for every 
supported codec. I.e. this is not a union. So we should either have a 
lot of reserved space for future generic/codec parameters, or use more 
dynamic structures like TLV. Or give up on trying to fit all of this 
into a single command. Then we may end up with many commands like in 
V4L2. I'd prefer TLV.

-- 
Alexander Gordeev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

Phone: +49 30 60 98 54 0 - 88
Fax: +49 (30) 60 98 54 0 - 99
EMail: alexander.gordeev@opensynergy.com

www.opensynergy.com

Handelsregister/Commercial Registry: Amtsgericht Charlottenburg, HRB 108616B
Geschäftsführer/Managing Director: Régis Adjamah
