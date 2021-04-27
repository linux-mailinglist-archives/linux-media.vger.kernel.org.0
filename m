Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C73CD36C7CC
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 16:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236463AbhD0Ods (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 10:33:48 -0400
Received: from mail-eopbgr10131.outbound.protection.outlook.com ([40.107.1.131]:25668
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236173AbhD0Ods (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 10:33:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9VNjmNoS6X+0/M7yudACmpKLVyiNNiEv5LaMWDhiStZRSF/xem0BK4KHZdjplPTAfKdCRE8KkPjR8l+pbmOBeTfO0u3yU4+Er2yihoCjYaKKgi2iKw7YCI5/agion1H6gW03hoWV4AZIY+eOvQV/Nc3khAWMNEOvGQN3xxPwW8q7AdB2AiyC7Q+UVGY1SVeyTjSd27leigBa2SO14Z9DhbHIYXnV7DjzAiQmpXnjH1GF+aTjsSfv4SlTUhAeITtKvtAcdDvUGrXoqukMOuR5Ws+4ZuSV0p0QgWGaHckrTli3+ahQDWcqXUMTOKy19m33ZVNZ8/BOwxLRvClPcJ/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEOeIciPpPXXLTcdsycQGAy/qYTtNyPAsg8/t0SjPoQ=;
 b=QrLA4EEWUyErJxFUHnuiv1lym+r7euJWF8ANKl8Cp1/nuWadLRFJ0FMM9y7e8Pp1IytiR4QeA0YNt7G3TklWhpyI0eReI7YbgnPxRr8hL6JXMIHBptBDi0DiukB9p9s1ou2Exp8mYwAF6kujNRHP/x4CzyvFld/mV/Lo8UdseGsVbHJU2lp90ljbOWV0SKfQIBQARXq0H/SfxrGzvMCKKS9s0J6GHLxytgy4KaQBQT3IcKXS1DK7OgWvsre9A0Rhu2bI0/F3k+pt+QbglaGfScxPUAeXU6xFZnFK/kI+j6ruAvxZvjMwm2bYMlmvA1wKYS0MkcTTVHtO6eV74SC9nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEOeIciPpPXXLTcdsycQGAy/qYTtNyPAsg8/t0SjPoQ=;
 b=cE4QFjP6VvidiBgsz5bspN4YW3ZQQULJvmxkJk9k6+BQwME5hmbyov4H8Phyv2yW+lbUNYLO8BOUyORIal2g71SETGbGRqy1jmpkZyZTgo7L4ih6GkMrtGiHhiFeT0AC0VTTmvFJHvU+pCFHUTFSOR5Ly00fya3sbJoGaWJYXxw=
Authentication-Results: ndufresne.ca; dkim=none (message not signed)
 header.d=none;ndufresne.ca; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM8PR10MB4627.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:365::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Tue, 27 Apr
 2021 14:33:02 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 14:33:02 +0000
Subject: Re: adv7280: Scrolling images on imx6
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <CAOMZO5CacHaESju9XQU1C7NU41Myk1-2_+7sju1dnCZuqRv98Q@mail.gmail.com>
 <CAOMZO5BEre9=se1yAxr7QTmfV_N=GMKZeanr+jYfRNrSO551hg@mail.gmail.com>
 <4ea17a0c-b442-1ca2-1ae3-7a305d53273f@kontron.de>
 <CAOMZO5Bztrpm4aB9=DmR=3PNfZUoM_niT_+nVE-ZOQm5aUEWBA@mail.gmail.com>
 <303d14cc-1ae0-8d82-77ba-66156a61d777@kontron.de>
 <CAOMZO5BiYAMvVawZRAR9tbdf9XxicfdoX=V8HpYQNq5U4YZvfg@mail.gmail.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <3c661333-4b92-67a8-54ee-2eee14fb0849@kontron.de>
Date:   Tue, 27 Apr 2021 16:32:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CAOMZO5BiYAMvVawZRAR9tbdf9XxicfdoX=V8HpYQNq5U4YZvfg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [46.142.161.205]
X-ClientProxiedBy: AM4PR0501CA0056.eurprd05.prod.outlook.com
 (2603:10a6:200:68::24) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.27] (46.142.161.205) by AM4PR0501CA0056.eurprd05.prod.outlook.com (2603:10a6:200:68::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25 via Frontend Transport; Tue, 27 Apr 2021 14:33:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ec00258-305c-404a-4da6-08d909895cad
X-MS-TrafficTypeDiagnostic: AM8PR10MB4627:
X-Microsoft-Antispam-PRVS: <AM8PR10MB4627DE01DBC8F0A616CF50E7E9419@AM8PR10MB4627.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hAN1vstR9C9yDfxGML5/Njqb3ET+fH7XR+ZL6EUirxUOyk61pZZ/Qw/qBwAf0n6lC845kGjM1JB2P/xYBNBmuHhI2VDYHz9Wir646g+XcpjIajgioKmNfg+8Qzs5SndReycA3nK/DUeI9Fr0dyD6iBrYN1Tnnj/zDS/2+bMUrPJzTA0s5JfdJ416nFGPoqFPScjCGivMw9ul+ZpVQyT0kYgBugbRjeHXIpZxPQhR8qPsix+MVBYrBiJhHS5UwMgcKO81YWLVZ4zO9O9tigTzUOhf3O1bd1KEwfVtlCK3KqTomTDxdUDl1b8kzB+O8MTUMBBsU+kXN2v4P2o3+OKcwLziVguTEP6paidYYqzExDfuniVFp3IOcw3utQwt7sk0FaQDGyTK2NdI7urjpCu+S1gBSWLJ7VIXBM+1A2hYSqYFP7Lk20YucMiQPVerOIYtKcUR36WIfzCwDq9i3nKHT3AoEOSXscIIPFmBq7G12XHWfTJOlDt0Kmd7kA31C4AXdwg7PVofpHe5zqbDzdGaQgZE1/ibMTq9FQTWKbz0udXDO+3zkbA7ShRze2j4eBkOHiJE7X7A2jSUNLqapXQijAmK4P9mYXz/3qCRwd49NeuE2vmqaNm2gkGl4iMtq1qdryCJeX1UYIFoIWKeFeZyfQw+ST3wSZkFaMQeUohCdkNDxqUIUtejetlOjJ5wpgNCcXxoXfG3j5A8bsZ/TSjRTaXqHz+VAJYVx3ZDKjPKMHppTaaw6ZccxR3289WbyOKOkfI6npNo1dQsWzoMzRxX+DxpCVw6jrjFXDx0UMcd1vOvKzDgBxMmi8XtLRQmmLUI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(39850400004)(136003)(53546011)(31696002)(2616005)(2906002)(26005)(44832011)(38350700002)(478600001)(6486002)(36756003)(54906003)(86362001)(52116002)(4326008)(31686004)(66946007)(66556008)(8676002)(45080400002)(5660300002)(316002)(16576012)(66476007)(38100700002)(186003)(16526019)(8936002)(6916009)(956004)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TmdCU0RrY1NYaXVGVVl1dFYvNDBrYndMcUZKVTl5RHBHZUVwTDF2NTM5M1Zx?=
 =?utf-8?B?aWM4MkdQZmVvZVBpWUkrckhUbldlTnV6WlpBTVU1cFI1YzhjQ3pHZmZ6eWRN?=
 =?utf-8?B?SEJESnFhREZTZmRSZlMzYlZqekNxRUR0WmlESmxvcEVvSkxraExBTmY3emRR?=
 =?utf-8?B?NnFPZG9rbS9JSmdSZkJCZXlrbHhoSFBPK2lZVWFJNCtETlV5T29samJuL21D?=
 =?utf-8?B?bmxkc3JKdWZmdjB1YlRwckF5ejhKUzBGcXJ4RnJhbmFnb3RYZHdYZUl6MExS?=
 =?utf-8?B?R0NYci9nUU91QnltcFNtekx2bzVpaDB0Z1pNV3dQbnp1R1dldU9NWGlzOFEy?=
 =?utf-8?B?Z1VzNU5FRFlqN041N2hQMWVVTnhSTEVVQk9tUVJMeHRRVUZSZTE5NTRka3ho?=
 =?utf-8?B?aHpySGdwd3F1S1BkamEvSjY1cmZEWU14YkJzWUQ2aUdseExtdVdlbUFzSUox?=
 =?utf-8?B?S3J4em8zM3Uxcnd2U011VmY0MmNFSGZhb0V0dlpyRDFNeWdUSUNRS293bXpJ?=
 =?utf-8?B?NlBoQW55dnpRS1Nhc2l3d0l3Z2RZRWpRUzZ0VTg5ejQ2aTMreDlJcDQxMm1O?=
 =?utf-8?B?aG0rb08xelNPT0hUQ0tHKzlsRGZVaWVPemtPVHpUYzRnU2NkcFlwZXBIWG5L?=
 =?utf-8?B?MzN6K2lGdXhnMVUwVWgzZVdYZE5pRXpBYXlpeWFoYTVLa1BjL0podWc3STJO?=
 =?utf-8?B?dG9GQ0VCVjVRS3lpaHZJNHA3bmZTMmw5aTh6dmo3MmxWN1I5OWpIc0JCWDdl?=
 =?utf-8?B?S2cwQlhrU29CZmQ5M2wyaUU3Y0FidUtMS2E3d1NON1h6c2NtNFF3ZnRaWWZQ?=
 =?utf-8?B?NE1BTWFDdUcwa21iMUt5eXh4cit1U2daZ3gxNS9tZDZVRGQ3QThjNWd0MS80?=
 =?utf-8?B?WHdlNWxtbWgxQkxma2N3NGxmL2RUVzJkeHRpbnRYbFlBOVZVUFJrdjc3TXlh?=
 =?utf-8?B?TGJrL3Q0SU9QL1JmVjNoNUZULzF1K2wzSnc3NWxKek9rSmlOUTVKVGRxcE9r?=
 =?utf-8?B?OWRWTHhGTFFWSG12YkhpN0lWaWFpV2tGQ1Y3Q01WQy9MWE12bEVObDh1VjBs?=
 =?utf-8?B?TWw1eHMzU1k4T1JxaHJLQkxFWDJNUWZWTEwyRU9qOVpIU2lndEFhTzBtcWNP?=
 =?utf-8?B?Wm1lMHlRYno1dldobnhJeE05Nnl6OEpKcVZEVDJPQjNHMWNxUTYwUFY2THl1?=
 =?utf-8?B?ZG95QkVOMWROWkFsNWh3NXZlM1lIMUQ3cTM4M041UUN1WVdvVUF0NjlhaEhu?=
 =?utf-8?B?bnZGTmJVaXdpbU81WkxYQTdwYXhqRDUrbmhtYW1Qd0lRUVFRU012VWFpcVBS?=
 =?utf-8?B?VHJFbkd6SWVjUVE2alBDU2Z4eFpkbVlKS3MwTmFEWWxnc3ZlRW5yYUJDSG9j?=
 =?utf-8?B?Vi9aL2JxZCs2Y0l5QzNHTGJ2QnlvMFhIWW1EN0gyeExuNmxFUmVMclhSOVJU?=
 =?utf-8?B?RUZNd3BHQ3dodVA4VUM0NmxtbmpyaS95c1NGcXlOUERjSEFxYnY1Qm4wYnF4?=
 =?utf-8?B?THl4b0VsVG9SalM1ZGZCT3ZxVkhDTUt3N0tBcUdodk8zTTJZQ1ZuWEtmeHlx?=
 =?utf-8?B?bkp4Ri9hdkFnVnZVUU43U0h0ZEQ5Z1lsbmRvMHI1bU13Z3VSVTBQZW9xdEJX?=
 =?utf-8?B?YlVhK0ZDaS9GeXpzZVg5alBWKzZndmdZS2hxdUUwOG5CakRxbFdFTlFlWVR3?=
 =?utf-8?B?djFEbGdiUTNNQzF6akl4UGRJNHdXb3dFbktFSCs5ZkY4QVhwdk1ud3E2M1Fm?=
 =?utf-8?Q?9Iw62SeFl4Ow2j0OhxHH9lFMkuz/HnIA1R0XV+O?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec00258-305c-404a-4da6-08d909895cad
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 14:33:02.1515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+AvznZIzMYt82r35oWAaVxSQl6ZbVpJWdepIUXmXddwP9ewmQemPx8wmtDo+xSB4fj7qzJvtsvwk30HMYQr0pFu+Z9oE8DwT13bHZC6B3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4627
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27.04.21 16:28, Fabio Estevam wrote:
> Hi Frieder,
> 
> On Tue, Apr 27, 2021 at 11:15 AM Frieder Schrempf
> <frieder.schrempf@kontron.de> wrote:
> 
>> You're welcome!
>>
>> Just a question: What issue do you see without Steve's patch?
> 
> Without Steve's patch, I see the captured image slowly scrolling
> vertically, like an old tube TV.
> 
> Once I apply it, the image becomes stable. The board I am currently
> using is based on an imx6dl and the ADV7180 is connected to the
> parallel CSI bus.
> 
>> I'm asking because with my setup with the imx7 CSI driver I'm getting a
>> stable image, but it has a vertical and horizontal offset that seems to
>> vary each time I enable the camera. I was wondering if this is maybe
>> caused by the missing frame skipping.
> 
> Yes, maybe the imx7 CSI driver needs this initial frame skipping mechanism too.
> 
>> But still I'm not really sure if we can compare this as I needed another
>> patch for the adv7180 driver to get it working with the i.MX8MM in the
>> first place:
>> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kontron-electronics.de%2Flinux%2Flinux%2F-%2Fcommit%2F0d90331a44d0f718b7327a94fc72612ddcb4ac0f&amp;data=04%7C01%7Cfrieder.schrempf%40kontron.de%7Ce015a3d00b6f4c26745b08d90988c0e2%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637551305224798164%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=c2W1OlaTvbjBDxkbVvJJtgPCRnsi7sCIA1QgiF9nZEM%3D&amp;reserved=0.
> 
> Thanks for sharing your git tree.
> 
> In the next days, I will work on a different imx6dl board, with the
> adv7180 connected to the MIPI CSI2.
> 
> I see your tree contains some adv7180-m related patches. I will give
> it a try and report.
> 

Ah, I forgot that your setup uses the CSI interface and not MIPI CSI2. 
So it's indeed somewhat difficult to compare on that level.
