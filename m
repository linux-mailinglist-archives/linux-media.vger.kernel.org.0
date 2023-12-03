Return-Path: <linux-media+bounces-1509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F6F80259F
	for <lists+linux-media@lfdr.de>; Sun,  3 Dec 2023 17:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4922C280E32
	for <lists+linux-media@lfdr.de>; Sun,  3 Dec 2023 16:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAA315AE4;
	Sun,  3 Dec 2023 16:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="NfbBxYC6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C3C1D9
	for <linux-media@vger.kernel.org>; Sun,  3 Dec 2023 08:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=AJkb4GVvtRjzkLLIIe/Ye571aABj7mhdVAX0XG+nPi4=; b=NfbBxYC6QxWBlAqcLEgMR9+Fid
	AUxSA/46XeninItxVejwhrvrZ24XFBMG8uYe83kSPiuNSiqwXAuj2uwPudz89ArpXepEJS+Z4D+to
	3a2hjxCOFgoKYwNuuqFTFvya0COarjg6ks5slbTH8O7/HucEIjHivRFtM19IkHElIxWs4pKhYw+X7
	nOAjq2FufTH1VUXUGQNMAaR88aWOjHArIZcAhjwig/OZQFe92v4Zic7L9Fd66KbwDVTQRCrJPrwOi
	ZxDQv+y/5PvsXTijq2SHoDEFqa2Kc0vBP0GaUH5QvtFzo0kv26QKvRlzCr0NwRf075m2N34VIIY1v
	DyA3ogAQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1r9pcE-00C16B-2H;
	Sun, 03 Dec 2023 16:46:46 +0000
Date: Sun, 3 Dec 2023 16:46:46 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, a.j.buxton@gmail.com
Cc: linux-media@vger.kernel.org,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: Re: [PATCH 3/3] media: videobuf2: request more buffers for vb2_read
Message-ID: <ZWyw9us9hvj9X4gF@gallifrey>
References: <cover.1701349092.git.hverkuil-cisco@xs4all.nl>
 <86ad4808718ff07ab8ac64b62170b789c16b2581.1701349092.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <86ad4808718ff07ab8ac64b62170b789c16b2581.1701349092.git.hverkuil-cisco@xs4all.nl>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-12-amd64 (x86_64)
X-Uptime: 16:44:51 up 78 days, 19:43,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Hans Verkuil (hverkuil-cisco@xs4all.nl) wrote:
> The vb2 read support requests 1 buffer, leaving it to the driver
> to increase this number to something that works.
> 
> Unfortunately, drivers do not deal with this reliably, and in fact
> this caused problems for the bttv driver and reading from /dev/vbiX,
> causing every other VBI frame to be all 0.
> 
> Instead, request as the number of buffers whatever is the maximum of
> 2 and q->min_buffers_needed+1.
> 
> In order to start streaming you need at least q->min_buffers_needed
> queued buffers, so add 1 buffer for processing. And if that field
> is 0, then choose 2 (again, one buffer is being filled while the
> other one is being processed).
> 
> This certainly makes more sense than requesting just 1 buffer, and
> the VBI bttv support is now working again.
> 
> It turns out that the old videobuf1 behavior of bttv was to allocate
> 8 (video) and 4 (vbi) buffers when used with read(). After the vb2
> conversion that changed to 2 for both. With this patch it is 3, which
> is really all you need.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Fixes: b7ec3212a73a ("media: bttv: convert to vb2")

This looks like it's working nicely;  I've tested it with both
Alistair's test stream and a real signal, and I'm getting
a consistent 25fps out of the VBI with or without xawtv
grabbing, and the test stream looks good to me.

So,

Tested-by: Dr. David Alan Gilbert <dave@treblig.org>

Thanks for fixing this!

Dave

> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 8c1df829745b..40d89f29fa33 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2735,9 +2735,14 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
>  		return -EBUSY;
>  
>  	/*
> -	 * Start with count 1, driver can increase it in queue_setup()
> +	 * Start with q->min_buffers_needed + 1, driver can increase it in
> +	 * queue_setup()
> +	 *
> +	 * 'min_buffers_needed' buffers need to be queued up before you
> +	 * can start streaming, plus 1 for userspace (or in this case,
> +	 * kernelspace) processing.
>  	 */
> -	count = 1;
> +	count = max(2, q->min_buffers_needed + 1);
>  
>  	dprintk(q, 3, "setting up file io: mode %s, count %d, read_once %d, write_immediately %d\n",
>  		(read) ? "read" : "write", count, q->fileio_read_once,
> -- 
> 2.42.0
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

