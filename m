Return-Path: <linux-media+bounces-23724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7CC9F6EFD
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 21:39:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB52F16CAFF
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 20:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341A81FD7B3;
	Wed, 18 Dec 2024 20:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NscpxeZg"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C7B1FD780
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 20:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734554276; cv=none; b=Z6NoK82dqh7wBREui5CNykwbhcb0e+Fjg6NiFeCK98K0l5xTbLsfow1mwwTq7+CuWcpNJircqEXP120h3V9Lgu7ctBgItgKwEnqdAOtAkGjgU8GdB4Nnt+i3jQtYP8Rn1iUaHZnaI5g7zsV5Y17NQHjmQkbGJIjDkF49jSjYHJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734554276; c=relaxed/simple;
	bh=ZUEOriu6wyrRJD3NC0C3Y6OHiftoxt+H/VeInbode/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hTSo/cw/Dw++rQjrde2M7248Vjbur+7jtjBkqP2TtOoiY3P85ALuzFqOTKRPzkEZZNuuM0Jp5v9nRguitJ7Zn2XZLVCnn085iCY4taFBOquxVZ6xUYzrvc4STHpw5ncO9+rpq5TZYadHLCCSBcu7KbAGv3e92m9EzYDoK6mHKHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NscpxeZg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734554273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rmr7kmkRtT46M2vbpdR7BQazv7cPXz83H0MdF+TGqeY=;
	b=NscpxeZgJmS4X1H+5msHIn/BWaW7lX6fkIze4h9rZqhue/NWTP3R8v5yifgWGgF2Dhu0sE
	+40/4mKQy+wrWF7qDIv9gHOtFRFAILPXOcIUBjfLS2wTNQyZfYkKGtZI8Xf7ZD5r91Deow
	Fj+2OY54Cgqs/mWq2Ram6tAbUrfdjnQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-dGLtvaY7M9utLN_2CjXN3Q-1; Wed, 18 Dec 2024 15:37:49 -0500
X-MC-Unique: dGLtvaY7M9utLN_2CjXN3Q-1
X-Mimecast-MFC-AGG-ID: dGLtvaY7M9utLN_2CjXN3Q
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa683e90dd3so3355766b.3
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 12:37:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734554268; x=1735159068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rmr7kmkRtT46M2vbpdR7BQazv7cPXz83H0MdF+TGqeY=;
        b=Z4oa9pWoGGCy5gRQyi3+n43vp0+pO3F1/PefEAlIlQ3kxF5J+sbKhvgofulxLbDUqF
         yIYvCcr9ZXAs9CS5u3fGOrgd+HwSuteeQw+ZiNrkiL7hT7L5mdB9TKxzD/4pkh+QFKPX
         BLH+AlK7JNSjygD28KF02yFFsugQJZC99jklL+wOWt3yJ1H4OIHAAV+Y1xqMOMffno1B
         duc2bapTBcYsMjEmdsAwrZfFxFjFislttldZR1q7S2Z+06SzoZc97smTCH7lBjtfeEVk
         Fq12cnZ8dwB0SJfmF1rf0BjIkvRpZUU+12dV/hOs9kclH9ZQepEphkKM/QyG/ixD3aUG
         5/tQ==
X-Gm-Message-State: AOJu0YySXDKkw5Gsj8zM72q19k/AjGm6bzhCMsnDv0cGzYPti8KSZKjf
	EG5lqvxp0ijP59Vq/q57Zs8vjhdsN7SiGWdfDsktsdQlQbjq3qikOhrOIVIsxwPHTQIAcyg97S7
	11q5ZyKzL8UNIQw/bE9gju/6ZPiHq/zQGdSdBInqUvQT7lp5C09Y74ztkWHzD
X-Gm-Gg: ASbGncvGjer/mJPWl+R0uZzo0iPHakftNZcY95kCOCU52F91PMDUFFXdohWbyPhk7aP
	avtbTkxsfMn2JNC+K5RcJ+B5hzhkhoOQpQLAm8mNuINvvnJAtXI/N3d5ugpaulhtcTXD8MhLywZ
	UH1aHEBTxctWvcjl2mC/juP9Uq5nfr4FE2Q4QgMqt1ZiFLVIX/GYpVxolaVyE1nEkagE6qrw2xo
	NvGfgYNZjF9bFai+u88heqQzjVWsQlwBsbc5SDPuCw/lPuUtNXg8H4yD0LFhLFEctP38y4n0zlp
	+m/RZ/AYEgNAuVPG7CiIYdP9PUZZHqIGczELZjvCwqXm4wTimQGuz0rPjvko1uyHXEDo7r+Ixvh
	nOplcB/Ht+LPGlvpqyv0aatTDSIQISB0=
X-Received: by 2002:a17:906:318d:b0:aab:c6d6:62ac with SMTP id a640c23a62f3a-aabf44db48fmr352682666b.0.1734554268014;
        Wed, 18 Dec 2024 12:37:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKYwjZpsjF9GDtU7u3P+KkVfy+fiFcPTh9BGVYJtyNQW0cJ5S0lHHmnLlP1fk2ARqc3AndjQ==
X-Received: by 2002:a17:906:318d:b0:aab:c6d6:62ac with SMTP id a640c23a62f3a-aabf44db48fmr352681466b.0.1734554267643;
        Wed, 18 Dec 2024 12:37:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab963c5489sm602543066b.186.2024.12.18.12.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 12:37:47 -0800 (PST)
Message-ID: <84b0f212-cd88-46bb-8e6f-b94ec3eccba6@redhat.com>
Date: Wed, 18 Dec 2024 21:37:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] media: uvcvideo: Prepare deprecation of nodrop
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241217-uvc-deprecate-v1-0-57d353f68f8f@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241217-uvc-deprecate-v1-0-57d353f68f8f@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

Thank you for working on this.

On 17-Dec-24 10:06 PM, Ricardo Ribalda wrote:
> We intend to deprecate the nodrop parameter in the future and adopt the
> default behaviour of the other media drivers: drop invalid packages.

Actually the default behaviour of other media drivers is:

"return buffers with an error to userspace with V4L2_BUF_FLAG_ERROR set
in v4l2_buffer.flags".

It is not "drop invalid packages". The commit messages of patch 1/3
has some related unclear wording, please fix this.

Looking at this I actually have found what arguably is a bug in
the UVC driver when nodrop is set, or at least something which
we must change before making nodrop=1 the default.

Currently uvc_queue_buffer_complete() looks like this:

static void uvc_queue_buffer_complete(struct kref *ref)
{
        struct uvc_buffer *buf = container_of(ref, struct uvc_buffer, ref);
        struct vb2_buffer *vb = &buf->buf.vb2_buf;
        struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);

        if ((queue->flags & UVC_QUEUE_DROP_CORRUPTED) && buf->error) {
                uvc_queue_buffer_requeue(queue, buf);
                return;
        }

        buf->state = buf->error ? UVC_BUF_STATE_ERROR : UVC_BUF_STATE_DONE;
        vb2_set_plane_payload(&buf->buf.vb2_buf, 0, buf->bytesused);
        vb2_buffer_done(&buf->buf.vb2_buf, VB2_BUF_STATE_DONE);
}

Notice how the last line does not propagate buf->error to the
videobuf2 code, so when nodrop=1 is set then buffers with errors
are not only returned to userspace, they are returned to userspace
without V4L2_BUF_FLAG_ERROR getting set in v4l2_buffer.flags .

The right thing to do in this case is to set V4L2_BUF_FLAG_ERROR
IOW the last line of uvc_queue_buffer_complete() should be changed to:

        vb2_buffer_done(&buf->buf.vb2_buf, buf->error ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);

And this should probably be the first patch in a v2 series for this.

Regards,

Hans








