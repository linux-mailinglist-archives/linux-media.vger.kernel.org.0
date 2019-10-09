Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAC11D0E21
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 14:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730384AbfJIMBg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 08:01:36 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:44221 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730344AbfJIMBg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Oct 2019 08:01:36 -0400
Received: from [IPv6:2001:983:e9a7:1:2801:e038:f2c3:e060] ([IPv6:2001:983:e9a7:1:2801:e038:f2c3:e060])
        by smtp-cloud7.xs4all.net with ESMTPA
        id IAeqigHJmjZ8vIAeriHhcm; Wed, 09 Oct 2019 14:01:34 +0200
Subject: Re: [PATCH 0/2] media: meson: vdec: Add compliant H264 support
To:     Maxime Jourdan <mjourdan@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
References: <20191007145909.29979-1-mjourdan@baylibre.com>
 <8563127e-fe2c-a633-556b-8a883cebb171@xs4all.nl>
 <977c48e8-8275-c96a-688b-ccfbb873eb79@baylibre.com>
 <65a88bfc-d82b-1487-7983-507149b11673@xs4all.nl>
 <acef4f1e-0b59-30f5-f31f-9fc22f393072@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <fb6edb95-069e-abeb-416e-2327da0a87ab@xs4all.nl>
Date:   Wed, 9 Oct 2019 14:01:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <acef4f1e-0b59-30f5-f31f-9fc22f393072@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGi47KnphFpmq7kX9aL/0EwGBcfglgjk3LWvAVsJcUqelmL++LiEgeR3wCxbBepBVMIsdzenDFShNHJrGbronNneIgaQKJz27vasy2nrMaDJ7tMEUcKm
 ilCBEeALSDyC0/8UPWcloPLszMO5zWPGMYXcqY/jkqjq0lfmvTgmlVtHZsvsA1S3l3soMtC7oP5ypYwtUkRXHv2fuQzTkiru6Lrb6DbehdCfovyfBeKO88DQ
 kjZ1HpqBznbTxE5rfE/8ToyJ6ZtvPlC11EpT9k6LB8vmZCKd5yLHNSWe3oMrQMW/qVmLrij/44aCRvAZqVY0Zg2C5pQ0medl3FwbympC6K9MOplJdbF5nyXZ
 0kI0Rdi/Fx3M1liSOHSu+oo6YzP68cpR4HsEs967v+Nd4QodZ3J22CnGXEp2DZN8DcdsLxCmvcqZ/nZPDQ3kuNhy7Bdjfz14ocqjhmicnztiyTsGRAK8vqR3
 RwTDOO72U0OBv3xzyZUbl5aaXmT9+DIpLFlin7GNjNRCW/httL2koQnP36qBrWZeIJxL740twpAkHvX+tTsKikFI1bxzY+QdQrMyLlXoaNMzP0QBMeiTvA+/
 +kP8UbzM89CURzCLpB+lIBv9/JYEw7E5fbXwHjvWux6al1tiESrix0qx4989y7R2TYJ4IbYBu2DlkWDo32qgZfw8
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/8/19 3:40 PM, Maxime Jourdan wrote:
> On 07/10/2019 18:39, Hans Verkuil wrote:
>> On 10/7/19 6:24 PM, Maxime Jourdan wrote:
>>> On 07/10/2019 17:12, Hans Verkuil wrote:
>>>> On 10/7/19 4:59 PM, Maxime Jourdan wrote:
>>>>> Hello,
>>>>>
>>>>> This patch series aims to bring H.264 support as well as compliance update
>>>>> to the amlogic stateful video decoder driver.
>>>>>
>>>>> There is 1 issue that remains currently:
>>>>>
>>>>>    - The following codepath had to be commented out from v4l2-compliance as
>>>>> it led to stalling:
>>>>>
>>>>> if (node->codec_mask & STATEFUL_DECODER) {
>>>>>      struct v4l2_decoder_cmd cmd;
>>>>>      buffer buf_cap(m2m_q);
>>>>>
>>>>>      memset(&cmd, 0, sizeof(cmd));
>>>>>      cmd.cmd = V4L2_DEC_CMD_STOP;
>>>>>
>>>>>      /* No buffers are queued, call STREAMON, then STOP */
>>>>>      fail_on_test(node->streamon(q.g_type()));
>>>>>      fail_on_test(node->streamon(m2m_q.g_type()));
>>>>>      fail_on_test(doioctl(node, VIDIOC_DECODER_CMD, &cmd));
>>>>>
>>>>>      fail_on_test(buf_cap.querybuf(node, 0));
>>>>>      fail_on_test(buf_cap.qbuf(node));
>>>>>      fail_on_test(buf_cap.dqbuf(node));
>>>>>      fail_on_test(!(buf_cap.g_flags() & V4L2_BUF_FLAG_LAST));
>>>>>      for (unsigned p = 0; p < buf_cap.g_num_planes(); p++)
>>>>>          fail_on_test(buf_cap.g_bytesused(p));
>>>>>      fail_on_test(node->streamoff(q.g_type()));
>>>>>      fail_on_test(node->streamoff(m2m_q.g_type()));
>>>>>
>>>>>      /* Call STREAMON, queue one CAPTURE buffer, then STOP */
>>>>>      fail_on_test(node->streamon(q.g_type()));
>>>>>      fail_on_test(node->streamon(m2m_q.g_type()));
>>>>>      fail_on_test(buf_cap.querybuf(node, 0));
>>>>>      fail_on_test(buf_cap.qbuf(node));
>>>>>      fail_on_test(doioctl(node, VIDIOC_DECODER_CMD, &cmd));
>>>>>
>>>>>      fail_on_test(buf_cap.dqbuf(node));
>>>>>      fail_on_test(!(buf_cap.g_flags() & V4L2_BUF_FLAG_LAST));
>>>>>      for (unsigned p = 0; p < buf_cap.g_num_planes(); p++)
>>>>>          fail_on_test(buf_cap.g_bytesused(p));
>>>>>      fail_on_test(node->streamoff(q.g_type()));
>>>>>      fail_on_test(node->streamoff(m2m_q.g_type()));
>>>>> }
>>>>>
>>>>> The reason for this is because the driver has a limitation where all
>>>>> capturebuffers must be queued to the driver before STREAMON is effective.
>>>>> The firmware needs to know in advance what all the buffers are before
>>>>> starting to decode.
>>>>> This limitation is enforced via q->min_buffers_needed.
>>>>> As such, in this compliance codepath, STREAMON is never actually called
>>>>> driver-side and there is a stall on fail_on_test(buf_cap.dqbuf(node));
>>>>
>>>> That's interesting. I will have to look more closely at this.

This requires a helper function in videobuf2-v4l2.c.

In vdec_decoder_cmd you would need code like this:

	if (!vb2_start_streaming_called(&capture_queue)) {
		vb2_dequeue_empty_last_buf(&capture_queue);
		return 0;
	}

The vb2_dequeue_empty_last_buf (function name can probably be improved upon!)
does nothing if no capture buffers were queued, otherwise it takes the first
buffer, sets the LAST flag and sets bytesused to 0 and marks it as DONE.

The driver cannot do this directly, since the buffers were never queued to the
driver and are owned by vb2.

This is something that needs to be done for any codec driver that sets
min_buffers_needed to a value > 1.

The vb2 function would look something like this:

void vb2_dqbuf_empty_last_buf(struct vb2_queue *q)
{
        struct vb2_buffer *vb;
        struct vb2_v4l2_buffer *vbuf;
        unsigned int i;

        if (WARN_ON(q->is_output))
                return;
        if (list_empty(&q->queued_list))
                return;
        vb = list_first_entry(&q->queued_list, struct vb2_buffer, queued_entry);
        list_del(&vb->queued_entry);
        for (i = 0; i < vb->num_planes; i++)
                vb2_set_plane_payload(vb, i, 0)
        vbuf = to_vb2_v4l2_buffer(vb);
        vbuf->flags |= V4L2_BUF_FLAG_LAST;
        vb2_buffer_done(vb, VB2_BUF_STATE_DONE);
}
EXPORT_SYMBOL_GPL(vb2_dqbuf_empty_last_buf);

Neither compiled, nor tested, and I think this should be in v4l2-mem2mem.c instead of
in videobuf2-v4l2.c since this is very m2m specific.

So see this as a suggestion :-)

Anyway, the key take-away from this is that userspace does not know if your driver
behaves the way it does, so STOP should still produce a sane expected result.

Which in this is just a single empty capture buffer marked LAST.

Regards,

	Hans
