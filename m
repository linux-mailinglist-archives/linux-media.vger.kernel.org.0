Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71893746C30
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 10:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbjGDIlz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 04:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbjGDIlx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 04:41:53 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB4FBE
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 01:41:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/vQ31Ls7ZMyGCOjYGBqFPiiAJza03JOU7FbYjb+DeYw8LDbycpdcTYteuFWO3Yqjf8TB8nw51mmrn68OsKBG/gduFUx8wX6lWaIGTcvysKf6w1ixvWz/xuPW7R3F5fR6+a4gNJp3eowx1NgqQ+cA8PDPBx39J+IevIFzfQhZ9+IabYjAOC0x190J0b/XEjYiwEveYK3VSZrsrQl6MWDZ+slTmDEkJDlrltm+51mAAtR3TRA3XbhKj7TwB9xGGJ4rffFT6xyvCBhkDDMCrR2wA4kTLHhJAqVvhflM/yRQmDwaf4/05NwpAbEmyYQ36DNG+rrdBlmSztnvJ6I38TQ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CNEN0Fh1HDum+wB7k1sFqgPPVjOe5++LCBeZcy9QVQ=;
 b=FryTQ8R6ZpI4EOHq5TPNrYiWvNbOPN/Tm5CTaXChjV9Q6RcDaXvmIdTLoMbmJ/uHIqMN/cxw9QUlYn6OTPEDoeqzvUiC4s2xTRwjB3QDvDSEnu8xVXKRDu9T+bkUrHgFc46ABnxH3Fbs41i1ysGjeFIH+4huwyXt5eS//k+RREPtywT/vsS02+mg1t6ggpGYy9R0Mc8Xel5wBrDouuA0qvVzQndxW6PyMZVa6wVFJnlvrRNIDibqHNbJs1ETSSf3IQCo8jLsPggeLUmA+8FtABSpbgKyevRVfHhHql47+OYrUooFyeYzf3kOf3RZrAiH398iqM8xNTFBtLOkEcGPog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CNEN0Fh1HDum+wB7k1sFqgPPVjOe5++LCBeZcy9QVQ=;
 b=REoP23VOJgFuZ6+MAf6qS/yK+JaIJE+0kswM+7gPk7a8pKWgyq280ofmtCOp/vyNi86oPEnkMcpgu9kOCdi4VPZtAHkgFKFjQGyGPUKNIJC2XNWHwxJ8Ik9q1xLIecnPIN9ylBHc+5hMxIHAboGU2GiFULZvNE7evbYSULqW+ZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM6PR03MB5145.namprd03.prod.outlook.com (2603:10b6:5:1e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 08:41:51 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::6882:b9c1:2b2d:998d]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::6882:b9c1:2b2d:998d%5]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 08:41:50 +0000
Message-ID: <3df23ff7-7a62-ed92-b9fb-a988e96c9790@synaptics.com>
Date:   Tue, 4 Jul 2023 16:41:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Hsia-Jun Li <Randy.Li@synaptics.com>
Content-Language: en-GB
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [RFC]: media: mc: storing query status in variable length buffer
 likes blob in DRM
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ayaka <ayaka@soulik.info>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, Brian.Starkey@arm.com,
        boris.brezillon@collabora.com, frkoenig@chromium.org,
        hans.verkuil@cisco.com, hiroh@chromium.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Helen Koike <helen.koike@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::28) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|DM6PR03MB5145:EE_
X-MS-Office365-Filtering-Correlation-Id: 192a50aa-ab99-4420-b589-08db7c6a82c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: voJji+pKjMw/8pYRQ1hFU5101w1vjgmG2S88epc8xaHEyYe/fCFKlMkPiKqif6AIXUhbnZymMeDn4uEGMZvzHh/DJAMduDlDXLKsJ2Rg8wlb8lANcnplwr8Jy1Mjk0cStEGp+l4HJzgqff4NtQk7ABcDhzudFl/b9N7DMtRUnoORW9E89ykkQ3xGNyo6FJ7+OCs6oh7K8CQfsIOWAPoqxEoKwG2tICSPoXlaR+ul9AR5smYNEBkVLGposUXnp3tSfgClMkaww3CgD3ero+9YT3EBCn6tyb/vtXng2TpoK/TdIAL3esrmiFj6ACa3U0l6RS4qibIHLIlQSaB/5mMXJgKQzHBAfcJQ1y9StrHPOUuagH8mUpY7fENCrj1fjgcjqJAlywBMcjnXBOPbCajIb7UoNfEu9DXqttwfbzXXGijNhDJJpvb2AXXXxYb/3+1QVLVy3//zOx1N2voXRedkXdo2cjsdLKV00ZBuFZnLBs+3iCT/zxXKCo5aQeWbwLzVw51xjUqRBSpwEP3qW0UaVgiKW+rMg/gSNoXhTOtUQ3nK7u+N6KKB3bFmlaIU+h0rXy2Kgh4QIP+t/Gf1LE660Vtg0/tZBlL/Omy5hMios5ECVcuTvVxg49PitAtEFYy6DKXezktpBhWns3+d1+xZIGi303iiR4Z8aLatspDIXzcJr+p8wg7nRtQySnamaczV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(136003)(346002)(39850400004)(376002)(451199021)(2906002)(41300700001)(8936002)(8676002)(7416002)(36756003)(5660300002)(86362001)(31696002)(186003)(2616005)(31686004)(478600001)(26005)(6506007)(6512007)(6666004)(6486002)(52116002)(316002)(6916009)(66556008)(4326008)(66946007)(38100700002)(38350700002)(54906003)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXhDYVplZnJiYVZiTFh5dllXZGFNS1hxUHJjbktsWldpYnA4aEdpaDBmS1ZX?=
 =?utf-8?B?TUFtRWdDbkgyN3RRMjU0Q3pBRUhXY2hmOFNkUHRCSFFsZngzTXIzN1NWak9U?=
 =?utf-8?B?QUhmM2lhZms3SUhBRE9Pb012OHVjUzhINGhWa0htME5aMTNSdG9TRE90TXhl?=
 =?utf-8?B?eS9MaHlTSUo4Y1YxeGgwbEN2THZsQXZ3cmptc0RURFJQdFRUeUFSM05obHNy?=
 =?utf-8?B?SlcvazZ5RkRWNFB2ZENZd0dSN2VUUzVGc0pjQ0paSFQ4cGhTVi9oNDRQWjRJ?=
 =?utf-8?B?eUlINlVXZVAzeTVOdm9RUHl4anMrckxBWVpPSEZ1Z3J1SExPVXBpTXhyaFVo?=
 =?utf-8?B?b2VyWE4zU3lSaGdHNVk3SlJpcmtXWUZ1VGc1TERKd2p5VmlCNjZiSDJoY1RF?=
 =?utf-8?B?UmUvN2szOTlGQ2g5MGk1TFp1U2NzeUMwVkVkOW5Ib01SZmxFWVhKbDRiRUR1?=
 =?utf-8?B?YUp1N3d0Y2huRnhOdllKV0tnUkVoc0hJcEszMkpxaDZRT1FKTlc0cGYwZ3N2?=
 =?utf-8?B?UXFXYlZ0YVF4Vm1GcS96bW8xS0JkWEY0d05LWlV5elJId0twNk5KR3k3UFpD?=
 =?utf-8?B?MDllZFFOdU52TFRzRWMyWW9INEk3UEI1N2FSWnN4V1I4a29vcm52ajNBVTRD?=
 =?utf-8?B?a1BvZlRUV3ZMSzVMdklwR2Rmci9hb0x5WGVxOTRwWlRsbnk3OHNDWDluTFd1?=
 =?utf-8?B?S0NIcEdka1NvTGZYMEwrMGNXeDNLZ3F1YXlVOTc4aHBzYmUxSmtHVEMzcm1D?=
 =?utf-8?B?UXlERnBrR2cvUHc5QWYwN1RHSklPa1JNK2JWTGlOdEh1Z01EYlU1NXZIWjdt?=
 =?utf-8?B?MDdMcW1oSnkwZ1BaNUN2WVZDUkRiYjNPdjFnbGZzNDhvQ0Zvb2NySzJhWHl5?=
 =?utf-8?B?aGI5QXBSTFN0WGpLaFJjOGRFTERYVjZ2MFpUNUxkR0Npdkd6bVJObVdFV1Fq?=
 =?utf-8?B?SEhuQWNWMFVpL3NuWVV4MmowVVArbE1tYTRXR1FkZjNONFEwQmxhSTkvMm1F?=
 =?utf-8?B?ZiszQlY1NGdTSXE4QXZhbm1WT1Q1emE2OGFIZklJZVNxVW5ZamJocWhPbXVO?=
 =?utf-8?B?cDZtZzFSdTltZXUvOXY5ZVZneHJabE8wZXhVbm5oemw0dUhncjE5bGYxNGFt?=
 =?utf-8?B?eXNpQmxGTlZ1azZweElzNmM5VTBEc293c2FGQWczUlpnWTA1cDZ1Wm5kbEs1?=
 =?utf-8?B?akQzdkVhWGpSVCswUzE0Vm03YnYyc0w1NHJjREl0RUMwRUNBVUgwbytCbkFC?=
 =?utf-8?B?U1E0T3FYbDZhMnRvOW1PeTNKR2RqcjZpdkVBbnJpVHl0YWZzTHNjZFhhcVhE?=
 =?utf-8?B?YmlwRjYzZXQ1YWlySHB5UzNEeUxSbitUYm8wT2dWNmdmVlRKZkhzOFpCMGN0?=
 =?utf-8?B?dzl1cmhHMDRIOUxrc1paSUc1ejhYQ3pPYUZ5dk9SWEErOThWMS9RdGl6V3NU?=
 =?utf-8?B?bmcwY0NBc2VNcjRKWG14dERzUDArZmF4YmFOc2h3K2p6Z1ZGajVDNmFzdDJy?=
 =?utf-8?B?NG5sVzJnbFE4MWprUlRRRVNpYnI3dkpDTkFuMjh5Wm0wY2VIU1krQnVxV1Va?=
 =?utf-8?B?NE5GLzhzQmYrNHI4dEVBalRkcEV4SEdRTGpSaVhDa3pMdDZSNjQvbG11Skox?=
 =?utf-8?B?by9wTktpUkNBc0tONDdJVzZ6ZDBZL2pjbVRoZ2FnMitHcVgra0VYN0pZdkRN?=
 =?utf-8?B?S043NlU1eHhXb1N3UytEVWdiSnJabmFyYXlla3lZSnhMT0ZEbDJZVHBCaXlT?=
 =?utf-8?B?UmY4QjQ3UzJwRVQ4b3BITk96RkZFbEF6VjFVTGhlOThhTG12aVo4MzVxQnVv?=
 =?utf-8?B?Rnc0THRURjFPeVI5S1M1ME5NQlNjRkoxV08wVTljdnlGemU0Mm1Ndit3NmRM?=
 =?utf-8?B?ckxhVFgzbFBKdEFjbXdZRElJYVFnT3RMZUtVazRESHl2TWxOTEpRWVdSTTJJ?=
 =?utf-8?B?TmQvSTV4V0Y0dTRSS0dLc2RyUHI0cW1OUU1nMEkwRlNmS0FqWnZtdDRVR09j?=
 =?utf-8?B?Z2pjS0U1YmNua1UwUlo1cVUzQll6MW1la2F4UENPcTdZTlViRDdmaEVGUFpr?=
 =?utf-8?B?T2xFNnJHUWJtRlNVNVM0UDlwbnRjaUlwZnF3ZkV0VndPdFRjR0s4cWVEeUd0?=
 =?utf-8?Q?zzy7JKEMNy4mrvXK6QsMtgw4O?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 192a50aa-ab99-4420-b589-08db7c6a82c4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 08:41:50.6209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pR+CilBbe35/PBKvQfdTU3fJbCQmxQxz+f4Ga8EyCQsVnqIWkTTr9DY30INys03FMCEn2CPkWpBtbfIoOkybuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5145
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello All

This RFC will address the problem that some ioctl() commands would be 
called many times until that command got all the all its entries. Those 
ioctl() command are:

- VIDIOC_ENUM_FMT

- VIDIOC_QUERYCTRL

- VIDIOC_ENUMSTD and VIDIOC_SUBDEV_ENUMSTD

Generally speaking, all enumeration type commands would lead to 
frequently context switch between userspace  and kernel space. A few 
enumeration commands listed below may not meet this problem in some 
cases, as they could present their entries in a step wise way.

- VIDIOC_ENUM_FRAMESIZES

- VIDIOC_ENUM_FRAMEINTERVALS


A simple solution that we could bring and improve from DRM is the blob 
object(struct drm_property_blob).

We could extend the existing ioctl() in this way:

1. VIDIOC_ENUM_EXT_FMT would turn a blob id and the memory size 
requirement that usespace should prepare

for storing.

2. Appication call VIDIOC_GETPROPBLOB with blob id and a userspace 
pointer which should be enough for storing.

3. V4L2 framework fill the that userptr with context likes this:

struct v4l2_blob_prop {

__u32 version;

__u32 payload_size;

__u32 payload[];

};

4. The parsing of payload would depend on its version which 
v4l2_blob_prop.version says, and each entry in the payload could be 
variable length, likes this:

struct v4l2_ext_pix_mod_desc {

__u64 modifier;

__u64 allocate_hints; /* heap flags shard by DMA-heap */

__u32 num_of_planes;

__u32 plane_sizes[8];

__u32 colorimetry_flags;

};

struct v4l2_ext_pix_desc {

__u32 fourcc;

__u32 num_of_modifies;

struct v4l2_ext_pix_mod_desc[];

};


In this design, we could avoid the problem that we could hardly extend 
our uAPI for V4L2, all the structure must be a fixed size.

Here are some options design that people want for this RFC:

1. Do we need to call the ioctl() command itself(likes 
VIDIOC_ENUM_EXT_FMT) which let the driver to flush its internal property 
cache or calling VIDIOC_GETPROPBLOB is enough?

2. Should we make MC node support this feature only or standard video 
node could? A thought from pinchartl is that every driver should have a 
MC node even for the stateful driver.


The implementation of RFC could be a foundation for ext pixel and ext 
buffer APIs. I would like to know your feedback before we settle the 
problem with the ext pixel format.

-- 
Hsia-Jun(Randy) Li

