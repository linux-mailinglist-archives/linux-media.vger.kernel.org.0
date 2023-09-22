Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D60987AA838
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 07:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbjIVFSd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 01:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbjIVFS3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 01:18:29 -0400
X-Greylist: delayed 614 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 21 Sep 2023 22:18:20 PDT
Received: from refb01.tmes.trendmicro.eu (refb01.tmes.trendmicro.eu [18.185.115.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE74197
        for <linux-media@vger.kernel.org>; Thu, 21 Sep 2023 22:18:20 -0700 (PDT)
Received: from 104.47.7.176_.trendmicro.com (unknown [172.21.19.58])
        by refb01.tmes.trendmicro.eu (Postfix) with ESMTPS id 631001099AF73;
        Fri, 22 Sep 2023 05:08:06 +0000 (UTC)
Received: from 104.47.7.176_.trendmicro.com (unknown [172.21.184.89])
        by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 4C68E1000062E;
        Fri, 22 Sep 2023 05:07:54 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1695359261.041000
X-TM-MAIL-UUID: 2a32f40a-3985-4827-9545-d92522c61283
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown [104.47.7.176])
        by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 0A3FD1000286B;
        Fri, 22 Sep 2023 05:07:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdbfLX2tV89V2hZcGYPt4GnCJC6HzALd1/6LXXHH+F2yfsEoKN9MK2KZbFqhQhHvxht5eYa9CTvH06T8Rr924u9ikt2IE3GPMKPqMsaj9X+Zx2mI+ag/1X42/HmNDKfnmiZ8E/xe7693KXqS0JYPmy/Ex/OLaw/AnyE/j34kAJWGMYmOv2G/GiW5wAMvlKtcaoFAHRYAgz8z8ZC8EmqP7J4q3jp6BbmlEnIkMyLO9L8dqFDvvVoYAOTo3lrrQtrhwbhr8bHranidjUUxlG37nVi6YAV7KGgNu5rCU6D3/WiNAdwMAaBUN5nEahC02y03ko+kxj05wiBPFAw3Fa0Z/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yN6MiFVkgAmcVybhPuiyifyeaue7tBBC4bRwxMiNXxs=;
 b=jWuRUCMknUg/g6k7EjBidTXRyHuLvuF6PloQdr1SlcM67l518UIKL2FOoHK0N8DB0brVy4uf75G9e24h4KW3GNWbVCd7ypA1/ZFT3dB8kvFeH5jnxqL5kAljdXYDF/bEG1f/c4OH4ZwOSFAuzcucM+7fc6GJ2eb3LKv4w3hsHC1HQRhRH7tfVjNAZCATNnzEaffopELt0cHTaYf0RrDxU5p5GyT0z9XMq8IgOAHGzqAfYOV7TvdX0O5fJznHYluNEYJE/JenXa+JsurDOtO1XhxzmIAQhFB3QcIPFKC9F85t4oXX5pBSpeqpHM7/T41WvETLlY/lz3QI5WsRZI1zkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <a9235fe7-7448-fa9f-ea52-fd27f4845bc4@opensynergy.com>
Date:   Fri, 22 Sep 2023 07:07:34 +0200
From:   Alexander Gordeev <alexander.gordeev@opensynergy.com>
Subject: Potential ways to describe virtio-video device capabilities
To:     virtio-dev@lists.oasis-open.org, linux-media@vger.kernel.org,
        acourbot@chromium.org, alexlau@chromium.org, daniel@ffwll.ch,
        dgreid@chromium.org, dstaessens@chromium.org, egranata@google.com,
        fziglio@redhat.com, hverkuil@xs4all.nl, keiichiw@chromium.org,
        kraxel@redhat.com, marcheu@chromium.org, posciak@chromium.org,
        spice-devel@lists.freedesktop.org, stevensd@chromium.org,
        tfiga@chromium.org, uril@redhat.com, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, alex.bennee@linaro.org,
        aesteve@redhat.com, Matti.Moell@opensynergy.com,
        andrew.gazizov@opensynergy.com, daniel.almeida@collabora.com,
        cohuck@redhat.com, mwojtas@google.com, mst@redhat.com,
        peter.griffin@linaro.org, bag@semihalf.com, bgrzesik@google.com,
        hmazur@google.com, mikrawczyk@google.com, srosek@google.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::17) To BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:4d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2663:EE_|BE1P281MB3154:EE_
X-MS-Office365-Filtering-Correlation-Id: 92863b31-f3cf-4da9-65ed-08dbbb29d7d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZHfBCCqIRJyHgLH/Tg0gm09i3wXjLrUQM/4CmuHDsyOfwTaLQUidGM3U1VnsN1klPAEH8711OA3yHSdXXM7xLvCkdla0NwOpbjFwfv1FMlRm6T3bemxo6RpIQtTnYLwIE9h8JyazIVoFdh0Sw3dYsKKu64A4LkwAxYruA3JlTm4o3GzpZGHUHRHqAjGZbD4AprfCpG8dbQ2cVtLX+NsY98phJ+3U9ze4gnYisLBI/mnTXFMJjqBvhc+kEI9v5EZFskTIUpNpgRxSY/tD2KIgIOdIwe+VjDYug3EC82ypwUZJvx5xDHVxSjsExfnVpcTM+274sWglEY24SCZDIZIwDwpODrk/oxfzq3yjlDRdua6y/Liv/YeC1YAz9PuF/sJL5AqUU2FlNelWoRCM1iOadnGxr4smyEDCYD2DDKmmIofmSYfWS66oBhUihBBscwNFA3yNWpZQkXowiK7Cb/g/a2/HvGlzlqduo8Qlh1xcz88iI5MGI66nz3mMOLq5lBaymUkWr+YrsrN5b0k98ku53BNg0bAgQk6lipb3q0CwtRKmDSeIxwXVqwoARQIMtAdfYewfZeiKU/ZVEawElPhSzTRDS6NvnI3KLFJ5ky/ccH2ffHl449N++HSaqZuY63AgwRbsccCCORSajuaArijICa0Vgh/jHX4edH+GsEP0llPyMl4uLo1fzyHtyvwEkqXwZLlCzE22hWc+2tfhR3183AP/SYSv3MATV6CXqtWCXQBHEoCTx0tnIFY045t11aPgP/2e69+qH2EJeAySYXckuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(366004)(396003)(376002)(346002)(136003)(451199024)(186009)(1800799009)(5930299018)(31686004)(966005)(478600001)(38100700002)(921005)(7416002)(2906002)(83380400001)(26005)(2616005)(41300700001)(36756003)(66476007)(31696002)(86362001)(66946007)(15974865002)(42186006)(66556008)(44832011)(316002)(7406005)(8936002)(5660300002)(8676002)(18886075002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXgrbHB1Q0tOOGs5V3JMMDRoV1pZazZiMytJOFo5dDhjV2U0ZDZsZkhjMEY0?=
 =?utf-8?B?SzYyWU15SzVXa0xxVks5YXdQOGlQWTJad3podXBEdlVhL05uNnh5VVBlNndW?=
 =?utf-8?B?a0xrNDBrbUcrSjNHTjdvN1BVeWJSTGZhQzNCbzk2ZEZPVjRyMldiQnZKQXUw?=
 =?utf-8?B?OHFhREhLQm5PMWFVK2xLYlNXZGZKU1B2Z0NWSDkxczh2NFR6Sm40cUROR285?=
 =?utf-8?B?bkRhZ2o2RTFJcW1oNEVHbnkwY05ZVFhpeHAzY09VZTJlVWgxRW9XQTN5L05w?=
 =?utf-8?B?bjBvR253U0h3N2d4MGRrVTg4UGoreUx4amhIeVVKcnN1aWdScXpYREIrL3Vy?=
 =?utf-8?B?T2U2M0E0dGQyUTg2dk9wUWdnSjNMbHdDbEluVW9ZLzNLRExnQnJMbkUveHFE?=
 =?utf-8?B?eit5ZUNPRFpYQU5MUmNqdmZnVmRNQ2F6SitrTTUwVmN4NzNhTk5JdWZBMEVD?=
 =?utf-8?B?SFJadytyTzc1aEZFNHRuZTY0TUF2dS9KbzVacXViODUxVFJzQTN4djc5R0dk?=
 =?utf-8?B?aEVyNm5YYzNzVkhKa1lhLzJDMzNyeFk3OW9hYTBtTklDbW5zTzZvOGs1Z0Ra?=
 =?utf-8?B?RHpMZjB0MTJSNWZRQmtkaEZUc0NmV0VzWE8yc3hmZGVhK0JCdzFaNUxLd1JX?=
 =?utf-8?B?QUNQUnpnWUYwZ1h6Vm5vRkhPMmg5b3ZtclQ3c3NiTGxKMG5hRWVwY29PYkUr?=
 =?utf-8?B?QUU0cHdUVUtvd0JYREs5cThybjNsVjhrRGxNLytUbzZSN2VVLzByNHpldVNH?=
 =?utf-8?B?TkZzd21tUzh0VlAxTndrYS83d3hnV2NkY1FHVG1oNlZmbUFXaktpdGpOY1ho?=
 =?utf-8?B?S1RidUZrb1lpSmkyaC9KcytzWXhrUnNsRUtMZUtubUwzc2RaZ0FnMVFDbEhU?=
 =?utf-8?B?bkdSVi9aWXp3NEZwT2hML2VMOCtoaHY1WUllbjVXYjBadzV1SDNsejQ3SVdF?=
 =?utf-8?B?R1dXZXNMdHdsSytWdnMyTzNSY2RuNzFRdkZzYVBRNWhTeWV5Vm9kSG1tQTZP?=
 =?utf-8?B?elJSQzI1RUpjV1Q1RzN6Y2ZrNFZJblNZemlJTEVmM3RHMWtRbFFhNG05TEoz?=
 =?utf-8?B?Z1I4VGJXNVZnTDc4UnNQOEwxR1E0aHl6SjZHRUhCTjNiNHBUTFVqL05lNklk?=
 =?utf-8?B?enlkVG4wMUwrbGhkK3Nnd3BmS1ZqMXFzNTNCMGpHNVlyNld3QnNRcWlnUWxJ?=
 =?utf-8?B?M3hWZXhVV0RvbnIvVEFmTmtjSDNFZVVEMlZRN1hDSGp3VEpFc0dZY0NTOFE5?=
 =?utf-8?B?R2F0QmNjSlk1TDdSb0w4dTJqRlJGaUdTZGFKaG9aNWhxdzdNcjNJSTRHTmZ4?=
 =?utf-8?B?bllZTmU2L20wbGFvMUZsUzJnVk1LNlNQaWpraXkvekN6QWl5eHZVQmVvRFlN?=
 =?utf-8?B?dnBRTVoyRzk4L1BlcWtXVmEwOGJNaDRIYk1neDUxdkNFb0VFZlJHR2VERith?=
 =?utf-8?B?NWdHa3VTSmhtY0JlakJ3WjM0bHo1TjdkVHdwVXpoVElaQlJhQUlKRENxTFFm?=
 =?utf-8?B?YmI2RUcrQ1lEa0k4YnRNc1dYbWJjWlh2b0ljRThIcmlxNnliSTc0U25rVXVU?=
 =?utf-8?B?QWhYd0ZTbnZ5aFRlSUs0OUhjZWdDMmdlaUZZdkdBTXZhbnFlejNyelN3dWpV?=
 =?utf-8?B?cHZMRWJvK2IvYVRmRGt2OGFwNHBJT2V6bGRDMFVoZ25EWmNUOGZkKzB2cXpC?=
 =?utf-8?B?alI1Nm1vemZGODJEeVZaYlFQRjB5TEhTWWJWdkJtQzVnam1COTYvelhEYmgy?=
 =?utf-8?B?ZnVpbzFpbnBxUmpzVzFxdzllcHFYdmNoZS84bVBPZUJpVWE1N1FjcEYxdkg4?=
 =?utf-8?B?MmpqRnY5MUdQNUxwenZpaGpPUFhaaFJmaS9acE50OUNjemtaVDJ5NTRQS09H?=
 =?utf-8?B?cEFubkk1L1p4LzJSYkwwcTA3MmxhQy9JMll6VkQwdDJEbURrVGVXMTBjOENU?=
 =?utf-8?B?aWZpZnFsNE13eTRZbXczZm5IajJ3SDZYWTlCQnlzak85MWdjZ0c3ZldRdGFC?=
 =?utf-8?B?S1dxc0xnN3doRGtJNmRZTHJzVjRGZmhmcEl5ZmxrY2NBd1BYV2lNSEx2S1Ru?=
 =?utf-8?B?OGVJenNKQjBuek5hQm1raTRhYTdIMGNBSmpLajQ3dEdvbmZKYkFYd0F3bVRD?=
 =?utf-8?Q?upjOyIB1vnVHwb3LJOc2eq3Pu?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92863b31-f3cf-4da9-65ed-08dbbb29d7d2
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 05:07:39.3700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UipAyRv8FTrhHuHt2s7VSOlSd2q+IfD5XZbFRDgLBbC9iFacRqVxw06jjSR9+IazDanlSCCiSg0vPoPDHi6w4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB3154
X-TM-AS-ERS: 104.47.7.176-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-27890.005
X-TMASE-Result: 10--16.668900-4.000000
X-TMASE-MatchedRID: FQo/JhuHF01KqT77NMMyN9EZ3jNruZrPot3Ofzz1dbi3UJJ8+n/4RehN
        gbwdZB8UWJpOrSjVdnrFxpc7n9erTlDacerwe6l8x38MG44f3Tc3RfriMbLZ1vt7J0kZt8YlKdn
        iFN+X3b5f5vdaJLLHn/goyhVwabhNN7b5iLtubbNMCZBGHoBAR1rJp/0y4AzxxlsGA6eTSFK3SX
        oF55/a8tQedxpOh8KwwoL8NIgz4Dn9b74OUTj2iSHbUYHbu3LPxnUu4M/c1YlleIkVxMgTAxgvD
        LMzLQnuORoZNSkXTnoT73/tlZDCEWiD96RZssbneSUw6IG1eISf5QQnTNDZEUkesfMQVg7I2oop
        6Ld8r8FCI3QTSsw2zImWDvGel55qhyjeWEmHQDTf2e6voWUFXvJDp0CY93MSWFe19Q0JTRtiGP1
        yHINT+LUE83Zdqe0We5A973mOy3MV+fvsOsaWz4WEan0Y08OtV88LvFbHpYixudxEPUAkycvCKA
        sDjreyNRD5oLANi5eyDeu54YBmztvdb/NKBeKttmEXwa2cEfQXvL1PIQ//btdJXjU/xdoW4f8xw
        8uex9g4hm8PoYe6rymGIwNYCko792eICjU9gdkQ9JMcGBx+/lXStJ6kHdl4Ft1H7vV0s3EtdXlW
        86mEGv/WeP3HeoI9x/lIofa8xEXHXSTxCrKgDJHDd/Fd5gI2o4NJa7SjFsoNof8VS2Ruh07zkly
        hPTD9nKEfcY9uuEu/2tJ3foSBQsD3fX6Y132wU9D8gZ7zYu3yMXSQdzxi9A==
X-TMASE-XGENCLOUD: 5ac54c4d-f6b7-4838-9b99-869183441306-0-0-200-0
X-TM-Deliver-Signature: 0887E9B088D4830F340337C64CADA2DB
X-TM-Addin-Auth: /8ToSKb3LJflril+uMt2fcRtIIxYQ1Plzv9l+399hGmuSRJ410MrF03QmCU
        g7/nt+Y9d61DSDAUzOR0OQV6ve5Xg9etmhT6FkA7ENNTegHroN3qs8mbhf83b3k2T3FIhLzKahq
        TBs1SYIuVKzUgPt2Uv6y59TVIdnA1yirorxqkGNn/iFqe+cznn6v4tzMuSWUE1r9HrBhu/JnPk/
        wbu5pajm4ck8ffjtvZetg86J+2FlT4a4/mlcezYijRj31iZFILMf+93a2UArEKgMNhcCigKJqby
        TFoHYmvDR7cRDlU=.BWsmc7OQT6tTN/MGTNU+yiYrVbmRnR6bhFYaB+nhy4qsNo8Pd7JqITcjPI
        0DB9n6Kal/GcQYCyp/j3b/u44rNPHtbUko8A+wXSAzF2VifPHSY21OkcTZTvXqkXNclBLhAZNil
        vVCQDGrhddrA0hEO96lzHkh67GIbjqA58uRbdutkdvHa5fz97S/Rsrxy3dqjKt63m/VagwxWosJ
        NNDurikwmpPmFu34y4mstQ4Tox+RoTZ95uJkr6Hs+AOjLCv29VOzXMvrrB23ayzFTH0vUGv7TIn
        5TPV9GmjUtYITLc+ggIbGuB8iS5VJ64DWm9z6F825aKbbFN8dkhdc5hBJBg==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
        s=TM-DKIM-20210503141657; t=1695359274;
        bh=AnyVpmmuhvGceMTaXwpWn756aR/PnE6PzLPE/gWi5aY=; l=6265;
        h=Date:From:To;
        b=lJfKcowYtXfc7JnNAbE90JTNT6WNnpyIr3s48MwL6yqXUs0QeJ/1AlZfoLT10kDDO
         JG2BUXYm6b+zNDgUuNeRx38AxLz+tVeSjtIGkowsagosCHZVAwlMvaMKy/FTfeLn1j
         r3N096QbGLW+H7nTY75l8c/PiFgMfkiCypQptP51emK6pLvD/wP5L2I2Kkh29e3uQu
         gi/PSgcZAgQ2XaNBjLuNOh83nWhyPjgNZVZRssL7KD2uqExpBK/sAcaNo6KTwgnO++
         Gi2cYv7axrFrVosexTAeGPU+JkLaOGYGsPcTs3kgO04R3TTEhs9Bl5bbpjX/JmSroe
         Ax8Fj8xTa9iYA==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I'm working on updating virtio-video draft v8 spec [1] and the 
virtio-video V4L2 driver [2]. One of the things, that I don't like in 
the current spec draft is sharing the device's capabilities with the 
guest VM. The main requirement is making these capabilities compatible 
with V4L2.

These capabilities could be pretty complex, see [3] and [4]:
1. First there could be several coded video formats. Coded formats have 
their specific sets of supported controls.
2. Then for each coded video formats there could be different sets of 
raw video formats, that could be used in combination with the selected 
encoded format for decoding/encoding.
3. Then for each combination of the coded and raw format there could be 
different sets of supported resolutions.
4. (Optional) for each coded format, raw format and resolution there 
could be different sets of supported frame rates/intervals.

In the future new formats, controls, flags, etc could be defined. Right 
now there is a rather static structure, see section 5.20.7.3.1 
(VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS) in [5]. It looks too inflexible.

The V4L2 approach with many different ioctl's and complex querying logic 
doesn't fit well for virtio-video IMHO. syscall overhead is only a few 
hundred nanoseconds, so doing tens or hundreds of them is bearable in 
case of video. But a roundtrip over virtio may take hundreds of 
microseconds even in the local case. We at OpenSynergy already have 
setups where the real hardware is accessed over a network. Then it can 
take a millisecond. People already seem to agree, that this amount of 
overhead makes V4L2-style discovery process unbearable on a per stream 
basis. So all the relevant data has to be obtained during the device 
probing. This means, that in many cases there is a complex structure 
with all the data on the device side, and we just need to move it to the 
driver side. Moving it in one step seems easier to me and better because 
of the latency. Boot time matters too sometimes.

One of the ideas is to replace the mentioned 
VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS command response with a standalone 
Device Tree Blob. It looks the most promising to me right now. I guess, 
it may sound crazy to many people, but actually it fits into one of the 
device tree usage patterns outlined in [6]. This document is referenced 
in the kernel device tree documentation, so I assume it is correct.

A simplified version could look like this, for example:

/dts-v1/;

/ {
     virtio-video {
         compatible = "virtio,video";

         virtio,video-caps {
             h264 {
                 profiles-mask = <0x3ffff>;
                 levels-mask = <0xfffff>;
                 num-resources-range = <1 32>;
                 buffer-size = <0x100000>;
                 bitrates-range = <100000 10000000>;

                 yuv420 {
                     plane-layout-mask = <0x3>;
                     plane-align = <1>;
                     stride-align-mask = <0x10>;
                     widths-range-stepwise = <96 1920 8>;
                     heights-range-stepwise = <96 1080 1>;
                     num-resources-range = <4 50>;
                 };

                 nv12 {
                     /* ... */
                 };

                 rgba {
                     /* ... */
                 };
             };

             hevc {
                 /* ... */
             };

             vp8 {
                 /* ... */
             };

             vp9 {
                 /* ... */
             };
         };
     };
};

Or maybe the resolutions could be defined separately and linked using 
phandles to avoid duplication because they are going to depend on the 
raw formats exclusively in most cases, I think.

There are many benefits IMO:

1. Device tree can be used to describe arbitrary trees (and even 
arbitrary graphs with phandles). The underlying data structure is 
generic. It looks like it can fit very well here.
2. There is a specification of the format [7]. I hope it could be 
referenced in the virtio spec, right?
3. There is already DTS, DTC, libfdt and DTB parsing code in Linux. All 
of this can be reused. For example, at the moment we have a custom 
configuration file format and a big chunk of code to handle it in our 
virtio-video device. These could be replaced by DTS and calls to libfdt 
completely, I think. There is also an implementation in Rust [8].
4. I think the standalone DTB could be integrated into a board DTB later 
reducing the amount of queries to zero. It is not going to make a big 
difference in latency though.

If device trees are used, then we'll need add a binding/schema to the 
kernel or to the dt-schema repo [9]. Maybe the schema could be 
referenced in the virtio-video spec instead of duplicating it? This 
would reduce the spec size.

I don't know if anybody has already done anything like this and I'm not 
sure if the device tree maintainers and other involved parties would 
approve it. That's why I'm starting this thread. Please share your 
opinions about the idea.

An alternative to using device trees would be inventing something 
similar and simpler (without phandles and strings) from scratch. That's 
fine too, but doesn't allow to reuse the tooling and also is going to 
make the virtio-video spec even bigger.

[1] 
https://lore.kernel.org/virtio-comment/20230629144915.597188-1-Alexander.Gordeev@opensynergy.com/
[2] 
https://lore.kernel.org/linux-media/20200218202753.652093-1-dmitry.sepp@opensynergy.com/
[3] 
https://docs.kernel.org/userspace-api/media/v4l/dev-decoder.html#querying-capabilities
[4] 
https://docs.kernel.org/userspace-api/media/v4l/dev-encoder.html#querying-capabilities
[5] https://drive.google.com/file/d/1uPg4kxThlNPBSiC4b5veyFz4OFGytU7v/view
[6] https://elinux.org/Device_Tree_Usage#Device_Specific_Data
[7] https://www.devicetree.org/specifications/
[8] https://github.com/rust-vmm/vm-fdt
[9] https://github.com/devicetree-org/dt-schema

Kind regards,
Alexander Gordeev

--
Alexander Gordeev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin
www.opensynergy.com
