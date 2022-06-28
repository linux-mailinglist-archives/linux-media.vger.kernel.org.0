Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B15355DD4A
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243727AbiF1Du4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 23:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243742AbiF1Duy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 23:50:54 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F1BB275F9
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 20:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWYXdLaJUeZQIGHesGO7orDUOpN1w6XdOcopkqYQimFU3SqDvKPI7Hs7yZte0fKrmvp7Cdra7h7Pu5Kb3QBGcPPStHW/SuwbG8Mykb5CxjiW5zsDcV2lBdb+BfxD1i5PShGBg1y5OYJOfObAI7PtFiHg9/1egPD1Ri+nzNdH5lj2fDcgSdWbGwwwiQauWyOjc87MAMXWFk3s04v8T/R7jg2uuhXrrNqR7+Gl7OCN5mofzZIBuTGbDAy+vj8qMkzzNjNz2+FUnni1nRcnkO42b3xrQPH3Zsp/O2JUCt659fEUBVUs9Fyqn2PXKRPXgV8zbUtNu0gFLeZX943L/9NN4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NdKpMrEiFrjraM4nzeqb7xp4Z9wPIQNzBYvh1qzdnk=;
 b=j02MC33R3Qbhu59YQWDfL5hPPQa2Tf86hB8AaqOC/EKaBqMkQkgmaRm+Zz+6I9bTk11HKS3F/b74+p/ltR0xpqFiUpXjNMCh//o19kA5ZbbwD4LbtDM0bO8UmCywPiCrOQ1Av5G/clWt/DkM7+AAQ3GIesuWzpSzeVDIWPCIcsZ2bCImXtPZbPutxnYvV/LMNDGE1HxB3OPa8ky05m9yhjoru+fsF9SZ1phL1BV1liGZKnz7qSU61gjScZfCbs75MqChPKcgUqx4TCThPomzSEHht40ph0DHmjLnT4cJ9vP99k67cUVQkdSL5aX6TCM1XowrE4karFF6FPvBUYY5ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NdKpMrEiFrjraM4nzeqb7xp4Z9wPIQNzBYvh1qzdnk=;
 b=EQCqYNsrnMIitcg4J+Qyzd6gBDybBMJRKrGKoB6GqrEJcHzSWYZ0SDZ1bufbbSBQaoGNefWGJd38FmCebhjCXFfgiHTqsBB0KkygUiffKj7avK3PQDnEVt876Z1cTrQjUOHTqf0ghZUBeLANFLt1uPC1jPlU95cclndCSU0Dpew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by BY5PR03MB5283.namprd03.prod.outlook.com (2603:10b6:a03:21a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 03:50:51 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::18d2:b4d2:dec8:b5fc]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::18d2:b4d2:dec8:b5fc%8]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 03:50:51 +0000
Message-ID: <3f3aafc6-8fd2-cb5f-b05a-d2e219849e95@synaptics.com>
Date:   Tue, 28 Jun 2022 11:50:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Proposal: A third buffer type for the reconstruction buffers in
 V4L2 M2M encoder
Content-Language: en-US
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
References: <F81CE6D5-7081-477A-AA8D-9A9FC0228905@soulik.info>
 <813ace58a5334ff763ec28363e039f62151c0a0a.camel@ndufresne.ca>
Cc:     ayaka <ayaka@soulik.info>, linux-media@vger.kernel.org,
        Abdel Younes <Abdel.Younes@synaptics.com>,
        lorenzo.keller@synaptics.com
From:   Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <813ace58a5334ff763ec28363e039f62151c0a0a.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::7) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c10f6746-fb90-4dde-f04f-08da58b964ce
X-MS-TrafficTypeDiagnostic: BY5PR03MB5283:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6qrX3SfH3mAkAEOgzWYmVd8DytlrhrXDBudANX7bXCY0uwzNc8adV81z5ZSAk4acTMb2aD463FEmG+cOwjixa0t4Uu1LYymdiCZjVYb6JmIpbF7BBAze7KyilU4+PT8l9Vkr9ptRdQabxzp7Zw3mq3RdQ9dzvPyeW9WBe00UeexT28E+RiCs3Ec8zqxFBIyuwQo1gg15waQuG3Uc1crIelu37CBbH4jc2Ha6K88VyjA6j7sTRU7C/2UoHMhitS67DNhzW2XmMkp7BlZsGGGk05vH/85Jb+v0HA1J26zBrb8riiDOu00bxU18jAmNoe8q+XJ21a9lzWEShHdX2gX1ydqPs2RGZQqg9BGHD2fR4xw6FHfyjT9i5fQxcWjp2unfMaYd5Vp5utWSZi56EaqHL0S7b5R+4GOfD7iCEnTNSILM4m6Dp6CrPAeYF9V4JAYaqk4gI/5GXAvx2Oiz8GIa61AI8ycYf7hVSemKX04F+n5Zv+ibc54c71djO4L4gpv36rZCBUXM/EHSpBWdK5ADFUDZzJ6DYwFatpQXjnO6bkJmoHR72hdkuoZB2Hs4zfa2ZI9xtPyw7cn5VJm2YJoXUnNQ3WaIknMn24ngXU/ereMF5EenHGvtZAir+wMs1kCLEDaCLPr4yho3nsTfNk+krxkFqGeqyvBLk1r9/ziZe6I7q5LMUCIToh2qjjrAPxLxIKWYCw4UM6fogctFJTb8H6g26UaOFNXgqZS+xea/lyEMUNxxZlWzz0smOg74OFDctlNUC73iDtW7y5oK2XFKzhG/f0RkNB6yUmosUDt+0YOrONBvCo9Wfu8m5FMbc4NUCexLECU4VEA30mREfIxwfpCUV0wrHiIzFQMKqyl6nSw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(39850400004)(396003)(376002)(136003)(6506007)(86362001)(53546011)(26005)(8676002)(31696002)(52116002)(4326008)(83380400001)(66946007)(66556008)(66476007)(6486002)(6512007)(478600001)(66574015)(8936002)(38100700002)(2616005)(36756003)(6916009)(41300700001)(5660300002)(316002)(6666004)(107886003)(54906003)(38350700002)(31686004)(2906002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjZ4c2ZZRGNzRjZLRFRlVUw0VzB4bVBrWVlwVmxOVmo0MnhuZHpTU1RQL2NU?=
 =?utf-8?B?cjhCZmltNFZxVnRLR2VGSG9yaS94UHFlZGtvbEx2czJhejVDRzRNZWNTRjdS?=
 =?utf-8?B?OVRjakgzZW4vZXF2VnVSVXlaVFF1czlzaDg2SEhTZnNyU3FZc3BKbVU4UXhL?=
 =?utf-8?B?eFo3ZkpocURzNVBuTWQvV255VWM5SDBjN1ZIeFU3eHBnZGdVSytCdDhlVWNt?=
 =?utf-8?B?L0haWmI0L1k4dFU1K21IRzRoL0doQWY2NEN6K0hCbEJyV0dqQXpYY1N1T3lJ?=
 =?utf-8?B?cFg3YnAzYVk3ekcxWE1BWGlGOUp0WkljUnZkTWdoQjg1ZTFxdFA3alg4UWpF?=
 =?utf-8?B?UERLYXhoT1BTTVdpZDNneGpXbmRLVHA2N3pwZURKdVdTcS9PclBMQUthWmQ3?=
 =?utf-8?B?SFZYRVdRSk9PZmh1YVUwSjRlaUxaZUJ5OThDNXVJcU1JUzBwai9uV0RzdjJ0?=
 =?utf-8?B?WUd5dy84dGNQa3pmZUNXK1B2ZVNLaFRGNVhOLzBvN1FsQzRIeFMrRTk5cEtF?=
 =?utf-8?B?ZmxXWDU1WE5EbmRJQkRQd3dZKzdwTzJ0SllseVpWZURPczlxQ0xzM3J4V3Yv?=
 =?utf-8?B?S3Fidm9QMzNmaVdnci81L2MxSkN5THUvL0NaMUFkNnE1aTlRUURVZnVtNjFJ?=
 =?utf-8?B?Rk1VOEcwcTZDNElrZnRGVDVObTkydmRmdWQ4MkVkc1Z3MENlSFNIdzdxQWV0?=
 =?utf-8?B?OFdzRHk2OWtraDIzaXhEWUp5L0JYMFZSZGo5NWpOdjFST2xpOWVsNTduckVz?=
 =?utf-8?B?eWpYK1J3M1dSKzBIaXdDbWI5bGllZVV4aStvd2VrNEpsWDdTbEJRcFIvSkt6?=
 =?utf-8?B?dmNLdTB4TCtPZEgxWjBVRnYzdXhHN2FXckVrTDdDVmwrOTREVDZTU0NEMlg3?=
 =?utf-8?B?YndMNGhjS3QyejV5ODBiN2VreThSakd0YUF6UFpTMmN3T3NyR0VlYWY0czM4?=
 =?utf-8?B?TVJqdWNTRDlpamhXTEF3dlRjSlh1MlpPajV2a0tZWTFldUtvSFhZK0xvTTFF?=
 =?utf-8?B?eWo0QXhERlQ1QWJVbEltUlZmOTVPMWppUklXczRTdzdQaWgzTGxBcmVyL3E3?=
 =?utf-8?B?eGtYSzZ0Z0hVSTUxSXRabVZOVk12UHlCaWRYTWJCVDhBKzdKR2NoTlRIWmtl?=
 =?utf-8?B?aCtkT0grR3FJYUM2azF3RzI0dzV3WUhhN3Y1U0FWZzNaOTFobVZncm5iUVBH?=
 =?utf-8?B?emtWcVY5R3l4QjhHcWRXa1FycERRcnNlcXlIOStMZnh1NmRFTnBOeTRiOW1Y?=
 =?utf-8?B?bFZUa3hERnhVL1owbWY0d1JuVzZBa0lCZytBNmpkMG1sN0dkbSt0T0dFRytR?=
 =?utf-8?B?aUkxTTNaazJBYW5IOGY5bEpwcG5IVEFjSk91dCtudVEvbzVOeko5OTlyclNh?=
 =?utf-8?B?Z1NvVkhNUEhwbTk4SFNWUEhYOGNmUXlJSHNLeHBZSGpzQ0ZyTm96VExTVTlz?=
 =?utf-8?B?YW5Kdy9qOGlvdE8zS3R0UGQraVkvY2QxYnZLcmtqTkNWaStaNHhJSXozZ29z?=
 =?utf-8?B?L0IzYlJBQWpBc0ZHdWNpWGFKVkZ6aytRY0NtZ1Z0QmFQMzJSN0RzY2JWU1lw?=
 =?utf-8?B?cGFxTmU5Q214dVZ6ai9YNUNRaHptMWxkamp5MURXSThsRE4wSWhVS0tBS3B5?=
 =?utf-8?B?YzVHRzU3QUVKdURvb2xNcC9OSXNQcG8xWTFCOTNFQ2Z2Sm1kMWxtZ1FrVE1J?=
 =?utf-8?B?RnVlTHBvbHFLZnErNXNYbU9FSDJWRU1LaWVxaHJhN05iUFRuT2dtbFV4T1Rn?=
 =?utf-8?B?WHNWQzlwV0QrNm5HMVRzQmNYTVZxOSt3M0V3Qys3d1JNajFnQ0Y1dnpCU1Ew?=
 =?utf-8?B?b2xnRmpoNGkxcy83N3c3L0g1MVVOc3YrUkNZZUFQd2RPd3VQM0dYczNzRmNQ?=
 =?utf-8?B?WnExaFBqdm9iczRSSDBITTJHVUdqMEFkcjZDYzZCTGQ5RjFyY2R3SXlyd0p5?=
 =?utf-8?B?Vk1UMDBtMHNycEg3QmI3N2g1RjIvN0x5NzFGSXZSWjBzOFRlQW5uY3FkSU91?=
 =?utf-8?B?akIyNXZrQ3V1YUNoMXBMcktwZlYreEJlek8ya1htRlN6dmFxU3pGd1ZLZTRp?=
 =?utf-8?B?MWU3WU1OWWp0OE5qZEYyNi9aMzJMODUwYmFoalJ3OUVONUxna1FvMHFacTlz?=
 =?utf-8?Q?cxLPuVujC+zBOdyBW+RrMrvV3?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c10f6746-fb90-4dde-f04f-08da58b964ce
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 03:50:51.1085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U390bgDUgG2h5xLAD3mdfbRC7Q3cUeiFauhTua4/Kps989sovCLCninmEHbRAh+sbc5eByVHnwg8JBrrN1NE4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5283
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/28/22 03:22, Nicolas Dufresne wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> Hi,
> 
> Le mardi 28 juin 2022 à 00:12 +0800, ayaka a écrit :
>> Hi All
>>
>> I think we need a separate buffer queue that manages those reconstruction or
>> auxiliary buffers for those V4L2 M2M drivers.
>>
>> There are some drivers already allocating internal buffers as the
>> reconstruction buffers for its encoding instance. The
>> driver/media/platform/chips-media is one here, its coda_alloc_context_buf()
>> would allocate the max allowed references for its instance as the
>> reconstruction buffers. You can't control the lifetime of the reconstruction
>> buffer here, which means you can't control which buffers would be as the
>> reference.
>>
>> It may look not bad for a hardware encoder that has a control chip that could
>> do some encoding bitrate control. For those stateless encoders, which are
>> controlled by the user completely, it would be better to let the user decide
>> the lifetime of a reconstruction buffer.
>>
>> For the SVC situation, a layer may refer to a buffer in another layer, which
>> is encoded many times ago.
> 
> I would love to see a proposal for SVC support, that would greatly help to
> understand where external reconstructed frames buffer management falls in. Just
> "controlling lifetime" is to weak of a justification for the added complexity.
> 
There are three variants of SVC here, the most simple one is SVC-T.
layer 0   Intra A B C D Intra E F G H I
layer 1   ^--------A1     ^----------B2
Even the Hantro H1 could support SVC-T.
The major requirement here is it could refer to a reconstruction buffer 
which is encoded a long time ago.
>>
>> I am not sure which way is better, I would implement one from the feedback.
>> One is reusing V4L2_BUF_TYPE_VIDEO_OVERLAY, it would support REQ_BUFS,
> 
> I don't think a re-purpose is a good idea.
All right, I would turn this idea down.
> 
>> SET_FMT, GET_FMT, QBUF, and DQBUF besides the existing m2m operations. Another
>> idea is extending those ioctls to the media node that the stateless m2m driver
>> uses for allocation request_fd token.
> 
> CODA goes passed this, it hides an internal pixel format, which have no use
> outside of the chip. We'd have to introduce more vendor formats in order to
Maybe the user didn't need to know the exact pixel format of it. But 
user still need to know the size of buffer here. I would like to let 
user decided how many buffers it should allocate.

> allow S_FMT and friend. Having to queue reference buffers also requires in depth
> knowledge of the decoding process, which is for stateful decoder a miss-fit. I
For the chips-media's encoder, its processor(bit processor) won't decide 
which frame would be used for the references. Actually, the stateless 
and stateful encoder doesn't have much difference here. And things could 
be easy if we don't invoke bi-inter here, just remember to mark a 
slice/rewrite a slice's header as the long-term reference.

> think.
> 
>>
>> Please notice that the reconstruction could use a different pixel format than
>> the one used in input frames. For example, Hantro H1 could use the NV12_4L4 in
>> its reconstruction buffer and an FBC format in the later generation of chips-
>> media's codecs.
>> Also, there are some decoders having an online post-processor. This means it
>> can't do pixel format transforming independently. The driver for those devices
>> may need this.
> 
> Even for decoder, when then is an inline post-processor, an extra set of buffer
> is allocated internally.
> 
> I'm not sure what I could propose on top here, since there is very little
> skeleton in this proposal. It is more a feature request, so stepping back a
We may assume this feature would be need for the encoder first.
I don't know what has been revealed for our Synaptics VideoSmart series.

> little, perhaps we should start with real-life use cases that needs this and
> from there we can think of a flow ?
I would use the Hantro D1 as a sample here(the VideoSmart series don't 
use this IP and have its own much powerful proprietary video decoder). 
For example, D1 could product another image which has a lower resolution 
and in the non-tiled pixel format. A user would use this lower 
resolution image rendering for the overlay plane of Linux DRM. Although 
we know the post-processor of Hantro D1 could work offline but the 
in-pipeline way would be more fast(It would be triggered by a macroblock 
not after a whole image is decoded).
> 
>>
>> Sincerely
>> Randy
> 

-- 
Hsia-Jun(Randy) Li
