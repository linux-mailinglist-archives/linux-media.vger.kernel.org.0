Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDD47696773
	for <lists+linux-media@lfdr.de>; Tue, 14 Feb 2023 15:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232602AbjBNO5c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Feb 2023 09:57:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232371AbjBNO5b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 09:57:31 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2070d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::70d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F881724
        for <linux-media@vger.kernel.org>; Tue, 14 Feb 2023 06:57:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXqkkz8BBpPip5nSOQcQwg9BeQ/z9HwrERlAO0gWDBuoe8WetaJYtqmk4tfaAcRJyL30j2wfKf3GblkD2WJYh7Kk5kToLPjpjTD1UJwxNyR/HYXkWILWqIyDsBeuE2H6EJu6A41dPs6ZYAQSAICh2GL68sJmQXACmPcrycl0178n5btQeH58Os4Z0GsFvTHIaVRTx0FepJxvouXzNdVJminGwsNNpBIqKP9/E2lzPBwY3hi8Ok8v5IyKNw1DYD9pXUDE7lQWDS49jtay5PSyc8Q3V+Zi+Yv+TPjRg1pKcLWMJTT55A3f5TIrY+BY2gt43tgWCCzuVoGrq6JTqwGKyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsU7hEv7OrQsod0ic226k+yK4ApJfVGuKb1q3j0kkKk=;
 b=bSI7IHVe5CH5jrssFYhAzXHCToyOfZK3yePipO5LKGRkz+wI6+6rMnKoSP2+/Wf4bE8LUbWE4Ti/CQ6gYrXJalUzTjwa9jrh4vzPgVvhXUd8H0ID2G+XukdoyjA9QcAg0ge/30stBMPEPreRvzprKmAfu3W4MRPp91OhnD25RXhAj3giD1amlJ9CQrUwV7asD/ckmPul4KwT3ykfgVbnmLtdWg3PoZY5VSFFvsOnnySlI08l6VI7zyI7RLMoqlL++It9lQn9IwV5+iFEx4/mVnHSp2Nl/iq0ccldgB46Ng1TAHTbLIjum9aI9i1s8LHUTqcGavAZWc8SuV2CrNzoyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsU7hEv7OrQsod0ic226k+yK4ApJfVGuKb1q3j0kkKk=;
 b=ov+kx+ZNmOhIhlLuQMNdV/2Q9w53/rIzZ2iFmxOY3sGDSq8C2hVFvolwhlg57Nxe6ecyvMI87/WTmO5tqTy4IW6ghSlD3nTL3C2qJiHDwBb/Jt2Y01XR0AHRge0RIn/3bWABjt6Hn/cMl/YZUjxM0kTgQQS3EU9pMPQz3s3Hbrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by PAWPR10MB7848.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:365::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 14:57:25 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863%9]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 14:57:25 +0000
Message-ID: <afd443d8-2ff3-0be6-6c6f-3faab0d7de09@kontron.de>
Date:   Tue, 14 Feb 2023 15:57:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC 1/1] v4l: async: Add some debug prints
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        Tim Harvey <tharvey@gateworks.com>,
        linux-arm-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Javier Martinez Canillas <javierm@redhat.com>
References: <049f2fea-1725-74d9-d20d-fc4f7506d504@kontron.de>
 <20230209221634.35239-1-sakari.ailus@linux.intel.com>
 <858be7fd-18b2-a4a1-341f-06920e437ce5@kontron.de>
 <Y+uhCB9quKQSHcu+@kekkonen.localdomain>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <Y+uhCB9quKQSHcu+@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P250CA0027.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::18) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|PAWPR10MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b906d2a-8bd1-47eb-ef4c-08db0e9bc8be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: voxRSNmNnyJ8pZHY1gVChVFLbxhaDZzzSCrEjVGfbbW4wmHV9PplYn0swA5B56EuKF6Ai8FIhoIznJeN2grQ2jDni4A5Sk042HN8MyuARxBnerCF8dyqD4m6+0qgPaNRdFZRnnIRHc2d1zVVNrtqpAEIGeSPBRJYzoU3YDfruZh/2K8pctPR8o5BEUKmMfiXKRbbLkIr8p+vKtMwVAxyXlPpUdgjZjmzWsDOmRr1bL7iA0qoXXTmticqKXpAHRgXIjkGvDtIMAg1WVrFl8DdS/lWHfXBJDlUZKawsMSrg8EVFqHgdckwWQ56aPUH37IhlMmnNCjnzNhvWT2Gnn7vGxYR3a4JH8xfEtu3IJ4xxO9EilYLKOWXFpOU323UKDo+q4Sm28/uLUgYEbmk4tyP3ffb9OvJU0K1mRKFdfexqu+bkfxS5DPFWaTzAxTqIoxdAW7Nf5UIHhBap6jxMYYaSI+yEBC5ZPS/KHt7d1SoJeaENGhG8/CYVphG3BGdWBGYcFSuqc6PNVPqPUgVMpcQiUKYRc78ceealroxe4hqrTZqaL5lyp//WxacSde8IyRiAEWW2023sQURbta8bSklR4nU1P1XMVQV7I6enYviYV1f6vomSz+4yCrqskua31OwUn70FOd2FSZSqUme8uLEMnCnodyvq+JZiWq9XOpLTQ6DgS3BanOiwxngAjiy9Uxq4BrNe9w305j0wmSVmVsQGJt7Uz8i7eMsrYpQIDS6EfA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(451199018)(41300700001)(316002)(2906002)(478600001)(6486002)(54906003)(36756003)(186003)(8936002)(6512007)(66476007)(8676002)(6916009)(4326008)(66946007)(66556008)(31686004)(31696002)(38100700002)(5660300002)(44832011)(86362001)(6506007)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1l4KzhkRTZBbjJkdU4xNElPeTlxeS9ERVB0K001Q1BtUFR0WnFqZ0NhMUVB?=
 =?utf-8?B?R3NxS1V0VkhWSzdISUpjKzFyMGdLUjFtOGIxSnhXeG9XT1BwT243SVlnbDMw?=
 =?utf-8?B?SVJZcWpOTXhWc3RJbWJOLzV0VStMM3hpQ040YWIwbW42ZjQwQ0hscWU0Z3Nh?=
 =?utf-8?B?bkR1QWcxSi8xSmdXejZHVUZsaXBnQXRLYkIyUWtvMVRpMnBWc3FyVFhiTndV?=
 =?utf-8?B?ZjA0RXJKbDBIZlFEaitTdE1IaG9yTXUySkFtT2Y0VzlHbHJUc1RIR0ZqejY4?=
 =?utf-8?B?bUswOUFETE5Wa2NkTVBnaDdYQmFLaEcvbFU1NHdhem45ZjRyUTh6S1hrTklr?=
 =?utf-8?B?UEIybjIvY0NKbzMwS1R5MkVGOURWZktFNUw1QlRkNUVwd25hZWxoZHZGTnhI?=
 =?utf-8?B?aUpjeGVqeTBzWTFoZW9qbExPQnp4UHBVYmJzellYQmIwNzlTbmRYSGEvdHU5?=
 =?utf-8?B?SFMwbWFrcDNFZm9JWnpWVUVIVmhiUHJXYWQ2M2lMbnpybWMvN3NvMlJlUndB?=
 =?utf-8?B?OHB6cXFCdG9GZ0o0NGJGRGZrb3NORWdPWno0ZlFVQTQzZ1VacXJWSmhuRGNr?=
 =?utf-8?B?dUVmT1lDS1JYUm11aUpiNFRYSmhYc0ZJTU1rampUT2Q2clV6MC9BeHM2UXYx?=
 =?utf-8?B?K0RqcjNVNHNIY1pRaW5PZ1BnNjVvSGVTbnY0VmY2b0tqWDlqaUNNR2U3K1NC?=
 =?utf-8?B?SXFjM29OTm9oOFJ1NTlUZDBzSldTUW40QzRQWnluRmV4Zk1OUDZ3c0ViQ3hC?=
 =?utf-8?B?Mm1LdHg0MkMrenBGdEN4MTZnZ1F3MnR3WjNodE5BTmZsS28ycTlxYmpMeEUv?=
 =?utf-8?B?Z0ROaWJVUTFSNVJRdldQSW1xQjRUeFM1eVBVRGF3YnF2UGlJRXBieTJxRWFM?=
 =?utf-8?B?SGZjb0RjUy9vT1poVnF2V0ZtY1VrQ0RJSFFlcmMraDAzRkUyQjZOSEtYTkhr?=
 =?utf-8?B?eDJUbHlhYjljZUtCbkNzdStGbTFRbDJiazV6OG43T0F6L2hQaTV2T29iVHZz?=
 =?utf-8?B?d0pnRzRQUUJsaXFza1J6ZVZPc2pvb2dzSlBmdlRRY1pSYWQ1RDNmNmllOEdF?=
 =?utf-8?B?LzFGQkNCZVJLa24wOUV3R0dJSnlsSURwYjFwNSt4c1gxU2pNQjhpdTg2VTlj?=
 =?utf-8?B?aC9paVFTSEZaNXdiZlpEdVB4c2NmZmdISS9wNWJoU1VWOVhOSkY3YjRFNytw?=
 =?utf-8?B?Um1ZVmRkeWN4eS9WTjc5czRvMHRUS0FVMTJ0TVh0Z3ppTFBNb21pQ29QTEhS?=
 =?utf-8?B?NGZBQ0QxbGFScExmQWlJK0lDanJaNUVIMGdBSmRMcGxTZ3NacFhqaVZkcWdT?=
 =?utf-8?B?TThhZW92b2lNdGo1cUV6c1c0eVh3bGpuZUJnY3dweWcyTmNlT1Y3QWtaYnNS?=
 =?utf-8?B?dGsrcVAzeUYybXp1YmxLbi9ab2J5VWw4NWRkOThyaHJaRU50T3o3QVlub3BQ?=
 =?utf-8?B?dzN5NjEwWi9jQjBxdzJERVc5cFRrVnhiZnVmWjArT3dYVjlOMW9ETi9GLzV4?=
 =?utf-8?B?Y2JDRjFvR3IyYkZkS29UR05UOFJSV2Rlczl1YUUyRGNnUjJIbTBXZk5TNUpG?=
 =?utf-8?B?dS9qNkxZRHRaa2h5U3NFTE55KzEvSEZuencvYmFTa3VycFpMb3hrdFdXZzBG?=
 =?utf-8?B?dzZaVTFGcXZHWVFJZWhnb05tMnFUQjBBVE5ldFZqL1duL3k3MnB5Z3U1MTZt?=
 =?utf-8?B?WDdSVWp2NDFncE5wYmJVT1g0Q1E5SjY2aEtvQkIzQWxqOExCUUhyS0xMYjdB?=
 =?utf-8?B?SUY5TytwL056SGhBOGNzRXlHbE02WlZ0WUttNkhyR1UvZmVqOTEvSXZpRGF5?=
 =?utf-8?B?MExtbmtLYU5VQ3lkeUZwUzcxQ3JXV2J4MWU4bzdML2Zod2hOQXRYMzNJcWlH?=
 =?utf-8?B?RytnYUdScnY3V2lDY0tuTHJPRzFOSytsZWNpQkxyTXlLa3UrZ1FtTmZsbFVp?=
 =?utf-8?B?Q3krWFB2bWtuVXpmelgyS0owbkxybVprWFlUOFdGZ1ltTk9GU0UrSDhuV2lx?=
 =?utf-8?B?UHV5ejRHRG9NWXQrOTlmd1FkUGdRODZZaHVSVm0xaFVrUkl2U011WVdDSXFt?=
 =?utf-8?B?d0JmdENGTXJLeHZ1a29DYm9tNnhqbFRRZG5RQXd2WVlGM2dhbWs3ZzRzY1h0?=
 =?utf-8?B?U2FFZHkyL0U3Q3hnYzJyN1dWakxMdE1BNWl4RUJHVmVPcFplQlhhWlpIbXhD?=
 =?utf-8?Q?fR2WL70Ojen73yJqpIA7icHkeFY06IAXT4mq4EBk78nN?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b906d2a-8bd1-47eb-ef4c-08db0e9bc8be
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 14:57:25.4982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bt4neOVutFdar2QdZKJM/192FthCJixjoLlx/rFolFau0LdhdrA+6EOwjK/0fPI2y7uxzsiZr6XciNCosWw78QHTvwq5RYX2qq/5+05NjOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7848
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14.02.23 15:56, Sakari Ailus wrote:
> On Tue, Feb 14, 2023 at 11:25:20AM +0100, Frieder Schrempf wrote:
>> Hi Sakari,
>>
>> On 09.02.23 23:16, Sakari Ailus wrote:
>>> Just add some debug prints for V4L2 async sub-device matching process. These
>>> might come useful in figuring out why things don't work as expected.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>> Frieder,
>>>
>>> Can you try this? It prints what is being matched with what. Perhaps this
>>> could be merged in a bit more refined form if it proves useful.
>>>
>>> Not tested in any way.
>>>
>>
>> Thanks for the patch!
>>
>> I fixed a few issues (see below) and gave this patch a try. Though in my
>> case it doesn't seem to help much as the problem is somewhere before the
>> matching actually happens. The only output from this patch I get is:
>>
>> [    1.536479] imx219 1-0010: trying to complete
>> [    1.540856] imx219 1-0010: V4L2 device not available
> 
> Yeah, the problem, as I understand, is a driver bug combined with a DTS
> bug... oh well.
> 
> So not a V4L2 async problem at all. :-)

Correct! Thanks for your help anyway!
