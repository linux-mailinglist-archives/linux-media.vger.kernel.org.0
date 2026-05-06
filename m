Return-Path: <linux-media+bounces-60685-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uL4eOPKZ+2ladAMAu9opvQ
	(envelope-from <linux-media+bounces-60685-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 21:43:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 421414DFEA0
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 21:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 751FE300D680
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 19:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838CF33A9EB;
	Wed,  6 May 2026 19:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxyQ8ul7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852793382E1
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 19:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778096611; cv=pass; b=WnO9NvaxPkcIM0Buy4d7fCyAiFUZWxcf4+zMDlZLkhKltCWZlVBjIUy3hLRt2KVQXDh7fcRBTuqG9LurB62wPxLKzeQYvvKjNriUGoks0bvfO4i/1UwgdGVSAbEBm6SmJ07PKr8XOmQz04/tkhfgcT/V3G3gj3iNX4HJ4yIlvrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778096611; c=relaxed/simple;
	bh=sqJSnp/sX7Rq3UjHLW8TEuJoblgN/EXxD5RKe4wOr2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i/0jebfzKHAqXWNlH8tj/rdAb4dD/Wsqvhl1IC35YSyuc7xs4wY8z1HYAgPF+a1G+1V0Fv4Jtydhkjo7ihrWd6Fq87XRxuuT8bEyBKSnO+u25Ya6QpNRFKpGqjns2xDzBloKai6TzZCWCoVjH2kiEzdjVTwqtlmEmcxx7rvwKmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxyQ8ul7; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c1a170a50so207178c88.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 12:43:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778096609; cv=none;
        d=google.com; s=arc-20240605;
        b=cLy4qrLyEcfB6NXUF9C6KDLUqm4ai6BFEsgXahkwxGNQYLgbJmrIracGFi3IMtv/QF
         KVvLFZiMi3nGbtYsfOGPs35SqJSxYdaMZGv6lhKSZs8GKY1OVr0M0K7FiXbpaRIClcXx
         ShcLnaeRbp2dGGkNDnp7XE5Rg5b5PlBuzIZHEkUBDhj/AElU85nO9US2K71zWIDcxWTd
         /kVk2oCSnPmJgdH/RUMCH+X/pSUbVUkOjVvGXhIzDaDZTJj2v4TzzapX6qj+09V3i45r
         GkGbBdbfI5rTd2Ycv46ejAMZ9I6xdxnd2i5sWHeiND0WMe4OZDmv6DlyNOPjz3U4nGCa
         Fe/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MuHFNKvfE6wNUvGd/ClozyOcPPh4YWsvczy9otsc/KI=;
        fh=mP/7dyiqepcZjepqwJFWH/ELp6oXhPGDrijlVOuhpCA=;
        b=e6iqiAfLbNtfWdbZG6P/CJFLALk2ElKO4ahulblhwErktQ2lA9mwTHptuqm3wwrXyf
         LOHWfHD1iElXZo4rl7/k0vGzwtmZMMOWHldQbBa0mpjkOdI9WwwnH6usj8xPRMYFf+/b
         R2kzzAeqLoIzUCPr07idUqb7+BtX9u0Pu3hvNVa5jF4dyyiInyqv/YttWa5MG6QXWukD
         6ym2fZHpfKnLkYNO9KMzWRgzzviDLCQD5Uo/H0V1YqeeuUQKYzKzVhc/EtPhu7/jW2RI
         T4Hkm175tVzk3CVcHU8/psyoqUGLqv/C01AMR+m+6jVLO37PxHg0jZ1XT9cNnhXQzuvJ
         DVeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778096609; x=1778701409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuHFNKvfE6wNUvGd/ClozyOcPPh4YWsvczy9otsc/KI=;
        b=AxyQ8ul7iUR/e9ygu/dREk88kPkLdYyalbueOg3p4GK8olbwN1DRqgc8Vw8dyovDqH
         8wgI0e3OJrpN3yyc9HsRHT1xXayZj2RLklKXvBYn/eESBjOJar2/npSkZq/HJXmQd1Vx
         P+3+jnmYnzCzJ9WBklxbtLNIQffqMo9l9VXi0V/LhZD3epZHXH/K/HipuMpq/biy7Dr/
         x1T90FNsLP5R1fLYeniHMclmasjkT0sIcqknmp7tDRwVXmszg4oXE94upg6bL9uoWSU1
         Tdg1+CPM+QCCMEEfzvBuniXFVXRm/0/xysKqXIuNMhoKSVa2sn6k8Q6mNUUvR9boFDXe
         h+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778096609; x=1778701409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MuHFNKvfE6wNUvGd/ClozyOcPPh4YWsvczy9otsc/KI=;
        b=quq9ixnJBbiZbeuWoXV9mKbLjY0Rl5Woi3ulDiRj0pY8jWFDJnjSQPh+Dezmjj+pYn
         aWLcKi4GaazHjPl2u4d97wa/QdOYWfHIosfqZyAM+sYAKN0bQKBMsk3xGtusSXIQfrZ4
         4Wi27fHPUsfj/x75FTAXbhBkYBa9kL3nrbf/PLrHLI5AfLdkm/kcDj6MjsNxx4FoKUx0
         ze5la7PQIg2A3Tn0rZNfy3nCkMgCt0LNLavfmraQNHan3xe1xTNHF0kpFgaAeDfi9Ycy
         MJ0Ly5LPMSLgWrQ0z7ZV0LsQ/dC9FVZgghjzpYLJQW0G89h4LLsdEsVCC5PW0RMJzzPZ
         x2Yw==
X-Gm-Message-State: AOJu0YxbnEbDABuEbrQKZMrg7SmIbdjPRuC8KZtITbHyne7GdIk8+318
	OxMpIWzSD6cPzZUIf7hlPKnXnSjOd1tgK6Orgbhoem5wHiXILp1vF5OVBGAv9Xnl+3GpSUOHOzJ
	ECOHVRZfpJ354kzgsiJj69Yq0f64PbVU=
X-Gm-Gg: AeBDiespdUf3Ry/EDSQH6YuMdClPyUcXK1rYPIIonIn9iVk987GwzmWkLkizajNfYIv
	3LsHdZPyZ6aZkgOM7BMogSon9vYiGev4dwZvHacZBAMVKG+NIUon/Vk6mGGBPZDx1dKrNzDxfg+
	bxwbHxoKVlT8YcFDOUhoOlY1wUzfr2/xvFKm5TLH2NNrVML5KbpcGuFIH2NRy2LXuP3EFg0uV4I
	RAxdl+Iz+pliAO0NEXgjjX+z/qn1OT93fTcYNE7XvVc7I0VoMVm12kxYWt0szomshoBIQp7H9i1
	BKBMWVU3nx36iqKF
X-Received: by 2002:a05:7022:f102:b0:12d:b396:eaed with SMTP id
 a92af1059eb24-131967d523fmr2164571c88.9.1778096608512; Wed, 06 May 2026
 12:43:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330233636.381969-1-hoff.benjamin.k@gmail.com>
 <20260403135709.46163-1-hoff.benjamin.k@gmail.com> <336b8ec9-f3e3-4850-9261-752392a898ac@kernel.org>
In-Reply-To: <336b8ec9-f3e3-4850-9261-752392a898ac@kernel.org>
From: Ben Hoff <hoff.benjamin.k@gmail.com>
Date: Wed, 6 May 2026 15:43:16 -0400
X-Gm-Features: AVHnY4Img10zZRVks5u1PAOYk4FvfrRtZ1-qXmx0M3CPoMHYUAKaYSjZakK3fMY
Message-ID: <CAMSzxxSt5JsV3_4V-R=zQc3Zck-3u8MiJgKq6fmFWm26kp+6Jg@mail.gmail.com>
Subject: Re: [PATCH v5] media: pci: add AVMatrix HWS capture driver
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mchehab@kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 421414DFEA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-60685-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]

Hi Hans,

Thanks for the review.

I posted an updated version here:

https://patchwork.linuxtv.org/project/linux-media/patch/20260506192618.3538=
4-1-hoff.benjamin.k@gmail.com/
This version removes the unnecessary `(void)` casts and fixes
the`sizeimage` handling in `queue_setup()`.

`queue_setup()` no longer tries to rebuild `vid->pix.sizeimage` on the
fly. The driver initializes the default format state during channel
setup, and format/timing changes update `vid->pix.sizeimage` through
`hws_calc_sizeimage()` before the queue is used.

I also removed the inconsistent `PAGE_ALIGN()` handling from
`queue_setup()`. The requested plane size is now checked against
`vid->pix.sizeimage`, and new buffers are sized to that same logical
V4L2 `sizeimage` value. If the hardware path later needs additional
padding, then that should be reflected in `pix.sizeimage` itself. This
behavior is consistent with the original driver.

Not sure where that crept in, but I had multiple allocation paths in
this driver at one point that I consolidated down for ease of
maintaining, so guessing during that shuffle.

Finally, `alloc_sizeimage` was only used as a debug/accounting value,
so I removed it entirely.

Thanks again for catching this.

Best,
Ben

On Tue, May 5, 2026 at 6:37=E2=80=AFAM Hans Verkuil <hverkuil+cisco@kernel.=
org> wrote:
>
> Hi Ben,
>
> While reviewing v5 I discovered some issues, one of them (sizeimage handl=
ing)
> important enough to warrant a v6.
>
> On 4/3/26 15:57, hoff.benjamin.k@gmail.com wrote:
> > From: Ben Hoff <hoff.benjamin.k@gmail.com>
> >
> > Add an in-tree AVMatrix HWS PCIe capture driver. The driver supports
> > up to four HDMI inputs and exposes the video capture path through
> > V4L2 with vb2-dma-contig streaming, DV timings, and per-input
> > controls. Audio support is intentionally omitted from this
> > submission.
> >
> > This patch also adds the MAINTAINERS entry for the new driver.
> >
> > This driver is derived from a GPL out-of-tree driver.
> >
> > Changes since v4:
> > - replace plain 64-bit elapsed-time divisions in debug logging with
> >   div_u64() so i386 module builds do not emit __udivdi3 references
> >
> > Changes since v3:
> > - fold the MAINTAINERS update into this patch so per-patch CI sees the
> >   new file pattern
> > - wrap the validation text for checkpatch
> >
> > Changes since v2:
> > - keep scratch DMA allocation on a single probe-owned path
> > - avoid double-freeing V4L2 control handlers on register unwind
> > - drop the extra per-node resolution sysfs ABI
> > - turn live geometry changes into explicit SOURCE_CHANGE renegotiation
> > - report live DV timings and reject attempts to retime a live source
> > - stop advertising RESOLUTION source changes for fps-only updates
> > - keep live fps state across harmless S_FMT restarts
> > - stop exposing an unvalidated DV RX power-present signal
> > - clean the imported sources for checkpatch and W=3D1 builds
> >
> > Validation:
> > - build-tested with W=3D1 against a local kernel build tree
> > - compiled the driver with ARCH=3Di386 allmodconfig and verified the
> >   resulting hws_pci.o, hws_video.o, and hws.o do not reference
> >   __udivdi3
> > - v4l2-compliance 1.32.0 on /dev/video1: 51 tests succeeded,
> >   0 failed, 1 warning
> >
> > DV_RX_POWER_PRESENT is intentionally left unsupported in this revision
> > because current hardware evidence does not expose a validated
> > receiver-side power-detect signal distinct from active video presence.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202604020522.z22eZuW8-lkp=
@intel.com/
> > Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
> > ---
> >  MAINTAINERS                            |    6 +
> >  drivers/media/pci/Kconfig              |    1 +
> >  drivers/media/pci/Makefile             |    1 +
> >  drivers/media/pci/hws/Kconfig          |   12 +
> >  drivers/media/pci/hws/Makefile         |    4 +
> >  drivers/media/pci/hws/hws.h            |  174 +++
> >  drivers/media/pci/hws/hws_irq.c        |  271 +++++
> >  drivers/media/pci/hws/hws_irq.h        |   10 +
> >  drivers/media/pci/hws/hws_pci.c        |  865 ++++++++++++++
> >  drivers/media/pci/hws/hws_reg.h        |  136 +++
> >  drivers/media/pci/hws/hws_v4l2_ioctl.c |  924 +++++++++++++++
> >  drivers/media/pci/hws/hws_v4l2_ioctl.h |   36 +
> >  drivers/media/pci/hws/hws_video.c      | 1506 ++++++++++++++++++++++++
> >  drivers/media/pci/hws/hws_video.h      |   29 +
> >  14 files changed, 3975 insertions(+)
> >  create mode 100644 drivers/media/pci/hws/Kconfig
> >  create mode 100644 drivers/media/pci/hws/Makefile
> >  create mode 100644 drivers/media/pci/hws/hws.h
> >  create mode 100644 drivers/media/pci/hws/hws_irq.c
> >  create mode 100644 drivers/media/pci/hws/hws_irq.h
> >  create mode 100644 drivers/media/pci/hws/hws_pci.c
> >  create mode 100644 drivers/media/pci/hws/hws_reg.h
> >  create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.c
> >  create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.h
> >  create mode 100644 drivers/media/pci/hws/hws_video.c
> >  create mode 100644 drivers/media/pci/hws/hws_video.h
> >
>
> <snip>
>
> > diff --git a/drivers/media/pci/hws/hws_v4l2_ioctl.c b/drivers/media/pci=
/hws/hws_v4l2_ioctl.c
> > new file mode 100644
> > index 000000000000..9c0826c0f9f9
> > --- /dev/null
> > +++ b/drivers/media/pci/hws/hws_v4l2_ioctl.c
> > @@ -0,0 +1,924 @@
>
> <snip>
>
> > +/* Query the *current detected* DV timings on the input.
> > + * If you have a real hardware detector, call it here; otherwise we
> > + * derive from the cached pix state and map to the closest supported D=
V mode.
> > + */
> > +int hws_vidioc_query_dv_timings(struct file *file, void *fh,
> > +                             struct v4l2_dv_timings *timings)
> > +{
> > +     struct hws_video *vid =3D video_drvdata(file);
> > +     u32 w, h;
> > +     u32 fps;
> > +     bool interlace;
> > +
> > +     if (!timings)
> > +             return -EINVAL;
> > +
> > +     w =3D vid->pix.width;
> > +     h =3D vid->pix.height;
> > +     interlace =3D vid->pix.interlaced;
> > +     (void)hws_get_live_dv_geometry(vid, &w, &h, &interlace);
>
> No need to cast to (void). I've seen it several times in this patch, just=
 drop it.
>
> > +     fps =3D hws_get_live_fps(vid);
> > +     if (!fps)
> > +             fps =3D vid->current_fps ? vid->current_fps :
> > +                   hws_pick_fps_from_mode(w, h, interlace);
> > +
> > +     return hws_fill_dv_timings(w, h, interlace, fps, timings);
> > +}
>
> <snip>
>
> > diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/=
hws_video.c
> > new file mode 100644
> > index 000000000000..9c81af6e7d7f
> > --- /dev/null
> > +++ b/drivers/media/pci/hws/hws_video.c
> > @@ -0,0 +1,1506 @@
>
> <snip>
>
> > +static int hws_queue_setup(struct vb2_queue *q, unsigned int *num_buff=
ers,
> > +                        unsigned int *nplanes, unsigned int sizes[],
> > +                        struct device *alloc_devs[])
> > +{
> > +     struct hws_video *vid =3D q->drv_priv;
> > +
> > +     (void)num_buffers;
> > +     (void)alloc_devs;
>
> This shouldn't be needed.
>
> > +
> > +     if (!vid->pix.sizeimage) {
>
> Why would this ever be 0? At probe time this should be set to something
> sane.
>
> > +             vid->pix.bytesperline =3D ALIGN(vid->pix.width * 2, 64);
>
> Apparently vid->pix.width/height are valid (non-0), so why would sizeimag=
e
> be 0? vid->pix should always have sane consistent data.
>
> > +             vid->pix.sizeimage =3D vid->pix.bytesperline * vid->pix.h=
eight;
> > +     }
> > +     if (*nplanes) {
> > +             if (sizes[0] < vid->pix.sizeimage)
>
> If PAGE_ALIGN is used below, then it should also be used here.
> This can cause memory overwrite if you pass a buffer with VIDIOC_CREATEBU=
F
> that is of size 'sizeimage' when it should be 'PAGE_ALIGN(sizeimage)'.
>
> > +                     return -EINVAL;
> > +     } else {
> > +             *nplanes =3D 1;
> > +             sizes[0] =3D PAGE_ALIGN(vid->pix.sizeimage);
>
> But if you need PAGE_ALIGN, why isn't vid->pix.sizeimage set with PAGE_AL=
IGN
> in the first place?
>
> > +     }
> > +
> > +     vid->alloc_sizeimage =3D PAGE_ALIGN(vid->pix.sizeimage);
>
> What is alloc_sizeimage used for? I see it used only in a v4l2_dbg messag=
e.
>
> > +     return 0;
> > +}
> Regards,
>
>         Hans

