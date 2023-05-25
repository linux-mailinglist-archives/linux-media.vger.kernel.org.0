Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6848E71083E
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 11:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240543AbjEYJD7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 05:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232918AbjEYJD5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 05:03:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD126195;
        Thu, 25 May 2023 02:03:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 64036610D5;
        Thu, 25 May 2023 09:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D193AC433EF;
        Thu, 25 May 2023 09:03:52 +0000 (UTC)
Message-ID: <bcbd0934-9936-bd9b-92a3-6135ca4c258a@xs4all.nl>
Date:   Thu, 25 May 2023 11:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCHv3] media: venus: provide video device lock
Content-Language: en-US
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230524135737.2557837-1-senozhatsky@chromium.org>
 <20230524141312.2558810-1-senozhatsky@chromium.org>
 <2c732d80-1a18-7a34-03a8-16afb0de5ea2@linaro.org>
 <f9219cb0-2cac-bace-20f7-27005cd0e6f1@xs4all.nl>
 <83cd3dc7-455d-0f26-d2a8-3ebe92d9e33f@quicinc.com>
 <1eeb16e4-0812-b70b-df5a-1670c21a5221@xs4all.nl>
 <20230525085936.GD30543@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230525085936.GD30543@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/05/2023 10:59, Sergey Senozhatsky wrote:
> On (23/05/25 09:22), Hans Verkuil wrote:
>>>> Since these are m2m devices, I think this should set vfh->m2m_ctx->q_lock
>>>> instead.
>>>>
>>>> The vb2_queue is per filehandle for such devices, so by just setting
>>>> vdev->lock you will have all vb2_queues use the same mutex.
>>>>
>>>> Instead the struct v4l2_m2m_ctx q_lock pointer, if set, will use that
>>>> mutex for all vb2 operations.
>>>>
>>>> I think you can set it to the 'lock' mutex in struct venus_inst.
>>>
>>> IIUC, the suggestion is to use the 'lock' in struct venus_inst while
>>> initializing the queue. This might lead to deadlock as the same lock is used
>>> during vb2 operations in driver. Might be introducing a new lock for this
>>> purpose in struct venus_inst would do, unless we are trying to serialize at
>>> video device (or core) context.
>>
>> For the record, I have not analyzed how that lock is used in the driver,
>> so if a new mutex has to be added to venus_inst rather than reusing the
>> existing one, then that's fine by me.
>>
>> But it should be a instance-specific mutex, not one at the device level.
> 
> Thanks for your help Hans. I added a per-instance queue mutex [1], so if
> no one sees any problems with it then I can send a formal patch later on.
> 
> [1] https://lore.kernel.org/linux-media/20230525005312.GC30543@google.com

Note that I would like to see 'Tested-by' and 'Reviewed/Acked-by' tags before
merging, preferably from the driver maintainer(s).

Regards,

	Hans
