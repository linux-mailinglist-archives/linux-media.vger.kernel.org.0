Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66A257439D9
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 12:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbjF3Krs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 06:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbjF3Krr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 06:47:47 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BCF42D56
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 03:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TycprFfIfk2j4WjxfOmj2ekRAV43EWSzlQigJhIjR3bLXoF8afK70zY4RvJuIWBq4JNYlF6vHfgPg573vDo4jFGhb568YJ2DDlMRUnCxB3SIqfG9ZNhYC4PRTtu9JfpNb6xghR+I0lffpaB7k8fxf5L65RUHRsLCqUlWLO5QZJNgfmnelWHN8PAEVozS+d6miEoOzpbbJ2XDeKQkfpQQQKH83Ka4N1z69mZ0x4iyX8d3ZlV0YGUc2lQvWFk4Gzr+VyhGlaHCYmCLh1qGZUUmbojM8RRkqghtlrlegAuKAEu74Aw3FEm9YFOSZ+ABeB8H6xzyddh2lApXUKWidFXkig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yAteb3LdHGDLz/vWuZn62Diq0FLYpbAmsGE5yvOZJ4=;
 b=WosOY0cb5bM60tDQ/z3EA51XhtXExNEPyHm1qJKWqoKjKP7FdyxjQWMi4MtjzMmgojaiMjNJGr41mn6Cz0bQLxDecemdxGluEgaEZBzXT2eon9yMYYJKEFJA79PwYdcLjwYgk0lMsdEWIH3do89pFIiJ5Z8e8zAgVq0qgkRl4vRka/wu6iWpDZduv04Wlz0ahQL599W9wrQhyuK01CTEyVpDMcFTv4FaH5x+8NmGQGXWvXGd3mgjYx3vKKqmLUv4TDy3GUGZXLfS1sg6O3aFTCQA+CGOEVkSYcZJdtHDygG/nD1yqe4wo6p1KIZGcpDoh5klEFm35PAuyIyL1cVW5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yAteb3LdHGDLz/vWuZn62Diq0FLYpbAmsGE5yvOZJ4=;
 b=Jrv1Yf3H5eSylgx0k9j0ds8jTmg/yrV1NjnLi9hwZkuxj984nVCI48jtz2yrXfvJrm+TrL35qd6dBy//52tNzLMQBgdeRMrcR4BDEYOJa0HXr39Njhi8jgvmorLyrtGNxaBjgKfDv+YLPpqBYRGSEC9OozIYYbsKbYHT1faUtKE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by BLAPR03MB5492.namprd03.prod.outlook.com (2603:10b6:208:290::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 10:47:44 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::6882:b9c1:2b2d:998d]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::6882:b9c1:2b2d:998d%5]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 10:47:44 +0000
Message-ID: <a2ffa1cb-42db-a78a-8bd7-b0e422aade13@synaptics.com>
Date:   Fri, 30 Jun 2023 18:47:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Hsia-Jun Li <Randy.Li@synaptics.com>
Content-Language: en-GB
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     ayaka <ayaka@soulik.info>, Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian.Starkey@arm.com, boris.brezillon@collabora.com,
        frkoenig@chromium.org, hans.verkuil@cisco.com, hiroh@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Helen Koike <helen.koike@collabora.com>
Subject: [RFC]: m2m dec reports the graphics memory requirement
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:510:5::19) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|BLAPR03MB5492:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b6e4e5a-2b8a-46bc-aedd-08db79576f53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sWQJm2xAwXfbZWOP47aMDik501K27QIYmLlmdAHxfvI1cBCXV6S7bwpHEaP4KjesvIvh8ZWtQZAZoMDl3fQtrcQ3Zmg9nyLp0fsfA+C3NUip3W5j1RWKaGyup0Q2ydK03yr6+SizexVc0WE8Rf7ML5zOklKqtDtF4QsUPAYRQ8IW9H5+hjlS0RXha7j252wK+ZsgPOrRbdrBQpFslNVAj+o9JllUyReHxK+7Ot9H8fj4HPctN6jk7Ugq/gUTb9jesZzSOlQU0o/mMM+VxhOBHGhbPW0WJvDGouA/jTHnyrqFY9Zb2qfeC+jMRWf5fdL+2tXu3Df9dT9tTz7n6StHOvN7NKbWLMW43jpaWWY5gvh25JKdkSpjwGdy9fj3m0mjwMKW8dbxqbcm/3OakmaTZ8N617oRXufLbRqw2YvC1aesJStE1SP1w32gq/BaABciTZQ/S3+edBfhd/hUQ9hlQjebUGmKcr1B9BGy4LMHEMyLnVNQodzNQ3mTBzHMKLZekiKnd233muyp5roGuqBS1TFZM/T+VDSSAe/0pibiVlcRYLGx6fqmuhJer3i4Gss3RYfqXBv5mCT680kjaHywZM9Aa29YKRUzHxIGz/SFlBLQhPsRap74YRwxPd9FFdCiKmTJbbTB5Suz9QmApQt0IIRVryb3pCmVD/SEJ6eWdZrfsnKkwPWkyGCt4Xv1oxae
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39850400004)(396003)(136003)(346002)(366004)(451199021)(31686004)(66946007)(54906003)(66556008)(66476007)(7416002)(2906002)(36756003)(8936002)(316002)(38350700002)(38100700002)(41300700001)(4326008)(6916009)(478600001)(83380400001)(6486002)(52116002)(6666004)(5660300002)(86362001)(6512007)(31696002)(8676002)(26005)(2616005)(186003)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW1WMHM5clh2MGdNa2hJdEROYzZOZWpFQk1DU1N6aUcxOTlVUnZMMC9aQ1By?=
 =?utf-8?B?SmRPTVZpRkUzdDlwN3oyNDBld29nUjNKY1NYdVJsS2FoOUJuRVh2VHd3YVlB?=
 =?utf-8?B?NTJjdTlnT29BbWJJN2s1dGtseFNQZmt3dUg3eVJUSGZhTVZhdjRJRnJjTFR0?=
 =?utf-8?B?d2U2ZTV0ZU5mdUN0NHBlSlRwSzBGcWMwY0lkOWw4OHcvMEtMKzV0VE5nOVJr?=
 =?utf-8?B?TTFYZGJ3SXllTWlQbndqZHQ4OUxXdEN4K2pJcDVjRlBDQ0poNXVhV1NCYXhk?=
 =?utf-8?B?NTY2V2tQOFBtQm9uay9zVkJrMTJaN0QrSTE0KzQ2VEJIUXh2RTRyOXBQSENQ?=
 =?utf-8?B?QnJYNFlpVWlsUlpBeFZCWFNDMEFPMjczbGdlUlBIcTJQTlF0MnZyWFh5S1B0?=
 =?utf-8?B?d3MrckY5eFRyTWc1VWpGRisyNSs5K014b3ZwQk9RWVgvbEYwK2VPTjMvNGdm?=
 =?utf-8?B?UFJ4NzZkeThxemRtTUcwTmtsRHZVcEdiaFhWVVQzVlJDWjFVejY3U2NTRTF6?=
 =?utf-8?B?YURGeC8yWlFpUDVYczhRYTZ4S00xY2lCazJsVFlLcnhZWHplSVJxQitKWDRB?=
 =?utf-8?B?SXh4YXU4c3ZmclJ3eDQwMkFsZDJNaFNMZVZCanowSllNMlZTYTE0dmhrcXlW?=
 =?utf-8?B?ejdaUVNpVUlpZ2RMRGY1UlFBUnlrMWloNG5RKzQ3YXU0emxFdXM2TFNTSFls?=
 =?utf-8?B?dGFxWVFsdUNNT1lwamtFMjRoeWN3ZWVVMlE0aEs4V2JFa2xNWWJ5TDRxNzNr?=
 =?utf-8?B?ZGp6b0JSK2xVdmxPaWQrT1RFMGxBZ1BDZGIvRTl1OEVqNHo0OE1KeTM4c3VX?=
 =?utf-8?B?WGtyQUlHTDQxU092c2ZNaXBVMGdzOVl2eVFXT0dpbVlWcjBZUnBTeWJ6KzhD?=
 =?utf-8?B?ckdrRU9COEhXeUZ4ekJJQ2JkUG5Yc2hKTnV3K2xHVmxQazI1RHB3V3J4UzNs?=
 =?utf-8?B?aW1ud2x6YklXT1hpYXIwZTUyY0paNUFrZWVTZEdvZU5pcDJCSU4vbkcxK3hr?=
 =?utf-8?B?V2VyNy9vSXZFUEJmOThNR1A5VkJEM3RjZUZFeEdCZ1RncEMzQ3FFK2N5QnF4?=
 =?utf-8?B?RlovV2EreGpYZXdKZVZnWmd5Z0ZscWNLa2hCK1ZBOHMyclp4U0pYYldudTJ4?=
 =?utf-8?B?MTdrQTdzQ0NQd01WUXltZFpnZmw5VjJNcEpXWFgzN0ZEbGZBVVM4NUdUcmRP?=
 =?utf-8?B?Y2JzeTZMbEtydXo5c1NaRVgwTkR5WkpTQ1YzN1U0SUJnOEN5VlFJa1Y5S0Ix?=
 =?utf-8?B?UjViRmhtMG1CcXcxbTZmTnNGM2VrUnkxTXFUdTIrdWdNV0NXeEFQNFh1aGEw?=
 =?utf-8?B?Nmx1d2p4emFzbUNnc0R1RjltK0JWdkttdlM4dmpVUjdjdWZ3THNWTnpXWjk5?=
 =?utf-8?B?V1htRUxJRGRsNTdYVlM5MjVwbFR3bGJrRDdWeVBDNjdHa3BGMmpUR2pqR0xJ?=
 =?utf-8?B?SDliUnkwWWxVMXJPNGFhTCtwZnhnWmV0VWovcDhmOUtzS2puR1ZDS3J1Nm9i?=
 =?utf-8?B?YzZXZ28vOWNRK1UrcjhrSE9tWXUvZlVUZmpmK3MyalFZK0g5RXR4RHpaZnVy?=
 =?utf-8?B?QS9MK1R1ckNMVU5aVzh0bnhaVzl5Q2VFYW1EUm5LLzFod3hKblFhYmRaVUZn?=
 =?utf-8?B?OFkwTEN5SEdTRVlUclB0b1M2ajEyOStpVnl6elNHV3VzcVdFeXZjK0tzU2RE?=
 =?utf-8?B?c1ZHN1NLQU82S3lqc2RkNVJNcmlWaUppczZUZU1yNDBZY2hvWG5rU1VRTHNF?=
 =?utf-8?B?R1NwbmZkWVB4YW9RVlRidlJObGdnYUMvMjdhUFdWd3lFVXU3K3J3QWt6eFpS?=
 =?utf-8?B?YXVWUzUvZExhUzRkVnl0dm1TSy9BM0tQVTAyQ1l2WWRiL0h1Y2J3aDQ5Y3d2?=
 =?utf-8?B?d3lpd2gwTGk2cUNKRDBRakp1N3RVV3RlR2J1dlBsWDZheTIzT0ltYmRXUmYx?=
 =?utf-8?B?QzlhcnQ0TmxUTzlIMmpOSzVPWUJmUGRST0ZXT005MWI0OHlNd1Y4Q3FLVmJk?=
 =?utf-8?B?NkdYWjBnZ3BjRUFVbGsrNkNHMTBaWFB2angybUhzRjZnNkNRSXh5VEV6L3BR?=
 =?utf-8?B?dFNZd1UvVUV5bFFDQWRLM0NzQ3pJV3ljNGtzSEE1VUFGMElwOGpJeURVUU9T?=
 =?utf-8?Q?91/U567yApSQ0v97nzn/galh1?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6e4e5a-2b8a-46bc-aedd-08db79576f53
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 10:47:44.1301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHwtBU68YWxjC/VY5rVuQzfNeJ2v3k5QdT2liaPAKmdghEopymAFeqdatXseF46PHiwafGbeil1OVHZNcwX3wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5492
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello All

This RFC tries to address the following problems:

1. Application may request too many buffers, increasing pressure to 
system's memory allocator(Thinking about running Android with 8K UHD 
playback in a system with only 2 GiB memory available);

2. Application may allocate too few buffers while the codec stream 
didn't follow the statement in its sequence info;

3. Application would allocate all the graphics buffers in a large size 
meeting the decoding requirement, while only few alternative ref(never 
display) frame requests that;

4. ioctl() G_FMT may need to reflex a format which far from the current 
sequence, or we can't know the resolution change result at an early stage;


A few solutions here:

1. Extend the struct v4l2_event_src_change in struct v4l2_event with the 
graphics pixel format(break uAPI)

2. Getting controls after the SRC_CHG event, struct v4l2_event need to 
tell how many controls it needs to fetch.

3. struct v4l2_ext_buffer for such out-of-band data.


Sorry for making it html before

-- 
Hsia-Jun(Randy) Li

