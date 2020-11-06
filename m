Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1AE22A97D1
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 15:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbgKFOne (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 09:43:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgKFOnd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 09:43:33 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D70C0613CF
        for <linux-media@vger.kernel.org>; Fri,  6 Nov 2020 06:43:33 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 3E88F1F46A75
Subject: Re: [PATCH v3 06/12] media: staging: rkisp1: remove atomic operations
 for frame sequence
To:     Tomasz Figa <tfiga@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
 <20200922113402.12442-7-dafna.hirschfeld@collabora.com>
 <20200925204222.GG3607091@chromium.org>
 <bebacafe-11bb-5d9a-f889-4d16bb5d1817@collabora.com>
 <CAAFQd5BeWOYadUU8nBtFpaA5Eb2T0qFk0kDVf9eYmYzXJj+sZA@mail.gmail.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <d6b893e1-1177-ba6d-0499-a3e45f79503b@collabora.com>
Date:   Fri, 6 Nov 2020 11:43:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5BeWOYadUU8nBtFpaA5Eb2T0qFk0kDVf9eYmYzXJj+sZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

(sorry for not had replied this earlier)

On 10/2/20 12:30 PM, Tomasz Figa wrote:
> On Fri, Oct 2, 2020 at 11:16 AM Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
>>
>> Hi,
>>
>> Am 25.09.20 um 22:42 schrieb Tomasz Figa:
>>> Hi Dafna,
>>>
>>> On Tue, Sep 22, 2020 at 01:33:56PM +0200, Dafna Hirschfeld wrote:
>>>> The isp.frame_sequence is now read only from the irq handlers
>>>> that are all fired from the same interrupt, so there is not need
>>>> for atomic operation.
>>>> In addition, the frame seq incrementation is moved from
>>>> rkisp1_isp_queue_event_sof to rkisp1_isp_isr to make the code
>>>> clearer and the incorrect inline comment is removed.
>>>>
>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>> Acked-by: Helen Koike <helen.koike@collabora.com>
>>>>
>>>> ---
>>>> changes since v2:
>>>> add a closing "}" to if condition
>>>> remove usless inline comment
>>>> ---
>>>>   drivers/staging/media/rkisp1/rkisp1-capture.c |  2 +-
>>>>   drivers/staging/media/rkisp1/rkisp1-common.h  |  2 +-
>>>>   drivers/staging/media/rkisp1/rkisp1-isp.c     | 16 +++++-----------
>>>>   drivers/staging/media/rkisp1/rkisp1-params.c  |  2 +-
>>>>   drivers/staging/media/rkisp1/rkisp1-stats.c   |  3 +--
>>>>   5 files changed, 9 insertions(+), 16 deletions(-)
>>>>
>>>
>>> Thank you for the patch. Please see my comments inline.
>>>
>>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
>>>> index 0632582a95b4..1c762a369b63 100644
>>>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
>>>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
>>>> @@ -632,7 +632,7 @@ static void rkisp1_handle_buffer(struct rkisp1_capture *cap)
>>>>      curr_buf = cap->buf.curr;
>>>>
>>>>      if (curr_buf) {
>>>> -            curr_buf->vb.sequence = atomic_read(&isp->frame_sequence);
>>>> +            curr_buf->vb.sequence = isp->frame_sequence;
>>>
>>> I wonder if with higher resolutions, let's say full 5 Mpix, and/or some
>>> memory-intensive system load, like video encoding and graphics rendering,
>>> the DMA wouldn't take enough time to have the MI_FRAME interrupt fire after
>>> the V_START for the next frame.
>>>
>>> I recall you did some testing back in time [1], showing that the two are
>>> interleaved. Do you remember what CAPTURE resolution was it?
>>
>> I ran the testing again, I added a patch to allow streaming simultanously from
>> both pathes: https://gitlab.collabora.com/dafna/linux/-/commit/8df0d15567b27cb88674fbbe33d1906c3c5a91da
>> Then I ran two tests:
>> stream simultaneously with 3280x2464 frames from the camera, and then downscaling them to 1920x1080 on selfpath, this is http://ix.io/2zoP
>> stream simultaneously with 640x480 frames from the camera, and upscaling them to 1920x1080 on the selfpath. this is http://ix.io/2zoR
>>
>> the pixelformat for both is 422P.
>> I don't know how meaningful and useful is to test it on the rockchip-pi4 board, I only use it with a serial console.
>> The functionality can probably only be tested on the scarlet.
> 
> Okay, thanks. It looks like there is always plenty of time margin on
> the hardware side and if the interrupt handling is delayed for a short
> time and both are handled by the same handler call, it's also going to
> be handled fine because of rkisp1_capture_isr() being called before
> rkisp1_isp_isr().
> 
> By the way, do we need the MIPI interrupts every frame? Perhaps we
> could enable the RKISP1_CIF_MIPI_ERR_CTRL* interrupts only and then,
> when we get an error, we disable it and enable
> RKISP1_CIF_MIPI_FRAME_END, which would then re-enable
> RKISP1_CIF_MIPI_ERR_CTRL* and disable itself? WDYT?

The driver already do this in a sense, it disables these interrupts on
the first MIPI error and re-enable them on RKISP1_CIF_MIPI_FRAME_END.

Please check:

https://git.linuxtv.org/media_tree.git/tree/drivers/staging/media/rkisp1/rkisp1-isp.c#n1069

For convenience:

void rkisp1_mipi_isr(struct rkisp1_device *rkisp1)
{
	u32 val, status;

	status = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_MIS);
	if (!status)
		return;

	rkisp1_write(rkisp1, status, RKISP1_CIF_MIPI_ICR);

	/*
	 * Disable DPHY errctrl interrupt, because this dphy
	 * erctrl signal is asserted until the next changes
	 * of line state. This time is may be too long and cpu
	 * is hold in this interrupt.
	 */
	if (status & RKISP1_CIF_MIPI_ERR_CTRL(0x0f)) {
		val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_IMSC);
		rkisp1_write(rkisp1, val & ~RKISP1_CIF_MIPI_ERR_CTRL(0x0f),
			     RKISP1_CIF_MIPI_IMSC);
		rkisp1->isp.is_dphy_errctrl_disabled = true;
	}

	/*
	 * Enable DPHY errctrl interrupt again, if mipi have receive
	 * the whole frame without any error.
	 */
	if (status == RKISP1_CIF_MIPI_FRAME_END) {
		/*
		 * Enable DPHY errctrl interrupt again, if mipi have receive
		 * the whole frame without any error.
		 */
		if (rkisp1->isp.is_dphy_errctrl_disabled) {
			val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_IMSC);
			val |= RKISP1_CIF_MIPI_ERR_CTRL(0x0f);
			rkisp1_write(rkisp1, val, RKISP1_CIF_MIPI_IMSC);
			rkisp1->isp.is_dphy_errctrl_disabled = false;
		}
	} else {
		rkisp1->debug.mipi_error++;
	}
}

Regards,
Helen

> 
> Best regards,
> Tomasz
> 
>>
>> Thanks,
>> Dafna
>>
>>
>>
>>>
>>>>              curr_buf->vb.vb2_buf.timestamp = ktime_get_boottime_ns();
>>>>              curr_buf->vb.field = V4L2_FIELD_NONE;
>>>>              vb2_buffer_done(&curr_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
>>>> index 232bee92d0eb..51c92a251ea5 100644
>>>> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
>>>> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
>>>> @@ -131,7 +131,7 @@ struct rkisp1_isp {
>>>>      const struct rkisp1_isp_mbus_info *src_fmt;
>>>>      struct mutex ops_lock; /* serialize the subdevice ops */
>>>>      bool is_dphy_errctrl_disabled;
>>>> -    atomic_t frame_sequence;
>>>> +    __u32 frame_sequence;
>>>
>>> nit: The __ prefixed types are defined for the UAPI to avoid covering userspace
>>> types. For kernel types please just use the plain u32.
>>>
>>> Best regards,
>>> Tomasz
>>>
> 
