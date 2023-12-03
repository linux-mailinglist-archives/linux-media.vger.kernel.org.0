Return-Path: <linux-media+bounces-1508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1B7802559
	for <lists+linux-media@lfdr.de>; Sun,  3 Dec 2023 17:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11789280E04
	for <lists+linux-media@lfdr.de>; Sun,  3 Dec 2023 16:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7257015AC8;
	Sun,  3 Dec 2023 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="SyLQnzd2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C843AB6
	for <linux-media@vger.kernel.org>; Sun,  3 Dec 2023 08:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=GtjvlowD4clEU/GY/DczAXjR86cG0CYDXUccAvsvfLc=; b=SyLQnzd2efj6snRBbqBTAr7L89
	M75v/jiBSw5J0/magbgHXMoU1yPT4uWcqFCS7OPXYjsHYSbYsRkDfvGUxovMDG8XTciZnJQ9XjWJh
	cn42rLRb8CZpeCm2hwPDgpcbA6wvzNfwL2LHQvUGUH7J+u4vR8mg+0Er4R08QZKtrBcJPUdFbBWxv
	JPhW7QPpeBBGGqpe3AFaQeFJXodHTAkVTWzPeh5rjZ/1jPKGhJq1VcLptJvvTcMUidjl/SA9A2C/k
	GHCU1TsEWU3d4/+yGN/ewebB19UTg8SeXaW91GIYcoJHd9pfnDma1BLZ04ygAYDV7k3w5tT/ozyeN
	P2uyRUfA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1r9p9w-00C0xp-04;
	Sun, 03 Dec 2023 16:17:32 +0000
Date: Sun, 3 Dec 2023 16:17:31 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, a.j.buxton@gmail.com
Cc: linux-media@vger.kernel.org,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: Re: [PATCH 2/3] media: bttv: add back vbi hack
Message-ID: <ZWyqG2XEYrYUB7X_@gallifrey>
References: <cover.1701349092.git.hverkuil-cisco@xs4all.nl>
 <16f3b2a896e2a3788e8e33ab7a0e55cbad4bbd81.1701349092.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <16f3b2a896e2a3788e8e33ab7a0e55cbad4bbd81.1701349092.git.hverkuil-cisco@xs4all.nl>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-12-amd64 (x86_64)
X-Uptime: 16:16:43 up 78 days, 19:15,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Hans Verkuil (hverkuil-cisco@xs4all.nl) wrote:
> The old (now removed) videobuf framework had an optional vbi hack where
> the sequence number of the frame counter was copied in the last 4 bytes
> of the buffer. This hack was active only for the read() interface
> (so not for streaming I/O), and it was enabled by bttv. This allowed
> applications that used read() for the VBI data to match it with the
> corresponding video frame.
> 
> When bttv was converted to vb2 this hack was forgotten, but some old
> applications rely on this.
> 
> So add this back, but this time in the bttv driver rather than in the
> vb2 framework.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Fixes: b7ec3212a73a ("media: bttv: convert to vb2")

Thanks; this seems to fix the sequence number errors I was getting,
so:
Tested-by: Dr. David Alan Gilbert <dave@treblig.org>

> ---
>  drivers/media/pci/bt8xx/bttv-driver.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
> index 8e8c9dada67a..49a3dd70ec0f 100644
> --- a/drivers/media/pci/bt8xx/bttv-driver.c
> +++ b/drivers/media/pci/bt8xx/bttv-driver.c
> @@ -2772,6 +2772,27 @@ bttv_irq_wakeup_vbi(struct bttv *btv, struct bttv_buffer *wakeup,
>  		return;
>  	wakeup->vbuf.vb2_buf.timestamp = ktime_get_ns();
>  	wakeup->vbuf.sequence = btv->field_count >> 1;
> +
> +	/*
> +	 * Ugly hack for backwards compatibility.
> +	 * Some applications expect that the last 4 bytes of
> +	 * the VBI data contains the sequence number.
> +	 *
> +	 * This makes it possible to associate the VBI data
> +	 * with the video frame if you use read() to get the
> +	 * VBI data.
> +	 */
> +	if (vb2_fileio_is_active(wakeup->vbuf.vb2_buf.vb2_queue)) {
> +		u32 *vaddr = vb2_plane_vaddr(&wakeup->vbuf.vb2_buf, 0);
> +		unsigned long size =
> +			vb2_get_plane_payload(&wakeup->vbuf.vb2_buf, 0) / 4;
> +
> +		if (vaddr && size) {
> +			vaddr += size - 1;
> +			*vaddr = wakeup->vbuf.sequence;
> +		}
> +	}
> +
>  	vb2_buffer_done(&wakeup->vbuf.vb2_buf, state);
>  	if (btv->field_count == 0)
>  		btor(BT848_INT_VSYNC, BT848_INT_MASK);
> -- 
> 2.42.0
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

