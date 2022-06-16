Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33E9A54DA3E
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 08:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350136AbiFPGIy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 02:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347612AbiFPGIx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 02:08:53 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2080.outbound.protection.outlook.com [40.107.22.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECF3E5F;
        Wed, 15 Jun 2022 23:08:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAuL6qtCxDtH6YJzyF1fbc8FJy4vUKI6KL4M+i+i4YKvmkG3OUbF+ZoRuNEKRr6U52xuFmsekq/DYGuRQ/mEELLt881y+Nj0KWjJqCA8qLyckCqxL5LY4L1ieyf7NhD2mqtw9u841FKl+W3FdxGnCg6eIRzOLGyv/+Hlzoezi9R9chqBzkz8PYx985UKx2pD2S252e3npum4uj/yUJj8/u0vjfacpxz4NLLFxKpijt+Cuv0kcdKxFeBccZ7pcrc1cvoKAmcnU42so3aO7/A9AHzCLzWeGN1CNxmH6n5n0/S85hB7xI73jJq6RCKcB52XT+iEirMdjVDKhrFjQEqbxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XerFq9bL8u4IQFNa1y5u7uTJyvWXwBSJy49eQejinqM=;
 b=CcULhX6aP9bOgFpmr+axhPx831c6Z0Ql5AU8SP7+83oTNeSg0JlaRwM/PDE8ZTrVmYV/DwZp6AwfFbzbop4SMhRx7c0wTVzOQ/Bxj8tWQjvAV70AuniLoxpDTaqqY8CZsNEL7GOecW1pnJmCBV7xqfxODpg7f1Sl0gcNoc7YbczGXRAClFoyHjXY//27mCSo37rwj/ZiR8DVKn6aTAFEZaU+bmyFnaN/NHJ2Yf5TsBtP/zMgJqZkw+vnjYLIvIWgf1D3nOps6DQeB6LQFzRhI+qOIjNG8MQAixYMjEhQj3+GPTQCD9WZJZKpWOKndBZ/vo33XlW3vcOIQ31ILOLWFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XerFq9bL8u4IQFNa1y5u7uTJyvWXwBSJy49eQejinqM=;
 b=EtLFL00tZzXXV/43F5LCAv5OHTZG6fwEkus8q5PNDSZmBVb+JZr4iV2LraJ8SW+2ubgaQh8AC5XpW6XiFOfGu1E+j9MNJJ8+I2Fw+UWdAeBgE9y/XLE8/NwO99O64EYlzlcJ8BLCaXwCI9B7iUeYo5uEvz7qr4lWgbCcGsd90x0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM0PR04MB4306.eurprd04.prod.outlook.com (2603:10a6:208:63::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 16 Jun
 2022 06:08:49 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485%6]) with mapi id 15.20.5353.015; Thu, 16 Jun 2022
 06:08:49 +0000
Message-ID: <dfddd280-a8aa-977f-93e8-4a552dc8121a@oss.nxp.com>
Date:   Thu, 16 Jun 2022 08:08:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 3/9] vivid: add dynamic array test control
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     mchehab@kernel.org, stanimir.varbanov@linaro.org,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20220503093925.876640-1-xavier.roumegue@oss.nxp.com>
 <20220503093925.876640-4-xavier.roumegue@oss.nxp.com>
 <Yqj20J9QaAV6ZNes@pendragon.ideasonboard.com>
 <b508597d-3da5-5e1f-66a5-a9f7d6a2c352@xs4all.nl>
From:   "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
In-Reply-To: <b508597d-3da5-5e1f-66a5-a9f7d6a2c352@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0006.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::18)
 To PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de53a781-b8c9-469d-bef4-08da4f5eadb8
X-MS-TrafficTypeDiagnostic: AM0PR04MB4306:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB430600E15F01755C14B4A82BBAAC9@AM0PR04MB4306.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qN/fpKIG+Ylyqk0HlFBel5+2sf/4eY/QCXKyMO+zYXOaFrZ1deTELuQQdQQzBqNPDMc+SxbkW0dUrWgcNWUQUHfMkhBuPWG7k7Tc88h4p2u57X8sIHV/4E8k66q2WbG0ex6Q0CW8tB/zH+25lckYQcurL3bkaG+7gl1Xd/S4z0+PcSutHH5MvnIRu/z0kPJLxYOTG9khfrdHjn35k3OhjeYzu12gOXWACUXWRzTDAUG2lGUjXhxKq/pIlHlky8P2l1LWWY+j3Vs2k0WVgLMzEewmFm/xKINa0z+YKVougS2jAG+n35m6n3Oza1ybKECqFBt/7FHpa1aj7DHuQjliZRenVnOivF8woE4t6VMTYwt+A7ZkE3un1hEKpsv0u0fJ4CmhaAbz/xafl6eGqNbggZOeK+AJPpCkF9kCp4TBkGZ6DGPIaItfQhjNWGDC9qbHjEFNcjBsXkDtzOH1dHwQV++pYiyL9tAmmVH1VE0x7zCNgeQ9MZDQ/AbdPj8U6CLOnXKnQ6uBjHxpSzZc/EOHm2/znSF2R60sQ68rPmhZ/yy7YV5iYu2FHAc7OQxOk7UsE473fnN21P9Y3wDvOWFvEBYnzP4Bunr6Q444avRO6YnoH+nfqD39rZLGJz1Bf77dVCDJtIuSfHIcBpE67JrFxejs1YY01Efv85thRFTed8kw3A8TluTUutDoL6DQRvsmaIdNW08mQuav5zRXlekwDYDgZUCRjDZVD+Gkil+29vU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(4326008)(66556008)(8676002)(2906002)(31696002)(86362001)(66476007)(66946007)(8936002)(38100700002)(7416002)(5660300002)(53546011)(6512007)(52116002)(508600001)(186003)(6486002)(2616005)(6506007)(6666004)(110136005)(83380400001)(316002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU9TbFphZ2dwRmplOXQ1bDVTR2JjaWZhMzhsMm9FWmhMNWdBK1d2bzgxd0R6?=
 =?utf-8?B?SEF0eGYzY29CKzlHOXl6V1dIUk80ay9zdVIvMG0yRFZHWU93cGE2azliSXRX?=
 =?utf-8?B?R243R2I4djZjSDlMeEFraW4xZCtpNE9lalhmcjNVUm9kYTI4SmRNL0ZKa1Rh?=
 =?utf-8?B?b2JjUjhFWEVqWHB4aC83QWV6OHhnODNJVU5HbHJBLzZUVHJQYldnSFlLNGIv?=
 =?utf-8?B?am9PbktIemI3M20wSW1XYnNDclVYZ1VIN29PRkRtUG83alFhTkpjaWgxL3p3?=
 =?utf-8?B?UkF2QlBZYXhITndaNEszS0ZhNGg4OTZ0U09VcHdnS2tRRGVnZG94RFFzRkJL?=
 =?utf-8?B?M1hEalVVa015a0RoQlVORkk3MlMvd0UxZVpJMkQrd1dVamdmM0RDc2NDanZx?=
 =?utf-8?B?djJSUG5qNSt3cGhTSmdZWjJYdGdHdFVBZ3BkdUF4QWh3MFFxN2Vreis5aXRs?=
 =?utf-8?B?ZFBvcHlERVpINzJ5cEJoTUQ3d3RQcGs3Wnl4MEZZM0NiWnczNnI2UFpPdHJu?=
 =?utf-8?B?d0oxclc3SmYvYUJ2RFdpNmFVc0piSDFZRnJORGFwUkZJdmtWMkZMM2dla0d4?=
 =?utf-8?B?bzBBOEgwOXNtZEZjQUxqYVFtYUFRcVdUSFQ1cGtwWnZON2lkSmRuWnFkM0xs?=
 =?utf-8?B?bThMOXltUVlFUWYzUGJFcUF1YTNsekM1ZnRHaHZsQnJ6Y2VLazFhMUFLb0lC?=
 =?utf-8?B?ckNVdDRKU3A4WnpNWHgvTjdtenVTbS9CS0N2TXVrRm5ScmtZLzNCYUkySitq?=
 =?utf-8?B?YnVseU92M1dERU5HREFKWUhhZmd6bHVhbWZOR1NIZjJibEpsZzRSek1PUmRU?=
 =?utf-8?B?T0ZuUGRiTXRrY2xPblA1R3h3ZnlmVlBmejFVVFZTek1xK1J2RVdJZE9oOXBL?=
 =?utf-8?B?U1hqb0JpNGJ0WWpEWDRZTnZEOW4xblBSQ0o4Nitkd3pNNjhiekVScFlkV2h5?=
 =?utf-8?B?ZER2cWVZLzg1bEVQbEJDV1NHWnA0TGtJazlHdzZrZDkvdmpSTUNkOC9wSy90?=
 =?utf-8?B?dnRmUW5TK3lDQS81RHZMQVA0MDJmMDVLTDdLeHZuVUlPcktrQVBybHY3WmhJ?=
 =?utf-8?B?aTFsTGhBNW0xRHIrNWpaN0ZxcnhwODZkdnpYa2h4TVAxRGllSStPenNOa2Nq?=
 =?utf-8?B?NkNpNW1DSzgydDd2SkFuMmtabUlpM09EVlA1dzBnUk1lSE5ZOVAyc3hlaU9G?=
 =?utf-8?B?TEtIMEFxRm01TnArVUY0N2NMTUhPdm1BZmpSTEVBQXZvQ1JkREUxSWd1V242?=
 =?utf-8?B?ZEo5UXBNV3FsQ01qR0QzME9XN09Ebyt5b3F4c0k1aWFmTXZnUXFMb3NrdDYz?=
 =?utf-8?B?L3czbXBZQUYzQWtYaGo4cit5SVoreHBUSVpIZWhLUy9HcEN4UXYvOFE0T0RX?=
 =?utf-8?B?UTluMnVXcXQxc05TZTBITnB3a1E5MW0zT0d3TG5WaUR3eFJ0VTlBK3Rkb2dT?=
 =?utf-8?B?YVd1MUovalU1U3BkRDk1TEsxSk1hUjlNUm5JTE1XVjhzMHJ4ZDBDeXplTWxp?=
 =?utf-8?B?Y0lGODlzYzdjN2Z0VDJTOHB5OWhqQXB1TEFXQXV1c1d2TmZ2ZTh4M21IUTBL?=
 =?utf-8?B?ZzQ2OGl2Q3VvS2hUbWRxdVVxRjlYbVJFWW40UUVPN0VUNGJpWEQvYUVkQW5C?=
 =?utf-8?B?THM1TWlxL0JVN0FTU2dTcnh2SHNheWVxNWNiOFNxTXZDZ01JNnZuWm8zMHZh?=
 =?utf-8?B?dVNnVVBYLzdNbTB3WnlhL2JLOWdwbDBydXlHVDVoMWs1dENscmJvT2JjQ1I4?=
 =?utf-8?B?dzdGcDRBM2FjSkFmTlpCTWRmZ0MvUDZaczBLNnhINUJ0L2ZXZGJsWDRuTVcr?=
 =?utf-8?B?WCtIVDV1Ni8xc2JFVk4wOExJVXQ2RmJoUlhSWkNoRGpBcnJaZjB4TzRsWEpU?=
 =?utf-8?B?Mm5zd0JmdjlRYThBZUcwMWQ5ck5ENXZ1MmJoTUw5TWRGTytKTEFsQmduZkZL?=
 =?utf-8?B?b3FhWGxDTE9jVkRHOHhuNmt1Rzh6UDFpVHgzTVgyWVpidjY3cnVIUEN3UHRo?=
 =?utf-8?B?bmRTUFY5ZnZvdFZoNmpBekVadXRYOGpOQUtsSUpkVmJydFk3dXlCYmk0YjB0?=
 =?utf-8?B?ZkVEMXczem5rUjhIRVBoRUdXenQ3YXNWL3I4a2hQcnhKRkhDdXNzV3dZL1h0?=
 =?utf-8?B?Zk9JeE9WM3BTd2RPZFhlb0cxOThSQ2FqYXZkVVhoeHVrU0ZySzlXUVBiRWMr?=
 =?utf-8?B?TUlTREZNeVkrbkpzVTBuVGpHUzJYZ3NMVm9KS3p2S1RJMXlnYXJETzFJOFNq?=
 =?utf-8?B?R3JJZ1pnWDlwbWJPUGRQK1hodEFZTENRVG5FRnZVR0RmWU1LWHNwcjlEY3VH?=
 =?utf-8?B?TTNzZFZmRXBpL0xFOUdsa2VNc0FlNjBCMTNIUVBabXhSTDZFQjQ1SHNJcjNr?=
 =?utf-8?Q?h73cFJzPrpwnKAquOlLjFBA3kXfa2y2RWAobuT93o6tsF?=
X-MS-Exchange-AntiSpam-MessageData-1: Yv+vF9hkCXC4fWiZ0XJ9IOFCG8256hX3LjI=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de53a781-b8c9-469d-bef4-08da4f5eadb8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 06:08:48.9557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NWPhHDEoHM/LUhDVL6T4vErzvxb+cFIMkNTxpXGArW+yjazaVNcXcyBI4UqgMQxaj4YLmk/eTjWPSbAOOSfz+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4306
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 6/15/22 11:14, Hans Verkuil wrote:
> Hi Laurent, Xavier,
> 
> Ignore what I wrote before, I read it with the HEVC patch series in mind, not the dw100
> series.
> 
> So let me try again :-)
> 
> On 6/14/22 23:00, Laurent Pinchart wrote:
>> Hi Xavier and Hans,
>>
>> Thank you for the patch.
>>
>> On Tue, May 03, 2022 at 11:39:19AM +0200, Xavier Roumegue wrote:
>>> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>
>>> Add a dynamic array test control to help test support for this
>>> feature.
>>>
>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>> ---
>>>   drivers/media/test-drivers/vivid/vivid-ctrls.c | 15 +++++++++++++++
>>>   1 file changed, 15 insertions(+)
>>>
>>> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
>>> index e7516dc1227b..7267892dc18a 100644
>>> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
>>> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
>>> @@ -34,6 +34,7 @@
>>>   #define VIVID_CID_U8_4D_ARRAY		(VIVID_CID_CUSTOM_BASE + 10)
>>>   #define VIVID_CID_AREA			(VIVID_CID_CUSTOM_BASE + 11)
>>>   #define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
>>> +#define VIVID_CID_U32_DYN_ARRAY		(VIVID_CID_CUSTOM_BASE + 13)
>>>   
>>>   #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
>>>   #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
>>> @@ -189,6 +190,19 @@ static const struct v4l2_ctrl_config vivid_ctrl_u32_array = {
>>>   	.dims = { 1 },
>>>   };
>>>   
>>> +static const struct v4l2_ctrl_config vivid_ctrl_u32_dyn_array = {
>>> +	.ops = &vivid_user_gen_ctrl_ops,
>>> +	.id = VIVID_CID_U32_DYN_ARRAY,
>>> +	.name = "U32 Dynamic Array",
>>> +	.type = V4L2_CTRL_TYPE_U32,
>>> +	.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
>>> +	.def = 50,
>>> +	.min = 10,
>>> +	.max = 90,
>>> +	.step = 1,
>>> +	.dims = { 100 },
>>> +};
>>
>> To meaningfully test this, don't we need the vivid driver to change the
>> dimension ? Or is it meant to only test changes made by the application
>> ?
> 
> As I understand it the dw100 driver needs a 2 dimensional array control.
Considering the semantic of the array control, indeed, this is 2 
dimensional array control. Nevertheless, the driver does not need to 
access individual array items, as the hardware is the only consumer.
Hence, the driver rather considers the array control as a binary blob 
with varying size.
 From this perspective, the dynamic array control was a good candidate.

> The size is fixed for each resolution, but if the resolution changes, then
> this control changes size as well, and it makes sense that when that happens
> it is also reset to default values.
> 
> So this isn't a dynamic array at all. It is a standard 2 dimensional array.
> 
> What is missing in the control framework is a function similar to
> v4l2_ctrl_modify_range() that can resize an array.
> 
> v4l2_ctrl_modify_dimensions() would be a goo
> I can make something for that if you both agree with this proposal.
I am ok with that. Thanks !
Regards,
  Xavier
> 
> Regards,
> 
> 	Hans
> 
>>
>>> +
>>>   static const struct v4l2_ctrl_config vivid_ctrl_u16_matrix = {
>>>   	.ops = &vivid_user_gen_ctrl_ops,
>>>   	.id = VIVID_CID_U16_MATRIX,
>>> @@ -1612,6 +1626,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>>>   	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
>>>   	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
>>>   	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
>>> +	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
>>>   	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
>>>   	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_4d_array, NULL);
>>>   
>>
