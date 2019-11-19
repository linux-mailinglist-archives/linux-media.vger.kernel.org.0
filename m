Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47CBA101F0B
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 10:02:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbfKSJCc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 04:02:32 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:46131 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725306AbfKSJCc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 04:02:32 -0500
Received: from [IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7]
 ([IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7])
        by smtp-cloud7.xs4all.net with ESMTPA
        id WzP2iBwIkcs92WzP3iy98U; Tue, 19 Nov 2019 10:02:29 +0100
Subject: Re: [PATCH v7] vivid: Add touch support
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org
References: <9719685b-1b71-17e0-f43a-efbb53592e27@xs4all.nl>
 <20191118155356.29876-1-bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <00480290-054d-3b13-2ec5-6a17e8cf0603@xs4all.nl>
Date:   Tue, 19 Nov 2019 10:02:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191118155356.29876-1-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP5WsifEptz0eUWUK6L9FpcqPsUP1X86BOQXYbw0TfnsT5drHmAWHLT/61yhTZMCXfXgcopjGUSLBS/y7D4n0VqPwySI9wd/ieVLgsg+8TaNVNHcALWu
 Vk2D30UMg3Y0kqYPBpnsyT0uRaPMdktKuKhXr+vKxLbXEgcvICcyWE4VkfQIkdeWllUEo97KfpD6qKc7N+G+mtFFZu7lhyfWSXP39rxuDKeN50uDhP3GsrFs
 9s1L/Hk8S1IBvVpLYupatEiK3q3jB7jKIx4YDZpYLFJlfvGeoJw7eSDzzunHThA1kbHJ6DfSGu5B89O5e/f2/Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vandana,

On 11/18/19 4:53 PM, Vandana BN wrote:
> Support to emulate touch devices in vivid driver.
> It generates touch patterns simulating, single tap, double tap, triple

No , after 'simulating'.

> tap, move from left to right, zoom in, zoom out, palm press simulating
> large area being pressed on screen, and an invalid pattern of

Drop the 'invalid': it is not invalid, just very, very unusual.

> simulating 16 different simultaneous touch points.
> All of these patterns are based on behavior of rmi_f54 driver.

The patterns aren't from that driver, but the generated values are.

> 
> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> ---
> Changes since V6:
> 	simplified touch pattern generation.
> ---
>  drivers/media/platform/vivid/Makefile         |   3 +-
>  drivers/media/platform/vivid/vivid-core.c     | 164 +++++++++-
>  drivers/media/platform/vivid/vivid-core.h     |  20 ++
>  drivers/media/platform/vivid/vivid-ctrls.c    |  11 +
>  .../platform/vivid/vivid-kthread-touch.c      | 181 +++++++++++
>  .../platform/vivid/vivid-kthread-touch.h      |  13 +
>  .../media/platform/vivid/vivid-touch-cap.c    | 286 ++++++++++++++++++
>  .../media/platform/vivid/vivid-touch-cap.h    |  35 +++
>  8 files changed, 700 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/media/platform/vivid/vivid-kthread-touch.c
>  create mode 100644 drivers/media/platform/vivid/vivid-kthread-touch.h
>  create mode 100644 drivers/media/platform/vivid/vivid-touch-cap.c
>  create mode 100644 drivers/media/platform/vivid/vivid-touch-cap.h

<snip>

> +void vivid_fillbuff_tch(struct vivid_dev *dev, struct vivid_buffer *buf)
> +{
> +	struct v4l2_pix_format *f = &dev->tch_format;
> +	int size = f->width * f->height;
> +	int index = 0, x, y, xstart, ystart;
> +	unsigned int test_pattern, test_pat_idx, rand;
> +
> +	__s16 *tch_buf = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
> +
> +	buf->vb.sequence = dev->touch_cap_seq_count;
> +	test_pattern = (buf->vb.sequence / 15) % TEST_CASE_MAX;
> +	test_pat_idx = buf->vb.sequence % 15;
> +
> +	vivid_fill_buff_noise(tch_buf, size);
> +
> +	if (test_pat_idx >= 10)

The values 10 and 15 should be defines. That makes it easy to change later.

I think it would be better to change 15 to 16 and 10 to 12: 16 helps because
in the corner case where the sequence counter will wrap around you will get
a smooth transition. And 12 makes each sequence just a little bit longer,
which makes it easier to see.

> +		return;
> +
> +	if (test_pat_idx == 0)
> +		dev->tch_pat_random = get_random_int();
> +	rand = dev->tch_pat_random;
> +
> +	switch (test_pattern) {
> +	case SINGLE_TAP:
> +		if (test_pat_idx == 5)
> +			vivid_tch_buf_set(tch_buf, rand % size);
> +		break;
> +	case DOUBLE_TAP:
> +		if (test_pat_idx == 3 || test_pat_idx == 6)
> +			vivid_tch_buf_set(tch_buf, rand % size);
> +		break;
> +	case TRIPLE_TAP:
> +		if (test_pat_idx == 3 || test_pat_idx == 6 || test_pat_idx == 9)
> +			vivid_tch_buf_set(tch_buf, rand % size);
> +		break;
> +	case MOVE_LEFT_TO_RIGHT:
> +		vivid_tch_buf_set(tch_buf,
> +				  (rand % f->height) * f->width + test_pat_idx * (f->width / 10));

Line too long (same in similar cases below). It's easiest to break it off after the + like this:

		vivid_tch_buf_set(tch_buf,
				  (rand % f->height) * f->width +
				  test_pat_idx * (f->width / 10));

> +		break;
> +	case ZOOM_IN:
> +		x = f->width / 2;
> +		y = f->height / 2;

You need extra variables for the offset from the center:

		offset_x = ((9 - test_pat_idx) * x) / 10;   (10 should be a define as discussed above)
		offset_y = ((9 - test_pat_idx) * y) / 10;

> +		if (x + test_pat_idx < f->width && y + test_pat_idx < f->height) {

Then this if can be dropped here as well.

> +			vivid_tch_buf_set(tch_buf, (x - test_pat_idx) + f->width * (y - test_pat_idx));
> +			vivid_tch_buf_set(tch_buf, (x + test_pat_idx) + f->width * (y + test_pat_idx));
> +		}
> +		break;
> +	case ZOOM_OUT:
> +		x = f->width / 2;
> +		y = f->height / 2;
> +		index = min(x, y) - test_pat_idx - 1;> +		if (x + index >= f->width / 2 && y + index >= f->height / 2) {

Same here.

> +			vivid_tch_buf_set(tch_buf, (x - index) + f->width * (y - index));
> +			vivid_tch_buf_set(tch_buf, (x + index) + f->width * (y + index));
> +		}
> +		break;
> +	case PALM_PRESS:
> +		xstart = f->width - f->width / 4;

Just set this to 0, so the palm covers the bottom quarter.

> +		ystart = f->height - f->height / 4;
> +		if (test_pat_idx != 5)
> +			break;
> +		for (x = xstart; x < f->width; x++)
> +			for (y = ystart; y < f->height; y++)
> +				vivid_tch_buf_set(tch_buf, x + f->width * y);
> +		break;
> +	case MULTIPLE_PRESS:
> +		/* 16 pressure points */
> +		if (test_pat_idx != 5)
> +			break;
> +		for (y = 0; y < 4; y++) {
> +			for (x = 0; x < 4; x++) {
> +				ystart = (y * f->height) / 4 + f->height / 8;
> +				xstart = (x * f->width) / 4 + f->width / 8;
> +				vivid_tch_buf_set(tch_buf, ystart * f->width + xstart);
> +			}
> +		}
> +		break;
> +	}
> +}

Regards,

	Hans

> diff --git a/drivers/media/platform/vivid/vivid-touch-cap.h b/drivers/media/platform/vivid/vivid-touch-cap.h
> new file mode 100644
> index 000000000000..6e83ca919f07
> --- /dev/null
> +++ b/drivers/media/platform/vivid/vivid-touch-cap.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * vivid-touch-cap.h - touch support functions.
> + */
> +#ifndef _VIVID_TOUCH_CAP_H_
> +#define _VIVID_TOUCH_CAP_H_
> +
> +#define VIVID_TCH_HEIGHT	12
> +#define VIVID_TCH_WIDTH		21
> +#define VIVID_MIN_PRESSURE	180
> +
> +enum vivid_tch_test {
> +	SINGLE_TAP,
> +	DOUBLE_TAP,
> +	TRIPLE_TAP,
> +	MOVE_LEFT_TO_RIGHT,
> +	ZOOM_IN,
> +	ZOOM_OUT,
> +	PALM_PRESS,
> +	MULTIPLE_PRESS,
> +	TEST_CASE_MAX
> +};
> +
> +extern const struct vb2_ops vivid_touch_cap_qops;
> +
> +int vivid_enum_fmt_tch(struct file *file, void  *priv, struct v4l2_fmtdesc *f);
> +int vivid_g_fmt_tch(struct file *file, void *priv, struct v4l2_format *f);
> +int vivid_enum_input_tch(struct file *file, void *priv, struct v4l2_input *inp);
> +int vivid_g_input_tch(struct file *file, void *priv, unsigned int *i);
> +int vivid_s_input_tch(struct file *file, void *priv, unsigned int i);
> +void vivid_fillbuff_tch(struct vivid_dev *dev, struct vivid_buffer *buf);
> +int vivid_set_touch(struct vivid_dev *dev, unsigned int i);
> +int vivid_g_parm_tch(struct file *file, void *priv,
> +		     struct v4l2_streamparm *parm);
> +#endif
> 

