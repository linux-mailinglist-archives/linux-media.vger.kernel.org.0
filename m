Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50E88705046
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 16:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233881AbjEPONJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 10:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233714AbjEPONG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 10:13:06 -0400
X-Greylist: delayed 1360 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 16 May 2023 07:13:03 PDT
Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 284721FEB
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 07:13:03 -0700 (PDT)
Received: from 104.47.7.170_.trendmicro.com (unknown [172.21.9.50])
        by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id 29A68108D2291
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 13:50:24 +0000 (UTC)
Received: from 104.47.7.170_.trendmicro.com (unknown [172.21.166.90])
        by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 31DFA10000D1D;
        Tue, 16 May 2023 13:50:22 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1684245020.573000
X-TM-MAIL-UUID: 1a19b495-80de-4724-8621-d7849d79f48f
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown [104.47.7.170])
        by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 8C2BE10001A7A;
        Tue, 16 May 2023 13:50:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDP9bwUmNnR8FepfkqljuUpDUVICvRucP4RhLegUk/DtFeuW5lXBrqR/cucTIADdS7PgTUqYMex09NoSJBzhiPqmMcGc/WWoTbmkOqY6GmCGragbdnd4bzJUysMRJIH9AzVtBNckSHBflfYYq8OrbI4BhTrmxqUvHIk1AIw4Q8n+603NJIU5L+C/HQzhdDREZxFzHFcwuPXZFh044jugDSCBHabC3AeBUlxfmMAupeWkLQYeBbd20Se5Dj/UZLtWr47cqBWCORRh387T1lJvyFAaCKo/xqgPaJM886yJAFsV5VKXD7dZIxe6rHXNk59LfvLaeWvD5tDeqUNgCvgFMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22iHRn1Wbr9yvFTr3voLyE76plRcaTMU/5EwpH3t4i4=;
 b=d0yWlYqfVDBz3sXeGJV0Sp0VIqCfqfnIUCEiHk8THzEGxA5UQv0MheIgybqn6J2HpwpF5W42m/GwuB2ERbXTzYxkLaLslYhv9BfXhP3dBLVIGCjXrJL6BDujPCNoPD7aqjJX4OjxnSBvcbtNPXQGlJbAgoRJQqb6fsT6yZ8vHHOF2CkUB6cYyWUc5AyygGy9FWACmLjMbVXinQJqdHnv80bFF2nPwWFV0iZ13gQxaGDosJ1NJRjpV6wtrq6SGtRHQ+8TMHSJhBN9JwtiJ2iVr/phaJ5NlxPgc8LIqCriYdEa8oAX4LIIxpY505PtEfc5XArh4l5bPZuKJBzcWo/8Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <f7b354d3-926f-04a0-61a8-1dbbb8924c7f@opensynergy.com>
Date:   Tue, 16 May 2023 15:50:14 +0200
Subject: Re: [libcamera-devel] [virtio-dev] Re: [RFC PATCH v6] virtio-video:
 Add virtio video device specification
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        virtio-dev@lists.oasis-open.org,
        Albert Esteve <aesteve@redhat.com>,
        =?UTF-8?Q?Matti_M=c3=b6ll?= <Matti.Moell@opensynergy.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Andrew Gazizov <andrew.gazizov@opensynergy.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Marcin Wojtas <mwojtas@google.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        libcamera-devel@lists.libcamera.org,
        =?UTF-8?Q?Bart=c5=82omiej_Grzesik?= <bag@semihalf.com>,
        Enrico Granata <egranata@google.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        linux-media@vger.kernel.org,
        Andrii Cherniavskyi <andrii.cherniavskyi@opensynergy.com>
References: <11372cda-a766-ef50-45d7-ed637b72a31c@opensynergy.com>
 <CAPBb6MVRPn6dM8ap9uDvX_ZHdHGvooq+LB7UGDaWBEuUtK3x=A@mail.gmail.com>
 <cbed366a-7f12-8642-18ef-350981279241@opensynergy.com>
 <87a5ylzf34.fsf@redhat.com> <87354dtp30.fsf@linaro.org>
 <87bkj1h0nf.fsf@redhat.com>
 <a3607ef3-ffd9-345b-0191-5bc946f4be19@opensynergy.com>
 <168329085253.1880445.14002473591422425775@Monstersaurus>
 <87v8h6dagr.fsf@linaro.org>
 <20230506081229.GA8114@pendragon.ideasonboard.com>
 <20230506081633.GB8114@pendragon.ideasonboard.com>
From:   Alexander Gordeev <alexander.gordeev@opensynergy.com>
In-Reply-To: <20230506081633.GB8114@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0493.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7e::19) To BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:4d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2663:EE_|FRYP281MB3211:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a1e3b2-e496-4b8f-da7c-08db56147c4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bLjkZutEMCL6Hhc72O1U8GmhMtKxUVTRG54/eR1+Cdmfn5uny26nNB239WCBHDnzF1yu3j1Cz+g4sdZ6eJ0kVYuNZQArRnwcA/8DfUo6DLfy4J0ZTq5fCe9EWYkNwIJMRCjdD1w+qffd7TCQAO0gCMCQkS7E1QPb8H/HspTghNVmK9jWisO8w1wfU1OsiHZTBDwtXp3eZT1o3YdPs4pzfybqqkTR2vqazi6NLHrrVzQJubgiViIbMXngs+v1f4tQUpQLiaysIiWOQAHa23DMER+a1h+Er4S1am01REReH7iqh0YrCood3gWHmHFuShamULNWP5+jSbl37rAzeopRuaamjtWfmpHwKMB2dGmPXWUpuDBg5YBrjD1+PIUc/8B9dNL9Atnt+VYWgeKMo7afnz9Md3ZN12fv0/QC+xMTymKlW9SFBCIkm5iY1vNmV1iQrmGA4UDN/hufzBEEweDQbhxbnDG0PgKhnMBaqbIVcCE3lRQGGnn7bp5yZC2aOMDjopwySTM/zRBIn5gdMZXcAZi1bIUgFsa9k35XtQpsO6UBBm/IslQd7jM1rjtlmPJBWzEmpjjbIoj/ElGsW1RkCnAtqmUBHror6oVlfvf7ytA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(396003)(39840400004)(136003)(346002)(366004)(376002)(451199021)(66899021)(31686004)(966005)(6636002)(478600001)(66476007)(66556008)(66946007)(316002)(42186006)(110136005)(86362001)(15974865002)(31696002)(36756003)(66574015)(83380400001)(26005)(186003)(2616005)(53546011)(41300700001)(7416002)(2906002)(8936002)(44832011)(8676002)(30864003)(5660300002)(38100700002)(921005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXkyR0lnQWFHN0hJcDhpQnBhK1dFbEJVQWw4bmFhM0xqQ0RodmNEK2toZFRI?=
 =?utf-8?B?a2xCaGMxaGxTbW5GamdheVo3akRveSsremVnOXlLd0xKbTkrY2ZqNnpyUVg2?=
 =?utf-8?B?MHFNVFJlaTBKWmRCYit3NDhOUWdEaHoveUpYTmxycGFDZXBKZms2eHVHNnl1?=
 =?utf-8?B?WmJkNXpjYmdvS0paL3NLME5sUWtoeFkxUW01c3BJbStGTjB4VWNSY0FlL09U?=
 =?utf-8?B?SEpJdHFWNFNsZ2VVVk1kc0tYQkQxc3BnbHBleWhFVDYrdEJlcTRDL28xalJr?=
 =?utf-8?B?b3RLV2gwbjlhSDVucldHeVB0K3R6bUdka2h4VDJabkt0Qmd6SmtyTXhVdm5L?=
 =?utf-8?B?TFFVdzEvaFQzaG9KWE1Cd2JYb1dPM0ZiRS9PRGd1RmQ1dWdtWE9iZVY1cjIz?=
 =?utf-8?B?TERXbytGQ1Fzc2Y0VzJKWGoxc25WaDFMQ3laTHM3aytCSDRNbG8zQmE1V0NQ?=
 =?utf-8?B?WmVLVDFtOG1nUWlMbFJ0Q1RDUEdVNE1FdWtabCs5eGxvRWtiVTEyaXQzZFVu?=
 =?utf-8?B?NFlKM0I3c1NaZTd3U3h2VVpXNHB3UHlPeFdrN0hwbUMwRzJHS2lpbFZqbS9x?=
 =?utf-8?B?UDFTVWszeDhQNG15VnBOcWFZQlREbnhCbHpCbmpwK2NYUTdVbWEyOUh3VWFZ?=
 =?utf-8?B?SEx0eERZeXBSdWxTam5SUXdOQndKZDcveWxuSkpFUXh3YzZ1bzJ5NEtYTGJB?=
 =?utf-8?B?dXlLY1VLSzYzcUhQZmJQOGc2ZTRTNWtkaXBKU2MxTU1MU09PTFE3dEdpN1c2?=
 =?utf-8?B?RXFsMURWTkY0aTNBUGFRSHRndG1XRHVtdG50NGs2QUp3aFJXd0VBRnhzUjBC?=
 =?utf-8?B?aU5HK1d2LzZnTHlwQ0lwSW12ZTVSbFJycFJuWWpia2owWitPUit0Vk1NMFZT?=
 =?utf-8?B?WHdCWFNCVlpBQ2MzYUpLK0ZMYSt1MTF5WGp4UkhlMS9zY3FaNWFodmFDcWFW?=
 =?utf-8?B?OTN3WmQ0RkVrZUZFTmVic21tbU5GUStGUHBRUmlqWGJOSEYyZ2V0cEhqUFRB?=
 =?utf-8?B?NlVqRU1sbm9TaFppQnFoUGRPaTZDOExsa2c3djY0N1dvelVXeTFiSGRscHlm?=
 =?utf-8?B?aUE0VmZZU2F5cVhQa2NnbVUxclhBanBjWkw2aFV0S1hwS0szUWdYUDNBNFFp?=
 =?utf-8?B?UTlGTXZxV0Y3eS84UWp5RDIvb0k5UGI0ZnB2blFRc1J0WmxjclhSVjU0d01o?=
 =?utf-8?B?cWVQY25zbkpKd0FtRkZsNFJnY1BtaGpGTWcyRThXMjFoS242VkRLbGdFYmJn?=
 =?utf-8?B?YTNQazZSTnAwRFI4MGVvMHFKVWNLQXU4ZVI2YXErMUtjWUg4aHRtZzBBbk1q?=
 =?utf-8?B?WTZlMk1selFmM2JpTEhvLzRxaW9COFpKZzlhbXZ1OXlnU0dCRjJZenBEQ0s4?=
 =?utf-8?B?bWRkbUVnelVmM3VtTUdXeGdUbENYQzFTanlUNGRHS2p3OUhOc0dITExSend2?=
 =?utf-8?B?clZybWgzSS9WMVRDQkhiRnU4M1ZFQTJJMUtJdWtIQWhjR2g4VHdCdWxJc2di?=
 =?utf-8?B?ckFRQ0hKbmF1Y2NxbzdldXhUcHU5TDhGVHJSVHhSS1ZZdCtOM2FubDBWQWU2?=
 =?utf-8?B?NjhlOUx6Ujk4dk1IVnZSS2J1QUpvRzdYUXdINEoxTjVxVEh5ekprN2ZqYU4v?=
 =?utf-8?B?Vitkd0hvOGVxT0xyOEVCdGtFYkVXVDVjWURjN0JDQ3R5QzN4NlBRRFIxVEEv?=
 =?utf-8?B?QUpYWWxuRU16UStjSFo0Z1VKRDArckp3RmpoOEt4SU91ZGpsSVZsVEJ3U1lD?=
 =?utf-8?B?NVZ4aUU4VlVxNzhuMGpCWCtnY01wb3dHQVVpYVM1WE4waGVMZlV4NmxOMlpx?=
 =?utf-8?B?c1pCNHovM09MVlJVZnlUUkpwZU1xS21JcHVVQ1VEOFF4WWFuRkhtZnhZNjBQ?=
 =?utf-8?B?aysrYWpPNlBKWm1HVkZ2S2VQQkZWUWFUNTliVHpzWVBicFlSZThTdUdBRXo1?=
 =?utf-8?B?eGtXNUc5dlovWTdLZ3BUMTNKcTZWV0JBcElHZjJjeXFrR20wajhOWUdCU3Zs?=
 =?utf-8?B?WnQvN3RjUVlSN3N5Zi9tWmJhYlRoMkVuaS92djlVd1k3Y1I0TnZWdXJhK0pL?=
 =?utf-8?B?eERoRWxFQnpkbDRIcDF5MlRoUTFBRXgzUEZvUVlBeU1MSytQa3hwbEpKYVBW?=
 =?utf-8?Q?Hg/puhR9elB56Q6EaUVT88PgN?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a1e3b2-e496-4b8f-da7c-08db56147c4f
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 13:50:18.9359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mAIK3lbIvFaSxtY8YdZgGTy7uFuR1ZMSZQbLKs57TaR1ntP1L+oYN5mQyWB2hfvTf+43Wq5Mi+6SBWBgwtQLJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRYP281MB3211
X-TM-AS-ERS: 104.47.7.170-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1007-27628.007
X-TMASE-Result: 10--5.958200-4.000000
X-TMASE-MatchedRID: CxmI61mtwh//9O/B1c/Qy6n9fPsu8s0a19GRXrN30MZWjSWvFszxqwun
        S16vgdV1kUx/UvKOwM2mPX9Q6MeqBWlj6sOkm2perDhiWxlwAeWwPJrVmmt35bt/YafNBu9csro
        aYqmkZ2otWrGT2jUcHEAoSn7YeQRu/bu+3CdDf0AiLmf+ghTG/78pAYpAfWtA5vfWU5BV7+A0yM
        SO7apIUCCeu8orJZJHn8L97fw6R7hhjejNb4SeBwHr9o+h2dSWEq8VpxNVVIkc5SGKNk1CG3iR8
        N4veKk9mC+wH+KoDco/xw+E3YkynHzLTypR/JvIRZfQN+FVqbAzNsXWBvGVBl/8lGqVstJX2esF
        NkLDierEeeXFyBbbajGfO8c/Brw86R2a1AWhcWRQIqE1CnEPF26Pap1MPdtHdE7HIe9l0my0IUW
        DWpPwzkMexL0JzYPwdBnQR261nS2X6+OgH9VyE1uM0WmjlVeiE2cpTKk2QcMK5I+5JVbn7sybRH
        tnHXFZp7MwxHir33u00CUVHJtoUygIRu43KG4G8MPuu+RzTf6RgLeuORRdEs9MhHp9AQ+0Bj4Ik
        PowPuEVQFY2fphvOfFENcfi0kqDh3UT0LEKUqwU7OE9fcKa8a06ui9xBYavnLIP3iZ4jNTq2Pjo
        vjDJwpcKVl1SoYwfbnzog9hGx5en8+7iBSXSDxfqkKQlk1I5kdxcTYk4Um3fUZT83lbkENmpfwz
        bC2aXp9RO7AwBVCTNnkBFmoDwzGJyWWSxDVHq+LfLuKfgdODrxZDnkdZZgZYaGUdeitddHYZcjA
        nJmTj4LV09zG9AlMyK5YNF2aorrRCSucc8Uyx+yskgwrfsC30tCKdnhB581B0Hk1Q1KyLUZxEAl
        FPo8/cUt5lc1lLgkU6UkIr/V+20QRlrBF3eZe2ASM+JM1cIjsgWmjE1vSzJj6e9t+AlSUtWZ/9s
        8L2nQQXq0JTf7PM=
X-TMASE-XGENCLOUD: 00c4890f-dff7-4b58-b329-9df1b08cc8ac-5-0-200-0
X-TM-Deliver-Signature: BBA18712F33003FB32A4DC614784AB00
X-TM-Addin-Auth: fktr2z6ZqWMF84JxkbfsYOv2ckBZi8G7sj3KzZ20uSEzZ8AXZAETShEDjiV
        np0y4VCmmysPHVOPeuQa+42QF1qyQvV78GRBGxIS17ApOruKBh/8Q/GH5gpNHGgqRWlf2RBF3aQ
        y/pq1MwwqSVCYKvjKL/sA73+9vqgcuO/bEpXGpFPEHw9QK3IM0Smqkk1A13Mr3RodDisDFc/xgp
        9nK2Y+IQEPjiaz3VtN0+3M8DK9F3nd3krcqGkL5t1qYcj91fMv/xGKyAyMMs9ZPkFdQyShomggY
        OHz4mNUiAmSKh/8=.HnvjWdGDQ05vnB0YJJA/r+h20g9qYWL6aIqTqneEYmc36SdFgpVzFDTmuf
        VE4uRtpQIAM9FwkhSTxkXV1hqh4g6UJJHrWUiLrmPXK2+9VgRKe+wzGxceJqqxp2rQVYw1Cj/vG
        9dNMmEOv4oTD3zh7PrcNLHTWrUsABk56XJD8Bb2FXm/m3rirdzp5Y70+s82TRaVUcLIO2p3cjqz
        TVFlcBevsms0sZxDoTbpOCdgI3oVqv9tAN3K4c97ohU4KwtmF9zZWbVFFJSRHemi8lakTYJr0td
        Kr/Itm8P/KIqmXkDloJeyO1GKZ5RxbE9+oGYlf3DacwVhCDJ1pUFihgPFFQ==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
        s=TM-DKIM-20210503141657; t=1684245022;
        bh=tUWPS0qtQNz+cQbcoS5uMPxLWM8sBkWM8tm15y0HzQg=; l=13773;
        h=Date:To:From;
        b=PvPgZfjZfP4+qxy71SHsixVjNILoWRp6XlfxFbjs3c8t9SoWNu6QVJozN37XbFJs8
         DSCYVPaDSLsAz/k2rWXjIsIFVMyWgN3/RxsfB8/L3XWZscyumlLgYe2e72F9/ZDx0Z
         JHstzWkZ9qCFtYEVOGEPCQsGliA9sV7RBd1nskYBNPaz3+wYkv8O5v4AdCRVMD/uO7
         0R+Z1VapBTpqM3lRU0YJzt0dsChJjxfuOCx2iCANra5kxCe7sE4vtThF16HlC7Ob8i
         mFKh7pazDQtPPsDZOiC43JuGS1TUOB3JJ2rqJ5+EuUtFDltlf5eWVb/bv3vdbOb/C7
         yW0EvxG7HRBFw==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

+CC: Andrii

On 06.05.23 10:16, Laurent Pinchart wrote:
> I'm also CC'ing the linux-media@vger.kernel.org mailing list for these
> discussions, I'm sure there are folks there who are interested in codec
> and camera virtualization.
>
> On Sat, May 06, 2023 at 11:12:29AM +0300, Laurent Pinchart via libcamera-=
devel wrote:
>> On Fri, May 05, 2023 at 04:55:33PM +0100, Alex Benn=C3=A9e via libcamera=
-devel wrote:
>>> Kieran Bingham writes:
>>>> Quoting Alexander Gordeev (2023-05-05 10:57:29)
>>>>> On 03.05.23 17:53, Cornelia Huck wrote:
>>>>>> On Wed, May 03 2023, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote=
:
>>>>>>> Cornelia Huck <cohuck@redhat.com> writes:
>>>>>>>> On Fri, Apr 28 2023, Alexander Gordeev <alexander.gordeev@opensyne=
rgy.com> wrote:
>>>>>>>>> On 27.04.23 15:16, Alexandre Courbot wrote:
>>>>>>>>>> But in any case, that's irrelevant to the guest-host interface, =
and I
>>>>>>>>>> think a big part of the disagreement stems from the misconceptio=
n that
>>>>>>>>>> V4L2 absolutely needs to be used on either the guest or the host=
,
>>>>>>>>>> which is absolutely not the case.
>>>>>>>>>
>>>>>>>>> I understand this, of course. I'm arguing, that it is harder to
>>>>>>>>> implement it, get it straight and then maintain it over years. Al=
so it
>>>>>>>>> brings limitations, that sometimes can be workarounded in the vir=
tio
>>>>>>>>> spec, but this always comes at a cost of decreased readability an=
d
>>>>>>>>> increased complexity. Overall it looks clearly as a downgrade com=
pared
>>>>>>>>> to virtio-video for our use-case. And I believe it would be the s=
ame for
>>>>>>>>> every developer, that has to actually implement the spec, not jus=
t do
>>>>>>>>> the pass through. So if we think of V4L2 UAPI pass through as a
>>>>>>>>> compatibility device (which I believe it is), then it is fine to =
have
>>>>>>>>> both and keep improving the virtio-video, including taking the be=
st
>>>>>>>>> ideas from the V4L2 and overall using it as a reference to make w=
riting
>>>>>>>>> the driver simpler.
>>>>>>>>
>>>>>>>> Let me jump in here and ask another question:
>>>>>>>>
>>>>>>>> Imagine that, some years in the future, somebody wants to add a vi=
rtio
>>>>>>>> device for handling video encoding/decoding to their hypervisor.
>>>>>>>>
>>>>>>>> Option 1: There are different devices to chose from. How is the pe=
rson
>>>>>>>> implementing this supposed to pick a device? They might have a nar=
row
>>>>>>>> use case, where it is clear which of the devices is the one that n=
eeds to
>>>>>>>> be supported; but they also might have multiple, diverse use cases=
, and
>>>>>>>> end up needing to implement all of the devices.
>>>>>>>>
>>>>>>>> Option 2: There is one device with various optional features. The =
person
>>>>>>>> implementing this can start off with a certain subset of features
>>>>>>>> depending on their expected use cases, and add to it later, if nee=
ded;
>>>>>>>> but the upfront complexity might be too high for specialized use c=
ases.
>>>>>>>>
>>>>>>>> Leaving concrete references to V4L2 out of the picture, we're curr=
ently
>>>>>>>> trying to decide whether our future will be more like Option 1 or =
Option
>>>>>>>> 2, with their respective trade-offs.
>>>>>>>>
>>>>>>>> I'm slightly biased towards Option 2; does it look feasible at all=
, or
>>>>>>>> am I missing something essential here? (I had the impression that =
some
>>>>>>>> previous confusion had been cleared up; apologies in advance if I'=
m
>>>>>>>> misrepresenting things.)
>>>>>>>>
>>>>>>>> I'd really love to see some kind of consensus for 1.3, if at all
>>>>>>>> possible :)
>>>>>>>
>>>>>>> I think feature discovery and extensibility is a key part of the Vi=
rtIO
>>>>>>> paradigm which is why I find the virtio-v4l approach limiting. By
>>>>>>> pegging the device to a Linux API we effectively limit the growth o=
f the
>>>>>>> device specification to as fast as the Linux API changes. I'm not f=
ully
>>>>>>> immersed in v4l but I don't think it is seeing any additional featu=
res
>>>>>>> developed for it and its limitations for camera are one of the reas=
ons
>>>>>>> stuff is being pushed to userspace in solutions like libcamera:
>>>>>>>
>>>>>>>     How is libcamera different from V4L2?
>>>>>>>
>>>>>>>     We see libcamera as a continuation of V4L2. One that can more e=
asily
>>>>>>>     handle the recent advances in hardware design. As embedded came=
ras have
>>>>>>>     developed, all of the complexity has been pushed on to the deve=
lopers.
>>>>>>>     With libcamera, all of that complexity is simplified and a sing=
le model
>>>>>>>     is presented to application developers.
>>>>>>
>>>>>> Ok, that is interesting; thanks for the information.
>>>>>>
>>>>>>>
>>>>>>> That said its not totally our experience to have virtio devices act=
 as
>>>>>>> simple pipes for some higher level protocol. The virtio-gpu spec sa=
ys
>>>>>>> very little about the details of how 3D devices work and simply off=
ers
>>>>>>> an opaque pipe to push a (potentially propriety) command stream to =
the
>>>>>>> back end. As far as I'm aware the proposals for Vulkan and Wayland
>>>>>>> device support doesn't even offer a feature bit but simply changes =
the
>>>>>>> graphics stream type in the command packets.
>>>>>>>
>>>>>>> We could just offer a VIRTIO_VIDEO_F_V4L feature bit, document it a=
s
>>>>>>> incompatible with other feature bits and make that the baseline
>>>>>>> implementation but it's not really in the spirit of what VirtIO is
>>>>>>> trying to achieve.
>>>>>>
>>>>>> I'd not be in favour of an incompatible feature flag,
>>>>>> either... extensions are good, but conflicting features is something
>>>>>> that I'd like to avoid.
>>>>>>
>>>>>> So, given that I'd still prefer to have a single device: How well do=
es
>>>>>> the proposed virtio-video device map to a Linux driver implementatio=
n
>>>>>> that hooks into V4L2?
>>>>>
>>>>> IMO it hooks into V4L2 pretty well. And I'm going to spend next few
>>>>> months making the existing driver fully V4L2 compliant. If this goal
>>>>> requires changing the spec, than we still have time to do that. I don=
't
>>>>> expect a lot of problems on this side. There might be problems with
>>>>> Android using V4L2 in weird ways. Well, let's see. Anyway, I think al=
l
>>>>> of this can be accomplished over time.
>>>>>
>>>>>> If the general process flow is compatible and it
>>>>>> is mostly a question of wiring the parts together, I think pushing t=
hat
>>>>>> part of the complexity into the Linux driver is a reasonable
>>>>>> trade-off. Being able to use an existing protocol is nice, but if th=
at
>>>>>> protocol is not perceived as flexible enough, it is probably not wor=
th
>>>>>> encoding it into a spec. (Similar considerations apply to hooking up=
 the
>>>>>> device in the hypervisor.)
>>>>>
>>>>> I very much agree with these statements. I think this is how it shoul=
d
>>>>> be: we start with a compact but usable device, then add features and
>>>>> enable them using feature flags. Eventually we can cover all the
>>>>> use-cases of V4L2 unless we decide to have separate devices for them
>>>>> (virtio-camera, etc). This would be better in the long term I think.
>>>>
>>>> Camera's definitely have their quirks - mostly because many usecases a=
re
>>>> hard to convey over a single Video device node (with the hardware) but=
 I
>>>> think we might expect that complexity to be managed by the host, and
>>>> probably offer a ready made stream to the guest. Of course how to hand=
le
>>>> multiple streams and configuration of the whole pipeline may get more
>>>> difficult and warrant a specific 'virtio-camera' ... but I would think
>>>> the basics could be covered generically to start with.
>>>>
>>>> It's not clear who's driving this implementation and spec, so I guess
>>>> there's more reading to do.
>>>>
>>>> Anyway, I've added Cc libcamera-devel to raise awareness of this topic
>>>> to camera list.
>>>>
>>>> I bet Laurent has some stronger opinions on how he'd see camera's exis=
t
>>>> in a virtio space.
>>
>> You seem to think I have strong opinions about everything. This may not
>> be a complitely unfounded assumption ;-)
>>
>> Overall I agree with you, I think cameras are too complex for a
>> low-level virtualization protocol. I'd rather see a high-level protocol
>> that exposes webcam-like devices, with the low-level complexity handled
>> on the host side (using libcamera of course ;-)). This would support use
>> cases that require sharing hardware blocks between multiple logical
>> cameras, including sharing the same camera streams between multiple
>> guests.
>>
>> If a guest needs low-level access to the camera, including the ability
>> to control the raw camera sensor or ISP, then I'd recommend passing the
>> corresponding hardware blocks to the guest for exclusive access.
>>
>>> Personally I would rather see a separate virtio-camera specification
>>> that properly encapsulates all the various use cases we have for
>>> cameras. In many ways just processing a stream of video is a much
>>> simpler use case.
>>>
>>> During Linaro's Project Stratos we got a lot of feedback from members
>>> who professed interest in a virtio-camera initiative. However we were
>>> unable to get enough engineering resources from the various companies t=
o
>>> collaborate in developing a specification that would meet everyone's
>>> needs. The problem space is wide from having numerous black and white
>>> sensor cameras on cars to the full on computational photography as
>>> exposed by modern camera systems on phones. If you want to read more
>>> words on the topic I wrote a blog post at the time:
>>>
>>>    https://www.linaro.org/blog/the-challenges-of-abstracting-virtio/
>>>
>>> Back to the topic of virtio-video as I understand it the principle
>>> features/configurations are:
>>>
>>>    - All the various CODECs, resolutions and pixel formats
>>>    - Stateful vs Stateless streams
>>>    - If we want support grabbing single frames from a source
>>>
>>> My main concern about the V4L approach is that it pegs updates to the
>>> interface to the continuing evolution of the V4L interface in Linux. No=
w
>>> maybe video is a solved problem and there won't be (m)any new features
>>> we need to add after the initial revision. However I'm not a domain
>>> expert here so I just don't know.
>>
>> I've briefly discussed "virtio-v4l2" with Alex Courbot a few weeks ago
>> when we got a chance to meet face to face. I think the V4L2 kernel API
>> is a quite good fit in the sense that its level of abstraction, when
>> applied to video codecs and "simple" cameras (defined, more or less, as
>> something ressembling a USB webcam feature-wise). It doesn't mean that
>> the virtio-video or virtio-camera specifications should necessarily
>> reference V4L2 or use the exact same vocabulary, they could simply copy
>> the concepts, and stay loosely-coupled with V4L2 in the sense that both
>> specification should try to evolve in compatible directions.

Thanks for the info.

Would everybody agree to have only a simple USB webcam-like virtual
camera and expect more complex devices to be passed through for
exclusive access to a guest? I don't have my own opinion at the moment.
If we have an agreement here, then it would definitely help us move
forward with the virtio-video/virtio-v4l2 discussion. AFAIU this is what
Alex Benn=C3=A9e called "catering to the lowest common denominator" in his
article. Right? So he prefers to avoid this using feature negotiations
built in virtio. Well, I also like to have flexibility. Andrii, what do
you think?

Would V4L2 be enough for the virtual cameras in the future? For me the
existence of libcamera is already a sign, that V4L2 (or the way it is
developed) might not be flexible enough for everybody. If somebody has
an issue in the future, they might want to create a new device with an
overlapping scope. Then the same questions would be discussed again.

If we don't know yet answers to these questions, and we decide to
postpone the decision, then this means no devices could be merged,
right? For me this would be another argument to keep things separate.
Because we already know how to do the codecs. I think there is no
disagreement on this.

Well, basically virtio-video has taken a lot of ideas from V4L2. So in a
sense it is or it tries to be a subset of V4L2 for the codecs only, but
adapted for the virtualization case. I think it is much better defined
compared to V4L2 for this scope. I believe it can be extended to support
the simple cameras if necessary. However at the moment I'd prefer to see
a dedicated virtio-camera device as I said. So I agree with Alex Benn=C3=A9=
e.


--
Alexander Gordeev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

Phone: +49 30 60 98 54 0 - 88
Fax: +49 (30) 60 98 54 0 - 99
EMail: alexander.gordeev@opensynergy.com

www.opensynergy.com

Handelsregister/Commercial Registry: Amtsgericht Charlottenburg, HRB 108616=
B
Gesch=C3=A4ftsf=C3=BChrer/Managing Director: R=C3=A9gis Adjamah

Please mind our privacy notice<https://www.opensynergy.com/datenschutzerkla=
erung/privacy-notice-for-business-partners-pursuant-to-article-13-of-the-ge=
neral-data-protection-regulation-gdpr/> pursuant to Art. 13 GDPR. // Unsere=
 Hinweise zum Datenschutz gem. Art. 13 DSGVO finden Sie hier.<https://www.o=
pensynergy.com/de/datenschutzerklaerung/datenschutzhinweise-fuer-geschaefts=
partner-gem-art-13-dsgvo/>
