Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4A99108B6E
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 11:13:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfKYKNo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Nov 2019 05:13:44 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:53079 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727360AbfKYKNo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Nov 2019 05:13:44 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ZBNCiRAj7ecrtZBNFiIIGJ; Mon, 25 Nov 2019 11:13:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574676821; bh=JBWAcEvW+xe7/Y/iGtylnBIGnEL0GswGzUFCxmkBAsM=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=t/3dkF5vJV+HsIvyDtgcq4xKVEKy61CmeTyi5+M9/EYWclxYdct5Q2LdExX0gj0xz
         zTzfIqdIBphPAF3D6y1UzEiWInL0qsGKtynGmtSif04+H/1JiWL62sdhPhRY6P1HCm
         hJj8vIkThkRTrj1TNZpwlKb53LvyB9PQoYa7pgv7KmQNMkOR07F4PkndN5CUROWBFq
         gL95wKOtiUSxqklX0faGwZmKaJatpTXZ1J4KtgsWS0wbtf18EUnq43yUXQx4wB6wWL
         QK6jWEjJpir1ZOwgq+mMpcpOpSruUT/48o7jTKy5Lm0FSC8CjrilnRLgkrH3DSyl/u
         IbpOwDSa89M5A==
Subject: Re: [PATCH v8] vivid: Add touch support
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org
References: <665e3259-e7c8-ffcd-1873-be36a12b67a3@xs4all.nl>
 <20191125042336.6205-1-bnvandana@gmail.com>
 <c2f25d01-93cc-3678-bae5-58fb13001d8d@xs4all.nl>
Message-ID: <10ba6cbf-f21e-5009-922c-d7578c626079@xs4all.nl>
Date:   Mon, 25 Nov 2019 11:13:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c2f25d01-93cc-3678-bae5-58fb13001d8d@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIz1hY+XtB5RSlTmTc5KE3KtYLAPqFgvHR+IOI/9XNhR/41BfUCs9hGX1UNEd6htfo1NH7xZNiFct1GxZ4O3DrO6MFBq/Lm1nYmmm+2YAV1cYWGjIVgP
 xKINZdcEDHnhw92EKIYlfdayvbW2fcI4qbiEc5zocUldkXCt32dSFA/4KbsRsrGmf078qc3gBqglkSbG6kys4A84xau9DTORpzQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/25/19 11:02 AM, Hans Verkuil wrote:
> Hi Vandana,
> 
> This looks really good. I have a few very small comments (I'd have changed it
> myself, but we're in the code freeze period so there is time for a v9):
> 
> On 11/25/19 5:23 AM, Vandana BN wrote:
>> Support to emulate touch devices in vivid driver.
>> It generates touch patterns simulating single tap, double tap, triple
>> tap, move from left to right, zoom in, zoom out, palm press simulating
>> large area being pressed on screen, and simulating 16 different
>> simultaneous touch points.The values generated are based on
>> behavior of the rmi_f54 driver.
>>
>> Signed-off-by: Vandana BN <bnvandana@gmail.com>
>> ---
>>  drivers/media/platform/vivid/Makefile         |   3 +-
>>  drivers/media/platform/vivid/vivid-core.c     | 164 ++++++++-
>>  drivers/media/platform/vivid/vivid-core.h     |  20 ++
>>  drivers/media/platform/vivid/vivid-ctrls.c    |  11 +
>>  .../platform/vivid/vivid-kthread-touch.c      | 181 ++++++++++
>>  .../platform/vivid/vivid-kthread-touch.h      |  13 +
>>  .../media/platform/vivid/vivid-touch-cap.c    | 320 ++++++++++++++++++
>>  .../media/platform/vivid/vivid-touch-cap.h    |  38 +++
>>  8 files changed, 737 insertions(+), 13 deletions(-)
>>  create mode 100644 drivers/media/platform/vivid/vivid-kthread-touch.c
>>  create mode 100644 drivers/media/platform/vivid/vivid-kthread-touch.h
>>  create mode 100644 drivers/media/platform/vivid/vivid-touch-cap.c
>>  create mode 100644 drivers/media/platform/vivid/vivid-touch-cap.h
>>
> 
> <snip>
> 
>> +void vivid_fillbuff_tch(struct vivid_dev *dev, struct vivid_buffer *buf)
>> +{
>> +	struct v4l2_pix_format *f = &dev->tch_format;
>> +	int size = f->width * f->height;
>> +	int x, y, xstart, ystart, offset_x, offset_y;
>> +	unsigned int test_pattern, test_pat_idx, rand;
>> +
>> +	__s16 *tch_buf = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
>> +
>> +	buf->vb.sequence = dev->touch_cap_seq_count;
>> +	test_pattern = (buf->vb.sequence / TCH_SEQ_COUNT) % TEST_CASE_MAX;
>> +	test_pat_idx = buf->vb.sequence % TCH_SEQ_COUNT;
>> +
>> +	vivid_fill_buff_noise(tch_buf, size);
>> +
>> +	if (test_pat_idx >= TCH_PATTERN_COUNT)
>> +		return;
>> +
>> +	if (test_pat_idx == 0)
>> +		dev->tch_pat_random = get_random_int();
>> +	rand = dev->tch_pat_random;
>> +
>> +	switch (test_pattern) {
>> +	case SINGLE_TAP:
>> +		if (test_pat_idx == 5)
> 
> Let's change 5 to TCH_PATTERN_COUNT / 2
> 
>> +			vivid_tch_buf_set(f, tch_buf, rand % size);
>> +		break;
>> +	case DOUBLE_TAP:
>> +		if (test_pat_idx == 3 || test_pat_idx == 6)
> 
> And 3 and 6 to:
> 
> 	TCH_PATTERN_COUNT / 3 and 2 * TCH_PATTERN_COUNT / 3
> 
>> +			vivid_tch_buf_set(f, tch_buf, rand % size);
>> +		break;
>> +	case TRIPLE_TAP:
>> +		if (test_pat_idx == 3 || test_pat_idx == 6 || test_pat_idx == 9)
> 
> TCH_PATTERN_COUNT / 4, 2 * TCH_PATTERN_COUNT / 4, 3 * TCH_PATTERN_COUNT / 4
> 
>> +			vivid_tch_buf_set(f, tch_buf, rand % size);
>> +		break;
>> +	case MOVE_LEFT_TO_RIGHT:
>> +		vivid_tch_buf_set(f, tch_buf,
>> +				  (rand % f->height) * f->width +
>> +				  test_pat_idx * (f->width / 10));
> 
> 10 -> TCH_PATTERN_COUNT
> 
> Regards,
> 
> 	Hans
> 
>> +		break;
>> +	case ZOOM_IN:
>> +		x = f->width / 2;
>> +		y = f->height / 2;
>> +		offset_x = ((TCH_PATTERN_COUNT - 1 - test_pat_idx) * x) /
>> +				TCH_PATTERN_COUNT;
>> +		offset_y = ((TCH_PATTERN_COUNT - 1 - test_pat_idx) * y) /
>> +				TCH_PATTERN_COUNT;
>> +		vivid_tch_buf_set(f, tch_buf,
>> +				  (x - offset_x) + f->width * (y - offset_y));
>> +		vivid_tch_buf_set(f, tch_buf,
>> +				  (x + offset_x) + f->width * (y + offset_y));
>> +		break;
>> +	case ZOOM_OUT:
>> +		x = f->width / 2;
>> +		y = f->height / 2;
>> +		offset_x = (test_pat_idx * x) / TCH_PATTERN_COUNT;
>> +		offset_y = (test_pat_idx * y) / TCH_PATTERN_COUNT;
>> +		vivid_tch_buf_set(f, tch_buf,
>> +				  (x - offset_x) + f->width * (y - offset_y));
>> +		vivid_tch_buf_set(f, tch_buf,
>> +				  (x + offset_x) + f->width * (y + offset_y));
>> +		break;
>> +	case PALM_PRESS:
>> +		for (x = 0; x < f->width; x++)
>> +			for (y = f->height / 2; y < f->height; y++)
>> +				vivid_tch_buf_set(f, tch_buf, x + f->width * y);

Ah, this is wrong. For this pattern you can't use vivid_tch_buf_set(). Instead
each pixel should be set explicitly to VIVID_MIN_PRESSURE + get_random_pressure();

The vivid_tch_buf_set overwrites neighboring pixels, so that doesn't work here.

Regards,

	Hans

>> +		break;
>> +	case MULTIPLE_PRESS:
>> +		/* 16 pressure points */
>> +		for (y = 0; y < 4; y++) {
>> +			for (x = 0; x < 4; x++) {
>> +				ystart = (y * f->height) / 4 + f->height / 8;
>> +				xstart = (x * f->width) / 4 + f->width / 8;
>> +				vivid_tch_buf_set(f, tch_buf,
>> +						  ystart * f->width + xstart);
>> +			}
>> +		}
>> +		break;
>> +	}
>> +#ifdef __BIG_ENDIAN__
>> +	for (x = 0; x < size; x++)
>> +		tch_buf[x] = (__force s16)__cpu_to_le16((u16)tch_buf[x]);
>> +#endif
>> +}
>> diff --git a/drivers/media/platform/vivid/vivid-touch-cap.h b/drivers/media/platform/vivid/vivid-touch-cap.h
>> new file mode 100644
>> index 000000000000..761050b652eb
>> --- /dev/null
>> +++ b/drivers/media/platform/vivid/vivid-touch-cap.h
>> @@ -0,0 +1,38 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * vivid-touch-cap.h - touch support functions.
>> + */
>> +#ifndef _VIVID_TOUCH_CAP_H_
>> +#define _VIVID_TOUCH_CAP_H_
>> +
>> +#define VIVID_TCH_HEIGHT	12
>> +#define VIVID_TCH_WIDTH		21
>> +#define VIVID_MIN_PRESSURE	180
>> +#define VIVID_PRESSURE_LIMIT	40
>> +#define TCH_SEQ_COUNT		16
>> +#define TCH_PATTERN_COUNT	12
>> +
>> +enum vivid_tch_test {
>> +	SINGLE_TAP,
>> +	DOUBLE_TAP,
>> +	TRIPLE_TAP,
>> +	MOVE_LEFT_TO_RIGHT,
>> +	ZOOM_IN,
>> +	ZOOM_OUT,
>> +	PALM_PRESS,
>> +	MULTIPLE_PRESS,
>> +	TEST_CASE_MAX
>> +};
>> +
>> +extern const struct vb2_ops vivid_touch_cap_qops;
>> +
>> +int vivid_enum_fmt_tch(struct file *file, void  *priv, struct v4l2_fmtdesc *f);
>> +int vivid_g_fmt_tch(struct file *file, void *priv, struct v4l2_format *f);
>> +int vivid_enum_input_tch(struct file *file, void *priv, struct v4l2_input *inp);
>> +int vivid_g_input_tch(struct file *file, void *priv, unsigned int *i);
>> +int vivid_s_input_tch(struct file *file, void *priv, unsigned int i);
>> +void vivid_fillbuff_tch(struct vivid_dev *dev, struct vivid_buffer *buf);
>> +int vivid_set_touch(struct vivid_dev *dev, unsigned int i);
>> +int vivid_g_parm_tch(struct file *file, void *priv,
>> +		     struct v4l2_streamparm *parm);
>> +#endif
>>
> 

