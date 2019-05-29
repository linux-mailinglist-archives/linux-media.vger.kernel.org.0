Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1032D57F
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 08:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbfE2G2I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 02:28:08 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:50023 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725895AbfE2G2I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 02:28:08 -0400
Received: from [IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae] ([IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Vs4Ch1vXx3qlsVs4DhrWyr; Wed, 29 May 2019 08:28:05 +0200
Subject: Re: [PATCH 1/2] v4l2-mem2mem: add try_en/decoder_cmd ioctl helpers
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Boris Brezillon <boris.brezillon@collabora.com>
References: <20190528083437.103215-1-hverkuil-cisco@xs4all.nl>
 <20190528083437.103215-2-hverkuil-cisco@xs4all.nl>
 <CAAFQd5CaiNfpvopRYAL-r=6JN9Peat0nciqh=K8h53P4_=umXg@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e2bf4374-f247-9259-b66d-dbb40c25dce7@xs4all.nl>
Date:   Wed, 29 May 2019 08:28:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAAFQd5CaiNfpvopRYAL-r=6JN9Peat0nciqh=K8h53P4_=umXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF4ERPYQ+rqD/2/277sQLLhhKrgfqawv6YaaSyLNplx6c5PjeAyvJ2Kjo2vnhJyjzhG5BLrVOG+pTYjxYx/9DElgZjt25FHAH6ESXEPdrZz3OacdUZHA
 llYcxd7WnoHe+z84AdfU5ia3krZt8KOv9EFgfUDkRFENljSVyxWnU+jn9HXstjJZ68nOLyjjZZ65aWfyjJKDQ1OK4h7lAaIih0Xd0vfMaZsvVoJC5rPvalG8
 aznnURh+CPf0cgCE2bRjQDzjKTKzwNtqSYL8laTIhEevEYuNvNOpAOkfJmpLiECfuv8wDVX2EiNRKz4xOrlA60NWSz2G9ZyXzVHMmPhhs5e4HzU0TXKZl1oX
 JeRMbRIivN0xzfpXybKB5YYJmO/o9SnRLwZZaBQIcWk7utXuyATBl+bPglv7v8Bd4HjQmVPaTeVD9cJRnnkNPvR7YoZ2Jw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/29/19 5:11 AM, Tomasz Figa wrote:
> Hi Hans,
> 
> On Tue, May 28, 2019 at 5:34 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> Most if not all codecs will need to implement these ioctls and
>> it is expected to be the same for all codecs. So add this to
>> the core v4l2-mem2mem framework so that this code can easily be
>> reused.
>>
> 
> Thanks for the patch. Please see my comments inline.
> 
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/media/v4l2-core/v4l2-mem2mem.c | 32 ++++++++++++++++++++++++++
>>  include/media/v4l2-mem2mem.h           |  4 ++++
>>  2 files changed, 36 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
>> index 3392833d9541..ba799db5866a 100644
>> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
>> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
>> @@ -1122,6 +1122,38 @@ int v4l2_m2m_ioctl_streamoff(struct file *file, void *priv,
>>  }
>>  EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_streamoff);
>>
>> +int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *fh,
>> +                                  struct v4l2_encoder_cmd *ec)
>> +{
>> +       if (ec->cmd != V4L2_ENC_CMD_STOP && ec->cmd != V4L2_ENC_CMD_START)
>> +               return -EINVAL;
>> +
>> +       if (ec->cmd == V4L2_ENC_CMD_START)
>> +               ec->flags = 0;
> 
> Hmm, why do we allow any value for flags in case of START? Shouldn't
> we also fail if it's non-zero?

The spec says:

"If no flags are defined for this command, drivers and applications must set this field to zero."

Since START has no defined flags, we just set it to 0.

That said, I think this function should just set flags to 0 for both
commands.

The idea is that an application calls TRY_ENCODER_CMD to check if 1) the
command is supported and 2) to see which flags are supported. In this case,
no flags are supported, so just signal that by setting flags to 0.

> 
> Best regards,
> Tomasz
> 
>> +       return ec->flags ? -EINVAL : 0;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_encoder_cmd);
>> +
>> +int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
>> +                                  struct v4l2_decoder_cmd *dc)
>> +{
>> +       if (dc->cmd != V4L2_DEC_CMD_STOP && dc->cmd != V4L2_DEC_CMD_START)
>> +               return -EINVAL;
>> +
>> +       if (dc->flags)
>> +               return -EINVAL;
>> +
>> +       if (dc->cmd == V4L2_DEC_CMD_STOP && dc->stop.pts)
>> +               return -EINVAL;
>> +
>> +       if (dc->cmd == V4L2_DEC_CMD_START) {
>> +               dc->start.speed = 0;
>> +               dc->start.format = V4L2_DEC_START_FMT_NONE;
>> +       }

The same thing is true for TRY_DECODER_CMD, it should just set flags to 0
and also dc->stop.pts.

Just like TRY_FMT it should set values to what the driver is capable of.

I'll prepare a v2 (and update the compliance tests for this).

Regards,

	Hans

>> +       return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_decoder_cmd);
>> +
>>  /*
>>   * v4l2_file_operations helpers. It is assumed here same lock is used
>>   * for the output and the capture buffer queue.
>> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
>> index bb3e63d6bd1a..2e0c989266a7 100644
>> --- a/include/media/v4l2-mem2mem.h
>> +++ b/include/media/v4l2-mem2mem.h
>> @@ -672,6 +672,10 @@ int v4l2_m2m_ioctl_streamon(struct file *file, void *fh,
>>                                 enum v4l2_buf_type type);
>>  int v4l2_m2m_ioctl_streamoff(struct file *file, void *fh,
>>                                 enum v4l2_buf_type type);
>> +int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *fh,
>> +                                  struct v4l2_encoder_cmd *ec);
>> +int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
>> +                                  struct v4l2_decoder_cmd *dc);
>>  int v4l2_m2m_fop_mmap(struct file *file, struct vm_area_struct *vma);
>>  __poll_t v4l2_m2m_fop_poll(struct file *file, poll_table *wait);
>>
>> --
>> 2.20.1
>>

