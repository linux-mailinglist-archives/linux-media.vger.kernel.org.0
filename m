Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6F1CCE547
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 16:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727711AbfJGObr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 10:31:47 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:50845 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727324AbfJGObr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Oct 2019 10:31:47 -0400
Received: from [IPv6:2001:983:e9a7:1:3d61:cdd2:8085:cc8] ([IPv6:2001:983:e9a7:1:3d61:cdd2:8085:cc8])
        by smtp-cloud8.xs4all.net with ESMTPA
        id HU36iQ6Ndop0AHU37iInUz; Mon, 07 Oct 2019 16:31:45 +0200
Subject: Re: [PATCH v9] vivid: Add metadata capture support
To:     Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <0e9fb478-18b7-22a4-2eaf-c19ae57678e0@xs4all.nl>
 <20191004102457.27611-1-bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <96d53360-5520-f253-db8e-995bf5920746@xs4all.nl>
Date:   Mon, 7 Oct 2019 16:31:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191004102457.27611-1-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfANsqTalFBuhwe1HuzdV8Zxd3fi92IRYYV5P2XceoTF3eL7aU7IuqQLCMsS6OMrd/lkvkiyb5UlqU3fsDNcpEGVRGjRYAN1CUqmAjNDzzpQkeyogo1ln
 PAcLrAAGHoJ3MLGIbuXVHqk5cEF7dE82Qfthl77Aq053G6/C87yZSYrAzKA7TRtqvn8yK3Udnpy/fdIcXHxNlvnPsTeUZu8qjScRgkMFKaQwN/huGkwBTTfm
 sE0p4IvHk0HFxbwAIr0PlIhZLUcfpokJT2cdfMEG7xukZYMcP59lCJVaG5vK7MFwHQsb8oJgevA1U3A0I59p+RsjMwT18V4ZmqJnOP/5+ZumArDlQ/fAjjw9
 D1K1IJJc319VpPBjipYtTG0hAEN5Yg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/4/19 12:24 PM, Vandana BN wrote:
> +void vivid_meta_cap_fillbuff(struct vivid_dev *dev,
> +			     struct vivid_buffer *buf, u32 soe)

soe should have been a u64 since f_time is a u64.

> +{
> +	struct vivid_uvc_meta_buf *meta = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
> +	int buf_off = 0;
> +
> +	buf->vb.sequence = dev->meta_cap_seq_count;
> +	if (dev->field_cap == V4L2_FIELD_ALTERNATE)
> +		buf->vb.sequence /= 2;
> +	memset(meta, 1, vb2_plane_size(&buf->vb.vb2_buf, 0));
> +
> +	meta->ns = ktime_get_ns();
> +	meta->sof = buf->vb.sequence * 30;
> +	meta->length = sizeof(*meta) - offsetof(struct vivid_uvc_meta_buf, length);
> +	meta->flags = UVC_STREAM_EOH | UVC_STREAM_EOF;
> +
> +	if ((buf->vb.sequence % 2) == 0)
> +		meta->flags |= UVC_STREAM_FID;
> +
> +	dprintk(dev, 2, "%s ns:%llu sof:%4d len:%u flags: 0x%02x",
> +		__func__, meta->ns, meta->sof, meta->length, meta->flags);
> +	if (dev->meta_pts) {
> +		meta->flags |= UVC_STREAM_PTS;
> +		meta->buf[0] = soe / VIVID_META_CLOCK_UNIT;

Use div_u64() here.

> +		buf_off = 4;
> +		dprintk(dev, 2, " pts: %u\n", *(__u32 *)(meta->buf));
> +	}
> +
> +	if (dev->meta_scr) {
> +		meta->flags |= UVC_STREAM_SCR;
> +		meta->buf[buf_off] = (soe + dev->cap_frame_eof_offset)
> +					/ VIVID_META_CLOCK_UNIT;

Same here (and this is the cause of the kbuild error).

> +
> +		meta->buf[buf_off + 4] = (buf->vb.sequence * 30) % 1000;
> +		dprintk(dev, 2, " stc: %u, sof counter: %u\n",
> +			*(__u32 *)(meta->buf + buf_off),
> +			*(__u16 *)(meta->buf + buf_off + 4));
> +	}
> +	dprintk(dev, 2, "\n");
> +}

Regards,

	Hans
