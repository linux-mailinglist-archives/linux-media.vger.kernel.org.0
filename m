Return-Path: <linux-media+bounces-17047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EB6962BF8
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 17:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 643F01F2520C
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 15:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCF31A2C0A;
	Wed, 28 Aug 2024 15:17:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4500719E7E0
	for <linux-media@vger.kernel.org>; Wed, 28 Aug 2024 15:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724858250; cv=none; b=V9X5LhPvXtcc6k2hM4bBWUM0YvhFKsr0kGsSNrvcGcZlAkzhMUrl3fbz4HaaR3wtvQDh4q+5Xx0BSeA6TulhIrekkziY7rI50TZFz+P65K+8u6CD++VU1BZHjzmFQGoSow84A83asiq0ZLKQ49F3rYBuXCca3O5/3J0d0xDHCbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724858250; c=relaxed/simple;
	bh=Yw/ucdf4hSdC3Dj6jNs3EYMFpYqrNIKbbzncoLZgkIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B3GWWpphJBZDPGXQrSsJwk+U1OmgG7uB2Ib1ipytrY2p2gw/v9k5eNUfMrH0PrqNPt0IqyT9S3S5iBeECryu/dUuKquykRnXWf4CiuPz6IsT28q0FPnu1BaUlKi3kidOddCHO5nPIxbbT7DZXSg3m00jSBi/Fx/rU8cOSkDmi+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BBF5C4CEC3;
	Wed, 28 Aug 2024 15:17:28 +0000 (UTC)
Message-ID: <e50c59a6-dd2d-4692-a3b1-e67fce043683@xs4all.nl>
Date: Wed, 28 Aug 2024 17:17:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] media: v4l2-core: add v4l2_debugfs_if_alloc/free()
To: Jani Nikula <jani.nikula@linux.intel.com>, linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <cover.1724855053.git.hverkuil-cisco@xs4all.nl>
 <931a281c72e9c3081eaedc2d76806ebd770a0913.1724855053.git.hverkuil-cisco@xs4all.nl>
 <87jzg0y9bg.fsf@intel.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <87jzg0y9bg.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2024 17:08, Jani Nikula wrote:
> On Wed, 28 Aug 2024, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>> Add new helpers to export received or transmitted HDMI InfoFrames to
>> debugfs.
>>
>> This complements similar code in drm where the transmitted HDMI infoframes
>> are exported to debugfs.
>>
>> The same names have been used as in drm, so this is consistent.
>>
>> The exported infoframes can be parsed with the edid-decode utility.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/media/v4l2-core/v4l2-dv-timings.c | 63 +++++++++++++++++++++++
>>  include/media/v4l2-dv-timings.h           | 48 +++++++++++++++++
>>  2 files changed, 111 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-dv-timings.c b/drivers/media/v4l2-core/v4l2-dv-timings.c
>> index 942d0005c55e..86a8627f4bcc 100644
>> --- a/drivers/media/v4l2-core/v4l2-dv-timings.c
>> +++ b/drivers/media/v4l2-core/v4l2-dv-timings.c
>> @@ -1154,3 +1154,66 @@ int v4l2_phys_addr_validate(u16 phys_addr, u16 *parent, u16 *port)
>>  	return 0;
>>  }
>>  EXPORT_SYMBOL_GPL(v4l2_phys_addr_validate);
>> +
>> +#ifdef CONFIG_DEBUG_FS
>> +
>> +#define DEBUGFS_FOPS(type, flag)					\
>> +static ssize_t								\
>> +infoframe_read_##type(struct file *filp,				\
>> +		      char __user *ubuf, size_t count, loff_t *ppos)	\
>> +{									\
>> +	struct v4l2_debugfs_if *infoframes = filp->private_data;	\
>> +									\
>> +	return infoframes->if_read((flag), infoframes->priv, filp,	\
>> +				   ubuf, count, ppos);			\
>> +}									\
>> +									\
>> +static const struct file_operations infoframe_##type##_fops = {		\
>> +	.owner   = THIS_MODULE,						\
>> +	.open    = simple_open,						\
>> +	.read    = infoframe_read_##type,				\
>> +}
>> +
>> +DEBUGFS_FOPS(avi, V4L2_DEBUGFS_IF_AVI);
>> +DEBUGFS_FOPS(audio, V4L2_DEBUGFS_IF_AUDIO);
>> +DEBUGFS_FOPS(spd, V4L2_DEBUGFS_IF_SPD);
>> +DEBUGFS_FOPS(hdmi, V4L2_DEBUGFS_IF_HDMI);
>> +
>> +struct v4l2_debugfs_if *v4l2_debugfs_if_alloc(struct dentry *root, u32 if_types,
>> +					      void *priv,
>> +					      v4l2_debugfs_if_read_t if_read)
>> +{
>> +	struct v4l2_debugfs_if *infoframes;
>> +
>> +	if (IS_ERR_OR_NULL(root) || !if_types || !if_read)
>> +		return NULL;
>> +
>> +	infoframes = kzalloc(sizeof(*infoframes), GFP_KERNEL);
>> +	if (!infoframes)
>> +		return NULL;
>> +
>> +	infoframes->if_dir = debugfs_create_dir("infoframes", root);
>> +	infoframes->priv = priv;
>> +	infoframes->if_read = if_read;
>> +	if (if_types & V4L2_DEBUGFS_IF_AVI)
>> +		debugfs_create_file("avi", 0400, infoframes->if_dir, infoframes, &infoframe_avi_fops);
>> +	if (if_types & V4L2_DEBUGFS_IF_AUDIO)
>> +		debugfs_create_file("audio", 0400, infoframes->if_dir, infoframes, &infoframe_audio_fops);
>> +	if (if_types & V4L2_DEBUGFS_IF_SPD)
>> +		debugfs_create_file("spd", 0400, infoframes->if_dir, infoframes, &infoframe_spd_fops);
>> +	if (if_types & V4L2_DEBUGFS_IF_HDMI)
>> +		debugfs_create_file("hdmi", 0400, infoframes->if_dir, infoframes, &infoframe_hdmi_fops);
>> +	return infoframes;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_debugfs_if_alloc);
>> +
>> +void v4l2_debugfs_if_free(struct v4l2_debugfs_if *infoframes)
>> +{
>> +	if (infoframes) {
>> +		debugfs_remove_recursive(infoframes->if_dir);
>> +		kfree(infoframes);
>> +	}
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_debugfs_if_free);
>> +
>> +#endif
>> diff --git a/include/media/v4l2-dv-timings.h b/include/media/v4l2-dv-timings.h
>> index 8fa963326bf6..13830411bd6c 100644
>> --- a/include/media/v4l2-dv-timings.h
>> +++ b/include/media/v4l2-dv-timings.h
>> @@ -8,6 +8,7 @@
>>  #ifndef __V4L2_DV_TIMINGS_H
>>  #define __V4L2_DV_TIMINGS_H
>>  
>> +#include <linux/debugfs.h>
> 
> Please don't include headers from headers if you can get by with forward
> declarations.

Done.

> 
> I recently discovered a lot of drm depending on getting seq_file.h and
> debugfs.h via media/cec.h...

Patches are welcome!

Regards,

	Hans

> 
> BR,
> Jani.
> 
> 
>>  #include <linux/videodev2.h>
>>  
>>  /**
>> @@ -251,4 +252,51 @@ void v4l2_set_edid_phys_addr(u8 *edid, unsigned int size, u16 phys_addr);
>>  u16 v4l2_phys_addr_for_input(u16 phys_addr, u8 input);
>>  int v4l2_phys_addr_validate(u16 phys_addr, u16 *parent, u16 *port);
>>  
>> +/* Add support for exporting InfoFrames to debugfs */
>> +
>> +/*
>> + * HDMI InfoFrames start with a 3 byte header, then a checksum,
>> + * followed by the actual IF payload.
>> + *
>> + * The payload length is limited to 30 bytes according to the HDMI spec,
>> + * but since the length is encoded in 5 bits, it can be 31 bytes theoretically.
>> + * So set the max length as 31 + 3 (header) + 1 (checksum) = 35.
>> + */
>> +#define V4L2_DEBUGFS_IF_MAX_LEN (35)
>> +
>> +#define V4L2_DEBUGFS_IF_AVI	BIT(0)
>> +#define V4L2_DEBUGFS_IF_AUDIO	BIT(1)
>> +#define V4L2_DEBUGFS_IF_SPD	BIT(2)
>> +#define V4L2_DEBUGFS_IF_HDMI	BIT(3)
>> +
>> +typedef ssize_t (*v4l2_debugfs_if_read_t)(u32 type, void *priv,
>> +					  struct file *filp, char __user *ubuf,
>> +					  size_t count, loff_t *ppos);
>> +
>> +struct v4l2_debugfs_if {
>> +	struct dentry *if_dir;
>> +	void *priv;
>> +
>> +	v4l2_debugfs_if_read_t if_read;
>> +};
>> +
>> +#ifdef CONFIG_DEBUG_FS
>> +struct v4l2_debugfs_if *v4l2_debugfs_if_alloc(struct dentry *root, u32 if_types,
>> +					      void *priv,
>> +					      v4l2_debugfs_if_read_t if_read);
>> +void v4l2_debugfs_if_free(struct v4l2_debugfs_if *infoframes);
>> +#else
>> +static inline
>> +struct v4l2_debugfs_if *v4l2_debugfs_if_alloc(struct dentry *root, u32 if_types,
>> +					      void *priv,
>> +					      v4l2_debugfs_if_read_t if_read)
>> +{
>> +	return NULL;
>> +}
>> +
>> +static inline void v4l2_debugfs_if_free(struct v4l2_debugfs_if *infoframes)
>> +{
>> +}
>> +#endif
>> +
>>  #endif
> 


