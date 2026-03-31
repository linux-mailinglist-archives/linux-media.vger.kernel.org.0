Return-Path: <linux-media+bounces-57744-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qH4VFP+Gy2kuIwYAu9opvQ
	(envelope-from <linux-media+bounces-57744-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:34:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CBB366342
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B9E1302EAAA
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3212C3E023E;
	Tue, 31 Mar 2026 08:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORhvAmSD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298F1175A71
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 08:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774945832; cv=pass; b=S4DLJybiNXG20I/QBguW+64DJpzC3WBxK3haWD3xI6C/s1BKcXAoZ1vV1OE426ykYVBUdoFXe3w7EQ0Mp4wKkm/ApiywLrvYrvWPsyNrRdjntSShhGpI1wT8ydwhkt0T9l3vZTFa1meTuOPX+HYnXR4axAzFv9916+odvCfu0zE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774945832; c=relaxed/simple;
	bh=G1Pwokd+IsNEuDrIXMcYN+6Kadk3HgIFlmoAcABbAZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vj2ZEILEg5yg6VZlZpwCvD11Mdnhxm/5TGWa5VVrIW9hJV9iiSu/O4kHEGOIZRC/35wqGcCy3AkcXEIG7+i5yiz77O0rTB1CPbQLxLuED5QN5mONRZl9mov1ubTmYXJGykA9tDXkm/Z8Xx17fOQYu45MYY0QM9OHYHYO/QvO/ZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORhvAmSD; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d03db7f87so884331f8f.3
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 01:30:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774945829; cv=none;
        d=google.com; s=arc-20240605;
        b=K2Wu+EWI5RsWjFJL4JBotyFrS1LlO02m24+x70og8Ie4pQl9Q3r6YTNeml43Na/vLx
         jaB67EPRtouKmakmzT33dQWVnrVn++bbeU8M+QdiciUNwKh71sPZx5MF9W2EkN/8LQLc
         IF3oYbEy6mVXfBAIeXZqsLwjfycfF3v4AbB106kA8GfIKnv3qBbI53VZedKcKXrhOcYt
         DU622oNPB2i5kWNn537VUbh+srO0gMAXb7Fld9vFVIysgbpabTs2ph6xG2HihMIKE3L7
         rnbbdoKasl9RiC7xP0ICmSHW9MsF02+sTJlybh/CXnXshCq5PlhObDULW2+F9HnqdGlj
         tvYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zl9n5j1xbJGPBg3cLJnWvIHK+QEejvKcNtwZ1exKM40=;
        fh=R5Lu2IzUs77HU0u0fupsNOwmIwQM4gOx3fthnQPkfng=;
        b=UCLz2bwoFQqSXQCAUfFNWW7BSRP8IFOX8wyzjCqoO88v8LJo4FTer8aT/LMXcSqiOF
         N8/h71cDDfEmwHEBYLDyUhgZgYhsJoYy1tUzesZe/hNU/YlD2a7jRPhmGj+9BVYLWsfh
         BJTT7VFCcBMgavP0ASFzLhhz2HHCS2NAZvHW3EXMUsX4JlyKFinImOOJeg5bRSG1xXmm
         LjPp+VaXBBX2WifIgIoGclno31zn9Ao5UjXxLYCNtZKJWHZa3RFUE7E4VZDJC52iI09d
         nJMGcgNd5NL+fm+judHfJCygdlFjOLCjg0RhtBfCFPhLcvnQqB/m5HvTe3dYM42jRZjR
         TaLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774945829; x=1775550629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zl9n5j1xbJGPBg3cLJnWvIHK+QEejvKcNtwZ1exKM40=;
        b=ORhvAmSDeXb6b51m+YynU6VOYl3itU8AeBxN5/YOVgoRmLbgt/KGrmzdcsWFR92ro7
         p5BQNrk6Q76hbQSOc+4ARJqlMaojY+C6uMXjMpgY7hK74dFej92QKHj9M+O2N06pY+yC
         QtMUJnqH0UaQuexpAxDwkNRipmMq4SYcJU9IUmpsUks4WOca7/ygD7kaY40xo+wHl8ss
         Nns6freUkXMuo3OAAvSQowbFq2OqMx4uIAHxHtgOVaa9wclIR0bcSE4yzY+iH6a5dOJz
         bZngggTjP6z2e7l8DHmoTKXtZghTt0sRs8MbC+qVAGIETW2OrVeasi3yDGVEyOwkeETK
         S70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945829; x=1775550629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zl9n5j1xbJGPBg3cLJnWvIHK+QEejvKcNtwZ1exKM40=;
        b=o6+B+H/ccNiCW4fa+MXj3pyrXawwu06wZWTzqqmcH83AiK2cCPeKJb+F1MHC+67joe
         Rt0SLS5q8N9KkM68wW3YiJu1SzCTaVK6Oj0bvovSeA4FsC4Ai2ptcnQAvgrlb4jSrCW+
         SF6DAll4PpVGZ8xyHx7gzc+EFgIYioj0uLG6gzrEtzeVFpENATWRHdTPJJSGWGHT0Jrf
         qmiKR/CyN6wDm71QVL+/GUjyqI4j2k9UxbHiBVv9SYKV35TQoD/O5a6T9INVn22LfbKa
         3k6InIyC6jcw1W2wQB8rzZ20EGta8tiwt8hlVPOmauZF+89K5Qpai55xIRJO1MnvP3EU
         BDfA==
X-Forwarded-Encrypted: i=1; AJvYcCWOAfa5h9ks94hupCxG2yv6WMXCMMLpGl3FQ1JpcXgRjZinqtDQTc/Qeur6dAb9CB/xc+Eb+3nhkabxTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrJG0Xtub1iMBgH61f0MvYMFnHcgE7U7Fn7qAlALBPz+vK/U86
	HtgsZys4O7QirAwu/ckfD/I1RSCzvY1ZRcdrN51zu0jBR1914RwHQRQ8XSmYmuQdKszpYb8dGrw
	oftG3mMEcoCccbu6q4eipm86NgNmYL8M=
X-Gm-Gg: ATEYQzx+57lXqL8ZGRE/aGFeSfBHoWlnbegUi8N7aOU4mNMgoh1nSscPiQK9o1nhFJd
	8/HBR7gx+EZaOXjXV4BTUob9zlUmKDPf7n/6P9qTG3+c8TRtdI4tz6rKZ03BclNmg52DVK9MNEZ
	EG8EHkEfB3qePnAuc6Uyqd5GpuCBqBGxGvjfMu+uZLHoStkUJH+1x9jYcsfdnvZLgnmGBd4doPl
	+vzg8FcYJqVlFzsLPVURWLU/2uF+4vVPEhW0aOh2indhKOSOsy8Xd/B3/i7mXSaLeCfvm+bpuO7
	7wS3VuFF8qCYnir4yuYLpVnfpMLzi6x0rDrHixbOMOwnIm7MLiMfukKZg0gVUEPQVncKIQ==
X-Received: by 2002:a05:6000:2312:b0:43b:851c:4483 with SMTP id
 ffacd0b85a97d-43b9e9d5ae7mr26547497f8f.4.1774945829317; Tue, 31 Mar 2026
 01:30:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com> <20260327-b4-cru-rework-v1-10-3b7d0430f538@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-10-3b7d0430f538@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 31 Mar 2026 09:30:02 +0100
X-Gm-Features: AQROBzBRYH3wkSHEUhOar64wMI5Uen9fBcSn0gLJh07adZPOJDwWUwgMg9xGpF8
Message-ID: <CA+V-a8vsxUtw4__mrNFWg+BJxKcomzgs4pMwWo=2rhip+zZ2ZA@mail.gmail.com>
Subject: Re: [PATCH 10/14] media: rzg2l-cru: Manually track active slot number
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57744-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,bp.renesas.com,linux.intel.com,protonmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: C4CBB366342
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

Thank you for the patch.

On Fri, Mar 27, 2026 at 5:27=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
>
> The CRU cycles over the hardware slots where the destination address for
> the next frame has to be programmed.
>
> The RZ/G2L version of the IP has a register that tells which is the
> last used slot by the hardware but, unfortunately, such register is not
> available on RZ/G3E and RZ/V2H(P).
>
> The driver currently compares the value of the AMnMADRSL/H register
> which report "the memory address which the current video data was
> written to" and compares it with the address programmed in the slots.
>
> This heuristic requires a bit of book keeping and proper locking. As the
> driver handles the FrameEnd interrupt, it's way easier to keep track
> of the slot that has been used by ourselves with a driver variable.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  7 +++--
>  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 35 ++++------------=
------
>  2 files changed, 10 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drive=
rs/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index b46696a0012b..bc66b0c8c15e 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -108,6 +108,7 @@ struct rzg2l_cru_info {
>   * @vdev:              V4L2 video device associated with CRU
>   * @v4l2_dev:          V4L2 device
>   * @num_buf:           Holds the current number of buffers enabled
> + *
stray change.

>   * @svc_channel:       SVC0/1/2/3 to use for RZ/G3E
>   * @notifier:          V4L2 asynchronous subdevs notifier
>   *
> @@ -117,9 +118,10 @@ struct rzg2l_cru_info {
>   * @mdev_lock:         protects the count, notifier and csi members
>   * @pad:               media pad for the video device entity
>   *
> - * @hw_lock:           protects the slot counter, hardware programming o=
f
> - *                     slot addresses and the @buf_addr[] list
> + * @hw_lock:           protects the @active_slot counter, hardware progr=
amming
> + *                     of slot addresses and the @buf_addr[] list
>   * @buf_addr:          Memory addresses where current video data is writ=
ten
> + * @active_slot:       The slot in use
>   *
>   * @lock:              protects @queue
>   * @queue:             vb2 buffers queue
> @@ -160,6 +162,7 @@ struct rzg2l_cru_dev {
>
>         spinlock_t hw_lock;
>         dma_addr_t buf_addr[RZG2L_CRU_HW_BUFFER_DEFAULT];
> +       unsigned int active_slot;
>
>         struct mutex lock;
>         struct vb2_queue queue;
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 9406a089ec9f..17e0153052e1 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -637,31 +637,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>         return IRQ_RETVAL(handled);
>  }
>
> -static int rzg3e_cru_get_current_slot(struct rzg2l_cru_dev *cru)
> -{
> -       u64 amnmadrs;
> -       int slot;
> -
> -       /*
> -        * When AMnMADRSL is read, AMnMADRSH of the higher-order
> -        * address also latches the address.
> -        *
> -        * AMnMADRSH must be read after AMnMADRSL has been read.
> -        */
> -       amnmadrs =3D rzg2l_cru_read(cru, AMnMADRSL);
> -       amnmadrs |=3D (u64)rzg2l_cru_read(cru, AMnMADRSH) << 32;
> -
> -       /* Ensure amnmadrs is within this buffer range */
> -       for (slot =3D 0; slot < cru->num_buf; slot++) {
> -               if (amnmadrs >=3D cru->buf_addr[slot] &&
> -                   amnmadrs < cru->buf_addr[slot] + cru->format.sizeimag=
e)
> -                       return slot;
> -       }
> -
> -       dev_err(cru->dev, "Invalid MB address 0x%llx (out of range)\n", a=
mnmadrs);
> -       return -EINVAL;
> -}
> -
>  irqreturn_t rzg3e_cru_irq(int irq, void *data)
>  {
>         struct rzg2l_cru_dev *cru =3D data;
> @@ -693,9 +668,8 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>                 return IRQ_HANDLED;
>         }
>
> -       slot =3D rzg3e_cru_get_current_slot(cru);
> -       if (slot < 0)
> -               return IRQ_HANDLED;
> +       slot =3D cru->active_slot;
> +       cru->active_slot =3D (cru->active_slot + 1) % cru->num_buf;
>
>         dev_dbg(cru->dev, "Current written slot: %d\n", slot);
>         cru->buf_addr[slot] =3D 0;
> @@ -762,6 +736,9 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_qu=
eue *vq, unsigned int count
>                 goto assert_aresetn;
>         }
>
> +       cru->active_slot =3D 0;
> +       cru->sequence =3D 0;
> +
>         /* Allocate scratch buffer */
>         cru->scratch =3D dma_alloc_coherent(cru->dev, cru->format.sizeima=
ge,
>                                           &cru->scratch_phys, GFP_KERNEL)=
;
> @@ -772,8 +749,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_qu=
eue *vq, unsigned int count
>                 goto assert_presetn;
>         }
>
> -       cru->sequence =3D 0;
> -
Maybe we can move cru->active_slot assignment here and keep
cru->sequence assignment as is. With that fixed,

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>         ret =3D rzg2l_cru_set_stream(cru, 1);
>         if (ret) {
>                 return_unused_buffers(cru, VB2_BUF_STATE_QUEUED);
>
> --
> 2.53.0
>
>

