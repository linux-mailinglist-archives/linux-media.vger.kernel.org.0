Return-Path: <linux-media+bounces-65418-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 46c6AM+nOWoxwAcAu9opvQ
	(envelope-from <linux-media+bounces-65418-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 23:23:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D7D6B2790
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 23:23:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=VqMJT8t9;
	dkim=pass header.d=redhat.com header.s=google header.b=RdnC5Qe8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65418-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65418-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF5F53023DBD
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 21:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9E5368D5C;
	Mon, 22 Jun 2026 21:23:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B723451A7
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 21:23:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782163401; cv=none; b=YuItUp72OtMRaJF8p3bYNnmOYCl0T9QkTWi/GhuSVwMz8q61IwZTHJsHpUw9OFI+kMbnJIRMjSXMdf4vPmx95tQWepK1GyD4qXYhus9XJ0/aZRmtlzpDxB+SEVmzKANByOdRZJf+yA/5dariCnHezQneWMXoXzWNYa/Gz0NJ7kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782163401; c=relaxed/simple;
	bh=o0uU4mhGXJZO9po7ce2COVrZwBAiTkDLdpFzVPA6lUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emWCn+rSJRV02hQr+5L55dxc1rbJzubzCl/4e4gEvcvFwIEJkIHzkosAnnA2d2OTkD5V7fOgXI6H/JCDu/nuiiEbZeinuvPA1dXQPh/z5ZNKc4LVCLdik2LMuaf6EdZF5Uvc3GCXyQe5q+lgGX9+D3VGOXQiL6bhiu4KCqLdVrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VqMJT8t9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RdnC5Qe8; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782163399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rQ9Ao83GRSB9E8noNCRoGI9ruhwPtjFd8I0Tg7tzcOY=;
	b=VqMJT8t9zSMy5q2jOYVvkZPdyNtEHPyWVIUFQ55Biw1PLFY6I7S9SKSCUtUmtwkdq9pNKo
	SUVQXXmhZnrTt8v5X6/sf6nDntyE5N6pfx4Ez9wCeLdeLBoIHndv9pnknpV53vflSgdt8o
	EUz3sXfs+Q1hnt5yDf/NUFONRI6FpVI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-oz2N4_yYM52UoKT6UAsAcA-1; Mon, 22 Jun 2026 17:23:18 -0400
X-MC-Unique: oz2N4_yYM52UoKT6UAsAcA-1
X-Mimecast-MFC-AGG-ID: oz2N4_yYM52UoKT6UAsAcA_1782163397
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4923411f041so39192135e9.2
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 14:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782163397; x=1782768197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rQ9Ao83GRSB9E8noNCRoGI9ruhwPtjFd8I0Tg7tzcOY=;
        b=RdnC5Qe8VmyQDitmKsAZGxNoQvCCZysUqQ68dQ82oiHlY4FsXGm3BzQvQLDuWjJkgT
         8yRXVY9q1rmBO5G5Ww77zEGg+TTjMMR/60QQNl7Il2CT8dj/4d1NaU8y25fV3/5u11A9
         CLniqmveWeWpF3UQ36gWJwHjT0WB9DVL4pzk2TwKhZzH+3Cjmx3wdD5DIjhd4o4y7EYz
         LZfQqeEkvHzayYmrCy/l7lS19quH03IBqMZQQyH3VBcuzf6Djx57qP5zFn6kSqYwZG8L
         HDIxesp0KmzsUAZcCcbWVZrglsYjDNFdodF4ItUKleHvbbJk/mxGV/QSxWoc6WMGBYhP
         vvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782163397; x=1782768197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQ9Ao83GRSB9E8noNCRoGI9ruhwPtjFd8I0Tg7tzcOY=;
        b=PdFOeAgQdx1GrOPY/jlegT+WA58trJlphTVRlmL/npKi4Fz2qiaVeYTwVvR7N8fxor
         36qXjsEtGxt7ntrC1X4s3VZmsvIp0fyxdfSmTdza8MYBps4PX2zraU5DIMIW1xyaBYAO
         AavOgJYh1DOiyHxiRylYZL+9dnrcQKwyheiAneJQt0y97KEtI6W5XxRtbOnJ9s6NZllI
         ghAmDTjPDRscoptr4iFyq0ZtnY6mzg+28P8sYsgYjnLStciZ3QOjh6vdomtrBdCmnRw/
         /Sqld7dvVH7p8cevl0y/y2d3/vbVJE71uQ/sHby6fpg7jjxF7PXAuwZ3BUknOqjphzh7
         1kUA==
X-Forwarded-Encrypted: i=1; AFNElJ/QtyXS49stfFGdpq6Ok0qFFsnruwuU3BNeD6QuryEzlBj0Y1TFKq/zeqOZLzr9s0Ox8lbpXj9pRgL5YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSnPC+SNSyspGbTApGbS461ZZ59AayX5BkrvxIBqfed81/TjTz
	UjvSwjj4RSSqyjhpPscIweoVucN/beL/NAGGWdgKHjJvM9VFhLwEChikuepWUw+yHdAdzVrQB3g
	78y+dq86y1551fcxI6k3Mgr2TriYjueuxFd4g8sijOdxkbslZzGX7JsYfXSzaLNM4
X-Gm-Gg: AfdE7cn5a82wFUfu49QEzXvHUisB9AJuMVTD+9EdTufoWiocPCJunyJHuMKayVypnB2
	WJrSeg3LawhCeptWknnwQ8yVK2hjJx0nJRANxwZ4AjZChE3tAFcuMb49zWc6HJsPKAiqjuzYrvv
	I0d/qi+a6j27TB0yAkNgKMWaUvdpu0ZL19imSf1Z1E3PcWK6UQNwGTiGjDv/MhmqqGHRX/EvqL2
	wSr47AYFTMlnoyStPqbwBU6mZJhZ70+kazBVOMKcRQm5YQRkIMpRWSxXW0JjQCpZsmytqjGQT2K
	b2yMJizP9Yfc/X048ia921LnS8/LSugQX1gYfeVAYUje26UeYUwaOljnA3gPMGXMvCk6jHh3+A1
	K7g2TSjBKLdULUpd4rSKgDy3vWaDtHsIz
X-Received: by 2002:a05:600c:8010:b0:490:bad9:de43 with SMTP id 5b1f17b1804b1-4923eeaca70mr262346865e9.0.1782163397069;
        Mon, 22 Jun 2026 14:23:17 -0700 (PDT)
X-Received: by 2002:a05:600c:8010:b0:490:bad9:de43 with SMTP id 5b1f17b1804b1-4923eeaca70mr262346615e9.0.1782163396611;
        Mon, 22 Jun 2026 14:23:16 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249455302sm242195865e9.15.2026.06.22.14.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 14:23:15 -0700 (PDT)
Date: Mon, 22 Jun 2026 17:23:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Brian Daniels <briandaniels@google.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, acourbot@google.com,
	adelva@google.com, aesteve@redhat.com, changyeon@google.com,
	daniel.almeida@collabora.com, eperezma@redhat.com, gnurou@gmail.com,
	gurchetansingh@google.com, hverkuil@xs4all.nl, jasowang@redhat.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	nicolas.dufresne@collabora.com, virtualization@lists.linux.dev,
	xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH v4 8/8] media: virtio: Add MAINTAINERS entry
Message-ID: <20260622172208-mutt-send-email-mst@kernel.org>
References: <20260622204343.1994418-1-briandaniels@google.com>
 <20260622204343.1994418-9-briandaniels@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622204343.1994418-9-briandaniels@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65418-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,google.com,redhat.com,collabora.com,gmail.com,xs4all.nl,vger.kernel.org,lists.linux.dev,linux.alibaba.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mst@redhat.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:briandaniels@google.com,m:mchehab@kernel.org,m:acourbot@google.com,m:adelva@google.com,m:aesteve@redhat.com,m:changyeon@google.com,m:daniel.almeida@collabora.com,m:eperezma@redhat.com,m:gnurou@gmail.com,m:gurchetansingh@google.com,m:hverkuil@xs4all.nl,m:jasowang@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:nicolas.dufresne@collabora.com,m:virtualization@lists.linux.dev,m:xuanzhuo@linux.alibaba.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mst@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85D7D6B2790

On Mon, Jun 22, 2026 at 04:43:43PM -0400, Brian Daniels wrote:
> From: Alexandre Courbot <gnurou@gmail.com>
> 
> Add an entry for the new virtio-media driver.
> 
> Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
> Co-developed-by: Brian Daniels <briandaniels@google.com>
> Signed-off-by: Brian Daniels <briandaniels@google.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index efbf80806..af370b787 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28327,6 +28327,12 @@ S:	Maintained
>  F:	drivers/iommu/virtio-iommu.c
>  F:	include/uapi/linux/virtio_iommu.h
>  
> +VIRTIO MEDIA DRIVER
> +M:	Brian Daniels <briandaniels@google.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	drivers/media/virtio/
> +

add to virtio core too pls.


>  VIRTIO MEM DRIVER
>  M:	David Hildenbrand <david@kernel.org>
>  L:	virtualization@lists.linux.dev
> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog


