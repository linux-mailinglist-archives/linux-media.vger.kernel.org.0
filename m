Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23F0A36C79B
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 16:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236368AbhD0OPt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 10:15:49 -0400
Received: from mail-vi1eur05on2116.outbound.protection.outlook.com ([40.107.21.116]:28256
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236144AbhD0OPs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 10:15:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gp/xeeqbOiBPNDy6wae3A5BytLtx8AI16t7DoLhtNf7pA2l1k4c/3X1w71t4ENhSt7wAfUuKI4y3iJeIhtUJfI6AxusPy7j7D8F+cenVEyODOfas5Hu4ze+cRvvPSh4DFiH43GCpvoy76SsmMSZAHmb4+WiVCGcdVy0ooxYhRRM54gX7yJM8HdNlpI2vL+Lj7/CEqlqEtl+mjfZiQ2AGZhh8Cvx26U0p1mTd02Oh7RRz6LzjzSyhCLaSq7tofQAP4LQSUIZqxrtvtkoDnW1a12p6Jh6x4QyNrx22H7B3B6sMpOkElblplk9moHV45XD23cXjcFZ9x/eXiToS3C2OMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sol0iFUZm/RUsLCOCKiMT7SPtVyuudru4JscrtQVQ6Q=;
 b=nfypa/LZWuM7u53YQbHZUCgR3t1j7c8gkQmxbJtmWBxkhE8dHtM1J5vlZhm9gbkHc6+ehGPBb5fPUd/mn2bWlgacJDURq1gkaJcvzK4sGFbl0E2gJseCc+qXmq80D3mfaW64x/81b/tw5HODK94VQTuB9iACUE9IbrB/yiKSFiHchQjG0OIADY1fNLbcgvnJNynxqY2BQ/NSypt0Yodcfit0GutmdXH48/jqGnIno1eGGWoZBIXz8TDl3kBd2I4yZWTjUnCt3ZMNKO/f98ZV1seejOPt0V3Bx78/lTyY5XbsItYsHcjVq69BFyUCtEUCLcTy9a5XILpkymIu0x6nxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sol0iFUZm/RUsLCOCKiMT7SPtVyuudru4JscrtQVQ6Q=;
 b=hBp2BGWs2WkzPeGEIK5yCHHfwUGBPacutZGt+vxg7+mrfhuwevLZd2K0unSqsaNQO28oKS6HVJrF3zH1SK8MGBgb/J+2nsj3szIwViMMJy0CWFaC0zx6rKrgp7e8VBuH7rTsLpQe6ve4iM/xWLaeC8DUnKNCw2eGwWxztWR7DZU=
Authentication-Results: ndufresne.ca; dkim=none (message not signed)
 header.d=none;ndufresne.ca; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB3731.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:18a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Tue, 27 Apr
 2021 14:15:03 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 14:15:03 +0000
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
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <303d14cc-1ae0-8d82-77ba-66156a61d777@kontron.de>
Date:   Tue, 27 Apr 2021 16:15:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CAOMZO5Bztrpm4aB9=DmR=3PNfZUoM_niT_+nVE-ZOQm5aUEWBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [46.142.161.205]
X-ClientProxiedBy: AM0PR03CA0081.eurprd03.prod.outlook.com
 (2603:10a6:208:69::22) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.27] (46.142.161.205) by AM0PR03CA0081.eurprd03.prod.outlook.com (2603:10a6:208:69::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25 via Frontend Transport; Tue, 27 Apr 2021 14:15:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfe9193d-8eef-49b8-b721-08d90986d9b9
X-MS-TrafficTypeDiagnostic: AM0PR10MB3731:
X-Microsoft-Antispam-PRVS: <AM0PR10MB3731DBFF8AE987ECF0C7C5DFE9419@AM0PR10MB3731.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:586;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IGFuVeMX+LiWgGIvpF0SkCq6G/oWAbkeqQdlfVonoUYXbv0RXIBYKbf96m3A3JXQoDkSQfa8FTn4HXglMep5u6z+iPvRsrjarejo5V1zAKjYanVKU9eL6fHN2otV4lRLm7gyJ+Hc2nOXRBA1ZbBDkZEiTTWmpUFdkru2JPZCjE3ddU3f8CGmiIqmD0GlEcXVJBwJin9IwzS0FTH1ENKXIOyzmUAwHqHBBDWmF5QoiZ4glm5KJU9GwKQGzQAIiSU9dAFAHpzMxk3aQO5FWyGFpmsY/4EawIyPArqxbRtxTP27wfYyux84zuPIrKKimU5lwjWwz1Eow07OlPtcPAWwRcQaXhg8vBl/VlxPv5zyBJnwIeOm/ZWn3oc+6N8ggMT6IfVoh41GUcg6J25ik2jRswVJABJdpsuPBeUTTUxwkIoNaX3gXSYOKaYVITWAnCST/R+FrXGJ6DzcwTMT5XGH01bXDoCSQ5dN9DdmXU0w1HgbhNaQVF9m88zxQXdsUXQqKPg/efy/TPAi7E+EC139/WfdxeV0iH/J1N8c1udS3bLlDRs2x73ncGwvg8wQzJ9N4F/6N7ALr8vHvg0DwMiXRe+kuonJChvuYnUZmwhj3o4htOvIrhvEdDYpduuw5IT0u1OhSPjSKP30eGblS4u0oBb16SQs3kFvaor4lyjL6GAlkCZH+x8VV15kOry4PntcsSV3tBSOWrdEN7pbeb0eSzcewxqwQk1v19qAtvdqAyG9d/lhDqC7hpPegAlIlg6yrF6lJswMCrAeoArzggMskXSiD7E+hsRjf2MSLyqPy05Oop3LzOkUpMsipMRhSgcW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39830400003)(8676002)(8936002)(478600001)(5660300002)(6486002)(31686004)(86362001)(6916009)(31696002)(2906002)(52116002)(4326008)(66946007)(966005)(956004)(38100700002)(16526019)(186003)(38350700002)(53546011)(66556008)(66476007)(54906003)(316002)(16576012)(44832011)(2616005)(36756003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aFc1T3hxN2JhRzBvZFpwZ0V4RGJSMzg4alpmTHFSMnJKTzRZNkdsbmxLZkM5?=
 =?utf-8?B?aTR6eStvL0taS0l4elJRV2lFZ2JVdXN3b1R5Y0JZNVIwZVhWM1FFMDgzR3J4?=
 =?utf-8?B?N3RlaUNtRnRQL0FNcnpQUjR2Q29YRkRiLzcrZThDR1N2YTNGMjNFVFhzTk15?=
 =?utf-8?B?N1YrMnA3dDNIMERuZWtlaVpidDBrYkJ0WklIT0s0VFlBN3NKd3oyTmN4TkhP?=
 =?utf-8?B?djlhYy9NUyt3dDdHdGZKNkgzK3VCVWNRVGpRODFHV1lXUWF3QmRvRkw0T1BS?=
 =?utf-8?B?QkM3U0M1YVdSaHhTN0xoUVBHUUJBQ2VURkpqME9WZlFDbTllNEhZRkJ5OFI4?=
 =?utf-8?B?YW9zMytPL25OQUc2VEJHOS90SFNKYlJLdVU4dDIzTUlBMnhIdkhaSHkzVmRE?=
 =?utf-8?B?OE5RWFVPTnRJM1RObUpuRktKUHZDR3RyMHY4bk1ESHlUYTZxNyt3U0JXemxC?=
 =?utf-8?B?MVRwM2JWcjFCTzVNL1VlK3plOU96ZUdhZ0ZzeGRoTDVuVGtSWU5reDVlaGcx?=
 =?utf-8?B?WnV6TFgvRHlSajFTS0dOTDJSNmJjOGNzNjlLTjBueHpEbkt5RjBPNHVJL1Vu?=
 =?utf-8?B?WGFFZ29LNWhETGRwRmhTMTNhWU5WSUVWZHZQTFA4SjZ5NUdKTGd6cUUwSkJl?=
 =?utf-8?B?WXY5cHBBbHBlUjhacHhkOE1kYmV6ZDhnNWx2UkdtU2pUbnkvZlVueGhJR1VS?=
 =?utf-8?B?QVE5bUt5ZUJPbG9LSWdIYytDdGRMV2V2ckY1MkUvaGRWZHZpdzN0VVNiVUsr?=
 =?utf-8?B?eXdwTGIyNUxucjJvY216UmE2ZityNmJ3a1V4YmRVRkdaYWg5ZEVlOHh4YzVk?=
 =?utf-8?B?bnRSV2drcXZJWng3NWxub2dtOFFFeDZIZDEyVFNtSWlqeFRPNXk3dDFrSlFv?=
 =?utf-8?B?Y2xSVXJSdmx1QTY3dmNZODdwUjdZdExWdnVlMXJTNWpSbFdQVTdLM2gxOE5K?=
 =?utf-8?B?eTBFQUVBRnRCWGJDWi95Y3ViL1drd2tPNkRUNVE0ckFrNnNNSERKMzZCT3Q2?=
 =?utf-8?B?bjBuMFRhVnhVTWpueWNhdHZUQ2N5WGg4WHY2SlZDazBjVGx3SzQzbGFQYU1U?=
 =?utf-8?B?Wnp3ZE9vY05QR0h2WmRWVXFWN2dQVkJ5RCtGUHIwcHBmWUE0ZCtkaU10VlFh?=
 =?utf-8?B?eW1QdnBmTFplQm9Fc0dLTmxkRnV5ZW5OT0NKVFhGZGJsYWRVT3pueEpFbU5r?=
 =?utf-8?B?QytFZFJrV2pnK3kxWkdJZjdMdlRZT21KR2lsdXVBL3dlSWZqZlFFWk11NnZB?=
 =?utf-8?B?VFdJcWhVdU9NcVF5K0ZFczFVbWlid3ovb3h1RkNuYmlXVFZUVHA1ck1WVUJo?=
 =?utf-8?B?ZWxneExMbVBjdXhNSlBxbHBCRm9Qdm9wWTIrenRpaGFOMENLcDNhS0lJSmZN?=
 =?utf-8?B?QkI5SXlPN0U2OXNxclBBbFlaVng2NmpvUThHejY5QzRtaS80NlRxOTRuMG5j?=
 =?utf-8?B?MktOQkdPTFRNM1pWUVBYTUVkVHRMVHFDa3FEbUN6MFc0WjNkZkNNSkFwbjlv?=
 =?utf-8?B?VkpTNldFWWJRWitnSmJrdGVMc1ZKTUxzMFJZNytsL2RmcGZLT1JCdEJud3Yz?=
 =?utf-8?B?K1pOS1BMMmt4ZzZQMHdUSU5KSnhkNGt4SkxIUzk4SEw3T1BFVGM0Vi9Rd29y?=
 =?utf-8?B?L0dsRWVBUFlLR2J6S3QrRlcyNVMwMklPSXNRbFZFQ0RVb24vVjRlWjZUNDJD?=
 =?utf-8?B?L0xpRXJCdS9QWWNrOTZ2ZFhJNmkxM21qa01yNmllMWdZZDVqYld5dCtIQUo1?=
 =?utf-8?Q?bPCbEd2Lw2JYoRsUkWBC+gU34SdG94olNTHhnqx?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe9193d-8eef-49b8-b721-08d90986d9b9
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 14:15:03.6268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fR0VFmAnhUxw2dtagkWckyhMjLmLa1ecPU/H51oPcmUZE9BLCnEGLpujDCjo17RQQVJcjBd2vpZmRYcKQ0a3TRwOxpYJnTga9eqv3Ki1Ofg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3731
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27.04.21 15:47, Fabio Estevam wrote:
> Hi Frieder,
> 
> On Tue, Apr 27, 2021 at 10:33 AM Frieder Schrempf
> <frieder.schrempf@kontron.de> wrote:
> 
>> I don't know much about the v4l/media subsystem, but in my case I was
>> able to switch to PAL like this:
>>
>> v4l2-ctl --device /dev/v4l-subdev2 --set-standard PAL
>>
>> Though your subdev is probably a different one as I was running this on
>> i.MX8MM without IPU.
> 
> Thanks, this does the trick!
> 
> I will try to upstream Steve's patch then.
> 
> Thanks a lot
> 

You're welcome!

Just a question: What issue do you see without Steve's patch?

I'm asking because with my setup with the imx7 CSI driver I'm getting a 
stable image, but it has a vertical and horizontal offset that seems to 
vary each time I enable the camera. I was wondering if this is maybe 
caused by the missing frame skipping.

But still I'm not really sure if we can compare this as I needed another 
patch for the adv7180 driver to get it working with the i.MX8MM in the 
first place: 
https://git.kontron-electronics.de/linux/linux/-/commit/0d90331a44d0f718b7327a94fc72612ddcb4ac0f.
