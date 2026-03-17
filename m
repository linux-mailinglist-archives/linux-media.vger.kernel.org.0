Return-Path: <linux-media+bounces-56057-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAHTNU1GuWmK+QEAu9opvQ
	(envelope-from <linux-media+bounces-56057-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:17:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B87A2A9AFF
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C854309BEE5
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1FE3B8BD0;
	Tue, 17 Mar 2026 12:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNtbZf1i"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7235346792
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 12:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773749443; cv=none; b=dKBYCYNIAXhg/GEicdXhZOAEpbQZyPVIKFlgv1cElriL6lI4Y9Qi7qduqiJLB5RHyfskTVM5rxI989+tRzAKLwHFc3HRx6xGvj9lklSDOwwQNYAz5SYuPtc2fh7q48zaaNJFfvYqYQ5KTEZAWWhVYGAAgFdYgQ0NMPOcAFWH0ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773749443; c=relaxed/simple;
	bh=TXv70agcoOznl+Ot0k6oTVyKEF83fvi9s7KsKBKs6qw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=iTVAz+WUxUUxj6J7Gwch0WVJoNwMTQl2oQxTlqb8qZpaMqIx3sYfjYqrlUPT0BU5wYscP7OtlGhth+yyEo+35Spdd+p5PGe30Md28eYIfsDcSed7wXXR2+6EYQWgfgebEEUP+B+MhnNjPL67fTi9mNg0QMRU1oLRrI6ZxrTnenk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNtbZf1i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01136C4CEF7;
	Tue, 17 Mar 2026 12:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773749443;
	bh=TXv70agcoOznl+Ot0k6oTVyKEF83fvi9s7KsKBKs6qw=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=aNtbZf1iN8kHmi2uYa1jNpxSOuUWmeIF/RB/LsmL7T4nPD03ytlOtiQL+3MPYsLO3
	 SkM9Qqsu6OhYSvGPlbMMtWrwqagJurl2D1WNs7cmSZ2BiXLWOIGtDHQqrZKflQiQ/I
	 WWcS7V+Uz4WlxaoGGCgDrBNb3KqMI7/9Tj/UBWbbNjC1eh6OyP+TzQ9oDNZZQc5F9b
	 0/KSGUUqwhGdHJ9gt/Q8rpdHqi6lFSPzULTLItCSzj7tkyh80TEacf7AxJQF8iN45x
	 nIT9uXjazVoH+dxqSyB51KbkuJ/27EWmIWzjmMXmTzkh0BNE60eXFliomlkovIchdR
	 SiTzW+Vwg7LRQ==
Message-ID: <8f46eadf-d95c-4461-ae2b-251f0dc908ca@kernel.org>
Date: Tue, 17 Mar 2026 13:10:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4l-utils 2/2] calculate expected length using v4l2-fwht
 info
To: Sarah Gershuni <sarah556726@gmail.com>, linux-media@vger.kernel.org
References: <20260316132223.7337-1-sarah556726@gmail.com>
 <20260316132223.7337-3-sarah556726@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260316132223.7337-3-sarah556726@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-56057-lists,linux-media=lfdr.de,cisco];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5B87A2A9AFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sarah,

On 16/03/2026 14:22, Sarah Gershuni wrote:
> Update get_expected_length_trace to calculate the expected buffer length
> based on v4l2_fwht_find_pixfmt info.
> 
> Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>
> ---
>  utils/v4l2-tracer/trace-helper.cpp | 40 +++++++++++++++++++++---------
>  1 file changed, 28 insertions(+), 12 deletions(-)
> 
> diff --git a/utils/v4l2-tracer/trace-helper.cpp b/utils/v4l2-tracer/trace-helper.cpp
> index 6c296dbf..a59d7761 100644
> --- a/utils/v4l2-tracer/trace-helper.cpp
> +++ b/utils/v4l2-tracer/trace-helper.cpp
> @@ -6,6 +6,11 @@
>  #include "trace.h"
>  #include <math.h>
>  
> +extern "C" {
> +#include "codec-v4l2-fwht.h"
> +}
> +
> +
>  struct trace_context ctx_trace = {};
>  
>  bool is_video_or_media_device(const char *path)
> @@ -233,18 +238,29 @@ void print_buffers_trace(void)
>  
>  unsigned get_expected_length_trace()
>  {
> -	/*
> -	 * TODO: this assumes that the stride is equal to the real width and that the
> -	 * padding follows the end of the chroma plane. It could be improved by
> -	 * following the model in v4l2-ctl-streaming.cpp read_write_padded_frame()
> -	 */
> -	unsigned expected_length = ctx_trace.width * ctx_trace.height;
> -	if (ctx_trace.pixelformat == V4L2_PIX_FMT_NV12 || ctx_trace.pixelformat == V4L2_PIX_FMT_YUV420) {
> -		expected_length *= 3;
> -		expected_length /= 2;
> -		expected_length += (expected_length % 2);
> -	}
> -	return expected_length;
> +	const auto *info = v4l2_fwht_find_pixfmt(ctx_trace.pixelformat);
> +    if (!info)
> +		return 0;
> +
> +    unsigned coded_height = ctx_trace.height;
> +    unsigned expected = 0;
> +
> +    for (unsigned plane_idx = 0; plane_idx < info->planes_num; ++plane_idx) {
> +        unsigned stride = ctx_trace.plane_bytesperline[plane_idx];

Ah, this does not work. All the pixelformats that v4l2_fwht_find_pixfmt knows are
all single buffer formats, i.e. all planes are combined in a single buffer.
So there is also just one bytesperline value.

I know, it's very confusing: the _MPLANE buffer types should really be called
_MBUFFER in hindsight. I.e. each plane has its own buffer as opposed to
concatenating all planes in a single buffer.

I'm not sure what problem you are attempting to fix, but I don't think this does
what you want it to do.

Although patch 1/2 looks fine, I'll drop both patches since it makes no sense
in combination with this patch.

It really only makes sense for multiplanar pixelformats like V4L2_PIX_FMT_NV12M,
V4L2_PIX_FMT_YUV420M, etc., but that's not what this second patch deals with.

Regards,

	Hans

> +        
> +        bool is_chroma = (plane_idx == 1 || plane_idx == 2);
> +        unsigned h_div = is_chroma ? info->height_div : 1;
> +
> +        if (info->planes_num == 3 && plane_idx == 1)
> +            stride /= 2;
> +
> +        if (plane_idx == 1 &&
> +            (info->id == V4L2_PIX_FMT_NV24 || info->id == V4L2_PIX_FMT_NV42))
> +            stride *= 2;
> +
> +        expected += stride * (coded_height / h_div);
> +    }
> +    return expected;
>  }
>  
>  void s_ext_ctrls_setup(struct v4l2_ext_controls *ext_controls)


