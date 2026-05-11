Return-Path: <linux-media+bounces-61149-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFWdLjoHAmpEnQEAu9opvQ
	(envelope-from <linux-media+bounces-61149-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 18:43:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B92A512867
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 18:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3AD7320F340
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 16:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16D4426D33;
	Mon, 11 May 2026 16:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tz6KNEer"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95600311977;
	Mon, 11 May 2026 16:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778515542; cv=none; b=km/FdUNkPoVTO3mEQKEEy/kpSqPuCWDsQtuXrKEKYjfWA+161lL+R8AknGAL7Q/5Qc4yoAXVGkNVMujBESsvSk1akeZEhqYcABw0O3iqNu6yTNZd1+QM7GUtrG/1xr1dFFXmA/OiyqPbIRzvu8G7sMENzVieu+63QKU6Zq83bJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778515542; c=relaxed/simple;
	bh=jxP9amh2tC50kwk8NDUkRIAwZHVes3F7TVXTGePVNSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PoolFxj0thLJv00v3uKjdUzV+axkpr7BRomI9LINlKsSX0r1d7QfkFW5U06OSxB/E107SIlNSdYrPbNJLU9DfknDN8uEmJaZ8DFTq1jACH7KDDgX6LFsaPqq0U+HO0NUNHt6jCn3fpJwUKNufvkb8Qg2qPS4db6NIRP18M3z48g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tz6KNEer; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93E0C2BCB0;
	Mon, 11 May 2026 16:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778515542;
	bh=jxP9amh2tC50kwk8NDUkRIAwZHVes3F7TVXTGePVNSA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tz6KNEerTe4bzhVIoZ+tO4UgYi6Tva0hOTHQVUeA7DkEvabXPdarzlZyV+ywtVczI
	 NZ3PJ/BIiRoJpOhFH+z1/LV/BsAa/fxSFmT6ofIM8SBVyg/HFanI/gex9Hl+yXxebo
	 drKdE0DeWm1XfF7DXhSA6ZM1h8ecQBLUES6CqY78nHLLkE8K3DVXkHjkoaa5La/84/
	 yME4kt2v/FjC3vP09WEOL2PxlEzDWWtZ7kHhhdSx6yXl+rJC1/Otuy5tHX9NGz5Gwq
	 NZQ+jQ9CkWJQ9dAO7HMcC7EqOtH1Gcx+teK1cuE1z7gM7ioAUcu0odcydNMRm9EV/w
	 JUmA3tCtLfnUw==
Message-ID: <8803be15-1e64-4a97-a5b6-cf2b97eea38c@kernel.org>
Date: Mon, 11 May 2026 18:05:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: uvcvideo: Fix dev_sof filtering in hw
 timestamp
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Yunke Cao
 <yunkec@google.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
 <20260323-uvc-hwtimestamp-v1-1-aa42e3865204@chromium.org>
 <20260511154629.GB3043805@killaraus.ideasonboard.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260511154629.GB3043805@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3B92A512867
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61149-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Action: no action

Hi,

On 11-May-26 17:46, Laurent Pinchart wrote:
> Hi Ricardo,
> 
> Thank you for the patch.
> 
> On Mon, Mar 23, 2026 at 01:10:28PM +0000, Ricardo Ribalda wrote:
>> To avoid filling the clock circular buffer with duplicated data we only
>> add it if the new value sof is different than the last added sof.
>>
>> The issue is that we compare the unprocess sof with the processed sof.
>> If there is a sof_offset, or UVC_QUIRK_INVALID_DEVICE_SOF is enabled,
>> the comparison will not work as expected.
>>
>> This patch moves the comparison to the right place.
>>
>> Fixes: 141270bd95d4 ("media: uvcvideo: Refactor clock circular buffer")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>  drivers/media/usb/uvc/uvc_video.c | 19 ++++++++++---------
>>  1 file changed, 10 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
>> index 40c76c051da2..6786ca38fe5e 100644
>> --- a/drivers/media/usb/uvc/uvc_video.c
>> +++ b/drivers/media/usb/uvc/uvc_video.c
>> @@ -583,16 +583,7 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>>  	if (!has_scr)
>>  		return;
>>  
>> -	/*
>> -	 * To limit the amount of data, drop SCRs with an SOF identical to the
>> -	 * previous one. This filtering is also needed to support UVC 1.5, where
>> -	 * all the data packets of the same frame contains the same SOF. In that
>> -	 * case only the first one will match the host_sof.
>> -	 */
>>  	sample.dev_sof = get_unaligned_le16(&data[header_size - 2]);
>> -	if (sample.dev_sof == stream->clock.last_sof)
>> -		return;
>> -
>>  	sample.dev_stc = get_unaligned_le32(&data[header_size - 6]);
>>  
>>  	/*
>> @@ -664,6 +655,16 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>>  	}
>>  
>>  	sample.dev_sof = (sample.dev_sof + stream->clock.sof_offset) & 2047;
>> +
>> +	/*
>> +	 * To limit the amount of data, drop SCRs with an SOF identical to the
>> +	 * previous one. This filtering is also needed to support UVC 1.5, where
>> +	 * all the data packets of the same frame contains the same SOF. In that
>> +	 * case only the first one will match the host_sof.
>> +	 */
>> +	if (sample.dev_sof == stream->clock.last_sof)
>> +		return;
>> +
> 
> We will now uncondtionally call some potentially more expensive
> operations, in particular usb_get_current_frame_number(). Wouldn't it be
> better to store the unprocessed SOF in the sample in addition to the
> processed SOF, to allow early comparison ?

While reviewing 4/4 I just came to the same conclusion,
uvc_video_get_time() is also expensive and unnecessary unless we
actually end up doing the uvc_video_clock_add_sample().

Moving the uvc_video_get_time() to below the check is
a straight-forward change.

Regards,

Hans


> 
>>  	uvc_video_clock_add_sample(&stream->clock, &sample);
>>  	stream->clock.last_sof = sample.dev_sof;
>>  }
>>
> 


