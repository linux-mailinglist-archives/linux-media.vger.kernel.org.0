Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39D244D3100
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 15:31:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233538AbiCIOcT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 09:32:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbiCIOcS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 09:32:18 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E884E1520FE
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 06:31:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yv7uU6CQ/iFRV8kdXuXkYDNMGFgSjNurkm+hIwbV54SaYIwvtwBuw5S62RghW7oqk5KXGPBQt+5Js7g4rnvA09HLLsrWotZ0PZ9YhCgR264ZQAaNmVzRw5q9wqzBO+HDLPo/La3u9Hi1ufKwOdMOZ86QB+kHEt72sYoHCzD9gwp1Yiv7RkIejd+QWaGAdollrvNcyNZlW+ZRtt/xwAUis1p82fcS0S7JBPvFTfHNDtyDHF9oGxwy831rl9MZMRA/eiq3sJ7ZHiOacUWlpCxSITEn0jiqOC19Pe97piZCSu6dMmG+5EdQsMqH47RlJLQZbsMyl1BKFcxRcZi6HfvZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65ROGVlzyJ5vKTuZH4hAGnSwkptpDsGj1Hlzeub6igY=;
 b=j0k6FhjTbBT+674CqGmNfCxMJvN5h1wTYRmiqYYqGPaE8byt18lzp+9lD9LTP90/4ROhVfSx7JIlcb8raDPKoRaLDm0ueUP7pd7u9/eAbbM4P7AnHeRntafeHbxIjvNJEMDF4sctkRrFaUgEB6PMYhDMuX4ZNM8ha3nEuDdocso+Ryz/6QGUgmr4IddMvKaAH7ACkVUz40DIaAL4CEMUKrih3+8OAZ6bxkYt/WbdIKLeBfrEkdz71/UovpBx/Nx8W+6tsCHCL48CvDuzhOSgUl0kRXb4LpO+yL7zO0g+SWcrWxCfxVk0RDqlJa4i3q4U7ShGP0nC4iPlu4nCCELDcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65ROGVlzyJ5vKTuZH4hAGnSwkptpDsGj1Hlzeub6igY=;
 b=sFzdog1D2xneXG/Liz4NmN6ixShLL6y+cGNKQJbwRprtC8werSDKJRVV+LjUe/CCbJ5SueimlNUVWkWB71hmzyeKPqp51v3KcVTHfjZiMxktAuoMZJN4l5VLnGvvkvWHbgvL7B6WQT1KeYCcr4TDfMIkSXqF1QVYMu7mUAmx9lM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by BN7PR12MB2595.namprd12.prod.outlook.com (2603:10b6:408:30::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 14:31:17 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::f037:e2a1:f108:125a]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::f037:e2a1:f108:125a%8]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 14:31:17 +0000
Message-ID: <af561b6e-1aa5-dc81-cc19-98da443eeffb@amd.com>
Date:   Wed, 9 Mar 2022 15:31:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/3] edid-decode: Introduce libedid-decode wrapper
Content-Language: en-US
To:     Pekka Paalanen <ppaalanen@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Shashank Sharma <contactshashanksharma@gmail.com>,
        linux-media@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>
References: <20220304125001.1732057-1-contactshashanksharma@gmail.com>
 <faf5be22-07a2-f928-085e-1a1e2aa01b12@xs4all.nl>
 <20220308163053.70c81c0d@eldfell>
 <ac619e70-bedf-8855-f3e5-7f2aa3dc4f17@xs4all.nl>
 <20220309160933.78aba02a@eldfell>
From:   "Sharma, Shashank" <shashank.sharma@amd.com>
In-Reply-To: <20220309160933.78aba02a@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::15) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d82498c-f542-449f-1f16-08da01d97875
X-MS-TrafficTypeDiagnostic: BN7PR12MB2595:EE_
X-Microsoft-Antispam-PRVS: <BN7PR12MB2595EA07BF0733C82C6D4491F20A9@BN7PR12MB2595.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6dYUY4XMfJI7vZ6ZZNroO10uRZxQYEVpr+QAuTqiyS9SKORsCwFg0faF8UZWUzJFq+Q+ncybkMFgKh4aBRXuvbrcc/TN1SMMCtemo/Ze3QZV8uVG5dqBKc2ehk6goa7Q8aVbCLizq9yZ3nsEXhc7LHSHygNidCvdldR6oTDLzlpEQyxc5sGwkTnfMSByGzlxVIoa4vpZGUUKxABPuwmPTrJaJ3NuYb/aY2tR1Ahs+XFjAoJuX2MtaLpCk5Qc1OLv0V7iUQdl+eByXx4YvvF97HRV8YuWASs1slVj8Djy+kt7jnAF35tigi7EAntS4RrllBwUqpHIOJZV3eNLP9tFFg82EBqtLcOWtL11zTybYOCcbkjd8QC7Yrfy2NCYFHdu5qdMuF3uv+womHbpECI8FVQbpDJgAkHnszQYwd+G6kVZKJCCbdAKLLPGZn3HMsUOoO5BhMqd3CNAZ2RXDJwO9xUp0uXl+kUXzG5lMjF+I+BgTt87V7HJZcXvI4erE4t30L62z61Ox5s4N9nESSgeYNKsc+XQRC0+XsU12GoHce976Qba4/qfCfkdeiB11+x2JR/jYZatl7PyfWm+4bz+dhHdXCcb2c8+nYaqguyzzkaxkJP95irtmjigS5D9yZwJnIHjLfEirfZwNCC1T2DzF9wAe1hyiCX8dUbZ8mVYjQXEq9hodoAFCs5i0EXpT6jlRS0RhUTD7kNibRFZgM3ditizmidGcPb5APR6kvC6GgECbngavAJvcxY9YoqDmwmL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(2906002)(6512007)(508600001)(66476007)(38100700002)(2616005)(6666004)(53546011)(186003)(26005)(6506007)(8936002)(86362001)(83380400001)(31696002)(316002)(36756003)(54906003)(110136005)(4326008)(66556008)(6486002)(8676002)(66946007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTNleUlrV0s3NFVoOURIN1NUTnFjOGNIczRLdG5Vb2FxOVU4cEZ6L2xZcy9J?=
 =?utf-8?B?c2lkTExkcXVKdG9OMEgvQnBkNXRheHpsWDB6MmhxWmJLM2xCY1BzajV2aWV2?=
 =?utf-8?B?Y3ZhMEFMbkducU9xcXlBaTQxa3JqVEl2ZVkzb0FpeGZRWHlHbSszTkdGQmI2?=
 =?utf-8?B?NU42RDVrNzlyeFJYSUh1MnNHdUhHaEw1SDludkJEN3owNGwyYWVEbk1TcEht?=
 =?utf-8?B?NUVmRkFWcmRqYjFnREhqZzJLeEtIaFk0aXJYcFQ1RzJOc2RBNXlNQmFHd0Mr?=
 =?utf-8?B?Z1ZBUE1CWkZHK1FLSERVMmdxL3JrTFUzUC9ldllHL2NiWFUxbzQwVS9FWG1p?=
 =?utf-8?B?cmNhRjZlNFRvV1UxYkNvUHhmczZ5OU94eXA4em5MYVk2eVY0Q0FHWm1PeTZn?=
 =?utf-8?B?T2lVUzZNTlMrMDBRUkQ4S0d4YnZhVzl4bU9OUTIrUXdqYnM3bXIwQUIyVXhv?=
 =?utf-8?B?VTRHU3dsdGZTYWVJcE9ZZlQ2Z1RCZGJFa1NmY3lRZmEvU09UZGlTRU1QbHdT?=
 =?utf-8?B?TWRCRXI5Uis5YW5pKzlWZnFpOWU3RElyV2xXUmk4Y2xVM3N3dGh2aWVXWExB?=
 =?utf-8?B?OStteDFqSWJKMVp4VnBoVnZ3ZndXMTkxeHhZTHFXTkhLaXZSL3RrY0dUOVln?=
 =?utf-8?B?ay9lNERUTldzUWpMWkN3Szdxc0ZxQzRHaWxXZmE5QVl6TFRUK3dYN2RKSVRS?=
 =?utf-8?B?cnJKSEFqTXowRE01aEd1NjhGMVh1VDJ1cnBqWVdXdjV5OENCUXkvVFpyaElo?=
 =?utf-8?B?OXJYVWowOG1Jb2lJeDZpU1JnZmpJcUtnYWtnRGg0dDkyTDhqVXB3M3pmbUpj?=
 =?utf-8?B?RWVnRlBRb3Bkb2g0NG5TVlpmdXhmQnJYL3RHbCtpUlpnTjlQT281dEx5S2Ir?=
 =?utf-8?B?bHB5ZVlrRTh2aVB6eEw2QkQybEU4Y0x5S3ZDNTlJYnErYm9IWXZYZXp3SE5Q?=
 =?utf-8?B?cHpiT0gvOVZGd3g1WVpOK0s1c1VBZ0NvZkUyb3BEUmtoL2VlZUl1NlZ5U0R5?=
 =?utf-8?B?K3VUWGxQajd4K3o1QWwxbFpsaGdVK0RwL3QyRUhod3VnQWtleWtWWUZnNHJU?=
 =?utf-8?B?MHEvNVNLdmQ4SzNxanVVbVlsKzNRQ3BBVExCN0V0dXRQN213Z0trd200Wmpq?=
 =?utf-8?B?MzUwRk9CTENDNms1UFFyVDgrS3hhUHk4aGhoSnZ2K1MzamRNdUJUeUdrS3Fs?=
 =?utf-8?B?akdCVUFlbVY3SjFJQ014T1k4RjNEUzltRTJnYUJPYUR2UmJNWC9WN1dTL0RO?=
 =?utf-8?B?N3gyOUVucTdpTFN4a3gycENxa0xlbU5FdnV6OTA1Wm51Mk84NDk5dEFqdTZX?=
 =?utf-8?B?Q0ttaFBtSks1ZTI3aDZORzFOS0Z6alBiZmJpeG8reDRjUXFYUGpwazFFRi9Z?=
 =?utf-8?B?ZzkrVm1od2tkd0IxZWoyZzlhWk9Zem5QbzhVNWZIVDZmajFvT3pXMTV2anVZ?=
 =?utf-8?B?WXBWOHpmVXNCa1VqMHU3ZFJERXJpRnhVV2RQU3FDNzJmMXljOU9QWWRnMlV0?=
 =?utf-8?B?YjhJNk5kWmJLN3ZYOENpSmZMUnF5Z3VacWJ1T2lZMncwaVA2RkhKNTQ4Wml6?=
 =?utf-8?B?UVVCNklPQWVITXkybzVlVnpKaDVkY0lia2dJek13K3hVODhaR3k0Ni9XelVL?=
 =?utf-8?B?K3ZMWGU0azcrTzJ1Tnc4bXJnVnRFQnRzdUwzd3VMNVAzNHVsWmN2NUtoUjAw?=
 =?utf-8?B?WW83STVEeHdXcFpndkRvbDI4SFNxQ25uRytyd2xlNW1ncXRZVU9BMWpWd0Rm?=
 =?utf-8?B?MXdrK1BvOWl2VFFneEFUMVVFK1FOTnlqQ09mYmc0elNyUDFwWVlUcStOUlJa?=
 =?utf-8?B?UjJPWFB0YVRuOERrcnZvQ3FoVmlkTjBiWXNrSUFtdG1CUUZhTnhyYmNPakZo?=
 =?utf-8?B?ZHk0Y2NGNXZLN1RvOWk1ZnZsWE8xL2QvOU1zRVpFMkxVK0lkWlRLN1dTSmtU?=
 =?utf-8?B?UVBOSmJFWUN4ekg1UmQwQmtrQzk0Y1NyUGEzR1dnZkNSc1A4YVVGc1pQcnBi?=
 =?utf-8?B?NkpvdWNFaVJUbVpseVlEYnVGdTZiSTlyd1JVYThBajZrU2RQV2ZKOXMzUDFo?=
 =?utf-8?B?eUFFamRYU0d5TnF1UHZXcU5TQUplOUk1ZDVXcFJJYUt3YTBtY09yamRLY1Fp?=
 =?utf-8?B?ZmtVVnFuTDJSYTNTL1FTY0JQQWwwTWM1QVdEMTBZT3Q5MVhXSmhBQmRDNU41?=
 =?utf-8?Q?wkgR10v8nUDd53gtzcOCZko=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d82498c-f542-449f-1f16-08da01d97875
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 14:31:16.9474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUpdeueJzKbsRwufup68/o+gNjafAY1Abm9qU2IGa2kqWA/N9PqAc/F2bgYcivyh08DkNXGQuu21DB0lMkEH0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2595
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans, Pekka,

Thank you for providing your feedbacks on the first level draft of the 
library, and for your inputs.

On 3/9/2022 3:09 PM, Pekka Paalanen wrote:
> Hi Hans,
> 
> thanks! If Shashank agrees, we can see how this would start to look
> like. I suppose there would be the occasional patch series sent to this
> mailing list and publicly discussed between me and Shashank while we
> iterate. You could mostly ignore it if you want until the two of us
> need your guidance.
> 
> Even if it turns out that this cannot go into edid-decode upstream, I
> don't think the exercise is going to go to waste. It would be the
> beginnings of a new project.

Based on what I could understand from the discussion so far, I could see 
that we have some basic requirements which are suggested by both of you, 
like:

- We want to keep the current structure of EDID-decode as unchanged as 
possible, and want to keep the C++ states internal.
- We want to make sure that the new library (if any) is C API, and apart 
from parsing the EDID, should be independent of EDID-decode core logic.

May I propose something which might be able to keep both the 
expectations maintained upto a certain point, and does solve the purpose 
as well ? Please consider this and let me know how does it sounds:

- We add a C wrapper library with following set of functions:
	- parse_edid_init()
	- query_a_particular_info_from_edid()
	- destroy_edid()
- At init, Client app calls the library parse_edid_init() function with 
EDID (file node or raw data), this is when The library layer allocates a 
C struct for this EDID, which has two parts
	- base block stuff,
	- extension blocks stuff,
- The library calls the internal edid-decode core function just to parse 
EDID, and get the edid-state, and then fills this C structure with all 
the information from edid-state.
- The library caches the C structure for the EDID, and gives user an 
identifier for this EDID.
- At a later stage, when this client tries to extract a particular 
infomration from EDID (like does this display support YCBCR420), the 
library identifies the EDID from cached EDID, and extracts the 
information from cached C struct and responds to the caller API.
- During the display disconnection, client calls and asks the library to 
destroy the EDID structures, and it does.

In this way, this library becomes the CPP->C translation layer, and it 
takes all the overheads like, and will use the edid-decode core APIs 
just for parsing the EDID. The edid-decode state remains internal, used 
immediately, and not being exposed to another process.

Will that be something you guys would like to see as a prototype code ?

- Shashank

