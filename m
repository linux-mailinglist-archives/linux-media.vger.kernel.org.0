Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8810F280FA6
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 11:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgJBJQh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 05:16:37 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47440 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgJBJQh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 05:16:37 -0400
Received: from [IPv6:2003:c7:cf13:ec00:987c:fa6c:93a9:1dfa] (p200300c7cf13ec00987cfa6c93a91dfa.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:987c:fa6c:93a9:1dfa])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7801929DA00;
        Fri,  2 Oct 2020 10:16:34 +0100 (BST)
Subject: Re: [PATCH v3 06/12] media: staging: rkisp1: remove atomic operations
 for frame sequence
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
References: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
 <20200922113402.12442-7-dafna.hirschfeld@collabora.com>
 <20200925204222.GG3607091@chromium.org>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <bebacafe-11bb-5d9a-f889-4d16bb5d1817@collabora.com>
Date:   Fri, 2 Oct 2020 11:16:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925204222.GG3607091@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Am 25.09.20 um 22:42 schrieb Tomasz Figa:
> Hi Dafna,
> 
> On Tue, Sep 22, 2020 at 01:33:56PM +0200, Dafna Hirschfeld wrote:
>> The isp.frame_sequence is now read only from the irq handlers
>> that are all fired from the same interrupt, so there is not need
>> for atomic operation.
>> In addition, the frame seq incrementation is moved from
>> rkisp1_isp_queue_event_sof to rkisp1_isp_isr to make the code
>> clearer and the incorrect inline comment is removed.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> Acked-by: Helen Koike <helen.koike@collabora.com>
>>
>> ---
>> changes since v2:
>> add a closing "}" to if condition
>> remove usless inline comment
>> ---
>>   drivers/staging/media/rkisp1/rkisp1-capture.c |  2 +-
>>   drivers/staging/media/rkisp1/rkisp1-common.h  |  2 +-
>>   drivers/staging/media/rkisp1/rkisp1-isp.c     | 16 +++++-----------
>>   drivers/staging/media/rkisp1/rkisp1-params.c  |  2 +-
>>   drivers/staging/media/rkisp1/rkisp1-stats.c   |  3 +--
>>   5 files changed, 9 insertions(+), 16 deletions(-)
>>
> 
> Thank you for the patch. Please see my comments inline.
> 
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> index 0632582a95b4..1c762a369b63 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> @@ -632,7 +632,7 @@ static void rkisp1_handle_buffer(struct rkisp1_capture *cap)
>>   	curr_buf = cap->buf.curr;
>>   
>>   	if (curr_buf) {
>> -		curr_buf->vb.sequence = atomic_read(&isp->frame_sequence);
>> +		curr_buf->vb.sequence = isp->frame_sequence;
> 
> I wonder if with higher resolutions, let's say full 5 Mpix, and/or some
> memory-intensive system load, like video encoding and graphics rendering,
> the DMA wouldn't take enough time to have the MI_FRAME interrupt fire after
> the V_START for the next frame.
> 
> I recall you did some testing back in time [1], showing that the two are
> interleaved. Do you remember what CAPTURE resolution was it?

I ran the testing again, I added a patch to allow streaming simultanously from
both pathes: https://gitlab.collabora.com/dafna/linux/-/commit/8df0d15567b27cb88674fbbe33d1906c3c5a91da
Then I ran two tests:
stream simultaneously with 3280x2464 frames from the camera, and then downscaling them to 1920x1080 on selfpath, this is http://ix.io/2zoP
stream simultaneously with 640x480 frames from the camera, and upscaling them to 1920x1080 on the selfpath. this is http://ix.io/2zoR

the pixelformat for both is 422P.
I don't know how meaningful and useful is to test it on the rockchip-pi4 board, I only use it with a serial console.
The functionality can probably only be tested on the scarlet.

Thanks,
Dafna



> 
>>   		curr_buf->vb.vb2_buf.timestamp = ktime_get_boottime_ns();
>>   		curr_buf->vb.field = V4L2_FIELD_NONE;
>>   		vb2_buffer_done(&curr_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
>> index 232bee92d0eb..51c92a251ea5 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
>> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
>> @@ -131,7 +131,7 @@ struct rkisp1_isp {
>>   	const struct rkisp1_isp_mbus_info *src_fmt;
>>   	struct mutex ops_lock; /* serialize the subdevice ops */
>>   	bool is_dphy_errctrl_disabled;
>> -	atomic_t frame_sequence;
>> +	__u32 frame_sequence;
> 
> nit: The __ prefixed types are defined for the UAPI to avoid covering userspace
> types. For kernel types please just use the plain u32.
> 
> Best regards,
> Tomasz
> 
