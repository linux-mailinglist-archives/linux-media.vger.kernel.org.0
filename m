Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF550585A64
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 14:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234365AbiG3MWF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 08:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbiG3MWE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 08:22:04 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60042.outbound.protection.outlook.com [40.107.6.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEAE213F9A;
        Sat, 30 Jul 2022 05:22:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=laeDUULdeshorhH2zsCiL7gM+U67nVJjWZ742QIX5t3VLiUC5VAcDSaEkelJoMFvo92tYW1pXLEACf400ZXBNdkRmGTiQujZM8njyLM7V4gElApVz8EVd9qzVXZYc7wxTbNC7DCeJPlQXBAnroYVeagvoaWqoYOPhATHx5L5UhDxAz1IKpsVKDaxi5lD1cNrXyCUdk9hx8LI5v+iNrfWX/keFxaCXzPXjuOh2Y1vtmYOI9dNXSxuVpCq/IDOTb02loErL+Tvuv87oQnmd9kX24rnVl8Ig3ESNgJgWGzj12soKNAu9pQD7fnvmZAu7Q+Nb/70F/daxx/HiCgFNk+6Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otc7mEloMqMqhxWggEypi2SCqQG5qzoLKNgmD7/AS5A=;
 b=dR9kohVPQNIKGnJkesHaPZOKFjqeS40UuBld+OCpuSBHtLomyBq8a8PCN7zAzZitl0jcC/XHEConpOevc5PIc8cC2oHQghFqZGRAGrzrHlTk4uQLg6s1NCSk2CfH7okRNI2nWuyqVqGESQXfK0oMvVVjrUBYNaO5mRxVEO59COM7bQUzkZLdB561/JKGOUilbcYqMHejvlEcKGbVPjJBqIzGOv7gE1SbH3KFS7JYik7wQ/lAwTj5VItKDqykEGUy6138qinu9TbdnUWnax5LyKrCBmkkNbzNAeoDfUyfymzmOG/DzgvPwHonPO+UkdGvxY44wyr+BWT4RS9+TF8Mkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otc7mEloMqMqhxWggEypi2SCqQG5qzoLKNgmD7/AS5A=;
 b=bad4adHYmdVgHU8lgc6Ladl9GlHWl4MFUT9NbAmQLunZ+XKMa7cw0OCtVPu9ik9OPd5C6rqzurVT532cB1saJjVClZ4JK/3qYT5s2lYtqq3NipXEeySVuy8toRKQ1houYoYf6UlQM8QWtlIixEsdwJpgPeY+bgOjPYMOv1TBVIo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AS8PR04MB7719.eurprd04.prod.outlook.com (2603:10a6:20b:29a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Sat, 30 Jul
 2022 12:21:59 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f%9]) with mapi id 15.20.5482.014; Sat, 30 Jul 2022
 12:21:59 +0000
Message-ID: <2df18385-c975-eeab-40b7-7ebfaad8f378@oss.nxp.com>
Date:   Sat, 30 Jul 2022 14:21:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v9 7/8] media: dw100: Add i.MX8MP dw100 dewarper driver
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20220730102413.547698-1-xavier.roumegue@oss.nxp.com>
 <20220730102413.547698-8-xavier.roumegue@oss.nxp.com>
 <5fdb62df-da1a-2c68-aaed-18a394f5f4ba@xs4all.nl>
From:   "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
In-Reply-To: <5fdb62df-da1a-2c68-aaed-18a394f5f4ba@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0108.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::24) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22ecd598-2ecf-4f41-4aca-08da722619d3
X-MS-TrafficTypeDiagnostic: AS8PR04MB7719:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qABHIM7ZvKehYdy8A8uBw7iqYNqE8yoBWpmkH69dy4jGIzIJf1leq8AuinzNPTQZI914QDIlKvv5L1S7RNkq25hH/H8L1BCEQ6CWABTIfpDN2Hm8WVMsj9WT0/CFYYwJ88P7K0cevwInmU3tR3/mTg1rVDGrSYc12WutM7ErcYwsyTFt05C9GPmDjVrcOxgRTdDZk5Lj3b2TTAxYsbknq5DwlYeUmOpNzQ+0e63Z3hppo774clX5Iu2AtQNQ1cCkOHpo1Yx8OW3wkSml4qHHS8+D6zEJbtJ+DfCmTxMntmn+PNo7W0pWU04FKJzLmVmSKjXWqevMKyh8u7fKJI7edQNzxqDZhoJGhxBEWDFrXoSZRb4UHH7eni2KZ29NZhxWsYx8HL5AgCMemMltMispbif5yr1cKhfwqVy7yJ+iNtr2eXgIZEGt1cqBwt6eSqIV09oCkZuEJReehj5bL8DGHV4N0yp3DLW2G2BJK33SJQRtkIE7h1Dpa3seB5iqxcf32ERksE0ptlWIcTyfCowy540XSLBsX43TIl3az40omMmmQazViwO83ctdKYWg0O4nmfPMER3jwpsz/jnmChXq7KQ7PLGGplweTrg+s4fIo++7Yeogc63HG/A6vABvUJpgkSJR+KiU/uRqvuCsVsN17v7wzqPaMPHGRaxlpCNdM7BewKsEvgf3agh0mgiCfdr6O53v+cd2zMRd8imyiGcfXq70DtBeLDzhjuK+nJCO3fGt11C4smscYCasXtIBc7GH7j2bJ05PEr/ce+HpieAQ9ta2Ux4besexW9zGeqYR164cuP4CChGHAMYOPOD/Rq6CnUODGILv7wutaX20shPxiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(5660300002)(66946007)(8936002)(7416002)(8676002)(31686004)(6486002)(66556008)(66476007)(478600001)(4326008)(53546011)(2906002)(86362001)(186003)(2616005)(52116002)(6506007)(41300700001)(316002)(6512007)(38100700002)(31696002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDEwRURZS0c0VVp0anhBanBORnhGOS9QQUF5Nkp3QTAyWjFRNVNXQ1hPektW?=
 =?utf-8?B?dFJlVGlMZVloMGVvVUZIbVJ3LzZ0dUltTXFmMDA3WG5FaStHWDY3THlDMm9r?=
 =?utf-8?B?L1hIMXQ5dlJhVEtzdUZocHUwWmpvWEdpQzBKRnppckMvSm16RnFJaThkZWNl?=
 =?utf-8?B?WnFJR2tQOXVBR1JjUTRGcGhMbG5XOU8xb2grd3l6RnZXb1EwUUlkdnZoazkz?=
 =?utf-8?B?Y0lJaWdVSGkzNjZ0Wit6aUg3R3NKZG5XdzlOVXhyL3dQbkdaeTdxM2JMN3NG?=
 =?utf-8?B?TytaMThtRnFsbGZDVlRMajRZcUFrLzd4YjA4SEM1Wjd5SnRGeXdiMUdob3Jx?=
 =?utf-8?B?ejFOZjFIaG9tWi8vR0h5OXdEMUVxWDBQNFgwTElxWVRvdlRxVFRidUY4bElp?=
 =?utf-8?B?NkxNaVU2WitsMW5GM2hLZCtmSFN1ZVVmWnVLWXVQMmpoQ0hsQWhxalFKNGRP?=
 =?utf-8?B?MHFqTjBWQ3o1aHg4K1BQM2duTGc0SDVwZm1TOGFRdHNmZ1F0TWgwZlhIdTM5?=
 =?utf-8?B?QW9oeUtGOCtnVTlEQnJpN2lTcXRUV3JJNlFka29Zc3luNlNjZk9aellUaDFh?=
 =?utf-8?B?aUFCb1BmTE9GekhUZFQ3Y0ZyUm41SVc1QXBONXJBT2JSNVZLRHl6VWFKbHJm?=
 =?utf-8?B?bDh4MEFEaWd1Q1dqYUJlYU9CV2NRaWM1SDh0OXZkV0NkL00yMHp2ckFWQ0pC?=
 =?utf-8?B?VXdGOEpFUDJhNFVMTGZzK2RsamtMS2NWNTRaQ1RXczhjanJ6TjBPUHNSYk9i?=
 =?utf-8?B?WGpXaTNmRndlb0pSQSsyWEF2NVNhdTlTVUVZckdJbllnaklPVkpTci94dUJr?=
 =?utf-8?B?cml2WFRzMUR6L3NqMCtrZTlpZURHLzVhWk84Z1NKK1c1ekdqOG03c2JOMXM0?=
 =?utf-8?B?d05XMWFFV1EyYmFrK0lKckFYdGFLcnJhb2Y1ZlAvQlBIYTJlekM2bXJJL0pa?=
 =?utf-8?B?VktEQXpucUpDQVVlbGlrbGJkb00yZ20rd0I1L3FUQ1l2Yms0bE9SRUtxM3lm?=
 =?utf-8?B?VkIxdVZmOXh0ZkxIdVhFM280MXdOTWluWTV6bzBhN1lHbncwODN2TUFrL2pl?=
 =?utf-8?B?MlRHVEVxVDVUWElNcEhaeVkwMHZFMmNrSHpkRysyRTVieHNSdllTZFU3blBE?=
 =?utf-8?B?aDhydDRoTHdOaVU4WWtCM0pPZ0JsZW1pMFVkVlVQaCtMMnRyV3picXltR2hV?=
 =?utf-8?B?MC81K2M5M0t4MGhMdUdKMlBpUU1HSnhKOHVoSGpoVWJ5dTFJTnJYc1kvVzQr?=
 =?utf-8?B?YmNWRU05V0dkM1NsQ3FQT0tibThuOXdqUlN4VHQ0QklMZkFoajVKM1RvL3Rs?=
 =?utf-8?B?NklCR1ppdjlIenZSVjNUYXlYS3FJZUNjSEVKNGdnL1NxZmlFbDZOUzVKQ0lV?=
 =?utf-8?B?YVdMZ20zTm9xQytiKzk3T0xySDVkQ2NqNis3ZHNIZDhEVTY1c09yL1dyUU1v?=
 =?utf-8?B?V2k1ZUFwN1FvUDAreFIybk9vN2RVR21MWUZENzNmU3ZldEg3Mnd3U2dwYkVl?=
 =?utf-8?B?c2tWaGFhMDBEazMvV2dsS2RzWHk3dzdNbEdOcUJZRDZmcmk3Sllkczk0STNL?=
 =?utf-8?B?c0RMdnpxZGJOeFhRMDNudHhMN2p4akdGajZhdzdNV1AxajhOdFZyZHV0RlRC?=
 =?utf-8?B?b2NKdG9lZFpaTTVoUFRyZjQvNk1zc2Rra2loM2dxL3cwRFREVXc4MzVKVnJF?=
 =?utf-8?B?RFhFejMyNWUvQXdOcmU2SE9BR1EwVjVXZllwalNPQTJmR3R1bGRGdHFrckZO?=
 =?utf-8?B?bUREKzZrRjFlRjVIbGtHbUdYc3I2dWxDSVdwUFRYNm84TmdCRExpLzRhVUo1?=
 =?utf-8?B?QXdTVS9oWHQxS0pLdm01cjUvS0ZRNVo5MnRsa3YrbUVTbFE1TTlHZU9GeDdl?=
 =?utf-8?B?UENDOGtuVlkvcGlrcnMwc3pQY1pscnNNaDRUS1pqN1VGVzZQd0sveTBUdWFF?=
 =?utf-8?B?Zm9LVkVQME9HOHhyTXlIbkdRNjR5OThKU3hEUUxJRFJmK2FkeklpZVFyanl4?=
 =?utf-8?B?T1UvRnFOclg1eDVFRmNMSlJ2MHBPL3N3TFFZSnFyWHdwelM1cTM0TkljVUFx?=
 =?utf-8?B?L2llbElXUEV5K2JHMlpqbDFUNEtIWUF1cVNZR0YvS09KQUxoSFZwK2JTbWEv?=
 =?utf-8?B?SW1hQTVidG1HWUtqakpkWXhMSHQ3Tnd4akViKy9hSDVLZVFIaElnalk5WUtw?=
 =?utf-8?B?MEJEb0cwVTcxd2ZVcnhJMVVtR3Q3dnQxZGJDM2llNER2MStZb1BzbmwraU96?=
 =?utf-8?B?MTNBUUFYai91N1h1bmN3bjM0M2d3PT0=?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ecd598-2ecf-4f41-4aca-08da722619d3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 12:21:59.6148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k2+yUgj5iAzwBmGtW4kuESYu7kxv+2srXn8mCyDbKYulPwWH4rAR6SHY/VGVtczyrgJk+3ejbz+K1d69pffRcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7719
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans,

On 7/30/22 12:49, Hans Verkuil wrote:
> Hi Xavier,
> 
> On 30/07/2022 12:24, Xavier Roumegue wrote:
>> Add a V4L2 mem-to-mem driver for the Vivante DW100 Dewarp Processor IP
>> core found on i.MX8MP SoC.
>>
>> The processor core applies a programmable geometrical transformation on
>> input images to correct distorsion introduced by lenses.
>> The transformation function is exposed as a grid map with 16x16 pixel
>> macroblocks indexed using X, Y vertex coordinates.
>>
>> The dewarping map can be set from application through a dedicated v4l2
>> control. If not set or invalid, the driver computes an identity map
>> prior to starting the processing engine.
>>
>> The driver supports scaling, cropping and pixel format conversion.
>>
>> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
>> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>   drivers/media/platform/nxp/Kconfig            |    1 +
>>   drivers/media/platform/nxp/Makefile           |    1 +
>>   drivers/media/platform/nxp/dw100/Kconfig      |   17 +
>>   drivers/media/platform/nxp/dw100/Makefile     |    3 +
>>   drivers/media/platform/nxp/dw100/dw100.c      | 1712 +++++++++++++++++
>>   drivers/media/platform/nxp/dw100/dw100_regs.h |  117 ++
>>   6 files changed, 1851 insertions(+)
>>   create mode 100644 drivers/media/platform/nxp/dw100/Kconfig
>>   create mode 100644 drivers/media/platform/nxp/dw100/Makefile
>>   create mode 100644 drivers/media/platform/nxp/dw100/dw100.c
>>   create mode 100644 drivers/media/platform/nxp/dw100/dw100_regs.h
>>
> 
> <snip>
> 
>> +/*
>> + * Initialize the dewarping map with an identity mapping.
>> + *
>> + * A 16 pixels cell size grid is mapped on the destination image.
>> + * The last cells width/height might be lesser than 16 if the destination image
>> + * width/height is not divisible by 16. This dewarping grid map specifies the
>> + * source image pixel location (x, y) on each grid intersection point.
>> + * Bilinear interpolation is used to compute inner cell points locations.
>> + *
>> + * The coordinates are saved in UQ12.4 fixed point format.
>> + */
>> +static void dw100_ctrl_dewarping_map_init(const struct v4l2_ctrl *ctrl,
>> +					  u32 from_idx, u32 elems,
>> +					  union v4l2_ctrl_ptr ptr)
>> +{
>> +	struct dw100_ctx *ctx =
>> +		container_of(ctrl->handler, struct dw100_ctx, hdl);
>> +
>> +	u32 sw, sh, dw, dh, mw, mh, i, j;
>> +	u16 qx, qy, qdx, qdy, qsh, qsw;
>> +	u32 *map = ctrl->p_cur.p_u32;
>> +
>> +	sw = ctx->q_data[DW100_QUEUE_SRC].pix_fmt.width;
>> +	dw = ctx->q_data[DW100_QUEUE_DST].pix_fmt.width;
>> +	sh = ctx->q_data[DW100_QUEUE_SRC].pix_fmt.height;
>> +	dh = ctx->q_data[DW100_QUEUE_DST].pix_fmt.height;
>> +
>> +	mw = dw100_get_n_vertices_from_length(dw);
>> +	mh = dw100_get_n_vertices_from_length(dh);
> 
> Note that ctrl->dims[] contains the array dimensions: use that rather than
> calculating from dw/dh since using dims[] is more robust.
> 
>> +
>> +	qsw = dw100_map_convert_to_uq12_4(sw);
>> +	qsh = dw100_map_convert_to_uq12_4(sh);
>> +	qdx = qsw / (mw - 1);
>> +	qdy = qsh / (mh - 1);
>> +
>> +	ctx->map_width = mw;
>> +	ctx->map_height = mh;
>> +	ctx->map_size = mh * mw * sizeof(u32);
>> +
>> +	for (i = 0, qy = 0; i < mh; i++, qy += qdy) {
> 
> This isn't correct: you actually start from 'from_idx', which is almost always 0,
> except if userspace only sets the first N elements of an array, in that case
> those N elements are copied to the control array and the remainder is initialized.
> 
> I admit that it doesn't make much sense in this particular case, but you still
> need to take it into account.
Right, but it was done on purpose.It's incorrect from the driver 
perspective to initialize partially the dewarping map as this can lead 
to hardware hang up. Strictly speaking, accepting partial update would 
force the driver to verify each individual pixel has been properly set 
prior to start the streaming - which is not reasonable. API/semantic 
wise, if init() is intended to be used as "set_range()", this might 
rather makes more sense to add a dedicated set_range() callback, and 
limit init() use for initializing the entire control range.

Having said that, I can implement as per your suggestions but I will not 
implement sanity checks and error handling in case v4l2-ctrl api and/or 
userspace have not initialized properly the mapping, i.e. partial 
update, assuming that v4l2-ctrl api will always call init() for the 
whole range on its first call.

> 
> I also would rename i and j to y and x, that makes more sense here.
Indeed, but as from_idx/elems involves a 1D handling, the loop index 
will become idx.
> 
>> +		if (qy > qsh)
>> +			qy = qsh;
>> +		for (j = 0, qx = 0; j < mw; j++, qx += qdx) {
>> +			if (qx > qsw)
>> +				qx = qsw;
>> +			*map++ = dw100_map_format_coordinates(qx, qy);
>> +		}
>> +	}
>> +
>> +	ctx->user_map_is_set = false;
>> +}
> 
> Regards,
> 
> 	Hans
> 
Regards.
   Xavier
